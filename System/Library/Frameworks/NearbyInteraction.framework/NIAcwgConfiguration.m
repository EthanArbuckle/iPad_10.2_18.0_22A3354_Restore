@implementation NIAcwgConfiguration

- (NIAcwgConfiguration)initWithLockIdentifier:(id)a3
{
  id v6;
  id *v7;
  NIAcwgConfiguration *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIAcwgConfiguration.mm"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("lockIdentifier"));

  }
  v11.receiver = self;
  v11.super_class = (Class)NIAcwgConfiguration;
  v7 = -[NIConfiguration initInternal](&v11, sel_initInternal);
  v8 = (NIAcwgConfiguration *)v7;
  if (v7)
  {
    objc_storeStrong(v7 + 6, a3);
    v8->_lockBtConnHandle = -1;
    v8->_configurationTypeInternal = 1;
  }

  return v8;
}

- (NIAcwgConfiguration)initWithConfiguration:(id)a3
{
  id v5;
  NIAcwgConfiguration *v6;
  uint64_t v7;
  NSString *lockIdentifier;
  uint64_t v9;
  NSDictionary *debugOptions;
  void *v12;
  objc_super v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIAcwgConfiguration.mm"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration"));

  }
  v13.receiver = self;
  v13.super_class = (Class)NIAcwgConfiguration;
  v6 = -[NIConfiguration initInternal](&v13, sel_initInternal);
  if (v6)
  {
    objc_msgSend(v5, "lockIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    lockIdentifier = v6->_lockIdentifier;
    v6->_lockIdentifier = (NSString *)v7;

    v6->_lockBtConnHandle = objc_msgSend(v5, "lockBtConnHandle");
    objc_msgSend(v5, "debugOptions");
    v9 = objc_claimAutoreleasedReturnValue();
    debugOptions = v6->_debugOptions;
    v6->_debugOptions = (NSDictionary *)v9;

    v6->_configurationTypeInternal = objc_msgSend(v5, "configurationType");
  }

  return v6;
}

- (int64_t)configurationType
{
  return self->_configurationTypeInternal;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NIAcwgConfiguration;
  v5 = -[NIConfiguration copyWithZone:](&v9, sel_copyWithZone_);
  objc_msgSend(v5, "setLockIdentifier:", self->_lockIdentifier);
  objc_msgSend(v5, "setLockBtConnHandle:", self->_lockBtConnHandle);
  v5[4] = self->_configurationTypeInternal;
  if (self->_debugOptions)
  {
    v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D80], "allocWithZone:", a3), "initWithDictionary:copyItems:", self->_debugOptions, 1);
    v7 = (void *)v5[7];
    v5[7] = v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_lockIdentifier, CFSTR("lockIdentifier"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_lockBtConnHandle, CFSTR("lockBtConnHandle"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_debugOptions, CFSTR("debugOptions"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_configurationTypeInternal, CFSTR("configurationType"));

}

- (NIAcwgConfiguration)initWithCoder:(id)a3
{
  id v4;
  NIAcwgConfiguration *v5;
  unsigned __int16 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NIAcwgConfiguration *v14;
  NIAcwgConfiguration *v15;
  _QWORD v17[3];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self)
  {
    v15 = 0;
LABEL_9:
    self = v15;
    v5 = self;
    goto LABEL_10;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lockIdentifier"));
  v5 = (NIAcwgConfiguration *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("lockBtConnHandle"));
    v7 = (void *)MEMORY[0x1E0C99E60];
    v18[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0C99E60];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v17[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:", v9, v12, CFSTR("debugOptions"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("configurationType")) == 1)
    {
      v14 = -[NIAcwgConfiguration initWithLockIdentifier:](self, "initWithLockIdentifier:", v5);
      v15 = v14;
      if (v14)
      {
        -[NIAcwgConfiguration setLockBtConnHandle:](v14, "setLockBtConnHandle:", v6);
        -[NIAcwgConfiguration setDebugOptions:](v15, "setDebugOptions:", v13);
      }
    }
    else
    {

      v15 = 0;
    }

    goto LABEL_9;
  }
LABEL_10:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NIAcwgConfiguration *v5;
  NIAcwgConfiguration *v6;
  NSString *lockIdentifier;
  void *v8;
  _BOOL4 v9;
  int lockBtConnHandle;
  int v11;
  NSDictionary *debugOptions;
  BOOL v13;
  BOOL v14;
  void *v15;
  void *v16;
  BOOL v17;
  int64_t configurationTypeInternal;
  uint64_t v19;
  BOOL v20;
  _BOOL4 v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (NIAcwgConfiguration *)v4;
    v6 = v5;
    if (v5 == self)
    {
      v14 = 1;
    }
    else
    {
      lockIdentifier = self->_lockIdentifier;
      -[NIAcwgConfiguration lockIdentifier](v5, "lockIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[NSString isEqualToString:](lockIdentifier, "isEqualToString:", v8);

      lockBtConnHandle = self->_lockBtConnHandle;
      v11 = -[NIAcwgConfiguration lockBtConnHandle](v6, "lockBtConnHandle");
      debugOptions = self->_debugOptions;
      if (debugOptions)
      {
        v13 = 0;
      }
      else
      {
        -[NIAcwgConfiguration debugOptions](v6, "debugOptions");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v15 == 0;

        debugOptions = self->_debugOptions;
      }
      -[NIAcwgConfiguration debugOptions](v6, "debugOptions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[NSDictionary isEqualToDictionary:](debugOptions, "isEqualToDictionary:", v16);

      configurationTypeInternal = self->_configurationTypeInternal;
      v19 = -[NIAcwgConfiguration configurationType](v6, "configurationType");
      v20 = v17 || v13;
      v21 = lockBtConnHandle == v11 && v9;
      if (configurationTypeInternal != v19)
        v20 = 0;
      v14 = v21 && v20;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_lockIdentifier, "hash") ^ self->_lockBtConnHandle;
  return v3 ^ -[NSDictionary hash](self->_debugOptions, "hash") ^ self->_configurationTypeInternal;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NIAcwgConfiguration descriptionInternal](self, "descriptionInternal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %@>"), v5, v6);

  return v7;
}

- (id)descriptionInternal
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<lock identifier: %@, BT conn handle: 0x%04x, debug options: <%@>>"), self->_lockIdentifier, self->_lockBtConnHandle, self->_debugOptions);
}

- (NSString)lockIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLockIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (unsigned)lockBtConnHandle
{
  return self->_lockBtConnHandle;
}

- (void)setLockBtConnHandle:(unsigned __int16)a3
{
  self->_lockBtConnHandle = a3;
}

- (NSDictionary)debugOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDebugOptions:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugOptions, 0);
  objc_storeStrong((id *)&self->_lockIdentifier, 0);
}

@end
