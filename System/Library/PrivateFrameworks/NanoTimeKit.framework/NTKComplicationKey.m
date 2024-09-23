@implementation NTKComplicationKey

- (NTKComplicationKey)initWithClientIdentifier:(id)a3 descriptor:(id)a4
{
  id v6;
  id v7;
  NTKComplicationKey *v8;
  uint64_t v9;
  NSString *clientIdentifier;
  void *v11;
  uint64_t v12;
  NSString *complicationIdentifier;
  uint64_t v14;
  CLKComplicationDescriptor *descriptor;
  NTKComplicationKey *v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)NTKComplicationKey;
  v8 = -[NTKComplicationKey init](&v18, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    clientIdentifier = v8->_clientIdentifier;
    v8->_clientIdentifier = (NSString *)v9;

    objc_msgSend(v7, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    complicationIdentifier = v8->_complicationIdentifier;
    v8->_complicationIdentifier = (NSString *)v12;

    v14 = objc_msgSend(v7, "copy");
    descriptor = v8->_descriptor;
    v8->_descriptor = (CLKComplicationDescriptor *)v14;

    v16 = v8;
  }

  return v8;
}

- (NTKComplicationKey)initWithClientIdentifier:(id)a3 complicationIdentifier:(id)a4
{
  id v6;
  id v7;
  NTKComplicationKey *v8;
  uint64_t v9;
  NSString *clientIdentifier;
  uint64_t v11;
  NSString *complicationIdentifier;
  NTKComplicationKey *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)NTKComplicationKey;
  v8 = -[NTKComplicationKey init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    clientIdentifier = v8->_clientIdentifier;
    v8->_clientIdentifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    complicationIdentifier = v8->_complicationIdentifier;
    v8->_complicationIdentifier = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NTKComplicationKey<%@, %@>"), self->_clientIdentifier, self->_complicationIdentifier);
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
    objc_msgSend(v4, "clientIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKComplicationKey clientIdentifier](self, "clientIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", v6))
    {
      objc_msgSend(v4, "complicationIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKComplicationKey complicationIdentifier](self, "complicationIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

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

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[NTKComplicationKey clientIdentifier](self, "clientIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[NTKComplicationKey complicationIdentifier](self, "complicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_clientIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_complicationIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[CLKComplicationDescriptor copyWithZone:](self->_descriptor, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NTKComplicationKey)initWithCoder:(id)a3
{
  id v4;
  NTKComplicationKey *v5;
  uint64_t v6;
  NSString *clientIdentifier;
  uint64_t v8;
  NSString *complicationIdentifier;
  uint64_t v10;
  CLKComplicationDescriptor *descriptor;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NTKComplicationKey;
  v5 = -[NTKComplicationKey init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("complicationIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    complicationIdentifier = v5->_complicationIdentifier;
    v5->_complicationIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("descriptor"));
    v10 = objc_claimAutoreleasedReturnValue();
    descriptor = v5->_descriptor;
    v5->_descriptor = (CLKComplicationDescriptor *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *clientIdentifier;
  id v5;

  clientIdentifier = self->_clientIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", clientIdentifier, CFSTR("clientIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_complicationIdentifier, CFSTR("complicationIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_descriptor, CFSTR("descriptor"));

}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)complicationIdentifier
{
  return self->_complicationIdentifier;
}

- (void)setComplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CLKComplicationDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_complicationIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end
