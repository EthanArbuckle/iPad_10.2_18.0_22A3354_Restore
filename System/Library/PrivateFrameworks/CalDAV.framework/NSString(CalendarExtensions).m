@implementation NSString(CalendarExtensions)

- (id)quote
{
  id v2;

  if (objc_msgSend(a1, "rangeOfString:", CFSTR("\")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v2 = a1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", a1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\"), CFSTR("'"), 2, 0, objc_msgSend(v2, "length"));
  }
  return v2;
}

- (id)trimWhiteSpace
{
  __CFString *v1;
  void *v2;

  v1 = (__CFString *)objc_msgSend(a1, "mutableCopy");
  CFStringTrimWhitespace(v1);
  v2 = (void *)-[__CFString copy](v1, "copy");

  return v2;
}

- (id)trimFinalComma
{
  id v2;

  if (objc_msgSend(a1, "length")
    && objc_msgSend(a1, "characterAtIndex:", objc_msgSend(a1, "length") - 1) == 44)
  {
    objc_msgSend(a1, "substringToIndex:", objc_msgSend(a1, "length") - 1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = a1;
  }
  return v2;
}

- (id)trimFirstComma
{
  id v2;

  if (objc_msgSend(a1, "length") && objc_msgSend(a1, "characterAtIndex:", 0) == 44)
  {
    objc_msgSend(a1, "substringFromIndex:", 1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = a1;
  }
  return v2;
}

- (id)trimCommas
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "trimFirstComma");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "trimFinalComma");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)trimFinalChar:()CalendarExtensions
{
  id v5;

  if (objc_msgSend(a1, "length")
    && objc_msgSend(a1, "characterAtIndex:", objc_msgSend(a1, "length") - 1) == a3)
  {
    objc_msgSend(a1, "substringToIndex:", objc_msgSend(a1, "length") - 1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = a1;
  }
  return v5;
}

- (id)trimFirstChar:()CalendarExtensions
{
  id v5;

  if (objc_msgSend(a1, "length") && objc_msgSend(a1, "characterAtIndex:", 0) == a3)
  {
    objc_msgSend(a1, "substringFromIndex:", 1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = a1;
  }
  return v5;
}

- (id)trimChar:()CalendarExtensions
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "trimFirstChar:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trimFinalChar:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)unquote
{
  id v2;

  if (objc_msgSend(a1, "rangeOfString:", CFSTR("\\\")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v2 = a1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", a1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\\\"), CFSTR("\"), 2, 0, objc_msgSend(v2, "length"));
  }
  return v2;
}

- (id)searchAndReplaceString:()CalendarExtensions withString:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  int v10;
  id v11;
  void *v12;
  char v13;
  id v14;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17A8]), "initWithString:", a1);
  v9 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v8, "setCharactersToBeSkipped:", 0);
  if (objc_msgSend(v8, "scanString:intoString:", v6, 0))
    objc_msgSend(v9, "appendString:", v7);
  v16 = 0;
  v10 = objc_msgSend(v8, "scanUpToString:intoString:", v6, &v16);
  v11 = v16;
  v12 = v11;
  if (v10)
  {
    do
    {
      objc_msgSend(v9, "appendString:", v12);
      if (objc_msgSend(v8, "scanString:intoString:", v6, 0))
        objc_msgSend(v9, "appendString:", v7);
      v16 = v12;
      v13 = objc_msgSend(v8, "scanUpToString:intoString:", v6, &v16);
      v14 = v16;

      v12 = v14;
    }
    while ((v13 & 1) != 0);
  }
  else
  {
    v14 = v11;
  }

  return v9;
}

+ (id)stringWithFileSystemRepresentation:()CalendarExtensions
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFileSystemRepresentation:length:", a3, strlen(a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)removeSlashIfNeeded
{
  id v2;

  if ((objc_msgSend(a1, "hasSuffix:", CFSTR("/")) & 1) != 0)
  {
    objc_msgSend(a1, "substringToIndex:", objc_msgSend(a1, "length") - 1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = a1;
  }
  return v2;
}

- (id)appendSlashIfNeeded
{
  id v2;

  if (objc_msgSend(a1, "hasSuffix:", CFSTR("/")))
  {
    v2 = a1;
  }
  else
  {
    objc_msgSend(a1, "stringByAppendingString:", CFSTR("/"));
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

@end
