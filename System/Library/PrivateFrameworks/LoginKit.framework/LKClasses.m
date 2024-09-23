@implementation LKClasses

- (LKClasses)initWithClassArray:(id)a3
{
  id v5;
  LKClasses *v6;
  LKClasses *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LKClasses;
  v6 = -[LKClasses init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_classes, a3);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  LKClasses *v4;
  LKClasses *v5;
  BOOL v6;

  v4 = (LKClasses *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[LKClasses isEqualToLKClasses:](self, "isEqualToLKClasses:", v5);

  return v6;
}

- (BOOL)isEqualToLKClasses:(id)a3
{
  id v4;
  NSUInteger v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  v5 = -[NSArray count](self->_classes, "count");
  objc_msgSend(v4, "classes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v5 == v7)
  {
    if (-[NSArray count](self->_classes, "count"))
    {
      v8 = 0;
      do
      {
        -[NSArray objectAtIndexedSubscript:](self->_classes, "objectAtIndexedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "classes");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v9, "isEqual:", v11);

        if ((v12 & 1) == 0)
          break;
        ++v8;
      }
      while (-[NSArray count](self->_classes, "count") > v8);
    }
    else
    {
      v12 = 1;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSArray)classes
{
  return self->_classes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classes, 0);
}

@end
