@implementation ABServerSearchPredicate

- (ABServerSearchPredicate)initWithSearchString:(id)a3 source:(void *)a4 account:(id)a5 includeSourceInResults:(BOOL)a6 includePhotosInResults:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  ABServerSearchPredicate *v12;
  ABServerSearchPredicate *v13;
  objc_super v15;

  v7 = a7;
  v8 = a6;
  v15.receiver = self;
  v15.super_class = (Class)ABServerSearchPredicate;
  v12 = -[ABPredicate init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    -[ABServerSearchPredicate setSearchString:](v12, "setSearchString:", a3);
    -[ABServerSearchPredicate setSource:](v13, "setSource:", a4);
    -[ABServerSearchPredicate setAccountIdentifier:](v13, "setAccountIdentifier:", a5);
    -[ABServerSearchPredicate setIncludeSourceInResults:](v13, "setIncludeSourceInResults:", v8);
    -[ABServerSearchPredicate setIncludePhotosInResults:](v13, "setIncludePhotosInResults:", v7);
  }
  return v13;
}

- (ABServerSearchPredicate)initWithSearchString:(id)a3 source:(void *)a4 account:(id)a5 includeSourceInResults:(BOOL)a6
{
  return -[ABServerSearchPredicate initWithSearchString:source:account:includeSourceInResults:includePhotosInResults:](self, "initWithSearchString:source:account:includeSourceInResults:includePhotosInResults:", a3, a4, a5, a6, 1);
}

- (ABServerSearchPredicate)initWithSearchString:(id)a3 source:(void *)a4 account:(id)a5
{
  return -[ABServerSearchPredicate initWithSearchString:source:account:includeSourceInResults:](self, "initWithSearchString:source:account:includeSourceInResults:", a3, a4, a5, 0);
}

- (void)dealloc
{
  void *source;
  objc_super v4;

  source = self->_source;
  if (source)
    CFRelease(source);

  v4.receiver = self;
  v4.super_class = (Class)ABServerSearchPredicate;
  -[ABPredicate dealloc](&v4, sel_dealloc);
}

- (void)setSource:(void *)a3
{
  void *source;

  source = self->_source;
  if (source != a3)
  {
    if (source)
      CFRelease(source);
    self->_source = (void *)CFRetain(a3);
  }
}

- (void)source
{
  return self->_source;
}

- (int)error
{
  return self->_error;
}

- (void)setConnection:(id)a3
{
  DADConnection *connection;

  connection = self->_connection;
  if (connection != a3)
  {

    self->_connection = (DADConnection *)a3;
  }
}

- (DADConnection)connection
{
  DADConnection *result;

  result = self->_connection;
  if (!result)
  {
    result = (DADConnection *)(id)objc_msgSend(MEMORY[0x1E0D1C3F8], "sharedConnection");
    self->_connection = result;
  }
  return result;
}

- (void)runPredicate
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (!-[ABServerSearchPredicate delegate](self, "delegate")
    || -[ABPredicateDelegate predicateShouldContinue:](-[ABServerSearchPredicate delegate](self, "delegate"), "predicateShouldContinue:", self))
  {
    if (-[ABServerSearchPredicate source](self, "source"))
    {
      v3 = -[ABServerSearchPredicate source](self, "source");
      v4 = (void *)ABRecordCopyValue(v3, kABSourceExternalIdentifierProperty);
      v5 = -[ABServerSearchPredicate source](self, "source");
      v6 = (id)ABRecordCopyValue(v5, kABSourceExternalModificationTagProperty);
    }
    else
    {
      v6 = 0;
      v4 = 0;
    }
    self->_doneLock = (NSConditionLock *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3538]), "initWithCondition:", 0);
    self->_searchQuery = (DAContactsSearchQuery *)(id)objc_msgSend(MEMORY[0x1E0D1C3F0], "contactsSearchQueryWithSearchString:searchBase:searchScope:consumer:", -[ABServerSearchPredicate searchString](self, "searchString"), v4, v6, self);
    -[DAContactsSearchQuery setIncludePhotos:](self->_searchQuery, "setIncludePhotos:", -[ABServerSearchPredicate includePhotosInResults](self, "includePhotosInResults"));
    if (-[DADConnection performServerContactsSearch:forAccountWithID:](-[ABServerSearchPredicate connection](self, "connection"), "performServerContactsSearch:forAccountWithID:", self->_searchQuery, -[ABServerSearchPredicate accountIdentifier](self, "accountIdentifier")))
    {
      -[NSConditionLock lockWhenCondition:](self->_doneLock, "lockWhenCondition:", 1);
      -[NSConditionLock unlock](self->_doneLock, "unlock");
    }
    else
    {
      self->_error = -[ABServerSearchPredicate _errorForDAStatusCode:](self, "_errorForDAStatusCode:", 0);
    }

  }
}

- (void)runPredicateWithDelegate:(id)a3
{
  -[ABServerSearchPredicate setDelegate:](self, "setDelegate:", a3);
  -[ABServerSearchPredicate runPredicate](self, "runPredicate");
}

- (void)ab_runPredicateWithSortOrder:(unsigned int)a3 ranked:(BOOL)a4 inAddressBook:(void *)a5 withDelegate:(id)a6
{
  -[ABServerSearchPredicate runPredicateWithDelegate:](self, "runPredicateWithDelegate:", a6, a4, a5);
}

- (int)_errorForDAStatusCode:(int64_t)a3
{
  int v3;

  if (a3)
    v3 = -2;
  else
    v3 = -1;
  if (a3 == 2)
    return 0;
  else
    return v3;
}

- (void)_searchQueryIsDone
{
  if (!-[NSConditionLock condition](self->_doneLock, "condition"))
  {
    -[NSConditionLock lockWhenCondition:](self->_doneLock, "lockWhenCondition:", 0);
    -[NSConditionLock unlockWithCondition:](self->_doneLock, "unlockWithCondition:", 1);
  }
}

- (void)searchQuery:(id)a3 returnedResults:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *source;
  const void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  if (!self->_searchResults)
    self->_searchResults = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(a4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (-[ABServerSearchPredicate includeSourceInResults](self, "includeSourceInResults"))
          source = self->_source;
        else
          source = 0;
        v11 = (const void *)objc_msgSend(v9, "newAddressBookRecordWithSource:", source);
        if (v11)
        {
          -[NSMutableArray addObject:](self->_searchResults, "addObject:", v11);
          CFRelease(v11);
          if (-[ABServerSearchPredicate delegate](self, "delegate"))
          {
            if ((-[ABPredicateDelegate predicateShouldContinue:afterFindingRecord:](-[ABServerSearchPredicate delegate](self, "delegate"), "predicateShouldContinue:afterFindingRecord:", self, v11) & 1) == 0)
            {
              -[DADConnection cancelServerContactsSearch:](-[ABServerSearchPredicate connection](self, "connection"), "cancelServerContactsSearch:", self->_searchQuery);
              -[ABServerSearchPredicate _searchQueryIsDone](self, "_searchQueryIsDone");
              goto LABEL_18;
            }
          }
        }
      }
      v6 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_18:
  objc_sync_exit(self);
}

- (void)searchQuery:(id)a3 finishedWithError:(id)a4
{
  uint64_t v5;

  if (a4)
    v5 = objc_msgSend(a4, "code", a3);
  else
    v5 = 2;
  objc_sync_enter(self);
  self->_error = -[ABServerSearchPredicate _errorForDAStatusCode:](self, "_errorForDAStatusCode:", v5);
  -[ABServerSearchPredicate _searchQueryIsDone](self, "_searchQueryIsDone");
  objc_sync_exit(self);
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)includeSourceInResults
{
  return self->_includeSourceInResults;
}

- (void)setIncludeSourceInResults:(BOOL)a3
{
  self->_includeSourceInResults = a3;
}

- (BOOL)includePhotosInResults
{
  return self->_includePhotosInResults;
}

- (void)setIncludePhotosInResults:(BOOL)a3
{
  self->_includePhotosInResults = a3;
}

- (ABPredicateDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (ABPredicateDelegate *)a3;
}

@end
