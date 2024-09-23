@implementation NFTrustKey

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFTrustKey)initWithCoder:(id)a3
{
  id v4;
  NFTrustKey *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NFTrustKey;
  v5 = -[NFTrustObject initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NFTrustKey setValue:forKey:](v5, "setValue:forKey:", v6, CFSTR("identifier"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("counterLimit"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NFTrustKey setValue:forKey:](v5, "setValue:forKey:", v7, CFSTR("counterLimit"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("counterValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NFTrustKey setValue:forKey:](v5, "setValue:forKey:", v8, CFSTR("counterValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyAttestationAuthority"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NFTrustKey setValue:forKey:](v5, "setValue:forKey:", v9, CFSTR("keyAttestationAuthority"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyAttestation"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NFTrustKey setValue:forKey:](v5, "setValue:forKey:", v10, CFSTR("keyAttestation"));

    objc_msgSend(MEMORY[0x1E0DE78C0], "coder:decodeArrayOfArrayOfClass:forKey:", v4, objc_opt_class(), CFSTR("localValidations"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NFTrustKey setValue:forKey:](v5, "setValue:forKey:", v11, CFSTR("localValidations"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[NFTrustKey identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[NFTrustKey counterLimit](self, "counterLimit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("counterLimit"));

  -[NFTrustKey counterValue](self, "counterValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("counterValue"));

  -[NFTrustKey keyAttestationAuthority](self, "keyAttestationAuthority");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("keyAttestationAuthority"));

  -[NFTrustKey keyAttestation](self, "keyAttestation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("keyAttestation"));

  -[NFTrustKey localValidations](self, "localValidations");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("localValidations"));

}

- (NSData)publicKey
{
  NSData *publicKey;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  publicKey = self->_publicKey;
  if (!publicKey)
  {
    v4 = (void *)MEMORY[0x1E0DE78E8];
    v5 = (void *)MEMORY[0x1E0C99D50];
    -[NFTrustKey keyAttestation](self, "keyAttestation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "NF_dataWithHexString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "TLVWithData:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v20 = v8;
    objc_msgSend(v8, "children");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v14, "tag") == 32585)
          {
            v15 = (void *)MEMORY[0x1E0DE78E8];
            objc_msgSend(v14, "value");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "TLVWithData:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v17, "value");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[NFTrustKey setPublicKey:](self, "setPublicKey:", v18);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v11);
    }

    publicKey = self->_publicKey;
  }
  return publicKey;
}

+ (id)keyWithIdentifier:(id)a3
{
  id v5;
  NFTrustKey *v6;
  NFTrustKey *v7;
  const void **v8;
  uint64_t Logger;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  const char *Name;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = [NFTrustKey alloc];
    v7 = v6;
    if (v6)
      -[NFTrustKey setIdentifier:](v6, "setIdentifier:", v5);
  }
  else
  {
    v8 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      v14 = 45;
      if (isMetaClass)
        v14 = 43;
      v10(3, "%c[%{public}s %{public}s]:%i Could not create NFTrustKey with null identifier", v14, ClassName, Name, 220);
    }
    dispatch_get_specific(*v8);
    NFSharedLogGetLogger();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = object_getClass(a1);
      if (class_isMetaClass(v16))
        v17 = 43;
      else
        v17 = 45;
      *(_DWORD *)buf = 67109890;
      v21 = v17;
      v22 = 2082;
      v23 = object_getClassName(a1);
      v24 = 2082;
      v25 = sel_getName(a2);
      v26 = 1024;
      v27 = 220;
      _os_log_impl(&dword_19B5EB000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Could not create NFTrustKey with null identifier", buf, 0x22u);
    }

    v7 = 0;
  }

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)setPublicKey:(id)a3
{
  objc_storeStrong((id *)&self->_publicKey, a3);
}

- (NSString)keyAttestationAuthority
{
  return self->_keyAttestationAuthority;
}

- (void)setKeyAttestationAuthority:(id)a3
{
  objc_storeStrong((id *)&self->_keyAttestationAuthority, a3);
}

- (NSString)keyAttestation
{
  return self->_keyAttestation;
}

- (void)setKeyAttestation:(id)a3
{
  objc_storeStrong((id *)&self->_keyAttestation, a3);
}

- (NSNumber)counterLimit
{
  return self->_counterLimit;
}

- (void)setCounterLimit:(id)a3
{
  objc_storeStrong((id *)&self->_counterLimit, a3);
}

- (NSNumber)counterValue
{
  return self->_counterValue;
}

- (void)setCounterValue:(id)a3
{
  objc_storeStrong((id *)&self->_counterValue, a3);
}

- (NSArray)localValidations
{
  return self->_localValidations;
}

- (void)setLocalValidations:(id)a3
{
  objc_storeStrong((id *)&self->_localValidations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localValidations, 0);
  objc_storeStrong((id *)&self->_counterValue, 0);
  objc_storeStrong((id *)&self->_counterLimit, 0);
  objc_storeStrong((id *)&self->_keyAttestation, 0);
  objc_storeStrong((id *)&self->_keyAttestationAuthority, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
