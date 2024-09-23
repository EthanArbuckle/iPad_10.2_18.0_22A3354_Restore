@implementation NTKArgonKeyDescriptor

- (NTKArgonKeyDescriptor)initWithKey:(id)a3 fileName:(id)a4
{
  id v6;
  id v7;
  NTKArgonKeyDescriptor *v8;
  uint64_t v9;
  NSString *key;
  uint64_t v11;
  NSString *fileName;
  NTKArgonKeyDescriptor *v13;
  NSObject *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length") && objc_msgSend(v7, "length"))
  {
    v16.receiver = self;
    v16.super_class = (Class)NTKArgonKeyDescriptor;
    v8 = -[NTKArgonKeyDescriptor init](&v16, sel_init);
    if (v8)
    {
      v9 = objc_msgSend(v6, "copy");
      key = v8->_key;
      v8->_key = (NSString *)v9;

      v11 = objc_msgSend(v7, "copy");
      fileName = v8->_fileName;
      v8->_fileName = (NSString *)v11;

    }
    self = v8;
    v13 = self;
  }
  else
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[NTKArgonKeyDescriptor initWithKey:fileName:].cold.1();

    v13 = 0;
  }

  return v13;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKArgonKeyDescriptor key](self, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKArgonKeyDescriptor fileName](self, "fileName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, %@ | %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[NTKArgonKeyDescriptor key](self, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[NTKArgonKeyDescriptor fileName](self, "fileName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ (4 * objc_msgSend(v5, "hash"));

  return v6;
}

- (NSString)fileName
{
  return self->_fileName;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NTKArgonKeyDescriptor key](self, "key");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "key");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v6 || objc_msgSend(v5, "isEqual:", v6))
    {
      -[NTKArgonKeyDescriptor fileName](self, "fileName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "fileName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == v8)
        v9 = 1;
      else
        v9 = objc_msgSend(v7, "isEqual:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)key
{
  return self->_key;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

+ (id)keyDescriptorFromBundle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;

  v4 = a3;
  v5 = v4;
  if (v4
    && (objc_msgSend(v4, "bundlePath"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "pathComponents"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "containsObject:", CFSTR("AppleInternal")),
        v7,
        v6,
        (v8 & 1) == 0))
  {
    objc_msgSend(a1, "unfilteredKeyDescriptorFromBundle:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)unfilteredKeyDescriptorFromBundle:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NTKArgonKeyDescriptor *v7;

  if (a3)
  {
    objc_msgSend(a3, "infoDictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("Argon"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("FileName"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v4, "objectForKey:", CFSTR("Key"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v7 = -[NTKArgonKeyDescriptor initWithKey:fileName:]([NTKArgonKeyDescriptor alloc], "initWithKey:fileName:", v6, v5);
        else
          v7 = 0;

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[NTKArgonKeyDescriptor key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("key"));

  -[NTKArgonKeyDescriptor fileName](self, "fileName");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("fileName"));

}

- (NTKArgonKeyDescriptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NTKArgonKeyDescriptor *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[NTKArgonKeyDescriptor initWithKey:fileName:](self, "initWithKey:fileName:", v5, v6);
  return v7;
}

- (NSDictionary)argon_JSONRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKArgonKeyDescriptor key](self, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("k"));

  }
  -[NTKArgonKeyDescriptor fileName](self, "fileName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("n"));

  }
  v10 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v10;
}

- (id)argon_initWithJSONRepresentation:(id)a3
{
  id v4;
  id v5;
  void (**v6)(void *, const __CFString *);
  void *v7;
  void *v8;
  NTKArgonKeyDescriptor *v9;
  NSObject *v10;
  _QWORD aBlock[4];
  id v13;

  v4 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__NTKArgonKeyDescriptor_argon_initWithJSONRepresentation___block_invoke;
  aBlock[3] = &unk_1E6BD3D90;
  v13 = v4;
  v5 = v4;
  v6 = (void (**)(void *, const __CFString *))_Block_copy(aBlock);
  v6[2](v6, CFSTR("k"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, CFSTR("n"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length") && objc_msgSend(v8, "length"))
  {
    v9 = -[NTKArgonKeyDescriptor initWithKey:fileName:](self, "initWithKey:fileName:", v7, v8);
  }
  else
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[NTKArgonKeyDescriptor argon_initWithJSONRepresentation:].cold.1();

    v9 = 0;
  }

  return v9;
}

id __58__NTKArgonKeyDescriptor_argon_initWithJSONRepresentation___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (void)initWithKey:fileName:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_8(&dword_1B72A3000, v0, v1, "Key descriptor values %@ / %@ invalid");
}

- (void)argon_initWithJSONRepresentation:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_8(&dword_1B72A3000, v0, v1, "JSON init values %@ / %@ invalid");
}

@end
