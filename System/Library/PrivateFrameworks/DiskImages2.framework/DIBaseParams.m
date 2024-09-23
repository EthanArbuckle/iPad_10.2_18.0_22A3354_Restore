@implementation DIBaseParams

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)RAMdisk
{
  void *v2;
  char isKindOfClass;

  -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (DIBaseParams)initWithCoder:(id)a3
{
  id v4;
  DIBaseParams *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  DIURL *inputURL;
  uint64_t v13;
  DIShadowChain *shadowChain;
  uint64_t v15;
  DiskImageParamsXPC *diskImageParamsXPC;
  uint64_t v17;
  NSError *deserializationError;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)DIBaseParams;
  v5 = -[DIBaseParams init](&v20, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("debugLogsEnabled"));
    v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("forwardLogs"));
    DISetDebugLogsEnabled(v6);
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "processName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("diskimagesiod"));

    if ((v10 & 1) == 0)
      DISetForwardLogs(v7);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputURL"));
    v11 = objc_claimAutoreleasedReturnValue();
    inputURL = v5->_inputURL;
    v5->_inputURL = (DIURL *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shadowChain"));
    v13 = objc_claimAutoreleasedReturnValue();
    shadowChain = v5->_shadowChain;
    v5->_shadowChain = (DIShadowChain *)v13;

    v5->_readPassphraseFlags = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("readPassphraseFlags"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("diskImageParams"));
    v15 = objc_claimAutoreleasedReturnValue();
    diskImageParamsXPC = v5->_diskImageParamsXPC;
    v5->_diskImageParamsXPC = (DiskImageParamsXPC *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deserializationError"));
    v17 = objc_claimAutoreleasedReturnValue();
    deserializationError = v5->_deserializationError;
    v5->_deserializationError = (NSError *)v17;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeBool:forKey:", DIDebugLogsEnabled(), CFSTR("debugLogsEnabled"));
  objc_msgSend(v8, "encodeBool:forKey:", DIForwardLogs(), CFSTR("forwardLogs"));
  -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("diskImageParams"));

  -[DIBaseParams inputURL](self, "inputURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("inputURL"));

  -[DIBaseParams shadowChain](self, "shadowChain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("shadowChain"));

  objc_msgSend(v8, "encodeInteger:forKey:", -[DIBaseParams readPassphraseFlags](self, "readPassphraseFlags"), CFSTR("readPassphraseFlags"));
  -[DIBaseParams deserializationError](self, "deserializationError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("deserializationError"));

}

- (DIBaseParams)initWithURL:(id)a3 error:(id *)a4
{
  id v6;
  DIBaseParams *v7;
  DIURL *v8;
  DIURL *inputURL;
  DIShadowChain *v10;
  DIShadowChain *shadowChain;
  void *v12;
  void *v13;
  DIBaseParams *v14;
  DIBaseParams *v15;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DIBaseParams;
  v7 = -[DIBaseParams init](&v17, sel_init);
  if (v7)
  {
    v8 = +[DIURL newDIURLWithNSURL:](DIURL, "newDIURLWithNSURL:", v6);
    inputURL = v7->_inputURL;
    v7->_inputURL = v8;

    v7->_readPassphraseFlags = 7;
    v10 = objc_alloc_init(DIShadowChain);
    shadowChain = v7->_shadowChain;
    v7->_shadowChain = v10;

    -[DIURL path](v7->_inputURL, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12
      || (objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", v6, 1),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v13,
          v12,
          !v13))
    {
      +[DIError nilWithPOSIXCode:description:error:](DIError, "nilWithPOSIXCode:description:error:", 22, CFSTR("Malformed URL format"), a4);
      v14 = (DIBaseParams *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    if (!-[DIBaseParams tryResolvePstackChain:](v7, "tryResolvePstackChain:", a4))
    {
      v15 = 0;
      goto LABEL_10;
    }
    if (-[DIBaseParams isPstack](v7, "isPstack") && !-[DIBaseParams supportsPstack](v7, "supportsPstack"))
    {
      +[DIError nilWithPOSIXCode:verboseInfo:error:](DIError, "nilWithPOSIXCode:verboseInfo:error:", 22, CFSTR("This operation doesn't support pstack files"), a4);
      v14 = (DIBaseParams *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  v14 = v7;
LABEL_9:
  v15 = v14;
LABEL_10:

  return v15;
}

- (BOOL)openExistingImageWithFlags:(int)a3 error:(id *)a4
{
  uint64_t v5;
  void *v7;
  int v8;
  NSObject *v9;
  char *v10;
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v5 = *(_QWORD *)&a3;
  v21 = *MEMORY[0x24BDAC8D0];
  -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *__error();
    if (DIForwardLogs())
    {
      getDIOSLog();
      v9 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68157954;
      v18 = 49;
      v19 = 2080;
      v20 = "-[DIBaseParams openExistingImageWithFlags:error:]";
      v10 = (char *)_os_log_send_and_compose_impl();

      if (v10)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v10);
        free(v10);
      }
    }
    else
    {
      getDIOSLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        v18 = 49;
        v19 = 2080;
        v20 = "-[DIBaseParams openExistingImageWithFlags:error:]";
        _os_log_impl(&dword_212EB0000, v15, OS_LOG_TYPE_DEFAULT, "%.*s: Using existing disk image params", buf, 0x12u);
      }

    }
    *__error() = v8;
    return 1;
  }
  else
  {
    -[DIBaseParams inputURL](self, "inputURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = +[DiskImageParamsXPC newWithURL:fileOpenFlags:error:](DiskImageParamsXPC, "newWithURL:fileOpenFlags:error:", v11, v5, a4);
    -[DIBaseParams setDiskImageParamsXPC:](self, "setDiskImageParamsXPC:", v12);

    -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13 != 0;

  }
  return v14;
}

- (BOOL)supportsPstack
{
  return 1;
}

- (BOOL)tryResolvePstackChain:(id *)a3
{
  void *v5;
  BOOL v6;
  id v7;
  id v8;
  void *v9;
  _BOOL4 v10;
  DiskImageGraph *v11;
  void *v12;
  DiskImageGraph *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  DIURL *v23;
  DIURL *inputURL;
  void *v25;
  _BOOL4 v26;
  int v27;
  NSObject *v28;
  char *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  DiskImageGraph *v34;
  id v35;
  id v36;
  uint8_t buf[4];
  int v38;
  __int16 v39;
  const char *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  -[DIBaseParams inputURL](self, "inputURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  v36 = 0;
  v6 = +[DiskImageGraph loadPlistDictFromURL:dict:error:](DiskImageGraph, "loadPlistDictFromURL:dict:error:", v5, &v36, &v35);
  v7 = v36;
  v8 = v35;

  if (v6)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("PstackVersion"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 == 0;

    if (!v10)
    {
      self->_isPstack = 1;
      v11 = [DiskImageGraph alloc];
      -[DIBaseParams inputURL](self, "inputURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[DiskImageGraph initWithData:pstackURL:imported:error:](v11, "initWithData:pstackURL:imported:error:", v7, v12, 0, a3);

      if (v13)
      {
        v34 = v13;
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[DiskImageGraph activeNode](v34, "activeNode");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          do
          {
            objc_msgSend(v15, "toDIShadowNode");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v16);

            objc_msgSend(v15, "parent");
            v17 = objc_claimAutoreleasedReturnValue();

            v15 = (void *)v17;
          }
          while (v17);
        }

        objc_msgSend(v14, "lastObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "removeLastObject");
        objc_msgSend(v14, "reverseObjectEnumerator");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "allObjects");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        -[DIBaseParams shadowChain](self, "shadowChain");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "addShadowNodes:error:", v20, a3);

        if ((v22 & 1) != 0)
        {
          objc_msgSend(v18, "URL");
          v23 = (DIURL *)objc_claimAutoreleasedReturnValue();
          inputURL = self->_inputURL;
          self->_inputURL = v23;

        }
      }
      else
      {
        v22 = 0;
      }

      goto LABEL_34;
    }
    if (DIDebugLogsEnabled())
    {
      v27 = *__error();
      if (!DIForwardLogs())
      {
        getDIOSLog();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 68157954;
          v38 = 38;
          v39 = 2080;
          v40 = "-[DIBaseParams tryResolvePstackChain:]";
          _os_log_impl(&dword_212EB0000, v31, OS_LOG_TYPE_DEBUG, "%.*s: Not a pstack", buf, 0x12u);
        }

        goto LABEL_32;
      }
      getDIOSLog();
      v30 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG);
      *(_DWORD *)buf = 68157954;
      v38 = 38;
      v39 = 2080;
      v40 = "-[DIBaseParams tryResolvePstackChain:]";
      v29 = (char *)_os_log_send_and_compose_impl();

      if (v29)
        goto LABEL_14;
      goto LABEL_32;
    }
    goto LABEL_33;
  }
  objc_msgSend(v8, "domain");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "isEqualToString:", CFSTR("com.apple.DiskImages2.ErrorDomain")))
  {
    v26 = objc_msgSend(v8, "code") == 167;

    if (v26)
    {
      if (DIDebugLogsEnabled())
      {
        v27 = *__error();
        if (!DIForwardLogs())
        {
          getDIOSLog();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 68157954;
            v38 = 38;
            v39 = 2080;
            v40 = "-[DIBaseParams tryResolvePstackChain:]";
            _os_log_impl(&dword_212EB0000, v32, OS_LOG_TYPE_DEBUG, "%.*s: Not a pstack", buf, 0x12u);
          }

          goto LABEL_32;
        }
        getDIOSLog();
        v28 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG);
        *(_DWORD *)buf = 68157954;
        v38 = 38;
        v39 = 2080;
        v40 = "-[DIBaseParams tryResolvePstackChain:]";
        v29 = (char *)_os_log_send_and_compose_impl();

        if (v29)
        {
LABEL_14:
          fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v29);
          free(v29);
        }
LABEL_32:
        *__error() = v27;
      }
LABEL_33:
      v22 = 1;
      goto LABEL_34;
    }
  }
  else
  {

  }
  v22 = 0;
  if (a3)
    *a3 = objc_retainAutorelease(v8);
LABEL_34:

  return v22;
}

- (BOOL)checkBeforeSetWithIsPassphrase:(BOOL)a3 error:(id *)a4
{
  __CFString *v6;
  __CFString *v7;
  BOOL v8;
  void *v9;
  BOOL v10;
  void *v11;
  char isKindOfClass;

  v6 = CFSTR("Public key");
  if (a3)
    v6 = CFSTR("Passphrase");
  v7 = v6;
  if (!-[DIBaseParams hasUnlockedBackend](self, "hasUnlockedBackend"))
  {
    if (-[DIBaseParams RAMdisk](self, "RAMdisk"))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("A %@ cannot be specified for RAM disks"), v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 150, v9, a4);
    }
    else
    {
      -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v8 = 1;
        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("A %@ was specified, but the image file doesn't seem to be encrypted"), v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 150, v9, a4);
    }
    v8 = v10;

    goto LABEL_11;
  }
  v8 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Too many calls to set, the image is already unlocked"), a4);
LABEL_11:

  return v8;
}

- (BOOL)setPassphrase:(const char *)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  BOOL v9;
  int v10;
  NSObject *v11;
  char *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t *v17;
  uint64_t v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (-[DIBaseParams checkBeforeSetWithIsPassphrase:error:](self, "checkBeforeSetWithIsPassphrase:error:", 1))
  {
    -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "newWithPassphrase:error:", a3, a4);
    v9 = v8 != 0;
    if (!v8)
    {
LABEL_19:

      return v9;
    }
    if (a3)
    {
      v10 = *__error();
      if (!DIForwardLogs())
      {
        getDIOSLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68157954;
          v20 = 36;
          v21 = 2080;
          v22 = "-[DIBaseParams setPassphrase:error:]";
          _os_log_impl(&dword_212EB0000, v14, OS_LOG_TYPE_DEFAULT, "%.*s: Passphrase is correct", buf, 0x12u);
        }

        goto LABEL_18;
      }
      getDIOSLog();
      v11 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68157954;
      v20 = 36;
      v21 = 2080;
      v22 = "-[DIBaseParams setPassphrase:error:]";
      LODWORD(v18) = 18;
      v17 = buf;
      v12 = (char *)_os_log_send_and_compose_impl();

      if (v12)
        goto LABEL_10;
    }
    else
    {
      v10 = *__error();
      if (!DIForwardLogs())
      {
        getDIOSLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68157954;
          v20 = 36;
          v21 = 2080;
          v22 = "-[DIBaseParams setPassphrase:error:]";
          _os_log_impl(&dword_212EB0000, v15, OS_LOG_TYPE_DEFAULT, "%.*s: Found certificate in keychain", buf, 0x12u);
        }

        goto LABEL_18;
      }
      getDIOSLog();
      v13 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68157954;
      v20 = 36;
      v21 = 2080;
      v22 = "-[DIBaseParams setPassphrase:error:]";
      LODWORD(v18) = 18;
      v17 = buf;
      v12 = (char *)_os_log_send_and_compose_impl();

      if (v12)
      {
LABEL_10:
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v12);
        free(v12);
      }
    }
LABEL_18:
    *__error() = v10;
    -[DIBaseParams setDiskImageParamsXPC:](self, "setDiskImageParamsXPC:", v8, v17, v18);
    goto LABEL_19;
  }
  return 0;
}

- (BOOL)tryUnlockUsingKeychainCertificateWithError:(id *)a3
{
  return -[DIBaseParams setPassphrase:error:](self, "setPassphrase:error:", 0, a3);
}

- (NSUUID)encryptionUUID
{
  void *v3;

  if (*(_QWORD *)-[DIBaseParams cryptoHeader](self, "cryptoHeader"))
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", *(_QWORD *)-[DIBaseParams cryptoHeader](self, "cryptoHeader") + 36);
  else
    v3 = 0;
  return (NSUUID *)v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@[%@]"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)prepareImageWithXpcHandler:(id)a3 fileMode:(int64_t)a4 error:(id *)a5
{
  id v8;
  DIEncryptionUnlocker *v9;
  _BOOL4 v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;

  v8 = a3;
  if (!*(_QWORD *)-[DIBaseParams cryptoHeader](self, "cryptoHeader")
    || (v9 = -[DIEncryptionFrontend initWithParams:]([DIEncryptionUnlocker alloc], "initWithParams:", self), v10 = -[DIEncryptionUnlocker unlockWithXpcHandler:error:](v9, "unlockWithXpcHandler:error:", v8, a5), v9, v10))
  {
    -[DIBaseParams shadowChain](self, "shadowChain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEmpty");

    if (v12)
    {
      -[DIBaseParams shadowChain](self, "shadowChain");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setShadowChain:", v13);

    }
    else
    {
      if (a4 != 2)
      {
        -[DIBaseParams shadowChain](self, "shadowChain");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "openWritable:createNonExisting:", 1, a4 != 3);

        -[DIBaseParams shadowChain](self, "shadowChain");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setShadowChain:", v16);

      }
      -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "shadowChain");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19 == 0;

      if (v20)
      {
        -[DIBaseParams shadowChain](self, "shadowChain");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "openWritable:createNonExisting:", 0, 0);

        -[DIBaseParams shadowChain](self, "shadowChain");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setShadowChain:", v22);

      }
    }
    LOBYTE(v10) = 1;
  }

  return v10;
}

- (BOOL)hasUnlockedBackend
{
  void *v2;
  void *v3;
  char v4;

  -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backendXPC");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isUnlocked");

  return v4;
}

- (void)invalidate
{
  -[DIBaseParams setDiskImageParamsXPC:](self, "setDiskImageParamsXPC:", 0);
}

- (BOOL)validateDeserializationWithError:(id *)a3
{
  void *v5;

  -[DIBaseParams deserializationError](self, "deserializationError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 && v5)
  {
    -[DIBaseParams deserializationError](self, "deserializationError");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5 == 0;
}

- (NSUUID)instanceID
{
  void *v2;
  void *v3;

  -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "instanceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (unint64_t)rawBlockSize
{
  void *v2;
  unint64_t v3;

  -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "blockSize");

  return v3;
}

- (void)setRawBlockSize:(unint64_t)a3
{
  id v4;

  -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBlockSize:", a3);

}

- (BOOL)requiresRootDaemon
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  FileDescriptor **v5;
  FileDescriptor **v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  char is_mounted_on_smb;
  FileDescriptor **v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  unint64_t *v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  FileDescriptor **v21;
  std::__shared_weak_count *v22;
  void *lpsrc;
  std::__shared_weak_count *v24;

  -[DIBaseParams backend](self, "backend");
  get_sink_backend((uint64_t)&v21, &lpsrc);
  v2 = v22;
  if (v22)
  {
    p_shared_owners = (unint64_t *)&v22->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  if (lpsrc)
  {
    if (v5)
    {
      v6 = v5;
      v7 = v24;
      v21 = v5;
      v22 = v24;
      if (v24)
      {
        v8 = (unint64_t *)&v24->__shared_owners_;
        do
          v9 = __ldxr(v8);
        while (__stxr(v9 + 1, v8));
      }
      if (FileDescriptor::is_mounted_on_smb(v5[5]))
      {
        is_mounted_on_smb = (*((uint64_t (**)(FileDescriptor **))*v6 + 6))(v6);
        if (!v7)
          goto LABEL_29;
      }
      else
      {
        is_mounted_on_smb = 0;
        if (!v7)
          goto LABEL_29;
      }
      v16 = (unint64_t *)&v7->__shared_owners_;
      do
        v15 = __ldaxr(v16);
      while (__stlxr(v15 - 1, v16));
      goto LABEL_27;
    }
  }
  if (!lpsrc
  {
    is_mounted_on_smb = 0;
    goto LABEL_29;
  }
  v21 = v11;
  v22 = v24;
  if (v24)
  {
    v12 = (unint64_t *)&v24->__shared_owners_;
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }
  is_mounted_on_smb = FileDescriptor::is_mounted_on_smb((FileDescriptor *)(v11 + 3));
  v7 = v22;
  if (v22)
  {
    v14 = (unint64_t *)&v22->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
LABEL_27:
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
LABEL_29:
  v17 = v24;
  if (v24)
  {
    v18 = (unint64_t *)&v24->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  return is_mounted_on_smb;
}

- (unint64_t)readPassphraseFlags
{
  return self->_readPassphraseFlags;
}

- (void)setReadPassphraseFlags:(unint64_t)a3
{
  self->_readPassphraseFlags = a3;
}

- (DiskImageParamsXPC)diskImageParamsXPC
{
  return self->_diskImageParamsXPC;
}

- (void)setDiskImageParamsXPC:(id)a3
{
  objc_storeStrong((id *)&self->_diskImageParamsXPC, a3);
}

- (DIURL)inputURL
{
  return self->_inputURL;
}

- (void)setInputURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (DIShadowChain)shadowChain
{
  return self->_shadowChain;
}

- (BOOL)isPstack
{
  return self->_isPstack;
}

- (NSError)deserializationError
{
  return self->_deserializationError;
}

- (void)setDeserializationError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deserializationError, 0);
  objc_storeStrong((id *)&self->_shadowChain, 0);
  objc_storeStrong((id *)&self->_inputURL, 0);
  objc_storeStrong((id *)&self->_diskImageParamsXPC, 0);
}

- (shared_ptr<Backend>)backend
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  Backend *v6;
  __shared_weak_count *v7;
  id v8;
  shared_ptr<Backend> result;

  v3 = v2;
  -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "backendXPC");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "backend");
  }
  else
  {
    *v3 = 0;
    v3[1] = 0;
  }

  result.__cntrl_ = v7;
  result.__ptr_ = v6;
  return result;
}

- (void)cryptoHeader
{
  void *v2;
  void *v3;
  void *v4;

  -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backendXPC");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "cryptoHeader");

  return v4;
}

@end
