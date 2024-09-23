@implementation EQKitEquation

- (EQKitEquation)initWithRoot:(id)a3 source:(id)a4
{
  EQKitEquation *v6;
  EQKitEquation *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EQKitEquation;
  v6 = -[EQKitEquation init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    if (a3)
    {
      v6->mRoot = (EQKitExpression *)a3;
      v7->mSource = (NSData *)a4;
    }
    else
    {

      return 0;
    }
  }
  return v7;
}

+ (unint64_t)formatFromData:(id)a3
{
  void *v4;
  unint64_t v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", a3, 4);
  v5 = objc_msgSend(a1, "formatFromString:", v4);

  return v5;
}

+ (unint64_t)formatFromString:(id)a3
{
  unint64_t v4;
  id v6;
  uint64_t v7;
  void *v8;
  NSString *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(a3, "hasPrefix:", CFSTR("$$")) & 1) != 0)
    return 2;
  if (!+[EQKitEquation formatFromString:]::sMathMLPatterns)
  {
    v6 = objc_alloc(MEMORY[0x24BDBCE30]);
    v7 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("<math"), CFSTR("</math>"), 0);
    +[EQKitEquation formatFromString:]::sMathMLPatterns = objc_msgSend(v6, "initWithObjects:", v7, objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("<"), CFSTR(":math"), CFSTR("</"), CFSTR(":math>"), 0), 0);
  }
  v8 = (void *)_laTeXPatterns();
  v9 = (NSString *)objc_msgSend(a3, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = (void *)+[EQKitEquation formatFromString:]::sMathMLPatterns;
  v11 = objc_msgSend((id)+[EQKitEquation formatFromString:]::sMathMLPatterns, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (!v11)
  {
LABEL_14:
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v15 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (!v15)
      return 0;
    v16 = v15;
    v17 = *(_QWORD *)v20;
LABEL_16:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v17)
        objc_enumerationMutation(v8);
      if (_findPattern(*(NSArray **)(*((_QWORD *)&v19 + 1) + 8 * v18), v9, 1) != 0x7FFFFFFFFFFFFFFFLL)
        return 2;
      if (v16 == ++v18)
      {
        v16 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        v4 = 0;
        if (v16)
          goto LABEL_16;
        return v4;
      }
    }
  }
  v12 = v11;
  v13 = *(_QWORD *)v24;
  v4 = 1;
LABEL_8:
  v14 = 0;
  while (1)
  {
    if (*(_QWORD *)v24 != v13)
      objc_enumerationMutation(v10);
    if (_findPattern(*(NSArray **)(*((_QWORD *)&v23 + 1) + 8 * v14), v9, 0) != 0x7FFFFFFFFFFFFFFFLL)
      return v4;
    if (v12 == ++v14)
    {
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v12)
        goto LABEL_8;
      goto LABEL_14;
    }
  }
}

+ (id)equationWithData:(id)a3 format:(unint64_t)a4 environment:(id)a5 error:(id *)a6
{
  NSData *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  NSString *v13;
  void *v14;
  const char *v15;
  id v16;
  int v17;
  xmlParserInputPtr (__cdecl *ExternalEntityLoader)(const char *, const char *, xmlParserCtxtPtr);
  xmlDoc *v19;
  id v20;
  EQKitMathMLParser *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  xmlSAXHandler hdlr;

  v8 = (NSData *)a3;
  if (a4 == 2)
  {
    if (!a3)
      return 0;
    v13 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"), 4);
    v14 = (void *)_convertLaTeXStringToMathML((EQKitEnvironment *)a5, v13, (NSError **)a6);
    if (v14)
    {
      v15 = (const char *)objc_msgSend(v14, "UTF8String");
      v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v15, strlen(v15));
      v8 = -[NSString dataUsingEncoding:](_stripLaTeXPatterns(v13), "dataUsingEncoding:", 4);
    }
    else
    {
      v16 = 0;
    }

    if (!v16)
      return 0;
  }
  else
  {
    if (a4 != 1)
    {
      if (!a4 && a6 && !*a6)
      {
        v9 = (void *)MEMORY[0x24BDD1540];
        v10 = (void *)MEMORY[0x24BDBCE70];
        v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "localizedStringForKey:value:table:", CFSTR("String format unknown. String format should be LaTeX or MathML."), &stru_25114C368, 0);
        v12 = 0;
        *a6 = (id)objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("EQKitErrorDomain"), 0, objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v11, *MEMORY[0x24BDD0FC8], 0));
        return v12;
      }
      return 0;
    }
    v16 = a3;
    if (!v16)
      return 0;
  }
  if (xmlSAXVersion(&hdlr, 2))
  {
    v12 = 0;
  }
  else
  {
    hdlr.getEntity = (getEntitySAXFunc)EQKitMathMLParserGetEntity;
    v17 = xmlSubstituteEntitiesDefault(1);
    ExternalEntityLoader = xmlGetExternalEntityLoader();
    xmlSetExternalEntityLoader((xmlExternalEntityLoader)NoExternalEntityLoader);
    v19 = xmlSAXParseMemory(&hdlr, (const char *)objc_msgSend(v16, "bytes"), objc_msgSend(v16, "length"), 0);
    xmlSetExternalEntityLoader(ExternalEntityLoader);
    xmlSubstituteEntitiesDefault(v17);
    v12 = 0;
    if (a5 && v19)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v20 = a5;
      else
        v20 = 0;
      v21 = -[EQKitMathMLParser initWithDocument:node:source:attribution:environment:]([EQKitMathMLParser alloc], "initWithDocument:node:source:attribution:environment:", v19, 0, v16, v8, v20);
      v12 = -[EQKitMathMLParser parse](v21, "parse");
      if (a6 && !*a6)
        *a6 = -[EQKitMathMLParser error](v21, "error");

      xmlFreeDoc(v19);
    }
  }
  if (a6 && !v12)
  {
    if (!*a6)
    {
      v22 = (void *)MEMORY[0x24BDD1540];
      v23 = (void *)MEMORY[0x24BDBCE70];
      v24 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "localizedStringForKey:value:table:", CFSTR("Unable to create equation."), &stru_25114C368, 0);
      *a6 = (id)objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("EQKitErrorDomain"), 0, objc_msgSend(v23, "dictionaryWithObjectsAndKeys:", v24, *MEMORY[0x24BDD0FC8], 0));
    }

    return 0;
  }

  if (v12)
    v12[3] = a5;
  return v12;
}

+ (id)equationWithString:(id)a3 format:(unint64_t)a4 environment:(id)a5 error:(id *)a6
{
  const char *v10;

  v10 = (const char *)objc_msgSend(a3, "UTF8String");
  if (v10)
    return (id)objc_msgSend(a1, "equationWithData:format:environment:error:", objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v10, strlen(v10)), a4, a5, a6);
  if (a6)
    *a6 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 2048, 0);
  return 0;
}

+ (id)equationWithString:(id)a3 format:(unint64_t)a4 error:(id *)a5
{
  const char *v8;

  v8 = (const char *)objc_msgSend(a3, "UTF8String");
  if (v8)
    return (id)objc_msgSend(a1, "equationWithData:format:environment:error:", objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v8, strlen(v8)), a4, +[EQKitEnvironment defaultEnvironment](EQKitEnvironment, "defaultEnvironment"), a5);
  if (a5)
    *a5 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 2048, 0);
  return 0;
}

+ (id)equationWithXMLDoc:(_xmlDoc *)a3 node:(_xmlNode *)a4 environment:(id)a5 error:(id *)a6
{
  id v6;
  EQKitMathMLParser *v11;
  uint64_t v12;
  EQKitMathMLParser *v13;

  v6 = 0;
  if (a3 && a4)
  {
    v11 = [EQKitMathMLParser alloc];
    v12 = objc_opt_class();
    v13 = -[EQKitMathMLParser initWithDocument:node:source:attribution:environment:](v11, "initWithDocument:node:source:attribution:environment:", a3, a4, 0, 0, EQKitUtilDynamicCast(v12, (uint64_t)a5));
    v6 = -[EQKitMathMLParser parse](v13, "parse");
    if (a6)
      *a6 = -[EQKitMathMLParser error](v13, "error");

  }
  return v6;
}

- (BOOL)exportToXMLWriter:(_xmlTextWriter *)a3 ns:(const char *)a4 prefix:(const char *)a5 characterCount:(int *)a6
{
  return 0;
}

+ (id)xmlMetadataFromEquationSource:(id)a3
{
  void *v4;
  xmlDoc *v5;
  xmlNode *v6;
  xmlNode *v7;
  xmlNode *v8;
  void *v9;
  xmlNode *v10;
  int v11;
  xmlOutputBuffer *IO;

  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v5 = xmlNewDoc((const xmlChar *)"1.0");
  v6 = xmlNewNode(0, (const xmlChar *)"root");
  xmlDocSetRootElement(v5, v6);
  v7 = xmlNewChild(v6, 0, (const xmlChar *)"com.apple.iwork", 0);
  xmlNewProp(v7, (const xmlChar *)"version", (const xmlChar *)"1.0");
  v8 = xmlNewChild(v7, 0, (const xmlChar *)"equation", 0);
  v9 = (void *)objc_msgSend(a3, "dataUsingEncoding:", 4);
  v10 = xmlNewCDataBlock(v5, (const xmlChar *)objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"));
  xmlAddChild(v8, v10);
  if (v5)
  {
    v11 = xmlKeepBlanksDefault(0);
    IO = xmlOutputBufferCreateIO((xmlOutputWriteCallback)sfaxmlNSMutableDataWriteCallback, 0, v4, 0);
    if (IO)
      xmlSaveFormatFileTo(IO, v5, 0, 1);
    xmlKeepBlanksDefault(v11);
  }
  xmlFreeDoc(v5);
  return v4;
}

+ (id)equationSourceFromXMLMetadata:(id)a3
{
  void *v4;
  int v5;
  xmlParserInputPtr (__cdecl *ExternalEntityLoader)(const char *, const char *, xmlParserCtxtPtr);
  xmlDocPtr v7;
  _xmlNode *children;
  const char *name;
  _xmlNode *v11;
  const char *v12;
  _xmlNode *v13;
  void *v14;
  xmlSAXHandler v15;

  if (xmlSAXVersion(&v15, 2))
    return 0;
  v5 = xmlSubstituteEntitiesDefault(1);
  ExternalEntityLoader = xmlGetExternalEntityLoader();
  xmlSetExternalEntityLoader((xmlExternalEntityLoader)NoExternalEntityLoader);
  v7 = xmlSAXParseMemory(&v15, (const char *)objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"), 0);
  xmlSetExternalEntityLoader(ExternalEntityLoader);
  xmlSubstituteEntitiesDefault(v5);
  if (!v7)
    return 0;
  children = xmlDocGetRootElement(v7)->children;
  if (!children)
    goto LABEL_9;
  while (1)
  {
    if (children->type == XML_ELEMENT_NODE)
    {
      name = (const char *)children->name;
      if (name)
      {
        if (!strcmp(name, "com.apple.iwork"))
          break;
      }
    }
    children = children->next;
    if (!children)
      goto LABEL_9;
  }
  v11 = children->children;
  if (!v11)
    goto LABEL_9;
  while (1)
  {
    if (v11->type == XML_ELEMENT_NODE)
    {
      v12 = (const char *)v11->name;
      if (v12)
      {
        if (!strcmp(v12, "equation"))
          break;
      }
    }
    v11 = v11->next;
    if (!v11)
      goto LABEL_9;
  }
  v13 = v11->children;
  if (v13)
  {
    v4 = 0;
    do
    {
      if (v13->type - 3 <= 1 && v13->content && !xmlIsBlankNode(v13))
      {
        if (v4)
        {
          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v13->content);
          v4 = (void *)objc_msgSend(v4, "stringByAppendingString:", v14);

        }
        else
        {
          v4 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v13->content);
        }
      }
      v13 = v13->next;
    }
    while (v13);
  }
  else
  {
LABEL_9:
    v4 = 0;
  }
  xmlFreeDoc(v7);
  return v4;
}

- (BOOL)isBaseFontNameUsed
{
  return -[EQKitExpression isBaseFontNameUsed](self->mRoot, "isBaseFontNameUsed");
}

- (id)newLayout
{
  return (id)-[EQKitExpression newLayout](self->mRoot, "newLayout");
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EQKitEquation;
  -[EQKitEquation dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p root=%@>"), NSStringFromClass(v4), self, self->mRoot);
}

+ (id)mathMLStringFromLaTeXString:(id)a3 environment:(id)a4 error:(id *)a5
{
  return (id)_convertLaTeXStringToMathML((EQKitEnvironment *)a4, (NSString *)a3, (NSError **)a5);
}

- (EQKitExpression)root
{
  return self->mRoot;
}

- (EQKitEnvironment)environment
{
  return self->mEnvironment;
}

@end
