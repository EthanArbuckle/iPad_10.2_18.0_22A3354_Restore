@implementation WPXMLRPCDecoder

- (WPXMLRPCDecoder)initWithData:(id)a3
{
  id v5;
  WPXMLRPCDecoder *v6;
  WPXMLRPCDecoder *v7;
  uint64_t v8;
  NSXMLParser *parser;
  WPXMLRPCDecoderDelegate *delegate;
  WPXMLRPCDecoder *v11;

  v5 = a3;
  if (v5)
  {
    v6 = -[WPXMLRPCDecoder init](self, "init");
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_body, a3);
      objc_storeStrong((id *)&v7->_originalData, a3);
      v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1978]), "initWithData:", v5);
      parser = v7->_parser;
      v7->_parser = (NSXMLParser *)v8;

      delegate = v7->_delegate;
      v7->_delegate = 0;

      v7->_isFault = 0;
      -[WPXMLRPCDecoder parse](v7, "parse");
    }
    self = v7;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)parse
{
  void *v3;
  WPXMLRPCDataCleaner *v4;
  NSData *v5;
  NSData *body;
  NSXMLParser *v7;
  NSXMLParser *parser;
  void *v9;
  void *v10;
  void *v11;
  id object;
  void *v13;
  id v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  -[NSXMLParser setDelegate:](self->_parser, "setDelegate:", self);
  -[NSXMLParser parse](self->_parser, "parse");
  -[NSXMLParser parserError](self->_parser, "parserError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[WPXMLRPCDataCleaner initWithData:]([WPXMLRPCDataCleaner alloc], "initWithData:", self->_originalData);
    -[WPXMLRPCDataCleaner cleanData](v4, "cleanData");
    v5 = (NSData *)objc_claimAutoreleasedReturnValue();
    body = self->_body;
    self->_body = v5;

    v7 = (NSXMLParser *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1978]), "initWithData:", self->_body);
    parser = self->_parser;
    self->_parser = v7;

    -[NSXMLParser setDelegate:](self->_parser, "setDelegate:", self);
    -[NSXMLParser parse](self->_parser, "parse");

  }
  -[NSXMLParser parserError](self->_parser, "parserError");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    if (self->_methodName)
    {
      v16[0] = self->_methodName;
      v15[0] = CFSTR("methodName");
      v15[1] = CFSTR("params");
      -[WPXMLRPCDecoderDelegate elementValue](self->_delegate, "elementValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16[1] = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      object = self->_object;
      self->_object = v11;

    }
    else
    {
      -[WPXMLRPCDecoderDelegate elementValue](self->_delegate, "elementValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = self->_object;
      self->_object = v13;

    }
  }
}

- (void)abortParsing
{
  -[NSXMLParser abortParsing](self->_parser, "abortParsing");
}

- (BOOL)isFault
{
  return self->_isFault;
}

- (int64_t)faultCode
{
  void *v3;
  int64_t v4;

  if (!-[WPXMLRPCDecoder isFault](self, "isFault"))
    return 0;
  objc_msgSend(self->_object, "objectForKey:", CFSTR("faultCode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (id)faultString
{
  void *v3;

  if (-[WPXMLRPCDecoder isFault](self, "isFault"))
  {
    objc_msgSend(self->_object, "objectForKey:", CFSTR("faultString"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)error
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  void *v14;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  -[NSXMLParser parserError](self->_parser, "parserError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", self->_originalData, 4);
    if (v4)
    {
      v17 = 0;
      objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("Allowed memory size of \\d+ bytes exhausted"), 1, &v17);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v17;
      if (objc_msgSend(v5, "numberOfMatchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length")))
      {
        v7 = (void *)MEMORY[0x24BDD1540];
        v22 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Your site ran out of memory while processing this request"), &stru_24F8BBA48, CFSTR("WPXMLRPC"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = v9;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("WPXMLRPCError"), 1, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
        goto LABEL_13;
      }

    }
    -[NSXMLParser parserError](self->_parser, "parserError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!-[WPXMLRPCDecoder isFault](self, "isFault"))
    {
      if (self->_object)
        return 0;
      v16 = (void *)MEMORY[0x24BDD1540];
      v18 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("The data doesn't look like a valid XML-RPC response"), &stru_24F8BBA48, CFSTR("WPXMLRPC"));
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v19 = v6;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("WPXMLRPCError"), 0, v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    v12 = (void *)MEMORY[0x24BDD1540];
    v13 = -[WPXMLRPCDecoder faultCode](self, "faultCode");
    v20 = *MEMORY[0x24BDD0FC8];
    -[WPXMLRPCDecoder faultString](self, "faultString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("WPXMLRPCFaultError"), v13, v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_13:

  return v11;
}

- (id)object
{
  return self->_object;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_methodName, 0);
  objc_storeStrong(&self->_object, 0);
  objc_storeStrong((id *)&self->_originalData, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_parser, 0);
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  WPXMLRPCDecoderDelegate *v8;
  WPXMLRPCDecoderDelegate *delegate;
  NSMutableString *v10;
  NSMutableString *methodName;
  id v12;

  v12 = a4;
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("fault")))
  {
    self->_isFault = 1;
  }
  else if (objc_msgSend(v12, "isEqualToString:", CFSTR("value")))
  {
    v8 = -[WPXMLRPCDecoderDelegate initWithParent:]([WPXMLRPCDecoderDelegate alloc], "initWithParent:", 0);
    delegate = self->_delegate;
    self->_delegate = v8;

    -[NSXMLParser setDelegate:](self->_parser, "setDelegate:", self->_delegate);
  }
  else if (objc_msgSend(v12, "isEqualToString:", CFSTR("methodName")))
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v10 = (NSMutableString *)objc_claimAutoreleasedReturnValue();
    methodName = self->_methodName;
    self->_methodName = v10;

  }
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  WPXMLRPCDecoderDelegate *v7;
  WPXMLRPCDecoderDelegate *delegate;

  if (objc_msgSend(a4, "isEqualToString:", CFSTR("methodName")))
  {
    v7 = -[WPXMLRPCDecoderDelegate initWithParent:]([WPXMLRPCDecoderDelegate alloc], "initWithParent:", 0);
    delegate = self->_delegate;
    self->_delegate = v7;

    -[NSXMLParser setDelegate:](self->_parser, "setDelegate:", self->_delegate);
  }
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  -[NSMutableString appendString:](self->_methodName, "appendString:", a4);
}

@end
