@implementation MKCrypto

- (MKCrypto)initWithKey:(id)a3
{
  id v4;
  MKCrypto *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  MKCrypto *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  unint64_t v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MKCrypto;
  v5 = -[MKCrypto init](&v25, sel_init);
  if (!v5)
  {
LABEL_18:
    v13 = v5;
    goto LABEL_19;
  }
  if ((unint64_t)objc_msgSend(v4, "length") > 0xF)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v14 = objc_msgSend(&unk_24E36C6E0, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(&unk_24E36C6E0);
          v18 = objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "unsignedIntegerValue");
          if (objc_msgSend(v4, "length") > v18)
          {
            objc_msgSend(v4, "subdataWithRange:", 0, v18);
            v19 = objc_claimAutoreleasedReturnValue();

            v4 = (id)v19;
            goto LABEL_17;
          }
          if (objc_msgSend(v4, "length") == v18)
            goto LABEL_17;
        }
        v15 = objc_msgSend(&unk_24E36C6E0, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (v15)
          continue;
        break;
      }
    }
LABEL_17:
    -[MKCrypto setKey:](v5, "setKey:", v4);
    goto LABEL_18;
  }
  +[MKLog log](MKLog, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[MKCrypto initWithKey:].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  v13 = 0;
LABEL_19:

  return v13;
}

- (id)encryptData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[MKCrypto bytes:](self, "bytes:", 16);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKCrypto encrypt:data:withKey:iv:](self, "encrypt:data:withKey:iv:", 1, v4, self->_key, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", objc_msgSend(v6, "length") + objc_msgSend(v5, "length"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendData:", v5);
      objc_msgSend(v7, "appendData:", v6);
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    +[MKLog log](MKLog, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MKCrypto encryptData:].cold.1((uint64_t)self, v8, v9, v10, v11, v12, v13, v14);

    v7 = 0;
  }

  return v7;
}

- (id)decryptData:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "length") > 0x10)
  {
    objc_msgSend(v4, "subdataWithRange:", 0, 16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subdataWithRange:", objc_msgSend(v13, "length"), objc_msgSend(v4, "length") - objc_msgSend(v13, "length"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKCrypto encrypt:data:withKey:iv:](self, "encrypt:data:withKey:iv:", 0, v14, self->_key, v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[MKLog log](MKLog, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[MKCrypto decryptData:].cold.1((uint64_t)self, v5, v6, v7, v8, v9, v10, v11);

    v12 = 0;
  }

  return v12;
}

- (id)encrypt:(BOOL)a3 data:(id)a4 withKey:(id)a5 iv:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  CCOperation v15;
  CCMode v16;
  const void *v17;
  id v18;
  MKError *v19;
  const __CFString *v20;
  uint64_t v21;
  MKError *v22;
  id v23;
  NSObject *v24;
  void *v26;
  _CCCryptor *v27;
  id v28;
  const void *v29;
  size_t v30;
  id v31;
  MKError *v32;
  const __CFString *v33;
  _CCCryptor *v34;
  id v35;
  size_t dataOutMoved;
  CCCryptorRef cryptorRef;

  v8 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  cryptorRef = 0;
  v13 = objc_msgSend(v11, "length");
  if (v13 > 0x20 || ((1 << v13) & 0x101010000) == 0)
  {
    v19 = [MKError alloc];
    v20 = CFSTR("did receive an invalid key.");
    v21 = 0;
    goto LABEL_13;
  }
  if (objc_msgSend(v12, "length") != 16)
  {
    v19 = [MKError alloc];
    v20 = CFSTR("did receive an invalid iv.");
    v21 = 1;
    goto LABEL_13;
  }
  v15 = !v8;
  if (-[MKCrypto useCFB8Mode](self, "useCFB8Mode"))
    v16 = 10;
  else
    v16 = 3;
  v17 = (const void *)objc_msgSend(objc_retainAutorelease(v12), "bytes");
  v18 = objc_retainAutorelease(v11);
  if (CCCryptorCreateWithMode(v15, v16, 0, 0, v17, (const void *)objc_msgSend(v18, "bytes"), objc_msgSend(v18, "length"), 0, 0, 0, 0, &cryptorRef))
  {
    v19 = [MKError alloc];
    v20 = CFSTR("could not create a cryptor.");
    v21 = 3;
LABEL_13:
    v22 = -[MKError initWithDomain:code:message:](v19, "initWithDomain:code:message:", 0x24E35CD18, v21, v20);
    v23 = 0;
    goto LABEL_14;
  }
  dataOutMoved = 0;
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", objc_msgSend(v10, "length") + 16);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = cryptorRef;
  v28 = objc_retainAutorelease(v10);
  v29 = (const void *)objc_msgSend(v28, "bytes");
  v30 = objc_msgSend(v28, "length");
  v31 = objc_retainAutorelease(v26);
  if (CCCryptorUpdate(v27, v29, v30, (void *)objc_msgSend(v31, "mutableBytes"), objc_msgSend(v31, "length"), &dataOutMoved))
  {
    v32 = [MKError alloc];
    v33 = CFSTR("could not update the cryptor.");
  }
  else
  {
    objc_msgSend(v31, "setLength:", dataOutMoved);
    v34 = cryptorRef;
    v35 = objc_retainAutorelease(v31);
    if (!CCCryptorFinal(v34, (void *)objc_msgSend(v35, "mutableBytes"), objc_msgSend(v35, "length"), &dataOutMoved))
    {
      v23 = v35;
      v22 = 0;
      goto LABEL_26;
    }
    v32 = [MKError alloc];
    v33 = CFSTR("could not finalize the cryptor.");
  }
  v22 = -[MKError initWithDomain:code:message:](v32, "initWithDomain:code:message:", 0x24E35CD18, 3, v33);
  v23 = 0;
LABEL_26:

LABEL_14:
  if (cryptorRef)
    CCCryptorRelease(cryptorRef);
  if (v22)
  {
    +[MKLog log](MKLog, "log");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[MKSRPClient computeSharedKey:clientPublicKey:proofOfMatch:FromSalt:serverPublicKey:].cold.1((uint64_t)self, v22, v24);

  }
  return v23;
}

- (id)bytes:(unint64_t)a3
{
  void *v4;
  unint64_t v5;
  uint32_t v7;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", a3);
  if (a3 >= 4)
  {
    v5 = a3 >> 2;
    do
    {
      v7 = 0;
      v7 = arc4random();
      objc_msgSend(v4, "appendBytes:length:", &v7, 4);
      --v5;
    }
    while (v5);
  }
  return v4;
}

- (BOOL)useCFB8Mode
{
  return self->_useCFB8Mode;
}

- (void)setUseCFB8Mode:(BOOL)a3
{
  self->_useCFB8Mode = a3;
}

- (NSData)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)initWithKey:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21EC08000, a2, a3, "%@ could not initialize a crypto object because an invalid key was passed.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)encryptData:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21EC08000, a2, a3, "%@ could not continue to encrypt data because invalid data was passed.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)decryptData:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21EC08000, a2, a3, "%@ could not continue to decrypt data because invalid data was passed.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end
