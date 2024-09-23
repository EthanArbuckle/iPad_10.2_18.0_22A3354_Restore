@implementation WFHTMLToMarkdown

- (WFHTMLToMarkdown)initWithBaseURL:(id)a3
{
  id v5;
  char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  char *v25;
  objc_super v27;

  v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)WFHTMLToMarkdown;
  v6 = -[WFHTMLToMarkdown init](&v27, sel_init);
  if (v6)
  {
    v7 = objc_opt_new();
    v8 = (void *)*((_QWORD *)v6 + 5);
    *((_QWORD *)v6 + 5) = v7;

    objc_msgSend(*((id *)v6 + 5), "setDelegate:", v6);
    objc_storeStrong((id *)v6 + 3, a3);
    *((_QWORD *)v6 + 4) = 0;
    *((_QWORD *)v6 + 1) = 0x101000000;
    v9 = (void *)*((_QWORD *)v6 + 23);
    *((_QWORD *)v6 + 23) = CFSTR("*");

    v10 = (void *)*((_QWORD *)v6 + 24);
    *((_QWORD *)v6 + 24) = CFSTR("_");

    v11 = (void *)*((_QWORD *)v6 + 25);
    *((_QWORD *)v6 + 25) = CFSTR("**");

    v12 = objc_opt_new();
    v13 = (void *)*((_QWORD *)v6 + 8);
    *((_QWORD *)v6 + 8) = v12;

    *((_QWORD *)v6 + 10) = 0;
    *((_QWORD *)v6 + 11) = 0;
    *((_QWORD *)v6 + 12) = 0;
    *((_WORD *)v6 + 8) = 1;
    v14 = objc_opt_new();
    v15 = (void *)*((_QWORD *)v6 + 13);
    *((_QWORD *)v6 + 13) = v14;

    v16 = objc_opt_new();
    v17 = (void *)*((_QWORD *)v6 + 14);
    *((_QWORD *)v6 + 14) = v16;

    v18 = (void *)*((_QWORD *)v6 + 15);
    *((_QWORD *)v6 + 15) = 0;

    *((_QWORD *)v6 + 16) = 0;
    v19 = objc_opt_new();
    v20 = (void *)*((_QWORD *)v6 + 17);
    *((_QWORD *)v6 + 17) = v19;

    v6[22] = 0;
    *(_DWORD *)(v6 + 18) = 0;
    *((_QWORD *)v6 + 18) = 0;
    *((_QWORD *)v6 + 19) = 0;
    v21 = (void *)*((_QWORD *)v6 + 20);
    *((_QWORD *)v6 + 20) = 0;

    v22 = (void *)*((_QWORD *)v6 + 21);
    *((_QWORD *)v6 + 21) = 0;

    v23 = objc_opt_new();
    v24 = (void *)*((_QWORD *)v6 + 22);
    *((_QWORD *)v6 + 22) = v23;

    v25 = v6;
  }

  return (WFHTMLToMarkdown *)v6;
}

- (void)addOutput:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[WFHTMLToMarkdown outTextList](self, "outTextList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  if (objc_msgSend(v5, "length"))
    -[WFHTMLToMarkdown setLastWasNewline:](self, "setLastWasNewline:", objc_msgSend(v5, "hasSuffix:", CFSTR("\n")));

}

- (id)handleHTML:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[WFHTMLToMarkdown parser](self, "parser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "feed:", v4);

  -[WFHTMLToMarkdown close](self, "close");
  -[WFHTMLToMarkdown outText](self, "outText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHTMLToMarkdown optwrap:](self, "optwrap:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)skipwrap:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("    ")) & 1) != 0
    || objc_msgSend(v3, "length") && objc_msgSend(v3, "characterAtIndex:", 0) == 9)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v3, "wf_stringByTrimmingLeadingWhitespaceAndNewlineCharacters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "hasPrefix:", CFSTR("--"))
      && (unint64_t)objc_msgSend(v5, "length") >= 3
      && objc_msgSend(v5, "characterAtIndex:", 2) != 45)
    {
      v4 = 0;
    }
    else if ((objc_msgSend(v5, "hasPrefix:", CFSTR("-")) & 1) != 0
           || (objc_msgSend(v5, "hasPrefix:", CFSTR("*")) & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("\\d+\\.\\s"), 0, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "numberOfMatchesInString:options:range:", v5, 4, 0, objc_msgSend(v5, "length")))
      {
        v4 = 1;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("[-\\*\\+]\\s"), 0, 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v7, "numberOfMatchesInString:options:range:", v5, 4, 0, objc_msgSend(v5, "length")) != 0;

      }
    }

  }
  return v4;
}

- (id)wrapText:(id)a3 toWidth:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1690], "whitespaceCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%c"), 160);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeCharactersInString:", v8);

  v22 = v7;
  v23 = v5;
  objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  if (v10 >= 1)
  {
    v11 = v10;
    v12 = 0;
    v13 = 0;
    do
    {
      objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "length");
      do
      {
        if (v13 + v15 + 1 > (unint64_t)a4)
          break;
        objc_msgSend(v9, "objectAtIndex:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v16, "length");

        objc_msgSend(v9, "objectAtIndex:", v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "appendString:", v17);

        if (++v12 < v11)
          objc_msgSend(v14, "appendString:", CFSTR(" "));
        v15 = objc_msgSend(v14, "length");
      }
      while (v12 < v11);
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "wf_stringByTrimmingTrailingCharactersInSet:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v19, "length"))
        objc_msgSend(v6, "addObject:", v19);

    }
    while (v12 < v11);
  }
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("\n"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (BOOL)onlywhite:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR(" ")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("  "));

  return v4;
}

- (id)optwrap:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!-[WFHTMLToMarkdown bodyWidth](self, "bodyWidth"))
  {
    v5 = v4;
    goto LABEL_22;
  }
  v5 = (id)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v16 = v4;
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("\n"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v7)
    goto LABEL_20;
  v8 = v7;
  v9 = 0;
  v10 = *(_QWORD *)v18;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v18 != v10)
        objc_enumerationMutation(v6);
      v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
      if (objc_msgSend(v12, "length"))
      {
        if (-[WFHTMLToMarkdown skipwrap:](self, "skipwrap:", v12))
        {
          if (-[WFHTMLToMarkdown onlywhite:](self, "onlywhite:", v12))
            continue;
          objc_msgSend(v12, "stringByAppendingString:", CFSTR("\n"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendString:", v13);

          goto LABEL_15;
        }
        -[WFHTMLToMarkdown wrapText:toWidth:](self, "wrapText:toWidth:", v12, -[WFHTMLToMarkdown bodyWidth](self, "bodyWidth"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendString:", v14);

        if (objc_msgSend(v12, "hasSuffix:", CFSTR("  ")))
        {
          objc_msgSend(v5, "appendString:", CFSTR("  \n"));
LABEL_15:
          v9 = 1;
          continue;
        }
        objc_msgSend(v5, "appendString:", CFSTR("\n\n"));
      }
      else if (v9 <= 1)
      {
        objc_msgSend(v5, "appendString:", CFSTR("\n"));
        ++v9;
        continue;
      }
      v9 = 2;
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  }
  while (v8);
LABEL_20:

  v4 = v16;
LABEL_22:

  return v5;
}

- (void)close
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  __CFString *v9;

  -[WFHTMLToMarkdown parser](self, "parser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "close");

  -[WFHTMLToMarkdown pbr](self, "pbr");
  -[WFHTMLToMarkdown output:pureData:force:](self, "output:pureData:force:", &stru_24C4E3948, 0, CFSTR("end"));
  -[WFHTMLToMarkdown outTextList](self, "outTextList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", &stru_24C4E3948);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHTMLToMarkdown setOutText:](self, "setOutText:", v5);

  if (-[WFHTMLToMarkdown unicodeSnob](self, "unicodeSnob"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%c"), -[WFHTMLToMarkdown nameToCodepoint:](self, "nameToCodepoint:", CFSTR("nbsp")));
    v6 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR(" ");
  }
  v9 = (__CFString *)v6;
  -[WFHTMLToMarkdown outText](self, "outText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("&nbsp_place_holder;"), v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHTMLToMarkdown setOutText:](self, "setOutText:", v8);

}

- (id)charref:(id)a3
{
  id v4;
  id v5;
  unsigned __int16 v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  if ((objc_msgSend(v4, "hasPrefix:", CFSTR("x")) & 1) != 0 || objc_msgSend(v4, "hasPrefix:", CFSTR("X")))
  {
    objc_msgSend(v4, "substringFromIndex:", 1);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = strtol((const char *)objc_msgSend(v5, "UTF8String"), 0, 16);

  }
  else
  {
    v6 = objc_msgSend(v4, "intValue");
  }
  if (-[WFHTMLToMarkdown unicodeSnob](self, "unicodeSnob"))
    goto LABEL_8;
  -[WFHTMLToMarkdown unifiableN](self, "unifiableN");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%c"), v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WFHTMLToMarkdown unifiableN](self, "unifiableN");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (id)entityref:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  unsigned int v8;
  void *v9;

  v4 = a3;
  -[WFHTMLToMarkdown unifiable](self, "unifiable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[WFHTMLToMarkdown unicodeSnob](self, "unicodeSnob") || !v6)
  {
    v8 = -[WFHTMLToMarkdown nameToCodepoint:](self, "nameToCodepoint:", v4);
    if (v8)
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%c"), v8);
    else
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("&%@;"), v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v6;
  }
  v9 = v7;

  return v9;
}

- (void)parser:(id)a3 foundCharacterRef:(id)a4
{
  id v5;

  -[WFHTMLToMarkdown charref:](self, "charref:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[WFHTMLToMarkdown output:pureData:force:](self, "output:pureData:force:", v5, 1, 0);

}

- (void)parser:(id)a3 foundEntityRef:(id)a4
{
  id v5;

  -[WFHTMLToMarkdown entityref:](self, "entityref:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[WFHTMLToMarkdown output:pureData:force:](self, "output:pureData:force:", v5, 1, 0);

}

- (void)parser:(id)a3 foundStartTag:(id)a4 attributes:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v15, "name", (_QWORD)v21);
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;
          objc_msgSend(v15, "value");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            objc_msgSend(v15, "value");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "name");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKey:", v19, v20);

          }
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

  -[WFHTMLToMarkdown handleTag:attributes:start:](self, "handleTag:attributes:start:", v7, v9, 1);
}

- (void)parser:(id)a3 foundEndTag:(id)a4
{
  -[WFHTMLToMarkdown handleTag:attributes:start:](self, "handleTag:attributes:start:", a4, 0, 0);
}

- (id)previousIndex:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  uint64_t v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("href"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    -[WFHTMLToMarkdown a](self, "a");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v30;
      v9 = -1;
      while (2)
      {
        v10 = 0;
        LODWORD(v27) = v9;
        HIDWORD(v27) = v9 + v7;
        do
        {
          if (*(_QWORD *)v30 != v8)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v10);
          objc_msgSend(v11, "objectForKey:", CFSTR("href"), v27);
          v12 = objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = (void *)v12;
            objc_msgSend(v11, "objectForKey:", CFSTR("href"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "objectForKey:", CFSTR("href"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v14, "isEqualToString:", v15);

            if (v16)
            {
              objc_msgSend(v11, "objectForKey:", CFSTR("title"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (v17)
              {

              }
              else
              {
                objc_msgSend(v4, "objectForKey:", CFSTR("title"));
                v18 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v18)
                  goto LABEL_20;
              }
              objc_msgSend(v11, "objectForKey:", CFSTR("title"));
              v19 = objc_claimAutoreleasedReturnValue();
              if (v19)
              {
                v20 = (void *)v19;
                objc_msgSend(v4, "objectForKey:", CFSTR("title"));
                v21 = objc_claimAutoreleasedReturnValue();
                if (v21)
                {
                  v22 = (void *)v21;
                  objc_msgSend(v11, "objectForKey:", CFSTR("title"));
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "objectForKey:", CFSTR("title"));
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v25 = objc_msgSend(v23, "isEqualToString:", v24);

                  if ((v25 & 1) != 0)
                  {
LABEL_20:
                    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (v27 + v10 + 1));
                    v5 = (void *)objc_claimAutoreleasedReturnValue();
                    goto LABEL_21;
                  }
                }
                else
                {

                }
              }
            }
          }
          ++v10;
        }
        while (v7 != v10);
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        v9 = HIDWORD(v27);
        if (v7)
          continue;
        break;
      }
    }
    v5 = 0;
LABEL_21:

  }
  return v5;
}

- (int)tagHeaderNumber:(id)a3
{
  id v3;
  int v4;
  int v5;

  v3 = a3;
  if (objc_msgSend(v3, "length") == 2 && objc_msgSend(v3, "characterAtIndex:", 0) == 104)
  {
    v4 = objc_msgSend(v3, "characterAtIndex:", 1);
    if ((v4 - 49) >= 9)
      v5 = 0;
    else
      v5 = v4 - 48;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)escapeMD:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1798];
  v4 = a3;
  objc_msgSend(v3, "regularExpressionWithPattern:options:error:", CFSTR("([\\\\\\[\\]\\(\\)])"), 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByReplacingMatchesInString:options:range:withTemplate:", v4, 0, 0, objc_msgSend(v4, "length"), CFSTR("\\\\$1"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)escapeMDSection:(id)a3 snob:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a4;
  v5 = (void *)MEMORY[0x24BDD1798];
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "regularExpressionWithPattern:options:error:", v8, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringByReplacingMatchesInString:options:range:withTemplate:", v7, 0, 0, objc_msgSend(v7, "length"), CFSTR("\\\\$1"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByReplacingMatchesInString:options:range:withTemplate:", v10, 0, 0, objc_msgSend(v10, "length"), CFSTR("\\\\$1"));
    v12 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v12;
  }
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("^(\\s*\\d+)(\\.)(?=\\s)"), 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("^(\\s*)(\\+)(?=\\s)"), 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("^(\\s*)(-)(?=\\s|\\-)"), 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByReplacingMatchesInString:options:range:withTemplate:", v10, 0, 0, objc_msgSend(v10, "length"), CFSTR("$1\\\\$2"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "stringByReplacingMatchesInString:options:range:withTemplate:", v16, 0, 0, objc_msgSend(v16, "length"), CFSTR("$1\\\\$2"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "stringByReplacingMatchesInString:options:range:withTemplate:", v17, 0, 0, objc_msgSend(v17, "length"), CFSTR("$1\\\\$2"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)handleTag:(id)a3 attributes:(id)a4 start:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  int v14;
  void *v15;
  int64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  __CFString *v46;
  __CFString *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  BOOL v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  WFHTMLToMarkdown *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  unint64_t v95;
  void *v96;
  unint64_t v97;
  void *v98;
  char v99;
  void *v100;
  uint64_t v101;
  void *v102;
  int v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  id v109;
  _QWORD v110[2];
  _QWORD v111[3];

  v5 = a5;
  v111[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    v12 = (id)objc_opt_new();

  }
  v13 = -[WFHTMLToMarkdown tagHeaderNumber:](self, "tagHeaderNumber:", v8);
  if (v13)
  {
    v14 = v13;
    -[WFHTMLToMarkdown p](self, "p");
    if (!v5)
      goto LABEL_151;
    v15 = (void *)objc_opt_new();
    if (v14 >= 1)
    {
      do
      {
        objc_msgSend(v15, "appendString:", CFSTR("#"));
        --v14;
      }
      while (v14);
    }
    objc_msgSend(v15, "appendString:", CFSTR(" "));
    -[WFHTMLToMarkdown output:](self, "output:", v15);

  }
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("p")) & 1) != 0
    || objc_msgSend(v8, "isEqualToString:", CFSTR("div")))
  {
    -[WFHTMLToMarkdown p](self, "p");
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("br")) && v5)
    -[WFHTMLToMarkdown output:](self, "output:", CFSTR("  \n"));
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("hr")) && v5)
  {
    -[WFHTMLToMarkdown p](self, "p");
    -[WFHTMLToMarkdown output:](self, "output:", CFSTR("* * *"));
    -[WFHTMLToMarkdown p](self, "p");
  }
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("head")) & 1) != 0
    || (objc_msgSend(v8, "isEqualToString:", CFSTR("style")) & 1) != 0
    || objc_msgSend(v8, "isEqualToString:", CFSTR("script")))
  {
    v16 = -[WFHTMLToMarkdown quiet](self, "quiet");
    if (v5)
    {
      -[WFHTMLToMarkdown setQuiet:](self, "setQuiet:", v16 + 1);
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("style")) & 1) == 0)
        goto LABEL_27;
      goto LABEL_23;
    }
    -[WFHTMLToMarkdown setQuiet:](self, "setQuiet:", v16 - 1);
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("style")) & 1) == 0)
      goto LABEL_27;
    goto LABEL_25;
  }
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("style")) & 1) != 0)
  {
    if (v5)
    {
LABEL_23:
      v17 = 1;
LABEL_26:
      -[WFHTMLToMarkdown setStyle:](self, "setStyle:", -[WFHTMLToMarkdown style](self, "style") + v17);
      goto LABEL_27;
    }
LABEL_25:
    v17 = -1;
    goto LABEL_26;
  }
LABEL_27:
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("body")))
    -[WFHTMLToMarkdown setQuiet:](self, "setQuiet:", 0);
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("blockquote")))
  {
    if (v5)
    {
      -[WFHTMLToMarkdown p](self, "p");
      -[WFHTMLToMarkdown output:pureData:force:](self, "output:pureData:force:", CFSTR("> "), 0, CFSTR("1"));
      -[WFHTMLToMarkdown setStart:](self, "setStart:", 1);
      -[WFHTMLToMarkdown setBlockquote:](self, "setBlockquote:", -[WFHTMLToMarkdown blockquote](self, "blockquote") + 1);
    }
    else
    {
      -[WFHTMLToMarkdown setBlockquote:](self, "setBlockquote:", -[WFHTMLToMarkdown blockquote](self, "blockquote") - 1);
      -[WFHTMLToMarkdown p](self, "p");
    }
  }
  if (((objc_msgSend(v8, "isEqualToString:", CFSTR("em")) & 1) != 0
     || (objc_msgSend(v8, "isEqualToString:", CFSTR("i")) & 1) != 0
     || objc_msgSend(v8, "isEqualToString:", CFSTR("u")))
    && !-[WFHTMLToMarkdown ignoreEmphasis](self, "ignoreEmphasis"))
  {
    -[WFHTMLToMarkdown emphasisMark](self, "emphasisMark");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHTMLToMarkdown output:](self, "output:", v18);

  }
  if (((objc_msgSend(v8, "isEqualToString:", CFSTR("strong")) & 1) != 0
     || objc_msgSend(v8, "isEqualToString:", CFSTR("b")))
    && !-[WFHTMLToMarkdown ignoreEmphasis](self, "ignoreEmphasis"))
  {
    -[WFHTMLToMarkdown strongMark](self, "strongMark");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHTMLToMarkdown output:](self, "output:", v19);

  }
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("del")) & 1) != 0
    || (objc_msgSend(v8, "isEqualToString:", CFSTR("strike")) & 1) != 0
    || objc_msgSend(v8, "isEqualToString:", CFSTR("s")))
  {
    if (v5)
      v20 = CFSTR("<%@>");
    else
      v20 = CFSTR("</%@>");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v20, v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHTMLToMarkdown output:](self, "output:", v21);

  }
  if (((objc_msgSend(v8, "isEqualToString:", CFSTR("code")) & 1) != 0
     || objc_msgSend(v8, "isEqualToString:", CFSTR("tt")))
    && !-[WFHTMLToMarkdown pre](self, "pre"))
  {
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("abbr")))
  {
    if (v5)
    {
      -[WFHTMLToMarkdown setAbbreviationData:](self, "setAbbreviationData:", &stru_24C4E3948);
      objc_msgSend(v12, "objectForKey:", CFSTR("title"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFHTMLToMarkdown setAbbreviationTitle:](self, "setAbbreviationTitle:", v22);

    }
    else
    {
      -[WFHTMLToMarkdown abbreviationTitle](self, "abbreviationTitle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        v24 = (void *)objc_opt_new();
        -[WFHTMLToMarkdown abbreviationData](self, "abbreviationData");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setAbbreviation:", v25);

        -[WFHTMLToMarkdown abbreviationTitle](self, "abbreviationTitle");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setTitle:", v26);

        -[WFHTMLToMarkdown abbreviationList](self, "abbreviationList");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "addObject:", v24);

        -[WFHTMLToMarkdown setAbbreviationTitle:](self, "setAbbreviationTitle:", 0);
      }
      -[WFHTMLToMarkdown setAbbreviationData:](self, "setAbbreviationData:", &stru_24C4E3948);
    }
  }
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("a"))
    || -[WFHTMLToMarkdown ignoreLinks](self, "ignoreLinks"))
  {
    goto LABEL_75;
  }
  if (v5)
  {
    objc_msgSend(v12, "objectForKey:", CFSTR("href"));
    v28 = objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v29 = (void *)v28;
      if (-[WFHTMLToMarkdown skipInternalLinks](self, "skipInternalLinks"))
      {
        objc_msgSend(v12, "objectForKey:", CFSTR("href"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "hasPrefix:", CFSTR("#"));

        if ((v31 & 1) != 0)
          goto LABEL_65;
      }
      else
      {

      }
      -[WFHTMLToMarkdown aStack](self, "aStack");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (void *)objc_msgSend(v12, "mutableCopy");
      objc_msgSend(v40, "addObject:", v41);

      objc_msgSend(v12, "objectForKey:", CFSTR("href"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFHTMLToMarkdown setMaybeAutomaticLink:](self, "setMaybeAutomaticLink:", v32);
      goto LABEL_74;
    }
LABEL_65:
    -[WFHTMLToMarkdown aStack](self, "aStack");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObject:", v33);

LABEL_74:
LABEL_75:
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("img")))
    {
      if (v5 && !-[WFHTMLToMarkdown ignoreImages](self, "ignoreImages"))
      {
        objc_msgSend(v12, "objectForKey:", CFSTR("src"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (v42)
        {
          objc_msgSend(v12, "objectForKey:", CFSTR("src"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKey:", v43, CFSTR("href"));

          objc_msgSend(v12, "objectForKey:", CFSTR("alt"));
          v44 = objc_claimAutoreleasedReturnValue();
          v45 = (void *)v44;
          v46 = &stru_24C4E3948;
          if (v44)
            v46 = (__CFString *)v44;
          v47 = v46;

          v48 = (void *)MEMORY[0x24BDD17C8];
          -[WFHTMLToMarkdown escapeMD:](self, "escapeMD:", v47);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "stringWithFormat:", CFSTR("![%@]"), v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFHTMLToMarkdown output:](self, "output:", v50);

          v51 = v9;
          if (-[WFHTMLToMarkdown inlineLinks](self, "inlineLinks"))
          {
            v52 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v12, "objectForKey:", CFSTR("href"));
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFHTMLToMarkdown escapeMD:](self, "escapeMD:", v53);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "stringWithFormat:", CFSTR("(%@)"), v54);
          }
          else
          {
            -[WFHTMLToMarkdown previousIndex:](self, "previousIndex:", v12);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            if (v53)
            {
              -[WFHTMLToMarkdown a](self, "a");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "objectAtIndex:", objc_msgSend(v53, "unsignedIntegerValue"));
              v56 = objc_claimAutoreleasedReturnValue();

              v12 = (id)v56;
            }
            else
            {
              -[WFHTMLToMarkdown setACount:](self, "setACount:", -[WFHTMLToMarkdown aCount](self, "aCount") + 1);
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[WFHTMLToMarkdown aCount](self, "aCount"));
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setObject:forKey:", v62, CFSTR("count"));

              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[WFHTMLToMarkdown outCount](self, "outCount"));
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setObject:forKey:", v63, CFSTR("outcount"));

              -[WFHTMLToMarkdown a](self, "a");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "addObject:", v12);
            }

            v64 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v12, "objectForKey:", CFSTR("count"));
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "stringWithFormat:", CFSTR("[%@]"), v54);
          }
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFHTMLToMarkdown output:](self, "output:", v65);

          v9 = v51;
        }
      }
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("dl")) && v5)
      -[WFHTMLToMarkdown p](self, "p");
    goto LABEL_100;
  }
  -[WFHTMLToMarkdown aStack](self, "aStack");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "count");

  if (v35)
  {
    -[WFHTMLToMarkdown aStack](self, "aStack");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "lastObject");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFHTMLToMarkdown aStack](self, "aStack");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "removeLastObject");

    -[WFHTMLToMarkdown maybeAutomaticLink](self, "maybeAutomaticLink");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      -[WFHTMLToMarkdown setMaybeAutomaticLink:](self, "setMaybeAutomaticLink:", 0);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (-[WFHTMLToMarkdown inlineLinks](self, "inlineLinks"))
        {
          v57 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v37, "objectForKey:", CFSTR("href"));
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFHTMLToMarkdown escapeMD:](self, "escapeMD:", v58);
          v59 = v9;
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "stringWithFormat:", CFSTR("](%@)"), v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFHTMLToMarkdown output:](self, "output:", v61);

          v9 = v59;
        }
        else
        {
          v66 = v9;
          -[WFHTMLToMarkdown previousIndex:](self, "previousIndex:", v37);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          if (v67)
          {
            -[WFHTMLToMarkdown a](self, "a");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "objectAtIndex:", objc_msgSend(v67, "unsignedIntegerValue"));
            v69 = objc_claimAutoreleasedReturnValue();

            v37 = (void *)v69;
          }
          else
          {
            -[WFHTMLToMarkdown setACount:](self, "setACount:", -[WFHTMLToMarkdown aCount](self, "aCount") + 1);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[WFHTMLToMarkdown aCount](self, "aCount"));
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "setObject:forKey:", v70, CFSTR("count"));

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[WFHTMLToMarkdown outCount](self, "outCount"));
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "setObject:forKey:", v71, CFSTR("outcount"));

            -[WFHTMLToMarkdown a](self, "a");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "addObject:", v37);
          }

          v72 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v37, "objectForKey:", CFSTR("count"));
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "stringWithFormat:", CFSTR("][%@]"), v73);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFHTMLToMarkdown output:](self, "output:", v74);

          v9 = v66;
        }
      }
    }

  }
  objc_msgSend(v8, "isEqualToString:", CFSTR("img"));
  objc_msgSend(v8, "isEqualToString:", CFSTR("dl"));
LABEL_100:
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("dt")) && !v5)
    -[WFHTMLToMarkdown pbr](self, "pbr");
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("dd")) && v5)
    -[WFHTMLToMarkdown output:](self, "output:", CFSTR("    "));
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("dd")) && !v5)
    -[WFHTMLToMarkdown pbr](self, "pbr");
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ol")) & 1) != 0
    || objc_msgSend(v8, "isEqualToString:", CFSTR("ul")))
  {
    -[WFHTMLToMarkdown list](self, "list");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v75, "count"))
    {

    }
    else
    {
      v76 = -[WFHTMLToMarkdown lastWasList](self, "lastWasList");

      if (!v76)
        -[WFHTMLToMarkdown p](self, "p");
    }
    if (v5)
    {
      objc_msgSend(v12, "objectForKey:", CFSTR("start"));
      v77 = objc_claimAutoreleasedReturnValue();

      if (v77)
      {
        objc_msgSend(v12, "objectForKey:", CFSTR("start"));
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = objc_msgSend(v78, "intValue") - 1;

      }
      v110[0] = CFSTR("name");
      v110[1] = CFSTR("num");
      v111[0] = v8;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v77);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v111[1] = v79;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v111, v110, 2);
      v80 = (void *)objc_claimAutoreleasedReturnValue();

      -[WFHTMLToMarkdown list](self, "list");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = (void *)objc_msgSend(v80, "mutableCopy");
      objc_msgSend(v81, "addObject:", v82);

    }
    else
    {
      -[WFHTMLToMarkdown list](self, "list");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = objc_msgSend(v83, "count");

      if (v84)
      {
        -[WFHTMLToMarkdown list](self, "list");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "removeLastObject");

      }
    }
    v86 = self;
    v87 = 1;
  }
  else
  {
    v86 = self;
    v87 = 0;
  }
  -[WFHTMLToMarkdown setLastWasList:](v86, "setLastWasList:", v87);
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("li")))
  {
    -[WFHTMLToMarkdown pbr](self, "pbr");
    if (!v5)
    {
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("table")) & 1) == 0)
        objc_msgSend(v8, "isEqualToString:", CFSTR("tr"));
      goto LABEL_145;
    }
    -[WFHTMLToMarkdown list](self, "list");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = objc_msgSend(v88, "count");

    v109 = v9;
    if (v89)
    {
      -[WFHTMLToMarkdown list](self, "list");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "lastObject");
      v91 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v91 = (void *)+[؋ mutableCopy](&unk_24C5125D8, "mutableCopy");
    }
    v92 = (void *)objc_opt_new();
    -[WFHTMLToMarkdown list](self, "list");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = objc_msgSend(v93, "count");

    if (v94)
    {
      v95 = 0;
      do
      {
        objc_msgSend(v92, "appendString:", CFSTR("  "));
        ++v95;
        -[WFHTMLToMarkdown list](self, "list");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v97 = objc_msgSend(v96, "count");

      }
      while (v97 > v95);
    }
    -[WFHTMLToMarkdown output:](self, "output:", v92);
    objc_msgSend(v91, "objectForKey:", CFSTR("name"));
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = objc_msgSend(v98, "isEqualToString:", CFSTR("ul"));

    if ((v99 & 1) != 0)
    {
      -[WFHTMLToMarkdown ulItemMark](self, "ulItemMark");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "stringByAppendingString:", CFSTR(" "));
      v101 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v91, "objectForKey:", CFSTR("name"));
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = objc_msgSend(v102, "isEqualToString:", CFSTR("ol"));

      if (!v103)
      {
LABEL_138:
        -[WFHTMLToMarkdown setStart:](self, "setStart:", 1);

        v9 = v109;
        goto LABEL_139;
      }
      v104 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v91, "objectForKey:", CFSTR("num"));
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "numberWithInt:", objc_msgSend(v105, "intValue") + 1);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "setObject:forKey:", v106, CFSTR("num"));

      v107 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v91, "objectForKey:", CFSTR("num"));
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "stringWithFormat:", CFSTR("%@. "), v100);
      v101 = objc_claimAutoreleasedReturnValue();
    }
    v108 = (void *)v101;
    -[WFHTMLToMarkdown output:](self, "output:", v101);

    goto LABEL_138;
  }
LABEL_139:
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("table")) & 1) != 0)
  {
    if (!v5)
      goto LABEL_145;
  }
  else if (!objc_msgSend(v8, "isEqualToString:", CFSTR("tr")) || !v5)
  {
    goto LABEL_145;
  }
  -[WFHTMLToMarkdown p](self, "p");
LABEL_145:
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("td")))
    -[WFHTMLToMarkdown pbr](self, "pbr");
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("pre")))
  {
    if (v5)
      -[WFHTMLToMarkdown setStartpre:](self, "setStartpre:", 1);
    -[WFHTMLToMarkdown setPre:](self, "setPre:", 1);
    -[WFHTMLToMarkdown p](self, "p");
  }
LABEL_151:

}

- (void)pbr
{
  if (!-[WFHTMLToMarkdown p_p](self, "p_p"))
    -[WFHTMLToMarkdown setP_p:](self, "setP_p:", 1);
}

- (void)p
{
  -[WFHTMLToMarkdown setP_p:](self, "setP_p:", 2);
}

- (void)output:(id)a3
{
  -[WFHTMLToMarkdown output:pureData:force:](self, "output:pureData:force:", a3, 0, 0);
}

- (void)output:(id)a3 pureData:(BOOL)a4 force:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSString *abbreviationData;
  NSString *v11;
  NSString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  void *v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  int v39;
  WFHTMLToMarkdown *v40;
  uint64_t v41;
  uint64_t v42;
  const __CFString *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  const __CFString *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  char v63;
  void *v64;
  int v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  uint64_t i;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  id v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  id obj;
  WFHTMLToMarkdown *v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  uint64_t v94;

  v6 = a4;
  v94 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  abbreviationData = self->_abbreviationData;
  if (abbreviationData)
  {
    -[NSString stringByAppendingString:](abbreviationData, "stringByAppendingString:", v8);
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    v12 = self->_abbreviationData;
    self->_abbreviationData = v11;

  }
  if (!-[WFHTMLToMarkdown quiet](self, "quiet"))
  {
    v83 = self;
    if (v6 && !-[WFHTMLToMarkdown pre](self, "pre"))
    {
      objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("[ \t\n\r\f\v]+"), 0, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringByReplacingMatchesInString:options:range:withTemplate:", v8, 0, 0, objc_msgSend(v8, "length"), CFSTR(" "));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v14, "length") && objc_msgSend(v14, "characterAtIndex:", 0) == 32)
      {
        -[WFHTMLToMarkdown setSpace:](self, "setSpace:", 1);
        objc_msgSend(v14, "substringFromIndex:", 1);
        v8 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v8 = v14;
      }
    }
    v15 = objc_msgSend(v8, "length");
    if (v9 || v15)
    {
      if (-[WFHTMLToMarkdown startpre](self, "startpre") && (objc_msgSend(v8, "hasPrefix:", CFSTR("\n")) & 1) == 0)
      {
        objc_msgSend(CFSTR("\n"), "stringByAppendingString:", v8);
        v16 = objc_claimAutoreleasedReturnValue();

        v8 = (id)v16;
      }
      v17 = (void *)objc_opt_new();
      if (-[WFHTMLToMarkdown blockquote](self, "blockquote") >= 1)
      {
        v18 = 0;
        do
        {
          objc_msgSend(v17, "appendString:", CFSTR(">"));
          ++v18;
        }
        while (-[WFHTMLToMarkdown blockquote](v83, "blockquote") > v18);
      }
      if ((!v9 || !objc_msgSend(v8, "length") || objc_msgSend(v8, "characterAtIndex:", 0) != 62)
        && -[WFHTMLToMarkdown blockquote](v83, "blockquote"))
      {
        objc_msgSend(v17, "appendString:", CFSTR(" "));
      }
      v78 = v17;
      if (-[WFHTMLToMarkdown pre](v83, "pre"))
      {
        -[WFHTMLToMarkdown list](v83, "list");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "count");

        if (v20)
        {
          -[WFHTMLToMarkdown list](v83, "list");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "count");

          v23 = v17;
          if (v22)
          {
            v24 = 0;
            do
            {
              objc_msgSend(v78, "appendString:", CFSTR("    "));
              ++v24;
              -[WFHTMLToMarkdown list](v83, "list");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v25, "count");

            }
            while (v26 > v24);
          }
        }
        else
        {
          v23 = v17;
          objc_msgSend(v17, "appendString:", CFSTR("    "));
        }
        objc_msgSend(CFSTR("\n"), "stringByAppendingString:", v23);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), v27);
        v28 = objc_claimAutoreleasedReturnValue();

        v8 = (id)v28;
      }
      if (-[WFHTMLToMarkdown startpre](v83, "startpre"))
      {
        -[WFHTMLToMarkdown setStartpre:](v83, "setStartpre:", 0);
        -[WFHTMLToMarkdown list](v83, "list");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "count");

        if (v30)
        {
          objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("\n"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "wf_stringByTrimmingLeadingCharactersInSet:", v31);
          v32 = objc_claimAutoreleasedReturnValue();

          v8 = (id)v32;
        }
      }
      if (-[WFHTMLToMarkdown start](v83, "start"))
      {
        -[WFHTMLToMarkdown setSpace:](v83, "setSpace:", 0);
        -[WFHTMLToMarkdown setP_p:](v83, "setP_p:", 0);
        -[WFHTMLToMarkdown setStart:](v83, "setStart:", 0);
      }
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("end")))
      {
        -[WFHTMLToMarkdown setP_p:](v83, "setP_p:", 0);
        -[WFHTMLToMarkdown addOutput:](v83, "addOutput:", CFSTR("\n"));
        -[WFHTMLToMarkdown setSpace:](v83, "setSpace:", 0);
      }
      if (-[WFHTMLToMarkdown p_p](v83, "p_p"))
      {
        v33 = (void *)objc_opt_new();
        if (-[WFHTMLToMarkdown p_p](v83, "p_p") >= 1)
        {
          v34 = 0;
          do
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\n%@"), v78);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "appendString:", v35);

            ++v34;
          }
          while (-[WFHTMLToMarkdown p_p](v83, "p_p") > v34);
        }
        -[WFHTMLToMarkdown addOutput:](v83, "addOutput:", v33);
        -[WFHTMLToMarkdown setSpace:](v83, "setSpace:", 0);

      }
      if (-[WFHTMLToMarkdown space](v83, "space"))
      {
        if (!-[WFHTMLToMarkdown lastWasNewline](v83, "lastWasNewline"))
          -[WFHTMLToMarkdown addOutput:](v83, "addOutput:", CFSTR(" "));
        -[WFHTMLToMarkdown setSpace:](v83, "setSpace:", 0);
      }
      -[WFHTMLToMarkdown a](v83, "a");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v36, "count"))
      {
        if (-[WFHTMLToMarkdown p_p](v83, "p_p") == 2
          && -[WFHTMLToMarkdown linksEachParagraph](v83, "linksEachParagraph"))
        {

        }
        else
        {
          v37 = objc_msgSend(v9, "isEqualToString:", CFSTR("end"));

          v38 = v78;
          if ((v37 & 1) == 0)
            goto LABEL_71;
        }
        v76 = v9;
        v77 = v8;
        v39 = objc_msgSend(v9, "isEqualToString:", CFSTR("end"));
        v40 = v83;
        if (v39)
          -[WFHTMLToMarkdown addOutput:](v83, "addOutput:", CFSTR("\n"));
        v80 = (void *)objc_opt_new();
        v88 = 0u;
        v89 = 0u;
        v90 = 0u;
        v91 = 0u;
        -[WFHTMLToMarkdown a](v83, "a");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v93, 16);
        if (v41)
        {
          v42 = v41;
          v43 = CFSTR("outcount");
          v44 = *(_QWORD *)v89;
          v79 = *(_QWORD *)v89;
          do
          {
            v45 = 0;
            v81 = v42;
            do
            {
              if (*(_QWORD *)v89 != v44)
                objc_enumerationMutation(obj);
              v46 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * v45);
              v47 = -[WFHTMLToMarkdown outCount](v40, "outCount");
              objc_msgSend(v46, "objectForKey:", v43);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = objc_msgSend(v48, "integerValue");

              if (v47 <= v49)
              {
                objc_msgSend(v80, "addObject:", v46);
              }
              else
              {
                v50 = v43;
                v51 = (void *)MEMORY[0x24BDD17C8];
                objc_msgSend(v46, "objectForKey:", CFSTR("count"));
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                v53 = (void *)MEMORY[0x24BDBCF48];
                objc_msgSend(v46, "objectForKey:", CFSTR("href"));
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                -[WFHTMLToMarkdown baseURL](v40, "baseURL");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "URLWithString:relativeToURL:", v54, v55);
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "stringWithFormat:", CFSTR("   [%@]: %@"), v52, v56);
                v57 = (void *)objc_claimAutoreleasedReturnValue();

                v40 = v83;
                -[WFHTMLToMarkdown addOutput:](v83, "addOutput:", v57);
                objc_msgSend(v46, "objectForKey:", CFSTR("title"));
                v58 = (void *)objc_claimAutoreleasedReturnValue();

                if (v58)
                {
                  v59 = (void *)MEMORY[0x24BDD17C8];
                  objc_msgSend(v46, "objectForKey:", CFSTR("title"));
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v59, "stringWithFormat:", CFSTR(" (\"%@\")"), v60);
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  -[WFHTMLToMarkdown addOutput:](v83, "addOutput:", v61);

                }
                -[WFHTMLToMarkdown addOutput:](v83, "addOutput:", CFSTR("\n"));

                v43 = v50;
                v44 = v79;
                v42 = v81;
              }
              ++v45;
            }
            while (v42 != v45);
            v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v93, 16);
          }
          while (v42);
        }

        -[WFHTMLToMarkdown a](v40, "a");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend(v62, "isEqualToArray:", v80);

        v8 = v77;
        if ((v63 & 1) == 0)
          -[WFHTMLToMarkdown addOutput:](v40, "addOutput:", CFSTR(" "));
        -[WFHTMLToMarkdown setA:](v40, "setA:", v80);

        v9 = v76;
      }
      else
      {

      }
      v38 = v78;
LABEL_71:
      -[WFHTMLToMarkdown abbreviationList](v83, "abbreviationList");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v64, "count"))
      {
        v65 = objc_msgSend(v9, "isEqualToString:", CFSTR("end"));

        if (!v65)
        {
LABEL_82:
          -[WFHTMLToMarkdown setP_p:](v83, "setP_p:", 0);
          -[WFHTMLToMarkdown addOutput:](v83, "addOutput:", v8);
          -[WFHTMLToMarkdown setOutCount:](v83, "setOutCount:", -[WFHTMLToMarkdown outCount](v83, "outCount") + 1);

          goto LABEL_83;
        }
        v86 = 0u;
        v87 = 0u;
        v84 = 0u;
        v85 = 0u;
        -[WFHTMLToMarkdown abbreviationList](v83, "abbreviationList");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v84, v92, 16);
        if (v66)
        {
          v67 = v66;
          v68 = v9;
          v69 = *(_QWORD *)v85;
          do
          {
            for (i = 0; i != v67; ++i)
            {
              if (*(_QWORD *)v85 != v69)
                objc_enumerationMutation(v64);
              v71 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
              v72 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v71, "abbreviation");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v71, "title");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "stringWithFormat:", CFSTR("  *[%@]: %@\n"), v73, v74);
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              -[WFHTMLToMarkdown addOutput:](v83, "addOutput:", v75);

            }
            v67 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v84, v92, 16);
          }
          while (v67);
          v9 = v68;
          v38 = v78;
        }
      }

      goto LABEL_82;
    }
  }
LABEL_83:

}

- (void)parser:(id)a3 foundData:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;

  v10 = a4;
  if (objc_msgSend(v10, "containsString:", CFSTR("/script>")))
    -[WFHTMLToMarkdown setQuiet:](self, "setQuiet:", -[WFHTMLToMarkdown quiet](self, "quiet") - 1);
  -[WFHTMLToMarkdown maybeAutomaticLink](self, "maybeAutomaticLink");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFHTMLToMarkdown maybeAutomaticLink](self, "maybeAutomaticLink");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v10)
      && +[WFURLDetector stringMatchesExactly:](WFURLDetector, "stringMatchesExactly:", v6))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@>"), v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFHTMLToMarkdown output:](self, "output:", v7);

      goto LABEL_13;
    }
    -[WFHTMLToMarkdown output:](self, "output:", CFSTR("["));
    -[WFHTMLToMarkdown setMaybeAutomaticLink:](self, "setMaybeAutomaticLink:", 0);

  }
  if (-[WFHTMLToMarkdown code](self, "code") || -[WFHTMLToMarkdown pre](self, "pre"))
  {
    v8 = v10;
  }
  else
  {
    -[WFHTMLToMarkdown escapeMDSection:snob:](self, "escapeMDSection:snob:", v10, -[WFHTMLToMarkdown escapeSnob](self, "escapeSnob"));
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v9;
  }
  v10 = v8;
  -[WFHTMLToMarkdown output:pureData:force:](self, "output:pureData:force:", v8, 1, 0);
LABEL_13:

}

- (NSDictionary)nameToCodepointMapping
{
  NSDictionary *nameToCodepointMapping;

  nameToCodepointMapping = self->_nameToCodepointMapping;
  if (!nameToCodepointMapping)
  {
    self->_nameToCodepointMapping = (NSDictionary *)&unk_24C512600;
    nameToCodepointMapping = (NSDictionary *)&unk_24C512600;
  }
  return nameToCodepointMapping;
}

- (unsigned)nameToCodepoint:(id)a3
{
  id v4;
  unsigned __int16 v5;
  void *v6;
  void *v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("apos")) & 1) != 0)
  {
    v5 = 39;
  }
  else
  {
    -[WFHTMLToMarkdown nameToCodepointMapping](self, "nameToCodepointMapping");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "unsignedShortValue");

  }
  return v5;
}

- (id)unifiable
{
  return &unk_24C512628;
}

- (NSDictionary)unifiableN
{
  NSDictionary *unifiableN;
  void *v4;
  void *v5;
  NSDictionary *v6;
  void *v7;
  NSDictionary *v8;
  NSDictionary *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, void *);
  void *v14;
  NSDictionary *v15;
  WFHTMLToMarkdown *v16;

  unifiableN = self->_unifiableN;
  if (!unifiableN)
  {
    v4 = (void *)objc_opt_new();
    -[WFHTMLToMarkdown unifiable](self, "unifiable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __30__WFHTMLToMarkdown_unifiableN__block_invoke;
    v14 = &unk_24C4E2918;
    v6 = v4;
    v15 = v6;
    v16 = self;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v11);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", -[WFHTMLToMarkdown nameToCodepoint:](self, "nameToCodepoint:", CFSTR("nbsp"), v11, v12, v13, v14));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary removeObjectForKey:](v6, "removeObjectForKey:", v7);

    v8 = self->_unifiableN;
    self->_unifiableN = v6;
    v9 = v6;

    unifiableN = self->_unifiableN;
  }
  return unifiableN;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_baseURL, a3);
}

- (BOOL)unicodeSnob
{
  return self->_unicodeSnob;
}

- (void)setUnicodeSnob:(BOOL)a3
{
  self->_unicodeSnob = a3;
}

- (BOOL)escapeSnob
{
  return self->_escapeSnob;
}

- (void)setEscapeSnob:(BOOL)a3
{
  self->_escapeSnob = a3;
}

- (BOOL)linksEachParagraph
{
  return self->_linksEachParagraph;
}

- (void)setLinksEachParagraph:(BOOL)a3
{
  self->_linksEachParagraph = a3;
}

- (int64_t)bodyWidth
{
  return self->_bodyWidth;
}

- (void)setBodyWidth:(int64_t)a3
{
  self->_bodyWidth = a3;
}

- (BOOL)skipInternalLinks
{
  return self->_skipInternalLinks;
}

- (void)setSkipInternalLinks:(BOOL)a3
{
  self->_skipInternalLinks = a3;
}

- (BOOL)inlineLinks
{
  return self->_inlineLinks;
}

- (void)setInlineLinks:(BOOL)a3
{
  self->_inlineLinks = a3;
}

- (BOOL)ignoreLinks
{
  return self->_ignoreLinks;
}

- (void)setIgnoreLinks:(BOOL)a3
{
  self->_ignoreLinks = a3;
}

- (BOOL)ignoreImages
{
  return self->_ignoreImages;
}

- (void)setIgnoreImages:(BOOL)a3
{
  self->_ignoreImages = a3;
}

- (BOOL)ignoreEmphasis
{
  return self->_ignoreEmphasis;
}

- (void)setIgnoreEmphasis:(BOOL)a3
{
  self->_ignoreEmphasis = a3;
}

- (WFPythonHTMLParser)parser
{
  return self->_parser;
}

- (void)setParser:(id)a3
{
  objc_storeStrong((id *)&self->_parser, a3);
}

- (void)setNameToCodepointMapping:(id)a3
{
  objc_storeStrong((id *)&self->_nameToCodepointMapping, a3);
}

- (void)setUnifiableN:(id)a3
{
  objc_storeStrong((id *)&self->_unifiableN, a3);
}

- (NSMutableArray)outTextList
{
  return self->_outTextList;
}

- (void)setOutTextList:(id)a3
{
  objc_storeStrong((id *)&self->_outTextList, a3);
}

- (NSString)outText
{
  return self->_outText;
}

- (void)setOutText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (int64_t)quiet
{
  return self->_quiet;
}

- (void)setQuiet:(int64_t)a3
{
  self->_quiet = a3;
}

- (int64_t)p_p
{
  return self->_p_p;
}

- (void)setP_p:(int64_t)a3
{
  self->_p_p = a3;
}

- (int64_t)outCount
{
  return self->_outCount;
}

- (void)setOutCount:(int64_t)a3
{
  self->_outCount = a3;
}

- (BOOL)start
{
  return self->_start;
}

- (void)setStart:(BOOL)a3
{
  self->_start = a3;
}

- (BOOL)space
{
  return self->_space;
}

- (void)setSpace:(BOOL)a3
{
  self->_space = a3;
}

- (NSMutableArray)a
{
  return self->_a;
}

- (void)setA:(id)a3
{
  objc_storeStrong((id *)&self->_a, a3);
}

- (NSMutableArray)aStack
{
  return self->_aStack;
}

- (void)setAStack:(id)a3
{
  objc_storeStrong((id *)&self->_aStack, a3);
}

- (NSString)maybeAutomaticLink
{
  return self->_maybeAutomaticLink;
}

- (void)setMaybeAutomaticLink:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (int64_t)aCount
{
  return self->_aCount;
}

- (void)setACount:(int64_t)a3
{
  self->_aCount = a3;
}

- (NSMutableArray)list
{
  return self->_list;
}

- (void)setList:(id)a3
{
  objc_storeStrong((id *)&self->_list, a3);
}

- (int64_t)blockquote
{
  return self->_blockquote;
}

- (void)setBlockquote:(int64_t)a3
{
  self->_blockquote = a3;
}

- (BOOL)pre
{
  return self->_pre;
}

- (void)setPre:(BOOL)a3
{
  self->_pre = a3;
}

- (BOOL)startpre
{
  return self->_startpre;
}

- (void)setStartpre:(BOOL)a3
{
  self->_startpre = a3;
}

- (BOOL)code
{
  return self->_code;
}

- (void)setCode:(BOOL)a3
{
  self->_code = a3;
}

- (BOOL)lastWasNewline
{
  return self->_lastWasNewline;
}

- (void)setLastWasNewline:(BOOL)a3
{
  self->_lastWasNewline = a3;
}

- (BOOL)lastWasList
{
  return self->_lastWasList;
}

- (void)setLastWasList:(BOOL)a3
{
  self->_lastWasList = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (NSString)abbreviationTitle
{
  return self->_abbreviationTitle;
}

- (void)setAbbreviationTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)abbreviationData
{
  return self->_abbreviationData;
}

- (void)setAbbreviationData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSMutableOrderedSet)abbreviationList
{
  return self->_abbreviationList;
}

- (void)setAbbreviationList:(id)a3
{
  objc_storeStrong((id *)&self->_abbreviationList, a3);
}

- (NSString)ulItemMark
{
  return self->_ulItemMark;
}

- (void)setUlItemMark:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSString)emphasisMark
{
  return self->_emphasisMark;
}

- (void)setEmphasisMark:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSString)strongMark
{
  return self->_strongMark;
}

- (void)setStrongMark:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strongMark, 0);
  objc_storeStrong((id *)&self->_emphasisMark, 0);
  objc_storeStrong((id *)&self->_ulItemMark, 0);
  objc_storeStrong((id *)&self->_abbreviationList, 0);
  objc_storeStrong((id *)&self->_abbreviationData, 0);
  objc_storeStrong((id *)&self->_abbreviationTitle, 0);
  objc_storeStrong((id *)&self->_list, 0);
  objc_storeStrong((id *)&self->_maybeAutomaticLink, 0);
  objc_storeStrong((id *)&self->_aStack, 0);
  objc_storeStrong((id *)&self->_a, 0);
  objc_storeStrong((id *)&self->_outText, 0);
  objc_storeStrong((id *)&self->_outTextList, 0);
  objc_storeStrong((id *)&self->_unifiableN, 0);
  objc_storeStrong((id *)&self->_nameToCodepointMapping, 0);
  objc_storeStrong((id *)&self->_parser, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
}

void __30__WFHTMLToMarkdown_unifiableN__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = a3;
  objc_msgSend(v4, "numberWithUnsignedShort:", objc_msgSend(v6, "nameToCodepoint:", a2));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v7, v8);

}

@end
