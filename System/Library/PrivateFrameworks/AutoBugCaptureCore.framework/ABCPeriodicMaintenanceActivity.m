@implementation ABCPeriodicMaintenanceActivity

+ (void)registerPeriodicActivityWithIdentifier:(id)a3 queue:(id)a4 activity:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "sharedInstance");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_registerPeriodicActivityWithIdentifier:queue:activity:", v9, v8, v7);

}

+ (int64_t)periodicActivityInterval
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ABCPeriodicMaintenanceActivity.m"), 38, CFSTR("Subclasses must provide an impl for %s"), "+[ABCPeriodicMaintenanceActivity periodicActivityInterval]");

  return *MEMORY[0x1E0C807B8];
}

+ (const)periodicActivityID
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ABCPeriodicMaintenanceActivity.m"), 44, CFSTR("Subclasses must provide an impl for %s"), "+[ABCPeriodicMaintenanceActivity periodicActivityID]");

  return "";
}

+ (id)sharedInstance
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ABCPeriodicMaintenanceActivity.m"), 50, CFSTR("Subclasses must provide an impl for %s"), "+[ABCPeriodicMaintenanceActivity sharedInstance]");

  return 0;
}

- (ABCPeriodicMaintenanceActivity)init
{
  ABCPeriodicMaintenanceActivity *v2;
  NSMutableArray *v3;
  NSMutableArray *activities;
  ABCPeriodicMaintenanceActivity *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ABCPeriodicMaintenanceActivity;
  v2 = -[ABCPeriodicMaintenanceActivity init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    activities = v2->_activities;
    v2->_activities = v3;

    if (!v2->_activities)
    {
      v5 = 0;
      goto LABEL_6;
    }
    v2->_nextActivityIndex = 0;
    -[ABCPeriodicMaintenanceActivity _registerPeriodicMaintenanceActivity](v2, "_registerPeriodicMaintenanceActivity");
  }
  v5 = v2;
LABEL_6:

  return v5;
}

- (void)dealloc
{
  const char *v3;
  objc_super v4;

  v3 = (const char *)objc_msgSend((id)objc_opt_class(), "periodicActivityID");
  xpc_activity_unregister(v3);
  v4.receiver = self;
  v4.super_class = (Class)ABCPeriodicMaintenanceActivity;
  -[ABCPeriodicMaintenanceActivity dealloc](&v4, sel_dealloc);
}

- (void)_registerPeriodicMaintenanceActivity
{
  xpc_object_t v3;
  void *v4;
  const char *v5;
  int64_t v6;
  const char *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  _QWORD handler[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = xpc_dictionary_create(0, 0, 0);
  v4 = v3;
  if (v3)
  {
    xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80880]);
    xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C80898], 1);
    v5 = (const char *)*MEMORY[0x1E0C807A8];
    v6 = objc_msgSend((id)objc_opt_class(), "periodicActivityInterval");
    xpc_dictionary_set_int64(v4, v5, v6);
    v7 = (const char *)objc_msgSend((id)objc_opt_class(), "periodicActivityID");
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __70__ABCPeriodicMaintenanceActivity__registerPeriodicMaintenanceActivity__block_invoke;
    handler[3] = &unk_1EA3B6208;
    handler[4] = self;
    xpc_activity_register(v7, v4, handler);
  }
  else
  {
    symptomsLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = v10;
      v14 = 2080;
      v15 = objc_msgSend((id)objc_opt_class(), "periodicActivityID");
      _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to create xpc_activity criteria for %s", buf, 0x16u);

    }
  }

}

void __70__ABCPeriodicMaintenanceActivity__registerPeriodicMaintenanceActivity__block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  xpc_activity_state_t state;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (xpc_activity_get_state(v3) == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleActivityRun:", v3);
  }
  else
  {
    symptomsLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543618;
      v8 = v6;
      v9 = 2048;
      state = xpc_activity_get_state(v3);
      _os_log_impl(&dword_1DBAE1000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Unexpected xpc_activity state %lld, ignoring...", (uint8_t *)&v7, 0x16u);

    }
  }

}

- (void)_handleActivityRun:(id)a3
{
  _xpc_activity_s *v4;
  unint64_t nextActivityIndex;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  NSObject *v27;
  objc_class *v28;
  void *v29;
  NSObject *v30;
  objc_class *v31;
  void *v32;
  NSMutableArray *obj;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  unint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = (_xpc_activity_s *)a3;
  obj = self->_activities;
  objc_sync_enter(obj);
  nextActivityIndex = self->_nextActivityIndex;
  v6 = -[NSMutableArray count](self->_activities, "count");
  v7 = v6;
  if (nextActivityIndex >= v6)
  {
LABEL_13:
    objc_sync_exit(obj);

    symptomsLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v23;
      _os_log_impl(&dword_1DBAE1000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completed running periodic activity xpc_activity", buf, 0xCu);

    }
    if (!xpc_activity_set_state(v4, 5))
    {
      symptomsLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v35 = v26;
        _os_log_impl(&dword_1DBAE1000, v24, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to set periodic activity xpc_activity state to DONE!", buf, 0xCu);

      }
    }
    self->_nextActivityIndex = 0;
  }
  else
  {
    v8 = v6 - 1;
    while (1)
    {
      symptomsLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v11;
        v36 = 2048;
        v37 = nextActivityIndex;
        _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_DEBUG, "[%{public}@] Preparing to run periodic activity index %ld", buf, 0x16u);

      }
      -[NSMutableArray objectAtIndexedSubscript:](self->_activities, "objectAtIndexedSubscript:", nextActivityIndex);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      symptomsLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "activityIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v15;
        v36 = 2112;
        v37 = (unint64_t)v16;
        _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ready to run periodic activity %@", buf, 0x16u);

      }
      objc_msgSend(v12, "activityQueue");
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "activityBlock");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_async(v17, v18);

      v19 = nextActivityIndex + 1;
      v20 = v8 == nextActivityIndex ? 0 : nextActivityIndex + 1;
      self->_nextActivityIndex = v20;
      if (v19 < v7 && xpc_activity_should_defer(v4))
        break;

      ++nextActivityIndex;
      if (v7 == v19)
        goto LABEL_13;
    }
    symptomsLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v29;
      _os_log_impl(&dword_1DBAE1000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deferring periodic activity xpc_activity", buf, 0xCu);

    }
    if (!xpc_activity_set_state(v4, 3))
    {
      symptomsLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = (objc_class *)objc_opt_class();
        NSStringFromClass(v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v35 = v32;
        _os_log_impl(&dword_1DBAE1000, v30, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to set periodic activity xpc_activity state to DEFER!", buf, 0xCu);

      }
    }

    objc_sync_exit(obj);
  }

}

- (void)_registerPeriodicActivityWithIdentifier:(id)a3 queue:(id)a4 activity:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSMutableArray *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  NSMutableArray *activities;
  id v17;
  ABCMaintenanceActivity *v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  ABCPeriodicMaintenanceActivity *v26;
  _BYTE *v27;
  uint8_t v28[4];
  void *v29;
  __int16 v30;
  id v31;
  _BYTE buf[24];
  char v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v9 && v10 && objc_msgSend(v8, "length"))
  {
    v12 = self->_activities;
    objc_sync_enter(v12);
    symptomsLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v8;
      _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_INFO, "[%{public}@] Registering periodic activity %@", buf, 0x16u);

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v33 = 1;
    activities = self->_activities;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __89__ABCPeriodicMaintenanceActivity__registerPeriodicActivityWithIdentifier_queue_activity___block_invoke;
    v24[3] = &unk_1EA3B62F0;
    v17 = v8;
    v25 = v17;
    v26 = self;
    v27 = buf;
    -[NSMutableArray enumerateObjectsUsingBlock:](activities, "enumerateObjectsUsingBlock:", v24);
    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    {
      v18 = objc_alloc_init(ABCMaintenanceActivity);
      -[ABCMaintenanceActivity setActivityBlock:](v18, "setActivityBlock:", v11);
      -[ABCMaintenanceActivity setActivityQueue:](v18, "setActivityQueue:", v9);
      -[ABCMaintenanceActivity setActivityIdentifier:](v18, "setActivityIdentifier:", v17);
      -[NSMutableArray addObject:](self->_activities, "addObject:", v18);
      symptomsLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v28 = 138543618;
        v29 = v21;
        v30 = 2112;
        v31 = v17;
        _os_log_impl(&dword_1DBAE1000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Registered periodic activity %@", v28, 0x16u);

      }
    }

    _Block_object_dispose(buf, 8);
    objc_sync_exit(v12);
  }
  else
  {
    symptomsLogHandle();
    v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v12->super.super, OS_LOG_TYPE_ERROR))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v23;
      _os_log_impl(&dword_1DBAE1000, &v12->super.super, OS_LOG_TYPE_ERROR, "[%{public}@] Registering a periodic activity requires a valid block, queue, and identifier", buf, 0xCu);

    }
  }

}

void __89__ABCPeriodicMaintenanceActivity__registerPeriodicActivityWithIdentifier_queue_activity___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "activityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    symptomsLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 32);
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_INFO, "[%{public}@] A periodic activity already exists for identifier %@. Skipping registration", (uint8_t *)&v12, 0x16u);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activities, 0);
}

@end
