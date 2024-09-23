@implementation HAPSecuritySessionEncryption

- (HAPSecuritySessionEncryption)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAPSecuritySessionEncryption;
  return -[HAPSecuritySessionEncryption init](&v3, sel_init);
}

- (HAPSecuritySessionEncryption)initWithInputKey:(id)a3 outputKey:(id)a4
{
  id v7;
  id v8;
  HAPSecuritySessionEncryption *v9;
  HAPSecuritySessionEncryption *v10;
  uint64_t v11;
  NSMutableData *inputNonce;
  uint64_t v13;
  NSMutableData *outputNonce;
  objc_super v16;
  _BYTE __s[8];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HAPSecuritySessionEncryption;
  v9 = -[HAPSecuritySessionEncryption init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_inputKey, a3);
    objc_storeStrong((id *)&v10->_outputKey, a4);
    memset_s(__s, 8uLL, 0, 8uLL);
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytes:length:", __s, 8);
    v11 = objc_claimAutoreleasedReturnValue();
    inputNonce = v10->_inputNonce;
    v10->_inputNonce = (NSMutableData *)v11;

    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytes:length:", __s, 8);
    v13 = objc_claimAutoreleasedReturnValue();
    outputNonce = v10->_outputNonce;
    v10->_outputNonce = (NSMutableData *)v13;

  }
  return v10;
}

- (id)encrypt:(id)a3 additionalAuthenticatedData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _BYTE *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v20;
  _BYTE v22[16];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", objc_msgSend(v6, "length"));
  -[HAPSecuritySessionEncryption outputKey](self, "outputKey");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v9, "bytes");
  -[HAPSecuritySessionEncryption outputNonce](self, "outputNonce");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v10, "bytes");
  v11 = objc_retainAutorelease(v7);
  objc_msgSend(v11, "bytes");
  objc_msgSend(v11, "length");
  v12 = objc_retainAutorelease(v6);
  objc_msgSend(v12, "bytes");
  objc_msgSend(v12, "length");
  v13 = objc_retainAutorelease(v8);
  objc_msgSend(v13, "mutableBytes");
  chacha20_poly1305_encrypt_all_64x64();

  objc_msgSend(v13, "appendBytes:length:", v22, 16);
  -[HAPSecuritySessionEncryption outputNonce](self, "outputNonce");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v15 = (_BYTE *)objc_msgSend(v14, "mutableBytes");
  -[HAPSecuritySessionEncryption outputNonce](self, "outputNonce");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");
  if (v17)
  {
    v18 = v17 - 1;
    do
    {
      if (++*v15++)
        v20 = 1;
      else
        v20 = v18 == 0;
      --v18;
    }
    while (!v20);
  }

  return v13;
}

- (id)decrypt:(id)a3 additionalAuthenticatedData:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  int v16;
  id v17;
  _BYTE *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  id v35;

  v8 = a3;
  v9 = a4;
  if (a5)
    *a5 = 0;
  objc_msgSend(v8, "subdataWithRange:", objc_msgSend(v8, "length", a5) - 16, 16);
  v31 = (id)objc_claimAutoreleasedReturnValue();
  v35 = v8;
  objc_msgSend(v8, "subdataWithRange:", 0, objc_msgSend(v8, "length") - 16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", objc_msgSend(v10, "length"));
  -[HAPSecuritySessionEncryption inputKey](self, "inputKey");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v12, "bytes");
  -[HAPSecuritySessionEncryption inputNonce](self, "inputNonce");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v13, "bytes");
  v14 = objc_retainAutorelease(v9);
  objc_msgSend(v14, "bytes");
  v34 = v14;
  objc_msgSend(v14, "length");
  v15 = objc_retainAutorelease(v10);
  objc_msgSend(v15, "bytes");
  objc_msgSend(v15, "length");
  v33 = objc_retainAutorelease(v11);
  objc_msgSend(v33, "mutableBytes");
  v32 = objc_retainAutorelease(v31);
  objc_msgSend(v32, "bytes");
  v16 = chacha20_poly1305_decrypt_all_64x64();

  -[HAPSecuritySessionEncryption inputNonce](self, "inputNonce");
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = (_BYTE *)objc_msgSend(v17, "mutableBytes");
  -[HAPSecuritySessionEncryption inputNonce](self, "inputNonce");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "length");
  if (v20)
  {
    v21 = v20 - 1;
    do
    {
      if (++*v18++)
        v23 = 1;
      else
        v23 = v21 == 0;
      --v21;
    }
    while (!v23);
  }

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), v16, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    v26 = v35;
    v27 = v33;
    if (v30)
      *v30 = objc_retainAutorelease(v24);

    v28 = 0;
  }
  else
  {
    v27 = v33;
    v28 = v33;
    v26 = v35;
  }

  return v28;
}

- (id)decrypt:(const void *)a3 length:(unint64_t)a4 additionalAuthData:(const void *)a5 additionalAuthDataLength:(unint64_t)a6 authTagData:(const void *)a7 authTagDataLength:(unint64_t)a8 error:(id *)a9
{
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  _BYTE *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v22;
  id v23;

  if (a9)
  {
    *a9 = 0;
    if (a8 != 16)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:userInfo:", 3, 0, a5, a6, a7);
      *a9 = (id)objc_claimAutoreleasedReturnValue();
      return 0;
    }
  }
  else if (a8 != 16)
  {
    return 0;
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", a4);
  -[HAPSecuritySessionEncryption inputKey](self, "inputKey");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v12, "bytes");
  -[HAPSecuritySessionEncryption inputNonce](self, "inputNonce");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v13, "bytes");
  v14 = objc_retainAutorelease(v11);
  objc_msgSend(v14, "mutableBytes");
  v15 = chacha20_poly1305_decrypt_all_64x64();

  -[HAPSecuritySessionEncryption inputNonce](self, "inputNonce");
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v17 = (_BYTE *)objc_msgSend(v16, "mutableBytes");
  -[HAPSecuritySessionEncryption inputNonce](self, "inputNonce");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "length");
  if (v19)
  {
    v20 = v19 - 1;
    do
    {
      if (++*v17++)
        v22 = 1;
      else
        v22 = v20 == 0;
      --v20;
    }
    while (!v22);
  }

  if ((_DWORD)v15)
  {
    if (a9)
    {
      HMErrorFromOSStatus(v15);
      v23 = 0;
      *a9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
  }
  else
  {
    v23 = v14;
  }

  return v23;
}

- (NSData)inputKey
{
  return self->_inputKey;
}

- (void)setInputKey:(id)a3
{
  objc_storeStrong((id *)&self->_inputKey, a3);
}

- (NSMutableData)inputNonce
{
  return self->_inputNonce;
}

- (void)setInputNonce:(id)a3
{
  objc_storeStrong((id *)&self->_inputNonce, a3);
}

- (NSData)outputKey
{
  return self->_outputKey;
}

- (void)setOutputKey:(id)a3
{
  objc_storeStrong((id *)&self->_outputKey, a3);
}

- (NSMutableData)outputNonce
{
  return self->_outputNonce;
}

- (void)setOutputNonce:(id)a3
{
  objc_storeStrong((id *)&self->_outputNonce, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputNonce, 0);
  objc_storeStrong((id *)&self->_outputKey, 0);
  objc_storeStrong((id *)&self->_inputNonce, 0);
  objc_storeStrong((id *)&self->_inputKey, 0);
}

@end
