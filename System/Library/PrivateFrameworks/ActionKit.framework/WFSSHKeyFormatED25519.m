@implementation WFSSHKeyFormatED25519

+ (id)generateKeyPairWithKeySize:(unint64_t)a3 comment:(id)a4
{
  id v5;
  WFSSHKeyPair *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  _OWORD v15[2];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (ccrng()
    && (memset(v15, 0, sizeof(v15)), v13 = 0u, v14 = 0u, ccsha512_di(), !cced25519_make_key_pair()))
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BDBCE50], "_newZeroingDataWithBytes:length:", v15, 32, v13, v14);
    v8 = (void *)objc_msgSend(MEMORY[0x24BDBCE50], "_newZeroingDataWithBytes:length:", &v13, 32);
    objc_msgSend(a1, "sshPrivateKeyFromED25519PrivateKey:publicKey:comment:", v8, v7, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "sshPublicKeyFromED25519Data:", v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v6 = 0;
    if (v9 && v10)
      v6 = -[WFSSHKeyPair initWithFormat:privateKeyData:publicKeyData:keySize:comment:]([WFSSHKeyPair alloc], "initWithFormat:privateKeyData:publicKeyData:keySize:comment:", a1, v9, v10, 0, v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)localizedDisplayName
{
  return WFLocalizedString(CFSTR("ed25519"));
}

+ (id)possibleKeySizes
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)defaultKeySize
{
  return 0;
}

+ (id)privateKeyType
{
  return CFSTR("OPENSSH PRIVATE KEY");
}

+ (id)publicKeyType
{
  return CFSTR("ssh-ed25519");
}

+ (id)privateKeySpecifier
{
  return CFSTR("id_ed25519");
}

+ (id)publicKeySpecifier
{
  return CFSTR("id_ed25519.pub");
}

+ (id)keyPairFromPrivateKey:(id)a3 comment:(id)a4 error:(id *)a5
{
  id v7;
  WFSSHKeyDecoder *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  WFSSHKeyPair *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void **v25;
  uint64_t *v26;
  void *v27;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = -[WFSSHKeyDecoder initWithData:]([WFSSHKeyDecoder alloc], "initWithData:", v7);
  -[WFSSHKeyDecoder decodeStringWithLength:](v8, "decodeStringWithLength:", objc_msgSend(CFSTR("openssh-key-v1"), "length"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("openssh-key-v1")) & 1) != 0)
  {
    -[WFSSHKeyDecoder advanceBy:](v8, "advanceBy:", 1);
    -[WFSSHKeyDecoder decodeStringWithPrecedingLength](v8, "decodeStringWithPrecedingLength");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSSHKeyDecoder decodeStringWithPrecedingLength](v8, "decodeStringWithPrecedingLength");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSSHKeyDecoder decodeDataWithPrecedingLength](v8, "decodeDataWithPrecedingLength");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("none")) & 1) != 0)
    {
      if (-[WFSSHKeyDecoder decodeInteger](v8, "decodeInteger") == 1)
      {
        -[WFSSHKeyDecoder advanceBy:](v8, "advanceBy:", -[WFSSHKeyDecoder decodeInteger](v8, "decodeInteger"));
        -[WFSSHKeyDecoder decodeInteger](v8, "decodeInteger");
        v13 = -[WFSSHKeyDecoder decodeInteger](v8, "decodeInteger");
        if (v13 == -[WFSSHKeyDecoder decodeInteger](v8, "decodeInteger"))
        {
          -[WFSSHKeyDecoder decodeStringWithPrecedingLength](v8, "decodeStringWithPrecedingLength");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "publicKeyType");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "isEqualToString:", v15);

          if (v16)
          {
            -[WFSSHKeyDecoder decodeDataWithPrecedingLength](v8, "decodeDataWithPrecedingLength");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFSSHKeyDecoder decodeDataWithPrecedingLength](v8, "decodeDataWithPrecedingLength");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFSSHKeyDecoder decodeStringWithPrecedingLength](v8, "decodeStringWithPrecedingLength");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v17, "length") == 32)
            {
              v29 = v18;
              objc_msgSend(a1, "sshPublicKeyFromED25519Data:", v17);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (v19)
                v20 = -[WFSSHKeyPair initWithFormat:privateKeyData:publicKeyData:keySize:comment:]([WFSSHKeyPair alloc], "initWithFormat:privateKeyData:publicKeyData:keySize:comment:", a1, v7, v19, 0, v30);
              else
                v20 = 0;

              v18 = v29;
            }
            else
            {
              v20 = 0;
            }

          }
          else
          {
            v20 = 0;
          }

          goto LABEL_18;
        }
LABEL_17:
        v20 = 0;
LABEL_18:

        goto LABEL_19;
      }
      if (!a5)
        goto LABEL_17;
      v22 = (void *)MEMORY[0x24BDD1540];
      v31 = *MEMORY[0x24BDD0FC8];
      WFLocalizedString(CFSTR("Multiple keys are not supported."));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v23;
      v24 = (void *)MEMORY[0x24BDBCE70];
      v25 = &v32;
      v26 = &v31;
    }
    else
    {
      if (!a5)
        goto LABEL_17;
      v22 = (void *)MEMORY[0x24BDD1540];
      v33 = *MEMORY[0x24BDD0FC8];
      WFLocalizedString(CFSTR("Encrypted SSH keys are not currently supported."));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v23;
      v24 = (void *)MEMORY[0x24BDBCE70];
      v25 = &v34;
      v26 = &v33;
    }
    objc_msgSend(v24, "dictionaryWithObjects:forKeys:count:", v25, v26, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("WFSSHKeyED25519ErrorDomain"), 1, v27);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_17;
  }
  if (a5)
  {
    v21 = (void *)MEMORY[0x24BDD1540];
    v35 = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("Unable to parse magic bytes from OpenSSH key."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("WFSSHKeyED25519ErrorDomain"), 1, v11);
    v20 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

    goto LABEL_20;
  }
  v20 = 0;
LABEL_20:

  return v20;
}

+ (id)sshPublicKeyFromED25519Data:(id)a3
{
  id v4;
  WFSSHKeyEncoder *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init(WFSSHKeyEncoder);
  -[WFSSHKeyEncoder encodeInteger:](v5, "encodeInteger:", 11);
  objc_msgSend(a1, "publicKeyType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSSHKeyEncoder encodeString:](v5, "encodeString:", v6);

  -[WFSSHKeyEncoder encodeDataWithPreceedingLength:](v5, "encodeDataWithPreceedingLength:", v4);
  -[WFSSHKeyEncoder encodedData](v5, "encodedData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)sshPrivateKeyFromED25519PrivateKey:(id)a3 publicKey:(id)a4 comment:(id)a5
{
  id v8;
  id v9;
  id v10;
  WFSSHKeyEncoder *v11;
  void *v12;
  void *v13;
  WFSSHKeyEncoder *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(WFSSHKeyEncoder);
  -[WFSSHKeyEncoder encodeString:](v11, "encodeString:", CFSTR("openssh-key-v1"));
  -[WFSSHKeyEncoder encodeChar:](v11, "encodeChar:", 0);
  -[WFSSHKeyEncoder encodeStringWithPreceedingLength:](v11, "encodeStringWithPreceedingLength:", CFSTR("none"));
  -[WFSSHKeyEncoder encodeStringWithPreceedingLength:](v11, "encodeStringWithPreceedingLength:", CFSTR("none"));
  v12 = (void *)objc_opt_new();
  -[WFSSHKeyEncoder encodeDataWithPreceedingLength:](v11, "encodeDataWithPreceedingLength:", v12);

  -[WFSSHKeyEncoder encodeInteger:](v11, "encodeInteger:", 1);
  objc_msgSend(a1, "sshPublicKeyFromED25519Data:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[WFSSHKeyEncoder encodeDataWithPreceedingLength:](v11, "encodeDataWithPreceedingLength:", v13);
    v14 = objc_alloc_init(WFSSHKeyEncoder);
    v15 = arc4random_uniform(0xFFFFFFFF);
    -[WFSSHKeyEncoder encodeInteger:](v14, "encodeInteger:", v15);
    -[WFSSHKeyEncoder encodeInteger:](v14, "encodeInteger:", v15);
    objc_msgSend(a1, "publicKeyType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSSHKeyEncoder encodeStringWithPreceedingLength:](v14, "encodeStringWithPreceedingLength:", v16);

    -[WFSSHKeyEncoder encodeDataWithPreceedingLength:](v14, "encodeDataWithPreceedingLength:", v9);
    -[WFSSHKeyEncoder encodeInteger:](v14, "encodeInteger:", objc_msgSend(v9, "length") + objc_msgSend(v8, "length"));
    -[WFSSHKeyEncoder encodeData:](v14, "encodeData:", v8);
    -[WFSSHKeyEncoder encodeData:](v14, "encodeData:", v9);
    -[WFSSHKeyEncoder encodeStringWithPreceedingLength:](v14, "encodeStringWithPreceedingLength:", v10);
    v17 = -(-[WFSSHKeyEncoder encodedLength](v14, "encodedLength") & 7);
    v18 = -8;
    do
      -[WFSSHKeyEncoder encodeChar:](v14, "encodeChar:", (char)(v18++ + 9));
    while (v17 != v18);
    -[WFSSHKeyEncoder encodedData](v14, "encodedData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSSHKeyEncoder encodeDataWithPreceedingLength:](v11, "encodeDataWithPreceedingLength:", v19);

    -[WFSSHKeyEncoder encodedData](v11, "encodedData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

@end
