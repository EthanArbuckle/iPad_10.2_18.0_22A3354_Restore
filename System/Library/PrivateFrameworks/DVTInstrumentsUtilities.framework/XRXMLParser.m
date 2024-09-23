@implementation XRXMLParser

+ (id)commonXMLSchemaRepositoryURL
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend_bundleWithIdentifier_(MEMORY[0x24BDD1488], a2, (uint64_t)CFSTR("com.apple.dt.instruments.DVTInstrumentsUtilities"), v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resourceURL(v4, v5, v6, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
    sub_22636FBEC();
  v10 = (void *)v9;

  return v10;
}

+ (BOOL)parseStream:(id)a3 topLevelParser:(id)a4 delegate:(id)a5
{
  id v7;
  id v8;
  id v9;
  XRXMLParser *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  char v31;
  id v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t maxLength;
  BOOL v46;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = [XRXMLParser alloc];
  v14 = (void *)objc_msgSend_initWithTopLevelParser_(v10, v11, (uint64_t)v8, v12, v13);
  objc_msgSend_setDelegate_(v14, v15, (uint64_t)v9, v16, v17);
  if (!objc_msgSend_streamStatus(v7, v18, v19, v20, v21))
    objc_msgSend_open(v7, v22, v23, v24, v25);
  objc_msgSend_dataWithLength_(MEMORY[0x24BDBCEC8], v22, *MEMORY[0x24BDB03C8], v24, v25);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 1;
  while (1)
  {
    if ((v31 & 1) != 0 && objc_msgSend_streamStatus(v7, v26, v27, v28, v29) != 2)
    {
LABEL_10:
      v46 = 1;
      goto LABEL_12;
    }
    v32 = objc_retainAutorelease(v30);
    v37 = objc_msgSend_mutableBytes(v32, v33, v34, v35, v36);
    v42 = objc_msgSend_length(v32, v38, v39, v40, v41);
    maxLength = objc_msgSend_read_maxLength_(v7, v43, v37, v42, v44);
    if (maxLength < 1)
      break;
    v31 = objc_msgSend_parseData_(v14, v26, (uint64_t)v32, v28, v29);
LABEL_9:
    if ((objc_msgSend_hasBytesAvailable(v7, v26, v27, v28, v29) & 1) == 0)
      goto LABEL_10;
  }
  if ((maxLength & 0x8000000000000000) == 0)
    goto LABEL_9;
  v46 = 0;
LABEL_12:
  objc_msgSend_finishedParsing(v14, v26, v27, v28, v29);

  return v46;
}

- (XRXMLParser)init
{

  return 0;
}

- (XRXMLParser)initWithTopLevelParser:(id)a3
{
  id v5;
  XRXMLParser *v6;
  XRXMLParser *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)XRXMLParser;
  v6 = -[XRXMLParser init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_topLevelElementParser, a3);
    }
    else
    {

      v7 = 0;
    }
  }

  return v7;
}

- (BOOL)parseData:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSXMLParser *parser;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSXMLParser *v14;
  NSXMLParser *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;

  v7 = a3;
  parser = self->_parser;
  if (!parser)
  {
    v9 = objc_alloc(MEMORY[0x24BDD1978]);
    v14 = (NSXMLParser *)objc_msgSend_initForIncrementalParsing(v9, v10, v11, v12, v13);
    v15 = self->_parser;
    self->_parser = v14;

    objc_msgSend_setDelegate_(self->_parser, v16, (uint64_t)self, v17, v18);
    parser = self->_parser;
  }
  v19 = objc_msgSend_parseData_(parser, v4, (uint64_t)v7, v5, v6);

  return v19;
}

- (void)finishedParsing
{
  ((void (*)(NSXMLParser *, char *))MEMORY[0x24BEDD108])(self->_parser, sel_finishIncrementalParse);
}

- (void)setDelegate:(id)a3
{
  XRXMLParserDelegate **p_delegate;
  id v5;

  p_delegate = &self->_delegate;
  v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  LOBYTE(p_delegate) = objc_opt_respondsToSelector();

  self->_delegateWantsFinishedCB = p_delegate & 1;
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  XRXMLElementParser *workingElement;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  XRXMLElementParser *topLevelElementParser;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;

  v34 = a3;
  v10 = a4;
  v15 = a7;
  workingElement = self->_workingElement;
  if (workingElement)
  {
    v17 = objc_msgSend_lineNumber(v34, v11, v12, v13, v14);
    v22 = objc_msgSend_columnNumber(v34, v18, v19, v20, v21);
    objc_msgSend_startElementWithName_attributes_line_col_(workingElement, v23, (uint64_t)v10, (uint64_t)v15, v17, v22);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
      objc_storeStrong((id *)&self->_workingElement, v28);
    else
      objc_msgSend_abortParsing(self->_parser, v24, v25, v26, v27);

  }
  else
  {
    objc_storeStrong((id *)&self->_workingElement, self->_topLevelElementParser);
    topLevelElementParser = self->_topLevelElementParser;
    self->_topLevelElementParser = 0;

    objc_msgSend__handleStart(self->_workingElement, v30, v31, v32, v33);
  }

}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  ((void (*)(XRXMLElementParser *, char *, id, id))MEMORY[0x24BEDD108])(self->_workingElement, sel_processCharacters_, a4, a4);
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  XRXMLElementParser *workingElement;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  XRXMLElementParser *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  XRXMLElementParser *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  XRXMLElementParser *v30;

  workingElement = self->_workingElement;
  v8 = a3;
  v13 = objc_msgSend_lineNumber(v8, v9, v10, v11, v12);
  v18 = objc_msgSend_columnNumber(v8, v14, v15, v16, v17);

  objc_msgSend_endElementAtLine_col_(workingElement, v19, v13, v18, v20);
  v21 = (XRXMLElementParser *)objc_claimAutoreleasedReturnValue();
  v26 = self->_workingElement;
  v30 = v21;
  if (v21)
  {
    if (v21 != v26 && self->_delegateWantsFinishedCB)
    {
      objc_msgSend_delegate(self, v22, v23, v24, v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_parser_didFinishParsingElement_(v27, v28, (uint64_t)self, (uint64_t)self->_workingElement, v29);

      v21 = v30;
    }
    v21 = v21;
    v26 = self->_workingElement;
  }
  self->_workingElement = v21;

}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  objc_msgSend_handleIssue_type_from_(self->_issueResponder, a2, (uint64_t)a4, 0, (uint64_t)self);
}

- (XRXMLParserDelegate)delegate
{
  return (XRXMLParserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (XRIssueResponder)issueResponder
{
  return self->_issueResponder;
}

- (void)setIssueResponder:(id)a3
{
  objc_storeStrong((id *)&self->_issueResponder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_issueResponder, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_topLevelElementParser, 0);
  objc_storeStrong((id *)&self->_workingElement, 0);
  objc_storeStrong((id *)&self->_parser, 0);
}

@end
