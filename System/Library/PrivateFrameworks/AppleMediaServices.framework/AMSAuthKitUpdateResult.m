@implementation AMSAuthKitUpdateResult

- (AMSAuthKitUpdateResult)initWithAccount:(id)a3 authenticationResults:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  AMSAuthKitUpdateResult *v11;
  uint64_t v12;
  ACAccount *account;
  uint64_t v14;
  NSDictionary *authenticationResults;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AMSAuthKitUpdateResult;
  v11 = -[AMSAuthKitUpdateResult init](&v17, sel_init);
  if (v11)
  {
    objc_msgSend((id)objc_opt_class(), "_createUpdatedAccount:usingAuthenticationResults:options:", v8, v9, v10);
    v12 = objc_claimAutoreleasedReturnValue();
    account = v11->_account;
    v11->_account = (ACAccount *)v12;

    v14 = objc_msgSend(v9, "copy");
    authenticationResults = v11->_authenticationResults;
    v11->_authenticationResults = (NSDictionary *)v14;

  }
  return v11;
}

- (unint64_t)credentialSource
{
  unint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__AMSAuthKitUpdateResult_credentialSource__block_invoke;
  v4[3] = &unk_1E253E378;
  v4[4] = self;
  v4[5] = &v5;
  __42__AMSAuthKitUpdateResult_credentialSource__block_invoke((uint64_t)v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __42__AMSAuthKitUpdateResult_credentialSource__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "account");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "ams_lastAuthenticationCredentialSource");

}

+ (id)_createUpdatedAccount:(id)a3 usingAuthenticationResults:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  int v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  uint64_t v56;
  void *v57;
  NSObject *v58;
  uint64_t v59;
  void *v60;
  id v61;
  NSObject *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v78;
  void *v79;
  id v80;
  id v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  uint8_t buf[4];
  uint64_t v92;
  __int16 v93;
  void *v94;
  __int16 v95;
  void *v96;
  __int16 v97;
  void *v98;
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFF40]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFF50]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFC8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10
    || (objc_msgSend(v7, "ams_altDSID"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "isEqualToString:", v10),
        v13,
        (v14 & 1) != 0))
  {
    v15 = 0;
    if (!v11)
      goto LABEL_20;
    goto LABEL_12;
  }
  objc_msgSend(v7, "ams_altDSID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v17, "OSLogObject");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v88 = v11;
      v19 = objc_opt_class();
      AMSLogKey();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "ams_altDSID");
      v84 = v10;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v21);
      v80 = v9;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v84);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v92 = v19;
      v11 = v88;
      v93 = 2114;
      v94 = v20;
      v95 = 2114;
      v96 = v22;
      v97 = 2114;
      v98 = v23;
      _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] AuthKit gave us an updated altDSID. oldAltDSID = %{public}@ | newAltDSID = %{public}@", buf, 0x2Au);

      v10 = v84;
      v9 = v80;

    }
  }
  objc_msgSend(v7, "ams_setAltDSID:", v10);
  v15 = 1;
  if (v11)
  {
LABEL_12:
    objc_msgSend(v7, "ams_DSID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isEqualToNumber:", v11);

    if ((v25 & 1) == 0)
    {
      objc_msgSend(v7, "ams_DSID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v27)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v27, "OSLogObject");
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v78 = objc_opt_class();
          AMSLogKey();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "ams_DSID");
          v85 = v10;
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          AMSHashIfNeeded(v30);
          v81 = v9;
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          AMSHashIfNeeded(v11);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v92 = v78;
          v93 = 2114;
          v94 = v29;
          v95 = 2114;
          v96 = v31;
          v97 = 2114;
          v98 = v32;
          _os_log_impl(&dword_18C849000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] AuthKit gave us an updated DSID. oldDSID = %{public}@ | newDSID = %{public}@", buf, 0x2Au);

          v10 = v85;
          v9 = v81;

        }
      }
      objc_msgSend(v7, "ams_setDSID:", v11);
      v15 = 1;
    }
  }
LABEL_20:
  if (v12)
  {
    objc_msgSend(v7, "username");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isEqualToString:", v12);

    if ((v34 & 1) == 0)
    {
      objc_msgSend(v7, "username");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v36)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v36, "OSLogObject");
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          v89 = v11;
          v38 = objc_opt_class();
          AMSLogKey();
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "username");
          v86 = v10;
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          AMSHashIfNeeded(v40);
          v82 = v9;
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          AMSHashIfNeeded(v12);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v92 = v38;
          v11 = v89;
          v93 = 2114;
          v94 = v39;
          v95 = 2114;
          v96 = v41;
          v97 = 2114;
          v98 = v42;
          _os_log_impl(&dword_18C849000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] AuthKit gave us an updated username. oldUsername = %{public}@ | newUsername = %{public}@", buf, 0x2Au);

          v10 = v86;
          v9 = v82;

        }
      }
      objc_msgSend(v7, "setUsername:", v12);
LABEL_31:
      v90 = v11;
      +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v43)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v43, "OSLogObject");
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v45 = objc_opt_class();
        AMSLogKey();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v92 = v45;
        v93 = 2114;
        v94 = v46;
        _os_log_impl(&dword_18C849000, v44, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] AuthKit gave us updated identifiers. We'll attempt to find an existing account that matches the new identifiers.", buf, 0x16u);

      }
      v47 = (void *)MEMORY[0x1E0C8F2B8];
      objc_msgSend(v9, "clientInfo");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "accountMediaType");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "ams_sharedAccountStoreForMediaType:", v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v7, "ams_isiCloudAccount"))
      {
        v87 = v10;
        objc_msgSend(v50, "ams_accountWithAltDSID:DSID:username:accountTypeIdentifier:", v10, v90, v12, *MEMORY[0x1E0C8F030]);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!objc_msgSend(v7, "ams_isiTunesAccount"))
        {
LABEL_55:

          v11 = v90;
          goto LABEL_56;
        }
        v87 = v10;
        objc_msgSend(v50, "ams_iTunesAccountWithAltDSID:DSID:username:", v10, v90, v12);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v52 = v51;
      if (v51)
      {
        v83 = v9;
        objc_msgSend(v51, "identifier");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "identifier");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(v53, "isEqualToString:", v54);

        +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
        v56 = objc_claimAutoreleasedReturnValue();
        v57 = (void *)v56;
        if (v55)
        {
          if (!v56)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v57, "OSLogObject");
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            v59 = objc_opt_class();
            AMSLogKey();
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v92 = v59;
            v93 = 2114;
            v94 = v60;
            _os_log_impl(&dword_18C849000, v58, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The new identifiers are for the account we're already working with.", buf, 0x16u);

          }
          v61 = v7;
        }
        else
        {
          if (!v56)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v79 = v12;
          objc_msgSend(v57, "OSLogObject");
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            v63 = objc_opt_class();
            AMSLogKey();
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "hashedDescription");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v92 = v63;
            v93 = 2114;
            v94 = v64;
            v95 = 2114;
            v96 = v65;
            _os_log_impl(&dword_18C849000, v62, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The new identifiers are for a different existing account. existingAccount = %{public}@", buf, 0x20u);

          }
          objc_msgSend(v7, "ams_altDSID");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "ams_DSID");
          v58 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "username");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "clientInfo");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "accountMediaType");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = objc_msgSend(v7, "ams_isActiveForMediaType:", v68);

          v61 = v52;
          objc_msgSend(v61, "ams_setAltDSID:", v57);
          objc_msgSend(v61, "ams_setDSID:", v58);
          objc_msgSend(v61, "setUsername:", v66);
          if (v69)
          {
            objc_msgSend(v83, "clientInfo");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "accountMediaType");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "ams_setActive:forMediaType:", 1, v71);

          }
          v12 = v79;
        }

        v7 = v61;
        v9 = v83;
      }
      v10 = v87;
      goto LABEL_55;
    }
  }
  if (v15)
    goto LABEL_31;
LABEL_56:
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFA0]);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  if (v72)
    objc_msgSend(v7, "ams_setPassword:", v72);
  v73 = *MEMORY[0x1E0CFFFA8];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFA8]);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (v74)
    objc_msgSend(v7, "ams_setRawPassword:", v74);
  objc_msgSend(v8, "objectForKeyedSubscript:", v73);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  if (v75)
    v76 = 2;
  else
    v76 = 5;
  objc_msgSend(v7, "ams_setLastAuthenticationCredentialSource:", v76);

  return v7;
}

- (AMSAuthKitUpdateResult)initWithAccount:(id)a3 authenticationResults:(id)a4 credentialSource:(unint64_t)a5 options:(id)a6
{
  return -[AMSAuthKitUpdateResult initWithAccount:authenticationResults:options:](self, "initWithAccount:authenticationResults:options:", a3, a4, a6);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[AMSAuthKitUpdateResult account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AMSAuthKitUpdateResult account](self, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("kCodingKeyAccount"));

  }
  -[AMSAuthKitUpdateResult authenticationResults](self, "authenticationResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AMSAuthKitUpdateResult authenticationResults](self, "authenticationResults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("kCodingKeyAuthenticationResults"));

  }
}

- (AMSAuthKitUpdateResult)initWithCoder:(id)a3
{
  id v4;
  AMSAuthKitUpdateResult *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  ACAccount *account;
  uint64_t v11;
  NSDictionary *authenticationResults;
  objc_super v14;
  _QWORD v15[7];

  v15[6] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AMSAuthKitUpdateResult;
  v5 = -[AMSAuthKitUpdateResult init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    v15[3] = objc_opt_class();
    v15[4] = objc_opt_class();
    v15[5] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyAccount"));
    v9 = objc_claimAutoreleasedReturnValue();
    account = v5->_account;
    v5->_account = (ACAccount *)v9;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kCodingKeyAuthenticationResults"));
    v11 = objc_claimAutoreleasedReturnValue();
    authenticationResults = v5->_authenticationResults;
    v5->_authenticationResults = (NSDictionary *)v11;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[AMSAuthKitUpdateResult account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v4, CFSTR("account"));

  -[AMSAuthKitUpdateResult authenticationResults](self, "authenticationResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ak_redactedCopy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v6, CFSTR("authenticationResults"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[AMSAuthKitUpdateResult credentialSource](self, "credentialSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v7, CFSTR("credentialSource"));

  v8 = (void *)objc_msgSend(v3, "copy");
  -[NSObject ams_generateDescriptionWithSubObjects:](self, "ams_generateDescriptionWithSubObjects:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (ACAccount)account
{
  return self->_account;
}

- (NSDictionary)authenticationResults
{
  return self->_authenticationResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationResults, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
