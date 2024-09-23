@implementation ENXMLWriter

- (ENXMLWriter)init
{
  return -[ENXMLWriter initWithDelegate:](self, "initWithDelegate:", 0);
}

- (ENXMLWriter)initWithDelegate:(id)a3
{
  id v4;
  ENXMLWriter *v5;
  ENXMLWriter *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ENXMLWriter;
  v5 = -[ENXMLWriter init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ENXMLWriter setDelegate:](v5, "setDelegate:", v4);

  return v6;
}

- (void)dealloc
{
  _xmlTextWriter *xmlWriter;
  objc_super v4;

  xmlWriter = self->_xmlWriter;
  if (xmlWriter)
  {
    xmlFreeTextWriter(xmlWriter);
    self->_xmlWriter = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)ENXMLWriter;
  -[ENXMLWriter dealloc](&v4, sel_dealloc);
}

- (void)startDocument
{
  id WeakRetained;
  int (__cdecl *v4)(void *, const char *, int);
  int (__cdecl *v5)(void *);
  void *v6;
  NSMutableString *v7;
  NSMutableString *contents;
  _xmlOutputBuffer *IO;
  uint64_t v10;
  _xmlTextWriter *v11;
  uint64_t v12;
  uint64_t v13;
  ENXMLDTD *dtd;
  void *v15;
  _xmlTextWriter *xmlWriter;
  const char *CharEncodingName;
  uint64_t started;
  _xmlTextWriter *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v4 = (int (__cdecl *)(void *, const char *, int))ENXMLWriter_delegateWriteCallback;
    v5 = (int (__cdecl *)(void *))ENXMLWriter_delegateCloseCallback;
    v6 = self;
  }
  else
  {
    v7 = (NSMutableString *)objc_alloc_init(MEMORY[0x24BDD16A8]);
    contents = self->_contents;
    self->_contents = v7;

    v6 = self->_contents;
    v4 = (int (__cdecl *)(void *, const char *, int))ENXMLWriter_contentsWriteCallback;
    v5 = 0;
  }
  IO = xmlOutputBufferCreateIO(v4, v5, v6, 0);
  self->_xmlOutputBuffer = IO;
  if (IO)
    v10 = 0;
  else
    v10 = 0xFFFFFFFFLL;
  CheckXMLResult(v10, CFSTR("xmlOutputBufferCreateIO"));
  v11 = xmlNewTextWriter(self->_xmlOutputBuffer);
  self->_xmlWriter = v11;
  if (v11)
    v12 = 0;
  else
    v12 = 0xFFFFFFFFLL;
  CheckXMLResult(v12, CFSTR("xmlNewTextWriter"));
  v13 = xmlTextWriterSetIndent(self->_xmlWriter, 0);
  CheckXMLResult(v13, CFSTR("xmlTextWriterSetIndent"));
  dtd = self->_dtd;
  if (dtd)
  {
    -[ENXMLDTD docTypeDeclaration](dtd, "docTypeDeclaration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      xmlWriter = self->_xmlWriter;
      CharEncodingName = xmlGetCharEncodingName(XML_CHAR_ENCODING_UTF8);
      started = xmlTextWriterStartDocument(xmlWriter, 0, CharEncodingName, "no");
      CheckXMLResult(started, CFSTR("xmlTextWriterStartDocument"));
      v19 = self->_xmlWriter;
      -[ENXMLDTD docTypeDeclaration](self->_dtd, "docTypeDeclaration");
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v21 = xmlTextWriterWriteRaw(v19, (const xmlChar *)objc_msgSend(v20, "cStringUsingEncoding:", 4));

      CheckXMLResult(v21, CFSTR("xmlTextWriterWriteRaw"));
    }
  }
  v22 = xmlTextWriterWriteRaw(self->_xmlWriter, (const xmlChar *)"\n");
  CheckXMLResult(v22, CFSTR("xmlTextWriterWriteRaw"));
}

- (void)endDocument
{
  uint64_t v3;

  v3 = xmlTextWriterEndDocument(self->_xmlWriter);
  CheckXMLResult(v3, CFSTR("xmlTextWriterEndDocument"));
  xmlFreeTextWriter(self->_xmlWriter);
  self->_xmlWriter = 0;
}

- (BOOL)startElement:(id)a3
{
  id v4;
  ENXMLDTD *dtd;
  _xmlTextWriter *xmlWriter;
  id v7;
  uint64_t started;
  BOOL v9;

  v4 = a3;
  dtd = self->_dtd;
  if (dtd && !-[ENXMLDTD isElementLegal:](dtd, "isElementLegal:", v4))
  {
    v9 = 0;
  }
  else
  {
    xmlWriter = self->_xmlWriter;
    v7 = objc_retainAutorelease(v4);
    started = xmlTextWriterStartElement(xmlWriter, (const xmlChar *)objc_msgSend(v7, "cStringUsingEncoding:", 4));
    CheckXMLResult(started, CFSTR("xmlTextWriterStartElement"));
    ++self->_openElementCount;
    -[ENXMLWriter setCurrentElementName:](self, "setCurrentElementName:", v7);
    v9 = 1;
  }

  return v9;
}

- (BOOL)startElement:(id)a3 attributes:(id)a4
{
  id v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = -[ENXMLWriter startElement:](self, "startElement:", a3);
  if (v7)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v6, "allKeys", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v6, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            -[ENXMLWriter writeAttributeName:value:](self, "writeAttributeName:value:", v13, v14);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

  }
  return v7;
}

- (void)endElement
{
  uint64_t v3;

  v3 = xmlTextWriterEndElement(self->_xmlWriter);
  CheckXMLResult(v3, CFSTR("xmlTextWriterEndElement"));
  -[ENXMLWriter setCurrentElementName:](self, "setCurrentElementName:", 0);
  --self->_openElementCount;
}

- (BOOL)writeElement:(id)a3 attributes:(id)a4 content:(id)a5
{
  id v8;
  _BOOL4 v9;

  v8 = a5;
  v9 = -[ENXMLWriter startElement:attributes:](self, "startElement:attributes:", a3, a4);
  if (v9)
  {
    -[ENXMLWriter writeString:](self, "writeString:", v8);
    -[ENXMLWriter endElement](self, "endElement");
  }

  return v9;
}

- (BOOL)writeAttributeName:(id)a3 value:(id)a4
{
  id v6;
  __CFString *v7;
  __CFString *v8;
  ENXMLDTD *dtd;
  void *v10;
  _xmlTextWriter *xmlWriter;
  const xmlChar *v12;
  id v13;
  uint64_t v14;
  BOOL v15;

  v6 = a3;
  v7 = (__CFString *)a4;
  if (v7)
    v8 = v7;
  else
    v8 = &stru_24F8BBA48;
  dtd = self->_dtd;
  if (dtd
    && !-[ENXMLDTD isAttributeLegal:inElement:](dtd, "isAttributeLegal:inElement:", v6, self->_currentElementName))
  {
    v15 = 0;
  }
  else
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", v8);
    objc_msgSend(v10, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&#38;"),
      CFSTR("&"),
      0,
      0,
      objc_msgSend(v10, "length"));
    xmlWriter = self->_xmlWriter;
    v12 = (const xmlChar *)objc_msgSend(objc_retainAutorelease(v6), "cStringUsingEncoding:", 4);
    v13 = objc_retainAutorelease(v10);
    v14 = xmlTextWriterWriteAttribute(xmlWriter, v12, (const xmlChar *)objc_msgSend(v13, "cStringUsingEncoding:", 4));
    CheckXMLResult(v14, CFSTR("xmlTextWriterWriteAttribute"));

    v15 = 1;
  }

  return v15;
}

- (void)writeString:(id)a3 raw:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  _xmlTextWriter *xmlWriter;
  const xmlChar *v8;
  uint64_t v9;
  __CFString *v10;
  id v11;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    xmlWriter = self->_xmlWriter;
    v11 = v6;
    v8 = (const xmlChar *)objc_msgSend(objc_retainAutorelease(v6), "cStringUsingEncoding:", 4);
    if (v4)
    {
      v9 = xmlTextWriterWriteRaw(xmlWriter, v8);
      v10 = CFSTR("xmlTextWriterWriteRaw");
    }
    else
    {
      v9 = xmlTextWriterWriteString(xmlWriter, v8);
      v10 = CFSTR("xmlTextWriterWriteString");
    }
    CheckXMLResult(v9, v10);
    v6 = v11;
  }

}

- (void)writeRawString:(id)a3
{
  -[ENXMLWriter writeString:raw:](self, "writeString:raw:", a3, 1);
}

- (void)writeString:(id)a3
{
  -[ENXMLWriter writeString:raw:](self, "writeString:raw:", a3, 0);
}

- (void)startCDATA
{
  uint64_t started;

  started = xmlTextWriterStartCDATA(self->_xmlWriter);
  CheckXMLResult(started, CFSTR("xmlTextWriterStartCDATA"));
}

- (void)writeCDATA:(id)a3
{
  uint64_t v3;

  v3 = xmlTextWriterWriteCDATA(self->_xmlWriter, (const xmlChar *)objc_msgSend(objc_retainAutorelease(a3), "cStringUsingEncoding:", 4));
  CheckXMLResult(v3, CFSTR("xmlTextWriterWriteCDATA"));
}

- (void)endCDATA
{
  uint64_t v2;

  v2 = xmlTextWriterEndCDATA(self->_xmlWriter);
  CheckXMLResult(v2, CFSTR("xmlTextWriterEndCDATA"));
}

- (NSString)currentElementName
{
  return self->_currentElementName;
}

- (void)setCurrentElementName:(id)a3
{
  objc_storeStrong((id *)&self->_currentElementName, a3);
}

- (ENXMLWriterDelegate)delegate
{
  return (ENXMLWriterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)contents
{
  return &self->_contents->super;
}

- (ENXMLDTD)dtd
{
  return self->_dtd;
}

- (void)setDtd:(id)a3
{
  objc_storeStrong((id *)&self->_dtd, a3);
}

- (unint64_t)openElementCount
{
  return self->_openElementCount;
}

- (void)setOpenElementCount:(unint64_t)a3
{
  self->_openElementCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentElementName, 0);
  objc_storeStrong((id *)&self->_dtd, 0);
  objc_storeStrong((id *)&self->_contents, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
