@implementation FirmwareBundle

+ (id)defaultBundlePath
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "resourcePath"), "stringByAppendingFormat:", CFSTR("/FirmwareBundles/"));
}

- (void)calculateHash
{
  NSURL *firmwareLocalURL;
  NSData *HashForDataAtLocationAsData;
  NSData *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  NSData *v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v11 = 0;
  firmwareLocalURL = self->_firmwareLocalURL;
  if (firmwareLocalURL)
  {
    HashForDataAtLocationAsData = (NSData *)generateHashForDataAtLocationAsData((uint64_t)firmwareLocalURL, 10, (uint64_t)&v11);
    self->_hash = HashForDataAtLocationAsData;
    v5 = HashForDataAtLocationAsData;
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v6 = ccsha256_di();
    NSLog(CFSTR("%s: hash not provided by asset. creating sha256 on the fly imageSize=%d\n"), "-[FirmwareBundle calculateHash]", self->_firmwareImageSize);
    MEMORY[0x24BDAC7A8]();
    v8 = (char *)&v10 - v7;
    ccdigest_init();
    -[NSData bytes](self->_firmwareImage, "bytes");
    ccdigest_update();
    (*(void (**)(uint64_t, char *, _OWORD *))(v6 + 56))(v6, v8, v12);
    v9 = (NSData *)(id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v12, 32);
    self->_hash = v9;
    NSLog(CFSTR("hash created %@\n"), v9);
  }
}

- (FirmwareBundle)initWithData:(id)a3 hashData:(id)a4 signatureData:(id)a5 certData:(id)a6
{
  FirmwareBundle *v6;
  NSData *firmwareImage;
  const char *v12;
  const char *v13;
  uint64_t v14;
  NSData *hash;
  const char *v16;
  uint64_t v17;
  NSData *signature;
  const char *v19;
  uint64_t v20;
  NSData *certificate;
  objc_super v23;

  v6 = self;
  if (a3)
  {
    v23.receiver = self;
    v23.super_class = (Class)FirmwareBundle;
    v6 = -[FirmwareBundle init](&v23, sel_init);
    if (v6)
    {
      v6->_firmwareImage = (NSData *)a3;
      v6->_firmwareImageSize = objc_msgSend(a3, "length");
      v6->_hash = (NSData *)a4;
      v6->_signature = (NSData *)a5;
      v6->_certificate = (NSData *)a6;
      *(_QWORD *)&v6->_productIDCode = 0;
      v6->_bundleDescription = 0;
      v6->_buildManifest = 0;
      if (!v6->_hash)
        -[FirmwareBundle calculateHash](v6, "calculateHash");
      firmwareImage = v6->_firmwareImage;
      v12 = "valid";
      if (firmwareImage)
        v13 = "valid";
      else
        v13 = "nil";
      v14 = -[NSData length](firmwareImage, "length");
      hash = v6->_hash;
      if (hash)
        v16 = "valid";
      else
        v16 = "nil";
      v17 = -[NSData length](hash, "length");
      signature = v6->_signature;
      if (signature)
        v19 = "valid";
      else
        v19 = "nil";
      v20 = -[NSData length](signature, "length");
      certificate = v6->_certificate;
      if (!certificate)
        v12 = "nil";
      NSLog(CFSTR("%s: I=%s[%lu] H=%s[%lu] S=%s[%lu] C=%s[%lu] productID=%d\n"), "-[FirmwareBundle initWithData:hashData:signatureData:certData:]", v13, v14, v16, v17, v19, v20, v12, -[NSData length](certificate, "length"), v6->_productIDCode);
    }
    else
    {
      NSLog(CFSTR("%s: super init failed\n"), "-[FirmwareBundle initWithData:hashData:signatureData:certData:]");
    }
  }
  else
  {
    NSLog(CFSTR("%s: null payload\n"), "-[FirmwareBundle initWithData:hashData:signatureData:certData:]");
  }
  return v6;
}

- (FirmwareBundle)initWithURL:(id)a3 hashData:(id)a4 signatureData:(id)a5 certData:(id)a6
{
  FirmwareBundle *v11;
  NSURL *firmwareLocalURL;
  uint64_t v13;
  NSData *hash;
  const char *v15;
  const char *v16;
  uint64_t v17;
  NSData *signature;
  const char *v19;
  uint64_t v20;
  NSData *certificate;
  id v23;
  objc_super v24;
  uint64_t v25;

  v25 = 0;
  if ((objc_msgSend(a3, "checkResourceIsReachableAndReturnError:", &v25) & 1) != 0)
  {
    v24.receiver = self;
    v24.super_class = (Class)FirmwareBundle;
    v11 = -[FirmwareBundle init](&v24, sel_init);
    if (v11)
    {
      v11->_firmwareLocalURL = (NSURL *)a3;
      v11->_hash = (NSData *)a4;
      v11->_signature = (NSData *)a5;
      v11->_certificate = (NSData *)a6;
      *(_QWORD *)&v11->_productIDCode = 0;
      v11->_bundleDescription = 0;
      v11->_buildManifest = 0;
      v23 = 0;
      objc_msgSend(a3, "getResourceValue:forKey:error:", &v23, *MEMORY[0x24BDBCC48], &v25);
      v11->_firmwareImageSize = objc_msgSend(v23, "unsignedIntValue");
      if (!v11->_hash)
        -[FirmwareBundle calculateHash](v11, "calculateHash");
      firmwareLocalURL = v11->_firmwareLocalURL;
      v13 = -[NSData length](v11->_firmwareImage, "length");
      hash = v11->_hash;
      v15 = "valid";
      if (hash)
        v16 = "valid";
      else
        v16 = "nil";
      v17 = -[NSData length](hash, "length");
      signature = v11->_signature;
      if (signature)
        v19 = "valid";
      else
        v19 = "nil";
      v20 = -[NSData length](signature, "length");
      certificate = v11->_certificate;
      if (!certificate)
        v15 = "nil";
      NSLog(CFSTR("%s: I=%@[%lu] H=%s[%lu] S=%s[%lu] C=%s[%lu] productID=%d\n"), "-[FirmwareBundle initWithURL:hashData:signatureData:certData:]", firmwareLocalURL, v13, v16, v17, v19, v20, v15, -[NSData length](certificate, "length"), v11->_productIDCode);
    }
    else
    {
      NSLog(CFSTR("%s: super init failed\n"), "-[FirmwareBundle initWithURL:hashData:signatureData:certData:]");
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[FirmwareBundle initWithURL:hashData:signatureData:certData:].cold.1((uint64_t)a3);
    return 0;
  }
  return v11;
}

- (FirmwareBundle)initWithBundle:(id)a3
{
  FirmwareBundle *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  int v35;
  objc_super v36;
  id v37;
  uint64_t v38;

  v37 = 0;
  v38 = 0;
  v36.receiver = self;
  v36.super_class = (Class)FirmwareBundle;
  v4 = -[FirmwareBundle init](&v36, sel_init);
  if (!v4)
    goto LABEL_37;
  v5 = objc_msgSend(a3, "objectForInfoDictionaryKey:", CFSTR("FirmwareImageBaseAddress"));
  v6 = objc_msgSend(a3, "objectForInfoDictionaryKey:", CFSTR("FirmwareImageSize"));
  v7 = objc_msgSend(a3, "objectForInfoDictionaryKey:", CFSTR("FirmwareImageFile"));
  if (!v7)
    goto LABEL_37;
  v8 = v7;
  v9 = objc_msgSend(a3, "objectForInfoDictionaryKey:", CFSTR("HashFile"));
  v10 = objc_msgSend(a3, "objectForInfoDictionaryKey:", CFSTR("CertificateFile"));
  v11 = objc_msgSend(a3, "objectForInfoDictionaryKey:", CFSTR("SignatureFile"));
  v12 = objc_msgSend(a3, "objectForInfoDictionaryKey:", CFSTR("CFBundleIdentifier"));
  if (!v12)
    goto LABEL_37;
  v13 = (void *)v12;
  NSLog(CFSTR("%s: Info Name Keys [I:%@ H:%@ S:%@ C=%@]\n"), "-[FirmwareBundle initWithBundle:]", v8, v9, v11, v10);
  if (v5)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v5), "scanHexInt:", &v4->_firmwareImageBaseAddress);
  if (v6)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v6), "scanHexInt:", &v4->_firmwareImageSize);
  }
  else
  {
    -[FirmwareBundle parseFileName:intoPath:andExtension:](v4, "parseFileName:intoPath:andExtension:", v8, &v38, &v37);
    v14 = objc_msgSend(a3, "pathForResource:ofType:", v38, v37);
    v15 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "attributesOfItemAtPath:error:", v14, 0), "fileSize");
    v4->_firmwareImageSize = v15;
    NSLog(CFSTR("%s: imageFileSize unspecified by asset. using file size=%d\n"), "-[FirmwareBundle initWithBundle:]", v15);
  }
  v16 = objc_msgSend(a3, "objectForInfoDictionaryKey:", CFSTR("DefaultFillByte"));
  if (v16)
  {
    v35 = 0;
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v16), "scanHexInt:", &v35);
    v17 = v35;
  }
  else
  {
    v17 = -1;
  }
  -[FirmwareBundle parseFileName:intoPath:andExtension:](v4, "parseFileName:intoPath:andExtension:", v8, &v38, &v37);
  if (!objc_msgSend(v37, "caseInsensitiveCompare:", CFSTR("s19")))
  {
    v20 = -[FirmwareBundle parseSRECFile:withDefaultByteValue:](v4, "parseSRECFile:withDefaultByteValue:", objc_msgSend(a3, "pathForResource:ofType:", v38, v37), v17);
    goto LABEL_16;
  }
  v18 = objc_msgSend(v37, "caseInsensitiveCompare:", CFSTR("bin"));
  v19 = objc_msgSend(a3, "pathForResource:ofType:", v38, v37);
  if (v18)
  {
    v20 = -[FirmwareBundle parseMSP430TXTFile:withDefaultByteValue:](v4, "parseMSP430TXTFile:withDefaultByteValue:", v19, v17);
LABEL_16:
    v21 = 40;
    goto LABEL_18;
  }
  v20 = (id)objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v19);
  v21 = 80;
LABEL_18:
  *(Class *)((char *)&v4->super.isa + v21) = (Class)v20;
  -[FirmwareBundle parseFileName:intoPath:andExtension:](v4, "parseFileName:intoPath:andExtension:", CFSTR("BuildManifest.plist"), &v38, &v37);
  v22 = objc_msgSend(a3, "pathForResource:ofType:", v38, v37);
  v4->_buildManifest = (NSDictionary *)(id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v22);
  if (v9)
  {
    -[FirmwareBundle parseFileName:intoPath:andExtension:](v4, "parseFileName:intoPath:andExtension:", v9, &v38, &v37);
    if (objc_msgSend(v37, "caseInsensitiveCompare:", CFSTR("bin")))
      v23 = -[FirmwareBundle parseResourceFileIntoData:](v4, "parseResourceFileIntoData:", objc_msgSend(a3, "pathForResource:ofType:", v38, v37));
    else
      v23 = (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", objc_msgSend(a3, "pathForResource:ofType:", v38, v37));
    v4->_hash = (NSData *)v23;
    if (!v10)
      goto LABEL_29;
    goto LABEL_25;
  }
  -[FirmwareBundle calculateHash](v4, "calculateHash");
  if (v10)
  {
LABEL_25:
    -[FirmwareBundle parseFileName:intoPath:andExtension:](v4, "parseFileName:intoPath:andExtension:", v10, &v38, &v37);
    if (objc_msgSend(v37, "caseInsensitiveCompare:", CFSTR("bin")))
      v24 = -[FirmwareBundle parseResourceFileIntoData:](v4, "parseResourceFileIntoData:", objc_msgSend(a3, "pathForResource:ofType:", v38, v37));
    else
      v24 = (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", objc_msgSend(a3, "pathForResource:ofType:", v38, v37));
    v4->_certificate = (NSData *)v24;
  }
LABEL_29:
  if (v11)
  {
    -[FirmwareBundle parseFileName:intoPath:andExtension:](v4, "parseFileName:intoPath:andExtension:", v11, &v38, &v37);
    if (objc_msgSend(v37, "caseInsensitiveCompare:", CFSTR("bin")))
      v25 = -[FirmwareBundle parseResourceFileIntoData:](v4, "parseResourceFileIntoData:", objc_msgSend(a3, "pathForResource:ofType:", v38, v37));
    else
      v25 = (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", objc_msgSend(a3, "pathForResource:ofType:", v38, v37));
    v4->_signature = (NSData *)v25;
  }
  v26 = (void *)objc_msgSend(v13, "componentsSeparatedByString:", CFSTR("."));
  if (v26)
    LODWORD(v26) = objc_msgSend((id)objc_msgSend(v26, "lastObject"), "intValue");
  v4->_productIDCode = v26;
  v4->_bundleDescription = (NSString *)(id)objc_msgSend((id)objc_msgSend(a3, "bundlePath"), "lastPathComponent");
LABEL_37:
  if (-[FirmwareBundle firmwareImage](v4, "firmwareImage"))
    v27 = "valid";
  else
    v27 = "nil";
  v28 = -[FirmwareBundle firmwareImageSize](v4, "firmwareImageSize");
  if (-[FirmwareBundle hash](v4, "hash"))
    v29 = "valid";
  else
    v29 = "nil";
  v30 = -[NSData length](-[FirmwareBundle hash](v4, "hash"), "length");
  if (-[FirmwareBundle signature](v4, "signature"))
    v31 = "valid";
  else
    v31 = "nil";
  v32 = -[NSData length](-[FirmwareBundle signature](v4, "signature"), "length");
  if (-[FirmwareBundle certificate](v4, "certificate"))
    v33 = "valid";
  else
    v33 = "nil";
  NSLog(CFSTR("%s: I=%s[%lu] H=%s[%lu] S=%s[%lu] C=%s[%lu] productID=%d baseAddress=%d\n"), "-[FirmwareBundle initWithBundle:]", v27, v28, v29, v30, v31, v32, v33, -[NSData length](-[FirmwareBundle certificate](v4, "certificate"), "length"), -[FirmwareBundle productIDCode](v4, "productIDCode"), -[FirmwareBundle firmwareImageBaseAddress](v4, "firmwareImageBaseAddress"));
  return v4;
}

- (FirmwareBundle)initWithBundlePath:(id)a3
{
  return -[FirmwareBundle initWithBundle:](self, "initWithBundle:", objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", a3));
}

- (FirmwareBundle)initWithBundleName:(id)a3
{
  return -[FirmwareBundle initWithBundlePath:](self, "initWithBundlePath:", objc_msgSend(+[FirmwareBundle defaultBundlePath](FirmwareBundle, "defaultBundlePath"), "stringByAppendingString:", a3));
}

- (void)loadFirmwareImage
{
  if (-[NSURL checkResourceIsReachableAndReturnError:](self->_firmwareLocalURL, "checkResourceIsReachableAndReturnError:", 0))
  {
    self->_firmwareImage = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfURL:", self->_firmwareLocalURL);
  }
}

- (id)getFirmwareDataInRange:(_NSRange)a3 error:(id *)a4
{
  NSUInteger length;
  NSUInteger location;
  NSFileHandle *firmwareFilehandle;

  length = a3.length;
  location = a3.location;
  firmwareFilehandle = self->_firmwareFilehandle;
  if ((firmwareFilehandle
     || (firmwareFilehandle = (NSFileHandle *)(id)objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForReadingFromURL:error:", self->_firmwareLocalURL, a4), (self->_firmwareFilehandle = firmwareFilehandle) != 0))&& -[NSFileHandle uarpSeekToOffset:error:](firmwareFilehandle, "uarpSeekToOffset:error:", location, a4))
  {
    return -[NSFileHandle uarpReadDataUpToLength:error:](self->_firmwareFilehandle, "uarpReadDataUpToLength:error:", length, a4);
  }
  else
  {
    return 0;
  }
}

- (void)parseFileName:(id)a3 intoPath:(id *)a4 andExtension:(id *)a5
{
  void *v8;

  v8 = (void *)objc_msgSend(a3, "pathExtension");
  *a5 = v8;
  if (objc_msgSend(v8, "caseInsensitiveCompare:", CFSTR("txt"))
    && objc_msgSend(*a5, "caseInsensitiveCompare:", CFSTR("s19"))
    && objc_msgSend(*a5, "caseInsensitiveCompare:", CFSTR("bin"))
    && objc_msgSend(*a5, "caseInsensitiveCompare:", CFSTR("plist")))
  {
    *a4 = a3;
    *a5 = CFSTR("txt");
  }
  else
  {
    *a4 = (id)objc_msgSend(a3, "stringByDeletingPathExtension");
  }
}

- (id)parseResourceFileIntoData:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v7;
  int v8;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", a3, 1, 0);
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", objc_msgSend(v3, "length") / 5uLL);
  v5 = (void *)objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v3);
  v8 = 0;
  if (objc_msgSend(v5, "scanHexInt:", &v8))
  {
    do
    {
      v7 = v8;
      objc_msgSend(v4, "appendBytes:length:", &v7, 1);
      objc_msgSend(v5, "scanCharactersFromSet:intoString:", objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(",")), 0);
    }
    while ((objc_msgSend(v5, "scanHexInt:", &v8) & 1) != 0);
  }
  return v4;
}

- (id)parseMSP430TXTFile:(id)a3 withDefaultByteValue:(unsigned __int8)a4
{
  int v4;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v12;
  id v13;
  int v14;

  v4 = a4;
  v7 = (void *)objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", self->_firmwareImageSize);
  memset((void *)objc_msgSend(v7, "mutableBytes"), v4, objc_msgSend(v7, "length"));
  v14 = 0;
  v8 = (void *)objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", a3, 1, 0));
  if ((objc_msgSend(v8, "isAtEnd") & 1) == 0)
  {
    do
    {
      v13 = 0;
      if (objc_msgSend(v8, "scanUpToString:intoString:", CFSTR("\n"), &v13))
      {
        v9 = objc_msgSend(v13, "characterAtIndex:", 0);
        if (v9 != 113)
        {
          if (v9 == 64)
          {
            objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", objc_msgSend(v13, "substringFromIndex:", 1)), "scanHexInt:", &v14);
            v14 -= self->_firmwareImageBaseAddress;
          }
          else
          {
            v10 = (void *)objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v13);
            if ((objc_msgSend(v10, "isAtEnd") & 1) == 0)
            {
              do
              {
                v12 = 0;
                objc_msgSend(v10, "scanHexInt:", &v12);
                ++v14;
                objc_msgSend(v7, "replaceBytesInRange:withBytes:");
              }
              while (!objc_msgSend(v10, "isAtEnd"));
            }
          }
        }
      }
    }
    while (!objc_msgSend(v8, "isAtEnd"));
  }
  return v7;
}

- (void)parseSRECLine:(id)a3 intoImage:(id)a4
{
  uint64_t v7;
  int v8;
  uint64_t v9;
  char v10;
  const char *v11;
  uint64_t v12;
  unsigned __int16 *v13;
  char v14;
  uint64_t v15;
  int v16;
  unsigned __int16 v17;
  _BYTE v18[270];

  *(_QWORD *)&v18[254] = *MEMORY[0x24BDAC8D0];
  v16 = 0;
  v7 = objc_msgSend(a3, "cStringUsingEncoding:", 1);
  v8 = *(unsigned __int8 *)(v7 + 1);
  sscanf((const char *)(v7 + 2), "%02x", &v16);
  v9 = v16;
  if (objc_msgSend(a3, "length") - 4 == 2 * v9)
  {
    v10 = v9;
    if ((_DWORD)v9)
    {
      v11 = (const char *)(v7 + 4);
      v12 = (v9 - 1) + 1;
      v13 = &v17;
      v10 = v9;
      do
      {
        sscanf(v11, "%02x", &v16);
        v11 += 2;
        v14 = v16;
        *(_BYTE *)v13 = v16;
        v13 = (unsigned __int16 *)((char *)v13 + 1);
        v10 += v14;
        --v12;
      }
      while (v12);
    }
    if (v10 == -1)
    {
      if (v8 != 48 && v8 != 57)
      {
        if (v8 == 49)
        {
          if (v9 <= 2)
            NSLog(CFSTR("byte_count too low in parseSRECLine"), v15);
          else
            objc_msgSend(a4, "replaceBytesInRange:withBytes:", (unsigned __int16)(_byteswap_ushort(v17) - self->_firmwareImageBaseAddress), (int)v9 - 3, v18);
        }
        else
        {
          NSLog(CFSTR("Unhandled SREC record type in parseSRECLine"), v15);
        }
      }
    }
    else
    {
      NSLog(CFSTR("checksum failure in parseSRECLine"), v15);
    }
  }
  else
  {
    NSLog(CFSTR("parseSRECLine: Invalid byte_count %d in SREC text_line (%lu)"), v9, objc_msgSend(a3, "length") - 4);
  }
}

- (id)parseSRECFile:(id)a3 withDefaultByteValue:(unsigned __int8)a4
{
  int v4;
  void *v7;
  void *v8;
  uint64_t v10;

  v4 = a4;
  v7 = (void *)objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", self->_firmwareImageSize);
  memset((void *)objc_msgSend(v7, "mutableBytes"), v4, objc_msgSend(v7, "length"));
  v8 = (void *)objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", a3, 1, 0));
  if ((objc_msgSend(v8, "isAtEnd") & 1) == 0)
  {
    do
    {
      v10 = 0;
      if (objc_msgSend(v8, "scanUpToString:intoString:", CFSTR("\n"), &v10))
        -[FirmwareBundle parseSRECLine:intoImage:](self, "parseSRECLine:intoImage:", v10, v7);
    }
    while (!objc_msgSend(v8, "isAtEnd"));
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[NSFileHandle uarpCloseAndReturnError:](self->_firmwareFilehandle, "uarpCloseAndReturnError:", 0);
  v3.receiver = self;
  v3.super_class = (Class)FirmwareBundle;
  -[FirmwareBundle dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return self->_bundleDescription;
}

- (NSData)firmwareImage
{
  return self->_firmwareImage;
}

- (NSDictionary)buildManifest
{
  return self->_buildManifest;
}

- (void)setBuildManifest:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSData)hash
{
  return self->_hash;
}

- (NSData)certificate
{
  return self->_certificate;
}

- (NSData)signature
{
  return self->_signature;
}

- (unsigned)productIDCode
{
  return self->_productIDCode;
}

- (void)setProductIDCode:(unsigned int)a3
{
  self->_productIDCode = a3;
}

- (unsigned)firmwareImageBaseAddress
{
  return self->_firmwareImageBaseAddress;
}

- (unsigned)firmwareImageSize
{
  return self->_firmwareImageSize;
}

- (NSURL)firmwareLocalURL
{
  return self->_firmwareLocalURL;
}

- (void)initWithURL:(uint64_t)a1 hashData:signatureData:certData:.cold.1(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = 136315394;
  v2 = "-[FirmwareBundle initWithURL:hashData:signatureData:certData:]";
  v3 = 2112;
  v4 = a1;
  _os_log_error_impl(&dword_22CD67000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: Invalid firmwareURL %@", (uint8_t *)&v1, 0x16u);
}

@end
