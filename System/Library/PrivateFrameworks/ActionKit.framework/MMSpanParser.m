@implementation MMSpanParser

- (MMSpanParser)initWithExtensions:(unint64_t)a3
{
  MMSpanParser *v4;
  MMSpanParser *v5;
  uint64_t v6;
  MMHTMLParser *htmlParser;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MMSpanParser;
  v4 = -[MMSpanParser init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_extensions = a3;
    v6 = objc_opt_new();
    htmlParser = v5->_htmlParser;
    v5->_htmlParser = (MMHTMLParser *)v6;

    -[MMSpanParser setParseEm:](v5, "setParseEm:", 1);
    -[MMSpanParser setParseImages:](v5, "setParseImages:", 1);
    -[MMSpanParser setParseLinks:](v5, "setParseLinks:", 1);
    -[MMSpanParser setParseStrong:](v5, "setParseStrong:", 1);
  }
  return v5;
}

- (id)parseSpansInBlockElement:(id)a3 withScanner:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  -[MMSpanParser setBlockElement:](self, "setBlockElement:", a3);
  objc_msgSend(v6, "skipWhitespace");
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __53__MMSpanParser_parseSpansInBlockElement_withScanner___block_invoke;
  v10[3] = &unk_24F8B9798;
  v11 = v6;
  v7 = v6;
  -[MMSpanParser _parseWithScanner:untilTestPasses:](self, "_parseWithScanner:untilTestPasses:", v7, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)parseSpansInTableColumns:(id)a3 withScanner:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  id *v20;
  id obj;
  _QWORD v23[4];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    v20 = &v24;
    obj = v8;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v6, "skipWhitespace", v20);
        v14 = objc_msgSend(v6, "location");
        v15 = objc_msgSend(v6, "nextCharacter");
        v16 = (void *)MEMORY[0x24BDBD1A8];
        if (v15 != 124)
        {
          v23[0] = MEMORY[0x24BDAC760];
          v23[1] = 3221225472;
          v23[2] = __53__MMSpanParser_parseSpansInTableColumns_withScanner___block_invoke;
          v23[3] = &unk_24F8B9798;
          v24 = v6;
          -[MMSpanParser _parseWithScanner:untilTestPasses:](self, "_parseWithScanner:untilTestPasses:", v24, v23);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v16)
          {

            v8 = obj;
            v18 = 0;
            goto LABEL_16;
          }
        }
        v17 = (void *)objc_opt_new();
        objc_msgSend(v17, "setType:", 24);
        objc_msgSend(v17, "setChildren:", v16);
        objc_msgSend(v17, "setRange:", v14, objc_msgSend(v6, "location") - v14);
        objc_msgSend(v17, "setAlignment:", objc_msgSend(v13, "integerValue"));
        objc_msgSend(v7, "addObject:", v17);
        if (objc_msgSend(v6, "nextCharacter") == 124)
          objc_msgSend(v6, "advance");

        if (v15 != 124)
      }
      v8 = obj;
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v10)
        continue;
      break;
    }
  }

  v18 = v7;
LABEL_16:

  return v18;
}

- (id)_parseWithScanner:(id)a3 untilTestPasses:(id)a4
{
  id v6;
  unsigned int (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v23;

  v6 = a3;
  v7 = (unsigned int (**)(_QWORD))a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "invertedSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginTransaction");
  if ((objc_msgSend(v6, "atEndOfString") & 1) != 0)
  {
LABEL_17:
    objc_msgSend(v6, "commitTransaction:", 0);
    v20 = 0;
  }
  else
  {
    while (1)
    {
      -[MMSpanParser _parseNextElementWithScanner:](self, "_parseNextElementWithScanner:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = objc_msgSend(v6, "startLocation");
        if (v11 != objc_msgSend(v10, "range"))
        {
          v12 = (void *)objc_opt_new();
          objc_msgSend(v12, "setType:", 0);
          objc_msgSend(v12, "setRange:", objc_msgSend(v6, "startLocation"), objc_msgSend(v10, "range") - objc_msgSend(v6, "startLocation"));
          objc_msgSend(v8, "addObject:", v12);

        }
        objc_msgSend(v8, "addObject:", v10);
        objc_msgSend(v6, "commitTransaction:", 1);
        objc_msgSend(v6, "beginTransaction");
      }
      else if (objc_msgSend(v6, "atEndOfLine"))
      {
        v13 = objc_msgSend(v6, "startLocation");
        if (v13 != objc_msgSend(v6, "location"))
        {
          v14 = (void *)objc_opt_new();
          objc_msgSend(v14, "setType:", 0);
          objc_msgSend(v14, "setRange:", objc_msgSend(v6, "startLocation"), objc_msgSend(v6, "location") - objc_msgSend(v6, "startLocation"));
          objc_msgSend(v8, "addObject:", v14);

        }
        if ((-[MMSpanParser extensions](self, "extensions") & 0x20) != 0)
        {
          -[MMSpanParser blockElement](self, "blockElement");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "type");

          if (v16 == 2)
          {
            v17 = (void *)objc_opt_new();
            objc_msgSend(v17, "setRange:", objc_msgSend(v6, "location"), 1);
            objc_msgSend(v17, "setType:", 10);
            objc_msgSend(v8, "addObject:", v17);

          }
        }
        v18 = (void *)objc_opt_new();
        objc_msgSend(v18, "setRange:", objc_msgSend(v6, "location"), 1);
        objc_msgSend(v18, "setType:", 19);
        objc_msgSend(v18, "setStringValue:", CFSTR("\n"));
        objc_msgSend(v8, "addObject:", v18);
        objc_msgSend(v6, "advanceToNextLine");
        objc_msgSend(v6, "commitTransaction:", 1);
        objc_msgSend(v6, "beginTransaction");

      }
      else if (!objc_msgSend(v6, "skipCharactersFromSet:", v9))
      {
        objc_msgSend(v6, "advance");
      }
      objc_msgSend(v6, "beginTransaction");
      v19 = objc_msgSend(v6, "location");
      if (v7[2](v7))
        break;
      objc_msgSend(v6, "commitTransaction:", 0);

      if (objc_msgSend(v6, "atEndOfString"))
        goto LABEL_17;
    }
    objc_msgSend(v6, "commitTransaction:", 1);
    if (objc_msgSend(v6, "startLocation") != v19)
    {
      v21 = (void *)objc_opt_new();
      objc_msgSend(v21, "setType:", 0);
      objc_msgSend(v21, "setRange:", objc_msgSend(v6, "startLocation"), v19 - objc_msgSend(v6, "startLocation"));
      objc_msgSend(v8, "addObject:", v21);

    }
    objc_msgSend(v6, "commitTransaction:", 1);
    v20 = v8;

  }
  return v20;
}

- (id)_parseNextElementWithScanner:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if ((-[MMSpanParser extensions](self, "extensions") & 0x40) == 0
    || (objc_msgSend(v4, "beginTransaction"),
        -[MMSpanParser _parseStrikethroughWithScanner:](self, "_parseStrikethroughWithScanner:", v4),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "commitTransaction:", v5 != 0),
        !v5))
  {
    if (!-[MMSpanParser parseLinks](self, "parseLinks"))
      goto LABEL_25;
    if ((-[MMSpanParser extensions](self, "extensions") & 1) == 0)
      goto LABEL_25;
    objc_msgSend(v4, "beginTransaction");
    -[MMSpanParser _parseAutolinkEmailAddressWithScanner:](self, "_parseAutolinkEmailAddressWithScanner:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "commitTransaction:", v5 != 0);
    if (!v5)
    {
      objc_msgSend(v4, "beginTransaction");
      -[MMSpanParser _parseAutolinkURLWithScanner:](self, "_parseAutolinkURLWithScanner:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "commitTransaction:", v5 != 0);
      if (!v5)
      {
        objc_msgSend(v4, "beginTransaction");
        -[MMSpanParser _parseAutolinkWWWURLWithScanner:](self, "_parseAutolinkWWWURLWithScanner:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "commitTransaction:", v5 != 0);
        if (!v5)
        {
LABEL_25:
          objc_msgSend(v4, "beginTransaction");
          -[MMSpanParser _parseBackslashWithScanner:](self, "_parseBackslashWithScanner:", v4);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "commitTransaction:", v5 != 0);
          if (!v5)
          {
            objc_msgSend(v4, "beginTransaction");
            -[MMSpanParser _parseEmAndStrongWithScanner:](self, "_parseEmAndStrongWithScanner:", v4);
            v5 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "commitTransaction:", v5 != 0);
            if (!v5)
            {
              objc_msgSend(v4, "beginTransaction");
              -[MMSpanParser _parseCodeSpanWithScanner:](self, "_parseCodeSpanWithScanner:", v4);
              v5 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "commitTransaction:", v5 != 0);
              if (!v5)
              {
                objc_msgSend(v4, "beginTransaction");
                -[MMSpanParser _parseLineBreakWithScanner:](self, "_parseLineBreakWithScanner:", v4);
                v5 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "commitTransaction:", v5 != 0);
                if (!v5)
                {
                  if (!-[MMSpanParser parseLinks](self, "parseLinks"))
                    goto LABEL_26;
                  objc_msgSend(v4, "beginTransaction");
                  -[MMSpanParser _parseAutomaticLinkWithScanner:](self, "_parseAutomaticLinkWithScanner:", v4);
                  v5 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "commitTransaction:", v5 != 0);
                  if (!v5)
                  {
                    objc_msgSend(v4, "beginTransaction");
                    -[MMSpanParser _parseAutomaticEmailLinkWithScanner:](self, "_parseAutomaticEmailLinkWithScanner:", v4);
                    v5 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v4, "commitTransaction:", v5 != 0);
                    if (!v5)
                    {
                      objc_msgSend(v4, "beginTransaction");
                      -[MMSpanParser _parseLinkWithScanner:](self, "_parseLinkWithScanner:", v4);
                      v5 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v4, "commitTransaction:", v5 != 0);
                      if (!v5)
                      {
LABEL_26:
                        if (!-[MMSpanParser parseImages](self, "parseImages")
                          || (objc_msgSend(v4, "beginTransaction"),
                              -[MMSpanParser _parseImageWithScanner:](self, "_parseImageWithScanner:", v4),
                              v5 = (void *)objc_claimAutoreleasedReturnValue(),
                              objc_msgSend(v4, "commitTransaction:", v5 != 0),
                              !v5))
                        {
                          objc_msgSend(v4, "beginTransaction");
                          -[MMSpanParser htmlParser](self, "htmlParser");
                          v6 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v6, "parseInlineTagWithScanner:", v4);
                          v5 = (void *)objc_claimAutoreleasedReturnValue();

                          objc_msgSend(v4, "commitTransaction:", v5 != 0);
                          if (!v5)
                          {
                            objc_msgSend(v4, "beginTransaction");
                            -[MMSpanParser htmlParser](self, "htmlParser");
                            v7 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v7, "parseCommentWithScanner:", v4);
                            v5 = (void *)objc_claimAutoreleasedReturnValue();

                            objc_msgSend(v4, "commitTransaction:", v5 != 0);
                            if (!v5)
                            {
                              objc_msgSend(v4, "beginTransaction");
                              -[MMSpanParser _parseAmpersandWithScanner:](self, "_parseAmpersandWithScanner:", v4);
                              v5 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v4, "commitTransaction:", v5 != 0);
                              if (!v5)
                              {
                                objc_msgSend(v4, "beginTransaction");
                                -[MMSpanParser _parseLeftAngleBracketWithScanner:](self, "_parseLeftAngleBracketWithScanner:", v4);
                                v5 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v4, "commitTransaction:", v5 != 0);
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
        }
      }
    }
  }

  return v5;
}

- (BOOL)_parseAutolinkDomainWithScanner:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD14A8], "alphanumericCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v5, "addCharactersInString:", CFSTR("-:"));
  if (objc_msgSend(v4, "characterIsMember:", objc_msgSend(v3, "nextCharacter"))
    && (objc_msgSend(v3, "skipCharactersFromSet:", v5), objc_msgSend(v3, "nextCharacter") == 46))
  {
    objc_msgSend(v3, "advance");
    v6 = objc_msgSend(v3, "skipCharactersFromSet:", v5) != 0;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_parseAutolinkPathWithScanner:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  objc_msgSend(MEMORY[0x24BDD14A8], "alphanumericCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v4, "addCharactersInString:", CFSTR(",_-/:?&;%~!#+=@"));
  v5 = 0;
  while (1)
  {
    while (1)
    {
LABEL_2:
      v6 = v11;
      while (1)
      {
        do
        {
          v7 = objc_msgSend(v6, "skipCharactersFromSet:", v4);
          v6 = v11;
        }
        while (v7);
        if (objc_msgSend(v11, "nextCharacter") != 92)
          break;
        objc_msgSend(v11, "advance");
        v8 = objc_msgSend(v11, "nextCharacter");
        v6 = v11;
        if (v8 != 40)
        {
          v9 = objc_msgSend(v11, "nextCharacter");
          v6 = v11;
          if (v9 != 41)
            continue;
        }
        objc_msgSend(v6, "advance");
        goto LABEL_2;
      }
      if (objc_msgSend(v11, "nextCharacter") == 40)
      {
        v10 = 1;
        goto LABEL_16;
      }
      if (objc_msgSend(v11, "nextCharacter") != 41 || !v5)
        break;
      v10 = -1;
LABEL_16:
      v5 += v10;
      objc_msgSend(v11, "advance");
    }
    if (objc_msgSend(v11, "nextCharacter") != 46)
      goto LABEL_18;
    objc_msgSend(v11, "beginTransaction");
    objc_msgSend(v11, "advance");
    if (!objc_msgSend(v4, "characterIsMember:", objc_msgSend(v11, "nextCharacter")))
      break;
    objc_msgSend(v11, "commitTransaction:", 1);
  }
  objc_msgSend(v11, "commitTransaction:", 0);
LABEL_18:

}

- (id)_parseAutolinkEmailAddressWithScanner:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v3 = a3;
  if (objc_msgSend(v3, "nextCharacter") == 64)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "alphanumericCharacterSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v5, "addCharactersInString:", CFSTR("._-+"));
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v6, "addCharactersInString:", CFSTR("._-"));
    objc_msgSend(v3, "commitTransaction:", 0);
    objc_msgSend(v3, "previousWordWithCharactersFromSet:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "beginTransaction");
    if (objc_msgSend(v7, "length"))
    {
      objc_msgSend(v3, "advance");
      objc_msgSend(v3, "nextWordWithCharactersFromSet:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "rangeOfCharacterFromSet:options:", v4, 4);
      if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v11 = 0;
      }
      else
      {
        objc_msgSend(v8, "substringToIndex:", v9 + v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v12, "rangeOfString:", CFSTR(".")) == 0x7FFFFFFFFFFFFFFFLL)
        {
          v11 = 0;
        }
        else
        {
          objc_msgSend(v3, "setLocation:", objc_msgSend(v3, "location") + objc_msgSend(v12, "length"));
          v13 = objc_msgSend(v3, "startLocation");
          v14 = v13 - objc_msgSend(v7, "length");
          v15 = objc_msgSend(v3, "location") - v14;
          v11 = (void *)objc_opt_new();
          objc_msgSend(v11, "setType:", 17);
          objc_msgSend(v11, "setRange:", v14, v15);
          objc_msgSend(v3, "string");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "substringWithRange:", v14, v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setHref:", v17);

        }
        v8 = v12;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_parseAutolinkURLWithScanner:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  if (objc_msgSend(v4, "nextCharacter") == 58)
  {
    objc_msgSend(v4, "commitTransaction:", 0);
    objc_msgSend(v4, "previousWord");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "beginTransaction");
    objc_msgSend(v5, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(&unk_24F93C600, "containsObject:", v6);

    if (v7
      && objc_msgSend(v4, "matchString:", CFSTR("://"))
      && -[MMSpanParser _parseAutolinkDomainWithScanner:](self, "_parseAutolinkDomainWithScanner:", v4))
    {
      -[MMSpanParser _parseAutolinkPathWithScanner:](self, "_parseAutolinkPathWithScanner:", v4);
      v8 = objc_msgSend(v4, "startLocation");
      v9 = v8 - objc_msgSend(v5, "length");
      v10 = objc_msgSend(v4, "location") - v9;
      v11 = (void *)objc_opt_new();
      objc_msgSend(v11, "setType:", 16);
      objc_msgSend(v11, "setRange:", v9, v10);
      objc_msgSend(v4, "string");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "substringWithRange:", v9, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setHref:", v13);

      v14 = (void *)objc_opt_new();
      objc_msgSend(v14, "setType:", 0);
      objc_msgSend(v14, "setRange:", v9, v10);
      objc_msgSend(v11, "addChild:", v14);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_parseAutolinkWWWURLWithScanner:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  if (objc_msgSend(v4, "matchString:", CFSTR("www."))
    && -[MMSpanParser _parseAutolinkDomainWithScanner:](self, "_parseAutolinkDomainWithScanner:", v4))
  {
    -[MMSpanParser _parseAutolinkPathWithScanner:](self, "_parseAutolinkPathWithScanner:", v4);
    v5 = objc_msgSend(v4, "startLocation");
    v6 = objc_msgSend(v4, "location");
    v7 = v6 - objc_msgSend(v4, "startLocation");
    objc_msgSend(v4, "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "substringWithRange:", v5, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setType:", 16);
    objc_msgSend(v10, "setRange:", v5, v7);
    objc_msgSend(CFSTR("http://"), "stringByAppendingString:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHref:", v11);

    v12 = (void *)objc_opt_new();
    objc_msgSend(v12, "setType:", 0);
    objc_msgSend(v12, "setRange:", v5, v7);
    objc_msgSend(v10, "addChild:", v12);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_parseStrikethroughWithScanner:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;

  v4 = a3;
  if (objc_msgSend(v4, "matchString:", CFSTR("~~")))
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __47__MMSpanParser__parseStrikethroughWithScanner___block_invoke;
    v14 = &unk_24F8B97C0;
    v6 = v4;
    v15 = v6;
    v7 = v5;
    v16 = v7;
    -[MMSpanParser _parseWithScanner:untilTestPasses:](self, "_parseWithScanner:untilTestPasses:", v6, &v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)objc_opt_new();
      objc_msgSend(v9, "setType:", 11, v11, v12, v13, v14, v15);
      objc_msgSend(v9, "setRange:", objc_msgSend(v6, "startLocation"), objc_msgSend(v6, "location") - objc_msgSend(v6, "startLocation"));
      objc_msgSend(v9, "setChildren:", v8);
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_parseEmAndStrongWithScanner:(id)a3
{
  id v4;
  int v5;
  int v6;
  BOOL v7;
  void *v8;
  __int16 v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v33;
  _BOOL4 v34;
  void *v35;
  int v36;
  _QWORD aBlock[4];
  id v38;
  id v39;
  MMSpanParser *v40;
  id v41;
  uint64_t *v42;
  __int16 v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[3];

  v48[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "nextCharacter");
  v6 = v5;
  if (v5 == 95 || v5 == 42)
  {
    v7 = v5 == 95;
    objc_msgSend(MEMORY[0x24BDD14A8], "alphanumericCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MMSpanParser extensions](self, "extensions");
    v10 = !v7;
    if ((v9 & 0x200) == 0)
      v10 = 1;
    if ((v10 & 1) == 0)
    {
      objc_msgSend(v4, "commitTransaction:", 0);
      v11 = objc_msgSend(v4, "previousCharacter");
      objc_msgSend(v4, "beginTransaction");
      if ((objc_msgSend(v8, "characterIsMember:", v11) & 1) != 0)
        goto LABEL_17;
    }
    if (objc_msgSend(v4, "previousCharacter") == v6)
      goto LABEL_17;
    if (objc_msgSend(v4, "nextCharacter") == v6)
    {
      v12 = -1;
      do
      {
        v13 = v12;
        objc_msgSend(v4, "advance");
        v14 = objc_msgSend(v4, "nextCharacter");
        v12 = v13 + 1;
      }
      while (v14 == v6);
      v15 = v13 + 2;
      if ((unint64_t)(v13 + 2) > 3)
        goto LABEL_17;
      v34 = v12 == 0;
      v16 = v15 == 3;
      if ((v12 | 2) == 2 && !-[MMSpanParser parseEm](self, "parseEm"))
        goto LABEL_17;
      if ((v15 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        if (-[MMSpanParser parseStrong](self, "parseStrong"))
        {
          v36 = 1;
          goto LABEL_21;
        }
LABEL_17:
        v17 = 0;
LABEL_59:

        goto LABEL_60;
      }
    }
    else
    {
      v15 = 0;
      v34 = 0;
      v16 = 0;
    }
    v36 = 0;
LABEL_21:
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0;
    v45 = &v44;
    v46 = 0x2020000000;
    v47 = v15;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __45__MMSpanParser__parseEmAndStrongWithScanner___block_invoke;
    aBlock[3] = &unk_24F8B97E8;
    v19 = v4;
    v38 = v19;
    v43 = v6;
    v42 = &v44;
    v33 = v18;
    v39 = v33;
    v40 = self;
    v41 = v8;
    v35 = _Block_copy(aBlock);
    if ((v15 | 2) == 3)
      -[MMSpanParser setParseEm:](self, "setParseEm:", 0);
    if (v36)
      -[MMSpanParser setParseStrong:](self, "setParseStrong:", 0);
    -[MMSpanParser _parseWithScanner:untilTestPasses:](self, "_parseWithScanner:untilTestPasses:", v19, v35);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if ((v15 | 2) == 3 && (!v20 || v45[3] != 1))
      -[MMSpanParser setParseEm:](self, "setParseEm:", 1);
    if (v36)
    {
      if (v21 && v45[3] == 2)
        goto LABEL_34;
      -[MMSpanParser setParseStrong:](self, "setParseStrong:", 1);
    }
    if (!v21)
    {
      v17 = 0;
LABEL_58:

      _Block_object_dispose(&v44, 8);
      goto LABEL_59;
    }
LABEL_34:
    if (v16)
      v34 = v45[3] != 1;
    v22 = objc_msgSend(v19, "startLocation");
    v23 = v45[3];
    v24 = (void *)objc_opt_new();
    v25 = v24;
    if (v34)
      v26 = 13;
    else
      v26 = 12;
    objc_msgSend(v24, "setType:", v26);
    objc_msgSend(v25, "setRange:", v23 + v22, objc_msgSend(v19, "location") - (v23 + v22));
    objc_msgSend(v25, "setChildren:", v21);
    v27 = v45[3];
    if (v16)
    {
      if (!v27)
      {
        v48[0] = v25;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)objc_opt_new();

        objc_msgSend(v29, "setType:", 12);
        objc_msgSend(v29, "setRange:", objc_msgSend(v19, "startLocation"), objc_msgSend(v19, "location") - objc_msgSend(v19, "startLocation"));
        objc_msgSend(v29, "setChildren:", v28);
LABEL_52:

LABEL_56:
        v25 = v29;
        v17 = v25;
        goto LABEL_57;
      }
    }
    else if (!v27)
    {
      v29 = v25;
      goto LABEL_56;
    }
    -[MMSpanParser _parseWithScanner:untilTestPasses:](self, "_parseWithScanner:untilTestPasses:", v19, v35);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v30, "mutableCopy");

    if ((v15 | 2) == 3)
      -[MMSpanParser setParseEm:](self, "setParseEm:", 1);
    if (v36)
      -[MMSpanParser setParseStrong:](self, "setParseStrong:", 1);
    if (!v28)
    {
      v17 = 0;
LABEL_57:

      goto LABEL_58;
    }
    objc_msgSend(v28, "insertObject:atIndex:", v25, 0);
    v29 = (void *)objc_opt_new();

    if (v34)
      v31 = 12;
    else
      v31 = 13;
    objc_msgSend(v29, "setType:", v31);
    objc_msgSend(v29, "setRange:", objc_msgSend(v19, "startLocation"), objc_msgSend(v19, "location") - objc_msgSend(v19, "startLocation"));
    objc_msgSend(v29, "setChildren:", v28);
    goto LABEL_52;
  }
  v17 = 0;
LABEL_60:

  return v17;
}

- (id)_parseCodeSpanWithScanner:(id)a3
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;

  v3 = a3;
  if (objc_msgSend(v3, "nextCharacter") != 96)
  {
    v7 = 0;
    goto LABEL_34;
  }
  objc_msgSend(v3, "advance");
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setType:", 14);
  v5 = objc_msgSend(v3, "nextCharacter");
  v6 = 1;
  while (v5 == 96)
  {
    ++v6;
    objc_msgSend(v3, "advance");
    v5 = objc_msgSend(v3, "nextCharacter");
  }
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "skipCharactersFromSet:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invertedSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v3, "location");
  if ((objc_msgSend(v3, "atEndOfString") & 1) != 0)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_33;
  }
  while (1)
  {
    objc_msgSend(v3, "skipCharactersFromSet:", v10);
    if (v11 != objc_msgSend(v3, "location"))
    {
      v12 = (void *)objc_opt_new();
      objc_msgSend(v12, "setType:", 0);
      objc_msgSend(v12, "setRange:", v11, objc_msgSend(v3, "location") - v11);
      objc_msgSend(v4, "addChild:", v12);

    }
    if (objc_msgSend(v3, "nextCharacter") == 96)
      break;
    v15 = objc_msgSend(v3, "nextCharacter");
    switch(v15)
    {
      case '>':
        v16 = (void *)objc_opt_new();
        objc_msgSend(v16, "setType:", 19);
        objc_msgSend(v16, "setRange:", objc_msgSend(v3, "location"), 1);
        v17 = v16;
        v18 = CFSTR("&gt;");
        goto LABEL_22;
      case '<':
        v16 = (void *)objc_opt_new();
        objc_msgSend(v16, "setType:", 19);
        objc_msgSend(v16, "setRange:", objc_msgSend(v3, "location"), 1);
        v17 = v16;
        v18 = CFSTR("&lt;");
        goto LABEL_22;
      case '&':
        v16 = (void *)objc_opt_new();
        objc_msgSend(v16, "setType:", 19);
        objc_msgSend(v16, "setRange:", objc_msgSend(v3, "location"), 1);
        v17 = v16;
        v18 = CFSTR("&amp;");
LABEL_22:
        objc_msgSend(v17, "setStringValue:", v18);
        objc_msgSend(v4, "addChild:", v16);
        objc_msgSend(v3, "advance");

        goto LABEL_23;
    }
    if (objc_msgSend(v3, "atEndOfLine"))
    {
      v11 = objc_msgSend(v3, "location");
      objc_msgSend(v3, "advanceToNextLine");
      goto LABEL_24;
    }
LABEL_23:
    v11 = objc_msgSend(v3, "location");
LABEL_24:
    if ((objc_msgSend(v3, "atEndOfString") & 1) != 0)
      goto LABEL_7;
  }
  v13 = objc_msgSend(v3, "location");
  if (v6)
  {
    v11 = v13;
    v14 = v6;
    while (objc_msgSend(v3, "nextCharacter") == 96)
    {
      objc_msgSend(v3, "advance");
      if (!--v14)
        goto LABEL_28;
    }
    goto LABEL_24;
  }
LABEL_28:
  objc_msgSend(v4, "children");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v20)
  {
    objc_msgSend(v4, "children");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "lastObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "string");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "range");
    v26 = objc_msgSend(v23, "characterAtIndex:", v25 + v24 - 1);

    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v26) = objc_msgSend(v27, "characterIsMember:", v26);

    if ((_DWORD)v26)
    {
      do
      {
        v28 = objc_msgSend(v22, "range");
        objc_msgSend(v22, "setRange:", v28, v29 - 1);
        objc_msgSend(v3, "string");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v22, "range");
        v33 = objc_msgSend(v30, "characterAtIndex:", v32 + v31 - 1);

        objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v33) = objc_msgSend(v34, "characterIsMember:", v33);

      }
      while ((v33 & 1) != 0);
    }

  }
  objc_msgSend(v4, "setRange:", objc_msgSend(v3, "startLocation"), objc_msgSend(v3, "location") - objc_msgSend(v3, "startLocation"));
  v7 = v4;
LABEL_33:

LABEL_34:
  return v7;
}

- (id)_parseLineBreakWithScanner:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(" "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "skipCharactersFromSet:", v4) >= 2
    && objc_msgSend(v3, "atEndOfLine")
    && (objc_msgSend(v3, "atEndOfString") & 1) == 0)
  {
    v7 = objc_msgSend(v3, "startLocation") + 1;
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setType:", 10);
    objc_msgSend(v5, "setRange:", v7, objc_msgSend(v3, "location") - v7);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_parseAutomaticLinkWithScanner:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;

  v3 = a3;
  if (objc_msgSend(v3, "nextCharacter") != 60)
    goto LABEL_3;
  objc_msgSend(v3, "advance");
  v4 = objc_msgSend(v3, "location");
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(">"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invertedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "skipCharactersFromSet:", v6);

  if ((objc_msgSend(v3, "atEndOfLine") & 1) == 0)
  {
    objc_msgSend(v3, "advance");
    v8 = objc_msgSend(v3, "location") + ~v4;
    objc_msgSend(v3, "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "substringWithRange:", v4, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (_parseAutomaticLinkWithScanner__onceToken != -1)
      dispatch_once(&_parseAutomaticLinkWithScanner__onceToken, &__block_literal_global_43733);
    v7 = 0;
    if (objc_msgSend((id)_parseAutomaticLinkWithScanner__regex, "rangeOfFirstMatchInString:options:range:", v10, 0, 0, objc_msgSend(v10, "length")) != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v19 = v11;
        v7 = (void *)objc_opt_new();
        objc_msgSend(v7, "setType:", 16);
        objc_msgSend(v7, "setRange:", objc_msgSend(v3, "startLocation"), objc_msgSend(v3, "location") - objc_msgSend(v3, "startLocation"));
        objc_msgSend(v7, "setHref:", v10);
        objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("&"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          while (1)
          {
            objc_msgSend(v3, "string");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "rangeOfCharacterFromSet:options:range:", v12, 0, v4, v8);

            if (v14 == 0x7FFFFFFFFFFFFFFFLL)
              break;
            if (v14 != v4)
            {
              v15 = (void *)objc_opt_new();
              objc_msgSend(v15, "setType:", 0);
              objc_msgSend(v15, "setRange:", v4, v14 - v4);
              objc_msgSend(v7, "addChild:", v15);

            }
            v16 = (void *)objc_opt_new();
            objc_msgSend(v16, "setType:", 19);
            objc_msgSend(v16, "setRange:", v4, 1);
            objc_msgSend(v16, "setStringValue:", CFSTR("&amp;"));
            objc_msgSend(v7, "addChild:", v16);
            v8 += v4 + ~v14;

            v4 = v14 + 1;
            if (!v8)
              goto LABEL_16;
          }
          v17 = (void *)objc_opt_new();
          objc_msgSend(v17, "setType:", 0);
          objc_msgSend(v17, "setRange:", v4, v8);
          objc_msgSend(v7, "addChild:", v17);

        }
LABEL_16:

        v11 = v19;
      }
      else
      {
        v7 = 0;
      }

    }
  }
  else
  {
LABEL_3:
    v7 = 0;
  }

  return v7;
}

- (id)_parseAutomaticEmailLinkWithScanner:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = a3;
  if (objc_msgSend(v3, "nextCharacter") != 60)
    goto LABEL_3;
  objc_msgSend(v3, "advance");
  v4 = objc_msgSend(v3, "location");
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(">"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invertedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "skipCharactersFromSet:", v6);

  if ((objc_msgSend(v3, "atEndOfLine") & 1) == 0)
  {
    objc_msgSend(v3, "advance");
    v8 = objc_msgSend(v3, "location") + ~v4;
    objc_msgSend(v3, "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "substringWithRange:", v4, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (_parseAutomaticEmailLinkWithScanner__onceToken != -1)
      dispatch_once(&_parseAutomaticEmailLinkWithScanner__onceToken, &__block_literal_global_53);
    v7 = 0;
    if (objc_msgSend((id)_parseAutomaticEmailLinkWithScanner__regex, "rangeOfFirstMatchInString:options:range:", v10, 0, 0, objc_msgSend(v10, "length")) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = (void *)objc_opt_new();
      objc_msgSend(v7, "setType:", 17);
      objc_msgSend(v7, "setRange:", objc_msgSend(v3, "startLocation"), objc_msgSend(v3, "location") - objc_msgSend(v3, "startLocation"));
      objc_msgSend(v7, "setHref:", v10);
    }

  }
  else
  {
LABEL_3:
    v7 = 0;
  }

  return v7;
}

- (id)_parseLinkTextBodyWithScanner:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  id v14;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  if (objc_msgSend(v3, "nextCharacter") == 91)
  {
    objc_msgSend(v3, "advance");
    objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("[]\\"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invertedSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v3, "currentRange");
    v9 = v8;
    v10 = 1;
    do
    {
      if ((objc_msgSend(v3, "atEndOfString") & 1) != 0)
      {
        v14 = 0;
        goto LABEL_20;
      }
      if (objc_msgSend(v3, "atEndOfLine"))
      {
        if (v9)
        {
          objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v7, v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v11);

        }
        objc_msgSend(v3, "advanceToNextLine");
        v7 = objc_msgSend(v3, "currentRange");
      }
      objc_msgSend(v3, "skipCharactersFromSet:", v6);
      v12 = objc_msgSend(v3, "nextCharacter");
      switch(v12)
      {
        case ']':
          --v10;
          break;
        case '\\':
          objc_msgSend(v3, "advance");
          break;
        case '[':
          ++v10;
          break;
      }
      v9 = objc_msgSend(v3, "location") - v7;
      objc_msgSend(v3, "advance");
    }
    while (v10);
    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v7, v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v13);

    }
    v14 = v4;
LABEL_20:

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_parseInlineLinkWithScanner:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v26;
  uint64_t v27;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setType:", 16);
  -[MMSpanParser _parseLinkTextBodyWithScanner:](self, "_parseLinkTextBodyWithScanner:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInnerRanges:", v6);

  objc_msgSend(v5, "innerRanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_21;
  if (objc_msgSend(v4, "nextCharacter") != 40)
  {
    v7 = 0;
LABEL_21:
    v24 = 0;
    goto LABEL_22;
  }
  objc_msgSend(v4, "advance");
  objc_msgSend(v4, "skipWhitespace");
  v8 = objc_msgSend(v4, "location");
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("()\\ \t"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invertedSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 1;
  while (1)
  {
    objc_msgSend(v4, "skipCharactersFromSet:", v7);
    if ((objc_msgSend(v4, "atEndOfLine") & 1) != 0)
      goto LABEL_21;
    v11 = objc_msgSend(v4, "location");
    v12 = objc_msgSend(v4, "nextCharacter");
    if ((_DWORD)v12 == 92)
    {
      objc_msgSend(v4, "advance");
      goto LABEL_12;
    }
    v13 = v12;
    if ((_DWORD)v12 == 41)
    {
      --v10;
      goto LABEL_12;
    }
    if ((_DWORD)v12 != 40)
      break;
    ++v10;
LABEL_12:
    v11 = objc_msgSend(v4, "location");
    objc_msgSend(v4, "advance");
    if (!v10)
    {
      v16 = 0x7FFFFFFFFFFFFFFFLL;
      v17 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_14:
      objc_msgSend(v4, "string");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "substringWithRange:", v8, v11 - v8);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v19, "hasPrefix:", CFSTR("<"))
        && objc_msgSend(v19, "hasSuffix:", CFSTR(">")))
      {
        objc_msgSend(v19, "substringWithRange:", 1, objc_msgSend(v19, "length") - 2);
        v20 = objc_claimAutoreleasedReturnValue();

        v19 = (void *)v20;
      }
      objc_msgSend(v5, "setRange:", objc_msgSend(v4, "startLocation"), objc_msgSend(v4, "location") - objc_msgSend(v4, "startLocation"));
      -[MMSpanParser _stringWithBackslashEscapesRemoved:](self, "_stringWithBackslashEscapesRemoved:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setHref:", v21);

      if (v16 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v4, "string");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "substringWithRange:", v16, v17 - v16);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setTitle:", v23);

      }
      v24 = v5;

      goto LABEL_22;
    }
  }
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "characterIsMember:", v13);

  if (!v15)
    goto LABEL_12;
  if (v10 != 1)
    goto LABEL_21;
  objc_msgSend(v4, "skipWhitespace");
  if (objc_msgSend(v4, "nextCharacter") == 41)
  {
    v16 = 0x7FFFFFFFFFFFFFFFLL;
    v17 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_31:
    objc_msgSend(v4, "advance");
    goto LABEL_14;
  }
  if (objc_msgSend(v4, "nextCharacter") != 34)
    goto LABEL_21;
  objc_msgSend(v4, "advance");
  v16 = objc_msgSend(v4, "location");
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("\"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "invertedSet");
  v27 = objc_claimAutoreleasedReturnValue();

  while (1)
  {
    objc_msgSend(v4, "skipCharactersFromSet:", v27);
    if ((objc_msgSend(v4, "atEndOfLine") & 1) != 0)
      break;
    objc_msgSend(v4, "advance");
    if (objc_msgSend(v4, "nextCharacter") == 41)
    {
      v17 = objc_msgSend(v4, "location") - 1;
      v7 = (void *)v27;
      goto LABEL_31;
    }
  }
  v24 = 0;
  v7 = (void *)v27;
LABEL_22:

  return v24;
}

- (id)_parseReferenceLinkWithScanner:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setType:", 16);
  -[MMSpanParser _parseLinkTextBodyWithScanner:](self, "_parseLinkTextBodyWithScanner:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInnerRanges:", v6);

  objc_msgSend(v5, "innerRanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "count");

  if (v8)
  {
    if (objc_msgSend(v4, "nextCharacter") == 32)
    {
      objc_msgSend(v4, "advance");
    }
    else if (objc_msgSend(v4, "atEndOfLine"))
    {
      objc_msgSend(v4, "advanceToNextLine");
    }
    -[MMSpanParser _parseLinkTextBodyWithScanner:](self, "_parseLinkTextBodyWithScanner:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = v9;
      v24 = v5;
      if (!objc_msgSend(v9, "count"))
      {
        objc_msgSend(v5, "innerRanges");
        v11 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v11;
      }
      v12 = (void *)objc_opt_new();
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v13 = v10;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v26;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v26 != v16)
              objc_enumerationMutation(v13);
            v18 = objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v17), "rangeValue");
            v20 = v19;
            objc_msgSend(v4, "string");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "substringWithRange:", v18, v20);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "appendString:", v22);

            objc_msgSend(v12, "appendString:", CFSTR(" "));
            ++v17;
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v15);
      }

      objc_msgSend(v12, "deleteCharactersInRange:", objc_msgSend(v12, "length") - 1, 1);
      v5 = v24;
      objc_msgSend(v24, "setRange:", objc_msgSend(v4, "startLocation"), objc_msgSend(v4, "location") - objc_msgSend(v4, "startLocation"));
      objc_msgSend(v24, "setIdentifier:", v12);
      v8 = v24;

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)_parseLinkWithScanner:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  -[MMSpanParser _parseInlineLinkWithScanner:](self, "_parseInlineLinkWithScanner:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    || (objc_msgSend(v4, "commitTransaction:", 0),
        objc_msgSend(v4, "beginTransaction"),
        -[MMSpanParser _parseReferenceLinkWithScanner:](self, "_parseReferenceLinkWithScanner:", v4),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v5, "innerRanges");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      -[MMSpanParser setParseLinks:](self, "setParseLinks:", 0);
      objc_msgSend(v4, "string");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "innerRanges");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[MMScanner scannerWithString:lineRanges:](MMScanner, "scannerWithString:lineRanges:", v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __38__MMSpanParser__parseLinkWithScanner___block_invoke;
      v14[3] = &unk_24F8B9798;
      v15 = v10;
      v11 = v10;
      -[MMSpanParser _parseWithScanner:untilTestPasses:](self, "_parseWithScanner:untilTestPasses:", v11, v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setChildren:", v12);

      -[MMSpanParser setParseLinks:](self, "setParseLinks:", 1);
    }
  }

  return v5;
}

- (id)_parseImageWithScanner:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "nextCharacter") == 33)
  {
    objc_msgSend(v4, "advance");
    objc_msgSend(v4, "beginTransaction");
    -[MMSpanParser setParseImages:](self, "setParseImages:", 0);
    -[MMSpanParser _parseInlineLinkWithScanner:](self, "_parseInlineLinkWithScanner:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MMSpanParser setParseImages:](self, "setParseImages:", 1);
    if (v5)
    {
      objc_msgSend(v4, "commitTransaction:", 1);
    }
    else
    {
      objc_msgSend(v4, "commitTransaction:", 0);
      objc_msgSend(v4, "beginTransaction");
      -[MMSpanParser _parseReferenceLinkWithScanner:](self, "_parseReferenceLinkWithScanner:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "commitTransaction:", 1);
      if (!v5)
        goto LABEL_14;
    }
    objc_msgSend(v5, "setType:", 15);
    v6 = objc_msgSend(v5, "range");
    objc_msgSend(v5, "setRange:", v6 - 1, v7 + 1);
    v8 = (void *)objc_opt_new();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v5, "innerRanges", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v14 = objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "rangeValue");
          v16 = v15;
          objc_msgSend(v4, "string");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "substringWithRange:", v14, v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "appendString:", v18);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }

    objc_msgSend(v5, "setStringValue:", v8);
  }
  else
  {
    v5 = 0;
  }
LABEL_14:

  return v5;
}

- (id)_parseAmpersandWithScanner:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "nextCharacter") != 38)
    goto LABEL_5;
  objc_msgSend(v3, "advance");
  objc_msgSend(v3, "beginTransaction");
  if (objc_msgSend(v3, "nextCharacter") == 35)
    objc_msgSend(v3, "advance");
  objc_msgSend(MEMORY[0x24BDD14A8], "alphanumericCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "skipCharactersFromSet:", v4);

  LODWORD(v4) = objc_msgSend(v3, "nextCharacter");
  objc_msgSend(v3, "commitTransaction:", 0);
  if ((_DWORD)v4 != 59)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setType:", 19);
    objc_msgSend(v5, "setRange:", objc_msgSend(v3, "location") - 1, 1);
    objc_msgSend(v5, "setStringValue:", CFSTR("&amp;"));
  }
  else
  {
LABEL_5:
    v5 = 0;
  }

  return v5;
}

- (id)_parseBackslashWithScanner:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend(v3, "nextCharacter") == 92)
  {
    objc_msgSend(v3, "advance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "characterIsMember:", objc_msgSend(v3, "nextCharacter")))
    {
      v5 = (void *)objc_opt_new();
      objc_msgSend(v5, "setType:", 19);
      objc_msgSend(v5, "setRange:", objc_msgSend(v3, "location") - 1, 2);
      objc_msgSend(v3, "string");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "substringWithRange:", objc_msgSend(v3, "location"), 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setStringValue:", v7);

      objc_msgSend(v3, "advance");
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_parseLeftAngleBracketWithScanner:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "nextCharacter") == 60)
  {
    objc_msgSend(v3, "advance");
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "setType:", 19);
    objc_msgSend(v4, "setRange:", objc_msgSend(v3, "location") - 1, 1);
    objc_msgSend(v4, "setStringValue:", CFSTR("&lt;"));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_stringWithBackslashEscapesRemoved:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "length");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v13; v6 = v13 - i)
    {
      v8 = objc_msgSend(v3, "rangeOfString:options:range:", CFSTR("\\"), 0, i, v6);
      if (v8 == 0x7FFFFFFFFFFFFFFFLL || v8 + v9 == i + v6)
        break;
      v11 = v8;
      v12 = v9;
      i = v8 + 1;
      if (objc_msgSend(v4, "characterIsMember:", objc_msgSend(v3, "characterAtIndex:", v8 + 1)))
        objc_msgSend(v3, "replaceCharactersInRange:withString:", v11, v12, &stru_24F8BBA48);
      v13 = objc_msgSend(v3, "length");
    }
  }

  return v3;
}

- (unint64_t)extensions
{
  return self->_extensions;
}

- (MMHTMLParser)htmlParser
{
  return self->_htmlParser;
}

- (NSMutableArray)elements
{
  return self->_elements;
}

- (void)setElements:(id)a3
{
  objc_storeStrong((id *)&self->_elements, a3);
}

- (NSMutableArray)openElements
{
  return self->_openElements;
}

- (void)setOpenElements:(id)a3
{
  objc_storeStrong((id *)&self->_openElements, a3);
}

- (MMElement)blockElement
{
  return self->_blockElement;
}

- (void)setBlockElement:(id)a3
{
  objc_storeStrong((id *)&self->_blockElement, a3);
}

- (BOOL)parseEm
{
  return self->_parseEm;
}

- (void)setParseEm:(BOOL)a3
{
  self->_parseEm = a3;
}

- (BOOL)parseImages
{
  return self->_parseImages;
}

- (void)setParseImages:(BOOL)a3
{
  self->_parseImages = a3;
}

- (BOOL)parseLinks
{
  return self->_parseLinks;
}

- (void)setParseLinks:(BOOL)a3
{
  self->_parseLinks = a3;
}

- (BOOL)parseStrong
{
  return self->_parseStrong;
}

- (void)setParseStrong:(BOOL)a3
{
  self->_parseStrong = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockElement, 0);
  objc_storeStrong((id *)&self->_openElements, 0);
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_htmlParser, 0);
}

uint64_t __38__MMSpanParser__parseLinkWithScanner___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "atEndOfString");
}

void __52__MMSpanParser__parseAutomaticEmailLinkWithScanner___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("^[-._0-9\\p{L}]+@[-\\p{L}0-9][-.\\p{L}0-9]*\\.\\p{L}+$"), 1, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_parseAutomaticEmailLinkWithScanner__regex;
  _parseAutomaticEmailLinkWithScanner__regex = v0;

}

void __47__MMSpanParser__parseAutomaticLinkWithScanner___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("^(\\w+)://"), 0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_parseAutomaticLinkWithScanner__regex;
  _parseAutomaticLinkWithScanner__regex = v0;

}

uint64_t __45__MMSpanParser__parseEmAndStrongWithScanner___block_invoke(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  BOOL v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "atBeginningOfLine") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 40), "characterIsMember:", objc_msgSend(*(id *)(a1 + 32), "previousCharacter")) & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "nextCharacter") != *(unsigned __int16 *)(a1 + 72))
  {
    return 0;
  }
  v2 = 0;
  while (1)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    if (v2 >= v3)
      break;
    ++v2;
    objc_msgSend(*(id *)(a1 + 32), "advance");
    if (objc_msgSend(*(id *)(a1 + 32), "nextCharacter") != *(unsigned __int16 *)(a1 + 72))
    {
      v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      goto LABEL_9;
    }
  }
  if (!v2)
    return 0;
LABEL_9:
  v4 = v2 == v3 || v3 == 3;
  if (!v4
    || (objc_msgSend(*(id *)(a1 + 48), "extensions") & 0x200) != 0
    && *(_WORD *)(a1 + 72) == 95
    && (objc_msgSend(*(id *)(a1 + 56), "characterIsMember:", objc_msgSend(*(id *)(a1 + 32), "nextCharacter")) & 1) != 0)
  {
    return 0;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) -= v2;
  return 1;
}

uint64_t __47__MMSpanParser__parseStrikethroughWithScanner___block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "atBeginningOfLine") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 40), "characterIsMember:", objc_msgSend(*(id *)(a1 + 32), "previousCharacter")) & 1) != 0)
  {
    return 0;
  }
  else
  {
    return objc_msgSend(*(id *)(a1 + 32), "matchString:", CFSTR("~~"));
  }
}

uint64_t __53__MMSpanParser_parseSpansInTableColumns_withScanner___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "skipWhitespace");
  if (objc_msgSend(*(id *)(a1 + 32), "nextCharacter") == 124)
    return 1;
  else
    return objc_msgSend(*(id *)(a1 + 32), "atEndOfLine");
}

uint64_t __53__MMSpanParser_parseSpansInBlockElement_withScanner___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "atEndOfString");
}

@end
