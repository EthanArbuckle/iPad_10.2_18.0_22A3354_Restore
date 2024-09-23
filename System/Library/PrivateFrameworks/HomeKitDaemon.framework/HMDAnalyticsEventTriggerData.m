@implementation HMDAnalyticsEventTriggerData

- (HMDAnalyticsEventTriggerData)initWithEventTrigger:(id)a3 isAdding:(BOOL)a4
{
  id v6;
  HMDAnalyticsEventTriggerData *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSArray *events;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  HMDAnalyticsPredicateData *predicate;
  HMDAnalyticsEventTriggerData *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v30.receiver = self;
  v30.super_class = (Class)HMDAnalyticsEventTriggerData;
  v7 = -[HMDAnalyticsEventTriggerData init](&v30, sel_init);
  if (v7)
  {
    v7->_executeOnce = objc_msgSend(v6, "executeOnce");
    v8 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(v6, "events");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v6, "events", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v27;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v27 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v15), "analyticsTriggerEventData");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v13);
    }

    v17 = objc_msgSend(v10, "copy");
    events = v7->_events;
    v7->_events = (NSArray *)v17;

    v7->_containsRecurrences = objc_msgSend(v6, "containsRecurrences");
    objc_msgSend(v6, "evaluationCondition");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v6, "predicateUtilities");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "evaluationCondition");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "generateAnalyticsData:", v21);
      v22 = objc_claimAutoreleasedReturnValue();
      predicate = v7->_predicate;
      v7->_predicate = (HMDAnalyticsPredicateData *)v22;

    }
    if (!a4)
    {
      v7->_activationType = objc_msgSend(v6, "activationType");
      v7->_activationState = objc_msgSend(v6, "activationState");
    }
    v24 = v7;

  }
  return v7;
}

- (int)activationState
{
  return self->_activationState;
}

- (void)setActivationState:(int)a3
{
  self->_activationState = a3;
}

- (int)activationType
{
  return self->_activationType;
}

- (void)setActivationType:(int)a3
{
  self->_activationType = a3;
}

- (NSArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (HMDAnalyticsPredicateData)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_predicate, a3);
}

- (BOOL)containsRecurrences
{
  return self->_containsRecurrences;
}

- (void)setContainsRecurrences:(BOOL)a3
{
  self->_containsRecurrences = a3;
}

- (BOOL)executeOnce
{
  return self->_executeOnce;
}

- (void)setExecuteOnce:(BOOL)a3
{
  self->_executeOnce = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_events, 0);
}

@end
