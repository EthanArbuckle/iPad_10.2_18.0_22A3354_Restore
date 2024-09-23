CFStringRef LDCreateSystemLexiconCompatibilityVersion(const __CFLocale *a1)
{
  CFStringRef v1;
  void *v3[2];
  uint64_t v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  __n128 (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  void *__p;
  uint64_t v12;
  uint64_t v13;

  v6 = 0;
  v7 = &v6;
  v8 = 0x4002000000;
  v9 = sub_20849A744;
  v10 = sub_20849A760;
  v13 = 0;
  __p = 0;
  v12 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 0x40000000;
  v5[2] = sub_20849A774;
  v5[3] = &unk_24C0A6540;
  v5[4] = &v6;
  sub_2084985A0(a1, 0, 0, (uint64_t)v5);
  if (*((char *)v7 + 63) < 0)
  {
    sub_20849990C(v3, (void *)v7[5], v7[6]);
  }
  else
  {
    *(_OWORD *)v3 = *(_OWORD *)(v7 + 5);
    v4 = v7[7];
  }
  _Block_object_dispose(&v6, 8);
  if (SHIBYTE(v13) < 0)
    operator delete(__p);
  v1 = sub_208499744((uint64_t)v3);
  if (SHIBYTE(v4) < 0)
    operator delete(v3[0]);
  return v1;
}

void sub_208498244(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void LDEnumerateAssetDataItems(CFTypeRef cf, unint64_t a2, uint64_t a3)
{
  const __CFString *Value;
  const __CFString *v7;
  CFLocaleRef v8;
  const __CFString *v9;
  uint64_t v10;
  CFTypeRef v11;
  const __CFArray *v12;
  const __CFArray *v13;
  CFIndex Count;
  CFIndex v15;
  const __CFAllocator *v16;
  const __CFString *ValueAtIndex;
  CFLocaleRef v18;
  const __CFString *v19;
  _QWORD v20[7];
  const __CFString *v21;
  _QWORD v22[7];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  const void **v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  CFTypeRef cfa;

  if (cf)
  {
    v27 = 0;
    v28 = (const void **)&v27;
    v29 = 0x3002000000;
    v30 = sub_20849A810;
    v31 = sub_20849A820;
    cfa = 0;
    sub_20849A82C(&cfa, cf);
    Value = (const __CFString *)CFLocaleGetValue((CFLocaleRef)v28[5], (CFLocaleKey)*MEMORY[0x24BDBD410]);
    v7 = (const __CFString *)LDCopyLocaleIdentifierOverrideForLocaleIdentifier(Value);
    if (v7)
    {
      v8 = CFLocaleCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v7);
      if (v8)
        sub_208499578(v28 + 5, v8);
    }
    v23 = 0;
    v24 = &v23;
    v25 = 0x2000000000;
    v26 = 0;
    v9 = (const __CFString *)v28[5];
    v10 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 0x40000000;
    v22[2] = sub_208499190;
    v22[3] = &unk_24C0A6568;
    v22[4] = a3;
    v22[5] = &v27;
    v22[6] = &v23;
    sub_20849A680(v9, a2, (uint64_t)v22);
    if (!*((_BYTE *)v24 + 24))
    {
      v11 = CFLocaleGetValue((CFLocaleRef)cf, (CFLocaleKey)*MEMORY[0x24BDBD418]);
      if (qword_253CFD9C8 != -1)
        dispatch_once(&qword_253CFD9C8, &unk_24C0A66A8);
      if (qword_253CFD9D0)
      {
        v12 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)qword_253CFD9D0, v11);
        v13 = v12;
        if (v12)
        {
          Count = CFArrayGetCount(v12);
          if (Count >= 1)
          {
            v15 = 0;
            v16 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
            do
            {
              if (*((_BYTE *)v24 + 24))
                break;
              ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v13, v15);
              v18 = CFLocaleCreate(v16, ValueAtIndex);
              if (v18)
              {
                v21 = 0;
                sub_20849A82C((const void **)&v21, v18);
                v19 = v21;
                v20[0] = v10;
                v20[1] = 0x40000000;
                v20[2] = sub_20849A878;
                v20[3] = &unk_24C0A6590;
                v20[4] = a3;
                v20[5] = &v23;
                v20[6] = v18;
                sub_20849A680(v21, a2, (uint64_t)v20);
                if (v19)
                  CFRelease(v19);
              }
              ++v15;
            }
            while (Count != v15);
          }
        }
      }
    }
    _Block_object_dispose(&v23, 8);
    if (v7)
      CFRelease(v7);
    _Block_object_dispose(&v27, 8);
    if (cfa)
      CFRelease(cfa);
  }
}

void sub_208498510(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,CFTypeRef cf)
{
  const void *v33;

  _Block_object_dispose(&a24, 8);
  if (v33)
    CFRelease(v33);
  _Block_object_dispose(&a28, 8);
  if (cf)
    CFRelease(cf);
  _Unwind_Resume(a1);
}

const __CFString *sub_2084985A0(const __CFLocale *a1, int a2, unint64_t a3, uint64_t a4)
{
  const __CFString *Value;
  CFTypeRef v9;
  CFTypeRef v10;
  const __CFString *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t (**v14)();
  int v15;
  unsigned int v16;
  CFComparisonResult v17;
  _BOOL4 v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  unsigned __int8 v22;
  _QWORD v24[6];
  int v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  Value = (const __CFString *)CFLocaleGetValue(a1, (CFLocaleKey)*MEMORY[0x24BDBD418]);
  v9 = CFLocaleGetValue(a1, (CFLocaleKey)*MEMORY[0x24BDBD420]);
  v10 = CFLocaleGetValue(a1, (CFLocaleKey)*MEMORY[0x24BDBD3D8]);
  v11 = (const __CFString *)CFLocaleGetValue(a1, (CFLocaleKey)*MEMORY[0x24BDBD410]);
  if ((a3 & 1) != 0
    || CFPreferencesGetAppBooleanValue(CFSTR("LMDisableMobileAssets"), (CFStringRef)*MEMORY[0x24BDBD568], 0)
    || (_os_feature_enabled_impl() & 1) == 0)
  {
    v12 = (_QWORD *)operator new();
    v13 = (uint64_t)v12;
    v14 = &off_24C0A6500;
  }
  else
  {
    v12 = (_QWORD *)operator new();
    v13 = (uint64_t)v12;
    v14 = &off_24C0A64D8;
  }
  *v12 = v14;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2000000000;
  v29 = 0;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 0x40000000;
  v24[2] = sub_2084991D8;
  v24[3] = &unk_24C0A65B8;
  v25 = a2;
  v24[4] = a4;
  v24[5] = &v26;
  ((void (*)(uint64_t, void *, unsigned int, uint64_t, uint64_t))v14[2])(v13, a1, a2, (a3 >> 1) & 1, (uint64_t)v24);
  v15 = *((unsigned __int8 *)v27 + 24);
  _Block_object_dispose(&v26, 8);
  (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
  v16 = v15 != 0;
  v17 = CFStringCompare(v11, CFSTR("hi-Translit"), 1uLL);
  if (!v15 && v17 == kCFCompareEqualTo)
    v16 = sub_208498940(CFSTR("hi-Translit"), a2, a4);
  if (CFStringCompare(v11, CFSTR("fil_PH"), 1uLL))
    v18 = CFStringCompare(v11, CFSTR("fil"), 1uLL) != kCFCompareEqualTo;
  else
    v18 = 0;
  if (((v16 | v18) & 1) == 0)
    v16 = sub_208498940(CFSTR("tl"), a2, a4);
  if (!v16)
  {
    if (v9)
    {
      if (v10)
      {
        v19 = CFStringCreateWithFormat(0, 0, CFSTR("%@_%@-%@"), Value, v10, v9);
        v24[0] = v19;
        v16 = sub_208498940(v19, a2, a4);
        if (v19)
          CFRelease(v19);
      }
    }
  }
  if (!v16)
  {
    if (v9)
    {
      v20 = CFStringCreateWithFormat(0, 0, CFSTR("%@-%@"), Value, v9);
      v24[0] = v20;
      v16 = sub_208498940(v20, a2, a4);
      if (v20)
        CFRelease(v20);
    }
  }
  if (v16 || !v10)
  {
    if ((v16 & 1) == 0)
      return sub_208498940(Value, a2, a4);
  }
  else
  {
    v21 = CFStringCreateWithFormat(0, 0, CFSTR("%@_%@"), Value, v10);
    v24[0] = v21;
    v22 = sub_208498940(v21, a2, a4);
    if (v21)
      CFRelease(v21);
    if ((v22 & 1) == 0)
      return sub_208498940(Value, a2, a4);
  }
  return (const __CFString *)1;
}

void sub_2084988FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  sub_2084998D8((const void **)va, 0);
  _Unwind_Resume(a1);
}

const __CFString *sub_208498940(const __CFString *a1, int a2, uint64_t a3)
{
  const __CFString *v6;
  const __CFString *v7;
  CFMutableStringRef Mutable;
  const __CFString *v9;
  void **v10;
  std::string::size_type v11;
  _BYTE *p_p;
  std::string *v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  char v17;
  const std::string::value_type *v18;
  std::string::size_type v19;
  unsigned __int8 v20;
  const __CFString *v21;
  const __CFURL *v22;
  __CFBundle *v23;
  CFLocaleRef v24;
  const __CFDictionary *InfoDictionary;
  const __CFDictionary *Value;
  const __CFDictionary *v27;
  CFTypeID v28;
  CFTypeID v29;
  CFTypeID v30;
  CFLocaleRef v31;
  CFURLRef v32;
  CFURLRef v33;
  const __CFString *v35;
  CFTypeRef cf;
  void *__p;
  std::string::size_type v38;
  int64_t v39;
  int v40[2];
  CFLocaleRef v41;
  char v42;
  CFLocaleRef v43;
  __CFBundle *v44;
  std::string v45;
  void *v46[2];
  unsigned __int8 v47;
  CFMutableStringRef v48;
  const __CFString *v49;
  const __CFString *v50;

  if ((a2 - 1) > 2)
    v6 = CFSTR("RequiredAssets");
  else
    v6 = off_24C0A65D8[a2 - 1];
  v50 = CFSTR("/System/Library/LinguisticData/");
  v7 = CFStringCreateWithFormat(0, 0, CFSTR("%@/%@_%@.bundle"), CFSTR("/System/Library/LinguisticData/"), v6, a1);
  v49 = v7;
  Mutable = CFStringCreateMutable(0, 1024);
  v9 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], "/", 0x8000100u);
  CFStringAppend(Mutable, v9);
  if (v7)
    CFStringAppend(Mutable, v7);
  CFRelease(v9);
  v48 = Mutable;
  sub_20849942C(Mutable, v46);
  memset(&v45, 0, sizeof(v45));
  if ((v47 & 0x80u) == 0)
    v10 = v46;
  else
    v10 = (void **)v46[0];
  if ((v47 & 0x80u) == 0)
    v11 = v47;
  else
    v11 = (std::string::size_type)v46[1];
  if (v11)
  {
    if (&v45 > (std::string *)v10 || (char *)&v45.__r_.__value_.__l.__data_ + 1 <= (char *)v10)
    {
      if (v11 < 0x17)
      {
        v13 = &v45;
      }
      else
      {
        std::string::__grow_by(&v45, 0x16uLL, v11 - 22, 0, 0, 0, 0);
        v45.__r_.__value_.__l.__size_ = 0;
        if ((v45.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v13 = &v45;
        else
          v13 = (std::string *)v45.__r_.__value_.__r.__words[0];
      }
      for (i = 0; i != v11; ++i)
        v13->__r_.__value_.__s.__data_[i] = *((_BYTE *)v10 + i);
      v13->__r_.__value_.__s.__data_[i] = 0;
      if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0)
        v45.__r_.__value_.__l.__size_ = v11;
      else
        *((_BYTE *)&v45.__r_.__value_.__s + 23) = v11 & 0x7F;
    }
    else
    {
      if (v11 >= 0x7FFFFFFFFFFFFFF8)
        sub_208499850();
      if (v11 > 0x16)
      {
        v15 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v11 | 7) != 0x17)
          v15 = v11 | 7;
        v16 = v15 + 1;
        p_p = operator new(v15 + 1);
        v38 = v11;
        v39 = v16 | 0x8000000000000000;
        __p = p_p;
      }
      else
      {
        HIBYTE(v39) = v11;
        p_p = &__p;
      }
      do
      {
        v17 = *(_BYTE *)v10;
        v10 = (void **)((char *)v10 + 1);
        *p_p++ = v17;
        --v11;
      }
      while (v11);
      *p_p = 0;
      if (v39 >= 0)
        v18 = (const std::string::value_type *)&__p;
      else
        v18 = (const std::string::value_type *)__p;
      if (v39 >= 0)
        v19 = HIBYTE(v39);
      else
        v19 = v38;
      std::string::append(&v45, v18, v19);
      if (SHIBYTE(v39) < 0)
        operator delete(__p);
    }
  }
  std::__fs::filesystem::__status((const std::__fs::filesystem::path *)&v45, 0);
  v20 = __p;
  if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v45.__r_.__value_.__l.__data_);
  v21 = 0;
  if (v20 && v20 != 255)
  {
    v22 = CFURLCreateWithFileSystemPath(0, Mutable, kCFURLPOSIXPathStyle, 1u);
    v45.__r_.__value_.__r.__words[0] = (std::string::size_type)v22;
    v23 = CFBundleCreate(0, v22);
    v44 = v23;
    v24 = CFLocaleCreate(0, a1);
    v43 = v24;
    if (!v24)
    {
      v21 = 0;
      if (!v23)
        goto LABEL_65;
      goto LABEL_64;
    }
    if (v23)
    {
      InfoDictionary = CFBundleGetInfoDictionary(v23);
      if (InfoDictionary)
      {
        Value = (const __CFDictionary *)CFDictionaryGetValue(InfoDictionary, CFSTR("MobileAssetProperties"));
        v27 = Value;
        if (Value)
        {
          v28 = CFGetTypeID(Value);
          if (v28 == CFDictionaryGetTypeID())
          {
            v21 = (const __CFString *)CFDictionaryGetValue(v27, CFSTR("AssetLocale"));
            cf = CFDictionaryGetValue(v27, CFSTR("Contents"));
            if (!v21)
              goto LABEL_61;
            v29 = CFGetTypeID(v21);
            v35 = v21;
            v21 = 0;
            if (v29 != CFStringGetTypeID() || !cf)
              goto LABEL_61;
            v30 = CFGetTypeID(cf);
            if (v30 == CFArrayGetTypeID())
            {
              v42 = 0;
              v31 = CFLocaleCreate(0, v35);
              v41 = v31;
              if (v31 && CFEqual(v31, v24))
              {
                v32 = CFBundleCopyResourceURL(v23, CFSTR("AssetData"), 0, 0);
                *(_QWORD *)v40 = v32;
                if (v32
                  || (v33 = CFURLCreateCopyAppendingPathComponent(0, v22, CFSTR("AssetData"), 1u),
                      sub_2084996A8((const void **)v40, v33),
                      (v32 = *(CFURLRef *)v40) != 0))
                {
                  sub_2084995AC((uint64_t)&__p, v32, v35, a2, v27, cf);
                  (*(void (**)(uint64_t, void **, char *))(a3 + 16))(a3, &__p, &v42);
                  sub_208499528((const void **)&__p);
                }
                sub_2084996A8((const void **)v40, 0);
              }
              v21 = (const __CFString *)(v42 != 0);
              sub_208499578((const void **)&v41, 0);
LABEL_61:
              CFRelease(v24);
              if (!v23)
              {
LABEL_65:
                if (v22)
                  CFRelease(v22);
                goto LABEL_67;
              }
LABEL_64:
              CFRelease(v23);
              goto LABEL_65;
            }
          }
        }
      }
    }
    v21 = 0;
    goto LABEL_61;
  }
LABEL_67:
  if ((char)v47 < 0)
  {
    operator delete(v46[0]);
    if (!Mutable)
      goto LABEL_72;
    goto LABEL_71;
  }
  if (Mutable)
LABEL_71:
    CFRelease(Mutable);
LABEL_72:
  if (v7)
    CFRelease(v7);
  CFRelease(CFSTR("/System/Library/LinguisticData/"));
  return v21;
}

void sub_208498E18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,const void *a23,const void *a24,uint64_t a25,const void *a26,const void *a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  uint64_t v33;

  sub_2084996A8(&a23, 0);
  sub_208499578(&a24, 0);
  sub_208499578(&a26, 0);
  sub_20849A714(&a27);
  sub_2084996A8((const void **)&a28, 0);
  if (*(char *)(v33 - 113) < 0)
    operator delete(*(void **)(v33 - 136));
  sub_2084998D8((const void **)(v33 - 112), 0);
  sub_2084998D8((const void **)(v33 - 104), 0);
  sub_2084998D8((const void **)(v33 - 96), 0);
  _Unwind_Resume(a1);
}

void sub_208498F44()
{
  JUMPOUT(0x20BD097E8);
}

void *LDCopyLocaleIdentifierOverrideForLocaleIdentifier(const __CFString *a1)
{
  void *v1;
  unsigned __int8 *v2;
  void *__p[2];
  uint64_t v5;
  void *v6[2];
  char v7;

  sub_20849942C(a1, v6);
  sub_208499048();
  v1 = sub_208499334((unsigned __int8 *)v6);
  sub_208499048();
  if (v1)
  {
    sub_208499048();
    v2 = sub_208499334((unsigned __int8 *)v6);
    if (!v2)
      sub_20849A5E0();
    if ((char)v2[63] < 0)
    {
      sub_20849990C(__p, *((void **)v2 + 5), *((_QWORD *)v2 + 6));
    }
    else
    {
      *(_OWORD *)__p = *(_OWORD *)(v2 + 40);
      v5 = *((_QWORD *)v2 + 7);
    }
    v1 = (void *)sub_208499744((uint64_t)__p);
    if (SHIBYTE(v5) < 0)
      operator delete(__p[0]);
  }
  if (v7 < 0)
    operator delete(v6[0]);
  return v1;
}

void sub_20849900C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0)
    operator delete(__p);
  if (a20 < 0)
    operator delete(a15);
  _Unwind_Resume(exception_object);
}

void sub_208499048()
{
  unsigned __int8 v0;
  uint64_t i;
  _QWORD v2[6];
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[7];

  v5[6] = *MEMORY[0x24BDAC8D0];
  v0 = atomic_load((unsigned __int8 *)&qword_253CFDA30);
  if ((v0 & 1) == 0 && __cxa_guard_acquire(&qword_253CFDA30))
  {
    sub_208499E88(v2);
    sub_208499EE0(v3);
    sub_208499F38(v4, "fr_CH");
    sub_208499F38(v5, "fr_BE");
    sub_208499F88((uint64_t)v2, 4);
    for (i = 18; i != -6; i -= 6)
      sub_20849A494((uint64_t)&v2[i]);
    __cxa_guard_release(&qword_253CFDA30);
  }
}

void sub_208499138(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t i;

  for (i = 144; i != -48; i -= 48)
    sub_20849A494(v1 + i);
  __cxa_guard_abort(&qword_253CFDA30);
  _Unwind_Resume(a1);
}

BOOL sub_208499190(uint64_t *a1, CFArrayRef *a2, _BYTE *a3)
{
  _BOOL8 result;

  result = sub_20849A8BC(a2, *(const __CFLocale **)(*(_QWORD *)(a1[5] + 8) + 40), a1[4]);
  *a3 = result;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

void sub_2084991D8(uint64_t a1, const void *a2, CFDictionaryRef theDict, _BYTE *a4)
{
  const __CFString *Value;
  const void *v9;
  const void *v10;
  CFTypeID v11;
  CFTypeID v13;
  uint64_t v14;
  _BYTE v15[8];
  CFTypeRef v16;
  CFTypeRef v17;
  CFTypeRef v18;
  CFTypeRef cf;

  Value = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("AssetLocale"));
  v9 = CFDictionaryGetValue(theDict, CFSTR("Contents"));
  if (Value)
  {
    v10 = v9;
    v11 = CFGetTypeID(Value);
    if (v11 == CFStringGetTypeID() && v10 != 0)
    {
      v13 = CFGetTypeID(v10);
      if (v13 == CFArrayGetTypeID())
      {
        v14 = *(_QWORD *)(a1 + 32);
        sub_2084995AC((uint64_t)v15, a2, Value, *(_DWORD *)(a1 + 48), theDict, v10);
        (*(void (**)(uint64_t, _BYTE *, uint64_t))(v14 + 16))(v14, v15, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        if (cf)
          CFRelease(cf);
        cf = 0;
        if (v18)
          CFRelease(v18);
        v18 = 0;
        if (v17)
          CFRelease(v17);
        v17 = 0;
        if (v16)
          CFRelease(v16);
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
          *a4 = 1;
      }
    }
  }
}

void sub_208499320(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_208499528((const void **)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_208499334(unsigned __int8 *a1)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint8x8_t v5;
  unint64_t v6;
  unint64_t v7;
  unsigned __int8 **v8;
  unsigned __int8 *i;
  unint64_t v10;

  v2 = sub_208499998((uint64_t)a1);
  v3 = *((_QWORD *)&xmmword_253CFD9F8 + 1);
  if (!*((_QWORD *)&xmmword_253CFD9F8 + 1))
    return 0;
  v4 = v2;
  v5 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&xmmword_253CFD9F8 + 8));
  v5.i16[0] = vaddlv_u8(v5);
  v6 = v5.u32[0];
  if (v5.u32[0] > 1uLL)
  {
    v7 = v2;
    if (v2 >= *((_QWORD *)&xmmword_253CFD9F8 + 1))
      v7 = v2 % *((_QWORD *)&xmmword_253CFD9F8 + 1);
  }
  else
  {
    v7 = (*((_QWORD *)&xmmword_253CFD9F8 + 1) - 1) & v2;
  }
  v8 = *(unsigned __int8 ***)(xmmword_253CFD9F8 + 8 * v7);
  if (!v8)
    return 0;
  for (i = *v8; i; i = *(unsigned __int8 **)i)
  {
    v10 = *((_QWORD *)i + 1);
    if (v4 == v10)
    {
      if (sub_208499DE8(i + 16, a1))
        return i;
    }
    else
    {
      if (v6 > 1)
      {
        if (v10 >= v3)
          v10 %= v3;
      }
      else
      {
        v10 &= v3 - 1;
      }
      if (v10 != v7)
        return 0;
    }
  }
  return i;
}

const __CFString *sub_20849942C@<X0>(const __CFString *result@<X0>, _QWORD *a2@<X8>)
{
  const __CFString *v3;
  char *CStringPtr;
  CFIndex Length;
  CFIndex v6;
  char *v7;

  if (result)
  {
    v3 = result;
    CStringPtr = (char *)CFStringGetCStringPtr(result, 0x8000100u);
    if (!CStringPtr)
    {
      Length = CFStringGetLength(v3);
      v6 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
      v7 = (char *)operator new[]();
      CFStringGetCString(v3, v7, v6, 0x8000100u);
      sub_2084997A0(a2, v7);
      JUMPOUT(0x20BD097D0);
    }
    return (const __CFString *)sub_2084997A0(a2, CStringPtr);
  }
  else
  {
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
  }
  return result;
}

void sub_208499504(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x20BD097D0](v1, 0x1000C8077774924);
  _Unwind_Resume(a1);
}

const void **sub_208499528(const void **a1)
{
  sub_2084996DC(a1 + 4, 0);
  sub_208499710(a1 + 3, 0);
  sub_208499578(a1 + 2, 0);
  sub_2084996A8(a1 + 1, 0);
  return a1;
}

void sub_208499578(const void **a1, const void *a2)
{
  const void *v4;

  v4 = *a1;
  if (v4)
    CFRelease(v4);
  *a1 = a2;
}

uint64_t sub_2084995AC(uint64_t a1, const void *a2, CFLocaleIdentifier localeIdentifier, int a4, const void *a5, const void *a6)
{
  const void **v10;
  CFLocaleRef v11;
  const void *v12;

  *(_DWORD *)a1 = a4;
  *(_QWORD *)(a1 + 8) = 0;
  v10 = (const void **)(a1 + 8);
  v11 = CFLocaleCreate(0, localeIdentifier);
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 16) = v11;
  *(_QWORD *)(a1 + 32) = 0;
  if (*(const void **)(a1 + 8) == a2)
  {
    v12 = 0;
  }
  else
  {
    CFRetain(a2);
    sub_2084996A8(v10, a2);
    v12 = *(const void **)(a1 + 24);
  }
  if (v12 != a5)
  {
    CFRetain(a5);
    sub_208499710((const void **)(a1 + 24), a5);
  }
  if (*(const void **)(a1 + 32) != a6)
  {
    CFRetain(a6);
    sub_2084996DC((const void **)(a1 + 32), a6);
  }
  return a1;
}

void sub_208499690(_Unwind_Exception *a1)
{
  const void **v1;

  sub_2084996A8(v1, 0);
  _Unwind_Resume(a1);
}

void sub_2084996A8(const void **a1, const void *a2)
{
  const void *v4;

  v4 = *a1;
  if (v4)
    CFRelease(v4);
  *a1 = a2;
}

void sub_2084996DC(const void **a1, const void *a2)
{
  const void *v4;

  v4 = *a1;
  if (v4)
    CFRelease(v4);
  *a1 = a2;
}

void sub_208499710(const void **a1, const void *a2)
{
  const void *v4;

  v4 = *a1;
  if (v4)
    CFRelease(v4);
  *a1 = a2;
}

CFStringRef sub_208499744(uint64_t a1)
{
  const UInt8 *v1;
  CFIndex v2;

  v1 = (const UInt8 *)a1;
  if ((*(char *)(a1 + 23) & 0x80000000) == 0)
  {
    v2 = *(unsigned __int8 *)(a1 + 23);
    if (!*(_BYTE *)(a1 + 23))
      return &stru_24C0A66C8;
    return CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD240], v1, v2, 0x8000100u, 0);
  }
  v2 = *(_QWORD *)(a1 + 8);
  if (v2)
  {
    v1 = *(const UInt8 **)a1;
    return CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD240], v1, v2, 0x8000100u, 0);
  }
  return &stru_24C0A66C8;
}

void sub_208499790(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

_QWORD *sub_2084997A0(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    sub_208499850();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void sub_208499850()
{
  sub_208499864("basic_string");
}

void sub_208499864(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_2084998B4(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24C0A6318, MEMORY[0x24BEDAAF0]);
}

void sub_2084998A0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_2084998B4(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void sub_2084998D8(const void **a1, const void *a2)
{
  const void *v4;

  v4 = *a1;
  if (v4)
    CFRelease(v4);
  *a1 = a2;
}

void *sub_20849990C(_BYTE *__dst, void *__src, unint64_t a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8)
      sub_208499850();
    v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17)
      v6 = a3 | 7;
    v7 = v6 + 1;
    v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    *v5 = v8;
    v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }
  return memmove(v5, __src, a3 + 1);
}

unint64_t sub_208499998(uint64_t a1)
{
  int v1;
  unint64_t v2;
  BOOL v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD *v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  int v82;
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;

  v1 = *(char *)(a1 + 23);
  v2 = *(_QWORD *)(a1 + 8);
  v3 = v1 < 0;
  if (v1 >= 0)
    v4 = (uint64_t *)a1;
  else
    v4 = *(uint64_t **)a1;
  if (!v3)
    v2 = *(unsigned __int8 *)(a1 + 23);
  if (v2 > 0x20)
  {
    if (v2 > 0x40)
    {
      v34 = 0x9DDFEA08EB382D69;
      v44 = *(uint64_t *)((char *)v4 + v2 - 48);
      v43 = *(uint64_t *)((char *)v4 + v2 - 40);
      v45 = *(uint64_t *)((char *)v4 + v2 - 24);
      v47 = *(uint64_t *)((char *)v4 + v2 - 64);
      v46 = *(uint64_t *)((char *)v4 + v2 - 56);
      v48 = *(uint64_t *)((char *)v4 + v2 - 16);
      v49 = *(uint64_t *)((char *)v4 + v2 - 8);
      v50 = v46 + v48;
      v51 = 0x9DDFEA08EB382D69
          * (v45 ^ ((0x9DDFEA08EB382D69 * (v45 ^ (v44 + v2))) >> 47) ^ (0x9DDFEA08EB382D69 * (v45 ^ (v44 + v2))));
      v52 = 0x9DDFEA08EB382D69 * (v51 ^ (v51 >> 47));
      v53 = v47 + v2 + v46 + v44;
      v54 = v53 + v43;
      v55 = __ROR8__(v53, 44) + v47 + v2 + __ROR8__(v43 + v47 + v2 - 0x622015F714C7D297 * (v51 ^ (v51 >> 47)), 21);
      v56 = v46 + v48 + *(uint64_t *)((char *)v4 + v2 - 32) - 0x4B6D499041670D8DLL;
      v57 = v56 + v45 + v48;
      v58 = __ROR8__(v57, 44);
      v59 = v57 + v49;
      v60 = v58 + v56 + __ROR8__(v56 + v43 + v49, 21);
      v62 = *v4;
      v61 = v4 + 4;
      v63 = v62 - 0x4B6D499041670D8DLL * v43;
      v64 = -(uint64_t)((v2 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        v65 = *(v61 - 3);
        v66 = v63 + v54 + v50 + v65;
        v67 = v61[2];
        v68 = v61[3];
        v69 = v61[1];
        v50 = v69 + v54 - 0x4B6D499041670D8DLL * __ROR8__(v50 + v55 + v67, 42);
        v70 = v52 + v59;
        v71 = *(v61 - 2);
        v72 = *(v61 - 1);
        v73 = *(v61 - 4) - 0x4B6D499041670D8DLL * v55;
        v74 = v73 + v59 + v72;
        v75 = v73 + v65 + v71;
        v54 = v75 + v72;
        v76 = __ROR8__(v75, 44) + v73;
        v77 = (0xB492B66FBE98F273 * __ROR8__(v66, 37)) ^ v60;
        v63 = 0xB492B66FBE98F273 * __ROR8__(v70, 33);
        v55 = v76 + __ROR8__(v74 + v77, 21);
        v78 = v63 + v60 + *v61;
        v59 = v78 + v69 + v67 + v68;
        v60 = __ROR8__(v78 + v69 + v67, 44) + v78 + __ROR8__(v50 + v71 + v78 + v68, 21);
        v61 += 8;
        v52 = v77;
        v64 += 64;
      }
      while (v64);
      v79 = 0x9DDFEA08EB382D69
          * (v59 ^ ((0x9DDFEA08EB382D69 * (v59 ^ v54)) >> 47) ^ (0x9DDFEA08EB382D69 * (v59 ^ v54)));
      v80 = v63
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v60 ^ ((0x9DDFEA08EB382D69 * (v60 ^ v55)) >> 47) ^ (0x9DDFEA08EB382D69 * (v60 ^ v55)))) ^ ((0x9DDFEA08EB382D69 * (v60 ^ ((0x9DDFEA08EB382D69 * (v60 ^ v55)) >> 47) ^ (0x9DDFEA08EB382D69 * (v60 ^ v55)))) >> 47));
      v81 = 0x9DDFEA08EB382D69
          * (v80 ^ (v77 - 0x4B6D499041670D8DLL * (v50 ^ (v50 >> 47)) - 0x622015F714C7D297 * (v79 ^ (v79 >> 47))));
      v35 = 0x9DDFEA08EB382D69 * (v80 ^ (v81 >> 47) ^ v81);
    }
    else
    {
      v9 = (char *)v4 + v2;
      v10 = *(uint64_t *)((char *)v4 + v2 - 16);
      v11 = *(uint64_t *)((char *)v4 + v2 - 8);
      v12 = v4[1];
      v13 = *v4 - 0x3C5A37A36834CED9 * (v10 + v2);
      v16 = v4 + 2;
      v14 = v4[2];
      v15 = v16[1];
      v17 = __ROR8__(v13 + v15, 52);
      v18 = __ROR8__(v13, 37);
      v19 = v13 + v12;
      v20 = __ROR8__(v19, 7);
      v21 = v19 + v14;
      v22 = v20 + v18;
      v23 = *((_QWORD *)v9 - 4) + v14;
      v24 = v11 + v15;
      v25 = __ROR8__(v24 + v23, 52);
      v26 = v22 + v17;
      v27 = __ROR8__(v23, 37);
      v28 = *((_QWORD *)v9 - 3) + v23;
      v29 = __ROR8__(v28, 7);
      v30 = v26 + __ROR8__(v21, 31);
      v31 = v28 + v10;
      v32 = v31 + v24;
      v33 = v21 + v15 + v27 + v29 + v25 + __ROR8__(v31, 31);
      v34 = 0x9AE16A3B2F90404FLL;
      v35 = v30
          - 0x3C5A37A36834CED9
          * ((0xC3A5C85C97CB3127 * (v32 + v30) - 0x651E95C4D06FBFB1 * v33) ^ ((0xC3A5C85C97CB3127 * (v32 + v30)
                                                                                 - 0x651E95C4D06FBFB1 * v33) >> 47));
    }
    return (v35 ^ (v35 >> 47)) * v34;
  }
  else
  {
    if (v2 > 0x10)
    {
      v36 = v4[1];
      v37 = 0xB492B66FBE98F273 * *v4;
      v38 = 0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)v4 + v2 - 8);
      v39 = __ROR8__(v38, 30) + __ROR8__(v37 - v36, 43);
      v40 = v37 + v2 + __ROR8__(v36 ^ 0xC949D7C7509E6557, 20) - v38;
      v41 = 0x9DDFEA08EB382D69 * (v40 ^ (v39 - 0x3C5A37A36834CED9 * *(uint64_t *)((char *)v4 + v2 - 16)));
      v42 = v40 ^ (v41 >> 47) ^ v41;
      return 0x9DDFEA08EB382D69 * ((0x9DDFEA08EB382D69 * v42) ^ ((0x9DDFEA08EB382D69 * v42) >> 47));
    }
    if (v2 >= 9)
    {
      v5 = *v4;
      v6 = *(uint64_t *)((char *)v4 + v2 - 8);
      v7 = __ROR8__(v6 + v2, v2);
      return (0x9DDFEA08EB382D69
            * ((0x9DDFEA08EB382D69
              * (v7 ^ ((0x9DDFEA08EB382D69 * (v7 ^ v5)) >> 47) ^ (0x9DDFEA08EB382D69 * (v7 ^ v5)))) ^ ((0x9DDFEA08EB382D69 * (v7 ^ ((0x9DDFEA08EB382D69 * (v7 ^ v5)) >> 47) ^ (0x9DDFEA08EB382D69 * (v7 ^ v5)))) >> 47))) ^ v6;
    }
    if (v2 >= 4)
    {
      v82 = *(_DWORD *)v4;
      v83 = *(unsigned int *)((char *)v4 + v2 - 4);
      v84 = 0x9DDFEA08EB382D69 * ((v2 + (8 * v82)) ^ v83);
      v42 = v83 ^ (v84 >> 47) ^ v84;
      return 0x9DDFEA08EB382D69 * ((0x9DDFEA08EB382D69 * v42) ^ ((0x9DDFEA08EB382D69 * v42) >> 47));
    }
    result = 0x9AE16A3B2F90404FLL;
    if (v2)
    {
      v85 = (0xC949D7C7509E6557 * (v2 + 4 * *((unsigned __int8 *)v4 + v2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                     * (*(unsigned __int8 *)v4 | ((unint64_t)*((unsigned __int8 *)v4 + (v2 >> 1)) << 8)));
      return 0x9AE16A3B2F90404FLL * (v85 ^ (v85 >> 47));
    }
  }
  return result;
}

BOOL sub_208499DE8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  BOOL v12;
  BOOL v13;
  _BOOL8 v14;

  v2 = a1[23];
  if ((v2 & 0x80u) == 0)
    v3 = a1[23];
  else
    v3 = *((_QWORD *)a1 + 1);
  v4 = a2[23];
  v5 = (char)v4;
  if ((v4 & 0x80u) != 0)
    v4 = *((_QWORD *)a2 + 1);
  if (v3 != v4)
    return 0;
  if (v5 < 0)
    a2 = *(unsigned __int8 **)a2;
  if ((v2 & 0x80) != 0)
    return memcmp(*(const void **)a1, a2, *((_QWORD *)a1 + 1)) == 0;
  if (!a1[23])
    return 1;
  v6 = v2 - 1;
  do
  {
    v8 = *a1++;
    v7 = v8;
    v10 = *a2++;
    v9 = v10;
    v12 = v6-- != 0;
    v13 = v7 == v9;
    v14 = v7 == v9;
  }
  while (v13 && v12);
  return v14;
}

_QWORD *sub_208499E88(_QWORD *a1)
{
  _QWORD *v2;

  v2 = sub_2084997A0(a1, "ars");
  sub_2084997A0(v2 + 3, "ar");
  return a1;
}

void sub_208499EC4(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_208499EE0(_QWORD *a1)
{
  _QWORD *v2;

  v2 = sub_2084997A0(a1, "ars_SA");
  sub_2084997A0(v2 + 3, "ar");
  return a1;
}

void sub_208499F1C(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_208499F38(_QWORD *a1, char *a2)
{
  _QWORD *v3;

  v3 = sub_2084997A0(a1, a2);
  sub_2084997A0(v3 + 3, "fr_FR");
  return a1;
}

void sub_208499F6C(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void sub_208499F88(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  unint64_t v9;
  unsigned __int8 **v10;
  unsigned __int8 *i;
  unint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  __int128 v15;
  _BYTE *v16;
  __int128 v17;
  float v18;
  _BOOL8 v19;
  unint64_t v20;
  unint64_t v21;
  int8x8_t prime;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD **v26;
  unint64_t v27;
  uint8x8_t v28;
  unint64_t v29;
  uint8x8_t v30;
  uint64_t v31;
  _QWORD *j;
  unint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  unint64_t v36;
  void *v37;
  _QWORD v38[2];
  char v39;

  xmmword_253CFD9F8 = 0u;
  *(_OWORD *)&qword_253CFDA08 = 0u;
  dword_253CFDA18 = 1065353216;
  if (a2)
  {
    v3 = a1;
    v4 = a1 + 48 * a2;
    while (1)
    {
      v5 = sub_208499998(v3);
      v6 = v5;
      v7 = *((_QWORD *)&xmmword_253CFD9F8 + 1);
      if (*((_QWORD *)&xmmword_253CFD9F8 + 1))
      {
        v8 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&xmmword_253CFD9F8 + 8));
        v8.i16[0] = vaddlv_u8(v8);
        v9 = v8.u32[0];
        if (v8.u32[0] > 1uLL)
        {
          v2 = v5;
          if (v5 >= *((_QWORD *)&xmmword_253CFD9F8 + 1))
            v2 = v5 % *((_QWORD *)&xmmword_253CFD9F8 + 1);
        }
        else
        {
          v2 = (*((_QWORD *)&xmmword_253CFD9F8 + 1) - 1) & v5;
        }
        v10 = *(unsigned __int8 ***)(xmmword_253CFD9F8 + 8 * v2);
        if (v10)
        {
          for (i = *v10; i; i = *(unsigned __int8 **)i)
          {
            v12 = *((_QWORD *)i + 1);
            if (v12 == v6)
            {
              if (sub_208499DE8(i + 16, (unsigned __int8 *)v3))
                goto LABEL_81;
            }
            else
            {
              if (v9 > 1)
              {
                if (v12 >= v7)
                  v12 %= v7;
              }
              else
              {
                v12 &= v7 - 1;
              }
              if (v12 != v2)
                break;
            }
          }
        }
      }
      v13 = operator new(0x40uLL);
      v14 = v13;
      v38[0] = v13;
      v38[1] = &qword_253CFDA08;
      v39 = 0;
      *v13 = 0;
      v13[1] = v6;
      if (*(char *)(v3 + 23) < 0)
      {
        sub_20849990C((_BYTE *)v13 + 16, *(void **)v3, *(_QWORD *)(v3 + 8));
      }
      else
      {
        v15 = *(_OWORD *)v3;
        v13[4] = *(_QWORD *)(v3 + 16);
        *((_OWORD *)v13 + 1) = v15;
      }
      v16 = v14 + 5;
      if (*(char *)(v3 + 47) < 0)
      {
        sub_20849990C(v16, *(void **)(v3 + 24), *(_QWORD *)(v3 + 32));
      }
      else
      {
        v17 = *(_OWORD *)(v3 + 24);
        v14[7] = *(_QWORD *)(v3 + 40);
        *(_OWORD *)v16 = v17;
      }
      v39 = 1;
      v18 = (float)(unint64_t)(qword_253CFDA10 + 1);
      if (!v7 || (float)(*(float *)&dword_253CFDA18 * (float)v7) < v18)
        break;
LABEL_71:
      v34 = *(uint64_t **)(xmmword_253CFD9F8 + 8 * v2);
      v35 = v38[0];
      if (v34)
      {
        *(_QWORD *)v38[0] = *v34;
      }
      else
      {
        *(_QWORD *)v38[0] = qword_253CFDA08;
        qword_253CFDA08 = v35;
        *(_QWORD *)(xmmword_253CFD9F8 + 8 * v2) = &qword_253CFDA08;
        if (!*(_QWORD *)v35)
          goto LABEL_80;
        v36 = *(_QWORD *)(*(_QWORD *)v35 + 8);
        if ((v7 & (v7 - 1)) != 0)
        {
          if (v36 >= v7)
            v36 %= v7;
        }
        else
        {
          v36 &= v7 - 1;
        }
        v34 = (uint64_t *)(xmmword_253CFD9F8 + 8 * v36);
      }
      *v34 = v35;
LABEL_80:
      v38[0] = 0;
      ++qword_253CFDA10;
      sub_20849A574((uint64_t)v38);
LABEL_81:
      v3 += 48;
      if (v3 == v4)
        return;
    }
    v19 = (v7 & (v7 - 1)) != 0;
    if (v7 < 3)
      v19 = 1;
    v20 = v19 | (2 * v7);
    v21 = vcvtps_u32_f32(v18 / *(float *)&dword_253CFDA18);
    if (v20 <= v21)
      prime = (int8x8_t)v21;
    else
      prime = (int8x8_t)v20;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
    }
    v7 = *((_QWORD *)&xmmword_253CFD9F8 + 1);
    if (*(_QWORD *)&prime > *((_QWORD *)&xmmword_253CFD9F8 + 1))
      goto LABEL_37;
    if (*(_QWORD *)&prime < *((_QWORD *)&xmmword_253CFD9F8 + 1))
    {
      v29 = vcvtps_u32_f32((float)(unint64_t)qword_253CFDA10 / *(float *)&dword_253CFDA18);
      if (*((_QWORD *)&xmmword_253CFD9F8 + 1) < 3uLL
        || (v30 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&xmmword_253CFD9F8 + 8)),
            v30.i16[0] = vaddlv_u8(v30),
            v30.u32[0] > 1uLL))
      {
        v29 = std::__next_prime(v29);
      }
      else
      {
        v31 = 1 << -(char)__clz(v29 - 1);
        if (v29 >= 2)
          v29 = v31;
      }
      if (*(_QWORD *)&prime <= v29)
        prime = (int8x8_t)v29;
      if (*(_QWORD *)&prime >= v7)
      {
        v7 = *((_QWORD *)&xmmword_253CFD9F8 + 1);
      }
      else
      {
        if (prime)
        {
LABEL_37:
          if (*(_QWORD *)&prime >> 61)
            sub_20849A5B8();
          v23 = operator new(8 * *(_QWORD *)&prime);
          v24 = (void *)xmmword_253CFD9F8;
          *(_QWORD *)&xmmword_253CFD9F8 = v23;
          if (v24)
            operator delete(v24);
          v25 = 0;
          *((int8x8_t *)&xmmword_253CFD9F8 + 1) = prime;
          do
            *(_QWORD *)(xmmword_253CFD9F8 + 8 * v25++) = 0;
          while (*(_QWORD *)&prime != v25);
          v26 = (_QWORD **)qword_253CFDA08;
          if (qword_253CFDA08)
          {
            v27 = *(_QWORD *)(qword_253CFDA08 + 8);
            v28 = (uint8x8_t)vcnt_s8(prime);
            v28.i16[0] = vaddlv_u8(v28);
            if (v28.u32[0] > 1uLL)
            {
              if (v27 >= *(_QWORD *)&prime)
                v27 %= *(_QWORD *)&prime;
            }
            else
            {
              v27 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(xmmword_253CFD9F8 + 8 * v27) = &qword_253CFDA08;
            for (j = *v26; j; v27 = v33)
            {
              v33 = j[1];
              if (v28.u32[0] > 1uLL)
              {
                if (v33 >= *(_QWORD *)&prime)
                  v33 %= *(_QWORD *)&prime;
              }
              else
              {
                v33 &= *(_QWORD *)&prime - 1;
              }
              if (v33 != v27)
              {
                if (!*(_QWORD *)(xmmword_253CFD9F8 + 8 * v33))
                {
                  *(_QWORD *)(xmmword_253CFD9F8 + 8 * v33) = v26;
                  goto LABEL_62;
                }
                *v26 = (_QWORD *)*j;
                *j = **(_QWORD **)(xmmword_253CFD9F8 + 8 * v33);
                **(_QWORD **)(xmmword_253CFD9F8 + 8 * v33) = j;
                j = v26;
              }
              v33 = v27;
LABEL_62:
              v26 = (_QWORD **)j;
              j = (_QWORD *)*j;
            }
          }
          v7 = (unint64_t)prime;
          goto LABEL_66;
        }
        v37 = (void *)xmmword_253CFD9F8;
        *(_QWORD *)&xmmword_253CFD9F8 = 0;
        if (v37)
          operator delete(v37);
        v7 = 0;
        *((_QWORD *)&xmmword_253CFD9F8 + 1) = 0;
      }
    }
LABEL_66:
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7)
        v2 = v6 % v7;
      else
        v2 = v6;
    }
    else
    {
      v2 = (v7 - 1) & v6;
    }
    goto LABEL_71;
  }
}

void sub_20849A454(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_20849A574((uint64_t)va);
  sub_20849A4D4();
  _Unwind_Resume(a1);
}

uint64_t sub_20849A494(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0)
    operator delete(*(void **)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  return a1;
}

void sub_20849A4D4()
{
  _QWORD *v0;
  _QWORD *v1;
  void *v2;

  v0 = (_QWORD *)qword_253CFDA08;
  if (qword_253CFDA08)
  {
    do
    {
      v1 = (_QWORD *)*v0;
      sub_20849A530((uint64_t)(v0 + 2));
      operator delete(v0);
      v0 = v1;
    }
    while (v1);
  }
  v2 = (void *)xmmword_253CFD9F8;
  *(_QWORD *)&xmmword_253CFD9F8 = 0;
  if (v2)
    operator delete(v2);
}

void sub_20849A530(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0)
    operator delete(*(void **)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

void sub_20849A574(uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v1)
  {
    if (*(_BYTE *)(a1 + 16))
      sub_20849A530((uint64_t)v1 + 16);
    operator delete(v1);
  }
}

void sub_20849A5B8()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void sub_20849A5E0()
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_20849A628(exception);
  __cxa_throw(exception, (struct type_info *)off_24C0A6320, MEMORY[0x24BEDAB00]);
}

void sub_20849A614(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_20849A628(std::logic_error *a1)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, "unordered_map::at: key not found");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8C0] + 16);
  return result;
}

os_log_t sub_20849A654()
{
  os_log_t result;

  result = os_log_create("com.apple.LinguisticData", "Default");
  qword_253CFD9B8 = (uint64_t)result;
  return result;
}

const __CFString *sub_20849A680(const __CFString *result, unint64_t a2, uint64_t a3)
{
  const __CFLocale *v5;

  if (result)
  {
    v5 = (const __CFLocale *)result;
    result = sub_2084985A0((const __CFLocale *)result, 2, a2, a3);
    if ((result & 1) == 0)
    {
      result = sub_2084985A0(v5, 1, a2, a3);
      if ((result & 1) == 0)
      {
        result = sub_2084985A0(v5, 3, a2, a3);
        if ((result & 1) == 0)
          return sub_2084985A0(v5, 0, a2, a3);
      }
    }
  }
  return result;
}

void sub_20849A714(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  *a1 = 0;
}

__n128 sub_20849A744(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(__n128 *)(a1 + 40) = result;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_20849A760(uint64_t a1)
{
  if (*(char *)(a1 + 63) < 0)
    operator delete(*(void **)(a1 + 40));
}

double sub_20849A774(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  const __CFString *Value;
  double result;
  const __CFString *v7;
  CFTypeID v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  Value = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a2 + 24), CFSTR("LMLexiconCompatibilityVersion"));
  if (Value)
  {
    v7 = Value;
    v8 = CFGetTypeID(Value);
    if (v8 == CFStringGetTypeID())
    {
      sub_20849942C(v7, &v11);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v10 = v9 + 40;
      if (*(char *)(v9 + 63) < 0)
        operator delete(*(void **)v10);
      result = *(double *)&v11;
      *(_OWORD *)v10 = v11;
      *(_QWORD *)(v10 + 16) = v12;
      *a3 = 1;
    }
  }
  return result;
}

uint64_t sub_20849A810(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(result + 40) = v2;
  return result;
}

void sub_20849A820(uint64_t a1)
{
  sub_208499578((const void **)(a1 + 40), 0);
}

void sub_20849A82C(const void **a1, CFTypeRef cf)
{
  if (*a1 != cf)
  {
    CFRetain(cf);
    sub_208499578(a1, cf);
  }
}

BOOL sub_20849A878(uint64_t a1, CFArrayRef *a2, _BYTE *a3)
{
  _BOOL8 result;

  result = sub_20849A8BC(a2, *(const __CFLocale **)(a1 + 48), *(_QWORD *)(a1 + 32));
  *a3 = result;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

BOOL sub_20849A8BC(CFArrayRef *a1, const __CFLocale *a2, uint64_t a3)
{
  CFIndex v4;
  const __CFString *v5;
  const void *ValueAtIndex;
  CFTypeID v7;
  const void *Value;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  CFTypeID v12;
  CFTypeID v13;
  CFTypeID v14;
  const __CFLocale *v15;
  const __CFLocale *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  BOOL v23;
  BOOL v24;
  CFURLRef v25;
  uint64_t v26;
  int v27;
  Boolean v28;
  int v29;
  CFURLRef v30;
  const __CFString *v33;
  const __CFString *key;
  char v36;
  stat v37;
  CFURLRef v38;
  UInt8 buffer[1024];
  uint64_t v40;

  v4 = 0;
  v40 = *MEMORY[0x24BDAC8D0];
  v36 = 0;
  v5 = (const __CFString *)*MEMORY[0x24BDBD418];
  key = (const __CFString *)*MEMORY[0x24BDBD3D8];
  v33 = (const __CFString *)*MEMORY[0x24BDBD420];
  while (v4 < CFArrayGetCount(a1[4]))
  {
    ValueAtIndex = CFArrayGetValueAtIndex(a1[4], v4);
    v7 = CFGetTypeID(ValueAtIndex);
    if (v7 == CFDictionaryGetTypeID())
    {
      Value = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, CFSTR("ContentType"));
      v9 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, CFSTR("Locale"));
      v10 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, CFSTR("ContentPath"));
      if (Value)
      {
        v11 = v10;
        v12 = CFGetTypeID(Value);
        if (v12 == CFStringGetTypeID())
        {
          if (v9)
          {
            v13 = CFGetTypeID(v9);
            if (v13 == CFStringGetTypeID())
            {
              if (v11)
              {
                v14 = CFGetTypeID(v11);
                if (v14 == CFStringGetTypeID())
                {
                  v15 = CFLocaleCreate(0, v9);
                  v16 = v15;
                  if (v15)
                  {
                    v17 = (const __CFString *)CFLocaleGetValue(v15, v5);
                    v18 = (const __CFString *)CFLocaleGetValue(a2, v5);
                    if (v17)
                    {
                      if (v18)
                      {
                        if (CFStringCompare(v17, v18, 0) == kCFCompareEqualTo)
                        {
                          v19 = (const __CFString *)CFLocaleGetValue(v16, key);
                          if (!v19
                            || (v20 = (const __CFString *)CFLocaleGetValue(a2, key)) != 0
                            && CFStringCompare(v20, v19, 0) == kCFCompareEqualTo)
                          {
                            v21 = (const __CFString *)CFLocaleGetValue(v16, v33);
                            v22 = (const __CFString *)CFLocaleGetValue(a2, v33);
                            if (!((unint64_t)v21 | (unint64_t)v22))
                              goto LABEL_30;
                            v23 = v21 != 0;
                            if (v22)
                              v23 = 0;
                            v24 = v21 || v22 == 0;
                            if (v24 && !v23 && CFStringCompare(v22, v21, 0) == kCFCompareEqualTo)
                            {
LABEL_30:
                              v25 = CFURLCreateCopyAppendingPathComponent(0, a1[1], v11, 0);
                              v38 = v25;
                              if (!CFURLGetFileSystemRepresentation(v25, 1u, buffer, 1024)
                                || stat((const char *)buffer, &v37))
                              {
                                if (v25)
                                  CFRelease(v25);
                                goto LABEL_14;
                              }
                              v26 = 0;
                              v27 = 0;
                              v28 = (v37.st_mode & 0xF000) == 0x4000;
                              while (1)
                              {
                                v29 = buffer[v26];
                                if (v29 != 47)
                                  break;
                                if (buffer[++v26] != 47)
                                  goto LABEL_39;
LABEL_40:
                                if (v26 == 1024)
                                {
LABEL_41:
                                  v30 = CFURLCreateFromFileSystemRepresentation(0, buffer, v27, v28);
                                  if (v25)
                                    CFRelease(v25);
                                  if (v30)
                                  {
                                    (*(void (**)(uint64_t, CFURLRef, _QWORD, const __CFLocale *, const void *, char *))(a3 + 16))(a3, v30, *(unsigned int *)a1, v16, Value, &v36);
                                    CFRelease(v30);
                                  }
                                  goto LABEL_14;
                                }
                              }
                              if (!buffer[v26])
                                goto LABEL_41;
                              ++v26;
LABEL_39:
                              buffer[v27++] = v29;
                              goto LABEL_40;
                            }
                          }
                        }
                      }
                    }
LABEL_14:
                    CFRelease(v16);
                  }
                }
              }
            }
          }
        }
      }
    }
    ++v4;
    if (v36)
      return 1;
  }
  return v36 != 0;
}

void sub_20849AC38(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  if (a2)
    sub_208499790(exception_object);
  _Unwind_Resume(exception_object);
}

void sub_20849ACA0(uint64_t a1, void *a2, unsigned int a3, uint64_t a4, uint64_t a5)
{
  const __CFString *v9;
  const __CFString *v10;
  CFTypeID v11;
  CFTypeID TypeID;
  char *CStringPtr;
  CFIndex Length;
  CFIndex v15;
  __int128 *v16;
  CFIndex v17;
  CFIndex v18;
  UInt8 *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  const __CFString *v33;
  uint64_t v34;
  objc_class *v35;
  id v36;
  void *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *exception;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  void *__p[2];
  uint64_t v56;
  CFTypeRef cf;
  __int128 v58;
  int64_t v59;
  void *v60;
  uint8_t *v61;
  CFIndex maxBufLen;
  _BYTE v63[128];
  uint8_t v64[128];
  uint8_t buf[16];
  uint64_t v66;
  void (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  uint64_t v69;
  uint64_t v70;
  CFRange v71;
  CFRange v72;

  v70 = *MEMORY[0x24BDAC8D0];
  if (!qword_253CFD9E0)
  {
    *(_OWORD *)buf = xmmword_24C0A6610;
    v66 = 0;
    qword_253CFD9E0 = _sl_dlopen();
  }
  if (!qword_253CFD9E0)
  {
    if (qword_25453CE18 != -1)
      dispatch_once(&qword_25453CE18, &unk_24C0A65F0);
    return;
  }
  if (!a3)
    return;
  v9 = (const __CFString *)MEMORY[0x20BD09644](a2);
  v10 = v9;
  if (!v9)
  {
    cf = 0;
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x20BD0977C](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  CFRetain(v9);
  cf = v10;
  v11 = CFGetTypeID(v10);
  if (v11 != CFStringGetTypeID())
  {
    v46 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x20BD0977C](v46, "Could not construct");
    __cxa_throw(v46, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  sub_2084997A0(__p, "");
  if (SHIBYTE(v56) < 0)
  {
    sub_20849990C(buf, __p[0], (unint64_t)__p[1]);
  }
  else
  {
    *(_OWORD *)buf = *(_OWORD *)__p;
    v66 = v56;
  }
  TypeID = CFStringGetTypeID();
  if (TypeID == CFGetTypeID(v10))
  {
    CStringPtr = (char *)CFStringGetCStringPtr(v10, 0x8000100u);
    if (CStringPtr)
    {
      sub_2084997A0(&v58, CStringPtr);
      goto LABEL_28;
    }
    Length = CFStringGetLength(v10);
    maxBufLen = 0;
    v71.location = 0;
    v71.length = Length;
    CFStringGetBytes(v10, v71, 0x8000100u, 0, 0, 0, 0, &maxBufLen);
    v15 = maxBufLen;
    if ((unint64_t)maxBufLen >= 0x7FFFFFFFFFFFFFF8)
      sub_208499850();
    if ((unint64_t)maxBufLen >= 0x17)
    {
      v17 = (maxBufLen & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((maxBufLen | 7) != 0x17)
        v17 = maxBufLen | 7;
      v18 = v17 + 1;
      v16 = (__int128 *)operator new(v17 + 1);
      *((_QWORD *)&v58 + 1) = v15;
      v59 = v18 | 0x8000000000000000;
      *(_QWORD *)&v58 = v16;
    }
    else
    {
      HIBYTE(v59) = maxBufLen;
      v16 = &v58;
      if (!maxBufLen)
        goto LABEL_24;
    }
    bzero(v16, v15);
LABEL_24:
    *((_BYTE *)v16 + v15) = 0;
    if (v59 >= 0)
      v19 = (UInt8 *)&v58;
    else
      v19 = (UInt8 *)v58;
    v72.location = 0;
    v72.length = Length;
    CFStringGetBytes(v10, v72, 0x8000100u, 0, 0, v19, maxBufLen, &maxBufLen);
LABEL_28:
    if (SHIBYTE(v66) < 0)
      operator delete(*(void **)buf);
    goto LABEL_30;
  }
  v58 = *(_OWORD *)buf;
  v59 = v66;
LABEL_30:
  if (SHIBYTE(v56) < 0)
    operator delete(__p[0]);
  if (cf)
    CFRelease(cf);
  if (SHIBYTE(v59) < 0)
  {
    if (*((_QWORD *)&v58 + 1) == 4)
    {
      v20 = *(_DWORD *)v58;
      operator delete((void *)v58);
      if (v20 == 1953460082)
        return;
    }
    else
    {
      operator delete((void *)v58);
    }
  }
  else if (SHIBYTE(v59) == 4 && (_DWORD)v58 == 1953460082)
  {
    return;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  v66 = 0x3052000000;
  v67 = sub_20849B708;
  v68 = sub_20849B718;
  v21 = (void *)qword_253CFD9D8;
  v69 = qword_253CFD9D8;
  if (!qword_253CFD9D8)
  {
    *(_QWORD *)&v58 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v58 + 1) = 3221225472;
    v59 = (int64_t)sub_20849B724;
    v60 = &unk_24C0A6630;
    v61 = buf;
    sub_20849B724((uint64_t)&v58);
    v21 = *(void **)(*(_QWORD *)&buf[8] + 40);
  }
  _Block_object_dispose(buf, 8);
  v22 = (void *)objc_msgSend(v21, "sharedInstance");
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  v66 = 0x3052000000;
  v67 = sub_20849B708;
  v68 = sub_20849B718;
  v23 = (void *)qword_253CFD9F0;
  v69 = qword_253CFD9F0;
  if (!qword_253CFD9F0)
  {
    *(_QWORD *)&v58 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v58 + 1) = 3221225472;
    v59 = (int64_t)sub_20849B790;
    v60 = &unk_24C0A6630;
    v61 = buf;
    sub_20849B790((uint64_t)&v58);
    v23 = *(void **)(*(_QWORD *)&buf[8] + 40);
  }
  _Block_object_dispose(buf, 8);
  v24 = (void *)objc_msgSend(v23, "attributeFilter");
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v25 = (__CFString *)objc_msgSend(a2, "languageCode");
  v26 = (void *)objc_msgSend(a2, "countryCode");
  v27 = (void *)objc_msgSend(a2, "scriptCode");
  if (-[__CFString isEqualToString:](v25, "isEqualToString:", CFSTR("mul")))
  {
    if (v26)
    {
      if (objc_msgSend(v26, "length") && v27 && objc_msgSend(v27, "length"))
      {
        *(_QWORD *)buf = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@-%@"), v25, v26, v27);
        v28 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", buf, 1);
LABEL_57:
        v29 = (void *)v28;
        goto LABEL_70;
      }
      if (objc_msgSend(v26, "length"))
      {
        *(_QWORD *)buf = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), v25, v26);
        v28 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", buf, 1);
        goto LABEL_57;
      }
    }
    if (v27 && objc_msgSend(v27, "length"))
    {
      *(_QWORD *)buf = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), v25, v27);
      v28 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", buf, 1);
      goto LABEL_57;
    }
  }
  if (-[__CFString isEqualToString:](v25, "isEqualToString:", CFSTR("fil")))
    v25 = CFSTR("tl");
  v29 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v25);
  if (!v26)
    goto LABEL_107;
  if (objc_msgSend(v26, "length") && v27 && objc_msgSend(v27, "length"))
  {
    objc_msgSend(v29, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@-%@"), v25, v26, v27));
    goto LABEL_70;
  }
  if (objc_msgSend(v26, "length"))
  {
    objc_msgSend(v29, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), v25, v26));
  }
  else
  {
LABEL_107:
    if (v27 && objc_msgSend(v27, "length"))
      objc_msgSend(v29, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), v25, v27));
  }
LABEL_70:
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v52 != v31)
          objc_enumerationMutation(v29);
        objc_msgSend(v24, "addAssetLocale:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i));
      }
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
    }
    while (v30);
  }
  if (a3 > 3)
    v33 = CFSTR("Required");
  else
    v33 = off_24C0A6650[a3 - 1];
  objc_msgSend(v24, "addAllowedValue:forKey:", v33, CFSTR("LinguisticAssetType"));
  if (qword_253CFDA20 != -1)
    dispatch_once(&qword_253CFDA20, &unk_24C0A6688);
  v34 = qword_253CFDA28;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  v66 = 0x3052000000;
  v67 = sub_20849B708;
  v68 = sub_20849B718;
  v35 = (objc_class *)qword_253CFD9E8;
  v69 = qword_253CFD9E8;
  if (!qword_253CFD9E8)
  {
    *(_QWORD *)&v58 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v58 + 1) = 3221225472;
    v59 = (int64_t)sub_20849B7FC;
    v60 = &unk_24C0A6630;
    v61 = buf;
    sub_20849B7FC((uint64_t)&v58);
    v35 = *(objc_class **)(*(_QWORD *)&buf[8] + 40);
  }
  _Block_object_dispose(buf, 8);
  v36 = (id)objc_msgSend([v35 alloc], "initWithAssetType:filter:", v34, v24);
  objc_msgSend(v36, "setCachedOnly:", a4);
  *(_QWORD *)&v58 = 0;
  v37 = (void *)objc_msgSend(v22, "assetsForQuery:error:", v36, &v58);
  if ((_QWORD)v58)
  {
    if (qword_253CFD9C0 != -1)
      dispatch_once(&qword_253CFD9C0, &unk_24C0A6518);
    v38 = qword_253CFD9B8;
    if (os_log_type_enabled((os_log_t)qword_253CFD9B8, OS_LOG_TYPE_ERROR))
    {
      v44 = objc_msgSend((id)v58, "localizedDescription");
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v44;
      _os_log_error_impl(&dword_208497000, v38, OS_LOG_TYPE_ERROR, "DDS asset query failed: %@", buf, 0xCu);
    }
  }
  else
  {
    v39 = v37;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v40 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
    if (v40)
    {
      v41 = *(_QWORD *)v48;
LABEL_92:
      v42 = 0;
      while (1)
      {
        if (*(_QWORD *)v48 != v41)
          objc_enumerationMutation(v39);
        v43 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v42);
        if (objc_msgSend(v43, "localURL"))
        {
          if (!objc_msgSend((id)objc_msgSend(v43, "attributes"), "objectForKey:", CFSTR("AssetRegion")))
          {
            buf[0] = 0;
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint8_t *))(a5 + 16))(a5, objc_msgSend(v43, "localURL"), objc_msgSend(v43, "attributes"), buf);
            if (buf[0])
              break;
          }
        }
        if (v40 == ++v42)
        {
          v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
          if (v40)
            goto LABEL_92;
          return;
        }
      }
    }
  }
}

void sub_20849B648(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

const void **sub_20849B6D8(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

void sub_20849B708(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void sub_20849B718(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

Class sub_20849B724(uint64_t a1)
{
  Class result;
  uint64_t v3;

  sub_20849B868();
  result = objc_getClass("DDSAssetCenter");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    qword_253CFD9D8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  else
  {
    v3 = abort_report_np();
    return (Class)sub_20849B790(v3);
  }
  return result;
}

Class sub_20849B790(uint64_t a1)
{
  Class result;
  uint64_t v3;

  sub_20849B868();
  result = objc_getClass("DDSLinguisticAttributeFilter");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    qword_253CFD9F0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  else
  {
    v3 = abort_report_np();
    return (Class)sub_20849B7FC(v3);
  }
  return result;
}

void sub_20849B7FC(uint64_t a1)
{
  sub_20849B868();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = objc_getClass("DDSAssetQuery");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    qword_253CFD9E8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  else
  {
    abort_report_np();
    sub_20849B868();
  }
}

void sub_20849B868()
{
  void *v0;

  if (!qword_253CFD9E0)
  {
    qword_253CFD9E0 = _sl_dlopen();
    if (!qword_253CFD9E0)
    {
      v0 = (void *)abort_report_np();
      free(v0);
    }
  }
}

void sub_20849B924()
{
  NSObject *v0;
  uint8_t v1[16];

  if (qword_253CFD9C0 != -1)
    dispatch_once(&qword_253CFD9C0, &unk_24C0A6518);
  v0 = qword_253CFD9B8;
  if (os_log_type_enabled((os_log_t)qword_253CFD9B8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_error_impl(&dword_208497000, v0, OS_LOG_TYPE_ERROR, "Skipping mobile asset discovery: could not soft-link DataDeliveryServices", v1, 2u);
  }
}

CFStringRef LDCreateMobileAssetType()
{
  const __CFAllocator *v0;

  v0 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (qword_253CFDA20 != -1)
    dispatch_once(&qword_253CFDA20, &unk_24C0A6688);
  return CFStringCreateCopy(v0, (CFStringRef)qword_253CFDA28);
}

void sub_20849BA0C()
{
  JUMPOUT(0x20BD097E8);
}

uint64_t sub_20849BA24()
{
  __CFString *v0;
  uint64_t v1;

  v0 = CFSTR("/System/Library/LinguisticData/");
  v1 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/Info.plist"), v0);
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v1), "objectForKey:", CFSTR("MobileAssetProperties"));
}

uint64_t sub_20849BA7C()
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend((id)sub_20849BA24(), "objectForKey:", CFSTR("MobileAssetType")), "copy");
  qword_253CFDA28 = result;
  return result;
}

uint64_t sub_20849BAA8()
{
  uint64_t result;

  result = objc_msgSend((id)sub_20849BA24(), "objectForKey:", CFSTR("AssetLocaleMap"));
  if (result)
  {
    result = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithDictionary:copyItems:", result, 1);
    qword_253CFD9D0 = result;
  }
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x24BDBBA80](bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x24BDBBA98](allocator, bundleURL);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBAC8](bundle);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x24BDBBF48](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return (CFLocaleIdentifier)MEMORY[0x24BDBBF78](locale);
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return (CFTypeRef)MEMORY[0x24BDBBF98](locale, key);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x24BDBC4A8](theString, appendedString);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x24BDBC520](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x24BDBC558](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x24BDBC5F8](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC660](length, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC7F8](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC828](allocator, buffer, bufLen, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC858](allocator, filePath, pathStyle, isDirectory);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x24BDBC898](url, resolveAgainstBase, buffer, maxBufLen);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB30](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
  MEMORY[0x24BEDACC0](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add);
}

std::__fs::filesystem::file_status std::__fs::filesystem::__status(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return (std::__fs::filesystem::file_status)MEMORY[0x24BEDB308](a1, __ec);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete[]()
{
  return off_24C0A6348();
}

void operator delete(void *__p)
{
  off_24C0A6350(__p);
}

uint64_t operator delete()
{
  return off_24C0A6358();
}

uint64_t operator new[]()
{
  return off_24C0A6360();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24C0A6368(__sz);
}

uint64_t operator new()
{
  return off_24C0A6370();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x24BEDB940](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

