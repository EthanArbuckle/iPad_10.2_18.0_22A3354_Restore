uint64_t CV3DModelsCreateObjectRegionProposalModelData()
{
  char *v0;
  char *v1;
  __int128 v2;
  uint64_t v3;
  std::string *v4;
  __int128 v5;
  void **v6;
  std::string::size_type v7;
  std::string *v8;
  __int128 v9;
  std::string *v10;
  __int128 v11;
  void **v12;
  std::string::size_type v13;
  std::string *v14;
  __int128 v15;
  void **v16;
  void *v17;
  std::string *v18;
  void *v19;
  uint64_t v20;
  void *v22[2];
  unsigned __int8 v23;
  void *v24[2];
  unsigned __int8 v25;
  std::string v26;
  char v27;
  std::string __p;
  std::string v29;
  std::string v30;
  char v31;
  void *v32[2];
  _QWORD v33[11];
  char v34;
  uint64_t v35;
  std::string v36;
  _QWORD v37[4];
  _QWORD v38[5];

  v38[4] = *MEMORY[0x24BDAC8D0];
  v0 = (char *)operator new(0x40uLL);
  v36.__r_.__value_.__r.__words[0] = (std::string::size_type)v0;
  *(_OWORD *)&v36.__r_.__value_.__r.__words[1] = xmmword_21066B900;
  strcpy(v0, "CV3D_ODT_ObjectRegionProposalModel_Model/model.espresso.net");
  sub_2106696EC((uint64_t)v32);
  v29.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x30uLL);
  *(_OWORD *)&v29.__r_.__value_.__r.__words[1] = xmmword_21066B910;
  strcpy(v29.__r_.__value_.__l.__data_, "com.apple.cv3d.ODT.ObjectRegionProposalModel");
  v1 = (char *)operator new(0x40uLL);
  *(_OWORD *)&__p.__r_.__value_.__r.__words[1] = xmmword_21066B920;
  v2 = *((_OWORD *)v0 + 1);
  *(_OWORD *)(v1 + 1) = *(_OWORD *)v0;
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v1;
  *v1 = 47;
  *(_OWORD *)(v1 + 17) = v2;
  *(_OWORD *)(v1 + 33) = *((_OWORD *)v0 + 2);
  *(_OWORD *)(v1 + 44) = *(_OWORD *)(v0 + 43);
  v1[60] = 0;
  sub_21066A318((uint64_t)&v29, (std::string::size_type)&__p, v33, 1, &v30);
  if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v29.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_3;
LABEL_6:
    operator delete(v29.__r_.__value_.__l.__data_);
    if (v31)
      goto LABEL_4;
    goto LABEL_7;
  }
  operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_6;
LABEL_3:
  if (v31)
  {
LABEL_4:
    v26 = v30;
    v27 = 1;
    goto LABEL_12;
  }
LABEL_7:
  v29.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
  *(_OWORD *)&v29.__r_.__value_.__r.__words[1] = xmmword_21066B930;
  strcpy(v29.__r_.__value_.__l.__data_, "com.apple.AppleCV3D.models");
  sub_21066A318((uint64_t)&v29, (std::string::size_type)&v36, v33, 1, &v26);
  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v29.__r_.__value_.__l.__data_);
  if (v31 && SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v30.__r_.__value_.__l.__data_);
LABEL_12:
  v32[0] = *(void **)MEMORY[0x24BEDB7F0];
  v3 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(void **)((char *)v32 + *((_QWORD *)v32[0] - 3)) = *(void **)(MEMORY[0x24BEDB7F0] + 64);
  v33[0] = v3;
  v33[1] = MEMORY[0x24BEDB848] + 16;
  if (v34 < 0)
    operator delete((void *)v33[9]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x212BC8C80](&v35);
  if ((SHIBYTE(v36.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (v27)
      goto LABEL_16;
    return 0;
  }
  operator delete(v36.__r_.__value_.__l.__data_);
  if (!v27)
    return 0;
LABEL_16:
  sub_2106695C4(&dword_21066B940);
  v4 = std::string::append(&__p, ".", 1uLL);
  v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  v29.__r_.__value_.__r.__words[2] = v4->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v29.__r_.__value_.__l.__data_ = v5;
  v4->__r_.__value_.__l.__size_ = 0;
  v4->__r_.__value_.__r.__words[2] = 0;
  v4->__r_.__value_.__r.__words[0] = 0;
  sub_2106695C4(&dword_21066B944);
  if ((v25 & 0x80u) == 0)
    v6 = v24;
  else
    v6 = (void **)v24[0];
  if ((v25 & 0x80u) == 0)
    v7 = v25;
  else
    v7 = (std::string::size_type)v24[1];
  v8 = std::string::append(&v29, (const std::string::value_type *)v6, v7);
  v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  v36.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v36.__r_.__value_.__l.__data_ = v9;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  v10 = std::string::append(&v36, ".", 1uLL);
  v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
  v30.__r_.__value_.__r.__words[2] = v10->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v30.__r_.__value_.__l.__data_ = v11;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  sub_2106695C4((unsigned int *)&unk_21066B948);
  if ((v23 & 0x80u) == 0)
    v12 = v22;
  else
    v12 = (void **)v22[0];
  if ((v23 & 0x80u) == 0)
    v13 = v23;
  else
    v13 = (std::string::size_type)v22[1];
  v14 = std::string::append(&v30, (const std::string::value_type *)v12, v13);
  v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
  v33[0] = *((_QWORD *)&v14->__r_.__value_.__l + 2);
  *(_OWORD *)v32 = v15;
  v14->__r_.__value_.__l.__size_ = 0;
  v14->__r_.__value_.__r.__words[2] = 0;
  v14->__r_.__value_.__r.__words[0] = 0;
  if ((char)v23 < 0)
  {
    operator delete(v22[0]);
    if ((SHIBYTE(v30.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_30:
      if ((SHIBYTE(v36.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_31;
      goto LABEL_50;
    }
  }
  else if ((SHIBYTE(v30.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_30;
  }
  operator delete(v30.__r_.__value_.__l.__data_);
  if ((SHIBYTE(v36.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_31:
    if (((char)v25 & 0x80000000) == 0)
      goto LABEL_32;
    goto LABEL_51;
  }
LABEL_50:
  operator delete(v36.__r_.__value_.__l.__data_);
  if (((char)v25 & 0x80000000) == 0)
  {
LABEL_32:
    if ((SHIBYTE(v29.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_33;
LABEL_52:
    operator delete(v29.__r_.__value_.__l.__data_);
    if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_34;
LABEL_53:
    operator delete(__p.__r_.__value_.__l.__data_);
    goto LABEL_34;
  }
LABEL_51:
  operator delete(v24[0]);
  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_52;
LABEL_33:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_53;
LABEL_34:
  v37[0] = CFSTR("version");
  if (v33[0] >= 0)
    v16 = v32;
  else
    v16 = (void **)v32[0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v17;
  v38[1] = CFSTR("object_region_proposal_model");
  v37[1] = CFSTR("name");
  v37[2] = CFSTR("type");
  v38[2] = CFSTR("espresso_model_path");
  v37[3] = CFSTR("path");
  if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v18 = &v26;
  else
    v18 = (std::string *)v26.__r_.__value_.__r.__words[0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 4);
  v20 = objc_claimAutoreleasedReturnValue();

  if (SHIBYTE(v33[0]) < 0)
    operator delete(v32[0]);
  if (v27 && SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v26.__r_.__value_.__l.__data_);
  return v20;
}

void sub_2106693E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,char a27,uint64_t a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34,void *__p,uint64_t a36,int a37,__int16 a38,char a39,char a40,uint64_t a41,void *a42,uint64_t a43,int a44,__int16 a45,char a46,char a47,char a48,void *a49,uint64_t a50,int a51,__int16 a52,char a53,char a54)
{
  uint64_t v54;

  if (a40 < 0)
    operator delete(__p);
  if (a48 && a47 < 0)
    operator delete(a42);
  sub_210669824((uint64_t)&a49);
  if (*(char *)(v54 - 105) < 0)
  {
    operator delete(*(void **)(v54 - 128));
    _Unwind_Resume(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_2106695C4(unsigned int *a1)
{
  uint64_t result;
  _BYTE v2[24];
  int v3;
  std::string v4;
  _QWORD v5[5];
  _QWORD *v6;

  v3 = 0;
  std::to_string(&v4, *a1);
  v5[0] = v2;
  v5[1] = &v4;
  v5[2] = v2;
  v5[3] = &v4;
  v5[4] = &v4;
  v6 = v5;
  ((void (*)(_QWORD **, _BYTE *))sub_2106699FC)(&v6, v2);
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v4.__r_.__value_.__l.__data_);
  if (v3 == -1)
    sub_2106699C4();
  v5[0] = &v4;
  result = ((uint64_t (*)(_QWORD *, _BYTE *))off_24CA42858[v3])(v5, v2);
  if (v3 != -1)
    return ((uint64_t (*)(_QWORD *, _BYTE *))off_24CA42840[v3])(v5, v2);
  return result;
}

void sub_2106696B0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_21066996C((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2106696C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0)
    operator delete(__p);
  sub_21066996C((uint64_t)&a10);
  _Unwind_Resume(a1);
}

uint64_t sub_2106696EC(uint64_t a1)
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

void sub_2106697F0(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::iostream::~basic_iostream();
  MEMORY[0x212BC8C80](v1);
  _Unwind_Resume(a1);
}

uint64_t sub_210669824(uint64_t a1)
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
  MEMORY[0x212BC8C80](a1 + 128);
  return a1;
}

void sub_2106698AC()
{
  sub_2106698C0("basic_string");
}

void sub_2106698C0(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_210669910(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24CA42708, MEMORY[0x24BEDAAF0]);
}

void sub_2106698FC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_210669910(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void sub_210669934()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void sub_21066995C(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t sub_21066996C(uint64_t a1)
{
  uint64_t v2;
  char v4;

  v2 = *(unsigned int *)(a1 + 24);
  if ((_DWORD)v2 != -1)
    ((void (*)(char *, uint64_t))off_24CA42840[v2])(&v4, a1);
  *(_DWORD *)(a1 + 24) = -1;
  return a1;
}

void sub_2106699C4()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = MEMORY[0x24BEDB8D8] + 16;
  __cxa_throw(exception, MEMORY[0x24BEDB738], (void (*)(void *))std::exception::~exception);
}

__n128 sub_2106699FC(__n128 ***a1)
{
  __n128 *v1;
  __n128 *v2;
  uint64_t v3;
  __n128 result;
  char v5;

  v1 = **a1;
  v2 = (*a1)[1];
  v3 = v1[1].n128_u32[2];
  if ((_DWORD)v3 != -1)
    ((void (*)(char *, __n128 *))off_24CA42840[v3])(&v5, v1);
  v1[1].n128_u32[2] = -1;
  result = *v2;
  v1[1].n128_u64[0] = v2[1].n128_u64[0];
  *v1 = result;
  v2->n128_u64[1] = 0;
  v2[1].n128_u64[0] = 0;
  v2->n128_u64[0] = 0;
  v1[1].n128_u32[2] = 1;
  return result;
}

void sub_210669A74(uint64_t a1, uint64_t a2)
{
  sub_210669B88((uint64_t *)(*(_QWORD *)a1 + 16), a2);
}

char *sub_210669A80(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  __int128 v5;
  char *result;

  v3 = *(_QWORD *)(*(_QWORD *)a1 + 32);
  v4 = *(_QWORD *)(a2 + 8);
  if (v4 >= *(_QWORD *)(a2 + 16))
  {
    result = sub_210669F48((void **)a2, v3);
    *(_QWORD *)(a2 + 8) = result;
  }
  else
  {
    v5 = *(_OWORD *)v3;
    *(_QWORD *)(v4 + 16) = *(_QWORD *)(v3 + 16);
    *(_OWORD *)v4 = v5;
    *(_QWORD *)(v3 + 8) = 0;
    *(_QWORD *)(v3 + 16) = 0;
    *(_QWORD *)v3 = 0;
    result = (char *)(v4 + 24);
    *(_QWORD *)(a2 + 8) = v4 + 24;
  }
  return result;
}

void sub_210669AEC(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) < 0)
    operator delete(*(void **)a2);
}

void sub_210669B00(uint64_t a1, void **a2)
{
  void **v2;
  void **v4;
  void *v5;
  void *v6;

  v2 = (void **)*a2;
  if (*a2)
  {
    v4 = (void **)a2[1];
    v5 = *a2;
    if (v4 == v2)
    {
      a2[1] = v2;
      operator delete(v5);
    }
    else
    {
      do
      {
        if (*((char *)v4 - 1) < 0)
          operator delete(*(v4 - 3));
        v4 -= 3;
      }
      while (v4 != v2);
      v6 = *a2;
      a2[1] = v2;
      operator delete(v6);
    }
  }
}

void sub_210669B88(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  void *v9;
  _BYTE v10[15];
  char v11;
  void *__p[2];
  uint64_t v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  *(_QWORD *)((char *)v14 + 7) = *(_QWORD *)(a2 + 15);
  v3 = *(void **)a2;
  v14[0] = *(_QWORD *)(a2 + 8);
  v4 = *(_BYTE *)(a2 + 23);
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = 0;
  v9 = v3;
  *(_QWORD *)v10 = v14[0];
  *(_QWORD *)&v10[7] = *(_QWORD *)((char *)v14 + 7);
  v11 = v4;
  memset(v14, 0, 15);
  v5 = a1[1];
  v6 = *(_QWORD *)(v5 + 16);
  *(_OWORD *)__p = *(_OWORD *)v5;
  v13 = v6;
  *(_QWORD *)v5 = 0;
  *(_QWORD *)(v5 + 8) = 0;
  *(_QWORD *)(v5 + 16) = 0;
  v7 = *(unsigned int *)(v2 + 24);
  if ((_DWORD)v7 != -1)
    ((void (*)(char *, uint64_t))off_24CA42840[v7])(&v8, v2);
  *(_DWORD *)(v2 + 24) = -1;
  sub_210669CEC((_QWORD *)v2, (uint64_t)&v9, 2uLL);
  *(_DWORD *)(v2 + 24) = 2;
  if ((SHIBYTE(v13) & 0x80000000) == 0)
  {
    if ((v11 & 0x80000000) == 0)
      return;
LABEL_7:
    operator delete(v9);
    return;
  }
  operator delete(__p[0]);
  if (v11 < 0)
    goto LABEL_7;
}

void sub_210669CB0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a2)
    sub_21066995C(exception_object);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_210669CEC(_QWORD *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  __int128 v8;
  char *v9;
  __int128 *v10;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a3)
  {
    if (a3 >= 0xAAAAAAAAAAAAAABLL)
      sub_210669EA8();
    v5 = 24 * a3;
    v6 = (char *)operator new(24 * a3);
    v7 = 0;
    *a1 = v6;
    a1[1] = v6;
    a1[2] = &v6[v5];
    do
    {
      v9 = &v6[v7];
      v10 = (__int128 *)(a2 + v7);
      if (*(char *)(a2 + v7 + 23) < 0)
      {
        sub_210669EBC(v9, *(void **)v10, *((_QWORD *)v10 + 1));
      }
      else
      {
        v8 = *v10;
        *((_QWORD *)v9 + 2) = *((_QWORD *)v10 + 2);
        *(_OWORD *)v9 = v8;
      }
      v7 += 24;
    }
    while (v5 != v7);
    a1[1] = &v6[v7];
  }
  return a1;
}

void sub_210669DC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  sub_210669E14(&a9);
  _Unwind_Resume(a1);
}

void sub_210669DD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  for (; v11; v11 -= 24)
  {
    if (*(char *)(v10 + v11 - 1) < 0)
      operator delete(*(void **)(v10 + v11 - 24));
  }
  *(_QWORD *)(v9 + 8) = v10;
  sub_210669E14(&a9);
  _Unwind_Resume(a1);
}

void ***sub_210669E14(void ***result)
{
  void ***v1;
  void **v2;
  void **v3;
  void **v4;
  void *v5;

  v1 = result;
  if (!*((_BYTE *)result + 8))
  {
    v2 = *result;
    v3 = (void **)**result;
    if (v3)
    {
      v4 = (void **)v2[1];
      v5 = **result;
      if (v4 != v3)
      {
        do
        {
          if (*((char *)v4 - 1) < 0)
            operator delete(*(v4 - 3));
          v4 -= 3;
        }
        while (v4 != v3);
        v5 = **v1;
      }
      v2[1] = v3;
      operator delete(v5);
      return v1;
    }
  }
  return result;
}

void sub_210669EA8()
{
  sub_2106698C0("vector");
}

void *sub_210669EBC(_BYTE *__dst, void *__src, unint64_t a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8)
      sub_2106698AC();
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

char *sub_210669F48(void **a1, uint64_t a2)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  __int128 v13;
  char *v14;

  v3 = 0xAAAAAAAAAAAAAAABLL * (((_BYTE *)a1[1] - (_BYTE *)*a1) >> 3);
  v4 = v3 + 1;
  if (v3 + 1 > 0xAAAAAAAAAAAAAAALL)
    sub_210669EA8();
  if (0x5555555555555556 * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 3) > v4)
    v4 = 0x5555555555555556 * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 3);
  if (0xAAAAAAAAAAAAAAABLL * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 3) >= 0x555555555555555)
    v6 = 0xAAAAAAAAAAAAAAALL;
  else
    v6 = v4;
  if (v6)
  {
    if (v6 > 0xAAAAAAAAAAAAAAALL)
      sub_210669934();
    v7 = (char *)operator new(24 * v6);
  }
  else
  {
    v7 = 0;
  }
  v8 = &v7[24 * v3];
  v9 = &v7[24 * v6];
  *(_OWORD *)v8 = *(_OWORD *)a2;
  *((_QWORD *)v8 + 2) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = 0;
  v10 = v8 + 24;
  v11 = (char *)*a1;
  v12 = (char *)a1[1];
  if (v12 == *a1)
  {
    *a1 = v8;
    a1[1] = v10;
    a1[2] = v9;
    if (!v12)
      return v10;
    goto LABEL_20;
  }
  do
  {
    v13 = *(_OWORD *)(v12 - 24);
    *((_QWORD *)v8 - 1) = *((_QWORD *)v12 - 1);
    *(_OWORD *)(v8 - 24) = v13;
    v8 -= 24;
    *((_QWORD *)v12 - 2) = 0;
    *((_QWORD *)v12 - 1) = 0;
    *((_QWORD *)v12 - 3) = 0;
    v12 -= 24;
  }
  while (v12 != v11);
  v14 = (char *)*a1;
  v12 = (char *)a1[1];
  *a1 = v8;
  a1[1] = v10;
  a1[2] = v9;
  if (v12 != v14)
  {
    do
    {
      if (*(v12 - 1) < 0)
        operator delete(*((void **)v12 - 3));
      v12 -= 24;
    }
    while (v12 != v14);
    v12 = v14;
  }
  if (v12)
LABEL_20:
    operator delete(v12);
  return v10;
}

void sub_21066A0B0(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
}

__n128 sub_21066A0BC@<Q0>(__n128 *a1@<X1>, __n128 *a2@<X8>)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  a2[1].n128_u64[0] = a1[1].n128_u64[0];
  a1->n128_u64[1] = 0;
  a1[1].n128_u64[0] = 0;
  a1->n128_u64[0] = 0;
  return result;
}

void sub_21066A0D8(uint64_t *a1@<X1>, std::string *a2@<X8>, int64x2_t a3@<Q3>, int8x16_t a4@<Q5>)
{
  sub_21066A0E8(*a1, a1[1], 0, 0, a2, a3, a4);
}

void sub_21066A0E8(uint64_t a1@<X0>, uint64_t a2@<X1>, const std::string::value_type *a3@<X2>, std::string::size_type a4@<X3>, std::string *a5@<X8>, int64x2_t a6@<Q3>, int8x16_t a7@<Q5>)
{
  int64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unsigned __int8 *v21;
  int64x2_t v22;
  int8x16_t v23;
  int64x2_t v24;
  const double *v25;
  const double *v26;
  unsigned __int128 v27;
  unsigned __int128 v28;
  int32x2_t v29;
  int8x16_t v30;
  int8x16_t v31;
  int32x2_t v32;
  int8x16_t v33;
  int8x16_t v34;
  uint64_t v35;
  int v36;
  const std::string::value_type *v37;
  std::string::size_type v38;
  uint64_t i;
  int v40;
  const std::string::value_type *v41;
  std::string::size_type v42;

  v12 = 0xAAAAAAAAAAAAAAABLL * ((a2 - a1) >> 3);
  if (v12 <= 1)
    v13 = 1;
  else
    v13 = 0xAAAAAAAAAAAAAAABLL * ((a2 - a1) >> 3);
  v14 = (v13 - 1) * a4;
  v15 = a2 - a1;
  if (a2 == a1)
  {
    v16 = 0;
  }
  else
  {
    if ((unint64_t)(v15 - 24) >= 0x60)
    {
      v18 = (v15 - 24) / 0x18uLL + 1;
      v19 = v18 & 3;
      if ((v18 & 3) == 0)
        v19 = 4;
      v20 = v18 - v19;
      v17 = a1 + 24 * v20;
      v21 = (unsigned __int8 *)(a1 + 47);
      v22 = 0uLL;
      v23.i64[0] = 255;
      v23.i64[1] = 255;
      v24 = 0uLL;
      do
      {
        a6.i8[0] = *(v21 - 24);
        a6.i8[4] = *v21;
        a7.i8[0] = v21[24];
        a7.i8[4] = v21[48];
        v25 = (const double *)(v21 - 39);
        v26 = (const double *)(v21 + 9);
        v27 = (unsigned __int128)vld3q_f64(v25);
        v28 = (unsigned __int128)vld3q_f64(v26);
        v29 = vcltz_s32(vshr_n_s32(vshl_n_s32(*(int32x2_t *)a6.i8, 0x18uLL), 0x18uLL));
        v30.i64[0] = v29.i32[0];
        v30.i64[1] = v29.i32[1];
        v31 = v30;
        v32 = vcltz_s32(vshr_n_s32(vshl_n_s32(*(int32x2_t *)a7.i8, 0x18uLL), 0x18uLL));
        v30.i64[0] = v32.i32[0];
        v30.i64[1] = v32.i32[1];
        v33 = v30;
        v30.i64[0] = a6.u32[0];
        v30.i64[1] = a6.u32[1];
        v34 = vbicq_s8(v30, v31);
        v30.i64[0] = a7.u32[0];
        v30.i64[1] = a7.u32[1];
        a6 = (int64x2_t)vorrq_s8(vandq_s8((int8x16_t)v27, v31), vandq_s8(v34, v23));
        a7 = vandq_s8((int8x16_t)v28, v33);
        v22 = vaddq_s64(a6, v22);
        v24 = vaddq_s64((int64x2_t)vorrq_s8(a7, vandq_s8(vbicq_s8(v30, v33), v23)), v24);
        v21 += 96;
        v20 -= 4;
      }
      while (v20);
      v16 = vaddvq_s64(vaddq_s64(v24, v22));
    }
    else
    {
      v16 = 0;
      v17 = a1;
    }
    do
    {
      v35 = *(unsigned __int8 *)(v17 + 23);
      if ((v35 & 0x80u) != 0)
        v35 = *(_QWORD *)(v17 + 8);
      v16 += v35;
      v17 += 24;
    }
    while (v17 != a2);
  }
  a5->__r_.__value_.__r.__words[0] = 0;
  a5->__r_.__value_.__l.__size_ = 0;
  a5->__r_.__value_.__r.__words[2] = 0;
  std::string::reserve(a5, v16 + v14);
  if (v15 >= 1)
  {
    v36 = *(char *)(a1 + 23);
    v37 = v36 >= 0 ? (const std::string::value_type *)a1 : *(const std::string::value_type **)a1;
    v38 = v36 >= 0 ? *(unsigned __int8 *)(a1 + 23) : *(_QWORD *)(a1 + 8);
    std::string::append(a5, v37, v38);
    if ((unint64_t)v12 >= 2)
    {
      for (i = a1 + 24; i != a2; i += 24)
      {
        std::string::append(a5, a3, a4);
        v40 = *(char *)(i + 23);
        if (v40 >= 0)
          v41 = (const std::string::value_type *)i;
        else
          v41 = *(const std::string::value_type **)i;
        if (v40 >= 0)
          v42 = *(unsigned __int8 *)(i + 23);
        else
          v42 = *(_QWORD *)(i + 8);
        std::string::append(a5, v41, v42);
      }
    }
  }
}

void sub_21066A2F4(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void sub_21066A318(uint64_t a1@<X0>, std::string::size_type a2@<X1>, _QWORD *a3@<X2>, char a4@<W3>, std::string *a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  size_t v15;
  size_t v16;
  void **p_dst;
  _QWORD *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  const std::locale::facet *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  size_t v28;
  unint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void **v33;
  const std::string::value_type *v34;
  std::string::size_type v35;
  uint64_t v36;
  std::string::size_type v37;
  uint64_t i;
  std::string::size_type size;
  std::string *v40;
  unsigned __int8 v41;
  int v42;
  _QWORD *v43;
  std::string *v44;
  std::string::size_type v45;
  _QWORD *v46;
  void **__dst;
  size_t v48;
  int64_t v49;
  std::string v50;
  uint64_t v51;
  std::__fs::filesystem::path v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  if (*(char *)(a1 + 23) >= 0)
    v10 = a1;
  else
    v10 = *(_QWORD *)a1;
  v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v10);
  v12 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", v11);
  if (!v12)
  {
    if (a4)
    {
      v18 = sub_21066ABA8(a3, (uint64_t)"Could not find bundle '", 23);
      v19 = *(char *)(a1 + 23);
      if (v19 >= 0)
        v20 = a1;
      else
        v20 = *(_QWORD *)a1;
      if (v19 >= 0)
        v21 = *(unsigned __int8 *)(a1 + 23);
      else
        v21 = *(_QWORD *)(a1 + 8);
      v22 = sub_21066ABA8(v18, v20, v21);
      v23 = sub_21066ABA8(v22, (uint64_t)"'.", 2);
      std::ios_base::getloc((const std::ios_base *)((char *)v23 + *(_QWORD *)(*v23 - 24)));
      v24 = std::locale::use_facet((const std::locale *)&v52, MEMORY[0x24BEDB350]);
      ((void (*)(const std::locale::facet *, uint64_t))v24->__vftable[2].~facet_0)(v24, 10);
      std::locale::~locale((std::locale *)&v52);
      std::ostream::put();
      std::ostream::flush();
    }
    a5->__r_.__value_.__s.__data_[0] = 0;
    a5[1].__r_.__value_.__s.__data_[0] = 0;
    return;
  }
  v13 = (void *)objc_msgSend(v12, "resourcePath");
  if (!v13
    && sub_21066AEB0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_AppleCV3DModels/library/Essentials/Resource/src/Resource.cpp", 125, (uint64_t)"resources_path", 14, (uint64_t)&unk_21066BD1B, 0, (void (*)(void **))sub_21066B30C))
  {
    abort();
  }
  v14 = (const char *)objc_msgSend(v13, "UTF8String");
  v15 = strlen(v14);
  if (v15 > 0x7FFFFFFFFFFFFFF7)
    sub_2106698AC();
  v16 = v15;
  if (v15 >= 0x17)
  {
    v25 = (v15 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v15 | 7) != 0x17)
      v25 = v15 | 7;
    v26 = v25 + 1;
    p_dst = (void **)operator new(v25 + 1);
    v48 = v16;
    v49 = v26 | 0x8000000000000000;
    __dst = p_dst;
    goto LABEL_23;
  }
  HIBYTE(v49) = v15;
  p_dst = (void **)&__dst;
  if (v15)
LABEL_23:
    memmove(p_dst, v14, v16);
  *((_BYTE *)p_dst + v16) = 0;
  v27 = SHIBYTE(v49);
  if (v49 >= 0)
    v28 = HIBYTE(v49);
  else
    v28 = v48;
  v29 = v28 + 10;
  if (v28 + 10 > 0x7FFFFFFFFFFFFFF7)
    sub_2106698AC();
  if (v29 >= 0x17)
  {
    v31 = (v29 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v29 | 7) != 0x17)
      v31 = v29 | 7;
    v32 = v31 + 1;
    v30 = operator new(v31 + 1);
    v50.__r_.__value_.__l.__size_ = v28 + 10;
    v50.__r_.__value_.__r.__words[2] = v32 | 0x8000000000000000;
    v50.__r_.__value_.__r.__words[0] = (std::string::size_type)v30;
  }
  else
  {
    memset(&v50, 0, sizeof(v50));
    v30 = &v50;
    *((_BYTE *)&v50.__r_.__value_.__s + 23) = v28 + 10;
    if (!v28)
      goto LABEL_38;
  }
  if (v27 >= 0)
    v33 = (void **)&__dst;
  else
    v33 = __dst;
  memmove(v30, v33, v28);
LABEL_38:
  strcpy((char *)v30 + v28, "/.disabled");
  v52.__pn_ = v50;
  std::__fs::filesystem::__status(&v52, 0);
  if (SHIBYTE(v52.__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v52.__pn_.__r_.__value_.__l.__data_);
  if (v49 >= 0)
    v34 = (const std::string::value_type *)&__dst;
  else
    v34 = (const std::string::value_type *)__dst;
  if (v49 >= 0)
    v35 = HIBYTE(v49);
  else
    v35 = v48;
  v52.__pn_.__r_.__value_.__r.__words[0] = (std::string::size_type)v34;
  v52.__pn_.__r_.__value_.__l.__size_ = v35;
  v36 = *(unsigned __int8 *)(a2 + 23);
  if ((v36 & 0x80u) == 0)
    v37 = a2;
  else
    v37 = *(_QWORD *)a2;
  if ((v36 & 0x80u) != 0)
    v36 = *(_QWORD *)(a2 + 8);
  v52.__pn_.__r_.__value_.__r.__words[2] = v37;
  v53 = v36;
  memset(&v50, 0, sizeof(v50));
  std::string::reserve(&v50, v35 + v36 + 1);
  std::string::append(&v50, v34, v35);
  for (i = 0; i != 2; i += 2)
  {
    std::string::append(&v50, "/", 1uLL);
    std::string::append(&v50, (const std::string::value_type *)v52.__pn_.__r_.__value_.__r.__words[i + 2], *(_QWORD *)((char *)&v52 + i * 8 + 24));
  }
  memset(&v52, 0, sizeof(v52));
  size = HIBYTE(v50.__r_.__value_.__r.__words[2]);
  if ((v50.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v40 = &v50;
  else
    v40 = (std::string *)v50.__r_.__value_.__r.__words[0];
  if ((v50.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = v50.__r_.__value_.__l.__size_;
  sub_21066A8A4((unint64_t)&v52, (char *)v40, (char *)v40 + size);
  std::__fs::filesystem::__status(&v52, 0);
  v41 = v51;
  if (SHIBYTE(v52.__pn_.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v52.__pn_.__r_.__value_.__l.__data_);
    v42 = v41;
    if (!v41)
      goto LABEL_64;
  }
  else
  {
    v42 = v51;
    if (!(_BYTE)v51)
      goto LABEL_64;
  }
  if (v42 != 255)
  {
    *a5 = v50;
    a5[1].__r_.__value_.__s.__data_[0] = 1;
    if (SHIBYTE(v49) < 0)
      goto LABEL_76;
    return;
  }
LABEL_64:
  if (a4)
  {
    v43 = sub_21066ABA8(a3, (uint64_t)"Resource at '", 13);
    if ((v50.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v44 = &v50;
    else
      v44 = (std::string *)v50.__r_.__value_.__r.__words[0];
    if ((v50.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v45 = HIBYTE(v50.__r_.__value_.__r.__words[2]);
    else
      v45 = v50.__r_.__value_.__l.__size_;
    v46 = sub_21066ABA8(v43, (uint64_t)v44, v45);
    sub_21066ABA8(v46, (uint64_t)"' does not exist.", 17);
  }
  a5->__r_.__value_.__s.__data_[0] = 0;
  a5[1].__r_.__value_.__s.__data_[0] = 0;
  if ((SHIBYTE(v50.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v49) & 0x80000000) == 0)
      return;
LABEL_76:
    operator delete(__dst);
    return;
  }
  operator delete(v50.__r_.__value_.__l.__data_);
  if (SHIBYTE(v49) < 0)
    goto LABEL_76;
}

void sub_21066A81C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, std::locale a17)
{
  std::locale::~locale(&a17);
  _Unwind_Resume(a1);
}

void sub_21066A830(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a28 < 0)
    operator delete(__p);
  if (a21 < 0)
    operator delete(a16);
  if (a15 < 0)
    operator delete(a10);
  _Unwind_Resume(exception_object);
}

unint64_t sub_21066A8A4(unint64_t a1, char *__src, char *a3)
{
  int v6;
  size_t v7;
  size_t v8;
  unint64_t v9;
  unint64_t v10;
  _BYTE *v11;
  unint64_t v12;
  void **p_dst;
  size_t v14;
  _BYTE *v15;
  _BYTE *v16;
  _BYTE *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  const std::string::value_type *v21;
  std::string::size_type v22;
  _OWORD *v23;
  __int128 *v24;
  unint64_t v25;
  __int128 v26;
  char v27;
  size_t v28;
  unint64_t v30;
  uint64_t v31;
  void **__dst;
  size_t v33;
  int64_t v34;

  v6 = *(char *)(a1 + 23);
  v7 = a3 - __src;
  if (v6 < 0)
  {
    if (a3 == __src)
      return a1;
    v8 = *(_QWORD *)(a1 + 8);
    v12 = *(_QWORD *)(a1 + 16);
    v9 = (v12 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    v11 = *(_BYTE **)a1;
    v10 = HIBYTE(v12);
    if (*(_QWORD *)a1 > (unint64_t)__src)
      goto LABEL_11;
  }
  else
  {
    if (a3 == __src)
      return a1;
    v8 = *(unsigned __int8 *)(a1 + 23);
    v9 = 22;
    LOBYTE(v10) = *(_BYTE *)(a1 + 23);
    v11 = (_BYTE *)a1;
    if (a1 > (unint64_t)__src)
    {
LABEL_11:
      if (v9 - v8 >= v7)
      {
        v16 = (_BYTE *)a1;
        if ((v10 & 0x80) != 0)
        {
          v16 = *(_BYTE **)a1;
          v17 = (_BYTE *)(*(_QWORD *)a1 + v8);
          if (v7 >= 0x20)
            goto LABEL_36;
        }
        else
        {
          v17 = (_BYTE *)(a1 + v8);
          if (v7 >= 0x20)
            goto LABEL_36;
        }
        goto LABEL_23;
      }
      v14 = 0x7FFFFFFFFFFFFFF7;
      if (0x7FFFFFFFFFFFFFF7 - v9 < v8 + v7 - v9)
        sub_2106698AC();
      v15 = (_BYTE *)a1;
      if (v6 < 0)
      {
        v15 = *(_BYTE **)a1;
        if (v9 > 0x3FFFFFFFFFFFFFF2)
        {
LABEL_15:
          v16 = operator new(0x7FFFFFFFFFFFFFF7uLL);
          if (!v8)
            goto LABEL_17;
          goto LABEL_16;
        }
      }
      else if (v9 > 0x3FFFFFFFFFFFFFF2)
      {
        goto LABEL_15;
      }
      v30 = 2 * v9;
      if (v8 + v7 > 2 * v9)
        v30 = v8 + v7;
      v31 = (v30 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v30 | 7) != 0x17)
        v31 = v30 | 7;
      if (v30 >= 0x17)
        v14 = v31 + 1;
      else
        v14 = 23;
      v16 = operator new(v14);
      if (!v8)
      {
LABEL_17:
        if (v9 != 22)
          operator delete(v15);
        *(_QWORD *)(a1 + 8) = v8;
        *(_QWORD *)(a1 + 16) = v14 | 0x8000000000000000;
        *(_QWORD *)a1 = v16;
        v17 = &v16[v8];
        if (v7 >= 0x20)
        {
LABEL_36:
          if ((unint64_t)(&v16[v8] - __src) >= 0x20)
          {
            v18 = &__src[v7 & 0xFFFFFFFFFFFFFFE0];
            v17 += v7 & 0xFFFFFFFFFFFFFFE0;
            v23 = &v16[v8 + 16];
            v24 = (__int128 *)(__src + 16);
            v25 = v7 & 0xFFFFFFFFFFFFFFE0;
            do
            {
              v26 = *v24;
              *(v23 - 1) = *(v24 - 1);
              *v23 = v26;
              v23 += 2;
              v24 += 2;
              v25 -= 32;
            }
            while (v25);
            if (v7 == (v7 & 0xFFFFFFFFFFFFFFE0))
              goto LABEL_42;
          }
          else
          {
            v18 = __src;
          }
          do
          {
LABEL_41:
            v27 = *v18++;
            *v17++ = v27;
          }
          while (v18 != a3);
LABEL_42:
          *v17 = 0;
          v28 = v8 + v7;
          if (*(char *)(a1 + 23) < 0)
            *(_QWORD *)(a1 + 8) = v28;
          else
            *(_BYTE *)(a1 + 23) = v28 & 0x7F;
          return a1;
        }
LABEL_23:
        v18 = __src;
        goto LABEL_41;
      }
LABEL_16:
      memmove(v16, v15, v8);
      goto LABEL_17;
    }
  }
  if (&v11[v8 + 1] <= __src)
    goto LABEL_11;
  if (v7 > 0x7FFFFFFFFFFFFFF7)
    sub_2106698AC();
  if (v7 > 0x16)
  {
    v19 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v7 | 7) != 0x17)
      v19 = v7 | 7;
    v20 = v19 + 1;
    p_dst = (void **)operator new(v19 + 1);
    v33 = v7;
    v34 = v20 | 0x8000000000000000;
    __dst = p_dst;
  }
  else
  {
    HIBYTE(v34) = (_BYTE)a3 - (_BYTE)__src;
    p_dst = (void **)&__dst;
  }
  memcpy(p_dst, __src, v7);
  *((_BYTE *)p_dst + v7) = 0;
  if (v34 >= 0)
    v21 = (const std::string::value_type *)&__dst;
  else
    v21 = (const std::string::value_type *)__dst;
  if (v34 >= 0)
    v22 = HIBYTE(v34);
  else
    v22 = v33;
  std::string::append((std::string *)a1, v21, v22);
  if (SHIBYTE(v34) < 0)
    operator delete(__dst);
  return a1;
}

void sub_21066AB8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_21066ABA8(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  _BYTE v13[16];
  std::locale v14;

  MEMORY[0x212BC8BFC](v13, a1);
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
    if (!sub_21066AD0C(v7, a2, v11, a2 + a3, v6, (char)v9))
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
  MEMORY[0x212BC8C08](v13);
  return a1;
}

void sub_21066ACB0(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x212BC8C08](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x21066AC90);
}

void sub_21066ACF8(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t sub_21066AD0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6;
  uint64_t v11;
  size_t v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  void **v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *__b[2];
  int64_t v22;

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
    if ((uint64_t)v12 >= 1)
    {
      if (v12 >= 0x7FFFFFFFFFFFFFF8)
        sub_2106698AC();
      if (v12 >= 0x17)
      {
        v14 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17)
          v14 = v12 | 7;
        v15 = v14 + 1;
        v13 = (void **)operator new(v14 + 1);
        __b[1] = (void *)v12;
        v22 = v15 | 0x8000000000000000;
        __b[0] = v13;
      }
      else
      {
        HIBYTE(v22) = v12;
        v13 = __b;
      }
      memset(v13, __c, v12);
      *((_BYTE *)v13 + v12) = 0;
      if (v22 >= 0)
        v16 = __b;
      else
        v16 = (void **)__b[0];
      v17 = (*(uint64_t (**)(uint64_t, void **, size_t))(*(_QWORD *)v6 + 96))(v6, v16, v12);
      v18 = v17;
      if (SHIBYTE(v22) < 0)
      {
        operator delete(__b[0]);
        if (v18 != v12)
          return 0;
      }
      else if (v17 != v12)
      {
        return 0;
      }
    }
    v19 = a4 - a3;
    if (v19 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v6 + 96))(v6, a3, v19) == v19)
    {
      *(_QWORD *)(a5 + 24) = 0;
      return v6;
    }
    return 0;
  }
  return v6;
}

void sub_21066AE94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

BOOL sub_21066AEB0(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(void **))
{
  unsigned __int8 v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  unsigned __int8 v17;
  int v18;

  sub_21066B008(a1, a2, a3, a4, a5, a6, a7);
  v11 = atomic_load((unsigned __int8 *)&qword_254A6F218);
  if ((v11 & 1) == 0 && __cxa_guard_acquire(&qword_254A6F218))
  {
    __cxa_atexit((void (*)(void *))sub_21066B48C, &qword_254A6F1E0, &dword_210664000);
    __cxa_guard_release(&qword_254A6F218);
  }
  if (byte_254A6F208)
    v12 = byte_254A6F210 == 0;
  else
    v12 = 0;
  if (!v12)
  {
    v13 = qword_254A6F1E0;
    v14 = unk_254A6F1E8;
    while (v13 != v14)
    {
      v16 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v13;
      v15 = *(_QWORD *)(v13 + 8);
      v13 += 16;
      v16(v15, a3, a4, a5, a6);
    }
  }
  v17 = atomic_load((unsigned __int8 *)&qword_254A6F218);
  if ((v17 & 1) == 0 && __cxa_guard_acquire(&qword_254A6F218))
  {
    __cxa_atexit((void (*)(void *))sub_21066B48C, &qword_254A6F1E0, &dword_210664000);
    __cxa_guard_release(&qword_254A6F218);
  }
  v18 = byte_254A6F208;
  if (byte_254A6F208)
    qword_254A6F1F8(unk_254A6F200, a3, a4, a5, a6);
  return v18 == 0;
}

void sub_21066B008(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(void **))
{
  unsigned __int8 v13;
  const char *v14;
  uint64_t v15;
  size_t v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  size_t v20;
  void *v21;
  unint64_t v22;
  const void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void **v27;
  void *v28[2];
  int64_t v29;
  _QWORD v30[2];
  _QWORD v31[3];
  const void *v32;
  uint64_t v33;
  const void *v34;
  unint64_t v35;
  void *__p;
  char v37;
  unint64_t v38;
  int v39;
  uint64_t v40;

  v13 = atomic_load((unsigned __int8 *)&qword_254A6F218);
  if ((v13 & 1) == 0 && __cxa_guard_acquire(&qword_254A6F218))
  {
    __cxa_atexit((void (*)(void *))sub_21066B48C, &qword_254A6F1E0, &dword_210664000);
    __cxa_guard_release(&qword_254A6F218);
  }
  if (!byte_254A6F208)
  {
    sub_2106696EC((uint64_t)v30);
    if (a4)
      v14 = "Assert: ";
    else
      v14 = "Abort: ";
    if (a4)
      v15 = 8;
    else
      v15 = 7;
    sub_21066ABA8(v31, (uint64_t)v14, v15);
    v16 = strlen(a1);
    v17 = sub_21066ABA8(v31, (uint64_t)a1, v16);
    sub_21066ABA8(v17, (uint64_t)":", 1);
    std::ostream::operator<<();
    if (a4)
    {
      v18 = sub_21066ABA8(v31, (uint64_t)" : ", 3);
      sub_21066ABA8(v18, a3, a4);
    }
    if (a6)
    {
      v19 = sub_21066ABA8(v31, (uint64_t)" : ", 3);
      sub_21066ABA8(v19, a5, a6);
    }
    sub_21066ABA8(v31, (uint64_t)"\n", 1);
    if ((v39 & 0x10) != 0)
    {
      v22 = v38;
      if (v38 < v35)
      {
        v38 = v35;
        v22 = v35;
      }
      v23 = v34;
      v20 = v22 - (_QWORD)v34;
      if (v22 - (unint64_t)v34 >= 0x7FFFFFFFFFFFFFF8)
        goto LABEL_35;
    }
    else
    {
      if ((v39 & 8) == 0)
      {
        v20 = 0;
        HIBYTE(v29) = 0;
        v21 = v28;
        goto LABEL_26;
      }
      v23 = v32;
      v20 = v33 - (_QWORD)v32;
      if ((unint64_t)(v33 - (_QWORD)v32) >= 0x7FFFFFFFFFFFFFF8)
LABEL_35:
        sub_2106698AC();
    }
    if (v20 >= 0x17)
    {
      v24 = (v20 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v20 | 7) != 0x17)
        v24 = v20 | 7;
      v25 = v24 + 1;
      v21 = operator new(v24 + 1);
      v28[1] = (void *)v20;
      v29 = v25 | 0x8000000000000000;
      v28[0] = v21;
    }
    else
    {
      HIBYTE(v29) = v20;
      v21 = v28;
      if (!v20)
        goto LABEL_26;
    }
    memmove(v21, v23, v20);
LABEL_26:
    *((_BYTE *)v21 + v20) = 0;
    v30[0] = *MEMORY[0x24BEDB7F0];
    v26 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
    *(_QWORD *)((char *)v30 + *(_QWORD *)(v30[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
    v31[0] = v26;
    v31[1] = MEMORY[0x24BEDB848] + 16;
    if (v37 < 0)
      operator delete(__p);
    std::streambuf::~streambuf();
    std::iostream::~basic_iostream();
    MEMORY[0x212BC8C80](&v40);
    if (v29 >= 0)
      v27 = v28;
    else
      v27 = (void **)v28[0];
    a7(v27);
    if (SHIBYTE(v29) < 0)
      operator delete(v28[0]);
  }
}

void sub_21066B2DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  if (a14 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_21066B30C(char *__s)
{
  unsigned __int8 v2;
  size_t v3;
  uint64_t *v4;
  unsigned __int8 v5;
  NSObject *v6;
  int v8;
  char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = atomic_load((unsigned __int8 *)&qword_254A6F220);
  if ((v2 & 1) == 0 && __cxa_guard_acquire(&qword_254A6F220))
  {
    __cxa_atexit((void (*)(void *))sub_21066B4BC, &off_253ED7C48, &dword_210664000);
    __cxa_guard_release(&qword_254A6F220);
  }
  v3 = strlen(__s);
  sub_21066B564((void **)&qword_253ED7C50, __s, v3);
  if (byte_253ED7C67 >= 0)
    v4 = &qword_253ED7C50;
  else
    v4 = (uint64_t *)qword_253ED7C50;
  qword_254A6F1A8 = (uint64_t)v4;
  v5 = atomic_load((unsigned __int8 *)&qword_254A6F230);
  if ((v5 & 1) == 0 && __cxa_guard_acquire(&qword_254A6F230))
  {
    qword_254A6F228 = (uint64_t)os_log_create("cv3d", (const char *)&unk_21066BD1B);
    __cxa_guard_release(&qword_254A6F230);
  }
  v6 = qword_254A6F228;
  if (os_log_type_enabled((os_log_t)qword_254A6F228, OS_LOG_TYPE_FAULT))
  {
    v8 = 136315138;
    v9 = __s;
    _os_log_impl(&dword_210664000, v6, OS_LOG_TYPE_FAULT, "%s", (uint8_t *)&v8, 0xCu);
  }
  return fputs(__s, (FILE *)*MEMORY[0x24BDAC8D8]);
}

uint64_t sub_21066B48C(uint64_t a1)
{
  void *v2;

  v2 = *(void **)a1;
  if (v2)
  {
    *(_QWORD *)(a1 + 8) = v2;
    operator delete(v2);
  }
  return a1;
}

uint64_t sub_21066B4BC(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  *(_QWORD *)result = off_24CA42880;
  qword_254A6F1A8 = 0;
  if (*(char *)(result + 31) < 0)
  {
    operator delete(*(void **)(result + 8));
    return v1;
  }
  return result;
}

void sub_21066B510(uint64_t a1)
{
  *(_QWORD *)a1 = off_24CA42880;
  qword_254A6F1A8 = 0;
  if (*(char *)(a1 + 31) < 0)
    operator delete(*(void **)(a1 + 8));
  JUMPOUT(0x212BC8CBCLL);
}

void **sub_21066B564(void **__dst, void *__src, size_t __len)
{
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  size_t v11;
  unint64_t v12;
  uint64_t v13;

  LODWORD(v6) = *((char *)__dst + 23);
  if ((v6 & 0x80000000) != 0)
  {
    v10 = (unint64_t)__dst[2];
    v8 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (__len > v8)
    {
      v11 = 0x7FFFFFFFFFFFFFF7;
      if (0x7FFFFFFFFFFFFFF7 - (v10 & 0x7FFFFFFFFFFFFFFFLL) >= __len - v8)
      {
        v9 = *__dst;
        if (v8 > 0x3FFFFFFFFFFFFFF2)
        {
LABEL_15:
          v7 = operator new(v11);
          memcpy(v7, __src, __len);
          if (v8 != 22)
            operator delete(v9);
          __dst[2] = (void *)(v11 | 0x8000000000000000);
          *__dst = v7;
LABEL_23:
          __dst[1] = (void *)__len;
          goto LABEL_24;
        }
LABEL_8:
        v12 = 2 * v8;
        if (__len > 2 * v8)
          v12 = __len;
        v13 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17)
          v13 = v12 | 7;
        if (v12 >= 0x17)
          v11 = v13 + 1;
        else
          v11 = 23;
        goto LABEL_15;
      }
LABEL_25:
      sub_2106698AC();
    }
    v6 = HIBYTE(v10);
    v7 = *__dst;
  }
  else
  {
    v7 = __dst;
    if (__len > 0x16)
    {
      if (__len - 0x7FFFFFFFFFFFFFF7 >= 0x800000000000001FLL)
      {
        v8 = 22;
        v9 = __dst;
        goto LABEL_8;
      }
      goto LABEL_25;
    }
  }
  if (__len)
  {
    memmove(v7, __src, __len);
    LOBYTE(v6) = *((_BYTE *)__dst + 23);
  }
  if ((v6 & 0x80) != 0)
    goto LABEL_23;
  *((_BYTE *)__dst + 23) = __len & 0x7F;
LABEL_24:
  *((_BYTE *)v7 + __len) = 0;
  return __dst;
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
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
  MEMORY[0x24BEDACB8](this, __requested_capacity);
}

uint64_t std::ostream::put()
{
  return MEMORY[0x24BEDAEE0]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x24BEDAEE8]();
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
  return MEMORY[0x24BEDAF48]();
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

std::__fs::filesystem::file_status std::__fs::filesystem::__status(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return (std::__fs::filesystem::file_status)MEMORY[0x24BEDB308](a1, __ec);
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

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x24BEDB610](retstr, *(_QWORD *)&__val);
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
  off_24CA42748(__p);
}

uint64_t operator delete()
{
  return off_24CA42750();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24CA42758(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x24BDAC7B0](lpfunc, obj, lpdso_handle);
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x24BDAE440](a1, a2);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

