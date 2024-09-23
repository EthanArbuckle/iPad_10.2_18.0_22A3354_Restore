@implementation CKDAccountDataSecurityObserver

- (CKDLogicalDeviceContext)deviceContext
{
  return (CKDLogicalDeviceContext *)objc_loadWeakRetained((id *)&self->_deviceContext);
}

- (OS_dispatch_queue)statusQueue
{
  return self->_statusQueue;
}

- (NSError)lastCDPErrorForWalrusStatus
{
  NSError *v3;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ED700B18);
  v3 = self->_lastCDPErrorForWalrusStatus;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ED700B18);
  return v3;
}

- (int64_t)cachedWalrusStatusForLoggedInAccount
{
  int64_t cachedWalrusStatusForLoggedInAccount;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ED700B18);
  cachedWalrusStatusForLoggedInAccount = self->_cachedWalrusStatusForLoggedInAccount;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ED700B18);
  return cachedWalrusStatusForLoggedInAccount;
}

- (CKDAccountDataSecurityObserver)initWithDeviceContext:(id)a3
{
  id v4;
  CKDAccountDataSecurityObserver *v5;
  CKDAccountDataSecurityObserver *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *statusQueue;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  __CFNotificationCenter *DarwinNotifyCenter;
  const char *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  NSObject *walrusStatusChangeObserver;
  _QWORD v25[4];
  id v26;
  id location;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CKDAccountDataSecurityObserver;
  v5 = -[CKDAccountDataSecurityObserver init](&v28, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_deviceContext, v4);
    v6->_manateeAvailableForLoggedInAccount = -1;
    v6->_cachedWalrusStatusForLoggedInAccount = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.cloudkit.account.manateeStatusQueue", v7);
    statusQueue = v6->_statusQueue;
    v6->_statusQueue = (OS_dispatch_queue *)v8;

    objc_msgSend_currentProcess(CKDDaemonProcess, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_processType(v12, v13, v14);

    if (v15 != 1)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)sub_1BEC883D8, CFSTR("com.apple.security.octagon.trust-status-change"), 0, (CFNotificationSuspensionBehavior)1025);
      objc_initWeak(&location, v6);
      objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *MEMORY[0x1E0D15758];
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = sub_1BEC88480;
      v25[3] = &unk_1E7838D40;
      objc_copyWeak(&v26, &location);
      objc_msgSend_addObserverForName_object_queue_usingBlock_(v19, v21, v20, 0, 0, v25);
      v22 = objc_claimAutoreleasedReturnValue();
      walrusStatusChangeObserver = v6->_walrusStatusChangeObserver;
      v6->_walrusStatusChangeObserver = v22;

      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
    }
  }

  return v6;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  NSObject *walrusStatusChangeObserver;
  objc_super v9;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.security.octagon.trust-status-change"), 0);
  if (self->_walrusStatusChangeObserver)
  {
    objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObserver_name_object_(v6, v7, (uint64_t)self->_walrusStatusChangeObserver, *MEMORY[0x1E0D15758], 0);

    walrusStatusChangeObserver = self->_walrusStatusChangeObserver;
    self->_walrusStatusChangeObserver = 0;

  }
  v9.receiver = self;
  v9.super_class = (Class)CKDAccountDataSecurityObserver;
  -[CKDAccountDataSecurityObserver dealloc](&v9, sel_dealloc);
}

- (void)_lockedSetManateeAvailableForLoggedInAccount:(int64_t)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  int64_t manateeAvailableForLoggedInAccount;
  void *v10;
  const char *v11;
  uint64_t v12;

  objc_msgSend_statusQueue(self, a2, a3);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_barrier(v5);

  manateeAvailableForLoggedInAccount = self->_manateeAvailableForLoggedInAccount;
  if (manateeAvailableForLoggedInAccount != -1 && manateeAvailableForLoggedInAccount != a3)
  {
    objc_msgSend_sharedNotifier(CKDAccountNotifier, v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_postAccountChangedNotificationToClients(v10, v11, v12);

  }
  self->_manateeAvailableForLoggedInAccount = a3;
}

- (int64_t)_fetchManateeAvailability:(id *)a3
{
  void *v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  char isManateeAvailable;
  id v10;
  const char *v11;
  uint64_t v12;
  int64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  id v20;

  objc_msgSend_contextForPrimaryAccount(MEMORY[0x1E0D15768], a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0D15780]);
  v7 = (void *)objc_msgSend_initWithContext_(v5, v6, (uint64_t)v4);
  v20 = 0;
  isManateeAvailable = objc_msgSend_isManateeAvailable_(v7, v8, (uint64_t)&v20);
  v10 = v20;

  if (a3)
    *a3 = objc_retainAutorelease(v10);
  if ((isManateeAvailable & 1) == 0)
  {
    objc_msgSend_domain(v10, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToString_(v14, v15, *MEMORY[0x1E0D15750]))
    {
      v18 = objc_msgSend_code(v10, v16, v17);

      if (v18 == -5311)
      {
        v13 = -1;
        goto LABEL_10;
      }
    }
    else
    {

    }
    v13 = 0;
    goto LABEL_10;
  }
  v13 = 1;
LABEL_10:

  return v13;
}

- (void)handleManateeStatusUpdateNotificationWithAvailability:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  int isLiveDevice;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  CKDAccountDataSecurityObserver *v16;

  v4 = a3;
  objc_msgSend_deviceContext(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  isLiveDevice = objc_msgSend_isLiveDevice(v7, v8, v9);

  if (isLiveDevice)
  {
    objc_msgSend_statusQueue(self, v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1BEC88764;
    v14[3] = &unk_1E782EE20;
    v15 = v4;
    v16 = self;
    dispatch_barrier_async(v13, v14);

  }
}

- (void)_lockedFetchAndUpdateManateeAvailability
{
  uint64_t v2;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t ManateeAvailability;
  id v9;
  const char *v10;
  const char *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const __CFString *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  id v26;
  uint8_t buf[4];
  const __CFString *v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  const __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend_statusQueue(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_barrier(v4);

  if (objc_msgSend_manateeAvailableForLoggedInAccount(self, v5, v6) == -1)
  {
    v26 = 0;
    ManateeAvailability = objc_msgSend__fetchManateeAvailability_(self, v7, (uint64_t)&v26);
    v9 = v26;
    objc_msgSend__lockedSetManateeAvailableForLoggedInAccount_(self, v10, ManateeAvailability);
    objc_msgSend_setLastCDPErrorForManateeStatus_(self, v11, (uint64_t)v9);
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v12 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v13 = v12;
      if (objc_msgSend_manateeAvailableForLoggedInAccount(self, v14, v15) == 1)
        v18 = &stru_1E7838F48;
      else
        v18 = CFSTR(" not");
      objc_msgSend_lastCDPErrorForManateeStatus(self, v16, v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
        v22 = CFSTR("Error: ");
      else
        v22 = &stru_1E7838F48;
      objc_msgSend_lastCDPErrorForManateeStatus(self, v19, v20);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v23;
      *(_DWORD *)buf = 138543874;
      if (v23)
        v25 = (const __CFString *)v23;
      else
        v25 = &stru_1E7838F48;
      v28 = v18;
      v29 = 2114;
      v30 = v22;
      v31 = 2112;
      v32 = v25;
      _os_log_debug_impl(&dword_1BE990000, v13, OS_LOG_TYPE_DEBUG, "CoreCDP reports that manatee is%{public}@ available for the logged in account.%{public}@%@", buf, 0x20u);

    }
  }
}

- (void)manateeStatusForAccount:(id)a3 isSecondaryAccount:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(id, uint64_t, _QWORD);
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  int v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  int v51;
  void *v52;
  NSObject *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  _BOOL8 v59;
  const char *v60;
  uint64_t v61;
  NSObject *v62;
  NSObject *v63;
  const char *v64;
  uint64_t v65;
  __CFString *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  __CFString *v72;
  const __CFString *v73;
  NSObject *v74;
  const char *v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  const __CFString *v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const __CFString *v83;
  uint64_t v84;
  void *v85;
  const __CFString *v86;
  _QWORD v87[5];
  void (**v88)(id, uint64_t, _QWORD);
  uint8_t buf[4];
  const __CFString *v90;
  __int16 v91;
  const __CFString *v92;
  __int16 v93;
  const __CFString *v94;
  uint64_t v95;

  v6 = a4;
  v95 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, uint64_t, _QWORD))a5;
  objc_msgSend_deviceContext(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isLiveDevice(v12, v13, v14) & 1) == 0)
  {
    if (!v9)
      goto LABEL_30;
    objc_msgSend_testDevice(v12, v15, v16);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_deviceToDeviceEncryptionEnabled(v39, v40, v41)
      && (objc_msgSend_daemonAccount(v39, v42, v43),
          v44 = (void *)objc_claimAutoreleasedReturnValue(),
          v47 = objc_msgSend_deviceToDeviceEncryptionSupportedByAccount(v44, v45, v46),
          v44,
          (v47 & 1) != 0))
    {
      v48 = 1;
    }
    else
    {
      objc_msgSend_deviceID(v39, v42, v43);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend_containsString_(v49, v50, (uint64_t)CFSTR("captainmanatee"));

      if (v51)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v52 = (void *)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
        {
          v63 = v52;
          objc_msgSend_deviceID(v39, v64, v65);
          v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_daemonAccount(v39, v67, v68);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_accountID(v69, v70, v71);
          v72 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v90 = v66;
          v91 = 2112;
          v92 = v72;
          _os_log_debug_impl(&dword_1BE990000, v63, OS_LOG_TYPE_DEBUG, "Device should have manatee enabled but doesn't. DeviceID: %@ AccountID: %@", buf, 0x16u);

        }
      }
      v48 = 0;
    }
    v9[2](v9, v48, 0);
    goto LABEL_22;
  }
  if (!v8)
    goto LABEL_24;
  objc_msgSend_altDSID(v8, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_length(v17, v18, v19))
  {

    goto LABEL_24;
  }
  objc_msgSend_accountID(v8, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend_length(v22, v23, v24);

  if (!v25)
  {
LABEL_24:
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v53 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1BE990000, v53, OS_LOG_TYPE_DEBUG, "No account altDSID or accountID available for manatee status, returning manatee disabled", buf, 2u);
    }
    goto LABEL_28;
  }
  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend_fakeManateeOverride(v28, v29, v30);

  if (!v31)
  {
    if (!v6)
    {
      if (objc_msgSend_manateeAvailableForLoggedInAccount(self, v32, v33) == -1)
      {
        objc_msgSend_statusQueue(self, v54, v55);
        v62 = objc_claimAutoreleasedReturnValue();
        v87[0] = MEMORY[0x1E0C809B0];
        v87[1] = 3221225472;
        v87[2] = sub_1BEC89098;
        v87[3] = &unk_1E782F4D0;
        v87[4] = self;
        v88 = v9;
        dispatch_barrier_async(v62, v87);

        goto LABEL_30;
      }
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v56 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        v74 = v56;
        if (objc_msgSend_manateeAvailableForLoggedInAccount(self, v75, v76) == 1)
          v79 = &stru_1E7838F48;
        else
          v79 = CFSTR(" not");
        objc_msgSend_lastCDPErrorForManateeStatus(self, v77, v78);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        if (v82)
          v83 = CFSTR("Error: ");
        else
          v83 = &stru_1E7838F48;
        objc_msgSend_lastCDPErrorForManateeStatus(self, v80, v81);
        v84 = objc_claimAutoreleasedReturnValue();
        v85 = (void *)v84;
        *(_DWORD *)buf = 138543874;
        if (v84)
          v86 = (const __CFString *)v84;
        else
          v86 = &stru_1E7838F48;
        v90 = v79;
        v91 = 2114;
        v92 = v83;
        v93 = 2112;
        v94 = v86;
        _os_log_debug_impl(&dword_1BE990000, v74, OS_LOG_TYPE_DEBUG, "Returning cached manatee availability originally retrieved from CoreCDP: manatee is%{public}@ available.%{public}@%@", buf, 0x20u);

        if (!v9)
          goto LABEL_30;
      }
      else if (!v9)
      {
        goto LABEL_30;
      }
      v59 = objc_msgSend_manateeAvailableForLoggedInAccount(self, v57, v58) == 1;
      objc_msgSend_lastCDPErrorForManateeStatus(self, v60, v61);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, uint64_t, void *))v9)[2](v9, v59, v39);
LABEL_22:

      goto LABEL_30;
    }
LABEL_28:
    if (v9)
      v9[2](v9, 0, 0);
    goto LABEL_30;
  }
  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend_fakeManateeEnabled(v34, v35, v36);

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v38 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v73 = CFSTR("NO");
    if ((_DWORD)v37)
      v73 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v90 = v73;
    _os_log_debug_impl(&dword_1BE990000, v38, OS_LOG_TYPE_DEBUG, "Manatee override behavior option is set. Returning manatee enabled value from behavior option: %@", buf, 0xCu);
    if (v9)
      goto LABEL_10;
  }
  else if (v9)
  {
LABEL_10:
    v9[2](v9, v37, 0);
  }
LABEL_30:

}

- (BOOL)isManateeAvailableForAccount:(id)a3 isSecondaryAccount:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  dispatch_semaphore_t v12;
  NSObject *v13;
  const char *v14;
  char v15;
  _QWORD v17[4];
  NSObject *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v6 = a4;
  v8 = a3;
  objc_msgSend_statusQueue(self, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v11);

  v12 = dispatch_semaphore_create(0);
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_1BE9BB270;
  v25 = sub_1BE9BAEE0;
  v26 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1BEC89298;
  v17[3] = &unk_1E7832B78;
  v19 = &v27;
  v20 = &v21;
  v13 = v12;
  v18 = v13;
  objc_msgSend_manateeStatusForAccount_isSecondaryAccount_completionHandler_(self, v14, (uint64_t)v8, v6, v17);
  dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  if (a5)
    *a5 = objc_retainAutorelease((id)v22[5]);
  v15 = *((_BYTE *)v28 + 24);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v15;
}

- (BOOL)accountSupportsManatee:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  char v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;

  v4 = a3;
  objc_msgSend_deviceContext(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isLiveDevice(v7, v8, v9) & 1) != 0)
  {
    objc_msgSend_dsid(v4, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v21 = 0;
      goto LABEL_7;
    }
    v13 = objc_alloc(MEMORY[0x1E0D82608]);
    objc_msgSend_dsid(v4, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend_initWithDSID_(v13, v17, (uint64_t)v16);

    v21 = objc_msgSend_accountStatus(v18, v19, v20) == 1;
  }
  else
  {
    objc_msgSend_testDevice(v7, v10, v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_daemonAccount(v18, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend_deviceToDeviceEncryptionSupportedByAccount(v24, v25, v26);

  }
LABEL_7:

  return v21;
}

+ (id)sharedWalrusController
{
  if (qword_1ED702CD8 != -1)
    dispatch_once(&qword_1ED702CD8, &unk_1E7838D60);
  return (id)qword_1ED702CD0;
}

- (void)handleWalrusStateChanged
{
  NSObject *v3;
  const char *v4;
  uint8_t v5[16];

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_debug_impl(&dword_1BE990000, v3, OS_LOG_TYPE_DEBUG, "Walrus state may have changed. Fetching new state from CoreCDP", v5, 2u);
  }
  objc_msgSend_walrusStatusForAccount_isSecondaryAccount_checkCache_allowFetch_completionHandler_(self, v4, 0, 0, 0, 1, 0);
}

- (void)setCachedWalrusStatusForLoggedInAccount:(int64_t)a3
{
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  id v9;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ED700B18);
  if (self->_cachedWalrusStatusForLoggedInAccount == a3)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ED700B18);
  }
  else
  {
    self->_cachedWalrusStatusForLoggedInAccount = a3;
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ED700B18);
    objc_msgSend_sharedNotifier(CKDAccountNotifier, v5, v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_postAccountChangedNotificationToClients(v9, v7, v8);

  }
}

- (void)setLastCDPErrorForWalrusStatus:(id)a3
{
  NSError *v4;
  NSError *lastCDPErrorForWalrusStatus;

  v4 = (NSError *)a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ED700B18);
  lastCDPErrorForWalrusStatus = self->_lastCDPErrorForWalrusStatus;
  self->_lastCDPErrorForWalrusStatus = v4;

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ED700B18);
}

- (void)walrusStatusForAccount:(id)a3 isSecondaryAccount:(BOOL)a4 checkCache:(BOOL)a5 allowFetch:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  id v13;
  const char *v14;
  uint64_t v15;
  void (**v16)(id, uint64_t, _QWORD);
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  int v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  int v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  const char *v44;
  uint64_t v45;
  __CFString *v46;
  _BOOL4 v47;
  void *v48;
  NSObject *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  const __CFString *v55;
  const __CFString *v56;
  const __CFString *v57;
  const __CFString *v58;
  NSObject *v59;
  _QWORD v60[5];
  void (**v61)(id, uint64_t, _QWORD);
  id v62;
  uint8_t buf[16];
  _BYTE location[12];
  __int16 v65;
  const __CFString *v66;
  __int16 v67;
  const __CFString *v68;
  uint64_t v69;

  v8 = a6;
  v9 = a5;
  v10 = a4;
  v69 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v16 = (void (**)(id, uint64_t, _QWORD))a7;
  if (v9 || v8)
  {
    if (v10)
      goto LABEL_4;
LABEL_7:
    objc_msgSend_deviceContext(self, v14, v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isLiveDevice(v19, v20, v21) & 1) == 0)
    {
      if (v16)
      {
        objc_msgSend_testDevice(v19, v22, v23);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_daemonAccount(v36, v37, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_walrusEnabled(v39, v40, v41))
          v42 = 1;
        else
          v42 = 2;
        v16[2](v16, v42, 0);

      }
      goto LABEL_38;
    }
    objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend_fakeWalrusOverride(v24, v25, v26);

    if (!v27)
    {
      v43 = objc_msgSend_cachedWalrusStatusForLoggedInAccount(self, v28, v29);
      objc_msgSend_lastCDPErrorForWalrusStatus(self, v44, v45);
      v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v43)
        v47 = 0;
      else
        v47 = v8;
      if (!v9 || v47)
      {
        objc_initWeak((id *)location, self);
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v49 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1BE990000, v49, OS_LOG_TYPE_DEBUG, "Fetching walrus state from CoreCDP", buf, 2u);
        }
        v50 = (void *)objc_opt_class();
        objc_msgSend_sharedWalrusController(v50, v51, v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v60[0] = MEMORY[0x1E0C809B0];
        v60[1] = 3221225472;
        v60[2] = sub_1BEC89AD4;
        v60[3] = &unk_1E7838D88;
        objc_copyWeak(&v62, (id *)location);
        v60[4] = self;
        v61 = v16;
        objc_msgSend_walrusStatusWithCompletion_(v53, v54, (uint64_t)v60);

        objc_destroyWeak(&v62);
        objc_destroyWeak((id *)location);
      }
      else
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v48 = (void *)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
        {
          if (v43 > 2)
            v56 = CFSTR("unknown");
          else
            v56 = *(&off_1E7838DD0 + v43);
          *(_DWORD *)location = 138543874;
          *(_QWORD *)&location[4] = v56;
          if (v46)
            v57 = CFSTR(" Error: ");
          else
            v57 = &stru_1E7838F48;
          if (v46)
            v58 = v46;
          else
            v58 = &stru_1E7838F48;
          v65 = 2114;
          v66 = v57;
          v67 = 2112;
          v68 = v58;
          v59 = v48;
          _os_log_debug_impl(&dword_1BE990000, v59, OS_LOG_TYPE_DEBUG, "Returning cached walrus status originally retrieved from CoreCDP: walrus is %{public}@.%{public}@%@", location, 0x20u);

        }
        if (v16)
          ((void (**)(id, uint64_t, __CFString *))v16)[2](v16, v43, v46);
      }

      goto LABEL_38;
    }
    objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend_fakeWalrusEnabled(v30, v31, v32);

    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v34 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v55 = CFSTR("NO");
      if (v33)
        v55 = CFSTR("YES");
      *(_DWORD *)location = 138412290;
      *(_QWORD *)&location[4] = v55;
      _os_log_debug_impl(&dword_1BE990000, v34, OS_LOG_TYPE_DEBUG, "Returning fake walrus enabled value from behavior option: %@", location, 0xCu);
      if (!v16)
        goto LABEL_38;
    }
    else if (!v16)
    {
LABEL_38:

      goto LABEL_39;
    }
    if (v33)
      v35 = 1;
    else
      v35 = 2;
    v16[2](v16, v35, 0);
    goto LABEL_38;
  }
  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v18, (uint64_t)a2, self, CFSTR("CKDAccountDataSecurityObserver.m"), 601, CFSTR("checkCache and allowFetch cannot both be NO"));

  if (!v10)
    goto LABEL_7;
LABEL_4:
  if (v16)
    v16[2](v16, 0, 0);
LABEL_39:

}

- (BOOL)isWalrusEnabledForAccount:(id)a3 allowBlockingFetch:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  char error;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  _BOOL8 v16;
  const char *v17;
  BOOL v18;

  v4 = a4;
  v6 = a3;
  if ((objc_msgSend_isPrimaryAccount(v6, v7, v8) & 1) != 0)
  {
    error = objc_msgSend_isWalrusEnabledForAccount_isSecondaryAccount_allowBlockingFetch_error_(self, v9, (uint64_t)v6, 0, v4, 0);
  }
  else
  {
    objc_msgSend_deviceContext(self, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_testDeviceReference(v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15 == 0;

    error = objc_msgSend_isWalrusEnabledForAccount_isSecondaryAccount_allowBlockingFetch_error_(self, v17, (uint64_t)v6, v16, v4, 0);
  }
  v18 = error;

  return v18;
}

- (BOOL)isWalrusEnabledForAccount:(id)a3 isSecondaryAccount:(BOOL)a4 allowBlockingFetch:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  dispatch_semaphore_t v14;
  NSObject *v15;
  const char *v16;
  BOOL v17;
  _QWORD v19[4];
  NSObject *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  objc_msgSend_statusQueue(self, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v13);

  v14 = dispatch_semaphore_create(0);
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_1BE9BB270;
  v27 = sub_1BE9BAEE0;
  v28 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1BEC8A014;
  v19[3] = &unk_1E7838DB0;
  v21 = &v29;
  v22 = &v23;
  v15 = v14;
  v20 = v15;
  objc_msgSend_walrusStatusForAccount_isSecondaryAccount_checkCache_allowFetch_completionHandler_(self, v16, (uint64_t)v10, v8, 1, v7, v19);
  dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  if (a6)
    *a6 = objc_retainAutorelease((id)v24[5]);
  v17 = v30[3] == 1;

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v17;
}

- (void)postClouddWalrusUpdateNotification
{
  uint64_t v2;
  const char *v4;
  id v5;

  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], a2, v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_postNotificationName_object_(v5, v4, (uint64_t)CFSTR("CDPWalrusStateChangeNotification"), self);

}

- (void)setStatusQueue:(id)a3
{
  objc_storeStrong((id *)&self->_statusQueue, a3);
}

- (int64_t)manateeAvailableForLoggedInAccount
{
  return self->_manateeAvailableForLoggedInAccount;
}

- (NSError)lastCDPErrorForManateeStatus
{
  return self->_lastCDPErrorForManateeStatus;
}

- (void)setLastCDPErrorForManateeStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSObject)walrusStatusChangeObserver
{
  return self->_walrusStatusChangeObserver;
}

- (void)setWalrusStatusChangeObserver:(id)a3
{
  objc_storeStrong((id *)&self->_walrusStatusChangeObserver, a3);
}

- (void)setDeviceContext:(id)a3
{
  objc_storeWeak((id *)&self->_deviceContext, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_deviceContext);
  objc_storeStrong((id *)&self->_walrusStatusChangeObserver, 0);
  objc_storeStrong((id *)&self->_lastCDPErrorForManateeStatus, 0);
  objc_storeStrong((id *)&self->_statusQueue, 0);
  objc_storeStrong((id *)&self->_lastCDPErrorForWalrusStatus, 0);
}

@end
