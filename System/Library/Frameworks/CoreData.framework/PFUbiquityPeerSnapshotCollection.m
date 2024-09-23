@implementation PFUbiquityPeerSnapshotCollection

- (PFUbiquityPeerSnapshotCollection)init
{
  PFUbiquityPeerSnapshotCollection *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PFUbiquityPeerSnapshotCollection;
  v2 = -[PFUbiquityPeerSnapshotCollection init](&v4, sel_init);
  if (v2)
  {
    v2->_peerIDToTransactionNumberToSnapshot = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_peerIDToTranasctionNumberToKnowledgeVector = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_kvToSnapshot = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_peerSnapshots = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v2->_needSort = 0;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  self->_peerSnapshots = 0;
  self->_peerIDToTranasctionNumberToKnowledgeVector = 0;

  self->_peerIDToTransactionNumberToSnapshot = 0;
  self->_kvToSnapshot = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityPeerSnapshotCollection;
  -[PFUbiquityPeerSnapshotCollection dealloc](&v3, sel_dealloc);
}

- (uint64_t)addSnapshot:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v4 = *(void **)(result + 8);
    if (a2)
      v5 = a2[6];
    else
      v5 = 0;
    v6 = (id)objc_msgSend(v4, "objectForKey:", v5);
    if (!v6)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      if (a2)
        v7 = a2[6];
      else
        v7 = 0;
      objc_msgSend(*(id *)(v3 + 8), "setObject:forKey:", v6, v7);

    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    if (a2 && (v8 = a2[3]) != 0)
      v9 = (void *)objc_msgSend(*(id *)(v8 + 8), "allKeys");
    else
      v9 = 0;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v25;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v13);
          if (a2)
            v15 = a2[6];
          else
            v15 = 0;
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v13), "isEqualToString:", v15) & 1) == 0)
          {
            v16 = (id)objc_msgSend(*(id *)(v3 + 16), "objectForKey:", v14);
            if (!v16)
            {
              v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
              objc_msgSend(*(id *)(v3 + 16), "setObject:forKey:", v16, v14);

            }
            if (a2 && (v17 = a2[3]) != 0)
              v18 = objc_msgSend(*(id *)(v17 + 8), "objectForKey:", v14);
            else
              v18 = 0;
            v19 = (id)objc_msgSend(v16, "objectForKey:", v18);
            if (!v19)
            {
              v19 = objc_alloc_init(MEMORY[0x1E0C99E20]);
              objc_msgSend(v16, "setObject:forKey:", v19, v18);

            }
            if (a2)
              v20 = a2[3];
            else
              v20 = 0;
            objc_msgSend(v19, "addObject:", v20);
          }
          ++v13;
        }
        while (v11 != v13);
        v21 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        v11 = v21;
      }
      while (v21);
    }
    if (a2)
      v22 = a2[4];
    else
      v22 = 0;
    objc_msgSend(v6, "setObject:forKey:", a2, v22);
    if ((objc_msgSend(*(id *)(v3 + 32), "containsObject:", a2) & 1) == 0)
      objc_msgSend(*(id *)(v3 + 32), "addObject:", a2);
    if (a2)
      v23 = a2[3];
    else
      v23 = 0;
    result = objc_msgSend(*(id *)(v3 + 24), "setObject:forKey:", a2, v23);
    *(_BYTE *)(v3 + 40) = 1;
  }
  return result;
}

- (BOOL)calculateSnapshotDiffsWithError:(uint64_t)a1
{
  void *v2;
  uint64_t i;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 v10;
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
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (*(_BYTE *)(a1 + 40))
      objc_msgSend(*(id *)(a1 + 32), "sortUsingSelector:", sel_compare_);
    v2 = (void *)objc_msgSend(*(id *)(a1 + 8), "allKeys");
    v22 = objc_msgSend(*(id *)(a1 + 32), "count");
    if (v22 >= 1)
    {
      for (i = 0; i != v22; ++i)
      {
        v4 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", i);
        v5 = v4;
        v6 = i;
        if (i)
        {
          do
          {
            v7 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v6 - 1);
            v8 = v7;
            if (v7)
              v7 = *(_QWORD *)(v7 + 24);
            if (v5)
              v9 = *(_QWORD *)(v5 + 24);
            else
              v9 = 0;
            v10 = -[PFUbiquityKnowledgeVector isAncestorOfKnowledgeVector:]((id *)v7, v9);
            if (v6 < 2)
              break;
            --v6;
          }
          while ((v10 & 1) == 0);
          if (v8)
            v11 = v8;
          else
            v11 = 0;
          -[PFUbiquityPeerSnapshot computeDiffToPreviousSnapshot:](v5, v11);
          v25 = 0u;
          v26 = 0u;
          v23 = 0u;
          v24 = 0u;
          v12 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v24;
            do
            {
              v15 = 0;
              do
              {
                if (*(_QWORD *)v24 != v14)
                  objc_enumerationMutation(v2);
                v16 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v15);
                if (v5)
                {
                  if ((objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v15), "isEqualToString:", *(_QWORD *)(v5 + 48)) & 1) == 0)
                  {
                    v17 = *(_QWORD *)(v5 + 24);
                    if (v17)
                    {
                      v18 = objc_msgSend(*(id *)(v17 + 8), "objectForKey:", v16);
                      if (v18)
                      {
                        v19 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", v16), "objectForKey:", v18);
                        if (v19)
                          -[PFUbiquityPeerSnapshot removeValuesChangedByPeerSnapshot:](v5, v19);
                      }
                    }
                  }
                }
                else
                {
                  objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v15), "isEqualToString:", 0);
                }
                ++v15;
              }
              while (v13 != v15);
              v20 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
              v13 = v20;
            }
            while (v20);
          }
          if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Generated diff for snapshot: %@\n Previous snapshot: %@"), "-[PFUbiquityPeerSnapshotCollection calculateSnapshotDiffsWithError:]", 166, v5, v8);
        }
        else
        {
          -[PFUbiquityPeerSnapshot computeDiffToPreviousSnapshot:](v4, 0);
        }
      }
    }
  }
  return a1 != 0;
}

@end
