@implementation AMSSetItem

+ (id)setItemWithObject:(id)a3 hashKey:(id)a4
{
  id v5;
  id v6;
  AMSSetItem *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[AMSSetItem initWithObject:hashKey:]([AMSSetItem alloc], "initWithObject:hashKey:", v6, v5);

  return v7;
}

- (AMSSetItem)initWithObject:(id)a3 hashKey:(id)a4
{
  id v7;
  id v8;
  AMSSetItem *v9;
  AMSSetItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSSetItem;
  v9 = -[AMSSetItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_object, a3);
    objc_storeStrong((id *)&v10->_hashKey, a4);
  }

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[AMSSetItem hashKey](self, "hashKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "hashKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSSetItem hashKey](self, "hashKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)object
{
  return self->_object;
}

- (NSString)hashKey
{
  return self->_hashKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hashKey, 0);
  objc_storeStrong(&self->_object, 0);
}

@end
