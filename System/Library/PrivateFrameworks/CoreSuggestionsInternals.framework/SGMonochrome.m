@implementation SGMonochrome

+ (id)stringByExtractingPlainTextFromHTML:(id)a3 tableDelimiters:(BOOL)a4 stripLinks:(BOOL)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  const char *CStringPtr;
  void *v15;
  id v17;
  const char *v18;
  int v19;
  UInt8 *v20;
  UInt8 *v21;
  xmlParserCtxt *PushParserCtxt;
  xmlParserCtxt *v23;
  xmlDoc *myDoc;
  xmlNodePtr RootElement;
  int v26;
  __CFString *v27;
  int v28;
  int v29;
  int v30;
  id v31;
  UInt8 *bytes;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  _OWORD v38[3];
  uint64_t v39;

  v7 = a3;
  if (!v7)
    return 0;
  v8 = v7;
  v9 = (void *)MEMORY[0x1C3BD4F6C]();
  if (stringByExtractingPlainTextFromHTML_tableDelimiters_stripLinks__onceToken != -1)
    dispatch_once(&stringByExtractingPlainTextFromHTML_tableDelimiters_stripLinks__onceToken, &__block_literal_global_2905);
  objc_msgSend((id)stringByExtractingPlainTextFromHTML_tableDelimiters_stripLinks__htmlNodeRegex, "matchesInString:options:range:", v8, 0, 0, objc_msgSend(v8, "length"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "count") || (unint64_t)objc_msgSend(v10, "count") >= 2)
  {
    v11 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(CFSTR("<html>"), "stringByAppendingString:", v8);
    v12 = objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v11);
    v8 = (void *)v12;
  }
  v13 = v8;
  CStringPtr = CFStringGetCStringPtr(v13, 0x8000100u);
  if (CStringPtr)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", CStringPtr, strlen(CStringPtr), 0);
  }
  else
  {
    -[__CFString dataUsingEncoding:](v13, "dataUsingEncoding:", 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17 = objc_retainAutorelease(v15);
  v18 = (const char *)objc_msgSend(v17, "bytes");
  v19 = objc_msgSend(v17, "length");
  memset(v38, 0, sizeof(v38));
  v39 = 0;
  v20 = (UInt8 *)malloc_type_malloc(0x400uLL, 0xF7BB4A3uLL);
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v31);
  }
  v21 = v20;
  bytes = v20;
  v33 = 0x40000000000;
  v34 = 2;
  v36 = 0;
  v35 = 0;
  v37 = 0;
  memset((char *)v38 + 4, 255, 20);
  memset((char *)&v38[1] + 12, 0, 20);
  LOBYTE(v39) = a4;
  BYTE1(v39) = a5;
  if (v18)
  {
    PushParserCtxt = htmlCreatePushParserCtxt(0, 0, 0, 0, 0, XML_CHAR_ENCODING_UTF8);
    if (PushParserCtxt)
    {
      v23 = PushParserCtxt;
      htmlCtxtUseOptions(PushParserCtxt, 2165089);
      htmlParseChunk(v23, v18, v19, 1);
      myDoc = v23->myDoc;
      if (myDoc)
      {
        RootElement = xmlDocGetRootElement(v23->myDoc);
        if (RootElement)
          processTree((uint64_t)&bytes, (uint64_t)RootElement);
        else
          DWORD2(v38[2]) = 2;
        xmlFreeDoc(myDoc);
      }
      else
      {
        DWORD2(v38[2]) = 1;
      }
      MEMORY[0x1C3BD4E1C](v23);
      if (DWORD2(v38[2]))
      {
        v21 = bytes;
        goto LABEL_25;
      }
      if (v34 == 1)
      {
        v28 = v33;
        if ((int)v33 >= 1)
          v29 = 1;
        else
          v29 = v33;
      }
      else
      {
        if (v34 != 2)
        {
          v30 = v33;
          goto LABEL_37;
        }
        v28 = v33;
        if ((int)v33 >= 2)
          v29 = 2;
        else
          v29 = v33;
      }
      v30 = v28 - v29;
      LODWORD(v33) = v30;
LABEL_37:
      v27 = (__CFString *)CFStringCreateWithBytesNoCopy(0, bytes, v30, 0x8000100u, 0, (CFAllocatorRef)*MEMORY[0x1E0C9AE10]);
      goto LABEL_26;
    }
    v26 = 4;
  }
  else
  {
    v26 = 5;
  }
  DWORD2(v38[2]) = v26;
LABEL_25:
  free(v21);
  v27 = 0;
LABEL_26:
  free(*(void **)&v38[2]);
  CFRelease(v13);

  objc_autoreleasePoolPop(v9);
  return v27;
}

+ (id)stringByExtractingPlainTextFromHTML:(id)a3
{
  return +[SGMonochrome stringByExtractingPlainTextFromHTML:tableDelimiters:stripLinks:](SGMonochrome, "stringByExtractingPlainTextFromHTML:tableDelimiters:stripLinks:", a3, 0, 0);
}

void __79__SGMonochrome_stringByExtractingPlainTextFromHTML_tableDelimiters_stripLinks___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("<html.*?>"), 1, 0);
  v1 = (void *)stringByExtractingPlainTextFromHTML_tableDelimiters_stripLinks__htmlNodeRegex;
  stringByExtractingPlainTextFromHTML_tableDelimiters_stripLinks__htmlNodeRegex = v0;

}

@end
