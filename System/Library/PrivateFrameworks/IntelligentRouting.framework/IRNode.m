@implementation IRNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  IRNode *v4;
  uint64_t v5;
  NSString *avOutpuDeviceIdentifier;
  uint64_t v7;
  NSString *rapportIdentifier;
  uint64_t v9;
  NSString *idsIdentifier;
  uint64_t v11;
  NSString *name;

  v4 = objc_alloc_init(IRNode);
  -[IRNode avOutpuDeviceIdentifier](self, "avOutpuDeviceIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  avOutpuDeviceIdentifier = v4->_avOutpuDeviceIdentifier;
  v4->_avOutpuDeviceIdentifier = (NSString *)v5;

  -[IRNode rapportIdentifier](self, "rapportIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  rapportIdentifier = v4->_rapportIdentifier;
  v4->_rapportIdentifier = (NSString *)v7;

  -[IRNode idsIdentifier](self, "idsIdentifier");
  v9 = objc_claimAutoreleasedReturnValue();
  idsIdentifier = v4->_idsIdentifier;
  v4->_idsIdentifier = (NSString *)v9;

  -[IRNode name](self, "name");
  v11 = objc_claimAutoreleasedReturnValue();
  name = v4->_name;
  v4->_name = (NSString *)v11;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *avOutpuDeviceIdentifier;
  id v5;

  avOutpuDeviceIdentifier = self->_avOutpuDeviceIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", avOutpuDeviceIdentifier, CFSTR("avOutpuDeviceIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rapportIdentifier, CFSTR("rapportIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_idsIdentifier, CFSTR("idsIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));

}

- (IRNode)initWithCoder:(id)a3
{
  id v4;
  IRNode *v5;
  void *v6;
  uint64_t v7;
  NSString *avOutpuDeviceIdentifier;
  void *v9;
  uint64_t v10;
  NSString *rapportIdentifier;
  void *v12;
  uint64_t v13;
  NSString *idsIdentifier;
  void *v15;
  uint64_t v16;
  NSString *name;
  IRNode *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)IRNode;
  v5 = -[IRNode init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("avOutpuDeviceIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v7 = objc_claimAutoreleasedReturnValue();

    avOutpuDeviceIdentifier = v5->_avOutpuDeviceIdentifier;
    v5->_avOutpuDeviceIdentifier = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rapportIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v10 = objc_claimAutoreleasedReturnValue();

    rapportIdentifier = v5->_rapportIdentifier;
    v5->_rapportIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("idsIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v13 = objc_claimAutoreleasedReturnValue();

    idsIdentifier = v5->_idsIdentifier;
    v5->_idsIdentifier = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v16 = objc_claimAutoreleasedReturnValue();

    name = v5->_name;
    v5->_name = (NSString *)v16;

    v18 = v5;
  }

  return v5;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: "), v5);

  objc_msgSend(v6, "appendFormat:", CFSTR(", name: %@"), self->_name);
  objc_msgSend(v6, "appendFormat:", CFSTR(", avOutpuDeviceIdentifier: %@"), self->_avOutpuDeviceIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR(", rapportIdentifier: %@"), self->_rapportIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR(", idsIdentifier: %@"), self->_idsIdentifier);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[IRNode avOutpuDeviceIdentifier](self, "avOutpuDeviceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "avOutpuDeviceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {

    }
    else
    {
      -[IRNode avOutpuDeviceIdentifier](self, "avOutpuDeviceIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "avOutpuDeviceIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 != v10)
        goto LABEL_12;
    }
    -[IRNode rapportIdentifier](self, "rapportIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rapportIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqual:", v12))
    {

    }
    else
    {
      -[IRNode rapportIdentifier](self, "rapportIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "rapportIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 != v14)
        goto LABEL_12;
    }
    -[IRNode idsIdentifier](self, "idsIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "idsIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqual:", v16))
    {

      goto LABEL_13;
    }
    -[IRNode idsIdentifier](self, "idsIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "idsIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17 == v18)
    {
LABEL_13:
      -[IRNode name](self, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "isEqual:", v20))
      {

        v8 = 1;
      }
      else
      {
        -[IRNode name](self, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "name");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v21 != v22;

        v8 = !v23;
      }
      goto LABEL_16;
    }
LABEL_12:
    v8 = 0;
LABEL_16:

    goto LABEL_17;
  }
  v8 = 0;
LABEL_17:

  return v8 & 1;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_avOutpuDeviceIdentifier, "hash");
  v4 = -[NSString hash](self->_rapportIdentifier, "hash") ^ v3;
  v5 = -[NSString hash](self->_idsIdentifier, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_name, "hash");
}

- (NSString)avOutpuDeviceIdentifier
{
  return self->_avOutpuDeviceIdentifier;
}

- (void)setAvOutpuDeviceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_avOutpuDeviceIdentifier, a3);
}

- (NSString)rapportIdentifier
{
  return self->_rapportIdentifier;
}

- (void)setRapportIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_rapportIdentifier, a3);
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void)setIdsIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_idsIdentifier, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_rapportIdentifier, 0);
  objc_storeStrong((id *)&self->_avOutpuDeviceIdentifier, 0);
}

@end
