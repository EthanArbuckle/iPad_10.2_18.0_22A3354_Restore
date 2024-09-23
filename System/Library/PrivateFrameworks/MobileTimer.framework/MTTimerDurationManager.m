@implementation MTTimerDurationManager

- (id)recentDurations
{
  void *v2;
  void *v3;

  -[MTTimerDurationManager _recentDurations](self, "_recentDurations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)latestDuration
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[MTTimerDurationManager _latestDuration](self, "_latestDuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "durationWithMinutes:", 15);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)favoriteDurations
{
  void *v2;
  void *v3;

  -[MTTimerDurationManager _favoriteDurations](self, "_favoriteDurations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (NSMutableArray)_recentDurations
{
  return self->__recentDurations;
}

- (MTTimerDuration)_latestDuration
{
  return self->__latestDuration;
}

- (NSMutableArray)_favoriteDurations
{
  return self->__favoriteDurations;
}

+ (id)defaultDurations
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
  _QWORD v13[9];

  v13[8] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "durationWithMinutes:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  objc_msgSend(a1, "durationWithMinutes:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v4;
  objc_msgSend(a1, "durationWithMinutes:", 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v5;
  objc_msgSend(a1, "durationWithMinutes:", 10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v6;
  objc_msgSend(a1, "durationWithMinutes:", 15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v7;
  objc_msgSend(a1, "durationWithMinutes:", 30);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v8;
  objc_msgSend(a1, "durationWithMinutes:", 60);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[6] = v9;
  objc_msgSend(a1, "durationWithMinutes:", 120);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[7] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)durationWithMinutes:(unint64_t)a3
{
  MTTimerDuration *v5;

  v5 = [MTTimerDuration alloc];
  objc_msgSend(a1, "intervalWithMinutes:", a3);
  return -[MTTimerDuration initWithTitle:duration:](v5, "initWithTitle:duration:", 0);
}

+ (double)intervalWithMinutes:(unint64_t)a3
{
  return (double)a3 * 60.0;
}

- (MTTimerDurationManager)initWithPersistence:(id)a3 storage:(id)a4
{
  id v6;
  MTTimerDurationManager *v7;

  v6 = a4;
  v7 = -[MTTimerDurationManager initWithPersistence:](self, "initWithPersistence:", a3);
  if (v7)
    objc_msgSend(v6, "registerObserver:", v7);

  return v7;
}

- (MTTimerDurationManager)initWithPersistence:(id)a3
{
  id v4;
  MTTimerDurationManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  uint8_t buf[4];
  MTTimerDurationManager *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MTTimerDurationManager;
  v5 = -[MTTimerDurationManager init](&v13, sel_init);
  if (v5)
  {
    MTLogForCategory(4);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v5;
      _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ initWithPersistence", buf, 0xCu);
    }

    -[MTTimerDurationManager setPersistence:](v5, "setPersistence:", v4);
    -[MTTimerDurationManager restoreDurationsWithKey:](v5, "restoreDurationsWithKey:", CFSTR("kMTTimerDurationRecents"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    -[MTTimerDurationManager set_recentDurations:](v5, "set_recentDurations:", v8);

    -[MTTimerDurationManager restoreDurationsWithKey:](v5, "restoreDurationsWithKey:", CFSTR("kMTTimerDurationFavorites"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");
    -[MTTimerDurationManager set_favoriteDurations:](v5, "set_favoriteDurations:", v10);

    -[MTTimerDurationManager restoreDurationWithKey:](v5, "restoreDurationWithKey:", CFSTR("kMTTimerDurationLatest"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTTimerDurationManager set_latestDuration:](v5, "set_latestDuration:", v11);

  }
  return v5;
}

- (void)addRecentDuration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[MTTimerDurationManager _recentDurations](self, "_recentDurations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTTimerDurationManager addDuration:toCollection:withKey:limit:](self, "addDuration:toCollection:withKey:limit:", v4, v5, CFSTR("kMTTimerDurationRecents"), 20);

  -[MTTimerDurationManager updateDelegate](self, "updateDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[MTTimerDurationManager _recentDurations](self, "_recentDurations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v8, "recentTimerDurationsDidUpdate:", v7);

}

- (void)removeRecentDuration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[MTTimerDurationManager _recentDurations](self, "_recentDurations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTTimerDurationManager removeDuration:fromCollection:withKey:](self, "removeDuration:fromCollection:withKey:", v4, v5, CFSTR("kMTTimerDurationRecents"));

  -[MTTimerDurationManager updateDelegate](self, "updateDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[MTTimerDurationManager _recentDurations](self, "_recentDurations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v8, "recentTimerDurationsDidUpdate:", v7);

}

- (void)addDuration:(id)a3 toCollection:(id)a4 withKey:(id)a5 limit:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;

  v12 = a3;
  v10 = a4;
  v11 = a5;
  if ((objc_msgSend(v10, "containsObject:", v12) & 1) == 0)
  {
    if (objc_msgSend(v10, "count") >= a6)
      objc_msgSend(v10, "removeObjectsInRange:", 0, objc_msgSend(v10, "count") - a6 + 1);
    objc_msgSend(v10, "addObject:", v12);
  }
  -[MTTimerDurationManager synchronizeCollection:withKey:](self, "synchronizeCollection:withKey:", v10, v11);

}

- (void)removeDuration:(id)a3 fromCollection:(id)a4 withKey:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "containsObject:", v10))
    objc_msgSend(v8, "removeObject:", v10);
  -[MTTimerDurationManager synchronizeCollection:withKey:](self, "synchronizeCollection:withKey:", v8, v9);

}

- (id)restoreDurationsWithKey:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  MTTimerDurationManager *v17;
  __int16 v18;
  NSObject *v19;
  __int16 v20;
  NSObject *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = self;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ restoring timer durations", buf, 0xCu);
  }

  -[MTTimerDurationManager persistence](self, "persistence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedArrayOfObjectsOfClass:fromData:error:", objc_opt_class(), v7, &v15);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v15;
    if (v9)
    {
      MTLogForCategory(4);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v17 = self;
        v18 = 2114;
        v19 = v4;
        v20 = 2114;
        v21 = v9;
        _os_log_error_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_ERROR, "%{public}@ error decoding durations with key: %{public}@, %{public}@", buf, 0x20u);
      }

    }
  }
  else
  {
    MTLogForCategory(4);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = self;
      _os_log_impl(&dword_19AC4E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ no recent timer durations restored", buf, 0xCu);
    }
    v8 = 0;
  }

  MTLogForCategory(4);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v17 = self;
    v18 = 2114;
    v19 = v8;
    v20 = 2114;
    v21 = v4;
    _os_log_impl(&dword_19AC4E000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ restored durations: %{public}@ with key: %{public}@", buf, 0x20u);
  }

  if (v8)
    v12 = v8;
  else
    v12 = objc_opt_new();
  v13 = v12;

  return v13;
}

- (void)synchronizeCollection:(id)a3 withKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  MTTimerDurationManager *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  MTLogForCategory(4);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v16 = self;
    v17 = 2114;
    v18 = v6;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ synchronizing timer durations with key: %{public}@", buf, 0x16u);
  }

  v14 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v14;
  if (v10)
  {
    MTLogForCategory(8);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MTTimerDurationManager synchronizeCollection:withKey:].cold.1((uint64_t)self, (uint64_t)v10, v11);
  }
  else
  {
    MTLogForCategory(4);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = self;
      _os_log_impl(&dword_19AC4E000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ synchronized recent durations successfully", buf, 0xCu);
    }

    -[MTTimerDurationManager persistence](self, "persistence");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v9, v6);

    -[MTTimerDurationManager persistence](self, "persistence");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject synchronize](v11, "synchronize");
  }

}

- (id)restoreDurationWithKey:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  MTTimerDurationManager *v15;
  __int16 v16;
  NSObject *v17;
  __int16 v18;
  NSObject *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v15 = self;
    v16 = 2114;
    v17 = v4;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ restoring timer duration with key: %{public}@ ", buf, 0x16u);
  }

  -[MTTimerDurationManager persistence](self, "persistence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v13 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, &v13);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v13;
    if (v9)
    {
      MTLogForCategory(4);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v15 = self;
        v16 = 2114;
        v17 = v4;
        v18 = 2114;
        v19 = v9;
        _os_log_error_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_ERROR, "%{public}@ error decoding duration with key: %{public}@, %{public}@", buf, 0x20u);
      }

    }
  }
  else
  {
    MTLogForCategory(4);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v15 = self;
      v16 = 2114;
      v17 = v4;
      _os_log_impl(&dword_19AC4E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ no timer duration restored with key: %{public}@", buf, 0x16u);
    }
    v8 = 0;
  }

  MTLogForCategory(4);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v15 = self;
    v16 = 2114;
    v17 = v8;
    v18 = 2114;
    v19 = v4;
    _os_log_impl(&dword_19AC4E000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ restored duration: %{public}@ with key: %{public}@", buf, 0x20u);
  }

  return v8;
}

- (void)syncrhonizeObject:(id)a3 withKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  MTTimerDurationManager *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  MTLogForCategory(4);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v16 = self;
    v17 = 2114;
    v18 = v6;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ synchronizing timer duration with key: %{public}@", buf, 0x16u);
  }

  v14 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v14;
  if (v10)
  {
    MTLogForCategory(8);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v16 = self;
      v17 = 2114;
      v18 = v6;
      v19 = 2114;
      v20 = v10;
      _os_log_error_impl(&dword_19AC4E000, v11, OS_LOG_TYPE_ERROR, "%{public}@ error encoding duration with key: %{public}@ error: %{public}@", buf, 0x20u);
    }
  }
  else
  {
    MTLogForCategory(4);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v16 = self;
      v17 = 2114;
      v18 = v6;
      _os_log_impl(&dword_19AC4E000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ synchronized duration with key: %{public}@  successfully", buf, 0x16u);
    }

    -[MTTimerDurationManager persistence](self, "persistence");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v9, v6);

    -[MTTimerDurationManager persistence](self, "persistence");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject synchronize](v11, "synchronize");
  }

}

- (void)clearAllDurations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[MTTimerDurationManager _recentDurations](self, "_recentDurations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[MTTimerDurationManager persistence](self, "persistence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("kMTTimerDurationRecents"));

  -[MTTimerDurationManager persistence](self, "persistence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("kMTTimerDurationFavorites"));

  -[MTTimerDurationManager persistence](self, "persistence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", CFSTR("kMTTimerDurationLatest"));

  -[MTTimerDurationManager persistence](self, "persistence");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "synchronize");

}

- (void)addFavoriteDuration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[MTTimerDurationManager _favoriteDurations](self, "_favoriteDurations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTTimerDurationManager addDuration:toCollection:withKey:limit:](self, "addDuration:toCollection:withKey:limit:", v4, v5, CFSTR("kMTTimerDurationFavorites"), 20);

  -[MTTimerDurationManager updateDelegate](self, "updateDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[MTTimerDurationManager _favoriteDurations](self, "_favoriteDurations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v8, "favoriteTimerDurationsDidUpdate:", v7);

}

- (void)removeFavoriteDuration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[MTTimerDurationManager _favoriteDurations](self, "_favoriteDurations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTTimerDurationManager removeDuration:fromCollection:withKey:](self, "removeDuration:fromCollection:withKey:", v4, v5, CFSTR("kMTTimerDurationFavorites"));

  -[MTTimerDurationManager updateDelegate](self, "updateDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[MTTimerDurationManager _favoriteDurations](self, "_favoriteDurations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v8, "favoriteTimerDurationsDidUpdate:", v7);

}

- (void)saveLatestDuration:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  MTTimerDurationManager *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MTTimerDurationManager set_latestDuration:](self, "set_latestDuration:", v4);
  -[MTTimerDurationManager syncrhonizeObject:withKey:](self, "syncrhonizeObject:withKey:", v4, CFSTR("kMTTimerDurationLatest"));
  MTLogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[MTTimerDurationManager updateDelegate](self, "updateDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = self;
    v11 = 2114;
    v12 = v6;
    v13 = 2114;
    v14 = v4;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ saved latest duration, calling update delegate %{public}@ with duration: %{public}@", (uint8_t *)&v9, 0x20u);

  }
  -[MTTimerDurationManager updateDelegate](self, "updateDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v7, "latestTimerDurationDidUpdate:", v8);

}

- (void)source:(id)a3 didAddTimers:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  MTTimerDurationManager *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  MTLogForCategory(4);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = self;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ didAddTimers %{public}@", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "state") == 3)
  {
    objc_msgSend((id)objc_opt_class(), "durationFromTimer:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTTimerDurationManager saveLatestDuration:](self, "saveLatestDuration:", v8);
    -[MTTimerDurationManager addRecentDuration:](self, "addRecentDuration:", v8);

  }
}

- (void)source:(id)a3 didUpdateTimers:(id)a4 fromTimers:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  MTTimerDurationManager *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  MTLogForCategory(4);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138543874;
    v15 = self;
    v16 = 2114;
    v17 = v8;
    v18 = 2114;
    v19 = v7;
    _os_log_impl(&dword_19AC4E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ didUpdateTimers fromTimers: %{public}@ toTimers: %{public}@", (uint8_t *)&v14, 0x20u);
  }

  objc_msgSend(v8, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v10 && v11 && objc_msgSend(v10, "state") != 3 && objc_msgSend(v12, "state") == 3)
  {
    objc_msgSend((id)objc_opt_class(), "durationFromTimer:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTTimerDurationManager saveLatestDuration:](self, "saveLatestDuration:", v13);
    -[MTTimerDurationManager addRecentDuration:](self, "addRecentDuration:", v13);

  }
}

+ (id)durationFromTimer:(id)a3
{
  id v3;
  MTTimerDuration *v4;
  char v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  MTTimerDuration *v10;

  v3 = a3;
  v4 = [MTTimerDuration alloc];
  v5 = objc_msgSend(v3, "isCurrentTimer");
  if ((v5 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "duration");
  v8 = v7;
  objc_msgSend(v3, "sound");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MTTimerDuration initWithTitle:duration:sound:](v4, "initWithTitle:duration:sound:", v6, v9, v8);

  if ((v5 & 1) == 0)
  return v10;
}

- (MTPersistence)persistence
{
  return self->_persistence;
}

- (void)setPersistence:(id)a3
{
  objc_storeStrong((id *)&self->_persistence, a3);
}

- (void)set_recentDurations:(id)a3
{
  objc_storeStrong((id *)&self->__recentDurations, a3);
}

- (void)set_favoriteDurations:(id)a3
{
  objc_storeStrong((id *)&self->__favoriteDurations, a3);
}

- (void)set_latestDuration:(id)a3
{
  objc_storeStrong((id *)&self->__latestDuration, a3);
}

- (MTDurationUpdateDelegate)updateDelegate
{
  return (MTDurationUpdateDelegate *)objc_loadWeakRetained((id *)&self->_updateDelegate);
}

- (void)setUpdateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_updateDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_updateDelegate);
  objc_storeStrong((id *)&self->__latestDuration, 0);
  objc_storeStrong((id *)&self->__favoriteDurations, 0);
  objc_storeStrong((id *)&self->__recentDurations, 0);
  objc_storeStrong((id *)&self->_persistence, 0);
}

- (void)synchronizeCollection:(os_log_t)log withKey:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
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
  _os_log_error_impl(&dword_19AC4E000, log, OS_LOG_TYPE_ERROR, "%{public}@ error encoding durations: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
