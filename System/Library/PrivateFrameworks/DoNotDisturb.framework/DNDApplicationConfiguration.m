@implementation DNDApplicationConfiguration

+ (id)defaultConfiguration
{
  return objc_alloc_init(DNDApplicationConfiguration);
}

- (DNDApplicationConfiguration)init
{
  return (DNDApplicationConfiguration *)-[DNDApplicationConfiguration _initWithMinimumBreakthroughUrgency:allowedThreads:deniedThreads:](self, "_initWithMinimumBreakthroughUrgency:allowedThreads:deniedThreads:", 2, 0, 0);
}

- (id)_initWithMinimumBreakthroughUrgency:(unint64_t)a3 allowedThreads:(id)a4 deniedThreads:(id)a5
{
  id v8;
  id v9;
  DNDApplicationConfiguration *v10;
  DNDApplicationConfiguration *v11;
  uint64_t v12;
  NSMutableSet *allowedThreads;
  uint64_t v14;
  NSMutableSet *deniedThreads;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)DNDApplicationConfiguration;
  v10 = -[DNDApplicationConfiguration init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_minimumBreakthroughUrgency = a3;
    if (v8)
      v12 = objc_msgSend(v8, "mutableCopy");
    else
      v12 = objc_opt_new();
    allowedThreads = v11->_allowedThreads;
    v11->_allowedThreads = (NSMutableSet *)v12;

    if (v9)
      v14 = objc_msgSend(v9, "mutableCopy");
    else
      v14 = objc_opt_new();
    deniedThreads = v11->_deniedThreads;
    v11->_deniedThreads = (NSMutableSet *)v14;

  }
  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = -[DNDApplicationConfiguration minimumBreakthroughUrgency](self, "minimumBreakthroughUrgency");
  -[DNDApplicationConfiguration allowedThreads](self, "allowedThreads");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  -[DNDApplicationConfiguration deniedThreads](self, "deniedThreads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  DNDApplicationConfiguration *v4;
  DNDApplicationConfiguration *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v4 = (DNDApplicationConfiguration *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[DNDApplicationConfiguration minimumBreakthroughUrgency](self, "minimumBreakthroughUrgency");
      if (v6 != -[DNDApplicationConfiguration minimumBreakthroughUrgency](v5, "minimumBreakthroughUrgency"))
      {
        v14 = 0;
LABEL_27:

        goto LABEL_28;
      }
      -[DNDApplicationConfiguration allowedThreads](self, "allowedThreads");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDApplicationConfiguration allowedThreads](v5, "allowedThreads");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[DNDApplicationConfiguration allowedThreads](self, "allowedThreads");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          v14 = 0;
LABEL_26:

          goto LABEL_27;
        }
        v10 = (void *)v9;
        -[DNDApplicationConfiguration allowedThreads](v5, "allowedThreads");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v14 = 0;
LABEL_25:

          goto LABEL_26;
        }
        -[DNDApplicationConfiguration allowedThreads](self, "allowedThreads");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDApplicationConfiguration allowedThreads](v5, "allowedThreads");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v12, "isEqual:", v13))
        {
          v14 = 0;
LABEL_24:

          goto LABEL_25;
        }
        v24 = v13;
        v25 = v12;
        v26 = v11;
        v27 = v10;
      }
      -[DNDApplicationConfiguration deniedThreads](self, "deniedThreads");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDApplicationConfiguration deniedThreads](v5, "deniedThreads");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v15 == (void *)v16)
      {

        v14 = 1;
      }
      else
      {
        v17 = (void *)v16;
        -[DNDApplicationConfiguration deniedThreads](self, "deniedThreads");
        v18 = objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v19 = (void *)v18;
          -[DNDApplicationConfiguration deniedThreads](v5, "deniedThreads");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            -[DNDApplicationConfiguration deniedThreads](self, "deniedThreads");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDApplicationConfiguration deniedThreads](v5, "deniedThreads");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v23, "isEqual:", v21);

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
      v11 = v26;
      v10 = v27;
      v13 = v24;
      v12 = v25;
      if (v7 == v8)
        goto LABEL_26;
      goto LABEL_24;
    }
    v14 = 0;
  }
LABEL_28:

  return v14;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  DNDStringFromBreakthroughUrgency(self->_minimumBreakthroughUrgency);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; minimumBreakthroughUrgency: %@; allowedThreads: %@; deniedThreads: %@; >"),
    v4,
    self,
    v5,
    self->_allowedThreads,
    self->_deniedThreads);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)diffDescription
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  DNDStringFromBreakthroughUrgency(self->_minimumBreakthroughUrgency);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("minimumBreakthroughUrgency:%@;"), v4);

  if (-[NSMutableSet count](self->_allowedThreads, "count"))
    objc_msgSend(v3, "appendFormat:", CFSTR("allowedThreads:%@;"), self->_allowedThreads);
  if (-[NSMutableSet count](self->_deniedThreads, "count"))
    objc_msgSend(v3, "appendFormat:", CFSTR("deniedThreads:%@;"), self->_deniedThreads);
  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDApplicationConfiguration _initWithMinimumBreakthroughUrgency:allowedThreads:deniedThreads:]([DNDMutableApplicationConfiguration alloc], "_initWithMinimumBreakthroughUrgency:allowedThreads:deniedThreads:", self->_minimumBreakthroughUrgency, self->_allowedThreads, self->_deniedThreads);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDApplicationConfiguration)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  DNDApplicationConfiguration *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("minimumBreakthroughUrgency"));
  v6 = (void *)MEMORY[0x1E0C99E60];
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("allowedThreads"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E60];
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("deniedThreads"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[DNDApplicationConfiguration _initWithMinimumBreakthroughUrgency:allowedThreads:deniedThreads:](self, "_initWithMinimumBreakthroughUrgency:allowedThreads:deniedThreads:", v5, v9, v13);
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t minimumBreakthroughUrgency;
  id v5;

  minimumBreakthroughUrgency = self->_minimumBreakthroughUrgency;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", minimumBreakthroughUrgency, CFSTR("minimumBreakthroughUrgency"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_allowedThreads, CFSTR("allowedThreads"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deniedThreads, CFSTR("deniedThreads"));

}

- (unint64_t)minimumBreakthroughUrgency
{
  return self->_minimumBreakthroughUrgency;
}

- (NSSet)allowedThreads
{
  return &self->_allowedThreads->super;
}

- (NSSet)deniedThreads
{
  return &self->_deniedThreads->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deniedThreads, 0);
  objc_storeStrong((id *)&self->_allowedThreads, 0);
}

@end
