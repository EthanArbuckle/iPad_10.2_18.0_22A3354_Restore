@implementation ASDPurchaseResponse

- (ASDPurchaseResponse)init
{
  return -[ASDPurchaseResponse initWithPurchaseResponseItems:](self, "initWithPurchaseResponseItems:", MEMORY[0x1E0C9AA60]);
}

- (ASDPurchaseResponse)initWithPurchaseResponseItems:(id)a3
{
  id v5;
  ASDPurchaseResponse *v6;
  ASDPurchaseResponse *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDPurchaseResponse;
  v6 = -[ASDPurchaseResponse init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_items, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = objc_alloc_init((Class)objc_opt_class());
  v6 = -[NSArray copyWithZone:](self->_items, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  objc_msgSend(v5, "setSuccess:", -[ASDRequestResponse success](self, "success"));
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDPurchaseResponse)initWithCoder:(id)a3
{
  id v4;
  ASDPurchaseResponse *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *items;

  v4 = a3;
  v5 = -[ASDPurchaseResponse init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("responseItems"));
    v9 = objc_claimAutoreleasedReturnValue();
    items = v5->_items;
    v5->_items = (NSArray *)v9;

    -[ASDRequestResponse setSuccess:](v5, "setSuccess:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("success")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *items;
  id v5;

  items = self->_items;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", items, CFSTR("responseItems"));
  objc_msgSend(v5, "encodeBool:forKey:", -[ASDRequestResponse success](self, "success"), CFSTR("success"));

}

- (NSArray)items
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

@end
