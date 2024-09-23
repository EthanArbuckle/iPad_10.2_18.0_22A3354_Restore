@implementation TDLocalization

- (NSString)name
{
  NSString *v3;

  -[TDLocalization willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("name"));
  v3 = (NSString *)(id)-[NSString copy](self->_name, "copy");
  -[TDLocalization didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("name"));
  return v3;
}

- (void)setName:(id)a3
{
  -[TDLocalization willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("name"));

  self->_name = (NSString *)objc_msgSend(a3, "copy");
  -[TDLocalization didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("name"));
}

- (unsigned)identifier
{
  unsigned __int16 identifier;

  -[TDLocalization willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("identifier"));
  identifier = self->_identifier;
  -[TDLocalization didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("identifier"));
  return identifier;
}

- (void)setIdentifier:(unsigned __int16)a3
{
  -[TDLocalization willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("identifier"));
  self->_identifier = a3;
  -[TDLocalization didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("identifier"));
}

@end
