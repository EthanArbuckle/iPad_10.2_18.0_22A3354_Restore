@implementation ECDKIMPublicKey

- (ECDKIMPublicKey)initWithVersion:(id)a3 hashingAlgorithm:(unint64_t)a4 signingAlgorithm:(unint64_t)a5 notes:(id)a6 publicKeyData:(id)a7 serviceType:(id)a8 flags:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  ECDKIMPublicKey *v20;
  uint64_t v21;
  NSString *version;
  uint64_t v23;
  NSString *notes;
  uint64_t v25;
  NSData *publicKeyData;
  uint64_t v27;
  NSString *serviceType;
  uint64_t v29;
  NSString *flags;
  objc_super v32;

  v15 = a3;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v32.receiver = self;
  v32.super_class = (Class)ECDKIMPublicKey;
  v20 = -[ECDKIMPublicKey init](&v32, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v15, "copy");
    version = v20->_version;
    v20->_version = (NSString *)v21;

    v20->_hashingAlgorithm = a4;
    v20->_signingAlgorithm = a5;
    v23 = objc_msgSend(v16, "copy");
    notes = v20->_notes;
    v20->_notes = (NSString *)v23;

    v25 = objc_msgSend(v17, "copy");
    publicKeyData = v20->_publicKeyData;
    v20->_publicKeyData = (NSData *)v25;

    v27 = objc_msgSend(v18, "copy");
    serviceType = v20->_serviceType;
    v20->_serviceType = (NSString *)v27;

    v29 = objc_msgSend(v19, "copy");
    flags = v20->_flags;
    v20->_flags = (NSString *)v29;

  }
  return 0;
}

- (ECDKIMPublicKey)initWithKeyValueDictionary:(id)a3
{
  id v4;
  ECDKIMPublicKey *v5;
  ECDKIMPublicKey *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ECDKIMPublicKey;
  v5 = -[ECDKIMPublicKey init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[ECDKIMPublicKey _parseVersionFromDictionary:](v5, "_parseVersionFromDictionary:", v4);
    -[ECDKIMPublicKey _parseAcceptableHashingAlgorithmsFromDictionary:](v6, "_parseAcceptableHashingAlgorithmsFromDictionary:", v4);
    -[ECDKIMPublicKey _parseSigningAlgorithmFromDictionary:](v6, "_parseSigningAlgorithmFromDictionary:", v4);
    -[ECDKIMPublicKey _parseNotesFromDictionary:](v6, "_parseNotesFromDictionary:", v4);
    -[ECDKIMPublicKey _parsePublicKeyDataFromDictionary:](v6, "_parsePublicKeyDataFromDictionary:", v4);
    -[ECDKIMPublicKey _parseServiceTypeFromDictionary:](v6, "_parseServiceTypeFromDictionary:", v4);
    -[ECDKIMPublicKey _parseFlagsFromDictionary:](v6, "_parseFlagsFromDictionary:", v4);
  }

  return v6;
}

- (ECDKIMPublicKey)initWithRecord:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ECDKIMPublicKey *v13;
  void *v16;
  void *v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(";"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v16;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v20;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v20 != v4)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v5), "ef_componentsSeparatedByString:maxSeparations:", CFSTR("="), 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "count") == 2)
        {
          objc_msgSend(v6, "firstObject");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "lastObject");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "setObject:forKeyedSubscript:", v12, v9);
        }

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v3);
  }

  v13 = -[ECDKIMPublicKey initWithKeyValueDictionary:](self, "initWithKeyValueDictionary:", v17);
  return v13;
}

- (id)description
{
  void *v3;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "appendFormat:", CFSTR("\nDKIM PUBLIC KEY:\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("Version:                 %@\n"), self->_version);
  objc_msgSend(v3, "appendFormat:", CFSTR("Hashing Algorithms:      %lu\n"), self->_hashingAlgorithm);
  objc_msgSend(v3, "appendFormat:", CFSTR("Signing Algorithm:       %lu\n"), self->_signingAlgorithm);
  objc_msgSend(v3, "appendFormat:", CFSTR("Public Key:              %@\n"), self->_publicKeyData);
  return v3;
}

- (void)_parseVersionFromDictionary:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("v"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "isEqualToString:", CFSTR("DKIM1")) & 1) != 0)
    objc_storeStrong((id *)&self->_version, v5);

}

- (void)_parseAcceptableHashingAlgorithmsFromDictionary:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("h"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v4;
  if (v4)
  {
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(":"));
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (!v6)
      goto LABEL_14;
    v7 = *(_QWORD *)v15;
    while (1)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v11, "isEqualToString:", CFSTR("sha1")) & 1) != 0)
        {
          v12 = 0;
        }
        else
        {
          if (!objc_msgSend(v11, "isEqualToString:", CFSTR("sha256")))
            goto LABEL_12;
          v12 = 1;
        }
        self->_hashingAlgorithm = v12;
LABEL_12:

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (!v6)
      {
LABEL_14:

        v4 = v13;
        break;
      }
    }
  }

}

- (void)_parseSigningAlgorithmFromDictionary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;

  self->_signingAlgorithm = 0;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("k"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v8 = v4;
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("rsa")) & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      if (!objc_msgSend(v6, "isEqualToString:", CFSTR("ed25519")))
      {
LABEL_7:

        v4 = v8;
        goto LABEL_8;
      }
      v7 = 1;
    }
    self->_signingAlgorithm = v7;
    goto LABEL_7;
  }
LABEL_8:

}

- (void)_parseNotesFromDictionary:(id)a3
{
  void *v4;
  void *v5;
  NSString *v6;
  NSString *notes;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("n"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    notes = self->_notes;
    self->_notes = v6;

  }
}

- (void)_parsePublicKeyDataFromDictionary:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("p"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v4, 1);
    if (v5)
      objc_storeStrong((id *)&self->_publicKeyData, v5);

  }
}

- (void)_parseServiceTypeFromDictionary:(id)a3
{
  void *v4;
  void *v5;
  NSString *v6;
  NSString *serviceType;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("s"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    serviceType = self->_serviceType;
    self->_serviceType = v6;

  }
}

- (void)_parseFlagsFromDictionary:(id)a3
{
  void *v4;
  void *v5;
  NSString *v6;
  NSString *flags;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("t"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    flags = self->_flags;
    self->_flags = v6;

  }
}

- (NSString)version
{
  return self->_version;
}

- (unint64_t)hashingAlgorithm
{
  return self->_hashingAlgorithm;
}

- (unint64_t)signingAlgorithm
{
  return self->_signingAlgorithm;
}

- (NSString)notes
{
  return self->_notes;
}

- (NSData)publicKeyData
{
  return self->_publicKeyData;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (NSString)flags
{
  return self->_flags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flags, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_publicKeyData, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

@end
