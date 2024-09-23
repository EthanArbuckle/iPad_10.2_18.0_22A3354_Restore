@implementation HKHealthWrapEncryptor

- (HKHealthWrapEncryptor)initWithOutputStream:(id)a3 certificate:(__SecCertificate *)a4 algorithm:(unsigned int)a5 options:(unsigned int)a6 keySize:(unsigned int)a7 uuid:(id)a8 studyUUID:(id)a9 compressionEnabled:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  HKHealthWrapEncryptor *v19;
  void *v21;
  objc_super v24;

  v16 = a3;
  v17 = a8;
  v18 = a9;
  v24.receiver = self;
  v24.super_class = (Class)HKHealthWrapEncryptor;
  v19 = -[HKHealthWrapEncryptor init](&v24, sel_init);
  if (v19)
  {
    if (!a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, v19, CFSTR("HKHealthWrapEncryptor.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("certificate != NULL"));

    }
    objc_storeStrong((id *)&v19->_outputStream, a3);
    v19->_certificate = (__SecCertificate *)CFRetain(a4);
    v19->_algorithm = a5;
    v19->_options = a6;
    v19->_keySize = a7;
    v19->_cryptor = 0;
    objc_storeStrong((id *)&v19->_uuid, a8);
    objc_storeStrong((id *)&v19->_studyUUID, a9);
    v19->_hmacAlgorithm = 2;
    v19->_encryptedBytesCount = 0;
    v19->_compressionEnabled = a10;
  }

  return v19;
}

- (void)dealloc
{
  __SecCertificate *certificate;
  _CCCryptor *cryptor;
  objc_super v5;

  certificate = self->_certificate;
  if (certificate)
  {
    CFRelease(certificate);
    self->_certificate = 0;
  }
  cryptor = self->_cryptor;
  if (cryptor)
  {
    CCCryptorRelease(cryptor);
    self->_cryptor = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)HKHealthWrapEncryptor;
  -[HKHealthWrapEncryptor dealloc](&v5, sel_dealloc);
}

- (__SecKey)_copyAndVerifyPublicKeyFromCertificate:(__SecCertificate *)a3 error:(id *)a4
{
  __SecKey *v8;
  void *v10;
  void *v11;

  if (a3)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthWrapEncryptor.m"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("certificate != NULL"));

    if (a4)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthWrapEncryptor.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error != NULL"));

LABEL_3:
  v8 = SecCertificateCopyKey(a3);
  if (!v8)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 100, CFSTR("No public key found in certificate"));
  return v8;
}

- (id)_encryptData:(id)a3 withCertificate:(__SecCertificate *)a4 error:(id *)a5
{
  const __CFData *v9;
  __SecKey *v10;
  __SecKey *v11;
  CFDataRef v12;
  __CFError *v13;
  __CFError *v14;
  void *v16;
  void *v17;
  void *v18;
  CFErrorRef error;

  v9 = (const __CFData *)a3;
  if (v9)
  {
    if (a4)
      goto LABEL_3;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthWrapEncryptor.m"), 117, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("certificate != NULL"));

    if (a5)
      goto LABEL_4;
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthWrapEncryptor.m"), 116, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data != nil"));

  if (!a4)
    goto LABEL_13;
LABEL_3:
  if (a5)
    goto LABEL_4;
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthWrapEncryptor.m"), 118, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error != NULL"));

LABEL_4:
  v10 = -[HKHealthWrapEncryptor _copyAndVerifyPublicKeyFromCertificate:error:](self, "_copyAndVerifyPublicKeyFromCertificate:error:", a4, a5);
  if (v10)
  {
    v11 = v10;
    error = 0;
    v12 = SecKeyCreateEncryptedData(v10, (SecKeyAlgorithm)*MEMORY[0x1E0CD6E38], v9, &error);
    CFRelease(v11);
    v13 = error;
    v14 = v13;
    if (v13)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v13);
      else
        _HKLogDroppedError(v13);
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)_updateHeaderWithKey:(id)a3 iv:(id)a4 hmacKey:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  HKHealthWrapCodableMessageKey *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v20;
  void *v21;
  void *v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthWrapEncryptor.m"), 141, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("iv != nil"));

    if (a6)
      goto LABEL_4;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthWrapEncryptor.m"), 140, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key != nil"));

  if (!v12)
    goto LABEL_11;
LABEL_3:
  if (a6)
    goto LABEL_4;
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthWrapEncryptor.m"), 142, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error != NULL"));

LABEL_4:
  v14 = objc_alloc_init(HKHealthWrapCodableMessageKey);
  -[HKHealthWrapCodableMessageKey setKey:](v14, "setKey:", v11);
  -[HKHealthWrapCodableMessageKey setIv:](v14, "setIv:", v12);
  -[HKHealthWrapCodableMessageKey data](v14, "data");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthWrapEncryptor _encryptData:withCertificate:error:](self, "_encryptData:withCertificate:error:", v15, self->_certificate, a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[HKHealthWrapCodableMessageHeader setEncryptedMessageKey:](self->_header, "setEncryptedMessageKey:", v16);
    -[HKHealthWrapEncryptor _encryptData:withCertificate:error:](self, "_encryptData:withCertificate:error:", v13, self->_certificate, a6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17 != 0;
    if (v17)
      -[HKHealthWrapCodableMessageHeader setEncryptedHMACKey:](self->_header, "setEncryptedHMACKey:", v17);

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)_startCryptorWithError:(id *)a3
{
  void *v5;
  const __SecRandom *v6;
  size_t v7;
  id v8;
  BOOL v9;
  void *v10;
  size_t keySize;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  unsigned int v19;
  unsigned int data;
  CCCryptorRef cryptorRef;

  self->_encryptedBytesCount = 0;
  cryptorRef = 0;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (const __SecRandom *)*MEMORY[0x1E0CD7000];
  v7 = objc_msgSend(v5, "length");
  v8 = objc_retainAutorelease(v5);
  if (!SecRandomCopyBytes(v6, v7, (void *)objc_msgSend(v8, "mutableBytes")))
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", self->_keySize);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    keySize = self->_keySize;
    v12 = objc_retainAutorelease(v10);
    if (SecRandomCopyBytes(v6, keySize, (void *)objc_msgSend(v12, "mutableBytes")))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 100, CFSTR("Key generation: %d"), *__error());
      v9 = 0;
LABEL_14:

      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 32);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    if (SecRandomCopyBytes(v6, 0x20uLL, (void *)objc_msgSend(v13, "mutableBytes")))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 100, CFSTR("HMAC key generation: %d"), *__error());
    }
    else if (-[HKHealthWrapEncryptor _updateHeaderWithKey:iv:hmacKey:error:](self, "_updateHeaderWithKey:iv:hmacKey:error:", v12, v8, v13, a3))
    {
      CCHmacInit((CCHmacContext *)&self->_hmacContext, self->_hmacAlgorithm, (const void *)objc_msgSend(objc_retainAutorelease(v13), "bytes"), 0x20uLL);
      v14 = objc_retainAutorelease(v8);
      CCHmacUpdate((CCHmacContext *)&self->_hmacContext, (const void *)objc_msgSend(v14, "bytes"), objc_msgSend(v14, "length"));
      -[HKHealthWrapCodableMessageHeader studyUUID](self->_header, "studyUUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "length"))
      {
        v16 = objc_retainAutorelease(v15);
        CCHmacUpdate((CCHmacContext *)&self->_hmacContext, (const void *)objc_msgSend(v16, "bytes"), objc_msgSend(v16, "length"));
      }
      data = bswap32(-[HKHealthWrapCodableMessageHeader trailingHMACLength](self->_header, "trailingHMACLength"));
      v19 = bswap32(-[HKHealthWrapCodableMessageHeader trailingSHALength](self->_header, "trailingSHALength"));
      CCHmacUpdate((CCHmacContext *)&self->_hmacContext, &data, 4uLL);
      CCHmacUpdate((CCHmacContext *)&self->_hmacContext, &v19, 4uLL);
      v17 = CCCryptorCreate(0, self->_algorithm, self->_options, (const void *)objc_msgSend(objc_retainAutorelease(v12), "bytes"), self->_keySize, (const void *)objc_msgSend(objc_retainAutorelease(v14), "bytes"), &cryptorRef);
      v9 = (_DWORD)v17 == 0;
      if ((_DWORD)v17)
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 100, CFSTR("cryptor create: %d"), v17);
      else
        self->_cryptor = cryptorRef;

      goto LABEL_13;
    }
    v9 = 0;
LABEL_13:

    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 100, CFSTR("IV generation: %d"), *__error());
  v9 = 0;
LABEL_15:

  return v9;
}

- (BOOL)startWithError:(id *)a3
{
  HKHealthWrapCodableMessageHeader *v5;
  HKHealthWrapCodableMessageHeader *header;
  void *v7;
  void *v8;
  NSMutableData *v9;
  NSMutableData *buffer;
  CFDataRef v11;
  void *v12;
  id v13;
  BOOL v14;
  unsigned int v16;

  CC_SHA256_Init(&self->_sha256Context);
  v5 = objc_alloc_init(HKHealthWrapCodableMessageHeader);
  header = self->_header;
  self->_header = v5;

  -[HKHealthWrapCodableMessageHeader setVersion:](self->_header, "setVersion:", 3);
  -[NSUUID hk_dataForUUIDBytes](self->_uuid, "hk_dataForUUIDBytes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthWrapCodableMessageHeader setUploadUUID:](self->_header, "setUploadUUID:", v7);

  -[NSUUID hk_dataForUUIDBytes](self->_studyUUID, "hk_dataForUUIDBytes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthWrapCodableMessageHeader setStudyUUID:](self->_header, "setStudyUUID:", v8);

  -[HKHealthWrapCodableMessageHeader setTrailingHMACLength:](self->_header, "setTrailingHMACLength:", 32);
  -[HKHealthWrapCodableMessageHeader setTrailingSHALength:](self->_header, "setTrailingSHALength:", 32);
  -[HKHealthWrapCodableMessageHeader setCompressed:](self->_header, "setCompressed:", self->_compressionEnabled);
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 0x2000);
  v9 = (NSMutableData *)objc_claimAutoreleasedReturnValue();
  buffer = self->_buffer;
  self->_buffer = v9;

  if (self->_buffer && self->_header)
  {
    v11 = SecCertificateCopyData(self->_certificate);
    if (v11)
    {
      -[HKHealthWrapCodableMessageHeader setEncryptionIdentity:](self->_header, "setEncryptionIdentity:", v11);
      if (-[HKHealthWrapEncryptor _startCryptorWithError:](self, "_startCryptorWithError:", a3))
      {
        -[NSOutputStream open](self->_outputStream, "open");
        -[HKHealthWrapCodableMessageHeader data](self->_header, "data");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = bswap32(objc_msgSend(v12, "length"));
        if (-[HKHealthWrapEncryptor _writeStream:length:hash:error:](self, "_writeStream:length:hash:error:", &v16, 4, 1, a3))
        {
          v13 = objc_retainAutorelease(v12);
          v14 = -[HKHealthWrapEncryptor _writeStream:length:hash:error:](self, "_writeStream:length:hash:error:", objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"), 1, a3);
        }
        else
        {
          v14 = 0;
        }

        goto LABEL_12;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 100, CFSTR("Could not copy certificate"));
    }
    v14 = 0;
LABEL_12:

    return v14;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 100, CFSTR("Could not allocate buffer or header"));
  return 0;
}

- (BOOL)_writeStream:(const char *)a3 length:(unint64_t)a4 hash:(BOOL)a5 error:(id *)a6
{
  unint64_t v7;
  const char *v8;
  uint64_t v10;
  BOOL v11;
  BOOL result;
  id v13;

  v7 = a4;
  v8 = a3;
  if (a5)
  {
    if (a4 >= 0xFFFFFFFF)
      -[HKHealthWrapEncryptor _writeStream:length:hash:error:].cold.1();
    CC_SHA256_Update(&self->_sha256Context, a3, a4);
  }
  if (!v7)
    return 1;
  while (1)
  {
    v10 = -[NSOutputStream write:maxLength:](self->_outputStream, "write:maxLength:", v8, v7);
    if (v10 <= 0)
      break;
    v11 = v7 >= v10;
    v7 -= v10;
    if (!v11)
      -[HKHealthWrapEncryptor _writeStream:length:hash:error:].cold.2();
    v8 += v10;
    if (!v7)
      return 1;
  }
  if (!a6)
    return 0;
  -[NSOutputStream streamError](self->_outputStream, "streamError");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  result = 0;
  *a6 = v13;
  return result;
}

- (BOOL)_appendEncryptedBytes:(const char *)a3 length:(unint64_t)a4 error:(id *)a5
{
  CCHmacUpdate((CCHmacContext *)&self->_hmacContext, a3, a4);
  self->_encryptedBytesCount += a4;
  return -[HKHealthWrapEncryptor _writeStream:length:hash:error:](self, "_writeStream:length:hash:error:", a3, a4, 1, a5);
}

- (BOOL)_updateCryptorWithData:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  size_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  size_t dataOutMoved;

  v6 = a3;
  v7 = objc_msgSend(v6, "length");
  v8 = objc_retainAutorelease(v6);
  v9 = objc_msgSend(v8, "bytes");
  if (objc_msgSend(v8, "length"))
  {
    v10 = 0;
    while (1)
    {
      v11 = v7 - v10 >= 0x1FF0 ? 8176 : v7 - v10;
      dataOutMoved = 0;
      v12 = CCCryptorUpdate(self->_cryptor, (const void *)(v9 + v10), v11, -[NSMutableData mutableBytes](self->_buffer, "mutableBytes"), 0x2000uLL, &dataOutMoved);
      if ((_DWORD)v12)
        break;
      if (dataOutMoved)
      {
        v13 = -[NSMutableData bytes](self->_buffer, "bytes");
        if (!-[HKHealthWrapEncryptor _appendEncryptedBytes:length:error:](self, "_appendEncryptedBytes:length:error:", v13, dataOutMoved, a4))goto LABEL_12;
      }
      v10 += v11;
      if (v10 >= objc_msgSend(v8, "length"))
        goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 100, CFSTR("crpytor update: %d"), v12);
LABEL_12:
    v14 = 0;
  }
  else
  {
LABEL_10:
    v14 = 1;
  }

  return v14;
}

- (BOOL)_finalizeCryptorWithError:(id *)a3
{
  uint64_t v5;
  _BOOL4 v6;
  uint64_t v7;
  unint64_t data;
  size_t dataOutMoved;

  dataOutMoved = 0;
  v5 = CCCryptorFinal(self->_cryptor, -[NSMutableData mutableBytes](self->_buffer, "mutableBytes"), 0x2000uLL, &dataOutMoved);
  if ((_DWORD)v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 100, CFSTR("crpytor update: %d"), v5);
    LOBYTE(v6) = 0;
  }
  else if (!dataOutMoved
         || (v7 = -[NSMutableData bytes](self->_buffer, "bytes"),
             v6 = -[HKHealthWrapEncryptor _appendEncryptedBytes:length:error:](self, "_appendEncryptedBytes:length:error:", v7, dataOutMoved, a3)))
  {
    data = bswap64(self->_encryptedBytesCount);
    CCHmacUpdate((CCHmacContext *)&self->_hmacContext, &data, 8uLL);
    LOBYTE(v6) = -[HKHealthWrapEncryptor _writeStream:length:hash:error:](self, "_writeStream:length:hash:error:", &data, 8, 1, a3);
  }
  return v6;
}

- (BOOL)finalizeWithError:(id *)a3
{
  _BOOL4 v5;
  unsigned __int8 md[32];
  _BYTE macOut[32];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (-[HKHealthWrapEncryptor _finalizeCryptorWithError:](self, "_finalizeCryptorWithError:")
    && (CCHmacFinal((CCHmacContext *)&self->_hmacContext, macOut),
        -[HKHealthWrapEncryptor _writeStream:length:hash:error:](self, "_writeStream:length:hash:error:", macOut, 32, 1, a3)))
  {
    CC_SHA256_Final(md, &self->_sha256Context);
    v5 = -[HKHealthWrapEncryptor _writeStream:length:hash:error:](self, "_writeStream:length:hash:error:", md, 32, 0, a3);
    if (v5)
      -[NSOutputStream close](self->_outputStream, "close");
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_studyUUID, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
}

- (void)_writeStream:length:hash:error:.cold.1()
{
  __assert_rtn("-[HKHealthWrapEncryptor _writeStream:length:hash:error:]", "HKHealthWrapEncryptor.m", 268, "length < UINT32_MAX");
}

- (void)_writeStream:length:hash:error:.cold.2()
{
  __assert_rtn("-[HKHealthWrapEncryptor _writeStream:length:hash:error:]", "HKHealthWrapEncryptor.m", 280, "(size_t)bytesWritten <= length");
}

@end
