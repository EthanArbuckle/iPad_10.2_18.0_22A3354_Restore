@implementation NSString(SnippetGeneration)

- (uint64_t)ck_trimmedStringWithPreferredLength:()SnippetGeneration anchoredAroundSubstring:
{
  return objc_msgSend(a1, "ck_trimmedStringWithPreferredLength:anchoredAroundSubstring:options:", a3, a4, 0);
}

- (id)ck_trimmedStringWithPreferredLength:()SnippetGeneration anchoredAroundSubstring:options:
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  const __CFLocale *v14;
  __CFStringTokenizer *v15;
  uint64_t v16;
  unint64_t v17;
  CFIndex location;
  uint64_t v19;
  CFIndex v20;
  CFIndex v21;
  CFRange CurrentTokenRange;
  CFIndex v23;
  _BOOL4 v24;
  _BOOL4 v25;
  char v26;
  uint64_t v27;
  _BOOL4 v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  CFRange v37;

  v8 = a4;
  v9 = -[__CFString rangeOfString:options:](a1, "rangeOfString:options:", v8, 129);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ((-[__CFString _snippetOptions:hasOption:](a1, "_snippetOptions:hasOption:", a5, 4) & 1) == 0)
      a3 = -[__CFString length](a1, "length");
    -[__CFString substringWithRange:](a1, "substringWithRange:", 0, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_30;
  }
  v12 = v9;
  v13 = v10;
  if (-[__CFString _snippetOptions:hasOption:](a1, "_snippetOptions:hasOption:", a5, 2))
    a3 -= objc_msgSend(v8, "length");
  v14 = CFLocaleCopyCurrent();
  v37.length = -[__CFString length](a1, "length");
  v37.location = 0;
  v15 = CFStringTokenizerCreate(0, a1, v37, 0, v14);
  if (v14)
    CFRelease(v14);
  v16 = -[__CFString length](a1, "length");
  if (v15)
  {
    v17 = v16;
    location = 0;
    if (CFStringTokenizerAdvanceToNextToken(v15))
    {
      v19 = v12 + v13;
      v20 = v12 - (a3 >> 1);
      v21 = v19 + (a3 >> 1);
      do
      {
        CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v15);
        v23 = CurrentTokenRange.location + CurrentTokenRange.length;
        v24 = CurrentTokenRange.location + CurrentTokenRange.length >= v20;
        v25 = CurrentTokenRange.location <= v21;
        if (!location)
          v23 = v17;
        v26 = v24 && v25;
        if (v24 && v25)
          v17 = v23;
        if (v24 && v25 && location == 0)
          location = CurrentTokenRange.location;
      }
      while (CFStringTokenizerAdvanceToNextToken(v15));
    }
    else
    {
      v26 = 1;
    }
    CFRelease(v15);
    v28 = location > 0;
    v27 = location & ~(location >> 63);
    if ((v26 & 1) == 0 && v17 <= -[__CFString length](a1, "length"))
    {
      v29 = 1;
      goto LABEL_25;
    }
  }
  else
  {
    v27 = 0;
    v28 = 0;
  }
  v17 = -[__CFString length](a1, "length");
  v29 = 0;
LABEL_25:
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    CKFrameworkBundle();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("ELLIPSES"), &stru_1E276D870, CFSTR("ChatKit"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "appendString:", v32);

  }
  -[__CFString substringWithRange:](a1, "substringWithRange:", v27, v17 - v27);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "appendString:", v33);

  if (v29)
  {
    CKFrameworkBundle();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("ELLIPSES"), &stru_1E276D870, CFSTR("ChatKit"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "appendString:", v35);

  }
  v11 = (void *)objc_msgSend(v30, "copy");

LABEL_30:
  return v11;
}

- (BOOL)_snippetOptions:()SnippetGeneration hasOption:
{
  return (a4 & ~a3) == 0;
}

@end
