@implementation AMSLogoutTask

- (AMSLogoutTask)initWithAccount:(id)a3
{
  id v5;
  AMSLogoutTask *v6;
  AMSLogoutTask *v7;
  void *v8;
  objc_class *v9;
  ICCloudServiceStatusMonitor *v10;
  ICCloudServiceStatusMonitor *iCloudServiceMonitor;
  objc_super v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AMSLogoutTask;
  v6 = -[AMSTask init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    v15 = 0;
    v16 = &v15;
    v17 = 0x2050000000;
    v8 = (void *)qword_255EAAF30;
    v18 = qword_255EAAF30;
    if (!qword_255EAAF30)
    {
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = sub_230ED3A14;
      v14[3] = &unk_24FFA2EA0;
      v14[4] = &v15;
      sub_230ED3A14((uint64_t)v14);
      v8 = (void *)v16[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v15, 8);
    v10 = (ICCloudServiceStatusMonitor *)objc_alloc_init(v9);
    iCloudServiceMonitor = v7->_iCloudServiceMonitor;
    v7->_iCloudServiceMonitor = v10;

  }
  return v7;
}

- (id)logout
{
  void *v3;
  id v4;
  const char *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  AMSLogoutTask *v10;
  id v11;
  id location;

  AMSLogKey();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_230ED2654;
  v8[3] = &unk_24FFA2FE0;
  objc_copyWeak(&v11, &location);
  v4 = v3;
  v9 = v4;
  v10 = self;
  objc_msgSend_performBinaryTaskWithBlock_(self, v5, (uint64_t)v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v6;
}

- (BOOL)_revokeMusicKitUserTokensWithError:(id *)a3
{
  const char *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  char v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  char v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  int v41;
  uint64_t v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_sharedAccountsNotificationPluginConfig(MEMORY[0x24BE081D8], a2, (uint64_t)a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend_sharedConfig(MEMORY[0x24BE081D8], v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_OSLogObject(v7, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_opt_class();
    AMSLogKey();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 138543618;
    v42 = v9;
    v43 = 2114;
    v44 = v10;
    _os_log_impl(&dword_230EC7000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@] Revoking Music User Tokens", (uint8_t *)&v41, 0x16u);

  }
  objc_msgSend_account(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ams_DSID(v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_alloc_init(MEMORY[0x24BE08340]);
  objc_msgSend_iCloudServiceMonitor(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_opt_respondsToSelector();

  if ((v21 & 1) != 0)
  {
    objc_msgSend_iCloudServiceMonitor(self, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorOnlyCompletionHandlerAdapter(v17, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_revokeMusicKitUserTokensForAccountDSID_withCompletion_(v24, v28, (uint64_t)v16, v27);

    objc_msgSend_binaryPromiseAdapter(v17, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend_resultWithError_(v31, v32, (uint64_t)a3);

  }
  else
  {
    objc_msgSend_sharedAccountsNotificationPluginConfig(MEMORY[0x24BE081D8], v22, v23);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v36)
    {
      objc_msgSend_sharedConfig(MEMORY[0x24BE081D8], v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_OSLogObject(v36, v34, v35);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = objc_opt_class();
      AMSLogKey();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 138543618;
      v42 = v38;
      v43 = 2114;
      v44 = v39;
      _os_log_impl(&dword_230EC7000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@] Unable to revoke Music User Tokens missing necessary method in ICCloudServiceStatusMonitor", (uint8_t *)&v41, 0x16u);

    }
    if (a3)
    {
      AMSError();
      v33 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v33 = 0;
    }
  }

  return v33;
}

- (BOOL)_disableAutomaticDownloadKindsWithError:(id *)a3
{
  const char *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  char v27;
  int v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_sharedAccountsNotificationPluginConfig(MEMORY[0x24BE081D8], a2, (uint64_t)a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend_sharedConfig(MEMORY[0x24BE081D8], v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_OSLogObject(v7, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_opt_class();
    AMSLogKey();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138543618;
    v30 = v9;
    v31 = 2114;
    v32 = v10;
    _os_log_impl(&dword_230EC7000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@] Disabling automatic download kinds.", (uint8_t *)&v29, 0x16u);

  }
  objc_msgSend_createBagForSubProfile(MEMORY[0x24BE08040], v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x24BE08040]);
  objc_msgSend_account(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend_initWithEnabledMediaKinds_account_bag_(v14, v18, MEMORY[0x24BDBD1A8], v17, v13);

  objc_msgSend_perform(v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_binaryPromiseAdapter(v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend_resultWithError_(v25, v26, (uint64_t)a3);

  return v27;
}

- (BOOL)_disableBookkeeperWithBag:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  id v17;
  const char *v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  char v37;
  _QWORD v39[3];
  _QWORD v40[3];
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BE081D8];
  v6 = a3;
  objc_msgSend_sharedAccountsNotificationPluginConfig(v5, v7, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend_sharedConfig(MEMORY[0x24BE081D8], v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_OSLogObject(v11, v9, v10);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_opt_class();
    AMSLogKey();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v42 = v13;
    v43 = 2114;
    v44 = v14;
    _os_log_impl(&dword_230EC7000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@] Disabling Bookkeeper.", buf, 0x16u);

  }
  objc_msgSend_URLForKey_(v6, v15, (uint64_t)CFSTR("push-notification-types/add-push-notification-type-url"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc(MEMORY[0x24BE083F8]);
  v19 = (void *)objc_msgSend_initWithBag_(v17, v18, (uint64_t)v6);

  objc_msgSend_setRequestEncoding_(v19, v20, 2);
  objc_msgSend_deviceGUID(MEMORY[0x24BE08118], v21, v22, CFSTR("guid"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v23;
  v40[1] = &unk_24FFA4CC0;
  v39[1] = CFSTR("put-parameters");
  v39[2] = CFSTR("notification-type");
  v40[2] = CFSTR("mzbookkeeper");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v24, (uint64_t)v40, v39, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestWithMethod_bagURL_parameters_(v19, v26, 4, v16, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_defaultSession(MEMORY[0x24BE08410], v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataTaskPromiseWithRequestPromise_(v30, v31, (uint64_t)v27);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_binaryPromiseAdapter(v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend_resultWithError_(v35, v36, (uint64_t)a4);

  return v37;
}

- (BOOL)_sendLogoutRequestWithBag:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  id v18;
  const char *v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  char v50;
  uint64_t v52;
  void *v53;
  uint8_t buf[4];
  uint64_t v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)MEMORY[0x24BE081D8];
  v7 = a3;
  objc_msgSend_sharedAccountsNotificationPluginConfig(v6, v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend_sharedConfig(MEMORY[0x24BE081D8], v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_OSLogObject(v12, v10, v11);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_opt_class();
    AMSLogKey();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v55 = v14;
    v56 = 2114;
    v57 = v15;
    _os_log_impl(&dword_230EC7000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@] Sending logout request.", buf, 0x16u);

  }
  objc_msgSend_URLForKey_(v7, v16, (uint64_t)CFSTR("logout-url"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc(MEMORY[0x24BE083F8]);
  v20 = (void *)objc_msgSend_initWithBag_(v18, v19, (uint64_t)v7);

  objc_msgSend_setRequestEncoding_(v20, v21, 2);
  objc_msgSend_deviceGUID(MEMORY[0x24BE08118], v22, v23, CFSTR("guid"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v24;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v25, (uint64_t)&v53, &v52, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend_mutableCopy(v26, v27, v28);

  objc_msgSend_sharedInstance(MEMORY[0x24BE083C0], v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_account(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_subscriptionBagSyncDataForAccount_(v32, v36, (uint64_t)v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ams_setNullableObject_forKey_(v29, v38, (uint64_t)v37, CFSTR("sbsync"));

  objc_msgSend_requestWithMethod_bagURL_parameters_(v20, v39, 4, v17, v29);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_defaultSession(MEMORY[0x24BE08410], v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataTaskPromiseWithRequestPromise_(v43, v44, (uint64_t)v40);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_binaryPromiseAdapter(v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend_resultWithError_(v48, v49, (uint64_t)a4);

  return v50;
}

+ (void)_resetServerDataCacheForAccountWithDSID:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend_sharedAccountsNotificationPluginConfig(MEMORY[0x24BE081D8], v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v9 = (id)v6;
  if (v3)
  {
    if (!v6)
    {
      objc_msgSend_sharedConfig(MEMORY[0x24BE081D8], v7, v8);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_OSLogObject(v9, v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_opt_class();
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v11;
      v21 = 2114;
      v22 = v12;
      _os_log_impl(&dword_230EC7000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@] Requesting server data cache teardown", (uint8_t *)&v19, 0x16u);

    }
    v9 = objc_alloc_init(MEMORY[0x24BE083A0]);
    v14 = (id)objc_msgSend_tearDownCacheForAccountDSID_(v9, v13, (uint64_t)v3);
  }
  else
  {
    if (!v6)
    {
      objc_msgSend_sharedConfig(MEMORY[0x24BE081D8], v7, v8);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_OSLogObject(v9, v7, v8);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_opt_class();
      AMSLogKey();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v16;
      v21 = 2114;
      v22 = v17;
      _os_log_impl(&dword_230EC7000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@] Failed to request server data cache teardown - no dsid on account", (uint8_t *)&v19, 0x16u);

    }
  }

  objc_msgSend_setDidSetUpServerDataCache_(MEMORY[0x24BE08100], v18, 0);
}

+ (void)_performDaemonSignOutTasksForAccountWithID:(id)a3
{
  MEMORY[0x24BEDD108](MEMORY[0x24BE07FF8], sel_performSignOutTasksInDaemonForAccount_, a3);
}

- (ACAccount)account
{
  return self->_account;
}

- (ICCloudServiceStatusMonitor)iCloudServiceMonitor
{
  return self->_iCloudServiceMonitor;
}

- (void)setICloudServiceMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_iCloudServiceMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iCloudServiceMonitor, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
