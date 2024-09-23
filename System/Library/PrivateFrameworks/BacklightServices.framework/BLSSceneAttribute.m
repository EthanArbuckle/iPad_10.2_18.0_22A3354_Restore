@implementation BLSSceneAttribute

- (BLSSceneAttribute)initWithFBSScene:(id)a3
{
  void *v4;
  BLSSceneAttribute *v5;

  objc_msgSend(a3, "identityToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BLSSceneAttribute initWithSceneIdentityToken:](self, "initWithSceneIdentityToken:", v4);

  return v5;
}

- (BLSSceneAttribute)initWithSceneIdentityToken:(id)a3
{
  id v5;
  BLSSceneAttribute *v6;
  BLSSceneAttribute *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BLSSceneAttribute;
  v6 = -[BLSAttribute init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sceneIdentityToken, a3);

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSSceneIdentityToken stringRepresentation](self->_sceneIdentityToken, "stringRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("identityToken"));

  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendPointer:", objc_opt_class());
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_sceneIdentityToken);
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  BLSSceneAttribute *v4;
  uint64_t v5;
  char v6;
  FBSSceneIdentityToken *sceneIdentityToken;
  void *v8;

  v4 = (BLSSceneAttribute *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (v5 = objc_opt_class(), v5 == objc_opt_class()))
    {
      sceneIdentityToken = self->_sceneIdentityToken;
      -[BLSSceneAttribute sceneIdentityToken](v4, "sceneIdentityToken");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[FBSSceneIdentityToken isEqual:](sceneIdentityToken, "isEqual:", v8);

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (BLSSceneAttribute)initWithXPCDictionary:(id)a3
{
  id v5;
  void *v6;
  BLSSceneAttribute *v7;
  NSObject *v8;
  objc_class *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(CFSTR("identityToken"), "UTF8String");
  v6 = (void *)BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    self = -[BLSSceneAttribute initWithSceneIdentityToken:](self, "initWithSceneIdentityToken:", v6);
    v7 = self;
  }
  else
  {
    bls_assertions_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412802;
      v14 = v6;
      v15 = 2112;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      _os_log_fault_impl(&dword_1B0C75000, v8, OS_LOG_TYPE_FAULT, "%@ not a FBSSceneIdentityToken for [%@ %@]", (uint8_t *)&v13, 0x20u);

    }
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(CFSTR("identityToken"), "UTF8String");
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLSSceneAttribute)initWithCoder:(id)a3
{
  id v5;
  void *v6;
  BLSSceneAttribute *v7;
  NSObject *v8;
  objc_class *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identityToken"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    self = -[BLSSceneAttribute initWithSceneIdentityToken:](self, "initWithSceneIdentityToken:", v6);
    v7 = self;
  }
  else
  {
    bls_assertions_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v5;
      v15 = 2112;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      _os_log_fault_impl(&dword_1B0C75000, v8, OS_LOG_TYPE_FAULT, "invalid FBSSceneIdentityToken from %{public}@ for [%@ %@]", (uint8_t *)&v13, 0x20u);

    }
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_sceneIdentityToken, CFSTR("identityToken"));
}

- (FBSSceneIdentityToken)sceneIdentityToken
{
  return self->_sceneIdentityToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneIdentityToken, 0);
}

@end
