@implementation BCSDomainItemIdentifier

+ (id)identifierWithType:(int64_t)a3 domain:(id)a4
{
  id v5;
  BCSDomainItemIdentifier *v6;

  v5 = a4;
  v6 = -[BCSDomainItemIdentifier initWithType:domain:]([BCSDomainItemIdentifier alloc], "initWithType:domain:", a3, v5);

  return v6;
}

- (BCSDomainItemIdentifier)initWithType:(int64_t)a3 domain:(id)a4
{
  id v7;
  BCSDomainItemIdentifier *v8;
  BCSDomainItemIdentifier *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BCSDomainItemIdentifier;
  v8 = -[BCSDomainItemIdentifier init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_domain, a4);
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE0BE20], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BCSDomainItemIdentifier type](self, "type");
  v7 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __35__BCSDomainItemIdentifier_isEqual___block_invoke;
  v19[3] = &unk_24C39C008;
  v8 = v4;
  v20 = v8;
  v9 = (id)objc_msgSend(v5, "appendInteger:counterpart:", v6, v19);
  -[BCSDomainItemIdentifier domain](self, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v7;
  v15 = 3221225472;
  v16 = __35__BCSDomainItemIdentifier_isEqual___block_invoke_2;
  v17 = &unk_24C39C030;
  v18 = v8;
  v11 = v8;
  v12 = (id)objc_msgSend(v5, "appendString:counterpart:", v10, &v14);

  LOBYTE(v10) = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);
  return (char)v10;
}

uint64_t __35__BCSDomainItemIdentifier_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "type");
}

uint64_t __35__BCSDomainItemIdentifier_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "domain");
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:", -[BCSDomainItemIdentifier type](self, "type"));
  -[BCSDomainItemIdentifier domain](self, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendString:", v5);

  v7 = objc_msgSend(v3, "hash");
  return v7;
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:withName:", -[BCSDomainItemIdentifier type](self, "type"), CFSTR("type"));
  -[BCSDomainItemIdentifier domain](self, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("domain"));

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BCSDomainItemIdentifier *v4;
  int64_t v5;
  void *v6;
  BCSDomainItemIdentifier *v7;

  v4 = +[BCSDomainItemIdentifier allocWithZone:](BCSDomainItemIdentifier, "allocWithZone:", a3);
  v5 = -[BCSDomainItemIdentifier type](self, "type");
  -[BCSDomainItemIdentifier domain](self, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BCSDomainItemIdentifier initWithType:domain:](v4, "initWithType:domain:", v5, v6);

  return v7;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
