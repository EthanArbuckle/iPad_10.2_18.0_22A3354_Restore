@implementation MMParser

- (MMParser)initWithExtensions:(unint64_t)a3
{
  MMParser *v4;
  MMParser *v5;
  uint64_t v6;
  MMHTMLParser *htmlParser;
  MMSpanParser *v8;
  MMSpanParser *spanParser;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MMParser;
  v4 = -[MMParser init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_extensions = a3;
    v6 = objc_opt_new();
    htmlParser = v5->_htmlParser;
    v5->_htmlParser = (MMHTMLParser *)v6;

    v8 = -[MMSpanParser initWithExtensions:]([MMSpanParser alloc], "initWithExtensions:", a3);
    spanParser = v5->_spanParser;
    v5->_spanParser = v8;

  }
  return v5;
}

- (id)parseMarkdown:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[MMParser _removeTabsFromString:](self, "_removeTabsFromString:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MMScanner scannerWithString:](MMScanner, "scannerWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MMDocument documentWithMarkdown:](MMDocument, "documentWithMarkdown:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MMParser _parseElementsWithScanner:](self, "_parseElementsWithScanner:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setElements:", v8);

  -[MMParser _updateLinksFromDefinitionsInDocument:](self, "_updateLinksFromDefinitionsInDocument:", v7);
  return v7;
}

- (void)_addTextLineToElement:(id)a3 withScanner:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("<"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invertedSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("-"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invertedSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v6, "currentRange");
  v13 = v12;
  objc_msgSend(v6, "beginTransaction");
  v14 = (void *)objc_opt_new();
  if ((objc_msgSend(v6, "atEndOfLine") & 1) == 0)
  {
    do
    {
      objc_msgSend(v6, "skipCharactersFromSet:", v8);
      if (objc_msgSend(v6, "matchString:", CFSTR("<!--")))
      {
        while ((objc_msgSend(v6, "atEndOfString") & 1) == 0)
        {
          objc_msgSend(v6, "skipCharactersFromSet:", v10);
          if (objc_msgSend(v6, "atEndOfLine"))
          {
            objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v11, v13);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v15);

            objc_msgSend(v6, "advanceToNextLine");
            v11 = objc_msgSend(v6, "currentRange");
            v13 = v16;
          }
          else
          {
            if ((objc_msgSend(v6, "matchString:", CFSTR("-->")) & 1) != 0)
              break;
            objc_msgSend(v6, "advance");
          }
        }
      }
      else
      {
        objc_msgSend(v6, "advance");
      }
    }
    while (!objc_msgSend(v6, "atEndOfLine"));
  }
  objc_msgSend(v6, "commitTransaction:", objc_msgSend(v14, "count") != 0);
  if (objc_msgSend(v14, "count"))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v24 = v14;
    v17 = v14;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v26;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v26 != v20)
            objc_enumerationMutation(v17);
          v22 = objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v21), "rangeValue");
          objc_msgSend(v5, "addInnerRange:", v22, v23);
          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v19);
    }

    v14 = v24;
  }
  objc_msgSend(v5, "addInnerRange:", v11, v13);
  objc_msgSend(v6, "advanceToNextLine");

}

- (id)_removeTabsFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("\t\n"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "rangeOfCharacterFromSet:options:range:", v5, 0, 0, objc_msgSend(v3, "length"));
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = v6;
    v9 = v7;
    v10 = 0;
    do
    {
      if (objc_msgSend(v4, "characterAtIndex:", v8) == 10)
      {
        v10 = v8 + 1;
        v11 = objc_msgSend(v4, "length") - ++v8;
      }
      else
      {
        objc_msgSend(&unk_24F93C228, "objectAtIndex:", 4 - (((_BYTE)v8 - v10) & 3));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "replaceCharactersInRange:withString:", v8, v9, v12);

        v11 = objc_msgSend(v4, "length") - v8;
      }
      v8 = objc_msgSend(v4, "rangeOfCharacterFromSet:options:range:", v5, 0, v8, v11);
      v9 = v13;
    }
    while (v8 != 0x7FFFFFFFFFFFFFFFLL);
  }

  return v4;
}

- (id)_parseElementsWithScanner:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  if ((objc_msgSend(v4, "atEndOfString") & 1) == 0)
  {
    do
    {
      -[MMParser _parseBlockElementWithScanner:](self, "_parseBlockElementWithScanner:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(v5, "addObject:", v6);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "skipCharactersFromSet:", v7);

        if (objc_msgSend(v4, "atEndOfLine"))
          objc_msgSend(v4, "advanceToNextLine");
      }

    }
    while (!objc_msgSend(v4, "atEndOfString"));
  }

  return v5;
}

- (id)_parseBlockElementWithScanner:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "beginTransaction");
  -[MMParser htmlParser](self, "htmlParser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parseCommentWithScanner:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "commitTransaction:", v6 != 0);
  if (!v6)
  {
    objc_msgSend(v4, "beginTransaction");
    -[MMParser _parseHTMLWithScanner:](self, "_parseHTMLWithScanner:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "commitTransaction:", v6 != 0);
    if (!v6)
    {
      objc_msgSend(v4, "beginTransaction");
      -[MMParser _parsePrefixHeaderWithScanner:](self, "_parsePrefixHeaderWithScanner:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "commitTransaction:", v6 != 0);
      if (!v6)
      {
        objc_msgSend(v4, "beginTransaction");
        -[MMParser _parseUnderlinedHeaderWithScanner:](self, "_parseUnderlinedHeaderWithScanner:", v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "commitTransaction:", v6 != 0);
        if (!v6)
        {
          objc_msgSend(v4, "beginTransaction");
          -[MMParser _parseBlockquoteWithScanner:](self, "_parseBlockquoteWithScanner:", v4);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "commitTransaction:", v6 != 0);
          if (!v6)
          {
            objc_msgSend(v4, "beginTransaction");
            -[MMParser _parseCodeBlockWithScanner:](self, "_parseCodeBlockWithScanner:", v4);
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "commitTransaction:", v6 != 0);
            if (!v6)
            {
              if ((-[MMParser extensions](self, "extensions") & 8) == 0
                || (objc_msgSend(v4, "beginTransaction"),
                    -[MMParser _parseFencedCodeBlockWithScanner:](self, "_parseFencedCodeBlockWithScanner:", v4),
                    v6 = (void *)objc_claimAutoreleasedReturnValue(),
                    objc_msgSend(v4, "commitTransaction:", v6 != 0),
                    !v6))
              {
                if ((-[MMParser extensions](self, "extensions") & 0x100) == 0
                  || (objc_msgSend(v4, "beginTransaction"),
                      -[MMParser _parseTableWithScanner:](self, "_parseTableWithScanner:", v4),
                      v6 = (void *)objc_claimAutoreleasedReturnValue(),
                      objc_msgSend(v4, "commitTransaction:", v6 != 0),
                      !v6))
                {
                  objc_msgSend(v4, "beginTransaction");
                  -[MMParser _parseHorizontalRuleWithScanner:](self, "_parseHorizontalRuleWithScanner:", v4);
                  v6 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "commitTransaction:", v6 != 0);
                  if (!v6)
                  {
                    objc_msgSend(v4, "beginTransaction");
                    -[MMParser _parseListWithScanner:](self, "_parseListWithScanner:", v4);
                    v6 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v4, "commitTransaction:", v6 != 0);
                    if (!v6)
                    {
                      objc_msgSend(v4, "beginTransaction");
                      -[MMParser _parseLinkDefinitionWithScanner:](self, "_parseLinkDefinitionWithScanner:", v4);
                      v6 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v4, "commitTransaction:", v6 != 0);
                      if (!v6)
                      {
                        objc_msgSend(v4, "beginTransaction");
                        -[MMParser _parseParagraphWithScanner:](self, "_parseParagraphWithScanner:", v4);
                        v6 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v4, "commitTransaction:", v6 != 0);
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return v6;
}

- (id)_parseHTMLWithScanner:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "atBeginningOfLine"))
  {
    -[MMParser htmlParser](self, "htmlParser");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "parseBlockTagWithScanner:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_parsePrefixHeaderWithScanner:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v4 = a3;
  if (objc_msgSend(v4, "nextCharacter") != 35)
    goto LABEL_11;
  v5 = 0;
  do
  {
    v6 = v5 + 1;
    objc_msgSend(v4, "advance");
    if (objc_msgSend(v4, "nextCharacter") != 35)
      break;
  }
  while (v5++ < 5);
  if (objc_msgSend(v4, "skipWhitespace"))
  {
    v8 = objc_msgSend(v4, "currentRange");
    v10 = v9;
    v11 = v8 - 1;
    while (v10)
    {
      objc_msgSend(v4, "string");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "characterAtIndex:", v11 + v10);

      --v10;
      if (v13 != 35)
      {
        v14 = v10 + 1;
        goto LABEL_13;
      }
    }
    v14 = 0;
LABEL_13:
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    while (v14)
    {
      objc_msgSend(v4, "string");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "characterAtIndex:", v11 + v14);

      --v14;
      if ((objc_msgSend(v16, "characterIsMember:", v18) & 1) == 0)
      {
        v19 = v14 + 1;
        goto LABEL_18;
      }
    }
    v19 = 0;
LABEL_18:
    objc_msgSend(v4, "advanceToNextLine");
    v15 = (void *)objc_opt_new();
    objc_msgSend(v15, "setType:", 1);
    v20 = objc_msgSend(v4, "startLocation");
    v21 = objc_msgSend(v4, "currentRange");
    objc_msgSend(v15, "setRange:", v20, v21 + v22 - objc_msgSend(v4, "startLocation"));
    objc_msgSend(v15, "setLevel:", v6);
    objc_msgSend(v15, "addInnerRange:", v8, v19);
    objc_msgSend(v15, "innerRanges");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");

    if (v24)
    {
      objc_msgSend(v4, "string");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "innerRanges");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[MMScanner scannerWithString:lineRanges:](MMScanner, "scannerWithString:lineRanges:", v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      -[MMParser spanParser](self, "spanParser");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "parseSpansInBlockElement:withScanner:", v15, v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setChildren:", v29);

    }
  }
  else
  {
LABEL_11:
    v15 = 0;
  }

  return v15;
}

- (id)_parseUnderlinedHeaderWithScanner:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  objc_msgSend(v4, "beginTransaction");
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "skipCharactersFromSet:", v5);

  if (objc_msgSend(v4, "atEndOfLine"))
    goto LABEL_14;
  objc_msgSend(v4, "advanceToNextLine");
  if (objc_msgSend(v4, "atEndOfString"))
    goto LABEL_14;
  v6 = objc_msgSend(v4, "nextCharacter");
  if ((v6 & 0xFFFFFFEF) != 0x2D)
    goto LABEL_14;
  v7 = v6;
  if ((objc_msgSend(v4, "atEndOfLine") & 1) != 0)
    goto LABEL_9;
  while (v7 == objc_msgSend(v4, "nextCharacter"))
  {
    objc_msgSend(v4, "advance");
    if (objc_msgSend(v4, "atEndOfLine"))
      goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "skipCharactersFromSet:", v8);

  if ((objc_msgSend(v4, "atEndOfLine") & 1) != 0)
  {
LABEL_9:
    objc_msgSend(v4, "commitTransaction:", 0);
    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "setType:", 1);
    if (v7 == 61)
      v10 = 1;
    else
      v10 = 2;
    objc_msgSend(v9, "setLevel:", v10);
    v11 = objc_msgSend(v4, "currentRange");
    objc_msgSend(v9, "addInnerRange:", v11, v12);
    objc_msgSend(v4, "advanceToNextLine");
    objc_msgSend(v4, "advanceToNextLine");
    objc_msgSend(v9, "setRange:", objc_msgSend(v4, "startLocation"), objc_msgSend(v4, "location") - objc_msgSend(v4, "startLocation"));
    objc_msgSend(v9, "innerRanges");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
      objc_msgSend(v4, "string");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "innerRanges");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[MMScanner scannerWithString:lineRanges:](MMScanner, "scannerWithString:lineRanges:", v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[MMParser spanParser](self, "spanParser");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "parseSpansInBlockElement:withScanner:", v9, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setChildren:", v19);

    }
  }
  else
  {
LABEL_14:
    objc_msgSend(v4, "commitTransaction:", 0);
    v9 = 0;
  }

  return v9;
}

- (id)_parseBlockquoteWithScanner:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(" "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "skipCharactersFromSet:max:", v5, 3);
  if (objc_msgSend(v4, "nextCharacter") == 62)
  {
    objc_msgSend(v4, "advance");
    if (objc_msgSend(v4, "nextCharacter") == 32)
      objc_msgSend(v4, "advance");
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "setType:", 3);
    v7 = objc_msgSend(v4, "currentRange");
    objc_msgSend(v6, "addInnerRange:", v7, v8);
    objc_msgSend(v4, "advanceToNextLine");
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    while ((objc_msgSend(v4, "atEndOfString") & 1) == 0)
    {
      objc_msgSend(v4, "beginTransaction");
      objc_msgSend(v4, "skipCharactersFromSet:", v9);
      if ((objc_msgSend(v4, "atEndOfLine") & 1) != 0)
        goto LABEL_13;
      if (objc_msgSend(v4, "nextCharacter") == 62)
      {
        objc_msgSend(v4, "advance");
        objc_msgSend(v4, "skipCharactersFromSet:max:", v9, 1);
      }
      else
      {
        objc_msgSend(v4, "beginTransaction");
        objc_msgSend(v4, "skipIndentationUpTo:", 2);
        if (-[MMParser _parseListMarkerWithScanner:listType:](self, "_parseListMarkerWithScanner:listType:", v4, 0))
        {
LABEL_13:
          objc_msgSend(v4, "commitTransaction:", 0);
          break;
        }
        v10 = -[MMParser _parseListMarkerWithScanner:listType:](self, "_parseListMarkerWithScanner:listType:", v4, 1);
        objc_msgSend(v4, "commitTransaction:", 0);
        if (v10)
          break;
      }
      v11 = objc_msgSend(v4, "currentRange");
      objc_msgSend(v6, "addInnerRange:", v11, v12);
      objc_msgSend(v4, "commitTransaction:", 1);
      objc_msgSend(v4, "advanceToNextLine");
    }
    objc_msgSend(v6, "setRange:", objc_msgSend(v4, "startLocation"), objc_msgSend(v4, "location") - objc_msgSend(v4, "startLocation"));
    objc_msgSend(v6, "innerRanges");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
      objc_msgSend(v4, "string");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "innerRanges");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[MMScanner scannerWithString:lineRanges:](MMScanner, "scannerWithString:lineRanges:", v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[MMParser _parseElementsWithScanner:](self, "_parseElementsWithScanner:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setChildren:", v18);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_parseCodeLinesWithScanner:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  void *v15;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("&<>"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "invertedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "atEndOfString") & 1) == 0)
  {
    do
    {
      v6 = objc_msgSend(v3, "location");
      objc_msgSend(v3, "skipCharactersFromSet:", v5);
      if (v6 != objc_msgSend(v3, "location"))
      {
        v7 = (void *)objc_opt_new();
        objc_msgSend(v7, "setType:", 0);
        objc_msgSend(v7, "setRange:", v6, objc_msgSend(v3, "location") - v6);
        objc_msgSend(v4, "addObject:", v7);

      }
      if ((objc_msgSend(v3, "atEndOfLine") & 1) == 0)
      {
        objc_msgSend(v3, "string");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "characterAtIndex:", objc_msgSend(v3, "location"));

        v10 = (void *)objc_opt_new();
        objc_msgSend(v10, "setType:", 19);
        objc_msgSend(v10, "setRange:", objc_msgSend(v3, "location"), 1);
        if (v9 == 60)
          v11 = CFSTR("&lt;");
        else
          v11 = &stru_24F8BBA48;
        if (v9 == 62)
          v11 = CFSTR("&gt;");
        if (v9 == 38)
          v12 = CFSTR("&amp;");
        else
          v12 = v11;
        objc_msgSend(v10, "setStringValue:", v12);
        objc_msgSend(v4, "addObject:", v10);
        objc_msgSend(v3, "advance");

      }
      if (objc_msgSend(v3, "atEndOfLine"))
      {
        objc_msgSend(v3, "advanceToNextLine");
        v13 = (void *)objc_opt_new();
        objc_msgSend(v13, "setType:", 0);
        objc_msgSend(v13, "setRange:", objc_msgSend(v3, "location"), 0);
        objc_msgSend(v4, "addObject:", v13);

      }
    }
    while (!objc_msgSend(v3, "atEndOfString"));
  }

  return v4;
}

- (id)_parseCodeBlockWithScanner:(id)a3
{
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v4 = a3;
  if (objc_msgSend(v4, "skipIndentationUpTo:", 4) == 4 && (objc_msgSend(v4, "atEndOfLine") & 1) == 0)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setType:", 7);
    v7 = objc_msgSend(v4, "currentRange");
    objc_msgSend(v5, "addInnerRange:", v7, v8);
    objc_msgSend(v4, "advanceToNextLine");
    if ((objc_msgSend(v4, "atEndOfString") & 1) != 0)
      goto LABEL_14;
    do
    {
      for (i = objc_msgSend(v4, "skipEmptyLines"); i; --i)
        objc_msgSend(v5, "addInnerRange:", objc_msgSend(v4, "location"), 0);
      objc_msgSend(v4, "beginTransaction");
      if ((unint64_t)objc_msgSend(v4, "skipIndentationUpTo:", 4) < 4)
      {
        objc_msgSend(v4, "commitTransaction:", 0);
        break;
      }
      objc_msgSend(v4, "commitTransaction:", 1);
      v10 = objc_msgSend(v4, "currentRange");
      objc_msgSend(v5, "addInnerRange:", v10, v11);
      objc_msgSend(v4, "advanceToNextLine");
    }
    while (!objc_msgSend(v4, "atEndOfString"));
LABEL_14:
    while (1)
    {
      objc_msgSend(v5, "innerRanges");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v16, "count"))
        break;
      objc_msgSend(v5, "innerRanges");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "rangeValue");
      v15 = v14;

      if (v15)
        goto LABEL_16;
      objc_msgSend(v5, "removeLastInnerRange");
    }

LABEL_16:
    objc_msgSend(v5, "innerRanges");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (v18)
    {
      objc_msgSend(v5, "innerRanges");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lastObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "rangeValue");
      v23 = v22;

      objc_msgSend(v5, "removeLastInnerRange");
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      while (v23)
      {
        objc_msgSend(v4, "string");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "characterAtIndex:", v21 - 1 + v23);

        --v23;
        if ((objc_msgSend(v24, "characterIsMember:", v26) & 1) == 0)
        {
          v27 = v23 + 1;
          goto LABEL_22;
        }
      }
      v27 = 0;
LABEL_22:
      objc_msgSend(v5, "addInnerRange:", v21, v27);

    }
    objc_msgSend(v5, "setRange:", objc_msgSend(v4, "startLocation"), objc_msgSend(v4, "location") - objc_msgSend(v4, "startLocation"));
    objc_msgSend(v5, "innerRanges");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "count");

    if (v29)
    {
      objc_msgSend(v4, "string");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "innerRanges");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      +[MMScanner scannerWithString:lineRanges:](MMScanner, "scannerWithString:lineRanges:", v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      -[MMParser _parseCodeLinesWithScanner:](self, "_parseCodeLinesWithScanner:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setChildren:", v33);

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_parseFencedCodeBlockWithScanner:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  {
    objc_msgSend(v4, "skipWhitespace");
    objc_msgSend(MEMORY[0x24BDD1690], "alphanumericCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addCharactersInString:", CFSTR("-_"));
    objc_msgSend(v4, "nextWordWithCharactersFromSet:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLocation:", objc_msgSend(v4, "location") + objc_msgSend(v6, "length"));
    objc_msgSend(v4, "skipWhitespace");
    if (objc_msgSend(v4, "atEndOfLine"))
    {
      objc_msgSend(v4, "advanceToNextLine");
      v7 = (void *)objc_opt_new();
      objc_msgSend(v7, "setType:", 7);
      if (objc_msgSend(v6, "length"))
        v8 = v6;
      else
        v8 = 0;
      objc_msgSend(v7, "setLanguage:", v8);
      if ((objc_msgSend(v4, "atEndOfString") & 1) == 0)
      {
        while (1)
        {
          objc_msgSend(v4, "beginTransaction");
          {
            objc_msgSend(v4, "skipWhitespace");
            if (objc_msgSend(v4, "atEndOfLine"))
              break;
          }
          objc_msgSend(v4, "commitTransaction:", 0);
          v9 = objc_msgSend(v4, "currentRange");
          objc_msgSend(v7, "addInnerRange:", v9, v10);
          objc_msgSend(v4, "advanceToNextLine");
          if (objc_msgSend(v4, "atEndOfString"))
            goto LABEL_14;
        }
        objc_msgSend(v4, "commitTransaction:", 1);
      }
LABEL_14:
      objc_msgSend(v4, "advanceToNextLine");
      objc_msgSend(v7, "innerRanges");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (v12)
      {
        objc_msgSend(v4, "string");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "innerRanges");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[MMScanner scannerWithString:lineRanges:](MMScanner, "scannerWithString:lineRanges:", v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        -[MMParser _parseCodeLinesWithScanner:](self, "_parseCodeLinesWithScanner:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setChildren:", v16);

      }
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_parseHorizontalRuleWithScanner:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  unint64_t v8;
  int v9;
  void *v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "skipCharactersFromSet:", v4);

  v5 = objc_msgSend(v3, "nextCharacter");
  v6 = 0;
  if ((v5 - 42) <= 0x35 && ((1 << (v5 - 42)) & 0x20000000000009) != 0)
  {
    v7 = v5;
    if ((objc_msgSend(v3, "atEndOfLine") & 1) != 0)
      goto LABEL_12;
    v8 = 0;
    do
    {
      objc_msgSend(v3, "advance");
      v9 = objc_msgSend(v3, "nextCharacter");
      if (v9 == 32)
      {
        objc_msgSend(v3, "advance");
        v9 = objc_msgSend(v3, "nextCharacter");
      }
      ++v8;
    }
    while ((objc_msgSend(v3, "atEndOfLine") & 1) == 0 && v9 == v7);
    if (v8 < 3
      || (objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "skipCharactersFromSet:", v10),
          v10,
          !objc_msgSend(v3, "atEndOfLine")))
    {
LABEL_12:
      v6 = 0;
    }
    else
    {
      v6 = (void *)objc_opt_new();
      objc_msgSend(v6, "setType:", 8);
      objc_msgSend(v6, "setRange:", objc_msgSend(v3, "startLocation"), objc_msgSend(v3, "location") - objc_msgSend(v3, "startLocation"));
    }
  }

  return v6;
}

- (BOOL)_parseListMarkerWithScanner:(id)a3 listType:(int64_t)a4
{
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;
  uint64_t v9;

  v5 = a3;
  v6 = v5;
  if (a4 == 1)
  {
    objc_msgSend(v5, "beginTransaction");
    objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "skipCharactersFromSet:", v8);

    if (!v9 || objc_msgSend(v6, "nextCharacter") != 46)
      goto LABEL_10;
    goto LABEL_8;
  }
  if (a4)
  {
    LOBYTE(a4) = 0;
    goto LABEL_13;
  }
  objc_msgSend(v5, "beginTransaction");
  v7 = objc_msgSend(v6, "nextCharacter");
  if (v7 <= 0x2D && ((1 << v7) & 0x2C0000000000) != 0)
  {
LABEL_8:
    objc_msgSend(v6, "advance");
    if (objc_msgSend(v6, "nextCharacter") == 32)
    {
      objc_msgSend(v6, "advance");
      a4 = 1;
      goto LABEL_11;
    }
LABEL_10:
    a4 = 0;
  }
LABEL_11:
  objc_msgSend(v6, "commitTransaction:", a4);
LABEL_13:

  return a4;
}

- (id)_parseListItemWithScanner:(id)a3 listType:(int64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  unint64_t v15;
  _BOOL4 v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  char v43;

  v6 = a3;
  v7 = objc_msgSend(v6, "skipEmptyLines");
  objc_msgSend(v6, "skipIndentationUpTo:", 3);
  if (-[MMParser _parseListMarkerWithScanner:listType:](self, "_parseListMarkerWithScanner:listType:", v6, a4))
  {
    v43 = v7 != 0;
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "skipCharactersFromSet:", v8);

    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "setType:", 6);
    if ((objc_msgSend(v6, "atEndOfString") & 1) != 0)
    {
      v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v11 = 0;
      v10 = 0x7FFFFFFFFFFFFFFFLL;
      while (1)
      {
        objc_msgSend(v6, "beginTransaction");
        v12 = objc_msgSend(v6, "skipEmptyLines");
        objc_msgSend(v6, "beginTransaction");
        -[MMParser _parseHorizontalRuleWithScanner:](self, "_parseHorizontalRuleWithScanner:", v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "commitTransaction:", 0);
        if (v13)
          break;
        objc_msgSend(v6, "beginTransaction");
        objc_msgSend(v6, "skipIndentationUpTo:", 1);
        v14 = -[MMParser _parseListMarkerWithScanner:listType:](self, "_parseListMarkerWithScanner:listType:", v6, a4);
        objc_msgSend(v6, "commitTransaction:", 0);
        if (v14)
        {
          objc_msgSend(v6, "commitTransaction:", 0);
          v43 |= v12 != 0;
          goto LABEL_28;
        }
        objc_msgSend(v6, "beginTransaction");
        v15 = objc_msgSend(v6, "skipIndentationUpTo:", 4);
        objc_msgSend(v6, "beginTransaction");
        v16 = -[MMParser _parseListMarkerWithScanner:listType:](self, "_parseListMarkerWithScanner:listType:", v6, 0)
           || -[MMParser _parseListMarkerWithScanner:listType:](self, "_parseListMarkerWithScanner:listType:", v6, 1);
        objc_msgSend(v6, "commitTransaction:", 0);
        if (v15 >= 2 && v16 && v10 == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v9, "addInnerRange:", objc_msgSend(v6, "location"), 0);
          objc_msgSend(v9, "innerRanges");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v17, "count");

          v18 = objc_msgSend(v6, "currentRange");
          objc_msgSend(v9, "addInnerRange:", v18, v19);
          objc_msgSend(v6, "commitTransaction:", 1);
          objc_msgSend(v6, "commitTransaction:", 1);
          objc_msgSend(v6, "advanceToNextLine");
          v11 = v15;
        }
        else
        {
          objc_msgSend(v6, "commitTransaction:", 0);
          if (v12)
          {
            objc_msgSend(v6, "beginTransaction");
            if ((unint64_t)objc_msgSend(v6, "skipIndentationUpTo:", 4) < 4)
            {
              objc_msgSend(v6, "commitTransaction:", 0);
              break;
            }
            v43 = 1;
            objc_msgSend(v6, "commitTransaction:", 1);
            objc_msgSend(v6, "commitTransaction:", 1);
            objc_msgSend(v9, "addInnerRange:", objc_msgSend(v6, "location"), 0);
          }
          else
          {
            objc_msgSend(v6, "commitTransaction:", 1);
            objc_msgSend(v6, "skipIndentationUpTo:", v11);
          }
          if (v10 == 0x7FFFFFFFFFFFFFFFLL)
          {
            -[MMParser _addTextLineToElement:withScanner:](self, "_addTextLineToElement:withScanner:", v9, v6);
          }
          else
          {
            v20 = objc_msgSend(v6, "currentRange");
            objc_msgSend(v9, "addInnerRange:", v20, v21);
            objc_msgSend(v6, "advanceToNextLine");
          }
          objc_msgSend(v6, "beginTransaction");
          objc_msgSend(v6, "skipIndentationUpTo:", 4);
          v22 = objc_msgSend(v6, "nextCharacter");
          objc_msgSend(v6, "commitTransaction:", 0);
          if (v22 == 62)
            goto LABEL_28;
        }
        if (objc_msgSend(v6, "atEndOfString"))
          goto LABEL_28;
      }
      objc_msgSend(v6, "commitTransaction:", 0);
    }
LABEL_28:
    objc_msgSend(v9, "setRange:", objc_msgSend(v6, "startLocation"), objc_msgSend(v6, "location") - objc_msgSend(v6, "startLocation"));
    objc_msgSend(v9, "innerRanges");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");

    if (v24)
    {
      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v6, "string");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "innerRanges");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[MMScanner scannerWithString:lineRanges:](MMScanner, "scannerWithString:lineRanges:", v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if ((v43 & 1) != 0)
        {
          -[MMParser _parseElementsWithScanner:](self, "_parseElementsWithScanner:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setChildren:", v28);
        }
        else
        {
          -[MMParser spanParser](self, "spanParser");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "parseSpansInBlockElement:withScanner:", v9, v27);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setChildren:", v37);

        }
      }
      else
      {
        objc_msgSend(v9, "innerRanges");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "subarrayWithRange:", 0, v10);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "innerRanges");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "innerRanges");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "subarrayWithRange:", v10, objc_msgSend(v31, "count") - v10);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "string");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        +[MMScanner scannerWithString:lineRanges:](MMScanner, "scannerWithString:lineRanges:", v32, v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "string");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        +[MMScanner scannerWithString:lineRanges:](MMScanner, "scannerWithString:lineRanges:", v34, v28);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if ((v43 & 1) != 0)
        {
          -[MMParser _parseElementsWithScanner:](self, "_parseElementsWithScanner:", v33);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setChildren:", v36);
        }
        else
        {
          -[MMParser spanParser](self, "spanParser");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "parseSpansInBlockElement:withScanner:", v9, v33);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setChildren:", v38);

        }
        objc_msgSend(v9, "children");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[MMParser _parseElementsWithScanner:](self, "_parseElementsWithScanner:", v35);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "arrayByAddingObjectsFromArray:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setChildren:", v41);

      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_parseListWithScanner:(id)a3
{
  id v4;
  unsigned int v5;
  _BOOL8 v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v4 = a3;
  objc_msgSend(v4, "beginTransaction");
  objc_msgSend(v4, "skipIndentationUpTo:", 3);
  v5 = objc_msgSend(v4, "nextCharacter");
  v7 = ((0x2C0000000000uLL >> v5) & 1) == 0 || v5 > 0x2D;
  v8 = -[MMParser _parseListMarkerWithScanner:listType:](self, "_parseListMarkerWithScanner:listType:", v4, v7);
  objc_msgSend(v4, "commitTransaction:", 0);
  if (v8)
  {
    v9 = (void *)objc_opt_new();
    v10 = v9;
    if (v7)
      v11 = 4;
    else
      v11 = 5;
    objc_msgSend(v9, "setType:", v11);
    if ((objc_msgSend(v4, "atEndOfString") & 1) == 0)
    {
      while (1)
      {
        objc_msgSend(v4, "beginTransaction");
        objc_msgSend(v4, "skipEmptyLines");
        -[MMParser _parseHorizontalRuleWithScanner:](self, "_parseHorizontalRuleWithScanner:", v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "commitTransaction:", 0);
        if (v12)
        {

          goto LABEL_19;
        }
        objc_msgSend(v4, "beginTransaction");
        -[MMParser _parseListItemWithScanner:listType:](self, "_parseListItemWithScanner:listType:", v4, v7);
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
          break;
        v14 = (void *)v13;
        objc_msgSend(v4, "commitTransaction:", 1);
        objc_msgSend(v10, "addChild:", v14);

        if (objc_msgSend(v4, "atEndOfString"))
          goto LABEL_19;
      }
      objc_msgSend(v4, "commitTransaction:", 0);
    }
LABEL_19:
    objc_msgSend(v10, "setRange:", objc_msgSend(v4, "startLocation"), objc_msgSend(v4, "location") - objc_msgSend(v4, "startLocation"));
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_parseLinkDefinitionWithScanner:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "skipIndentationUpTo:", 3);
  v5 = objc_msgSend(v3, "location");
  v6 = objc_msgSend(v3, "skipNestedBracketsWithDelimiter:", 91);
  if (!v6 || (v7 = v6, objc_msgSend(v3, "nextCharacter") != 58))
  {
    v18 = 0;
    goto LABEL_22;
  }
  objc_msgSend(v3, "advance");
  objc_msgSend(v3, "skipCharactersFromSet:", v4);
  v8 = objc_msgSend(v3, "location");
  objc_msgSend(v4, "invertedSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "skipCharactersFromSet:", v9);

  v10 = objc_msgSend(v3, "location") - v8;
  objc_msgSend(v3, "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "substringWithRange:", v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "hasPrefix:", CFSTR("<"))
    && objc_msgSend(v12, "hasSuffix:", CFSTR(">")))
  {
    objc_msgSend(v12, "substringWithRange:", 1, objc_msgSend(v12, "length") - 2);
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v13;
  }
  objc_msgSend(v3, "skipCharactersFromSet:", v4);
  objc_msgSend(v3, "beginTransaction");
  if (objc_msgSend(v3, "atEndOfLine"))
  {
    objc_msgSend(v3, "advanceToNextLine");
    objc_msgSend(v3, "skipCharactersFromSet:", v4);
  }
  v14 = objc_msgSend(v3, "nextCharacter");
  v15 = 0;
  if (v14 > 0x28)
    goto LABEL_16;
  v16 = v14;
  v17 = 0x7FFFFFFFFFFFFFFFLL;
  if (((1 << v14) & 0x18400000000) != 0)
  {
    objc_msgSend(v3, "advance");
    if (v16 == 40)
      v16 = 41;
    v17 = objc_msgSend(v3, "location");
    v15 = objc_msgSend(v3, "skipToLastCharacterOfLine");
    if (objc_msgSend(v3, "nextCharacter") == v16)
    {
      objc_msgSend(v3, "advance");
      goto LABEL_17;
    }
    v15 = 0;
LABEL_16:
    v17 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_17:
  objc_msgSend(v3, "commitTransaction:", v17 != 0x7FFFFFFFFFFFFFFFLL);
  objc_msgSend(v3, "skipCharactersFromSet:", v4);
  if (objc_msgSend(v3, "atEndOfLine"))
  {
    v19 = v5 + 1;
    v18 = (void *)objc_opt_new();
    objc_msgSend(v18, "setType:", 18);
    objc_msgSend(v18, "setRange:", objc_msgSend(v3, "startLocation"), objc_msgSend(v3, "location") - objc_msgSend(v3, "startLocation"));
    objc_msgSend(v3, "string");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "substringWithRange:", v19, v7 - 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setIdentifier:", v21);

    objc_msgSend(v18, "setHref:", v12);
    if (v17 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v3, "string");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "substringWithRange:", v17, v15);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTitle:", v23);

    }
  }
  else
  {
    v18 = 0;
  }

LABEL_22:
  return v18;
}

- (id)_parseParagraphWithScanner:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v21;
  uint64_t v22;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setType:", 2);
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "atEndOfString") & 1) == 0)
  {
    while (1)
    {
      objc_msgSend(v4, "skipWhitespace");
      if (objc_msgSend(v4, "atEndOfLine"))
      {
        objc_msgSend(v4, "advanceToNextLine");
        goto LABEL_2;
      }
      objc_msgSend(v4, "beginTransaction");
      objc_msgSend(v4, "skipCharactersFromSet:", v6);
      if (objc_msgSend(v4, "nextCharacter") == 62)
      {
        v21 = v4;
        v22 = 1;
        goto LABEL_20;
      }
      objc_msgSend(v4, "commitTransaction:", 0);
      objc_msgSend(v4, "beginTransaction");
      -[MMParser _parseLinkDefinitionWithScanner:](self, "_parseLinkDefinitionWithScanner:", v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "commitTransaction:", 0);
      if (v15)
        goto LABEL_2;
      objc_msgSend(v4, "beginTransaction");
      -[MMParser _parseUnderlinedHeaderWithScanner:](self, "_parseUnderlinedHeaderWithScanner:", v4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "commitTransaction:", 0);
      if (v16)
        goto LABEL_2;
      objc_msgSend(v4, "beginTransaction");
      -[MMParser _parsePrefixHeaderWithScanner:](self, "_parsePrefixHeaderWithScanner:", v4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "commitTransaction:", 0);
      if (v17)
        goto LABEL_2;
      if ((-[MMParser extensions](self, "extensions") & 8) != 0)
      {
        objc_msgSend(v4, "beginTransaction");
        -[MMParser _parseFencedCodeBlockWithScanner:](self, "_parseFencedCodeBlockWithScanner:", v4);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "commitTransaction:", 0);
        if (v18)
          goto LABEL_2;
      }
      objc_msgSend(v4, "beginTransaction");
      objc_msgSend(v4, "skipIndentationUpTo:", 2);
      if (-[MMParser _parseListMarkerWithScanner:listType:](self, "_parseListMarkerWithScanner:listType:", v4, 0))
        break;
      v19 = -[MMParser _parseListMarkerWithScanner:listType:](self, "_parseListMarkerWithScanner:listType:", v4, 1);
      objc_msgSend(v4, "commitTransaction:", 0);
      if (!v19)
      {
        -[MMParser _addTextLineToElement:withScanner:](self, "_addTextLineToElement:withScanner:", v5, v4);
        if (!objc_msgSend(v4, "atEndOfString"))
          continue;
      }
      goto LABEL_2;
    }
    v21 = v4;
    v22 = 0;
LABEL_20:
    objc_msgSend(v21, "commitTransaction:", v22);
  }
LABEL_2:
  objc_msgSend(v5, "setRange:", objc_msgSend(v4, "startLocation"), objc_msgSend(v4, "location") - objc_msgSend(v4, "startLocation"));
  objc_msgSend(v5, "innerRanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    objc_msgSend(v4, "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "innerRanges");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[MMScanner scannerWithString:lineRanges:](MMScanner, "scannerWithString:lineRanges:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[MMParser spanParser](self, "spanParser");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "parseSpansInBlockElement:withScanner:", v5, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setChildren:", v13);

    v14 = v5;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_parseTableHeaderWithScanner:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("-"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "skipWhitespace");
  if (objc_msgSend(v3, "nextCharacter") == 124)
    objc_msgSend(v3, "advance");
  objc_msgSend(v3, "skipWhitespace");
  v5 = (void *)objc_opt_new();
  if ((objc_msgSend(v3, "atEndOfLine") & 1) == 0)
  {
    while (1)
    {
      v6 = objc_msgSend(v3, "nextCharacter");
      if (v6 == 58)
        objc_msgSend(v3, "advance");
      if ((unint64_t)objc_msgSend(v3, "skipCharactersFromSet:", v4) < 3)
        goto LABEL_17;
      if (objc_msgSend(v3, "nextCharacter") == 58)
      {
        objc_msgSend(v3, "advance");
        v7 = 2;
        v8 = 3;
      }
      else
      {
        v8 = 0;
        v7 = 1;
      }
      if (v6 == 58)
        v9 = v7;
      else
        v9 = v8;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v10);

      objc_msgSend(v3, "skipWhitespace");
      if (objc_msgSend(v3, "nextCharacter") == 124)
      {
        objc_msgSend(v3, "advance");
        objc_msgSend(v3, "skipWhitespace");
        if (!objc_msgSend(v3, "atEndOfLine"))
          continue;
      }
      break;
    }
  }
  if (!objc_msgSend(v3, "atEndOfLine"))
  {
LABEL_17:
    v11 = 0;
    goto LABEL_18;
  }
  v11 = v5;
LABEL_18:

  return v11;
}

- (id)_parseTableRowWithScanner:(id)a3 columns:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD1690];
  v8 = a4;
  objc_msgSend(v7, "whitespaceCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addCharactersInString:", CFSTR("|"));
  v10 = (void *)MEMORY[0x24BDD1968];
  v11 = objc_msgSend(v6, "currentRange");
  objc_msgSend(v10, "valueWithRange:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "string");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[MMScanner scannerWithString:lineRanges:](MMScanner, "scannerWithString:lineRanges:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "skipCharactersFromSet:", v9);
  -[MMParser spanParser](self, "spanParser");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "parseSpansInTableColumns:withScanner:", v8, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "skipCharactersFromSet:", v9);
  if (v18 && objc_msgSend(v16, "atEndOfLine"))
  {
    objc_msgSend(v6, "advanceToNextLine");
    v19 = (void *)objc_opt_new();
    objc_msgSend(v19, "setType:", 23);
    objc_msgSend(v19, "setChildren:", v18);
    objc_msgSend(v19, "setRange:", objc_msgSend(v6, "startLocation"), objc_msgSend(v6, "location") - objc_msgSend(v6, "startLocation"));
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)_parseTableWithScanner:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "advanceToNextLine");
  -[MMParser _parseTableHeaderWithScanner:](self, "_parseTableHeaderWithScanner:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "commitTransaction:", 0);
    objc_msgSend(v4, "beginTransaction");
    -[MMParser _parseTableRowWithScanner:columns:](self, "_parseTableRowWithScanner:columns:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "setType:", 21);
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      objc_msgSend(v7, "children", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v18 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "setType:", 22);
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v10);
      }

      objc_msgSend(v4, "advanceToNextLine");
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v4, "atEndOfString") & 1) == 0)
      {
        do
        {
          objc_msgSend(v4, "beginTransaction");
          -[MMParser _parseTableRowWithScanner:columns:](self, "_parseTableRowWithScanner:columns:", v4, v5);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "commitTransaction:", v14 != 0);
          if (!v14)
            break;
          objc_msgSend(v13, "addObject:", v14);

        }
        while (!objc_msgSend(v4, "atEndOfString"));
      }
      if ((unint64_t)objc_msgSend(v13, "count") >= 2)
      {
        v15 = (void *)objc_opt_new();
        objc_msgSend(v15, "setType:", 20);
        objc_msgSend(v15, "setChildren:", v13);
        objc_msgSend(v15, "setRange:", objc_msgSend(v4, "startLocation"), objc_msgSend(v4, "location") - objc_msgSend(v4, "startLocation"));
      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)_updateLinksFromDefinitionsInDocument:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v30 = v3;
  objc_msgSend(v3, "elements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v7);
  while (1)
  {

    if (!objc_msgSend(v6, "count"))
      break;
    objc_msgSend(v6, "objectAtIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectAtIndex:", 0);
    objc_msgSend(v7, "children");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v8);

    v9 = objc_msgSend(v7, "type");
    if ((v9 - 15) >= 2)
    {
      if (v9 == 18)
      {
        objc_msgSend(v7, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "lowercaseString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v14);

      }
    }
    else
    {
      objc_msgSend(v7, "identifier");
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = (void *)v10;
        objc_msgSend(v7, "href");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
          objc_msgSend(v4, "addObject:", v7);
      }
    }
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v15 = v4;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v32;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v32 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v19);
        objc_msgSend(v20, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "lowercaseString");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v23)
        {
          objc_msgSend(v20, "setType:", 0);
          while (1)
          {
            objc_msgSend(v20, "children");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "count");

            if (!v27)
              break;
            v28 = (id)objc_msgSend(v20, "removeLastChild");
          }
        }
        objc_msgSend(v23, "href");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setHref:", v24);

        objc_msgSend(v23, "title");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setTitle:", v25);

        ++v19;
      }
      while (v19 != v17);
      v29 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      v17 = v29;
    }
    while (v29);
  }

}

- (unint64_t)extensions
{
  return self->_extensions;
}

- (MMHTMLParser)htmlParser
{
  return self->_htmlParser;
}

- (MMSpanParser)spanParser
{
  return self->_spanParser;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spanParser, 0);
  objc_storeStrong((id *)&self->_htmlParser, 0);
}

@end
