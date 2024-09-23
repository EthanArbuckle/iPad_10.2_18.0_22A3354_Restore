@implementation HMEPendingTopicsCombiner

- (HMEPendingTopicsCombiner)init
{
  HMEPendingTopicsCombiner *v2;
  uint64_t v3;
  NSMutableSet *addTopicFilters;
  uint64_t v5;
  NSMutableSet *removeTopicFilters;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMEPendingTopicsCombiner;
  v2 = -[HMEPendingTopicsCombiner init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    addTopicFilters = v2->_addTopicFilters;
    v2->_addTopicFilters = (NSMutableSet *)v3;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    removeTopicFilters = v2->_removeTopicFilters;
    v2->_removeTopicFilters = (NSMutableSet *)v5;

  }
  return v2;
}

- (void)combineWithAdditions:(id)a3 removals:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        -[HMEPendingTopicsCombiner addTopicFilters](self, "addTopicFilters");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "containsObject:", v12);

        if (v14)
        {
          -[HMEPendingTopicsCombiner addTopicFilters](self, "addTopicFilters");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "removeObject:", v12);
        }
        else
        {
          -[HMEPendingTopicsCombiner removeTopicFilters](self, "removeTopicFilters");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v12);
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v9);
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v16 = v6;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j);
        -[HMEPendingTopicsCombiner removeTopicFilters](self, "removeTopicFilters", (_QWORD)v25);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "containsObject:", v21);

        if (v23)
        {
          -[HMEPendingTopicsCombiner removeTopicFilters](self, "removeTopicFilters");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "removeObject:", v21);
        }
        else
        {
          -[HMEPendingTopicsCombiner addTopicFilters](self, "addTopicFilters");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v21);
        }

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v18);
  }

}

- (void)combineOntoPreviousAdditions:(id)a3 removals:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  -[HMEPendingTopicsCombiner topicFiltersToAdd](self, "topicFiltersToAdd");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[HMEPendingTopicsCombiner topicFiltersToRemove](self, "topicFiltersToRemove");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMEPendingTopicsCombiner setAddTopicFilters:](self, "setAddTopicFilters:", v9);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMEPendingTopicsCombiner setRemoveTopicFilters:](self, "setRemoveTopicFilters:", v10);
  -[HMEPendingTopicsCombiner combineWithAdditions:removals:](self, "combineWithAdditions:removals:", v11, v8);

}

- (NSArray)topicFiltersToAdd
{
  void *v2;
  void *v3;

  -[HMEPendingTopicsCombiner addTopicFilters](self, "addTopicFilters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)topicFiltersToRemove
{
  void *v2;
  void *v3;

  -[HMEPendingTopicsCombiner removeTopicFilters](self, "removeTopicFilters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)reset
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMEPendingTopicsCombiner setAddTopicFilters:](self, "setAddTopicFilters:", v3);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMEPendingTopicsCombiner setRemoveTopicFilters:](self, "setRemoveTopicFilters:", v4);

}

- (NSMutableSet)addTopicFilters
{
  return (NSMutableSet *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAddTopicFilters:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableSet)removeTopicFilters
{
  return (NSMutableSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRemoveTopicFilters:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removeTopicFilters, 0);
  objc_storeStrong((id *)&self->_addTopicFilters, 0);
}

@end
