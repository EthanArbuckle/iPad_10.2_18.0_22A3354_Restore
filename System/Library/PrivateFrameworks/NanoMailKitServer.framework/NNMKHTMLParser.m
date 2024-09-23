@implementation NNMKHTMLParser

- (NNMKHTMLParser)init
{
  NNMKHTMLParser *v2;
  NNMKHTMLParser *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NNMKHTMLParser;
  v2 = -[NNMKHTMLParser init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    xmlSAX2InitHtmlDefaultSAXHandler(&v2->_parsingSAXHandler);
    v3->_parsingSAXHandler.characters = (charactersSAXFunc)_handleCharacters;
    v3->_parsingSAXHandler.internalSubset = 0;
    v3->_parsingSAXHandler.getEntity = 0;
    v3->_parsingSAXHandler.cdataBlock = 0;
    v3->_parsingSAXHandler.error = (errorSAXFunc)_handleError;
    v3->_parsingSAXHandler.fatalError = 0;
    v3->_parsingSAXHandler.startElement = (startElementSAXFunc)_handleStartElement;
    v3->_parsingSAXHandler.endElement = (endElementSAXFunc)_handleEndElement;
    v3->_parsingSAXHandler.startDocument = 0;
    v3->_parsingSAXHandler.endDocument = 0;
    v3->_parsingSAXHandler.setDocumentLocator = 0;
    *(_OWORD *)&v3->_parsingSAXHandler.ignorableWhitespace = 0u;
    *(_OWORD *)&v3->_parsingSAXHandler.comment = 0u;
  }
  return v3;
}

- (void)parseHTMLBody:(id)a3 encoding:(unint64_t)a4
{
  NSString *v5;
  NSMutableData *v6;
  NSMutableData *charactersBuffer;
  NSMutableArray *v8;
  NSMutableArray *stringAttributesStack;
  NSMutableArray *v10;
  NSMutableArray *isQuoteElementStack;
  NSMutableArray *v12;
  NSMutableArray *listStack;
  NSString *currentImgTagSource;
  NSString *htmlBodyToParse;
  NSString *v16;
  htmlParserCtxtPtr PushParserCtxt;
  NSString *v18;
  id v19;

  v5 = (NSString *)a3;
  v6 = (NSMutableData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
  charactersBuffer = self->_charactersBuffer;
  self->_charactersBuffer = v6;

  v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  stringAttributesStack = self->_stringAttributesStack;
  self->_stringAttributesStack = v8;

  v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  isQuoteElementStack = self->_isQuoteElementStack;
  self->_isQuoteElementStack = v10;

  self->_currentQuoteLevel = 0;
  v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  listStack = self->_listStack;
  self->_listStack = v12;

  self->_currentListLevel = 0;
  self->_isLastCharAddedLineBreak = 0;
  self->_containsBlockedElements = 0;
  self->_bodyTagStartIndex = 0x7FFFFFFFFFFFFFFFLL;
  self->_currentHeadTagStartIndex = 0x7FFFFFFFFFFFFFFFLL;
  currentImgTagSource = self->_currentImgTagSource;
  self->_currentImgTagSource = 0;

  *(_WORD *)&self->_parsingHead = 0;
  self->_cancelled = 0;
  htmlBodyToParse = self->_htmlBodyToParse;
  self->_htmlBodyToParse = v5;
  v16 = v5;

  -[NSString dataUsingEncoding:](v16, "dataUsingEncoding:", 4);
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  PushParserCtxt = htmlCreatePushParserCtxt(&self->_parsingSAXHandler, self, (const char *)objc_msgSend(v19, "bytes"), objc_msgSend(v19, "length"), 0, XML_CHAR_ENCODING_UTF8);
  self->_parserContext = PushParserCtxt;
  htmlCtxtUseOptions(PushParserCtxt, 2099201);
  htmlParseDocument(self->_parserContext);
  MEMORY[0x22E327CC8](self->_parserContext);
  v18 = self->_htmlBodyToParse;
  self->_htmlBodyToParse = 0;

}

- (BOOL)isElementBlocked:(id)a3 attributeQueryBlock:(id)a4
{
  return 0;
}

- (BOOL)isErrorTypeBlocked:(char *)a3
{
  return 0;
}

- (BOOL)isElementIgnorable:(id)a3
{
  return 0;
}

- (BOOL)caresAboutHTMLContentString
{
  return 0;
}

- (BOOL)_isElementBlocked:(id)a3 attributes:(const char *)a4
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __47__NNMKHTMLParser__isElementBlocked_attributes___block_invoke;
  v5[3] = &unk_24F9F6488;
  v5[4] = self;
  v5[5] = a4;
  return -[NNMKHTMLParser isElementBlocked:attributeQueryBlock:](self, "isElementBlocked:attributeQueryBlock:", a3, v5);
}

uint64_t __47__NNMKHTMLParser__isElementBlocked_attributes___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_valueForAttributeNamed:inAttributes:", a2, *(_QWORD *)(a1 + 40));
}

- (BOOL)_isErrorBlocked:(_xmlError *)a3
{
  return a3 && -[NNMKHTMLParser isErrorTypeBlocked:](self, "isErrorTypeBlocked:", a3->str1);
}

- (BOOL)_isElementDisplayedInBlock:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = 1;
  if (objc_msgSend(v3, "compare:options:", CFSTR("div"), 1))
  {
    v4 = 1;
    if (objc_msgSend(v3, "compare:options:", CFSTR("blockquote"), 1))
    {
      v4 = 1;
      if (objc_msgSend(v3, "compare:options:", CFSTR("table"), 1))
      {
        v4 = 1;
        if (objc_msgSend(v3, "compare:options:", CFSTR("tr"), 1))
        {
          v4 = 1;
          if (objc_msgSend(v3, "compare:options:", CFSTR("td"), 1))
          {
            v4 = 1;
            if (objc_msgSend(v3, "compare:options:", CFSTR("p"), 1))
            {
              v4 = 1;
              if (objc_msgSend(v3, "compare:options:", CFSTR("li"), 1))
              {
                v4 = 1;
                if (objc_msgSend(v3, "compare:options:", CFSTR("ul"), 1))
                  v4 = objc_msgSend(v3, "compare:options:", CFSTR("ol"), 1) == 0;
              }
            }
          }
        }
      }
    }
  }

  return v4;
}

- (BOOL)_isElementQuoteElement:(id)a3 attributes:(const char *)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  if (!objc_msgSend(v6, "compare:options:", CFSTR("blockquote"), 1))
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy_;
    v22 = __Block_byref_object_dispose_;
    v23 = 0;
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy_;
    v16 = __Block_byref_object_dispose_;
    v17 = 0;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __52__NNMKHTMLParser__isElementQuoteElement_attributes___block_invoke;
    v11[3] = &unk_24F9F64B0;
    v11[4] = &v18;
    v11[5] = &v12;
    -[NNMKHTMLParser _enumerateAttributes:withBlock:](self, "_enumerateAttributes:withBlock:", a4, v11);
    v7 = (void *)v19[5];
    if (v7 && !objc_msgSend(v7, "compare:options:", v19[5], 1)
      || (v8 = (void *)v13[5]) != 0 && !objc_msgSend(v8, "compare:options:", CFSTR("gmail_quote"), 1))
    {
      _Block_object_dispose(&v12, 8);

      _Block_object_dispose(&v18, 8);
      v9 = 1;
      goto LABEL_8;
    }
    _Block_object_dispose(&v12, 8);

    _Block_object_dispose(&v18, 8);
  }
  v9 = 0;
LABEL_8:

  return v9;
}

void __52__NNMKHTMLParser__isElementQuoteElement_attributes___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, _BYTE *a5)
{
  id v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v8 = a4;
  if (!objc_msgSend(v10, "compare:options:", CFSTR("type"), 1))
  {
    v9 = *(_QWORD *)(a1 + 32);
    goto LABEL_5;
  }
  if (!objc_msgSend(v10, "compare:options:", CFSTR("class"), 1))
  {
    v9 = *(_QWORD *)(a1 + 40);
LABEL_5:
    objc_storeStrong((id *)(*(_QWORD *)(v9 + 8) + 40), a4);
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40)
    && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    *a5 = 1;
  }

}

- (BOOL)_isElementLineBreak:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = 1;
  if (objc_msgSend(v3, "compare:options:", CFSTR("br"), 1))
    v4 = objc_msgSend(v3, "compare:options:", CFSTR("hr"), 1) == 0;

  return v4;
}

- (BOOL)_isElementList:(id)a3 ordered:(BOOL *)a4
{
  id v5;
  BOOL v6;

  v5 = a3;
  if (!objc_msgSend(v5, "compare:options:", CFSTR("ul"), 1))
  {
    if (!a4)
    {
LABEL_8:
      v6 = 1;
      goto LABEL_9;
    }
    v6 = 0;
LABEL_7:
    *a4 = v6;
    goto LABEL_8;
  }
  if (!objc_msgSend(v5, "compare:options:", CFSTR("ol"), 1))
  {
    v6 = 1;
    if (!a4)
      goto LABEL_9;
    goto LABEL_7;
  }
  v6 = 0;
LABEL_9:

  return v6;
}

- (BOOL)_isElementListItem:(id)a3
{
  return objc_msgSend(a3, "compare:options:", CFSTR("li"), 1) == 0;
}

- (BOOL)_isElementImage:(id)a3
{
  return objc_msgSend(a3, "compare:options:", CFSTR("img"), 1) == 0;
}

- (BOOL)_isElementHyperlink:(id)a3
{
  return objc_msgSend(a3, "compare:options:", CFSTR("a"), 1) == 0;
}

- (BOOL)_isElementHead:(id)a3
{
  return objc_msgSend(a3, "compare:options:", CFSTR("head"), 1) == 0;
}

- (BOOL)_isElementBody:(id)a3
{
  return objc_msgSend(a3, "compare:options:", CFSTR("body"), 1) == 0;
}

- (void)_stringAttributeForElement:(id)a3 attributes:(const char *)a4 stringAttributeKey:(id *)a5 stringAttributeValue:(id *)a6
{
  id v10;
  void *v11;
  __CFString **v12;
  __CFString **v13;
  id *v14;
  id v15;

  v10 = a3;
  *a5 = 0;
  *a6 = 0;
  v15 = v10;
  if (!objc_msgSend(v10, "compare:options:", CFSTR("b"), 1))
  {
    v13 = kBoldMessageBodyCustomAttribute;
LABEL_11:
    *a5 = objc_retainAutorelease(*v13);
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (!objc_msgSend(v15, "compare:options:", CFSTR("i"), 1))
  {
    v13 = kItalicMessageBodyCustomAttribute;
    goto LABEL_11;
  }
  if (!objc_msgSend(v15, "compare:options:", CFSTR("u"), 1))
  {
    v14 = (id *)MEMORY[0x24BDF66D8];
LABEL_14:
    *a5 = objc_retainAutorelease(*v14);
    *a6 = &unk_24FA10BB0;
    goto LABEL_19;
  }
  if (!objc_msgSend(v15, "compare:options:", CFSTR("strike"), 1))
  {
    v14 = (id *)MEMORY[0x24BDF6658];
    goto LABEL_14;
  }
  if (!objc_msgSend(v15, "compare:options:", CFSTR("font"), 1))
  {
    -[NNMKHTMLParser _valueForAttributeNamed:inAttributes:](self, "_valueForAttributeNamed:inAttributes:", CFSTR("color"), a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = kFontColorMessageBodyCustomAttribute;
      goto LABEL_17;
    }
LABEL_18:

    goto LABEL_19;
  }
  if (-[NNMKHTMLParser _isElementBody:](self, "_isElementBody:", v15))
  {
    -[NNMKHTMLParser _valueForAttributeNamed:inAttributes:](self, "_valueForAttributeNamed:inAttributes:", CFSTR("bgColor"), a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = kBodyBackgroundMessageBodyCustomAttribute;
LABEL_17:
      *a5 = objc_retainAutorelease(*v12);
      objc_msgSend(MEMORY[0x24BDF6950], "colorWithWebColor:", v11);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    goto LABEL_18;
  }
LABEL_19:

}

- (id)_stringAttributesForStyleAttribute:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;

  v4 = (objc_class *)MEMORY[0x24BDBCED8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  -[NNMKHTMLParser _stringAttributeValueForCSSStyleName:inStyleAttribute:](self, "_stringAttributeValueForCSSStyleName:inStyleAttribute:", CFSTR("color"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKHTMLParser _stringAttributeValueForCSSStyleName:inStyleAttribute:](self, "_stringAttributeValueForCSSStyleName:inStyleAttribute:", CFSTR("text-align"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKHTMLParser _stringAttributeValueForCSSStyleName:inStyleAttribute:](self, "_stringAttributeValueForCSSStyleName:inStyleAttribute:", CFSTR("direction"), v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWebColor:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("NNMKColor"));

  }
  if (v8)
  {
    v11 = -[NNMKHTMLParser _textAlignmentFromString:](self, "_textAlignmentFromString:", v8);
    if (v11)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("NNMKAlign"));

    }
  }
  if (v9)
  {
    v13 = -[NNMKHTMLParser _writingDirectionFromString:](self, "_writingDirectionFromString:", v9);
    if (v13)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("NNMKWritingDirection"));

    }
  }

  return v6;
}

- (id)_stringAttributeValueForCSSStyleName:(id)a3 inStyleAttribute:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v5 = a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(^|;)\\s*(%@\\s*:\\s*)(.+?)(;|$)"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", v6, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "matchesInString:options:range:", v8, 0, 0, objc_msgSend(v5, "length"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "rangeAtIndex:", 3);
    objc_msgSend(v5, "substringWithRange:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)_textAlignmentFromString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  v4 = 1;
  if (objc_msgSend(v3, "compare:options:", CFSTR("left"), 1))
  {
    if (objc_msgSend(v3, "compare:options:", CFSTR("center"), 1))
    {
      if (objc_msgSend(v3, "compare:options:", CFSTR("right"), 1))
        v4 = 4 * (objc_msgSend(v3, "compare:options:", CFSTR("justify"), 1) == 0);
      else
        v4 = 3;
    }
    else
    {
      v4 = 2;
    }
  }

  return v4;
}

- (unint64_t)_writingDirectionFromString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  v4 = 1;
  if (objc_msgSend(v3, "compare:options:", CFSTR("ltr"), 1))
  {
    if (objc_msgSend(v3, "compare:options:", CFSTR("rtl"), 1))
      v4 = objc_msgSend(v3, "compare:options:", CFSTR("initial"), 1) == 0;
    else
      v4 = 2;
  }

  return v4;
}

- (void)_stringAttributeForHyperlink:(id)a3 attributes:(const char *)a4 stringAttributeKey:(id *)a5 stringAttributeValue:(id *)a6
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  id v21;

  *a5 = 0;
  *a6 = 0;
  -[NNMKHTMLParser _valueForAttributeNamed:inAttributes:](self, "_valueForAttributeNamed:inAttributes:", CFSTR("href"));
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "lowercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "hasPrefix:", CFSTR("http:")) & 1) == 0)
  {
    objc_msgSend(v21, "lowercaseString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "hasPrefix:", CFSTR("https:")) & 1) == 0)
    {
      objc_msgSend(v21, "lowercaseString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "hasPrefix:", CFSTR("mailto:")) & 1) == 0)
      {
        objc_msgSend(v21, "lowercaseString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v13, "hasPrefix:", CFSTR("map:")) & 1) == 0)
        {
          objc_msgSend(v21, "lowercaseString");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v14, "hasPrefix:", CFSTR("maps:")) & 1) == 0)
          {
            objc_msgSend(v21, "lowercaseString");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v15, "hasPrefix:", CFSTR("sms:")) & 1) == 0)
            {
              objc_msgSend(v21, "lowercaseString");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v20, "hasPrefix:", CFSTR("tel:")) & 1) == 0)
              {
                objc_msgSend(v21, "lowercaseString");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = objc_msgSend(v18, "hasPrefix:", CFSTR("itms-services:"));

                if ((v19 & 1) == 0)
                  goto LABEL_16;
                goto LABEL_15;
              }

            }
          }

        }
      }

    }
  }

LABEL_15:
  *a5 = objc_retainAutorelease(CFSTR("NNMKHyperlink"));
  v16 = (void *)MEMORY[0x24BDBCF48];
  -[NNMKHTMLParser _valueForAttributeNamed:inAttributes:](self, "_valueForAttributeNamed:inAttributes:", CFSTR("href"), a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "URLWithString:", v17);
  *a6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_16:
}

- (id)_valueForAttributeNamed:(id)a3 inAttributes:(const char *)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __55__NNMKHTMLParser__valueForAttributeNamed_inAttributes___block_invoke;
  v10[3] = &unk_24F9F64D8;
  v7 = v6;
  v11 = v7;
  v12 = &v13;
  -[NNMKHTMLParser _enumerateAttributes:withBlock:](self, "_enumerateAttributes:withBlock:", a4, v10);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __55__NNMKHTMLParser__valueForAttributeNamed_inAttributes___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, _BYTE *a5)
{
  id v9;

  v9 = a4;
  if (!objc_msgSend(a3, "compare:options:", *(_QWORD *)(a1 + 32), 1))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a4);
    *a5 = 1;
  }

}

- (void)_enumerateAttributes:(const char *)a3 withBlock:(id)a4
{
  void (**v5)(id, uint64_t, void *, void *, char *);
  void *v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  char v10;

  v5 = (void (**)(id, uint64_t, void *, void *, char *))a4;
  if (a3)
  {
    v6 = 0;
    v7 = 0;
    while (1)
    {
      while (1)
      {
        v8 = a3[v7++];
        if (v6)
          break;
        if (!v8)
          goto LABEL_12;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (v8)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
      }
      v10 = 0;
      v5[2](v5, v7, v6, v9, &v10);
      if (v10)
        break;

      v6 = 0;
    }

LABEL_12:
  }

}

- (id)_topStringAttributes
{
  void *v2;
  void *v3;
  id v4;

  -[NSMutableArray lastObject](self->_stringAttributesStack, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x24BDBD1B8];
  v4 = v2;

  return v4;
}

- (void)_pushStringAttributes:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[NNMKHTMLParser _topStringAttributes](self, "_topStringAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "addEntriesFromDictionary:", v4);
  -[NSMutableArray addObject:](self->_stringAttributesStack, "addObject:", v6);

}

- (void)_popStringAttributes
{
  -[NSMutableArray removeLastObject](self->_stringAttributesStack, "removeLastObject");
}

- (void)_appendLineBreak
{
  -[NNMKHTMLParser _appendString:](self, "_appendString:", CFSTR("\n"));
}

- (void)_requireNewLine
{
  if (!self->_isLastCharAddedLineBreak)
    -[NNMKHTMLParser _appendLineBreak](self, "_appendLineBreak");
}

- (void)_appendCharacters:(const char *)a3 length:(int)a4
{
  -[NSMutableData appendBytes:length:](self->_charactersBuffer, "appendBytes:length:", a3, a4);
}

- (void)_flushCharactersIfNeeded
{
  NSMutableData *v3;
  NSMutableData *charactersBuffer;
  void *v5;
  int v6;
  void *v7;

  if (-[NSMutableData length](self->_charactersBuffer, "length"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", self->_charactersBuffer, 4);
    v3 = (NSMutableData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
    charactersBuffer = self->_charactersBuffer;
    self->_charactersBuffer = v3;

    v5 = v7;
    if (v7)
    {
      v6 = objc_msgSend(v7, "isEqualToString:", CFSTR("\n"));
      v5 = v7;
      if (!v6 || !self->_isLastCharAddedLineBreak)
      {
        -[NNMKHTMLParser _appendString:](self, "_appendString:", v7);
        v5 = v7;
      }
    }

  }
}

- (void)_appendString:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[NNMKHTMLParser _topStringAttributes](self, "_topStringAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKHTMLParser appendString:stringAttributes:](self, "appendString:stringAttributes:", v4, v5);

  LOBYTE(v5) = objc_msgSend(v4, "hasSuffix:", CFSTR("\n"));
  self->_isLastCharAddedLineBreak = (char)v5;
}

- (void)_appendImageFromAttributes:(const char *)a3
{
  void *v5;
  float v6;
  double v7;
  void *v8;
  float v9;
  double v10;
  void *v11;
  id v12;

  -[NNMKHTMLParser _valueForAttributeNamed:inAttributes:](self, "_valueForAttributeNamed:inAttributes:", CFSTR("src"), a3);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[NNMKHTMLParser _valueForAttributeNamed:inAttributes:](self, "_valueForAttributeNamed:inAttributes:", CFSTR("width"), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  -[NNMKHTMLParser _valueForAttributeNamed:inAttributes:](self, "_valueForAttributeNamed:inAttributes:", CFSTR("height"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  v10 = v9;

  -[NNMKHTMLParser _topStringAttributes](self, "_topStringAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKHTMLParser appendImageWithSource:width:height:stringAttributes:](self, "appendImageWithSource:width:height:stringAttributes:", v12, v11, v7, v10);

  self->_isLastCharAddedLineBreak = 0;
}

- (BOOL)containsBlockedElements
{
  return self->_containsBlockedElements;
}

- (void)setContainsBlockedElements:(BOOL)a3
{
  self->_containsBlockedElements = a3;
}

- (BOOL)parsingHead
{
  return self->_parsingHead;
}

- (void)setParsingHead:(BOOL)a3
{
  self->_parsingHead = a3;
}

- (BOOL)parsingBody
{
  return self->_parsingBody;
}

- (void)setParsingBody:(BOOL)a3
{
  self->_parsingBody = a3;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (NSString)htmlBodyToParse
{
  return self->_htmlBodyToParse;
}

- (void)setHtmlBodyToParse:(id)a3
{
  objc_storeStrong((id *)&self->_htmlBodyToParse, a3);
}

- (unint64_t)encoding
{
  return self->_encoding;
}

- (void)setEncoding:(unint64_t)a3
{
  self->_encoding = a3;
}

- (_xmlSAXHandler)parsingSAXHandler
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v3 = *(_OWORD *)&self->initialized;
  *(_OWORD *)&retstr->attributeDecl = *(_OWORD *)&self->cdataBlock;
  *(_OWORD *)&retstr->unparsedEntityDecl = v3;
  v4 = *(_OWORD *)&self->serror;
  *(_OWORD *)&retstr->startDocument = *(_OWORD *)&self->startElementNs;
  *(_OWORD *)&retstr->startElement = v4;
  v5 = *(_OWORD *)&self->processingInstruction;
  *(_OWORD *)&retstr->internalSubset = *(_OWORD *)&self->characters;
  *(_OWORD *)&retstr->hasInternalSubset = v5;
  v6 = *(_OWORD *)&self->fatalError;
  *(_OWORD *)&retstr->resolveEntity = *(_OWORD *)&self->warning;
  *(_OWORD *)&retstr->entityDecl = v6;
  v7 = *(_OWORD *)&self[1].setDocumentLocator;
  *(_OWORD *)&retstr->getParameterEntity = *(_OWORD *)&self[1].elementDecl;
  *(_OWORD *)&retstr->externalSubset = v7;
  v8 = *(_OWORD *)&self[1].endElement;
  *(_OWORD *)&retstr->_private = *(_OWORD *)&self[1].endDocument;
  *(_OWORD *)&retstr->endElementNs = v8;
  v9 = *(_OWORD *)&self[1].hasExternalSubset;
  *(_OWORD *)&retstr->reference = *(_OWORD *)&self[1].isStandalone;
  *(_OWORD *)&retstr->ignorableWhitespace = v9;
  v10 = *(_OWORD *)&self[1].notationDecl;
  *(_OWORD *)&retstr->comment = *(_OWORD *)&self[1].getEntity;
  *(_OWORD *)&retstr->error = v10;
  return self;
}

- (void)setParsingSAXHandler:(_xmlSAXHandler *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v3 = *(_OWORD *)&a3->internalSubset;
  v4 = *(_OWORD *)&a3->hasInternalSubset;
  v5 = *(_OWORD *)&a3->resolveEntity;
  *(_OWORD *)&self->_parsingSAXHandler.entityDecl = *(_OWORD *)&a3->entityDecl;
  *(_OWORD *)&self->_parsingSAXHandler.resolveEntity = v5;
  *(_OWORD *)&self->_parsingSAXHandler.hasInternalSubset = v4;
  *(_OWORD *)&self->_parsingSAXHandler.internalSubset = v3;
  v6 = *(_OWORD *)&a3->attributeDecl;
  v7 = *(_OWORD *)&a3->unparsedEntityDecl;
  v8 = *(_OWORD *)&a3->startDocument;
  *(_OWORD *)&self->_parsingSAXHandler.startElement = *(_OWORD *)&a3->startElement;
  *(_OWORD *)&self->_parsingSAXHandler.startDocument = v8;
  *(_OWORD *)&self->_parsingSAXHandler.unparsedEntityDecl = v7;
  *(_OWORD *)&self->_parsingSAXHandler.attributeDecl = v6;
  v9 = *(_OWORD *)&a3->reference;
  v10 = *(_OWORD *)&a3->ignorableWhitespace;
  v11 = *(_OWORD *)&a3->error;
  *(_OWORD *)&self->_parsingSAXHandler.comment = *(_OWORD *)&a3->comment;
  *(_OWORD *)&self->_parsingSAXHandler.error = v11;
  *(_OWORD *)&self->_parsingSAXHandler.reference = v9;
  *(_OWORD *)&self->_parsingSAXHandler.ignorableWhitespace = v10;
  v12 = *(_OWORD *)&a3->getParameterEntity;
  v13 = *(_OWORD *)&a3->externalSubset;
  v14 = *(_OWORD *)&a3->endElementNs;
  *(_OWORD *)&self->_parsingSAXHandler._private = *(_OWORD *)&a3->_private;
  *(_OWORD *)&self->_parsingSAXHandler.endElementNs = v14;
  *(_OWORD *)&self->_parsingSAXHandler.getParameterEntity = v12;
  *(_OWORD *)&self->_parsingSAXHandler.externalSubset = v13;
}

- (_xmlParserCtxt)parserContext
{
  return self->_parserContext;
}

- (void)setParserContext:(_xmlParserCtxt *)a3
{
  self->_parserContext = a3;
}

- (NSMutableData)charactersBuffer
{
  return self->_charactersBuffer;
}

- (void)setCharactersBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_charactersBuffer, a3);
}

- (NSMutableArray)stringAttributesStack
{
  return self->_stringAttributesStack;
}

- (void)setStringAttributesStack:(id)a3
{
  objc_storeStrong((id *)&self->_stringAttributesStack, a3);
}

- (NSMutableArray)isQuoteElementStack
{
  return self->_isQuoteElementStack;
}

- (void)setIsQuoteElementStack:(id)a3
{
  objc_storeStrong((id *)&self->_isQuoteElementStack, a3);
}

- (unint64_t)currentQuoteLevel
{
  return self->_currentQuoteLevel;
}

- (void)setCurrentQuoteLevel:(unint64_t)a3
{
  self->_currentQuoteLevel = a3;
}

- (NSMutableArray)listStack
{
  return self->_listStack;
}

- (void)setListStack:(id)a3
{
  objc_storeStrong((id *)&self->_listStack, a3);
}

- (unint64_t)currentListLevel
{
  return self->_currentListLevel;
}

- (void)setCurrentListLevel:(unint64_t)a3
{
  self->_currentListLevel = a3;
}

- (BOOL)isLastCharAddedLineBreak
{
  return self->_isLastCharAddedLineBreak;
}

- (void)setIsLastCharAddedLineBreak:(BOOL)a3
{
  self->_isLastCharAddedLineBreak = a3;
}

- (NSString)ignoringElementSubtree
{
  return self->_ignoringElementSubtree;
}

- (void)setIgnoringElementSubtree:(id)a3
{
  objc_storeStrong((id *)&self->_ignoringElementSubtree, a3);
}

- (unint64_t)bodyTagStartIndex
{
  return self->_bodyTagStartIndex;
}

- (void)setBodyTagStartIndex:(unint64_t)a3
{
  self->_bodyTagStartIndex = a3;
}

- (NSString)bodyTagStyle
{
  return self->_bodyTagStyle;
}

- (void)setBodyTagStyle:(id)a3
{
  objc_storeStrong((id *)&self->_bodyTagStyle, a3);
}

- (unint64_t)currentHeadTagStartIndex
{
  return self->_currentHeadTagStartIndex;
}

- (void)setCurrentHeadTagStartIndex:(unint64_t)a3
{
  self->_currentHeadTagStartIndex = a3;
}

- (unint64_t)currentImgTagStartIndex
{
  return self->_currentImgTagStartIndex;
}

- (void)setCurrentImgTagStartIndex:(unint64_t)a3
{
  self->_currentImgTagStartIndex = a3;
}

- (NSString)currentImgTagSource
{
  return self->_currentImgTagSource;
}

- (void)setCurrentImgTagSource:(id)a3
{
  objc_storeStrong((id *)&self->_currentImgTagSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentImgTagSource, 0);
  objc_storeStrong((id *)&self->_bodyTagStyle, 0);
  objc_storeStrong((id *)&self->_ignoringElementSubtree, 0);
  objc_storeStrong((id *)&self->_listStack, 0);
  objc_storeStrong((id *)&self->_isQuoteElementStack, 0);
  objc_storeStrong((id *)&self->_stringAttributesStack, 0);
  objc_storeStrong((id *)&self->_charactersBuffer, 0);
  objc_storeStrong((id *)&self->_htmlBodyToParse, 0);
}

@end
