@implementation MBCellularDataSubscriptionMonitor

- (MBCellularDataSubscriptionMonitor)initWithQueue:(id)a3 timeout:(unint64_t)a4
{
  id v6;
  MBCellularDataSubscriptionMonitor *v7;
  MBCellularDataSubscriptionMonitor *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MBCellularDataSubscriptionMonitor;
  v7 = -[MBCellularDataSubscriptionMonitor init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[MBCellularDataSubscriptionMonitor setQueue:](v7, "setQueue:", v6);
    -[MBCellularDataSubscriptionMonitor setTimeout:](v8, "setTimeout:", a4);
  }

  return v8;
}

- (MBCellularDataSubscriptionMonitor)initWithTimeout:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  objc_class *v7;
  const char *Name;
  dispatch_queue_t v9;
  MBCellularDataSubscriptionMonitor *v10;
  MBCellularDataSubscriptionMonitor *v11;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_UTILITY, 0);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = (objc_class *)objc_opt_class();
  Name = class_getName(v7);
  v9 = dispatch_queue_create(Name, v6);
  v10 = -[MBCellularDataSubscriptionMonitor initWithQueue:timeout:](self, "initWithQueue:timeout:", v9, a3);
  v11 = v10;
  if (v10)
  {
    -[MBCellularDataSubscriptionMonitor setBackupOnCellularSupport:](v10, "setBackupOnCellularSupport:", 0);
    -[MBCellularDataSubscriptionMonitor setCellularRadioType:](v11, "setCellularRadioType:", 0);
  }

  return v11;
}

- (unint64_t)_backupOnCellularSupportWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __CFString *v18;
  __CFString *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  id v29;
  void *v30;
  char isKindOfClass;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __CFString *v47;
  void *v48;
  int v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  __CFString *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  char v71;
  NSObject *v72;
  NSObject *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  int v93;
  int v94;
  int v95;
  uint64_t v96;
  NSObject *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  __CFString *v111;
  id v112;
  id v113;
  __CFString *v114;
  id v115;
  uint8_t buf[4];
  const __CFString *v117;
  __int16 v118;
  _BYTE v119[10];
  __int16 v120;
  unint64_t v121;
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  if (!a3)
    -[MBCellularDataSubscriptionMonitor _backupOnCellularSupportWithError:].cold.1();
  -[MBCellularDataSubscriptionMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  *a3 = 0;
  -[MBCellularDataSubscriptionMonitor telephonyClient](self, "telephonyClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v115 = 0;
    objc_msgSend(v6, "getCurrentDataSubscriptionContextSync:", &v115);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v9 = (__CFString *)v115;
    MBGetDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v8)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v117 = v9;
        _os_log_impl(&dword_1D5213000, v11, OS_LOG_TYPE_ERROR, "Failed to fetch the data subscription context: %@", buf, 0xCu);
        _MBLog(CFSTR("ERROR"), (uint64_t)"Failed to fetch the data subscription context: %@", v41, v42, v43, v44, v45, v46, (uint64_t)v9);
      }

      v47 = objc_retainAutorelease(v9);
      v40 = 0;
      *a3 = v47;
      goto LABEL_66;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v117 = v8;
      _os_log_impl(&dword_1D5213000, v11, OS_LOG_TYPE_INFO, "Fetched the data subscription context: %@", buf, 0xCu);
      _MBLog(CFSTR("INFO"), (uint64_t)"Fetched the data subscription context: %@", v12, v13, v14, v15, v16, v17, (uint64_t)v8);
    }

    v114 = v9;
    objc_msgSend(v7, "getSupports5G:error:", v8, &v114);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v19 = v114;

    if (v18)
    {
      MBGetDefaultLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v117 = v18;
        _os_log_impl(&dword_1D5213000, v20, OS_LOG_TYPE_DEBUG, "Fetched device&carrier 5G support: %{public}@", buf, 0xCu);
        _MBLog(CFSTR("DEBUG"), (uint64_t)"Fetched device&carrier 5G support: %{public}@", v21, v22, v23, v24, v25, v26, (uint64_t)v18);
      }

      if (!-[__CFString BOOLValue](v18, "BOOLValue"))
      {
        v40 = 0;
        goto LABEL_54;
      }
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6D00]), "initWithBundleType:", 1);

      v113 = 0;
      v28 = objc_msgSend(v7, "copyCarrierBundleValueWithDefault:key:bundleType:error:", v8, CFSTR("EnableBackupOnCellular"), v27, &v113);
      v29 = v113;
      v30 = v29;
      if (v28)
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        MBGetDefaultLog();
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = v32;
        if ((isKindOfClass & 1) != 0)
        {
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v117 = CFSTR("EnableBackupOnCellular");
            v118 = 2114;
            *(_QWORD *)v119 = v28;
            _os_log_impl(&dword_1D5213000, v33, OS_LOG_TYPE_DEFAULT, "Fetched \"%{public}@\" carrier bundle key: %{public}@", buf, 0x16u);
            _MBLog(CFSTR("DEFAULT"), (uint64_t)"Fetched \"%{public}@\" carrier bundle key: %{public}@", v34, v35, v36, v37, v38, v39, (uint64_t)CFSTR("EnableBackupOnCellular"));
          }

          if ((-[NSObject BOOLValue](v28, "BOOLValue") & 1) == 0)
          {
            v40 = 0;
            goto LABEL_38;
          }
LABEL_37:
          v40 = 2;
LABEL_38:

          v112 = 0;
          v70 = objc_msgSend(v7, "copyCarrierBundleValueWithDefault:key:bundleType:error:", v8, CFSTR("EnableRestoreOnCellular"), v27, &v112);
          v19 = (__CFString *)v112;

          if (v70)
          {
            objc_opt_class();
            v71 = objc_opt_isKindOfClass();
            MBGetDefaultLog();
            v72 = objc_claimAutoreleasedReturnValue();
            v73 = v72;
            if ((v71 & 1) != 0)
            {
              if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                v117 = CFSTR("EnableRestoreOnCellular");
                v118 = 2114;
                *(_QWORD *)v119 = v70;
                _os_log_impl(&dword_1D5213000, v73, OS_LOG_TYPE_DEFAULT, "Fetched \"%{public}@\" carrier bundle key: %{public}@", buf, 0x16u);
                _MBLog(CFSTR("DEFAULT"), (uint64_t)"Fetched \"%{public}@\" carrier bundle key: %{public}@", v74, v75, v76, v77, v78, v79, (uint64_t)CFSTR("EnableRestoreOnCellular"));
              }

              if ((-[NSObject BOOLValue](v70, "BOOLValue") & 1) == 0)
                goto LABEL_53;
              goto LABEL_52;
            }
            if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v117 = CFSTR("EnableRestoreOnCellular");
              v118 = 2114;
              *(_QWORD *)v119 = v70;
              _os_log_impl(&dword_1D5213000, v73, OS_LOG_TYPE_ERROR, "Invalid value for \"%{public}@\" carrier bundle key: %{public}@", buf, 0x16u);
              _MBLog(CFSTR("ERROR"), (uint64_t)"Invalid value for \"%{public}@\" carrier bundle key: %{public}@", v86, v87, v88, v89, v90, v91, (uint64_t)CFSTR("EnableRestoreOnCellular"));
            }

          }
          else
          {
            if (!v19)
            {
LABEL_51:
              v70 = 0;
LABEL_52:
              v40 |= 4uLL;
LABEL_53:

LABEL_54:
              v111 = v19;
              objc_msgSend(v7, "getDataStatus:error:", v8, &v111);
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = v111;

              if (!v92)
              {
                MBGetDefaultLog();
                v97 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v117 = v47;
                  _os_log_impl(&dword_1D5213000, v97, OS_LOG_TYPE_ERROR, "Failed to fetch data status: %@", buf, 0xCu);
                  _MBLog(CFSTR("ERROR"), (uint64_t)"Failed to fetch data status: %@", v98, v99, v100, v101, v102, v103, (uint64_t)v47);
                }
                goto LABEL_64;
              }
              v93 = objc_msgSend(v92, "newRadioCoverage");
              v94 = objc_msgSend(v92, "radioTechnology");
              v95 = v94;
              if ((v93 & 1) != 0)
              {
                v96 = 2;
              }
              else
              {
                if (v94 != 7)
                  goto LABEL_62;
                v96 = 1;
              }
              -[MBCellularDataSubscriptionMonitor setCellularRadioType:](self, "setCellularRadioType:", v96);
              v40 |= 1uLL;
LABEL_62:
              MBGetDefaultLog();
              v97 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138544130;
                v117 = v18;
                v118 = 1024;
                *(_DWORD *)v119 = v93;
                *(_WORD *)&v119[4] = 1024;
                *(_DWORD *)&v119[6] = v95;
                v120 = 2048;
                v121 = v40;
                _os_log_impl(&dword_1D5213000, v97, OS_LOG_TYPE_INFO, "Fetched data status, supports5G:%{public}@, newRadioCoverage:%d, radioTechnology:%d, result:0x%lx", buf, 0x22u);
                _MBLog(CFSTR("INFO"), (uint64_t)"Fetched data status, supports5G:%{public}@, newRadioCoverage:%d, radioTechnology:%d, result:0x%lx", v104, v105, v106, v107, v108, v109, (uint64_t)v18);
              }
LABEL_64:

              goto LABEL_65;
            }
            MBGetDefaultLog();
            v70 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v117 = CFSTR("EnableRestoreOnCellular");
              v118 = 2112;
              *(_QWORD *)v119 = v19;
              _os_log_impl(&dword_1D5213000, v70, OS_LOG_TYPE_ERROR, "Failed to fetch \"%{public}@\" carrier bundle key: %@", buf, 0x16u);
              _MBLog(CFSTR("ERROR"), (uint64_t)"Failed to fetch \"%{public}@\" carrier bundle key: %@", v80, v81, v82, v83, v84, v85, (uint64_t)CFSTR("EnableRestoreOnCellular"));
            }
          }

          goto LABEL_51;
        }
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v117 = CFSTR("EnableBackupOnCellular");
          v118 = 2114;
          *(_QWORD *)v119 = v28;
          _os_log_impl(&dword_1D5213000, v33, OS_LOG_TYPE_ERROR, "Invalid value for \"%{public}@\" carrier bundle key: %{public}@", buf, 0x16u);
          _MBLog(CFSTR("ERROR"), (uint64_t)"Invalid value for \"%{public}@\" carrier bundle key: %{public}@", v64, v65, v66, v67, v68, v69, (uint64_t)CFSTR("EnableBackupOnCellular"));
        }

      }
      else
      {
        if (!v29)
        {
LABEL_36:
          v28 = 0;
          goto LABEL_37;
        }
        MBGetDefaultLog();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v117 = CFSTR("EnableBackupOnCellular");
          v118 = 2112;
          *(_QWORD *)v119 = v30;
          _os_log_impl(&dword_1D5213000, v28, OS_LOG_TYPE_ERROR, "Failed to fetch \"%{public}@\" carrier bundle key: %@", buf, 0x16u);
          _MBLog(CFSTR("ERROR"), (uint64_t)"Failed to fetch \"%{public}@\" carrier bundle key: %@", v58, v59, v60, v61, v62, v63, (uint64_t)CFSTR("EnableBackupOnCellular"));
        }
      }

      goto LABEL_36;
    }
    if (-[__CFString code](v19, "code") == 45
      && (-[__CFString domain](v19, "domain"),
          v48 = (void *)objc_claimAutoreleasedReturnValue(),
          v49 = objc_msgSend(v48, "isEqualToString:", *MEMORY[0x1E0CB2FE0]),
          v48,
          v49))
    {
      MBGetDefaultLog();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v117 = v19;
        _os_log_impl(&dword_1D5213000, v50, OS_LOG_TYPE_INFO, "Failed to check for device&carrier 5G support: %@", buf, 0xCu);
        v57 = CFSTR("INFO");
LABEL_27:
        _MBLog(v57, (uint64_t)"Failed to check for device&carrier 5G support: %@", v51, v52, v53, v54, v55, v56, (uint64_t)v19);
      }
    }
    else
    {
      MBGetDefaultLog();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v117 = v19;
        _os_log_impl(&dword_1D5213000, v50, OS_LOG_TYPE_ERROR, "Failed to check for device&carrier 5G support: %@", buf, 0xCu);
        v57 = CFSTR("ERROR");
        goto LABEL_27;
      }
    }

    v47 = objc_retainAutorelease(v19);
    v40 = 0;
    *a3 = v47;
LABEL_65:

LABEL_66:
    goto LABEL_67;
  }
  +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("nil CoreTelephonyClient"));
  v40 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_67:

  return v40;
}

- (BOOL)_startDelegateTimerWithTimeout:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD handler[4];
  id v18;
  id location;
  uint8_t buf[4];
  unint64_t v21;
  __int16 v22;
  NSObject *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[MBCellularDataSubscriptionMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[MBCellularDataSubscriptionMonitor _cancelDelegateTimer](self, "_cancelDelegateTimer");
  if (a3)
  {
    objc_initWeak(&location, self);
    -[MBCellularDataSubscriptionMonitor queue](self, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v6);

    v8 = dispatch_walltime(0, 1000000000 * a3);
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __68__MBCellularDataSubscriptionMonitor__startDelegateTimerWithTimeout___block_invoke;
    handler[3] = &unk_1E995D3A0;
    objc_copyWeak(&v18, &location);
    dispatch_source_set_event_handler(v7, handler);
    -[MBCellularDataSubscriptionMonitor setDelegateTimer:](self, "setDelegateTimer:", v7);
    MBGetDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      v21 = a3;
      v22 = 2048;
      v23 = v7;
      _os_log_impl(&dword_1D5213000, v9, OS_LOG_TYPE_DEBUG, "Starting CoreTelephonyClientDataDelegate timer (%llds): %p", buf, 0x16u);
      _MBLog(CFSTR("DEBUG"), (uint64_t)"Starting CoreTelephonyClientDataDelegate timer (%llds): %p", v10, v11, v12, v13, v14, v15, a3);
    }

    dispatch_resume(v7);
    objc_destroyWeak(&v18);

    objc_destroyWeak(&location);
  }
  return a3 != 0;
}

void __68__MBCellularDataSubscriptionMonitor__startDelegateTimerWithTimeout___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    MBGetDefaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v11 = objc_opt_class();
      _os_log_impl(&dword_1D5213000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ timer fired", buf, 0xCu);
      v3 = objc_opt_class();
      _MBLog(CFSTR("DEFAULT"), (uint64_t)"%{public}@ timer fired", v4, v5, v6, v7, v8, v9, v3);
    }

    objc_msgSend(WeakRetained, "_cancelDelegateTimer");
    objc_msgSend(WeakRetained, "_refreshBackupOnCellularSupportWithTimeout:", 0);
  }

}

- (void)_cancelDelegateTimer
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t buf[4];
  NSObject *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[MBCellularDataSubscriptionMonitor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[MBCellularDataSubscriptionMonitor delegateTimer](self, "delegateTimer");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[MBCellularDataSubscriptionMonitor setDelegateTimer:](self, "setDelegateTimer:", 0);
    MBGetDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v13 = v4;
      _os_log_impl(&dword_1D5213000, v5, OS_LOG_TYPE_DEBUG, "Canceling CoreTelephonyClientDataDelegate timer: %p", buf, 0xCu);
      _MBLog(CFSTR("DEBUG"), (uint64_t)"Canceling CoreTelephonyClientDataDelegate timer: %p", v6, v7, v8, v9, v10, v11, (uint64_t)v4);
    }

    dispatch_source_cancel(v4);
  }

}

- (void)_refreshBackupOnCellularSupportWithTimeout:(unint64_t)a3
{
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  NSObject *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[MBCellularDataSubscriptionMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v22 = 0;
  v6 = -[MBCellularDataSubscriptionMonitor _backupOnCellularSupportWithError:](self, "_backupOnCellularSupportWithError:", &v22);
  v7 = v22;
  if (objc_msgSend(v7, "code") == 35
    && (objc_msgSend(v7, "domain"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB2FE0]),
        v8,
        v9))
  {
    if (!-[MBCellularDataSubscriptionMonitor _startDelegateTimerWithTimeout:](self, "_startDelegateTimerWithTimeout:", a3))
    {
      self->_backupOnCellularSupportChanged = 0;
      -[MBCellularDataSubscriptionMonitor backupOnCellularSupportHandler](self, "backupOnCellularSupportHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[MBCellularDataSubscriptionMonitor backupOnCellularSupportHandler](self, "backupOnCellularSupportHandler");
        v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 17, CFSTR("Failed to fetch backupOnCellularSupport"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, uint64_t, void *))v11)[2](v11, v6, v12);

LABEL_12:
      }
    }
  }
  else if (!self->_backupOnCellularSupportChanged
         || v6 != -[MBCellularDataSubscriptionMonitor backupOnCellularSupport](self, "backupOnCellularSupport"))
  {
    MBGetDefaultLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = -[MBCellularDataSubscriptionMonitor backupOnCellularSupport](self, "backupOnCellularSupport");
      *(_DWORD *)buf = 134218240;
      v24 = v6;
      v25 = 2048;
      v26 = v14;
      _os_log_impl(&dword_1D5213000, v13, OS_LOG_TYPE_DEFAULT, "backupOnCellularSupport changed: %ld(%ld)", buf, 0x16u);
      -[MBCellularDataSubscriptionMonitor backupOnCellularSupport](self, "backupOnCellularSupport");
      _MBLog(CFSTR("DEFAULT"), (uint64_t)"backupOnCellularSupport changed: %ld(%ld)", v15, v16, v17, v18, v19, v20, v6);
    }

    self->_backupOnCellularSupportChanged = 1;
    -[MBCellularDataSubscriptionMonitor setBackupOnCellularSupport:](self, "setBackupOnCellularSupport:", v6);
    -[MBCellularDataSubscriptionMonitor backupOnCellularSupportHandler](self, "backupOnCellularSupportHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      -[MBCellularDataSubscriptionMonitor backupOnCellularSupportHandler](self, "backupOnCellularSupportHandler");
      v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v11[2](v11, v6, 0);
      goto LABEL_12;
    }
  }

}

- (void)start
{
  __assert_rtn("-[MBCellularDataSubscriptionMonitor start]", "MBCellularDataSubscriptionMonitor.m", 205, "self.backupOnCellularSupport == MBBackupOnCellularSupportNone");
}

uint64_t __42__MBCellularDataSubscriptionMonitor_start__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc(MEMORY[0x1E0CA6E38]);
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithQueue:", v3);
  objc_msgSend(*(id *)(a1 + 32), "setTelephonyClient:", v4);

  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "telephonyClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", v5);

  return objc_msgSend(*(id *)(a1 + 32), "_refreshBackupOnCellularSupportWithTimeout:", objc_msgSend(*(id *)(a1 + 32), "timeout"));
}

- (void)cancel
{
  NSObject *v3;
  _QWORD block[5];

  -[MBCellularDataSubscriptionMonitor setTelephonyClient:](self, "setTelephonyClient:", 0);
  -[MBCellularDataSubscriptionMonitor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__MBCellularDataSubscriptionMonitor_cancel__block_invoke;
  block[3] = &unk_1E995CE70;
  block[4] = self;
  dispatch_async(v3, block);

}

void __43__MBCellularDataSubscriptionMonitor_cancel__block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD, _QWORD);
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_cancelDelegateTimer");
  objc_msgSend(*(id *)(a1 + 32), "backupOnCellularSupportHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "backupOnCellularSupportHandler");
    v3 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 202, CFSTR("Cancelled"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v3)[2](v3, 0, v4);

    objc_msgSend(*(id *)(a1 + 32), "setBackupOnCellularSupportHandler:", 0);
  }
}

- (void)currentDataSimChanged:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MBCellularDataSubscriptionMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  MBGetDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v4;
    _os_log_impl(&dword_1D5213000, v6, OS_LOG_TYPE_DEFAULT, "currentDataSimChanged: %@", buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), (uint64_t)"currentDataSimChanged: %@", v7, v8, v9, v10, v11, v12, (uint64_t)v4);
  }

  -[MBCellularDataSubscriptionMonitor _refreshBackupOnCellularSupportWithTimeout:](self, "_refreshBackupOnCellularSupportWithTimeout:", 0);
}

- (void)dataSettingsChanged:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  MBGetDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v3;
    _os_log_impl(&dword_1D5213000, v4, OS_LOG_TYPE_DEFAULT, "dataSettingsChanged: %@", buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), (uint64_t)"dataSettingsChanged: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  }

}

- (void)internetDataStatus:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MBCellularDataSubscriptionMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  MBGetDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v4;
    _os_log_impl(&dword_1D5213000, v6, OS_LOG_TYPE_DEFAULT, "internetDataStatus: %@", buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), (uint64_t)"internetDataStatus: %@", v7, v8, v9, v10, v11, v12, (uint64_t)v4);
  }

  -[MBCellularDataSubscriptionMonitor _refreshBackupOnCellularSupportWithTimeout:](self, "_refreshBackupOnCellularSupportWithTimeout:", 0);
}

- (unint64_t)backupOnCellularSupport
{
  return self->_backupOnCellularSupport;
}

- (void)setBackupOnCellularSupport:(unint64_t)a3
{
  self->_backupOnCellularSupport = a3;
}

- (int)cellularRadioType
{
  return self->_cellularRadioType;
}

- (void)setCellularRadioType:(int)a3
{
  self->_cellularRadioType = a3;
}

- (id)backupOnCellularSupportHandler
{
  return self->_backupOnCellularSupportHandler;
}

- (void)setBackupOnCellularSupportHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_source)delegateTimer
{
  return self->_delegateTimer;
}

- (void)setDelegateTimer:(id)a3
{
  objc_storeStrong((id *)&self->_delegateTimer, a3);
}

- (CoreTelephonyClient)telephonyClient
{
  return (CoreTelephonyClient *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTelephonyClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (unint64_t)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(unint64_t)a3
{
  self->_timeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_delegateTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_backupOnCellularSupportHandler, 0);
}

- (void)_backupOnCellularSupportWithError:.cold.1()
{
  __assert_rtn("-[MBCellularDataSubscriptionMonitor _backupOnCellularSupportWithError:]", "MBCellularDataSubscriptionMonitor.m", 58, "error");
}

@end
