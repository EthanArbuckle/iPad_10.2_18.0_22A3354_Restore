@implementation AMSAppleCardSilentEnrollment

+ (id)gsTokenForAccount:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE buf[24];
  void *v25;
  uint64_t *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "accountStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v7 = (void **)qword_1ECEACF20;
  v23 = qword_1ECEACF20;
  if (!qword_1ECEACF20)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getAppleIDAuthenticationAppleIDSettingsTokenIdentifierSymbolLoc_block_invoke;
    v25 = &unk_1E253DDB8;
    v26 = &v20;
    __getAppleIDAuthenticationAppleIDSettingsTokenIdentifierSymbolLoc_block_invoke((uint64_t)buf);
    v7 = (void **)v21[3];
  }
  _Block_object_dispose(&v20, 8);
  if (!v7)
  {
    dlerror();
    abort_report_np();
    __break(1u);
  }
  v8 = *v7;
  v19 = 0;
  v9 = v8;
  objc_msgSend(v6, "ams_fetchGrandSlamTokenForAccount:withIdentifier:error:", v5, v9, &v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v19;

  if (v10)
  {
    if (!a4)
      goto LABEL_13;
    goto LABEL_12;
  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v12, "OSLogObject");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = (void *)objc_opt_class();
    v15 = v14;
    AMSSetLogKeyIfNeeded();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v16;
    _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] GS-Token lookup failed for no GS token", buf, 0x16u);

  }
  AMSError(7, CFSTR("Silent Enrollment Error"), CFSTR("No GS Token"), 0);
  v17 = objc_claimAutoreleasedReturnValue();

  v11 = (id)v17;
  if (a4)
LABEL_12:
    *a4 = objc_retainAutorelease(v11);
LABEL_13:

  return v10;
}

+ (id)headersForAccount:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  BOOL v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  AMSSetLogKeyIfNeeded();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v20 = 0;
  objc_msgSend(a1, "gsTokenForAccount:error:", v4, &v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v20;
  if (v8)
    v9 = 1;
  else
    v9 = v7 == 0;
  if (v9)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v22 = v12;
      v23 = 2114;
      v24 = v5;
      v25 = 2114;
      v26 = v8;
      v13 = v12;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to attach GS token with error: %{public}@", buf, 0x20u);

    }
  }
  objc_msgSend(v6, "ams_setNullableObject:forKey:", v7, CFSTR("X-Apple-GS-Token"));
  objc_msgSend(MEMORY[0x1E0CFAC38], "currentInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "clientInfoHeader");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "ams_setNullableObject:forKey:", v15, CFSTR("X-MMe-Client-Info"));
  +[AMSDevice uniqueDeviceId](AMSDevice, "uniqueDeviceId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ams_setNullableObject:forKey:", v16, CFSTR("X-Mme-Device-Id"));
  +[AMSDevice deviceGUID](AMSDevice, "deviceGUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ams_setNullableObject:forKey:", v17, CFSTR("Guid"));
  v18 = (void *)objc_msgSend(v6, "copy");

  return v18;
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_79 != -1)
    dispatch_once(&_MergedGlobals_79, &__block_literal_global_7);
  return (NSString *)(id)qword_1ECEACF08;
}

void __45__AMSAppleCardSilentEnrollment_bagSubProfile__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEACF08;
  qword_1ECEACF08 = (uint64_t)CFSTR("AMSAppleCardSilentEnrollment");

}

+ (NSString)bagSubProfileVersion
{
  if (qword_1ECEACF10 != -1)
    dispatch_once(&qword_1ECEACF10, &__block_literal_global_9);
  return (NSString *)(id)qword_1ECEACF18;
}

void __52__AMSAppleCardSilentEnrollment_bagSubProfileVersion__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEACF18;
  qword_1ECEACF18 = (uint64_t)CFSTR("1");

}

+ (id)createBagForSubProfile
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "bagSubProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "bagSubProfileVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSBag bagForProfile:profileVersion:](AMSBag, "bagForProfile:profileVersion:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (AMSBagKeySet)bagKeySet
{
  return objc_alloc_init(AMSBagKeySet);
}

@end
