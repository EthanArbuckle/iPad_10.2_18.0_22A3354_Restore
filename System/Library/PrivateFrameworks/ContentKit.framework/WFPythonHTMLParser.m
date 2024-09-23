@implementation WFPythonHTMLParser

- (WFPythonHTMLParser)init
{
  WFPythonHTMLParser *v2;
  uint64_t v3;
  NSRegularExpression *incompleteExpression;
  uint64_t v5;
  NSRegularExpression *entityrefExpression;
  uint64_t v7;
  NSRegularExpression *charrefExpression;
  uint64_t v9;
  NSRegularExpression *startTagOpenExpression;
  uint64_t v11;
  NSRegularExpression *commentCloseExpression;
  uint64_t v13;
  NSRegularExpression *tagFindExpression;
  uint64_t v15;
  NSRegularExpression *attributeFindExpression;
  uint64_t v17;
  NSRegularExpression *locateStartTagEndExpression;
  uint64_t v19;
  NSRegularExpression *endEndTagExpression;
  uint64_t v21;
  NSRegularExpression *endTagFindExpression;
  WFPythonHTMLParser *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)WFPythonHTMLParser;
  v2 = -[WFPythonHTMLParser init](&v25, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("&[a-zA-Z#]"), 0, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    incompleteExpression = v2->_incompleteExpression;
    v2->_incompleteExpression = (NSRegularExpression *)v3;

    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("&([a-zA-Z][-.a-zA-Z0-9]*)[^a-zA-Z0-9]"), 0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    entityrefExpression = v2->_entityrefExpression;
    v2->_entityrefExpression = (NSRegularExpression *)v5;

    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("&#(?:[0-9]+|[xX][0-9a-fA-F]+)[^0-9a-fA-F]"), 0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    charrefExpression = v2->_charrefExpression;
    v2->_charrefExpression = (NSRegularExpression *)v7;

    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("<[a-zA-Z]"), 0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    startTagOpenExpression = v2->_startTagOpenExpression;
    v2->_startTagOpenExpression = (NSRegularExpression *)v9;

    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("--\\s*>"), 0, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    commentCloseExpression = v2->_commentCloseExpression;
    v2->_commentCloseExpression = (NSRegularExpression *)v11;

    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("([a-zA-Z][^\\t\\n\\r\\f />\\x00]*)(?:\\s|/(?!>))*"), 0, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    tagFindExpression = v2->_tagFindExpression;
    v2->_tagFindExpression = (NSRegularExpression *)v13;

    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("((?<=['\"\\s/])[^\\s/>][^\\s/=>]*)(\\s*=+\\s*('[^']*'|\"[^\"]*\"|(?!['\"])[^>\\s]*))?(?:\\s|/(?!>))*"), 0, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    attributeFindExpression = v2->_attributeFindExpression;
    v2->_attributeFindExpression = (NSRegularExpression *)v15;

    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("<[a-zA-Z][^\\t\\n\\r\\f />\\x00]*(?:[\\s/]*(?:(?<=['\"\\s/])[^\\s/>][^\\s/=>]*(?:\\s*=+\\s*(?:'[^']*'|\"[^\"]*\"|(?!['\"])[^>\\s]*)(?:\\s*,)*)?(?:\\s|/(?!>))*)*)?\\s*"), 0, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    locateStartTagEndExpression = v2->_locateStartTagEndExpression;
    v2->_locateStartTagEndExpression = (NSRegularExpression *)v17;

    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR(">"), 0, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    endEndTagExpression = v2->_endEndTagExpression;
    v2->_endEndTagExpression = (NSRegularExpression *)v19;

    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("</\\s*([a-zA-Z][-.a-zA-Z0-9:_]*)\\s*"), 0, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    endTagFindExpression = v2->_endTagFindExpression;
    v2->_endTagFindExpression = (NSRegularExpression *)v21;

    -[WFPythonHTMLParser reset](v2, "reset");
    v23 = v2;
  }

  return v2;
}

- (NSRegularExpression)interestingExpression
{
  NSRegularExpression *interestingExpression;
  NSRegularExpression *v4;
  NSRegularExpression *v5;

  interestingExpression = self->_interestingExpression;
  if (!interestingExpression)
  {
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("[&<]"), 0, 0);
    v4 = (NSRegularExpression *)objc_claimAutoreleasedReturnValue();
    v5 = self->_interestingExpression;
    self->_interestingExpression = v4;

    interestingExpression = self->_interestingExpression;
  }
  return interestingExpression;
}

- (void)reset
{
  NSString *rawData;
  NSRegularExpression *interestingExpression;
  NSString *cdataElement;

  rawData = self->_rawData;
  self->_rawData = (NSString *)&stru_24C4E3948;

  interestingExpression = self->_interestingExpression;
  self->_interestingExpression = 0;

  cdataElement = self->_cdataElement;
  self->_cdataElement = 0;

  *(_OWORD *)&self->_currentLineNumber = xmmword_20BC9B420;
}

- (void)feed:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WFPythonHTMLParser rawData](self, "rawData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFPythonHTMLParser setRawData:](self, "setRawData:", v6);
  -[WFPythonHTMLParser parseDataAndEnd:](self, "parseDataAndEnd:", 0);
}

- (void)close
{
  -[WFPythonHTMLParser parseDataAndEnd:](self, "parseDataAndEnd:", 1);
}

- (void)setCdataElement:(id)a3
{
  NSString *v4;
  NSString *cdataElement;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (NSString *)objc_msgSend(v9, "copy");
  cdataElement = self->_cdataElement;
  self->_cdataElement = v4;

  if (v9)
  {
    v6 = (void *)MEMORY[0x24BDD1798];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("</\\s*%@\\s*>"), v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "regularExpressionWithPattern:options:error:", v7, 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFPythonHTMLParser setInterestingExpression:](self, "setInterestingExpression:", v8);

  }
  else
  {
    -[WFPythonHTMLParser setInterestingExpression:](self, "setInterestingExpression:", 0);
  }

}

- (void)parseDataAndEnd:(BOOL)a3
{
  WFPythonHTMLParser *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  WFPythonHTMLParser *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  WFPythonHTMLParser *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v58;
  void *v59;
  _BOOL4 v60;
  void *v61;
  id v62;

  v60 = a3;
  v3 = self;
  -[WFPythonHTMLParser rawData](self, "rawData");
  v62 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v62, "length");
  v5 = 0;
  while (v4 > v5)
  {
    -[WFPythonHTMLParser interestingExpression](v3, "interestingExpression");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstMatchInString:options:range:", v62, 0, v5, v4 - v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = objc_msgSend(v7, "range");
    }
    else
    {
      -[WFPythonHTMLParser cdataElement](v3, "cdataElement");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v4;
      if (v9)
      {
        v7 = 0;
        goto LABEL_64;
      }
    }
    if (v8 > v5)
    {
      objc_msgSend(v62, "substringWithRange:", v5, v8 - v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFPythonHTMLParser handleData:](v3, "handleData:", v10);

    }
    v11 = -[WFPythonHTMLParser updatePosition:j:](v3, "updatePosition:j:", v5, v8);
    if (v11 == v4)
    {
      v5 = v4;
LABEL_64:

      break;
    }
    v5 = v11;
    objc_msgSend(v62, "substringFromIndex:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v7;
    if (objc_msgSend(v12, "hasPrefix:", CFSTR("<")))
    {
      -[WFPythonHTMLParser startTagOpenExpression](v3, "startTagOpenExpression");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "numberOfMatchesInString:options:range:", v12, 4, 0, objc_msgSend(v12, "length"));

      if (v14)
      {
        v15 = -[WFPythonHTMLParser parseStartTag:](v3, "parseStartTag:", v5);
        goto LABEL_41;
      }
      if (objc_msgSend(v12, "hasPrefix:", CFSTR("</")))
      {
        v15 = -[WFPythonHTMLParser parseEndTag:](v3, "parseEndTag:", v5);
        goto LABEL_41;
      }
      if (objc_msgSend(v12, "hasPrefix:", CFSTR("<!--")))
      {
        v15 = -[WFPythonHTMLParser parseComment:](v3, "parseComment:", v5);
        goto LABEL_41;
      }
      if (objc_msgSend(v12, "hasPrefix:", CFSTR("<?")))
      {
        v15 = -[WFPythonHTMLParser parseProcessingInstruction:](v3, "parseProcessingInstruction:", v5);
        goto LABEL_41;
      }
      if (objc_msgSend(v12, "hasPrefix:", CFSTR("<!")))
      {
        v15 = -[WFPythonHTMLParser parseHTMLDeclaration:](v3, "parseHTMLDeclaration:", v5);
LABEL_41:
        v51 = v15;
        if (v15 < 0)
        {
LABEL_42:
          if (!v60)
            goto LABEL_63;
          if (objc_msgSend(v62, "rangeOfString:options:range:", CFSTR(">"), 0, 1, objc_msgSend(v62, "length") - 1) == 0x7FFFFFFFFFFFFFFFLL)
          {
            v52 = objc_msgSend(v62, "rangeOfString:options:range:", CFSTR("<"), 0, 1, objc_msgSend(v62, "length") - 1);
            if (v52 == 0x7FFFFFFFFFFFFFFFLL)
              v51 = v5 + 1;
            else
              v51 = v52;
          }
          else
          {
            v51 = v5 + 1;
          }
          objc_msgSend(v62, "substringWithRange:", v5, v51 - v5);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFPythonHTMLParser handleData:](v3, "handleData:", v53);

        }
      }
      else
      {
        v51 = v5 + 1;
        if (v5 + 1 >= v4)
        {
LABEL_63:

          goto LABEL_64;
        }
        -[WFPythonHTMLParser handleData:](v3, "handleData:", CFSTR("<"));
        if (v51 < 0)
          goto LABEL_42;
      }
      v5 = -[WFPythonHTMLParser updatePosition:j:](v3, "updatePosition:j:", v5, v51);
      goto LABEL_50;
    }
    if (objc_msgSend(v12, "hasPrefix:", CFSTR("&#")))
    {
      -[WFPythonHTMLParser charrefExpression](v3, "charrefExpression");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "firstMatchInString:options:range:", v62, 4, v5, objc_msgSend(v62, "length") - v5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v18 = objc_msgSend(v17, "range");
        objc_msgSend(v62, "substringWithRange:", v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 2;
        objc_msgSend(v20, "substringWithRange:", 2, objc_msgSend(v20, "length") - 3);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFPythonHTMLParser handleCharacterRef:](v3, "handleCharacterRef:", v58);
        v22 = objc_msgSend(v17, "range");
        objc_msgSend(v17, "range");
        v59 = v17;
        v23 = v4;
        v24 = v3;
        v26 = v25 + v22;
        v27 = v25 + v22 - 1;
        objc_msgSend(v62, "substringFromIndex:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "hasPrefix:", CFSTR(";"));

        if (v29)
          v30 = v26;
        else
          v30 = v27;
        v3 = v24;
        v4 = v23;
        v17 = v59;
        v5 = -[WFPythonHTMLParser updatePosition:j:](v3, "updatePosition:j:", v5, v30);

      }
      else
      {
        if (objc_msgSend(v62, "rangeOfString:options:range:", CFSTR(";"), 0, v5, objc_msgSend(v62, "length") - v5) != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v62, "substringWithRange:", v5, 2);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFPythonHTMLParser handleData:](v3, "handleData:", v44);

          v5 = -[WFPythonHTMLParser updatePosition:j:](v3, "updatePosition:j:", v5, v5 + 2);
        }
        v21 = 3;
      }
      goto LABEL_58;
    }
    if (!objc_msgSend(v12, "hasPrefix:", CFSTR("&")))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("WFPythonHTMLParser.m"), 211, CFSTR("There is nothing interesting to consume!"));

LABEL_50:
      v21 = 0;
      goto LABEL_59;
    }
    -[WFPythonHTMLParser entityrefExpression](v3, "entityrefExpression");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "firstMatchInString:options:range:", v62, 4, v5, objc_msgSend(v62, "length") - v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v32 = objc_msgSend(v17, "rangeAtIndex:", 1);
      objc_msgSend(v62, "substringWithRange:", v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFPythonHTMLParser handleEntityRef:](v3, "handleEntityRef:", v34);
      v35 = objc_msgSend(v17, "range");
      objc_msgSend(v17, "range");
      v36 = v3;
      v38 = v37 + v35;
      v39 = v37 + v35 - 1;
      objc_msgSend(v62, "substringFromIndex:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "hasPrefix:", CFSTR(";"));

      if (v41)
        v42 = v38;
      else
        v42 = v39;
      v3 = v36;
      v5 = -[WFPythonHTMLParser updatePosition:j:](v36, "updatePosition:j:", v5, v42);

      v21 = 2;
      goto LABEL_58;
    }
    -[WFPythonHTMLParser incompleteExpression](v3, "incompleteExpression");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "firstMatchInString:options:range:", v62, 4, v5, objc_msgSend(v62, "length") - v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      if (!v60)
        goto LABEL_57;
      v46 = objc_msgSend(v17, "range");
      objc_msgSend(v62, "substringWithRange:", v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "substringFromIndex:", v5);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v48, "isEqualToString:", v49);

      if (v50)
      {
        objc_msgSend(v17, "range");
        objc_msgSend(v17, "range");
        v5 = -[WFPythonHTMLParser updatePosition:j:](v3, "updatePosition:j:", v5, v5 + 1);
      }
      v21 = 3;
      goto LABEL_58;
    }
    if (v5 + 1 >= v4)
    {
      v17 = 0;
LABEL_57:
      v21 = 3;
LABEL_58:

      goto LABEL_59;
    }
    -[WFPythonHTMLParser handleData:](v3, "handleData:", CFSTR("&"));
    v5 = -[WFPythonHTMLParser updatePosition:j:](v3, "updatePosition:j:", v5, v5 + 1);
    v21 = 0;
LABEL_59:

    if (v21 == 3)
      break;
  }
  if (v60 && v4 > v5)
  {
    -[WFPythonHTMLParser cdataElement](v3, "cdataElement");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v54)
    {
      objc_msgSend(v62, "substringWithRange:", v5, v4 - v5);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFPythonHTMLParser handleData:](v3, "handleData:", v55);

      v5 = -[WFPythonHTMLParser updatePosition:j:](v3, "updatePosition:j:", v5, v4);
    }
  }
  objc_msgSend(v62, "substringFromIndex:", v5);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPythonHTMLParser setRawData:](v3, "setRawData:", v56);

}

- (id)scanName:(int64_t)a3 declarationStartPosition:(int64_t)a4 location:(int64_t *)a5
{
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  int v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[WFPythonHTMLParser rawData](self, "rawData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "substringFromIndex:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "length");
  if (v11 == a3)
  {
    v12 = 0;
    *a5 = -1;
  }
  else
  {
    v13 = v11;
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("[a-zA-Z][-_.a-zA-Z0-9]*\\s*"), 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstMatchInString:options:range:", v10, 4, 0, objc_msgSend(v10, "length"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = objc_msgSend(v15, "range");
      objc_msgSend(v10, "substringWithRange:", v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringByTrimmingCharactersInSet:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v19, "length") + a3 == v13)
      {
        v12 = 0;
        *a5 = -1;
      }
      else
      {
        v23 = objc_msgSend(v16, "range") + a3;
        objc_msgSend(v16, "range");
        *a5 = v23 + v24;
        objc_msgSend(v21, "lowercaseString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      -[WFPythonHTMLParser updatePosition:j:](self, "updatePosition:j:", a4, a3);
      getWFGeneralLogObject();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v26 = 136315138;
        v27 = "-[WFPythonHTMLParser scanName:declarationStartPosition:location:]";
        _os_log_impl(&dword_20BBAD000, v22, OS_LOG_TYPE_ERROR, "%s Python HTML parser expected name token", (uint8_t *)&v26, 0xCu);
      }

      v12 = 0;
    }

  }
  return v12;
}

- (int64_t)parseMarkedSection:(int64_t)a3
{
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  const __CFString *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v18;
  uint64_t v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[WFPythonHTMLParser rawData](self, "rawData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "substringFromIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "hasPrefix:", CFSTR("<![")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFPythonHTMLParser.m"), 253, CFSTR("Unexpected call to -parseMarkedSection:"));

  }
  v19 = 0;
  -[WFPythonHTMLParser scanName:declarationStartPosition:location:](self, "scanName:declarationStartPosition:location:", a3 + 3, a3, &v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v19;
  if ((v19 & 0x8000000000000000) == 0)
  {
    if ((objc_msgSend(&unk_24C5124B8, "containsObject:", v8) & 1) != 0)
    {
      v10 = CFSTR("]\\s*]\\s*>");
    }
    else
    {
      if ((objc_msgSend(&unk_24C5124D0, "containsObject:", v8) & 1) == 0)
      {
        getWFGeneralLogObject();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v7, "substringWithRange:", 3, v19);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v21 = "-[WFPythonHTMLParser parseMarkedSection:]";
          v22 = 2112;
          v23 = v16;
          _os_log_impl(&dword_20BBAD000, v12, OS_LOG_TYPE_ERROR, "%s Unknown status keyword %@ in marked section", buf, 0x16u);

        }
        v9 = -1;
        goto LABEL_14;
      }
      v10 = CFSTR("]\\s*>");
    }
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", v10, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstMatchInString:options:range:", v7, 0, 3, objc_msgSend(v7, "length") - 3);
    v12 = objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v19 = -[NSObject range](v12, "range");
      objc_msgSend(v7, "substringWithRange:", 3, v19);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFPythonHTMLParser handleUnknownDeclaration:](self, "handleUnknownDeclaration:", v13);

      v14 = -[NSObject range](v12, "range") + a3;
      -[NSObject range](v12, "range");
      v9 = v14 + v15;
LABEL_14:

      goto LABEL_15;
    }
    v9 = -1;
  }
LABEL_15:

  return v9;
}

- (int64_t)parseComment:(int64_t)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  void *v15;

  -[WFPythonHTMLParser rawData](self, "rawData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "substringFromIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "hasPrefix:", CFSTR("<!--")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFPythonHTMLParser.m"), 284, CFSTR("Unexpected call to -parseComment:"));

  }
  -[WFPythonHTMLParser commentCloseExpression](self, "commentCloseExpression");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstMatchInString:options:range:", v7, 0, 4, objc_msgSend(v7, "length") - 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v7, "substringWithRange:", 4, objc_msgSend(v9, "range") - 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFPythonHTMLParser handleComment:](self, "handleComment:", v10);

    v11 = objc_msgSend(v9, "range") + a3;
    objc_msgSend(v9, "range");
    v13 = v11 + v12;
  }
  else
  {
    v13 = -1;
  }

  return v13;
}

- (int64_t)parseHTMLDeclaration:(int64_t)a3
{
  void *v5;
  void *v6;
  int64_t v7;
  int64_t v8;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  -[WFPythonHTMLParser rawData](self, "rawData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "substringFromIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "hasPrefix:", CFSTR("<!--")))
  {
    v7 = -[WFPythonHTMLParser parseComment:](self, "parseComment:", a3);
LABEL_7:
    v8 = v7;
    goto LABEL_8;
  }
  if (objc_msgSend(v6, "hasPrefix:", CFSTR("<![")))
  {
    v7 = -[WFPythonHTMLParser parseMarkedSection:](self, "parseMarkedSection:", a3);
    goto LABEL_7;
  }
  if (objc_msgSend(v6, "rangeOfString:options:", CFSTR("<!doctype"), 9) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = -[WFPythonHTMLParser parseBogusComment:](self, "parseBogusComment:", a3);
    goto LABEL_7;
  }
  v10 = objc_msgSend(v6, "rangeOfString:options:range:", CFSTR(">"), 0, 9, objc_msgSend(v6, "length") - 9);
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = -1;
  }
  else
  {
    v11 = v10;
    objc_msgSend(v6, "substringWithRange:", 2, v10 - 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFPythonHTMLParser handleDoctypeDeclaration:](self, "handleDoctypeDeclaration:", v12);

    v8 = a3 + v11 + 1;
  }
LABEL_8:

  return v8;
}

- (int64_t)parseBogusComment:(int64_t)a3
{
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  void *v11;
  void *v13;

  -[WFPythonHTMLParser rawData](self, "rawData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "substringFromIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "hasPrefix:", CFSTR("<!")) & 1) == 0 && (objc_msgSend(v7, "hasPrefix:", CFSTR("</")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFPythonHTMLParser.m"), 316, CFSTR("Unexpected call to -parseBogusComment"));

  }
  v8 = objc_msgSend(v7, "rangeOfString:options:range:", CFSTR(">"), 0, 2, objc_msgSend(v7, "length") - 2);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = -1;
  }
  else
  {
    v10 = v8;
    objc_msgSend(v7, "substringWithRange:", 2, v8 - 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFPythonHTMLParser handleComment:](self, "handleComment:", v11);

    v9 = a3 + v10 + 1;
  }

  return v9;
}

- (int64_t)parseProcessingInstruction:(int64_t)a3
{
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  void *v11;
  void *v13;

  -[WFPythonHTMLParser rawData](self, "rawData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "substringFromIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "hasPrefix:", CFSTR("<?")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFPythonHTMLParser.m"), 329, CFSTR("Unexpected call to -parseProcessingInstruction"));

  }
  v8 = objc_msgSend(v7, "rangeOfString:options:range:", CFSTR(">"), 0, 2, objc_msgSend(v7, "length") - 2);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = -1;
  }
  else
  {
    v10 = v8;
    objc_msgSend(v7, "substringWithRange:", 2, v8 - 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFPythonHTMLParser handleProcessingInstruction:](self, "handleProcessingInstruction:", v11);

    v9 = a3 + v10 + 1;
  }

  return v9;
}

- (int64_t)parseStartTag:(int64_t)a3
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  WFPythonHTMLAttribute *v31;
  void *v32;
  WFPythonHTMLAttribute *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  int64_t v43;
  void *v44;
  void *v45;
  int64_t v46;

  v46 = -[WFPythonHTMLParser checkForWholeStartTag:](self, "checkForWholeStartTag:");
  if ((v46 & 0x8000000000000000) == 0)
  {
    -[WFPythonHTMLParser rawData](self, "rawData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)objc_opt_new();
    -[WFPythonHTMLParser tagFindExpression](self, "tagFindExpression");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = a3;
    objc_msgSend(v7, "firstMatchInString:options:range:", v6, 4, a3 + 1, objc_msgSend(v6, "length") - (a3 + 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v8, "numberOfRanges") <= 1)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFPythonHTMLParser.m"), 349, CFSTR("Uh ohhhh"));

    }
    v9 = objc_msgSend(v8, "range");
    objc_msgSend(v8, "range");
    v11 = v10 + v9;
    v12 = objc_msgSend(v8, "rangeAtIndex:", 1);
    objc_msgSend(v6, "substringWithRange:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lowercaseString");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    while (v11 < v46)
    {
      -[WFPythonHTMLParser attributeFindExpression](self, "attributeFindExpression");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstMatchInString:options:range:", v6, 4, v11, objc_msgSend(v6, "length") - v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
        break;
      v17 = objc_msgSend(v16, "rangeAtIndex:", 1);
      v19 = v18;
      v20 = objc_msgSend(v16, "rangeAtIndex:", 2);
      v22 = v21;
      v23 = objc_msgSend(v16, "rangeAtIndex:", 3);
      v25 = v24;
      if (v17 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v26 = 0;
      }
      else
      {
        objc_msgSend(v6, "substringWithRange:", v17, v19);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (v20 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v27 = 0;
      }
      else
      {
        objc_msgSend(v6, "substringWithRange:", v20, v22);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

      }
      if (v23 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v28 = 0;
        if (!v27)
          goto LABEL_22;
      }
      else
      {
        objc_msgSend(v6, "substringWithRange:", v23, v25);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v27)
        {
LABEL_22:
          v30 = 0;
          goto LABEL_23;
        }
      }
      if (objc_msgSend(v28, "hasPrefix:", CFSTR("'"))
        && (objc_msgSend(v28, "hasSuffix:", CFSTR("'")) & 1) != 0
        || objc_msgSend(v28, "hasPrefix:", CFSTR("\"))
        && objc_msgSend(v28, "hasSuffix:", CFSTR("\")))
      {
        objc_msgSend(v28, "substringWithRange:", 1, objc_msgSend(v28, "length") - 2);
        v29 = objc_claimAutoreleasedReturnValue();

        v28 = (void *)v29;
      }
      if (!v28)
      {
        v30 = 0;
        goto LABEL_25;
      }
      objc_msgSend(v28, "gtm_stringByUnescapingFromHTML");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:

LABEL_25:
      v31 = [WFPythonHTMLAttribute alloc];
      objc_msgSend(v26, "lowercaseString");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[WFPythonHTMLAttribute initWithName:value:](v31, "initWithName:value:", v32, v30);

      objc_msgSend(v45, "addObject:", v33);
      v34 = objc_msgSend(v16, "range");
      objc_msgSend(v16, "range");
      v11 = v35 + v34;

    }
    objc_msgSend(v6, "substringWithRange:", v11, v46 - v11);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "stringByTrimmingCharactersInSet:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v38, "isEqualToString:", CFSTR(">")) & 1) != 0
      || (objc_msgSend(v38, "isEqualToString:", CFSTR("/>")) & 1) != 0)
    {
      if (objc_msgSend(v38, "hasSuffix:", CFSTR("/>")))
      {
        v39 = v44;
        -[WFPythonHTMLParser handleStartEndTag:attributes:](self, "handleStartEndTag:attributes:", v44, v45);
      }
      else
      {
        v39 = v44;
        -[WFPythonHTMLParser handleStartTag:attributes:](self, "handleStartTag:attributes:", v44, v45);
        if ((objc_msgSend(v44, "isEqualToString:", CFSTR("script")) & 1) != 0
          || objc_msgSend(v44, "isEqualToString:", CFSTR("style")))
        {
          -[WFPythonHTMLParser setCdataElement:](self, "setCdataElement:", v44);
        }
      }
    }
    else
    {
      objc_msgSend(v6, "substringWithRange:", v43, v46 - v43);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFPythonHTMLParser handleData:](self, "handleData:", v40);

      v39 = v44;
    }

  }
  return v46;
}

- (int64_t)checkForWholeStartTag:(int64_t)a3
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  void *v12;
  int64_t v13;
  void *v14;
  int v15;
  void *v16;
  char v17;
  char v18;
  int64_t v19;

  -[WFPythonHTMLParser rawData](self, "rawData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPythonHTMLParser locateStartTagEndExpression](self, "locateStartTagEndExpression");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstMatchInString:options:range:", v6, 4, a3, objc_msgSend(v6, "length") - a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_msgSend(v8, "range");
    objc_msgSend(v8, "range");
    v11 = v10 + v9;
    objc_msgSend(v6, "substringWithRange:", v10 + v9, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", CFSTR(">")))
    {
      v13 = v11 + 1;
    }
    else
    {
      if (objc_msgSend(v12, "isEqualToString:", CFSTR("/")))
      {
        objc_msgSend(v6, "substringFromIndex:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "hasPrefix:", CFSTR("/>"));

        if (v15)
        {
          v13 = v11 + 2;
          goto LABEL_18;
        }
        objc_msgSend(v6, "substringFromIndex:", v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "hasPrefix:", CFSTR("/"));
      }
      else
      {
        if ((objc_msgSend(v12, "isEqualToString:", &stru_24C4E3948) & 1) != 0)
        {
          v13 = -1;
          goto LABEL_18;
        }
        objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("abcdefghijklmnopqrstuvwxyz=/ABCDEFGHIJKLMNOPQRSTUVWXYZ"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "characterIsMember:", objc_msgSend(v12, "characterAtIndex:", 0));
      }
      v18 = v17;

      if (v11 <= a3)
        v19 = a3 + 1;
      else
        v19 = v11;
      if ((v18 & 1) != 0)
        v13 = -1;
      else
        v13 = v19;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFPythonHTMLParser.m"), 422, CFSTR("Apparently this isn't supposed to happen"));
    v13 = 700;
  }
LABEL_18:

  return v13;
}

- (int64_t)parseEndTag:(int64_t)a3
{
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  int v34;
  void *v36;

  -[WFPythonHTMLParser rawData](self, "rawData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "substringFromIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasPrefix:", CFSTR("</"));

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFPythonHTMLParser.m"), 429, CFSTR("Unexpected call to -parseEndTag:"));

  }
  -[WFPythonHTMLParser endEndTagExpression](self, "endEndTagExpression");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstMatchInString:options:range:", v6, 0, a3 + 1, objc_msgSend(v6, "length") - (a3 + 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_msgSend(v10, "range");
    objc_msgSend(v10, "range");
    v13 = v12 + v11;
    -[WFPythonHTMLParser endTagFindExpression](self, "endTagFindExpression");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstMatchInString:options:range:", v6, 4, a3, objc_msgSend(v6, "length") - a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = objc_msgSend(v15, "rangeAtIndex:", 1);
      objc_msgSend(v6, "substringWithRange:", v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lowercaseString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      -[WFPythonHTMLParser cdataElement](self, "cdataElement");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20
        && (-[WFPythonHTMLParser cdataElement](self, "cdataElement"),
            v21 = (void *)objc_claimAutoreleasedReturnValue(),
            v22 = objc_msgSend(v19, "isEqualToString:", v21),
            v21,
            (v22 & 1) == 0))
      {
        objc_msgSend(v6, "substringWithRange:", a3, v13 - a3);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFPythonHTMLParser handleData:](self, "handleData:", v24);

      }
      else
      {
        -[WFPythonHTMLParser handleEndTag:](self, "handleEndTag:", v19);
        -[WFPythonHTMLParser setCdataElement:](self, "setCdataElement:", 0);
      }
    }
    else
    {
      -[WFPythonHTMLParser cdataElement](self, "cdataElement");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        objc_msgSend(v6, "substringWithRange:", a3, v13 - a3);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFPythonHTMLParser handleData:](self, "handleData:", v19);
      }
      else
      {
        -[WFPythonHTMLParser tagFindExpression](self, "tagFindExpression");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "firstMatchInString:options:range:", v6, 4, a3 + 2, objc_msgSend(v6, "length") - (a3 + 2));
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          v26 = objc_msgSend(v19, "rangeAtIndex:", 1);
          objc_msgSend(v6, "substringWithRange:", v26, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "lowercaseString");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          v30 = objc_msgSend(v19, "range");
          objc_msgSend(v19, "range");
          v32 = objc_msgSend(v6, "rangeOfString:options:range:", CFSTR(">"), 0, v31 + v30, objc_msgSend(v6, "length") - (v31 + v30));
          -[WFPythonHTMLParser handleEndTag:](self, "handleEndTag:", v29);
          v13 = v32 + 1;

        }
        else
        {
          objc_msgSend(v6, "substringWithRange:", a3, 3);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("</>"));

          if (v34)
          {
            v19 = 0;
            v13 = a3 + 3;
          }
          else
          {
            v13 = -[WFPythonHTMLParser parseBogusComment:](self, "parseBogusComment:", a3);
            v19 = 0;
          }
        }
      }
    }

  }
  else
  {
    v13 = -1;
  }

  return v13;
}

- (int64_t)updatePosition:(int64_t)a3 j:(int64_t)a4
{
  int64_t v5;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v5 = a4 - a3;
  if (a4 > a3)
  {
    -[WFPythonHTMLParser rawData](self, "rawData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("\n"), 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "numberOfMatchesInString:options:range:", v8, 0, a3, v5);
    if (v10)
    {
      -[WFPythonHTMLParser setCurrentLineNumber:](self, "setCurrentLineNumber:", -[WFPythonHTMLParser currentLineNumber](self, "currentLineNumber") + v10);
      v11 = ~objc_msgSend(v8, "rangeOfString:options:range:", CFSTR("\n"), 4, a3, v5) + a4;
    }
    else
    {
      v11 = -[WFPythonHTMLParser currentOffset](self, "currentOffset") + v5;
    }
    -[WFPythonHTMLParser setCurrentOffset:](self, "setCurrentOffset:", v11);

  }
  return a4;
}

- (void)handleStartEndTag:(id)a3 attributes:(id)a4
{
  id v6;

  v6 = a3;
  -[WFPythonHTMLParser handleStartTag:attributes:](self, "handleStartTag:attributes:", v6, a4);
  -[WFPythonHTMLParser handleEndTag:](self, "handleEndTag:", v6);

}

- (void)handleStartTag:(id)a3 attributes:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[WFPythonHTMLParser delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[WFPythonHTMLParser delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "parser:foundStartTag:attributes:", self, v10, v6);

  }
}

- (void)handleData:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[WFPythonHTMLParser delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WFPythonHTMLParser delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "parser:foundData:", self, v7);

  }
}

- (void)handleEndTag:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[WFPythonHTMLParser delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WFPythonHTMLParser delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "parser:foundEndTag:", self, v7);

  }
}

- (void)handleEntityRef:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[WFPythonHTMLParser delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WFPythonHTMLParser delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "parser:foundEntityRef:", self, v7);

  }
}

- (void)handleCharacterRef:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[WFPythonHTMLParser delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WFPythonHTMLParser delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "parser:foundCharacterRef:", self, v7);

  }
}

- (void)handleComment:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[WFPythonHTMLParser delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WFPythonHTMLParser delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "parser:foundComment:", self, v7);

  }
}

- (void)handleDoctypeDeclaration:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[WFPythonHTMLParser delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WFPythonHTMLParser delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "parser:foundDoctypeDeclaration:", self, v7);

  }
}

- (void)handleProcessingInstruction:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[WFPythonHTMLParser delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WFPythonHTMLParser delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "parser:foundProcessingInstruction:", self, v7);

  }
}

- (void)handleUnknownDeclaration:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[WFPythonHTMLParser delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WFPythonHTMLParser delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "parser:foundUnknownDeclaration:", self, v7);

  }
}

- (int64_t)currentLineNumber
{
  return self->_currentLineNumber;
}

- (void)setCurrentLineNumber:(int64_t)a3
{
  self->_currentLineNumber = a3;
}

- (int64_t)currentOffset
{
  return self->_currentOffset;
}

- (void)setCurrentOffset:(int64_t)a3
{
  self->_currentOffset = a3;
}

- (WFPythonHTMLParserDelegate)delegate
{
  return (WFPythonHTMLParserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setInterestingExpression:(id)a3
{
  objc_storeStrong((id *)&self->_interestingExpression, a3);
}

- (NSRegularExpression)incompleteExpression
{
  return self->_incompleteExpression;
}

- (NSRegularExpression)entityrefExpression
{
  return self->_entityrefExpression;
}

- (NSRegularExpression)charrefExpression
{
  return self->_charrefExpression;
}

- (NSRegularExpression)startTagOpenExpression
{
  return self->_startTagOpenExpression;
}

- (NSRegularExpression)commentCloseExpression
{
  return self->_commentCloseExpression;
}

- (NSRegularExpression)tagFindExpression
{
  return self->_tagFindExpression;
}

- (NSRegularExpression)attributeFindExpression
{
  return self->_attributeFindExpression;
}

- (NSRegularExpression)locateStartTagEndExpression
{
  return self->_locateStartTagEndExpression;
}

- (NSRegularExpression)endEndTagExpression
{
  return self->_endEndTagExpression;
}

- (NSRegularExpression)endTagFindExpression
{
  return self->_endTagFindExpression;
}

- (NSString)rawData
{
  return self->_rawData;
}

- (void)setRawData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)cdataElement
{
  return self->_cdataElement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cdataElement, 0);
  objc_storeStrong((id *)&self->_rawData, 0);
  objc_storeStrong((id *)&self->_endTagFindExpression, 0);
  objc_storeStrong((id *)&self->_endEndTagExpression, 0);
  objc_storeStrong((id *)&self->_locateStartTagEndExpression, 0);
  objc_storeStrong((id *)&self->_attributeFindExpression, 0);
  objc_storeStrong((id *)&self->_tagFindExpression, 0);
  objc_storeStrong((id *)&self->_commentCloseExpression, 0);
  objc_storeStrong((id *)&self->_startTagOpenExpression, 0);
  objc_storeStrong((id *)&self->_charrefExpression, 0);
  objc_storeStrong((id *)&self->_entityrefExpression, 0);
  objc_storeStrong((id *)&self->_incompleteExpression, 0);
  objc_storeStrong((id *)&self->_interestingExpression, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
