@implementation ICEvernoteContentParser

- (id)htmlStringFromEvernoteContentString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)MEMORY[0x1C3B7AC74]();
  -[ICEvernoteContentParser setParserType:](self, "setParserType:", 0);
  -[ICEvernoteContentParser parseContentString:](self, "parseContentString:", v4);
  -[ICEvernoteContentParser htmlString](self, "htmlString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  -[ICEvernoteContentParser teardownParser](self, "teardownParser");
  objc_autoreleasePoolPop(v5);

  return v7;
}

- (id)titleFromHTMLString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)MEMORY[0x1C3B7AC74]();
  -[ICEvernoteContentParser setParserType:](self, "setParserType:", 1);
  -[ICEvernoteContentParser parseContentString:](self, "parseContentString:", v4);
  -[ICEvernoteContentParser htmlString](self, "htmlString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  -[ICEvernoteContentParser teardownParser](self, "teardownParser");
  objc_autoreleasePoolPop(v5);

  return v7;
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;

  v32 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = (void *)MEMORY[0x1C3B7AC74]();
  objc_msgSend(a4, "lowercaseString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[ICEvernoteContentParser parserType](self, "parserType"))
  {
    -[ICEvernoteContentParser bufferString](self, "bufferString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "length");

    if (v19)
    {
      -[ICEvernoteContentParser htmlString](self, "htmlString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICEvernoteContentParser bufferString](self, "bufferString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "appendString:", v21);

      -[ICEvernoteContentParser setBufferString:](self, "setBufferString:", 0);
    }
    if (objc_msgSend(v16, "isEqualToString:", CFSTR("en-note")))
    {
      v22 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
      -[ICEvernoteContentParser setHtmlString:](self, "setHtmlString:", v22);

      -[ICEvernoteContentParser htmlString](self, "htmlString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "appendString:", CFSTR("<html><head><meta charset=\"utf-8\"></head><body>"));
LABEL_9:

      goto LABEL_15;
    }
    if (objc_msgSend(v16, "isEqualToString:", CFSTR("en-media")))
    {
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("hash"));
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[ICEvernoteContentParser htmlString](self, "htmlString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{{NotesAttachment:%@}}"), v17);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "appendString:", v25);

    }
    else
    {
      if (objc_msgSend(v16, "isEqualToString:", CFSTR("en-todo")))
      {
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("checked"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "BOOLValue");

        -[ICEvernoteContentParser htmlString](self, "htmlString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = CFSTR("NO");
        if (v27)
          v28 = CFSTR("YES");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{{NotesCheckbox:%@}}"), v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "appendString:", v29);

        goto LABEL_9;
      }
      if (-[ICEvernoteContentParser shouldSelfCloseTagForStartElementName:](self, "shouldSelfCloseTagForStartElementName:", v16))
      {
        goto LABEL_15;
      }
      if (v14
        && (objc_msgSend(v14, "allKeys"),
            v30 = (void *)objc_claimAutoreleasedReturnValue(),
            v31 = objc_msgSend(v30, "count"),
            v30,
            v31))
      {
        -[ICEvernoteContentParser stringFromAttributes:](self, "stringFromAttributes:", v14);
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = &stru_1E76DB108;
      }
      -[ICEvernoteContentParser htmlString](self, "htmlString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "appendFormat:", CFSTR("<%@%@>"), v16, v17);
    }

LABEL_13:
    goto LABEL_15;
  }
  if (-[ICEvernoteContentParser parserType](self, "parserType") == 1)
  {
    if (!objc_msgSend(v16, "isEqualToString:", CFSTR("title")))
    {
      -[ICEvernoteContentParser setShouldAppendCharactersToBuffer:](self, "setShouldAppendCharactersToBuffer:", 0);
      goto LABEL_15;
    }
    -[ICEvernoteContentParser setShouldAppendCharactersToBuffer:](self, "setShouldAppendCharactersToBuffer:", 1);
    v17 = (__CFString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    -[ICEvernoteContentParser setHtmlString:](self, "setHtmlString:", v17);
    goto LABEL_13;
  }
LABEL_15:
  objc_autoreleasePoolPop(v15);

}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1C3B7AC74]();
  -[ICEvernoteContentParser bufferString](self, "bufferString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    -[ICEvernoteContentParser setBufferString:](self, "setBufferString:", v9);

  }
  -[ICEvernoteContentParser bufferString](self, "bufferString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendString:", v6);

  objc_autoreleasePoolPop(v7);
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  id v25;

  v25 = a3;
  v10 = a5;
  v11 = a6;
  v12 = (void *)MEMORY[0x1C3B7AC74]();
  objc_msgSend(a4, "lowercaseString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[ICEvernoteContentParser parserType](self, "parserType"))
  {
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("en-note")))
    {
      -[ICEvernoteContentParser htmlString](self, "htmlString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0CB3940];
      -[ICEvernoteContentParser bufferString](self, "bufferString");
      v17 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v17;
      v18 = &stru_1E76DB108;
      if (v17)
        v18 = (const __CFString *)v17;
      objc_msgSend(v16, "stringWithFormat:", CFSTR("%@</body></html>"), v18, v24);
    }
    else
    {
      if ((objc_msgSend(v13, "isEqualToString:", CFSTR("en-media")) & 1) != 0
        || (objc_msgSend(v13, "isEqualToString:", CFSTR("en-todo")) & 1) != 0
        || (objc_msgSend(v13, "isEqualToString:", CFSTR("en-crypt")) & 1) != 0)
      {
        goto LABEL_14;
      }
      v20 = -[ICEvernoteContentParser shouldSelfCloseTagForStartElementName:](self, "shouldSelfCloseTagForStartElementName:", v13);
      -[ICEvernoteContentParser htmlString](self, "htmlString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0CB3940];
      -[ICEvernoteContentParser bufferString](self, "bufferString");
      v22 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v22;
      v23 = &stru_1E76DB108;
      if (v22)
        v23 = (const __CFString *)v22;
      if (v20)
        objc_msgSend(v21, "stringWithFormat:", CFSTR("%@<%@/>"), v23, v13);
      else
        objc_msgSend(v21, "stringWithFormat:", CFSTR("%@</%@>"), v23, v13);
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appendString:", v19);

    goto LABEL_10;
  }
  if (-[ICEvernoteContentParser parserType](self, "parserType") == 1
    && objc_msgSend(v13, "isEqualToString:", CFSTR("title")))
  {
    -[ICEvernoteContentParser htmlString](self, "htmlString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICEvernoteContentParser bufferString](self, "bufferString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appendString:", v15);
LABEL_10:

  }
LABEL_14:
  -[ICEvernoteContentParser setBufferString:](self, "setBufferString:", 0);
  objc_autoreleasePoolPop(v12);

}

- (id)stringFromAttributes:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v3, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v10);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if (v11)
          v13 = (const __CFString *)v11;
        else
          v13 = &stru_1E76DB108;
        objc_msgSend(v4, "appendFormat:", CFSTR(" %@=\"%@\"), v10, v13);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)parseContentString:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[ICEvernoteContentParser setShouldAppendCharactersToBuffer:](self, "setShouldAppendCharactersToBuffer:", 1);
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x1E0CB3B28]);
  objc_msgSend(v11, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithData:", v7);
  -[ICEvernoteContentParser setParser:](self, "setParser:", v8);

  -[ICEvernoteContentParser parser](self, "parser");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", self);

  -[ICEvernoteContentParser parser](self, "parser");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "parse");

}

- (void)teardownParser
{
  -[ICEvernoteContentParser setParser:](self, "setParser:", 0);
  -[ICEvernoteContentParser setBufferString:](self, "setBufferString:", 0);
  -[ICEvernoteContentParser setHtmlString:](self, "setHtmlString:", 0);
}

- (BOOL)shouldSelfCloseTagForStartElementName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)shouldSelfCloseTagForStartElementName__ignoreList;
    if (!shouldSelfCloseTagForStartElementName__ignoreList)
    {
      shouldSelfCloseTagForStartElementName__ignoreList = (uint64_t)&unk_1E771AB90;

      v4 = &unk_1E771AB90;
    }
    objc_msgSend(v3, "lowercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "containsObject:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)shouldAppendCharactersToBuffer
{
  return self->_shouldAppendCharactersToBuffer;
}

- (void)setShouldAppendCharactersToBuffer:(BOOL)a3
{
  self->_shouldAppendCharactersToBuffer = a3;
}

- (NSMutableString)bufferString
{
  return self->_bufferString;
}

- (void)setBufferString:(id)a3
{
  objc_storeStrong((id *)&self->_bufferString, a3);
}

- (NSMutableString)htmlString
{
  return self->_htmlString;
}

- (void)setHtmlString:(id)a3
{
  objc_storeStrong((id *)&self->_htmlString, a3);
}

- (NSXMLParser)parser
{
  return self->_parser;
}

- (void)setParser:(id)a3
{
  objc_storeStrong((id *)&self->_parser, a3);
}

- (unint64_t)parserType
{
  return self->_parserType;
}

- (void)setParserType:(unint64_t)a3
{
  self->_parserType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parser, 0);
  objc_storeStrong((id *)&self->_htmlString, 0);
  objc_storeStrong((id *)&self->_bufferString, 0);
}

@end
