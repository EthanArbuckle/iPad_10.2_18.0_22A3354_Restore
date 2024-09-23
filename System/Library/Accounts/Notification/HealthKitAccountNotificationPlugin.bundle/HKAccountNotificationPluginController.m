@implementation HKAccountNotificationPluginController

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  int v18;
  int v19;
  os_log_t *v20;
  NSObject *v21;
  NSObject *v22;
  const char *v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  int v27;
  int v28;
  NSObject *v29;
  const __CFString *v30;
  const __CFString *v31;
  NSObject *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  id v39;
  const __CFString *v40;
  void *v41;
  char v42;
  NSObject *v43;
  id v44;
  void *v45;
  id v46;
  NSObject *v47;
  __CFString *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  const __CFString *v52;
  __CFString *v53;
  void *v54;
  _QWORD v55[5];
  id v56;
  id v57;
  id v58;
  id v59;
  _QWORD v60[5];
  uint8_t buf[4];
  HKAccountNotificationPluginController *v62;
  __int16 v63;
  const __CFString *v64;
  __int16 v65;
  const __CFString *v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a6;
  v11 = v10;
  if (a4 != 4)
  {
    if (v9)
      v12 = v9;
    else
      v12 = v10;
    v13 = v12;
    objc_msgSend(v13, "accountType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BDB3FD8]))
      goto LABEL_36;
    v16 = *MEMORY[0x24BE047F0];
    v17 = objc_msgSend(v13, "aa_isAccountClass:", *MEMORY[0x24BE047F0]);
    v18 = objc_msgSend(v11, "aa_isAccountClass:", v16);
    if (!v17)
      goto LABEL_36;
    v19 = v18;
    _HKInitializeLogging();
    v20 = (os_log_t *)MEMORY[0x24BDD3068];
    v21 = *MEMORY[0x24BDD3068];
    v22 = *MEMORY[0x24BDD3068];
    if ((v19 & 1) != 0)
    {
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        goto LABEL_13;
      *(_DWORD *)buf = 138543362;
      v62 = self;
      v23 = "%{public}@: Standard primary account save.";
      v24 = v21;
      v25 = OS_LOG_TYPE_INFO;
    }
    else
    {
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_DWORD *)buf = 138543362;
      v62 = self;
      v23 = "%{public}@: Primary account added or promoted.";
      v24 = v21;
      v25 = OS_LOG_TYPE_DEFAULT;
    }
    _os_log_impl(&dword_230F20000, v24, v25, v23, buf, 0xCu);
LABEL_13:
    v26 = *MEMORY[0x24BDB3E18];
    v27 = objc_msgSend(v13, "isEnabledForDataclass:", *MEMORY[0x24BDB3E18]);
    v28 = objc_msgSend(v11, "isEnabledForDataclass:", v26);
    _HKInitializeLogging();
    v29 = *v20;
    if (os_log_type_enabled(*v20, OS_LOG_TYPE_INFO))
    {
      v30 = CFSTR("NO");
      if (v27)
        v31 = CFSTR("YES");
      else
        v31 = CFSTR("NO");
      *(_DWORD *)buf = 138543874;
      v62 = self;
      v64 = v31;
      v63 = 2112;
      if (v28)
        v30 = CFSTR("YES");
      v65 = 2112;
      v66 = v30;
      _os_log_impl(&dword_230F20000, v29, OS_LOG_TYPE_INFO, "%{public}@: IS Health enabled: %@. WAS health enabled: %@.", buf, 0x20u);
    }
    if (!v27 || (v28 & v19 & 1) != 0)
      goto LABEL_36;
    _HKInitializeLogging();
    v32 = *v20;
    if (os_log_type_enabled(*v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v62 = self;
      _os_log_impl(&dword_230F20000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ Handle account changes after dataclass enabled", buf, 0xCu);
    }
    v33 = objc_alloc_init(MEMORY[0x24BDD3C40]);
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD39E8]), "initWithHealthStore:", v33);
    v60[0] = MEMORY[0x24BDAC760];
    v60[1] = 3221225472;
    v60[2] = sub_230F2202C;
    v60[3] = &unk_24FFB3658;
    v60[4] = self;
    objc_msgSend(v34, "accountConfigurationDidChangeWithCompletion:", v60);
    objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v35, "isiPad"))
      goto LABEL_34;
    objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
    v54 = v34;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "features");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "stanley");

    v34 = v54;
    if (!v38)
    {
LABEL_35:

LABEL_36:
      goto LABEL_37;
    }
    v39 = objc_alloc(MEMORY[0x24BDD3C98]);
    v35 = (void *)objc_msgSend(v39, "initWithCategory:domainName:healthStore:", 3, *MEMORY[0x24BDD4630], v33);
    v40 = (const __CFString *)(id)*MEMORY[0x24BDD4628];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0;
    v42 = objc_msgSend(v35, "setDate:forKey:error:", v41, v40, &v59);
    v53 = (__CFString *)v59;

    if ((v42 & 1) == 0)
    {
      _HKInitializeLogging();
      v43 = *MEMORY[0x24BDD3068];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3068], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v62 = self;
        v63 = 2114;
        v64 = v40;
        v65 = 2114;
        v66 = v53;
        _os_log_error_impl(&dword_230F20000, v43, OS_LOG_TYPE_ERROR, "%{public}@: Unable to persist %{public}@: %{public}@", buf, 0x20u);
      }
    }
    v52 = v40;
    v44 = (id)*MEMORY[0x24BDD4640];
    v58 = 0;
    objc_msgSend(v35, "dateForKey:error:", v44, &v58);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v58;
    v51 = v44;
    if (v46)
    {
      _HKInitializeLogging();
      v47 = *MEMORY[0x24BDD2FD0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FD0], OS_LOG_TYPE_ERROR))
        sub_230F22284((uint64_t)self, (uint64_t)v46, v47);
    }
    else
    {
      if (!v45)
      {
        v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3DA8]), "initWithClientIdentifier:healthStore:", CFSTR("NewDeviceSetup"), v33);
        v55[0] = MEMORY[0x24BDAC760];
        v55[1] = 3221225472;
        v55[2] = sub_230F22118;
        v55[3] = &unk_24FFB3680;
        v55[4] = self;
        v56 = v35;
        v57 = v51;
        v48 = v35;
        objc_msgSend(v49, "sendNewDeviceNotificationWithMessageKind:completion:", 0, v55);

        v35 = (void *)v52;
        goto LABEL_33;
      }
      _HKInitializeLogging();
      v50 = *MEMORY[0x24BDD2FD0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FD0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v62 = self;
        _os_log_impl(&dword_230F20000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@: User previously notified of this device. Not doing anything", buf, 0xCu);
      }
    }

    v49 = v51;
    v48 = (__CFString *)v52;
LABEL_33:

    v34 = v54;
LABEL_34:

    goto LABEL_35;
  }
LABEL_37:

}

@end
