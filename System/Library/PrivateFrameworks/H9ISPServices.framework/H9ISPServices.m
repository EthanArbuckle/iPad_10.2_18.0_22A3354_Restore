void H9ISP::H9ISPAppendNamedValuesToCFString(__CFString *this, __CFString *a2, const __CFArray *a3, const __CFArray *a4)
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
        H9ISP::H9ISPAppendNamedValuesToCFString((H9ISP *)this, (__CFString *)(v5 + 1), (int)v11, (const __CFArray *)v21, v18);
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

const __CFString *H9ISP::H9ISPCreateFrameMetaDataAsCFString(uint64_t a1, const __CFArray *a2)
{
  __CFString *Mutable;
  __CFString *v5;
  const __CFArray *FormatedMetadata;
  const __CFArray *v7;
  const char *v8;

  Mutable = CFStringCreateMutable(0, 0);
  if (!Mutable)
    return CFSTR("Apple H9 MetaData\n");
  v5 = Mutable;
  CFStringAppendCString(Mutable, "Apple H9 Metadata\n", 0x8000100u);
  if (!a1)
  {
    v8 = "No additional frame metadata.\n";
LABEL_8:
    CFStringAppendCString(v5, v8, 0x8000100u);
    return v5;
  }
  FormatedMetadata = (const __CFArray *)H9ISP::CreateFormatedMetadata(a1);
  if (!FormatedMetadata)
  {
    v8 = "Frame metadata could not be formatted.\n";
    goto LABEL_8;
  }
  v7 = FormatedMetadata;
  H9ISP::H9ISPAppendNamedValuesToCFString(v5, 0, FormatedMetadata, a2);
  CFRelease(v7);
  return v5;
}

__CFDictionary *H9ISP::H9ISPCreateFrameMetaDataAsCFDictionary(uint64_t a1)
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
  H9ISP *v14;
  __CFArray *v15;
  const __CFDictionary *v16;
  const __CFDictionary *v17;
  const __CFDictionary *v18;

  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  FormatedMetadata = (const __CFArray *)H9ISP::CreateFormatedMetadata(a1);
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
          H9ISP::AddMetadataToDictionary(v14, v13, v15);
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

const __CFArray *H9ISP::AddMetadataToDictionary(H9ISP *this, __CFDictionary *a2, __CFArray *a3)
{
  const __CFArray *result;
  int v6;
  const __CFAllocator *v7;
  const CFDictionaryKeyCallBacks *v8;
  const CFDictionaryValueCallBacks *v9;
  const __CFArray *NamedValue;
  const __CFDictionary *v11;
  __CFDictionary *v12;
  H9ISP *Mutable;
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
        H9ISP::AddMetadataToDictionary(Mutable, v12, v14);
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

__CFDictionary *H9ISP::H9ISPCreateEXIFDictFromMetadataDict(H9ISP *this, const __CFDictionary *a2, int a3)
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
  CFNumberRef v36;
  CFNumberRef v37;
  CFNumberRef v38;
  CFNumberRef v39;
  CFNumberRef v40;
  CFNumberRef v41;
  CFNumberRef v42;
  const __CFData *Value;
  const UInt8 *BytePtr;
  const __CFString *v45;
  int v47;
  double v48;
  double v49;
  long double v50;
  uint64_t valuePtr;
  CFTypeRef cf;
  int v53;
  int v54;

  v54 = (int)a2;
  v53 = a3;
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
      if (v54 && v53)
      {
        v9 = CFNumberCreate(v4, kCFNumberSInt32Type, &v54);
        cf = v9;
        if (v9)
        {
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x24BDD9510], v9);
          CFRelease(cf);
        }
        v10 = CFNumberCreate(v4, kCFNumberSInt32Type, &v53);
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
          v49 = 0.0;
          v50 = 0.0;
          CFNumberGetValue((CFNumberRef)cf, kCFNumberFloat64Type, &v49);
          v48 = 0.0;
          if (v49 > 0.0)
            v48 = 1.0 / (double)(int)(1.0 / v49 + 0.5);
          v11 = CFNumberCreate(v4, kCFNumberFloat64Type, &v48);
          if (v11)
          {
            v12 = v11;
            CFDictionaryAddValue(v8, (const void *)*MEMORY[0x24BDD9498], cf);
            CFRelease(v12);
          }
          if (v49 > 0.0)
            v50 = -log2(v49);
          v13 = CFNumberCreate(v4, kCFNumberFloat64Type, &v50);
          cf = v13;
          if (v13)
          {
            CFDictionaryAddValue(v8, (const void *)*MEMORY[0x24BDD9538], v13);
            CFRelease(cf);
          }
        }
        if (CFDictionaryGetValueIfPresent(this, (const void *)*MEMORY[0x24BE10BE0], &cf))
        {
          v49 = 0.0;
          v50 = 0.0;
          CFNumberGetValue((CFNumberRef)cf, kCFNumberFloat64Type, &v50);
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x24BDD94A0], cf);
          if (v50 > 0.0)
          {
            v14 = log2(v50);
            v49 = v14 + v14;
          }
          v15 = CFNumberCreate(v4, kCFNumberFloat64Type, &v49);
          cf = v15;
          if (v15)
          {
            CFDictionaryAddValue(v8, (const void *)*MEMORY[0x24BDD93E0], v15);
            CFRelease(cf);
          }
        }
        if (CFDictionaryGetValueIfPresent(this, (const void *)*MEMORY[0x24BE10C88], &cf))
        {
          LOWORD(v50) = 0;
          v16 = 2u;
          CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt16Type, &v50);
          v17 = 12;
          while (SLOWORD(v50) > (*(__int16 *)((char *)&unk_23D69D6E6 + v16) + v17) >> 1)
          {
            v17 = *(_WORD *)((char *)&unk_23D69D6E6 + v16);
            v16 += 2;
            if (v16 == 64)
              goto LABEL_32;
          }
          LOWORD(v50) = v17;
LABEL_32:
          cf = CFNumberCreate(v4, kCFNumberSInt16Type, &v50);
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
          LODWORD(v50) = 0;
          LOWORD(v49) = 0;
          LOWORD(v48) = 0;
          v47 = 0;
          v19 = CFArrayCreateMutable(v4, 4, MEMORY[0x24BDBD690]);
          if (v19)
          {
            v20 = v19;
            ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)cf, 0);
            CFNumberGetValue(ValueAtIndex, kCFNumberIntType, &v50);
            LOWORD(v49) = v54 * LODWORD(v50) / 0x3E8u;
            v22 = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)cf, 1);
            CFNumberGetValue(v22, kCFNumberIntType, &v50);
            LOWORD(v48) = v53 * LODWORD(v50) / 0x3E8u;
            v23 = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)cf, 2);
            CFNumberGetValue(v23, kCFNumberIntType, &v50);
            HIWORD(v47) = v54 * LODWORD(v50) / 0x3E8u;
            v24 = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)cf, 3);
            CFNumberGetValue(v24, kCFNumberIntType, &v50);
            LOWORD(v47) = v53 * LODWORD(v50) / 0x3E8u;
            LOWORD(v49) += (__int16)(HIWORD(v47) + (HIWORD(v47) >> 15)) >> 1;
            LOWORD(v48) += (__int16)(v47 + (((v53 * LODWORD(v50) / 0x3E8u) & 0x8000) >> 15)) >> 1;
            v25 = CFNumberCreate(v4, kCFNumberShortType, &v49);
            if (v25)
            {
              v26 = v25;
              CFArrayAppendValue(v20, v25);
              CFRelease(v26);
            }
            v27 = CFNumberCreate(v4, kCFNumberShortType, &v48);
            if (v27)
            {
              v28 = v27;
              CFArrayAppendValue(v20, v27);
              CFRelease(v28);
            }
            v29 = CFNumberCreate(v4, kCFNumberShortType, (char *)&v47 + 2);
            if (v29)
            {
              v30 = v29;
              CFArrayAppendValue(v20, v29);
              CFRelease(v30);
            }
            v31 = CFNumberCreate(v4, kCFNumberShortType, &v47);
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
          LODWORD(v50) = -1;
          LODWORD(v49) = 0;
          CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt32Type, &v50);
          if ((LODWORD(v50) & 0x80000000) == 0)
          {
            if (LODWORD(v50) > 8)
            {
              v33 = LODWORD(v50) > 0xC ? 2 : 1;
              LODWORD(v49) = v33;
            }
            else
            {
              LODWORD(v49) = 0;
            }
            v34 = CFNumberCreate(v4, kCFNumberSInt32Type, &v49);
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
        if (CFDictionaryGetValueIfPresent(this, (const void *)*MEMORY[0x24BE10BE8], &cf))
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x24BDD94B0], cf);
        if (CFDictionaryGetValueIfPresent(this, (const void *)*MEMORY[0x24BE10CB0], &cf))
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x24BDD94C8], cf);
        HIDWORD(valuePtr) = 1;
        if (CFDictionaryGetValueIfPresent(this, CFSTR("MeteringMode"), &cf))
          CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt32Type, (char *)&valuePtr + 4);
        v36 = CFNumberCreate(v4, kCFNumberSInt32Type, (char *)&valuePtr + 4);
        cf = v36;
        if (v36)
        {
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x24BDD94F0], v36);
          CFRelease(cf);
        }
        LODWORD(valuePtr) = 2;
        v37 = CFNumberCreate(v4, kCFNumberSInt32Type, &valuePtr);
        cf = v37;
        if (v37)
        {
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x24BDD9490], v37);
          CFRelease(cf);
        }
        cf = CFSTR("H9ISP Test Application");
        CFDictionaryAddValue(v8, (const void *)*MEMORY[0x24BDD94E8], CFSTR("H9ISP Test Application"));
        CFRelease(cf);
        LODWORD(valuePtr) = 0;
        if (CFDictionaryGetValueIfPresent(this, CFSTR("GlobalShutterFlag"), &cf))
        {
          LODWORD(v50) = -1;
          CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt32Type, &v50);
        }
        LODWORD(valuePtr) = 32;
        v38 = CFNumberCreate(v4, kCFNumberSInt32Type, &valuePtr);
        cf = v38;
        if (v38)
        {
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x24BDD94A8], v38);
          CFRelease(cf);
        }
        LODWORD(valuePtr) = 2;
        v39 = CFNumberCreate(v4, kCFNumberSInt32Type, &valuePtr);
        cf = v39;
        if (v39)
        {
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x24BDD9528], v39);
          CFRelease(cf);
        }
        LODWORD(valuePtr) = 1;
        v40 = CFNumberCreate(v4, kCFNumberSInt32Type, &valuePtr);
        cf = v40;
        if (v40)
        {
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x24BDD9520], v40);
          CFRelease(cf);
        }
        LODWORD(valuePtr) = 0;
        v41 = CFNumberCreate(v4, kCFNumberSInt32Type, &valuePtr);
        cf = v41;
        if (v41)
        {
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x24BDD9488], v41);
          CFRelease(cf);
        }
        LODWORD(valuePtr) = 0;
        v42 = CFNumberCreate(v4, kCFNumberSInt32Type, &valuePtr);
        cf = v42;
        if (v42)
        {
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x24BDD9578], v42);
          CFRelease(cf);
        }
        Value = (const __CFData *)CFDictionaryGetValue(this, (const void *)*MEMORY[0x24BE10D48]);
        if (Value)
        {
          BytePtr = CFDataGetBytePtr(Value);
          if (BytePtr)
          {
            v45 = H9ISP::H9ISPCreateFrameMetaDataAsCFString((uint64_t)BytePtr, 0);
            CFDictionaryAddValue(v8, (const void *)*MEMORY[0x24BDD9568], v45);
            CFRelease(v45);
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

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
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

H9ISP::H9ISPThreadReadySyncer *H9ISP::H9ISPThreadReadySyncer::H9ISPThreadReadySyncer(H9ISP::H9ISPThreadReadySyncer *this)
{
  pthread_mutex_init((pthread_mutex_t *)this, 0);
  pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0);
  pthread_mutex_lock((pthread_mutex_t *)this);
  return this;
}

void H9ISP::H9ISPThreadReadySyncer::~H9ISPThreadReadySyncer(H9ISP::H9ISPThreadReadySyncer *this)
{
  pthread_cond_destroy((pthread_cond_t *)((char *)this + 64));
  pthread_mutex_destroy((pthread_mutex_t *)this);
}

uint64_t H9ISP::H9ISPThreadReadySyncer::wait(pthread_mutex_t *this)
{
  return pthread_cond_wait((pthread_cond_t *)&this[1], this);
}

uint64_t H9ISP::H9ISPThreadReadySyncer::signalAndUnlock(H9ISP::H9ISPThreadReadySyncer *this)
{
  pthread_cond_signal((pthread_cond_t *)((char *)this + 64));
  return pthread_mutex_unlock((pthread_mutex_t *)this);
}

CFTypeRef H9ISP::CreateFormatedMetadata(uint64_t a1)
{
  NamedValues *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int16 *v6;
  const char *v7;
  const char *v8;
  int v9;
  const char *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int v18;
  int v19;
  int v20;
  NamedValues *v21;
  NamedValues *v22;
  NamedValues *v23;
  NamedValues *v24;
  NamedValues *v25;
  char *v26;
  NamedValues *v27;
  char *v28;
  uint64_t v29;
  char *v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  const char *v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  const char *v38;
  const char *v39;
  const char *v40;
  const char *v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  const char *v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  const char *v54;
  const char *v55;
  const char *v56;
  const char *v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  const char *v63;
  const char *v64;
  const char *v65;
  const char *v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  const char *v75;
  const char *v76;
  const char *v77;
  const char *v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  const char *v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  const char *v86;
  const char *v87;
  int v88;
  const char *v89;
  int v90;
  const char *v91;
  const char *v92;
  const char *v93;
  unint64_t v94;
  unint64_t v95;
  unsigned int v96;
  unsigned int v97;
  const char *v98;
  int v99;
  NamedValues *v100;
  unint64_t v101;
  CFTypeRef v102;
  uint64_t v104;
  uint64_t v105;
  double v106;
  __CFArray *v107;
  __CFArray *v108;
  CFTypeRef cf;
  int v110;
  unsigned int v111;
  double v112;
  char v113[8];
  char v114[8];
  char v115[8];
  char __str[8];
  char v117;
  char v118[8];
  uint64_t v119;
  uint64_t v120;
  void *__p;
  char v122;
  _QWORD v123[114];

  v123[112] = *MEMORY[0x24BDAC8D0];
  if (*(_WORD *)a1 != 1286)
    return 0;
  NamedValues::NamedValues((NamedValues *)&cf);
  NamedValues::NamedValues((NamedValues *)&v108);
  v3 = *(unsigned int *)(a1 + 16);
  if ((int)v3 >= 1)
  {
    v4 = 0;
    v105 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
    v106 = *MEMORY[0x24BEDB7F0];
    v104 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
    while (1)
    {
      v5 = *(unsigned int *)(a1 + 4 * v4 + 20);
      if ((_DWORD)v5)
        break;
LABEL_120:
      if (++v4 == v3)
        goto LABEL_121;
    }
    NamedValues::NamedValues((NamedValues *)&v107);
    v6 = (unsigned __int16 *)(a1 + v5);
    switch((int)v4)
    {
      case 0:
        *(double *)v118 = COERCE_DOUBLE("unknown");
        switch(*((_DWORD *)v6 + 4))
        {
          case 0:
            *(double *)&v7 = COERCE_DOUBLE("green-red");
            goto LABEL_79;
          case 1:
            *(double *)&v7 = COERCE_DOUBLE("red");
            goto LABEL_79;
          case 2:
            *(double *)&v7 = COERCE_DOUBLE("blue");
            goto LABEL_79;
          case 3:
            *(double *)&v7 = COERCE_DOUBLE("green-blue");
LABEL_79:
            *(double *)v118 = *(double *)&v7;
            break;
          default:
            break;
        }
        *(_QWORD *)__str = "unknown";
        v88 = v6[14];
        if (v88 == 2)
        {
          v89 = "binning 1/4";
        }
        else if (v88 == 1)
        {
          v89 = "binning 1/2";
        }
        else
        {
          if (v6[14])
            goto LABEL_87;
          v89 = "binning disabled";
        }
        *(_QWORD *)__str = v89;
LABEL_87:
        *(_QWORD *)v115 = "unknown";
        v90 = v6[15];
        if (v90 == 2)
        {
          v91 = "binning 1/4";
        }
        else if (v90 == 1)
        {
          v91 = "binning 1/2";
        }
        else
        {
          if (v6[15])
            goto LABEL_94;
          v91 = "binning disabled";
        }
        *(_QWORD *)v115 = v91;
LABEL_94:
        *(_QWORD *)v114 = "unknown";
        switch(v6[34])
        {
          case 0u:
            v92 = "raw8";
            goto LABEL_99;
          case 1u:
            v92 = "raw10";
            goto LABEL_99;
          case 2u:
            v92 = "raw12";
            goto LABEL_99;
          case 3u:
            v92 = "raw14";
LABEL_99:
            *(_QWORD *)v114 = v92;
            break;
          default:
            break;
        }
        *(_QWORD *)v113 = "unknown";
        if (v6[35] == 1)
        {
          v93 = "unpacked";
        }
        else
        {
          if (v6[35])
          {
LABEL_105:
            LODWORD(v112) = *((unsigned __int8 *)v6 + 43);
            LODWORD(v112) = *((unsigned __int8 *)v6 + 44);
            LODWORD(v112) = *((unsigned __int8 *)v6 + 45);
            LODWORD(v112) = *((unsigned __int8 *)v6 + 46);
            LODWORD(v112) = *((unsigned __int8 *)v6 + 47);
            LODWORD(v94) = *((_DWORD *)v6 + 12);
            v112 = (double)v94 * 0.00390625;
            LOWORD(v95) = v6[32];
            v112 = (double)v95 * 0.00390625;
            LODWORD(v112) = *((unsigned __int8 *)v6 + 72);
            LODWORD(v112) = *((unsigned __int8 *)v6 + 73);
            v112 = COERCE_DOUBLE(bswap64(*(_QWORD *)(v6 + 37)));
            *(_QWORD *)&v112 = v6 + 48;
            *(_QWORD *)&v112 = v6 + 64;
            *(_QWORD *)&v112 = v6 + 80;
            *(_QWORD *)&v112 = v6 + 96;
            v96 = *((_DWORD *)v6 + 80);
            v97 = *((_DWORD *)v6 + 81);
            v111 = bswap32(v97);
            LODWORD(v112) = bswap32(v96);
            v110 = v96;
            v110 = BYTE1(v96);
            v110 = BYTE2(v96);
            v110 = HIBYTE(v96) & 0xF;
            v110 = v96 >> 28;
            v110 = HIBYTE(v97);
            v110 = BYTE2(v97);
            v110 = BYTE1(v97);
            v110 = v97;
            v110 = *((unsigned __int8 *)v6 + 338);
            v110 = *((unsigned __int8 *)v6 + 339);
            v110 = *((unsigned __int8 *)v6 + 460);
            v110 = *((unsigned __int8 *)v6 + 461);
            v110 = v6[229];
            v110 = v6[246];
            v110 = v6[247];
            v110 = v6[248];
            v110 = v6[249];
            v110 = *((unsigned __int8 *)v6 + 500);
            v110 = *((unsigned __int8 *)v6 + 501);
            v110 = v6[254];
            v110 = v6[255];
            v110 = v6[256];
            v110 = v6[257];
            v110 = *((_DWORD *)v6 + 129);
            v110 = *((_DWORD *)v6 + 130);
            v110 = *((_DWORD *)v6 + 131);
            v110 = *((_DWORD *)v6 + 132);
            v110 = *((_DWORD *)v6 + 133);
            v110 = *((_DWORD *)v6 + 134);
            v110 = *((_DWORD *)v6 + 135);
            v110 = v6[272];
            v110 = v6[273];
            v110 = v6[282];
            v110 = v6[283];
            v110 = v6[284];
            v110 = v6[285];
            v110 = v6[286];
            v110 = v6[287];
            v110 = v6[288];
            v110 = v6[289];
            v110 = *((_DWORD *)v6 + 145);
            v110 = *((_DWORD *)v6 + 146);
            v110 = v6[294];
            v110 = *((_DWORD *)v6 + 148);
            v110 = *((_DWORD *)v6 + 149);
            v110 = *((_DWORD *)v6 + 150);
            v110 = *((unsigned __int8 *)v6 + 604);
            v110 = *((unsigned __int8 *)v6 + 605);
            v110 = *((_DWORD *)v6 + 152);
            v110 = *((_DWORD *)v6 + 153);
            v110 = *((_DWORD *)v6 + 154);
            v110 = *((_DWORD *)v6 + 155);
            v26 = "Shared Input";
            goto LABEL_118;
          }
          v93 = "packed";
        }
        *(_QWORD *)v113 = v93;
        goto LABEL_105;
      case 1:
        v8 = "unknown";
        *(double *)v118 = COERCE_DOUBLE("unknown");
        v9 = *v6;
        if (v9 == 2)
        {
          *(double *)&v10 = COERCE_DOUBLE("R'G'B'");
        }
        else if (v9 == 1)
        {
          *(double *)&v10 = COERCE_DOUBLE("Y'CbCr 4:2:2");
        }
        else
        {
          if (*v6)
            goto LABEL_74;
          *(double *)&v10 = COERCE_DOUBLE("Y'CbCr 4:2:0");
        }
        *(double *)v118 = *(double *)&v10;
LABEL_74:
        *(_QWORD *)__str = "unknown";
        switch(v6[1])
        {
          case 0u:
            v87 = "BackEnd";
            goto LABEL_110;
          case 1u:
            v87 = "StatsBlock";
            goto LABEL_110;
          case 2u:
            v87 = "RawProcBlock";
            goto LABEL_110;
          case 3u:
            v87 = "RGBProcBlock";
            goto LABEL_110;
          case 4u:
            v87 = "YCCProcBlock";
LABEL_110:
            *(_QWORD *)__str = v87;
            break;
          default:
            break;
        }
        v98 = "RGBY";
        if (!*((_BYTE *)v6 + 9))
          v98 = "RGGB";
        *(_QWORD *)v115 = v98;
        v99 = *((_DWORD *)v6 + 1028);
        if (v99 == 1)
        {
          v8 = "log2";
        }
        else if (!v99)
        {
          v8 = "linear";
        }
        *(_QWORD *)v114 = v8;
        NamedValues::NamedValues((NamedValues *)v113);
        LODWORD(v101) = *((_DWORD *)v6 + 1027);
        v112 = (double)v101 * 0.0625;
        LODWORD(v112) = *((unsigned __int8 *)v6 + 4138);
        LODWORD(v112) = *((unsigned __int8 *)v6 + 4139);
        LODWORD(v112) = *((_DWORD *)v6 + 1035);
        LODWORD(v112) = *((_DWORD *)v6 + 1036);
        LODWORD(v112) = *((_DWORD *)v6 + 1037);
        LODWORD(v112) = *((_DWORD *)v6 + 1038);
        LODWORD(v112) = *((_DWORD *)v6 + 1039);
        LODWORD(v112) = *((_DWORD *)v6 + 1040);
        LODWORD(v112) = *((_DWORD *)v6 + 1041);
        LODWORD(v112) = *((_DWORD *)v6 + 1042);
        LODWORD(v112) = *((_DWORD *)v6 + 1043);
        LODWORD(v112) = *((_DWORD *)v6 + 1044);
        LODWORD(v112) = *((_DWORD *)v6 + 1045);
        LODWORD(v112) = *((_DWORD *)v6 + 1046);
        NamedValues::~NamedValues((NamedValues *)v113);
        v26 = "Shared Output";
LABEL_118:
LABEL_119:
        NamedValues::~NamedValues((NamedValues *)&v107);
        goto LABEL_120;
      case 2:
        LOWORD(v11) = v6[2];
        *(double *)v118 = (double)v11 * 0.00390625;
        LOWORD(v12) = v6[3];
        *(double *)v118 = (double)v12 * 0.00390625;
        LOWORD(v13) = v6[4];
        *(double *)v118 = (double)v13 * 0.00390625;
        *(_DWORD *)v118 = v6[5];
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 13);
        LODWORD(v14) = *((_DWORD *)v6 + 5);
        *(double *)v118 = (double)v14 * 0.0000152587891;
        NamedValues::NamedValues((NamedValues *)v114);
        NamedValues::NamedValues((NamedValues *)v113);
        v15 = 0;
        v16 = a1 + 60 + v5;
        do
        {
          snprintf(__str, 0x40uLL, "row[%d]", v15);
          v17 = 0;
          strcpy(v118, "{");
          v18 = 1;
          do
          {
            v19 = snprintf(&v118[v18], (1024 - v18), "%3d ", *(unsigned __int8 *)(v16 + v17));
            v18 += v19;
            if (v19 <= 0)
              v20 = 1024;
            else
              v20 = v18;
            if (v17 > 0xE)
              break;
            ++v17;
          }
          while (v20 < 1024);
          if (v20 <= 1023)
            snprintf(&v118[v20], (1024 - v20), "}");
          NamedValue::NamedValue((NamedValue *)v115, __str, v118, 0);
          NamedValues::push_back((__CFArray **)v113, (const void **)v115);
          NamedValue::~NamedValue((NamedValue *)v115);
          ++v15;
          v16 += 16;
        }
        while (v15 != 32);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 1732);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 434);
        *(_DWORD *)v118 = v6[870];
        *(_DWORD *)v118 = v6[871];
        *(_DWORD *)v118 = v6[872];
        *(_DWORD *)v118 = *((_DWORD *)v6 + 437);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 438);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 439);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 440);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 441);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 442);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 443);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 444);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 445);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 446);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 447);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 448);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 449);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 450);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 451);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 452);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 453);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 454);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 455);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 456);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 457);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 458);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 459);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 460);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 461);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 462);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 463);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 464);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 465);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 466);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 467);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 468);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 469);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 470);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 471);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 472);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 473);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 474);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 475);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 476);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 477);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 478);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 479);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 480);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 481);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 482);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 483);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 484);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 485);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 486);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 487);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 488);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 489);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 490);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 491);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 492);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 493);
        *(_DWORD *)v118 = v6[988];
        *(_DWORD *)v118 = v6[989];
        *(_DWORD *)v118 = v6[990];
        *(_DWORD *)v118 = v6[991];
        *(_DWORD *)v118 = v6[992];
        *(_DWORD *)v118 = *((_DWORD *)v6 + 497);
        NamedValues::NamedValues((NamedValues *)v118);
        *(_DWORD *)v115 = *((unsigned __int8 *)v6 + 592);
        *(_DWORD *)v115 = *((unsigned __int8 *)v6 + 593);
        NamedValues::NamedValues((NamedValues *)v115);
        LODWORD(v112) = *((_DWORD *)v6 + 405);
        LODWORD(v112) = *((_DWORD *)v6 + 406);
        LODWORD(v112) = *((_DWORD *)v6 + 407);
        LODWORD(v112) = *((_DWORD *)v6 + 408);
        LODWORD(v112) = *((_DWORD *)v6 + 409);
        LODWORD(v112) = *((_DWORD *)v6 + 410);
        LODWORD(v112) = *((_DWORD *)v6 + 411);
        LODWORD(v112) = *((_DWORD *)v6 + 412);
        LODWORD(v112) = *((_DWORD *)v6 + 413);
        LODWORD(v112) = *((_DWORD *)v6 + 414);
        LODWORD(v112) = *((_DWORD *)v6 + 415);
        LODWORD(v112) = *((_DWORD *)v6 + 416);
        NamedValues::~NamedValues((NamedValues *)v115);
        NamedValues::~NamedValues((NamedValues *)v118);
        NamedValues::~NamedValues((NamedValues *)v113);
        NamedValues::~NamedValues((NamedValues *)v114);
        v26 = "Shared Auto Exposure";
        goto LABEL_118;
      case 3:
        NamedValues::NamedValues((NamedValues *)v114);
        *(_DWORD *)v118 = v6[80];
        *(_DWORD *)v118 = v6[81];
        *(_DWORD *)v118 = v6[82];
        *(_DWORD *)v118 = v6[83];
        *(_DWORD *)v118 = v6[1292];
        *(_DWORD *)v118 = v6[1293];
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 2716);
        *(_DWORD *)v118 = v6[1360];
        *(_DWORD *)v118 = v6[1361];
        *(_DWORD *)v118 = *((_DWORD *)v6 + 682);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 2732);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 2733);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 2734);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 684);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 685);
        *(_DWORD *)v118 = (__int16)v6[1372];
        *(_DWORD *)v118 = v6[1373];
        std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v118);
        std::ostream::operator<<();
        std::stringbuf::str();
        if (v117 >= 0)
          v28 = __str;
        else
          v28 = *(char **)__str;
        NamedValue::NamedValue((NamedValue *)v115, "lastFocusingMethod", v28, 0);
        if (v117 < 0)
          operator delete(*(void **)__str);
        NamedValues::push_back(&v107, (const void **)v115);
        NamedValue::~NamedValue((NamedValue *)v115);
        *(double *)v118 = v106;
        *(_QWORD *)&v118[*(_QWORD *)(*(_QWORD *)&v106 - 24)] = v105;
        v29 = MEMORY[0x24BEDB848];
        v119 = v104;
        v120 = MEMORY[0x24BEDB848] + 16;
        if (v122 < 0)
          operator delete(__p);
        std::streambuf::~streambuf();
        std::iostream::~basic_iostream();
        MEMORY[0x242636AD8](v123);
        *(_DWORD *)v118 = v6[1390];
        *(_DWORD *)v118 = v6[1391];
        *(_DWORD *)v118 = v6[1392];
        *(_DWORD *)v118 = v6[1393];
        *(_DWORD *)v118 = v6[1394];
        *(_DWORD *)v118 = *((_DWORD *)v6 + 775);
        std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v118);
        std::ostream::operator<<();
        std::stringbuf::str();
        if (v117 >= 0)
          v30 = __str;
        else
          v30 = *(char **)__str;
        NamedValue::NamedValue((NamedValue *)v115, "roiType", v30, 0);
        if (v117 < 0)
          operator delete(*(void **)__str);
        NamedValues::push_back(&v107, (const void **)v115);
        NamedValue::~NamedValue((NamedValue *)v115);
        *(double *)v118 = v106;
        *(_QWORD *)&v118[*(_QWORD *)(*(_QWORD *)&v106 - 24)] = v105;
        v119 = v104;
        v120 = v29 + 16;
        if (v122 < 0)
          operator delete(__p);
        std::streambuf::~streambuf();
        std::iostream::~basic_iostream();
        MEMORY[0x242636AD8](v123);
        NamedValues::~NamedValues((NamedValues *)v114);
        v26 = "Shared Auto Focus";
        goto LABEL_118;
      case 4:
        LOWORD(v31) = v6[6];
        LOWORD(v32) = v6[7];
        LOWORD(v33) = v6[8];
        LOWORD(v35) = v6[9];
        LOWORD(v36) = v6[10];
        LOWORD(v37) = v6[11];
        LOWORD(v42) = v6[21];
        *(double *)v118 = (double)v42 * 0.0000610351562;
        LOWORD(v43) = v6[22];
        *(double *)v118 = (double)v43 * 0.0000610351562;
        LODWORD(v44) = *((_DWORD *)v6 + 13);
        *(double *)v118 = (double)v44 * 0.000244140625;
        *(_DWORD *)v118 = v6[73];
        *(_DWORD *)v118 = v6[86];
        *(_DWORD *)v118 = v6[87];
        *(_DWORD *)v118 = v6[88];
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 178);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 179);
        *(_DWORD *)v118 = v6[90];
        *(_DWORD *)v118 = v6[91];
        *(_DWORD *)v118 = v6[92];
        *(_DWORD *)v118 = v6[93];
        *(_DWORD *)v118 = v6[94];
        *(_DWORD *)v118 = v6[95];
        *(_DWORD *)v118 = v6[96];
        *(_DWORD *)v118 = v6[97];
        *(_DWORD *)v118 = v6[98];
        *(_DWORD *)v118 = v6[99];
        *(_DWORD *)v118 = *((_DWORD *)v6 + 68);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 86);
        LOWORD(v45) = v6[138];
        *(double *)v118 = (double)v45 * 0.0000610351562;
        LOWORD(v46) = v6[139];
        *(double *)v118 = (double)v46 * 0.0000610351562;
        *(_DWORD *)v118 = *((_DWORD *)v6 + 70);
        LODWORD(v47) = *((_DWORD *)v6 + 71);
        LODWORD(v48) = *((_DWORD *)v6 + 72);
        LODWORD(v49) = *((_DWORD *)v6 + 73);
        LODWORD(v51) = *((_DWORD *)v6 + 74);
        LODWORD(v52) = *((_DWORD *)v6 + 75);
        LODWORD(v53) = *((_DWORD *)v6 + 76);
        v26 = "Shared Auto White Balance";
        goto LABEL_118;
      case 5:
        v26 = "Adaptive Tone Curve";
        goto LABEL_118;
      case 6:
        *(_DWORD *)v118 = *v6;
        *(_DWORD *)v118 = v6[1];
        *(_DWORD *)v118 = v6[2];
        *(_DWORD *)v118 = v6[3];
        *(_DWORD *)v118 = v6[4];
        *(_DWORD *)v118 = v6[5];
        v26 = "Shared LTM";
        goto LABEL_118;
      case 7:
        LODWORD(v58) = *((_DWORD *)v6 + 5);
        *(double *)v118 = (double)v58 * 0.00390625;
        LODWORD(v59) = *((_DWORD *)v6 + 10);
        *(double *)v118 = (double)v59 * 0.00390625;
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 60);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 61);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 62);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 63);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 64);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 65);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 66);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 67);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 68);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 69);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 70);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 71);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 72);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 73);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 74);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 75);
        *(_DWORD *)v118 = v6[38];
        *(_DWORD *)v118 = v6[39];
        *(_DWORD *)v118 = (__int16)v6[40];
        *(_DWORD *)v118 = v6[41];
        LOWORD(v60) = v6[44];
        LOWORD(v61) = v6[45];
        LOWORD(v62) = v6[46];
        LOWORD(v67) = v6[56];
        *(double *)v118 = (double)v67 * 0.0000610351562;
        LOWORD(v68) = v6[57];
        *(double *)v118 = (double)v68 * 0.0000610351562;
        LOWORD(v69) = v6[58];
        *(double *)v118 = (double)v69 * 0.000244140625;
        LOWORD(v70) = v6[59];
        *(double *)v118 = (double)v70 * 0.000244140625;
        LOWORD(v71) = v6[60];
        *(double *)v118 = (double)v71 * 0.000244140625;
        LOWORD(v72) = v6[61];
        *(double *)v118 = (double)v72 * 0.000244140625;
        LOWORD(v73) = v6[62];
        *(double *)v118 = (double)v73 * 0.000244140625;
        LOWORD(v74) = v6[63];
        *(double *)v118 = (double)v74 * 0.000244140625;
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 128);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 129);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 132);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 133);
        *(_DWORD *)v118 = v6[67];
        *(_DWORD *)v118 = v6[68];
        *(_DWORD *)v118 = v6[69];
        *(_DWORD *)v118 = v6[76];
        *(_DWORD *)v118 = v6[77];
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 160);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 161);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 162);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 41);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 44);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 45);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 46);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 47);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 48);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 49);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 50);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 51);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 52);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 53);
        *(_DWORD *)v118 = v6[108];
        *(_DWORD *)v118 = v6[109];
        v26 = "Shared RAW Proc";
        goto LABEL_118;
      case 8:
        *(_DWORD *)v118 = v6[2];
        *(_DWORD *)v118 = v6[275];
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 552);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 553);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 554);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 640);
        v26 = "Shared RGB Proc";
        goto LABEL_118;
      case 9:
        *(_DWORD *)v118 = *v6;
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 2);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 3);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 4);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 5);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 6);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 7);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 8);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 9);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 10);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 11);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 12);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 13);
        *(_DWORD *)v118 = v6[7];
        *(_DWORD *)v118 = v6[8];
        *(_DWORD *)v118 = v6[9];
        *(_DWORD *)v118 = v6[10];
        *(_DWORD *)v118 = v6[11];
        *(_DWORD *)v118 = v6[12];
        *(_DWORD *)v118 = v6[79];
        *(_DWORD *)v118 = v6[80];
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 162);
        *(_DWORD *)v118 = v6[82];
        *(_DWORD *)v118 = v6[83];
        *(_DWORD *)v118 = v6[84];
        *(_DWORD *)v118 = *((_DWORD *)v6 + 43);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 44);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 45);
        v26 = "Shared YCC Proc";
        goto LABEL_118;
      case 10:
        *(_DWORD *)v118 = *(unsigned __int8 *)v6;
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 1);
        v26 = "Shared BES Proc";
        goto LABEL_118;
      case 11:
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 164);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 165);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 166);
        *(_DWORD *)v118 = v6[84];
        *(_DWORD *)v118 = v6[85];
        *(_DWORD *)v118 = v6[86];
        *(_DWORD *)v118 = v6[87];
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 166);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 166);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 166);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 166);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 166);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 166);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 166);
        *(_DWORD *)v118 = v6[90];
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 182);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 183);
        *(_DWORD *)v118 = v6[94];
        *(_DWORD *)v118 = v6[95];
        *(_DWORD *)v118 = v6[96];
        *(_DWORD *)v118 = v6[97];
        *(_DWORD *)v118 = v6[98];
        *(_DWORD *)v118 = v6[99];
        *(_DWORD *)v118 = v6[100];
        *(_DWORD *)v118 = v6[101];
        LOWORD(v79) = v6[106];
        LOWORD(v80) = v6[107];
        LOWORD(v81) = v6[108];
        LOWORD(v83) = v6[109];
        LOWORD(v84) = v6[110];
        LOWORD(v85) = v6[111];
        *(_DWORD *)v118 = v6[112];
        *(_DWORD *)v118 = v6[113];
        *(_DWORD *)v118 = v6[118];
        *(_DWORD *)v118 = v6[119];
        *(_DWORD *)v118 = v6[120];
        *(_DWORD *)v118 = v6[121];
        *(_DWORD *)v118 = v6[124];
        *(_DWORD *)v118 = v6[125];
        *(_DWORD *)v118 = v6[132];
        *(_DWORD *)v118 = v6[133];
        *(_DWORD *)v118 = v6[134];
        *(_DWORD *)v118 = v6[135];
        *(_DWORD *)v118 = v6[136];
        *(_DWORD *)v118 = v6[137];
        *(_DWORD *)v118 = v6[138];
        *(_DWORD *)v118 = v6[139];
        *(_DWORD *)v118 = v6[260];
        *(_DWORD *)v118 = v6[261];
        *(_DWORD *)v118 = v6[262];
        *(_DWORD *)v118 = v6[263];
        *(_DWORD *)v118 = v6[264];
        *(_DWORD *)v118 = v6[265];
        *(_DWORD *)v118 = *((_DWORD *)v6 + 133);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 134);
        v26 = "Shared Stats";
        goto LABEL_118;
      case 12:
        v26 = "Shared Debug";
        goto LABEL_118;
      case 13:
        v26 = "Shared OIS";
        goto LABEL_118;
      case 14:
        v26 = "Shared FocusPixel";
        goto LABEL_118;
      case 15:
        *(_DWORD *)v118 = *v6;
        *(_DWORD *)v118 = v6[1];
        *(_DWORD *)v118 = v6[2];
        *(_DWORD *)v118 = v6[3];
        *(_DWORD *)v118 = v6[4];
        *(_DWORD *)v118 = v6[5];
        v26 = "Shared LocalHist";
        goto LABEL_118;
      case 16:
        v26 = "Shared VIS";
        goto LABEL_118;
      case 17:
        v26 = "Shared TNR";
        goto LABEL_118;
      case 18:
        *(_DWORD *)v118 = (__int16)v6[8];
        *(_DWORD *)v118 = (__int16)v6[9];
        *(_DWORD *)v118 = (__int16)v6[10];
        *(_DWORD *)v118 = (__int16)v6[11];
        *(_DWORD *)v118 = (__int16)v6[12];
        *(_DWORD *)v118 = (__int16)v6[13];
        *(_DWORD *)v118 = (__int16)v6[14];
        *(_DWORD *)v118 = (__int16)v6[15];
        *(_DWORD *)v118 = v6[16];
        *(_DWORD *)v118 = v6[17];
        *(_DWORD *)v118 = v6[28];
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 58);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 59);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 60);
        v26 = "Shared System";
        goto LABEL_118;
      case 19:
        *(_DWORD *)v118 = v6[11523];
        *(_DWORD *)v118 = v6[11524];
        *(_DWORD *)v118 = v6[11525];
        *(_DWORD *)v118 = v6[11526];
        *(_DWORD *)v118 = v6[11527];
        *(_DWORD *)v118 = v6[11528];
        *(_DWORD *)v118 = v6[11529];
        *(_DWORD *)v118 = v6[11530];
        *(_DWORD *)v118 = v6[11531];
        v26 = "Shared LTM LUTs";
        goto LABEL_118;
      case 20:
        v26 = "Shared VIS Info";
        goto LABEL_118;
      case 21:
        v26 = "Shared Motion Info";
        goto LABEL_118;
      case 22:
        *(_DWORD *)v118 = *(unsigned __int8 *)v6;
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 1);
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 2);
        v26 = "Shared AF FocusMap";
        goto LABEL_118;
      case 23:
        *(_DWORD *)v118 = *(_DWORD *)v6;
        v26 = "Shared DMA Config";
        goto LABEL_118;
      case 24:
        *(_DWORD *)v118 = *v6;
        *(_DWORD *)v118 = v6[1];
        *(_DWORD *)v118 = v6[2];
        *(_DWORD *)v118 = v6[3];
        *(_DWORD *)v118 = v6[4];
        *(_DWORD *)v118 = v6[5];
        *(_DWORD *)v118 = v6[6];
        *(_DWORD *)v118 = v6[7];
        *(_DWORD *)v118 = v6[8];
        *(_DWORD *)v118 = v6[9];
        v26 = "Shared HITH";
        goto LABEL_118;
      case 25:
        *(_DWORD *)v118 = *v6;
        *(_DWORD *)v118 = v6[1];
        v26 = "Shared APS";
        goto LABEL_118;
      case 26:
        v26 = "Shared SideBand";
        goto LABEL_118;
      case 27:
        *(_DWORD *)v118 = *(_DWORD *)v6;
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 4);
        v26 = "Shared VisionProc";
        goto LABEL_118;
      case 28:
        *(_DWORD *)v118 = *v6;
        *(_DWORD *)v118 = v6[1];
        *(_DWORD *)v118 = v6[2];
        *(_DWORD *)v118 = v6[3];
        *(_DWORD *)v118 = *((_DWORD *)v6 + 2);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 3);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 4);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 5);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 6);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 7);
        *(double *)v118 = (double)*((int *)v6 + 10) * 0.03125;
        *(double *)v118 = (double)*((int *)v6 + 11) * 0.03125;
        *(double *)v118 = (double)*((int *)v6 + 12) * 0.03125;
        *(double *)v118 = (double)*((int *)v6 + 13) * 0.03125;
        *(double *)v118 = (double)*((int *)v6 + 14) * 0.03125;
        *(double *)v118 = (double)*((int *)v6 + 15) * 0.03125;
        v26 = "Shared Projector";
        goto LABEL_118;
      case 29:
        *(_DWORD *)v118 = *(_DWORD *)v6;
        *(_DWORD *)v118 = *((_DWORD *)v6 + 1);
        v26 = "Shared BodyDetector";
        goto LABEL_118;
      case 30:
        *(_DWORD *)v118 = *v6;
        *(_DWORD *)v118 = v6[1];
        *(_DWORD *)v118 = *((_DWORD *)v6 + 5);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 6);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 7);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 8);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 9);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 10);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 11);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 12);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 13);
        *(_DWORD *)v118 = v6[30];
        *(_DWORD *)v118 = *((_DWORD *)v6 + 16);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 17);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 18);
        v26 = "Shared Distortion";
        goto LABEL_118;
      case 31:
        v26 = "BodyDetector Debug";
        goto LABEL_118;
      case 32:
        *(_DWORD *)v118 = *v6;
        *(_DWORD *)v118 = v6[1];
        v26 = "PDE Debug";
        goto LABEL_118;
      case 33:
        *(_DWORD *)v118 = *v6;
        *(_DWORD *)v118 = v6[1];
        *(double *)v118 = (double)*((int *)v6 + 3) * 0.03125;
        *(double *)v118 = (double)*((int *)v6 + 4) * 0.03125;
        *(double *)v118 = (double)*((int *)v6 + 5) * 0.03125;
        *(double *)v118 = (double)*((int *)v6 + 6) * 0.03125;
        *(_DWORD *)v118 = *((_DWORD *)v6 + 7);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 8);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 9);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 10);
        v26 = "Shared Powersupply";
        goto LABEL_118;
      case 34:
        *(_DWORD *)v118 = *v6;
        *(_DWORD *)v118 = v6[1];
        *(_DWORD *)v118 = *((_DWORD *)v6 + 1);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 2);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 3);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 4);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 5);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 6);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 7);
        *(_DWORD *)v118 = v6[16];
        *(_DWORD *)v118 = v6[17];
        *(_DWORD *)v118 = *((_DWORD *)v6 + 9);
        *(_DWORD *)v118 = v6[20];
        *(_DWORD *)v118 = v6[21];
        *(_DWORD *)v118 = v6[22];
        *(_DWORD *)v118 = v6[23];
        *(_DWORD *)v118 = *((unsigned __int8 *)v6 + 51);
        *(_DWORD *)v118 = v6[24];
        *(_DWORD *)v118 = *((_DWORD *)v6 + 13);
        *(_DWORD *)v118 = (__int16)v6[28];
        *(_DWORD *)v118 = v6[29];
        *(_DWORD *)v118 = *((_DWORD *)v6 + 15);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 16);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 17);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 18);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 19);
        *(_DWORD *)v118 = v6[40];
        *(_DWORD *)v118 = *((_DWORD *)v6 + 21);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 22);
        *(_DWORD *)v118 = *((_DWORD *)v6 + 29);
        v26 = "Shared Slave";
        goto LABEL_118;
      case 35:
        *(_DWORD *)v118 = *v6;
        *(_DWORD *)v118 = v6[1];
        *(_DWORD *)v118 = *((_DWORD *)v6 + 1);
        v26 = "Shared MasterSlaveAF";
        goto LABEL_118;
      case 36:
        *(_DWORD *)v118 = *v6;
        *(_DWORD *)v118 = v6[1];
        *(_DWORD *)v118 = v6[2];
        *(_DWORD *)v118 = v6[3];
        *(_DWORD *)v118 = v6[4];
        *(_DWORD *)v118 = v6[5];
        v26 = "Shared YCC Histogram";
        goto LABEL_118;
      default:
        goto LABEL_119;
    }
  }
LABEL_121:
  v102 = cf;
  CFRetain(cf);
  NamedValues::~NamedValues((NamedValues *)&v108);
  NamedValues::~NamedValues((NamedValues *)&cf);
  return v102;
}

void sub_23D698700(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, int a18, __int16 a19, char a20,char a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,uint64_t a27,char a28,int a29,__int16 a30,char a31,char a32,int a33,__int16 a34,char a35,char a36,void *__p,uint64_t a38,int a39,__int16 a40,char a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48)
{
  NamedValues::~NamedValues((NamedValues *)&a30);
  NamedValues::~NamedValues((NamedValues *)&a17);
  NamedValues::~NamedValues((NamedValues *)&a19);
  NamedValues::~NamedValues((NamedValues *)&a23);
  _Unwind_Resume(a1);
}

void `anonymous namespace'::AppendMetadataList(__CFArray **this, NamedValues *a2, __CFArray **a3, NamedValues *a4)
{
  const void *v5;

  NamedValue::NamedValue((NamedValue *)&v5, (const char *)a2, 0, *a3);
  NamedValues::push_back(this, &v5);
  NamedValue::~NamedValue((NamedValue *)&v5);
}

void sub_23D698A28(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  NamedValue::~NamedValue((NamedValue *)va);
  _Unwind_Resume(a1);
}

uint64_t `anonymous namespace'::AppendMetadataItem<unsigned short>(__CFArray **a1, const char *a2, _WORD *a3, int a4)
{
  const char *v8;
  uint64_t v9;
  _QWORD *v10;
  const char *p_p;
  uint64_t v12;
  void *__p;
  char v15;
  const void *v16;
  _QWORD v17[2];
  _QWORD v18[11];
  char v19;
  uint64_t v20;

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v17);
  if (a4 == 1)
  {
    v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)"0x", 2);
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
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)v8, v9);
LABEL_12:
  std::stringbuf::str();
  if (v15 >= 0)
    p_p = (const char *)&__p;
  else
    p_p = (const char *)__p;
  NamedValue::NamedValue((NamedValue *)&v16, a2, p_p, 0);
  if (v15 < 0)
    operator delete(__p);
  NamedValues::push_back(a1, &v16);
  NamedValue::~NamedValue((NamedValue *)&v16);
  v17[0] = *MEMORY[0x24BEDB7F0];
  v12 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)v17 + *(_QWORD *)(v17[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  v18[0] = v12;
  v18[1] = MEMORY[0x24BEDB848] + 16;
  if (v19 < 0)
    operator delete((void *)v18[9]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x242636AD8](&v20);
}

void sub_23D698BC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, __int16 a18, char a19, char a20)
{
  NamedValue::~NamedValue((NamedValue *)&a16);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a18);
  _Unwind_Resume(a1);
}

uint64_t `anonymous namespace'::AppendMetadataItem<unsigned long long>(__CFArray **a1, const char *a2, uint64_t a3, int a4)
{
  _QWORD *v7;
  const char *p_p;
  uint64_t v9;
  void *__p;
  char v12;
  const void *v13;
  _QWORD v14[2];
  _QWORD v15[11];
  char v16;
  uint64_t v17;

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v14);
  if (a4 == 1)
  {
    v7 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)"0x", 2);
    *(_DWORD *)((char *)v7 + *(_QWORD *)(*v7 - 24) + 8) = *(_DWORD *)((_BYTE *)v7 + *(_QWORD *)(*v7 - 24) + 8) & 0xFFFFFFB5 | 8;
  }
  std::ostream::operator<<();
  std::stringbuf::str();
  if (v12 >= 0)
    p_p = (const char *)&__p;
  else
    p_p = (const char *)__p;
  NamedValue::NamedValue((NamedValue *)&v13, a2, p_p, 0);
  if (v12 < 0)
    operator delete(__p);
  NamedValues::push_back(a1, &v13);
  NamedValue::~NamedValue((NamedValue *)&v13);
  v14[0] = *MEMORY[0x24BEDB7F0];
  v9 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)v14 + *(_QWORD *)(v14[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  v15[0] = v9;
  v15[1] = MEMORY[0x24BEDB848] + 16;
  if (v16 < 0)
    operator delete((void *)v15[9]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x242636AD8](&v17);
}

void sub_23D698D48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, __int16 a18, char a19, char a20)
{
  NamedValue::~NamedValue((NamedValue *)&a16);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a18);
  _Unwind_Resume(a1);
}

uint64_t `anonymous namespace'::AppendMetadataItem<unsigned int>(__CFArray **a1, const char *a2, _DWORD *a3, int a4)
{
  const char *v8;
  uint64_t v9;
  _QWORD *v10;
  const char *p_p;
  uint64_t v12;
  void *__p;
  char v15;
  const void *v16;
  _QWORD v17[2];
  _QWORD v18[11];
  char v19;
  uint64_t v20;

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v17);
  if (a4 == 1)
  {
    v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)"0x", 2);
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
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)v8, v9);
LABEL_12:
  std::stringbuf::str();
  if (v15 >= 0)
    p_p = (const char *)&__p;
  else
    p_p = (const char *)__p;
  NamedValue::NamedValue((NamedValue *)&v16, a2, p_p, 0);
  if (v15 < 0)
    operator delete(__p);
  NamedValues::push_back(a1, &v16);
  NamedValue::~NamedValue((NamedValue *)&v16);
  v17[0] = *MEMORY[0x24BEDB7F0];
  v12 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)v17 + *(_QWORD *)(v17[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  v18[0] = v12;
  v18[1] = MEMORY[0x24BEDB848] + 16;
  if (v19 < 0)
    operator delete((void *)v18[9]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x242636AD8](&v20);
}

void sub_23D698F0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, __int16 a18, char a19, char a20)
{
  NamedValue::~NamedValue((NamedValue *)&a16);
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

void sub_23D699050(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::iostream::~basic_iostream();
  MEMORY[0x242636AD8](v1);
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
  MEMORY[0x242636AD8](a1 + 128);
  return a1;
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

  MEMORY[0x242636A24](v13, a1);
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
  MEMORY[0x242636A30](v13);
  return a1;
}

void sub_23D699208(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x242636A30](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x23D6991E8);
}

void sub_23D699250(_Unwind_Exception *a1)
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

void sub_23D699384(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
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
  __cxa_throw(exception, (struct type_info *)off_250E2C488, MEMORY[0x24BEDAAF0]);
}

void sub_23D699498(_Unwind_Exception *a1)
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
  uint64_t v9;
  void *__p;
  char v12;
  const void *v13;
  _QWORD v14[2];
  _QWORD v15[11];
  char v16;
  uint64_t v17;

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v14);
  v6 = *a3;
  v7 = strlen(v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)v6, v7);
  std::stringbuf::str();
  if (v12 >= 0)
    p_p = (const char *)&__p;
  else
    p_p = (const char *)__p;
  NamedValue::NamedValue((NamedValue *)&v13, a2, p_p, 0);
  if (v12 < 0)
    operator delete(__p);
  NamedValues::push_back(a1, &v13);
  NamedValue::~NamedValue((NamedValue *)&v13);
  v14[0] = *MEMORY[0x24BEDB7F0];
  v9 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)v14 + *(_QWORD *)(v14[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  v15[0] = v9;
  v15[1] = MEMORY[0x24BEDB848] + 16;
  if (v16 < 0)
    operator delete((void *)v15[9]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x242636AD8](&v17);
}

void sub_23D6995EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, __int16 a18, char a19, char a20)
{
  NamedValue::~NamedValue((NamedValue *)&a16);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a18);
  _Unwind_Resume(a1);
}

uint64_t `anonymous namespace'::AppendMetadataItem<unsigned char>(__CFArray **a1, const char *a2, _BYTE *a3, int a4)
{
  const char *v8;
  uint64_t v9;
  void **v10;
  uint64_t v11;
  void *__p[2];
  char v14;
  const void *v15;
  _QWORD v16[2];
  _QWORD v17[11];
  char v18;
  uint64_t v19;

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v16);
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
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)v8, v9);
    goto LABEL_17;
  }
  LOBYTE(__p[0]) = *a3;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)__p, 1);
LABEL_17:
  std::stringbuf::str();
  if (v14 >= 0)
    v10 = __p;
  else
    v10 = (void **)__p[0];
  NamedValue::NamedValue((NamedValue *)&v15, a2, (const char *)v10, 0);
  if (v14 < 0)
    operator delete(__p[0]);
  NamedValues::push_back(a1, &v15);
  NamedValue::~NamedValue((NamedValue *)&v15);
  v16[0] = *MEMORY[0x24BEDB7F0];
  v11 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)v16 + *(_QWORD *)(v16[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  v17[0] = v11;
  v17[1] = MEMORY[0x24BEDB848] + 16;
  if (v18 < 0)
    operator delete((void *)v17[9]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x242636AD8](&v19);
}

void sub_23D6997B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, __int16 a18, char a19, char a20)
{
  NamedValue::~NamedValue((NamedValue *)&a16);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a18);
  _Unwind_Resume(a1);
}

uint64_t `anonymous namespace'::AppendMetadataItem<int>(__CFArray **a1, const char *a2, uint64_t a3, int a4)
{
  _QWORD *v7;
  const char *p_p;
  uint64_t v9;
  void *__p;
  char v12;
  const void *v13;
  _QWORD v14[2];
  _QWORD v15[11];
  char v16;
  uint64_t v17;

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v14);
  if (a4 == 1)
  {
    v7 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)"0x", 2);
    *(_DWORD *)((char *)v7 + *(_QWORD *)(*v7 - 24) + 8) = *(_DWORD *)((_BYTE *)v7 + *(_QWORD *)(*v7 - 24) + 8) & 0xFFFFFFB5 | 8;
  }
  std::ostream::operator<<();
  std::stringbuf::str();
  if (v12 >= 0)
    p_p = (const char *)&__p;
  else
    p_p = (const char *)__p;
  NamedValue::NamedValue((NamedValue *)&v13, a2, p_p, 0);
  if (v12 < 0)
    operator delete(__p);
  NamedValues::push_back(a1, &v13);
  NamedValue::~NamedValue((NamedValue *)&v13);
  v14[0] = *MEMORY[0x24BEDB7F0];
  v9 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)v14 + *(_QWORD *)(v14[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  v15[0] = v9;
  v15[1] = MEMORY[0x24BEDB848] + 16;
  if (v16 < 0)
    operator delete((void *)v15[9]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x242636AD8](&v17);
}

void sub_23D69993C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, __int16 a18, char a19, char a20)
{
  NamedValue::~NamedValue((NamedValue *)&a16);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a18);
  _Unwind_Resume(a1);
}

uint64_t `anonymous namespace'::AppendMetadataItem<double>(__CFArray **a1, const char *a2)
{
  const char *p_p;
  uint64_t v5;
  void *__p;
  char v8;
  const void *v9;
  _QWORD v10[13];
  char v11;
  uint64_t v12;

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v10);
  std::ostream::operator<<();
  std::stringbuf::str();
  if (v8 >= 0)
    p_p = (const char *)&__p;
  else
    p_p = (const char *)__p;
  NamedValue::NamedValue((NamedValue *)&v9, a2, p_p, 0);
  if (v8 < 0)
    operator delete(__p);
  NamedValues::push_back(a1, &v9);
  NamedValue::~NamedValue((NamedValue *)&v9);
  v10[0] = *MEMORY[0x24BEDB7F0];
  v5 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)v10 + *(_QWORD *)(v10[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  v10[2] = v5;
  v10[3] = MEMORY[0x24BEDB848] + 16;
  if (v11 < 0)
    operator delete((void *)v10[11]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x242636AD8](&v12);
}

void sub_23D699A84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, __int16 a18, char a19, char a20)
{
  NamedValue::~NamedValue((NamedValue *)&a16);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a18);
  _Unwind_Resume(a1);
}

uint64_t `anonymous namespace'::AppendMetadataItem<short>(__CFArray **a1, const char *a2, _WORD *a3, int a4)
{
  const char *v8;
  uint64_t v9;
  _QWORD *v10;
  const char *p_p;
  uint64_t v12;
  void *__p;
  char v15;
  const void *v16;
  _QWORD v17[2];
  _QWORD v18[11];
  char v19;
  uint64_t v20;

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v17);
  if (a4 == 1)
  {
    v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)"0x", 2);
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
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)v8, v9);
LABEL_12:
  std::stringbuf::str();
  if (v15 >= 0)
    p_p = (const char *)&__p;
  else
    p_p = (const char *)__p;
  NamedValue::NamedValue((NamedValue *)&v16, a2, p_p, 0);
  if (v15 < 0)
    operator delete(__p);
  NamedValues::push_back(a1, &v16);
  NamedValue::~NamedValue((NamedValue *)&v16);
  v17[0] = *MEMORY[0x24BEDB7F0];
  v12 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)v17 + *(_QWORD *)(v17[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  v18[0] = v12;
  v18[1] = MEMORY[0x24BEDB848] + 16;
  if (v19 < 0)
    operator delete((void *)v18[9]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x242636AD8](&v20);
}

void sub_23D699C48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, __int16 a18, char a19, char a20)
{
  NamedValue::~NamedValue((NamedValue *)&a16);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a18);
  _Unwind_Resume(a1);
}

uint64_t `anonymous namespace'::AppendMetadataItem<char [4]>(__CFArray **a1, const char *a2)
{
  const char *p_p;
  uint64_t v5;
  void *__p;
  char v8;
  const void *v9;
  _QWORD v10[2];
  _QWORD v11[11];
  char v12;
  uint64_t v13;

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v10);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)"...", 3);
  std::stringbuf::str();
  if (v8 >= 0)
    p_p = (const char *)&__p;
  else
    p_p = (const char *)__p;
  NamedValue::NamedValue((NamedValue *)&v9, a2, p_p, 0);
  if (v8 < 0)
    operator delete(__p);
  NamedValues::push_back(a1, &v9);
  NamedValue::~NamedValue((NamedValue *)&v9);
  v10[0] = *MEMORY[0x24BEDB7F0];
  v5 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)v10 + *(_QWORD *)(v10[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  v11[0] = v5;
  v11[1] = MEMORY[0x24BEDB848] + 16;
  if (v12 < 0)
    operator delete((void *)v11[9]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x242636AD8](&v13);
}

void sub_23D699D94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, __int16 a18, char a19, char a20)
{
  NamedValue::~NamedValue((NamedValue *)&a16);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a18);
  _Unwind_Resume(a1);
}

uint64_t `anonymous namespace'::AppendMetadataItem(__CFArray **this, NamedValues *a2, const char *a3, double a4, double a5, double a6)
{
  _QWORD *v8;
  _QWORD *v9;
  const char *p_p;
  uint64_t v11;
  void *__p;
  char v14;
  const void *v15;
  _QWORD v16[2];
  _QWORD v17[11];
  char v18;
  uint64_t v19;

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v16);
  *(_QWORD *)((char *)&v17[2] + *(_QWORD *)(v17[0] - 24)) = 5;
  v8 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)", ", 2);
  v9 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)", ", 2);
  std::ostream::operator<<();
  std::stringbuf::str();
  if (v14 >= 0)
    p_p = (const char *)&__p;
  else
    p_p = (const char *)__p;
  NamedValue::NamedValue((NamedValue *)&v15, (const char *)a2, p_p, 0);
  if (v14 < 0)
    operator delete(__p);
  NamedValues::push_back(this, &v15);
  NamedValue::~NamedValue((NamedValue *)&v15);
  v16[0] = *MEMORY[0x24BEDB7F0];
  v11 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)v16 + *(_QWORD *)(v16[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  v17[0] = v11;
  v17[1] = MEMORY[0x24BEDB848] + 16;
  if (v18 < 0)
    operator delete((void *)v17[9]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x242636AD8](&v19);
}

void sub_23D699F3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, __int16 a18, char a19, char a20)
{
  NamedValue::~NamedValue((NamedValue *)&a16);
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
  return MEMORY[0x24BEDAF48]();
}

{
  return MEMORY[0x24BEDAF50]();
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
  off_250E2C4B0(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_250E2C4B8(__sz);
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

