@implementation TDThemeConstant

- (void)setIdentifier:(unsigned int)a3
{
  -[TDThemeConstant willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("identifier"));
  self->_identifier = a3;
  -[TDThemeConstant didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("identifier"));
}

- (unsigned)identifier
{
  unsigned int identifier;

  -[TDThemeConstant willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("identifier"));
  identifier = self->_identifier;
  -[TDThemeConstant didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("identifier"));
  return identifier;
}

- (void)setDisplayName:(id)a3
{
  if (a3)
  {
    -[TDThemeConstant willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("displayName"));
    -[TDThemeConstant setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", a3, CFSTR("displayName"));
    -[TDThemeConstant didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("displayName"));
  }
}

- (id)displayName
{
  void *v3;

  -[TDThemeConstant willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("displayName"));
  v3 = (void *)-[TDThemeConstant primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("displayName"));
  -[TDThemeConstant didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("displayName"));
  return v3;
}

- (void)setConstantName:(id)a3
{
  if (a3)
  {
    -[TDThemeConstant willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("constantName"));
    -[TDThemeConstant setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", a3, CFSTR("constantName"));
    -[TDThemeConstant didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("constantName"));
  }
}

- (id)constantName
{
  void *v3;

  -[TDThemeConstant willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("constantName"));
  v3 = (void *)-[TDThemeConstant primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("constantName"));
  -[TDThemeConstant didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("constantName"));
  return v3;
}

- (id)copyDataFromAttributes
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 3);
  v4 = -[TDThemeConstant valueForKey:](self, "valueForKey:", CFSTR("constantName"));
  if (v4)
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("constantName"));
  v5 = -[TDThemeConstant valueForKey:](self, "valueForKey:", CFSTR("displayName"));
  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("displayName"));
  v6 = -[TDThemeConstant valueForKey:](self, "valueForKey:", CFSTR("identifier"));
  if (v6)
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("identifier"));
  return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v3, 200, 0, 0), "copy");
}

- (void)setAttributesFromCopyData:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", a3, 0, 0, 0);
  v5 = objc_msgSend(v4, "objectForKey:", CFSTR("constantName"));
  if (v5)
    -[TDThemeConstant setValue:forKey:](self, "setValue:forKey:", v5, CFSTR("constantName"));
  v6 = objc_msgSend(v4, "objectForKey:", CFSTR("displayName"));
  if (v6)
    -[TDThemeConstant setValue:forKey:](self, "setValue:forKey:", v6, CFSTR("displayName"));
  v7 = objc_msgSend(v4, "objectForKey:", CFSTR("identifier"));
  if (v7)
    -[TDThemeConstant setValue:forKey:](self, "setValue:forKey:", v7, CFSTR("identifier"));
}

@end
