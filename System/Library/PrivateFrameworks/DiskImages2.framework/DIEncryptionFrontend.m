@implementation DIEncryptionFrontend

- (DIEncryptionFrontend)initWithParams:(id)a3
{
  id v5;
  DIEncryptionFrontend *v6;
  DIEncryptionFrontend *v7;
  uint64_t v8;
  NSUUID *encryptionUUID;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DIEncryptionFrontend;
  v6 = -[DIEncryptionFrontend init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_diParams, a3);
    if (-[DIEncryptionFrontend validateDeserializationWithError:](v7, "validateDeserializationWithError:", 0))
    {
      objc_msgSend(v5, "encryptionUUID");
      v8 = objc_claimAutoreleasedReturnValue();
      encryptionUUID = v7->_encryptionUUID;
      v7->_encryptionUUID = (NSUUID *)v8;

    }
  }

  return v7;
}

- (unint64_t)flags
{
  void *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  -[DIEncryptionFrontend diParams](self, "diParams");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "readPassphraseFlags");

  v4 = isatty(0);
  v5 = 2;
  if (!v4)
    v5 = 8;
  v6 = v3 & 0xFFFFFFFFFFFFFFFDLL;
  if (v4)
    v6 = v3;
  if ((v3 & 8) != 0)
    v7 = v5;
  else
    v7 = v6;
  if (+[DIEncryptionFrontend hasGUIaccess](DIEncryptionFrontend, "hasGUIaccess"))
    return v7;
  else
    return v7 & 0xFFFFFFFFFFFFFFFBLL;
}

- (id)getCertificateWithCertificatePath:(id)a3 error:(id *)a4
{
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[DIError nilWithPOSIXCode:description:error:](DIError, "nilWithPOSIXCode:description:error:", *__error(), CFSTR("Failed to read from certificate file "), a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)getCertificateWithPublicKey:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFDictionary *v9;
  uint64_t v10;
  void *v11;
  CFTypeRef v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v13 = 0;
  v6 = (void *)MEMORY[0x24BDBCED8];
  v7 = *MEMORY[0x24BDE9108];
  v14[0] = *MEMORY[0x24BDE9220];
  v14[1] = v7;
  v15[0] = *MEMORY[0x24BDE9228];
  v15[1] = v5;
  v14[2] = *MEMORY[0x24BDE94C8];
  v15[2] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithDictionary:", v8);
  v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v10 = SecItemCopyMatching(v9, &v13);
  if ((_DWORD)v10)
  {
    +[DIError nilWithOSStatus:verboseInfo:error:](DIError, "nilWithOSStatus:verboseInfo:error:", v10, CFSTR("Failed to find keychain item using hashed key"), a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (void *)v13;
  }

  return v11;
}

- (BOOL)consoleAskForPassphraseWithUseStdin:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v5;
  int v7;
  NSObject *v8;
  char *v9;
  NSObject *v10;
  id v11;
  const char *v12;
  int v13;
  char *v14;
  void *v15;
  BOOL v16;
  id v17;
  char *v18;
  void *v20;
  char v21;
  int v22;
  NSObject *v23;
  char *v24;
  NSObject *v25;
  uint8_t *v27;
  uint64_t v28;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  const char *v32;
  char __s1[258];
  uint64_t v34;

  v5 = a3;
  v34 = *MEMORY[0x24BDAC8D0];
  v7 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    v8 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    v30 = 66;
    v31 = 2080;
    v32 = "-[DIEncryptionFrontend consoleAskForPassphraseWithUseStdin:error:]";
    LODWORD(v28) = 18;
    v27 = buf;
    v9 = (char *)_os_log_send_and_compose_impl();

    if (v9)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v9);
      free(v9);
    }
  }
  else
  {
    getDIOSLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      v30 = 66;
      v31 = 2080;
      v32 = "-[DIEncryptionFrontend consoleAskForPassphraseWithUseStdin:error:]";
      _os_log_impl(&dword_212EB0000, v10, OS_LOG_TYPE_DEFAULT, "%.*s: Asking for passphrase using readpassphrase", buf, 0x12u);
    }

  }
  *__error() = v7;
  -[DIEncryptionFrontend CLIPassphrasePrompt](self, "CLIPassphrasePrompt");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = (const char *)objc_msgSend(v11, "UTF8String");
  if (v5)
    v13 = 32;
  else
    v13 = 2;
  v14 = readpassphrase(v12, __s1, 0x102uLL, v13);

  if (v14)
  {
    if (!v5)
    {
      -[DIEncryptionFrontend CLIVerifyPassphrasePrompt](self, "CLIVerifyPassphrasePrompt");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15 == 0;

      if (!v16)
      {
        -[DIEncryptionFrontend CLIVerifyPassphrasePrompt](self, "CLIVerifyPassphrasePrompt");
        v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v18 = readpassphrase((const char *)objc_msgSend(v17, "UTF8String"), (char *)buf, 0x102uLL, 2);

        if (!v18)
          return +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 25, CFSTR("Failed to read passphrase"), a4);
        if (strncmp(__s1, (const char *)buf, 0x101uLL))
          return +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 80, CFSTR("Passphrases doesn't match"), a4);
      }
    }
    -[DIEncryptionFrontend diParams](self, "diParams", v27, v28);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "setPassphrase:error:", __s1, a4);

  }
  else
  {
    if (v5)
      return +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 25, CFSTR("Failed to read passphrase from stdin"), a4);
    v22 = *__error();
    if (DIForwardLogs())
    {
      getDIOSLog();
      v23 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68157954;
      v30 = 66;
      v31 = 2080;
      v32 = "-[DIEncryptionFrontend consoleAskForPassphraseWithUseStdin:error:]";
      v24 = (char *)_os_log_send_and_compose_impl();

      if (v24)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v24);
        free(v24);
      }
    }
    else
    {
      getDIOSLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        v30 = 66;
        v31 = 2080;
        v32 = "-[DIEncryptionFrontend consoleAskForPassphraseWithUseStdin:error:]";
        _os_log_impl(&dword_212EB0000, v25, OS_LOG_TYPE_DEFAULT, "%.*s: Failed to read passphrase from TTY", buf, 0x12u);
      }

    }
    *__error() = v22;
    return 1;
  }
  return v21;
}

- (BOOL)checkWithHasIcloudKeychain:(BOOL *)a3 error:(id *)a4
{
  *a3 = 1;
  return 1;
}

+ (BOOL)updateSystemKeychainAttrWithDict:(id)a3 isStoring:(BOOL)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)storeInKeychainWithPassphrase:(id)a3 forceSystemKeychain:(BOOL)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  const char *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  BOOL v25;
  int v26;
  NSObject *v27;
  const char *v28;
  char *v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  void *v34;
  char v35;
  uint8_t buf[4];
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  _QWORD v42[7];
  _QWORD v43[9];

  v43[7] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  -[DIEncryptionFrontend diParams](self, "diParams");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "inputURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastPathComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_retainAutorelease(v8);
  v14 = (const char *)objc_msgSend(v13, "UTF8String");
  if (v14 && *v14)
  {
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v14, strlen(v14));
    v15 = (void *)MEMORY[0x24BDBCED8];
    v16 = *MEMORY[0x24BDE9220];
    v43[0] = *MEMORY[0x24BDE9230];
    v17 = *MEMORY[0x24BDE8FA8];
    v42[0] = v16;
    v42[1] = v17;
    -[DIEncryptionFrontend encryptionUUID](self, "encryptionUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v19;
    v43[2] = CFSTR("disk image password");
    v20 = *MEMORY[0x24BDE90A0];
    v42[2] = *MEMORY[0x24BDE8FF0];
    v42[3] = v20;
    v21 = *MEMORY[0x24BDE9128];
    v43[3] = v12;
    v43[4] = v12;
    v22 = *MEMORY[0x24BDE9140];
    v42[4] = v21;
    v42[5] = v22;
    v42[6] = *MEMORY[0x24BDE9550];
    v43[5] = MEMORY[0x24BDBD1C8];
    v43[6] = v34;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dictionaryWithDictionary:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = 0;
    if (a4)
      goto LABEL_28;
    if (!-[DIEncryptionFrontend checkWithHasIcloudKeychain:error:](self, "checkWithHasIcloudKeychain:error:", &v35, a5))
    {
LABEL_14:
      v25 = 0;
LABEL_24:

      goto LABEL_25;
    }
    if (!v35)
    {
LABEL_28:
      if (!+[DIEncryptionFrontend updateSystemKeychainAttrWithDict:isStoring:error:](DIEncryptionFrontend, "updateSystemKeychainAttrWithDict:isStoring:error:", v24, 1, a5))goto LABEL_14;
    }
    v26 = *__error();
    if (DIForwardLogs())
    {
      getDIOSLog();
      v27 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
      v28 = "iCloud";
      *(_DWORD *)buf = 68158210;
      v37 = 80;
      v39 = "-[DIEncryptionFrontend storeInKeychainWithPassphrase:forceSystemKeychain:error:]";
      v38 = 2080;
      if (!v35)
        v28 = "system";
      v40 = 2080;
      v41 = v28;
      v29 = (char *)_os_log_send_and_compose_impl();

      if (v29)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v29);
        free(v29);
      }
    }
    else
    {
      getDIOSLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        if (v35)
          v31 = "iCloud";
        else
          v31 = "system";
        *(_DWORD *)buf = 68158210;
        v37 = 80;
        v38 = 2080;
        v39 = "-[DIEncryptionFrontend storeInKeychainWithPassphrase:forceSystemKeychain:error:]";
        v40 = 2080;
        v41 = v31;
        _os_log_impl(&dword_212EB0000, v30, OS_LOG_TYPE_DEFAULT, "%.*s: Storing passphrase in the %s keychain", buf, 0x1Cu);
      }

    }
    *__error() = v26;
    v32 = SecItemAdd((CFDictionaryRef)v24, 0);
    if ((_DWORD)v32)
      v25 = +[DIError failWithOSStatus:description:error:](DIError, "failWithOSStatus:description:error:", v32, CFSTR("Failed to store the passphrase in the keychain"), a5);
    else
      v25 = 1;
    goto LABEL_24;
  }
  v25 = +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 154, CFSTR("Cannot store an empty passphrase"), a5);
LABEL_25:

  return v25;
}

- (BOOL)askPermissionWithRememberPassword:(BOOL *)a3 error:(id *)a4
{
  int v6;
  NSObject *v7;
  char *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  const __CFDictionary *v12;
  __CFUserNotification *v13;
  __CFUserNotification *v14;
  BOOL v15;
  BOOL v16;
  void *v17;
  SInt32 error[2];
  _QWORD v20[4];
  _QWORD v21[4];
  uint8_t buf[8];
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (!-[DIEncryptionFrontend allowStoringInKeychain](self, "allowStoringInKeychain"))
    return 1;
  v6 = *__error();
  if (DIForwardLogs())
  {
    *(_QWORD *)error = 0;
    getDIOSLog();
    v7 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    *(_DWORD *)&buf[4] = 64;
    v23 = 2080;
    v24 = "-[DIEncryptionFrontend askPermissionWithRememberPassword:error:]";
    v8 = (char *)_os_log_send_and_compose_impl();

    if (v8)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v8);
      free(v8);
    }
  }
  else
  {
    getDIOSLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      *(_DWORD *)&buf[4] = 64;
      v23 = 2080;
      v24 = "-[DIEncryptionFrontend askPermissionWithRememberPassword:error:]";
      _os_log_impl(&dword_212EB0000, v9, OS_LOG_TYPE_DEFAULT, "%.*s: Asking user permission to store the passphrase in the keychain", buf, 0x12u);
    }

  }
  *__error() = v6;
  error[0] = 0;
  v10 = *MEMORY[0x24BDBD6F8];
  v20[0] = *MEMORY[0x24BDBD6D8];
  v20[1] = v10;
  v21[0] = CFSTR("Remember password in my keychain?");
  v21[1] = CFSTR("Yes");
  v11 = *MEMORY[0x24BDBD6F0];
  v20[2] = *MEMORY[0x24BDBD718];
  v20[3] = v11;
  v21[2] = CFSTR("No");
  v21[3] = CFSTR("Cancel");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
  v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v13 = CFUserNotificationCreate(0, 0.0, 3uLL, error, v12);
  v14 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CFUserNotificationCreate failed, error code %d"), error[0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 154, v17, a4);

    return v16;
  }
  *(_QWORD *)buf = 0;
  if (!CFUserNotificationReceiveResponse(v13, 0.0, (CFOptionFlags *)buf))
  {
    if (*(_QWORD *)buf != 2)
    {
      if (*(_QWORD *)buf)
      {
        v15 = +[DIError failWithPOSIXCode:description:error:](DIError, "failWithPOSIXCode:description:error:", 89, CFSTR("The operation was cancelled by the user"), a4);
        goto LABEL_11;
      }
      *a3 = 1;
    }

    return 1;
  }
  v15 = +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 154, CFSTR("CFUserNotificationReceiveResponse failed"), a4);
LABEL_11:
  v16 = v15;

  return v16;
}

- (BOOL)GUIAskForPassphraseWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CFOptionFlags v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const __CFDictionary *v16;
  __CFUserNotification *v17;
  __CFUserNotification *v18;
  BOOL v19;
  void *v20;
  id v21;
  BOOL v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  char v26;
  _BOOL4 v27;
  _BOOL4 v28;
  char v30;
  CFOptionFlags responseFlags;
  SInt32 error;
  _QWORD v33[4];
  _QWORD v34[5];

  v34[4] = *MEMORY[0x24BDAC8D0];
  error = 0;
  v5 = (void *)MEMORY[0x24BDBCEB8];
  -[DIEncryptionFrontend GUIPassphraseLabel](self, "GUIPassphraseLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[DIEncryptionFrontend GUIVerifyPassphraseLabel](self, "GUIVerifyPassphraseLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 65539;

  if (v8)
  {
    -[DIEncryptionFrontend GUIVerifyPassphraseLabel](self, "GUIVerifyPassphraseLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v10);

    v9 = 196611;
  }
  v11 = (void *)MEMORY[0x24BDBCED8];
  v33[0] = *MEMORY[0x24BDBD6D8];
  -[DIEncryptionFrontend GUIPassphrasePrompt](self, "GUIPassphrasePrompt");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x24BDBD6F8];
  v34[0] = v12;
  v34[1] = CFSTR("OK");
  v14 = *MEMORY[0x24BDBD6F0];
  v33[1] = v13;
  v33[2] = v14;
  v33[3] = *MEMORY[0x24BDBD720];
  v34[2] = CFSTR("Cancel");
  v34[3] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryWithDictionary:", v15);
  v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v17 = CFUserNotificationCreate(0, 0.0, v9, &error, v16);
  v18 = v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CFUserNotificationCreate failed, error code %d"), error);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 154, v20, a3);

    goto LABEL_24;
  }
  responseFlags = 0;
  if (!CFUserNotificationReceiveResponse(v17, 0.0, &responseFlags))
  {
    v30 = BYTE1(responseFlags) & 1;
    if ((responseFlags & 3) != 0)
    {
      v21 = 0;
      v22 = +[DIError failWithPOSIXCode:description:error:](DIError, "failWithPOSIXCode:description:error:", 89, CFSTR("The operation was cancelled by the user"), a3);
    }
    else
    {
      v23 = (const __CFString *)*MEMORY[0x24BDBD728];
      CFUserNotificationGetResponseValue(v18, (CFStringRef)*MEMORY[0x24BDBD728], 0);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        CFUserNotificationGetResponseValue(v18, v23, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v21, "isEqualToString:", v24))
        {
          v19 = +[DIError failWithPOSIXCode:description:error:](DIError, "failWithPOSIXCode:description:error:", 80, CFSTR("Passwords don’t match"), a3);

          goto LABEL_23;
        }

      }
      -[DIEncryptionFrontend diParams](self, "diParams");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_retainAutorelease(v21);
      v26 = objc_msgSend(v25, "setPassphrase:error:", objc_msgSend(v21, "UTF8String"), a3);

      if ((v26 & 1) == 0
        || !-[DIEncryptionFrontend askPermissionWithRememberPassword:error:](self, "askPermissionWithRememberPassword:error:", &v30, a3))
      {
        v19 = 0;
        goto LABEL_23;
      }
      v27 = -[DIEncryptionFrontend allowStoringInKeychain](self, "allowStoringInKeychain");
      if (v30)
        v28 = v27;
      else
        v28 = 0;
      if (!v28)
      {
        v19 = 1;
        goto LABEL_23;
      }
      v22 = -[DIEncryptionFrontend storeInKeychainWithPassphrase:forceSystemKeychain:error:](self, "storeInKeychainWithPassphrase:forceSystemKeychain:error:", v21, 0, a3);
    }
    v19 = v22;
LABEL_23:

    goto LABEL_24;
  }
  v19 = +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 154, CFSTR("CFUserNotificationReceiveResponse failed"), a3);
LABEL_24:

  return v19;
}

+ (BOOL)hasGUIaccess
{
  return 1;
}

- (BOOL)updateDiskImageParamsWithFrontend:(id)a3 error:(id *)a4
{
  id v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = objc_msgSend(v6, "validateDeserializationWithError:", a4);
  if ((v7 & 1) != 0)
  {
    objc_msgSend(v6, "diParams");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "diskImageParamsXPC");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DIEncryptionFrontend diParams](self, "diParams");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDiskImageParamsXPC:", v9);

    -[DIEncryptionFrontend setAllowStoringInKeychain:](self, "setAllowStoringInKeychain:", objc_msgSend(v6, "allowStoringInKeychain"));
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIEncryptionFrontend)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  DIEncryptionFrontend *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("diParams"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[DIEncryptionFrontend initWithParams:](self, "initWithParams:", v5);
  if (v6)
    v6->_allowStoringInKeychain = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowStoringInKeychain"));

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[DIEncryptionFrontend diParams](self, "diParams");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("diParams"));

  objc_msgSend(v5, "encodeBool:forKey:", -[DIEncryptionFrontend allowStoringInKeychain](self, "allowStoringInKeychain"), CFSTR("allowStoringInKeychain"));
}

- (BOOL)validateDeserializationWithError:(id *)a3
{
  void *v4;

  -[DIEncryptionFrontend diParams](self, "diParams");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "validateDeserializationWithError:", a3);

  return (char)a3;
}

- (NSString)GUIPassphrasePrompt
{
  return self->_GUIPassphrasePrompt;
}

- (NSString)GUIPassphraseLabel
{
  return self->_GUIPassphraseLabel;
}

- (NSString)GUIVerifyPassphraseLabel
{
  return self->_GUIVerifyPassphraseLabel;
}

- (NSString)CLIPassphrasePrompt
{
  return self->_CLIPassphrasePrompt;
}

- (NSString)CLIVerifyPassphrasePrompt
{
  return self->_CLIVerifyPassphrasePrompt;
}

- (DIBaseParams)diParams
{
  return self->_diParams;
}

- (NSUUID)encryptionUUID
{
  return self->_encryptionUUID;
}

- (BOOL)allowStoringInKeychain
{
  return self->_allowStoringInKeychain;
}

- (void)setAllowStoringInKeychain:(BOOL)a3
{
  self->_allowStoringInKeychain = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionUUID, 0);
  objc_storeStrong((id *)&self->_diParams, 0);
  objc_storeStrong((id *)&self->_CLIVerifyPassphrasePrompt, 0);
  objc_storeStrong((id *)&self->_CLIPassphrasePrompt, 0);
  objc_storeStrong((id *)&self->_GUIVerifyPassphraseLabel, 0);
  objc_storeStrong((id *)&self->_GUIPassphraseLabel, 0);
  objc_storeStrong((id *)&self->_GUIPassphrasePrompt, 0);
}

@end
