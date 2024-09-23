@implementation ONOXPathFunctionResult

- (void)dealloc
{
  xmlXPathObject *xmlXPath;
  objc_super v4;

  xmlXPath = self->_xmlXPath;
  if (xmlXPath)
    xmlXPathFreeObject(xmlXPath);
  v4.receiver = self;
  v4.super_class = (Class)ONOXPathFunctionResult;
  -[ONOXPathFunctionResult dealloc](&v4, sel_dealloc);
}

- (BOOL)BOOLValue
{
  return (_DWORD)-[ONOXPathFunctionResult xmlXPath](self, "xmlXPath")[16] > 0;
}

- (double)numericValue
{
  return (double)-[ONOXPathFunctionResult xmlXPath](self, "xmlXPath")[24];
}

- (NSNumber)numberValue
{
  _xmlXPathObject *v3;

  v3 = -[ONOXPathFunctionResult xmlXPath](self, "xmlXPath");
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)-[ONOXPathFunctionResult xmlXPath](self, "xmlXPath")[24]);
    v3 = (_xmlXPathObject *)objc_claimAutoreleasedReturnValue();
  }
  return (NSNumber *)v3;
}

- (NSString)stringValue
{
  _xmlXPathObject *v3;

  v3 = -[ONOXPathFunctionResult xmlXPath](self, "xmlXPath");
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", (_QWORD)-[ONOXPathFunctionResult xmlXPath](self, "xmlXPath")[32], 4);
    v3 = (_xmlXPathObject *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (_xmlXPathObject)xmlXPath
{
  return self->_xmlXPath;
}

- (void)setXmlXPath:(_xmlXPathObject *)a3
{
  self->_xmlXPath = a3;
}

@end
