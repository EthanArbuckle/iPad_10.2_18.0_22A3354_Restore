@implementation MSCupidStateMachine

- (MSCupidStateMachine)initWithPersonID:(id)a3
{
  id v5;
  MSCupidStateMachine *v6;
  MSCupidStateMachine *v7;
  MSBackoffManager *v8;
  MSBackoffManager *streamsBackoffManager;
  MSBackoffManager *v10;
  MSBackoffManager *MMCSBackoffManager;
  uint64_t v12;
  NSString *manifestPath;
  void *v14;
  int v15;
  uint64_t v16;
  NSMutableDictionary *userManifest;
  NSMutableDictionary *v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *v20;
  void *v21;
  void *v22;
  void *v23;
  MSBackoffManager *v24;
  void *v25;
  void *v26;
  void *v27;
  MSBackoffManager *v28;
  objc_super v30;

  v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)MSCupidStateMachine;
  v6 = -[MSCupidStateMachine init](&v30, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_personID, a3);
    v8 = -[MSBackoffManager initWithInitialInterval:backoffFactor:randomizeFactor:maxBackoffInterval:retryAfterDate:]([MSBackoffManager alloc], "initWithInitialInterval:backoffFactor:randomizeFactor:maxBackoffInterval:retryAfterDate:", 0, 5.0, 2.0, 0.15, 1200.0);
    streamsBackoffManager = v7->_streamsBackoffManager;
    v7->_streamsBackoffManager = v8;

    v10 = -[MSBackoffManager initWithInitialInterval:backoffFactor:randomizeFactor:maxBackoffInterval:retryAfterDate:]([MSBackoffManager alloc], "initWithInitialInterval:backoffFactor:randomizeFactor:maxBackoffInterval:retryAfterDate:", 0, 5.0, 2.0, 0.15, 1200.0);
    MMCSBackoffManager = v7->_MMCSBackoffManager;
    v7->_MMCSBackoffManager = v10;

    MSPathSubscriberManifestForPersonID(v5);
    v12 = objc_claimAutoreleasedReturnValue();
    manifestPath = v7->_manifestPath;
    v7->_manifestPath = (NSString *)v12;

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "fileExistsAtPath:", v7->_manifestPath);

    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3710], "MSSafeUnarchiveObjectWithFile:outError:", v7->_manifestPath, 0);
      v16 = objc_claimAutoreleasedReturnValue();
      userManifest = v7->_userManifest;
      v7->_userManifest = (NSMutableDictionary *)v16;

    }
    v18 = v7->_userManifest;
    if (!v18)
    {
      v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v20 = v7->_userManifest;
      v7->_userManifest = v19;

      v18 = v7->_userManifest;
    }
    -[NSMutableDictionary objectForKey:](v18, "objectForKey:", CFSTR("streamsBackoffInterval"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](v7->_userManifest, "objectForKey:", CFSTR("streamsBackoffDate"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](v7->_userManifest, "objectForKey:", CFSTR("streamsBackoffDate"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21 && v22)
    {
      v24 = v7->_streamsBackoffManager;
      objc_msgSend(v21, "doubleValue");
      -[MSBackoffManager setCurrentInterval:](v24, "setCurrentInterval:");
      -[MSBackoffManager setNextExpiryDate:](v7->_streamsBackoffManager, "setNextExpiryDate:", v22);
      -[MSBackoffManager setRetryAfterDate:](v7->_streamsBackoffManager, "setRetryAfterDate:", v23);
    }
    -[NSMutableDictionary objectForKey:](v7->_userManifest, "objectForKey:", CFSTR("MMCSBackoffInterval"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](v7->_userManifest, "objectForKey:", CFSTR("MMCSBackoffDate"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](v7->_userManifest, "objectForKey:", CFSTR("MMCSRetryAfterDate"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25 && v26)
    {
      v28 = v7->_MMCSBackoffManager;
      objc_msgSend(v25, "doubleValue");
      -[MSBackoffManager setCurrentInterval:](v28, "setCurrentInterval:");
      -[MSBackoffManager setNextExpiryDate:](v7->_MMCSBackoffManager, "setNextExpiryDate:", v26);
      -[MSBackoffManager setRetryAfterDate:](v7->_MMCSBackoffManager, "setRetryAfterDate:", v27);
    }

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[MSCupidStateMachine deactivate](self, "deactivate");
  v3.receiver = self;
  v3.super_class = (Class)MSCupidStateMachine;
  -[MSCupidStateMachine dealloc](&v3, sel_dealloc);
}

- (void)deactivate
{
  MSBackoffManager *MMCSBackoffManager;
  MSBackoffManager *streamsBackoffManager;
  NSMutableDictionary *userManifest;
  NSString *manifestPath;
  NSString *personID;

  -[MSCupidStateMachine setHasDeactivated:](self, "setHasDeactivated:", 1);
  MMCSBackoffManager = self->_MMCSBackoffManager;
  self->_MMCSBackoffManager = 0;

  streamsBackoffManager = self->_streamsBackoffManager;
  self->_streamsBackoffManager = 0;

  userManifest = self->_userManifest;
  self->_userManifest = 0;

  manifestPath = self->_manifestPath;
  self->_manifestPath = 0;

  personID = self->_personID;
  self->_personID = 0;

}

- (void)forget
{
  -[MSCupidStateMachine _resetStreamsBackoffTimer](self, "_resetStreamsBackoffTimer");
  -[MSCupidStateMachine _resetMMCSBackoffTimer](self, "_resetMMCSBackoffTimer");
  -[MSCupidStateMachine _abort](self, "_abort");
  -[MSCupidStateMachine _forget](self, "_forget");
}

- (void)_commitUserManifest
{
  NSMutableDictionary *userManifest;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  userManifest = self->_userManifest;
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", userManifest, 1, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v5;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to archive userManifest, error: %@", buf, 0xCu);
  }
  if ((objc_msgSend(v4, "writeToFile:atomically:", self->_manifestPath, 1) & 1) == 0
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)objc_opt_class();
    v7 = v6;
    -[MSCupidStateMachine personID](self, "personID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v11 = v6;
    v12 = 2112;
    v13 = v8;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Cannot save user manifest.", buf, 0x16u);

  }
  -[MSCupidStateMachine _updateMasterManifest](self, "_updateMasterManifest");

}

- (void)_resetStreamsBackoffTimer
{
  double v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[MSBackoffManager currentInterval](self->_streamsBackoffManager, "currentInterval");
  if (v3 != 0.0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v4 = (void *)objc_opt_class();
      v5 = v4;
      -[MSCupidStateMachine personID](self, "personID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543618;
      v8 = v4;
      v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Resetting metadata stream backoff timer.", (uint8_t *)&v7, 0x16u);

    }
    -[MSBackoffManager reset](self->_streamsBackoffManager, "reset");
    -[NSMutableDictionary removeObjectForKey:](self->_userManifest, "removeObjectForKey:", CFSTR("streamsBackoffDate"));
    -[NSMutableDictionary removeObjectForKey:](self->_userManifest, "removeObjectForKey:", CFSTR("streamsBackoffInterval"));
    -[MSCupidStateMachine _commitUserManifest](self, "_commitUserManifest");
  }
}

- (void)_backoffStreamsBackoffTimer
{
  void *v3;
  NSMutableDictionary *userManifest;
  void *v5;
  NSMutableDictionary *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[MSBackoffManager backoff](self->_streamsBackoffManager, "backoff");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  userManifest = self->_userManifest;
  -[MSBackoffManager currentInterval](self->_streamsBackoffManager, "currentInterval");
  objc_msgSend(v3, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](userManifest, "setObject:forKey:", v5, CFSTR("streamsBackoffInterval"));

  v6 = self->_userManifest;
  -[MSBackoffManager nextExpiryDate](self->_streamsBackoffManager, "nextExpiryDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v7, CFSTR("streamsBackoffDate"));

  -[MSCupidStateMachine _commitUserManifest](self, "_commitUserManifest");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class();
    v9 = v8;
    -[MSCupidStateMachine personID](self, "personID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSBackoffManager currentInterval](self->_streamsBackoffManager, "currentInterval");
    v12 = v11;
    -[MSBackoffManager nextExpiryDate](self->_streamsBackoffManager, "nextExpiryDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544130;
    v15 = v8;
    v16 = 2112;
    v17 = v10;
    v18 = 2048;
    v19 = v12;
    v20 = 2114;
    v21 = v13;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Backing off the metadata server. Interval: %lf, next fire date: %{public}@", (uint8_t *)&v14, 0x2Au);

  }
}

- (void)_didReceiveStreamsRetryAfterDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSMutableDictionary *userManifest;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_opt_class();
    v6 = v5;
    -[MSCupidStateMachine personID](self, "personID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v5;
    v12 = 2112;
    v13 = v7;
    v14 = 2114;
    v15 = v4;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Received a metadata server retry-after date of: %{public}@", (uint8_t *)&v10, 0x20u);

  }
  -[MSBackoffManager didReceiveRetryAfterDate:](self->_streamsBackoffManager, "didReceiveRetryAfterDate:", v4);
  -[MSBackoffManager retryAfterDate](self->_streamsBackoffManager, "retryAfterDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  userManifest = self->_userManifest;
  if (v8)
    -[NSMutableDictionary setObject:forKey:](userManifest, "setObject:forKey:", v8, CFSTR("streamsRetryAfterDate"));
  else
    -[NSMutableDictionary removeObjectForKey:](userManifest, "removeObjectForKey:", CFSTR("streamsRetryAfterDate"));
  -[MSCupidStateMachine _commitUserManifest](self, "_commitUserManifest");

}

- (void)_resetMMCSBackoffTimer
{
  double v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[MSBackoffManager currentInterval](self->_MMCSBackoffManager, "currentInterval");
  if (v3 != 0.0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v4 = (void *)objc_opt_class();
      v5 = v4;
      -[MSCupidStateMachine personID](self, "personID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543618;
      v8 = v4;
      v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Resetting MMCS backoff timer.", (uint8_t *)&v7, 0x16u);

    }
    -[MSBackoffManager reset](self->_MMCSBackoffManager, "reset");
    -[NSMutableDictionary removeObjectForKey:](self->_userManifest, "removeObjectForKey:", CFSTR("MMCSBackoffDate"));
    -[NSMutableDictionary removeObjectForKey:](self->_userManifest, "removeObjectForKey:", CFSTR("MMCSBackoffInterval"));
    -[MSCupidStateMachine _commitUserManifest](self, "_commitUserManifest");
  }
}

- (void)_backoffMMCSBackoffTimer
{
  NSMutableDictionary *userManifest;
  void *v4;
  void *v5;
  NSMutableDictionary *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[MSBackoffManager backoff](self->_MMCSBackoffManager, "backoff");
  userManifest = self->_userManifest;
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[MSBackoffManager currentInterval](self->_MMCSBackoffManager, "currentInterval");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](userManifest, "setObject:forKey:", v5, CFSTR("MMCSBackoffInterval"));

  v6 = self->_userManifest;
  -[MSBackoffManager nextExpiryDate](self->_MMCSBackoffManager, "nextExpiryDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v7, CFSTR("MMCSBackoffDate"));

  -[MSCupidStateMachine _commitUserManifest](self, "_commitUserManifest");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class();
    v9 = v8;
    -[MSCupidStateMachine personID](self, "personID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSBackoffManager currentInterval](self->_MMCSBackoffManager, "currentInterval");
    v12 = v11;
    -[MSBackoffManager nextExpiryDate](self->_MMCSBackoffManager, "nextExpiryDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544130;
    v15 = v8;
    v16 = 2112;
    v17 = v10;
    v18 = 2048;
    v19 = v12;
    v20 = 2114;
    v21 = v13;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Backing off the MMCS server. Interval: %lf, next fire date: %{public}@", (uint8_t *)&v14, 0x2Au);

  }
}

- (void)_didReceiveMMCSRetryAfterDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSMutableDictionary *userManifest;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_opt_class();
    v6 = v5;
    -[MSCupidStateMachine personID](self, "personID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v5;
    v12 = 2112;
    v13 = v7;
    v14 = 2114;
    v15 = v4;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Received an MMCS server retry-after date of: %{public}@", (uint8_t *)&v10, 0x20u);

  }
  -[MSBackoffManager didReceiveRetryAfterDate:](self->_MMCSBackoffManager, "didReceiveRetryAfterDate:", v4);
  -[MSBackoffManager retryAfterDate](self->_MMCSBackoffManager, "retryAfterDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  userManifest = self->_userManifest;
  if (v8)
    -[NSMutableDictionary setObject:forKey:](userManifest, "setObject:forKey:", v8, CFSTR("MMCSRetryAfterDate"));
  else
    -[NSMutableDictionary removeObjectForKey:](userManifest, "removeObjectForKey:", CFSTR("MMCSRetryAfterDate"));
  -[MSCupidStateMachine _commitUserManifest](self, "_commitUserManifest");

}

- (id)_latestNextActivityDate
{
  void *v3;
  void *v4;
  id v5;

  -[MSBackoffManager nextExpiryDate](self->_streamsBackoffManager, "nextExpiryDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSBackoffManager nextExpiryDate](self->_MMCSBackoffManager, "nextExpiryDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "compare:", v3) == 1)
  {
    v5 = v4;

    v3 = v5;
  }

  return v3;
}

- (void)_updateMasterManifest
{
  __assert_rtn("-[MSCupidStateMachine _updateMasterManifest]", "MSCupidStateMachine.m", 174, "0");
}

- (void)_abort
{
  __assert_rtn("-[MSCupidStateMachine _abort]", "MSCupidStateMachine.m", 178, "0");
}

- (void)_forget
{
  __assert_rtn("-[MSCupidStateMachine _forget]", "MSCupidStateMachine.m", 182, "0");
}

- (void)protocol:(id)a3 didReceiveRetryAfterDate:(id)a4
{
  -[MSCupidStateMachine _didReceiveStreamsRetryAfterDate:](self, "_didReceiveStreamsRetryAfterDate:", a4);
}

- (NSMutableDictionary)_userManifest
{
  return self->_userManifest;
}

- (void)set_userManifest:(id)a3
{
  objc_storeStrong((id *)&self->_userManifest, a3);
}

- (NSString)personID
{
  return self->_personID;
}

- (BOOL)hasDeactivated
{
  return self->_hasDeactivated;
}

- (void)setHasDeactivated:(BOOL)a3
{
  self->_hasDeactivated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_MMCSBackoffManager, 0);
  objc_storeStrong((id *)&self->_streamsBackoffManager, 0);
  objc_storeStrong((id *)&self->_userManifest, 0);
  objc_storeStrong((id *)&self->_manifestPath, 0);
  objc_storeStrong((id *)&self->_personID, 0);
}

@end
