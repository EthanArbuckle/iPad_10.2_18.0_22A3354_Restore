@implementation MFHTMLParser

+ (id)plainTextFromHTML:(id)a3 limit:(unint64_t)a4 preserveNewlines:(BOOL)a5
{
  _BOOL4 v5;
  unint64_t v8;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v11;
  unint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  UniChar v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  int64_t v23;
  BOOL v24;
  int64_t v25;
  uint64_t v26;
  const UniChar *v27;
  UniChar v28;
  BOOL v29;
  int64_t v30;
  unint64_t v31;
  uint64_t v32;
  _OWORD v34[8];
  CFStringRef theString;
  const UniChar *v36;
  const char *v37;
  uint64_t v38;
  int64_t v39;
  int64_t v40;
  int64_t v41;
  UniChar buffer[4];
  __int16 v43;
  uint64_t v44;
  CFRange v45;
  CFRange v46;
  CFRange v47;

  v5 = a5;
  v44 = *MEMORY[0x1E0C80C00];
  v8 = objc_msgSend(a3, "length");
  theString = (CFStringRef)a3;
  v38 = 0;
  v39 = v8;
  CharactersPtr = CFStringGetCharactersPtr((CFStringRef)a3);
  CStringPtr = 0;
  v36 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr((CFStringRef)a3, 0x600u);
  v40 = 0;
  v41 = 0;
  v37 = CStringPtr;
  if (!v8)
    goto LABEL_51;
  v11 = 0;
  v12 = 0;
  *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v34[6] = v13;
  v34[7] = v13;
  v34[4] = v13;
  v34[5] = v13;
  v34[2] = v13;
  v34[3] = v13;
  v14 = 65;
  v15 = 64;
  v34[0] = v13;
  v34[1] = v13;
  do
  {
    if (v12 >= 4)
      v16 = 4;
    else
      v16 = v12;
    if ((v12 & 0x8000000000000000) != 0)
      goto LABEL_36;
    v17 = v39;
    if (v39 <= (uint64_t)v12)
      goto LABEL_36;
    if (v36)
    {
      v18 = v36[v12 + v38];
    }
    else if (v37)
    {
      v18 = v37[v38 + v12];
    }
    else
    {
      if (v41 <= (uint64_t)v12 || (v19 = v40, v40 > (uint64_t)v12))
      {
        v20 = v16 + v11;
        v21 = v15 - v16;
        v22 = v12 + 64 - v16;
        v23 = v22 - 64;
        if (v22 >= v39)
          v22 = v39;
        v40 = v23;
        v41 = v22;
        if (v39 >= v21)
          v17 = v21;
        v45.length = v17 + v20;
        v45.location = v23 + v38;
        CFStringGetCharacters(theString, v45, (UniChar *)v34);
        v19 = v40;
      }
      v18 = *((_WORD *)v34 + v12 - v19);
    }
    v24 = v18 != 60 || v12 >= v8 - 5;
    if (v24 || (v25 = v12 + 5, (uint64_t)(v12 + 5) < 0) || (v26 = v39, v39 <= v25))
    {
LABEL_36:
      v29 = 0;
      goto LABEL_37;
    }
    if (v36)
    {
      v27 = &v36[v12 + v38];
    }
    else
    {
      if (v37)
      {
        v28 = v37[v38 + 5 + v12];
        goto LABEL_33;
      }
      if (v41 <= v25 || (v30 = v40, v40 > v25))
      {
        v31 = v12 + 65;
        if ((uint64_t)(v12 + 65) >= v39)
          v31 = v39;
        v40 = v12 + 1;
        v41 = v31;
        if (v39 >= v14)
          v26 = v14;
        v47.length = v26 + v11 - 1;
        v47.location = v12 + 1 + v38;
        CFStringGetCharacters(theString, v47, (UniChar *)v34);
        v30 = v40;
      }
      v27 = (const UniChar *)v34 + v12 - v30;
    }
    v28 = v27[5];
LABEL_33:
    if (v28 != 62 && v28 != 32)
      goto LABEL_36;
    v46.location = v12 + 1;
    *(_QWORD *)buffer = 0xAAAAAAAAAAAAAAAALL;
    v43 = -21846;
    v46.length = 4;
    CFStringGetCharacters((CFStringRef)a3, v46, buffer);
    v29 = ustrncasecmp((char *)buffer, "body", 4) == 0;
LABEL_37:
    ++v12;
    if (v29)
      break;
    --v11;
    ++v15;
    ++v14;
  }
  while (v12 < v8);
  if (!v29 || v12 == 0x8000000000000000)
  {
LABEL_51:
    v32 = 0;
    return copyMutablePlainTextFromPoint((const __CFString *)a3, v32, a4, v5);
  }
  v32 = v12 - 1;
  return copyMutablePlainTextFromPoint((const __CFString *)a3, v32, a4, v5);
}

+ (id)plainTextFromHTML:(id)a3 limit:(unint64_t)a4
{
  return (id)objc_msgSend(a1, "plainTextFromHTML:limit:preserveNewlines:", a3, a4, 0);
}

+ (id)plainTextFromHTML:(id)a3
{
  return (id)objc_msgSend(a1, "plainTextFromHTML:limit:", a3, 0xFFFFFFFFLL);
}

+ (id)plainTextFromHTMLSnippet:(id)a3
{
  return copyMutablePlainTextFromPoint((const __CFString *)a3, 0, 0xFFFFFFFFuLL, 0);
}

@end
