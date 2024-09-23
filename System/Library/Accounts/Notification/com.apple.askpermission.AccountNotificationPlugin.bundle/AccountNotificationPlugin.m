@implementation AccountNotificationPlugin

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  int v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  _BYTE v28[24];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a6;
  objc_msgSend(MEMORY[0x24BE08960], "sharedPluginConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BE08960], "sharedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "OSLogObject");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v28 = 138543618;
    *(_QWORD *)&v28[4] = objc_opt_class();
    *(_WORD *)&v28[12] = 1026;
    *(_DWORD *)&v28[14] = a4;
    v12 = *(id *)&v28[4];
    _os_log_impl(&dword_230F6E000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Proccessing account change. Change type: %{public}u", v28, 0x12u);

  }
  if (objc_msgSend(v8, "ams_isiTunesAccount")
    && (objc_msgSend(v8, "isActive") & 1) == 0
    && objc_msgSend(v9, "isActive"))
  {
    objc_msgSend(MEMORY[0x24BE08960], "sharedPluginConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(MEMORY[0x24BE08960], "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "OSLogObject", *(_OWORD *)v28, *(_QWORD *)&v28[16], v29);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_opt_class();
      *(_DWORD *)v28 = 138543362;
      *(_QWORD *)&v28[4] = v15;
      v16 = v15;
      _os_log_impl(&dword_230F6E000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: iTunes account deactivated - resetting requester account", v28, 0xCu);

    }
    v17 = (void *)MEMORY[0x24BE08968];
    v18 = 1;
LABEL_20:
    objc_msgSend(v17, "resetAccountWithType:", v18);
    goto LABEL_21;
  }
  v19 = objc_msgSend(v9, "ams_isiCloudAccount", *(_QWORD *)v28, *(_OWORD *)&v28[8], v29);
  if (a4 == 3 && v19)
  {
    objc_msgSend(MEMORY[0x24BE08960], "sharedPluginConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      objc_msgSend(MEMORY[0x24BE08960], "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v20, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (void *)objc_opt_class();
      *(_DWORD *)v28 = 138543362;
      *(_QWORD *)&v28[4] = v22;
      v23 = v22;
      _os_log_impl(&dword_230F6E000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: iCloud account deleted - resetting approver account", v28, 0xCu);

    }
    v17 = (void *)MEMORY[0x24BE08968];
    v18 = 0;
    goto LABEL_20;
  }
  if (((objc_msgSend(v8, "ams_isiTunesAccount") & 1) != 0 || objc_msgSend(v8, "ams_isiCloudAccount"))
    && (a4 == 1 || (objc_msgSend(v9, "isActive") & 1) == 0 && objc_msgSend(v8, "isActive"))
    && objc_msgSend(MEMORY[0x24BE08958], "retryNotificationRegistration"))
  {
    objc_msgSend(MEMORY[0x24BE08960], "sharedPluginConfig");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      objc_msgSend(MEMORY[0x24BE08960], "sharedConfig");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v24, "OSLogObject");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = (void *)objc_opt_class();
      *(_DWORD *)v28 = 138543362;
      *(_QWORD *)&v28[4] = v26;
      v27 = v26;
      _os_log_impl(&dword_230F6E000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: Restarting APNS Connection due to account change.", v28, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BE08968], "restartAPNSConnection");
  }
LABEL_21:

}

@end
