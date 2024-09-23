@implementation IKDOMAttribute

- (IKDOMAttribute)initWithAppContext:(id)a3 xmlNode:(_xmlNode *)a4
{
  IKDOMAttribute *v4;
  objc_super v6;

  if (a4->type == XML_ATTRIBUTE_NODE)
  {
    v6.receiver = self;
    v6.super_class = (Class)IKDOMAttribute;
    self = -[IKDOMNode initWithAppContext:xmlNode:](&v6, sel_initWithAppContext_xmlNode_, a3);
    v4 = self;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSString)name
{
  _xmlNode *v2;

  v2 = -[IKDOMNode nodePtr](self, "nodePtr");
  if (v2)
  {
    if (v2->name)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
      v2 = (_xmlNode *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }
  }
  return (NSString *)v2;
}

- (NSString)value
{
  _xmlNode *v2;
  _xmlNode *children;

  v2 = -[IKDOMNode nodePtr](self, "nodePtr");
  if (v2)
  {
    children = v2->children;
    if (children && children->content)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
      v2 = (_xmlNode *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }
  }
  return (NSString *)v2;
}

- (int64_t)nodeType
{
  return 2;
}

- (id)appendChild:(id)a3
{
  return 0;
}

- (id)cloneNode:(BOOL)a3
{
  return 0;
}

- (id)insertBefore:(id)a3 :(id)a4
{
  return 0;
}

- (id)replaceChild:(id)a3 :(id)a4
{
  return 0;
}

- (id)removeChild:(id)a3
{
  return 0;
}

- (id)getFeature:(id)a3 :(id)a4
{
  return 0;
}

- (BOOL)dispatchEvent:(id)a3
{
  return 0;
}

- (id)nextSibling
{
  return 0;
}

- (id)previousSibling
{
  return 0;
}

- (id)firstChild
{
  return 0;
}

- (id)lastChild
{
  return 0;
}

- (id)childNodes
{
  return 0;
}

- (BOOL)hasChildNodes
{
  return 0;
}

@end
