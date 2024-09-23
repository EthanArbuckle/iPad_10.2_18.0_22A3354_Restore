@implementation ENHTMLtoENMLConverter

- (id)enmlWriter
{
  ENMLWriter *enmlWriter;
  ENMLWriter *v4;
  ENMLWriter *v5;

  enmlWriter = self->_enmlWriter;
  if (!enmlWriter)
  {
    v4 = -[ENXMLWriter initWithDelegate:]([ENMLWriter alloc], "initWithDelegate:", self);
    v5 = self->_enmlWriter;
    self->_enmlWriter = v4;

    enmlWriter = self->_enmlWriter;
  }
  return enmlWriter;
}

- (id)htmlParser
{
  ENXMLSaxParser *htmlParser;
  ENXMLSaxParser *v4;
  ENXMLSaxParser *v5;

  htmlParser = self->_htmlParser;
  if (!htmlParser)
  {
    v4 = objc_alloc_init(ENXMLSaxParser);
    v5 = self->_htmlParser;
    self->_htmlParser = v4;

    -[ENXMLSaxParser setIsHTML:](self->_htmlParser, "setIsHTML:", 1);
    -[ENXMLSaxParser setDelegate:](self->_htmlParser, "setDelegate:", self);
    htmlParser = self->_htmlParser;
  }
  return htmlParser;
}

- (id)enmlFromContentsOfHTMLFile:(id)a3
{
  objc_class *v4;
  id v5;
  NSMutableString *v6;
  NSMutableString *enml;
  void *v8;

  v4 = (objc_class *)MEMORY[0x24BDD16A8];
  v5 = a3;
  v6 = (NSMutableString *)objc_alloc_init(v4);
  enml = self->_enml;
  self->_enml = v6;

  -[ENHTMLtoENMLConverter htmlParser](self, "htmlParser");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "parseContentsOfFile:", v5);

  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", self->_enml);
}

- (id)enmlFromHTMLContent:(id)a3
{
  objc_class *v4;
  id v5;
  NSMutableString *v6;
  NSMutableString *enml;
  void *v8;

  v4 = (objc_class *)MEMORY[0x24BDD16A8];
  v5 = a3;
  v6 = (NSMutableString *)objc_alloc_init(v4);
  enml = self->_enml;
  self->_enml = v6;

  -[ENHTMLtoENMLConverter htmlParser](self, "htmlParser");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "parseContents:", v5);

  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", self->_enml);
}

- (void)writeData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ENHTMLtoENMLConverter htmlParser](self, "htmlParser");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendData:", v4);

}

- (void)finish
{
  id v2;

  -[ENHTMLtoENMLConverter htmlParser](self, "htmlParser");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finalizeParser");

}

- (void)cancel
{
  void *v3;
  id v4;

  -[ENHTMLtoENMLConverter htmlParser](self, "htmlParser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopParser");

  -[ENHTMLtoENMLConverter htmlParser](self, "htmlParser");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", 0);

}

- (void)parserDidStartDocument:(id)a3
{
  id WeakRetained;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "htmlConverterDidStart:", self);
    WeakRetained = v5;
  }

}

- (void)parserDidEndDocument:(id)a3
{
  -[ENMLWriter endDocument](self->_enmlWriter, "endDocument", a3);
}

- (void)parser:(id)a3 didStartElement:(id)a4 attributes:(id)a5
{
  id v7;
  int skipCount;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v7 = a5;
  skipCount = self->_skipCount;
  if (skipCount < 1)
  {
    v17 = v7;
    objc_msgSend(a4, "lowercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (self->_inHTMLBody)
    {
      objc_msgSend(v17, "objectForKey:", CFSTR("class"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsSeparatedByString:", CFSTR(" "));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v12, "containsObject:", CFSTR("en-ignore")) & 1) != 0)
      {
LABEL_7:
        ++self->_skipCount;
        goto LABEL_10;
      }
      if (!-[ENMLWriter startElement:attributes:](self->_enmlWriter, "startElement:attributes:", v10, v17))
      {
        +[ENSession sharedSession](ENSession, "sharedSession");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "logger");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("startElement:%@ returned NO, skipping element and children"), v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "evernoteLogInfoString:", v15);

        goto LABEL_7;
      }
    }
    else
    {
      if (!objc_msgSend(v9, "isEqualToString:", CFSTR("body")))
      {
LABEL_11:

        v7 = v17;
        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v17);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeObjectForKey:", CFSTR("class"));
      -[ENHTMLtoENMLConverter enmlWriter](self, "enmlWriter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "startDocumentWithAttributes:", v17);

      self->_inHTMLBody = 1;
    }
LABEL_10:

    goto LABEL_11;
  }
  self->_skipCount = skipCount + 1;
LABEL_12:

}

- (void)parser:(id)a3 didEndElement:(id)a4
{
  id v6;
  void *v7;
  int skipCount;
  BOOL v9;
  int v10;
  void *v11;
  int v12;
  id v13;

  v13 = a3;
  v6 = a4;
  v7 = v6;
  skipCount = self->_skipCount;
  v9 = __OFSUB__(skipCount, 1);
  v10 = skipCount - 1;
  if (v10 < 0 != v9)
  {
    if (self->_inHTMLBody)
    {
      objc_msgSend(v6, "lowercaseString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("body"));

      if (v12)
        self->_inHTMLBody = 0;
      else
        -[ENXMLWriter endElement](self->_enmlWriter, "endElement");
    }
  }
  else
  {
    self->_skipCount = v10;
  }

}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  if (self->_inHTMLBody && self->_skipCount <= 0)
  {
    v6 = v5;
    -[ENXMLWriter writeString:](self->_enmlWriter, "writeString:", v5);
    v5 = v6;
  }

}

- (void)parser:(id)a3 didFailWithError:(id)a4
{
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "htmlConverter:didFailWithError:", self, v7);

}

- (void)xmlWriter:(id)a3 didGenerateData:(id)a4
{
  objc_class *v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;

  v5 = (objc_class *)MEMORY[0x24BDD17C8];
  v6 = a4;
  v9 = (id)objc_msgSend([v5 alloc], "initWithData:encoding:", v6, 4);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "htmlConverter:didGenerateString:", self, v9);
  else
    -[NSMutableString appendString:](self->_enml, "appendString:", v9);

}

- (void)xmlWriterDidEndWritingDocument:(id)a3
{
  id WeakRetained;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "htmlConverterDidFinish:", self);
    WeakRetained = v5;
  }

}

- (ENHTMLtoENMLConverterDelegate)delegate
{
  return (ENHTMLtoENMLConverterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_enml, 0);
  objc_storeStrong((id *)&self->_enmlWriter, 0);
  objc_storeStrong((id *)&self->_htmlParser, 0);
}

@end
