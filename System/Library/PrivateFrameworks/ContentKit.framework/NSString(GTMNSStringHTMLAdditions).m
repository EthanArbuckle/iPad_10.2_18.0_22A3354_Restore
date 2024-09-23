@implementation NSString(GTMNSStringHTMLAdditions)

- (__CFString)gtm_stringByEscapingHTMLUsingTable:()GTMNSStringHTMLAdditions ofSize:escapingUnicode:
{
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  const UniChar *CharactersPtr;
  void *v13;
  id v14;
  id v15;
  __CFString *v16;
  void *v17;
  const UniChar *v18;
  CFIndex v19;
  size_t v20;
  _QWORD *v21;
  unsigned int v22;
  id v24;

  v9 = -[__CFString length](a1, "length");
  if (v9)
  {
    v10 = v9;
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", 2 * v10);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    CharactersPtr = CFStringGetCharactersPtr(a1);
    if (!CharactersPtr)
    {
      objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 2 * v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        v16 = 0;
        goto LABEL_25;
      }
      v14 = objc_retainAutorelease(v13);
      -[__CFString getCharacters:](a1, "getCharacters:", objc_msgSend(v14, "mutableBytes"));
      v15 = objc_retainAutorelease(v14);
      CharactersPtr = (const UniChar *)objc_msgSend(v15, "bytes");

    }
    v16 = 0;
    if (CharactersPtr)
    {
      v17 = v24;
      if (!v24)
      {
LABEL_26:

        return v16;
      }
      v18 = (const UniChar *)objc_msgSend(objc_retainAutorelease(v24), "mutableBytes");
      v19 = 0;
      v20 = a4 >> 4;
      do
      {
        v21 = bsearch(CharactersPtr, a3, v20, 0x10uLL, (int (__cdecl *)(const void *, const void *))EscapeMapCompare);
        if (v21 || (v22 = *CharactersPtr, a5) && v22 >= 0x80)
        {
          if (v19)
            CFStringAppendCharacters(v11, v18, v19);
          if (v21)
            -[__CFString appendString:](v11, "appendString:", *v21);
          else
            -[__CFString appendFormat:](v11, "appendFormat:", CFSTR("&#%d;"), *CharactersPtr);
          v19 = 0;
        }
        else
        {
          v18[v19++] = v22;
        }
        ++CharactersPtr;
        --v10;
      }
      while (v10);
      if (v19)
        CFStringAppendCharacters(v11, v18, v19);
      v16 = v11;
    }
LABEL_25:
    v17 = v24;
    goto LABEL_26;
  }
  v16 = a1;
  return v16;
}

- (uint64_t)gtm_stringByEscapingForHTML
{
  return objc_msgSend(a1, "gtm_stringByEscapingHTMLUsingTable:ofSize:escapingUnicode:", &gUnicodeHTMLEscapeMap, 528, 0);
}

- (uint64_t)gtm_stringByEscapingForAsciiHTML
{
  return objc_msgSend(a1, "gtm_stringByEscapingHTMLUsingTable:ofSize:escapingUnicode:", &gAsciiHTMLEscapeMap, 4048, 1);
}

- (id)gtm_stringByUnescapingFromHTML
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;
  BOOL v15;
  void *v16;
  uint64_t v17;
  __CFString **v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  BOOL v22;
  void *v23;
  uint64_t v24;
  void *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  unsigned int v30;

  v2 = objc_msgSend(a1, "length");
  v3 = objc_msgSend(a1, "rangeOfString:options:range:", CFSTR("&"), 4, 0, v2);
  if (!v4)
    return a1;
  v5 = v3;
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", a1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  do
  {
    v6 = objc_msgSend(a1, "rangeOfString:options:range:", CFSTR(";"), 0, v5, v2 - v5);
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = v6 - v5 + 1;
      objc_msgSend(a1, "substringWithRange:", v5, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "length");
      v10 = v9 - 4;
      if ((unint64_t)(v9 - 4) <= 6)
      {
        v11 = v9;
        if (objc_msgSend(v8, "characterAtIndex:", 1) == 35)
        {
          if ((objc_msgSend(v8, "characterAtIndex:", 2) & 0xFFFFFFDF) == 0x58)
          {
            objc_msgSend(v8, "substringWithRange:", 3, v10);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = 0;
            if (objc_msgSend(v13, "scanHexInt:", &v30))
              v14 = v30 > 0xFFFE;
            else
              v14 = 1;
            v15 = v14 || v30 == 0;
            if (!v15 && objc_msgSend(v13, "scanLocation") == v10)
            {
              v29 = v30;
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v29, 1);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "replaceCharactersInRange:withString:", v5, v7, v16);

            }
          }
          else
          {
            v19 = v11 - 3;
            objc_msgSend(v8, "substringWithRange:", 2, v11 - 3);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v12);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = 0;
            if (objc_msgSend(v20, "scanInt:", &v28))
              v21 = v28 <= 65534;
            else
              v21 = 0;
            v22 = !v21 || v28 < 1;
            if (!v22 && objc_msgSend(v20, "scanLocation") == v19)
            {
              v27 = v28;
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v27, 1);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "replaceCharactersInRange:withString:", v5, v7, v23);

            }
          }
        }
        else
        {
          v17 = 0;
          v18 = &gAsciiHTMLEscapeMap;
          while (!objc_msgSend(v8, "isEqualToString:", *v18))
          {
            ++v17;
            v18 += 2;
            if (v17 == 253)
              goto LABEL_33;
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &gAsciiHTMLEscapeMap + 2 * v17 + 1, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "replaceCharactersInRange:withString:", v5, v7, v12);
        }

      }
LABEL_33:

    }
    v2 = v5;
    v5 = objc_msgSend(a1, "rangeOfString:options:range:", CFSTR("&"), 4, 0, v5);
  }
  while (v24);
  return v26;
}

@end
