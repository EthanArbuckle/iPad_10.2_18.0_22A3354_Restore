@implementation HMDEventTrigger

- (HMDEventTrigger)initWithModel:(id)a3 home:(id)a4 message:(id)a5 factory:(id)a6
{
  id v10;
  id v11;
  id v12;
  HMDEventTrigger *v13;
  HMDPredicateUtilities *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  HMDPredicateUtilities *predicateUtilities;
  uint64_t v19;
  NSMutableArray *currentEvents;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSPredicate *evaluationCondition;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  NSArray *v35;
  NSArray *recurrences;
  _BOOL4 v37;
  uint64_t v38;
  _BOOL4 v39;
  uint64_t v40;
  id obj;
  objc_super v43;
  _QWORD v44[3];

  v44[2] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v43.receiver = self;
  v43.super_class = (Class)HMDEventTrigger;
  v13 = -[HMDTrigger initWithModel:home:](&v43, sel_initWithModel_home_, v10, a4);
  if (v13)
  {
    v14 = [HMDPredicateUtilities alloc];
    -[HMDTrigger home](v13, "home");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDTrigger name](v13, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[HMDPredicateUtilities initWithHome:logIdentifier:](v14, "initWithHome:logIdentifier:", v15, v16);
    predicateUtilities = v13->_predicateUtilities;
    v13->_predicateUtilities = (HMDPredicateUtilities *)v17;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v19 = objc_claimAutoreleasedReturnValue();
    currentEvents = v13->_currentEvents;
    v13->_currentEvents = (NSMutableArray *)v19;

    objc_msgSend(v10, "executeOnce");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v13->_executeOnce = objc_msgSend(v21, "BOOLValue");

    v13->_migratedEventsToRecords = 1;
    objc_msgSend(v10, "evaluationCondition");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDPredicateUtilities decodePredicateFromData:error:](HMDPredicateUtilities, "decodePredicateFromData:error:", v22, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDEventTrigger predicateUtilities](v13, "predicateUtilities");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "rewritePredicateForDaemon:message:", v23, v11);
    v25 = objc_claimAutoreleasedReturnValue();
    evaluationCondition = v13->_evaluationCondition;
    v13->_evaluationCondition = (NSPredicate *)v25;

    v27 = (void *)MEMORY[0x24BDD1620];
    v28 = (void *)MEMORY[0x24BDBCF20];
    v44[0] = objc_opt_class();
    v44[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setWithArray:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "recurrences");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "unarchivedObjectOfClasses:fromData:error:", v30, v31, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = v32;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v34 = v33;
    else
      v34 = 0;
    v35 = v34;

    recurrences = v13->_recurrences;
    v13->_recurrences = v35;

    v37 = -[HMDTrigger active](v13, "active");
    v38 = 3;
    if (!v37)
      v38 = 0;
    v13->_activationType = v38;
    v39 = -[HMDTrigger active](v13, "active", a6);
    v40 = 4;
    if (!v39)
      v40 = 0;
    v13->_activationState = v40;
    v13->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v13->_dependencyFactory, obj);

  }
  return v13;
}

- (HMDEventTrigger)initWithModel:(id)a3 home:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDEventTriggerDependencyFactory *v11;
  HMDEventTrigger *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(HMDEventTriggerDependencyFactory);
  v12 = -[HMDEventTrigger initWithModel:home:message:factory:](self, "initWithModel:home:message:factory:", v10, v9, v8, v11);

  return v12;
}

- (HMDEventTrigger)initWithModel:(id)a3 home:(id)a4
{
  return -[HMDEventTrigger initWithModel:home:message:](self, "initWithModel:home:message:", a3, a4, 0);
}

- (id)dumpState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v28.receiver = self;
  v28.super_class = (Class)HMDEventTrigger;
  -[HMDTrigger dumpState](&v28, sel_dumpState);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HMDEventTrigger events](self, "events");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[HMDEventTrigger events](self, "events", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v25;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v11), "dumpState");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v9);
    }

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE3EAA0]);
  }
  -[HMDEventTrigger evaluationCondition](self, "evaluationCondition");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[HMDEventTrigger evaluationCondition](self, "evaluationCondition");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "description");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BE3EB18]);

  }
  -[HMDEventTrigger recurrences](self, "recurrences");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[HMDEventTrigger recurrences](self, "recurrences");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "description");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, *MEMORY[0x24BE3EB20]);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDEventTrigger executeOnce](self, "executeOnce"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BE3EAA8]);

  -[HMDEventTrigger executionSession](self, "executionSession");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[HMDEventTrigger executionSession](self, "executionSession");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dumpState");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, *MEMORY[0x24BE3EAB0]);

  }
  return v4;
}

- (unint64_t)triggerType
{
  return 1;
}

- (NSArray)events
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableArray copy](self->_currentEvents, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)addEvent:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  if ((-[NSMutableArray containsObject:](self->_currentEvents, "containsObject:", v4) & 1) == 0)
    -[NSMutableArray addObject:](self->_currentEvents, "addObject:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)removeEvent:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableArray removeObject:](self->_currentEvents, "removeObject:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (NSArray)triggerEvents
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HMDEventTrigger events](self, "events", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isEndEvent") & 1) == 0)
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v10;
}

- (NSArray)endEvents
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HMDEventTrigger events](self, "events", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "isEndEvent"))
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v10;
}

- (NSArray)characteristicEvents
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HMDEventTrigger triggerEvents](self, "triggerEvents", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v3, "addObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v10;
}

- (NSArray)characteristicBaseEvents
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HMDEventTrigger events](self, "events", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v3, "addObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v10;
}

- (NSArray)locationEvents
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HMDEventTrigger triggerEvents](self, "triggerEvents", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v3, "addObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v10;
}

- (NSArray)calendarEvents
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HMDEventTrigger triggerEvents](self, "triggerEvents", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v3, "addObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v10;
}

- (NSArray)significantTimeEvents
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HMDEventTrigger triggerEvents](self, "triggerEvents", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v3, "addObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v10;
}

- (NSArray)timeEvents
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HMDEventTrigger triggerEvents](self, "triggerEvents", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v3, "addObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v10;
}

- (NSArray)durationEvents
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HMDEventTrigger events](self, "events", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v3, "addObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v10;
}

- (NSArray)charThresholdEvents
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HMDEventTrigger events](self, "events", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v3, "addObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v10;
}

- (NSArray)presenceEvents
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HMDEventTrigger triggerEvents](self, "triggerEvents", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v3, "addObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v10;
}

- (NSArray)recurrences
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSArray copy](self->_recurrences, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)setRecurrences:(id)a3
{
  NSArray *v4;
  NSArray *recurrences;

  v4 = (NSArray *)a3;
  os_unfair_lock_lock_with_options();
  recurrences = self->_recurrences;
  self->_recurrences = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)invalidate
{
  void *v3;
  HMDEventTrigger *v4;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v9 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Deactivating the trigger", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDTrigger setActive:](v4, "setActive:", 0);
  -[HMDEventTrigger _activateWithCompletion:](v4, "_activateWithCompletion:", 0);
  v7.receiver = v4;
  v7.super_class = (Class)HMDEventTrigger;
  -[HMDTrigger invalidate](&v7, sel_invalidate);
}

- (BOOL)requiresDataVersion4
{
  void *v3;
  HMDEventTrigger *v4;
  NSObject *v5;
  void *v6;
  char v7;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  objc_super v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v21.receiver = self;
  v21.super_class = (Class)HMDEventTrigger;
  if (-[HMDTrigger requiresDataVersion4](&v21, sel_requiresDataVersion4))
    return 1;
  if (-[HMDEventTrigger executeOnce](self, "executeOnce"))
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v6;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Contains execute once/policy, requires data version 4", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    return 1;
  }
  -[HMDEventTrigger calendarEvents](self, "calendarEvents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  -[HMDEventTrigger significantTimeEvents](self, "significantTimeEvents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  -[HMDEventTrigger presenceEvents](self, "presenceEvents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  -[HMDEventTrigger charThresholdEvents](self, "charThresholdEvents");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  -[HMDEventTrigger endEvents](self, "endEvents");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  v7 = 1;
  if (!v10 && !v12 && !v14 && !v18 && !v16)
  {
    -[HMDEventTrigger predicateUtilities](self, "predicateUtilities");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDEventTrigger evaluationCondition](self, "evaluationCondition");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v19, "containsPresenceEvents:", v20);

  }
  return v7;
}

- (BOOL)compatible:(id)a3 user:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDEventTrigger *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v11;
    v24 = 2112;
    v25 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Checking if the username %@ is compatible", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  if (-[HMDEventTrigger requiresDataVersion4](v9, "requiresDataVersion4")
    && objc_msgSend(v6, "containsObject:", &unk_24E96ABB0))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[HMDEventTrigger presenceEvents](v9, "presenceEvents", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v12);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "compatibleWithUser:", v7) & 1) != 0)
          {
            LOBYTE(v13) = 1;
            goto LABEL_16;
          }
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v13)
          continue;
        break;
      }
    }
LABEL_16:

  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (BOOL)shouldActivateOnLocalDevice
{
  unint64_t v3;
  BOOL result;
  objc_super v5;

  v3 = -[HMDEventTrigger activationType](self, "activationType");
  v5.receiver = self;
  v5.super_class = (Class)HMDEventTrigger;
  result = -[HMDTrigger shouldActivateOnLocalDevice](&v5, sel_shouldActivateOnLocalDevice);
  if (v3 - 1 >= 3)
    return 0;
  return result;
}

- (BOOL)computedActive
{
  return -[HMDEventTrigger activationState](self, "activationState") == 4;
}

- (BOOL)doesTheLocationEventTargetCurrentUser
{
  void *v2;
  char v3;

  -[HMDEventTrigger locationEvents](self, "locationEvents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "na_allObjectsPassTest:", &__block_literal_global_49_43354);

  return v3;
}

- (void)_computeActivation
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  _BOOL4 v14;
  _BOOL8 v15;
  _BOOL4 v16;
  void *v17;
  HMDEventTrigger *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HMDEventTrigger *v28;
  NSObject *v29;
  void *v30;
  _BOOL4 v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  HMDEventTrigger *v35;
  NSObject *v36;
  void *v37;
  BOOL v38;
  void *v39;
  HMDEventTrigger *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  HMDEventTrigger *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  HMDEventTrigger *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  _BOOL4 v70;
  void *v71;
  const __CFString *v72;
  void *v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  uint64_t v79;
  __int16 v80;
  uint64_t v81;
  __int16 v82;
  uint64_t v83;
  __int16 v84;
  uint64_t v85;
  __int16 v86;
  uint64_t v87;
  __int16 v88;
  uint64_t v89;
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  -[HMDEventTrigger characteristicEvents](self, "characteristicEvents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[HMDEventTrigger locationEvents](self, "locationEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  -[HMDEventTrigger calendarEvents](self, "calendarEvents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v7, "count");

  -[HMDEventTrigger significantTimeEvents](self, "significantTimeEvents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v8, "count");

  -[HMDEventTrigger presenceEvents](self, "presenceEvents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v9, "count");

  -[HMDEventTrigger charThresholdEvents](self, "charThresholdEvents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v10, "count");

  -[HMDEventTrigger endEvents](self, "endEvents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v11, "count");

  -[HMDTrigger home](self, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "primaryResident");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "device");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v12;
  v13 = objc_msgSend(v12, "isCurrentDeviceConfirmedPrimaryResident");
  v14 = -[HMDEventTrigger isThisDeviceDesignatedFMFDevice](self, "isThisDeviceDesignatedFMFDevice");
  v15 = -[HMDEventTrigger isOwnerOfHome](self, "isOwnerOfHome");
  if (v6)
    v16 = 0;
  else
    v16 = v13;
  v70 = v16;
  if (v6 && v14)
  {
    v15 = -[HMDEventTrigger doesTheLocationEventTargetCurrentUser](self, "doesTheLocationEventTargetCurrentUser");
    v70 = v15;
  }
  v17 = (void *)MEMORY[0x227676638](v15);
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v62 = v6;
    v22 = v13;
    v23 = v4;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    v75 = v20;
    v76 = 2112;
    v77 = (uint64_t)v71;
    v78 = 2112;
    v79 = (uint64_t)v21;
    v80 = 2112;
    v81 = (uint64_t)v24;
    v82 = 2112;
    v83 = 0;
    v84 = 2112;
    v85 = (uint64_t)v25;
    v86 = 2112;
    v87 = (uint64_t)v26;
    _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Resident %@, this-device-is-resident: %@, this-device-owns-trigger: %@, owning-device: %@, FMF device: %@, Owner of home: %@", buf, 0x48u);

    v4 = v23;
    v13 = v22;
    v6 = v62;

  }
  objc_autoreleasePoolPop(v17);
  v27 = (void *)MEMORY[0x227676638]();
  v28 = v18;
  HMFGetOSLogHandle();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138545154;
    v75 = v30;
    v76 = 2048;
    v77 = v4;
    v78 = 2048;
    v79 = v6;
    v80 = 2048;
    v81 = v67;
    v82 = 2048;
    v83 = v66;
    v84 = 2048;
    v85 = v65;
    v86 = 2048;
    v87 = v64;
    v88 = 2048;
    v89 = v63;
    _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_INFO, "%{public}@char: %tu, location: %tu, calendar: %tu, significant: %tu, presence: %tu, char-threshold: %tu, end: %tu", buf, 0x52u);

  }
  objc_autoreleasePoolPop(v27);
  v31 = -[HMDTrigger hasNoActions](v28, "hasNoActions");
  if (-[HMDTrigger active](v28, "active") && !v31)
  {
    if (v6 && !-[HMDEventTrigger isAuthorizedForLocation](v28, "isAuthorizedForLocation"))
    {
      v32 = 0;
      v33 = 3;
      goto LABEL_44;
    }
    if ((objc_msgSend(v68, "supportsSharedEventTriggerActivation", v62) & 1) == 0
      && -[HMDEventTrigger requiresDataVersion4](v28, "requiresDataVersion4"))
    {
      v32 = 0;
      if (v71)
        v33 = 2;
      else
        v33 = 1;
      goto LABEL_44;
    }
    if (objc_msgSend(v68, "supportsSharedEventTriggerActivation"))
    {
      if (v6)
      {
        if (v13)
        {
          if (v70)
            v32 = 3;
          else
            v32 = 2;
        }
        else
        {
          v32 = v70;
        }
        goto LABEL_43;
      }
      v38 = v13 == 0;
LABEL_37:
      if (v38)
        v32 = 0;
      else
        v32 = 3;
      goto LABEL_43;
    }
    if (-[HMDEventTrigger requiresDataVersion4](v28, "requiresDataVersion4"))
    {
      v32 = 0;
    }
    else
    {
      if (v6)
      {
        v38 = !v70;
        goto LABEL_37;
      }
      if ((v13 & 1) == 0)
      {
        v38 = !v70 || v71 != 0;
        goto LABEL_37;
      }
      v32 = 3;
    }
LABEL_43:
    v33 = 4;
    goto LABEL_44;
  }
  if (v31)
  {
    v34 = (void *)MEMORY[0x227676638]();
    v35 = v28;
    HMFGetOSLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v75 = v37;
      _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_INFO, "%{public}@The trigger is disabled as there are no actions associated with this trigger.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v34);
  }
  v33 = 0;
  v32 = 0;
LABEL_44:
  v39 = (void *)MEMORY[0x227676638]();
  v40 = v28;
  HMFGetOSLogHandle();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    HMEventTriggerActivationStateAsString();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    HMDEventTriggerActivationTypeAsString(v32);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v75 = v42;
    v76 = 2112;
    v77 = (uint64_t)v43;
    v78 = 2112;
    v79 = (uint64_t)v44;
    _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_INFO, "%{public}@Computed activation flags state:%@ type: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v39);
  if (-[HMDEventTrigger activationType](v40, "activationType") != v32)
  {
    v45 = (void *)MEMORY[0x227676638]();
    v46 = v40;
    HMFGetOSLogHandle();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      HMDEventTriggerActivationTypeAsString(-[HMDEventTrigger activationType](v46, "activationType"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      HMDEventTriggerActivationTypeAsString(v32);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v75 = v48;
      v76 = 2112;
      v77 = (uint64_t)v49;
      v78 = 2112;
      v79 = (uint64_t)v50;
      _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_INFO, "%{public}@Updating activation type from %@ to %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v45);
    -[HMDEventTrigger setActivationType:](v46, "setActivationType:", v32);
  }
  if (-[HMDEventTrigger activationState](v40, "activationState", v62) != v33)
  {
    v51 = (void *)MEMORY[0x227676638]();
    v52 = v40;
    HMFGetOSLogHandle();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDEventTrigger activationState](v52, "activationState");
      HMEventTriggerActivationStateAsString();
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      HMEventTriggerActivationStateAsString();
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v75 = v54;
      v76 = 2112;
      v77 = (uint64_t)v55;
      v78 = 2112;
      v79 = (uint64_t)v56;
      _os_log_impl(&dword_2218F0000, v53, OS_LOG_TYPE_INFO, "%{public}@Updating activation state from %@ to %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v51);
    -[HMDEventTrigger setActivationState:](v52, "setActivationState:", v33);
    v72 = CFSTR("kEventTriggerActivationStateKey");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v33);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v57;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE3F1B0], "messageWithName:identifier:messagePayload:", CFSTR("kEventTriggerActivationStateNotificationKey"), 0, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDTrigger msgDispatcher](v52, "msgDispatcher");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDTrigger uuid](v52, "uuid");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "sendMessage:target:", v59, v61);

  }
}

- (void)_activateEvents:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  HMDEventTrigger *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  NSObject *group;
  _BOOL4 v39;
  void *v40;
  HMDEventTrigger *val;
  _QWORD block[4];
  id v43;
  id v44;
  id v45;
  BOOL v46;
  _QWORD v47[5];
  id v48;
  NSObject *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[5];
  id v55;
  NSObject *v56;
  uint8_t v57[128];
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v36 = a3;
  group = dispatch_group_create();
  v39 = -[HMDEventTrigger computedActive](self, "computedActive");
  v4 = (void *)MEMORY[0x227676638]();
  val = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HMDEventTriggerActivationTypeAsString(-[HMDEventTrigger activationType](val, "activationType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDEventTrigger activationState](val, "activationState");
    HMEventTriggerActivationStateAsString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v59 = v6;
    v60 = 2114;
    v61 = v7;
    v62 = 2114;
    v63 = v8;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Attempting to activate with activation type %{public}@, state %{public}@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    -[HMDEventTrigger evaluationCondition](val, "evaluationCondition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v24 = 0;
LABEL_11:

      goto LABEL_12;
    }
    v10 = (void *)MEMORY[0x24BDD1758];
    v11 = v9;
    objc_msgSend(v10, "predicateWithValue:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "predicateFormat");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "predicateFormat");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqualToString:", v14);

    if ((v15 & 1) == 0)
    {
      -[HMDTrigger home](val, "home");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "homeLocationHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "location");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18 == 0;

      if (v19)
      {
        v20 = (void *)MEMORY[0x227676638]();
        v21 = val;
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v59 = v23;
          _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Home location is not known, cannot activate the trigger", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v20);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 84);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "addObject:", v24);
        goto LABEL_11;
      }
    }
  }
LABEL_12:
  if (!objc_msgSend(v40, "count", v36))
  {
    dispatch_group_enter(group);
    v54[0] = MEMORY[0x24BDAC760];
    v54[1] = 3221225472;
    v54[2] = __35__HMDEventTrigger__activateEvents___block_invoke;
    v54[3] = &unk_24E799FD0;
    v54[4] = val;
    v25 = v40;
    v55 = v25;
    v26 = group;
    v56 = v26;
    -[HMDTrigger _activate:completionHandler:](val, "_activate:completionHandler:", v39, v54);
    v52 = 0u;
    v53 = 0u;
    v51 = 0u;
    v50 = 0u;
    -[HMDEventTrigger triggerEvents](val, "triggerEvents");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
    if (v28)
    {
      v29 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v51 != v29)
            objc_enumerationMutation(v27);
          v31 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          dispatch_group_enter(v26);
          v32 = -[HMDEventTrigger activationType](val, "activationType");
          v47[0] = MEMORY[0x24BDAC760];
          v47[1] = 3221225472;
          v47[2] = __35__HMDEventTrigger__activateEvents___block_invoke_3;
          v47[3] = &unk_24E799FD0;
          v47[4] = val;
          v48 = v25;
          v49 = v26;
          objc_msgSend(v31, "_activate:completionHandler:", v32, v47);

        }
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
      }
      while (v28);
    }

  }
  objc_initWeak((id *)buf, val);
  -[HMDTrigger workQueue](val, "workQueue");
  v33 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__HMDEventTrigger__activateEvents___block_invoke_5;
  block[3] = &unk_24E77B420;
  objc_copyWeak(&v45, (id *)buf);
  v46 = v39;
  v43 = v40;
  v44 = v37;
  v34 = v37;
  v35 = v40;
  dispatch_group_notify(group, v33, block);

  objc_destroyWeak(&v45);
  objc_destroyWeak((id *)buf);

}

- (void)_activateWithCompletion:(id)a3
{
  id v4;
  void (**v5)(void *, void *);
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  HMDEventTrigger *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[HMDTrigger isConfigured](self, "isConfigured"))
  {
    if (v4)
    {
      -[HMDEventTrigger _computeActivation](self, "_computeActivation");
      -[HMDEventTrigger _activateEvents:](self, "_activateEvents:", v4);
    }
    else
    {
      -[HMDEventTrigger debounceTriggerActivationTimer](self, "debounceTriggerActivationTimer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (!v7 || (objc_msgSend(v7, "timeInterval"), v9 != 7.0))
      {
        v10 = (void *)MEMORY[0x227676638](-[HMDEventTrigger _configureDebounceTriggerActivationTimer](self, "_configureDebounceTriggerActivationTimer"));
        v11 = self;
        HMFGetOSLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDEventTrigger debounceTriggerActivationTimer](v11, "debounceTriggerActivationTimer");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 138543874;
          v17 = v13;
          v18 = 2112;
          v19 = v8;
          v20 = 2112;
          v21 = v14;
          _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Reinitialized debounce timer from %@ to %@", (uint8_t *)&v16, 0x20u);

        }
        objc_autoreleasePoolPop(v10);
      }
      -[HMDEventTrigger debounceTriggerActivationTimer](self, "debounceTriggerActivationTimer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "resume");

    }
  }
  else
  {
    v5 = (void (**)(void *, void *))_Block_copy(v4);
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", 2012);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v6);

    }
  }

}

- (void)_reevaluateIfRelaunchRequired
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  HMDEventTrigger *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[HMDEventTrigger events](self, "events");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v4)
  {
    v6 = v4;
    v7 = 0;
    v8 = *(_QWORD *)v19;
    *(_QWORD *)&v5 = 138543618;
    v17 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v10, "isActive", v17))
        {
          v11 = (void *)MEMORY[0x227676638]();
          v12 = self;
          HMFGetOSLogHandle();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v17;
            v23 = v14;
            v24 = 2112;
            v25 = v10;
            _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Registering for relaunch on behalf of event: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v11);
          v7 = 1;
        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  -[HMDEventTriggerDependencyFactory launchHandler](self->_dependencyFactory, "launchHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTrigger uuid](self, "uuid");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 & 1) != 0)
    objc_msgSend(v15, "registerRelaunchClientWithUUID:", v16);
  else
    objc_msgSend(v15, "deregisterRelaunchClientWithUUID:", v16);

}

- (void)_configureDebounceTriggerActivationTimer
{
  HMDEventTriggerDependencyFactory *dependencyFactory;
  HMDEventTriggerDependencyFactory *v4;
  HMDEventTriggerDependencyFactory *v5;
  void *v6;
  HMDEventTrigger *v7;
  NSObject *v8;
  void *v9;
  HMDEventTriggerDependencyFactory *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  HMDEventTriggerDependencyFactory *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  dependencyFactory = self->_dependencyFactory;
  if (!dependencyFactory)
  {
    v4 = objc_alloc_init(HMDEventTriggerDependencyFactory);
    v5 = self->_dependencyFactory;
    self->_dependencyFactory = v4;

    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = self->_dependencyFactory;
      v15 = 138543618;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Missing dependency factory, reinitializing %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    dependencyFactory = self->_dependencyFactory;
  }
  -[HMDEventTriggerDependencyFactory createTimerWithTimeInterval:options:](dependencyFactory, "createTimerWithTimeInterval:options:", 0, 7.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEventTrigger setDebounceTriggerActivationTimer:](self, "setDebounceTriggerActivationTimer:", v11);

  -[HMDEventTrigger debounceTriggerActivationTimer](self, "debounceTriggerActivationTimer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDelegate:", self);

  -[HMDTrigger workQueue](self, "workQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEventTrigger debounceTriggerActivationTimer](self, "debounceTriggerActivationTimer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDelegateQueue:", v13);

}

- (void)configure:(id)a3 messageDispatcher:(id)a4 queue:(id)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v18.receiver = self;
  v18.super_class = (Class)HMDEventTrigger;
  -[HMDTrigger configure:messageDispatcher:queue:](&v18, sel_configure_messageDispatcher_queue_, a3, a4, a5);
  -[HMDEventTrigger _configureDebounceTriggerActivationTimer](self, "_configureDebounceTriggerActivationTimer");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HMDEventTrigger events](self, "events", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
        -[HMDTrigger msgDispatcher](self, "msgDispatcher");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDTrigger workQueue](self, "workQueue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "configure:messageDispatcher:queue:delegate:", self, v12, v13, self);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v8);
  }

  -[HMDEventTrigger _activateWithCompletion:](self, "_activateWithCompletion:", 0);
  -[HMDEventTrigger _migrateEventsToRecords](self, "_migrateEventsToRecords");
}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  HMDEventTrigger *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDTrigger workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDEventTrigger debounceTriggerActivationTimer](self, "debounceTriggerActivationTimer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Debounce Timer expired: Going to activate the trigger", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDEventTrigger _computeActivation](v8, "_computeActivation");
    -[HMDEventTrigger _activateEvents:](v8, "_activateEvents:", 0);
  }

}

- (void)_migrateEventsToRecords
{
  void *v3;
  HMDEventTrigger *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDEventTrigger *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  HMDEventTrigger *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDEventTrigger migratedEventsToRecords](v4, "migratedEventsToRecords");
    HMFBooleanToString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v34 = v6;
    v35 = 2112;
    v36 = v7;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Events migration %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  if (!-[HMDEventTrigger migratedEventsToRecords](v4, "migratedEventsToRecords"))
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = v4;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@The events haven't been migrated, generating transactions for each event present", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDEventTrigger characteristicEvents](v9, "characteristicEvents");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    -[HMDEventTrigger locationEvents](v9, "locationEvents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObjectsFromArray:", v14);

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    obj = v13;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v15)
    {
      v16 = v15;
      v27 = *(_QWORD *)v29;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v29 != v27)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v17), "modelObjectWithChangeType:", 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BE3F1B0], "messageWithName:messagePayload:", CFSTR("kMigratedEventsToRecordsRequest"), 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDTrigger home](v9, "home");
          v20 = v9;
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "backingStore");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "name");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "transaction:options:", v23, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v9 = v20;
          objc_msgSend(v25, "add:withMessage:", v18, v19);
          objc_msgSend(v25, "run");

          ++v17;
        }
        while (v16 != v17);
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v16);
    }

    -[HMDEventTrigger setMigratedEventsToRecords:](v9, "setMigratedEventsToRecords:", 1);
  }
}

- (void)_registerForMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v33;
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[4];
  _QWORD v37[4];
  _QWORD v38[4];
  _QWORD v39[4];
  _QWORD v40[4];
  _QWORD v41[6];

  v41[4] = *MEMORY[0x24BDAC8D0];
  v33.receiver = self;
  v33.super_class = (Class)HMDEventTrigger;
  -[HMDTrigger _registerForMessages](&v33, sel__registerForMessages);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleLocationAuthorizationChangedNotification_, CFSTR("HMDLocationAuthorizationChangedNotification"), 0);

  -[HMDTrigger home](self, "home");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDMutableRemoteMessagePolicy, "defaultSecurePolicy");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setRoles:", objc_msgSend(v31, "roles") | 4);
  v4 = (void *)objc_msgSend(v31, "copy");
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v32, 4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "administratorHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v7;
  v41[1] = v4;
  v41[2] = v5;
  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v41[3] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerForMessage:receiver:policies:selector:", CFSTR("kUpdateEventTriggerConditionRequestKey"), self, v9, sel__handleUpdateEventTriggerCondition_);

  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v10;
  v40[1] = v4;
  v40[2] = v5;
  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v40[3] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerForMessage:receiver:policies:selector:", CFSTR("kUpdateEventTriggerRecurrencesRequestKey"), self, v12, sel__handleUpdateEventTriggerRecurrences_);

  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v13;
  v39[1] = v4;
  v39[2] = v5;
  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v39[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerForMessage:receiver:policies:selector:", CFSTR("kUpdateEventTriggerExecuteOnceRequestKey"), self, v15, sel__handleUpdateEventTriggerExecuteOnce_);

  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v16;
  v38[1] = v4;
  v38[2] = v5;
  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerForMessage:receiver:policies:selector:", CFSTR("kAddEventToEventTriggerRequestKey"), self, v18, sel__handleAddEventToEventTrigger_);

  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v19;
  v37[1] = v4;
  v37[2] = v5;
  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerForMessage:receiver:policies:selector:", CFSTR("kRemoveEventFromEventTriggerRequestKey"), self, v21, sel__handleRemoveEventsFromEventTrigger_);

  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v22;
  v36[1] = v4;
  v36[2] = v5;
  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v36[3] = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerForMessage:receiver:policies:selector:", CFSTR("kUpdateEventsToEventTriggerRequestKey"), self, v24, sel__handleUpdateEventsOnEventTrigger_);

  -[HMDTrigger msgDispatcher](self, "msgDispatcher");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v26;
  v35[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "registerForMessage:receiver:policies:selector:", CFSTR("kEventTriggerUserPermissionRequestKey"), self, v27, sel__handleUserPermissionRequest_);

  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v28;
  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v29;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerForMessage:receiver:policies:selector:", CFSTR("HMUpdateEventTriggerFromBuilderMessage"), self, v30, sel__handleUpdateEventTrigger_);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HMDTrigger msgDispatcher](self, "msgDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deregisterReceiver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HMDEventTrigger;
  -[HMDTrigger dealloc](&v4, sel_dealloc);
}

- (BOOL)shouldEncodeLastFireDate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char v7;

  v4 = a3;
  -[HMDEventTrigger locationEvents](self, "locationEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
    v7 = objc_msgSend(v4, "hmd_isForXPCTransportAuthorizedForLocationAccess");
  else
    v7 = 1;

  return v7;
}

- (void)sendTriggerFiredNotification:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[HMDEventTrigger locationEvents](self, "locationEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
    objc_msgSend(MEMORY[0x24BE3F1B0], "locationAuthorizedMessageWithName:messagePayload:", CFSTR("kTriggerFiredNotificationKey"), v4);
  else
    objc_msgSend(MEMORY[0x24BE3F1B0], "messageWithName:messagePayload:", CFSTR("kTriggerFiredNotificationKey"), v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[HMDTrigger msgDispatcher](self, "msgDispatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTrigger uuid](self, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendMessage:target:", v9, v8);

}

- (void)handleRemovalOfAccessory:(id)a3 transaction:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HMDEventTrigger;
  -[HMDTrigger handleRemovalOfAccessory:transaction:](&v21, sel_handleRemovalOfAccessory_transaction_, v6, v7);
  v8 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v10, "services", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        -[HMDEventTrigger handleRemovalOfService:transaction:](self, "handleRemovalOfService:transaction:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++), v7);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v14);
  }

}

- (void)handleRemovalOfService:(id)a3 transaction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HMDEventTrigger;
  -[HMDTrigger handleRemovalOfService:transaction:](&v18, sel_handleRemovalOfService_transaction_, v6, v7);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v6, "characteristics", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        -[HMDEventTrigger handleRemovalOfCharacteristic:transaction:](self, "handleRemovalOfCharacteristic:transaction:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), v7);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v11);
  }

}

- (void)auditForStaleEventsWithAccessory:(id)a3 transaction:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  HMDEventTrigger *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HMDEventTrigger *v34;
  NSObject *v35;
  void *v36;
  HMDEventTrigger *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  id obj;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  char v48;
  uint8_t v49[128];
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDTrigger workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v11)
  {
    v48 = 0;
    -[HMDEventTrigger predicateUtilities](self, "predicateUtilities");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDEventTrigger evaluationCondition](self, "evaluationCondition");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "predicateWithoutStaleCharacteristicsFromPredicate:accessory:conditionModified:", v13, v11, &v48);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      v14 = (void *)MEMORY[0x227676638]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDEventTrigger evaluationCondition](v15, "evaluationCondition");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "shortDescription");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v51 = v17;
        v52 = 2112;
        v53 = v18;
        v54 = 2112;
        v55 = v41;
        v56 = 2112;
        v57 = v19;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Updating condition from %@ to %@ after removing stale characteristic sub-predicates for accessory %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v14);
      -[HMDEventTrigger _modelWithRewrittenCondition:](v15, "_modelWithRewrittenCondition:", v41);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
        objc_msgSend(v7, "add:withMessage:", v20, 0);

    }
    v39 = v9;
    v40 = v7;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    -[HMDEventTrigger characteristicBaseEvents](self, "characteristicBaseEvents");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v45;
      v42 = v11;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v45 != v24)
            objc_enumerationMutation(obj);
          v26 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          objc_msgSend(v26, "accessoryUUID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "uuid");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v27, "isEqual:", v28);

          if (v29)
          {
            objc_msgSend(v26, "characteristicInstanceID");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "serviceID");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "findCharacteristic:forService:", v30, v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v32)
            {
              v33 = (void *)MEMORY[0x227676638]();
              v34 = self;
              HMFGetOSLogHandle();
              v35 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v36 = v21;
                v37 = self;
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v51 = v38;
                v52 = 2112;
                v53 = v26;
                _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_INFO, "%{public}@Audit: Characteristic associated with event %@ no longer exists", buf, 0x16u);

                self = v37;
                v21 = v36;
                v11 = v42;
              }

              objc_autoreleasePoolPop(v33);
              objc_msgSend(v21, "addObject:", v26);
            }
          }
        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v23);
    }

    v7 = v40;
    -[HMDEventTrigger _handleRemovalOfEvents:transaction:](self, "_handleRemovalOfEvents:transaction:", v21, v40);

    v9 = v39;
  }

}

- (void)handleRemovalOfCharacteristic:(id)a3 transaction:(id)a4
{
  -[HMDEventTrigger _handleRemovalOfCharacteristic:withEvents:transaction:](self, "_handleRemovalOfCharacteristic:withEvents:transaction:", a3, 0, a4);
}

- (void)_handleRemovalOfCharacteristic:(id)a3 withEvents:(id)a4 transaction:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  HMDEventTrigger *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  id v43;
  HMDEventTrigger *v44;
  void *v45;
  id v46;
  void *v47;
  id obj;
  void *v49;
  int v50;
  id v51;
  char v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  id v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "accessory");
  v11 = objc_claimAutoreleasedReturnValue();
  v45 = v9;
  v47 = (void *)v11;
  if (!v9)
  {
    v43 = v10;
    v12 = (void *)MEMORY[0x24BDBCEB8];
    -[HMDEventTrigger characteristicBaseEvents](self, "characteristicBaseEvents");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "arrayWithCapacity:", objc_msgSend(v13, "count"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v44 = self;
    -[HMDEventTrigger characteristicBaseEvents](self, "characteristicBaseEvents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");

    obj = v15;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    v17 = (void *)v11;
    if (v16)
    {
      v18 = v16;
      v19 = *(_QWORD *)v54;
      v46 = v8;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v54 != v19)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          objc_msgSend(v21, "characteristic");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "service");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "accessory");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "uuid");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "uuid");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v25, "isEqual:", v26) & 1) != 0)
          {
            objc_msgSend(v8, "instanceID");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = v21;
            objc_msgSend(v21, "characteristic");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "instanceID");
            v29 = v22;
            v30 = v18;
            v31 = v19;
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend(v27, "isEqual:", v32);

            v19 = v31;
            v18 = v30;
            v22 = v29;

            v17 = v47;
            v8 = v46;

            if (v50)
              objc_msgSend(v45, "addObject:", v49);
          }
          else
          {

          }
        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
      }
      while (v18);
    }

    v10 = v43;
    self = v44;
    v11 = (uint64_t)v17;
  }
  v52 = 0;
  -[HMDEventTrigger predicateUtilities](self, "predicateUtilities");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEventTrigger evaluationCondition](self, "evaluationCondition");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0;
  objc_msgSend(v8, "service");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "updatePredicate:currentCharacteristicInPredicate:conditionModified:removedCharacteristic:underService:underAccessory:", v34, &v51, &v52, v8, v35, v11);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v51;

  if (v52)
  {
    v38 = (void *)MEMORY[0x227676638]();
    v39 = self;
    HMFGetOSLogHandle();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v58 = v41;
      v59 = 2112;
      v60 = v8;
      _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_INFO, "%{public}@Condition has been modified following removal of characteristic %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v38);
    -[HMDEventTrigger _modelWithRewrittenCondition:](v39, "_modelWithRewrittenCondition:", v36);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42)
      objc_msgSend(v10, "add:withMessage:", v42, 0);

  }
  -[HMDEventTrigger _handleRemovalOfEvents:transaction:](self, "_handleRemovalOfEvents:transaction:", v45, v10);

}

- (void)_removeEvents:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  _QWORD v17[4];
  id v18;
  id location;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  const __CFString *v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v21;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v21 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v6);
        v24 = CFSTR("kEventUUIDKey");
        objc_msgSend(v7, "uuid");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "UUIDString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v9;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = (void *)MEMORY[0x24BE3F1B0];
        v12 = objc_alloc(MEMORY[0x24BE3F1B8]);
        -[HMDTrigger uuid](self, "uuid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v12, "initWithTarget:", v13);
        objc_msgSend(v11, "messageWithName:destination:payload:", CFSTR("kRemoveEventFromEventTriggerRequestKey"), v14, v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_initWeak(&location, self);
        v17[0] = MEMORY[0x24BDAC760];
        v17[1] = 3221225472;
        v17[2] = __33__HMDEventTrigger__removeEvents___block_invoke;
        v17[3] = &unk_24E798E20;
        objc_copyWeak(&v18, &location);
        objc_msgSend(v15, "setResponseHandler:", v17);
        -[HMDEventTrigger _handleRemoveEventsFromEventTrigger:relay:](self, "_handleRemoveEventsFromEventTrigger:relay:", v15, 0);
        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v4);
  }

}

- (void)_handleRemovalOfEvents:(id)a3 transaction:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  HMDEventTrigger *v13;
  NSObject *v14;
  void *v15;
  HMDEventModel *v16;
  void *v17;
  void *v18;
  HMDEventModel *v19;
  id v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v20 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = (void *)MEMORY[0x227676638]();
          v13 = self;
          HMFGetOSLogHandle();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v27 = v15;
            v28 = 2112;
            v29 = v11;
            _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Client does have authorization for location, cannot remove event %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v12);
        }
        else
        {
          v16 = [HMDEventModel alloc];
          objc_msgSend(v11, "uuid");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDTrigger uuid](self, "uuid");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v16, "initWithObjectChangeType:uuid:parentUUID:", 3, v17, v18);

          objc_msgSend(v20, "add:", v19);
        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v8);
  }

}

- (void)handleRemovalOfUser:(id)a3 transaction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDEventTrigger *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDEventTrigger *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  char v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v11;
    v26 = 2112;
    v27 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Preparing to remove references to user %@ from trigger", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDEventTrigger predicateUtilities](v9, "predicateUtilities");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEventTrigger evaluationCondition](v9, "evaluationCondition");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "containsPresenceEvents:", v13);

  if (v14)
  {
    v23 = 0;
    -[HMDEventTrigger predicateUtilities](v9, "predicateUtilities");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDEventTrigger evaluationCondition](v9, "evaluationCondition");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "updatePredicate:removedUser:conditionModified:", v16, v6, &v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v18 = (void *)MEMORY[0x227676638]();
      v19 = v9;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = v21;
        v26 = 2112;
        v27 = v6;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Condition has been modified following removal of user %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
      -[HMDEventTrigger _modelWithRewrittenCondition:](v19, "_modelWithRewrittenCondition:", v17);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
        objc_msgSend(v7, "add:withMessage:", v22, 0);

    }
  }

}

- (id)_modelWithRewrittenCondition:(id)a3
{
  id v4;
  void *v5;
  HMDEventTrigger *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v8;
    v19 = 2112;
    v20 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating evaluation condition for trigger %@", (uint8_t *)&v17, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDEventTrigger emptyModelObject](v6, "emptyModelObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  -[HMDEventTrigger predicateUtilities](v6, "predicateUtilities");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rewritePredicateForDaemon:message:", v4, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v13, 1, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEvaluationCondition:", v14);

    v15 = v11;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)fixupForReplacementAccessory:(id)a3 transaction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  HMDEventTrigger *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v38.receiver = self;
  v38.super_class = (Class)HMDEventTrigger;
  v31 = a4;
  -[HMDTrigger fixupForReplacementAccessory:transaction:](&v38, sel_fixupForReplacementAccessory_transaction_, v6);
  v7 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v30 = self;
    -[HMDEventTrigger characteristicBaseEvents](self, "characteristicBaseEvents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");

    v33 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    if (v33)
    {
      v12 = *(_QWORD *)v35;
      v29 = v11;
      v32 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v35 != v12)
            objc_enumerationMutation(v11);
          v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v14, "characteristic");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "service");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "accessory");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "uuid");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
          {
            objc_msgSend(v14, "accessoryUUID");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v7, "uuid");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqual:", v18);

          if (v20)
          {
            objc_msgSend(v16, "instanceID");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v21)
            {
              objc_msgSend(v14, "serviceID");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v14, "characteristic");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "instanceID");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v23)
            {
              objc_msgSend(v14, "characteristicInstanceID");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v9, "findCharacteristic:forService:", v23, v21);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
            {
              objc_msgSend(v14, "replaceCharacteristic:", v24);
            }
            else
            {
              v39 = v14;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v39, 1);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = v9;
              v27 = v7;
              v28 = (void *)objc_msgSend(v25, "mutableCopy");

              -[HMDEventTrigger _handleRemovalOfCharacteristic:withEvents:transaction:](v30, "_handleRemovalOfCharacteristic:withEvents:transaction:", 0, v28, v31);
              v7 = v27;
              v9 = v26;
              v11 = v29;
            }

            v12 = v32;
          }

        }
        v33 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      }
      while (v33);
    }

  }
}

- (void)_handleLocationAuthorizationChangedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDEventTrigger *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDEventTrigger *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_numberForKey:", CFSTR("HMDLocationAuthorizationKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "integerValue");
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      HMDLocationAuthorizationAsString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v10;
      v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Latest Location Authorization is %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDEventTrigger _activateWithCompletion:](v8, "_activateWithCompletion:", 0);
  }
  else
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v15;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@No location authorization key in the message", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (void)_handleAddEventToEventTrigger:(id)a3
{
  void *v4;
  void *v5;

  -[HMDTrigger updateEventTriggerMessage:message:relay:](self, "updateEventTriggerMessage:message:relay:", 1, a3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[HMDEventTrigger _addEventToEventTrigger:](self, "_addEventToEventTrigger:", v4);
    v4 = v5;
  }

}

- (void)_addEventToEventTrigger:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  void *v15;
  HMDEventTrigger *v16;
  NSObject *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "dictionaryForKey:", CFSTR("kEventTriggerEventsKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTrigger home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backingStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transaction:options:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  -[HMDEventTrigger createEventModel:endEvent:message:checkForSupport:transaction:error:](self, "createEventModel:endEvent:message:checkForSupport:transaction:error:", v5, 0, v4, 1, v10, &v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v19;
  if (v11)
  {
    if (-[HMDEventTrigger _checkAddEventModel:message:](self, "_checkAddEventModel:message:", v11, v4))
    {
      objc_msgSend(v10, "add:withMessage:", v11, v4);
      objc_msgSend(v10, "run");
    }
    else
    {
      v15 = (void *)MEMORY[0x227676638]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v21 = v18;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Cannot add event - Incompatible home hub", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
    }
  }
  else
  {
    objc_msgSend(v4, "responseHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      if (!v12)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
        v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v4, "responseHandler");
      v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, _QWORD))v14)[2](v14, v12, 0);

    }
  }

}

- (id)createEventModel:(id)a3 endEvent:(BOOL)a4 message:(id)a5 checkForSupport:(BOOL)a6 transaction:(id)a7 error:(id *)a8
{
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  __objc2_class *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDEventTrigger *v27;
  NSObject *v28;
  void *v29;
  int v31;
  void *v32;
  uint64_t v33;

  v10 = a6;
  v33 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a5;
  v16 = a7;
  objc_msgSend(v14, "hmf_stringForKey:", CFSTR("kEventTriggerTypeKey"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTrigger home](self, "home");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    if (objc_msgSend(v17, "isEqualToString:", CFSTR("kEventTriggerTypeDurationEventKey")))
    {
      v19 = HMDDurationEventModel;
LABEL_23:
      -[HMDTrigger uuid](self, "uuid");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[__objc2_class eventModelWithDictionary:home:eventTriggerUUID:message:](v19, "eventModelWithDictionary:home:eventTriggerUUID:message:", v14, v18, v20, v15);
      v21 = objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
LABEL_26:
    v23 = 0;
    goto LABEL_27;
  }
  if (objc_msgSend(v17, "isEqualToString:", CFSTR("kEventTriggerTypeCharacteristicEventKey")))
  {
    -[HMDTrigger uuid](self, "uuid");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDCharacteristicEventModel eventModelWithDictionary:home:eventTriggerUUID:message:checkForSupport:error:](HMDCharacteristicEventModel, "eventModelWithDictionary:home:eventTriggerUUID:message:checkForSupport:error:", v14, v18, v20, v15, v10, a8);
    v21 = objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  if (!objc_msgSend(v17, "isEqualToString:", CFSTR("kEventTriggerTypeLocationEventKey")))
  {
    if (objc_msgSend(v17, "isEqualToString:", CFSTR("kEventTriggerTypeCalendarEventKey")))
    {
      v19 = HMDCalendarEventModel;
      goto LABEL_23;
    }
    if (objc_msgSend(v17, "isEqualToString:", CFSTR("kEventTriggerTypeSignificantTimeEventKey")))
    {
      v19 = HMDSignificantTimeEventModel;
      goto LABEL_23;
    }
    if (!objc_msgSend(v17, "isEqualToString:", CFSTR("kEventTriggerTypeCharacteristicThresholdRangeEventKey")))
    {
      if (objc_msgSend(v17, "isEqualToString:", CFSTR("kEventTriggerTypePresenceEventKey")))
      {
        v19 = HMDPresenceEventModel;
        goto LABEL_23;
      }
      goto LABEL_26;
    }
    -[HMDTrigger uuid](self, "uuid");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDCharacteristicThresholdRangeEventModel eventModelWithDictionary:home:eventTriggerUUID:message:checkForSupport:](HMDCharacteristicThresholdRangeEventModel, "eventModelWithDictionary:home:eventTriggerUUID:message:checkForSupport:", v14, v18, v20, v15, v10);
    v21 = objc_claimAutoreleasedReturnValue();
LABEL_24:
    v23 = (void *)v21;
    goto LABEL_25;
  }
  if (v15 && (objc_msgSend(v15, "isAuthorizedForLocationAccess") & 1) == 0)
  {
    v26 = (void *)MEMORY[0x227676638]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543362;
      v32 = v29;
      _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@Client does have authorization for location, cannot add event", (uint8_t *)&v31, 0xCu);

    }
    objc_autoreleasePoolPop(v26);
    if (!a8)
      goto LABEL_26;
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 85);
    v23 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HMDTrigger uuid](self, "uuid");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDLocationEventModel eventModelWithDictionary:home:eventTriggerUUID:message:](HMDLocationEventModel, "eventModelWithDictionary:home:eventTriggerUUID:message:", v14, v18, v22, v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDTrigger owner](self, "owner");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      -[HMDTrigger owner](self, "owner");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "uuid");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setUserUUID:", v25);

LABEL_25:
    }
  }
LABEL_27:

  return v23;
}

- (void)_handleAddEventModel:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  HMDPresenceEvent *v8;
  char isKindOfClass;
  HMDCharacteristicEvent *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDEventTrigger *v14;
  NSObject *v15;
  void *v16;
  HMDPresenceEvent *v17;
  char v18;
  void *v19;
  HMDLocationEvent *v20;
  void *v21;
  void *v22;
  HMDEventTrigger *v23;
  NSObject *v24;
  void *v25;
  HMDPresenceEvent *v26;
  char v27;
  void *v28;
  HMDCalendarEvent *v29;
  void *v30;
  void *v31;
  HMDEventTrigger *v32;
  NSObject *v33;
  void *v34;
  HMDPresenceEvent *v35;
  char v36;
  void *v37;
  HMDSignificantTimeEvent *v38;
  void *v39;
  void *v40;
  HMDEventTrigger *v41;
  NSObject *v42;
  void *v43;
  HMDPresenceEvent *v44;
  char v45;
  void *v46;
  HMDDurationEvent *v47;
  void *v48;
  void *v49;
  HMDEventTrigger *v50;
  NSObject *v51;
  void *v52;
  HMDPresenceEvent *v53;
  char v54;
  void *v55;
  HMDCharacteristicThresholdRangeEvent *v56;
  void *v57;
  void *v58;
  HMDEventTrigger *v59;
  NSObject *v60;
  void *v61;
  HMDPresenceEvent *v62;
  char v63;
  void *v64;
  HMDPresenceEvent *v65;
  void *v66;
  void *v67;
  void *v68;
  HMDEventTrigger *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  HMDEventTrigger *v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  uint8_t buf[4];
  void *v83;
  __int16 v84;
  HMDPresenceEvent *v85;
  __int16 v86;
  void *v87;
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (HMDPresenceEvent *)v6;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v10 = 0;
  if (v8 && (isKindOfClass & 1) != 0)
  {
    -[HMDTrigger home](self, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HMDCharacteristicEvent initWithModel:home:]([HMDCharacteristicEvent alloc], "initWithModel:home:", v8, v11);
    if (v10)
    {
      -[HMDEventTrigger addEvent:](self, "addEvent:", v10);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("HMDEventTriggerCharacteristicBasedEventAddedNotification"), v11, 0);

      }
    }
    else
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v83 = v16;
        v84 = 2112;
        v85 = v8;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Failed to create event object with event model %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
    }

  }
  v17 = v8;
  objc_opt_class();
  v18 = objc_opt_isKindOfClass();

  if (v8 && (v18 & 1) != 0)
  {
    -[HMDTrigger home](self, "home");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[HMDLocationEvent initWithModel:home:]([HMDLocationEvent alloc], "initWithModel:home:", v17, v19);

    if (v20)
    {
      -[HMDEventTrigger addEvent:](self, "addEvent:", v20);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "postNotificationName:object:userInfo:", CFSTR("HMDEventTriggerCharacteristicBasedEventAddedNotification"), v19, 0);

      }
    }
    else
    {
      v22 = (void *)MEMORY[0x227676638]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v83 = v25;
        v84 = 2112;
        v85 = v17;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Failed to create event object with event model %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
    }

  }
  else
  {
    v20 = (HMDLocationEvent *)v10;
  }
  v26 = v17;
  objc_opt_class();
  v27 = objc_opt_isKindOfClass();

  if (v8 && (v27 & 1) != 0)
  {
    -[HMDTrigger home](self, "home");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[HMDCalendarEvent initWithModel:home:]([HMDCalendarEvent alloc], "initWithModel:home:", v26, v28);

    if (v29)
    {
      -[HMDEventTrigger addEvent:](self, "addEvent:", v29);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "postNotificationName:object:userInfo:", CFSTR("HMDEventTriggerCharacteristicBasedEventAddedNotification"), v28, 0);

      }
    }
    else
    {
      v31 = (void *)MEMORY[0x227676638]();
      v32 = self;
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v83 = v34;
        v84 = 2112;
        v85 = v26;
        _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_INFO, "%{public}@Failed to create event object with event model %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v31);
    }

  }
  else
  {
    v29 = (HMDCalendarEvent *)v20;
  }
  v35 = v26;
  objc_opt_class();
  v36 = objc_opt_isKindOfClass();

  if (v8 && (v36 & 1) != 0)
  {
    -[HMDTrigger home](self, "home");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[HMDSignificantTimeEvent initWithModel:home:]([HMDSignificantTimeEvent alloc], "initWithModel:home:", v35, v37);

    if (v38)
    {
      -[HMDEventTrigger addEvent:](self, "addEvent:", v38);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "postNotificationName:object:userInfo:", CFSTR("HMDEventTriggerCharacteristicBasedEventAddedNotification"), v37, 0);

      }
    }
    else
    {
      v40 = (void *)MEMORY[0x227676638]();
      v41 = self;
      HMFGetOSLogHandle();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v83 = v43;
        v84 = 2112;
        v85 = v35;
        _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_INFO, "%{public}@Failed to create event object with event model %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v40);
    }

  }
  else
  {
    v38 = (HMDSignificantTimeEvent *)v29;
  }
  v44 = v35;
  objc_opt_class();
  v45 = objc_opt_isKindOfClass();

  if (v8 && (v45 & 1) != 0)
  {
    -[HMDTrigger home](self, "home");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = -[HMDDurationEvent initWithModel:home:]([HMDDurationEvent alloc], "initWithModel:home:", v44, v46);

    if (v47)
    {
      -[HMDEventTrigger addEvent:](self, "addEvent:", v47);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "postNotificationName:object:userInfo:", CFSTR("HMDEventTriggerCharacteristicBasedEventAddedNotification"), v46, 0);

      }
    }
    else
    {
      v49 = (void *)MEMORY[0x227676638]();
      v50 = self;
      HMFGetOSLogHandle();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v83 = v52;
        v84 = 2112;
        v85 = v44;
        _os_log_impl(&dword_2218F0000, v51, OS_LOG_TYPE_INFO, "%{public}@Failed to create event object with event model %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v49);
    }

  }
  else
  {
    v47 = (HMDDurationEvent *)v38;
  }
  v53 = v44;
  objc_opt_class();
  v54 = objc_opt_isKindOfClass();

  if (v8 && (v54 & 1) != 0)
  {
    -[HMDTrigger home](self, "home");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = -[HMDCharacteristicThresholdRangeEvent initWithModel:home:]([HMDCharacteristicThresholdRangeEvent alloc], "initWithModel:home:", v53, v55);

    if (v56)
    {
      -[HMDEventTrigger addEvent:](self, "addEvent:", v56);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "postNotificationName:object:userInfo:", CFSTR("HMDEventTriggerCharacteristicBasedEventAddedNotification"), v55, 0);

      }
    }
    else
    {
      v58 = (void *)MEMORY[0x227676638]();
      v59 = self;
      HMFGetOSLogHandle();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v83 = v61;
        v84 = 2112;
        v85 = v53;
        _os_log_impl(&dword_2218F0000, v60, OS_LOG_TYPE_INFO, "%{public}@Failed to create event object with event model %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v58);
    }

  }
  else
  {
    v56 = (HMDCharacteristicThresholdRangeEvent *)v47;
  }
  v62 = v53;
  objc_opt_class();
  v63 = objc_opt_isKindOfClass();

  if (v8 && (v63 & 1) != 0)
  {
    -[HMDTrigger home](self, "home");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = -[HMDPresenceEvent initWithModel:home:]([HMDPresenceEvent alloc], "initWithModel:home:", v62, v64);

    if (v65)
    {
      -[HMDEventTrigger addEvent:](self, "addEvent:", v65);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "postNotificationName:object:userInfo:", CFSTR("HMDEventTriggerCharacteristicBasedEventAddedNotification"), v64, 0);

      }
    }
    else
    {
      v68 = (void *)MEMORY[0x227676638]();
      v69 = self;
      HMFGetOSLogHandle();
      v70 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v83 = v71;
        v84 = 2112;
        v85 = v62;
        _os_log_impl(&dword_2218F0000, v70, OS_LOG_TYPE_INFO, "%{public}@Failed to create event object with event model %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v68);
    }

    if (v65)
      goto LABEL_71;
LABEL_66:
    v67 = 0;
    goto LABEL_74;
  }
  v65 = (HMDPresenceEvent *)v56;
  if (!v56)
    goto LABEL_66;
LABEL_71:
  v72 = (void *)MEMORY[0x227676638]();
  v73 = self;
  HMFGetOSLogHandle();
  v74 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDEventTrigger events](v73, "events");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v83 = v75;
    v84 = 2112;
    v85 = v65;
    v86 = 2112;
    v87 = v76;
    _os_log_impl(&dword_2218F0000, v74, OS_LOG_TYPE_DEBUG, "%{public}@Added new event %@ to %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v72);
  -[HMDTrigger msgDispatcher](v73, "msgDispatcher");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTrigger workQueue](v73, "workQueue");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPresenceEvent configure:messageDispatcher:queue:delegate:](v65, "configure:messageDispatcher:queue:delegate:", v73, v77, v78, v73);

  -[HMDEventTrigger _activateWithCompletion:](v73, "_activateWithCompletion:", 0);
  -[HMDPresenceEvent createPayload](v65, "createPayload", CFSTR("kEventTriggerEventsKey"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = v79;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDTrigger markChangedForMessage:](v73, "markChangedForMessage:", v7);
LABEL_74:
  objc_msgSend(v7, "respondWithPayload:", v67);

}

- (void)_handleRemoveEventsFromEventTrigger:(id)a3 relay:(BOOL)a4
{
  void *v5;
  void *v6;

  -[HMDTrigger updateEventTriggerMessage:message:relay:](self, "updateEventTriggerMessage:message:relay:", 3, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    -[HMDEventTrigger _removeEventsFromEventTrigger:](self, "_removeEventsFromEventTrigger:", v5);
    v5 = v6;
  }

}

- (void)_handleRemoveEventsFromEventTrigger:(id)a3
{
  -[HMDEventTrigger _handleRemoveEventsFromEventTrigger:relay:](self, "_handleRemoveEventsFromEventTrigger:relay:", a3, 1);
}

- (void)_removeEventsFromEventTrigger:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDEventModel *v8;
  void *v9;
  void *v10;
  HMDEventModel *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDEventTrigger *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  HMDEventTrigger *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void (**v30)(_QWORD, _QWORD, _QWORD);
  int v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "uuidForKey:", CFSTR("kEventUUIDKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEventTrigger events](self, "events");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_firstObjectWithUUID:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v4, "isAuthorizedForLocationAccess") & 1) != 0)
    {
      v8 = [HMDEventModel alloc];
      objc_msgSend(v7, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDTrigger uuid](self, "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v8, "initWithObjectChangeType:uuid:parentUUID:", 3, v9, v10);

      -[HMDTrigger home](self, "home");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "backingStore");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "transaction:options:", v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "add:withMessage:", v11, v4);
      objc_msgSend(v16, "run");

      goto LABEL_14;
    }
    v24 = (void *)MEMORY[0x227676638]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543362;
      v32 = v27;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Client does have authorization for location, cannot remove event", (uint8_t *)&v31, 0xCu);

    }
    objc_autoreleasePoolPop(v24);
    v22 = (void *)MEMORY[0x24BDD1540];
    v23 = 85;
  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDTrigger name](v18, "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543874;
      v32 = v20;
      v33 = 2112;
      v34 = v5;
      v35 = 2112;
      v36 = v21;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Couldn't find event with UUID %@ in trigger %@", (uint8_t *)&v31, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
    v22 = (void *)MEMORY[0x24BDD1540];
    v23 = 2;
  }
  objc_msgSend(v22, "hmErrorWithCode:", v23);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(v4, "responseHandler");
    v30 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v30)[2](v30, v28, 0);

  }
LABEL_14:

}

- (void)_handleRemoveEventModel:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDEventTrigger *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDEventTrigger events](self, "events");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hmf_firstObjectWithUUID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v14;
    v27 = 2112;
    v28 = v10;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Removing event %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  if (v10)
  {
    v15 = v10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;

    objc_msgSend(v17, "invalidate");
    -[HMDEventTrigger removeEvent:](v12, "removeEvent:", v15);
    v23 = CFSTR("kUUIDsOfEventsKey");
    objc_msgSend(v15, "uuid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDTrigger markChangedForMessage:](v12, "markChangedForMessage:", v7);
    objc_msgSend(v7, "respondWithPayload:", v21);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "respondWithError:", v21);
  }

}

- (BOOL)addEventsFromMessage:(id)a3 preserveUUIDs:(BOOL)a4 transaction:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  HMDEventTrigger *v15;
  void *v16;
  char v17;
  BOOL v18;

  v10 = a3;
  v11 = a5;
  objc_msgSend(v10, "arrayForKey:", CFSTR("kEventTriggerEventsKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayForKey:", CFSTR("kEventTriggerEndEventsKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (!-[HMDEventTrigger addEventsFromInfo:preserveUUIDs:endEvent:transaction:message:error:](self, v12, a4, MEMORY[0x24BDBD1C0], v11, v10, a6))
    {
      v18 = 0;
      goto LABEL_7;
    }
    v14 = (void *)MEMORY[0x24BDBD1C8];
    v15 = self;
    v16 = v13;
    v17 = a4;
  }
  else
  {
    v15 = self;
    v16 = v12;
    v17 = a4;
    v14 = 0;
  }
  v18 = -[HMDEventTrigger addEventsFromInfo:preserveUUIDs:endEvent:transaction:message:error:](v15, v16, v17, v14, v11, v10, a6);
LABEL_7:

  return v18;
}

- (BOOL)_checkAddEventModel:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  BOOL v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "endEvent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  v10 = (v9 & 1) == 0
     && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
     && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
     && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
     && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
     || -[HMDEventTrigger checkSharedEventTriggerActivationResidentRequirement:](self, "checkSharedEventTriggerActivationResidentRequirement:", v7);

  return v10;
}

- (BOOL)checkSharedEventTriggerActivationResidentRequirement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t i;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  HMDEventTrigger *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  HMDEventTrigger *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDTrigger home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enabledResidents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v27 != v11)
            objc_enumerationMutation(v7);
          v10 |= objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "supportsSharedEventTriggerActivation", (_QWORD)v26);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v9);

      if ((v10 & 1) != 0)
      {
        LOBYTE(v13) = 1;
        goto LABEL_21;
      }
    }
    else
    {

    }
    v20 = (void *)MEMORY[0x227676638]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v23;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Did not find any compatible resident device", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(v4, "responseHandler");
    v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v4, "responseHandler");
      v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x24BDD1540];
      v19 = 92;
      goto LABEL_20;
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v17;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Did not find any resident device", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(v4, "responseHandler");
    v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v4, "responseHandler");
      v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x24BDD1540];
      v19 = 91;
LABEL_20:
      objc_msgSend(v18, "hmErrorWithCode:", v19, (_QWORD)v26);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v13)[2](v13, v24, 0);

      LOBYTE(v13) = 0;
    }
  }
LABEL_21:

  return (char)v13;
}

- (void)_handleUpdateEventsOnEventTrigger:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDEventTrigger *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t i;
  void *v20;
  void *v21;
  HMDEventTrigger *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDTrigger updateEventTriggerMessage:message:relay:](self, "updateEventTriggerMessage:message:relay:", 2, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HMDEventTrigger _updateEventsOnEventTrigger:](self, "_updateEventsOnEventTrigger:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDTrigger home](self, "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") && objc_msgSend(v7, "isSharedAdmin"))
    {
      v30 = v7;
      v31 = (void *)objc_msgSend(v4, "mutableCopy");
      objc_msgSend(v31, "setResponseHandler:", 0);
      if (-[HMDEventTrigger checkSharedEventTriggerActivationResidentRequirement:](self, "checkSharedEventTriggerActivationResidentRequirement:", 0))
      {
        v8 = (void *)MEMORY[0x227676638]();
        v9 = self;
        HMFGetOSLogHandle();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "name");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v38 = v11;
          v39 = 2112;
          v40 = v12;
          _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@The resident supports shared-trigger-activation, relaying the update events message as is : %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v8);
        objc_msgSend(v30, "administratorHandler");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "operationForMessage:error:", v31, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v13, "addOperation:", v14);

      }
      else
      {
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v13 = v6;
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v15)
        {
          v16 = v15;
          v27 = v6;
          v28 = v5;
          v29 = v4;
          v17 = *(_QWORD *)v33;
          v18 = v7;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v33 != v17)
                objc_enumerationMutation(v13);
              v20 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
              v21 = (void *)MEMORY[0x227676638]();
              v22 = self;
              HMFGetOSLogHandle();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v38 = v24;
                v39 = 2112;
                v40 = v20;
                _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@The resident does not support shared-trigger-activation, relaying the message %@", buf, 0x16u);

                v18 = v30;
              }

              objc_autoreleasePoolPop(v21);
              objc_msgSend(v18, "administratorHandler");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "operationForMessage:error:", v31, 0);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              if (v26)
                objc_msgSend(v25, "addOperation:", v26);

            }
            v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
          }
          while (v16);
          v5 = v28;
          v4 = v29;
          v6 = v27;
        }
      }

      v7 = v30;
    }

  }
}

- (id)_updateEventsOnEventTrigger:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  HMDEventTrigger *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  HMDEventTrigger *v31;
  NSObject *v32;
  void *v33;
  HMDEventModel *v34;
  void *v35;
  void *v36;
  HMDEventModel *v37;
  void *v38;
  HMDEventTrigger *v39;
  NSObject *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void (**v50)(void *, _QWORD);
  void *v51;
  void (**v52)(_QWORD, _QWORD, _QWORD);
  void *v53;
  HMDEventTrigger *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  HMDEventTrigger *v59;
  NSObject *v60;
  void *v61;
  void *v63;
  HMDEventTrigger *v64;
  NSObject *v65;
  void *v66;
  __int128 v67;
  id obj;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  id v73;
  id v74;
  void *v75;
  void *v76;
  _QWORD aBlock[4];
  id v79;
  id v80;
  char v81;
  id location;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  const __CFString *v92;
  void *v93;
  _BYTE v94[128];
  const __CFString *v95;
  uint64_t v96;
  uint8_t v97[128];
  uint8_t buf[4];
  void *v99;
  __int16 v100;
  id v101;
  uint64_t v102;

  v102 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v69 = v3;
  if ((objc_msgSend(v3, "isRemote") & 1) != 0
    || (-[HMDEventTrigger locationEvents](self, "locationEvents"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "count"),
        v4,
        v3 = v69,
        !v5)
    || (objc_msgSend(v69, "isAuthorizedForLocationAccess") & 1) != 0)
  {
    objc_msgSend(v3, "arrayForKey:", CFSTR("kEventTriggerEventsKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v69, "BOOLForKey:", CFSTR("kEventTriggerEndEvent"));
    -[HMDTrigger home](self, "home");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "backingStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "transaction:options:", v9, v10);
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    obj = v6;
    v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v97, 16);
    v12 = v71 != 0;
    if (v71)
    {
      v70 = *(_QWORD *)v89;
      *(_QWORD *)&v11 = 138543362;
      v67 = v11;
LABEL_6:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v89 != v70)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * v13);
        v87 = 0;
        -[HMDEventTrigger createEventModel:endEvent:message:checkForSupport:transaction:error:](self, "createEventModel:endEvent:message:checkForSupport:transaction:error:", v14, v7, v69, 1, v76, &v87, v67);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = v87;
        if (!v15)
          break;
        if (!-[HMDEventTrigger _checkAddEventModel:message:](self, "_checkAddEventModel:message:", v15, v69))
        {
          v53 = (void *)MEMORY[0x227676638]();
          v54 = self;
          HMFGetOSLogHandle();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v67;
            v99 = v56;
            _os_log_impl(&dword_2218F0000, v55, OS_LOG_TYPE_INFO, "%{public}@Cannot update events - Incompatible home hub", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v53);
LABEL_42:

          v57 = 0;
          goto LABEL_47;
        }
        if (objc_msgSend(v75, "isSharedAdmin"))
        {
          v16 = (void *)MEMORY[0x227676638]();
          v17 = self;
          HMFGetOSLogHandle();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v67;
            v99 = v19;
            _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@shared admin is sending the request to resident.", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v16);
          v20 = objc_alloc(MEMORY[0x24BE3F1B8]);
          -[HMDTrigger uuid](v17, "uuid");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)objc_msgSend(v20, "initWithTarget:", v21);

          v23 = (void *)MEMORY[0x24BE3F1B0];
          v95 = CFSTR("kEventTriggerEventsKey");
          v96 = v14;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "messageWithName:qualityOfService:destination:payload:", CFSTR("kAddEventToEventTriggerRequestKey"), 9, v22, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v72, "addObject:", v25);
        }
        objc_msgSend(v76, "add:withMessage:", v15, 0);

        if (v71 == ++v13)
        {
          v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v97, 16);
          if (v71)
            goto LABEL_6;
          goto LABEL_17;
        }
      }
      objc_msgSend(v69, "responseHandler");
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      if (v51)
      {
        if (!v73)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
          v73 = (id)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v69, "responseHandler");
        v52 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, id, _QWORD))v52)[2](v52, v73, 0);

      }
      v15 = 0;
      goto LABEL_42;
    }
LABEL_17:

    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    -[HMDEventTrigger events](self, "events");
    v74 = (id)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v84;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v84 != v27)
            objc_enumerationMutation(v74);
          v29 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
          if ((_DWORD)v7 == objc_msgSend(v29, "isEndEvent"))
          {
            v30 = (void *)MEMORY[0x227676638]();
            v31 = self;
            HMFGetOSLogHandle();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v99 = v33;
              v100 = 2112;
              v101 = v29;
              _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_INFO, "%{public}@Deleting event %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v30);
            v34 = [HMDEventModel alloc];
            objc_msgSend(v29, "uuid");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDTrigger uuid](v31, "uuid");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v34, "initWithObjectChangeType:uuid:parentUUID:", 3, v35, v36);

            if (objc_msgSend(v75, "isSharedAdmin"))
            {
              v38 = (void *)MEMORY[0x227676638]();
              v39 = v31;
              HMFGetOSLogHandle();
              v40 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v99 = v41;
                _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_ERROR, "%{public}@Admin user : Remove event from trigger", buf, 0xCu);

              }
              objc_autoreleasePoolPop(v38);
              v42 = objc_alloc(MEMORY[0x24BE3F1B8]);
              -[HMDTrigger uuid](v39, "uuid");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = (void *)objc_msgSend(v42, "initWithTarget:", v43);

              v45 = (void *)MEMORY[0x24BE3F1B0];
              v92 = CFSTR("kEventUUIDKey");
              objc_msgSend(v29, "uuid");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "UUIDString");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v93 = v47;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "messageWithName:qualityOfService:destination:payload:", CFSTR("kRemoveEventFromEventTriggerRequestKey"), 9, v44, v48);
              v49 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v72, "addObject:", v49);
            }
            objc_msgSend(v76, "add:withMessage:", v37, 0);

            v12 = 1;
          }
        }
        v26 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
      }
      while (v26);
    }

    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __47__HMDEventTrigger__updateEventsOnEventTrigger___block_invoke;
    aBlock[3] = &unk_24E77B448;
    objc_copyWeak(&v80, &location);
    v81 = v7;
    v79 = v69;
    v50 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
    if (v12)
    {
      objc_msgSend(v76, "run:", v50);
    }
    else
    {
      v58 = (void *)MEMORY[0x227676638]();
      v59 = self;
      HMFGetOSLogHandle();
      v60 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v99 = v61;
        _os_log_impl(&dword_2218F0000, v60, OS_LOG_TYPE_ERROR, "%{public}@No events updated, calling the completion handler rightaway", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v58);
      v50[2](v50, 0);
    }
    v57 = (void *)objc_msgSend(v72, "copy");

    objc_destroyWeak(&v80);
    objc_destroyWeak(&location);
LABEL_47:

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 85);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v63 = (void *)MEMORY[0x227676638](objc_msgSend(v69, "respondWithError:", obj));
    v64 = self;
    HMFGetOSLogHandle();
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v99 = v66;
      v100 = 2112;
      v101 = obj;
      _os_log_impl(&dword_2218F0000, v65, OS_LOG_TYPE_INFO, "%{public}@Client does not have authorization for location, cannot remove event. [%@]", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v63);
    v57 = 0;
  }

  return v57;
}

- (void)_handleUpdateEventTrigger:(id)a3
{
  id v4;
  void *v5;
  HMDEventTrigger *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  id v12;
  void *v13;
  void *v14;
  BOOL v15;
  HMDEventTriggerModel *v16;
  void *v17;
  void *v18;
  HMDEventTriggerModel *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  HMDEventTrigger *v42;
  NSObject *v43;
  void *v44;
  HMDEventTrigger *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v53[4];
  id v54;
  id v55;
  HMDEventTriggerModel *v56;
  id v57;
  id v58;
  HMDEventTrigger *v59;
  id v60;
  id v61;
  _QWORD v62[4];
  id v63;
  id v64;
  id location;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  id v69;
  __int16 v70;
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messagePayload");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v67 = v8;
    v68 = 2112;
    v69 = v4;
    v70 = 2112;
    v71 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Received request to update Event Trigger %@ / %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDTrigger home](v6, "home");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "enabledResidents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count") == 0;

  if (!v11)
  {
    objc_msgSend(v4, "stringForKey:", CFSTR("kTriggerName"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberForKey:", CFSTR("kEventTriggerRecurrencesKey"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v49, "unsignedIntegerValue") == 127)
    {
      v48 = 0;
    }
    else
    {
      HMDaysOfTheWeekToDateComponents();
      v48 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v50 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_initWeak(&location, v6);
    v62[0] = MEMORY[0x24BDAC760];
    v62[1] = 3221225472;
    v62[2] = __45__HMDEventTrigger__handleUpdateEventTrigger___block_invoke;
    v62[3] = &unk_24E798D90;
    objc_copyWeak(&v64, &location);
    v12 = v4;
    v63 = v12;
    objc_msgSend(v50, "setResponseHandler:", v62);
    -[HMDTrigger name](v6, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqualToString:", v51))
    {

    }
    else
    {
      -[HMDTrigger uuid](v6, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[HMDEventTrigger _validateUpdatingTriggerWithName:uuid:message:](v6, "_validateUpdatingTriggerWithName:uuid:message:", v51, v14, v50);

      if (!v15)
      {
LABEL_28:

        objc_destroyWeak(&v64);
        objc_destroyWeak(&location);

        goto LABEL_29;
      }
    }
    if (v49 || +[HMDEventTrigger __validateRecurrences:](HMDEventTrigger, "__validateRecurrences:", v48))
    {
      v16 = [HMDEventTriggerModel alloc];
      -[HMDTrigger uuid](v6, "uuid");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "uuid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v16, "initWithObjectChangeType:uuid:parentUUID:", 2, v17, v18);

      objc_msgSend(v52, "backingStore");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "transaction:options:", v21, v22);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMDEventTriggerModel setName:](v19, "setName:", v51);
      objc_msgSend(v12, "stringForKey:", *MEMORY[0x24BDD6FB0]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDEventTriggerModel setConfiguredName:](v19, "setConfiguredName:", v23);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v12, "BOOLForKey:", CFSTR("kTriggerActivate")));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDEventTriggerModel setActive:](v19, "setActive:", v24);

      objc_msgSend(v12, "predicateForKey:", CFSTR("kEventTriggerConditionKey"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (v46)
      {
        -[HMDEventTrigger predicateUtilities](v6, "predicateUtilities");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "rewritePredicateForDaemon:message:", v46, v12);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v26, 1, 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDEventTriggerModel setEvaluationCondition:](v19, "setEvaluationCondition:", v27);

      }
      else
      {
        -[HMDEventTriggerModel setEvaluationCondition:](v19, "setEvaluationCondition:", 0);
      }
      objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v48, 1, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDEventTriggerModel setRecurrences:](v19, "setRecurrences:", v28);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v12, "BOOLForKey:", CFSTR("kEventTriggerExecuteOnce")));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDEventTriggerModel setExecuteOnce:](v19, "setExecuteOnce:", v29);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v12, "BOOLForKey:", *MEMORY[0x24BDD6FC0]));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDEventTriggerModel setAutoDelete:](v19, "setAutoDelete:", v30);

      v31 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      if (-[HMDEventTrigger _populateTriggerModel:fromBuilderMessage:transaction:responsePayload:](v6, "_populateTriggerModel:fromBuilderMessage:transaction:responsePayload:", v19, v50, v47, v31))
      {
        v45 = -[HMDEventTrigger initWithModel:home:message:]([HMDEventTrigger alloc], "initWithModel:home:message:", v19, v52, v12);
        objc_msgSend(v12, "arrayForKey:", CFSTR("kEventTriggerEventsKey"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDEventTrigger triggerEvents](v6, "triggerEvents");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)objc_msgSend(v33, "mutableCopy");
        v61 = 0;
        v35 = -[HMDEventTrigger updateEventsFromInfo:existingEvents:preserveUUIDs:endEvent:transaction:message:error:](v45, v32, v34, MEMORY[0x24BDBD1C0], v47, v12, &v61);
        v36 = v61;

        if ((v35 & 1) != 0)
        {

          objc_msgSend(v12, "arrayForKey:", CFSTR("kEventTriggerEndEventsKey"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDEventTrigger endEvents](v6, "endEvents");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = (void *)objc_msgSend(v38, "mutableCopy");
          v60 = 0;
          v40 = -[HMDEventTrigger updateEventsFromInfo:existingEvents:preserveUUIDs:endEvent:transaction:message:error:](v45, v37, v39, MEMORY[0x24BDBD1C8], v47, v12, &v60);
          v36 = v60;

          if ((v40 & 1) != 0)
          {
            objc_msgSend(v47, "add:", v19);
            v53[0] = MEMORY[0x24BDAC760];
            v53[1] = 3221225472;
            v53[2] = __45__HMDEventTrigger__handleUpdateEventTrigger___block_invoke_106;
            v53[3] = &unk_24E77EE60;
            v54 = v50;
            v55 = v31;
            v56 = v19;
            v57 = v46;
            v58 = v52;
            v59 = v6;
            objc_msgSend(v47, "run:", v53);

          }
          else
          {
            objc_msgSend(v50, "respondWithError:", v36);
          }
        }
        else
        {
          objc_msgSend(v50, "respondWithError:", v36);
        }

      }
    }
    else
    {
      v41 = (void *)MEMORY[0x227676638]();
      v42 = v6;
      HMFGetOSLogHandle();
      v43 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v67 = v44;
        v68 = 2112;
        v69 = v48;
        _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_ERROR, "%{public}@Received invalid values for recurrences: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v41);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
      v19 = (HMDEventTriggerModel *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "respondWithError:", v19);
    }

    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 91);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "respondWithError:", v51);
LABEL_29:

}

- (Class)eventTriggerTypeToEventClass:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kEventTriggerTypeCharacteristicEventKey")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("kEventTriggerTypeLocationEventKey")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("kEventTriggerTypeCalendarEventKey")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("kEventTriggerTypeSignificantTimeEventKey")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("kEventTriggerTypeCharacteristicThresholdRangeEventKey")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("kEventTriggerTypePresenceEventKey")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("kEventTriggerTypeDurationEventKey")))
  {
    objc_opt_class();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (Class)v4;
}

- (BOOL)_validateUpdatingTriggerWithName:(id)a3 uuid:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  HMDEventTrigger *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    v16 = (void *)MEMORY[0x24BDD1540];
    v17 = 20;
LABEL_9:
    objc_msgSend(v16, "hmErrorWithCode:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "respondWithError:", v18);

    v19 = 0;
    goto LABEL_10;
  }
  if (!objc_msgSend(v8, "length"))
  {
    v16 = (void *)MEMORY[0x24BDD1540];
    v17 = 3;
    goto LABEL_9;
  }
  v11 = HMMaxLengthForNaming();
  if (objc_msgSend(v8, "length") > v11)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543362;
      v27 = v15;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@New name is longer than the pre-defined max length", (uint8_t *)&v26, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    v16 = (void *)MEMORY[0x24BDD1540];
    v17 = 46;
    goto LABEL_9;
  }
  -[HMDTrigger home](self, "home");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "triggerWithName:", v8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22
    && (objc_msgSend(v22, "uuid"),
        v23 = (void *)objc_claimAutoreleasedReturnValue(),
        v24 = objc_msgSend(v23, "isEqual:", v9),
        v23,
        (v24 & 1) == 0))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "respondWithError:", v25);

    v19 = 0;
  }
  else
  {
    v19 = 1;
  }

LABEL_10:
  return v19;
}

- (BOOL)_populateTriggerModel:(id)a3 fromBuilderMessage:(id)a4 transaction:(id)a5 responsePayload:(id)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  int v33;
  id v34;
  void *v35;
  HMDEventTrigger *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  HMDEventTrigger *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  BOOL v46;
  uint64_t v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t k;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  HMDEventTrigger *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  HMDEventTrigger *v70;
  NSObject *v71;
  void *v72;
  id v74;
  void *v75;
  void *v76;
  HMDEventTrigger *obj;
  id obja;
  void *v79;
  id v80;
  id v81;
  id v82;
  void *v83;
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  id v89;
  id v90;
  id v91;
  id v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[128];
  uint8_t v102[128];
  uint8_t buf[4];
  void *v104;
  __int16 v105;
  id v106;
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x24BDAC8D0];
  v80 = a3;
  v10 = a4;
  v82 = a5;
  v81 = a6;
  obj = self;
  -[HMDTrigger home](self, "home");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v79 = v10;
  objc_msgSend(v10, "arrayForKey:", CFSTR("kTriggerActionSetUUIDKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v97, v107, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v98;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v98 != v14)
          objc_enumerationMutation(v11);
        v16 = *(id *)(*((_QWORD *)&v97 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v17 = v16;
        else
          v17 = 0;
        v18 = v17;

        if (!v18)
          goto LABEL_25;
        v19 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v18);
        if (!v19)
        {
          v18 = v16;
LABEL_25:
          v35 = (void *)MEMORY[0x227676638]();
          v36 = obj;
          HMFGetOSLogHandle();
          v37 = objc_claimAutoreleasedReturnValue();
          v39 = v79;
          v38 = v80;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v104 = v40;
            v105 = 2112;
            v106 = v18;
            _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@Invalid ActionSet reference: '%@'", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v35);
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
          v20 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "respondWithError:", v20);
          goto LABEL_57;
        }
        v20 = (id)v19;
        objc_msgSend(v83, "actionSetWithUUID:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v21)
        {
          v41 = (void *)MEMORY[0x227676638]();
          v42 = obj;
          HMFGetOSLogHandle();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v104 = v44;
            v105 = 2112;
            v106 = v20;
            _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_ERROR, "%{public}@Failed to resolve ActionSet reference: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v41);
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v79;
          objc_msgSend(v79, "respondWithError:", v45);

          v46 = 0;
          v38 = v80;
          goto LABEL_58;
        }
        v22 = v21;
        objc_msgSend(v21, "uuid");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "UUIDString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "addObject:", v24);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v97, v107, 16);
      if (v13)
        continue;
      break;
    }
  }

  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  -[HMDTrigger actionSets](obj, "actionSets");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v93, v102, 16);
  if (v26)
  {
    v27 = v26;
    v11 = 0;
    v28 = *(_QWORD *)v94;
    v29 = *MEMORY[0x24BDD5218];
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v94 != v28)
          objc_enumerationMutation(v25);
        v31 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * j);
        objc_msgSend(v31, "type");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "isEqual:", v29);

        if (v33)
        {
          v34 = v31;

          v11 = v34;
        }
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v93, v102, 16);
    }
    while (v27);
  }
  else
  {
    v11 = 0;
  }

  v39 = v79;
  objc_msgSend(v79, "dictionaryForKey:", CFSTR("kTriggerOwnedActionSetKey"));
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v38 = v80;
  if (!v18)
    goto LABEL_52;
  if (v11)
  {
    objc_msgSend(v11, "modelObjectWithChangeType:", 2);
    v47 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "add:", v47);

    v91 = 0;
    v92 = 0;
    LOBYTE(v47) = -[HMDActionSet _updateActionSetFromDictionary:transaction:response:error:](v11, v18, v82, &v92, &v91);
    v48 = v92;
    v20 = v91;
    if ((v47 & 1) != 0)
    {
      objc_msgSend(v81, "setObject:forKeyedSubscript:", v48, CFSTR("kTriggerOwnedActionSetKey"));
      objc_msgSend(v11, "uuid");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "UUIDString");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "addObject:", v50);
LABEL_51:

LABEL_52:
      v20 = (id)objc_msgSend(v84, "copy");
      objc_msgSend(v38, "setCurrentActionSets:", v20);
      v46 = 1;
      goto LABEL_58;
    }
    v64 = (void *)MEMORY[0x227676638]();
    v65 = obj;
    HMFGetOSLogHandle();
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v104 = v67;
      _os_log_impl(&dword_2218F0000, v66, OS_LOG_TYPE_ERROR, "%{public}@Failed to modify trigger-owned action set", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v64);
    objc_msgSend(v79, "respondWithError:", v20);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "hm_deriveUUIDFromBaseUUID:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "UUIDString");
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    v54 = (void *)*MEMORY[0x24BDD5218];
    v89 = 0;
    v90 = 0;
    v75 = v53;
    -[HMDHome _createActionSetWithUUID:name:type:fromDictionary:transaction:response:error:](v83, v51, v53, v54, v18, v82, &v90, &v89);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v90;
    v20 = v89;

    v76 = v51;
    if (v55)
    {
      v74 = v48;
      objc_msgSend(v81, "setObject:forKeyedSubscript:", v48, CFSTR("kTriggerOwnedActionSetKey"));
      objc_msgSend(v51, "UUIDString");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "addObject:", v56);

      v87 = 0u;
      v88 = 0u;
      v85 = 0u;
      v86 = 0u;
      -[HMDTrigger actionSets](obj, "actionSets");
      obja = (id)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v85, v101, 16);
      if (v57)
      {
        v58 = v57;
        v59 = *(_QWORD *)v86;
        while (2)
        {
          for (k = 0; k != v58; ++k)
          {
            if (*(_QWORD *)v86 != v59)
              objc_enumerationMutation(obja);
            v61 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * k);
            objc_msgSend(v61, "type");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = objc_msgSend(v62, "isEqualToString:", v54);

            if (v63)
            {
              objc_msgSend(v61, "modelObjectWithChangeType:", 3);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v82, "add:", v68);

              goto LABEL_50;
            }
          }
          v58 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v85, v101, 16);
          if (v58)
            continue;
          break;
        }
      }
LABEL_50:

      v39 = v79;
      v38 = v80;
      v48 = v74;
      v50 = v75;
      v49 = v76;
      goto LABEL_51;
    }
    v69 = (void *)MEMORY[0x227676638]();
    v70 = obj;
    HMFGetOSLogHandle();
    v71 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v104 = v72;
      _os_log_impl(&dword_2218F0000, v71, OS_LOG_TYPE_ERROR, "%{public}@Failed to create trigger-owned action set", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v69);
    objc_msgSend(v79, "respondWithError:", v20);

  }
LABEL_57:
  v46 = 0;
LABEL_58:

  return v46;
}

- (void)_handleUpdateEventTriggerRecurrences:(id)a3
{
  void *v4;
  void *v5;

  -[HMDTrigger updateEventTriggerMessage:message:relay:](self, "updateEventTriggerMessage:message:relay:", 5, a3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[HMDEventTrigger _updateEventTriggerRecurrences:](self, "_updateEventTriggerRecurrences:", v4);
    v4 = v5;
  }

}

- (void)_updateEventTriggerRecurrences:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  id v15;

  v4 = a3;
  objc_msgSend(v4, "arrayOfDateComponentsForKey:", CFSTR("kEventTriggerRecurrencesKey"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (+[HMDEventTrigger __validateRecurrences:](HMDEventTrigger, "__validateRecurrences:"))
  {
    -[HMDEventTrigger emptyModelObject](self, "emptyModelObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v15, 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRecurrences:", v8);

    -[HMDTrigger home](self, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "backingStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "transaction:options:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "add:withMessage:", v7, v4);
    objc_msgSend(v13, "run");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD5BD8], 3, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "responseHandler");
    v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    ((void (**)(_QWORD, void *, _QWORD))v14)[2](v14, v13, 0);
  }

}

- (void)_eventTriggerRecurrencesUpdated:(id)a3 message:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "copy");
  -[HMDEventTrigger setRecurrences:](self, "setRecurrences:", v7);

  -[HMDEventTrigger recurrences](self, "recurrences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  encodeRootObject();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v11 = CFSTR("kEventTriggerRecurrencesKey");
    v12[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v6, "respondWithPayload:", v10);

}

- (void)_handleUpdateEventTriggerCondition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDEventTrigger *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDEventTrigger *v26;
  NSObject *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDTrigger updateEventTriggerMessage:message:relay:](self, "updateEventTriggerMessage:message:relay:", 4, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "predicateForKey:", CFSTR("kEventTriggerConditionKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543618;
      v30 = v11;
      v31 = 2112;
      v32 = v7;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating evaluation condition for trigger %@", (uint8_t *)&v29, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDEventTrigger predicateUtilities](v9, "predicateUtilities");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsPresenceEvents:", v7);

    if (v13
      && !-[HMDEventTrigger checkSharedEventTriggerActivationResidentRequirement:](v9, "checkSharedEventTriggerActivationResidentRequirement:", v6))
    {
      v25 = (void *)MEMORY[0x227676638]();
      v26 = v9;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138543362;
        v30 = v28;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Presence Event Condition requires shared-trigger-activation capable homehub", (uint8_t *)&v29, 0xCu);

      }
      objc_autoreleasePoolPop(v25);
    }
    else
    {
      -[HMDEventTrigger emptyModelObject](v9, "emptyModelObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;
      v16 = v15;

      -[HMDEventTrigger predicateUtilities](v9, "predicateUtilities");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "rewritePredicateForDaemon:message:", v7, v6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v18, 1, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setEvaluationCondition:", v19);

      -[HMDTrigger home](v9, "home");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "backingStore");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "transaction:options:", v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "add:withMessage:", v16, v6);
      objc_msgSend(v24, "run");

    }
  }

}

- (void)_evaluationConditionUpdated:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[HMDEventTrigger predicateUtilities](self, "predicateUtilities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rewritePredicateForDaemon:message:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDEventTrigger setEvaluationCondition:](self, "setEvaluationCondition:", v9);
  -[HMDEventTrigger evaluationCondition](self, "evaluationCondition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v16 = CFSTR("kEventTriggerConditionKey");
    -[HMDEventTrigger predicateUtilities](self, "predicateUtilities");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDEventTrigger evaluationCondition](self, "evaluationCondition");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "rewritePredicateForClient:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    encodeRootObject();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(v6, "respondWithPayload:", v15);

}

- (void)_handleUpdateOwningDevice:(id)a3
{
  void *v4;
  void *v5;

  -[HMDTrigger updateEventTriggerMessage:message:relay:](self, "updateEventTriggerMessage:message:relay:", 7, a3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[HMDEventTrigger _updateOwningDevice:](self, "_updateOwningDevice:", v4);
    v4 = v5;
  }

}

- (void)_updateOwningDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  HMDEventTrigger *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  void *v20;
  HMDEventTrigger *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[HMDEventTrigger checkSharedEventTriggerActivationResidentRequirement:](self, "checkSharedEventTriggerActivationResidentRequirement:", v4))
  {
    objc_msgSend(v4, "dataForKey:", CFSTR("HM.device"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v27);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v27;
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v6)
    {
      if (v11)
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v12;
        v30 = 2112;
        v31 = v6;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Taking over owner ship of trigger to %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      -[HMDEventTrigger emptyModelObject](v9, "emptyModelObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = v13;
      else
        v14 = 0;
      v15 = v14;

      objc_msgSend(v15, "setOwningDevice:", v6);
      -[HMDTrigger home](v9, "home");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "backingStore");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "transaction:options:", CFSTR("UpdateOwningDevice"), v18);
      v19 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "add:withMessage:", v15, v4);
      objc_msgSend(v19, "run");
    }
    else
    {
      if (v11)
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v24;
        v30 = 2112;
        v31 = v7;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Failed to unarchive device from device data: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      objc_msgSend(v4, "responseHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v25)
        goto LABEL_17;
      objc_msgSend(v4, "responseHandler");
      v19 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v19)[2](v19, v26, 0);

    }
LABEL_17:

    goto LABEL_18;
  }
  v20 = (void *)MEMORY[0x227676638]();
  v21 = self;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v23;
    _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Updating owning device requires shared-trigger-activation capable homehub", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v20);
LABEL_18:

}

- (void)_handleUpdateEventTriggerExecuteOnce:(id)a3
{
  void *v4;
  void *v5;

  -[HMDTrigger updateEventTriggerMessage:message:relay:](self, "updateEventTriggerMessage:message:relay:", 6, a3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[HMDEventTrigger _updateEventTriggerExecuteOnce:](self, "_updateEventTriggerExecuteOnce:", v4);
    v4 = v5;
  }

}

- (void)_updateEventTriggerExecuteOnce:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDEventTrigger *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[HMDEventTrigger checkSharedEventTriggerActivationResidentRequirement:](self, "checkSharedEventTriggerActivationResidentRequirement:", v4))
  {
    v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("kEventTriggerExecuteOnce"));
    -[HMDEventTrigger emptyModelObject](self, "emptyModelObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setExecuteOnce:", v9);

    -[HMDTrigger home](self, "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "backingStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "transaction:options:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "add:withMessage:", v8, v4);
    objc_msgSend(v14, "run");

  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v18;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Execute once requires shared-trigger-activation capable homehub", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
  }

}

- (void)_executeOnceUpdated:(id)a3 message:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[HMDEventTrigger setExecuteOnce:](self, "setExecuteOnce:", objc_msgSend(a3, "BOOLValue"));
  v9 = CFSTR("kEventTriggerExecuteOnce");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDEventTrigger executeOnce](self, "executeOnce"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "respondWithPayload:", v8);
}

- (BOOL)isEventTriggerOnRemoteGatewayForAccessory:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  HMDEventTrigger *v17;
  NSObject *v18;
  void *v19;
  BOOL v20;
  void *v22;
  HMDEventTrigger *v23;
  NSObject *v24;
  void *v25;
  HMDEventTrigger *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  const char *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6
    && -[HMDEventTrigger computedActive](self, "computedActive")
    && !-[HMDEventTrigger shouldActivateOnLocalDevice](self, "shouldActivateOnLocalDevice"))
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = self;
    -[HMDEventTrigger characteristicBaseEvents](self, "characteristicBaseEvents");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v29 != v9)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "characteristic");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "accessory");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "isEqualToString:", v14);

          if (v15)
          {
            v22 = (void *)MEMORY[0x227676638]();
            v23 = v26;
            HMFGetOSLogHandle();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v33 = v25;
              v34 = 2080;
              v35 = "-[HMDEventTrigger isEventTriggerOnRemoteGatewayForAccessory:]";
              _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Event trigger will run on the resident. [%s]", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v22);

            v20 = 1;
            goto LABEL_19;
          }
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v8)
          continue;
        break;
      }
    }

    self = v26;
  }
  v16 = (void *)MEMORY[0x227676638]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v33 = v19;
    v34 = 2080;
    v35 = "-[HMDEventTrigger isEventTriggerOnRemoteGatewayForAccessory:]";
    _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Event trigger will run locally. [%s]", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v16);
  v20 = 0;
LABEL_19:

  return v20;
}

- (BOOL)isEventTriggerOnLocalDeviceForAccessory:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  HMDEventTrigger *v17;
  NSObject *v18;
  void *v19;
  BOOL v20;
  void *v22;
  HMDEventTrigger *v23;
  NSObject *v24;
  void *v25;
  HMDEventTrigger *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  const char *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6
    && -[HMDEventTrigger computedActive](self, "computedActive")
    && -[HMDEventTrigger shouldActivateOnLocalDevice](self, "shouldActivateOnLocalDevice"))
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = self;
    -[HMDEventTrigger characteristicBaseEvents](self, "characteristicBaseEvents");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v29 != v9)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "characteristic");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "accessory");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "isEqualToString:", v14);

          if (v15)
          {
            v22 = (void *)MEMORY[0x227676638]();
            v23 = v26;
            HMFGetOSLogHandle();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v33 = v25;
              v34 = 2080;
              v35 = "-[HMDEventTrigger isEventTriggerOnLocalDeviceForAccessory:]";
              _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Event trigger will run locally. [%s]", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v22);

            v20 = 1;
            goto LABEL_19;
          }
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v8)
          continue;
        break;
      }
    }

    self = v26;
  }
  v16 = (void *)MEMORY[0x227676638]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v33 = v19;
    v34 = 2080;
    v35 = "-[HMDEventTrigger isEventTriggerOnLocalDeviceForAccessory:]";
    _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Event trigger will run on the resident. [%s]", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v16);
  v20 = 0;
LABEL_19:

  return v20;
}

- (id)didOccurEvent:(id)a3 causingDevice:(id)a4
{
  __CFString *v6;
  __CFString *v7;
  void *v8;
  HMDEventTrigger *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  HMDEventTrigger *v17;
  NSObject *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDEventTrigger *v25;
  NSObject *v26;
  void *v27;
  __CFString *v28;
  HMDEventTriggerExecutionSession *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  HMDEventTriggerExecutionSession *v37;
  void *v38;
  HMDEventTrigger *v39;
  NSObject *v40;
  void *v41;
  __CFString *v42;
  void *v43;
  void *v44;
  HMDEventTrigger *v45;
  NSObject *v46;
  void *v47;
  __CFString *v48;
  __CFString *v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  const __CFString *v54;
  __int16 v55;
  __CFString *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v6 = (__CFString *)a3;
  v7 = (__CFString *)a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v52 = v11;
    v53 = 2112;
    v54 = v7;
    v55 = 2112;
    v56 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Event occurred on device %@, %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDEventTrigger executionSession](v9, "executionSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[HMDEventTrigger executionSession](v9, "executionSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postponeRestoreIfWaitingForEndEvent");

    if (v7)
    {
      -[HMDEventTrigger executionSession](v9, "executionSession");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "needsUserConfirmationForDevice:", v7);

      v16 = (void *)MEMORY[0x227676638]();
      v17 = v9;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          v20 = &stru_24E79DB48;
        else
          v20 = CFSTR("not ");
        -[HMDEventTrigger executionSession](v17, "executionSession");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v52 = v19;
        v53 = 2112;
        v54 = v20;
        v55 = 2112;
        v56 = v7;
        v57 = 2112;
        v58 = v21;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Execution session is already in progress, %@adding occurred device %@ for asking confirmation %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v16);
      if (v15)
      {
        -[HMDEventTrigger executionSession](v17, "executionSession");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addEvent:causingDevice:", v6, v7);

        -[HMDEventTrigger executionSession](v17, "executionSession");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
    }
    else
    {
      v44 = (void *)MEMORY[0x227676638]();
      v45 = v9;
      HMFGetOSLogHandle();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDEventTrigger executionSession](v45, "executionSession");
        v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v52 = v47;
        v53 = 2112;
        v54 = v48;
        _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_INFO, "%{public}@Execution session is already in progress, not executing again %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v44);
    }
    v23 = 0;
    goto LABEL_21;
  }
  v50 = v6;
  v24 = (void *)MEMORY[0x227676638]();
  v25 = v9;
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDEventTrigger endEvents](v25, "endEvents");
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v52 = v27;
    v53 = 2112;
    v54 = v28;
    _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Creating execution session with end events %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v24);
  v29 = [HMDEventTriggerExecutionSession alloc];
  -[HMDEventTrigger predicateUtilities](v25, "predicateUtilities");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTrigger workQueue](v25, "workQueue");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTrigger actionSets](v25, "actionSets");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEventTrigger evaluationCondition](v25, "evaluationCondition");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEventTrigger recurrences](v25, "recurrences");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEventTrigger endEvents](v25, "endEvents");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTrigger msgDispatcher](v25, "msgDispatcher");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = -[HMDEventTriggerExecutionSession initWithEventTrigger:predicateUtilities:triggerEvent:causingDevice:workQueue:actionSets:evaluationCondition:recurrences:endEvents:msgDispatcher:](v29, "initWithEventTrigger:predicateUtilities:triggerEvent:causingDevice:workQueue:actionSets:evaluationCondition:recurrences:endEvents:msgDispatcher:", v25, v30, v50, v7, v31, v32, v33, v34, v35, v36);
  -[HMDEventTrigger setExecutionSession:](v25, "setExecutionSession:", v37);

  v38 = (void *)MEMORY[0x227676638]();
  v39 = v25;
  HMFGetOSLogHandle();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDEventTrigger executionSession](v39, "executionSession");
    v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v52 = v41;
    v53 = 2112;
    v54 = v42;
    _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_INFO, "%{public}@Created action set execution session: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v38);
  -[HMDEventTrigger executionSession](v39, "executionSession");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "evaluateFiringTrigger");

  -[HMDEventTrigger executionSession](v39, "executionSession");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v50;
LABEL_21:

  return v23;
}

- (void)executionComplete:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMDTrigger workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__HMDEventTrigger_executionComplete_error___block_invoke;
  block[3] = &unk_24E79BBD0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)resetExecutionState
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDTrigger workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__HMDEventTrigger_resetExecutionState__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_resetExecutionState
{
  void *v3;
  HMDEventTrigger *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDEventTrigger executionSession](v4, "executionSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDEventTrigger userConfirmationSession](v4, "userConfirmationSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Resetting execution sessions %@, confirmation session %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDEventTrigger setExecutionSession:](v4, "setExecutionSession:", 0);
  -[HMDEventTrigger setUserConfirmationSession:](v4, "setUserConfirmationSession:", 0);
}

- (BOOL)_isTriggerFiredNotificationEntitled
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[HMDEventTrigger presenceEvents](self, "presenceEvents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 1;
  }
  else
  {
    -[HMDEventTrigger predicateUtilities](self, "predicateUtilities");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDEventTrigger evaluationCondition](self, "evaluationCondition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "containsPresenceEvents:", v6);

  }
  return v4;
}

- (void)userDidConfirmExecute:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  -[HMDTrigger workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__HMDEventTrigger_userDidConfirmExecute_completionHandler___block_invoke;
  block[3] = &unk_24E78D3F8;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)_userDidConfirmExecute:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDEventTrigger *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v4 = a3;
  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[HMDEventTrigger executionSession](self, "executionSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userConfirmationSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMDEventTrigger executionSession](self, "executionSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "userConfirmationSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "userDidConfirmExecute:completionHandler:", v4, v6);

LABEL_5:
    goto LABEL_6;
  }
  -[HMDEventTrigger userConfirmationSession](self, "userConfirmationSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HMDEventTrigger userConfirmationSession](self, "userConfirmationSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "userDidConfirmExecute:completionHandler:", v4, v6);
    goto LABEL_5;
  }
  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543362;
    v19 = v15;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@There is no confirmation timer running, ignoring the response", (uint8_t *)&v18, 0xCu);

  }
  objc_autoreleasePoolPop(v12);
  v16 = _Block_copy(v6);
  v17 = v16;
  if (v16)
    (*((void (**)(void *, _QWORD))v16 + 2))(v16, 0);

LABEL_6:
}

- (void)_handleUserPermissionRequest:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;
  void *v10;
  id v11;
  void *v12;
  HMDEventTriggerDevice *v13;
  void *v14;
  void *v15;
  HMDEventTrigger *v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  HMDEventTriggerUserConfirmationSession *v21;
  void *v22;
  void *v23;
  HMDEventTriggerUserConfirmationSession *v24;
  void *v25;
  HMDEventTrigger *v26;
  NSObject *v27;
  void *v28;
  void (**v29)(_QWORD, _QWORD, _QWORD);
  HMDEventTriggerDevice *v30;
  void *v31;
  void *v32;
  void *v33;
  void (**v34)(_QWORD, _QWORD, _QWORD);
  void *v35;
  HMDEventTrigger *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  HMDEventTrigger *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "uuidForKey:", CFSTR("kEventTriggerExecutionSessionIdentifierKey"));
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteSourceDevice");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v47 = (void *)v5;
  if (v5 && v6)
  {
    -[HMDTrigger home](self, "home");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v9 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    if (objc_msgSend(v9, "isRemote") && v11 && objc_msgSend(v11, "restriction") != 4)
    {
      objc_msgSend(v8, "homeManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "homeUserFromMessage:home:", v9, v8);
      v13 = (HMDEventTriggerDevice *)objc_claimAutoreleasedReturnValue();

      if (!v13 || (-[HMDEventTriggerDevice isOwner](v13, "isOwner") & 1) == 0)
      {
        v40 = (void *)MEMORY[0x227676638]();
        v41 = self;
        HMFGetOSLogHandle();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v49 = v43;
          v50 = 2112;
          v51 = v9;
          _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_ERROR, "%{public}@Only owner may perform a user permission dialog: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v40);
        objc_msgSend(v9, "responseHandler");
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v44)
          goto LABEL_26;
        objc_msgSend(v9, "responseHandler");
        v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 17);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, _QWORD))v34)[2](v34, v45, 0);

        goto LABEL_20;
      }

    }
    -[HMDEventTrigger userConfirmationSession](self, "userConfirmationSession");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = (void *)MEMORY[0x227676638]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = v11;
        v19 = v7;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v49 = v20;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@There is already a user confirmation session in progress, replacing it", buf, 0xCu);

        v7 = v19;
        v11 = v18;
      }

      objc_autoreleasePoolPop(v15);
      -[HMDEventTrigger setUserConfirmationSession:](v16, "setUserConfirmationSession:", 0);
    }
    v46 = v7;
    v13 = -[HMDEventTriggerDevice initWithDevice:forHome:]([HMDEventTriggerDevice alloc], "initWithDevice:forHome:", v7, v8);
    v21 = [HMDEventTriggerUserConfirmationSession alloc];
    -[HMDTrigger workQueue](self, "workQueue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDTrigger msgDispatcher](self, "msgDispatcher");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[HMDEventTriggerUserConfirmationSession initWithSessionID:eventTrigger:workQueue:msgDispatcher:requestingDevice:](v21, "initWithSessionID:eventTrigger:workQueue:msgDispatcher:requestingDevice:", v47, self, v22, v23, v13);
    -[HMDEventTrigger setUserConfirmationSession:](self, "setUserConfirmationSession:", v24);

    v25 = (void *)MEMORY[0x227676638]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDEventTrigger userConfirmationSession](v26, "userConfirmationSession");
      v29 = v8;
      v30 = v13;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v49 = v28;
      v50 = 2112;
      v51 = v31;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Created a user confirmation session %@", buf, 0x16u);

      v13 = v30;
      v8 = v29;

    }
    objc_autoreleasePoolPop(v25);
    -[HMDEventTrigger userConfirmationSession](v26, "userConfirmationSession");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "createBulletinNotification");

    objc_msgSend(v9, "responseHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v33)
    {
      v7 = v46;
      goto LABEL_26;
    }
    objc_msgSend(v9, "responseHandler");
    v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v34[2](v34, 0, 0);
    v7 = v46;
LABEL_20:

LABEL_26:
    goto LABEL_27;
  }
  v35 = (void *)MEMORY[0x227676638]();
  v36 = self;
  HMFGetOSLogHandle();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v49 = v38;
    _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@Did not receive execution session ID or requesting device", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v35);
  objc_msgSend(v4, "responseHandler");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    objc_msgSend(v4, "responseHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v8)[2](v8, v11, 0);
LABEL_27:

  }
}

- (BOOL)hasUserConfirmationSession
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;

  -[HMDEventTrigger executionSession](self, "executionSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userConfirmationSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 1;
  }
  else
  {
    -[HMDEventTrigger userConfirmationSession](self, "userConfirmationSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 != 0;

  }
  return v5;
}

- (id)messageReceiverChildren
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  if (objc_msgSend((id)-[HMDEventTrigger superclass](self, "superclass"), "instancesRespondToSelector:", sel_messageReceiverChildren))
  {
    v11.receiver = self;
    v11.super_class = (Class)HMDEventTrigger;
    -[HMDTrigger messageReceiverChildren](&v11, sel_messageReceiverChildren);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[HMDEventTrigger events](self, "events");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);

  -[HMDEventTrigger userConfirmationSession](self, "userConfirmationSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v4, "addObject:", v6);

  -[HMDEventTrigger executionSession](self, "executionSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEventTrigger executionSession](self, "executionSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v4, "addObject:", v7);

  v9 = (void *)objc_msgSend(v4, "copy");
  return v9;
}

- (HMDEventTrigger)initWithCoder:(id)a3
{
  id v4;
  HMDEventTrigger *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableArray *currentEvents;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSPredicate *evaluationCondition;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSArray *recurrences;
  HMDPredicateUtilities *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  HMDPredicateUtilities *predicateUtilities;
  HMDEventTriggerDependencyFactory *v30;
  HMDEventTriggerDependencyFactory *dependencyFactory;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _QWORD v38[2];
  _BYTE v39[128];
  _QWORD v40[9];

  v40[8] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)HMDEventTrigger;
  v5 = -[HMDTrigger initWithCoder:](&v37, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v40[0] = objc_opt_class();
    v40[1] = objc_opt_class();
    v40[2] = objc_opt_class();
    v40[3] = objc_opt_class();
    v40[4] = objc_opt_class();
    v40[5] = objc_opt_class();
    v40[6] = objc_opt_class();
    v40[7] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("HM.eventTriggerEvents"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    currentEvents = v5->_currentEvents;
    v5->_currentEvents = (NSMutableArray *)v10;

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v12 = v5->_currentEvents;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v34;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v34 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v16++), "setEventTrigger:", v5, (_QWORD)v33);
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      }
      while (v14);
    }

    +[HMDPredicateUtilities predicateCodingClasses](HMDPredicateUtilities, "predicateCodingClasses");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("HM.eventTriggerCondition"));
    v18 = objc_claimAutoreleasedReturnValue();
    evaluationCondition = v5->_evaluationCondition;
    v5->_evaluationCondition = (NSPredicate *)v18;

    v20 = (void *)MEMORY[0x24BDBCF20];
    v38[0] = objc_opt_class();
    v38[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setWithArray:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("HM.eventTriggerRecurrences"));
    v23 = objc_claimAutoreleasedReturnValue();
    recurrences = v5->_recurrences;
    v5->_recurrences = (NSArray *)v23;

    v5->_executeOnce = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kEventTriggerExecuteOnce"));
    v5->_migratedEventsToRecords = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HM.migratedEventsToRecords"));
    v25 = [HMDPredicateUtilities alloc];
    -[HMDTrigger home](v5, "home");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDTrigger name](v5, "name");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[HMDPredicateUtilities initWithHome:logIdentifier:](v25, "initWithHome:logIdentifier:", v26, v27);
    predicateUtilities = v5->_predicateUtilities;
    v5->_predicateUtilities = (HMDPredicateUtilities *)v28;

    v5->_lock._os_unfair_lock_opaque = 0;
    v30 = objc_alloc_init(HMDEventTriggerDependencyFactory);
    dependencyFactory = v5->_dependencyFactory;
    v5->_dependencyFactory = v30;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)HMDEventTrigger;
  -[HMDTrigger encodeWithCoder:](&v26, sel_encodeWithCoder_, v4);
  if (objc_msgSend(v4, "hmd_isForXPCTransport"))
    objc_msgSend(v4, "encodeInteger:forKey:", -[HMDEventTrigger activationState](self, "activationState"), CFSTR("kEventTriggerActivationStateKey"));
  if (objc_msgSend(v4, "hmd_isForNonAdminSharedUser"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[HMDEventTrigger presenceEvents](self, "presenceEvents", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v23;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v10);
          objc_msgSend(v4, "hmd_user");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "compatibleWithUser:", v12);

          if (v13)
            objc_msgSend(v5, "addObject:", v11);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v8);
    }

    if (objc_msgSend(v5, "count"))
    {
      v14 = (void *)objc_msgSend(v5, "copy");
      objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("HM.eventTriggerEvents"));

    }
  }
  else
  {
    -[HMDEventTrigger events](self, "events");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HM.eventTriggerEvents"));
  }

  -[HMDEventTrigger recurrences](self, "recurrences");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[HMDEventTrigger recurrences](self, "recurrences");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("HM.eventTriggerRecurrences"));

  }
  -[HMDEventTrigger evaluationCondition](self, "evaluationCondition");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[HMDEventTrigger evaluationCondition](self, "evaluationCondition");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "hmd_isForXPCTransport"))
    {
      -[HMDEventTrigger predicateUtilities](self, "predicateUtilities");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDEventTrigger evaluationCondition](self, "evaluationCondition");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "rewritePredicateForClient:", v20);
      v21 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v21;
    }
    objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("HM.eventTriggerCondition"));

  }
  objc_msgSend(v4, "encodeBool:forKey:", -[HMDEventTrigger executeOnce](self, "executeOnce"), CFSTR("kEventTriggerExecuteOnce"));
  if (objc_msgSend(v4, "hmd_isForLocalStore"))
    objc_msgSend(v4, "encodeBool:forKey:", -[HMDEventTrigger migratedEventsToRecords](self, "migratedEventsToRecords"), CFSTR("HM.migratedEventsToRecords"));

}

- (void)_transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  HMDEventTrigger *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  int v22;
  void *v23;
  HMDEventTrigger *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  HMDEventTrigger *v28;
  NSObject *v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (v13)
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543362;
      v32 = v17;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Handling event trigger update", (uint8_t *)&v31, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    -[HMDEventTrigger _handleEventTriggerUpdate:message:](v15, "_handleEventTriggerUpdate:message:", v13, v10);
  }
  else
  {
    v18 = v11;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v20 = v19;

    if (v20)
    {
      objc_msgSend(v10, "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("kMigratedEventsToRecordsRequest"));

      if (v22)
      {
        -[HMDEventTrigger processEventRecords:message:](self, "processEventRecords:message:", v20, v10);
      }
      else
      {
        v27 = (void *)MEMORY[0x227676638]();
        v28 = self;
        HMFGetOSLogHandle();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = 138543362;
          v32 = v30;
          _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_INFO, "%{public}@Handling event add", (uint8_t *)&v31, 0xCu);

        }
        objc_autoreleasePoolPop(v27);
        -[HMDEventTrigger _handleAddEventModel:message:](v28, "_handleAddEventModel:message:", v20, v10);
      }
    }
    else
    {
      v23 = (void *)MEMORY[0x227676638]();
      v24 = self;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 138543362;
        v32 = v26;
        _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Unknown model object", (uint8_t *)&v31, 0xCu);

      }
      objc_autoreleasePoolPop(v23);
    }

  }
}

- (void)processEventRecords:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDEventTrigger *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v11;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Saving to push the event records to cloud", (uint8_t *)&v14, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDTrigger home](v9, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "saveWithReason:postSyncNotification:objectChange:", v13, 0, v6 != 0);

}

- (void)_transactionObjectRemoved:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  HMDEventTrigger *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    -[HMDEventTrigger _handleRemoveEventModel:message:](self, "_handleRemoveEventModel:message:", v10, v7);
  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to cast the given model object to EventModel", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (void)_handleEventTriggerUpdate:(id)a3 message:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  objc_msgSend(v18, "setProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", CFSTR("evaluationCondition"));

  if (v8)
  {
    objc_msgSend(v18, "evaluationCondition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDPredicateUtilities decodePredicateFromData:error:](HMDPredicateUtilities, "decodePredicateFromData:error:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDEventTrigger _evaluationConditionUpdated:message:](self, "_evaluationConditionUpdated:message:", v10, v6);
  }
  objc_msgSend(v18, "setProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsObject:", CFSTR("recurrences"));

  if (v12)
  {
    objc_msgSend(v18, "recurrences");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "decodeArrayOfDateComponents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDEventTrigger _eventTriggerRecurrencesUpdated:message:](self, "_eventTriggerRecurrencesUpdated:message:", v14, v6);
  }
  objc_msgSend(v18, "setProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "containsObject:", CFSTR("executeOnce"));

  if (v16)
  {
    objc_msgSend(v18, "executeOnce");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDEventTrigger _executeOnceUpdated:message:](self, "_executeOnceUpdated:message:", v17, v6);

  }
  -[HMDTrigger _handleTriggerUpdate:message:](self, "_handleTriggerUpdate:message:", v18, v6);

}

- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
  HMDEventTriggerModel *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDEventTriggerModel *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = [HMDEventTriggerModel alloc];
  -[HMDTrigger uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTrigger home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v6, "initWithObjectChangeType:uuid:parentUUID:", a3, v7, v9);

  -[HMDTrigger _fillBaseObjectChangeModel:](self, "_fillBaseObjectChangeModel:", v10);
  -[HMDEventTrigger evaluationCondition](self, "evaluationCondition");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)MEMORY[0x24BDD1618];
    -[HMDEventTrigger evaluationCondition](self, "evaluationCondition");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "archivedDataWithRootObject:requiringSecureCoding:error:", v13, 1, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDEventTriggerModel setEvaluationCondition:](v10, "setEvaluationCondition:", v14);

  }
  -[HMDEventTrigger recurrences](self, "recurrences");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = (void *)MEMORY[0x24BDD1618];
    -[HMDEventTrigger recurrences](self, "recurrences");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "archivedDataWithRootObject:requiringSecureCoding:error:", v17, 1, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDEventTriggerModel setRecurrences:](v10, "setRecurrences:", v18);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDEventTrigger executeOnce](self, "executeOnce"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEventTriggerModel setExecuteOnce:](v10, "setExecuteOnce:", v19);

  return v10;
}

- (id)backingStoreObjects:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEventTrigger modelObjectWithChangeType:version:](self, "modelObjectWithChangeType:version:", 1, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HMDEventTrigger events](self, "events", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "modelObjectWithChangeType:", 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v5;
}

- (id)emptyModelObject
{
  HMDEventTriggerModel *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDEventTriggerModel *v7;

  v3 = [HMDEventTriggerModel alloc];
  -[HMDTrigger uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTrigger home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v3, "initWithObjectChangeType:uuid:parentUUID:", 2, v4, v6);

  return v7;
}

- (BOOL)containsRecurrences
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  unsigned __int8 v14[8];
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  memset(v14, 0, 7);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HMDEventTrigger recurrences](self, "recurrences", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v14[objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6++), "weekday") - 1] = 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v4);
  }

  v7 = 0;
  v8 = 0;
  do
    v8 += v14[v7++];
  while (v7 != 7);
  return (v8 - 1) < 6;
}

- (BOOL)isAuthorizedForLocation
{
  void *v2;
  BOOL v3;

  +[HMDLocation sharedManager](HMDLocation, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "locationAuthorized") == 1;

  return v3;
}

- (BOOL)isOwnerOfHome
{
  void *v2;
  char v3;

  -[HMDTrigger home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOwnerUser");

  return v3;
}

- (BOOL)migratedEventsToRecords
{
  return self->_migratedEventsToRecords;
}

- (void)setMigratedEventsToRecords:(BOOL)a3
{
  self->_migratedEventsToRecords = a3;
}

- (NSMutableArray)currentEvents
{
  return self->_currentEvents;
}

- (void)setCurrentEvents:(id)a3
{
  objc_storeStrong((id *)&self->_currentEvents, a3);
}

- (HMFTimer)debounceTriggerActivationTimer
{
  return self->_debounceTriggerActivationTimer;
}

- (void)setDebounceTriggerActivationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_debounceTriggerActivationTimer, a3);
}

- (NSPredicate)evaluationCondition
{
  return self->_evaluationCondition;
}

- (void)setEvaluationCondition:(id)a3
{
  objc_storeStrong((id *)&self->_evaluationCondition, a3);
}

- (BOOL)executeOnce
{
  return self->_executeOnce;
}

- (void)setExecuteOnce:(BOOL)a3
{
  self->_executeOnce = a3;
}

- (HMDPredicateUtilities)predicateUtilities
{
  return self->_predicateUtilities;
}

- (void)setPredicateUtilities:(id)a3
{
  objc_storeStrong((id *)&self->_predicateUtilities, a3);
}

- (HMDEventTriggerExecutionSession)executionSession
{
  return self->_executionSession;
}

- (void)setExecutionSession:(id)a3
{
  objc_storeStrong((id *)&self->_executionSession, a3);
}

- (HMDEventTriggerUserConfirmationSession)userConfirmationSession
{
  return self->_userConfirmationSession;
}

- (void)setUserConfirmationSession:(id)a3
{
  objc_storeStrong((id *)&self->_userConfirmationSession, a3);
}

- (unint64_t)activationType
{
  return self->_activationType;
}

- (void)setActivationType:(unint64_t)a3
{
  self->_activationType = a3;
}

- (unint64_t)activationState
{
  return self->_activationState;
}

- (void)setActivationState:(unint64_t)a3
{
  self->_activationState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userConfirmationSession, 0);
  objc_storeStrong((id *)&self->_executionSession, 0);
  objc_storeStrong((id *)&self->_predicateUtilities, 0);
  objc_storeStrong((id *)&self->_evaluationCondition, 0);
  objc_storeStrong((id *)&self->_debounceTriggerActivationTimer, 0);
  objc_storeStrong((id *)&self->_currentEvents, 0);
  objc_storeStrong((id *)&self->_recurrences, 0);
  objc_storeStrong((id *)&self->_dependencyFactory, 0);
}

uint64_t __59__HMDEventTrigger_userDidConfirmExecute_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_userDidConfirmExecute:completionHandler:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __38__HMDEventTrigger_resetExecutionState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resetExecutionState");
}

uint64_t __43__HMDEventTrigger_executionComplete_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v13 = 138543874;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Action set execution session %@ is complete with error %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "_resetExecutionState");
  if (!*(_QWORD *)(a1 + 48) && objc_msgSend(*(id *)(a1 + 32), "executeOnce"))
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Trigger is marked to be executed once, deactivating", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(*(id *)(a1 + 32), "setEnabled:message:", 0, 0);
  }
  return objc_msgSend(*(id *)(a1 + 32), "executeCompleteWithError:", *(_QWORD *)(a1 + 48));
}

void __45__HMDEventTrigger__handleUpdateEventTrigger___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = (void *)MEMORY[0x227676638]();
  v9 = WeakRetained;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v11;
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Responding to the client about update event trigger status : Payload : [%@], error : [%@]", (uint8_t *)&v12, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:error:", v6, v5);

}

- (uint64_t)updateEventsFromInfo:(void *)a1 existingEvents:(void *)a2 preserveUUIDs:(void *)a3 endEvent:(void *)a4 transaction:(void *)a5 message:(void *)a6 error:(_QWORD *)a7
{
  id v13;
  id v14;
  id v15;
  __int128 v16;
  uint64_t i;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  objc_class *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  id v46;
  NSObject *v47;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  NSObject *v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t j;
  void *v66;
  uint64_t v67;
  __int128 v69;
  id v70;
  id v71;
  id v72;
  void *v73;
  id v74;
  _QWORD *v75;
  id v76;
  id v77;
  id obj;
  void *v79;
  void *v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  id v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  unsigned __int8 v97;
  _BYTE v98[128];
  uint8_t v99[128];
  uint8_t buf[4];
  void *v101;
  __int16 v102;
  id v103;
  __int16 v104;
  id v105;
  _BYTE v106[128];
  uint64_t v107;

  v107 = *MEMORY[0x24BDAC8D0];
  v13 = a2;
  v72 = a3;
  v14 = a4;
  v15 = a5;
  v74 = a6;
  if (a1)
  {
    v71 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(a1, "home");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = 0u;
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    v70 = v13;
    obj = v13;
    v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v106, 16);
    if (v83)
    {
      v81 = *(_QWORD *)v94;
      *(_QWORD *)&v16 = 138543874;
      v69 = v16;
      v82 = v14;
      v79 = a1;
      v75 = a7;
      while (2)
      {
        for (i = 0; i != v83; ++i)
        {
          if (*(_QWORD *)v94 != v81)
            objc_enumerationMutation(obj);
          v18 = *(id *)(*((_QWORD *)&v93 + 1) + 8 * i);
          v19 = v18;
          if (v14)
            v20 = objc_msgSend(v14, "BOOLValue");
          else
            v20 = objc_msgSend(v18, "hmf_BOOLForKey:", CFSTR("kEventTriggerEndEvent"));
          v21 = v20;
          v22 = v19;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v23 = v22;
          else
            v23 = 0;
          v24 = v23;

          if (v24)
          {
            objc_msgSend(v22, "hmf_stringForKey:", CFSTR("kEventTriggerTypeKey"));
            v25 = objc_claimAutoreleasedReturnValue();
            if (v25)
            {
              v80 = (void *)v25;
              v26 = (objc_class *)objc_msgSend(a1, "eventTriggerTypeToEventClass:");
              if (v26)
              {
                v76 = v24;
                v27 = [v26 alloc];
                v92 = 0;
                objc_msgSend(a1, "createEventModel:endEvent:message:checkForSupport:transaction:error:", v22, v21, v74, 1, v15, &v92);
                v28 = a1;
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v77 = v92;
                v30 = (void *)objc_msgSend(v27, "initWithModel:home:", v29, v73);

                if (v30)
                {
                  objc_msgSend(v71, "addObject:", v30);
                  v90 = 0u;
                  v91 = 0u;
                  v88 = 0u;
                  v89 = 0u;
                  v31 = v72;
                  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v88, v99, 16);
                  if (v32)
                  {
                    v33 = v32;
                    v34 = *(_QWORD *)v89;
LABEL_19:
                    v35 = 0;
                    while (1)
                    {
                      if (*(_QWORD *)v89 != v34)
                        objc_enumerationMutation(v31);
                      v36 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * v35);
                      if ((objc_msgSend(v36, "isCompatibleWithEvent:", v30, v69) & 1) != 0)
                        break;
                      if (v33 == ++v35)
                      {
                        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v88, v99, 16);
                        if (v33)
                          goto LABEL_19;
                        goto LABEL_25;
                      }
                    }
                    v53 = v36;

                    if (!v53)
                      goto LABEL_43;
                    objc_msgSend(v53, "uuid");
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v30, "setUuid:", v54);

                    objc_msgSend(v53, "eventTrigger");
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v30, "setEventTrigger:", v55);

                    objc_msgSend(v30, "modelObjectWithChangeType:", 2);
                    v56 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v15, "add:", v56);

                    objc_msgSend(v31, "removeObject:", v53);
                    v43 = 0;
                    a1 = v79;
                  }
                  else
                  {
LABEL_25:

LABEL_43:
                    a1 = v79;
                    -[HMDEventTrigger _addEventModelFromDictionary:endEvent:transaction:message:error:](v79, v22, v21, v15, v74, v75);
                    v43 = 0;
                  }
                  v24 = v76;
                }
                else
                {
                  v57 = (void *)MEMORY[0x227676638]();
                  v58 = v28;
                  HMFGetOSLogHandle();
                  v59 = objc_claimAutoreleasedReturnValue();
                  v24 = v76;
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
                  {
                    HMFGetLogIdentifier();
                    v60 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = v69;
                    v101 = v60;
                    v102 = 2112;
                    v103 = v76;
                    v104 = 2112;
                    v105 = v77;
                    _os_log_impl(&dword_2218F0000, v59, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize action: %@ with error: %@", buf, 0x20u);

                  }
                  objc_autoreleasePoolPop(v57);
                  if (v75)
                  {
                    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
                    *v75 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  v97 = 0;
                  v43 = 1;
                  a1 = v79;
                }
                v44 = v80;
                v42 = v77;

                a7 = v75;
              }
              else
              {
                v49 = (void *)MEMORY[0x227676638]();
                v50 = a1;
                HMFGetOSLogHandle();
                v51 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v101 = v52;
                  v102 = 2112;
                  v103 = v80;
                  _os_log_impl(&dword_2218F0000, v51, OS_LOG_TYPE_ERROR, "%{public}@Invalid event trigger type: %@", buf, 0x16u);

                  a1 = v79;
                }

                objc_autoreleasePoolPop(v49);
                if (a7)
                {
                  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
                  *a7 = (id)objc_claimAutoreleasedReturnValue();
                }
                v42 = 0;
                v97 = 0;
                v43 = 1;
                v44 = v80;
              }
            }
            else
            {
              v44 = 0;
              v45 = (void *)MEMORY[0x227676638]();
              v46 = a1;
              HMFGetOSLogHandle();
              v47 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v101 = v48;
                v102 = 2112;
                v103 = v24;
                _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_ERROR, "%{public}@Event must have trigger type %@", buf, 0x16u);

                a1 = v79;
              }

              objc_autoreleasePoolPop(v45);
              if (a7)
              {
                objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
                *a7 = (id)objc_claimAutoreleasedReturnValue();
              }
              v42 = 0;
              v97 = 0;
              v43 = 1;
            }

          }
          else
          {
            v37 = (void *)MEMORY[0x227676638]();
            v38 = a1;
            HMFGetOSLogHandle();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "name");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v101 = v40;
              v102 = 2112;
              v103 = v41;
              _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_ERROR, "%{public}@Can't update events %@; invalid serialized event",
                buf,
                0x16u);

              a1 = v79;
            }

            objc_autoreleasePoolPop(v37);
            if (a7)
            {
              objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
              *a7 = (id)objc_claimAutoreleasedReturnValue();
            }
            v42 = 0;
            v97 = 0;
            v43 = 1;
            v24 = 0;
          }
          v14 = v82;

          if (v43)
          {

            v67 = v97;
            goto LABEL_64;
          }
        }
        v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v106, 16);
        if (v83)
          continue;
        break;
      }
    }

    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    v61 = v72;
    v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v84, v98, 16);
    if (v62)
    {
      v63 = v62;
      v64 = *(_QWORD *)v85;
      do
      {
        for (j = 0; j != v63; ++j)
        {
          if (*(_QWORD *)v85 != v64)
            objc_enumerationMutation(v61);
          objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 8 * j), "modelObjectWithChangeType:", 3, v69);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "add:", v66);

        }
        v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v84, v98, 16);
      }
      while (v63);
    }

    v67 = 1;
LABEL_64:

    v13 = v70;
  }
  else
  {
    v67 = 0;
  }

  return v67;
}

void __45__HMDEventTrigger__handleUpdateEventTrigger___block_invoke_106(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "respondWithError:", a2);
  }
  else
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "createPayloadWithCondition:", *(_QWORD *)(a1 + 56));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addEntriesFromDictionary:", v4);

    v5 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 72), "triggerEvents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHome _createEventsPayload:](v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, CFSTR("kEventTriggerEventsKey"));

    v8 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 72), "endEvents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHome _createEventsPayload:](v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v10, CFSTR("kEventTriggerEndEventsKey"));

    v11 = *(void **)(a1 + 32);
    v12 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
    objc_msgSend(v11, "respondWithPayload:", v12);

  }
}

- (void)_addEventModelFromDictionary:(uint64_t)a3 endEvent:(void *)a4 transaction:(void *)a5 message:(_QWORD *)a6 error:
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  char isKindOfClass;
  void *v17;
  HMDCharacteristicEvent *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  id v29;
  char v30;
  void *v31;
  HMDLocationEvent *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  id v38;
  char v39;
  void *v40;
  HMDCalendarEvent *v41;
  void *v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  id v47;
  char v48;
  void *v49;
  HMDSignificantTimeEvent *v50;
  void *v51;
  void *v52;
  id v53;
  NSObject *v54;
  void *v55;
  id v56;
  char v57;
  void *v58;
  HMDDurationEvent *v59;
  void *v60;
  void *v61;
  id v62;
  NSObject *v63;
  void *v64;
  id v65;
  char v66;
  void *v67;
  HMDCharacteristicThresholdRangeEvent *v68;
  void *v69;
  void *v70;
  id v71;
  NSObject *v72;
  void *v73;
  id v74;
  char v75;
  void *v76;
  HMDPresenceEvent *v77;
  void *v78;
  void *v79;
  id v80;
  NSObject *v81;
  void *v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  uint8_t buf[4];
  void *v89;
  __int16 v90;
  id v91;
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  v12 = a4;
  v13 = a5;
  v87 = 0;
  objc_msgSend(a1, "createEventModel:endEvent:message:checkForSupport:transaction:error:", v11, a3, v13, 1, v12, &v87);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v87;
  if (v14)
  {
    v84 = v13;
    v85 = v11;
    objc_msgSend(v12, "add:", v14);
    v15 = v14;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(a1, "home");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[HMDCharacteristicEvent initWithModel:home:]([HMDCharacteristicEvent alloc], "initWithModel:home:", v15, v17);
      if (v18)
      {
        objc_msgSend(a1, "addEvent:", v18);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "postNotificationName:object:userInfo:", CFSTR("HMDEventTriggerCharacteristicBasedEventAddedNotification"), v17, 0);

        }
      }
      else
      {
        v25 = (void *)MEMORY[0x227676638]();
        v26 = a1;
        HMFGetOSLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v89 = v28;
          v90 = 2112;
          v91 = v15;
          _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Failed to create event object with event model %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v25);
      }

    }
    else
    {
      v18 = 0;
    }
    v29 = v15;
    objc_opt_class();
    v30 = objc_opt_isKindOfClass();

    if ((v30 & 1) != 0)
    {
      objc_msgSend(a1, "home");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = -[HMDLocationEvent initWithModel:home:]([HMDLocationEvent alloc], "initWithModel:home:", v29, v31);

      if (v32)
      {
        objc_msgSend(a1, "addEvent:", v32);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "postNotificationName:object:userInfo:", CFSTR("HMDEventTriggerCharacteristicBasedEventAddedNotification"), v31, 0);

        }
      }
      else
      {
        v34 = (void *)MEMORY[0x227676638]();
        v35 = a1;
        HMFGetOSLogHandle();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v89 = v37;
          v90 = 2112;
          v91 = v29;
          _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_INFO, "%{public}@Failed to create event object with event model %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v34);
      }

    }
    else
    {
      v32 = (HMDLocationEvent *)v18;
    }
    v38 = v29;
    objc_opt_class();
    v39 = objc_opt_isKindOfClass();

    if ((v39 & 1) != 0)
    {
      objc_msgSend(a1, "home");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[HMDCalendarEvent initWithModel:home:]([HMDCalendarEvent alloc], "initWithModel:home:", v38, v40);

      if (v41)
      {
        objc_msgSend(a1, "addEvent:", v41);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "postNotificationName:object:userInfo:", CFSTR("HMDEventTriggerCharacteristicBasedEventAddedNotification"), v40, 0);

        }
      }
      else
      {
        v43 = (void *)MEMORY[0x227676638]();
        v44 = a1;
        HMFGetOSLogHandle();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v89 = v46;
          v90 = 2112;
          v91 = v38;
          _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_INFO, "%{public}@Failed to create event object with event model %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v43);
      }

    }
    else
    {
      v41 = (HMDCalendarEvent *)v32;
    }
    v47 = v38;
    objc_opt_class();
    v48 = objc_opt_isKindOfClass();

    if ((v48 & 1) != 0)
    {
      objc_msgSend(a1, "home");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = -[HMDSignificantTimeEvent initWithModel:home:]([HMDSignificantTimeEvent alloc], "initWithModel:home:", v47, v49);

      if (v50)
      {
        objc_msgSend(a1, "addEvent:", v50);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "postNotificationName:object:userInfo:", CFSTR("HMDEventTriggerCharacteristicBasedEventAddedNotification"), v49, 0);

        }
      }
      else
      {
        v52 = (void *)MEMORY[0x227676638]();
        v53 = a1;
        HMFGetOSLogHandle();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v89 = v55;
          v90 = 2112;
          v91 = v47;
          _os_log_impl(&dword_2218F0000, v54, OS_LOG_TYPE_INFO, "%{public}@Failed to create event object with event model %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v52);
      }

    }
    else
    {
      v50 = (HMDSignificantTimeEvent *)v41;
    }
    v56 = v47;
    objc_opt_class();
    v57 = objc_opt_isKindOfClass();

    if ((v57 & 1) != 0)
    {
      objc_msgSend(a1, "home");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = -[HMDDurationEvent initWithModel:home:]([HMDDurationEvent alloc], "initWithModel:home:", v56, v58);

      if (v59)
      {
        objc_msgSend(a1, "addEvent:", v59);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "postNotificationName:object:userInfo:", CFSTR("HMDEventTriggerCharacteristicBasedEventAddedNotification"), v58, 0);

        }
      }
      else
      {
        v61 = (void *)MEMORY[0x227676638]();
        v62 = a1;
        HMFGetOSLogHandle();
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v89 = v64;
          v90 = 2112;
          v91 = v56;
          _os_log_impl(&dword_2218F0000, v63, OS_LOG_TYPE_INFO, "%{public}@Failed to create event object with event model %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v61);
      }

    }
    else
    {
      v59 = (HMDDurationEvent *)v50;
    }
    v65 = v56;
    objc_opt_class();
    v66 = objc_opt_isKindOfClass();

    if ((v66 & 1) != 0)
    {
      objc_msgSend(a1, "home");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = -[HMDCharacteristicThresholdRangeEvent initWithModel:home:]([HMDCharacteristicThresholdRangeEvent alloc], "initWithModel:home:", v65, v67);

      if (v68)
      {
        objc_msgSend(a1, "addEvent:", v68);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "postNotificationName:object:userInfo:", CFSTR("HMDEventTriggerCharacteristicBasedEventAddedNotification"), v67, 0);

        }
      }
      else
      {
        v70 = (void *)MEMORY[0x227676638]();
        v71 = a1;
        HMFGetOSLogHandle();
        v72 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v89 = v73;
          v90 = 2112;
          v91 = v65;
          _os_log_impl(&dword_2218F0000, v72, OS_LOG_TYPE_INFO, "%{public}@Failed to create event object with event model %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v70);
      }

    }
    else
    {
      v68 = (HMDCharacteristicThresholdRangeEvent *)v59;
    }
    v74 = v65;
    objc_opt_class();
    v75 = objc_opt_isKindOfClass();

    if ((v75 & 1) != 0)
    {
      objc_msgSend(a1, "home");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = -[HMDPresenceEvent initWithModel:home:]([HMDPresenceEvent alloc], "initWithModel:home:", v74, v76);

      if (v77)
      {
        objc_msgSend(a1, "addEvent:", v77);
        objc_opt_class();
        v24 = v86;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "postNotificationName:object:userInfo:", CFSTR("HMDEventTriggerCharacteristicBasedEventAddedNotification"), v76, 0);

        }
      }
      else
      {
        v79 = (void *)MEMORY[0x227676638]();
        v80 = a1;
        HMFGetOSLogHandle();
        v81 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v89 = v82;
          v90 = 2112;
          v91 = v74;
          _os_log_impl(&dword_2218F0000, v81, OS_LOG_TYPE_INFO, "%{public}@Failed to create event object with event model %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v79);
        v24 = v86;
      }

    }
    else
    {
      v77 = (HMDPresenceEvent *)v68;
      v24 = v86;
    }

    v13 = v84;
    v11 = v85;
  }
  else
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = a1;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v89 = v23;
      v90 = 2112;
      v91 = v11;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Cannot create event model for event info %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    v24 = v86;
    if (a6)
    {
      if (v86)
      {
        *a6 = objc_retainAutorelease(v86);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
        v83 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *a6 = v83;

      }
    }
  }

}

void __47__HMDEventTrigger__updateEventsOnEventTrigger___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  void (**v14)(_QWORD, _QWORD, _QWORD);
  void *v15;
  id v16;
  char v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __47__HMDEventTrigger__updateEventsOnEventTrigger___block_invoke_2;
    v13[3] = &unk_24E796150;
    v7 = v3;
    v17 = *(_BYTE *)(a1 + 48);
    v14 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
    v15 = v5;
    v16 = *(id *)(a1 + 32);
    dispatch_async(v6, v13);

    v8 = v14;
LABEL_7:

    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "responseHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v12;
      v20 = 2112;
      v21 = v3;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Could not finish the request as self is no longer valid. Replying back to client with error:[%@]", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(*(id *)(a1 + 32), "responseHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v8)[2](v8, v3, 0);
    goto LABEL_7;
  }
LABEL_8:

}

void __47__HMDEventTrigger__updateEventsOnEventTrigger___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x227676638]();
    v3 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v29 = v5;
      v30 = 2112;
      v31 = v6;
      _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_ERROR, "%{public}@Error occurred while updating events on event trigger. [%@]", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v2);
    objc_msgSend(*(id *)(a1 + 48), "respondWithError:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("kEventTriggerEndEvent"));

    v9 = *(void **)(a1 + 40);
    if (*(_BYTE *)(a1 + 56))
      objc_msgSend(v9, "endEvents");
    else
      objc_msgSend(v9, "triggerEvents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "createPayload", (_QWORD)v24);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
      }
      while (v14);
    }

    v18 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, CFSTR("kEventTriggerEventsKey"));

    v19 = (void *)MEMORY[0x227676638]();
    v20 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "name");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v29 = v22;
      v30 = 2112;
      v31 = v23;
      v32 = 2112;
      v33 = v7;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@All the events updated. Updating clients. %@ : %@]", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(*(id *)(a1 + 48), "respondWithPayload:", v7);

  }
}

- (BOOL)addEventsFromInfo:(char)a3 preserveUUIDs:(void *)a4 endEvent:(void *)a5 transaction:(void *)a6 message:(_QWORD *)a7 error:
{
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t i;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v26;
  uint64_t v27;
  id v28;
  id obj;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  obj = a2;
  v12 = a4;
  v13 = a5;
  v14 = a1;
  v15 = v13;
  v16 = a6;
  if (v14)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v31)
    {
      v17 = *(_QWORD *)v33;
      v27 = *(_QWORD *)v33;
      v28 = v12;
      v26 = v15;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v33 != v17)
            objc_enumerationMutation(obj);
          v19 = *(id *)(*((_QWORD *)&v32 + 1) + 8 * i);
          v20 = v19;
          if (v12)
            v21 = objc_msgSend(v12, "BOOLValue");
          else
            v21 = objc_msgSend(v19, "hmf_BOOLForKey:", CFSTR("kEventTriggerEndEvent"));
          v22 = v21;
          if ((a3 & 1) == 0)
          {
            objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("kEventUUIDKey"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (v23)
            {
              v24 = (void *)objc_msgSend(v20, "mutableCopy");
              objc_msgSend(v24, "setObject:forKeyedSubscript:", 0, CFSTR("kEventUUIDKey"));

              v20 = v24;
            }
            v15 = v26;
            v17 = v27;
            v12 = v28;
          }
          -[HMDEventTrigger _addEventModelFromDictionary:endEvent:transaction:message:error:](v14, v20, v22, v15, v16, a7);

        }
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v31);
    }
  }

  return v14 != 0;
}

void __33__HMDEventTrigger__removeEvents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "triggerEvents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (!v10)
    {
      v11 = (void *)MEMORY[0x227676638]();
      v12 = v8;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543362;
        v17 = v14;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@There are no triggering events anymore, removing the trigger", (uint8_t *)&v16, 0xCu);

      }
      objc_autoreleasePoolPop(v11);
      objc_msgSend(v12, "home");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeTrigger:", v12);

    }
  }

}

void __35__HMDEventTrigger__activateEvents___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(a1[4], "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__HMDEventTrigger__activateEvents___block_invoke_2;
  block[3] = &unk_24E79BBD0;
  v7 = v3;
  v8 = a1[5];
  v9 = a1[6];
  v5 = v3;
  dispatch_async(v4, block);

}

void __35__HMDEventTrigger__activateEvents___block_invoke_3(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(a1[4], "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__HMDEventTrigger__activateEvents___block_invoke_4;
  block[3] = &unk_24E79BBD0;
  v7 = v3;
  v8 = a1[5];
  v9 = a1[6];
  v5 = v3;
  dispatch_async(v4, block);

}

void __35__HMDEventTrigger__activateEvents___block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = (void *)MEMORY[0x227676638]();
  v4 = WeakRetained;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v12 = 138543618;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Completed activation with errors: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "_reevaluateIfRelaunchRequired");
    v8 = 0;
  }
  if (!*(_BYTE *)(a1 + 56)
    || (objc_msgSend(v4, "triggerEvents"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "count"),
        v9,
        !v10))
  {
    objc_msgSend(v4, "setExecutionSession:", 0);
  }
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v8);

}

void __35__HMDEventTrigger__activateEvents___block_invoke_4(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 40), "addObject:");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __35__HMDEventTrigger__activateEvents___block_invoke_2(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 40), "addObject:");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __56__HMDEventTrigger_doesTheLocationEventTargetCurrentUser__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "doesThisTargetCurrentUser");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_43369 != -1)
    dispatch_once(&logCategory__hmf_once_t1_43369, &__block_literal_global_43370);
  return (id)logCategory__hmf_once_v2_43371;
}

+ (BOOL)__validateRecurrences:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  int v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (!objc_msgSend(v8, "weekday", (_QWORD)v12))
        {
          LOBYTE(v10) = 0;
          goto LABEL_15;
        }
        v9 = objc_alloc_init(MEMORY[0x24BDBCE68]);
        if (objc_msgSend(v8, "weekday") != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v9, "setWeekday:", objc_msgSend(v8, "weekday"));
        v10 = objc_msgSend(v8, "isEqual:", v9);

        if (!v10)
          goto LABEL_15;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      LOBYTE(v10) = 1;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    LOBYTE(v10) = 1;
  }
LABEL_15:

  return v10;
}

+ (BOOL)hasMessageReceiverChildren
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __30__HMDEventTrigger_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_43371;
  logCategory__hmf_once_v2_43371 = v0;

}

@end
