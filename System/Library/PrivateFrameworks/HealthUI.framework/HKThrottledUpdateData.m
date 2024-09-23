@implementation HKThrottledUpdateData

- (HKThrottledUpdateData)initWithSampleType:(id)a3
{
  id v5;
  HKThrottledUpdateData *v6;
  HKThrottledUpdateData *v7;
  uint64_t v8;
  NSHashTable *throttledObservers;
  NSMutableArray *v10;
  NSMutableArray *throttledSamplesAdded;
  NSMutableArray *v12;
  NSMutableArray *throttledDeletedObjects;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKThrottledUpdateData;
  v6 = -[HKThrottledUpdateData init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_throttledSampleType, a3);
    v7->_incomingUpdateCountSinceLastDrain = 0;
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 512, 5);
    throttledObservers = v7->_throttledObservers;
    v7->_throttledObservers = (NSHashTable *)v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    throttledSamplesAdded = v7->_throttledSamplesAdded;
    v7->_throttledSamplesAdded = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    throttledDeletedObjects = v7->_throttledDeletedObjects;
    v7->_throttledDeletedObjects = v12;

    v7->_lastDrainTime = CACurrentMediaTime();
  }

  return v7;
}

- (void)addThrottledObservers:(id)a3 samplesAdded:(id)a4 objectsRemoved:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v8);
        v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v14);
        -[HKThrottledUpdateData throttledObservers](self, "throttledObservers");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "containsObject:", v15);

        if ((v17 & 1) == 0)
        {
          -[HKThrottledUpdateData throttledObservers](self, "throttledObservers");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v15);

        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }
  -[HKThrottledUpdateData throttledSamplesAdded](self, "throttledSamplesAdded");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObjectsFromArray:", v9);

  -[HKThrottledUpdateData throttledDeletedObjects](self, "throttledDeletedObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObjectsFromArray:", v10);

  ++self->_incomingUpdateCountSinceLastDrain;
}

- (void)clearThrottlingData
{
  void *v3;
  void *v4;
  id v5;

  -[HKThrottledUpdateData throttledObservers](self, "throttledObservers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[HKThrottledUpdateData throttledSamplesAdded](self, "throttledSamplesAdded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[HKThrottledUpdateData throttledDeletedObjects](self, "throttledDeletedObjects");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

}

- (void)updateDrainTime
{
  self->_lastDrainTime = CACurrentMediaTime();
  self->_incomingUpdateCountSinceLastDrain = 0;
}

- (HKSampleType)throttledSampleType
{
  return self->_throttledSampleType;
}

- (int64_t)incomingUpdateCountSinceLastDrain
{
  return self->_incomingUpdateCountSinceLastDrain;
}

- (NSHashTable)throttledObservers
{
  return self->_throttledObservers;
}

- (NSMutableArray)throttledSamplesAdded
{
  return self->_throttledSamplesAdded;
}

- (NSMutableArray)throttledDeletedObjects
{
  return self->_throttledDeletedObjects;
}

- (double)lastDrainTime
{
  return self->_lastDrainTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_throttledDeletedObjects, 0);
  objc_storeStrong((id *)&self->_throttledSamplesAdded, 0);
  objc_storeStrong((id *)&self->_throttledObservers, 0);
  objc_storeStrong((id *)&self->_throttledSampleType, 0);
}

@end
