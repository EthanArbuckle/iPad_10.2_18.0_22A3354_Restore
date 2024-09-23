@implementation AMSAttestation

+ (id)attestationWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  id *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id *v27;
  id v28;
  void *v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  AMSSetLogKeyIfNeeded();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "regenerateKeys"))
  {
    v9 = objc_msgSend(v6, "style");
    if (v9 <= 5)
    {
      if (((1 << v9) & 0x39) != 0)
      {
        v48 = 0;
        v10 = (id *)&v48;
        +[AMSKeychain deleteCertificateChainWithOptions:error:](AMSKeychain, "deleteCertificateChainWithOptions:error:", v6, &v48);
      }
      else
      {
        v47 = 0;
        v10 = (id *)&v47;
        +[AMSKeychain deleteKeyPairWithOptions:error:](AMSKeychain, "deleteKeyPairWithOptions:error:", v6, &v47);
      }
      v11 = *v10;
      if (v11)
      {
        v12 = v11;
        +[AMSLogConfig sharedAttestationConfig](AMSLogConfig, "sharedAttestationConfig");
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
          v15 = objc_opt_class();
          *(_DWORD *)buf = 138543874;
          v50 = v15;
          v51 = 2114;
          v52 = v8;
          v53 = 2114;
          v54 = v12;
          _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Attestation did not delete keys: %{public}@", buf, 0x20u);
        }

      }
    }
  }
  v16 = objc_msgSend(v6, "style");
  if (v16 > 5)
  {
    v19 = 0;
    goto LABEL_51;
  }
  if (((1 << v16) & 0x31) != 0)
  {
    v46 = 0;
    +[AMSKeychain certificateChainStringsForOptions:error:](AMSKeychain, "certificateChainStringsForOptions:error:", v6, &v46);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v46;
    if (v17 && objc_msgSend(v17, "count") == 2 && !v18)
    {
      v19 = 0;
      v20 = v17;
    }
    else
    {
      +[AMSLogConfig sharedAttestationConfig](AMSLogConfig, "sharedAttestationConfig");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v24)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v24, "OSLogObject");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v50 = (uint64_t)v26;
        v51 = 2114;
        v52 = v8;
        v53 = 2114;
        v54 = v18;
        v27 = a4;
        v28 = v26;
        _os_log_impl(&dword_18C849000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Did not find certificates in keychain, generating new certifcates: %{public}@", buf, 0x20u);

        a4 = v27;
      }

      v45 = v18;
      objc_msgSend(a1, "_generateCertificateChainStringsForOptions:error:", v6, &v45);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v45;

      if (v19)
      {
        +[AMSLogConfig sharedAttestationConfig](AMSLogConfig, "sharedAttestationConfig");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v29)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v29, "OSLogObject");
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v31 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543874;
          v50 = (uint64_t)v31;
          v51 = 2114;
          v52 = v8;
          v53 = 2114;
          v54 = v19;
          v32 = v31;
          _os_log_impl(&dword_18C849000, v30, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Certificate chain lookup and/or generation failed with error: %{public}@", buf, 0x20u);

        }
      }
    }
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __47__AMSAttestation_attestationWithOptions_error___block_invoke;
    v43[3] = &unk_1E253DF48;
    v44 = v7;
    objc_msgSend(v20, "enumerateObjectsUsingBlock:", v43);
    v33 = v44;
  }
  else
  {
    if (((1 << v16) & 6) != 0)
    {
      v39 = 0;
      +[AMSKeychain legacyAttestationForOptions:error:](AMSKeychain, "legacyAttestationForOptions:error:", v6, &v39);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v39;
      if (v19)
      {
        +[AMSLogConfig sharedAttestationConfig](AMSLogConfig, "sharedAttestationConfig");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v21)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v21, "OSLogObject");
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = objc_opt_class();
          *(_DWORD *)buf = 138543874;
          v50 = v23;
          v51 = 2114;
          v52 = v8;
          v53 = 2114;
          v54 = v19;
          _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Legacy attestation failed with error: %{public}@", buf, 0x20u);
        }

      }
      if (v20)
        objc_msgSend(v7, "addObject:", v20);
      goto LABEL_47;
    }
    v42 = 0;
    objc_msgSend(a1, "_generateCertificateChainStringsForOptions:error:", v6, &v42);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v42;
    if (v19)
    {
      +[AMSLogConfig sharedAttestationConfig](AMSLogConfig, "sharedAttestationConfig");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v34)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v34, "OSLogObject");
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v36 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v50 = v36;
        v51 = 2114;
        v52 = v8;
        v53 = 2114;
        v54 = v19;
        _os_log_impl(&dword_18C849000, v35, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Certificate chain attestation failed with error: %{public}@", buf, 0x20u);
      }

    }
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __47__AMSAttestation_attestationWithOptions_error___block_invoke_3;
    v40[3] = &unk_1E253DF48;
    v41 = v7;
    objc_msgSend(v20, "enumerateObjectsUsingBlock:", v40);
    v33 = v41;
  }

LABEL_47:
  if (v19)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v19);
    objc_msgSend(v7, "removeAllObjects");
  }
LABEL_51:
  v37 = (void *)objc_msgSend(v7, "copy");

  return v37;
}

uint64_t __47__AMSAttestation_attestationWithOptions_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __47__AMSAttestation_attestationWithOptions_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

+ (id)attestationHTTPBodyDataWithStyle:(unint64_t)a3 regenerateKeys:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  AMSKeychainOptions *v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  AMSKeychainOptions *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v6 = a4;
  v42 = *MEMORY[0x1E0C80C00];
  v9 = objc_alloc_init(AMSKeychainOptions);
  -[AMSKeychainOptions setPurpose:](v9, "setPurpose:", 0);
  -[AMSKeychainOptions setRegenerateKeys:](v9, "setRegenerateKeys:", v6);
  -[AMSKeychainOptions setStyle:](v9, "setStyle:", a3);
  AMSSetLogKeyIfNeeded();
  v10 = objc_claimAutoreleasedReturnValue();
  v35 = 0;
  +[AMSAttestation attestationWithOptions:error:](AMSAttestation, "attestationWithOptions:error:", v9, &v35);
  v31 = objc_claimAutoreleasedReturnValue();
  v11 = v35;
  if (v11)
  {
    +[AMSLogConfig sharedAttestationConfig](AMSLogConfig, "sharedAttestationConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject", v31);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v37 = v14;
      v38 = 2114;
      v39 = v10;
      v40 = 2114;
      v41 = v11;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to generate primary attestation with error: %{public}@", buf, 0x20u);
    }

  }
  v15 = objc_alloc_init(AMSKeychainOptions);
  -[AMSKeychainOptions setPurpose:](v15, "setPurpose:", 1);
  -[AMSKeychainOptions setRegenerateKeys:](v15, "setRegenerateKeys:", v6);
  -[AMSKeychainOptions setStyle:](v15, "setStyle:", a3);
  v34 = v11;
  +[AMSAttestation attestationWithOptions:error:](AMSAttestation, "attestationWithOptions:error:", v15, &v34);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v34;

  v18 = (void *)v10;
  v19 = a1;
  if (v17)
  {
    +[AMSLogConfig sharedAttestationConfig](AMSLogConfig, "sharedAttestationConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v20, "OSLogObject", v31);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v37 = v22;
      v38 = 2114;
      v39 = (uint64_t)v18;
      v40 = 2114;
      v41 = v17;
      _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Extended attestation failed with error: %{public}@", buf, 0x20u);
    }

  }
  v33 = v17;
  v23 = (void *)v31;
  objc_msgSend(v19, "_attestationPListWithStyle:primaryAttestation:extendedAttestation:error:", a3, v31, v16, &v33, v31);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v33;

  if (v24)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v24, 100, 0, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (a5)
LABEL_15:
      *a5 = objc_retainAutorelease(v25);
  }
  else
  {
    +[AMSLogConfig sharedAttestationConfig](AMSLogConfig, "sharedAttestationConfig");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v28)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v28, "OSLogObject");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v37 = v30;
      v38 = 2114;
      v39 = (uint64_t)v18;
      _os_log_impl(&dword_18C849000, v29, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to create attestation plist", buf, 0x16u);
    }

    v26 = 0;
    v23 = v32;
    if (a5)
      goto LABEL_15;
  }

  return v26;
}

+ (id)_attestationPListWithStyle:(unint64_t)a3 primaryAttestation:(id)a4 extendedAttestation:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  AMSSetLogKeyIfNeeded();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 > 5)
  {
LABEL_16:
    v15 = 0;
    goto LABEL_41;
  }
  if (((1 << a3) & 0x39) != 0)
  {
    if (objc_msgSend(v9, "count") != 2)
    {
      +[AMSLogConfig sharedAttestationConfig](AMSLogConfig, "sharedAttestationConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v16, "OSLogObject");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = objc_opt_class();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v38 = v18;
        v39 = 2114;
        v40 = v12;
        v41 = 2114;
        v42 = v19;
        _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Cannot create cert-based primary attestation with %{public}@ certs in chain.", buf, 0x20u);

      }
      v20 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("Incorrect number of attestation: %@"), v21);
      goto LABEL_38;
    }
    if ((a3 & 0xFFFFFFFFFFFFFFFBLL) != 0 || objc_msgSend(v10, "count") == 2)
    {
      if (v9)
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("primaryX509Chain"));
      if (v10)
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("extendedX509Chain"));
      goto LABEL_16;
    }
    +[AMSLogConfig sharedAttestationConfig](AMSLogConfig, "sharedAttestationConfig");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v29)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v29, "OSLogObject");
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      goto LABEL_36;
    v34 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v38 = v34;
    v39 = 2114;
    v40 = v12;
    v41 = 2114;
    v42 = v32;
    v33 = "%{public}@: [%{public}@] Cannot create cert-based extended attestation with %{public}@ certs in chain.";
    goto LABEL_35;
  }
  if (objc_msgSend(v9, "count") != 1)
  {
    +[AMSLogConfig sharedAttestationConfig](AMSLogConfig, "sharedAttestationConfig");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v22, "OSLogObject");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v38 = v24;
      v39 = 2114;
      v40 = v12;
      v41 = 2114;
      v42 = v25;
      _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Cannot create legacy-based primary attestation with %{public}@ elements in reponse.", buf, 0x20u);

    }
    v26 = (void *)MEMORY[0x1E0CB3940];
    v27 = (void *)MEMORY[0x1E0CB37E8];
    v28 = v9;
    goto LABEL_37;
  }
  if (objc_msgSend(v10, "count") == 1)
  {
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("touchIdAttestation"));

    }
    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("extendedAttestation"));

    }
    goto LABEL_16;
  }
  +[AMSLogConfig sharedAttestationConfig](AMSLogConfig, "sharedAttestationConfig");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v29)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v29, "OSLogObject");
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    v31 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v38 = v31;
    v39 = 2114;
    v40 = v12;
    v41 = 2114;
    v42 = v32;
    v33 = "%{public}@: [%{public}@] Cannot create legacy-based extended attestation with %{public}@ elements in reponse.";
LABEL_35:
    _os_log_impl(&dword_18C849000, v30, OS_LOG_TYPE_ERROR, v33, buf, 0x20u);

  }
LABEL_36:

  v26 = (void *)MEMORY[0x1E0CB3940];
  v27 = (void *)MEMORY[0x1E0CB37E8];
  v28 = v10;
LABEL_37:
  objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v28, "count"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringWithFormat:", CFSTR("Incorrect number of attestations: %@"), v21);
LABEL_38:
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  AMSError(2, CFSTR("Attestation Error"), v35, 0);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (a6 && v15)
  {
    v15 = objc_retainAutorelease(v15);
    *a6 = v15;
  }
LABEL_41:

  return v11;
}

+ (id)_generateCertificateChainStringsForOptions:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  id v7;
  AMSClientCertificateTask *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0C99DE8];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  v8 = -[AMSClientCertificateTask initWithOptions:]([AMSClientCertificateTask alloc], "initWithOptions:", v6);

  -[AMSClientCertificateTask performClientCertChainRequest](v8, "performClientCertChainRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v9, "resultWithError:", &v24);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v24;
  if (v11)
  {
    +[AMSLogConfig sharedAttestationConfig](AMSLogConfig, "sharedAttestationConfig");
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
      v14 = objc_opt_class();
      AMSSetLogKeyIfNeeded();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v14;
      v27 = 2114;
      v28 = v15;
      v29 = 2114;
      v30 = v11;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Create cert chain failed with error: %{public}@", buf, 0x20u);

    }
  }
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __67__AMSAttestation__generateCertificateChainStringsForOptions_error___block_invoke;
  v22 = &unk_1E253DF70;
  v16 = v7;
  v23 = v16;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v19);
  if (a4)
    *a4 = objc_retainAutorelease(v11);
  v17 = (void *)objc_msgSend(v16, "copy", v19, v20, v21, v22);

  return v17;
}

void __67__AMSAttestation__generateCertificateChainStringsForOptions_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "base64EncodedStringWithOptions:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

@end
