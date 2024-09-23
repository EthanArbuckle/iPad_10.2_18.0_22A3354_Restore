@implementation ASCCacheValue

- (ASCCacheValue)initWithValue:(id)a3
{
  id v4;
  ASCCacheValue *v5;
  ASCCacheValue *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ASCCacheValue;
  v5 = -[ASCCacheValue init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ASCCacheValue setValue:](v5, "setValue:", v4);

  return v6;
}

- (NSObject)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
