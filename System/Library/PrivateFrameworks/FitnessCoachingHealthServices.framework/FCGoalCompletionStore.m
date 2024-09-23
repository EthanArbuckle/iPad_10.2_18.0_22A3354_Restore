@implementation FCGoalCompletionStore

- (FCGoalCompletionStore)initWithProfile:(id)a3
{
  id v4;
  FCGoalCompletionStore *v5;
  FCGoalCompletionStore *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FCGoalCompletionStore;
  v5 = -[FCGoalCompletionStore init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v6->_unfairLock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (int64_t)_activitySummaryIndexForDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "hk_gregorianCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", *MEMORY[0x1E0CB73B0], v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = _HKCacheIndexFromDateComponents();
  return v7;
}

- (id)allGoalTypesMetForActivitySummaryIndex:(int64_t)a3
{
  void *v5;
  char v6;
  char v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FCGoalCompletionStore _goalTypesMetForActivitySummaryIndex:](self, "_goalTypesMetForActivitySummaryIndex:", a3);
  v7 = v6;
  if ((v6 & 1) == 0)
  {
    if ((v6 & 2) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(v5, "addObject:", &unk_1E8805BD8);
    if ((v7 & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(v5, "addObject:", &unk_1E8805BC0);
  if ((v7 & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v7 & 4) != 0)
LABEL_4:
    objc_msgSend(v5, "addObject:", &unk_1E8805BF0);
LABEL_5:
  v8 = (void *)objc_msgSend(v5, "copy");

  return v8;
}

- (void)addGoalTypeToDailyGoalTypesMet:(int64_t)a3 activitySummaryIndex:(int64_t)a4
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v7 = -[FCGoalCompletionStore _goalTypesMetForActivitySummaryIndex:](self, "_goalTypesMetForActivitySummaryIndex:", a4);
  v8 = v7 | 2;
  v9 = v7 | 1;
  if (a3 != 1)
    v9 = v7;
  if (a3 != 2)
    v8 = v9;
  if (a3 == 3)
    v10 = v7 | 4;
  else
    v10 = v8;
  -[FCGoalCompletionStore _setGoalTypesMet:forActivitySummaryIndex:](self, "_setGoalTypesMet:forActivitySummaryIndex:", v10, a4);
}

- (BOOL)isDailyGoalTypeMet:(int64_t)a3 activitySummaryIndex:(int64_t)a4
{
  unint64_t v5;
  _BOOL8 v6;
  char v7;

  v5 = -[FCGoalCompletionStore _goalTypesMetForActivitySummaryIndex:](self, "_goalTypesMetForActivitySummaryIndex:", a4);
  v6 = (v5 >> 1) & 1;
  v7 = v5 & 1;
  if (a3 != 1)
    v7 = 0;
  if (a3 != 2)
    LOBYTE(v6) = v7;
  if (a3 == 3)
    return (v5 & 4) != 0;
  else
    return v6;
}

- (void)addDailyGoalTypePreviouslyMet:(int64_t)a3 activitySummaryIndex:(int64_t)a4
{
  NSObject *v7;
  int v8;
  int64_t v9;
  __int16 v10;
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!-[FCGoalCompletionStore isDailyGoalTypeMet:activitySummaryIndex:](self, "isDailyGoalTypeMet:activitySummaryIndex:"))
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB5298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 134218240;
      v9 = a3;
      v10 = 2048;
      v11 = a4;
      _os_log_impl(&dword_1CC30F000, v7, OS_LOG_TYPE_DEFAULT, "Goal type %ld was previously met for activitySummaryIndex: %lld", (uint8_t *)&v8, 0x16u);
    }
    -[FCGoalCompletionStore addGoalTypeToDailyGoalTypesMet:activitySummaryIndex:](self, "addGoalTypeToDailyGoalTypesMet:activitySummaryIndex:", a3, a4);
  }
}

- (void)addGoalTypeToNotify:(int64_t)a3 activitySummaryIndex:(int64_t)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  int v24;
  int64_t v25;
  __int16 v26;
  void *v27;
  void *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  -[FCGoalCompletionStore goalTypesToNotifyByActivitySummaryIndex](self, "goalTypesToNotifyByActivitySummaryIndex");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = (void *)MEMORY[0x1E0C9AA70];
  if (v7)
    v9 = (void *)v7;
  v10 = v9;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allObjects");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = (void *)MEMORY[0x1E0C9AA60];
  if (v13)
    v15 = (void *)v13;
  v16 = v15;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "arrayByAddingObject:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v19;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "hk_dictionaryByAddingEntriesFromDictionary:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCGoalCompletionStore _setGoalTypesToNotifyByActivitySummaryIndex:](self, "_setGoalTypesToNotifyByActivitySummaryIndex:", v22);
  _HKInitializeLogging();
  v23 = *MEMORY[0x1E0CB5298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
  {
    v24 = 134218242;
    v25 = a3;
    v26 = 2112;
    v27 = v22;
    _os_log_impl(&dword_1CC30F000, v23, OS_LOG_TYPE_DEFAULT, "Added goal type to be notified: %ld, %@", (uint8_t *)&v24, 0x16u);
  }

}

- (void)removeGoalTypesToNotify:(id)a3 activitySummaryIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a3;
  -[FCGoalCompletionStore goalTypesToNotifyByActivitySummaryIndex](self, "goalTypesToNotifyByActivitySummaryIndex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v6, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "removeObjectsInArray:", v12);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v13, v14);

  -[FCGoalCompletionStore _setGoalTypesToNotifyByActivitySummaryIndex:](self, "_setGoalTypesToNotifyByActivitySummaryIndex:", v15);
}

- (id)goalTypesToNotifyForActivitySummaryIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  -[FCGoalCompletionStore goalTypesToNotifyByActivitySummaryIndex](self, "goalTypesToNotifyByActivitySummaryIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  v9 = v8;

  return v9;
}

- (void)_setGoalTypesMet:(unint64_t)a3 forActivitySummaryIndex:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCGoalCompletionStore _goalCompletionByActivitySummaryIndex](self, "_goalCompletionByActivitySummaryIndex");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = (void *)MEMORY[0x1E0C9AA70];
  if (v10)
    v12 = (void *)v10;
  v13 = v12;

  objc_msgSend(v13, "hk_dictionaryByAddingEntriesFromDictionary:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCGoalCompletionStore _trimOldGoalCompletions:index:](self, "_trimOldGoalCompletions:index:", v14, a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCGoalCompletionStore _setGoalCompletionByActivitySummaryIndex:](self, "_setGoalCompletionByActivitySummaryIndex:", v15);

}

- (unint64_t)_goalTypesMetForActivitySummaryIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  -[FCGoalCompletionStore _goalCompletionByActivitySummaryIndex](self, "_goalCompletionByActivitySummaryIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "unsignedIntegerValue");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_trimOldGoalCompletions:(id)a3 index:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  int64_t v16;

  v5 = a3;
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "count") >= 8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sortedArrayUsingSelector:", sel_compare_);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __55__FCGoalCompletionStore__trimOldGoalCompletions_index___block_invoke;
    v13[3] = &unk_1E8800870;
    v16 = a4;
    v9 = v7;
    v14 = v9;
    v15 = v5;
    v10 = v5;
    objc_msgSend(v8, "enumerateObjectsWithOptions:usingBlock:", 2, v13);
    v11 = v15;
    v5 = v9;

  }
  return v5;
}

void __55__FCGoalCompletionStore__trimOldGoalCompletions_index___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  if ((unint64_t)objc_msgSend(v9, "unsignedLongLongValue") <= *(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v9);

    objc_msgSend(*(id *)(a1 + 32), "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8 == 7)
      *a4 = 1;
  }

}

- (id)goalTypesToNotifyByActivitySummaryIndex
{
  os_unfair_lock_s *p_unfairLock;
  NSDictionary *v4;

  p_unfairLock = &self->_unfairLock;
  os_unfair_lock_lock(&self->_unfairLock);
  v4 = self->_goalTypesToNotifyByActivitySummaryIndex;
  os_unfair_lock_unlock(p_unfairLock);
  return v4;
}

- (void)_setGoalTypesToNotifyByActivitySummaryIndex:(id)a3
{
  NSDictionary *v4;
  NSDictionary *goalTypesToNotifyByActivitySummaryIndex;

  v4 = (NSDictionary *)a3;
  os_unfair_lock_lock(&self->_unfairLock);
  goalTypesToNotifyByActivitySummaryIndex = self->_goalTypesToNotifyByActivitySummaryIndex;
  self->_goalTypesToNotifyByActivitySummaryIndex = v4;

  os_unfair_lock_unlock(&self->_unfairLock);
}

- (id)_goalCompletionByActivitySummaryIndex
{
  os_unfair_lock_s *p_unfairLock;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  id v14;
  uint8_t buf[4];
  id v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  p_unfairLock = &self->_unfairLock;
  os_unfair_lock_lock(&self->_unfairLock);
  -[FCGoalCompletionStore _userDefaultsDomain](self, "_userDefaultsDomain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataForKey:error:", CFSTR("dailyGoalCompletionData"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_unfairLock);
  v6 = (void *)MEMORY[0x1E0C99E60];
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v8, v5, &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v14;
  if (v10)
  {
    _HKInitializeLogging();
    v11 = *MEMORY[0x1E0CB5298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v10;
      _os_log_impl(&dword_1CC30F000, v11, OS_LOG_TYPE_DEFAULT, "Unable to obtain the goal types met for activity summary index: %@", buf, 0xCu);
    }
    v12 = 0;
  }
  else
  {
    v12 = v9;
  }

  return v12;
}

- (void)_setGoalCompletionByActivitySummaryIndex:(id)a3
{
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  os_unfair_lock_s *p_unfairLock;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  if (v5)
  {
    v6 = v5;
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB5298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_impl(&dword_1CC30F000, v7, OS_LOG_TYPE_DEFAULT, "Unable to set the goals type met: %@", buf, 0xCu);
    }
  }
  else
  {
    p_unfairLock = &self->_unfairLock;
    os_unfair_lock_lock(&self->_unfairLock);
    -[FCGoalCompletionStore _userDefaultsDomain](self, "_userDefaultsDomain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(v9, "setData:forKey:error:", v4, CFSTR("dailyGoalCompletionData"), &v11);
    v6 = v11;
    if (v6)
    {
      _HKInitializeLogging();
      v10 = *MEMORY[0x1E0CB5298];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v6;
        _os_log_impl(&dword_1CC30F000, v10, OS_LOG_TYPE_DEFAULT, "Unable to store the goal types met for activity summary index: %@", buf, 0xCu);
      }
    }
    os_unfair_lock_unlock(p_unfairLock);

  }
}

- (id)_userDefaultsDomain
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__FCGoalCompletionStore__userDefaultsDomain__block_invoke;
  block[3] = &unk_1E8800798;
  block[4] = self;
  if (_userDefaultsDomain_onceToken != -1)
    dispatch_once(&_userDefaultsDomain_onceToken, block);
  return (id)_userDefaultsDomain_defaultsDomain;
}

void __44__FCGoalCompletionStore__userDefaultsDomain__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  v2 = objc_alloc(MEMORY[0x1E0D294B8]);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = objc_msgSend(v2, "initWithCategory:domainName:profile:", 1, CFSTR("com.apple.nanolifestyle.coaching.goalCompletion"), WeakRetained);
  v4 = (void *)_userDefaultsDomain_defaultsDomain;
  _userDefaultsDomain_defaultsDomain = v3;

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_goalTypesToNotifyByActivitySummaryIndex, 0);
}

@end
