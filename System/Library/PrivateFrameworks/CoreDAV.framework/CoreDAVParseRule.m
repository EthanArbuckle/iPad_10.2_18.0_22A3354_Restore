@implementation CoreDAVParseRule

+ (id)ruleWithMinimumNumber:(int64_t)a3 maximumNumber:(int64_t)a4 nameSpace:(id)a5 elementName:(id)a6 objectClass:(Class)a7 setterMethod:(SEL)a8
{
  id v14;
  id v15;
  void *v16;

  v14 = a6;
  v15 = a5;
  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", a3, a4, v15, v14, a7, a8);

  return v16;
}

- (CoreDAVParseRule)initWithMinimumNumber:(int64_t)a3 maximumNumber:(int64_t)a4 nameSpace:(id)a5 elementName:(id)a6 objectClass:(Class)a7 setterMethod:(SEL)a8
{
  id v15;
  id v16;
  CoreDAVParseRule *v17;
  CoreDAVParseRule *v18;
  objc_super v20;

  v15 = a5;
  v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)CoreDAVParseRule;
  v17 = -[CoreDAVParseRule init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_minimumNumber = a3;
    v17->_maximumNumber = a4;
    objc_storeStrong((id *)&v17->_nameSpace, a5);
    objc_storeStrong((id *)&v18->_elementName, a6);
    v18->_objectClass = a7;
    v18->_setterMethod = a8;
  }

  return v18;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PARSE RULE: namespace %p (%@) elementname %p (%@) object class %p (%@)"), self->_nameSpace, self->_nameSpace, self->_elementName, self->_elementName, self->_objectClass, self->_objectClass);
}

- (int64_t)minimumNumber
{
  return self->_minimumNumber;
}

- (int64_t)maximumNumber
{
  return self->_maximumNumber;
}

- (NSString)nameSpace
{
  return self->_nameSpace;
}

- (NSString)elementName
{
  return self->_elementName;
}

- (Class)objectClass
{
  return self->_objectClass;
}

- (SEL)setterMethod
{
  return self->_setterMethod;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementName, 0);
  objc_storeStrong((id *)&self->_nameSpace, 0);
}

@end
