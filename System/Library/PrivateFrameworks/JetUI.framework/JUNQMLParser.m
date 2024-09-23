@implementation JUNQMLParser

+ (void)initialize
{
  objc_super v3;

  if ((id)objc_opt_class() == a1)
    xmlInitParser();
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___JUNQMLParser;
  objc_msgSendSuper2(&v3, sel_initialize);
}

- (JUNQMLParser)initWithString:(id)a3 behavior:(unint64_t)a4
{
  id v6;
  JUNQMLParser *v7;
  uint64_t v8;
  NSString *string;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)JUNQMLParser;
  v7 = -[JUNQMLParser init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    string = v7->_string;
    v7->_string = (NSString *)v8;

    v7->_behavior = a4;
  }

  return v7;
}

- (JUNQMLParser)init
{
  -[JUNQMLParser doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)reportErrorWithCode:(unint64_t)a3 userInfo:(id)a4
{
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("JetUI.NQMLParser.errorDomain"), a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[JUNQMLParser delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parser:parseErrorOccurred:", self, v6);

}

- (void)reportParseError:(_xmlError *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (a3->level == XML_ERR_FATAL)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3->line);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, CFSTR("JetUI.NQMLParser.errorLineNumber"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3->int2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("JetUI.NQMLParser.errorColumn"));

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", a3->message);
    if (v7)
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CB2D50]);
    -[JUNQMLParser reportErrorWithCode:userInfo:](self, "reportErrorWithCode:userInfo:", a3->code, v8);

  }
}

- (void)parse
{
  void *v3;
  id v4;
  const char *v5;
  void *v6;
  unint64_t v7;
  JUNQMLParser *v8;
  uint64_t v9;
  htmlParserCtxtPtr MemoryParserCtxt;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  xmlParserCtxt *v18;
  _xmlSAXHandler *sax;
  int v20;
  xmlDoc *myDoc;
  xmlErrorPtr LastError;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;

  -[JUNQMLParser delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[JUNQMLParser string](self, "string");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = (const char *)objc_msgSend(v4, "UTF8String");

    if (!v5
      || (-[JUNQMLParser string](self, "string"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "lengthOfBytesUsingEncoding:", 4),
          v6,
          v7 >> 31))
    {
      v8 = self;
      v9 = -101;
LABEL_5:
      -[JUNQMLParser reportErrorWithCode:userInfo:](v8, "reportErrorWithCode:userInfo:", v9, 0);
      return;
    }
    MemoryParserCtxt = htmlCreateMemoryParserCtxt(v5, v7);
    if (!MemoryParserCtxt)
    {
      v8 = self;
      v9 = -100;
      goto LABEL_5;
    }
    v18 = MemoryParserCtxt;
    v35 = xmmword_1E5BFD3D8;
    v36 = unk_1E5BFD3E8;
    v37 = xmmword_1E5BFD3F8;
    v38 = unk_1E5BFD408;
    v31 = xmmword_1E5BFD398;
    v32 = unk_1E5BFD3A8;
    v33 = xmmword_1E5BFD3B8;
    v34 = *(_OWORD *)&off_1E5BFD3C8;
    v27 = xmmword_1E5BFD358;
    v28 = unk_1E5BFD368;
    v29 = xmmword_1E5BFD378;
    v30 = *(_OWORD *)&off_1E5BFD388;
    v23 = xmmword_1E5BFD318;
    v24 = unk_1E5BFD328;
    v25 = xmmword_1E5BFD338;
    v26 = unk_1E5BFD348;
    sax = MemoryParserCtxt->sax;
    if (sax)
      ((void (*)(_xmlSAXHandler *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))*MEMORY[0x1E0DE8D30])(sax, v11, v12, v13, v14, v15, v16, v17, v23, *((_QWORD *)&v23 + 1), v24, *((_QWORD *)&v24 + 1), v25, *((_QWORD *)&v25 + 1), v26, *((_QWORD *)&v26 + 1), v27, *((_QWORD *)&v27 + 1), v28,
        *((_QWORD *)&v28 + 1),
        v29,
        *((_QWORD *)&v29 + 1),
        v30,
        *((_QWORD *)&v30 + 1),
        v31,
        *((_QWORD *)&v31 + 1),
        v32,
        *((_QWORD *)&v32 + 1),
        v33,
        *((_QWORD *)&v33 + 1),
        v34,
        *((_QWORD *)&v34 + 1));
    v18->sax = (_xmlSAXHandler *)&v23;
    v18->userData = self;
    v18->encoding = (const xmlChar *)"UTF-8";
    v18->charset = 1;
    htmlCtxtUseOptions(v18, 10305);
    -[JUNQMLParser set_parserContext:](self, "set_parserContext:", v18);
    v20 = htmlParseDocument(v18);
    myDoc = v18->myDoc;
    if (myDoc)
      xmlFreeDoc(myDoc);
    if (v20)
    {
      LastError = xmlCtxtGetLastError(-[JUNQMLParser _parserContext](self, "_parserContext"));
      if (LastError)
        -[JUNQMLParser reportParseError:](self, "reportParseError:", LastError);
    }
    v18->encoding = 0;
    v18->charset = 0;
    v18->sax = 0;
    v18->userData = 0;
    xmlFreeParserCtxt(v18);
    -[JUNQMLParser set_parserContext:](self, "set_parserContext:", 0);
  }
}

- (NSString)string
{
  return self->_string;
}

- (unint64_t)behavior
{
  return self->_behavior;
}

- (JUNQMLParserDelegate)delegate
{
  return (JUNQMLParserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_xmlParserCtxt)_parserContext
{
  return self->__parserContext;
}

- (void)set_parserContext:(_xmlParserCtxt *)a3
{
  self->__parserContext = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_string, 0);
}

@end
