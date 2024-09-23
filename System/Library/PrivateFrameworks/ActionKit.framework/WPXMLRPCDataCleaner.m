@implementation WPXMLRPCDataCleaner

- (WPXMLRPCDataCleaner)initWithData:(id)a3
{
  id v5;
  WPXMLRPCDataCleaner *v6;
  WPXMLRPCDataCleaner *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WPXMLRPCDataCleaner;
  v6 = -[WPXMLRPCDataCleaner init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->xmlData, a3);

  return v7;
}

- (id)cleanData
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (self->xmlData)
  {
    -[WPXMLRPCDataCleaner cleanInvalidUTF8:](self, "cleanInvalidUTF8:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v3, 4);
    if (!v4)
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v3, 5);
    v5 = objc_msgSend(v4, "length");
    -[WPXMLRPCDataCleaner cleanCharactersBeforePreamble:](self, "cleanCharactersBeforePreamble:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v5 - objc_msgSend(v6, "length");
    -[WPXMLRPCDataCleaner cleanInvalidXMLCharacters:](self, "cleanInvalidXMLCharacters:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[WPXMLRPCDataCleaner cleanWithTidyIfPresent:](self, "cleanWithTidyIfPresent:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[WPXMLRPCDataCleaner cleanClosingTagIfNeeded:lengthOfCharactersPrecedingPreamble:](self, "cleanClosingTagIfNeeded:lengthOfCharactersPrecedingPreamble:", v9, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "dataUsingEncoding:", 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->xmlData, 0);
}

- (id)cleanInvalidUTF8:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;

  v3 = a3;
  v4 = MEMORY[0x22E31508C]("UTF-8", "UTF-8");
  v16 = 1;
  MEMORY[0x22E315098](v4, 4, &v16);
  v14 = objc_msgSend(v3, "length");
  v15 = v14;
  v5 = objc_retainAutorelease(v3);
  v13 = objc_msgSend(v5, "bytes");
  v6 = malloc_type_malloc(objc_msgSend(v5, "length"), 0x100004077774924uLL);
  v12 = v6;
  if (MEMORY[0x22E315074](v4, &v13, &v15, &v12, &v14) == -1)
  {
    v9 = v5;
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDBCE50];
    v8 = objc_msgSend(v5, "length");
    objc_msgSend(v7, "dataWithBytes:length:", v6, v8 - v14);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  MEMORY[0x22E315080](v4);
  free(v6);

  return v10;
}

- (id)cleanCharactersBeforePreamble:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("<?xml"));
  if (v5)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (!v6 && v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v3, "substringFromIndex:", v4);
    v8 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v8;
  }
  return v3;
}

- (id)cleanInvalidXMLCharacters:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t i;
  uint64_t v7;
  BOOL v8;
  void *v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      v7 = objc_msgSend(v3, "characterAtIndex:", i);
      v8 = v7 > 0xD || ((1 << v7) & 0x2600) == 0;
      if (!v8
        || (unsigned __int16)((unsigned __int16)(v7 - 32) >> 5) < 0x6BFu
        || (unsigned __int16)((unsigned __int16)(v7 + 0x2000) >> 1) <= 0xFFEu)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendString:", v9);

      }
    }
  }

  return v5;
}

- (id)cleanWithTidyIfPresent:(id)a3
{
  id v3;
  void *v4;
  SEL v5;
  SEL v6;
  SEL v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v12;

  v3 = a3;
  NSClassFromString(CFSTR("CTidy"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = NSSelectorFromString(CFSTR("tidy"));
  v6 = NSSelectorFromString(CFSTR("tidyString:inputFormat:outputFormat:encoding:diagnostics:error:"));
  if (!v4)
    goto LABEL_8;
  v7 = v6;
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_8;
  objc_msgSend(v4, "performSelector:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8
    || (objc_opt_respondsToSelector() & 1) == 0
    || (v12 = 0,
        ((void (*)(void *, SEL, id, uint64_t, uint64_t, const __CFString *, uint64_t *))objc_msgSend(v8, "methodForSelector:", v7))(v8, v7, v3, 1, 1, CFSTR("utf8"), &v12), (v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {

LABEL_8:
    v10 = v3;
    goto LABEL_9;
  }
  v10 = (id)v9;

LABEL_9:
  return v10;
}

- (id)cleanClosingTagIfNeeded:(id)a3 lengthOfCharactersPrecedingPreamble:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;

  v6 = a3;
  if (objc_msgSend(v6, "rangeOfString:", CFSTR("methodResponse")) == 0x7FFFFFFFFFFFFFFFLL
    || objc_msgSend(v6, "rangeOfString:", CFSTR("</methodResponse>")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = v6;
  }
  else
  {
    -[WPXMLRPCDataCleaner cloingTagsForString:](self, "cloingTagsForString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length") >= (unint64_t)a4)
    {
      -[WPXMLRPCDataCleaner repairTruncatedClosingTags:inResponseString:](self, "repairTruncatedClosingTags:inResponseString:", v7, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        -[WPXMLRPCDataCleaner appendClosingTags:toResponseString:](self, "appendClosingTags:toResponseString:", v7, v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v8 = v9;

    }
    else
    {
      v8 = v6;
    }

  }
  return v8;
}

- (id)cloingTagsForString:(id)a3
{
  if (objc_msgSend(a3, "rangeOfString:", CFSTR("<params>")) == 0x7FFFFFFFFFFFFFFFLL)
    return CFSTR("</value></fault></methodResponse>");
  else
    return CFSTR("</param></params></methodResponse>");
}

- (_NSRange)rangeOfLastValidClosingTagInString:(id)a3
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  v3 = rangeOfLastValidClosingTagInString__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&rangeOfLastValidClosingTagInString__onceToken, &__block_literal_global_15269);
  v5 = objc_msgSend((id)rangeOfLastValidClosingTagInString__regex, "rangeOfFirstMatchInString:options:range:", v4, 2, 0, objc_msgSend(v4, "length"));
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

- (id)repairTruncatedClosingTags:(id)a3 inResponseString:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  v8 = -[WPXMLRPCDataCleaner rangeOfLastValidClosingTagInString:](self, "rangeOfLastValidClosingTagInString:", v7);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = v7;
  }
  else
  {
    v11 = v8;
    objc_msgSend(v7, "substringWithRange:", v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v6, "rangeOfString:", v12);
    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = 0;
    }
    else
    {
      v14 = v13;
      objc_msgSend(v7, "substringToIndex:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "substringFromIndex:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v15, v16);
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v10;
}

- (id)appendClosingTags:(id)a3 toResponseString:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "rangeOfString:options:", CFSTR("<"), 4);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(v6, "substringFromIndex:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "rangeOfString:", v9);
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      v12 = 0;
    else
      v12 = v10 + v11;
    v13 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v5, "substringFromIndex:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@%@"), v6, v14);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

void __73__WPXMLRPCDataCleaner_CleaningSteps__rangeOfLastValidClosingTagInString___block_invoke()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;

  v3 = 0;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("</[^>]+>[^>]*$"), 1, &v3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = v3;
  v2 = (void *)rangeOfLastValidClosingTagInString__regex;
  rangeOfLastValidClosingTagInString__regex = v0;

}

@end
