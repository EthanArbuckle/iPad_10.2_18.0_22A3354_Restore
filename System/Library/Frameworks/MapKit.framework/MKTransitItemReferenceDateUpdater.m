@implementation MKTransitItemReferenceDateUpdater

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    _MergedGlobals_169 = 0;
}

- (MKTransitItemReferenceDateUpdater)initWithDelegate:(id)a3
{
  id v4;
  MKTransitItemReferenceDateUpdater *v5;
  MKTransitItemReferenceDateUpdater *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MKTransitItemReferenceDateUpdater;
  v5 = -[MKTransitItemReferenceDateUpdater init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (void)setActive:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;
  void *v6;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_active == v3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_active = v3;
    os_unfair_lock_unlock(p_lock);
    v6 = (void *)objc_opt_class();
    if (v3)
      objc_msgSend(v6, "_addUpdater:", self);
    else
      objc_msgSend(v6, "_removeUpdater:", self);
  }
}

+ (id)_currentTimeWithRoundedSeconds
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "components:fromDate:", 224, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateBySettingHour:minute:second:ofDate:options:", objc_msgSend(v4, "hour"), objc_msgSend(v4, "minute"), 30 * (objc_msgSend(v4, "second") / 30), v2, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (NSDate)referenceDate
{
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_169);
  if (objc_msgSend(a1, "_needsUpdateReferenceDate"))
    objc_msgSend(a1, "_updateReferenceDate");
  v3 = (id)qword_1ECE2DDC8;
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_169);
  return (NSDate *)v3;
}

+ (double)referenceDateAsTimeInterval
{
  double v3;

  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_169);
  if (objc_msgSend(a1, "_needsUpdateReferenceDate"))
    objc_msgSend(a1, "_updateReferenceDate");
  v3 = *(double *)&qword_1ECE2DDD0;
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_169);
  return v3;
}

+ (BOOL)_needsUpdateReferenceDate
{
  BOOL v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  os_unfair_lock_assert_owner((const os_unfair_lock *)&_MergedGlobals_169);
  if (!qword_1ECE2DDC8)
    return 1;
  if ((objc_msgSend((id)qword_1ECE2DDD8, "isValid") & 1) != 0)
    return 0;
  v3 = (void *)qword_1ECE2DDC8;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;
  v7 = (void *)qword_1ECE2DDC8;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  if (v6 >= 0.0)
    v10 = v9;
  else
    v10 = -v9;

  v2 = v10 >= 30.0;
  return v2;
}

+ (void)_updateReferenceDate
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner((const os_unfair_lock *)&_MergedGlobals_169);
  objc_msgSend(a1, "_currentTimeWithRoundedSeconds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend((id)qword_1ECE2DDC8, "isEqualToDate:", v3) & 1) == 0)
  {
    MKGetTransitItemUpdaterLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v14 = qword_1ECE2DDC8;
      v15 = 2112;
      v16 = v3;
      _os_log_impl(&dword_18B0B0000, v4, OS_LOG_TYPE_INFO, "Updating current reference date %@ to date: %@", buf, 0x16u);
    }

    objc_storeStrong((id *)&qword_1ECE2DDC8, v3);
    objc_msgSend(v3, "timeIntervalSinceReferenceDate");
    qword_1ECE2DDD0 = v5;
    objc_msgSend((id)qword_1ECE2DDE0, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)qword_1ECE2DDC8;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__MKTransitItemReferenceDateUpdater__updateReferenceDate__block_invoke;
    v10[3] = &unk_1E20D7E58;
    v11 = v6;
    v12 = v7;
    v8 = v7;
    v9 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v10);

  }
}

void __57__MKTransitItemReferenceDateUpdater__updateReferenceDate__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v15;
    *(_QWORD *)&v4 = 138412546;
    v13 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "delegate", v13, (_QWORD)v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        MKGetTransitItemUpdaterLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          v11 = (objc_class *)objc_opt_class();
          NSStringFromClass(v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v13;
          v19 = v12;
          v20 = 2048;
          v21 = v9;
          _os_log_impl(&dword_18B0B0000, v10, OS_LOG_TYPE_DEBUG, "Notifying %@<%p> of reference date update", buf, 0x16u);

        }
        objc_msgSend(v9, "transitItemReferenceDateUpdater:didUpdateToReferenceDate:", v8, *(_QWORD *)(a1 + 40));

      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v5);
  }

}

+ (void)_scheduleReferenceDateUpdate
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  int v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (GEOConfigGetBOOL())
  {
    MKGetTransitItemUpdaterLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_18B0B0000, v3, OS_LOG_TYPE_INFO, "Suppressing update timer due to debug setting", (uint8_t *)&v16, 2u);
    }

  }
  else
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)&_MergedGlobals_169);
    if (objc_msgSend(a1, "_updaterCount"))
    {
      objc_msgSend((id)qword_1ECE2DDD8, "invalidate");
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "components:fromDate:", 224, v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "second");
      if (30 * (v7 / 30) + 30 <= 59)
        v8 = 30 * (v7 / 30) + 30;
      else
        v8 = 0;
      objc_msgSend(v5, "nextDateAfterDate:matchingUnit:value:options:", v4, 128, v8, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSinceDate:", v4);
      v11 = ceil(v10);
      MKGetTransitItemUpdaterLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v16 = 134217984;
        v17 = v11;
        _os_log_impl(&dword_18B0B0000, v12, OS_LOG_TYPE_DEBUG, "Scheduling reference date update in %#.1lfs", (uint8_t *)&v16, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", a1, sel__referenceDateUpdateTimerFired, 0, 0, v11);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)qword_1ECE2DDD8;
      qword_1ECE2DDD8 = v13;

    }
    else
    {
      MKGetTransitItemUpdaterLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_18B0B0000, v15, OS_LOG_TYPE_DEBUG, "Reference date was scheduled but there are no subscribers. Abandoning scheduling the update (cancel if needed)", (uint8_t *)&v16, 2u);
      }

      objc_msgSend(a1, "_cancelReferenceDateUpdate");
    }
  }
}

+ (void)_cancelReferenceDateUpdate
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  os_unfair_lock_assert_owner((const os_unfair_lock *)&_MergedGlobals_169);
  if (qword_1ECE2DDD8)
  {
    MKGetTransitItemUpdaterLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18B0B0000, v2, OS_LOG_TYPE_DEBUG, "Cancelling scheduled reference date update", v4, 2u);
    }

    objc_msgSend((id)qword_1ECE2DDD8, "invalidate");
    v3 = (void *)qword_1ECE2DDD8;
    qword_1ECE2DDD8 = 0;

  }
}

+ (void)_referenceDateUpdateTimerFired
{
  NSObject *v3;
  uint8_t v4[16];

  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_169);
  MKGetTransitItemUpdaterLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18B0B0000, v3, OS_LOG_TYPE_DEBUG, "Reference date timer fired", v4, 2u);
  }

  objc_msgSend((id)qword_1ECE2DDD8, "invalidate");
  objc_msgSend(a1, "_updateReferenceDate");
  objc_msgSend(a1, "_scheduleReferenceDateUpdate");
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_169);
}

+ (void)_addUpdater:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_169);
  v4 = (void *)qword_1ECE2DDE0;
  if (!qword_1ECE2DDE0)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)qword_1ECE2DDE0;
    qword_1ECE2DDE0 = v5;

    v4 = (void *)qword_1ECE2DDE0;
  }
  objc_msgSend(v4, "addObject:", v7);
  if (objc_msgSend(a1, "_updaterCount"))
  {
    if (objc_msgSend(a1, "_needsUpdateReferenceDate"))
      objc_msgSend(a1, "_updateReferenceDate");
    objc_msgSend(a1, "_scheduleReferenceDateUpdate");
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_169);

}

+ (void)_removeUpdater:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_169);
  if (qword_1ECE2DDE0)
  {
    objc_msgSend((id)qword_1ECE2DDE0, "removeObject:", v4);
    if (!objc_msgSend(a1, "_updaterCount"))
      objc_msgSend(a1, "_cancelReferenceDateUpdate");
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_169);

}

+ (unint64_t)_updaterCount
{
  void *v2;
  unint64_t v3;

  os_unfair_lock_assert_owner((const os_unfair_lock *)&_MergedGlobals_169);
  objc_msgSend((id)qword_1ECE2DDE0, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (MKTransitItemReferenceDateUpdaterDelegate)delegate
{
  return (MKTransitItemReferenceDateUpdaterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isActive
{
  return self->_active;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
