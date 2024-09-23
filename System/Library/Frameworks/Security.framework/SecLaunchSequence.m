@implementation SecLaunchSequence

- (SecLaunchSequence)initWithRocketName:(id)a3
{
  id v5;
  SecLaunchSequence *v6;
  SecLaunchSequence *v7;
  uint64_t v8;
  NSMutableDictionary *events;
  SecLaunchEvent *v10;
  NSBlockOperation *v11;
  NSBlockOperation *launchOperation;
  uint64_t v13;
  NSMutableDictionary *dependantLaunches;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SecLaunchSequence;
  v6 = -[SecLaunchSequence init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    events = v7->_events;
    v7->_events = (NSMutableDictionary *)v8;

    v10 = -[SecLaunchEvent initWithName:]([SecLaunchEvent alloc], "initWithName:", CFSTR("started"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7->_events, "setObject:forKeyedSubscript:", v10, CFSTR("started"));

    v11 = (NSBlockOperation *)objc_alloc_init(MEMORY[0x1E0CB34C8]);
    launchOperation = v7->_launchOperation;
    v7->_launchOperation = v11;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    dependantLaunches = v7->_dependantLaunches;
    v7->_dependantLaunches = (NSMutableDictionary *)v13;

  }
  return v7;
}

- (BOOL)firstLaunch
{
  SecLaunchSequence *v2;
  BOOL firstLaunch;

  v2 = self;
  objc_sync_enter(v2);
  firstLaunch = v2->_firstLaunch;
  objc_sync_exit(v2);

  return firstLaunch;
}

- (void)setFirstLaunch:(BOOL)a3
{
  SecLaunchSequence *obj;

  obj = self;
  objc_sync_enter(obj);
  if (!-[SecLaunchSequence launched](obj, "launched"))
    obj->_firstLaunch = a3;
  objc_sync_exit(obj);

}

- (void)addDependantLaunch:(id)a3 child:(id)a4
{
  id v6;
  SecLaunchSequence *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  if (!-[SecLaunchSequence launched](v7, "launched"))
  {
    -[SecLaunchSequence dependantLaunches](v7, "dependantLaunches");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      -[SecLaunchSequence dependantLaunches](v7, "dependantLaunches");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v6, v13);

      -[SecLaunchSequence launchOperation](v7, "launchOperation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "launchOperation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addDependency:", v12);

    }
  }
  objc_sync_exit(v7);

}

- (void)addAttribute:(id)a3 value:(id)a4
{
  id v6;
  SecLaunchSequence *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = self;
    objc_sync_enter(v7);
    if (!-[SecLaunchSequence launched](v7, "launched"))
    {
      -[SecLaunchSequence attributes](v7, "attributes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SecLaunchSequence setAttributes:](v7, "setAttributes:", v9);

      }
      -[SecLaunchSequence attributes](v7, "attributes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v6, v11);

    }
    objc_sync_exit(v7);

  }
}

- (void)addEvent:(id)a3
{
  SecLaunchSequence *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  SecLaunchEvent *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = self;
    objc_sync_enter(v4);
    if (!-[SecLaunchSequence launched](v4, "launched"))
    {
      -[SecLaunchSequence events](v4, "events");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");

      if (v6 <= 0x64)
      {
        -[SecLaunchSequence events](v4, "events");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v10);
        v8 = (SecLaunchEvent *)objc_claimAutoreleasedReturnValue();

        if (v8)
          -[SecLaunchEvent setCounter:](v8, "setCounter:", -[SecLaunchEvent counter](v8, "counter") + 1);
        else
          v8 = -[SecLaunchEvent initWithName:]([SecLaunchEvent alloc], "initWithName:", v10);
        -[SecLaunchSequence events](v4, "events");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

      }
    }
    objc_sync_exit(v4);

  }
}

- (id)metricsReport
{
  void *v3;
  SecLaunchSequence *v4;
  void *v5;
  SecLaunchEvent *v6;
  const __CFString *v7;
  SecLaunchEvent *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v17[5];

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SecLaunchSequence launched](self, "launched"))
  {
    v4 = self;
    objc_sync_enter(v4);
    -[SecLaunchSequence dependantLaunches](v4, "dependantLaunches");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __34__SecLaunchSequence_metricsReport__block_invoke;
    v17[3] = &unk_1E1FCBD60;
    v17[4] = v4;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v17);

    v6 = [SecLaunchEvent alloc];
    if (-[SecLaunchSequence firstLaunch](v4, "firstLaunch"))
      v7 = CFSTR("first-launch");
    else
      v7 = CFSTR("re-launch");
    v8 = -[SecLaunchEvent initWithName:](v6, "initWithName:", v7);
    -[SecLaunchSequence events](v4, "events");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SecLaunchEvent name](v8, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

    -[SecLaunchSequence eventsRelativeTime](v4, "eventsRelativeTime");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("events"));

    -[SecLaunchSequence attributes](v4, "attributes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      -[SecLaunchSequence attributes](v4, "attributes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("attributes"));

    }
    objc_sync_exit(v4);

    v15 = v3;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)launch
{
  SecLaunchSequence *obj;

  obj = self;
  objc_sync_enter(obj);
  if (!-[SecLaunchSequence launched](obj, "launched"))
    -[SecLaunchSequence setLaunched:](obj, "setLaunched:", 1);
  objc_sync_exit(obj);

}

- (id)eventsRelativeTime
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SecLaunchSequence events](self, "events");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __39__SecLaunchSequence_eventsRelativeTime__block_invoke;
  v17[3] = &unk_1E1FCBD88;
  v18 = v3;
  v6 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v17);

  objc_msgSend(v6, "sortUsingComparator:", &__block_literal_global_1245);
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __39__SecLaunchSequence_eventsRelativeTime__block_invoke_3;
  v14[3] = &unk_1E1FCBDF0;
  v15 = v8;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v16 = v9;
  v10 = v8;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v14);
  v11 = v16;
  v12 = v9;

  return v12;
}

- (id)eventsByTime
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v19;
  SecLaunchSequence *obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  obj = self;
  objc_sync_enter(obj);
  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v2, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss.SSSZ"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SecLaunchSequence events](obj, "events");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __33__SecLaunchSequence_eventsByTime__block_invoke;
  v25[3] = &unk_1E1FCBD38;
  v19 = v2;
  v26 = v19;
  v5 = v3;
  v27 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v25);

  objc_msgSend(v5, "sortUsingSelector:", sel_compare_);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[SecLaunchSequence attributes](obj, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1E0CB3940];
        -[SecLaunchSequence attributes](obj, "attributes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "description");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("attr: %@: %@"), v10, v14, v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v15);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
    }
    while (v7);
  }

  v16 = v27;
  v17 = v5;

  objc_sync_exit(obj);
  return v17;
}

- (BOOL)launched
{
  return self->_launched;
}

- (void)setLaunched:(BOOL)a3
{
  self->_launched = a3;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableDictionary)events
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEvents:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSMutableDictionary)attributes
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAttributes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSBlockOperation)launchOperation
{
  return (NSBlockOperation *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLaunchOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableDictionary)dependantLaunches
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDependantLaunches:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dependantLaunches, 0);
  objc_storeStrong((id *)&self->_launchOperation, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

void __33__SecLaunchSequence_eventsByTime__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v6, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "counter");

  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ - %@:%u"), v8, v9, v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
}

uint64_t __39__SecLaunchSequence_eventsRelativeTime__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

void __39__SecLaunchSequence_eventsRelativeTime__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("name"));

  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v9, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("time"));

  if (objc_msgSend(v9, "counter"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v9, "counter"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("counter"));

  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

uint64_t __39__SecLaunchSequence_eventsRelativeTime__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __34__SecLaunchSequence_metricsReport__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;

  v5 = a2;
  v12 = a3;
  if ((objc_msgSend(v12, "launched") & 1) != 0)
  {
    objc_msgSend(v12, "events");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __34__SecLaunchSequence_metricsReport__block_invoke_2;
    v13[3] = &unk_1E1FCBD38;
    v7 = *(_QWORD *)(a1 + 32);
    v14 = v5;
    v15 = v7;
    v8 = v5;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v13);

    objc_msgSend(v12, "attributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "attributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("c:%@"), v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

  }
  else
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
}

void __34__SecLaunchSequence_metricsReport__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a2;
  v12 = (id)objc_msgSend(a3, "copy");
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v12, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("c:%@-%@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setName:", v9);

  objc_msgSend(*(id *)(a1 + 40), "events");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("c:%@-%@"), *(_QWORD *)(a1 + 32), v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, v11);
}

@end
