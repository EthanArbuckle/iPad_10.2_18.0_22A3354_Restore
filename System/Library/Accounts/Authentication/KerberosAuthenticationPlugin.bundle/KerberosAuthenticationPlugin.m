void sub_230E94D9C(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  uint64_t v17;
  void (*v18)(void);
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  int v26;

  v7 = a3;
  v8 = a4;
  if (a2)
  {
    _ACDLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      sub_230E95630();

    v11 = *(void **)(a1 + 32);
    v10 = *(void **)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 48);
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = sub_230E94F78;
    v21[3] = &unk_24FF9A0F0;
    v22 = v10;
    v13 = *(id *)(a1 + 56);
    v26 = *(_DWORD *)(a1 + 64);
    v14 = *(_QWORD *)(a1 + 32);
    v25 = v13;
    v23 = v14;
    v24 = *(id *)(a1 + 48);
    objc_msgSend(v11, "_authenticateAccount:password:certificate:client:completion:", v22, v7, 0, v12, v21);

  }
  else
  {
    _ACDLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
    if (v8)
    {
      if (v16)
        sub_230E95688((uint64_t)v8, v15, v17);

      v18 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    }
    else
    {
      if (v16)
        sub_230E9565C();

      v19 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("User canceled password prompt"), *MEMORY[0x24BDD0FC8]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("KerberosAuthenticationPlugin"), 0, v20);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      v18 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    }
    v18();
  }

}

void sub_230E94F78(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unsigned int v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  void (*v12)(void);

  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    _ACDLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      sub_230E956F0();

    objc_msgSend(*(id *)(a1 + 32), "credential");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setToken:", v5);

    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    goto LABEL_12;
  }
  v7 = *(_DWORD *)(a1 + 64);
  _ACDLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v7 < 2)
  {
    if (v9)
      sub_230E95748();

    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_12:
    v12();
    goto LABEL_13;
  }
  if (v9)
    sub_230E9571C();

  objc_msgSend(*(id *)(a1 + 40), "_promptForPasswordAndAuthenticateAccount:authAttemptsRemaining:client:completion:", *(_QWORD *)(a1 + 32), (*(_DWORD *)(a1 + 64) - 1), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
LABEL_13:

}

void sub_230E95150(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void (*v9)(void);
  void *v10;

  v5 = a2;
  v6 = a3;
  _ACDLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
      sub_230E95774();

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (v8)
      sub_230E956F0();

    objc_msgSend(*(id *)(a1 + 32), "credential");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setToken:", v5);

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v9();

}

void sub_230E953F0(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  _ACDLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    sub_230E957A0(a1, v2);

  objc_msgSend(*(id *)(a1 + 32), "accountPropertyForKey:", CFSTR("kGSSICCertificate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 56);
  if (v3)
    objc_msgSend(v5, "_useCertificate:toAuthenticateAccount:client:withCompletion:", v3, v4, v6, v7);
  else
    objc_msgSend(v5, "_promptForPasswordAndAuthenticateAccount:authAttemptsRemaining:client:completion:", v4, 3, v6, v7);

}

uint64_t sub_230E954AC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_230E954B8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_230E954DC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_230E954F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230E954D0();
  sub_230E954B8(&dword_230E93000, v0, v1, "\"KerberosAuthenticationPlugin credentialForAccount:client:error:\"", v2, v3, v4, v5, v6);
  sub_230E954C8();
}

void sub_230E9551C()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_230E954D0();
  _os_log_error_impl(&dword_230E93000, v0, OS_LOG_TYPE_ERROR, "\"KerberosAuthenticationPlugin -verifyCredentialsForAccount:store:completion: is not implemented.\"", v1, 2u);
  sub_230E954C8();
}

void sub_230E95554(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_230E93000, a2, OS_LOG_TYPE_ERROR, "\"gss_aapl_initial_cred failed: %@\"", (uint8_t *)&v3, 0xCu);
  sub_230E954E8();
}

void sub_230E955C8(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  sub_230E954DC(&dword_230E93000, a2, a3, "\"passing kGSSICAppIdentifierACL %@\"", (uint8_t *)&v3);
  sub_230E954E8();
}

void sub_230E95630()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230E954D0();
  sub_230E954B8(&dword_230E93000, v0, v1, "\"Kerberos auth plugin: User entered password. Trying to authenticate...\"", v2, v3, v4, v5, v6);
  sub_230E954C8();
}

void sub_230E9565C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230E954D0();
  sub_230E954B8(&dword_230E93000, v0, v1, "\"Kerberos auth plugin: User cancelled.\"", v2, v3, v4, v5, v6);
  sub_230E954C8();
}

void sub_230E95688(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  sub_230E954DC(&dword_230E93000, a2, a3, "\"Kerberos auth plugin got error %@\"", (uint8_t *)&v3);
  sub_230E954E8();
}

void sub_230E956F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230E954D0();
  sub_230E954B8(&dword_230E93000, v0, v1, "\"Kerberos authentication succeeded. Saving token.\"", v2, v3, v4, v5, v6);
  sub_230E954C8();
}

void sub_230E9571C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230E954D0();
  sub_230E954B8(&dword_230E93000, v0, v1, "\"Kerberos authentication failed. Prompting the user again.\"", v2, v3, v4, v5, v6);
  sub_230E954C8();
}

void sub_230E95748()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230E954D0();
  sub_230E954B8(&dword_230E93000, v0, v1, "\"Kerberos authentication failed. No more retries remaining. Sorry!\"", v2, v3, v4, v5, v6);
  sub_230E954C8();
}

void sub_230E95774()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230E954D0();
  sub_230E954B8(&dword_230E93000, v0, v1, "\"Kerberos authentication failed.\"", v2, v3, v4, v5, v6);
  sub_230E954C8();
}

void sub_230E957A0(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  sub_230E954DC(&dword_230E93000, a2, v4, "\"Renewing Kerberos credentials for account %@\"", (uint8_t *)&v5);

}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8D0](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x24BDBC8E8](alloc, uuid);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x24BDBC920](allocator, flags, error, dictionary, timeout);
}

CFStringRef CFUserNotificationGetResponseValue(CFUserNotificationRef userNotification, CFStringRef key, CFIndex idx)
{
  return (CFStringRef)MEMORY[0x24BDBC948](userNotification, key, idx);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x24BDBC950](userNotification, responseFlags, timeout);
}

gss_name_t GSSCreateName(CFTypeRef name, gss_const_OID name_type, CFErrorRef *error)
{
  return (gss_name_t)MEMORY[0x24BDD1A18](name, name_type, error);
}

CFUUIDRef GSSCredentialCopyUUID(gss_cred_id_t credential)
{
  return (CFUUIDRef)MEMORY[0x24BDD1A28](credential);
}

uint64_t _ACDLogSystem()
{
  return MEMORY[0x24BE00EB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

OM_uint32 gss_aapl_initial_cred(gss_name_t desired_name, gss_const_OID desired_mech, CFDictionaryRef attributes, gss_cred_id_t *output_cred_handle, CFErrorRef *error)
{
  return MEMORY[0x24BDD1AB8](desired_name, desired_mech, attributes, output_cred_handle, error);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

ed_handle);
    v46 = v51;
    v13 = v52;
    if (v48)
    {
      v49 = CFUUIDCreateString(0, v48);

      CFRelease(v48);
      ((void (**)(id, CFStringRef, void *))v52)[2](v52, v49, 0);
      v47 = 0;
      v46 = (__CFString *)v49;
      goto LABEL_30;
    }
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 3, 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2](v13, 0, v47);
LABEL_30:
  v12 = v54;

LABEL_31:
}

- (void)_promptForPasswordAndAuthenticateAccount:(id)a3 authAttemptsRemaining:(unsigned int)a4 client:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  unsigned int v20;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = sub_230E94D9C;
  v16[3] = &unk_24FF9A118;
  v16[4] = self;
  v17 = v10;
  v18 = v11;
  v19 = v12;
  v20 = a4;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  -[KerberosAuthenticationPlugin _presentAuthenticationDialogForAccount:completion:](self, "_presentAuthenticationDialogForAccount:completion:", v15, v16);

}

- (void)_useCertificate:(id)a3 toAuthenticateAccount:(id)a4 client:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v10 = a4;
  v11 = a6;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_230E95150;
  v14[3] = &unk_24FF9A140;
  v15 = v10;
  v16 = v11;
  v12 = v11;
  v13 = v10;
  -[KerberosAuthenticationPlugin _authenticateAccount:password:certificate:client:completion:](self, "_authenticateAccount:password:certificate:client:completion:", v13, 0, a3, a5, v14);

}

- (void)renewCredentialsForAccount:(id)a3 accountStore:(id)a4 reason:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(_QWORD);
  NSObject *v17;
  void *v18;
  _QWORD v19[4];
  void (**v20)(_QWORD);
  _QWORD v21[4];
  id v22;
  KerberosAuthenticationPlugin *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = sub_230E953F0;
  v21[3] = &unk_24FF9A168;
  v13 = v9;
  v22 = v13;
  v23 = self;
  v14 = v10;
  v24 = v14;
  v15 = v11;
  v25 = v15;
  v16 = (void (**)(_QWORD))MEMORY[0x2348C60A8](v21);
  if (objc_msgSend(v13, "isAuthenticated"))
  {
    _ACDLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v13, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = v18;
      _os_log_impl(&dword_230E93000, v17, OS_LOG_TYPE_DEFAULT, "\"Kerberos plugin marking account with identifier %@ as un-authenticated\", buf, 0xCu);

    }
    objc_msgSend(v13, "setAuthenticated:", 0);
    v19[0] = v12;
    v19[1] = 3221225472;
    v19[2] = sub_230E954AC;
    v19[3] = &unk_24FF9A190;
    v20 = v16;
    objc_msgSend(v14, "saveAccount:withHandler:", v13, v19);

  }
  else
  {
    v16[2](v16);
  }

}

@end
