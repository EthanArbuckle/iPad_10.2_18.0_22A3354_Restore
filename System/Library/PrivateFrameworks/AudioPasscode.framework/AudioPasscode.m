void sub_2295814B0(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;
  _QWORD *v3;

  MEMORY[0x22E2CB548](v2, 0x1091C4021E3608ALL);
  *v3 = 0;

  _Unwind_Resume(a1);
}

void sub_229581AE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, void *__p, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  uint64_t v49;
  _QWORD *v50;
  void *v51;

  MEMORY[0x22E2CB548](v49, 0x81C40B8603338);
  *v50 = 0;

  _Unwind_Resume(a1);
}

void sub_229582818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, _QWORD *a11, uint64_t a12, uint64_t a13)
{
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;

  std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::destroy((uint64_t)&a10, a11);
  v17 = a13;
  a13 = 0;
  if (v17)
    std::default_delete<EchoCodeEncoder>::operator()[abi:ne180100]((uint64_t)&a13, v17);

  _Unwind_Resume(a1);
}

void sub_229582AA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t (**std::any::reset[abi:ne180100](uint64_t (**result)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD)))(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD)
{
  if (*result)
    return (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*result)(0, result, 0, 0, 0);
  return result;
}

void std::vector<unsigned char>::__append(_QWORD *a1, unint64_t a2, _BYTE *a3)
{
  unint64_t v4;
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  unint64_t v9;
  unint64_t v10;
  size_t v11;
  void *v12;
  _BYTE *v13;
  char *v14;
  char *v15;
  _BYTE *v16;
  _BYTE *v17;
  char v18;

  v4 = a2;
  v7 = (_BYTE *)a1[1];
  v6 = a1[2];
  if (v6 - (uint64_t)v7 >= a2)
  {
    if (a2)
    {
      v13 = &v7[a2];
      do
      {
        *v7++ = *a3;
        --v4;
      }
      while (v4);
      v7 = v13;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = &v7[-*a1];
    v9 = (unint64_t)&v8[a2];
    if ((uint64_t)&v8[a2] < 0)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v10 = v6 - *a1;
    if (2 * v10 > v9)
      v9 = 2 * v10;
    if (v10 >= 0x3FFFFFFFFFFFFFFFLL)
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v11 = v9;
    if (v11)
      v12 = operator new(v11);
    else
      v12 = 0;
    v14 = &v8[(_QWORD)v12];
    v15 = &v8[(_QWORD)v12 + v4];
    v16 = &v8[(_QWORD)v12];
    do
    {
      *v16++ = *a3;
      --v4;
    }
    while (v4);
    v17 = (_BYTE *)*a1;
    if (v7 != (_BYTE *)*a1)
    {
      do
      {
        v18 = *--v7;
        *--v14 = v18;
      }
      while (v7 != v17);
      v7 = (_BYTE *)*a1;
    }
    *a1 = v14;
    a1[1] = v15;
    a1[2] = (char *)v12 + v11;
    if (v7)
      operator delete(v7);
  }
}

void std::vector<unsigned char>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24F24AF78, MEMORY[0x24BEDAAF0]);
}

void sub_229582C88(_Unwind_Exception *a1)
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

EchoCodeDecoder *std::unique_ptr<EchoCodeDecoder>::reset[abi:ne180100](EchoCodeDecoder **a1, EchoCodeDecoder *a2)
{
  EchoCodeDecoder *result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    EchoCodeDecoder::~EchoCodeDecoder(result);
    JUMPOUT(0x22E2CB548);
  }
  return result;
}

void EchoCodeDecoder::~EchoCodeDecoder(EchoCodeDecoder *this)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v2 = (void *)*((_QWORD *)this + 35);
  if (v2)
  {
    *((_QWORD *)this + 36) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((_QWORD *)this + 32);
  if (v3)
  {
    *((_QWORD *)this + 33) = v3;
    operator delete(v3);
  }
  v4 = (void *)*((_QWORD *)this + 29);
  if (v4)
  {
    *((_QWORD *)this + 30) = v4;
    operator delete(v4);
  }
  v5 = (void *)*((_QWORD *)this + 26);
  if (v5)
  {
    *((_QWORD *)this + 27) = v5;
    operator delete(v5);
  }
  v6 = (void *)*((_QWORD *)this + 23);
  if (v6)
  {
    *((_QWORD *)this + 24) = v6;
    operator delete(v6);
  }
  v7 = *((_QWORD *)this + 22);
  *((_QWORD *)this + 22) = 0;
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  v8 = *((_QWORD *)this + 21);
  *((_QWORD *)this + 21) = 0;
  if (v8)
    std::default_delete<EchoDetector>::operator()[abi:ne180100]((uint64_t)this + 168, v8);
  v9 = *((_QWORD *)this + 20);
  *((_QWORD *)this + 20) = 0;
  if (v9)
    std::default_delete<ShapingFilter>::operator()[abi:ne180100]((uint64_t)this + 160, v9);
  v10 = (void *)*((_QWORD *)this + 16);
  if (v10)
  {
    *((_QWORD *)this + 17) = v10;
    operator delete(v10);
  }
  std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::destroy((uint64_t)this + 80, *((_QWORD **)this + 11));
}

{
  EchoCodeDecoder::~EchoCodeDecoder(this);
  JUMPOUT(0x22E2CB548);
}

void std::default_delete<EchoDetector>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;

  if (a2)
  {
    v3 = *(void **)(a2 + 72);
    if (v3)
    {
      *(_QWORD *)(a2 + 80) = v3;
      operator delete(v3);
    }
    v4 = *(void **)(a2 + 48);
    if (v4)
    {
      *(_QWORD *)(a2 + 56) = v4;
      operator delete(v4);
    }
    v5 = *(void **)(a2 + 24);
    if (v5)
    {
      *(_QWORD *)(a2 + 32) = v5;
      operator delete(v5);
    }
    std::unique_ptr<OpaqueFFTSetup,applesauce::raii::v1::detail::opaque_deletion_functor<OpaqueFFTSetup*,&(vDSP_destroy_fftsetup)>>::reset[abi:ne180100]((OpaqueFFTSetup **)(a2 + 8), 0);
    JUMPOUT(0x22E2CB548);
  }
}

void std::unique_ptr<OpaqueFFTSetup,applesauce::raii::v1::detail::opaque_deletion_functor<OpaqueFFTSetup*,&(vDSP_destroy_fftsetup)>>::reset[abi:ne180100](OpaqueFFTSetup **a1, OpaqueFFTSetup *a2)
{
  OpaqueFFTSetup *v3;

  v3 = *a1;
  *a1 = a2;
  if (v3)
    vDSP_destroy_fftsetup(v3);
}

uint64_t std::default_delete<ShapingFilter>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t result;
  void **v4;

  if (a2)
  {
    std::unique_ptr<vDSP_biquad_SetupStruct,applesauce::raii::v1::detail::opaque_deletion_functor<vDSP_biquad_SetupStruct*,&(vDSP_biquad_DestroySetup)>>::reset[abi:ne180100]((vDSP_biquad_SetupStruct **)(a2 + 32), 0);
    v4 = (void **)(a2 + 8);
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v4);
    return MEMORY[0x22E2CB548](a2, 0x1020C409A1C8018);
  }
  return result;
}

void std::unique_ptr<vDSP_biquad_SetupStruct,applesauce::raii::v1::detail::opaque_deletion_functor<vDSP_biquad_SetupStruct*,&(vDSP_biquad_DestroySetup)>>::reset[abi:ne180100](vDSP_biquad_SetupStruct **a1, vDSP_biquad_SetupStruct *a2)
{
  vDSP_biquad_SetupStruct *v3;

  v3 = *a1;
  *a1 = a2;
  if (v3)
    vDSP_biquad_DestroySetup(v3);
}

void std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::vector<float>>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<std::vector<float>>::__clear[abi:ne180100](uint64_t *a1)
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
      v6 = *(void **)(v4 - 24);
      v4 -= 24;
      v5 = v6;
      if (v6)
      {
        *(_QWORD *)(v2 - 16) = v5;
        operator delete(v5);
      }
      v2 = v4;
    }
    while (v4 != v3);
  }
  a1[1] = v3;
}

void std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100](int a1)
{
  __asm { BR              X10 }
}

uint64_t sub_229582FB0()
{
  _QWORD *v0;
  uint64_t result;

  result = 0;
  *v0 = 0;
  return result;
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (v2 == v3)
    return 1;
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3))
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  return 0;
}

void std::__any_imp::_SmallHandler<float>::__handle[abi:ne180100](int a1)
{
  __asm { BR              X10 }
}

uint64_t sub_2295830B4()
{
  _QWORD *v0;
  uint64_t result;

  result = 0;
  *v0 = 0;
  return result;
}

uint64_t **std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(uint64_t **a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  uint64_t *v6;
  uint64_t **v7;
  uint64_t **v8;
  uint64_t **v9;
  unsigned int v10;
  unsigned int v11;
  _DWORD *v12;
  _QWORD v14[2];
  char v15;

  v7 = a1 + 1;
  v6 = a1[1];
  v8 = a1 + 1;
  v9 = a1 + 1;
  if (v6)
  {
    v10 = *a2;
    while (1)
    {
      while (1)
      {
        v9 = (uint64_t **)v6;
        v11 = *((_DWORD *)v6 + 8);
        if (v10 >= v11)
          break;
        v6 = *v9;
        v8 = v9;
        if (!*v9)
          goto LABEL_9;
      }
      if (v11 >= v10)
        break;
      v6 = v9[1];
      if (!v6)
      {
        v8 = v9 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v12 = operator new(0x48uLL);
    v14[1] = v7;
    v12[8] = **a4;
    *((_QWORD *)v12 + 5) = 0;
    *((_QWORD *)v12 + 6) = 0;
    v15 = 1;
    std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__insert_node_at(a1, (uint64_t)v9, v8, (uint64_t *)v12);
    v14[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<unsigned int,std::any>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<unsigned int,std::any>,void *>>>>::reset[abi:ne180100]((uint64_t)v14, 0);
    return (uint64_t **)v12;
  }
  return v9;
}

uint64_t *std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
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
  result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
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

void std::unique_ptr<std::__tree_node<std::__value_type<unsigned int,std::any>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<unsigned int,std::any>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t (**v2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);

  v2 = *(uint64_t (***)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::any::reset[abi:ne180100](v2 + 5);
    operator delete(v2);
  }
}

void std::default_delete<EchoCodeEncoder>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a2)
  {
    std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::destroy(a2 + 152, *(_QWORD **)(a2 + 160));
    v3 = *(void **)(a2 + 128);
    if (v3)
    {
      *(_QWORD *)(a2 + 136) = v3;
      operator delete(v3);
    }
    v4 = *(void **)(a2 + 104);
    if (v4)
    {
      *(_QWORD *)(a2 + 112) = v4;
      operator delete(v4);
    }
    v5 = *(_QWORD *)(a2 + 96);
    *(_QWORD *)(a2 + 96) = 0;
    if (v5)
      (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
    v6 = *(_QWORD *)(a2 + 88);
    *(_QWORD *)(a2 + 88) = 0;
    if (v6)
      std::default_delete<ShapingFilter>::operator()[abi:ne180100](a2 + 88, v6);
    v7 = *(_QWORD *)(a2 + 80);
    *(_QWORD *)(a2 + 80) = 0;
    if (v7)
      std::default_delete<ShapingFilter>::operator()[abi:ne180100](a2 + 80, v7);
    v8 = *(_QWORD *)(a2 + 72);
    *(_QWORD *)(a2 + 72) = 0;
    if (v8)
      (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
    JUMPOUT(0x22E2CB548);
  }
}

void std::__any_imp::_SmallHandler<BOOL>::__handle[abi:ne180100](int a1)
{
  __asm { BR              X10 }
}

uint64_t sub_22958353C()
{
  _QWORD *v0;
  uint64_t result;

  result = 0;
  *v0 = 0;
  return result;
}

void std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::destroy(a1, a2[1]);
    std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))a2 + 5);
    operator delete(a2);
  }
}

uint64_t (**std::any_cast[abi:ne180100]<unsigned int>(uint64_t (**result)(uint64_t, _QWORD, _QWORD, _QWORD, void *)))(uint64_t, _QWORD, _QWORD, _QWORD, void *)
{
  if (result)
  {
    if (*result)
      return (uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(*result)(3, result, 0, MEMORY[0x24BEDB7A0], &std::__any_imp::__unique_typeinfo<unsigned int>::__id);
    else
      return 0;
  }
  return result;
}

{
  if (result)
  {
    if (*result)
      return (uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(*result)(3, result, 0, MEMORY[0x24BEDB7A0], &std::__any_imp::__unique_typeinfo<unsigned int>::__id);
    else
      return 0;
  }
  return result;
}

void std::__throw_bad_any_cast[abi:ne180100]()
{
  std::bad_any_cast *exception;
  std::bad_cast *v1;

  exception = (std::bad_any_cast *)__cxa_allocate_exception(8uLL);
  exception->__vftable = 0;
  v1 = std::bad_any_cast::bad_any_cast(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB728], (void (*)(void *))std::bad_any_cast::~bad_any_cast);
}

std::bad_cast *std::bad_any_cast::bad_any_cast(std::bad_any_cast *this)
{
  std::bad_cast *result;

  result = std::bad_cast::bad_cast(this);
  result->__vftable = (std::bad_cast_vtbl *)(MEMORY[0x24BEDB8A8] + 16);
  return result;
}

void sub_2295837F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_229583A04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_229583B50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_229583BE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_229583D24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_229583F7C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2295840FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_229584194(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2295842AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_229584558(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_2295846E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_229584D4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

void sub_229584F6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void EchoCodeDecoder::EchoCodeDecoder(EchoCodeDecoder *this)
{
  uint64_t *v1;
  uint64_t *v2;
  EchoDetector *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)this = &off_24F24B320;
  *((_QWORD *)this + 1) = &unk_24F24B370;
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 2) = 0;
  *((_BYTE *)this + 40) = 0;
  *(_QWORD *)((char *)this + 44) = 0;
  *(_QWORD *)((char *)this + 60) = 0;
  *(_QWORD *)((char *)this + 52) = 0;
  *((_DWORD *)this + 17) = 100;
  *((_QWORD *)this + 11) = 0;
  *((_QWORD *)this + 10) = (char *)this + 88;
  *((_BYTE *)this + 72) = 0;
  *((_QWORD *)this + 16) = 0;
  *((_QWORD *)this + 13) = 0;
  *((_QWORD *)this + 14) = 0;
  *((_QWORD *)this + 12) = 0;
  *((_DWORD *)this + 30) = 0;
  *((_DWORD *)this + 38) = 0;
  *((_QWORD *)this + 17) = 0;
  *((_QWORD *)this + 18) = 0;
  *((_OWORD *)this + 10) = 0u;
  v1 = (uint64_t *)((char *)this + 160);
  v2 = (uint64_t *)((char *)this + 168);
  *((_OWORD *)this + 17) = 0u;
  *((_OWORD *)this + 18) = 0u;
  *((_OWORD *)this + 15) = 0u;
  *((_OWORD *)this + 16) = 0u;
  *((_OWORD *)this + 13) = 0u;
  *((_OWORD *)this + 14) = 0u;
  *((_OWORD *)this + 11) = 0u;
  *((_OWORD *)this + 12) = 0u;
  v3 = (EchoDetector *)operator new();
  EchoDetector::EchoDetector(v3);
  v4 = *v2;
  *v2 = (uint64_t)v3;
  if (v4)
    std::default_delete<EchoDetector>::operator()[abi:ne180100]((uint64_t)v2, v4);
  v5 = operator new();
  *(_QWORD *)v5 = 0x100000000;
  *(_OWORD *)(v5 + 8) = 0u;
  *(_OWORD *)(v5 + 24) = 0u;
  v6 = *v1;
  *v1 = v5;
  if (v6)
    std::default_delete<ShapingFilter>::operator()[abi:ne180100]((uint64_t)v1, v6);
}

void sub_229585220(_Unwind_Exception *a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  _QWORD **v5;
  void **v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v8 = (void *)v1[35];
  if (v8)
  {
    v1[36] = v8;
    operator delete(v8);
  }
  v9 = (void *)v1[32];
  if (v9)
  {
    v1[33] = v9;
    operator delete(v9);
  }
  v10 = (void *)v1[29];
  if (v10)
  {
    v1[30] = v10;
    operator delete(v10);
  }
  v11 = (void *)v1[26];
  if (v11)
  {
    v1[27] = v11;
    operator delete(v11);
  }
  v12 = (void *)v1[23];
  if (v12)
  {
    v1[24] = v12;
    operator delete(v12);
  }
  v13 = v1[22];
  v1[22] = 0;
  if (v13)
    (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
  v14 = *v4;
  *v4 = 0;
  if (v14)
    std::default_delete<EchoDetector>::operator()[abi:ne180100]((uint64_t)v4, v14);
  v15 = *v3;
  *v3 = 0;
  if (v15)
    std::default_delete<ShapingFilter>::operator()[abi:ne180100]((uint64_t)v3, v15);
  v16 = *v6;
  if (*v6)
  {
    v1[17] = v16;
    operator delete(v16);
  }
  std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::destroy(v2, *v5);
  _Unwind_Resume(a1);
}

uint64_t EchoCodeDecoder::initialize(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  _BOOL4 SyncType;
  unsigned int v6;
  char v7;
  NSObject *v8;
  double v9;
  _BOOL4 v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  unsigned int SRCFreeFrameSize;
  int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  int v21;
  int v22;
  unint64_t v23;
  int v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  result = EchoCodeDecoder::loadAPCConfig(a1, a2);
  if ((_DWORD)result)
    return result;
  if (!*(_DWORD *)(a1 + 24))
    *(_DWORD *)(a1 + 24) = 2048;
  if (!*(_DWORD *)(a1 + 28))
    *(_DWORD *)(a1 + 28) = 2;
  if (*(float *)(a1 + 32) == 0.0)
    *(_DWORD *)(a1 + 32) = 990057071;
  if (*(float *)(a1 + 36) == 0.0)
    *(_DWORD *)(a1 + 36) = 1006834287;
  if (*(float *)(a1 + 64) == 0.0)
    *(_DWORD *)(a1 + 64) = 1183621120;
  v4 = *(unsigned int *)(a1 + 68);
  if (!(_DWORD)v4)
  {
    v4 = 100;
    *(_DWORD *)(a1 + 68) = 100;
  }
  SyncType = echoCodec::getSyncType((echoCodec *)v4);
  v6 = *(_DWORD *)(a1 + 24);
  if (!*(_DWORD *)(a1 + 56))
  {
    if (SyncType)
      v7 = 6;
    else
      v7 = 4;
    *(_DWORD *)(a1 + 56) = v6 >> v7;
  }
  v8 = APCLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (float)((float)*(unsigned int *)(a1 + 68) / 100.0);
    v24 = 134217984;
    v25 = v9;
    _os_log_impl(&dword_229580000, v8, OS_LOG_TYPE_INFO, "APC decoder algorithm version: %3.2f", (uint8_t *)&v24, 0xCu);
  }
  v10 = echoCodec::getSyncType((echoCodec *)*(unsigned int *)(a1 + 68));
  v11 = v10;
  if (v10)
  {
    if (!v10)
      return 4294967289;
    v12 = operator new();
    *(_QWORD *)(v12 + 352) = 0;
    *(_OWORD *)(v12 + 320) = 0u;
    *(_OWORD *)(v12 + 336) = 0u;
    *(_OWORD *)(v12 + 288) = 0u;
    *(_OWORD *)(v12 + 304) = 0u;
    *(_OWORD *)(v12 + 256) = 0u;
    *(_OWORD *)(v12 + 272) = 0u;
    *(_OWORD *)(v12 + 224) = 0u;
    *(_OWORD *)(v12 + 240) = 0u;
    *(_OWORD *)(v12 + 192) = 0u;
    *(_OWORD *)(v12 + 208) = 0u;
    *(_OWORD *)(v12 + 160) = 0u;
    *(_OWORD *)(v12 + 176) = 0u;
    *(_OWORD *)(v12 + 128) = 0u;
    *(_OWORD *)(v12 + 144) = 0u;
    *(_OWORD *)(v12 + 96) = 0u;
    *(_OWORD *)(v12 + 112) = 0u;
    *(_OWORD *)(v12 + 64) = 0u;
    *(_OWORD *)(v12 + 80) = 0u;
    *(_OWORD *)(v12 + 32) = 0u;
    *(_OWORD *)(v12 + 48) = 0u;
    *(_OWORD *)v12 = 0u;
    *(_OWORD *)(v12 + 16) = 0u;
    SyncEchoDetector::SyncEchoDetector((SyncEchoDetector *)v12);
    v13 = *(_QWORD *)(a1 + 176);
    *(_QWORD *)(a1 + 176) = v12;
    if (!v13)
      goto LABEL_27;
    goto LABEL_26;
  }
  v14 = operator new();
  *(_OWORD *)(v14 + 96) = 0u;
  *(_OWORD *)(v14 + 112) = 0u;
  *(_OWORD *)(v14 + 128) = 0u;
  *(_OWORD *)(v14 + 144) = 0u;
  *(_OWORD *)v14 = 0u;
  *(_OWORD *)(v14 + 16) = 0u;
  *(_OWORD *)(v14 + 32) = 0u;
  *(_OWORD *)(v14 + 48) = 0u;
  *(_OWORD *)(v14 + 64) = 0u;
  *(_OWORD *)(v14 + 80) = 0u;
  *(_OWORD *)(v14 + 160) = 0u;
  *(_QWORD *)v14 = &unk_24F24B928;
  *(_OWORD *)(v14 + 104) = 0u;
  *(_OWORD *)(v14 + 120) = 0u;
  *(_OWORD *)(v14 + 136) = 0u;
  *(_QWORD *)(v14 + 12) = 0;
  *(_QWORD *)(v14 + 17) = 0;
  *(_OWORD *)(v14 + 28) = 0u;
  *(_OWORD *)(v14 + 44) = 0u;
  *(_OWORD *)(v14 + 60) = 0u;
  *(_OWORD *)(v14 + 76) = 0u;
  *(_QWORD *)(v14 + 92) = 0;
  *(_DWORD *)(v14 + 152) = -1;
  *(_QWORD *)(v14 + 264) = 0;
  *(_OWORD *)(v14 + 248) = 0u;
  *(_OWORD *)(v14 + 232) = 0u;
  *(_OWORD *)(v14 + 216) = 0u;
  *(_OWORD *)(v14 + 200) = 0u;
  *(_OWORD *)(v14 + 184) = 0u;
  *(_OWORD *)(v14 + 168) = 0u;
  v13 = *(_QWORD *)(a1 + 176);
  *(_QWORD *)(a1 + 176) = v14;
  if (v13)
LABEL_26:
    (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
LABEL_27:
  v15 = !v11;
  *(_DWORD *)(a1 + 24) = echoCodec::getSRCFreeFrameSize((echoCodec *)*(unsigned int *)(a1 + 24), *(_DWORD *)(a1 + 16));
  *(_DWORD *)(a1 + 56) = echoCodec::getSRCFreeFrameSize((echoCodec *)*(unsigned int *)(a1 + 56), *(_DWORD *)(a1 + 16));
  SRCFreeFrameSize = echoCodec::getSRCFreeFrameSize((echoCodec *)(v6 >> 2), *(_DWORD *)(a1 + 16));
  v17 = *(_DWORD *)(a1 + 24);
  v18 = *(_DWORD *)(a1 + 28) * v17 - SRCFreeFrameSize;
  *(_DWORD *)(a1 + 52) = v18;
  v19 = v18 - v17;
  v20 = *(_DWORD *)(a1 + 56);
  v21 = v19 / v20;
  *(_DWORD *)(a1 + 60) = v19 / v20;
  if (v15)
  {
    if ((v21 & 1) == 0)
    {
      if (v21 <= 2)
        v22 = 2;
      else
        v22 = v19 / v20;
      v21 = v22 - 1;
      *(_DWORD *)(a1 + 60) = v22 - 1;
    }
    BitCounter::initialize((BitCounter *)(a1 + 104), v21, 0);
  }
  else
  {
    BitCounter::initialize((BitCounter *)(a1 + 104), v18 / v20, 0);
  }
  (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 176) + 32))(*(_QWORD *)(a1 + 176), a1 + 80);
  if (!(*(unsigned int (**)(_QWORD, _QWORD, _QWORD))(**(_QWORD **)(a1 + 176) + 16))(*(_QWORD *)(a1 + 176), *(unsigned int *)(a1 + 16), *(unsigned int *)(a1 + 24)))return 4294967290;
  EchoDetector::initialize(*(EchoDetector **)(a1 + 168), *(_DWORD *)(a1 + 24), *(_DWORD *)(a1 + 16), (const float *)(a1 + 32));
  ShapingFilter::initialize(*(_QWORD *)(a1 + 160), 1, *(_DWORD *)(a1 + 16), 1u, 1, *(float *)(a1 + 64));
  std::vector<float>::resize(a1 + 208, *(_DWORD *)(a1 + 28) * *(_DWORD *)(a1 + 24) - SRCFreeFrameSize);
  v23 = *(_DWORD *)(a1 + 24) + (float)((float)*(unsigned int *)(a1 + 16) * 0.05) - 1;
  v24 = 0;
  std::vector<float>::resize(a1 + 232, v23, &v24);
  std::vector<float>::resize(a1 + 256, *(unsigned int *)(a1 + 24));
  std::vector<unsigned char>::reserve((unint64_t *)(a1 + 280), (8 * *(_DWORD *)(a1 + 20)));
  result = 0;
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a1 + 280);
  *(_BYTE *)(a1 + 40) = 0;
  *(_DWORD *)(a1 + 44) = 0;
  *(_DWORD *)(a1 + 48) = 0;
  return result;
}

void sub_229585748(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x22E2CB548](v1, 0x10B1C403C28CA08);
  _Unwind_Resume(a1);
}

uint64_t EchoCodeDecoder::loadAPCConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  __int128 v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  __int128 v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char *v28;
  char *v29;
  char *v30;
  char *v31;
  char *v32;
  __int128 v33;
  uint64_t v34;
  char *v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  char *v39;
  char *v40;
  char *v41;
  char *v42;
  char *v43;
  __int128 v44;
  uint64_t v45;
  void *__p;
  char *v48;
  char *v49;
  uint64_t v50;

  v49 = 0;
  v50 = a2;
  __p = 0;
  v48 = 0;
  v4 = std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>((uint64_t)&v49, 1uLL);
  v5 = 0;
  v6 = (char *)&v4[3 * v3];
  *(_DWORD *)v4 = 0;
  v4[1] = a1 + 16;
  *((_DWORD *)v4 + 4) = 1;
  v7 = (char *)(v4 + 3);
  v8 = v48;
  v9 = (char *)v4;
  if (v48)
  {
    do
    {
      v10 = *(_OWORD *)(v8 - 24);
      *((_DWORD *)v9 - 2) = *((_DWORD *)v8 - 2);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      v8 -= 24;
    }
    while (v8);
    v5 = __p;
  }
  __p = v9;
  v48 = (char *)(v4 + 3);
  v49 = (char *)&v4[3 * v3];
  if (v5)
  {
    operator delete(v5);
    v6 = v49;
  }
  v48 = (char *)(v4 + 3);
  v11 = a1 + 20;
  if (v7 >= v6)
  {
    v13 = 0xAAAAAAAAAAAAAAABLL * ((v7 - (_BYTE *)__p) >> 3);
    if (v13 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v14 = 0xAAAAAAAAAAAAAAABLL * ((v6 - (_BYTE *)__p) >> 3);
    v15 = 2 * v14;
    if (2 * v14 <= v13 + 1)
      v15 = v13 + 1;
    if (v14 >= 0x555555555555555)
      v16 = 0xAAAAAAAAAAAAAAALL;
    else
      v16 = v15;
    if (v16)
      v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>((uint64_t)&v49, v16);
    else
      v17 = 0;
    v18 = &v17[8 * ((v7 - (_BYTE *)__p) >> 3)];
    v19 = &v17[24 * v16];
    *(_DWORD *)v18 = 3;
    *((_QWORD *)v18 + 1) = v11;
    *((_DWORD *)v18 + 4) = 1;
    v12 = v18 + 24;
    v21 = (char *)__p;
    v20 = v48;
    if (v48 != __p)
    {
      do
      {
        v22 = *(_OWORD *)(v20 - 24);
        *((_DWORD *)v18 - 2) = *((_DWORD *)v20 - 2);
        *(_OWORD *)(v18 - 24) = v22;
        v18 -= 24;
        v20 -= 24;
      }
      while (v20 != v21);
      v20 = (char *)__p;
    }
    __p = v18;
    v48 = v12;
    v49 = v19;
    if (v20)
      operator delete(v20);
  }
  else
  {
    *((_DWORD *)v4 + 6) = 3;
    v4[4] = v11;
    *((_DWORD *)v4 + 10) = 1;
    v12 = (char *)(v4 + 6);
  }
  v48 = v12;
  v23 = a1 + 64;
  if (v12 >= v49)
  {
    v25 = 0xAAAAAAAAAAAAAAABLL * ((v12 - (_BYTE *)__p) >> 3);
    if (v25 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v26 = 0x5555555555555556 * ((v49 - (_BYTE *)__p) >> 3);
    if (v26 <= v25 + 1)
      v26 = v25 + 1;
    if (0xAAAAAAAAAAAAAAABLL * ((v49 - (_BYTE *)__p) >> 3) >= 0x555555555555555)
      v27 = 0xAAAAAAAAAAAAAAALL;
    else
      v27 = v26;
    if (v27)
      v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>((uint64_t)&v49, v27);
    else
      v28 = 0;
    v29 = &v28[24 * v25];
    v30 = &v28[24 * v27];
    *(_DWORD *)v29 = 111;
    *((_QWORD *)v29 + 1) = v23;
    *((_DWORD *)v29 + 4) = 0;
    v24 = v29 + 24;
    v32 = (char *)__p;
    v31 = v48;
    if (v48 != __p)
    {
      do
      {
        v33 = *(_OWORD *)(v31 - 24);
        *((_DWORD *)v29 - 2) = *((_DWORD *)v31 - 2);
        *(_OWORD *)(v29 - 24) = v33;
        v29 -= 24;
        v31 -= 24;
      }
      while (v31 != v32);
      v31 = (char *)__p;
    }
    __p = v29;
    v48 = v24;
    v49 = v30;
    if (v31)
      operator delete(v31);
  }
  else
  {
    *(_DWORD *)v12 = 111;
    *((_QWORD *)v12 + 1) = v23;
    *((_DWORD *)v12 + 4) = 0;
    v24 = v12 + 24;
  }
  v48 = v24;
  v34 = a1 + 68;
  if (v24 >= v49)
  {
    v36 = 0xAAAAAAAAAAAAAAABLL * ((v24 - (_BYTE *)__p) >> 3);
    if (v36 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v37 = 0x5555555555555556 * ((v49 - (_BYTE *)__p) >> 3);
    if (v37 <= v36 + 1)
      v37 = v36 + 1;
    if (0xAAAAAAAAAAAAAAABLL * ((v49 - (_BYTE *)__p) >> 3) >= 0x555555555555555)
      v38 = 0xAAAAAAAAAAAAAAALL;
    else
      v38 = v37;
    if (v38)
      v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>((uint64_t)&v49, v38);
    else
      v39 = 0;
    v40 = &v39[24 * v36];
    v41 = &v39[24 * v38];
    *(_DWORD *)v40 = 113;
    *((_QWORD *)v40 + 1) = v34;
    *((_DWORD *)v40 + 4) = 1;
    v35 = v40 + 24;
    v43 = (char *)__p;
    v42 = v48;
    if (v48 != __p)
    {
      do
      {
        v44 = *(_OWORD *)(v42 - 24);
        *((_DWORD *)v40 - 2) = *((_DWORD *)v42 - 2);
        *(_OWORD *)(v40 - 24) = v44;
        v40 -= 24;
        v42 -= 24;
      }
      while (v42 != v43);
      v42 = (char *)__p;
    }
    __p = v40;
    v48 = v35;
    v49 = v41;
    if (v42)
      operator delete(v42);
  }
  else
  {
    *(_DWORD *)v24 = 113;
    *((_QWORD *)v24 + 1) = v34;
    *((_DWORD *)v24 + 4) = 1;
    v35 = v24 + 24;
  }
  v48 = v35;
  v45 = APCConfigReader::loadParams((uint64_t)&v50, &__p);
  if (__p)
  {
    v48 = (char *)__p;
    operator delete(__p);
  }
  return v45;
}

void sub_229585B60(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::vector<float>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2;

  v2 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 2;
  if (a2 <= v2)
  {
    if (a2 < v2)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 4 * a2;
  }
  else
  {
    std::vector<float>::__append((char **)a1, a2 - v2);
  }
}

void std::vector<float>::resize(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  unint64_t v3;

  v3 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 2;
  if (a2 <= v3)
  {
    if (a2 < v3)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 4 * a2;
  }
  else
  {
    std::vector<float>::__append((void **)a1, a2 - v3, a3);
  }
}

void std::vector<unsigned char>::reserve(unint64_t *a1, size_t __sz)
{
  unint64_t v2;
  char *v5;
  _BYTE *v6;
  char *v7;
  _BYTE *v8;
  char *v9;
  char v10;

  v2 = *a1;
  if (a1[2] - *a1 < __sz)
  {
    if ((__sz & 0x8000000000000000) != 0)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v5 = (char *)a1[1];
    v6 = operator new(__sz);
    v7 = &v5[(_QWORD)v6 - v2];
    v8 = v7;
    if (v5 != (char *)v2)
    {
      v9 = &v5[~v2];
      do
      {
        v10 = *--v5;
        (v9--)[(_QWORD)v6] = v10;
      }
      while (v5 != (char *)v2);
      v8 = v6;
    }
    *a1 = (unint64_t)v8;
    a1[1] = (unint64_t)v7;
    a1[2] = (unint64_t)&v6[__sz];
    if (v2)
      operator delete((void *)v2);
  }
}

uint64_t `non-virtual thunk to'EchoCodeDecoder::initialize(uint64_t a1, uint64_t a2)
{
  return EchoCodeDecoder::initialize(a1 - 8, a2);
}

uint64_t EchoCodeDecoder::reset(ShapingFilter **this)
{
  ShapingFilter::reset(this[20]);
  this[36] = this[35];
  BitCounter::reset((BitCounter *)(this + 13), 0);
  (*(void (**)(ShapingFilter *))(*(_QWORD *)this[22] + 24))(this[22]);
  *((_BYTE *)this + 40) = 0;
  *((_DWORD *)this + 11) = 0;
  *((_DWORD *)this + 12) = 0;
  *((_BYTE *)this + 72) = 0;
  return 0;
}

uint64_t `non-virtual thunk to'EchoCodeDecoder::reset(ShapingFilter **this)
{
  EchoCodeDecoder::reset(this - 1);
  return 0;
}

uint64_t EchoCodeDecoder::decode(EchoCodeDecoder *this, const float *a2, unsigned int *a3, unsigned __int8 *a4)
{
  _BOOL4 SyncType;

  SyncType = echoCodec::getSyncType((echoCodec *)*((unsigned int *)this + 17));
  if (SyncType)
    return EchoCodeDecoder::decodeWithSyncEcho(this, a2, a3, a4);
  if (SyncType)
    return 4294967291;
  return EchoCodeDecoder::decodeWithSyncSeq(this, a2, *a3, a4);
}

uint64_t EchoCodeDecoder::decodeWithSyncSeq(EchoCodeDecoder *this, const float *a2, uint64_t a3, unsigned __int8 *a4)
{
  int v5;
  const float *v6;
  NSObject *v8;
  uint64_t v9;
  unsigned int v10;
  vDSP_Length v11;
  unsigned int v12;
  uint64_t result;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  int v17;
  int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  uint8_t buf[12];
  unsigned int v24;

  v5 = a3;
  v6 = a2;
  v24 = 0;
  if (!(*(unsigned int (**)(_QWORD, const float *, uint64_t, unsigned int *, _QWORD))(**((_QWORD **)this + 22)
                                                                                               + 40))(*((_QWORD *)this + 22), a2, a3, &v24, 0))return 2;
  if (*((_DWORD *)this + 12) >= (8 * *((_DWORD *)this + 5)))
    return 4;
  if ((v24 & 0x80000000) == 0)
  {
    v6 += v24;
    v5 -= v24;
    *((_DWORD *)this + 11) = 0;
    v8 = APCLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_229580000, v8, OS_LOG_TYPE_INFO, "The beginning of the passcode has been found!", buf, 2u);
    }
  }
  if (v5 < 1)
    return 3;
  v9 = *((unsigned int *)this + 11);
  v10 = *((_DWORD *)this + 13) - v9;
  v11 = v10 >= v5 ? v5 : v10;
  ShapingFilter::filter(*((ShapingFilter **)this + 20), v6, (float *)(*((_QWORD *)this + 26) + 4 * v9), v11);
  v12 = *((_DWORD *)this + 11) + v11;
  *((_DWORD *)this + 11) = v12;
  if (v12 < *((_DWORD *)this + 13))
    return 3;
  while (1)
  {
    if (*((_DWORD *)this + 15))
    {
      v14 = 0;
      do
      {
        v22 = 0;
        if (EchoDetector::decodeEcho(*((EchoDetector **)this + 21), (const float *)(*((_QWORD *)this + 26) + 4 * *((_DWORD *)this + 14) * v14), *((_DWORD *)this + 6), (_BOOL4 *)&v22, 0))BitCounter::count((uint64_t)this + 104, v22);
        else
          BitCounter::count((uint64_t)this + 104);
        ++v14;
      }
      while (v14 < *((_DWORD *)this + 15));
    }
    *a4 = 0;
    v15 = *((_DWORD *)this + 28);
    v16 = *((_DWORD *)this + 29);
    if (v15 == v16)
      break;
    if (v15 < v16)
      *a4 = 1;
    BitCounter::reset((EchoCodeDecoder *)((char *)this + 104), 0);
    v17 = *((_DWORD *)this + 11);
    ++*((_DWORD *)this + 12);
    memmove(*((void **)this + 26), (const void *)(*((_QWORD *)this + 26) + 4 * *((unsigned int *)this + 13)), 4 * (v17 - *((_DWORD *)this + 13)));
    v18 = *((_DWORD *)this + 13);
    v19 = *((_DWORD *)this + 11) - v18;
    *((_DWORD *)this + 11) = v19;
    v5 -= v11;
    if (v5 <= 0)
      return 0;
    v6 += v11;
    v20 = v18 - v19;
    if (v20 >= v5)
      v11 = v5;
    else
      v11 = v20;
    ShapingFilter::filter(*((ShapingFilter **)this + 20), v6, (float *)(*((_QWORD *)this + 26) + 4 * v19), v11);
    result = 0;
    v21 = *((_DWORD *)this + 11) + v11;
    *((_DWORD *)this + 11) = v21;
    if (v21 < *((_DWORD *)this + 13))
      return result;
  }
  if (v15)
    return 4294967292;
  else
    return 4294967294;
}

uint64_t EchoCodeDecoder::decodeWithSyncEcho(EchoCodeDecoder *this, const float *a2, unsigned int *a3, unsigned __int8 *a4)
{
  const float *v5;
  uint64_t v7;
  unsigned int v8;
  int v9;
  int v10;
  unsigned int v11;
  vDSP_Length v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int v16;
  int v17;
  unsigned int v18;
  unsigned int v19;
  vDSP_Length v20;
  uint64_t v21;
  unsigned int v22;
  vDSP_Length v23;
  unsigned int v24;
  int v25;
  unsigned int v26;
  int v27;
  int v28;
  int v29;
  NSObject *v30;
  NSObject *v31;
  uint8_t v34[16];
  uint8_t buf[8];
  unsigned int v36;
  int v37;

  v5 = a2;
  v7 = *a3;
  EchoCodeDecoder::decodeWithSyncEcho(float const*,unsigned int &,unsigned char &)::count += v7;
  v37 = 0;
  if (*((_DWORD *)this + 12) >= (8 * *((_DWORD *)this + 5)))
  {
    v15 = 4;
  }
  else
  {
    if ((*(unsigned int (**)(_QWORD, const float *, uint64_t, int *, _QWORD))(**((_QWORD **)this + 22) + 40))(*((_QWORD *)this + 22), a2, v7, &v37, 0))
    {
      v8 = *((_DWORD *)this + 11);
      v9 = v37;
      if ((int)(v37 + v8) >= 0)
      {
        v10 = v37 & (v37 >> 31);
        v11 = v10 + v8;
        memmove(*((void **)this + 26), (const void *)(*((_QWORD *)this + 26) + 4 * (v10 + v8)), 4 * -v10);
        v8 = *((_DWORD *)this + 11) - v11;
        *((_DWORD *)this + 11) = v8;
        v9 = v37;
      }
      if ((v9 & 0x80000000) == 0)
      {
        if ((int)v7 >= v9)
          v12 = v9;
        else
          v12 = v7;
        v13 = *((_DWORD *)this + 13) - v8;
        v14 = v12 - v13;
        if (v12 > v13)
        {
          memmove(*((void **)this + 26), (const void *)(*((_QWORD *)this + 26) + 4 * v14), 4 * (v8 - v14));
          v8 = *((_DWORD *)this + 11) - v14;
          *((_DWORD *)this + 11) = v8;
        }
        ShapingFilter::filter(*((ShapingFilter **)this + 20), v5, (float *)(*((_QWORD *)this + 26) + 4 * v8), v12);
        v5 += v12;
        LODWORD(v7) = v7 - v12;
      }
      v15 = 3;
      goto LABEL_26;
    }
    v15 = 3;
  }
  if ((int)v7 >= 1)
  {
    v16 = *((_DWORD *)this + 11);
    do
    {
      v17 = *((_DWORD *)this + 13);
      if (v16 == v17)
      {
        if (v16 >= v7)
          v18 = v7;
        else
          v18 = v16;
        memmove(*((void **)this + 26), (const void *)(*((_QWORD *)this + 26) + 4 * v18), 4 * (v16 - v18));
        v16 = *((_DWORD *)this + 11) - v18;
        *((_DWORD *)this + 11) = v16;
        v17 = *((_DWORD *)this + 13);
      }
      v19 = v17 - v16;
      if (v19 >= v7)
        v20 = v7;
      else
        v20 = v19;
      ShapingFilter::filter(*((ShapingFilter **)this + 20), v5, (float *)(*((_QWORD *)this + 26) + 4 * v16), v20);
      v16 = *((_DWORD *)this + 11) + v20;
      *((_DWORD *)this + 11) = v16;
      LODWORD(v7) = v7 - v20;
    }
    while ((int)v7 > 0);
  }
  do
  {
LABEL_26:
    if ((int)v7 < 1)
      break;
    v21 = *((unsigned int *)this + 11);
    v22 = *((_DWORD *)this + 13) - v21;
    if (v22 >= v7)
      v23 = v7;
    else
      v23 = v22;
    ShapingFilter::filter(*((ShapingFilter **)this + 20), v5, (float *)(*((_QWORD *)this + 26) + 4 * v21), v23);
    v24 = *((_DWORD *)this + 11) + v23;
    *((_DWORD *)this + 11) = v24;
    if (v24 < *((_DWORD *)this + 13))
    {
      LODWORD(v7) = v7 - v23;
      break;
    }
    if (!*((_DWORD *)this + 15))
    {
      v26 = 0;
      goto LABEL_58;
    }
    v25 = 0;
    v26 = 0;
    while (1)
    {
      v36 = 0;
      v27 = EchoDetector::decodeEcho(*((EchoDetector **)this + 21), (const float *)(*((_QWORD *)this + 26) + 4 * (*((_DWORD *)this + 14) * v25)), *((_DWORD *)this + 6), (_BOOL4 *)&v36, 0);
      v26 += *((_DWORD *)this + 14);
      if (v27)
        break;
      if (*((_BYTE *)this + 72))
      {
        BitCounter::count((uint64_t)this + 104);
        goto LABEL_39;
      }
LABEL_48:
      if (++v25 >= *((_DWORD *)this + 15))
        goto LABEL_58;
    }
    if (!*((_BYTE *)this + 72))
    {
      BitCounter::reset((EchoCodeDecoder *)((char *)this + 104), 0);
      *((_BYTE *)this + 72) = 1;
    }
    BitCounter::count((uint64_t)this + 104, v36);
LABEL_39:
    if (!*((_BYTE *)this + 72))
      goto LABEL_48;
    if (((*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 22) + 72))(*((_QWORD *)this + 22)) & 1) != 0
      || *((_DWORD *)this + 12))
    {
      v28 = 0;
    }
    else
    {
      if (*((_DWORD *)this + 30) > *((_DWORD *)this + 15))
      {
        BitCounter::reset((EchoCodeDecoder *)((char *)this + 104), 0);
        *((_BYTE *)this + 72) = 0;
        (*(void (**)(_QWORD))(**((_QWORD **)this + 22) + 24))(*((_QWORD *)this + 22));
        v30 = APCLogObject();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_229580000, v30, OS_LOG_TYPE_DEBUG, "A wrong frame start was found. Restarting...", buf, 2u);
        }
      }
      v28 = 1;
    }
    if (*((_DWORD *)this + 26) < *((_DWORD *)this + 27))
      goto LABEL_48;
    v29 = BitCounter::decodeBit((EchoCodeDecoder *)((char *)this + 104));
    if ((!v28 || (*((_DWORD *)this + 28) + *((_DWORD *)this + 29)) >= 0xA) && (v29 & 0x80000000) == 0)
    {
      *a4 = v29;
      BitCounter::reset((EchoCodeDecoder *)((char *)this + 104), 0);
      v15 = 0;
      ++*((_DWORD *)this + 12);
      goto LABEL_48;
    }
    *((_BYTE *)this + 72) = 0;
    *((_DWORD *)this + 12) = 0;
    (*(void (**)(_QWORD))(**((_QWORD **)this + 22) + 24))(*((_QWORD *)this + 22));
    v31 = APCLogObject();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_229580000, v31, OS_LOG_TYPE_ERROR, "Passcode bit error. Restarting...", v34, 2u);
    }
    v15 = 4294967286;
LABEL_58:
    memmove(*((void **)this + 26), (const void *)(*((_QWORD *)this + 26) + 4 * v26), 4 * (*((_DWORD *)this + 11) - v26));
    *((_DWORD *)this + 11) -= v26;
    v5 += v23;
    LODWORD(v7) = v7 - v23;
  }
  while ((_DWORD)v15 != -10);
  *a3 -= v7;
  return v15;
}

uint64_t `non-virtual thunk to'EchoCodeDecoder::decode(EchoCodeDecoder *this, const float *a2, unsigned int *a3, unsigned __int8 *a4)
{
  return EchoCodeDecoder::decode((EchoCodeDecoder *)((char *)this - 8), a2, a3, a4);
}

uint64_t EchoCodeDecoder::detectEchoSection(EchoCodeDecoder *this, const float *a2, uint64_t a3, int *a4)
{
  return (*(uint64_t (**)(_QWORD, const float *, uint64_t, int *, _QWORD))(**((_QWORD **)this + 22) + 40))(*((_QWORD *)this + 22), a2, a3, a4, 0);
}

void EchoCodeDecoder::Process(EchoCodeDecoder *this, const float *a2, int a3, uint64_t *a4, int *a5)
{
  int v6;
  unsigned int v8;
  int v9;
  int v10;
  uint64_t v11;
  char v12;
  unint64_t v13;
  _BYTE *v14;
  _BYTE *v15;
  BOOL v16;
  unint64_t v17;
  _BYTE *v18;
  unint64_t v19;
  unint64_t v20;
  size_t v21;
  size_t v22;
  char *v23;
  char *v24;
  _BYTE *v25;
  _BYTE *v26;
  char v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  int v37;
  uint64_t *v38;
  uint64_t v39;
  int v40;
  unint64_t v41;
  uint64_t v42;
  char v43;
  unint64_t v44;
  int *v45;
  unint64_t *v47;
  uint64_t v48;
  unsigned int v49;
  unsigned __int8 v50;
  uint8_t buf[4];
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  if (a3 < 1)
  {
    v48 = 0;
    v10 = 0;
    v38 = a4;
    goto LABEL_42;
  }
  v6 = a3;
  v45 = a5;
  v47 = (unint64_t *)((char *)this + 280);
  v48 = 0;
  while (2)
  {
    v50 = 0;
    v8 = *((_DWORD *)this + 6);
    if (v8 >= v6)
      v8 = v6;
    v49 = v8;
    v9 = EchoCodeDecoder::decode(this, a2, &v49, &v50);
    v10 = v9;
    v11 = v49;
    switch(v9)
    {
      case 0:
        v12 = v50 & 1;
        v14 = (_BYTE *)*((_QWORD *)this + 36);
        v13 = *((_QWORD *)this + 37);
        if ((unint64_t)v14 >= v13)
        {
          v17 = *v47;
          v18 = &v14[-*v47];
          v19 = (unint64_t)(v18 + 1);
          if ((uint64_t)(v18 + 1) < 0)
            std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
          v20 = v13 - v17;
          if (2 * v20 > v19)
            v19 = 2 * v20;
          if (v20 >= 0x3FFFFFFFFFFFFFFFLL)
            v21 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v21 = v19;
          if (v21)
          {
            v22 = v21;
            v23 = (char *)operator new(v21);
            v21 = v22;
          }
          else
          {
            v23 = 0;
          }
          v24 = &v18[(_QWORD)v23];
          v25 = &v18[(_QWORD)v23];
          *v25 = v12;
          v15 = v25 + 1;
          if (v14 != (_BYTE *)v17)
          {
            v26 = &v14[~v17];
            do
            {
              v27 = *--v14;
              (v26--)[(_QWORD)v23] = v27;
            }
            while (v14 != (_BYTE *)v17);
            v14 = (_BYTE *)*v47;
            v24 = v23;
          }
          *((_QWORD *)this + 35) = v24;
          *((_QWORD *)this + 36) = v15;
          *((_QWORD *)this + 37) = &v23[v21];
          if (v14)
            operator delete(v14);
        }
        else
        {
          *v14 = v12;
          v15 = v14 + 1;
        }
        *((_QWORD *)this + 36) = v15;
        if ((int)v15 - *((_DWORD *)this + 70) >= (8 * *((_DWORD *)this + 5)))
        {
          v48 = mach_absolute_time();
          v28 = APCLogObject();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            v52 = v48;
            _os_log_impl(&dword_229580000, v28, OS_LOG_TYPE_INFO, "Decoding completion time: %llu", buf, 0xCu);
          }
        }
        v29 = *((_QWORD *)this + 35);
        v30 = *((_QWORD *)this + 36);
        if (v29 != v30 && (((_BYTE)v30 - (_BYTE)v29) & 7) == 0)
        {
          v31 = APCLogObject();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            v32 = 0;
            v33 = *((_QWORD *)this + 36);
            v34 = -8;
            do
            {
              v35 = *(_BYTE *)(v33 + v34) & 1 | (2 * (v32 & 0x7F));
              v32 = *(_BYTE *)(v33 + v34) & 1 | (2 * (v32 & 0x7F));
            }
            while (!__CFADD__(v34++, 1));
            *(_DWORD *)buf = 67109120;
            LODWORD(v52) = v35;
            _os_log_impl(&dword_229580000, v31, OS_LOG_TYPE_INFO, "One byte has been decoded: 0x%02X", buf, 8u);
          }
        }
        goto LABEL_10;
      case 1:
        goto LABEL_40;
      case 2:
        goto LABEL_9;
      case 3:
        goto LABEL_10;
      case 4:
        goto LABEL_38;
      default:
        if (v9 == -10)
        {
LABEL_9:
          *((_QWORD *)this + 36) = *((_QWORD *)this + 35);
LABEL_10:
          a2 += v11;
          v16 = __OFSUB__(v6, v49);
          v6 -= v49;
          if ((v6 < 0) ^ v16 | (v6 == 0))
          {
LABEL_38:
            v37 = 0;
            goto LABEL_41;
          }
          continue;
        }
LABEL_40:
        v37 = -1;
LABEL_41:
        a5 = v45;
        v38 = a4;
        if (v37)
        {
LABEL_44:
          *a5 = 0;
          if (!v37)
            goto LABEL_54;
          goto LABEL_55;
        }
LABEL_42:
        v39 = *((_QWORD *)this + 35);
        v40 = *((_DWORD *)this + 5);
        if (*((_DWORD *)this + 72) - (int)v39 < (8 * v40))
        {
          v37 = 0;
          goto LABEL_44;
        }
        if (v40)
        {
          v41 = 0;
          do
          {
            v42 = 0;
            v43 = 0;
            do
              v43 = *(_BYTE *)(*((_QWORD *)this + 35) + 8 * (v41 & 0x1FFFFFFF) + v42++) & 1 | (2 * v43);
            while (v42 != 8);
            *(_BYTE *)v38 = v43;
            v38 = (uint64_t *)((char *)v38 + 1);
            ++v41;
            v44 = *((unsigned int *)this + 5);
          }
          while (v41 < v44);
          v39 = *((_QWORD *)this + 35);
        }
        else
        {
          LODWORD(v44) = 0;
        }
        *((_QWORD *)this + 36) = v39;
        *a5 = v44;
        *v38 = v48;
LABEL_54:
        if (v10 == 4)
LABEL_55:
          EchoCodeDecoder::reset((ShapingFilter **)this);
        return;
    }
  }
}

uint64_t EchoCodeDecoder::convertBitsToByte(EchoCodeDecoder *this, const unsigned __int8 *a2)
{
  uint64_t v2;
  int v3;
  int v4;

  v2 = 0;
  v3 = 0;
  do
  {
    v4 = *((_BYTE *)this + v2++) & 1 | (2 * v3);
    v3 = v4;
  }
  while (v2 != 8);
  return v4;
}

BOOL EchoCodeDecoder::isInitialized(EchoCodeDecoder *this)
{
  return *((_DWORD *)this + 4) != 0;
}

BOOL `non-virtual thunk to'EchoCodeDecoder::isInitialized(EchoCodeDecoder *this)
{
  return *((_DWORD *)this + 2) != 0;
}

uint64_t EchoCodeDecoder::setParams(uint64_t a1, unsigned int a2, void (**a3)(uint64_t))
{
  uint64_t result;
  _DWORD *v7;
  _DWORD *v8;
  _DWORD *v9;
  _DWORD *v10;
  _DWORD *v11;
  _DWORD *v12;
  uint64_t **v13;
  unsigned int v14;
  unsigned int *v15;

  if (*(_DWORD *)(a1 + 16))
    return 4294967287;
  result = 4294967290;
  switch(a2)
  {
    case 'd':
      v7 = std::any_cast[abi:ne180100]<unsigned int>((uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))a3);
      if (!v7)
        goto LABEL_18;
      *(_DWORD *)(a1 + 24) = *v7;
      goto LABEL_16;
    case 'e':
      v8 = std::any_cast[abi:ne180100]<unsigned int>((uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))a3);
      if (!v8)
        goto LABEL_18;
      *(_DWORD *)(a1 + 28) = *v8;
      goto LABEL_16;
    case 'i':
      v9 = std::any_cast[abi:ne180100]<float>((uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))a3);
      if (!v9)
        goto LABEL_18;
      *(_DWORD *)(a1 + 32) = *v9;
      goto LABEL_16;
    case 'j':
      v10 = std::any_cast[abi:ne180100]<float>((uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))a3);
      if (!v10)
        goto LABEL_18;
      *(_DWORD *)(a1 + 36) = *v10;
      goto LABEL_16;
    case 'o':
      v11 = std::any_cast[abi:ne180100]<float>((uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))a3);
      if (!v11)
        goto LABEL_18;
      *(_DWORD *)(a1 + 64) = *v11;
      goto LABEL_16;
    case 'q':
      v12 = std::any_cast[abi:ne180100]<unsigned int>((uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))a3);
      if (!v12)
LABEL_18:
        std::__throw_bad_any_cast[abi:ne180100]();
      *(_DWORD *)(a1 + 68) = *v12;
LABEL_16:
      v14 = a2;
      v15 = &v14;
      v13 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)(a1 + 80), &v14, (uint64_t)&std::piecewise_construct, &v15);
      std::any::operator=[abi:ne180100]((unint64_t *)v13 + 5, a3);
      result = 0;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t *std::any::operator=[abi:ne180100](unint64_t *a1, void (**a2)(uint64_t))
{
  uint64_t (*v4[9])(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);

  v4[8] = *(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x24BDAC8D0];
  v4[0] = 0;
  v4[1] = 0;
  if (*a2)
    (*a2)(1);
  if (v4 != (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))a1 && *a1 != (unsigned __int128)0)
    ((void (*)(uint64_t, unint64_t *, uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD), _QWORD, _QWORD))*a1)(2, a1, v4, 0, 0);
  std::any::reset[abi:ne180100](v4);
  return a1;
}

void sub_229586AA4(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

uint64_t `non-virtual thunk to'EchoCodeDecoder::setParams(uint64_t a1, unsigned int a2, void (**a3)(uint64_t))
{
  return EchoCodeDecoder::setParams(a1 - 8, a2, a3);
}

void `non-virtual thunk to'EchoCodeDecoder::~EchoCodeDecoder(EchoCodeDecoder *this)
{
  EchoCodeDecoder::~EchoCodeDecoder((EchoCodeDecoder *)((char *)this - 8));
}

{
  EchoCodeDecoder::~EchoCodeDecoder((EchoCodeDecoder *)((char *)this - 8));
  JUMPOUT(0x22E2CB548);
}

void std::vector<float>::__append(char **a1, unint64_t a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  int v18;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 2)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 4 * a2);
      v7 += 4 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = *a1;
    v9 = v7 - *a1;
    v10 = a2 + (v9 >> 2);
    if (v10 >> 62)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v11 = v9 >> 2;
    v12 = v5 - v8;
    if (v12 >> 1 > v10)
      v10 = v12 >> 1;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL)
      v13 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v13 = v10;
    if (v13)
    {
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v4, v13);
      v8 = *a1;
      v7 = a1[1];
    }
    else
    {
      v14 = 0;
    }
    v15 = &v14[4 * v11];
    v16 = &v14[4 * v13];
    bzero(v15, 4 * a2);
    v17 = &v15[4 * a2];
    while (v7 != v8)
    {
      v18 = *((_DWORD *)v7 - 1);
      v7 -= 4;
      *((_DWORD *)v15 - 1) = v18;
      v15 -= 4;
    }
    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8)
      operator delete(v8);
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(4 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void std::vector<float>::__append(void **a1, unint64_t a2, _DWORD *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  _DWORD *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  _DWORD *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *i;
  int v25;

  v8 = a1[2];
  v6 = (uint64_t)(a1 + 2);
  v7 = v8;
  v9 = *(_DWORD **)(v6 - 8);
  if (a2 <= (v8 - (_BYTE *)v9) >> 2)
  {
    if (a2)
    {
      v16 = 4 * a2;
      v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 4;
      }
      while (v16);
      v9 = v17;
    }
    a1[1] = v9;
  }
  else
  {
    v10 = (char *)v9 - (_BYTE *)*a1;
    v11 = a2 + (v10 >> 2);
    if (v11 >> 62)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v12 = v10 >> 2;
    v13 = v7 - (_BYTE *)*a1;
    if (v13 >> 1 > v11)
      v11 = v13 >> 1;
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFFCLL)
      v14 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v14 = v11;
    if (v14)
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v6, v14);
    else
      v15 = 0;
    v18 = &v15[4 * v12];
    v19 = &v18[4 * a2];
    v20 = 4 * a2;
    v21 = v18;
    do
    {
      *(_DWORD *)v21 = *a3;
      v21 += 4;
      v20 -= 4;
    }
    while (v20);
    v22 = &v15[4 * v14];
    v23 = (char *)*a1;
    for (i = (char *)a1[1]; i != v23; i -= 4)
    {
      v25 = *((_DWORD *)i - 1);
      *((_DWORD *)v18 - 1) = v25;
      v18 -= 4;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23)
      operator delete(v23);
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(24 * a2);
}

void SyncEchoDetector::SyncEchoDetector(SyncEchoDetector *this)
{
  *((_BYTE *)this + 8) = 0;
  *(_QWORD *)this = &unk_24F24B9B0;
  *((_OWORD *)this + 3) = 0u;
  *((_QWORD *)this + 24) = 0;
  *((_QWORD *)this + 25) = 0;
  *((_QWORD *)this + 26) = 0;
  *((_DWORD *)this + 54) = 0;
  *(_OWORD *)((char *)this + 12) = 0u;
  *(_OWORD *)((char *)this + 28) = 0u;
  *((_WORD *)this + 22) = 0;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *((_OWORD *)this + 9) = 0u;
  *((_OWORD *)this + 10) = 0u;
  *(_OWORD *)((char *)this + 172) = 0u;
  EchoDetector::EchoDetector((SyncEchoDetector *)((char *)this + 224));
  *((_DWORD *)this + 80) = 0;
  *((_BYTE *)this + 324) = 1;
  *(_OWORD *)((char *)this + 328) = 0u;
  *(_OWORD *)((char *)this + 344) = 0u;
}

void sub_229586E64(_Unwind_Exception *exception_object)
{
  _QWORD *v1;
  void **v2;
  void **v3;
  void **v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = v2;
  v6 = *v4;
  if (*v4)
  {
    v1[25] = v6;
    operator delete(v6);
  }
  v7 = (void *)v1[18];
  if (v7)
  {
    v1[19] = v7;
    operator delete(v7);
  }
  v8 = (void *)v1[15];
  if (v8)
  {
    v1[16] = v8;
    operator delete(v8);
  }
  v9 = (void *)v1[12];
  if (v9)
  {
    v1[13] = v9;
    operator delete(v9);
  }
  v10 = (void *)v1[9];
  if (v10)
  {
    v1[10] = v10;
    operator delete(v10);
  }
  v11 = *v3;
  if (*v3)
  {
    v1[7] = v11;
    operator delete(v11);
  }
  _Unwind_Resume(exception_object);
}

uint64_t (**std::any_cast[abi:ne180100]<float>(uint64_t (**result)(uint64_t, _QWORD, _QWORD, _QWORD, void *)))(uint64_t, _QWORD, _QWORD, _QWORD, void *)
{
  if (result)
  {
    if (*result)
      return (uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(*result)(3, result, 0, MEMORY[0x24BEDB788], &std::__any_imp::__unique_typeinfo<float>::__id);
    else
      return 0;
  }
  return result;
}

{
  if (result)
  {
    if (*result)
      return (uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(*result)(3, result, 0, MEMORY[0x24BEDB788], &std::__any_imp::__unique_typeinfo<float>::__id);
    else
      return 0;
  }
  return result;
}

void APCNullEncoder::APCNullEncoder(APCNullEncoder *this, NullCodecConfiguration *a2)
{
  *(_QWORD *)this = &off_24F24B410;
}

void *APCNullEncoder::Process(APCNullEncoder *this, const float *a2, float *__dst, int a4)
{
  void *result;

  if (a4)
    return memmove(__dst, a2, 4 * a4);
  return result;
}

uint64_t APCNullEncoder::Status(APCNullEncoder *this)
{
  return 0;
}

void APCNullDecoder::APCNullDecoder(APCNullDecoder *this, NullCodecConfiguration *a2)
{
  NullCodecConfiguration *v3;
  uint64_t v4;
  float v5;
  int v6;
  char v7;

  v3 = a2;
  *(_QWORD *)this = &off_24F24B448;
  v4 = -[AUPasscodeCodecConfiguration sampleRate](v3, "sampleRate");
  -[NullCodecConfiguration retrievalCallbackInterval](v3, "retrievalCallbackInterval");
  *((_DWORD *)this + 3) = (int)(float)(v5 * (float)v4);
  v6 = -[AUPasscodeCodecConfiguration payloadLengthBytes](v3, "payloadLengthBytes");
  *((_DWORD *)this + 4) = v6;
  v7 = -1;
  std::vector<unsigned char>::vector((_QWORD *)this + 3, v6, &v7);

}

void sub_229587028(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

const void **APCNullDecoder::Process(const void **this, const float *a2, int a3, char *__dst, int *a5)
{
  int v6;
  int v7;
  const void **v9;
  size_t v10;

  v6 = *((_DWORD *)this + 3);
  v7 = *((_DWORD *)this + 2) + a3;
  *((_DWORD *)this + 2) = v7;
  if (v7 >= v6)
  {
    v9 = this;
    if (__dst)
    {
      if (a5)
      {
        v10 = *((int *)this + 4);
        if (*a5 >= (int)v10)
        {
          this = (const void **)memcpy(__dst, this[3], v10);
          *a5 = *((_DWORD *)v9 + 4);
          *(_QWORD *)&__dst[*((int *)v9 + 4)] = 0;
        }
      }
    }
    *((_DWORD *)v9 + 2) = 0;
  }
  else if (a5)
  {
    *a5 = 0;
  }
  return this;
}

void APCNullDecoder::~APCNullDecoder(APCNullDecoder *this)
{
  void *v2;

  v2 = (void *)*((_QWORD *)this + 3);
  if (v2)
  {
    *((_QWORD *)this + 4) = v2;
    operator delete(v2);
  }
}

{
  void *v2;

  v2 = (void *)*((_QWORD *)this + 3);
  if (v2)
  {
    *((_QWORD *)this + 4) = v2;
    operator delete(v2);
  }
  JUMPOUT(0x22E2CB548);
}

void APCNullEncoder::~APCNullEncoder(APCNullEncoder *this)
{
  JUMPOUT(0x22E2CB548);
}

_QWORD *std::vector<unsigned char>::vector(_QWORD *a1, size_t a2, _BYTE *a3)
{
  size_t v5;
  _BYTE *v6;
  _BYTE *v7;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    v5 = a2;
    std::vector<unsigned char>::__vallocate[abi:ne180100](a1, a2);
    v6 = (_BYTE *)a1[1];
    v7 = &v6[v5];
    do
    {
      *v6++ = *a3;
      --v5;
    }
    while (v5);
    a1[1] = v7;
  }
  return a1;
}

void sub_2295871AC(_Unwind_Exception *exception_object)
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

char *std::vector<unsigned char>::__vallocate[abi:ne180100](_QWORD *a1, size_t __sz)
{
  char *result;

  if ((__sz & 0x8000000000000000) != 0)
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void sub_229587960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32)
{
  void *v32;
  uint64_t v33;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);

  _Block_object_dispose((const void *)(v33 - 144), 8);
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

void sub_229587AE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_22958809C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_2295881F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  v11 = v10;

  _Unwind_Resume(a1);
}

void sub_229588604(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2295887B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22958884C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2295889E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_229588F8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2295890FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2295891B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_229589268(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2295892F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2295893B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2295894C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2295895D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_229589644(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_229589704(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

id APCLogObject(void)
{
  unsigned __int8 v0;
  unint64_t v1;
  int v3;

  v1 = 0x255A53000uLL;
  if ((v0 & 1) == 0)
  {
    v1 = 0x255A53000;
    if (v3)
    {
      APCLogObject(void)::sLogObject = (uint64_t)os_log_create("com.apple.audiopasscode", "");
      v1 = 0x255A53000;
    }
  }
  return *(id *)(v1 + 3424);
}

void sub_229589A54(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_229589B20(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_229589C14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void EchoCodeEncoder::EchoCodeEncoder(EchoCodeEncoder *this)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)this = &off_24F24B570;
  *((_QWORD *)this + 1) = &unk_24F24B5E0;
  *(_QWORD *)((char *)this + 52) = 0;
  *(_QWORD *)((char *)this + 60) = 0x6400000000;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_WORD *)this + 24) = 0;
  *(_OWORD *)((char *)this + 72) = 0u;
  v1 = (uint64_t *)((char *)this + 80);
  *(_OWORD *)((char *)this + 88) = 0u;
  v2 = (uint64_t *)((char *)this + 88);
  *((_QWORD *)this + 20) = 0;
  *((_QWORD *)this + 19) = (char *)this + 160;
  *((_QWORD *)this + 21) = 0;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  v3 = operator new();
  *(_QWORD *)v3 = 0x100000000;
  *(_OWORD *)(v3 + 8) = 0u;
  *(_OWORD *)(v3 + 24) = 0u;
  v4 = *v1;
  *v1 = v3;
  if (v4)
    std::default_delete<ShapingFilter>::operator()[abi:ne180100]((uint64_t)v1, v4);
  v5 = operator new();
  *(_QWORD *)v5 = 0x100000000;
  *(_OWORD *)(v5 + 8) = 0u;
  *(_OWORD *)(v5 + 24) = 0u;
  v6 = *v2;
  *v2 = v5;
  if (v6)
    std::default_delete<ShapingFilter>::operator()[abi:ne180100]((uint64_t)v2, v6);
}

void sub_229589D40(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v5;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::destroy(v4, *(_QWORD **)(v1 + 160));
  v7 = *(void **)(v1 + 128);
  if (v7)
  {
    *(_QWORD *)(v1 + 136) = v7;
    operator delete(v7);
  }
  v8 = *(void **)(v1 + 104);
  if (v8)
  {
    *(_QWORD *)(v1 + 112) = v8;
    operator delete(v8);
  }
  v9 = *(_QWORD *)(v1 + 96);
  *(_QWORD *)(v1 + 96) = 0;
  if (v9)
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
  v10 = *v2;
  *v2 = 0;
  if (v10)
    std::default_delete<ShapingFilter>::operator()[abi:ne180100]((uint64_t)v2, v10);
  v11 = *v3;
  *v3 = 0;
  if (v11)
    std::default_delete<ShapingFilter>::operator()[abi:ne180100]((uint64_t)v3, v11);
  v12 = *v5;
  *v5 = 0;
  if (v12)
    (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
  _Unwind_Resume(a1);
}

uint64_t EchoCodeEncoder::initialize(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  unsigned int v4;
  NSObject *v5;
  double v6;
  _BOOL4 SyncType;
  EchoEmbedder *v8;
  uint64_t v9;
  uint64_t v10;
  EchoEmbedder *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  _BOOL8 v15;
  uint64_t v16;
  int v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  result = EchoCodeEncoder::loadAPCConfig(a1, a2);
  if ((_DWORD)result)
    return result;
  v4 = *(_DWORD *)(a1 + 20);
  if (!v4)
  {
    v4 = 2048;
    *(_DWORD *)(a1 + 20) = 2048;
  }
  if (!*(_DWORD *)(a1 + 28))
    *(_DWORD *)(a1 + 28) = 2;
  if (*(float *)(a1 + 36) == 0.0)
    *(_DWORD *)(a1 + 36) = 1056964608;
  if (*(float *)(a1 + 52) == 0.0)
    *(_DWORD *)(a1 + 52) = 1008981770;
  if (*(float *)(a1 + 60) == 0.0)
    *(_DWORD *)(a1 + 60) = 1183621120;
  if (!*(_BYTE *)(a1 + 49))
    *(_WORD *)(a1 + 48) = 257;
  if (!*(_DWORD *)(a1 + 64))
    *(_DWORD *)(a1 + 64) = 100;
  APCLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (float)((float)*(unsigned int *)(a1 + 64) / 100.0);
    v17 = 134217984;
    v18 = v6;
    _os_log_impl(&dword_229580000, v5, OS_LOG_TYPE_INFO, "APC encoder algorithm version: %3.2f", (uint8_t *)&v17, 0xCu);
  }

  SyncType = echoCodec::getSyncType((echoCodec *)*(unsigned int *)(a1 + 64));
  if (SyncType)
  {
    v11 = (EchoEmbedder *)operator new();
    *((_OWORD *)v11 + 9) = 0u;
    *((_OWORD *)v11 + 10) = 0u;
    *((_OWORD *)v11 + 7) = 0u;
    *((_OWORD *)v11 + 8) = 0u;
    *((_OWORD *)v11 + 5) = 0u;
    *((_OWORD *)v11 + 6) = 0u;
    *((_OWORD *)v11 + 3) = 0u;
    *((_OWORD *)v11 + 4) = 0u;
    *((_OWORD *)v11 + 1) = 0u;
    *((_OWORD *)v11 + 2) = 0u;
    *(_OWORD *)v11 = 0u;
    EchoEmbedder::EchoEmbedder(v11);
    *(_QWORD *)v11 = &unk_24F24B880;
    v12 = *(_QWORD *)(a1 + 72);
    *(_QWORD *)(a1 + 72) = v11;
    if (v12)
      (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
    v10 = operator new();
    *(_OWORD *)v10 = 0u;
    *(_OWORD *)(v10 + 16) = 0u;
    *(_QWORD *)v10 = &unk_24F24B7D0;
    *(_QWORD *)(v10 + 12) = 0;
    *(_BYTE *)(v10 + 20) = 0;
    *(_DWORD *)(v10 + 24) = 2;
  }
  else
  {
    if (SyncType)
    {
      v16 = *(_QWORD *)(a1 + 72);
      *(_QWORD *)(a1 + 72) = 0;
      if (v16)
        (*(void (**)(uint64_t))(*(_QWORD *)v16 + 8))(v16);
      v13 = *(_QWORD *)(a1 + 96);
      *(_QWORD *)(a1 + 96) = 0;
      if (!v13)
        goto LABEL_28;
      goto LABEL_27;
    }
    v8 = (EchoEmbedder *)operator new();
    *((_OWORD *)v8 + 9) = 0u;
    *((_OWORD *)v8 + 10) = 0u;
    *((_OWORD *)v8 + 7) = 0u;
    *((_OWORD *)v8 + 8) = 0u;
    *((_OWORD *)v8 + 5) = 0u;
    *((_OWORD *)v8 + 6) = 0u;
    *((_OWORD *)v8 + 3) = 0u;
    *((_OWORD *)v8 + 4) = 0u;
    *((_OWORD *)v8 + 1) = 0u;
    *((_OWORD *)v8 + 2) = 0u;
    *(_OWORD *)v8 = 0u;
    EchoEmbedder::EchoEmbedder(v8);
    v9 = *(_QWORD *)(a1 + 72);
    *(_QWORD *)(a1 + 72) = v8;
    if (v9)
      (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
    v10 = operator new();
    *(_OWORD *)v10 = 0u;
    *(_OWORD *)(v10 + 16) = 0u;
    *(_OWORD *)(v10 + 64) = 0u;
    *(_OWORD *)(v10 + 80) = 0u;
    *(_OWORD *)(v10 + 32) = 0u;
    *(_OWORD *)(v10 + 48) = 0u;
    *(_QWORD *)v10 = &unk_24F24B8C8;
    *(_QWORD *)(v10 + 12) = 0;
    *(_QWORD *)(v10 + 20) = 0;
    *(_QWORD *)(v10 + 28) = 0;
    *(_QWORD *)(v10 + 33) = 0;
    *(_DWORD *)(v10 + 44) = 3;
    *(_QWORD *)(v10 + 64) = 0;
    *(_QWORD *)(v10 + 72) = 0;
    *(_QWORD *)(v10 + 80) = 0;
    *(_DWORD *)(v10 + 88) = 0;
    *(_BYTE *)(v10 + 92) = 1;
    *(_QWORD *)(v10 + 144) = 0;
    *(_OWORD *)(v10 + 112) = 0u;
    *(_OWORD *)(v10 + 128) = 0u;
    *(_OWORD *)(v10 + 96) = 0u;
  }
  v13 = *(_QWORD *)(a1 + 96);
  *(_QWORD *)(a1 + 96) = v10;
  if (v13)
LABEL_27:
    (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
LABEL_28:
  *(_DWORD *)(a1 + 20) = echoCodec::getSRCFreeFrameSize((echoCodec *)*(unsigned int *)(a1 + 20), *(_DWORD *)(a1 + 16));
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a1 + 28) * *(_DWORD *)(a1 + 20)
                       - echoCodec::getSRCFreeFrameSize((echoCodec *)(v4 >> 2), *(_DWORD *)(a1 + 16));
  ShapingFilter::initialize(*(_QWORD *)(a1 + 80), 0, *(_DWORD *)(a1 + 16), 1u, 1, *(float *)(a1 + 60));
  ShapingFilter::initialize(*(_QWORD *)(a1 + 88), 1, *(_DWORD *)(a1 + 16), 1u, 1, *(float *)(a1 + 60));
  (*(void (**)(_QWORD, _QWORD, _QWORD, uint64_t))(**(_QWORD **)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), *(unsigned int *)(a1 + 16), *(unsigned int *)(a1 + 32), a1 + 152);
  v14 = *(_DWORD *)(a1 + 56);
  if (!v14)
    v14 = (float)(*(float *)(a1 + 36) * (float)*(unsigned int *)(a1 + 16));
  *(_DWORD *)(a1 + 24) = v14;
  (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 96) + 32))(*(_QWORD *)(a1 + 96), a1 + 152);
  if (*(_BYTE *)(a1 + 49))
    v15 = *(_BYTE *)(a1 + 48) != 0;
  else
    v15 = 0;
  if (!(*(unsigned int (**)(_QWORD, _QWORD, _QWORD, _QWORD, _BOOL8))(**(_QWORD **)(a1 + 96) + 16))(*(_QWORD *)(a1 + 96), *(unsigned int *)(a1 + 16), *(unsigned int *)(a1 + 20), *(unsigned int *)(a1 + 24), v15))return 4294967290;
  std::vector<float>::resize(a1 + 104, *(unsigned int *)(a1 + 20));
  std::vector<float>::resize(a1 + 128, *(unsigned int *)(a1 + 20));
  return 0;
}

void sub_22958A220(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x22E2CB548](v1, 0x10B1C40F6DE9BE1);
  _Unwind_Resume(a1);
}

uint64_t EchoCodeEncoder::loadAPCConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  __int128 v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  __int128 v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char *v28;
  char *v29;
  char *v30;
  char *v31;
  char *v32;
  __int128 v33;
  uint64_t v34;
  char *v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  char *v39;
  char *v40;
  char *v41;
  char *v42;
  char *v43;
  __int128 v44;
  uint64_t v45;
  char *v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  char *v50;
  char *v51;
  char *v52;
  char *v53;
  char *v54;
  __int128 v55;
  uint64_t v56;
  char *v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  char *v61;
  char *v62;
  char *v63;
  char *v64;
  char *v65;
  __int128 v66;
  uint64_t v67;
  char *v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  char *v72;
  char *v73;
  char *v74;
  char *v75;
  char *v76;
  __int128 v77;
  uint64_t v78;
  void *__p;
  char *v81;
  char *v82;
  uint64_t v83;

  v82 = 0;
  v83 = a2;
  __p = 0;
  v81 = 0;
  v4 = std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>((uint64_t)&v82, 1uLL);
  v5 = 0;
  v6 = (char *)&v4[3 * v3];
  *(_DWORD *)v4 = 0;
  v4[1] = a1 + 16;
  *((_DWORD *)v4 + 4) = 1;
  v7 = (char *)(v4 + 3);
  v8 = v81;
  v9 = (char *)v4;
  if (v81)
  {
    do
    {
      v10 = *(_OWORD *)(v8 - 24);
      *((_DWORD *)v9 - 2) = *((_DWORD *)v8 - 2);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      v8 -= 24;
    }
    while (v8);
    v5 = __p;
  }
  __p = v9;
  v81 = (char *)(v4 + 3);
  v82 = (char *)&v4[3 * v3];
  if (v5)
  {
    operator delete(v5);
    v6 = v82;
  }
  v81 = (char *)(v4 + 3);
  v11 = a1 + 40;
  if (v7 >= v6)
  {
    v13 = 0xAAAAAAAAAAAAAAABLL * ((v7 - (_BYTE *)__p) >> 3);
    if (v13 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v14 = 0xAAAAAAAAAAAAAAABLL * ((v6 - (_BYTE *)__p) >> 3);
    v15 = 2 * v14;
    if (2 * v14 <= v13 + 1)
      v15 = v13 + 1;
    if (v14 >= 0x555555555555555)
      v16 = 0xAAAAAAAAAAAAAAALL;
    else
      v16 = v15;
    if (v16)
      v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>((uint64_t)&v82, v16);
    else
      v17 = 0;
    v18 = &v17[8 * ((v7 - (_BYTE *)__p) >> 3)];
    v19 = &v17[24 * v16];
    *(_DWORD *)v18 = 3;
    *((_QWORD *)v18 + 1) = v11;
    *((_DWORD *)v18 + 4) = 1;
    v12 = v18 + 24;
    v21 = (char *)__p;
    v20 = v81;
    if (v81 != __p)
    {
      do
      {
        v22 = *(_OWORD *)(v20 - 24);
        *((_DWORD *)v18 - 2) = *((_DWORD *)v20 - 2);
        *(_OWORD *)(v18 - 24) = v22;
        v18 -= 24;
        v20 -= 24;
      }
      while (v20 != v21);
      v20 = (char *)__p;
    }
    __p = v18;
    v81 = v12;
    v82 = v19;
    if (v20)
      operator delete(v20);
  }
  else
  {
    *((_DWORD *)v4 + 6) = 3;
    v4[4] = v11;
    *((_DWORD *)v4 + 10) = 1;
    v12 = (char *)(v4 + 6);
  }
  v81 = v12;
  v23 = a1 + 56;
  if (v12 >= v82)
  {
    v25 = 0xAAAAAAAAAAAAAAABLL * ((v12 - (_BYTE *)__p) >> 3);
    if (v25 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v26 = 0x5555555555555556 * ((v82 - (_BYTE *)__p) >> 3);
    if (v26 <= v25 + 1)
      v26 = v25 + 1;
    if (0xAAAAAAAAAAAAAAABLL * ((v82 - (_BYTE *)__p) >> 3) >= 0x555555555555555)
      v27 = 0xAAAAAAAAAAAAAAALL;
    else
      v27 = v26;
    if (v27)
      v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>((uint64_t)&v82, v27);
    else
      v28 = 0;
    v29 = &v28[24 * v25];
    v30 = &v28[24 * v27];
    *(_DWORD *)v29 = 108;
    *((_QWORD *)v29 + 1) = v23;
    *((_DWORD *)v29 + 4) = 1;
    v24 = v29 + 24;
    v32 = (char *)__p;
    v31 = v81;
    if (v81 != __p)
    {
      do
      {
        v33 = *(_OWORD *)(v31 - 24);
        *((_DWORD *)v29 - 2) = *((_DWORD *)v31 - 2);
        *(_OWORD *)(v29 - 24) = v33;
        v29 -= 24;
        v31 -= 24;
      }
      while (v31 != v32);
      v31 = (char *)__p;
    }
    __p = v29;
    v81 = v24;
    v82 = v30;
    if (v31)
      operator delete(v31);
  }
  else
  {
    *(_DWORD *)v12 = 108;
    *((_QWORD *)v12 + 1) = v23;
    *((_DWORD *)v12 + 4) = 1;
    v24 = v12 + 24;
  }
  v81 = v24;
  v34 = a1 + 52;
  if (v24 >= v82)
  {
    v36 = 0xAAAAAAAAAAAAAAABLL * ((v24 - (_BYTE *)__p) >> 3);
    if (v36 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v37 = 0x5555555555555556 * ((v82 - (_BYTE *)__p) >> 3);
    if (v37 <= v36 + 1)
      v37 = v36 + 1;
    if (0xAAAAAAAAAAAAAAABLL * ((v82 - (_BYTE *)__p) >> 3) >= 0x555555555555555)
      v38 = 0xAAAAAAAAAAAAAAALL;
    else
      v38 = v37;
    if (v38)
      v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>((uint64_t)&v82, v38);
    else
      v39 = 0;
    v40 = &v39[24 * v36];
    v41 = &v39[24 * v38];
    *(_DWORD *)v40 = 103;
    *((_QWORD *)v40 + 1) = v34;
    *((_DWORD *)v40 + 4) = 0;
    v35 = v40 + 24;
    v43 = (char *)__p;
    v42 = v81;
    if (v81 != __p)
    {
      do
      {
        v44 = *(_OWORD *)(v42 - 24);
        *((_DWORD *)v40 - 2) = *((_DWORD *)v42 - 2);
        *(_OWORD *)(v40 - 24) = v44;
        v40 -= 24;
        v42 -= 24;
      }
      while (v42 != v43);
      v42 = (char *)__p;
    }
    __p = v40;
    v81 = v35;
    v82 = v41;
    if (v42)
      operator delete(v42);
  }
  else
  {
    *(_DWORD *)v24 = 103;
    *((_QWORD *)v24 + 1) = v34;
    *((_DWORD *)v24 + 4) = 0;
    v35 = v24 + 24;
  }
  v81 = v35;
  v45 = a1 + 60;
  if (v35 >= v82)
  {
    v47 = 0xAAAAAAAAAAAAAAABLL * ((v35 - (_BYTE *)__p) >> 3);
    if (v47 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v48 = 0x5555555555555556 * ((v82 - (_BYTE *)__p) >> 3);
    if (v48 <= v47 + 1)
      v48 = v47 + 1;
    if (0xAAAAAAAAAAAAAAABLL * ((v82 - (_BYTE *)__p) >> 3) >= 0x555555555555555)
      v49 = 0xAAAAAAAAAAAAAAALL;
    else
      v49 = v48;
    if (v49)
      v50 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>((uint64_t)&v82, v49);
    else
      v50 = 0;
    v51 = &v50[24 * v47];
    v52 = &v50[24 * v49];
    *(_DWORD *)v51 = 111;
    *((_QWORD *)v51 + 1) = v45;
    *((_DWORD *)v51 + 4) = 0;
    v46 = v51 + 24;
    v54 = (char *)__p;
    v53 = v81;
    if (v81 != __p)
    {
      do
      {
        v55 = *(_OWORD *)(v53 - 24);
        *((_DWORD *)v51 - 2) = *((_DWORD *)v53 - 2);
        *(_OWORD *)(v51 - 24) = v55;
        v51 -= 24;
        v53 -= 24;
      }
      while (v53 != v54);
      v53 = (char *)__p;
    }
    __p = v51;
    v81 = v46;
    v82 = v52;
    if (v53)
      operator delete(v53);
  }
  else
  {
    *(_DWORD *)v35 = 111;
    *((_QWORD *)v35 + 1) = v45;
    *((_DWORD *)v35 + 4) = 0;
    v46 = v35 + 24;
  }
  v81 = v46;
  v56 = a1 + 48;
  if (v46 >= v82)
  {
    v58 = 0xAAAAAAAAAAAAAAABLL * ((v46 - (_BYTE *)__p) >> 3);
    if (v58 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v59 = 0x5555555555555556 * ((v82 - (_BYTE *)__p) >> 3);
    if (v59 <= v58 + 1)
      v59 = v58 + 1;
    if (0xAAAAAAAAAAAAAAABLL * ((v82 - (_BYTE *)__p) >> 3) >= 0x555555555555555)
      v60 = 0xAAAAAAAAAAAAAAALL;
    else
      v60 = v59;
    if (v60)
      v61 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>((uint64_t)&v82, v60);
    else
      v61 = 0;
    v62 = &v61[24 * v58];
    v63 = &v61[24 * v60];
    *(_DWORD *)v62 = 112;
    *((_QWORD *)v62 + 1) = v56;
    *((_DWORD *)v62 + 4) = 5;
    v57 = v62 + 24;
    v65 = (char *)__p;
    v64 = v81;
    if (v81 != __p)
    {
      do
      {
        v66 = *(_OWORD *)(v64 - 24);
        *((_DWORD *)v62 - 2) = *((_DWORD *)v64 - 2);
        *(_OWORD *)(v62 - 24) = v66;
        v62 -= 24;
        v64 -= 24;
      }
      while (v64 != v65);
      v64 = (char *)__p;
    }
    __p = v62;
    v81 = v57;
    v82 = v63;
    if (v64)
      operator delete(v64);
  }
  else
  {
    *(_DWORD *)v46 = 112;
    *((_QWORD *)v46 + 1) = v56;
    *((_DWORD *)v46 + 4) = 5;
    v57 = v46 + 24;
  }
  v81 = v57;
  v67 = a1 + 64;
  if (v57 >= v82)
  {
    v69 = 0xAAAAAAAAAAAAAAABLL * ((v57 - (_BYTE *)__p) >> 3);
    if (v69 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v70 = 0x5555555555555556 * ((v82 - (_BYTE *)__p) >> 3);
    if (v70 <= v69 + 1)
      v70 = v69 + 1;
    if (0xAAAAAAAAAAAAAAABLL * ((v82 - (_BYTE *)__p) >> 3) >= 0x555555555555555)
      v71 = 0xAAAAAAAAAAAAAAALL;
    else
      v71 = v70;
    if (v71)
      v72 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>((uint64_t)&v82, v71);
    else
      v72 = 0;
    v73 = &v72[24 * v69];
    v74 = &v72[24 * v71];
    *(_DWORD *)v73 = 113;
    *((_QWORD *)v73 + 1) = v67;
    *((_DWORD *)v73 + 4) = 1;
    v68 = v73 + 24;
    v76 = (char *)__p;
    v75 = v81;
    if (v81 != __p)
    {
      do
      {
        v77 = *(_OWORD *)(v75 - 24);
        *((_DWORD *)v73 - 2) = *((_DWORD *)v75 - 2);
        *(_OWORD *)(v73 - 24) = v77;
        v73 -= 24;
        v75 -= 24;
      }
      while (v75 != v76);
      v75 = (char *)__p;
    }
    __p = v73;
    v81 = v68;
    v82 = v74;
    if (v75)
      operator delete(v75);
  }
  else
  {
    *(_DWORD *)v57 = 113;
    *((_QWORD *)v57 + 1) = v67;
    *((_DWORD *)v57 + 4) = 1;
    v68 = v57 + 24;
  }
  v81 = v68;
  v78 = APCConfigReader::loadParams((uint64_t)&v83, &__p);
  if (__p)
  {
    v81 = (char *)__p;
    operator delete(__p);
  }
  return v78;
}

void sub_22958A928(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t `non-virtual thunk to'EchoCodeEncoder::initialize(uint64_t a1, uint64_t a2)
{
  return EchoCodeEncoder::initialize(a1 - 8, a2);
}

uint64_t EchoCodeEncoder::encode(EchoCodeEncoder *this, const float *a2, float *a3, vDSP_Length a4)
{
  uint64_t v7;
  int v8;
  _QWORD *v9;
  uint64_t v10;
  unsigned int v11;
  int v12;
  float *v13;
  unsigned int v14;
  vDSP_Length v15;
  BOOL v16;
  _BOOL8 v17;
  const float **v18;
  float *v19;
  _QWORD v21[3];
  _QWORD *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  ShapingFilter::filter(*((ShapingFilter **)this + 10), a2, a3, a4);
  vDSP_vclr(*((float **)this + 13), 1, (uint64_t)(*((_QWORD *)this + 14) - *((_QWORD *)this + 13)) >> 2);
  v7 = *((_QWORD *)this + 12);
  v21[0] = &off_24F24B680;
  v21[1] = this;
  v22 = v21;
  v8 = (*(uint64_t (**)(uint64_t, char *, vDSP_Length, _QWORD *))(*(_QWORD *)v7 + 40))(v7, (char *)this + 104, a4, v21);
  v9 = v22;
  if (v22 == v21)
  {
    v10 = 4;
    v9 = v21;
  }
  else
  {
    if (!v22)
      goto LABEL_6;
    v10 = 5;
  }
  (*(void (**)(void))(*v9 + 8 * v10))();
LABEL_6:
  v11 = v8 & ~(v8 >> 31);
  v12 = a4 - v11;
  if ((int)(a4 - v11) < 1)
  {
    v17 = 1;
LABEL_16:
    v19 = (float *)*((_QWORD *)this + 13);
    v18 = (const float **)((char *)this + 104);
    ShapingFilter::filter((ShapingFilter *)*(v18 - 2), v19, v19, a4);
    vDSP_vadd(*v18, 1, a3, 1, a3, 1, a4);
  }
  else
  {
    v13 = (float *)(*((_QWORD *)this + 13) + 4 * v11);
    while (1)
    {
      v14 = *((_DWORD *)this + 5);
      v15 = v12 >= v14 ? v14 : v12;
      if (!EchoEmbedder::encodeEcho(*((EchoEmbedder **)this + 9), v13, v15))
        return 4294967290;
      v13 += v15;
      v16 = __OFSUB__(v12, (_DWORD)v15);
      v12 -= v15;
      if ((v12 < 0) ^ v16 | (v12 == 0))
      {
        v17 = *(_DWORD *)(*((_QWORD *)this + 9) + 120) < *(_DWORD *)(*((_QWORD *)this + 9) + 168);
        goto LABEL_16;
      }
    }
  }
  return v17;
}

void sub_22958AAF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v13;
  char *v15;
  uint64_t v16;

  v15 = a13;
  if (a13 == v13)
  {
    v16 = 4;
    v15 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v16 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v15 + 8 * v16))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t `non-virtual thunk to'EchoCodeEncoder::encode(EchoCodeEncoder *this, const float *a2, float *a3, vDSP_Length a4)
{
  return EchoCodeEncoder::encode((EchoCodeEncoder *)((char *)this - 8), a2, a3, a4);
}

EchoCodeEncoder *EchoCodeEncoder::Process(EchoCodeEncoder *this, const float *a2, float *a3, int a4)
{
  int v4;
  EchoCodeEncoder *v7;
  unsigned int v8;
  vDSP_Length v9;

  if (a4 >= 1)
  {
    v4 = a4;
    v7 = this;
    do
    {
      v8 = *((_DWORD *)v7 + 5);
      if (v8 >= v4)
        v9 = v4;
      else
        v9 = v8;
      this = (EchoCodeEncoder *)EchoCodeEncoder::encode(v7, a2, a3, v9);
      a2 += v9;
      a3 += v9;
      v4 -= v9;
    }
    while (v4 >= 1 && this < 2);
  }
  return this;
}

float EchoCodeEncoder::evaluateCarrier(uint64_t a1, const float *a2, int a3, uint64_t **a4)
{
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  __int128 v13;
  char *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  char *v23;
  __int128 v24;
  char *v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char *v29;
  char *v30;
  char *v31;
  char *v32;
  char *v33;
  __int128 v34;
  char *v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  char *v39;
  char *v40;
  char *v41;
  char *v42;
  char *v43;
  __int128 v44;
  char *v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  char *v49;
  char *v50;
  char *v51;
  char *v52;
  char *v53;
  __int128 v54;
  char *v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  char *v59;
  char *v60;
  char *v61;
  char *v62;
  char *v63;
  __int128 v64;
  char *v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  char *v69;
  char *v70;
  char *v71;
  char *v72;
  char *v73;
  __int128 v74;
  char *v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  char *v79;
  char *v80;
  char *v81;
  char *v82;
  char *v83;
  __int128 v84;
  char *v85;
  unint64_t v86;
  unint64_t v87;
  unint64_t v88;
  char *v89;
  char *v90;
  char *v91;
  char *v92;
  char *v93;
  __int128 v94;
  float v95;
  uint64_t v96;
  unsigned int SRCFreeFrameSize;
  unsigned int v98;
  int v99;
  int v100;
  int v101;
  _BOOL4 SyncType;
  _BOOL4 v103;
  uint64_t v104;
  uint64_t v105;
  EchoEmbedder *v106;
  EchoEmbedder *v107;
  unsigned int v108;
  unsigned int v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  char v114;
  BOOL v115;
  uint64_t v116;
  int v117;
  int v118;
  const float *v119;
  vDSP_Length v120;
  unsigned int v121;
  ShapingFilter ***v122;
  ShapingFilter ***v123;
  uint64_t v124;
  char v125;
  char v126;
  ShapingFilter ***v127;
  ShapingFilter ***v128;
  uint64_t v129;
  BOOL v130;
  int v131;
  int v132;
  uint64_t **v133;
  void (**v134)(uint64_t, _QWORD, ShapingFilter ***, _QWORD, _QWORD);
  void (*v135)(uint64_t, _QWORD, ShapingFilter ***, _QWORD, _QWORD);
  int v136;
  uint64_t v137;
  int v138;
  uint64_t **v139;
  unsigned int v140;
  void (**v141)(uint64_t, _QWORD, ShapingFilter ***, _QWORD, _QWORD);
  void (*v142)(uint64_t, _QWORD, ShapingFilter ***, _QWORD, _QWORD);
  ShapingFilter *v143;
  ShapingFilter *v144;
  uint64_t **v145;
  void (**v146)(uint64_t, _QWORD, ShapingFilter ***, _QWORD, _QWORD);
  void (*v147)(uint64_t, _QWORD, ShapingFilter ***, _QWORD, _QWORD);
  EchoEmbedder *v148;
  int v150;
  int v151;
  unsigned int v152;
  int v153;
  const float *v154;
  uint64_t **v155;
  _BOOL4 v156;
  unsigned int v158;
  ShapingFilter *v159;
  ShapingFilter *v160;
  EchoEmbedder *v161;
  void *v162[3];
  float *__C[3];
  void *v164[3];
  float *__B;
  float *v166;
  void *__p;
  char *v168;
  char *v169;
  uint64_t **v170;
  __int16 v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  void (*v176)(int);
  uint64_t v177;
  ShapingFilter **v178;
  ShapingFilter **v179;
  ShapingFilter ***v180;
  uint64_t v181;

  v181 = *MEMORY[0x24BDAC8D0];
  v174 = 0;
  v175 = 0;
  v172 = 0;
  v173 = 0;
  v171 = 0;
  v169 = 0;
  v170 = a4;
  __p = 0;
  v168 = 0;
  v7 = std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>((uint64_t)&v169, 1uLL);
  v8 = 0;
  v9 = (char *)&v7[3 * v6];
  *(_DWORD *)v7 = 0;
  v7[1] = (char *)&v175 + 4;
  *((_DWORD *)v7 + 4) = 1;
  v10 = (char *)(v7 + 3);
  v11 = v168;
  v12 = (char *)v7;
  if (v168)
  {
    do
    {
      v13 = *(_OWORD *)(v11 - 24);
      *((_DWORD *)v12 - 2) = *((_DWORD *)v11 - 2);
      *(_OWORD *)(v12 - 24) = v13;
      v12 -= 24;
      v11 -= 24;
    }
    while (v11);
    v8 = __p;
  }
  __p = v12;
  v168 = (char *)(v7 + 3);
  v169 = (char *)&v7[3 * v6];
  if (v8)
  {
    operator delete(v8);
    v9 = v169;
  }
  v168 = (char *)(v7 + 3);
  if (v10 >= v9)
  {
    v15 = 0xAAAAAAAAAAAAAAABLL * ((v10 - (_BYTE *)__p) >> 3);
    if (v15 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v16 = 0xAAAAAAAAAAAAAAABLL * ((v9 - (_BYTE *)__p) >> 3);
    v17 = 2 * v16;
    if (2 * v16 <= v15 + 1)
      v17 = v15 + 1;
    if (v16 >= 0x555555555555555)
      v18 = 0xAAAAAAAAAAAAAAALL;
    else
      v18 = v17;
    if (v18)
      v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>((uint64_t)&v169, v18);
    else
      v19 = 0;
    v20 = &v19[24 * v15];
    v21 = &v19[24 * v18];
    *(_DWORD *)v20 = 3;
    *((_QWORD *)v20 + 1) = &v175;
    *((_DWORD *)v20 + 4) = 1;
    v14 = v20 + 24;
    v22 = v168;
    v23 = (char *)__p;
    if (v168 != __p)
    {
      do
      {
        v24 = *(_OWORD *)(v22 - 24);
        *((_DWORD *)v20 - 2) = *((_DWORD *)v22 - 2);
        *(_OWORD *)(v20 - 24) = v24;
        v20 -= 24;
        v22 -= 24;
      }
      while (v22 != v23);
      v22 = (char *)__p;
    }
    __p = v20;
    v168 = v14;
    v169 = v21;
    if (v22)
      operator delete(v22);
  }
  else
  {
    *((_DWORD *)v7 + 6) = 3;
    v7[4] = &v175;
    *((_DWORD *)v7 + 10) = 1;
    v14 = (char *)(v7 + 6);
  }
  v168 = v14;
  if (v14 >= v169)
  {
    v26 = 0xAAAAAAAAAAAAAAABLL * ((v14 - (_BYTE *)__p) >> 3);
    if (v26 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v27 = 0x5555555555555556 * ((v169 - (_BYTE *)__p) >> 3);
    if (v27 <= v26 + 1)
      v27 = v26 + 1;
    if (0xAAAAAAAAAAAAAAABLL * ((v169 - (_BYTE *)__p) >> 3) >= 0x555555555555555)
      v28 = 0xAAAAAAAAAAAAAAALL;
    else
      v28 = v27;
    if (v28)
      v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>((uint64_t)&v169, v28);
    else
      v29 = 0;
    v30 = &v29[24 * v26];
    v31 = &v29[24 * v28];
    *(_DWORD *)v30 = 100;
    *((_QWORD *)v30 + 1) = (char *)&v174 + 4;
    *((_DWORD *)v30 + 4) = 1;
    v25 = v30 + 24;
    v32 = v168;
    v33 = (char *)__p;
    if (v168 != __p)
    {
      do
      {
        v34 = *(_OWORD *)(v32 - 24);
        *((_DWORD *)v30 - 2) = *((_DWORD *)v32 - 2);
        *(_OWORD *)(v30 - 24) = v34;
        v30 -= 24;
        v32 -= 24;
      }
      while (v32 != v33);
      v32 = (char *)__p;
    }
    __p = v30;
    v168 = v25;
    v169 = v31;
    if (v32)
      operator delete(v32);
  }
  else
  {
    *(_DWORD *)v14 = 100;
    *((_QWORD *)v14 + 1) = (char *)&v174 + 4;
    *((_DWORD *)v14 + 4) = 1;
    v25 = v14 + 24;
  }
  v168 = v25;
  if (v25 >= v169)
  {
    v36 = 0xAAAAAAAAAAAAAAABLL * ((v25 - (_BYTE *)__p) >> 3);
    if (v36 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v37 = 0x5555555555555556 * ((v169 - (_BYTE *)__p) >> 3);
    if (v37 <= v36 + 1)
      v37 = v36 + 1;
    if (0xAAAAAAAAAAAAAAABLL * ((v169 - (_BYTE *)__p) >> 3) >= 0x555555555555555)
      v38 = 0xAAAAAAAAAAAAAAALL;
    else
      v38 = v37;
    if (v38)
      v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>((uint64_t)&v169, v38);
    else
      v39 = 0;
    v40 = &v39[24 * v36];
    v41 = &v39[24 * v38];
    *(_DWORD *)v40 = 101;
    *((_QWORD *)v40 + 1) = &v174;
    *((_DWORD *)v40 + 4) = 1;
    v35 = v40 + 24;
    v42 = v168;
    v43 = (char *)__p;
    if (v168 != __p)
    {
      do
      {
        v44 = *(_OWORD *)(v42 - 24);
        *((_DWORD *)v40 - 2) = *((_DWORD *)v42 - 2);
        *(_OWORD *)(v40 - 24) = v44;
        v40 -= 24;
        v42 -= 24;
      }
      while (v42 != v43);
      v42 = (char *)__p;
    }
    __p = v40;
    v168 = v35;
    v169 = v41;
    if (v42)
      operator delete(v42);
  }
  else
  {
    *(_DWORD *)v25 = 101;
    *((_QWORD *)v25 + 1) = &v174;
    *((_DWORD *)v25 + 4) = 1;
    v35 = v25 + 24;
  }
  v168 = v35;
  if (v35 >= v169)
  {
    v46 = 0xAAAAAAAAAAAAAAABLL * ((v35 - (_BYTE *)__p) >> 3);
    if (v46 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v47 = 0x5555555555555556 * ((v169 - (_BYTE *)__p) >> 3);
    if (v47 <= v46 + 1)
      v47 = v46 + 1;
    if (0xAAAAAAAAAAAAAAABLL * ((v169 - (_BYTE *)__p) >> 3) >= 0x555555555555555)
      v48 = 0xAAAAAAAAAAAAAAALL;
    else
      v48 = v47;
    if (v48)
      v49 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>((uint64_t)&v169, v48);
    else
      v49 = 0;
    v50 = &v49[24 * v46];
    v51 = &v49[24 * v48];
    *(_DWORD *)v50 = 102;
    *((_QWORD *)v50 + 1) = (char *)&v173 + 4;
    *((_DWORD *)v50 + 4) = 0;
    v45 = v50 + 24;
    v52 = v168;
    v53 = (char *)__p;
    if (v168 != __p)
    {
      do
      {
        v54 = *(_OWORD *)(v52 - 24);
        *((_DWORD *)v50 - 2) = *((_DWORD *)v52 - 2);
        *(_OWORD *)(v50 - 24) = v54;
        v50 -= 24;
        v52 -= 24;
      }
      while (v52 != v53);
      v52 = (char *)__p;
    }
    __p = v50;
    v168 = v45;
    v169 = v51;
    if (v52)
      operator delete(v52);
  }
  else
  {
    *(_DWORD *)v35 = 102;
    *((_QWORD *)v35 + 1) = (char *)&v173 + 4;
    *((_DWORD *)v35 + 4) = 0;
    v45 = v35 + 24;
  }
  v168 = v45;
  if (v45 >= v169)
  {
    v56 = 0xAAAAAAAAAAAAAAABLL * ((v45 - (_BYTE *)__p) >> 3);
    if (v56 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v57 = 0x5555555555555556 * ((v169 - (_BYTE *)__p) >> 3);
    if (v57 <= v56 + 1)
      v57 = v56 + 1;
    if (0xAAAAAAAAAAAAAAABLL * ((v169 - (_BYTE *)__p) >> 3) >= 0x555555555555555)
      v58 = 0xAAAAAAAAAAAAAAALL;
    else
      v58 = v57;
    if (v58)
      v59 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>((uint64_t)&v169, v58);
    else
      v59 = 0;
    v60 = &v59[24 * v56];
    v61 = &v59[24 * v58];
    *(_DWORD *)v60 = 103;
    *((_QWORD *)v60 + 1) = &v173;
    *((_DWORD *)v60 + 4) = 0;
    v55 = v60 + 24;
    v62 = v168;
    v63 = (char *)__p;
    if (v168 != __p)
    {
      do
      {
        v64 = *(_OWORD *)(v62 - 24);
        *((_DWORD *)v60 - 2) = *((_DWORD *)v62 - 2);
        *(_OWORD *)(v60 - 24) = v64;
        v60 -= 24;
        v62 -= 24;
      }
      while (v62 != v63);
      v62 = (char *)__p;
    }
    __p = v60;
    v168 = v55;
    v169 = v61;
    if (v62)
      operator delete(v62);
  }
  else
  {
    *(_DWORD *)v45 = 103;
    *((_QWORD *)v45 + 1) = &v173;
    *((_DWORD *)v45 + 4) = 0;
    v55 = v45 + 24;
  }
  v168 = v55;
  if (v55 >= v169)
  {
    v66 = 0xAAAAAAAAAAAAAAABLL * ((v55 - (_BYTE *)__p) >> 3);
    if (v66 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v67 = 0x5555555555555556 * ((v169 - (_BYTE *)__p) >> 3);
    if (v67 <= v66 + 1)
      v67 = v66 + 1;
    if (0xAAAAAAAAAAAAAAABLL * ((v169 - (_BYTE *)__p) >> 3) >= 0x555555555555555)
      v68 = 0xAAAAAAAAAAAAAAALL;
    else
      v68 = v67;
    if (v68)
      v69 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>((uint64_t)&v169, v68);
    else
      v69 = 0;
    v70 = &v69[24 * v66];
    v71 = &v69[24 * v68];
    *(_DWORD *)v70 = 111;
    *((_QWORD *)v70 + 1) = (char *)&v172 + 4;
    *((_DWORD *)v70 + 4) = 0;
    v65 = v70 + 24;
    v72 = v168;
    v73 = (char *)__p;
    if (v168 != __p)
    {
      do
      {
        v74 = *(_OWORD *)(v72 - 24);
        *((_DWORD *)v70 - 2) = *((_DWORD *)v72 - 2);
        *(_OWORD *)(v70 - 24) = v74;
        v70 -= 24;
        v72 -= 24;
      }
      while (v72 != v73);
      v72 = (char *)__p;
    }
    __p = v70;
    v168 = v65;
    v169 = v71;
    if (v72)
      operator delete(v72);
  }
  else
  {
    *(_DWORD *)v55 = 111;
    *((_QWORD *)v55 + 1) = (char *)&v172 + 4;
    *((_DWORD *)v55 + 4) = 0;
    v65 = v55 + 24;
  }
  v168 = v65;
  if (v65 >= v169)
  {
    v76 = 0xAAAAAAAAAAAAAAABLL * ((v65 - (_BYTE *)__p) >> 3);
    if (v76 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v77 = 0x5555555555555556 * ((v169 - (_BYTE *)__p) >> 3);
    if (v77 <= v76 + 1)
      v77 = v76 + 1;
    if (0xAAAAAAAAAAAAAAABLL * ((v169 - (_BYTE *)__p) >> 3) >= 0x555555555555555)
      v78 = 0xAAAAAAAAAAAAAAALL;
    else
      v78 = v77;
    if (v78)
      v79 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>((uint64_t)&v169, v78);
    else
      v79 = 0;
    v80 = &v79[24 * v76];
    v81 = &v79[24 * v78];
    *(_DWORD *)v80 = 112;
    *((_QWORD *)v80 + 1) = &v171;
    *((_DWORD *)v80 + 4) = 5;
    v75 = v80 + 24;
    v82 = v168;
    v83 = (char *)__p;
    if (v168 != __p)
    {
      do
      {
        v84 = *(_OWORD *)(v82 - 24);
        *((_DWORD *)v80 - 2) = *((_DWORD *)v82 - 2);
        *(_OWORD *)(v80 - 24) = v84;
        v80 -= 24;
        v82 -= 24;
      }
      while (v82 != v83);
      v82 = (char *)__p;
    }
    __p = v80;
    v168 = v75;
    v169 = v81;
    if (v82)
      operator delete(v82);
  }
  else
  {
    *(_DWORD *)v65 = 112;
    *((_QWORD *)v65 + 1) = &v171;
    *((_DWORD *)v65 + 4) = 5;
    v75 = v65 + 24;
  }
  v168 = v75;
  if (v75 >= v169)
  {
    v86 = 0xAAAAAAAAAAAAAAABLL * ((v75 - (_BYTE *)__p) >> 3);
    if (v86 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v87 = 0x5555555555555556 * ((v169 - (_BYTE *)__p) >> 3);
    if (v87 <= v86 + 1)
      v87 = v86 + 1;
    if (0xAAAAAAAAAAAAAAABLL * ((v169 - (_BYTE *)__p) >> 3) >= 0x555555555555555)
      v88 = 0xAAAAAAAAAAAAAAALL;
    else
      v88 = v87;
    if (v88)
      v89 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>((uint64_t)&v169, v88);
    else
      v89 = 0;
    v90 = &v89[24 * v86];
    v91 = &v89[24 * v88];
    *(_DWORD *)v90 = 113;
    *((_QWORD *)v90 + 1) = &v172;
    *((_DWORD *)v90 + 4) = 1;
    v85 = v90 + 24;
    v92 = v168;
    v93 = (char *)__p;
    if (v168 != __p)
    {
      do
      {
        v94 = *(_OWORD *)(v92 - 24);
        *((_DWORD *)v90 - 2) = *((_DWORD *)v92 - 2);
        *(_OWORD *)(v90 - 24) = v94;
        v90 -= 24;
        v92 -= 24;
      }
      while (v92 != v93);
      v92 = (char *)__p;
    }
    __p = v90;
    v168 = v85;
    v169 = v91;
    if (v92)
      operator delete(v92);
  }
  else
  {
    *(_DWORD *)v75 = 113;
    *((_QWORD *)v75 + 1) = &v172;
    *((_DWORD *)v75 + 4) = 1;
    v85 = v75 + 24;
  }
  v168 = v85;
  v95 = 0.0;
  if (!APCConfigReader::loadParams((uint64_t)&v170, &__p))
  {
    v96 = HIDWORD(v174);
    if (!HIDWORD(v174))
    {
      v96 = 2048;
      HIDWORD(v174) = 2048;
    }
    if (!(_DWORD)v174)
      LODWORD(v174) = 2;
    if (*((float *)&v173 + 1) == 0.0)
      HIDWORD(v173) = 1065353216;
    if (*(float *)&v173 == 0.0)
      LODWORD(v173) = 1008981770;
    if (*((float *)&v172 + 1) == 0.0)
      HIDWORD(v172) = 1183621120;
    if (!HIBYTE(v171))
      v171 = 257;
    if (!(_DWORD)v172)
      LODWORD(v172) = 100;
    HIDWORD(v174) = echoCodec::getSRCFreeFrameSize((echoCodec *)v96, HIDWORD(v175));
    SRCFreeFrameSize = echoCodec::getSRCFreeFrameSize((echoCodec *)(v96 >> 2), HIDWORD(v175));
    if (3 * HIDWORD(v175) <= a3)
    {
      v98 = SRCFreeFrameSize;
      std::vector<float>::vector(&__B, (2 * HIDWORD(v174)));
      std::vector<float>::vector(v164, HIDWORD(v174));
      std::vector<float>::vector(__C, HIDWORD(v174));
      v154 = a2;
      v155 = a4;
      std::vector<float>::vector(v162, (HIDWORD(v174) + HIDWORD(v174) * v174));
      v100 = v174;
      v99 = HIDWORD(v174);
      v101 = HIDWORD(v175);
      vDSP_vclr(__B, 1, v166 - __B);
      v161 = 0;
      SyncType = echoCodec::getSyncType((echoCodec *)v172);
      v103 = SyncType;
      if (!SyncType)
      {
        v104 = operator new();
        *(_OWORD *)(v104 + 96) = 0u;
        *(_OWORD *)(v104 + 112) = 0u;
        *(_OWORD *)(v104 + 128) = 0u;
        *(_OWORD *)(v104 + 144) = 0u;
        *(_OWORD *)v104 = 0u;
        *(_OWORD *)(v104 + 16) = 0u;
        *(_OWORD *)(v104 + 32) = 0u;
        *(_OWORD *)(v104 + 48) = 0u;
        *(_OWORD *)(v104 + 64) = 0u;
        *(_OWORD *)(v104 + 80) = 0u;
        *(_OWORD *)(v104 + 160) = 0u;
        *(_QWORD *)v104 = &unk_24F24B928;
        *(_OWORD *)(v104 + 104) = 0u;
        *(_OWORD *)(v104 + 120) = 0u;
        *(_OWORD *)(v104 + 136) = 0u;
        *(_QWORD *)(v104 + 12) = 0;
        *(_QWORD *)(v104 + 17) = 0;
        *(_OWORD *)(v104 + 28) = 0u;
        *(_OWORD *)(v104 + 44) = 0u;
        *(_OWORD *)(v104 + 60) = 0u;
        *(_OWORD *)(v104 + 76) = 0u;
        *(_QWORD *)(v104 + 92) = 0;
        *(_DWORD *)(v104 + 152) = -1;
        *(_QWORD *)(v104 + 264) = 0;
        *(_OWORD *)(v104 + 248) = 0u;
        *(_OWORD *)(v104 + 232) = 0u;
        *(_OWORD *)(v104 + 216) = 0u;
        *(_OWORD *)(v104 + 200) = 0u;
        *(_OWORD *)(v104 + 184) = 0u;
        *(_OWORD *)(v104 + 168) = 0u;
        v105 = operator new();
        *(_OWORD *)v105 = 0u;
        *(_OWORD *)(v105 + 16) = 0u;
        *(_OWORD *)(v105 + 64) = 0u;
        *(_OWORD *)(v105 + 80) = 0u;
        *(_OWORD *)(v105 + 32) = 0u;
        *(_OWORD *)(v105 + 48) = 0u;
        *(_QWORD *)v105 = &unk_24F24B8C8;
        *(_QWORD *)(v105 + 12) = 0;
        *(_QWORD *)(v105 + 20) = 0;
        *(_QWORD *)(v105 + 28) = 0;
        *(_QWORD *)(v105 + 33) = 0;
        *(_DWORD *)(v105 + 44) = 3;
        *(_QWORD *)(v105 + 64) = 0;
        *(_QWORD *)(v105 + 72) = 0;
        *(_QWORD *)(v105 + 80) = 0;
        *(_DWORD *)(v105 + 88) = 0;
        *(_BYTE *)(v105 + 92) = 1;
        *(_QWORD *)(v105 + 144) = 0;
        *(_OWORD *)(v105 + 112) = 0u;
        *(_OWORD *)(v105 + 128) = 0u;
        *(_OWORD *)(v105 + 96) = 0u;
        v106 = (EchoEmbedder *)operator new();
        *((_OWORD *)v106 + 9) = 0u;
        *((_OWORD *)v106 + 10) = 0u;
        *((_OWORD *)v106 + 7) = 0u;
        *((_OWORD *)v106 + 8) = 0u;
        *((_OWORD *)v106 + 5) = 0u;
        *((_OWORD *)v106 + 6) = 0u;
        *((_OWORD *)v106 + 3) = 0u;
        *((_OWORD *)v106 + 4) = 0u;
        *((_OWORD *)v106 + 1) = 0u;
        *((_OWORD *)v106 + 2) = 0u;
        *(_OWORD *)v106 = 0u;
        EchoEmbedder::EchoEmbedder(v106);
        goto LABEL_154;
      }
      if (SyncType)
      {
        v104 = operator new();
        *(_QWORD *)(v104 + 352) = 0;
        *(_OWORD *)(v104 + 320) = 0u;
        *(_OWORD *)(v104 + 336) = 0u;
        *(_OWORD *)(v104 + 288) = 0u;
        *(_OWORD *)(v104 + 304) = 0u;
        *(_OWORD *)(v104 + 256) = 0u;
        *(_OWORD *)(v104 + 272) = 0u;
        *(_OWORD *)(v104 + 224) = 0u;
        *(_OWORD *)(v104 + 240) = 0u;
        *(_OWORD *)(v104 + 192) = 0u;
        *(_OWORD *)(v104 + 208) = 0u;
        *(_OWORD *)(v104 + 160) = 0u;
        *(_OWORD *)(v104 + 176) = 0u;
        *(_OWORD *)(v104 + 128) = 0u;
        *(_OWORD *)(v104 + 144) = 0u;
        *(_OWORD *)(v104 + 96) = 0u;
        *(_OWORD *)(v104 + 112) = 0u;
        *(_OWORD *)(v104 + 64) = 0u;
        *(_OWORD *)(v104 + 80) = 0u;
        *(_OWORD *)(v104 + 32) = 0u;
        *(_OWORD *)(v104 + 48) = 0u;
        *(_OWORD *)v104 = 0u;
        *(_OWORD *)(v104 + 16) = 0u;
        SyncEchoDetector::SyncEchoDetector((SyncEchoDetector *)v104);
        v105 = operator new();
        *(_OWORD *)v105 = 0u;
        *(_OWORD *)(v105 + 16) = 0u;
        *(_QWORD *)v105 = &unk_24F24B7D0;
        *(_QWORD *)(v105 + 12) = 0;
        *(_BYTE *)(v105 + 20) = 0;
        *(_DWORD *)(v105 + 24) = 2;
        v106 = (EchoEmbedder *)operator new();
        *((_OWORD *)v106 + 9) = 0u;
        *((_OWORD *)v106 + 10) = 0u;
        *((_OWORD *)v106 + 7) = 0u;
        *((_OWORD *)v106 + 8) = 0u;
        *((_OWORD *)v106 + 5) = 0u;
        *((_OWORD *)v106 + 6) = 0u;
        *((_OWORD *)v106 + 3) = 0u;
        *((_OWORD *)v106 + 4) = 0u;
        *((_OWORD *)v106 + 1) = 0u;
        *((_OWORD *)v106 + 2) = 0u;
        *(_OWORD *)v106 = 0u;
        EchoEmbedder::EchoEmbedder(v106);
        *(_QWORD *)v106 = &unk_24F24B880;
LABEL_154:
        v107 = v161;
        v161 = v106;
        if (v107)
          (*(void (**)(EchoEmbedder *))(*(_QWORD *)v107 + 8))(v107);
        (*(void (**)(uint64_t, uint64_t **))(*(_QWORD *)v104 + 32))(v104, v155);
        (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)v104 + 16))(v104, HIDWORD(v175), HIDWORD(v174));
        (*(void (**)(uint64_t, uint64_t **))(*(_QWORD *)v105 + 32))(v105, v155);
        v153 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v105 + 48))(v105);
        v108 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v104 + 56))(v104);
        v156 = v103;
        v109 = 500 * v101 / 0x3E8u;
        v152 = v109;
        if (v108 <= v109)
          v110 = v109;
        else
          v110 = v108;
        v111 = operator new();
        *(_QWORD *)v111 = 0x100000000;
        *(_OWORD *)(v111 + 8) = 0u;
        *(_OWORD *)(v111 + 24) = 0u;
        v160 = (ShapingFilter *)v111;
        v112 = operator new();
        *(_QWORD *)v112 = 0x100000000;
        *(_OWORD *)(v112 + 8) = 0u;
        *(_OWORD *)(v112 + 24) = 0u;
        v159 = (ShapingFilter *)v112;
        ShapingFilter::initialize((uint64_t)v160, 0, SHIDWORD(v175), 1u, 1, *((float *)&v172 + 1));
        ShapingFilter::initialize((uint64_t)v159, 1, SHIDWORD(v175), 1u, 1, *((float *)&v172 + 1));
        v113 = v100 * v99 - v98;
        (*(void (**)(EchoEmbedder *, _QWORD, uint64_t, uint64_t **))(*(_QWORD *)v161 + 16))(v161, HIDWORD(v175), v113, v155);
        LOBYTE(v176) = 0;
        std::vector<unsigned char>::vector(&v178, v175, &v176);
        (*(void (**)(EchoEmbedder *, ShapingFilter **, _QWORD))(*(_QWORD *)v161 + 24))(v161, v178, v175);
        if (v178)
        {
          v179 = v178;
          operator delete(v178);
        }
        v114 = 0;
        v150 = v113;
        v151 = 8 * v113;
        while (1)
        {
          if ((v114 & 1) != 0
            || (HIBYTE(v171) ? (v115 = v171 == 0) : (v115 = 1),
                v115 ? (v116 = 0) : (v116 = 1),
                (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)v105 + 16))(v105, HIDWORD(v175), HIDWORD(v174), v110, v116), a3 < 1))
          {
LABEL_220:
            v143 = v159;
            v159 = 0;
            if (v143)
              std::default_delete<ShapingFilter>::operator()[abi:ne180100]((uint64_t)&v159, (uint64_t)v143);
            v144 = v160;
            v160 = 0;
            if (v144)
              std::default_delete<ShapingFilter>::operator()[abi:ne180100]((uint64_t)&v160, (uint64_t)v144);
            goto LABEL_229;
          }
          v117 = v110 + v153;
          v118 = a3;
          v119 = v154;
          while (1)
          {
            v120 = v118 >= HIDWORD(v174) ? HIDWORD(v174) : v118;
            LODWORD(v176) = 0;
            v121 = v110 - (a3 - v118);
            if (v110 <= a3 - v118
              || !(*(unsigned int (**)(uint64_t))(*(_QWORD *)v104 + 72))(v104))
            {
              break;
            }
            if (v120 >= v121)
              v120 = v121;
            else
              v120 = v120;
            ShapingFilter::filter(v160, v119, __B, v120);
            vDSP_vclr(__C[0], 1, v120);
            v122 = (ShapingFilter ***)operator new(0x20uLL);
            *v122 = (ShapingFilter **)&off_24F24B710;
            v122[1] = &v161;
            v122[2] = (ShapingFilter **)v162;
            v122[3] = (ShapingFilter **)&v173;
            v180 = v122;
            (*(void (**)(uint64_t, float **, vDSP_Length, ShapingFilter ***))(*(_QWORD *)v105 + 40))(v105, __C, v120, &v178);
            v123 = v180;
            if (v180 == &v178)
            {
              v123 = &v178;
              v124 = 4;
            }
            else
            {
              if (!v180)
                goto LABEL_194;
              v124 = 5;
            }
            ((void (*)(void))(*v123)[v124])();
LABEL_194:
            ShapingFilter::filter(v159, __C[0], __C[0], v120);
            vDSP_vadd(__C[0], 1, __B, 1, __B, 1, v120);
            if (((*(uint64_t (**)(uint64_t, float *, vDSP_Length, void (**)(int), uint64_t))(*(_QWORD *)v104 + 40))(v104, __B, v120, &v176, 1) & 1) != 0)goto LABEL_211;
LABEL_200:
            v119 += v120;
            v130 = __OFSUB__(v118, (_DWORD)v120);
            v118 -= v120;
            if ((v118 < 0) ^ v130 | (v118 == 0))
              goto LABEL_220;
          }
          if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)v104 + 48))(v104) & 1) == 0)
          {
            ShapingFilter::filter(v160, v119, __B, v120);
            if (v156)
            {
              v125 = EchoEmbedder::encodeEcho(v161, __C[0], v120);
              if (*((_DWORD *)v161 + 30) < *((_DWORD *)v161 + 42))
                v126 = v125;
              else
                v126 = 0;
              if ((v126 & 1) == 0)
                goto LABEL_211;
            }
            else
            {
              v127 = (ShapingFilter ***)operator new(0x20uLL);
              *v127 = (ShapingFilter **)&off_24F24B710;
              v127[1] = &v161;
              v127[2] = (ShapingFilter **)v162;
              v127[3] = (ShapingFilter **)&v173;
              v180 = v127;
              (*(void (**)(uint64_t, float **, vDSP_Length, ShapingFilter ***))(*(_QWORD *)v105 + 40))(v105, __C, v120, &v178);
              v128 = v180;
              if (v180 == &v178)
              {
                v128 = &v178;
                v129 = 4;
              }
              else
              {
                if (!v180)
                  goto LABEL_198;
                v129 = 5;
              }
              ((void (*)(void))(*v128)[v129])();
            }
LABEL_198:
            ShapingFilter::filter(v159, __C[0], __C[0], v120);
            vDSP_vadd(__C[0], 1, __B, 1, __B, 1, v120);
            (*(void (**)(uint64_t, float *, vDSP_Length, void (**)(int), uint64_t))(*(_QWORD *)v104 + 40))(v104, __B, v120, &v176, 1);
          }
          if (a3 - v118 < v117 + (*(unsigned int (**)(uint64_t))(*(_QWORD *)v104 + 64))(v104))
            goto LABEL_200;
          v131 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v104 + 48))(v104);
          if (v110 >= v152)
            v132 = v131;
          else
            v132 = 0;
          if (v132 != 1)
          {
LABEL_211:
            v114 = 0;
            goto LABEL_212;
          }
          if (a3 - v117 <= (v151 * v175))
          {
            v114 = 1;
          }
          else
          {
            v158 = 108;
            v178 = (ShapingFilter **)&v158;
            v133 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(v155, &v158, (uint64_t)&std::piecewise_construct, (_DWORD **)&v178);
            v134 = (void (**)(uint64_t, _QWORD, ShapingFilter ***, _QWORD, _QWORD))(v133 + 5);
            v177 = v110;
            v176 = std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
            if (&v176 != (void (**)(int))(v133 + 5))
            {
              v135 = *v134;
              if (*v134)
              {
                v178 = 0;
                v179 = 0;
                v135(2, v134, &v178, 0, 0);
                ((void (*)(uint64_t, void (**)(int), _QWORD, _QWORD, _QWORD))v176)(2, &v176, v134, 0, 0);
                ((void (*)(uint64_t, ShapingFilter ***, void (**)(int), _QWORD, _QWORD))v178)(2, &v178, &v176, 0, 0);
                std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v178);
              }
              else
              {
                *((_DWORD *)v133 + 12) = v110;
                v133[5] = (uint64_t *)std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
                v176 = 0;
              }
            }
            std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v176);
            v137 = *((_QWORD *)v161 + 21);
            v138 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v105 + 48))(v105);
            v158 = 1000;
            v178 = (ShapingFilter **)&v158;
            v139 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(v155, &v158, (uint64_t)&std::piecewise_construct, (_DWORD **)&v178);
            v140 = v138 + v150 * v137;
            v141 = (void (**)(uint64_t, _QWORD, ShapingFilter ***, _QWORD, _QWORD))(v139 + 5);
            v177 = v140;
            v176 = std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
            if (&v176 != (void (**)(int))(v139 + 5))
            {
              v142 = *v141;
              if (*v141)
              {
                v178 = 0;
                v179 = 0;
                v142(2, v141, &v178, 0, 0);
                ((void (*)(uint64_t, void (**)(int), _QWORD, _QWORD, _QWORD))v176)(2, &v176, v141, 0, 0);
                ((void (*)(uint64_t, ShapingFilter ***, void (**)(int), _QWORD, _QWORD))v178)(2, &v178, &v176, 0, 0);
                std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v178);
              }
              else
              {
                *((_DWORD *)v139 + 12) = v140;
                v139[5] = (uint64_t *)std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
                v176 = 0;
              }
            }
            std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v176);
            v114 = 1;
            v95 = 1.0;
          }
LABEL_212:
          v136 = HIDWORD(v174);
          (*(void (**)(uint64_t))(*(_QWORD *)v104 + 24))(v104);
          EchoEmbedder::reset((uint64_t)v161);
          ShapingFilter::reset(v160);
          v110 = (v136 + v110);
          ShapingFilter::reset(v159);
        }
      }
      LODWORD(v160) = 108;
      v178 = &v160;
      v145 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(v155, (unsigned int *)&v160, (uint64_t)&std::piecewise_construct, (_DWORD **)&v178);
      v146 = (void (**)(uint64_t, _QWORD, ShapingFilter ***, _QWORD, _QWORD))(v145 + 5);
      v176 = std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
      v177 = 24000;
      if (&v176 != (void (**)(int))(v145 + 5))
      {
        v147 = *v146;
        if (*v146)
        {
          v178 = 0;
          v179 = 0;
          v147(2, v146, &v178, 0, 0);
          ((void (*)(uint64_t, void (**)(int), _QWORD, _QWORD, _QWORD))v176)(2, &v176, v146, 0, 0);
          ((void (*)(uint64_t, ShapingFilter ***, void (**)(int), _QWORD, _QWORD))v178)(2, &v178, &v176, 0, 0);
          std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v178);
        }
        else
        {
          *((_DWORD *)v145 + 12) = 24000;
          v145[5] = (uint64_t *)std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
          v176 = 0;
        }
      }
      std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v176);
      v104 = 0;
      v105 = 0;
      v95 = 1.0;
LABEL_229:
      v148 = v161;
      v161 = 0;
      if (v148)
        (*(void (**)(EchoEmbedder *))(*(_QWORD *)v148 + 8))(v148);
      if (v105)
        (*(void (**)(uint64_t))(*(_QWORD *)v105 + 8))(v105);
      if (v104)
        (*(void (**)(uint64_t))(*(_QWORD *)v104 + 8))(v104);
      if (v162[0])
      {
        v162[1] = v162[0];
        operator delete(v162[0]);
      }
      if (__C[0])
      {
        __C[1] = __C[0];
        operator delete(__C[0]);
      }
      if (v164[0])
      {
        v164[1] = v164[0];
        operator delete(v164[0]);
      }
      if (__B)
      {
        v166 = __B;
        operator delete(__B);
      }
    }
  }
  if (__p)
  {
    v168 = (char *)__p;
    operator delete(__p);
  }
  return v95;
}

void sub_22958C0D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30,uint64_t a31,void *a32)
{
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;

  v36 = a17;
  a17 = 0;
  if (v36)
    std::default_delete<ShapingFilter>::operator()[abi:ne180100]((uint64_t)&a17, v36);
  v37 = a18;
  a18 = 0;
  if (v37)
    std::default_delete<ShapingFilter>::operator()[abi:ne180100]((uint64_t)&a18, v37);
  v38 = a19;
  a19 = 0;
  if (v38)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v38 + 8))(v38);
    if (!v33)
    {
LABEL_7:
      if (!v32)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if (!v33)
  {
    goto LABEL_7;
  }
  (*(void (**)(uint64_t))(*(_QWORD *)v33 + 8))(v33);
  if (!v32)
  {
LABEL_9:
    if (__p)
    {
      a21 = (uint64_t)__p;
      operator delete(__p);
    }
    if (a23)
    {
      a24 = (uint64_t)a23;
      operator delete(a23);
    }
    if (a26)
    {
      a27 = (uint64_t)a26;
      operator delete(a26);
    }
    if (a29)
    {
      a30 = (uint64_t)a29;
      operator delete(a29);
    }
    v39 = a32;
    if (a32)
    {
      *(_QWORD *)(v34 + 8) = a32;
      operator delete(v39);
    }
    _Unwind_Resume(exception_object);
  }
LABEL_8:
  (*(void (**)(uint64_t))(*(_QWORD *)v32 + 8))(v32);
  goto LABEL_9;
}

uint64_t EchoCodeEncoder::reset(EchoCodeEncoder *this)
{
  if (!*((_DWORD *)this + 4))
    return 0xFFFFFFFFLL;
  (*(void (**)(_QWORD))(**((_QWORD **)this + 12) + 24))(*((_QWORD *)this + 12));
  EchoEmbedder::reset(*((_QWORD *)this + 9));
  return 0;
}

uint64_t `non-virtual thunk to'EchoCodeEncoder::reset(EchoCodeEncoder *this)
{
  if (!*((_DWORD *)this + 2))
    return 0xFFFFFFFFLL;
  (*(void (**)(_QWORD))(**((_QWORD **)this + 11) + 24))(*((_QWORD *)this + 11));
  EchoEmbedder::reset(*((_QWORD *)this + 8));
  return 0;
}

uint64_t EchoCodeEncoder::Status(EchoCodeEncoder *this)
{
  uint64_t v1;

  v1 = *((_QWORD *)this + 9);
  if (v1)
    return *(_DWORD *)(v1 + 120) < *(_DWORD *)(v1 + 168);
  else
    return 0xFFFFFFFFLL;
}

uint64_t EchoCodeEncoder::Reset(uint64_t this)
{
  uint64_t v1;

  if (*(_DWORD *)(this + 16))
  {
    v1 = this;
    (*(void (**)(_QWORD))(**(_QWORD **)(this + 96) + 24))(*(_QWORD *)(this + 96));
    return EchoEmbedder::reset(*(_QWORD *)(v1 + 72));
  }
  return this;
}

uint64_t EchoCodeEncoder::setPasscode(EchoCodeEncoder *this, const unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v6;
  const unsigned __int8 *v7;
  NSObject *v8;
  int v9;
  uint8_t buf[4];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (*((_DWORD *)this + 10) != (_DWORD)a3)
    return 4294967290;
  if ((_DWORD)a3)
  {
    v6 = a3;
    v7 = a2;
    do
    {
      APCLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = *v7;
        *(_DWORD *)buf = 67109120;
        v12 = v9;
        _os_log_impl(&dword_229580000, v8, OS_LOG_TYPE_INFO, "APC encoder just received 1 byte of passcode: 0x%02X", buf, 8u);
      }

      ++v7;
      --v6;
    }
    while (v6);
  }
  (*(void (**)(_QWORD, const unsigned __int8 *, uint64_t))(**((_QWORD **)this + 9) + 24))(*((_QWORD *)this + 9), a2, a3);
  return 0;
}

uint64_t `non-virtual thunk to'EchoCodeEncoder::setPasscode(EchoCodeEncoder *this, const unsigned __int8 *a2, uint64_t a3)
{
  return EchoCodeEncoder::setPasscode((EchoCodeEncoder *)((char *)this - 8), a2, a3);
}

uint64_t EchoCodeEncoder::setParams(uint64_t a1, unsigned int a2, void (**a3)(uint64_t))
{
  uint64_t result;
  _DWORD *v7;
  _DWORD *v8;
  _DWORD *v9;
  _DWORD *v10;
  _DWORD *v11;
  _DWORD *v12;
  float *v13;
  float *v14;
  unsigned __int8 *v15;
  _DWORD *v16;
  uint64_t **v17;
  unsigned int v18;
  unsigned int *v19;

  if (*(_DWORD *)(a1 + 16))
    return 4294967287;
  result = 4294967290;
  switch(a2)
  {
    case 'd':
      v7 = std::any_cast[abi:ne180100]<unsigned int>((uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))a3);
      if (!v7)
        goto LABEL_28;
      *(_DWORD *)(a1 + 20) = *v7;
      goto LABEL_26;
    case 'e':
      v8 = std::any_cast[abi:ne180100]<unsigned int>((uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))a3);
      if (!v8)
        goto LABEL_28;
      *(_DWORD *)(a1 + 28) = *v8;
      goto LABEL_26;
    case 'g':
      v9 = std::any_cast[abi:ne180100]<float>((uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))a3);
      if (!v9)
        goto LABEL_28;
      *(_DWORD *)(a1 + 52) = *v9;
      goto LABEL_26;
    case 'h':
      v10 = std::any_cast[abi:ne180100]<float>((uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))a3);
      if (!v10)
        goto LABEL_28;
      *(_DWORD *)(a1 + 36) = *v10;
      goto LABEL_26;
    case 'n':
      v11 = std::any_cast[abi:ne180100]<unsigned int>((uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))a3);
      if (!v11)
        goto LABEL_28;
      if (!*v11)
        goto LABEL_20;
      v12 = std::any_cast[abi:ne180100]<unsigned int>((uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))a3);
      if (!v12)
        goto LABEL_28;
      *(_DWORD *)(a1 + 44) = *v12;
      goto LABEL_26;
    case 'o':
      v13 = (float *)std::any_cast[abi:ne180100]<float>((uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))a3);
      if (!v13)
        goto LABEL_28;
      if (*v13 < 16000.0)
        goto LABEL_20;
      v14 = (float *)std::any_cast[abi:ne180100]<float>((uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))a3);
      if (!v14)
LABEL_28:
        std::__throw_bad_any_cast[abi:ne180100]();
      if (*v14 <= 20000.0)
      {
        *(float *)(a1 + 60) = std::any_cast[abi:ne180100]<float>((uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))a3);
LABEL_26:
        v18 = a2;
        v19 = &v18;
        v17 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)(a1 + 152), &v18, (uint64_t)&std::piecewise_construct, &v19);
        std::any::operator=[abi:ne180100]((unint64_t *)v17 + 5, a3);
        result = 0;
      }
      else
      {
LABEL_20:
        result = 4294967290;
      }
      break;
    case 'p':
      v15 = (unsigned __int8 *)std::any_cast[abi:ne180100]<BOOL>((uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))a3);
      if (!v15)
        goto LABEL_28;
      *(_WORD *)(a1 + 48) = *v15 | 0x100;
      goto LABEL_26;
    case 'q':
      v16 = std::any_cast[abi:ne180100]<unsigned int>((uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))a3);
      if (!v16)
        goto LABEL_28;
      *(_DWORD *)(a1 + 64) = *v16;
      goto LABEL_26;
    default:
      return result;
  }
  return result;
}

BOOL EchoCodeEncoder::isInitialized(EchoCodeEncoder *this)
{
  return *((_DWORD *)this + 4) != 0;
}

float std::any_cast[abi:ne180100]<float>(uint64_t (**a1)(uint64_t, _QWORD, _QWORD, _QWORD, void *))
{
  uint64_t (**v1)(uint64_t, _QWORD, _QWORD, _QWORD, void *);

  v1 = std::any_cast[abi:ne180100]<float>(a1);
  if (!v1)
    std::__throw_bad_any_cast[abi:ne180100]();
  return *(float *)v1;
}

uint64_t `non-virtual thunk to'EchoCodeEncoder::setParams(uint64_t a1, unsigned int a2, void (**a3)(uint64_t))
{
  return EchoCodeEncoder::setParams(a1 - 8, a2, a3);
}

BOOL `non-virtual thunk to'EchoCodeEncoder::isInitialized(EchoCodeEncoder *this)
{
  return *((_DWORD *)this + 2) != 0;
}

void EchoCodeEncoder::~EchoCodeEncoder(EchoCodeEncoder *this)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::destroy((uint64_t)this + 152, *((_QWORD **)this + 20));
  v2 = (void *)*((_QWORD *)this + 16);
  if (v2)
  {
    *((_QWORD *)this + 17) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((_QWORD *)this + 13);
  if (v3)
  {
    *((_QWORD *)this + 14) = v3;
    operator delete(v3);
  }
  v4 = *((_QWORD *)this + 12);
  *((_QWORD *)this + 12) = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  v5 = *((_QWORD *)this + 11);
  *((_QWORD *)this + 11) = 0;
  if (v5)
    std::default_delete<ShapingFilter>::operator()[abi:ne180100]((uint64_t)this + 88, v5);
  v6 = *((_QWORD *)this + 10);
  *((_QWORD *)this + 10) = 0;
  if (v6)
    std::default_delete<ShapingFilter>::operator()[abi:ne180100]((uint64_t)this + 80, v6);
  v7 = *((_QWORD *)this + 9);
  *((_QWORD *)this + 9) = 0;
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
}

{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::destroy((uint64_t)this + 152, *((_QWORD **)this + 20));
  v2 = (void *)*((_QWORD *)this + 16);
  if (v2)
  {
    *((_QWORD *)this + 17) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((_QWORD *)this + 13);
  if (v3)
  {
    *((_QWORD *)this + 14) = v3;
    operator delete(v3);
  }
  v4 = *((_QWORD *)this + 12);
  *((_QWORD *)this + 12) = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  v5 = *((_QWORD *)this + 11);
  *((_QWORD *)this + 11) = 0;
  if (v5)
    std::default_delete<ShapingFilter>::operator()[abi:ne180100]((uint64_t)this + 88, v5);
  v6 = *((_QWORD *)this + 10);
  *((_QWORD *)this + 10) = 0;
  if (v6)
    std::default_delete<ShapingFilter>::operator()[abi:ne180100]((uint64_t)this + 80, v6);
  v7 = *((_QWORD *)this + 9);
  *((_QWORD *)this + 9) = 0;
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  JUMPOUT(0x22E2CB548);
}

void `non-virtual thunk to'EchoCodeEncoder::~EchoCodeEncoder(EchoCodeEncoder *this)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::destroy((uint64_t)this + 144, *((_QWORD **)this + 19));
  v2 = (void *)*((_QWORD *)this + 15);
  if (v2)
  {
    *((_QWORD *)this + 16) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((_QWORD *)this + 12);
  if (v3)
  {
    *((_QWORD *)this + 13) = v3;
    operator delete(v3);
  }
  v4 = *((_QWORD *)this + 11);
  *((_QWORD *)this + 11) = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  v5 = *((_QWORD *)this + 10);
  *((_QWORD *)this + 10) = 0;
  if (v5)
    std::default_delete<ShapingFilter>::operator()[abi:ne180100]((uint64_t)this + 80, v5);
  v6 = *((_QWORD *)this + 9);
  *((_QWORD *)this + 9) = 0;
  if (v6)
    std::default_delete<ShapingFilter>::operator()[abi:ne180100]((uint64_t)this + 72, v6);
  v7 = *((_QWORD *)this + 8);
  *((_QWORD *)this + 8) = 0;
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
}

{
  EchoCodeEncoder::~EchoCodeEncoder((EchoCodeEncoder *)((char *)this - 8));
}

_QWORD *std::vector<float>::vector(_QWORD *a1, unint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<float>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    bzero(v4, 4 * a2);
    a1[1] = &v4[4 * a2];
  }
  return a1;
}

void sub_22958C998(_Unwind_Exception *exception_object)
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

char *std::vector<float>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 62)
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void EchoEmbedder::EchoEmbedder(EchoEmbedder *this)
{
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_QWORD *)this = &off_24F24B840;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  *((_WORD *)this + 16) = 0;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *((_QWORD *)this + 13) = 0;
  *((_QWORD *)this + 14) = Random::instance(this);
  *((_DWORD *)this + 30) = 0;
  *((_OWORD *)this + 8) = 0u;
  *((_OWORD *)this + 9) = 0u;
  *((_OWORD *)this + 10) = 0u;
}

void sub_22958CA6C(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;
  void **v3;
  void *v5;

  v5 = *(void **)(v1 + 88);
  if (v5)
  {
    *(_QWORD *)(v1 + 96) = v5;
    operator delete(v5);
  }
  EchoEmbedder::EchoEmbedder(v3, v2, v1);
  _Unwind_Resume(a1);
}

void std::__function::__func<EchoCodeEncoder::encode(float const*,float *,unsigned int)::$_0,std::allocator<EchoCodeEncoder::encode(float const*,float *,unsigned int)::$_0>,void ()(float *,unsigned int)>::~__func()
{
  JUMPOUT(0x22E2CB548);
}

_QWORD *std::__function::__func<EchoCodeEncoder::encode(float const*,float *,unsigned int)::$_0,std::allocator<EchoCodeEncoder::encode(float const*,float *,unsigned int)::$_0>,void ()(float *,unsigned int)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24F24B680;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<EchoCodeEncoder::encode(float const*,float *,unsigned int)::$_0,std::allocator<EchoCodeEncoder::encode(float const*,float *,unsigned int)::$_0>,void ()(float *,unsigned int)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24F24B680;
  a2[1] = v2;
  return result;
}

void std::__function::__func<EchoCodeEncoder::encode(float const*,float *,unsigned int)::$_0,std::allocator<EchoCodeEncoder::encode(float const*,float *,unsigned int)::$_0>,void ()(float *,unsigned int)>::operator()(uint64_t a1, float **a2, unsigned int *a3)
{
  float *v3;
  vDSP_Length v4;
  uint64_t v5;

  v3 = *a2;
  v4 = *a3;
  v5 = *(_QWORD *)(a1 + 8);
  Random::getSamples(*(Random **)(*(_QWORD *)(v5 + 72) + 112), *(float **)(v5 + 128), *a3);
  vDSP_vsma(*(const float **)(v5 + 128), 1, (const float *)(v5 + 52), v3, 1, v3, 1, v4);
}

uint64_t std::__function::__func<EchoCodeEncoder::encode(float const*,float *,unsigned int)::$_0,std::allocator<EchoCodeEncoder::encode(float const*,float *,unsigned int)::$_0>,void ()(float *,unsigned int)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<EchoCodeEncoder::encode(float const*,float *,unsigned int)::$_0,std::allocator<EchoCodeEncoder::encode(float const*,float *,unsigned int)::$_0>,void ()(float *,unsigned int)>::target_type()
{
}

void std::__function::__func<EchoCodeEncoder::evaluateCarrier(float const*,unsigned int,std::map<unsigned int,std::any> &)::$_0,std::allocator<EchoCodeEncoder::evaluateCarrier(float const*,unsigned int,std::map<unsigned int,std::any> &)::$_0>,void ()(float *,unsigned int)>::~__func()
{
  JUMPOUT(0x22E2CB548);
}

__n128 std::__function::__func<EchoCodeEncoder::evaluateCarrier(float const*,unsigned int,std::map<unsigned int,std::any> &)::$_0,std::allocator<EchoCodeEncoder::evaluateCarrier(float const*,unsigned int,std::map<unsigned int,std::any> &)::$_0>,void ()(float *,unsigned int)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x20uLL);
  *(_QWORD *)v2 = &off_24F24B710;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  *((_QWORD *)v2 + 3) = *(_QWORD *)(a1 + 24);
  return result;
}

__n128 std::__function::__func<EchoCodeEncoder::evaluateCarrier(float const*,unsigned int,std::map<unsigned int,std::any> &)::$_0,std::allocator<EchoCodeEncoder::evaluateCarrier(float const*,unsigned int,std::map<unsigned int,std::any> &)::$_0>,void ()(float *,unsigned int)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_24F24B710;
  result = *(__n128 *)(a1 + 8);
  *(_QWORD *)(a2 + 24) = *(_QWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void std::__function::__func<EchoCodeEncoder::evaluateCarrier(float const*,unsigned int,std::map<unsigned int,std::any> &)::$_0,std::allocator<EchoCodeEncoder::evaluateCarrier(float const*,unsigned int,std::map<unsigned int,std::any> &)::$_0>,void ()(float *,unsigned int)>::operator()(uint64_t a1, float **a2, unsigned int *a3)
{
  float *v4;
  vDSP_Length v5;

  v4 = *a2;
  v5 = *a3;
  Random::getSamples(*(Random **)(**(_QWORD **)(a1 + 8) + 112), **(float ***)(a1 + 16), *a3);
  vDSP_vsma(**(const float ***)(a1 + 16), 1, *(const float **)(a1 + 24), v4, 1, v4, 1, v5);
}

uint64_t std::__function::__func<EchoCodeEncoder::evaluateCarrier(float const*,unsigned int,std::map<unsigned int,std::any> &)::$_0,std::allocator<EchoCodeEncoder::evaluateCarrier(float const*,unsigned int,std::map<unsigned int,std::any> &)::$_0>,void ()(float *,unsigned int)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<EchoCodeEncoder::evaluateCarrier(float const*,unsigned int,std::map<unsigned int,std::any> &)::$_0,std::allocator<EchoCodeEncoder::evaluateCarrier(float const*,unsigned int,std::map<unsigned int,std::any> &)::$_0>,void ()(float *,unsigned int)>::target_type()
{
}

uint64_t (**std::any_cast[abi:ne180100]<BOOL>(uint64_t (**result)(uint64_t, _QWORD, _QWORD, _QWORD, void *)))(uint64_t, _QWORD, _QWORD, _QWORD, void *)
{
  if (result)
  {
    if (*result)
      return (uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(*result)(3, result, 0, MEMORY[0x24BEDB770], &std::__any_imp::__unique_typeinfo<BOOL>::__id);
    else
      return 0;
  }
  return result;
}

{
  if (result)
  {
    if (*result)
      return (uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(*result)(3, result, 0, MEMORY[0x24BEDB770], &std::__any_imp::__unique_typeinfo<BOOL>::__id);
    else
      return 0;
  }
  return result;
}

void mlsCodec::getSequence(_QWORD *a1, unsigned int a2, float a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  float v14;
  uint64_t v15;
  unint64_t v16;

  v16 = 0;
  SimpleMLS<20u>::Reset((uint64_t)&v16);
  std::vector<float>::resize((uint64_t)a1, a2 & 0xFFFFFFF0);
  if (a2 >= 0x10)
  {
    v6 = 0;
    v7 = 0;
    v8 = a2 >> 4;
    v9 = v16;
    do
    {
      v10 = v9;
      v11 = v9 ^ (v9 >> 3) & 1;
      std::bitset<20ul>::operator>>=[abi:ne180100]((uint64_t)&v16, 1uLL);
      v12 = 0;
      if ((v11 & 1) != 0)
        v13 = 0x80000;
      else
        v13 = 0;
      v9 = v13 | v16 & 0xFFFFFFFFFFF7FFFFLL;
      v16 = v9;
      if ((v10 & 1) != 0)
        v14 = a3;
      else
        v14 = -a3;
      v15 = *a1 + v6;
      do
      {
        *(float32x4_t *)(v15 + v12 * 16) = vmulq_n_f32((float32x4_t)mlsCodec::kGaussianPulse[v12], v14);
        ++v12;
      }
      while (v12 != 4);
      ++v7;
      v6 += 64;
    }
    while (v7 != v8);
  }
}

_QWORD *SimpleMLS<20u>::Reset(uint64_t a1)
{
  uint64_t v2;
  int v3;

  v2 = a1;
  v3 = 0;
  return std::__fill_n[abi:ne180100]<true,std::__bitset<1ul,20ul>>(&v2, 0x14uLL);
}

_QWORD *std::__fill_n[abi:ne180100]<true,std::__bitset<1ul,20ul>>(_QWORD *result, unint64_t a2)
{
  unint64_t v2;
  _QWORD *v3;
  int v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;

  v2 = a2;
  v3 = result;
  v4 = *((_DWORD *)result + 2);
  v5 = (_QWORD *)*result;
  if (v4)
  {
    if ((64 - v4) >= a2)
      v6 = a2;
    else
      v6 = (64 - v4);
    *v5++ |= (0xFFFFFFFFFFFFFFFFLL >> (64 - v4 - v6)) & (-1 << v4);
    v2 = a2 - v6;
    *result = v5;
  }
  v7 = v2 >> 6;
  if (v2 >= 0x40)
    result = memset(v5, 255, 8 * v7);
  if ((v2 & 0x3F) != 0)
  {
    v8 = &v5[v7];
    *v3 = v8;
    *v8 |= 0xFFFFFFFFFFFFFFFFLL >> -(v2 & 0x3F);
  }
  return result;
}

void std::__fill_n[abi:ne180100]<false,std::__bitset<1ul,20ul>>(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  int v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;

  v2 = a2;
  v4 = *(_DWORD *)(a1 + 8);
  v5 = *(_QWORD **)a1;
  if (v4)
  {
    if ((64 - v4) >= a2)
      v6 = a2;
    else
      v6 = (64 - v4);
    *v5++ &= ~((0xFFFFFFFFFFFFFFFFLL >> (64 - v4 - v6)) & (-1 << v4));
    v2 = a2 - v6;
    *(_QWORD *)a1 = v5;
  }
  v7 = v2 >> 6;
  if (v2 >= 0x40)
    bzero(v5, 8 * v7);
  if ((v2 & 0x3F) != 0)
  {
    v8 = &v5[v7];
    *(_QWORD *)a1 = v8;
    *v8 &= ~(0xFFFFFFFFFFFFFFFFLL >> -(v2 & 0x3F));
  }
}

uint64_t std::bitset<20ul>::operator>>=[abi:ne180100](uint64_t a1, unint64_t a2)
{
  unint64_t v3;
  _BYTE v5[16];
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;

  if (a2 >= 0x14)
    v3 = 20;
  else
    v3 = a2;
  if ((_DWORD)v3)
  {
    v10 = a1;
    v11 = v3;
    v8 = a1;
    v9 = 20;
    v6 = a1;
    v7 = 0;
    std::__copy_unaligned[abi:ne180100]<std::__bitset<1ul,20ul>,false>((unsigned int *)&v10, (uint64_t)&v8, (uint64_t)&v6, (uint64_t)v5);
    v16 = a1;
    v17 = 20 - v3;
    std::__fill_n[abi:ne180100]<false,std::__bitset<1ul,20ul>>((uint64_t)&v16, v3);
  }
  else
  {
    v16 = a1;
    v17 = 0;
    v14 = a1;
    v15 = 20;
    v12 = a1;
    v13 = 0;
    std::__copy_aligned[abi:ne180100]<std::__bitset<1ul,20ul>,false>(&v16, &v14, (uint64_t)&v12, (uint64_t)v5);
  }
  return a1;
}

_QWORD *std::__copy_aligned[abi:ne180100]<std::__bitset<1ul,20ul>,false>@<X0>(_QWORD *result@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t *v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;

  v7 = *a2;
  v8 = (_QWORD *)*result;
  v9 = *((unsigned int *)a2 + 2) + 8 * (v7 - *result);
  v10 = *((unsigned int *)result + 2);
  v11 = v9 - v10;
  if (v9 - v10 <= 0)
  {
    v19 = *(unint64_t **)a3;
  }
  else
  {
    v12 = result;
    if ((_DWORD)v10)
    {
      if (v11 >= (unint64_t)(64 - v10))
        v13 = (64 - v10);
      else
        v13 = v9 - v10;
      v11 -= v13;
      v14 = *(unint64_t **)a3;
      *v14 = **(_QWORD **)a3 & ~((0xFFFFFFFFFFFFFFFFLL >> (64 - v10 - v13)) & (-1 << v10)) | *v8 & (0xFFFFFFFFFFFFFFFFLL >> (64 - v10 - v13)) & (-1 << v10);
      v15 = v13 + *(unsigned int *)(a3 + 8);
      *(_QWORD *)a3 = (char *)v14 + ((v15 >> 3) & 0x3FFFFFF8);
      *(_DWORD *)(a3 + 8) = v15 & 0x3F;
      v8 = (_QWORD *)(*result + 8);
      *result = v8;
    }
    if (v11 >= 0)
      v16 = v11;
    else
      v16 = v11 + 63;
    v17 = v16 >> 6;
    if ((unint64_t)(v11 + 63) >= 0x7F)
      result = memmove(*(void **)a3, v8, 8 * v17);
    v18 = v11 - (v17 << 6);
    v19 = (unint64_t *)(*(_QWORD *)a3 + 8 * v17);
    *(_QWORD *)a3 = v19;
    if (v18 >= 1)
    {
      v20 = (_QWORD *)(*v12 + 8 * v17);
      *v12 = v20;
      v21 = 0xFFFFFFFFFFFFFFFFLL >> (((_BYTE)v17 << 6) - v11);
      v22 = *v20 & v21;
      v19 = *(unint64_t **)a3;
      **(_QWORD **)a3 = **(_QWORD **)a3 & ~v21 | v22;
      *(_DWORD *)(a3 + 8) = v18;
    }
  }
  *(_QWORD *)a4 = v19;
  *(_DWORD *)(a4 + 8) = *(_DWORD *)(a3 + 8);
  return result;
}

unsigned int *std::__copy_unaligned[abi:ne180100]<std::__bitset<1ul,20ul>,false>@<X0>(unsigned int *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  unint64_t v12;
  BOOL v13;
  BOOL v14;
  int v15;
  unint64_t v16;
  unint64_t *v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t *v20;
  unsigned int v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;

  v4 = *(unint64_t **)result;
  v5 = result[2];
  v6 = *(unsigned int *)(a2 + 8) + 8 * (*(_QWORD *)a2 - *(_QWORD *)result) - v5;
  if (v6 <= 0)
  {
    v20 = *(uint64_t **)a3;
    v18 = *(_DWORD *)(a3 + 8);
  }
  else
  {
    if ((_DWORD)v5)
    {
      if (v6 >= (unint64_t)(64 - v5))
        v7 = (64 - v5);
      else
        v7 = *(unsigned int *)(a2 + 8) + 8 * (*(_QWORD *)a2 - *(_QWORD *)result) - v5;
      v6 -= v7;
      v8 = (0xFFFFFFFFFFFFFFFFLL >> (64 - v5 - v7)) & (-1 << v5) & *v4;
      v9 = *(unsigned int *)(a3 + 8);
      if (v7 >= (64 - v9))
        v10 = (64 - v9);
      else
        v10 = v7;
      v11 = *(uint64_t **)a3;
      v12 = v8 >> (v5 - v9);
      v13 = v9 >= v5;
      v15 = v9 - v5;
      v14 = v15 != 0 && v13;
      v16 = v8 << v15;
      if (!v14)
        v16 = v12;
      *v11 = **(_QWORD **)a3 & ~((0xFFFFFFFFFFFFFFFFLL >> (64 - v9 - v10)) & (-1 << v9)) | v16;
      v17 = (unint64_t *)((char *)v11 + (((v10 + v9) >> 3) & 0x3FFFFFF8));
      *(_QWORD *)a3 = v17;
      v18 = ((_BYTE)v9 + (_BYTE)v10) & 0x3F;
      *(_DWORD *)(a3 + 8) = v18;
      v19 = v7 - v10;
      if (v19 >= 1)
      {
        *v17 = (v8 >> (v10 + result[2])) | *v17 & ~(0xFFFFFFFFFFFFFFFFLL >> -(char)v19);
        *(_DWORD *)(a3 + 8) = v19;
        v18 = v19;
      }
      v4 = (unint64_t *)(*(_QWORD *)result + 8);
      *(_QWORD *)result = v4;
    }
    else
    {
      v18 = *(_DWORD *)(a3 + 8);
    }
    v21 = 64 - v18;
    v22 = -1 << v18;
    if (v6 < 64)
    {
      v26 = v6;
    }
    else
    {
      do
      {
        v23 = *v4;
        v24 = *(uint64_t **)a3;
        *v24 = **(_QWORD **)a3 & ~v22 | (v23 << v18);
        v25 = v24[1];
        *(_QWORD *)a3 = ++v24;
        *v24 = v25 & v22 | (v23 >> v21);
        v26 = v6 - 64;
        v4 = (unint64_t *)(*(_QWORD *)result + 8);
        *(_QWORD *)result = v4;
        v14 = (unint64_t)v6 > 0x7F;
        v6 -= 64;
      }
      while (v14);
    }
    v20 = *(uint64_t **)a3;
    if (v26 >= 1)
    {
      v27 = *v4 & (0xFFFFFFFFFFFFFFFFLL >> -(char)v26);
      if (v26 >= (unint64_t)v21)
        v28 = 64 - v18;
      else
        v28 = v26;
      *v20 = *v20 & ~((0xFFFFFFFFFFFFFFFFLL >> (v21 - v28)) & v22) | (v27 << v18);
      v20 = (uint64_t *)((char *)v20 + (((v28 + (unint64_t)v18) >> 3) & 0x3FFFFFF8));
      *(_QWORD *)a3 = v20;
      v18 = ((_BYTE)v18 + (_BYTE)v28) & 0x3F;
      *(_DWORD *)(a3 + 8) = v18;
      if (v26 - v28 >= 1)
      {
        *v20 = *v20 & ~(0xFFFFFFFFFFFFFFFFLL >> (v28 - v26)) | (v27 >> v28);
        *(_DWORD *)(a3 + 8) = v26 - v28;
        v18 = v26 - v28;
      }
    }
  }
  *(_QWORD *)a4 = v20;
  *(_DWORD *)(a4 + 8) = v18;
  return result;
}

void sub_22958D4CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_22958D594(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_22958D630(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22958D7C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22958D898(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22958D934(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22958E574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32)
{
  void *v32;
  uint64_t v33;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);

  _Block_object_dispose((const void *)(v33 - 144), 8);
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

void sub_22958E6F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_22958E7A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_22958EB80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

void sub_22958F610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17)
{
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

void sub_22958F910(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22958F97C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22958FA7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_22958FCB0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t echoCodec::getFsIndex(echoCodec *this)
{
  unsigned int v1;

  if ((_DWORD)this == 48000)
    v1 = 1;
  else
    v1 = -1;
  if ((_DWORD)this == 44100)
    return 0;
  else
    return v1;
}

unsigned int echoCodec::getSRCFreeFrameSize(echoCodec *this, unsigned int a2)
{
  return vcvtps_u32_f32((float)((float)a2 / 48000.0) * (float)this);
}

BOOL echoCodec::getSyncType(echoCodec *this)
{
  return this > 0x6D;
}

BOOL ShapingFilter::initialize(uint64_t a1, int a2, int a3, unsigned int a4, char a5, float a6)
{
  unsigned int v6;
  float v10;
  BOOL v11;
  float v12;
  const double *v13;
  vDSP_biquad_SetupStruct *Setup;
  uint64_t v15;

  if (a3 == 48000)
    v6 = 1;
  else
    v6 = -1;
  if (a3 == 44100)
    v6 = 0;
  if ((v6 & 0x80000000) != 0)
    return 0;
  v10 = (float)(a6 / 1000.0) + 0.5;
  if (a6 > 20000.0)
    v10 = 20.5;
  v11 = a6 < 16000.0;
  v12 = 16.5;
  if (!v11)
    v12 = v10;
  if (a2)
  {
    if (a2 == 1)
    {
      v13 = (const double *)&ShapingFilter::mHPFCoef;
      if (a4)
        goto LABEL_14;
    }
    return 0;
  }
  v13 = (const double *)&ShapingFilter::mLPFCoef;
  if (!a4)
    return 0;
LABEL_14:
  Setup = vDSP_biquad_CreateSetup(&v13[75 * v6 - 240 + 15 * v12], 3uLL);
  std::unique_ptr<vDSP_biquad_SetupStruct,applesauce::raii::v1::detail::opaque_deletion_functor<vDSP_biquad_SetupStruct*,&(vDSP_biquad_DestroySetup)>>::reset[abi:ne180100]((vDSP_biquad_SetupStruct **)(a1 + 32), Setup);
  std::vector<std::vector<float>>::resize((uint64_t *)(a1 + 8), a4);
  v15 = 0;
  do
  {
    std::vector<float>::resize(*(_QWORD *)(a1 + 8) + v15, 8uLL);
    vDSP_vclr(*(float **)(*(_QWORD *)(a1 + 8) + v15), 1, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)(a1 + 8)) >> 3));
    v15 += 24;
  }
  while (24 * a4 != v15);
  *(_DWORD *)a1 = a4;
  *(_BYTE *)(a1 + 4) = a5;
  return *(_QWORD *)(a1 + 32) != 0;
}

uint64_t ShapingFilter::getCutOffFreqIndex(ShapingFilter *this, float a2)
{
  float v2;
  BOOL v3;
  float v4;

  v2 = (float)(a2 / 1000.0) + 0.5;
  if (a2 > 20000.0)
    v2 = 20.5;
  v3 = a2 < 16000.0;
  v4 = 16.5;
  if (!v3)
    v4 = v2;
  return v4 - 16;
}

void std::vector<std::vector<float>>::resize(uint64_t *a1, unint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  BOOL v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = a1[1];
  v4 = 0xAAAAAAAAAAAAAAABLL * ((v3 - *a1) >> 3);
  v5 = a2 >= v4;
  v6 = a2 - v4;
  if (v6 != 0 && v5)
  {
    std::vector<std::vector<float>>::__append(a1, v6);
  }
  else if (!v5)
  {
    v7 = *a1 + 24 * a2;
    if (v3 != v7)
    {
      v8 = a1[1];
      do
      {
        v10 = *(void **)(v8 - 24);
        v8 -= 24;
        v9 = v10;
        if (v10)
        {
          *(_QWORD *)(v3 - 16) = v9;
          operator delete(v9);
        }
        v3 = v8;
      }
      while (v8 != v7);
    }
    a1[1] = v7;
  }
}

void ShapingFilter::reset(ShapingFilter *this)
{
  uint64_t v1;
  uint64_t v2;
  float *v3;
  uint64_t v4;

  v1 = *((_QWORD *)this + 1);
  v2 = *((_QWORD *)this + 2);
  while (v1 != v2)
  {
    v3 = *(float **)v1;
    v4 = *(_QWORD *)(v1 + 8);
    v1 += 24;
    vDSP_vclr(v3, 1, (v4 - (uint64_t)v3) >> 2);
  }
}

void ShapingFilter::filter(ShapingFilter *this, const float *a2, float *a3, vDSP_Length __N)
{
  vDSP_Stride v4;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  vDSP_Length v11;
  uint64_t v12;
  uint64_t v13;

  if (*((_BYTE *)this + 4))
    v4 = *(unsigned int *)this;
  else
    v4 = 1;
  if (*(_DWORD *)this)
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = __N;
    if (*((_BYTE *)this + 4))
      v12 = 1;
    else
      v12 = __N;
    v13 = 4 * v12;
    do
    {
      vDSP_biquad(*((const vDSP_biquad_SetupStruct **)this + 4), *(float **)(*((_QWORD *)this + 1) + v9), (const float *)((char *)a2 + v8), v4, (float *)((char *)a3 + v8), v4, v11);
      ++v10;
      v9 += 24;
      v8 += v13;
    }
    while (v10 < *(unsigned int *)this);
  }
}

void ShapingFilter::filter(const vDSP_biquad_SetupStruct **this, const float *__X, float *__Y, vDSP_Length __N, unsigned int a5)
{
  vDSP_biquad(this[4], *((float **)this[1] + 3 * a5), __X, 1, __Y, 1, __N);
}

uint64_t APCConfigReader::loadParams(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  int v7;
  unsigned __int8 *v8;
  _DWORD *v9;
  _DWORD *v10;
  _DWORD *v11;
  _DWORD *v13;
  uint64_t v14;
  uint64_t (*v16[5])(uint64_t, _QWORD, _QWORD, _QWORD, void *);

  v16[4] = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))MEMORY[0x24BDAC8D0];
  v3 = -1431655765 * ((a2[1] - *a2) >> 3);
  v16[0] = 0;
  v16[1] = 0;
  if ((_DWORD)v3)
  {
    v5 = 0;
    v6 = 24 * v3;
    do
    {
      if (APCConfigReader::getParameter(a1, *(_DWORD *)(*a2 + v5), (unint64_t *)v16))
      {
        v7 = *(_DWORD *)(*a2 + v5 + 16);
        if (v7)
        {
          if (v7 == 1)
          {
            v9 = std::any_cast[abi:ne180100]<unsigned int>(v16);
            if (!v9)
              goto LABEL_27;
            **(_DWORD **)(*a2 + v5 + 8) = *v9;
          }
          else if (v7 == 5)
          {
            v8 = (unsigned __int8 *)std::any_cast[abi:ne180100]<BOOL>(v16);
            if (!v8)
              std::__throw_bad_any_cast[abi:ne180100]();
            **(_WORD **)(*a2 + v5 + 8) = *v8 | 0x100;
          }
        }
        else
        {
          v10 = std::any_cast[abi:ne180100]<float>(v16);
          if (!v10)
LABEL_27:
            std::__throw_bad_any_cast[abi:ne180100]();
          **(_DWORD **)(*a2 + v5 + 8) = *v10;
        }
      }
      v5 += 24;
    }
    while (v6 != v5);
  }
  if (APCConfigReader::getParameter(a1, 0, (unint64_t *)v16))
  {
    v11 = std::any_cast[abi:ne180100]<unsigned int>(v16);
    if (!v11)
      std::__throw_bad_any_cast[abi:ne180100]();
    if (*v11 != 44100 && *v11 != 48000)
      goto LABEL_25;
  }
  if (!APCConfigReader::getParameter(a1, 1u, (unint64_t *)v16))
    goto LABEL_24;
  v13 = std::any_cast[abi:ne180100]<unsigned int>(v16);
  if (!v13)
    std::__throw_bad_any_cast[abi:ne180100]();
  if (!*v13)
LABEL_25:
    v14 = 4294967289;
  else
LABEL_24:
    v14 = 0;
  std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v16);
  return v14;
}

void sub_2295902E8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))va);
  _Unwind_Resume(a1);
}

uint64_t APCConfigReader::getParameter(uint64_t a1, unsigned int a2, unint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  BOOL v6;
  uint64_t *v7;

  v3 = *(_QWORD *)(*(_QWORD *)a1 + 8);
  if (!v3)
    return 0;
  v4 = *(_QWORD *)a1 + 8;
  do
  {
    v5 = *(_DWORD *)(v3 + 32);
    v6 = v5 >= a2;
    if (v5 >= a2)
      v7 = (uint64_t *)v3;
    else
      v7 = (uint64_t *)(v3 + 8);
    if (v6)
      v4 = v3;
    v3 = *v7;
  }
  while (*v7);
  if (v4 == *(_QWORD *)a1 + 8 || *(_DWORD *)(v4 + 32) > a2)
    return 0;
  std::any::operator=[abi:ne180100](a3, (void (**)(uint64_t))(v4 + 40));
  return 1;
}

void BitCounter::initialize(BitCounter *this, int a2, int a3)
{
  unint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  *((_DWORD *)this + 1) = a2;
  if (a3)
  {
    v5 = *((_QWORD *)this + 3);
    v4 = (unint64_t *)((char *)this + 24);
    v6 = (8 * a2);
    v7 = *((_QWORD *)this + 4) - v5;
    if (v6 <= v7)
    {
      if (v6 < v7)
        *((_QWORD *)this + 4) = v5 + v6;
    }
    else
    {
      std::vector<signed char>::__append(v4, v6 - v7);
    }
  }
  *((_DWORD *)this + 4) = 0;
  *(_DWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
}

void BitCounter::reset(BitCounter *this, int a2)
{
  _BYTE *v3;
  _BYTE *v4;

  *((_DWORD *)this + 4) = 0;
  *(_DWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  v3 = (_BYTE *)*((_QWORD *)this + 3);
  v4 = (_BYTE *)*((_QWORD *)this + 4);
  if (v3 != v4 && a2 != 0)
  {
    *((_DWORD *)this + 12) = 0;
    if (v4 - v3 >= 1)
      bzero(v3, v4 - v3);
  }
}

uint64_t BitCounter::decodeBit(BitCounter *this)
{
  unsigned int v1;
  unsigned int v2;
  int v3;
  unsigned int v4;

  v1 = *((_DWORD *)this + 2);
  v2 = *((_DWORD *)this + 3);
  v3 = v1 - v2;
  if (v1 == v2)
    return -1;
  v4 = v1 <= v2 ? *((_DWORD *)this + 3) : *((_DWORD *)this + 2);
  if (v3 < 0)
    v3 = v2 - v1;
  if ((float)((float)v4 / (float)v3) >= 5.0)
    return -1;
  else
    return v1 <= v2;
}

uint64_t BitCounter::count(uint64_t this, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (a2)
    ++*(_DWORD *)(this + 12);
  else
    ++*(_DWORD *)(this + 8);
  *(_DWORD *)(this + 16) = 0;
  v2 = *(_QWORD *)(this + 24);
  v3 = *(_QWORD *)(this + 32);
  if (v2 != v3)
  {
    v4 = *(unsigned int *)(this + 48);
    if (v4 < (int)v3 - (int)v2)
    {
      *(_DWORD *)(this + 48) = v4 + 1;
      *(_BYTE *)(v2 + v4) = 2 * (a2 & 1) - 1;
    }
  }
  ++*(_DWORD *)this;
  return this;
}

uint64_t BitCounter::count(uint64_t this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(this + 24);
  v2 = *(_QWORD *)(this + 32);
  if (v1 != v2)
  {
    v3 = *(unsigned int *)(this + 48);
    if (v3 < (int)v2 - (int)v1)
    {
      *(_DWORD *)(this + 48) = v3 + 1;
      *(_BYTE *)(v1 + v3) = 0;
    }
  }
  ++*(_DWORD *)this;
  ++*(_DWORD *)(this + 16);
  return this;
}

void PayloadQueue::set(PayloadQueue *this, const unsigned __int8 *a2, int a3)
{
  void **v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  char *v12;
  unsigned __int8 v13;
  int v14;
  char v16;

  v6 = (void **)*((_QWORD *)this + 2);
  v7 = *((_QWORD *)this + 3);
  *((_QWORD *)this + 6) = 0;
  v8 = v7 - (_QWORD)v6;
  if (v8 >= 0x11)
  {
    do
    {
      operator delete(*v6);
      v9 = *((_QWORD *)this + 3);
      v6 = (void **)(*((_QWORD *)this + 2) + 8);
      *((_QWORD *)this + 2) = v6;
      v8 = v9 - (_QWORD)v6;
    }
    while (v8 > 0x10);
  }
  if (v8 >> 3 == 1)
  {
    v10 = 2048;
  }
  else
  {
    if (v8 >> 3 != 2)
      goto LABEL_8;
    v10 = 4096;
  }
  *((_QWORD *)this + 5) = v10;
LABEL_8:
  v11 = a3 - 1;
  if (v11 >= 0)
  {
    v12 = (char *)this + 8;
    do
    {
      v13 = a2[v11];
      v14 = 8;
      do
      {
        v16 = v13 & 1;
        std::deque<unsigned char>::push_front((uint64_t)v12, &v16);
        v13 >>= 1;
        --v14;
      }
      while (v14);
    }
    while (v11-- > 0);
  }
}

int64x2_t std::deque<unsigned char>::push_front(uint64_t a1, _BYTE *a2)
{
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  int64x2_t result;

  v4 = *(_QWORD *)(a1 + 32);
  if (!v4)
  {
    std::deque<unsigned char>::__add_front_capacity((void **)a1);
    v4 = *(_QWORD *)(a1 + 32);
  }
  v5 = *(_QWORD *)(a1 + 8);
  v6 = (_QWORD *)(v5 + 8 * (v4 >> 12));
  v7 = *v6 + (v4 & 0xFFF);
  if (*(_QWORD *)(a1 + 16) == v5)
    v7 = 0;
  if (v7 == *v6)
    v7 = *(v6 - 1) + 4096;
  *(_BYTE *)(v7 - 1) = *a2;
  result = vaddq_s64(*(int64x2_t *)(a1 + 32), (int64x2_t)xmmword_22959E0C0);
  *(int64x2_t *)(a1 + 32) = result;
  return result;
}

_QWORD *PayloadQueue::insertBit(PayloadQueue *this, unsigned int a2, char a3)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v10;

  v10 = a3;
  v4 = *((_QWORD *)this + 2);
  v5 = (char *)(v4 + 8 * (*((_QWORD *)this + 5) >> 12));
  if (*((_QWORD *)this + 3) == v4)
  {
    v6 = 0;
    if (!a2)
      return std::deque<unsigned char>::insert((int64x2_t *)((char *)this + 8), v5, v6, &v10);
  }
  else
  {
    v6 = *(_QWORD *)v5 + (*((_QWORD *)this + 5) & 0xFFFLL);
    if (!a2)
      return std::deque<unsigned char>::insert((int64x2_t *)((char *)this + 8), v5, v6, &v10);
  }
  v7 = v6 - *(_QWORD *)v5 + a2;
  if (v7 < 1)
  {
    v8 = 4095 - v7;
    v5 -= 8 * (v8 >> 12);
    v6 = *(_QWORD *)v5 + (~(_WORD)v8 & 0xFFF);
  }
  else
  {
    v5 += 8 * ((unint64_t)v7 >> 12);
    v6 = *(_QWORD *)v5 + (v7 & 0xFFF);
  }
  return std::deque<unsigned char>::insert((int64x2_t *)((char *)this + 8), v5, v6, &v10);
}

_QWORD *std::deque<unsigned char>::insert(int64x2_t *a1, char *a2, uint64_t a3, char *a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  char *v39;
  char *v40;
  char v41;
  unint64_t v42;
  char *v43;
  char *v44;
  char *v45;
  uint64_t v46;
  char *v47;
  char *v49;
  char *v50;
  char *v51;

  v6 = a1[2].u64[0];
  v7 = a1->i64[1];
  v8 = a1[1].i64[0];
  v9 = (char *)(v7 + 8 * (v6 >> 12));
  if (v8 == v7)
    v10 = 0;
  else
    v10 = *(_QWORD *)v9 + (a1[2].i64[0] & 0xFFF);
  if (a3 == v10)
    v11 = 0;
  else
    v11 = a3 + ((a2 - v9) << 9) - (v10 + *(_QWORD *)a2) + *(_QWORD *)v9;
  v12 = a1[2].i64[1];
  v13 = v12 - v11;
  if (v11 >= v12 - v11)
  {
    if (v8 == v7)
      v20 = 0;
    else
      v20 = ((v8 - v7) << 9) - 1;
    if (v20 == v12 + v6)
    {
      std::deque<unsigned char>::__add_back_capacity(a1);
      v12 = a1[2].i64[1];
      v13 = v12 - v11;
    }
    if (v12 == v11)
    {
      *(_BYTE *)(*(_QWORD *)(a1->i64[1] + (((a1[2].i64[0] + v11) >> 9) & 0x7FFFFFFFFFFFF8))
               + ((a1[2].i64[0] + v11) & 0xFFF)) = *a4;
      ++a1[2].i64[1];
    }
    else
    {
      v51 = a4;
      v21 = a1[2].i64[0] + v12;
      v22 = a1->i64[1];
      v23 = (char *)(v22 + 8 * (v21 >> 12));
      v24 = *(_QWORD *)v23;
      v25 = (char *)(*(_QWORD *)v23 + (v21 & 0xFFF));
      if (a1[1].i64[0] == v22)
        v25 = 0;
      v49 = v23;
      v50 = v25;
      v26 = (uint64_t)&v25[~v24];
      if (v26 < 1)
      {
        v37 = 4095 - v26;
        v27 = &v23[-8 * (v37 >> 12)];
        v28 = (char *)(*(_QWORD *)v27 + (~(_WORD)v37 & 0xFFF));
      }
      else
      {
        v27 = &v23[8 * ((unint64_t)v26 >> 12)];
        v28 = (char *)(*(_QWORD *)v27 + (v26 & 0xFFF));
      }
      if (v28 == a4)
      {
        v51 = v25;
        a4 = v25;
      }
      *v25 = *v28;
      ++a1[2].i64[1];
      if (v13 >= 2)
      {
        v38 = (char *)std::__deque_iterator<unsigned char,unsigned char *,unsigned char &,unsigned char **,long,4096l>::operator-[abi:ne180100]((uint64_t)&v49, v13);
        v23 = std::deque<unsigned char>::__move_backward_and_check((uint64_t)a1, v38, v39, v27, v28, v49, v50, (unint64_t *)&v51);
        v25 = v40;
        v49 = v23;
        v50 = v40;
        a4 = v51;
      }
      v41 = *a4;
      if (v25 == *(char **)v23)
      {
        v49 = v23 - 8;
        v25 = (char *)(*((_QWORD *)v23 - 1) + 4096);
      }
      *(v25 - 1) = v41;
    }
  }
  else
  {
    if (v6)
    {
      if (v11)
      {
LABEL_10:
        v51 = a4;
        v14 = a1->i64[1];
        v15 = (uint64_t *)(v14 + 8 * ((unint64_t)a1[2].i64[0] >> 12));
        v16 = *v15;
        if (a1[1].i64[0] == v14)
          v17 = 0;
        else
          v17 = (char *)(*v15 + (a1[2].i64[0] & 0xFFF));
        v49 = (char *)(v14 + 8 * ((unint64_t)a1[2].i64[0] >> 12));
        v50 = v17;
        v18 = (uint64_t)&v17[~v16];
        if (v18 < 1)
          v19 = (char *)(v15[-((unint64_t)(4095 - v18) >> 12)] + (~(4095 - (_WORD)v18) & 0xFFF));
        else
          v19 = (char *)(*(uint64_t *)((char *)v15 + (((unint64_t)v18 >> 9) & 0x7FFFFFFFFFFFF8)) + (v18 & 0xFFF));
        if (v17 == a4)
        {
          v51 = v19;
          a4 = v19;
        }
        *v19 = *v17;
        a1[2] = vaddq_s64(a1[2], (int64x2_t)xmmword_22959E0C0);
        if (v11 >= 2)
        {
          v32 = (uint64_t)&v17[-*v15];
          if (v32 < 0)
          {
            v42 = 4094 - v32;
            v34 = (char *)&v15[-(v42 >> 12)];
            v35 = *(_QWORD *)v34;
            v36 = ~(_DWORD)v42 & 0xFFFLL;
          }
          else
          {
            v33 = v32 + 1;
            v34 = (char *)&v15[v33 >> 12];
            v35 = *(_QWORD *)v34;
            v36 = v33 & 0xFFF;
          }
          v43 = (char *)(v35 + v36);
          v44 = (char *)std::__deque_iterator<unsigned char,unsigned char *,unsigned char &,unsigned char **,long,4096l>::operator+[abi:ne180100]((uint64_t)&v49, v11);
          v49 = (char *)std::deque<unsigned char>::__move_and_check((int)a1, v34, v43, v44, v45, (void **)v49, v50, (unint64_t *)&v51);
          v50 = v17;
          a4 = v51;
        }
        *v17 = *a4;
        goto LABEL_49;
      }
    }
    else
    {
      std::deque<unsigned char>::__add_front_capacity((void **)a1);
      if (v11)
        goto LABEL_10;
    }
    v29 = a1->i64[1];
    v30 = (_QWORD *)(v29 + 8 * ((unint64_t)a1[2].i64[0] >> 12));
    v31 = *v30 + (a1[2].i64[0] & 0xFFF);
    if (a1[1].i64[0] == v29)
      v31 = 0;
    if (v31 == *v30)
      v31 = *(v30 - 1) + 4096;
    *(_BYTE *)(v31 - 1) = *a4;
    a1[2] = vaddq_s64(a1[2], (int64x2_t)xmmword_22959E0C0);
  }
LABEL_49:
  v46 = a1->i64[1];
  if (a1[1].i64[0] == v46)
    v47 = 0;
  else
    v47 = (char *)(*(_QWORD *)(v46 + 8 * ((unint64_t)a1[2].i64[0] >> 12)) + (a1[2].i64[0] & 0xFFF));
  v49 = (char *)(v46 + 8 * ((unint64_t)a1[2].i64[0] >> 12));
  v50 = v47;
  return std::__deque_iterator<unsigned char,unsigned char *,unsigned char &,unsigned char **,long,4096l>::operator+[abi:ne180100]((uint64_t)&v49, v11);
}

void Random::Random(Random *this)
{
  int rep;
  unsigned int v3;
  unsigned int v4;

  *(_QWORD *)this = 0x100000000;
  *((_QWORD *)this + 1) = 0x3F80000000000000;
  *((_BYTE *)this + 20) = 0;
  rep = std::chrono::system_clock::now().__d_.__rep_;
  if (rep >= 0)
    v3 = rep;
  else
    v3 = -rep;
  v4 = v3 - 0x7FFFFFFF;
  if (v3 < 0x7FFFFFFF)
    v4 = v3;
  if (v4 <= 1)
    v4 = 1;
  *(_DWORD *)this = v3;
  *((_DWORD *)this + 1) = v4;
  *((_QWORD *)this + 1) = 0x3F80000000000000;
  *((_BYTE *)this + 20) = 0;
}

BOOL Random::setSeed(Random *this, unsigned int a2)
{
  unsigned int v2;

  if (a2)
  {
    v2 = a2 + ((a2 / 0x7FFFFFFF) | ((a2 / 0x7FFFFFFF) << 31));
    if (v2 <= 1)
      v2 = 1;
    *(_DWORD *)this = a2;
    *((_DWORD *)this + 1) = v2;
  }
  return a2 != 0;
}

_DWORD *Random::reset(_DWORD *this)
{
  unsigned int v1;

  v1 = *this + ((*this / 0x7FFFFFFFu) | ((*this / 0x7FFFFFFFu) << 31));
  if (v1 <= 1)
    v1 = 1;
  this[1] = v1;
  return this;
}

void Random::getSamples(Random *this, float *a2, unsigned int a3)
{
  float *v4;
  unsigned int *v5;
  uint64_t v6;

  if (a3)
  {
    v4 = (float *)((char *)this + 8);
    v5 = (unsigned int *)((char *)this + 4);
    v6 = a3;
    do
    {
      *a2++ = std::normal_distribution<float>::operator()<std::linear_congruential_engine<unsigned int,48271u,0u,2147483647u>>((uint64_t)v4, v5, v4);
      --v6;
    }
    while (v6);
  }
}

uint64_t Random::instance(Random *this)
{
  unsigned __int8 v1;
  Random *v3;
  uint64_t v4;

  {
    v3 = (Random *)operator new();
    Random::Random(v3);
    Random::instance(void)::sInstance = v4;
  }
  return Random::instance(void)::sInstance;
}

void sub_229590C80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void EchoEmbedder::initialize(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7;
  float *v8;
  float *v9;
  float *v10;
  _WORD *v11;
  _QWORD *v12;
  uint64_t v13;
  unsigned int v14;
  _QWORD *v15;
  unsigned int v16;
  BOOL v17;
  uint64_t *v18;
  int v19;
  _DWORD *v20;
  unsigned __int8 *v21;
  _DWORD *v22;
  uint32x2_t *v23;
  uint32x2_t *v24;
  uint32x2_t *v25;
  unsigned __int32 v26;
  uint32x2_t *v27;
  unsigned __int32 v28;
  unsigned __int32 v29;
  BOOL v30;
  __int32 v31;
  _DWORD *v32;
  unsigned int v33;
  unsigned int v34;
  _QWORD v35[14];
  float32x2_t v36[2];

  v7 = 0;
  v36[1] = *(float32x2_t *)MEMORY[0x24BDAC8D0];
  v34 = 0;
  v36[0] = 0;
  v35[0] = 102;
  v8 = (float *)(a1 + 24);
  v35[1] = a1 + 24;
  v35[2] = 103;
  v9 = (float *)(a1 + 28);
  v35[3] = a1 + 28;
  v35[4] = 105;
  v35[5] = v36;
  v35[6] = 106;
  v35[7] = (char *)v36 + 4;
  v35[8] = 0x10000006ELL;
  v35[9] = &v34;
  v35[10] = 111;
  v10 = (float *)(a1 + 20);
  v35[11] = a1 + 20;
  v35[12] = 0x500000070;
  v11 = (_WORD *)(a1 + 32);
  v12 = (_QWORD *)(a4 + 8);
  v35[13] = a1 + 32;
  do
  {
    v13 = *v12;
    if (*v12)
    {
      v14 = v35[2 * v7];
      v15 = v12;
      do
      {
        v16 = *(_DWORD *)(v13 + 32);
        v17 = v16 >= v14;
        if (v16 >= v14)
          v18 = (uint64_t *)v13;
        else
          v18 = (uint64_t *)(v13 + 8);
        if (v17)
          v15 = (_QWORD *)v13;
        v13 = *v18;
      }
      while (*v18);
      if (v15 != v12 && v14 >= *((_DWORD *)v15 + 8))
      {
        v19 = HIDWORD(v35[2 * v7]);
        switch(v19)
        {
          case 5:
            v21 = (unsigned __int8 *)std::any_cast[abi:ne180100]<BOOL const>((uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))v15 + 5);
            if (!v21)
              goto LABEL_51;
            *(_WORD *)v35[2 * v7 + 1] = *v21 | 0x100;
            break;
          case 1:
            v22 = std::any_cast[abi:ne180100]<unsigned int const>((uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))v15 + 5);
            if (!v22)
LABEL_51:
              std::__throw_bad_any_cast[abi:ne180100]();
            *(_DWORD *)v35[2 * v7 + 1] = *v22;
            break;
          case 0:
            v20 = std::any_cast[abi:ne180100]<float const>((uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))v15 + 5);
            if (!v20)
              goto LABEL_51;
            *(_DWORD *)v35[2 * v7 + 1] = *v20;
            break;
        }
      }
    }
    ++v7;
  }
  while (v7 != 7);
  if (*v8 == 0.0)
    *v8 = 1.0;
  if (*v9 == 0.0)
    *v9 = 0.01;
  if (v36[0].f32[0] == 0.0)
    v36[0].i32[0] = 990057071;
  if (v36[0].f32[1] == 0.0)
    v36[0].i32[1] = 1006834287;
  if (*v10 == 0.0)
    *v10 = 18000.0;
  std::vector<unsigned int>::resize((std::vector<int> *)(a1 + 40), 2uLL);
  v23 = *(uint32x2_t **)(a1 + 40);
  *v23 = vcvt_u32_f32(vmul_n_f32(v36[0], (float)a2));
  v24 = (uint32x2_t *)((char *)v23 + 4);
  *(_DWORD *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 12) = a3;
  *(_DWORD *)(a1 + 16) = 0;
  if (!*(_BYTE *)(a1 + 33))
    *v11 = 257;
  v25 = *(uint32x2_t **)(a1 + 48);
  if (v23 != v25 && v24 != v25)
  {
    v26 = v23->i32[0];
    v27 = (uint32x2_t *)((char *)v23 + 4);
    do
    {
      v29 = v27->i32[0];
      v27 = (uint32x2_t *)((char *)v27 + 4);
      v28 = v29;
      v30 = v26 >= v29;
      if (v26 <= v29)
        v26 = v28;
      if (!v30)
        v23 = v24;
      v24 = v27;
    }
    while (v27 != v25);
  }
  v31 = v23->i32[0];
  std::vector<float>::resize(a1 + 64, a3);
  std::vector<float>::resize(a1 + 88, (*(_DWORD *)(a1 + 12) + v31));
  v32 = *(_DWORD **)(a1 + 112);
  if (v34)
  {
    v33 = v34 + ((v34 / 0x7FFFFFFF) | ((v34 / 0x7FFFFFFF) << 31));
    if (v33 <= 1)
      v33 = 1;
    *v32 = v34;
    v32[1] = v33;
  }
  else
  {
    v33 = *v32 + ((*v32 / 0x7FFFFFFFu) | ((*v32 / 0x7FFFFFFFu) << 31));
    if (v33 <= 1)
      v33 = 1;
  }
  v32[1] = v33;
}

void std::vector<unsigned int>::resize(std::vector<int> *this, std::vector<int>::size_type __sz)
{
  std::vector<int>::size_type v2;

  v2 = this->__end_ - this->__begin_;
  if (__sz <= v2)
  {
    if (__sz < v2)
      this->__end_ = &this->__begin_[__sz];
  }
  else
  {
    std::vector<unsigned int>::__append(this, __sz - v2);
  }
}

uint64_t EchoEmbedder::reset(uint64_t this)
{
  _DWORD *v1;
  unsigned int v2;

  *(_DWORD *)(this + 16) = 0;
  v1 = *(_DWORD **)(this + 112);
  v2 = *v1 + ((*v1 / 0x7FFFFFFFu) | ((*v1 / 0x7FFFFFFFu) << 31));
  if (v2 <= 1)
    v2 = 1;
  v1[1] = v2;
  *(_DWORD *)(this + 120) = 0;
  return this;
}

uint64_t EchoEmbedder::encodeEcho(EchoEmbedder *this, float *__C, vDSP_Length __N)
{
  uint64_t v3;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  float *v11;
  unsigned int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  float *v16;
  unsigned int *v17;
  vDSP_Length v18;
  int v19;
  unsigned int v20;
  unsigned int v21;
  int v22;
  uint64_t v23;

  LODWORD(v3) = __N;
  if ((int)__N >= 1 && *((_DWORD *)this + 30) < *((_DWORD *)this + 42))
  {
    v6 = *((_DWORD *)this + 4);
    while (1)
    {
      if (v6)
      {
        v7 = *((_DWORD *)this + 3);
      }
      else
      {
        v8 = *((unsigned int *)this + 30);
        if (v8 >= *((_DWORD *)this + 42))
          v9 = 0;
        else
          v9 = *(unsigned __int8 *)(*(_QWORD *)(*((_QWORD *)this + 17)
                                              + (((unint64_t)(*((_QWORD *)this + 20) + v8) >> 9) & 0x7FFFFFFFFFFFF8))
                                  + ((*((_QWORD *)this + 20) + v8) & 0xFFF));
        v10 = *((_QWORD *)this + 5);
        if (v9 >= (*((_QWORD *)this + 6) - v10) >> 2)
          return 0;
        v11 = (float *)*((_QWORD *)this + 11);
        v12 = *((_DWORD *)this + 3);
        v13 = *(_DWORD *)(v10 + 4 * v9);
        v14 = v13 + v12;
        if (v13 + v12)
        {
          v15 = *((_QWORD *)this + 14);
          v16 = (float *)(v15 + 8);
          v17 = (unsigned int *)(v15 + 4);
          do
          {
            *v11++ = std::normal_distribution<float>::operator()<std::linear_congruential_engine<unsigned int,48271u,0u,2147483647u>>((uint64_t)v16, v17, v16);
            --v14;
          }
          while (v14);
          v11 = (float *)*((_QWORD *)this + 11);
          v13 = *(_DWORD *)(*((_QWORD *)this + 5) + 4 * v9);
          v12 = *((_DWORD *)this + 3);
        }
        vDSP_vsma(v11, 1, (const float *)this + 6, &v11[v13], 1, *((float **)this + 8), 1, v12);
        v7 = *((_DWORD *)this + 3);
        *((_DWORD *)this + 4) = v7;
        v6 = v7;
      }
      if (v3 >= v6)
        v18 = v6;
      else
        v18 = v3;
      vDSP_vsmul((const float *)(*((_QWORD *)this + 8) + 4 * (v7 - v6)), 1, (const float *)this + 7, __C, 1, v18);
      LODWORD(v3) = v3 - v18;
      __C += v18;
      v6 = *((_DWORD *)this + 4) - v18;
      *((_DWORD *)this + 4) = v6;
      if (v6)
      {
        if ((int)v3 <= 0)
          return 1;
      }
      else
      {
        v19 = *((_DWORD *)this + 30);
        v20 = v19 + 1;
        v21 = *((_DWORD *)this + 42);
        if (v19 + 1 < v21)
          v22 = v19 + 1;
        else
          v22 = *((_DWORD *)this + 42);
        *((_DWORD *)this + 30) = v22;
        if (v20 >= v21 || (int)v3 <= 0)
          break;
      }
    }
  }
  if ((int)v3 >= 1)
  {
    if (!*((_BYTE *)this + 33) || !*((_BYTE *)this + 32))
    {
      v23 = 1;
      vDSP_vclr(__C, 1, v3);
      return v23;
    }
    v3 = v3;
    do
    {
      *__C++ = std::normal_distribution<float>::operator()<std::linear_congruential_engine<unsigned int,48271u,0u,2147483647u>>(*((_QWORD *)this + 14) + 8, (unsigned int *)(*((_QWORD *)this + 14) + 4), (float *)(*((_QWORD *)this + 14) + 8))* *((float *)this + 7);
      --v3;
    }
    while (v3);
  }
  return 1;
}

void SyncedEchoEmbedder::initialize(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unsigned int *v6;
  void **v7;
  float v8;
  unsigned int v9;
  unsigned int *v10;
  unsigned int *v11;
  unsigned int *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  unsigned int *v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int *v21;
  unsigned int *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  unsigned int *v28;
  char *v29;
  unsigned int v30;
  unsigned int *v31;
  unsigned int *v32;
  unsigned int v34;
  unsigned int *v35;
  unsigned int v36;
  unsigned int v37;
  BOOL v38;

  EchoEmbedder::initialize(a1, a2, a3, a4);
  v6 = *(unsigned int **)(a1 + 56);
  v7 = (void **)(a1 + 40);
  v8 = (float)a2;
  v9 = (float)((float)a2 * 0.005);
  v10 = *(unsigned int **)(a1 + 48);
  if (v10 >= v6)
  {
    v12 = (unsigned int *)*v7;
    v13 = ((char *)v10 - (_BYTE *)*v7) >> 2;
    v14 = v13 + 1;
    if ((unint64_t)(v13 + 1) >> 62)
      goto LABEL_44;
    v15 = (char *)v6 - (char *)v12;
    if (v15 >> 1 > v14)
      v14 = v15 >> 1;
    if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFFCLL)
      v16 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v16 = v14;
    if (v16)
    {
      v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(a1 + 56, v16);
      v12 = *(unsigned int **)(a1 + 40);
      v10 = *(unsigned int **)(a1 + 48);
    }
    else
    {
      v17 = 0;
    }
    v18 = (unsigned int *)&v17[4 * v13];
    v6 = (unsigned int *)&v17[4 * v16];
    *v18 = v9;
    v11 = v18 + 1;
    while (v10 != v12)
    {
      v19 = *--v10;
      *--v18 = v19;
    }
    *(_QWORD *)(a1 + 40) = v18;
    *(_QWORD *)(a1 + 48) = v11;
    *(_QWORD *)(a1 + 56) = v6;
    if (v12)
    {
      operator delete(v12);
      v6 = *(unsigned int **)(a1 + 56);
    }
  }
  else
  {
    *v10 = v9;
    v11 = v10 + 1;
  }
  *(_QWORD *)(a1 + 48) = v11;
  v20 = (float)(v8 * 0.01);
  if (v11 < v6)
  {
    *v11 = v20;
    v21 = v11 + 1;
    goto LABEL_33;
  }
  v22 = (unsigned int *)*v7;
  v23 = ((char *)v11 - (_BYTE *)*v7) >> 2;
  v24 = v23 + 1;
  if ((unint64_t)(v23 + 1) >> 62)
LABEL_44:
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  v25 = (char *)v6 - (char *)v22;
  if (v25 >> 1 > v24)
    v24 = v25 >> 1;
  if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFFCLL)
    v26 = 0x3FFFFFFFFFFFFFFFLL;
  else
    v26 = v24;
  if (v26)
  {
    v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(a1 + 56, v26);
    v22 = *(unsigned int **)(a1 + 40);
    v11 = *(unsigned int **)(a1 + 48);
  }
  else
  {
    v27 = 0;
  }
  v28 = (unsigned int *)&v27[4 * v23];
  v29 = &v27[4 * v26];
  *v28 = v20;
  v21 = v28 + 1;
  while (v11 != v22)
  {
    v30 = *--v11;
    *--v28 = v30;
  }
  *(_QWORD *)(a1 + 40) = v28;
  *(_QWORD *)(a1 + 48) = v21;
  *(_QWORD *)(a1 + 56) = v29;
  if (v22)
    operator delete(v22);
LABEL_33:
  *(_QWORD *)(a1 + 48) = v21;
  v31 = *(unsigned int **)(a1 + 40);
  v32 = v31 + 1;
  if (v31 != v21 && v32 != v21)
  {
    v34 = *v31;
    v35 = v31 + 1;
    do
    {
      v37 = *v35++;
      v36 = v37;
      v38 = v34 >= v37;
      if (v34 <= v37)
        v34 = v36;
      if (!v38)
        v31 = v32;
      v32 = v35;
    }
    while (v35 != v21);
  }
  std::vector<float>::resize(a1 + 88, *(_DWORD *)(a1 + 12) + *v31);
}

_QWORD *SyncedEchoEmbedder::setPayload(SyncedEchoEmbedder *this, const unsigned __int8 *a2, int a3)
{
  unsigned int v3;
  PayloadQueue *v4;
  uint64_t i;
  _QWORD *result;
  _BYTE v7[2];

  v3 = (*((_DWORD *)this + 12) - *((_DWORD *)this + 10)) >> 2;
  v7[0] = v3 - 2;
  v7[1] = v3 - 1;
  v4 = (SyncedEchoEmbedder *)((char *)this + 120);
  PayloadQueue::set((SyncedEchoEmbedder *)((char *)this + 120), a2, a3);
  for (i = 0; i != 8; ++i)
    result = PayloadQueue::insertBit(v4, i, v7[kSyncEchoBitData[i]]);
  return result;
}

void EchoEmbedder::setPayload(EchoEmbedder *this, const unsigned __int8 *a2, int a3)
{
  PayloadQueue::set((EchoEmbedder *)((char *)this + 120), a2, a3);
}

void EchoDetector::EchoDetector(EchoDetector *this)
{
  int v2;

  *(_DWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_DWORD *)this + 4) = 0;
  v2 = 0;
  std::vector<float>::vector((_QWORD *)this + 3, 2uLL, &v2);
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 3) = 0u;
}

void sub_22959156C(_Unwind_Exception *a1)
{
  OpaqueFFTSetup **v1;

  std::unique_ptr<OpaqueFFTSetup,applesauce::raii::v1::detail::opaque_deletion_functor<OpaqueFFTSetup*,&(vDSP_destroy_fftsetup)>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

void EchoDetector::initialize(EchoDetector *this, unsigned int a2, int a3, const float *a4)
{
  vDSP_Length v8;
  _BYTE *v9;
  _BYTE *v10;
  OpaqueFFTSetup *fftsetup;

  v8 = (ceil(log((double)a2) / 0.693147182) + 0.5);
  *(_DWORD *)this = a3;
  *((_DWORD *)this + 4) = a2;
  std::vector<float>::resize((uint64_t)this + 48, 1 << (v8 + 1));
  std::vector<float>::resize((uint64_t)this + 72, 1 << (v8 - 1));
  v9 = (_BYTE *)*((_QWORD *)this + 3);
  v10 = (_BYTE *)*((_QWORD *)this + 4);
  if (v10 != v9)
    memmove(v9, a4, v10 - v9);
  fftsetup = vDSP_create_fftsetup(v8, 0);
  std::unique_ptr<OpaqueFFTSetup,applesauce::raii::v1::detail::opaque_deletion_functor<OpaqueFFTSetup*,&(vDSP_destroy_fftsetup)>>::reset[abi:ne180100]((OpaqueFFTSetup **)this + 1, fftsetup);
}

uint64_t EchoDetector::decodeEcho(EchoDetector *this, const float *a2, unsigned int a3, _BOOL4 *a4, int a5)
{
  float v7;
  unsigned int v8;
  unint64_t v9;
  unint64_t v10;
  float v11;
  unsigned int v12;
  uint64_t v13;
  float v14;
  unsigned int v15;
  char v16;
  char v17;
  __int32 v18;
  unsigned __int32 v19;
  uint64_t v20;
  float v21;
  float *v22;
  uint64_t v23;
  float v24;
  float v25;
  float v26;
  _BOOL4 v27;
  uint32x2_t v29;
  uint32x2_t v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  if (*((_DWORD *)this + 4) > a3)
    return 0;
  v29 = vcvt_u32_f32(vrndm_f32(vmul_n_f32(*(float32x2_t *)(*((_QWORD *)this + 3) + 4 * (2 * a5)), (float)*(unsigned int *)this)));
  EchoDetector::autoCepstrum(this, a2, a3);
  v7 = (float)*(unsigned int *)this;
  v8 = (float)((float)(v7 * 0.5) / 1000.0);
  v9 = v29.i32[0] - v8;
  v10 = v29.i32[1] + v8;
  v11 = 0.0;
  v12 = v10 - v9;
  if (v10 > v9)
  {
    do
    {
      v11 = v11 + (float)(*(float *)(*((_QWORD *)this + 9) + 4 * v9) * *(float *)(*((_QWORD *)this + 9) + 4 * v9));
      ++v9;
    }
    while (v9 < v10);
  }
  v13 = 0;
  v14 = sqrtf(v11 / (float)v12);
  v31 = 0;
  v32[0] = 0;
  v15 = (float)((float)(v7 * 0.125) / 1000.0);
  v30 = v29;
  v16 = 1;
  do
  {
    v17 = v16;
    v18 = v30.i32[v13];
    v19 = v18 - v15;
    v20 = v18 + v15;
    *((_DWORD *)v32 + v13) = 0;
    v21 = 0.0;
    if (v18 - v15 < v20)
    {
      v22 = (float *)(*((_QWORD *)this + 9) + 4 * v19);
      v23 = v20 - v19;
      do
      {
        v24 = *v22++;
        v25 = v24;
        if (v24 >= v21)
          v21 = v25;
        --v23;
      }
      while (v23);
      *((float *)v32 + v13) = v21;
    }
    v26 = log10f(v21 / v14);
    v16 = 0;
    *((float *)&v32[-1] + v13) = v26 * 20.0;
    v13 = 1;
  }
  while ((v17 & 1) != 0);
  if (*(float *)&v31 > 12.0)
  {
    v27 = *((float *)&v31 + 1) > 12.0 && *(float *)v32 <= *((float *)v32 + 1);
    goto LABEL_19;
  }
  if (*((float *)&v31 + 1) <= 12.0)
    return 0;
  v27 = 1;
LABEL_19:
  *a4 = v27;
  return 1;
}

float EchoDetector::autoCepstrum(EchoDetector *this, const float *a2, unsigned int a3)
{
  void *v4;
  char *v5;
  unint64_t v6;
  unint64_t v7;
  vDSP_Length v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  float *v13;
  unint64_t v14;
  float result;
  float *v16;
  float *v17;
  uint64_t v18;
  float *v19;
  float v20;
  DSPSplitComplex v21;

  v5 = (char *)this + 48;
  v4 = (void *)*((_QWORD *)this + 6);
  v6 = (uint64_t)(*((_QWORD *)v5 + 1) - (_QWORD)v4) >> 2;
  v7 = v6 >> 1;
  v8 = 32 - __clz((v6 >> 1) - 1);
  v9 = a3;
  if (a3)
  {
    memmove(v4, a2, 4 * a3);
    v4 = (void *)*((_QWORD *)this + 6);
    v10 = (uint64_t)(*((_QWORD *)this + 7) - (_QWORD)v4) >> 2;
  }
  else
  {
    v10 = v6;
  }
  vDSP_vclr((float *)v4 + v9, 1, v10 - v9);
  v21.realp = (float *)*((_QWORD *)this + 6);
  v21.imagp = &v21.realp[v7];
  vDSP_fft_zip(*((FFTSetup *)this + 1), &v21, 1, v8, 1);
  v11 = *((_QWORD *)this + 6);
  if ((_DWORD)v7)
  {
    v12 = (v6 >> 1);
    v13 = (float *)*((_QWORD *)this + 6);
    v14 = v6 >> 1;
    do
    {
      *v13 = logf((float)(*(float *)(v11 + 4 * v14) * *(float *)(v11 + 4 * v14))+ (float)(*v13 * *v13));
      ++v13;
      LODWORD(v14) = v14 + 1;
      --v12;
    }
    while (v12);
  }
  vDSP_vclr((float *)(v11 + 4 * (v6 >> 1)), 1, (v6 >> 1));
  vDSP_fft_zip(*((FFTSetup *)this + 1), &v21, 1, v8, -1);
  if (v7 >= 2)
  {
    v16 = (float *)*((_QWORD *)this + 6);
    v17 = (float *)*((_QWORD *)this + 9);
    v18 = (v6 >> 2) & 0x7FFFFFFF;
    v19 = v16;
    do
    {
      v20 = *v19++;
      result = sqrtf((float)(v16[v7] * v16[v7]) + (float)(v20 * v20));
      *v17++ = result;
      ++v7;
      --v18;
    }
    while (v18);
  }
  return result;
}

uint64_t AdaptiveThreshold::initialize(float **this, unsigned int a2, float a3)
{
  BOOL v3;
  uint64_t v4;
  unint64_t v7;

  v3 = a3 < 0.0 || a2 == 0;
  v4 = !v3;
  if (!v3)
  {
    v7 = a2;
    std::vector<float>::resize((uint64_t)(this + 2), a2);
    std::vector<float>::resize((uint64_t)(this + 5), v7);
    vDSP_vclr(this[2], 1, this[3] - this[2]);
    *(float *)this = a3;
    *((float *)this + 1) = a3;
    *((_DWORD *)this + 2) = 0;
  }
  return v4;
}

float AdaptiveThreshold::reset(float **this)
{
  float result;

  vDSP_vclr(this[2], 1, this[3] - this[2]);
  result = *((float *)this + 1);
  *(float *)this = result;
  *((_DWORD *)this + 2) = 0;
  return result;
}

float AdaptiveThreshold::updateThreshold(AdaptiveThreshold *this, float a2)
{
  const float *v3;
  const float *v4;
  uint64_t v6;
  unint64_t v7;
  float v8;
  float v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t __StandardDeviation;

  v3 = (const float *)*((_QWORD *)this + 2);
  v4 = (const float *)*((_QWORD *)this + 3);
  if (v3 != v4)
  {
    __StandardDeviation = 0;
    vDSP_normalize(v3, 1, 0, 1, (float *)&__StandardDeviation + 1, (float *)&__StandardDeviation, v4 - v3);
    v6 = *((_QWORD *)this + 2);
    v7 = *((_QWORD *)this + 3) - v6;
    v8 = 0.0;
    v9 = fabsf(a2);
    if (*((_DWORD *)this + 2) >= (v7 >> 2))
    {
      v10 = __StandardDeviation;
      *(float *)this = *((float *)&__StandardDeviation + 1)
                     + (float)(*((float *)this + 1) * *(float *)&__StandardDeviation);
      v8 = (float)(v9 - *((float *)&v10 + 1)) / *(float *)&v10;
    }
    memmove((void *)v6, (const void *)(v6 + 4), v7 - 4);
    v11 = *((_DWORD *)this + 2);
    v12 = *((_QWORD *)this + 3);
    if (v11 + 1 < ((unint64_t)(v12 - *((_QWORD *)this + 2)) >> 2))
      v13 = v11 + 1;
    else
      v13 = (unint64_t)(v12 - *((_QWORD *)this + 2)) >> 2;
    *((_DWORD *)this + 2) = v13;
    if (v8 > *((float *)this + 1))
      v9 = (float)(*(float *)(v12 - 8) * 0.98) + (float)(v9 * 0.02);
    *(float *)(v12 - 4) = v9;
  }
  return *(float *)this;
}

uint64_t AdaptiveThreshold::minInitDelayInFrames(AdaptiveThreshold *this)
{
  return 21;
}

void SyncSequence::initialize(float **this, int a2, float a3, unsigned int a4, float a5)
{
  char *v8;
  int v9;
  float __B;

  __B = a3;
  v8 = (char *)(this + 1);
  std::vector<float>::resize((uint64_t)(this + 1), 0x800uLL);
  vDSP_vsmul(&echoCodec::kSyncNoiseSequence[2048 * (unint64_t)(a2 != 44100)], 1, &__B, this[1], 1, 0x800uLL);
  v9 = 0;
  std::vector<float>::resize((uint64_t)v8, a4, &v9);
  *(_DWORD *)this = 0;
}

uint64_t SyncSeqEmbedder::initialize(SyncSeqEmbedder *this, int a2, int a3, int a4, char a5)
{
  unsigned int v6;
  float v8;
  float v9;
  uint64_t result;

  v6 = *((_DWORD *)this + 7);
  if (!v6)
    return 0;
  v8 = *((float *)this + 8);
  if (v8 == 0.0)
    return 0;
  v9 = *((float *)this + 9);
  if (v9 == 0.0)
    return 0;
  SyncSeqEmbedder::initialize(this, a2, a4, 2 * a3, v6, v8, v9);
  *((_BYTE *)this + 40) = a5;
  result = 1;
  *((_BYTE *)this + 8) = 1;
  return result;
}

void SyncSeqEmbedder::initialize(SyncSeqEmbedder *this, int a2, int a3, unsigned int a4, unsigned int a5, float a6, float a7)
{
  *((_DWORD *)this + 3) = a3;
  *((_DWORD *)this + 4) = a4;
  *((_DWORD *)this + 5) = a3;
  *((_DWORD *)this + 6) = a4;
  *((_DWORD *)this + 11) = 0;
  SyncSequence::initialize((float **)this + 7, a2, a6, a5, a7);
  ShapingFilter::initialize((uint64_t)this + 88, 1, a2, 1u, 1, a7);
  *((_QWORD *)this + 6) = 0;
  std::vector<float>::resize((uint64_t)this + 128, a4);
  vDSP_vclr(*((float **)this + 16), 1, (uint64_t)(*((_QWORD *)this + 17) - *((_QWORD *)this + 16)) >> 2);
}

_DWORD *SyncSeqEmbedder::setConfig(_DWORD *result, uint64_t a2)
{
  float *v2;
  uint64_t v3;
  _DWORD *v4;
  float *v5;
  _QWORD *v6;
  uint64_t v7;
  unsigned int v8;
  _QWORD *v9;
  unsigned int v10;
  BOOL v11;
  uint64_t *v12;
  uint64_t (**v13)(uint64_t, _QWORD, _QWORD, _QWORD, void *);
  int v14;
  char v15;
  _DWORD *v16;
  int v17;
  char v18;
  _DWORD *v19;
  uint64_t v20;

  v2 = (float *)result;
  v3 = 0;
  v20 = *MEMORY[0x24BDAC8D0];
  v14 = 100;
  v15 = 0;
  v4 = result + 7;
  v16 = result + 7;
  v17 = 111;
  v18 = 1;
  v5 = (float *)(result + 9);
  v19 = result + 9;
  v6 = (_QWORD *)(a2 + 8);
  do
  {
    v7 = *v6;
    if (*v6)
    {
      v8 = *(&v14 + 4 * v3);
      v9 = v6;
      do
      {
        v10 = *(_DWORD *)(v7 + 32);
        v11 = v10 >= v8;
        if (v10 >= v8)
          v12 = (uint64_t *)v7;
        else
          v12 = (uint64_t *)(v7 + 8);
        if (v11)
          v9 = (_QWORD *)v7;
        v7 = *v12;
      }
      while (*v12);
      if (v9 != v6 && v8 >= *((_DWORD *)v9 + 8))
      {
        v13 = (uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v9 + 5);
        if (*((_BYTE *)&v14 + 16 * v3 + 4))
        {
          result = std::any_cast[abi:ne180100]<float const>(v13);
          if (!result)
            goto LABEL_26;
          *(&v16)[2 * v3] = *result;
        }
        else
        {
          result = std::any_cast[abi:ne180100]<unsigned int const>(v13);
          if (!result)
LABEL_26:
            std::__throw_bad_any_cast[abi:ne180100]();
          *(&v16)[2 * v3] = *result;
        }
      }
    }
    ++v3;
  }
  while (v3 != 2);
  if (!*v4)
    *v4 = 2048;
  if (v2[8] == 0.0)
    v2[8] = 0.06;
  if (*v5 == 0.0)
    *v5 = 18000.0;
  return result;
}

uint64_t SyncSeqEmbedder::getFrameStartOffset(uint64_t a1, float **a2, unsigned int a3, uint64_t a4)
{
  uint64_t v8;
  int v9;
  float *v10;
  uint64_t v11;
  int v12;

  v8 = SyncSeqEmbedder::embedSyncFrame(a1, a2, a3);
  if (*(_BYTE *)(a1 + 40))
  {
    if (!*(_DWORD *)(a1 + 44))
    {
      v10 = *a2;
      v11 = a4;
      v12 = a3;
      goto LABEL_6;
    }
    v9 = *(_DWORD *)(a1 + 52);
    std::function<void ()(float *,unsigned int)>::operator()(a4, (uint64_t)*a2, *(_DWORD *)(a1 + 48));
    if (v9)
    {
      v10 = &(*a2)[a3 - v9];
      v11 = a4;
      v12 = v9;
LABEL_6:
      std::function<void ()(float *,unsigned int)>::operator()(v11, (uint64_t)v10, v12);
    }
  }
  return v8;
}

uint64_t SyncSeqEmbedder::embedSyncFrame(uint64_t a1, float **a2, unsigned int a3)
{
  int v5;
  int v6;
  float *v7;
  int v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  unint64_t v14;
  BOOL v15;
  unsigned int v16;
  int v17;
  vDSP_Length v18;
  const float *v19;
  BOOL v20;

  v5 = *(_DWORD *)(a1 + 20);
  v6 = *(_DWORD *)(a1 + 24);
  v7 = *a2;
  if (((unint64_t)((char *)a2[1] - (char *)*a2) >> 2) < a3)
    std::vector<float>::resize((uint64_t)a2, a3);
  *(_QWORD *)(a1 + 48) = 0;
  v8 = *(_DWORD *)(a1 + 44);
  if (v8 == 1)
  {
    v9 = *(_DWORD *)(a1 + 20);
  }
  else
  {
    if (v8)
      return (v6 + v5);
    v9 = *(_DWORD *)(a1 + 20);
    if (v9 >= a3)
    {
      *(_DWORD *)(a1 + 20) = v9 - a3;
      return (v6 + v5);
    }
    *(_DWORD *)(a1 + 44) = 1;
  }
  v10 = a3 - v9;
  if (v9)
  {
    *(_DWORD *)(a1 + 48) = v9;
    v7 += v9;
    *(_DWORD *)(a1 + 20) = 0;
  }
  if (v10 >= 1)
  {
    v12 = *(_QWORD *)(a1 + 64);
    v11 = *(_QWORD *)(a1 + 72);
    v13 = *(_DWORD *)(a1 + 56);
    do
    {
      v14 = (unint64_t)(v11 - v12) >> 2;
      v15 = v14 >= v13;
      v16 = v14 - v13;
      if (v16)
      {
        if (v16 != 0 && v15)
          v19 = (const float *)(v12 + 4 * v13);
        else
          v19 = 0;
        if (v10 >= v16)
          v18 = v16;
        else
          v18 = v10;
        vDSP_vadd(v7, 1, v19, 1, v7, 1, v18);
        v13 = *(_DWORD *)(a1 + 56) + v18;
        v12 = *(_QWORD *)(a1 + 64);
        v11 = *(_QWORD *)(a1 + 72);
        if (v13 >= ((unint64_t)(v11 - v12) >> 2))
          v13 = (unint64_t)(v11 - v12) >> 2;
        *(_DWORD *)(a1 + 56) = v13;
        *(_DWORD *)(a1 + 24) -= v18;
      }
      else
      {
        v17 = *(_DWORD *)(a1 + 24);
        if (v17)
        {
          if (v10 >= v17)
            LODWORD(v18) = *(_DWORD *)(a1 + 24);
          else
            LODWORD(v18) = v10;
          v17 -= v18;
          *(_DWORD *)(a1 + 24) = v17;
        }
        else
        {
          LODWORD(v18) = v10;
        }
        if (v10 == a3)
          *(_DWORD *)(a1 + 48) = v18;
        else
          *(_DWORD *)(a1 + 52) = v18;
        if (v17 <= 0)
          *(_DWORD *)(a1 + 44) = 2;
      }
      v7 += v18;
      v20 = __OFSUB__(v10, (_DWORD)v18);
      v10 -= v18;
    }
    while (!((v10 < 0) ^ v20 | (v10 == 0)));
  }
  return (v6 + v5);
}

uint64_t std::function<void ()(float *,unsigned int)>::operator()(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  int v5;
  uint64_t v6;

  v6 = a2;
  v5 = a3;
  v3 = *(_QWORD *)(a1 + 24);
  if (!v3)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t, uint64_t *, int *))(*(_QWORD *)v3 + 48))(v3, &v6, &v5);
}

double SyncSeqEmbedder::reset(SyncSeqEmbedder *this)
{
  double result;

  result = *(double *)((char *)this + 12);
  *(double *)((char *)this + 20) = result;
  *(_QWORD *)((char *)this + 52) = 0;
  *(_QWORD *)((char *)this + 44) = 0;
  return result;
}

uint64_t SyncSeqEmbedder::searchSyncPosition(uint64_t this, unsigned int a2)
{
  unsigned int v2;
  BOOL v3;
  unsigned int v4;

  if (!*(_DWORD *)(this + 44))
  {
    v2 = *(_DWORD *)(this + 20);
    v3 = v2 >= a2;
    v4 = v2 - a2;
    if (v3)
      *(_DWORD *)(this + 20) = v4;
    else
      *(_DWORD *)(this + 44) = 1;
  }
  return this;
}

uint64_t SyncSeqDetector::initialize(SyncSeqDetector *this, int a2, unsigned int a3, double a4, double a5, float a6)
{
  SyncSeqDetector::initialize(this, a2, a3, *((float *)this + 12), *((_DWORD *)this + 11), 0, *((float *)this + 9), a6);
  return 1;
}

void SyncSeqDetector::initialize(SyncSeqDetector *this, int a2, unsigned int a3, float a4, unsigned int a5, int a6, float a7, float a8)
{
  unint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  float v19;
  vDSP_biquad_SetupStruct *Setup;

  *((_DWORD *)this + 3) = a2;
  *((_DWORD *)this + 4) = a5;
  v15 = a5;
  std::vector<float>::resize((uint64_t)this + 216, a5);
  std::vector<float>::resize((uint64_t)this + 192, v15);
  vDSP_vclr(*((float **)this + 24), 1, (uint64_t)(*((_QWORD *)this + 25) - *((_QWORD *)this + 24)) >> 2);
  *((_DWORD *)this + 5) = 0;
  *((_DWORD *)this + 8) = a5 - a6;
  v16 = a3 / (a3 >> 3);
  *((_DWORD *)this + 14) = a3 >> 3;
  *((_DWORD *)this + 15) = v16;
  std::vector<SyncSeqDetector::peakInfo>::resize((uint64_t)this + 64, (2 * v16));
  v17 = (2 * *((_DWORD *)this + 15));
  if ((_DWORD)v17)
  {
    v18 = *((_QWORD *)this + 8) + 4;
    do
    {
      *(_QWORD *)(v18 - 4) = 0xFFFFFFFFLL;
      v18 += 8;
      --v17;
    }
    while (v17);
  }
  AdaptiveThreshold::initialize((float **)this + 11, 0x14u, a7);
  *((_DWORD *)this + 10) = 1092616192;
  *((_QWORD *)this + 19) = 0xFFFFFFFFLL;
  SyncSequence::initialize((float **)this + 20, a2, a4, a3, v19);
  Setup = vDSP_biquad_CreateSetup(&SyncSeqDetector::mBPFCoef[10 * (a2 == 48000)], 2uLL);
  std::unique_ptr<vDSP_biquad_SetupStruct,applesauce::raii::v1::detail::opaque_deletion_functor<vDSP_biquad_SetupStruct*,&(vDSP_biquad_DestroySetup)>>::reset[abi:ne180100]((vDSP_biquad_SetupStruct **)this + 33, Setup);
  std::vector<float>::resize((uint64_t)this + 240, 6uLL);
  vDSP_vclr(*((float **)this + 30), 1, (uint64_t)(*((_QWORD *)this + 31) - *((_QWORD *)this + 30)) >> 2);
}

_DWORD *SyncSeqDetector::setConfig(_DWORD *result, uint64_t a2)
{
  float *v2;
  uint64_t v3;
  int *v4;
  float *v5;
  float *v6;
  _QWORD *v7;
  uint64_t v8;
  unsigned int v9;
  _QWORD *v10;
  unsigned int v11;
  BOOL v12;
  uint64_t *v13;
  uint64_t (**v14)(uint64_t, _QWORD, _QWORD, _QWORD, void *);
  int v15;
  int v16;
  int v17;
  char v18;
  _DWORD *v19;
  int v20;
  char v21;
  _DWORD *v22;
  int v23;
  char v24;
  _DWORD *v25;
  uint64_t v26;

  v2 = (float *)result;
  v3 = 0;
  v26 = *MEMORY[0x24BDAC8D0];
  v17 = 100;
  v18 = 0;
  v4 = result + 11;
  v19 = result + 11;
  v20 = 111;
  v21 = 1;
  v5 = (float *)(result + 13);
  v22 = result + 13;
  v23 = 109;
  v24 = 1;
  v6 = (float *)(result + 9);
  v25 = result + 9;
  v7 = (_QWORD *)(a2 + 8);
  do
  {
    v8 = *v7;
    if (*v7)
    {
      v9 = *(&v17 + 4 * v3);
      v10 = v7;
      do
      {
        v11 = *(_DWORD *)(v8 + 32);
        v12 = v11 >= v9;
        if (v11 >= v9)
          v13 = (uint64_t *)v8;
        else
          v13 = (uint64_t *)(v8 + 8);
        if (v12)
          v10 = (_QWORD *)v8;
        v8 = *v13;
      }
      while (*v13);
      if (v10 != v7 && v9 >= *((_DWORD *)v10 + 8))
      {
        v14 = (uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v10 + 5);
        if (*((_BYTE *)&v17 + 16 * v3 + 4))
        {
          result = std::any_cast[abi:ne180100]<float const>(v14);
          if (!result)
            goto LABEL_29;
          *(&v19)[2 * v3] = *result;
        }
        else
        {
          result = std::any_cast[abi:ne180100]<unsigned int const>(v14);
          if (!result)
LABEL_29:
            std::__throw_bad_any_cast[abi:ne180100]();
          *(&v19)[2 * v3] = *result;
        }
      }
    }
    ++v3;
  }
  while (v3 != 3);
  if (v2[12] == 0.0)
    v2[12] = 0.06;
  if (*v5 == 0.0)
    *v5 = 18000.0;
  v15 = *((_DWORD *)v2 + 11);
  if (*v6 == 0.0)
    *v6 = 0.06;
  if (v15)
    v16 = 2 * v15;
  else
    v16 = 4096;
  *v4 = v16;
  return result;
}

uint64_t SyncSeqDetector::getFrameStartOffset(SyncSeqDetector *this, const float *a2, int a3, int *a4, int a5)
{
  if (*((_BYTE *)this + 24) || SyncSeqDetector::detectSyncFrame(this, a2, a3, a5))
  {
    *a4 = *((_DWORD *)this + 11) + *((_DWORD *)this + 7);
    *((_DWORD *)this + 7) -= a3;
  }
  return *((unsigned __int8 *)this + 24);
}

uint64_t SyncSeqDetector::status(SyncSeqDetector *this)
{
  return *((unsigned __int8 *)this + 24);
}

uint64_t SyncSeqDetector::detectSyncFrame(SyncSeqDetector *this, const float *__X, int a3, int a4)
{
  float v4;
  int v5;
  uint64_t v7;
  AdaptiveThreshold *v8;
  unsigned int v9;
  const float *v10;
  uint64_t v11;
  unsigned int v12;
  vDSP_Length v13;
  unint64_t v14;
  const float *v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const float *v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  float *v33;
  uint64_t v34;
  unsigned int v35;
  float *v36;
  BOOL v37;
  float *v38;
  uint64_t v39;
  float v40;
  float *v41;
  float v42;
  float v43;
  uint64_t v44;
  float *v45;
  uint64_t v46;
  float v47;
  float v48;
  float v49;
  _DWORD *v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t result;

  if (a4)
    v4 = 2.97;
  else
    v4 = 2.7;
  if (a3 < 1)
    return 0;
  v5 = a3;
  v7 = ((*((_QWORD *)this + 25) - *((_QWORD *)this + 24)) >> 3) & 0x7FFFFFFFLL;
  v8 = (SyncSeqDetector *)((char *)this + 88);
  v9 = *((_DWORD *)this + 5);
  v10 = __X;
  while (1)
  {
    v11 = *((_QWORD *)this + 24);
    v12 = ((unint64_t)(*((_QWORD *)this + 25) - v11) >> 2) - v9;
    if (v12 >= v5)
      v13 = v5;
    else
      v13 = v12;
    vDSP_biquad(*((const vDSP_biquad_SetupStruct **)this + 33), *((float **)this + 30), v10, 1, (float *)(v11 + 4 * v9), 1, v13);
    v14 = (v13 + *((_DWORD *)this + 5));
    *((_DWORD *)this + 5) = v14;
    v15 = (const float *)*((_QWORD *)this + 24);
    if (v14 < (uint64_t)(*((_QWORD *)this + 25) - (_QWORD)v15) >> 2)
    {
      if (v10 == __X)
      {
        v50 = (_DWORD *)*((_QWORD *)this + 8);
        v51 = *((_QWORD *)this + 9) - (_QWORD)v50;
        if ((v51 & 0x7FFFFFFF8) != 0)
        {
          v52 = (v51 >> 3);
          do
          {
            *v50 -= v13;
            v50 += 2;
            --v52;
          }
          while (v52);
        }
      }
      return 0;
    }
    LODWORD(v16) = *((_DWORD *)this + 15);
    if ((_DWORD)v16)
    {
      v17 = 0;
      v18 = 0;
      v19 = *((_QWORD *)this + 8);
      do
      {
        *(_QWORD *)(v19 + v17) = *(_QWORD *)(v19 + 8 * (v18 + v16));
        v19 = *((_QWORD *)this + 8);
        *(_DWORD *)(v19 + v17) -= v13;
        v16 = *((unsigned int *)this + 15);
        *(_QWORD *)(v19 + 8 * (v18++ + v16)) = 0xFFFFFFFFLL;
        v17 += 8;
      }
      while (v18 < v16);
      v15 = (const float *)*((_QWORD *)this + 24);
    }
    v20 = *((_QWORD *)this + 21);
    v21 = *((_QWORD *)this + 22) - v20;
    v22 = *((unsigned int *)this + 40);
    v23 = v20 + 4 * v22;
    v24 = v22 >= (v21 >> 2) ? 0 : (const float *)v23;
    vDSP_conv(v15, 1, v24, 1, *((float **)this + 27), 1, *((_DWORD *)this + 4) - (v21 >> 2), (v21 >> 2));
    v25 = *((unsigned int *)this + 15);
    if ((_DWORD)v25)
    {
      v26 = 0;
      v27 = 0;
      v28 = *((_QWORD *)this + 8);
      v29 = *((_QWORD *)this + 27);
      v30 = *((_DWORD *)this + 14);
      v31 = v30;
      do
      {
        v32 = v30 * v27;
        v33 = (float *)(v29 + 4 * v30 * v27);
        v34 = v27 + 1;
        v35 = v30 * (v27 + 1);
        v36 = v33 + 1;
        v37 = v30 * (_DWORD)v27 == v35 || v36 == (float *)(v29 + 4 * v35);
        v38 = (float *)(v29 + 4 * v32);
        if (!v37)
        {
          v39 = 4 * v31 - 4 * v26 - 4;
          v40 = *v33;
          v38 = (float *)(v29 + 4 * v32);
          v41 = v33 + 1;
          do
          {
            v42 = *v41++;
            v43 = v42;
            if (fabsf(v40) < fabsf(v42))
            {
              v40 = v43;
              v38 = v36;
            }
            v36 = v41;
            v39 -= 4;
          }
          while (v39);
        }
        v44 = v28 + 8 * v25 + 8 * v27;
        *(_DWORD *)v44 = v32 + ((unint64_t)((char *)v38 - (char *)v33) >> 2);
        *(float *)(v44 + 4) = fabsf(*v38);
        v31 += v30;
        v26 += v30;
        v27 = v34;
      }
      while (v34 != v25);
      if ((int)v25 >= 1)
        break;
    }
LABEL_42:
    v10 += v13;
    v5 -= v13;
    memmove(*((void **)this + 24), (const void *)(*((_QWORD *)this + 24) + 4 * (((*((_QWORD *)this + 25) - *((_QWORD *)this + 24)) >> 2) - v7)), 4 * v7);
    v9 = *((_DWORD *)this + 5) - v7;
    *((_DWORD *)this + 5) = v9;
    if (v5 <= 0)
      return 0;
  }
  v45 = (float *)(v28 + 8 * v25 - 12);
  v46 = -2;
  while (1)
  {
    v47 = *v45;
    if (*v45 > 0.0 && v47 > AdaptiveThreshold::updateThreshold(v8, *v45))
    {
      v48 = *(v45 - 2);
      if (v48 < v47)
      {
        v49 = v45[2];
        if (v49 < v47)
        {
          if (v48 >= *(v45 - 4))
            v48 = *(v45 - 4);
          if (v45[4] < v49)
            v49 = v45[4];
          if (v48 < v49)
            v48 = v49;
          if (v47 > (float)(v4 * v48))
            break;
        }
      }
    }
    ++v46;
    v45 += 2;
    if (v46 >= *((int *)this + 15) - 2)
      goto LABEL_42;
  }
  *((_DWORD *)this + 7) = v13
                        + ((unint64_t)((char *)v10 - (char *)__X) >> 2)
                        + *((_DWORD *)v45 - 1)
                        - ((*((_QWORD *)this + 25) - *((_QWORD *)this + 24)) >> 2);
  result = 1;
  *((_BYTE *)this + 24) = 1;
  return result;
}

void std::vector<SyncSeqDetector::peakInfo>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2;

  v2 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3;
  if (a2 <= v2)
  {
    if (a2 < v2)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 8 * a2;
  }
  else
  {
    std::vector<SyncSeqDetector::peakInfo>::__append((void **)a1, a2 - v2);
  }
}

void SyncSeqDetector::reset(float **this)
{
  vDSP_vclr(this[24], 1, this[25] - this[24]);
  *((_DWORD *)this + 5) = 0;
  *((_BYTE *)this + 24) = 0;
  *((_DWORD *)this + 7) = 0;
  vDSP_vclr(this[13], 1, this[14] - this[13]);
  *((_DWORD *)this + 22) = *((_DWORD *)this + 23);
  *((_DWORD *)this + 24) = 0;
  *((_DWORD *)this + 10) = 1092616192;
  this[19] = (float *)0xFFFFFFFFLL;
  vDSP_vclr(this[30], 1, this[31] - this[30]);
}

uint64_t SyncSeqDetector::minimumOffset(SyncSeqDetector *this)
{
  return (22 * (*((_DWORD *)this + 4) >> 3));
}

uint64_t PasscodePositioner::initialize(PasscodePositioner *this, unsigned int a2, unsigned int a3, int a4, char a5)
{
  *((_DWORD *)this + 3) = a4;
  *((_DWORD *)this + 4) = a4;
  *((_BYTE *)this + 20) = a5;
  *((_DWORD *)this + 6) = 0;
  return 1;
}

_DWORD *PasscodePositioner::reset(_DWORD *this)
{
  this[4] = this[3];
  this[6] = 0;
  return this;
}

uint64_t PasscodePositioner::getFrameStartOffset(uint64_t a1, uint64_t *a2, unsigned int a3, uint64_t a4)
{
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;

  v4 = *(unsigned int *)(a1 + 16);
  v5 = *(_DWORD *)(a1 + 24);
  if (!v5)
  {
    v6 = v4 - a3;
    if (v4 >= a3)
    {
      v5 = 0;
    }
    else
    {
      v6 = 0;
      v5 = 1;
      *(_DWORD *)(a1 + 24) = 1;
    }
    *(_DWORD *)(a1 + 16) = v6;
  }
  if (*(_BYTE *)(a1 + 20))
  {
    v7 = *a2;
    if (v5)
      a3 = v4;
    std::function<void ()(float *,unsigned int)>::operator()(a4, v7, a3);
  }
  return v4;
}

uint64_t SyncEchoDetector::initialize(SyncEchoDetector *this, unsigned int a2, unsigned int a3)
{
  float v5;
  unsigned int v6;
  unsigned int v7;
  _DWORD *v8;
  _DWORD *v9;
  char *v10;
  unsigned int v11;
  unint64_t v12;
  unint64_t v13;
  int v14;
  char *v15;
  int64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int64_t v23;
  int v24;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v5 = (float)a2 / 48000.0;
  v6 = vcvtps_u32_f32(v5 * (float)(a3 >> 6));
  v7 = *((_DWORD *)this + 4) * a3 - vcvtps_u32_f32(v5 * (float)(a3 >> 2));
  *((_DWORD *)this + 5) = v7;
  v8 = (_DWORD *)((char *)this + 20);
  *((_DWORD *)this + 6) = v6;
  v9 = (_DWORD *)((char *)this + 24);
  v26[0] = 0x3C23D70A3BA3D70ALL;
  *((_DWORD *)this + 3) = a3;
  *((_DWORD *)this + 7) = (v7 - a3) / v6;
  EchoDetector::initialize((SyncEchoDetector *)((char *)this + 224), a3, a2, (const float *)v26);
  BitCounter::initialize((SyncEchoDetector *)((char *)this + 168), *v8 / *v9, 1);
  ShapingFilter::initialize((uint64_t)this + 320, 1, a2, 1u, 1, *((float *)this + 10));
  std::vector<float>::resize((uint64_t)this + 48, *v8);
  v10 = (char *)*((_QWORD *)this + 12);
  v11 = *((_DWORD *)this + 43);
  v12 = 10 * v11;
  v13 = *((_QWORD *)this + 13) - (_QWORD)v10;
  if (v12 <= v13)
  {
    if (v12 < v13)
      *((_QWORD *)this + 13) = &v10[v12];
  }
  else
  {
    std::vector<signed char>::__append((unint64_t *)this + 12, v12 - v13);
    v10 = (char *)*((_QWORD *)this + 12);
    v11 = *((_DWORD *)this + 43);
  }
  if (v11)
  {
    memset(v10, 255, v11);
    v10 = (char *)*((_QWORD *)this + 12);
    v14 = *((_DWORD *)this + 43);
  }
  else
  {
    v14 = 0;
  }
  v15 = &v10[9 * v14];
  v16 = *((_QWORD *)this + 13) - (_QWORD)v15;
  if (v16 >= 1)
  {
    memset(v15, 255, v16);
    v14 = *((_DWORD *)this + 43);
  }
  v17 = *((_QWORD *)this + 15);
  v18 = (8 * v14);
  v19 = *((_QWORD *)this + 16) - v17;
  if (v18 <= v19)
  {
    if (v18 < v19)
      *((_QWORD *)this + 16) = v17 + v18;
  }
  else
  {
    std::vector<signed char>::__append((unint64_t *)this + 15, v18 - v19);
  }
  v20 = 0;
  do
  {
    v21 = *((_DWORD *)this + 43);
    v22 = v20 + 1;
    v23 = (v21 * (v20 + 1)) - (unint64_t)(v21 * v20);
    if (v23 >= 1)
    {
      if (((0x72uLL >> v20) & 1) != 0)
        v24 = 1;
      else
        v24 = -1;
      memset((void *)(*((_QWORD *)this + 15) + (v21 * v20)), v24, v23);
    }
    v20 = v22;
  }
  while (v22 != 8);
  std::vector<unsigned int>::resize((std::vector<int> *)this + 6, (2 * *((_DWORD *)this + 43)));
  *((_QWORD *)this + 4) = 0;
  *((_WORD *)this + 22) = 0;
  *((_QWORD *)this + 10) = *((_QWORD *)this + 9);
  return 1;
}

void SyncEchoDetector::reset(SyncEchoDetector *this)
{
  *((_QWORD *)this + 4) = 0;
  *((_WORD *)this + 22) = 0;
  *((_QWORD *)this + 10) = *((_QWORD *)this + 9);
  ShapingFilter::reset((SyncEchoDetector *)((char *)this + 320));
}

_DWORD *SyncEchoDetector::setConfig(_DWORD *result, uint64_t a2)
{
  uint64_t v2;
  _DWORD *v3;
  float *v4;
  _QWORD *v5;
  uint64_t v6;
  unsigned int v7;
  _QWORD *v8;
  unsigned int v9;
  BOOL v10;
  uint64_t *v11;
  uint64_t (**v12)(uint64_t, _QWORD, _QWORD, _QWORD, void *);
  int v13;
  char v14;
  _DWORD *v15;
  int v16;
  char v17;
  _DWORD *v18;
  uint64_t v19;

  v2 = 0;
  v19 = *MEMORY[0x24BDAC8D0];
  v13 = 101;
  v14 = 0;
  v3 = result + 4;
  v15 = result + 4;
  v16 = 111;
  v17 = 1;
  v4 = (float *)(result + 10);
  v18 = result + 10;
  v5 = (_QWORD *)(a2 + 8);
  do
  {
    v6 = *v5;
    if (*v5)
    {
      v7 = *(&v13 + 4 * v2);
      v8 = v5;
      do
      {
        v9 = *(_DWORD *)(v6 + 32);
        v10 = v9 >= v7;
        if (v9 >= v7)
          v11 = (uint64_t *)v6;
        else
          v11 = (uint64_t *)(v6 + 8);
        if (v10)
          v8 = (_QWORD *)v6;
        v6 = *v11;
      }
      while (*v11);
      if (v8 != v5 && v7 >= *((_DWORD *)v8 + 8))
      {
        v12 = (uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v8 + 5);
        if (*((_BYTE *)&v13 + 16 * v2 + 4))
        {
          result = std::any_cast[abi:ne180100]<float const>(v12);
          if (!result)
            goto LABEL_24;
          *(&v15)[2 * v2] = *result;
        }
        else
        {
          result = std::any_cast[abi:ne180100]<unsigned int const>(v12);
          if (!result)
LABEL_24:
            std::__throw_bad_any_cast[abi:ne180100]();
          *(&v15)[2 * v2] = *result;
        }
      }
    }
    ++v2;
  }
  while (v2 != 2);
  if (!*v3)
    *v3 = 2;
  if (*v4 == 0.0)
    *v4 = 18000.0;
  return result;
}

BOOL SyncEchoDetector::getFrameStartOffset(SyncEchoDetector *this, const float *a2, int a3, int *a4)
{
  if (*((_BYTE *)this + 45))
  {
    *a4 = *((_DWORD *)this + 9) + 8 * *((_DWORD *)this + 5);
    *((_DWORD *)this + 9) -= a3;
    return 1;
  }
  else
  {
    SyncEchoDetector::detectSyncEcho(this, a2, a3);
    *a4 = *((_DWORD *)this + 9) + 8 * *((_DWORD *)this + 5);
    *((_DWORD *)this + 9) -= a3;
    return *((_BYTE *)this + 45) != 0;
  }
}

uint64_t SyncEchoDetector::status(SyncEchoDetector *this)
{
  return *((unsigned __int8 *)this + 45);
}

uint64_t SyncEchoDetector::detectSyncEcho(SyncEchoDetector *this, const float *a2, int a3)
{
  EchoDetector *v5;
  char *v6;
  unsigned int v7;
  int i;
  unsigned int v9;
  vDSP_Length v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  _BYTE *v14;
  _BYTE *v15;
  BOOL *v16;
  BOOL *v17;
  unsigned int v18;
  unsigned int v19;
  BOOL v20;
  unint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  size_t v26;
  char *v27;
  char *v28;
  BOOL *v29;
  BOOL *v30;
  BOOL v31;
  _QWORD *v32;
  BOOL v33;
  NSObject *v34;
  unsigned int v35;
  void **v38;
  ShapingFilter *v39;
  int v40;
  const float *v41;
  unsigned int v42;
  uint8_t buf[12];
  unsigned int v44;

  SyncEchoDetector::detectSyncEcho(float const*,unsigned int)::count += a3;
  if (a3 < 1)
    return 1;
  v5 = (SyncEchoDetector *)((char *)this + 224);
  v6 = (char *)this + 168;
  v38 = (void **)((char *)this + 72);
  v39 = (SyncEchoDetector *)((char *)this + 320);
  v7 = *((_DWORD *)this + 8);
  for (i = a3; i > 0; i -= v42)
  {
    v9 = *((_DWORD *)this + 5) - v7;
    if (v9 >= i)
      v10 = i;
    else
      v10 = v9;
    ShapingFilter::filter(v39, a2, (float *)(*((_QWORD *)this + 6) + 4 * v7), v10);
    v42 = v10;
    v11 = *((_DWORD *)this + 8) + v10;
    *((_DWORD *)this + 8) = v11;
    if (v11 < *((_DWORD *)this + 5))
      return 1;
    v12 = *((_DWORD *)this + 7);
    if (!v12)
      goto LABEL_51;
    v41 = a2;
    v13 = 0;
    v40 = v10 + a3;
    do
    {
      v44 = 0;
      if (EchoDetector::decodeEcho(v5, (const float *)(*((_QWORD *)this + 6) + 4 * *((_DWORD *)this + 6) * v13), *((_DWORD *)this + 3), (_BOOL4 *)&v44, 0))
      {
        if (!*((_BYTE *)this + 44))
        {
          *((_DWORD *)this + 46) = 0;
          *((_DWORD *)this + 42) = 0;
          *((_QWORD *)this + 22) = 0;
          v14 = (_BYTE *)*((_QWORD *)this + 24);
          v15 = (_BYTE *)*((_QWORD *)this + 25);
          if (v14 != v15)
          {
            *((_DWORD *)this + 54) = 0;
            if (v15 - v14 >= 1)
              bzero(v14, v15 - v14);
          }
          *((_BYTE *)this + 44) = 1;
        }
        BitCounter::count((uint64_t)v6, v44);
      }
      else
      {
        if (!*((_BYTE *)this + 44))
          goto LABEL_49;
        BitCounter::count((uint64_t)v6);
      }
      if (*((_BYTE *)this + 44))
      {
        v16 = (BOOL *)*((_QWORD *)this + 9);
        v17 = (BOOL *)*((_QWORD *)this + 10);
        if (v16 == v17)
        {
          v17 = (BOOL *)*((_QWORD *)this + 9);
          if (*((_DWORD *)this + 46) > *((_DWORD *)this + 7) >> 1)
          {
            v17 = (BOOL *)*((_QWORD *)this + 9);
            if ((*((_DWORD *)this + 44) + *((_DWORD *)this + 45)) <= 9)
            {
              *((_DWORD *)this + 46) = 0;
              *((_DWORD *)this + 42) = 0;
              *((_QWORD *)this + 22) = 0;
              *((_BYTE *)this + 44) = 0;
              v17 = v16;
              *((_QWORD *)this + 10) = v16;
            }
          }
        }
        if (*((_DWORD *)this + 42) >= *((_DWORD *)this + 43))
        {
          v18 = *((_DWORD *)this + 44);
          v19 = *((_DWORD *)this + 45);
          if (v18 == v19 || v19 + v18 <= 9)
          {
            *((_BYTE *)this + 44) = 0;
            *((_QWORD *)this + 10) = v16;
          }
          else
          {
            v20 = v18 < v19;
            *((_DWORD *)this + 46) = 0;
            *((_DWORD *)this + 42) = 0;
            *((_QWORD *)this + 22) = 0;
            v21 = *((_QWORD *)this + 11);
            if ((unint64_t)v17 >= v21)
            {
              v23 = v17 - v16;
              v24 = v17 - v16 + 1;
              if (v24 < 0)
                std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
              v25 = v21 - (_QWORD)v16;
              if (2 * v25 > v24)
                v24 = 2 * v25;
              if (v25 >= 0x3FFFFFFFFFFFFFFFLL)
                v26 = 0x7FFFFFFFFFFFFFFFLL;
              else
                v26 = v24;
              if (v26)
                v27 = (char *)operator new(v26);
              else
                v27 = 0;
              v28 = &v27[v23];
              v29 = (BOOL *)&v27[v23];
              *v29 = v20;
              v22 = v29 + 1;
              if (v17 != v16)
              {
                v30 = &v17[~(unint64_t)v16];
                do
                {
                  v31 = *--v17;
                  (v30--)[(_QWORD)v27] = v31;
                }
                while (v17 != v16);
                v16 = (BOOL *)*v38;
                v28 = v27;
              }
              *((_QWORD *)this + 9) = v28;
              *((_QWORD *)this + 10) = v22;
              *((_QWORD *)this + 11) = &v27[v26];
              if (v16)
                operator delete(v16);
            }
            else
            {
              *v17 = v20;
              v22 = v17 + 1;
            }
            *((_QWORD *)this + 10) = v22;
            v32 = (_QWORD *)*((_QWORD *)this + 9);
            if (v22 - (_BYTE *)v32 == 8)
            {
              v33 = *v32 == 0x1010100000100;
              *((_BYTE *)this + 45) = v33;
              if (v33)
              {
                *((_DWORD *)this + 9) = v40
                                      + *((_DWORD *)this + 6) * SyncEchoDetector::estimateFrameStart(this)
                                      - (i
                                       + *((_DWORD *)this + 8)
                                       + 8 * *((_DWORD *)this + 5));
                v34 = APCLogObject();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_229580000, v34, OS_LOG_TYPE_INFO, "A valid passcode frame start has been found!", buf, 2u);
                }
              }
              else
              {
                *((_QWORD *)this + 10) = v32;
              }
            }
          }
        }
      }
LABEL_49:
      ++v13;
      v12 = *((_DWORD *)this + 7);
    }
    while (v13 < v12);
    v11 = *((_DWORD *)this + 8);
    a2 = v41;
LABEL_51:
    v35 = *((_DWORD *)this + 6) * v12;
    memmove(*((void **)this + 6), (const void *)(*((_QWORD *)this + 6) + 4 * v35), 4 * (v11 - v35));
    v7 = *((_DWORD *)this + 8) - v35;
    *((_DWORD *)this + 8) = v7;
    a2 += v42;
  }
  return 1;
}

uint64_t SyncEchoDetector::estimateFrameStart(SyncEchoDetector *this)
{
  uint64_t v2;
  size_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  int v9;
  char *v10;
  char *v11;
  BOOL v12;
  char *v13;
  int v14;
  char *v15;
  int v16;
  int v17;
  BOOL v18;

  v2 = *((unsigned int *)this + 43);
  v3 = (8 * v2);
  if ((_DWORD)v3)
  {
    memmove((void *)(*((_QWORD *)this + 12) + v2), *((const void **)this + 24), v3);
    LODWORD(v2) = *((_DWORD *)this + 43);
  }
  if ((v2 & 0x7FFFFFFF) != 0)
  {
    v4 = 0;
    v6 = *((_QWORD *)this + 15);
    v5 = *((_QWORD *)this + 16);
    v7 = (char *)*((_QWORD *)this + 18);
    do
    {
      if (v5 == v6)
      {
        v9 = 0;
      }
      else
      {
        v8 = 0;
        v9 = 0;
        do
        {
          v9 += *(char *)(v6 + v8) * *(char *)(*((_QWORD *)this + 12) + (v4 + v8));
          ++v8;
        }
        while (v5 - v6 > (unint64_t)v8);
      }
      *(_DWORD *)&v7[4 * v4++] = v9;
      LODWORD(v2) = *((_DWORD *)this + 43);
    }
    while (v4 < (2 * v2));
  }
  else
  {
    v7 = (char *)*((_QWORD *)this + 18);
  }
  v10 = (char *)*((_QWORD *)this + 19);
  v11 = v7 + 4;
  v12 = v7 == v10 || v11 == v10;
  v13 = v7;
  if (!v12)
  {
    v14 = *(_DWORD *)v7;
    v13 = v7;
    v15 = v7 + 4;
    do
    {
      v17 = *(_DWORD *)v15;
      v15 += 4;
      v16 = v17;
      v18 = v14 < v17;
      if (v14 <= v17)
        v14 = v16;
      if (v18)
        v13 = v11;
      v11 = v15;
    }
    while (v15 != v10);
  }
  return ((unint64_t)(v13 - v7) >> 2) - v2 + 1;
}

uint64_t SyncEchoDetector::maxSearchLength(SyncEchoDetector *this)
{
  return (9 * *((_DWORD *)this + 5));
}

void PasscodePositioner::~PasscodePositioner(PasscodePositioner *this)
{
  JUMPOUT(0x22E2CB548);
}

uint64_t PasscodePositioner::syncFrameSizeSamples(PasscodePositioner *this)
{
  return 0;
}

void EchoEmbedder::~EchoEmbedder(EchoEmbedder *this)
{
  EchoEmbedder::~EchoEmbedder(this);
  JUMPOUT(0x22E2CB548);
}

{
  void *v2;
  void *v3;
  void *v4;

  *(_QWORD *)this = &off_24F24B840;
  std::deque<unsigned char>::~deque[abi:ne180100]((_QWORD *)this + 16);
  v2 = (void *)*((_QWORD *)this + 11);
  if (v2)
  {
    *((_QWORD *)this + 12) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((_QWORD *)this + 8);
  if (v3)
  {
    *((_QWORD *)this + 9) = v3;
    operator delete(v3);
  }
  v4 = (void *)*((_QWORD *)this + 5);
  if (v4)
  {
    *((_QWORD *)this + 6) = v4;
    operator delete(v4);
  }
}

void SyncedEchoEmbedder::~SyncedEchoEmbedder(SyncedEchoEmbedder *this)
{
  EchoEmbedder::~EchoEmbedder(this);
  JUMPOUT(0x22E2CB548);
}

void SyncSeqEmbedder::~SyncSeqEmbedder(SyncSeqEmbedder *this)
{
  void *v2;
  void *v3;
  void **v4;

  v2 = (void *)*((_QWORD *)this + 16);
  if (v2)
  {
    *((_QWORD *)this + 17) = v2;
    operator delete(v2);
  }
  std::unique_ptr<vDSP_biquad_SetupStruct,applesauce::raii::v1::detail::opaque_deletion_functor<vDSP_biquad_SetupStruct*,&(vDSP_biquad_DestroySetup)>>::reset[abi:ne180100]((vDSP_biquad_SetupStruct **)this + 15, 0);
  v4 = (void **)((char *)this + 96);
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v4);
  v3 = (void *)*((_QWORD *)this + 8);
  if (v3)
  {
    *((_QWORD *)this + 9) = v3;
    operator delete(v3);
  }
}

{
  void *v2;
  void *v3;
  void **v4;

  v2 = (void *)*((_QWORD *)this + 16);
  if (v2)
  {
    *((_QWORD *)this + 17) = v2;
    operator delete(v2);
  }
  std::unique_ptr<vDSP_biquad_SetupStruct,applesauce::raii::v1::detail::opaque_deletion_functor<vDSP_biquad_SetupStruct*,&(vDSP_biquad_DestroySetup)>>::reset[abi:ne180100]((vDSP_biquad_SetupStruct **)this + 15, 0);
  v4 = (void **)((char *)this + 96);
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v4);
  v3 = (void *)*((_QWORD *)this + 8);
  if (v3)
  {
    *((_QWORD *)this + 9) = v3;
    operator delete(v3);
  }
  MEMORY[0x22E2CB548](this, 0x10A1C40488B4B6ALL);
}

uint64_t SyncSeqEmbedder::syncFrameSizeSamples(SyncSeqEmbedder *this)
{
  return (2 * *((_DWORD *)this + 7));
}

void SyncSeqDetector::~SyncSeqDetector(vDSP_biquad_SetupStruct **this)
{
  SyncSeqDetector::~SyncSeqDetector(this);
  JUMPOUT(0x22E2CB548);
}

{
  vDSP_biquad_SetupStruct *v2;
  vDSP_biquad_SetupStruct *v3;
  vDSP_biquad_SetupStruct *v4;
  vDSP_biquad_SetupStruct *v5;
  vDSP_biquad_SetupStruct *v6;
  vDSP_biquad_SetupStruct *v7;
  vDSP_biquad_SetupStruct *v8;

  std::unique_ptr<vDSP_biquad_SetupStruct,applesauce::raii::v1::detail::opaque_deletion_functor<vDSP_biquad_SetupStruct*,&(vDSP_biquad_DestroySetup)>>::reset[abi:ne180100](this + 33, 0);
  v2 = this[30];
  if (v2)
  {
    this[31] = v2;
    operator delete(v2);
  }
  v3 = this[27];
  if (v3)
  {
    this[28] = v3;
    operator delete(v3);
  }
  v4 = this[24];
  if (v4)
  {
    this[25] = v4;
    operator delete(v4);
  }
  v5 = this[21];
  if (v5)
  {
    this[22] = v5;
    operator delete(v5);
  }
  v6 = this[16];
  if (v6)
  {
    this[17] = v6;
    operator delete(v6);
  }
  v7 = this[13];
  if (v7)
  {
    this[14] = v7;
    operator delete(v7);
  }
  v8 = this[8];
  if (v8)
  {
    this[9] = v8;
    operator delete(v8);
  }
}

uint64_t SyncSeqDetector::maxSearchLength(SyncSeqDetector *this)
{
  return *((unsigned int *)this + 4);
}

uint64_t SyncSeqDetector::useSyncFrameFlag(SyncSeqDetector *this)
{
  return 1;
}

void SyncEchoDetector::~SyncEchoDetector(vDSP_biquad_SetupStruct **this)
{
  SyncEchoDetector::~SyncEchoDetector(this);
  JUMPOUT(0x22E2CB548);
}

{
  vDSP_biquad_SetupStruct *v2;
  vDSP_biquad_SetupStruct *v3;
  vDSP_biquad_SetupStruct *v4;
  vDSP_biquad_SetupStruct *v5;
  vDSP_biquad_SetupStruct *v6;
  vDSP_biquad_SetupStruct *v7;
  vDSP_biquad_SetupStruct *v8;
  vDSP_biquad_SetupStruct *v9;
  vDSP_biquad_SetupStruct *v10;
  void **v11;

  std::unique_ptr<vDSP_biquad_SetupStruct,applesauce::raii::v1::detail::opaque_deletion_functor<vDSP_biquad_SetupStruct*,&(vDSP_biquad_DestroySetup)>>::reset[abi:ne180100](this + 44, 0);
  v11 = (void **)(this + 41);
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v11);
  v2 = this[37];
  if (v2)
  {
    this[38] = v2;
    operator delete(v2);
  }
  v3 = this[34];
  if (v3)
  {
    this[35] = v3;
    operator delete(v3);
  }
  v4 = this[31];
  if (v4)
  {
    this[32] = v4;
    operator delete(v4);
  }
  std::unique_ptr<OpaqueFFTSetup,applesauce::raii::v1::detail::opaque_deletion_functor<OpaqueFFTSetup*,&(vDSP_destroy_fftsetup)>>::reset[abi:ne180100](this + 29, 0);
  v5 = this[24];
  if (v5)
  {
    this[25] = v5;
    operator delete(v5);
  }
  v6 = this[18];
  if (v6)
  {
    this[19] = v6;
    operator delete(v6);
  }
  v7 = this[15];
  if (v7)
  {
    this[16] = v7;
    operator delete(v7);
  }
  v8 = this[12];
  if (v8)
  {
    this[13] = v8;
    operator delete(v8);
  }
  v9 = this[9];
  if (v9)
  {
    this[10] = v9;
    operator delete(v9);
  }
  v10 = this[6];
  if (v10)
  {
    this[7] = v10;
    operator delete(v10);
  }
}

uint64_t SyncEchoDetector::minimumOffset(SyncEchoDetector *this)
{
  return 24000;
}

uint64_t SyncEchoDetector::useSyncFrameFlag(SyncEchoDetector *this)
{
  return 1;
}

void std::vector<std::vector<float>>::__append(uint64_t *a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  size_t v13;
  size_t v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(v4 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - v7) >> 3) >= a2)
  {
    if (a2)
    {
      v13 = 24 * ((24 * a2 - 24) / 0x18) + 24;
      bzero(*(void **)(v4 - 8), v13);
      v7 += v13;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = 0xAAAAAAAAAAAAAAABLL * ((v7 - *a1) >> 3);
    v9 = v8 + a2;
    if (v8 + a2 > 0xAAAAAAAAAAAAAAALL)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v10 = 0xAAAAAAAAAAAAAAABLL * ((v5 - *a1) >> 3);
    if (2 * v10 > v9)
      v9 = 2 * v10;
    if (v10 >= 0x555555555555555)
      v11 = 0xAAAAAAAAAAAAAAALL;
    else
      v11 = v9;
    v19 = v4;
    if (v11)
      v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>(v4, v11);
    else
      v12 = 0;
    v15 = v12;
    v16 = &v12[24 * v8];
    v18 = &v12[24 * v11];
    v14 = 24 * ((24 * a2 - 24) / 0x18) + 24;
    bzero(v16, v14);
    v17 = &v16[v14];
    std::vector<std::vector<float>>::__swap_out_circular_buffer(a1, &v15);
    std::__split_buffer<std::vector<float>>::~__split_buffer((uint64_t)&v15);
  }
}

void sub_229593544(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<std::vector<float>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::vector<float>>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>,std::reverse_iterator<std::vector<float>*>,std::reverse_iterator<std::vector<float>*>>((uint64_t)(a1 + 2), a1[1], (_QWORD *)a1[1], *a1, (_QWORD *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>,std::reverse_iterator<std::vector<float>*>,std::reverse_iterator<std::vector<float>*>>(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7)
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
      *(_QWORD *)(v7 - 24) = 0;
      *(_QWORD *)(v7 - 16) = 0;
      *(_QWORD *)(v7 - 8) = 0;
      v8 = *(_OWORD *)(a3 - 3);
      a3 -= 3;
      *(_OWORD *)(v7 - 24) = v8;
      *(_QWORD *)(v7 - 8) = a3[2];
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      v7 = *((_QWORD *)&v14 + 1) - 24;
      *((_QWORD *)&v14 + 1) -= 24;
    }
    while (a3 != a5);
    v9 = v14;
  }
  v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>>::operator()[abi:ne180100](uint64_t a1)
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
    v1 += 24;
  }
}

uint64_t std::__split_buffer<std::vector<float>>::~__split_buffer(uint64_t a1)
{
  std::__split_buffer<std::vector<float>>::__destruct_at_end[abi:ne180100](a1, *(_QWORD *)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__split_buffer<std::vector<float>>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v5;

  v2 = *(_QWORD *)(a1 + 16);
  while (v2 != a2)
  {
    v5 = *(void **)(v2 - 24);
    *(_QWORD *)(a1 + 16) = v2 - 24;
    if (v5)
    {
      *(_QWORD *)(v2 - 16) = v5;
      operator delete(v5);
      v2 = *(_QWORD *)(a1 + 16);
    }
    else
    {
      v2 -= 24;
    }
  }
}

void std::vector<signed char>::__append(unint64_t *a1, size_t a2)
{
  char *v4;
  char *v5;
  unint64_t v6;
  char *v7;
  unint64_t v8;
  unint64_t v9;
  size_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  char v15;

  v5 = (char *)a1[1];
  v4 = (char *)a1[2];
  if (v4 - v5 >= a2)
  {
    if (a2)
    {
      bzero((void *)a1[1], a2);
      v5 += a2;
    }
    a1[1] = (unint64_t)v5;
  }
  else
  {
    v6 = *a1;
    v7 = &v5[-*a1];
    v8 = (unint64_t)&v7[a2];
    if ((uint64_t)&v7[a2] < 0)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v9 = (unint64_t)&v4[-v6];
    if (2 * v9 > v8)
      v8 = 2 * v9;
    if (v9 >= 0x3FFFFFFFFFFFFFFFLL)
      v10 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v10 = v8;
    if (v10)
      v11 = (unint64_t)operator new(v10);
    else
      v11 = 0;
    v12 = &v7[v11];
    v13 = (char *)(v11 + v10);
    bzero(v12, a2);
    if (v5 == (char *)v6)
    {
      v11 = (unint64_t)v12;
    }
    else
    {
      v14 = &v5[~v6];
      do
      {
        v15 = *--v5;
        (v14--)[v11] = v15;
      }
      while (v5 != (char *)v6);
      v5 = (char *)*a1;
    }
    *a1 = v11;
    a1[1] = (unint64_t)&v12[a2];
    a1[2] = (unint64_t)v13;
    if (v5)
      operator delete(v5);
  }
}

void std::vector<unsigned int>::__append(std::vector<int> *this, std::vector<int>::size_type __n)
{
  std::__compressed_pair<int *> *p_end_cap;
  int *v5;
  int *value;
  int *end;
  std::vector<int>::pointer begin;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  int *v16;
  int *v17;
  int v18;

  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  v5 = value;
  end = p_end_cap[-1].__value_;
  if (__n <= value - end)
  {
    if (__n)
    {
      bzero(p_end_cap[-1].__value_, 4 * __n);
      end += __n;
    }
    this->__end_ = end;
  }
  else
  {
    begin = this->__begin_;
    v9 = (char *)end - (char *)this->__begin_;
    v10 = __n + (v9 >> 2);
    if (v10 >> 62)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v11 = v9 >> 2;
    v12 = (char *)v5 - (char *)begin;
    if (v12 >> 1 > v10)
      v10 = v12 >> 1;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL)
      v13 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v13 = v10;
    if (v13)
    {
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)p_end_cap, v13);
      begin = this->__begin_;
      end = this->__end_;
    }
    else
    {
      v14 = 0;
    }
    v15 = &v14[4 * v11];
    v16 = (int *)&v14[4 * v13];
    bzero(v15, 4 * __n);
    v17 = (int *)&v15[4 * __n];
    while (end != begin)
    {
      v18 = *--end;
      *((_DWORD *)v15 - 1) = v18;
      v15 -= 4;
    }
    this->__begin_ = (std::vector<int>::pointer)v15;
    this->__end_ = v17;
    this->__end_cap_.__value_ = v16;
    if (begin)
      operator delete(begin);
  }
}

_QWORD *std::vector<float>::vector(_QWORD *a1, unint64_t a2, _DWORD *a3)
{
  _DWORD *v6;
  _DWORD *v7;
  uint64_t v8;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<float>::__vallocate[abi:ne180100](a1, a2);
    v6 = (_DWORD *)a1[1];
    v7 = &v6[a2];
    v8 = 4 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 4;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_229593A04(_Unwind_Exception *exception_object)
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

void std::vector<SyncSeqDetector::peakInfo>::__append(void **a1, unint64_t a2)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  _DWORD *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  _DWORD *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  uint64_t v21;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_DWORD **)(v4 - 8);
  if (a2 <= (v6 - (_BYTE *)v7) >> 3)
  {
    if (a2)
    {
      v14 = &v7[2 * a2];
      do
      {
        *(_QWORD *)v7 = 0xFFFFFFFFLL;
        v7[1] = 0;
        v7 += 2;
      }
      while (v7 != v14);
      v7 = v14;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = (char *)v7 - (_BYTE *)*a1;
    v9 = a2 + (v8 >> 3);
    if (v9 >> 61)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v10 = v8 >> 3;
    v11 = v5 - (_BYTE *)*a1;
    if (v11 >> 2 > v9)
      v9 = v11 >> 2;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
      v12 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v12 = v9;
    if (v12)
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SyncSeqDetector::peakInfo>>(v4, v12);
    else
      v13 = 0;
    v15 = &v13[8 * v10];
    v16 = &v15[8 * a2];
    v17 = v15;
    do
    {
      *(_QWORD *)v17 = 0xFFFFFFFFLL;
      *((_DWORD *)v17 + 1) = 0;
      v17 += 8;
    }
    while (v17 != v16);
    v18 = &v13[8 * v12];
    v20 = (char *)*a1;
    v19 = (char *)a1[1];
    if (v19 != *a1)
    {
      do
      {
        v21 = *((_QWORD *)v19 - 1);
        v19 -= 8;
        *((_QWORD *)v15 - 1) = v21;
        v15 -= 8;
      }
      while (v19 != v20);
      v19 = (char *)*a1;
    }
    *a1 = v15;
    a1[1] = v16;
    a1[2] = v18;
    if (v19)
      operator delete(v19);
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<SyncSeqDetector::peakInfo>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

uint64_t std::deque<unsigned char>::~deque[abi:ne180100](_QWORD *a1)
{
  void **v2;
  void **v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = (void **)a1[1];
  v3 = (void **)a1[2];
  a1[5] = 0;
  v4 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      v3 = (void **)a1[2];
      v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      v4 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  v5 = v4 >> 3;
  if (v5 == 1)
  {
    v6 = 2048;
  }
  else
  {
    if (v5 != 2)
      goto LABEL_9;
    v6 = 4096;
  }
  a1[4] = v6;
LABEL_9:
  while (v2 != v3)
  {
    v7 = *v2++;
    operator delete(v7);
  }
  return std::__split_buffer<unsigned char *>::~__split_buffer((uint64_t)a1);
}

uint64_t std::__split_buffer<unsigned char *>::~__split_buffer(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)(a1 + 8);
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != v3)
    *(_QWORD *)(a1 + 16) = v2 + ((v3 - v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  v4 = *(void **)a1;
  if (*(_QWORD *)a1)
    operator delete(v4);
  return a1;
}

float std::normal_distribution<float>::operator()<std::linear_congruential_engine<unsigned int,48271u,0u,2147483647u>>(uint64_t a1, unsigned int *a2, float *a3)
{
  float v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  BOOL v9;
  unsigned int v10;
  int v11;
  unsigned int v12;
  float v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  int v17;
  float v18;
  float v19;
  float v20;
  float v21;

  if (*(_BYTE *)(a1 + 12))
  {
    *(_BYTE *)(a1 + 12) = 0;
    v5 = *(float *)(a1 + 8);
  }
  else
  {
    v6 = *a2;
    do
    {
      v7 = v6 / 0xADC8;
      v8 = 48271 * (v6 % 0xADC8);
      v7 *= 3399;
      v9 = v8 >= v7;
      v10 = v8 - v7;
      if (v9)
        v11 = 0;
      else
        v11 = 0x7FFFFFFF;
      v12 = v11 + v10;
      v13 = (float)(v12 - 1) * 4.6566e-10;
      v14 = v12 / 0xADC8;
      v15 = 48271 * (v12 % 0xADC8);
      v14 *= 3399;
      v9 = v15 >= v14;
      v16 = v15 - v14;
      if (v9)
        v17 = 0;
      else
        v17 = 0x7FFFFFFF;
      v6 = v17 + v16;
      v18 = (float)(v13 * 2.0) + -1.0;
      v19 = (float)((float)((float)(v6 - 1) * 4.6566e-10) * 2.0) + -1.0;
      v20 = (float)(v19 * v19) + (float)(v18 * v18);
    }
    while (v20 > 1.0 || v20 == 0.0);
    *a2 = v6;
    v21 = sqrtf((float)(logf((float)(v19 * v19) + (float)(v18 * v18)) * -2.0) / v20);
    *(float *)(a1 + 8) = v19 * v21;
    *(_BYTE *)(a1 + 12) = 1;
    v5 = v18 * v21;
  }
  return *a3 + (float)(v5 * a3[1]);
}

void std::deque<unsigned char>::__add_front_capacity(void **a1)
{
  _BYTE *v2;
  _BYTE *v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  int64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  int64_t v21;
  char *v22;
  unint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  char *v33;
  _QWORD *v34;
  uint64_t v35;
  void *v36;
  char *v37;
  char *v38;
  char *v39;
  uint64_t v40;
  void *v41;
  void *__p;
  char *v43;
  char *v44;
  char *v45;
  _QWORD *v46;

  v2 = a1[1];
  v3 = a1[2];
  v4 = v3 - v2;
  if (v3 == v2)
    v5 = 0;
  else
    v5 = ((v3 - v2) << 9) - 1;
  v6 = (char *)a1[4];
  if (v5 - (unint64_t)&v6[(_QWORD)a1[5]] < 0x1000)
  {
    v7 = (uint64_t)(a1 + 3);
    v8 = a1[3];
    v9 = *a1;
    v10 = v8 - (_BYTE *)*a1;
    if (v4 >= v10)
    {
      if (v8 == v9)
        v11 = 1;
      else
        v11 = v10 >> 2;
      v46 = a1 + 3;
      __p = std::__allocate_at_least[abi:ne180100]<std::allocator<SyncSeqDetector::peakInfo>>(v7, v11);
      v43 = (char *)__p;
      v44 = (char *)__p;
      v45 = (char *)__p + 8 * v12;
      v41 = operator new(0x1000uLL);
      std::__split_buffer<unsigned char *>::push_back(&__p, &v41);
      v13 = (char *)a1[1];
      v14 = v44;
      if (v13 == a1[2])
      {
        v33 = (char *)a1[1];
      }
      else
      {
        do
        {
          if (v14 == v45)
          {
            v15 = v43 - (_BYTE *)__p;
            if (v43 <= __p)
            {
              if (v14 == __p)
                v23 = 1;
              else
                v23 = (v14 - (_BYTE *)__p) >> 2;
              v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SyncSeqDetector::peakInfo>>((uint64_t)v46, v23);
              v26 = v43;
              v14 = &v24[8 * (v23 >> 2)];
              v27 = v44 - v43;
              if (v44 != v43)
              {
                v14 = &v24[8 * (v23 >> 2) + (v27 & 0xFFFFFFFFFFFFFFF8)];
                v28 = 8 * (v27 >> 3);
                v29 = &v24[8 * (v23 >> 2)];
                do
                {
                  v30 = *(_QWORD *)v26;
                  v26 += 8;
                  *(_QWORD *)v29 = v30;
                  v29 += 8;
                  v28 -= 8;
                }
                while (v28);
              }
              v31 = __p;
              __p = v24;
              v43 = &v24[8 * (v23 >> 2)];
              v44 = v14;
              v45 = &v24[8 * v25];
              if (v31)
              {
                operator delete(v31);
                v14 = v44;
              }
            }
            else
            {
              v16 = v15 >> 3;
              v17 = v15 >> 3 < -1;
              v18 = (v15 >> 3) + 2;
              if (v17)
                v19 = v18;
              else
                v19 = v16 + 1;
              v20 = &v43[-8 * (v19 >> 1)];
              v21 = v14 - v43;
              if (v14 != v43)
              {
                memmove(&v43[-8 * (v19 >> 1)], v43, v14 - v43);
                v14 = v43;
              }
              v22 = &v14[-8 * (v19 >> 1)];
              v14 = &v20[v21];
              v43 = v22;
              v44 = &v20[v21];
            }
          }
          v32 = *(_QWORD *)v13;
          v13 += 8;
          *(_QWORD *)v14 = v32;
          v14 = v44 + 8;
          v44 += 8;
        }
        while (v13 != a1[2]);
        v33 = (char *)a1[1];
      }
      v36 = *a1;
      v37 = v43;
      *a1 = __p;
      a1[1] = v37;
      __p = v36;
      v43 = v33;
      v38 = (char *)a1[3];
      v39 = v45;
      a1[2] = v14;
      a1[3] = v39;
      v44 = v13;
      v45 = v38;
      if (v14 - v37 == 8)
        v40 = 2048;
      else
        v40 = (uint64_t)a1[4] + 4096;
      a1[4] = (void *)v40;
      if (v13 != v33)
        v44 = &v13[(v33 - v13 + 7) & 0xFFFFFFFFFFFFFFF8];
      if (v36)
        operator delete(v36);
    }
    else
    {
      if (v2 == v9)
      {
        __p = operator new(0x1000uLL);
        std::__split_buffer<unsigned char *>::push_back(a1, &__p);
        v34 = a1[2];
        __p = (void *)*(v34 - 1);
        a1[2] = v34 - 1;
      }
      else
      {
        __p = operator new(0x1000uLL);
      }
      std::__split_buffer<unsigned char *>::push_front((uint64_t)a1, &__p);
      if ((_BYTE *)a1[2] - (_BYTE *)a1[1] == 8)
        v35 = 2048;
      else
        v35 = (uint64_t)a1[4] + 4096;
      a1[4] = (void *)v35;
    }
  }
  else
  {
    a1[4] = v6 + 4096;
    __p = (void *)*((_QWORD *)v3 - 1);
    a1[2] = v3 - 8;
    std::__split_buffer<unsigned char *>::push_front((uint64_t)a1, &__p);
  }
}

void sub_229594258(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  void *v12;

  operator delete(v12);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void std::__split_buffer<unsigned char *>::push_front(uint64_t a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;

  v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    v6 = a1 + 24;
    v7 = *(_BYTE **)(a1 + 24);
    v8 = *(_BYTE **)(a1 + 16);
    if (v8 >= v7)
    {
      if (v7 == v4)
        v12 = 1;
      else
        v12 = (v7 - v4) >> 2;
      v13 = 2 * v12;
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SyncSeqDetector::peakInfo>>(v6, v12);
      v5 = &v14[(v13 + 6) & 0xFFFFFFFFFFFFFFF8];
      v16 = *(uint64_t **)(a1 + 8);
      v17 = v5;
      v18 = *(_QWORD *)(a1 + 16) - (_QWORD)v16;
      if (v18)
      {
        v17 = &v5[v18 & 0xFFFFFFFFFFFFFFF8];
        v19 = 8 * (v18 >> 3);
        v20 = v5;
        do
        {
          v21 = *v16++;
          *(_QWORD *)v20 = v21;
          v20 += 8;
          v19 -= 8;
        }
        while (v19);
      }
      v22 = *(char **)a1;
      *(_QWORD *)a1 = v14;
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v17;
      *(_QWORD *)(a1 + 24) = &v14[8 * v15];
      if (v22)
      {
        operator delete(v22);
        v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      v9 = (v7 - v8) >> 3;
      if (v9 >= -1)
        v10 = v9 + 1;
      else
        v10 = v9 + 2;
      v11 = v10 >> 1;
      v5 = &v4[8 * (v10 >> 1)];
      if (v8 != v4)
      {
        memmove(&v4[8 * (v10 >> 1)], v4, v8 - v4);
        v4 = *(char **)(a1 + 16);
      }
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = &v4[8 * v11];
    }
  }
  else
  {
    v5 = *(char **)(a1 + 8);
  }
  *((_QWORD *)v5 - 1) = *a2;
  *(_QWORD *)(a1 + 8) -= 8;
}

{
  char *v4;
  char *v5;
  _BYTE *v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;

  v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    v6 = *(_BYTE **)(a1 + 16);
    v7 = *(_BYTE **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4)
        v11 = 1;
      else
        v11 = (v7 - v4) >> 2;
      v12 = 2 * v11;
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SyncSeqDetector::peakInfo>>(*(_QWORD *)(a1 + 32), v11);
      v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8];
      v15 = *(uint64_t **)(a1 + 8);
      v16 = v5;
      v17 = *(_QWORD *)(a1 + 16) - (_QWORD)v15;
      if (v17)
      {
        v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8];
        v18 = 8 * (v17 >> 3);
        v19 = v5;
        do
        {
          v20 = *v15++;
          *(_QWORD *)v19 = v20;
          v19 += 8;
          v18 -= 8;
        }
        while (v18);
      }
      v21 = *(char **)a1;
      *(_QWORD *)a1 = v13;
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v16;
      *(_QWORD *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      v8 = (v7 - v6) >> 3;
      if (v8 >= -1)
        v9 = v8 + 1;
      else
        v9 = v8 + 2;
      v10 = v9 >> 1;
      v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        v4 = *(char **)(a1 + 16);
      }
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = &v4[8 * v10];
    }
  }
  else
  {
    v5 = *(char **)(a1 + 8);
  }
  *((_QWORD *)v5 - 1) = *a2;
  *(_QWORD *)(a1 + 8) -= 8;
}

void std::__split_buffer<unsigned char *>::push_back(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int64_t v16;
  char *v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;

  v5 = (char *)a1[3];
  v4 = (uint64_t)(a1 + 3);
  v6 = *(char **)(v4 - 8);
  if (v6 == v5)
  {
    v7 = (char *)a1[1];
    v8 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1)
        v18 = 1;
      else
        v18 = (uint64_t)&v6[-*a1] >> 2;
      v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SyncSeqDetector::peakInfo>>(v4, v18);
      v21 = &v19[8 * (v18 >> 2)];
      v22 = (uint64_t *)a1[1];
      v6 = v21;
      v23 = a1[2] - (_QWORD)v22;
      if (v23)
      {
        v6 = &v21[v23 & 0xFFFFFFFFFFFFFFF8];
        v24 = 8 * (v23 >> 3);
        v25 = &v19[8 * (v18 >> 2)];
        do
        {
          v26 = *v22++;
          *(_QWORD *)v25 = v26;
          v25 += 8;
          v24 -= 8;
        }
        while (v24);
      }
      v27 = (char *)*a1;
      *a1 = v19;
      a1[1] = v21;
      a1[2] = v6;
      a1[3] = &v19[8 * v20];
      if (v27)
      {
        operator delete(v27);
        v6 = (char *)a1[2];
      }
    }
    else
    {
      v9 = v8 >> 3;
      v10 = v8 >> 3 < -1;
      v11 = (v8 >> 3) + 2;
      if (v10)
        v12 = v11;
      else
        v12 = v9 + 1;
      v13 = -(v12 >> 1);
      v14 = v12 >> 1;
      v15 = &v7[-8 * v14];
      v16 = v6 - v7;
      if (v6 != v7)
      {
        memmove(&v7[-8 * v14], v7, v6 - v7);
        v6 = (char *)a1[1];
      }
      v17 = &v6[8 * v13];
      v6 = &v15[v16];
      a1[1] = v17;
      a1[2] = &v15[v16];
    }
  }
  *(_QWORD *)v6 = *a2;
  a1[2] += 8;
}

{
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int64_t v14;
  char *v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;

  v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    v5 = (char *)a1[1];
    v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      if (v4 == (char *)*a1)
        v16 = 1;
      else
        v16 = (uint64_t)&v4[-*a1] >> 2;
      v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SyncSeqDetector::peakInfo>>(a1[4], v16);
      v19 = &v17[8 * (v16 >> 2)];
      v20 = (uint64_t *)a1[1];
      v4 = v19;
      v21 = a1[2] - (_QWORD)v20;
      if (v21)
      {
        v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8];
        v22 = 8 * (v21 >> 3);
        v23 = &v17[8 * (v16 >> 2)];
        do
        {
          v24 = *v20++;
          *(_QWORD *)v23 = v24;
          v23 += 8;
          v22 -= 8;
        }
        while (v22);
      }
      v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        v4 = (char *)a1[2];
      }
    }
    else
    {
      v7 = v6 >> 3;
      v8 = v6 >> 3 < -1;
      v9 = (v6 >> 3) + 2;
      if (v8)
        v10 = v9;
      else
        v10 = v7 + 1;
      v11 = -(v10 >> 1);
      v12 = v10 >> 1;
      v13 = &v5[-8 * v12];
      v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        v4 = (char *)a1[1];
      }
      v15 = &v4[8 * v11];
      v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }
  *(_QWORD *)v4 = *a2;
  a1[2] += 8;
}

void **std::deque<unsigned char>::__move_and_check(int a1, char *a2, char *__src, char *a4, char *a5, void **a6, char *__dst, unint64_t *a8)
{
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v19;
  char *v20;
  char *v21;
  char *v22;
  uint64_t v23;
  size_t v24;
  char *v25;
  uint64_t v26;
  unint64_t v27;
  BOOL v28;

  if (a5 != __src)
  {
    v10 = __src;
    v11 = a2;
    v12 = &a5[512 * (a4 - a2)] - __src - *(_QWORD *)a4 + *(_QWORD *)a2;
    if (v12 >= 1)
    {
      while (1)
      {
        v14 = *(_QWORD *)v11 + 4096;
        if (v14 - (uint64_t)v10 >= v12)
          v15 = v12;
        else
          v15 = v14 - (_QWORD)v10;
        if (v14 - (uint64_t)v10 <= v12)
          v16 = *(_QWORD *)v11 + 4096;
        else
          v16 = (unint64_t)&v10[v12];
        v17 = *a8;
        if ((unint64_t)v10 <= *a8 && v17 < v16)
        {
          if (v10 != __dst && __dst - v10 + (((char *)a6 - v11) << 9) + *(_QWORD *)v11 != (_QWORD)*a6)
          {
            v19 = __dst - v10 + (((char *)a6 - v11) << 9) - (_QWORD)*a6 + v17;
            if (v19 < 1)
              v17 = *(_QWORD *)&v11[-8 * ((unint64_t)(4095 - v19) >> 12)] + (~(4095 - (_WORD)v19) & 0xFFF);
            else
              v17 = *(_QWORD *)&v11[((unint64_t)v19 >> 9) & 0x7FFFFFFFFFFFF8] + (v19 & 0xFFF);
          }
          *a8 = v17;
        }
        if (v10 == (char *)v16)
          goto LABEL_30;
        v21 = (char *)*a6++;
        v20 = v21;
        v22 = v10;
        while (1)
        {
          v23 = v20 - __dst + 4096;
          v24 = (uint64_t)(v16 - (_QWORD)v22) >= v23 ? v23 : v16 - (_QWORD)v22;
          if (v24)
            memmove(__dst, v22, v24);
          v22 += v24;
          if (v22 == (char *)v16)
            break;
          v25 = (char *)*a6++;
          v20 = v25;
          __dst = v25;
        }
        __dst += v24;
        if ((char *)*(a6 - 1) + 4096 != __dst)
          break;
        __dst = (char *)*a6;
        if (v15)
        {
LABEL_31:
          v26 = (uint64_t)&v10[v15 - *(_QWORD *)v11];
          if (v26 < 1)
          {
            v27 = 4095 - v26;
            v11 -= 8 * (v27 >> 12);
            v10 = (char *)(*(_QWORD *)v11 + (~(_WORD)v27 & 0xFFF));
          }
          else
          {
            v11 += 8 * ((unint64_t)v26 >> 12);
            v10 = (char *)(*(_QWORD *)v11 + (v26 & 0xFFF));
          }
        }
LABEL_36:
        v28 = v12 <= v15;
        v12 -= v15;
        if (v28)
          return a6;
      }
      --a6;
LABEL_30:
      if (v15)
        goto LABEL_31;
      goto LABEL_36;
    }
  }
  return a6;
}

_QWORD *std::__deque_iterator<unsigned char,unsigned char *,unsigned char &,unsigned char **,long,4096l>::operator+[abi:ne180100](uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v4;

  result = *(_QWORD **)a1;
  if (a2)
  {
    v4 = *(_QWORD *)(a1 + 8) - *result + a2;
    if (v4 < 1)
      result -= (unint64_t)(4095 - v4) >> 12;
    else
      result += (unint64_t)v4 >> 12;
  }
  return result;
}

void std::deque<unsigned char>::__add_back_capacity(_QWORD *a1)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  char *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  unint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  _QWORD *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  _QWORD *v56;

  v2 = a1[4];
  v3 = v2 >= 0x1000;
  v4 = v2 - 4096;
  if (v3)
  {
    v5 = (uint64_t)(a1 + 3);
    v6 = (char *)a1[3];
    a1[4] = v4;
    v7 = (_QWORD *)a1[1];
    v8 = (char *)a1[2];
    v11 = *v7;
    v9 = (char *)(v7 + 1);
    v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(_QWORD *)v8 = v10;
      a1[2] += 8;
      return;
    }
    v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1)
        v33 = 1;
      else
        v33 = (uint64_t)&v8[-*a1] >> 2;
      v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SyncSeqDetector::peakInfo>>(v5, v33);
      v35 = &v34[8 * (v33 >> 2)];
      v37 = &v34[8 * v36];
      v38 = (uint64_t *)a1[1];
      v8 = v35;
      v39 = a1[2] - (_QWORD)v38;
      if (v39)
      {
        v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        v40 = 8 * (v39 >> 3);
        v41 = &v34[8 * (v33 >> 2)];
        do
        {
          v42 = *v38++;
          *(_QWORD *)v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    v13 = v12 >> 3;
    v14 = v12 >> 3 < -1;
    v15 = (v12 >> 3) + 2;
    if (v14)
      v16 = v15;
    else
      v16 = v13 + 1;
    v17 = -(v16 >> 1);
    v18 = v16 >> 1;
    v19 = &v9[-8 * v18];
    v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      v9 = (char *)a1[1];
    }
    v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  v21 = a1[2];
  v22 = (v21 - a1[1]) >> 3;
  v23 = a1[3];
  v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(_QWORD *)&v54 = operator new(0x1000uLL);
      std::__split_buffer<unsigned char *>::push_back(a1, &v54);
      return;
    }
    *(_QWORD *)&v54 = operator new(0x1000uLL);
    std::__split_buffer<unsigned char *>::push_front((uint64_t)a1, &v54);
    v44 = (_QWORD *)a1[1];
    v8 = (char *)a1[2];
    v45 = *v44;
    v9 = (char *)(v44 + 1);
    v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3])
      goto LABEL_33;
    v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1)
        v46 = 1;
      else
        v46 = (uint64_t)&v8[-*a1] >> 2;
      v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SyncSeqDetector::peakInfo>>((uint64_t)(a1 + 3), v46);
      v35 = &v34[8 * (v46 >> 2)];
      v37 = &v34[8 * v47];
      v48 = (uint64_t *)a1[1];
      v8 = v35;
      v49 = a1[2] - (_QWORD)v48;
      if (v49)
      {
        v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        v50 = 8 * (v49 >> 3);
        v51 = &v34[8 * (v46 >> 2)];
        do
        {
          v52 = *v48++;
          *(_QWORD *)v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1)
    v25 = 1;
  else
    v25 = v24 >> 2;
  v56 = a1 + 3;
  *(_QWORD *)&v54 = std::__allocate_at_least[abi:ne180100]<std::allocator<SyncSeqDetector::peakInfo>>((uint64_t)(a1 + 3), v25);
  *((_QWORD *)&v54 + 1) = v54 + 8 * v22;
  *(_QWORD *)&v55 = *((_QWORD *)&v54 + 1);
  *((_QWORD *)&v55 + 1) = v54 + 8 * v26;
  v53 = operator new(0x1000uLL);
  std::__split_buffer<unsigned char *>::push_back(&v54, &v53);
  v27 = (_QWORD *)a1[2];
  v28 = -7 - (_QWORD)v27;
  while (v27 != (_QWORD *)a1[1])
  {
    --v27;
    v28 += 8;
    std::__split_buffer<unsigned char *>::push_front((uint64_t)&v54, v27);
  }
  v29 = (char *)*a1;
  v30 = v54;
  v31 = v55;
  *(_QWORD *)&v54 = *a1;
  *((_QWORD *)&v54 + 1) = v27;
  v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  v55 = v32;
  if (v27 != (_QWORD *)v32)
    *(_QWORD *)&v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  if (v29)
    operator delete(v29);
}

void sub_229594B00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  void *v13;

  operator delete(v13);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

char *std::deque<unsigned char>::__move_backward_and_check(uint64_t a1, char *a2, char *a3, char *a4, char *a5, char *a6, char *a7, unint64_t *a8)
{
  char *v10;
  char *v11;
  uint64_t v12;
  char *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  char *v18;
  unint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  size_t v25;
  uint64_t v26;
  char *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;

  if (a5 != a3)
  {
    v10 = a5;
    v11 = a4;
    v12 = &a5[512 * (a4 - a2)] - a3 - *(_QWORD *)a4 + *(_QWORD *)a2;
    if (v12 >= 1)
    {
      while (1)
      {
        v14 = *(char **)v11;
        if (v10 == *(char **)v11)
        {
          v15 = (char *)*((_QWORD *)v11 - 1);
          v11 -= 8;
          v14 = v15;
          v10 = v15 + 4096;
        }
        v16 = v10 - 1;
        if (v10 - v14 >= v12)
          v17 = v12;
        else
          v17 = v10 - v14;
        if (v10 - v14 <= v12)
          v18 = v14;
        else
          v18 = &v10[-v12];
        v19 = *a8;
        v20 = *a8 >= (unint64_t)v10 || (unint64_t)v18 > v19;
        if (v20)
          goto LABEL_23;
        if (v16 == a7)
          break;
        v21 = (uint64_t)&a7[512 * (a6 - v11) + v14 - v10 - *(_QWORD *)a6];
        if (v21)
          goto LABEL_19;
LABEL_22:
        *a8 = v19;
LABEL_23:
        if (v18 != v10)
        {
          v23 = *(_QWORD *)a6;
          while (1)
          {
            v24 = &a7[-v23];
            if (v10 - v18 >= (uint64_t)v24)
              v25 = (size_t)v24;
            else
              v25 = v10 - v18;
            v10 -= v25;
            a7 -= v25;
            if (v25)
              memmove(a7, v10, v25);
            if (v10 == v18)
              break;
            v26 = *((_QWORD *)a6 - 1);
            a6 -= 8;
            v23 = v26;
            a7 = (char *)(v26 + 4096);
          }
          if ((char *)(*(_QWORD *)a6 + 4096) == a7)
          {
            v27 = (char *)*((_QWORD *)a6 + 1);
            a6 += 8;
            a7 = v27;
          }
        }
        if (v17 != 1)
        {
          v28 = (unint64_t)&v16[-*(_QWORD *)v11 - v17];
          if (v28 > 0x7FFFFFFFFFFFFFFELL)
          {
            v30 = 4094 - v28;
            v11 -= 8 * (v30 >> 12);
            v16 = (char *)(*(_QWORD *)v11 + (~(_WORD)v30 & 0xFFF));
          }
          else
          {
            v29 = v28 + 1;
            v11 += 8 * (v29 >> 12);
            v16 = (char *)(*(_QWORD *)v11 + (v29 & 0xFFF));
          }
        }
        v10 = v16;
        v20 = v12 <= v17;
        v12 -= v17;
        if (v20)
          return a6;
      }
      v21 = -1;
LABEL_19:
      v22 = v21 + v19 - (_QWORD)v14;
      if (v22 < 1)
        v19 = *(_QWORD *)&v11[-8 * ((unint64_t)(4095 - v22) >> 12)] + (~(4095 - (_WORD)v22) & 0xFFF);
      else
        v19 = *(_QWORD *)&v11[((unint64_t)v22 >> 9) & 0x7FFFFFFFFFFFF8] + (v22 & 0xFFF);
      goto LABEL_22;
    }
  }
  return a6;
}

_QWORD *std::__deque_iterator<unsigned char,unsigned char *,unsigned char &,unsigned char **,long,4096l>::operator-[abi:ne180100](uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v4;

  result = *(_QWORD **)a1;
  if (a2)
  {
    v4 = *(_QWORD *)(a1 + 8) - a2 - *result;
    if (v4 < 1)
      result -= (unint64_t)(4095 - v4) >> 12;
    else
      result += (unint64_t)v4 >> 12;
  }
  return result;
}

uint64_t (**std::any_cast[abi:ne180100]<float const>(uint64_t (**result)(uint64_t, _QWORD, _QWORD, _QWORD, void *)))(uint64_t, _QWORD, _QWORD, _QWORD, void *)
{
  if (result)
  {
    if (*result)
      return (uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(*result)(3, result, 0, MEMORY[0x24BEDB788], &std::__any_imp::__unique_typeinfo<float>::__id);
    else
      return 0;
  }
  return result;
}

uint64_t (**std::any_cast[abi:ne180100]<unsigned int const>(uint64_t (**result)(uint64_t, _QWORD, _QWORD, _QWORD, void *)))(uint64_t, _QWORD, _QWORD, _QWORD, void *)
{
  if (result)
  {
    if (*result)
      return (uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(*result)(3, result, 0, MEMORY[0x24BEDB7A0], &std::__any_imp::__unique_typeinfo<unsigned int>::__id);
    else
      return 0;
  }
  return result;
}

uint64_t (**std::any_cast[abi:ne180100]<BOOL const>(uint64_t (**result)(uint64_t, _QWORD, _QWORD, _QWORD, void *)))(uint64_t, _QWORD, _QWORD, _QWORD, void *)
{
  if (result)
  {
    if (*result)
      return (uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(*result)(3, result, 0, MEMORY[0x24BEDB770], &std::__any_imp::__unique_typeinfo<BOOL>::__id);
    else
      return 0;
  }
  return result;
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x22E2CB548);
}

void sub_2295955D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void BufferedAudioBus::init(BufferedAudioBus *this, AVAudioFormat *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  AVAudioFormat *v8;

  v8 = a2;
  *((_DWORD *)this + 2) = 0;
  v5 = (void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;

  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 4) = 0;
  v6 = objc_msgSend(objc_alloc(MEMORY[0x24BE0A838]), "initWithFormat:error:", v8, 0);
  v7 = *(void **)this;
  *(_QWORD *)this = v6;

  objc_msgSend(*(id *)this, "setMaximumChannelCount:", a3);
}

void sub_2295956E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_229595E88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a19)
  {
    if (a18 < 0)
      operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t BufferedAudioBus::allocateRenderResources(BufferedAudioBus *this, int a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t result;

  *((_DWORD *)this + 2) = a2;
  v3 = objc_alloc(MEMORY[0x24BDB1838]);
  objc_msgSend(*(id *)this, "format");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "initWithPCMFormat:frameCapacity:", v4, *((unsigned int *)this + 2));
  v6 = (void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = v5;

  *((_QWORD *)this + 3) = objc_msgSend(*((id *)this + 2), "audioBufferList");
  result = objc_msgSend(*((id *)this + 2), "mutableAudioBufferList");
  *((_QWORD *)this + 4) = result;
  return result;
}

void sub_22959600C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t std::make_unique[abi:ne180100]<caulk::concurrent::messenger,caulk::concurrent::messenger::thread_strategy,caulk::thread::attributes const&>@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  uint64_t result;

  v6 = operator new();
  result = MEMORY[0x22E2CB4AC](v6, *a1, a2);
  *a3 = v6;
  return result;
}

void sub_229596074(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x22E2CB548](v1, 0x20C40A4A59CD2);
  _Unwind_Resume(a1);
}

void sub_2295963FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t BufferedInputBus::pullInput(BufferedInputBus *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t (**v11)(id, uint64_t, uint64_t, uint64_t, uint64_t, AudioBufferList *);
  uint64_t v12;

  v11 = a6;
  if (v11)
  {
    BufferedInputBus::prepareInputBufferList(a1);
    v12 = v11[2](v11, a2, a3, a4, a5, a1->mutableAudioBufferList);
  }
  else
  {
    v12 = 4294956420;
  }

  return v12;
}

void sub_2295964A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2295965C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22959661C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_22959673C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
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

void std::__throw_bad_optional_access[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = MEMORY[0x24BEDB8E0] + 16;
  __cxa_throw(exception, MEMORY[0x24BEDB740], MEMORY[0x24BEDABA8]);
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string *v5;
  std::string::size_type v6;
  std::string::size_type v7;
  std::string *v8;

  v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17)
      v6 = __sz | 7;
    v7 = v6 + 1;
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    v5 = v8;
  }
  else
  {
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

BufferedInputBus *BufferedInputBus::prepareInputBufferList(BufferedInputBus *this)
{
  unsigned int maxFrames;
  AudioBufferList *originalAudioBufferList;
  AudioBufferList *mutableAudioBufferList;
  uint64_t mNumberBuffers;
  int v5;
  void **p_mData;
  void **v7;
  int v8;
  void *v9;

  maxFrames = this->maxFrames;
  originalAudioBufferList = this->originalAudioBufferList;
  mutableAudioBufferList = this->mutableAudioBufferList;
  mutableAudioBufferList->mNumberBuffers = originalAudioBufferList->mNumberBuffers;
  mNumberBuffers = originalAudioBufferList->mNumberBuffers;
  if ((_DWORD)mNumberBuffers)
  {
    v5 = 4 * maxFrames;
    p_mData = &originalAudioBufferList->mBuffers[0].mData;
    v7 = &mutableAudioBufferList->mBuffers[0].mData;
    do
    {
      v8 = *((_DWORD *)p_mData - 2);
      v9 = *p_mData;
      p_mData += 2;
      *v7 = v9;
      *((_DWORD *)v7 - 2) = v8;
      *((_DWORD *)v7 - 1) = v5;
      v7 += 2;
      --mNumberBuffers;
    }
    while (mNumberBuffers);
  }
  return this;
}

void DecodedDataMessage::DecodedDataMessage(DecodedDataMessage *this, AUPasscodeDecoder *a2)
{
  AUPasscodeDecoder *v3;
  AUPasscodeDecoder *v4;

  v3 = a2;
  *((_DWORD *)this + 4) = 0;
  *(_QWORD *)this = &off_24F24BAF8;
  *((_QWORD *)this + 1) = 0;
  v4 = v3;
  *((_QWORD *)this + 3) = v4;
  std::vector<unsigned char>::vector((_QWORD *)this + 4, 0x100uLL);
  *((_DWORD *)this + 14) = 0;
  *((_BYTE *)this + 60) = 0;

}

void sub_229596CC4(_Unwind_Exception *a1)
{
  id *v1;
  void *v2;

  caulk::concurrent::message::~message((caulk::concurrent::message *)v1);
  _Unwind_Resume(a1);
}

void DecodedDataMessage::~DecodedDataMessage(DecodedDataMessage *this)
{
  void *v2;

  v2 = (void *)*((_QWORD *)this + 4);
  if (v2)
  {
    *((_QWORD *)this + 5) = v2;
    operator delete(v2);
  }

  caulk::concurrent::message::~message((caulk::concurrent::message *)this);
}

{
  void *v2;

  v2 = (void *)*((_QWORD *)this + 4);
  if (v2)
  {
    *((_QWORD *)this + 5) = v2;
    operator delete(v2);
  }

  caulk::concurrent::message::~message((caulk::concurrent::message *)this);
  JUMPOUT(0x22E2CB548);
}

uint64_t DecodedDataMessage::perform(DecodedDataMessage *this)
{
  *((_BYTE *)this + 60) = 0;
  return objc_msgSend(*((id *)this + 3), "handleDecodedData:ofLength:", *((_QWORD *)this + 4), *((unsigned int *)this + 14));
}

_QWORD *std::vector<unsigned char>::vector(_QWORD *a1, size_t a2)
{
  char *v4;
  char *v5;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<unsigned char>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    v5 = &v4[a2];
    bzero(v4, a2);
    a1[1] = v5;
  }
  return a1;
}

void sub_229596DD0(_Unwind_Exception *exception_object)
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

void std::default_delete<DecodedDataMessage>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v3;

  if (a2)
  {
    v3 = *(void **)(a2 + 32);
    if (v3)
    {
      *(_QWORD *)(a2 + 40) = v3;
      operator delete(v3);
    }

    caulk::concurrent::message::~message((caulk::concurrent::message *)a2);
    JUMPOUT(0x22E2CB548);
  }
}

uint64_t std::unique_ptr<caulk::concurrent::messenger>::reset[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    MEMORY[0x22E2CB4B8]();
    JUMPOUT(0x22E2CB548);
  }
  return result;
}

void sub_229597330(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_2295976D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

void sub_229597C60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id *v19;
  void *v20;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_229597D54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_229597E1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_229597F84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_229598014(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22959825C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2295983C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_229598630(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2295986D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2295988A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_229598A1C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_229598D7C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v9 = v6;

  _Unwind_Resume(a1);
}

void sub_229598F6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_229598FF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_229599140(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_2295992A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_229599348(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_229599500(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2295996A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_229599744(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2295997E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_2295998A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_229599958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_22959A134(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,char a23)
{
  void *v23;
  void *v24;

  if (a23)
  {
    if (a22 < 0)
      operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_22959A2E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22959AC04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_22959B01C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22959B410(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void EOFReachedMessage::~EOFReachedMessage(EOFReachedMessage *this)
{

  caulk::concurrent::message::~message((caulk::concurrent::message *)this);
}

{

  caulk::concurrent::message::~message((caulk::concurrent::message *)this);
  JUMPOUT(0x22E2CB548);
}

uint64_t EOFReachedMessage::perform(EOFReachedMessage *this)
{
  return objc_msgSend(*((id *)this + 3), "handleEOFReachedForAsset");
}

void std::default_delete<EOFReachedMessage>::operator()[abi:ne180100](uint64_t a1, id *a2)
{
  if (a2)
  {

    caulk::concurrent::message::~message((caulk::concurrent::message *)a2);
    JUMPOUT(0x22E2CB548);
  }
}

void sub_22959BF84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

OpaqueExtAudioFile *std::unique_ptr<OpaqueExtAudioFile,applesauce::raii::v1::detail::opaque_deletion_functor<OpaqueExtAudioFile*,&(ExtAudioFileDispose)>>::reset[abi:ne180100](OpaqueExtAudioFile **a1, OpaqueExtAudioFile *a2)
{
  OpaqueExtAudioFile *result;

  result = *a1;
  *a1 = a2;
  if (result)
    return (OpaqueExtAudioFile *)ExtAudioFileDispose(result);
  return result;
}

void sub_22959C23C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  __cxa_free_exception(v2);

  _Unwind_Resume(a1);
}

void sub_22959C348(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_22959C58C(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

char *std::vector<float>::assign(char **a1, unint64_t a2, _DWORD *a3)
{
  uint64_t v6;
  char *result;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;

  v6 = (uint64_t)a1[2];
  result = *a1;
  if (a2 <= (v6 - (uint64_t)result) >> 2)
  {
    v13 = a1[1];
    v14 = (v13 - result) >> 2;
    if (v14 >= a2)
      v15 = a2;
    else
      v15 = (v13 - result) >> 2;
    if (v15)
    {
      v16 = result;
      do
      {
        *(_DWORD *)v16 = *a3;
        v16 += 4;
        --v15;
      }
      while (v15);
    }
    if (a2 <= v14)
    {
      a1[1] = &result[4 * a2];
    }
    else
    {
      v17 = &v13[4 * (a2 - v14)];
      v18 = 4 * a2 - 4 * v14;
      do
      {
        *(_DWORD *)v13 = *a3;
        v13 += 4;
        v18 -= 4;
      }
      while (v18);
      a1[1] = v17;
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      v6 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a2 >> 62)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v8 = v6 >> 1;
    if (v6 >> 1 <= a2)
      v8 = a2;
    if ((unint64_t)v6 >= 0x7FFFFFFFFFFFFFFCLL)
      v9 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v9 = v8;
    result = std::vector<float>::__vallocate[abi:ne180100](a1, v9);
    v10 = a1[1];
    v11 = &v10[4 * a2];
    v12 = 4 * a2;
    do
    {
      *(_DWORD *)v10 = *a3;
      v10 += 4;
      v12 -= 4;
    }
    while (v12);
    a1[1] = v11;
  }
  return result;
}

std::vector<char> *__cdecl std::vector<char>::vector(std::vector<char> *this, std::vector<char>::size_type __n, const std::vector<char>::value_type *__x)
{
  std::vector<char>::size_type v5;
  std::vector<char>::pointer end;
  char *v7;

  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  if (__n)
  {
    v5 = __n;
    std::vector<unsigned char>::__vallocate[abi:ne180100](this, __n);
    end = this->__end_;
    v7 = &end[v5];
    do
    {
      *end++ = *__x;
      --v5;
    }
    while (v5);
    this->__end_ = v7;
  }
  return this;
}

void sub_22959C834(_Unwind_Exception *exception_object)
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

void EchoEmbedder::EchoEmbedder(void **a1, void **a2, uint64_t a3)
{
  void *v5;
  void *v6;

  v5 = *a1;
  if (v5)
  {
    *(_QWORD *)(a3 + 72) = v5;
    operator delete(v5);
  }
  v6 = *a2;
  if (*a2)
  {
    *(_QWORD *)(a3 + 48) = v6;
    operator delete(v6);
  }
}

OSStatus AudioUnitSetProperty(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitScope inScope, AudioUnitElement inElement, const void *inData, UInt32 inDataSize)
{
  return MEMORY[0x24BE0A798](inUnit, *(_QWORD *)&inID, *(_QWORD *)&inScope, *(_QWORD *)&inElement, inData, *(_QWORD *)&inDataSize);
}

OSStatus ExtAudioFileCreateWithURL(CFURLRef inURL, AudioFileTypeID inFileType, const AudioStreamBasicDescription *inStreamDesc, const AudioChannelLayout *inChannelLayout, UInt32 inFlags, ExtAudioFileRef *outExtAudioFile)
{
  return MEMORY[0x24BE0A7A8](inURL, *(_QWORD *)&inFileType, inStreamDesc, inChannelLayout, *(_QWORD *)&inFlags, outExtAudioFile);
}

OSStatus ExtAudioFileDispose(ExtAudioFileRef inExtAudioFile)
{
  return MEMORY[0x24BE0A7B0](inExtAudioFile);
}

OSStatus ExtAudioFileGetProperty(ExtAudioFileRef inExtAudioFile, ExtAudioFilePropertyID inPropertyID, UInt32 *ioPropertyDataSize, void *outPropertyData)
{
  return MEMORY[0x24BE0A7B8](inExtAudioFile, *(_QWORD *)&inPropertyID, ioPropertyDataSize, outPropertyData);
}

OSStatus ExtAudioFileOpenURL(CFURLRef inURL, ExtAudioFileRef *outExtAudioFile)
{
  return MEMORY[0x24BE0A7C0](inURL, outExtAudioFile);
}

OSStatus ExtAudioFileRead(ExtAudioFileRef inExtAudioFile, UInt32 *ioNumberFrames, AudioBufferList *ioData)
{
  return MEMORY[0x24BE0A7C8](inExtAudioFile, ioNumberFrames, ioData);
}

OSStatus ExtAudioFileSeek(ExtAudioFileRef inExtAudioFile, SInt64 inFrameOffset)
{
  return MEMORY[0x24BE0A7D0](inExtAudioFile, inFrameOffset);
}

OSStatus ExtAudioFileSetProperty(ExtAudioFileRef inExtAudioFile, ExtAudioFilePropertyID inPropertyID, UInt32 inPropertyDataSize, const void *inPropertyData)
{
  return MEMORY[0x24BE0A7D8](inExtAudioFile, *(_QWORD *)&inPropertyID, *(_QWORD *)&inPropertyDataSize, inPropertyData);
}

OSStatus ExtAudioFileTell(ExtAudioFileRef inExtAudioFile, SInt64 *outFrameOffset)
{
  return MEMORY[0x24BE0A7E0](inExtAudioFile, outFrameOffset);
}

OSStatus ExtAudioFileWrite(ExtAudioFileRef inExtAudioFile, UInt32 inNumberFrames, const AudioBufferList *ioData)
{
  return MEMORY[0x24BE0A7F0](inExtAudioFile, *(_QWORD *)&inNumberFrames, ioData);
}

uint64_t MGGetProductType()
{
  return MEMORY[0x24BED8488]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void caulk::concurrent::message::~message(caulk::concurrent::message *this)
{
  MEMORY[0x24BEC6D98](this);
}

uint64_t caulk::concurrent::messenger::shared_logging_priority(caulk::concurrent::messenger *this)
{
  return MEMORY[0x24BEC6DA8](this);
}

uint64_t caulk::concurrent::messenger::enqueue(caulk::concurrent::messenger *this, caulk::concurrent::message *a2)
{
  return MEMORY[0x24BEC6DB8](this, a2);
}

uint64_t caulk::concurrent::messenger::messenger()
{
  return MEMORY[0x24BEC6DC0]();
}

void caulk::concurrent::messenger::~messenger(caulk::concurrent::messenger *this)
{
  MEMORY[0x24BEC6DD0](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

void std::mutex::lock(std::mutex *this)
{
  MEMORY[0x24BEDB368](this);
}

void std::mutex::unlock(std::mutex *this)
{
  MEMORY[0x24BEDB370](this);
}

void std::mutex::~mutex(std::mutex *this)
{
  MEMORY[0x24BEDB380](this);
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x24BEDB3F0]();
}

std::bad_cast *__cdecl std::bad_cast::bad_cast(std::bad_cast *this)
{
  return (std::bad_cast *)MEMORY[0x24BEDB648](this);
}

void std::bad_cast::~bad_cast(std::bad_cast *this)
{
  MEMORY[0x24BEDB658](this);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x24BEDB688](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24F24AFD0(__p);
}

uint64_t operator delete()
{
  return off_24F24AFD8();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24F24AFE0(__sz);
}

uint64_t operator new()
{
  return off_24F24AFE8();
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

float __exp10f(float a1)
{
  float result;

  MEMORY[0x24BDAC7E0](a1);
  return result;
}

uint64_t __udivti3()
{
  return MEMORY[0x24BDAC940]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
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

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

float expf(float a1)
{
  float result;

  MEMORY[0x24BDAE288](a1);
  return result;
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
}

float log10f(float a1)
{
  float result;

  MEMORY[0x24BDAEAB8](a1);
  return result;
}

float logf(float a1)
{
  float result;

  MEMORY[0x24BDAEAF8](a1);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

void vDSP_biquad(const vDSP_biquad_SetupStruct *__Setup, float *__Delay, const float *__X, vDSP_Stride __IX, float *__Y, vDSP_Stride __IY, vDSP_Length __N)
{
  MEMORY[0x24BDB3130](__Setup, __Delay, __X, __IX, __Y, __IY, __N);
}

vDSP_biquad_Setup vDSP_biquad_CreateSetup(const double *__Coefficients, vDSP_Length __M)
{
  return (vDSP_biquad_Setup)MEMORY[0x24BDB3140](__Coefficients, __M);
}

void vDSP_biquad_DestroySetup(vDSP_biquad_Setup __setup)
{
  MEMORY[0x24BDB3150](__setup);
}

void vDSP_conv(const float *__A, vDSP_Stride __IA, const float *__F, vDSP_Stride __IF, float *__C, vDSP_Stride __IC, vDSP_Length __N, vDSP_Length __P)
{
  MEMORY[0x24BDB3198](__A, __IA, __F, __IF, __C, __IC, __N, __P);
}

FFTSetup vDSP_create_fftsetup(vDSP_Length __Log2n, FFTRadix __Radix)
{
  return (FFTSetup)MEMORY[0x24BDB31A0](__Log2n, *(_QWORD *)&__Radix);
}

void vDSP_destroy_fftsetup(FFTSetup __setup)
{
  MEMORY[0x24BDB31C0](__setup);
}

void vDSP_fft_zip(FFTSetup __Setup, const DSPSplitComplex *__C, vDSP_Stride __IC, vDSP_Length __Log2N, FFTDirection __Direction)
{
  MEMORY[0x24BDB31F0](__Setup, __C, __IC, __Log2N, *(_QWORD *)&__Direction);
}

void vDSP_normalize(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, float *__Mean, float *__StandardDeviation, vDSP_Length __N)
{
  MEMORY[0x24BDB32B0](__A, __IA, __C, __IC, __Mean, __StandardDeviation, __N);
}

void vDSP_vadd(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3308](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vclr(float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3330](__C, __IC, __N);
}

void vDSP_vsma(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, vDSP_Stride __IC, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x24BDB34D8](__A, __IA, __B, __C, __IC, __D, __ID, __N);
}

void vDSP_vsmul(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB34F0](__A, __IA, __B, __C, __IC, __N);
}

