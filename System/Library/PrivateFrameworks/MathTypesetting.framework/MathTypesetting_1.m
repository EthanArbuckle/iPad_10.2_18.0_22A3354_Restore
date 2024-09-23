void sub_24120D8F8(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>,std::__map_value_compare<std::pair<unsigned short,EQKit::Config::Operator::Form>,std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>,std::less<std::pair<unsigned short,EQKit::Config::Operator::Form>>,true>,std::allocator<std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>>>::destroy(v1, *(_QWORD **)(v1 + 8));
  _Unwind_Resume(a1);
}

void *blahtex::UnicodeNameTable(blahtex *this)
{
  unsigned __int8 v1;

  {
    std::unordered_map<wchar_t,blahtex::UnicodeNameInfo>::unordered_map<std::pair<wchar_t,blahtex::UnicodeNameInfo> const*>((uint64_t)&blahtex::UnicodeNameTable(void)::gUnicodeNameTable, (int *)&blahtex::gUnicodeNameArray, (int *)&blahtex::gUnicodeNameArray + 5290);
  }
  return &blahtex::UnicodeNameTable(void)::gUnicodeNameTable;
}

void sub_24120D97C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t blahtex::XmlEncode@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, std::wstringbuf::string_type *a3@<X8>)
{
  uint64_t *v6;
  uint64_t v7;
  int v8;
  uint64_t *v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  unsigned int v16;
  int v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t *v20;
  _QWORD *v21;
  uint64_t *v22;
  _QWORD *v23;
  _QWORD *v24;
  void (__cdecl **v26)(std::wostringstream *__hidden);
  std::wstringbuf v27;
  void (__cdecl **v28)(std::wostringstream *__hidden);
  int v29[3];

  v6 = (uint64_t *)std::wostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v26);
  v7 = *((unsigned __int8 *)a1 + 23);
  v8 = (char)v7;
  if ((v7 & 0x80u) != 0)
    v7 = a1[1];
  if (v7)
  {
    if (v8 >= 0)
      v9 = a1;
    else
      v9 = (uint64_t *)*a1;
    while (1)
    {
      v10 = *(_DWORD *)v9;
      if (*(_DWORD *)v9 == 62)
        break;
      if (v10 == 60)
      {
        v11 = &unk_24122F90C;
        goto LABEL_13;
      }
      if (v10 == 38)
      {
        v11 = &unk_24122F8F4;
        v12 = 5;
LABEL_14:
        v6 = std::__put_character_sequence[abi:ne180100]<wchar_t,std::char_traits<wchar_t>>(&v26, (uint64_t)v11, v12);
        goto LABEL_15;
      }
      if (v10 <= 127)
        goto LABEL_32;
      blahtex::UnicodeNameTable((blahtex *)v6);
      v6 = std::__hash_table<std::__hash_value_type<wchar_t,std::wstring_view>,std::__unordered_map_hasher<wchar_t,std::__hash_value_type<wchar_t,std::wstring_view>,std::hash<wchar_t>,std::equal_to<wchar_t>,true>,std::__unordered_map_equal<wchar_t,std::__hash_value_type<wchar_t,std::wstring_view>,std::equal_to<wchar_t>,std::hash<wchar_t>,true>,std::allocator<std::__hash_value_type<wchar_t,std::wstring_view>>>::find<wchar_t>(blahtex::UnicodeNameTable(void)::gUnicodeNameTable, (int *)v9);
      v15 = v6;
      if (!v6)
      {
        if (!*(_BYTE *)(a2 + 4))
        {
          v18 = std::__put_character_sequence[abi:ne180100]<wchar_t,std::char_traits<wchar_t>>(&v26, (uint64_t)&unk_24122F934, 3);
          *(_DWORD *)((char *)v18 + *(_QWORD *)(*v18 - 24) + 8) = *(_DWORD *)((_BYTE *)v18
                                                                              + *(_QWORD *)(*v18 - 24)
                                                                              + 8) & 0xFFFFFFB5 | 8;
          v19 = (_QWORD *)std::wostream::operator<<();
          v6 = std::__put_character_sequence[abi:ne180100]<wchar_t,std::char_traits<wchar_t>>(v19, (uint64_t)&unk_24122F944, 1);
          goto LABEL_15;
        }
LABEL_32:
        v29[0] = *(_DWORD *)v9;
        v6 = std::__put_character_sequence[abi:ne180100]<wchar_t,std::char_traits<wchar_t>>(&v26, (uint64_t)v29, 1);
        goto LABEL_15;
      }
      v16 = *(_DWORD *)a2;
      if (!*(_BYTE *)(a2 + 5))
      {
        v17 = v16 <= 2 ? 2 : *(_DWORD *)a2;
        if (*((_WORD *)v9 + 1))
          v16 = v17;
      }
      switch(v16)
      {
        case 0u:
          goto LABEL_32;
        case 1u:
          goto LABEL_39;
        case 2u:
          goto LABEL_36;
        case 3u:
          v20 = v6 + 6;
          if (v6[6])
          {
            v21 = std::__put_character_sequence[abi:ne180100]<wchar_t,std::char_traits<wchar_t>>(&v26, (uint64_t)&unk_24122F94C, 1);
            v22 = v15 + 5;
LABEL_38:
            v23 = std::__put_character_sequence[abi:ne180100]<wchar_t,std::char_traits<wchar_t>>(v21, *v22, *v20);
            goto LABEL_40;
          }
LABEL_36:
          if (v6[4])
          {
            v21 = std::__put_character_sequence[abi:ne180100]<wchar_t,std::char_traits<wchar_t>>(&v26, (uint64_t)&unk_24122F94C, 1);
            v22 = v15 + 3;
            v20 = v15 + 4;
            goto LABEL_38;
          }
LABEL_39:
          v24 = std::__put_character_sequence[abi:ne180100]<wchar_t,std::char_traits<wchar_t>>(&v26, (uint64_t)&unk_24122F934, 3);
          *(_DWORD *)((char *)v24 + *(_QWORD *)(*v24 - 24) + 8) = *(_DWORD *)((_BYTE *)v24
                                                                              + *(_QWORD *)(*v24 - 24)
                                                                              + 8) & 0xFFFFFFB5 | 8;
          v23 = (_QWORD *)std::wostream::operator<<();
LABEL_40:
          v6 = std::__put_character_sequence[abi:ne180100]<wchar_t,std::char_traits<wchar_t>>(v23, (uint64_t)&unk_24122F944, 1);
          break;
        default:
          break;
      }
LABEL_15:
      v9 = (uint64_t *)((char *)v9 + 4);
      v13 = *((unsigned __int8 *)a1 + 23);
      if ((v13 & 0x80u) == 0)
        v14 = a1;
      else
        v14 = (uint64_t *)*a1;
      if ((v13 & 0x80u) != 0)
        v13 = a1[1];
      if (v9 == (uint64_t *)((char *)v14 + 4 * v13))
        goto LABEL_41;
    }
    v11 = &unk_24122F920;
LABEL_13:
    v12 = 4;
    goto LABEL_14;
  }
LABEL_41:
  std::wstringbuf::str(a3, &v27);
  if (SHIBYTE(v27.__str_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v27.__str_.__r_.__value_.__l.__data_);
  std::wstreambuf::~wstreambuf();
  std::wostream::~wostream();
  return MEMORY[0x242690710](&v28);
}

void sub_24120DCC4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::wostringstream::~wostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::unordered_map<wchar_t,blahtex::UnicodeNameInfo>::unordered_map<std::pair<wchar_t,blahtex::UnicodeNameInfo> const*>(uint64_t a1, int *a2, int *a3)
{
  int *v5;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a2 != a3)
  {
    v5 = a2;
    do
    {
      std::__hash_table<std::__hash_value_type<wchar_t,blahtex::UnicodeNameInfo>,std::__unordered_map_hasher<wchar_t,std::__hash_value_type<wchar_t,blahtex::UnicodeNameInfo>,std::hash<wchar_t>,std::equal_to<wchar_t>,true>,std::__unordered_map_equal<wchar_t,std::__hash_value_type<wchar_t,blahtex::UnicodeNameInfo>,std::equal_to<wchar_t>,std::hash<wchar_t>,true>,std::allocator<std::__hash_value_type<wchar_t,blahtex::UnicodeNameInfo>>>::__emplace_unique_key_args<wchar_t,std::pair<wchar_t,blahtex::UnicodeNameInfo> const&>(a1, v5, (uint64_t)v5);
      v5 += 10;
    }
    while (v5 != a3);
  }
  return a1;
}

void sub_24120DD4C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<wchar_t,std::hash<wchar_t>,std::equal_to<wchar_t>,std::allocator<wchar_t>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

char *std::__hash_table<std::__hash_value_type<wchar_t,blahtex::UnicodeNameInfo>,std::__unordered_map_hasher<wchar_t,std::__hash_value_type<wchar_t,blahtex::UnicodeNameInfo>,std::hash<wchar_t>,std::equal_to<wchar_t>,true>,std::__unordered_map_equal<wchar_t,std::__hash_value_type<wchar_t,blahtex::UnicodeNameInfo>,std::equal_to<wchar_t>,std::hash<wchar_t>,true>,std::allocator<std::__hash_value_type<wchar_t,blahtex::UnicodeNameInfo>>>::__emplace_unique_key_args<wchar_t,std::pair<wchar_t,blahtex::UnicodeNameInfo> const&>(uint64_t a1, int *a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  void **v9;
  char *v10;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t v20;

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v3 = *a2;
      if (v7 <= v6)
        v3 = v6 % v7;
    }
    else
    {
      v3 = (v7 - 1) & v6;
    }
    v9 = *(void ***)(*(_QWORD *)a1 + 8 * v3);
    if (v9)
    {
      v10 = (char *)*v9;
      if (*v9)
      {
        do
        {
          v11 = *((_QWORD *)v10 + 1);
          if (v11 == v6)
          {
            if (*((_DWORD *)v10 + 4) == (_DWORD)v6)
              return v10;
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7)
                v11 %= v7;
            }
            else
            {
              v11 &= v7 - 1;
            }
            if (v11 != v3)
              break;
          }
          v10 = *(char **)v10;
        }
        while (v10);
      }
    }
  }
  v10 = (char *)operator new(0x38uLL);
  *(_QWORD *)v10 = 0;
  *((_QWORD *)v10 + 1) = v6;
  *((_DWORD *)v10 + 4) = *(_DWORD *)a3;
  *(_OWORD *)(v10 + 24) = *(_OWORD *)(a3 + 8);
  *(_OWORD *)(v10 + 40) = *(_OWORD *)(a3 + 24);
  v12 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    v14 = 1;
    if (v7 >= 3)
      v14 = (v7 & (v7 - 1)) != 0;
    v15 = v14 | (2 * v7);
    v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16)
      v17 = v16;
    else
      v17 = v15;
    std::__hash_table<wchar_t,std::hash<wchar_t>,std::equal_to<wchar_t>,std::allocator<wchar_t>>::__rehash<true>(a1, v17);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6)
        v3 = v6 % v7;
      else
        v3 = v6;
    }
    else
    {
      v3 = (v7 - 1) & v6;
    }
  }
  v18 = *(_QWORD *)a1;
  v19 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v19)
  {
    *(_QWORD *)v10 = *v19;
LABEL_38:
    *v19 = v10;
    goto LABEL_39;
  }
  *(_QWORD *)v10 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v10;
  *(_QWORD *)(v18 + 8 * v3) = a1 + 16;
  if (*(_QWORD *)v10)
  {
    v20 = *(_QWORD *)(*(_QWORD *)v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7)
        v20 %= v7;
    }
    else
    {
      v20 &= v7 - 1;
    }
    v19 = (_QWORD *)(*(_QWORD *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v10;
}

void sub_24120DF74(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_24120DF90()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_24120DF9C()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_24120DFA8()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_24120DFB4()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_24120DFC0()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_24120DFCC()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_24120DFD8()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_24120DFE4()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_24120DFF0()
{
  return MEMORY[0x24BDCFD70]();
}

uint64_t sub_24120DFFC()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_24120E008()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_24120E014()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_24120E020()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_24120E02C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_24120E038()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_24120E044()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_24120E050()
{
  return MEMORY[0x24BEE4328]();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

Boolean CFCharacterSetIsLongCharacterMember(CFCharacterSetRef theSet, UTF32Char theChar)
{
  return MEMORY[0x24BDBBC38](theSet, *(_QWORD *)&theChar);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x24BDBBF10](cf);
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBBFE8](cf);
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

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x24BDBC520](alloc, theString);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x24BDBC580](alloc, chars, numChars);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CGAffineTransformComponents *__cdecl CGAffineTransformDecompose(CGAffineTransformComponents *__return_ptr retstr, CGAffineTransform *transform)
{
  return (CGAffineTransformComponents *)MEMORY[0x24BDBD8A8](retstr, transform);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD900](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD908](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x24BDBDA78](space, components);
}

CGColorRef CGColorCreateGenericGray(CGFloat gray, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x24BDBDA98](gray, alpha);
}

CGColorRef CGColorCreateGenericRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x24BDBDAA8](red, green, blue, alpha);
}

BOOL CGColorEqualToColor(CGColorRef color1, CGColorRef color2)
{
  return MEMORY[0x24BDBDAC0](color1, color2);
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x24BDBDB40](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBB8](name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBDCD0](c, x, y);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x24BDBDCE0](c, path);
}

void CGContextBeginPath(CGContextRef c)
{
  MEMORY[0x24BDBDD00](c);
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
  MEMORY[0x24BDBDE18](c, *(_QWORD *)&mode);
}

void CGContextEOFillPath(CGContextRef c)
{
  MEMORY[0x24BDBDE48](c);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE70](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGAffineTransform *__cdecl CGContextGetCTM(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x24BDBDE98](retstr, c);
}

CGAffineTransform *__cdecl CGContextGetTextMatrix(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x24BDBDF08](retstr, c);
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBDF20](c, x, y);
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

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
  MEMORY[0x24BDBDFA0](c, alpha);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBDFD8](c, color);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x24BDBE038](c, width);
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBE0D0](c, color);
}

void CGContextSetTextMatrix(CGContextRef c, CGAffineTransform *t)
{
  MEMORY[0x24BDBE0F0](c, t);
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBE0F8](c, x, y);
}

void CGContextStrokePath(CGContextRef c)
{
  MEMORY[0x24BDBE118](c);
}

void CGContextStrokeRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBE120](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x24BDBE130](c, tx, ty);
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEDB8](path, m, cp1x, cp1y, cp2x, cp2y, x, y);
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEDC8](path, m, x, y);
}

void CGPathAddPath(CGMutablePathRef path1, const CGAffineTransform *m, CGPathRef path2)
{
  MEMORY[0x24BDBEDD8](path1, m, path2);
}

void CGPathAddQuadCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEDE0](path, m, cpx, cpy, x, y);
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
  MEMORY[0x24BDBEDE8](path, m, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathApply(CGPathRef path, void *info, CGPathApplierFunction function)
{
  MEMORY[0x24BDBEE08](path, info, function);
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
  MEMORY[0x24BDBEE20](path);
}

CGPathRef CGPathCreateCopy(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x24BDBEE30](path);
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x24BDBEE60](path, transform);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x24BDBEE80]();
}

CGMutablePathRef CGPathCreateMutableCopy(CGPathRef path)
{
  return (CGMutablePathRef)MEMORY[0x24BDBEE88](path);
}

BOOL CGPathEqualToPath(CGPathRef path1, CGPathRef path2)
{
  return MEMORY[0x24BDBEEB8](path1, path2);
}

CGRect CGPathGetPathBoundingBox(CGPathRef path)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBEEE0](path);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEF40](path, m, x, y);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x24BDBEF48](path);
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

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF078]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF088]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CFCharacterSetRef CTFontCopyCharacterSet(CTFontRef font)
{
  return (CFCharacterSetRef)MEMORY[0x24BDC46E8](font);
}

CFStringRef CTFontCopyFamilyName(CTFontRef font)
{
  return (CFStringRef)MEMORY[0x24BDC4700](font);
}

CFStringRef CTFontCopyPostScriptName(CTFontRef font)
{
  return (CFStringRef)MEMORY[0x24BDC4748](font);
}

CFDataRef CTFontCopyTable(CTFontRef font, CTFontTableTag table, CTFontTableOptions options)
{
  return (CFDataRef)MEMORY[0x24BDC4758](font, *(_QWORD *)&table, *(_QWORD *)&options);
}

CFDictionaryRef CTFontCopyTraits(CTFontRef font)
{
  return (CFDictionaryRef)MEMORY[0x24BDC4768](font);
}

CTFontRef CTFontCreateCopyWithAttributes(CTFontRef font, CGFloat size, const CGAffineTransform *matrix, CTFontDescriptorRef attributes)
{
  return (CTFontRef)MEMORY[0x24BDC4788](font, matrix, attributes, size);
}

CTFontRef CTFontCreateForString(CTFontRef currentFont, CFStringRef string, CFRange range)
{
  return (CTFontRef)MEMORY[0x24BDC4798](currentFont, string, range.location, range.length);
}

CGPathRef CTFontCreatePathForGlyph(CTFontRef font, CGGlyph glyph, const CGAffineTransform *matrix)
{
  return (CGPathRef)MEMORY[0x24BDC47A0](font, glyph, matrix);
}

CTFontRef CTFontCreateWithFontDescriptor(CTFontDescriptorRef descriptor, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x24BDC47B0](descriptor, matrix, size);
}

CTFontRef CTFontCreateWithName(CFStringRef name, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x24BDC47C8](name, matrix, size);
}

CTFontDescriptorRef CTFontDescriptorCreateWithAttributes(CFDictionaryRef attributes)
{
  return (CTFontDescriptorRef)MEMORY[0x24BDC4830](attributes);
}

double CTFontGetAdvancesForGlyphs(CTFontRef font, CTFontOrientation orientation, const CGGlyph *glyphs, CGSize *advances, CFIndex count)
{
  double result;

  MEMORY[0x24BDC48B0](font, *(_QWORD *)&orientation, glyphs, advances, count);
  return result;
}

CGFloat CTFontGetAscent(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x24BDC48B8](font);
  return result;
}

CGRect CTFontGetBoundingRectsForGlyphs(CTFontRef font, CTFontOrientation orientation, const CGGlyph *glyphs, CGRect *boundingRects, CFIndex count)
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  MEMORY[0x24BDC48C8](font, *(_QWORD *)&orientation, glyphs, boundingRects, count);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

CGFloat CTFontGetDescent(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x24BDC48E0](font);
  return result;
}

BOOL CTFontGetGlyphsForCharacters(CTFontRef font, const UniChar *characters, CGGlyph *glyphs, CFIndex count)
{
  return MEMORY[0x24BDC48F0](font, characters, glyphs, count);
}

CGFloat CTFontGetLeading(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x24BDC4900](font);
  return result;
}

CGFloat CTFontGetSize(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x24BDC4908](font);
  return result;
}

CGFloat CTFontGetSlantAngle(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x24BDC4910](font);
  return result;
}

unsigned int CTFontGetUnitsPerEm(CTFontRef font)
{
  return MEMORY[0x24BDC4948](font);
}

CGFloat CTFontGetXHeight(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x24BDC4960](font);
  return result;
}

CTGlyphInfoRef CTGlyphInfoCreateWithGlyph(CGGlyph glyph, CTFontRef font, CFStringRef baseString)
{
  return (CTGlyphInfoRef)MEMORY[0x24BDC4A10](glyph, font, baseString);
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x24BDC4A30](attrString);
}

void CTLineDraw(CTLineRef line, CGContextRef context)
{
  MEMORY[0x24BDC4A68](line, context);
}

CFArrayRef CTLineGetGlyphRuns(CTLineRef line)
{
  return (CFArrayRef)MEMORY[0x24BDC4A88](line);
}

CGRect CTLineGetImageBounds(CTLineRef line, CGContextRef context)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDC4A90](line, context);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGFloat CTLineGetOffsetForStringIndex(CTLineRef line, CFIndex charIndex, CGFloat *secondaryOffset)
{
  CGFloat result;

  MEMORY[0x24BDC4A98](line, charIndex, secondaryOffset);
  return result;
}

double CTLineGetTypographicBounds(CTLineRef line, CGFloat *ascent, CGFloat *descent, CGFloat *leading)
{
  double result;

  MEMORY[0x24BDC4AC8](line, ascent, descent, leading);
  return result;
}

CTRunDelegateRef CTRunDelegateCreate(const CTRunDelegateCallbacks *callbacks, void *refCon)
{
  return (CTRunDelegateRef)MEMORY[0x24BDC4AF8](callbacks, refCon);
}

CFDictionaryRef CTRunGetAttributes(CTRunRef run)
{
  return (CFDictionaryRef)MEMORY[0x24BDC4B10](run);
}

CFIndex CTRunGetGlyphCount(CTRunRef run)
{
  return MEMORY[0x24BDC4B28](run);
}

void CTRunGetGlyphs(CTRunRef run, CFRange range, CGGlyph *buffer)
{
  MEMORY[0x24BDC4B30](run, range.location, range.length, buffer);
}

void CTRunGetPositions(CTRunRef run, CFRange range, CGPoint *buffer)
{
  MEMORY[0x24BDC4B48](run, range.location, range.length, buffer);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
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
  return (std::logic_error *)MEMORY[0x24BEDAA90](this, a2);
}

{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
  MEMORY[0x24BEDAC08](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add, __p_new_stuff);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC20](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x24BEDAC98](this, __n, __c);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x24BEDACE8](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

std::wstring *__cdecl std::wstring::erase(std::wstring *this, std::wstring::size_type __pos, std::wstring::size_type __n)
{
  return (std::wstring *)MEMORY[0x24BEDAD10](this, __pos, __n);
}

std::wstring *__cdecl std::wstring::append(std::wstring *this, const std::wstring::value_type *__s)
{
  return (std::wstring *)MEMORY[0x24BEDAD18](this, __s);
}

std::wstring *__cdecl std::wstring::append(std::wstring *this, const std::wstring::value_type *__s, std::wstring::size_type __n)
{
  return (std::wstring *)MEMORY[0x24BEDAD20](this, __s, __n);
}

std::wstring *__cdecl std::wstring::assign(std::wstring *this, const std::wstring::value_type *__s)
{
  return (std::wstring *)MEMORY[0x24BEDAD28](this, __s);
}

std::wstring *__cdecl std::wstring::assign(std::wstring *this, const std::wstring::value_type *__s, std::wstring::size_type __n)
{
  return (std::wstring *)MEMORY[0x24BEDAD30](this, __s, __n);
}

std::wstring *__cdecl std::wstring::insert(std::wstring *this, std::wstring::size_type __pos, const std::wstring::value_type *__s)
{
  return (std::wstring *)MEMORY[0x24BEDAD38](this, __pos, __s);
}

void std::wstring::resize(std::wstring *this, std::wstring::size_type __n, std::wstring::value_type __c)
{
  MEMORY[0x24BEDAD40](this, __n, *(_QWORD *)&__c);
}

void std::wstring::push_back(std::wstring *this, std::wstring::value_type __c)
{
  MEMORY[0x24BEDAD50](this, *(_QWORD *)&__c);
}

std::wstring *__cdecl std::wstring::basic_string(std::wstring *this, const std::wstring *__str)
{
  return (std::wstring *)MEMORY[0x24BEDAD58](this, __str);
}

std::wstring *__cdecl std::wstring::basic_string(std::wstring *this, const std::wstring *__str, std::wstring::size_type __pos, std::wstring::size_type __n, std::allocator<wchar_t> *__a)
{
  return (std::wstring *)MEMORY[0x24BEDAD60](this, __str, __pos, __n, __a);
}

void std::wstring::~wstring(std::wstring *this)
{
  MEMORY[0x24BEDAD68](this);
}

std::wstring *__cdecl std::wstring::operator=(std::wstring *this, const std::wstring *__str)
{
  return (std::wstring *)MEMORY[0x24BEDAD70](this, __str);
}

uint64_t std::istream::peek()
{
  return MEMORY[0x24BEDAE10]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x24BEDAE70]();
}

uint64_t std::istream::operator>>()
{
  return MEMORY[0x24BEDAE80]();
}

{
  return MEMORY[0x24BEDAE88]();
}

{
  return MEMORY[0x24BEDAEA0]();
}

{
  return MEMORY[0x24BEDAEA8]();
}

uint64_t std::wostream::put()
{
  return MEMORY[0x24BEDAF88]();
}

uint64_t std::wostream::flush()
{
  return MEMORY[0x24BEDAF90]();
}

uint64_t std::wostream::sentry::sentry()
{
  return MEMORY[0x24BEDAFA0]();
}

uint64_t std::wostream::sentry::~sentry()
{
  return MEMORY[0x24BEDAFA8]();
}

uint64_t std::wostream::~wostream()
{
  return MEMORY[0x24BEDAFB0]();
}

uint64_t std::wostream::operator<<()
{
  return MEMORY[0x24BEDAFB8]();
}

{
  return MEMORY[0x24BEDAFC0]();
}

{
  return MEMORY[0x24BEDAFC8]();
}

{
  return MEMORY[0x24BEDAFD0]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x24BEDB048]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x24BEDB050]();
}

uint64_t std::wstreambuf::basic_streambuf()
{
  return MEMORY[0x24BEDB058]();
}

uint64_t std::wstreambuf::~wstreambuf()
{
  return MEMORY[0x24BEDB060]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

uint64_t std::__sort<std::__less<unsigned int,unsigned int> &,unsigned int *>()
{
  return MEMORY[0x24BEDB3B8]();
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

uint64_t std::wios::~wios()
{
  return MEMORY[0x24BEDB5F0]();
}

void std::__throw_bad_alloc(void)
{
  MEMORY[0x24BEDB698]();
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_2511295F8(__p);
}

uint64_t operator delete()
{
  return off_251129600();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_251129608(__sz);
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  return (void *)off_251129610(__sz, a2);
}

uint64_t operator new()
{
  return off_251129618();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
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

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x24BEDB968](lpsrc, lpstype, lpdtype, s2d);
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

int atoi(const char *a1)
{
  return MEMORY[0x24BDAD258](a1);
}

void *__cdecl bsearch_b(const void *__key, const void *__base, size_t __nel, size_t __width, void *__compar)
{
  return (void *)MEMORY[0x24BDAD318](__key, __base, __nel, __width, __compar);
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

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
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

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3F0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF930](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x24BDAF938](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF940](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF958](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF960](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

long double tan(long double __x)
{
  long double result;

  MEMORY[0x24BDB0138](__x);
  return result;
}

size_t wcslen(const __int32 *a1)
{
  return MEMORY[0x24BDB04D0](a1);
}

__int32 *__cdecl wmemchr(__int32 *__s, __int32 __c, size_t __n)
{
  return (__int32 *)MEMORY[0x24BDB0518](__s, *(_QWORD *)&__c, __n);
}

int wmemcmp(const __int32 *a1, const __int32 *a2, size_t a3)
{
  return MEMORY[0x24BDB0520](a1, a2, a3);
}

xmlNodePtr xmlAddChild(xmlNodePtr parent, xmlNodePtr cur)
{
  return (xmlNodePtr)MEMORY[0x24BEDE5E8](parent, cur);
}

const xmlChar *__cdecl xmlBufferContent(const xmlBuffer *buf)
{
  return (const xmlChar *)MEMORY[0x24BEDE630](buf);
}

xmlBufferPtr xmlBufferCreate(void)
{
  return (xmlBufferPtr)MEMORY[0x24BEDE638]();
}

void xmlBufferFree(xmlBufferPtr buf)
{
  MEMORY[0x24BEDE650](buf);
}

xmlNodePtr xmlDocGetRootElement(const xmlDoc *doc)
{
  return (xmlNodePtr)MEMORY[0x24BEDE740](doc);
}

xmlNodePtr xmlDocSetRootElement(xmlDocPtr doc, xmlNodePtr root)
{
  return (xmlNodePtr)MEMORY[0x24BEDE748](doc, root);
}

void xmlFreeDoc(xmlDocPtr cur)
{
  MEMORY[0x24BEDE760](cur);
}

xmlExternalEntityLoader xmlGetExternalEntityLoader(void)
{
  return (xmlExternalEntityLoader)MEMORY[0x24BEDE7E0]();
}

int xmlIsBlankNode(const xmlNode *node)
{
  return MEMORY[0x24BEDE8D0](node);
}

int xmlKeepBlanksDefault(int val)
{
  return MEMORY[0x24BEDE8F8](*(_QWORD *)&val);
}

xmlNodePtr xmlNewCDataBlock(xmlDocPtr doc, const xmlChar *content, int len)
{
  return (xmlNodePtr)MEMORY[0x24BEDE940](doc, content, *(_QWORD *)&len);
}

xmlNodePtr xmlNewChild(xmlNodePtr parent, xmlNsPtr ns, const xmlChar *name, const xmlChar *content)
{
  return (xmlNodePtr)MEMORY[0x24BEDE948](parent, ns, name, content);
}

xmlDocPtr xmlNewDoc(const xmlChar *version)
{
  return (xmlDocPtr)MEMORY[0x24BEDE958](version);
}

xmlEntityPtr xmlNewEntity(xmlDocPtr doc, const xmlChar *name, int type, const xmlChar *ExternalID, const xmlChar *SystemID, const xmlChar *content)
{
  return (xmlEntityPtr)MEMORY[0x24BEDE990](doc, name, *(_QWORD *)&type, ExternalID, SystemID, content);
}

xmlNodePtr xmlNewNode(xmlNsPtr ns, const xmlChar *name)
{
  return (xmlNodePtr)MEMORY[0x24BEDE9A8](ns, name);
}

xmlAttrPtr xmlNewProp(xmlNodePtr node, const xmlChar *name, const xmlChar *value)
{
  return (xmlAttrPtr)MEMORY[0x24BEDE9C8](node, name, value);
}

int xmlNodeBufGetContent(xmlBufferPtr buffer, const xmlNode *cur)
{
  return MEMORY[0x24BEDEA30](buffer, cur);
}

int xmlNodeIsText(const xmlNode *node)
{
  return MEMORY[0x24BEDEA60](node);
}

xmlChar *__cdecl xmlNodeListGetString(xmlDocPtr doc, const xmlNode *list, int inLine)
{
  return (xmlChar *)MEMORY[0x24BEDEA68](doc, list, *(_QWORD *)&inLine);
}

xmlOutputBufferPtr xmlOutputBufferCreateIO(xmlOutputWriteCallback iowrite, xmlOutputCloseCallback ioclose, void *ioctx, xmlCharEncodingHandlerPtr encoder)
{
  return (xmlOutputBufferPtr)MEMORY[0x24BEDEA98](iowrite, ioclose, ioctx, encoder);
}

xmlEntityPtr xmlSAX2GetEntity(void *ctx, const xmlChar *name)
{
  return (xmlEntityPtr)MEMORY[0x24BEDEB30](ctx, name);
}

xmlDocPtr xmlSAXParseMemory(xmlSAXHandlerPtr sax, const char *buffer, int size, int recovery)
{
  return (xmlDocPtr)MEMORY[0x24BEDEB48](sax, buffer, *(_QWORD *)&size, *(_QWORD *)&recovery);
}

int xmlSAXVersion(xmlSAXHandler *hdlr, int version)
{
  return MEMORY[0x24BEDEB50](hdlr, *(_QWORD *)&version);
}

int xmlSaveFormatFileTo(xmlOutputBufferPtr buf, xmlDocPtr cur, const char *encoding, int format)
{
  return MEMORY[0x24BEDEB60](buf, cur, encoding, *(_QWORD *)&format);
}

xmlNsPtr xmlSearchNsByHref(xmlDocPtr doc, xmlNodePtr node, const xmlChar *href)
{
  return (xmlNsPtr)MEMORY[0x24BEDEBE0](doc, node, href);
}

void xmlSetExternalEntityLoader(xmlExternalEntityLoader f)
{
  MEMORY[0x24BEDEBF0](f);
}

int xmlSubstituteEntitiesDefault(int val)
{
  return MEMORY[0x24BEDECB0](*(_QWORD *)&val);
}

