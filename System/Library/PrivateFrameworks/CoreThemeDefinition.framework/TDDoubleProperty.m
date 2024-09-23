@implementation TDDoubleProperty

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TDDoubleProperty;
  -[TDProperty dealloc](&v2, sel_dealloc);
}

- (double)doubleValue
{
  double doubleValue;

  -[TDDoubleProperty willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("doubleValue"));
  doubleValue = self->_doubleValue;
  -[TDDoubleProperty didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("doubleValue"));
  return doubleValue;
}

- (void)setDoubleValue:(double)a3
{
  -[TDDoubleProperty willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("doubleValue"));
  self->_doubleValue = a3;
  -[TDDoubleProperty didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("doubleValue"));
}

- (void)addToDictionary:(id)a3
{
  void *v5;

  v5 = (void *)MEMORY[0x24BDD16E0];
  -[TDDoubleProperty doubleValue](self, "doubleValue");
  objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v5, "numberWithDouble:"), -[TDProperty name](self, "name"));
}

@end
