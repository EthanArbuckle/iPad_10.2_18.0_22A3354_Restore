@implementation NSString(FormatFlowedSupport)

- (__CFString)mf_convertFromFlowedText:()FormatFlowedSupport visuallyEmpty:
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  const __CFAllocator *v11;
  CFMutableStringRef Mutable;
  __CFString *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  unint64_t v18;
  const __CFString *v19;
  unint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _BOOL4 v25;
  char v26;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;

  v28 = objc_msgSend(a1, "length");
  v31 = 0;
  if (a4)
  {
    v7 = objc_msgSend(a1, "rangeOfCharacterFromSet:", objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet"));
    v9 = v8;
    if (objc_msgSend(a1, "length"))
    {
      if (v7)
        v10 = 0;
      else
        v10 = v9 == objc_msgSend(a1, "length");
    }
    else
    {
      v10 = 1;
    }
    *a4 = v10;
  }
  v11 = (const __CFAllocator *)MFGetMappedAllocator();
  Mutable = CFStringCreateMutable(v11, 0);
  v13 = Mutable;
  if ((a3 & 8) != 0)
    -[__CFString appendString:](Mutable, "appendString:", CFSTR("<HTML><BODY>"));
  if (!v28)
  {
    v19 = 0;
    v15 = 0;
    v14 = 0;
    goto LABEL_66;
  }
  v14 = 0;
  v15 = 0;
  do
  {
    v16 = v15;
    v29 = 0;
    v30 = 0;
    v17 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    objc_msgSend(a1, "getLineStart:end:contentsEnd:forRange:", &v31, &v29, &v30, v31, 0);
    v18 = v30;
    if (v30 >= v29)
      v19 = 0;
    else
      v19 = CFSTR("\n");
    v20 = v31;
    if (v31 >= v30)
    {
      v15 = 0;
      goto LABEL_25;
    }
    v15 = 0;
    while (1)
    {
      v21 = objc_msgSend(a1, "characterAtIndex:", v20, v28);
      if (v21 != 62)
        break;
      ++v15;
LABEL_21:
      ++v20;
      v18 = v30;
      if (v20 >= v30)
        goto LABEL_25;
    }
    if ((a3 & 1) == 0 && v21 == 32)
      goto LABEL_21;
    v18 = v30;
LABEL_25:
    if (v20 >= v18)
      goto LABEL_37;
    if ((a3 & 1) != 0)
    {
      if (objc_msgSend(a1, "characterAtIndex:", v20) == 32)
        ++v20;
LABEL_37:
      if (!v14)
        goto LABEL_41;
LABEL_38:
      if (v16 != v15 && objc_msgSend(v14, "length"))
      {
        _appendParagraphToOutput(v13, v14, v16, (uint64_t)v19, (a3 >> 3) & 1);
        objc_msgSend(v14, "setString:", &stru_1E81CBE50);
      }
      goto LABEL_41;
    }
    if (v20 <= v31)
      goto LABEL_37;
    if (!v15)
    {
      v20 = v31;
      if (!v14)
        goto LABEL_41;
      goto LABEL_38;
    }
    v22 = objc_msgSend(a1, "rangeOfString:options:range:", CFSTR(">"), 4, v31, v20 - v31);
    v23 = v22 + 2;
    if (v20 < v22 + 2)
      v23 = v20;
    if (v22 != 0x7FFFFFFFFFFFFFFFLL)
      v20 = v23;
    if (v14)
      goto LABEL_38;
LABEL_41:
    v24 = (void *)objc_msgSend(a1, "substringWithRange:", v20, v30 - v20, v28);
    if ((a3 & 1) == 0)
      goto LABEL_60;
    if (v31 >= v30 || objc_msgSend(a1, "characterAtIndex:", v30 - 1) != 32)
      goto LABEL_73;
    if (v30 - v20 == 3 && objc_msgSend(a1, "characterAtIndex:", v20) == 45)
    {
      v25 = objc_msgSend(a1, "characterAtIndex:", v20 + 1) != 45;
      if ((a3 & 2) == 0)
        goto LABEL_52;
    }
    else
    {
      v25 = 1;
      if ((a3 & 2) == 0)
        goto LABEL_52;
    }
    if (v25 && objc_msgSend(v24, "length"))
    {
      v24 = (void *)objc_msgSend(v24, "substringToIndex:", objc_msgSend(v24, "length") - 1);
      goto LABEL_53;
    }
LABEL_52:
    if (!v25)
    {
LABEL_73:
      if (objc_msgSend(v14, "length"))
      {
        v26 = 0;
        if (!v14)
          goto LABEL_57;
        goto LABEL_58;
      }
LABEL_60:
      _appendParagraphToOutput(v13, v24, v15, (uint64_t)v19, (a3 >> 3) & 1);
      goto LABEL_61;
    }
LABEL_53:
    v26 = 1;
    if (!v14)
LABEL_57:
      v14 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
LABEL_58:
    objc_msgSend(v14, "appendString:", v24);
    if ((v26 & 1) == 0)
    {
      _appendParagraphToOutput(v13, v14, v15, (uint64_t)v19, (a3 >> 3) & 1);
      objc_msgSend(v14, "setString:", &stru_1E81CBE50);
    }
LABEL_61:
    v31 = v29;
    objc_msgSend(v17, "drain");
  }
  while (v31 < v28);
LABEL_66:
  if (objc_msgSend(v14, "length", v28))
    _appendParagraphToOutput(v13, v14, v15, (uint64_t)v19, (a3 >> 3) & 1);

  if ((a3 & 8) != 0)
    -[__CFString appendString:](v13, "appendString:", CFSTR("</BODY></HTML>"));
  return v13;
}

@end
