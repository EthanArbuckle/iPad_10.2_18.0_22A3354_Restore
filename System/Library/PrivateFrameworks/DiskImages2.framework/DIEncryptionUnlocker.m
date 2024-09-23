@implementation DIEncryptionUnlocker

- (id)GUIPassphrasePrompt
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[DIEncryptionFrontend diParams](self, "diParams");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Enter password to access “%@”"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)GUIPassphraseLabel
{
  return CFSTR("Password");
}

- (id)CLIPassphrasePrompt
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[DIEncryptionFrontend diParams](self, "diParams");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Enter password to access “%@”: "), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)keychainUnlockWithIsSystemKeychain:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const __CFDictionary *v16;
  int v17;
  NSObject *v18;
  const char *v19;
  char *v20;
  NSObject *v21;
  const char *v22;
  OSStatus v23;
  OSStatus v24;
  int v25;
  NSObject *v26;
  char *v27;
  int v28;
  NSObject *v29;
  char *v30;
  NSObject *v31;
  int v32;
  NSObject *v33;
  char *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  char v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  BOOL v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  uint8_t *v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  CFTypeRef result;
  uint8_t buf[4];
  int v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  const char *v58;
  _QWORD v59[4];
  _QWORD v60[5];

  v5 = a3;
  v60[4] = *MEMORY[0x24BDAC8D0];
  result = 0;
  v7 = (void *)MEMORY[0x24BDBCED8];
  v8 = *MEMORY[0x24BDE9220];
  v60[0] = *MEMORY[0x24BDE9230];
  v9 = *MEMORY[0x24BDE8FA8];
  v59[0] = v8;
  v59[1] = v9;
  -[DIEncryptionFrontend encryptionUUID](self, "encryptionUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x24BDE9140];
  v13 = *MEMORY[0x24BDE9148];
  v60[1] = v11;
  v60[2] = v13;
  v14 = *MEMORY[0x24BDE94C8];
  v59[2] = v12;
  v59[3] = v14;
  v60[3] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v60, v59, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryWithDictionary:", v15);
  v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  if (v5
    && !+[DIEncryptionFrontend updateSystemKeychainAttrWithDict:isStoring:error:](DIEncryptionFrontend, "updateSystemKeychainAttrWithDict:isStoring:error:", v16, 0, 0))
  {
    goto LABEL_50;
  }
  v17 = *__error();
  if (DIForwardLogs())
  {
    v51 = 0;
    getDIOSLog();
    v18 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    v19 = "iCloud";
    *(_DWORD *)buf = 68158210;
    v54 = 65;
    v56 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
    v55 = 2080;
    if (v5)
      v19 = "system";
    v57 = 2080;
    v58 = v19;
    LODWORD(v49) = 28;
    v48 = buf;
    v20 = (char *)_os_log_send_and_compose_impl();

    if (v20)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v20);
      free(v20);
    }
  }
  else
  {
    getDIOSLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = "iCloud";
      *(_DWORD *)buf = 68158210;
      v54 = 65;
      v56 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
      v55 = 2080;
      if (v5)
        v22 = "system";
      v57 = 2080;
      v58 = v22;
      _os_log_impl(&dword_212EB0000, v21, OS_LOG_TYPE_DEFAULT, "%.*s: Looking for encrypted image passphrase in the %s keychain", buf, 0x1Cu);
    }

  }
  *__error() = v17;
  v23 = SecItemCopyMatching(v16, &result);
  v24 = v23;
  if (v23 == -25308)
  {
    v25 = *__error();
    if (!DIForwardLogs())
    {
      getDIOSLog();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        v54 = 65;
        v55 = 2080;
        v56 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
        _os_log_impl(&dword_212EB0000, v45, OS_LOG_TYPE_DEFAULT, "%.*s: Keychain item requires ACL upgrade", buf, 0x12u);
      }

      goto LABEL_45;
    }
    v51 = 0;
    getDIOSLog();
    v31 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    v54 = 65;
    v55 = 2080;
    v56 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
    LODWORD(v49) = 18;
    v48 = buf;
    v27 = (char *)_os_log_send_and_compose_impl();

    if (v27)
    {
LABEL_24:
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v27);
      free(v27);
    }
LABEL_45:
    *__error() = v25;
    v43 = 1;
    -[DIEncryptionFrontend setAllowStoringInKeychain:](self, "setAllowStoringInKeychain:", 1, v48, v49);
    goto LABEL_51;
  }
  if (v23)
  {
    if (v23 == -25300)
    {
      v25 = *__error();
      if (!DIForwardLogs())
      {
        getDIOSLog();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68157954;
          v54 = 65;
          v55 = 2080;
          v56 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
          _os_log_impl(&dword_212EB0000, v44, OS_LOG_TYPE_DEFAULT, "%.*s: No matching item found in keychain", buf, 0x12u);
        }

        goto LABEL_45;
      }
      v51 = 0;
      getDIOSLog();
      v26 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68157954;
      v54 = 65;
      v55 = 2080;
      v56 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
      LODWORD(v49) = 18;
      v48 = buf;
      v27 = (char *)_os_log_send_and_compose_impl();

      if (v27)
        goto LABEL_24;
      goto LABEL_45;
    }
    v32 = *__error();
    if (DIForwardLogs())
    {
      v51 = 0;
      getDIOSLog();
      v33 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68158210;
      v54 = 65;
      v55 = 2080;
      v56 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
      v57 = 1024;
      LODWORD(v58) = v24;
      v34 = (char *)_os_log_send_and_compose_impl();

      if (v34)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v34);
        free(v34);
      }
    }
    else
    {
      getDIOSLog();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68158210;
        v54 = 65;
        v55 = 2080;
        v56 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
        v57 = 1024;
        LODWORD(v58) = v24;
        _os_log_impl(&dword_212EB0000, v46, OS_LOG_TYPE_DEFAULT, "%.*s: Keychain lookup returned %d", buf, 0x18u);
      }

    }
    *__error() = v32;
LABEL_50:
    v43 = 1;
    goto LABEL_51;
  }
  v28 = *__error();
  if (DIForwardLogs())
  {
    v51 = 0;
    getDIOSLog();
    v29 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    v54 = 65;
    v55 = 2080;
    v56 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
    v30 = (char *)_os_log_send_and_compose_impl();

    if (v30)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v30);
      free(v30);
    }
  }
  else
  {
    getDIOSLog();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      v54 = 65;
      v55 = 2080;
      v56 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
      _os_log_impl(&dword_212EB0000, v35, OS_LOG_TYPE_DEFAULT, "%.*s: Passphrase found in keychain, unlocking the image", buf, 0x12u);
    }

  }
  *__error() = v28;
  v36 = (void *)result;
  -[DIEncryptionFrontend diParams](self, "diParams");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_retainAutorelease(v36);
  v50 = 0;
  v39 = objc_msgSend(v37, "setPassphrase:error:", objc_msgSend(v38, "bytes"), &v50);
  v40 = v50;

  if ((v39 & 1) != 0 || ((v41 = objc_msgSend(v40, "code"), v41 >= 0) ? (v42 = v41) : (v42 = -v41), v42 == 80))
  {
    v43 = 1;
  }
  else
  {
    v43 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v40);
  }

LABEL_51:
  return v43;
}

- (BOOL)keychainUnlockWithError:(id *)a3
{
  _BOOL4 v5;
  BOOL result;
  _BOOL4 v7;
  char v8;

  v8 = 0;
  v5 = -[DIEncryptionFrontend checkWithHasIcloudKeychain:error:](self, "checkWithHasIcloudKeychain:error:", &v8, a3);
  result = 0;
  if (v5)
  {
    if (!v8)
      return 1;
    v7 = -[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:](self, "keychainUnlockWithIsSystemKeychain:error:", 0, a3);
    result = 0;
    if (v7)
      return 1;
  }
  return result;
}

- (BOOL)lookupLegacyKeychainWithXpcHandler:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)tryUnlockUsingSaksWithHasSaksKey:(BOOL *)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  char v12;
  _OWORD v14[6];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  memset(v14, 0, 89);
  -[DIEncryptionFrontend diParams](self, "diParams");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "diskImageParamsXPC");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "backendXPC");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[DICryptoHelper getPassphraseUsingSaksWithBackendXPC:passPhrase:error:](DICryptoHelper, "getPassphraseUsingSaksWithBackendXPC:passPhrase:error:", v9, v14, a4);

  if (!v10)
    return 0;
  if (!LOBYTE(v14[0]))
    return 1;
  if (a3)
    *a3 = 1;
  -[DIEncryptionFrontend diParams](self, "diParams");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "setPassphrase:error:", v14, a4);

  return v12;
}

- (BOOL)unlockWithXpcHandler:(id)a3 error:(id *)a4
{
  id v6;
  char v7;
  char v8;
  char v9;
  BOOL v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  void *v25;
  char v26;
  id v27;
  char v28;
  id v29;

  v6 = a3;
  v7 = -[DIEncryptionFrontend flags](self, "flags");
  v8 = v7;
  if ((v7 & 8) != 0)
  {
    v10 = -[DIEncryptionFrontend consoleAskForPassphraseWithUseStdin:error:](self, "consoleAskForPassphraseWithUseStdin:error:", 1, a4);
LABEL_7:
    v9 = v10;
    goto LABEL_23;
  }
  if ((v7 & 1) == 0)
  {
LABEL_3:
    v28 = 0;
    if (-[DIEncryptionUnlocker tryUnlockUsingSaksWithHasSaksKey:error:](self, "tryUnlockUsingSaksWithHasSaksKey:error:", &v28, a4))
    {
      if (v28)
      {
LABEL_5:
        v9 = 1;
LABEL_23:
        v13 = 0;
        goto LABEL_24;
      }
      if ((v8 & 2) == 0)
        goto LABEL_14;
      if (-[DIEncryptionFrontend consoleAskForPassphraseWithUseStdin:error:](self, "consoleAskForPassphraseWithUseStdin:error:", 0, a4))
      {
        -[DIEncryptionFrontend diParams](self, "diParams");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "hasUnlockedBackend");

        if ((v17 & 1) != 0)
          goto LABEL_5;
LABEL_14:
        if ((v8 & 4) != 0)
        {
          v19 = 0;
          v20 = 2;
          while (1)
          {
            v27 = v19;
            v9 = objc_msgSend(v6, "GUIAskForPassphraseWithEncryptionFrontend:error:", self, &v27);
            v21 = v27;

            if ((v9 & 1) != 0)
              break;
            v22 = objc_msgSend(v21, "code");
            if (v22 >= 0)
              v23 = v22;
            else
              v23 = -v22;
            v24 = v23 != 80 || v20-- == 0;
            v19 = v21;
            if (v24)
            {
              if (a4)
                *a4 = objc_retainAutorelease(v21);
              break;
            }
          }

          goto LABEL_23;
        }
        v10 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 25, CFSTR("Cannot retrieve passphrase from user via TTY or GUI"), a4);
        goto LABEL_7;
      }
    }
    v9 = 0;
    goto LABEL_23;
  }
  -[DIEncryptionFrontend diParams](self, "diParams");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v12 = objc_msgSend(v11, "tryUnlockUsingKeychainCertificateWithError:", &v29);
  v13 = v29;

  if ((v12 & 1) != 0)
    goto LABEL_9;
  if (v13)
  {
    if (a4)
    {
      v13 = objc_retainAutorelease(v13);
      v9 = 0;
      *a4 = v13;
      goto LABEL_24;
    }
LABEL_43:
    v9 = 0;
    goto LABEL_24;
  }
  if (!objc_msgSend(v6, "keychainUnlockWithEncryptionUnlocker:error:", self, a4))
    goto LABEL_42;
  -[DIEncryptionFrontend diParams](self, "diParams");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hasUnlockedBackend");

  if ((v15 & 1) == 0)
  {
    if (!-[DIEncryptionFrontend allowStoringInKeychain](self, "allowStoringInKeychain"))
      goto LABEL_3;
    if (-[DIEncryptionUnlocker lookupLegacyKeychainWithXpcHandler:error:](self, "lookupLegacyKeychainWithXpcHandler:error:", v6, a4))
    {
      -[DIEncryptionFrontend diParams](self, "diParams");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "hasUnlockedBackend");

      if ((v26 & 1) == 0)
        goto LABEL_3;
      goto LABEL_18;
    }
LABEL_42:
    v13 = 0;
    goto LABEL_43;
  }
LABEL_18:
  v13 = 0;
LABEL_9:
  v9 = 1;
LABEL_24:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
