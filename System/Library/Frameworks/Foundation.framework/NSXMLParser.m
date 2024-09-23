@implementation NSXMLParser

- (id)delegate
{
  return self->_delegate;
}

- (BOOL)parseFromStream
{
  NSXMLParser *v3;
  NSInputStream *xmlParserStream;
  size_t chunkSize;
  void *v6;
  uint64_t v7;
  void *v8;
  _BOOL4 v9;

  v3 = self;
  +[NSXMLParser setCurrentParser:](NSXMLParser, "setCurrentParser:", self);
  xmlParserStream = self->xmlParserStream;
  if (xmlParserStream)
  {
    -[NSInputStream open](xmlParserStream, "open");
    chunkSize = self->_chunkSize;
    v6 = malloc_type_malloc(chunkSize, 0x100004077774924uLL);
    v7 = -[NSInputStream read:maxLength:](self->xmlParserStream, "read:maxLength:", v6, chunkSize);
    if (v7 == -1)
    {
      v9 = 0;
    }
    else
    {
      while (v7 >= 1)
      {
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v6, v7, 0);
        -[NSXMLParser parseData:](self, "parseData:", v8);

        v7 = -[NSInputStream read:maxLength:](self->xmlParserStream, "read:maxLength:", v6, chunkSize);
      }
      v9 = -[NSXMLParser finishIncrementalParse](self, "finishIncrementalParse");
    }
    free(v6);
    -[NSInputStream close](self->xmlParserStream, "close");
  }
  else
  {
    -[NSXMLParser _setExpandedParserError:](self, "_setExpandedParserError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), -1, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Could not open data stream"), CFSTR("NSXMLParserErrorMessage"), 0)));
    v9 = 0;
  }
  +[NSXMLParser setCurrentParser:](NSXMLParser, "setCurrentParser:", 0);

  return v9;
}

+ (void)setCurrentParser:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;
  NSString *v6;

  v4 = -[NSThread threadDictionary](+[NSThread currentThread](NSThread, "currentThread"), "threadDictionary");
  v5 = v4;
  if (a3)
  {
    if (dyld_program_sdk_at_least())
    {
      if (-[NSMutableDictionary objectForKey:](v5, "objectForKey:", CFSTR("__CurrentNSXMLParser")))
      {
        v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), CFSTR("NSXMLParser does not support reentrant parsing."));
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v6, 0));
      }
    }
    -[NSMutableDictionary setObject:forKey:](-[NSThread threadDictionary](+[NSThread currentThread](NSThread, "currentThread"), "threadDictionary"), "setObject:forKey:", a3, CFSTR("__CurrentNSXMLParser"));
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](v4, "removeObjectForKey:", CFSTR("__CurrentNSXMLParser"));
  }
}

- (BOOL)parseData:(id)a3
{
  uint64_t v5;
  BOOL v6;
  int v7;
  int v8;
  NSData *bomChunk;
  NSData *v10;
  id v11;
  _xmlSAXHandler *saxHandler;
  xmlParserCtxtPtr PushParserCtxt;
  int v14;
  int v15;
  uint64_t v16;
  void *v17;
  NSAssertionHandler *v20;
  const char *Name;
  objc_class *v22;

  if ((self->_parserFlags & 0x40) == 0)
  {
    v20 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
    Name = sel_getName(a2);
    v22 = (objc_class *)objc_opt_class();
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSXMLParser.m"), 488, CFSTR("%s should only be called on an incremental %@"), Name, NSStringFromClass(v22));
  }
  xmlSetStructuredErrorFunc(self, (xmlStructuredErrorFunc)_structuredErrorFunc);
  if (self->_haveDetectedEncoding)
  {
    v5 = xmlParseChunk(self->_parserContext, (const char *)objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"), 0);
    if (self->_shouldStopXMLParser)
    {
      self->_shouldStopXMLParser = 0;
      xmlStopParser(self->_parserContext);
      if (v5 >= -1)
        v5 = -1;
    }
    v6 = -[NSXMLParser _handleParseResult:](self, "_handleParseResult:", v5);
  }
  else
  {
    v7 = -[NSData length](self->_bomChunk, "length");
    v8 = objc_msgSend(a3, "length") + v7;
    bomChunk = self->_bomChunk;
    if (v8 > 3)
    {
      if (bomChunk)
      {
        v11 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
        objc_msgSend(v11, "appendData:", self->_bomChunk);
        objc_msgSend(v11, "appendData:", a3);
      }
      else
      {
        v11 = a3;
      }
      if (self->_delegate)
        saxHandler = self->_saxHandler;
      else
        saxHandler = 0;
      PushParserCtxt = xmlCreatePushParserCtxt(saxHandler, self, (const char *)objc_msgSend(v11, "bytes"), 4, 0);
      self->_parserContext = PushParserCtxt;
      if (-[NSXMLParser shouldResolveExternalEntities](self, "shouldResolveExternalEntities"))
        v14 = 7;
      else
        v14 = 3;
      if (saxHandler)
        v15 = v14;
      else
        v15 = v14 | 0x60;
      xmlCtxtUseOptions(PushParserCtxt, v15);
      self->_haveDetectedEncoding = 1;

      self->_bomChunk = 0;
      if (v8 >= 5)
      {
        v16 = objc_msgSend(v11, "bytes") + 4;
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v16, (v8 - 4), 0);
        -[NSXMLParser parseData:](self, "parseData:", v17);

      }
    }
    else if (bomChunk)
    {
      v10 = (NSData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
      -[NSData appendData:](v10, "appendData:", self->_bomChunk);
      -[NSData appendData:](v10, "appendData:", a3);

      self->_bomChunk = v10;
    }
    else
    {
      self->_bomChunk = (NSData *)a3;
    }
    v6 = 1;
  }
  xmlSetStructuredErrorFunc(0, 0);
  return v6;
}

- (BOOL)_handleParseResult:(int64_t)a3
{
  NSError *v5;
  xmlErrorPtr LastError;

  if (!a3)
    return 1;
  if (a3 != -1)
    goto LABEL_7;
  if (_CFExecutableLinkedOnOrAfter())
  {
    if (self->_delegateAborted)
    {
      v5 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSXMLParserErrorDomain"), 512, 0);
      -[NSXMLParser _setExpandedParserError:](self, "_setExpandedParserError:", v5);
      -[NSXMLParser delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(-[NSXMLParser delegate](self, "delegate"), "parser:parseErrorOccurred:", self, v5);
      return 0;
    }
LABEL_7:
    LastError = xmlCtxtGetLastError(self->_parserContext);
    if (LastError && LastError->code == a3)
      -[NSXMLParser _setExpandedParserError:](self, "_setExpandedParserError:", _NSErrorFromXMLError((uint64_t)LastError, (uint64_t)self));
    else
      -[NSXMLParser _setParserError:](self, "_setParserError:", a3);
    return 0;
  }
  return 1;
}

- (BOOL)shouldResolveExternalEntities
{
  return (LOBYTE(self->_parserFlags) >> 4) & 1;
}

- (BOOL)finishIncrementalParse
{
  return -[NSXMLParser _handleParseResult:](self, "_handleParseResult:", xmlParseChunk(self->_parserContext, 0, 0, 1));
}

- (void)_popNamespaces
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = -[NSMutableArray count](self->_namespaces, "count") - 1;
  v4 = (void *)-[NSMutableArray objectAtIndex:](self->_namespaces, "objectAtIndex:", v3);
  if ((objc_msgSend(v4, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null")) & 1) == 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(self->_delegate, "parser:didEndMappingPrefix:", self, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
      }
      while (v6);
    }
  }
  -[NSMutableArray removeObjectAtIndex:](self->_namespaces, "removeObjectAtIndex:", v3);
}

- (NSXMLParser)initWithContentsOfURL:(NSURL *)url
{
  void *v5;
  NSXMLParser *v6;
  uint64_t v7;

  if (-[NSXMLParser isMemberOfClass:](self, "isMemberOfClass:", NSXMLParser)
    && -[NSURL isFileURL](url, "isFileURL"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DB0]), "initWithURL:", url);
    v6 = -[NSXMLParser initWithStream:](self, "initWithStream:", v5);

  }
  else
  {
    v7 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", url);
    if (!v7)
      v7 = objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v6 = -[NSXMLParser initWithData:](self, "initWithData:", v7);
  }
  v6->_url = url;
  return v6;
}

- (NSXMLParser)initWithStream:(NSInputStream *)stream
{
  NSXMLParser *v4;
  NSXMLParser *v5;

  v4 = -[NSXMLParser initForIncrementalParsing](self, "initForIncrementalParsing");
  v5 = v4;
  if (v4)
  {
    v4->_parserFlags |= 0x80uLL;
    v4->xmlParserStream = stream;
  }
  return v5;
}

- (id)initForIncrementalParsing
{
  id result;

  result = -[NSXMLParser initWithData:](self, "initWithData:", 0);
  if (result)
    *((_QWORD *)result + 5) &= ~0x80uLL;
  return result;
}

- (NSXMLParser)initWithData:(NSData *)data
{
  NSXMLParser *v5;
  uint64_t v6;
  objc_super v8;
  CFDictionaryKeyCallBacks keyCallBacks;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (_NSSetupLibXML_xmlInitGuard != -1)
    dispatch_once(&_NSSetupLibXML_xmlInitGuard, &__block_literal_global_56);
  v8.receiver = self;
  v8.super_class = (Class)NSXMLParser;
  v5 = -[NSXMLParser init](&v8, sel_init);
  if (v5)
  {
    v5->_saxHandler = (_xmlSAXHandler *)malloc_type_malloc(0x100uLL, 0x1080040AADF51B8uLL);
    v5->_parserContext = 0;
    v5->_parserFlags = 0;
    v5->_error = 0;
    memset(&keyCallBacks, 0, 32);
    *(_OWORD *)&keyCallBacks.equal = xmmword_1E0F514E8;
    v5->_slowStringMap = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &keyCallBacks, MEMORY[0x1E0C9B3A0]);
    if (!_CFExecutableLinkedOnOrAfter())
      v5->_parserFlags |= 0x20uLL;
    -[NSXMLParser _initializeSAX2Callbacks](v5, "_initializeSAX2Callbacks");
    v5->_parserFlags |= 0xC0uLL;
    v5->_namespaces = 0;
    if (data)
    {
      v5->xmlParserStream = (NSInputStream *)(id)objc_msgSend(MEMORY[0x1E0C99DB0], "inputStreamWithData:", data);
      if (-[NSData length](data, "length") >> 20)
        v6 = 0x100000;
      else
        v6 = -[NSData length](data, "length");
    }
    else
    {
      v6 = 32 * *MEMORY[0x1E0C85AD8];
    }
    v5->_chunkSize = v6;
  }
  return v5;
}

- (void)_initializeSAX2Callbacks
{
  _xmlSAXHandler *saxHandler;

  saxHandler = self->_saxHandler;
  *(_OWORD *)&saxHandler->internalSubset = 0u;
  *(_OWORD *)&saxHandler->hasInternalSubset = 0u;
  *(_OWORD *)&saxHandler->resolveEntity = 0u;
  *(_OWORD *)&saxHandler->entityDecl = 0u;
  *(_OWORD *)&saxHandler->attributeDecl = 0u;
  *(_OWORD *)&saxHandler->unparsedEntityDecl = 0u;
  *(_OWORD *)&saxHandler->startDocument = 0u;
  *(_OWORD *)&saxHandler->startElement = 0u;
  *(_OWORD *)&saxHandler->_private = 0u;
  *(_OWORD *)&saxHandler->endElementNs = 0u;
  *(_OWORD *)&saxHandler->getParameterEntity = 0u;
  *(_OWORD *)&saxHandler->externalSubset = 0u;
  *(_OWORD *)&saxHandler->comment = 0u;
  *(_OWORD *)&saxHandler->error = 0u;
  *(_OWORD *)&saxHandler->reference = 0u;
  *(_OWORD *)&saxHandler->ignorableWhitespace = 0u;
  saxHandler->internalSubset = (internalSubsetSAXFunc)_internalSubset2;
  saxHandler->isStandalone = (isStandaloneSAXFunc)_isStandalone;
  saxHandler->hasInternalSubset = (hasInternalSubsetSAXFunc)_hasInternalSubset2;
  saxHandler->hasExternalSubset = (hasExternalSubsetSAXFunc)_hasExternalSubset2;
  saxHandler->getEntity = (getEntitySAXFunc)_getEntity;
  saxHandler->entityDecl = (entityDeclSAXFunc)_entityDecl;
  saxHandler->notationDecl = (notationDeclSAXFunc)_notationDecl;
  saxHandler->attributeDecl = (attributeDeclSAXFunc)_attributeDecl;
  saxHandler->elementDecl = (elementDeclSAXFunc)_elementDecl;
  saxHandler->unparsedEntityDecl = (unparsedEntityDeclSAXFunc)_unparsedEntityDecl;
  saxHandler->setDocumentLocator = 0;
  saxHandler->startDocument = (startDocumentSAXFunc)_startDocument;
  saxHandler->endDocument = (endDocumentSAXFunc)_endDocument;
  saxHandler->startElement = 0;
  saxHandler->startElementNs = (startElementNsSAX2Func)_startElementNs;
  saxHandler->endElementNs = (endElementNsSAX2Func)_endElementNs;
  saxHandler->reference = 0;
  saxHandler->characters = (charactersSAXFunc)_characters;
  saxHandler->ignorableWhitespace = 0;
  saxHandler->processingInstruction = (processingInstructionSAXFunc)_processingInstruction;
  saxHandler->endElement = 0;
  saxHandler->comment = (commentSAXFunc)_comment;
  saxHandler->warning = 0;
  saxHandler->error = (errorSAXFunc)_errorCallback;
  saxHandler->fatalError = 0;
  saxHandler->cdataBlock = (cdataBlockSAXFunc)_cdataBlock;
  saxHandler->externalSubset = (externalSubsetSAXFunc)_externalSubset2;
  saxHandler->serror = 0;
  saxHandler->initialized = -554844497;
}

- (void)setDelegate:(id)delegate
{
  char v4;
  unint64_t v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;

  self->_delegate = delegate;
  v4 = objc_opt_respondsToSelector();
  v5 = 0xFFFFFFFF80000000;
  if ((v4 & 1) == 0)
    v5 = 0;
  self->_parserFlags = v5 & 0xFFFFFFFF80000000 | self->_parserFlags & 0x7FFFFFFF;
  v6 = objc_opt_respondsToSelector();
  v7 = 0x40000000;
  if ((v6 & 1) == 0)
    v7 = 0;
  self->_parserFlags = self->_parserFlags & 0xFFFFFFFFBFFFFFFFLL | v7;
  v8 = objc_opt_respondsToSelector();
  v9 = 0x20000000;
  if ((v8 & 1) == 0)
    v9 = 0;
  self->_parserFlags = self->_parserFlags & 0xFFFFFFFFDFFFFFFFLL | v9;
}

- (void)dealloc
{
  unint64_t parserFlags;
  _xmlParserCtxt *parserContext;
  __CFDictionary *slowStringMap;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  parserFlags = self->_parserFlags;

  free(self->_saxHandler);
  parserContext = self->_parserContext;
  if (parserContext)
  {
    if (parserContext->myDoc)
    {
      xmlFreeDoc(parserContext->myDoc);
      parserContext = self->_parserContext;
    }
    xmlFreeParserCtxt(parserContext);
  }

  slowStringMap = self->_slowStringMap;
  if (slowStringMap)
    CFRelease(slowStringMap);

  if ((parserFlags & 0x80) != 0)
  v6.receiver = self;
  v6.super_class = (Class)NSXMLParser;
  -[NSXMLParser dealloc](&v6, sel_dealloc);
}

- (void)setShouldProcessNamespaces:(BOOL)shouldProcessNamespaces
{
  uint64_t v3;

  if (!self->_parserContext)
  {
    v3 = 4;
    if (!shouldProcessNamespaces)
      v3 = 0;
    self->_parserFlags = self->_parserFlags & 0xFFFFFFFFFFFFFFFBLL | v3;
  }
}

- (void)setShouldReportNamespacePrefixes:(BOOL)shouldReportNamespacePrefixes
{
  uint64_t v3;

  if (!self->_parserContext)
  {
    v3 = 8;
    if (!shouldReportNamespacePrefixes)
      v3 = 0;
    self->_parserFlags = self->_parserFlags & 0xFFFFFFFFFFFFFFF7 | v3;
  }
}

- (void)setShouldResolveExternalEntities:(BOOL)shouldResolveExternalEntities
{
  uint64_t v3;

  if (!self->_parserContext)
  {
    v3 = 16;
    if (!shouldResolveExternalEntities)
      v3 = 0;
    self->_parserFlags = self->_parserFlags & 0xFFFFFFFFFFFFFFEFLL | v3;
  }
}

- (NSSet)allowedExternalEntityURLs
{
  return self->_allowedEntityURLs;
}

- (void)setAllowedExternalEntityURLs:(NSSet *)allowedExternalEntityURLs
{
  NSSet *allowedEntityURLs;
  NSSet *v6;

  allowedEntityURLs = self->_allowedEntityURLs;
  if (allowedEntityURLs != allowedExternalEntityURLs)
  {
    v6 = allowedEntityURLs;
    self->_allowedEntityURLs = (NSSet *)-[NSSet copy](allowedExternalEntityURLs, "copy");
  }
}

- (void)setExternalEntityResolvingPolicy:(NSXMLParserExternalEntityResolvingPolicy)externalEntityResolvingPolicy
{
  self->_externalEntityResolvingPolicy = externalEntityResolvingPolicy;
}

- (NSXMLParserExternalEntityResolvingPolicy)externalEntityResolvingPolicy
{
  return self->_externalEntityResolvingPolicy;
}

- (_xmlParserInput)_xmlExternalEntityWithURL:(const char *)a3 identifier:(const char *)a4 context:(_xmlParserCtxt *)a5 originalLoaderFunction:(void *)a6
{
  NSXMLParserExternalEntityResolvingPolicy v10;
  uint64_t v11;
  NSSet *v12;
  NSSet *v13;
  NSString *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSURL *url;
  NSString *v19;
  char v20;

  v10 = -[NSXMLParser externalEntityResolvingPolicy](self, "externalEntityResolvingPolicy");
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("NSXMLParserRestoreOldExternalEntityBehavior")))v11 = 3;
  else
    v11 = v10;
  v12 = -[NSXMLParser allowedExternalEntityURLs](self, "allowedExternalEntityURLs");
  if (!v12)
    goto LABEL_13;
  v13 = v12;
  v14 = -[NSString initWithUTF8String:]([NSString alloc], "initWithUTF8String:", a3);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v14);
  if (objc_msgSend((id)objc_msgSend(v15, "scheme"), "isEqualToString:", CFSTR("file")))
  {
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", objc_msgSend(v15, "path"));

    v15 = (void *)v16;
  }

  if (!v15)
    goto LABEL_13;
  v17 = -[NSSet member:](v13, "member:", v15);
  if (!v17 && v11 == 2)
  {
    url = self->_url;
    if (!url)
      goto LABEL_28;
    goto LABEL_18;
  }

  if (!v17)
  {
LABEL_13:
    if (!v11)
      return 0;
    if (v11 == 1)
      return xmlNoNetExternalEntityLoader(a3, a4, a5);
    if (v11 != 2)
      return (_xmlParserInput *)((uint64_t (*)(const char *, const char *, _xmlParserCtxt *))a6)(a3, a4, a5);
    url = self->_url;
    if (!url)
    {
      v15 = 0;
LABEL_28:

      return (_xmlParserInput *)((uint64_t (*)(const char *, const char *, _xmlParserCtxt *))a6)(a3, a4, a5);
    }
    v19 = -[NSString initWithUTF8String:]([NSString alloc], "initWithUTF8String:", a3);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v19);

    if (v15)
    {
LABEL_18:
      if (!objc_msgSend((id)objc_msgSend(v15, "host"), "isEqualToString:", -[NSURL host](url, "host"))
        || (objc_msgSend(v15, "port") || -[NSURL port](url, "port"))
        && (objc_msgSend((id)objc_msgSend(v15, "port"), "isEqualToNumber:", -[NSURL port](url, "port")) & 1) == 0)
      {

      }
      else
      {
        v20 = objc_msgSend((id)objc_msgSend(v15, "scheme"), "isEqualToString:", -[NSURL scheme](url, "scheme"));

        if ((v20 & 1) != 0)
          return (_xmlParserInput *)((uint64_t (*)(_QWORD, _QWORD, _QWORD))a6)(a3, a4, a5);
      }
      return 0;
    }
  }
  return (_xmlParserInput *)((uint64_t (*)(_QWORD, _QWORD, _QWORD))a6)(a3, a4, a5);
}

+ (id)currentParser
{
  return (id)-[NSMutableDictionary objectForKey:](-[NSThread threadDictionary](+[NSThread currentThread](NSThread, "currentThread"), "threadDictionary"), "objectForKey:", CFSTR("__CurrentNSXMLParser"));
}

- (BOOL)shouldProcessNamespaces
{
  return (LOBYTE(self->_parserFlags) >> 2) & 1;
}

- (BOOL)shouldReportNamespacePrefixes
{
  return (LOBYTE(self->_parserFlags) >> 3) & 1;
}

- (void)setShouldContinueAfterFatalError:(BOOL)a3
{
  uint64_t v3;

  if (!self->_parserContext)
  {
    v3 = 32;
    if (!a3)
      v3 = 0;
    self->_parserFlags = self->_parserFlags & 0xFFFFFFFFFFFFFFDFLL | v3;
  }
}

- (BOOL)shouldContinueAfterFatalError
{
  return (LOBYTE(self->_parserFlags) >> 5) & 1;
}

- (void)abortParsing
{
  _xmlParserCtxt *parserContext;

  parserContext = self->_parserContext;
  if (parserContext)
  {
    xmlStopParser(parserContext);
    self->_delegateAborted = 1;
  }
}

- (NSError)parserError
{
  return self->_error;
}

- (NSString)publicID
{
  return 0;
}

- (NSString)systemID
{
  return 0;
}

- (NSInteger)lineNumber
{
  NSInteger result;

  result = (NSInteger)self->_parserContext;
  if (result)
    return xmlSAX2GetLineNumber((void *)result);
  return result;
}

- (NSInteger)columnNumber
{
  NSInteger result;

  result = (NSInteger)self->_parserContext;
  if (result)
    return xmlSAX2GetColumnNumber((void *)result);
  return result;
}

- (void)_setExpandedParserError:(id)a3
{
  NSError *error;
  NSError *v6;

  error = self->_error;
  if (error)
    v6 = error;
  self->_error = (NSError *)a3;
}

- (void)_setParserError:(int64_t)a3
{
  -[NSXMLParser _setExpandedParserError:](self, "_setExpandedParserError:", -[NSError initWithDomain:code:userInfo:]([NSError alloc], "initWithDomain:code:userInfo:", CFSTR("NSXMLParserErrorDomain"), a3, 0));
}

- (void)_pushNamespaces:(id)a3
{
  NSMutableArray *namespaces;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  namespaces = self->_namespaces;
  if (!namespaces)
  {
    namespaces = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    self->_namespaces = namespaces;
    if (a3)
      goto LABEL_3;
LABEL_13:
    -[NSMutableArray addObject:](namespaces, "addObject:", objc_msgSend(MEMORY[0x1E0C99E38], "null"));
    return;
  }
  if (!a3)
    goto LABEL_13;
LABEL_3:
  -[NSMutableArray addObject:](namespaces, "addObject:", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(a3);
          objc_msgSend(self->_delegate, "parser:didStartMappingPrefix:toURI:", self, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9), objc_msgSend(a3, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9)));
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
      }
      while (v7);
    }
  }
}

@end
