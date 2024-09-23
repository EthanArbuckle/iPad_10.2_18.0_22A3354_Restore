@implementation KSHTMLWriter

- (KSHTMLWriter)initWithOutputWriter:(id)a3
{
  KSHTMLWriter *v3;
  KSHTMLWriter *v4;
  NSMutableSet *v5;
  NSMutableSet *IDs;
  NSMutableArray *v7;
  NSMutableArray *classNames;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)KSHTMLWriter;
  v3 = -[KSXMLWriter initWithOutputWriter:](&v10, sel_initWithOutputWriter_, a3);
  v4 = v3;
  if (v3)
  {
    -[KSHTMLWriter setDocType:](v3, "setDocType:", KSHTMLWriterDocTypeHTML_5);
    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    IDs = v4->_IDs;
    v4->_IDs = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    classNames = v4->_classNames;
    v4->_classNames = v7;

  }
  return v4;
}

- (KSHTMLWriter)initWithOutputWriter:(id)a3 docType:(id)a4 encoding:(unint64_t)a5
{
  id v8;
  KSHTMLWriter *v9;
  KSHTMLWriter *v10;

  v8 = a4;
  v9 = -[KSXMLWriter initWithOutputWriter:encoding:](self, "initWithOutputWriter:encoding:", a3, a5);
  v10 = v9;
  if (v9)
    -[KSHTMLWriter setDocType:](v9, "setDocType:", v8);

  return v10;
}

- (void)startDocumentWithDocType:(id)a3 encoding:(unint64_t)a4
{
  id v6;
  objc_super v7;

  v6 = a3;
  -[KSHTMLWriter setDocType:](self, "setDocType:", v6);
  v7.receiver = self;
  v7.super_class = (Class)KSHTMLWriter;
  -[KSXMLWriter startDocumentWithDocType:encoding:](&v7, sel_startDocumentWithDocType_encoding_, v6, a4);

}

- (void)setDocType:(id)a3
{
  NSString *v4;
  NSString *docType;
  NSString *v6;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  docType = self->_docType;
  self->_docType = v4;
  v6 = v4;

  LOBYTE(docType) = objc_msgSend((id)objc_opt_class(), "isDocTypeXHTML:", v6);
  self->_isXHTML = (char)docType;
}

- (BOOL)isXHTML
{
  return self->_isXHTML;
}

- (id)currentElementClassName
{
  void *v3;

  v3 = (void *)-[NSMutableArray count](self->_classNames, "count");
  if (v3)
  {
    -[NSMutableArray componentsJoinedByString:](self->_classNames, "componentsJoinedByString:", CFSTR(" "));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)pushClassName:(id)a3
{
  -[NSMutableArray addObject:](self->_classNames, "addObject:", a3);
}

- (void)pushAttribute:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("class")))
  {
    -[KSHTMLWriter pushClassName:](self, "pushClassName:", v7);
  }
  else
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("id")))
      -[NSMutableSet addObject:](self->_IDs, "addObject:", v7);
    v8.receiver = self;
    v8.super_class = (Class)KSHTMLWriter;
    -[KSXMLWriter pushAttribute:value:](&v8, sel_pushAttribute_value_, v6, v7);
  }

}

- (id)currentAttributes
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)KSHTMLWriter;
  -[KSXMLWriter currentAttributes](&v6, sel_currentAttributes);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[KSHTMLWriter currentElementClassName](self, "currentElementClassName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addAttribute:value:", CFSTR("class"), v4);

  return v3;
}

- (BOOL)hasCurrentAttributes
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)KSHTMLWriter;
  return -[KSXMLWriter hasCurrentAttributes](&v4, sel_hasCurrentAttributes)
      || -[NSMutableArray count](self->_classNames, "count") != 0;
}

- (void)writeHTMLFormat:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (objc_class *)MEMORY[0x24BDD17C8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v7);

  -[KSHTMLWriter writeHTMLString:](self, "writeHTMLString:", v6);
}

- (void)startElement:(id)a3 className:(id)a4
{
  -[KSHTMLWriter startElement:idName:className:](self, "startElement:idName:className:", a3, 0, a4);
}

- (void)startElement:(id)a3 idName:(id)a4 className:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  if (v8)
    -[KSHTMLWriter pushAttribute:value:](self, "pushAttribute:value:", CFSTR("id"), v8);
  if (v9)
    -[KSHTMLWriter pushAttribute:value:](self, "pushAttribute:value:", CFSTR("class"), v9);
  -[KSXMLWriter startElement:](self, "startElement:", v10);

}

- (BOOL)isIDValid:(id)a3
{
  return -[NSMutableSet containsObject:](self->_IDs, "containsObject:", a3) ^ 1;
}

- (void)writeLineBreak
{
  -[KSXMLWriter startElement:](self, "startElement:", CFSTR("br"));
  -[KSXMLWriter endElement](self, "endElement");
}

- (void)startAnchorElementWithHref:(id)a3 title:(id)a4 target:(id)a5 rel:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v13 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v13)
    -[KSHTMLWriter pushAttribute:value:](self, "pushAttribute:value:", CFSTR("href"), v13);
  if (v11)
    -[KSHTMLWriter pushAttribute:value:](self, "pushAttribute:value:", CFSTR("target"), v11);
  if (v10)
    -[KSHTMLWriter pushAttribute:value:](self, "pushAttribute:value:", CFSTR("title"), v10);
  if (v12)
    -[KSHTMLWriter pushAttribute:value:](self, "pushAttribute:value:", CFSTR("rel"), v12);
  -[KSXMLWriter startElement:](self, "startElement:", CFSTR("a"));

}

- (void)writeImageWithSrc:(id)a3 alt:(id)a4 width:(id)a5 height:(id)a6
{
  id v10;
  id v11;
  id v12;

  v12 = a5;
  v10 = a6;
  v11 = a4;
  -[KSHTMLWriter pushAttribute:value:](self, "pushAttribute:value:", CFSTR("src"), a3);
  -[KSHTMLWriter pushAttribute:value:](self, "pushAttribute:value:", CFSTR("alt"), v11);

  if (v12)
    -[KSHTMLWriter pushAttribute:value:](self, "pushAttribute:value:", CFSTR("width"), v12);
  if (v10)
    -[KSHTMLWriter pushAttribute:value:](self, "pushAttribute:value:", CFSTR("height"), v10);
  -[KSXMLWriter startElement:](self, "startElement:", CFSTR("img"));
  -[KSXMLWriter endElement](self, "endElement");

}

- (void)writeLinkWithHref:(id)a3 type:(id)a4 rel:(id)a5 title:(id)a6 media:(id)a7
{
  __CFString *v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v16 = a3;
  v12 = (__CFString *)a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (v13)
    -[KSHTMLWriter pushAttribute:value:](self, "pushAttribute:value:", CFSTR("rel"), v13);
  if (!v12)
    v12 = CFSTR("text/css");
  -[KSHTMLWriter pushAttribute:value:](self, "pushAttribute:value:", CFSTR("type"), v12);
  -[KSHTMLWriter pushAttribute:value:](self, "pushAttribute:value:", CFSTR("href"), v16);
  if (v14)
    -[KSHTMLWriter pushAttribute:value:](self, "pushAttribute:value:", CFSTR("title"), v14);
  if (v15)
    -[KSHTMLWriter pushAttribute:value:](self, "pushAttribute:value:", CFSTR("media"), v15);
  -[KSXMLWriter startElement:](self, "startElement:", CFSTR("link"));
  -[KSXMLWriter endElement](self, "endElement");

}

- (void)writeLinkToStylesheet:(id)a3 title:(id)a4 media:(id)a5
{
  -[KSHTMLWriter writeLinkWithHref:type:rel:title:media:](self, "writeLinkWithHref:type:rel:title:media:", a3, 0, CFSTR("stylesheet"), a4, a5);
}

- (void)writeJavascriptWithSrc:(id)a3 encoding:(unint64_t)a4
{
  void *v6;
  CFStringEncoding v7;
  id v8;

  v8 = a3;
  if (-[KSXMLWriter encoding](self, "encoding") == a4)
  {
    v6 = 0;
  }
  else
  {
    v7 = CFStringConvertNSStringEncodingToEncoding(a4);
    CFStringConvertEncodingToIANACharSetName(v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[KSHTMLWriter writeJavascriptWithSrc:charset:](self, "writeJavascriptWithSrc:charset:", v8, v6);

}

- (void)writeJavascriptWithSrc:(id)a3 charset:(id)a4
{
  id v6;

  v6 = a3;
  if (a4)
    -[KSHTMLWriter pushAttribute:value:](self, "pushAttribute:value:", CFSTR("charset"), a4);
  -[KSHTMLWriter startJavascriptElementWithSrc:](self, "startJavascriptElementWithSrc:", v6);
  -[KSXMLWriter endElement](self, "endElement");

}

- (void)writeJavascript:(id)a3 useCDATA:(BOOL)a4
{
  _BOOL4 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  -[KSHTMLWriter startJavascriptElementWithSrc:](self, "startJavascriptElementWithSrc:", 0);
  if (v4)
  {
    -[KSHTMLWriter startJavascriptCDATA](self, "startJavascriptCDATA");
    -[KSXMLWriter writeString:](self, "writeString:", v6);
    -[KSHTMLWriter endJavascriptCDATA](self, "endJavascriptCDATA");
  }
  else
  {
    -[KSXMLWriter writeString:](self, "writeString:", v6);
  }
  -[KSXMLWriter endElement](self, "endElement");

}

- (void)startJavascriptElementWithSrc:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[KSHTMLWriter docType](self, "docType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", KSHTMLWriterDocTypeHTML_5);

  if ((v5 & 1) == 0)
    -[KSHTMLWriter pushAttribute:value:](self, "pushAttribute:value:", CFSTR("type"), CFSTR("text/javascript"));
  if (v6)
  {
    -[KSHTMLWriter pushAttribute:value:](self, "pushAttribute:value:", CFSTR("src"), v6);
    -[KSXMLWriter startElement:](self, "startElement:", CFSTR("script"));
  }
  else
  {
    -[KSXMLWriter startElement:](self, "startElement:", CFSTR("script"));
    -[KSXMLWriter writeString:](self, "writeString:", CFSTR("\n"));
    -[KSXMLWriter stopWritingInline](self, "stopWritingInline");
  }

}

- (void)startJavascriptCDATA
{
  -[KSXMLWriter writeString:](self, "writeString:", CFSTR("\n/* "));
  -[KSXMLWriter startCDATA](self, "startCDATA");
  -[KSXMLWriter writeString:](self, "writeString:", CFSTR(" */"));
}

- (void)endJavascriptCDATA
{
  -[KSXMLWriter writeString:](self, "writeString:", CFSTR("\n/* "));
  -[KSXMLWriter endCDATA](self, "endCDATA");
  -[KSXMLWriter writeString:](self, "writeString:", CFSTR(" */\n"));
}

- (void)writeParamElementWithName:(id)a3 value:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (v7)
    -[KSHTMLWriter pushAttribute:value:](self, "pushAttribute:value:", CFSTR("name"), v7);
  if (v6)
    -[KSHTMLWriter pushAttribute:value:](self, "pushAttribute:value:", CFSTR("value"), v6);
  -[KSXMLWriter startElement:](self, "startElement:", CFSTR("param"));
  -[KSXMLWriter endElement](self, "endElement");

}

- (void)writeStyleElementWithCSSString:(id)a3
{
  id v4;

  v4 = a3;
  -[KSHTMLWriter startStyleElementWithType:](self, "startStyleElementWithType:", CFSTR("text/css"));
  -[KSXMLWriter writeString:](self, "writeString:", v4);

  -[KSXMLWriter endElement](self, "endElement");
}

- (void)startStyleElementWithType:(id)a3
{
  if (a3)
    -[KSHTMLWriter pushAttribute:value:](self, "pushAttribute:value:", CFSTR("type"), a3);
  -[KSXMLWriter startElement:](self, "startElement:", CFSTR("style"));
}

- (BOOL)topElementIsList
{
  void *v2;
  char v3;

  -[KSXMLWriter topElement](self, "topElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("ul")) & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("ol"));

  return v3;
}

- (BOOL)elementCanBeEmpty:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("br")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("img")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("hr")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("meta")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("link")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("input")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("base")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("basefont")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("param")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("area")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("source"));
  }

  return v4;
}

- (BOOL)canWriteElementInline:(id)a3
{
  id v4;
  const __CFString *v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  switch(objc_msgSend(v4, "length"))
  {
    case 1:
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("a")) & 1) != 0
        || (objc_msgSend(v4, "isEqualToString:", CFSTR("b")) & 1) != 0
        || (objc_msgSend(v4, "isEqualToString:", CFSTR("i")) & 1) != 0
        || (objc_msgSend(v4, "isEqualToString:", CFSTR("u")) & 1) != 0)
      {
        goto LABEL_39;
      }
      v5 = CFSTR("q");
      break;
    case 2:
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("br")) & 1) != 0
        || (objc_msgSend(v4, "isEqualToString:", CFSTR("em")) & 1) != 0)
      {
        goto LABEL_39;
      }
      v5 = CFSTR("tt");
      break;
    case 3:
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("img")) & 1) != 0
        || (objc_msgSend(v4, "isEqualToString:", CFSTR("sup")) & 1) != 0
        || (objc_msgSend(v4, "isEqualToString:", CFSTR("sub")) & 1) != 0
        || (objc_msgSend(v4, "isEqualToString:", CFSTR("big")) & 1) != 0
        || (objc_msgSend(v4, "isEqualToString:", CFSTR("del")) & 1) != 0
        || (objc_msgSend(v4, "isEqualToString:", CFSTR("ins")) & 1) != 0
        || (objc_msgSend(v4, "isEqualToString:", CFSTR("dfn")) & 1) != 0
        || (objc_msgSend(v4, "isEqualToString:", CFSTR("map")) & 1) != 0
        || (objc_msgSend(v4, "isEqualToString:", CFSTR("var")) & 1) != 0
        || (objc_msgSend(v4, "isEqualToString:", CFSTR("bdo")) & 1) != 0)
      {
        goto LABEL_39;
      }
      v5 = CFSTR("kbd");
      break;
    case 4:
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("span")) & 1) != 0
        || (objc_msgSend(v4, "isEqualToString:", CFSTR("font")) & 1) != 0
        || (objc_msgSend(v4, "isEqualToString:", CFSTR("abbr")) & 1) != 0
        || (objc_msgSend(v4, "isEqualToString:", CFSTR("cite")) & 1) != 0
        || (objc_msgSend(v4, "isEqualToString:", CFSTR("code")) & 1) != 0)
      {
        goto LABEL_39;
      }
      v5 = CFSTR("samp");
      break;
    case 5:
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("small")) & 1) != 0
        || (objc_msgSend(v4, "isEqualToString:", CFSTR("input")) & 1) != 0)
      {
        goto LABEL_39;
      }
      v5 = CFSTR("label");
      break;
    case 6:
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("strong")) & 1) != 0
        || (objc_msgSend(v4, "isEqualToString:", CFSTR("select")) & 1) != 0
        || (objc_msgSend(v4, "isEqualToString:", CFSTR("button")) & 1) != 0
        || (objc_msgSend(v4, "isEqualToString:", CFSTR("object")) & 1) != 0
        || (objc_msgSend(v4, "isEqualToString:", CFSTR("applet")) & 1) != 0)
      {
        goto LABEL_39;
      }
      v5 = CFSTR("script");
      break;
    case 7:
      v5 = CFSTR("acronym");
      break;
    case 8:
      v5 = CFSTR("textarea");
      break;
    default:
      goto LABEL_40;
  }
  if ((objc_msgSend(v4, "isEqualToString:", v5) & 1) != 0)
  {
LABEL_39:
    v6 = 1;
  }
  else
  {
LABEL_40:
    v8.receiver = self;
    v8.super_class = (Class)KSHTMLWriter;
    v6 = -[KSXMLWriter canWriteElementInline:](&v8, sel_canWriteElementInline_, v4);
  }

  return v6;
}

- (BOOL)validateElement:(id)a3
{
  id v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)KSHTMLWriter;
  if (-[KSXMLWriter validateElement:](&v7, sel_validateElement_, v4))
  {
    if (-[KSHTMLWriter topElementIsList](self, "topElementIsList"))
      v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("li"));
    else
      v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)validateAttribute:(id)a3 value:(id)a4 ofElement:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  objc_super v14;

  v8 = a3;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)KSHTMLWriter;
  -[KSXMLWriter validateAttribute:value:ofElement:](&v14, sel_validateAttribute_value_ofElement_, v8, a4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("li")))
    {
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("value")))
      {
        -[KSXMLWriter topElement](self, "topElement");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("ol"));

        if ((v12 & 1) == 0)
        {

          v10 = 0;
        }
      }
    }
  }

  return v10;
}

- (void)startElement:(id)a3 writeInline:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  objc_super v12;
  objc_super v13;

  v4 = a4;
  v7 = a3;
  objc_msgSend(v7, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("KSHTMLWriter.m"), 475, CFSTR("Attempt to start non-lowercase element: %@"), v7);

  }
  -[KSHTMLWriter currentElementClassName](self, "currentElementClassName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[NSMutableArray removeAllObjects](self->_classNames, "removeAllObjects");
    v13.receiver = self;
    v13.super_class = (Class)KSHTMLWriter;
    -[KSXMLWriter pushAttribute:value:](&v13, sel_pushAttribute_value_, CFSTR("class"), v10);
  }
  v12.receiver = self;
  v12.super_class = (Class)KSHTMLWriter;
  -[KSXMLWriter startElement:writeInline:](&v12, sel_startElement_writeInline_, v7, v4);

}

- (void)closeEmptyElementTag
{
  objc_super v3;

  if (-[KSHTMLWriter isXHTML](self, "isXHTML"))
  {
    v3.receiver = self;
    v3.super_class = (Class)KSHTMLWriter;
    -[KSXMLWriter closeEmptyElementTag](&v3, sel_closeEmptyElementTag);
  }
  else
  {
    -[KSXMLWriter writeString:](self, "writeString:", CFSTR(">"));
  }
}

- (NSString)docType
{
  return self->_docType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classNames, 0);
  objc_storeStrong((id *)&self->_IDs, 0);
  objc_storeStrong((id *)&self->_docType, 0);
}

+ (BOOL)isDocTypeXHTML:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", KSHTMLWriterDocTypeHTML_4_01_Strict) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", KSHTMLWriterDocTypeHTML_4_01_Transitional) & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", KSHTMLWriterDocTypeHTML_4_01_Frameset) ^ 1;
  }

  return v4;
}

@end
