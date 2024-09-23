@implementation NSPropertyStoreMapping

- (NSPropertyStoreMapping)initWithProperty:(id)a3
{
  NSStoreMappingGenerator *v5;
  void *v6;
  uint64_t v7;
  NSPropertyStoreMapping *result;
  objc_super v9;

  v5 = +[NSStoreMappingGenerator defaultMappingGenerator]();
  v6 = (void *)objc_msgSend(a3, "name");
  if (v5)
    v7 = objc_msgSend(v6, "lowercaseString");
  else
    v7 = 0;
  v9.receiver = self;
  v9.super_class = (Class)NSPropertyStoreMapping;
  result = -[NSStoreMapping initWithExternalName:](&v9, sel_initWithExternalName_, v7);
  if (result)
    result->_property = (NSPropertyDescription *)a3;
  return result;
}

- (void)dealloc
{
  objc_super v2;

  if (self)
    self->_property = 0;
  v2.receiver = self;
  v2.super_class = (Class)NSPropertyStoreMapping;
  -[NSStoreMapping dealloc](&v2, sel_dealloc);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSPropertyStoreMapping;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ -> %@"), -[NSPropertyStoreMapping description](&v3, sel_description), -[NSPropertyDescription name](self->_property, "name"));
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  uint64_t v7;

  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
    return 0;
  if (self->_property)
  {
    if (!objc_msgSend(-[NSPropertyStoreMapping property](self, "property"), "isEqual:", objc_msgSend(a3, "property"))|| -[NSStoreMapping externalName](self, "externalName"))
    {
      return objc_msgSend(-[NSStoreMapping externalName](self, "externalName"), "isEqual:", objc_msgSend(a3, "externalName"));
    }
    v7 = objc_msgSend(a3, "externalName");
  }
  else
  {
    v7 = objc_msgSend(a3, "property");
  }
  return v7 == 0;
}

- (id)property
{
  return self->_property;
}

@end
