@implementation TDIntegerProperty

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TDIntegerProperty;
  -[TDProperty dealloc](&v2, sel_dealloc);
}

- (int64_t)integerValue
{
  int64_t integerValue;

  -[TDIntegerProperty willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("integerValue"));
  integerValue = self->_integerValue;
  -[TDIntegerProperty didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("integerValue"));
  return integerValue;
}

- (void)setIntegerValue:(int64_t)a3
{
  -[TDIntegerProperty willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("integerValue"));
  self->_integerValue = a3;
  -[TDIntegerProperty didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("integerValue"));
}

- (void)addToDictionary:(id)a3
{
  objc_msgSend(a3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[TDIntegerProperty integerValue](self, "integerValue")), -[TDProperty name](self, "name"));
}

@end
