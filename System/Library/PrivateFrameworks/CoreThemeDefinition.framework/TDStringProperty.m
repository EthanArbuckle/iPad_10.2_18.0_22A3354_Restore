@implementation TDStringProperty

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TDStringProperty;
  -[TDProperty dealloc](&v3, sel_dealloc);
}

- (NSString)stringValue
{
  NSString *v3;

  -[TDStringProperty willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("stringValue"));
  v3 = (NSString *)(id)-[NSString copy](self->_stringValue, "copy");
  -[TDStringProperty didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("stringValue"));
  return v3;
}

- (void)setStringValue:(id)a3
{
  -[TDStringProperty willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("stringValue"));

  self->_stringValue = (NSString *)objc_msgSend(a3, "copy");
  -[TDStringProperty didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("stringValue"));
}

- (void)addToDictionary:(id)a3
{
  objc_msgSend(a3, "setObject:forKey:", -[TDStringProperty stringValue](self, "stringValue"), -[TDProperty name](self, "name"));
}

@end
