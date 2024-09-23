void CoreOptimization::BFGS::UpdateHessian(uint64_t a1, const double **a2, uint64_t a3, const double **a4)
{
  unint64_t v7;
  double v8;
  _QWORD *v9;
  const std::locale::facet *v10;
  void *__Y;
  double v12;
  _QWORD *v13;
  const std::locale::facet *v14;
  _QWORD *v15;
  _QWORD *v16;
  const std::locale::facet *v17;
  std::locale v18;

  v7 = *(_QWORD *)(a3 + 8) - *(_QWORD *)a3;
  v8 = cblas_ddot(v7 >> 3, *(const double **)a3, 1, *a4, 1);
  if (v8 < 1.0e-30)
  {
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB318], (uint64_t)"DAMN DAMN, a_ys = ", 18);
    v9 = (_QWORD *)std::ostream::operator<<();
    std::ios_base::getloc((const std::ios_base *)((char *)v9 + *(_QWORD *)(*v9 - 24)));
    v10 = std::locale::use_facet(&v18, MEMORY[0x24BEDB350]);
    ((void (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 10);
    std::locale::~locale(&v18);
    std::ostream::put();
    std::ostream::flush();
  }
  if (v7 << 29)
  {
    if (((v7 << 29) & 0x8000000000000000) != 0)
      std::__throw_bad_array_new_length[abi:ne180100]();
    __Y = operator new(v7 & 0x7FFFFFFFFLL);
    bzero(__Y, v7 & 0x7FFFFFFFFLL);
  }
  else
  {
    __Y = 0;
  }
  cblas_dgemv(CblasColMajor, CblasNoTrans, v7 >> 3, v7 >> 3, 1.0, *a2, v7 >> 3, *a4, 1, 0.0, (double *)__Y, 1);
  v12 = cblas_ddot(v7 >> 3, *a4, 1, (const double *)__Y, 1);
  if (v12 < 1.0e-30)
  {
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB318], (uint64_t)"DAMN DAMN, a_sbs = ", 19);
    v13 = (_QWORD *)std::ostream::operator<<();
    std::ios_base::getloc((const std::ios_base *)((char *)v13 + *(_QWORD *)(*v13 - 24)));
    v14 = std::locale::use_facet(&v18, MEMORY[0x24BEDB350]);
    ((void (*)(const std::locale::facet *, uint64_t))v14->__vftable[2].~facet_0)(v14, 10);
    std::locale::~locale(&v18);
    std::ostream::put();
    std::ostream::flush();
  }
  cblas_dgemm(CblasColMajor, CblasNoTrans, CblasNoTrans, v7 >> 3, v7 >> 3, 1, 1.0 / v8, *(const double **)a3, v7 >> 3, *(const double **)a3, 1, 1.0, (double *)*a2, v7 >> 3);
  cblas_dgemm(CblasColMajor, CblasNoTrans, CblasNoTrans, v7 >> 3, v7 >> 3, 1, -1.0 / v12, (const double *)__Y, v7 >> 3, (const double *)__Y, 1, 1.0, (double *)*a2, v7 >> 3);
  v15 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB318], (uint64_t)"Hessian in UpdateHessian: ", 26);
  v16 = operator<<(v15, a2);
  std::ios_base::getloc((const std::ios_base *)((char *)v16 + *(_QWORD *)(*v16 - 24)));
  v17 = std::locale::use_facet(&v18, MEMORY[0x24BEDB350]);
  ((void (*)(const std::locale::facet *, uint64_t))v17->__vftable[2].~facet_0)(v17, 10);
  std::locale::~locale(&v18);
  std::ostream::put();
  std::ostream::flush();
  if (__Y)
    operator delete(__Y);
}

void sub_21EBF9104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::locale a14)
{
  void *v14;

  std::locale::~locale(&a14);
  if (v14)
    operator delete(v14);
  _Unwind_Resume(a1);
}

_QWORD *std::endl[abi:ne180100]<char,std::char_traits<char>>(_QWORD *a1)
{
  const std::locale::facet *v2;
  std::locale v4;

  std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
  v2 = std::locale::use_facet(&v4, MEMORY[0x24BEDB350]);
  ((void (*)(const std::locale::facet *, uint64_t))v2->__vftable[2].~facet_0)(v2, 10);
  std::locale::~locale(&v4);
  std::ostream::put();
  std::ostream::flush();
  return a1;
}

void sub_21EBF91C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
  std::locale::~locale(&a10);
  _Unwind_Resume(a1);
}

uint64_t std::valarray<double>::~valarray(uint64_t a1)
{
  _BYTE *v2;
  _BYTE *v3;

  v2 = *(_BYTE **)a1;
  if (v2)
  {
    v3 = *(_BYTE **)(a1 + 8);
    if (v3 != v2)
      *(_QWORD *)(a1 + 8) = &v3[(v2 - v3 + 7) & 0xFFFFFFFFFFFFFFF8];
    operator delete(v2);
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
  }
  return a1;
}

void CoreOptimization::BFGS::UpdateHessianInv(uint64_t a1, const double **a2, uint64_t a3, const double **a4)
{
  unint64_t v7;
  double v8;
  _QWORD *v9;
  const std::locale::facet *v10;
  _QWORD *v11;
  _QWORD *v12;
  const std::locale::facet *v13;
  _QWORD *v14;
  _QWORD *v15;
  const std::locale::facet *v16;
  void *__Y;
  double v18;
  _QWORD *v19;
  const std::locale::facet *v20;
  double v21;
  std::locale v22;

  v7 = *(_QWORD *)(a3 + 8) - *(_QWORD *)a3;
  v8 = cblas_ddot(v7 >> 3, *(const double **)a3, 1, *a4, 1);
  if (v8 < 1.0e-30)
  {
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB318], (uint64_t)"DAMN DAMN, a_ys = ", 18);
    v9 = (_QWORD *)std::ostream::operator<<();
    std::ios_base::getloc((const std::ios_base *)((char *)v9 + *(_QWORD *)(*v9 - 24)));
    v10 = std::locale::use_facet(&v22, MEMORY[0x24BEDB350]);
    ((void (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 10);
    std::locale::~locale(&v22);
    std::ostream::put();
    std::ostream::flush();
    v11 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB318], (uint64_t)"y = ", 4);
    v12 = operator<<(v11, (_QWORD *)a3);
    std::ios_base::getloc((const std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
    v13 = std::locale::use_facet(&v22, MEMORY[0x24BEDB350]);
    ((void (*)(const std::locale::facet *, uint64_t))v13->__vftable[2].~facet_0)(v13, 10);
    std::locale::~locale(&v22);
    std::ostream::put();
    std::ostream::flush();
    v14 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB318], (uint64_t)"s = ", 4);
    v15 = operator<<(v14, a4);
    std::ios_base::getloc((const std::ios_base *)((char *)v15 + *(_QWORD *)(*v15 - 24)));
    v16 = std::locale::use_facet(&v22, MEMORY[0x24BEDB350]);
    ((void (*)(const std::locale::facet *, uint64_t))v16->__vftable[2].~facet_0)(v16, 10);
    std::locale::~locale(&v22);
    std::ostream::put();
    std::ostream::flush();
  }
  if (v7 << 29)
  {
    if (((v7 << 29) & 0x8000000000000000) != 0)
      std::__throw_bad_array_new_length[abi:ne180100]();
    __Y = operator new(v7 & 0x7FFFFFFFFLL);
    bzero(__Y, v7 & 0x7FFFFFFFFLL);
  }
  else
  {
    __Y = 0;
  }
  cblas_dgemv(CblasColMajor, CblasNoTrans, v7 >> 3, v7 >> 3, 1.0, *a2, v7 >> 3, *(const double **)a3, 1, 0.0, (double *)__Y, 1);
  v18 = cblas_ddot(v7 >> 3, *(const double **)a3, 1, (const double *)__Y, 1);
  if (v18 < 1.0e-30)
  {
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB318], (uint64_t)"DAMN DAMN, a_yby = ", 19);
    v19 = (_QWORD *)std::ostream::operator<<();
    std::ios_base::getloc((const std::ios_base *)((char *)v19 + *(_QWORD *)(*v19 - 24)));
    v20 = std::locale::use_facet(&v22, MEMORY[0x24BEDB350]);
    ((void (*)(const std::locale::facet *, uint64_t))v20->__vftable[2].~facet_0)(v20, 10);
    std::locale::~locale(&v22);
    std::ostream::put();
    std::ostream::flush();
  }
  cblas_dgemm(CblasColMajor, CblasNoTrans, CblasNoTrans, v7 >> 3, v7 >> 3, 1, (v8 + v18) / (v8 * v8), *a4, v7 >> 3, *a4, 1, 1.0, (double *)*a2, v7 >> 3);
  v21 = -1.0 / v8;
  cblas_dgemm(CblasColMajor, CblasNoTrans, CblasNoTrans, v7 >> 3, v7 >> 3, 1, v21, (const double *)__Y, v7 >> 3, *a4, 1, 1.0, (double *)*a2, v7 >> 3);
  cblas_dgemm(CblasColMajor, CblasNoTrans, CblasNoTrans, v7 >> 3, v7 >> 3, 1, v21, *a4, v7 >> 3, (const double *)__Y, 1, 1.0, (double *)*a2, v7 >> 3);
  if (__Y)
    operator delete(__Y);
}

void sub_21EBF9600(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::locale a14)
{
  void *v14;

  std::locale::~locale(&a14);
  if (v14)
    operator delete(v14);
  _Unwind_Resume(a1);
}

void CoreOptimization::BFGS::Solve(uint64_t a1, uint64_t **a2, double **a3, double **a4, char a5)
{
  unint64_t v8;
  __CLPK_doublereal *v9;
  __CLPK_integer *v10;
  uint64_t v11;
  _QWORD *v12;
  const std::locale::facet *v13;
  _QWORD *v14;
  const std::locale::facet *v15;
  _QWORD *v16;
  const std::locale::facet *v17;
  uint64_t v18;
  std::locale::id *v19;
  _QWORD *v20;
  const std::locale::facet *v21;
  uint64_t v22;
  __CLPK_doublereal *v23;
  uint64_t v24;
  uint64_t *v25;
  __CLPK_doublereal *v26;
  uint64_t v27;
  double **v28;
  uint64_t v29;
  double *v30;
  double v31;
  _QWORD *v32;
  uint64_t v33;
  double **v34;
  char __trans;
  __CLPK_integer __info;
  __CLPK_doublereal *v37;
  __CLPK_doublereal *v38;
  __CLPK_integer __lda;
  std::locale v40;
  uint64_t v41;

  v34 = a4;
  v41 = *MEMORY[0x24BDAC8D0];
  v8 = (unint64_t)((char *)a3[1] - (char *)*a3) >> 3;
  __lda = v8;
  std::valarray<double>::valarray(&v37, a2);
  v9 = v37;
  if (v38 == v37)
  {
    v9 = (__CLPK_doublereal *)malloc_type_malloc(0x20uLL, 0x100004000313F17uLL);
    LODWORD(v8) = __lda;
  }
  v10 = (__CLPK_integer *)malloc_type_malloc(4 * (int)v8, 0x100004052888210uLL);
  __info = 0;
  v11 = dgetrf_(&__lda, &__lda, v9, &__lda, v10, &__info);
  if (__info)
  {
    v12 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB318], (uint64_t)"dgetrf failed", 13);
    std::ios_base::getloc((const std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
    v13 = std::locale::use_facet(&v40, MEMORY[0x24BEDB350]);
    ((void (*)(const std::locale::facet *, uint64_t))v13->__vftable[2].~facet_0)(v13, 10);
    std::locale::~locale(&v40);
    std::ostream::put();
    std::ostream::flush();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB318], (uint64_t)"error = ", 8);
    v14 = (_QWORD *)std::ostream::operator<<();
    std::ios_base::getloc((const std::ios_base *)((char *)v14 + *(_QWORD *)(*v14 - 24)));
    v15 = std::locale::use_facet(&v40, MEMORY[0x24BEDB350]);
    ((void (*)(const std::locale::facet *, uint64_t))v15->__vftable[2].~facet_0)(v15, 10);
    std::locale::~locale(&v40);
    std::ostream::put();
    std::ostream::flush();
    v16 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB318], (uint64_t)"matrix[] is:", 12);
    std::ios_base::getloc((const std::ios_base *)((char *)v16 + *(_QWORD *)(*v16 - 24)));
    v17 = std::locale::use_facet(&v40, MEMORY[0x24BEDB350]);
    ((void (*)(const std::locale::facet *, uint64_t))v17->__vftable[2].~facet_0)(v17, 10);
    std::locale::~locale(&v40);
    std::ostream::put();
    std::ostream::flush();
    v18 = 0;
    v19 = (std::locale::id *)MEMORY[0x24BEDB350];
    do
    {
      v20 = (_QWORD *)std::ostream::operator<<();
      std::ios_base::getloc((const std::ios_base *)((char *)v20 + *(_QWORD *)(*v20 - 24)));
      v21 = std::locale::use_facet(&v40, v19);
      ((void (*)(const std::locale::facet *, uint64_t))v21->__vftable[2].~facet_0)(v21, 10);
      std::locale::~locale(&v40);
      std::ostream::put();
      v11 = std::ostream::flush();
      v18 += 8;
    }
    while (v18 != 32);
  }
  LODWORD(v40.__locale_) = 1;
  MEMORY[0x24BDAC7A8](v11);
  v23 = (__CLPK_doublereal *)((char *)&v33 - ((v22 + 15) & 0xFFFFFFFF0));
  v24 = __lda;
  if (__lda >= 1)
  {
    v25 = (uint64_t *)*a3;
    v26 = v23;
    do
    {
      v27 = *v25++;
      *(_QWORD *)v26++ = v27;
      --v24;
    }
    while (v24);
  }
  __info = 0;
  __trans = 78;
  dgetrs_(&__trans, &__lda, (__CLPK_integer *)&v40, v9, &__lda, v10, v23, &__lda, &__info);
  v28 = v34;
  if (__info)
  {
    v32 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB318], (uint64_t)"dgetrs failed", 13);
    std::endl[abi:ne180100]<char,std::char_traits<char>>(v32);
    printf("No.%d value is illegal\n", -__info);
    exit(1);
  }
  v29 = __lda;
  if (__lda >= 1)
  {
    v30 = *v34;
    do
    {
      v31 = *v23++;
      *v30++ = -v31;
      --v29;
    }
    while (v29);
  }
  if ((a5 & 1) != 0)
    printf("H=(%lf, %lf, %lf, %lf), g=(%lf, %lf), p=(%lf, %lf)\n", *(double *)*a2, *((double *)*a2 + 1), *((double *)*a2 + 2), *((double *)*a2 + 3), **a3, (*a3)[1], **v28, (*v28)[1]);
  if (v10)
    free(v10);
  if (v9)
    free(v9);
  if (v37)
  {
    if (v38 != v37)
      v38 = (__CLPK_doublereal *)((char *)v38 + (((char *)v37 - (char *)v38 + 7) & 0xFFFFFFFFFFFFFFF8));
    operator delete(v37);
  }
}

void sub_21EBF9ABC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  _BYTE *v3;
  _BYTE *v4;

  v3 = *(_BYTE **)(v1 - 120);
  if (v3)
  {
    v4 = *(_BYTE **)(v1 - 112);
    if (v4 != v3)
      *(_QWORD *)(v1 - 112) = &v4[(v3 - v4 + 7) & 0xFFFFFFFFFFFFFFF8];
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

_QWORD *CoreOptimization::BFGS::GetSolution@<X0>(uint64_t **this@<X0>, _QWORD *a2@<X8>)
{
  return std::valarray<double>::valarray(a2, this + 3);
}

void CoreOptimization::BFGS::Optimize(CoreOptimization::BFGS *this)
{
  unint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  const std::locale::facet *v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  unint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  const std::locale::facet *v18;
  double v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  const std::locale::facet *v26;
  std::locale::__imp *locale;
  uint64_t v28;
  double *__Y;
  double v30;
  double *v31;
  double *v32;
  uint64_t v33;
  double *v34;
  double v35;
  uint64_t v36;
  std::locale::__imp *v37;
  std::locale::__imp *v38;
  uint64_t v39;
  double *v40;
  double v41;
  double v42;
  std::locale v44;
  std::locale::__imp *v45;
  std::locale v46;
  std::locale::__imp *v47;
  double *__A;
  double *v49;
  void *__p;
  char *v51;
  void *v52;
  char *v53;
  void *v54;
  char *v55;

  v2 = *((_QWORD *)this + 2) - *((_QWORD *)this + 1);
  v54 = 0;
  v55 = 0;
  if (v2 << 29)
  {
    if (((v2 << 29) & 0x8000000000000000) != 0)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v54 = operator new(v2 & 0x7FFFFFFFFLL);
    bzero(v54, v2 & 0x7FFFFFFFFLL);
    v55 = (char *)v54 + (v2 & 0x7FFFFFFFFLL);
    v52 = operator new(v2 & 0x7FFFFFFFFLL);
    bzero(v52, v2 & 0x7FFFFFFFFLL);
    v53 = (char *)v52 + (v2 & 0x7FFFFFFFFLL);
    __p = operator new(v2 & 0x7FFFFFFFFLL);
    bzero(__p, v2 & 0x7FFFFFFFFLL);
    v51 = (char *)__p + (v2 & 0x7FFFFFFFFLL);
  }
  else
  {
    v52 = 0;
    v53 = 0;
    __p = 0;
    v51 = 0;
  }
  v3 = (uint64_t)v2 >> 3;
  __A = 0;
  v49 = 0;
  std::valarray<double>::resize((uint64_t)&__A, (v3 * v3), 0.0);
  if (*(int *)this >= 3)
  {
    v4 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB318], (uint64_t)"B_inv = \n", 9);
    v5 = operator<<(v4, &__A);
    std::ios_base::getloc((const std::ios_base *)((char *)v5 + *(_QWORD *)(*v5 - 24)));
    v6 = std::locale::use_facet(&v46, MEMORY[0x24BEDB350]);
    ((void (*)(const std::locale::facet *, uint64_t))v6->__vftable[2].~facet_0)(v6, 10);
    std::locale::~locale(&v46);
    std::ostream::put();
    std::ostream::flush();
  }
  v7 = __A;
  if ((char *)v49 - (char *)__A >= 1)
    bzero(__A, 8 * (((unint64_t)((char *)v49 - (char *)__A) >> 3) - ((unint64_t)((char *)v49 - (char *)__A) > 7))+ 8);
  if ((int)v3 >= 1)
  {
    v8 = 0;
    v9 = (v2 >> 3);
    do
    {
      *(double *)((char *)v7 + (v8 >> 29)) = 1.0;
      v8 += (v3 << 32) + 0x100000000;
      --v9;
    }
    while (v9);
  }
  v10 = 0;
  do
  {
    CoreOptimization::gradient_t::gradient_t((CoreOptimization::gradient_t *)&v46, v3);
    (*((void (**)(char *, _QWORD, std::locale *))this + 6))((char *)this + 24, *((_QWORD *)this + 8), &v46);
    HIDWORD(v11) = -858993459 * (unsigned __int16)v10;
    LODWORD(v11) = HIDWORD(v11);
    if ((v11 >> 1) <= 0x19999999 && *(int *)this >= 2)
    {
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB318], (uint64_t)"BFGS round ", 11);
      v12 = (_QWORD *)std::ostream::operator<<();
      v13 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)": beta = ", 9);
      v14 = operator<<(v13, (_QWORD *)this + 3);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)" value = ", 9);
      (*((void (**)(char *, _QWORD))this + 5))((char *)this + 24, *((_QWORD *)this + 8));
      v15 = (_QWORD *)std::ostream::operator<<();
      v16 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)" gradient = ", 12);
      v17 = (_QWORD *)operator<<(v16, &v46);
      std::ios_base::getloc((const std::ios_base *)((char *)v17 + *(_QWORD *)(*v17 - 24)));
      v18 = std::locale::use_facet(&v44, MEMORY[0x24BEDB350]);
      ((void (*)(const std::locale::facet *, uint64_t))v18->__vftable[2].~facet_0)(v18, 10);
      std::locale::~locale(&v44);
      std::ostream::put();
      std::ostream::flush();
    }
    v19 = norm((uint64_t)&v46);
    if (v19 >= 0.00001)
    {
      if ((int)v3 >= 1)
      {
        locale = v46.__locale_;
        v28 = (v2 >> 3);
        do
        {
          *(double *)locale = -*(double *)locale;
          locale = (std::locale::__imp *)((char *)locale + 8);
          --v28;
        }
        while (v28);
      }
      __Y = (double *)v52;
      if (v53 - (_BYTE *)v52 >= 1)
        bzero(v52, 8 * (((unint64_t)(v53 - (_BYTE *)v52) >> 3) - ((unint64_t)(v53 - (_BYTE *)v52) > 7)) + 8);
      cblas_dgemv(CblasColMajor, CblasNoTrans, v3, v3, -1.0, __A, v3, (const double *)v46.__locale_, 1, 0.0, __Y, 1);
      CoreOptimization::BFGS::GoldenSectionSearch((uint64_t)this, (uint64_t)this + 24, &v52);
      if ((int)v3 >= 1)
      {
        v31 = (double *)v52;
        v32 = (double *)v54;
        v33 = (v2 >> 3);
        v34 = (double *)*((_QWORD *)this + 3);
        do
        {
          v35 = *v31++;
          *v32++ = v30 * v35;
          *v34 = v30 * v35 + *v34;
          ++v34;
          --v33;
        }
        while (v33);
      }
      CoreOptimization::gradient_t::gradient_t((CoreOptimization::gradient_t *)&v44, v3);
      v36 = (*((uint64_t (**)(char *, _QWORD, std::locale *))this + 6))((char *)this + 24, *((_QWORD *)this + 8), &v44);
      if ((int)v3 >= 1)
      {
        v37 = v44.__locale_;
        v38 = v46.__locale_;
        v39 = (v2 >> 3);
        v40 = (double *)__p;
        do
        {
          v41 = -*(double *)v37;
          *(double *)v37 = v41;
          v37 = (std::locale::__imp *)((char *)v37 + 8);
          v42 = *(double *)v38;
          v38 = (std::locale::__imp *)((char *)v38 + 8);
          *v40++ = v41 - v42;
          --v39;
        }
        while (v39);
      }
      CoreOptimization::BFGS::UpdateHessianInv(v36, (const double **)&__A, (uint64_t)&__p, (const double **)&v54);
      if (v44.__locale_)
      {
        if (v45 != v44.__locale_)
          v45 = (std::locale::__imp *)((char *)v45 + ((v44.__locale_ - v45 + 7) & 0xFFFFFFFFFFFFFFF8));
        operator delete(v44.__locale_);
      }
    }
    else if (*(int *)this >= 2)
    {
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB318], (uint64_t)"BFGS (last) round ", 18);
      v20 = (_QWORD *)std::ostream::operator<<();
      v21 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v20, (uint64_t)": beta = ", 9);
      v22 = operator<<(v21, (_QWORD *)this + 3);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v22, (uint64_t)" value = ", 9);
      (*((void (**)(char *, _QWORD))this + 5))((char *)this + 24, *((_QWORD *)this + 8));
      v23 = (_QWORD *)std::ostream::operator<<();
      v24 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v23, (uint64_t)" gradient = ", 12);
      v25 = (_QWORD *)operator<<(v24, &v46);
      std::ios_base::getloc((const std::ios_base *)((char *)v25 + *(_QWORD *)(*v25 - 24)));
      v26 = std::locale::use_facet(&v44, MEMORY[0x24BEDB350]);
      ((void (*)(const std::locale::facet *, uint64_t))v26->__vftable[2].~facet_0)(v26, 10);
      std::locale::~locale(&v44);
      std::ostream::put();
      std::ostream::flush();
    }
    if (v46.__locale_)
    {
      if (v47 != v46.__locale_)
        v47 = (std::locale::__imp *)((char *)v47 + ((v46.__locale_ - v47 + 7) & 0xFFFFFFFFFFFFFFF8));
      operator delete(v46.__locale_);
    }
    ++v10;
  }
  while (v19 >= 0.00001 && v10 != 10000);
  if (__A)
  {
    if (v49 != __A)
      v49 = (double *)((char *)v49 + (((char *)__A - (char *)v49 + 7) & 0xFFFFFFFFFFFFFFF8));
    operator delete(__A);
  }
  if (__p)
  {
    if (v51 != __p)
      v51 += ((_BYTE *)__p - v51 + 7) & 0xFFFFFFFFFFFFFFF8;
    operator delete(__p);
  }
  if (v52)
  {
    if (v53 != v52)
      v53 += ((_BYTE *)v52 - v53 + 7) & 0xFFFFFFFFFFFFFFF8;
    operator delete(v52);
  }
  if (v54)
  {
    if (v55 != v54)
      v55 += ((_BYTE *)v54 - v55 + 7) & 0xFFFFFFFFFFFFFFF8;
    operator delete(v54);
  }
}

void sub_21EBFA194(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::locale a11, uint64_t a12, uint64_t a13, std::locale a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,void *__p,uint64_t a23,void *a24,uint64_t a25)
{
  if (__p)
    operator delete(__p);
  if (a24)
    operator delete(a24);
  _Unwind_Resume(exception_object);
}

void std::valarray<double>::resize(uint64_t a1, unint64_t a2, double a3)
{
  _BYTE *v6;
  _BYTE *v7;
  double *v8;

  v6 = *(_BYTE **)a1;
  if (v6)
  {
    v7 = *(_BYTE **)(a1 + 8);
    if (v7 != v6)
      *(_QWORD *)(a1 + 8) = &v7[(v6 - v7 + 7) & 0xFFFFFFFFFFFFFFF8];
    operator delete(v6);
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
  }
  if (a2)
  {
    if (a2 >> 61)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v8 = (double *)operator new(8 * a2);
    *(_QWORD *)a1 = v8;
    do
    {
      *v8++ = a3;
      --a2;
    }
    while (a2);
    *(_QWORD *)(a1 + 8) = v8;
  }
}

void CoreOptimization::BFGS::GoldenSectionSearch(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  int v6;
  uint64_t v7;
  double v8;
  _QWORD *v10;
  _QWORD *v11;
  const std::locale::facet *v12;
  std::locale v13;
  uint64_t v14;
  _QWORD *v15;
  double *v16;
  uint64_t v17;
  void *__p;
  _BYTE *v19;
  double v20;

  v20 = 1.0e-30;
  v6 = 100;
  do
  {
    v20 = v20 + v20;
    v7 = (uint64_t)(a3[1] - *a3) >> 3;
    v16 = &v20;
    v17 = v7;
    v15 = a3;
    v14 = a2;
    std::__val_expr<std::_BinaryOp<std::plus<double>,std::valarray<double>,std::__val_expr<std::_BinaryOp<std::multiplies<double>,std::valarray<double>,std::__scalar_expr<double>>>>>::operator std::valarray<double>((double *)&v13, (double **)&__p);
    v8 = (*(double (**)(void **, _QWORD))(a1 + 40))(&__p, *(_QWORD *)(a1 + 64));
    if (__p)
    {
      if (v19 != __p)
        v19 += ((_BYTE *)__p - v19 + 7) & 0xFFFFFFFFFFFFFFF8;
      operator delete(__p);
    }
  }
  while (0.000001 - (*(double (**)(uint64_t, _QWORD))(a1 + 40))(a2, *(_QWORD *)(a1 + 64)) >= -v8 && v6-- != 0);
  if (*(int *)a1 >= 3)
  {
    v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB318], (uint64_t)"search direction: ", 18);
    v11 = operator<<(v10, a3);
    std::ios_base::getloc((const std::ios_base *)((char *)v11 + *(_QWORD *)(*v11 - 24)));
    v12 = std::locale::use_facet(&v13, MEMORY[0x24BEDB350]);
    ((void (*)(const std::locale::facet *, uint64_t))v12->__vftable[2].~facet_0)(v12, 10);
    std::locale::~locale(&v13);
    std::ostream::put();
    std::ostream::flush();
  }
  CoreOptimization::BFGS::GoldenSectionSearch_r(a1, a2, a3, 0.0, v20 * 0.25, v20 * 0.5, 0.01);
}

void sub_21EBFA5B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  std::locale::~locale(&a10);
  _Unwind_Resume(a1);
}

void CoreOptimization::BFGS::Optimize0(CoreOptimization::BFGS *this)
{
  uint64_t *v2;
  unint64_t v3;
  _QWORD *v4;
  double *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  const std::locale::facet *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  std::locale::id *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  const std::locale::facet *v22;
  uint64_t v23;
  std::locale::__imp *locale;
  uint64_t v25;
  double v26;
  double *v27;
  double *v28;
  uint64_t v29;
  double *v30;
  double v31;
  uint64_t v32;
  std::locale::__imp *v33;
  std::locale::__imp *v34;
  uint64_t v35;
  double *v36;
  double v37;
  double v38;
  double *v39;
  std::locale v40;
  std::locale::__imp *v41;
  std::locale v42;
  std::locale::__imp *v43;
  void *__p;
  _BYTE *v45;
  char *v46;
  char *v47;
  void *v48;
  _BYTE *v49;
  void *v50;
  char *v51;
  double *v52;
  char *v53;

  v2 = (uint64_t *)*((_QWORD *)this + 1);
  v3 = *((_QWORD *)this + 2) - (_QWORD)v2;
  v52 = 0;
  v53 = 0;
  if (v3 << 29)
  {
    if (((v3 << 29) & 0x8000000000000000) != 0)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v52 = (double *)operator new(v3 & 0x7FFFFFFFFLL);
    bzero(v52, v3 & 0x7FFFFFFFFLL);
    v39 = v52;
    v53 = (char *)v52 + (v3 & 0x7FFFFFFFFLL);
    v50 = operator new(v3 & 0x7FFFFFFFFLL);
    bzero(v50, v3 & 0x7FFFFFFFFLL);
    v51 = (char *)v50 + (v3 & 0x7FFFFFFFFLL);
    v4 = operator new(v3 & 0x7FFFFFFFFLL);
    v48 = v4;
    bzero(v4, v3 & 0x7FFFFFFFFLL);
    v49 = (char *)v4 + (v3 & 0x7FFFFFFFFLL);
    v46 = (char *)operator new(v3 & 0x7FFFFFFFFLL);
    bzero(v46, v3 & 0x7FFFFFFFFLL);
    v5 = (double *)v46;
    v47 = &v46[v3 & 0x7FFFFFFFFLL];
  }
  else
  {
    v5 = 0;
    v39 = 0;
    v4 = 0;
    v50 = 0;
    v51 = 0;
    v48 = 0;
    v49 = 0;
    v46 = 0;
    v47 = 0;
  }
  v6 = (uint64_t)v3 >> 3;
  if ((int)((uint64_t)v3 >> 3) >= 1)
  {
    v7 = (v3 >> 3);
    do
    {
      v8 = *v2++;
      *v4++ = v8;
      --v7;
    }
    while (v7);
  }
  __p = 0;
  v45 = 0;
  std::valarray<double>::resize((uint64_t)&__p, (v6 * v6), 0.0);
  v9 = operator<<(MEMORY[0x24BEDB318], &__p);
  std::ios_base::getloc((const std::ios_base *)((char *)v9 + *(_QWORD *)(*v9 - 24)));
  v10 = std::locale::use_facet(&v42, MEMORY[0x24BEDB350]);
  ((void (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 10);
  std::locale::~locale(&v42);
  std::ostream::put();
  std::ostream::flush();
  v11 = (char *)__p;
  if (v45 - (_BYTE *)__p >= 1)
    bzero(__p, 8 * (((unint64_t)(v45 - (_BYTE *)__p) >> 3) - ((unint64_t)(v45 - (_BYTE *)__p) > 7)) + 8);
  if ((int)v6 >= 1)
  {
    v12 = 0;
    v13 = (v3 >> 3);
    do
    {
      *(_QWORD *)&v11[v12 >> 29] = 0x3FF0000000000000;
      v12 += (v6 << 32) + 0x100000000;
      --v13;
    }
    while (v13);
  }
  v14 = 0;
  v15 = (std::locale::id *)MEMORY[0x24BEDB350];
  while (1)
  {
    CoreOptimization::gradient_t::gradient_t((CoreOptimization::gradient_t *)&v42, v6);
    (*((void (**)(void **, _QWORD, std::locale *))this + 6))(&v48, *((_QWORD *)this + 8), &v42);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB318], (uint64_t)"BFGS round ", 11);
    v16 = (_QWORD *)std::ostream::operator<<();
    v17 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)": beta = ", 9);
    v18 = operator<<(v17, &v48);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)" value = ", 9);
    (*((void (**)(void **, _QWORD))this + 5))(&v48, *((_QWORD *)this + 8));
    v19 = (_QWORD *)std::ostream::operator<<();
    v20 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, (uint64_t)" gradient = ", 12);
    v21 = (_QWORD *)operator<<(v20, &v42);
    std::ios_base::getloc((const std::ios_base *)((char *)v21 + *(_QWORD *)(*v21 - 24)));
    v22 = std::locale::use_facet(&v40, v15);
    ((void (*)(const std::locale::facet *, uint64_t))v22->__vftable[2].~facet_0)(v22, 10);
    std::locale::~locale(&v40);
    std::ostream::put();
    std::ostream::flush();
    if (norm((uint64_t)&v42) < 0.00001)
      break;
    if ((int)v6 >= 1)
    {
      locale = v42.__locale_;
      v25 = (v3 >> 3);
      do
      {
        *(double *)locale = -*(double *)locale;
        locale = (std::locale::__imp *)((char *)locale + 8);
        --v25;
      }
      while (v25);
    }
    CoreOptimization::BFGS::Solve(v23, (uint64_t **)&__p, (double **)&v42, (double **)&v50, 0);
    CoreOptimization::BFGS::GoldenSectionSearch((uint64_t)this, (uint64_t)&v48, &v50);
    if ((int)v6 >= 1)
    {
      v27 = (double *)v50;
      v28 = (double *)v48;
      v29 = (v3 >> 3);
      v30 = v39;
      do
      {
        v31 = *v27++;
        *v30++ = v26 * v31;
        *v28 = v26 * v31 + *v28;
        ++v28;
        --v29;
      }
      while (v29);
    }
    CoreOptimization::gradient_t::gradient_t((CoreOptimization::gradient_t *)&v40, v6);
    v32 = (*((uint64_t (**)(void **, _QWORD, std::locale *))this + 6))(&v48, *((_QWORD *)this + 8), &v40);
    if ((int)v6 >= 1)
    {
      v33 = v40.__locale_;
      v34 = v42.__locale_;
      v35 = (v3 >> 3);
      v36 = v5;
      do
      {
        v37 = -*(double *)v33;
        *(double *)v33 = v37;
        v33 = (std::locale::__imp *)((char *)v33 + 8);
        v38 = *(double *)v34;
        v34 = (std::locale::__imp *)((char *)v34 + 8);
        *v36++ = v37 - v38;
        --v35;
      }
      while (v35);
    }
    CoreOptimization::BFGS::UpdateHessian(v32, (const double **)&__p, (uint64_t)&v46, (const double **)&v52);
    if (v40.__locale_)
    {
      if (v41 != v40.__locale_)
        v41 = (std::locale::__imp *)((char *)v41 + ((v40.__locale_ - v41 + 7) & 0xFFFFFFFFFFFFFFF8));
      operator delete(v40.__locale_);
    }
    if (v42.__locale_)
    {
      if (v43 != v42.__locale_)
        v43 = (std::locale::__imp *)((char *)v43 + ((v42.__locale_ - v43 + 7) & 0xFFFFFFFFFFFFFFF8));
      operator delete(v42.__locale_);
    }
    if (++v14 == 10000)
      goto LABEL_38;
  }
  if (v42.__locale_)
  {
    if (v43 != v42.__locale_)
      v43 = (std::locale::__imp *)((char *)v43 + ((v42.__locale_ - v43 + 7) & 0xFFFFFFFFFFFFFFF8));
    operator delete(v42.__locale_);
  }
LABEL_38:
  if (__p)
  {
    if (v45 != __p)
      v45 += ((_BYTE *)__p - v45 + 7) & 0xFFFFFFFFFFFFFFF8;
    operator delete(__p);
  }
  if (v5)
  {
    if (v47 != (char *)v5)
      v47 += ((char *)v5 - v47 + 7) & 0xFFFFFFFFFFFFFFF8;
    operator delete(v5);
  }
  if (v48)
  {
    if (v49 != v48)
      v49 += ((_BYTE *)v48 - v49 + 7) & 0xFFFFFFFFFFFFFFF8;
    operator delete(v48);
  }
  if (v50)
  {
    if (v51 != v50)
      v51 += ((_BYTE *)v50 - v51 + 7) & 0xFFFFFFFFFFFFFFF8;
    operator delete(v50);
  }
  if (v39)
    operator delete(v39);
}

void sub_21EBFAB7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::locale a11, uint64_t a12, uint64_t a13, std::locale a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23,void *a24,uint64_t a25)
{
  uint64_t v25;
  void *v27;

  if (__p)
    operator delete(__p);
  if (a24)
    operator delete(a24);
  v27 = *(void **)(v25 - 120);
  if (v27)
    operator delete(v27);
  _Unwind_Resume(exception_object);
}

double CoreOptimization::BFGS::GoldenSectionSearch_r(uint64_t a1, uint64_t a2, _QWORD *a3, double a4, double a5, double a6, double a7)
{
  double v10;
  double v11;
  uint64_t v15;
  double v16;
  uint64_t v17;
  double v18;
  _QWORD *v19;
  const std::locale::facet *v20;
  _QWORD *v21;
  const std::locale::facet *v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  __n128 v26;
  __n128 v27;
  __n128 v28;
  double v29;
  double v30;
  double v31;
  double v33;
  uint64_t v34;
  _QWORD *v35;
  double *v36;
  uint64_t v37;
  void *__p;
  _BYTE *v39;
  std::locale v40;
  uint64_t v41;
  _QWORD *v42;
  unint64_t *v43;
  uint64_t v44;
  void *v45;
  _BYTE *v46;
  unint64_t v47;
  double v48;

  if (a6 - a5 <= a5 - a4)
    v10 = a5 + (a5 - a4) * -0.381966011;
  else
    v10 = a5 + (a6 - a5) * 0.381966011;
  v47 = *(_QWORD *)&v10;
  v48 = a5;
  if (vabdd_f64(a6, a4) >= (fabs(a5) + fabs(v10)) * a7)
  {
    v15 = (uint64_t)(a3[1] - *a3) >> 3;
    v43 = &v47;
    v44 = v15;
    v42 = a3;
    v41 = a2;
    std::__val_expr<std::_BinaryOp<std::plus<double>,std::valarray<double>,std::__val_expr<std::_BinaryOp<std::multiplies<double>,std::valarray<double>,std::__scalar_expr<double>>>>>::operator std::valarray<double>((double *)&v40, (double **)&v45);
    v16 = (*(double (**)(void **, _QWORD))(a1 + 40))(&v45, *(_QWORD *)(a1 + 64));
    v17 = (uint64_t)(a3[1] - *a3) >> 3;
    v36 = &v48;
    v37 = v17;
    v35 = a3;
    v34 = a2;
    std::__val_expr<std::_BinaryOp<std::plus<double>,std::valarray<double>,std::__val_expr<std::_BinaryOp<std::multiplies<double>,std::valarray<double>,std::__scalar_expr<double>>>>>::operator std::valarray<double>(&v33, (double **)&__p);
    v18 = (*(double (**)(void **, _QWORD))(a1 + 40))(&__p, *(_QWORD *)(a1 + 64));
    if (__p)
    {
      if (v39 != __p)
        v39 += ((_BYTE *)__p - v39 + 7) & 0xFFFFFFFFFFFFFFF8;
      operator delete(__p);
    }
    if (v45)
    {
      if (v46 != v45)
        v46 += ((_BYTE *)v45 - v46 + 7) & 0xFFFFFFFFFFFFFFF8;
      operator delete(v45);
    }
    if (v16 == v18)
    {
      v19 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB318], (uint64_t)"Bang!", 5);
      std::ios_base::getloc((const std::ios_base *)((char *)v19 + *(_QWORD *)(*v19 - 24)));
      v20 = std::locale::use_facet(&v40, MEMORY[0x24BEDB350]);
      ((void (*)(const std::locale::facet *, uint64_t))v20->__vftable[2].~facet_0)(v20, 10);
      std::locale::~locale(&v40);
      std::ostream::put();
      std::ostream::flush();
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB318], (uint64_t)"returning ", 10);
      v11 = (a4 + a6) * 0.5;
      v21 = (_QWORD *)std::ostream::operator<<();
      std::ios_base::getloc((const std::ios_base *)((char *)v21 + *(_QWORD *)(*v21 - 24)));
      v22 = std::locale::use_facet(&v40, MEMORY[0x24BEDB350]);
      ((void (*)(const std::locale::facet *, uint64_t))v22->__vftable[2].~facet_0)(v22, 10);
      std::locale::~locale(&v40);
      std::ostream::put();
      std::ostream::flush();
      return v11;
    }
    v23 = (uint64_t)(a3[1] - *a3) >> 3;
    v43 = &v47;
    v44 = v23;
    v42 = a3;
    v41 = a2;
    std::__val_expr<std::_BinaryOp<std::plus<double>,std::valarray<double>,std::__val_expr<std::_BinaryOp<std::multiplies<double>,std::valarray<double>,std::__scalar_expr<double>>>>>::operator std::valarray<double>((double *)&v40, (double **)&v45);
    v24 = (*(double (**)(void **, _QWORD))(a1 + 40))(&v45, *(_QWORD *)(a1 + 64));
    v25 = (uint64_t)(a3[1] - *a3) >> 3;
    v36 = &v48;
    v37 = v25;
    v35 = a3;
    v34 = a2;
    std::__val_expr<std::_BinaryOp<std::plus<double>,std::valarray<double>,std::__val_expr<std::_BinaryOp<std::multiplies<double>,std::valarray<double>,std::__scalar_expr<double>>>>>::operator std::valarray<double>(&v33, (double **)&__p);
    v29 = (*(double (**)(void **, _QWORD))(a1 + 40))(&__p, *(_QWORD *)(a1 + 64));
    if (__p)
    {
      if (v39 != __p)
        v39 += ((_BYTE *)__p - v39 + 7) & 0xFFFFFFFFFFFFFFF8;
      operator delete(__p);
    }
    if (v45)
    {
      if (v46 != v45)
        v46 += ((_BYTE *)v45 - v46 + 7) & 0xFFFFFFFFFFFFFFF8;
      operator delete(v45);
    }
    v28.n128_f64[0] = v48;
    v30 = a6 - v48;
    v31 = v48 - a4;
    if (v24 <= v29)
    {
      if (v30 <= v31)
      {
        v26.n128_u64[0] = v47;
        v27.n128_f64[0] = v48;
        goto LABEL_31;
      }
      v26.n128_f64[0] = a4;
      v27.n128_f64[0] = v48;
      v28.n128_u64[0] = v47;
    }
    else
    {
      if (v30 > v31)
      {
        v26.n128_f64[0] = v48;
        v27.n128_u64[0] = v47;
LABEL_31:
        v28.n128_f64[0] = a6;
        return CoreOptimization::BFGS::GoldenSectionSearch_r(a1, a2, a3, v26, v27, v28, a7);
      }
      v26.n128_f64[0] = a4;
      v27.n128_u64[0] = v47;
    }
    return CoreOptimization::BFGS::GoldenSectionSearch_r(a1, a2, a3, v26, v27, v28, a7);
  }
  return (a4 + a6) * 0.5;
}

void sub_21EBFB0BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, std::locale a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24)
{
  if (__p)
    operator delete(__p);
  if (a23)
    operator delete(a23);
  _Unwind_Resume(exception_object);
}

double *std::__val_expr<std::_BinaryOp<std::plus<double>,std::valarray<double>,std::__val_expr<std::_BinaryOp<std::multiplies<double>,std::valarray<double>,std::__scalar_expr<double>>>>>::operator std::valarray<double>@<X0>(double *result@<X0>, double **a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  double *v5;
  uint64_t v6;
  double *v7;
  uint64_t v8;
  double *v9;
  double *v10;
  double v11;
  double v12;
  double v13;

  *a2 = 0;
  a2[1] = 0;
  v3 = *((_QWORD *)result + 1);
  v5 = *(double **)v3;
  v4 = *(_QWORD *)(v3 + 8);
  v6 = v4 - *(_QWORD *)v3;
  if (v4 != *(_QWORD *)v3)
  {
    if (v6 < 0)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v7 = result;
    result = (double *)operator new(v4 - *(_QWORD *)v3);
    v8 = v6 >> 3;
    *a2 = result;
    a2[1] = result;
    v9 = (double *)*((_QWORD *)v7 + 4);
    v10 = (double *)**((_QWORD **)v7 + 3);
    do
    {
      v11 = *v10++;
      v12 = v11 * *v9;
      v13 = *v5++;
      *result++ = v13 + v12;
      --v8;
    }
    while (v8);
    a2[1] = result;
  }
  return result;
}

void sub_21EBFB1D0(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::valarray<double>::~valarray(v1);
  _Unwind_Resume(a1);
}

double CoreOptimization::BFGS::GoldenSectionSearch0(uint64_t a1, double **a2, double **a3, int a4)
{
  double *v7;
  double *v8;
  _QWORD *v9;
  _QWORD *v10;
  const std::locale::facet *v11;
  int v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  size_t v16;
  uint64_t v17;
  double v18;
  double v19;
  std::locale::__imp *v20;
  double *v21;
  double v22;
  double v23;
  double v24;
  double *v25;
  double *v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  _QWORD *v31;
  _QWORD *v32;
  const std::locale::facet *v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;
  const std::locale::facet *v39;
  double v40;
  double v41;
  double v42;
  void *__p;
  _BYTE *v46;
  std::locale v47;
  std::locale::__imp *v48;
  std::locale v49;

  v8 = *a2;
  v7 = a2[1];
  if (a4)
  {
    v9 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB318], (uint64_t)"searchDirection = ", 18);
    v10 = operator<<(v9, a3);
    std::ios_base::getloc((const std::ios_base *)((char *)v10 + *(_QWORD *)(*v10 - 24)));
    v11 = std::locale::use_facet(&v47, MEMORY[0x24BEDB350]);
    ((void (*)(const std::locale::facet *, uint64_t))v11->__vftable[2].~facet_0)(v11, 10);
    std::locale::~locale(&v47);
    std::ostream::put();
    std::ostream::flush();
  }
  v12 = 0;
  v13 = (char *)v7 - (char *)v8;
  v14 = (unint64_t)((char *)v7 - (char *)v8) >> 3;
  v15 = ((char *)v7 - (char *)v8) << 29;
  v16 = (uint64_t)(v13 << 29) >> 29;
  v17 = (v13 >> 3);
  v18 = 0.01;
  v19 = 0.2;
  do
  {
    v47.__locale_ = 0;
    v48 = 0;
    if (v15)
    {
      if (v15 < 0)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v20 = (std::locale::__imp *)operator new(v16);
      v47.__locale_ = v20;
      bzero(v20, v16);
      v48 = (std::locale::__imp *)((char *)v20 + v16);
      v21 = (double *)operator new(v16);
      __p = v21;
      bzero(v21, v16);
      v46 = (char *)v21 + v16;
    }
    else
    {
      v21 = 0;
      v20 = 0;
      __p = 0;
      v46 = 0;
    }
    v22 = (v19 - v18) / 1.61803399;
    v23 = v18 + v22;
    v24 = v19 - v22;
    if ((int)v14 >= 1)
    {
      v25 = *a2;
      v26 = *a3;
      v27 = v17;
      do
      {
        *(double *)v20 = *v25 + v24 * *v26;
        v20 = (std::locale::__imp *)((char *)v20 + 8);
        v28 = *v25++;
        v29 = v28;
        v30 = *v26++;
        *v21++ = v29 + v23 * v30;
        --v27;
      }
      while (v27);
    }
    if ((a4 & 1) != 0)
    {
      v31 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB318], (uint64_t)"\tx=", 3);
      v32 = operator<<(v31, a2);
      std::ios_base::getloc((const std::ios_base *)((char *)v32 + *(_QWORD *)(*v32 - 24)));
      v33 = std::locale::use_facet(&v49, MEMORY[0x24BEDB350]);
      ((void (*)(const std::locale::facet *, uint64_t))v33->__vftable[2].~facet_0)(v33, 10);
      std::locale::~locale(&v49);
      std::ostream::put();
      std::ostream::flush();
      printf("\t[lo, up]=[%lf, %lf], [nlo, nup]=[%lf, %lf]\n", v18, v19, v24, v23);
      v34 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB318], (uint64_t)"\t[xlo, xhi]=[", 13);
      v35 = operator<<(v34, &v47);
      v36 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v35, (uint64_t)", ", 2);
      v37 = operator<<(v36, &__p);
      v38 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v37, (uint64_t)"]", 1);
      std::ios_base::getloc((const std::ios_base *)((char *)v38 + *(_QWORD *)(*v38 - 24)));
      v39 = std::locale::use_facet(&v49, MEMORY[0x24BEDB350]);
      ((void (*)(const std::locale::facet *, uint64_t))v39->__vftable[2].~facet_0)(v39, 10);
      std::locale::~locale(&v49);
      std::ostream::put();
      std::ostream::flush();
      v40 = (*(double (**)(std::locale *, _QWORD))(a1 + 40))(&v47, *(_QWORD *)(a1 + 64));
      v41 = (*(double (**)(void **, _QWORD))(a1 + 40))(&__p, *(_QWORD *)(a1 + 64));
      printf("\t(vlo, vhi)=(%lf, %lf)\n", -v40, -v41);
    }
    v42 = (*(double (**)(std::locale *, _QWORD))(a1 + 40))(&v47, *(_QWORD *)(a1 + 64));
    if (v42 > (*(double (**)(void **, _QWORD))(a1 + 40))(&__p, *(_QWORD *)(a1 + 64)))
      v19 = v23;
    else
      v18 = v24;
    if (a4)
      printf("range: (%lf, %lf)\n", v18, v19);
    if (__p)
    {
      if (v46 != __p)
        v46 += ((_BYTE *)__p - v46 + 7) & 0xFFFFFFFFFFFFFFF8;
      operator delete(__p);
    }
    if (v47.__locale_)
    {
      if (v48 != v47.__locale_)
        v48 = (std::locale::__imp *)((char *)v48 + ((v47.__locale_ - v48 + 7) & 0xFFFFFFFFFFFFFFF8));
      operator delete(v47.__locale_);
    }
    ++v12;
  }
  while (v12 != 20);
  return (v18 + v19) * 0.5;
}

void sub_21EBFB5CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, std::locale a16, uint64_t a17, std::locale a18)
{
  std::locale::~locale(&a16);
  _Unwind_Resume(a1);
}

CoreOptimization::gradient_t *CoreOptimization::gradient_t::gradient_t(CoreOptimization::gradient_t *this, int a2)
{
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  std::valarray<double>::resize((uint64_t)this, a2, 0.0);
  return this;
}

void sub_21EBFB68C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::valarray<double>::~valarray(v1);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

_QWORD *std::valarray<double>::valarray(_QWORD *a1, uint64_t **a2)
{
  uint64_t *v3;
  size_t v4;
  char *v6;
  uint64_t *v7;
  char *v8;
  uint64_t v9;

  *a1 = 0;
  a1[1] = 0;
  v3 = a2[1];
  v4 = (char *)v3 - (char *)*a2;
  if (v3 != *a2)
  {
    if ((v4 & 0x8000000000000000) != 0)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v6 = (char *)operator new(v4);
    *a1 = v6;
    a1[1] = v6;
    v7 = *a2;
    if (*a2 != a2[1])
    {
      v8 = v6 + 8;
      do
      {
        v9 = *v7++;
        *((_QWORD *)v8 - 1) = v9;
        a1[1] = v8;
        v8 += 8;
      }
      while (v7 != a2[1]);
    }
  }
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

  MEMORY[0x2207B8E04](v13, a1);
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
  MEMORY[0x2207B8E10](v13);
  return a1;
}

void sub_21EBFB850(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x2207B8E10](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x21EBFB830);
}

void sub_21EBFB898(_Unwind_Exception *a1)
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

void sub_21EBFB9CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
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
  __cxa_throw(exception, (struct type_info *)off_24E356CC0, MEMORY[0x24BEDAAF0]);
}

void sub_21EBFBAE0(_Unwind_Exception *a1)
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

void GradientDescent(uint64_t *a1, uint64_t a2, int a3)
{
  _QWORD *v6;
  const std::locale::facet *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  const std::locale::facet *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  const std::locale::facet *v16;
  unsigned int v17;
  _QWORD *v18;
  std::locale::id *v19;
  uint64_t v20;
  std::locale::__imp *locale;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  const std::locale::facet *v25;
  _QWORD *v26;
  const std::locale::facet *v27;
  _QWORD *v28;
  _QWORD *v29;
  const std::locale::facet *v30;
  _QWORD *v31;
  const std::locale::facet *v32;
  std::locale v33;
  std::locale::__imp *v34;
  std::locale v35;
  std::locale::__imp *v36;
  std::locale v37;

  if (a3 >= 2)
  {
    v6 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB318], (uint64_t)" ======= Start of Gradient Descent method ======= ", 50);
    std::ios_base::getloc((const std::ios_base *)((char *)v6 + *(_QWORD *)(*v6 - 24)));
    v7 = std::locale::use_facet(&v35, MEMORY[0x24BEDB350]);
    ((void (*)(const std::locale::facet *, uint64_t))v7->__vftable[2].~facet_0)(v7, 10);
    std::locale::~locale(&v35);
    std::ostream::put();
    std::ostream::flush();
    v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB318], (uint64_t)"f(beta=", 7);
    v9 = operator<<(v8, a1);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)") = ", 4);
    (*(void (**)(uint64_t *, _QWORD))a2)(a1, *(_QWORD *)(a2 + 24));
    v10 = (_QWORD *)std::ostream::operator<<();
    std::ios_base::getloc((const std::ios_base *)((char *)v10 + *(_QWORD *)(*v10 - 24)));
    v11 = std::locale::use_facet(&v35, MEMORY[0x24BEDB350]);
    ((void (*)(const std::locale::facet *, uint64_t))v11->__vftable[2].~facet_0)(v11, 10);
    std::locale::~locale(&v35);
    std::ostream::put();
    std::ostream::flush();
  }
  CoreOptimization::gradient_t::gradient_t((CoreOptimization::gradient_t *)&v35, 15);
  (*(void (**)(uint64_t *, _QWORD, std::locale *))(a2 + 8))(a1, *(_QWORD *)(a2 + 24), &v35);
  if (a3 >= 2)
  {
    v12 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB318], (uint64_t)"g(beta=", 7);
    v13 = operator<<(v12, a1);
    v14 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)")' = ", 5);
    v15 = (_QWORD *)operator<<(v14, &v35);
    std::ios_base::getloc((const std::ios_base *)((char *)v15 + *(_QWORD *)(*v15 - 24)));
    v16 = std::locale::use_facet(&v33, MEMORY[0x24BEDB350]);
    ((void (*)(const std::locale::facet *, uint64_t))v16->__vftable[2].~facet_0)(v16, 10);
    std::locale::~locale(&v33);
    std::ostream::put();
    std::ostream::flush();
  }
  v17 = 0;
  v18 = (_QWORD *)MEMORY[0x24BEDB318];
  v19 = (std::locale::id *)MEMORY[0x24BEDB350];
  while (1)
  {
    CoreOptimization::gradient_t::gradient_t((CoreOptimization::gradient_t *)&v33, 15);
    (*(void (**)(uint64_t *, _QWORD, std::locale *))(a2 + 8))(a1, *(_QWORD *)(a2 + 24), &v35);
    v20 = 0;
    locale = v35.__locale_;
    v22 = *a1;
    do
    {
      *(double *)(v22 + v20) = *(double *)(v22 + v20) + *(double *)((char *)locale + v20) * 0.001;
      v20 += 8;
    }
    while (v20 != 120);
    if (norm((uint64_t)&v35) <= 0.00001)
      break;
    if (a3 >= 2 && !(v17 % 0x3E8))
    {
      v23 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)"beta = ", 7);
      v24 = operator<<(v23, a1);
      std::ios_base::getloc((const std::ios_base *)((char *)v24 + *(_QWORD *)(*v24 - 24)));
      v25 = std::locale::use_facet(&v37, v19);
      ((void (*)(const std::locale::facet *, uint64_t))v25->__vftable[2].~facet_0)(v25, 10);
      std::locale::~locale(&v37);
      std::ostream::put();
      std::ostream::flush();
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)"f() = ", 6);
      (*(void (**)(uint64_t *, _QWORD))a2)(a1, *(_QWORD *)(a2 + 24));
      v26 = (_QWORD *)std::ostream::operator<<();
      std::ios_base::getloc((const std::ios_base *)((char *)v26 + *(_QWORD *)(*v26 - 24)));
      v27 = std::locale::use_facet(&v37, v19);
      ((void (*)(const std::locale::facet *, uint64_t))v27->__vftable[2].~facet_0)(v27, 10);
      std::locale::~locale(&v37);
      std::ostream::put();
      std::ostream::flush();
      (*(void (**)(uint64_t *, _QWORD, std::locale *))(a2 + 8))(a1, *(_QWORD *)(a2 + 24), &v35);
      v28 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)"g() = ", 6);
      v29 = (_QWORD *)operator<<(v28, &v35);
      std::ios_base::getloc((const std::ios_base *)((char *)v29 + *(_QWORD *)(*v29 - 24)));
      v30 = std::locale::use_facet(&v37, v19);
      ((void (*)(const std::locale::facet *, uint64_t))v30->__vftable[2].~facet_0)(v30, 10);
      std::locale::~locale(&v37);
      std::ostream::put();
      std::ostream::flush();
    }
    if (v33.__locale_)
    {
      if (v34 != v33.__locale_)
        v34 = (std::locale::__imp *)((char *)v34 + ((v33.__locale_ - v34 + 7) & 0xFFFFFFFFFFFFFFF8));
      operator delete(v33.__locale_);
    }
    if (++v17 == 100000)
      goto LABEL_22;
  }
  if (v33.__locale_)
  {
    if (v34 != v33.__locale_)
      v34 = (std::locale::__imp *)((char *)v34 + ((v33.__locale_ - v34 + 7) & 0xFFFFFFFFFFFFFFF8));
    operator delete(v33.__locale_);
  }
LABEL_22:
  if (a3 >= 2)
  {
    v31 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB318], (uint64_t)" ======= End of Gradient Descent method ======= ", 48);
    std::ios_base::getloc((const std::ios_base *)((char *)v31 + *(_QWORD *)(*v31 - 24)));
    v32 = std::locale::use_facet(&v33, MEMORY[0x24BEDB350]);
    ((void (*)(const std::locale::facet *, uint64_t))v32->__vftable[2].~facet_0)(v32, 10);
    std::locale::~locale(&v33);
    std::ostream::put();
    std::ostream::flush();
  }
  if (v35.__locale_)
  {
    if (v36 != v35.__locale_)
      v36 = (std::locale::__imp *)((char *)v36 + ((v35.__locale_ - v36 + 7) & 0xFFFFFFFFFFFFFFF8));
    operator delete(v35.__locale_);
  }
}

void sub_21EBFC06C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10, uint64_t a11, uint64_t a12, _BYTE *__p, _BYTE *a14, uint64_t a15, std::locale a16)
{
  std::locale::~locale(&a10);
  if (__p)
  {
    if (a14 != __p)
      a14 += (__p - a14 + 7) & 0xFFFFFFFFFFFFFFF8;
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

double norm(uint64_t a1)
{
  double *v1;
  uint64_t v2;
  unint64_t v3;
  double v4;
  double v5;

  v1 = *(double **)a1;
  v2 = *(_QWORD *)(a1 + 8) - *(_QWORD *)a1;
  if (v2)
  {
    v3 = v2 >> 3;
    if (v3 <= 1)
      v3 = 1;
    v4 = 0.0;
    do
    {
      v5 = *v1++;
      v4 = v4 + v5 * v5;
      --v3;
    }
    while (v3);
  }
  else
  {
    v4 = 0.0;
  }
  return sqrt(v4);
}

_QWORD *operator<<(_QWORD *a1, _QWORD *a2)
{
  _QWORD *v2;
  unint64_t v4;
  const char *v5;
  uint64_t v6;

  v2 = a1;
  if (a2[1] == *a2)
  {
    v5 = "Empty";
    v6 = 5;
  }
  else
  {
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)"(", 1);
    std::ostream::operator<<();
    if (a2[1] - *a2 >= 9uLL)
    {
      v4 = 1;
      do
      {
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v2, (uint64_t)", ", 2);
        std::ostream::operator<<();
        ++v4;
      }
      while (v4 < (uint64_t)(a2[1] - *a2) >> 3);
    }
    v5 = ")";
    a1 = v2;
    v6 = 1;
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)v5, v6);
  return v2;
}

{
  _QWORD *v2;
  unint64_t v4;
  const char *v5;
  uint64_t v6;

  v2 = a1;
  if (a2[1] == *a2)
  {
    v5 = "Empty";
    v6 = 5;
  }
  else
  {
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)"(", 1);
    std::ostream::operator<<();
    if (a2[1] - *a2 >= 9uLL)
    {
      v4 = 1;
      do
      {
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v2, (uint64_t)", ", 2);
        std::ostream::operator<<();
        ++v4;
      }
      while (v4 < (uint64_t)(a2[1] - *a2) >> 3);
    }
    v5 = ")";
    a1 = v2;
    v6 = 1;
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)v5, v6);
  return v2;
}

{
  uint64_t v2;
  unint64_t v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  std::locale::id *v9;
  const std::locale::facet *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v14;
  std::locale v15;

  v2 = a2[1];
  v3 = (unint64_t)(v2 - *a2) >> 3;
  v4 = (int)sqrt((double)(int)v3);
  if ((v4 + 1) * (v4 + 1) == (_DWORD)v3)
    v5 = v4 + 1;
  else
    v5 = v4;
  if ((_DWORD)v5 * (_DWORD)v5 != (_DWORD)v3)
  {
    v14 = std::operator<<[abi:ne180100]<std::char_traits<char>>(MEMORY[0x24BEDB318], "A Hessian is supposed to be a square matrix");
    std::endl[abi:ne180100]<char,std::char_traits<char>>(v14);
    exit(1);
  }
  if (v2 == *a2)
  {
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)"Empty", 5);
  }
  else if ((int)v5 >= 1)
  {
    v7 = 0;
    v8 = 0;
    v9 = (std::locale::id *)MEMORY[0x24BEDB350];
    do
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v10 = std::locale::use_facet(&v15, v9);
      ((void (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 10);
      std::locale::~locale(&v15);
      std::ostream::put();
      std::ostream::flush();
      v11 = v5;
      v12 = v7;
      do
      {
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)"\t", 1);
        std::ostream::operator<<();
        v12 += 8 * v5;
        --v11;
      }
      while (v11);
      ++v8;
      v7 += 8;
    }
    while (v8 != v5);
  }
  return a1;
}

_QWORD *std::operator<<[abi:ne180100]<std::char_traits<char>>(_QWORD *a1, char *__s)
{
  size_t v4;

  v4 = strlen(__s);
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)__s, v4);
}

void sub_21EBFC4A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
  std::locale::~locale(&a10);
  _Unwind_Resume(a1);
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
  return MEMORY[0x24BEDAF30]();
}

{
  return MEMORY[0x24BEDAF48]();
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x24BEDB500](this);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x24BEDB530](this, *(_QWORD *)&__state);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24E356CD8(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24E356CE0(__sz);
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

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

double cblas_ddot(const int __N, const double *__X, const int __incX, const double *__Y, const int __incY)
{
  double result;

  MEMORY[0x24BDB2AB8](*(_QWORD *)&__N, __X, *(_QWORD *)&__incX, __Y, *(_QWORD *)&__incY);
  return result;
}

void cblas_dgemm(const CBLAS_ORDER __Order, const CBLAS_TRANSPOSE __TransA, const CBLAS_TRANSPOSE __TransB, const int __M, const int __N, const int __K, const double __alpha, const double *__A, const int __lda, const double *__B, const int __ldb, const double __beta, double *__C, const int __ldc)
{
  MEMORY[0x24BDB2AC8](*(_QWORD *)&__Order, *(_QWORD *)&__TransA, *(_QWORD *)&__TransB, *(_QWORD *)&__M, *(_QWORD *)&__N, *(_QWORD *)&__K, __A, *(_QWORD *)&__lda, __alpha, __beta);
}

void cblas_dgemv(const CBLAS_ORDER __Order, const CBLAS_TRANSPOSE __TransA, const int __M, const int __N, const double __alpha, const double *__A, const int __lda, const double *__X, const int __incX, const double __beta, double *__Y, const int __incY)
{
  MEMORY[0x24BDB2AD8](*(_QWORD *)&__Order, *(_QWORD *)&__TransA, *(_QWORD *)&__M, *(_QWORD *)&__N, __A, *(_QWORD *)&__lda, __X, *(_QWORD *)&__incX, __alpha, __beta);
}

int dgetrf_(__CLPK_integer *__m, __CLPK_integer *__n, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_integer *__ipiv, __CLPK_integer *__info)
{
  return MEMORY[0x24BDB2D38](__m, __n, __a, __lda, __ipiv, __info);
}

int dgetrs_(char *__trans, __CLPK_integer *__n, __CLPK_integer *__nrhs, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_integer *__ipiv, __CLPK_doublereal *__b, __CLPK_integer *__ldb, __CLPK_integer *__info)
{
  return MEMORY[0x24BDB2D58](__trans, __n, __nrhs, __a, __lda, __ipiv, __b, __ldb);
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

