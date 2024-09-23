@implementation ASDPurchaseRequestOptions

- (ASDPurchaseRequestOptions)init
{
  return -[ASDPurchaseRequestOptions initWithPurchases:](self, "initWithPurchases:", MEMORY[0x1E0C9AA60]);
}

- (ASDPurchaseRequestOptions)initWithPurchases:(id)a3
{
  id v5;
  ASDPurchaseRequestOptions *v6;
  ASDPurchaseRequestOptions *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDPurchaseRequestOptions;
  v6 = -[ASDPurchaseRequestOptions init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_purchases, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ASDPurchaseRequestOptions *v5;
  uint64_t v6;
  NSArray *purchases;

  v5 = -[ASDPurchaseRequestOptions init](+[ASDPurchaseRequestOptions allocWithZone:](ASDPurchaseRequestOptions, "allocWithZone:"), "init");
  v6 = -[NSArray copyWithZone:](self->_purchases, "copyWithZone:", a3);
  purchases = v5->_purchases;
  v5->_purchases = (NSArray *)v6;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDPurchaseRequestOptions)initWithCoder:(id)a3
{
  id v4;
  ASDPurchaseRequestOptions *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *purchases;

  v4 = a3;
  v5 = -[ASDPurchaseRequestOptions init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("purchases"));
    v9 = objc_claimAutoreleasedReturnValue();
    purchases = v5->_purchases;
    v5->_purchases = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASDPurchaseRequestOptions purchases](self, "purchases");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("purchases"));

}

- (NSArray)purchases
{
  return self->_purchases;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchases, 0);
}

@end
