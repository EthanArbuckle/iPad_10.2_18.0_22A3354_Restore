@implementation ICCRTTCompatibleDocument

- (ICCRTTCompatibleDocument)initWithVersion:(id)a3 startVersion:(id)a4 rootObject:(id)a5 replica:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  TTICCRVectorMultiTimestamp *v14;
  ICCRTTCompatibleDocument *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[TTICCRVectorMultiTimestamp initWithCapacity:]([TTICCRVectorMultiTimestamp alloc], "initWithCapacity:", 2);
  v15 = -[ICCRTTCompatibleDocument initWithVersion:startVersion:rootObject:replica:topoTimestamp:](self, "initWithVersion:startVersion:rootObject:replica:topoTimestamp:", v13, v12, v11, v10, v14);

  return v15;
}

- (ICCRTTCompatibleDocument)initWithVersion:(id)a3 startVersion:(id)a4 rootObject:(id)a5 replica:(id)a6 topoTimestamp:(id)a7
{
  id v12;
  ICCRTTCompatibleDocument *v13;
  ICCRTTCompatibleDocument *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v12 = a7;
  v18.receiver = self;
  v18.super_class = (Class)ICCRTTCompatibleDocument;
  v13 = -[ICCRDocument initWithVersion:startVersion:rootObject:replica:](&v18, sel_initWithVersion_startVersion_rootObject_replica_, a3, a4, a5, a6);
  v14 = v13;
  if (v13)
  {
    -[ICCRTTCompatibleDocument setSharedTopotextTimestamp:](v13, "setSharedTopotextTimestamp:", v12);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCRTTCompatibleDocument setStringsWithClocksNeedingUpdating:](v14, "setStringsWithClocksNeedingUpdating:", v15);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCRTTCompatibleDocument setStringsWithClocksToResetAfterRealizingLocalChanges:](v14, "setStringsWithClocksToResetAfterRealizingLocalChanges:", v16);

  }
  return v14;
}

+ (id)makeSharedTopotextTimestampFromData:(id)a3
{
  id v3;
  TTICCRVectorMultiTimestamp *v4;

  v3 = a3;
  v4 = -[ICTTVectorMultiTimestamp initWithData:andCapacity:]([TTICCRVectorMultiTimestamp alloc], "initWithData:andCapacity:", v3, 2);

  return v4;
}

- (unint64_t)mergeResultForMergingWithDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  unint64_t v9;
  objc_super v11;

  v4 = a3;
  objc_opt_class();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (-[ICCRTTCompatibleDocument sharedTopotextTimestamp](self, "sharedTopotextTimestamp"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "sharedTopotextTimestamp"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v6, "compareTo:", v7),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    v9 = 2;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)ICCRTTCompatibleDocument;
    v9 = -[ICCRDocument mergeResultForMergingWithDocument:](&v11, sel_mergeResultForMergingWithDocument_, v4);
  }

  return v9;
}

- (void)mergeTimestampWithDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ICCRTTCompatibleDocument;
  -[ICCRDocument mergeTimestampWithDocument:](&v19, sel_mergeTimestampWithDocument_, v4);
  objc_opt_class();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[ICCRTTCompatibleDocument sharedTopotextTimestamp](self, "sharedTopotextTimestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sharedTopotextTimestamp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mergeWithTimestamp:", v7);

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[ICCRTTCompatibleDocument stringsWithClocksNeedingUpdating](self, "stringsWithClocksNeedingUpdating", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v13, "updateClock");
          objc_msgSend(v13, "checkTimestampLogStyleErrors:", 1);
          objc_msgSend(v13, "resetLocalReplicaClocksToTimestampValues");
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v10);
    }

    -[ICCRTTCompatibleDocument stringsWithClocksNeedingUpdating](self, "stringsWithClocksNeedingUpdating");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeAllObjects");

  }
}

- (void)realizeLocalChanges
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)ICCRTTCompatibleDocument;
  -[ICCRDocument realizeLocalChanges](&v15, sel_realizeLocalChanges);
  -[ICCRTTCompatibleDocument stringsWithClocksToResetAfterRealizingLocalChanges](self, "stringsWithClocksToResetAfterRealizingLocalChanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  -[ICCRTTCompatibleDocument stringsWithClocksToResetAfterRealizingLocalChanges](self, "stringsWithClocksToResetAfterRealizingLocalChanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "resetLocalReplicaClocksToTimestampValues", (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v8);
  }

}

- (TTICCRVectorMultiTimestamp)sharedTopotextTimestamp
{
  return self->_sharedTopotextTimestamp;
}

- (void)setSharedTopotextTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_sharedTopotextTimestamp, a3);
}

- (NSMutableArray)stringsWithClocksNeedingUpdating
{
  return self->_stringsWithClocksNeedingUpdating;
}

- (void)setStringsWithClocksNeedingUpdating:(id)a3
{
  objc_storeStrong((id *)&self->_stringsWithClocksNeedingUpdating, a3);
}

- (NSMutableArray)stringsWithClocksToResetAfterRealizingLocalChanges
{
  return self->_stringsWithClocksToResetAfterRealizingLocalChanges;
}

- (void)setStringsWithClocksToResetAfterRealizingLocalChanges:(id)a3
{
  objc_storeStrong((id *)&self->_stringsWithClocksToResetAfterRealizingLocalChanges, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringsWithClocksToResetAfterRealizingLocalChanges, 0);
  objc_storeStrong((id *)&self->_stringsWithClocksNeedingUpdating, 0);
  objc_storeStrong((id *)&self->_sharedTopotextTimestamp, 0);
}

@end
