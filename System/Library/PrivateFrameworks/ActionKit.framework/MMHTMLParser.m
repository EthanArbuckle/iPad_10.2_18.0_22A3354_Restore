@implementation MMHTMLParser

- (id)parseBlockTagWithScanner:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "beginTransaction");
  -[MMHTMLParser _parseStrictBlockTagWithScanner:](self, "_parseStrictBlockTagWithScanner:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commitTransaction:", v5 != 0);
  if (v5)
  {
    v6 = v5;
  }
  else
  {
    -[MMHTMLParser _parseLenientBlockTagWithScanner:](self, "_parseLenientBlockTagWithScanner:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)parseCommentWithScanner:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (!objc_msgSend(v3, "matchString:", CFSTR("<!--")))
  {
    v6 = 0;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("-"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invertedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "atEndOfString") & 1) != 0)
  {
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  while (objc_msgSend(v3, "atEndOfLine"))
  {
    objc_msgSend(v3, "advanceToNextLine");
LABEL_7:
    if (objc_msgSend(v3, "atEndOfString"))
      goto LABEL_8;
  }
  objc_msgSend(v3, "skipCharactersFromSet:", v5);
  if (!objc_msgSend(v3, "matchString:", CFSTR("-->")))
  {
    objc_msgSend(v3, "advance");
    goto LABEL_7;
  }
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setType:", 9);
  objc_msgSend(v6, "setRange:", objc_msgSend(v3, "startLocation"), objc_msgSend(v3, "location") - objc_msgSend(v3, "startLocation"));
LABEL_9:

LABEL_11:
  return v6;
}

- (id)parseInlineTagWithScanner:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (objc_msgSend(v4, "nextCharacter") != 60)
    goto LABEL_9;
  objc_msgSend(v4, "advance");
  if (objc_msgSend(v4, "nextCharacter") == 47)
    objc_msgSend(v4, "advance");
  v5 = -[MMHTMLParser _parseNameWithScanner:](self, "_parseNameWithScanner:", v4);
  if (!v6)
    goto LABEL_9;
  v7 = v5;
  v8 = v6;
  -[MMHTMLParser _parseAttributesWithScanner:](self, "_parseAttributesWithScanner:", v4);
  objc_msgSend(v4, "skipWhitespace");
  if (objc_msgSend(v4, "nextCharacter") == 47)
    objc_msgSend(v4, "advance");
  if (objc_msgSend(v4, "nextCharacter") == 62)
  {
    objc_msgSend(v4, "advance");
    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "setType:", 9);
    objc_msgSend(v9, "setRange:", objc_msgSend(v4, "startLocation"), objc_msgSend(v4, "location") - objc_msgSend(v4, "startLocation"));
    objc_msgSend(v4, "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "substringWithRange:", v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStringValue:", v11);

  }
  else
  {
LABEL_9:
    v9 = 0;
  }

  return v9;
}

- (id)_parseStrictBlockTagWithScanner:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "nextCharacter") == 60)
  {
    objc_msgSend(v4, "advance");
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("p"), CFSTR("div"), CFSTR("h1"), CFSTR("h2"), CFSTR("h3"), CFSTR("h4"), CFSTR("h5"), CFSTR("h6"), CFSTR("blockquote"), CFSTR("pre"), CFSTR("table"), CFSTR("dl"), CFSTR("ol"), CFSTR("ul"), CFSTR("script"), CFSTR("noscript"), CFSTR("form"),
      CFSTR("fieldset"),
      CFSTR("iframe"),
      CFSTR("math"),
      CFSTR("ins"),
      CFSTR("del"),
      0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nextWord");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    if (objc_msgSend(v5, "containsObject:", v6))
    {
      objc_msgSend(v4, "setLocation:", objc_msgSend(v4, "location") + objc_msgSend(v6, "length"));
      -[MMHTMLParser _parseAttributesWithScanner:](self, "_parseAttributesWithScanner:", v4);
      objc_msgSend(v4, "skipWhitespace");
      if (objc_msgSend(v4, "nextCharacter") == 62)
      {
        objc_msgSend(v4, "advance");
        objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("<"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "invertedSet");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:

        while (1)
        {
          while (1)
          {
            if ((objc_msgSend(v4, "atEndOfString") & 1) != 0)
            {
              v7 = 0;
              goto LABEL_17;
            }
            objc_msgSend(v4, "skipCharactersFromSet:", v9);
            if (!objc_msgSend(v4, "atEndOfLine"))
              break;
            objc_msgSend(v4, "advanceToNextLine");
          }
          objc_msgSend(v4, "beginTransaction");
          if (-[MMHTMLParser _parseEndTag:withScanner:](self, "_parseEndTag:withScanner:", v6, v4))
            break;
          objc_msgSend(v4, "commitTransaction:", 0);
          objc_msgSend(v4, "beginTransaction");
          -[MMHTMLParser _parseStrictBlockTagWithScanner:](self, "_parseStrictBlockTagWithScanner:", v4);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "commitTransaction:", v8 != 0);
          if (v8)
            goto LABEL_5;
          objc_msgSend(v4, "beginTransaction");
          -[MMHTMLParser parseCommentWithScanner:](self, "parseCommentWithScanner:", v4);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "commitTransaction:", v8 != 0);
          if (v8)
            goto LABEL_5;
          objc_msgSend(v4, "beginTransaction");
          -[MMHTMLParser parseInlineTagWithScanner:](self, "parseInlineTagWithScanner:", v4);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "commitTransaction:", v7 != 0);

          if (!v7)
            goto LABEL_17;
        }
        objc_msgSend(v4, "commitTransaction:", 1);
        v7 = (void *)objc_opt_new();
        objc_msgSend(v7, "setType:", 9);
        objc_msgSend(v7, "setRange:", objc_msgSend(v4, "startLocation"), objc_msgSend(v4, "location") - objc_msgSend(v4, "startLocation"));
LABEL_17:

      }
      else
      {
        v7 = 0;
      }
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_parseEndTag:(id)a3 withScanner:(id)a4
{
  id v5;
  id v6;
  BOOL v7;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "nextCharacter") == 60
    && (objc_msgSend(v6, "advance"), objc_msgSend(v6, "nextCharacter") == 47)
    && (objc_msgSend(v6, "advance"),
        objc_msgSend(v6, "skipWhitespace"),
        objc_msgSend(v6, "matchString:", v5))
    && (objc_msgSend(v6, "skipWhitespace"), objc_msgSend(v6, "nextCharacter") == 62))
  {
    objc_msgSend(v6, "advance");
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_parseLenientBlockTagWithScanner:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "nextCharacter") == 60)
  {
    objc_msgSend(v3, "advance");
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("p"), CFSTR("div"), CFSTR("h1"), CFSTR("h2"), CFSTR("h3"), CFSTR("h4"), CFSTR("h5"), CFSTR("h6"), CFSTR("blockquote"), CFSTR("pre"), CFSTR("table"), CFSTR("dl"), CFSTR("ol"), CFSTR("ul"), CFSTR("script"), CFSTR("noscript"), CFSTR("form"),
      CFSTR("fieldset"),
      CFSTR("iframe"),
      CFSTR("math"),
      CFSTR("ins"),
      CFSTR("del"),
      0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "nextWord");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    if (objc_msgSend(v4, "containsObject:", v5))
    {
      objc_msgSend(v3, "setLocation:", objc_msgSend(v3, "location") + objc_msgSend(v5, "length"));
      while (objc_msgSend(v3, "nextCharacter") != 62)
      {
        if ((objc_msgSend(v3, "atEndOfString") & 1) != 0)
        {
          v6 = 0;
          goto LABEL_14;
        }
        if (objc_msgSend(v3, "atEndOfLine"))
          objc_msgSend(v3, "advanceToNextLine");
        else
          objc_msgSend(v3, "advance");
      }
      if ((objc_msgSend(v3, "atEndOfLine") & 1) == 0)
      {
        do
          objc_msgSend(v3, "advanceToNextLine");
        while (!objc_msgSend(v3, "atEndOfLine"));
      }
      v6 = (void *)objc_opt_new();
      objc_msgSend(v6, "setType:", 9);
      objc_msgSend(v6, "setRange:", objc_msgSend(v3, "startLocation"), objc_msgSend(v3, "location") - objc_msgSend(v3, "startLocation"));
    }
LABEL_14:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (_NSRange)_parseNameWithScanner:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  v3 = (void *)MEMORY[0x24BDD1690];
  v4 = a3;
  objc_msgSend(v3, "alphanumericCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addCharactersInString:", CFSTR(":-"));
  v6 = objc_msgSend(v4, "location");
  v7 = objc_msgSend(v4, "skipCharactersFromSet:", v5);

  v8 = v6;
  v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

- (BOOL)_parseStringWithScanner:(id)a3
{
  id v3;
  int v4;
  int v5;
  BOOL v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "nextCharacter");
  v5 = v4;
  if (v4 == 39 || v4 == 34)
  {
LABEL_3:
    objc_msgSend(v3, "advance");
    while (objc_msgSend(v3, "nextCharacter") != v5)
    {
      if ((objc_msgSend(v3, "atEndOfString") & 1) != 0)
        goto LABEL_9;
      if (!objc_msgSend(v3, "atEndOfLine"))
        goto LABEL_3;
      objc_msgSend(v3, "advanceToNextLine");
    }
    objc_msgSend(v3, "advance");
    v6 = 1;
  }
  else
  {
LABEL_9:
    v6 = 0;
  }

  return v6;
}

- (BOOL)_parseAttributeValueWithScanner:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = (void *)MEMORY[0x24BDD14A8];
  v4 = a3;
  objc_msgSend(v3, "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invertedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  v8 = objc_msgSend(v4, "skipCharactersFromSet:", v7);

  return v8 != 0;
}

- (void)_parseAttributesWithScanner:(id)a3
{
  id v4;
  uint64_t v5;
  id i;

  v4 = a3;
  for (i = v4; objc_msgSend(v4, "skipWhitespaceAndNewlines"); v4 = i)
  {
    -[MMHTMLParser _parseNameWithScanner:](self, "_parseNameWithScanner:", i);
    if (!v5)
      break;
    objc_msgSend(i, "beginTransaction");
    objc_msgSend(i, "skipWhitespace");
    if (objc_msgSend(i, "nextCharacter") == 61)
    {
      objc_msgSend(i, "commitTransaction:", 1);
      objc_msgSend(i, "advance");
      objc_msgSend(i, "skipWhitespace");
      if (!-[MMHTMLParser _parseStringWithScanner:](self, "_parseStringWithScanner:", i)
        && !-[MMHTMLParser _parseAttributeValueWithScanner:](self, "_parseAttributeValueWithScanner:", i))
      {
        break;
      }
    }
    else
    {
      objc_msgSend(i, "commitTransaction:", 0);
    }
  }

}

@end
