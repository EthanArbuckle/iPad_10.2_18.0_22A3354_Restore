@implementation MPUHTMLParser

+ (id)attributedSanitizedStringFromHTMLString:(id)a3 defaultAttributes:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v14;

  v6 = a4;
  objc_msgSend(a1, "sanitizedHTMLString:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPUHTMLParser parser](MPUHTMLParser, "parser");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "displayDelegateWithDefaultAttributes:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", v9);
  v14 = 0;
  objc_msgSend(v8, "attributedStringForHTMLString:error:", v7, &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v11 = v14 == 0;
  else
    v11 = 0;
  if (!v11)
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v7, v6);

    v10 = (void *)v12;
  }

  return v10;
}

+ (id)parser
{
  return objc_alloc_init((Class)a1);
}

+ (id)parserWithDefaultAttributes:(id)a3
{
  id v4;
  _QWORD *v5;
  _QWORD *v6;
  _MPUHTMLDefaultDelegate *v7;
  void *v8;
  _MPUHTMLDefaultDelegate *v9;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = objc_alloc_init(_MPUHTMLDefaultDelegate);
    -[_MPUHTMLDefaultDelegate setDefaultAttributes:](v7, "setDefaultAttributes:", v4);
    v8 = (void *)v6[1];
    v6[1] = v7;
    v9 = v7;

    objc_msgSend(v6, "setDelegate:", v9);
  }

  return v6;
}

+ (id)displayDelegateWithDefaultAttributes:(id)a3
{
  id v3;
  _MPUHTMLDefaultDelegate *v4;

  v3 = a3;
  v4 = objc_alloc_init(_MPUHTMLDefaultDelegate);
  -[_MPUHTMLDefaultDelegate setDefaultAttributes:](v4, "setDefaultAttributes:", v3);

  return v4;
}

+ (id)sanitizedHTMLString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  id v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCharactersToBeSkipped:", 0);
  v7 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  if ((objc_msgSend(v6, "isAtEnd") & 1) == 0)
  {
    v8 = 0;
    do
    {
      v9 = v8;
      v12 = v8;
      v10 = objc_msgSend(v6, "scanUpToCharactersFromSet:intoString:", v4, &v12);
      v8 = v12;

      if (v10)
      {
        objc_msgSend(v7, "appendString:", v8);
        if (objc_msgSend(v6, "scanCharactersFromSet:intoString:", v4, 0))
          objc_msgSend(v7, "appendString:", CFSTR(" "));
      }
    }
    while (!objc_msgSend(v6, "isAtEnd"));

  }
  return v7;
}

- (id)attributedStringForHTMLString:(id)a3 error:(id *)a4
{
  void *v6;
  _MPUHTMLParserState *v7;
  void *v8;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_MPUHTMLParserState initWithParser:data:]([_MPUHTMLParserState alloc], "initWithParser:data:", self, v6);
  -[_MPUHTMLParserState parse:](v7, "parse:", a4);
  -[_MPUHTMLParserState attributedString](v7, "attributedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (MPUHTMLParserDelegate)delegate
{
  return (MPUHTMLParserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_defaultDelegate, 0);
}

@end
