@implementation PFUbiquityPeerSnapshot

- (PFUbiquityPeerSnapshot)initWithTranasctionEntry:(id)a3 andLogSnapshot:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a3)
    v7 = *((_QWORD *)a3 + 3);
  else
    v7 = 0;
  v8 = objc_msgSend(a3, "transactionNumber");
  v9 = objc_msgSend(a3, "transactionDate");
  if (a3)
    v10 = *((_QWORD *)a3 + 7);
  else
    v10 = 0;
  return -[PFUbiquityPeerSnapshot initWithExportingPeerID:logSnapshot:transactionNumber:transactionDate:andKnowledgeVector:](self, "initWithExportingPeerID:logSnapshot:transactionNumber:transactionDate:andKnowledgeVector:", v7, a4, v8, v9, v10);
}

- (PFUbiquityPeerSnapshot)initWithExportingPeerID:(id)a3 logSnapshot:(id)a4 transactionNumber:(id)a5 transactionDate:(id)a6 andKnowledgeVector:(id)a7
{
  PFUbiquityPeerSnapshot *v12;
  PFUbiquityKnowledgeVector *v13;

  v12 = -[PFUbiquityPeerSnapshot init](self, "init");
  if (v12)
  {
    v12->_exportingPeerID = (NSString *)a3;
    v12->_logSnapshot = (NSDictionary *)a4;
    v12->_transactionNumber = (NSNumber *)a5;
    v12->_transactionDate = (NSDate *)a6;
    v13 = (PFUbiquityKnowledgeVector *)a7;
    v12->_diffFromPrevious = 0;
    v12->_kv = v13;
  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  self->_exportingPeerID = 0;
  self->_logSnapshot = 0;

  self->_transactionNumber = 0;
  self->_transactionDate = 0;

  self->_kv = 0;
  self->_diffFromPrevious = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityPeerSnapshot;
  -[PFUbiquityPeerSnapshot dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  PFUbiquityKnowledgeVector *kv;
  uint64_t v6;
  NSString *exportingPeerID;
  uint64_t v8;
  NSNumber *transactionNumber;
  uint64_t v10;
  NSDate *transactionDate;
  uint64_t v12;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  if (self)
  {
    kv = self->_kv;
    if (a3)
    {
LABEL_4:
      v6 = *((_QWORD *)a3 + 3);
      goto LABEL_5;
    }
  }
  else
  {
    kv = 0;
    if (a3)
      goto LABEL_4;
  }
  v6 = 0;
LABEL_5:
  if (!-[PFUbiquityKnowledgeVector isEqual:](kv, "isEqual:", v6))
    return 0;
  if (self)
  {
    exportingPeerID = self->_exportingPeerID;
    if (a3)
    {
LABEL_8:
      v8 = *((_QWORD *)a3 + 6);
      goto LABEL_9;
    }
  }
  else
  {
    exportingPeerID = 0;
    if (a3)
      goto LABEL_8;
  }
  v8 = 0;
LABEL_9:
  if (!-[NSString isEqualToString:](exportingPeerID, "isEqualToString:", v8))
    return 0;
  if (self)
  {
    transactionNumber = self->_transactionNumber;
    if (a3)
    {
LABEL_12:
      v10 = *((_QWORD *)a3 + 4);
      goto LABEL_13;
    }
  }
  else
  {
    transactionNumber = 0;
    if (a3)
      goto LABEL_12;
  }
  v10 = 0;
LABEL_13:
  if (-[NSNumber isEqual:](transactionNumber, "isEqual:", v10))
  {
    if (self)
    {
      transactionDate = self->_transactionDate;
      if (a3)
      {
LABEL_16:
        v12 = *((_QWORD *)a3 + 5);
        return -[NSDate isEqual:](transactionDate, "isEqual:", v12);
      }
    }
    else
    {
      transactionDate = 0;
      if (a3)
        goto LABEL_16;
    }
    v12 = 0;
    return -[NSDate isEqual:](transactionDate, "isEqual:", v12);
  }
  return 0;
}

- (id)description
{
  void *v3;
  id v4;
  PFUbiquityKnowledgeVector *kv;
  NSNumber *transactionNumber;
  NSString *exportingPeerID;
  NSDate *transactionDate;
  NSDictionary *logSnapshot;
  NSMutableDictionary *diffFromPrevious;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)PFUbiquityPeerSnapshot;
  v4 = -[PFUbiquityPeerSnapshot description](&v12, sel_description);
  if (self)
  {
    kv = self->_kv;
    transactionNumber = self->_transactionNumber;
    transactionDate = self->_transactionDate;
    exportingPeerID = self->_exportingPeerID;
    logSnapshot = self->_logSnapshot;
    diffFromPrevious = self->_diffFromPrevious;
  }
  else
  {
    logSnapshot = 0;
    transactionNumber = 0;
    kv = 0;
    exportingPeerID = 0;
    transactionDate = 0;
    diffFromPrevious = 0;
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@\n\texportingPeerID: %@, transactionNumber: %@, transactionDate: %@\nLog Snapshot: %@\nDiff: %@\n"), v4, kv, exportingPeerID, transactionNumber, transactionDate, logSnapshot, diffFromPrevious);
}

- (int64_t)compare:(id)a3
{
  if (self)
    self = (PFUbiquityPeerSnapshot *)self->_kv;
  if (a3)
    a3 = (id)*((_QWORD *)a3 + 3);
  return -[PFUbiquityPeerSnapshot compare:](self, "compare:", a3);
}

- (void)computeDiffToPreviousSnapshot:(uint64_t)a1
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);

    *(_QWORD *)(a1 + 16) = 0;
    if (a2)
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", objc_msgSend(*(id *)(a1 + 8), "allKeys"));
      objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(*(id *)(a2 + 8), "allKeys"));
      objc_msgSend(v4, "addEntriesFromDictionary:", *(_QWORD *)(a2 + 16));
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v15;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v15 != v8)
              objc_enumerationMutation(v5);
            v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
            v11 = (void *)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", v10);
            v12 = objc_msgSend(*(id *)(a2 + 16), "objectForKey:", v10);
            if (!v12)
              v12 = objc_msgSend(*(id *)(a2 + 8), "objectForKey:", v10);
            if (v11 != (void *)v12 && (objc_msgSend(v11, "isEqual:") & 1) == 0)
            {
              if (v11)
              {
                if (objc_msgSend(v11, "isNSSet"))
                {
                  v13 = -[PFUbiquityToManyConflictDiff initForRelationshipAtKey:]([PFUbiquityToManyConflictDiff alloc], "initForRelationshipAtKey:", v10);
                  -[PFUbiquityToManyConflictDiff diffWithLogSnapshot:andPreviousSnapshot:]((uint64_t)v13, a1, a2);
                  objc_msgSend(v4, "setObject:forKey:", v13, v10);

                }
                else
                {
                  objc_msgSend(v4, "setObject:forKey:", v11, v10);
                }
              }
              else
              {
                objc_msgSend(v4, "removeObjectForKey:", v10);
              }
            }
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v7);
      }
      *(_QWORD *)(a1 + 16) = v4;

    }
    else
    {
      *(_QWORD *)(a1 + 16) = v4;
    }
  }
}

- (uint64_t)removeValuesChangedByPeerSnapshot:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v4 = a2 ? *(void **)(a2 + 16) : 0;
    v5 = (void *)objc_msgSend(v4, "allKeys");
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (result)
    {
      v6 = result;
      v7 = *(_QWORD *)v14;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
          v10 = (void *)objc_msgSend(*(id *)(v3 + 16), "objectForKey:", v9);
          if (a2)
            v11 = *(void **)(a2 + 16);
          else
            v11 = 0;
          v12 = objc_msgSend(v11, "objectForKey:", v9);
          if (v10 == (void *)v12 || objc_msgSend(v10, "isEqual:", v12))
            objc_msgSend(*(id *)(v3 + 16), "removeObjectForKey:", v9);
          ++v8;
        }
        while (v6 != v8);
        result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        v6 = result;
      }
      while (result);
    }
  }
  return result;
}

@end
