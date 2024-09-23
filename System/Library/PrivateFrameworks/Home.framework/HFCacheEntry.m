@implementation HFCacheEntry

- (HFCacheEntry)initWithKey:(id)a3 object:(id)a4 cost:(unint64_t)a5
{
  id v9;
  id v10;
  HFCacheEntry *v11;
  HFCacheEntry *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HFCacheEntry;
  v11 = -[HFCacheEntry init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong(&v11->_key, a3);
    objc_storeStrong(&v12->_object, a4);
    v12->_cost = a5;
  }

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCacheEntry key](self, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("key"));

  -[HFCacheEntry object](self, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("object"));

  v8 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[HFCacheEntry cost](self, "cost"), CFSTR("cost"));
  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)key
{
  return self->_key;
}

- (id)object
{
  return self->_object;
}

- (unint64_t)cost
{
  return self->_cost;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_object, 0);
  objc_storeStrong(&self->_key, 0);
}

@end
