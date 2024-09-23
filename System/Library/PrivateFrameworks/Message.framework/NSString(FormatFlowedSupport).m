@implementation NSString(FormatFlowedSupport)

- (__CFString)mf_convertFromFlowedText:()FormatFlowedSupport visuallyEmpty:
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  const __CFAllocator *v12;
  id v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  uint64_t v29;
  char v30;
  __CFString *v31;
  unint64_t v33;
  CFMutableStringRef Mutable;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;

  v33 = objc_msgSend(a1, "length");
  v37 = 0;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(a1, "rangeOfCharacterFromSet:", v7);
    v10 = v9;

    if (objc_msgSend(a1, "length"))
    {
      if (v8)
        v11 = 0;
      else
        v11 = v10 == objc_msgSend(a1, "length");
    }
    else
    {
      v11 = 1;
    }
    *a4 = v11;
  }
  v12 = (const __CFAllocator *)MFGetMappedAllocator();
  Mutable = CFStringCreateMutable(v12, 0);
  if ((a3 & 8) != 0)
    -[__CFString appendString:](Mutable, "appendString:", CFSTR("<HTML><BODY>"));
  if (v37 >= v33)
  {
    v18 = 0;
    v21 = 0;
    v13 = 0;
    goto LABEL_68;
  }
  v13 = 0;
  v14 = 0;
  v15 = 0;
  do
  {
    v35 = 0xAAAAAAAAAAAAAAAALL;
    v36 = 0xAAAAAAAAAAAAAAAALL;
    v16 = (void *)MEMORY[0x1A85B0E24]();
    objc_msgSend(a1, "getLineStart:end:contentsEnd:forRange:", &v37, &v35, &v36, v37, 0);
    v17 = CFSTR("\n");
    if (v36 >= v35)
      v17 = 0;
    v18 = v17;

    v19 = v36;
    v20 = v37;
    if (v37 >= v36)
    {
      v21 = 0;
      goto LABEL_24;
    }
    v21 = 0;
    while (1)
    {
      v22 = objc_msgSend(a1, "characterAtIndex:", v20);
      if (v22 != 62)
        break;
      ++v21;
LABEL_20:
      ++v20;
      v19 = v36;
      if (v20 >= v36)
        goto LABEL_24;
    }
    if ((a3 & 1) == 0 && v22 == 32)
      goto LABEL_20;
    v19 = v36;
LABEL_24:
    if (v20 >= v19)
      goto LABEL_36;
    if ((a3 & 1) != 0)
    {
      if (objc_msgSend(a1, "characterAtIndex:", v20) == 32)
        ++v20;
LABEL_36:
      if (!v13)
        goto LABEL_40;
LABEL_37:
      if (v14 != v21 && objc_msgSend(v13, "length"))
      {
        _appendParagraphToOutput(Mutable, v13, v14, v18, (a3 >> 3) & 1);
        objc_msgSend(v13, "setString:", &stru_1E4F1C8F8);
      }
      goto LABEL_40;
    }
    if (v20 <= v37)
      goto LABEL_36;
    if (!v21)
    {
      v20 = v37;
      if (!v13)
        goto LABEL_40;
      goto LABEL_37;
    }
    v23 = objc_msgSend(a1, "rangeOfString:options:range:", CFSTR(">"), 4, v37, v20 - v37);
    v24 = v23 + 2;
    if (v20 < v23 + 2)
      v24 = v20;
    if (v23 != 0x7FFFFFFFFFFFFFFFLL)
      v20 = v24;
    if (v13)
      goto LABEL_37;
LABEL_40:
    objc_msgSend(a1, "substringWithRange:", v20, v36 - v20);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if ((a3 & 1) == 0)
    {
      v27 = v25;
      _appendParagraphToOutput(Mutable, v25, v21, v18, (a3 >> 3) & 1);
      goto LABEL_63;
    }
    if (v37 >= v36 || objc_msgSend(a1, "characterAtIndex:", v36 - 1) != 32)
      goto LABEL_75;
    if (v36 - v20 == 3 && objc_msgSend(a1, "characterAtIndex:", v20) == 45)
    {
      v28 = objc_msgSend(a1, "characterAtIndex:", v20 + 1) != 45;
      if ((a3 & 2) == 0)
        goto LABEL_53;
    }
    else
    {
      v28 = 1;
      if ((a3 & 2) == 0)
        goto LABEL_53;
    }
    if (v28 && objc_msgSend(v26, "length"))
    {
      objc_msgSend(v26, "substringToIndex:", objc_msgSend(v26, "length") - 1);
      v29 = objc_claimAutoreleasedReturnValue();

      v30 = 1;
      v26 = (void *)v29;
      if (!v13)
        goto LABEL_58;
      goto LABEL_59;
    }
LABEL_53:
    if (v28)
    {
      v30 = 1;
      if (!v13)
LABEL_58:
        v13 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
LABEL_59:
      objc_msgSend(v13, "appendString:", v26);
      if ((v30 & 1) == 0)
      {
        _appendParagraphToOutput(Mutable, v13, v21, v18, (a3 >> 3) & 1);
        objc_msgSend(v13, "setString:", &stru_1E4F1C8F8);
      }
      v27 = v26;
    }
    else
    {
LABEL_75:
      if (objc_msgSend(v13, "length"))
      {
        v30 = 0;
        if (!v13)
          goto LABEL_58;
        goto LABEL_59;
      }
      _appendParagraphToOutput(Mutable, v26, v21, v18, (a3 >> 3) & 1);
      v27 = v26;
    }
LABEL_63:
    v37 = v35;
    objc_autoreleasePoolPop(v16);

    v14 = v21;
    v15 = v18;
  }
  while (v37 < v33);
LABEL_68:
  if (objc_msgSend(v13, "length"))
    _appendParagraphToOutput(Mutable, v13, v21, v18, (a3 >> 3) & 1);
  if ((a3 & 8) != 0)
    -[__CFString appendString:](Mutable, "appendString:", CFSTR("</BODY></HTML>"));
  v31 = Mutable;

  return v31;
}

@end
