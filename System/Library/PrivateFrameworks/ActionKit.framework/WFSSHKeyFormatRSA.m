@implementation WFSSHKeyFormatRSA

+ (id)generateKeyPairWithKeySize:(unint64_t)a3 comment:(id)a4
{
  id v6;
  WFSSHKeyPair *v7;
  void *v8;
  void *v9;
  WFSSHKeyPair *v10;
  void *v11;

  v6 = a4;
  v7 = 0;
  if (!CCRSACryptorGeneratePair())
  {
    objc_msgSend(a1, "pkcs1FromRSAKey:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "sshPublicKeyFromRSAKey:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    if (v8 && v9)
    {
      v10 = [WFSSHKeyPair alloc];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[WFSSHKeyPair initWithFormat:privateKeyData:publicKeyData:keySize:comment:](v10, "initWithFormat:privateKeyData:publicKeyData:keySize:comment:", a1, v8, v9, v11, v6);

    }
  }

  return v7;
}

+ (id)localizedDisplayName
{
  return WFLocalizedString(CFSTR("RSA"));
}

+ (id)possibleKeySizes
{
  return &unk_24F93C588;
}

+ (id)defaultKeySize
{
  return &unk_24F93B000;
}

+ (id)privateKeyType
{
  return CFSTR("RSA PRIVATE KEY");
}

+ (id)publicKeyType
{
  return CFSTR("ssh-rsa");
}

+ (id)privateKeySpecifier
{
  return CFSTR("id_rsa");
}

+ (id)publicKeySpecifier
{
  return CFSTR("id_rsa.pub");
}

+ (id)keyPairFromPrivateKey:(id)a3 comment:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  WFSSHKeyPair *v14;
  uint64_t PublicKeyFromPrivateKey;
  uint64_t v16;
  WFSSHKeyPair *v17;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = objc_retainAutorelease(v8);
  objc_msgSend(v10, "bytes");
  objc_msgSend(v10, "length");
  if (CCRSACryptorImport())
  {
    if (!a5)
    {
      v14 = 0;
      goto LABEL_11;
    }
    v11 = (void *)MEMORY[0x24BDD1540];
    v19 = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("Private key is not a valid RSA private key."));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("WFSSHKeyRSAErrorDomain"), 2, v13);
    v14 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PublicKeyFromPrivateKey = CCRSACryptorCreatePublicKeyFromPrivateKey();
    objc_msgSend(a1, "sshPublicKeyFromRSAKey:", PublicKeyFromPrivateKey);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = CCRSAGetKeySize();
    if (PublicKeyFromPrivateKey)
      MEMORY[0x22E3140FC](PublicKeyFromPrivateKey);
    if (!v12)
    {
      v14 = 0;
      goto LABEL_9;
    }
    v17 = [WFSSHKeyPair alloc];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[WFSSHKeyPair initWithFormat:privateKeyData:publicKeyData:keySize:comment:](v17, "initWithFormat:privateKeyData:publicKeyData:keySize:comment:", a1, v10, v12, v13, v9);
  }

LABEL_9:
LABEL_11:

  return v14;
}

+ (id)pkcs1FromRSAKey:(_CCRSACryptor *)a3
{
  uint64_t v4;
  _BYTE v5[8192];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (CCRSACryptorExport())
    return 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v5, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)sshPublicKeyFromRSAKey:(_CCRSACryptor *)a3
{
  int v4;
  int v5;
  char *v6;
  WFSSHKeyEncoder *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = CCRSAGetKeySize();
  v5 = v4 + 7;
  if (v4 < -7)
    v5 = v4 + 14;
  v16 = (uint64_t)v5 >> 3;
  v17 = v16;
  v6 = (char *)&v15 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  CCRSAGetKeyComponents();
  v7 = objc_alloc_init(WFSSHKeyEncoder);
  -[WFSSHKeyEncoder encodeInteger:](v7, "encodeInteger:", 7);
  objc_msgSend(a1, "publicKeyType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSSHKeyEncoder encodeString:](v7, "encodeString:", v8);

  if (*v6 < 0)
  {
    -[WFSSHKeyEncoder encodeInteger:](v7, "encodeInteger:", (v16 + 1));
    -[WFSSHKeyEncoder encodeChar:](v7, "encodeChar:", 0);
  }
  else
  {
    -[WFSSHKeyEncoder encodeInteger:](v7, "encodeInteger:", v16);
  }
  v9 = objc_alloc(MEMORY[0x24BDBCE50]);
  v10 = (void *)objc_msgSend(v9, "initWithBytes:length:", v6, v16);
  -[WFSSHKeyEncoder encodeData:](v7, "encodeData:", v10);

  if (*v6 < 0)
  {
    -[WFSSHKeyEncoder encodeInteger:](v7, "encodeInteger:", (v17 + 1));
    -[WFSSHKeyEncoder encodeChar:](v7, "encodeChar:", 0);
  }
  else
  {
    -[WFSSHKeyEncoder encodeInteger:](v7, "encodeInteger:", v17);
  }
  v11 = objc_alloc(MEMORY[0x24BDBCE50]);
  v12 = (void *)objc_msgSend(v11, "initWithBytes:length:", v6, v17);
  -[WFSSHKeyEncoder encodeData:](v7, "encodeData:", v12);

  -[WFSSHKeyEncoder encodedData](v7, "encodedData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
