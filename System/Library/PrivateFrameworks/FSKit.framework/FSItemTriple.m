@implementation FSItemTriple

- (FSItemTriple)initWith:(id)a3 second:(id)a4 third:(id)a5
{
  id v8;
  id v9;
  id v10;
  FSItemTriple *v11;
  uint64_t v12;
  NSObject *first;
  uint64_t v14;
  NSObject *second;
  uint64_t v16;
  NSObject *third;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)FSItemTriple;
  v11 = -[FSItemTriple init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    first = v11->_first;
    v11->_first = v12;

    v14 = objc_msgSend(v9, "copy");
    second = v11->_second;
    v11->_second = v14;

    v16 = objc_msgSend(v10, "copy");
    third = v11->_third;
    v11->_third = v16;

  }
  return v11;
}

+ (id)tripleWith:(id)a3 second:(id)a4 third:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWith:second:third:", v10, v9, v8);

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSObject hash](self->_first, "hash");
  v4 = -[NSObject hash](self->_second, "hash") + 199 * v3;
  return -[NSObject hash](self->_third, "hash") + 199 * v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSObject *first;
  void *v7;
  NSObject *second;
  void *v9;
  NSObject *third;
  void *v11;
  char v12;

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
      if (-[NSObject isEqual:](second, "isEqual:", v9))
      {
        third = self->_third;
        objc_msgSend(v5, "third");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[NSObject isEqual:](third, "isEqual:", v11);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWith:second:third:", self->_first, self->_second, self->_third);
}

- (NSObject)first
{
  return objc_getProperty(self, a2, 8, 1);
}

- (NSObject)second
{
  return objc_getProperty(self, a2, 16, 1);
}

- (NSObject)third
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_third, 0);
  objc_storeStrong((id *)&self->_second, 0);
  objc_storeStrong((id *)&self->_first, 0);
}

@end
