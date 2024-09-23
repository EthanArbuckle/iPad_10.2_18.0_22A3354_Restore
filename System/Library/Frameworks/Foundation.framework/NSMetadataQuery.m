@implementation NSMetadataQuery

+ (id)willBeginPossibleDeletionOfItemAtURL:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend(a1, "_stitchingClass"), "willBeginPossibleDeletionOfItemAtURL:", a3);
}

+ (id)willBeginPossibleCreationOfItemAtURL:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend(a1, "_stitchingClass"), "willBeginPossibleCreationOfItemAtURL:", a3);
}

+ (Class)_stitchingClass
{
  if (qword_1ECD099C8 != -1)
    dispatch_once(&qword_1ECD099C8, &__block_literal_global_25);
  return (Class)qword_1ECD099C0;
}

uint64_t __55__NSMetadataQuery_NSMetadataStitching___stitchingClass__block_invoke()
{
  uint64_t result;

  qword_1ECD099C0 = (uint64_t)objc_lookUpClass("BRQuery");
  result = objc_opt_respondsToSelector();
  if ((result & 1) == 0)
    qword_1ECD099C0 = 0;
  return result;
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  void *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("resultCount")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("valueLists")) & 1) != 0
    || objc_msgSend(a3, "isEqualToString:", CFSTR("groupedResults")))
  {
    objc_msgSend(v5, "addObject:", CFSTR("results"));
  }
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___NSMetadataQuery;
  objc_msgSend(v5, "unionSet:", objc_msgSendSuper2(&v7, sel_keyPathsForValuesAffectingValueForKey_, a3));
  return v5;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (NSMetadataQuery)init
{
  NSMetadataQuery *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)NSMetadataQuery;
  v2 = -[NSMetadataQuery init](&v4, sel_init);
  if (qword_1ECD099D0 != -1)
    dispatch_once(&qword_1ECD099D0, &__block_literal_global_494);
  if (_MergedGlobals_7_0)
  {
    v2->_interval = 1.0;
    v2->_private[10] = objc_alloc_init(MEMORY[0x1E0C99D20]);
    v2->_private[1] = objc_alloc_init(MEMORY[0x1E0C99D20]);
    v2->_private[2] = objc_alloc_init(MEMORY[0x1E0C99D20]);
    v2->_private[3] = objc_alloc_init(MEMORY[0x1E0C99D20]);
    v2->_reserved = objc_alloc_init(_NSMetadataQueryPrivateIvars);
    LODWORD(v2->_flags) = v2->_flags & 0xFFFFFFE7 | 8;
  }
  else
  {

    return 0;
  }
  return v2;
}

- (void)dealloc
{
  id v3;
  int flags;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];

  v3 = self->_private[5];
  if (v3)
  {
    if ((self->_flags & 2) == 0)
    {
      objc_msgSend(v3, "stop");
      flags = self->_flags;
      LODWORD(self->_flags) = flags | 2;
      if ((flags & 1) != 0)
      {
        if (-[NSMetadataQuery operationQueue](self, "operationQueue")
          || (v5 = self->_private[9], v5 != (id)objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop"))
          || _CFExecutableLinkedOnOrAfter())
        {
          if (-[NSMetadataQuery operationQueue](self, "operationQueue"))
            NSLog((NSString *)CFSTR("%@ is being deallocated without first calling -stopQuery. To avoid race conditions, you should first invoke -stopQuery on self.operationQueue."), self);
          else
            NSLog((NSString *)CFSTR("%@ is being deallocated without first calling -stopQuery. To avoid race conditions, you should first invoke -stopQuery on the run loop on which -startQuery was called"), self);
        }
      }
    }
    v6 = objc_msgSend(self->_private[5], "resultCount");
    if (v6 >= 1)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        v9 = (void *)objc_msgSend(self->_private[5], "resultAtIndex:", i);
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v9, "_setQuery:", 0);
      }
    }
    -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, CFSTR("__kMDQueryWillChangeNotification"), self->_private[5]);
    -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, CFSTR("kMDQueryProgressNotification"), self->_private[5]);
    -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, CFSTR("kMDQueryDidUpdateNotification"), self->_private[5]);
    -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, CFSTR("kMDQueryDidFinishNotification"), self->_private[5]);

    self->_private[5] = 0;
  }

  self->_private[8] = 0;
  v10.receiver = self;
  v10.super_class = (Class)NSMetadataQuery;
  -[NSMetadataQuery dealloc](&v10, sel_dealloc);
}

- (BOOL)_canModifyQueryOrObserversInCurrentContext
{
  NSOperationQueue *v3;

  if ((self->_flags & 3) != 1)
    return 1;
  if (-[NSMetadataQuery operationQueue](self, "operationQueue"))
  {
    v3 = +[NSOperationQueue currentQueue](NSOperationQueue, "currentQueue");
    return v3 == -[NSMetadataQuery operationQueue](self, "operationQueue");
  }
  else
  {
    if (!self->_private[9])
      return 0;
    return (id)objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop") == self->_private[9];
  }
}

- (void)_validateInvocationContext
{
  if (!-[NSMetadataQuery _canModifyQueryOrObserversInCurrentContext](self, "_canModifyQueryOrObserversInCurrentContext"))NSLog((NSString *)CFSTR("%@ has been started, but a modification to it was made from a different run loop or queue. Here's the backtrace: %@"), self, +[NSThread callStackSymbols](NSThread, "callStackSymbols"));
}

- (id)delegate
{
  return self->_private[8];
}

- (void)setDelegate:(id)delegate
{
  int v4;
  int v5;

  self->_private[8] = delegate;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = 32;
  else
    v4 = 0;
  LODWORD(self->_flags) = self->_flags & 0xFFFFFFDF | v4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = 64;
  else
    v5 = 0;
  LODWORD(self->_flags) = self->_flags & 0xFFFFFFBF | v5;
}

- (NSPredicate)predicate
{
  return (NSPredicate *)self->_private[0];
}

- (void)_validatePredicate:(id)a3 withScopes:(id)a4
{
  if (a3)
  {
    if (objc_msgSend(a4, "count"))
      objc_msgSend(a3, "_validateForMetadataQueryScopes:", a4);
  }
}

- (void)setPredicate:(NSPredicate *)predicate
{
  if (self->_private[0] != predicate)
  {
    -[NSMetadataQuery _validateInvocationContext](self, "_validateInvocationContext");
    -[NSMetadataQuery _validatePredicate:withScopes:](self, "_validatePredicate:withScopes:", predicate, self->_private[10]);
    -[NSMetadataQuery willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("predicate"));

    self->_private[0] = -[NSPredicate copyWithZone:](predicate, "copyWithZone:", 0);
    -[NSMetadataQuery didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("predicate"));
    if ((self->_flags & 3) == 1)
      -[NSMetadataQuery _recreateQuery](self, "_recreateQuery");
  }
}

- (NSArray)sortDescriptors
{
  return (NSArray *)self->_private[1];
}

- (void)setSortDescriptors:(NSArray *)sortDescriptors
{
  if (self->_private[1] != sortDescriptors)
  {
    -[NSMetadataQuery _validateInvocationContext](self, "_validateInvocationContext");
    -[NSMetadataQuery willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("sortDescriptors"));

    self->_private[1] = (id)-[NSArray copy](sortDescriptors, "copy");
    -[NSMetadataQuery didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("sortDescriptors"));
    if ((self->_flags & 3) == 1)
      -[NSMetadataQuery _recreateQuery](self, "_recreateQuery");
  }
}

- (NSArray)valueListAttributes
{
  return (NSArray *)self->_private[2];
}

- (void)setValueListAttributes:(NSArray *)valueListAttributes
{
  if (self->_private[2] != valueListAttributes)
  {
    -[NSMetadataQuery willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("valueListAttributes"));

    self->_private[2] = (id)-[NSArray copy](valueListAttributes, "copy");
    -[NSMetadataQuery didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("valueListAttributes"));
    if ((self->_flags & 3) == 1)
      -[NSMetadataQuery _recreateQuery](self, "_recreateQuery");
  }
}

- (NSArray)groupingAttributes
{
  return (NSArray *)self->_private[3];
}

- (void)setGroupingAttributes:(NSArray *)groupingAttributes
{
  if (self->_private[3] != groupingAttributes)
  {
    -[NSMetadataQuery _validateInvocationContext](self, "_validateInvocationContext");
    -[NSMetadataQuery willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("groupingAttributes"));

    self->_private[3] = (id)-[NSArray copy](groupingAttributes, "copy");
    -[NSMetadataQuery didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("groupingAttributes"));
    if ((self->_flags & 3) == 1)
      -[NSMetadataQuery _recreateQuery](self, "_recreateQuery");
  }
}

- (id)_sortingAttributes
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_private[1];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8++), "key"));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    }
    while (v6);
  }
  return v3;
}

- (id)_allAttributes
{
  NSArray *v3;
  NSArray *v4;
  void *v5;
  void *v6;

  v3 = -[NSMetadataQuery valueListAttributes](self, "valueListAttributes");
  v4 = -[NSMetadataQuery groupingAttributes](self, "groupingAttributes");
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = v5;
  if (v3)
    objc_msgSend(v5, "addObjectsFromArray:", v3);
  if (v4)
    objc_msgSend(v6, "addObjectsFromArray:", v4);
  objc_msgSend(v6, "addObjectsFromArray:", -[NSMetadataQuery _sortingAttributes](self, "_sortingAttributes"));
  return v6;
}

- (NSTimeInterval)notificationBatchingInterval
{
  return self->_interval;
}

- (void)setNotificationBatchingInterval:(NSTimeInterval)notificationBatchingInterval
{
  if (self->_interval != notificationBatchingInterval)
  {
    -[NSMetadataQuery _validateInvocationContext](self, "_validateInvocationContext");
    -[NSMetadataQuery willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("notificationBatchingInterval"));
    self->_interval = notificationBatchingInterval;
    -[NSMetadataQuery _setBatchingParams](self, "_setBatchingParams");
    -[NSMetadataQuery didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("notificationBatchingInterval"));
  }
}

- (NSArray)searchScopes
{
  return (NSArray *)self->_private[10];
}

- (void)setSearchScopes:(NSArray *)searchScopes
{
  if (self->_private[10] != searchScopes)
  {
    -[NSMetadataQuery _validateInvocationContext](self, "_validateInvocationContext");
    -[NSMetadataQuery _validatePredicate:withScopes:](self, "_validatePredicate:withScopes:", self->_private[0], searchScopes);
    -[NSMetadataQuery willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("searchScopes"));

    self->_private[10] = (id)-[NSArray copy](searchScopes, "copy");
    -[NSMetadataQuery didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("searchScopes"));
    if (!self->_private[0])
      -[NSMetadataQuery setPredicate:](self, "setPredicate:", +[NSPredicate predicateWithValue:](NSPredicate, "predicateWithValue:", 1));
    if ((self->_flags & 3) == 1)
      -[NSMetadataQuery _recreateQuery](self, "_recreateQuery");
  }
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getAssociatedObject(self, sel_operationQueue);
}

- (void)setOperationQueue:(NSOperationQueue *)operationQueue
{
  id v5;

  if (-[NSMetadataQuery operationQueue](self, "operationQueue") != operationQueue)
  {
    -[NSMetadataQuery willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("operationQueue"));
    v5 = self->_private[5];
    if (v5)
      objc_msgSend(v5, "setQueryQueue:", operationQueue);
    objc_setAssociatedObject(self, sel_operationQueue, operationQueue, (void *)0x301);
    -[NSMetadataQuery didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("operationQueue"));
  }
}

- (NSArray)searchItems
{
  return (NSArray *)objc_getAssociatedObject(self, sel_searchItems);
}

- (void)setSearchItems:(NSArray *)searchItems
{
  if (-[NSMetadataQuery searchItems](self, "searchItems") != searchItems)
  {
    -[NSMetadataQuery _validateInvocationContext](self, "_validateInvocationContext");
    -[NSMetadataQuery willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("searchItems"));
    -[NSMetadataQuery willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("searchItemURLs"));
    objc_setAssociatedObject(self, sel_searchItems, searchItems, (void *)0x303);
    -[NSMetadataQuery didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("searchItemURLs"));
    -[NSMetadataQuery didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("searchItems"));
    if ((self->_flags & 3) == 1)
      -[NSMetadataQuery _recreateQuery](self, "_recreateQuery");
  }
}

- (id)_externalDocumentsBundleIdentifier
{
  return objc_getAssociatedObject(self, sel__externalDocumentsBundleIdentifier);
}

- (void)_setExternalDocumentsBundleIdentifier:(id)a3
{
  -[NSMetadataQuery _validateInvocationContext](self, "_validateInvocationContext");
  objc_setAssociatedObject(self, sel__externalDocumentsBundleIdentifier, a3, (void *)0x301);
  if ((self->_flags & 3) == 1)
    -[NSMetadataQuery _recreateQuery](self, "_recreateQuery");
}

- (void)_setBatchingParams
{
  id v3;
  unint64_t v4;
  __int128 v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = self->_private[5];
  if (v3)
  {
    v4 = (unint64_t)(self->_interval * 1000.0);
    v5 = xmmword_1822625E0;
    v6 = 50000;
    v7 = v4;
    v8 = 50000;
    v9 = v4;
    objc_msgSend(v3, "setBatchingParameters:", &v5);
  }
}

- (void)_postNotificationName:(id)a3 userInfo:(id)a4
{
  -[NSMetadataQuery operationQueue](self, "operationQueue");
  -[NSNotificationCenter postNotificationName:object:userInfo:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", a3, self, a4);
}

- (void)_noteNote1:(id)a3
{
  int flags;

  flags = self->_flags;
  if ((flags & 0x80) == 0)
  {
    -[NSMetadataQuery willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("results"));
    flags = self->_flags;
  }
  LODWORD(self->_flags) = flags | 0x80;
}

- (void)_noteNote2:(id)a3
{
  LODWORD(self->_flags) &= ~0x80u;
  -[NSMetadataQuery didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("results"));
  -[NSMetadataQuery _postNotificationName:userInfo:](self, "_postNotificationName:userInfo:", CFSTR("NSMetadataQueryGatheringProgressNotification"), objc_msgSend(a3, "userInfo"));
}

- (void)_noteNote3:(id)a3
{
  LODWORD(self->_flags) &= ~0x80u;
  -[NSMetadataQuery didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("results"));
  -[NSMetadataQuery _postNotificationName:userInfo:](self, "_postNotificationName:userInfo:", CFSTR("NSMetadataQueryDidUpdateNotification"), objc_msgSend(a3, "userInfo"));
}

- (void)_noteNote4:(id)a3
{
  NSMetadataQuery *v3;
  int flags;

  v3 = self;
  flags = self->_flags;
  if ((flags & 0x80) != 0)
  {
    LODWORD(self->_flags) = flags & 0xFFFFFF7F;
    -[NSMetadataQuery didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("results"));
  }
  -[NSMetadataQuery willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isGathering"));
  LODWORD(self->_flags) &= ~4u;
  -[NSMetadataQuery didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isGathering"));
  -[NSMetadataQuery _postNotificationName:userInfo:](self, "_postNotificationName:userInfo:", CFSTR("NSMetadataQueryDidFinishGatheringNotification"), 0);
  -[NSMetadataQuery willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("results"));
  LODWORD(self->_flags) |= 0x80u;

}

- (id)_queryString
{
  return (id)objc_msgSend(self->_private[0], "generateMetadataDescription");
}

- (void)_resetQueryState
{
  int flags;

  flags = self->_flags;
  if ((flags & 2) != 0)
  {
    -[NSMetadataQuery willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isStopped"));
    LODWORD(self->_flags) &= ~2u;
    -[NSMetadataQuery didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isStopped"));
    flags = self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0)
        return;
LABEL_7:
      -[NSMetadataQuery willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isGathering"));
      LODWORD(self->_flags) &= ~4u;
      -[NSMetadataQuery didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isGathering"));
      return;
    }
  }
  else if ((flags & 1) == 0)
  {
    goto LABEL_3;
  }
  -[NSMetadataQuery willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isStarted"));
  LODWORD(self->_flags) &= ~1u;
  -[NSMetadataQuery didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isStarted"));
  if ((self->_flags & 4) != 0)
    goto LABEL_7;
}

- (void)_recreateQuery
{
  id v3;
  unsigned int flags;
  BOOL v5;
  unsigned int v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  id v18;
  NSOperationQueue *v19;
  id v20;
  id v21;
  void *v22;
  _OWORD v23[2];
  uint64_t (*v24)(void *, void *);
  _BYTE v25[128];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = self->_private[5];
  if (v3)
  {
    if ((self->_flags & 0x80) == 0)
    {
      -[NSMetadataQuery willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("results"));
      LODWORD(self->_flags) |= 0x80u;
      v3 = self->_private[5];
    }
    objc_msgSend(v3, "stop");
    objc_sync_enter(self);
    if (*((_QWORD *)self->_reserved + 1))
    {
      -[NSMetadataQuery _disableAutoUpdates](self, "_disableAutoUpdates");
      *((_QWORD *)self->_reserved + 1) = 0;
      flags = self->_flags;
      v5 = flags >= 0x10000;
      v6 = flags - 0x10000;
      if (v5)
        LODWORD(self->_flags) = v6;
    }
    objc_sync_exit(self);
    -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, CFSTR("__kMDQueryWillChangeNotification"), self->_private[5]);
    -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, CFSTR("kMDQueryProgressNotification"), self->_private[5]);
    -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, CFSTR("kMDQueryDidUpdateNotification"), self->_private[5]);
    -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, CFSTR("kMDQueryDidFinishNotification"), self->_private[5]);

    self->_private[5] = 0;
    -[NSMetadataQuery didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("results"));
    LODWORD(self->_flags) &= ~0x80u;
  }
  if (!self->_private[0])
  {
    -[NSMetadataQuery _resetQueryState](self, "_resetQueryState");
    return;
  }
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", -[NSMetadataQuery _sortingAttributes](self, "_sortingAttributes"));
  v8 = v7;
  if (self->_private[3])
    objc_msgSend(v7, "addObjectsFromArray:");
  v22 = v8;
  v9 = -[NSMetadataQuery searchItems](self, "searchItems");
  if (v9)
  {
    v10 = v9;
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
    if (!v12)
      goto LABEL_28;
    v13 = *(_QWORD *)v27;
    while (1)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v16 = (id)objc_msgSend(objc_alloc(objc_lookUpClass("BRItem")), "initWithURL:", v15);
        }
        else if (_NSIsNSString())
        {
          v16 = (id)objc_msgSend(objc_alloc(objc_lookUpClass("BRItem")), "initWithURL:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v15));
        }
        else
        {
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          v16 = (id)objc_msgSend(v15, "_item");
        }
        v17 = v16;
        if (v16)
        {
          objc_msgSend(v11, "addObject:", v16);

        }
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
      if (!v12)
      {
LABEL_28:
        self->_private[5] = (id)objc_msgSend(objc_alloc(objc_lookUpClass("BRQuery")), "initWithQuery:values:sortingAttributes:items:", self, self->_private[2], v22, v11);

        v18 = self->_private[5];
        if (v18)
          goto LABEL_29;
LABEL_46:
        -[NSMetadataQuery _resetQueryState](self, "_resetQueryState");
        return;
      }
    }
  }
  v18 = (id)objc_msgSend(objc_alloc(objc_lookUpClass("BRQuery")), "initWithQuery:values:sortingAttributes:items:", self, self->_private[2], v8, 0);
  self->_private[5] = v18;
  if (!v18)
    goto LABEL_46;
LABEL_29:
  v23[0] = xmmword_1E0F4F790;
  v23[1] = *(_OWORD *)&off_1E0F4F7A0;
  v24 = __NSMDVequal;
  objc_msgSend(v18, "setCreateResultFunction:withContext:callbacks:", __NSMetadataCreateResult, self, v23);
  objc_msgSend(self->_private[5], "setCreateValueFunction:withContext:callbacks:", __NSMetadataCreateValue, self, v23);
  if (objc_msgSend(self->_private[1], "count"))
    objc_msgSend(self->_private[5], "setSortComparator:withContext:", __NSMetadataSortCompare, self);
  if (objc_msgSend(self->_private[10], "count"))
    objc_msgSend(self->_private[5], "setSearchScope:withOptions:", self->_private[10], 0);
  v19 = -[NSMetadataQuery operationQueue](self, "operationQueue");
  if (v19)
    objc_msgSend(self->_private[5], "setQueryQueue:", v19);
  -[NSMetadataQuery _setBatchingParams](self, "_setBatchingParams");
  if (LODWORD(self->_flags) >= 0x10000)
    objc_msgSend(self->_private[5], "disableUpdates");
  if (objc_msgSend(self->_private[10], "containsObject:", CFSTR("NSMetadataQueryExternalDocumentsScope")))
  {
    v20 = self->_private[5];
    v21 = -[NSMetadataQuery _externalDocumentsBundleIdentifier](self, "_externalDocumentsBundleIdentifier");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v20, "performSelector:withObject:", sel_setExternalDocumentsBundleIdentifier_, v21);
  }
  -[NSNotificationCenter addObserver:selector:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel__noteNote1_, CFSTR("__kMDQueryWillChangeNotification"), self->_private[5]);
  -[NSNotificationCenter addObserver:selector:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel__noteNote2_, CFSTR("kMDQueryProgressNotification"), self->_private[5]);
  -[NSNotificationCenter addObserver:selector:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel__noteNote3_, CFSTR("kMDQueryDidUpdateNotification"), self->_private[5]);
  -[NSNotificationCenter addObserver:selector:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel__noteNote4_, CFSTR("kMDQueryDidFinishNotification"), self->_private[5]);

  self->_private[9] = 0;
  if (objc_msgSend(self->_private[5], "executeWithOptions:", 0))
  {
    if (!v19)
      self->_private[9] = (id)objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    -[NSMetadataQuery willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isGathering"));
    LODWORD(self->_flags) |= 4u;
    -[NSMetadataQuery didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isGathering"));
    -[NSMetadataQuery _postNotificationName:userInfo:](self, "_postNotificationName:userInfo:", CFSTR("NSMetadataQueryDidStartGatheringNotification"), 0);
  }
  else
  {
    -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, CFSTR("__kMDQueryWillChangeNotification"), self->_private[5]);
    -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, CFSTR("kMDQueryProgressNotification"), self->_private[5]);
    -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, CFSTR("kMDQueryDidUpdateNotification"), self->_private[5]);
    -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, CFSTR("kMDQueryDidFinishNotification"), self->_private[5]);

    self->_private[5] = 0;
    -[NSMetadataQuery _resetQueryState](self, "_resetQueryState");
  }
}

- (BOOL)startQuery
{
  int flags;

  if (!self->_private[0])
    return 0;
  if ((self->_flags & 3) == 1)
    return 0;
  -[NSMetadataQuery _recreateQuery](self, "_recreateQuery");
  if (!self->_private[5])
    return 0;
  flags = self->_flags;
  if ((flags & 2) != 0)
  {
    -[NSMetadataQuery willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isStopped"));
    LODWORD(self->_flags) &= ~2u;
    -[NSMetadataQuery didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isStopped"));
    flags = self->_flags;
  }
  if ((flags & 1) == 0)
  {
    -[NSMetadataQuery willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isStarted"));
    LODWORD(self->_flags) |= 1u;
    -[NSMetadataQuery didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isStarted"));
  }
  return 1;
}

- (void)_inOriginalContextInvokeBlock:(id)a3
{
  NSOperationQueue *v5;
  uint64_t v6;
  id v7;
  __CFRunLoop *v8;

  if (-[NSMetadataQuery operationQueue](self, "operationQueue"))
  {
    v5 = +[NSOperationQueue currentQueue](NSOperationQueue, "currentQueue");
    if (v5 != -[NSMetadataQuery operationQueue](self, "operationQueue"))
    {
      -[NSOperationQueue addOperationWithBlock:](-[NSMetadataQuery operationQueue](self, "operationQueue"), "addOperationWithBlock:", a3);
      return;
    }
  }
  else if (self->_private[9])
  {
    v6 = objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v7 = self->_private[9];
    if ((id)v6 != v7)
    {
      v8 = (__CFRunLoop *)objc_msgSend(v7, "getCFRunLoop");
      CFRunLoopPerformBlock(v8, (CFTypeRef)*MEMORY[0x1E0C9B280], a3);
      CFRunLoopWakeUp(v8);
      return;
    }
  }
  (*((void (**)(id))a3 + 2))(a3);
}

- (void)stopQuery
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  if (self->_private[5])
  {
    if ((self->_flags & 2) == 0)
    {
      -[NSMetadataQuery willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isStopped"));
      objc_msgSend(self->_private[5], "stop");
      LODWORD(self->_flags) |= 2u;
      -[NSMetadataQuery didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isStopped"));
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __28__NSMetadataQuery_stopQuery__block_invoke;
      v3[3] = &unk_1E0F4D2D8;
      v3[4] = self;
      -[NSMetadataQuery _inOriginalContextInvokeBlock:](self, "_inOriginalContextInvokeBlock:", v3);
    }
  }
}

uint64_t __28__NSMetadataQuery_stopQuery__block_invoke(uint64_t a1)
{
  _DWORD *v2;
  int v3;

  v2 = *(_DWORD **)(a1 + 32);
  v3 = v2[2];
  if ((v3 & 4) != 0)
  {
    objc_msgSend(v2, "willChangeValueForKey:", CFSTR("isGathering"));
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8) &= ~4u;
    objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("isGathering"));
    v2 = *(_DWORD **)(a1 + 32);
    v3 = v2[2];
  }
  if ((v3 & 0x80) != 0)
  {
    v2[2] = v3 & 0xFFFFFF7F;
    objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("results"));
  }
  -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", *(_QWORD *)(a1 + 32), CFSTR("__kMDQueryWillChangeNotification"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
  -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", *(_QWORD *)(a1 + 32), CFSTR("kMDQueryProgressNotification"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
  -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", *(_QWORD *)(a1 + 32), CFSTR("kMDQueryDidUpdateNotification"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
  return -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", *(_QWORD *)(a1 + 32), CFSTR("kMDQueryDidFinishNotification"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
}

- (BOOL)isStarted
{
  return self->_flags & 1;
}

- (BOOL)isGathering
{
  return (LOBYTE(self->_flags) >> 2) & 1;
}

- (BOOL)isStopped
{
  return (LOBYTE(self->_flags) >> 1) & 1;
}

- (void)disableUpdates
{
  int v2;
  id v3;

  v2 = WORD1(self->_flags) << 16;
  WORD1(self->_flags) = (v2 + 0x10000) >> 16;
  if (!v2)
  {
    v3 = self->_private[5];
    if (v3)
      objc_msgSend(v3, "disableUpdates");
  }
}

- (void)enableUpdates
{
  unsigned int flags;
  id v3;

  flags = self->_flags;
  if (flags >= 0x10000)
  {
    LODWORD(self->_flags) = ((self->_flags & 0xFFFF0000) - 0x10000) & 0xFFFF0000 | (unsigned __int16)LODWORD(self->_flags);
    if ((flags & 0xFFFF0000) == 0x10000)
    {
      v3 = self->_private[5];
      if (v3)
        objc_msgSend(v3, "enableUpdates");
    }
  }
}

- (void)_disableAutoUpdates
{
  id v3;
  id v4;

  v3 = self->_private[4];
  if (v3)
  {
    objc_msgSend(v3, "invalidate");

    self->_private[4] = 0;
  }
  else
  {
    v4 = self->_private[5];
    if (v4)
    {
      objc_msgSend(v4, "setSendHasUpdateNotification:", 0);
      -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, CFSTR("kMDQueryHasUpdateNotification"), self->_private[5]);
    }
  }
}

- (void)_enableAutoUpdates
{
  if (self->_private[5])
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[NSNotificationCenter addObserver:selector:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel__noteNote5_, CFSTR("kMDQueryHasUpdateNotification"), self->_private[5]);
      objc_msgSend(self->_private[5], "setSendHasUpdateNotification:", 1);
    }
    else
    {
      self->_private[4] = (id)objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__update, 0, 1, 0.1);
    }
  }
}

- (void)_update
{
  id v3;

  if (LODWORD(self->_flags) >= 0x10000)
  {
    if (self->_private[5])
    {
      objc_sync_enter(self);
      v3 = *((id *)self->_reserved + 1);
      objc_sync_exit(self);
      objc_msgSend(self->_private[5], "enableUpdates");
      objc_msgSend(self->_private[5], "processUpdates");
      objc_msgSend(self->_private[5], "disableUpdates");

    }
  }
}

- (NSUInteger)resultCount
{
  NSUInteger result;

  result = (NSUInteger)self->_private[5];
  if (result)
    return objc_msgSend((id)result, "resultCount");
  return result;
}

- (id)resultAtIndex:(NSUInteger)idx
{
  id v6;
  void *v8;

  v6 = self->_private[5];
  if (!v6 || objc_msgSend(v6, "resultCount") <= (uint64_t)idx)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: index (%ld) out of bounds (%ld)"), _NSMethodExceptionProem((objc_class *)self, a2), idx, -[NSMetadataQuery resultCount](self, "resultCount")), 0);
    objc_exception_throw(v8);
  }
  return (id)objc_msgSend(self->_private[5], "resultAtIndex:", idx);
}

- (void)enumerateResultsUsingBlock:(void *)block
{
  void *v3;

  if (!block)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: block cannot be nil"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v3);
  }
  -[NSMetadataQuery enumerateResultsWithOptions:usingBlock:](self, "enumerateResultsWithOptions:usingBlock:", 0, block);
}

- (void)enumerateResultsWithOptions:(NSEnumerationOptions)opts usingBlock:(void *)block
{
  _NSMetadataQueryResultArray *v7;
  void *v8;

  if (!block)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: block cannot be nil"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v8);
  }
  -[NSMetadataQuery disableUpdates](self, "disableUpdates");
  v7 = [_NSMetadataQueryResultArray alloc];
  if (v7)
    v7->_query = self;
  -[_NSMetadataQueryResultArray enumerateObjectsWithOptions:usingBlock:](v7, "enumerateObjectsWithOptions:usingBlock:", opts, block);

  -[NSMetadataQuery enableUpdates](self, "enableUpdates");
}

- (void)_zapResultArrayIfIdenticalTo:(id)a3
{
  if (*((id *)self->_reserved + 1) == a3)
  {
    -[NSMetadataQuery _disableAutoUpdates](self, "_disableAutoUpdates");
    *((_QWORD *)self->_reserved + 1) = 0;
    -[NSMetadataQuery enableUpdates](self, "enableUpdates");
  }
}

- (NSArray)results
{
  void *v3;
  _NSMetadataQueryResultArray *v4;
  id v5;

  if (!self->_private[5])
    return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  objc_sync_enter(self);
  v3 = (void *)*((_QWORD *)self->_reserved + 1);
  if (!v3)
  {
    -[NSMetadataQuery disableUpdates](self, "disableUpdates");
    v4 = [_NSMetadataQueryResultArray alloc];
    if (v4)
      v4->_query = self;
    *((_QWORD *)self->_reserved + 1) = v4;
    -[NSMetadataQuery _enableAutoUpdates](self, "_enableAutoUpdates");
    v3 = (void *)*((_QWORD *)self->_reserved + 1);
  }
  v5 = v3;
  objc_sync_exit(self);
  return (NSArray *)v5;
}

- (NSUInteger)indexOfResult:(id)result
{
  id v3;
  NSUInteger v4;

  v3 = self->_private[5];
  if (!v3)
    return 0x7FFFFFFFFFFFFFFFLL;
  v4 = objc_msgSend(v3, "indexOfResult:", result);
  if (v4 == -1)
    return 0x7FFFFFFFFFFFFFFFLL;
  return v4;
}

- (NSDictionary)valueLists
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSMetadataQueryAttributeValueTuple *v14;
  id v15;
  id obj;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[128];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!self->_private[5])
    return (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v19 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = self->_private[2];
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
  if (v20)
  {
    v18 = *(_QWORD *)v29;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v29 != v18)
          objc_enumerationMutation(obj);
        v21 = v3;
        v4 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v3);
        v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v6 = (void *)objc_msgSend((id)objc_msgSend(self->_private[5], "valuesOfAttribute:", v4), "copy");
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v24;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v24 != v9)
                objc_enumerationMutation(v6);
              v11 = -[NSMetadataQueryAttributeValueTuple _init:attribute:value:count:]([NSMetadataQueryAttributeValueTuple alloc], "_init:attribute:value:count:", self, v4, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i), objc_msgSend(self->_private[5], "countOfResultsForAttributeName:value:", v4, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i)));
              objc_msgSend(v5, "addObject:", v11);

            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
          }
          while (v8);
        }
        if (v6)
          CFRelease(v6);
        v12 = objc_msgSend(self->_private[5], "countOfResultsForAttributeName:value:", v4, 0);
        if (v12 >= 1)
        {
          v13 = v12;
          v14 = [NSMetadataQueryAttributeValueTuple alloc];
          v15 = -[NSMetadataQueryAttributeValueTuple _init:attribute:value:count:](v14, "_init:attribute:value:count:", self, v4, objc_msgSend(MEMORY[0x1E0C99E38], "null"), v13);
          objc_msgSend(v5, "addObject:", v15);

        }
        objc_msgSend(v19, "addObject:", v5);
        v3 = v21 + 1;
      }
      while (v21 + 1 != v20);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
    }
    while (v20);
  }
  return (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:", v19, self->_private[2]);
}

- (NSArray)groupedResults
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  id v9;

  if (!self->_private[5] || !objc_msgSend(self->_private[3], "count"))
    return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v3 = -[NSMetadataQuery resultCount](self, "resultCount");
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = objc_msgSend(self->_private[3], "objectAtIndex:", 0);
  if (v3 >= 1)
  {
    v6 = v5;
    for (i = 0; i != v3; ++i)
    {
      v8 = -[NSMetadataQuery valueOfAttribute:forResultAtIndex:](self, "valueOfAttribute:forResultAtIndex:", v6, i);
      if (!v8)
        v8 = (id)objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (id)objc_msgSend(v4, "objectForKey:", v8);
      if (!v9)
      {
        v9 = -[NSMetadataQueryResultGroup _init:attributes:index:value:]([NSMetadataQueryResultGroup alloc], "_init:attributes:index:value:", self, self->_private[3], 0, v8);
        objc_msgSend(v4, "setObject:forKey:", v9, v8);

      }
      objc_msgSend(v9, "_addResult:", i);
    }
  }
  return (NSArray *)objc_msgSend(v4, "allValues");
}

- (id)valueOfAttribute:(NSString *)attrName forResultAtIndex:(NSUInteger)idx
{
  NSString *v7;
  id v8;
  id result;
  void *v10;

  if (attrName == (NSString *)CFSTR("NSMetadataQueryResultContentRelevanceAttribute"))
    v7 = (NSString *)CFSTR("kMDQueryResultContentRelevance");
  else
    v7 = attrName;
  v8 = self->_private[5];
  if (!v8 || objc_msgSend(v8, "resultCount") <= (uint64_t)idx)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: index (%ld) out of bounds (%ld)"), _NSMethodExceptionProem((objc_class *)self, a2), idx, -[NSMetadataQuery resultCount](self, "resultCount")), 0);
    objc_exception_throw(v10);
  }
  result = (id)objc_msgSend(self->_private[5], "attributeValueForName:forResultAtIndex:", v7, idx);
  if ((self->_flags & 0x40) != 0)
    return (id)objc_msgSend(self->_private[8], "metadataQuery:replacementValueForAttribute:value:", self, v7, result);
  return result;
}

- (id)_pendingChangeNotificationsArrayForKey:(id)a3 create:(BOOL)a4
{
  _BOOL8 v4;
  id result;
  BOOL v8;
  objc_super v9;
  uint64_t v10;

  v4 = a4;
  v10 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("results"))
    && -[NSMetadataQuery operationQueue](self, "operationQueue"))
  {
    result = (id)*((_QWORD *)self->_reserved + 2);
    if (result)
      v8 = 1;
    else
      v8 = !v4;
    if (!v8)
    {
      *((_QWORD *)self->_reserved + 2) = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE30], 0, &NSKVOPendingNotificationStackIdentifierCallbacks, MEMORY[0x1E0C9B3A0]);
      return (id)*((_QWORD *)self->_reserved + 2);
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NSMetadataQuery;
    return -[NSMetadataQuery _pendingChangeNotificationsArrayForKey:create:](&v9, sel__pendingChangeNotificationsArrayForKey_create_, a3, v4);
  }
  return result;
}

- (void)removeObserver:(id)a3 forKeyPath:(id)a4
{
  NSOperationQueue *v7;
  NSString *v8;
  const char *label;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("results"))
    && !-[NSMetadataQuery _canModifyQueryOrObserversInCurrentContext](self, "_canModifyQueryOrObserversInCurrentContext"))
  {
    if (-[NSMetadataQuery operationQueue](self, "operationQueue"))
    {
      v7 = +[NSOperationQueue currentQueue](NSOperationQueue, "currentQueue");
      v8 = -[NSOperationQueue name](v7, "name");
      if (!-[NSString length](v8, "length"))
      {
        label = dispatch_queue_get_label(0);
        if (label)
          v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", label);
      }
      if (!-[NSString length](v8, "length"))
      {
        if (v7)
          v8 = -[NSOperationQueue description](v7, "description");
        else
          v8 = (NSString *)CFSTR("an unknown queue");
      }
      NSLog((NSString *)CFSTR("%@: A Key-Value Observer of NSMetadataQuery.results for this instance was removed, while the query was still running, on %@ instead of NSMetadataQuery.operationQueue, which is %@. To avoid race conditions, you should either ensure the query is stopped before removing observers, or remove them on the NSMetadataQuery.operationQueue"), self, v8, -[NSMetadataQuery operationQueue](self, "operationQueue"));
    }
    else
    {
      NSLog((NSString *)CFSTR("%@: A Key-Value Observer of NSMetadataQuery.results for this instance was removed, while the query was still running, on NSRunLoop %p instead of the NSRunLoop it was started on, which is %p. To avoid race conditions, you shouuld either ensure the query is stopped before removing observers, or remove them on the same NSRunLoop that the query was started on."), self, objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop"), self->_private[9]);
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)NSMetadataQuery;
  -[NSMetadataQuery removeObserver:forKeyPath:](&v10, sel_removeObserver_forKeyPath_, a3, a4);
}

- (BOOL)_isMDQuery
{
  return (LOBYTE(self->_flags) >> 4) & 1;
}

+ (id)willBeginPossibleMoveOfItemAtURL:(id)a3 toURL:(id)a4
{
  return (id)objc_msgSend((id)objc_msgSend(a1, "_stitchingClass"), "willBeginPossibleMoveOfItemAtURL:toURL:", a3, a4);
}

+ (void)didEndPossibleFileOperation:(id)a3
{
  objc_msgSend((id)objc_msgSend(a1, "_stitchingClass"), "didEndPossibleFileOperation:", a3);
}

@end
