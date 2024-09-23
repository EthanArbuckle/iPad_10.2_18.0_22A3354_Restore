@implementation FBKXMLNode

- (FBKXMLNode)initWithXMLNodePtr:(_xmlNode *)a3
{
  FBKXMLNode *v4;
  uint64_t v5;
  NSString *name;
  uint64_t v7;
  NSString *content;
  _xmlNode *children;
  id i;
  FBKXMLNode *v11;
  uint64_t v12;
  NSArray *v13;
  _xmlAttr *properties;
  id v15;
  void *v16;
  FBKXMLNode *v17;
  FBKXMLNode *v18;
  uint64_t v19;
  NSDictionary *attributes;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)FBKXMLNode;
  v4 = -[FBKXMLNode init](&v22, sel_init);
  if (v4)
  {
    if (a3->name)
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:encoding:", a3->name, 4);
      name = v4->_name;
      v4->_name = (NSString *)v5;

    }
    if (a3->content)
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:encoding:", a3->content, 4);
      content = v4->_content;
      v4->_content = (NSString *)v7;

    }
    children = a3->children;
    for (i = objc_alloc_init(MEMORY[0x24BDBCEB8]); children; children = children->next)
    {
      v11 = -[FBKXMLNode initWithXMLNodePtr:]([FBKXMLNode alloc], "initWithXMLNodePtr:", children);
      objc_msgSend(i, "addObject:", v11);

    }
    v12 = objc_msgSend(i, "copy");
    v13 = v4->_children;
    v4->_children = (NSArray *)v12;

    properties = a3->properties;
    v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    while (properties)
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:encoding:", properties->name, 4);
      if (!properties->children
        || (v17 = -[FBKXMLNode initWithXMLNodePtr:]([FBKXMLNode alloc], "initWithXMLNodePtr:", properties->children)) == 0)
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v17 = (FBKXMLNode *)objc_claimAutoreleasedReturnValue();
      }
      v18 = v17;
      objc_msgSend(v15, "setObject:forKey:", v17, v16);

      properties = properties->next;
    }
    v19 = objc_msgSend(v15, "copy");
    attributes = v4->_attributes;
    v4->_attributes = (NSDictionary *)v19;

  }
  return v4;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)content
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDictionary)attributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAttributes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSArray)children
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setChildren:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
