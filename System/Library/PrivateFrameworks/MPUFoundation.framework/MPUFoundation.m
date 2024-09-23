BOOL MPUFloatEqualToFloat(double a1, double a2)
{
  return vabdd_f64(a2, a1) < 0.00000011920929;
}

id MPULocalizedString(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BDD1488];
  v2 = a1;
  objc_msgSend(v1, "mediaPlayerUIBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v2, &stru_24DD6E4D8, CFSTR("MediaPlayerUI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id _MPUHTMLStringFromXMLString(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (a2)
  {
    objc_msgSend(v3, "lowercaseString");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v3;
  }
  v6 = v5;

  return v6;
}

id _MPUHTMLDefaultDelegateFontByAddingTraits(void *a1, int a2, double a3)
{
  id v5;
  void *v6;
  void *v7;

  v5 = a1;
  objc_msgSend(v5, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v5, "symbolicTraits") | a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id MPUHTMLEscapedLyricsML(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BDBCF20];
  v2 = a1;
  objc_msgSend(v1, "setWithObjects:", CFSTR("b"), CFSTR("strong"), CFSTR("i"), CFSTR("em"), CFSTR("br"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _MPUHTMLEscapedLyricsML(v2, v3, &__block_literal_global);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id _MPUHTMLEscapedLyricsML(void *a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(id, id);
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;

  v5 = a1;
  v22 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v19, "mutableCopy");
  objc_msgSend(v8, "addCharactersInString:", CFSTR(">"));
  v20 = v7;
  v21 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v21, "addCharactersInString:", CFSTR(">"));
  objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCharactersToBeSkipped:", 0);
  v10 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  if ((objc_msgSend(v9, "isAtEnd") & 1) == 0)
  {
    do
    {
      v24 = 0;
      objc_msgSend(v9, "scanUpToString:intoString:", CFSTR("<"), &v24);
      v11 = v24;
      if (v11)
      {
        v6[2](v6, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "appendString:", v12);

      }
      v13 = objc_msgSend(v9, "scanLocation");
      v14 = 0;
      if (objc_msgSend(v9, "scanString:intoString:", CFSTR("<"), 0)
        && (v15 = objc_msgSend(v9, "scanString:intoString:", CFSTR("/"), 0),
            v23 = 0,
            objc_msgSend(v9, "scanUpToCharactersFromSet:intoString:", v8, &v23),
            v14 = v23,
            objc_msgSend(v22, "containsObject:", v14))
        && (objc_msgSend(v9, "scanUpToCharactersFromSet:intoString:", v21, 0),
            objc_msgSend(v9, "scanString:intoString:", CFSTR(">"), 0)))
      {
        objc_msgSend(v10, "appendString:", CFSTR("<"));
        if (v15)
          objc_msgSend(v10, "appendString:", CFSTR("/"));
        objc_msgSend(v10, "appendString:", v14);
        objc_msgSend(v10, "appendString:", CFSTR(">"));
      }
      else
      {
        objc_msgSend(v5, "substringWithRange:", v13, objc_msgSend(v9, "scanLocation") - v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        _MPUHTMLEscapedLyricsMLEntities(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "appendString:", v17);

      }
    }
    while (!objc_msgSend(v9, "isAtEnd"));
  }

  return v10;
}

id _MPUHTMLEscapedLyricsMLEntities(void *a1)
{
  void *v1;

  v1 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&"), CFSTR("&amp;"),
    0,
    0,
    objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("<"), CFSTR("&lt;"),
    0,
    0,
    objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR(">"), CFSTR("&gt;"),
    0,
    0,
    objc_msgSend(v1, "length"));
  return v1;
}

id MPUHTMLEscapedDescriptionML(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BDBCF20];
  v2 = a1;
  objc_msgSend(v1, "setWithObjects:", CFSTR("b"), CFSTR("strong"), CFSTR("i"), CFSTR("em"), CFSTR("br"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _MPUHTMLEscapedLyricsML(v2, v3, &__block_literal_global_171);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t _MPUHTMLParserStateStartElement(void *a1, const char *a2, uint64_t a3)
{
  return objc_msgSend(a1, "_startElement:attrs:", a2, a3);
}

uint64_t _MPUHTMLParserStateEndElement(void *a1, const char *a2)
{
  return objc_msgSend(a1, "_endElement:", a2);
}

uint64_t _MPUHTMLParserStateCharacters(void *a1, const char *a2, uint64_t a3)
{
  return objc_msgSend(a1, "_characters:length:", a2, a3);
}

xmlEntityPtr _MPUHTMLParserStateGetEntity(int a1, xmlChar *name)
{
  return xmlGetPredefinedEntity(name);
}

uint64_t _MPUHTMLParserStateError(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return objc_msgSend(a1, "_error:msg:args:", 1, a2, &a9);
}

uint64_t _MPUHTMLParserStateFatal(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return objc_msgSend(a1, "_error:msg:args:", 2, a2, &a9);
}

void sub_21A9B763C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_21A9B76C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21A9B792C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *__p,uint64_t a23)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

char *std::vector<MPU::LayoutInterpolator::EntriesContainer>::insert(uint64_t *a1, uint64_t a2, unint64_t a3)
{
  char *v4;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  uint64_t v21;

  v4 = (char *)a2;
  v7 = *a1;
  v6 = a1[1];
  v8 = (a2 - *a1) >> 5;
  v11 = a1[2];
  v9 = (uint64_t)(a1 + 2);
  v10 = v11;
  if (v6 >= v11)
  {
    v12 = ((uint64_t)(v6 - v7) >> 5) + 1;
    if (v12 >> 59)
      std::vector<MPU::LayoutInterpolator::Entry>::__throw_length_error[abi:ne180100]();
    v13 = v10 - v7;
    if (v13 >> 4 > v12)
      v12 = v13 >> 4;
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFE0)
      v14 = 0x7FFFFFFFFFFFFFFLL;
    else
      v14 = v12;
    v21 = v9;
    if (v14)
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MPU::LayoutInterpolator::EntriesContainer>>(v9, v14);
    else
      v15 = 0;
    v17 = v15;
    v18 = &v15[32 * v8];
    v19 = v18;
    v20 = &v15[32 * v14];
    std::__split_buffer<MPU::LayoutInterpolator::EntriesContainer>::push_back[abi:ne180100](&v17, a3);
    v4 = (char *)std::vector<MPU::LayoutInterpolator::EntriesContainer>::__swap_out_circular_buffer(a1, &v17, v4);
    std::__split_buffer<MPU::LayoutInterpolator::EntriesContainer>::~__split_buffer((uint64_t)&v17);
  }
  else if (a2 == v6)
  {
    std::vector<MPU::LayoutInterpolator::EntriesContainer>::__construct_one_at_end[abi:ne180100]<MPU::LayoutInterpolator::EntriesContainer const&>((uint64_t)a1, a3);
  }
  else
  {
    std::vector<MPU::LayoutInterpolator::EntriesContainer>::__move_range((uint64_t)a1, a2, v6, a2 + 32);
    if ((unint64_t)v4 <= a3)
      a3 += 32 * (a1[1] > a3);
    if (v4 != (char *)a3)
      std::vector<MPU::LayoutInterpolator::Entry>::__assign_with_size[abi:ne180100]<MPU::LayoutInterpolator::Entry*,MPU::LayoutInterpolator::Entry*>(v4, *(char **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 4);
    *(_QWORD *)(v7 + 32 * v8 + 24) = *(_QWORD *)(a3 + 24);
  }
  return v4;
}

void sub_21A9B7AAC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<MPU::LayoutInterpolator::EntriesContainer>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_21A9B7D84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

double MPULayoutInterpolatorScaledValueFromTraitEnvironment(void *a1, void *a2, double a3)
{
  id v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;

  v5 = a2;
  objc_msgSend(a1, "valueForReferenceMetric:", a3);
  v7 = v6;
  objc_msgSend(v5, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayScale");
  v10 = v9;

  v11 = MPUFloatRoundForScale(v7, v10);
  return v11;
}

void sub_21A9B7E78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21A9B823C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,void *__p,uint64_t a26,uint64_t a27,void *a28,uint64_t a29)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_21A9B8434(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  uint64_t v13;
  void *v15;

  if (__p)
    operator delete(__p);
  v15 = *(void **)v13;
  if (*(_QWORD *)v13)
  {
    *(_QWORD *)(v13 + 8) = v15;
    operator delete(v15);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<MPU::Point3D>::insert(uint64_t a1, char *__src, unint64_t a3)
{
  unint64_t v3;
  char *v4;
  char *v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  __int128 v12;
  char *v13;
  unint64_t v14;
  uint64_t v15;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  __int128 v20;
  __int128 v21;
  char *v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  uint64_t v26;
  __int128 v27;
  void *__p;
  char *v30;
  char *v31;
  char *v32;
  uint64_t v33;

  v3 = a3;
  v4 = __src;
  v6 = *(char **)(a1 + 8);
  v8 = a1 + 16;
  v7 = *(_QWORD *)(a1 + 16);
  if ((unint64_t)v6 >= v7)
  {
    v13 = *(char **)a1;
    v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v6[-*(_QWORD *)a1] >> 3) + 1;
    if (v14 > 0xAAAAAAAAAAAAAAALL)
      std::vector<MPU::LayoutInterpolator::Entry>::__throw_length_error[abi:ne180100]();
    v15 = __src - v13;
    v16 = 0xAAAAAAAAAAAAAAABLL * ((__src - v13) >> 3);
    v17 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - (_QWORD)v13) >> 3);
    if (2 * v17 > v14)
      v14 = 2 * v17;
    if (v17 >= 0x555555555555555)
      v18 = 0xAAAAAAAAAAAAAAALL;
    else
      v18 = v14;
    v33 = a1 + 16;
    if (v18)
      v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MPU::Point3D>>(a1 + 16, v18);
    else
      v19 = 0;
    v22 = &v19[24 * v16];
    __p = v19;
    v30 = v22;
    v31 = v22;
    v32 = &v19[24 * v18];
    if (v16 == v18)
    {
      if (v15 < 1)
      {
        if (v13 == v4)
          v24 = 1;
        else
          v24 = 2 * v16;
        v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MPU::Point3D>>(v8, v24);
        v22 = &v25[24 * (v24 >> 2)];
        __p = v25;
        v30 = v22;
        v32 = &v25[24 * v26];
        if (v19)
          operator delete(v19);
      }
      else
      {
        v23 = v16 + 2;
        if (v16 >= -1)
          v23 = v16 + 1;
        v22 -= 24 * (v23 >> 1);
        v30 = v22;
      }
    }
    v27 = *(_OWORD *)v3;
    *((_QWORD *)v22 + 2) = *(_QWORD *)(v3 + 16);
    *(_OWORD *)v22 = v27;
    v31 = v22 + 24;
    v4 = (char *)std::vector<MPU::Point3D>::__swap_out_circular_buffer((void **)a1, (uint64_t)&__p, v4);
    if (v31 != v30)
      v31 = &v30[(v31 - v30 - 24) % 0x18uLL];
    if (__p)
      operator delete(__p);
  }
  else if (__src == v6)
  {
    v21 = *(_OWORD *)a3;
    *((_QWORD *)__src + 2) = *(_QWORD *)(a3 + 16);
    *(_OWORD *)__src = v21;
    *(_QWORD *)(a1 + 8) = __src + 24;
  }
  else
  {
    v9 = __src + 24;
    v10 = v6 - 24;
    v11 = *(_QWORD *)(a1 + 8);
    while (v10 < v6)
    {
      v12 = *(_OWORD *)v10;
      *(_QWORD *)(v11 + 16) = *((_QWORD *)v10 + 2);
      *(_OWORD *)v11 = v12;
      v11 += 24;
      v10 += 24;
    }
    *(_QWORD *)(a1 + 8) = v11;
    if (v6 != v9)
      memmove(__src + 24, __src, v6 - v9);
    if ((unint64_t)v4 <= v3)
      v3 += 24 * (*(_QWORD *)(a1 + 8) > v3);
    v20 = *(_OWORD *)v3;
    *((_QWORD *)v4 + 2) = *(_QWORD *)(v3 + 16);
    *(_OWORD *)v4 = v20;
  }
  return v4;
}

void sub_21A9B86DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::string::basic_string[abi:ne180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
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

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24DD6DB70, MEMORY[0x24BEDAAF0]);
}

void sub_21A9B88BC(_Unwind_Exception *a1)
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

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void std::vector<MPU::LayoutInterpolator::EntriesContainer>::__assign_with_size[abi:ne180100]<MPU::LayoutInterpolator::EntriesContainer*,MPU::LayoutInterpolator::EntriesContainer*>(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  char v23;

  v8 = a1 + 16;
  v9 = *(_QWORD *)a1;
  if (a4 > (uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 5)
  {
    std::vector<MPU::LayoutInterpolator::EntriesContainer>::__vdeallocate((uint64_t *)a1);
    if (a4 >> 59)
      std::vector<MPU::LayoutInterpolator::Entry>::__throw_length_error[abi:ne180100]();
    v10 = *(_QWORD *)(a1 + 16) - *(_QWORD *)a1;
    v11 = v10 >> 4;
    if (v10 >> 4 <= a4)
      v11 = a4;
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFE0)
      v12 = 0x7FFFFFFFFFFFFFFLL;
    else
      v12 = v11;
    std::vector<MPU::LayoutInterpolator::EntriesContainer>::__vallocate[abi:ne180100]((_QWORD *)a1, v12);
    v13 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<MPU::LayoutInterpolator::EntriesContainer>,MPU::LayoutInterpolator::EntriesContainer*,MPU::LayoutInterpolator::EntriesContainer*,MPU::LayoutInterpolator::EntriesContainer*>(v8, a2, a3, *(_QWORD **)(a1 + 8));
    goto LABEL_11;
  }
  v14 = (*(_QWORD *)(a1 + 8) - v9) >> 5;
  if (v14 < a4)
  {
    v15 = a2 + 32 * v14;
    std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<MPU::LayoutInterpolator::EntriesContainer *,MPU::LayoutInterpolator::EntriesContainer *,MPU::LayoutInterpolator::EntriesContainer *>((int)&v22, a2, v15, v9);
    v13 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<MPU::LayoutInterpolator::EntriesContainer>,MPU::LayoutInterpolator::EntriesContainer*,MPU::LayoutInterpolator::EntriesContainer*,MPU::LayoutInterpolator::EntriesContainer*>(v8, v15, a3, *(_QWORD **)(a1 + 8));
LABEL_11:
    *(_QWORD *)(a1 + 8) = v13;
    return;
  }
  std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<MPU::LayoutInterpolator::EntriesContainer *,MPU::LayoutInterpolator::EntriesContainer *,MPU::LayoutInterpolator::EntriesContainer *>((int)&v23, a2, a3, v9);
  v17 = v16;
  v18 = *(_QWORD *)(a1 + 8);
  if (v18 != v16)
  {
    v19 = *(_QWORD *)(a1 + 8);
    do
    {
      v21 = *(void **)(v19 - 32);
      v19 -= 32;
      v20 = v21;
      if (v21)
      {
        *(_QWORD *)(v18 - 24) = v20;
        operator delete(v20);
      }
      v18 = v19;
    }
    while (v19 != v17);
  }
  *(_QWORD *)(a1 + 8) = v17;
}

void sub_21A9B8A74(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_21A9B8A7C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void std::vector<MPU::LayoutInterpolator::EntriesContainer>::__vdeallocate(uint64_t *a1)
{
  if (*a1)
  {
    std::vector<MPU::LayoutInterpolator::EntriesContainer>::__clear[abi:ne180100](a1);
    operator delete((void *)*a1);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

char *std::vector<MPU::LayoutInterpolator::EntriesContainer>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 59)
    std::vector<MPU::LayoutInterpolator::Entry>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MPU::LayoutInterpolator::EntriesContainer>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[32 * v4];
  return result;
}

_QWORD *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<MPU::LayoutInterpolator::EntriesContainer>,MPU::LayoutInterpolator::EntriesContainer*,MPU::LayoutInterpolator::EntriesContainer*,MPU::LayoutInterpolator::EntriesContainer*>(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  _QWORD *v4;
  uint64_t v6;
  _QWORD v8[3];
  char v9;
  _QWORD *v10;
  _QWORD *v11;

  v4 = a4;
  v10 = a4;
  v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  v9 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      *v4 = 0;
      v4[1] = 0;
      v4[2] = 0;
      std::vector<MPU::LayoutInterpolator::Entry>::__init_with_size[abi:ne180100]<MPU::LayoutInterpolator::Entry*,MPU::LayoutInterpolator::Entry*>(v4, *(const void **)v6, *(_QWORD *)(v6 + 8), (uint64_t)(*(_QWORD *)(v6 + 8) - *(_QWORD *)v6) >> 4);
      v4[3] = *(_QWORD *)(v6 + 24);
      v4 = v11 + 4;
      v11 += 4;
      v6 += 32;
    }
    while (v6 != a3);
  }
  v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<MPU::LayoutInterpolator::EntriesContainer>,MPU::LayoutInterpolator::EntriesContainer*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

void sub_21A9B8BA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<MPU::LayoutInterpolator::EntriesContainer>,MPU::LayoutInterpolator::EntriesContainer*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<MPU::LayoutInterpolator::Entry>::__init_with_size[abi:ne180100]<MPU::LayoutInterpolator::Entry*,MPU::LayoutInterpolator::Entry*>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<MPU::LayoutInterpolator::Entry>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_21A9B8C10(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<MPU::LayoutInterpolator::Entry>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 60)
    std::vector<MPU::LayoutInterpolator::Entry>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MPU::LayoutInterpolator::Entry>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void std::vector<MPU::LayoutInterpolator::Entry>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<MPU::LayoutInterpolator::Entry>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(16 * a2);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<MPU::LayoutInterpolator::EntriesContainer>,MPU::LayoutInterpolator::EntriesContainer*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<MPU::LayoutInterpolator::EntriesContainer>,MPU::LayoutInterpolator::EntriesContainer*>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<MPU::LayoutInterpolator::EntriesContainer>,MPU::LayoutInterpolator::EntriesContainer*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v1 = **(_QWORD **)(a1 + 16);
  v2 = **(_QWORD **)(a1 + 8);
  if (v1 != v2)
  {
    v3 = **(_QWORD **)(a1 + 16);
    do
    {
      v5 = *(void **)(v3 - 32);
      v3 -= 32;
      v4 = v5;
      if (v5)
      {
        *(_QWORD *)(v1 - 24) = v4;
        operator delete(v4);
      }
      v1 = v3;
    }
    while (v3 != v2);
  }
}

uint64_t std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<MPU::LayoutInterpolator::EntriesContainer *,MPU::LayoutInterpolator::EntriesContainer *,MPU::LayoutInterpolator::EntriesContainer *>(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;

  v5 = a2;
  if (a2 != a3)
  {
    do
    {
      if (v5 != a4)
        std::vector<MPU::LayoutInterpolator::Entry>::__assign_with_size[abi:ne180100]<MPU::LayoutInterpolator::Entry*,MPU::LayoutInterpolator::Entry*>((char *)a4, *(char **)v5, *(_QWORD *)(v5 + 8), (uint64_t)(*(_QWORD *)(v5 + 8) - *(_QWORD *)v5) >> 4);
      *(_QWORD *)(a4 + 24) = *(_QWORD *)(v5 + 24);
      v5 += 32;
      a4 += 32;
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

char *std::vector<MPU::LayoutInterpolator::Entry>::__assign_with_size[abi:ne180100]<MPU::LayoutInterpolator::Entry*,MPU::LayoutInterpolator::Entry*>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  void **v12;
  char *v13;
  _BYTE *v14;
  unint64_t v15;
  char *v16;
  size_t v17;
  void *v18;
  char *v19;

  v7 = result;
  v8 = *((_QWORD *)result + 2);
  v9 = *(char **)result;
  if (a4 > (v8 - *(_QWORD *)result) >> 4)
  {
    if (v9)
    {
      *((_QWORD *)result + 1) = v9;
      operator delete(v9);
      v8 = 0;
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 60)
      std::vector<MPU::LayoutInterpolator::Entry>::__throw_length_error[abi:ne180100]();
    v10 = v8 >> 3;
    if (v8 >> 3 <= a4)
      v10 = a4;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0)
      v11 = 0xFFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = std::vector<MPU::LayoutInterpolator::Entry>::__vallocate[abi:ne180100](v7, v11);
    v13 = (char *)v7[1];
    v12 = (void **)(v7 + 1);
    v9 = v13;
LABEL_16:
    v17 = a3 - (_QWORD)__src;
    if (v17)
    {
      v18 = v9;
      v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v12 = (void **)(result + 8);
  v14 = (_BYTE *)*((_QWORD *)result + 1);
  v15 = (v14 - v9) >> 4;
  if (v15 >= a4)
    goto LABEL_16;
  v16 = &__src[16 * v15];
  if (v14 != v9)
  {
    result = (char *)memmove(*(void **)result, __src, v14 - v9);
    v9 = (char *)*v12;
  }
  v17 = a3 - (_QWORD)v16;
  if (v17)
  {
    v18 = v9;
    v19 = v16;
LABEL_18:
    result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *v12 = &v9[v17];
  return result;
}

void std::vector<MPU::LayoutInterpolator::EntriesContainer>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = *a1;
  v2 = a1[1];
  if (v2 != *a1)
  {
    v4 = a1[1];
    do
    {
      v6 = *(void **)(v4 - 32);
      v4 -= 32;
      v5 = v6;
      if (v6)
      {
        *(_QWORD *)(v2 - 24) = v5;
        operator delete(v5);
      }
      v2 = v4;
    }
    while (v4 != v3);
  }
  a1[1] = v3;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<MPU::LayoutInterpolator::EntriesContainer>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(32 * a2);
}

double std::vector<MPU::LayoutInterpolator::EntriesContainer>::__construct_one_at_end[abi:ne180100]<MPU::LayoutInterpolator::EntriesContainer const&>(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  double result;

  v4 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)v4 = 0;
  *(_QWORD *)(v4 + 8) = 0;
  *(_QWORD *)(v4 + 16) = 0;
  std::vector<MPU::LayoutInterpolator::Entry>::__init_with_size[abi:ne180100]<MPU::LayoutInterpolator::Entry*,MPU::LayoutInterpolator::Entry*>((_QWORD *)v4, *(const void **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 4);
  result = *(double *)(a2 + 24);
  *(double *)(v4 + 24) = result;
  *(_QWORD *)(a1 + 8) = v4 + 32;
  return result;
}

void sub_21A9B8F94(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<MPU::LayoutInterpolator::EntriesContainer>::__move_range(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  unint64_t v9;

  v6 = *(_QWORD *)(a1 + 8);
  v7 = a2 + v6 - a4;
  v8 = (_QWORD *)v6;
  if (v7 < a3)
  {
    v9 = v7;
    v8 = *(_QWORD **)(a1 + 8);
    do
    {
      *v8 = 0;
      v8[1] = 0;
      v8[2] = 0;
      *(_OWORD *)v8 = *(_OWORD *)v9;
      v8[2] = *(_QWORD *)(v9 + 16);
      *(_QWORD *)v9 = 0;
      *(_QWORD *)(v9 + 8) = 0;
      *(_QWORD *)(v9 + 16) = 0;
      v8[3] = *(_QWORD *)(v9 + 24);
      v8 += 4;
      v9 += 32;
    }
    while (v9 < a3);
  }
  *(_QWORD *)(a1 + 8) = v8;
  return std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_backward_loop<std::_ClassicAlgPolicy>,std::__move_backward_trivial>,MPU::LayoutInterpolator::EntriesContainer *,MPU::LayoutInterpolator::EntriesContainer *,MPU::LayoutInterpolator::EntriesContainer *,0>(a2, v7, v6);
}

double std::__split_buffer<MPU::LayoutInterpolator::EntriesContainer>::push_back[abi:ne180100](_QWORD *a1, uint64_t a2)
{
  __n128 *v4;
  __n128 *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  __n128 *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  unint64_t v21;
  unint64_t v22;
  char *v23;
  char *v24;
  int64x2_t v25;
  uint64_t v26;
  double result;
  uint64_t v28;
  int64x2_t v29;
  uint64_t v30;
  uint64_t v31;

  v4 = (__n128 *)a1[2];
  if (v4 == (__n128 *)a1[3])
  {
    v6 = *a1;
    v5 = (__n128 *)a1[1];
    v7 = (uint64_t)v5 - *a1;
    if ((unint64_t)v5 <= *a1)
    {
      v15 = (uint64_t)v4 - v6;
      v14 = v15 == 0;
      v16 = v15 >> 4;
      if (v14)
        v17 = 1;
      else
        v17 = v16;
      v31 = a1[4];
      v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MPU::LayoutInterpolator::EntriesContainer>>(v31, v17);
      v20 = &v18[32 * (v17 >> 2)];
      v21 = a1[1];
      v22 = a1[2] - v21;
      if (v22)
      {
        v23 = &v20[v22];
        v24 = &v18[32 * (v17 >> 2)];
        do
        {
          *(_QWORD *)v24 = 0;
          *((_QWORD *)v24 + 1) = 0;
          *((_QWORD *)v24 + 2) = 0;
          *(_OWORD *)v24 = *(_OWORD *)v21;
          *((_QWORD *)v24 + 2) = *(_QWORD *)(v21 + 16);
          *(_QWORD *)v21 = 0;
          *(_QWORD *)(v21 + 8) = 0;
          *(_QWORD *)(v21 + 16) = 0;
          *((_QWORD *)v24 + 3) = *(_QWORD *)(v21 + 24);
          v24 += 32;
          v21 += 32;
        }
        while (v24 != v23);
        v25 = *(int64x2_t *)(a1 + 1);
      }
      else
      {
        v25 = vdupq_n_s64(v21);
        v23 = &v18[32 * (v17 >> 2)];
      }
      v28 = *a1;
      *a1 = v18;
      a1[1] = v20;
      v29 = v25;
      v26 = a1[3];
      a1[2] = v23;
      a1[3] = &v18[32 * v19];
      v30 = v26;
      std::__split_buffer<MPU::LayoutInterpolator::EntriesContainer>::~__split_buffer((uint64_t)&v28);
      v4 = (__n128 *)a1[2];
    }
    else
    {
      v8 = v7 >> 5;
      v9 = v7 >> 5 < -1;
      v10 = (v7 >> 5) + 2;
      if (v9)
        v11 = v10;
      else
        v11 = v8 + 1;
      v12 = v11 >> 1;
      std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,MPU::LayoutInterpolator::EntriesContainer *,MPU::LayoutInterpolator::EntriesContainer *,MPU::LayoutInterpolator::EntriesContainer *,0>(v5, v4, (uint64_t)&v5[-2 * (v11 >> 1)]);
      v4 = v13;
      a1[1] -= 32 * v12;
      a1[2] = v13;
    }
  }
  v4->n128_u64[0] = 0;
  v4->n128_u64[1] = 0;
  v4[1].n128_u64[0] = 0;
  std::vector<MPU::LayoutInterpolator::Entry>::__init_with_size[abi:ne180100]<MPU::LayoutInterpolator::Entry*,MPU::LayoutInterpolator::Entry*>(v4, *(const void **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 4);
  result = *(double *)(a2 + 24);
  v4[1].n128_f64[1] = result;
  a1[2] += 32;
  return result;
}

uint64_t std::vector<MPU::LayoutInterpolator::EntriesContainer>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a2[1];
  v7 = (uint64_t)(a1 + 2);
  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<MPU::LayoutInterpolator::EntriesContainer>,std::reverse_iterator<MPU::LayoutInterpolator::EntriesContainer*>,std::reverse_iterator<MPU::LayoutInterpolator::EntriesContainer*>,std::reverse_iterator<MPU::LayoutInterpolator::EntriesContainer*>>((uint64_t)(a1 + 2), (uint64_t)a3, a3, *a1, (_QWORD *)*a1, v6, v6);
  a2[1] = v8;
  a2[2] = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<MPU::LayoutInterpolator::EntriesContainer>,MPU::LayoutInterpolator::EntriesContainer*,MPU::LayoutInterpolator::EntriesContainer*,MPU::LayoutInterpolator::EntriesContainer*>(v7, (uint64_t)a3, a1[1], (_QWORD *)a2[2]);
  v9 = *a1;
  *a1 = a2[1];
  a2[1] = v9;
  v10 = a1[1];
  a1[1] = a2[2];
  a2[2] = v10;
  v11 = a1[2];
  a1[2] = a2[3];
  a2[3] = v11;
  *a2 = a2[1];
  return v6;
}

uint64_t std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_backward_loop<std::_ClassicAlgPolicy>,std::__move_backward_trivial>,MPU::LayoutInterpolator::EntriesContainer *,MPU::LayoutInterpolator::EntriesContainer *,MPU::LayoutInterpolator::EntriesContainer *,0>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  if (a2 != a1)
  {
    v6 = a2;
    do
    {
      std::vector<MPU::LayoutInterpolator::Entry>::__move_assign(a3 - 32, (__n128 *)(v6 - 32));
      *(_QWORD *)(a3 - 8) = *(_QWORD *)(v6 - 8);
      a3 -= 32;
      v6 -= 32;
    }
    while (v6 != a1);
  }
  return a2;
}

__n128 std::vector<MPU::LayoutInterpolator::Entry>::__move_assign(uint64_t a1, __n128 *a2)
{
  void *v4;
  __n128 result;

  v4 = *(void **)a1;
  if (v4)
  {
    *(_QWORD *)(a1 + 8) = v4;
    operator delete(v4);
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
  }
  result = *a2;
  *(__n128 *)a1 = *a2;
  *(_QWORD *)(a1 + 16) = a2[1].n128_u64[0];
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  a2[1].n128_u64[0] = 0;
  return result;
}

__n128 *std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,MPU::LayoutInterpolator::EntriesContainer *,MPU::LayoutInterpolator::EntriesContainer *,MPU::LayoutInterpolator::EntriesContainer *,0>(__n128 *a1, __n128 *a2, uint64_t a3)
{
  __n128 *v4;
  __n128 *v5;

  v4 = a1;
  if (a1 == a2)
    return a1;
  v5 = a2;
  do
  {
    std::vector<MPU::LayoutInterpolator::Entry>::__move_assign(a3, v4);
    *(_QWORD *)(a3 + 24) = v4[1].n128_u64[1];
    a3 += 32;
    v4 += 2;
  }
  while (v4 != v5);
  return v5;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<MPU::LayoutInterpolator::EntriesContainer>,std::reverse_iterator<MPU::LayoutInterpolator::EntriesContainer*>,std::reverse_iterator<MPU::LayoutInterpolator::EntriesContainer*>,std::reverse_iterator<MPU::LayoutInterpolator::EntriesContainer*>>(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  _QWORD v11[3];
  char v12;
  __int128 v13;
  __int128 v14;

  v7 = a7;
  *(_QWORD *)&v14 = a6;
  *((_QWORD *)&v14 + 1) = a7;
  v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    v9 = a6;
  }
  else
  {
    do
    {
      *(_QWORD *)(v7 - 32) = 0;
      *(_QWORD *)(v7 - 24) = 0;
      *(_QWORD *)(v7 - 16) = 0;
      v8 = *((_OWORD *)a3 - 2);
      a3 -= 4;
      *(_OWORD *)(v7 - 32) = v8;
      *(_QWORD *)(v7 - 16) = a3[2];
      a3[1] = 0;
      a3[2] = 0;
      *a3 = 0;
      *(_QWORD *)(v7 - 8) = a3[3];
      v7 = *((_QWORD *)&v14 + 1) - 32;
      *((_QWORD *)&v14 + 1) -= 32;
    }
    while (a3 != a5);
    v9 = v14;
  }
  v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<MPU::LayoutInterpolator::EntriesContainer>,std::reverse_iterator<MPU::LayoutInterpolator::EntriesContainer*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

_QWORD *std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<MPU::LayoutInterpolator::EntriesContainer>,MPU::LayoutInterpolator::EntriesContainer*,MPU::LayoutInterpolator::EntriesContainer*,MPU::LayoutInterpolator::EntriesContainer*>(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  _QWORD *v4;
  _QWORD v6[3];
  char v7;
  _QWORD *v8;
  _QWORD *v9;

  v4 = a4;
  v9 = a4;
  v8 = a4;
  v6[0] = a1;
  v6[1] = &v8;
  v6[2] = &v9;
  if (a2 != a3)
  {
    do
    {
      *v4 = 0;
      v4[1] = 0;
      v4[2] = 0;
      *(_OWORD *)v4 = *(_OWORD *)a2;
      v4[2] = *(_QWORD *)(a2 + 16);
      *(_QWORD *)a2 = 0;
      *(_QWORD *)(a2 + 8) = 0;
      *(_QWORD *)(a2 + 16) = 0;
      v4[3] = *(_QWORD *)(a2 + 24);
      v4 += 4;
      a2 += 32;
    }
    while (a2 != a3);
    v9 = v4;
  }
  v7 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<MPU::LayoutInterpolator::EntriesContainer>,MPU::LayoutInterpolator::EntriesContainer*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v6);
  return v4;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<MPU::LayoutInterpolator::EntriesContainer>,std::reverse_iterator<MPU::LayoutInterpolator::EntriesContainer*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<MPU::LayoutInterpolator::EntriesContainer>,std::reverse_iterator<MPU::LayoutInterpolator::EntriesContainer*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<MPU::LayoutInterpolator::EntriesContainer>,std::reverse_iterator<MPU::LayoutInterpolator::EntriesContainer*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    v3 = *(void **)v1;
    if (*(_QWORD *)v1)
    {
      *(_QWORD *)(v1 + 8) = v3;
      operator delete(v3);
    }
    v1 += 32;
  }
}

uint64_t std::__split_buffer<MPU::LayoutInterpolator::EntriesContainer>::~__split_buffer(uint64_t a1)
{
  std::__split_buffer<MPU::LayoutInterpolator::EntriesContainer>::__destruct_at_end[abi:ne180100](a1, *(_QWORD *)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__split_buffer<MPU::LayoutInterpolator::EntriesContainer>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v5;

  v2 = *(_QWORD *)(a1 + 16);
  while (v2 != a2)
  {
    v5 = *(void **)(v2 - 32);
    *(_QWORD *)(a1 + 16) = v2 - 32;
    if (v5)
    {
      *(_QWORD *)(v2 - 24) = v5;
      operator delete(v5);
      v2 = *(_QWORD *)(a1 + 16);
    }
    else
    {
      v2 -= 32;
    }
  }
}

void *std::vector<MPU::Point3D>::__swap_out_circular_buffer(void **a1, uint64_t a2, char *__src)
{
  void *v5;
  char *v6;
  void *v7;
  char *v8;
  uint64_t v9;
  __int128 v10;
  _BYTE *v11;
  uint64_t v12;
  int64_t v13;
  char *v14;
  void *v15;
  void *v16;

  v5 = *(void **)(a2 + 8);
  v6 = (char *)*a1;
  v7 = v5;
  if (*a1 != __src)
  {
    v8 = __src;
    v9 = *(_QWORD *)(a2 + 8);
    do
    {
      v10 = *(_OWORD *)(v8 - 24);
      v7 = (void *)(v9 - 24);
      *(_QWORD *)(v9 - 8) = *((_QWORD *)v8 - 1);
      *(_OWORD *)(v9 - 24) = v10;
      v8 -= 24;
      v9 -= 24;
    }
    while (v8 != v6);
  }
  *(_QWORD *)(a2 + 8) = v7;
  v11 = a1[1];
  v12 = *(_QWORD *)(a2 + 16);
  v13 = v11 - __src;
  if (v11 != __src)
  {
    memmove(*(void **)(a2 + 16), __src, v11 - __src);
    v7 = *(void **)(a2 + 8);
  }
  *(_QWORD *)(a2 + 16) = v12 + v13;
  v14 = (char *)*a1;
  *a1 = v7;
  *(_QWORD *)(a2 + 8) = v14;
  v15 = a1[1];
  a1[1] = *(void **)(a2 + 16);
  *(_QWORD *)(a2 + 16) = v15;
  v16 = a1[2];
  a1[2] = *(void **)(a2 + 24);
  *(_QWORD *)(a2 + 24) = v16;
  *(_QWORD *)a2 = *(_QWORD *)(a2 + 8);
  return v5;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<MPU::Point3D>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(24 * a2);
}

LABEL_1:
  v10 = a1;
  while (2)
  {
    a1 = v10;
    v11 = a2 - v10;
    v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a2 - v10) >> 3);
    switch(v12)
    {
      case 0:
      case 1:
        return;
      case 2:
        v61 = *(double *)(a2 - 24);
        v62 = *(double *)(a2 - 16);
        v60 = a2 - 24;
        v63 = a3[1];
        if ((v63 - v62) * (v63 - v62) + (*a3 - v61) * (*a3 - v61) < (v63 - *(double *)(v10 + 8))
                                                                   * (v63 - *(double *)(v10 + 8))
                                                                   + (*a3 - *(double *)v10) * (*a3 - *(double *)v10))
        {
          v129 = *(_QWORD *)(v10 + 16);
          v124 = *(_OWORD *)v10;
          v64 = *(_OWORD *)v60;
          *(_QWORD *)(v10 + 16) = *(_QWORD *)(v60 + 16);
          *(_OWORD *)v10 = v64;
          *(_QWORD *)(v60 + 16) = v129;
          *(_OWORD *)v60 = v124;
        }
        return;
      case 3:
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MPULayoutInterpolator _sortPointsFor3DInterpolation:usingQueriedPoint:]::$_4 &,MPU::Point3D *>((__int128 *)v10, (double *)(v10 + 24), (double *)(a2 - 24), a3);
        return;
      case 4:
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[MPULayoutInterpolator _sortPointsFor3DInterpolation:usingQueriedPoint:]::$_4 &,MPU::Point3D *>(v10, v10 + 24, v10 + 48, a2 - 24, a3);
        return;
      case 5:
        std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,-[MPULayoutInterpolator _sortPointsFor3DInterpolation:usingQueriedPoint:]::$_4 &,MPU::Point3D *,0>((__n128 *)v10, (__n128 *)(v10 + 24), (__n128 *)(v10 + 48), (__n128 *)(v10 + 72), (__n128 *)(a2 - 24), a3);
        return;
      default:
        if (v11 <= 575)
        {
          if ((a5 & 1) != 0)
          {
            if (v10 != a2)
            {
              v65 = v10 + 24;
              if (v10 + 24 != a2)
              {
                v66 = 0;
                v67 = *a3;
                v68 = v10;
                do
                {
                  v69 = v65;
                  v70 = *(double *)(v68 + 24);
                  v71 = *(double *)(v68 + 32);
                  if ((a3[1] - v71) * (a3[1] - v71) + (v67 - v70) * (v67 - v70) < (a3[1] - *(double *)(v68 + 8))
                                                                                 * (a3[1] - *(double *)(v68 + 8))
                                                                                 + (v67 - *(double *)v68)
                                                                                 * (v67 - *(double *)v68))
                  {
                    v72 = *(_QWORD *)(v68 + 40);
                    v73 = v66;
                    while (1)
                    {
                      v74 = v10 + v73;
                      *(_OWORD *)(v74 + 24) = *(_OWORD *)(v10 + v73);
                      *(_QWORD *)(v74 + 40) = *(_QWORD *)(v10 + v73 + 16);
                      if (!v73)
                        break;
                      v75 = a3[1];
                      v73 -= 24;
                      if ((v75 - v71) * (v75 - v71) + (*a3 - v70) * (*a3 - v70) >= (v75 - *(double *)(v74 - 16))
                                                                                  * (v75 - *(double *)(v74 - 16))
                                                                                  + (*a3 - *(double *)(v74 - 24))
                                                                                  * (*a3 - *(double *)(v74 - 24)))
                      {
                        v76 = v10 + v73 + 24;
                        goto LABEL_67;
                      }
                    }
                    v76 = v10;
LABEL_67:
                    *(double *)v76 = v70;
                    *(double *)(v76 + 8) = v71;
                    *(_QWORD *)(v76 + 16) = v72;
                    v67 = *a3;
                  }
                  v65 = v69 + 24;
                  v66 += 24;
                  v68 = v69;
                }
                while (v69 + 24 != a2);
              }
            }
          }
          else if (v10 != a2)
          {
            v113 = v10 + 24;
            if (v10 + 24 != a2)
            {
              v114 = *a3;
              do
              {
                v115 = v113;
                v116 = *(double *)(a1 + 24);
                v117 = *(double *)(a1 + 32);
                if ((a3[1] - v117) * (a3[1] - v117) + (v114 - v116) * (v114 - v116) < (a3[1] - *(double *)(a1 + 8))
                                                                                     * (a3[1] - *(double *)(a1 + 8))
                                                                                     + (v114 - *(double *)a1)
                                                                                     * (v114 - *(double *)a1))
                {
                  v118 = *(_QWORD *)(a1 + 40);
                  do
                  {
                    *(_OWORD *)v113 = *(_OWORD *)(v113 - 24);
                    *(_QWORD *)(v113 + 16) = *(_QWORD *)(v113 - 8);
                    v119 = *(double *)(v113 - 48);
                    v120 = *(double *)(v113 - 40);
                    v113 -= 24;
                  }
                  while ((a3[1] - v117) * (a3[1] - v117) + (*a3 - v116) * (*a3 - v116) < (a3[1] - v120)
                                                                                        * (a3[1] - v120)
                                                                                        + (*a3 - v119) * (*a3 - v119));
                  *(double *)v113 = v116;
                  *(double *)(v113 + 8) = v117;
                  *(_QWORD *)(v113 + 16) = v118;
                  v114 = *a3;
                }
                v113 = v115 + 24;
                a1 = v115;
              }
              while (v115 + 24 != a2);
            }
          }
          return;
        }
        if (!a4)
        {
          if (v10 != a2)
          {
            v77 = (unint64_t)(v12 - 2) >> 1;
            v78 = v77;
            do
            {
              v79 = v78;
              if (v77 >= v78)
              {
                v80 = (2 * v78) | 1;
                v81 = v10 + 24 * v80;
                v82 = *a3;
                if (2 * v79 + 2 >= v12)
                {
                  v83 = a3[1];
                }
                else
                {
                  v83 = a3[1];
                  if ((v83 - *(double *)(v81 + 8)) * (v83 - *(double *)(v81 + 8))
                     + (v82 - *(double *)v81) * (v82 - *(double *)v81) < (v83 - *(double *)(v81 + 32))
                                                                       * (v83 - *(double *)(v81 + 32))
                                                                       + (v82 - *(double *)(v81 + 24))
                                                                       * (v82 - *(double *)(v81 + 24)))
                  {
                    v81 += 24;
                    v80 = 2 * v79 + 2;
                  }
                }
                v84 = v10 + 24 * v79;
                v85 = *(double *)v84;
                v86 = *(_OWORD *)(v84 + 8);
                if ((v83 - *(double *)(v81 + 8)) * (v83 - *(double *)(v81 + 8))
                   + (v82 - *(double *)v81) * (v82 - *(double *)v81) >= (v83 - *(double *)&v86)
                                                                      * (v83 - *(double *)&v86)
                                                                      + (v82 - *(double *)v84) * (v82 - *(double *)v84))
                {
                  do
                  {
                    v87 = v81;
                    v88 = *(_OWORD *)v81;
                    *(_QWORD *)(v84 + 16) = *(_QWORD *)(v81 + 16);
                    *(_OWORD *)v84 = v88;
                    if (v77 < v80)
                      break;
                    v89 = 2 * v80;
                    v80 = (2 * v80) | 1;
                    v81 = v10 + 24 * v80;
                    v90 = v89 + 2;
                    v91 = *a3;
                    v92 = a3[1];
                    if (v90 < v12
                      && (v92 - *(double *)(v81 + 8)) * (v92 - *(double *)(v81 + 8))
                       + (v91 - *(double *)v81) * (v91 - *(double *)v81) < (v92 - *(double *)(v81 + 32))
                                                                         * (v92 - *(double *)(v81 + 32))
                                                                         + (v91 - *(double *)(v81 + 24))
                                                                         * (v91 - *(double *)(v81 + 24)))
                    {
                      v81 += 24;
                      v80 = v90;
                    }
                    v84 = v87;
                  }
                  while ((v92 - *(double *)(v81 + 8)) * (v92 - *(double *)(v81 + 8))
                        + (v91 - *(double *)v81) * (v91 - *(double *)v81) >= (v92 - *(double *)&v86)
                                                                           * (v92 - *(double *)&v86)
                                                                           + (v91 - v85) * (v91 - v85));
                  *(double *)v87 = v85;
                  *(_OWORD *)(v87 + 8) = v86;
                }
              }
              v78 = v79 - 1;
            }
            while (v79);
            v93 = v11 / 0x18uLL;
            do
            {
              v94 = 0;
              v130 = *(_QWORD *)(v10 + 16);
              v125 = *(_OWORD *)v10;
              v95 = v10;
              do
              {
                v96 = v95;
                v95 += 24 * v94 + 24;
                v97 = 2 * v94;
                v94 = (2 * v94) | 1;
                v98 = v97 + 2;
                if (v98 < v93)
                {
                  v99 = a3[1];
                  if ((v99 - *(double *)(v95 + 8)) * (v99 - *(double *)(v95 + 8))
                     + (*a3 - *(double *)v95) * (*a3 - *(double *)v95) < (v99 - *(double *)(v95 + 32))
                                                                       * (v99 - *(double *)(v95 + 32))
                                                                       + (*a3 - *(double *)(v95 + 24))
                                                                       * (*a3 - *(double *)(v95 + 24)))
                  {
                    v95 += 24;
                    v94 = v98;
                  }
                }
                v100 = *(_OWORD *)v95;
                *(_QWORD *)(v96 + 16) = *(_QWORD *)(v95 + 16);
                *(_OWORD *)v96 = v100;
              }
              while (v94 <= (uint64_t)((unint64_t)(v93 - 2) >> 1));
              a2 -= 24;
              if (v95 == a2)
              {
                *(_QWORD *)(v95 + 16) = v130;
                *(_OWORD *)v95 = v125;
              }
              else
              {
                v101 = *(_OWORD *)a2;
                *(_QWORD *)(v95 + 16) = *(_QWORD *)(a2 + 16);
                *(_OWORD *)v95 = v101;
                *(_QWORD *)(a2 + 16) = v130;
                *(_OWORD *)a2 = v125;
                v102 = v95 - v10 + 24;
                if (v102 >= 25)
                {
                  v103 = (v102 / 0x18uLL - 2) >> 1;
                  v104 = v10 + 24 * v103;
                  v105 = *(double *)v95;
                  v106 = *(double *)(v95 + 8);
                  v107 = a3[1];
                  if ((v107 - *(double *)(v104 + 8)) * (v107 - *(double *)(v104 + 8))
                     + (*a3 - *(double *)v104) * (*a3 - *(double *)v104) < (v107 - v106) * (v107 - v106)
                                                                         + (*a3 - *(double *)v95)
                                                                         * (*a3 - *(double *)v95))
                  {
                    v108 = *(_QWORD *)(v95 + 16);
                    do
                    {
                      v109 = v104;
                      v110 = *(_OWORD *)v104;
                      *(_QWORD *)(v95 + 16) = *(_QWORD *)(v104 + 16);
                      *(_OWORD *)v95 = v110;
                      if (!v103)
                        break;
                      v103 = (v103 - 1) >> 1;
                      v104 = v10 + 24 * v103;
                      v111 = a3[1];
                      v95 = v109;
                    }
                    while ((v111 - *(double *)(v104 + 8)) * (v111 - *(double *)(v104 + 8))
                          + (*a3 - *(double *)v104) * (*a3 - *(double *)v104) < (v111 - v106) * (v111 - v106)
                                                                              + (*a3 - v105) * (*a3 - v105));
                    *(double *)v109 = v105;
                    *(double *)(v109 + 8) = v106;
                    *(_QWORD *)(v109 + 16) = v108;
                  }
                }
              }
            }
            while (v93-- > 2);
          }
          return;
        }
        v13 = (unint64_t)v12 >> 1;
        v14 = v10 + 24 * ((unint64_t)v12 >> 1);
        if ((unint64_t)v11 < 0xC01)
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MPULayoutInterpolator _sortPointsFor3DInterpolation:usingQueriedPoint:]::$_4 &,MPU::Point3D *>((__int128 *)(a1 + 24 * v13), (double *)a1, (double *)(a2 - 24), a3);
        }
        else
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MPULayoutInterpolator _sortPointsFor3DInterpolation:usingQueriedPoint:]::$_4 &,MPU::Point3D *>((__int128 *)a1, (double *)(a1 + 24 * v13), (double *)(a2 - 24), a3);
          v15 = 3 * v13;
          v16 = (double *)(a1 + 24 * v13 - 24);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MPULayoutInterpolator _sortPointsFor3DInterpolation:usingQueriedPoint:]::$_4 &,MPU::Point3D *>((__int128 *)(a1 + 24), v16, (double *)(a2 - 48), a3);
          v17 = (double *)(a1 + 24 + 8 * v15);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MPULayoutInterpolator _sortPointsFor3DInterpolation:usingQueriedPoint:]::$_4 &,MPU::Point3D *>((__int128 *)(a1 + 48), v17, (double *)(a2 - 72), a3);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MPULayoutInterpolator _sortPointsFor3DInterpolation:usingQueriedPoint:]::$_4 &,MPU::Point3D *>((__int128 *)v16, (double *)v14, v17, a3);
          v126 = *(_QWORD *)(a1 + 16);
          v121 = *(_OWORD *)a1;
          v18 = *(_QWORD *)(v14 + 16);
          *(_OWORD *)a1 = *(_OWORD *)v14;
          *(_QWORD *)(a1 + 16) = v18;
          *(_QWORD *)(v14 + 16) = v126;
          *(_OWORD *)v14 = v121;
        }
        --a4;
        v19 = *(double *)a1;
        if ((a5 & 1) == 0)
        {
          v21 = *(double *)(a1 + 8);
          v20 = *(_QWORD *)(a1 + 16);
          v22 = *a3;
          v23 = a3[1];
          v24 = (v23 - v21) * (v23 - v21) + (*a3 - v19) * (*a3 - v19);
          if ((v23 - *(double *)(a1 - 16)) * (v23 - *(double *)(a1 - 16))
             + (*a3 - *(double *)(a1 - 24)) * (*a3 - *(double *)(a1 - 24)) < v24)
            goto LABEL_11;
          if (v24 >= (v23 - *(double *)(a2 - 16)) * (v23 - *(double *)(a2 - 16))
                    + (v22 - *(double *)(a2 - 24)) * (v22 - *(double *)(a2 - 24)))
          {
            v46 = (double *)(a1 + 24);
            do
            {
              v10 = (unint64_t)v46;
              if ((unint64_t)v46 >= a2)
                break;
              v47 = (v23 - v46[1]) * (v23 - v46[1]) + (v22 - *v46) * (v22 - *v46);
              v46 += 3;
            }
            while (v24 >= v47);
          }
          else
          {
            v10 = a1;
            do
            {
              v44 = *(double *)(v10 + 24);
              v45 = *(double *)(v10 + 32);
              v10 += 24;
            }
            while (v24 >= (v23 - v45) * (v23 - v45) + (v22 - v44) * (v22 - v44));
          }
          v48 = a2;
          if (v10 < a2)
          {
            v48 = a2;
            do
            {
              v49 = *(double *)(v48 - 24);
              v50 = *(double *)(v48 - 16);
              v48 -= 24;
            }
            while (v24 < (v23 - v50) * (v23 - v50) + (v22 - v49) * (v22 - v49));
          }
          while (v10 < v48)
          {
            v128 = *(_QWORD *)(v10 + 16);
            v123 = *(_OWORD *)v10;
            v51 = *(_OWORD *)v48;
            *(_QWORD *)(v10 + 16) = *(_QWORD *)(v48 + 16);
            *(_OWORD *)v10 = v51;
            *(_QWORD *)(v48 + 16) = v128;
            *(_OWORD *)v48 = v123;
            v52 = *a3;
            v53 = a3[1];
            v54 = (v53 - v21) * (v53 - v21) + (*a3 - v19) * (*a3 - v19);
            do
            {
              v55 = *(double *)(v10 + 24);
              v56 = *(double *)(v10 + 32);
              v10 += 24;
            }
            while (v54 >= (v53 - v56) * (v53 - v56) + (v52 - v55) * (v52 - v55));
            do
            {
              v57 = *(double *)(v48 - 24);
              v58 = *(double *)(v48 - 16);
              v48 -= 24;
            }
            while (v54 < (v53 - v58) * (v53 - v58) + (v52 - v57) * (v52 - v57));
          }
          if (v10 - 24 != a1)
          {
            v59 = *(_OWORD *)(v10 - 24);
            *(_QWORD *)(a1 + 16) = *(_QWORD *)(v10 - 8);
            *(_OWORD *)a1 = v59;
          }
          a5 = 0;
          *(double *)(v10 - 24) = v19;
          *(double *)(v10 - 16) = v21;
          *(_QWORD *)(v10 - 8) = v20;
          continue;
        }
        v21 = *(double *)(a1 + 8);
        v20 = *(_QWORD *)(a1 + 16);
        v22 = *a3;
        v23 = a3[1];
        v24 = (v23 - v21) * (v23 - v21) + (*a3 - v19) * (*a3 - v19);
LABEL_11:
        v25 = 0;
        do
        {
          v26 = (v23 - *(double *)(a1 + v25 + 32)) * (v23 - *(double *)(a1 + v25 + 32))
              + (v22 - *(double *)(a1 + v25 + 24)) * (v22 - *(double *)(a1 + v25 + 24));
          v25 += 24;
        }
        while (v26 < v24);
        v27 = a1 + v25;
        v28 = a2;
        if (v25 == 24)
        {
          v28 = a2;
          do
          {
            if (v27 >= v28)
              break;
            v31 = *(double *)(v28 - 24);
            v32 = *(double *)(v28 - 16);
            v28 -= 24;
          }
          while ((v23 - v32) * (v23 - v32) + (v22 - v31) * (v22 - v31) >= v24);
        }
        else
        {
          do
          {
            v29 = *(double *)(v28 - 24);
            v30 = *(double *)(v28 - 16);
            v28 -= 24;
          }
          while ((v23 - v30) * (v23 - v30) + (v22 - v29) * (v22 - v29) >= v24);
        }
        v10 = a1 + v25;
        if (v27 < v28)
        {
          v33 = v28;
          do
          {
            v127 = *(_QWORD *)(v10 + 16);
            v122 = *(_OWORD *)v10;
            v34 = *(_OWORD *)v33;
            *(_QWORD *)(v10 + 16) = *(_QWORD *)(v33 + 16);
            *(_OWORD *)v10 = v34;
            *(_QWORD *)(v33 + 16) = v127;
            *(_OWORD *)v33 = v122;
            v35 = *a3;
            v36 = a3[1];
            v37 = (v36 - v21) * (v36 - v21) + (*a3 - v19) * (*a3 - v19);
            do
            {
              v38 = *(double *)(v10 + 24);
              v39 = *(double *)(v10 + 32);
              v10 += 24;
            }
            while ((v36 - v39) * (v36 - v39) + (v35 - v38) * (v35 - v38) < v37);
            do
            {
              v40 = *(double *)(v33 - 24);
              v41 = *(double *)(v33 - 16);
              v33 -= 24;
            }
            while ((v36 - v41) * (v36 - v41) + (v35 - v40) * (v35 - v40) >= v37);
          }
          while (v10 < v33);
        }
        if (v10 - 24 != a1)
        {
          v42 = *(_OWORD *)(v10 - 24);
          *(_QWORD *)(a1 + 16) = *(_QWORD *)(v10 - 8);
          *(_OWORD *)a1 = v42;
        }
        *(double *)(v10 - 24) = v19;
        *(double *)(v10 - 16) = v21;
        *(_QWORD *)(v10 - 8) = v20;
        if (v27 < v28)
        {
LABEL_30:
          std::__introsort<std::_ClassicAlgPolicy,-[MPULayoutInterpolator _sortPointsFor3DInterpolation:usingQueriedPoint:]::$_4 &,MPU::Point3D *,false>(a1, v10 - 24, a3, a4, a5 & 1);
          a5 = 0;
          continue;
        }
        v43 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[MPULayoutInterpolator _sortPointsFor3DInterpolation:usingQueriedPoint:]::$_4 &,MPU::Point3D *>(a1, v10 - 24, a3);
        if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[MPULayoutInterpolator _sortPointsFor3DInterpolation:usingQueriedPoint:]::$_4 &,MPU::Point3D *>(v10, a2, a3))
        {
          if (v43)
            continue;
          goto LABEL_30;
        }
        a2 = v10 - 24;
        if (!v43)
          goto LABEL_1;
        return;
    }
  }
}

__n128 std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,-[MPULayoutInterpolator _sortPointsFor3DInterpolation:usingQueriedPoint:]::$_4 &,MPU::Point3D *,0>(__n128 *a1, __n128 *a2, __n128 *a3, __n128 *a4, __n128 *a5, double *a6)
{
  double v12;
  __n128 result;
  unint64_t v14;
  unint64_t v15;
  double v16;
  unint64_t v17;
  unint64_t v18;
  double v19;
  unint64_t v20;
  unint64_t v21;
  double v22;
  unint64_t v23;
  unint64_t v24;

  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[MPULayoutInterpolator _sortPointsFor3DInterpolation:usingQueriedPoint:]::$_4 &,MPU::Point3D *>((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, a6);
  v12 = a6[1];
  result.n128_f64[0] = (v12 - a5->n128_f64[1]) * (v12 - a5->n128_f64[1])
                     + (*a6 - a5->n128_f64[0]) * (*a6 - a5->n128_f64[0]);
  if (result.n128_f64[0] < (v12 - a4->n128_f64[1]) * (v12 - a4->n128_f64[1])
                          + (*a6 - a4->n128_f64[0]) * (*a6 - a4->n128_f64[0]))
  {
    v14 = a4[1].n128_u64[0];
    result = *a4;
    v15 = a5[1].n128_u64[0];
    *a4 = *a5;
    a4[1].n128_u64[0] = v15;
    *a5 = result;
    a5[1].n128_u64[0] = v14;
    v16 = a6[1];
    result.n128_f64[0] = (v16 - a4->n128_f64[1]) * (v16 - a4->n128_f64[1])
                       + (*a6 - a4->n128_f64[0]) * (*a6 - a4->n128_f64[0]);
    if (result.n128_f64[0] < (v16 - a3->n128_f64[1]) * (v16 - a3->n128_f64[1])
                            + (*a6 - a3->n128_f64[0]) * (*a6 - a3->n128_f64[0]))
    {
      v17 = a3[1].n128_u64[0];
      result = *a3;
      v18 = a4[1].n128_u64[0];
      *a3 = *a4;
      a3[1].n128_u64[0] = v18;
      *a4 = result;
      a4[1].n128_u64[0] = v17;
      v19 = a6[1];
      result.n128_f64[0] = (v19 - a3->n128_f64[1]) * (v19 - a3->n128_f64[1])
                         + (*a6 - a3->n128_f64[0]) * (*a6 - a3->n128_f64[0]);
      if (result.n128_f64[0] < (v19 - a2->n128_f64[1]) * (v19 - a2->n128_f64[1])
                              + (*a6 - a2->n128_f64[0]) * (*a6 - a2->n128_f64[0]))
      {
        v20 = a2[1].n128_u64[0];
        result = *a2;
        v21 = a3[1].n128_u64[0];
        *a2 = *a3;
        a2[1].n128_u64[0] = v21;
        *a3 = result;
        a3[1].n128_u64[0] = v20;
        v22 = a6[1];
        result.n128_f64[0] = (v22 - a2->n128_f64[1]) * (v22 - a2->n128_f64[1])
                           + (*a6 - a2->n128_f64[0]) * (*a6 - a2->n128_f64[0]);
        if (result.n128_f64[0] < (v22 - a1->n128_f64[1]) * (v22 - a1->n128_f64[1])
                                + (*a6 - a1->n128_f64[0]) * (*a6 - a1->n128_f64[0]))
        {
          v23 = a1[1].n128_u64[0];
          result = *a1;
          v24 = a2[1].n128_u64[0];
          *a1 = *a2;
          a1[1].n128_u64[0] = v24;
          *a2 = result;
          a2[1].n128_u64[0] = v23;
        }
      }
    }
  }
  return result;
}

__int128 *std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MPULayoutInterpolator _sortPointsFor3DInterpolation:usingQueriedPoint:]::$_4 &,MPU::Point3D *>(__int128 *result, double *a2, double *a3, double *a4)
{
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  double v20;
  uint64_t v21;

  v4 = a4[1];
  v5 = (v4 - a2[1]) * (v4 - a2[1]) + (*a4 - *a2) * (*a4 - *a2);
  v6 = (v4 - a3[1]) * (v4 - a3[1]) + (*a4 - *a3) * (*a4 - *a3);
  if (v5 >= (v4 - *((double *)result + 1)) * (v4 - *((double *)result + 1))
           + (*a4 - *(double *)result) * (*a4 - *(double *)result))
  {
    if (v6 < v5)
    {
      v10 = *((_QWORD *)a2 + 2);
      v11 = *(_OWORD *)a2;
      v12 = *((_QWORD *)a3 + 2);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *((_QWORD *)a2 + 2) = v12;
      *(_OWORD *)a3 = v11;
      *((_QWORD *)a3 + 2) = v10;
      v13 = a4[1];
      if ((v13 - a2[1]) * (v13 - a2[1]) + (*a4 - *a2) * (*a4 - *a2) < (v13 - *((double *)result + 1))
                                                                     * (v13 - *((double *)result + 1))
                                                                     + (*a4 - *(double *)result)
                                                                     * (*a4 - *(double *)result))
      {
        v14 = *((_QWORD *)result + 2);
        v15 = *result;
        v16 = *((_QWORD *)a2 + 2);
        *result = *(_OWORD *)a2;
        *((_QWORD *)result + 2) = v16;
        *(_OWORD *)a2 = v15;
        *((_QWORD *)a2 + 2) = v14;
      }
    }
  }
  else
  {
    if (v6 >= v5)
    {
      v17 = *((_QWORD *)result + 2);
      v18 = *result;
      v19 = *((_QWORD *)a2 + 2);
      *result = *(_OWORD *)a2;
      *((_QWORD *)result + 2) = v19;
      *(_OWORD *)a2 = v18;
      *((_QWORD *)a2 + 2) = v17;
      v20 = a4[1];
      if ((v20 - a3[1]) * (v20 - a3[1]) + (*a4 - *a3) * (*a4 - *a3) >= (v20 - a2[1]) * (v20 - a2[1])
                                                                      + (*a4 - *a2) * (*a4 - *a2))
        return result;
      v7 = *((_QWORD *)a2 + 2);
      v8 = *(_OWORD *)a2;
      v21 = *((_QWORD *)a3 + 2);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *((_QWORD *)a2 + 2) = v21;
    }
    else
    {
      v7 = *((_QWORD *)result + 2);
      v8 = *result;
      v9 = *((_QWORD *)a3 + 2);
      *result = *(_OWORD *)a3;
      *((_QWORD *)result + 2) = v9;
    }
    *(_OWORD *)a3 = v8;
    *((_QWORD *)a3 + 2) = v7;
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[MPULayoutInterpolator _sortPointsFor3DInterpolation:usingQueriedPoint:]::$_4 &,MPU::Point3D *>(uint64_t a1, uint64_t a2, double *a3)
{
  unint64_t v6;
  _BOOL8 result;
  __int128 *v8;
  double v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  double v17;
  __int128 v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  uint64_t v23;

  v6 = 0xAAAAAAAAAAAAAAABLL * ((a2 - a1) >> 3);
  result = 1;
  switch(v6)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      v8 = (__int128 *)(a2 - 24);
      v9 = a3[1];
      if ((v9 - *(double *)(a2 - 16)) * (v9 - *(double *)(a2 - 16))
         + (*a3 - *(double *)(a2 - 24)) * (*a3 - *(double *)(a2 - 24)) < (v9 - *(double *)(a1 + 8))
                                                                       * (v9 - *(double *)(a1 + 8))
                                                                       + (*a3 - *(double *)a1) * (*a3 - *(double *)a1))
      {
        v10 = *(_QWORD *)(a1 + 16);
        v11 = *(_OWORD *)a1;
        v12 = *(_QWORD *)(a2 - 8);
        *(_OWORD *)a1 = *v8;
        *(_QWORD *)(a1 + 16) = v12;
        *v8 = v11;
        *(_QWORD *)(a2 - 8) = v10;
      }
      return result;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MPULayoutInterpolator _sortPointsFor3DInterpolation:usingQueriedPoint:]::$_4 &,MPU::Point3D *>((__int128 *)a1, (double *)(a1 + 24), (double *)(a2 - 24), a3);
      return 1;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[MPULayoutInterpolator _sortPointsFor3DInterpolation:usingQueriedPoint:]::$_4 &,MPU::Point3D *>(a1, a1 + 24, a1 + 48, a2 - 24, a3);
      return 1;
    case 5uLL:
      std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,-[MPULayoutInterpolator _sortPointsFor3DInterpolation:usingQueriedPoint:]::$_4 &,MPU::Point3D *,0>((__n128 *)a1, (__n128 *)(a1 + 24), (__n128 *)(a1 + 48), (__n128 *)(a1 + 72), (__n128 *)(a2 - 24), a3);
      return 1;
    default:
      v13 = (double *)(a1 + 48);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MPULayoutInterpolator _sortPointsFor3DInterpolation:usingQueriedPoint:]::$_4 &,MPU::Point3D *>((__int128 *)a1, (double *)(a1 + 24), (double *)(a1 + 48), a3);
      v14 = a1 + 72;
      if (a1 + 72 == a2)
        return 1;
      v15 = 0;
      v16 = 0;
      break;
  }
  while (1)
  {
    v17 = *(double *)v14;
    v18 = *(_OWORD *)(v14 + 8);
    v19 = a3[1];
    if ((v19 - *(double *)&v18) * (v19 - *(double *)&v18) + (*a3 - *(double *)v14) * (*a3 - *(double *)v14) < (v19 - v13[1]) * (v19 - v13[1]) + (*a3 - *v13) * (*a3 - *v13))
    {
      v20 = v15;
      while (1)
      {
        v21 = a1 + v20;
        *(_OWORD *)(v21 + 72) = *(_OWORD *)(a1 + v20 + 48);
        *(_QWORD *)(v21 + 88) = *(_QWORD *)(a1 + v20 + 64);
        if (v20 == -48)
          break;
        v22 = a3[1];
        v20 -= 24;
        if ((v22 - *(double *)&v18) * (v22 - *(double *)&v18) + (*a3 - v17) * (*a3 - v17) >= (v22
                                                                                             - *(double *)(v21 + 32))
                                                                                            * (v22
                                                                                             - *(double *)(v21 + 32))
                                                                                            + (*a3
                                                                                             - *(double *)(v21 + 24))
                                                                                            * (*a3
                                                                                             - *(double *)(v21 + 24)))
        {
          v23 = a1 + v20 + 72;
          goto LABEL_12;
        }
      }
      v23 = a1;
LABEL_12:
      *(double *)v23 = v17;
      *(_OWORD *)(v23 + 8) = v18;
      if (++v16 == 8)
        return v14 + 24 == a2;
    }
    v13 = (double *)v14;
    v15 += 24;
    v14 += 24;
    if (v14 == a2)
      return 1;
  }
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[MPULayoutInterpolator _sortPointsFor3DInterpolation:usingQueriedPoint:]::$_4 &,MPU::Point3D *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double *a5)
{
  double v10;
  __n128 result;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;

  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MPULayoutInterpolator _sortPointsFor3DInterpolation:usingQueriedPoint:]::$_4 &,MPU::Point3D *>((__int128 *)a1, (double *)a2, (double *)a3, a5);
  v10 = a5[1];
  result.n128_f64[0] = (v10 - *(double *)(a4 + 8)) * (v10 - *(double *)(a4 + 8))
                     + (*a5 - *(double *)a4) * (*a5 - *(double *)a4);
  if (result.n128_f64[0] < (v10 - *(double *)(a3 + 8)) * (v10 - *(double *)(a3 + 8))
                          + (*a5 - *(double *)a3) * (*a5 - *(double *)a3))
  {
    v12 = *(_QWORD *)(a3 + 16);
    result = *(__n128 *)a3;
    v13 = *(_QWORD *)(a4 + 16);
    *(_OWORD *)a3 = *(_OWORD *)a4;
    *(_QWORD *)(a3 + 16) = v13;
    *(__n128 *)a4 = result;
    *(_QWORD *)(a4 + 16) = v12;
    v14 = a5[1];
    result.n128_f64[0] = (v14 - *(double *)(a3 + 8)) * (v14 - *(double *)(a3 + 8))
                       + (*a5 - *(double *)a3) * (*a5 - *(double *)a3);
    if (result.n128_f64[0] < (v14 - *(double *)(a2 + 8)) * (v14 - *(double *)(a2 + 8))
                            + (*a5 - *(double *)a2) * (*a5 - *(double *)a2))
    {
      v15 = *(_QWORD *)(a2 + 16);
      result = *(__n128 *)a2;
      v16 = *(_QWORD *)(a3 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(_QWORD *)(a2 + 16) = v16;
      *(__n128 *)a3 = result;
      *(_QWORD *)(a3 + 16) = v15;
      v17 = a5[1];
      result.n128_f64[0] = (v17 - *(double *)(a2 + 8)) * (v17 - *(double *)(a2 + 8))
                         + (*a5 - *(double *)a2) * (*a5 - *(double *)a2);
      if (result.n128_f64[0] < (v17 - *(double *)(a1 + 8)) * (v17 - *(double *)(a1 + 8))
                              + (*a5 - *(double *)a1) * (*a5 - *(double *)a1))
      {
        v18 = *(_QWORD *)(a1 + 16);
        result = *(__n128 *)a1;
        v19 = *(_QWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_QWORD *)(a1 + 16) = v19;
        *(__n128 *)a2 = result;
        *(_QWORD *)(a2 + 16) = v18;
      }
    }
  }
  return result;
}

void std::vector<MPU::LayoutInterpolator::EntriesContainer>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<MPU::LayoutInterpolator::EntriesContainer>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

double *MPU::Point3D::Point3D(double *this, double a2, double a3, double a4)
{
  *this = a2;
  this[1] = a3;
  this[2] = a4;
  return this;
}

{
  *this = a2;
  this[1] = a3;
  this[2] = a4;
  return this;
}

BOOL MPU::Point3D::operator==(double *a1, double *a2)
{
  return MPUFloatEqualToFloat(*a1, *a2) && MPUFloatEqualToFloat(a1[1], a2[1]) && MPUFloatEqualToFloat(a1[2], a2[2]);
}

BOOL MPU::Point3D::operator!=(double *a1, double *a2)
{
  return !MPU::Point3D::operator==(a1, a2);
}

BOOL MPU::Point3D::resolveEquationOfPlaneDefinedByFirstThreePointsInVector(double **a1, double *a2, double *a3, double *a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12)
{
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v34;

  v15 = **a1;
  v16 = (*a1)[1];
  v17 = (*a1)[2];
  v18 = (*a1)[4];
  v19 = (*a1)[5];
  v20 = (*a1)[6];
  v21 = (*a1)[7];
  v22 = (*a1)[8];
  v34 = (*a1)[3];
  return MPU::_ResolveEquationOfPlaneDefinedBy3DPoints(a2, a3, a4, v15, v16, v17, v34, v18, v19, a11, a12, v20, v21, v22)|| MPU::_ResolveEquationOfPlaneDefinedBy3DPoints(a2, a3, a4, v15,
           v16,
           v17,
           v20,
           v21,
           v22,
           v23,
           v24,
           v34,
           v18,
           v19)
      || MPU::_ResolveEquationOfPlaneDefinedBy3DPoints(a2, a3, a4, v34, v18, v19, v15, v16, v17, v25, v26, v20, v21, v22)|| MPU::_ResolveEquationOfPlaneDefinedBy3DPoints(a2, a3, a4, v34,
           v18,
           v19,
           v20,
           v21,
           v22,
           v27,
           v28,
           v15,
           v16,
           v17)
      || MPU::_ResolveEquationOfPlaneDefinedBy3DPoints(a2, a3, a4, v20, v21, v22, v15, v16, v17, v29, v30, v34, v18, v19)|| MPU::_ResolveEquationOfPlaneDefinedBy3DPoints(a2, a3, a4, v20,
           v21,
           v22,
           v34,
           v18,
           v19,
           v31,
           v32,
           v15,
           v16,
           v17);
}

BOOL MPU::_ResolveEquationOfPlaneDefinedBy3DPoints(double *a1, double *a2, double *a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13, double a14)
{
  double v26;
  double v28;
  double v29;
  double v30;
  double v31;
  _BOOL4 v32;
  double v33;
  double v34;

  v26 = a8 - a5;
  if (MPUFloatEqualToFloat(a8 - a5, 0.0))
    return 0;
  v28 = a13 - a8;
  v29 = a7 - a4;
  v30 = -v28 / v26;
  v31 = a12 - a7 + v30 * (a7 - a4);
  v32 = MPUFloatEqualToFloat(v31, 0.0);
  if (!v32)
  {
    v33 = (a14 - a9 + v30 * (a9 - a6)) / v31;
    if (a1)
      *a1 = v33;
    v34 = (a9 - a6 - v33 * v29) / v26;
    if (a2)
      *a2 = v34;
    if (a3)
      *a3 = a6 - v33 * a4 - v34 * a5;
  }
  return !v32;
}

void sub_21A9BB0B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t CoreTextLibrary()
{
  uint64_t v0;
  void *v2;

  if (!CoreTextLibraryCore_frameworkLibrary)
    CoreTextLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = CoreTextLibraryCore_frameworkLibrary;
  if (!CoreTextLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

BOOL MPUFloatGreaterThanOrEqualToFloat(double a1, double a2)
{
  return vabdd_f64(a2, a1) < 0.00000011920929 || a1 > a2;
}

BOOL MPUFloatLessThanOrEqualToFloat(double a1, double a2)
{
  return vabdd_f64(a2, a1) < 0.00000011920929 || a1 < a2;
}

double MPUFloatGetSafeScaleForValue(double result)
{
  void *v1;
  double v2;
  double v3;

  if (vabdd_f64(0.0, result) < 0.00000011920929)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "scale");
    v3 = v2;

    return v3;
  }
  return result;
}

double MPUFloatFloorForScale(double a1, double a2)
{
  double SafeScaleForValue;

  SafeScaleForValue = MPUFloatGetSafeScaleForValue(a2);
  return floor(SafeScaleForValue * a1) / SafeScaleForValue;
}

double MPUFloatRoundForScale(double a1, double a2)
{
  double SafeScaleForValue;

  SafeScaleForValue = MPUFloatGetSafeScaleForValue(a2);
  return round(SafeScaleForValue * a1) / SafeScaleForValue;
}

double MPUFloatCeilForScale(double a1, double a2)
{
  double SafeScaleForValue;

  SafeScaleForValue = MPUFloatGetSafeScaleForValue(a2);
  return ceil(SafeScaleForValue * a1) / SafeScaleForValue;
}

BOOL MPUPointEqualToPoint(double a1, double a2, double a3, double a4)
{
  _BOOL4 v4;

  v4 = vabdd_f64(a3, a1) < 0.00000011920929;
  return vabdd_f64(a4, a2) < 0.00000011920929 && v4;
}

BOOL MPUSizeEqualToSize(double a1, double a2, double a3, double a4)
{
  _BOOL4 v4;

  v4 = vabdd_f64(a3, a1) < 0.00000011920929;
  return vabdd_f64(a4, a2) < 0.00000011920929 && v4;
}

CGFloat MPURectByApplyingUserInterfaceLayoutDirectionInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  void *v16;
  uint64_t v17;
  double MaxX;
  double v19;
  double v20;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "userInterfaceLayoutDirection");

  if (v17 == 1)
  {
    v22.origin.x = a5;
    v22.origin.y = a6;
    v22.size.width = a7;
    v22.size.height = a8;
    MaxX = CGRectGetMaxX(v22);
    v23.origin.x = a1;
    v23.origin.y = a2;
    v23.size.width = a3;
    v23.size.height = a4;
    v19 = MaxX - CGRectGetMinX(v23);
    v24.origin.x = a1;
    v24.origin.y = a2;
    v24.size.width = a3;
    v24.size.height = a4;
    v20 = v19 - CGRectGetWidth(v24);
    v25.origin.x = a1;
    v25.origin.y = a2;
    v25.size.width = a3;
    v25.size.height = a4;
    CGRectGetMinY(v25);
    v26.origin.x = a1;
    v26.origin.y = a2;
    v26.size.width = a3;
    v26.size.height = a4;
    CGRectGetWidth(v26);
    v27.origin.x = a1;
    v27.origin.y = a2;
    v27.size.width = a3;
    v27.size.height = a4;
    CGRectGetHeight(v27);
    return v20;
  }
  return a1;
}

CGFloat MPURectByRemovingUserInterfaceLayoutDirectionInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  void *v16;
  uint64_t v17;
  double MaxX;
  double v19;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "userInterfaceLayoutDirection");

  if (v17 == 1)
  {
    v21.origin.x = a5;
    v21.origin.y = a6;
    v21.size.width = a7;
    v21.size.height = a8;
    MaxX = CGRectGetMaxX(v21);
    v22.origin.x = a1;
    v22.origin.y = a2;
    v22.size.width = a3;
    v22.size.height = a4;
    v19 = MaxX - CGRectGetMaxX(v22);
    v23.origin.x = a1;
    v23.origin.y = a2;
    v23.size.width = a3;
    v23.size.height = a4;
    CGRectGetMinY(v23);
    v24.origin.x = a1;
    v24.origin.y = a2;
    v24.size.width = a3;
    v24.size.height = a4;
    CGRectGetWidth(v24);
    v25.origin.x = a1;
    v25.origin.y = a2;
    v25.size.width = a3;
    v25.size.height = a4;
    CGRectGetHeight(v25);
    return v19;
  }
  return a1;
}

BOOL MPURectEqualToRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  return vabdd_f64(a5, a1) < 0.00000011920929
      && vabdd_f64(a6, a2) < 0.00000011920929
      && vabdd_f64(a7, a3) < 0.00000011920929
      && vabdd_f64(a8, a4) < 0.00000011920929;
}

double MPUBalancedEdgeInsets(double a1, double a2, double a3)
{
  if (a1 >= a3)
    return a1;
  else
    return a3;
}

double MPUEdgeInsetsOutsetRect(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 - a6;
}

CGFloat MPUEdgeInsetsRectInsets(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  CGFloat v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  v18 = a6 - a2;
  CGRectGetMaxY(*(CGRect *)&a1);
  v19.origin.x = a5;
  v19.origin.y = a6;
  v19.size.width = a7;
  v19.size.height = a8;
  CGRectGetMaxY(v19);
  v20.origin.x = a1;
  v20.origin.y = a2;
  v20.size.width = a3;
  v20.size.height = a4;
  CGRectGetMaxX(v20);
  v21.origin.x = a5;
  v21.origin.y = a6;
  v21.size.width = a7;
  v21.size.height = a8;
  CGRectGetMaxX(v21);
  return v18;
}

double MPUInsetsFromRectToRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double MinY;
  double v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v22.origin.x = a5;
  v22.origin.y = a6;
  v22.size.width = a7;
  v22.size.height = a8;
  MinY = CGRectGetMinY(v22);
  v23.origin.x = a1;
  v23.origin.y = a2;
  v23.size.width = a3;
  v23.size.height = a4;
  v21 = MinY - CGRectGetMinY(v23);
  v24.origin.x = a5;
  v24.origin.y = a6;
  v24.size.width = a7;
  v24.size.height = a8;
  CGRectGetMinX(v24);
  v25.origin.x = a1;
  v25.origin.y = a2;
  v25.size.width = a3;
  v25.size.height = a4;
  CGRectGetMinX(v25);
  v26.origin.x = a1;
  v26.origin.y = a2;
  v26.size.width = a3;
  v26.size.height = a4;
  CGRectGetHeight(v26);
  v27.origin.x = a5;
  v27.origin.y = a6;
  v27.size.width = a7;
  v27.size.height = a8;
  CGRectGetHeight(v27);
  v28.origin.x = a1;
  v28.origin.y = a2;
  v28.size.width = a3;
  v28.size.height = a4;
  CGRectGetWidth(v28);
  v29.origin.x = a5;
  v29.origin.y = a6;
  v29.size.width = a7;
  v29.size.height = a8;
  CGRectGetWidth(v29);
  return v21;
}

double MPULayoutLinearRelationMake(double a1, double a2, double a3, double a4)
{
  return (a4 - a2) / (a3 - a1);
}

double MPULayoutLinearRelationEvaluate(double a1, double a2, double a3)
{
  return a2 + a1 * a3;
}

uint64_t MPU::LayoutInterpolator::_EntriesContainerMakeInsertionError@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D2>)
{
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  __int128 v16;
  uint64_t v17;
  _QWORD v18[11];
  char v19;
  uint64_t v20;

  *(_DWORD *)a3 = 0;
  v10 = a3 + 8;
  std::string::basic_string[abi:ne180100]<0>((_QWORD *)(a3 + 8), "");
  *(_DWORD *)a3 = a2;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v18);
  switch(a2)
  {
    case 1:
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)"Found perfect duplicate entry while trying to insert ", 53);
      MPU::LayoutInterpolator::_EntriesContainerAppendEntryDescriptionToStringStream(a4, a1, v18);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)". ", 2);
      v11 = "Doing nothing.";
      v12 = 14;
      goto LABEL_7;
    case 2:
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)"Error: Found inconsistent duplicate entry while trying to insert ", 65);
      MPU::LayoutInterpolator::_EntriesContainerAppendEntryDescriptionToStringStream(a4, a1, v18);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)". ", 2);
      v13 = "Already have ";
      v14 = 13;
      goto LABEL_6;
    case 3:
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)"Error: Attempting to insert ", 28);
      MPU::LayoutInterpolator::_EntriesContainerAppendEntryDescriptionToStringStream(a4, a1, v18);
      v13 = " with a specified secondary reference metric with another entry present that does not have a specified secon"
            "dary reference metric: ";
      v14 = 131;
      goto LABEL_6;
    case 4:
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)"Error: Attempting to insert ", 28);
      MPU::LayoutInterpolator::_EntriesContainerAppendEntryDescriptionToStringStream(a4, a1, v18);
      v13 = " without a specified secondary reference metric with another entry present that does have a specified second"
            "ary reference metric: ";
      v14 = 130;
LABEL_6:
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)v13, v14);
      MPU::LayoutInterpolator::_EntriesContainerAppendEntryDescriptionToStringStream(a5, a1, v18);
      v11 = ".";
      v12 = 1;
LABEL_7:
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)v11, v12);
      break;
    default:
      break;
  }
  std::stringbuf::str();
  if (*(char *)(a3 + 31) < 0)
    operator delete(*(void **)v10);
  *(_OWORD *)v10 = v16;
  *(_QWORD *)(v10 + 16) = v17;
  v18[0] = *MEMORY[0x24BEDB800];
  *(_QWORD *)((char *)v18 + *(_QWORD *)(v18[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB800] + 24);
  v18[1] = MEMORY[0x24BEDB848] + 16;
  if (v19 < 0)
    operator delete((void *)v18[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x22074DD10](&v20);
}

void sub_21A9BC5B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  void **v4;
  uint64_t v5;
  va_list va;

  va_start(va, a4);
  std::ostringstream::~ostringstream((uint64_t)va);
  if (*(char *)(v5 + 31) < 0)
    operator delete(*v4);
  _Unwind_Resume(a1);
}

uint64_t std::ostringstream::basic_ostringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  std::ios_base *v6;

  v2 = MEMORY[0x24BEDB870];
  v3 = MEMORY[0x24BEDB870] + 64;
  *(_QWORD *)(a1 + 112) = MEMORY[0x24BEDB870] + 64;
  v4 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
  v5 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + *(_QWORD *)(v4 - 24)) = v5;
  v6 = (std::ios_base *)(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24));
  std::ios_base::init(v6, (void *)(a1 + 8));
  v6[1].__vftable = 0;
  v6[1].__fmtflags_ = -1;
  *(_QWORD *)a1 = v2 + 24;
  *(_QWORD *)(a1 + 112) = v3;
  std::streambuf::basic_streambuf();
  *(_QWORD *)(a1 + 8) = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_21A9BC6AC(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostream::~ostream();
  MEMORY[0x22074DD10](v1);
  _Unwind_Resume(a1);
}

_QWORD *MPU::LayoutInterpolator::_EntriesContainerAppendEntryDescriptionToStringStream(double a1, uint64_t a2, _QWORD *a3)
{
  _QWORD *v5;

  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a3, (uint64_t)"(referenceMetric: ", 18);
  std::ostream::operator<<();
  if (!MPUFloatEqualToFloat(a1, -1.13427449e38))
  {
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a3, (uint64_t)", secondaryReferenceMetric: ", 28);
    std::ostream::operator<<();
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a3, (uint64_t)", value: ", 9);
  v5 = (_QWORD *)std::ostream::operator<<();
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)")", 1);
}

uint64_t std::ostringstream::~ostringstream(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x24BEDB800];
  v3 = *MEMORY[0x24BEDB800];
  *(_QWORD *)a1 = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(a1 + 8) = MEMORY[0x24BEDB848] + 16;
  if (*(char *)(a1 + 95) < 0)
    operator delete(*(void **)(a1 + 72));
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x22074DD10](a1 + 112);
  return a1;
}

uint64_t MPU::LayoutInterpolator::EntriesContainer::EntriesContainer(uint64_t this, double a2)
{
  *(_QWORD *)this = 0;
  *(_QWORD *)(this + 8) = 0;
  *(_QWORD *)(this + 16) = 0;
  *(double *)(this + 24) = a2;
  return this;
}

{
  *(_QWORD *)this = 0;
  *(_QWORD *)(this + 8) = 0;
  *(_QWORD *)(this + 16) = 0;
  *(double *)(this + 24) = a2;
  return this;
}

_QWORD *MPU::LayoutInterpolator::EntriesContainer::copyEntriesVector@<X0>(MPU::LayoutInterpolator::EntriesContainer *this@<X0>, _QWORD *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  return std::vector<MPU::LayoutInterpolator::Entry>::__init_with_size[abi:ne180100]<MPU::LayoutInterpolator::Entry*,MPU::LayoutInterpolator::Entry*>(a2, *(const void **)this, *((_QWORD *)this + 1), (uint64_t)(*((_QWORD *)this + 1) - *(_QWORD *)this) >> 4);
}

uint64_t MPU::LayoutInterpolator::EntriesContainer::entriesCount(MPU::LayoutInterpolator::EntriesContainer *this)
{
  return (uint64_t)(*((_QWORD *)this + 1) - *(_QWORD *)this) >> 4;
}

double MPU::LayoutInterpolator::EntriesContainer::primaryReferenceMetric(MPU::LayoutInterpolator::EntriesContainer *this)
{
  return *((double *)this + 3);
}

void MPU::LayoutInterpolator::EntriesContainer::insertEntry(MPU::LayoutInterpolator::EntriesContainer *this@<X0>, Entry a2@<0:D0, 8:D1>, uint64_t a3@<X8>)
{
  double var1;
  double var0;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  int v12;
  double v13;
  double *v14;
  double *v15;
  unint64_t v16;
  unint64_t v17;
  double *v18;
  double *v19;
  double v20;
  int v21;
  int v22;
  __int128 v23;
  uint64_t v24;
  Entry v25;

  var1 = a2.var1;
  var0 = a2.var0;
  v25 = a2;
  *(_DWORD *)a3 = 0;
  v7 = a3 + 8;
  std::string::basic_string[abi:ne180100]<0>((_QWORD *)(a3 + 8), "");
  v9 = *(_QWORD *)this;
  v8 = *((_QWORD *)this + 1);
  if (MPUFloatEqualToFloat(var0, -1.13427449e38))
  {
    if (v8 == v9)
      goto LABEL_15;
    v11 = **(double **)this;
    v10 = *(double *)(*(_QWORD *)this + 8);
    if (MPUFloatEqualToFloat(v11, -1.13427449e38))
    {
      if (MPUFloatEqualToFloat(v10, var1))
        v12 = 1;
      else
        v12 = 2;
      MPU::LayoutInterpolator::_EntriesContainerMakeInsertionError((uint64_t)this, v12, (uint64_t)&v22, var0, v11);
    }
    else
    {
      MPU::LayoutInterpolator::_EntriesContainerMakeInsertionError((uint64_t)this, 4, (uint64_t)&v22, var0, v11);
    }
  }
  else
  {
    if (v8 == v9)
      goto LABEL_15;
    v13 = **(double **)this;
    if (!MPUFloatEqualToFloat(v13, -1.13427449e38))
      goto LABEL_15;
    MPU::LayoutInterpolator::_EntriesContainerMakeInsertionError((uint64_t)this, 3, (uint64_t)&v22, var0, v13);
  }
  *(_DWORD *)a3 = v22;
  if (*(char *)(a3 + 31) < 0)
    operator delete(*(void **)v7);
  *(_OWORD *)v7 = v23;
  *(_QWORD *)(v7 + 16) = v24;
LABEL_15:
  if (!*(_DWORD *)a3)
  {
    v15 = *(double **)this;
    v14 = (double *)*((_QWORD *)this + 1);
    if (v14 == *(double **)this)
    {
      v15 = (double *)*((_QWORD *)this + 1);
    }
    else
    {
      v16 = ((uint64_t)v14 - *(_QWORD *)this) >> 4;
      do
      {
        v17 = v16 >> 1;
        v18 = &v15[2 * (v16 >> 1)];
        v20 = *v18;
        v19 = v18 + 2;
        v16 += ~(v16 >> 1);
        if (v20 < var0)
          v15 = v19;
        else
          v16 = v17;
      }
      while (v16);
    }
    if (v14 == v15 || !MPUFloatEqualToFloat(*v15, var0))
    {
      std::vector<MPU::LayoutInterpolator::Entry>::insert((uint64_t)this, (char *)v15, (char *)&v25);
    }
    else
    {
      if (MPUFloatEqualToFloat(v15[1], v25.var1))
        v21 = 1;
      else
        v21 = 2;
      MPU::LayoutInterpolator::_EntriesContainerMakeInsertionError((uint64_t)this, v21, (uint64_t)&v22, v25.var0, *v15);
      *(_DWORD *)a3 = v22;
      if (*(char *)(a3 + 31) < 0)
        operator delete(*(void **)v7);
      *(_OWORD *)v7 = v23;
      *(_QWORD *)(v7 + 16) = v24;
    }
  }
}

char *std::vector<MPU::LayoutInterpolator::Entry>::insert(uint64_t a1, char *__src, char *a3)
{
  char *v3;
  char *v4;
  char *v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  _OWORD *v11;
  __int128 v12;
  char *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  char *v20;
  unint64_t v21;
  unint64_t v22;
  char *v23;
  uint64_t v24;
  void *__p;
  char *v27;
  char *v28;
  char *v29;
  uint64_t v30;

  v3 = a3;
  v4 = __src;
  v6 = *(char **)(a1 + 8);
  v8 = a1 + 16;
  v7 = *(_QWORD *)(a1 + 16);
  if ((unint64_t)v6 >= v7)
  {
    v13 = *(char **)a1;
    v14 = ((uint64_t)&v6[-*(_QWORD *)a1] >> 4) + 1;
    if (v14 >> 60)
      std::vector<MPU::LayoutInterpolator::Entry>::__throw_length_error[abi:ne180100]();
    v15 = __src - v13;
    v16 = (__src - v13) >> 4;
    v17 = v7 - (_QWORD)v13;
    if (v17 >> 3 > v14)
      v14 = v17 >> 3;
    if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF0)
      v18 = 0xFFFFFFFFFFFFFFFLL;
    else
      v18 = v14;
    v30 = a1 + 16;
    if (v18)
      v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MPU::LayoutInterpolator::Entry>>(a1 + 16, v18);
    else
      v19 = 0;
    v20 = &v19[16 * v16];
    __p = v19;
    v27 = v20;
    v28 = v20;
    v29 = &v19[16 * v18];
    if (v16 == v18)
    {
      if (v15 < 1)
      {
        if (v13 == v4)
          v22 = 1;
        else
          v22 = v15 >> 3;
        v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MPU::LayoutInterpolator::Entry>>(v8, v22);
        v20 = &v23[16 * (v22 >> 2)];
        __p = v23;
        v27 = v20;
        v29 = &v23[16 * v24];
        if (v19)
          operator delete(v19);
      }
      else
      {
        v21 = v16 + 2;
        if (v16 >= -1)
          v21 = v16 + 1;
        v20 -= 16 * (v21 >> 1);
        v27 = v20;
      }
    }
    *(_OWORD *)v20 = *(_OWORD *)v3;
    v28 = v20 + 16;
    v4 = (char *)std::vector<MPU::LayoutInterpolator::Entry>::__swap_out_circular_buffer((void **)a1, (uint64_t)&__p, v4);
    if (v28 != v27)
      v28 += (v27 - v28 + 15) & 0xFFFFFFFFFFFFFFF0;
    if (__p)
      operator delete(__p);
  }
  else if (__src == v6)
  {
    *(_OWORD *)__src = *(_OWORD *)a3;
    *(_QWORD *)(a1 + 8) = __src + 16;
  }
  else
  {
    v9 = __src + 16;
    v10 = v6 - 16;
    v11 = *(_OWORD **)(a1 + 8);
    while (v10 < v6)
    {
      v12 = *(_OWORD *)v10;
      v10 += 16;
      *v11++ = v12;
    }
    *(_QWORD *)(a1 + 8) = v11;
    if (v6 != v9)
      memmove(&v6[-16 * ((v6 - v9) >> 4)], __src, v6 - v9);
    if (v4 <= v3)
      v3 += 16 * (*(_QWORD *)(a1 + 8) > (unint64_t)v3);
    *(_OWORD *)v4 = *(_OWORD *)v3;
  }
  return v4;
}

void sub_21A9BCCAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

double MPU::LayoutInterpolator::EntriesContainer::valueForSecondaryReferenceMetric(double **this, double a2)
{
  double *v2;
  double *v3;
  unint64_t v4;
  unint64_t v7;
  double *v8;
  double *v9;
  double v10;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *exception;

  v3 = *this;
  v2 = this[1];
  v4 = ((char *)v2 - (char *)*this) >> 4;
  if (v4 == 1)
    return v3[1];
  if (!v4)
  {
    exception = __cxa_allocate_exception(0x18uLL);
    std::string::basic_string[abi:ne180100]<0>(exception, "Can't query value from empty entries container.");
  }
  if (v2 == v3)
    goto LABEL_11;
  do
  {
    v7 = v4 >> 1;
    v8 = &v3[2 * (v4 >> 1)];
    v10 = *v8;
    v9 = v8 + 2;
    v4 += ~(v4 >> 1);
    if (v10 < a2)
      v3 = v9;
    else
      v4 = v7;
  }
  while (v4);
  if (v3 == v2)
  {
LABEL_11:
    v12 = *(v2 - 4);
    v13 = *(v2 - 3);
    v14 = *(v2 - 2);
    v15 = *(v2 - 1);
  }
  else
  {
    if (MPUFloatEqualToFloat(*v3, a2))
      return v3[1];
    if (v3 == *this)
    {
      v12 = *v3;
      v13 = v3[1];
      v14 = v3[2];
      v15 = v3[3];
    }
    else
    {
      v12 = *(v3 - 2);
      v13 = *(v3 - 1);
      v14 = *v3;
      v15 = v3[1];
    }
  }
  v16 = MPULayoutLinearRelationMake(v12, v13, v14, v15);
  return MPULayoutLinearRelationEvaluate(v16, v17, a2);
}

void sub_21A9BCDE4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
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

  MEMORY[0x22074DC98](v13, a1);
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
  MEMORY[0x22074DCA4](v13);
  return a1;
}

void sub_21A9BCF04(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x22074DCA4](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x21A9BCEE4);
}

void sub_21A9BCF4C(_Unwind_Exception *a1)
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

void sub_21A9BD080(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
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

void *std::vector<MPU::LayoutInterpolator::Entry>::__swap_out_circular_buffer(void **a1, uint64_t a2, char *__src)
{
  void *v5;
  char *v6;
  void *v7;
  char *v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  int64_t v12;
  char *v13;
  void *v14;
  void *v15;

  v5 = *(void **)(a2 + 8);
  v6 = (char *)*a1;
  v7 = v5;
  if (*a1 != __src)
  {
    v8 = __src;
    v9 = *(_QWORD *)(a2 + 8);
    do
    {
      v7 = (void *)(v9 - 16);
      *(_OWORD *)(v9 - 16) = *((_OWORD *)v8 - 1);
      v8 -= 16;
      v9 -= 16;
    }
    while (v8 != v6);
  }
  *(_QWORD *)(a2 + 8) = v7;
  v10 = a1[1];
  v11 = *(_QWORD *)(a2 + 16);
  v12 = v10 - __src;
  if (v10 != __src)
  {
    memmove(*(void **)(a2 + 16), __src, v10 - __src);
    v7 = *(void **)(a2 + 8);
  }
  *(_QWORD *)(a2 + 16) = v11 + v12;
  v13 = (char *)*a1;
  *a1 = v7;
  *(_QWORD *)(a2 + 8) = v13;
  v14 = a1[1];
  a1[1] = *(void **)(a2 + 16);
  *(_QWORD *)(a2 + 16) = v14;
  v15 = a1[2];
  a1[2] = *(void **)(a2 + 24);
  *(_QWORD *)(a2 + 24) = v15;
  *(_QWORD *)a2 = *(_QWORD *)(a2 + 8);
  return v5;
}

void sub_21A9BFAAC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Block_object_dispose((const void *)(v1 - 168), 8);
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

uint64_t _MPUStackViewApplyLayoutToItem(uint64_t a1, void *a2, uint64_t a3, float64x2_t a4, float64_t a5)
{
  double v6;
  double v7;
  float64x2_t v8;
  double v9;
  double v10;
  float64x2_t v11;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  int32x2_t v20;
  int64x2_t v21;
  uint64_t v22;
  float64x2_t v23;
  double v24;
  float v25;
  double v26;
  float64x2_t v27;
  float v28;
  double v29;
  double v30;
  double v31;
  void *v33;
  double v34;
  uint64_t result;
  double v36;
  double v37;
  double v38;
  double v39;
  float64x2_t v41;

  v6 = (double)a3;
  v7 = -(double)a3;
  if (a3 >= 0)
    v7 = (double)a3;
  v8 = vaddq_f64(*(float64x2_t *)(a1 + 96), *(float64x2_t *)(a1 + 96));
  v9 = *(double *)a1 - v6 * v8.f64[0];
  v10 = *(double *)(a1 + 8) - vmuld_lane_f64(v6, v8, 1);
  v11 = vmulq_n_f64(*(float64x2_t *)(a1 + 72), v7);
  __asm { FMOV            V5.2D, #0.5 }
  v16 = vmulq_f64(vmulq_n_f64(v8, v7), _Q5);
  v17 = vsubq_f64(vnegq_f64(v11), v16);
  v18 = vaddq_f64(v16, v11);
  a4.f64[1] = a5;
  v19 = vmlaq_f64(v17, vaddq_f64(vmulq_f64(a4, _Q5), _Q5), vaddq_f64((float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v17), (int8x16_t)vnegq_f64(v17), (int8x16_t)v17), (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v18), (int8x16_t)vnegq_f64(v18), (int8x16_t)v18)));
  v20 = vdup_n_s32(a3 < 0);
  v21.i64[0] = v20.u32[0];
  v21.i64[1] = v20.u32[1];
  v22 = MEMORY[0x24BDBEFB0];
  v23 = vaddq_f64(*(float64x2_t *)(a1 + 48), (float64x2_t)vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v21, 0x3FuLL)), (int8x16_t)vnegq_f64(v19), (int8x16_t)v19));
  if (!*(_BYTE *)(a1 + 64))
  {
    if (!*(_BYTE *)(a1 + 65))
      goto LABEL_9;
    v24 = *(double *)(a1 + 88);
    v27.f64[0] = v23.f64[0];
LABEL_8:
    v28 = (v23.f64[1] - v10 * 0.5) * v24;
    v27.f64[1] = v10 * 0.5 + roundf(v28) / v24;
    v41 = v27;
    goto LABEL_10;
  }
  v24 = *(double *)(a1 + 88);
  v25 = (v23.f64[0] - v9 * 0.5) * v24;
  v26 = roundf(v25) / v24;
  v27.f64[0] = v9 * 0.5 + v26;
  if (*(_BYTE *)(a1 + 65))
    goto LABEL_8;
  v23.f64[0] = v9 * 0.5 + v26;
LABEL_9:
  v41 = v23;
LABEL_10:
  v29 = *MEMORY[0x24BDBEFB0];
  objc_msgSend(a2, "center", *(_QWORD *)&v41.f64[0]);
  if (v31 != v41.f64[0] || v30 != v41.f64[1])
  {
    objc_msgSend(a2, "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setPosition:", *(_OWORD *)&v41);

  }
  v34 = *(double *)(v22 + 8);
  result = objc_msgSend(a2, "bounds");
  if (v39 != v29 || v36 != v34)
    return objc_msgSend(a2, "setBounds:", v29, v34, v9, v10);
  if (v37 != v9 || v38 != v10)
    return objc_msgSend(a2, "setBounds:", v29, v34, v9, v10);
  return result;
}

void sub_21A9C20D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t MPUContentItemTypeIsContainerType(unint64_t a1)
{
  return (a1 < 0xF) & (0x67F8u >> a1);
}

void sub_21A9C4738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
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

const __CFString *MPUFontTextStyleGetDescription(uint64_t a1)
{
  return _MPUFontTextStyleGetDescriptionAndCustomStyleStatus(a1, 0);
}

const __CFString *_MPUFontTextStyleGetDescriptionAndCustomStyleStatus(uint64_t a1, char *a2)
{
  char v2;
  const __CFString *result;
  BOOL v4;

  switch(a1)
  {
    case 0:
      v2 = 0;
      result = CFSTR("body");
      break;
    case 1:
      v2 = 0;
      result = CFSTR("headline");
      break;
    case 2:
      v2 = 0;
      result = CFSTR("subheadline");
      break;
    case 3:
      v2 = 0;
      result = CFSTR("footnote");
      break;
    case 4:
      v2 = 0;
      result = CFSTR("caption-1");
      break;
    case 5:
      v2 = 0;
      result = CFSTR("caption-2");
      break;
    case 6:
      v2 = 0;
      result = CFSTR("title-0");
      break;
    case 7:
      v2 = 0;
      result = CFSTR("title-1");
      break;
    case 8:
      v2 = 0;
      result = CFSTR("title-2");
      break;
    case 9:
      v2 = 0;
      result = CFSTR("title-3");
      break;
    case 10:
      v2 = 0;
      result = CFSTR("headline-1");
      break;
    case 11:
      v2 = 0;
      result = CFSTR("headline-2");
      break;
    case 12:
      v2 = 0;
      result = CFSTR("subheadline-1");
      break;
    case 13:
      v2 = 0;
      result = CFSTR("subheadline-2");
      break;
    case 14:
      v2 = 0;
      result = CFSTR("callout");
      break;
    case 15:
      v2 = 0;
      result = CFSTR("footnote-1");
      break;
    case 16:
      v2 = 0;
      result = CFSTR("footnote-2");
      break;
    case 17:
      v2 = 1;
      result = CFSTR("subheadline-3");
      break;
    case 18:
      v2 = 1;
      result = CFSTR("now-playing-title-1");
      break;
    case 19:
      v2 = 0;
      result = CFSTR("music-title-2");
      break;
    case 20:
      v2 = 0;
      result = CFSTR("music-title-2-multiline");
      break;
    case 21:
      v2 = 1;
      result = CFSTR("page-header");
      break;
    case 22:
      v2 = 1;
      result = CFSTR("page-header-large");
      break;
    case 23:
      v2 = 1;
      result = CFSTR("page-header-mid-large");
      break;
    case 24:
      v2 = 1;
      result = CFSTR("page-header-small");
      break;
    case 25:
      v2 = 1;
      result = CFSTR("page-header-compact-supertitle");
      break;
    case 26:
      v2 = 1;
      result = CFSTR("page-header-compact-subtitle");
      break;
    case 27:
      v2 = 1;
      result = CFSTR("page-header-regular-subtitle");
      break;
    default:
      v4 = a1 == 1000;
      if (a1 == 1000)
        result = CFSTR("system-font");
      else
        result = 0;
      v2 = v4;
      break;
  }
  if (a2)
    *a2 = v2;
  return result;
}

__CFString *MPUFontWeightGetDescription(unint64_t a1)
{
  if (a1 > 8)
    return 0;
  else
    return off_24DD6E338[a1];
}

__CFString *MPUFontLeadingAdjustmentGetDescription(unint64_t a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_24DD6E380[a1];
}

void sub_21A9C5C20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t CoreTextLibrary_0()
{
  uint64_t v0;
  void *v2;

  if (!CoreTextLibraryCore_frameworkLibrary_0)
    CoreTextLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  v0 = CoreTextLibraryCore_frameworkLibrary_0;
  if (!CoreTextLibraryCore_frameworkLibrary_0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void sub_21A9C885C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A9C88D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t MPUNowPlayingIndicatorPlaybackStateFromMPPlaybackState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4)
    return 0;
  else
    return qword_21A9CF000[a1 - 1];
}

void sub_21A9CAEFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x24BDE5410]();
  return result;
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x24BDE55D8](retstr, tx, ty, tz);
}

CATransform3D *__cdecl CATransform3DRotate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x24BDE55E8](retstr, t, angle, x, y, z);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x24BDBD8B0](t1, t2);
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

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

void NSEndMapTableEnumeration(NSMapEnumerator *enumerator)
{
  MEMORY[0x24BDD0BD0](enumerator);
}

NSMapEnumerator *__cdecl NSEnumerateMapTable(NSMapEnumerator *__return_ptr retstr, NSMapTable *table)
{
  return (NSMapEnumerator *)MEMORY[0x24BDD0BD8](retstr, table);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x24BDD1018](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
  MEMORY[0x24BDD1020](table, key, value);
}

void NSMapRemove(NSMapTable *table, const void *key)
{
  MEMORY[0x24BDD1038](table, key);
}

BOOL NSNextMapEnumeratorPair(NSMapEnumerator *enumerator, void **key, void **value)
{
  return MEMORY[0x24BDD10F0](enumerator, key, value);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x24BDF74F0]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BDF78C8](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BDF78D0]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BDF78E0]();
}

uint64_t UIRectCenteredYInRectScale()
{
  return MEMORY[0x24BDF7CB8]();
}

void UIRectFillUsingBlendMode(CGRect rect, CGBlendMode blendMode)
{
  MEMORY[0x24BDF7CC8](*(_QWORD *)&blendMode, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x24BDF7CD8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _NSIsNSDictionary()
{
  return MEMORY[0x24BDBD168]();
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

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x24BEDAEF8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x24BEDAF00]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x24BEDAF10]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x24BEDAF30]();
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
  off_24DD6DBA0(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24DD6DBA8(__sz);
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x24BDAD220](__y, __x);
  return result;
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

htmlDocPtr htmlSAXParseDoc(const xmlChar *cur, const char *encoding, htmlSAXHandlerPtr sax, void *userData)
{
  return (htmlDocPtr)MEMORY[0x24BEDE5B8](cur, encoding, sax, userData);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

xmlChar *__cdecl xmlCharStrndup(const char *cur, int len)
{
  return (xmlChar *)MEMORY[0x24BEDE680](cur, *(_QWORD *)&len);
}

void xmlCleanupParser(void)
{
  MEMORY[0x24BEDE698]();
}

const char *__cdecl xmlGetCharEncodingName(xmlCharEncoding enc)
{
  return (const char *)MEMORY[0x24BEDE7C8](*(_QWORD *)&enc);
}

xmlEntityPtr xmlGetPredefinedEntity(const xmlChar *name)
{
  return (xmlEntityPtr)MEMORY[0x24BEDE820](name);
}

