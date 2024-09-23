@implementation NSString(HTML)

- (id)stringByConvertingHTMLToPlainText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  void *context;
  void *v24;
  id v25;
  id v26;

  context = (void *)MEMORY[0x22E315218]();
  v2 = (void *)MEMORY[0x24BDD14A8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("< \t\n\r%C%C%C%C"), 133, 12, 8232, 8233);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "characterSetWithCharactersInString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDD14A8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" \t\n\r%C%C%C%C"), 133, 12, 8232, 8233);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "characterSetWithCharactersInString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithCapacity:", objc_msgSend(a1, "length"));
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17A8]), "initWithString:", a1);
  objc_msgSend(v9, "setCharactersToBeSkipped:", 0);
  objc_msgSend(v9, "setCaseSensitive:", 1);
  v10 = 0;
  v11 = 0;
  do
  {
    v12 = v11;
    v26 = v11;
    v13 = objc_msgSend(v9, "scanUpToCharactersFromSet:intoString:", v4, &v26);
    v11 = v26;

    if (v13)
    {
      objc_msgSend(v8, "appendString:", v11);

      v11 = 0;
    }
    if (objc_msgSend(v9, "scanString:intoString:", CFSTR("<"), 0))
    {
      if (objc_msgSend(v9, "scanString:intoString:", CFSTR("!--"), 0))
      {
        objc_msgSend(v9, "scanUpToString:intoString:", CFSTR("-->"), 0);
        v14 = v9;
        v15 = CFSTR("-->");
LABEL_33:
        objc_msgSend(v14, "scanString:intoString:", v15, 0);
        continue;
      }
      if (objc_msgSend(v9, "scanString:intoString:", CFSTR("script"), 0))
      {
        v16 = v9;
        v17 = CFSTR("</script>");
LABEL_32:
        objc_msgSend(v16, "scanUpToString:intoString:", v17, 0);
        v14 = v9;
        v15 = v17;
        goto LABEL_33;
      }
      if (objc_msgSend(v9, "scanString:intoString:", CFSTR("/"), 0))
      {

        v25 = 0;
        v18 = objc_msgSend(v9, "scanCharactersFromSet:intoString:", v24, &v25);
        v19 = v25;
        v20 = v19;
        if (v18)
        {
          objc_msgSend(v19, "lowercaseString");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v10, "isEqualToString:", CFSTR("a")) & 1) != 0
            || (objc_msgSend(v10, "isEqualToString:", CFSTR("b")) & 1) != 0
            || (objc_msgSend(v10, "isEqualToString:", CFSTR("i")) & 1) != 0
            || (objc_msgSend(v10, "isEqualToString:", CFSTR("q")) & 1) != 0
            || (objc_msgSend(v10, "isEqualToString:", CFSTR("span")) & 1) != 0
            || (objc_msgSend(v10, "isEqualToString:", CFSTR("em")) & 1) != 0
            || (objc_msgSend(v10, "isEqualToString:", CFSTR("strong")) & 1) != 0
            || (objc_msgSend(v10, "isEqualToString:", CFSTR("cite")) & 1) != 0
            || (objc_msgSend(v10, "isEqualToString:", CFSTR("abbr")) & 1) != 0
            || (objc_msgSend(v10, "isEqualToString:", CFSTR("acronym")) & 1) != 0
            || (objc_msgSend(v10, "isEqualToString:", CFSTR("label")) & 1) != 0)
          {
            goto LABEL_31;
          }
        }
        else
        {
          v10 = v19;
        }
        if (objc_msgSend(v8, "length") && (objc_msgSend(v9, "isAtEnd") & 1) == 0)
          objc_msgSend(v8, "appendString:", CFSTR(" "));
      }
LABEL_31:
      v16 = v9;
      v17 = CFSTR(">");
      goto LABEL_32;
    }
    if (objc_msgSend(v9, "scanCharactersFromSet:intoString:", v7, 0)
      && objc_msgSend(v8, "length")
      && (objc_msgSend(v9, "isAtEnd") & 1) == 0)
    {
      objc_msgSend(v8, "appendString:", CFSTR(" "));
    }
  }
  while (!objc_msgSend(v9, "isAtEnd"));
  objc_msgSend(v8, "stringByDecodingHTMLEntities");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(context);
  return v21;
}

- (id)stringByDecodingHTMLEntities
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "gtm_stringByUnescapingFromHTML");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)stringByEncodingHTMLEntities
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "gtm_stringByEscapingForAsciiHTML");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)stringByEncodingHTMLEntities:()HTML
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  if ((a3 & 1) != 0)
    objc_msgSend(a1, "gtm_stringByEscapingForHTML");
  else
    objc_msgSend(a1, "gtm_stringByEscapingForAsciiHTML");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)stringWithNewLinesAsBRs
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  id v11;
  unint64_t v12;
  void *v13;
  id v15;
  id v16;

  v2 = (void *)MEMORY[0x22E315218]();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17A8]), "initWithString:", a1);
  objc_msgSend(v3, "setCharactersToBeSkipped:", 0);
  v4 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v5 = (void *)MEMORY[0x24BDD14A8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\n\r%C%C%C%C"), 133, 12, 8232, 8233);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "characterSetWithCharactersInString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  do
  {

    v16 = 0;
    objc_msgSend(v3, "scanUpToCharactersFromSet:intoString:", v7, &v16);
    v9 = v16;
    if (v9)
      objc_msgSend(v4, "appendString:", v9);

    if (objc_msgSend(v3, "scanString:intoString:", CFSTR("\r\n"), 0))
    {
      objc_msgSend(v4, "appendString:", CFSTR("<br />"));
      v8 = 0;
    }
    else
    {
      v15 = 0;
      v10 = objc_msgSend(v3, "scanCharactersFromSet:intoString:", v7, &v15);
      v11 = v15;
      v8 = v11;
      if (v10 && v11 && objc_msgSend(v11, "length"))
      {
        v12 = 0;
        do
        {
          objc_msgSend(v4, "appendString:", CFSTR("<br />"));
          ++v12;
        }
        while (v12 < objc_msgSend(v8, "length"));
      }
    }
  }
  while (!objc_msgSend(v3, "isAtEnd"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v2);
  return v13;
}

- (id)stringByRemovingNewLinesAndWhitespace
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v11;

  v2 = (void *)MEMORY[0x22E315218]();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17A8]), "initWithString:", a1);
  objc_msgSend(v3, "setCharactersToBeSkipped:", 0);
  v4 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v5 = (void *)MEMORY[0x24BDD14A8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" \t\n\r%C%C%C%C"), 133, 12, 8232, 8233);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "characterSetWithCharactersInString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isAtEnd") & 1) == 0)
  {
    v8 = 0;
    do
    {

      v11 = 0;
      objc_msgSend(v3, "scanUpToCharactersFromSet:intoString:", v7, &v11);
      v8 = v11;
      if (v8)
        objc_msgSend(v4, "appendString:", v8);
      if (objc_msgSend(v3, "scanCharactersFromSet:intoString:", v7, 0)
        && objc_msgSend(v4, "length")
        && (objc_msgSend(v3, "isAtEnd") & 1) == 0)
      {
        objc_msgSend(v4, "appendString:", CFSTR(" "));
      }
    }
    while (!objc_msgSend(v3, "isAtEnd"));

  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v2);
  return v9;
}

- (id)stringByLinkifyingURLs
{
  void *v2;
  void *v3;
  id v4;

  if (NSClassFromString(CFSTR("NSRegularExpression")))
  {
    v2 = (void *)MEMORY[0x22E315218]();
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("(?<!=\")\\b((http|https):\\/\\/[\\w\\-_]+(\\.[\\w\\-_]+)+([\\w\\-\\.,@?^=%%&amp;:/~\\+#]*[\\w\\-\\@?^=%%&amp;/~\\+#])?)"),
      0,
      0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByReplacingMatchesInString:options:range:withTemplate:", a1, 0, 0, objc_msgSend(a1, "length"), CFSTR("<a href=\"$1\" class=\"linkified\">$1</a>"));
    v4 = (id)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v2);
  }
  else
  {
    v4 = a1;
  }
  return v4;
}

- (id)stringByStrippingTags
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  const __CFString *v15;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22E315218]();
  if (objc_msgSend(a1, "rangeOfString:options:", CFSTR("<"), 2) == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCharactersToBeSkipped:", 0);
    v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v6 = 0;
    do
    {

      objc_msgSend(v4, "scanUpToString:intoString:", CFSTR("<"), 0);
      v23 = 0;
      objc_msgSend(v4, "scanUpToString:intoString:", CFSTR(">"), &v23);
      v6 = v23;
      if (v6)
      {
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@>"), v6);
        objc_msgSend(v5, "addObject:", v7);

      }
    }
    while (!objc_msgSend(v4, "isAtEnd"));
    v17 = v6;
    v18 = v4;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", a1);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if ((objc_msgSend(v14, "isEqualToString:", CFSTR("<a>")) & 1) != 0
            || (objc_msgSend(v14, "isEqualToString:", CFSTR("</a>")) & 1) != 0
            || (objc_msgSend(v14, "isEqualToString:", CFSTR("<span>")) & 1) != 0
            || (objc_msgSend(v14, "isEqualToString:", CFSTR("</span>")) & 1) != 0
            || (objc_msgSend(v14, "isEqualToString:", CFSTR("<strong>")) & 1) != 0
            || (objc_msgSend(v14, "isEqualToString:", CFSTR("</strong>")) & 1) != 0
            || (objc_msgSend(v14, "isEqualToString:", CFSTR("<em>")) & 1) != 0
            || (v15 = CFSTR(" "), objc_msgSend(v14, "isEqualToString:", CFSTR("</em>"))))
          {
            v15 = &stru_24F8BBA48;
          }
          objc_msgSend(v8, "replaceOccurrencesOfString:withString:options:range:", v14, v15, 2, 0, objc_msgSend(v8, "length"));
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v11);
    }

    objc_msgSend(v8, "stringByRemovingNewLinesAndWhitespace");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_autoreleasePoolPop(v2);
  return v3;
}

@end
