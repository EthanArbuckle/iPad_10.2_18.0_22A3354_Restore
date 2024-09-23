@implementation CCRepeatedFieldValue

+ (id)_new
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_init");
}

- (id)_init
{
  void *v3;
  CCRepeatedFieldValue *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[CCRepeatedFieldValue initWithMutableArray:](self, "initWithMutableArray:", v3);

  return v4;
}

- (CCRepeatedFieldValue)initWithMutableArray:(id)a3
{
  id v5;
  CCRepeatedFieldValue *v6;
  CCRepeatedFieldValue *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CCRepeatedFieldValue;
  v6 = -[CCRepeatedFieldValue init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_values, a3);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[CCRepeatedFieldValue values](self, "values");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "values");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      v10 = 1;
    }
    else
    {
      -[CCRepeatedFieldValue values](self, "values");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "values");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToArray:", v9);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSMutableArray)values
{
  return self->_values;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
}

@end
