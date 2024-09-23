@implementation MOEffectiveArray

- (NSArray)value
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

- (MOEffectiveArray)initWithValue:(id)a3 defaultValue:(id)a4
{
  id v7;
  id v8;
  MOEffectiveArray *v9;
  MOEffectiveArray *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MOEffectiveArray;
  v9 = -[MOEffectiveArray init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_value, a3);
    objc_storeStrong((id *)&v10->_defaultValue, a4);
  }

  return v10;
}

- (NSArray)defaultValue
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

@end
