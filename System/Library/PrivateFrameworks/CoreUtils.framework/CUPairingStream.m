@implementation CUPairingStream

- (CUPairingStream)init
{
  CUPairingStream *v2;
  CUPairingStream *v3;
  CUPairingStream *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUPairingStream;
  v2 = -[CUPairingStream init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_authTagLength = 16;
    v4 = v2;
  }

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[CUPairingStream _cleanup](self, "_cleanup");
  v3.receiver = self;
  v3.super_class = (Class)CUPairingStream;
  -[CUPairingStream dealloc](&v3, sel_dealloc);
}

- (void)_cleanup
{
  CryptoAEADPrivate *encryptAEAD;
  CryptoAEADPrivate *decryptAEAD;

  encryptAEAD = self->_encryptAEAD;
  if (encryptAEAD)
  {
    CFRelease(encryptAEAD);
    self->_encryptAEAD = 0;
  }
  decryptAEAD = self->_decryptAEAD;
  if (decryptAEAD)
  {
    CFRelease(decryptAEAD);
    self->_decryptAEAD = 0;
  }
}

- (BOOL)prepareWithName:(id)a3 isClient:(BOOL)a4 pskData:(id)a5 error:(id *)a6
{
  _BOOL4 v8;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  char *v22;
  size_t v23;
  CryptoAEADPrivate *v24;
  const char *v25;
  char *v26;
  size_t v27;
  CryptoAEADPrivate *v28;
  BOOL v29;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  char *__s;
  unsigned int v35;
  _BYTE v36[32];
  uint64_t v37;

  v8 = a4;
  v37 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = objc_retainAutorelease(a5);
  v13 = objc_msgSend(v12, "bytes");
  v14 = objc_msgSend(v12, "length");
  v35 = 0;
  __s = 0;
  if (!objc_msgSend(v11, "length"))
  {
    if (!a6)
      goto LABEL_35;
    v31 = "EmptyName";
    v32 = 4294960552;
LABEL_34:
    NSErrorWithOSStatusF(v32, (uint64_t)v31, v15, v16, v17, v18, v19, v20, v33);
    v29 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  objc_storeStrong((id *)&self->_name, a3);
  if ((unint64_t)objc_msgSend(v12, "length") <= 0x1F)
  {
    if (!a6)
      goto LABEL_35;
    v31 = "PSK too small";
    v32 = 4294960553;
    goto LABEL_34;
  }
  if (v8)
    v21 = "ClientEncrypt-%@";
  else
    v21 = "ServerEncrypt-%@";
  ASPrintF((void **)&__s, (uint64_t)v21, v15, v16, v17, v18, v19, v20, (uint64_t)v11);
  v22 = __s;
  if (!__s)
  {
    if (!a6)
      goto LABEL_35;
    v31 = "CreateEncryptInfoFailed";
    goto LABEL_28;
  }
  v23 = strlen(__s);
  CryptoHKDF((uint64_t)kCryptoHashDescriptor_SHA512, v13, v14, "", 0, (uint64_t)__s, v23, 0x20uLL, (uint64_t)v36);
  free(v22);
  v24 = (CryptoAEADPrivate *)CryptoAEADCreate((uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))kCryptoAEADDescriptorChaCha20Poly1305[0], 1, (uint64_t)v36, 32, (int *)&v35);
  self->_encryptAEAD = v24;
  if (!v24)
  {
    if (a6)
    {
      if (v35)
        v32 = v35;
      else
        v32 = 4294960596;
      v31 = "CreateEncryptAEADFailed";
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  if (v8)
    v25 = "ServerEncrypt-%@";
  else
    v25 = "ClientEncrypt-%@";
  ASPrintF((void **)&__s, (uint64_t)v25, v15, v16, v17, v18, v19, v20, (uint64_t)v11);
  v26 = __s;
  if (!__s)
  {
    if (!a6)
      goto LABEL_35;
    v31 = "CreateDecryptInfoFailed";
LABEL_28:
    v32 = 4294960568;
    goto LABEL_34;
  }
  v27 = strlen(__s);
  CryptoHKDF((uint64_t)kCryptoHashDescriptor_SHA512, v13, v14, "", 0, (uint64_t)__s, v27, 0x20uLL, (uint64_t)v36);
  free(v26);
  v28 = (CryptoAEADPrivate *)CryptoAEADCreate((uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))kCryptoAEADDescriptorChaCha20Poly1305[0], 2, (uint64_t)v36, 32, (int *)&v35);
  self->_decryptAEAD = v28;
  if (!v28)
  {
    if (a6)
    {
      if (v35)
        v32 = v35;
      else
        v32 = 4294960596;
      v31 = "CreateDecryptAEADFailed";
      goto LABEL_34;
    }
LABEL_35:
    v29 = 0;
    goto LABEL_14;
  }
  memset_s(v36, 0x20uLL, 0, 0x20uLL);
  v29 = 1;
LABEL_14:

  return v29;
}

- (id)encryptData:(id)a3 aadData:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v8 = objc_retainAutorelease(a4);
  v9 = a3;
  v10 = objc_msgSend(v8, "bytes");
  v11 = objc_msgSend(v8, "length");

  -[CUPairingStream encryptData:aadBytes:aadLength:error:](self, "encryptData:aadBytes:aadLength:error:", v9, v10, v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)encryptData:(id)a3 aadBytes:(const void *)a4 aadLength:(unint64_t)a5 error:(id *)a6
{
  id v10;
  uint64_t v11;
  size_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  unint64_t authTagLength;
  _BOOL4 v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v34;
  id v35;

  v10 = a3;
  v11 = objc_msgSend(v10, "length");
  v12 = self->_authTagLength + v11;
  v13 = (char *)malloc_type_malloc(v12, 0x83879E66uLL);
  if (v13)
  {
    v20 = v13;
    v21 = objc_msgSend(objc_retainAutorelease(v10), "bytes");
    authTagLength = self->_authTagLength;
    v35 = 0;
    v23 = -[CUPairingStream encryptInputBytes:inputLength:inputAADBytes:inputAADLength:outputBytes:outputAuthTagBytes:outputAuthTagLength:error:](self, "encryptInputBytes:inputLength:inputAADBytes:inputAADLength:outputBytes:outputAuthTagBytes:outputAuthTagLength:error:", v21, v11, a4, a5, v20, &v20[v11], authTagLength, &v35);
    v24 = v35;
    if (v23)
    {
      v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:", v20, v12);
      if (v25)
      {
        v32 = (void *)v25;

        v24 = 0;
        goto LABEL_5;
      }
      NSErrorWithOSStatusF(4294960568, (uint64_t)"NSData %zu bytes failed", v26, v27, v28, v29, v30, v31, v12);
      v34 = objc_claimAutoreleasedReturnValue();

      v24 = (id)v34;
    }
    free(v20);
  }
  else
  {
    NSErrorWithOSStatusF(4294960568, (uint64_t)"Malloc %zu bytes failed", v14, v15, v16, v17, v18, v19, v12);
    v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  v32 = 0;
  if (a6 && v24)
  {
    v24 = objc_retainAutorelease(v24);
    v32 = 0;
    *a6 = v24;
  }
LABEL_5:

  return v32;
}

- (id)decryptData:(id)a3 aadData:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v8 = objc_retainAutorelease(a4);
  v9 = a3;
  v10 = objc_msgSend(v8, "bytes");
  v11 = objc_msgSend(v8, "length");

  -[CUPairingStream decryptData:aadBytes:aadLength:error:](self, "decryptData:aadBytes:aadLength:error:", v9, v10, v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)decryptData:(id)a3 aadBytes:(const void *)a4 aadLength:(unint64_t)a5 error:(id *)a6
{
  id v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t authTagLength;
  uint64_t v20;
  size_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  _BOOL4 v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  id v41;

  v10 = a3;
  v11 = objc_msgSend(v10, "length");
  v18 = v11;
  authTagLength = self->_authTagLength;
  if (v11 < authTagLength)
  {
    NSErrorWithOSStatusF(4294960553, (uint64_t)"Data too small for auth tag (%zu bytes)", v12, v13, v14, v15, v16, v17, v11);
LABEL_16:
    v31 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  v20 = objc_msgSend(objc_retainAutorelease(v10), "bytes");
  v21 = v18 - authTagLength;
  if (!v21)
  {
    v22 = 0;
    goto LABEL_5;
  }
  v22 = malloc_type_malloc(v21, 0x8C3BABC4uLL);
  if (!v22)
  {
    NSErrorWithOSStatusF(4294960568, (uint64_t)"Malloc %zu bytes failed", v23, v24, v25, v26, v27, v28, v21);
    goto LABEL_16;
  }
LABEL_5:
  v29 = self->_authTagLength;
  v41 = 0;
  v30 = -[CUPairingStream decryptInputBytes:inputLength:inputAADBytes:inputAADLength:inputAuthTagPtr:inputAuthTagLength:outputBytes:error:](self, "decryptInputBytes:inputLength:inputAADBytes:inputAADLength:inputAuthTagPtr:inputAuthTagLength:outputBytes:error:", v20, v21, a4, a5, v20 + v21, v29, v22, &v41);
  v31 = v41;
  if (v30)
  {
    if (v22)
    {
      v38 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:", v22, v21);
      if (!v38)
      {
        NSErrorWithOSStatusF(4294960541, (uint64_t)"NSData %zu bytes failed", v32, v33, v34, v35, v36, v37, v21);
        v39 = objc_claimAutoreleasedReturnValue();

        v31 = (id)v39;
LABEL_14:
        free(v22);
        goto LABEL_17;
      }
    }
    else
    {
      v38 = objc_alloc_init(MEMORY[0x1E0C99D50]);
    }

    v31 = 0;
    goto LABEL_11;
  }
  if (v22)
    goto LABEL_14;
LABEL_17:
  v38 = 0;
  if (a6 && v31)
  {
    v31 = objc_retainAutorelease(v31);
    v38 = 0;
    *a6 = v31;
  }
LABEL_11:

  return v38;
}

- (BOOL)encryptInputBytes:(const void *)a3 inputLength:(unint64_t)a4 inputAADBytes:(const void *)a5 inputAADLength:(unint64_t)a6 outputBytes:(void *)a7 outputAuthTagBytes:(void *)a8 outputAuthTagLength:(unint64_t)a9 error:(id *)a10
{
  CryptoAEADPrivate *encryptAEAD;
  unsigned __int8 *encryptNonce;
  uint64_t v13;
  uint64_t v14;
  BOOL v16;
  BOOL v17;
  id v18;
  BOOL v19;
  const char *v21;
  BOOL v22;
  void *v23;

  encryptAEAD = self->_encryptAEAD;
  if (encryptAEAD)
  {
    encryptNonce = self->_encryptNonce;
    v23 = a8;
    v13 = (*(uint64_t (**)(void))(*((_QWORD *)encryptAEAD + 2) + 16))();
    v14 = 0;
    do
    {
      if (++encryptNonce[v14])
        v16 = 1;
      else
        v16 = v14 == 11;
      ++v14;
    }
    while (!v16);
    if (!(_DWORD)v13)
    {
      v17 = 0;
      v18 = 0;
      goto LABEL_10;
    }
    v21 = "EncryptFailed";
  }
  else
  {
    v21 = "EncryptWhenNotOpen";
    v13 = 4294960541;
  }
  NSErrorWithOSStatusF(v13, (uint64_t)v21, (uint64_t)a3, a4, (uint64_t)a5, a6, (uint64_t)a7, (uint64_t)a8, (uint64_t)v23);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v17 = v18 != 0;
  if (a10)
    v22 = v18 == 0;
  else
    v22 = 1;
  if (!v22)
  {
    v18 = objc_retainAutorelease(v18);
    *a10 = v18;
    v17 = 1;
  }
LABEL_10:
  v19 = !v17;

  return v19;
}

- (BOOL)decryptInputBytes:(const void *)a3 inputLength:(unint64_t)a4 inputAADBytes:(const void *)a5 inputAADLength:(unint64_t)a6 inputAuthTagPtr:(const void *)a7 inputAuthTagLength:(unint64_t)a8 outputBytes:(void *)a9 error:(id *)a10
{
  CryptoAEADPrivate *decryptAEAD;
  unsigned __int8 *decryptNonce;
  uint64_t v13;
  uint64_t v14;
  BOOL v16;
  BOOL v17;
  id v18;
  BOOL v19;
  const char *v21;
  BOOL v22;
  const void *v23;

  decryptAEAD = self->_decryptAEAD;
  if (decryptAEAD)
  {
    decryptNonce = self->_decryptNonce;
    v23 = a7;
    v13 = (*(uint64_t (**)(void))(*((_QWORD *)decryptAEAD + 2) + 24))();
    v14 = 0;
    do
    {
      if (++decryptNonce[v14])
        v16 = 1;
      else
        v16 = v14 == 11;
      ++v14;
    }
    while (!v16);
    if (!(_DWORD)v13)
    {
      v17 = 0;
      v18 = 0;
      goto LABEL_10;
    }
    v21 = "DecryptFailed";
  }
  else
  {
    v21 = "DecryptWhenNotOpen";
    v13 = 4294960541;
  }
  NSErrorWithOSStatusF(v13, (uint64_t)v21, (uint64_t)a3, a4, (uint64_t)a5, a6, (uint64_t)a7, a8, (uint64_t)v23);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v17 = v18 != 0;
  if (a10)
    v22 = v18 == 0;
  else
    v22 = 1;
  if (!v22)
  {
    v18 = objc_retainAutorelease(v18);
    *a10 = v18;
    v17 = 1;
  }
LABEL_10:
  v19 = !v17;

  return v19;
}

- (unint64_t)authTagLength
{
  return self->_authTagLength;
}

- (void)setAuthTagLength:(unint64_t)a3
{
  self->_authTagLength = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
