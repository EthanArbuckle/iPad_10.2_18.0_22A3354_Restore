@implementation AMSUIMarkdownParser

+ (void)initialize
{
  objc_super v3;

  if ((id)objc_opt_class() == a1)
    xmlInitParser();
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___AMSUIMarkdownParser;
  objc_msgSendSuper2(&v3, sel_initialize);
}

- (AMSUIMarkdownParser)initWithString:(id)a3
{
  id v4;
  AMSUIMarkdownParser *v5;
  uint64_t v6;
  NSString *string;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSUIMarkdownParser;
  v5 = -[AMSUIMarkdownParser init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    string = v5->_string;
    v5->_string = (NSString *)v6;

  }
  return v5;
}

- (AMSUIMarkdownParser)init
{
  -[AMSUIMarkdownParser doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)reportErrorWithCode:(unint64_t)a3 userInfo:(id)a4
{
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("AppleMediaServicesUI.MarkdownParser.errorDomain"), a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSUIMarkdownParser delegate](self, "delegate");
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
    v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a3->line);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, CFSTR("AppleMediaServicesUI.MarkdownParser.errorLineNumber"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a3->int2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("AppleMediaServicesUI.MarkdownParser.errorColumn"));

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", a3->message);
    if (v7)
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BDD0FC8]);
    -[AMSUIMarkdownParser reportErrorWithCode:userInfo:](self, "reportErrorWithCode:userInfo:", a3->code, v8);

  }
}

- (void)parse
{
  void *v3;
  id v4;
  const char *v5;
  void *v6;
  unint64_t v7;
  AMSUIMarkdownParser *v8;
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
  xmlErrorPtr LastError;
  xmlDoc *myDoc;
  __int128 v22;
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

  -[AMSUIMarkdownParser delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AMSUIMarkdownParser string](self, "string");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = (const char *)objc_msgSend(v4, "UTF8String");

    if (!v5
      || (-[AMSUIMarkdownParser string](self, "string"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "lengthOfBytesUsingEncoding:", 4),
          v6,
          v7 >> 31))
    {
      v8 = self;
      v9 = -101;
LABEL_5:
      -[AMSUIMarkdownParser reportErrorWithCode:userInfo:](v8, "reportErrorWithCode:userInfo:", v9, 0);
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
    v34 = xmmword_24CB4FFB8;
    v35 = unk_24CB4FFC8;
    v36 = xmmword_24CB4FFD8;
    v37 = unk_24CB4FFE8;
    v30 = xmmword_24CB4FF78;
    v31 = unk_24CB4FF88;
    v32 = xmmword_24CB4FF98;
    v33 = *(_OWORD *)&off_24CB4FFA8;
    v26 = xmmword_24CB4FF38;
    v27 = unk_24CB4FF48;
    v28 = xmmword_24CB4FF58;
    v29 = *(_OWORD *)&off_24CB4FF68;
    v22 = xmmword_24CB4FEF8;
    v23 = unk_24CB4FF08;
    v24 = xmmword_24CB4FF18;
    v25 = unk_24CB4FF28;
    sax = MemoryParserCtxt->sax;
    if (sax)
      ((void (*)(_xmlSAXHandler *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))*MEMORY[0x24BEDE758])(sax, v11, v12, v13, v14, v15, v16, v17, v22, *((_QWORD *)&v22 + 1), v23, *((_QWORD *)&v23 + 1), v24, *((_QWORD *)&v24 + 1), v25, *((_QWORD *)&v25 + 1), v26, *((_QWORD *)&v26 + 1), v27,
        *((_QWORD *)&v27 + 1),
        v28,
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
        *((_QWORD *)&v33 + 1));
    v18->sax = (_xmlSAXHandler *)&v22;
    v18->userData = self;
    v18->encoding = (const xmlChar *)"UTF-8";
    v18->charset = 1;
    htmlCtxtUseOptions(v18, 10305);
    -[AMSUIMarkdownParser set_parserContext:](self, "set_parserContext:", v18);
    if (htmlParseDocument(v18))
    {
      LastError = xmlCtxtGetLastError(-[AMSUIMarkdownParser _parserContext](self, "_parserContext"));
      if (LastError)
        -[AMSUIMarkdownParser reportParseError:](self, "reportParseError:", LastError);
    }
    myDoc = v18->myDoc;
    if (myDoc)
      xmlFreeDoc(myDoc);
    v18->encoding = 0;
    v18->charset = 0;
    v18->sax = 0;
    v18->userData = 0;
    xmlFreeParserCtxt(v18);
    -[AMSUIMarkdownParser set_parserContext:](self, "set_parserContext:", 0);
  }
}

- (NSString)string
{
  return self->_string;
}

- (AMSUIMarkdownParserDelegate)delegate
{
  return (AMSUIMarkdownParserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
