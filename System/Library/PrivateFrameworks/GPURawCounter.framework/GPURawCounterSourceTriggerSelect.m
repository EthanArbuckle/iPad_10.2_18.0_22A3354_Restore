@implementation GPURawCounterSourceTriggerSelect

- (GPURawCounterSourceTriggerSelect)initWithName:(id)a3 options:(id)a4
{
  GPURawCounterSourceTriggerSelect *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GPURawCounterSourceTriggerSelect;
  v6 = -[GPURawCounterSourceTriggerSelect init](&v8, sel_init);
  if (v6)
  {
    v6->_name = (NSString *)objc_msgSend(a3, "copy");
    v6->_options = (NSDictionary *)objc_msgSend(a4, "copy");
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GPURawCounterSourceTriggerSelect;
  -[GPURawCounterSourceTriggerSelect dealloc](&v3, sel_dealloc);
}

+ (id)selectWithName:(id)a3 options:(id)a4
{
  return -[GPURawCounterSourceTriggerSelect initWithName:options:]([GPURawCounterSourceTriggerSelect alloc], "initWithName:options:", a3, a4);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("name = %@ options = %@"), self->_name, -[NSDictionary description](self->_options, "description"));
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

@end
