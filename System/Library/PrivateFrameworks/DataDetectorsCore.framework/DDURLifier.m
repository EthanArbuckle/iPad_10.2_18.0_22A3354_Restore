@implementation DDURLifier

+ (id)urlMatchesForString:(id)a3
{
  return (id)objc_msgSend(a1, "urlMatchesForString:phoneNumberTypes:", a3, 2);
}

+ (id)urlMatchesForString:(id)a3 includingTel:(BOOL)a4
{
  uint64_t v4;

  if (a4)
    v4 = 2;
  else
    v4 = 0;
  return (id)objc_msgSend(a1, "urlMatchesForString:phoneNumberTypes:", a3, v4);
}

+ (id)urlMatchesForString:(id)a3 phoneNumberTypes:(unint64_t)a4
{
  char v4;
  void *v7;
  uint64_t v8;
  const __CFArray *v9;
  CFIndex Count;
  CFIndex i;
  const void *ValueAtIndex;
  uint64_t v13;
  uint64_t v14;
  uint64_t RangeForURLification;
  uint64_t v16;
  DDURLMatch *v17;
  _QWORD block[6];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v4 = a4;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (objc_msgSend(a3, "length"))
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    v8 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __51__DDURLifier_urlMatchesForString_phoneNumberTypes___block_invoke;
    v20[3] = &unk_1E3C95AC0;
    v20[4] = a1;
    if (urlMatchesForString_phoneNumberTypes__sOnce != -1)
      dispatch_once(&urlMatchesForString_phoneNumberTypes__sOnce, v20);
    if (urlMatchesForString_phoneNumberTypes__sOnce_20 != -1)
      dispatch_once(&urlMatchesForString_phoneNumberTypes__sOnce_20, &__block_literal_global_1392);
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __51__DDURLifier_urlMatchesForString_phoneNumberTypes___block_invoke_3;
    block[3] = &unk_1E3C95578;
    block[4] = a3;
    block[5] = &v21;
    dispatch_sync((dispatch_queue_t)urlMatchesForString_phoneNumberTypes__sQueue, block);
    v9 = (const __CFArray *)v22[3];
    if (v9)
    {
      Count = CFArrayGetCount(v9);
      if (Count >= 1)
      {
        for (i = 0; i != Count; ++i)
        {
          ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v22[3], i);
          v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), i);
          if (DDResultGetCategory((uint64_t)ValueAtIndex) - 1 <= 1)
          {
            v14 = DDURLStringForResult((uint64_t)ValueAtIndex, v13, v4, 0, 0);
            if (v14)
            {
              RangeForURLification = DDResultGetRangeForURLification((uint64_t)ValueAtIndex);
              v17 = -[DDURLMatch initWithRange:url:]([DDURLMatch alloc], "initWithRange:url:", RangeForURLification, v16, v14);
              objc_msgSend(v7, "addObject:", v17);

            }
          }
        }
      }
      CFRelease((CFTypeRef)v22[3]);
    }
    _Block_object_dispose(&v21, 8);
  }
  return v7;
}

+ (id)urlMatchesForString:(id)a3 usingScanner:(__DDScanner *)a4 withPhoneNumberTypes:(unint64_t)a5 referenceDate:(id)a6 timeZone:(id)a7 storingResultsIn:(id)a8
{
  char v9;
  const __CFArray *v11;
  const __CFArray *v12;
  CFIndex Count;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  CFIndex i;
  _QWORD *ValueAtIndex;
  uint64_t v20;
  uint64_t v21;
  DDURLMatch *v22;

  v9 = a5;
  DDScannerScanString((uint64_t)a4, (CFStringRef)a3);
  v11 = DDScannerCopyResultsWithOptions((uint64_t)a4, 0x7C5u);
  if (!v11)
    return 0;
  v12 = v11;
  Count = CFArrayGetCount(v11);
  if (Count)
  {
    v14 = Count;
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", Count);
    v16 = objc_msgSend(a8, "count");
    if (v14 >= 1)
    {
      v17 = v16;
      for (i = 0; i != v14; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v12, i);
        v20 = DDURLStringForResult((uint64_t)ValueAtIndex, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v17), v9, a6, (const __CFTimeZone *)a7);
        if (v20)
        {
          v21 = v20;
          ++v17;
          objc_msgSend(a8, "addObject:", ValueAtIndex);
          v22 = -[DDURLMatch initWithRange:url:]([DDURLMatch alloc], "initWithRange:url:", ValueAtIndex[4], ValueAtIndex[5], v21);
          objc_msgSend(v15, "addObject:", v22);

        }
      }
    }
  }
  else
  {
    v15 = 0;
  }
  CFRelease(v12);
  return v15;
}

+ (BOOL)urlIfyTextNode:(id)a3 inNode:(id)a4 forMatches:(id)a5
{
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unsigned int v11;
  id v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;

  v8 = objc_msgSend(a5, "count");
  if (v8)
  {
    v9 = 0;
    v10 = 0;
    v11 = 1;
    v12 = a3;
    do
    {
      v13 = (void *)objc_msgSend(a5, "objectAtIndex:", v9);
      v14 = objc_msgSend(v13, "range");
      if (v14 >= v10)
      {
        v16 = v14;
        v17 = v15;
        if (v14 < objc_msgSend((id)objc_msgSend(v12, "data"), "length") + v10)
        {
          if (v16 != v10)
            a3 = (id)objc_msgSend(v12, "splitText:", (v16 - v10));
          if (v17 < objc_msgSend((id)objc_msgSend(a3, "data"), "length"))
            v12 = (id)objc_msgSend(a3, "splitText:", v17);
          v10 = v16 + v17;
          v18 = (void *)objc_msgSend((id)objc_msgSend(a3, "ownerDocument"), "createElement:", CFSTR("a"));
          objc_msgSend(v18, "setAttribute:value:", CFSTR("href"), objc_msgSend(v13, "url"));
          objc_msgSend(a4, "insertBefore:refChild:", v18, a3);
          objc_msgSend(v18, "appendChild:", a3);
          a3 = v12;
        }
      }
      v9 = v11;
    }
    while (v8 > v11++);
  }
  return v8 != 0;
}

+ (BOOL)urlIfyNode:(id)a3 phoneNumberTypes:(unint64_t)a4
{
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;

  if (shouldURLifyNode(a3) && (v7 = objc_msgSend(a3, "firstChild")) != 0)
  {
    v8 = (void *)v7;
    v9 = 0;
    do
    {
      v10 = objc_msgSend(v8, "nextSibling");
      v9 |= objc_msgSend(a1, "urlIfyNode:phoneNumberTypes:", v8, a4);
      if (objc_msgSend(v8, "nodeType") == 3)
        v9 |= objc_msgSend(a1, "urlIfyTextNode:inNode:forMatches:", v8, a3, +[DDURLifier urlMatchesForString:phoneNumberTypes:](DDURLifier, "urlMatchesForString:phoneNumberTypes:", objc_msgSend(v8, "nodeValue"), a4));
      v8 = (void *)v10;
    }
    while (v10);
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return v9 & 1;
}

+ (BOOL)urlIfyNode:(id)a3
{
  return objc_msgSend(a1, "urlIfyNode:phoneNumberTypes:", a3, 2);
}

+ (id)urlIfyNode:(id)a3 usingScanner:(__DDScanner *)a4 phoneNumberTypes:(unint64_t)a5
{
  return (id)objc_msgSend(a1, "urlIfyNode:usingScanner:phoneNumberTypes:withReferenceDate:andTimeZone:", a3, a4, a5, 0, 0);
}

+ (id)urlIfyNode:(id)a3 usingScanner:(__DDScanner *)a4 phoneNumberTypes:(unint64_t)a5 withReferenceDate:(id)a6 andTimeZone:(id)a7
{
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;

  if (!a4)
  {
    if (urlIfyNode_usingScanner_phoneNumberTypes_withReferenceDate_andTimeZone__sOnce == -1)
      return 0;
    dispatch_once(&urlIfyNode_usingScanner_phoneNumberTypes_withReferenceDate_andTimeZone__sOnce, &__block_literal_global_31);
    return 0;
  }
  if (!shouldURLifyNode(a3))
    return 0;
  if (a6)
  {
    if (a7)
      goto LABEL_5;
  }
  else
  {
    a6 = (id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
    if (a7)
      goto LABEL_5;
  }
  a7 = (id)objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
LABEL_5:
  v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = objc_msgSend(a3, "firstChild");
  if (v14)
  {
    v15 = (void *)v14;
    do
    {
      v16 = objc_msgSend(v15, "nextSibling");
      objc_msgSend(v13, "addObjectsFromArray:", objc_msgSend(a1, "urlIfyNode:usingScanner:phoneNumberTypes:withReferenceDate:andTimeZone:", v15, a4, a5, a6, a7));
      if (objc_msgSend(v15, "nodeType") == 3)
        objc_msgSend(a1, "urlIfyTextNode:inNode:forMatches:", v15, a3, objc_msgSend(a1, "urlMatchesForString:usingScanner:withPhoneNumberTypes:referenceDate:timeZone:storingResultsIn:", objc_msgSend(v15, "nodeValue"), a4, a5, a6, a7, v13));
      v15 = (void *)v16;
    }
    while (v16);
  }
  return v13;
}

void __85__DDURLifier_urlIfyNode_usingScanner_phoneNumberTypes_withReferenceDate_andTimeZone___block_invoke()
{
  DDError(CFSTR("+[DDURLifier urlIfyNode:usingScanner:phoneNumberTypes:] called with NULL scanner. Should not happen"));
}

uint64_t __51__DDURLifier_urlMatchesForString_phoneNumberTypes___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(a1 + 32);
  result = objc_opt_class();
  if (v1 == result)
  {
    result = DDScannerCreateWithTypeAndLocale(1, 0, 0);
    _sharedURLifier = result;
  }
  return result;
}

CFArrayRef __51__DDURLifier_urlMatchesForString_phoneNumberTypes___block_invoke_3(uint64_t a1)
{
  CFArrayRef result;

  result = (CFArrayRef)_sharedURLifier;
  if (_sharedURLifier)
  {
    result = (CFArrayRef)DDScannerScanString(_sharedURLifier, *(CFStringRef *)(a1 + 32));
    if ((_DWORD)result)
    {
      result = DDScannerCopyResultsWithOptions(_sharedURLifier, 0x7C5u);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
    }
  }
  return result;
}

dispatch_queue_t __51__DDURLifier_urlMatchesForString_phoneNumberTypes___block_invoke_2()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.datadetectors.urlifier", 0);
  urlMatchesForString_phoneNumberTypes__sQueue = (uint64_t)result;
  return result;
}

@end
