@implementation IIO_CXMLParser

+ (id)dictionaryForXMLData:(id)a3 error:(id *)a4
{
  return -[IIO_CXMLParser initializeWithData:](-[IIO_CXMLParser initWithError:]([IIO_CXMLParser alloc], "initWithError:", a4), "initializeWithData:", a3);
}

- (IIO_CXMLParser)initWithError:(id *)a3
{
  IIO_CXMLParser *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IIO_CXMLParser;
  result = -[IIO_CXMLParser init](&v5, sel_init);
  if (result)
    result->_errorPointer = a3;
  return result;
}

- (id)initializeWithData:(id)a3
{
  void *v5;

  self->_dictionaryStack = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  self->_textInProgress = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[NSMutableArray addObject:](self->_dictionaryStack, "addObject:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionary"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B28]), "initWithData:", a3);
  objc_msgSend(v5, "setDelegate:", self);
  if (objc_msgSend(v5, "parse"))
    return (id)-[NSMutableArray objectAtIndex:](self->_dictionaryStack, "objectAtIndex:", 0);
  else
    return 0;
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v8;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v8 = a4;
  v10 = (void *)-[NSMutableArray lastObject](self->_dictionaryStack, "lastObject", a3, a4, a5, a6);
  if (objc_msgSend(v8, "hasPrefix:", CFSTR("ofd:")))
    v8 = (id)objc_msgSend(v8, "substringFromIndex:", 4);
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v11, "addEntriesFromDictionary:", a7);
  v12 = objc_msgSend(v10, "objectForKey:", v8);
  if (v12)
  {
    v13 = (void *)v12;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      objc_msgSend(v14, "addObject:", v13);
      objc_msgSend(v10, "setObject:forKey:", v14, v8);
      v13 = v14;
    }
    objc_msgSend(v13, "addObject:", v11);
  }
  else
  {
    objc_msgSend(v10, "setObject:forKey:", v11, v8);
  }
  -[NSMutableArray addObject:](self->_dictionaryStack, "addObject:", v11);
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  id v6;
  void *v8;
  void *v9;

  v6 = a4;
  v8 = (void *)-[NSMutableArray lastObject](self->_dictionaryStack, "lastObject", a3, a4, a5, a6);
  if (objc_msgSend(v6, "hasPrefix:", CFSTR("ofd:")))
    v6 = (id)objc_msgSend(v6, "substringFromIndex:", 4);
  if (-[NSMutableString length](self->_textInProgress, "length"))
  {
    objc_msgSend(v8, "setObject:forKey:", self->_textInProgress, CFSTR("_text"));
    -[NSMutableArray removeLastObject](self->_dictionaryStack, "removeLastObject");
    v9 = (void *)-[NSMutableArray lastObject](self->_dictionaryStack, "lastObject");
    if (objc_msgSend((id)objc_msgSend(v9, "objectForKey:", v6), "count") == 1)
      objc_msgSend(v9, "setObject:forKey:", self->_textInProgress, v6);
    self->_textInProgress = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
  }
  else
  {
    -[NSMutableArray removeLastObject](self->_dictionaryStack, "removeLastObject");
  }
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  -[NSMutableString appendString:](self->_textInProgress, "appendString:", objc_msgSend(a4, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet", a3)));
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  id *errorPointer;
  void *v6;
  const __CFString *v7;

  errorPointer = self->_errorPointer;
  if (errorPointer)
    *errorPointer = a4;
  objc_msgSend(a3, "abortParsing");
  v6 = (void *)MEMORY[0x1E0C99DA0];
  if (a4)
    v7 = (const __CFString *)objc_msgSend((id)objc_msgSend(a4, "userInfo"), "objectForKeyedSubscript:", CFSTR("NSXMLParserErrorMessage"));
  else
    v7 = CFSTR("failed to parse input data");
  objc_exception_throw((id)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", CFSTR("XML-parsing error"), v7, 0));
}

@end
