void sub_220000B0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220000E30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22000116C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMAImageCaptioningCopyCaptionWithSourceSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (MediaAccessibilityLibraryCore_frameworkLibrary)
  {
    v2 = (void *)MediaAccessibilityLibraryCore_frameworkLibrary;
  }
  else
  {
    MediaAccessibilityLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)MediaAccessibilityLibraryCore_frameworkLibrary;
    if (!MediaAccessibilityLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "MAImageCaptioningCopyCaptionWithSource");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getMAImageCaptioningCopyCaptionWithSourceSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_220002228(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_220002D84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id *location, id *a16)
{
  id *v16;
  id *v17;
  id *v18;
  uint64_t v19;

  objc_destroyWeak(v16);
  objc_destroyWeak(v18);
  objc_destroyWeak(location);
  objc_destroyWeak(a16);
  objc_destroyWeak(v17);
  objc_destroyWeak((id *)(v19 - 112));
  _Unwind_Resume(a1);
}

void sub_2200030A4(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_220003264(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2200033F4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_220004500()
{
  objc_end_catch();
  JUMPOUT(0x220004508);
}

void sub_220004638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220006AF4(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_22000949C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  id *v16;
  uint64_t v17;

  objc_destroyWeak(v16);
  _Block_object_dispose(&a16, 8);
  objc_destroyWeak((id *)(v17 - 40));
  _Unwind_Resume(a1);
}

void sub_220009630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_22000979C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_220009920(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22000AB88(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_22000EDAC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 120));
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

double maxImageArea()
{
  void *v0;
  double v1;
  double v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "nativeBounds");
  v2 = v1;
  v4 = v3;

  return fmax(v2 * v4, 3307500.0);
}

uint64_t _PDFObjectRetain(uint64_t a1, uint64_t a2)
{
  return a2;
}

CFStringRef _PDFObjectCopyDescription(uint64_t a1)
{
  return CFStringCreateWithFormat(0, 0, CFSTR("%p"), a1);
}

BOOL _PDFObjectEqual(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void _dictionaryApplierFunction(uint64_t a1, CGPDFObject *a2, void *a3)
{
  id v5;
  void *v6;
  CGPDFObjectType Type;
  uint64_t v8;
  void *v9;
  CGPDFDictionaryRef Dictionary;
  CGPDFDictionary *v11;
  CFDataRef v12;
  CFDataRef v13;
  CGPDFDataFormat format;
  CGPDFStreamRef value;
  CGPDFDictionaryRef dict;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/%s"), a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  value = 0;
  dict = 0;
  Type = CGPDFObjectGetType(a2);
  if ((Type - 1) >= 7)
  {
    if (Type == kCGPDFObjectTypeDictionary)
    {
      if (CGPDFObjectGetValue(a2, kCGPDFObjectTypeDictionary, &dict)
        && !CFSetContainsValue((CFSetRef)seenObjects, dict))
      {
        CFSetAddValue((CFMutableSetRef)seenObjects, dict);
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        CGPDFDictionaryApplyFunction(dict, (CGPDFDictionaryApplierFunction)_dictionaryApplierFunction, v9);
        goto LABEL_4;
      }
    }
    else if (Type == kCGPDFObjectTypeStream && CGPDFObjectGetValue(a2, kCGPDFObjectTypeStream, &value))
    {
      Dictionary = CGPDFStreamGetDictionary(value);
      if (Dictionary)
      {
        v11 = Dictionary;
        CFSetAddValue((CFMutableSetRef)seenObjects, Dictionary);
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        CGPDFDictionaryApplyFunction(v11, (CGPDFDictionaryApplierFunction)_dictionaryApplierFunction, v9);
        if (!objc_msgSend(v9, "count"))
          goto LABEL_5;
        format = CGPDFDataFormatRaw;
        v12 = CGPDFStreamCopyData(value, &format);
        if (!v12)
          goto LABEL_5;
        v13 = v12;
        objc_msgSend(v9, "setObject:forKey:", v12, CFSTR("/%Stream"));
        CFRelease(v13);
LABEL_4:
        objc_msgSend(v5, "setValue:forKey:", v9, v6);
LABEL_5:

      }
    }
  }
  else
  {
    _objectFromPDFObject(a2);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      goto LABEL_4;
    }
  }

}

__CFString *_objectFromPDFObject(CGPDFObject *a1)
{
  id v2;
  void *v3;
  __CFString *v5;
  size_t Count;
  void *v7;
  size_t i;
  void *v9;
  CGPDFObjectRef v10;
  CGPDFArrayRef array;
  CGPDFStringRef string;
  uint64_t v13;
  double v14;
  uint64_t v15;
  char value;

  value = 0;
  v14 = 0.0;
  v15 = 0;
  string = 0;
  v13 = 0;
  array = 0;
  switch(CGPDFObjectGetType(a1))
  {
    case kCGPDFObjectTypeNull:
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v2 = (id)objc_claimAutoreleasedReturnValue();
      return (__CFString *)v2;
    case kCGPDFObjectTypeBoolean:
      if (!CGPDFObjectGetValue(a1, kCGPDFObjectTypeBoolean, &value))
        goto LABEL_28;
      if (value)
        v3 = (void *)MEMORY[0x24BDBD1C8];
      else
        v3 = (void *)MEMORY[0x24BDBD1C0];
      v2 = v3;
      return (__CFString *)v2;
    case kCGPDFObjectTypeInteger:
      if (!CGPDFObjectGetValue(a1, kCGPDFObjectTypeInteger, &v15))
        goto LABEL_28;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v15);
      v2 = (id)objc_claimAutoreleasedReturnValue();
      return (__CFString *)v2;
    case kCGPDFObjectTypeReal:
      if (!CGPDFObjectGetValue(a1, kCGPDFObjectTypeReal, &v14))
        goto LABEL_28;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v14);
      v2 = (id)objc_claimAutoreleasedReturnValue();
      return (__CFString *)v2;
    case kCGPDFObjectTypeName:
      if (!CGPDFObjectGetValue(a1, kCGPDFObjectTypeName, &v13))
        goto LABEL_28;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/%s"), v13);
      v2 = (id)objc_claimAutoreleasedReturnValue();
      return (__CFString *)v2;
    case kCGPDFObjectTypeString:
      if (!CGPDFObjectGetValue(a1, kCGPDFObjectTypeString, &string))
        goto LABEL_28;
      v5 = (__CFString *)CGPDFStringCopyTextString(string);
      if (v5)
        return v5;
      else
        return (__CFString *)0;
    case kCGPDFObjectTypeArray:
      if (!CGPDFObjectGetValue(a1, kCGPDFObjectTypeArray, &array))
        goto LABEL_28;
      Count = CGPDFArrayGetCount(array);
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", Count);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (Count)
      {
        for (i = 0; i != Count; ++i)
        {
          v10 = 0;
          if (CGPDFArrayGetObject(array, i, &v10))
          {
            _objectFromPDFObject(v10);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            if (v9)
              objc_msgSend(v7, "addObject:", v9);

          }
        }
      }
      return (__CFString *)v7;
    default:
LABEL_28:
      v7 = 0;
      return (__CFString *)v7;
  }
}

void sub_220012928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_220013154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_220017898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

id _dictionaryForPDFDictionary(CGPDFDictionary *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v7[0] = CFSTR("resultDict");
  v7[1] = CFSTR("visitedSet");
  v8[0] = v4;
  v8[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  CGPDFDictionaryApplyFunction(a1, (CGPDFDictionaryApplierFunction)_iterateDictionaryValueCallback, v5);
  return v4;
}

uint64_t _getStreams(const char *a1, uint64_t a2, CGPDFDictionaryRef *a3)
{
  uint64_t result;

  result = strncmp(a1, "On", 2uLL);
  if (!(_DWORD)result)
    return CGPDFDictionaryGetStream(*a3, a1, a3 + 1);
  return result;
}

void _iterateDictionaryValueCallback(uint64_t a1, CGPDFObject *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("resultDict"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("visitedSet"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", a1, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _objectForCGPDFObjectRefAndVisitedSet(a2, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v7);

  }
}

CGPDFObject *_objectForCGPDFObjectRefAndVisitedSet(CGPDFObject *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  CGPDFArray *v9;
  id v10;
  size_t Count;
  size_t i;
  void *v13;
  void *v14;
  CGPDFArray *v15;
  CGPDFObjectRef value;

  v3 = a2;
  v4 = v3;
  if (!v3)
  {
    NSLog(CFSTR("visitedSet must not be nil"));
    goto LABEL_7;
  }
  if (!a1)
    goto LABEL_8;
  objc_msgSend(v3, "objectForKey:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
LABEL_7:
    a1 = 0;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, a1);

  switch(CGPDFObjectGetType(a1))
  {
    case kCGPDFObjectTypeBoolean:
      LOBYTE(value) = 0;
      CGPDFObjectGetValue(a1, kCGPDFObjectTypeBoolean, &value);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", value);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    case kCGPDFObjectTypeInteger:
      value = 0;
      CGPDFObjectGetValue(a1, kCGPDFObjectTypeInteger, &value);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", value);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    case kCGPDFObjectTypeReal:
      value = 0;
      CGPDFObjectGetValue(a1, kCGPDFObjectTypeReal, &value);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)&value);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    case kCGPDFObjectTypeName:
      value = 0;
      CGPDFObjectGetValue(a1, kCGPDFObjectTypeName, &value);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", value, 4);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    case kCGPDFObjectTypeString:
      value = 0;
      CGPDFObjectGetValue(a1, kCGPDFObjectTypeString, &value);
      v7 = (uint64_t)CGPDFStringCopyTextString(value);
      goto LABEL_21;
    case kCGPDFObjectTypeArray:
      v15 = 0;
      CGPDFObjectGetValue(a1, kCGPDFObjectTypeArray, &v15);
      v9 = v15;
      v10 = v4;
      Count = CGPDFArrayGetCount(v9);
      a1 = (CGPDFObject *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", Count);
      if (Count)
      {
        for (i = 0; i != Count; ++i)
        {
          value = 0;
          CGPDFArrayGetObject(v9, i, &value);
          _objectForCGPDFObjectRefAndVisitedSet(value, v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            -[CGPDFObject setObject:atIndexedSubscript:](a1, "setObject:atIndexedSubscript:", v13, i);
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCEF8], "null");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[CGPDFObject setObject:atIndexedSubscript:](a1, "setObject:atIndexedSubscript:", v14, i);

          }
        }
      }

      break;
    case kCGPDFObjectTypeDictionary:
      value = 0;
      CGPDFObjectGetValue(a1, kCGPDFObjectTypeDictionary, &value);
      _dictionaryForPDFDictionary(value, v4);
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_21:
      a1 = (CGPDFObject *)v7;
      break;
    default:
      goto LABEL_7;
  }
LABEL_8:

  return a1;
}

void sub_2200193F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_22001A1A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22001A5B4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_22001A6B8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_22001ACA8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t DataDetectorsUILibrary()
{
  uint64_t v0;
  void *v2;

  if (!DataDetectorsUILibraryCore_frameworkLibrary)
    DataDetectorsUILibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = DataDetectorsUILibraryCore_frameworkLibrary;
  if (!DataDetectorsUILibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void sub_22001D138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

void *__getMAImageCaptioningSetCaptionIntoMetadataSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (MediaAccessibilityLibraryCore_frameworkLibrary_0)
  {
    v2 = (void *)MediaAccessibilityLibraryCore_frameworkLibrary_0;
  }
  else
  {
    MediaAccessibilityLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    v2 = (void *)MediaAccessibilityLibraryCore_frameworkLibrary_0;
    if (!MediaAccessibilityLibraryCore_frameworkLibrary_0)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "MAImageCaptioningSetCaptionIntoMetadata");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getMAImageCaptioningSetCaptionIntoMetadataSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

double akMedian(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unint64_t i;
  double v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;

  v2 = a2 - 1;
  v3 = (unint64_t)(a2 - 1) >> 1;
  if (a2 != 1)
  {
    v4 = 0;
    while (1)
    {
      v5 = v4 + 1;
      if (v2 == v4 + 1)
        break;
      v6 = (v4 + v2) >> 1;
      v7 = *(double *)(a1 + 8 * v6);
      v8 = *(double *)(a1 + 8 * v2);
      if (v7 <= v8)
      {
        v7 = *(double *)(a1 + 8 * v2);
      }
      else
      {
        *(double *)(a1 + 8 * v6) = v8;
        *(double *)(a1 + 8 * v2) = v7;
      }
      v9 = *(double *)(a1 + 8 * v4);
      if (v9 > v7)
      {
        *(double *)(a1 + 8 * v4) = v7;
        *(double *)(a1 + 8 * v2) = v9;
        v9 = *(double *)(a1 + 8 * v4);
      }
      v10 = *(double *)(a1 + 8 * v6);
      if (v10 > v9)
      {
        *(double *)(a1 + 8 * v6) = v9;
        *(double *)(a1 + 8 * v4) = v10;
        v10 = *(double *)(a1 + 8 * v6);
      }
      *(_QWORD *)(a1 + 8 * v6) = *(_QWORD *)(a1 + 8 * v5);
      *(double *)(a1 + 8 * v5) = v10;
      for (i = v2; ; *(double *)(a1 + 8 * i) = v14)
      {
        v12 = *(double *)(a1 + 8 * v4);
        do
        {
          v13 = a1 + 8 * v5++;
          v14 = *(double *)(v13 + 8);
        }
        while (v12 > v14);
        do
        {
          v15 = a1 + 8 * i--;
          v16 = *(double *)(v15 - 8);
        }
        while (v16 > v12);
        if (i < v5)
          break;
        *(double *)(a1 + 8 * v5) = v16;
      }
      *(double *)(a1 + 8 * v4) = v16;
      *(double *)(a1 + 8 * i) = v12;
      if (i <= v3)
        v4 = v5;
      if (i >= v3)
        v2 = i - 1;
      if (v2 <= v4)
        return *(double *)(a1 + 8 * v3);
    }
    v17 = *(double *)(a1 + 8 * v4);
    v18 = *(double *)(a1 + 8 * v2);
    if (v17 > v18)
    {
      *(double *)(a1 + 8 * v4) = v18;
      *(double *)(a1 + 8 * v2) = v17;
    }
  }
  return *(double *)(a1 + 8 * v3);
}

void generateRandomKey(_QWORD *__buf)
{
  BOOL v2;

  do
  {
    arc4random_buf(__buf, 0x10uLL);
    if (*__buf)
      v2 = 0;
    else
      v2 = __buf[1] == 0;
  }
  while (v2 || (*__buf & __buf[1]) == -1);
}

void sub_2200242DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t AKLog()
{
  return MEMORY[0x24BE039F0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

CCCryptorStatus CCCrypt(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x24BDAC0E8](*(_QWORD *)&op, *(_QWORD *)&alg, *(_QWORD *)&options, key, keyLength, iv, dataIn, dataInLength);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB0](allocator, capacity);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x24BDBBDC0](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDE0](allocator, theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x24BDBBE70](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x24BDBC3C0](theSet, value);
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x24BDBC3D0](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x24BDBC3E8](allocator, capacity, callBacks);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC540](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

void CFStringInsert(CFMutableStringRef str, CFIndex idx, CFStringRef insertedStr)
{
  MEMORY[0x24BDBC6B8](str, idx, insertedStr);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8A0](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8D8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x24BDBD920](context);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x24BDBD988]();
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x24BDBDA78](space, components);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBB8](name);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x24BDBDC20](space);
}

BOOL CGColorSpaceIsWideGamutRGB(CGColorSpaceRef a1)
{
  return MEMORY[0x24BDBDC58](a1);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

BOOL CGColorSpaceSupportsOutput(CGColorSpaceRef space)
{
  return MEMORY[0x24BDBDC70](space);
}

BOOL CGColorSpaceUsesExtendedRange(CGColorSpaceRef space)
{
  return MEMORY[0x24BDBDC78](space);
}

BOOL CGColorSpaceUsesITUR_2100TF(CGColorSpaceRef a1)
{
  return MEMORY[0x24BDBDC80](a1);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
  MEMORY[0x24BDBDD50](c, transform);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE70](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x24BDBDF30](c);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x24BDBDF58](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x24BDBDF70](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x24BDBDF78](c, sx, sy);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBDFD8](c, color);
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x24BDBE018](c, *(_QWORD *)&quality);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x24BDBE130](c, tx, ty);
}

CGDataConsumerRef CGDataConsumerCreateWithCFData(CFMutableDataRef data)
{
  return (CGDataConsumerRef)MEMORY[0x24BDBE148](data);
}

CGDataConsumerRef CGDataConsumerCreateWithURL(CFURLRef url)
{
  return (CGDataConsumerRef)MEMORY[0x24BDBE150](url);
}

void CGDataConsumerRelease(CGDataConsumerRef consumer)
{
  MEMORY[0x24BDBE160](consumer);
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x24BDBE168](provider);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE180](data);
}

CGDataProviderRef CGDataProviderCreateWithURL(CFURLRef url)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE1A0](url);
}

uint64_t CGDisplayListContextCreate()
{
  return MEMORY[0x24BDBE1F0]();
}

uint64_t CGDisplayListCreate()
{
  return MEMORY[0x24BDBE1F8]();
}

uint64_t CGDisplayListRelease()
{
  return MEMORY[0x24BDBE280]();
}

uint64_t CGDisplayListSetBoundingBox()
{
  return MEMORY[0x24BDBE290]();
}

CFStringRef CGFontCopyPostScriptName(CGFontRef font)
{
  return (CFStringRef)MEMORY[0x24BDBE2B0](font);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x24BDD9048](idst, image, properties);
}

void CGImageDestinationAddImageAndMetadata(CGImageDestinationRef idst, CGImageRef image, CGImageMetadataRef metadata, CFDictionaryRef options)
{
  MEMORY[0x24BDD9050](idst, image, metadata, options);
}

void CGImageDestinationAddImageFromSource(CGImageDestinationRef idst, CGImageSourceRef isrc, size_t index, CFDictionaryRef properties)
{
  MEMORY[0x24BDD9058](idst, isrc, index, properties);
}

BOOL CGImageDestinationCopyImageSource(CGImageDestinationRef idst, CGImageSourceRef isrc, CFDictionaryRef options, CFErrorRef *err)
{
  return MEMORY[0x24BDD9068](idst, isrc, options, err);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x24BDD9078](data, type, count, options);
}

CGImageDestinationRef CGImageDestinationCreateWithDataConsumer(CGDataConsumerRef consumer, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x24BDD9080](consumer, type, count, options);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x24BDD9088](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x24BDD9090](idst);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBE658](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

uint64_t CGImageGetSizeAfterOrientation()
{
  return MEMORY[0x24BDBE6D0]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

CGImageMetadataTagRef CGImageMetadataCopyTagWithPath(CGImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path)
{
  return (CGImageMetadataTagRef)MEMORY[0x24BDD90B0](metadata, parent, path);
}

CGMutableImageMetadataRef CGImageMetadataCreateMutable(void)
{
  return (CGMutableImageMetadataRef)MEMORY[0x24BDD90C8]();
}

CGMutableImageMetadataRef CGImageMetadataCreateMutableCopy(CGImageMetadataRef metadata)
{
  return (CGMutableImageMetadataRef)MEMORY[0x24BDD90D0](metadata);
}

void CGImageMetadataEnumerateTagsUsingBlock(CGImageMetadataRef metadata, CFStringRef rootPath, CFDictionaryRef options, CGImageMetadataTagBlock block)
{
  MEMORY[0x24BDD90E0](metadata, rootPath, options, block);
}

BOOL CGImageMetadataRegisterNamespaceForPrefix(CGMutableImageMetadataRef metadata, CFStringRef xmlns, CFStringRef prefix, CFErrorRef *err)
{
  return MEMORY[0x24BDD90E8](metadata, xmlns, prefix, err);
}

BOOL CGImageMetadataRemoveTagWithPath(CGMutableImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path)
{
  return MEMORY[0x24BDD90F0](metadata, parent, path);
}

BOOL CGImageMetadataSetTagWithPath(CGMutableImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path, CGImageMetadataTagRef tag)
{
  return MEMORY[0x24BDD90F8](metadata, parent, path, tag);
}

CFStringRef CGImageMetadataTagCopyName(CGImageMetadataTagRef tag)
{
  return (CFStringRef)MEMORY[0x24BDD9110](tag);
}

CFStringRef CGImageMetadataTagCopyPrefix(CGImageMetadataTagRef tag)
{
  return (CFStringRef)MEMORY[0x24BDD9118](tag);
}

CFTypeRef CGImageMetadataTagCopyValue(CGImageMetadataTagRef tag)
{
  return (CFTypeRef)MEMORY[0x24BDD9120](tag);
}

CGImageMetadataTagRef CGImageMetadataTagCreate(CFStringRef xmlns, CFStringRef prefix, CFStringRef name, CGImageMetadataType type, CFTypeRef value)
{
  return (CGImageMetadataTagRef)MEMORY[0x24BDD9128](xmlns, prefix, name, *(_QWORD *)&type, value);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x24BDBE778](image);
}

CGImageMetadataRef CGImageSourceCopyMetadataAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageMetadataRef)MEMORY[0x24BDD9138](isrc, index, options);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x24BDD9148](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x24BDD9158](isrc, index, options);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x24BDD9168](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9170](data, options);
}

CGImageSourceRef CGImageSourceCreateWithDataProvider(CGDataProviderRef provider, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9178](provider, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9180](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x24BDD9188](isrc);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x24BDD91A0](isrc);
}

uint64_t CGPDFAnnotationGetCGPDFDictionary()
{
  return MEMORY[0x24BDBE800]();
}

uint64_t CGPDFAnnotationGetType()
{
  return MEMORY[0x24BDBE808]();
}

uint64_t CGPDFAnnotationIsPristine()
{
  return MEMORY[0x24BDBE810]();
}

uint64_t CGPDFAnnotationIsVersioned()
{
  return MEMORY[0x24BDBE818]();
}

size_t CGPDFArrayGetCount(CGPDFArrayRef array)
{
  return MEMORY[0x24BDBE848](array);
}

BOOL CGPDFArrayGetDictionary(CGPDFArrayRef array, size_t index, CGPDFDictionaryRef *value)
{
  return MEMORY[0x24BDBE850](array, index, value);
}

BOOL CGPDFArrayGetName(CGPDFArrayRef array, size_t index, const char **value)
{
  return MEMORY[0x24BDBE860](array, index, value);
}

BOOL CGPDFArrayGetNumber(CGPDFArrayRef array, size_t index, CGPDFReal *value)
{
  return MEMORY[0x24BDBE870](array, index, value);
}

BOOL CGPDFArrayGetObject(CGPDFArrayRef array, size_t index, CGPDFObjectRef *value)
{
  return MEMORY[0x24BDBE878](array, index, value);
}

void CGPDFContextBeginPage(CGContextRef context, CFDictionaryRef pageInfo)
{
  MEMORY[0x24BDBE8D8](context, pageInfo);
}

void CGPDFContextClose(CGContextRef context)
{
  MEMORY[0x24BDBE8E8](context);
}

CGContextRef CGPDFContextCreate(CGDataConsumerRef consumer, const CGRect *mediaBox, CFDictionaryRef auxiliaryInfo)
{
  return (CGContextRef)MEMORY[0x24BDBE8F0](consumer, mediaBox, auxiliaryInfo);
}

void CGPDFContextEndPage(CGContextRef context)
{
  MEMORY[0x24BDBE900](context);
}

void CGPDFDictionaryApplyFunction(CGPDFDictionaryRef dict, CGPDFDictionaryApplierFunction function, void *info)
{
  MEMORY[0x24BDBE948](dict, function, info);
}

BOOL CGPDFDictionaryGetArray(CGPDFDictionaryRef dict, const char *key, CGPDFArrayRef *value)
{
  return MEMORY[0x24BDBE950](dict, key, value);
}

BOOL CGPDFDictionaryGetDictionary(CGPDFDictionaryRef dict, const char *key, CGPDFDictionaryRef *value)
{
  return MEMORY[0x24BDBE960](dict, key, value);
}

BOOL CGPDFDictionaryGetInteger(CGPDFDictionaryRef dict, const char *key, CGPDFInteger *value)
{
  return MEMORY[0x24BDBE968](dict, key, value);
}

BOOL CGPDFDictionaryGetName(CGPDFDictionaryRef dict, const char *key, const char **value)
{
  return MEMORY[0x24BDBE970](dict, key, value);
}

BOOL CGPDFDictionaryGetNumber(CGPDFDictionaryRef dict, const char *key, CGPDFReal *value)
{
  return MEMORY[0x24BDBE978](dict, key, value);
}

BOOL CGPDFDictionaryGetObject(CGPDFDictionaryRef dict, const char *key, CGPDFObjectRef *value)
{
  return MEMORY[0x24BDBE980](dict, key, value);
}

uint64_t CGPDFDictionaryGetRect()
{
  return MEMORY[0x24BDBE990]();
}

BOOL CGPDFDictionaryGetStream(CGPDFDictionaryRef dict, const char *key, CGPDFStreamRef *value)
{
  return MEMORY[0x24BDBE998](dict, key, value);
}

BOOL CGPDFDictionaryGetString(CGPDFDictionaryRef dict, const char *key, CGPDFStringRef *value)
{
  return MEMORY[0x24BDBE9A0](dict, key, value);
}

CGPDFDictionaryRef CGPDFDocumentGetCatalog(CGPDFDocumentRef document)
{
  return (CGPDFDictionaryRef)MEMORY[0x24BDBEA30](document);
}

uint64_t CGPDFDrawingContextCreateWithStream()
{
  return MEMORY[0x24BDBEAE8]();
}

uint64_t CGPDFDrawingContextDraw()
{
  return MEMORY[0x24BDBEAF0]();
}

uint64_t CGPDFDrawingContextRelease()
{
  return MEMORY[0x24BDBEB00]();
}

uint64_t CGPDFFontCreateWithObject()
{
  return MEMORY[0x24BDBEB08]();
}

uint64_t CGPDFFontDescriptorGetFlags()
{
  return MEMORY[0x24BDBEB10]();
}

uint64_t CGPDFFontGetFont()
{
  return MEMORY[0x24BDBEB18]();
}

uint64_t CGPDFFontGetFontDescriptor()
{
  return MEMORY[0x24BDBEB20]();
}

uint64_t CGPDFFontRelease()
{
  return MEMORY[0x24BDBEB28]();
}

uint64_t CGPDFFormCreate()
{
  return MEMORY[0x24BDBEB30]();
}

uint64_t CGPDFFormGetBBox()
{
  return MEMORY[0x24BDBEB38]();
}

uint64_t CGPDFFormGetMatrix()
{
  return MEMORY[0x24BDBEB40]();
}

uint64_t CGPDFFormGetResources()
{
  return MEMORY[0x24BDBEB48]();
}

uint64_t CGPDFFormGetStream()
{
  return MEMORY[0x24BDBEB50]();
}

uint64_t CGPDFFormRelease()
{
  return MEMORY[0x24BDBEB58]();
}

CGPDFObjectType CGPDFObjectGetType(CGPDFObjectRef object)
{
  return MEMORY[0x24BDBEB78](object);
}

BOOL CGPDFObjectGetValue(CGPDFObjectRef object, CGPDFObjectType type, void *value)
{
  return MEMORY[0x24BDBEB80](object, *(_QWORD *)&type, value);
}

CGRect CGPDFPageGetBoxRect(CGPDFPageRef page, CGPDFBox box)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBEBF0](page, *(_QWORD *)&box);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGPDFDocumentRef CGPDFPageGetDocument(CGPDFPageRef page)
{
  return (CGPDFDocumentRef)MEMORY[0x24BDBEC00](page);
}

CGAffineTransform *__cdecl CGPDFPageGetDrawingTransform(CGAffineTransform *__return_ptr retstr, CGPDFPageRef page, CGPDFBox box, CGRect rect, int rotate, BOOL preserveAspectRatio)
{
  return (CGAffineTransform *)MEMORY[0x24BDBEC08](retstr, page, *(_QWORD *)&box, *(_QWORD *)&rotate, preserveAspectRatio, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

int CGPDFPageGetRotationAngle(CGPDFPageRef page)
{
  return MEMORY[0x24BDBEC18](page);
}

CFDataRef CGPDFStreamCopyData(CGPDFStreamRef stream, CGPDFDataFormat *format)
{
  return (CFDataRef)MEMORY[0x24BDBED28](stream, format);
}

CGPDFDictionaryRef CGPDFStreamGetDictionary(CGPDFStreamRef stream)
{
  return (CGPDFDictionaryRef)MEMORY[0x24BDBED30](stream);
}

CFStringRef CGPDFStringCopyTextString(CGPDFStringRef string)
{
  return (CFStringRef)MEMORY[0x24BDBED40](string);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBEFB8](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFC8]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBF038]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF040]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBF048]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x24BDBF058]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x24BDBF060]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectStandardize(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBF080]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A70](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A78](query, result);
}

uint64_t UIRectCenteredYInRect()
{
  return MEMORY[0x24BDF7CB0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x24BDD19C0](commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x24BDAD160](__buf, __nbytes);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x24BEDD020](dest, src, size, atomic, hasStrong);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x24BDAFC00]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x24BDAFC08]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x24BDAFC20]();
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

