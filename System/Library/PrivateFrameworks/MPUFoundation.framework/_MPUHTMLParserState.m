@implementation _MPUHTMLParserState

- (void)_startDocument
{
  void *v3;
  void *v4;

  if ((*(_BYTE *)&self->_delegateCapabilites & 1) != 0)
  {
    -[MPUHTMLParserDelegate defaultAttributesForParser:](self->_delegate, "defaultAttributesForParser:", self->_parser);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = v3;
      -[NSMutableArray addObject:](self->_attributeDictionaries, "addObject:", v3);
      v3 = v4;
    }

  }
}

- (void)_startElement:(const char *)a3 attrs:(const char *)a4
{
  void *v6;
  void *v7;
  id v8;
  char delegateCapabilites;
  void *v10;
  id v11;
  const char *v12;
  const char **v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  void *v19;
  id v20;

  _MPUHTMLStringFromXMLString((uint64_t)a3, 1);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](self->_tagStack, "addObject:");
  -[NSMutableArray lastObject](self->_stringStack, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPUHTMLParserState _appendString:](self, "_appendString:", v6);
  -[NSMutableArray lastObject](self->_stringStack, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setString:", &stru_24DD6E4D8);

  v8 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  -[NSMutableArray addObject:](self->_stringStack, "addObject:", v8);
  delegateCapabilites = (char)self->_delegateCapabilites;
  if ((delegateCapabilites & 4) != 0)
  {
    -[MPUHTMLParserDelegate parser:prependStringForTagName:](self->_delegate, "parser:prependStringForTagName:", self->_parser, v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v8, "appendString:", v10);

    delegateCapabilites = (char)self->_delegateCapabilites;
  }
  if ((delegateCapabilites & 2) != 0)
  {
    if (a4)
    {
      v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v12 = *a4;
      if (*a4)
      {
        v13 = a4 + 2;
        do
        {
          v14 = (uint64_t)*(v13 - 1);
          if (!v14)
            break;
          _MPUHTMLStringFromXMLString(v14, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          _MPUHTMLStringFromXMLString((uint64_t)v12, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setValue:forKey:", v15, v16);

          v17 = *v13;
          v13 += 2;
          v12 = v17;
        }
        while (v17);
      }
    }
    else
    {
      v11 = 0;
    }
    -[MPUHTMLParserDelegate parser:attributesForTagName:tagAttributes:currentState:](self->_delegate, "parser:attributesForTagName:tagAttributes:currentState:", self->_parser, v20, v11, self);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      v19 = v18;
    else
      v19 = (void *)MEMORY[0x24BDBD1B8];
    -[NSMutableArray addObject:](self->_attributeDictionaries, "addObject:", v19);

  }
}

- (void)_endElement:(const char *)a3
{
  id v4;

  -[NSMutableArray lastObject](self->_stringStack, "lastObject", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_MPUHTMLParserState _appendString:](self, "_appendString:", v4);
  -[NSMutableArray removeLastObject](self->_attributeDictionaries, "removeLastObject");
  -[NSMutableArray removeLastObject](self->_tagStack, "removeLastObject");
  -[NSMutableArray removeLastObject](self->_stringStack, "removeLastObject");

}

- (void)_characters:(const char *)a3 length:(int)a4
{
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a3, a4, 4);
  -[NSMutableArray lastObject](self->_stringStack, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v6);

}

- (void)_error:(int64_t)a3 msg:(const char *)a4 args:(char *)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  NSMutableArray *errors;
  NSMutableArray *v16;
  NSMutableArray *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v8 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%s"), 0, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BDD1540];
  v18 = *MEMORY[0x24BDD0FC8];
  v19[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.music.htmlparsererror"), a3, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = CFSTR("WARNING");
  if (a3 == 2)
    v14 = CFSTR("FATAL");
  if (a3 == 1)
    v14 = CFSTR("ERROR");
  NSLog(CFSTR("XML %@: %@"), v14, v10);
  errors = self->_errors;
  if (!errors)
  {
    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v17 = self->_errors;
    self->_errors = v16;

    errors = self->_errors;
  }
  -[NSMutableArray addObject:](errors, "addObject:", v13);

}

- (void)_appendString:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    -[_MPUHTMLParserState currentTagAttributes](self, "currentTagAttributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v6, v4);
    -[NSMutableAttributedString appendAttributedString:](self->_attributedString, "appendAttributedString:", v5);

  }
}

- (id)currentTagAttributes
{
  id v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_attributeDictionaries;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        objc_msgSend(v3, "addEntriesFromDictionary:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++), (_QWORD)v10);
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

- (_MPUHTMLParserState)initWithParser:(id)a3 data:(id)a4
{
  id v7;
  id v8;
  _MPUHTMLParserState *v9;
  _MPUHTMLParserState *v10;
  uint64_t v11;
  MPUHTMLParserDelegate *delegate;
  char v13;
  char v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_MPUHTMLParserState;
  v9 = -[_MPUHTMLParserState init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_selfRef = v9;
    objc_storeStrong((id *)&v9->_parser, a3);
    objc_storeStrong((id *)&v10->_data, a4);
    objc_msgSend(v7, "delegate");
    v11 = objc_claimAutoreleasedReturnValue();
    delegate = v10->_delegate;
    v10->_delegate = (MPUHTMLParserDelegate *)v11;

    *(_BYTE *)&v10->_delegateCapabilites = *(_BYTE *)&v10->_delegateCapabilites & 0xFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = 2;
    else
      v13 = 0;
    *(_BYTE *)&v10->_delegateCapabilites = *(_BYTE *)&v10->_delegateCapabilites & 0xFD | v13;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = 4;
    else
      v14 = 0;
    *(_BYTE *)&v10->_delegateCapabilites = *(_BYTE *)&v10->_delegateCapabilites & 0xFB | v14;
  }

  return v10;
}

- (BOOL)parse:(id *)a3
{
  NSMutableAttributedString *v5;
  NSMutableAttributedString *attributedString;
  NSMutableArray *v7;
  NSMutableArray *attributeDictionaries;
  NSMutableArray *v9;
  NSMutableArray *tagStack;
  NSMutableArray *v11;
  NSMutableArray *stringStack;
  xmlChar *v13;
  const char *CharEncodingName;
  void *v15;
  void *v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  id *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v5 = (NSMutableAttributedString *)objc_alloc_init(MEMORY[0x24BDD1688]);
  attributedString = self->_attributedString;
  self->_attributedString = v5;

  v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  attributeDictionaries = self->_attributeDictionaries;
  self->_attributeDictionaries = v7;

  v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  tagStack = self->_tagStack;
  self->_tagStack = v9;

  v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  stringStack = self->_stringStack;
  self->_stringStack = v11;

  v13 = xmlCharStrndup((const char *)-[NSData bytes](self->_data, "bytes"), -[NSData length](self->_data, "length"));
  CharEncodingName = xmlGetCharEncodingName(XML_CHAR_ENCODING_UTF8);
  if (_MPUHTMLParserStateSAXInitSharedHandler_onceToken != -1)
    dispatch_once(&_MPUHTMLParserStateSAXInitSharedHandler_onceToken, &__block_literal_global_173);
  htmlSAXParseDoc(v13, CharEncodingName, (htmlSAXHandlerPtr)_MPUHTMLParserStateSAXInitSharedHandler___gMPUHTMLParserStateSAXHandler, self->_selfRef);
  xmlCleanupParser();
  ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v13);
  if (a3)
  {
    if (-[NSMutableArray count](self->_errors, "count"))
    {
      v15 = (void *)MEMORY[0x24BDD1540];
      v27 = CFSTR("errors");
      v16 = (void *)-[NSMutableArray copy](self->_errors, "copy");
      v28[0] = v16;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.music.htmlparsererror"), 0, v17);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v18 = self->_errors;
      a3 = (id *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (a3)
      {
        v19 = *(_QWORD *)v23;
        while (2)
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v23 != v19)
              objc_enumerationMutation(v18);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v20), "code", (_QWORD)v22))
            {
              LOBYTE(a3) = 1;
              goto LABEL_15;
            }
            v20 = (id *)((char *)v20 + 1);
          }
          while (a3 != v20);
          a3 = (id *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          if (a3)
            continue;
          break;
        }
      }
LABEL_15:

    }
    else
    {
      LOBYTE(a3) = 0;
    }
  }
  return (char)a3;
}

- (id)attributedString
{
  return (id)-[NSMutableAttributedString copy](self->_attributedString, "copy");
}

- (id)tagStack
{
  return (id)-[NSMutableArray copy](self->_tagStack, "copy");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringStack, 0);
  objc_storeStrong((id *)&self->_tagStack, 0);
  objc_storeStrong((id *)&self->_attributeDictionaries, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_parser, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
