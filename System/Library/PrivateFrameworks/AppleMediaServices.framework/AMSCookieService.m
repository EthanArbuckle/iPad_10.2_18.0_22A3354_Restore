@implementation AMSCookieService

- (id)getCookiePropertiesForAccount:(id)a3 cookieDatabaseOnly:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v9;
  id v10;
  Class v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  AMSDaemonConnection *v24;
  id v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  _QWORD v92[6];
  id v93;
  _QWORD v94[6];
  uint64_t v95;
  id *v96;
  uint64_t v97;
  uint64_t (*v98)(uint64_t, uint64_t);
  void (*v99)(uint64_t);
  id v100;
  uint8_t v101[4];
  void *v102;
  __int16 v103;
  void *v104;
  _BYTE buf[24];
  uint64_t (*v106)(uint64_t, uint64_t);
  void (*v107)(uint64_t);
  id v108;
  uint64_t v109;

  v6 = a4;
  v109 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (v6
    || (-[AMSCookieService _cachedCookiePropertiesForAccount:](self, "_cachedCookiePropertiesForAccount:", v9),
        (v10 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v95 = 0;
    v96 = (id *)&v95;
    v97 = 0x3032000000;
    v98 = __Block_byref_object_copy__23;
    v99 = __Block_byref_object_dispose__23;
    v100 = 0;
    if (objc_msgSend((id)objc_opt_class(), "_isEntitledForDirectCookieAccess"))
    {
      v11 = NSClassFromString(CFSTR("AMSDCookieService"));
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[objc_class performSelector:](v11, "performSelector:", sel_sharedService);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v106 = __Block_byref_object_copy__23;
        v107 = __Block_byref_object_dispose__23;
        v108 = 0;
        v94[0] = MEMORY[0x1E0C809B0];
        v94[1] = 3221225472;
        v94[2] = __75__AMSCookieService_getCookiePropertiesForAccount_cookieDatabaseOnly_error___block_invoke;
        v94[3] = &unk_1E25405C8;
        v94[4] = buf;
        v94[5] = &v95;
        objc_msgSend(v12, "getCookiePropertiesForAccount:cookieDatabaseOnly:withCompletion:", v9, v6, v94);
        if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
        {
          if (+[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests"))
          {
            +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v13)
            {
              +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v13, "OSLogObject");
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              AMSLogKey();
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = (void *)MEMORY[0x1E0CB3940];
              v17 = objc_opt_class();
              if (v15)
              {
                AMSLogKey();
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v17, v18, v19);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                NSStringFromSelector(a2);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "stringWithFormat:", CFSTR("%@: %@ "), v17, v18);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = v20;
              }
              AMSLogableError(*(void **)(*(_QWORD *)&buf[8] + 40));
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v101 = 138543618;
              v102 = v20;
              v103 = 2114;
              v104 = v77;
              _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "%{public}@Process is entitled for direct cookie access, Failed to retrieve cookies. error = %{public}@", v101, 0x16u);
              if (v15)

            }
            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
            v60 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v60, 0);
          }
          else
          {
            +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v59)
            {
              +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v59, "OSLogObject");
            v60 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
            {
              AMSLogKey();
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              v62 = (void *)MEMORY[0x1E0CB3940];
              v63 = objc_opt_class();
              if (v61)
              {
                AMSLogKey();
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v62, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v63, v64, v65);
                v66 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                NSStringFromSelector(a2);
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v62, "stringWithFormat:", CFSTR("%@: %@ "), v63, v64);
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                v65 = v66;
              }
              AMSLogableError(*(void **)(*(_QWORD *)&buf[8] + 40));
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v101 = 138543618;
              v102 = v66;
              v103 = 2114;
              v104 = v78;
              _os_log_impl(&dword_18C849000, v60, OS_LOG_TYPE_FAULT, "%{public}@Process is entitled for direct cookie access, Failed to retrieve cookies. error = %{public}@", v101, 0x16u);
              if (v61)

            }
          }

          if (a5)
            *a5 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
        }
        _Block_object_dispose(buf, 8);

      }
      else
      {
        if (+[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests"))
        {
          +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v33)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v33, "OSLogObject");
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            AMSLogKey();
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = (void *)MEMORY[0x1E0CB3940];
            v37 = objc_opt_class();
            if (v35)
            {
              AMSLogKey();
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              a2 = (SEL)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v37, v38, a2);
            }
            else
            {
              NSStringFromSelector(a2);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "stringWithFormat:", CFSTR("%@: %@ "), v37, v38);
            }
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v39;
            _os_log_impl(&dword_18C849000, v34, OS_LOG_TYPE_ERROR, "%{public}@Process is entitled for direct cookie access, does not respond to sharedService selector", buf, 0xCu);
            if (v35)
            {

              v39 = (void *)a2;
            }

          }
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
          v41 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v41, 0);
        }
        else
        {
          +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v40)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v40, "OSLogObject");
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
          {
            AMSLogKey();
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = (void *)MEMORY[0x1E0CB3940];
            v44 = objc_opt_class();
            if (v42)
            {
              AMSLogKey();
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              a2 = (SEL)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v44, v45, a2);
            }
            else
            {
              NSStringFromSelector(a2);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "stringWithFormat:", CFSTR("%@: %@ "), v44, v45);
            }
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v46;
            _os_log_impl(&dword_18C849000, v41, OS_LOG_TYPE_FAULT, "%{public}@Process is entitled for direct cookie access, does not respond to sharedService selector", buf, 0xCu);
            if (v42)
            {

              v46 = (void *)a2;
            }

          }
        }

        if (a5)
        {
          AMSError(0, CFSTR("Method Not Found"), CFSTR("Either cookie service class is Nil or it does not respond to +sharedService."), 0);
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
    }
    else if (-[AMSCookieService _useInMemoryCacheForAccount:](self, "_useInMemoryCacheForAccount:", v9))
    {
      -[AMSCookieService _cachedCookiePropertiesForAccount:](self, "_cachedCookiePropertiesForAccount:", v9);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      if (v21)
        v23 = (void *)v21;
      else
        v23 = (void *)MEMORY[0x1E0C9AA60];
      objc_storeStrong(v96 + 5, v23);

    }
    else
    {
      v24 = objc_alloc_init(AMSDaemonConnection);
      v93 = 0;
      -[AMSDaemonConnection cookieServiceProxySyncWithError:](v24, "cookieServiceProxySyncWithError:", &v93);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v93;
      if (v25)
      {
        v26 = v25;
        if (+[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests"))
        {
          +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v27)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v27, "OSLogObject");
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            AMSLogKey();
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = (void *)MEMORY[0x1E0CB3940];
            if (v87)
            {
              v30 = objc_opt_class();
              AMSLogKey();
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v30, v83, v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v73 = objc_opt_class();
              NSStringFromSelector(a2);
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "stringWithFormat:", CFSTR("%@: %@ "), v73, v83);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = v32;
            }
            AMSLogableError(v26);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v32;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v74;
            _os_log_impl(&dword_18C849000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to get XPC proxy object for cookie service. error = %{public}@", buf, 0x16u);
            if (v87)

          }
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
          v54 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v54, 0);
        }
        else
        {
          +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v53)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v53, "OSLogObject");
          v54 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
          {
            AMSLogKey();
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = (void *)MEMORY[0x1E0CB3940];
            if (v89)
            {
              v56 = objc_opt_class();
              AMSLogKey();
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v56, v85, v57);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v75 = objc_opt_class();
              NSStringFromSelector(a2);
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "stringWithFormat:", CFSTR("%@: %@ "), v75, v85);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              v57 = v58;
            }
            AMSLogableError(v26);
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v58;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v76;
            _os_log_impl(&dword_18C849000, v54, OS_LOG_TYPE_FAULT, "%{public}@Failed to get XPC proxy object for cookie service. error = %{public}@", buf, 0x16u);
            if (v89)

          }
        }

        if (a5)
          *a5 = objc_retainAutorelease(v26);

        v10 = 0;
        goto LABEL_109;
      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v106 = __Block_byref_object_copy__23;
      v107 = __Block_byref_object_dispose__23;
      v108 = 0;
      v92[0] = MEMORY[0x1E0C809B0];
      v92[1] = 3221225472;
      v92[2] = __75__AMSCookieService_getCookiePropertiesForAccount_cookieDatabaseOnly_error___block_invoke_28;
      v92[3] = &unk_1E25405C8;
      v92[4] = buf;
      v92[5] = &v95;
      objc_msgSend(v91, "getCookiePropertiesForAccount:cookieDatabaseOnly:withCompletion:", v9, v6, v92);

      if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
      {
        if (+[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests"))
        {
          +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v47)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v47, "OSLogObject");
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            AMSLogKey();
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = (void *)MEMORY[0x1E0CB3940];
            v50 = objc_opt_class();
            if (v88)
            {
              AMSLogKey();
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v50, v84, v51);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              NSStringFromSelector(a2);
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "stringWithFormat:", CFSTR("%@: %@ "), v50, v84);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = v52;
            }
            AMSLogableError(*(void **)(*(_QWORD *)&buf[8] + 40));
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v101 = 138543618;
            v102 = v52;
            v103 = 2114;
            v104 = v79;
            _os_log_impl(&dword_18C849000, v48, OS_LOG_TYPE_ERROR, "%{public}@Failed to get cookies from cookie service over XPC. error = %{public}@", v101, 0x16u);
            if (v88)

          }
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
          v68 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v68, 0);
        }
        else
        {
          +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v67)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v67, "OSLogObject");
          v68 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_FAULT))
          {
            AMSLogKey();
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = (void *)MEMORY[0x1E0CB3940];
            v70 = objc_opt_class();
            if (v90)
            {
              AMSLogKey();
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v69, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v70, v86, v71);
              v72 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              NSStringFromSelector(a2);
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v69, "stringWithFormat:", CFSTR("%@: %@ "), v70, v86);
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              v71 = v72;
            }
            AMSLogableError(*(void **)(*(_QWORD *)&buf[8] + 40));
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v101 = 138543618;
            v102 = v72;
            v103 = 2114;
            v104 = v80;
            _os_log_impl(&dword_18C849000, v68, OS_LOG_TYPE_FAULT, "%{public}@Failed to get cookies from cookie service over XPC. error = %{public}@", v101, 0x16u);
            if (v90)

          }
        }

        if (a5)
          *a5 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
      }
      if (!v6)
      {
        v81 = v96[5];
        if (v81)
          -[AMSCookieService _cacheCookieProperties:forAccount:](self, "_cacheCookieProperties:forAccount:", v81, v9);
        else
          -[AMSCookieService clearCookiePropertyCacheForAccount:](self, "clearCookiePropertyCacheForAccount:", v9);
      }
      _Block_object_dispose(buf, 8);

    }
    v10 = v96[5];
LABEL_109:
    _Block_object_dispose(&v95, 8);

  }
  return v10;
}

+ (AMSCookieService)sharedService
{
  if (_MergedGlobals_92 != -1)
    dispatch_once(&_MergedGlobals_92, &__block_literal_global_33);
  return (AMSCookieService *)(id)qword_1ECEAD068;
}

- (BOOL)_useInMemoryCacheForAccount:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (+[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests"))
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "ams_isEphemeralAccount");

  return v4;
}

+ (BOOL)_isEntitledForDirectCookieAccess
{
  void *v2;
  void *v3;
  char v4;

  +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.amsaccountsd"));

  return v4;
}

void __33__AMSCookieService_sharedService__block_invoke()
{
  AMSCookieService *v0;
  void *v1;

  v0 = objc_alloc_init(AMSCookieService);
  v1 = (void *)qword_1ECEAD068;
  qword_1ECEAD068 = (uint64_t)v0;

}

- (AMSCookieService)init
{
  AMSCookieService *v2;
  NSCache *v3;
  NSCache *inMemoryStorage;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMSCookieService;
  v2 = -[AMSCookieService init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    inMemoryStorage = v2->_inMemoryStorage;
    v2->_inMemoryStorage = v3;

    -[NSCache setDelegate:](v2->_inMemoryStorage, "setDelegate:", v2);
    -[NSCache setName:](v2->_inMemoryStorage, "setName:", CFSTR("AMSCookieService.inMemoryCache"));
    v2->_inMemoryStorageLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = objc_opt_class();
    if (v7)
    {
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      a2 = (SEL)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v9, v10, a2);
    }
    else
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: %@ "), v9, v10);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v13 = v11;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEBUG, "%{public}@In-memory cache is evicting an object.", buf, 0xCu);
    if (v7)
    {

      v11 = (void *)a2;
    }

  }
}

- (void)_unregisterFromCookieChangeNotifications
{
  uint64_t v2;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = objc_opt_class();
    if (v7)
    {
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v2 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v9, v10, v2);
    }
    else
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: %@ "), v9, v10);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v28 = v11;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Unregistering from cookie change notifications.", buf, 0xCu);
    if (v7)
    {

      v11 = (void *)v2;
    }

  }
  os_unfair_lock_assert_owner(&self->_inMemoryStorageLock);
  if (-[AMSCookieService isObservingNotifications](self, "isObservingNotifications"))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.AppleMediaServices.cookieschanged"), 0);
    +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      AMSLogKey();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0CB3940];
      v17 = objc_opt_class();
      if (v15)
      {
        AMSLogKey();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        a2 = (SEL)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v17, v18, a2);
      }
      else
      {
        NSStringFromSelector(a2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("%@: %@ "), v17, v18);
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v19;
      _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Unregistered from cookie change notifications.", buf, 0xCu);
      if (v15)
      {

        v19 = (void *)a2;
      }

    }
    -[AMSCookieService setIsObservingNotifications:](self, "setIsObservingNotifications:", 0);
  }
  else
  {
    +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v20, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      AMSLogKey();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x1E0CB3940];
      v24 = objc_opt_class();
      if (v22)
      {
        AMSLogKey();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        a2 = (SEL)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v24, v25, a2);
      }
      else
      {
        NSStringFromSelector(a2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", CFSTR("%@: %@ "), v24, v25);
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v26;
      _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_DEBUG, "%{public}@We weren’t registered, nothing to do.", buf, 0xCu);
      if (v22)
      {

        v26 = (void *)a2;
      }

    }
  }
}

- (void)clearCookiePropertyCacheForAccount:(id)a3
{
  void *v3;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD);
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v46;
  _QWORD aBlock[5];
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v46 = a3;
  +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = objc_opt_class();
    if (v7)
    {
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v9, v10, v11);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: %@ "), v9, v10);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v3;
    }
    objc_msgSend(v46, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v49 = v3;
    v50 = 2114;
    v51 = v13;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Clearing cookie cache for account with identifier: %{public}@", buf, 0x16u);

    if (v7)
  }

  os_unfair_lock_assert_not_owner(&self->_inMemoryStorageLock);
  os_unfair_lock_lock(&self->_inMemoryStorageLock);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__AMSCookieService_clearCookiePropertyCacheForAccount___block_invoke;
  aBlock[3] = &unk_1E253DBD8;
  aBlock[4] = self;
  v14 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[AMSCookieService inMemoryStorage](self, "inMemoryStorage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDelegate:", 0);

  -[AMSCookieService inMemoryStorage](self, "inMemoryStorage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeObjectForKey:", v17);

  -[AMSCookieService inMemoryStorage](self, "inMemoryStorage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDelegate:", self);

  +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v19, "OSLogObject");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    AMSLogKey();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1E0CB3940];
    v23 = objc_opt_class();
    if (v21)
    {
      AMSLogKey();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v23, v24, v3);
    }
    else
    {
      NSStringFromSelector(a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("%@: %@ "), v23, v24);
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v49 = v25;
    _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Account entries removed from cache.", buf, 0xCu);
    if (v21)
    {

      v25 = v3;
    }

  }
  -[AMSCookieService inMemoryStorage](self, "inMemoryStorage");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "allObjects");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "count") == 0;

  if (v28)
  {
    +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v37)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v37, "OSLogObject");
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      AMSLogKey();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)MEMORY[0x1E0CB3940];
      if (v39)
      {
        v41 = objc_opt_class();
        AMSLogKey();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v43 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v41, v42, v43);
      }
      else
      {
        v43 = objc_opt_class();
        NSStringFromSelector(a2);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "stringWithFormat:", CFSTR("%@: %@ "), v43, v42);
      }
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v44;
      _os_log_impl(&dword_18C849000, v38, OS_LOG_TYPE_DEBUG, "%{public}@Cache is now empty. Unregistering from cookie change notifications.", buf, 0xCu);
      if (v39)
      {

        v44 = (void *)v43;
      }

    }
    -[AMSCookieService _unregisterFromCookieChangeNotifications](self, "_unregisterFromCookieChangeNotifications");
  }
  else
  {
    +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v29)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v29, "OSLogObject");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      AMSLogKey();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)MEMORY[0x1E0CB3940];
      if (v31)
      {
        v33 = objc_opt_class();
        AMSLogKey();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v35 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v33, v34, v35);
      }
      else
      {
        v35 = objc_opt_class();
        NSStringFromSelector(a2);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "stringWithFormat:", CFSTR("%@: %@ "), v35, v34);
      }
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v36;
      _os_log_impl(&dword_18C849000, v30, OS_LOG_TYPE_DEBUG, "%{public}@Cache is not empty. Not unregistering from cookie change notifications.", buf, 0xCu);
      if (v31)
      {

        v36 = (void *)v35;
      }

    }
  }
  v14[2](v14);

}

- (void)_registerForCookieChangeNotifications
{
  uint64_t v2;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = objc_opt_class();
    if (v7)
    {
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v2 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v9, v10, v2);
    }
    else
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: %@ "), v9, v10);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v28 = v11;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Registering for cookie change notifications.", buf, 0xCu);
    if (v7)
    {

      v11 = (void *)v2;
    }

  }
  os_unfair_lock_assert_owner(&self->_inMemoryStorageLock);
  if (-[AMSCookieService isObservingNotifications](self, "isObservingNotifications"))
  {
    +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      AMSLogKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0CB3940];
      v16 = objc_opt_class();
      if (v14)
      {
        AMSLogKey();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        a2 = (SEL)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v16, v17, a2);
      }
      else
      {
        NSStringFromSelector(a2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("%@: %@ "), v16, v17);
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v18;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEBUG, "%{public}@We’re already registered, nothing to do.", buf, 0xCu);
      if (v14)
      {

        v18 = (void *)a2;
      }

    }
  }
  else
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)HandleCookiesChangedNotification, CFSTR("com.apple.AppleMediaServices.cookieschanged"), 0, (CFNotificationSuspensionBehavior)0);
    +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v20, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      AMSLogKey();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x1E0CB3940];
      v24 = objc_opt_class();
      if (v22)
      {
        AMSLogKey();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        a2 = (SEL)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v24, v25, a2);
      }
      else
      {
        NSStringFromSelector(a2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", CFSTR("%@: %@ "), v24, v25);
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v26;
      _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_DEBUG, "%{public}@Registered for cookie change notifications.", buf, 0xCu);
      if (v22)
      {

        v26 = (void *)a2;
      }

    }
    -[AMSCookieService setIsObservingNotifications:](self, "setIsObservingNotifications:", 1);
  }
}

- (void)_cacheCookieProperties:(id)a3 forAccount:(id)a4
{
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD);
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v34;
  id v35;
  _QWORD aBlock[5];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  v35 = a4;
  +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = objc_opt_class();
    if (v8)
    {
      AMSLogKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: %@ "), v10, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v13;
    }
    objc_msgSend(v35, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v38 = v13;
    v39 = 2114;
    v40 = v15;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Caching cookies for account with identifier: %{public}@", buf, 0x16u);

    if (v8)
  }

  os_unfair_lock_assert_not_owner(&self->_inMemoryStorageLock);
  os_unfair_lock_lock(&self->_inMemoryStorageLock);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__AMSCookieService__cacheCookieProperties_forAccount___block_invoke;
  aBlock[3] = &unk_1E253DBD8;
  aBlock[4] = self;
  v16 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[AMSCookieService inMemoryStorage](self, "inMemoryStorage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", v34, v18);

  +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v19, "OSLogObject");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    AMSLogKey();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1E0CB3940];
    v23 = objc_opt_class();
    if (v21)
    {
      AMSLogKey();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v23, v24, v18);
    }
    else
    {
      NSStringFromSelector(a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("%@: %@ "), v23, v24);
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v38 = v25;
    _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Account cookies added to cache.", buf, 0xCu);
    if (v21)
    {

      v25 = v18;
    }

  }
  if (!-[AMSCookieService isObservingNotifications](self, "isObservingNotifications"))
  {
    +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v26, "OSLogObject");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      AMSLogKey();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)MEMORY[0x1E0CB3940];
      v30 = objc_opt_class();
      if (v28)
      {
        AMSLogKey();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v30, v31, v18);
      }
      else
      {
        NSStringFromSelector(a2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "stringWithFormat:", CFSTR("%@: %@ "), v30, v31);
      }
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v32;
      _os_log_impl(&dword_18C849000, v27, OS_LOG_TYPE_DEBUG, "%{public}@We were not previously observing cookie change notifications, registering for them.", buf, 0xCu);
      if (v28)
      {

        v32 = v18;
      }

    }
    -[AMSCookieService _registerForCookieChangeNotifications](self, "_registerForCookieChangeNotifications");
  }
  v16[2](v16);

}

- (id)_cachedCookiePropertiesForAccount:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  BOOL v36;
  void *v37;
  void *v38;
  void (**v41)(void);
  id v42;
  id v43;
  _QWORD aBlock[5];
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v43 = a3;
  +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = objc_opt_class();
    if (v6)
    {
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v8, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: %@ "), v8, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v11;
    }
    objc_msgSend(v43, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v46 = v11;
    v47 = 2114;
    v48 = (uint64_t)v13;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Reading in-memory-cached cookies for account with identifier: %{public}@", buf, 0x16u);

    if (v6)
  }

  os_unfair_lock_assert_not_owner(&self->_inMemoryStorageLock);
  os_unfair_lock_lock(&self->_inMemoryStorageLock);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__AMSCookieService__cachedCookiePropertiesForAccount___block_invoke;
  aBlock[3] = &unk_1E253DBD8;
  aBlock[4] = self;
  v41 = (void (**)(void))_Block_copy(aBlock);
  -[AMSCookieService inMemoryStorage](self, "inMemoryStorage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v15);
  v42 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v42, "count"))
  {
    +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      AMSLogKey();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0CB3940];
      v20 = objc_opt_class();
      if (v18)
      {
        AMSLogKey();
        v21 = objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v20, v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        NSStringFromSelector(a2);
        v21 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringWithFormat:", CFSTR("%@: %@ "), v20, v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v23;
      }
      v30 = objc_msgSend(v42, "count");
      objc_msgSend(v43, "identifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)v18;
      v34 = (void *)v21;
      v35 = v33;
      v36 = v33 == 0;
      *(_DWORD *)buf = 138543874;
      v46 = v23;
      v47 = 2048;
      v48 = v30;
      v49 = 2114;
      v50 = v32;
      _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Found %lu cookies for account with identifier: %{public}@", buf, 0x20u);

      if (!v36)
    }
  }
  else
  {
    +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      AMSLogKey();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x1E0CB3940];
      v26 = objc_opt_class();
      if (v24)
      {
        AMSLogKey();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v26, v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        NSStringFromSelector(a2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringWithFormat:", CFSTR("%@: %@ "), v26, v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v29;
      }
      objc_msgSend(v43, "identifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v46 = v29;
      v47 = 2114;
      v48 = (uint64_t)v38;
      _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Did not find any cached cookies for account with identifier: %{public}@.", buf, 0x16u);

      if (v24)
    }
  }

  v41[2]();
  return v42;
}

- (NSCache)inMemoryStorage
{
  return (NSCache *)objc_getProperty(self, a2, 16, 1);
}

void __54__AMSCookieService__cachedCookiePropertiesForAccount___block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
}

- (BOOL)isObservingNotifications
{
  return self->_isObservingNotifications;
}

void __54__AMSCookieService__cacheCookieProperties_forAccount___block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
}

- (void)setIsObservingNotifications:(BOOL)a3
{
  self->_isObservingNotifications = a3;
}

void __55__AMSCookieService_clearCookiePropertyCacheForAccount___block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
}

void __44__AMSCookieService_clearCookiePropertyCache__block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
}

id __110__AMSCookieService_updateCookiesWithCookiePropertiesToAdd_cookiePropertiesToRemove_forAccount_withCompletion___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  AMSBinaryPromise *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = a2;
  v4 = objc_alloc_init(AMSBinaryPromise);
  v5 = a1[4];
  v6 = a1[5];
  v7 = a1[6];
  -[AMSBinaryPromise completionHandlerAdapter](v4, "completionHandlerAdapter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateCookiesWithCookiePropertiesToAdd:cookiePropertiesToRemove:forAccount:withCompletion:", v5, v6, v7, v8);

  -[AMSBinaryPromise promiseAdapter](v4, "promiseAdapter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)updateCookiesWithCookiePropertiesToAdd:(id)a3 cookiePropertiesToRemove:(id)a4 forAccount:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, uint64_t, _QWORD);
  Class v14;
  void (**v15)(_QWORD);
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  void (**v28)(id, uint64_t, _QWORD);
  uint64_t *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  AMSDaemonConnection *v39;
  _QWORD aBlock[6];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, uint64_t, _QWORD))a6;
  if (objc_msgSend((id)objc_opt_class(), "_isEntitledForDirectCookieAccess"))
  {
    v14 = NSClassFromString(CFSTR("AMSDCookieService"));
    NSSelectorFromString(CFSTR("sharedService"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[objc_class performSelector:](v14, "performSelector:", sel_sharedService);
      v15 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "updateCookiesWithCookiePropertiesToAdd:cookiePropertiesToRemove:forAccount:withCompletion:", v10, v11, v12, v13);
LABEL_12:

    }
  }
  else
  {
    if (-[AMSCookieService _useInMemoryCacheForAccount:](self, "_useInMemoryCacheForAccount:", v12))
    {
      os_unfair_lock_assert_not_owner(&self->_inMemoryStorageLock);
      os_unfair_lock_lock(&self->_inMemoryStorageLock);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __110__AMSCookieService_updateCookiesWithCookiePropertiesToAdd_cookiePropertiesToRemove_forAccount_withCompletion___block_invoke;
      aBlock[3] = &unk_1E253DBD8;
      aBlock[4] = self;
      v15 = (void (**)(_QWORD))_Block_copy(aBlock);
      -[AMSCookieService inMemoryStorage](self, "inMemoryStorage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKey:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (id)objc_msgSend(v18, "mutableCopy");

      if (!v19)
        v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v19, "addObjectsFromArray:", v10);
      objc_msgSend(v19, "removeObjectsInArray:", v11);
      if (objc_msgSend(v19, "count"))
      {
        -[AMSCookieService inMemoryStorage](self, "inMemoryStorage");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v19, "copy");
        objc_msgSend(v12, "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKey:", v21, v22);

      }
      else
      {
        -[AMSCookieService inMemoryStorage](self, "inMemoryStorage");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "removeObjectForKey:", v21);
      }

      v13[2](v13, 1, 0);
      v15[2](v15);
      goto LABEL_12;
    }
    -[AMSCookieService clearCookiePropertyCacheForAccount:](self, "clearCookiePropertyCacheForAccount:", v12);
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__23;
    v38 = __Block_byref_object_dispose__23;
    v39 = objc_alloc_init(AMSDaemonConnection);
    objc_msgSend((id)v35[5], "cookieServiceProxy");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __110__AMSCookieService_updateCookiesWithCookiePropertiesToAdd_cookiePropertiesToRemove_forAccount_withCompletion___block_invoke_2;
    v30[3] = &unk_1E25405F0;
    v31 = v10;
    v32 = v11;
    v33 = v12;
    objc_msgSend(v23, "thenWithBlock:", v30);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "binaryPromiseAdapter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27[0] = v24;
    v27[1] = 3221225472;
    v27[2] = __110__AMSCookieService_updateCookiesWithCookiePropertiesToAdd_cookiePropertiesToRemove_forAccount_withCompletion___block_invoke_3;
    v27[3] = &unk_1E2540618;
    v29 = &v34;
    v28 = v13;
    objc_msgSend(v26, "resultWithCompletion:", v27);

    _Block_object_dispose(&v34, 8);
  }

}

- (void)clearCookiePropertyCache
{
  uint64_t v2;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD aBlock[5];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = objc_opt_class();
    if (v7)
    {
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v2 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v9, v10, v2);
    }
    else
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: %@ "), v9, v10);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v25 = v11;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Clearing cookie cache.", buf, 0xCu);
    if (v7)
    {

      v11 = (void *)v2;
    }

  }
  os_unfair_lock_assert_not_owner(&self->_inMemoryStorageLock);
  os_unfair_lock_lock(&self->_inMemoryStorageLock);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__AMSCookieService_clearCookiePropertyCache__block_invoke;
  aBlock[3] = &unk_1E253DBD8;
  aBlock[4] = self;
  v12 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[AMSCookieService inMemoryStorage](self, "inMemoryStorage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDelegate:", 0);

  -[AMSCookieService inMemoryStorage](self, "inMemoryStorage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeAllObjects");

  -[AMSCookieService inMemoryStorage](self, "inMemoryStorage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDelegate:", self);

  +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v16, "OSLogObject");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    AMSLogKey();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0CB3940];
    v20 = objc_opt_class();
    if (v18)
    {
      AMSLogKey();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      a2 = (SEL)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v20, v21, a2);
    }
    else
    {
      NSStringFromSelector(a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("%@: %@ "), v20, v21);
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v25 = v22;
    _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Cache cleared. Unregistering from cookie change notifications.", buf, 0xCu);
    if (v18)
    {

      v22 = (void *)a2;
    }

  }
  -[AMSCookieService _unregisterFromCookieChangeNotifications](self, "_unregisterFromCookieChangeNotifications");
  v12[2](v12);

}

- (void)clearDanglingCookieDatabasesWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, id);
  Class v5;
  AMSDaemonConnection *v6;
  void *v7;
  id v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, id))a3;
  v5 = NSClassFromString(CFSTR("AMSDCookieService"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[objc_class performSelector:](v5, "performSelector:", sel_sharedService);
    v6 = (AMSDaemonConnection *)objc_claimAutoreleasedReturnValue();
    -[AMSDaemonConnection clearDanglingCookieDatabasesWithCompletion:](v6, "clearDanglingCookieDatabasesWithCompletion:", v4);
  }
  else
  {
    v6 = objc_alloc_init(AMSDaemonConnection);
    v35 = 0;
    -[AMSDaemonConnection cookieServiceProxySyncWithError:](v6, "cookieServiceProxySyncWithError:", &v35);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v35;
    if (v8)
    {
      v9 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
      +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v9)
      {
        if (!v10)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v11, "OSLogObject");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          AMSLogKey();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)MEMORY[0x1E0CB3940];
          v15 = objc_opt_class();
          if (v13)
          {
            AMSLogKey();
            v30 = v14;
            v16 = v13;
            v17 = objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v32 = objc_claimAutoreleasedReturnValue();
            v33 = (void *)v17;
            v28 = v17;
            v13 = v16;
            objc_msgSend(v30, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v15, v28, v32);
          }
          else
          {
            NSStringFromSelector(a2);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "stringWithFormat:", CFSTR("%@: %@ "), v15, v33);
          }
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          AMSLogableError(v8);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v37 = v18;
          v38 = 2114;
          v39 = v26;
          _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to get XPC proxy object for cookie service. error = %{public}@", buf, 0x16u);
          if (v13)
          {

            v18 = (void *)v32;
          }

        }
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
        v19 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v19, 0);
      }
      else
      {
        if (!v10)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v11, "OSLogObject");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          AMSLogKey();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)MEMORY[0x1E0CB3940];
          v22 = objc_opt_class();
          if (v20)
          {
            AMSLogKey();
            v31 = v21;
            v23 = v20;
            v24 = objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v32 = objc_claimAutoreleasedReturnValue();
            v34 = (void *)v24;
            v29 = v24;
            v20 = v23;
            objc_msgSend(v31, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v22, v29, v32);
          }
          else
          {
            NSStringFromSelector(a2);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "stringWithFormat:", CFSTR("%@: %@ "), v22, v34);
          }
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          AMSLogableError(v8);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v37 = v25;
          v38 = 2114;
          v39 = v27;
          _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_FAULT, "%{public}@Failed to get XPC proxy object for cookie service. error = %{public}@", buf, 0x16u);
          if (v20)
          {

            v25 = (void *)v32;
          }

        }
      }

      v4[2](v4, 0, v8);
    }
    else
    {
      objc_msgSend(v7, "clearDanglingCookieDatabasesWithCompletion:", v4);
    }

  }
}

- (void)getCookieDatabasePathForAccount:(id)a3 withCompletion:(id)a4
{
  id v7;
  Class v8;
  AMSDaemonConnection *v9;
  id v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  _QWORD v63[5];
  id v64;
  _BYTE *v65;
  SEL v66;
  id v67;
  _QWORD v68[5];
  id v69;
  SEL v70;
  _BYTE buf[24];
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v62 = a3;
  v7 = a4;
  if (objc_msgSend((id)objc_opt_class(), "_isEntitledForDirectCookieAccess"))
  {
    v8 = NSClassFromString(CFSTR("AMSDCookieService"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[objc_class performSelector:](v8, "performSelector:", sel_sharedService);
      v9 = (AMSDaemonConnection *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v68[0] = MEMORY[0x1E0C809B0];
        v68[1] = 3221225472;
        v68[2] = __67__AMSCookieService_getCookieDatabasePathForAccount_withCompletion___block_invoke;
        v68[3] = &unk_1E2540578;
        v68[4] = self;
        v70 = a2;
        v69 = v7;
        -[AMSDaemonConnection getCookieDatabasePathForAccount:withCompletion:](v9, "getCookieDatabasePathForAccount:withCompletion:", v62, v68);

      }
      else
      {
        v41 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
        +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
        v42 = objc_claimAutoreleasedReturnValue();
        v43 = (void *)v42;
        if ((_DWORD)v41)
        {
          if (!v42)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v43, "OSLogObject");
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            AMSLogKey();
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = (void *)MEMORY[0x1E0CB3940];
            v47 = objc_opt_class();
            if (v45)
            {
              AMSLogKey();
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v41 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v47, v48, v41);
            }
            else
            {
              NSStringFromSelector(a2);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "stringWithFormat:", CFSTR("%@: %@ "), v47, v48);
            }
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v49;
            _os_log_impl(&dword_18C849000, v44, OS_LOG_TYPE_ERROR, "%{public}@Failed to get XPC proxy object for cookie service.", buf, 0xCu);
            if (v45)
            {

              v49 = (void *)v41;
            }

          }
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
          v50 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v50, 0);
        }
        else
        {
          if (!v42)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v43, "OSLogObject");
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
          {
            AMSLogKey();
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = (void *)MEMORY[0x1E0CB3940];
            v53 = objc_opt_class();
            if (v51)
            {
              AMSLogKey();
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v41 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v53, v54, v41);
            }
            else
            {
              NSStringFromSelector(a2);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "stringWithFormat:", CFSTR("%@: %@ "), v53, v54);
            }
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v55;
            _os_log_impl(&dword_18C849000, v50, OS_LOG_TYPE_FAULT, "%{public}@Failed to get XPC proxy object for cookie service.", buf, 0xCu);
            if (v51)
            {

              v55 = (void *)v41;
            }

          }
        }

        AMSError(0, 0, 0, 0);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v58);

        v9 = 0;
      }
    }
    else
    {
      v20 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
      +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      if ((_DWORD)v20)
      {
        if (!v21)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v22, "OSLogObject");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          AMSLogKey();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)MEMORY[0x1E0CB3940];
          v26 = objc_opt_class();
          if (v24)
          {
            AMSLogKey();
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v20 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v26, v27, v20);
          }
          else
          {
            NSStringFromSelector(a2);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "stringWithFormat:", CFSTR("%@: %@ "), v26, v27);
          }
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v28;
          _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_ERROR, "%{public}@Process is entitled for direct cookie access, does not respond to sharedService selector", buf, 0xCu);
          if (v24)
          {

            v28 = (void *)v20;
          }

        }
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
        v35 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v35, 0);
      }
      else
      {
        if (!v21)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v22, "OSLogObject");
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
        {
          AMSLogKey();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = (void *)MEMORY[0x1E0CB3940];
          v38 = objc_opt_class();
          if (v36)
          {
            AMSLogKey();
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v20 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v38, v39, v20);
          }
          else
          {
            NSStringFromSelector(a2);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "stringWithFormat:", CFSTR("%@: %@ "), v38, v39);
          }
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v40;
          _os_log_impl(&dword_18C849000, v35, OS_LOG_TYPE_FAULT, "%{public}@Process is entitled for direct cookie access, does not respond to sharedService selector", buf, 0xCu);
          if (v36)
          {

            v40 = (void *)v20;
          }

        }
      }

      AMSError(0, CFSTR("Method Not Found"), CFSTR("Either cookie service class is Nil or it does not respond to +sharedService."), 0);
      v9 = (AMSDaemonConnection *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, AMSDaemonConnection *))v7 + 2))(v7, 0, v9);
    }
  }
  else
  {
    v9 = objc_alloc_init(AMSDaemonConnection);
    v67 = 0;
    -[AMSDaemonConnection cookieServiceProxySyncWithError:](v9, "cookieServiceProxySyncWithError:", &v67);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v67;
    if (v10)
    {
      v11 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
      +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v11)
      {
        if (!v12)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v13, "OSLogObject");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          AMSLogKey();
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)MEMORY[0x1E0CB3940];
          v16 = objc_opt_class();
          if (v59)
          {
            AMSLogKey();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v16, v17, v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            NSStringFromSelector(a2);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "stringWithFormat:", CFSTR("%@: %@ "), v16, v17);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v19;
          }
          AMSLogableError(v10);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v19;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v56;
          _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to get XPC proxy object for cookie service. error = %{public}@", buf, 0x16u);
          if (v59)

        }
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
        v29 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v29, 0);
      }
      else
      {
        if (!v12)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v13, "OSLogObject");
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        {
          AMSLogKey();
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (void *)MEMORY[0x1E0CB3940];
          v31 = objc_opt_class();
          if (v60)
          {
            AMSLogKey();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v31, v32, v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            NSStringFromSelector(a2);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "stringWithFormat:", CFSTR("%@: %@ "), v31, v32);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v34;
          }
          AMSLogableError(v10);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v34;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v57;
          _os_log_impl(&dword_18C849000, v29, OS_LOG_TYPE_FAULT, "%{public}@Failed to get XPC proxy object for cookie service. error = %{public}@", buf, 0x16u);
          if (v60)

        }
      }

      (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v10);
    }
    else
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v72 = __Block_byref_object_copy__23;
      v73 = __Block_byref_object_dispose__23;
      v74 = 0;
      v63[0] = MEMORY[0x1E0C809B0];
      v63[1] = 3221225472;
      v63[2] = __67__AMSCookieService_getCookieDatabasePathForAccount_withCompletion___block_invoke_26;
      v63[3] = &unk_1E25405A0;
      v65 = buf;
      v66 = a2;
      v63[4] = self;
      v64 = v7;
      objc_msgSend(v61, "getCookieDatabasePathForAccount:withCompletion:", v62, v63);

      _Block_object_dispose(buf, 8);
    }

  }
}

void __67__AMSCookieService_getCookieDatabasePathForAccount_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _BOOL4 v7;
  _UNKNOWN **v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
    v8 = &off_1E2519000;
    +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v7)
    {
      if (!v9)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v10, "OSLogObject");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        AMSLogKey();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x1E0CB3940];
        v14 = objc_opt_class();
        if (v12)
        {
          AMSLogKey();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(*(SEL *)(a1 + 48));
          v25 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v14, v15, v25);
        }
        else
        {
          NSStringFromSelector(*(SEL *)(a1 + 48));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: %@ "), v14, v15);
        }
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(v6);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v16;
        v28 = 2114;
        v29 = v23;
        _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@Process is entitled for direct cookie access, Failed to retrieve cookie database path. error = %{public}@", buf, 0x16u);
        if (v12)
        {

          v16 = (void *)v25;
        }

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v17, 0);
    }
    else
    {
      if (!v9)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v10, "OSLogObject");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        AMSLogKey();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)MEMORY[0x1E0CB3940];
        v20 = objc_opt_class();
        if (v18)
        {
          AMSLogKey();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(*(SEL *)(a1 + 48));
          v8 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v20, v21, v8);
        }
        else
        {
          NSStringFromSelector(*(SEL *)(a1 + 48));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringWithFormat:", CFSTR("%@: %@ "), v20, v21);
        }
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(v6);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v22;
        v28 = 2114;
        v29 = v24;
        _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_FAULT, "%{public}@Process is entitled for direct cookie access, Failed to retrieve cookie database path. error = %{public}@", buf, 0x16u);
        if (v18)
        {

          v22 = v8;
        }

      }
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __67__AMSCookieService_getCookieDatabasePathForAccount_withCompletion___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _BOOL4 v7;
  _UNKNOWN **v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v7 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
    v8 = &off_1E2519000;
    +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v7)
    {
      if (!v9)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v10, "OSLogObject");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        AMSLogKey();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x1E0CB3940];
        v14 = objc_opt_class();
        if (v12)
        {
          AMSLogKey();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(*(SEL *)(a1 + 56));
          v25 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v14, v15, v25);
        }
        else
        {
          NSStringFromSelector(*(SEL *)(a1 + 56));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: %@ "), v14, v15);
        }
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(v6);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v16;
        v28 = 2114;
        v29 = v23;
        _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to get cookies from cookie service over XPC. error = %{public}@", buf, 0x16u);
        if (v12)
        {

          v16 = (void *)v25;
        }

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v17, 0);
    }
    else
    {
      if (!v9)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v10, "OSLogObject");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        AMSLogKey();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)MEMORY[0x1E0CB3940];
        v20 = objc_opt_class();
        if (v18)
        {
          AMSLogKey();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(*(SEL *)(a1 + 56));
          v8 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v20, v21, v8);
        }
        else
        {
          NSStringFromSelector(*(SEL *)(a1 + 56));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringWithFormat:", CFSTR("%@: %@ "), v20, v21);
        }
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(v6);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v22;
        v28 = 2114;
        v29 = v24;
        _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_FAULT, "%{public}@Failed to get cookies from cookie service over XPC. error = %{public}@", buf, 0x16u);
        if (v18)
        {

          v22 = v8;
        }

      }
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)getCookiePropertiesForAccount:(id)a3 withCompletion:(id)a4
{
  -[AMSCookieService getCookiePropertiesForAccount:cookieDatabaseOnly:withCompletion:](self, "getCookiePropertiesForAccount:cookieDatabaseOnly:withCompletion:", a3, 0, a4);
}

- (void)getCookiePropertiesForAccount:(id)a3 cookieDatabaseOnly:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL8 v5;
  void (**v8)(id, void *, id);
  void *v9;
  id v10;
  id v11;

  v5 = a4;
  v11 = 0;
  v8 = (void (**)(id, void *, id))a5;
  -[AMSCookieService getCookiePropertiesForAccount:cookieDatabaseOnly:error:](self, "getCookiePropertiesForAccount:cookieDatabaseOnly:error:", a3, v5, &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v11;
  v8[2](v8, v9, v10);

}

- (id)getCookiePropertiesForAccount:(id)a3 error:(id *)a4
{
  return -[AMSCookieService getCookiePropertiesForAccount:cookieDatabaseOnly:error:](self, "getCookiePropertiesForAccount:cookieDatabaseOnly:error:", a3, 0, a4);
}

void __75__AMSCookieService_getCookiePropertiesForAccount_cookieDatabaseOnly_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = v5;
  }
  else
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = v11;
  }
  v9 = v8;
  v10 = *v7;
  *v7 = v9;

}

void __75__AMSCookieService_getCookiePropertiesForAccount_cookieDatabaseOnly_error___block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = v5;
  }
  else
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = v11;
  }
  v9 = v8;
  v10 = *v7;
  *v7 = v9;

}

void __110__AMSCookieService_updateCookiesWithCookiePropertiesToAdd_cookiePropertiesToRemove_forAccount_withCompletion___block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
}

void __110__AMSCookieService_updateCookiesWithCookiePropertiesToAdd_cookiePropertiesToRemove_forAccount_withCompletion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;
  v6 = a3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (os_unfair_lock_s)inMemoryStorageLock
{
  return self->_inMemoryStorageLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inMemoryStorage, 0);
}

@end
