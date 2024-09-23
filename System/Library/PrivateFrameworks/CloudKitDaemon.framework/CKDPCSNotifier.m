@implementation CKDPCSNotifier

+ (id)sharedNotifier
{
  if (qword_1ED702838 != -1)
    dispatch_once(&qword_1ED702838, &unk_1E7833140);
  return (id)qword_1ED702840;
}

- (CKDPCSNotifier)init
{
  const char *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CKDPCSNotifier;
  v4 = -[CKDPCSNotifier init](&v18, sel_init);
  if (v4)
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)*((_QWORD *)v4 + 3);
    *((_QWORD *)v4 + 3) = v5;

    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v7, (uint64_t)CFSTR("%s"), "com.apple.cloudkit.pcsnotifier.queue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (const char *)objc_msgSend_UTF8String(v8, v9, v10);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create(v11, v12);
    v14 = (void *)*((_QWORD *)v4 + 2);
    *((_QWORD *)v4 + 2) = v13;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v4 + 2), "com.apple.cloudkit.pcsnotifier.queue", (void *)1, 0);
    objc_msgSend_setupIdentityUpdateNotificationHandling(v4, v15, v16);

  }
  return (CKDPCSNotifier *)v4;
}

- (void)addTestOverrides:(id)a3
{
  CKDPCSNotifier *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  id v14;

  v14 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_testOverrides(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend_setTestOverrides_(v4, v11, (uint64_t)v10);

  }
  objc_msgSend_testOverrides(v4, v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addEntriesFromDictionary_(v12, v13, (uint64_t)v14);

  objc_sync_exit(v4);
}

- (BOOL)checkAndClearTestOverrides:(id)a3
{
  id v5;
  CKDPCSNotifier *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v22;
  const char *v23;

  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  if (!*MEMORY[0x1E0C95280])
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, (uint64_t)a2, v6, CFSTR("CKDPCSNotifier.m"), 74, CFSTR("Only suitable for testing"));

  }
  objc_msgSend_testOverrides(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTestOverrides_(v6, v13, (uint64_t)v12);

  }
  objc_msgSend_testOverrides(v6, v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v14, v15, (uint64_t)v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_testOverrides(v6, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectForKey_(v19, v20, (uint64_t)v5);

  objc_sync_exit(v6);
  return v16 != 0;
}

- (void)setupIdentityUpdateNotificationHandling
{
  uint64_t v2;
  void *v4;
  const char *v5;
  _BYTE *v6;
  void *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v16;
  void *v17;
  const char *v18;
  __CFString *v19;
  __CFNotificationCenter *v20;
  __CFNotificationCenter *v21;
  const char *v22;
  uint64_t v23;
  NSObject *v24;
  OS_dispatch_source *v25;
  OS_dispatch_source *pcsUpdateSource;
  NSObject *v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD v30[5];
  id v31;
  id location;
  _QWORD handler[4];
  id v34;

  objc_msgSend_defaultCenter(MEMORY[0x1E0CB35B0], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObserver_selector_name_object_(v4, v5, (uint64_t)self, sel_securityViewBecameReady_, CFSTR("com.apple.security.view-become-ready"), 0);

  v6 = (_BYTE *)MEMORY[0x1E0C95280];
  if (*MEMORY[0x1E0C95280])
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    CKTestNotificationPrefix();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v7, v9, (uint64_t)CFSTR("%@%@"), v8, CFSTR("com.apple.security.view-become-ready"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_defaultCenter(MEMORY[0x1E0CB35B0], v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObserver_selector_name_object_(v13, v14, (uint64_t)self, sel_securityViewBecameReady_, v10, 0);

  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1BEAE1AE0, CFSTR("com.apple.security.view-change.PCS"), 0, (CFNotificationSuspensionBehavior)1025);
  if (*v6)
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    CKTestNotificationPrefix();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v16, v18, (uint64_t)CFSTR("%@%@"), v17, CFSTR("com.apple.security.view-change.PCS"));
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v20 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v20, self, (CFNotificationCallback)sub_1BEAE1AE0, v19, 0, (CFNotificationSuspensionBehavior)1025);

  }
  v21 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v21, self, (CFNotificationCallback)sub_1BEAE1AE0, CFSTR("com.apple.ProtectedCloudStorage.HaveCredentials"), 0, (CFNotificationSuspensionBehavior)1025);
  objc_msgSend_synchronizeQueue(self, v22, v23);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80D78], 0, 0, v24);
  pcsUpdateSource = self->_pcsUpdateSource;
  self->_pcsUpdateSource = v25;

  objc_initWeak(&location, self);
  v27 = self->_pcsUpdateSource;
  v28 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = sub_1BEAE1C18;
  v30[3] = &unk_1E782E4E0;
  objc_copyWeak(&v31, &location);
  v30[4] = self;
  v29 = v30;
  handler[0] = v28;
  handler[1] = 3221225472;
  handler[2] = sub_1BE998480;
  handler[3] = &unk_1E782EFD8;
  v34 = v29;
  dispatch_source_set_event_handler(v27, handler);

  dispatch_resume((dispatch_object_t)self->_pcsUpdateSource);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
}

- (void)securityViewBecameReady:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  __CFString *v14;
  const char *v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  const __CFString *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  const __CFString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = _os_activity_create(&dword_1BE990000, "CKDPCSNotifier/SecurityViewBecameReady", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  v5 = (void *)MEMORY[0x1E0CB3940];
  CKTestNotificationPrefix();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0C95388];
  objc_msgSend_stringWithFormat_(v5, v8, (uint64_t)CFSTR("%@%@"), v6, *MEMORY[0x1E0C95388]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_userInfo(v3, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v12, v13, (uint64_t)CFSTR("view"));
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if ((objc_msgSend_isEqualToString_(v14, v15, (uint64_t)CFSTR("unknown")) & 1) != 0)
    {
      v16 = v14;
      v14 = 0;
    }
    else
    {
      v17 = (void *)MEMORY[0x1E0CB3940];
      CKTestNotificationPrefix();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v17, v18, (uint64_t)CFSTR("%@%@-%@"), v16, v7, v14);
      v19 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v19;
    }
  }
  else
  {
    v16 = 0;
  }

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v20 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v24 = CFSTR(" named ");
    v25 = &stru_1E7838F48;
    if (v14)
      v25 = v14;
    else
      v24 = &stru_1E7838F48;
    *(_DWORD *)buf = 138543874;
    v29 = v24;
    v26 = CFSTR("Posting a notification to all clients.");
    if (v14)
      v26 = CFSTR("Posting a scoped notification.");
    v30 = 2114;
    v31 = v25;
    v32 = 2112;
    v33 = v26;
    _os_log_debug_impl(&dword_1BE990000, v20, OS_LOG_TYPE_DEBUG, "Security view%{public}@%{public}@ became ready. %@", buf, 0x20u);
  }
  v23 = (const char *)objc_msgSend_UTF8String(v9, v21, v22);
  notify_post(v23);

  os_activity_scope_leave(&state);
}

- (void)dealloc
{
  uint64_t v2;
  void *v4;
  const char *v5;
  _BYTE *v6;
  void *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v16;
  void *v17;
  const char *v18;
  __CFString *v19;
  __CFNotificationCenter *v20;
  __CFNotificationCenter *v21;
  const char *v22;
  uint64_t v23;
  NSObject *v24;
  intptr_t v25;
  objc_super v26;

  objc_msgSend_defaultCenter(MEMORY[0x1E0CB35B0], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_name_object_(v4, v5, (uint64_t)self, CFSTR("com.apple.security.view-become-ready"), 0);

  v6 = (_BYTE *)MEMORY[0x1E0C95280];
  if (*MEMORY[0x1E0C95280])
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    CKTestNotificationPrefix();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v7, v9, (uint64_t)CFSTR("%@%@"), v8, CFSTR("com.apple.security.view-become-ready"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_defaultCenter(MEMORY[0x1E0CB35B0], v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObserver_name_object_(v13, v14, (uint64_t)self, v10, 0);

  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.security.view-change.PCS"), 0);
  if (*v6)
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    CKTestNotificationPrefix();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v16, v18, (uint64_t)CFSTR("%@%@"), v17, CFSTR("com.apple.security.view-change.PCS"));
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v20 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(v20, self, v19, 0);

  }
  v21 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v21, self, CFSTR("com.apple.ProtectedCloudStorage.HaveCredentials"), 0);
  dispatch_source_cancel((dispatch_source_t)self->_pcsUpdateSource);
  while (1)
  {
    objc_msgSend_pcsUpdateSource(self, v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = dispatch_source_testcancel(v24);

    if (v25)
      break;
    usleep(0xAu);
  }
  v26.receiver = self;
  v26.super_class = (Class)CKDPCSNotifier;
  -[CKDPCSNotifier dealloc](&v26, sel_dealloc);
}

- (void)addContext:(id)a3 forManagerUUID:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  objc_msgSend_missingIdentitiesContextMap(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v9);
  objc_msgSend_missingIdentitiesContextMap(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v12, v13, (uint64_t)v14, v6);

  objc_sync_exit(v9);
}

- (void)addServicesWithMissingIdentities:(id)a3 forManagerUUID:(id)a4 withAccount:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  id v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  const char *v30;
  NSObject *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v32 = a5;
  objc_msgSend_missingIdentitiesContextMap(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v12);
  objc_msgSend_missingIdentitiesContextMap(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v15, v16, (uint64_t)v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    if (objc_msgSend_count(v8, v18, v19))
    {
      objc_msgSend_setAccount_(v17, v20, (uint64_t)v32);
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v21 = v8;
      v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v33, v39, 16);
      if (v25)
      {
        v26 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v34 != v26)
              objc_enumerationMutation(v21);
            v28 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
            objc_msgSend_servicesWithMissingIdentities(v17, v23, v24);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v29, v30, v28);

          }
          v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v23, (uint64_t)&v33, v39, 16);
        }
        while (v25);
      }

    }
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v31 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v9;
      _os_log_error_impl(&dword_1BE990000, v31, OS_LOG_TYPE_ERROR, "No manager context found for manager UUID: %@", buf, 0xCu);
    }
  }

  objc_sync_exit(v12);
}

- (void)addMissingIdentityPublicKeys:(id)a3 forManagerUUID:(id)a4 withAccount:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  id v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  const char *v30;
  NSObject *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v32 = a5;
  objc_msgSend_missingIdentitiesContextMap(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v12);
  objc_msgSend_missingIdentitiesContextMap(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v15, v16, (uint64_t)v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    if (objc_msgSend_count(v8, v18, v19))
    {
      objc_msgSend_setAccount_(v17, v20, (uint64_t)v32);
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v21 = v8;
      v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v33, v39, 16);
      if (v25)
      {
        v26 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v34 != v26)
              objc_enumerationMutation(v21);
            v28 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
            objc_msgSend_missingIdentityPublicKeys(v17, v23, v24);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v29, v30, v28);

          }
          v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v23, (uint64_t)&v33, v39, 16);
        }
        while (v25);
      }

    }
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v31 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v9;
      _os_log_error_impl(&dword_1BE990000, v31, OS_LOG_TYPE_ERROR, "No manager context found for manager UUID: %@", buf, 0xCu);
    }
  }

  objc_sync_exit(v12);
}

- (void)clearContextIfUnnecessaryForManagerUUID:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  id v26;

  v26 = a3;
  objc_msgSend_missingIdentitiesContextMap(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v6);
  objc_msgSend_missingIdentitiesContextMap(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v9, v10, (uint64_t)v26);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend_copyOfServicesWithMissingIdentities(v11, v12, v13);
  if (!objc_msgSend_count(v14, v15, v16))
  {
    v19 = (void *)objc_msgSend_copyOfMissingIdentityPublicKeys(v11, v17, v18);
    v22 = objc_msgSend_count(v19, v20, v21);

    if (v22)
      goto LABEL_4;
    objc_msgSend_missingIdentitiesContextMap(self, v23, v24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObjectForKey_(v14, v25, (uint64_t)v26);
  }

LABEL_4:
  objc_sync_exit(v6);

}

- (void)clearServicesAndPublicKeysForManagerUUID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  NSObject *v23;
  int v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_missingIdentitiesContextMap(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  objc_msgSend_missingIdentitiesContextMap(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v10, v11, (uint64_t)v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend_servicesWithMissingIdentities(v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeAllObjects(v15, v16, v17);

    objc_msgSend_missingIdentityPublicKeys(v12, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeAllObjects(v20, v21, v22);

  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v23 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v24 = 138412290;
      v25 = v4;
      _os_log_error_impl(&dword_1BE990000, v23, OS_LOG_TYPE_ERROR, "No manager context found for manager UUID: %@", (uint8_t *)&v24, 0xCu);
    }
  }

  objc_sync_exit(v7);
}

- (OS_dispatch_source)pcsUpdateSource
{
  return self->_pcsUpdateSource;
}

- (void)setPcsUpdateSource:(id)a3
{
  objc_storeStrong((id *)&self->_pcsUpdateSource, a3);
}

- (OS_dispatch_queue)synchronizeQueue
{
  return self->_synchronizeQueue;
}

- (void)setSynchronizeQueue:(id)a3
{
  objc_storeStrong((id *)&self->_synchronizeQueue, a3);
}

- (NSMutableDictionary)missingIdentitiesContextMap
{
  return self->_missingIdentitiesContextMap;
}

- (void)setMissingIdentitiesContextMap:(id)a3
{
  objc_storeStrong((id *)&self->_missingIdentitiesContextMap, a3);
}

- (NSMutableDictionary)testOverrides
{
  return self->_testOverrides;
}

- (void)setTestOverrides:(id)a3
{
  objc_storeStrong((id *)&self->_testOverrides, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testOverrides, 0);
  objc_storeStrong((id *)&self->_missingIdentitiesContextMap, 0);
  objc_storeStrong((id *)&self->_synchronizeQueue, 0);
  objc_storeStrong((id *)&self->_pcsUpdateSource, 0);
}

@end
