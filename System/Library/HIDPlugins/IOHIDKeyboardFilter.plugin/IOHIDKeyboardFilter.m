BOOL Key::isModifier(Key *this)
{
  int v1;
  unsigned int v2;

  v1 = *((_DWORD *)this + 1);
  if (v1 == 65281 || v1 == 255)
  {
    if (*(_DWORD *)this == 3)
      return 1;
  }
  else if (v1 == 7)
  {
    v2 = *(_DWORD *)this;
    if (*(_DWORD *)this >= 0xE0u)
      return v2 < 0xE8;
    if (v2 == 57)
      return 1;
  }
  return 0;
}

uint64_t Key::modifierMask(Key *this)
{
  uint64_t result;
  int v3;
  int v4;

  result = Key::isModifier(this);
  if ((_DWORD)result)
  {
    v3 = *((_DWORD *)this + 1);
    if (v3 == 65281 || v3 == 255)
    {
      return (*(_DWORD *)this == 3) << 9;
    }
    else if (v3 == 7 && (v4 = *(_DWORD *)this - 224, v4 < 8))
    {
      return dword_231118780[v4];
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void sub_23110FCF8(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_255EB5180;
  qword_255EB5180 = (uint64_t)v1;

}

void sub_23110FDEC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23110FE6C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

IOHIDKeyboardFilter *IOHIDKeyboardFilterFactory(uint64_t a1, const void *a2)
{
  const __CFAllocator *v3;
  CFUUIDRef v4;
  IOHIDKeyboardFilter *v5;
  CFUUIDRef v6;

  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD260];
  v4 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 0x6Bu, 3u, 0x40u, 0xD3u, 0x57u, 0x98u, 0x40u, 0x64u, 0xAAu, 0x17u, 0x92u, 4u, 0xC7u, 0xB0u, 0x6Fu, 0xFDu);
  if (!CFEqual(a2, v4))
    return 0;
  v5 = (IOHIDKeyboardFilter *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x24BDBD240], 536, 0);
  v6 = CFUUIDGetConstantUUIDWithBytes(v3, 0x55u, 0x12u, 0x66u, 0x8Eu, 0xFFu, 0x47u, 0x4Eu, 0x70u, 0xB3u, 0x3Eu, 0xE1u, 0xFFu, 0xFAu, 0xEFu, 1u, 0xA8u);
  IOHIDKeyboardFilter::IOHIDKeyboardFilter(v5, v6);
  return v5;
}

uint64_t IOHIDKeyboardFilter::AddRef(IOHIDKeyboardFilter *this, void *a2)
{
  uint64_t v2;

  v2 = (*((_DWORD *)this + 4) + 1);
  *((_DWORD *)this + 4) = v2;
  return v2;
}

_QWORD *IOHIDKeyboardFilter::setEventCallback(_QWORD *result, void (*a2)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4), uint64_t a3, uint64_t a4)
{
  void (*v4)(uint64_t, uint64_t, uint64_t, uint64_t);

  v4 = IOHIDKeyboardFilter::defaultEventCallback;
  if (a2)
    v4 = a2;
  result[4] = v4;
  result[5] = a3;
  result[6] = a4;
  return result;
}

{
  void (*v4)(uint64_t, uint64_t, uint64_t, uint64_t);

  v4 = IOHIDKeyboardFilter::defaultEventCallback;
  if (a2)
    v4 = a2;
  result[4] = v4;
  result[5] = a3;
  result[6] = a4;
  return result;
}

void IOHIDKeyboardFilter::IOHIDKeyboardFilter(IOHIDKeyboardFilter *this, CFTypeRef cf)
{
  uint64_t **v4;
  unsigned int v5;
  unsigned int *v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  char v22;
  unint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)this = &IOHIDKeyboardFilter::sIOHIDKeyboardFilterFtbl;
  *((_QWORD *)this + 1) = CFRetain(cf);
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 4) = IOHIDKeyboardFilter::defaultEventCallback;
  *((_QWORD *)this + 9) = 0;
  *((_QWORD *)this + 8) = (char *)this + 72;
  *((_QWORD *)this + 12) = 0;
  *((_QWORD *)this + 11) = (char *)this + 96;
  *((_QWORD *)this + 15) = 0;
  *((_QWORD *)this + 14) = (char *)this + 120;
  *((_QWORD *)this + 18) = 0;
  *((_QWORD *)this + 22) = 0;
  *((_QWORD *)this + 23) = 0;
  *((_QWORD *)this + 20) = (char *)this + 168;
  *((_QWORD *)this + 21) = (char *)this + 176;
  *((_QWORD *)this + 26) = 0;
  *((_QWORD *)this + 29) = 0;
  *((_QWORD *)this + 32) = 0;
  *((_QWORD *)this + 44) = 0;
  *((_DWORD *)this + 90) = 0;
  *((_QWORD *)this + 35) = 0;
  *((_QWORD *)this + 36) = 0;
  *((_QWORD *)this + 37) = 0;
  *((_QWORD *)this + 38) = 0;
  *((_QWORD *)this + 50) = -4294967221;
  *((_OWORD *)this + 23) = 0u;
  *((_OWORD *)this + 24) = 0u;
  *((_DWORD *)this + 102) = 0;
  *((_QWORD *)this + 52) = 0;
  *((_DWORD *)this + 106) = 150;
  *((_DWORD *)this + 112) = 0;
  *((_QWORD *)this + 54) = 0;
  *((_QWORD *)this + 55) = 0;
  *((_QWORD *)this + 57) = *MEMORY[0x24BDD8AE8];
  *((_QWORD *)this + 58) = 0;
  *((_DWORD *)this + 122) = 0;
  *((_QWORD *)this + 59) = 0;
  *((_QWORD *)this + 60) = 0;
  *((_OWORD *)this + 31) = 0u;
  *((_OWORD *)this + 32) = 0u;
  *((_QWORD *)this + 66) = 0;
  *((_QWORD *)this + 17) = (char *)this + 144;
  *((_QWORD *)this + 25) = 0;
  *((_QWORD *)this + 24) = (char *)this + 200;
  *((_QWORD *)this + 28) = 0;
  *((_QWORD *)this + 27) = (char *)this + 224;
  *((_QWORD *)this + 2) = 1;
  *((_QWORD *)this + 10) = 0;
  *((_QWORD *)this + 5) = 0;
  *((_QWORD *)this + 6) = 0;
  *((_BYTE *)this + 56) = 0;
  *((_QWORD *)this + 13) = 0;
  *((_QWORD *)this + 16) = 0;
  *((_QWORD *)this + 19) = 0;
  *((_QWORD *)this + 31) = 0;
  *((_QWORD *)this + 30) = (char *)this + 248;
  *((_QWORD *)this + 34) = 0;
  *((_QWORD *)this + 33) = (char *)this + 272;
  CFPlugInAddInstanceForFactory((CFUUIDRef)cf);
  memset_pattern16((char *)this + 312, &unk_231118940, 0x28uLL);
  v7 = 0x70000004FLL;
  v8 = 0;
  v9 = 0x70000004DLL;
  v10 = 0;
  v11 = 0x700000050;
  v12 = 0;
  v13 = 0x70000004ALL;
  v14 = 0;
  v15 = 0x700000051;
  v16 = 0;
  v17 = 0x70000004ELL;
  v18 = 0;
  v19 = 0x700000052;
  v20 = 0;
  v21 = 0x70000004BLL;
  v22 = 0;
  v5 = 1;
  v6 = &v5;
  v4 = sub_231116634((uint64_t **)this + 24, &v5, (uint64_t)&std::piecewise_construct, &v6);
  sub_2311168EC(v4 + 5, &v7, &v23);
}

void sub_231110270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  sub_2311165A8(v17, *(_QWORD **)(v10 + 272));
  sub_2311165A8(v16, *(_QWORD **)(v10 + 248));
  sub_2311165A8(v15, *(_QWORD **)(v10 + 224));
  sub_2311165E8(v14, *(_QWORD **)(v10 + 200));
  sub_2311165E8(a10, *(_QWORD **)(v10 + 176));
  sub_2311165A8(v18, *(_QWORD **)(v10 + 144));
  sub_2311165A8(v13, *(_QWORD **)(v10 + 120));
  sub_2311165A8(v12, *(_QWORD **)(v10 + 96));
  sub_2311165A8(v11, *(_QWORD **)(v10 + 72));
  _Unwind_Resume(a1);
}

void IOHIDKeyboardFilter::defaultEventCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject *v5;

  _IOHIDLogCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_231117C64(a4, v5);

}

void IOHIDKeyboardFilter::~IOHIDKeyboardFilter(IOHIDKeyboardFilter *this)
{
  CFPlugInRemoveInstanceForFactory(*((CFUUIDRef *)this + 1));
  CFRelease(*((CFTypeRef *)this + 1));

  sub_2311165A8((uint64_t)this + 264, *((_QWORD **)this + 34));
  sub_2311165A8((uint64_t)this + 240, *((_QWORD **)this + 31));
  sub_2311165A8((uint64_t)this + 216, *((_QWORD **)this + 28));
  sub_2311165E8((uint64_t)this + 192, *((_QWORD **)this + 25));
  sub_2311165E8((uint64_t)this + 168, *((_QWORD **)this + 22));
  sub_2311165A8((uint64_t)this + 136, *((_QWORD **)this + 18));
  sub_2311165A8((uint64_t)this + 112, *((_QWORD **)this + 15));
  sub_2311165A8((uint64_t)this + 88, *((_QWORD **)this + 12));
  sub_2311165A8((uint64_t)this + 64, *((_QWORD **)this + 9));
}

void sub_231110484(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t IOHIDKeyboardFilter::QueryInterface(IOHIDKeyboardFilter *this, CFUUIDBytes a2, void **a3)
{
  CFUUIDRef v5;
  const __CFAllocator *v6;
  CFUUIDRef v7;
  CFUUIDRef v8;
  CFUUIDRef v9;
  uint64_t v10;

  v5 = CFUUIDCreateFromUUIDBytes(0, a2);
  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD260];
  v7 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 5u, 5u, 0xD7u, 0x8Du, 0x4Fu, 0x4Eu, 0x4Cu, 0x41u, 0xA3u, 0xA6u, 0xC7u, 0xA7u, 0x7Bu, 0x41u, 0xBDu, 0xACu);
  if (CFEqual(v5, v7)
    || (v8 = CFUUIDGetConstantUUIDWithBytes(v6, 0xC7u, 0x10u, 0x95u, 0x1Du, 0x18u, 0x40u, 0x45u, 0x6Eu, 0x82u, 0xE7u, 0xFCu, 0xA1u, 0xA0u, 0xFAu, 0x7Fu, 0xE4u), CFEqual(v5, v8))|| (v9 = CFUUIDGetConstantUUIDWithBytes(v6, 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u), CFEqual(v5, v9)))
  {
    v10 = 0;
    ++*((_DWORD *)this + 4);
  }
  else
  {
    this = 0;
    v10 = 2147483652;
  }
  *a3 = this;
  CFRelease(v5);
  return v10;
}

uint64_t IOHIDKeyboardFilter::AddRef(IOHIDKeyboardFilter *this)
{
  uint64_t v1;

  v1 = (*((_DWORD *)this + 4) + 1);
  *((_DWORD *)this + 4) = v1;
  return v1;
}

uint64_t IOHIDKeyboardFilter::Release(IOHIDKeyboardFilter *this)
{
  int v1;
  uint64_t v2;

  v1 = *((_DWORD *)this + 4);
  v2 = (v1 - 1);
  *((_DWORD *)this + 4) = v2;
  if (v1 == 1)
  {
    IOHIDKeyboardFilter::~IOHIDKeyboardFilter(this);
    MEMORY[0x2348D2524]();
  }
  return v2;
}

void IOHIDKeyboardFilter::setEjectKeyProperty(IOHIDKeyboardFilter *this, unsigned int a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = (void *)IOHIDServiceCopyProperty();
  v4 = (void *)IOHIDServiceCopyProperty();
  v5 = (void *)IOHIDServiceCopyProperty();
  if (objc_msgSend(v3, "unsignedIntValue") != 1
    || objc_msgSend(v4, "unsignedIntValue") != 6
    || objc_msgSend(v5, "unsignedIntValue") != 1452)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  v6 = IOHIDServiceCopyProperty();
  if (!v6)
  {
    if (a2 - 195 < 7 || a2 < 0x1F || a2 - 40 <= 2)
      IOHIDServiceSetProperty();
    goto LABEL_9;
  }
LABEL_10:
  v7 = (id)v6;

}

void sub_23111075C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void IOHIDKeyboardFilter::setDoNotDisturbState(IOHIDKeyboardFilter *this)
{
  IOHIDKeyboardFilter *v2;
  IOHIDKeyboardFilter *v3;
  IOHIDKeyboardFilter *v4;
  BOOL v5;
  const __CFBoolean *v6;
  const __CFBoolean *v7;

  v2 = (IOHIDKeyboardFilter *)*((_QWORD *)this + 17);
  if (v2 == (IOHIDKeyboardFilter *)((char *)this + 144))
  {
LABEL_9:
    v6 = (const __CFBoolean *)IOHIDServiceCopyProperty();
    if (v6)
    {
      v7 = v6;
      *((_DWORD *)this + 122) = CFBooleanGetValue(v6);
      CFRelease(v7);
    }
  }
  else
  {
    while (*((_QWORD *)v2 + 6) != 0x10000009BLL)
    {
      v3 = (IOHIDKeyboardFilter *)*((_QWORD *)v2 + 1);
      if (v3)
      {
        do
        {
          v4 = v3;
          v3 = *(IOHIDKeyboardFilter **)v3;
        }
        while (v3);
      }
      else
      {
        do
        {
          v4 = (IOHIDKeyboardFilter *)*((_QWORD *)v2 + 2);
          v5 = *(_QWORD *)v4 == (_QWORD)v2;
          v2 = v4;
        }
        while (!v5);
      }
      v2 = v4;
      if (v4 == (IOHIDKeyboardFilter *)((char *)this + 144))
        goto LABEL_9;
    }
    *((_DWORD *)this + 122) = 1;
  }
}

void IOHIDKeyboardFilter::open(IOHIDKeyboardFilter *this, __IOHIDService *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFNumber *v7;
  CFNumberRef v8;
  const __CFNumber *v9;
  const __CFNumber *v10;
  CFTypeID v11;
  const __CFString *v12;
  const __CFString *v13;
  CFTypeID v14;
  char *v15;
  _QWORD *v16;
  uint64_t v17;
  const __CFString *v18;
  const __CFString *v19;
  CFTypeID v20;
  uint64_t **v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t **v29;
  BOOL v30;
  uint64_t **v32;
  const __CFString *v33;
  const __CFString *v34;
  CFTypeID v35;
  uint64_t **v36;
  _QWORD *v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  const __CFString *v41;
  const __CFString *v42;
  CFTypeID v43;
  char *v44;
  _QWORD *v45;
  uint64_t v46;
  const __CFBoolean *v47;
  const __CFBoolean *v48;
  int *v49;
  const __CFBoolean *v50;
  const __CFBoolean *v51;
  int Value;
  const __CFDictionary *v53;
  const __CFDictionary *v54;
  const __CFBoolean *v55;
  const __CFBoolean *v56;
  _QWORD *v57;
  const void *v58;
  const void *v59;
  uint64_t v60;
  const __CFArray *v61;
  const __CFArray *v62;
  CFTypeID v63;
  char *v64;
  _QWORD *v65;
  uint64_t v66;
  const __CFNumber *v67;
  const __CFNumber *v68;
  const __CFNumber *v69;
  const __CFNumber *v70;
  const __CFNumber *v71;
  const __CFNumber *v72;
  unsigned int v73;
  unint64_t v74;
  _QWORD *v75;
  uint64_t v76;
  int valuePtr;
  unsigned int *v78;

  *((_QWORD *)this + 3) = a2;
  v3 = IOHIDServiceCopyProperty();
  v4 = (void *)*((_QWORD *)this + 58);
  *((_QWORD *)this + 58) = v3;

  v5 = IOHIDServiceCopyProperty();
  v6 = (void *)*((_QWORD *)this + 59);
  *((_QWORD *)this + 59) = v5;

  valuePtr = 0;
  v7 = (const __CFNumber *)IOHIDServiceCopyProperty();
  if (!v7)
  {
    valuePtr = IOHIDKeyboardFilter::getKeyboardID(this);
    v8 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &valuePtr);
    if (!v8)
      goto LABEL_5;
    v7 = v8;
    IOHIDServiceSetProperty();
  }
  CFNumberGetValue(v7, kCFNumberSInt32Type, &valuePtr);
  CFRelease(v7);
LABEL_5:
  v9 = (const __CFNumber *)IOHIDServiceCopyProperty();
  if (v9)
  {
    v10 = v9;
    v11 = CFGetTypeID(v9);
    if (v11 == CFNumberGetTypeID())
      CFNumberGetValue(v10, kCFNumberSInt32Type, (char *)this + 292);
    CFRelease(v10);
  }
  v12 = (const __CFString *)IOHIDServiceCopyProperty();
  if (v12)
  {
    v13 = v12;
    v14 = CFGetTypeID(v12);
    if (v14 == CFStringGetTypeID())
    {
      IOHIDKeyboardFilter::createMapFromStringMap(v13, (uint64_t)&v74);
      v15 = (char *)this + 144;
      sub_2311165A8((uint64_t)this + 136, *((_QWORD **)this + 18));
      v16 = v75;
      *((_QWORD *)this + 17) = v74;
      *((_QWORD *)this + 18) = v16;
      v17 = v76;
      *((_QWORD *)this + 19) = v76;
      if (v17)
      {
        v16[2] = v15;
        v74 = (unint64_t)&v75;
        v75 = 0;
        v76 = 0;
        v16 = 0;
      }
      else
      {
        *((_QWORD *)this + 17) = v15;
      }
      sub_2311165A8((uint64_t)&v74, v16);
    }
    CFRelease(v13);
  }
  v18 = (const __CFString *)IOHIDServiceCopyProperty();
  if (v18)
  {
    v19 = v18;
    v20 = CFGetTypeID(v18);
    if (v20 == CFStringGetTypeID())
    {
      IOHIDKeyboardFilter::createMapFromStringMap(v19, (uint64_t)&v74);
      v73 = 512;
      v78 = &v73;
      v21 = sub_231116634((uint64_t **)this + 21, &v73, (uint64_t)&std::piecewise_construct, &v78);
      v22 = v21 + 6;
      v23 = v21 + 5;
      sub_2311165A8((uint64_t)(v21 + 5), v21[6]);
      v24 = v75;
      *(v22 - 1) = v74;
      *v22 = v24;
      v25 = v76;
      v22[1] = v76;
      if (v25)
      {
        v24[2] = v22;
        v74 = (unint64_t)&v75;
        v75 = 0;
        v76 = 0;
        v24 = 0;
      }
      else
      {
        *v23 = v22;
      }
      sub_2311165A8((uint64_t)&v74, v24);
      LODWORD(v78) = 512;
      v74 = (unint64_t)&v78;
      v26 = sub_231116634((uint64_t **)this + 21, (unsigned int *)&v78, (uint64_t)&std::piecewise_construct, (_DWORD **)&v74)[5];
      LODWORD(v78) = 512;
      v74 = (unint64_t)&v78;
      if (v26 != (uint64_t *)(sub_231116634((uint64_t **)this + 21, (unsigned int *)&v78, (uint64_t)&std::piecewise_construct, (_DWORD **)&v74)+ 6))
      {
        do
        {
          v27 = (uint64_t *)v26[1];
          v28 = v26;
          if (v27)
          {
            do
            {
              v29 = (uint64_t **)v27;
              v27 = (uint64_t *)*v27;
            }
            while (v27);
          }
          else
          {
            do
            {
              v29 = (uint64_t **)v28[2];
              v30 = *v29 == v28;
              v28 = (uint64_t *)v29;
            }
            while (!v30);
          }
          if (*((_DWORD *)v26 + 9) == 7 && (*((_DWORD *)v26 + 8) - 79) <= 3)
          {
            LODWORD(v78) = 512;
            v74 = (unint64_t)&v78;
            v32 = sub_231116634((uint64_t **)this + 21, (unsigned int *)&v78, (uint64_t)&std::piecewise_construct, (_DWORD **)&v74);
            sub_231116C60(v32 + 5, v26);
            operator delete(v26);
          }
          LODWORD(v78) = 512;
          v74 = (unint64_t)&v78;
          v26 = (uint64_t *)v29;
        }
        while (v29 != sub_231116634((uint64_t **)this + 21, (unsigned int *)&v78, (uint64_t)&std::piecewise_construct, (_DWORD **)&v74)+ 6);
      }
    }
    CFRelease(v19);
  }
  v33 = (const __CFString *)IOHIDServiceCopyProperty();
  if (v33)
  {
    v34 = v33;
    v35 = CFGetTypeID(v33);
    if (v35 == CFStringGetTypeID())
    {
      IOHIDKeyboardFilter::createMapFromStringMap(v34, (uint64_t)&v74);
      v73 = 1;
      v78 = &v73;
      v36 = sub_231116634((uint64_t **)this + 24, &v73, (uint64_t)&std::piecewise_construct, &v78);
      v37 = v36 + 6;
      v38 = v36 + 5;
      sub_2311165A8((uint64_t)(v36 + 5), v36[6]);
      v39 = v75;
      *(v37 - 1) = v74;
      *v37 = v39;
      v40 = v76;
      v37[1] = v76;
      if (v40)
      {
        v39[2] = v37;
        v74 = (unint64_t)&v75;
        v75 = 0;
        v76 = 0;
        v39 = 0;
      }
      else
      {
        *v38 = v37;
      }
      sub_2311165A8((uint64_t)&v74, v39);
    }
    CFRelease(v34);
  }
  v41 = (const __CFString *)IOHIDServiceCopyProperty();
  if (v41)
  {
    v42 = v41;
    v43 = CFGetTypeID(v41);
    if (v43 == CFStringGetTypeID())
    {
      IOHIDKeyboardFilter::createMapFromStringMap(v42, (uint64_t)&v74);
      v44 = (char *)this + 248;
      sub_2311165A8((uint64_t)this + 240, *((_QWORD **)this + 31));
      v45 = v75;
      *((_QWORD *)this + 30) = v74;
      *((_QWORD *)this + 31) = v45;
      v46 = v76;
      *((_QWORD *)this + 32) = v76;
      if (v46)
      {
        v45[2] = v44;
        v74 = (unint64_t)&v75;
        v75 = 0;
        v76 = 0;
        v45 = 0;
      }
      else
      {
        *((_QWORD *)this + 30) = v44;
      }
      sub_2311165A8((uint64_t)&v74, v45);
    }
    CFRelease(v42);
  }
  IOHIDKeyboardFilter::setDoNotDisturbState(this);
  v47 = (const __CFBoolean *)IOHIDPreferencesCopyDomain();
  if (v47)
  {
    v48 = v47;
    v49 = (int *)((char *)this + 452);
    *((_DWORD *)this + 113) = CFBooleanGetValue(v47);
    CFRelease(v48);
  }
  else
  {
    v49 = (int *)((char *)this + 452);
    *((_DWORD *)this + 113) = 1;
  }
  v50 = (const __CFBoolean *)IOHIDServiceCopyProperty();
  v51 = v50;
  if (*((_DWORD *)this + 113))
  {
    if (v50)
      Value = CFBooleanGetValue(v50);
    else
      Value = 1;
    *v49 = Value;
  }
  if (v51)
    CFRelease(v51);
  v53 = (const __CFDictionary *)IOHIDServiceCopyProperty();
  if (v53)
  {
    v54 = v53;
    v55 = (const __CFBoolean *)CFDictionaryGetValue(v53, CFSTR("HIDCapsLockStateCache"));
    if (v55)
      LODWORD(v55) = CFBooleanGetValue(v55);
    *((_DWORD *)this + 110) = (_DWORD)v55;
    *((_DWORD *)this + 111) = (_DWORD)v55;
    v56 = (const __CFBoolean *)CFDictionaryGetValue(v54, CFSTR("HIDCapsLockLEDInhibit"));
    if (v56)
      LODWORD(v56) = CFBooleanGetValue(v56);
    v57 = (_QWORD *)MEMORY[0x24BDD8AE8];
    *((_DWORD *)this + 112) = (_DWORD)v56;
    *((_QWORD *)this + 57) = *v57;
    v58 = CFDictionaryGetValue(v54, (const void *)*MEMORY[0x24BDD8AE0]);
    if (v58)
    {
      v59 = v58;
      v60 = *MEMORY[0x24BDD8B00];
      if (CFEqual(v58, (CFTypeRef)*MEMORY[0x24BDD8B00])
        || (v60 = *MEMORY[0x24BDD8AF8], CFEqual(v59, (CFTypeRef)*MEMORY[0x24BDD8AF8]))
        || (v60 = *MEMORY[0x24BDD8AF0], CFEqual(v59, (CFTypeRef)*MEMORY[0x24BDD8AF0])))
      {
        *((_QWORD *)this + 57) = v60;
      }
    }
    v61 = (const __CFArray *)CFDictionaryGetValue(v54, CFSTR("HIDKeyboardModifierMappingPairs"));
    if (v61)
    {
      v62 = v61;
      v63 = CFGetTypeID(v61);
      if (v63 == CFArrayGetTypeID())
      {
        IOHIDKeyboardFilter::createMapFromArrayOfPairs(v62, (uint64_t)&v74);
        v64 = (char *)this + 120;
        sub_2311165A8((uint64_t)this + 112, *((_QWORD **)this + 15));
        v65 = v75;
        *((_QWORD *)this + 14) = v74;
        *((_QWORD *)this + 15) = v65;
        v66 = v76;
        *((_QWORD *)this + 16) = v76;
        if (v66)
        {
          v65[2] = v64;
          v74 = (unint64_t)&v75;
          v75 = 0;
          v76 = 0;
          v65 = 0;
        }
        else
        {
          *((_QWORD *)this + 14) = v64;
        }
        sub_2311165A8((uint64_t)&v74, v65);
      }
    }
    v67 = (const __CFNumber *)CFDictionaryGetValue(v54, CFSTR("HIDSlowKeysDelay"));
    if (v67)
      CFNumberGetValue(v67, kCFNumberSInt32Type, (char *)this + 304);
    v68 = (const __CFNumber *)CFDictionaryGetValue(v54, CFSTR("HIDInitialKeyRepeat"));
    if (v68)
    {
      v74 = 0;
      CFNumberGetValue(v68, kCFNumberSInt64Type, &v74);
      *((_QWORD *)this + 47) = v74 / 0xF4240;
    }
    v69 = (const __CFNumber *)CFDictionaryGetValue(v54, CFSTR("HIDKeyRepeat"));
    if (v69)
    {
      v74 = 0;
      CFNumberGetValue(v69, kCFNumberSInt64Type, &v74);
      *((_QWORD *)this + 48) = v74 / 0xF4240;
    }
    v70 = (const __CFNumber *)CFDictionaryGetValue(v54, CFSTR("CapsLockDelay"));
    if (v70)
      CFNumberGetValue(v70, kCFNumberSInt32Type, (char *)this + 400);
    v71 = (const __CFNumber *)CFDictionaryGetValue(v54, CFSTR("CapsLockDelayOverride"));
    if (v71)
      CFNumberGetValue(v71, kCFNumberSInt32Type, (char *)this + 404);
    v72 = (const __CFNumber *)CFDictionaryGetValue(v54, CFSTR("LockKeyDelay"));
    if (v72)
      CFNumberGetValue(v72, kCFNumberSInt32Type, (char *)this + 424);
    CFRelease(v54);
  }
}

void sub_231110FDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, _QWORD *a11)
{
  sub_2311165A8((uint64_t)&a10, a11);
  _Unwind_Resume(a1);
}

uint64_t IOHIDKeyboardFilter::getKeyboardID(IOHIDKeyboardFilter *this)
{
  const __CFNumber *v1;
  const __CFNumber *v2;
  CFTypeID v3;
  const __CFNumber *v5;
  const __CFNumber *v6;
  CFTypeID v7;
  const __CFNumber *TypeID;
  const __CFNumber *v9;
  CFTypeID v10;
  int v11;
  unsigned __int16 v12;
  unsigned __int16 v13;
  unsigned int valuePtr;

  valuePtr = 3;
  v1 = (const __CFNumber *)IOHIDServiceCopyProperty();
  if (v1 && (v2 = v1, v3 = CFGetTypeID(v1), v3 == CFNumberGetTypeID()))
  {
    CFNumberGetValue(v2, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v2);
    return valuePtr;
  }
  else
  {
    v13 = -1;
    v12 = -1;
    v5 = (const __CFNumber *)IOHIDServiceCopyProperty();
    if (v5)
    {
      v6 = v5;
      v7 = CFGetTypeID(v5);
      if (v7 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v6, kCFNumberSInt16Type, &v13);
        CFRelease(v6);
      }
    }
    TypeID = (const __CFNumber *)IOHIDServiceCopyProperty();
    if (TypeID
      && (v9 = TypeID,
          v10 = CFGetTypeID(TypeID),
          TypeID = (const __CFNumber *)CFNumberGetTypeID(),
          (const __CFNumber *)v10 == TypeID))
    {
      CFNumberGetValue(v9, kCFNumberSInt16Type, &v12);
      CFRelease(v9);
      v11 = v12;
    }
    else
    {
      v11 = 0xFFFF;
    }
    return IOHIDKeyboardFilter::getKeyboardID(TypeID, v13, v11);
  }
}

void IOHIDKeyboardFilter::createMapFromStringMap(CFStringRef theString@<X1>, uint64_t a2@<X8>)
{
  char *CStringPtr;
  __int128 v5;
  _QWORD *v6;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  std::string __p;
  char v11;
  _BYTE v12[7];
  std::string __str;
  std::string v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  void *v20[2];
  __int128 v21;
  _OWORD v22[10];

  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)a2 = a2 + 8;
  if (theString)
  {
    CStringPtr = (char *)CFStringGetCStringPtr(theString, 0);
    if (CStringPtr)
    {
      *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v22[8] = v5;
      v22[9] = v5;
      v22[6] = v5;
      v22[7] = v5;
      v22[4] = v5;
      v22[5] = v5;
      v22[2] = v5;
      v22[3] = v5;
      v22[0] = v5;
      v22[1] = v5;
      *(_OWORD *)v20 = v5;
      v21 = v5;
      v18 = v5;
      v19 = v5;
      v16 = v5;
      v17 = v5;
      v15 = v5;
      sub_231116470(&__p, CStringPtr);
      sub_231114B54(&v15, &__p, 8);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      memset(&v14, 0, sizeof(v14));
      memset(&__str, 0, sizeof(__str));
      while (1)
      {
        v6 = sub_231114C38(&v15, (uint64_t)&v14, 0x2Cu);
        if ((*((_BYTE *)v6 + *(_QWORD *)(*v6 - 24) + 32) & 5) != 0)
          break;
        v7 = sub_231114C38(&v15, (uint64_t)&__str, 0x2Cu);
        if ((*((_BYTE *)v7 + *(_QWORD *)(*v7 - 24) + 32) & 5) != 0)
          break;
        v8 = std::stoul(&__str, 0, 0);
        if (v8)
        {
          v9 = std::stoul(&v14, 0, 0);
          LODWORD(__p.__r_.__value_.__l.__data_) = (unsigned __int16)v9;
          HIDWORD(__p.__r_.__value_.__r.__words[0]) = v9 >> 16;
          __p.__r_.__value_.__s.__data_[8] = 0;
          *(_DWORD *)((char *)&__p.__r_.__value_.__r.__words[1] + 1) = -1431655766;
          HIDWORD(__p.__r_.__value_.__r.__words[1]) = -1431655766;
          LODWORD(__p.__r_.__value_.__r.__words[2]) = (unsigned __int16)v8;
          HIDWORD(__p.__r_.__value_.__r.__words[2]) = v8 >> 16;
          v11 = 0;
          memset(v12, 170, sizeof(v12));
          sub_231116B40((uint64_t **)a2, (unint64_t *)&__p, &__p);
        }
      }
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__str.__r_.__value_.__l.__data_);
      if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v14.__r_.__value_.__l.__data_);
      *(_QWORD *)&v15 = *MEMORY[0x24BEDB7F8];
      *(_QWORD *)((char *)&v15 + *(_QWORD *)(v15 - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F8] + 24);
      *(_QWORD *)&v16 = MEMORY[0x24BEDB848] + 16;
      if (SBYTE7(v21) < 0)
        operator delete(v20[0]);
      std::streambuf::~streambuf();
      std::istream::~istream();
      MEMORY[0x2348D2500]((char *)v22 + 8);
    }
  }
}

void sub_231111338(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,char a28)
{
  uint64_t v28;

  if (a14 < 0)
    operator delete(__p);
  sub_2311165A8(v28, *(_QWORD **)(v28 + 8));
  _Unwind_Resume(a1);
}

void IOHIDKeyboardFilter::createMapFromArrayOfPairs(CFArrayRef theArray@<X1>, uint64_t a2@<X8>)
{
  CFIndex i;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v7;
  CFTypeID v8;
  const __CFNumber *Value;
  const __CFNumber *v10;
  __int128 v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t valuePtr;

  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)a2 = a2 + 8;
  if (theArray && CFArrayGetCount(theArray))
  {
    for (i = 0; i < CFArrayGetCount(theArray); ++i)
    {
      v14 = 0;
      valuePtr = 0;
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, i);
      v7 = ValueAtIndex;
      if (ValueAtIndex)
      {
        v8 = CFGetTypeID(ValueAtIndex);
        if (v8 == CFDictionaryGetTypeID())
        {
          Value = (const __CFNumber *)CFDictionaryGetValue(v7, CFSTR("HIDKeyboardModifierMappingSrc"));
          if (Value)
          {
            CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr);
            v10 = (const __CFNumber *)CFDictionaryGetValue(v7, CFSTR("HIDKeyboardModifierMappingDst"));
            if (v10)
            {
              CFNumberGetValue(v10, kCFNumberSInt64Type, &v14);
              *(_QWORD *)&v11 = valuePtr;
              BYTE8(v11) = 0;
              v12 = v14;
              v13 = 0;
              sub_231116B40((uint64_t **)a2, (unint64_t *)&v11, &v11);
            }
          }
        }
      }
    }
  }
}

void sub_2311114BC(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_2311165A8(v1, *(_QWORD **)(v1 + 8));
  _Unwind_Resume(a1);
}

void IOHIDKeyboardFilter::scheduleWithDispatchQueue(uint64_t a1, void *a2)
{
  id v4;
  StickyKeyHandler *v5;
  void *v6;
  dispatch_source_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  dispatch_source_t v11;
  void *v12;
  NSObject *v13;
  dispatch_source_t v14;
  void *v15;
  NSObject *v16;
  dispatch_source_t v17;
  void *v18;
  NSObject *v19;
  dispatch_source_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  int v24;
  NSObject *v25;
  uint64_t RegistryID;
  const void *KeyboardEvent;
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD handler[5];
  uint8_t buf[4];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_storeStrong((id *)(a1 + 496), a2);
  v5 = -[StickyKeyHandler initWithFilter:service:]([StickyKeyHandler alloc], "initWithFilter:service:", a1, *(_QWORD *)(a1 + 24));
  v6 = *(void **)(a1 + 480);
  *(_QWORD *)(a1 + 480) = v5;

  v7 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *(dispatch_queue_t *)(a1 + 496));
  v8 = *(void **)(a1 + 504);
  *(_QWORD *)(a1 + 504) = v7;

  v9 = *(NSObject **)(a1 + 504);
  v10 = MEMORY[0x24BDAC760];
  if (v9)
  {
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = sub_2311118E0;
    handler[3] = &unk_250000588;
    handler[4] = a1;
    dispatch_source_set_event_handler(v9, handler);
    dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 504), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    dispatch_resume(*(dispatch_object_t *)(a1 + 504));
  }
  v11 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *(dispatch_queue_t *)(a1 + 496));
  v12 = *(void **)(a1 + 512);
  *(_QWORD *)(a1 + 512) = v11;

  v13 = *(NSObject **)(a1 + 512);
  if (v13)
  {
    v31[0] = v10;
    v31[1] = 3221225472;
    v31[2] = sub_231111914;
    v31[3] = &unk_250000588;
    v31[4] = a1;
    dispatch_source_set_event_handler(v13, v31);
    dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 512), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    dispatch_resume(*(dispatch_object_t *)(a1 + 512));
  }
  v14 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *(dispatch_queue_t *)(a1 + 496));
  v15 = *(void **)(a1 + 520);
  *(_QWORD *)(a1 + 520) = v14;

  v16 = *(NSObject **)(a1 + 520);
  if (v16)
  {
    v30[0] = v10;
    v30[1] = 3221225472;
    v30[2] = sub_2311119BC;
    v30[3] = &unk_250000588;
    v30[4] = a1;
    dispatch_source_set_event_handler(v16, v30);
    dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 520), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    dispatch_resume(*(dispatch_object_t *)(a1 + 520));
  }
  v17 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *(dispatch_queue_t *)(a1 + 496));
  v18 = *(void **)(a1 + 528);
  *(_QWORD *)(a1 + 528) = v17;

  v19 = *(NSObject **)(a1 + 528);
  if (v19)
  {
    v29[0] = v10;
    v29[1] = 3221225472;
    v29[2] = sub_231111A50;
    v29[3] = &unk_250000588;
    v29[4] = a1;
    dispatch_source_set_event_handler(v19, v29);
    dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 528), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    dispatch_resume(*(dispatch_object_t *)(a1 + 528));
  }
  v20 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *(dispatch_queue_t *)(a1 + 496));
  v21 = *(void **)(a1 + 432);
  *(_QWORD *)(a1 + 432) = v20;

  v22 = *(NSObject **)(a1 + 432);
  if (v22)
  {
    v28[0] = v10;
    v28[1] = 3221225472;
    v28[2] = sub_231111AD0;
    v28[3] = &unk_250000588;
    v28[4] = a1;
    dispatch_source_set_event_handler(v22, v28);
    dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 432), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    dispatch_resume(*(dispatch_object_t *)(a1 + 432));
  }
  if (objc_msgSend(*(id *)(a1 + 464), "BOOLValue"))
  {
    +[AppleKeyboardStateManager sharedManager](AppleKeyboardStateManager, "sharedManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isCapsLockEnabled:", *(_QWORD *)(a1 + 472));

    if (v24)
    {
      _IOHIDLogCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        RegistryID = *(_QWORD *)(a1 + 24);
        if (RegistryID)
          RegistryID = IOHIDServiceGetRegistryID();
        *(_DWORD *)buf = 138412290;
        v34 = RegistryID;
        _os_log_impl(&dword_23110E000, v25, OS_LOG_TYPE_INFO, "[%@] Restoring capslock state\n", buf, 0xCu);
      }

      mach_absolute_time();
      KeyboardEvent = (const void *)IOHIDEventCreateKeyboardEvent();
      if (KeyboardEvent)
      {
        (*(void (**)(_QWORD, _QWORD, uint64_t, const void *, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a1, KeyboardEvent, 0);
        CFRelease(KeyboardEvent);
      }
    }
  }

}

void sub_2311118A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2311118E0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  dispatch_source_set_timer(*(dispatch_source_t *)(v1 + 504), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
  *(_DWORD *)(v1 + 308) = 0;
}

void sub_231111914(uint64_t a1)
{
  dispatch_source_t *v1;

  v1 = *(dispatch_source_t **)(a1 + 32);
  dispatch_source_set_timer(v1[64], 0xFFFFFFFFFFFFFFFFLL, 0, 0);
  IOHIDKeyboardFilter::dispatchSlowKey((IOHIDKeyboardFilter *)v1);
}

void IOHIDKeyboardFilter::dispatchSlowKey(IOHIDKeyboardFilter *this)
{
  const void *v1;

  v1 = (const void *)*((_QWORD *)this + 37);
  *((_QWORD *)this + 37) = 0;
  if (v1)
  {
    mach_absolute_time();
    IOHIDEventSetTimeStamp();
    IOHIDEventSetIntegerValue();
    (*((void (**)(_QWORD, _QWORD, IOHIDKeyboardFilter *, const void *, _QWORD))this + 4))(*((_QWORD *)this + 5), *((_QWORD *)this + 6), this, v1, 0);
    CFRelease(v1);
  }
}

void sub_2311119BC(uint64_t a1)
{
  dispatch_source_t *v1;

  v1 = *(dispatch_source_t **)(a1 + 32);
  dispatch_source_set_timer(v1[65], 0xFFFFFFFFFFFFFFFFLL, 0, 0);
  IOHIDKeyboardFilter::dispatchKeyRepeat((IOHIDKeyboardFilter *)v1);
}

void IOHIDKeyboardFilter::dispatchKeyRepeat(IOHIDKeyboardFilter *this)
{
  const void *v1;

  v1 = (const void *)*((_QWORD *)this + 46);
  *((_QWORD *)this + 46) = 0;
  if (v1)
  {
    mach_absolute_time();
    IOHIDEventSetTimeStamp();
    (*((void (**)(_QWORD, _QWORD, IOHIDKeyboardFilter *, const void *, _QWORD))this + 4))(*((_QWORD *)this + 5), *((_QWORD *)this + 6), this, v1, 0);
    CFRelease(v1);
  }
}

void sub_231111A50(uint64_t a1)
{
  dispatch_source_t *v1;

  v1 = *(dispatch_source_t **)(a1 + 32);
  dispatch_source_set_timer(v1[66], 0xFFFFFFFFFFFFFFFFLL, 0, 0);
  IOHIDKeyboardFilter::dispatchCapsLock((IOHIDKeyboardFilter *)v1);
}

void IOHIDKeyboardFilter::dispatchCapsLock(IOHIDKeyboardFilter *this)
{
  const void *v1;

  v1 = (const void *)*((_QWORD *)this + 49);
  *((_QWORD *)this + 49) = 0;
  if (v1)
  {
    (*((void (**)(_QWORD, _QWORD, IOHIDKeyboardFilter *, const void *, _QWORD))this + 4))(*((_QWORD *)this + 5), *((_QWORD *)this + 6), this, v1, 0);
    CFRelease(v1);
  }
}

void sub_231111AD0(uint64_t a1)
{
  dispatch_source_t *v1;

  v1 = *(dispatch_source_t **)(a1 + 32);
  dispatch_source_set_timer(v1[54], 0xFFFFFFFFFFFFFFFFLL, 0, 0);
  IOHIDKeyboardFilter::dispatchLockKey((IOHIDKeyboardFilter *)v1);
}

void IOHIDKeyboardFilter::dispatchLockKey(IOHIDKeyboardFilter *this)
{
  const void *v1;

  v1 = (const void *)*((_QWORD *)this + 52);
  *((_QWORD *)this + 52) = 0;
  if (v1)
  {
    (*((void (**)(_QWORD, _QWORD, IOHIDKeyboardFilter *, const void *, _QWORD))this + 4))(*((_QWORD *)this + 5), *((_QWORD *)this + 6), this, v1, 0);
    CFRelease(v1);
  }
}

void IOHIDKeyboardFilter::unscheduleFromDispatchQueue(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[6];
  _QWORD v11[3];
  CFTypeRef v12;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 504);
  if (v4)
    dispatch_source_cancel(v4);
  v5 = *(NSObject **)(a1 + 512);
  if (v5)
    dispatch_source_cancel(v5);
  v6 = *(NSObject **)(a1 + 520);
  if (v6)
    dispatch_source_cancel(v6);
  v7 = *(NSObject **)(a1 + 528);
  if (v7)
    dispatch_source_cancel(v7);
  v8 = *(NSObject **)(a1 + 432);
  if (v8)
    dispatch_source_cancel(v8);
  objc_msgSend(*(id *)(a1 + 480), "removeObserver");
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v12 = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
  v12 = CFRetain(*(CFTypeRef *)(a1 + 24));
  v9 = *(NSObject **)(a1 + 496);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_231111C50;
  v10[3] = &unk_2500005B0;
  v10[4] = v11;
  v10[5] = a1;
  dispatch_async(v9, v10);
  _Block_object_dispose(v11, 8);

}

void sub_231111C3C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_231111C50(uint64_t a1)
{
  IOHIDKeyboardFilter *v2;
  const void *v3;
  const void *v4;
  const void *v5;

  v2 = *(IOHIDKeyboardFilter **)(a1 + 40);
  IOHIDKeyboardFilter::dispatchStickyKeys(v2, 14);
  v3 = (const void *)*((_QWORD *)v2 + 37);
  if (v3)
  {
    CFRelease(v3);
    *((_QWORD *)v2 + 37) = 0;
  }
  v4 = (const void *)*((_QWORD *)v2 + 49);
  if (v4)
  {
    CFRelease(v4);
    *((_QWORD *)v2 + 49) = 0;
  }
  v5 = (const void *)*((_QWORD *)v2 + 52);
  if (v5)
  {
    CFRelease(v5);
    *((_QWORD *)v2 + 52) = 0;
  }
  CFRelease(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

void IOHIDKeyboardFilter::stopStickyKey(IOHIDKeyboardFilter *this)
{
  IOHIDKeyboardFilter::dispatchStickyKeys(this, 14);
}

CFTypeRef IOHIDKeyboardFilter::copyPropertyForClient(IOHIDKeyboardFilter *this, CFTypeRef cf1, const void *a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  CFTypeRef v8;
  unint64_t v10;
  CFTypeRef cf;

  if (CFEqual(cf1, CFSTR("HIDCapsLockState")))
  {
    v5 = MEMORY[0x24BDBD270];
    v6 = *((_DWORD *)this + 110);
  }
  else
  {
    if (CFEqual(cf1, CFSTR("ServiceFilterDebug")))
    {
      v10 = 0xAAAAAAAAAAAAAAAALL;
      cf = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
      sub_23111613C(&v10, 0);
      if (cf)
      {
        IOHIDKeyboardFilter::serialize(this, (__CFDictionary *)cf);
        v8 = CFRetain(cf);
      }
      else
      {
        v8 = 0;
      }
      sub_231116214(&v10);
      return v8;
    }
    if (CFEqual(cf1, (CFTypeRef)*MEMORY[0x24BDD8AE0]))
    {
      v5 = MEMORY[0x24BDD8B00];
      v6 = *((_DWORD *)this + 111);
      v7 = MEMORY[0x24BDD8AF8];
      goto LABEL_4;
    }
    if (CFEqual(cf1, CFSTR("HIDStickyKeysOn")))
    {
      sub_231117054(&v10, *((_DWORD *)this + 89));
      v8 = cf;
      sub_231116254(&v10);
      return v8;
    }
    if (CFEqual(cf1, CFSTR("UnifiedKeyMapping")))
    {
      v5 = MEMORY[0x24BDBD270];
      v6 = *((unsigned __int8 *)this + 56);
    }
    else
    {
      if (!CFEqual(cf1, CFSTR("HIDKeyboardSupportsDoNotDisturbKey")))
        return 0;
      v5 = MEMORY[0x24BDBD270];
      v6 = *((_DWORD *)this + 122);
    }
  }
  v7 = MEMORY[0x24BDBD268];
LABEL_4:
  if (!v6)
    v5 = v7;
  return *(CFTypeRef *)v5;
}

void sub_231111E48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_231116214(&a9);
  _Unwind_Resume(a1);
}

_QWORD *IOHIDKeyboardFilter::serialize(IOHIDKeyboardFilter *this, __CFDictionary *a2)
{
  const void **v3;
  uint64_t v5;
  void *value;
  void *v7;
  CFMutableDictionaryRef theDict;

  v7 = (void *)0xAAAAAAAAAAAAAAAALL;
  theDict = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
  sub_2311163F0(&v7, a2, 0);
  v7 = &unk_250000600;
  CFDictionarySetValue(theDict, CFSTR("Class"), CFSTR("IOHIDKeyboardFilter"));
  IOHIDKeyboardFilter::serializeMapper((uint64_t)this + 136, (uint64_t)&v5);
  if (value)
    CFDictionarySetValue(theDict, CFSTR("FnFunctionUsageMap"), value);
  sub_2311163B0(&v5);
  v3 = (const void **)MEMORY[0x24BDBD270];
  if (!*((_BYTE *)this + 56))
    v3 = (const void **)MEMORY[0x24BDBD268];
  if (*v3)
    CFDictionarySetValue(theDict, CFSTR("UnifiedKeyMapping"), *v3);
  IOHIDKeyboardFilter::serializeModifierMappings((uint64_t)this + 192, (uint64_t)&v5);
  if (value)
    CFDictionarySetValue(theDict, CFSTR("UnifiedKeyMaps"), value);
  sub_2311163B0(&v5);
  IOHIDKeyboardFilter::serializeModifierMappings((uint64_t)this + 168, (uint64_t)&v5);
  if (value)
    CFDictionarySetValue(theDict, CFSTR("LegacyKeyMaps"), value);
  sub_2311163B0(&v5);
  IOHIDKeyboardFilter::serializeMapper((uint64_t)this + 112, (uint64_t)&v5);
  if (value)
    CFDictionarySetValue(theDict, CFSTR("HIDKeyboardModifierMappingPairs"), value);
  sub_2311163B0(&v5);
  IOHIDKeyboardFilter::serializeMapper((uint64_t)this + 240, (uint64_t)&v5);
  if (value)
    CFDictionarySetValue(theDict, CFSTR("NumLockKeyboardUsageMap"), value);
  sub_2311163B0(&v5);
  IOHIDKeyboardFilter::serializeMapper((uint64_t)this + 264, (uint64_t)&v5);
  if (value)
    CFDictionarySetValue(theDict, CFSTR("UserKeyMapping"), value);
  sub_2311163B0(&v5);
  sub_231115D68((uint64_t)&v7, CFSTR("HIDInitialKeyRepeat"), *((_QWORD *)this + 47));
  sub_231115D68((uint64_t)&v7, CFSTR("HIDKeyRepeat"), *((_QWORD *)this + 48));
  sub_231115D68((uint64_t)&v7, CFSTR("LockKeyDelay"), *((unsigned int *)this + 106));
  sub_231115D68((uint64_t)&v7, CFSTR("CapsLockState"), *((int *)this + 110));
  sub_231115D68((uint64_t)&v7, CFSTR("CapsLockLEDState"), *((int *)this + 111));
  sub_231115D68((uint64_t)&v7, CFSTR("MatchScore"), *((int *)this + 5));
  sub_231115D68((uint64_t)&v7, CFSTR("FnKeyMode"), *((unsigned int *)this + 72));
  return sub_231116214(&v7);
}

void sub_2311120A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  sub_2311163B0(&a9);
  sub_231116214(&a11);
  _Unwind_Resume(a1);
}

uint64_t IOHIDKeyboardFilter::hasTCCPermissions()
{
  IOHIDEventSystemConnectionGetAuditToken();
  return IOHIDAccessCheckAuditToken();
}

uint64_t IOHIDKeyboardFilter::allowRemapping(IOHIDKeyboardFilter *this, const void *a2, const void *a3)
{
  __int128 v3;
  NSObject *v5;
  uint64_t UUID;
  _OWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 1;
  if (!_IOHIDIsRestrictedRemappingProperty())
    return 1;
  if (IOHIDEventSystemConnectionHasEntitlement())
    return 1;
  *(_QWORD *)&v3 = -1;
  *((_QWORD *)&v3 + 1) = -1;
  v7[0] = v3;
  v7[1] = v3;
  IOHIDEventSystemConnectionGetAuditToken();
  if ((IOHIDAccessCheckAuditToken() & 1) != 0)
    return 1;
  _IOHIDLogCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    UUID = IOHIDEventSystemConnectionGetUUID();
    sub_231117CD8(UUID, (uint64_t)v7);
  }

  return 0;
}

void sub_231112220(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void IOHIDKeyboardFilter::setPropertyForClient(IOHIDKeyboardFilter *this, const __CFString *a2, const __CFBoolean *a3, const __CFString *a4)
{
  const __CFBoolean *v4;
  const __CFBoolean *v6;
  int v9;
  int v10;
  NSObject *v11;
  _DWORD *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  _BOOL4 v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t RegistryID;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  CFTypeID TypeID;
  int v25;
  BOOL v26;
  NSObject *v27;
  const void *v28;
  const __CFString *v29;
  NSObject *v30;
  uint64_t v31;
  CFTypeID v32;
  IOHIDKeyboardFilter *v33;
  _QWORD *v34;
  _QWORD *v35;
  unint64_t v36;
  BOOL v37;
  _QWORD *v38;
  const __CFString *v39;
  NSObject *v40;
  uint64_t v41;
  CFTypeID v42;
  CFTypeID v43;
  IOHIDKeyboardFilter *v44;
  NSObject *v45;
  uint64_t v46;
  CFTypeID v47;
  NSObject *v48;
  const void *v49;
  CFTypeID v50;
  NSObject *v51;
  CFTypeID v52;
  NSObject *v53;
  BOOL v54;
  int v55;
  BOOL v56;
  CFTypeID v57;
  IOHIDKeyboardFilter *v58;
  uint64_t **v59;
  NSObject *v60;
  uint64_t v61;
  const void *v62;
  _QWORD v63[5];
  int v64;
  uint64_t v65[3];
  uint64_t v66[3];
  uint64_t v67[3];
  _DWORD *valuePtr[4];
  unsigned int v69[4];
  uint8_t buf[24];
  const __CFBoolean *v71;
  __int16 v72;
  const __CFString *v73;
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  if (a3)
    v4 = a3;
  else
    v4 = (const __CFBoolean *)*MEMORY[0x24BDBD268];
  if (!a2)
    return;
  v6 = a3;
  v9 = *((_DWORD *)this + 89);
  v10 = *((_DWORD *)this + 90);
  _IOHIDLogCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    RegistryID = *((_QWORD *)this + 3);
    if (RegistryID)
      RegistryID = IOHIDServiceGetRegistryID();
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = RegistryID;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = a2;
    *(_WORD *)&buf[22] = 2112;
    v71 = v6;
    v72 = 2112;
    v73 = a4;
    _os_log_debug_impl(&dword_23110E000, v11, OS_LOG_TYPE_DEBUG, "[%@] IOHIDKeyboardFilter::setPropertyForClient: %@  %@  %@\n", buf, 0x2Au);
  }

  v12 = (_DWORD *)((char *)this + 360);
  if (CFStringCompare(a2, CFSTR("HIDStickyKeysDisabled"), 0) == kCFCompareEqualTo)
  {
    if (v6)
      v10 = CFBooleanGetValue(v6) != 0;
    else
      v10 = 0;
    _IOHIDLogCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      if (*((_QWORD *)this + 3))
        IOHIDServiceGetRegistryID();
      sub_231117D50();
    }
    goto LABEL_57;
  }
  if (CFStringCompare(a2, CFSTR("HIDStickyKeysOn"), 0) == kCFCompareEqualTo)
  {
    if (v6)
      v9 = CFBooleanGetValue(v6) != 0;
    else
      v9 = 0;
    goto LABEL_58;
  }
  if (CFStringCompare(a2, CFSTR("HIDStickyKeysShiftToggles"), 0) == kCFCompareEqualTo)
  {
    if (v6)
      v16 = CFBooleanGetValue(v6) != 0;
    else
      v16 = 0;
    *((_DWORD *)this + 88) = v16;
    *((_DWORD *)this + 77) = 0;
    _IOHIDLogCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      if (*((_QWORD *)this + 3))
        IOHIDServiceGetRegistryID();
      sub_231117D84();
    }
    goto LABEL_57;
  }
  if (CFStringCompare(a2, CFSTR("HIDInitialKeyRepeat"), 0) == kCFCompareEqualTo)
  {
    if (!v6)
      goto LABEL_58;
    valuePtr[0] = 0;
    CFNumberGetValue(v6, kCFNumberSInt64Type, valuePtr);
    *((_QWORD *)this + 47) = (unint64_t)valuePtr[0] / 0xF4240;
    _IOHIDLogCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v18 = *((_QWORD *)this + 3);
      if (v18)
        v18 = IOHIDServiceGetRegistryID();
      sub_231117DB8(v18, (uint64_t)this + 376, (uint64_t)buf);
    }
    goto LABEL_41;
  }
  if (CFStringCompare(a2, CFSTR("HIDKeyRepeat"), 0) == kCFCompareEqualTo)
  {
    if (!v6)
      goto LABEL_58;
    valuePtr[0] = 0;
    CFNumberGetValue(v6, kCFNumberSInt64Type, valuePtr);
    *((_QWORD *)this + 48) = (unint64_t)valuePtr[0] / 0xF4240;
    _IOHIDLogCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v20 = *((_QWORD *)this + 3);
      if (v20)
        v20 = IOHIDServiceGetRegistryID();
      sub_231117DF4(v20, (uint64_t)this + 384, (uint64_t)buf);
    }
LABEL_41:

    goto LABEL_58;
  }
  if (CFStringCompare(a2, CFSTR("HIDCapsLockState"), 0) == kCFCompareEqualTo)
  {
    if (v6)
    {
      TypeID = CFBooleanGetTypeID();
      LODWORD(v6) = TypeID == CFGetTypeID(v6) && CFBooleanGetValue(v6) != 0;
    }
    if (a4)
      v29 = a4;
    else
      v29 = CFSTR("HIDCapsLockState");
    IOHIDKeyboardFilter::setCapsLockState(this, (int)v6, v29);
    _IOHIDLogCategory();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      v31 = *((_QWORD *)this + 3);
      if (v31)
        v31 = IOHIDServiceGetRegistryID();
      sub_231117E30(v31, (uint64_t)buf, (int)v6);
    }

    goto LABEL_58;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDD8AE0]))
  {
    if (v6)
    {
      *((_QWORD *)this + 57) = *MEMORY[0x24BDD8AE8];
      v13 = *MEMORY[0x24BDD8B00];
      if (CFEqual(v6, (CFTypeRef)*MEMORY[0x24BDD8B00])
        || (v13 = *MEMORY[0x24BDD8AF8], CFEqual(v6, (CFTypeRef)*MEMORY[0x24BDD8AF8]))
        || (v13 = *MEMORY[0x24BDD8AF0], CFEqual(v6, (CFTypeRef)*MEMORY[0x24BDD8AF0])))
      {
        *((_QWORD *)this + 57) = v13;
      }
      IOHIDKeyboardFilter::updateCapslockLED(this, a4);
    }
    _IOHIDLogCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v15 = *((_QWORD *)this + 3);
      if (v15)
        v15 = IOHIDServiceGetRegistryID();
      sub_231118070(v15, (uint64_t)this, (uint64_t)buf, v14);
    }
LABEL_57:

    goto LABEL_58;
  }
  if (CFStringCompare(a2, CFSTR("HIDCapsLockLEDInhibit"), 0) == kCFCompareEqualTo)
  {
    *((_DWORD *)this + 112) = CFBooleanGetValue(v4);
    IOHIDKeyboardFilter::updateCapslockLED(this, a4);
    _IOHIDLogCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      if (*((_QWORD *)this + 3))
        IOHIDServiceGetRegistryID();
      sub_231117E68();
    }
    goto LABEL_57;
  }
  if (CFStringCompare(a2, CFSTR("HIDCapsLockLEDDarkWakeInhibit"), 0) == kCFCompareEqualTo)
  {
    *((_DWORD *)this + 113) = CFBooleanGetValue(v4);
    _IOHIDLogCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      if (*((_QWORD *)this + 3))
        IOHIDServiceGetRegistryID();
      sub_231117E9C();
    }
    goto LABEL_57;
  }
  if (CFStringCompare(a2, CFSTR("HIDKeyboardModifierMappingPairs"), 0) == kCFCompareEqualTo)
  {
    if (!v6)
      goto LABEL_58;
    v32 = CFGetTypeID(v6);
    v33 = (IOHIDKeyboardFilter *)CFArrayGetTypeID();
    if ((IOHIDKeyboardFilter *)v32 != v33)
      goto LABEL_58;
    if (!IOHIDKeyboardFilter::allowRemapping(v33, v6, a4))
      return;
    memset(buf, 170, sizeof(buf));
    IOHIDKeyboardFilter::createMapFromArrayOfPairs(v6, (uint64_t)buf);
    IOHIDKeyboardFilter::resetModifiedKeyState(this);
    sub_2311170E4(v67, (uint64_t)buf);
    IOHIDKeyboardFilter::resetModifiedKeyState((uint64_t)this, v67);
    sub_2311165A8((uint64_t)v67, (_QWORD *)v67[1]);
    if ((uint8_t *)((char *)this + 112) != buf)
      sub_2311173F0((uint64_t **)this + 14, *(_QWORD **)buf, &buf[8]);
    v34 = (_QWORD *)*((_QWORD *)this + 15);
    if (v34)
    {
      v35 = (_QWORD *)((char *)this + 120);
      do
      {
        v36 = v34[4];
        v37 = v36 >= 0x700000039;
        if (v36 >= 0x700000039)
          v38 = v34;
        else
          v38 = v34 + 1;
        if (v37)
          v35 = v34;
        v34 = (_QWORD *)*v38;
      }
      while (*v38);
      if (v35 != (_QWORD *)((char *)this + 120) && v35[4] < 0x70000003AuLL)
      {
        if (a4)
          v39 = a4;
        else
          v39 = CFSTR("HIDKeyboardModifierMappingPairs");
        IOHIDKeyboardFilter::setCapsLockState(this, 0, v39);
      }
    }
    _IOHIDLogCategory();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      v41 = *((_QWORD *)this + 3);
      if (v41)
        v41 = IOHIDServiceGetRegistryID();
      sub_231117ED0(v41, (uint64_t)v69);
    }

    goto LABEL_151;
  }
  if (CFStringCompare(a2, CFSTR("HIDFKeyMode"), 0) == kCFCompareEqualTo)
  {
    if (!v6)
      goto LABEL_58;
    v42 = CFGetTypeID(v6);
    if (v42 != CFNumberGetTypeID())
      goto LABEL_58;
    CFNumberGetValue(v6, kCFNumberSInt32Type, (char *)this + 288);
    _IOHIDLogCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      if (*((_QWORD *)this + 3))
        IOHIDServiceGetRegistryID();
      sub_231117F04();
    }
    goto LABEL_57;
  }
  if (CFStringCompare(a2, CFSTR("UserKeyMapping"), 0) == kCFCompareEqualTo)
  {
    if (!v6)
      goto LABEL_58;
    v43 = CFGetTypeID(v6);
    v44 = (IOHIDKeyboardFilter *)CFArrayGetTypeID();
    if ((IOHIDKeyboardFilter *)v43 != v44)
      goto LABEL_58;
    if (!IOHIDKeyboardFilter::allowRemapping(v44, v6, a4))
      return;
    memset(buf, 170, sizeof(buf));
    IOHIDKeyboardFilter::createMapFromArrayOfPairs(v6, (uint64_t)buf);
    IOHIDKeyboardFilter::resetModifiedKeyState(this);
    sub_2311170E4(v66, (uint64_t)buf);
    IOHIDKeyboardFilter::resetModifiedKeyState((uint64_t)this, v66);
    sub_2311165A8((uint64_t)v66, (_QWORD *)v66[1]);
    if ((uint8_t *)((char *)this + 264) != buf)
      sub_2311173F0((uint64_t **)this + 33, *(_QWORD **)buf, &buf[8]);
    _IOHIDLogCategory();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
    {
      v46 = *((_QWORD *)this + 3);
      if (v46)
        v46 = IOHIDServiceGetRegistryID();
      sub_231117F38(v46, (uint64_t)v69);
    }

    goto LABEL_151;
  }
  if (CFStringCompare(a2, CFSTR("HIDSlowKeysDelay"), 0))
  {
    if (CFStringCompare(a2, CFSTR("CapsLockDelay"), 0))
    {
      if (CFStringCompare(a2, CFSTR("CapsLockDelayOverride"), 0) == kCFCompareEqualTo)
      {
        if (v6)
        {
          v52 = CFGetTypeID(v6);
          if (v52 == CFNumberGetTypeID())
          {
            CFNumberGetValue(v6, kCFNumberSInt32Type, (char *)this + 404);
            _IOHIDLogCategory();
            v53 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
            {
              if (*((_QWORD *)this + 3))
                IOHIDServiceGetRegistryID();
              sub_231117FD4();
            }

            if (*((_DWORD *)this + 100) == *((_DWORD *)this + 101))
              *((_DWORD *)this + 101) = -1;
          }
        }
        goto LABEL_58;
      }
      v25 = CFEqual(a2, CFSTR("LockKeyDelay"));
      v26 = v6 == 0;
      if (!v25)
        v26 = 1;
      if (!v26)
      {
        CFNumberGetValue(v6, kCFNumberSInt32Type, (char *)this + 424);
        _IOHIDLogCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          if (*((_QWORD *)this + 3))
            IOHIDServiceGetRegistryID();
          sub_231118008();
        }

        if (!*((_DWORD *)this + 106))
        {
          v28 = (const void *)*((_QWORD *)this + 52);
          if (v28)
          {
            CFRelease(v28);
            *((_QWORD *)this + 52) = 0;
          }
        }
        goto LABEL_58;
      }
      if (CFEqual(a2, CFSTR("UnifiedKeyMapping")))
        v54 = v6 != 0;
      else
        v54 = 0;
      if (v54)
        goto LABEL_58;
      v55 = CFEqual(a2, CFSTR("CtrlKeyboardUsageMap"));
      v56 = v6 == 0;
      if (!v55)
        v56 = 1;
      if (v56)
        goto LABEL_58;
      v57 = CFGetTypeID(v6);
      v58 = (IOHIDKeyboardFilter *)CFStringGetTypeID();
      if ((IOHIDKeyboardFilter *)v57 != v58)
        goto LABEL_58;
      if (!IOHIDKeyboardFilter::allowRemapping(v58, v6, a4))
        return;
      memset(buf, 170, sizeof(buf));
      IOHIDKeyboardFilter::createMapFromStringMap((CFStringRef)v6, (uint64_t)buf);
      IOHIDKeyboardFilter::resetModifiedKeyState(this);
      sub_2311170E4(v65, (uint64_t)buf);
      IOHIDKeyboardFilter::resetModifiedKeyState((uint64_t)this, v65);
      sub_2311165A8((uint64_t)v65, (_QWORD *)v65[1]);
      v69[0] = 1;
      valuePtr[0] = v69;
      v59 = sub_231116634((uint64_t **)this + 24, v69, (uint64_t)&std::piecewise_construct, valuePtr);
      sub_231116BF8((uint64_t)(v59 + 5), buf);
      _IOHIDLogCategory();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
      {
        v61 = *((_QWORD *)this + 3);
        if (v61)
          v61 = IOHIDServiceGetRegistryID();
        sub_23111803C(v61, (uint64_t)v69);
      }

LABEL_151:
      sub_2311165A8((uint64_t)buf, *(_QWORD **)&buf[8]);
      goto LABEL_58;
    }
    if (!v6)
      goto LABEL_58;
    v50 = CFGetTypeID(v6);
    if (v50 != CFNumberGetTypeID())
      goto LABEL_58;
    CFNumberGetValue(v6, kCFNumberSInt32Type, (char *)this + 400);
    _IOHIDLogCategory();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    {
      if (*((_QWORD *)this + 3))
        IOHIDServiceGetRegistryID();
      sub_231117FA0();
    }

    if (*((_DWORD *)this + 100))
      goto LABEL_58;
    v49 = (const void *)*((_QWORD *)this + 49);
    if (!v49)
      goto LABEL_58;
    goto LABEL_169;
  }
  if (v6)
  {
    v47 = CFGetTypeID(v6);
    if (v47 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v6, kCFNumberSInt32Type, (char *)this + 304);
      _IOHIDLogCategory();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      {
        if (*((_QWORD *)this + 3))
          IOHIDServiceGetRegistryID();
        sub_231117F6C();
      }

      if (!*((_DWORD *)this + 76))
      {
        v62 = (const void *)*((_QWORD *)this + 37);
        if (v62)
        {
          CFRelease(v62);
          *((_QWORD *)this + 37) = 0;
        }
        goto LABEL_58;
      }
      v49 = (const void *)*((_QWORD *)this + 49);
      if (v49)
      {
LABEL_169:
        CFRelease(v49);
        *((_QWORD *)this + 49) = 0;
      }
    }
  }
LABEL_58:
  if (v10 != *v12)
  {
    *v12 = v10;
    if (v10)
      v9 = 0;
  }
  if (v9 != *((_DWORD *)this + 89))
  {
    *((_DWORD *)this + 89) = v9;
    _IOHIDLogCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v22 = *((_QWORD *)this + 3);
      if (v22)
        v22 = IOHIDServiceGetRegistryID();
      sub_231117D18(v22, (uint64_t)valuePtr, v9);
    }

    v23 = *((_QWORD *)this + 62);
    if (v23)
    {
      v63[0] = MEMORY[0x24BDAC760];
      v63[1] = 3221225472;
      v63[2] = sub_2311135F8;
      v63[3] = &unk_2500005D0;
      v63[4] = this;
      v64 = v9;
      dispatch_async(v23, v63);
    }
  }
}

void sub_231112EE8(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  sub_2311165A8(v2 - 144, *(_QWORD **)(v2 - 136));
  _Unwind_Resume(a1);
}

void IOHIDKeyboardFilter::setCapsLockState(IOHIDKeyboardFilter *this, int a2, const void *a3)
{
  void *v6;
  NSObject *v7;
  uint64_t RegistryID;
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (*((_DWORD *)this + 110) != a2)
  {
    *((_DWORD *)this + 110) = a2;
    +[AppleKeyboardStateManager sharedManager](AppleKeyboardStateManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCapsLockEnabled:locationID:", *((_DWORD *)this + 110) != 0, *((_QWORD *)this + 59));

    _IOHIDLogCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      RegistryID = *((_QWORD *)this + 3);
      if (RegistryID)
        RegistryID = IOHIDServiceGetRegistryID();
      v9 = 138412802;
      v10 = RegistryID;
      v11 = 1024;
      v12 = a2;
      v13 = 2112;
      v14 = a3;
      _os_log_impl(&dword_23110E000, v7, OS_LOG_TYPE_INFO, "[%@] Set capslock state: %d client: %@\n", (uint8_t *)&v9, 0x1Cu);
    }

  }
}

void sub_231113148(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void IOHIDKeyboardFilter::updateCapslockLED(IOHIDKeyboardFilter *this, const void *a2)
{
  int v4;
  int v5;
  int v6;
  NSObject *v7;
  uint64_t RegistryID;
  int v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const void *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if ((*((_BYTE *)this + 295) & 1) == 0)
    return;
  v4 = *((_DWORD *)this + 111);
  if (CFEqual(*((CFTypeRef *)this + 57), (CFTypeRef)*MEMORY[0x24BDD8AF0]))
    goto LABEL_17;
  *((_DWORD *)this + 111) = *((_DWORD *)this + 110);
  if (CFEqual(*((CFTypeRef *)this + 57), (CFTypeRef)*MEMORY[0x24BDD8B00]))
  {
    v5 = 1;
LABEL_8:
    *((_DWORD *)this + 111) = v5;
    goto LABEL_9;
  }
  if (CFEqual(*((CFTypeRef *)this + 57), (CFTypeRef)*MEMORY[0x24BDD8AF8]) || *((_DWORD *)this + 112))
  {
    v5 = 0;
    goto LABEL_8;
  }
LABEL_9:
  if (!*((_QWORD *)this + 3))
  {
LABEL_17:
    v6 = 0;
    goto LABEL_11;
  }
  IOHIDServiceSetElementValue();
  IOHIDServiceSetProperty();
  v6 = 1;
LABEL_11:
  _IOHIDLogCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    RegistryID = *((_QWORD *)this + 3);
    if (RegistryID)
      RegistryID = IOHIDServiceGetRegistryID();
    v9 = *((_DWORD *)this + 111);
    v10 = *((_QWORD *)this + 57);
    v11 = *((_DWORD *)this + 110);
    v12 = 138413826;
    v13 = RegistryID;
    v14 = 1024;
    v15 = v4 != 0;
    v16 = 1024;
    v17 = v9;
    v18 = 2112;
    v19 = v10;
    v20 = 1024;
    v21 = v11;
    v22 = 2112;
    v23 = a2;
    v24 = 1024;
    v25 = v6;
    _os_log_impl(&dword_23110E000, v7, OS_LOG_TYPE_INFO, "[%@] updateCapslockLED:%d->%d capsLockLED:%@ capsLockState:%d client:%@, didUpdateCapsLockLEDState:%d\n", (uint8_t *)&v12, 0x38u);
  }

}

void sub_231113340(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void IOHIDKeyboardFilter::resetModifiedKeyState(IOHIDKeyboardFilter *this)
{
  _QWORD *v2;
  const void *KeyboardEvent;
  _QWORD *v4;
  _QWORD *v5;
  BOOL v6;
  _QWORD v7[3];

  memset(v7, 170, sizeof(v7));
  sub_231117808((uint64_t)v7, (uint64_t)this + 64);
  v2 = (_QWORD *)v7[0];
  if ((_QWORD *)v7[0] != &v7[1])
  {
    do
    {
      if (*((_BYTE *)v2 + 40))
      {
        mach_absolute_time();
        KeyboardEvent = (const void *)IOHIDEventCreateKeyboardEvent();
        if (KeyboardEvent)
        {
          (*((void (**)(_QWORD, _QWORD, IOHIDKeyboardFilter *, const void *, _QWORD))this + 4))(*((_QWORD *)this + 5), *((_QWORD *)this + 6), this, KeyboardEvent, 0);
          CFRelease(KeyboardEvent);
        }
      }
      v4 = (_QWORD *)v2[1];
      if (v4)
      {
        do
        {
          v5 = v4;
          v4 = (_QWORD *)*v4;
        }
        while (v4);
      }
      else
      {
        do
        {
          v5 = (_QWORD *)v2[2];
          v6 = *v5 == (_QWORD)v2;
          v2 = v5;
        }
        while (!v6);
      }
      v2 = v5;
    }
    while (v5 != &v7[1]);
  }
  sub_2311165A8((uint64_t)v7, (_QWORD *)v7[1]);
}

void sub_231113454(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, _QWORD *a11)
{
  sub_2311165A8((uint64_t)&a10, a11);
  _Unwind_Resume(a1);
}

void IOHIDKeyboardFilter::resetModifiedKeyState(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v5;
  _QWORD *v6;
  unint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  BOOL v10;
  _QWORD *v11;
  uint64_t KeyboardEvent;
  const void *v13;
  _QWORD *v14;
  _QWORD *v15;
  BOOL v16;

  v2 = a2 + 1;
  v3 = (_QWORD *)*a2;
  if ((_QWORD *)*a2 != a2 + 1)
  {
    v5 = (_QWORD *)(a1 + 72);
    do
    {
      v6 = (_QWORD *)*v5;
      if (*v5)
      {
        v7 = v3[4];
        v8 = v5;
        do
        {
          v9 = v6[4];
          v10 = v9 >= v7;
          if (v9 >= v7)
            v11 = v6;
          else
            v11 = v6 + 1;
          if (v10)
            v8 = v6;
          v6 = (_QWORD *)*v11;
        }
        while (*v11);
        if (v8 != v5 && v7 >= v8[4])
        {
          mach_absolute_time();
          KeyboardEvent = IOHIDEventCreateKeyboardEvent();
          if (KeyboardEvent)
          {
            v13 = (const void *)KeyboardEvent;
            (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a1, KeyboardEvent, 0);
            CFRelease(v13);
          }
        }
      }
      v14 = (_QWORD *)v3[1];
      if (v14)
      {
        do
        {
          v15 = v14;
          v14 = (_QWORD *)*v14;
        }
        while (v14);
      }
      else
      {
        do
        {
          v15 = (_QWORD *)v3[2];
          v16 = *v15 == (_QWORD)v3;
          v3 = v15;
        }
        while (!v16);
      }
      v3 = v15;
    }
    while (v15 != v2);
  }
}

void IOHIDKeyboardFilter::resetSlowKey(IOHIDKeyboardFilter *this)
{
  const void *v2;

  v2 = (const void *)*((_QWORD *)this + 37);
  if (v2)
  {
    CFRelease(v2);
    *((_QWORD *)this + 37) = 0;
  }
}

void IOHIDKeyboardFilter::resetCapsLockDelay(IOHIDKeyboardFilter *this)
{
  const void *v2;

  v2 = (const void *)*((_QWORD *)this + 49);
  if (v2)
  {
    CFRelease(v2);
    *((_QWORD *)this + 49) = 0;
  }
}

void IOHIDKeyboardFilter::resetLockKeyDelay(IOHIDKeyboardFilter *this)
{
  const void *v2;

  v2 = (const void *)*((_QWORD *)this + 52);
  if (v2)
  {
    CFRelease(v2);
    *((_QWORD *)this + 52) = 0;
  }
}

void sub_2311135F8(uint64_t a1)
{
  IOHIDKeyboardFilter *v2;

  v2 = *(IOHIDKeyboardFilter **)(a1 + 32);
  if (*(_DWORD *)(a1 + 40))
    IOHIDKeyboardFilter::startStickyKey(v2);
  else
    IOHIDKeyboardFilter::dispatchStickyKeys(v2, 14);
}

void IOHIDKeyboardFilter::startStickyKey(IOHIDKeyboardFilter *this)
{
  _QWORD *v2;
  const void *KeyboardEvent;
  _QWORD *v4;
  _QWORD *v5;
  BOOL v6;
  _QWORD v7[3];

  memset(v7, 170, sizeof(v7));
  sub_231117808((uint64_t)v7, (uint64_t)this + 64);
  v2 = (_QWORD *)v7[0];
  if ((_QWORD *)v7[0] != &v7[1])
  {
    do
    {
      if (Key::isModifier((Key *)(v2 + 4)))
      {
        mach_absolute_time();
        KeyboardEvent = (const void *)IOHIDEventCreateKeyboardEvent();
        if (KeyboardEvent)
        {
          IOHIDEventSetIntegerValue();
          (*((void (**)(_QWORD, _QWORD, IOHIDKeyboardFilter *, const void *, _QWORD))this + 4))(*((_QWORD *)this + 5), *((_QWORD *)this + 6), this, KeyboardEvent, 0);
          CFRelease(KeyboardEvent);
        }
      }
      v4 = (_QWORD *)v2[1];
      if (v4)
      {
        do
        {
          v5 = v4;
          v4 = (_QWORD *)*v4;
        }
        while (v4);
      }
      else
      {
        do
        {
          v5 = (_QWORD *)v2[2];
          v6 = *v5 == (_QWORD)v2;
          v2 = v5;
        }
        while (!v6);
      }
      v2 = v5;
    }
    while (v5 != &v7[1]);
  }
  sub_2311165A8((uint64_t)v7, (_QWORD *)v7[1]);
}

void sub_231113728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, _QWORD *a11)
{
  sub_2311165A8((uint64_t)&a10, a11);
  _Unwind_Resume(a1);
}

uint64_t IOHIDKeyboardFilter::match(IOHIDKeyboardFilter *this, __IOHIDService *a2)
{
  int v3;
  NSObject *v4;
  uint64_t RegistryID;
  int v7;
  int v8;
  IOHIDKeyboardFilter *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = 300;
  if (!IOHIDServiceConformsTo())
  {
    if (IOHIDServiceConformsTo())
      v3 = 300;
    else
      v3 = 0;
  }
  *((_DWORD *)this + 5) = v3;
  _IOHIDLogCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    RegistryID = IOHIDServiceGetRegistryID();
    v7 = *((_DWORD *)this + 5);
    v8 = 134218498;
    v9 = this;
    v10 = 2112;
    v11 = RegistryID;
    v12 = 1024;
    v13 = v7;
    _os_log_debug_impl(&dword_23110E000, v4, OS_LOG_TYPE_DEBUG, "(%p) for ServiceID %@ with score %d\n", (uint8_t *)&v8, 0x1Cu);
  }

  return *((unsigned int *)this + 5);
}

void sub_231113854(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

const void *IOHIDKeyboardFilter::filter(uint64_t a1, const void *a2)
{
  const void *v2;
  __int16 EventFlags;
  uint64_t v5;
  uint64_t v6;
  const void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t RegistryID;
  _QWORD v12[4];

  v2 = a2;
  v12[3] = *MEMORY[0x24BDAC8D0];
  if (a2 && IOHIDEventGetType() == 3)
  {
    EventFlags = IOHIDEventGetEventFlags();
    v2 = (const void *)IOHIDKeyboardFilter::processKeyMappings(a1, (uint64_t)v2);
    IOHIDKeyboardFilter::processModifiedKeyState(a1, (uint64_t)v2);
    IOHIDKeyboardFilter::dispatchEventCopy(a1, (uint64_t)v2);
    if (!*(_DWORD *)(a1 + 304) || (v2 = IOHIDKeyboardFilter::processSlowKeys(a1, v2), !*(_DWORD *)(a1 + 304)))
    {
      if (!*(_DWORD *)(a1 + 400)
        || !*(_DWORD *)(a1 + 404)
        || (v2 = IOHIDKeyboardFilter::processCapsLockDelay(a1, v2), !*(_DWORD *)(a1 + 304)))
      {
        if (*(_DWORD *)(a1 + 424) && !IOHIDKeyboardFilter::isModifiersPressed((IOHIDKeyboardFilter *)a1))
          v2 = IOHIDKeyboardFilter::processLockKeyDelay(a1, v2);
      }
    }
    if (!*(_DWORD *)(a1 + 360))
      v2 = (const void *)IOHIDKeyboardFilter::processStickyKeys(a1, (uint64_t)v2);
    IOHIDKeyboardFilter::processCapsLockState(a1, (uint64_t)v2);
    v5 = *(_QWORD *)(a1 + 376);
    if (v5 && (EventFlags & 0x100) == 0)
    {
      if (*(_DWORD *)(a1 + 304))
      {
        v6 = a1;
        v7 = v2;
        v5 = 420;
        v8 = 420;
      }
      else
      {
        v8 = *(_QWORD *)(a1 + 384);
        v6 = a1;
        v7 = v2;
      }
      IOHIDKeyboardFilter::processKeyRepeats(v6, v7, v5, v8);
    }
    IOHIDKeyboardFilter::processKeyState(a1, (uint64_t)v2);
    if (!v2)
    {
      _IOHIDLogCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        RegistryID = *(_QWORD *)(a1 + 24);
        if (RegistryID)
          RegistryID = IOHIDServiceGetRegistryID();
        sub_2311180BC(RegistryID, (uint64_t)v12);
      }

      return 0;
    }
  }
  return v2;
}

void sub_231113A28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void IOHIDKeyboardFilter::dispatchEventCopy(uint64_t a1, uint64_t a2)
{
  int IntegerValue;
  uint64_t VendorDefinedEvent;
  const void *v5;

  if (a2)
  {
    IntegerValue = IOHIDEventGetIntegerValue();
    if (IOHIDEventGetIntegerValue() == 7 && IntegerValue == 57)
    {
      IOHIDEventGetIntegerValue();
      mach_absolute_time();
      VendorDefinedEvent = IOHIDEventCreateVendorDefinedEvent();
      if (VendorDefinedEvent)
      {
        v5 = (const void *)VendorDefinedEvent;
        (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a1, VendorDefinedEvent, 0);
        CFRelease(v5);
      }
    }
  }
}

uint64_t IOHIDKeyboardFilter::processKeyMappings(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned int IntegerValue;
  unsigned int v5;
  int EventFlags;
  const void *v7;
  const void *Copy;
  uint64_t v9;
  __CFArray *Children;

  v2 = a2;
  if (a2)
  {
    IntegerValue = IOHIDEventGetIntegerValue();
    v5 = IOHIDEventGetIntegerValue();
    EventFlags = IOHIDEventGetEventFlags();
    if (!*(_QWORD *)(a1 + 368)
      || IntegerValue != IOHIDEventGetIntegerValue()
      || v5 != IOHIDEventGetIntegerValue())
    {
      v7 = (const void *)_IOHIDEventCopyAttachment();
      Copy = v7;
      if (v7 == (const void *)*MEMORY[0x24BDBD270])
      {
LABEL_16:
        CFRelease(Copy);
        return v2;
      }
      if (v7)
        CFRelease(v7);
      if ((EventFlags & 0x6F0000) == 0 && !IOHIDEventGetIntegerValue() && !IOHIDKeyboardFilter::isDelayedEvent())
      {
        v9 = IOHIDKeyboardFilter::remapKey(a1, IntegerValue | ((unint64_t)v5 << 32));
        if (!v9)
          return 0;
        if (v9 != __PAIR64__(v5, IntegerValue))
        {
          Copy = (const void *)IOHIDEventCreateCopy();
          Children = (__CFArray *)IOHIDEventGetChildren();
          if (Children)
            CFArrayRemoveAllValues(Children);
          IOHIDEventAppendEvent();
          _IOHIDEventSetAttachment();
          IOHIDEventSetIntegerValue();
          IOHIDEventSetIntegerValue();
          goto LABEL_16;
        }
      }
    }
  }
  return v2;
}

void IOHIDKeyboardFilter::processModifiedKeyState(uint64_t a1, uint64_t a2)
{
  int IntegerValue;
  int v4;
  uint64_t v5;
  int v6;
  BOOL v7;
  _QWORD *v8;
  _QWORD *v9;
  unint64_t *v10;
  _QWORD *v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  BOOL v15;
  _QWORD *v16;
  const void *KeyboardEvent;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD v20[3];

  if (a2 && !IOHIDEventGetIntegerValue())
  {
    IntegerValue = IOHIDEventGetIntegerValue();
    v4 = IOHIDEventGetIntegerValue();
    v5 = 0;
    while (dword_2311187F0[v5] != v4 || dword_2311187F0[v5 + 1] != IntegerValue)
    {
      v5 += 2;
      if (v5 == 8)
        return;
    }
    if (v4 == 255 && IntegerValue == 3)
    {
      v6 = 1;
    }
    else
    {
      v7 = v4 == 65281 && IntegerValue == 3;
      v6 = v7;
    }
    memset(v20, 170, sizeof(v20));
    sub_231117808((uint64_t)v20, a1 + 64);
    v8 = (_QWORD *)v20[0];
    if ((_QWORD *)v20[0] != &v20[1])
    {
      v9 = (_QWORD *)(a1 + 96);
      do
      {
        v10 = v8 + 4;
        if (*((_BYTE *)v8 + 40) && !Key::modifierMask((Key *)(v8 + 4))
          || v6 && *((_DWORD *)v8 + 9) == 7 && (*(_DWORD *)v10 - 58) < 0xC)
        {
          v11 = (_QWORD *)*v9;
          if (!*v9)
            goto LABEL_35;
          v12 = *v10;
          v13 = (_QWORD *)(a1 + 96);
          do
          {
            v14 = v11[4];
            v15 = v14 >= v12;
            if (v14 >= v12)
              v16 = v11;
            else
              v16 = v11 + 1;
            if (v15)
              v13 = v11;
            v11 = (_QWORD *)*v16;
          }
          while (*v16);
          if (v13 == v9 || v12 < v13[4])
          {
LABEL_35:
            sub_231117974((uint64_t **)(a1 + 88), v8 + 4, (_OWORD *)v8 + 2);
            mach_absolute_time();
            KeyboardEvent = (const void *)IOHIDEventCreateKeyboardEvent();
            if (KeyboardEvent)
            {
              _IOHIDEventSetAttachment();
              (*(void (**)(_QWORD, _QWORD, uint64_t, const void *, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a1, KeyboardEvent, 0);
              CFRelease(KeyboardEvent);
            }
            sub_231117A2C(a1 + 88, v8 + 4);
          }
        }
        v18 = (_QWORD *)v8[1];
        if (v18)
        {
          do
          {
            v19 = v18;
            v18 = (_QWORD *)*v18;
          }
          while (v18);
        }
        else
        {
          do
          {
            v19 = (_QWORD *)v8[2];
            v7 = *v19 == (_QWORD)v8;
            v8 = v19;
          }
          while (!v7);
        }
        v8 = v19;
      }
      while (v19 != &v20[1]);
    }
    sub_2311165A8((uint64_t)v20, (_QWORD *)v20[1]);
  }
}

void sub_231113F48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, _QWORD *a11)
{
  sub_2311165A8((uint64_t)&a10, a11);
  _Unwind_Resume(a1);
}

const void *IOHIDKeyboardFilter::processSlowKeys(uint64_t a1, const void *a2)
{
  const void *v2;
  int IntegerValue;
  int v5;
  const void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  const void *v10;

  v2 = a2;
  if (a2 && IOHIDEventGetIntegerValue() != 3)
  {
    IntegerValue = IOHIDEventGetIntegerValue();
    v5 = IOHIDEventGetIntegerValue();
    if (IOHIDEventGetIntegerValue())
    {
      CFRetain(v2);
      v6 = *(const void **)(a1 + 296);
      if (v6)
        CFRelease(v6);
      *(_QWORD *)(a1 + 296) = v2;
      v7 = *(NSObject **)(a1 + 512);
      v8 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 304));
      dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
      return 0;
    }
    else if (*(_QWORD *)(a1 + 296)
           && IOHIDEventGetIntegerValue() == IntegerValue
           && IOHIDEventGetIntegerValue() == v5)
    {
      dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 512), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
      if ((IOHIDEventGetEventFlags() & 0x10000) == 0)
        v2 = 0;
      v10 = *(const void **)(a1 + 296);
      if (v10)
      {
        CFRelease(v10);
        *(_QWORD *)(a1 + 296) = 0;
      }
    }
  }
  return v2;
}

const void *IOHIDKeyboardFilter::processCapsLockDelay(uint64_t a1, const void *a2)
{
  const void *v2;
  int IntegerValue;
  int v5;
  int v6;
  int v7;
  int v8;
  const void *v9;
  NSObject *v10;
  dispatch_time_t v11;

  v2 = a2;
  if (a2)
  {
    IntegerValue = IOHIDEventGetIntegerValue();
    v5 = IOHIDEventGetIntegerValue();
    v6 = IOHIDEventGetIntegerValue();
    if (v5 == 7 && IntegerValue == 57)
    {
      v7 = v6;
      if (IOHIDKeyboardFilter::isDelayedEvent())
      {
        _IOHIDEventRemoveAttachment();
        return v2;
      }
      v8 = *(_DWORD *)(a1 + 404);
      if (v8 <= 0)
      {
        v8 = *(_DWORD *)(a1 + 400);
        if (!v7)
          goto LABEL_11;
      }
      else if (!v7)
      {
        goto LABEL_11;
      }
      if (!*(_DWORD *)(a1 + 440))
      {
        v10 = *(NSObject **)(a1 + 528);
        v11 = dispatch_time(0, 1000000 * v8);
        dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0);
        _IOHIDEventSetAttachment();
        *(_QWORD *)(a1 + 392) = v2;
        CFRetain(v2);
        return 0;
      }
LABEL_11:
      if (!*(_QWORD *)(a1 + 392))
        return v2;
      dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 528), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
      v9 = *(const void **)(a1 + 392);
      if (v9)
      {
        CFRelease(v9);
        v2 = 0;
        *(_QWORD *)(a1 + 392) = 0;
        return v2;
      }
      return 0;
    }
  }
  return v2;
}

BOOL IOHIDKeyboardFilter::isModifiersPressed(IOHIDKeyboardFilter *this)
{
  _QWORD *v1;
  char *v2;
  _BOOL8 result;
  _QWORD *v4;
  _QWORD *v5;
  BOOL v6;

  v1 = (_QWORD *)*((_QWORD *)this + 8);
  v2 = (char *)this + 72;
  if (v1 == (_QWORD *)((char *)this + 72))
    return 0;
  while (1)
  {
    result = Key::isModifier((Key *)(v1 + 4));
    if (result)
      break;
    v4 = (_QWORD *)v1[1];
    if (v4)
    {
      do
      {
        v5 = v4;
        v4 = (_QWORD *)*v4;
      }
      while (v4);
    }
    else
    {
      do
      {
        v5 = (_QWORD *)v1[2];
        v6 = *v5 == (_QWORD)v1;
        v1 = v5;
      }
      while (!v6);
    }
    v1 = v5;
    if (v5 == (_QWORD *)v2)
      return result;
  }
  return 1;
}

const void *IOHIDKeyboardFilter::processLockKeyDelay(uint64_t a1, const void *a2)
{
  const void *v2;
  int IntegerValue;
  int v5;
  int v6;
  int v7;
  NSObject *v8;
  dispatch_time_t v9;
  const void *v11;

  v2 = a2;
  if (a2)
  {
    if ((IntegerValue = IOHIDEventGetIntegerValue(),
          v5 = IOHIDEventGetIntegerValue(),
          v6 = IOHIDEventGetIntegerValue(),
          v5 == 12)
      && IntegerValue == 414
      || (v7 = IOHIDServiceConformsTo(), v5 == 12) && v7 && IntegerValue == 48)
    {
      if (IOHIDKeyboardFilter::isDelayedEvent())
      {
        _IOHIDEventRemoveAttachment();
      }
      else
      {
        if (v6)
        {
          v8 = *(NSObject **)(a1 + 432);
          v9 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 424));
          dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
          _IOHIDEventSetAttachment();
          *(_QWORD *)(a1 + 416) = v2;
          CFRetain(v2);
        }
        else
        {
          if (!*(_QWORD *)(a1 + 416))
            return v2;
          dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 432), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
          v11 = *(const void **)(a1 + 416);
          if (v11)
          {
            CFRelease(v11);
            v2 = 0;
            *(_QWORD *)(a1 + 416) = 0;
            return v2;
          }
        }
        return 0;
      }
    }
  }
  return v2;
}

uint64_t IOHIDKeyboardFilter::processStickyKeys(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v4;
  unsigned int IntegerValue;
  unsigned int v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  _QWORD v11[5];
  unsigned int v12;
  unint64_t v13;
  char v14;

  v2 = a2;
  v12 = 0;
  if (a2)
  {
    v4 = *(_DWORD *)(a1 + 356);
    if (IOHIDEventGetIntegerValue() != 3 && IOHIDEventGetIntegerValue() != 1 && IOHIDEventGetIntegerValue() != 2)
    {
      IntegerValue = IOHIDEventGetIntegerValue();
      v6 = IOHIDEventGetIntegerValue();
      v7 = IOHIDEventGetIntegerValue();
      if (v6 == 7 && (IntegerValue & 0xFFFFFFFB) == 0xE1)
      {
        if (!v7)
          IOHIDKeyboardFilter::processShiftKey((IOHIDKeyboardFilter *)a1);
      }
      else
      {
        *(_DWORD *)(a1 + 308) = 0;
      }
      if (*(_DWORD *)(a1 + 356))
      {
        if (IntegerValue != 57 || v6 != 7)
        {
          v13 = IntegerValue | ((unint64_t)v6 << 32);
          v14 = 0;
          if (Key::isModifier((Key *)&v13))
          {
            if (*(_DWORD *)(a1 + 356) == (v4 != 0))
            {
              if (v7)
                v8 = IOHIDKeyboardFilter::processStickyKeyDown((IOHIDKeyboardFilter *)a1, v6, IntegerValue, &v12);
              else
                v8 = IOHIDKeyboardFilter::processStickyKeyUp((IOHIDKeyboardFilter *)a1, v6, IntegerValue, &v12);
              if (!v8)
                return 0;
              IOHIDEventSetIntegerValue();
              IOHIDEventGetEventFlags();
              IOHIDEventSetEventFlags();
            }
            else
            {
              IOHIDEventGetEventFlags();
              IOHIDEventSetEventFlags();
            }
            goto LABEL_28;
          }
        }
        if (*(_DWORD *)(a1 + 308))
          dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 504), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
        if (!v7)
        {
          v9 = *(NSObject **)(a1 + 496);
          v11[0] = MEMORY[0x24BDAC760];
          v11[1] = 3221225472;
          v11[2] = sub_231115C18;
          v11[3] = &unk_250000588;
          v11[4] = a1;
          dispatch_async(v9, v11);
          *(_DWORD *)(a1 + 308) = 0;
        }
        IOHIDKeyboardFilter::updateStickyKeysState((IOHIDKeyboardFilter *)a1, 8, 16);
      }
      else if (v4)
      {
        IOHIDEventGetEventFlags();
        IOHIDEventSetEventFlags();
LABEL_28:
        IOHIDEventSetIntegerValue();
      }
    }
  }
  return v2;
}

uint64_t IOHIDKeyboardFilter::processCapsLockState(uint64_t result, uint64_t a2)
{
  IOHIDKeyboardFilter *v2;
  int IntegerValue;
  int v4;

  if (a2)
  {
    v2 = (IOHIDKeyboardFilter *)result;
    result = IOHIDEventGetIntegerValue();
    if (result != 1)
    {
      result = IOHIDEventGetIntegerValue();
      if (result != 2)
      {
        IntegerValue = IOHIDEventGetIntegerValue();
        v4 = IOHIDEventGetIntegerValue();
        result = IOHIDEventGetIntegerValue();
        if (v4 == 7 && IntegerValue == 57)
        {
          if ((_DWORD)result)
          {
            IOHIDKeyboardFilter::setCapsLockState(v2, *((_DWORD *)v2 + 110) == 0, CFSTR("Keyboard"));
            return IOHIDServiceSetProperty();
          }
        }
      }
    }
  }
  return result;
}

const void *IOHIDKeyboardFilter::processKeyRepeats(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4)
{
  unsigned int IntegerValue;
  int v9;
  int v10;
  BOOL v13;
  const void *v14;
  NSObject *v15;
  uint64_t v16;
  dispatch_time_t v17;
  unint64_t v18;
  char v19;

  if (!a2)
    return a2;
  if (IOHIDEventGetIntegerValue() == 1)
    return a2;
  if (IOHIDEventGetIntegerValue() == 2)
    return a2;
  IntegerValue = IOHIDEventGetIntegerValue();
  v9 = IOHIDEventGetIntegerValue();
  v10 = IOHIDEventGetIntegerValue();
  v18 = IntegerValue | ((unint64_t)v9 << 32);
  v19 = 0;
  if (Key::isModifier((Key *)&v18))
    return a2;
  if (v9 > 11)
  {
    if (v9 == 12)
    {
      if (IntegerValue - 48 <= 0x10 && ((1 << (IntegerValue - 48)) & 0x10005) != 0
        || IntegerValue - 176 <= 0x1D && ((1 << (IntegerValue + 80)) & 0x20000101) != 0)
      {
        return a2;
      }
      goto LABEL_29;
    }
    if (v9 != 255)
      goto LABEL_21;
    if ((IntegerValue & 0xFFFFFFFE) == 6)
      return a2;
  }
  else
  {
    if (v9 != 7)
    {
      if (v9 == 11)
        return a2;
LABEL_21:
      v13 = IntegerValue == 34 && v9 == 65281;
      if (v9 == 65289 || v13)
        return a2;
      goto LABEL_29;
    }
    if (IntegerValue - 83 <= 0x2C && ((1 << (IntegerValue - 83)) & 0x100000080001) != 0)
      return a2;
  }
LABEL_29:
  v14 = *(const void **)(a1 + 368);
  if (v10)
  {
    if (v14)
      CFRelease(v14);
    CFGetAllocator(a2);
    mach_absolute_time();
    *(_QWORD *)(a1 + 368) = IOHIDEventCreateKeyboardEvent();
    v15 = *(NSObject **)(a1 + 520);
    if ((IOHIDEventGetEventFlags() & 0x10000) != 0)
      v16 = a4;
    else
      v16 = a3;
    v17 = dispatch_time(0, 1000000 * v16);
    dispatch_source_set_timer(v15, v17, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  else if (v14
         && IntegerValue == IOHIDEventGetIntegerValue()
         && v9 == IOHIDEventGetIntegerValue())
  {
    dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 520), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    CFRelease(*(CFTypeRef *)(a1 + 368));
    *(_QWORD *)(a1 + 368) = 0;
  }
  return a2;
}

void IOHIDKeyboardFilter::processKeyState(uint64_t a1, uint64_t a2)
{
  unsigned int IntegerValue;
  unsigned int v4;
  int v5;
  int EventFlags;
  const void *v7;
  BOOL v8;
  unint64_t v9;
  uint64_t **v10;
  _QWORD *v11;
  uint64_t *v12;
  _QWORD *v13;
  uint64_t *v14;
  unint64_t v15;
  BOOL v16;
  _QWORD *v17;
  unint64_t v18;
  BOOL v19;
  _DWORD v20[3];

  if (a2 && IOHIDEventGetIntegerValue() != 1 && IOHIDEventGetIntegerValue() != 2)
  {
    IntegerValue = IOHIDEventGetIntegerValue();
    v4 = IOHIDEventGetIntegerValue();
    v5 = IOHIDEventGetIntegerValue();
    EventFlags = IOHIDEventGetEventFlags();
    v7 = (const void *)_IOHIDEventCopyAttachment();
    v8 = v7 == (const void *)*MEMORY[0x24BDBD270];
    if (v7)
      CFRelease(v7);
    v9 = IntegerValue | ((unint64_t)v4 << 32);
    v10 = (uint64_t **)(a1 + 64);
    if (v5)
    {
      v18 = v9;
      v19 = v8;
      v20[0] = -1431655766;
      *(_DWORD *)((char *)v20 + 3) = -1431655766;
      *(_DWORD *)((char *)&v20[1] + 3) = EventFlags;
      sub_231117AA4(v10, &v18, (uint64_t)&v18);
    }
    else
    {
      v13 = *(_QWORD **)(a1 + 72);
      v12 = (uint64_t *)(a1 + 72);
      v11 = v13;
      if (v13)
      {
        v14 = v12;
        do
        {
          v15 = v11[4];
          v16 = v15 >= v9;
          if (v15 >= v9)
            v17 = v11;
          else
            v17 = v11 + 1;
          if (v16)
            v14 = v11;
          v11 = (_QWORD *)*v17;
        }
        while (*v17);
        if (v14 != v12 && v9 >= v14[4])
        {
          sub_231116C60(v10, v14);
          operator delete(v14);
        }
      }
    }
  }
}

_QWORD *sub_231114B54(_QWORD *a1, const std::string *a2, int a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  std::ios_base *v11;

  v6 = MEMORY[0x24BEDB868];
  v7 = MEMORY[0x24BEDB868] + 64;
  a1[15] = MEMORY[0x24BEDB868] + 64;
  v8 = (uint64_t)(a1 + 2);
  v9 = *(_QWORD *)(MEMORY[0x24BEDB7F8] + 8);
  v10 = *(_QWORD *)(MEMORY[0x24BEDB7F8] + 16);
  *a1 = v9;
  *(_QWORD *)((char *)a1 + *(_QWORD *)(v9 - 24)) = v10;
  a1[1] = 0;
  v11 = (std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24));
  std::ios_base::init(v11, a1 + 2);
  v11[1].__vftable = 0;
  v11[1].__fmtflags_ = -1;
  *a1 = v6 + 24;
  a1[15] = v7;
  sub_231117668(v8, a2, a3 | 8);
  return a1;
}

void sub_231114C10(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::istream::~istream();
  MEMORY[0x2348D2500](v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_231114C38(_QWORD *a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v6;
  _QWORD *v7;
  _BYTE *v8;
  int v9;
  char v11;

  v11 = -86;
  MEMORY[0x2348D24AC](&v11, a1, 1);
  if (!v11)
    return a1;
  if (*(char *)(a2 + 23) < 0)
  {
    **(_BYTE **)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
  }
  else
  {
    *(_BYTE *)a2 = 0;
    *(_BYTE *)(a2 + 23) = 0;
  }
  v6 = 0;
  while (1)
  {
    v7 = *(_QWORD **)((char *)a1 + *(_QWORD *)(*a1 - 24) + 40);
    v8 = (_BYTE *)v7[3];
    if (v8 != (_BYTE *)v7[4])
    {
      v7[3] = v8 + 1;
      LOBYTE(v7) = *v8;
      goto LABEL_9;
    }
    LODWORD(v7) = (*(uint64_t (**)(_QWORD *))(*v7 + 80))(v7);
    if ((_DWORD)v7 == -1)
      break;
LABEL_9:
    if (v7 == a3)
    {
      v9 = 0;
      goto LABEL_17;
    }
    std::string::push_back((std::string *)a2, (std::string::value_type)v7);
    --v6;
    if (*(char *)(a2 + 23) < 0 && *(_QWORD *)(a2 + 8) == 0x7FFFFFFFFFFFFFF7)
    {
      v9 = 4;
      goto LABEL_17;
    }
  }
  if (v6)
    v9 = 2;
  else
    v9 = 6;
LABEL_17:
  std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | v9);
  return a1;
}

void sub_231114D6C(void *a1)
{
  _QWORD *v1;
  uint64_t v2;

  __cxa_begin_catch(a1);
  v2 = *v1;
  *(_DWORD *)((char *)v1 + *(_QWORD *)(*v1 - 24) + 32) |= 1u;
  if ((*((_BYTE *)v1 + *(_QWORD *)(v2 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x231114D38);
  }
  __cxa_rethrow();
}

void sub_231114DB0(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t sub_231114DC4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x24BEDB7F8];
  v3 = *MEMORY[0x24BEDB7F8];
  *(_QWORD *)a1 = *MEMORY[0x24BEDB7F8];
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(a1 + 16) = MEMORY[0x24BEDB848] + 16;
  if (*(char *)(a1 + 103) < 0)
    operator delete(*(void **)(a1 + 80));
  std::streambuf::~streambuf();
  std::istream::~istream();
  MEMORY[0x2348D2500](a1 + 120);
  return a1;
}

BOOL IOHIDKeyboardFilter::isKeyPressed(uint64_t a1, unint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  unint64_t v6;
  BOOL v7;
  _QWORD *v8;

  v4 = *(_QWORD **)(a1 + 72);
  v2 = (_QWORD *)(a1 + 72);
  v3 = v4;
  if (!v4)
    goto LABEL_12;
  v5 = v2;
  do
  {
    v6 = v3[4];
    v7 = v6 >= a2;
    if (v6 >= a2)
      v8 = v3;
    else
      v8 = v3 + 1;
    if (v7)
      v5 = v3;
    v3 = (_QWORD *)*v8;
  }
  while (*v8);
  if (v5 == v2 || a2 < v5[4])
LABEL_12:
    v5 = v2;
  return v5 != v2;
}

BOOL IOHIDKeyboardFilter::isDelayedEvent()
{
  const void *v0;
  _BOOL8 v1;

  v0 = (const void *)_IOHIDEventCopyAttachment();
  if (!v0)
    return 0;
  v1 = v0 == (const void *)*MEMORY[0x24BDBD270];
  CFRelease(v0);
  return v1;
}

uint64_t IOHIDKeyboardFilter::remapKey(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t result;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  unint64_t v10;
  BOOL v11;
  _QWORD *v12;
  unint64_t v13;
  BOOL v14;
  _QWORD *v15;
  int ActiveModifiers;
  _QWORD *v17;
  _QWORD *v18;
  unint64_t v19;
  BOOL v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  unint64_t v28;
  BOOL v29;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD *v32;
  BOOL v33;
  _QWORD *v34;
  _QWORD *v35;
  unint64_t v36;
  BOOL v37;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD *v40;
  unint64_t v41;
  BOOL v42;
  _QWORD *v43;
  _QWORD *v44;
  _QWORD *v45;
  unint64_t v46;
  BOOL v47;
  _QWORD *v48;

  v2 = a2;
  result = 0x70000003ELL;
  if (a2 != 0x70000003ELL)
    goto LABEL_22;
  v5 = (_QWORD *)(a1 + 72);
  v6 = *(_QWORD **)(a1 + 72);
  if (!v6)
    goto LABEL_22;
  v7 = (_QWORD *)(a1 + 72);
  v8 = (_QWORD *)(a1 + 72);
  v9 = *(_QWORD **)(a1 + 72);
  do
  {
    v10 = v9[4];
    v11 = v10 >= 0x7000000E3;
    if (v10 >= 0x7000000E3)
      v12 = v9;
    else
      v12 = v9 + 1;
    if (v11)
      v8 = v9;
    v9 = (_QWORD *)*v12;
  }
  while (*v12);
  if (v8 == v5 || v8[4] >= 0x7000000E4uLL)
  {
    do
    {
      v13 = v6[4];
      v14 = v13 >= 0x7000000E7;
      if (v13 >= 0x7000000E7)
        v15 = v6;
      else
        v15 = v6 + 1;
      if (v14)
        v7 = v6;
      v6 = (_QWORD *)*v15;
    }
    while (*v15);
    if (v7 == v5 || v7[4] >= 0x7000000E8uLL)
    {
LABEL_22:
      ActiveModifiers = IOHIDKeyboardFilter::getActiveModifiers((IOHIDKeyboardFilter *)a1);
      if ((*(_DWORD *)(a1 + 288) == 0) != (unsigned __int16)(ActiveModifiers & 0x200) >> 9)
      {
        v17 = *(_QWORD **)(a1 + 144);
        if (v17)
        {
          v18 = (_QWORD *)(a1 + 144);
          do
          {
            v19 = v17[4];
            v20 = v19 >= v2;
            if (v19 >= v2)
              v21 = v17;
            else
              v21 = v17 + 1;
            if (v20)
              v18 = v17;
            v17 = (_QWORD *)*v21;
          }
          while (*v21);
          if (v18 != (_QWORD *)(a1 + 144) && v2 >= v18[4])
            v2 = v18[6];
        }
      }
      v22 = *(_QWORD **)(a1 + 160);
      v25 = (_QWORD *)*v22;
      v23 = v22 + 1;
      v24 = v25;
      if (v25 != v23)
      {
        while (1)
        {
          if (((_DWORD)v24[4] & ActiveModifiers) != 0)
          {
            v26 = (_QWORD *)v24[6];
            if (v26)
            {
              v27 = v24 + 6;
              do
              {
                v28 = v26[4];
                v29 = v28 >= v2;
                if (v28 >= v2)
                  v30 = v26;
                else
                  v30 = v26 + 1;
                if (v29)
                  v27 = v26;
                v26 = (_QWORD *)*v30;
              }
              while (*v30);
              if (v27 != v24 + 6 && v2 >= v27[4])
                break;
            }
          }
          v31 = (_QWORD *)v24[1];
          if (v31)
          {
            do
            {
              v32 = v31;
              v31 = (_QWORD *)*v31;
            }
            while (v31);
          }
          else
          {
            do
            {
              v32 = (_QWORD *)v24[2];
              v33 = *v32 == (_QWORD)v24;
              v24 = v32;
            }
            while (!v33);
          }
          v24 = v32;
          if (v32 == v23)
            goto LABEL_54;
        }
        v2 = v27[6];
      }
LABEL_54:
      if (*(_DWORD *)(a1 + 408))
      {
        v34 = *(_QWORD **)(a1 + 248);
        if (v34)
        {
          v35 = (_QWORD *)(a1 + 248);
          do
          {
            v36 = v34[4];
            v37 = v36 >= v2;
            if (v36 >= v2)
              v38 = v34;
            else
              v38 = v34 + 1;
            if (v37)
              v35 = v34;
            v34 = (_QWORD *)*v38;
          }
          while (*v38);
          if (v35 != (_QWORD *)(a1 + 248) && v2 >= v35[4])
            v2 = v35[6];
        }
      }
      v39 = *(_QWORD **)(a1 + 120);
      if (v39)
      {
        v40 = (_QWORD *)(a1 + 120);
        do
        {
          v41 = v39[4];
          v42 = v41 >= v2;
          if (v41 >= v2)
            v43 = v39;
          else
            v43 = v39 + 1;
          if (v42)
            v40 = v39;
          v39 = (_QWORD *)*v43;
        }
        while (*v43);
        if (v40 != (_QWORD *)(a1 + 120) && v2 >= v40[4])
          v2 = v40[6];
      }
      v44 = *(_QWORD **)(a1 + 272);
      if (!v44)
        return v2;
      v45 = (_QWORD *)(a1 + 272);
      do
      {
        v46 = v44[4];
        v47 = v46 >= v2;
        if (v46 >= v2)
          v48 = v44;
        else
          v48 = v44 + 1;
        if (v47)
          v45 = v44;
        v44 = (_QWORD *)*v48;
      }
      while (*v48);
      if (v45 != (_QWORD *)(a1 + 272) && v2 >= v45[4])
        return v45[6];
      else
        return v2;
    }
  }
  return result;
}

uint64_t IOHIDKeyboardFilter::getActiveModifiers(IOHIDKeyboardFilter *this)
{
  char *v1;
  char *v2;
  uint64_t v3;
  int v4;
  char *v5;
  char *v6;
  BOOL v7;

  v1 = (char *)*((_QWORD *)this + 8);
  v2 = (char *)this + 72;
  if (v1 == (char *)this + 72)
    return 0;
  LODWORD(v3) = 0;
  do
  {
    v4 = Key::modifierMask((Key *)(v1 + 32));
    v5 = (char *)*((_QWORD *)v1 + 1);
    if (v5)
    {
      do
      {
        v6 = v5;
        v5 = *(char **)v5;
      }
      while (v5);
    }
    else
    {
      do
      {
        v6 = (char *)*((_QWORD *)v1 + 2);
        v7 = *(_QWORD *)v6 == (_QWORD)v1;
        v1 = v6;
      }
      while (!v7);
    }
    v3 = v4 | v3;
    v1 = v6;
  }
  while (v6 != v2);
  return v3;
}

BOOL IOHIDKeyboardFilter::isNumLockMode(IOHIDKeyboardFilter *this)
{
  return *((_DWORD *)this + 102) != 0;
}

uint64_t IOHIDKeyboardFilter::getStickyKeyState(IOHIDKeyboardFilter *this, int a2, unsigned int a3)
{
  uint64_t v3;
  char v4;

  if (a3 == 57)
  {
    v3 = 0;
  }
  else if (a2 == 255 && a3 == 3)
  {
    v3 = 9;
  }
  else
  {
    v4 = a3 - 4;
    if (a3 <= 0xE3)
      v4 = a3;
    v3 = (v4 + 33);
  }
  return *((unsigned int *)this + v3 + 78);
}

void IOHIDKeyboardFilter::setStickyKeyState(IOHIDKeyboardFilter *this, int a2, unsigned int a3, int a4)
{
  uint64_t v6;
  char v7;
  NSObject *v8;
  uint64_t RegistryID;
  int v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (a3 == 57)
  {
    v6 = 0;
  }
  else if (a2 == 255 && a3 == 3)
  {
    v6 = 9;
  }
  else
  {
    v7 = a3 - 4;
    if (a3 <= 0xE3)
      v7 = a3;
    v6 = (v7 + 33);
  }
  _IOHIDLogCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    RegistryID = *((_QWORD *)this + 3);
    if (RegistryID)
      RegistryID = IOHIDServiceGetRegistryID();
    v10 = *((_DWORD *)this + v6 + 78);
    v11 = 138412802;
    v12 = RegistryID;
    v13 = 1024;
    v14 = v10;
    v15 = 1024;
    v16 = a4;
    _os_log_debug_impl(&dword_23110E000, v8, OS_LOG_TYPE_DEBUG, "[%@] StickyKey state %x -> %x\n", (uint8_t *)&v11, 0x18u);
  }

  *((_DWORD *)this + v6 + 78) = a4;
}

void sub_2311153C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t IOHIDKeyboardFilter::processStickyKeyDown(IOHIDKeyboardFilter *this, int a2, unsigned int a3, unsigned int *a4)
{
  uint64_t v7;
  char v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v14;
  uint64_t RegistryID;
  int v16;
  uint64_t v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (a3 == 57)
  {
    v7 = 0;
  }
  else if (a2 == 255 && a3 == 3)
  {
    v7 = 9;
  }
  else
  {
    v8 = a3 - 4;
    if (a3 <= 0xE3)
      v8 = a3;
    v7 = (v8 + 33);
  }
  v9 = *((_DWORD *)this + v7 + 78);
  switch(v9)
  {
    case 4:
      v10 = 0;
      v9 = 1;
      break;
    case 2:
      *a4 = 0x40000;
      v10 = 2;
      v9 = 4;
      break;
    case 1:
      *a4 = 0x20000;
      v10 = 1;
      v9 = 8;
      break;
    default:
      _IOHIDLogCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        RegistryID = *((_QWORD *)this + 3);
        if (RegistryID)
          RegistryID = IOHIDServiceGetRegistryID();
        v16 = 138412802;
        v17 = RegistryID;
        v18 = 1024;
        v19 = a2;
        v20 = 1024;
        v21 = a3;
        _os_log_error_impl(&dword_23110E000, v11, OS_LOG_TYPE_ERROR, "[%@] StickyKey DOWN in bad state for 0x%x:0x%x\n", (uint8_t *)&v16, 0x18u);
      }

      v10 = 0;
      break;
  }
  IOHIDKeyboardFilter::setStickyKeyState(this, a2, a3, v9);
  _IOHIDLogCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v14 = *((_QWORD *)this + 3);
    if (v14)
      v14 = IOHIDServiceGetRegistryID();
    v16 = 138413058;
    v17 = v14;
    v18 = 1024;
    v19 = a3;
    v20 = 1024;
    v21 = a2;
    v22 = 1024;
    v23 = v10;
    _os_log_debug_impl(&dword_23110E000, v12, OS_LOG_TYPE_DEBUG, "[%@] StickyKey DOWN 0x%x:0x%x phase 0x%x\n", (uint8_t *)&v16, 0x1Eu);
  }

  return v10;
}

void sub_2311155E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t IOHIDKeyboardFilter::processStickyKeyUp(IOHIDKeyboardFilter *this, int a2, unsigned int a3, unsigned int *a4)
{
  uint64_t v7;
  char v8;
  uint64_t v9;
  int v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v15;
  uint64_t RegistryID;
  int v17;
  uint64_t v18;
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  unsigned int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (a3 == 57)
  {
    v7 = 0;
  }
  else if (a2 == 255 && a3 == 3)
  {
    v7 = 9;
  }
  else
  {
    v8 = a3 - 4;
    if (a3 <= 0xE3)
      v8 = a3;
    v7 = (v8 + 33);
  }
  v9 = 0;
  v10 = *((_DWORD *)this + v7 + 78);
  if (v10 <= 7)
  {
    if (v10 == 1)
    {
      *a4 = 0x80000;
      v9 = 3;
      goto LABEL_21;
    }
    if (v10 == 4)
      goto LABEL_21;
    goto LABEL_19;
  }
  if (v10 == 8)
  {
    v11 = 2;
    goto LABEL_18;
  }
  if (v10 == 16)
  {
    *a4 = 0x80000;
    v9 = 3;
    v11 = 1;
LABEL_18:
    IOHIDKeyboardFilter::setStickyKeyState(this, a2, a3, v11);
    goto LABEL_21;
  }
LABEL_19:
  _IOHIDLogCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    RegistryID = *((_QWORD *)this + 3);
    if (RegistryID)
      RegistryID = IOHIDServiceGetRegistryID();
    v17 = 138412802;
    v18 = RegistryID;
    v19 = 1024;
    v20 = a2;
    v21 = 1024;
    v22 = a3;
    _os_log_error_impl(&dword_23110E000, v12, OS_LOG_TYPE_ERROR, "[%@] StickyKey UP in bad state for 0x%x:0x%x\n", (uint8_t *)&v17, 0x18u);
  }

  v9 = 0;
LABEL_21:
  _IOHIDLogCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v15 = *((_QWORD *)this + 3);
    if (v15)
      v15 = IOHIDServiceGetRegistryID();
    v17 = 138413058;
    v18 = v15;
    v19 = 1024;
    v20 = a3;
    v21 = 1024;
    v22 = a2;
    v23 = 1024;
    v24 = v9;
    _os_log_debug_impl(&dword_23110E000, v13, OS_LOG_TYPE_DEBUG, "[%@] StickyKey UP 0x%x:0x%x phase 0x%x\n", (uint8_t *)&v17, 0x1Eu);
  }

  return v9;
}

void sub_231115824(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void IOHIDKeyboardFilter::resetStickyKeys(IOHIDKeyboardFilter *this)
{
  NSObject *v1;
  _QWORD block[5];

  v1 = *((_QWORD *)this + 62);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2311158A0;
  block[3] = &unk_250000588;
  block[4] = this;
  dispatch_async(v1, block);
}

void sub_2311158A0(uint64_t a1)
{
  IOHIDKeyboardFilter *v1;

  v1 = *(IOHIDKeyboardFilter **)(a1 + 32);
  IOHIDKeyboardFilter::updateStickyKeysState(v1, 8, 16);
  IOHIDKeyboardFilter::dispatchStickyKeys(v1, 2);
  *((_DWORD *)v1 + 77) = 0;
}

void IOHIDKeyboardFilter::updateStickyKeysState(IOHIDKeyboardFilter *this, int a2, int a3)
{
  unsigned int i;
  int v7;
  char v8;
  uint64_t v9;
  int v10;
  unsigned int v11;
  int v12;
  uint64_t v13;

  for (i = 0; i != 10; ++i)
  {
    v7 = i + 223;
    v8 = i - 37;
    if (i <= 4)
      v8 = i - 33;
    v9 = (v8 + 33);
    if (i <= 8)
    {
      v10 = 7;
    }
    else
    {
      v7 = 3;
      v10 = 255;
    }
    if (i > 8)
      v9 = 9;
    if (i)
      v11 = v7;
    else
      v11 = 57;
    if (i)
      v12 = v10;
    else
      v12 = 7;
    if (i)
      v13 = v9;
    else
      v13 = 0;
    if (*((_DWORD *)this + v13 + 78) == a2)
      IOHIDKeyboardFilter::setStickyKeyState(this, v12, v11, a3);
  }
}

void IOHIDKeyboardFilter::dispatchStickyKeys(IOHIDKeyboardFilter *this, int a2)
{
  unsigned int i;
  int v5;
  char v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  uint64_t KeyboardEvent;
  const void *v13;

  for (i = 0; i != 10; ++i)
  {
    v5 = i + 223;
    v6 = i - 37;
    if (i <= 4)
      v6 = i - 33;
    v7 = (v6 + 33);
    if (i <= 8)
    {
      v8 = 7;
    }
    else
    {
      v5 = 3;
      v8 = 255;
    }
    if (i > 8)
      v7 = 9;
    if (i)
      v9 = v5;
    else
      v9 = 57;
    if (i)
      v10 = v8;
    else
      v10 = 7;
    if (i)
      v11 = v7;
    else
      v11 = 0;
    if ((*((_DWORD *)this + v11 + 78) & a2) != 0)
    {
      mach_absolute_time();
      KeyboardEvent = IOHIDEventCreateKeyboardEvent();
      if (KeyboardEvent)
      {
        v13 = (const void *)KeyboardEvent;
        IOHIDEventSetIntegerValue();
        (*((void (**)(_QWORD, _QWORD, IOHIDKeyboardFilter *, const void *, _QWORD))this + 4))(*((_QWORD *)this + 5), *((_QWORD *)this + 6), this, v13, 0);
        CFRelease(v13);
        IOHIDKeyboardFilter::setStickyKeyState(this, v10, v9, 1);
      }
    }
  }
}

void IOHIDKeyboardFilter::processShiftKey(IOHIDKeyboardFilter *this)
{
  int v2;
  unsigned int v3;
  NSObject *v4;
  dispatch_time_t v5;
  NSObject *v6;
  uint64_t RegistryID;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  if (*((_DWORD *)this + 88))
  {
    v2 = *((_DWORD *)this + 77);
    v3 = v2 + 1;
    *((_DWORD *)this + 77) = v2 + 1;
    if (!v2)
    {
      v4 = *((_QWORD *)this + 63);
      v5 = dispatch_time(0, 30000000000);
      dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0);
      v3 = *((_DWORD *)this + 77);
    }
    if (v3 >= 5)
    {
      *((_DWORD *)this + 77) = 0;
      *((_DWORD *)this + 89) = *((_DWORD *)this + 89) == 0;
      _IOHIDLogCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        RegistryID = *((_QWORD *)this + 3);
        if (RegistryID)
          RegistryID = IOHIDServiceGetRegistryID();
        sub_2311180F0(RegistryID, (_DWORD *)this + 89, (uint64_t)v8, v6);
      }

      IOHIDServiceSetProperty();
      if (*((_DWORD *)this + 89))
        IOHIDKeyboardFilter::startStickyKey(this);
      else
        IOHIDKeyboardFilter::dispatchStickyKeys(this, 14);
    }
  }
}

void sub_231115C00(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_231115C18(uint64_t a1)
{
  IOHIDKeyboardFilter::dispatchStickyKeys(*(IOHIDKeyboardFilter **)(a1 + 32), 2);
}

_QWORD *IOHIDKeyboardFilter::serializeMapper@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  CFMutableArrayRef Mutable;
  _QWORD *result;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  BOOL v9;
  unint64_t v10;
  void *value;

  *(_QWORD *)a2 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)(a2 + 8) = 0xAAAAAAAAAAAAAAAALL;
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], *(int *)(a1 + 16), MEMORY[0x24BDBD690]);
  result = sub_2311162BC((_QWORD *)a2, Mutable, 1);
  *(_QWORD *)a2 = &unk_2500006D0;
  v6 = *(_QWORD **)a1;
  if (*(_QWORD *)a1 != a1 + 8)
  {
    do
    {
      v10 = 0xAAAAAAAAAAAAAAAALL;
      value = (void *)0xAAAAAAAAAAAAAAAALL;
      sub_23111613C(&v10, 2);
      sub_231115D68((uint64_t)&v10, CFSTR("Src"), v6[4]);
      sub_231115D68((uint64_t)&v10, CFSTR("Dst"), v6[6]);
      CFArrayAppendValue(*(CFMutableArrayRef *)(a2 + 8), value);
      result = sub_231116214(&v10);
      v7 = (_QWORD *)v6[1];
      if (v7)
      {
        do
        {
          v8 = v7;
          v7 = (_QWORD *)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          v8 = (_QWORD *)v6[2];
          v9 = *v8 == (_QWORD)v6;
          v6 = v8;
        }
        while (!v9);
      }
      v6 = v8;
    }
    while (v8 != (_QWORD *)(a1 + 8));
  }
  return result;
}

void sub_231115D44(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_2311163B0(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_231115D68(uint64_t a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  void *value;

  sub_231117B64(&v6, a3);
  if (a2 && value)
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 8), a2, value);
  return sub_231116254(&v6);
}

void sub_231115DC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_231116254(&a9);
  _Unwind_Resume(a1);
}

_QWORD *IOHIDKeyboardFilter::serializeModifierMappings@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  const __CFAllocator *v4;
  CFMutableArrayRef Mutable;
  _QWORD *result;
  _QWORD *v7;
  CFStringRef v8;
  _QWORD *v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  void *value;
  unint64_t v14;
  CFMutableDictionaryRef theDict;

  *(_QWORD *)a2 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)(a2 + 8) = 0xAAAAAAAAAAAAAAAALL;
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], *(int *)(a1 + 16), MEMORY[0x24BDBD690]);
  result = sub_2311162BC((_QWORD *)a2, Mutable, 1);
  *(_QWORD *)a2 = &unk_2500006D0;
  v7 = *(_QWORD **)a1;
  if (*(_QWORD *)a1 != a1 + 8)
  {
    do
    {
      v14 = 0xAAAAAAAAAAAAAAAALL;
      theDict = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
      sub_23111613C(&v14, *((_DWORD *)v7 + 14));
      v8 = CFStringCreateWithFormat(v4, 0, CFSTR("%#x"), *((unsigned int *)v7 + 8));
      IOHIDKeyboardFilter::serializeMapper((uint64_t)(v7 + 5), (uint64_t)&v12);
      if (v8 && value)
        CFDictionarySetValue(theDict, v8, value);
      sub_2311163B0(&v12);
      CFArrayAppendValue(*(CFMutableArrayRef *)(a2 + 8), theDict);
      result = sub_231116214(&v14);
      v9 = (_QWORD *)v7[1];
      if (v9)
      {
        do
        {
          v10 = v9;
          v9 = (_QWORD *)*v9;
        }
        while (v9);
      }
      else
      {
        do
        {
          v10 = (_QWORD *)v7[2];
          v11 = *v10 == (_QWORD)v7;
          v7 = v10;
        }
        while (!v11);
      }
      v7 = v10;
    }
    while (v10 != (_QWORD *)(a1 + 8));
  }
  return result;
}

void sub_231115F1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  _QWORD *v3;
  uint64_t v5;
  va_list va;
  uint64_t v7;
  va_list va1;

  va_start(va1, a3);
  va_start(va, a3);
  v5 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  sub_2311163B0((uint64_t *)va);
  sub_231116214((uint64_t *)va1);
  sub_2311163B0(v3);
  _Unwind_Resume(a1);
}

uint64_t IOHIDKeyboardFilter::getKeyboardID(IOHIDKeyboardFilter *this, int a2, int a3)
{
  if (a3 != 1452)
    return 3;
  if ((a2 - 514) > 0x11)
    return 198;
  return dword_2311188F4[(__int16)(a2 - 514)];
}

void sub_23111602C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_231116128(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

_QWORD *sub_23111613C(_QWORD *a1, int a2)
{
  *a1 = &unk_250000600;
  a1[1] = CFDictionaryCreateMutable(0, a2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  return a1;
}

void sub_23111618C(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_231116214(v1);
  _Unwind_Resume(a1);
}

void sub_2311161A0(_QWORD *a1)
{
  sub_231116214(a1);
  JUMPOUT(0x2348D2524);
}

void sub_2311161C8(_QWORD *a1)
{
  sub_231116214(a1);
  JUMPOUT(0x2348D2524);
}

void sub_2311161F0(_QWORD *a1)
{
  sub_231116214(a1);
  JUMPOUT(0x2348D2524);
}

_QWORD *sub_231116214(_QWORD *a1)
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &unk_250000680;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

_QWORD *sub_231116254(_QWORD *a1)
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &unk_2500006A0;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

void sub_231116298(_QWORD *a1)
{
  sub_231116254(a1);
  JUMPOUT(0x2348D2524);
}

_QWORD *sub_2311162BC(_QWORD *a1, CFTypeRef cf, char a3)
{
  CFTypeID v6;
  CFTypeRef v7;

  if (cf)
  {
    v6 = CFGetTypeID(cf);
    if (v6 == CFArrayGetTypeID())
      v7 = cf;
    else
      v7 = 0;
    *a1 = &unk_250000750;
    a1[1] = v7;
    if (v7 && (a3 & 1) == 0)
      CFRetain(v7);
  }
  else
  {
    a1[1] = 0;
  }
  *a1 = &unk_250000730;
  return a1;
}

void sub_23111633C(_QWORD *a1)
{
  sub_2311163B0(a1);
  JUMPOUT(0x2348D2524);
}

void sub_231116364(_QWORD *a1)
{
  sub_2311163B0(a1);
  JUMPOUT(0x2348D2524);
}

void sub_23111638C(_QWORD *a1)
{
  sub_2311163B0(a1);
  JUMPOUT(0x2348D2524);
}

_QWORD *sub_2311163B0(_QWORD *a1)
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &unk_250000750;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

_QWORD *sub_2311163F0(_QWORD *a1, CFTypeRef cf, char a3)
{
  CFTypeID v6;
  CFTypeRef v7;

  if (cf)
  {
    v6 = CFGetTypeID(cf);
    if (v6 == CFDictionaryGetTypeID())
      v7 = cf;
    else
      v7 = 0;
    *a1 = &unk_250000680;
    a1[1] = v7;
    if (v7 && (a3 & 1) == 0)
      CFRetain(v7);
  }
  else
  {
    a1[1] = 0;
  }
  *a1 = &unk_250000660;
  return a1;
}

_QWORD *sub_231116470(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    sub_231116520();
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

void sub_231116520()
{
  sub_231116534("basic_string");
}

void sub_231116534(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_231116584(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_250000348, MEMORY[0x24BEDAAF0]);
}

void sub_231116570(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_231116584(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void sub_2311165A8(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    sub_2311165A8(a1, *a2);
    sub_2311165A8(a1, a2[1]);
    operator delete(a2);
  }
}

void sub_2311165E8(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    sub_2311165E8(a1, *a2);
    sub_2311165E8(a1, a2[1]);
    sub_2311165A8((uint64_t)(a2 + 5), (_QWORD *)a2[6]);
    operator delete(a2);
  }
}

uint64_t **sub_231116634(uint64_t **a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  uint64_t *v6;
  uint64_t **v7;
  unsigned int v8;
  uint64_t **v9;
  unsigned int v10;
  _DWORD *v11;

  v7 = a1 + 1;
  v6 = a1[1];
  if (v6)
  {
    v8 = *a2;
    while (1)
    {
      while (1)
      {
        v9 = (uint64_t **)v6;
        v10 = *((_DWORD *)v6 + 8);
        if (v8 >= v10)
          break;
        v6 = *v9;
        v7 = v9;
        if (!*v9)
          goto LABEL_10;
      }
      if (v10 >= v8)
        break;
      v6 = v9[1];
      if (!v6)
      {
        v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v9 = a1 + 1;
LABEL_10:
    v11 = operator new(0x40uLL);
    v11[8] = **a4;
    *((_QWORD *)v11 + 7) = 0;
    *((_QWORD *)v11 + 6) = 0;
    *((_QWORD *)v11 + 5) = v11 + 12;
    sub_231116700(a1, (uint64_t)v9, v7, (uint64_t *)v11);
    return (uint64_t **)v11;
  }
  return v9;
}

uint64_t *sub_231116700(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v5;
  uint64_t *result;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = sub_231116754(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *sub_231116754(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24))
        return result;
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = v9;
            *v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          v13 = v2[1];
          *v3 = v13;
          if (v13)
            *(_QWORD *)(v13 + 16) = v3;
          v2[2] = v3[2];
          *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          v11 = a2[1];
          *v2 = v11;
          if (v11)
          {
            *(_QWORD *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        v12 = *v2;
        v3[1] = *v2;
        if (v12)
          *(_QWORD *)(v12 + 16) = v3;
        v2[2] = v3[2];
        *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
        *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

uint64_t **sub_2311168EC(uint64_t **result, unint64_t *a2, unint64_t *a3)
{
  uint64_t **v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t *v8;
  char v9;
  uint64_t **v10;
  uint64_t *v11;
  uint64_t *v12;

  v5 = result;
  if (result[2])
  {
    v6 = *result;
    v7 = result[1];
    *result = (uint64_t *)(result + 1);
    v7[2] = 0;
    result[1] = 0;
    result[2] = 0;
    if (v6[1])
      v8 = (uint64_t *)v6[1];
    else
      v8 = v6;
    v10 = result;
    v11 = v8;
    v12 = v8;
    if (v8)
    {
      v11 = sub_231116A98((uint64_t)v8);
      while (a2 != a3)
      {
        sub_2311169F0(v5, a2, (uint64_t)v8);
        if ((v9 & 1) != 0)
        {
          v8 = v11;
          v12 = v11;
          if (!v11)
          {
            a2 += 4;
            break;
          }
          v11 = sub_231116A98((uint64_t)v11);
        }
        else
        {
          v8 = v12;
        }
        a2 += 4;
        if (!v8)
          break;
      }
    }
    result = (uint64_t **)sub_231116AEC((uint64_t)&v10);
  }
  while (a2 != a3)
  {
    result = sub_231116B40(v5, a2, a2);
    a2 += 4;
  }
  return result;
}

void sub_2311169DC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_231116AEC((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t **sub_2311169F0(uint64_t **a1, unint64_t *a2, uint64_t a3)
{
  uint64_t **v4;
  uint64_t *v5;
  unint64_t v6;
  uint64_t **v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v4 = a1 + 1;
  v5 = a1[1];
  if (v5)
  {
    v6 = *a2;
    while (1)
    {
      while (1)
      {
        v7 = (uint64_t **)v5;
        v8 = v5[4];
        if (v6 >= v8)
          break;
        v5 = *v7;
        v4 = v7;
        if (!*v7)
          goto LABEL_10;
      }
      if (v8 >= v6)
        return v7;
      v5 = v7[1];
      if (!v5)
      {
        v4 = v7 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v7 = a1 + 1;
LABEL_10:
    v9 = *a2;
    *(_BYTE *)(a3 + 40) = *((_BYTE *)a2 + 8);
    *(_QWORD *)(a3 + 32) = v9;
    v10 = a2[2];
    *(_BYTE *)(a3 + 56) = *((_BYTE *)a2 + 24);
    *(_QWORD *)(a3 + 48) = v10;
    sub_231116700(a1, (uint64_t)v7, v4, (uint64_t *)a3);
  }
  return (uint64_t **)a3;
}

_QWORD *sub_231116A98(uint64_t a1)
{
  _QWORD *result;
  _QWORD *v3;
  _QWORD *v4;

  result = *(_QWORD **)(a1 + 16);
  if (result)
  {
    v3 = (_QWORD *)*result;
    if (*result == a1)
    {
      *result = 0;
      while (1)
      {
        v4 = (_QWORD *)result[1];
        if (!v4)
          break;
        do
        {
          result = v4;
          v4 = (_QWORD *)*v4;
        }
        while (v4);
      }
    }
    else
    {
      for (result[1] = 0; v3; v3 = (_QWORD *)result[1])
      {
        do
        {
          result = v3;
          v3 = (_QWORD *)*v3;
        }
        while (v3);
      }
    }
  }
  return result;
}

uint64_t sub_231116AEC(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;

  sub_2311165A8(*(_QWORD *)a1, *(_QWORD **)(a1 + 16));
  v2 = *(_QWORD **)(a1 + 8);
  if (v2)
  {
    v3 = (_QWORD *)v2[2];
    if (v3)
    {
      do
      {
        v2 = v3;
        v3 = (_QWORD *)v3[2];
      }
      while (v3);
      *(_QWORD *)(a1 + 8) = v2;
    }
    sub_2311165A8(*(_QWORD *)a1, v2);
  }
  return a1;
}

uint64_t **sub_231116B40(uint64_t **a1, unint64_t *a2, _OWORD *a3)
{
  uint64_t *v5;
  uint64_t **v6;
  unint64_t v7;
  uint64_t **v8;
  unint64_t v9;
  uint64_t *v10;
  __int128 v11;

  v6 = a1 + 1;
  v5 = a1[1];
  if (v5)
  {
    v7 = *a2;
    while (1)
    {
      while (1)
      {
        v8 = (uint64_t **)v5;
        v9 = v5[4];
        if (v7 >= v9)
          break;
        v5 = *v8;
        v6 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (v9 >= v7)
        break;
      v5 = v8[1];
      if (!v5)
      {
        v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v8 = a1 + 1;
LABEL_10:
    v10 = (uint64_t *)operator new(0x40uLL);
    v11 = a3[1];
    *((_OWORD *)v10 + 2) = *a3;
    *((_OWORD *)v10 + 3) = v11;
    sub_231116700(a1, (uint64_t)v8, v6, v10);
    return (uint64_t **)v10;
  }
  return v8;
}

void sub_231116BF8(uint64_t a1, _QWORD *a2)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (_QWORD *)(a1 + 8);
  sub_2311165A8(a1, *(_QWORD **)(a1 + 8));
  *(_QWORD *)a1 = *a2;
  v5 = a2 + 1;
  v6 = a2[1];
  *v4 = v6;
  v7 = a2[2];
  *(_QWORD *)(a1 + 16) = v7;
  if (v7)
  {
    *(_QWORD *)(v6 + 16) = v4;
    *a2 = v5;
    *v5 = 0;
    a2[2] = 0;
  }
  else
  {
    *(_QWORD *)a1 = v4;
  }
}

uint64_t *sub_231116C60(uint64_t **a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  BOOL v5;
  uint64_t *v6;

  v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      v3 = v2;
      v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    v4 = a2;
    do
    {
      v3 = (uint64_t *)v4[2];
      v5 = *v3 == (_QWORD)v4;
      v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2)
    *a1 = v3;
  v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  sub_231116CD0(v6, a2);
  return v3;
}

uint64_t *sub_231116CD0(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  int v5;
  uint64_t **v6;
  uint64_t *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v2 = *a2;
  v3 = a2;
  if (*a2)
  {
    v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      v3 = a2;
      goto LABEL_7;
    }
    do
    {
      v3 = v4;
      v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  v2 = v3[1];
  if (v2)
  {
LABEL_7:
    v5 = 0;
    *(_QWORD *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  v5 = 1;
LABEL_8:
  v6 = (uint64_t **)v3[2];
  v7 = *v6;
  if (*v6 == v3)
  {
    *v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      v7 = 0;
      result = (uint64_t *)v2;
    }
    else
    {
      v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    v9 = a2[2];
    v3[2] = v9;
    *(_QWORD *)(v9 + 8 * (*(_QWORD *)a2[2] != (_QWORD)a2)) = v3;
    v11 = *a2;
    v10 = a2[1];
    *(_QWORD *)(v11 + 16) = v3;
    *v3 = v11;
    v3[1] = v10;
    if (v10)
      *(_QWORD *)(v10 + 16) = v3;
    *((_BYTE *)v3 + 24) = *((_BYTE *)a2 + 24);
    if (result == a2)
      result = v3;
  }
  if (!v8 || !result)
    return result;
  if (!v5)
  {
    *(_BYTE *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    v12 = v7[2];
    if (*(uint64_t **)v12 == v7)
      break;
    if (!*((_BYTE *)v7 + 24))
    {
      *((_BYTE *)v7 + 24) = 1;
      *(_BYTE *)(v12 + 24) = 0;
      v13 = *(uint64_t **)(v12 + 8);
      v14 = *v13;
      *(_QWORD *)(v12 + 8) = *v13;
      if (v14)
        *(_QWORD *)(v14 + 16) = v12;
      v13[2] = *(_QWORD *)(v12 + 16);
      *(_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * (**(_QWORD **)(v12 + 16) != v12)) = v13;
      *v13 = v12;
      *(_QWORD *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7)
        result = v7;
      v7 = *(uint64_t **)(*v7 + 8);
    }
    v15 = (_QWORD *)*v7;
    if (*v7 && !*((_BYTE *)v15 + 24))
    {
      v16 = (uint64_t *)v7[1];
      if (!v16)
        goto LABEL_56;
LABEL_55:
      if (*((_BYTE *)v16 + 24))
      {
LABEL_56:
        *((_BYTE *)v15 + 24) = 1;
        *((_BYTE *)v7 + 24) = 0;
        v22 = v15[1];
        *v7 = v22;
        if (v22)
          *(_QWORD *)(v22 + 16) = v7;
        v15[2] = v7[2];
        *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        v16 = v7;
      }
      else
      {
        v15 = v7;
      }
      v23 = v15[2];
      *((_BYTE *)v15 + 24) = *(_BYTE *)(v23 + 24);
      *(_BYTE *)(v23 + 24) = 1;
      *((_BYTE *)v16 + 24) = 1;
      v24 = *(uint64_t **)(v23 + 8);
      v25 = *v24;
      *(_QWORD *)(v23 + 8) = *v24;
      if (v25)
        *(_QWORD *)(v25 + 16) = v23;
      v24[2] = *(_QWORD *)(v23 + 16);
      *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) != v23)) = v24;
      *v24 = v23;
      goto LABEL_72;
    }
    v16 = (uint64_t *)v7[1];
    if (v16 && !*((_BYTE *)v16 + 24))
      goto LABEL_55;
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      v17 = result;
LABEL_53:
      *((_BYTE *)v17 + 24) = 1;
      return result;
    }
    if (!*((_BYTE *)v17 + 24))
      goto LABEL_53;
LABEL_49:
    v7 = *(uint64_t **)(v17[2] + 8 * (*(_QWORD *)v17[2] == (_QWORD)v17));
  }
  if (!*((_BYTE *)v7 + 24))
  {
    *((_BYTE *)v7 + 24) = 1;
    *(_BYTE *)(v12 + 24) = 0;
    v18 = v7[1];
    *(_QWORD *)v12 = v18;
    if (v18)
      *(_QWORD *)(v18 + 16) = v12;
    v7[2] = *(_QWORD *)(v12 + 16);
    *(_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * (**(_QWORD **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(_QWORD *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12)
      result = v7;
    v7 = *(uint64_t **)v12;
  }
  v19 = (_QWORD *)*v7;
  if (*v7 && !*((_BYTE *)v19 + 24))
    goto LABEL_68;
  v20 = (uint64_t *)v7[1];
  if (!v20 || *((_BYTE *)v20 + 24))
  {
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (*((_BYTE *)v17 + 24))
      v21 = v17 == result;
    else
      v21 = 1;
    if (v21)
      goto LABEL_53;
    goto LABEL_49;
  }
  if (v19 && !*((_BYTE *)v19 + 24))
  {
LABEL_68:
    v20 = v7;
  }
  else
  {
    *((_BYTE *)v20 + 24) = 1;
    *((_BYTE *)v7 + 24) = 0;
    v26 = *v20;
    v7[1] = *v20;
    if (v26)
      *(_QWORD *)(v26 + 16) = v7;
    v20[2] = v7[2];
    *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v20;
    *v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    v19 = v7;
  }
  v23 = v20[2];
  *((_BYTE *)v20 + 24) = *(_BYTE *)(v23 + 24);
  *(_BYTE *)(v23 + 24) = 1;
  *((_BYTE *)v19 + 24) = 1;
  v24 = *(uint64_t **)v23;
  v27 = *(_QWORD *)(*(_QWORD *)v23 + 8);
  *(_QWORD *)v23 = v27;
  if (v27)
    *(_QWORD *)(v27 + 16) = v23;
  v24[2] = *(_QWORD *)(v23 + 16);
  *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(_QWORD *)(v23 + 16) = v24;
  return result;
}

_QWORD *sub_231117054(_QWORD *a1, int a2)
{
  int valuePtr;

  valuePtr = a2;
  *a1 = &unk_250000770;
  a1[1] = 0;
  a1[1] = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &valuePtr);
  return a1;
}

void sub_2311170AC(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_231116254(v1);
  _Unwind_Resume(a1);
}

void sub_2311170C0(_QWORD *a1)
{
  sub_231116254(a1);
  JUMPOUT(0x2348D2524);
}

uint64_t *sub_2311170E4(uint64_t *a1, uint64_t a2)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = (uint64_t)(a1 + 1);
  sub_231117138(a1, *(_QWORD **)a2, (_QWORD *)(a2 + 8));
  return a1;
}

void sub_231117120(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_2311165A8(v1, *(_QWORD **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *sub_231117138(uint64_t *result, _QWORD *a2, _QWORD *a3)
{
  _QWORD *v4;
  uint64_t **v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  BOOL v9;

  if (a2 != a3)
  {
    v4 = a2;
    v5 = (uint64_t **)result;
    v6 = result + 1;
    do
    {
      result = sub_2311171BC(v5, v6, v4 + 4, (_OWORD *)v4 + 2);
      v7 = (_QWORD *)v4[1];
      if (v7)
      {
        do
        {
          v8 = v7;
          v7 = (_QWORD *)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          v8 = (_QWORD *)v4[2];
          v9 = *v8 == (_QWORD)v4;
          v4 = v8;
        }
        while (!v9);
      }
      v4 = v8;
    }
    while (v8 != a3);
  }
  return result;
}

uint64_t *sub_2311171BC(uint64_t **a1, _QWORD *a2, unint64_t *a3, _OWORD *a4)
{
  void **v6;
  uint64_t *v7;
  uint64_t **v8;
  __int128 v9;
  unint64_t v11;
  uint64_t v12;

  v11 = 0xAAAAAAAAAAAAAAAALL;
  v12 = 0xAAAAAAAAAAAAAAAALL;
  v6 = (void **)sub_231117248(a1, a2, &v12, &v11, a3);
  v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    v8 = (uint64_t **)v6;
    v7 = (uint64_t *)operator new(0x40uLL);
    v9 = a4[1];
    *((_OWORD *)v7 + 2) = *a4;
    *((_OWORD *)v7 + 3) = v9;
    sub_231116700(a1, v12, v8, v7);
  }
  return v7;
}

_QWORD *sub_231117248(_QWORD *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, unint64_t *a5)
{
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  BOOL v14;
  unint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  unint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  unint64_t v22;

  v5 = a1 + 1;
  if (a1 + 1 == a2 || (v6 = *a5, v7 = a2[4], *a5 < v7))
  {
    v8 = *a2;
    if ((_QWORD *)*a1 == a2)
    {
      v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      v9 = (_QWORD *)*a2;
      do
      {
        v10 = v9;
        v9 = (_QWORD *)v9[1];
      }
      while (v9);
    }
    else
    {
      v13 = a2;
      do
      {
        v10 = (_QWORD *)v13[2];
        v14 = *v10 == (_QWORD)v13;
        v13 = v10;
      }
      while (v14);
    }
    v15 = *a5;
    if (v10[4] < *a5)
      goto LABEL_17;
    v16 = (_QWORD *)*v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v17 = v16;
          v18 = v16[4];
          if (v15 >= v18)
            break;
          v16 = (_QWORD *)*v17;
          v5 = v17;
          if (!*v17)
            goto LABEL_29;
        }
        if (v18 >= v15)
          break;
        v5 = v17 + 1;
        v16 = (_QWORD *)v17[1];
      }
      while (v16);
    }
    else
    {
      v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = a2;
    return a4;
  }
  v11 = a2[1];
  if (v11)
  {
    v12 = (_QWORD *)a2[1];
    do
    {
      a4 = v12;
      v12 = (_QWORD *)*v12;
    }
    while (v12);
  }
  else
  {
    v19 = a2;
    do
    {
      a4 = (_QWORD *)v19[2];
      v14 = *a4 == (_QWORD)v19;
      v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= a4[4])
  {
    v20 = (_QWORD *)*v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v21 = v20;
          v22 = v20[4];
          if (v6 >= v22)
            break;
          v20 = (_QWORD *)*v21;
          v5 = v21;
          if (!*v21)
            goto LABEL_48;
        }
        if (v22 >= v6)
          break;
        v5 = v21 + 1;
        v20 = (_QWORD *)v21[1];
      }
      while (v20);
    }
    else
    {
      v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

uint64_t **sub_2311173F0(uint64_t **result, _QWORD *a2, _QWORD *a3)
{
  uint64_t **v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t **v16;
  uint64_t *v17;
  uint64_t *v18;

  v5 = result;
  if (result[2])
  {
    v6 = *result;
    v7 = result[1];
    *result = (uint64_t *)(result + 1);
    v7[2] = 0;
    result[1] = 0;
    result[2] = 0;
    if (v6[1])
      v8 = (uint64_t *)v6[1];
    else
      v8 = v6;
    v16 = result;
    v17 = v8;
    v18 = v8;
    if (v8)
    {
      v17 = sub_231116A98((uint64_t)v8);
      if (a2 != a3)
      {
        v9 = a2;
        do
        {
          v10 = v9[4];
          *((_BYTE *)v8 + 40) = *((_BYTE *)v9 + 40);
          v8[4] = v10;
          v11 = v9[6];
          *((_BYTE *)v8 + 56) = *((_BYTE *)v9 + 56);
          v8[6] = v11;
          sub_231117568(v5, v8);
          v8 = v17;
          v18 = v17;
          if (v17)
            v17 = sub_231116A98((uint64_t)v17);
          v12 = (_QWORD *)v9[1];
          if (v12)
          {
            do
            {
              a2 = v12;
              v12 = (_QWORD *)*v12;
            }
            while (v12);
          }
          else
          {
            do
            {
              a2 = (_QWORD *)v9[2];
              v13 = *a2 == (_QWORD)v9;
              v9 = a2;
            }
            while (!v13);
          }
          if (!v8)
            break;
          v9 = a2;
        }
        while (a2 != a3);
      }
    }
    result = (uint64_t **)sub_231116AEC((uint64_t)&v16);
  }
  if (a2 != a3)
  {
    do
    {
      result = (uint64_t **)sub_2311175D4(v5, (_OWORD *)a2 + 2);
      v14 = (_QWORD *)a2[1];
      if (v14)
      {
        do
        {
          v15 = v14;
          v14 = (_QWORD *)*v14;
        }
        while (v14);
      }
      else
      {
        do
        {
          v15 = (_QWORD *)a2[2];
          v13 = *v15 == (_QWORD)a2;
          a2 = v15;
        }
        while (!v13);
      }
      a2 = v15;
    }
    while (v15 != a3);
  }
  return result;
}

void sub_231117554(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_231116AEC((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t *sub_231117568(uint64_t **a1, uint64_t *a2)
{
  uint64_t **v3;
  uint64_t *v4;
  uint64_t **v5;

  v3 = a1 + 1;
  v4 = a1[1];
  if (v4)
  {
    do
    {
      while (1)
      {
        v3 = (uint64_t **)v4;
        if (a2[4] >= (unint64_t)v4[4])
          break;
        v4 = (uint64_t *)*v4;
        v5 = v3;
        if (!*v3)
          goto LABEL_8;
      }
      v4 = (uint64_t *)v4[1];
    }
    while (v4);
    v5 = v3 + 1;
  }
  else
  {
    v5 = a1 + 1;
  }
LABEL_8:
  sub_231116700(a1, (uint64_t)v3, v5, a2);
  return a2;
}

_OWORD *sub_2311175D4(uint64_t **a1, _OWORD *a2)
{
  _OWORD *v4;
  _OWORD *v5;
  __int128 v6;
  uint64_t **v7;
  uint64_t *v8;
  uint64_t **v9;

  v4 = operator new(0x40uLL);
  v5 = v4;
  v6 = a2[1];
  v4[2] = *a2;
  v4[3] = v6;
  v7 = a1 + 1;
  v8 = a1[1];
  if (v8)
  {
    do
    {
      while (1)
      {
        v7 = (uint64_t **)v8;
        if (*((_QWORD *)v4 + 4) >= (unint64_t)v8[4])
          break;
        v8 = (uint64_t *)*v8;
        v9 = v7;
        if (!*v7)
          goto LABEL_8;
      }
      v8 = (uint64_t *)v8[1];
    }
    while (v8);
    v9 = v7 + 1;
  }
  else
  {
    v9 = a1 + 1;
  }
LABEL_8:
  sub_231116700(a1, (uint64_t)v7, v9, (uint64_t *)v4);
  return v5;
}

uint64_t sub_231117668(uint64_t a1, const std::string *a2, int a3)
{
  uint64_t v6;

  v6 = std::streambuf::basic_streambuf();
  *(_QWORD *)v6 = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)(v6 + 64) = 0u;
  *(_OWORD *)(v6 + 80) = 0u;
  *(_DWORD *)(v6 + 96) = a3;
  std::string::operator=((std::string *)(v6 + 64), a2);
  sub_2311176F8(a1);
  return a1;
}

void sub_2311176D4(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;

  if (*(char *)(v1 + 87) < 0)
    operator delete(*v2);
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

void sub_2311176F8(uint64_t a1)
{
  std::string *v2;
  char v3;
  std::string *v4;
  unint64_t v5;
  int v6;
  std::string::size_type v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  *(_QWORD *)(a1 + 88) = 0;
  v2 = (std::string *)(a1 + 64);
  v3 = *(_BYTE *)(a1 + 87);
  if (v3 < 0)
  {
    v4 = *(std::string **)(a1 + 64);
    v5 = *(_QWORD *)(a1 + 72);
  }
  else
  {
    v4 = v2;
    v5 = *(unsigned __int8 *)(a1 + 87);
  }
  v6 = *(_DWORD *)(a1 + 96);
  if ((v6 & 8) != 0)
  {
    *(_QWORD *)(a1 + 88) = (char *)v4 + v5;
    *(_QWORD *)(a1 + 16) = v4;
    *(_QWORD *)(a1 + 24) = v4;
    *(_QWORD *)(a1 + 32) = (char *)v4 + v5;
  }
  if ((v6 & 0x10) != 0)
  {
    *(_QWORD *)(a1 + 88) = (char *)v4 + v5;
    v7 = v3 < 0 ? (*(_QWORD *)(a1 + 80) & 0x7FFFFFFFFFFFFFFFLL) - 1 : 22;
    std::string::resize(v2, v7, 0);
    v8 = *(char *)(a1 + 87) < 0 ? *(_QWORD *)(a1 + 72) : *(unsigned __int8 *)(a1 + 87);
    *(_QWORD *)(a1 + 40) = v4;
    *(_QWORD *)(a1 + 48) = v4;
    *(_QWORD *)(a1 + 56) = (char *)v4 + v8;
    if ((*(_BYTE *)(a1 + 96) & 3) != 0)
    {
      if (v5 >> 31)
      {
        v9 = ((v5 - 0x80000000) * (unsigned __int128)0x200000005uLL) >> 64;
        v10 = 0x7FFFFFFF * ((v9 + ((v5 - 0x80000000 - v9) >> 1)) >> 30);
        v4 = (std::string *)((char *)v4 + v10 + 0x7FFFFFFF);
        v5 = v5 - v10 - 0x7FFFFFFF;
        *(_QWORD *)(a1 + 48) = v4;
      }
      if (v5)
        *(_QWORD *)(a1 + 48) = (char *)v4 + v5;
    }
  }
}

uint64_t sub_231117808(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)a1 = a1 + 8;
  sub_23111785C((_OWORD *)a1, *(_QWORD **)a2, (_QWORD *)(a2 + 8));
  return a1;
}

void sub_231117844(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_2311165A8(v1, *(_QWORD **)(v1 + 8));
  _Unwind_Resume(a1);
}

_OWORD *sub_23111785C(_OWORD *result, _QWORD *a2, _QWORD *a3)
{
  _QWORD *v4;
  uint64_t **v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  BOOL v9;

  if (a2 != a3)
  {
    v4 = a2;
    v5 = (uint64_t **)result;
    v6 = (_QWORD *)result + 1;
    do
    {
      result = sub_2311178E0(v5, v6, v4 + 4, (uint64_t)(v4 + 4));
      v7 = (_QWORD *)v4[1];
      if (v7)
      {
        do
        {
          v8 = v7;
          v7 = (_QWORD *)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          v8 = (_QWORD *)v4[2];
          v9 = *v8 == (_QWORD)v4;
          v4 = v8;
        }
        while (!v9);
      }
      v4 = v8;
    }
    while (v8 != a3);
  }
  return result;
}

_OWORD *sub_2311178E0(uint64_t **a1, _QWORD *a2, unint64_t *a3, uint64_t a4)
{
  void **v6;
  _OWORD *v7;
  uint64_t **v8;
  unint64_t v10;
  uint64_t v11;

  v10 = 0xAAAAAAAAAAAAAAAALL;
  v11 = 0xAAAAAAAAAAAAAAAALL;
  v6 = (void **)sub_231117248(a1, a2, &v11, &v10, a3);
  v7 = *v6;
  if (!*v6)
  {
    v8 = (uint64_t **)v6;
    v7 = operator new(0x38uLL);
    v7[2] = *(_OWORD *)a4;
    *((_QWORD *)v7 + 6) = *(_QWORD *)(a4 + 16);
    sub_231116700(a1, v11, v8, (uint64_t *)v7);
  }
  return v7;
}

uint64_t **sub_231117974(uint64_t **a1, unint64_t *a2, _OWORD *a3)
{
  uint64_t *v5;
  uint64_t **v6;
  unint64_t v7;
  uint64_t **v8;
  unint64_t v9;
  uint64_t *v10;

  v6 = a1 + 1;
  v5 = a1[1];
  if (v5)
  {
    v7 = *a2;
    while (1)
    {
      while (1)
      {
        v8 = (uint64_t **)v5;
        v9 = v5[4];
        if (v7 >= v9)
          break;
        v5 = *v8;
        v6 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (v9 >= v7)
        break;
      v5 = v8[1];
      if (!v5)
      {
        v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v8 = a1 + 1;
LABEL_10:
    v10 = (uint64_t *)operator new(0x30uLL);
    *((_OWORD *)v10 + 2) = *a3;
    sub_231116700(a1, (uint64_t)v8, v6, v10);
    return (uint64_t **)v10;
  }
  return v8;
}

uint64_t sub_231117A2C(uint64_t a1, unint64_t *a2)
{
  _QWORD *v2;
  unint64_t v3;
  uint64_t *v4;
  unint64_t v5;
  BOOL v6;
  _QWORD *v7;

  v2 = *(_QWORD **)(a1 + 8);
  if (!v2)
    return 0;
  v3 = *a2;
  v4 = (uint64_t *)(a1 + 8);
  do
  {
    v5 = v2[4];
    v6 = v5 >= v3;
    if (v5 >= v3)
      v7 = v2;
    else
      v7 = v2 + 1;
    if (v6)
      v4 = v2;
    v2 = (_QWORD *)*v7;
  }
  while (*v7);
  if (v4 == (uint64_t *)(a1 + 8) || v3 < v4[4])
    return 0;
  sub_231116C60((uint64_t **)a1, v4);
  operator delete(v4);
  return 1;
}

uint64_t **sub_231117AA4(uint64_t **a1, unint64_t *a2, uint64_t a3)
{
  uint64_t *v5;
  uint64_t **v6;
  unint64_t v7;
  uint64_t **v8;
  unint64_t v9;
  _OWORD *v10;

  v6 = a1 + 1;
  v5 = a1[1];
  if (v5)
  {
    v7 = *a2;
    while (1)
    {
      while (1)
      {
        v8 = (uint64_t **)v5;
        v9 = v5[4];
        if (v7 >= v9)
          break;
        v5 = *v8;
        v6 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (v9 >= v7)
        break;
      v5 = v8[1];
      if (!v5)
      {
        v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v8 = a1 + 1;
LABEL_10:
    v10 = operator new(0x38uLL);
    v10[2] = *(_OWORD *)a3;
    *((_DWORD *)v10 + 12) = *(_DWORD *)(a3 + 16);
    sub_231116700(a1, (uint64_t)v8, v6, (uint64_t *)v10);
    return (uint64_t **)v10;
  }
  return v8;
}

_QWORD *sub_231117B64(_QWORD *a1, uint64_t a2)
{
  uint64_t valuePtr;

  valuePtr = a2;
  *a1 = &unk_250000770;
  a1[1] = 0;
  a1[1] = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt64Type, &valuePtr);
  return a1;
}

void sub_231117BBC(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_231116254(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_231117BD0(uint64_t result, float a2, uint64_t a3, uint64_t a4)
{
  int v4;

  *(float *)a4 = a2;
  *(_QWORD *)(a4 + 4) = result;
  *(_WORD *)(a4 + 12) = 1024;
  *(_DWORD *)(a4 + 14) = v4;
  return result;
}

void sub_231117BE8(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_debug_impl(a1, a4, OS_LOG_TYPE_DEBUG, a2, a3, 0x12u);
}

void sub_231117C08(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_debug_impl(a1, a4, OS_LOG_TYPE_DEBUG, a2, a3, 0x16u);
}

void sub_231117C18(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

uint64_t sub_231117C28(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(_QWORD *)(a2 + 4) = result;
  return result;
}

uint64_t sub_231117C34(uint64_t result, uint64_t a2, int a3, float a4)
{
  *(float *)a2 = a4;
  *(_QWORD *)(a2 + 4) = result;
  *(_WORD *)(a2 + 12) = 1024;
  *(_DWORD *)(a2 + 14) = a3;
  return result;
}

uint64_t sub_231117C4C(uint64_t result, float a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(float *)a4 = a2;
  *(_QWORD *)(a4 + 4) = result;
  *(_WORD *)(a4 + 12) = 2048;
  *(_QWORD *)(a4 + 14) = v4;
  return result;
}

void sub_231117C64(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_23110E000, a2, OS_LOG_TYPE_DEBUG, "Event dropped: %@\n", (uint8_t *)&v2, 0xCu);
}

void sub_231117CD8(uint64_t a1, uint64_t a2)
{
  os_log_t v2;
  uint8_t *v3;

  sub_231117C28(a1, a2, 5.7779e-34);
  _os_log_error_impl(&dword_23110E000, v2, OS_LOG_TYPE_ERROR, "Insufficient permissions to remap alphanumeric keys or special characters for UUID: %@\n", v3, 0xCu);
}

void sub_231117D18(uint64_t a1, uint64_t a2, int a3)
{
  uint8_t *v3;
  NSObject *v4;

  sub_231117C34(a1, a2, a3, 5.778e-34);
  sub_231117BE8(&dword_23110E000, "[%@] _stickyKeyOn: %d\n", v3, v4);
}

void sub_231117D50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint8_t *v3;
  NSObject *v4;

  sub_231117BF8();
  sub_231117BD0(v0, 5.778e-34, v1, v2);
  sub_231117BE8(&dword_23110E000, "[%@] _stickyKeyDisable: %d\n", v3, v4);
}

void sub_231117D84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint8_t *v3;
  NSObject *v4;

  sub_231117BF8();
  sub_231117BD0(v0, 5.778e-34, v1, v2);
  sub_231117BE8(&dword_23110E000, "[%@] _stickyKeyToggle: %d\n", v3, v4);
}

void sub_231117DB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v3;
  NSObject *v4;

  sub_231117C4C(a1, 5.778e-34, a2, a3);
  sub_231117C08(&dword_23110E000, "[%@] _keyRepeatInitialDelayMS: %lld\n", v3, v4);
}

void sub_231117DF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v3;
  NSObject *v4;

  sub_231117C4C(a1, 5.778e-34, a2, a3);
  sub_231117C08(&dword_23110E000, "[%@] _keyRepeatDelayMS: %lld\n", v3, v4);
}

void sub_231117E30(uint64_t a1, uint64_t a2, int a3)
{
  uint8_t *v3;
  NSObject *v4;

  sub_231117C34(a1, a2, a3, 5.778e-34);
  sub_231117BE8(&dword_23110E000, "[%@] capsLockState: %d\n", v3, v4);
}

void sub_231117E68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint8_t *v3;
  NSObject *v4;

  sub_231117BF8();
  sub_231117BD0(v0, 5.778e-34, v1, v2);
  sub_231117BE8(&dword_23110E000, "[%@] _capsLockLEDInhibit: %d\n", v3, v4);
}

void sub_231117E9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint8_t *v3;
  NSObject *v4;

  sub_231117BF8();
  sub_231117BD0(v0, 5.778e-34, v1, v2);
  sub_231117BE8(&dword_23110E000, "[%@] _capsLockDarkWakeLEDInhibit: %d\n", v3, v4);
}

void sub_231117ED0(uint64_t a1, uint64_t a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  sub_231117C28(a1, a2, 5.7779e-34);
  sub_231117C18(&dword_23110E000, v2, v3, "[%@] _modifiersKeyMap initialized\n", v4);
}

void sub_231117F04()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint8_t *v3;
  NSObject *v4;

  sub_231117BF8();
  sub_231117BD0(v0, 5.778e-34, v1, v2);
  sub_231117BE8(&dword_23110E000, "[%@] _fnKeyMode: %x\n", v3, v4);
}

void sub_231117F38(uint64_t a1, uint64_t a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  sub_231117C28(a1, a2, 5.7779e-34);
  sub_231117C18(&dword_23110E000, v2, v3, "[%@] _userKeyMap initialized\n", v4);
}

void sub_231117F6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint8_t *v3;
  NSObject *v4;

  sub_231117BF8();
  sub_231117BD0(v0, 5.778e-34, v1, v2);
  sub_231117BE8(&dword_23110E000, "[%@] _slowKeysDelayMS = %d\n", v3, v4);
}

void sub_231117FA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint8_t *v3;
  NSObject *v4;

  sub_231117BF8();
  sub_231117BD0(v0, 5.778e-34, v1, v2);
  sub_231117BE8(&dword_23110E000, "[%@] _capsLockDelayMS: %d\n", v3, v4);
}

void sub_231117FD4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint8_t *v3;
  NSObject *v4;

  sub_231117BF8();
  sub_231117BD0(v0, 5.778e-34, v1, v2);
  sub_231117BE8(&dword_23110E000, "[%@] _capsLockDelayOverrideMS: %d\n", v3, v4);
}

void sub_231118008()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint8_t *v3;
  NSObject *v4;

  sub_231117BF8();
  sub_231117BD0(v0, 5.778e-34, v1, v2);
  sub_231117BE8(&dword_23110E000, "[%@] _lockKeyDelayMS: %d\n", v3, v4);
}

void sub_23111803C(uint64_t a1, uint64_t a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  sub_231117C28(a1, a2, 5.7779e-34);
  sub_231117C18(&dword_23110E000, v2, v3, "[%@] _unifiedModifiedKeyMaps[kKeyMaskCtrl] updated\n", v4);
}

void sub_231118070(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 456);
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = v4;
  sub_231117C08(&dword_23110E000, "[%@] _capsLockLED: %@\n", (uint8_t *)a3, a4);
}

void sub_2311180BC(uint64_t a1, uint64_t a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  sub_231117C28(a1, a2, 5.7779e-34);
  sub_231117C18(&dword_23110E000, v2, v3, "[%@] Event cancelled\n", v4);
}

void sub_2311180F0(uint64_t a1, _DWORD *a2, uint64_t a3, NSObject *a4)
{
  const char *v4;

  v4 = "ON";
  if (!*a2)
    v4 = "OFF";
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2080;
  *(_QWORD *)(a3 + 14) = v4;
  sub_231117C08(&dword_23110E000, "[%@] StickyKey state change (5xSHIFT) to %s\n", (uint8_t *)a3, a4);
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x24BDBB790](allocator, size, hint);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
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

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
  MEMORY[0x24BDBB878](theArray);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x24BDBBEE0](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

void CFPlugInAddInstanceForFactory(CFUUIDRef factoryID)
{
  MEMORY[0x24BDBC140](factoryID);
}

void CFPlugInRemoveInstanceForFactory(CFUUIDRef factoryID)
{
  MEMORY[0x24BDBC148](factoryID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8E0](alloc, *(_QWORD *)&bytes.byte0, *(_QWORD *)&bytes.byte8);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8F8](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

uint64_t IOHIDAccessCheckAuditToken()
{
  return MEMORY[0x24BDD7FE0]();
}

uint64_t IOHIDEventAppendEvent()
{
  return MEMORY[0x24BDD8148]();
}

uint64_t IOHIDEventCreateCopy()
{
  return MEMORY[0x24BDD8188]();
}

uint64_t IOHIDEventCreateKeyboardEvent()
{
  return MEMORY[0x24BDD81D8]();
}

uint64_t IOHIDEventCreateVendorDefinedEvent()
{
  return MEMORY[0x24BDD8248]();
}

uint64_t IOHIDEventGetChildren()
{
  return MEMORY[0x24BDD8260]();
}

uint64_t IOHIDEventGetEventFlags()
{
  return MEMORY[0x24BDD8280]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x24BDD8298]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x24BDD82D0]();
}

uint64_t IOHIDEventSetEventFlags()
{
  return MEMORY[0x24BDD8310]();
}

uint64_t IOHIDEventSetIntegerValue()
{
  return MEMORY[0x24BDD8320]();
}

uint64_t IOHIDEventSetTimeStamp()
{
  return MEMORY[0x24BDD8348]();
}

uint64_t IOHIDEventSystemConnectionGetAuditToken()
{
  return MEMORY[0x24BDD8430]();
}

uint64_t IOHIDEventSystemConnectionGetUUID()
{
  return MEMORY[0x24BDD8458]();
}

uint64_t IOHIDEventSystemConnectionHasEntitlement()
{
  return MEMORY[0x24BDD8460]();
}

uint64_t IOHIDPreferencesCopyDomain()
{
  return MEMORY[0x24BDD8508]();
}

uint64_t IOHIDServiceConformsTo()
{
  return MEMORY[0x24BDD8560]();
}

uint64_t IOHIDServiceCopyProperty()
{
  return MEMORY[0x24BDD8568]();
}

uint64_t IOHIDServiceGetRegistryID()
{
  return MEMORY[0x24BDD8578]();
}

uint64_t IOHIDServiceSetElementValue()
{
  return MEMORY[0x24BDD8580]();
}

uint64_t IOHIDServiceSetProperty()
{
  return MEMORY[0x24BDD8588]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _IOHIDEventCopyAttachment()
{
  return MEMORY[0x24BDD8A80]();
}

uint64_t _IOHIDEventRemoveAttachment()
{
  return MEMORY[0x24BDD8A88]();
}

uint64_t _IOHIDEventSetAttachment()
{
  return MEMORY[0x24BDD8A90]();
}

uint64_t _IOHIDIsRestrictedRemappingProperty()
{
  return MEMORY[0x24BDD8AA8]();
}

uint64_t _IOHIDLogCategory()
{
  return MEMORY[0x24BDD8AB0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x24BEDAC98](this, __n, __c);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x24BEDACC8](this, __c);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x24BEDAE50]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x24BEDAE70]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x24BEDB048]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x24BEDB050]();
}

unint64_t std::stoul(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x24BEDB390](__str, __idx, *(_QWORD *)&__base);
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
  off_250000370(__p);
}

uint64_t operator delete()
{
  return off_250000378();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_250000380(__sz);
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

void __cxa_rethrow(void)
{
  MEMORY[0x24BEDB958]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

