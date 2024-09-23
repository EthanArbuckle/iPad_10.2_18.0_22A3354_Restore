@implementation SecureBackupAccountNotification

- (BOOL)account:(id)a3 willChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  uint64_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  _QWORD v21[2];
  _QWORD v22[2];
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v6 = *(_QWORD *)&a4;
  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  sub_230F5F534();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SecureBackupAccountNotification account:willChangeWithType:inStore:oldAccount:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v26 = v9;
    _os_log_impl(&dword_230F5E000, v8, OS_LOG_TYPE_DEFAULT, "in %@", buf, 0xCu);

  }
  sub_230F5F534();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v26 = v7;
    v27 = 2112;
    v28 = v11;
    _os_log_impl(&dword_230F5E000, v10, OS_LOG_TYPE_DEFAULT, "account %@, ACAccountChangeType = %@", buf, 0x16u);

  }
  if (sub_230F5F540() && sub_230F5F5B8(v7))
  {
    objc_msgSend(v7, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v6 == 3)
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x24BE17B80]), "initWithUserActivityLabel:", CFSTR("EMCS backup"));
      v23 = *MEMORY[0x24BE17BD8];
      v24 = MEMORY[0x24BDBD1C8];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject backupWithInfo:](v13, "backupWithInfo:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
LABEL_17:

        goto LABEL_18;
      }
      sub_230F5F534();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_230F5FDCC();
    }
    else
    {
      if (MKBGetDeviceLockState() != 3)
      {
        sub_230F5F534();
        v13 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          goto LABEL_19;
        objc_msgSend(v7, "username");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v26 = v12;
        v27 = 2112;
        v28 = v14;
        _os_log_impl(&dword_230F5E000, v13, OS_LOG_TYPE_DEFAULT, "nothing to do for account %@: %@", buf, 0x16u);
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      objc_msgSend(v7, "_aa_rawPassword");
      v17 = objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        sub_230F5F534();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v12;
          _os_log_impl(&dword_230F5E000, v13, OS_LOG_TYPE_DEFAULT, "Account %@ did not present a password", buf, 0xCu);
        }
        goto LABEL_19;
      }
      v13 = v17;
      objc_msgSend(v7, "aa_personID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      sub_230F5F534();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v14;
        _os_log_impl(&dword_230F5E000, v18, OS_LOG_TYPE_DEFAULT, " got password for dsid: %@", buf, 0xCu);
      }

      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE17B80]), "initWithUserActivityLabel:", CFSTR("EMCS enable"));
      v19 = *MEMORY[0x24BE17C00];
      v21[0] = *MEMORY[0x24BE17BD8];
      v21[1] = v19;
      v22[0] = MEMORY[0x24BDBD1C8];
      v22[1] = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
      v16 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "enableWithInfo:completionBlock:", v16, &unk_24FFBE700);
    }

    goto LABEL_17;
  }
LABEL_20:

  return 1;
}

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  uint64_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  __CFString *v11;
  void *v12;
  NSObject *v13;
  __CFString *v14;
  void *v15;
  NSObject *v16;
  const __CFString *v17;
  const __CFString *v18;
  NSObject *v19;
  id v20;
  void *v21;
  dispatch_semaphore_t v22;
  NSObject *v23;
  NSObject *v24;
  __CFString *v25;
  _QWORD v26[4];
  __CFString *v27;
  NSObject *v28;
  id v29;
  dispatch_semaphore_t v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  const __CFString *v36;
  uint64_t v37;

  v6 = *(_QWORD *)&a4;
  v37 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  sub_230F5F534();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SecureBackupAccountNotification account:didChangeWithType:inStore:oldAccount:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v32 = v9;
    _os_log_impl(&dword_230F5E000, v8, OS_LOG_TYPE_DEFAULT, "in %@", buf, 0xCu);

  }
  sub_230F5F534();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v6);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v32 = v7;
    v33 = 2112;
    v34 = v11;
    _os_log_impl(&dword_230F5E000, v10, OS_LOG_TYPE_DEFAULT, "account %@, ACAccountChangeType = %@", buf, 0x16u);

  }
  if (sub_230F5F540() && sub_230F5F5B8(v7))
  {
    objc_msgSend(v7, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v6 == 2 && MKBGetDeviceLockState() != 3)
    {
      objc_msgSend(v7, "_aa_rawPassword");
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "credential");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "credentialItemForKey:", CFSTR("old-password"));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v14 && v13 && (-[__CFString isEqualToString:](v14, "isEqualToString:", v13) & 1) == 0)
      {
        v19 = objc_alloc_init(MEMORY[0x24BE0ACB8]);
        v20 = objc_alloc_init(MEMORY[0x24BE0ACC0]);
        objc_msgSend(v7, "username");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setUsername:](v19, "setUsername:", v21);

        -[NSObject _setPassword:](v19, "_setPassword:", v13);
        -[NSObject setIsUsernameEditable:](v19, "setIsUsernameEditable:", 0);
        -[NSObject setShouldAllowAppleIDCreation:](v19, "setShouldAllowAppleIDCreation:", 0);
        -[NSObject setNeedsCredentialRecovery:](v19, "setNeedsCredentialRecovery:", 0);
        -[NSObject setNeedsNewAppleID:](v19, "setNeedsNewAppleID:", 0);
        -[NSObject setServiceType:](v19, "setServiceType:", 0);
        -[NSObject setAuthenticationType:](v19, "setAuthenticationType:", 1);
        -[NSObject setShouldRequestShortLivedToken:](v19, "setShouldRequestShortLivedToken:", 1);
        -[NSObject setShouldRequestConfigurationInfo:](v19, "setShouldRequestConfigurationInfo:", 1);
        -[NSObject setIsEphemeral:](v19, "setIsEphemeral:", 1);
        v22 = dispatch_semaphore_create(0);
        v26[0] = MEMORY[0x24BDAC760];
        v26[1] = 3221225472;
        v26[2] = sub_230F5FAD0;
        v26[3] = &unk_24FFBE750;
        v27 = v14;
        v28 = v13;
        v29 = v7;
        v30 = v22;
        v23 = v22;
        v24 = v13;
        v25 = v14;
        objc_msgSend(v20, "authenticateWithContext:completion:", v19, v26);
        dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);

        v13 = v19;
        goto LABEL_23;
      }
      sub_230F5F534();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = &stru_24FFBE870;
        if (v14)
          v18 = CFSTR("non-");
        else
          v18 = &stru_24FFBE870;
        *(_DWORD *)buf = 138412802;
        v32 = v12;
        v34 = v18;
        v33 = 2112;
        if (v13)
          v17 = CFSTR("non-");
        v35 = 2112;
        v36 = v17;
        _os_log_impl(&dword_230F5E000, v16, OS_LOG_TYPE_DEFAULT, "Account %@ modified but old password = %@nil, new password = %@nil", buf, 0x20u);
      }

    }
    else
    {
      sub_230F5F534();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
LABEL_23:

        goto LABEL_24;
      }
      objc_msgSend(v7, "username");
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v32 = v12;
      v33 = 2112;
      v34 = v14;
      _os_log_impl(&dword_230F5E000, v13, OS_LOG_TYPE_DEFAULT, "nothing to do for account %@: %@", buf, 0x16u);
    }

    goto LABEL_23;
  }
LABEL_24:

}

@end
