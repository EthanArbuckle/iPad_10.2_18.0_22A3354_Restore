@implementation ONOXMLDocument

- (ONOXMLDocument)initWithDocument:(_xmlDoc *)a3
{
  ONOXMLDocument *v4;
  ONOXMLDocument *v5;
  void *v6;
  ONOXMLDocument *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ONOXMLDocument;
  v4 = -[ONOXMLDocument init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_xmlDocument = a3;
    if (-[ONOXMLDocument xmlDocument](v4, "xmlDocument"))
    {
      -[ONOXMLDocument elementWithNode:](v5, "elementWithNode:", xmlDocGetRootElement(-[ONOXMLDocument xmlDocument](v5, "xmlDocument")));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ONOXMLDocument setRootElement:](v5, "setRootElement:", v6);

    }
    v7 = v5;
  }

  return v5;
}

- (void)dealloc
{
  xmlDoc *xmlDocument;
  objc_super v4;

  xmlDocument = self->_xmlDocument;
  if (xmlDocument)
    xmlFreeDoc(xmlDocument);
  v4.receiver = self;
  v4.super_class = (Class)ONOXMLDocument;
  -[ONOXMLDocument dealloc](&v4, sel_dealloc);
}

- (NSNumberFormatter)numberFormatter
{
  NSNumberFormatter *numberFormatter;
  id v4;

  numberFormatter = self->_numberFormatter;
  if (!numberFormatter)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    objc_msgSend(v4, "setNumberStyle:", 1);
    -[ONOXMLDocument setNumberFormatter:](self, "setNumberFormatter:", v4);

    numberFormatter = self->_numberFormatter;
  }
  return numberFormatter;
}

- (NSDateFormatter)dateFormatter
{
  NSDateFormatter *dateFormatter;
  id v4;
  void *v5;

  dateFormatter = self->_dateFormatter;
  if (!dateFormatter)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD1500]);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    objc_msgSend(v4, "setLocale:", v5);

    objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ssZ"));
    -[ONOXMLDocument setDateFormatter:](self, "setDateFormatter:", v4);

    dateFormatter = self->_dateFormatter;
  }
  return dateFormatter;
}

- (void)definePrefix:(id)a3 forDefaultNamespace:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[ONOXMLDocument defaultNamespaces](self, "defaultNamespaces");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ONOXMLDocument setDefaultNamespaces:](self, "setDefaultNamespaces:", v9);

  }
  -[ONOXMLDocument defaultNamespaces](self, "defaultNamespaces");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, v6);

}

- (id)elementWithNode:(_xmlNode *)a3
{
  ONOXMLElement *v5;

  if (a3)
  {
    v5 = objc_alloc_init(ONOXMLElement);
    -[ONOXMLElement setXmlNode:](v5, "setXmlNode:", a3);
    -[ONOXMLElement setDocument:](v5, "setDocument:", self);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)enumeratorWithXPathObject:(_xmlXPathObject *)a3
{
  xmlNodeSetPtr nodesetval;
  ONOXPathEnumerator *v6;

  if (a3 && (nodesetval = a3->nodesetval) != 0 && nodesetval->nodeNr && nodesetval->nodeTab)
  {
    v6 = objc_alloc_init(ONOXPathEnumerator);
    -[ONOXPathEnumerator setXmlXPath:](v6, "setXmlXPath:", a3);
    -[ONOXPathEnumerator setDocument:](v6, "setDocument:", self);
  }
  else
  {
    xmlXPathFreeObject(a3);
    v6 = 0;
  }
  return v6;
}

- (id)XPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ONOXMLDocument rootElement](self, "rootElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "XPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)functionResultByEvaluatingXPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ONOXMLDocument rootElement](self, "rootElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "functionResultByEvaluatingXPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)enumerateElementsWithXPath:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  if (v6)
  {
    v7 = a3;
    -[ONOXMLDocument rootElement](self, "rootElement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __51__ONOXMLDocument_enumerateElementsWithXPath_block___block_invoke;
    v9[3] = &unk_24F8B4548;
    v10 = v6;
    objc_msgSend(v8, "enumerateElementsWithXPath:usingBlock:", v7, v9);

  }
}

- (void)enumerateElementsWithXPath:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ONOXMLDocument rootElement](self, "rootElement");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enumerateElementsWithXPath:usingBlock:", v7, v6);

}

- (id)firstChildWithXPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ONOXMLDocument rootElement](self, "rootElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstChildWithXPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)CSS:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ONOXMLDocument rootElement](self, "rootElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CSS:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)enumerateElementsWithCSS:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ONOXMLDocument rootElement](self, "rootElement");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enumerateElementsWithCSS:block:", v7, v6);

}

- (void)enumerateElementsWithCSS:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ONOXMLDocument rootElement](self, "rootElement");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enumerateElementsWithCSS:usingBlock:", v7, v6);

}

- (id)firstChildWithCSS:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ONOXMLDocument rootElement](self, "rootElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstChildWithCSS:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)version
{
  void *v3;

  if (!self->_version && (_QWORD)-[ONOXMLDocument xmlDocument](self, "xmlDocument")[104])
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", (_QWORD)-[ONOXMLDocument xmlDocument](self, "xmlDocument")[104]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[ONOXMLDocument setVersion:](self, "setVersion:", v3);

  }
  return self->_version;
}

- (unint64_t)stringEncoding
{
  __CFString *v3;
  CFStringEncoding v4;

  if (!self->_stringEncoding && (_QWORD)-[ONOXMLDocument xmlDocument](self, "xmlDocument")[112])
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", (_QWORD)-[ONOXMLDocument xmlDocument](self, "xmlDocument")[112]);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v4 = CFStringConvertIANACharSetNameToEncoding(v3);
    if (v4 != -1)
      -[ONOXMLDocument setStringEncoding:](self, "setStringEncoding:", CFStringConvertEncodingToNSStringEncoding(v4));

  }
  return self->_stringEncoding;
}

- (id)description
{
  void *v2;
  void *v3;

  -[ONOXMLDocument rootElement](self, "rootElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  ONOXMLDocument *v4;
  unint64_t v5;
  BOOL v6;

  v4 = (ONOXMLDocument *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[ONOXMLDocument hash](self, "hash");
      v6 = v5 == -[ONOXMLDocument hash](v4, "hash");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[ONOXMLDocument version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVersion:", v5);

  -[ONOXMLDocument rootElement](self, "rootElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRootElement:", v6);

  return v4;
}

- (ONOXMLDocument)initWithCoder:(id)a3
{
  id v4;
  ONOXMLDocument *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  ONOXMLDocument *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ONOXMLDocument;
  v5 = -[ONOXMLDocument init](&v13, sel_init);
  if (v5)
  {
    NSStringFromSelector(sel_version);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    NSStringFromSelector(sel_rootElement);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      v10 = v9 == 0;
    else
      v10 = 1;
    if (v10)
    {
      v11 = 0;
    }
    else
    {
      -[ONOXMLDocument setVersion:](v5, "setVersion:", v7);
      -[ONOXMLDocument setRootElement:](v5, "setRootElement:", v9);
      v11 = v5;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[ONOXMLDocument version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_version);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[ONOXMLDocument rootElement](self, "rootElement");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_rootElement);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, v7);

}

- (void)setVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setStringEncoding:(unint64_t)a3
{
  self->_stringEncoding = a3;
}

- (ONOXMLElement)rootElement
{
  return self->_rootElement;
}

- (void)setRootElement:(id)a3
{
  objc_storeStrong((id *)&self->_rootElement, a3);
}

- (void)setNumberFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_numberFormatter, a3);
}

- (void)setDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_dateFormatter, a3);
}

- (_xmlDoc)xmlDocument
{
  return self->_xmlDocument;
}

- (void)setXmlDocument:(_xmlDoc *)a3
{
  self->_xmlDocument = a3;
}

- (NSMutableDictionary)defaultNamespaces
{
  return self->_defaultNamespaces;
}

- (void)setDefaultNamespaces:(id)a3
{
  objc_storeStrong((id *)&self->_defaultNamespaces, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultNamespaces, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_rootElement, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

uint64_t __51__ONOXMLDocument_enumerateElementsWithXPath_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (ONOXMLDocument)XMLDocumentWithString:(id)a3 encoding:(unint64_t)a4 error:(id *)a5
{
  void *v7;
  void *v8;

  objc_msgSend(a3, "dataUsingEncoding:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "XMLDocumentWithData:error:", v7, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (ONOXMLDocument *)v8;
}

+ (ONOXMLDocument)XMLDocumentWithData:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  int v8;
  xmlDocPtr Memory;
  xmlDocPtr v10;
  void *v11;
  xmlError *LastError;

  v6 = objc_retainAutorelease(a3);
  v7 = (const char *)objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");

  Memory = xmlReadMemory(v7, v8, "", 0, 97);
  if (Memory)
  {
    v10 = Memory;
    xmlResetLastError();
    v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDocument:", v10);
  }
  else
  {
    LastError = xmlGetLastError();
    ONOSetErrorFromXMLErrorPtr(a4, LastError);
    v11 = 0;
  }
  return (ONOXMLDocument *)v11;
}

+ (id)HTMLDocumentWithString:(id)a3 encoding:(unint64_t)a4 error:(id *)a5
{
  void *v7;
  void *v8;

  objc_msgSend(a3, "dataUsingEncoding:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "HTMLDocumentWithData:error:", v7, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)HTMLDocumentWithData:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  int v8;
  htmlDocPtr Memory;
  htmlDocPtr v10;
  void *v11;
  xmlError *LastError;

  v6 = objc_retainAutorelease(a3);
  v7 = (const char *)objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");

  Memory = htmlReadMemory(v7, v8, "", 0, 97);
  if (Memory)
  {
    v10 = Memory;
    xmlResetLastError();
    v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDocument:", v10);
  }
  else
  {
    LastError = xmlGetLastError();
    ONOSetErrorFromXMLErrorPtr(a4, LastError);
    v11 = 0;
  }
  return v11;
}

@end
