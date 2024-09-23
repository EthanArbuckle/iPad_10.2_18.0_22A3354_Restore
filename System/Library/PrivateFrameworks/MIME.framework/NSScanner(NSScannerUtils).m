@implementation NSScanner(NSScannerUtils)

- (id)mf_nextTokenWithPunctuation:()NSScannerUtils
{
  const __CFCharacterSet *Predefined;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;

  Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespaceAndNewline);
  v6 = objc_msgSend(a1, "scanLocation");
  objc_msgSend(a1, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");
  if (v6 >= v8)
    goto LABEL_7;
  while (CFCharacterSetIsCharacterMember(Predefined, objc_msgSend(v7, "characterAtIndex:", v6)))
  {
    if (v8 == ++v6)
    {
      v6 = v8;
      goto LABEL_15;
    }
  }
  if (CFCharacterSetIsCharacterMember(a3, objc_msgSend(v7, "characterAtIndex:", v6)))
  {
    v8 = v6 + 1;
  }
  else
  {
LABEL_7:
    if (v6 >= v8)
    {
      v8 = v6;
    }
    else
    {
      v9 = v6;
      while (!CFCharacterSetIsCharacterMember(Predefined, objc_msgSend(v7, "characterAtIndex:", v9))
           && !CFCharacterSetIsCharacterMember(a3, objc_msgSend(v7, "characterAtIndex:", v9)))
      {
        if (v8 == ++v9)
          goto LABEL_15;
      }
      v8 = v9;
    }
  }
LABEL_15:
  objc_msgSend(a1, "setScanLocation:", v8);
  if (v8 == v6)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v7, "substringWithRange:", v6, v8 - v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (BOOL)mf_scanUpAndOverString:()NSScannerUtils
{
  id v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  v5 = objc_msgSend(a1, "scanLocation");
  objc_msgSend(a1, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "caseSensitive");
  objc_msgSend(a1, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "rangeOfString:options:range:", v4, v7 ^ 1u, v5, objc_msgSend(v8, "length") - v5);
  v11 = v10;

  if (v11)
    objc_msgSend(a1, "setScanLocation:", v9 + v11);

  return v11 != 0;
}

@end
