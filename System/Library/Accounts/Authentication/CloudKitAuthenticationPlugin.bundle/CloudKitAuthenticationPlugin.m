void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

rd_230E77000, v20, OS_LOG_TYPE_INFO, "Cannot return the CloudKit app token, since %@ is a non-entitled client.", (uint8_t *)&v22, 0xCu);
    }
    goto LABEL_15;
  }
  if (!-[CloudKitAuthenticationPlugin _accountAccessIsAllowedForAccount:client:](self, "_accountAccessIsAllowedForAccount:client:", v8, v9))
  {
LABEL_15:
    v19 = 0;
    goto LABEL_16;
  }
  v10 = (void *)MEMORY[0x24BE049B8];
  objc_msgSend(v8, "parentAccount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "username");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "passwordForServiceName:username:accessGroup:", CFSTR("com.apple.appleaccount.cloudkit.token"), v12, CFSTR("appleaccount"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    if (*MEMORY[0x24BDB9278] != -1)
      dispatch_once(MEMORY[0x24BDB9278], (dispatch_block_t)*MEMORY[0x24BDB9270]);
    v14 = *MEMORY[0x24BDB9268];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDB9268], OS_LOG_TYPE_INFO))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_230E77000, v14, OS_LOG_TYPE_INFO, "Found stashed cloudKitToken.", (uint8_t *)&v22, 2u);
    }
    v15 = objc_alloc_init(MEMORY[0x24BDB4388]);
    objc_msgSend(v15, "setToken:", v13);
    objc_msgSend(v8, "setCredential:", v15);
    objc_msgSend(MEMORY[0x24BE00E88], "setCredentialForAccount:error:", v8, 0);
    v16 = (void *)MEMORY[0x24BE049B8];
    objc_msgSend(v8, "parentAccount");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "username");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removePasswordForService:username:accessGroup:", CFSTR("com.apple.appleaccount.cloudkit.token"), v18, CFSTR("appleaccount"));

  }
  objc_msgSend(MEMORY[0x24BE00E88], "credentialForAccount:clientID:error:", v8, 0, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
  return v19;
}

- (BOOL)_accountAccessIsAllowedForAccount:(id)a3 client:(id)a4
{
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  BOOL v8;
  uint8_t v10[16];
  uint8_t buf[16];

  objc_msgSend(a3, "parentAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if (!objc_msgSend(v4, "aa_isSuspended"))
    {
      v8 = 1;
      goto LABEL_13;
    }
    if (*MEMORY[0x24BDB9278] != -1)
      dispatch_once(MEMORY[0x24BDB9278], (dispatch_block_t)*MEMORY[0x24BDB9270]);
    v6 = *MEMORY[0x24BDB9268];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDB9268], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_230E77000, v6, OS_LOG_TYPE_INFO, "Cannot return the CloudKit app token, since you need to verify your iCloud T&Cs or your account is in suspended mode.", v10, 2u);
    }
  }
  else
  {
    if (*MEMORY[0x24BDB9278] != -1)
      dispatch_once(MEMORY[0x24BDB9278], (dispatch_block_t)*MEMORY[0x24BDB9270]);
    v7 = *MEMORY[0x24BDB9268];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDB9268], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_230E77000, v7, OS_LOG_TYPE_ERROR, "CloudKit account has no parent!", buf, 2u);
    }
  }
  v8 = 0;
LABEL_13:

  return v8;
}

+ (BOOL)supportsAccountType:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDB4020]);

  return v4;
}

- (void)verifyCredentialsForAccount:(id)a3 accountStore:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint8_t v11[16];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (*MEMORY[0x24BDB9278] != -1)
    dispatch_once(MEMORY[0x24BDB9278], (dispatch_block_t)*MEMORY[0x24BDB9270]);
  v10 = *MEMORY[0x24BDB9268];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDB9268], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v11 = 0;
    _os_log_error_impl(&dword_230E77000, v10, OS_LOG_TYPE_ERROR, "verifyCredentialsForAccount: is not supported for CloudKit Accounts", v11, 2u);
  }
  (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);

}

- (void)renewCredentialsForAccount:(id)a3 accountStore:(id)a4 reason:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void (**v12)(id, uint64_t, void *);
  NSObject *v13;
  void *v14;
  uint8_t v15[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, uint64_t, void *))a6;
  if (*MEMORY[0x24BDB9278] != -1)
    dispatch_once(MEMORY[0x24BDB9278], (dispatch_block_t)*MEMORY[0x24BDB9270]);
  v13 = *MEMORY[0x24BDB9268];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDB9268], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v15 = 0;
    _os_log_error_impl(&dword_230E77000, v13, OS_LOG_TYPE_ERROR, "renewCredentialsForAccount: is not supported for CloudKit Accounts", v15, 2u);
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 4, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2](v12, 2, v14);

}

@end
