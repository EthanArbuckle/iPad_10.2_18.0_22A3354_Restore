@implementation ENMLUtility

+ (id)mediaTagWithDataHash:(id)a3 mime:(id)a4
{
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;

  v5 = (__CFString *)a4;
  if (!v5)
  {
    v5 = CFSTR("application/octet-stream");
    v6 = CFSTR("application/octet-stream");
  }
  objc_msgSend(a3, "enlowercaseHexDigits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@ type =\"%@\" hash=\"%@\"/>"), CFSTR("en-media"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)generateHTMLFromENML:(id)a3 completion:(id)a4
{
  -[ENMLUtility generateHTMLFromENML:inlinedResources:completion:](self, "generateHTMLFromENML:inlinedResources:completion:", a3, 0, a4);
}

- (void)generateHTMLFromENML:(id)a3 inlinedResources:(id)a4 completion:(id)a5
{
  -[ENMLUtility convertENMLToHTML:withResources:inlineResources:completionBlock:](self, "convertENMLToHTML:withResources:inlineResources:completionBlock:", a3, a4, 1, a5);
}

- (void)generateHTMLFromENML:(id)a3 referencedResources:(id)a4 completion:(id)a5
{
  -[ENMLUtility convertENMLToHTML:withResources:inlineResources:completionBlock:](self, "convertENMLToHTML:withResources:inlineResources:completionBlock:", a3, a4, 0, a5);
}

- (void)convertENMLToHTML:(id)a3 withResources:(id)a4 inlineResources:(BOOL)a5 completionBlock:(id)a6
{
  _BOOL8 v6;
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  KSHTMLWriter *v18;
  void *v19;
  KSHTMLWriter *v20;
  void *v21;
  NSObject *v22;
  _QWORD block[5];

  v6 = a5;
  v10 = (objc_class *)MEMORY[0x24BDD1978];
  v11 = a6;
  v12 = a4;
  v13 = a3;
  v14 = [v10 alloc];
  objc_msgSend(v13, "dataUsingEncoding:", 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(v14, "initWithData:", v15);
  -[ENMLUtility setXmlParser:](self, "setXmlParser:", v16);

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENMLUtility setOutputHTML:](self, "setOutputHTML:", v17);

  v18 = [KSHTMLWriter alloc];
  -[ENMLUtility outputHTML](self, "outputHTML");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[KSHTMLWriter initWithOutputWriter:](v18, "initWithOutputWriter:", v19);
  -[ENMLUtility setHtmlWriter:](self, "setHtmlWriter:", v20);

  -[ENMLUtility xmlParser](self, "xmlParser");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setDelegate:", self);

  -[ENMLUtility setResources:](self, "setResources:", v12);
  -[ENMLUtility setCompletionBlock:](self, "setCompletionBlock:", v11);

  -[ENMLUtility setShouldInlineResources:](self, "setShouldInlineResources:", v6);
  dispatch_get_global_queue(0, 0);
  v22 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__ENMLUtility_convertENMLToHTML_withResources_inlineResources_completionBlock___block_invoke;
  block[3] = &unk_24F8BB638;
  block[4] = self;
  dispatch_async(v22, block);

}

- (void)parserDidEndDocument:(id)a3
{
  void *v4;
  _QWORD block[5];

  -[ENMLUtility htmlWriter](self, "htmlWriter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "close");

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__ENMLUtility_parserDidEndDocument___block_invoke;
  block[3] = &unk_24F8BB638;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__ENMLUtility_parser_parseErrorOccurred___block_invoke;
  v7[3] = &unk_24F8BA480;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a7;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("en-note")))
  {
    -[ENMLUtility htmlWriter](self, "htmlWriter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "startElement:", CFSTR("body"));
LABEL_17:

    goto LABEL_18;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("en-todo")))
  {
    -[ENMLUtility setShouldIgnoreNextEndElement:](self, "setShouldIgnoreNextEndElement:", 1);
    -[ENMLUtility writeTodoWithAttributes:](self, "writeTodoWithAttributes:", v10);
  }
  else
  {
    if (!objc_msgSend(v9, "isEqualToString:", CFSTR("en-media"))
      || (-[ENMLUtility resources](self, "resources"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v12,
          !v12))
    {
      -[ENMLUtility htmlWriter](self, "htmlWriter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "startElement:attributes:", v9, v10);
      goto LABEL_17;
    }
    objc_msgSend(v10, "objectForKey:", CFSTR("hash"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE50], "endataWithHexDigits:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[ENMLUtility resources](self, "resources");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v15)
    {
      v23 = v13;
      v24 = v10;
      v16 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v16)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v18, "data");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "bodyHash");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isEqualToData:", v14);

          if (v21)
          {
            v15 = v18;
            goto LABEL_20;
          }
        }
        v15 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v15)
          continue;
        break;
      }
LABEL_20:
      v13 = v23;
      v10 = v24;
    }

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "removeObjectForKey:", CFSTR("hash"));
    objc_msgSend(v22, "removeObjectForKey:", CFSTR("type"));
    -[ENMLUtility setShouldIgnoreNextEndElement:](self, "setShouldIgnoreNextEndElement:", 1);
    -[ENMLUtility writeResource:withAttributes:](self, "writeResource:withAttributes:", v15, v22);

  }
LABEL_18:

}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  id v7;

  if (-[ENMLUtility shouldIgnoreNextEndElement](self, "shouldIgnoreNextEndElement", a3, a4, a5, a6))
  {
    -[ENMLUtility setShouldIgnoreNextEndElement:](self, "setShouldIgnoreNextEndElement:", 0);
  }
  else
  {
    -[ENMLUtility htmlWriter](self, "htmlWriter");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endElement");

  }
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[ENMLUtility htmlWriter](self, "htmlWriter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "writeCharacters:", v5);

}

- (void)parser:(id)a3 foundCDATA:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  -[ENMLUtility htmlWriter](self, "htmlWriter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startCDATA");

  -[ENMLUtility htmlWriter](self, "htmlWriter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v5, 4);

  objc_msgSend(v7, "writeString:", v8);
  -[ENMLUtility htmlWriter](self, "htmlWriter");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endCDATA");

}

- (void)parser:(id)a3 foundComment:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[ENMLUtility htmlWriter](self, "htmlWriter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "writeComment:", v5);

}

- (void)writeResource:(id)a3 withAttributes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  if (v6)
  {
    v10 = v6;
    v7 = a4;
    objc_msgSend(v10, "mime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "hasPrefix:", CFSTR("image/")))
      -[ENMLUtility writeImageTagForResource:withAttributes:](self, "writeImageTagForResource:withAttributes:", v10, v9);

    v6 = v10;
  }

}

- (void)writeImageTagForResource:(id)a3 withAttributes:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v6 = (void *)MEMORY[0x24BDBCED8];
  v7 = a4;
  objc_msgSend(v6, "dictionaryWithDictionary:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "mime");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[ENMLUtility shouldInlineResources](self, "shouldInlineResources")
    || (objc_msgSend(v22, "attributes"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "sourceURL"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        !v11))
  {
    objc_msgSend(v22, "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "body");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "base64EncodedStringWithOptions:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("data:%@;base64,%@"), v9, v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v8, "setObject:forKey:", v11, CFSTR("src"));
  if (!v9)
  {
    v9 = CFSTR("application/octet-stream");
    v15 = CFSTR("application/octet-stream");
  }
  objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("x-evernote-mime"));
  objc_msgSend(v7, "objectForKey:", CFSTR("width"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("height"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16 && v17)
  {
    v18 = v17;
  }
  else
  {
    objc_msgSend(v22, "width");
    v19 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "height");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)v19;
    if (!v19)
      goto LABEL_11;
  }
  objc_msgSend(v8, "setObject:forKey:", v16, CFSTR("width"));

LABEL_11:
  if (v18)
    objc_msgSend(v8, "setObject:forKey:", v18, CFSTR("height"));
  -[ENMLUtility htmlWriter](self, "htmlWriter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "startElement:attributes:", CFSTR("img"), v8);

  -[ENMLUtility htmlWriter](self, "htmlWriter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "endElement");

}

- (void)writeTodoWithAttributes:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x24BDBCED8];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", CFSTR("checkbox"), CFSTR("type"));
  objc_msgSend(v10, "setObject:forKey:", CFSTR("true"), CFSTR("disabled"));
  objc_msgSend(v5, "valueForKey:", CFSTR("checked"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v6, "isEqualToString:", CFSTR("true"));
  if ((_DWORD)v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v7, CFSTR("checked"));

  }
  -[ENMLUtility htmlWriter](self, "htmlWriter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startElement:attributes:", CFSTR("input"), v10);

  -[ENMLUtility htmlWriter](self, "htmlWriter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endElement");

}

- (NSMutableString)outputHTML
{
  return self->_outputHTML;
}

- (void)setOutputHTML:(id)a3
{
  objc_storeStrong((id *)&self->_outputHTML, a3);
}

- (KSHTMLWriter)htmlWriter
{
  return self->_htmlWriter;
}

- (void)setHtmlWriter:(id)a3
{
  objc_storeStrong((id *)&self->_htmlWriter, a3);
}

- (NSArray)resources
{
  return self->_resources;
}

- (void)setResources:(id)a3
{
  objc_storeStrong((id *)&self->_resources, a3);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSXMLParser)xmlParser
{
  return self->_xmlParser;
}

- (void)setXmlParser:(id)a3
{
  objc_storeStrong((id *)&self->_xmlParser, a3);
}

- (BOOL)shouldIgnoreNextEndElement
{
  return self->_shouldIgnoreNextEndElement;
}

- (void)setShouldIgnoreNextEndElement:(BOOL)a3
{
  self->_shouldIgnoreNextEndElement = a3;
}

- (BOOL)shouldInlineResources
{
  return self->_shouldInlineResources;
}

- (void)setShouldInlineResources:(BOOL)a3
{
  self->_shouldInlineResources = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xmlParser, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_htmlWriter, 0);
  objc_storeStrong((id *)&self->_outputHTML, 0);
}

void __41__ENMLUtility_parser_parseErrorOccurred___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "completionBlock");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD))v2 + 2))(v2, 0, *(_QWORD *)(a1 + 40));

}

void __36__ENMLUtility_parserDidEndDocument___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(id, void *, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "completionBlock");
  v3 = (void (**)(id, void *, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "outputHTML");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v2, 0);

}

void __79__ENMLUtility_convertENMLToHTML_withResources_inlineResources_completionBlock___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "xmlParser");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "parse");

}

@end
