@implementation GEOReferenceTimeManager

void __40__GEOReferenceTimeManager_sharedManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[GEOReferenceTimeManager _initInternal]([GEOReferenceTimeManager alloc], "_initInternal");
  v1 = (void *)_MergedGlobals_268;
  _MergedGlobals_268 = (uint64_t)v0;

}

- (id)_initInternal
{
  GEOReferenceTimeManager *v2;
  dispatch_semaphore_t v3;
  OS_dispatch_semaphore *syncSem;
  uint64_t v5;
  geo_isolater *iso;
  double v7;
  BOOL v8;
  NSObject *v9;
  void *global_queue;
  _QWORD block[4];
  GEOReferenceTimeManager *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)GEOReferenceTimeManager;
  v2 = -[GEOReferenceTimeManager init](&v14, sel_init);
  if (v2)
  {
    v3 = dispatch_semaphore_create(1);
    syncSem = v2->_syncSem;
    v2->_syncSem = (OS_dispatch_semaphore *)v3;

    v5 = geo_isolater_create();
    iso = v2->_iso;
    v2->_iso = (geo_isolater *)v5;

    v2->_isGEOAPD = +[GEOPlatform isRunningInGeoAPd](GEOPlatform, "isRunningInGeoAPd");
    v2->_attemptNum = 0;
    geoTMGetKernelMonotonicClock();
    v2->_managerStartTime = v7;
    v8 = -[GEOReferenceTimeManager _initFromPersistenceAtTime:](v2, "_initFromPersistenceAtTime:");
    v2->_synchronized = v8;
    if (!v2->_isGEOAPD)
    {
      global_queue = (void *)geo_get_global_queue();
      _GEOConfigAddDelegateListenerForKey(GeoServicesConfig_BasisRefTimeData, (uint64_t)off_1EDF4E058, global_queue, v2);
      goto LABEL_6;
    }
    if (!v8)
    {
      v9 = geo_get_global_queue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __40__GEOReferenceTimeManager__initInternal__block_invoke;
      block[3] = &unk_1E1BFF6F8;
      v13 = v2;
      dispatch_async(v9, block);

      global_queue = v13;
LABEL_6:

    }
  }
  return v2;
}

- (BOOL)_initFromPersistenceAtTime:(double)a3
{
  NSObject *v5;
  GEOReferenceTimeData *v6;
  GEOReferenceTimeData *refTimeData;
  _BOOL4 v8;
  NSObject *v9;
  _BOOL4 v10;
  _BOOL8 v11;
  uint64_t v12;
  uint8_t v14[16];
  uint8_t v15[16];
  uint8_t v16[16];
  uint8_t buf[16];

  GEOGetReferenceTimeManagerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_INFO, "checking for persisted basis data", buf, 2u);
  }

  -[GEOReferenceTimeManager _retrievePersistedBasisRefTimeData](self, "_retrievePersistedBasisRefTimeData");
  v6 = (GEOReferenceTimeData *)objc_claimAutoreleasedReturnValue();
  refTimeData = self->_refTimeData;
  self->_refTimeData = v6;

  if (self->_refTimeData)
  {
    v8 = -[GEOReferenceTimeManager _didKernBootTimeChange](self, "_didKernBootTimeChange");
    GEOGetReferenceTimeManagerLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v8)
    {
      if (v10)
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_INFO, "found stale basis data", v15, 2u);
      }
      v11 = 0;
      v12 = 5;
    }
    else if (v10)
    {
      *(_WORD *)v14 = 0;
      v11 = 1;
      _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_INFO, "found good basis data", v14, 2u);
      v12 = 0;
    }
    else
    {
      v12 = 0;
      v11 = 1;
    }
  }
  else
  {
    GEOGetReferenceTimeManagerLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_INFO, "found no basis data", v16, 2u);
    }
    v11 = 0;
    v12 = 4;
  }

  ++self->_attemptNum;
  -[GEOReferenceTimeManager _reportCoreAnalyticAtTime:success:error:attemptNo:](self, "_reportCoreAnalyticAtTime:success:error:attemptNo:", v11, v12, a3);
  return v11;
}

- (id)_retrievePersistedBasisRefTimeData
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _getValue(GeoServicesConfig_BasisRefTimeData, (uint64_t)off_1EDF4E058, 1, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v7 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v2, &v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v7;
    if (!v3)
    {
      GEOGetReferenceTimeManagerLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v9 = v4;
        _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_ERROR, "unarchival error : %@", buf, 0xCu);
      }

      _setValue(GeoServicesConfig_BasisRefTimeData, (uint64_t)off_1EDF4E058, 0, 0, 0);
    }

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)_reportCoreAnalyticAtTime:(double)a3 success:(BOOL)a4 error:(unsigned __int8)a5 attemptNo:(unsigned int)a6
{
  _QWORD v6[6];
  unsigned int v7;
  BOOL v8;
  unsigned __int8 v9;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__GEOReferenceTimeManager__reportCoreAnalyticAtTime_success_error_attemptNo___block_invoke;
  v6[3] = &unk_1E1C108B8;
  v7 = a6;
  *(double *)&v6[5] = a3;
  v6[4] = self;
  v8 = a4;
  v9 = a5;
  geoAnalyticsSendEventLazy(CFSTR("com.apple.geoap.reftime"), v6);
}

void __47__GEOReferenceTimeManager_referenceTimeResult___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _BYTE *v3;
  NSObject *v4;
  NSObject *global_queue;
  _QWORD block[5];
  uint8_t buf[16];

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_synchronized");
  objc_msgSend(*(id *)(a1 + 32), "_referenceTime");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v2;
  v3 = *(_BYTE **)(a1 + 32);
  if (v3[33] && objc_msgSend(v3, "_didKernBootTimeChange"))
  {
    GEOGetReferenceTimeManagerLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_INFO, "timed sync required", buf, 2u);
    }

    global_queue = geo_get_global_queue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__GEOReferenceTimeManager_referenceTimeResult___block_invoke_76;
    block[3] = &unk_1E1BFF6F8;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(global_queue, block);

  }
}

- (BOOL)_synchronized
{
  geo_assert_isolated();
  if (_GEOConfigHasValue(GeoServicesConfig_RefTimeValid, (uint64_t)off_1EDF4E078))
    return GEOConfigGetBOOL(GeoServicesConfig_RefTimeValid, (uint64_t)off_1EDF4E078);
  else
    return self->_synchronized;
}

- (double)_referenceTime
{
  double Double;
  double v4;

  geo_assert_isolated();
  Double = 0.0;
  if (_GEOConfigHasValue(GeoServicesConfig_RefTimeOffset, (uint64_t)off_1EDF4E068))
    Double = GEOConfigGetDouble(GeoServicesConfig_RefTimeOffset, (uint64_t)off_1EDF4E068);
  -[GEOReferenceTimeData currentReferenceTime](self->_refTimeData, "currentReferenceTime");
  return Double + v4;
}

- (BOOL)_didKernBootTimeChange
{
  NSObject *v2;
  BOOL v3;
  uint8_t v5[16];
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__GEOReferenceTimeManager__didKernBootTimeChange__block_invoke;
  v6[3] = &unk_1E1C108E0;
  v6[4] = self;
  v6[5] = &v7;
  -[GEOReferenceTimeManager _kernBootTimeResult:](self, "_kernBootTimeResult:", v6);
  if (*((_BYTE *)v8 + 24))
  {
    GEOGetReferenceTimeManagerLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_INFO, "kern boottime mismatch", v5, 2u);
    }

    v3 = *((_BYTE *)v8 + 24) != 0;
  }
  else
  {
    v3 = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (void)_kernBootTimeResult:(id)a3
{
  void (**v3)(id, uint64_t, uint64_t, BOOL);
  int v4;
  NSObject *v5;
  int *v6;
  char *v7;
  size_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t buf[4];
  char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, uint64_t, uint64_t, BOOL))a3;
  v9 = 0;
  v10 = 0;
  v8 = 16;
  v4 = sysctlbyname("kern.boottime", &v9, &v8, 0, 0);
  if (v4)
  {
    GEOGetReferenceTimeManagerLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = __error();
      v7 = strerror(*v6);
      *(_DWORD *)buf = 136315138;
      v12 = v7;
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_ERROR, "can't read kern.boottime : (%s)", buf, 0xCu);
    }

  }
  v3[2](v3, v9, v10, v4 == 0);

}

uint64_t __49__GEOReferenceTimeManager__didKernBootTimeChange__block_invoke(uint64_t result, uint64_t a2, int a3, int a4)
{
  uint64_t v4;
  int v7;
  BOOL v8;

  v4 = result;
  if (a4 && (result = objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 8), "kernBootTime"), result == a2))
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(v4 + 32) + 8), "kernBootTime");
    v8 = v7 != a3;
  }
  else
  {
    v8 = 1;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v4 + 40) + 8) + 24) = v8;
  return result;
}

- (id)bestReferenceDate
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0C99D68];
  -[GEOReferenceTimeManager bestReferenceTime](self, "bestReferenceTime");
  return (id)objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");
}

- (double)bestReferenceTime
{
  double Current;
  _QWORD v4[5];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__GEOReferenceTimeManager_bestReferenceTime__block_invoke;
  v4[3] = &unk_1E1C10930;
  v4[4] = &v5;
  -[GEOReferenceTimeManager referenceTimeResult:](self, "referenceTimeResult:", v4);
  Current = v6[3];
  if (Current == 0.0)
    Current = CFAbsoluteTimeGetCurrent();
  _Block_object_dispose(&v5, 8);
  return Current;
}

- (void)referenceTimeResult:(id)a3
{
  void (**v3)(id, _QWORD, double);
  uint64_t v4;
  double *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v3 = (void (**)(id, _QWORD, double))a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v4 = 0;
  v5 = (double *)&v4;
  v6 = 0x2020000000;
  v7 = 0;
  geo_isolate_sync();
  v3[2](v3, *((unsigned __int8 *)v9 + 24), v5[3]);
  _Block_object_dispose(&v4, 8);
  _Block_object_dispose(&v8, 8);

}

+ (id)sharedManager
{
  if (qword_1ECDBC368 != -1)
    dispatch_once(&qword_1ECDBC368, &__block_literal_global_128);
  return (id)_MergedGlobals_268;
}

uint64_t __44__GEOReferenceTimeManager_bestReferenceTime__block_invoke(uint64_t result, int a2, double a3)
{
  if (a2)
    *(double *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a3;
  return result;
}

uint64_t __40__GEOReferenceTimeManager__initInternal__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startTimedSync");
}

- (void)dealloc
{
  objc_super v3;

  GEOConfigRemoveDelegateListenerForKey(GEOConfigKey_Invalid, *(uint64_t *)algn_1EDF51968, self);
  v3.receiver = self;
  v3.super_class = (Class)GEOReferenceTimeManager;
  -[GEOReferenceTimeManager dealloc](&v3, sel_dealloc);
}

id __77__GEOReferenceTimeManager__reportCoreAnalyticAtTime_success_error_attemptNo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("attempt");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v2;
  v9[1] = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40) - *(double *)(*(_QWORD *)(a1 + 32) + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v3;
  v9[2] = CFSTR("success");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 52));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v4;
  v9[3] = CFSTR("failReason");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(a1 + 53));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v5;
  v9[4] = CFSTR("observer");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) == 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_persistBasisRefTimeData:(id)a3
{
  void *v3;
  id v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  if (v3)
  {
    _setValue(GeoServicesConfig_BasisRefTimeData, (uint64_t)off_1EDF4E058, v3, 1, 0);
    GEOGetReferenceTimeManagerLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v6 = "persisted new GEOReferenceTimeData";
      v7 = v5;
      v8 = OS_LOG_TYPE_DEBUG;
      v9 = 2;
LABEL_6:
      _os_log_impl(&dword_1885A9000, v7, v8, v6, buf, v9);
    }
  }
  else
  {
    GEOGetReferenceTimeManagerLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v4;
      v6 = "unable to secure encode GEOReferenceTimeData : %@";
      v7 = v5;
      v8 = OS_LOG_TYPE_ERROR;
      v9 = 12;
      goto LABEL_6;
    }
  }

}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  NSObject *v3;
  void *global_queue;
  uint8_t buf[16];

  GEOGetReferenceTimeManagerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_INFO, "client basis data changed", buf, 2u);
  }

  global_queue = (void *)geo_get_global_queue();
  geo_isolate_async();

}

uint64_t __55__GEOReferenceTimeManager_valueChangedForGEOConfigKey___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  v2 = *(void **)(a1 + 32);
  geoTMGetKernelMonotonicClock();
  result = objc_msgSend(v2, "_initFromPersistenceAtTime:");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = result;
  return result;
}

- (void)_startTimedSync
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  GEOGetReferenceTimeManagerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_INFO, "starting sync with timed", buf, 2u);
  }

  if (dispatch_semaphore_wait((dispatch_semaphore_t)self->_syncSem, 0))
  {
    GEOGetReferenceTimeManagerLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_INFO, "sync with timed already running", v5, 2u);
    }

  }
  else
  {
    -[GEOReferenceTimeManager _syncWithTimed](self, "_syncWithTimed");
  }
}

- (void)_syncWithTimed
{
  NSObject *v3;
  uint64_t attemptNum;
  void *v5;
  void *v6;
  int v7;
  double v8;
  double v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  char v15;
  unsigned int v16;
  unint64_t v17;
  dispatch_time_t v18;
  NSObject *global_queue;
  NSObject *v20;
  _QWORD block[4];
  id v22;
  id location;
  _QWORD v24[11];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  __int128 buf;
  uint64_t v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  GEOGetReferenceTimeManagerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_INFO, "syncing with timed", (uint8_t *)&buf, 2u);
  }

  v37 = 0;
  v38 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  attemptNum = self->_attemptNum;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v40 = 0x2020000000;
  v5 = getTMGetReferenceTimeSymbolLoc_ptr;
  v41 = getTMGetReferenceTimeSymbolLoc_ptr;
  if (!getTMGetReferenceTimeSymbolLoc_ptr)
  {
    v6 = (void *)CoreTimeLibrary();
    v5 = dlsym(v6, "TMGetReferenceTime");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v5;
    getTMGetReferenceTimeSymbolLoc_ptr = v5;
  }
  _Block_object_dispose(&buf, 8);
  if (!v5)
  {
    dlerror();
    abort_report_np();
    __break(1u);
  }
  v7 = ((uint64_t (*)(uint64_t *, uint64_t *, int *))v5)(&v38, &v37, &v36);
  geoTMGetKernelMonotonicClock();
  v9 = v8;
  v10 = MEMORY[0x1E0C809B0];
  if (!v7 || *((int *)v34 + 6) < 1)
  {
    GEOGetReferenceTimeManagerLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_INFO, "didn't retrieve good reference time", (uint8_t *)&buf, 2u);
    }

    GEOGetReferenceTimeManagerLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = *((_DWORD *)v34 + 6);
      LODWORD(buf) = 67109376;
      DWORD1(buf) = v7;
      WORD4(buf) = 1024;
      *(_DWORD *)((char *)&buf + 10) = v14;
      _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_ERROR, "TMGetReferenceTime(return code %d, reliable %d)", (uint8_t *)&buf, 0xEu);
    }

    if (v7)
      v15 = 2;
    else
      v15 = 1;
    *((_BYTE *)v26 + 24) = v15;
    *((_DWORD *)v34 + 6) = 0;
    goto LABEL_20;
  }
  GEOGetReferenceTimeManagerLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_INFO, "retrieved good reference time", (uint8_t *)&buf, 2u);
  }

  v24[0] = v10;
  v24[1] = 3221225472;
  v24[2] = __41__GEOReferenceTimeManager__syncWithTimed__block_invoke;
  v24[3] = &unk_1E1C10908;
  v24[8] = v38;
  v24[9] = v37;
  *(double *)&v24[10] = v9;
  v24[4] = self;
  v24[5] = &v29;
  v24[6] = &v33;
  v24[7] = &v25;
  -[GEOReferenceTimeManager _kernBootTimeResult:](self, "_kernBootTimeResult:", v24);
  if (!*((_DWORD *)v34 + 6))
  {
LABEL_20:
    v16 = self->_attemptNum;
    self->_attemptNum = v16 + 1;
    if (2 * v16 <= 0x200)
    {
      self->_attemptNum = v16 + 2;
      v17 = 2 * (v16 + 1);
    }
    else
    {
      v17 = 512;
    }
    objc_initWeak(&location, self);
    v18 = dispatch_time(0, (uint64_t)((double)v17 * 1000000000.0));
    global_queue = geo_get_global_queue();
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __41__GEOReferenceTimeManager__syncWithTimed__block_invoke_75;
    block[3] = &unk_1E1BFF8B0;
    objc_copyWeak(&v22, &location);
    dispatch_after(v18, global_queue, block);

    GEOGetReferenceTimeManagerLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v17;
      _os_log_impl(&dword_1885A9000, v20, OS_LOG_TYPE_ERROR, "will try again in %llu seconds", (uint8_t *)&buf, 0xCu);
    }

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  -[GEOReferenceTimeManager _reportCoreAnalyticAtTime:success:error:attemptNo:](self, "_reportCoreAnalyticAtTime:success:error:attemptNo:", *((unsigned __int8 *)v30 + 24), *((unsigned __int8 *)v26 + 24), attemptNum, v9);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
}

void __41__GEOReferenceTimeManager__syncWithTimed__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  GEOReferenceTimeData *v5;
  void *global_queue;
  GEOReferenceTimeData *v7;
  NSObject *v8;
  uint8_t v9[16];
  uint64_t v10;
  uint64_t v11;
  intptr_t (*v12)(uint64_t);
  void *v13;
  uint64_t v14;
  GEOReferenceTimeData *v15;

  if (a4)
  {
    v5 = -[GEOReferenceTimeData initWithRefTime:refError:kernTime:bootTime:]([GEOReferenceTimeData alloc], "initWithRefTime:refError:kernTime:bootTime:", a2, a3, *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
    objc_msgSend(*(id *)(a1 + 32), "_persistBasisRefTimeData:", v5);
    global_queue = (void *)geo_get_global_queue();
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __41__GEOReferenceTimeManager__syncWithTimed__block_invoke_2;
    v13 = &unk_1E1C00738;
    v14 = *(_QWORD *)(a1 + 32);
    v15 = v5;
    v7 = v5;
    geo_isolate_async();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    GEOGetReferenceTimeManagerLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_ERROR, "couldn't get kern boot time", v9, 2u);
    }

    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
}

intptr_t __41__GEOReferenceTimeManager__syncWithTimed__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 1;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 24));
}

void __41__GEOReferenceTimeManager__syncWithTimed__block_invoke_75(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_syncWithTimed");

}

uint64_t __47__GEOReferenceTimeManager_referenceTimeResult___block_invoke_76(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startTimedSync");
}

- (BOOL)synchronized
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  geo_isolate_sync();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __39__GEOReferenceTimeManager_synchronized__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_synchronized");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSString)description
{
  _BOOL4 HasValue;
  double Double;
  _BOOL4 v5;
  int BOOL;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  HasValue = _GEOConfigHasValue(GeoServicesConfig_RefTimeOffset, (uint64_t)off_1EDF4E068);
  Double = GEOConfigGetDouble(GeoServicesConfig_RefTimeOffset, (uint64_t)off_1EDF4E068);
  v5 = _GEOConfigHasValue(GeoServicesConfig_RefTimeValid, (uint64_t)off_1EDF4E078);
  BOOL = GEOConfigGetBOOL(GeoServicesConfig_RefTimeValid, (uint64_t)off_1EDF4E078);
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__66;
  v28 = __Block_byref_object_dispose__66;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<GEOReferenceTimeManager(%p) :\n"), self);
  v29 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_synchronized)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend((id)v25[5], "stringByAppendingFormat:", CFSTR("synchronized : %@\n"), v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v25[5];
  v25[5] = v8;

  if (v5)
  {
    if (BOOL)
      v10 = CFSTR("YES");
    else
      v10 = CFSTR("NO");
    objc_msgSend((id)v25[5], "stringByAppendingFormat:", CFSTR("sync override : %@\n"), v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v25[5];
    v25[5] = v11;

  }
  if (HasValue)
  {
    objc_msgSend((id)v25[5], "stringByAppendingFormat:", CFSTR("sync offset applied : %f seconds\n"), *(_QWORD *)&Double);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v25[5];
    v25[5] = v13;

  }
  v15 = (void *)v25[5];
  geoTMGetKernelMonotonicClock();
  objc_msgSend(v15, "stringByAppendingFormat:", CFSTR("current kern monotonic time: %f\n"), v16);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v25[5];
  v25[5] = v17;

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __38__GEOReferenceTimeManager_description__block_invoke;
  v23[3] = &unk_1E1C10958;
  v23[4] = &v24;
  -[GEOReferenceTimeManager _kernBootTimeResult:](self, "_kernBootTimeResult:", v23);
  objc_msgSend((id)v25[5], "stringByAppendingFormat:", CFSTR("reference time data : %@>\n"), self->_refTimeData);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v25[5];
  v25[5] = v19;

  v21 = (id)v25[5];
  _Block_object_dispose(&v24, 8);

  return (NSString *)v21;
}

void __38__GEOReferenceTimeManager_description__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "stringByAppendingFormat:", CFSTR("current kern boot time: %ld.%d\n"), a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncSem, 0);
  objc_storeStrong((id *)&self->_iso, 0);
  objc_storeStrong((id *)&self->_refTimeData, 0);
}

@end
