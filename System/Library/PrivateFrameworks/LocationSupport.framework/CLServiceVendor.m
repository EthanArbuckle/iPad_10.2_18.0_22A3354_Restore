@implementation CLServiceVendor

+ (CLServiceVendor)sharedInstance
{
  if (qword_1ECE24D38 != -1)
    dispatch_once(&qword_1ECE24D38, &unk_1E45FBE70);
  return (CLServiceVendor *)(id)qword_1ECE24D30;
}

- (CLServiceVendor)init
{
  CLServiceVendor *v2;
  uint64_t v3;
  NSMutableDictionary *catalog;
  uint64_t v5;
  NSMutableSet *unavailableServiceNames;
  CLServiceVendor *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLServiceVendor;
  v2 = -[CLServiceVendor init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    catalog = v2->_catalog;
    v2->_catalog = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    unavailableServiceNames = v2->_unavailableServiceNames;
    v2->_unavailableServiceNames = (NSMutableSet *)v5;

    v7 = v2;
  }

  return v2;
}

- (void)intendToSyncServiceWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _DWORD v8[2];
  __int16 v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (+[CLAutoCohortUtilities autoCohortingEnabled](CLAutoCohortUtilities, "autoCohortingEnabled"))
  {
    if (-[CLServiceVendor isServiceEnabled:](self, "isServiceEnabled:", v4)
      && (-[CLServiceVendor getServiceWithName:](self, "getServiceWithName:", v4),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v5, "silo"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v5,
          v6))
    {
      objc_msgSend(v6, "intendToSync");
    }
    else
    {
      if (qword_1ECE24CB0 != -1)
        dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
      v7 = qword_1ECE24CA8;
      if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_DEBUG))
      {
        v8[0] = 68289282;
        v8[1] = 0;
        v9 = 2082;
        v10 = &unk_1A1A18FAF;
        v11 = 2114;
        v12 = v4;
        _os_log_impl(&dword_1A19F4000, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#Cohorting Cannot deduce toSilo\", \"serviceName\":%{public, location:escape_only}@}", (uint8_t *)v8, 0x1Cu);
      }
      v6 = 0;
    }

  }
}

- (id)proxyForService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[CLServiceVendor getServiceWithName:](self, "getServiceWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "silo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CLIntersiloProxy proxyForRecipientObject:inSilo:recipientName:](CLIntersiloProxy, "proxyForRecipientObject:inSilo:recipientName:", v6, v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)getServiceWithName:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  void *v11;
  NSObject *v12;
  BOOL v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  _QWORD v26[4];
  id v27;
  CLServiceVendor *v28;
  id v29;
  uint64_t *v30;
  uint8_t *v31;
  id v32;
  BOOL v33;
  id v34;
  id v35;
  _QWORD block[5];
  id v37;
  uint8_t *v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  id v57;
  __int16 v58;
  uint64_t v59;
  uint8_t buf[8];
  _BYTE v61[24];
  void (*v62)(uint64_t);
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "containsString:", CFSTR("Test")) & 1) != 0
    || objc_msgSend(v4, "containsString:", CFSTR("Mock")))
  {
    if (qword_1ECE24CB0 != -1)
      dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
    v5 = qword_1ECE24CA8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_FAULT))
    {
      *(_QWORD *)buf = 68289282;
      *(_WORD *)v61 = 2082;
      *(_QWORD *)&v61[2] = &unk_1A1A18FAF;
      *(_WORD *)&v61[10] = 2114;
      *(_QWORD *)&v61[12] = v4;
      _os_log_impl(&dword_1A19F4000, v5, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Test and Mock services may only be looked up indirectly via -setServiceReplacementMap:\", \"RequestedServiceName\":%{public, location:escape_only}@}", buf, 0x1Cu);
      if (qword_1ECE24CB0 != -1)
        dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
    }
    v6 = qword_1ECE24CA8;
    if (os_signpost_enabled((os_log_t)qword_1ECE24CA8))
    {
      *(_QWORD *)buf = 68289282;
      *(_WORD *)v61 = 2082;
      *(_QWORD *)&v61[2] = &unk_1A1A18FAF;
      *(_WORD *)&v61[10] = 2114;
      *(_QWORD *)&v61[12] = v4;
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Test and Mock services may only be looked up indirectly via -setServiceReplacementMap:", "{\"msg%{public}.0s\":\"Test and Mock services may only be looked up indirectly via -setServiceReplacementMap:\", \"RequestedServiceName\":%{public, location:escape_only}@}", buf, 0x1Cu);
    }
    v7 = 0;
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)v61 = buf;
    *(_QWORD *)&v61[8] = 0x3032000000;
    *(_QWORD *)&v61[16] = sub_1A1A02A3C;
    v62 = sub_1A1A02A04;
    v63 = 0;
    v47 = 0;
    v48 = &v47;
    v49 = 0x3032000000;
    v50 = sub_1A1A02A3C;
    v51 = sub_1A1A02A04;
    v52 = v4;
    v41 = 0;
    v42 = &v41;
    v43 = 0x3032000000;
    v44 = sub_1A1A02A3C;
    v45 = sub_1A1A02A04;
    v46 = 0;
    v8 = MEMORY[0x1E0C809B0];
    v9 = qword_1ECE24D08;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1A1A00424;
    block[3] = &unk_1E45FBDB0;
    block[4] = self;
    v10 = v52;
    v37 = v10;
    v38 = buf;
    v39 = &v47;
    v40 = &v41;
    dispatch_sync(v9, block);
    v11 = *(void **)(*(_QWORD *)v61 + 40);
    if (v11)
    {
      v7 = v11;
    }
    else if (v48[5])
    {
      if (qword_1ECE24CB0 != -1)
        dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
      v12 = qword_1ECE24CA8;
      if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_DEBUG))
      {
        v53 = 68289282;
        v54 = 2082;
        v55 = &unk_1A1A18FAF;
        v56 = 2114;
        v57 = v10;
        _os_log_impl(&dword_1A19F4000, v12, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"Looking up service identified by name\", \"ServiceName\":%{public, location:escape_only}@}", (uint8_t *)&v53, 0x1Cu);
      }
      v34 = 0;
      v35 = 0;
      v13 = sub_1A19F5AF8(&v35, &v34, (void *)v48[5]);
      v14 = v34;
      v15 = v35;
      if (v35)
      {
        v16 = qword_1ECE24D08;
        v26[0] = v8;
        v26[1] = 3221225472;
        v26[2] = sub_1A1A15344;
        v26[3] = &unk_1E45FBE00;
        v33 = v13;
        v27 = v10;
        v28 = self;
        v30 = &v47;
        v31 = buf;
        v32 = v15;
        v29 = v14;
        dispatch_barrier_sync(v16, v26);
        v7 = *(id *)(*(_QWORD *)v61 + 40);

      }
      else
      {
        if (qword_1ECE24CB0 != -1)
          dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
        v21 = qword_1ECE24CA8;
        if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_FAULT))
        {
          v22 = v48[5];
          v53 = 68289538;
          v54 = 2082;
          v55 = &unk_1A1A18FAF;
          v56 = 2114;
          v57 = v10;
          v58 = 2114;
          v59 = v22;
          _os_log_impl(&dword_1A19F4000, v21, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Tried to look up a service by name that doesn't exist\", \"RequestedServiceName\":%{public, location:escape_only}@, \"EffectiveServiceName\":%{public, location:escape_only}@}", (uint8_t *)&v53, 0x26u);
          if (qword_1ECE24CB0 != -1)
            dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
        }
        v23 = qword_1ECE24CA8;
        if (os_signpost_enabled((os_log_t)qword_1ECE24CA8))
        {
          v24 = v48[5];
          v53 = 68289538;
          v54 = 2082;
          v55 = &unk_1A1A18FAF;
          v56 = 2114;
          v57 = v10;
          v58 = 2114;
          v59 = v24;
          _os_signpost_emit_with_name_impl(&dword_1A19F4000, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Tried to look up a service by name that doesn't exist", "{\"msg%{public}.0s\":\"Tried to look up a service by name that doesn't exist\", \"RequestedServiceName\":%{public, location:escape_only}@, \"EffectiveServiceName\":%{public, location:escape_only}@}", (uint8_t *)&v53, 0x26u);
        }
        v7 = 0;
      }

    }
    else
    {
      if (qword_1ECE24CB0 != -1)
        dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
      v17 = qword_1ECE24CA8;
      if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_FAULT))
      {
        v18 = v42[5];
        v53 = 68289538;
        v54 = 2082;
        v55 = &unk_1A1A18FAF;
        v56 = 2114;
        v57 = v10;
        v58 = 2114;
        v59 = v18;
        _os_log_impl(&dword_1A19F4000, v17, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Service replacement map does not include requested service\", \"RequestedServiceName\":%{public, location:escape_only}@, \"ReplacementMap\":%{public, location:escape_only}@}", (uint8_t *)&v53, 0x26u);
        if (qword_1ECE24CB0 != -1)
          dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
      }
      v19 = qword_1ECE24CA8;
      if (os_signpost_enabled((os_log_t)qword_1ECE24CA8))
      {
        v20 = v42[5];
        v53 = 68289538;
        v54 = 2082;
        v55 = &unk_1A1A18FAF;
        v56 = 2114;
        v57 = v10;
        v58 = 2114;
        v59 = v20;
        _os_signpost_emit_with_name_impl(&dword_1A19F4000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Service replacement map does not include requested service", "{\"msg%{public}.0s\":\"Service replacement map does not include requested service\", \"RequestedServiceName\":%{public, location:escape_only}@, \"ReplacementMap\":%{public, location:escape_only}@}", (uint8_t *)&v53, 0x26u);
      }
      v7 = 0;
    }

    _Block_object_dispose(&v41, 8);
    _Block_object_dispose(&v47, 8);

    _Block_object_dispose(buf, 8);
  }

  return v7;
}

+ (void)initialize
{
  if (qword_1ECE24CE8 != -1)
    dispatch_once(&qword_1ECE24CE8, &unk_1E45FBD20);
}

+ (void)rereadConfiguration:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  char v9;
  _QWORD v10[5];
  char v11;
  char v12;
  char v13;

  v3 = a3;
  +[CLSettingsDictionary settingsWithDictionary:](CLSettingsDictionary, "settingsWithDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleForKey:defaultValue:", CFSTR("CLServiceVendor.HeartbeatCheckInterval"), 60.0);
  v6 = v5;
  v7 = objc_msgSend(v4, "BOOLForKey:defaultValue:", CFSTR("HeartAttackStackshot"), 0);
  v8 = objc_msgSend(v4, "BOOLForKey:defaultValue:", CFSTR("IsInternalInstall"), 0);
  v9 = objc_msgSend(v4, "BOOLForKey:defaultValue:", CFSTR("IsLocationServicesEnabled"), 0);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1A1A13B88;
  v10[3] = &unk_1E45FBD60;
  v11 = v7;
  v10[4] = v6;
  v12 = v8;
  v13 = v9;
  dispatch_barrier_async((dispatch_queue_t)qword_1ECE24D08, v10);

}

- (void)enableTimeCoercion
{
  NSMutableSet *v3;
  NSMutableSet *timeCoercibleSilos;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableDictionary count](self->_catalog, "count"))
  {
    sub_1A1A12B58();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v11 = 0;
      v12 = 2082;
      v13 = &unk_1A1A18FAF;
      v14 = 2082;
      v15 = "assert";
      v16 = 2081;
      v17 = "0 == [_catalog count]";
      _os_log_impl(&dword_1A19F4000, v5, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Enabling Time Coercion must be done before any services are started\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_1A1A12B58();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v6))
    {
      *(_DWORD *)buf = 68289539;
      v11 = 0;
      v12 = 2082;
      v13 = &unk_1A1A18FAF;
      v14 = 2082;
      v15 = "assert";
      v16 = 2081;
      v17 = "0 == [_catalog count]";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Enabling Time Coercion must be done before any services are started", "{\"msg%{public}.0s\":\"Enabling Time Coercion must be done before any services are started\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_1A1A12B58();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v11 = 0;
      v12 = 2082;
      v13 = &unk_1A1A18FAF;
      v14 = 2082;
      v15 = "assert";
      v16 = 2081;
      v17 = "0 == [_catalog count]";
      _os_log_impl(&dword_1A19F4000, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Enabling Time Coercion must be done before any services are started\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
LABEL_17:

    abort_report_np();
  }
  if (self->_timeCoercibleSilos)
  {
    sub_1A1A12B58();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v11 = 0;
      v12 = 2082;
      v13 = &unk_1A1A18FAF;
      v14 = 2082;
      v15 = "assert";
      v16 = 2081;
      v17 = "!_timeCoercibleSilos";
      _os_log_impl(&dword_1A19F4000, v8, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Only enable Time Coercion once, eh?\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_1A1A12B58();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      *(_DWORD *)buf = 68289539;
      v11 = 0;
      v12 = 2082;
      v13 = &unk_1A1A18FAF;
      v14 = 2082;
      v15 = "assert";
      v16 = 2081;
      v17 = "!_timeCoercibleSilos";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Only enable Time Coercion once, eh?", "{\"msg%{public}.0s\":\"Only enable Time Coercion once, eh?\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_1A1A12B58();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v11 = 0;
      v12 = 2082;
      v13 = &unk_1A1A18FAF;
      v14 = 2082;
      v15 = "assert";
      v16 = 2081;
      v17 = "!_timeCoercibleSilos";
      _os_log_impl(&dword_1A19F4000, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Only enable Time Coercion once, eh?\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  timeCoercibleSilos = self->_timeCoercibleSilos;
  self->_timeCoercibleSilos = v3;

}

- (BOOL)isTimeCoercionEnabled
{
  return self->_timeCoercibleSilos != 0;
}

- (int)missBehavior
{
  return self->_missBehavior;
}

- (void)amendServiceReplacementMap:(id)a3 missBehavior:(int)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  uint64_t missBehavior;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t buf;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v4 = *(_QWORD *)&a4;
  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (self->_missBehavior <= (int)v4)
  {
    v11 = (void *)-[NSDictionary mutableCopy](self->_serviceReplacementMap, "mutableCopy");
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v12 = v6;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v12);
          v16 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v12, "objectForKeyedSubscript:", v16, (_QWORD)v18);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, v16);

        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v13);
    }

    -[CLServiceVendor setServiceReplacementMap:missBehavior:](self, "setServiceReplacementMap:missBehavior:", v11, v4);
  }
  else
  {
    if (qword_1ECE24CB0 != -1)
      dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
    v7 = qword_1ECE24CA8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_FAULT))
    {
      missBehavior = self->_missBehavior;
      buf = 68289538;
      v24 = 2082;
      v25 = &unk_1A1A18FAF;
      v26 = 2050;
      v27 = missBehavior;
      v28 = 2050;
      v29 = v4;
      _os_log_impl(&dword_1A19F4000, v7, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"When amending replacement maps, you must make the new miss behavior the same or more strict. stock -> nop, stock -> crash and nop -> crash are valid changes here, or otherwise you must leave the behavior the same\", \"current\":%{public, location:CLSVReplacementMapMissBehavior}lld, \"desired\":%{public, location:CLSVReplacementMapMissBehavior}lld}", (uint8_t *)&buf, 0x26u);
      if (qword_1ECE24CB0 != -1)
        dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
    }
    v9 = qword_1ECE24CA8;
    if (os_signpost_enabled((os_log_t)qword_1ECE24CA8))
    {
      v10 = self->_missBehavior;
      buf = 68289538;
      v24 = 2082;
      v25 = &unk_1A1A18FAF;
      v26 = 2050;
      v27 = v10;
      v28 = 2050;
      v29 = v4;
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "When amending replacement maps, you must make the new miss behavior the same or more strict. stock -> nop, stock -> crash and nop -> crash are valid changes here, or otherwise you must leave the behavior the same", "{\"msg%{public}.0s\":\"When amending replacement maps, you must make the new miss behavior the same or more strict. stock -> nop, stock -> crash and nop -> crash are valid changes here, or otherwise you must leave the behavior the same\", \"current\":%{public, location:CLSVReplacementMapMissBehavior}lld, \"desired\":%{public, location:CLSVReplacementMapMissBehavior}lld}", (uint8_t *)&buf, 0x26u);
    }
  }

}

- (void)setServiceReplacementMap:(id)a3 missBehavior:(int)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  CLServiceVendor *v11;
  int v12;

  v6 = a3;
  v7 = qword_1ECE24D08;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A1A14624;
  block[3] = &unk_1E45FBD88;
  v10 = v6;
  v11 = self;
  v12 = a4;
  v8 = v6;
  dispatch_barrier_sync(v7, block);

}

- (id)setRecordingTriggerMap:(id)a3 outputPathBase:(id)a4
{
  return 0;
}

- (void)retireServiceWithName:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[5];
  _QWORD block[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t buf;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_1A1A02A3C;
  v19 = sub_1A1A02A04;
  v20 = 0;
  v5 = qword_1ECE24D08;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A1A15E24;
  block[3] = &unk_1E45FBE28;
  v14 = &v15;
  block[4] = self;
  v7 = v4;
  v13 = v7;
  dispatch_barrier_sync(v5, block);
  v8 = (void *)v16[5];
  if (v8)
  {
    objc_msgSend(v8, "silo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = sub_1A1A15EFC;
    v11[3] = &unk_1E45FBE50;
    v11[4] = &v15;
    objc_msgSend(v9, "sync:", v11);

  }
  else
  {
    if (qword_1ECE24CB0 != -1)
      dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
    v10 = qword_1ECE24CA8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_DEBUG))
    {
      buf = 68289282;
      v22 = 2082;
      v23 = &unk_1A1A18FAF;
      v24 = 2114;
      v25 = v7;
      _os_log_impl(&dword_1A19F4000, v10, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#Warning Service retired redundantly or without ever having been started\", \"RequestedServiceName\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
    }
  }

  _Block_object_dispose(&v15, 8);
}

- (BOOL)isServiceEnabled:(id)a3
{
  NSObject *v4;
  id v5;
  uint64_t v7;
  id v8;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1A1A02A3C;
  v16 = sub_1A1A02A04;
  v17 = a3;
  v4 = qword_1ECE24D08;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A1A16060;
  block[3] = &unk_1E45FBE28;
  v11 = &v12;
  block[4] = self;
  v5 = v17;
  v10 = v5;
  dispatch_sync(v4, block);
  v7 = 0;
  v8 = 0;
  sub_1A19F5AF8(&v8, &v7, (void *)v13[5]);
  LOBYTE(v4) = v7 != 0;

  _Block_object_dispose(&v12, 8);
  return (char)v4;
}

- (BOOL)isServiceRunning:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v5 = qword_1ECE24D08;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A1A16154;
  block[3] = &unk_1E45FBE28;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);
  LOBYTE(v5) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v5;
}

- (BOOL)ensureServiceIsRunning:(id)a3
{
  void *v3;
  BOOL v4;

  -[CLServiceVendor getServiceWithName:](self, "getServiceWithName:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)proxyForService:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[CLServiceVendor getServiceWithName:](self, "getServiceWithName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[CLServiceVendor proxyForService:](self, "proxyForService:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "silo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "registerDelegate:inSilo:", v8, v10);

    objc_msgSend(v9, "setDelegateEntityName:", objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)setCurrentGlobalLatchedAbsoluteTimestamp:(double)a3
{
  NSMutableSet *timeCoercibleSilos;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableSet *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSMutableSet *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[6];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  timeCoercibleSilos = self->_timeCoercibleSilos;
  if (timeCoercibleSilos)
  {
    self->_currentGlobalLatchedAbsoluteTimestamp = a3;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v6 = timeCoercibleSilos;
    v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v30;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v30 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v9++), "suspend");
        }
        while (v7 != v9);
        v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      }
      while (v7);
    }

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = self->_timeCoercibleSilos;
    v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v26;
      v13 = MEMORY[0x1E0C809B0];
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v14);
          v24[0] = v13;
          v24[1] = 3221225472;
          v24[2] = sub_1A1A1655C;
          v24[3] = &unk_1E45FBC28;
          v24[4] = v15;
          *(double *)&v24[5] = a3;
          objc_msgSend(v15, "async:", v24);
          ++v14;
        }
        while (v11 != v14);
        v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
      }
      while (v11);
    }

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v16 = self->_timeCoercibleSilos;
    v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v20, v33, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v21;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v21 != v18)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v19++), "resume", (_QWORD)v20);
        }
        while (v17 != v19);
        v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v20, v33, 16);
      }
      while (v17);
    }

  }
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CLServiceVendor;
  -[CLServiceVendor dealloc](&v2, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordingToTriggersByFrom, 0);
  objc_storeStrong((id *)&self->_recordingFromTriggersByTo, 0);
  objc_storeStrong((id *)&self->_timeCoercibleSilos, 0);
  objc_storeStrong((id *)&self->_unavailableServiceNames, 0);
  objc_storeStrong((id *)&self->_serviceReplacementMap, 0);
  objc_storeStrong((id *)&self->_catalog, 0);
}

@end
