@implementation ABSearchOperation

- (void)dealloc
{
  void *addressBook;
  void *internalSearchAddressBook;
  objc_super v5;

  addressBook = self->_addressBook;
  if (addressBook)
    CFRelease(addressBook);
  internalSearchAddressBook = self->_internalSearchAddressBook;
  if (internalSearchAddressBook)
    CFRelease(internalSearchAddressBook);

  v5.receiver = self;
  v5.super_class = (Class)ABSearchOperation;
  -[ABSearchOperation dealloc](&v5, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  if (a3)
    -[ABSearchOperation setProgressBlock:](self, "setProgressBlock:", 0);
  self->_delegate = (ABSearchOperationDelegate *)a3;
}

- (BOOL)isConcurrent
{
  void *v3;

  v3 = -[ABSearchOperation addressBook](self, "addressBook");
  return v3 != -[ABSearchOperation internalSearchAddressBook](self, "internalSearchAddressBook");
}

- (void)setProgressBlock:(id)a3
{
  id progressBlock;

  if (a3)
    -[ABSearchOperation setDelegate:](self, "setDelegate:", 0);
  progressBlock = self->_progressBlock;
  if (progressBlock != a3)
  {

    self->_progressBlock = (id)objc_msgSend(a3, "copy");
    self->_progressBlockThread = (NSThread *)(id)objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  }
}

- (void)setAddressBook:(void *)a3
{
  void *addressBook;

  addressBook = self->_addressBook;
  if (addressBook != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      addressBook = self->_addressBook;
    }
    if (addressBook)
      CFRelease(addressBook);
    self->_addressBook = a3;
  }
}

- (void)addressBook
{
  return self->_addressBook;
}

- (void)internalSearchAddressBook
{
  CFTypeRef v4;
  const void *v5;

  if (!self->_internalSearchAddressBook && -[ABSearchOperation addressBook](self, "addressBook"))
  {
    v4 = ABAddressBookCopyDatabaseDirectory((uint64_t)-[ABSearchOperation addressBook](self, "addressBook"));
    if (v4)
    {
      v5 = v4;
      self->_internalSearchAddressBook = (void *)ABAddressBookCreateWithDatabaseDirectory((uint64_t)v4);
      CFRelease(v5);
    }
    else
    {
      self->_internalSearchAddressBook = (void *)CFRetain(self->_addressBook);
    }
  }
  return self->_internalSearchAddressBook;
}

- (void)setInternalSearchAddressBook:(void *)a3
{
  void *internalSearchAddressBook;

  internalSearchAddressBook = self->_internalSearchAddressBook;
  if (internalSearchAddressBook != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      internalSearchAddressBook = self->_internalSearchAddressBook;
    }
    if (internalSearchAddressBook)
      CFRelease(internalSearchAddressBook);
    self->_internalSearchAddressBook = a3;
  }
}

- (void)cancel
{
  uint64_t v3;
  sqlite3 *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ABSearchOperation;
  -[ABSearchOperation cancel](&v5, sel_cancel);
  if (-[ABSearchOperation internalSearchAddressBook](self, "internalSearchAddressBook"))
  {
    -[ABSearchOperation internalSearchAddressBook](self, "internalSearchAddressBook");
    CPRecordStoreGetDatabase();
    v3 = CPSqliteDatabaseConnectionForReading();
    if (v3)
    {
      v4 = *(sqlite3 **)(v3 + 8);
      if (v4)
        sqlite3_interrupt(v4);
    }
  }
}

- (void)main
{
  void *v3;
  id v4;
  _QWORD v5[5];

  if ((-[ABSearchOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    +[ABPredicate searchPeopleWithPredicate:sortOrder:inAddressBook:withDelegate:](ABPredicate, "searchPeopleWithPredicate:sortOrder:inAddressBook:withDelegate:", -[ABSearchOperation predicate](self, "predicate"), -[ABSearchOperation sortOrdering](self, "sortOrdering"), -[ABSearchOperation internalSearchAddressBook](self, "internalSearchAddressBook"), self);
    if ((-[ABSearchOperation isCancelled](self, "isCancelled") & 1) == 0)
    {
      if (-[ABSearchOperation delegate](self, "delegate"))
      {
        v3 = (void *)objc_msgSend(MEMORY[0x1E0D13B68], "mainThreadScheduler");
        v5[0] = MEMORY[0x1E0C809B0];
        v5[1] = 3221225472;
        v5[2] = __25__ABSearchOperation_main__block_invoke;
        v5[3] = &unk_1E3CA3D78;
        v5[4] = self;
        objc_msgSend(v3, "performBlock:", v5);
      }
      else
      {
        v4 = -[ABSearchOperation progressBlock](self, "progressBlock");
        (*((void (**)(id, ABSearchOperation *, _QWORD, _QWORD))v4 + 2))(v4, self, 0, 0);
      }
    }
  }
}

uint64_t __25__ABSearchOperation_main__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "searchOperation:didFindMatches:moreComing:", *(_QWORD *)(a1 + 32), 0, 0);
}

- (BOOL)predicateShouldContinue:(id)a3
{
  return -[ABSearchOperation isCancelled](self, "isCancelled", a3) ^ 1;
}

- (void)_mainThread_tellDelegateSearchFoundMatch:(void *)a3
{
  ABRecordID RecordID;
  void *PersonWithRecordID;
  ABRecordID v7;
  uint64_t v8;
  void (**v9)(id, ABSearchOperation *, uint64_t, uint64_t);

  if ((-[ABSearchOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    RecordID = ABRecordGetRecordID(a3);
    PersonWithRecordID = a3;
    if (RecordID != -1)
    {
      v7 = RecordID;
      ABAddressBookAddRecord(-[ABSearchOperation addressBook](self, "addressBook", a3), a3, 0);
      PersonWithRecordID = (void *)ABAddressBookGetPersonWithRecordID(-[ABSearchOperation addressBook](self, "addressBook"), v7);
    }
    if (PersonWithRecordID)
    {
      v8 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:");
      if (-[ABSearchOperation delegate](self, "delegate"))
      {
        -[ABSearchOperationDelegate searchOperation:didFindMatches:moreComing:](-[ABSearchOperation delegate](self, "delegate"), "searchOperation:didFindMatches:moreComing:", self, v8, 1);
      }
      else if (-[ABSearchOperation progressBlock](self, "progressBlock"))
      {
        v9 = -[ABSearchOperation progressBlock](self, "progressBlock");
        v9[2](v9, self, v8, 1);
      }
    }
  }
  if (a3)
    CFRelease(a3);
}

- (BOOL)predicateShouldContinue:(id)a3 afterFindingRecord:(void *)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  const void *v9;
  int v10;
  NSThread *progressBlockThread;

  v6 = -[ABSearchOperation internalSearchAddressBook](self, "internalSearchAddressBook", a3);
  v7 = -[ABSearchOperation addressBook](self, "addressBook");
  if (v6 == v7)
    v8 = (uint64_t)CFRetain(a4);
  else
    v8 = ABPersonCopy();
  v9 = (const void *)v8;
  if ((-[ABSearchOperation isCancelled](self, "isCancelled") & 1) != 0)
  {
    CFRelease(v9);
  }
  else
  {
    v10 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
    if (v6 == v7 || v10)
    {
      -[ABSearchOperation _mainThread_tellDelegateSearchFoundMatch:](self, "_mainThread_tellDelegateSearchFoundMatch:", v9);
    }
    else
    {
      progressBlockThread = self->_progressBlockThread;
      if (progressBlockThread)
        -[ABSearchOperation performSelector:onThread:withObject:waitUntilDone:modes:](self, "performSelector:onThread:withObject:waitUntilDone:modes:", sel__mainThread_tellDelegateSearchFoundMatch_, progressBlockThread, v9, 1, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", kABSearchOperationRunloopMode));
      else
        -[ABSearchOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__mainThread_tellDelegateSearchFoundMatch_, v9, 0);
    }
  }
  return -[ABSearchOperation isCancelled](self, "isCancelled") ^ 1;
}

+ (id)personPredicateWithName:(id)a3 addressBook:(void *)a4
{
  return +[ABPredicate personPredicateWithName:addressBook:](ABPredicate, "personPredicateWithName:addressBook:", a3, a4);
}

+ (id)personPredicateWithNameLike:(id)a3 addressBook:(void *)a4
{
  return +[ABPredicate personPredicateWithNameLike:group:source:account:includeSourceInResults:addressBook:](ABPredicate, "personPredicateWithNameLike:group:source:account:includeSourceInResults:addressBook:", a3, 0, 0, 0, 0, a4);
}

+ (id)personPredicateWithNameLike:(id)a3 inGroup:(void *)a4 addressBook:(void *)a5
{
  return +[ABPredicate personPredicateWithNameLike:group:source:account:includeSourceInResults:addressBook:](ABPredicate, "personPredicateWithNameLike:group:source:account:includeSourceInResults:addressBook:", a3, a4, 0, 0, 0, a5);
}

+ (id)personPredicateWithNameLike:(id)a3 inSource:(void *)a4 addressBook:(void *)a5
{
  return +[ABPredicate personPredicateWithNameLike:group:source:account:includeSourceInResults:addressBook:](ABPredicate, "personPredicateWithNameLike:group:source:account:includeSourceInResults:addressBook:", a3, 0, a4, 0, 0, a5);
}

+ (id)personPredicateWithNameLike:(id)a3 inSource:(void *)a4 includeSourceInResults:(BOOL)a5 addressBook:(void *)a6
{
  return +[ABPredicate personPredicateWithNameLike:group:source:account:includeSourceInResults:addressBook:](ABPredicate, "personPredicateWithNameLike:group:source:account:includeSourceInResults:addressBook:", a3, 0, a4, 0, a5, a6);
}

+ (id)personPredicateWithNameLike:(id)a3 inSource:(void *)a4 includeSourceInResults:(BOOL)a5 includePhotosInResults:(BOOL)a6 addressBook:(void *)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  uint64_t v11;

  v8 = a6;
  v9 = a5;
  if (a4)
    v11 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", a4);
  else
    v11 = 0;
  return +[ABPredicate personPredicateWithNameLike:groups:sources:includeSourceInResults:includePhotosInResults:addressBook:](ABPredicate, "personPredicateWithNameLike:groups:sources:includeSourceInResults:includePhotosInResults:addressBook:", a3, 0, v11, v9, v8, a7);
}

+ (id)personPredicateWithNameLike:(id)a3 inAccount:(id)a4 addressBook:(void *)a5
{
  return +[ABPredicate personPredicateWithNameLike:group:source:account:includeSourceInResults:addressBook:](ABPredicate, "personPredicateWithNameLike:group:source:account:includeSourceInResults:addressBook:", a3, 0, 0, a4, 0, a5);
}

+ (id)personPredicateWithNameLike:(id)a3 inGroups:(id)a4 sources:(id)a5 addressBook:(void *)a6
{
  return +[ABPredicate personPredicateWithNameLike:groups:sources:addressBook:](ABPredicate, "personPredicateWithNameLike:groups:sources:addressBook:", a3, a4, a5, a6);
}

+ (id)personPredicateWithPhoneLike:(id)a3 countryHint:(id)a4 addressBook:(void *)a5
{
  return +[ABPredicate personPredicateWithPhoneLike:countryHint:addressBook:](ABPredicate, "personPredicateWithPhoneLike:countryHint:addressBook:", a3, a4, a5);
}

+ (id)personPredicateWithNameOnly:(id)a3 inAccount:(id)a4 addressBook:(void *)a5
{
  return +[ABPredicate personPredicateWithNameOnly:account:addressBook:](ABPredicate, "personPredicateWithNameOnly:account:addressBook:", a3, a4, a5);
}

+ (id)personPredicateWithValue:(id)a3 comparison:(int64_t)a4 forProperty:(int)a5 addressBook:(void *)a6
{
  return +[ABPredicate personPredicateWithValue:comparison:forProperty:](ABPredicate, "personPredicateWithValue:comparison:forProperty:", a3, a4, *(_QWORD *)&a5, a6);
}

+ (id)personPredicateWithAnyValueForProperty:(int)a3 addressBook:(void *)a4
{
  return +[ABPredicate personPredicateWithAnyValueForProperty:](ABPredicate, "personPredicateWithAnyValueForProperty:", *(_QWORD *)&a3, a4);
}

+ (id)personPredicateWithGroup:(void *)a3 addressBook:(void *)a4
{
  return +[ABPredicate personPredicateWithGroup:source:account:](ABPredicate, "personPredicateWithGroup:source:account:", a3, 0, 0);
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 304);
}

- (NSArray)prefetchProperties
{
  return self->_prefetchProperties;
}

- (void)setPrefetchProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (ABSearchOperationDelegate)delegate
{
  return self->_delegate;
}

- (void)context
{
  return self->_context;
}

- (void)setContext:(void *)a3
{
  self->_context = a3;
}

- (unsigned)sortOrdering
{
  return self->_sortOrdering;
}

- (void)setSortOrdering:(unsigned int)a3
{
  self->_sortOrdering = a3;
}

- (id)progressBlock
{
  return self->_progressBlock;
}

@end
