void sub_230EBC238(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_msgSend(a2, "integerValue");
  _AALogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v9 = *(_QWORD *)(a1 + 32);
      v14 = 138412546;
      v15 = v9;
      v16 = 2112;
      v17 = v5;
      v10 = "Failed to renew Credentials for account: %@ with error: %@";
      v11 = v7;
      v12 = 22;
LABEL_6:
      _os_log_impl(&dword_230EBB000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, v12);
    }
  }
  else if (v8)
  {
    v13 = *(_QWORD *)(a1 + 32);
    v14 = 138412290;
    v15 = v13;
    v10 = "Sucessfully renewed Credentials for account: %@";
    v11 = v7;
    v12 = 12;
    goto LABEL_6;
  }

}

void sub_230EBC99C(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  _BOOL4 v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a2)
  {
    _AALogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_230EBB000, v6, OS_LOG_TYPE_DEFAULT, "AAIDMSAccountNotification plugin successfully auto enabled dataclasses for account %@.", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    _AALogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (v5)
    {
      if (v8)
        sub_230EBCC24((uint64_t)v5, a1, v6);
    }
    else if (v8)
    {
      sub_230EBCBB0(a1, v6);
    }
  }

}

void sub_230EBCAA4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_230EBCAC0(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  sub_230EBCAA4(&dword_230EBB000, a2, a3, "Couldn't save Apple account %@ error: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  sub_230EBCAB8();
}

void sub_230EBCB30(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218240;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  _os_log_debug_impl(&dword_230EBB000, log, OS_LOG_TYPE_DEBUG, "Authkit account change newRepairState %lu oldRepairState %lu.", (uint8_t *)&v3, 0x16u);
  sub_230EBCAB8();
}

void sub_230EBCBB0(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_230EBB000, a2, OS_LOG_TYPE_ERROR, "AAIDMSAccountNotification plugin did not auto enable dataclasses for account %@.", (uint8_t *)&v3, 0xCu);
  sub_230EBCAB8();
}

void sub_230EBCC24(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = *(_QWORD *)(a2 + 32);
  sub_230EBCAA4(&dword_230EBB000, a2, a3, "AAIDMSAccountNotification plugin encountered error (%@) while attempting to auto enable dataclasses for account %@.", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  sub_230EBCAB8();
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

uint64_t _AALogSystem()
{
  return MEMORY[0x24BE04AA8]();
}

uint64_t _AKLogSystem()
{
  return MEMORY[0x24BE0AE10]();
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         - (unint64_t)_newRepairStateOnAuthKitAccount:(id)a3 vsOldAccount:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;

  v5 = a4;
  v6 = (void *)MEMORY[0x24BE0AC98];
  v7 = a3;
  objc_msgSend(v6, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "repairStateForAccount:", v7);

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "repairStateForAccount:", v5);

  }
  else
  {
    v11 = 0;
  }
  _AALogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    sub_230EBCB30(v9, v11, v12);

  if (v9 == v11)
    v9 = 0;

  return v9;
}

- (BOOL)_shouldForceRenewCredentialsForAccount:(id)a3 inStore:(id)a4 oldAccount:(id)a5
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  BOOL v18;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a5;
  _AALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138412290;
    v21 = v6;
    _os_log_impl(&dword_230EBB000, v8, OS_LOG_TYPE_DEFAULT, "ShouldForceRenewCredentialsForAccount called for account: %@", (uint8_t *)&v20, 0xCu);
  }

  if (objc_msgSend(v6, "isPropertyDirty:", *MEMORY[0x24BDB42B8]))
  {
    _AALogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412290;
      v21 = v6;
      _os_log_impl(&dword_230EBB000, v9, OS_LOG_TYPE_DEFAULT, "Account %@ is AuthkitAccount and has property Credential changes", (uint8_t *)&v20, 0xCu);
    }

    objc_msgSend(v6, "credential");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x24BDB41A8];
    objc_msgSend(v10, "credentialItemForKey:", *MEMORY[0x24BDB41A8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "credential");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "credentialItemForKey:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v12;
    v16 = v14;
    v17 = (void *)v16;
    if (v15 && v16)
    {
      if ((objc_msgSend((id)v15, "isEqual:", v16) & 1) == 0)
      {
LABEL_9:
        v18 = 1;
LABEL_13:

        goto LABEL_14;
      }
    }
    else if (v15 | v16)
    {
      goto LABEL_9;
    }
    v18 = 0;
    goto LABEL_13;
  }
  v18 = 0;
LABEL_14:

  return v18;
}

- (void)_enableDataclassesForVerifiedEmailOnAppleAccount:(id)a3 inStore:(id)a4
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "aa_setPrimaryEmailVerified:", 1);
  _AALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_230EBB000, v5, OS_LOG_TYPE_DEFAULT, "AAIDMSAccountAuthenticationPlugin enabling dataclasses post email verification for account %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BE04948], "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_230EBC99C;
  v8[3] = &unk_24FFA00E8;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "enableDataclassesWithoutLocalDataDataclassActionsForAccount:completion:", v7, v8);

}

@end
