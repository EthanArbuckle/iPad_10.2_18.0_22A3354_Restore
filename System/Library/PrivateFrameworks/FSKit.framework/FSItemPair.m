@implementation FSItemPair

- (FSItemPair)initWith:(id)a3 andObject:(id)a4
{
  id v6;
  id v7;
  FSItemPair *v8;
  uint64_t v9;
  NSObject *first;
  uint64_t v11;
  NSObject *second;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FSItemPair;
  v8 = -[FSItemPair init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    first = v8->_first;
    v8->_first = v9;

    v11 = objc_msgSend(v7, "copy");
    second = v8->_second;
    v8->_second = v11;

  }
  return v8;
}

+ (id)pairWith:(id)a3 andObject:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWith:andObject:", v7, v6);

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSObject hash](self->_first, "hash");
  return -[NSObject hash](self->_second, "hash") + 997 * v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSObject *first;
  void *v7;
  NSObject *second;
  void *v9;
  char v10;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    first = self->_first;
    objc_msgSend(v5, "first");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSObject isEqual:](first, "isEqual:", v7))
    {
      second = self->_second;
      objc_msgSend(v5, "second");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[NSObject isEqual:](second, "isEqual:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWith:andObject:", self->_first, self->_second);
}

- (NSObject)first
{
  return objc_getProperty(self, a2, 8, 1);
}

- (NSObject)second
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_second, 0);
  objc_storeStrong((id *)&self->_first, 0);
}

@end
