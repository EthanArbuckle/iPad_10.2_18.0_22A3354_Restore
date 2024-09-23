@implementation HDStateSyncEntitySchema

+ (id)schemaWithDomain:(id)a3 dataKeys:(id)a4
{
  id v5;
  id v6;
  HDStateSyncEntitySchema *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[HDStateSyncEntitySchema initWithWithDomain:dataKeys:]([HDStateSyncEntitySchema alloc], "initWithWithDomain:dataKeys:", v6, v5);

  return v7;
}

- (HDStateSyncEntitySchema)initWithWithDomain:(id)a3 dataKeys:(id)a4
{
  id v7;
  id v8;
  HDStateSyncEntitySchema *v9;
  HDStateSyncEntitySchema *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDStateSyncEntitySchema;
  v9 = -[HDStateSyncEntitySchema init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_domain, a3);
    objc_storeStrong((id *)&v10->_dataKeys, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  HDStateSyncEntitySchema *v4;
  NSString *domain;
  NSString *v6;
  char v7;

  v4 = (HDStateSyncEntitySchema *)a3;
  if (self == v4)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  domain = self->_domain;
  v6 = v4->_domain;
  if (domain == v6)
  {
LABEL_6:
    v7 = 1;
    goto LABEL_8;
  }
  if (!v6)
    goto LABEL_7;
  v7 = -[NSString isEqualToString:](domain, "isEqualToString:");
LABEL_8:

  return v7;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_domain, "hash");
}

- (id)description
{
  return self->_domain;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDStateSyncEntitySchema)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HDStateSyncEntitySchema *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("domain"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("dataKeys"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[HDStateSyncEntitySchema initWithWithDomain:dataKeys:](self, "initWithWithDomain:dataKeys:", v5, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *domain;
  id v5;

  domain = self->_domain;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", domain, CFSTR("domain"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dataKeys, CFSTR("dataKeys"));

}

- (NSString)domain
{
  return self->_domain;
}

- (NSSet)dataKeys
{
  return self->_dataKeys;
}

- (void)setDataKeys:(id)a3
{
  objc_storeStrong((id *)&self->_dataKeys, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataKeys, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
