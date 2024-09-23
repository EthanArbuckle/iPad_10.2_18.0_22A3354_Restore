@implementation NSURL(AppleMediaServices_Project)

- (uint64_t)ams_isBagLoadURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", 0x1E254C100);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", 0x1E254C120);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hasSuffix:", v5);
  if (v6)
  {
    objc_msgSend(a1, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", v8) & 1) != 0)
    {
      v9 = 1;
LABEL_9:

      goto LABEL_10;
    }
    v15 = v8;
    v17 = v7;
  }
  objc_msgSend(a1, "host", v15, v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "host");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "hasSuffix:", v11))
  {
    objc_msgSend(a1, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v12, "isEqualToString:", v13);

  }
  else
  {
    v9 = 0;
  }

  v8 = v16;
  v7 = v18;
  if (v6)
    goto LABEL_9;
LABEL_10:

  return v9;
}

- (uint64_t)ams_isSecure
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("https"));

  return v2;
}

+ (id)ams_realHomeDirectory
{
  uint64_t v1;
  uint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  int v19;
  int v20;
  char *v21;
  uid_t v22;
  int v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  _BOOL4 v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  char *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  char *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  int v68;
  void *v69;
  void *v70;
  int v71;
  void *v73;
  uint64_t v74;
  void (**v75)(void);
  _QWORD aBlock[5];
  passwd *v77;
  uint8_t v78[4];
  void *v79;
  __int16 v80;
  uid_t v81;
  __int16 v82;
  uint64_t v83;
  __int16 v84;
  int v85;
  passwd buf;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v3 = sysconf(71);
  if (v3 == -1)
  {
    v4 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v4)
    {
      if (!v5)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v6, "OSLogObject");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        AMSLogKey();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x1E0CB3940];
        v10 = objc_opt_class();
        v11 = v10;
        if (v8)
        {
          AMSLogKey();
          v1 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: [%@] "), v11, v1);
        }
        else
        {
          objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: "), v10);
        }
        v12 = (char *)objc_claimAutoreleasedReturnValue();
        v19 = *__error();
        LODWORD(buf.pw_name) = 138543618;
        *(char **)((char *)&buf.pw_name + 4) = v12;
        WORD2(buf.pw_passwd) = 1026;
        *(_DWORD *)((char *)&buf.pw_passwd + 6) = v19;
        _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to query sysconf for buffer size using _SC_GETPW_R_SIZE_MAX. errno = %{public}d", (uint8_t *)&buf, 0x12u);
        if (v8)
        {

          v12 = (char *)v1;
        }

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v13, 0);
    }
    else
    {
      if (!v5)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v6, "OSLogObject");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        AMSLogKey();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x1E0CB3940];
        v16 = objc_opt_class();
        v17 = v16;
        if (v14)
        {
          AMSLogKey();
          v1 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stringWithFormat:", CFSTR("%@: [%@] "), v17, v1);
        }
        else
        {
          objc_msgSend(v15, "stringWithFormat:", CFSTR("%@: "), v16);
        }
        v18 = (char *)objc_claimAutoreleasedReturnValue();
        v20 = *__error();
        LODWORD(buf.pw_name) = 138543618;
        *(char **)((char *)&buf.pw_name + 4) = v18;
        WORD2(buf.pw_passwd) = 1026;
        *(_DWORD *)((char *)&buf.pw_passwd + 6) = v20;
        _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_FAULT, "%{public}@Failed to query sysconf for buffer size using _SC_GETPW_R_SIZE_MAX. errno = %{public}d", (uint8_t *)&buf, 0x12u);
        if (v14)
        {

          v18 = (char *)v1;
        }

      }
    }

    v3 = 4096;
  }
  v21 = (char *)malloc_type_malloc(v3, 0x95827033uLL);
  if (v21)
  {
    memset(&buf, 0, sizeof(buf));
    v77 = 0;
    v22 = getuid();
    v23 = getpwuid_r(v22, &buf, v21, v3, &v77);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__NSURL_AppleMediaServices_Project__ams_realHomeDirectory__block_invoke;
    aBlock[3] = &__block_descriptor_40_e5_v8__0l;
    aBlock[4] = v21;
    v75 = (void (**)(void))_Block_copy(aBlock);
    if (v23)
    {
      if (+[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests"))
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v24)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v24, "OSLogObject");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          AMSLogKey();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = (void *)MEMORY[0x1E0CB3940];
          if (v26)
          {
            v28 = objc_opt_class();
            AMSLogKey();
            a1 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "stringWithFormat:", CFSTR("%@: [%@] "), v28, a1);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
          }
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v78 = 138544130;
          v79 = v29;
          v80 = 1026;
          v81 = v22;
          v82 = 2050;
          v83 = v3;
          v84 = 1026;
          v85 = v23;
          _os_log_impl(&dword_18C849000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to get the real home directory path. getpwuid_r failed for UID %{public}d. bufferSize = %{public}zu | status = %{public}d", v78, 0x22u);
          if (v26)
          {

            v29 = (void *)a1;
          }

        }
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v42 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v42, 0);
      }
      else
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v41)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v41, "OSLogObject");
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
        {
          AMSLogKey();
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = (void *)MEMORY[0x1E0CB3940];
          if (v43)
          {
            v45 = objc_opt_class();
            AMSLogKey();
            a1 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "stringWithFormat:", CFSTR("%@: [%@] "), v45, a1);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
          }
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v78 = 138544130;
          v79 = v46;
          v80 = 1026;
          v81 = v22;
          v82 = 2050;
          v83 = v3;
          v84 = 1026;
          v85 = v23;
          _os_log_impl(&dword_18C849000, v42, OS_LOG_TYPE_FAULT, "%{public}@Failed to get the real home directory path. getpwuid_r failed for UID %{public}d. bufferSize = %{public}zu | status = %{public}d", v78, 0x22u);
          if (v43)
          {

            v46 = (void *)a1;
          }

        }
      }
      goto LABEL_110;
    }
    if (v77)
    {
      if (buf.pw_dir)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_111:
        v75[2]();

        return v40;
      }
      if (+[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests"))
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v54)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v54, "OSLogObject");
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          AMSLogKey();
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = (void *)MEMORY[0x1E0CB3940];
          if (v60)
          {
            v62 = objc_opt_class();
            AMSLogKey();
            a1 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "stringWithFormat:", CFSTR("%@: [%@] "), v62, a1);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
          }
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v78 = 138543618;
          v79 = v63;
          v80 = 1026;
          v81 = v22;
          _os_log_impl(&dword_18C849000, v55, OS_LOG_TYPE_ERROR, "%{public}@Failed to get the real home directory path. getpwuid_r found a user for UID %{public}d, but pw_dir is NULL.", v78, 0x12u);
          if (v60)
          {

            v63 = (void *)a1;
          }

        }
LABEL_96:

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v42 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v42, 0);
LABEL_110:

        v40 = 0;
        goto LABEL_111;
      }
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v41)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v41, "OSLogObject");
      v42 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
        goto LABEL_110;
      AMSLogKey();
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = (void *)MEMORY[0x1E0CB3940];
      if (v64)
      {
        v74 = objc_opt_class();
        AMSLogKey();
        a1 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "stringWithFormat:", CFSTR("%@: [%@] "), v74, a1);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
      }
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v78 = 138543618;
      v79 = v67;
      v80 = 1026;
      v81 = v22;
      _os_log_impl(&dword_18C849000, v42, OS_LOG_TYPE_FAULT, "%{public}@Failed to get the real home directory path. getpwuid_r found a user for UID %{public}d, but pw_dir is NULL.", v78, 0x12u);
      if (v64)
      {

        v67 = (void *)a1;
      }
    }
    else
    {
      if (+[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests"))
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v54)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v54, "OSLogObject");
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          AMSLogKey();
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = (void *)MEMORY[0x1E0CB3940];
          if (v56)
          {
            v58 = objc_opt_class();
            AMSLogKey();
            a1 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "stringWithFormat:", CFSTR("%@: [%@] "), v58, a1);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
          }
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v78 = 138543618;
          v79 = v59;
          v80 = 1026;
          v81 = v22;
          _os_log_impl(&dword_18C849000, v55, OS_LOG_TYPE_ERROR, "%{public}@Failed to get the real home directory path. getpwuid_r did not find a user for UID %{public}d.", v78, 0x12u);
          if (v56)
          {

            v59 = (void *)a1;
          }

        }
        goto LABEL_96;
      }
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v41)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v41, "OSLogObject");
      v42 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
        goto LABEL_110;
      AMSLogKey();
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = (void *)MEMORY[0x1E0CB3940];
      if (v64)
      {
        v66 = objc_opt_class();
        AMSLogKey();
        a1 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "stringWithFormat:", CFSTR("%@: [%@] "), v66, a1);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
      }
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v78 = 138543618;
      v79 = v67;
      v80 = 1026;
      v81 = v22;
      _os_log_impl(&dword_18C849000, v42, OS_LOG_TYPE_FAULT, "%{public}@Failed to get the real home directory path. getpwuid_r did not find a user for UID %{public}d.", v78, 0x12u);
      if (v64)
      {

        v67 = (void *)a1;
      }
    }

    goto LABEL_110;
  }
  v30 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)v31;
  if (v30)
  {
    if (!v31)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v32, "OSLogObject");
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)MEMORY[0x1E0CB3940];
      v36 = objc_opt_class();
      v37 = v36;
      if (v34)
      {
        AMSLogKey();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "stringWithFormat:", CFSTR("%@: [%@] "), v37, v38);
        v39 = (char *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v35, "stringWithFormat:", CFSTR("%@: "), v36);
        v39 = (char *)objc_claimAutoreleasedReturnValue();
        v38 = v39;
      }
      v68 = *__error();
      LODWORD(buf.pw_name) = 138543874;
      *(char **)((char *)&buf.pw_name + 4) = v39;
      WORD2(buf.pw_passwd) = 2050;
      *(char **)((char *)&buf.pw_passwd + 6) = (char *)v3;
      HIWORD(buf.pw_gid) = 1026;
      LODWORD(buf.pw_change) = v68;
      _os_log_impl(&dword_18C849000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to allocate buffer for getpwuid_r(). bufferSize = %{public}zu, errno = %{public}d", (uint8_t *)&buf, 0x1Cu);
      if (v34)

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v70, 0);

  }
  else
  {
    if (!v31)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v32, "OSLogObject");
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
    {
      AMSLogKey();
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = (void *)MEMORY[0x1E0CB3940];
      v50 = objc_opt_class();
      v51 = v50;
      if (v48)
      {
        AMSLogKey();
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "stringWithFormat:", CFSTR("%@: [%@] "), v51, v52);
        v53 = (char *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v49, "stringWithFormat:", CFSTR("%@: "), v50);
        v53 = (char *)objc_claimAutoreleasedReturnValue();
        v52 = v53;
      }
      v71 = *__error();
      LODWORD(buf.pw_name) = 138543874;
      *(char **)((char *)&buf.pw_name + 4) = v53;
      WORD2(buf.pw_passwd) = 2050;
      *(char **)((char *)&buf.pw_passwd + 6) = (char *)v3;
      HIWORD(buf.pw_gid) = 1026;
      LODWORD(buf.pw_change) = v71;
      _os_log_impl(&dword_18C849000, v47, OS_LOG_TYPE_FAULT, "%{public}@Failed to allocate buffer for getpwuid_r(). bufferSize = %{public}zu, errno = %{public}d", (uint8_t *)&buf, 0x1Cu);
      if (v48)

    }
  }
  return 0;
}

- (id)ams_URLBySortingQueryParameters
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", a1, 0);
  objc_msgSend(v2, "percentEncodedQueryItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(a1, "_sortedQueryItemsFromQueryItems:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setPercentEncodedQueryItems:", v4);

    objc_msgSend(a1, "fragment");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5
      && (v6 = (void *)v5,
          objc_msgSend(a1, "fragment"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "isEqualToString:", &stru_1E2548760),
          v7,
          v6,
          (v8 & 1) == 0))
    {
      objc_msgSend(a1, "fragment");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setFragment:", v10);

    }
    else
    {
      objc_msgSend(v2, "setFragment:", 0);
    }
    objc_msgSend(v2, "URL");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = (void *)v11;
    else
      v13 = a1;
    v9 = v13;

  }
  else
  {
    v9 = a1;
  }

  return v9;
}

- (uint64_t)_sortedQueryItemsFromQueryItems:()AppleMediaServices_Project
{
  return objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_111);
}

- (id)ams_URLByReplacingQueryItems:()AppleMediaServices_Project withEncodedParameters:
{
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (objc_class *)MEMORY[0x1E0CB3998];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithURL:resolvingAgainstBaseURL:", a1, 0);
  v9 = v8;
  if (a4)
    objc_msgSend(v8, "setPercentEncodedQueryItems:", v7);
  else
    objc_msgSend(v8, "setQueryItems:", v7);

  objc_msgSend(v9, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)ams_URLByAppendingQueryParameters:()AppleMediaServices_Project preservingQueryEncoding:
{
  void *v6;
  void *v7;

  objc_msgSend(a3, "ams_arrayUsingTransform:", &__block_literal_global_96_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ams_URLByAppendingQueryItems:preservingQueryEncoding:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (uint64_t)ams_URLByAppendingQueryParameters:()AppleMediaServices_Project
{
  return objc_msgSend(a1, "ams_URLByAppendingQueryParameters:preservingQueryEncoding:", a3, 0);
}

- (id)ams_URLByAppendingQueryItems:()AppleMediaServices_Project preservingQueryEncoding:
{
  id v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(MEMORY[0x1E0C99E98], "_isAppendWithUnmodifiedParametersFeatureFlagEnabled");
  v35 = a1;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", a1, 0);
  v34 = v8;
  if ((v7 & 1) != 0 || (a4 & 1) != 0)
    goto LABEL_6;
  +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.Music")))
  {

LABEL_6:
    objc_msgSend(v8, "percentEncodedQueryItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 1;
    goto LABEL_7;
  }
  +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.TVMusic"));

  if (v13)
    goto LABEL_6;
  objc_msgSend(v8, "queryItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
LABEL_7:
  v16 = (void *)MEMORY[0x1E0C9AA60];
  if (v14)
    v16 = v14;
  v17 = v16;

  v33 = v17;
  objc_msgSend(v17, "ams_filterUsingTest:", &__block_literal_global_103);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v6;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v38 != v22)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        if ((_DWORD)v15)
        {
          v25 = (void *)MEMORY[0x1E0CB39D8];
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "name");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "value");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "ams_URLQueryAllowedCharacterSet");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "stringByAddingPercentEncodingWithAllowedCharacters:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "queryItemWithName:value:", v26, v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "addObject:", v30);
        }
        else
        {
          objc_msgSend(v19, "addObject:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i));
        }
      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v21);
  }

  objc_msgSend(v35, "ams_URLByReplacingQueryItems:withEncodedParameters:", v19, v15);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

+ (uint64_t)_isAppendWithUnmodifiedParametersFeatureFlagEnabled
{
  return _os_feature_enabled_impl();
}

- (uint64_t)ams_isHTTP
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(a1, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("http")) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(a1, "scheme");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "isEqualToString:", CFSTR("https"));

  }
  return v3;
}

- (id)ams_schemeSwizzledURL
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v1 = a1;
  objc_msgSend(v1, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E25B0188);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E25B01A0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "containsObject:", v2) & 1) != 0)
  {
    v5 = CFSTR("http");
LABEL_5:
    objc_msgSend(v1, "absoluteString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "substringFromIndex:", objc_msgSend(v2, "length"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v9;
    goto LABEL_6;
  }
  if (objc_msgSend(v4, "containsObject:", v2))
  {
    v5 = CFSTR("https");
    goto LABEL_5;
  }
LABEL_6:

  return v1;
}

- (id)ams_URLQueryAllowedCharacterSet
{
  if (qword_1ECEADA78 != -1)
    dispatch_once(&qword_1ECEADA78, &__block_literal_global_149);
  return (id)_MergedGlobals_161;
}

- (id)ams_URLByAppendingQueryParameter:()AppleMediaServices_Project name:
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13[0] = a3;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "ams_URLByAppendingQueryParameters:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)ams_URLByDeletingTrailingSlash
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "absoluteString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "hasSuffix:", CFSTR("/")))
  {
    objc_msgSend(v2, "substringToIndex:", objc_msgSend(v2, "length") - 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = a1;
  }

  return v4;
}

- (id)ams_URLByReplacingSchemeWithScheme:()AppleMediaServices_Project
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v6, "length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)ams_URLByReplaceingQueryParameters:()AppleMediaServices_Project withEncodedParameters:
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v6 = (objc_class *)MEMORY[0x1E0C99DE8];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __94__NSURL_AppleMediaServices_Project__ams_URLByReplaceingQueryParameters_withEncodedParameters___block_invoke;
  v12[3] = &unk_1E25420D0;
  v13 = v8;
  v9 = v8;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v12);

  objc_msgSend(a1, "ams_URLByReplacingQueryItems:withEncodedParameters:", v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
