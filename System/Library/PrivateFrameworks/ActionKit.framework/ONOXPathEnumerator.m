@implementation ONOXPathEnumerator

- (void)dealloc
{
  xmlXPathObject *xmlXPath;
  objc_super v4;

  xmlXPath = self->_xmlXPath;
  if (xmlXPath)
    xmlXPathFreeObject(xmlXPath);
  v4.receiver = self;
  v4.super_class = (Class)ONOXPathEnumerator;
  -[ONOXPathEnumerator dealloc](&v4, sel_dealloc);
}

- (id)objectAtIndex:(int64_t)a3
{
  int64_t v5;
  void *v6;
  void *v7;

  v5 = (uint64_t)-[ONOXPathEnumerator xmlXPath](self, "xmlXPath")[8];
  if (v5)
    v5 = *(int *)-[ONOXPathEnumerator xmlXPath](self, "xmlXPath")[8];
  if (v5 <= a3)
  {
    v7 = 0;
  }
  else
  {
    -[ONOXPathEnumerator document](self, "document");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "elementWithNode:", *(_QWORD *)(*(_QWORD *)((_QWORD)-[ONOXPathEnumerator xmlXPath](self, "xmlXPath")[8] + 8) + 8 * a3));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)allObjects
{
  void *v3;
  uint64_t i;
  uint64_t v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", *(int *)-[ONOXPathEnumerator xmlXPath](self, "xmlXPath")[8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; ; ++i)
  {
    v5 = (uint64_t)-[ONOXPathEnumerator xmlXPath](self, "xmlXPath")[8];
    if (v5)
      LODWORD(v5) = *(_DWORD *)-[ONOXPathEnumerator xmlXPath](self, "xmlXPath")[8];
    if (i >= (int)v5)
      break;
    -[ONOXPathEnumerator objectAtIndex:](self, "objectAtIndex:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v3, "addObject:", v6);

  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)nextObject
{
  unint64_t v3;
  unint64_t v4;
  void *v5;

  v3 = -[ONOXPathEnumerator cursor](self, "cursor");
  if (v3 >= *(int *)-[ONOXPathEnumerator xmlXPath](self, "xmlXPath")[8])
  {
    v5 = 0;
  }
  else
  {
    v4 = -[ONOXPathEnumerator cursor](self, "cursor");
    -[ONOXPathEnumerator setCursor:](self, "setCursor:", v4 + 1);
    -[ONOXPathEnumerator objectAtIndex:](self, "objectAtIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (_xmlXPathObject)xmlXPath
{
  return self->_xmlXPath;
}

- (void)setXmlXPath:(_xmlXPathObject *)a3
{
  self->_xmlXPath = a3;
}

- (unint64_t)cursor
{
  return self->_cursor;
}

- (void)setCursor:(unint64_t)a3
{
  self->_cursor = a3;
}

- (ONOXMLDocument)document
{
  return self->_document;
}

- (void)setDocument:(id)a3
{
  objc_storeStrong((id *)&self->_document, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_document, 0);
}

@end
