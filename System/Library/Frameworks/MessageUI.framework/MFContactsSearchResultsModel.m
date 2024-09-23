@implementation MFContactsSearchResultsModel

- (MFContactsSearchResultsModel)init
{
  return -[MFContactsSearchResultsModel initWithFavorMobileNumbers:](self, "initWithFavorMobileNumbers:", 0);
}

- (MFContactsSearchResultsModel)initWithFavorMobileNumbers:(BOOL)a3
{
  return -[MFContactsSearchResultsModel initWithResultTypeSortOrderComparator:resultTypePriorityComparator:favorMobileNumbers:](self, "initWithResultTypeSortOrderComparator:resultTypePriorityComparator:favorMobileNumbers:", 0, 0, a3);
}

- (MFContactsSearchResultsModel)initWithResultTypeSortOrderComparator:(void *)a3 resultTypePriorityComparator:(void *)a4 favorMobileNumbers:(BOOL)a5
{
  MFContactsSearchResultsModel *v8;
  NSOperationQueue *v9;
  NSOperationQueue *queue;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CFIndex Count;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)MFContactsSearchResultsModel;
  v8 = -[MFContactsSearchResultsModel init](&v25, sel_init);
  if (v8)
  {
    v9 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    queue = v8->_queue;
    v8->_queue = v9;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v8->_queue, "setMaxConcurrentOperationCount:", 1);
    v8->_favorMobileNumbers = a5;
    v8->_resultTypesSortOrder = _CopySortedArrayWithValues((CFComparisonResult (__cdecl *)(const void *, const void *, void *))a3, (const void *)1, v11, v12, v13, v14, v15, v16, 2);
    v8->_resultTypesPriorityOrder = _CopySortedArrayWithValues((CFComparisonResult (__cdecl *)(const void *, const void *, void *))a4, (const void *)2, v17, v18, v19, v20, v21, v22, 1);
    Count = CFArrayGetCount(v8->_resultTypesSortOrder);
    v8->_finishedResultTypes = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], Count, 0);
    v8->_preferredType = (unint64_t)CFArrayGetValueAtIndex(v8->_resultTypesPriorityOrder, 0);
  }
  return v8;
}

- (void)dealloc
{
  __CFArray *resultTypesSortOrder;
  __CFArray *resultTypesPriorityOrder;
  __CFSet *finishedResultTypes;
  objc_super v6;

  -[NSOperationQueue cancelAllOperations](self->_queue, "cancelAllOperations");
  -[NSOperationQueue waitUntilAllOperationsAreFinished](self->_queue, "waitUntilAllOperationsAreFinished");
  resultTypesSortOrder = self->_resultTypesSortOrder;
  if (resultTypesSortOrder)
    CFRelease(resultTypesSortOrder);
  resultTypesPriorityOrder = self->_resultTypesPriorityOrder;
  if (resultTypesPriorityOrder)
    CFRelease(resultTypesPriorityOrder);
  finishedResultTypes = self->_finishedResultTypes;
  if (finishedResultTypes)
    CFRelease(finishedResultTypes);
  v6.receiver = self;
  v6.super_class = (Class)MFContactsSearchResultsModel;
  -[MFContactsSearchResultsModel dealloc](&v6, sel_dealloc);
}

- (void)reset
{
  int *p_resetCount;
  unsigned int v3;
  NSOperationQueue *queue;
  _QWORD v5[5];

  p_resetCount = &self->_resetCount;
  do
    v3 = __ldaxr((unsigned int *)p_resetCount);
  while (__stlxr(v3 + 1, (unsigned int *)p_resetCount));
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__MFContactsSearchResultsModel_reset__block_invoke;
  v5[3] = &unk_1E5A65480;
  v5[4] = self;
  -[NSOperationQueue addOperationWithBlock:](queue, "addOperationWithBlock:", v5);
}

void __37__MFContactsSearchResultsModel_reset__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unsigned int *v10;
  unsigned int v11;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 48);
  *(_QWORD *)(v8 + 48) = 0;

  CFSetRemoveAllValues(*(CFMutableSetRef *)(*(_QWORD *)(a1 + 32) + 72));
  v10 = (unsigned int *)(*(_QWORD *)(a1 + 32) + 92);
  do
    v11 = __ldaxr(v10);
  while (__stlxr(v11 - 1, v10));
}

- (BOOL)_isResetting
{
  return self->_resetCount > 0;
}

- (void)_addResults:(id)a3 ofType:(unint64_t)a4
{
  void *v6;
  NSMutableDictionary *recentRecipientsByAddress;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *localSearchResultsByAddress;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *serverSearchResultsByAddress;
  NSMutableDictionary *v16;
  NSMutableDictionary *v17;
  id v18;

  v18 = a3;
  switch(a4)
  {
    case 1uLL:
      _filterOutExistingRecipientsFromResults(v18, self->_enteredRecipients);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_storeStrong((id *)&self->_recentSearchResults, v6);
      recentRecipientsByAddress = self->_recentRecipientsByAddress;
      if (!recentRecipientsByAddress)
      {
        v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v9 = self->_recentRecipientsByAddress;
        self->_recentRecipientsByAddress = v8;

        recentRecipientsByAddress = self->_recentRecipientsByAddress;
      }
      goto LABEL_4;
    case 2uLL:
      localSearchResultsByAddress = self->_localSearchResultsByAddress;
      if (localSearchResultsByAddress)
      {
        v11 = 0;
      }
      else
      {
        v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v17 = self->_localSearchResultsByAddress;
        self->_localSearchResultsByAddress = v16;

        v11 = 0;
        localSearchResultsByAddress = self->_localSearchResultsByAddress;
      }
      goto LABEL_14;
    case 4uLL:
      _filterOutExistingRecipientsFromResults(v18, self->_enteredRecipients);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_storeStrong((id *)&self->_infrequentRecentSearchResults, v6);
      recentRecipientsByAddress = self->_recentRecipientsByAddress;
      if (!recentRecipientsByAddress)
      {
        v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v13 = self->_recentRecipientsByAddress;
        self->_recentRecipientsByAddress = v12;

        recentRecipientsByAddress = self->_recentRecipientsByAddress;
      }
LABEL_4:
      v18 = v6;
      addEntriesForRecipientsIfNotInDictionary(v6, 0, recentRecipientsByAddress);
      break;
    case 8uLL:
      localSearchResultsByAddress = self->_serverSearchResultsByAddress;
      if (!localSearchResultsByAddress)
      {
        v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        serverSearchResultsByAddress = self->_serverSearchResultsByAddress;
        self->_serverSearchResultsByAddress = v14;

        localSearchResultsByAddress = self->_serverSearchResultsByAddress;
      }
      v11 = self->_localSearchResultsByAddress;
LABEL_14:
      addEntriesForRecipientsIfNotInDictionary(v18, v11, localSearchResultsByAddress);
      break;
    default:
      break;
  }

}

- (void)addResults:(id)a3 ofType:(unint64_t)a4
{
  id v5;

  +[_MFSearchAddResultsOperation operationWithResults:ofType:consumer:](_MFSearchAddResultsOperation, "operationWithResults:ofType:consumer:", a3, a4, self);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSOperationQueue addOperation:](self->_queue, "addOperation:");

}

- (void)_finishSearchOfType:(unint64_t)a3
{
  CFSetAddValue(self->_finishedResultTypes, (const void *)a3);
}

- (BOOL)_shouldProcessResultsAfterFinishingType:(unint64_t)a3
{
  CFIndex Count;
  const void *ValueAtIndex;
  BOOL v8;
  const void *v9;
  CFIndex v10;
  int v11;

  CFSetAddValue(self->_finishedResultTypes, (const void *)a3);
  if (!CFSetContainsValue(self->_finishedResultTypes, (const void *)self->_preferredType))
    return 0;
  Count = CFArrayGetCount(self->_resultTypesSortOrder);
  ValueAtIndex = CFArrayGetValueAtIndex(self->_resultTypesSortOrder, 0);
  if (ValueAtIndex == (const void *)a3 || Count < 1)
    return 1;
  v9 = ValueAtIndex;
  v10 = 1;
  do
  {
    v11 = CFSetContainsValue(self->_finishedResultTypes, v9);
    v8 = v11 != 0;
    if (!v11)
      break;
    v9 = CFArrayGetValueAtIndex(self->_resultTypesSortOrder, v10);
  }
  while (v9 != (const void *)a3 && v10++ < Count);
  return v8;
}

- (BOOL)_didFinishSearchForType:(unint64_t)a3
{
  return CFSetContainsValue(self->_finishedResultTypes, (const void *)a3) != 0;
}

- (void)_enumerateSearchResultTypesInSortOrderUsingBlock:(id)a3
{
  CFIndex Count;
  CFIndex v5;
  const void *ValueAtIndex;
  void (**v7)(id, const void *);

  v7 = (void (**)(id, const void *))a3;
  Count = CFArrayGetCount(self->_resultTypesSortOrder);
  if (Count >= 1)
  {
    v5 = 0;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(self->_resultTypesSortOrder, v5);
      v7[2](v7, ValueAtIndex);
      ++v5;
    }
    while (Count != v5);
  }

}

- (id)_bestRecipientForAddress:(id)a3 fallback:(id)a4
{
  id v6;
  id v7;
  CFIndex Count;
  void *v9;
  CFIndex v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  Count = CFArrayGetCount(self->_resultTypesPriorityOrder);
  v9 = v7;
  if (Count >= 1)
  {
    v10 = 0;
    while (1)
    {
      -[MFContactsSearchResultsModel _dictionaryForResultType:](self, "_dictionaryForResultType:", CFArrayGetValueAtIndex(self->_resultTypesPriorityOrder, v10));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        objc_msgSend(v11, "objectForKey:", v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          break;
      }

      if (Count == ++v10)
      {
        v9 = v7;
        goto LABEL_8;
      }
    }

  }
LABEL_8:

  return v9;
}

- (void)_addBestRecipientsForRecipients:(id)a3 excluding:(id)a4 toArray:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v15, "isGroup", (_QWORD)v18))
          objc_msgSend(v15, "address");
        else
          objc_msgSend(v15, "normalizedAddress");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "containsObject:", v16) & 1) == 0)
        {
          -[MFContactsSearchResultsModel _bestRecipientForAddress:fallback:](self, "_bestRecipientForAddress:fallback:", v16, v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v17);
          objc_msgSend(v9, "addObject:", v16);

        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

}

- (void)_appendSortedResultsOfType:(unint64_t)a3 excluding:(id)a4 toResults:(id)a5
{
  id v8;
  NSArray *infrequentRecentSearchResults;
  NSArray *v10;
  void *v11;
  void *v12;
  ABPersonSortOrdering SortOrdering;
  _BOOL4 favorMobileNumbers;
  uint64_t v15;
  id v16;
  _QWORD v17[4];
  ABPersonSortOrdering v18;
  _BOOL4 v19;

  v16 = a4;
  v8 = a5;
  if (a3 == 4)
  {
    infrequentRecentSearchResults = self->_infrequentRecentSearchResults;
LABEL_5:
    v10 = infrequentRecentSearchResults;
    if (!v10)
      goto LABEL_9;
    goto LABEL_8;
  }
  if (a3 == 1)
  {
    infrequentRecentSearchResults = self->_recentSearchResults;
    goto LABEL_5;
  }
  -[MFContactsSearchResultsModel _dictionaryForResultType:](self, "_dictionaryForResultType:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  SortOrdering = ABPersonGetSortOrdering();
  favorMobileNumbers = self->_favorMobileNumbers;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __79__MFContactsSearchResultsModel__appendSortedResultsOfType_excluding_toResults___block_invoke;
  v17[3] = &__block_descriptor_40_e11_q24__0_8_16l;
  v18 = SortOrdering;
  v19 = favorMobileNumbers;
  objc_msgSend(v12, "sortedArrayWithOptions:usingComparator:", 1, v17);
  v15 = objc_claimAutoreleasedReturnValue();

  v10 = (NSArray *)v15;
  if (v15)
LABEL_8:
    -[MFContactsSearchResultsModel _addBestRecipientsForRecipients:excluding:toArray:](self, "_addBestRecipientsForRecipients:excluding:toArray:", v10, v16, v8, v16);
LABEL_9:

}

uint64_t __79__MFContactsSearchResultsModel__appendSortedResultsOfType_excluding_toResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  const void *v13;
  const void *v14;
  CFComparisonResult v15;
  BOOL v16;
  char v17;
  __CFString *v18;
  uint64_t v19;
  __CFString *v20;
  const __CFString *v21;
  char v22;
  const __CFString *v23;
  CFComparisonResult v24;
  char v25;

  v5 = a2;
  v6 = a3;
  v7 = v5;
  v8 = v6;
  v9 = objc_msgSend(v7, "property");
  v10 = objc_msgSend(v8, "property");
  v11 = v10;
  if (v9 != v10)
  {
    if (*MEMORY[0x1E0CF61A0] == v9)
    {
      v12 = -1;
      goto LABEL_45;
    }
    if (*MEMORY[0x1E0CF61A0] == v10)
    {
      v12 = 1;
      goto LABEL_45;
    }
  }
  v13 = (const void *)objc_msgSend(v7, "record");
  v14 = (const void *)objc_msgSend(v8, "record");
  if (!v13 || !v14)
    __assert_rtn("compareComposeRecipients", "MFContactsSearchResultsModel.m", 335, "false");
  v15 = ABPersonComparePeopleByName(v13, v14, *(_DWORD *)(a1 + 32));
  if (*(_DWORD *)(a1 + 36))
    v16 = v15 == kCFCompareEqualTo;
  else
    v16 = 0;
  v17 = !v16;
  if (v16)
    v12 = 0;
  else
    v12 = v15;
  if (v9 == v11 && (v17 & 1) == 0)
  {
    if (v9 != *MEMORY[0x1E0CF61A0])
    {
      v12 = 0;
      goto LABEL_45;
    }
    objc_msgSend(v7, "unlocalizedLabel");
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unlocalizedLabel");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (__CFString *)v19;
    if (v18)
    {
      if ((-[__CFString isEqualToString:](v18, "isEqualToString:", v19) & 1) == 0)
      {
        v21 = (const __CFString *)*MEMORY[0x1E0CF6178];
        if (CFStringCompare((CFStringRef)*MEMORY[0x1E0CF6178], v18, 0) == kCFCompareEqualTo)
        {
          v12 = -1;
          goto LABEL_44;
        }
        if (!v20)
        {
          v22 = 1;
          goto LABEL_31;
        }
        goto LABEL_28;
      }
    }
    else if (v19)
    {
      v21 = (const __CFString *)*MEMORY[0x1E0CF6178];
LABEL_28:
      if (CFStringCompare(v21, v20, 0))
      {
        if (!v18)
        {
          v23 = (const __CFString *)*MEMORY[0x1E0CF6188];
LABEL_43:
          v12 = CFStringCompare(v23, v20, 0) == kCFCompareEqualTo;
          goto LABEL_44;
        }
        v22 = 0;
LABEL_31:
        v23 = (const __CFString *)*MEMORY[0x1E0CF6188];
        v24 = CFStringCompare((CFStringRef)*MEMORY[0x1E0CF6188], v18, 0);
        if (v24)
          v25 = v22;
        else
          v25 = 1;
        if (v24)
          v12 = 0;
        else
          v12 = -1;
        if ((v25 & 1) != 0)
          goto LABEL_44;
        goto LABEL_43;
      }
      v12 = 1;
LABEL_44:

      goto LABEL_45;
    }
    v12 = 0;
    goto LABEL_44;
  }
LABEL_45:

  return v12;
}

- (void)processAddedResultsOfType:(unint64_t)a3 completion:(id)a4
{
  id v5;

  +[_MFSearchProcessResultsOperation operationWithResultsOfType:completion:consumer:](_MFSearchProcessResultsOperation, "operationWithResultsOfType:completion:consumer:", a3, a4, self);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSOperationQueue addOperation:](self->_queue, "addOperation:");

}

- (id)_dictionaryForResultType:(unint64_t)a3
{
  unint64_t v3;
  id v4;

  v3 = a3 - 1;
  if (a3 - 1 <= 7 && ((0x8Bu >> v3) & 1) != 0)
    v4 = *(id *)((char *)&self->super.isa + qword_1ABAA0D10[v3]);
  else
    v4 = 0;
  return v4;
}

- (NSArray)enteredRecipients
{
  return self->_enteredRecipients;
}

- (void)setEnteredRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_enteredRecipients, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enteredRecipients, 0);
  objc_storeStrong((id *)&self->_recentRecipientsByAddress, 0);
  objc_storeStrong((id *)&self->_serverSearchResultsByAddress, 0);
  objc_storeStrong((id *)&self->_localSearchResultsByAddress, 0);
  objc_storeStrong((id *)&self->_infrequentRecentSearchResults, 0);
  objc_storeStrong((id *)&self->_recentSearchResults, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
