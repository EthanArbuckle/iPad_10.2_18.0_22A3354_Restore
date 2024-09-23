@implementation MTUserDefaults

+ (id)sharedUserDefaults
{
  if (sharedUserDefaults_onceToken != -1)
    dispatch_once(&sharedUserDefaults_onceToken, &__block_literal_global_7_1);
  return (id)sharedUserDefaults_sharedUserDefaults;
}

- (id)objectForKey:(id)a3 defaultValue:(id)a4
{
  NSUserDefaults *userDefaults;
  id v6;
  void *v7;
  void *v8;
  id v9;

  userDefaults = self->_userDefaults;
  v6 = a4;
  -[NSUserDefaults objectForKey:](userDefaults, "objectForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    v7 = v6;
  v9 = v7;

  return v9;
}

- (id)objectForKey:(id)a3
{
  return -[MTUserDefaults objectForKey:defaultValue:](self, "objectForKey:defaultValue:", a3, 0);
}

void __36__MTUserDefaults_sharedUserDefaults__block_invoke()
{
  void *v0;
  int v1;
  MTUserDefaults *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v1 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.mobiletimerd"));
  v2 = [MTUserDefaults alloc];
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.mobiletimerd"));
  }
  v4 = (void *)v3;
  v5 = -[MTUserDefaults initWithUserDefaults:](v2, "initWithUserDefaults:", v3);
  v6 = (void *)sharedUserDefaults_sharedUserDefaults;
  sharedUserDefaults_sharedUserDefaults = v5;

}

- (MTUserDefaults)initWithUserDefaults:(id)a3
{
  id v5;
  MTUserDefaults *v6;
  NSObject *v7;
  uint64_t v8;
  NSMutableDictionary *observers;
  uint64_t v10;
  NAScheduler *serializer;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MTUserDefaults;
  v6 = -[MTUserDefaults init](&v13, sel_init);
  if (v6)
  {
    MTLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[MTUserDefaults initWithUserDefaults:].cold.1((uint64_t)v6, v7);

    objc_storeStrong((id *)&v6->_userDefaults, a3);
    v8 = objc_opt_new();
    observers = v6->_observers;
    v6->_observers = (NSMutableDictionary *)v8;

    +[MTScheduler serialSchedulerWithName:priority:](MTScheduler, "serialSchedulerWithName:priority:", CFSTR("com.apple.mobiletimer.MTUserDefaults"), +[MTScheduler defaultPriority](MTScheduler, "defaultPriority"));
    v10 = objc_claimAutoreleasedReturnValue();
    serializer = v6->_serializer;
    v6->_serializer = (NAScheduler *)v10;

  }
  return v6;
}

- (void)initWithUserDefaults:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_19AC4E000, a2, OS_LOG_TYPE_DEBUG, "%{public}@ initializing...", (uint8_t *)&v2, 0xCu);
}

void __48__MTUserDefaults_registerNotification_observer___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1[4] + 24), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v2;
  if (v2)
  {
    objc_msgSend(v2, "addObject:", a1[6]);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = a1[4];
    objc_msgSend((id)objc_opt_class(), "_distributedNotificationForLocalNotification:", a1[5]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v4, sel_distributedNotificationPosted_, v5, 0);

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", a1[6]);
    objc_msgSend(*(id *)(a1[4] + 24), "setObject:forKeyedSubscript:", v6, a1[5]);

  }
}

+ (id)_distributedNotificationForLocalNotification:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("Distributed"), a3);
}

- (void)registerNotification:(id)a3 observer:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NAScheduler *serializer;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  MTUserDefaults *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  MTLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543874;
    v16 = self;
    v17 = 2114;
    v18 = v7;
    v19 = 2114;
    v20 = v6;
    _os_log_debug_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ registering %{public}@ for %{public}@", buf, 0x20u);
  }

  serializer = self->_serializer;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48__MTUserDefaults_registerNotification_observer___block_invoke;
  v12[3] = &unk_1E39CB828;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[NAScheduler performBlock:](serializer, "performBlock:", v12);

}

- (void)setFloat:(float)a3 forKey:(id)a4
{
  -[MTUserDefaults setFloat:forKey:notification:](self, "setFloat:forKey:notification:", a4, 0);
}

- (void)setFloat:(float)a3 forKey:(id)a4 notification:(id)a5
{
  void *v8;
  id v9;
  id v10;
  double v11;
  id v12;

  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a5;
  v10 = a4;
  *(float *)&v11 = a3;
  objc_msgSend(v8, "numberWithFloat:", v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[MTUserDefaults setObject:forKey:notification:](self, "setObject:forKey:notification:", v12, v10, v9);

}

- (float)floatForKey:(id)a3
{
  float result;

  -[MTUserDefaults floatForKey:exists:](self, "floatForKey:exists:", a3, 0);
  return result;
}

- (float)floatForKey:(id)a3 exists:(BOOL *)a4
{
  void *v5;
  void *v6;
  float v7;
  float v8;

  -[MTUserDefaults objectForKey:](self, "objectForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a4)
    *a4 = v5 != 0;
  objc_msgSend(v5, "floatValue");
  v8 = v7;

  return v8;
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  -[MTUserDefaults setBool:forKey:notification:](self, "setBool:forKey:notification:", a3, a4, 0);
}

- (void)setBool:(BOOL)a3 forKey:(id)a4 notification:(id)a5
{
  _BOOL8 v6;
  void *v8;
  id v9;
  id v10;
  id v11;

  v6 = a3;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "numberWithBool:", v6);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[MTUserDefaults setObject:forKey:notification:](self, "setObject:forKey:notification:", v11, v10, v9);

}

- (BOOL)BOOLForKey:(id)a3
{
  return -[MTUserDefaults BOOLForKey:exists:](self, "BOOLForKey:exists:", a3, 0);
}

- (BOOL)BOOLForKey:(id)a3 exists:(BOOL *)a4
{
  void *v5;
  void *v6;
  char v7;

  -[MTUserDefaults objectForKey:](self, "objectForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a4)
    *a4 = v5 != 0;
  v7 = objc_msgSend(v5, "BOOLValue");

  return v7;
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4
{
  -[MTUserDefaults setInteger:forKey:notification:](self, "setInteger:forKey:notification:", a3, a4, 0);
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4 notification:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;

  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "numberWithInteger:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[MTUserDefaults setObject:forKey:notification:](self, "setObject:forKey:notification:", v11, v10, v9);

}

- (int64_t)integerForKey:(id)a3 exists:(BOOL *)a4
{
  void *v5;
  void *v6;
  int64_t v7;

  -[MTUserDefaults objectForKey:](self, "objectForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a4)
    *a4 = v5 != 0;
  v7 = objc_msgSend(v5, "integerValue");

  return v7;
}

- (int64_t)integerForKey:(id)a3 defaultValue:(int64_t)a4
{
  return -[MTUserDefaults integerForKey:isValid:defaultValue:](self, "integerForKey:isValid:defaultValue:", a3, &__block_literal_global_15, a4);
}

uint64_t __45__MTUserDefaults_integerForKey_defaultValue___block_invoke()
{
  return 1;
}

- (int64_t)integerForKey:(id)a3 isValid:(id)a4 defaultValue:(int64_t)a5
{
  uint64_t (**v8)(id, int64_t);
  int64_t v9;
  int64_t v10;
  char v12;

  v8 = (uint64_t (**)(id, int64_t))a4;
  v12 = 0;
  v9 = -[MTUserDefaults integerForKey:exists:](self, "integerForKey:exists:", a3, &v12);
  if (!v12 || (v10 = v9, (v8[2](v8, v9) & 1) == 0))
    v10 = a5;

  return v10;
}

- (void)setTimeInterval:(double)a3 forKey:(id)a4
{
  -[MTUserDefaults setTimeInterval:forKey:notification:](self, "setTimeInterval:forKey:notification:", a4, 0, a3);
}

- (void)setTimeInterval:(double)a3 forKey:(id)a4 notification:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;

  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "numberWithDouble:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[MTUserDefaults setObject:forKey:notification:](self, "setObject:forKey:notification:", v11, v10, v9);

}

- (double)timeIntervalForKey:(id)a3 exists:(BOOL *)a4
{
  void *v5;
  void *v6;
  double v7;
  double v8;

  -[MTUserDefaults objectForKey:](self, "objectForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a4)
    *a4 = v5 != 0;
  objc_msgSend(v5, "doubleValue");
  v8 = v7;

  return v8;
}

- (double)timeIntervalForKey:(id)a3 defaultValue:(double)a4
{
  double result;

  -[MTUserDefaults timeIntervalForKey:isValid:defaultValue:](self, "timeIntervalForKey:isValid:defaultValue:", a3, &__block_literal_global_16, a4);
  return result;
}

uint64_t __50__MTUserDefaults_timeIntervalForKey_defaultValue___block_invoke()
{
  return 1;
}

- (double)timeIntervalForKey:(id)a3 isValid:(id)a4 defaultValue:(double)a5
{
  uint64_t (**v8)(_QWORD);
  double v9;
  double v10;
  char v12;

  v8 = (uint64_t (**)(_QWORD))a4;
  v12 = 0;
  -[MTUserDefaults timeIntervalForKey:exists:](self, "timeIntervalForKey:exists:", a3, &v12);
  if (!v12 || (v10 = v9, (v8[2](v8) & 1) == 0))
    v10 = a5;

  return v10;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  -[MTUserDefaults setObject:forKey:notification:](self, "setObject:forKey:notification:", a3, a4, 0);
}

- (void)setObject:(id)a3 forKey:(id)a4 notification:(id)a5
{
  NSUserDefaults *userDefaults;
  id v9;

  userDefaults = self->_userDefaults;
  v9 = a5;
  -[NSUserDefaults setObject:forKey:](userDefaults, "setObject:forKey:", a3, a4);
  -[MTUserDefaults _postNotification:](self, "_postNotification:", v9);

}

- (void)removeObjectForKey:(id)a3
{
  -[NSUserDefaults removeObjectForKey:](self->_userDefaults, "removeObjectForKey:", a3);
}

- (void)removeAllObjects
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSUserDefaults dictionaryRepresentation](self->_userDefaults, "dictionaryRepresentation", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        if (*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8))
          -[MTUserDefaults removeObjectForKey:](self, "removeObjectForKey:");
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_postNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (v4)
  {
    MTLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[MTUserDefaults _postNotification:].cold.1((uint64_t)self, (uint64_t)v4, v5);

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_distributedNotificationForLocalNotification:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", v7, 0);

  }
}

- (void)distributedNotificationPosted:(id)a3
{
  void *v4;
  void *v5;
  NAScheduler *serializer;
  id v7;
  _QWORD v8[5];
  id v9;

  objc_msgSend(a3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_localNotificationForDistributedNotification:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  serializer = self->_serializer;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__MTUserDefaults_distributedNotificationPosted___block_invoke;
  v8[3] = &unk_1E39CB7B0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  -[NAScheduler performBlock:](serializer, "performBlock:", v8);

}

void __48__MTUserDefaults_distributedNotificationPosted___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id obj;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_cleanupObserversForNotification:", *(_QWORD *)(a1 + 40));
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v21;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v21 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v5);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v6, "notificationObject");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v7 = 0;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v6, "notificationCenter");
        else
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        MTLogForCategory(0);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          v13 = *(_QWORD *)(a1 + 32);
          v14 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138543874;
          v25 = v13;
          v26 = 2114;
          v27 = v14;
          v28 = 2114;
          v29 = v7;
          _os_log_debug_impl(&dword_19AC4E000, v9, OS_LOG_TYPE_DEBUG, "%{public}@ posting %{public}@ for %{public}@", buf, 0x20u);
        }

        objc_msgSend(MEMORY[0x1E0D519E8], "mtMainThreadScheduler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __48__MTUserDefaults_distributedNotificationPosted___block_invoke_27;
        v16[3] = &unk_1E39CB828;
        v17 = v8;
        v18 = *(id *)(a1 + 40);
        v19 = v7;
        v11 = v7;
        v12 = v8;
        objc_msgSend(v10, "performBlock:", v16);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
    }
    while (v3);
  }

}

uint64_t __48__MTUserDefaults_distributedNotificationPosted___block_invoke_27(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "postNotificationName:object:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)unregisterNotification:(id)a3 observer:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NAScheduler *serializer;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  MTUserDefaults *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  MTLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543874;
    v16 = self;
    v17 = 2114;
    v18 = v7;
    v19 = 2114;
    v20 = v6;
    _os_log_debug_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ unregistering %{public}@ for %{public}@", buf, 0x20u);
  }

  serializer = self->_serializer;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50__MTUserDefaults_unregisterNotification_observer___block_invoke;
  v12[3] = &unk_1E39CB828;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[NAScheduler performBlock:](serializer, "performBlock:", v12);

}

void __50__MTUserDefaults_unregisterNotification_observer___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_cleanupObserversForNotification:", *(_QWORD *)(a1 + 40));

}

- (void)_cleanupObserversForNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    v10 = v4;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_observers, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    v4 = v10;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "_distributedNotificationForLocalNotification:", v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObserver:name:object:", self, v9, 0);

      -[NSMutableDictionary removeObjectForKey:](self->_observers, "removeObjectForKey:", v10);
      v4 = v10;
    }
  }

}

+ (id)_localNotificationForDistributedNotification:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("Distributed")))
  {
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("Distributed"), "length"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)synchronize
{
  -[NSUserDefaults synchronize](self->_userDefaults, "synchronize");
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
  objc_storeStrong((id *)&self->_serializer, a3);
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaults, a3);
}

- (NSMutableDictionary)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
}

- (void)_postNotification:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_debug_impl(&dword_19AC4E000, log, OS_LOG_TYPE_DEBUG, "%{public}@ broadcasting %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
