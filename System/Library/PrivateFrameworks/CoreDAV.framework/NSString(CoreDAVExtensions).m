@implementation NSString(CoreDAVExtensions)

- (uint64_t)initWithCDVNameSpace:()CoreDAVExtensions andName:
{
  const __CFString *v4;
  const __CFString *v5;

  v4 = &stru_24C1DBD70;
  if (a3)
    v5 = a3;
  else
    v5 = &stru_24C1DBD70;
  if (a4)
    v4 = a4;
  return objc_msgSend(a1, "initWithFormat:", CFSTR("%@:%@"), v5, v4);
}

+ (id)CDVStringWithNameSpace:()CoreDAVExtensions andName:
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x24BDD17C8];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithCDVNameSpace:andName:", v7, v6);

  return v8;
}

- (uint64_t)CDVStringByAddingPercentEscapesForHREF
{
  if (CDVStringByAddingPercentEscapesForHREF_onceToken != -1)
    dispatch_once(&CDVStringByAddingPercentEscapesForHREF_onceToken, &__block_literal_global_1);
  return objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:", CDVStringByAddingPercentEscapesForHREF_allowedCharacterSet);
}

- (uint64_t)CDVStringByAddingPercentEscapesForHREFIncludingPercent
{
  if (CDVStringByAddingPercentEscapesForHREFIncludingPercent_onceToken != -1)
    dispatch_once(&CDVStringByAddingPercentEscapesForHREFIncludingPercent_onceToken, &__block_literal_global_19);
  return objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:", CDVStringByAddingPercentEscapesForHREFIncludingPercent_allowedCharacterSet);
}

- (id)CDVStringByAppendingSlashIfNeeded
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

- (id)CDVStringByRemovingTerminatingSlashIfNeeded
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

+ (__CFString)CDVStringWithNumberOfSpaces:()CoreDAVExtensions
{
  _BYTE *v4;
  _BYTE *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;

  if (a3 < 0xD)
  {
    if (a3 - 1 > 0xB)
      v6 = &stru_24C1DBD70;
    else
      v6 = off_24C1D9F88[a3 - 1];
  }
  else
  {
    v4 = malloc_type_malloc(a3 + 1, 0x100004077774924uLL);
    if (v4)
    {
      v5 = v4;
      memset(v4, 32, a3);
      v5[a3] = 0;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v5, 1);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      free(v5);
    }
    else
    {
      v6 = 0;
    }
  }
  if (v6)
    v7 = v6;
  else
    v7 = &stru_24C1DBD70;
  v8 = v7;

  return v8;
}

- (BOOL)CDVIsHTTPStatusLineWithStatusCode:()CoreDAVExtensions
{
  uint64_t v4;

  v4 = CDVHTTPStatusCodeFromStatusLine(a1);
  return v4 && v4 == a3;
}

- (uint64_t)CDVStringByAddingPercentEscapesForUserOrPassword
{
  if (CDVStringByAddingPercentEscapesForUserOrPassword_onceToken != -1)
    dispatch_once(&CDVStringByAddingPercentEscapesForUserOrPassword_onceToken, &__block_literal_global_46);
  return objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:", CDVStringByAddingPercentEscapesForUserOrPassword_allowedCharacterSet);
}

- (__CFString)CDVStringByXMLQuoting
{
  const __CFAllocator *v2;
  __CFString *Mutable;
  __CFCharacterSet *v4;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  int64_t v8;
  CFIndex v9;
  CFIndex v10;
  const UniChar *v11;
  int64_t v12;
  UniChar v13;
  int v14;
  const __CFString *v15;
  const __CFString *v16;
  int64_t v17;
  int64_t v19;
  const __CFString *v20;
  const __CFString *v21;
  _OWORD v23[8];
  CFStringRef theString;
  const UniChar *v25;
  const char *v26;
  uint64_t v27;
  CFIndex v28;
  int64_t v29;
  int64_t v30;
  CFRange v31;
  CFRange v32;
  CFRange v33;

  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  v4 = CFCharacterSetCreateMutable(v2);
  Length = CFStringGetLength(a1);
  CFCharacterSetAddCharactersInString(v4, CFSTR("&<>'\"));
  theString = a1;
  v27 = 0;
  v28 = Length;
  CharactersPtr = CFStringGetCharactersPtr(a1);
  CStringPtr = 0;
  v25 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
  memset(v23, 0, sizeof(v23));
  v29 = 0;
  v30 = 0;
  v26 = CStringPtr;
  if (Length >= 1)
  {
    v8 = 0;
    v9 = 0;
    while (1)
    {
      v10 = v28;
      if (v28 <= v8)
      {
        v13 = 0;
      }
      else
      {
        v11 = v25;
        if (v25)
        {
          v12 = v27 + v8;
LABEL_8:
          v13 = v11[v12];
          goto LABEL_10;
        }
        if (!v26)
        {
          v17 = v29;
          if (v30 <= v8 || v29 > v8)
          {
            v19 = v8 - 4;
            if ((unint64_t)v8 < 4)
              v19 = 0;
            if (v19 + 64 < v28)
              v10 = v19 + 64;
            v29 = v19;
            v30 = v10;
            v31.location = v27 + v19;
            v31.length = v10 - v19;
            CFStringGetCharacters(theString, v31, (UniChar *)v23);
            v17 = v29;
          }
          v12 = v8 - v17;
          v11 = (const UniChar *)v23;
          goto LABEL_8;
        }
        v13 = v26[v27 + v8];
      }
LABEL_10:
      v14 = v13;
      if (CFCharacterSetIsCharacterMember(v4, v13))
      {
        v32.length = v8 - v9;
        v32.location = v9;
        v15 = CFStringCreateWithSubstring(v2, a1, v32);
        CFStringAppend(Mutable, v15);
        CFRelease(v15);
        if (v14 <= 38)
        {
          if (v14 == 34)
          {
            v16 = CFSTR("&quot;");
          }
          else
          {
            v16 = CFSTR("&amp;");
            if (v14 != 38)
              goto LABEL_26;
          }
        }
        else
        {
          switch(v14)
          {
            case '\'':
              v16 = CFSTR("&apos;");
              break;
            case '>':
              v16 = CFSTR("&gt;");
              break;
            case '<':
              v16 = CFSTR("&lt;");
              break;
            default:
LABEL_26:
              v9 = ++v8;
              goto LABEL_27;
          }
        }
        CFStringAppend(Mutable, v16);
        goto LABEL_26;
      }
      ++v8;
LABEL_27:
      if (v8 == Length)
        goto LABEL_40;
    }
  }
  v9 = 0;
  Length = 0;
LABEL_40:
  v33.length = Length - v9;
  v33.location = v9;
  v20 = CFStringCreateWithSubstring(v2, a1, v33);
  if (v20)
  {
    v21 = v20;
    CFStringAppend(Mutable, v20);
    CFRelease(v21);
  }
  CFRelease(v4);
  return Mutable;
}

- (__CFString)CDVStringByXMLUnquoting
{
  const __CFString *v1;
  const __CFAllocator *v2;
  CFIndex Length;
  __CFDictionary *Mutable;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  CFMutableStringRef v7;
  __CFString *v8;
  CFIndex v9;
  CFIndex v10;
  CFIndex v11;
  UniChar *v12;
  CFIndex v13;
  UniChar v14;
  int64_t v15;
  CFIndex v16;
  const __CFString *v17;
  CFIndex v18;
  UniChar *v19;
  CFIndex v20;
  UniChar v21;
  CFIndex v22;
  CFIndex v23;
  CFIndex v24;
  UniChar *v25;
  int64_t v26;
  unsigned int v27;
  int64_t v28;
  int64_t v29;
  uint64_t v30;
  CFIndex v31;
  UniChar v32;
  CFIndex v33;
  uint64_t v34;
  CFIndex v35;
  int64_t v36;
  int64_t v37;
  char v38;
  CFIndex v39;
  CFIndex v40;
  CFIndex v41;
  UniChar *v42;
  int64_t v43;
  int v44;
  int64_t v45;
  int64_t v46;
  int64_t i;
  uint64_t v48;
  int v49;
  char v50;
  char v51;
  CFIndex v52;
  CFIndex v53;
  uint64_t v54;
  CFIndex v55;
  int64_t v56;
  int64_t v57;
  CFStringRef v58;
  const __CFString *Value;
  const __CFString *v60;
  __CFString *v61;
  __CFString *v62;
  CFIndex v63;
  CFIndex v64;
  CFIndex v65;
  CFIndex v66;
  CFIndex v67;
  const __CFString *v68;
  const __CFAllocator *v70;
  const __CFString *v71;
  __CFString *v72;
  const __CFDictionary *theDict;
  UniChar chars[2];
  UniChar buffer[8];
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  CFStringRef v83;
  UniChar *v84;
  const char *v85;
  uint64_t v86;
  CFIndex v87;
  CFIndex v88;
  CFIndex v89;
  CFRange v90;
  CFRange v91;
  CFRange v92;
  CFRange v93;
  CFRange v94;
  CFRange v95;
  CFRange v96;
  CFRange v97;
  CFRange v98;
  CFRange v99;

  v1 = a1;
  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  *(_OWORD *)buffer = 0u;
  v76 = 0u;
  Length = CFStringGetLength(a1);
  Mutable = CFDictionaryCreateMutable(v2, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionaryAddValue(Mutable, CFSTR("amp"), CFSTR("&"));
  CFDictionaryAddValue(Mutable, CFSTR("quot"), CFSTR("\"));
  CFDictionaryAddValue(Mutable, CFSTR("lt"), CFSTR("<"));
  CFDictionaryAddValue(Mutable, CFSTR("gt"), CFSTR(">"));
  theDict = Mutable;
  CFDictionaryAddValue(Mutable, CFSTR("apos"), CFSTR("'"));
  v83 = v1;
  v86 = 0;
  v87 = Length - 1;
  CharactersPtr = CFStringGetCharactersPtr(v1);
  CStringPtr = 0;
  v84 = (UniChar *)CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(v1, 0x600u);
  v85 = CStringPtr;
  v88 = 0;
  v89 = 0;
  v7 = CFStringCreateMutable(v2, 0);
  v8 = v7;
  if (Length >= 1)
  {
    v9 = 0;
    v10 = 0;
    v72 = v7;
    v70 = v2;
    v71 = v1;
    while (1)
    {
      if (v10 < 0 || (v11 = v87, v87 <= v10))
      {
        v15 = v10 + 1;
        goto LABEL_11;
      }
      v12 = v84;
      if (v84)
      {
        v13 = v86 + v10;
      }
      else
      {
        if (v85)
        {
          v14 = v85[v86 + v10];
          goto LABEL_15;
        }
        if (v89 <= v10 || (v22 = v88, v88 > v10))
        {
          v23 = v10 - 4;
          if ((unint64_t)v10 < 4)
            v23 = 0;
          if (v23 + 64 < v87)
            v11 = v23 + 64;
          v88 = v23;
          v89 = v11;
          v90.location = v86 + v23;
          v90.length = v11 - v23;
          CFStringGetCharacters(v83, v90, buffer);
          v22 = v88;
        }
        v13 = v10 - v22;
        v12 = buffer;
      }
      v14 = v12[v13];
LABEL_15:
      v16 = v10 + 1;
      if (v14 == 38)
      {
        if (v10 > v9)
        {
          v96.location = v9;
          v96.length = v10 - v9;
          v17 = CFStringCreateWithSubstring(v2, v1, v96);
          CFStringAppend(v8, v17);
          CFRelease(v17);
        }
        v18 = v87;
        if (v87 <= v16)
        {
          v21 = 0;
          v15 = v10 + 2;
        }
        else
        {
          v19 = v84;
          if (v84)
          {
            v20 = v86 + v16;
            goto LABEL_21;
          }
          if (v85)
          {
            v21 = v85[v86 + v16];
          }
          else
          {
            if (v89 <= v16 || (v39 = v88, v88 > v16))
            {
              v40 = v10 - 3;
              if ((unint64_t)v10 < 3)
                v40 = 0;
              if (v40 + 64 < v87)
                v18 = v40 + 64;
              v88 = v40;
              v89 = v18;
              v92.location = v86 + v40;
              v92.length = v18 - v40;
              CFStringGetCharacters(v83, v92, buffer);
              v39 = v88;
            }
            v20 = v16 - v39;
            v19 = buffer;
LABEL_21:
            v21 = v19[v20];
          }
          v15 = v10 + 2;
          if (v21 == 35)
          {
            v24 = v87;
            if (v87 <= v15)
            {
              v38 = 0;
              v21 = 0;
              v15 = v10 + 3;
            }
            else
            {
              v25 = v84;
              if (v84)
              {
                v26 = v86 + v15;
                goto LABEL_38;
              }
              if (v85)
              {
                v21 = v85[v86 + v15];
              }
              else
              {
                if (v89 <= v15 || (v64 = v88, v88 > v15))
                {
                  v65 = v10 - 2;
                  if ((unint64_t)v10 < 2)
                    v65 = 0;
                  if (v65 + 64 < v87)
                    v24 = v65 + 64;
                  v88 = v65;
                  v89 = v24;
                  v94.location = v86 + v65;
                  v94.length = v24 - v65;
                  CFStringGetCharacters(v83, v94, buffer);
                  v64 = v88;
                }
                v26 = v15 - v64;
                v25 = buffer;
LABEL_38:
                v21 = v25[v26];
              }
              v15 = v10 + 3;
              if (v21 == 120)
              {
                v41 = v87;
                if (v87 <= v15)
                {
                  v21 = 0;
                }
                else
                {
                  v42 = v84;
                  if (v84)
                  {
                    v43 = v86 + v15;
                    goto LABEL_80;
                  }
                  if (v85)
                  {
                    v21 = v85[v86 + v15];
                  }
                  else
                  {
                    if (v89 <= v15 || (v66 = v88, v88 > v15))
                    {
                      v67 = v10 - 1;
                      if (!v10)
                        v67 = 0;
                      if (v67 + 64 < v87)
                        v41 = v67 + 64;
                      v88 = v67;
                      v89 = v41;
                      v95.location = v86 + v67;
                      v95.length = v41 - v67;
                      CFStringGetCharacters(v83, v95, buffer);
                      v66 = v88;
                    }
                    v43 = v15 - v66;
                    v42 = buffer;
LABEL_80:
                    v21 = v42[v43];
                  }
                }
                v15 = v10 + 4;
                v44 = 16;
                v38 = 1;
LABEL_85:
                v27 = 0;
                if (Length <= v15)
                  v45 = v15;
                else
                  v45 = Length;
                v46 = -v15;
                for (i = v15 + 64; ; ++i)
                {
                  if ((unint64_t)v15 >= 4)
                    v48 = 4;
                  else
                    v48 = v15;
                  if ((unsigned __int16)(v21 - 48) > 9u)
                  {
                    v50 = v38 ^ 1;
                    if ((unsigned __int16)(v21 - 97) > 5u)
                      v51 = 1;
                    else
                      v51 = v38 ^ 1;
                    if ((v51 & 1) != 0)
                    {
                      if ((unsigned __int16)(v21 - 65) > 5u)
                        v50 = 1;
                      if ((v50 & 1) != 0)
                      {
                        v2 = v70;
                        v1 = v71;
                        v16 = v10 + 1;
                        v8 = v72;
                        goto LABEL_40;
                      }
                      v49 = 16 * v27 - 55;
                    }
                    else
                    {
                      v49 = 16 * v27 - 87;
                    }
                  }
                  else
                  {
                    v49 = v27 * v44 - 48;
                  }
                  v27 = v49 + v21;
                  if (v45 == v15)
                  {
                    v15 = v45;
                    v2 = v70;
                    v1 = v71;
                    v16 = v10 + 1;
                    v8 = v72;
                    goto LABEL_121;
                  }
                  if (v15 < 0 || (v52 = v87, v87 <= v15))
                  {
                    v21 = 0;
                  }
                  else if (v84)
                  {
                    v21 = v84[v15 + v86];
                  }
                  else if (v85)
                  {
                    v21 = v85[v86 + v15];
                  }
                  else
                  {
                    if (v89 <= v15 || (v53 = v88, v88 > v15))
                    {
                      v54 = v48 + v46;
                      v55 = i - v48;
                      v56 = v15 - v48;
                      v57 = v56 + 64;
                      if (v56 + 64 >= v87)
                        v57 = v87;
                      v88 = v56;
                      v89 = v57;
                      if (v87 >= v55)
                        v52 = v55;
                      v93.length = v52 + v54;
                      v93.location = v56 + v86;
                      CFStringGetCharacters(v83, v93, buffer);
                      v53 = v88;
                    }
                    v21 = buffer[v15 - v53];
                  }
                  ++v15;
                  --v46;
                }
              }
              v38 = 0;
            }
            v44 = 10;
            goto LABEL_85;
          }
        }
        v27 = 0xFFFF;
LABEL_40:
        if (v21 != 59 && v15 < Length)
        {
          v28 = -v15;
          v29 = v15 + 64;
          do
          {
            if ((unint64_t)v15 >= 4)
              v30 = 4;
            else
              v30 = v15;
            if (v15 < 0 || (v31 = v87, v87 <= v15))
            {
              v32 = 0;
            }
            else if (v84)
            {
              v32 = v84[v15 + v86];
            }
            else if (v85)
            {
              v32 = v85[v86 + v15];
            }
            else
            {
              if (v89 <= v15 || (v33 = v88, v88 > v15))
              {
                v34 = v30 + v28;
                v35 = v29 - v30;
                v36 = v15 - v30;
                v37 = v36 + 64;
                if (v36 + 64 >= v87)
                  v37 = v87;
                v88 = v36;
                v89 = v37;
                if (v87 >= v35)
                  v31 = v35;
                v91.length = v31 + v34;
                v91.location = v36 + v86;
                CFStringGetCharacters(v83, v91, buffer);
                v33 = v88;
              }
              v32 = buffer[v15 - v33];
            }
            ++v15;
            if (v32 == 59)
              break;
            --v28;
            ++v29;
          }
          while (v15 < Length);
          v8 = v72;
        }
LABEL_121:
        if (v27 == 0xFFFF)
        {
          v97.length = v15 - v10 - 2;
          v97.location = v16;
          v58 = CFStringCreateWithSubstring(v2, v1, v97);
          Value = (const __CFString *)CFDictionaryGetValue(theDict, v58);
          if (Value)
          {
            v60 = Value;
            v61 = v8;
          }
          else
          {
            CFRelease(v58);
            v98.location = v10;
            v98.length = v15 - v10;
            v58 = CFStringCreateWithSubstring(v2, v1, v98);
            v61 = v8;
            v60 = v58;
          }
          CFStringAppend(v61, v60);
          CFRelease(v58);
        }
        else
        {
          if (v27 < 0x10000)
          {
            chars[0] = v27;
            v62 = v8;
            v63 = 1;
          }
          else
          {
            chars[0] = ((v27 + 67043328) >> 10) - 10240;
            chars[1] = v27 & 0x3FF | 0xDC00;
            v62 = v8;
            v63 = 2;
          }
          CFStringAppendCharacters(v62, chars, v63);
        }
        v9 = v15;
        goto LABEL_11;
      }
      v15 = v10 + 1;
LABEL_11:
      v10 = v15;
      if (v15 >= Length)
        goto LABEL_151;
    }
  }
  v15 = 0;
  v9 = 0;
LABEL_151:
  if (v9 < Length)
  {
    v99.length = v15 - v9;
    v99.location = v9;
    v68 = CFStringCreateWithSubstring(v2, v1, v99);
    CFStringAppend(v8, v68);
    CFRelease(v68);
  }
  CFRelease(theDict);
  return v8;
}

+ (id)CDVPreconditionHeaderValueWithCTag:()CoreDAVExtensions pathTag:
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;

  v5 = a4;
  objc_msgSend(a3, "CDVStringByAddingPercentEscapesForHREF");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@> (<%@ctag/%@>)"), v5, CFSTR("http://calendarserver.org/ns/"), v6);
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(<%@ctag/%@>)"), CFSTR("http://calendarserver.org/ns/"), v6, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)CDVPreconditionHeaderValueWithCTag:()CoreDAVExtensions
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "CDVPreconditionHeaderValueWithCTag:pathTag:", a3, 0);
}

@end
