@implementation KSXMLWriter

- (KSXMLWriter)initWithOutputWriter:(id)a3
{
  id v4;
  KSXMLWriter *v5;
  KSXMLAttributes *v6;
  KSXMLAttributes *attributes;
  NSMutableArray *v8;
  NSMutableArray *openElements;
  uint64_t v10;
  KSXMLElementContentsProxy *v11;
  KSXMLElementContentsProxy *contentsProxy;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)KSXMLWriter;
  v5 = -[KSForwardingWriter initWithOutputWriter:](&v14, sel_initWithOutputWriter_, v4);
  if (v5)
  {
    v6 = objc_alloc_init(KSXMLAttributes);
    attributes = v5->_attributes;
    v5->_attributes = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    openElements = v5->_openElements;
    v5->_openElements = v8;

    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = objc_msgSend(v4, "encoding");
    else
      v10 = 4;
    v5->_encoding = v10;
    v11 = [KSXMLElementContentsProxy alloc];
    contentsProxy = v5->_contentsProxy;
    v5->_contentsProxy = v11;

  }
  return v5;
}

- (KSXMLWriter)initWithOutputWriter:(id)a3 encoding:(unint64_t)a4
{
  KSXMLWriter *v5;
  KSXMLWriter *v6;

  v5 = -[KSXMLWriter initWithOutputWriter:](self, "initWithOutputWriter:", a3);
  v6 = v5;
  if (v5)
    -[KSXMLWriter setEncoding:](v5, "setEncoding:", a4);
  return v6;
}

- (void)close
{
  objc_super v3;

  -[KSXMLWriter flush](self, "flush");
  v3.receiver = self;
  v3.super_class = (Class)KSXMLWriter;
  -[KSForwardingWriter close](&v3, sel_close);
}

- (void)startDocumentWithDocType:(id)a3 encoding:(unint64_t)a4
{
  id v6;

  v6 = a3;
  -[KSXMLWriter writeString:](self, "writeString:", CFSTR("<!DOCTYPE "));
  -[KSXMLWriter writeString:](self, "writeString:", v6);

  -[KSXMLWriter writeString:](self, "writeString:", CFSTR(">"));
  -[KSXMLWriter startNewline](self, "startNewline");
  -[KSXMLWriter setEncoding:](self, "setEncoding:", a4);
}

- (void)writeCharacters:(id)a3
{
  -[KSXMLWriter writeStringByEscapingXMLEntities:escapeQuot:](self, "writeStringByEscapingXMLEntities:escapeQuot:", a3, 0);
}

- (id)writeElement:(id)a3 contentsInvocationTarget:(id)a4
{
  id v6;

  v6 = a4;
  -[KSXMLWriter startElement:](self, "startElement:", a3);
  -[KSXMLElementContentsProxy ks_prepareWithTarget:XMLWriter:](self->_contentsProxy, "ks_prepareWithTarget:XMLWriter:", v6, self);

  return self->_contentsProxy;
}

- (void)writeElement:(id)a3 text:(id)a4
{
  id v6;

  v6 = a4;
  -[KSXMLWriter startElement:attributes:](self, "startElement:attributes:", a3, 0);
  -[KSXMLWriter writeCharacters:](self, "writeCharacters:", v6);

  -[KSXMLWriter endElement](self, "endElement");
}

- (void)startElement:(id)a3
{
  id v4;

  v4 = a3;
  -[KSXMLWriter startElement:writeInline:](self, "startElement:writeInline:", v4, -[KSXMLWriter canWriteElementInline:](self, "canWriteElementInline:", v4));

}

- (void)startElement:(id)a3 writeInline:(BOOL)a4
{
  id v6;

  v6 = a3;
  if (!a4)
  {
    -[KSXMLWriter startNewline](self, "startNewline");
    -[KSXMLWriter stopWritingInline](self, "stopWritingInline");
  }
  -[KSXMLWriter willStartElement:](self, "willStartElement:", v6);
  -[KSXMLWriter writeString:](self, "writeString:", CFSTR("<"));
  -[KSXMLWriter writeString:](self, "writeString:", v6);
  -[KSXMLWriter pushElement:](self, "pushElement:", v6);
  -[KSXMLWriter startWritingInline](self, "startWritingInline");
  -[KSXMLAttributes writeAttributes:](self->_attributes, "writeAttributes:", self);
  -[KSXMLAttributes close](self->_attributes, "close");
  -[KSXMLWriter didStartElement](self, "didStartElement");
  -[KSXMLWriter increaseIndentationLevel](self, "increaseIndentationLevel");

}

- (void)startElement:(id)a3 attributes:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[KSXMLWriter pushAttribute:value:](self, "pushAttribute:value:", v12, v13);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }
  -[KSXMLWriter startElement:](self, "startElement:", v6);

}

- (void)endElement
{
  void *v3;

  -[KSXMLWriter decreaseIndentationLevel](self, "decreaseIndentationLevel");
  if (!-[KSXMLWriter isWritingInline](self, "isWritingInline"))
    -[KSXMLWriter startNewline](self, "startNewline");
  if (self->_elementIsEmpty)
  {
    -[KSXMLWriter popElement](self, "popElement");
    -[KSXMLWriter closeEmptyElementTag](self, "closeEmptyElementTag");
  }
  else
  {
    -[KSXMLWriter topElement](self, "topElement");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[KSXMLWriter writeEndTag:](self, "writeEndTag:", v3);

    -[KSXMLWriter popElement](self, "popElement");
  }
}

- (void)pushElement:(id)a3
{
  -[NSMutableArray addObject:](self->_openElements, "addObject:", a3);
}

- (void)popElement
{
  self->_elementIsEmpty = 0;
  -[NSMutableArray removeLastObject](self->_openElements, "removeLastObject");
  if (!-[KSXMLWriter isWritingInline](self, "isWritingInline"))
    -[KSXMLWriter stopWritingInline](self, "stopWritingInline");
}

- (void)pushAttribute:(id)a3 value:(id)a4
{
  -[KSXMLAttributes addAttribute:value:](self->_attributes, "addAttribute:value:", a3, a4);
}

- (id)currentAttributes
{
  return (id)-[KSXMLAttributes copy](self->_attributes, "copy");
}

- (BOOL)hasCurrentAttributes
{
  return -[KSXMLAttributes hasAttributes](self->_attributes, "hasAttributes");
}

- (void)writeAttributeValue:(id)a3
{
  id v4;

  objc_msgSend(a3, "stringByUnescapingCrititcalXMLEntities");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[KSXMLWriter writeStringByEscapingXMLEntities:escapeQuot:](self, "writeStringByEscapingXMLEntities:escapeQuot:", v4, 1);

}

- (void)writeAttribute:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "description");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[KSXMLWriter writeString:](self, "writeString:", CFSTR(" "));
  -[KSXMLWriter writeString:](self, "writeString:", v7);

  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v6)
  {
    -[KSXMLWriter writeString:](self, "writeString:", CFSTR("=\"));
    -[KSXMLWriter writeAttributeValue:](self, "writeAttributeValue:", v9);
    -[KSXMLWriter writeString:](self, "writeString:", CFSTR("\"));
  }

}

- (void)startNewline
{
  int64_t v3;

  -[KSXMLWriter writeString:](self, "writeString:", CFSTR("\n"));
  if (-[KSXMLWriter indentationLevel](self, "indentationLevel") >= 1)
  {
    v3 = 0;
    do
    {
      -[KSXMLWriter writeString:](self, "writeString:", CFSTR("\t"));
      ++v3;
    }
    while (-[KSXMLWriter indentationLevel](self, "indentationLevel") > v3);
  }
}

- (void)writeComment:(id)a3
{
  id v4;

  v4 = a3;
  -[KSXMLWriter openComment](self, "openComment");
  -[KSXMLWriter writeStringByEscapingXMLEntities:escapeQuot:](self, "writeStringByEscapingXMLEntities:escapeQuot:", v4, 1);

  -[KSXMLWriter closeComment](self, "closeComment");
}

- (void)openComment
{
  -[KSXMLWriter writeString:](self, "writeString:", CFSTR("<!--"));
}

- (void)closeComment
{
  -[KSXMLWriter writeString:](self, "writeString:", CFSTR("-->"));
}

- (void)startCDATA
{
  -[KSXMLWriter writeString:](self, "writeString:", CFSTR("<![CDATA["));
}

- (void)endCDATA
{
  -[KSXMLWriter writeString:](self, "writeString:", CFSTR("]]>"));
}

- (void)increaseIndentationLevel
{
  -[KSXMLWriter setIndentationLevel:](self, "setIndentationLevel:", -[KSXMLWriter indentationLevel](self, "indentationLevel") + 1);
}

- (void)decreaseIndentationLevel
{
  -[KSXMLWriter setIndentationLevel:](self, "setIndentationLevel:", -[KSXMLWriter indentationLevel](self, "indentationLevel") - 1);
}

- (BOOL)validateElement:(id)a3
{
  void *v6;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("KSXMLWriter.m"), 367, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("element"));

  }
  return 1;
}

- (id)validateAttribute:(id)a3 value:(id)a4 ofElement:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v14;
  void *v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("KSXMLWriter.m"), 373, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

    if (v12)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("KSXMLWriter.m"), 374, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("element"));

    goto LABEL_3;
  }
  if (!v11)
    goto LABEL_5;
LABEL_3:

  return v10;
}

- (BOOL)canWriteElementInline:(id)a3
{
  return self->_inlineWritingLevel == 0;
}

- (NSArray)openElements
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_openElements, "copy");
}

- (unint64_t)openElementsCount
{
  return -[NSMutableArray count](self->_openElements, "count");
}

- (BOOL)hasOpenElement:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_openElements;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "isEqualToString:", v4, (_QWORD)v10) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)topElement
{
  return (id)-[NSMutableArray lastObject](self->_openElements, "lastObject");
}

- (void)didStartElement
{
  void *v3;

  -[KSXMLWriter topElement](self, "topElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_elementIsEmpty = -[KSXMLWriter elementCanBeEmpty:](self, "elementCanBeEmpty:", v3);

  if (!self->_elementIsEmpty)
    -[KSXMLWriter closeStartTag](self, "closeStartTag");
}

- (void)closeStartTag
{
  -[KSXMLWriter writeString:](self, "writeString:", CFSTR(">"));
}

- (void)closeEmptyElementTag
{
  -[KSXMLWriter writeString:](self, "writeString:", CFSTR(" />"));
}

- (void)writeEndTag:(id)a3
{
  id v4;

  v4 = a3;
  -[KSXMLWriter writeString:](self, "writeString:", CFSTR("</"));
  -[KSXMLWriter writeString:](self, "writeString:", v4);

  -[KSXMLWriter writeString:](self, "writeString:", CFSTR(">"));
}

- (BOOL)elementCanBeEmpty:(id)a3
{
  return 1;
}

- (BOOL)isWritingInline
{
  return -[KSXMLWriter openElementsCount](self, "openElementsCount") >= self->_inlineWritingLevel;
}

- (void)startWritingInline
{
  if (self->_inlineWritingLevel - 0x7FFFFFFFFFFFFFFFLL <= 0x8000000000000001)
    self->_inlineWritingLevel = -[KSXMLWriter openElementsCount](self, "openElementsCount");
}

- (void)stopWritingInline
{
  self->_inlineWritingLevel = 0x7FFFFFFFFFFFFFFFLL;
}

- (void)writeStringByEscapingXMLEntities:(id)a3 escapeQuot:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  KSXMLWriter *v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;

  v4 = a4;
  v24 = a3;
  v7 = &sCharactersToEntityEscapeWithQuot;
  if (!v4)
    v7 = &sCharactersToEntityEscapeWithoutQuot;
  v8 = (id)*v7;
  v9 = objc_msgSend(v24, "length");
  v10 = objc_msgSend(v24, "rangeOfCharacterFromSet:options:range:", v8, 0, 0, v9);
  v12 = v24;
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!v9)
      goto LABEL_28;
    v13 = v10;
    v14 = v11;
    v15 = 0;
    while (1)
    {
      if (v13 == 0x7FFFFFFFFFFFFFFFLL)
        v16 = v9;
      else
        v16 = v13 - v15;
      if (v16)
      {
        objc_msgSend(v24, "substringWithRange:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[KSXMLWriter writeString:](self, "writeString:", v17);

      }
      if (v13 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_28;
      if (v14 != 1)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", v12);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("KSXMLWriter.m"), 516, CFSTR("trying to escaping non-single character string"));

      }
      v18 = objc_msgSend(v24, "characterAtIndex:", v13);
      if (v18 > 59)
      {
        if (v18 == 60)
        {
          v19 = self;
          v20 = CFSTR("&lt;");
        }
        else
        {
          if (v18 != 62)
          {
LABEL_27:
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("&#%d;"), v18);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[KSXMLWriter writeString:](self, "writeString:", v22);

            goto LABEL_25;
          }
          v19 = self;
          v20 = CFSTR("&gt;");
        }
      }
      else if (v18 == 34)
      {
        v19 = self;
        v20 = CFSTR("&quot;");
      }
      else
      {
        if (v18 != 38)
          goto LABEL_27;
        v19 = self;
        v20 = CFSTR("&amp;");
      }
      -[KSXMLWriter writeString:](v19, "writeString:", v20);
LABEL_25:
      v15 = v14 + v13;
      v9 = objc_msgSend(v24, "length") - (v14 + v13);
      v13 = objc_msgSend(v24, "rangeOfCharacterFromSet:options:range:", v8, 0, v14 + v13, v9);
      v14 = v21;
      if (!v9)
        goto LABEL_28;
    }
  }
  -[KSXMLWriter writeString:](self, "writeString:", v24);
LABEL_28:

}

- (void)setEncoding:(unint64_t)a3
{
  CFStringEncoding v5;

  if (a3 > 0xA || ((1 << a3) & 0x432) == 0)
  {
    v5 = CFStringConvertNSStringEncodingToEncoding(a3);
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Unsupported character encoding %@ (%u)"), CFStringGetNameOfEncoding(v5), a3);
  }
  self->_encoding = a3;
}

- (void)writeString:(id)a3
{
  __CFString *v5;
  CFIndex Length;
  CFIndex v7;
  CFIndex v8;
  CFStringEncoding v9;
  CFIndex Bytes;
  CFIndex v11;
  void *v12;
  int v13;
  void *v14;
  CFStringRef v15;
  void *v16;
  objc_super v17;
  objc_super v18;
  objc_super v19;
  objc_super v20;
  objc_super v21;
  objc_super v22;
  objc_super v23;
  objc_super v24;
  objc_super v25;
  objc_super v26;
  CFRange v27;
  CFRange v28;

  v5 = (__CFString *)a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("KSXMLWriter.m"), 563, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nil != string"));

  }
  if (self->_elementIsEmpty && -[__CFString length](v5, "length"))
  {
    self->_elementIsEmpty = 0;
    -[KSXMLWriter closeStartTag](self, "closeStartTag");
  }
  Length = CFStringGetLength(v5);
  if (Length)
  {
    v7 = Length;
    v8 = 0;
    do
    {
      v9 = CFStringConvertNSStringEncodingToEncoding(-[KSXMLWriter encoding](self, "encoding"));
      v27.location = v8;
      v27.length = v7;
      Bytes = CFStringGetBytes(v5, v27, v9, 0, 0, 0, 0, 0);
      if (Bytes >= v7)
      {
        if (v8)
        {
          v28.location = v8;
          v28.length = v7;
          v15 = CFStringCreateWithSubstring(0, v5, v28);
          v17.receiver = self;
          v17.super_class = (Class)KSXMLWriter;
          -[KSForwardingWriter writeString:](&v17, sel_writeString_, v15);
          CFRelease(v15);
        }
        else
        {
          v18.receiver = self;
          v18.super_class = (Class)KSXMLWriter;
          -[KSForwardingWriter writeString:](&v18, sel_writeString_, v5);
        }
        break;
      }
      v11 = Bytes;
      if (Bytes)
      {
        -[__CFString substringWithRange:](v5, "substringWithRange:", v8, Bytes);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v26.receiver = self;
        v26.super_class = (Class)KSXMLWriter;
        -[KSForwardingWriter writeString:](&v26, sel_writeString_, v12);

      }
      v13 = -[__CFString characterAtIndex:](v5, "characterAtIndex:", v11 + v8);
      if (v13 > 8210)
      {
        switch(v13)
        {
          case 8211:
            v22.receiver = self;
            v22.super_class = (Class)KSXMLWriter;
            -[KSForwardingWriter writeString:](&v22, sel_writeString_, CFSTR("&ndash;"));
            break;
          case 8212:
            v21.receiver = self;
            v21.super_class = (Class)KSXMLWriter;
            -[KSForwardingWriter writeString:](&v21, sel_writeString_, CFSTR("&mdash;"));
            break;
          case 8364:
            v20.receiver = self;
            v20.super_class = (Class)KSXMLWriter;
            -[KSForwardingWriter writeString:](&v20, sel_writeString_, CFSTR("&euro;"));
            break;
          default:
LABEL_26:
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("&#%d;"), v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v19.receiver = self;
            v19.super_class = (Class)KSXMLWriter;
            -[KSForwardingWriter writeString:](&v19, sel_writeString_, v14);

            break;
        }
      }
      else
      {
        switch(v13)
        {
          case 160:
            v25.receiver = self;
            v25.super_class = (Class)KSXMLWriter;
            -[KSForwardingWriter writeString:](&v25, sel_writeString_, CFSTR("&nbsp;"));
            break;
          case 169:
            v24.receiver = self;
            v24.super_class = (Class)KSXMLWriter;
            -[KSForwardingWriter writeString:](&v24, sel_writeString_, CFSTR("&copy;"));
            break;
          case 174:
            v23.receiver = self;
            v23.super_class = (Class)KSXMLWriter;
            -[KSForwardingWriter writeString:](&v23, sel_writeString_, CFSTR("&reg;"));
            break;
          default:
            goto LABEL_26;
        }
      }
      v8 += v11 + 1;
      v7 -= v11 + 1;
    }
    while (v7);
  }

}

- (int64_t)indentationLevel
{
  return self->_indentation;
}

- (void)setIndentationLevel:(int64_t)a3
{
  self->_indentation = a3;
}

- (unint64_t)encoding
{
  return self->_encoding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentsProxy, 0);
  objc_storeStrong((id *)&self->_openElements, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

+ (id)stringFromCharacters:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDD16A8];
  v5 = a3;
  objc_msgSend(v4, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithOutputWriter:", v6);
  objc_msgSend(v7, "writeCharacters:", v5);

  return v6;
}

+ (id)stringFromAttributeValue:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDD16A8];
  v5 = a3;
  objc_msgSend(v4, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithOutputWriter:", v6);
  objc_msgSend(v7, "writeAttributeValue:", v5);

  return v6;
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if (!sCharactersToEntityEscapeWithQuot)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("&<>\"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)sCharactersToEntityEscapeWithQuot;
    sCharactersToEntityEscapeWithQuot = v2;

  }
  if (!sCharactersToEntityEscapeWithoutQuot)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("&<>"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)sCharactersToEntityEscapeWithoutQuot;
    sCharactersToEntityEscapeWithoutQuot = v4;

  }
}

@end
