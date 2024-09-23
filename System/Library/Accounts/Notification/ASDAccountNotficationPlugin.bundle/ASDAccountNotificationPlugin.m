@implementation ASDAccountNotificationPlugin

- (BOOL)account:(id)a3 willChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  id v9;
  id v10;
  int v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  char v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  dispatch_semaphore_t v24;
  NSObject *v25;
  dispatch_time_t v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  const char *v31;
  void *v32;
  void *v34;
  id v35;
  id v36;
  _QWORD v37[5];
  NSObject *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  int v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a6;
  if ((objc_msgSend(v9, "ams_isSandboxAccount") & 1) == 0 && (objc_msgSend(v10, "ams_isSandboxAccount") & 1) == 0)
  {
    if ((sub_230EE66E8((uint64_t)ASDAccountNotificationPlugin, v9, v10) & 1) != 0)
    {
      v11 = objc_msgSend(v9, "isActive");
      v12 = objc_msgSend(v10, "isActive");
      ASDLogHandleForCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = (void *)objc_opt_class();
        v36 = v14;
        objc_msgSend(v9, "ams_DSID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "ams_DSID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v40 = v14;
        v41 = 2112;
        v42 = v15;
        v43 = 1024;
        v44 = v11;
        v45 = 2114;
        v46 = v16;
        v47 = 1024;
        v48 = v12;
        _os_log_impl(&dword_230EE5000, v13, OS_LOG_TYPE_INFO, "[%{public}@] willChangeWithType account: %@ active: %d oldAccount: %{public}@ oldActive: %d", buf, 0x2Cu);

      }
      v17 = v12 ^ 1;
      if (!v9)
        v17 = 1;
      if (v17)
        v18 = v9 == 0;
      else
        v18 = v11 ^ 1;
      ASDLogHandleForCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if ((v18 & 1) != 0)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v21 = (void *)objc_opt_class();
          v22 = v21;
          objc_msgSend(v10, "ams_DSID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v40 = v21;
          v41 = 2114;
          v42 = v23;
          v43 = 1024;
          v44 = a4;
          _os_log_impl(&dword_230EE5000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Handling post signout for account: %{public}@ changeType: %u", buf, 0x1Cu);

        }
        v20 = objc_alloc_init(MEMORY[0x24BE04568]);
        v24 = dispatch_semaphore_create(0);
        v37[0] = MEMORY[0x24BDAC760];
        v37[1] = 3221225472;
        v37[2] = sub_230EE6798;
        v37[3] = &unk_24FFA5F38;
        v37[4] = self;
        v25 = v24;
        v38 = v25;
        -[NSObject sbsyncIfSubscribedWithAccount:completionBlock:](v20, "sbsyncIfSubscribedWithAccount:completionBlock:", v10, v37);
        v26 = dispatch_time(0, 5000000000);
        if (dispatch_semaphore_wait(v25, v26))
        {
          ASDLogHandleForCategory();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            v34 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543362;
            v40 = v34;
            v35 = v34;
            _os_log_error_impl(&dword_230EE5000, v27, OS_LOG_TYPE_ERROR, "[%{public}@]: Timed out attempting to sbsync", buf, 0xCu);

          }
        }

        goto LABEL_25;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v32 = (void *)objc_opt_class();
        v29 = v32;
        objc_msgSend(v10, "ams_DSID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v40 = v32;
        v41 = 2114;
        v42 = v30;
        v43 = 1024;
        v44 = a4;
        v31 = "[%{public}@] Not performing signout sbsync for account: %{public}@ changeType: %u";
        goto LABEL_24;
      }
      goto LABEL_25;
    }
    if (v10)
    {
      ASDLogHandleForCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v28 = (void *)objc_opt_class();
        v29 = v28;
        objc_msgSend(v10, "ams_DSID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v40 = v28;
        v41 = 2114;
        v42 = v30;
        v43 = 1024;
        v44 = a4;
        v31 = "[%{public}@] Not processing signout for account: %{public}@ changeType: %u";
LABEL_24:
        _os_log_impl(&dword_230EE5000, v20, OS_LOG_TYPE_INFO, v31, buf, 0x1Cu);

      }
LABEL_25:

    }
  }

  return 0;
}

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  int v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  NSObject *v40;
  void *v41;
  id v42;
  void *v43;
  int v44;
  NSObject *v45;
  int v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  const __CFString *v65;
  void *v66;
  id v67;
  id v68;
  _QWORD v69[2];
  _QWORD v70[2];
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  _BYTE v76[14];
  __int16 v77;
  int v78;
  const __CFString *v79;
  _QWORD v80[2];

  v80[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a6;
  if ((objc_msgSend(v8, "ams_isSandboxAccount") & 1) == 0 && !objc_msgSend(v9, "ams_isSandboxAccount"))
  {
    if (!sub_230EE66E8((uint64_t)ASDAccountNotificationPlugin, v8, v9))
      goto LABEL_54;
    if (a4 == 2)
    {
      objc_msgSend(v9, "username");
      v24 = objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        v25 = (void *)v24;
        objc_msgSend(v8, "username");
        v26 = objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          v27 = (void *)v26;
          objc_msgSend(v9, "username");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "username");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v28, "isEqualToString:", v29);

          if ((v30 & 1) != 0)
            goto LABEL_22;
          ASDLogHandleForCategory();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v32 = (void *)objc_opt_class();
            v33 = v32;
            objc_msgSend(v9, "ams_DSID");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v72 = v32;
            v73 = 2114;
            v74 = v34;
            _os_log_impl(&dword_230EE5000, v31, OS_LOG_TYPE_DEFAULT, "[%{public}@] Handling Apple ID change for account: %{public}@", buf, 0x16u);

          }
          objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.appstored.ASDAppleIDDidChangeNotification"), 0, 0, 1);
        }

      }
    }
LABEL_22:
    v35 = objc_msgSend(v8, "isActive");
    v36 = objc_msgSend(v9, "isActive");
    v37 = v36;
    if (a4 == 1)
      v38 = v35;
    else
      v38 = 0;
    if (a4 == 2)
      v39 = v35 & (v36 ^ 1);
    else
      v39 = 0;
    v44 = v38 | v39;
    ASDLogHandleForCategory();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      v46 = v44;
      v47 = v37;
      v48 = (void *)objc_opt_class();
      v68 = v48;
      objc_msgSend(v8, "ams_DSID");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "ams_DSID");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v72 = v48;
      v37 = v47;
      v44 = v46;
      v73 = 2112;
      v74 = v49;
      v75 = 1024;
      *(_DWORD *)v76 = v35;
      *(_WORD *)&v76[4] = 2114;
      *(_QWORD *)&v76[6] = v50;
      v77 = 1024;
      v78 = v37;
      _os_log_impl(&dword_230EE5000, v45, OS_LOG_TYPE_INFO, "[%{public}@] didChangeWithType account: %@ active: %d oldAccount: %{public}@ oldActive: %d", buf, 0x2Cu);

    }
    if (v44)
    {
      ASDLogHandleForCategory();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        v52 = (void *)objc_opt_class();
        v53 = v52;
        objc_msgSend(v8, "ams_DSID");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v72 = v52;
        v73 = 2114;
        v74 = v54;
        _os_log_impl(&dword_230EE5000, v51, OS_LOG_TYPE_DEFAULT, "[%{public}@] Handling iTunes account changed to: %{public}@", buf, 0x16u);

      }
      objc_msgSend(v8, "ams_DSID");
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      if (v55)
      {
        v69[0] = CFSTR("DSID");
        objc_msgSend(v8, "ams_DSID");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v69[1] = CFSTR("active");
        v70[0] = v56;
        v70[1] = MEMORY[0x24BDBD1C8];
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v70, v69, 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v17 = &unk_24FFA65D8;
      }
    }
    else
    {
      if (v8 && ((v37 ^ 1 | v35) & 1) != 0)
        goto LABEL_54;
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", &unk_24FFA6600);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      ASDLogHandleForCategory();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        v58 = (void *)objc_opt_class();
        v59 = v58;
        objc_msgSend(v8, "ams_DSID");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v72 = v58;
        v73 = 2114;
        v74 = v60;
        v75 = 1024;
        *(_DWORD *)v76 = a4;
        _os_log_impl(&dword_230EE5000, v57, OS_LOG_TYPE_DEFAULT, "[%{public}@] Handling iTunes account change to not active: %{public}@ changeType: %u", buf, 0x1Cu);

      }
      objc_msgSend(v8, "ams_DSID");
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      if (v61)
      {
        objc_msgSend(v8, "ams_DSID");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v62, CFSTR("DSID"));

      }
      objc_msgSend(v17, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("signout"));
    }
    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v63;
    v65 = CFSTR("com.apple.appstored.ASDItunesAccountDidChangeNotification");
LABEL_52:
    objc_msgSend(v63, "postNotificationName:object:userInfo:deliverImmediately:", v65, 0, v17, 1);

LABEL_53:
    goto LABEL_54;
  }
  if (a4 == 1)
  {
    ASDLogHandleForCategory();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      v41 = (void *)objc_opt_class();
      v42 = v41;
      objc_msgSend(v8, "ams_DSID");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v72 = v41;
      v73 = 2114;
      v74 = v43;
      _os_log_impl(&dword_230EE5000, v40, OS_LOG_TYPE_DEFAULT, "[%{public}@] Handling sandbox account added for account: %{public}@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.appstored.ASDSandboxAccountDidChangeNotification"), 0, 0, 1);
    goto LABEL_53;
  }
  if (a4 == 2)
  {
    ASDLogHandleForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_opt_class();
      v12 = v11;
      objc_msgSend(v9, "ams_DSID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ams_DSID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v72 = v11;
      v73 = 2114;
      v74 = v13;
      v75 = 2114;
      *(_QWORD *)v76 = v14;
      _os_log_impl(&dword_230EE5000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Handling sandbox account modification from account: %{public}@ to new account: %{public}@", buf, 0x20u);

    }
    v15 = objc_msgSend(v8, "isActive");
    v16 = objc_msgSend(v9, "isActive");
    v17 = 0;
    if ((v15 & 1) == 0 && v16)
    {
      objc_msgSend(v9, "ams_DSID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      ASDLogHandleForCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v18)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v21 = (void *)objc_opt_class();
          v22 = v21;
          objc_msgSend(v9, "ams_DSID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v72 = v21;
          v73 = 2114;
          v74 = v23;
          _os_log_impl(&dword_230EE5000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Handling sandbox account signed out: %{public}@", buf, 0x16u);

        }
        v79 = CFSTR("AccountDidChangePreviousActiveDSID");
        objc_msgSend(v9, "ams_DSID");
        v20 = objc_claimAutoreleasedReturnValue();
        v80[0] = v20;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v80, &v79, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v66 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543362;
          v72 = v66;
          v67 = v66;
          _os_log_error_impl(&dword_230EE5000, v20, OS_LOG_TYPE_ERROR, "[%{public}@] Sandbox account signed out without a DSID.", buf, 0xCu);

        }
        v17 = 0;
      }

    }
    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v63;
    v65 = CFSTR("com.apple.appstored.ASDSandboxAccountDidChangeNotification");
    goto LABEL_52;
  }
LABEL_54:

}

@end
