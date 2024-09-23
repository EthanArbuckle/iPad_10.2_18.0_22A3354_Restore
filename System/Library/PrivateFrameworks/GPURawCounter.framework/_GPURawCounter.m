@implementation _GPURawCounter

- (_GPURawCounter)initWithName:(id)a3 description:(id)a4 valueType:(unint64_t)a5
{
  _GPURawCounter *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_GPURawCounter;
  v8 = -[_GPURawCounter init](&v10, sel_init);
  if (v8)
  {
    v8->_name = (NSString *)objc_msgSend(a3, "copy");
    v8->_description = (NSString *)objc_msgSend(a4, "copy");
    v8->_counterValueType = a5;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_GPURawCounter;
  -[_GPURawCounter dealloc](&v3, sel_dealloc);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)description
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)counterValueType
{
  return self->_counterValueType;
}

@end
