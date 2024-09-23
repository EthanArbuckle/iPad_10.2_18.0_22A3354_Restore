@implementation TDProperty

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TDProperty;
  -[TDProperty dealloc](&v3, sel_dealloc);
}

- (NSString)name
{
  NSString *v3;

  -[TDProperty willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("name"));
  v3 = (NSString *)(id)-[NSString copy](self->_name, "copy");
  -[TDProperty didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("name"));
  return v3;
}

- (void)setName:(id)a3
{
  -[TDProperty willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("name"));

  self->_name = (NSString *)objc_msgSend(a3, "copy");
  -[TDProperty didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("name"));
}

- (void)addToDictionary:(id)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TDProperty.m"), 33, CFSTR("Abstract TDProperty instances can't be put in a dictionary since they have no value."));
}

@end
