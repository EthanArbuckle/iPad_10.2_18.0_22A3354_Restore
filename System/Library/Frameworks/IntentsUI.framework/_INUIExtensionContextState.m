@implementation _INUIExtensionContextState

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSDictionary hash](self->_hostedViewMinimumAllowedSizes, "hash");
  v4 = -[NSDictionary hash](self->_hostedViewMaximumAllowedSizes, "hash") ^ v3;
  return v4 ^ -[NSArray hash](self->_interfaceSections, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSDictionary *hostedViewMinimumAllowedSizes;
  NSDictionary *hostedViewMaximumAllowedSizes;
  NSArray *interfaceSections;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    hostedViewMinimumAllowedSizes = self->_hostedViewMinimumAllowedSizes;
    v9 = 0;
    if (hostedViewMinimumAllowedSizes == (NSDictionary *)v5[1]
      || -[NSDictionary isEqual:](hostedViewMinimumAllowedSizes, "isEqual:"))
    {
      hostedViewMaximumAllowedSizes = self->_hostedViewMaximumAllowedSizes;
      if (hostedViewMaximumAllowedSizes == (NSDictionary *)v5[2]
        || -[NSDictionary isEqual:](hostedViewMaximumAllowedSizes, "isEqual:"))
      {
        interfaceSections = self->_interfaceSections;
        if (interfaceSections == (NSArray *)v5[3] || -[NSArray isEqual:](interfaceSections, "isEqual:"))
          v9 = 1;
      }
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (_INUIExtensionContextState)initWithCoder:(id)a3
{
  id v4;
  _INUIExtensionContextState *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_INUIExtensionContextState;
  v5 = -[_INUIExtensionContextState init](&v21, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("hostedViewMinimumAllowedSizes"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_INUIExtensionContextState setHostedViewMinimumAllowedSizes:](v5, "setHostedViewMinimumAllowedSizes:", v10);

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("hostedViewMaximumAllowedSizes"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_INUIExtensionContextState setHostedViewMaximumAllowedSizes:](v5, "setHostedViewMaximumAllowedSizes:", v15);

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("interfaceSections"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_INUIExtensionContextState setInterfaceSections:](v5, "setInterfaceSections:", v19);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *hostedViewMinimumAllowedSizes;
  id v5;

  hostedViewMinimumAllowedSizes = self->_hostedViewMinimumAllowedSizes;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", hostedViewMinimumAllowedSizes, CFSTR("hostedViewMinimumAllowedSizes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_hostedViewMaximumAllowedSizes, CFSTR("hostedViewMaximumAllowedSizes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_interfaceSections, CFSTR("interfaceSections"));

}

- (NSDictionary)hostedViewMinimumAllowedSizes
{
  return self->_hostedViewMinimumAllowedSizes;
}

- (void)setHostedViewMinimumAllowedSizes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)hostedViewMaximumAllowedSizes
{
  return self->_hostedViewMaximumAllowedSizes;
}

- (void)setHostedViewMaximumAllowedSizes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)interfaceSections
{
  return self->_interfaceSections;
}

- (void)setInterfaceSections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceSections, 0);
  objc_storeStrong((id *)&self->_hostedViewMaximumAllowedSizes, 0);
  objc_storeStrong((id *)&self->_hostedViewMinimumAllowedSizes, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
