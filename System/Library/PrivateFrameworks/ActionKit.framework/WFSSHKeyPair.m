@implementation WFSSHKeyPair

- (WFSSHKeyPair)initWithFormat:(Class)a3 privateKeyData:(id)a4 publicKeyData:(id)a5 keySize:(id)a6 comment:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  int v18;
  WFSSHKeyPair *v19;
  NSData *v20;
  NSData *privateKeyData;
  NSData *v22;
  NSData *publicKeyData;
  NSString *v24;
  NSString *comment;
  WFSSHKeyPair *v26;
  void *v28;
  void *v29;
  void *v30;
  objc_super v31;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (a3)
  {
    if (v13)
      goto LABEL_3;
LABEL_10:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSSHKeyPair.m"), 121, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("privateKeyData"));

    if (v14)
      goto LABEL_4;
LABEL_11:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSSHKeyPair.m"), 122, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("publicKeyData"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSSHKeyPair.m"), 120, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("format"));

  if (!v13)
    goto LABEL_10;
LABEL_3:
  if (!v14)
    goto LABEL_11;
LABEL_4:
  +[WFSSHKeyPair keyFormats](WFSSHKeyPair, "keyFormats");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "containsObject:", a3);

  if (v18
    && (v31.receiver = self,
        v31.super_class = (Class)WFSSHKeyPair,
        v19 = -[WFSSHKeyPair init](&v31, sel_init),
        (self = v19) != 0))
  {
    objc_storeStrong((id *)&v19->_format, a3);
    v20 = (NSData *)objc_msgSend(v13, "copy");
    privateKeyData = self->_privateKeyData;
    self->_privateKeyData = v20;

    v22 = (NSData *)objc_msgSend(v14, "copy");
    publicKeyData = self->_publicKeyData;
    self->_publicKeyData = v22;

    objc_storeStrong((id *)&self->_keySize, a6);
    v24 = (NSString *)objc_msgSend(v16, "copy");
    comment = self->_comment;
    self->_comment = v24;

    self = self;
    v26 = self;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (WFSSHKeyPair)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  Class v10;
  WFSSHKeyPair *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("format"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("privateKeyData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publicKeyData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keySize"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("comment"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = NSClassFromString(v5);
  v11 = 0;
  if (v6 && v10 && !v7)
  {
    self = -[WFSSHKeyPair initWithFormat:privateKeyData:publicKeyData:keySize:comment:](self, "initWithFormat:privateKeyData:publicKeyData:keySize:comment:", v10, v6, 0, v8, v9);
    v11 = self;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("format"));

  -[WFSSHKeyPair privateKeyData](self, "privateKeyData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("privateKeyData"));

  -[WFSSHKeyPair publicKeyData](self, "publicKeyData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("publicKeyData"));

  -[WFSSHKeyPair keySize](self, "keySize");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("keySize"));

  -[WFSSHKeyPair comment](self, "comment");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("comment"));

}

- (id)privateKeyPEM
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  -[WFSSHKeyPair privateKeyData](self, "privateKeyData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setData:", v4);

  -[objc_class privateKeyType](-[WFSSHKeyPair format](self, "format"), "privateKeyType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setType:", v5);

  objc_msgSend(v3, "encodedPEM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)publicKey
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[objc_class publicKeyType](-[WFSSHKeyPair format](self, "format"), "publicKeyType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[WFSSHKeyPair publicKeyData](self, "publicKeyData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSSHKeyPair comment](self, "comment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ %@ %@"), v3, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)localizedType
{
  return (NSString *)-[objc_class localizedDisplayName](-[WFSSHKeyPair format](self, "format"), "localizedDisplayName");
}

- (NSString)localizedDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[WFSSHKeyPair keySize](self, "keySize");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x24BDD17C8];
  if (v3)
  {
    WFLocalizedString(CFSTR("%@-bit %@ Key"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSSHKeyPair keySize](self, "keySize");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSSHKeyPair localizedType](self, "localizedType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    WFLocalizedString(CFSTR("%@ Key"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSSHKeyPair localizedType](self, "localizedType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v8;
}

- (id)publicKeyFingerprintWithType:(unint64_t)a3
{
  void *v3;
  id v5;
  const void *v6;
  void *v7;
  void *v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  id v12;
  const void *v13;
  void *v14;
  unsigned __int8 v16[16];
  unsigned __int8 v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (a3 == 1)
  {
    -[WFSSHKeyPair publicKeyData](self, "publicKeyData");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = (const void *)objc_msgSend(v12, "bytes");
    -[WFSSHKeyPair publicKeyData](self, "publicKeyData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    CC_SHA256(v13, objc_msgSend(v14, "length"), v16);

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v16, 32);
    objc_msgSend(v8, "base64EncodedStringWithOptions:", 0);
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v3 = (void *)v11;

    return v3;
  }
  if (!a3)
  {
    -[WFSSHKeyPair publicKeyData](self, "publicKeyData");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = (const void *)objc_msgSend(v5, "bytes");
    -[WFSSHKeyPair publicKeyData](self, "publicKeyData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CC_MD5(v6, objc_msgSend(v7, "length"), v17);

    v8 = (void *)objc_opt_new();
    for (i = 0; i != 16; ++i)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02x"), v17[i]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v10);

    }
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(":"));
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  return v3;
}

- (NSNumber)keySize
{
  return self->_keySize;
}

- (NSString)comment
{
  return self->_comment;
}

- (NSData)privateKeyData
{
  return self->_privateKeyData;
}

- (NSData)publicKeyData
{
  return self->_publicKeyData;
}

- (Class)format
{
  return self->_format;
}

- (void)setFormat:(Class)a3
{
  objc_storeStrong((id *)&self->_format, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_publicKeyData, 0);
  objc_storeStrong((id *)&self->_privateKeyData, 0);
  objc_storeStrong((id *)&self->_comment, 0);
  objc_storeStrong((id *)&self->_keySize, 0);
}

+ (id)keyFormats
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (WFSSHKeyPair)sharedKeyPair
{
  void *v3;
  WFKeychain *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  int v20;
  int v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  WFKeychain *v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)_sharedKeyPair;
  if (!_sharedKeyPair)
  {
    v4 = -[WFKeychain initWithService:]([WFKeychain alloc], "initWithService:", CFSTR("com.apple.shortcuts.ssh"));
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    objc_msgSend(a1, "keyFormats");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v45;
      v36 = v5;
      v37 = a1;
      v39 = *(_QWORD *)v45;
      v35 = v4;
      do
      {
        v9 = 0;
        v40 = v7;
        do
        {
          if (*(_QWORD *)v45 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v9);
          objc_msgSend(v10, "privateKeySpecifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFKeychain dataForKey:](v4, "dataForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "publicKeySpecifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFKeychain dataForKey:](v4, "dataForKey:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
            v15 = v14 == 0;
          else
            v15 = 1;
          if (v15)
          {

          }
          else
          {
            v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
            v17 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v14, 4);
            v18 = (void *)v17;
            if (v16)
              v19 = v17 == 0;
            else
              v19 = 1;
            if (v19)
            {
              v20 = 3;
            }
            else
            {
              v42 = 0;
              v43 = 0;
              v41 = 0;
              v21 = objc_msgSend(a1, "parsePublicKey:type:data:comment:", v17, &v43, &v42, &v41);
              v22 = v43;
              v38 = v42;
              v23 = v41;
              v24 = v23;
              if (v21)
              {
                +[WFPEMEncoding decodePEM:error:](WFPEMEncoding, "decodePEM:error:", v16, 0);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = v25;
                if (v25)
                {
                  objc_msgSend(v25, "data");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "keyPairFromPrivateKey:comment:error:", v27, v24, 0);
                  v28 = objc_claimAutoreleasedReturnValue();
                  v29 = (void *)_sharedKeyPair;
                  _sharedKeyPair = v28;

                  v20 = 2;
                }
                else
                {
                  v20 = 3;
                }
                v30 = v38;

              }
              else
              {
                v20 = 3;
                v30 = v38;
              }

              v5 = v36;
              a1 = v37;
              v4 = v35;
            }

            v8 = v39;
            v7 = v40;
            if (v20 != 3)
              goto LABEL_29;
          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      }
      while (v7);
    }
LABEL_29:

    if (!_sharedKeyPair)
    {
      objc_msgSend(a1, "defaultKeyComment");
      v31 = a1;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFSSHKeyFormatED25519 generateKeyPairWithKeySize:comment:](WFSSHKeyFormatED25519, "generateKeyPairWithKeySize:comment:", 0, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setSharedKeyPair:", v33);

    }
    v3 = (void *)_sharedKeyPair;
  }
  return (WFSSHKeyPair *)v3;
}

+ (void)setSharedKeyPair:(id)a3
{
  id v4;
  WFKeychain *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[WFKeychain initWithService:]([WFKeychain alloc], "initWithService:", CFSTR("com.apple.shortcuts.ssh"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(a1, "keyFormats", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v10);
        if ((void *)objc_msgSend(v4, "format") == v11)
        {
          objc_msgSend(v4, "privateKeyPEM");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "dataUsingEncoding:", 4);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "privateKeySpecifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFKeychain setData:forKey:](v5, "setData:forKey:", v15, v16);

          objc_msgSend(v4, "publicKey");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "dataUsingEncoding:", 4);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "publicKeySpecifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFKeychain setData:forKey:](v5, "setData:forKey:", v17, v18);

        }
        else
        {
          objc_msgSend(v11, "privateKeySpecifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFKeychain setData:forKey:](v5, "setData:forKey:", 0, v12);

          objc_msgSend(v11, "publicKeySpecifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFKeychain setData:forKey:](v5, "setData:forKey:", 0, v13);
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  v19 = (void *)_sharedKeyPair;
  _sharedKeyPair = (uint64_t)v4;

}

+ (NSURL)knownHostFileURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCF48], "wf_shortcutsDirectoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("ssh"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "wf_fileExists") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v3, 1, 0, 0);

  }
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("known_hosts"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v5;
}

+ (NSString)defaultKeyComment
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  WFLocalizedString(CFSTR("Shortcuts on %@"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (id)keyPairFromPrivateKey:(id)a3 comment:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  +[WFPEMEncoding decodePEM:error:](WFPEMEncoding, "decodePEM:error:", a3, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(a1, "keyFormats");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v11)
    {
      v12 = v11;
      v22 = v8;
      v13 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v9, "type");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "privateKeyType");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "isEqualToString:", v17);

          if ((v18 & 1) != 0)
          {
            objc_msgSend(v9, "data");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = v22;
            objc_msgSend(v15, "keyPairFromPrivateKey:comment:error:", v20, v22, a5);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_14;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v12)
          continue;
        break;
      }
      v19 = 0;
      v8 = v22;
    }
    else
    {
      v19 = 0;
    }
LABEL_14:

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)parsePublicKey:(id)a3 type:(id *)a4 data:(id *)a5 comment:(id *)a6
{
  void *v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  id v16;

  objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "scanUpToString:intoString:", CFSTR(" "), a4))
  {
    v16 = 0;
    v10 = objc_msgSend(v9, "scanUpToString:intoString:", CFSTR(" "), &v16);
    v11 = v16;
    if (v10)
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v11, 0);
      v13 = v12;
      if (v12)
      {
        if (a5)
          *a5 = objc_retainAutorelease(v12);
        v14 = objc_msgSend(v9, "scanUpToString:intoString:", CFSTR("\n"), a6);
      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
