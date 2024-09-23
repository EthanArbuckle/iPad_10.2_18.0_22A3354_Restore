void H10ISP::H10ISPAppendNamedValuesToCFString(__CFString *this, __CFString *a2, const __CFArray *a3, const __CFArray *a4)
{
  unsigned int v4;
  int v5;
  CFIndex v7;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v9;
  const __CFDictionary *v10;
  const __CFDictionary *v11;
  _BOOL4 v12;
  int CString;
  char *v14;
  char *v15;
  BOOL v16;
  int v17;
  BOOL v18;
  const char *v19;
  int v20;
  unsigned int v21;
  CFIndex Count;
  char v24[256];
  char buffer[256];
  uint64_t v26;

  v4 = a4;
  v5 = (int)a2;
  v26 = *MEMORY[0x24BDAC8D0];
  Count = CFArrayGetCount(a3);
  if (Count >= 1)
  {
    v7 = 0;
    v21 = v4;
    do
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a3, v7);
      v9 = Name(ValueAtIndex);
      v10 = Value(ValueAtIndex);
      v11 = List(ValueAtIndex);
      if (v9)
      {
        v12 = CFStringGetCString((CFStringRef)v9, buffer, 256, 0x8000100u) != 0;
        if (!v10)
          goto LABEL_12;
      }
      else
      {
        v12 = 0;
        if (!v10)
        {
LABEL_12:
          v16 = !v12;
          v15 = "";
          if (v16)
            v14 = "";
          else
            v14 = buffer;
          goto LABEL_15;
        }
      }
      CString = CFStringGetCString((CFStringRef)v10, v24, 256, 0x8000100u);
      if (v12)
        v14 = buffer;
      else
        v14 = "";
      if (CString)
        v15 = v24;
      else
        v15 = "";
LABEL_15:
      v17 = v5;
      if (v5 >= 1)
      {
        do
        {
          CFStringAppendCString(this, "    ", 0x8000100u);
          --v17;
        }
        while (v17);
      }
      if (v11)
      {
        if (v21)
        {
          CFStringAppendCString(this, "<name>", 0x8000100u);
          CFStringAppendCString(this, v14, 0x8000100u);
          CFStringAppendCString(this, "</name>", 0x8000100u);
          v14 = "<value>";
        }
        CFStringAppendCString(this, v14, 0x8000100u);
        CFStringAppendCString(this, "\n", 0x8000100u);
        H10ISP::H10ISPAppendNamedValuesToCFString((H10ISP *)this, (__CFString *)(v5 + 1), (int)v11, (const __CFArray *)v21, v18);
        if (!v5)
          CFStringAppendCString(this, "\n", 0x8000100u);
        v19 = "</value>\n";
        if ((v21 & 1) == 0)
          goto LABEL_37;
      }
      else
      {
        if (v9)
          LODWORD(v9) = CFStringGetLength((CFStringRef)v9);
        if (v21)
        {
          CFStringAppendCString(this, "<name>", 0x8000100u);
          CFStringAppendCString(this, v14, 0x8000100u);
          v14 = "</name>";
        }
        CFStringAppendCString(this, v14, 0x8000100u);
        if ((int)v9 <= 37)
        {
          if (((38 - (_DWORD)v9) & ~((38 - (int)v9) >> 31)) <= 1)
            v20 = 1;
          else
            v20 = (38 - (_DWORD)v9) & ~((38 - (int)v9) >> 31);
          do
          {
            CFStringAppendCString(this, " ", 0x8000100u);
            --v20;
          }
          while (v20);
        }
        CFStringAppendCString(this, "\t", 0x8000100u);
        if ((v21 & 1) != 0)
        {
          CFStringAppendCString(this, "<value>", 0x8000100u);
          CFStringAppendCString(this, v15, 0x8000100u);
          v15 = "</value>";
        }
        CFStringAppendCString(this, v15, 0x8000100u);
        v19 = "\n";
      }
      CFStringAppendCString(this, v19, 0x8000100u);
LABEL_37:
      ++v7;
    }
    while (v7 != Count);
  }
}

const __CFString *H10ISP::H10ISPCreateFrameMetaDataAsCFString(uint64_t a1, const __CFArray *a2)
{
  __CFString *Mutable;
  __CFString *v5;
  const __CFArray *FormatedMetadata;
  const __CFArray *v7;
  const char *v8;

  Mutable = CFStringCreateMutable(0, 0);
  if (!Mutable)
    return CFSTR("Apple H10 MetaData\n");
  v5 = Mutable;
  CFStringAppendCString(Mutable, "Apple H10 Metadata\n", 0x8000100u);
  if (!a1)
  {
    v8 = "No additional frame metadata.\n";
LABEL_8:
    CFStringAppendCString(v5, v8, 0x8000100u);
    return v5;
  }
  FormatedMetadata = (const __CFArray *)H10ISP::CreateFormatedMetadata(a1);
  if (!FormatedMetadata)
  {
    v8 = "Frame metadata could not be formatted.\n";
    goto LABEL_8;
  }
  v7 = FormatedMetadata;
  H10ISP::H10ISPAppendNamedValuesToCFString(v5, 0, FormatedMetadata, a2);
  CFRelease(v7);
  return v5;
}

__CFDictionary *H10ISP::H10ISPCreateFrameMetaDataAsCFDictionary(uint64_t a1)
{
  const __CFAllocator *v2;
  __CFDictionary *Mutable;
  const __CFArray *FormatedMetadata;
  const __CFArray *v5;
  CFIndex Count;
  CFIndex v7;
  CFIndex v8;
  const CFDictionaryKeyCallBacks *v9;
  const CFDictionaryValueCallBacks *v10;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v12;
  __CFDictionary *v13;
  H10ISP *v14;
  __CFArray *v15;
  const __CFDictionary *v16;
  const __CFDictionary *v17;
  const __CFDictionary *v18;

  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  FormatedMetadata = (const __CFArray *)H10ISP::CreateFormatedMetadata(a1);
  if (FormatedMetadata)
  {
    v5 = FormatedMetadata;
    Count = CFArrayGetCount(FormatedMetadata);
    if (Count >= 1)
    {
      v7 = Count;
      v8 = 0;
      v9 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
      v10 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
      do
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v5, v8);
        v12 = List(ValueAtIndex);
        if (v12)
        {
          v13 = v12;
          v14 = CFDictionaryCreateMutable(v2, 0, v9, v10);
          H10ISP::AddMetadataToDictionary(v14, v13, v15);
          v16 = Name(ValueAtIndex);
          CFDictionaryAddValue(Mutable, v16, v14);
          CFRelease(v14);
        }
        else
        {
          v17 = Name(ValueAtIndex);
          v18 = Value(ValueAtIndex);
          CFDictionaryAddValue(Mutable, v17, v18);
        }
        ++v8;
      }
      while (v7 != v8);
    }
  }
  return Mutable;
}

const __CFArray *H10ISP::AddMetadataToDictionary(H10ISP *this, __CFDictionary *a2, __CFArray *a3)
{
  const __CFArray *result;
  int v6;
  const __CFAllocator *v7;
  const CFDictionaryKeyCallBacks *v8;
  const CFDictionaryValueCallBacks *v9;
  const __CFArray *NamedValue;
  const __CFDictionary *v11;
  __CFDictionary *v12;
  H10ISP *Mutable;
  __CFArray *v14;
  const __CFDictionary *v15;
  const __CFDictionary *v16;
  const __CFDictionary *v17;

  result = CountNamedValues(a2);
  if ((int)result >= 1)
  {
    v6 = 0;
    v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v8 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
    v9 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
    do
    {
      NamedValue = GetNamedValue(a2, v6);
      v11 = List(NamedValue);
      if (v11)
      {
        v12 = v11;
        Mutable = CFDictionaryCreateMutable(v7, 0, v8, v9);
        H10ISP::AddMetadataToDictionary(Mutable, v12, v14);
        v15 = Name(NamedValue);
        CFDictionaryAddValue(this, v15, Mutable);
        CFRelease(Mutable);
      }
      else
      {
        v16 = Name(NamedValue);
        v17 = Value(NamedValue);
        CFDictionaryAddValue(this, v16, v17);
      }
      ++v6;
      result = CountNamedValues(a2);
    }
    while (v6 < (int)result);
  }
  return result;
}

__CFDictionary *H10ISP::H10ISPCreateEXIFDictFromMetadataDict(H10ISP *this, const __CFDictionary *a2, int a3)
{
  const __CFAllocator *v4;
  __CFDictionary *Mutable;
  CFNumberRef v6;
  CFMutableDictionaryRef v7;
  __CFDictionary *v8;
  CFNumberRef v9;
  CFNumberRef v10;
  CFNumberRef v11;
  CFNumberRef v12;
  CFNumberRef v13;
  long double v14;
  CFNumberRef v15;
  uint64_t v16;
  __int16 v17;
  CFArrayRef v18;
  CFMutableArrayRef v19;
  __CFArray *v20;
  const __CFNumber *ValueAtIndex;
  const __CFNumber *v22;
  const __CFNumber *v23;
  const __CFNumber *v24;
  CFNumberRef v25;
  CFNumberRef v26;
  CFNumberRef v27;
  CFNumberRef v28;
  CFNumberRef v29;
  CFNumberRef v30;
  CFNumberRef v31;
  CFNumberRef v32;
  int v33;
  CFNumberRef v34;
  CFNumberRef v35;
  int ValueIfPresent;
  const void **v37;
  CFNumberRef v38;
  CFNumberRef v39;
  CFNumberRef v40;
  CFNumberRef v41;
  CFNumberRef v42;
  CFNumberRef v43;
  CFNumberRef v44;
  const __CFData *Value;
  const UInt8 *BytePtr;
  const __CFString *v47;
  int v49;
  double v50;
  double v51;
  long double v52;
  uint64_t valuePtr;
  CFTypeRef cf;
  int v55;
  int v56;

  v56 = (int)a2;
  v55 = a3;
  valuePtr = 0;
  cf = 0;
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 3, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (Mutable)
  {
    v6 = CFNumberCreate(v4, kCFNumberSInt32Type, &valuePtr);
    cf = v6;
    if (v6)
    {
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDD9698], v6);
      CFRelease(cf);
    }
    v7 = CFDictionaryCreateMutable(v4, 18, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (v7)
    {
      v8 = v7;
      if (v56 && v55)
      {
        v9 = CFNumberCreate(v4, kCFNumberSInt32Type, &v56);
        cf = v9;
        if (v9)
        {
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x24BDD9510], v9);
          CFRelease(cf);
        }
        v10 = CFNumberCreate(v4, kCFNumberSInt32Type, &v55);
        cf = v10;
        if (v10)
        {
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x24BDD9518], v10);
          CFRelease(cf);
        }
      }
      if (this)
      {
        if (CFDictionaryGetValueIfPresent(this, (const void *)*MEMORY[0x24BE10BC8], &cf))
        {
          v51 = 0.0;
          v52 = 0.0;
          CFNumberGetValue((CFNumberRef)cf, kCFNumberFloat64Type, &v51);
          v50 = 0.0;
          if (v51 > 0.0)
            v50 = 1.0 / (double)(int)(1.0 / v51 + 0.5);
          v11 = CFNumberCreate(v4, kCFNumberFloat64Type, &v50);
          if (v11)
          {
            v12 = v11;
            CFDictionaryAddValue(v8, (const void *)*MEMORY[0x24BDD9498], cf);
            CFRelease(v12);
          }
          if (v51 > 0.0)
            v52 = -log2(v51);
          v13 = CFNumberCreate(v4, kCFNumberFloat64Type, &v52);
          cf = v13;
          if (v13)
          {
            CFDictionaryAddValue(v8, (const void *)*MEMORY[0x24BDD9538], v13);
            CFRelease(cf);
          }
        }
        if (CFDictionaryGetValueIfPresent(this, (const void *)*MEMORY[0x24BE10BE0], &cf))
        {
          v51 = 0.0;
          v52 = 0.0;
          CFNumberGetValue((CFNumberRef)cf, kCFNumberFloat64Type, &v52);
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x24BDD94A0], cf);
          if (v52 > 0.0)
          {
            v14 = log2(v52);
            v51 = v14 + v14;
          }
          v15 = CFNumberCreate(v4, kCFNumberFloat64Type, &v51);
          cf = v15;
          if (v15)
          {
            CFDictionaryAddValue(v8, (const void *)*MEMORY[0x24BDD93E0], v15);
            CFRelease(cf);
          }
        }
        if (CFDictionaryGetValueIfPresent(this, (const void *)*MEMORY[0x24BE10C88], &cf))
        {
          LOWORD(v52) = 0;
          v16 = 2u;
          CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt16Type, &v52);
          v17 = 12;
          while (SLOWORD(v52) > (*(__int16 *)((char *)&unk_22855A418 + v16) + v17) >> 1)
          {
            v17 = *(_WORD *)((char *)&unk_22855A418 + v16);
            v16 += 2;
            if (v16 == 64)
              goto LABEL_32;
          }
          LOWORD(v52) = v17;
LABEL_32:
          cf = CFNumberCreate(v4, kCFNumberSInt16Type, &v52);
          if (cf)
          {
            v18 = CFArrayCreate(v4, &cf, 1, MEMORY[0x24BDBD690]);
            CFRelease(cf);
            if (v18)
            {
              CFDictionaryAddValue(v8, (const void *)*MEMORY[0x24BDD94C0], v18);
              CFRelease(v18);
            }
          }
        }
        if (CFDictionaryGetValueIfPresent(this, CFSTR("FocusWindow"), &cf))
        {
          LODWORD(v52) = 0;
          LOWORD(v51) = 0;
          LOWORD(v50) = 0;
          v49 = 0;
          v19 = CFArrayCreateMutable(v4, 4, MEMORY[0x24BDBD690]);
          if (v19)
          {
            v20 = v19;
            ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)cf, 0);
            CFNumberGetValue(ValueAtIndex, kCFNumberIntType, &v52);
            LOWORD(v51) = v56 * LODWORD(v52) / 0x3E8u;
            v22 = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)cf, 1);
            CFNumberGetValue(v22, kCFNumberIntType, &v52);
            LOWORD(v50) = v55 * LODWORD(v52) / 0x3E8u;
            v23 = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)cf, 2);
            CFNumberGetValue(v23, kCFNumberIntType, &v52);
            HIWORD(v49) = v56 * LODWORD(v52) / 0x3E8u;
            v24 = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)cf, 3);
            CFNumberGetValue(v24, kCFNumberIntType, &v52);
            LOWORD(v49) = v55 * LODWORD(v52) / 0x3E8u;
            LOWORD(v51) += (__int16)(HIWORD(v49) + (HIWORD(v49) >> 15)) >> 1;
            LOWORD(v50) += (__int16)(v49 + (((v55 * LODWORD(v52) / 0x3E8u) & 0x8000) >> 15)) >> 1;
            v25 = CFNumberCreate(v4, kCFNumberShortType, &v51);
            if (v25)
            {
              v26 = v25;
              CFArrayAppendValue(v20, v25);
              CFRelease(v26);
            }
            v27 = CFNumberCreate(v4, kCFNumberShortType, &v50);
            if (v27)
            {
              v28 = v27;
              CFArrayAppendValue(v20, v27);
              CFRelease(v28);
            }
            v29 = CFNumberCreate(v4, kCFNumberShortType, (char *)&v49 + 2);
            if (v29)
            {
              v30 = v29;
              CFArrayAppendValue(v20, v29);
              CFRelease(v30);
            }
            v31 = CFNumberCreate(v4, kCFNumberShortType, &v49);
            if (v31)
            {
              v32 = v31;
              CFArrayAppendValue(v20, v31);
              CFRelease(v32);
            }
            CFDictionaryAddValue(v8, (const void *)*MEMORY[0x24BDD9550], v20);
            CFRelease(v20);
          }
        }
        if (CFDictionaryGetValueIfPresent(this, (const void *)*MEMORY[0x24BE10DD0], &cf))
        {
          LODWORD(v52) = -1;
          LODWORD(v51) = 0;
          CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt32Type, &v52);
          if ((LODWORD(v52) & 0x80000000) == 0)
          {
            if (LODWORD(v52) > 8)
            {
              v33 = LODWORD(v52) > 0xC ? 2 : 1;
              LODWORD(v51) = v33;
            }
            else
            {
              LODWORD(v51) = 0;
            }
            v34 = CFNumberCreate(v4, kCFNumberSInt32Type, &v51);
            if (v34)
            {
              v35 = v34;
              CFDictionaryAddValue(v8, (const void *)*MEMORY[0x24BDD9530], v34);
              CFRelease(v35);
            }
          }
        }
        if (CFDictionaryGetValueIfPresent(this, (const void *)*MEMORY[0x24BE10BF0], &cf))
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x24BDD94B8], cf);
        ValueIfPresent = CFDictionaryGetValueIfPresent(this, (const void *)*MEMORY[0x24BE10E60], &cf);
        v37 = (const void **)MEMORY[0x24BDD9578];
        if (ValueIfPresent)
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x24BDD9578], cf);
        if (CFDictionaryGetValueIfPresent(this, (const void *)*MEMORY[0x24BE10BE8], &cf))
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x24BDD94B0], cf);
        if (CFDictionaryGetValueIfPresent(this, (const void *)*MEMORY[0x24BE10CB0], &cf))
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x24BDD94C8], cf);
        HIDWORD(valuePtr) = 1;
        if (CFDictionaryGetValueIfPresent(this, CFSTR("MeteringMode"), &cf))
          CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt32Type, (char *)&valuePtr + 4);
        v38 = CFNumberCreate(v4, kCFNumberSInt32Type, (char *)&valuePtr + 4);
        cf = v38;
        if (v38)
        {
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x24BDD94F0], v38);
          CFRelease(cf);
        }
        LODWORD(valuePtr) = 2;
        v39 = CFNumberCreate(v4, kCFNumberSInt32Type, &valuePtr);
        cf = v39;
        if (v39)
        {
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x24BDD9490], v39);
          CFRelease(cf);
        }
        cf = CFSTR("H10ISP Test Application");
        CFDictionaryAddValue(v8, (const void *)*MEMORY[0x24BDD94E8], CFSTR("H10ISP Test Application"));
        CFRelease(cf);
        LODWORD(valuePtr) = 0;
        if (CFDictionaryGetValueIfPresent(this, CFSTR("GlobalShutterFlag"), &cf))
        {
          LODWORD(v52) = -1;
          CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt32Type, &v52);
        }
        LODWORD(valuePtr) = 32;
        v40 = CFNumberCreate(v4, kCFNumberSInt32Type, &valuePtr);
        cf = v40;
        if (v40)
        {
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x24BDD94A8], v40);
          CFRelease(cf);
        }
        LODWORD(valuePtr) = 2;
        v41 = CFNumberCreate(v4, kCFNumberSInt32Type, &valuePtr);
        cf = v41;
        if (v41)
        {
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x24BDD9528], v41);
          CFRelease(cf);
        }
        LODWORD(valuePtr) = 1;
        v42 = CFNumberCreate(v4, kCFNumberSInt32Type, &valuePtr);
        cf = v42;
        if (v42)
        {
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x24BDD9520], v42);
          CFRelease(cf);
        }
        LODWORD(valuePtr) = 0;
        v43 = CFNumberCreate(v4, kCFNumberSInt32Type, &valuePtr);
        cf = v43;
        if (v43)
        {
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x24BDD9488], v43);
          CFRelease(cf);
        }
        LODWORD(valuePtr) = 0;
        v44 = CFNumberCreate(v4, kCFNumberSInt32Type, &valuePtr);
        cf = v44;
        if (v44)
        {
          CFDictionaryAddValue(v8, *v37, v44);
          CFRelease(cf);
        }
        Value = (const __CFData *)CFDictionaryGetValue(this, (const void *)*MEMORY[0x24BE10D48]);
        if (Value)
        {
          BytePtr = CFDataGetBytePtr(Value);
          if (BytePtr)
          {
            v47 = H10ISP::H10ISPCreateFrameMetaDataAsCFString((uint64_t)BytePtr, 0);
            CFDictionaryAddValue(v8, (const void *)*MEMORY[0x24BDD9568], v47);
            CFRelease(v47);
          }
        }
        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDD9470], v8);
      }
      CFRelease(v8);
    }
  }
  return Mutable;
}

CFDictionaryRef CreateNamedValue(const char *cStr, const char *a2, __CFArray *a3)
{
  CFAllocatorRef *v5;
  unsigned int v6;
  CFDictionaryRef v7;
  __int16 v9;
  void *values;
  CFTypeRef cf;
  uint64_t v12;
  void *keys[4];

  keys[3] = *(void **)MEMORY[0x24BDAC8D0];
  memset(keys, 0, 24);
  values = 0;
  cf = 0;
  v12 = 0;
  v9 = 0;
  v5 = (CFAllocatorRef *)MEMORY[0x24BDBD240];
  if (cStr)
  {
    keys[0] = CFSTR("Name");
    values = (void *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], cStr, 0x8000100u);
    v6 = 1;
    LOBYTE(v9) = 1;
    if (!a2)
      goto LABEL_4;
    goto LABEL_3;
  }
  v6 = 0;
  if (a2)
  {
LABEL_3:
    keys[v6] = CFSTR("Value");
    *(&values + v6) = (void *)CFStringCreateWithCString(*v5, a2, 0x8000100u);
    *(_BYTE *)((unint64_t)&v9 | v6++) = 1;
  }
LABEL_4:
  if (a3)
  {
    keys[v6] = CFSTR("List");
    *(&values + v6++) = a3;
  }
  else if (!v6)
  {
    return 0;
  }
  v7 = CFDictionaryCreate(*v5, (const void **)keys, (const void **)&values, v6, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if ((_BYTE)v9)
    CFRelease(values);
  if (HIBYTE(v9))
    CFRelease(cf);
  return v7;
}

void ReleaseNamedValue(CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
}

const __CFDictionary *Name(const __CFDictionary *result)
{
  void *value;

  value = 0;
  if (result)
  {
    CFDictionaryGetValueIfPresent(result, CFSTR("Name"), (const void **)&value);
    return (const __CFDictionary *)value;
  }
  return result;
}

const __CFDictionary *Value(const __CFDictionary *result)
{
  void *value;

  value = 0;
  if (result)
  {
    CFDictionaryGetValueIfPresent(result, CFSTR("Value"), (const void **)&value);
    return (const __CFDictionary *)value;
  }
  return result;
}

const __CFDictionary *List(const __CFDictionary *result)
{
  void *value;

  value = 0;
  if (result)
  {
    CFDictionaryGetValueIfPresent(result, CFSTR("List"), (const void **)&value);
    return (const __CFDictionary *)value;
  }
  return result;
}

CFMutableArrayRef CreateNamedValues(void)
{
  return CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
}

void ReleaseNamedValues(CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
}

void ClearNamedValues(CFMutableArrayRef theArray)
{
  if (theArray)
    CFArrayRemoveAllValues(theArray);
}

void AppendNamedValue(CFMutableArrayRef theArray, const void *value)
{
  if (theArray)
    CFArrayAppendValue(theArray, value);
}

const __CFArray *CountNamedValues(const __CFArray *theArray)
{
  if (theArray)
    return (const __CFArray *)CFArrayGetCount(theArray);
  return theArray;
}

const __CFArray *GetNamedValue(const __CFArray *result, int a2)
{
  if (result)
    return (const __CFArray *)CFArrayGetValueAtIndex(result, a2);
  return result;
}

void NamedValue::NamedValue(NamedValue *this)
{
  *(_QWORD *)this = 0;
}

{
  *(_QWORD *)this = 0;
}

void NamedValue::NamedValue(NamedValue *this, const char *a2, const char *a3, __CFArray *a4)
{
  *(_QWORD *)this = 0;
  NamedValue::Set((const void **)this, a2, a3, a4);
}

{
  *(_QWORD *)this = 0;
  NamedValue::Set((const void **)this, a2, a3, a4);
}

CFDictionaryRef NamedValue::Set(const void **this, const char *cStr, const char *a3, __CFArray *a4)
{
  const void *v8;
  CFDictionaryRef result;

  v8 = *this;
  if (v8)
    CFRelease(v8);
  result = CreateNamedValue(cStr, a3, a4);
  *this = result;
  return result;
}

void NamedValue::~NamedValue(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

void NamedValue::Name(Name *this)
{
  const __CFDictionary *v1;
  void *value;

  v1 = *(const __CFDictionary **)this;
  value = 0;
  if (v1)
    CFDictionaryGetValueIfPresent(v1, CFSTR("Name"), (const void **)&value);
}

const __CFDictionary *NamedValue::Value(const __CFDictionary **this)
{
  const __CFDictionary *result;
  void *value;

  result = *this;
  value = 0;
  if (result)
  {
    CFDictionaryGetValueIfPresent(result, CFSTR("Value"), (const void **)&value);
    return (const __CFDictionary *)value;
  }
  return result;
}

const __CFDictionary *NamedValue::List(const __CFDictionary **this)
{
  const __CFDictionary *result;
  void *value;

  result = *this;
  value = 0;
  if (result)
  {
    CFDictionaryGetValueIfPresent(result, CFSTR("List"), (const void **)&value);
    return (const __CFDictionary *)value;
  }
  return result;
}

void NamedValues::NamedValues(NamedValues *this)
{
  *(_QWORD *)this = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
}

{
  *(_QWORD *)this = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
}

void NamedValues::~NamedValues(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

void NamedValues::push_back(__CFArray **this, const void **a2)
{
  __CFArray *v2;

  v2 = *this;
  if (v2)
    CFArrayAppendValue(v2, *a2);
}

const __CFArray *NamedValues::size(const __CFArray **this)
{
  const __CFArray *result;

  result = *this;
  if (result)
    return (const __CFArray *)CFArrayGetCount(result);
  return result;
}

void NamedValues::clear(__CFArray **this)
{
  __CFArray *v1;

  v1 = *this;
  if (v1)
    CFArrayRemoveAllValues(v1);
}

H10ISP::H10ISPThreadReadySyncer *H10ISP::H10ISPThreadReadySyncer::H10ISPThreadReadySyncer(H10ISP::H10ISPThreadReadySyncer *this)
{
  pthread_mutex_init((pthread_mutex_t *)this, 0);
  pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0);
  pthread_mutex_lock((pthread_mutex_t *)this);
  return this;
}

void H10ISP::H10ISPThreadReadySyncer::~H10ISPThreadReadySyncer(H10ISP::H10ISPThreadReadySyncer *this)
{
  pthread_cond_destroy((pthread_cond_t *)((char *)this + 64));
  pthread_mutex_destroy((pthread_mutex_t *)this);
}

{
  pthread_cond_destroy((pthread_cond_t *)((char *)this + 64));
  pthread_mutex_destroy((pthread_mutex_t *)this);
}

uint64_t H10ISP::H10ISPThreadReadySyncer::wait(pthread_mutex_t *this)
{
  return pthread_cond_wait((pthread_cond_t *)&this[1], this);
}

uint64_t H10ISP::H10ISPThreadReadySyncer::signalAndUnlock(H10ISP::H10ISPThreadReadySyncer *this)
{
  pthread_cond_signal((pthread_cond_t *)((char *)this + 64));
  return pthread_mutex_unlock((pthread_mutex_t *)this);
}

CFTypeRef H10ISP::CreateFormatedMetadata(uint64_t a1)
{
  NamedValues *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NamedValues *v6;
  unsigned __int16 *v7;
  char *v8;
  const char *v9;
  const char *v10;
  int v11;
  const char *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int v20;
  int v21;
  int v22;
  NamedValues *v23;
  NamedValues *v24;
  NamedValues *v25;
  NamedValues *v26;
  NamedValues *v27;
  char *v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  const char *v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  const char *v36;
  const char *v37;
  const char *v38;
  const char *v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  const char *v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  const char *v52;
  const char *v53;
  const char *v54;
  const char *v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  const char *v61;
  const char *v62;
  const char *v63;
  const char *v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  uint64_t v73;
  unsigned __int8 *v74;
  unsigned __int16 *v75;
  uint64_t v76;
  unsigned __int8 *v77;
  NamedValues *v78;
  NamedValues *v79;
  const char *v80;
  const char *v81;
  const char *v82;
  const char *v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  const char *v87;
  unint64_t v88;
  unint64_t v89;
  unint64_t v90;
  const char *v91;
  unint64_t v92;
  unsigned __int16 *v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  unint64_t v97;
  const char *v98;
  int v99;
  const char *v100;
  int v101;
  const char *v102;
  const char *v103;
  const char *v104;
  unint64_t v105;
  unint64_t v106;
  unsigned int v107;
  unsigned int v108;
  const char *v109;
  int v110;
  NamedValues *v111;
  unint64_t v112;
  CFTypeRef v113;
  __CFArray *v115;
  __CFArray *v116;
  CFTypeRef cf;
  int v118;
  unsigned int v119;
  double v120;
  char v121[8];
  char v122[8];
  char v123[8];
  char __str[8];
  char v125;
  char v126[8];
  uint64_t v127;

  v127 = *MEMORY[0x24BDAC8D0];
  if (*(_WORD *)a1 != 3393)
    return 0;
  NamedValues::NamedValues((NamedValues *)&cf);
  NamedValues::NamedValues((NamedValues *)&v116);
  *(_QWORD *)v126 = 20;
  v3 = *(unsigned int *)(a1 + 16);
  if ((int)v3 >= 1)
  {
    v4 = 0;
    while (1)
    {
      v5 = *(unsigned int *)(a1 + 4 * v4 + 20);
      if ((_DWORD)v5)
        break;
LABEL_139:
      if (++v4 == v3)
        goto LABEL_140;
    }
    NamedValues::NamedValues((NamedValues *)&v115);
    v7 = (unsigned __int16 *)(a1 + v5);
    v8 = "Shared AiCam";
    switch((int)v4)
    {
      case 0:
        *(double *)v126 = COERCE_DOUBLE("unknown");
        switch(*((_DWORD *)v7 + 4))
        {
          case 0:
            v9 = "green-red";
            goto LABEL_98;
          case 1:
            v9 = "red";
            goto LABEL_98;
          case 2:
            v9 = "blue";
            goto LABEL_98;
          case 3:
            v9 = "green-blue";
LABEL_98:
            *(double *)v126 = *(double *)&v9;
            break;
          default:
            break;
        }
        *(_QWORD *)__str = "unknown";
        v99 = v7[14];
        if (v99 == 2)
        {
          v100 = "binning 1/4";
        }
        else if (v99 == 1)
        {
          v100 = "binning 1/2";
        }
        else
        {
          if (v7[14])
            goto LABEL_106;
          v100 = "binning disabled";
        }
        *(_QWORD *)__str = v100;
LABEL_106:
        *(_QWORD *)v123 = "unknown";
        v101 = v7[15];
        if (v101 == 2)
        {
          v102 = "binning 1/4";
        }
        else if (v101 == 1)
        {
          v102 = "binning 1/2";
        }
        else
        {
          if (v7[15])
            goto LABEL_113;
          v102 = "binning disabled";
        }
        *(_QWORD *)v123 = v102;
LABEL_113:
        *(_QWORD *)v122 = "unknown";
        switch(v7[34])
        {
          case 0u:
            v103 = "raw8";
            goto LABEL_118;
          case 1u:
            v103 = "raw10";
            goto LABEL_118;
          case 2u:
            v103 = "raw12";
            goto LABEL_118;
          case 3u:
            v103 = "raw14";
LABEL_118:
            *(_QWORD *)v122 = v103;
            break;
          default:
            break;
        }
        *(_QWORD *)v121 = "unknown";
        if (v7[35] == 1)
        {
          v104 = "unpacked";
        }
        else
        {
          if (v7[35])
          {
LABEL_124:
            *(_QWORD *)&v120 = 760;
            LODWORD(v120) = *((unsigned __int8 *)v7 + 43);
            LODWORD(v120) = *((unsigned __int8 *)v7 + 44);
            LODWORD(v120) = *((unsigned __int8 *)v7 + 45);
            LODWORD(v120) = *((unsigned __int8 *)v7 + 46);
            LODWORD(v120) = *((unsigned __int8 *)v7 + 47);
            LODWORD(v105) = *((_DWORD *)v7 + 12);
            v120 = (double)v105 * 0.00390625;
            LOWORD(v106) = v7[32];
            v120 = (double)v106 * 0.00390625;
            LODWORD(v120) = *((unsigned __int8 *)v7 + 72);
            LODWORD(v120) = *((unsigned __int8 *)v7 + 73);
            v120 = COERCE_DOUBLE(bswap64(*(_QWORD *)(v7 + 37)));
            *(_QWORD *)&v120 = v7 + 48;
            *(_QWORD *)&v120 = v7 + 64;
            *(_QWORD *)&v120 = v7 + 80;
            *(_QWORD *)&v120 = v7 + 96;
            v107 = *((_DWORD *)v7 + 80);
            v108 = *((_DWORD *)v7 + 81);
            v119 = bswap32(v108);
            LODWORD(v120) = bswap32(v107);
            v118 = v107;
            v118 = BYTE1(v107);
            v118 = BYTE2(v107);
            v118 = HIBYTE(v107) & 0xF;
            v118 = v107 >> 28;
            v118 = HIBYTE(v108);
            v118 = BYTE2(v108);
            v118 = BYTE1(v108);
            v118 = v108;
            v118 = (__int16)v7[168];
            v118 = *((unsigned __int8 *)v7 + 338);
            v118 = *((unsigned __int8 *)v7 + 339);
            v118 = *((unsigned __int8 *)v7 + 460);
            v118 = *((unsigned __int8 *)v7 + 461);
            v118 = v7[229];
            v118 = v7[246];
            v118 = v7[247];
            v118 = v7[248];
            v118 = v7[249];
            v118 = *((unsigned __int8 *)v7 + 500);
            v118 = *((unsigned __int8 *)v7 + 501);
            v118 = v7[254];
            v118 = v7[255];
            v118 = v7[256];
            v118 = v7[257];
            v118 = *((_DWORD *)v7 + 129);
            v118 = *((_DWORD *)v7 + 130);
            v118 = *((_DWORD *)v7 + 131);
            v118 = *((_DWORD *)v7 + 132);
            v118 = *((_DWORD *)v7 + 133);
            v118 = *((_DWORD *)v7 + 134);
            v118 = *((_DWORD *)v7 + 135);
            v118 = v7[272];
            v118 = v7[273];
            v118 = v7[282];
            v118 = v7[283];
            v118 = v7[284];
            v118 = v7[285];
            v118 = v7[286];
            v118 = v7[287];
            v118 = v7[288];
            v118 = v7[289];
            v118 = *((_DWORD *)v7 + 145);
            v118 = *((_DWORD *)v7 + 146);
            v118 = v7[294];
            v118 = *((_DWORD *)v7 + 148);
            v118 = *((_DWORD *)v7 + 149);
            v118 = *((_DWORD *)v7 + 150);
            v118 = *((unsigned __int8 *)v7 + 604);
            v118 = *((unsigned __int8 *)v7 + 605);
            v118 = *((_DWORD *)v7 + 152);
            v118 = *((_DWORD *)v7 + 153);
            v118 = *((_DWORD *)v7 + 154);
            v118 = v7[312];
            v118 = v7[313];
            v118 = v7[314];
            v118 = v7[315];
            v118 = *((_DWORD *)v7 + 155);
            v118 = *((unsigned __int8 *)v7 + 632);
            v118 = v7[317];
            v118 = *((_DWORD *)v7 + 159);
            v118 = *((_DWORD *)v7 + 162);
            v118 = v7[326];
            v118 = v7[327];
            v118 = v7[328];
            v118 = v7[329];
            v118 = *((unsigned __int8 *)v7 + 660);
            v118 = *((unsigned __int8 *)v7 + 661);
            v118 = *((_DWORD *)v7 + 167);
            v118 = *((_DWORD *)v7 + 168);
            v118 = v7[338];
            v118 = v7[339];
            v118 = v7[340];
            v118 = v7[341];
            v118 = *((_DWORD *)v7 + 173);
            v118 = v7[348];
            v118 = v7[349];
            v118 = v7[350];
            v118 = v7[351];
            v118 = v7[352];
            v118 = v7[353];
            v118 = v7[354];
            v118 = v7[355];
            v118 = v7[356];
            v118 = v7[357];
            v118 = v7[358];
            v118 = v7[359];
            v118 = v7[360];
            v118 = v7[361];
            v118 = v7[362];
            v118 = v7[363];
            v118 = v7[364];
            v118 = v7[365];
            v118 = v7[366];
            v118 = v7[367];
            v118 = v7[368];
            v118 = v7[369];
            v118 = v7[370];
            v118 = v7[371];
            v118 = v7[372];
            v118 = v7[373];
            v118 = *((unsigned __int8 *)v7 + 748);
            v118 = *((unsigned __int8 *)v7 + 749);
            v118 = *((char *)v7 + 750);
            v118 = v7[377];
            v8 = "Shared Input";
            goto LABEL_137;
          }
          v104 = "packed";
        }
        *(_QWORD *)v121 = v104;
        goto LABEL_124;
      case 1:
        v10 = "unknown";
        *(double *)v126 = COERCE_DOUBLE("unknown");
        v11 = *v7;
        if (v11 == 2)
        {
          v12 = "R'G'B'";
        }
        else if (v11 == 1)
        {
          v12 = "Y'CbCr 4:2:2";
        }
        else
        {
          if (*v7)
            goto LABEL_93;
          v12 = "Y'CbCr 4:2:0";
        }
        *(double *)v126 = *(double *)&v12;
LABEL_93:
        *(_QWORD *)__str = "unknown";
        switch(v7[1])
        {
          case 0u:
            v98 = "BackEnd";
            goto LABEL_129;
          case 1u:
            v98 = "StatsBlock";
            goto LABEL_129;
          case 2u:
            v98 = "RawProcBlock";
            goto LABEL_129;
          case 3u:
            v98 = "RGBProcBlock";
            goto LABEL_129;
          case 4u:
            v98 = "YCCProcBlock";
LABEL_129:
            *(_QWORD *)__str = v98;
            break;
          default:
            break;
        }
        v109 = "RGBY";
        if (!*((_BYTE *)v7 + 9))
          v109 = "RGGB";
        *(_QWORD *)v123 = v109;
        v110 = *((_DWORD *)v7 + 1028);
        if (v110 == 1)
        {
          v10 = "log2";
        }
        else if (!v110)
        {
          v10 = "linear";
        }
        *(_QWORD *)v122 = v10;
        *(_QWORD *)v121 = 4280;
        NamedValues::NamedValues((NamedValues *)v121);
        LODWORD(v112) = *((_DWORD *)v7 + 1027);
        v120 = (double)v112 * 0.0625;
        LODWORD(v120) = *((unsigned __int8 *)v7 + 4138);
        LODWORD(v120) = *((unsigned __int8 *)v7 + 4139);
        LODWORD(v120) = *((_DWORD *)v7 + 1035);
        LODWORD(v120) = *((_DWORD *)v7 + 1036);
        LODWORD(v120) = *((_DWORD *)v7 + 1037);
        LODWORD(v120) = *((_DWORD *)v7 + 1038);
        LODWORD(v120) = *((_DWORD *)v7 + 1039);
        LODWORD(v120) = *((_DWORD *)v7 + 1040);
        LODWORD(v120) = *((_DWORD *)v7 + 1041);
        LODWORD(v120) = *((_DWORD *)v7 + 1042);
        LODWORD(v120) = *((_DWORD *)v7 + 1043);
        LODWORD(v120) = *((_DWORD *)v7 + 1044);
        LODWORD(v120) = *((_DWORD *)v7 + 1045);
        LODWORD(v120) = *((_DWORD *)v7 + 1046);
        LODWORD(v120) = *((unsigned __int8 *)v7 + 4188);
        NamedValues::~NamedValues((const void **)v121);
        v8 = "Shared Output";
LABEL_137:
LABEL_138:
        NamedValues::~NamedValues((const void **)&v115);
        goto LABEL_139;
      case 2:
        *(_QWORD *)v126 = 5264;
        LOWORD(v13) = v7[2];
        *(double *)v126 = (double)v13 * 0.00390625;
        LODWORD(v14) = *((_DWORD *)v7 + 1313);
        *(double *)v126 = (double)v14 * 0.00390625;
        LOWORD(v15) = v7[4];
        *(double *)v126 = (double)v15 * 0.00390625;
        *(_DWORD *)v126 = v7[5];
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 13);
        LODWORD(v16) = *((_DWORD *)v7 + 5);
        *(double *)v126 = (double)v16 * 0.0000152587891;
        NamedValues::NamedValues((NamedValues *)v122);
        NamedValues::NamedValues((NamedValues *)v121);
        v17 = 0;
        v18 = a1 + 60 + v5;
        do
        {
          snprintf(__str, 0x40uLL, "row[%d]", v17);
          v19 = 0;
          strcpy(v126, "{");
          v20 = 1;
          do
          {
            v21 = snprintf(&v126[v20], (1024 - v20), "%3d ", *(unsigned __int8 *)(v18 + v19));
            v20 += v21;
            if (v21 <= 0)
              v22 = 1024;
            else
              v22 = v20;
            if (v19 > 0xE)
              break;
            ++v19;
          }
          while (v22 < 1024);
          if (v22 <= 1023)
            snprintf(&v126[v22], (1024 - v22), "}");
          NamedValue::NamedValue((NamedValue *)v123, __str, v126, 0);
          NamedValues::push_back((__CFArray **)v121, (const void **)v123);
          NamedValue::~NamedValue((const void **)v123);
          ++v17;
          v18 += 16;
        }
        while (v17 != 32);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 1732);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 434);
        *(_DWORD *)v126 = v7[870];
        *(_DWORD *)v126 = v7[871];
        *(_DWORD *)v126 = v7[872];
        *(_DWORD *)v126 = *((_DWORD *)v7 + 437);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 438);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 439);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 440);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 441);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 442);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 443);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 444);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 445);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 446);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 447);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 448);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 449);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 450);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 451);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 452);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 453);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 454);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 455);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 456);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 457);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 458);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 459);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 460);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 461);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 462);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 463);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 464);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 465);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 466);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 467);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 468);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 469);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 470);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 471);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 472);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 473);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 474);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 475);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 476);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 477);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 478);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 479);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 480);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 481);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 482);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 483);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 484);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 485);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 486);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 487);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 488);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 489);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 490);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 491);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 492);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 493);
        *(_DWORD *)v126 = v7[988];
        *(_DWORD *)v126 = v7[989];
        *(_DWORD *)v126 = v7[990];
        *(_DWORD *)v126 = v7[991];
        *(_DWORD *)v126 = v7[992];
        *(_DWORD *)v126 = *((_DWORD *)v7 + 497);
        NamedValues::NamedValues((NamedValues *)v126);
        *(_DWORD *)v123 = *((unsigned __int8 *)v7 + 592);
        *(_DWORD *)v123 = *((unsigned __int8 *)v7 + 593);
        NamedValues::NamedValues((NamedValues *)v123);
        LODWORD(v120) = *((_DWORD *)v7 + 405);
        LODWORD(v120) = *((_DWORD *)v7 + 406);
        LODWORD(v120) = *((_DWORD *)v7 + 407);
        LODWORD(v120) = *((_DWORD *)v7 + 408);
        LODWORD(v120) = *((_DWORD *)v7 + 409);
        LODWORD(v120) = *((_DWORD *)v7 + 410);
        LODWORD(v120) = *((_DWORD *)v7 + 411);
        LODWORD(v120) = *((_DWORD *)v7 + 412);
        LODWORD(v120) = *((_DWORD *)v7 + 413);
        LODWORD(v120) = *((_DWORD *)v7 + 414);
        LODWORD(v120) = *((_DWORD *)v7 + 415);
        LODWORD(v120) = *((_DWORD *)v7 + 416);
        NamedValues::~NamedValues((const void **)v123);
        NamedValues::~NamedValues((const void **)v126);
        NamedValues::~NamedValues((const void **)v121);
        NamedValues::~NamedValues((const void **)v122);
        v8 = "Shared Auto Exposure";
        goto LABEL_137;
      case 3:
        *(_QWORD *)v126 = 3652;
        NamedValues::NamedValues((NamedValues *)v122);
        *(_DWORD *)v126 = v7[80];
        *(_DWORD *)v126 = v7[81];
        *(_DWORD *)v126 = v7[82];
        *(_DWORD *)v126 = v7[83];
        *(_DWORD *)v126 = v7[1292];
        *(_DWORD *)v126 = v7[1293];
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 2716);
        *(_DWORD *)v126 = v7[1360];
        *(_DWORD *)v126 = v7[1361];
        *(_DWORD *)v126 = *((_DWORD *)v7 + 682);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 2732);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 2733);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 2734);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 684);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 685);
        *(_DWORD *)v126 = (__int16)v7[1372];
        *(_DWORD *)v126 = v7[1373];
        *(_DWORD *)v126 = v7[1390];
        *(_DWORD *)v126 = v7[1391];
        *(_DWORD *)v126 = v7[1392];
        *(_DWORD *)v126 = v7[1393];
        *(_DWORD *)v126 = v7[1394];
        *(_DWORD *)v126 = *((_DWORD *)v7 + 775);
        std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v126);
        std::ostream::operator<<();
        std::stringbuf::str();
        if (v125 >= 0)
          v28 = __str;
        else
          v28 = *(char **)__str;
        NamedValue::NamedValue((NamedValue *)v123, "roiType", v28, 0);
        if (v125 < 0)
          operator delete(*(void **)__str);
        NamedValues::push_back(&v115, (const void **)v123);
        NamedValue::~NamedValue((const void **)v123);
        std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)v126);
        *(_DWORD *)v126 = v7[1695];
        NamedValues::~NamedValues((const void **)v122);
        v8 = "Shared Auto Focus";
        goto LABEL_137;
      case 4:
        *(_QWORD *)v126 = 876;
        LOWORD(v29) = v7[6];
        LOWORD(v30) = v7[7];
        LOWORD(v31) = v7[8];
        LOWORD(v33) = v7[9];
        LOWORD(v34) = v7[10];
        LOWORD(v35) = v7[11];
        LOWORD(v40) = v7[21];
        *(double *)v126 = (double)v40 * 0.0000610351562;
        LOWORD(v41) = v7[22];
        *(double *)v126 = (double)v41 * 0.0000610351562;
        LODWORD(v42) = *((_DWORD *)v7 + 13);
        *(double *)v126 = (double)v42 * 0.000244140625;
        *(_DWORD *)v126 = v7[73];
        *(_DWORD *)v126 = v7[86];
        *(_DWORD *)v126 = v7[87];
        *(_DWORD *)v126 = v7[88];
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 178);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 179);
        *(_DWORD *)v126 = v7[90];
        *(_DWORD *)v126 = v7[91];
        *(_DWORD *)v126 = v7[92];
        *(_DWORD *)v126 = v7[93];
        *(_DWORD *)v126 = v7[94];
        *(_DWORD *)v126 = v7[95];
        *(_DWORD *)v126 = v7[96];
        *(_DWORD *)v126 = v7[97];
        *(_DWORD *)v126 = v7[98];
        *(_DWORD *)v126 = v7[99];
        *(_DWORD *)v126 = *((_DWORD *)v7 + 68);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 86);
        *(_DWORD *)v126 = v7[206];
        LOWORD(v43) = v7[138];
        *(double *)v126 = (double)v43 * 0.0000610351562;
        LOWORD(v44) = v7[139];
        *(double *)v126 = (double)v44 * 0.0000610351562;
        *(_DWORD *)v126 = *((_DWORD *)v7 + 70);
        LODWORD(v45) = *((_DWORD *)v7 + 71);
        LODWORD(v46) = *((_DWORD *)v7 + 72);
        LODWORD(v47) = *((_DWORD *)v7 + 73);
        LODWORD(v49) = *((_DWORD *)v7 + 74);
        LODWORD(v50) = *((_DWORD *)v7 + 75);
        LODWORD(v51) = *((_DWORD *)v7 + 76);
        v8 = "Shared Auto White Balance";
        goto LABEL_137;
      case 5:
        *(_QWORD *)v126 = 24;
        v8 = "Adaptive Tone Curve";
        goto LABEL_137;
      case 6:
        *(_QWORD *)v126 = 24;
        *(_DWORD *)v126 = *v7;
        *(_DWORD *)v126 = v7[1];
        *(_DWORD *)v126 = v7[2];
        *(_DWORD *)v126 = v7[3];
        *(_DWORD *)v126 = v7[4];
        *(_DWORD *)v126 = v7[5];
        *(_DWORD *)v126 = v7[10];
        v8 = "Shared LTM";
        goto LABEL_137;
      case 7:
        *(_QWORD *)v126 = 396;
        LODWORD(v56) = *((_DWORD *)v7 + 5);
        *(double *)v126 = (double)v56 * 0.00390625;
        LODWORD(v57) = *((_DWORD *)v7 + 10);
        *(double *)v126 = (double)v57 * 0.00390625;
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 60);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 61);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 62);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 63);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 64);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 65);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 66);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 67);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 68);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 69);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 70);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 71);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 72);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 73);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 74);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 75);
        *(_DWORD *)v126 = v7[38];
        *(_DWORD *)v126 = v7[39];
        *(_DWORD *)v126 = (__int16)v7[40];
        *(_DWORD *)v126 = v7[41];
        LOWORD(v58) = v7[44];
        LOWORD(v59) = v7[45];
        LOWORD(v60) = v7[46];
        LOWORD(v65) = v7[56];
        *(double *)v126 = (double)v65 * 0.0000610351562;
        LOWORD(v66) = v7[57];
        *(double *)v126 = (double)v66 * 0.0000610351562;
        LOWORD(v67) = v7[58];
        *(double *)v126 = (double)v67 * 0.000244140625;
        LOWORD(v68) = v7[59];
        *(double *)v126 = (double)v68 * 0.000244140625;
        LOWORD(v69) = v7[60];
        *(double *)v126 = (double)v69 * 0.000244140625;
        LOWORD(v70) = v7[61];
        *(double *)v126 = (double)v70 * 0.000244140625;
        LOWORD(v71) = v7[62];
        *(double *)v126 = (double)v71 * 0.000244140625;
        LOWORD(v72) = v7[63];
        *(double *)v126 = (double)v72 * 0.000244140625;
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 128);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 129);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 132);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 133);
        *(_DWORD *)v126 = v7[67];
        *(_DWORD *)v126 = v7[68];
        *(_DWORD *)v126 = v7[69];
        *(_DWORD *)v126 = v7[76];
        *(_DWORD *)v126 = v7[77];
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 160);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 161);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 162);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 41);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 44);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 45);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 46);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 47);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 48);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 49);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 50);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 51);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 52);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 53);
        *(_DWORD *)v126 = v7[108];
        *(_DWORD *)v126 = v7[109];
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 243);
        *(_DWORD *)v126 = (__int16)v7[149];
        *(_DWORD *)v126 = (__int16)v7[154];
        *(_DWORD *)v126 = (__int16)v7[155];
        v73 = 0;
        v74 = (unsigned __int8 *)(a1 + 250 + v5);
        do
        {
          NamedValues::NamedValues((NamedValues *)__str);
          v75 = &v7[8 * v73];
          *(_DWORD *)v123 = *((_DWORD *)v75 + 61);
          *(_DWORD *)v123 = *((unsigned __int8 *)v75 + 248);
          v76 = 0;
          v77 = v74;
          do
          {
            NamedValues::NamedValues((NamedValues *)v123);
            *(_DWORD *)v122 = *(v77 - 1);
            *(_DWORD *)v122 = *v77;
            snprintf(v126, 0x40uLL, "strength[%d]", v76);
            NamedValues::~NamedValues((const void **)v123);
            ++v76;
            v77 += 2;
          }
          while (v76 != 5);
          snprintf(v126, 0x40uLL, "mbnrConfig[%d]", v73);
          NamedValues::~NamedValues((const void **)__str);
          ++v73;
          v74 += 16;
        }
        while (v73 != 3);
        v8 = "Shared RAW Proc";
        goto LABEL_137;
      case 8:
        *(_QWORD *)v126 = 772;
        *(_DWORD *)v126 = v7[2];
        *(_DWORD *)v126 = v7[275];
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 552);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 553);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 554);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 555);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 568);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 640);
        v8 = "Shared RGB Proc";
        goto LABEL_137;
      case 9:
        *(_QWORD *)v126 = 188;
        *(_DWORD *)v126 = *v7;
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 2);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 3);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 4);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 5);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 6);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 7);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 8);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 9);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 10);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 11);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 12);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 13);
        *(_DWORD *)v126 = v7[7];
        *(_DWORD *)v126 = v7[8];
        *(_DWORD *)v126 = v7[9];
        *(_DWORD *)v126 = v7[10];
        *(_DWORD *)v126 = v7[11];
        *(_DWORD *)v126 = v7[12];
        *(_DWORD *)v126 = v7[79];
        *(_DWORD *)v126 = v7[80];
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 162);
        *(_DWORD *)v126 = v7[82];
        *(_DWORD *)v126 = v7[83];
        *(_DWORD *)v126 = v7[84];
        *(_DWORD *)v126 = *((_DWORD *)v7 + 43);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 44);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 45);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 184);
        v8 = "Shared YCC Proc";
        goto LABEL_137;
      case 10:
        *(_QWORD *)v126 = 4;
        *(_DWORD *)v126 = *(unsigned __int8 *)v7;
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 1);
        v8 = "Shared BES Proc";
        goto LABEL_137;
      case 11:
        *(_QWORD *)v126 = 19528;
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 164);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 165);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 166);
        *(_DWORD *)v126 = v7[84];
        *(_DWORD *)v126 = v7[85];
        *(_DWORD *)v126 = v7[86];
        *(_DWORD *)v126 = v7[87];
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 166);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 166);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 166);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 166);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 166);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 166);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 166);
        *(_DWORD *)v126 = v7[90];
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 182);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 183);
        *(_DWORD *)v126 = v7[94];
        *(_DWORD *)v126 = v7[95];
        *(_DWORD *)v126 = v7[96];
        *(_DWORD *)v126 = v7[97];
        *(_DWORD *)v126 = v7[98];
        *(_DWORD *)v126 = v7[99];
        *(_DWORD *)v126 = v7[100];
        *(_DWORD *)v126 = v7[101];
        LOWORD(v84) = v7[106];
        LOWORD(v85) = v7[107];
        LOWORD(v86) = v7[108];
        LOWORD(v88) = v7[109];
        LOWORD(v89) = v7[110];
        LOWORD(v90) = v7[111];
        *(_DWORD *)v126 = v7[112];
        *(_DWORD *)v126 = v7[113];
        *(_DWORD *)v126 = v7[118];
        *(_DWORD *)v126 = v7[119];
        *(_DWORD *)v126 = v7[120];
        *(_DWORD *)v126 = v7[121];
        *(_DWORD *)v126 = v7[124];
        *(_DWORD *)v126 = v7[125];
        *(_DWORD *)v126 = v7[132];
        *(_DWORD *)v126 = v7[133];
        *(_DWORD *)v126 = v7[134];
        *(_DWORD *)v126 = v7[135];
        *(_DWORD *)v126 = v7[136];
        *(_DWORD *)v126 = v7[137];
        *(_DWORD *)v126 = v7[260];
        *(_DWORD *)v126 = v7[261];
        *(_DWORD *)v126 = v7[262];
        *(_DWORD *)v126 = v7[263];
        *(_DWORD *)v126 = v7[264];
        *(_DWORD *)v126 = v7[265];
        *(_DWORD *)v126 = *((_DWORD *)v7 + 4031);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 4032);
        v8 = "Shared Stats";
        goto LABEL_137;
      case 12:
        *(_QWORD *)v126 = 2048;
        v8 = "Shared Debug";
        goto LABEL_137;
      case 13:
        *(_QWORD *)v126 = 54888;
        v8 = "Shared OIS";
        goto LABEL_137;
      case 14:
        *(_QWORD *)v126 = 32840;
        v8 = "Shared FocusPixel";
        goto LABEL_137;
      case 15:
        *(_QWORD *)v126 = 6156;
        *(_DWORD *)v126 = *v7;
        *(_DWORD *)v126 = v7[1];
        *(_DWORD *)v126 = v7[2];
        *(_DWORD *)v126 = v7[3];
        *(_DWORD *)v126 = v7[4];
        *(_DWORD *)v126 = v7[5];
        v8 = "Shared LocalHist";
        goto LABEL_137;
      case 16:
        *(_QWORD *)v126 = 65540;
        v8 = "Shared VIS";
        goto LABEL_137;
      case 17:
        *(_QWORD *)v126 = 16388;
        v8 = "Shared TNR";
        goto LABEL_137;
      case 18:
        *(_QWORD *)v126 = 64;
        *(_DWORD *)v126 = (__int16)v7[8];
        *(_DWORD *)v126 = (__int16)v7[9];
        *(_DWORD *)v126 = (__int16)v7[10];
        *(_DWORD *)v126 = (__int16)v7[11];
        *(_DWORD *)v126 = (__int16)v7[12];
        *(_DWORD *)v126 = (__int16)v7[13];
        *(_DWORD *)v126 = (__int16)v7[14];
        *(_DWORD *)v126 = (__int16)v7[15];
        *(_DWORD *)v126 = v7[16];
        *(_DWORD *)v126 = v7[17];
        *(_DWORD *)v126 = v7[28];
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 58);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 59);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 60);
        v8 = "Shared System";
        goto LABEL_137;
      case 19:
        *(_QWORD *)v126 = 35900;
        *(_DWORD *)v126 = v7[17667];
        *(_DWORD *)v126 = v7[17668];
        *(_DWORD *)v126 = v7[17669];
        *(_DWORD *)v126 = v7[17670];
        *(_DWORD *)v126 = v7[17671];
        *(_DWORD *)v126 = v7[17672];
        *(_DWORD *)v126 = v7[17673];
        *(_DWORD *)v126 = v7[17674];
        *(_DWORD *)v126 = v7[17933];
        *(_DWORD *)v126 = v7[17934];
        *(_DWORD *)v126 = *((_DWORD *)v7 + 8968);
        *(_DWORD *)v126 = v7[17938];
        *(_DWORD *)v126 = v7[17939];
        *(_DWORD *)v126 = v7[17940];
        v8 = "Shared LTM LUTs";
        goto LABEL_137;
      case 20:
        *(_QWORD *)v126 = 1736;
        v8 = "Shared VIS Info";
        goto LABEL_137;
      case 21:
        *(_QWORD *)v126 = 11008;
        v8 = "Shared Motion Info";
        goto LABEL_137;
      case 22:
        *(_QWORD *)v126 = 4144;
        v8 = "Shared AF FocusMap";
        goto LABEL_137;
      case 23:
        *(_QWORD *)v126 = 644;
        *(_DWORD *)v126 = *(_DWORD *)v7;
        v8 = "Shared DMA Config";
        goto LABEL_137;
      case 24:
        *(_QWORD *)v126 = 9236;
        *(_DWORD *)v126 = *v7;
        *(_DWORD *)v126 = v7[1];
        *(_DWORD *)v126 = v7[2];
        *(_DWORD *)v126 = v7[3];
        *(_DWORD *)v126 = v7[4];
        *(_DWORD *)v126 = v7[5];
        *(_DWORD *)v126 = v7[6];
        *(_DWORD *)v126 = v7[7];
        *(_DWORD *)v126 = v7[8];
        *(_DWORD *)v126 = v7[9];
        v8 = "Shared HITH";
        goto LABEL_137;
      case 25:
        *(_QWORD *)v126 = 61208;
        *(_DWORD *)v126 = *v7;
        *(_DWORD *)v126 = v7[1];
        *(_DWORD *)v126 = *((_DWORD *)v7 + 15301);
        v8 = "Shared APS";
        goto LABEL_137;
      case 26:
        *(_QWORD *)v126 = 786600;
        v8 = "Shared SideBand";
        goto LABEL_137;
      case 27:
        *(_QWORD *)v126 = 33012;
        *(_DWORD *)v126 = *(_DWORD *)v7;
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 4);
        v8 = "Shared VisionProc";
        goto LABEL_137;
      case 28:
        *(_QWORD *)v126 = 116;
        *(_DWORD *)v126 = *v7;
        *(_DWORD *)v126 = v7[1];
        *(_DWORD *)v126 = v7[2];
        *(_DWORD *)v126 = v7[3];
        *(_DWORD *)v126 = *((_DWORD *)v7 + 2);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 3);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 4);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 5);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 6);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 14);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 15);
        *(_DWORD *)v126 = v7[14];
        *(_DWORD *)v126 = v7[15];
        *(double *)v126 = (double)*((int *)v7 + 8) * 0.03125;
        *(double *)v126 = (double)*((int *)v7 + 9) * 0.03125;
        *(double *)v126 = (double)*((int *)v7 + 10) * 0.03125;
        *(double *)v126 = (double)*((int *)v7 + 11) * 0.03125;
        *(double *)v126 = (double)*((int *)v7 + 12) * 0.03125;
        *(double *)v126 = (double)*((int *)v7 + 13) * 0.03125;
        *(double *)v126 = (double)*((int *)v7 + 16) * 0.03125;
        *(_DWORD *)v126 = *((_DWORD *)v7 + 18);
        *(_DWORD *)v126 = v7[34];
        *(_DWORD *)v126 = *((_DWORD *)v7 + 19);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 20);
        v8 = "Shared Projector";
        goto LABEL_137;
      case 29:
        *(_QWORD *)v126 = 456;
        *(_DWORD *)v126 = *(_DWORD *)v7;
        *(_DWORD *)v126 = *((_DWORD *)v7 + 1);
        v8 = "Shared BodyDetector";
        goto LABEL_137;
      case 30:
        *(_QWORD *)v126 = 96;
        *(_DWORD *)v126 = *v7;
        *(_DWORD *)v126 = v7[1];
        *(_DWORD *)v126 = v7[6];
        *(_DWORD *)v126 = v7[7];
        *(_DWORD *)v126 = v7[8];
        *(_DWORD *)v126 = v7[9];
        *(_DWORD *)v126 = *((_DWORD *)v7 + 5);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 6);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 7);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 8);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 9);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 10);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 11);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 12);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 13);
        *(_DWORD *)v126 = v7[30];
        *(_DWORD *)v126 = *((_DWORD *)v7 + 16);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 17);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 18);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 19);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 20);
        v8 = "Shared Distortion";
        goto LABEL_137;
      case 31:
        *(_QWORD *)v126 = 1024;
        v8 = "BodyDetector Debug";
        goto LABEL_137;
      case 32:
        *(_QWORD *)v126 = 1453212;
        *(_DWORD *)v126 = *v7;
        *(_DWORD *)v126 = v7[1];
        v8 = "PDE Debug";
        goto LABEL_137;
      case 33:
        *(_QWORD *)v126 = 44;
        *(_DWORD *)v126 = *v7;
        *(_DWORD *)v126 = v7[1];
        *(double *)v126 = (double)*((int *)v7 + 3) * 0.03125;
        *(double *)v126 = (double)*((int *)v7 + 4) * 0.03125;
        *(double *)v126 = (double)*((int *)v7 + 5) * 0.03125;
        *(double *)v126 = (double)*((int *)v7 + 6) * 0.03125;
        *(_DWORD *)v126 = *((_DWORD *)v7 + 7);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 8);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 9);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 10);
        v8 = "Shared Powersupply";
        goto LABEL_137;
      case 34:
        *(_QWORD *)v126 = 1252;
        *(_DWORD *)v126 = *((_DWORD *)v7 + 312);
        *(_DWORD *)v126 = 0;
        if (*((_DWORD *)v7 + 312))
        {
          v92 = 0;
          v93 = v7;
          do
          {
            *(_DWORD *)__str = *v93;
            *(_DWORD *)__str = v93[1];
            *(_DWORD *)__str = *((_DWORD *)v93 + 1);
            *(_DWORD *)__str = *((_DWORD *)v93 + 2);
            *(_DWORD *)__str = *((_DWORD *)v93 + 3);
            *(_DWORD *)__str = *((_DWORD *)v93 + 4);
            *(_DWORD *)__str = *((_DWORD *)v93 + 5);
            *(_DWORD *)__str = *((_DWORD *)v93 + 6);
            *(_DWORD *)__str = *((_DWORD *)v93 + 7);
            *(_DWORD *)__str = v93[16];
            *(_DWORD *)__str = v93[17];
            *(_DWORD *)__str = *((_DWORD *)v93 + 9);
            *(_DWORD *)__str = v93[20];
            *(_DWORD *)__str = v93[21];
            *(_DWORD *)__str = v93[22];
            *(_DWORD *)__str = *((_DWORD *)v93 + 101);
            *(_DWORD *)__str = *((unsigned __int8 *)v93 + 51);
            *(_DWORD *)__str = v93[24];
            *(_DWORD *)__str = *((_DWORD *)v93 + 13);
            *(_DWORD *)__str = (__int16)v93[28];
            *(_DWORD *)__str = v93[29];
            *(_DWORD *)__str = *((_DWORD *)v93 + 15);
            *(_DWORD *)__str = *((_DWORD *)v93 + 16);
            *(_DWORD *)__str = *((_DWORD *)v93 + 17);
            *(_DWORD *)__str = *((_DWORD *)v93 + 18);
            *(_DWORD *)__str = *((_DWORD *)v93 + 19);
            *(_DWORD *)__str = v93[40];
            *(_DWORD *)__str = v93[201];
            *(_DWORD *)v126 = ++v92;
            v93 += 208;
          }
          while (v92 < *((unsigned int *)v7 + 312));
        }
        v8 = "Shared Multi Slave";
        goto LABEL_137;
      case 35:
        *(_QWORD *)v126 = 10032;
        *(_DWORD *)v126 = *v7;
        *(_DWORD *)v126 = HIWORD(*(_DWORD *)v7) & 1;
        *(_DWORD *)v126 = v7[2];
        v8 = "Shared FD DCN";
        goto LABEL_137;
      case 36:
        *(_QWORD *)v126 = 4212;
        *(_DWORD *)v126 = *v7;
        *(_DWORD *)v126 = HIWORD(*(_DWORD *)v7) & 1;
        *(_DWORD *)v126 = (*(_DWORD *)v7 >> 18) & 1;
        *(_DWORD *)v126 = (*(_DWORD *)v7 >> 19) & 1;
        *(_DWORD *)v126 = (*(_DWORD *)v7 >> 20) & 1;
        *(_DWORD *)v126 = (*(_DWORD *)v7 >> 21) & 1;
        *(_DWORD *)v126 = *((_DWORD *)v7 + 1);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 2);
        v8 = "Shared FID DCN";
        goto LABEL_137;
      case 37:
        *(_QWORD *)v126 = 1036;
        *(_DWORD *)v126 = *v7;
        *(_DWORD *)v126 = v7[1];
        *(_DWORD *)v126 = v7[2];
        *(_DWORD *)v126 = v7[3];
        *(_DWORD *)v126 = v7[4];
        *(_DWORD *)v126 = v7[5];
        v8 = "Shared YCC Histogram";
        goto LABEL_137;
      case 38:
        *(_QWORD *)v126 = 148024;
        *(_DWORD *)v126 = *v7;
        v8 = "Shared FD DCN Debug";
        goto LABEL_137;
      case 39:
        *(_QWORD *)v126 = 695440;
        *(_DWORD *)v126 = *v7;
        v8 = "Shared FID DCN Debug";
        goto LABEL_137;
      case 40:
        *(_QWORD *)v126 = 1788;
        *(_DWORD *)v126 = *v7;
        *(_DWORD *)v126 = HIWORD(*(_DWORD *)v7) & 1;
        *(_DWORD *)v126 = (*(_DWORD *)v7 >> 17) & 1;
        *(_DWORD *)v126 = *((_DWORD *)v7 + 1);
        v8 = "Shared Attention";
        goto LABEL_137;
      case 41:
        *(_QWORD *)v126 = 246036;
        *(_DWORD *)v126 = *v7;
        v8 = "Shared Attention Debug";
        goto LABEL_137;
      case 42:
        *(_QWORD *)v126 = 2945604;
        *(_DWORD *)v126 = *v7;
        *(_DWORD *)v126 = v7[1];
        v8 = "Shared IR PDP Debug";
        goto LABEL_137;
      case 43:
        *(_QWORD *)v126 = 3848;
        *(_DWORD *)v126 = *v7;
        *(_DWORD *)v126 = v7[1];
        *(_DWORD *)v126 = *((_DWORD *)v7 + 1);
        v8 = "Shared MasterSlave AF";
        goto LABEL_137;
      case 44:
        *(_QWORD *)v126 = 452;
        *(_DWORD *)v126 = *v7;
        *(_DWORD *)v126 = v7[1];
        *(_DWORD *)v126 = v7[2];
        *(_DWORD *)v126 = *((_DWORD *)v7 + 2);
        *(_DWORD *)v126 = v7[6];
        *(_DWORD *)v126 = *((_DWORD *)v7 + 6);
        *(_DWORD *)v126 = v7[14];
        *(_DWORD *)v126 = v7[15];
        *(_DWORD *)v126 = (__int16)v7[36];
        if (*((_DWORD *)v7 + 91))
        {
          *(_DWORD *)v126 = v7[186];
          *(_DWORD *)v126 = v7[187];
          *(_DWORD *)v126 = (__int16)v7[208];
        }
        *(_DWORD *)v126 = v7[38];
        *(_DWORD *)v126 = v7[39];
        *(_DWORD *)v126 = v7[40];
        *(_DWORD *)v126 = (__int16)v7[41];
        *(_DWORD *)v126 = v7[7];
        *(_DWORD *)v126 = v7[8];
        *(_DWORD *)v126 = v7[42];
        *(_DWORD *)v126 = *((_DWORD *)v7 + 22);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 23);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 24);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 25);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 26);
        *(_DWORD *)v126 = v7[37];
        v8 = "Shared PDE";
        goto LABEL_137;
      case 45:
        *(_QWORD *)v126 = 132608;
        *(_DWORD *)v126 = *(_DWORD *)v7;
        *(_DWORD *)v126 = *((_DWORD *)v7 + 9);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 40);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 49);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 52);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 212);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 105);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 824);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 207);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 208);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 209);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 210);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 213);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 215);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 221);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 222);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 223);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 224);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 225);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 226);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 227);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 912);
        *(_DWORD *)v126 = v7[457];
        *(_DWORD *)v126 = v7[458];
        *(_DWORD *)v126 = v7[459];
        *(_DWORD *)v126 = v7[460];
        *(_DWORD *)v126 = v7[461];
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 940);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 956);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 957);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 958);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 959);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 240);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 964);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 242);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 243);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 992);
        *(_DWORD *)v126 = (__int16)v7[497];
        *(_DWORD *)v126 = *((_DWORD *)v7 + 249);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 250);
        *(_DWORD *)v126 = v7[1182];
        *(_DWORD *)v126 = *((_DWORD *)v7 + 6052);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25556);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25557);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25558);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25559);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25560);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25561);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25562);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25563);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25564);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25565);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25566);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25567);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25568);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25569);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25570);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25571);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25572);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25573);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25574);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25575);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25656);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25664);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25665);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25666);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25667);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25668);
        *(_DWORD *)v126 = *((unsigned __int8 *)v7 + 25669);
        *(_DWORD *)v126 = (int)*((float *)v7 + 6422);
        *(_DWORD *)v126 = (int)*((float *)v7 + 6711);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 6985);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 6986);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 6987);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 6988);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 6994);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 6995);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 6997);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 7000);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 7005);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 7014);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 7015);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 7020);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 7021);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 7025);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 7026);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 7027);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 7028);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 7534);
        *(_DWORD *)v126 = *((_DWORD *)v7 + 7535);
        v8 = "Shared CBAF Debug";
        goto LABEL_137;
      case 46:
        *(_QWORD *)v126 = 10033888;
        v8 = "Shared PDAFHW Debug";
        goto LABEL_137;
      case 47:
        *(_QWORD *)v126 = 256;
        v8 = "Shared CRC Check";
        goto LABEL_137;
      case 48:
        *(_QWORD *)v126 = 24;
        v8 = "Shared Calibration";
        goto LABEL_137;
      case 49:
        *(_QWORD *)v126 = 32;
        *(_DWORD *)v126 = *v7;
        *(_DWORD *)v126 = (int)*((float *)v7 + 1);
        *(_DWORD *)v126 = (int)*((float *)v7 + 2);
        *(_DWORD *)v126 = (int)*((float *)v7 + 3);
        *(_DWORD *)v126 = (int)*((float *)v7 + 4);
        *(_DWORD *)v126 = (int)*((float *)v7 + 5);
        *(_DWORD *)v126 = (int)*((float *)v7 + 6);
        v8 = "Shared Motion Stats";
        goto LABEL_137;
      case 50:
        *(_QWORD *)v126 = 44;
        *(_DWORD *)v126 = *v7;
        *(_DWORD *)v126 = (int)*((float *)v7 + 1);
        *(_DWORD *)v126 = (int)*((float *)v7 + 2);
        *(_DWORD *)v126 = (int)*((float *)v7 + 3);
        v8 = "Shared APS Stats";
        goto LABEL_137;
      case 51:
        *(_QWORD *)v126 = 100;
        *(_DWORD *)v126 = *v7;
        *(_DWORD *)v126 = (int)*((float *)v7 + 1);
        *(_DWORD *)v126 = (int)*((float *)v7 + 4);
        *(_DWORD *)v126 = (int)*((float *)v7 + 5);
        v8 = "Shared OIS Stats";
        goto LABEL_137;
      case 52:
        goto LABEL_137;
      case 53:
        v8 = "Shared AiCam Debug";
        goto LABEL_137;
      case 54:
        *(_QWORD *)v126 = 40;
        *(_DWORD *)v126 = *v7;
        *(_DWORD *)v126 = v7[1];
        LOWORD(v94) = v7[8];
        *(double *)v126 = (double)v94 * 0.00390625;
        LODWORD(v95) = *((_DWORD *)v7 + 9);
        *(double *)v126 = (double)v95 * 0.00390625;
        LOWORD(v96) = v7[10];
        *(double *)v126 = (double)v96 * 0.00390625;
        LOWORD(v97) = v7[11];
        *(double *)v126 = (double)v97 * 0.00390625;
        v8 = "Shared SIFR";
        goto LABEL_137;
      case 55:
        *(_DWORD *)v126 = *(_DWORD *)v7;
        *(_DWORD *)v126 = *((_DWORD *)v7 + 1);
        v8 = "Shared FPC";
        goto LABEL_137;
      case 56:
        *(_DWORD *)v126 = *v7;
        *(_DWORD *)v126 = v7[1];
        v8 = "Shared Reduced APS";
        goto LABEL_137;
      default:
        goto LABEL_138;
    }
  }
LABEL_140:
  v113 = cf;
  CFRetain(cf);
  NamedValues::~NamedValues((const void **)&v116);
  NamedValues::~NamedValues(&cf);
  return v113;
}

void sub_2285529F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, const void *a15, const void *a16, const void *a17, uint64_t a18, uint64_t a19, char a20,int a21,const void *a22,__int16 a23,char a24,char a25,void *__p,uint64_t a27,int a28,__int16 a29,char a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a37);
  NamedValues::~NamedValues(&a22);
  NamedValues::~NamedValues(&a15);
  NamedValues::~NamedValues(&a16);
  NamedValues::~NamedValues(&a17);
  _Unwind_Resume(a1);
}

void `anonymous namespace'::AppendMetadataList(__CFArray **this, NamedValues *a2, __CFArray **a3, NamedValues *a4)
{
  const void *v5;

  NamedValue::NamedValue((NamedValue *)&v5, (const char *)a2, 0, *a3);
  NamedValues::push_back(this, &v5);
  NamedValue::~NamedValue(&v5);
}

void sub_228552D94(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  NamedValue::~NamedValue((const void **)va);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t `anonymous namespace'::AppendMetadataItem<unsigned long>(__CFArray **a1)
{
  const char *p_p;
  void *__p;
  char v5;
  const void *v6;
  _BYTE v7[280];

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v7);
  std::ostream::operator<<();
  std::stringbuf::str();
  if (v5 >= 0)
    p_p = (const char *)&__p;
  else
    p_p = (const char *)__p;
  NamedValue::NamedValue((NamedValue *)&v6, "size", p_p, 0);
  if (v5 < 0)
    operator delete(__p);
  NamedValues::push_back(a1, &v6);
  NamedValue::~NamedValue(&v6);
  return std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)v7);
}

void sub_228552E64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, __int16 a18, char a19, char a20)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a18);
  _Unwind_Resume(a1);
}

uint64_t `anonymous namespace'::AppendMetadataItem<unsigned short>(__CFArray **a1, const char *a2, _WORD *a3, int a4)
{
  const char *v8;
  uint64_t v9;
  _QWORD *v10;
  const char *p_p;
  void *__p;
  char v14;
  const void *v15;
  _BYTE v16[16];
  _QWORD v17[33];

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v16);
  if (a4 == 1)
  {
    v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)"0x", 2);
    *(_DWORD *)((char *)v10 + *(_QWORD *)(*v10 - 24) + 8) = *(_DWORD *)((_BYTE *)v10 + *(_QWORD *)(*v10 - 24) + 8) & 0xFFFFFFB5 | 8;
    goto LABEL_11;
  }
  if (a4 != 2)
  {
LABEL_11:
    std::ostream::operator<<();
    goto LABEL_12;
  }
  if (*a3)
    v8 = "yes";
  else
    v8 = "no";
  if (*a3)
    v9 = 3;
  else
    v9 = 2;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)v8, v9);
LABEL_12:
  std::stringbuf::str();
  if (v14 >= 0)
    p_p = (const char *)&__p;
  else
    p_p = (const char *)__p;
  NamedValue::NamedValue((NamedValue *)&v15, a2, p_p, 0);
  if (v14 < 0)
    operator delete(__p);
  NamedValues::push_back(a1, &v15);
  NamedValue::~NamedValue(&v15);
  return std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)v16);
}

void sub_228552FD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, __int16 a18, char a19, char a20)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a18);
  _Unwind_Resume(a1);
}

uint64_t `anonymous namespace'::AppendMetadataItem<unsigned long long>(__CFArray **a1, const char *a2, uint64_t a3, int a4)
{
  _QWORD *v7;
  const char *p_p;
  void *__p;
  char v11;
  const void *v12;
  _BYTE v13[16];
  _QWORD v14[33];

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v13);
  if (a4 == 1)
  {
    v7 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)"0x", 2);
    *(_DWORD *)((char *)v7 + *(_QWORD *)(*v7 - 24) + 8) = *(_DWORD *)((_BYTE *)v7 + *(_QWORD *)(*v7 - 24) + 8) & 0xFFFFFFB5 | 8;
  }
  std::ostream::operator<<();
  std::stringbuf::str();
  if (v11 >= 0)
    p_p = (const char *)&__p;
  else
    p_p = (const char *)__p;
  NamedValue::NamedValue((NamedValue *)&v12, a2, p_p, 0);
  if (v11 < 0)
    operator delete(__p);
  NamedValues::push_back(a1, &v12);
  NamedValue::~NamedValue(&v12);
  return std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)v13);
}

void sub_228553110(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, __int16 a18, char a19, char a20)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a18);
  _Unwind_Resume(a1);
}

uint64_t `anonymous namespace'::AppendMetadataItem<unsigned int>(__CFArray **a1, const char *a2, _DWORD *a3, int a4)
{
  const char *v8;
  uint64_t v9;
  _QWORD *v10;
  const char *p_p;
  void *__p;
  char v14;
  const void *v15;
  _BYTE v16[16];
  _QWORD v17[33];

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v16);
  if (a4 == 1)
  {
    v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)"0x", 2);
    *(_DWORD *)((char *)v10 + *(_QWORD *)(*v10 - 24) + 8) = *(_DWORD *)((_BYTE *)v10 + *(_QWORD *)(*v10 - 24) + 8) & 0xFFFFFFB5 | 8;
    goto LABEL_11;
  }
  if (a4 != 2)
  {
LABEL_11:
    std::ostream::operator<<();
    goto LABEL_12;
  }
  if (*a3)
    v8 = "yes";
  else
    v8 = "no";
  if (*a3)
    v9 = 3;
  else
    v9 = 2;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)v8, v9);
LABEL_12:
  std::stringbuf::str();
  if (v14 >= 0)
    p_p = (const char *)&__p;
  else
    p_p = (const char *)__p;
  NamedValue::NamedValue((NamedValue *)&v15, a2, p_p, 0);
  if (v14 < 0)
    operator delete(__p);
  NamedValues::push_back(a1, &v15);
  NamedValue::~NamedValue(&v15);
  return std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)v16);
}

void sub_228553284(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, __int16 a18, char a19, char a20)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a18);
  _Unwind_Resume(a1);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  std::ios_base *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = MEMORY[0x24BEDB858];
  v3 = MEMORY[0x24BEDB858] + 104;
  *(_QWORD *)(a1 + 128) = MEMORY[0x24BEDB858] + 104;
  *(_QWORD *)(a1 + 16) = v2 + 64;
  v4 = a1 + 16;
  v5 = (_QWORD *)MEMORY[0x24BEDB7F0];
  v6 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 16);
  v7 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 24);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + *(_QWORD *)(v6 - 24)) = v7;
  *(_QWORD *)(a1 + 8) = 0;
  v8 = (std::ios_base *)(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24));
  std::ios_base::init(v8, (void *)(a1 + 24));
  v8[1].__vftable = 0;
  v8[1].__fmtflags_ = -1;
  v9 = v5[4];
  v10 = v5[5];
  *(_QWORD *)(a1 + 16) = v9;
  *(_QWORD *)(v4 + *(_QWORD *)(v9 - 24)) = v10;
  v11 = v5[1];
  *(_QWORD *)a1 = v11;
  *(_QWORD *)(a1 + *(_QWORD *)(v11 - 24)) = v5[6];
  *(_QWORD *)a1 = v2 + 24;
  *(_QWORD *)(a1 + 128) = v3;
  *(_QWORD *)(a1 + 16) = v2 + 64;
  std::streambuf::basic_streambuf();
  *(_QWORD *)(a1 + 24) = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_2285533D0(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::iostream::~basic_iostream();
  MEMORY[0x22E2B1D50](v1);
  _Unwind_Resume(a1);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = MEMORY[0x24BEDB7F0];
  v3 = *MEMORY[0x24BEDB7F0];
  *(_QWORD *)a1 = *MEMORY[0x24BEDB7F0];
  v4 = *(_QWORD *)(v2 + 72);
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 64);
  *(_QWORD *)(a1 + 24) = MEMORY[0x24BEDB848] + 16;
  *(_QWORD *)(a1 + 16) = v4;
  if (*(char *)(a1 + 111) < 0)
    operator delete(*(void **)(a1 + 88));
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x22E2B1D50](a1 + 128);
  return a1;
}

void sub_228553484(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x22E2B1D50](v1 + 128);
  _Unwind_Resume(a1);
}

_QWORD *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  _BYTE v13[16];
  std::locale v14;

  MEMORY[0x22E2B1C84](v13, a1);
  if (v13[0])
  {
    v6 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *(_QWORD *)(v6 + 40);
    v8 = *(_DWORD *)(v6 + 8);
    v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v10 = std::locale::use_facet(&v14, MEMORY[0x24BEDB350]);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20)
      v11 = a2 + a3;
    else
      v11 = a2;
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9))
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
  MEMORY[0x22E2B1C90](v13);
  return a1;
}

void sub_2285535BC(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x22E2B1C90](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x22855359CLL);
}

void sub_228553608(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6;
  uint64_t v11;
  int64_t v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  void *__p[2];
  char v18;

  v6 = a1;
  if (a1)
  {
    v11 = *(_QWORD *)(a5 + 24);
    if (v11 <= a4 - a2)
      v12 = 0;
    else
      v12 = v11 - (a4 - a2);
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1) != a3 - a2)
      return 0;
    if (v12 >= 1)
    {
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      v13 = v18 >= 0 ? __p : (void **)__p[0];
      v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(_QWORD *)v6 + 96))(v6, v13, v12);
      if (v18 < 0)
        operator delete(__p[0]);
      if (v14 != v12)
        return 0;
    }
    v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v6 + 96))(v6, a3, v15) == v15)
      *(_QWORD *)(a5 + 24) = 0;
    else
      return 0;
  }
  return v6;
}

void sub_22855373C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::string::basic_string[abi:ne180100](_QWORD *__b, size_t __len, int __c)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (__len >= 0x17)
  {
    v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v7 = __len | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((_BYTE *)__b + 23) = __len;
    v6 = __b;
    if (!__len)
      goto LABEL_9;
  }
  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24F112F80, MEMORY[0x24BEDAAF0]);
}

void sub_228553850(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

uint64_t `anonymous namespace'::AppendMetadataItem<char const*>(__CFArray **a1, const char *a2, const char **a3)
{
  const char *v6;
  size_t v7;
  const char *p_p;
  void *__p;
  char v11;
  const void *v12;
  _BYTE v13[16];
  _QWORD v14[33];

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v13);
  v6 = *a3;
  v7 = strlen(v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)v6, v7);
  std::stringbuf::str();
  if (v11 >= 0)
    p_p = (const char *)&__p;
  else
    p_p = (const char *)__p;
  NamedValue::NamedValue((NamedValue *)&v12, a2, p_p, 0);
  if (v11 < 0)
    operator delete(__p);
  NamedValues::push_back(a1, &v12);
  NamedValue::~NamedValue(&v12);
  return std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)v13);
}

void sub_22855394C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, __int16 a18, char a19, char a20)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a18);
  _Unwind_Resume(a1);
}

uint64_t `anonymous namespace'::AppendMetadataItem<unsigned char>(__CFArray **a1, const char *a2, _BYTE *a3, int a4)
{
  const char *v8;
  uint64_t v9;
  void **v10;
  void *__p[2];
  char v13;
  const void *v14;
  _BYTE v15[16];
  _QWORD v16[33];

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v15);
  if (a4 == 3)
  {
    if (*a3)
      v8 = "on";
    else
      v8 = "off";
    if (*a3)
      v9 = 2;
    else
      v9 = 3;
    goto LABEL_15;
  }
  if (a4 == 2)
  {
    if (*a3)
      v8 = "yes";
    else
      v8 = "no";
    if (*a3)
      v9 = 3;
    else
      v9 = 2;
LABEL_15:
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)v8, v9);
    goto LABEL_17;
  }
  LOBYTE(__p[0]) = *a3;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)__p, 1);
LABEL_17:
  std::stringbuf::str();
  if (v13 >= 0)
    v10 = __p;
  else
    v10 = (void **)__p[0];
  NamedValue::NamedValue((NamedValue *)&v14, a2, (const char *)v10, 0);
  if (v13 < 0)
    operator delete(__p[0]);
  NamedValues::push_back(a1, &v14);
  NamedValue::~NamedValue(&v14);
  return std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)v15);
}

void sub_228553AC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, __int16 a18, char a19, char a20)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a18);
  _Unwind_Resume(a1);
}

uint64_t `anonymous namespace'::AppendMetadataItem<int>(__CFArray **a1, const char *a2, uint64_t a3, int a4)
{
  _QWORD *v7;
  const char *p_p;
  void *__p;
  char v11;
  const void *v12;
  _BYTE v13[16];
  _QWORD v14[33];

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v13);
  if (a4 == 1)
  {
    v7 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)"0x", 2);
    *(_DWORD *)((char *)v7 + *(_QWORD *)(*v7 - 24) + 8) = *(_DWORD *)((_BYTE *)v7 + *(_QWORD *)(*v7 - 24) + 8) & 0xFFFFFFB5 | 8;
  }
  std::ostream::operator<<();
  std::stringbuf::str();
  if (v11 >= 0)
    p_p = (const char *)&__p;
  else
    p_p = (const char *)__p;
  NamedValue::NamedValue((NamedValue *)&v12, a2, p_p, 0);
  if (v11 < 0)
    operator delete(__p);
  NamedValues::push_back(a1, &v12);
  NamedValue::~NamedValue(&v12);
  return std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)v13);
}

void sub_228553BFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, __int16 a18, char a19, char a20)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a18);
  _Unwind_Resume(a1);
}

uint64_t `anonymous namespace'::AppendMetadataItem<double>(__CFArray **a1, const char *a2)
{
  const char *p_p;
  void *__p;
  char v7;
  const void *v8;
  _BYTE v9[280];

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v9);
  std::ostream::operator<<();
  std::stringbuf::str();
  if (v7 >= 0)
    p_p = (const char *)&__p;
  else
    p_p = (const char *)__p;
  NamedValue::NamedValue((NamedValue *)&v8, a2, p_p, 0);
  if (v7 < 0)
    operator delete(__p);
  NamedValues::push_back(a1, &v8);
  NamedValue::~NamedValue(&v8);
  return std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)v9);
}

void sub_228553CF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, __int16 a18, char a19, char a20)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a18);
  _Unwind_Resume(a1);
}

uint64_t `anonymous namespace'::AppendMetadataItem<short>(__CFArray **a1, const char *a2, _WORD *a3, int a4)
{
  const char *v8;
  uint64_t v9;
  _QWORD *v10;
  const char *p_p;
  void *__p;
  char v14;
  const void *v15;
  _BYTE v16[16];
  _QWORD v17[33];

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v16);
  if (a4 == 1)
  {
    v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)"0x", 2);
    *(_DWORD *)((char *)v10 + *(_QWORD *)(*v10 - 24) + 8) = *(_DWORD *)((_BYTE *)v10 + *(_QWORD *)(*v10 - 24) + 8) & 0xFFFFFFB5 | 8;
    goto LABEL_11;
  }
  if (a4 != 2)
  {
LABEL_11:
    std::ostream::operator<<();
    goto LABEL_12;
  }
  if (*a3)
    v8 = "yes";
  else
    v8 = "no";
  if (*a3)
    v9 = 3;
  else
    v9 = 2;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)v8, v9);
LABEL_12:
  std::stringbuf::str();
  if (v14 >= 0)
    p_p = (const char *)&__p;
  else
    p_p = (const char *)__p;
  NamedValue::NamedValue((NamedValue *)&v15, a2, p_p, 0);
  if (v14 < 0)
    operator delete(__p);
  NamedValues::push_back(a1, &v15);
  NamedValue::~NamedValue(&v15);
  return std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)v16);
}

void sub_228553E68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, __int16 a18, char a19, char a20)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a18);
  _Unwind_Resume(a1);
}

uint64_t `anonymous namespace'::AppendMetadataItem<char [4]>(__CFArray **a1, const char *a2)
{
  const char *p_p;
  void *__p;
  char v7;
  const void *v8;
  _BYTE v9[16];
  _QWORD v10[33];

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)"...", 3);
  std::stringbuf::str();
  if (v7 >= 0)
    p_p = (const char *)&__p;
  else
    p_p = (const char *)__p;
  NamedValue::NamedValue((NamedValue *)&v8, a2, p_p, 0);
  if (v7 < 0)
    operator delete(__p);
  NamedValues::push_back(a1, &v8);
  NamedValue::~NamedValue(&v8);
  return std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)v9);
}

void sub_228553F5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, __int16 a18, char a19, char a20)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a18);
  _Unwind_Resume(a1);
}

uint64_t `anonymous namespace'::AppendMetadataItem<float>(__CFArray **a1, const char *a2)
{
  const char *p_p;
  void *__p;
  char v7;
  const void *v8;
  _BYTE v9[280];

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v9);
  std::ostream::operator<<();
  std::stringbuf::str();
  if (v7 >= 0)
    p_p = (const char *)&__p;
  else
    p_p = (const char *)__p;
  NamedValue::NamedValue((NamedValue *)&v8, a2, p_p, 0);
  if (v7 < 0)
    operator delete(__p);
  NamedValues::push_back(a1, &v8);
  NamedValue::~NamedValue(&v8);
  return std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)v9);
}

void sub_228554054(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, __int16 a18, char a19, char a20)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a18);
  _Unwind_Resume(a1);
}

uint64_t `anonymous namespace'::AppendMetadataItem<eCIspFocusingMethod>(__CFArray **a1)
{
  const char *p_p;
  void *__p;
  char v5;
  const void *v6;
  _BYTE v7[280];

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v7);
  std::ostream::operator<<();
  std::stringbuf::str();
  if (v5 >= 0)
    p_p = (const char *)&__p;
  else
    p_p = (const char *)__p;
  NamedValue::NamedValue((NamedValue *)&v6, "lastFocusingMethod", p_p, 0);
  if (v5 < 0)
    operator delete(__p);
  NamedValues::push_back(a1, &v6);
  NamedValue::~NamedValue(&v6);
  return std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)v7);
}

void sub_228554144(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, __int16 a18, char a19, char a20)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a18);
  _Unwind_Resume(a1);
}

uint64_t `anonymous namespace'::AppendMetadataItem(__CFArray **this, NamedValues *a2, const char *a3, double a4, double a5, double a6)
{
  _QWORD *v8;
  _QWORD *v9;
  const char *p_p;
  void *__p;
  char v13;
  const void *v14;
  _BYTE v15[16];
  _QWORD v16[33];

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v15);
  *(_QWORD *)((char *)&v16[2] + *(_QWORD *)(v16[0] - 24)) = 5;
  v8 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)", ", 2);
  v9 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)", ", 2);
  std::ostream::operator<<();
  std::stringbuf::str();
  if (v13 >= 0)
    p_p = (const char *)&__p;
  else
    p_p = (const char *)__p;
  NamedValue::NamedValue((NamedValue *)&v14, (const char *)a2, p_p, 0);
  if (v13 < 0)
    operator delete(__p);
  NamedValues::push_back(this, &v14);
  NamedValue::~NamedValue(&v14);
  return std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)v15);
}

void sub_228554294(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, __int16 a18, char a19, char a20)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a18);
  _Unwind_Resume(a1);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
  MEMORY[0x24BDBB878](theArray);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x24BDBBE38](theDict, key, value);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
  MEMORY[0x24BDBC4B0](theString, cStr, *(_QWORD *)&encoding);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x24BEDA9E0]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x24BEDAA60](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x24BEDAA70](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x24BEDAEF8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x24BEDAF00]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x24BEDAF30]();
}

{
  return MEMORY[0x24BEDAF40]();
}

{
  return MEMORY[0x24BEDAF48]();
}

{
  return MEMORY[0x24BEDAF50]();
}

{
  return MEMORY[0x24BEDAF60]();
}

{
  return MEMORY[0x24BEDAF68]();
}

{
  return MEMORY[0x24BEDAF70]();
}

{
  return MEMORY[0x24BEDAF80]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x24BEDB010]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x24BEDB048]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x24BEDB050]();
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x24BEDB500](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x24BEDB518](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x24BEDB530](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x24BEDB5E8]();
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24F112FA8(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24F112FB0(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAD8](__x);
  return result;
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7D0](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x24BDAF7D8](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7E0](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x24BDAF800](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8C0](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

