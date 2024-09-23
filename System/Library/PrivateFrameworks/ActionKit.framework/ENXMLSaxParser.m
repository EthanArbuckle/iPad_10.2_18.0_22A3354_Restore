@implementation ENXMLSaxParser

- (ENXMLSaxParser)init
{
  ENXMLSaxParser *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSArray *dtds;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ENXMLSaxParser;
  v2 = -[ENXMLSaxParser init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDBCE30]);
    +[ENXMLDTD lat1DTD](ENXMLDTD, "lat1DTD");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[ENXMLDTD symbolDTD](ENXMLDTD, "symbolDTD");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[ENXMLDTD specialDTD](ENXMLDTD, "specialDTD");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v3, "initWithObjects:", v4, v5, v6, 0);
    dtds = v2->_dtds;
    v2->_dtds = (NSArray *)v7;

  }
  return v2;
}

- (void)dealloc
{
  NSArray *dtds;
  objc_super v4;

  objc_storeWeak((id *)&self->_delegate, 0);
  -[ENXMLSaxParser stopParser](self, "stopParser");
  dtds = self->_dtds;
  self->_dtds = 0;

  v4.receiver = self;
  v4.super_class = (Class)ENXMLSaxParser;
  -[ENXMLSaxParser dealloc](&v4, sel_dealloc);
}

- (_xmlEntity)lookupEntity:(const char *)a3
{
  char *v3;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  _xmlEntity *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = (char *)a3;
  v18 = *MEMORY[0x24BDAC8D0];
  if (a3)
    v3 = (char *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a3, strlen(a3), 4);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_dtds;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "xmlEntityNamed:", v3, (_QWORD)v13);
        if (v10)
        {
          v11 = (_xmlEntity *)v10;
          goto LABEL_13;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_13:

  return v11;
}

- (_xmlSAXHandler)saxHandler
{
  id WeakRetained;
  void *v5;
  char v6;
  _xmlSAXHandler *result;
  id v8;

  *(_OWORD *)&retstr->_private = 0u;
  *(_OWORD *)&retstr->endElementNs = 0u;
  *(_OWORD *)&retstr->getParameterEntity = 0u;
  *(_OWORD *)&retstr->externalSubset = 0u;
  *(_OWORD *)&retstr->comment = 0u;
  *(_OWORD *)&retstr->error = 0u;
  *(_OWORD *)&retstr->reference = 0u;
  *(_OWORD *)&retstr->ignorableWhitespace = 0u;
  *(_OWORD *)&retstr->startDocument = 0u;
  *(_OWORD *)&retstr->startElement = 0u;
  *(_OWORD *)&retstr->attributeDecl = 0u;
  *(_OWORD *)&retstr->unparsedEntityDecl = 0u;
  *(_OWORD *)&retstr->resolveEntity = 0u;
  *(_OWORD *)&retstr->entityDecl = 0u;
  *(_OWORD *)&retstr->internalSubset = 0u;
  *(_OWORD *)&retstr->hasInternalSubset = 0u;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      retstr->comment = (commentSAXFunc)commentBlockSAXCallback;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      retstr->characters = (charactersSAXFunc)charactersSAXCallback;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      retstr->startDocument = (startDocumentSAXFunc)startDocumentSAXCallback;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      retstr->endDocument = (endDocumentSAXFunc)endDocumentSAXCallback;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      retstr->startElement = (startElementSAXFunc)startElementSAXCallback;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      retstr->endElement = (endElementSAXFunc)endElementSAXCallback;
    v6 = objc_opt_respondsToSelector();
    v5 = v8;
    if ((v6 & 1) != 0)
      retstr->cdataBlock = (cdataBlockSAXFunc)cdataBlockSAXCallback;
  }
  retstr->getEntity = (getEntitySAXFunc)getEntitySAXCallback;
  retstr->error = (errorSAXFunc)errorCallback;
  retstr->fatalError = (fatalErrorSAXFunc)fatalErrorCallback;

  return result;
}

- (void)appendBytes:(char *)a3 length:(int)a4
{
  _xmlParserCtxt *parserContext;
  xmlParserCtxtPtr v8;
  xmlSAXHandler v9;

  parserContext = self->_parserContext;
  if (parserContext)
  {
    if (self->_isHTML)
      htmlParseChunk(parserContext, a3, a4, 0);
    else
      xmlParseChunk(parserContext, a3, a4, 0);
  }
  else
  {
    -[ENXMLSaxParser saxHandler](self, "saxHandler", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0);
    if (self->_isHTML)
    {
      self->_parserContext = htmlCreatePushParserCtxt(&v9, self, a3, a4, 0, XML_CHAR_ENCODING_UTF8);
    }
    else
    {
      v8 = xmlCreatePushParserCtxt(&v9, self, a3, a4, 0);
      self->_parserContext = v8;
      xmlCtxtUseOptions(v8, 1);
    }
  }
}

- (void)appendData:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");

  -[ENXMLSaxParser appendBytes:length:](self, "appendBytes:length:", v5, v6);
}

- (void)finalizeParser
{
  _xmlParserCtxt *parserContext;

  parserContext = self->_parserContext;
  if (parserContext)
  {
    if (self->_isHTML)
      htmlParseChunk(parserContext, 0, 0, 1);
    else
      xmlParseChunk(parserContext, 0, 0, 1);
    xmlFreeParserCtxt(self->_parserContext);
    self->_parserContext = 0;
    self->_parserHalted = 1;
  }
}

- (BOOL)parseContentsOfFile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  size_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  id v23;

  v4 = a3;
  -[ENXMLSaxParser delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v6, "attributesOfItemAtPath:error:", v4, &v23);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v23;

    if (v7)
    {
      if (objc_msgSend(v7, "fileSize"))
      {
        -[ENXMLSaxParser stopParser](self, "stopParser");
        objc_msgSend(MEMORY[0x24BDBCE90], "inputStreamWithFileAtPath:", v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          objc_msgSend(v9, "open");
          self->_parserHalted = 0;
          v11 = getpagesize();
          v12 = malloc_type_calloc(v11, 1uLL, 0xEEA8271FuLL);
          while (!self->_parserHalted)
          {
            v13 = objc_msgSend(v10, "read:maxLength:", v12, v11);
            v14 = v13;
            if ((v13 & 0x80000000) != 0)
            {
              +[ENSession sharedSession](ENSession, "sharedSession");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "logger");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("read:maxLength: returned: %i"), v14);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "evernoteLogInfoString:", v20);

LABEL_16:
              self->_parserHalted = 1;
              break;
            }
            if (!(_DWORD)v13)
              goto LABEL_16;
            -[ENXMLSaxParser appendBytes:length:](self, "appendBytes:length:", v12, v13);
          }
          free(v12);
          -[ENXMLSaxParser finalizeParser](self, "finalizeParser");
          objc_msgSend(v10, "close");
          v15 = 1;
          goto LABEL_18;
        }
LABEL_14:
        v15 = 0;
LABEL_18:

        goto LABEL_19;
      }
      +[ENSession sharedSession](ENSession, "sharedSession");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logger");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The file %@ is 0 bytes!"), v4, v22);
    }
    else
    {
      +[ENSession sharedSession](ENSession, "sharedSession");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logger");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("attributesOfItemAtPath:%@ returned error:%@"), v4, v8);
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "evernoteLogErrorString:", v17);

    goto LABEL_14;
  }
  v15 = 0;
LABEL_19:

  return v15;
}

- (BOOL)parseData:(id)a3
{
  id v4;

  v4 = a3;
  -[ENXMLSaxParser stopParser](self, "stopParser");
  -[ENXMLSaxParser appendData:](self, "appendData:", v4);

  -[ENXMLSaxParser finalizeParser](self, "finalizeParser");
  return 1;
}

- (BOOL)parseContents:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[ENXMLSaxParser stopParser](self, "stopParser");
  objc_msgSend(v4, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ENXMLSaxParser appendData:](self, "appendData:", v5);
  -[ENXMLSaxParser finalizeParser](self, "finalizeParser");
  return 1;
}

- (BOOL)parseContentsOfURLWithRequest:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  NSURLConnection *v9;
  NSURLConnection *urlConnection;
  NSURLConnection *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  NSURLConnection *v16;

  v4 = a3;
  -[ENXMLSaxParser delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0;
  if (v4 && v5)
  {
    v7 = -[ENXMLSaxParser stopParser](self, "stopParser");
    self->_parserHalted = 0;
    v8 = (void *)MEMORY[0x22E315218](v7);
    v9 = (NSURLConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDB7478]), "initWithRequest:delegate:", v4, self);
    urlConnection = self->_urlConnection;
    self->_urlConnection = v9;

    v11 = self->_urlConnection;
    v6 = v11 != 0;
    if (v11)
    {
      objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *MEMORY[0x24BDBCA90];
      -[NSURLConnection scheduleInRunLoop:forMode:](self->_urlConnection, "scheduleInRunLoop:forMode:", v12, *MEMORY[0x24BDBCA90]);
      -[NSURLConnection start](self->_urlConnection, "start");
      do
      {
        if (self->_parserHalted)
          break;
        objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v12, "runMode:beforeDate:", v13, v14);

      }
      while ((v15 & 1) != 0);
      -[ENXMLSaxParser finalizeParser](self, "finalizeParser");
      -[NSURLConnection cancel](self->_urlConnection, "cancel");
      -[NSURLConnection unscheduleFromRunLoop:forMode:](self->_urlConnection, "unscheduleFromRunLoop:forMode:", v12, v13);
      v16 = self->_urlConnection;
      self->_urlConnection = 0;

    }
    objc_autoreleasePoolPop(v8);
  }

  return v6;
}

- (BOOL)parseContentsOfURL:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  BOOL v7;

  v4 = a3;
  if (objc_msgSend(v4, "isFileURL"))
  {
    objc_msgSend(v4, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = -[ENXMLSaxParser parseContentsOfFile:](self, "parseContentsOfFile:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDB74A0], "requestWithURL:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = -[ENXMLSaxParser parseContentsOfURLWithRequest:](self, "parseContentsOfURLWithRequest:", v5);
  }
  v7 = v6;

  return v7;
}

- (void)stopParser
{
  NSURLConnection *urlConnection;
  NSURLConnection *v4;
  _xmlParserCtxt *parserContext;

  urlConnection = self->_urlConnection;
  if (urlConnection)
  {
    -[NSURLConnection cancel](urlConnection, "cancel");
    v4 = self->_urlConnection;
    self->_urlConnection = 0;

  }
  parserContext = self->_parserContext;
  if (parserContext)
    xmlStopParser(parserContext);
  self->_parserHalted = 1;
}

- (void)_stopAndSendError:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "parser:didFailWithError:", self, v5);
  -[ENXMLSaxParser stopParser](self, "stopParser");

}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  -[ENXMLSaxParser _stopAndSendError:](self, "_stopAndSendError:", a4);
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "statusCode") != 200)
  {
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v7, CFSTR("response"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ENXMLSaxParserErrorDomain"), 1002, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENXMLSaxParser _stopAndSendError:](self, "_stopAndSendError:", v6);

  }
}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
  -[ENXMLSaxParser appendData:](self, "appendData:", a4);
}

- (ENXMLSaxParserDelegate)delegate
{
  return (ENXMLSaxParserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isHTML
{
  return self->_isHTML;
}

- (void)setIsHTML:(BOOL)a3
{
  self->_isHTML = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dtds, 0);
  objc_storeStrong((id *)&self->_urlConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
