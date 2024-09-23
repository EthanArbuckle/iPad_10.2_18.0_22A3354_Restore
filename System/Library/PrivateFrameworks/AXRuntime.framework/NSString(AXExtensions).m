@implementation NSString(AXExtensions)

- (uint64_t)_ax_rangeOfNextUnitWithStartPosition:()AXExtensions direction:withCharacterSet:
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v8 = a5;
  v9 = objc_msgSend(a1, "length");
  if (v9 && ((v10 = v9, a3 > 0) || a4 != 1) && (a4 || v9 > a3))
  {
    if (v9 >= a3)
      v13 = a3;
    else
      v13 = v9;
    if (a3 >= 0)
      v14 = v13;
    else
      v14 = 0;
    if (a4)
      v15 = -1;
    else
      v15 = 0;
    if (a4)
      v16 = -1;
    else
      v16 = 1;
    v11 = 0x7FFFFFFFLL;
    while (objc_msgSend(v8, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", v15 + v14)))
    {
      v14 += v16;
      if (v14 >= v10 || v14 < 1)
        goto LABEL_7;
    }
    if (a4 == 1)
      v17 = 6;
    else
      v17 = 2;
    if (a4)
      v18 = 0;
    else
      v18 = v14;
    if (a4)
      v19 = v14;
    else
      v19 = v10 - v14;
    if (a4)
      v20 = 0;
    else
      v20 = v10;
    v21 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v8, v17, v18, v19);
    if (a4 == 1)
      v22 = v21 + 1;
    else
      v22 = v21;
    if (v21 == 0x7FFFFFFFFFFFFFFFLL)
      v22 = v20;
    v23 = v22 - v18;
    if (a4)
      v23 = v18 + v19 - v22;
    else
      v22 = v14;
    if (v23 + v22 <= (unint64_t)v10)
      v11 = v22;
    else
      v11 = 0x7FFFFFFFLL;
  }
  else
  {
    v11 = 0x7FFFFFFFLL;
  }
LABEL_7:

  return v11;
}

- (uint64_t)ax_lineFromPosition:()AXExtensions inDirection:
{
  void *v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(a1, "_ax_rangeOfNextUnitWithStartPosition:direction:withCharacterSet:", a3, a4, v7);

  return v8;
}

- (uint64_t)ax_paragraphFromPosition:()AXExtensions inDirection:
{
  return objc_msgSend(a1, "_axUnit:fromPosition:inDirection:", 2, a3, a4);
}

- (uint64_t)ax_sentenceFromPosition:()AXExtensions inDirection:
{
  return objc_msgSend(a1, "_axUnit:fromPosition:inDirection:", 1, a3, a4);
}

- (uint64_t)ax_wordFromPosition:()AXExtensions inDirection:
{
  return objc_msgSend(a1, "_axUnit:fromPosition:inDirection:", 0, a3, a4);
}

- (uint64_t)ax_lineRangeForPosition:()AXExtensions
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  uint64_t v13;

  v5 = objc_msgSend(a1, "length");
  v6 = 0x7FFFFFFFLL;
  if ((a3 & 0x8000000000000000) == 0)
  {
    v7 = v5;
    if (v5 >= a3)
    {
      v8 = objc_msgSend(a1, "ax_lineFromPosition:inDirection:", a3, 0);
      v6 = objc_msgSend(a1, "ax_lineFromPosition:inDirection:", a3, 1);
      if (v7 <= a3
        || (objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v10 = objc_msgSend(v9, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", a3)),
            v9,
            (v10 & 1) == 0))
      {
        if (a3)
        {
          objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", a3 - 1));

        }
        else
        {
          v12 = 0;
        }
        if (v6 == 0x7FFFFFFF)
          v13 = v8;
        else
          v13 = v6;
        if ((v12 & 1) != 0)
          return v8;
        else
          return v13;
      }
    }
  }
  return v6;
}

- (uint64_t)_axUnit:()AXExtensions fromPosition:inDirection:
{
  uint64_t v9;
  CFIndex v10;
  CFIndex v12;
  CFIndex v13;
  UniChar *v14;
  __CFStringTokenizer *v15;
  uint64_t v16;
  CFIndex location;
  CFIndex length;
  CFRange CurrentTokenRange;
  unint64_t v20;
  CFRange v21;
  CFIndex v22;
  void *v23;
  void *v24;
  CFIndex v25;
  BOOL v26;
  CFRange v27;
  CFRange v28;

  v9 = -[__CFString length](a1, "length");
  v10 = v9;
  if (a4 < 0 && a5 == 1 || !a5 && v9 <= a4)
    return 0x7FFFFFFFLL;
  if (v9 >= a4)
    v12 = a4;
  else
    v12 = v9;
  if (a4 >= 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = (UniChar *)malloc_type_malloc(2 * v9, 0x1000040BDFB0063uLL);
  v27.length = -[__CFString length](a1, "length");
  v27.location = 0;
  CFStringGetCharacters(a1, v27, v14);
  v28.location = 0;
  v28.length = v10;
  v15 = CFStringTokenizerCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a1, v28, a3, 0);
  if (a5)
  {
    if (v13 >= 1)
    {
      v13 = v12 - 1;
      v16 = 1;
      while ((__int16)v14[v13] != -4)
      {
        CFStringTokenizerGoToTokenAtIndex(v15, v13);
        CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v15);
        length = CurrentTokenRange.length;
        location = CurrentTokenRange.location;
        if (CurrentTokenRange.location != -1)
          goto LABEL_26;
        v20 = v13-- + 1;
        if (v20 < 2)
          goto LABEL_24;
      }
      goto LABEL_28;
    }
  }
  else if (v13 < v10)
  {
    v16 = 1;
    while (1)
    {
      if ((__int16)v14[v13] == -4)
        goto LABEL_28;
      CFStringTokenizerGoToTokenAtIndex(v15, v13);
      v21 = CFStringTokenizerGetCurrentTokenRange(v15);
      length = v21.length;
      location = v21.location;
      if (v21.location != -1)
        break;
      if (v10 == ++v13)
      {
LABEL_24:
        v13 = -1;
LABEL_27:
        v16 = length;
        goto LABEL_28;
      }
    }
LABEL_26:
    v13 = location;
    goto LABEL_27;
  }
  v16 = 0;
  v13 = -1;
LABEL_28:
  free(v14);
  if (a3 || v13 == -1)
  {
    v25 = v13;
  }
  else
  {
    v22 = v16 + v13;
    objc_msgSend(MEMORY[0x1E0CB3780], "punctuationCharacterSet");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "symbolCharacterSet");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "formUnionWithCharacterSet:", v24);

    for (; v22 < v10; ++v22)
    {
      if (!objc_msgSend(v23, "characterIsMember:", -[__CFString characterAtIndex:](a1, "characterAtIndex:", v22)))break;
    }
    do
    {
      v25 = v13;
      v26 = v13-- < 1;
    }
    while (!v26
         && (objc_msgSend(v23, "characterIsMember:", -[__CFString characterAtIndex:](a1, "characterAtIndex:", v13)) & 1) != 0);

  }
  CFRelease(v15);
  if (v25 == -1)
    return 0x7FFFFFFFLL;
  else
    return v25;
}

- (AXAttributedString)axAttributedStringWithAttributes:()AXExtensions
{
  id v4;
  AXAttributedString *v5;

  v4 = a3;
  v5 = -[AXAttributedString initWithString:]([AXAttributedString alloc], "initWithString:", a1);
  -[AXAttributedString setAttributes:](v5, "setAttributes:", v4);

  return v5;
}

@end
