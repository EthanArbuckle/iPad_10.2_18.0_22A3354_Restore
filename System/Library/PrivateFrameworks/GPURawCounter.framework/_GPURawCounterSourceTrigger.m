@implementation _GPURawCounterSourceTrigger

- (_GPURawCounterSourceTrigger)initWithName:(id)a3 description:(id)a4 options:(id)a5
{
  _GPURawCounterSourceTrigger *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_GPURawCounterSourceTrigger;
  v8 = -[_GPURawCounterSourceTrigger init](&v10, sel_init);
  if (v8)
  {
    v8->_name = (NSString *)objc_msgSend(a3, "copy");
    v8->_description = (NSString *)objc_msgSend(a4, "copy");
    v8->_options = (NSDictionary *)objc_msgSend(a5, "copy");
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_GPURawCounterSourceTrigger;
  -[_GPURawCounterSourceTrigger dealloc](&v3, sel_dealloc);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)description
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

@end
