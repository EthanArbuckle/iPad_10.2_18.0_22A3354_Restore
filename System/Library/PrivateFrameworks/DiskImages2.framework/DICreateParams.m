@implementation DICreateParams

- (DICreateParams)initWithURL:(id)a3 numBlocks:(unint64_t)a4 error:(id *)a5
{
  DICreateParams *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DICreateParams;
  result = -[DIBaseParams initWithURL:error:](&v7, sel_initWithURL_error_, a3, a5);
  if (result)
    result->_numBlocks = a4;
  return result;
}

- (BOOL)supportsPstack
{
  return 0;
}

- (DICreateParams)initWithURL:(id)a3 error:(id *)a4
{
  return -[DICreateParams initWithURL:numBlocks:error:](self, "initWithURL:numBlocks:error:", a3, 0, a4);
}

- (DICreateParams)initWithCoder:(id)a3
{
  id v4;
  DICreateParams *v5;
  uint64_t v6;
  NSString *publicKey;
  uint64_t v8;
  NSString *certificate;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DICreateParams;
  v5 = -[DIBaseParams initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_numBlocks = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("numBlocks"));
    v5->_encryptionMethod = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("encryptionMethod"));
    v5->_passphrase = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("passphrase"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publicKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    publicKey = v5->_publicKey;
    v5->_publicKey = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("certificate"));
    v8 = objc_claimAutoreleasedReturnValue();
    certificate = v5->_certificate;
    v5->_certificate = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DICreateParams;
  -[DIBaseParams encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", -[DICreateParams numBlocks](self, "numBlocks"), CFSTR("numBlocks"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[DICreateParams encryptionMethod](self, "encryptionMethod"), CFSTR("encryptionMethod"));
  objc_msgSend(v4, "encodeBool:forKey:", -[DICreateParams passphrase](self, "passphrase"), CFSTR("passphrase"));
  -[DICreateParams publicKey](self, "publicKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("publicKey"));

  -[DICreateParams certificate](self, "certificate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("certificate"));

}

- (BOOL)getCertificateWithEncryptionCreator:(id)a3 outCertificate:(id *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;

  v8 = a3;
  if (!a4)
  {
    LOBYTE(a5) = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Invalid certificate out argument"), a5);
    goto LABEL_6;
  }
  -[DICreateParams certificate](self, "certificate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[DICreateParams certificate](self, "certificate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getCertificateWithCertificatePath:error:", v10, a5);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_4:
    LOBYTE(a5) = 1;
    goto LABEL_6;
  }
  -[DICreateParams publicKey](self, "publicKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    goto LABEL_4;
  v17 = 0;
  -[DICreateParams publicKey](self, "publicKey");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  convertHexToBytes((char *)objc_msgSend(v13, "UTF8String"), &v17, &v16);

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v16, v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getCertificateWithPublicKey:error:", v14, a5);
  a5 = (id *)(id)objc_claimAutoreleasedReturnValue();
  *a4 = a5;

  v15 = v16;
  v16 = 0;
  if (v15)
    MEMORY[0x2199A8A00](v15, 0x1000C8077774924);
  if (a5)
    goto LABEL_4;
LABEL_6:

  return (char)a5;
}

- (BOOL)createEncryptionWithXPCHandler:(id)a3 error:(id *)a4
{
  id v6;
  int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  DIEncryptionCreator *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  int v19;
  int v20;

  v6 = a3;
  if (-[DICreateParams encryptionMethod](self, "encryptionMethod"))
  {
    if (-[DICreateParams encryptionMethod](self, "encryptionMethod") == 2)
      v7 = 256;
    else
      v7 = 128;
    crypto::header::encryption_key_bits_size_t::encryption_key_bits_size_t(&v19, v7);
    v8 = operator new();
    v20 = v19;
    crypto::header::header(v8, &v20);
    v9 = -[DIBaseParams cryptoHeader](self, "cryptoHeader");
    v10 = *v9;
    *v9 = v8;
    if (v10)
      MEMORY[0x2199A8A18](v10, 0x1000C4015A9971DLL);
    v11 = -[DIEncryptionFrontend initWithParams:]([DIEncryptionCreator alloc], "initWithParams:", self);
    if (-[DICreateParams passphrase](self, "passphrase"))
      goto LABEL_8;
    -[DICreateParams publicKey](self, "publicKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {

    }
    else
    {
      -[DICreateParams certificate](self, "certificate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
LABEL_8:
        -[DICreateParams systemKeychainAccount](self, "systemKeychainAccount");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          -[DICreateParams systemKeychainAccount](self, "systemKeychainAccount");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v6, "createAndStoreInSystemKeychainWithCreator:account:error:", v11, v13, a4);

LABEL_17:
          goto LABEL_18;
        }
        v16 = -[DIEncryptionCreator createWithXpcHandler:error:](v11, "createWithXpcHandler:error:", v6, a4);
LABEL_16:
        v14 = v16;
        goto LABEL_17;
      }
    }
    v16 = -[DICreateParams tryCreateUsingKeychainCertificateWithError:](self, "tryCreateUsingKeychainCertificateWithError:", a4);
    goto LABEL_16;
  }
  v14 = 1;
LABEL_18:

  return v14;
}

- (void)createDiskImageParamsXPC
{
  DiskImagesRuntimeException *exception;
  void *v3;

  exception = (DiskImagesRuntimeException *)__cxa_allocate_exception(0x40uLL);
  DiskImagesRuntimeException::DiskImagesRuntimeException(exception, "Invalid argument, please use one of the DICreateParams derived classes instead", 0x16u);
}

- (BOOL)createDiskImageParamsWithError:(id *)a3
{
  void *v5;
  char v6;
  int v7;
  NSObject *v8;
  char *v9;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[DIBaseParams inputURL](self, "inputURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFileURL");

  if ((v6 & 1) == 0)
    return +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, CFSTR("URL must have a file scheme"), a3);
  v7 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    v8 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    -[DIBaseParams inputURL](self, "inputURL");
    *(_DWORD *)buf = 68158211;
    v17 = 49;
    v18 = 2080;
    v19 = "-[DICreateParams createDiskImageParamsWithError:]";
    v20 = 2113;
    v21 = (id)objc_claimAutoreleasedReturnValue();
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
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[DIBaseParams inputURL](self, "inputURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 68158211;
      v17 = 49;
      v18 = 2080;
      v19 = "-[DICreateParams createDiskImageParamsWithError:]";
      v20 = 2113;
      v21 = v12;
      _os_log_impl(&dword_212EB0000, v11, OS_LOG_TYPE_DEFAULT, "%.*s: entry with %{private}@", buf, 0x1Cu);

    }
  }
  *__error() = v7;
  v13 = objc_opt_class();
  -[DIBaseParams inputURL](self, "inputURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v13) = objc_msgSend((id)v13, "eraseIfExistingWithURL:error:", v14, a3);

  if ((v13 & 1) == 0)
    return 0;
  -[DICreateParams createDiskImageParamsXPC](self, "createDiskImageParamsXPC");
  return 1;
}

- (BOOL)createWithError:(id *)a3
{
  DIClient2Controller_XPCHandler *v5;

  if (!-[DICreateParams numBlocks](self, "numBlocks"))
    return +[DIError failWithPOSIXCode:description:error:](DIError, "failWithPOSIXCode:description:error:", 22, CFSTR("Invalid size requested for the new image"), a3);
  if (-[DICreateParams createDiskImageParamsWithError:](self, "createDiskImageParamsWithError:", a3))
  {
    if (!-[DICreateParams encryptionMethod](self, "encryptionMethod"))
      return -[DICreateParams resizeWithNumBlocks:error:](self, "resizeWithNumBlocks:error:", -[DICreateParams numBlocks](self, "numBlocks"), a3);
    v5 = objc_alloc_init(DIClient2Controller_XPCHandler);
    if (-[DIClient2Controller_XPCHandler connectWithError:](v5, "connectWithError:", a3)
      && -[DICreateParams createEncryptionWithXPCHandler:error:](self, "createEncryptionWithXPCHandler:error:", v5, a3))
    {

      return -[DICreateParams resizeWithNumBlocks:error:](self, "resizeWithNumBlocks:error:", -[DICreateParams numBlocks](self, "numBlocks"), a3);
    }

  }
  return 0;
}

- (BOOL)setPassphrase:(const char *)a3 error:(id *)a4
{
  DIEncryptionCreator *v7;
  BOOL v8;
  id v9;
  _BOOL4 v10;
  int v11;
  void *v12;
  char v13;
  id v15;

  v7 = -[DIEncryptionFrontend initWithParams:]([DIEncryptionCreator alloc], "initWithParams:", self);
  v15 = 0;
  v8 = -[DICreateParams getCertificateWithEncryptionCreator:outCertificate:error:](self, "getCertificateWithEncryptionCreator:outCertificate:error:", v7, &v15, a4);
  v9 = v15;
  if (v8)
  {
    v10 = -[DICreateParams passphrase](self, "passphrase");
    if (v9)
      v11 = v10;
    else
      v11 = 1;
    if (v11 != 1 || a3 && *a3)
    {
      -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "makeNewImageEncryptedWithPassphrase:certificate:error:", a3, v9, a4);

    }
    else
    {
      v13 = +[DIError failWithPOSIXCode:description:error:](DIError, "failWithPOSIXCode:description:error:", 22, CFSTR("Passphrase cannot be empty"), a4);
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)tryCreateUsingKeychainCertificateWithError:(id *)a3
{
  return -[DICreateParams setPassphrase:error:](self, "setPassphrase:error:", 0, a3);
}

- (BOOL)resizeWithNumBlocks:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  unint64_t v15;
  uint64_t v16;
  int v17;
  unint64_t v18;
  NSObject *v19;
  char *v20;
  NSObject *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint8_t buf[8];
  __int16 v28;
  const char *v29;
  __int16 v30;
  unint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  -[DICreateParams setNumBlocks:](self, "setNumBlocks:");
  v26 = 0;
  -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIBaseParams shadowChain](self, "shadowChain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "shouldValidate");
  if (v7)
  {
    objc_msgSend(v7, "createDiskImageWithCache:shadowValidation:", 0, v9);
    v10 = *(_QWORD *)buf;
  }
  else
  {
    v10 = 0;
  }
  v26 = v10;
  *(_QWORD *)buf = 0;

  v11 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v26 + 24))(v26);
  -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "setSizeWithDiskImage:newSize:", &v26, v11 * a3);

  if ((_DWORD)v13)
  {
    v14 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", v13, CFSTR("Failed to resize the image"), a4);
    goto LABEL_17;
  }
  -[DICreateParams setNumBlocks:](self, "setNumBlocks:", (*(uint64_t (**)(uint64_t))(*(_QWORD *)v26 + 32))(v26));
  v15 = -[DICreateParams numBlocks](self, "numBlocks");
  v16 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v26 + 24))(v26);
  v17 = *__error();
  v18 = v16 * v15;
  if (DIForwardLogs())
  {
    getDIOSLog();
    v19 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68158210;
    *(_DWORD *)&buf[4] = 44;
    v28 = 2080;
    v29 = "-[DICreateParams resizeWithNumBlocks:error:]";
    v30 = 2048;
    v31 = v18;
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
      *(_DWORD *)buf = 68158210;
      *(_DWORD *)&buf[4] = 44;
      v28 = 2080;
      v29 = "-[DICreateParams resizeWithNumBlocks:error:]";
      v30 = 2048;
      v31 = v18;
      _os_log_impl(&dword_212EB0000, v21, OS_LOG_TYPE_DEFAULT, "%.*s: Disk image resized to %llu bytes", buf, 0x1Cu);
    }

  }
  *__error() = v17;
  v22 = (_QWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v26 + 136))(v26);
  v23 = DiskImage::Context::flush(v22);
  if (!(_DWORD)v23)
  {
    v14 = 1;
    if (!v22)
      goto LABEL_17;
    goto LABEL_16;
  }
  v14 = +[DIError failWithPOSIXCode:error:](DIError, "failWithPOSIXCode:error:", v23, a4);
  if (v22)
LABEL_16:
    (*(void (**)(_QWORD *))(*v22 + 40))(v22);
LABEL_17:
  v24 = v26;
  v26 = 0;
  if (v24)
    (*(void (**)(uint64_t))(*(_QWORD *)v24 + 16))(v24);
  return v14;
}

+ (BOOL)checkExistingFileWithURL:(id)a3 isDirectory:(BOOL)a4 error:(id *)a5
{
  return !a4
      || +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 21, CFSTR("The requested URL is an existing folder"), a5);
}

+ (BOOL)eraseIfExistingWithURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;
  int v12;
  NSObject *v13;
  void *v14;
  char *v15;
  char v16;
  NSObject *v17;
  void *v18;
  void *v19;
  unsigned __int8 v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v21 = 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v7, &v21);

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isWritableFileAtPath:", v10);

    if ((v11 & 1) != 0)
    {
      if (objc_msgSend((id)objc_opt_class(), "checkExistingFileWithURL:isDirectory:error:", v5, v21, a4))
      {
        v12 = *__error();
        if (DIForwardLogs())
        {
          getDIOSLog();
          v13 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
          objc_msgSend(v5, "path");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 68158211;
          v23 = 47;
          v24 = 2080;
          v25 = "+[DICreateParams eraseIfExistingWithURL:error:]";
          v26 = 2113;
          v27 = v14;
          v15 = (char *)_os_log_send_and_compose_impl();

          if (v15)
          {
            fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v15);
            free(v15);
          }
        }
        else
        {
          getDIOSLog();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v5, "path");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 68158211;
            v23 = 47;
            v24 = 2080;
            v25 = "+[DICreateParams eraseIfExistingWithURL:error:]";
            v26 = 2113;
            v27 = v18;
            _os_log_impl(&dword_212EB0000, v17, OS_LOG_TYPE_DEFAULT, "%.*s: Erasing %{private}@", buf, 0x1Cu);

          }
        }
        *__error() = v12;
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v19, "removeItemAtURL:error:", v5, a4);

      }
      else
      {
        v16 = 0;
      }
    }
    else
    {
      v16 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 13, CFSTR("Image does not have write permissions"), a4);
    }
  }
  else
  {
    v16 = 1;
  }

  return v16;
}

- (BOOL)onErrorCleanup
{
  int v3;
  NSObject *v4;
  void *v5;
  char *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[DIBaseParams setDiskImageParamsXPC:](self, "setDiskImageParamsXPC:", 0);
  v3 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    v4 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    -[DIBaseParams inputURL](self, "inputURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    *(_DWORD *)buf = 68158211;
    v15 = 32;
    v16 = 2080;
    v17 = "-[DICreateParams onErrorCleanup]";
    v18 = 2113;
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (char *)_os_log_send_and_compose_impl();

    if (v6)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v6);
      free(v6);
    }
  }
  else
  {
    getDIOSLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[DIBaseParams inputURL](self, "inputURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "path");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 68158211;
      v15 = 32;
      v16 = 2080;
      v17 = "-[DICreateParams onErrorCleanup]";
      v18 = 2113;
      v19 = v9;
      _os_log_impl(&dword_212EB0000, v7, OS_LOG_TYPE_DEFAULT, "%.*s: Creation failed, erasing %{private}@", buf, 0x1Cu);

    }
  }
  *__error() = v3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIBaseParams inputURL](self, "inputURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "removeItemAtURL:error:", v11, 0);

  return v12;
}

- (unint64_t)encryptionMethod
{
  return self->_encryptionMethod;
}

- (void)setEncryptionMethod:(unint64_t)a3
{
  self->_encryptionMethod = a3;
}

- (NSString)systemKeychainAccount
{
  return self->_systemKeychainAccount;
}

- (void)setSystemKeychainAccount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)passphrase
{
  return self->_passphrase;
}

- (void)setPassphrase:(BOOL)a3
{
  self->_passphrase = a3;
}

- (NSString)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)certificate
{
  return self->_certificate;
}

- (void)setCertificate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (unint64_t)numBlocks
{
  return self->_numBlocks;
}

- (void)setNumBlocks:(unint64_t)a3
{
  self->_numBlocks = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificate, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_systemKeychainAccount, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
