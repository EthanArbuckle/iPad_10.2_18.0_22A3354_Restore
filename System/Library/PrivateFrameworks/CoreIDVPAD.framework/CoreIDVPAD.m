void sub_213BCFD8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  std::shared_ptr<vision::mod::LivenessCheck_Options>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t std::shared_ptr<vision::mod::LivenessCheck_Options>::~shared_ptr[abi:ne180100](uint64_t result)
{
  uint64_t v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v1 = result;
  v2 = *(std::__shared_weak_count **)(result + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      return v1;
    }
  }
  return result;
}

void sub_213BD048C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,void *__p,uint64_t a27)
{
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;

  std::vector<std::vector<float>>::~vector[abi:ne180100](&a14);
  if (a17)
  {
    a18 = (uint64_t)a17;
    operator delete(a17);
    v31 = a20;
    if (!a20)
    {
LABEL_3:
      v32 = a23;
      if (!a23)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v31 = a20;
    if (!a20)
      goto LABEL_3;
  }
  a21 = (uint64_t)v31;
  operator delete(v31);
  v32 = a23;
  if (!a23)
  {
LABEL_4:
    v33 = __p;
    if (!__p)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_9:
  a24 = (uint64_t)v32;
  operator delete(v32);
  v33 = __p;
  if (!__p)
  {
LABEL_6:

    _Unwind_Resume(a1);
  }
LABEL_5:
  a27 = (uint64_t)v33;
  operator delete(v33);
  goto LABEL_6;
}

uint64_t LivenessActionFromGesture(unint64_t a1)
{
  int v1;
  os_log_t v2;

  v1 = a1;
  if (a1 < 0xB && ((0x73Fu >> a1) & 1) != 0)
    return dword_213C1426C[a1];
  if (!___ZL25LivenessActionFromGesture18PADLivenessGesture_block_invoke_2())
    return 0xFFFFFFFFLL;
  v2 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
  if (!os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {

    return 0xFFFFFFFFLL;
  }
  LivenessActionFromGesture(v1, v2);

  return 0xFFFFFFFFLL;
}

void NSArrayAsVector(_QWORD *a1, void *a2)
{
  id v3;
  unint64_t v4;
  unint64_t i;
  void *v6;
  int v7;
  id v8;

  v3 = a2;
  a1[1] = 0;
  a1[2] = 0;
  *a1 = 0;
  v8 = v3;
  v4 = objc_msgSend(v3, "count");
  if (v4)
    std::vector<float>::__append((uint64_t)a1, v4);
  for (i = 0; i < objc_msgSend(v8, "count"); ++i)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    *(_DWORD *)(*a1 + 4 * i) = v7;

  }
}

void sub_213BD06C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v10;
  void *v12;

  v12 = *(void **)v10;
  if (*(_QWORD *)v10)
  {
    *(_QWORD *)(v10 + 8) = v12;
    operator delete(v12);
  }

  _Unwind_Resume(a1);
}

void **std::vector<std::vector<float>>::~vector[abi:ne180100](void **a1)
{
  char *v2;
  char *v3;
  void *v4;
  char *v5;
  void *v6;
  void *v7;

  v2 = (char *)*a1;
  if (*a1)
  {
    v3 = (char *)a1[1];
    v4 = *a1;
    if (v3 != v2)
    {
      v5 = (char *)a1[1];
      do
      {
        v7 = (void *)*((_QWORD *)v5 - 3);
        v5 -= 24;
        v6 = v7;
        if (v7)
        {
          *((_QWORD *)v3 - 2) = v6;
          operator delete(v6);
        }
        v3 = v5;
      }
      while (v5 != v2);
      v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

void sub_213BD0D88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,void *__p,uint64_t a29)
{
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;

  std::vector<std::vector<float>>::~vector[abi:ne180100](&a16);
  if (a19)
  {
    a20 = (uint64_t)a19;
    operator delete(a19);
    v33 = a22;
    if (!a22)
    {
LABEL_3:
      v34 = a25;
      if (!a25)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v33 = a22;
    if (!a22)
      goto LABEL_3;
  }
  a23 = (uint64_t)v33;
  operator delete(v33);
  v34 = a25;
  if (!a25)
  {
LABEL_4:
    v35 = __p;
    if (!__p)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_9:
  a26 = (uint64_t)v34;
  operator delete(v34);
  v35 = __p;
  if (!__p)
  {
LABEL_6:

    _Unwind_Resume(a1);
  }
LABEL_5:
  a29 = (uint64_t)v35;
  operator delete(v35);
  goto LABEL_6;
}

void sub_213BD1030(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  void *v11;

  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_213BD11F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_213BD14B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_213BD16CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_213BD1CA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  if (__p)
    operator delete(__p);
  std::vector<std::vector<float>>::~vector[abi:ne180100](&a15);

  _Unwind_Resume(a1);
}

id PADVNFaceprintInit(VNFaceObservation *a1)
{
  VNFaceObservation *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _DWORD *v6;
  void *v7;
  double v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = a1;
  -[VNFaceObservation faceprint](v1, "faceprint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "elementCount");

  if (v3)
  {
    -[VNFaceObservation faceprint](v1, "faceprint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "descriptorData");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = (_DWORD *)objc_msgSend(v5, "bytes");

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    do
    {
      LODWORD(v8) = *v6;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v9);

      ++v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    v10 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      PADVNFaceprintInit(v10, v11, v12, v13, v14, v15, v16, v17);

    v7 = 0;
  }

  return v7;
}

void sub_213BD1F3C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_213BD1F94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_213BD1FAC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t ___ZL25LivenessActionFromGesture18PADLivenessGesture_block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  if (!os_variant_has_internal_content())
    return 0;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "persistentDomainForName:", *MEMORY[0x24BDD0D70]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("CIDVPAD.use-verbose-logging"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x24BDBD1C0];
  v4 = objc_msgSend(v2, "BOOLValue");

  return v4;
}

void sub_213BD2074(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_213BD2094(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void std::__shared_ptr_emplace<vision::mod::LivenessCheck_Options>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_24D0CF2A8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<vision::mod::LivenessCheck_Options>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_24D0CF2A8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2199BEEB0);
}

void std::__shared_ptr_emplace<vision::mod::LivenessCheckPredictor>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_24D0CF2F8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<vision::mod::LivenessCheckPredictor>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_24D0CF2F8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2199BEEB0);
}

void std::__shared_ptr_emplace<vision::mod::LivenessCheckPredictor>::__on_zero_shared(uint64_t a1)
{
  vision::mod::LivenessCheckPredictor::~LivenessCheckPredictor((vision::mod::LivenessCheckPredictor *)(a1 + 24));
}

void std::vector<float>::__append(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _BYTE *v13;
  char *v14;
  size_t v15;
  char *v16;
  char *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _OWORD *v21;
  char *v22;
  uint64_t v23;
  __int128 v24;
  int v25;

  v5 = *(char **)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  v6 = v5;
  if (a2 <= (v4 - (uint64_t)v5) >> 2)
  {
    if (a2)
    {
      bzero(v5, 4 * a2);
      v6 = &v5[4 * a2];
    }
    *(_QWORD *)(a1 + 8) = v6;
  }
  else
  {
    v7 = *(char **)a1;
    v8 = (uint64_t)&v5[-*(_QWORD *)a1];
    v9 = v8 >> 2;
    v10 = (v8 >> 2) + a2;
    if (v10 >> 62)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v11 = v4 - (_QWORD)v7;
    if (v11 >> 1 > v10)
      v10 = v11 >> 1;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFFCLL)
      v12 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    if (v12)
    {
      if (v12 >> 62)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v13 = operator new(4 * v12);
    }
    else
    {
      v13 = 0;
    }
    v14 = &v13[4 * v9];
    v15 = 4 * a2;
    v16 = &v13[4 * v12];
    bzero(v14, v15);
    v17 = &v14[v15];
    if (v5 != v7)
    {
      v18 = v5 - v7 - 4;
      if (v18 < 0x2C)
        goto LABEL_29;
      if ((unint64_t)(v5 - v13 - v8) < 0x20)
        goto LABEL_29;
      v19 = (v18 >> 2) + 1;
      v20 = 4 * (v19 & 0x7FFFFFFFFFFFFFF8);
      v6 = &v5[-v20];
      v14 -= v20;
      v21 = &v13[4 * v9 - 16];
      v22 = v5 - 16;
      v23 = v19 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        v24 = *(_OWORD *)v22;
        *(v21 - 1) = *((_OWORD *)v22 - 1);
        *v21 = v24;
        v21 -= 2;
        v22 -= 32;
        v23 -= 8;
      }
      while (v23);
      if (v19 != (v19 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_29:
        do
        {
          v25 = *((_DWORD *)v6 - 1);
          v6 -= 4;
          *((_DWORD *)v14 - 1) = v25;
          v14 -= 4;
        }
        while (v6 != v7);
      }
    }
    *(_QWORD *)a1 = v14;
    *(_QWORD *)(a1 + 8) = v17;
    *(_QWORD *)(a1 + 16) = v16;
    if (v7)
      operator delete(v7);
  }
}

void std::vector<float>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24D0CECE8, MEMORY[0x24BEDAAF0]);
}

void sub_213BD235C(_Unwind_Exception *a1)
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

void std::vector<std::vector<float>>::__append(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;
  size_t v15;
  char *v16;
  char *v17;
  __int128 v18;
  _QWORD *v19;
  _QWORD *v20;
  void *v21;
  void *v22;

  v5 = *(_QWORD **)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - (uint64_t)v5) >> 3) >= a2)
  {
    if (a2)
    {
      v12 = 24 * ((24 * a2 - 24) / 0x18) + 24;
      bzero(*(void **)(a1 + 8), v12);
      v5 = (_QWORD *)((char *)v5 + v12);
    }
    *(_QWORD *)(a1 + 8) = v5;
  }
  else
  {
    v6 = *(_QWORD **)a1;
    v7 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v5 - *(_QWORD *)a1) >> 3);
    v8 = v7 + a2;
    if (v7 + a2 > 0xAAAAAAAAAAAAAAALL)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v9 = 0xAAAAAAAAAAAAAAABLL * ((v4 - (uint64_t)v6) >> 3);
    if (2 * v9 > v8)
      v8 = 2 * v9;
    if (v9 >= 0x555555555555555)
      v10 = 0xAAAAAAAAAAAAAAALL;
    else
      v10 = v8;
    if (v10)
    {
      if (v10 > 0xAAAAAAAAAAAAAAALL)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v11 = (char *)operator new(24 * v10);
    }
    else
    {
      v11 = 0;
    }
    v13 = &v11[24 * v7];
    v14 = &v11[24 * v10];
    v15 = 24 * ((24 * a2 - 24) / 0x18) + 24;
    bzero(v13, v15);
    v16 = &v13[v15];
    if (v5 == v6)
    {
      *(_QWORD *)a1 = v13;
      *(_QWORD *)(a1 + 8) = v16;
      *(_QWORD *)(a1 + 16) = v14;
      if (v5)
LABEL_24:
        operator delete(v5);
    }
    else
    {
      do
      {
        v17 = v13;
        *((_QWORD *)v13 - 2) = 0;
        *((_QWORD *)v13 - 1) = 0;
        v18 = *(_OWORD *)(v5 - 3);
        v5 -= 3;
        *(_OWORD *)(v13 - 24) = v18;
        v13 -= 24;
        *((_QWORD *)v17 - 1) = v5[2];
        *v5 = 0;
        v5[1] = 0;
        v5[2] = 0;
      }
      while (v5 != v6);
      v19 = *(_QWORD **)a1;
      v5 = *(_QWORD **)(a1 + 8);
      *(_QWORD *)a1 = v13;
      *(_QWORD *)(a1 + 8) = v16;
      *(_QWORD *)(a1 + 16) = v14;
      if (v5 != v19)
      {
        v20 = v5;
        do
        {
          v22 = (void *)*(v20 - 3);
          v20 -= 3;
          v21 = v22;
          if (v22)
          {
            *(v5 - 2) = v21;
            operator delete(v21);
          }
          v5 = v20;
        }
        while (v20 != v19);
        v5 = v19;
      }
      if (v5)
        goto LABEL_24;
    }
  }
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

vision::mod::LivenessCheckPredictor *vision::mod::LivenessCheckPredictor::LivenessCheckPredictor(vision::mod::LivenessCheckPredictor *this, const LivenessCheck_Options *a2)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  void ***v8;
  vImagePixelCount v9;
  vImagePixelCount v10;
  vImagePixelCount v11;
  vImagePixelCount v12;
  vImagePixelCount v13;
  vImagePixelCount v14;
  unint64_t v15;
  unint64_t v16;
  _DWORD *v17;
  void **v18;
  void **v19;
  void **v20;
  void **v21;
  void *v22;
  char *v23;
  char *v24;
  char *v25;
  char *v26;
  void *v27;
  void *v28;
  char *v29;
  char *v30;
  void *v31;
  char *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  char *v38;
  void *__p;
  char *v40;
  __int128 v41;
  uint64_t v42;

  v3 = *(_OWORD *)a2;
  v4 = *((_OWORD *)a2 + 2);
  *((_OWORD *)this + 1) = *((_OWORD *)a2 + 1);
  *((_OWORD *)this + 2) = v4;
  *(_OWORD *)this = v3;
  v5 = *((_OWORD *)a2 + 3);
  v6 = *((_OWORD *)a2 + 4);
  v7 = *((_OWORD *)a2 + 6);
  *((_OWORD *)this + 5) = *((_OWORD *)a2 + 5);
  *((_OWORD *)this + 6) = v7;
  *((_OWORD *)this + 3) = v5;
  *((_OWORD *)this + 4) = v6;
  *((_DWORD *)this + 28) = 0;
  *(_OWORD *)((char *)this + 120) = 0u;
  *((_WORD *)this + 58) = 0;
  v8 = (void ***)((char *)this + 488);
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 184) = 0u;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *(_OWORD *)((char *)this + 232) = 0u;
  *(_OWORD *)((char *)this + 248) = 0u;
  *((_DWORD *)this + 74) = 0;
  *(_OWORD *)((char *)this + 264) = 0u;
  *(_OWORD *)((char *)this + 280) = 0u;
  *((_QWORD *)this + 61) = 0;
  *((_QWORD *)this + 62) = 0;
  *((_DWORD *)this + 128) = 0;
  *((_QWORD *)this + 63) = 0;
  *((_DWORD *)this + 130) = 1041865114;
  *((_BYTE *)this + 524) = 0;
  v9 = *((int *)a2 + 24);
  *((_DWORD *)this + 76) = v9;
  v10 = *((int *)a2 + 25);
  *((_DWORD *)this + 77) = v10;
  *((_DWORD *)this + 129) = *((_DWORD *)a2 + 22);
  *((int32x2_t *)this + 66) = vrev64_s32(*(int32x2_t *)((char *)a2 + 104));
  vImageBuffer_Init((vImage_Buffer *)((char *)this + 312), v9, v10, 0x20u, 0x100u);
  v11 = *((int *)this + 77);
  *((_QWORD *)this + 42) = 4 * v11;
  vImageBuffer_Init((vImage_Buffer *)((char *)this + 344), *((int *)this + 76), v11, 0x18u, 0x100u);
  v12 = *((int *)this + 77);
  *((_QWORD *)this + 46) = 3 * v12;
  vImageBuffer_Init((vImage_Buffer *)((char *)this + 376), *((int *)this + 76), v12, 0x60u, 0x100u);
  v13 = *((int *)this + 77);
  *((_QWORD *)this + 50) = 12 * (int)v13;
  vImageBuffer_Init((vImage_Buffer *)((char *)this + 408), *((int *)this + 76), v13, 0x60u, 0x100u);
  v14 = *((int *)this + 77);
  *((_QWORD *)this + 54) = 12 * (int)v14;
  vImageBuffer_Init((vImage_Buffer *)((char *)this + 440), *((int *)this + 76), v14, 0x60u, 0x100u);
  *((_QWORD *)this + 58) = 12 * *((_DWORD *)this + 77);
  *((_DWORD *)this + 128) = 0;
  v15 = *((int *)this + 133);
  v16 = *((int *)this + 132);
  v17 = operator new(0xCuLL);
  v37 = v17 + 3;
  v38 = (char *)(v17 + 3);
  *(_QWORD *)v17 = 0;
  v17[2] = 0;
  v36 = v17;
  std::vector<std::vector<float>>::vector(&__p, v16, (uint64_t)&v36);
  std::vector<std::vector<std::vector<float>>>::vector(&v41, v15, (uint64_t *)&__p);
  v18 = *v8;
  if (*v8)
  {
    v19 = (void **)*((_QWORD *)this + 62);
    v20 = *v8;
    if (v19 != v18)
    {
      v21 = (void **)*((_QWORD *)this + 62);
      do
      {
        v24 = (char *)*(v21 - 3);
        v21 -= 3;
        v23 = v24;
        if (v24)
        {
          v25 = (char *)*(v19 - 2);
          v22 = v23;
          if (v25 != v23)
          {
            v26 = (char *)*(v19 - 2);
            do
            {
              v28 = (void *)*((_QWORD *)v26 - 3);
              v26 -= 24;
              v27 = v28;
              if (v28)
              {
                *((_QWORD *)v25 - 2) = v27;
                operator delete(v27);
              }
              v25 = v26;
            }
            while (v26 != v23);
            v22 = *v21;
          }
          *(v19 - 2) = v23;
          operator delete(v22);
        }
        v19 = v21;
      }
      while (v21 != v18);
      v20 = *v8;
    }
    *((_QWORD *)this + 62) = v18;
    operator delete(v20);
    *v8 = 0;
    v8[1] = 0;
    v8[2] = 0;
  }
  *(_OWORD *)v8 = v41;
  *((_QWORD *)this + 63) = v42;
  v42 = 0;
  v41 = 0uLL;
  v29 = (char *)__p;
  if (__p)
  {
    v30 = v40;
    v31 = __p;
    if (v40 != __p)
    {
      v32 = v40;
      do
      {
        v34 = (void *)*((_QWORD *)v32 - 3);
        v32 -= 24;
        v33 = v34;
        if (v34)
        {
          *((_QWORD *)v30 - 2) = v33;
          operator delete(v33);
        }
        v30 = v32;
      }
      while (v32 != v29);
      v31 = __p;
    }
    v40 = v29;
    operator delete(v31);
  }
  if (v36)
  {
    v37 = v36;
    operator delete(v36);
  }
  return this;
}

void sub_213BD2890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12)
{
  _QWORD *v12;
  void ***v13;
  void **v14;
  void *v16;
  void *v17;
  void *v18;

  std::vector<std::vector<float>>::~vector[abi:ne180100](&a12);
  if (__p)
  {
    operator delete(__p);
    std::vector<std::vector<std::vector<float>>>::~vector[abi:ne180100](v13);
    v16 = (void *)v12[34];
    if (!v16)
    {
LABEL_3:
      v17 = (void *)v12[18];
      if (!v17)
        goto LABEL_4;
      goto LABEL_8;
    }
  }
  else
  {
    std::vector<std::vector<std::vector<float>>>::~vector[abi:ne180100](v13);
    v16 = (void *)v12[34];
    if (!v16)
      goto LABEL_3;
  }
  v12[35] = v16;
  operator delete(v16);
  v17 = (void *)v12[18];
  if (!v17)
  {
LABEL_4:
    v18 = *v14;
    if (!*v14)
      goto LABEL_5;
    goto LABEL_9;
  }
LABEL_8:
  v12[19] = v17;
  operator delete(v17);
  v18 = *v14;
  if (!*v14)
LABEL_5:
    _Unwind_Resume(a1);
LABEL_9:
  v12[16] = v18;
  operator delete(v18);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<std::vector<std::vector<float>>>::vector(_QWORD *a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    if (a2 >= 0xAAAAAAAAAAAAAABLL)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v5 = 3 * a2;
    v6 = operator new(24 * a2);
    *a1 = v6;
    a1[1] = v6;
    v7 = &v6[v5];
    a1[2] = &v6[v5];
    do
    {
      std::vector<std::vector<float>>::vector(v6, a3);
      v6 += 3;
      v5 -= 3;
    }
    while (v5 * 8);
    a1[1] = v7;
  }
  return a1;
}

void sub_213BD29E8(_Unwind_Exception *exception_object)
{
  void ***v1;

  if (*v1)
    std::vector<std::vector<std::vector<float>>>::vector(v1 + 1, *v1, (void **)v1);
  _Unwind_Resume(exception_object);
}

void ***std::vector<std::vector<std::vector<float>>>::~vector[abi:ne180100](void ***a1)
{
  void **v2;
  void **v3;
  void **v4;
  void **v5;
  void *v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  void *v11;
  void *v12;

  v2 = *a1;
  if (*a1)
  {
    v3 = a1[1];
    v4 = *a1;
    if (v3 != v2)
    {
      v5 = a1[1];
      do
      {
        v8 = (char *)*(v5 - 3);
        v5 -= 3;
        v7 = v8;
        if (v8)
        {
          v9 = (char *)*(v3 - 2);
          v6 = v7;
          if (v9 != v7)
          {
            v10 = (char *)*(v3 - 2);
            do
            {
              v12 = (void *)*((_QWORD *)v10 - 3);
              v10 -= 24;
              v11 = v12;
              if (v12)
              {
                *((_QWORD *)v9 - 2) = v11;
                operator delete(v11);
              }
              v9 = v10;
            }
            while (v10 != v7);
            v6 = *v5;
          }
          *(v3 - 2) = v7;
          operator delete(v6);
        }
        v3 = v5;
      }
      while (v5 != v2);
      v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

void vision::mod::LivenessCheckPredictor::~LivenessCheckPredictor(vision::mod::LivenessCheckPredictor *this)
{
  void **v2;
  void **v3;
  void *v4;
  void **v5;
  void *v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v2 = (void **)*((_QWORD *)this + 61);
  if (v2)
  {
    v3 = (void **)*((_QWORD *)this + 62);
    v4 = (void *)*((_QWORD *)this + 61);
    if (v3 != v2)
    {
      v5 = (void **)*((_QWORD *)this + 62);
      do
      {
        v8 = (char *)*(v5 - 3);
        v5 -= 3;
        v7 = v8;
        if (v8)
        {
          v9 = (char *)*(v3 - 2);
          v6 = v7;
          if (v9 != v7)
          {
            v10 = (char *)*(v3 - 2);
            do
            {
              v12 = (void *)*((_QWORD *)v10 - 3);
              v10 -= 24;
              v11 = v12;
              if (v12)
              {
                *((_QWORD *)v9 - 2) = v11;
                operator delete(v11);
              }
              v9 = v10;
            }
            while (v10 != v7);
            v6 = *v5;
          }
          *(v3 - 2) = v7;
          operator delete(v6);
        }
        v3 = v5;
      }
      while (v5 != v2);
      v4 = (void *)*((_QWORD *)this + 61);
    }
    *((_QWORD *)this + 62) = v2;
    operator delete(v4);
  }
  v13 = (void *)*((_QWORD *)this + 34);
  if (v13)
  {
    *((_QWORD *)this + 35) = v13;
    operator delete(v13);
  }
  v14 = (void *)*((_QWORD *)this + 18);
  if (v14)
  {
    *((_QWORD *)this + 19) = v14;
    operator delete(v14);
  }
  v15 = (void *)*((_QWORD *)this + 15);
  if (v15)
  {
    *((_QWORD *)this + 16) = v15;
    operator delete(v15);
  }
}

_QWORD *vision::mod::LivenessCheckPredictor::getRaiseEyebrowsReferenceIndex@<X0>(_QWORD *this@<X0>, _QWORD *a2@<X8>)
{
  _BYTE *v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  v4 = (_BYTE *)this[18];
  v3 = (_BYTE *)this[19];
  v5 = v3 - v4;
  if (v3 != v4)
  {
    if (v5 < 0)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v6 = (char *)operator new(v3 - v4);
    *a2 = v6;
    v7 = &v6[4 * (v5 >> 2)];
    a2[2] = v7;
    this = memcpy(v6, v4, v5);
    a2[1] = v7;
  }
  return this;
}

void sub_213BD2C24(_Unwind_Exception *exception_object)
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

_QWORD *vision::mod::LivenessCheckPredictor::getIDmatchingFrameIndex@<X0>(_QWORD *this@<X0>, _QWORD *a2@<X8>)
{
  _BYTE *v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  v4 = (_BYTE *)this[15];
  v3 = (_BYTE *)this[16];
  v5 = v3 - v4;
  if (v3 != v4)
  {
    if (v5 < 0)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v6 = (char *)operator new(v3 - v4);
    *a2 = v6;
    v7 = &v6[4 * (v5 >> 2)];
    a2[2] = v7;
    this = memcpy(v6, v4, v5);
    a2[1] = v7;
  }
  return this;
}

void sub_213BD2CB0(_Unwind_Exception *exception_object)
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

uint64_t vision::mod::LivenessCheckPredictor::getActionFinish(vision::mod::LivenessCheckPredictor *this)
{
  return *((unsigned __int8 *)this + 117);
}

float vision::mod::LivenessCheckPredictor::getNonStitchProb(vision::mod::LivenessCheckPredictor *this)
{
  return *((float *)this + 67);
}

float vision::mod::LivenessCheckPredictor::getIDmatchingScore(vision::mod::LivenessCheckPredictor *this)
{
  return *((float *)this + 74);
}

uint64_t vision::mod::LivenessCheckPredictor::getSpoofType(vision::mod::LivenessCheckPredictor *this)
{
  return *((unsigned int *)this + 75);
}

float vision::mod::LivenessCheckPredictor::Euclidian_distance(vision::mod::LivenessCheckPredictor *this, float a2, float a3, float a4, float a5)
{
  float v5;

  v5 = (float)(a2 - a4) * (float)(a2 - a4) + (float)(a3 - a5) * (float)(a3 - a5);
  return sqrtf(v5);
}

float vision::mod::LivenessCheckPredictor::computeMouthHeight(uint64_t a1, float32x2_t **a2)
{
  float64x2_t v2;
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;

  v2 = vcvtq_f64_f32(vsub_f32((*a2)[34], (*a2)[39]));
  *(float *)v2.f64 = vaddvq_f64(vmulq_f64(v2, v2));
  v3 = vcvtq_f64_f32(vsub_f32((*a2)[35], (*a2)[38]));
  *(float *)v3.f64 = vaddvq_f64(vmulq_f64(v3, v3));
  *(float *)v2.f64 = (float)(sqrtf(*(float *)v2.f64) + 0.0) + sqrtf(*(float *)v3.f64);
  v4 = vcvtq_f64_f32(vsub_f32((*a2)[36], (*a2)[37]));
  *(float *)v4.f64 = vaddvq_f64(vmulq_f64(v4, v4));
  v2.f64[0] = (float)(*(float *)v2.f64 + sqrtf(*(float *)v4.f64));
  v5 = vcvtq_f64_f32(vsub_f32((*a2)[33], (*a2)[29]));
  *(float *)v5.f64 = vaddvq_f64(vmulq_f64(v5, v5));
  return v2.f64[0] / (sqrtf(*(float *)v5.f64) * 3.0);
}

float vision::mod::LivenessCheckPredictor::computeEyebrow2EyeHeight(uint64_t a1, float32x2_t **a2)
{
  float64x2_t v2;
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;

  v2 = vcvtq_f64_f32(vsub_f32((*a2)[1], (*a2)[15]));
  *(float *)v2.f64 = vaddvq_f64(vmulq_f64(v2, v2));
  v3 = vcvtq_f64_f32(vsub_f32((*a2)[2], (*a2)[14]));
  *(float *)v3.f64 = vaddvq_f64(vmulq_f64(v3, v3));
  *(float *)v2.f64 = (float)(sqrtf(*(float *)v2.f64) + 0.0) + sqrtf(*(float *)v3.f64);
  v4 = vcvtq_f64_f32(vsub_f32((*a2)[5], (*a2)[23]));
  *(float *)v4.f64 = vaddvq_f64(vmulq_f64(v4, v4));
  *(float *)v2.f64 = *(float *)v2.f64 + sqrtf(*(float *)v4.f64);
  v5 = vcvtq_f64_f32(vsub_f32((*a2)[6], (*a2)[22]));
  *(float *)v5.f64 = vaddvq_f64(vmulq_f64(v5, v5));
  return (float)(*(float *)v2.f64 + sqrtf(*(float *)v5.f64)) * 0.25;
}

float vision::mod::LivenessCheckPredictor::computeEyeAspectRatio(uint64_t a1, uint64_t a2)
{
  float32x2_t v2;
  float32x2_t v3;
  float32x2_t v4;
  float32x2_t v5;
  float32x2_t v6;
  float32x2_t v7;
  float32x2_t v8;
  float32x2_t v9;
  float32x2_t v10;
  float32x2_t v11;
  float32x2_t v12;
  float32x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float32x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  float32x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;

  v2.i32[0] = *(_DWORD *)(*(_QWORD *)a2 + 72);
  v3.i32[0] = *(_DWORD *)(*(_QWORD *)a2 + 76);
  v4.i32[0] = *(_DWORD *)(*(_QWORD *)a2 + 120);
  v5.i32[0] = *(_DWORD *)(*(_QWORD *)a2 + 124);
  v7.i32[0] = *(_DWORD *)(*(_QWORD *)a2 + 88);
  v6.i32[0] = *(_DWORD *)(*(_QWORD *)a2 + 92);
  v9.i32[0] = *(_DWORD *)(*(_QWORD *)a2 + 112);
  v8.i32[0] = *(_DWORD *)(*(_QWORD *)a2 + 116);
  v11.i32[0] = *(_DWORD *)(*(_QWORD *)a2 + 64);
  v10.i32[0] = *(_DWORD *)(*(_QWORD *)a2 + 68);
  v13.i32[0] = *(_DWORD *)(*(_QWORD *)a2 + 104);
  v12.i32[0] = *(_DWORD *)(*(_QWORD *)a2 + 108);
  v2.i32[1] = *(_DWORD *)(*(_QWORD *)a2 + 136);
  v4.i32[1] = *(_DWORD *)(*(_QWORD *)a2 + 184);
  v3.i32[1] = *(_DWORD *)(*(_QWORD *)a2 + 140);
  v5.i32[1] = *(_DWORD *)(*(_QWORD *)a2 + 188);
  v14 = vcvtq_f64_f32(vsub_f32(v2, v4));
  v15 = vcvtq_f64_f32(vsub_f32(v3, v5));
  v7.i32[1] = *(_DWORD *)(*(_QWORD *)a2 + 152);
  v9.i32[1] = *(_DWORD *)(*(_QWORD *)a2 + 168);
  v6.i32[1] = *(_DWORD *)(*(_QWORD *)a2 + 156);
  v8.i32[1] = *(_DWORD *)(*(_QWORD *)a2 + 172);
  v16 = vsub_f32(v6, v8);
  v17 = vcvtq_f64_f32(vsub_f32(v7, v9));
  v18 = vcvtq_f64_f32(v16);
  v11.i32[1] = *(_DWORD *)(*(_QWORD *)a2 + 128);
  v13.i32[1] = *(_DWORD *)(*(_QWORD *)a2 + 160);
  v10.i32[1] = *(_DWORD *)(*(_QWORD *)a2 + 132);
  v12.i32[1] = *(_DWORD *)(*(_QWORD *)a2 + 164);
  v19 = vsub_f32(v10, v12);
  v20 = vcvtq_f64_f32(vsub_f32(v11, v13));
  v21 = vcvtq_f64_f32(v19);
  v22 = vcvtq_f64_f32(vsqrt_f32(vcvt_f32_f64(vaddq_f64(vmulq_f64(v20, v20), vmulq_f64(v21, v21)))));
  return vaddv_f32(vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32(vadd_f32(vadd_f32(vsqrt_f32(vcvt_f32_f64(vaddq_f64(vmulq_f64(v14, v14), vmulq_f64(v15, v15)))), 0), vsqrt_f32(vcvt_f32_f64(vaddq_f64(vmulq_f64(v17, v17), vmulq_f64(v18, v18)))))), vmaxnmq_f64(vaddq_f64(v22, v22), (float64x2_t)vdupq_n_s64(0x3DDB7CDFD9D7BDBBuLL)))))* 0.5;
}

uint64_t vision::mod::LivenessCheckPredictor::getMaxAngle(vision::mod::LivenessCheckPredictor *this, float a2, float a3, float a4)
{
  float v4;
  float v5;
  float v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;

  v4 = fabsf(a2);
  v5 = fabsf(a3);
  v6 = fabsf(a4);
  if (v4 > v5)
  {
    v7 = v4 == v6;
    v8 = v4 < v6;
  }
  else
  {
    v7 = 1;
    v8 = 0;
  }
  if (!v8 && !v7)
    return 0;
  if (v5 > v4)
  {
    v9 = v5 == v6;
    v10 = v5 < v6;
  }
  else
  {
    v9 = 1;
    v10 = 0;
  }
  if (!v10 && !v9)
    return 1;
  if (v6 > v5)
  {
    v11 = v6 == v4;
    v12 = v6 < v4;
  }
  else
  {
    v11 = 1;
    v12 = 0;
  }
  if (v12 || v11)
    return 0;
  else
    return 2;
}

uint64_t vision::mod::LivenessCheckPredictor::runStitchDetector(vision::mod::LivenessCheckPredictor *this, const vImage_Buffer *src, BOOL *a3, float *a4, int a5)
{
  const vImage_Buffer *v9;
  unint64_t v10;
  uint64_t v11;
  int v12;
  float v13;
  uint64_t v14;
  int i;
  int v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  float v25;
  _QWORD **v26;
  _DWORD *v27;
  uint64_t v28;
  float *v29;
  _QWORD *v30;
  float v31;
  float v32;
  float v33;
  int v34;
  float v35;
  uint64_t j;
  float **v37;
  uint64_t v38;
  float *v39;
  float v40;
  float v41;
  char *v42;
  char *v43;
  void *v44;
  char *v45;
  void *v46;
  void *v47;
  void *__p;
  void *v50;
  char *v51;
  void *v52;
  char *v53;
  float __C;
  uint64_t __StandardDeviation;

  v9 = (const vImage_Buffer *)((char *)this + 312);
  vImageScale_ARGB8888(src, (const vImage_Buffer *)((char *)this + 312), 0, 8u);
  vImageConvert_RGBA8888toRGB888(v9, (const vImage_Buffer *)((char *)this + 344), 0x100u);
  *((_QWORD *)this + 45) *= 3;
  *((_QWORD *)this + 49) *= 3;
  vImageConvert_Planar8toPlanarF((const vImage_Buffer *)((char *)this + 344), (const vImage_Buffer *)((char *)this + 376), 255.0, 0.0, 0x100u);
  *((_QWORD *)this + 45) /= 3uLL;
  *((_QWORD *)this + 49) /= 3uLL;
  __StandardDeviation = 0;
  vDSP_normalize(*((const float **)this + 47), 1, *((float **)this + 4 * *((unsigned __int8 *)this + 524) + 51), 1, (float *)&__StandardDeviation + 1, (float *)&__StandardDeviation, 3 * *((_DWORD *)this + 77) * *((_DWORD *)this + 76));
  __C = 0.0;
  v10 = *((int *)this + 133);
  v11 = *((int *)this + 132);
  v50 = 0;
  v51 = 0;
  __p = 0;
  if ((_DWORD)v11)
  {
    if ((v11 & 0x80000000) != 0)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    __p = operator new(4 * v11);
    v51 = (char *)__p + 4 * v11;
    bzero(__p, 4 * v11);
    v50 = v51;
  }
  std::vector<std::vector<float>>::vector(&v52, v10, (uint64_t)&__p);
  if (__p)
  {
    v50 = __p;
    operator delete(__p);
  }
  v12 = *((_DWORD *)this + 76);
  v13 = 0.0;
  if (v12 >= 1)
  {
    LODWORD(v14) = *((_DWORD *)this + 132);
    if ((int)v14 >= 1)
    {
      for (i = 0; i < v12; ++i)
      {
        if ((int)v14 >= 1)
        {
          v16 = 0;
          v17 = 0;
          do
          {
            v18 = *((_DWORD *)this + 77);
            vDSP_dotpr((const float *)(*((_QWORD *)this + 51) + 4 * 3 * i * v18 + 4 * (v16 * v18 / (int)v14)), 1, (const float *)(*((_QWORD *)this + 55) + 4 * 3 * i * v18 + 4 * (v16 * v18 / (int)v14)), 1, &__C, 3 * v18 / (int)v14);
            v12 = *((_DWORD *)this + 76);
            v19 = *((_QWORD *)v52 + 3 * (*((_DWORD *)this + 133) * i / v12));
            *(float *)(v19 + 4 * v17) = __C + *(float *)(v19 + 4 * v17);
            v13 = v13 + __C;
            ++v17;
            v14 = *((int *)this + 132);
            v16 += 3;
          }
          while (v17 < v14);
        }
      }
    }
  }
  v20 = *((unsigned int *)this + 133);
  if ((int)v20 >= 1)
  {
    v21 = *((unsigned int *)this + 132);
    if ((int)v21 >= 1)
    {
      v22 = 0;
      v23 = v52;
      v24 = *((_QWORD *)this + 61);
      v25 = (float)(3 * v12 * *((_DWORD *)this + 77) / (int)v21 / (int)v20);
      do
      {
        v26 = *(_QWORD ***)(v24 + 24 * v22);
        v27 = (_DWORD *)v23[3 * v22];
        v28 = v21;
        do
        {
          v30 = *v26;
          v26 += 3;
          v29 = (float *)v30;
          *v30 = *(_QWORD *)((char *)v30 + 4);
          LODWORD(v30) = *v27++;
          v29[2] = *(float *)&v30 / v25;
          --v28;
        }
        while (v28);
        ++v22;
      }
      while (v22 != v20);
    }
  }
  v31 = *((float *)this + 119);
  *((float *)this + 118) = v31;
  v32 = *((float *)this + 120);
  *((float *)this + 119) = v32;
  v33 = v13 / (float)(3 * v12 * *((_DWORD *)this + 77));
  *((float *)this + 120) = v33;
  v34 = *((_DWORD *)this + 128);
  *((_DWORD *)this + 128) = v34 + 1;
  if (v34 < 3)
  {
    *a3 = 0;
    *((_BYTE *)this + 524) ^= 1u;
    v42 = (char *)v52;
    if (!v52)
      return 0;
    goto LABEL_35;
  }
  v35 = 0.0;
  if ((int)v20 >= 1 && *((int *)this + 132) >= 1)
  {
    for (j = 0; j != v20; ++j)
    {
      v37 = *(float ***)(*((_QWORD *)this + 61) + 24 * j);
      v38 = *((unsigned int *)this + 132);
      do
      {
        v39 = *v37;
        v37 += 3;
        v40 = (float)(*v39 + (float)(v39[1] * -2.0)) + v39[2];
        if (v40 > v35)
          v35 = v40;
        --v38;
      }
      while (v38);
    }
  }
  if (a5)
  {
    v41 = *((float *)this + 129);
  }
  else
  {
    v35 = (float)(v31 + (float)(v32 * -2.0)) + v33;
    v41 = *((float *)this + 130);
  }
  *a3 = v35 >= v41;
  *a4 = v35;
  *((_BYTE *)this + 524) ^= 1u;
  v42 = (char *)v52;
  if (v52)
  {
LABEL_35:
    v43 = v53;
    v44 = v42;
    if (v53 != v42)
    {
      v45 = v53;
      do
      {
        v47 = (void *)*((_QWORD *)v45 - 3);
        v45 -= 24;
        v46 = v47;
        if (v47)
        {
          *((_QWORD *)v43 - 2) = v46;
          operator delete(v46);
        }
        v43 = v45;
      }
      while (v45 != v42);
      v44 = v52;
    }
    v53 = v42;
    operator delete(v44);
  }
  return 0;
}

void sub_213BD33F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_213BD3410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  std::vector<std::vector<float>>::~vector[abi:ne180100]((void **)va);
  _Unwind_Resume(a1);
}

uint64_t vision::mod::LivenessCheckPredictor::processFacePoseData(uint64_t a1, uint64_t a2, uint64_t *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, int *a7)
{
  uint64_t v7;
  uint64_t v8;
  _QWORD *v11;
  _QWORD *v12;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _DWORD *v18;
  int v19;
  int v20;
  unint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  _DWORD *v30;
  unint64_t v31;
  unint64_t v32;
  int v33;
  float v34;
  size_t v35;
  float32x2_t *v36;
  float64x2_t v37;
  float64x2_t v38;
  float64x2_t v39;
  float64x2_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  _OWORD *v45;
  char *v46;
  uint64_t v47;
  __int128 v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  const void *v52;
  int v53;
  float v54;
  size_t v55;
  float32x2_t *v56;
  float64x2_t v57;
  float64x2_t v58;
  float64x2_t v59;
  float64x2_t v60;
  size_t v61;
  float64x2_t v62;
  float64x2_t v63;
  float64x2_t v64;
  float64x2_t v65;
  unint64_t v66;
  char *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  _BYTE *v73;
  _DWORD *v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  _OWORD *v81;
  char *v82;
  uint64_t v83;
  __int128 v84;
  int v85;
  size_t v86;
  float64x2_t v87;
  float64x2_t v88;
  float64x2_t v89;
  float64x2_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  _BYTE *v96;
  _DWORD *v97;
  unint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  _OWORD *v102;
  char *v103;
  uint64_t v104;
  __int128 v105;
  int v106;
  void **v108;
  unint64_t v109;
  unint64_t v110;
  unint64_t v111;
  void **v113;

  v7 = *(_QWORD *)(a1 + 120);
  v113 = (void **)(a1 + 120);
  *(_WORD *)(a1 + 116) = 0;
  *(_QWORD *)(a1 + 128) = v7;
  v108 = (void **)(a1 + 144);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a1 + 144);
  *(_DWORD *)(a1 + 4 * *a7 + 208) = 0;
  v8 = *a3;
  if (a3[1] != *a3)
  {
    v11 = a5;
    v12 = a4;
    v15 = 0;
    while (1)
    {
      v16 = *a7;
      v17 = a1 + 4 * v16;
      v20 = *(_DWORD *)(v17 + 208);
      v18 = (_DWORD *)(v17 + 208);
      v19 = v20;
      if (v20 <= 1
        && fabsf(*(float *)(v8 + 4 * v15)) < 10.0
        && fabsf(*(float *)(*v11 + 4 * v15)) < 10.0
        && fabsf(*(float *)(*v12 + 4 * v15)) < 10.0)
      {
        break;
      }
LABEL_36:
      if ((_DWORD)v16 != 9)
        goto LABEL_4;
      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a6[1] - *a6) >> 3) <= v15)
        goto LABEL_4;
      v50 = *a6 + 24 * v15;
      v52 = *(const void **)v50;
      v51 = *(_QWORD *)(v50 + 8);
      if (v51 == *(_QWORD *)v50)
        goto LABEL_4;
      v53 = *(_DWORD *)(a1 + 256);
      if (v53 > 9)
        goto LABEL_4;
      if (fabsf(*(float *)(*a3 + 4 * v15)) >= 10.0
        || fabsf(*(float *)(*v11 + 4 * v15)) >= 5.0
        || fabsf(*(float *)(*v12 + 4 * v15)) >= 5.0)
      {
        if (v53)
          goto LABEL_4;
        v33 = *(_DWORD *)(a1 + 260);
        if (v33 > 4)
          goto LABEL_4;
        if (v33)
        {
          v34 = *(float *)(a1 + 252);
          v35 = v51 - (_QWORD)v52;
          if (v51 - (uint64_t)v52 < 0)
            std::vector<float>::__throw_length_error[abi:ne180100]();
          v36 = (float32x2_t *)operator new(v51 - (_QWORD)v52);
          memcpy(v36, v52, v35);
          v37 = vcvtq_f64_f32(vsub_f32(v36[1], v36[15]));
          *(float *)v37.f64 = vaddvq_f64(vmulq_f64(v37, v37));
          v38 = vcvtq_f64_f32(vsub_f32(v36[2], v36[14]));
          *(float *)v38.f64 = vaddvq_f64(vmulq_f64(v38, v38));
          *(float *)v37.f64 = (float)(sqrtf(*(float *)v37.f64) + 0.0) + sqrtf(*(float *)v38.f64);
          v39 = vcvtq_f64_f32(vsub_f32(v36[5], v36[23]));
          *(float *)v39.f64 = vaddvq_f64(vmulq_f64(v39, v39));
          *(float *)v37.f64 = *(float *)v37.f64 + sqrtf(*(float *)v39.f64);
          v40 = vcvtq_f64_f32(vsub_f32(v36[6], v36[22]));
          *(float *)v40.f64 = vaddvq_f64(vmulq_f64(v40, v40));
          *(float *)(a1 + 252) = fminf(v34, (float)(*(float *)v37.f64 + sqrtf(*(float *)v40.f64)) * 0.25);
        }
        else
        {
          v61 = v51 - (_QWORD)v52;
          if (v51 - (uint64_t)v52 < 0)
            std::vector<float>::__throw_length_error[abi:ne180100]();
          v36 = (float32x2_t *)operator new(v51 - (_QWORD)v52);
          memcpy(v36, v52, v61);
          v62 = vcvtq_f64_f32(vsub_f32(v36[1], v36[15]));
          *(float *)v62.f64 = vaddvq_f64(vmulq_f64(v62, v62));
          v63 = vcvtq_f64_f32(vsub_f32(v36[2], v36[14]));
          *(float *)v63.f64 = vaddvq_f64(vmulq_f64(v63, v63));
          *(float *)v62.f64 = (float)(sqrtf(*(float *)v62.f64) + 0.0) + sqrtf(*(float *)v63.f64);
          v64 = vcvtq_f64_f32(vsub_f32(v36[5], v36[23]));
          *(float *)v64.f64 = vaddvq_f64(vmulq_f64(v64, v64));
          *(float *)v62.f64 = *(float *)v62.f64 + sqrtf(*(float *)v64.f64);
          v65 = vcvtq_f64_f32(vsub_f32(v36[6], v36[22]));
          *(float *)v65.f64 = vaddvq_f64(vmulq_f64(v65, v65));
          *(float *)(a1 + 252) = (float)(*(float *)v62.f64 + sqrtf(*(float *)v65.f64)) * 0.25;
        }
        operator delete(v36);
        ++*(_DWORD *)(a1 + 260);
        v67 = *(char **)(a1 + 152);
        v66 = *(_QWORD *)(a1 + 160);
        if ((unint64_t)v67 >= v66)
        {
          v68 = (char *)*v108;
          v69 = v67 - (_BYTE *)*v108;
          v70 = v69 >> 2;
          v71 = (v69 >> 2) + 1;
          if (v71 >> 62)
            goto LABEL_95;
          v72 = v66 - (_QWORD)v68;
          if (v72 >> 1 > v71)
            v71 = v72 >> 1;
          if ((unint64_t)v72 >= 0x7FFFFFFFFFFFFFFCLL)
            v71 = 0x3FFFFFFFFFFFFFFFLL;
          v110 = v71;
          if (v71)
          {
            if (v71 >> 62)
              goto LABEL_94;
            v73 = operator new(4 * v71);
            v74 = &v73[4 * v70];
            *v74 = v15;
            v75 = (uint64_t)(v74 + 1);
            if (v67 != v68)
            {
LABEL_57:
              v76 = v67 - 4 - v68;
              v77 = v110;
              if (v76 < 0x2C)
                goto LABEL_102;
              if ((unint64_t)(v67 - &v73[v69]) < 0x20)
                goto LABEL_102;
              v78 = (v76 >> 2) + 1;
              v79 = 4 * (v78 & 0x7FFFFFFFFFFFFFF8);
              v80 = &v67[-v79];
              v74 = (_DWORD *)((char *)v74 - v79);
              v81 = &v73[4 * v70 - 16];
              v82 = v67 - 16;
              v83 = v78 & 0x7FFFFFFFFFFFFFF8;
              do
              {
                v84 = *(_OWORD *)v82;
                *(v81 - 1) = *((_OWORD *)v82 - 1);
                *v81 = v84;
                v81 -= 2;
                v82 -= 32;
                v83 -= 8;
              }
              while (v83);
              v67 = v80;
              if (v78 != (v78 & 0x7FFFFFFFFFFFFFF8))
              {
LABEL_102:
                do
                {
                  v85 = *((_DWORD *)v67 - 1);
                  v67 -= 4;
                  *--v74 = v85;
                }
                while (v67 != v68);
              }
LABEL_79:
              *(_QWORD *)(a1 + 144) = v74;
              *(_QWORD *)(a1 + 152) = v75;
              *(_QWORD *)(a1 + 160) = &v73[4 * v77];
              if (v68)
LABEL_80:
                operator delete(v68);
LABEL_81:
              v11 = a5;
              goto LABEL_82;
            }
          }
          else
          {
            v73 = 0;
            v74 = (_DWORD *)(4 * v70);
            *(_DWORD *)(4 * v70) = v15;
            v75 = 4 * v70 + 4;
            if (v67 != v68)
              goto LABEL_57;
          }
          v77 = v110;
          goto LABEL_79;
        }
      }
      else
      {
        if (v53)
        {
          v54 = *(float *)(a1 + 248);
          v55 = v51 - (_QWORD)v52;
          if (v51 - (uint64_t)v52 < 0)
            std::vector<float>::__throw_length_error[abi:ne180100]();
          v56 = (float32x2_t *)operator new(v51 - (_QWORD)v52);
          memcpy(v56, v52, v55);
          v57 = vcvtq_f64_f32(vsub_f32(v56[1], v56[15]));
          *(float *)v57.f64 = vaddvq_f64(vmulq_f64(v57, v57));
          v58 = vcvtq_f64_f32(vsub_f32(v56[2], v56[14]));
          *(float *)v58.f64 = vaddvq_f64(vmulq_f64(v58, v58));
          *(float *)v57.f64 = (float)(sqrtf(*(float *)v57.f64) + 0.0) + sqrtf(*(float *)v58.f64);
          v59 = vcvtq_f64_f32(vsub_f32(v56[5], v56[23]));
          *(float *)v59.f64 = vaddvq_f64(vmulq_f64(v59, v59));
          *(float *)v57.f64 = *(float *)v57.f64 + sqrtf(*(float *)v59.f64);
          v60 = vcvtq_f64_f32(vsub_f32(v56[6], v56[22]));
          *(float *)v60.f64 = vaddvq_f64(vmulq_f64(v60, v60));
          *(float *)(a1 + 248) = fminf(v54, (float)(*(float *)v57.f64 + sqrtf(*(float *)v60.f64)) * 0.25);
        }
        else
        {
          v86 = v51 - (_QWORD)v52;
          if (v51 - (uint64_t)v52 < 0)
            std::vector<float>::__throw_length_error[abi:ne180100]();
          v56 = (float32x2_t *)operator new(v51 - (_QWORD)v52);
          memcpy(v56, v52, v86);
          v87 = vcvtq_f64_f32(vsub_f32(v56[1], v56[15]));
          *(float *)v87.f64 = vaddvq_f64(vmulq_f64(v87, v87));
          v88 = vcvtq_f64_f32(vsub_f32(v56[2], v56[14]));
          *(float *)v88.f64 = vaddvq_f64(vmulq_f64(v88, v88));
          *(float *)v87.f64 = (float)(sqrtf(*(float *)v87.f64) + 0.0) + sqrtf(*(float *)v88.f64);
          v89 = vcvtq_f64_f32(vsub_f32(v56[5], v56[23]));
          *(float *)v89.f64 = vaddvq_f64(vmulq_f64(v89, v89));
          *(float *)v87.f64 = *(float *)v87.f64 + sqrtf(*(float *)v89.f64);
          v90 = vcvtq_f64_f32(vsub_f32(v56[6], v56[22]));
          *(float *)v90.f64 = vaddvq_f64(vmulq_f64(v90, v90));
          *(float *)(a1 + 248) = (float)(*(float *)v87.f64 + sqrtf(*(float *)v90.f64)) * 0.25;
        }
        operator delete(v56);
        ++*(_DWORD *)(a1 + 256);
        v67 = *(char **)(a1 + 152);
        v91 = *(_QWORD *)(a1 + 160);
        if ((unint64_t)v67 >= v91)
        {
          v68 = (char *)*v108;
          v92 = v67 - (_BYTE *)*v108;
          v93 = v92 >> 2;
          v94 = (v92 >> 2) + 1;
          if (v94 >> 62)
LABEL_95:
            std::vector<float>::__throw_length_error[abi:ne180100]();
          v95 = v91 - (_QWORD)v68;
          if (v95 >> 1 > v94)
            v94 = v95 >> 1;
          if ((unint64_t)v95 >= 0x7FFFFFFFFFFFFFFCLL)
            v94 = 0x3FFFFFFFFFFFFFFFLL;
          v111 = v94;
          if (v94)
          {
            if (v94 >> 62)
LABEL_94:
              std::__throw_bad_array_new_length[abi:ne180100]();
            v96 = operator new(4 * v94);
            v97 = &v96[4 * v93];
            *v97 = v15;
            v75 = (uint64_t)(v97 + 1);
            if (v67 == v68)
            {
LABEL_90:
              *(_QWORD *)(a1 + 144) = v97;
              *(_QWORD *)(a1 + 152) = v75;
              *(_QWORD *)(a1 + 160) = &v96[4 * v111];
              if (v68)
                goto LABEL_80;
              goto LABEL_81;
            }
          }
          else
          {
            v96 = 0;
            v97 = (_DWORD *)(4 * v93);
            *(_DWORD *)(4 * v93) = v15;
            v75 = 4 * v93 + 4;
            if (v67 == v68)
              goto LABEL_90;
          }
          v98 = v67 - 4 - v68;
          if (v98 < 0x2C)
            goto LABEL_103;
          if ((unint64_t)(v67 - &v96[v92]) < 0x20)
            goto LABEL_103;
          v99 = (v98 >> 2) + 1;
          v100 = 4 * (v99 & 0x7FFFFFFFFFFFFFF8);
          v101 = &v67[-v100];
          v97 = (_DWORD *)((char *)v97 - v100);
          v102 = &v96[4 * v93 - 16];
          v103 = v67 - 16;
          v104 = v99 & 0x7FFFFFFFFFFFFFF8;
          do
          {
            v105 = *(_OWORD *)v103;
            *(v102 - 1) = *((_OWORD *)v103 - 1);
            *v102 = v105;
            v102 -= 2;
            v103 -= 32;
            v104 -= 8;
          }
          while (v104);
          v67 = v101;
          if (v99 != (v99 & 0x7FFFFFFFFFFFFFF8))
          {
LABEL_103:
            do
            {
              v106 = *((_DWORD *)v67 - 1);
              v67 -= 4;
              *--v97 = v106;
            }
            while (v67 != v68);
          }
          goto LABEL_90;
        }
      }
      *(_DWORD *)v67 = v15;
      v75 = (uint64_t)(v67 + 4);
LABEL_82:
      *(_QWORD *)(a1 + 152) = v75;
      v12 = a4;
LABEL_4:
      ++v15;
      v8 = *a3;
      if (v15 >= (a3[1] - *a3) >> 2)
        return 0;
    }
    *v18 = v19 + 1;
    v22 = *(char **)(a1 + 128);
    v21 = *(_QWORD *)(a1 + 136);
    if ((unint64_t)v22 < v21)
    {
      *(_DWORD *)v22 = v15;
      v23 = (uint64_t)(v22 + 4);
LABEL_35:
      *(_QWORD *)(a1 + 128) = v23;
      LODWORD(v16) = *a7;
      goto LABEL_36;
    }
    v24 = (char *)*v113;
    v25 = v22 - (_BYTE *)*v113;
    v26 = v25 >> 2;
    v27 = (v25 >> 2) + 1;
    if (v27 >> 62)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v28 = v21 - (_QWORD)v24;
    if (v28 >> 1 > v27)
      v27 = v28 >> 1;
    if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFFCLL)
      v27 = 0x3FFFFFFFFFFFFFFFLL;
    v109 = v27;
    if (v27)
    {
      if (v27 >> 62)
        goto LABEL_94;
      v29 = operator new(4 * v27);
      v30 = &v29[4 * v26];
      *v30 = v15;
      v23 = (uint64_t)(v30 + 1);
      if (v22 != v24)
        goto LABEL_19;
    }
    else
    {
      v29 = 0;
      v30 = (_DWORD *)(4 * v26);
      *(_DWORD *)(4 * v26) = v15;
      v23 = 4 * v26 + 4;
      if (v22 != v24)
      {
LABEL_19:
        v31 = v22 - 4 - v24;
        v32 = v109;
        if (v31 >= 0x2C)
        {
          v41 = v22 - &v29[v25];
          v12 = a4;
          if (v41 >= 0x20)
          {
            v42 = (v31 >> 2) + 1;
            v43 = 4 * (v42 & 0x7FFFFFFFFFFFFFF8);
            v44 = &v22[-v43];
            v30 = (_DWORD *)((char *)v30 - v43);
            v45 = &v29[4 * v26 - 16];
            v46 = v22 - 16;
            v47 = v42 & 0x7FFFFFFFFFFFFFF8;
            do
            {
              v48 = *(_OWORD *)v46;
              *(v45 - 1) = *((_OWORD *)v46 - 1);
              *v45 = v48;
              v45 -= 2;
              v46 -= 32;
              v47 -= 8;
            }
            while (v47);
            v22 = v44;
            if (v42 == (v42 & 0x7FFFFFFFFFFFFFF8))
              goto LABEL_32;
          }
        }
        else
        {
          v12 = a4;
        }
        do
        {
          v49 = *((_DWORD *)v22 - 1);
          v22 -= 4;
          *--v30 = v49;
        }
        while (v22 != v24);
LABEL_32:
        *(_QWORD *)(a1 + 120) = v30;
        *(_QWORD *)(a1 + 128) = v23;
        *(_QWORD *)(a1 + 136) = &v29[4 * v32];
        if (v24)
          operator delete(v24);
        v11 = a5;
        goto LABEL_35;
      }
    }
    v12 = a4;
    v32 = v109;
    goto LABEL_32;
  }
  return 0;
}

void sub_213BD3D60(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::vector<float>::vector(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  const void *v4;
  int64_t v5;
  char *v6;
  char *v7;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  v4 = *(const void **)a2;
  v3 = *(_QWORD *)(a2 + 8);
  v5 = v3 - *(_QWORD *)a2;
  if (v3 != *(_QWORD *)a2)
  {
    if (v5 < 0)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v6 = (char *)operator new(v3 - *(_QWORD *)a2);
    *a1 = v6;
    a1[1] = v6;
    v7 = &v6[4 * (v5 >> 2)];
    a1[2] = v7;
    memcpy(v6, v4, v5);
    a1[1] = v7;
  }
  return a1;
}

void sub_213BD3E2C(_Unwind_Exception *exception_object)
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

uint64_t vision::mod::LivenessCheckPredictor::runFaceActionClassification(float32x2_t *a1, _QWORD *a2, uint64_t *a3, _QWORD *a4, _QWORD *a5, uint64_t *a6, int *a7)
{
  float32x2_t v8;
  uint64_t v9;
  uint64_t *v10;
  _QWORD *v11;
  float32x2_t *v13;
  unint64_t v14;
  __int32 v15;
  uint64_t v16;
  char *v17;
  _DWORD *v18;
  int v19;
  int v20;
  unint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  _DWORD *v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  _OWORD *v35;
  char *v36;
  uint64_t v37;
  __int128 v38;
  int v39;
  float v40;
  const void **v41;
  _BYTE *v42;
  _BYTE *v43;
  int v44;
  float v45;
  _QWORD *v46;
  float v47;
  float v48;
  float v49;
  float v50;
  uint64_t v54;
  _BYTE *v55;
  _BYTE *v56;
  int64_t v57;
  char *v58;
  void *v59;
  float v60;
  float v61;
  BOOL v62;
  float v63;
  float v64;
  float v65;
  BOOL v67;
  BOOL v68;
  uint64_t v70;
  __int128 v71;
  uint64_t v72;
  const void *v73;
  size_t v74;
  float32x2_t *v75;
  float64x2_t v76;
  float64x2_t v77;
  float64x2_t v78;
  float64x2_t v79;
  float v80;
  float v81;
  uint64_t v82;
  __int32 v83;
  int v84;
  float v85;
  size_t v86;
  float32x2_t *v87;
  float64x2_t v88;
  float64x2_t v89;
  float64x2_t v90;
  float64x2_t v91;
  _QWORD *v92;
  unint64_t v93;
  char *v94;
  _DWORD *v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  uint64_t v100;
  unint64_t v101;
  _QWORD *v102;
  unint64_t v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  uint64_t v108;
  _DWORD *v109;
  unint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  _OWORD *v114;
  char *v115;
  uint64_t v116;
  __int128 v117;
  int v118;
  unint64_t v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  _OWORD *v123;
  char *v124;
  uint64_t v125;
  __int128 v126;
  int v127;
  uint64_t v128;
  _BYTE *v129;
  _BYTE *v130;
  int64_t v131;
  char *v132;
  void *v133;
  float v134;
  float v135;
  float v136;
  _QWORD *v137;
  float v138;
  float v139;
  _QWORD *v140;
  float v141;
  float v142;
  _QWORD *v143;
  _QWORD *v144;
  const std::locale::facet *v145;
  void **v147;
  __int32 v150;
  __int32 v151;
  void **v152;
  _QWORD *v154;
  void *v155[3];
  void *v156[3];
  char *v157;
  char *v158;
  char *v159;
  float32x2_t *v160;
  float32x2_t *v161;
  char *v162;
  float32x2_t *v163[3];
  float32x2_t *v164[3];
  void *__p[3];
  float32x2_t *v166;
  float32x2_t *v167;
  char *v168;
  char *v169;
  char *v170;
  char *v171;
  std::locale v172;

  v8 = a1[15];
  v152 = (void **)&a1[15];
  a1[14].i16[2] = 0;
  a1[16] = v8;
  a1[19] = a1[18];
  a1[26].i32[*a7] = 0;
  v9 = *a3;
  if (a3[1] == *a3)
  {
LABEL_189:
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB318], (uint64_t)"Buffer Processed for SIML gesture ", 34);
    v143 = (_QWORD *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v143, (uint64_t)", max action consecutive: ", 26);
    v144 = (_QWORD *)std::ostream::operator<<();
    std::ios_base::getloc((const std::ios_base *)((char *)v144 + *(_QWORD *)(*v144 - 24)));
    v145 = std::locale::use_facet(&v172, MEMORY[0x24BEDB350]);
    ((void (*)(const std::locale::facet *, uint64_t))v145->__vftable[2].~facet_0)(v145, 10);
    std::locale::~locale(&v172);
    std::ostream::put();
    std::ostream::flush();
    return 0;
  }
  v10 = a6;
  v11 = a5;
  v13 = a1;
  v147 = (void **)&a1[18];
  v14 = 0;
  v15 = 0;
  v154 = a4;
  while (2)
  {
    v16 = *a7;
    v17 = (char *)v13 + 4 * v16;
    v20 = *((_DWORD *)v17 + 52);
    v18 = v17 + 208;
    v19 = v20;
    if (v20 <= 1
      && fabsf(*(float *)(v9 + 4 * v14)) < 10.0
      && fabsf(*(float *)(*v11 + 4 * v14)) < 10.0
      && fabsf(*(float *)(*a4 + 4 * v14)) < 10.0)
    {
      *v18 = v19 + 1;
      v22 = (char *)v13[16];
      v21 = (unint64_t)v13[17];
      if ((unint64_t)v22 < v21)
      {
        *(_DWORD *)v22 = v14;
        v23 = (uint64_t)(v22 + 4);
LABEL_29:
        v13[16] = (float32x2_t)v23;
        LODWORD(v16) = *a7;
        goto LABEL_30;
      }
      v150 = v15;
      v24 = (char *)*v152;
      v25 = v22 - (_BYTE *)*v152;
      v26 = v25 >> 2;
      v27 = (v25 >> 2) + 1;
      if (v27 >> 62)
        std::vector<float>::__throw_length_error[abi:ne180100]();
      v28 = v21 - (_QWORD)v24;
      if (v28 >> 1 > v27)
        v27 = v28 >> 1;
      if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFFCLL)
        v29 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v29 = v27;
      if (v29)
      {
        if (v29 >> 62)
          goto LABEL_192;
        a1 = (float32x2_t *)operator new(4 * v29);
        a4 = v154;
        v30 = (_DWORD *)a1 + v26;
        *v30 = v14;
        v23 = (uint64_t)(v30 + 1);
        if (v22 == v24)
          goto LABEL_26;
      }
      else
      {
        a1 = 0;
        v30 = (_DWORD *)(4 * v26);
        *(_DWORD *)(4 * v26) = v14;
        v23 = 4 * v26 + 4;
        if (v22 == v24)
        {
LABEL_26:
          v13[15] = (float32x2_t)v30;
          v13[16] = (float32x2_t)v23;
          v13[17] = (float32x2_t)((char *)a1 + 4 * v29);
          if (v24)
          {
            operator delete(v24);
            a4 = v154;
          }
          v15 = v150;
          v10 = a6;
          v11 = a5;
          goto LABEL_29;
        }
      }
      v31 = v22 - 4 - v24;
      if (v31 < 0x2C)
        goto LABEL_200;
      if ((unint64_t)(v22 - ((char *)a1 + v25)) < 0x20)
        goto LABEL_200;
      v32 = (v31 >> 2) + 1;
      v33 = 4 * (v32 & 0x7FFFFFFFFFFFFFF8);
      v34 = &v22[-v33];
      v30 = (_DWORD *)((char *)v30 - v33);
      v35 = (_OWORD *)((char *)&a1[-2] + 4 * v26);
      v36 = v22 - 16;
      v37 = v32 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        v38 = *(_OWORD *)v36;
        *(v35 - 1) = *((_OWORD *)v36 - 1);
        *v35 = v38;
        v35 -= 2;
        v36 -= 32;
        v37 -= 8;
      }
      while (v37);
      v22 = v34;
      if (v32 != (v32 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_200:
        do
        {
          v39 = *((_DWORD *)v22 - 1);
          v22 -= 4;
          *--v30 = v39;
        }
        while (v22 != v24);
      }
      goto LABEL_26;
    }
LABEL_30:
    switch((int)v16)
    {
      case 0:
        v40 = *(float *)(*a4 + 4 * v14);
        if (v40 <= v13->f32[1])
          goto LABEL_188;
        goto LABEL_69;
      case 1:
        v40 = *(float *)(*a4 + 4 * v14);
        if (v40 >= v13->f32[0])
          goto LABEL_188;
LABEL_69:
        v63 = fabsf(*(float *)(*v11 + 4 * v14));
        v64 = fabsf(*(float *)(*a3 + 4 * v14));
        v65 = fabsf(v40);
        if (v63 <= v65 || v63 <= v64)
        {
          v67 = v64 <= v63 || v64 <= v65;
          v68 = !v67 || v65 <= v63;
          if (!v68 && v65 > v64)
            goto LABEL_101;
        }
        goto LABEL_188;
      case 2:
        v47 = *(float *)(*a3 + 4 * v14);
        if (v47 >= v13[1].f32[0])
          goto LABEL_188;
        goto LABEL_49;
      case 3:
        v47 = *(float *)(*a3 + 4 * v14);
        if (v47 <= v13[1].f32[1])
          goto LABEL_188;
LABEL_49:
        v48 = fabsf(*(float *)(*v11 + 4 * v14));
        v49 = fabsf(v47);
        v50 = fabsf(*(float *)(*a4 + 4 * v14));
        if ((v48 <= v49 || v48 <= v50) && v49 > v48 && v49 > v50)
          goto LABEL_101;
        goto LABEL_188;
      case 4:
        if (fabsf(*(float *)(*a3 + 4 * v14)) > 33.0
          || fabsf(*(float *)(*a4 + 4 * v14)) > 39.0
          || *(float *)(*v11 + 4 * v14) >= v13[2].f32[1])
        {
          goto LABEL_188;
        }
        goto LABEL_101;
      case 5:
        if (fabsf(*(float *)(*a3 + 4 * v14)) > 33.0
          || fabsf(*(float *)(*a4 + 4 * v14)) > 39.0
          || *(float *)(*v11 + 4 * v14) <= v13[2].f32[1])
        {
          goto LABEL_188;
        }
        goto LABEL_101;
      case 6:
        if (fabsf(*(float *)(*a3 + 4 * v14)) > 33.0
          || fabsf(*(float *)(*a4 + 4 * v14)) > 39.0
          || fabsf(*(float *)(*v11 + 4 * v14)) > 27.0
          || *(float *)(*a2 + 4 * v14) <= 0.9)
        {
          goto LABEL_188;
        }
        goto LABEL_101;
      case 7:
        if (fabsf(*(float *)(*v11 + 4 * v14)) > 27.0
          || fabsf(*(float *)(*a3 + 4 * v14)) > 33.0
          || fabsf(*(float *)(*a4 + 4 * v14)) > 39.0)
        {
          goto LABEL_188;
        }
        v54 = *v10 + 24 * v14;
        v170 = 0;
        v171 = 0;
        v169 = 0;
        v56 = *(_BYTE **)v54;
        v55 = *(_BYTE **)(v54 + 8);
        v57 = v55 - v56;
        if (v55 == v56)
        {
          v60 = vision::mod::LivenessCheckPredictor::computeEyeAspectRatio((uint64_t)a1, (uint64_t)&v169);
          v61 = v13[3].f32[1];
          v11 = a5;
        }
        else
        {
          if (v57 < 0)
            std::vector<float>::__throw_length_error[abi:ne180100]();
          v58 = (char *)operator new(v55 - v56);
          v169 = v58;
          v171 = &v58[4 * (v57 >> 2)];
          v59 = memcpy(v58, v56, v57);
          v170 = &v58[4 * (v57 >> 2)];
          v60 = vision::mod::LivenessCheckPredictor::computeEyeAspectRatio((uint64_t)v59, (uint64_t)&v169);
          v61 = v13[3].f32[1];
          v11 = a5;
          if (v58)
          {
            v170 = v58;
            operator delete(v58);
          }
        }
        v62 = v60 < v61;
        goto LABEL_99;
      case 8:
        if (fabsf(*(float *)(*v11 + 4 * v14)) > 27.0
          || fabsf(*(float *)(*a3 + 4 * v14)) > 33.0
          || fabsf(*(float *)(*a4 + 4 * v14)) > 39.0)
        {
          goto LABEL_188;
        }
        v70 = *v10;
        v167 = 0;
        v168 = 0;
        v166 = 0;
        v71 = *(_OWORD *)(v70 + 24 * v14);
        v72 = *(_QWORD *)(v70 + 24 * v14 + 8);
        v73 = (const void *)v71;
        v74 = v72 - v71;
        if (v72 - (uint64_t)v71 < 0)
          std::vector<float>::__throw_length_error[abi:ne180100]();
        v75 = (float32x2_t *)operator new(v72 - v71);
        v166 = v75;
        v168 = (char *)v75 + v74;
        memcpy(v75, v73, v74);
        v76 = vcvtq_f64_f32(vsub_f32(v75[34], v75[39]));
        *(float *)v76.f64 = vaddvq_f64(vmulq_f64(v76, v76));
        v77 = vcvtq_f64_f32(vsub_f32(v75[35], v75[38]));
        *(float *)v77.f64 = vaddvq_f64(vmulq_f64(v77, v77));
        *(float *)v76.f64 = (float)(sqrtf(*(float *)v76.f64) + 0.0) + sqrtf(*(float *)v77.f64);
        v78 = vcvtq_f64_f32(vsub_f32(v75[36], v75[37]));
        *(float *)v78.f64 = vaddvq_f64(vmulq_f64(v78, v78));
        v76.f64[0] = (float)(*(float *)v76.f64 + sqrtf(*(float *)v78.f64));
        v79 = vcvtq_f64_f32(vsub_f32(v75[33], v75[29]));
        *(float *)v79.f64 = vaddvq_f64(vmulq_f64(v79, v79));
        v80 = v76.f64[0] / (sqrtf(*(float *)v79.f64) * 3.0);
        v81 = v13[4].f32[0];
        v167 = v75;
        operator delete(v75);
        v62 = v81 < v80;
        v11 = a5;
LABEL_99:
        a4 = v154;
        if (!v62)
          goto LABEL_188;
        goto LABEL_101;
      case 9:
        if (0xAAAAAAAAAAAAAAABLL * ((v10[1] - *v10) >> 3) <= v14)
          goto LABEL_188;
        v41 = (const void **)(*v10 + 24 * v14);
        v43 = *v41;
        v42 = v41[1];
        if (v42 == *v41)
          goto LABEL_188;
        v44 = v13[32].i32[0];
        if (v44 > 9)
          goto LABEL_167;
        if (fabsf(*(float *)(*a3 + 4 * v14)) < 10.0
          && fabsf(*(float *)(*v11 + 4 * v14)) < 5.0
          && fabsf(*(float *)(*a4 + 4 * v14)) < 5.0)
        {
          if (v44)
          {
            v45 = v13[31].f32[0];
            v46 = std::vector<float>::vector(v164, (uint64_t)v41);
            v13[31].f32[0] = fminf(v45, vision::mod::LivenessCheckPredictor::computeEyebrow2EyeHeight((uint64_t)v46, v164));
            a1 = v164[0];
            if (v164[0])
            {
              v164[1] = v164[0];
              goto LABEL_133;
            }
          }
          else
          {
            v102 = std::vector<float>::vector(__p, (uint64_t)v41);
            v13[31].f32[0] = vision::mod::LivenessCheckPredictor::computeEyebrow2EyeHeight((uint64_t)v102, (float32x2_t **)__p);
            a1 = (float32x2_t *)__p[0];
            if (__p[0])
            {
              __p[1] = __p[0];
LABEL_133:
              operator delete(a1);
            }
          }
          ++v13[32].i32[0];
          v104 = (char *)v13[19];
          v103 = (unint64_t)v13[20];
          if ((unint64_t)v104 < v103)
          {
            *(_DWORD *)v104 = v14;
            v95 = v104 + 4;
            a4 = v154;
LABEL_166:
            v13[19] = (float32x2_t)v95;
            v11 = a5;
            goto LABEL_167;
          }
          v151 = v15;
          v96 = (char *)*v147;
          v105 = v104 - (_BYTE *)*v147;
          v106 = v105 >> 2;
          v107 = (v105 >> 2) + 1;
          if (v107 >> 62)
LABEL_196:
            std::vector<float>::__throw_length_error[abi:ne180100]();
          v108 = v103 - (_QWORD)v96;
          if (v108 >> 1 > v107)
            v107 = v108 >> 1;
          if ((unint64_t)v108 >= 0x7FFFFFFFFFFFFFFCLL)
            v101 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v101 = v107;
          if (v101)
          {
            if (v101 >> 62)
LABEL_192:
              std::__throw_bad_array_new_length[abi:ne180100]();
            a1 = (float32x2_t *)operator new(4 * v101);
          }
          else
          {
            a1 = 0;
          }
          v109 = (_DWORD *)a1 + v106;
          *v109 = v14;
          v95 = v109 + 1;
          if (v104 != v96)
          {
            v119 = v104 - 4 - v96;
            if (v119 < 0x2C)
              goto LABEL_201;
            if ((unint64_t)(v104 - ((char *)a1 + v105)) < 0x20)
              goto LABEL_201;
            v120 = (v119 >> 2) + 1;
            v121 = 4 * (v120 & 0x7FFFFFFFFFFFFFF8);
            v122 = &v104[-v121];
            v109 = (_DWORD *)((char *)v109 - v121);
            v123 = (_OWORD *)((char *)&a1[-2] + 4 * v106);
            v124 = v104 - 16;
            v125 = v120 & 0x7FFFFFFFFFFFFFF8;
            do
            {
              v126 = *(_OWORD *)v124;
              *(v123 - 1) = *((_OWORD *)v124 - 1);
              *v123 = v126;
              v123 -= 2;
              v124 -= 32;
              v125 -= 8;
            }
            while (v125);
            v104 = v122;
            if (v120 != (v120 & 0x7FFFFFFFFFFFFFF8))
            {
LABEL_201:
              do
              {
                v127 = *((_DWORD *)v104 - 1);
                v104 -= 4;
                *--v109 = v127;
              }
              while (v104 != v96);
            }
          }
LABEL_162:
          v13[18] = (float32x2_t)v109;
          v13[19] = (float32x2_t)v95;
          v13[20] = (float32x2_t)((char *)a1 + 4 * v101);
          if (v96)
            operator delete(v96);
          v15 = v151;
          v10 = a6;
          goto LABEL_165;
        }
        if (!v44)
        {
          v84 = v13[32].i32[1];
          if (v84 <= 4)
          {
            if (v84)
            {
              v85 = v13[31].f32[1];
              v161 = 0;
              v162 = 0;
              v160 = 0;
              v86 = v42 - v43;
              if (v42 - v43 < 0)
                std::vector<float>::__throw_length_error[abi:ne180100]();
              v87 = (float32x2_t *)operator new(v42 - v43);
              v160 = v87;
              v162 = (char *)v87 + v86;
              memcpy(v87, v43, v86);
              v88 = vcvtq_f64_f32(vsub_f32(v87[1], v87[15]));
              *(float *)v88.f64 = vaddvq_f64(vmulq_f64(v88, v88));
              v89 = vcvtq_f64_f32(vsub_f32(v87[2], v87[14]));
              *(float *)v89.f64 = vaddvq_f64(vmulq_f64(v89, v89));
              *(float *)v88.f64 = (float)(sqrtf(*(float *)v88.f64) + 0.0) + sqrtf(*(float *)v89.f64);
              v90 = vcvtq_f64_f32(vsub_f32(v87[5], v87[23]));
              *(float *)v90.f64 = vaddvq_f64(vmulq_f64(v90, v90));
              *(float *)v88.f64 = *(float *)v88.f64 + sqrtf(*(float *)v90.f64);
              v91 = vcvtq_f64_f32(vsub_f32(v87[6], v87[22]));
              *(float *)v91.f64 = vaddvq_f64(vmulq_f64(v91, v91));
              v13[31].f32[1] = fminf(v85, (float)(*(float *)v88.f64 + sqrtf(*(float *)v91.f64)) * 0.25);
              v161 = v87;
LABEL_119:
              operator delete(v87);
            }
            else
            {
              v92 = std::vector<float>::vector(v163, (uint64_t)v41);
              v13[31].f32[1] = vision::mod::LivenessCheckPredictor::computeEyebrow2EyeHeight((uint64_t)v92, v163);
              v87 = v163[0];
              if (v163[0])
              {
                v163[1] = v163[0];
                goto LABEL_119;
              }
            }
            ++v13[32].i32[1];
            v94 = (char *)v13[19];
            v93 = (unint64_t)v13[20];
            if ((unint64_t)v94 >= v93)
            {
              v151 = v15;
              v96 = (char *)*v147;
              v97 = v94 - (_BYTE *)*v147;
              v98 = v97 >> 2;
              v99 = (v97 >> 2) + 1;
              if (v99 >> 62)
                goto LABEL_196;
              v100 = v93 - (_QWORD)v96;
              if (v100 >> 1 > v99)
                v99 = v100 >> 1;
              if ((unint64_t)v100 >= 0x7FFFFFFFFFFFFFFCLL)
                v101 = 0x3FFFFFFFFFFFFFFFLL;
              else
                v101 = v99;
              if (v101)
              {
                if (v101 >> 62)
                  goto LABEL_192;
                a1 = (float32x2_t *)operator new(4 * v101);
              }
              else
              {
                a1 = 0;
              }
              v109 = (_DWORD *)a1 + v98;
              *v109 = v14;
              v95 = v109 + 1;
              if (v94 != v96)
              {
                v110 = v94 - 4 - v96;
                if (v110 < 0x2C)
                  goto LABEL_202;
                if ((unint64_t)(v94 - ((char *)a1 + v97)) < 0x20)
                  goto LABEL_202;
                v111 = (v110 >> 2) + 1;
                v112 = 4 * (v111 & 0x7FFFFFFFFFFFFFF8);
                v113 = &v94[-v112];
                v109 = (_DWORD *)((char *)v109 - v112);
                v114 = (_OWORD *)((char *)&a1[-2] + 4 * v98);
                v115 = v94 - 16;
                v116 = v111 & 0x7FFFFFFFFFFFFFF8;
                do
                {
                  v117 = *(_OWORD *)v115;
                  *(v114 - 1) = *((_OWORD *)v115 - 1);
                  *v114 = v117;
                  v114 -= 2;
                  v115 -= 32;
                  v116 -= 8;
                }
                while (v116);
                v94 = v113;
                if (v111 != (v111 & 0x7FFFFFFFFFFFFFF8))
                {
LABEL_202:
                  do
                  {
                    v118 = *((_DWORD *)v94 - 1);
                    v94 -= 4;
                    *--v109 = v118;
                  }
                  while (v94 != v96);
                }
              }
              goto LABEL_162;
            }
            *(_DWORD *)v94 = v14;
            v95 = v94 + 4;
LABEL_165:
            a4 = v154;
            goto LABEL_166;
          }
        }
LABEL_167:
        if (fabsf(*(float *)(*v11 + 4 * v14)) > 27.0
          || fabsf(*(float *)(*a3 + 4 * v14)) > 33.0
          || fabsf(*(float *)(*a4 + 4 * v14)) > 39.0)
        {
          goto LABEL_188;
        }
        v128 = *v10 + 24 * v14;
        v158 = 0;
        v159 = 0;
        v157 = 0;
        v130 = *(_BYTE **)v128;
        v129 = *(_BYTE **)(v128 + 8);
        v131 = v129 - v130;
        if (v129 == v130)
        {
          v134 = vision::mod::LivenessCheckPredictor::computeEyeAspectRatio((uint64_t)a1, (uint64_t)&v157);
          v135 = v13[3].f32[1];
          v11 = a5;
        }
        else
        {
          if (v131 < 0)
            std::vector<float>::__throw_length_error[abi:ne180100]();
          v132 = (char *)operator new(v129 - v130);
          v157 = v132;
          v159 = &v132[4 * (v131 >> 2)];
          v133 = memcpy(v132, v130, v131);
          v158 = &v132[4 * (v131 >> 2)];
          v134 = vision::mod::LivenessCheckPredictor::computeEyeAspectRatio((uint64_t)v133, (uint64_t)&v157);
          v135 = v13[3].f32[1];
          v11 = a5;
          if (v132)
          {
            v158 = v132;
            operator delete(v132);
          }
        }
        a4 = v154;
        if (v134 < v135)
          goto LABEL_188;
        v136 = v13[31].f32[0];
        if (v136 == 0.0)
          goto LABEL_181;
        v137 = std::vector<float>::vector(v156, *v10 + 24 * v14);
        v138 = vision::mod::LivenessCheckPredictor::computeEyebrow2EyeHeight((uint64_t)v137, (float32x2_t **)v156);
        v136 = v13[31].f32[0];
        v139 = v13[3].f32[0] * v136;
        a1 = (float32x2_t *)v156[0];
        if (v156[0])
        {
          v156[1] = v156[0];
          operator delete(v156[0]);
          a4 = v154;
          if (v138 > v139)
            goto LABEL_101;
          v136 = v13[31].f32[0];
        }
        else
        {
          a4 = v154;
          if (v138 > v139)
            goto LABEL_101;
        }
LABEL_181:
        if (v136 == 0.0 && v13[31].f32[1] != 0.0)
        {
          v140 = std::vector<float>::vector(v155, *v10 + 24 * v14);
          v141 = vision::mod::LivenessCheckPredictor::computeEyebrow2EyeHeight((uint64_t)v140, (float32x2_t **)v155);
          v142 = v13[3].f32[0] * v13[31].f32[1];
          a1 = (float32x2_t *)v155[0];
          if (v155[0])
          {
            v155[1] = v155[0];
            operator delete(v155[0]);
          }
          a4 = v154;
          if (v141 > v142)
          {
LABEL_101:
            ++v13[21].i32[*a7];
            v82 = *a7;
            v83 = v13[21].i32[v82];
            if (v83 > v15)
              v15 = v13[21].i32[v82];
            if ((_DWORD)v82 == 9 || (_DWORD)v82 == 7)
            {
              if (v83 < v13[5].i32[0])
                goto LABEL_109;
LABEL_108:
              v13[14].i8[5] = 1;
              goto LABEL_109;
            }
            if (v83 >= v13[4].i32[1])
              goto LABEL_108;
LABEL_109:
            ++v14;
            v9 = *a3;
            if (v14 >= (a3[1] - *a3) >> 2)
              goto LABEL_189;
            continue;
          }
        }
        if (v13[31].f32[0] != 0.0 || v13[31].f32[1] != 0.0)
        {
LABEL_188:
          v13[21].i32[*a7] = 0;
          ++v14;
          v9 = *a3;
          if (v14 >= (a3[1] - *a3) >> 2)
            goto LABEL_189;
          continue;
        }
        return 6;
      default:
        goto LABEL_188;
    }
  }
}

void sub_213BD4CD0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *__p,uint64_t a26)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_213BD4D28(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::locale::~locale((std::locale *)(v1 - 160));
  _Unwind_Resume(a1);
}

uint64_t vision::mod::LivenessCheckPredictor::runTrajectoryAnalysis(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t **v8;
  int v9;
  unint64_t v10;
  uint64_t *v11;
  size_t v12;
  int v13;
  _BOOL4 v14;
  int v15;
  _BOOL4 v16;
  uint64_t *v17;
  int v18;
  uint64_t **v19;
  int v20;
  unint64_t v21;
  uint64_t *v22;
  size_t v23;
  int v24;
  _BOOL4 v25;
  int v26;
  _BOOL4 v27;
  int v28;
  float v29;
  uint64_t **v30;
  int v31;
  unint64_t v32;
  uint64_t *v33;
  size_t v34;
  int v35;
  _BOOL4 v36;
  int v37;
  _BOOL4 v38;
  float v39;
  float v40;
  uint64_t **v41;
  int v42;
  unint64_t v43;
  uint64_t *v44;
  size_t v45;
  int v46;
  _BOOL4 v47;
  int v48;
  _BOOL4 v49;
  int v50;
  uint64_t **v51;
  int v52;
  unint64_t v53;
  uint64_t *v54;
  size_t v55;
  int v56;
  _BOOL4 v57;
  int v58;
  _BOOL4 v59;
  uint64_t v60;
  int v61;
  float v62;
  uint64_t **v63;
  int v64;
  unint64_t v65;
  uint64_t *v66;
  size_t v67;
  int v68;
  _BOOL4 v69;
  int v70;
  _BOOL4 v71;
  float v72;
  float *v73;
  float *v74;
  char *v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  unint64_t v79;
  void *v80;
  float *v81;
  float *v82;
  float *v83;
  float *v84;
  unint64_t v85;
  float *v86;
  int v87;
  uint64_t **v88;
  int v89;
  unint64_t v90;
  uint64_t *v91;
  size_t v92;
  int v93;
  _BOOL4 v94;
  int v95;
  _BOOL4 v96;
  double v97;
  double v98;
  int v99;
  uint64_t **v100;
  int v101;
  unint64_t v102;
  uint64_t *v103;
  size_t v104;
  int v105;
  _BOOL4 v106;
  int v107;
  _BOOL4 v108;
  int v109;
  double v110;
  uint64_t **v111;
  int v112;
  unint64_t v113;
  uint64_t *v114;
  size_t v115;
  int v116;
  _BOOL4 v117;
  int v118;
  _BOOL4 v119;
  int v120;
  double v121;
  uint64_t **v122;
  int v123;
  unint64_t v124;
  uint64_t *v125;
  size_t v126;
  int v127;
  _BOOL4 v128;
  int v129;
  _BOOL4 v130;
  uint64_t *v131;
  uint64_t v132;
  _QWORD *v133;
  uint64_t v134;
  unint64_t v135;
  float v136;
  float v137;
  float v138;
  float v139;
  uint64_t **v140;
  int v141;
  unint64_t v142;
  uint64_t *v143;
  size_t v144;
  int v145;
  _BOOL4 v146;
  int v147;
  _BOOL4 v148;
  int v149;
  unint64_t v150;
  uint64_t *v151;
  size_t v152;
  int v153;
  _BOOL4 v154;
  int v155;
  _BOOL4 v156;
  uint64_t v157;
  uint64_t v158;
  char *v159;
  float *v160;
  uint64_t v161;
  __int128 v162;
  BOOL v163;
  uint64_t v164;
  uint64_t v165;
  char *v166;
  uint64_t v167;
  char *v168;
  float *v169;
  uint64_t i;
  float32x4_t **v171;
  float32x4_t *v172;
  float32x4_t *v173;
  uint64_t v174;
  float32x4_t **v175;
  float32x4_t *v176;
  float32x4_t *v177;
  unint64_t v178;
  unint64_t v179;
  unint64_t v180;
  float v181;
  float32x4_t *v182;
  float32x4_t *v183;
  unint64_t v184;
  float32x4_t v185;
  float32x4_t v186;
  float32x4_t v187;
  float32x4_t v188;
  float *v189;
  float *v190;
  unint64_t v191;
  float v192;
  float v193;
  float v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  char *v199;
  uint64_t v200;
  float v201;
  float v202;
  float v203;
  float v204;
  uint64_t v205;
  uint64_t v206;
  int v207;
  float v208;
  uint64_t v209;
  char *v210;
  char *v211;
  void *v212;
  char *v213;
  void *v214;
  void *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t *v219;
  float *v220;
  float *v221;
  float *v222;
  uint64_t v223;
  uint64_t v224;
  char *v225;
  uint64_t *v226;
  uint64_t v227;
  uint64_t **v228;
  char v229[23];
  char v230;
  _WORD __s2[11];
  char v232;
  _QWORD __s1[2];
  char v234;
  char *v235;
  char *v236;
  float *v237;
  float *v238;
  float *v239;
  uint64_t v240;

  v217 = a3;
  v240 = *MEMORY[0x24BDAC8D0];
  if (*(int *)(a1 + 52) < 2)
    return 3;
  v5 = a1;
  v237 = 0;
  v238 = 0;
  v239 = 0;
  std::vector<std::vector<float>>::vector(&v235, a2);
  if (*(int *)(v5 + 52) >= 1)
  {
    v219 = a2;
    v221 = 0;
    v220 = 0;
    v222 = 0;
    v6 = 0;
    v228 = *(uint64_t ***)(v217 + 8);
    v218 = v5;
    while (1)
    {
      v234 = 2;
      strcpy((char *)__s1, "x1");
      if (!v228)
LABEL_319:
        std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
      v8 = v228;
      while (1)
      {
        while (1)
        {
          v9 = *((char *)v8 + 55);
          if (v9 >= 0)
            v10 = *((unsigned __int8 *)v8 + 55);
          else
            v10 = (unint64_t)v8[5];
          if (v9 >= 0)
            v11 = (uint64_t *)(v8 + 4);
          else
            v11 = v8[4];
          if (v10 >= 2)
            v12 = 2;
          else
            v12 = v10;
          v13 = memcmp(__s1, v11, v12);
          v14 = v13 < 0;
          if (!v13)
            v14 = v10 > 2;
          if (!v14)
            break;
          v8 = (uint64_t **)*v8;
          if (!v8)
            goto LABEL_319;
        }
        v15 = memcmp(v11, __s1, v12);
        v16 = v10 < 2;
        if (v15)
          v16 = v15 < 0;
        if (!v16)
          break;
        v8 = (uint64_t **)v8[1];
        if (!v8)
          goto LABEL_319;
      }
      v17 = v8[7];
      v227 = v6;
      v18 = *((_DWORD *)v17 + v6);
      v232 = 2;
      strcpy((char *)__s2, "x0");
      v19 = v228;
      while (1)
      {
        while (1)
        {
          v20 = *((char *)v19 + 55);
          if (v20 >= 0)
            v21 = *((unsigned __int8 *)v19 + 55);
          else
            v21 = (unint64_t)v19[5];
          if (v20 >= 0)
            v22 = (uint64_t *)(v19 + 4);
          else
            v22 = v19[4];
          if (v21 >= 2)
            v23 = 2;
          else
            v23 = v21;
          v24 = memcmp(__s2, v22, v23);
          v25 = v24 < 0;
          if (!v24)
            v25 = v21 > 2;
          if (!v25)
            break;
          v19 = (uint64_t **)*v19;
          if (!v19)
            goto LABEL_321;
        }
        v26 = memcmp(v22, __s2, v23);
        v27 = v21 < 2;
        if (v26)
          v27 = v26 < 0;
        if (!v27)
          break;
        v19 = (uint64_t **)v19[1];
        if (!v19)
LABEL_321:
          std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
      }
      v28 = v18 - *((_DWORD *)v19[7] + v227);
      if (v28 < 0)
        v28 = *((_DWORD *)v19[7] + v227) - v18;
      v29 = (float)v28;
      v230 = 11;
      v224 = *(_QWORD *)"image_width";
      strcpy(v229, "image_width");
      v30 = v228;
      while (1)
      {
        while (1)
        {
          v31 = *((char *)v30 + 55);
          if (v31 >= 0)
            v32 = *((unsigned __int8 *)v30 + 55);
          else
            v32 = (unint64_t)v30[5];
          if (v31 >= 0)
            v33 = (uint64_t *)(v30 + 4);
          else
            v33 = v30[4];
          if (v32 >= 0xB)
            v34 = 11;
          else
            v34 = v32;
          v35 = memcmp(v229, v33, v34);
          v36 = v35 < 0;
          if (!v35)
            v36 = v32 > 0xB;
          if (!v36)
            break;
          v30 = (uint64_t **)*v30;
          if (!v30)
            goto LABEL_322;
        }
        v37 = memcmp(v33, v229, v34);
        v38 = v32 < 0xB;
        if (v37)
          v38 = v37 < 0;
        if (!v38)
          break;
        v30 = (uint64_t **)v30[1];
        if (!v30)
LABEL_322:
          std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
      }
      v39 = (float)*((int *)v30[7] + v227);
      v234 = 2;
      v40 = v29 / v39;
      strcpy((char *)__s1, "y1");
      v41 = v228;
      while (1)
      {
        while (1)
        {
          v42 = *((char *)v41 + 55);
          if (v42 >= 0)
            v43 = *((unsigned __int8 *)v41 + 55);
          else
            v43 = (unint64_t)v41[5];
          if (v42 >= 0)
            v44 = (uint64_t *)(v41 + 4);
          else
            v44 = v41[4];
          if (v43 >= 2)
            v45 = 2;
          else
            v45 = v43;
          v46 = memcmp(__s1, v44, v45);
          v47 = v46 < 0;
          if (!v46)
            v47 = v43 > 2;
          if (!v47)
            break;
          v41 = (uint64_t **)*v41;
          if (!v41)
            goto LABEL_323;
        }
        v48 = memcmp(v44, __s1, v45);
        v49 = v43 < 2;
        if (v48)
          v49 = v48 < 0;
        if (!v49)
          break;
        v41 = (uint64_t **)v41[1];
        if (!v41)
LABEL_323:
          std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
      }
      v50 = *((_DWORD *)v41[7] + v227);
      v232 = 2;
      strcpy((char *)__s2, "y0");
      v51 = v228;
      while (1)
      {
        while (1)
        {
          v52 = *((char *)v51 + 55);
          if (v52 >= 0)
            v53 = *((unsigned __int8 *)v51 + 55);
          else
            v53 = (unint64_t)v51[5];
          if (v52 >= 0)
            v54 = (uint64_t *)(v51 + 4);
          else
            v54 = v51[4];
          if (v53 >= 2)
            v55 = 2;
          else
            v55 = v53;
          v56 = memcmp(__s2, v54, v55);
          v57 = v56 < 0;
          if (!v56)
            v57 = v53 > 2;
          if (!v57)
            break;
          v51 = (uint64_t **)*v51;
          if (!v51)
            goto LABEL_324;
        }
        v58 = memcmp(v54, __s2, v55);
        v59 = v53 < 2;
        if (v58)
          v59 = v58 < 0;
        if (!v59)
          break;
        v51 = (uint64_t **)v51[1];
        if (!v51)
LABEL_324:
          std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
      }
      v60 = v227;
      v61 = v50 - *((_DWORD *)v51[7] + v227);
      if (v61 < 0)
        v61 = *((_DWORD *)v51[7] + v227) - v50;
      v62 = (float)v61;
      v230 = 12;
      v223 = *(_QWORD *)"image_height";
      strcpy(v229, "image_height");
      v63 = v228;
      while (1)
      {
        while (1)
        {
          v64 = *((char *)v63 + 55);
          if (v64 >= 0)
            v65 = *((unsigned __int8 *)v63 + 55);
          else
            v65 = (unint64_t)v63[5];
          if (v64 >= 0)
            v66 = (uint64_t *)(v63 + 4);
          else
            v66 = v63[4];
          if (v65 >= 0xC)
            v67 = 12;
          else
            v67 = v65;
          v68 = memcmp(v229, v66, v67);
          v69 = v68 < 0;
          if (!v68)
            v69 = v65 > 0xC;
          if (!v69)
            break;
          v63 = (uint64_t **)*v63;
          if (!v63)
            goto LABEL_325;
        }
        v70 = memcmp(v66, v229, v67);
        v71 = v65 < 0xC;
        if (v70)
          v71 = v70 < 0;
        if (!v71)
          break;
        v63 = (uint64_t **)v63[1];
        if (!v63)
LABEL_325:
          std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
      }
      v72 = (float)(v40 + (float)(v62 / (float)*((int *)v63[7] + v227))) * 0.5;
      v73 = v222;
      if (v222 >= v220)
        break;
      *v222 = v72;
      v74 = v73 + 1;
LABEL_150:
      v222 = v74;
      v238 = v74;
      v234 = 2;
      strcpy((char *)__s1, "x0");
      if (!v228)
LABEL_320:
        std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
      v88 = v228;
      while (1)
      {
        while (1)
        {
          v89 = *((char *)v88 + 55);
          if (v89 >= 0)
            v90 = *((unsigned __int8 *)v88 + 55);
          else
            v90 = (unint64_t)v88[5];
          if (v89 >= 0)
            v91 = (uint64_t *)(v88 + 4);
          else
            v91 = v88[4];
          if (v90 >= 2)
            v92 = 2;
          else
            v92 = v90;
          v93 = memcmp(__s1, v91, v92);
          v94 = v93 < 0;
          if (!v93)
            v94 = v90 > 2;
          if (!v94)
            break;
          v88 = (uint64_t **)*v88;
          if (!v88)
            goto LABEL_320;
        }
        v95 = memcmp(v91, __s1, v92);
        v96 = v90 < 2;
        if (v95)
          v96 = v95 < 0;
        if (!v96)
          break;
        v88 = (uint64_t **)v88[1];
        if (!v88)
          goto LABEL_320;
      }
      v97 = (double)(int)v40;
      v98 = -v97;
      v99 = (int)((double)*((int *)v88[7] + v60) + v97 * -0.1);
      v234 = 2;
      strcpy((char *)__s1, "y0");
      v100 = v228;
      while (1)
      {
        while (1)
        {
          v101 = *((char *)v100 + 55);
          if (v101 >= 0)
            v102 = *((unsigned __int8 *)v100 + 55);
          else
            v102 = (unint64_t)v100[5];
          if (v101 >= 0)
            v103 = (uint64_t *)(v100 + 4);
          else
            v103 = v100[4];
          if (v102 >= 2)
            v104 = 2;
          else
            v104 = v102;
          v105 = memcmp(__s1, v103, v104);
          v106 = v105 < 0;
          if (!v105)
            v106 = v102 > 2;
          if (!v106)
            break;
          v100 = (uint64_t **)*v100;
          if (!v100)
            goto LABEL_326;
        }
        v107 = memcmp(v103, __s1, v104);
        v108 = v102 < 2;
        if (v107)
          v108 = v107 < 0;
        if (!v108)
          break;
        v100 = (uint64_t **)v100[1];
        if (!v100)
LABEL_326:
          std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
      }
      v109 = (int)((double)*((int *)v100[7] + v227) + v98 * 0.1);
      v110 = fmax((double)v99, 0.0);
      v234 = 11;
      strcpy((char *)__s1 + 7, "idth");
      __s1[0] = v224;
      v111 = v228;
      while (1)
      {
        while (1)
        {
          v112 = *((char *)v111 + 55);
          if (v112 >= 0)
            v113 = *((unsigned __int8 *)v111 + 55);
          else
            v113 = (unint64_t)v111[5];
          if (v112 >= 0)
            v114 = (uint64_t *)(v111 + 4);
          else
            v114 = v111[4];
          if (v113 >= 0xB)
            v115 = 11;
          else
            v115 = v113;
          v116 = memcmp(__s1, v114, v115);
          v117 = v116 < 0;
          if (!v116)
            v117 = v113 > 0xB;
          if (!v117)
            break;
          v111 = (uint64_t **)*v111;
          if (!v111)
            goto LABEL_327;
        }
        v118 = memcmp(v114, __s1, v115);
        v119 = v113 < 0xB;
        if (v118)
          v119 = v118 < 0;
        if (!v119)
          break;
        v111 = (uint64_t **)v111[1];
        if (!v111)
LABEL_327:
          std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
      }
      v120 = (int)fmin(v110, (double)*((int *)v111[7] + v227));
      v121 = fmax((double)v109, 0.0);
      v234 = 12;
      strcpy((char *)&__s1[1], "ight");
      __s1[0] = v223;
      v122 = v228;
      while (1)
      {
        while (1)
        {
          v123 = *((char *)v122 + 55);
          if (v123 >= 0)
            v124 = *((unsigned __int8 *)v122 + 55);
          else
            v124 = (unint64_t)v122[5];
          if (v123 >= 0)
            v125 = (uint64_t *)(v122 + 4);
          else
            v125 = v122[4];
          if (v124 >= 0xC)
            v126 = 12;
          else
            v126 = v124;
          v127 = memcmp(__s1, v125, v126);
          v128 = v127 < 0;
          if (!v127)
            v128 = v124 > 0xC;
          if (!v128)
            break;
          v122 = (uint64_t **)*v122;
          if (!v122)
            goto LABEL_328;
        }
        v129 = memcmp(v125, __s1, v126);
        v130 = v124 < 0xC;
        if (v129)
          v130 = v129 < 0;
        if (!v130)
          break;
        v122 = (uint64_t **)v122[1];
        if (!v122)
LABEL_328:
          std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
      }
      v131 = (uint64_t *)(*v219 + 24 * v227);
      v133 = v131 + 1;
      v132 = v131[1];
      v226 = v131;
      v134 = *v131;
      if (v132 == v134)
      {
        v7 = v227;
      }
      else
      {
        v135 = 0;
        v136 = (float)(int)fmin(v121, (double)*((int *)v122[7] + v227));
        v137 = (float)v120;
        v225 = &v235[24 * v227];
        do
        {
          v138 = *(float *)(v134 + 4 * v135);
          if ((v135 & 1) != 0)
          {
            v234 = 12;
            strcpy((char *)&__s1[1], "ight");
            __s1[0] = v223;
            if (!v228)
LABEL_317:
              std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
            v139 = v138 + v136;
            v140 = v228;
            while (1)
            {
              while (1)
              {
                v149 = *((char *)v140 + 55);
                if (v149 >= 0)
                  v150 = *((unsigned __int8 *)v140 + 55);
                else
                  v150 = (unint64_t)v140[5];
                if (v149 >= 0)
                  v151 = (uint64_t *)(v140 + 4);
                else
                  v151 = v140[4];
                if (v150 >= 0xC)
                  v152 = 12;
                else
                  v152 = v150;
                v153 = memcmp(__s1, v151, v152);
                v154 = v153 < 0;
                if (!v153)
                  v154 = v150 > 0xC;
                if (!v154)
                  break;
                v140 = (uint64_t **)*v140;
                if (!v140)
                  goto LABEL_317;
              }
              v155 = memcmp(v151, __s1, v152);
              v156 = v150 < 0xC;
              if (v155)
                v156 = v155 < 0;
              if (!v156)
                break;
              v140 = (uint64_t **)v140[1];
              if (!v140)
                goto LABEL_317;
            }
          }
          else
          {
            v234 = 11;
            strcpy((char *)__s1 + 7, "idth");
            __s1[0] = v224;
            if (!v228)
LABEL_318:
              std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
            v139 = v138 + v137;
            v140 = v228;
            while (1)
            {
              while (1)
              {
                v141 = *((char *)v140 + 55);
                if (v141 >= 0)
                  v142 = *((unsigned __int8 *)v140 + 55);
                else
                  v142 = (unint64_t)v140[5];
                if (v141 >= 0)
                  v143 = (uint64_t *)(v140 + 4);
                else
                  v143 = v140[4];
                if (v142 >= 0xB)
                  v144 = 11;
                else
                  v144 = v142;
                v145 = memcmp(__s1, v143, v144);
                v146 = v145 < 0;
                if (!v145)
                  v146 = v142 > 0xB;
                if (!v146)
                  break;
                v140 = (uint64_t **)*v140;
                if (!v140)
                  goto LABEL_318;
              }
              v147 = memcmp(v143, __s1, v144);
              v148 = v142 < 0xB;
              if (v147)
                v148 = v147 < 0;
              if (!v148)
                break;
              v140 = (uint64_t **)v140[1];
              if (!v140)
                goto LABEL_318;
            }
          }
          v7 = v227;
          *(float *)(*(_QWORD *)v225 + 4 * v135++) = v139 / (float)*((int *)v140[7] + v227);
          v134 = *v226;
        }
        while (v135 < (*v133 - *v226) >> 2);
      }
      v6 = v7 + 1;
      v5 = v218;
      if (v6 >= *(int *)(v218 + 52))
        goto LABEL_276;
    }
    v75 = (char *)((char *)v222 - (char *)v221);
    v76 = v222 - v221;
    v77 = v76 + 1;
    if ((unint64_t)(v76 + 1) >> 62)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v78 = (char *)v220 - (char *)v221;
    if (((char *)v220 - (char *)v221) >> 1 > v77)
      v77 = v78 >> 1;
    if ((unint64_t)v78 >= 0x7FFFFFFFFFFFFFFCLL)
      v79 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v79 = v77;
    if (v79)
    {
      if (v79 >> 62)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v80 = operator new(4 * v79);
    }
    else
    {
      v80 = 0;
    }
    v81 = v221;
    v82 = v222;
    v83 = (float *)((char *)v80 + 4 * v76);
    *v83 = v72;
    v74 = v83 + 1;
    if (v82 == v81)
    {
LABEL_147:
      v237 = v83;
      v238 = v74;
      v220 = (float *)((char *)v80 + 4 * v79);
      v239 = v220;
      if (v81)
      {
        operator delete(v81);
        v228 = *(uint64_t ***)(v217 + 8);
      }
      v221 = v83;
      goto LABEL_150;
    }
    v84 = v82;
    v85 = (char *)(v82 - 1) - (char *)v81;
    if (v85 >= 0xBC)
    {
      if (&v75[(_QWORD)v80 - 4 - (v85 & 0xFFFFFFFFFFFFFFFCLL)] <= &v75[(_QWORD)v80 - 4]
        && (float *)((char *)v84 - (v85 & 0xFFFFFFFFFFFFFFFCLL) - 4) <= v84 - 1
        && (unint64_t)((char *)v84 - &v75[(_QWORD)v80]) >= 0x20)
      {
        v157 = (v85 >> 2) + 1;
        v158 = 4 * (v157 & 0x7FFFFFFFFFFFFFF8);
        v86 = &v222[v158 / 0xFFFFFFFFFFFFFFFCLL];
        v83 = (float *)((char *)v83 - v158);
        v159 = (char *)v80 + 4 * v76 - 16;
        v160 = v222 - 4;
        v161 = v157 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          v162 = *(_OWORD *)v160;
          *((_OWORD *)v159 - 1) = *((_OWORD *)v160 - 1);
          *(_OWORD *)v159 = v162;
          v159 -= 32;
          v160 -= 8;
          v161 -= 8;
        }
        while (v161);
        v163 = v157 == (v157 & 0x7FFFFFFFFFFFFFF8);
        v81 = v221;
        if (v163)
          goto LABEL_147;
        goto LABEL_146;
      }
      v86 = v222;
    }
    else
    {
      v86 = v84;
    }
    v81 = v221;
    do
    {
LABEL_146:
      v87 = *((_DWORD *)v86-- - 1);
      *((_DWORD *)v83-- - 1) = v87;
    }
    while (v86 != v81);
    goto LABEL_147;
  }
LABEL_276:
  v164 = MEMORY[0x24BDAC7A8](&v216);
  v166 = (char *)&v216 - v165;
  v167 = *(unsigned int *)(v5 + 52);
  *(_DWORD *)((char *)&v216 + 4 * (int)v167 - v165 - 4) = -1082130432;
  if ((int)v167 <= 1)
  {
    MEMORY[0x24BDAC7A8](v164);
    v199 = (char *)&v216 - ((v205 + 15) & 0x7FFFFFFF0);
    *(_DWORD *)&v199[4 * v206] = -1054867456;
    *(_DWORD *)v199 = -1054867456;
    goto LABEL_300;
  }
  v168 = v235;
  v169 = v237;
  for (i = 1; i != v167; ++i)
  {
    while (1)
    {
      v171 = (float32x4_t **)&v168[24 * i];
      v172 = *v171;
      v173 = v171[1];
      v174 = i - 1;
      if (v172 != v173)
      {
        v175 = (float32x4_t **)&v168[24 * v174];
        v176 = *v175;
        v177 = v175[1];
        if (v176 != v177)
          break;
      }
      *(_DWORD *)&v166[4 * v174] = -1082130432;
      if (++i == v167)
        goto LABEL_292;
    }
    v178 = ((char *)v177 - (char *)v176) >> 2;
    if (v178 <= 1)
      v179 = 1;
    else
      v179 = v178;
    if (v179 < 8)
    {
      v180 = 0;
      v181 = 0.0;
LABEL_289:
      v189 = &v172->f32[v180];
      v190 = &v176->f32[v180];
      v191 = v179 - v180;
      do
      {
        v192 = *v190++;
        v193 = v192;
        v194 = *v189++;
        v181 = v181 + (float)((float)(v193 - v194) * (float)(v193 - v194));
        --v191;
      }
      while (v191);
      goto LABEL_291;
    }
    v180 = v179 & 0xFFFFFFFFFFFFFFF8;
    v182 = v176 + 1;
    v183 = v172 + 1;
    v181 = 0.0;
    v184 = v179 & 0xFFFFFFFFFFFFFFF8;
    do
    {
      v185 = vsubq_f32(v182[-1], v183[-1]);
      v186 = vsubq_f32(*v182, *v183);
      v187 = vmulq_f32(v185, v185);
      v188 = vmulq_f32(v186, v186);
      v181 = (float)((float)((float)((float)((float)((float)((float)(v181 + v187.f32[0]) + v187.f32[1]) + v187.f32[2])
                                           + v187.f32[3])
                                   + v188.f32[0])
                           + v188.f32[1])
                   + v188.f32[2])
           + v188.f32[3];
      v182 += 2;
      v183 += 2;
      v184 -= 8;
    }
    while (v184);
    if (v179 != v180)
      goto LABEL_289;
LABEL_291:
    *(float *)&v166[4 * v174] = (float)(sqrtf(v181) / (float)v178) / v169[i];
  }
LABEL_292:
  MEMORY[0x24BDAC7A8](v164);
  v199 = (char *)&v216 - ((v198 + 15) & 0x7FFFFFFF0);
  *(_DWORD *)&v199[4 * v197] = -1054867456;
  *(_DWORD *)v199 = -1054867456;
  if ((int)v195 >= 3)
  {
    v200 = 0;
    do
    {
      v201 = *(float *)(v196 + v200 + 4);
      v202 = -10.0;
      if (v201 != -1.0)
      {
        v203 = *(float *)(v196 + v200);
        if (v203 != -1.0)
        {
          v204 = *(float *)(v196 + v200 + 8);
          if (v204 != -1.0)
            v202 = (float)-(float)(v203 - (float)(v201 * 2.0)) - v204;
        }
      }
      *(float *)&v199[v200 + 4] = v202;
      v200 += 4;
    }
    while (4 * v197 - 4 != v200);
  }
LABEL_300:
  *(_DWORD *)(v5 + 264) = 0;
  if ((int)v195 < 1)
  {
    v207 = 0;
  }
  else
  {
    v207 = 0;
    v208 = *(float *)(v5 + 56);
    v209 = v195;
    do
    {
      if (*(float *)v199 > v208)
        *(_DWORD *)(v5 + 264) = ++v207;
      v199 += 4;
      --v209;
    }
    while (v209);
  }
  *(float *)(v5 + 268) = 1.0 - (float)((float)v207 / (float)(int)v195);
  v210 = v235;
  if (v235)
  {
    v211 = v236;
    v212 = v235;
    if (v236 != v235)
    {
      v213 = v236;
      do
      {
        v215 = (void *)*((_QWORD *)v213 - 3);
        v213 -= 24;
        v214 = v215;
        if (v215)
        {
          *((_QWORD *)v211 - 2) = v214;
          operator delete(v214);
        }
        v211 = v213;
      }
      while (v213 != v210);
      v212 = v235;
    }
    v236 = v210;
    operator delete(v212);
  }
  if (v237)
    operator delete(v237);
  return 0;
}

void sub_213BD5EC0(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v3;

  std::vector<std::vector<float>>::~vector[abi:ne180100]((void **)(v1 - 208));
  v3 = *(void **)(v1 - 184);
  if (!v3)
    _Unwind_Resume(a1);
  *(_QWORD *)(v1 - 176) = v3;
  operator delete(v3);
  _Unwind_Resume(a1);
}

uint64_t vision::mod::LivenessCheckPredictor::runIDMatching(uint64_t a1, uint64_t *a2, uint64_t *a3, __n128 a4)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  _DWORD *v18;
  unint64_t v19;
  char *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  __n128 *v24;
  __n128 *v25;
  uint64_t v26;
  uint64_t v28;
  unint64_t v29;
  float v30;
  float *v31;
  unint64_t v32;
  float *v33;
  unint64_t v34;
  float v35;
  char *v36;
  unint64_t v37;
  float32x4_t v38;
  float32x4_t *v39;
  unint64_t v40;
  float32x4_t v41;
  float *v42;
  unint64_t v43;
  char *v44;
  __int128 v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char *v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  unint64_t v54;
  char *v55;
  int64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  _BYTE *v61;
  _DWORD *v62;
  unint64_t v63;
  char *v64;
  int v65;
  uint64_t v66;
  uint64_t v67;
  _OWORD *v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  float v72;
  char *v73;
  unint64_t v74;
  float32x4_t v75;
  float32x4_t *v76;
  unint64_t v77;
  float32x4_t v78;
  float *v79;
  unint64_t v80;
  char *v81;
  void *v82;
  int64_t v83;
  char *v84;
  char *v85;
  char *v86;
  char *v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  float v91;
  uint64_t v92;
  float *v93;
  float *v94;
  float **v95;
  unint64_t v96;
  uint64_t v97;
  float *v98;
  float v99;
  unint64_t v100;
  float *v101;
  float v102;
  float v103;
  float v104;
  float v105;
  float v106;
  unint64_t v107;
  char *v108;
  void *v109;
  char *v110;
  void *v111;
  void *v112;
  void *__p;
  _BYTE *v117;
  char *v118;
  void *v119;
  uint64_t v120;
  char *v121;
  void *v122;
  char *v123;
  unint64_t v124;

  if (*a2 == a2[1])
    return 5;
  v5 = *a3;
  v4 = a3[1];
  if (*a3 == v4)
    return 5;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v122 = 0;
  v123 = 0;
  v124 = 0;
  v119 = 0;
  v120 = 0;
  v121 = 0;
  do
  {
    if (v6 < v8)
    {
      *(_DWORD *)v6 = *(_DWORD *)(v5 + 4 * v7);
      v10 = (uint64_t)(v6 + 4);
      goto LABEL_5;
    }
    v13 = (v6 - v9) >> 2;
    v14 = v13 + 1;
    if ((unint64_t)(v13 + 1) >> 62)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    if ((v8 - v9) >> 1 > v14)
      v14 = (v8 - v9) >> 1;
    if ((unint64_t)(v8 - v9) >= 0x7FFFFFFFFFFFFFFCLL)
      v15 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v15 = v14;
    if (v15)
    {
      if (v15 >> 62)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v16 = v4;
      v17 = operator new(4 * v15);
      v4 = v16;
      v18 = &v17[4 * v13];
      *v18 = *(_DWORD *)(v5 + 4 * v7);
      v10 = (uint64_t)(v18 + 1);
      if (v6 == v9)
        goto LABEL_21;
    }
    else
    {
      v17 = 0;
      v18 = (_DWORD *)(4 * v13);
      *(_DWORD *)(4 * v13) = *(_DWORD *)(v5 + 4 * v7);
      v10 = 4 * v13 + 4;
      if (v6 == v9)
        goto LABEL_21;
    }
    v19 = v6 - 4 - v9;
    if (v19 >= 0xBC)
    {
      if (&v17[v6 - v9 - 4 - (v19 & 0xFFFFFFFFFFFFFFFCLL)] > &v17[v6 - v9 - 4])
      {
        v20 = v6;
      }
      else if (&v6[-(v19 & 0xFFFFFFFFFFFFFFFCLL) - 4] > v6 - 4)
      {
        v20 = v6;
      }
      else if ((unint64_t)(v9 - v17) >= 0x20)
      {
        v22 = (v19 >> 2) + 1;
        v23 = 4 * (v22 & 0x7FFFFFFFFFFFFFF8);
        v20 = &v6[-v23];
        v18 = (_DWORD *)((char *)v18 - v23);
        v24 = (__n128 *)&v17[4 * v13 - 16];
        v25 = (__n128 *)(v6 - 16);
        v26 = v22 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          a4 = *v25;
          v24[-1] = v25[-1];
          *v24 = a4;
          v24 -= 2;
          v25 -= 2;
          v26 -= 8;
        }
        while (v26);
        if (v22 == (v22 & 0x7FFFFFFFFFFFFFF8))
          goto LABEL_21;
      }
      else
      {
        v20 = v6;
      }
    }
    else
    {
      v20 = v6;
    }
    do
    {
      v21 = *((_DWORD *)v20 - 1);
      v20 -= 4;
      *--v18 = v21;
    }
    while (v20 != v9);
LABEL_21:
    v8 = &v17[4 * v15];
    v119 = v18;
    v121 = v8;
    if (v9)
    {
      operator delete(v9);
      v5 = *a3;
      v4 = a3[1];
    }
    v9 = (char *)v18;
LABEL_5:
    v120 = v10;
    ++v7;
    v11 = v4 - v5;
    v12 = (v4 - v5) >> 2;
    v6 = (char *)v10;
  }
  while (v12 > v7);
  v28 = a1;
  if (v4 != v5)
  {
    if (v11 < 8)
    {
      v29 = 0;
      v30 = 0.0;
      goto LABEL_41;
    }
    v29 = v12 & 0xFFFFFFFFFFFFFFFELL;
    v31 = (float *)((char *)v119 + 4);
    v30 = 0.0;
    v32 = v12 & 0xFFFFFFFFFFFFFFFELL;
    do
    {
      v30 = (float)(v30 + (float)(*(v31 - 1) * *(v31 - 1))) + (float)(*v31 * *v31);
      v31 += 2;
      v32 -= 2;
    }
    while (v32);
    if (v12 != v29)
    {
LABEL_41:
      v33 = (float *)((char *)v119 + 4 * v29);
      v34 = v12 - v29;
      do
      {
        v35 = *v33++;
        v30 = v30 + (float)(v35 * v35);
        --v34;
      }
      while (v34);
    }
    v36 = (char *)v119;
    a4.n128_f32[0] = sqrtf(v30);
    if (v11 < 0x20)
    {
      v37 = 0;
      goto LABEL_48;
    }
    v37 = v12 & 0xFFFFFFFFFFFFFFF8;
    v38 = (float32x4_t)vdupq_lane_s32((int32x2_t)a4.n128_u64[0], 0);
    v39 = (float32x4_t *)((char *)v119 + 16);
    v40 = v12 & 0xFFFFFFFFFFFFFFF8;
    do
    {
      v41 = vdivq_f32(*v39, v38);
      v39[-1] = vdivq_f32(v39[-1], v38);
      *v39 = v41;
      v39 += 2;
      v40 -= 8;
    }
    while (v40);
    if (v12 != v37)
    {
LABEL_48:
      v42 = (float *)&v36[4 * v37];
      v43 = v12 - v37;
      do
      {
        *v42 = *v42 / a4.n128_f32[0];
        ++v42;
        --v43;
      }
      while (v43);
    }
  }
  v44 = std::vector<std::vector<float>>::__push_back_slow_path<std::vector<float> const&>((char **)&v122, (uint64_t)&v119);
  v123 = v44;
  *(_DWORD *)(a1 + 296) = 0;
  v46 = *a2;
  if (a2[1] == *a2)
    goto LABEL_102;
  v47 = 0;
  while (2)
  {
    __p = 0;
    v117 = 0;
    v118 = 0;
    v48 = (uint64_t *)(v46 + 24 * v47);
    v49 = *v48;
    if (v48[1] != *v48)
    {
      v50 = 0;
      v51 = 0;
      while (1)
      {
        if (v50 < v118)
        {
          *(_DWORD *)v50 = *(_DWORD *)(v49 + 4 * v51);
          v52 = (uint64_t)(v50 + 4);
        }
        else
        {
          v55 = (char *)__p;
          v56 = v50 - (_BYTE *)__p;
          v57 = (v50 - (_BYTE *)__p) >> 2;
          v58 = v57 + 1;
          if ((unint64_t)(v57 + 1) >> 62)
            std::vector<float>::__throw_length_error[abi:ne180100]();
          v59 = v118 - (_BYTE *)__p;
          if ((v118 - (_BYTE *)__p) >> 1 > v58)
            v58 = v59 >> 1;
          if ((unint64_t)v59 >= 0x7FFFFFFFFFFFFFFCLL)
            v60 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v60 = v58;
          if (v60)
          {
            if (v60 >> 62)
              std::__throw_bad_array_new_length[abi:ne180100]();
            v61 = operator new(4 * v60);
            v62 = &v61[4 * v57];
            *v62 = *(_DWORD *)(v49 + 4 * v51);
            v52 = (uint64_t)(v62 + 1);
            if (v50 != v55)
            {
LABEL_67:
              v63 = v50 - 4 - v55;
              if (v63 < 0xBC
                || &v61[v56 - 4 - (v63 & 0xFFFFFFFFFFFFFFFCLL)] > &v61[v56 - 4]
                || &v50[-(v63 & 0xFFFFFFFFFFFFFFFCLL) - 4] > v50 - 4
                || (unint64_t)(v50 - &v61[v56]) < 0x20)
              {
                v64 = v50;
              }
              else
              {
                v66 = (v63 >> 2) + 1;
                v67 = 4 * (v66 & 0x7FFFFFFFFFFFFFF8);
                v64 = &v50[-v67];
                v62 = (_DWORD *)((char *)v62 - v67);
                v68 = &v61[4 * v57 - 16];
                v69 = v50 - 16;
                v70 = v66 & 0x7FFFFFFFFFFFFFF8;
                do
                {
                  v45 = *(_OWORD *)v69;
                  *(v68 - 1) = *((_OWORD *)v69 - 1);
                  *v68 = v45;
                  v68 -= 2;
                  v69 -= 32;
                  v70 -= 8;
                }
                while (v70);
                if (v66 == (v66 & 0x7FFFFFFFFFFFFFF8))
                {
LABEL_70:
                  __p = v62;
                  v117 = (_BYTE *)v52;
                  v118 = &v61[4 * v60];
                  if (!v55)
                    goto LABEL_56;
LABEL_74:
                  operator delete(v55);
                  v46 = *a2;
                  goto LABEL_56;
                }
              }
              do
              {
                v65 = *((_DWORD *)v64 - 1);
                v64 -= 4;
                *--v62 = v65;
              }
              while (v64 != v55);
              goto LABEL_70;
            }
          }
          else
          {
            v61 = 0;
            v62 = (_DWORD *)(4 * v57);
            *(_DWORD *)(4 * v57) = *(_DWORD *)(v49 + 4 * v51);
            v52 = 4 * v57 + 4;
            if (v50 != v55)
              goto LABEL_67;
          }
          __p = v62;
          v117 = (_BYTE *)v52;
          v118 = &v61[4 * v60];
          if (v55)
            goto LABEL_74;
        }
LABEL_56:
        v117 = (_BYTE *)v52;
        ++v51;
        v53 = (uint64_t *)(v46 + 24 * v47);
        v49 = *v53;
        v54 = (v53[1] - *v53) >> 2;
        v50 = (char *)v52;
        if (v54 <= v51)
          goto LABEL_83;
      }
    }
    v54 = 0;
LABEL_83:
    if (v54)
    {
      v71 = 0;
      v72 = 0.0;
      do
      {
        v72 = v72 + (float)(*((float *)__p + v71) * *((float *)__p + v71));
        ++v71;
      }
      while (v54 != v71);
      v73 = (char *)__p;
      *(float *)&v45 = sqrtf(v72);
      if (v54 < 8)
      {
        v74 = 0;
        goto LABEL_91;
      }
      v74 = v54 & 0xFFFFFFFFFFFFFFF8;
      v75 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v45, 0);
      v76 = (float32x4_t *)((char *)__p + 16);
      v77 = v54 & 0xFFFFFFFFFFFFFFF8;
      do
      {
        v78 = vdivq_f32(*v76, v75);
        v76[-1] = vdivq_f32(v76[-1], v75);
        *v76 = v78;
        v76 += 2;
        v77 -= 8;
      }
      while (v77);
      if (v54 != v74)
      {
LABEL_91:
        v79 = (float *)&v73[4 * v74];
        v80 = v54 - v74;
        do
        {
          *v79 = *v79 / *(float *)&v45;
          ++v79;
          --v80;
        }
        while (v80);
      }
    }
    v81 = v123;
    if ((unint64_t)v123 >= v124)
    {
      v86 = std::vector<std::vector<float>>::__push_back_slow_path<std::vector<float> const&>((char **)&v122, (uint64_t)&__p);
    }
    else
    {
      *(_QWORD *)v123 = 0;
      *((_QWORD *)v81 + 1) = 0;
      *((_QWORD *)v81 + 2) = 0;
      v82 = __p;
      v83 = v117 - (_BYTE *)__p;
      if (v117 != __p)
      {
        if (v83 < 0)
          std::vector<float>::__throw_length_error[abi:ne180100]();
        v84 = (char *)operator new(v117 - (_BYTE *)__p);
        *(_QWORD *)v81 = v84;
        *((_QWORD *)v81 + 1) = v84;
        v85 = &v84[4 * (v83 >> 2)];
        *((_QWORD *)v81 + 2) = v85;
        memcpy(v84, v82, v83);
        *((_QWORD *)v81 + 1) = v85;
      }
      v86 = v81 + 24;
    }
    v123 = v86;
    if (__p)
    {
      v117 = __p;
      operator delete(__p);
    }
    ++v47;
    v46 = *a2;
    if (0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3) > v47)
      continue;
    break;
  }
  v44 = v123;
  v28 = a1;
LABEL_102:
  *(_DWORD *)(v28 + 296) = 1065353216;
  v87 = (char *)v122;
  v88 = 0xAAAAAAAAAAAAAAABLL * ((v44 - (_BYTE *)v122) >> 3);
  if (v88 != 1)
  {
    v89 = 0;
    v90 = 1;
    v91 = 1.0;
    do
    {
      v92 = v89 + 1;
      if (v88 > v89 + 1)
      {
        v95 = (float **)&v87[24 * v89];
        v93 = *v95;
        v94 = v95[1];
        v96 = v94 - *v95;
        if (v96 <= 1)
          v96 = 1;
        if (v94 == v93)
        {
          v107 = v88;
          do
            --v107;
          while (v90 != v107);
          *(float *)(v28 + 296) = v91;
        }
        else
        {
          v97 = v90;
          do
          {
            v98 = *(float **)&v87[24 * v97];
            v99 = 0.0;
            v100 = v96;
            v101 = v93;
            v102 = 0.0;
            v103 = 0.0;
            do
            {
              v104 = *v101++;
              v105 = v104;
              v106 = *v98++;
              v103 = v103 + (float)(v105 * v106);
              v102 = v102 + (float)(v105 * v105);
              v99 = v99 + (float)(v106 * v106);
              --v100;
            }
            while (v100);
            v91 = fminf(v91, (float)((float)(v103 / (float)(sqrtf(v102) * sqrtf(v99))) + 1.0) * 0.5);
            *(float *)(v28 + 296) = v91;
            ++v97;
          }
          while (v97 != v88);
        }
      }
      ++v90;
      v89 = v92;
    }
    while (v92 != v88 - 1);
  }
  if (v119)
  {
    v120 = (uint64_t)v119;
    operator delete(v119);
    v87 = (char *)v122;
  }
  if (v87)
  {
    v108 = v123;
    v109 = v87;
    if (v123 != v87)
    {
      v110 = v123;
      do
      {
        v112 = (void *)*((_QWORD *)v110 - 3);
        v110 -= 24;
        v111 = v112;
        if (v112)
        {
          *((_QWORD *)v108 - 2) = v111;
          operator delete(v111);
        }
        v108 = v110;
      }
      while (v110 != v87);
      v109 = v122;
    }
    v123 = v87;
    operator delete(v109);
  }
  return 0;
}

void sub_213BD66F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, uint64_t a17, void *a18, uint64_t a19)
{
  if (!__p)
  {
    std::vector<std::vector<float>>::~vector[abi:ne180100](&a18);
    _Unwind_Resume(a1);
  }
  operator delete(__p);
  std::vector<std::vector<float>>::~vector[abi:ne180100](&a18);
  _Unwind_Resume(a1);
}

uint64_t vision::mod::LivenessCheckPredictor::runSpoofingClassification(vision::mod::LivenessCheckPredictor *this, const float *a2, float *a3, const float *a4, const float *a5, const float *a6)
{
  float v6;
  float v7;
  BOOL v8;
  int v10;

  v6 = *a3;
  v7 = *((float *)this + 16);
  v8 = *a2 < *((float *)this + 15) || v6 > v7;
  if (v8 || *a5 < *((float *)this + 19) || *a4 >= *((float *)this + 17) || *a6 < *((float *)this + 21))
  {
    if (v6 <= v7)
    {
      if (*a4 < *((float *)this + 17) || *a5 >= *((float *)this + 19))
      {
        if (*a6 >= *((float *)this + 21))
          v10 = 0;
        else
          v10 = 2;
        *((_DWORD *)this + 75) = v10;
        return 0;
      }
      else
      {
        *((_DWORD *)this + 75) = 2;
        return 0;
      }
    }
    else
    {
      *((_DWORD *)this + 75) = 2;
      return 0;
    }
  }
  else
  {
    *((_DWORD *)this + 75) = 1;
    return 0;
  }
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

_QWORD *std::vector<std::vector<float>>::vector(_QWORD *a1, unint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  const void *v9;
  int64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    if (a2 >= 0xAAAAAAAAAAAAAABLL)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v6 = operator new(24 * a2);
    v7 = v6;
    *a1 = v6;
    a1[1] = v6;
    v8 = &v6[3 * a2];
    a1[2] = v8;
    v9 = *(const void **)a3;
    v10 = *(_QWORD *)(a3 + 8) - *(_QWORD *)a3;
    if (v10)
    {
      if (v10 < 0)
      {
        *v6 = 0;
        v6[1] = 0;
        v6[2] = 0;
        std::vector<float>::__throw_length_error[abi:ne180100]();
      }
      v11 = 24 * a2;
      do
      {
        *v7 = 0;
        v7[1] = 0;
        v7[2] = 0;
        v12 = (char *)operator new(v10);
        *v7 = v12;
        v7[1] = v12;
        v13 = &v12[4 * (v10 >> 2)];
        v7[2] = v13;
        memcpy(v12, v9, v10);
        v7[1] = v13;
        v7 += 3;
        v11 -= 24;
      }
      while (v11);
    }
    else
    {
      bzero(v6, 24 * ((24 * a2 - 24) / 0x18) + 24);
    }
    a1[1] = v8;
  }
  return a1;
}

void sub_213BD6988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;
  void *v12;

  v12 = *(void **)v10;
  if (*(_QWORD *)v10)
  {
    *(_QWORD *)(v10 + 8) = v12;
    operator delete(v12);
  }
  *(_QWORD *)(v9 + 8) = v10;
  std::__exception_guard_exceptions<std::vector<std::vector<float>>::__destroy_vector>::~__exception_guard_exceptions[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

void sub_213BD69B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  std::__exception_guard_exceptions<std::vector<std::vector<float>>::__destroy_vector>::~__exception_guard_exceptions[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

void sub_213BD69C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 8) = v10;
  std::__exception_guard_exceptions<std::vector<std::vector<float>>::__destroy_vector>::~__exception_guard_exceptions[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

void ***std::__exception_guard_exceptions<std::vector<std::vector<float>>::__destroy_vector>::~__exception_guard_exceptions[abi:ne180100](void ***result)
{
  void ***v1;
  void **v2;
  char *v3;
  char *v4;
  void *v5;
  char *v6;
  void *v7;
  void *v8;

  v1 = result;
  if (!*((_BYTE *)result + 8))
  {
    v2 = *result;
    v3 = (char *)**result;
    if (v3)
    {
      v4 = (char *)v2[1];
      v5 = **result;
      if (v4 != v3)
      {
        v6 = (char *)v2[1];
        do
        {
          v8 = (void *)*((_QWORD *)v6 - 3);
          v6 -= 24;
          v7 = v8;
          if (v8)
          {
            *((_QWORD *)v4 - 2) = v7;
            operator delete(v7);
          }
          v4 = v6;
        }
        while (v6 != v3);
        v5 = **v1;
      }
      v2[1] = v3;
      operator delete(v5);
      return v1;
    }
  }
  return result;
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

  MEMORY[0x2199BEE38](v13, a1);
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
  MEMORY[0x2199BEE44](v13);
  return a1;
}

void sub_213BD6B7C(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x2199BEE44](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x213BD6B5CLL);
}

void sub_213BD6BC4(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
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
        std::string::__throw_length_error[abi:ne180100]();
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

void sub_213BD6D60(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

_QWORD *std::vector<std::vector<float>>::vector(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  unint64_t v7;
  _QWORD *v8;

  a1[2] = 0;
  v3 = (uint64_t)(a1 + 2);
  *a1 = 0;
  a1[1] = 0;
  v4 = *a2;
  v5 = a2[1];
  v6 = v5 - *a2;
  if (v5 != *a2)
  {
    v7 = 0xAAAAAAAAAAAAAAABLL * (v6 >> 3);
    if (v7 >= 0xAAAAAAAAAAAAAABLL)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v8 = operator new(v6);
    *a1 = v8;
    a1[1] = v8;
    a1[2] = &v8[3 * v7];
    a1[1] = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<float>>,std::vector<float>*,std::vector<float>*,std::vector<float>*>(v3, v4, v5, v8);
  }
  return a1;
}

void sub_213BD6E38(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  if (*(_QWORD *)v1)
    std::vector<std::vector<float>>::vector((void **)(v1 + 8), *(char **)v1, (void **)v1);
  _Unwind_Resume(exception_object);
}

_QWORD *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<float>>,std::vector<float>*,std::vector<float>*,std::vector<float>*>(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v6;
  char *v7;
  uint64_t v8;
  const void *v9;
  int64_t v10;
  char *v11;

  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      *a4 = 0;
      a4[1] = 0;
      a4[2] = 0;
      v9 = *(const void **)v6;
      v8 = *(_QWORD *)(v6 + 8);
      v10 = v8 - *(_QWORD *)v6;
      if (v8 != *(_QWORD *)v6)
      {
        if (v10 < 0)
          std::vector<float>::__throw_length_error[abi:ne180100]();
        v11 = (char *)operator new(v8 - *(_QWORD *)v6);
        *a4 = v11;
        a4[1] = v11;
        v7 = &v11[4 * (v10 >> 2)];
        a4[2] = v7;
        memcpy(v11, v9, v10);
        a4[1] = v7;
      }
      a4 += 3;
      v6 += 24;
    }
    while (v6 != a3);
  }
  return a4;
}

void sub_213BD6F2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::vector<float>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_213BD6F40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  void *v11;

  v11 = *(void **)v9;
  if (*(_QWORD *)v9)
  {
    *(_QWORD *)(v9 + 8) = v11;
    operator delete(v11);
  }
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::vector<float>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::vector<float>*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if (!*(_BYTE *)(a1 + 24))
  {
    v3 = **(_QWORD **)(a1 + 16);
    v4 = **(_QWORD **)(a1 + 8);
    if (v3 != v4)
    {
      v5 = **(_QWORD **)(a1 + 16);
      do
      {
        v7 = *(void **)(v5 - 24);
        v5 -= 24;
        v6 = v7;
        if (v7)
        {
          *(_QWORD *)(v3 - 16) = v6;
          operator delete(v6);
        }
        v3 = v5;
      }
      while (v5 != v4);
    }
  }
  return a1;
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24D0CECF0, MEMORY[0x24BEDAB00]);
}

void sub_213BD700C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8C0] + 16);
  return result;
}

char *std::vector<std::vector<float>>::__push_back_slow_path<std::vector<float> const&>(char **a1, uint64_t a2)
{
  char *v3;
  char *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char **v12;
  const void *v13;
  int64_t v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  __int128 v19;
  char *v20;
  char *v21;
  void *v22;
  void *v23;
  char *v25;

  v4 = *a1;
  v3 = a1[1];
  v5 = 0xAAAAAAAAAAAAAAABLL * ((v3 - *a1) >> 3);
  v6 = v5 + 1;
  if (v5 + 1 > 0xAAAAAAAAAAAAAAALL)
    std::vector<float>::__throw_length_error[abi:ne180100]();
  if (0x5555555555555556 * ((a1[2] - v4) >> 3) > v6)
    v6 = 0x5555555555555556 * ((a1[2] - v4) >> 3);
  if (0xAAAAAAAAAAAAAAABLL * ((a1[2] - v4) >> 3) >= 0x555555555555555)
    v8 = 0xAAAAAAAAAAAAAAALL;
  else
    v8 = v6;
  if (v8)
  {
    if (v8 > 0xAAAAAAAAAAAAAAALL)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v9 = (char *)operator new(24 * v8);
  }
  else
  {
    v9 = 0;
  }
  v10 = &v9[24 * v5];
  v11 = &v9[24 * v8];
  *((_QWORD *)v10 + 1) = 0;
  v12 = (char **)(v10 + 8);
  *((_QWORD *)v10 + 2) = 0;
  *(_QWORD *)v10 = 0;
  v13 = *(const void **)a2;
  v14 = *(_QWORD *)(a2 + 8) - *(_QWORD *)a2;
  if (v14)
  {
    if (v14 < 0)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v15 = (char *)operator new(v14);
    *(_QWORD *)v10 = v15;
    *v12 = v15;
    v16 = &v15[4 * (v14 >> 2)];
    *((_QWORD *)v10 + 2) = v16;
    memcpy(v15, v13, v14);
    *v12 = v16;
  }
  v17 = v10 + 24;
  v25 = v10 + 24;
  if (v3 == v4)
  {
    *a1 = v10;
    a1[1] = v17;
    a1[2] = v11;
  }
  else
  {
    do
    {
      v18 = v10;
      *((_QWORD *)v10 - 2) = 0;
      *((_QWORD *)v10 - 1) = 0;
      v19 = *(_OWORD *)(v3 - 24);
      v3 -= 24;
      *(_OWORD *)(v10 - 24) = v19;
      v10 -= 24;
      *((_QWORD *)v18 - 1) = *((_QWORD *)v3 + 2);
      *(_QWORD *)v3 = 0;
      *((_QWORD *)v3 + 1) = 0;
      *((_QWORD *)v3 + 2) = 0;
    }
    while (v3 != v4);
    v20 = *a1;
    v3 = a1[1];
    v17 = v25;
    *a1 = v10;
    a1[1] = v25;
    a1[2] = v11;
    if (v3 != v20)
    {
      v21 = v3;
      do
      {
        v23 = (void *)*((_QWORD *)v21 - 3);
        v21 -= 24;
        v22 = v23;
        if (v23)
        {
          *((_QWORD *)v3 - 2) = v22;
          operator delete(v22);
        }
        v3 = v21;
      }
      while (v21 != v20);
      v3 = v20;
    }
  }
  if (v3)
    operator delete(v3);
  return v17;
}

void sub_213BD722C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void **v2;
  _QWORD *v3;
  void *v5;
  va_list va;

  va_start(va, a2);
  v5 = *v2;
  if (*v2)
  {
    *v3 = v5;
    operator delete(v5);
  }
  std::__split_buffer<std::vector<float>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::__split_buffer<std::vector<float>>::~__split_buffer(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a1 + 8);
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != v3)
  {
    do
    {
      while (1)
      {
        v5 = v2 - 24;
        v4 = *(void **)(v2 - 24);
        *(_QWORD *)(a1 + 16) = v2 - 24;
        if (!v4)
          break;
        *(_QWORD *)(v2 - 16) = v4;
        operator delete(v4);
        v2 = *(_QWORD *)(a1 + 16);
        if (v2 == v3)
          goto LABEL_6;
      }
      v2 -= 24;
    }
    while (v5 != v3);
  }
LABEL_6:
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

id VNFaceLandmarkRegion2DGetNormalizedPoints(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  double *v6;
  void *v7;
  double v8;
  void *v9;

  v1 = a1;
  v2 = objc_msgSend(v1, "pointCount");
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  v4 = objc_retainAutorelease(v1);
  v5 = objc_msgSend(v4, "normalizedPoints");
  if (v2)
  {
    v6 = (double *)(v5 + 8);
    do
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(v6 - 1));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v7);

      v8 = *v6;
      v6 += 2;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v9);

      --v2;
    }
    while (v2);
  }

  return v3;
}

uint64_t VNFaceObservationWithAVFoundationFaceBounds(double a1, double a2, double a3, double a4)
{
  return objc_msgSend(MEMORY[0x24BDF9BB8], "faceObservationWithRequestRevision:boundingBox:roll:yaw:pitch:", __VNFaceObservationWithAVFoundationFaceBounds_block_invoke(), 0, 0, 0, a1, a2, a3, a4);
}

_PADAuditDataRepository *PADAuditDataRepositoryDefault()
{
  id WeakRetained;
  _PADAuditDataRepository *v2;

  if (!__PADAuditDataRepositoryDefault_block_invoke())
    return (_PADAuditDataRepository *)0;
  WeakRetained = objc_loadWeakRetained(&PADAuditDataRepositoryDefault__sharedInstance);

  if (WeakRetained)
    return (_PADAuditDataRepository *)objc_loadWeakRetained(&PADAuditDataRepositoryDefault__sharedInstance);
  v2 = objc_alloc_init(_PADAuditDataRepository);
  objc_storeWeak(&PADAuditDataRepositoryDefault__sharedInstance, v2);
  return v2;
}

id DataFromCGImage(uint64_t a1)
{
  void *v1;
  void *v2;
  CGColorSpace *DeviceRGB;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBF660], "imageWithCGImage:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBF648], "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  objc_msgSend(v2, "JPEGRepresentationOfImage:colorSpace:options:", v1, DeviceRGB, MEMORY[0x24BDBD1B8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CGColorSpaceRelease(DeviceRGB);

  return v4;
}

const __CFString *PADLivenessGestureToString(unint64_t a1)
{
  if (a1 > 0xA)
    return CFSTR("Unknown");
  else
    return off_24D0CF398[a1];
}

id PADVNFaceprintInit(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  int *v6;
  void *v7;
  double v8;
  int v9;
  void *v10;
  NSObject *v11;

  v1 = a1;
  objc_msgSend(v1, "faceprint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "elementCount");

  if (v3)
  {
    objc_msgSend(v1, "faceprint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "descriptorData");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = (int *)objc_msgSend(v5, "bytes");

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    do
    {
      v9 = *v6++;
      LODWORD(v8) = v9;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v10);

      --v3;
    }
    while (v3);
  }
  else
  {
    v11 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      PADVNFaceprintInit_cold_1(v11);

    v7 = 0;
  }

  return v7;
}

id VNCreateFaceprintRequestInit(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  id v8;

  v1 = (objc_class *)MEMORY[0x24BDF9B38];
  v2 = a1;
  v3 = (void *)objc_msgSend([v1 alloc], "initWithCompletionHandler:", v2);

  v8 = 0;
  v4 = objc_msgSend(v3, "setRevision:error:", 3737841667, &v8);
  v5 = v8;
  if ((v4 & 1) == 0)
  {
    v6 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      VNCreateFaceprintRequestInit_cold_1((uint64_t)v5, v6);

  }
  return v3;
}

_PADVNFaceprintDetector *PADVNFaceprintDetectorInit()
{
  return objc_alloc_init(_PADVNFaceprintDetector);
}

double CGRectUnit()
{
  return 0.0;
}

double CGRectGetArea(double a1, double a2, double a3, double a4)
{
  return a3 * a4;
}

uint64_t CGrectGetDescription(double a1, double a2, double a3, double a4)
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{ x:%.3f, y:%.3f, w:%.3f, h:%.3f }"), *(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

double CGRectUnnormalized(unint64_t a1, double a2)
{
  return a2 * (double)a1;
}

void CGRectRotate(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  CGFloat MidX;
  CGFloat MidY;
  CGFloat v12;
  CGFloat v13;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  memset(&v17, 0, sizeof(v17));
  MidX = CGRectGetMidX(*(CGRect *)&a1);
  v18.origin.x = a1;
  v18.origin.y = a2;
  v18.size.width = a3;
  v18.size.height = a4;
  MidY = CGRectGetMidY(v18);
  CGAffineTransformMakeTranslation(&v17, MidX, MidY);
  v15 = v17;
  memset(&v16, 0, sizeof(v16));
  CGAffineTransformRotate(&v16, &v15, a5);
  memset(&v15, 0, sizeof(v15));
  v19.origin.x = a1;
  v19.origin.y = a2;
  v19.size.width = a3;
  v19.size.height = a4;
  v12 = -CGRectGetMidX(v19);
  v20.origin.x = a1;
  v20.origin.y = a2;
  v20.size.width = a3;
  v20.size.height = a4;
  v13 = CGRectGetMidY(v20);
  v14 = v16;
  CGAffineTransformTranslate(&v15, &v14, v12, -v13);
  v14 = v15;
  v21.origin.x = a1;
  v21.origin.y = a2;
  v21.size.width = a3;
  v21.size.height = a4;
  CGRectApplyAffineTransform(v21, &v14);
}

void CGRectTranslate(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  CGAffineTransform v10;
  CGRect v11;

  CGAffineTransformMakeTranslation(&v10, a5, a6);
  v11.origin.x = a1;
  v11.origin.y = a2;
  v11.size.width = a3;
  v11.size.height = a4;
  CGRectApplyAffineTransform(v11, &v10);
}

double CGRectCenterScaleUp(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  CGFloat v10;
  CGFloat v11;
  double result;
  CGRect v13;
  CGRect v14;

  v10 = -(a5 * CGRectGetWidth(*(CGRect *)&a1)) * 0.5;
  v13.origin.x = a1;
  v13.origin.y = a2;
  v13.size.width = a3;
  v13.size.height = a4;
  v11 = -(a5 * CGRectGetHeight(v13)) * 0.5;
  v14.origin.x = a1;
  v14.origin.y = a2;
  v14.size.width = a3;
  v14.size.height = a4;
  *(_QWORD *)&result = (unint64_t)CGRectInset(v14, v10, v11);
  return result;
}

void CGRectAV2VN(double a1, double a2, double a3, double a4)
{
  CGRectGetMinY(*(CGRect *)&a1);
}

double CGRectVN2AV(double a1, double a2, double a3, double a4)
{
  return 1.0 - a2 - a4;
}

uint64_t PADClassifierFrameOptionsAllEnabled()
{
  return 65793;
}

uint64_t PADClassifierFrameOptionsInit(int a1, int a2, int a3)
{
  int v3;
  int v4;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  if (a2)
    v4 = 256;
  else
    v4 = 0;
  return v4 | a1 | v3;
}

_PADClassifier *PADClassifierInit()
{
  return objc_alloc_init(_PADClassifier);
}

void sub_213BDAAF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a32);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void type metadata accessor for CGImagePropertyOrientation(uint64_t a1)
{
  sub_213BDBAF8(a1, &qword_254D279D8);
}

uint64_t initializeBufferWithCopyOfBuffer for PADPrintReplayAssessment(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for PADPrintReplayAssessment(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for PADPrintReplayAssessment(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
  sub_213BDBAF8(a1, &qword_254D279E0);
}

void type metadata accessor for CVBuffer(uint64_t a1)
{
  sub_213BDBAF8(a1, &qword_254D279E8);
}

__n128 __swift_memcpy24_4(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t sub_213BDB218(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_213BDB238(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 24) = v3;
  return result;
}

void type metadata accessor for CMTime(uint64_t a1)
{
  sub_213BDBAF8(a1, &qword_254D279F0);
}

uint64_t sub_213BDB278()
{
  uint64_t v0;

  v0 = sub_213C12588();
  __swift_allocate_value_buffer(v0, qword_254D27938);
  __swift_project_value_buffer(v0, (uint64_t)qword_254D27938);
  return sub_213C1257C();
}

uint64_t sub_213BDB2E8(uint64_t a1, unint64_t a2)
{
  return sub_213BDB2F8(a1, a2, 1);
}

uint64_t sub_213BDB2F0(uint64_t a1, unint64_t a2)
{
  return sub_213BDB2F8(a1, a2, 3);
}

uint64_t sub_213BDB2F8(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t result;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v6 = sub_213C12588();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = sub_213BF2898(a3);
  if ((result & 1) != 0)
  {
    if (qword_254D27930 != -1)
      swift_once();
    v11 = __swift_project_value_buffer(v6, (uint64_t)qword_254D27938);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v11, v6);
    swift_bridgeObjectRetain_n();
    v12 = sub_213C12570();
    v13 = sub_213C12750();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = swift_slowAlloc();
      v18 = a1;
      v15 = (uint8_t *)v14;
      v16 = swift_slowAlloc();
      v20 = v16;
      *(_DWORD *)v15 = 136315138;
      swift_bridgeObjectRetain();
      v19 = sub_213BEB0C8(v18, a2, &v20);
      sub_213C127F8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_213BCD000, v12, v13, "%s", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199BF4BC](v16, -1, -1);
      MEMORY[0x2199BF4BC](v15, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  return result;
}

uint64_t sub_213BDB504(uint64_t a1, uint64_t a2)
{
  return sub_213BDB660(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_213BDB524(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_213C125F4();
  *a2 = 0;
  return result;
}

uint64_t sub_213BDB598(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_213C12600();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_213BDB614@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_213C1260C();
  v2 = sub_213C125E8();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_213BDB654(uint64_t a1, uint64_t a2)
{
  return sub_213BDB660(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_213BDB660(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_213C1260C();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_213BDB69C()
{
  sub_213C1260C();
  sub_213C1263C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_213BDB6DC()
{
  uint64_t v0;

  sub_213C1260C();
  sub_213C12A50();
  sub_213C1263C();
  v0 = sub_213C12A68();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_213BDB750()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_213C1260C();
  v2 = v1;
  if (v0 == sub_213C1260C() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_213C12A14();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_213BDB7DC()
{
  sub_213BDBB94((unint64_t *)&qword_254D27A70, (uint64_t (*)(uint64_t))type metadata accessor for CIImageRepresentationOption, (uint64_t)&unk_213C14714);
  sub_213BDBB94(&qword_254D27A78, (uint64_t (*)(uint64_t))type metadata accessor for CIImageRepresentationOption, (uint64_t)&unk_213C14668);
  return sub_213C12954();
}

uint64_t sub_213BDB860()
{
  sub_213BDBB94((unint64_t *)&qword_254D27A80, (uint64_t (*)(uint64_t))type metadata accessor for MLModelMetadataKey, (uint64_t)&unk_213C14758);
  sub_213BDBB94(&qword_254D27A88, (uint64_t (*)(uint64_t))type metadata accessor for MLModelMetadataKey, (uint64_t)&unk_213C14548);
  return sub_213C12954();
}

uint64_t sub_213BDB8E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_213C125E8();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_213BDB928@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_213C1260C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_213BDB950()
{
  sub_213BDBB94(&qword_254D27A90, (uint64_t (*)(uint64_t))type metadata accessor for VNImageOption, (uint64_t)&unk_213C1479C);
  sub_213BDBB94(&qword_254D27A98, (uint64_t (*)(uint64_t))type metadata accessor for VNImageOption, (uint64_t)&unk_213C1442C);
  return sub_213C12954();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void type metadata accessor for CIImageRepresentationOption(uint64_t a1)
{
  sub_213BDBAF8(a1, &qword_254D279F8);
}

void type metadata accessor for MLModelMetadataKey(uint64_t a1)
{
  sub_213BDBAF8(a1, &qword_254D27A00);
}

void type metadata accessor for VNImageOption(uint64_t a1)
{
  sub_213BDBAF8(a1, &qword_254D27A08);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_213BDBA74(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_213BDBA94(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_213BDBAF8(a1, &qword_254D27A10);
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_213BDBAF8(a1, &qword_254D27A18);
}

void type metadata accessor for CMTimeFlags(uint64_t a1)
{
  sub_213BDBAF8(a1, &qword_254D27A20);
}

void sub_213BDBAF8(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_213BDBB3C()
{
  return sub_213BDBB94(&qword_254D27A28, (uint64_t (*)(uint64_t))type metadata accessor for VNImageOption, (uint64_t)&unk_213C143F0);
}

uint64_t sub_213BDBB68()
{
  return sub_213BDBB94(&qword_254D27A30, (uint64_t (*)(uint64_t))type metadata accessor for VNImageOption, (uint64_t)&unk_213C143C4);
}

uint64_t sub_213BDBB94(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2199BF420](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_213BDBBD4()
{
  return sub_213BDBB94(&qword_254D27A38, (uint64_t (*)(uint64_t))type metadata accessor for MLModelMetadataKey, (uint64_t)&unk_213C1450C);
}

uint64_t sub_213BDBC00()
{
  return sub_213BDBB94(&qword_254D27A40, (uint64_t (*)(uint64_t))type metadata accessor for MLModelMetadataKey, (uint64_t)&unk_213C144E0);
}

uint64_t sub_213BDBC2C()
{
  return sub_213BDBB94(&qword_254D27A48, (uint64_t (*)(uint64_t))type metadata accessor for CIImageRepresentationOption, (uint64_t)&unk_213C1462C);
}

uint64_t sub_213BDBC58()
{
  return sub_213BDBB94(&qword_254D27A50, (uint64_t (*)(uint64_t))type metadata accessor for CIImageRepresentationOption, (uint64_t)&unk_213C14600);
}

uint64_t sub_213BDBC84()
{
  return sub_213BDBB94(&qword_254D27A58, (uint64_t (*)(uint64_t))type metadata accessor for CIImageRepresentationOption, (uint64_t)&unk_213C1469C);
}

uint64_t sub_213BDBCB0()
{
  return sub_213BDBB94(&qword_254D27A60, (uint64_t (*)(uint64_t))type metadata accessor for MLModelMetadataKey, (uint64_t)&unk_213C1457C);
}

uint64_t sub_213BDBCDC()
{
  return sub_213BDBB94(&qword_254D27A68, (uint64_t (*)(uint64_t))type metadata accessor for VNImageOption, (uint64_t)&unk_213C14460);
}

char *sub_213BDBD18()
{
  uint64_t v0;
  uint64_t v1;
  double *v2;
  char *v3;
  double v4;
  double v5;
  unint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  float v10;
  int64_t v11;
  float v12;

  v0 = sub_213C127BC();
  v1 = *(_QWORD *)(v0 + 16);
  if (v1)
  {
    v2 = (double *)(v0 + 40);
    v3 = (char *)MEMORY[0x24BEE4AF8];
    do
    {
      v5 = *(v2 - 1);
      v4 = *v2;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v3 = sub_213BEA264(0, *((_QWORD *)v3 + 2) + 1, 1, v3);
      v7 = *((_QWORD *)v3 + 2);
      v6 = *((_QWORD *)v3 + 3);
      v8 = v6 >> 1;
      v9 = v7 + 1;
      if (v6 >> 1 <= v7)
      {
        v3 = sub_213BEA264((char *)(v6 > 1), v7 + 1, 1, v3);
        v6 = *((_QWORD *)v3 + 3);
        v8 = v6 >> 1;
      }
      v10 = v5;
      *((_QWORD *)v3 + 2) = v9;
      *(float *)&v3[4 * v7 + 32] = v10;
      v11 = v7 + 2;
      if (v8 < v11)
        v3 = sub_213BEA264((char *)(v6 > 1), v11, 1, v3);
      v12 = v4;
      *((_QWORD *)v3 + 2) = v11;
      *(float *)&v3[4 * v9 + 32] = v12;
      v2 += 2;
      --v1;
    }
    while (v1);
  }
  else
  {
    v3 = (char *)MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRelease();
  return v3;
}

id sub_213BDBE40(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint8_t *v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  _QWORD v23[2];
  uint64_t v24;
  uint64_t v25;
  id aBlock[7];

  aBlock[6] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = sub_213C12588();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    aBlock[4] = a1;
    aBlock[5] = a2;
    aBlock[0] = (id)MEMORY[0x24BDAC760];
    aBlock[1] = (id)1107296256;
    aBlock[2] = sub_213BFD2A8;
    aBlock[3] = &block_descriptor;
    a1 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDF9B68]), sel_initWithCompletionHandler_, a1);
  _Block_release(a1);
  aBlock[0] = 0;
  if (objc_msgSend(v8, sel_setRevision_error_, 2, aBlock))
  {
    v9 = aBlock[0];
  }
  else
  {
    v10 = aBlock[0];
    v11 = (void *)sub_213C1248C();

    swift_willThrow();
    if (qword_254D27930 != -1)
      swift_once();
    v12 = __swift_project_value_buffer(v4, (uint64_t)qword_254D27938);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v12, v4);
    v13 = v11;
    v14 = v11;
    v15 = sub_213C12570();
    v16 = sub_213C1275C();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = swift_slowAlloc();
      v24 = v5;
      v18 = (uint8_t *)v17;
      v19 = (void *)swift_slowAlloc();
      aBlock[0] = v19;
      *(_DWORD *)v18 = 136315138;
      v23[1] = v18 + 4;
      swift_getErrorValue();
      v20 = sub_213C12A44();
      v25 = sub_213BEB0C8(v20, v21, (uint64_t *)aBlock);
      sub_213C127F8();
      swift_bridgeObjectRelease();

      swift_arrayDestroy();
      MEMORY[0x2199BF4BC](v19, -1, -1);
      MEMORY[0x2199BF4BC](v18, -1, -1);

      (*(void (**)(char *, uint64_t))(v24 + 8))(v7, v4);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
  }
  return v8;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t PADSWClassifierResult.livenessLabel.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t PADSWClassifierResult.gestureSequence.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PADSWClassifierResult.assessmentsFAC.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PADSWClassifierResult.assessmentsPRD.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PADSWClassifierResult.assessmentsTA.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PADSWClassifierResult.timestampsFAC.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PADSWClassifierResult.timestampsID.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PADSWClassifierResult.timestampsButtonPressed.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PADSWClassifierResult.faceprintsID.getter()
{
  return swift_bridgeObjectRetain();
}

float PADSWClassifierResult.assessmentFAC.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 72);
}

uint64_t PADSWClassifierResult.assessmentTA.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 80);
}

float PADSWClassifierResult.assessmentFakePRD.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 88);
}

float PADSWClassifierResult.assessmentLivePRD.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 92);
}

float PADSWClassifierResult.assessmentID.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 96);
}

float PADSWClassifierResult.maxNccLow.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 100);
}

float PADSWClassifierResult.maxNccHigh.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 104);
}

uint64_t PADSWClassifierResult.ignoredStitches.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 112);
}

uint64_t PADSWClassifierResult.deviceInfo.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 120);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PADSWClassifierResult.ageLabel.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 136);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PADSWClassifierResult.sexLabel.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 152);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PADSWClassifierResult.skintoneLabel.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 168);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PADSWClassifierResult.ethnicityLabel.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 184);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PADSWClassifierResult.faceHairLabel.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 200);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PADSWClassifierResult.headgearLabel.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 216);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PADSWClassifierResult.glassesLabel.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 232);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PADSWClassifierResult.init(livenessLabel:gestureSequence:assessmentsFAC:assessmentsPRD:assessmentsTA:timestampsFAC:timestampsID:timestampsButtonPressed:faceprintsID:assessmentFAC:assessmentTA:assessmentFakePRD:assessmentLivePRD:assessmentID:maxNccLow:maxNccHigh:ignoredStitches:deviceInfo:ageLabel:sexLabel:skintoneLabel:ethnicityLabel:faceHairLabel:headgearLabel:glassesLabel:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, float a10@<S0>, float a11@<S1>, float a12@<S2>, float a13@<S3>, float a14@<S4>, float a15@<S5>, uint64_t a16, uint64_t a17, __int128 a18, __int128 a19, __int128 a20,__int128 a21,__int128 a22,__int128 a23,__int128 a24,__int128 a25,uint64_t a26)
{
  *(_QWORD *)a9 = result;
  *(_QWORD *)(a9 + 8) = a2;
  *(_QWORD *)(a9 + 16) = a3;
  *(_QWORD *)(a9 + 24) = a4;
  *(_QWORD *)(a9 + 32) = a5;
  *(_QWORD *)(a9 + 40) = a6;
  *(_QWORD *)(a9 + 48) = a7;
  *(_QWORD *)(a9 + 56) = a8;
  *(_QWORD *)(a9 + 64) = a16;
  *(float *)(a9 + 72) = a10;
  *(_QWORD *)(a9 + 80) = a17;
  *(float *)(a9 + 88) = a11;
  *(float *)(a9 + 92) = a12;
  *(float *)(a9 + 96) = a13;
  *(float *)(a9 + 100) = a14;
  *(float *)(a9 + 104) = a15;
  *(_OWORD *)(a9 + 112) = a18;
  *(_OWORD *)(a9 + 128) = a19;
  *(_OWORD *)(a9 + 144) = a20;
  *(_OWORD *)(a9 + 160) = a21;
  *(_OWORD *)(a9 + 176) = a22;
  *(_OWORD *)(a9 + 192) = a23;
  *(_OWORD *)(a9 + 208) = a24;
  *(_OWORD *)(a9 + 224) = a25;
  *(_QWORD *)(a9 + 240) = a26;
  return result;
}

uint64_t sub_213BDC3DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t *v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  float v37;
  float v38;
  uint64_t v39;
  id v40;
  void *v41;
  void *v42;
  int v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t result;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int *v58;
  uint64_t v59;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD v76[2];

  v9 = a3;
  v10 = *((_QWORD *)a3 + 1);
  swift_beginAccess();
  v69 = v10;
  v11 = *(_QWORD *)(a6 + 128);
  v12 = *(_QWORD *)(a5 + 192);
  v13 = *((_QWORD *)v9 + 2);
  v76[0] = v13;
  v14 = *(_QWORD *)(v13 + 16);
  v62 = v12;
  v63 = v11;
  if (v14)
  {
    v58 = v9;
    v15 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_213BE3FB0((uint64_t)v76);
    sub_213C0D498(0, v14, 0);
    v16 = 0;
    v70 = v13 + 32;
    do
    {
      v17 = *(_QWORD *)(v70 + 8 * v16);
      v18 = *(_QWORD *)(v17 + 16);
      if (v18)
      {
        v73 = MEMORY[0x24BEE4AF8];
        swift_bridgeObjectRetain();
        sub_213C0D474(0, v18, 0);
        v19 = v73;
        v20 = *(_QWORD *)(v73 + 16);
        v21 = 32;
        do
        {
          v22 = *(_QWORD *)(v17 + v21);
          v23 = *(_QWORD *)(v73 + 24);
          if (v20 >= v23 >> 1)
            sub_213C0D474(v23 > 1, v20 + 1, 1);
          *(_QWORD *)(v73 + 16) = v20 + 1;
          *(_QWORD *)(v73 + 8 * v20 + 32) = v22;
          v21 += 24;
          ++v20;
          --v18;
        }
        while (v18);
        swift_bridgeObjectRelease();
      }
      else
      {
        v19 = MEMORY[0x24BEE4AF8];
      }
      v25 = *(_QWORD *)(v15 + 16);
      v24 = *(_QWORD *)(v15 + 24);
      if (v25 >= v24 >> 1)
        sub_213C0D498(v24 > 1, v25 + 1, 1);
      ++v16;
      *(_QWORD *)(v15 + 16) = v25 + 1;
      *(_QWORD *)(v15 + 8 * v25 + 32) = v19;
    }
    while (v16 != v14);
    sub_213BE3EC4((uint64_t)v76);
    v9 = v58;
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v15 = MEMORY[0x24BEE4AF8];
  }
  v26 = *((_QWORD *)v9 + 4);
  v75 = v26;
  v27 = *(_QWORD *)(v26 + 16);
  v28 = MEMORY[0x24BEE4AF8];
  if (v27)
  {
    v74 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_213C0D474(0, v27, 0);
    v28 = v74;
    v29 = (uint64_t *)(v26 + 32);
    v30 = *(_QWORD *)(v74 + 16);
    do
    {
      v32 = *v29;
      v29 += 3;
      v31 = v32;
      v33 = *(_QWORD *)(v74 + 24);
      if (v30 >= v33 >> 1)
        sub_213C0D474(v33 > 1, v30 + 1, 1);
      *(_QWORD *)(v74 + 16) = v30 + 1;
      *(_QWORD *)(v74 + 8 * v30++ + 32) = v31;
      --v27;
    }
    while (v27);
    sub_213BE3EC4((uint64_t)&v75);
  }
  v34 = *((_QWORD *)v9 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_213BE3EC4((uint64_t)v76);
  swift_bridgeObjectRelease();
  sub_213BE3EC4((uint64_t)&v75);
  swift_beginAccess();
  v35 = *(_QWORD *)(a5 + 160);
  v36 = *(id *)(a5 + 168);
  sub_213C127A4();
  sub_213C127B0();

  v37 = sub_213C04818();
  v38 = sub_213C049AC();
  v39 = *(_QWORD *)(a5 + 176);
  swift_beginAccess();
  v68 = *(_QWORD *)(a5 + 144);
  v40 = *(id *)(a5 + 152);
  sub_213C127A4();
  sub_213C127B0();

  v41 = (void *)sub_213C125E8();
  v42 = (void *)MGGetStringAnswer();

  v71 = v35;
  v72 = v34;
  if (v42)
  {
    sub_213C12600();

  }
  swift_release();
  swift_release();
  v43 = *v9;
  v44 = *(_DWORD *)a4;
  v45 = *(_QWORD *)(a4 + 16);
  v46 = *(_QWORD *)(a4 + 32);
  v59 = *(_QWORD *)(a4 + 24);
  v61 = *(_QWORD *)(a4 + 8);
  v47 = *(_QWORD *)(a4 + 48);
  v48 = *(_QWORD *)(a4 + 64);
  v56 = *(_QWORD *)(a4 + 56);
  v57 = *(_QWORD *)(a4 + 40);
  v49 = *(_QWORD *)(a4 + 80);
  v50 = *(_QWORD *)(a4 + 96);
  v54 = *(_QWORD *)(a4 + 88);
  v55 = *(_QWORD *)(a4 + 72);
  v51 = *(_QWORD *)(a4 + 112);
  v53 = *(_QWORD *)(a4 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  result = sub_213BE3EEC(a4);
  *(_QWORD *)a7 = a1;
  *(_QWORD *)(a7 + 8) = a2;
  *(_QWORD *)(a7 + 16) = v69;
  *(_QWORD *)(a7 + 24) = v63;
  *(_QWORD *)(a7 + 32) = v62;
  *(_QWORD *)(a7 + 40) = v15;
  *(_QWORD *)(a7 + 48) = v28;
  *(_QWORD *)(a7 + 56) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(a7 + 64) = v72;
  *(_DWORD *)(a7 + 72) = v43;
  *(_QWORD *)(a7 + 80) = v71;
  *(float *)(a7 + 88) = v37;
  *(float *)(a7 + 92) = v38;
  *(_DWORD *)(a7 + 96) = v44;
  *(_QWORD *)(a7 + 100) = v39;
  *(_QWORD *)(a7 + 112) = v68;
  *(_QWORD *)(a7 + 120) = 0;
  *(_QWORD *)(a7 + 128) = 0;
  *(_QWORD *)(a7 + 136) = v61;
  *(_QWORD *)(a7 + 144) = v45;
  *(_QWORD *)(a7 + 152) = v59;
  *(_QWORD *)(a7 + 160) = v46;
  *(_QWORD *)(a7 + 168) = v57;
  *(_QWORD *)(a7 + 176) = v47;
  *(_QWORD *)(a7 + 184) = v56;
  *(_QWORD *)(a7 + 192) = v48;
  *(_QWORD *)(a7 + 200) = v55;
  *(_QWORD *)(a7 + 208) = v49;
  *(_QWORD *)(a7 + 216) = v54;
  *(_QWORD *)(a7 + 224) = v50;
  *(_QWORD *)(a7 + 232) = v53;
  *(_QWORD *)(a7 + 240) = v51;
  return result;
}

double sub_213BDC93C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  int64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  int *v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v31;
  uint64_t *v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  id v38;
  float v39;
  float v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  int v47;
  double result;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD v63[2];

  v10 = *((_QWORD *)a3 + 1);
  swift_beginAccess();
  v56 = a4;
  v11 = *(_QWORD *)(a5 + 128);
  v12 = *(_QWORD *)(a4 + 192);
  v54 = a3;
  v55 = v10;
  v13 = *((_QWORD *)a3 + 2);
  v63[0] = v13;
  v14 = *(_QWORD *)(v13 + 16);
  v50 = v12;
  v51 = v11;
  if (v14)
  {
    v49 = a6;
    v15 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_213BE3FB0((uint64_t)v63);
    sub_213C0D498(0, v14, 0);
    v16 = 0;
    v17 = v15;
    v57 = v13 + 32;
    do
    {
      v18 = *(_QWORD *)(v57 + 8 * v16);
      v19 = *(_QWORD *)(v18 + 16);
      if (v19)
      {
        v58 = v17;
        v20 = v14;
        v60 = MEMORY[0x24BEE4AF8];
        swift_bridgeObjectRetain();
        sub_213C0D474(0, v19, 0);
        v21 = v60;
        v22 = *(_QWORD *)(v60 + 16);
        v23 = 32;
        do
        {
          v24 = *(_QWORD *)(v18 + v23);
          v25 = *(_QWORD *)(v60 + 24);
          if (v22 >= v25 >> 1)
            sub_213C0D474(v25 > 1, v22 + 1, 1);
          *(_QWORD *)(v60 + 16) = v22 + 1;
          *(_QWORD *)(v60 + 8 * v22 + 32) = v24;
          v23 += 24;
          ++v22;
          --v19;
        }
        while (v19);
        swift_bridgeObjectRelease();
        a4 = v56;
        v14 = v20;
        v17 = v58;
      }
      else
      {
        v21 = MEMORY[0x24BEE4AF8];
      }
      v27 = *(_QWORD *)(v17 + 16);
      v26 = *(_QWORD *)(v17 + 24);
      if (v27 >= v26 >> 1)
        sub_213C0D498(v26 > 1, v27 + 1, 1);
      ++v16;
      *(_QWORD *)(v17 + 16) = v27 + 1;
      *(_QWORD *)(v17 + 8 * v27 + 32) = v21;
    }
    while (v16 != v14);
    sub_213BE3EC4((uint64_t)v63);
    a6 = v49;
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v17 = MEMORY[0x24BEE4AF8];
  }
  v28 = v54;
  v29 = *((_QWORD *)v54 + 4);
  v62 = v29;
  v30 = *(_QWORD *)(v29 + 16);
  v31 = MEMORY[0x24BEE4AF8];
  if (v30)
  {
    v61 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_213C0D474(0, v30, 0);
    v31 = v61;
    v32 = (uint64_t *)(v29 + 32);
    v33 = *(_QWORD *)(v61 + 16);
    do
    {
      v35 = *v32;
      v32 += 3;
      v34 = v35;
      v36 = *(_QWORD *)(v61 + 24);
      if (v33 >= v36 >> 1)
        sub_213C0D474(v36 > 1, v33 + 1, 1);
      *(_QWORD *)(v61 + 16) = v33 + 1;
      *(_QWORD *)(v61 + 8 * v33++ + 32) = v34;
      --v30;
    }
    while (v30);
    sub_213BE3EC4((uint64_t)&v62);
    v28 = v54;
  }
  v37 = *((_QWORD *)v28 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_213BE3EC4((uint64_t)v63);
  swift_bridgeObjectRelease();
  sub_213BE3EC4((uint64_t)&v62);
  swift_beginAccess();
  v59 = *(_QWORD *)(a4 + 160);
  v38 = *(id *)(a4 + 168);
  sub_213C127A4();
  sub_213C127B0();

  v39 = sub_213C04818();
  v40 = sub_213C049AC();
  v41 = *(_QWORD *)(a4 + 176);
  swift_beginAccess();
  v42 = *(_QWORD *)(a4 + 144);
  v43 = *(id *)(a4 + 152);
  sub_213C127A4();
  sub_213C127B0();

  v44 = (void *)sub_213C125E8();
  v45 = (void *)MGGetStringAnswer();

  sub_213C12600();
  swift_release();
  swift_release();
  v46 = MEMORY[0x24BEE4AF8];
  v47 = *v28;
  *(_QWORD *)a6 = a1;
  *(_QWORD *)(a6 + 8) = a2;
  *(_QWORD *)(a6 + 16) = v55;
  *(_QWORD *)(a6 + 24) = v51;
  *(_QWORD *)(a6 + 32) = v50;
  *(_QWORD *)(a6 + 40) = v17;
  *(_QWORD *)(a6 + 48) = v31;
  *(_QWORD *)(a6 + 56) = v46;
  *(_QWORD *)(a6 + 64) = v37;
  *(_DWORD *)(a6 + 72) = v47;
  *(_QWORD *)(a6 + 80) = v59;
  *(float *)(a6 + 88) = v39;
  *(float *)(a6 + 92) = v40;
  *(_DWORD *)(a6 + 96) = -1082130432;
  *(_QWORD *)(a6 + 100) = v41;
  *(_QWORD *)(a6 + 112) = v42;
  *(_QWORD *)(a6 + 120) = 0;
  *(_QWORD *)(a6 + 128) = 0;
  result = 0.0;
  *(_OWORD *)(a6 + 232) = 0u;
  *(_OWORD *)(a6 + 216) = 0u;
  *(_OWORD *)(a6 + 200) = 0u;
  *(_OWORD *)(a6 + 184) = 0u;
  *(_OWORD *)(a6 + 168) = 0u;
  *(_OWORD *)(a6 + 152) = 0u;
  *(_OWORD *)(a6 + 136) = 0u;
  return result;
}

uint64_t sub_213BDCDFC(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_213BDCE38 + 4 * byte_213C14830[a1]))(0xD000000000000017, 0x8000000213C175E0);
}

uint64_t sub_213BDCE38()
{
  return 0x7373656E6576696CLL;
}

uint64_t sub_213BDD0A8()
{
  return 0x4C73657373616C67;
}

BOOL sub_213BDD0C8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_213BDD0DC()
{
  sub_213C12A50();
  sub_213C12A5C();
  return sub_213C12A68();
}

uint64_t sub_213BDD120()
{
  return sub_213C12A5C();
}

uint64_t sub_213BDD148()
{
  sub_213C12A50();
  sub_213C12A5C();
  return sub_213C12A68();
}

uint64_t sub_213BDD188()
{
  unsigned __int8 *v0;

  return sub_213BDCDFC(*v0);
}

uint64_t sub_213BDD190@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_213BE217C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_213BDD1B4()
{
  return 0;
}

void sub_213BDD1C0(_BYTE *a1@<X8>)
{
  *a1 = 25;
}

uint64_t sub_213BDD1CC()
{
  sub_213BDDA90();
  return sub_213C12A8C();
}

uint64_t sub_213BDD1F4()
{
  sub_213BDDA90();
  return sub_213C12A98();
}

uint64_t PADSWClassifierResult.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v21[17];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D27B08);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v7 = v1[1];
  v28 = v1[2];
  v29 = v7;
  v9 = v1[3];
  v26 = v1[4];
  v27 = v9;
  v10 = v1[5];
  v24 = v1[6];
  v25 = v10;
  v11 = v1[7];
  v22 = v1[8];
  v23 = v11;
  v12 = v1[10];
  v21[15] = v1[14];
  v21[16] = v12;
  v13 = v1[15];
  v21[13] = v1[16];
  v21[14] = v13;
  v21[1] = v1[17];
  v21[0] = v1[18];
  v21[3] = v1[19];
  v21[2] = v1[20];
  v21[5] = v1[21];
  v21[4] = v1[22];
  v21[7] = v1[23];
  v21[6] = v1[24];
  v21[9] = v1[25];
  v21[8] = v1[26];
  v21[11] = v1[27];
  v21[10] = v1[28];
  v14 = v1[30];
  v21[12] = v1[29];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_213BDDA90();
  sub_213C12A80();
  v32 = v8;
  v15 = v6;
  v31 = 0;
  sub_213BDDAD4();
  v16 = v30;
  sub_213C129E4();
  if (v16)
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v18 = v27;
  v17 = v28;
  v19 = v26;
  v30 = v14;
  v32 = v29;
  v31 = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D27B20);
  sub_213BDDBA0(&qword_254D27B28, &qword_254D27B20, (uint64_t (*)(void))sub_213BDDB5C, MEMORY[0x24BEE12A0]);
  sub_213C129E4();
  v32 = v17;
  v31 = 2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D27B38);
  sub_213BDDBA0(&qword_254D27B40, &qword_254D27B38, (uint64_t (*)(void))sub_213BDDC04, MEMORY[0x24BEE12A0]);
  sub_213C129E4();
  v32 = v18;
  v31 = 3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D27B50);
  sub_213BDDBA0(&qword_254D27B58, &qword_254D27B50, (uint64_t (*)(void))sub_213BDDC48, MEMORY[0x24BEE12A0]);
  sub_213C129E4();
  v32 = v19;
  v31 = 4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D27B68);
  sub_213BDDBA0(&qword_254D27B70, &qword_254D27B68, (uint64_t (*)(void))sub_213BDDC8C, MEMORY[0x24BEE12A0]);
  sub_213C129E4();
  v32 = v25;
  v31 = 5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D27B80);
  sub_213BDF114(&qword_254D27B88, &qword_254D27B90, MEMORY[0x24BEE4010], MEMORY[0x24BEE12A0]);
  sub_213C129E4();
  v32 = v24;
  v31 = 6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D298F0);
  sub_213BDF19C(&qword_254D27B90, &qword_254D298F0, MEMORY[0x24BEE4010], MEMORY[0x24BEE12A0]);
  sub_213C129E4();
  v32 = v23;
  v31 = 7;
  sub_213C129E4();
  v32 = v22;
  v31 = 8;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D29930);
  sub_213BDDCD0(&qword_254D27B98, &qword_254D27BA0, MEMORY[0x24BEE14F8], MEMORY[0x24BEE12A0]);
  sub_213C129E4();
  LOBYTE(v32) = 9;
  sub_213C129CC();
  LOBYTE(v32) = 10;
  sub_213C129D8();
  LOBYTE(v32) = 11;
  sub_213C129CC();
  LOBYTE(v32) = 12;
  sub_213C129CC();
  LOBYTE(v32) = 13;
  sub_213C129CC();
  LOBYTE(v32) = 14;
  sub_213C129CC();
  LOBYTE(v32) = 15;
  sub_213C129CC();
  LOBYTE(v32) = 16;
  sub_213C129D8();
  LOBYTE(v32) = 17;
  sub_213C129A8();
  LOBYTE(v32) = 18;
  sub_213C129A8();
  LOBYTE(v32) = 19;
  sub_213C129A8();
  LOBYTE(v32) = 20;
  sub_213C129A8();
  LOBYTE(v32) = 21;
  sub_213C129A8();
  LOBYTE(v32) = 22;
  sub_213C129A8();
  LOBYTE(v32) = 23;
  sub_213C129A8();
  LOBYTE(v32) = 24;
  sub_213C129A8();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v15, v3);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199BF408]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_213BDDA90()
{
  unint64_t result;

  result = qword_254D27B10;
  if (!qword_254D27B10)
  {
    result = MEMORY[0x2199BF420](&unk_213C14A9C, &type metadata for PADSWClassifierResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D27B10);
  }
  return result;
}

unint64_t sub_213BDDAD4()
{
  unint64_t result;

  result = qword_254D27B18;
  if (!qword_254D27B18)
  {
    result = MEMORY[0x2199BF420](&protocol conformance descriptor for PADSWAssessmentLabel, &type metadata for PADSWAssessmentLabel);
    atomic_store(result, (unint64_t *)&qword_254D27B18);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199BF414](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_213BDDB5C()
{
  unint64_t result;

  result = qword_254D27B30;
  if (!qword_254D27B30)
  {
    result = MEMORY[0x2199BF420](&protocol conformance descriptor for PADSWGesture, &type metadata for PADSWGesture);
    atomic_store(result, (unint64_t *)&qword_254D27B30);
  }
  return result;
}

uint64_t sub_213BDDBA0(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3();
    result = MEMORY[0x2199BF420](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_213BDDC04()
{
  unint64_t result;

  result = qword_254D27B48;
  if (!qword_254D27B48)
  {
    result = MEMORY[0x2199BF420](&protocol conformance descriptor for PADSWGestureAssessment, &type metadata for PADSWGestureAssessment);
    atomic_store(result, (unint64_t *)&qword_254D27B48);
  }
  return result;
}

unint64_t sub_213BDDC48()
{
  unint64_t result;

  result = qword_254D27B60;
  if (!qword_254D27B60)
  {
    result = MEMORY[0x2199BF420](&protocol conformance descriptor for PADPrintReplayAssessment, &type metadata for PADPrintReplayAssessment);
    atomic_store(result, (unint64_t *)&qword_254D27B60);
  }
  return result;
}

unint64_t sub_213BDDC8C()
{
  unint64_t result;

  result = qword_254D27B78;
  if (!qword_254D27B78)
  {
    result = MEMORY[0x2199BF420](&protocol conformance descriptor for PADTrajectoryAnalysisAssessment, &type metadata for PADTrajectoryAnalysisAssessment);
    atomic_store(result, (unint64_t *)&qword_254D27B78);
  }
  return result;
}

uint64_t sub_213BDDCD0(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_254D29930);
    v10 = sub_213BDF19C(a2, (uint64_t *)&unk_254D29880, a3, a4);
    result = MEMORY[0x2199BF420](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t PADSWClassifierResult.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  int v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
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
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _QWORD *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint64_t v100;
  _QWORD v101[9];
  int v102;
  uint64_t v103;
  unsigned int v104;
  unsigned int v105;
  unsigned int v106;
  unsigned int v107;
  int v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  char v126;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D27BA8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v84 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v9);
  sub_213BDDA90();
  sub_213C12A74();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v84);
  LOBYTE(v85) = 0;
  sub_213BDEFC0();
  sub_213C1299C();
  v10 = v101[0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D27B20);
  LOBYTE(v85) = 1;
  sub_213BDDBA0(&qword_254D27BB8, &qword_254D27B20, (uint64_t (*)(void))sub_213BDF004, MEMORY[0x24BEE12D0]);
  sub_213C1299C();
  v72 = v10;
  v11 = v101[0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D27B38);
  LOBYTE(v85) = 2;
  sub_213BDDBA0(&qword_254D27BC8, &qword_254D27B38, (uint64_t (*)(void))sub_213BDF048, MEMORY[0x24BEE12D0]);
  swift_bridgeObjectRetain();
  sub_213C1299C();
  v71 = v11;
  v12 = v101[0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D27B50);
  LOBYTE(v85) = 3;
  sub_213BDDBA0(&qword_254D27BD8, &qword_254D27B50, (uint64_t (*)(void))sub_213BDF08C, MEMORY[0x24BEE12D0]);
  swift_bridgeObjectRetain();
  sub_213C1299C();
  v70 = v12;
  v13 = v101[0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D27B68);
  LOBYTE(v85) = 4;
  sub_213BDDBA0(&qword_254D27BE8, &qword_254D27B68, (uint64_t (*)(void))sub_213BDF0D0, MEMORY[0x24BEE12D0]);
  swift_bridgeObjectRetain();
  sub_213C1299C();
  v83 = v13;
  v14 = v101[0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D27B80);
  LOBYTE(v85) = 5;
  sub_213BDF114(&qword_254D27BF8, &qword_254D27C00, MEMORY[0x24BEE4038], MEMORY[0x24BEE12D0]);
  swift_bridgeObjectRetain();
  sub_213C1299C();
  v69 = v14;
  v15 = v101[0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D298F0);
  LOBYTE(v85) = 6;
  sub_213BDF19C(&qword_254D27C00, &qword_254D298F0, MEMORY[0x24BEE4038], MEMORY[0x24BEE12D0]);
  v82 = v15;
  swift_bridgeObjectRetain();
  sub_213C1299C();
  LOBYTE(v85) = 7;
  v81 = v101[0];
  swift_bridgeObjectRetain();
  sub_213C1299C();
  v16 = v101[0];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D29930);
  LOBYTE(v85) = 8;
  sub_213BDDCD0(&qword_254D27C08, &qword_254D27C10, MEMORY[0x24BEE1520], MEMORY[0x24BEE12D0]);
  v80 = v16;
  swift_bridgeObjectRetain();
  sub_213C1299C();
  v17 = v69;
  v18 = v101[0];
  LOBYTE(v101[0]) = 9;
  v79 = v18;
  swift_bridgeObjectRetain();
  sub_213C12984();
  v20 = v19;
  LOBYTE(v101[0]) = 10;
  v21 = sub_213C12990();
  LOBYTE(v101[0]) = 11;
  sub_213C12984();
  v23 = v22;
  LOBYTE(v101[0]) = 12;
  sub_213C12984();
  v25 = v24;
  LOBYTE(v101[0]) = 13;
  sub_213C12984();
  v27 = v26;
  LOBYTE(v101[0]) = 14;
  sub_213C12984();
  v29 = v28;
  LOBYTE(v101[0]) = 15;
  sub_213C12984();
  v31 = v30;
  LOBYTE(v101[0]) = 16;
  v68 = sub_213C12990();
  LOBYTE(v101[0]) = 17;
  v67 = sub_213C12960();
  v74 = v32;
  LOBYTE(v101[0]) = 18;
  swift_bridgeObjectRetain();
  v66 = sub_213C12960();
  v78 = v33;
  LOBYTE(v101[0]) = 19;
  swift_bridgeObjectRetain();
  v65 = sub_213C12960();
  v77 = v34;
  LOBYTE(v101[0]) = 20;
  swift_bridgeObjectRetain();
  v64 = sub_213C12960();
  v76 = v35;
  LOBYTE(v101[0]) = 21;
  swift_bridgeObjectRetain();
  v63 = sub_213C12960();
  v73 = v36;
  LOBYTE(v101[0]) = 22;
  swift_bridgeObjectRetain();
  v62 = sub_213C12960();
  v75 = v37;
  LOBYTE(v101[0]) = 23;
  swift_bridgeObjectRetain();
  v60 = sub_213C12960();
  v61 = v38;
  v126 = 24;
  swift_bridgeObjectRetain();
  v39 = sub_213C12960();
  v59 = v40;
  v41 = v39;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  *(_QWORD *)&v85 = v72;
  *((_QWORD *)&v85 + 1) = v71;
  *(_QWORD *)&v86 = v70;
  *((_QWORD *)&v86 + 1) = v83;
  *(_QWORD *)&v87 = v17;
  *((_QWORD *)&v87 + 1) = v82;
  *(_QWORD *)&v88 = v81;
  *((_QWORD *)&v88 + 1) = v80;
  *(_QWORD *)&v89 = v79;
  DWORD2(v89) = v20;
  v57 = v21;
  *(_QWORD *)&v90 = v21;
  *((_QWORD *)&v90 + 1) = __PAIR64__(v25, v23);
  *(_QWORD *)&v91 = __PAIR64__(v29, v27);
  DWORD2(v91) = v31;
  *(_QWORD *)&v92 = v68;
  *((_QWORD *)&v92 + 1) = v67;
  *(_QWORD *)&v93 = v74;
  *((_QWORD *)&v93 + 1) = v66;
  *(_QWORD *)&v94 = v78;
  *((_QWORD *)&v94 + 1) = v65;
  *(_QWORD *)&v95 = v77;
  *((_QWORD *)&v95 + 1) = v64;
  *(_QWORD *)&v96 = v76;
  *((_QWORD *)&v96 + 1) = v63;
  *(_QWORD *)&v97 = v73;
  *((_QWORD *)&v97 + 1) = v62;
  *(_QWORD *)&v98 = v75;
  *((_QWORD *)&v98 + 1) = v60;
  *(_QWORD *)&v99 = v61;
  *((_QWORD *)&v99 + 1) = v41;
  v58 = v41;
  v100 = v59;
  sub_213BDF1F8((uint64_t)&v85);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v42 = v79;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v43 = v77;
  swift_bridgeObjectRelease();
  v44 = v76;
  swift_bridgeObjectRelease();
  v45 = v73;
  swift_bridgeObjectRelease();
  v46 = v75;
  swift_bridgeObjectRelease();
  v47 = v61;
  swift_bridgeObjectRelease();
  v48 = v98;
  *(_OWORD *)(a2 + 192) = v97;
  *(_OWORD *)(a2 + 208) = v48;
  *(_OWORD *)(a2 + 224) = v99;
  *(_QWORD *)(a2 + 240) = v100;
  v49 = v94;
  *(_OWORD *)(a2 + 128) = v93;
  *(_OWORD *)(a2 + 144) = v49;
  v50 = v96;
  *(_OWORD *)(a2 + 160) = v95;
  *(_OWORD *)(a2 + 176) = v50;
  v51 = v90;
  *(_OWORD *)(a2 + 64) = v89;
  *(_OWORD *)(a2 + 80) = v51;
  v52 = v92;
  *(_OWORD *)(a2 + 96) = v91;
  *(_OWORD *)(a2 + 112) = v52;
  v53 = v86;
  *(_OWORD *)a2 = v85;
  *(_OWORD *)(a2 + 16) = v53;
  v54 = v88;
  *(_OWORD *)(a2 + 32) = v87;
  *(_OWORD *)(a2 + 48) = v54;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v84);
  v101[0] = v72;
  v101[1] = v71;
  v101[2] = v70;
  v101[3] = v83;
  v101[4] = v69;
  v101[5] = v82;
  v101[6] = v81;
  v101[7] = v80;
  v101[8] = v42;
  v102 = v20;
  v103 = v57;
  v104 = v23;
  v105 = v25;
  v106 = v27;
  v107 = v29;
  v108 = v31;
  v109 = v68;
  v110 = v67;
  v111 = v74;
  v112 = v66;
  v113 = v78;
  v114 = v65;
  v115 = v43;
  v116 = v64;
  v117 = v44;
  v118 = v63;
  v119 = v45;
  v120 = v62;
  v121 = v46;
  v122 = v60;
  v123 = v47;
  v124 = v58;
  v125 = v59;
  return sub_213BDF2F8((uint64_t)v101);
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

unint64_t sub_213BDEFC0()
{
  unint64_t result;

  result = qword_254D27BB0;
  if (!qword_254D27BB0)
  {
    result = MEMORY[0x2199BF420](&protocol conformance descriptor for PADSWAssessmentLabel, &type metadata for PADSWAssessmentLabel);
    atomic_store(result, (unint64_t *)&qword_254D27BB0);
  }
  return result;
}

unint64_t sub_213BDF004()
{
  unint64_t result;

  result = qword_254D27BC0;
  if (!qword_254D27BC0)
  {
    result = MEMORY[0x2199BF420](&protocol conformance descriptor for PADSWGesture, &type metadata for PADSWGesture);
    atomic_store(result, (unint64_t *)&qword_254D27BC0);
  }
  return result;
}

unint64_t sub_213BDF048()
{
  unint64_t result;

  result = qword_254D27BD0;
  if (!qword_254D27BD0)
  {
    result = MEMORY[0x2199BF420](&protocol conformance descriptor for PADSWGestureAssessment, &type metadata for PADSWGestureAssessment);
    atomic_store(result, (unint64_t *)&qword_254D27BD0);
  }
  return result;
}

unint64_t sub_213BDF08C()
{
  unint64_t result;

  result = qword_254D27BE0;
  if (!qword_254D27BE0)
  {
    result = MEMORY[0x2199BF420](&protocol conformance descriptor for PADPrintReplayAssessment, &type metadata for PADPrintReplayAssessment);
    atomic_store(result, (unint64_t *)&qword_254D27BE0);
  }
  return result;
}

unint64_t sub_213BDF0D0()
{
  unint64_t result;

  result = qword_254D27BF0;
  if (!qword_254D27BF0)
  {
    result = MEMORY[0x2199BF420](&protocol conformance descriptor for PADTrajectoryAnalysisAssessment, &type metadata for PADTrajectoryAnalysisAssessment);
    atomic_store(result, (unint64_t *)&qword_254D27BF0);
  }
  return result;
}

uint64_t sub_213BDF114(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D27B80);
    v10 = sub_213BDF19C(a2, &qword_254D298F0, a3, a4);
    result = MEMORY[0x2199BF420](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_213BDF19C(unint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3;
    result = MEMORY[0x2199BF420](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_213BDF1F8(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_213BDF2F8(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_213BDF3F8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return PADSWClassifierResult.init(from:)(a1, a2);
}

uint64_t sub_213BDF40C(_QWORD *a1)
{
  return PADSWClassifierResult.encode(to:)(a1);
}

uint64_t sub_213BDF420(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  _BYTE v5[40];

  sub_213BDF4D4(a1, (uint64_t)v5);
  v3 = *a2 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_delegate;
  swift_beginAccess();
  sub_213BDF574((uint64_t)v5, v3);
  return swift_endAccess();
}

uint64_t sub_213BDF484@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_delegate;
  swift_beginAccess();
  return sub_213BDF4D4(v3, a1);
}

uint64_t sub_213BDF4D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D28D30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_213BDF51C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_delegate;
  swift_beginAccess();
  sub_213BDF574(a1, v3);
  return swift_endAccess();
}

uint64_t sub_213BDF574(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D28D30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*sub_213BDF5BC())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_213BDF604()
{
  uint64_t v0;
  _QWORD *v1;
  void *v2;
  unint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;

  v1 = *(_QWORD **)(v0 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_fac);
  swift_beginAccess();
  v3 = v1[20];
  v2 = (void *)v1[21];
  v4 = v1[18];
  v5 = v2;
  swift_bridgeObjectRetain();
  sub_213C127A4();
  sub_213C127B0();
  if ((v3 & 0x8000000000000000) != 0 || v3 >= *(_QWORD *)(v4 + 16))
  {

    swift_bridgeObjectRelease();
    return 10;
  }
  else
  {
    v6 = *(_QWORD *)(v4 + 8 * v3 + 32);

    swift_bridgeObjectRelease();
  }
  return v6;
}

void sub_213BDF6A8(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(*(_QWORD *)(v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_ta) + 185);
}

_BYTE *sub_213BDF6C0(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(*(_QWORD *)(v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_ta) + 185) = *result;
  return result;
}

_BYTE *(*sub_213BDF6D8(uint64_t a1))(_BYTE *result)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_ta);
  *(_QWORD *)a1 = v2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(v2 + 185);
  return sub_213BDF700;
}

_BYTE *sub_213BDF700(_BYTE *result)
{
  *(_BYTE *)(*(_QWORD *)result + 185) = result[8];
  return result;
}

void sub_213BDF710()
{
  word_254D27B00 = 257;
  byte_254D27B02 = 1;
}

uint64_t static PADSWClassifier.FrameProcessingOptions.allEnabled.getter@<X0>(_BYTE *a1@<X8>)
{
  char v2;
  char v3;
  uint64_t result;

  if (qword_254D27950 != -1)
    result = swift_once();
  v2 = HIBYTE(word_254D27B00);
  v3 = byte_254D27B02;
  *a1 = word_254D27B00;
  a1[1] = v2;
  a1[2] = v3;
  return result;
}

uint64_t PADSWClassifier.__allocating_init(delegate:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  *(_QWORD *)(v1 + 264) = a1;
  type metadata accessor for PADModelManager();
  swift_allocObject();
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 272) = v2;
  *v2 = v1;
  v2[1] = sub_213BDF7F0;
  return sub_213BF1E74();
}

uint64_t sub_213BDF7F0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 280) = a1;
  *(_QWORD *)(v3 + 288) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_213BDF85C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  id v14;
  _QWORD *v15;

  v1 = *(_QWORD *)(v0 + 280);
  v2 = *(_QWORD *)(v0 + 264);
  sub_213BF40AC(v0 + 16);
  type metadata accessor for PADLivenessClassifier();
  v3 = swift_allocObject();
  *(_QWORD *)(v0 + 296) = v3;
  swift_weakInit();
  swift_retain();
  sub_213BF326C();
  v4 = objc_allocWithZone((Class)PADAlgorithms);
  sub_213BE2B78();
  v5 = (void *)sub_213C125C4();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v4, sel_initWithPADModelConfiguration_, v5);

  v7 = *(_OWORD *)(v0 + 144);
  *(_OWORD *)(v3 + 168) = *(_OWORD *)(v0 + 160);
  v8 = *(_OWORD *)(v0 + 192);
  *(_OWORD *)(v3 + 184) = *(_OWORD *)(v0 + 176);
  *(_OWORD *)(v3 + 200) = v8;
  *(_OWORD *)(v3 + 216) = *(_OWORD *)(v0 + 208);
  v9 = *(_OWORD *)(v0 + 80);
  *(_OWORD *)(v3 + 104) = *(_OWORD *)(v0 + 96);
  v10 = *(_OWORD *)(v0 + 128);
  *(_OWORD *)(v3 + 120) = *(_OWORD *)(v0 + 112);
  *(_OWORD *)(v3 + 136) = v10;
  *(_OWORD *)(v3 + 152) = v7;
  v11 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v3 + 40) = *(_OWORD *)(v0 + 32);
  v12 = *(_OWORD *)(v0 + 64);
  *(_OWORD *)(v3 + 56) = *(_OWORD *)(v0 + 48);
  *(_OWORD *)(v3 + 72) = v12;
  *(_OWORD *)(v3 + 88) = v9;
  *(_QWORD *)(v3 + 16) = v6;
  *(_OWORD *)(v3 + 24) = v11;
  swift_weakAssign();
  swift_release();
  type metadata accessor for PADFaceActionController();
  swift_allocObject();
  swift_retain();
  v13 = sub_213C0EDAC(0, 0, v3);
  *(_QWORD *)(v0 + 304) = v13;
  sub_213BDF4D4(v2, v0 + 224);
  v14 = objc_allocWithZone((Class)type metadata accessor for PADSWClassifier());
  swift_retain();
  swift_retain();
  swift_retain();
  v15 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 312) = v15;
  *v15 = v0;
  v15[1] = sub_213BDFA70;
  v15[88] = v14;
  v15[87] = v0 + 224;
  v15[86] = v3;
  v15[84] = 0;
  v15[85] = 0;
  v15[83] = 0;
  v15[82] = v13;
  v15[81] = v1;
  return swift_task_switch();
}

uint64_t sub_213BDFA70(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 320) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 328) = a1;
  return swift_task_switch();
}

uint64_t sub_213BDFAE4()
{
  uint64_t v0;

  sub_213BE4088(*(_QWORD *)(v0 + 264), (uint64_t *)&unk_254D28D30);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_213BDFB20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 328);
  v2 = *(_QWORD *)(v0 + 264);
  swift_release();
  swift_release();
  swift_release();
  sub_213BE4088(v2, (uint64_t *)&unk_254D28D30);
  *(_QWORD *)(*(_QWORD *)(v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_fac) + 136) = &off_24D0CF9E0;
  swift_unknownObjectWeakAssign();
  *(_QWORD *)(*(_QWORD *)(v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_ta) + 208) = &off_24D0CFA10;
  swift_unknownObjectWeakAssign();
  *(_QWORD *)(*(_QWORD *)(v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_selfieAnalyzer) + 152) = &off_24D0CFA28;
  swift_unknownObjectWeakAssign();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 328));
}

uint64_t sub_213BDFBF8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 264);
  swift_release();
  swift_release();
  swift_release();
  sub_213BE4088(v1, (uint64_t *)&unk_254D28D30);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_213BDFC5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v8;

  v8[88] = v7;
  v8[87] = a7;
  v8[86] = a6;
  v8[85] = a5;
  v8[84] = a4;
  v8[83] = a3;
  v8[82] = a2;
  v8[81] = a1;
  return swift_task_switch();
}

uint64_t sub_213BDFC90()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  id v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  dispatch_semaphore_t v31;
  dispatch_semaphore_t v32;
  dispatch_semaphore_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;

  v1 = *(char **)(v0 + 704);
  v2 = *(_QWORD *)(v0 + 696);
  v3 = *(_QWORD *)(v0 + 648);
  v4 = OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_facResult;
  *(_QWORD *)(v0 + 712) = OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_facResult;
  v5 = &v1[v4];
  *((_QWORD *)v5 + 4) = 0;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  v6 = OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_selfieResult;
  *(_QWORD *)(v0 + 720) = OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_selfieResult;
  v7 = (uint64_t)&v1[v6];
  sub_213BE4028((_OWORD *)(v0 + 224));
  sub_213BE3C10(v0 + 224, v7);
  v8 = OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_request;
  *(_QWORD *)(v0 + 728) = OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_request;
  v9 = &v1[v8];
  *(_QWORD *)v9 = 0;
  *((_QWORD *)v9 + 1) = 0;
  v10 = OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_delegate;
  *(_QWORD *)(v0 + 736) = OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_delegate;
  v11 = (uint64_t)&v1[v10];
  *(_QWORD *)(v11 + 32) = 0;
  *(_OWORD *)v11 = 0u;
  *(_OWORD *)(v11 + 16) = 0u;
  swift_beginAccess();
  v12 = v1;
  sub_213BE4044(v2, v11, (uint64_t *)&unk_254D28D30);
  swift_endAccess();
  if (v3)
  {
    v13 = *(_QWORD *)(v0 + 688);
    *(_QWORD *)(*(_QWORD *)(v0 + 704) + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_modelManager) = *(_QWORD *)(v0 + 648);
    if (v13)
    {
      v14 = *(_QWORD *)(v0 + 688);
      swift_retain();
      swift_retain();
    }
    else
    {
      swift_retain();
      swift_retain_n();
      sub_213BF40AC(v0 + 16);
      type metadata accessor for PADLivenessClassifier();
      v14 = swift_allocObject();
      swift_weakInit();
      sub_213BF326C();
      v17 = objc_allocWithZone((Class)PADAlgorithms);
      sub_213BE2B78();
      v18 = (void *)sub_213C125C4();
      swift_bridgeObjectRelease();
      v19 = objc_msgSend(v17, sel_initWithPADModelConfiguration_, v18);

      v20 = *(_OWORD *)(v0 + 144);
      *(_OWORD *)(v14 + 168) = *(_OWORD *)(v0 + 160);
      v21 = *(_OWORD *)(v0 + 192);
      *(_OWORD *)(v14 + 184) = *(_OWORD *)(v0 + 176);
      *(_OWORD *)(v14 + 200) = v21;
      *(_OWORD *)(v14 + 216) = *(_OWORD *)(v0 + 208);
      v22 = *(_OWORD *)(v0 + 80);
      *(_OWORD *)(v14 + 104) = *(_OWORD *)(v0 + 96);
      v23 = *(_OWORD *)(v0 + 128);
      *(_OWORD *)(v14 + 120) = *(_OWORD *)(v0 + 112);
      *(_OWORD *)(v14 + 136) = v23;
      *(_OWORD *)(v14 + 152) = v20;
      v24 = *(_OWORD *)(v0 + 16);
      *(_OWORD *)(v14 + 40) = *(_OWORD *)(v0 + 32);
      v25 = *(_OWORD *)(v0 + 64);
      *(_OWORD *)(v14 + 56) = *(_OWORD *)(v0 + 48);
      *(_OWORD *)(v14 + 72) = v25;
      *(_OWORD *)(v14 + 88) = v22;
      *(_QWORD *)(v14 + 16) = v19;
      *(_OWORD *)(v14 + 24) = v24;
      swift_weakAssign();
      swift_release();
    }
    v26 = *(_QWORD *)(v0 + 704);
    v27 = *(_QWORD *)(v0 + 664);
    v28 = *(_QWORD *)(v0 + 656);
    *(_QWORD *)(v26 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_livenessClassifier) = v14;
    *(_QWORD *)(v26 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_fac) = v28;
    if (v27)
    {
      v29 = *(_QWORD *)(v0 + 664);
      swift_retain();
      swift_retain();
    }
    else
    {
      type metadata accessor for PADTrajectoryAnalysisController();
      v30 = swift_allocObject();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      v31 = dispatch_semaphore_create(1);
      *(_QWORD *)(v30 + 128) = 0;
      *(_QWORD *)(v30 + 136) = v31;
      v32 = dispatch_semaphore_create(1);
      *(_QWORD *)(v30 + 144) = 0;
      *(_QWORD *)(v30 + 152) = v32;
      v33 = dispatch_semaphore_create(1);
      *(_QWORD *)(v30 + 160) = 0;
      *(_QWORD *)(v30 + 168) = v33;
      *(_QWORD *)(v30 + 176) = 0;
      *(_WORD *)(v30 + 184) = 256;
      *(_QWORD *)(v30 + 192) = MEMORY[0x24BEE4AF8];
      *(_QWORD *)(v30 + 208) = 0;
      swift_unknownObjectWeakInit();
      *(_QWORD *)(v30 + 208) = 0;
      swift_unknownObjectWeakAssign();
      swift_release();
      v29 = sub_213BFA254(v14);
    }
    v34 = *(_QWORD *)(v0 + 672);
    *(_QWORD *)(*(_QWORD *)(v0 + 704) + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_ta) = v29;
    if (v34)
    {
      v35 = *(_QWORD *)(v0 + 672);
      swift_retain();
    }
    else
    {
      type metadata accessor for PADPrintReplayController();
      *(_OWORD *)(v0 + 544) = 0u;
      *(_OWORD *)(v0 + 560) = 0u;
      *(_QWORD *)(v0 + 576) = 0;
      v36 = swift_allocObject();
      *(_QWORD *)(v36 + 128) = MEMORY[0x24BEE4AF8];
      *(_QWORD *)(v36 + 136) = 0;
      *(_QWORD *)(v36 + 144) = 0;
      *(_QWORD *)(v36 + 152) = 0;
      *(_BYTE *)(v36 + 160) = 1;
      *(_OWORD *)(v36 + 184) = 0u;
      *(_QWORD *)(v36 + 200) = 0;
      *(_OWORD *)(v36 + 168) = 0u;
      swift_beginAccess();
      swift_retain();
      swift_retain();
      swift_retain();
      sub_213BE4044(v0 + 544, v36 + 168, &qword_254D27CD0);
      swift_endAccess();
      swift_release();
      v35 = sub_213BFA254(v14);
      sub_213BE4088(v0 + 544, &qword_254D27CD0);
    }
    v37 = *(_QWORD *)(v0 + 680);
    *(_QWORD *)(*(_QWORD *)(v0 + 704) + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_prd) = v35;
    v38 = *(_QWORD *)(v0 + 680);
    if (v37)
    {
      swift_retain();
      swift_retain();
      swift_release();
      v39 = v38;
    }
    else
    {
      type metadata accessor for PADSelfieAnalysisController();
      v40 = (_QWORD *)swift_allocObject();
      v40[19] = 0;
      v40[16] = 0;
      v40[17] = 0;
      swift_unknownObjectWeakInit();
      v41 = MEMORY[0x24BEE4AF8];
      v40[19] = 0;
      v40[20] = v41;
      swift_unknownObjectWeakAssign();
      swift_retain();
      v42 = swift_retain();
      v39 = sub_213BFA254(v42);
      swift_release();
    }
    v43 = *(char **)(v0 + 704);
    v44 = *(_QWORD *)(v0 + 696);
    *(_QWORD *)&v43[OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_selfieAnalyzer] = v39;

    v45 = type metadata accessor for PADSWClassifier();
    *(_QWORD *)(v0 + 632) = v43;
    *(_QWORD *)(v0 + 640) = v45;
    v46 = objc_msgSendSuper2((objc_super *)(v0 + 632), sel_init);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    sub_213BE4088(v44, (uint64_t *)&unk_254D28D30);
    return (*(uint64_t (**)(id))(v0 + 8))(v46);
  }
  else
  {
    type metadata accessor for PADModelManager();
    swift_allocObject();
    v15 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 744) = v15;
    *v15 = v0;
    v15[1] = sub_213BE0258;
    return sub_213BF1E74();
  }
}

uint64_t sub_213BE0258(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 752) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 760) = a1;
  return swift_task_switch();
}

uint64_t sub_213BE02CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  dispatch_semaphore_t v17;
  dispatch_semaphore_t v18;
  dispatch_semaphore_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;

  v1 = *(_QWORD *)(v0 + 688);
  *(_QWORD *)(*(_QWORD *)(v0 + 704) + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_modelManager) = *(_QWORD *)(v0 + 760);
  if (v1)
  {
    v2 = *(_QWORD *)(v0 + 688);
    swift_retain();
    swift_retain();
  }
  else
  {
    swift_retain();
    swift_retain_n();
    sub_213BF40AC(v0 + 16);
    type metadata accessor for PADLivenessClassifier();
    v2 = swift_allocObject();
    swift_weakInit();
    sub_213BF326C();
    v3 = objc_allocWithZone((Class)PADAlgorithms);
    sub_213BE2B78();
    v4 = (void *)sub_213C125C4();
    swift_bridgeObjectRelease();
    v5 = objc_msgSend(v3, sel_initWithPADModelConfiguration_, v4);

    v6 = *(_OWORD *)(v0 + 144);
    *(_OWORD *)(v2 + 168) = *(_OWORD *)(v0 + 160);
    v7 = *(_OWORD *)(v0 + 192);
    *(_OWORD *)(v2 + 184) = *(_OWORD *)(v0 + 176);
    *(_OWORD *)(v2 + 200) = v7;
    *(_OWORD *)(v2 + 216) = *(_OWORD *)(v0 + 208);
    v8 = *(_OWORD *)(v0 + 80);
    *(_OWORD *)(v2 + 104) = *(_OWORD *)(v0 + 96);
    v9 = *(_OWORD *)(v0 + 128);
    *(_OWORD *)(v2 + 120) = *(_OWORD *)(v0 + 112);
    *(_OWORD *)(v2 + 136) = v9;
    *(_OWORD *)(v2 + 152) = v6;
    v10 = *(_OWORD *)(v0 + 16);
    *(_OWORD *)(v2 + 40) = *(_OWORD *)(v0 + 32);
    v11 = *(_OWORD *)(v0 + 64);
    *(_OWORD *)(v2 + 56) = *(_OWORD *)(v0 + 48);
    *(_OWORD *)(v2 + 72) = v11;
    *(_OWORD *)(v2 + 88) = v8;
    *(_QWORD *)(v2 + 16) = v5;
    *(_OWORD *)(v2 + 24) = v10;
    swift_weakAssign();
    swift_release();
  }
  v12 = *(_QWORD *)(v0 + 704);
  v13 = *(_QWORD *)(v0 + 664);
  v14 = *(_QWORD *)(v0 + 656);
  *(_QWORD *)(v12 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_livenessClassifier) = v2;
  *(_QWORD *)(v12 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_fac) = v14;
  if (v13)
  {
    v15 = *(_QWORD *)(v0 + 664);
    swift_retain();
    swift_retain();
  }
  else
  {
    type metadata accessor for PADTrajectoryAnalysisController();
    v16 = swift_allocObject();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    v17 = dispatch_semaphore_create(1);
    *(_QWORD *)(v16 + 128) = 0;
    *(_QWORD *)(v16 + 136) = v17;
    v18 = dispatch_semaphore_create(1);
    *(_QWORD *)(v16 + 144) = 0;
    *(_QWORD *)(v16 + 152) = v18;
    v19 = dispatch_semaphore_create(1);
    *(_QWORD *)(v16 + 160) = 0;
    *(_QWORD *)(v16 + 168) = v19;
    *(_QWORD *)(v16 + 176) = 0;
    *(_WORD *)(v16 + 184) = 256;
    *(_QWORD *)(v16 + 192) = MEMORY[0x24BEE4AF8];
    *(_QWORD *)(v16 + 208) = 0;
    swift_unknownObjectWeakInit();
    *(_QWORD *)(v16 + 208) = 0;
    swift_unknownObjectWeakAssign();
    swift_release();
    v15 = sub_213BFA254(v2);
  }
  v20 = *(_QWORD *)(v0 + 672);
  *(_QWORD *)(*(_QWORD *)(v0 + 704) + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_ta) = v15;
  if (v20)
  {
    v21 = *(_QWORD *)(v0 + 672);
    swift_retain();
  }
  else
  {
    type metadata accessor for PADPrintReplayController();
    *(_OWORD *)(v0 + 544) = 0u;
    *(_OWORD *)(v0 + 560) = 0u;
    *(_QWORD *)(v0 + 576) = 0;
    v22 = swift_allocObject();
    *(_QWORD *)(v22 + 128) = MEMORY[0x24BEE4AF8];
    *(_QWORD *)(v22 + 136) = 0;
    *(_QWORD *)(v22 + 144) = 0;
    *(_QWORD *)(v22 + 152) = 0;
    *(_BYTE *)(v22 + 160) = 1;
    *(_OWORD *)(v22 + 184) = 0u;
    *(_QWORD *)(v22 + 200) = 0;
    *(_OWORD *)(v22 + 168) = 0u;
    swift_beginAccess();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_213BE4044(v0 + 544, v22 + 168, &qword_254D27CD0);
    swift_endAccess();
    swift_release();
    v21 = sub_213BFA254(v2);
    sub_213BE4088(v0 + 544, &qword_254D27CD0);
  }
  v23 = *(_QWORD *)(v0 + 680);
  *(_QWORD *)(*(_QWORD *)(v0 + 704) + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_prd) = v21;
  v24 = *(_QWORD *)(v0 + 680);
  if (v23)
  {
    swift_retain();
    swift_retain();
    swift_release();
    v25 = v24;
  }
  else
  {
    type metadata accessor for PADSelfieAnalysisController();
    v26 = (_QWORD *)swift_allocObject();
    v26[19] = 0;
    v26[16] = 0;
    v26[17] = 0;
    swift_unknownObjectWeakInit();
    v27 = MEMORY[0x24BEE4AF8];
    v26[19] = 0;
    v26[20] = v27;
    swift_unknownObjectWeakAssign();
    swift_retain();
    v28 = swift_retain();
    v25 = sub_213BFA254(v28);
    swift_release();
  }
  v29 = *(char **)(v0 + 704);
  v30 = *(_QWORD *)(v0 + 696);
  *(_QWORD *)&v29[OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_selfieAnalyzer] = v25;

  v31 = type metadata accessor for PADSWClassifier();
  *(_QWORD *)(v0 + 632) = v29;
  *(_QWORD *)(v0 + 640) = v31;
  v32 = objc_msgSendSuper2((objc_super *)(v0 + 632), sel_init);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_213BE4088(v30, (uint64_t *)&unk_254D28D30);
  return (*(uint64_t (**)(id))(v0 + 8))(v32);
}

uint64_t sub_213BE0780()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + 736);
  v2 = *(_QWORD *)(v0 + 720);
  v3 = *(_QWORD *)(v0 + 712);
  v4 = *(char **)(v0 + 704);
  v5 = *(_QWORD *)(v0 + 696);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_213BE4088(v5, (uint64_t *)&unk_254D28D30);
  sub_213BE3FD8(*(_QWORD *)&v4[v3], *(_QWORD *)&v4[v3 + 8]);
  sub_213BE3C10((uint64_t)&v4[v2], v0 + 384);
  sub_213BE3D90((_QWORD *)(v0 + 384), (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_213BE3DF4);
  swift_bridgeObjectRelease();
  sub_213BE4088((uint64_t)&v4[v1], (uint64_t *)&unk_254D28D30);

  type metadata accessor for PADSWClassifier();
  swift_deallocPartialClassInstance();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_213BE08A8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;

  v2 = v1;
  v3 = *a1;
  v4 = a1[1];
  v5 = (uint64_t *)(v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_request);
  *v5 = *a1;
  v5[1] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (qword_254D27958 != -1)
    swift_once();
  if (qword_254D27CD8)
    sub_213BE4314();
  v6 = *(_QWORD *)(v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_fac);
  sub_213C0798C(v3, v4);
  *(_QWORD *)(v6 + 136) = &off_24D0CF9E0;
  swift_unknownObjectWeakAssign();
  *(_QWORD *)(*(_QWORD *)(v2 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_ta) + 208) = &off_24D0CFA10;
  swift_unknownObjectWeakAssign();
  *(_QWORD *)(*(_QWORD *)(v2 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_selfieAnalyzer) + 152) = &off_24D0CFA28;
  return swift_unknownObjectWeakAssign();
}

void sub_213BE09A0()
{
  sub_213C07CD8();
}

uint64_t sub_213BE09C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t result;
  uint64_t v11;

  v1 = sub_213C12588();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(_QWORD *)(v0 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_fac);
  if (qword_254D27930 != -1)
    swift_once();
  v6 = __swift_project_value_buffer(v1, (uint64_t)qword_254D27938);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v6, v1);
  v7 = sub_213C12570();
  v8 = sub_213C12750();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_213BCD000, v7, v8, "FAC Module: AX has been enabled", v9, 2u);
    MEMORY[0x2199BF4BC](v9, -1, -1);
  }

  result = (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  *(_BYTE *)(v5 + 257) = 1;
  return result;
}

uint64_t sub_213BE0B14()
{
  return sub_213C08778();
}

uint64_t sub_213BE0B3C()
{
  return sub_213C07F48();
}

uint64_t sub_213BE0B64()
{
  return sub_213C08204();
}

uint64_t sub_213BE0B8C()
{
  return sub_213C084C0();
}

void sub_213BE0BB4(void *a1, unsigned __int8 *a2)
{
  int v3;
  int v4;
  int v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  sub_213C1287C();
  sub_213C12648();
  type metadata accessor for CMTime(0);
  sub_213C12630();
  sub_213C12648();
  swift_bridgeObjectRelease();
  sub_213C12648();
  sub_213C12630();
  sub_213C12648();
  swift_bridgeObjectRelease();
  sub_213C12648();
  sub_213C12648();
  swift_bridgeObjectRelease();
  sub_213BDB2F0(0, 0xE000000000000000);
  swift_bridgeObjectRelease();
  if (v3)
  {
    sub_213BFA454(a1);
    if (!v4)
    {
LABEL_3:
      if (!v5)
        return;
      goto LABEL_4;
    }
  }
  else if (!v4)
  {
    goto LABEL_3;
  }
  sub_213BFA454(a1);
  if (!v5)
    return;
LABEL_4:
  sub_213BFE288((char *)a1);
}

uint64_t sub_213BE0DEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;

  v1 = sub_213C12588();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_facResult + 8))
    return sub_213BE18B0();
  if (qword_254D27930 != -1)
    swift_once();
  v6 = __swift_project_value_buffer(v1, (uint64_t)qword_254D27938);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v6, v1);
  v7 = sub_213C12570();
  v8 = sub_213C12750();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_213BCD000, v7, v8, "FAC results are not complete, unable to finish processing without selfie.", v9, 2u);
    MEMORY[0x2199BF4BC](v9, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_213BE0F48(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[3];
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[24];
  uint64_t v11;

  v3 = v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_delegate;
  swift_beginAccess();
  sub_213BDF4D4(v3, (uint64_t)v10);
  if (!v11)
    return sub_213BE4088((uint64_t)v10, (uint64_t *)&unk_254D28D30);
  sub_213BE2DA4((uint64_t)v10, (uint64_t)v7);
  sub_213BE4088((uint64_t)v10, (uint64_t *)&unk_254D28D30);
  v4 = v8;
  v5 = v9;
  __swift_project_boxed_opaque_existential_1(v7, v8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 56))(a1, v4, v5);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
}

uint64_t sub_213BE1008(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[3];
  uint64_t v14;
  uint64_t v15;
  _BYTE v16[24];
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v2 = a1[1];
  v3 = a1[2];
  v4 = a1[3];
  v5 = a1[4];
  v6 = (_QWORD *)(v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_facResult);
  v7 = *(_QWORD *)(v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_facResult);
  v8 = *(_QWORD *)(v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_facResult + 8);
  *v6 = *(unsigned int *)a1;
  v6[1] = v2;
  v6[2] = v3;
  v6[3] = v4;
  v6[4] = v5;
  v20 = v3;
  v21 = v2;
  v18 = v5;
  v19 = v4;
  sub_213BE3FB0((uint64_t)&v21);
  sub_213BE3FB0((uint64_t)&v20);
  sub_213BE3FB0((uint64_t)&v19);
  sub_213BE3FB0((uint64_t)&v18);
  sub_213BE3FD8(v7, v8);
  v9 = v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_delegate;
  swift_beginAccess();
  sub_213BDF4D4(v9, (uint64_t)v16);
  if (!v17)
    return sub_213BE4088((uint64_t)v16, (uint64_t *)&unk_254D28D30);
  sub_213BE2DA4((uint64_t)v16, (uint64_t)v13);
  sub_213BE4088((uint64_t)v16, (uint64_t *)&unk_254D28D30);
  v10 = v14;
  v11 = v15;
  __swift_project_boxed_opaque_existential_1(v13, v14);
  (*(void (**)(uint64_t, uint64_t))(v11 + 40))(v10, v11);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
}

uint64_t sub_213BE1138()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  float v33;
  float v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[6];
  _OWORD v40[15];
  uint64_t v41;
  _QWORD v42[3];
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[5];
  _OWORD v46[15];
  uint64_t v47;
  _QWORD v48[20];
  _OWORD v49[10];
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _OWORD v55[11];

  v1 = v0;
  v2 = sub_213C12588();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)v39 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v39 - v10;
  v12 = *(_QWORD *)(v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_request);
  if (v12)
  {
    v13 = (uint64_t *)(v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_facResult);
    v14 = *(_QWORD *)(v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_facResult + 8);
    if (!v14)
      goto LABEL_4;
    v15 = *v13;
    v17 = v13[2];
    v16 = v13[3];
    v18 = v13[4];
    v50 = v15;
    v51 = v14;
    v52 = v17;
    v39[4] = v18;
    v39[5] = v16;
    v53 = v16;
    v54 = v18;
    sub_213BE3C10(v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_selfieResult, (uint64_t)v48);
    sub_213BE3C10((uint64_t)v48, (uint64_t)v49);
    if (sub_213BE3C58((uint64_t)v49) != 1)
    {
      v39[1] = v6;
      v55[6] = v49[6];
      v55[7] = v49[7];
      v55[8] = v49[8];
      v55[9] = v49[9];
      v55[2] = v49[2];
      v55[3] = v49[3];
      v55[4] = v49[4];
      v55[5] = v49[5];
      v55[0] = v49[0];
      v55[1] = v49[1];
      v28 = v17;
      v29 = *(_QWORD *)(v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_ta);
      v39[3] = *(_QWORD *)(v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_livenessClassifier);
      swift_beginAccess();
      v30 = *(void **)(v29 + 168);
      v39[2] = *(_QWORD *)(v29 + 160);
      v39[0] = v28;
      sub_213BE3C70(v15, v14);
      swift_bridgeObjectRetain();
      sub_213BE3D90(v48, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_213BE3CC0);
      v31 = v30;
      sub_213C127A4();
      sub_213C127B0();

      v32 = *(_QWORD *)(v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_prd);
      v33 = sub_213C04818();
      v34 = sub_213C049AC();
      v35 = sub_213C03B14(*(float *)&v15, v33, v34, *(float *)v49);
      swift_retain();
      swift_retain();
      sub_213BDC3DC(v35, v12, &v50, (uint64_t)v55, v29, v32, (uint64_t)v46);
      v36 = v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_delegate;
      swift_beginAccess();
      sub_213BDF4D4(v36, (uint64_t)v45);
      if (v45[3])
      {
        sub_213BE2DA4((uint64_t)v45, (uint64_t)v42);
        sub_213BE4088((uint64_t)v45, (uint64_t *)&unk_254D28D30);
        v37 = v43;
        v38 = v44;
        __swift_project_boxed_opaque_existential_1(v42, v43);
        v40[12] = v46[12];
        v40[13] = v46[13];
        v40[14] = v46[14];
        v41 = v47;
        v40[8] = v46[8];
        v40[9] = v46[9];
        v40[10] = v46[10];
        v40[11] = v46[11];
        v40[4] = v46[4];
        v40[5] = v46[5];
        v40[6] = v46[6];
        v40[7] = v46[7];
        v40[0] = v46[0];
        v40[1] = v46[1];
        v40[2] = v46[2];
        v40[3] = v46[3];
        (*(void (**)(_OWORD *, uint64_t, uint64_t))(v38 + 48))(v40, v37, v38);
        sub_213BDF2F8((uint64_t)v46);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
      }
      else
      {
        sub_213BDF2F8((uint64_t)v46);
        return sub_213BE4088((uint64_t)v45, (uint64_t *)&unk_254D28D30);
      }
    }
    else
    {
LABEL_4:
      if (qword_254D27930 != -1)
        swift_once();
      v19 = __swift_project_value_buffer(v2, (uint64_t)qword_254D27938);
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v11, v19, v2);
      v20 = sub_213C12570();
      v21 = sub_213C1275C();
      if (os_log_type_enabled(v20, v21))
      {
        v22 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v22 = 0;
        _os_log_impl(&dword_213BCD000, v20, v21, "Attempted to finalize liveness results before FAC and selfie processing has completed", v22, 2u);
        MEMORY[0x2199BF4BC](v22, -1, -1);
      }

      return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v11, v2);
    }
  }
  else
  {
    if (qword_254D27930 != -1)
      swift_once();
    v24 = __swift_project_value_buffer(v2, (uint64_t)qword_254D27938);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v9, v24, v2);
    v25 = sub_213C12570();
    v26 = sub_213C1275C();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_213BCD000, v25, v26, "Attempted to finalize liveness results without a classifier request set.", v27, 2u);
      MEMORY[0x2199BF4BC](v27, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v9, v2);
  }
}

uint64_t sub_213BE18B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  float v23;
  float v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[6];
  _OWORD v39[15];
  uint64_t v40;
  _QWORD v41[3];
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[5];
  _OWORD v45[15];
  uint64_t v46;
  float v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v1 = sub_213C12588();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v38 - v5;
  MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)v38 - v8;
  v10 = *(_QWORD *)(v0 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_request);
  if (v10)
  {
    v11 = (uint64_t *)(v0 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_facResult);
    v12 = *(_QWORD *)(v0 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_facResult + 8);
    if (v12)
    {
      v38[1] = v1;
      v38[2] = v2;
      v13 = v11[3];
      v14 = v11[4];
      v15 = v11[2];
      v16 = *v11;
      LODWORD(v17) = *v11;
      v47 = v17;
      v48 = v12;
      v49 = v15;
      v38[4] = *(_QWORD *)(v0 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_livenessClassifier);
      v38[5] = v7;
      v50 = v13;
      v51 = v14;
      v18 = *(_QWORD *)(v0 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_ta);
      swift_beginAccess();
      v19 = *(void **)(v18 + 168);
      v38[3] = *(_QWORD *)(v18 + 160);
      swift_bridgeObjectRetain();
      v38[0] = v15;
      v20 = v0;
      sub_213BE3C70(v16, v12);
      v21 = v19;
      sub_213C127A4();
      sub_213C127B0();

      v22 = *(_QWORD *)(v20 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_prd);
      v23 = sub_213C04818();
      v24 = sub_213C049AC();
      v34 = sub_213C03B14(v17, v23, v24, -1.0);
      swift_retain();
      swift_retain();
      sub_213BDC93C(v34, v10, (int *)&v47, v18, v22, (uint64_t)v45);
      v35 = v20 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_delegate;
      swift_beginAccess();
      sub_213BDF4D4(v35, (uint64_t)v44);
      if (v44[3])
      {
        sub_213BE2DA4((uint64_t)v44, (uint64_t)v41);
        sub_213BE4088((uint64_t)v44, (uint64_t *)&unk_254D28D30);
        v36 = v42;
        v37 = v43;
        __swift_project_boxed_opaque_existential_1(v41, v42);
        v39[12] = v45[12];
        v39[13] = v45[13];
        v39[14] = v45[14];
        v40 = v46;
        v39[8] = v45[8];
        v39[9] = v45[9];
        v39[10] = v45[10];
        v39[11] = v45[11];
        v39[4] = v45[4];
        v39[5] = v45[5];
        v39[6] = v45[6];
        v39[7] = v45[7];
        v39[0] = v45[0];
        v39[1] = v45[1];
        v39[2] = v45[2];
        v39[3] = v45[3];
        (*(void (**)(_OWORD *, uint64_t, uint64_t))(v37 + 48))(v39, v36, v37);
        sub_213BDF2F8((uint64_t)v45);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
      }
      else
      {
        sub_213BDF2F8((uint64_t)v45);
        return sub_213BE4088((uint64_t)v44, (uint64_t *)&unk_254D28D30);
      }
    }
    else
    {
      if (qword_254D27930 != -1)
        swift_once();
      v30 = __swift_project_value_buffer(v1, (uint64_t)qword_254D27938);
      (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v9, v30, v1);
      v31 = sub_213C12570();
      v32 = sub_213C1275C();
      if (os_log_type_enabled(v31, v32))
      {
        v33 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v33 = 0;
        _os_log_impl(&dword_213BCD000, v31, v32, "Attempted to finalize liveness results before FAC processing has completed", v33, 2u);
        MEMORY[0x2199BF4BC](v33, -1, -1);
      }

      return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v9, v1);
    }
  }
  else
  {
    if (qword_254D27930 != -1)
      swift_once();
    v25 = __swift_project_value_buffer(v1, (uint64_t)qword_254D27938);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v6, v25, v1);
    v26 = sub_213C12570();
    v27 = sub_213C1275C();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_213BCD000, v26, v27, "Attempted to finalize liveness results without a classifier request set.", v28, 2u);
      MEMORY[0x2199BF4BC](v28, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v6, v1);
  }
}

id PADSWClassifier.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void PADSWClassifier.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id PADSWClassifier.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PADSWClassifier();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_213BE217C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x7373656E6576696CLL && a2 == 0xED00006C6562614CLL;
  if (v3 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x5365727574736567 && a2 == 0xEF65636E65757165 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656D737365737361 && a2 == 0xEE0043414673746ELL || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x656D737365737361 && a2 == 0xEE0044525073746ELL || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x656D737365737361 && a2 == 0xED0000415473746ELL || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6D617473656D6974 && a2 == 0xED00004341467370 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6D617473656D6974 && a2 == 0xEC00000044497370 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x8000000213C175E0 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x6E69727065636166 && a2 == 0xEC00000044497374 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x656D737365737361 && a2 == 0xED0000434146746ELL || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x656D737365737361 && a2 == 0xEC0000004154746ELL || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000213C17600 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000213C17620 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else if (a1 == 0x656D737365737361 && a2 == 0xEC0000004449746ELL || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 13;
  }
  else if (a1 == 0x6F4C63634E78616DLL && a2 == 0xE900000000000077 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 14;
  }
  else if (a1 == 0x694863634E78616DLL && a2 == 0xEA00000000006867 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 15;
  }
  else if (a1 == 0x536465726F6E6769 && a2 == 0xEF73656863746974 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 16;
  }
  else if (a1 == 0x6E49656369766564 && a2 == 0xEA00000000006F66 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 17;
  }
  else if (a1 == 0x6C6562614C656761 && a2 == 0xE800000000000000 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 18;
  }
  else if (a1 == 0x6C6562614C786573 && a2 == 0xE800000000000000 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 19;
  }
  else if (a1 == 0x656E6F746E696B73 && a2 == 0xED00006C6562614CLL || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 20;
  }
  else if (a1 == 0x746963696E687465 && a2 == 0xEE006C6562614C79 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 21;
  }
  else if (a1 == 0x7269614865636166 && a2 == 0xED00006C6562614CLL || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 22;
  }
  else if (a1 == 0x7261656764616568 && a2 == 0xED00006C6562614CLL || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 23;
  }
  else if (a1 == 0x4C73657373616C67 && a2 == 0xEC0000006C656261)
  {
    swift_bridgeObjectRelease();
    return 24;
  }
  else
  {
    v6 = sub_213C12A14();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 24;
    else
      return 25;
  }
}

unint64_t sub_213BE2B78()
{
  unint64_t result;

  result = qword_254D27C38;
  if (!qword_254D27C38)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_254D27C38);
  }
  return result;
}

uint64_t type metadata accessor for PADSWClassifier()
{
  return objc_opt_self();
}

uint64_t sub_213BE2BD4(void *a1, char a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  id v16;
  uint64_t v17;

  v5 = sub_213C12588();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (uint64_t *)(v2 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_facResult);
  if (*(_QWORD *)(v2 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_facResult + 8))
  {
    if ((a2 & 1) != 0)
    {
      v10 = v9[3];
      sub_213BE3C70(*v9, *(_QWORD *)(v2 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_facResult + 8));
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      v10 = 0;
    }
    swift_bridgeObjectRetain();
    v16 = a1;
    sub_213BFEF78(v16, v10);

    return swift_bridgeObjectRelease_n();
  }
  else
  {
    if (qword_254D27930 != -1)
      swift_once();
    v11 = __swift_project_value_buffer(v5, (uint64_t)qword_254D27938);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v11, v5);
    v12 = sub_213C12570();
    v13 = sub_213C12750();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_213BCD000, v12, v13, "FAC not complete; unable to process selfie.", v14, 2u);
      MEMORY[0x2199BF4BC](v14, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

uint64_t sub_213BE2DA4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_213BE2DE8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_delegate;
  swift_beginAccess();
  return sub_213BDF4D4(v3, a2);
}

_QWORD *sub_213BE2E40@<X0>(_QWORD *result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = *(_BYTE *)(*(_QWORD *)(*result + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_ta) + 185);
  return result;
}

_BYTE *sub_213BE2E5C(_BYTE *result, _QWORD *a2)
{
  *(_BYTE *)(*(_QWORD *)(*a2 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_ta) + 185) = *result;
  return result;
}

uint64_t dispatch thunk of PADSWClassifierDelegate.padClassifierWillStartDetectingGesture(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of PADSWClassifierDelegate.padClassifierDidDetectIncorrectGesture(duringDetectionOfGesture:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of PADSWClassifierDelegate.padClassifierDidDetectGesture(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of PADSWClassifierDelegate.padClassifierDidDetectStitchWhileDetectingFrame(_:shouldBeIgnored:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of PADSWClassifierDelegate.padClassifierDidFinishGestureDetection()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of PADSWClassifierDelegate.padClassifierDidCompleteAssessment(withResult:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of PADSWClassifierDelegate.padClassifierDidCancelWithError(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

_QWORD *initializeBufferWithCopyOfBuffer for PADSWClassifierRequest(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for PADSWClassifierRequest()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for PADSWClassifierRequest(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  return a1;
}

_QWORD *assignWithTake for PADSWClassifierRequest(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for PADSWClassifierRequest(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PADSWClassifierRequest(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PADSWClassifierRequest()
{
  return &type metadata for PADSWClassifierRequest;
}

uint64_t destroy for PADSWClassifierResult()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PADSWClassifierResult(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_DWORD *)(a1 + 104) = *(_DWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  v7 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v7;
  v8 = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = v8;
  v9 = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = v9;
  v10 = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = v10;
  v11 = *(_QWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = v11;
  v12 = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  *(_QWORD *)(a1 + 216) = v12;
  v13 = *(_QWORD *)(a2 + 232);
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 232) = v13;
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PADSWClassifierResult(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_DWORD *)(a1 + 88) = *(_DWORD *)(a2 + 88);
  *(_DWORD *)(a1 + 92) = *(_DWORD *)(a2 + 92);
  *(_DWORD *)(a1 + 96) = *(_DWORD *)(a2 + 96);
  *(_DWORD *)(a1 + 100) = *(_DWORD *)(a2 + 100);
  *(_DWORD *)(a1 + 104) = *(_DWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy248_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __n128 result;
  __int128 v12;
  __int128 v13;

  v2 = *a2;
  v3 = a2[1];
  v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  v5 = a2[4];
  v6 = a2[5];
  v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  v8 = a2[8];
  v9 = a2[9];
  v10 = a2[11];
  *(_OWORD *)(a1 + 160) = a2[10];
  *(_OWORD *)(a1 + 176) = v10;
  *(_OWORD *)(a1 + 128) = v8;
  *(_OWORD *)(a1 + 144) = v9;
  result = (__n128)a2[12];
  v12 = a2[13];
  v13 = a2[14];
  *(_QWORD *)(a1 + 240) = *((_QWORD *)a2 + 30);
  *(_OWORD *)(a1 + 208) = v12;
  *(_OWORD *)(a1 + 224) = v13;
  *(__n128 *)(a1 + 192) = result;
  return result;
}

uint64_t assignWithTake for PADSWClassifierResult(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_DWORD *)(a1 + 104) = *(_DWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 144) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 176) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 192) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 208);
  *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 208) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 224) = v9;
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
  *(_QWORD *)(a1 + 240) = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PADSWClassifierResult(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 248))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PADSWClassifierResult(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 248) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 248) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PADSWClassifierResult()
{
  return &type metadata for PADSWClassifierResult;
}

uint64_t method lookup function for PADSWClassifier()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PADSWClassifier.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of PADSWClassifier.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of PADSWClassifier.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of PADSWClassifier.currentGesture.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of PADSWClassifier.taMode.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of PADSWClassifier.taMode.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of PADSWClassifier.taMode.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of PADSWClassifier.startLivenessDetectionWithRequest(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of PADSWClassifier.skipGesture()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of PADSWClassifier.enableAccessibilityOptions()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of PADSWClassifier.restartGesture()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of PADSWClassifier.pauseGestureDetection()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of PADSWClassifier.prepareToResumeGestureDetection()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of PADSWClassifier.resumeGestureDetection()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of PADSWClassifier.processFrame(_:withProcessingOptions:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of PADSWClassifier.finishWithSelfie(_:performIDMatching:faceprints:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of PADSWClassifier.finishWithoutSelfie()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of PADSWClassifier.cancel(error:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x180))();
}

uint64_t __swift_memcpy3_1(uint64_t result, __int16 *a2)
{
  __int16 v2;

  v2 = *a2;
  *(_BYTE *)(result + 2) = *((_BYTE *)a2 + 2);
  *(_WORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for PADSWClassifier.FrameProcessingOptions(unsigned __int16 *a1, unsigned int a2)
{
  int v2;
  unsigned int v4;
  BOOL v5;
  int v6;

  if (!a2)
    return 0;
  if (a2 >= 0xFF)
  {
    if ((a2 + 33554177) >> 24)
    {
      v2 = *((unsigned __int8 *)a1 + 3);
      if (*((_BYTE *)a1 + 3))
        return (*a1 | (*((unsigned __int8 *)a1 + 2) << 16) | (v2 << 24)) - 16776961;
    }
    else
    {
      v2 = *(unsigned __int16 *)((char *)a1 + 3);
      if (*(unsigned __int16 *)((char *)a1 + 3))
        return (*a1 | (*((unsigned __int8 *)a1 + 2) << 16) | (v2 << 24)) - 16776961;
    }
  }
  v4 = *(unsigned __int8 *)a1;
  v5 = v4 >= 2;
  v6 = (v4 + 2147483646) & 0x7FFFFFFF;
  if (!v5)
    v6 = -1;
  return (v6 + 1);
}

uint64_t storeEnumTagSinglePayload for PADSWClassifier.FrameProcessingOptions(uint64_t result, unsigned int a2, unsigned int a3)
{
  int v3;
  unsigned int v4;

  if ((a3 + 33554177) >> 24)
    v3 = 1;
  else
    v3 = 2;
  if (a3 <= 0xFE)
    v3 = 0;
  if (a2 > 0xFE)
  {
    *(_WORD *)result = a2 - 255;
    *(_BYTE *)(result + 2) = (a2 - 255) >> 16;
    if (v3)
    {
      v4 = ((a2 - 255) >> 24) + 1;
      if (v3 == 2)
        *(_WORD *)(result + 3) = v4;
      else
        *(_BYTE *)(result + 3) = v4;
    }
  }
  else
  {
    if (!v3)
      goto LABEL_10;
    if (v3 == 2)
    {
      *(_WORD *)(result + 3) = 0;
LABEL_10:
      if (!a2)
        return result;
LABEL_16:
      *(_BYTE *)result = a2 + 1;
      return result;
    }
    *(_BYTE *)(result + 3) = 0;
    if (a2)
      goto LABEL_16;
  }
  return result;
}

ValueMetadata *type metadata accessor for PADSWClassifier.FrameProcessingOptions()
{
  return &type metadata for PADSWClassifier.FrameProcessingOptions;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PADSWClassifierResult.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xE8)
    goto LABEL_17;
  if (a2 + 24 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 24) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 24;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 24;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 24;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x19;
  v8 = v6 - 25;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for PADSWClassifierResult.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 24 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 24) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xE8)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xE7)
    return ((uint64_t (*)(void))((char *)&loc_213BE3AA8 + 4 * byte_213C1484E[v4]))();
  *a1 = a2 + 24;
  return ((uint64_t (*)(void))((char *)sub_213BE3ADC + 4 * byte_213C14849[v4]))();
}

uint64_t sub_213BE3ADC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_213BE3AE4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x213BE3AECLL);
  return result;
}

uint64_t sub_213BE3AF8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x213BE3B00);
  *(_BYTE *)result = a2 + 24;
  return result;
}

uint64_t sub_213BE3B04(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_213BE3B0C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_213BE3B18(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_213BE3B20(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PADSWClassifierResult.CodingKeys()
{
  return &type metadata for PADSWClassifierResult.CodingKeys;
}

unint64_t sub_213BE3B3C()
{
  unint64_t result;

  result = qword_254D27CA8;
  if (!qword_254D27CA8)
  {
    result = MEMORY[0x2199BF420](&unk_213C14A74, &type metadata for PADSWClassifierResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D27CA8);
  }
  return result;
}

unint64_t sub_213BE3B84()
{
  unint64_t result;

  result = qword_254D27CB0;
  if (!qword_254D27CB0)
  {
    result = MEMORY[0x2199BF420](&unk_213C149E4, &type metadata for PADSWClassifierResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D27CB0);
  }
  return result;
}

unint64_t sub_213BE3BCC()
{
  unint64_t result;

  result = qword_254D27CB8;
  if (!qword_254D27CB8)
  {
    result = MEMORY[0x2199BF420](&unk_213C14A0C, &type metadata for PADSWClassifierResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D27CB8);
  }
  return result;
}

uint64_t sub_213BE3C10(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D27CC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_213BE3C58(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 120);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

uint64_t sub_213BE3C70(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_213BE3CC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t result;

  if (a16)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

_QWORD *sub_213BE3D90(_QWORD *a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  a2(*a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15], a1[16], a1[17], a1[18],
    a1[19]);
  return a1;
}

uint64_t sub_213BE3DF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t result;

  result = a16;
  if (a16)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_213BE3EC4(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_213BE3EEC(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_213BE3FB0(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_213BE3FD8(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

double sub_213BE4028(_OWORD *a1)
{
  double result;

  result = 0.0;
  a1[8] = 0u;
  a1[9] = 0u;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

uint64_t sub_213BE4044(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 24))(a2, a1, v5);
  return a2;
}

uint64_t sub_213BE4088(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_213BE40C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  type metadata accessor for PADSWAuditDataRecorder();
  v0 = swift_allocObject();
  v1 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v0 + 16) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v0 + 24) = v1;
  v2 = v0 + OBJC_IVAR____TtC10CoreIDVPAD22PADSWAuditDataRecorder_directory;
  v3 = sub_213C124F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 1, 1, v3);
  result = sub_213BF2898(0);
  if ((result & 1) == 0)
  {
    result = swift_release();
    v0 = 0;
  }
  qword_254D27CD8 = v0;
  return result;
}

uint64_t PADSWAuditDataRecorder.__allocating_init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = swift_allocObject();
  v1 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v0 + 16) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v0 + 24) = v1;
  v2 = v0 + OBJC_IVAR____TtC10CoreIDVPAD22PADSWAuditDataRecorder_directory;
  v3 = sub_213C124F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 1, 1, v3);
  if ((sub_213BF2898(0) & 1) == 0)
  {
    swift_release();
    return 0;
  }
  return v0;
}

uint64_t static PADSWAuditDataRecorder.shared.getter()
{
  if (qword_254D27958 != -1)
    swift_once();
  return swift_retain();
}

uint64_t PADSWAuditDataRecorder.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v0 + 16) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v0 + 24) = v1;
  v2 = v0 + OBJC_IVAR____TtC10CoreIDVPAD22PADSWAuditDataRecorder_directory;
  v3 = sub_213C124F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 1, 1, v3);
  if ((sub_213BF2898(0) & 1) == 0)
  {
    swift_release();
    return 0;
  }
  return v0;
}

uint64_t PADSWAuditDataRecorder.deinit()
{
  uint64_t v0;

  sub_213BE977C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_213BE4088(v0 + OBJC_IVAR____TtC10CoreIDVPAD22PADSWAuditDataRecorder_directory, &qword_254D27CE8);
  return v0;
}

uint64_t PADSWAuditDataRecorder.__deallocating_deinit()
{
  uint64_t v0;

  sub_213BE977C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_213BE4088(v0 + OBJC_IVAR____TtC10CoreIDVPAD22PADSWAuditDataRecorder_directory, &qword_254D27CE8);
  return swift_deallocClassInstance();
}

uint64_t sub_213BE4314()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  char *v37;
  double v38;
  double v39;
  id v40;
  void *v41;
  unsigned int v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  NSObject *v51;
  char *v52;
  os_log_type_t v53;
  uint8_t *v54;
  void *v55;
  uint64_t v56;
  unint64_t v57;
  void (*v58)(char *, uint64_t);
  id v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  id v65;
  id v66;
  NSObject *v67;
  os_log_type_t v68;
  uint8_t *v69;
  void *v70;
  uint64_t v71;
  unint64_t v72;
  char *v73;
  char *v74;
  uint64_t v75;
  char *v76;
  char *v77;
  char *v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  unint64_t v88;
  uint64_t v89;

  v1 = v0;
  v89 = *MEMORY[0x24BDAC8D0];
  v2 = sub_213C12588();
  v3 = *(_QWORD *)(v2 - 8);
  v84 = v2;
  v85 = v3;
  v4 = MEMORY[0x24BDAC7A8](v2);
  v79 = (char *)&v75 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v75 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v78 = (char *)&v75 - v9;
  v81 = sub_213C12564();
  v80 = *(_QWORD *)(v81 - 8);
  MEMORY[0x24BDAC7A8](v81);
  v11 = (char *)&v75 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D27CE8);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v76 = (char *)&v75 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v75 - v15;
  v17 = sub_213C124F8();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v77 = (char *)&v75 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v82 = (char *)&v75 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v83 = (char *)&v75 - v23;
  swift_beginAccess();
  v24 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v1 + 16) = MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(_QWORD *)(v1 + 24) = v24;
  swift_bridgeObjectRelease();
  v25 = (void *)objc_opt_self();
  v26 = objc_msgSend(v25, sel_defaultManager);
  v27 = objc_msgSend(v26, sel_URLsForDirectory_inDomains_, 13, 1);

  v28 = sub_213C12690();
  if (*(_QWORD *)(v28 + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v18 + 16))(v16, v28 + ((*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80)), v17);
    v29 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
    v29(v16, 0, 1, v17);
  }
  else
  {
    v29 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
    v29(v16, 1, 1, v17);
  }
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) != 1)
  {
    v37 = v83;
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v83, v16, v17);
    v87 = 0;
    v88 = 0xE000000000000000;
    sub_213C1287C();
    swift_bridgeObjectRelease();
    v87 = (id)0xD000000000000010;
    v88 = 0x8000000213C17970;
    sub_213C12558();
    sub_213C1254C();
    v39 = v38;
    (*(void (**)(char *, uint64_t))(v80 + 8))(v11, v81);
    if ((~*(_QWORD *)&v39 & 0x7FF0000000000000) != 0)
    {
      if (v39 > -9.22337204e18)
      {
        if (v39 < 9.22337204e18)
        {
          v81 = v18;
          v86 = (uint64_t)v39;
          sub_213C129FC();
          sub_213C12648();
          swift_bridgeObjectRelease();
          v16 = v82;
          sub_213C124C8();
          swift_bridgeObjectRelease();
          v40 = objc_msgSend(v25, sel_defaultManager);
          v41 = (void *)sub_213C124BC();
          v87 = 0;
          v42 = objc_msgSend(v40, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v41, 1, 0, &v87);

          v43 = v87;
          if (!v42)
          {
            v59 = v87;
            v60 = (void *)sub_213C1248C();

            swift_willThrow();
            v61 = v84;
            if (qword_254D27930 != -1)
              swift_once();
            v62 = __swift_project_value_buffer(v61, (uint64_t)qword_254D27938);
            v63 = v85;
            v64 = v79;
            (*(void (**)(char *, uint64_t, uint64_t))(v85 + 16))(v79, v62, v61);
            v65 = v60;
            v66 = v60;
            v67 = sub_213C12570();
            v68 = sub_213C1275C();
            if (os_log_type_enabled(v67, v68))
            {
              v69 = (uint8_t *)swift_slowAlloc();
              v70 = (void *)swift_slowAlloc();
              v87 = v70;
              *(_DWORD *)v69 = 136315138;
              swift_getErrorValue();
              v71 = sub_213C12A44();
              v86 = sub_213BEB0C8(v71, v72, (uint64_t *)&v87);
              sub_213C127F8();
              swift_bridgeObjectRelease();

              _os_log_impl(&dword_213BCD000, v67, v68, "Could not create Audit Data directory: %s", v69, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x2199BF4BC](v70, -1, -1);
              MEMORY[0x2199BF4BC](v69, -1, -1);

              (*(void (**)(char *, uint64_t))(v85 + 8))(v79, v61);
              v58 = *(void (**)(char *, uint64_t))(v81 + 8);
              goto LABEL_21;
            }

            (*(void (**)(char *, uint64_t))(v63 + 8))(v64, v61);
            v58 = *(void (**)(char *, uint64_t))(v81 + 8);
            v74 = v16;
LABEL_24:
            v58(v74, v17);
            v73 = v37;
            return ((uint64_t (*)(char *, uint64_t))v58)(v73, v17);
          }
          v25 = *(void **)(v81 + 16);
          v44 = (uint64_t)v76;
          ((void (*)(char *, char *, uint64_t))v25)(v76, v16, v17);
          v29((char *)v44, 0, 1, v17);
          v45 = v1 + OBJC_IVAR____TtC10CoreIDVPAD22PADSWAuditDataRecorder_directory;
          swift_beginAccess();
          v46 = v43;
          sub_213BECCE8(v44, v45);
          swift_endAccess();
          v1 = v84;
          if (qword_254D27930 == -1)
          {
LABEL_15:
            v47 = __swift_project_value_buffer(v1, (uint64_t)qword_254D27938);
            v48 = v85;
            v49 = v78;
            (*(void (**)(char *, uint64_t, uint64_t))(v85 + 16))(v78, v47, v1);
            v50 = v77;
            ((void (*)(char *, char *, uint64_t))v25)(v77, v16, v17);
            v51 = sub_213C12570();
            v52 = v16;
            v53 = sub_213C1275C();
            if (os_log_type_enabled(v51, v53))
            {
              v54 = (uint8_t *)swift_slowAlloc();
              v55 = (void *)swift_slowAlloc();
              v87 = v55;
              *(_DWORD *)v54 = 136315138;
              sub_213BDBB94(&qword_254D27F28, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
              v56 = sub_213C129FC();
              v86 = sub_213BEB0C8(v56, v57, (uint64_t *)&v87);
              sub_213C127F8();
              swift_bridgeObjectRelease();
              v58 = *(void (**)(char *, uint64_t))(v81 + 8);
              v58(v50, v17);
              _os_log_impl(&dword_213BCD000, v51, v53, "Will persist Audit Capture Data under: %s", v54, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x2199BF4BC](v55, -1, -1);
              MEMORY[0x2199BF4BC](v54, -1, -1);

              (*(void (**)(char *, uint64_t))(v85 + 8))(v78, v1);
LABEL_21:
              v58(v82, v17);
              v73 = v83;
              return ((uint64_t (*)(char *, uint64_t))v58)(v73, v17);
            }

            v58 = *(void (**)(char *, uint64_t))(v81 + 8);
            v58(v50, v17);
            (*(void (**)(char *, uint64_t))(v48 + 8))(v49, v1);
            v74 = v52;
            goto LABEL_24;
          }
LABEL_29:
          swift_once();
          goto LABEL_15;
        }
LABEL_28:
        __break(1u);
        goto LABEL_29;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_28;
  }
  sub_213BE4088((uint64_t)v16, &qword_254D27CE8);
  if (qword_254D27930 != -1)
    swift_once();
  v30 = v84;
  v31 = __swift_project_value_buffer(v84, (uint64_t)qword_254D27938);
  v32 = v85;
  (*(void (**)(char *, uint64_t, uint64_t))(v85 + 16))(v8, v31, v30);
  v33 = sub_213C12570();
  v34 = sub_213C1275C();
  if (os_log_type_enabled(v33, v34))
  {
    v35 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v35 = 0;
    _os_log_impl(&dword_213BCD000, v33, v34, "Could not derive base URL for Audit Data directory", v35, 2u);
    MEMORY[0x2199BF4BC](v35, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v8, v30);
}

uint64_t sub_213BE4D58(__int128 *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
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
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE *v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t, uint64_t);
  void (*v52)(unint64_t, _BYTE *, uint64_t);
  uint64_t v53;
  _BYTE *v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  _BYTE *v58;
  uint64_t ObjCClassFromMetadata;
  id v60;
  void *v61;
  void *v62;
  id v63;
  _BYTE *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  _BYTE *v69;
  void *v70;
  char **p_name;
  id v72;
  uint64_t v73;
  void *v74;
  unsigned int v75;
  _BYTE *v76;
  id v77;
  void *v78;
  void *v79;
  unsigned int v80;
  void (*v81)(_BYTE *, uint64_t);
  id v82;
  uint64_t v83;
  _BYTE *v84;
  uint64_t v85;
  uint64_t v86;
  NSObject *v87;
  os_log_type_t v88;
  uint8_t *v89;
  id v90;
  void *v91;
  unsigned int v92;
  uint64_t v93;
  void (*v94)(_BYTE *, _BYTE *, uint64_t);
  _BYTE *v95;
  uint64_t v96;
  _BYTE *v97;
  uint64_t v98;
  _BYTE *v99;
  unint64_t v100;
  uint64_t v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  void (*v109)(unint64_t, _BYTE *, uint64_t);
  _BYTE *v110;
  uint64_t v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _BYTE *v119;
  unint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  _BYTE *v124;
  NSObject *v125;
  os_log_type_t v126;
  uint8_t *v127;
  void (*v128)(_BYTE *, uint64_t);
  uint64_t v129;
  uint64_t v130;
  id v131;
  void *v132;
  uint64_t v133;
  uint64_t v134;
  _BYTE *v135;
  id v136;
  id v137;
  NSObject *v138;
  os_log_type_t v139;
  _BOOL4 v140;
  uint8_t *v141;
  uint8_t *v142;
  uint64_t v143;
  unint64_t v144;
  _BYTE *v145;
  void (*v146)(_BYTE *, uint64_t);
  uint64_t v147;
  _BYTE *v148;
  _BYTE v149[16];
  uint64_t (*v150)(uint64_t, uint64_t, uint64_t);
  _BYTE *v151;
  _BYTE *v152;
  _BYTE *v153;
  _BYTE *v154;
  void (*v155)(unint64_t, _BYTE *, uint64_t);
  uint64_t v156;
  uint64_t v157;
  _BYTE *v158;
  _BYTE *v159;
  _BYTE *v160;
  _BYTE *v161;
  _BYTE *v162;
  _BYTE *v163;
  _BYTE *v164;
  uint64_t v165;
  _BYTE *v166;
  _BYTE *v167;
  uint64_t v168;
  _BYTE *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  _OWORD v173[15];
  uint64_t v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  uint64_t v190;
  uint64_t v191;

  v156 = a2;
  v191 = *MEMORY[0x24BDAC8D0];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D27CF0);
  MEMORY[0x24BDAC7A8](v6);
  v162 = &v149[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = sub_213C12588();
  v170 = *(_QWORD *)(v8 - 8);
  v171 = v8;
  v9 = MEMORY[0x24BDAC7A8](v8);
  v152 = &v149[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = MEMORY[0x24BDAC7A8](v9);
  v160 = &v149[-v12];
  v13 = MEMORY[0x24BDAC7A8](v11);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v163 = &v149[-v15];
  MEMORY[0x24BDAC7A8](v14);
  v159 = &v149[-v16];
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D27CE8);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v161 = &v149[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v18);
  v21 = &v149[-v20];
  v22 = sub_213C124F8();
  v23 = *(_QWORD *)(v22 - 8);
  v24 = MEMORY[0x24BDAC7A8](v22);
  v158 = &v149[-((v25 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v26 = MEMORY[0x24BDAC7A8](v24);
  v169 = &v149[-v27];
  v28 = MEMORY[0x24BDAC7A8](v26);
  v153 = &v149[-v29];
  v30 = MEMORY[0x24BDAC7A8](v28);
  v164 = &v149[-v31];
  v32 = MEMORY[0x24BDAC7A8](v30);
  v166 = &v149[-v33];
  v34 = MEMORY[0x24BDAC7A8](v32);
  v154 = &v149[-v35];
  v36 = MEMORY[0x24BDAC7A8](v34);
  v38 = &v149[-v37];
  v157 = v39;
  MEMORY[0x24BDAC7A8](v36);
  v41 = &v149[-v40];
  v42 = a1[13];
  v187 = a1[12];
  v188 = v42;
  v189 = a1[14];
  v190 = *((_QWORD *)a1 + 30);
  v43 = a1[9];
  v183 = a1[8];
  v184 = v43;
  v44 = a1[11];
  v185 = a1[10];
  v186 = v44;
  v45 = a1[5];
  v179 = a1[4];
  v180 = v45;
  v46 = a1[7];
  v181 = a1[6];
  v182 = v46;
  v47 = a1[1];
  v175 = *a1;
  v176 = v47;
  v48 = a1[3];
  v49 = v3 + OBJC_IVAR____TtC10CoreIDVPAD22PADSWAuditDataRecorder_directory;
  v177 = a1[2];
  v178 = v48;
  swift_beginAccess();
  sub_213BEB708(v49, (uint64_t)v21);
  v50 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v23 + 48);
  if (v50((uint64_t)v21, 1, v22) == 1)
    return sub_213BE4088((uint64_t)v21, &qword_254D27CE8);
  v150 = v50;
  v168 = v23;
  v52 = *(void (**)(unint64_t, _BYTE *, uint64_t))(v23 + 32);
  v165 = v22;
  v155 = v52;
  v52((unint64_t)v41, v21, v22);
  v167 = v41;
  sub_213C124C8();
  v151 = v38;
  if (a3 >> 60 == 15)
  {
    v53 = v168;
    v54 = v166;
  }
  else
  {
    sub_213C12534();
    v54 = v166;
    v53 = v168;
  }
  sub_213C12474();
  swift_allocObject();
  sub_213C12468();
  v173[12] = v187;
  v173[13] = v188;
  v173[14] = v189;
  v174 = v190;
  v173[8] = v183;
  v173[9] = v184;
  v173[10] = v185;
  v173[11] = v186;
  v173[4] = v179;
  v173[5] = v180;
  v173[6] = v181;
  v173[7] = v182;
  v173[0] = v175;
  v173[1] = v176;
  v173[2] = v177;
  v173[3] = v178;
  sub_213BEB750();
  v55 = sub_213C1245C();
  v57 = v56;
  swift_release();
  v58 = v154;
  sub_213C124C8();
  sub_213C12534();
  (*(void (**)(_BYTE *, uint64_t))(v53 + 8))(v58, v165);
  sub_213BEBA50(v55, v57);
  type metadata accessor for PADSWClassifier();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v60 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v61 = (void *)sub_213C125E8();
  v62 = (void *)sub_213C125E8();
  v63 = objc_msgSend(v60, sel_URLForResource_withExtension_, v61, v62);

  if (!v63)
  {
    v67 = v168;
    v65 = (uint64_t)v161;
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v168 + 56))(v161, 1, 1, v165);
    v69 = v167;
    goto LABEL_12;
  }
  v64 = v164;
  sub_213C124D4();

  v65 = (uint64_t)v161;
  v66 = v165;
  v155((unint64_t)v161, v64, v165);
  v67 = v168;
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v168 + 56))(v65, 0, 1, v66);
  v68 = v150(v65, 1, v66);
  v69 = v167;
  if (v68 == 1)
  {
LABEL_12:
    sub_213BE4088(v65, &qword_254D27CE8);
LABEL_13:
    v84 = v159;
    p_name = &stru_24D0D4FF8.name;
    if (qword_254D27930 != -1)
      swift_once();
    v85 = v171;
    v86 = __swift_project_value_buffer(v171, (uint64_t)qword_254D27938);
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v170 + 16))(v84, v86, v85);
    v87 = sub_213C12570();
    v88 = sub_213C12750();
    if (os_log_type_enabled(v87, v88))
    {
      v89 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v89 = 0;
      _os_log_impl(&dword_213BCD000, v87, v88, "Could not find original SIML params to save to Audit Data directory", v89, 2u);
      MEMORY[0x2199BF4BC](v89, -1, -1);
    }

    (*(void (**)(_BYTE *, uint64_t))(v170 + 8))(v84, v171);
    goto LABEL_18;
  }
  v155((unint64_t)v54, (_BYTE *)v65, v66);
  v70 = (void *)objc_opt_self();
  p_name = &stru_24D0D4FF8.name;
  v72 = objc_msgSend(v70, sel_defaultManager);
  v73 = v66;
  sub_213C124E0();
  v74 = (void *)sub_213C125E8();
  swift_bridgeObjectRelease();
  v75 = objc_msgSend(v72, sel_fileExistsAtPath_, v74);

  if (!v75)
  {
    v130 = v73;
    v67 = v168;
    (*(void (**)(_BYTE *, uint64_t))(v168 + 8))(v54, v130);
    goto LABEL_13;
  }
  v76 = v153;
  sub_213C124C8();
  v77 = objc_msgSend(v70, sel_defaultManager);
  v78 = (void *)sub_213C124BC();
  v79 = (void *)sub_213C124BC();
  *(_QWORD *)&v173[0] = 0;
  v80 = objc_msgSend(v77, sel_copyItemAtURL_toURL_error_, v78, v79, v173);

  if (v80)
  {
    v67 = v168;
    v81 = *(void (**)(_BYTE *, uint64_t))(v168 + 8);
    v82 = *(id *)&v173[0];
    v83 = v165;
    v81(v76, v165);
    v81(v54, v83);
    v69 = v167;
  }
  else
  {
    v131 = *(id *)&v173[0];
    v132 = (void *)sub_213C1248C();

    swift_willThrow();
    v67 = v168;
    if (qword_254D27930 != -1)
      swift_once();
    v133 = v171;
    v134 = __swift_project_value_buffer(v171, (uint64_t)qword_254D27938);
    v135 = v152;
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v170 + 16))(v152, v134, v133);
    v136 = v132;
    v137 = v132;
    v138 = sub_213C12570();
    v139 = sub_213C1275C();
    v140 = os_log_type_enabled(v138, v139);
    v69 = v167;
    if (v140)
    {
      v141 = (uint8_t *)swift_slowAlloc();
      v161 = (_BYTE *)swift_slowAlloc();
      *(_QWORD *)&v173[0] = v161;
      *(_DWORD *)v141 = 136315138;
      v160 = v141 + 4;
      v142 = v141;
      swift_getErrorValue();
      v143 = sub_213C12A44();
      v172 = sub_213BEB0C8(v143, v144, (uint64_t *)v173);
      v69 = v167;
      sub_213C127F8();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_213BCD000, v138, v139, "Could not persist parameters to Audit Data directory: %s", v142, 0xCu);
      v145 = v161;
      swift_arrayDestroy();
      MEMORY[0x2199BF4BC](v145, -1, -1);
      MEMORY[0x2199BF4BC](v142, -1, -1);

      (*(void (**)(_BYTE *, uint64_t))(v170 + 8))(v152, v171);
      v146 = *(void (**)(_BYTE *, uint64_t))(v67 + 8);
      v147 = v165;
      v146(v153, v165);
      v148 = v166;
    }
    else
    {

      (*(void (**)(_BYTE *, uint64_t))(v170 + 8))(v135, v171);
      v146 = *(void (**)(_BYTE *, uint64_t))(v67 + 8);
      v147 = v165;
      v146(v153, v165);
      v148 = v54;
    }
    v146(v148, v147);
    p_name = (char **)(&stru_24D0D4FF8 + 8);
  }
LABEL_18:
  sub_213C124C8();
  v90 = objc_msgSend((id)objc_opt_self(), p_name[410]);
  sub_213C124E0();
  v91 = (void *)sub_213C125E8();
  swift_bridgeObjectRelease();
  v92 = objc_msgSend(v90, sel_fileExistsAtPath_, v91);

  if (v92)
  {
    v93 = sub_213C12708();
    v166 = *(_BYTE **)(*(_QWORD *)(v93 - 8) + 56);
    ((void (*)(_BYTE *, uint64_t, uint64_t, uint64_t))v166)(v162, 1, 1, v93);
    v94 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v67 + 16);
    v95 = v164;
    v96 = v165;
    v94(v164, v169, v165);
    v97 = v158;
    v94(v158, v69, v96);
    v98 = *(unsigned __int8 *)(v168 + 80);
    v160 = (_BYTE *)(v98 | 7);
    v161 = (_BYTE *)((v98 + 280) & ~v98);
    v99 = v161;
    v100 = (unint64_t)&v161[v157 + v98] & ~v98;
    v159 = (_BYTE *)(v100 + v157);
    v101 = swift_allocObject();
    *(_QWORD *)(v101 + 16) = 0;
    *(_QWORD *)(v101 + 24) = 0;
    v102 = v188;
    *(_OWORD *)(v101 + 224) = v187;
    *(_OWORD *)(v101 + 240) = v102;
    *(_OWORD *)(v101 + 256) = v189;
    *(_QWORD *)(v101 + 272) = v190;
    v103 = v184;
    *(_OWORD *)(v101 + 160) = v183;
    *(_OWORD *)(v101 + 176) = v103;
    v104 = v186;
    *(_OWORD *)(v101 + 192) = v185;
    *(_OWORD *)(v101 + 208) = v104;
    v105 = v180;
    *(_OWORD *)(v101 + 96) = v179;
    *(_OWORD *)(v101 + 112) = v105;
    v106 = v182;
    *(_OWORD *)(v101 + 128) = v181;
    *(_OWORD *)(v101 + 144) = v106;
    v107 = v176;
    *(_OWORD *)(v101 + 32) = v175;
    *(_OWORD *)(v101 + 48) = v107;
    v108 = v178;
    *(_OWORD *)(v101 + 64) = v177;
    *(_OWORD *)(v101 + 80) = v108;
    v109 = v155;
    v155((unint64_t)&v99[v101], v95, v96);
    v109(v101 + v100, v97, v96);
    sub_213BDF1F8((uint64_t)&v175);
    v110 = v162;
    sub_213BE6C70((uint64_t)v162, (uint64_t)&unk_254D27D08, v101);
    swift_release();
    ((void (*)(_BYTE *, uint64_t, uint64_t, uint64_t))v166)(v110, 1, 1, v93);
    v94(v95, v167, v96);
    v94(v97, v169, v96);
    v111 = swift_allocObject();
    *(_QWORD *)(v111 + 16) = 0;
    *(_QWORD *)(v111 + 24) = 0;
    v112 = v188;
    *(_OWORD *)(v111 + 224) = v187;
    *(_OWORD *)(v111 + 240) = v112;
    *(_OWORD *)(v111 + 256) = v189;
    *(_QWORD *)(v111 + 272) = v190;
    v113 = v184;
    *(_OWORD *)(v111 + 160) = v183;
    *(_OWORD *)(v111 + 176) = v113;
    v114 = v186;
    *(_OWORD *)(v111 + 192) = v185;
    *(_OWORD *)(v111 + 208) = v114;
    v115 = v180;
    *(_OWORD *)(v111 + 96) = v179;
    *(_OWORD *)(v111 + 112) = v115;
    v116 = v182;
    *(_OWORD *)(v111 + 128) = v181;
    *(_OWORD *)(v111 + 144) = v116;
    v117 = v176;
    *(_OWORD *)(v111 + 32) = v175;
    *(_OWORD *)(v111 + 48) = v117;
    v118 = v178;
    v119 = &v161[v111];
    *(_OWORD *)(v111 + 64) = v177;
    *(_OWORD *)(v111 + 80) = v118;
    v109((unint64_t)v119, v95, v96);
    v120 = v111 + v100;
    v121 = v96;
    v69 = v167;
    v67 = v168;
    v109(v120, v97, v121);
    sub_213BDF1F8((uint64_t)&v175);
    sub_213BE851C((uint64_t)v110, (uint64_t)&unk_254D27D18, v111);
    swift_release();
  }
  if (qword_254D27930 != -1)
    swift_once();
  v122 = v171;
  v123 = __swift_project_value_buffer(v171, (uint64_t)qword_254D27938);
  v124 = v163;
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v170 + 16))(v163, v123, v122);
  v125 = sub_213C12570();
  v126 = sub_213C1275C();
  if (os_log_type_enabled(v125, v126))
  {
    v127 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v127 = 0;
    _os_log_impl(&dword_213BCD000, v125, v126, "Did persist Audit capture data", v127, 2u);
    MEMORY[0x2199BF4BC](v127, -1, -1);
  }

  (*(void (**)(_BYTE *, uint64_t))(v170 + 8))(v124, v171);
  v128 = *(void (**)(_BYTE *, uint64_t))(v67 + 8);
  v129 = v165;
  v128(v169, v165);
  v128(v151, v129);
  return ((uint64_t (*)(_BYTE *, uint64_t))v128)(v69, v129);
}

uint64_t sub_213BE5FA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v6[15] = a5;
  v6[16] = a6;
  v6[14] = a4;
  v7 = sub_213C12588();
  v6[17] = v7;
  v6[18] = *(_QWORD *)(v7 - 8);
  v6[19] = swift_task_alloc();
  v6[20] = swift_task_alloc();
  v6[21] = swift_task_alloc();
  v8 = sub_213C124F8();
  v6[22] = v8;
  v6[23] = *(_QWORD *)(v8 - 8);
  v6[24] = swift_task_alloc();
  v6[25] = swift_task_alloc();
  v6[26] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_213BE6094()
{
  uint64_t v0;
  uint64_t v1;
  int64_t v2;
  int64_t *v3;
  int64_t v4;
  CMTimeValue value;
  uint64_t v6;
  CMTimeEpoch epoch;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v17;
  CMTime v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 112) + 48);
  *(_QWORD *)(v0 + 80) = v1;
  *(_QWORD *)(v0 + 216) = v1;
  v2 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(v0 + 224) = v2;
  if (v2)
  {
    v17 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_213C0D540(0, v2, 0);
    v3 = (int64_t *)(v1 + 32);
    do
    {
      v4 = *v3++;
      CMTimeMake(&v18, v4, 1000000000);
      value = v18.value;
      v6 = *(_QWORD *)&v18.timescale;
      epoch = v18.epoch;
      v9 = *(_QWORD *)(v17 + 16);
      v8 = *(_QWORD *)(v17 + 24);
      if (v9 >= v8 >> 1)
        sub_213C0D540(v8 > 1, v9 + 1, 1);
      *(_QWORD *)(v0 + 232) = v17;
      *(_QWORD *)(v17 + 16) = v9 + 1;
      v10 = (_QWORD *)(v17 + 24 * v9);
      v10[4] = value;
      v10[5] = v6;
      v10[6] = epoch;
      --v2;
    }
    while (v2);
    v11 = *(_QWORD *)(v0 + 208);
    v12 = *(_QWORD *)(v0 + 176);
    v13 = *(_QWORD *)(v0 + 184);
    v14 = *(_QWORD *)(v0 + 120);
    sub_213BE3EC4(v0 + 80);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v11, v14, v12);
    type metadata accessor for PADAVAssetReader();
    swift_allocObject();
    v15 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 240) = v15;
    *v15 = v0;
    v15[1] = sub_213BE62C0;
    return sub_213BF5A40(*(_QWORD *)(v0 + 208));
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_213BE62C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 248) = a1;
  *(_QWORD *)(v3 + 256) = v1;
  swift_task_dealloc();
  if (v1)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_213BE6380()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t (*v3)(void);
  unint64_t v4;
  id v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  uint64_t v9;
  id v10;
  unint64_t v11;
  unint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  NSObject *v32;
  os_log_type_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55[3];

  v55[2] = *MEMORY[0x24BDAC8D0];
  v1 = v0[32];
  v2 = sub_213BF7098(v0[29]);
  if (v1)
  {
    swift_release();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v3 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    v4 = v2;
    swift_release();
    sub_213C124C8();
    v5 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
    v6 = (void *)sub_213C124BC();
    v0[9] = 0;
    v7 = objc_msgSend(v5, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v6, 1, 0, v0 + 9);

    v8 = (void *)v0[9];
    if ((v7 & 1) != 0)
    {
      v53 = *(_QWORD *)(v4 + 16);
      if (v53)
      {
        v50 = v0[23];
        v9 = v0[18];
        v10 = v8;
        v11 = 0;
        v12 = (unint64_t *)(v4 + 40);
        do
        {
          v15 = *(v12 - 1);
          v16 = *v12;
          if (v11 >= v0[28])
          {
            sub_213BECCA4(*(v12 - 1), *v12);
            if (qword_254D27930 != -1)
              swift_once();
            v18 = v0[21];
            v19 = v0[17];
            v20 = __swift_project_value_buffer(v19, (uint64_t)qword_254D27938);
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v18, v20, v19);
            v21 = sub_213C12570();
            v22 = sub_213C1275C();
            if (os_log_type_enabled(v21, v22))
            {
              v23 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v23 = 0;
              _os_log_impl(&dword_213BCD000, v21, v22, "Unable to save ID matching frame to Data Auditing directory: no corresponding timestamp", v23, 2u);
              MEMORY[0x2199BF4BC](v23, -1, -1);
            }
            v13 = v0[21];
            v14 = v0[17];
            sub_213BEBA50(v15, v16);

            (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v13, v14);
          }
          else
          {
            v0[11] = *(_QWORD *)(v0[27] + 8 * v11 + 32);
            sub_213BECCA4(v15, v16);
            v55[0] = sub_213C129FC();
            v55[1] = v17;
            sub_213C12648();
            sub_213C124C8();
            swift_bridgeObjectRelease();
            sub_213C12534();
            (*(void (**)(_QWORD, _QWORD))(v50 + 8))(v0[24], v0[22]);
            sub_213BEBA50(v15, v16);
          }
          ++v11;
          v12 += 2;
        }
        while (v53 != v11);
      }
      else
      {
        v45 = v8;
      }
      v46 = v0[25];
      v47 = v0[22];
      v48 = v0[23];
      swift_release();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v46, v47);
    }
    else
    {
      v24 = v8;
      swift_bridgeObjectRelease();
      v25 = (void *)sub_213C1248C();

      swift_willThrow();
      if (qword_254D27930 != -1)
        swift_once();
      v26 = v0[20];
      v27 = v0[17];
      v28 = v0[18];
      v29 = __swift_project_value_buffer(v27, (uint64_t)qword_254D27938);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16))(v26, v29, v27);
      v30 = v25;
      v31 = v25;
      v32 = sub_213C12570();
      v33 = sub_213C1275C();
      v34 = os_log_type_enabled(v32, v33);
      v35 = v0[25];
      v36 = v0[22];
      v37 = v0[23];
      v38 = v0[20];
      v39 = v0[17];
      v40 = v0[18];
      if (v34)
      {
        v54 = v0[25];
        v52 = v0[17];
        v41 = (uint8_t *)swift_slowAlloc();
        v51 = v37;
        v42 = swift_slowAlloc();
        v55[0] = v42;
        *(_DWORD *)v41 = 136315138;
        swift_getErrorValue();
        v43 = sub_213C12A44();
        v0[13] = sub_213BEB0C8(v43, v44, v55);
        sub_213C127F8();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_213BCD000, v32, v33, "Unable to save ID matching frames for Data Auditing: %s", v41, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2199BF4BC](v42, -1, -1);
        MEMORY[0x2199BF4BC](v41, -1, -1);
        swift_release();

        (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v38, v52);
        (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v54, v36);
      }
      else
      {
        swift_release();

        (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v38, v39);
        (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v35, v36);
      }
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v3 = (uint64_t (*)(void))v0[1];
  }
  return v3();
}

uint64_t sub_213BE6BC4()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_213BE6C70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_213C12708();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_213C126FC();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_213BE4088(a1, &qword_254D27CF0);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_213C126E4();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_213BE6DA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v6[28] = a5;
  v6[29] = a6;
  v6[27] = a4;
  v7 = sub_213C12588();
  v6[30] = v7;
  v6[31] = *(_QWORD *)(v7 - 8);
  v6[32] = swift_task_alloc();
  v6[33] = swift_task_alloc();
  v6[34] = swift_task_alloc();
  v6[35] = swift_task_alloc();
  v8 = sub_213C124F8();
  v6[36] = v8;
  v6[37] = *(_QWORD *)(v8 - 8);
  v6[38] = swift_task_alloc();
  v6[39] = swift_task_alloc();
  v6[40] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_213BE6EA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  id v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 216) + 40);
  *(_QWORD *)(v0 + 208) = v1;
  *(_QWORD *)(v0 + 328) = v1;
  v2 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(v0 + 336) = v2;
  if (!v2)
  {
LABEL_12:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v32 = v0 + 208;
  swift_bridgeObjectRetain();
  v3 = 0;
  while (1)
  {
    *(_QWORD *)(v0 + 344) = v3;
    v4 = *(_QWORD *)(*(_QWORD *)(v0 + 328) + 8 * v3 + 32);
    *(_QWORD *)(v0 + 352) = v4;
    if (*(_QWORD *)(v4 + 16))
      break;
LABEL_4:
    v3 = *(_QWORD *)(v0 + 344) + 1;
    if (v3 == *(_QWORD *)(v0 + 336))
    {
      sub_213BE3EC4(v32);
      goto LABEL_12;
    }
  }
  *(_QWORD *)(v0 + 112) = 792936774;
  *(_QWORD *)(v0 + 120) = 0xE400000000000000;
  *(_QWORD *)(v0 + 152) = v3;
  swift_bridgeObjectRetain();
  sub_213C129FC();
  sub_213C12648();
  swift_bridgeObjectRelease();
  sub_213C124C8();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend((id)objc_opt_self(), sel_defaultManager, v32);
  v6 = (void *)sub_213C124BC();
  *(_QWORD *)(v0 + 184) = 0;
  v7 = objc_msgSend(v5, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v6, 1, 0, v0 + 184);

  v8 = *(void **)(v0 + 184);
  if (!v7)
  {
    v9 = v8;
    swift_bridgeObjectRelease();
    v10 = (void *)sub_213C1248C();

    swift_willThrow();
    if (qword_254D27930 != -1)
      swift_once();
    v11 = *(_QWORD *)(v0 + 264);
    v12 = *(_QWORD *)(v0 + 240);
    v13 = *(_QWORD *)(v0 + 248);
    v14 = __swift_project_value_buffer(v12, (uint64_t)qword_254D27938);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v11, v14, v12);
    v15 = v10;
    v16 = v10;
    v17 = sub_213C12570();
    v18 = sub_213C1275C();
    v19 = os_log_type_enabled(v17, v18);
    v20 = *(_QWORD *)(v0 + 320);
    v21 = *(_QWORD *)(v0 + 288);
    v34 = *(_QWORD *)(v0 + 296);
    v22 = *(_QWORD *)(v0 + 264);
    v23 = *(_QWORD *)(v0 + 240);
    v24 = *(_QWORD *)(v0 + 248);
    if (v19)
    {
      v25 = swift_slowAlloc();
      v33 = v21;
      v26 = swift_slowAlloc();
      v35[0] = v26;
      *(_DWORD *)v25 = 136315138;
      swift_getErrorValue();
      v27 = sub_213C12A44();
      *(_QWORD *)(v25 + 4) = sub_213BEB0C8(v27, v28, v35);
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_213BCD000, v17, v18, "Could not create gesture FAC Data Auditing directory: %s", (uint8_t *)v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199BF4BC](v26, -1, -1);
      MEMORY[0x2199BF4BC](v25, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v22, v23);
      (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v20, v33);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v22, v23);
      (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v20, v21);
    }
    goto LABEL_4;
  }
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 296) + 16))(*(_QWORD *)(v0 + 312), *(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 288));
  type metadata accessor for PADAVAssetReader();
  swift_allocObject();
  v30 = v8;
  v31 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 360) = v31;
  *v31 = v0;
  v31[1] = sub_213BE7368;
  return sub_213BF5A40(*(_QWORD *)(v0 + 312));
}

uint64_t sub_213BE7368(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 368) = a1;
  *(_QWORD *)(v3 + 376) = v1;
  swift_task_dealloc();
  if (v1)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_213BE7428()
{
  uint64_t v0;
  uint64_t v1;
  int64_t v2;
  CMTimeValue v3;
  int64_t *v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  NSObject *v20;
  os_log_type_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  id v64;
  void *v65;
  unsigned int v66;
  void *v67;
  id v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  id v75;
  NSObject *v76;
  os_log_type_t v77;
  _BOOL4 v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  _QWORD *v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  _QWORD *v94;
  unint64_t *v95;
  uint64_t v96[3];

  v96[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(v0 + 352);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    *(_QWORD *)(v0 + 144) = MEMORY[0x24BEE4AF8];
    sub_213C0D540(0, v2, 0);
    v3 = *(_QWORD *)(v0 + 144);
    v4 = (int64_t *)(v1 + 32);
    do
    {
      v5 = *v4++;
      CMTimeMake((CMTime *)(v0 + 16), v5, 1000000000);
      v6 = *(_QWORD *)(v0 + 16);
      v7 = *(_QWORD *)(v0 + 24);
      v8 = *(_QWORD *)(v0 + 32);
      *(_QWORD *)(v0 + 144) = v3;
      v10 = *(_QWORD *)(v3 + 16);
      v9 = *(_QWORD *)(v3 + 24);
      if (v10 >= v9 >> 1)
      {
        sub_213C0D540(v9 > 1, v10 + 1, 1);
        v3 = *(_QWORD *)(v0 + 144);
      }
      *(_QWORD *)(v3 + 16) = v10 + 1;
      v11 = (_QWORD *)(v3 + 24 * v10);
      v11[4] = v6;
      v11[5] = v7;
      v11[6] = v8;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v3 = MEMORY[0x24BEE4AF8];
  }
  v12 = *(void **)(v0 + 376);
  v13 = sub_213BF7098(v3);
  if (v12)
  {
    swift_bridgeObjectRelease();
    if (qword_254D27930 != -1)
      swift_once();
    v14 = *(_QWORD *)(v0 + 280);
    v15 = *(_QWORD *)(v0 + 240);
    v16 = *(_QWORD *)(v0 + 248);
    v17 = __swift_project_value_buffer(v15, (uint64_t)qword_254D27938);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v14, v17, v15);
    v18 = v12;
    v19 = v12;
    v20 = sub_213C12570();
    v21 = sub_213C1275C();
    v22 = os_log_type_enabled(v20, v21);
    v23 = *(_QWORD *)(v0 + 320);
    v24 = *(_QWORD *)(v0 + 288);
    v25 = *(_QWORD *)(v0 + 296);
    v26 = *(_QWORD *)(v0 + 280);
    v27 = *(_QWORD *)(v0 + 240);
    v28 = *(_QWORD *)(v0 + 248);
    if (v22)
    {
      v93 = *(_QWORD *)(v0 + 280);
      v89 = *(_QWORD *)(v0 + 240);
      v29 = (uint8_t *)swift_slowAlloc();
      v88 = v25;
      v30 = swift_slowAlloc();
      v96[0] = v30;
      *(_DWORD *)v29 = 136315138;
      swift_getErrorValue();
      v31 = sub_213C12A44();
      *(_QWORD *)(v0 + 176) = sub_213BEB0C8(v31, v32, v96);
      sub_213C127F8();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_213BCD000, v20, v21, "Could not read frames for gesture FAC Data auditing: %s", v29, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199BF4BC](v30, -1, -1);
      MEMORY[0x2199BF4BC](v29, -1, -1);
      swift_release();

      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v93, v89);
      (*(void (**)(uint64_t, uint64_t))(v88 + 8))(v23, v24);
    }
    else
    {
      swift_release();

      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v26, v27);
      (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v23, v24);
    }
  }
  else
  {
    v33 = v13;
    v91 = *(_QWORD *)(v3 + 16);
    if (v91)
    {
      v34 = 0;
      v35 = (_QWORD *)(v3 + 32);
      v95 = (unint64_t *)(v13 + 40);
      v87 = v13;
      do
      {
        v43 = *v35;
        v35 += 3;
        v42 = v43;
        *(_QWORD *)(v0 + 192) = v43;
        *(_QWORD *)(v0 + 128) = sub_213C129FC();
        *(_QWORD *)(v0 + 136) = v44;
        sub_213C12648();
        sub_213C124C8();
        swift_bridgeObjectRelease();
        if (v34 >= *(_QWORD *)(v33 + 16))
        {
          if (qword_254D27930 != -1)
            swift_once();
          v94 = v35;
          v47 = *(_QWORD *)(v0 + 272);
          v48 = *(_QWORD *)(v0 + 240);
          v49 = *(_QWORD *)(v0 + 248);
          v50 = __swift_project_value_buffer(v48, (uint64_t)qword_254D27938);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v49 + 16))(v47, v50, v48);
          v51 = sub_213C12570();
          v52 = sub_213C1275C();
          if (os_log_type_enabled(v51, v52))
          {
            v53 = swift_slowAlloc();
            *(_DWORD *)v53 = 134217984;
            *(_QWORD *)(v53 + 4) = v42;
            _os_log_impl(&dword_213BCD000, v51, v52, "Unable to write FAC frame to Data Auditing directory: no frame at timestamp %lld", (uint8_t *)v53, 0xCu);
            MEMORY[0x2199BF4BC](v53, -1, -1);
          }
          v37 = *(_QWORD *)(v0 + 296);
          v36 = *(_QWORD *)(v0 + 304);
          v38 = *(_QWORD *)(v0 + 288);
          v39 = *(_QWORD *)(v0 + 272);
          v40 = *(_QWORD *)(v0 + 240);
          v41 = *(_QWORD *)(v0 + 248);

          (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v39, v40);
          (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v36, v38);
          v33 = v87;
          v35 = v94;
        }
        else
        {
          v46 = *(v95 - 1);
          v45 = *v95;
          sub_213BECCA4(v46, *v95);
          sub_213C12534();
          (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 296) + 8))(*(_QWORD *)(v0 + 304), *(_QWORD *)(v0 + 288));
          sub_213BEBA50(v46, v45);
        }
        ++v34;
        v95 += 2;
      }
      while (v91 != v34);
    }
    swift_bridgeObjectRelease();
    swift_release();
    v54 = *(_QWORD *)(v0 + 320);
    v55 = *(_QWORD *)(v0 + 288);
    v56 = *(_QWORD *)(v0 + 296);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v54, v55);
  }
  v57 = *(_QWORD *)(v0 + 344) + 1;
  if (v57 == *(_QWORD *)(v0 + 336))
  {
LABEL_26:
    sub_213BE3EC4(v0 + 208);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  while (1)
  {
    *(_QWORD *)(v0 + 344) = v57;
    v63 = *(_QWORD *)(*(_QWORD *)(v0 + 328) + 8 * v57 + 32);
    *(_QWORD *)(v0 + 352) = v63;
    if (*(_QWORD *)(v63 + 16))
      break;
LABEL_29:
    v57 = *(_QWORD *)(v0 + 344) + 1;
    if (v57 == *(_QWORD *)(v0 + 336))
      goto LABEL_26;
  }
  *(_QWORD *)(v0 + 112) = 792936774;
  *(_QWORD *)(v0 + 120) = 0xE400000000000000;
  *(_QWORD *)(v0 + 152) = v57;
  swift_bridgeObjectRetain();
  sub_213C129FC();
  sub_213C12648();
  swift_bridgeObjectRelease();
  sub_213C124C8();
  swift_bridgeObjectRelease();
  v64 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v65 = (void *)sub_213C124BC();
  *(_QWORD *)(v0 + 184) = 0;
  v66 = objc_msgSend(v64, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v65, 1, 0, v0 + 184);

  v67 = *(void **)(v0 + 184);
  if (!v66)
  {
    v68 = v67;
    swift_bridgeObjectRelease();
    v69 = (void *)sub_213C1248C();

    swift_willThrow();
    if (qword_254D27930 != -1)
      swift_once();
    v70 = *(_QWORD *)(v0 + 264);
    v71 = *(_QWORD *)(v0 + 240);
    v72 = *(_QWORD *)(v0 + 248);
    v73 = __swift_project_value_buffer(v71, (uint64_t)qword_254D27938);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v72 + 16))(v70, v73, v71);
    v74 = v69;
    v75 = v69;
    v76 = sub_213C12570();
    v77 = sub_213C1275C();
    v78 = os_log_type_enabled(v76, v77);
    v79 = *(_QWORD *)(v0 + 320);
    v80 = *(_QWORD *)(v0 + 288);
    v81 = *(_QWORD *)(v0 + 296);
    v82 = *(_QWORD *)(v0 + 264);
    v83 = *(_QWORD *)(v0 + 240);
    v84 = *(_QWORD *)(v0 + 248);
    if (v78)
    {
      v92 = *(_QWORD *)(v0 + 296);
      v59 = swift_slowAlloc();
      v90 = v80;
      v60 = swift_slowAlloc();
      v96[0] = v60;
      *(_DWORD *)v59 = 136315138;
      swift_getErrorValue();
      v61 = sub_213C12A44();
      *(_QWORD *)(v59 + 4) = sub_213BEB0C8(v61, v62, v96);
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_213BCD000, v76, v77, "Could not create gesture FAC Data Auditing directory: %s", (uint8_t *)v59, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199BF4BC](v60, -1, -1);
      MEMORY[0x2199BF4BC](v59, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v84 + 8))(v82, v83);
      (*(void (**)(uint64_t, uint64_t))(v92 + 8))(v79, v90);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v84 + 8))(v82, v83);
      (*(void (**)(uint64_t, uint64_t))(v81 + 8))(v79, v80);
    }
    goto LABEL_29;
  }
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 296) + 16))(*(_QWORD *)(v0 + 312), *(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 288));
  type metadata accessor for PADAVAssetReader();
  swift_allocObject();
  v85 = v67;
  v86 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 360) = v86;
  *v86 = v0;
  v86[1] = sub_213BE7368;
  return sub_213BF5A40(*(_QWORD *)(v0 + 312));
}

uint64_t sub_213BE8068()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  unsigned int v29;
  void *v30;
  id v31;
  id v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v1 = v0 + 112;
  v2 = *(void **)(v0 + 376);
  v3 = &unk_254D27000;
  while (2)
  {
    if (v3[294] != -1)
      swift_once();
    v4 = *(_QWORD *)(v0 + 264);
    v5 = *(_QWORD *)(v0 + 240);
    v6 = *(_QWORD *)(v0 + 248);
    v7 = __swift_project_value_buffer(v5, (uint64_t)qword_254D27938);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, v7, v5);
    v8 = v2;
    v9 = v2;
    v10 = sub_213C12570();
    v11 = sub_213C1275C();
    v12 = os_log_type_enabled(v10, v11);
    v13 = *(_QWORD *)(v0 + 320);
    v14 = *(_QWORD *)(v0 + 288);
    v37 = *(_QWORD *)(v0 + 296);
    v15 = *(_QWORD *)(v0 + 264);
    v17 = *(_QWORD *)(v0 + 240);
    v16 = *(_QWORD *)(v0 + 248);
    if (v12)
    {
      v36 = v1;
      v18 = swift_slowAlloc();
      v35 = v14;
      v19 = swift_slowAlloc();
      v38[0] = v19;
      *(_DWORD *)v18 = 136315138;
      swift_getErrorValue();
      v20 = sub_213C12A44();
      *(_QWORD *)(v18 + 4) = sub_213BEB0C8(v20, v21, v38);
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_213BCD000, v10, v11, "Could not create gesture FAC Data Auditing directory: %s", (uint8_t *)v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199BF4BC](v19, -1, -1);
      v22 = v18;
      v1 = v36;
      MEMORY[0x2199BF4BC](v22, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
      (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v13, v35);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
      (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v13, v14);
    }
    v23 = *(_QWORD *)(v0 + 344);
    v24 = *(_QWORD *)(v0 + 336) - 1;
    do
    {
      if (v24 == v23)
      {
        sub_213BE3EC4(v0 + 208);
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        return (*(uint64_t (**)(void))(v0 + 8))();
      }
      v25 = v23 + 1;
      *(_QWORD *)(v0 + 344) = v23 + 1;
      v26 = *(_QWORD *)(*(_QWORD *)(v0 + 328) + 8 * v23 + 40);
      *(_QWORD *)(v0 + 352) = v26;
      ++v23;
    }
    while (!*(_QWORD *)(v26 + 16));
    *(_QWORD *)(v0 + 112) = 792936774;
    *(_QWORD *)(v0 + 120) = 0xE400000000000000;
    *(_QWORD *)(v0 + 152) = v25;
    swift_bridgeObjectRetain();
    sub_213C129FC();
    sub_213C12648();
    swift_bridgeObjectRelease();
    sub_213C124C8();
    swift_bridgeObjectRelease();
    v27 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
    v28 = (void *)sub_213C124BC();
    *(_QWORD *)(v0 + 184) = 0;
    v29 = objc_msgSend(v27, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v28, 1, 0, v0 + 184);

    v30 = *(void **)(v0 + 184);
    if (!v29)
    {
      v31 = v30;
      swift_bridgeObjectRelease();
      v2 = (void *)sub_213C1248C();

      swift_willThrow();
      v3 = (_QWORD *)&unk_254D27000;
      continue;
    }
    break;
  }
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 296) + 16))(*(_QWORD *)(v0 + 312), *(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 288));
  type metadata accessor for PADAVAssetReader();
  swift_allocObject();
  v33 = v30;
  v34 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 360) = v34;
  *v34 = v0;
  v34[1] = sub_213BE7368;
  return sub_213BF5A40(*(_QWORD *)(v0 + 312));
}

uint64_t sub_213BE851C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_213C12708();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_213C126FC();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_213BE4088(a1, &qword_254D27CF0);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_213C126E4();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_213BE8668()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  id v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void (*v21)(char *, uint64_t);
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  NSObject *v29;
  os_log_type_t v30;
  int v31;
  uint64_t v32;
  uint8_t *v33;
  uint64_t v34;
  unint64_t v35;
  uint8_t *v36;
  void *v37;
  void (*v38)(char *, uint64_t);
  uint8_t *v39;
  uint8_t *v40;
  int v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  id v45[5];

  v45[4] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = sub_213C12588();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D27CE8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_213C124F8();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v39 - v13;
  v15 = v0 + OBJC_IVAR____TtC10CoreIDVPAD22PADSWAuditDataRecorder_directory;
  swift_beginAccess();
  sub_213BEB708(v15, (uint64_t)v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    return sub_213BE4088((uint64_t)v7, &qword_254D27CE8);
  v43 = v2;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v14, v7, v8);
  sub_213C124C8();
  v17 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v18 = (void *)sub_213C124BC();
  v19 = (void *)sub_213C124BC();
  v45[0] = 0;
  v20 = objc_msgSend(v17, sel_copyItemAtURL_toURL_error_, v18, v19, v45);

  if (v20)
  {
    v21 = *(void (**)(char *, uint64_t))(v9 + 8);
    v22 = v45[0];
    v21(v12, v8);
    return ((uint64_t (*)(char *, uint64_t))v21)(v14, v8);
  }
  else
  {
    v23 = v45[0];
    v24 = (void *)sub_213C1248C();

    swift_willThrow();
    if (qword_254D27930 != -1)
      swift_once();
    v25 = __swift_project_value_buffer(v1, (uint64_t)qword_254D27938);
    v26 = v43;
    (*(void (**)(char *, uint64_t, uint64_t))(v43 + 16))(v4, v25, v1);
    v27 = v24;
    v28 = v24;
    v29 = sub_213C12570();
    v30 = sub_213C1275C();
    v31 = v30;
    if (os_log_type_enabled(v29, v30))
    {
      v32 = swift_slowAlloc();
      v41 = v31;
      v33 = (uint8_t *)v32;
      v42 = (void *)swift_slowAlloc();
      v45[0] = v42;
      *(_DWORD *)v33 = 136315138;
      v39 = v33 + 4;
      v40 = v33;
      swift_getErrorValue();
      v34 = sub_213C12A44();
      v44 = sub_213BEB0C8(v34, v35, (uint64_t *)v45);
      sub_213C127F8();
      swift_bridgeObjectRelease();

      v36 = v40;
      _os_log_impl(&dword_213BCD000, v29, (os_log_type_t)v41, "Audit Data Recorder could not persist liveness video: %s", v40, 0xCu);
      v37 = v42;
      swift_arrayDestroy();
      MEMORY[0x2199BF4BC](v37, -1, -1);
      MEMORY[0x2199BF4BC](v36, -1, -1);

      (*(void (**)(char *, uint64_t))(v43 + 8))(v4, v1);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v26 + 8))(v4, v1);
    }
    v38 = *(void (**)(char *, uint64_t))(v9 + 8);
    v38(v12, v8);
    return ((uint64_t (*)(char *, uint64_t))v38)(v14, v8);
  }
}

uint64_t sub_213BE8AD8(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  unint64_t v31;
  id v32;
  void (*v33)(char *, uint64_t);
  char *v34;
  uint64_t v35;
  unint64_t v36;
  void (*v37)(char *, uint64_t);
  uint64_t v38;
  uint64_t v39;
  id v40;
  id v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  _QWORD *v45;
  id v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;

  v52 = a2;
  v53 = a1;
  v5 = sub_213C12588();
  v55 = *(_QWORD *)(v5 - 8);
  v56 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v54 = (char *)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_213C124B0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D27CE8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v50 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_213C124F8();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v57 = (char *)&v50 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v50 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v50 - v21;
  v23 = v3 + OBJC_IVAR____TtC10CoreIDVPAD22PADSWAuditDataRecorder_directory;
  swift_beginAccess();
  sub_213BEB708(v23, (uint64_t)v13);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
    return sub_213BE4088((uint64_t)v13, &qword_254D27CE8);
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v22, v13, v14);
  sub_213C124C8();
  if ((sub_213BEBF68((uint64_t)v20) & 1) == 0)
  {
    v33 = *(void (**)(char *, uint64_t))(v15 + 8);
    v33(v20, v14);
    v34 = v22;
    return ((uint64_t (*)(char *, uint64_t))v33)(v34, v14);
  }
  v51 = v22;
  v58 = (uint64_t)v52;
  v59 = a3;
  swift_bridgeObjectRetain();
  sub_213C12648();
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x24BDCD7A0], v7);
  sub_213BEC380();
  v25 = v57;
  v52 = v20;
  sub_213C124EC();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_bridgeObjectRelease();
  v26 = objc_allocWithZone(MEMORY[0x24BDBF660]);
  v27 = objc_msgSend(v26, sel_initWithCVPixelBuffer_, v53);
  v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBF648]), sel_init);
  objc_msgSend(v27, sel_extent);
  v29 = objc_msgSend(v28, sel_createCGImage_fromRect_, v27);
  if (v29)
  {
    v30 = sub_213BEA07C();
    if (v31 >> 60 != 15)
    {
      v35 = v30;
      v36 = v31;
      sub_213C12534();
      sub_213BEC3C4(v35, v36);

      v33 = *(void (**)(char *, uint64_t))(v15 + 8);
      v33(v25, v14);
      v33(v52, v14);
      v34 = v51;
      return ((uint64_t (*)(char *, uint64_t))v33)(v34, v14);
    }
  }
  v32 = sub_213BFC6D4(0xD00000000000001FLL, 0x8000000213C17670, 0, -10, 0);
  swift_willThrow();

  v37 = *(void (**)(char *, uint64_t))(v15 + 8);
  v37(v57, v14);
  if (qword_254D27930 != -1)
    swift_once();
  v38 = v56;
  v39 = __swift_project_value_buffer(v56, (uint64_t)qword_254D27938);
  (*(void (**)(char *, uint64_t, uint64_t))(v55 + 16))(v54, v39, v38);
  v40 = v32;
  v41 = v32;
  v42 = sub_213C12570();
  v43 = sub_213C1275C();
  if (os_log_type_enabled(v42, v43))
  {
    v44 = (uint8_t *)swift_slowAlloc();
    v45 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v44 = 138412290;
    v46 = v32;
    v47 = _swift_stdlib_bridgeErrorToNSError();
    v58 = v47;
    sub_213C127F8();
    *v45 = v47;

    _os_log_impl(&dword_213BCD000, v42, v43, "Error storing PRD buffer: %@", v44, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D27CC8);
    swift_arrayDestroy();
    MEMORY[0x2199BF4BC](v45, -1, -1);
    MEMORY[0x2199BF4BC](v44, -1, -1);

  }
  else
  {

  }
  v48 = v51;
  v49 = v52;

  (*(void (**)(char *, uint64_t))(v55 + 8))(v54, v56);
  v37(v49, v14);
  return ((uint64_t (*)(char *, uint64_t))v37)(v48, v14);
}

uint64_t sub_213BE9074(uint64_t a1, uint64_t a2, char *a3, void *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  unint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t);
  uint64_t v37;
  unint64_t v38;
  void (*v39)(char *, uint64_t);
  uint64_t v40;
  id v41;
  id v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  _QWORD *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;

  v5 = v4;
  v59 = a4;
  v55 = a2;
  v56 = a3;
  v57 = a1;
  v58 = sub_213C12588();
  v62 = *(_QWORD *)(v58 - 8);
  MEMORY[0x24BDAC7A8](v58);
  v61 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_213C124B0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D27CE8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_213C124F8();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v52 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v52 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v52 - v22;
  v60 = v5;
  v24 = v5 + OBJC_IVAR____TtC10CoreIDVPAD22PADSWAuditDataRecorder_directory;
  swift_beginAccess();
  sub_213BEB708(v24, (uint64_t)v13);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
    return sub_213BE4088((uint64_t)v13, &qword_254D27CE8);
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v23, v13, v14);
  sub_213C124C8();
  if ((sub_213BEBF68((uint64_t)v21) & 1) != 0)
  {
    v53 = v23;
    v54 = v14;
    v63 = v55;
    v64 = v56;
    swift_bridgeObjectRetain();
    sub_213C12648();
    (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x24BDCD7A0], v7);
    sub_213BEC380();
    v26 = v18;
    v56 = v21;
    sub_213C124EC();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    swift_bridgeObjectRelease();
    v27 = objc_allocWithZone(MEMORY[0x24BDBF660]);
    v28 = objc_msgSend(v27, sel_initWithCVPixelBuffer_, v57);
    v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBF648]), sel_init);
    objc_msgSend(v28, sel_extent);
    v30 = objc_msgSend(v29, sel_createCGImage_fromRect_, v28);
    if (v30 && (v31 = sub_213BEA07C(), v32 >> 60 != 15))
    {
      v37 = v31;
      v38 = v32;
      sub_213C12534();
      sub_213BEC3C4(v37, v38);

      v39 = *(void (**)(char *, uint64_t))(v15 + 8);
      v39(v26, v54);
    }
    else
    {
      v33 = sub_213BFC6D4(0xD00000000000001FLL, 0x8000000213C17670, 0, -10, 0);
      swift_willThrow();
      v34 = v54;
      v35 = v58;

      v39 = *(void (**)(char *, uint64_t))(v15 + 8);
      v39(v18, v34);
      if (qword_254D27930 != -1)
        swift_once();
      v40 = __swift_project_value_buffer(v35, (uint64_t)qword_254D27938);
      (*(void (**)(char *, uint64_t, uint64_t))(v62 + 16))(v61, v40, v35);
      v41 = v33;
      v42 = v33;
      v43 = sub_213C12570();
      v44 = sub_213C1275C();
      if (os_log_type_enabled(v43, v44))
      {
        v45 = (uint8_t *)swift_slowAlloc();
        v46 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v45 = 138412290;
        v47 = v33;
        v48 = _swift_stdlib_bridgeErrorToNSError();
        v63 = v48;
        sub_213C127F8();
        *v46 = v48;

        _os_log_impl(&dword_213BCD000, v43, v44, "Error storing FAC face pose buffer: %@", v45, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_254D27CC8);
        swift_arrayDestroy();
        MEMORY[0x2199BF4BC](v46, -1, -1);
        MEMORY[0x2199BF4BC](v45, -1, -1);

      }
      else
      {

      }
      (*(void (**)(char *, uint64_t))(v62 + 8))(v61, v35);
    }
    v49 = v60;
    swift_beginAccess();
    v50 = v59;
    MEMORY[0x2199BE778]();
    if (*(_QWORD *)((*(_QWORD *)(v49 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v49 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                        + 0x18) >> 1)
      sub_213C126B4();
    sub_213C126CC();
    sub_213C126A8();
    swift_endAccess();
    v51 = v54;
    v39(v56, v54);
    return ((uint64_t (*)(char *, uint64_t))v39)(v53, v51);
  }
  else
  {
    v36 = *(void (**)(char *, uint64_t))(v15 + 8);
    v36(v21, v14);
    return ((uint64_t (*)(char *, uint64_t))v36)(v23, v14);
  }
}

uint64_t sub_213BE9698(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  int v4;
  _QWORD *v5;
  _QWORD *v6;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;

  v2 = *a1;
  v3 = *((_BYTE *)a1 + 8);
  v4 = *((_DWORD *)a1 + 3);
  v5 = (_QWORD *)(v1 + 24);
  swift_beginAccess();
  v6 = *(_QWORD **)(v1 + 24);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v1 + 24) = v6;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v6 = sub_213BEA494(0, v6[2] + 1, 1, v6);
    *v5 = v6;
  }
  v9 = v6[2];
  v8 = v6[3];
  if (v9 >= v8 >> 1)
  {
    v6 = sub_213BEA494((_QWORD *)(v8 > 1), v9 + 1, 1, v6);
    *v5 = v6;
  }
  v6[2] = v9 + 1;
  v10 = &v6[2 * v9];
  v10[4] = v2;
  *((_BYTE *)v10 + 40) = v3;
  *((_DWORD *)v10 + 11) = v4;
  return swift_endAccess();
}

uint64_t sub_213BE977C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  id v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  NSObject *v36;
  os_log_type_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  os_log_t v45;
  void *v46;
  uint64_t v47;
  id v48;
  void *v49;
  unsigned int v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  char *v54;
  NSObject *v55;
  os_log_type_t v56;
  uint8_t *v57;
  id v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  char *v63;
  id v64;
  id v65;
  NSObject *v66;
  os_log_type_t v67;
  int v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  void (*v74)(char *, uint64_t);
  uint64_t v75;
  unint64_t v76;
  id v77;
  void (*v78)(char *, uint64_t);
  _QWORD v79[2];
  os_log_t v80;
  int v81;
  void *v82;
  uint64_t v83;
  char *v84;
  id v85;
  char *v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  id v90[6];

  v90[4] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = sub_213C12588();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)v79 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v3);
  v8 = (char *)v79 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v86 = (char *)v79 - v9;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D27CE8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v79 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_213C124F8();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v87 = (char *)v79 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)v79 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)v79 - v20;
  v22 = v0 + OBJC_IVAR____TtC10CoreIDVPAD22PADSWAuditDataRecorder_directory;
  swift_beginAccess();
  sub_213BEB708(v22, (uint64_t)v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
    return sub_213BE4088((uint64_t)v12, &qword_254D27CE8);
  v84 = v5;
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v21, v12, v13);
  v85 = (id)objc_opt_self();
  v24 = objc_msgSend(v85, sel_defaultManager);
  sub_213C124E0();
  v25 = (void *)sub_213C125E8();
  swift_bridgeObjectRelease();
  v90[0] = 0;
  v26 = objc_msgSend(v24, sel_contentsOfDirectoryAtPath_error_, v25, v90);

  v27 = v90[0];
  if (v26)
  {
    v28 = v2;
    v29 = sub_213C12690();
    v30 = v27;

  }
  else
  {
    v31 = v90[0];
    v32 = (void *)sub_213C1248C();

    swift_willThrow();
    if (qword_254D27930 != -1)
      swift_once();
    v33 = __swift_project_value_buffer(v1, (uint64_t)qword_254D27938);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v8, v33, v1);
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v19, v21, v13);
    v34 = v32;
    v35 = v32;
    v36 = sub_213C12570();
    v37 = sub_213C1275C();
    v38 = v37;
    if (os_log_type_enabled(v36, v37))
    {
      v39 = swift_slowAlloc();
      v81 = v38;
      v40 = v39;
      v82 = (void *)swift_slowAlloc();
      v90[0] = v82;
      *(_DWORD *)v40 = 136315394;
      v83 = v2;
      v80 = v36;
      v41 = sub_213C124E0();
      v88 = sub_213BEB0C8(v41, v42, (uint64_t *)v90);
      v79[1] = &v89;
      sub_213C127F8();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v14 + 8))(v19, v13);
      *(_WORD *)(v40 + 12) = 2080;
      swift_getErrorValue();
      v43 = sub_213C12A44();
      v88 = sub_213BEB0C8(v43, v44, (uint64_t *)v90);
      sub_213C127F8();
      swift_bridgeObjectRelease();

      v45 = v80;
      _os_log_impl(&dword_213BCD000, v80, (os_log_type_t)v81, "Could not finalize audit data capture at directory %s: %s", (uint8_t *)v40, 0x16u);
      v46 = v82;
      swift_arrayDestroy();
      MEMORY[0x2199BF4BC](v46, -1, -1);
      MEMORY[0x2199BF4BC](v40, -1, -1);

      v28 = v83;
      (*(void (**)(char *, uint64_t))(v83 + 8))(v8, v1);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v14 + 8))(v19, v13);
      v28 = v2;
      (*(void (**)(char *, uint64_t))(v2 + 8))(v8, v1);
    }
    v29 = MEMORY[0x24BEE4AF8];
  }
  v47 = *(_QWORD *)(v29 + 16);
  swift_bridgeObjectRelease();
  if (v47)
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v21, v13);
  v48 = objc_msgSend(v85, sel_defaultManager);
  v49 = (void *)sub_213C124BC();
  v90[0] = 0;
  v50 = objc_msgSend(v48, sel_removeItemAtURL_error_, v49, v90);

  if (v50)
  {
    v51 = qword_254D27930;
    v52 = v90[0];
    if (v51 != -1)
      swift_once();
    v53 = __swift_project_value_buffer(v1, (uint64_t)qword_254D27938);
    v54 = v86;
    (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v86, v53, v1);
    v55 = sub_213C12570();
    v56 = sub_213C12750();
    if (os_log_type_enabled(v55, v56))
    {
      v57 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v57 = 0;
      _os_log_impl(&dword_213BCD000, v55, v56, "Removed Audit Data capture directory because it was empty.", v57, 2u);
      MEMORY[0x2199BF4BC](v57, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v28 + 8))(v54, v1);
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v21, v13);
  }
  v58 = v90[0];
  v59 = (void *)sub_213C1248C();

  swift_willThrow();
  if (qword_254D27930 != -1)
    swift_once();
  v60 = __swift_project_value_buffer(v1, (uint64_t)qword_254D27938);
  v61 = v28;
  v62 = v84;
  (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v84, v60, v1);
  v63 = v87;
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v87, v21, v13);
  v64 = v59;
  v65 = v59;
  v66 = sub_213C12570();
  v67 = sub_213C1275C();
  v68 = v67;
  if (os_log_type_enabled(v66, v67))
  {
    v69 = swift_slowAlloc();
    v83 = v61;
    v70 = v63;
    v71 = v69;
    v85 = (id)swift_slowAlloc();
    v90[0] = v85;
    *(_DWORD *)v71 = 136315394;
    LODWORD(v82) = v68;
    v72 = sub_213C124E0();
    v88 = sub_213BEB0C8(v72, v73, (uint64_t *)v90);
    v86 = (char *)v1;
    sub_213C127F8();
    swift_bridgeObjectRelease();
    v74 = *(void (**)(char *, uint64_t))(v14 + 8);
    v74(v70, v13);
    *(_WORD *)(v71 + 12) = 2080;
    swift_getErrorValue();
    v75 = sub_213C12A44();
    v88 = sub_213BEB0C8(v75, v76, (uint64_t *)v90);
    sub_213C127F8();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_213BCD000, v66, (os_log_type_t)v82, "Could not remove Audit Data capture directory at %s: %s", (uint8_t *)v71, 0x16u);
    v77 = v85;
    swift_arrayDestroy();
    MEMORY[0x2199BF4BC](v77, -1, -1);
    MEMORY[0x2199BF4BC](v71, -1, -1);

    (*(void (**)(char *, char *))(v83 + 8))(v84, v86);
    return ((uint64_t (*)(char *, uint64_t))v74)(v21, v13);
  }
  else
  {

    v78 = *(void (**)(char *, uint64_t))(v14 + 8);
    v78(v63, v13);

    (*(void (**)(char *, uint64_t))(v61 + 8))(v62, v1);
    return ((uint64_t (*)(char *, uint64_t))v78)(v21, v13);
  }
}

uint64_t sub_213BEA07C()
{
  uint64_t v0;
  id v1;
  id v2;
  CGColorSpaceRef DeviceRGB;
  void *v4;
  id v5;
  uint64_t v6;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBF660]), sel_initWithCGImage_, v0);
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBF648]), sel_init);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  sub_213C05980(MEMORY[0x24BEE4AF8]);
  type metadata accessor for CIImageRepresentationOption(0);
  sub_213BDBB94((unint64_t *)&qword_254D27A70, (uint64_t (*)(uint64_t))type metadata accessor for CIImageRepresentationOption, (uint64_t)&unk_213C14714);
  v4 = (void *)sub_213C125C4();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(v2, sel_JPEGRepresentationOfImage_colorSpace_options_, v1, DeviceRGB, v4);

  if (v5)
  {
    v6 = sub_213C12528();

  }
  else
  {

    return 0;
  }
  return v6;
}

uint64_t sub_213BEA1B4(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_213BEA218;
  return v6(a1);
}

uint64_t sub_213BEA218()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

char *sub_213BEA264(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_254D27EB8);
      v10 = (char *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 29;
      *((_QWORD *)v10 + 2) = v8;
      *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
      v13 = v10 + 32;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (char *)MEMORY[0x24BEE4AF8];
      v13 = (char *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 32])
          memmove(v13, a4 + 32, 4 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_213BEBA94(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_213BEA370(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_254D27F30);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[3 * v8 + 4])
          memmove(v12, a4 + 4, 24 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v12 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_213BEBB7C(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_213BEA494(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_254D27F00);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_213BEC53C(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_213BEA5A0(_QWORD *a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_213BEA964(a1, a2, a3, a4, &qword_254D27EA8);
}

_QWORD *sub_213BEA5AC(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_254D27EA0);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[3 * v8 + 4])
          memmove(v12, a4 + 4, 24 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v12 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_213BEBC88(0, v8, (char *)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_213BEA6D0(_QWORD *a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_213BEA6F8(a1, a2, a3, a4, (uint64_t *)&unk_254D29900, (uint64_t *)&unk_254D29880);
}

_QWORD *sub_213BEA6E4(_QWORD *a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_213BEA6F8(a1, a2, a3, a4, &qword_254D27E98, (uint64_t *)&unk_254D29940);
}

_QWORD *sub_213BEA6F8(_QWORD *result, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t *a6)
{
  char v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  int64_t v14;
  uint64_t v15;
  _QWORD *v16;

  v8 = (char)result;
  if ((a3 & 1) == 0)
  {
    v10 = a2;
    goto LABEL_8;
  }
  v9 = a4[3];
  v10 = v9 >> 1;
  if ((uint64_t)(v9 >> 1) >= a2)
    goto LABEL_8;
  if (v10 + 0x4000000000000000 >= 0)
  {
    v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v10 = a2;
LABEL_8:
    v11 = a4[2];
    if (v10 <= v11)
      v12 = a4[2];
    else
      v12 = v10;
    if (v12)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      v13 = (_QWORD *)swift_allocObject();
      v14 = _swift_stdlib_malloc_size(v13);
      v15 = v14 - 32;
      if (v14 < 32)
        v15 = v14 - 25;
      v13[2] = v11;
      v13[3] = 2 * (v15 >> 3);
      v16 = v13 + 4;
      if ((v8 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v16 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v13 != a4 || v16 >= &a4[v11 + 4])
          memmove(v16, a4 + 4, 8 * v11);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_213BEBD74(0, v11, (unint64_t)v16, (uint64_t)a4, a6);
LABEL_24:
    swift_bridgeObjectRelease();
    return v13;
  }
  __break(1u);
  return result;
}

_QWORD *sub_213BEA810(_QWORD *a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_213BEA6F8(a1, a2, a3, a4, &qword_254D27EB0, (uint64_t *)&unk_254D29930);
}

_QWORD *sub_213BEA824(_QWORD *a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_213BEA6F8(a1, a2, a3, a4, &qword_254D27ED8, &qword_254D27EE0);
}

_QWORD *sub_213BEA838(_QWORD *a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_213BEA6F8(a1, a2, a3, a4, &qword_254D27EE8, &qword_254D27EF0);
}

_QWORD *sub_213BEA84C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_254D27F20);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_213BEBE78(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_213BEA958(_QWORD *a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_213BEA964(a1, a2, a3, a4, &qword_254D27EF8);
}

_QWORD *sub_213BEA964(_QWORD *result, int64_t a2, char a3, _QWORD *a4, uint64_t *a5)
{
  char v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  _QWORD *v14;

  v6 = (char)result;
  if ((a3 & 1) == 0)
  {
    v8 = a2;
    goto LABEL_8;
  }
  v7 = a4[3];
  v8 = v7 >> 1;
  if ((uint64_t)(v7 >> 1) >= a2)
    goto LABEL_8;
  if (v8 + 0x4000000000000000 >= 0)
  {
    v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v8 = a2;
LABEL_8:
    v9 = a4[2];
    if (v8 <= v9)
      v10 = a4[2];
    else
      v10 = v8;
    if (v10)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      v11 = (_QWORD *)swift_allocObject();
      v12 = _swift_stdlib_malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 25;
      v11[2] = v9;
      v11[3] = 2 * (v13 >> 3);
      v14 = v11 + 4;
      if ((v6 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v14 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[v9 + 4])
          memmove(v14, a4 + 4, 8 * v9);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_213BEC624(0, v9, (char *)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v11;
  }
  __break(1u);
  return result;
}

_QWORD *sub_213BEAA6C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_254D298E0);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 25;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4])
          memmove(v13, a4 + 4, 8 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_213BEC624(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_213BEAB78(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_254D27EC0);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 1;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4])
          memmove(v13, a4 + 4, 32 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_213BEC70C(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_213BEAC84(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D28D60);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4])
          memmove(v12, a4 + 4, 40 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v12 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_213BEC7F4(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_213BEADA4(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_254D27EC8);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_213BEC904(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_213BEAEB0(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_254D298C0);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_213BECAE4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_213BEAFBC(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_254D27ED0);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 1;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4])
          memmove(v13, a4 + 4, 32 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_213BEC9F4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_213BEB0C8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_213BEB198(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_213BECBD4((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_213BECBD4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_213BEB198(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_213C12804();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_213BEB350(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_213C128AC();
  if (!v8)
  {
    sub_213C12900();
    __break(1u);
LABEL_17:
    result = sub_213C12948();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_213BEB350(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_213BEB3E4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_213BEB5BC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_213BEB5BC(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_213BEB3E4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_213BEB558(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_213C12888();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_213C12900();
      __break(1u);
LABEL_10:
      v2 = sub_213C12654();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_213C12948();
    __break(1u);
LABEL_14:
    result = sub_213C12900();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_213BEB558(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D27F08);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_213BEB5BC(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D27F08);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_213C12948();
  __break(1u);
  return result;
}

uint64_t sub_213BEB708(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D27CE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_213BEB750()
{
  unint64_t result;

  result = qword_254D27CF8;
  if (!qword_254D27CF8)
  {
    result = MEMORY[0x2199BF420](&protocol conformance descriptor for PADSWClassifierResult, &type metadata for PADSWClassifierResult);
    atomic_store(result, &qword_254D27CF8);
  }
  return result;
}

uint64_t sub_213BEB798(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v4 = *(_QWORD *)(sub_213C124F8() - 8);
  v5 = *(unsigned __int8 *)(v4 + 80);
  v6 = (v5 + 280) & ~v5;
  v7 = *(_QWORD *)(v1 + 16);
  v8 = *(_QWORD *)(v1 + 24);
  v9 = v1 + 32;
  v10 = v1 + v6;
  v11 = v1 + ((*(_QWORD *)(v4 + 64) + v5 + v6) & ~v5);
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v12;
  *v12 = v2;
  v12[1] = sub_213BEB844;
  return sub_213BE5FA4(a1, v7, v8, v9, v10, v11);
}

uint64_t sub_213BEB844()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);

  v1 = sub_213C124F8();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 280) & ~v3;
  v5 = (*(_QWORD *)(v2 + 64) + v3 + v4) & ~v3;
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v6 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v6(v0 + v4, v1);
  v6(v0 + v5, v1);
  return swift_deallocObject();
}

uint64_t sub_213BEB9A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v4 = *(_QWORD *)(sub_213C124F8() - 8);
  v5 = *(unsigned __int8 *)(v4 + 80);
  v6 = (v5 + 280) & ~v5;
  v7 = *(_QWORD *)(v1 + 16);
  v8 = *(_QWORD *)(v1 + 24);
  v9 = v1 + 32;
  v10 = v1 + v6;
  v11 = v1 + ((*(_QWORD *)(v4 + 64) + v5 + v6) & ~v5);
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v12;
  *v12 = v2;
  v12[1] = sub_213BEB844;
  return sub_213BE6DA4(a1, v7, v8, v9, v10, v11);
}

uint64_t sub_213BEBA50(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

char *sub_213BEBA94(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 4 * a1 + 32);
    v6 = 4 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_213C12948();
  __break(1u);
  return result;
}

uint64_t sub_213BEBB7C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 24 * a1 + 32;
    v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_254D27F38);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_213C12948();
  __break(1u);
  return result;
}

char *sub_213BEBC88(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 24 * a1 + 32);
    v6 = 24 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_213C12948();
  __break(1u);
  return result;
}

uint64_t sub_213BEBD74(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    v6 = a4 + 8 * a1 + 32;
    v7 = a3 + 8 * v5;
    if (v6 >= v7 || v6 + 8 * v5 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      swift_arrayInitWithCopy();
      return v7;
    }
  }
  result = sub_213C12948();
  __break(1u);
  return result;
}

uint64_t sub_213BEBE78(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_213C12948();
  __break(1u);
  return result;
}

uint64_t sub_213BEBF68(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  void *v9;
  id v10;
  void *v11;
  unsigned int v12;
  id v13;
  void *v14;
  unsigned int v15;
  id v16;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  NSObject *v25;
  os_log_type_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  void *v33;
  _BYTE v34[12];
  int v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  id v41[2];

  v41[1] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = sub_213C124F8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = &v34[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = sub_213C12588();
  v37 = *(_QWORD *)(v6 - 8);
  v38 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = &v34[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v40 = 0;
  v9 = (void *)objc_opt_self();
  v10 = objc_msgSend(v9, sel_defaultManager);
  sub_213C124E0();
  v11 = (void *)sub_213C125E8();
  swift_bridgeObjectRelease();
  v12 = objc_msgSend(v10, sel_fileExistsAtPath_isDirectory_, v11, &v40);

  if (v12 && (v40 & 1) != 0)
    return 1;
  v13 = objc_msgSend(v9, sel_defaultManager);
  v14 = (void *)sub_213C124BC();
  v41[0] = 0;
  v15 = objc_msgSend(v13, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v14, 1, 0, v41);

  if (v15)
  {
    v16 = v41[0];
    return 1;
  }
  v18 = v41[0];
  v19 = (void *)sub_213C1248C();

  swift_willThrow();
  if (qword_254D27930 != -1)
    swift_once();
  v20 = v38;
  v21 = __swift_project_value_buffer(v38, (uint64_t)qword_254D27938);
  v22 = v37;
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v37 + 16))(v8, v21, v20);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  v23 = v19;
  v24 = v19;
  v25 = sub_213C12570();
  v26 = sub_213C1275C();
  v27 = v26;
  if (os_log_type_enabled(v25, v26))
  {
    v28 = swift_slowAlloc();
    v36 = (void *)swift_slowAlloc();
    v41[0] = v36;
    *(_DWORD *)v28 = 136315394;
    v35 = v27;
    v29 = sub_213C124E0();
    v39 = sub_213BEB0C8(v29, v30, (uint64_t *)v41);
    sub_213C127F8();
    swift_bridgeObjectRelease();
    (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
    *(_WORD *)(v28 + 12) = 2080;
    swift_getErrorValue();
    v31 = sub_213C12A44();
    v39 = sub_213BEB0C8(v31, v32, (uint64_t *)v41);
    sub_213C127F8();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_213BCD000, v25, (os_log_type_t)v35, "Could not create Audit Data directory at %s: %s", (uint8_t *)v28, 0x16u);
    v33 = v36;
    swift_arrayDestroy();
    MEMORY[0x2199BF4BC](v33, -1, -1);
    MEMORY[0x2199BF4BC](v28, -1, -1);

    (*(void (**)(_BYTE *, uint64_t))(v37 + 8))(v8, v38);
  }
  else
  {

    (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
    (*(void (**)(_BYTE *, uint64_t))(v22 + 8))(v8, v20);
  }
  return 0;
}

unint64_t sub_213BEC380()
{
  unint64_t result;

  result = qword_254D27D20;
  if (!qword_254D27D20)
  {
    result = MEMORY[0x2199BF420](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_254D27D20);
  }
  return result;
}

uint64_t sub_213BEC3C4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_213BEBA50(a1, a2);
  return a1;
}

uint64_t sub_213BEC3D8()
{
  return type metadata accessor for PADSWAuditDataRecorder();
}

uint64_t type metadata accessor for PADSWAuditDataRecorder()
{
  uint64_t result;

  result = qword_254D27D50;
  if (!qword_254D27D50)
    return swift_getSingletonMetadata();
  return result;
}

void sub_213BEC41C()
{
  unint64_t v0;

  sub_213BEC4E8();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for PADSWAuditDataRecorder()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PADSWAuditDataRecorder.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of PADSWAuditDataRecorder.storeClassifierResult(_:imageData:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of PADSWAuditDataRecorder.storeUnencryptedVideo(atURL:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of PADSWAuditDataRecorder.storePRDBuffer(_:withName:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of PADSWAuditDataRecorder.storeFACPoseBuffer(_:identifier:pose:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of PADSWAuditDataRecorder.storeTAAssessment(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

void sub_213BEC4E8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254D27D60)
  {
    sub_213C124F8();
    v0 = sub_213C127EC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254D27D60);
  }
}

char *sub_213BEC53C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 16 * a1 + 32);
    v6 = 16 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_213C12948();
  __break(1u);
  return result;
}

char *sub_213BEC624(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 8 * a1 + 32);
    v6 = 8 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_213C12948();
  __break(1u);
  return result;
}

char *sub_213BEC70C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 32 * a1 + 32);
    v6 = 32 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_213C12948();
  __break(1u);
  return result;
}

uint64_t sub_213BEC7F4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 40 * a1 + 32;
    v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_254D27E90);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_213C12948();
  __break(1u);
  return result;
}

uint64_t sub_213BEC904(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_213C12948();
  __break(1u);
  return result;
}

uint64_t sub_213BEC9F4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 32 * a1 + 32;
    v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_213C12948();
  __break(1u);
  return result;
}

uint64_t sub_213BECAE4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_213C12948();
  __break(1u);
  return result;
}

uint64_t sub_213BECBD4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_213BECC10()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_213BECC34(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_213BECD30;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_254D27F10 + dword_254D27F10))(a1, v4);
}

uint64_t sub_213BECCA4(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_213BECCE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D27CE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

id sub_213BECD34(double a1, double a2, double a3, double a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v8 = 3737841666;
  v9 = MGGetProductType();
  if (v9 <= 2081274471)
  {
    if (v9 > 1060988940)
    {
      if (v9 > 1429914405)
      {
        if (v9 > 1737882205)
        {
          if (v9 != 1737882206)
          {
            if (v9 == 2032616841)
              goto LABEL_60;
            v10 = 2080700391;
LABEL_49:
            if (v9 == v10)
              goto LABEL_50;
LABEL_60:
            v8 = 2;
            return objc_msgSend((id)objc_opt_self(), sel_observationWithRequestRevision_boundingBox_, v8, a1, a2, a3, a4);
          }
LABEL_58:
          v8 = 1;
          return objc_msgSend((id)objc_opt_self(), sel_observationWithRequestRevision_boundingBox_, v8, a1, a2, a3, a4);
        }
        if (v9 == 1429914406)
          goto LABEL_58;
        v11 = 1721691077;
LABEL_57:
        if (v9 != v11)
          goto LABEL_60;
        goto LABEL_58;
      }
      if (v9 > 1234705394)
      {
        if (v9 == 1234705395)
          goto LABEL_60;
        v10 = 1371389549;
        goto LABEL_49;
      }
      if (v9 != 1060988941)
      {
        if (v9 != 1169082144)
          goto LABEL_60;
        return objc_msgSend((id)objc_opt_self(), sel_observationWithRequestRevision_boundingBox_, v8, a1, a2, a3, a4);
      }
LABEL_42:
      v8 = 3;
      return objc_msgSend((id)objc_opt_self(), sel_observationWithRequestRevision_boundingBox_, v8, a1, a2, a3, a4);
    }
    if (v9 <= 502329936)
    {
      if (v9 > 337183580)
      {
        if (v9 == 337183581)
          goto LABEL_58;
        v11 = 445396642;
      }
      else
      {
        if (v9 == 42878382)
          goto LABEL_58;
        v11 = 253148925;
      }
      goto LABEL_57;
    }
    if (v9 > 910181309)
    {
      if (v9 == 910181310)
        goto LABEL_60;
      v11 = 952317141;
      goto LABEL_57;
    }
    if (v9 == 502329937)
      goto LABEL_58;
    v12 = 689804742;
LABEL_41:
    if (v9 != v12)
      goto LABEL_60;
    goto LABEL_42;
  }
  if (v9 > 2722529671)
  {
    if (v9 <= 3242623366)
    {
      if (v9 > 3001488777)
      {
        if (v9 == 3001488778)
          return objc_msgSend((id)objc_opt_self(), sel_observationWithRequestRevision_boundingBox_, v8, a1, a2, a3, a4);
        v11 = 3196805751;
      }
      else
      {
        if (v9 == 2722529672)
        {
LABEL_50:
          v8 = 3737841664;
          return objc_msgSend((id)objc_opt_self(), sel_observationWithRequestRevision_boundingBox_, v8, a1, a2, a3, a4);
        }
        v11 = 2781508713;
      }
      goto LABEL_57;
    }
    if (v9 > 3743999267)
    {
      if (v9 == 3743999268 || v9 != 3885279870 && v9 != 4201643249)
        goto LABEL_60;
      return objc_msgSend((id)objc_opt_self(), sel_observationWithRequestRevision_boundingBox_, v8, a1, a2, a3, a4);
    }
    if (v9 == 3242623367)
      goto LABEL_58;
    v12 = 3585085679;
    goto LABEL_41;
  }
  if (v9 > 2309863437)
  {
    if (v9 > 2336512886)
    {
      if (v9 == 2336512887)
        goto LABEL_58;
      v11 = 2468178735;
      goto LABEL_57;
    }
    if (v9 != 2309863438)
    {
      v11 = 2311900306;
      goto LABEL_57;
    }
    goto LABEL_42;
  }
  if (v9 > 2162679682)
  {
    if (v9 == 2162679683)
      goto LABEL_58;
    v11 = 2270970153;
    goto LABEL_57;
  }
  if (v9 == 2081274472)
    goto LABEL_58;
  if (v9 != 2159747553)
    goto LABEL_60;
  return objc_msgSend((id)objc_opt_self(), sel_observationWithRequestRevision_boundingBox_, v8, a1, a2, a3, a4);
}

id PADInternalClassifier.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

char *PADInternalClassifier.init()()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  dispatch_semaphore_t v11;
  char *v12;
  objc_class *v13;
  char *v14;
  char *v15;
  void *v16;
  char *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v23;
  objc_super v24;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D27CF0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v0[OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_classifier] = 0;
  v4 = &v0[OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_gestureStartBlock];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v5 = &v0[OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_incorrectGestureDetectedBlock];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  v6 = &v0[OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_onGesturesFinishedBlock];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  v7 = &v0[OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_selfieCompletionBlock];
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  v8 = OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_selfieCompletionBlockAccessSemaphore;
  v9 = v0;
  *(_QWORD *)&v0[v8] = dispatch_semaphore_create(1);
  v10 = &v9[OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_isClassifierLoading];
  v11 = dispatch_semaphore_create(1);
  *(_QWORD *)v10 = 0;
  *((_QWORD *)v10 + 1) = v11;
  v12 = &v9[OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_onClassifierLoaded];
  *(_QWORD *)v12 = 0;
  *((_QWORD *)v12 + 1) = 0;

  v13 = (objc_class *)type metadata accessor for PADInternalClassifier();
  v24.receiver = v9;
  v24.super_class = v13;
  v14 = (char *)objc_msgSendSuper2(&v24, sel_init);
  v15 = &v14[OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_isClassifierLoading];
  swift_beginAccess();
  v16 = (void *)*((_QWORD *)v15 + 1);
  v17 = v14;
  sub_213C127A4();
  *(_QWORD *)v15 = 1;
  v18 = v16;
  sub_213C127B0();
  swift_endAccess();

  sub_213C126F0();
  v19 = sub_213C12708();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v3, 0, 1, v19);
  v20 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v21 = (_QWORD *)swift_allocObject();
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = v20;
  sub_213BED76C((uint64_t)v3, (uint64_t)&unk_254D27F88, (uint64_t)v21);

  swift_release();
  sub_213BE4088((uint64_t)v3, &qword_254D27CF0);
  return v17;
}

uint64_t type metadata accessor for PADInternalClassifier()
{
  return objc_opt_self();
}

uint64_t sub_213BED300()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_213BED324(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 176) = a4;
  return swift_task_switch();
}

uint64_t sub_213BED33C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void (*v14)(void);
  _QWORD *v16;

  v1 = *(_QWORD *)(v0 + 176) + 16;
  swift_beginAccess();
  v2 = MEMORY[0x2199BF54C](v1);
  *(_QWORD *)(v0 + 184) = v2;
  v3 = *(_QWORD *)(v0 + 176) + 16;
  if (v2)
  {
    swift_beginAccess();
    v4 = MEMORY[0x2199BF54C](v3);
    if (v4)
    {
      v5 = v4;
      *(_QWORD *)(v0 + 40) = type metadata accessor for PADInternalClassifier();
      *(_QWORD *)(v0 + 48) = &protocol witness table for PADInternalClassifier;
      *(_QWORD *)(v0 + 16) = v5;
    }
    else
    {
      *(_QWORD *)(v0 + 48) = 0;
      *(_OWORD *)(v0 + 16) = 0u;
      *(_OWORD *)(v0 + 32) = 0u;
    }
    type metadata accessor for PADSWClassifier();
    v16 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 192) = v16;
    *v16 = v0;
    v16[1] = sub_213BED51C;
    return PADSWClassifier.__allocating_init(delegate:)(v0 + 16);
  }
  else
  {
    swift_beginAccess();
    v6 = MEMORY[0x2199BF54C](v3);
    if (v6)
    {
      v7 = (void *)v6;
      v8 = (_QWORD *)(v6 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_isClassifierLoading);
      swift_beginAccess();
      v9 = (void *)v8[1];
      sub_213C127A4();
      *v8 = 0;
      v10 = v9;
      sub_213C127B0();
      swift_endAccess();

    }
    v11 = *(_QWORD *)(v0 + 176) + 16;
    swift_beginAccess();
    v12 = MEMORY[0x2199BF54C](v11);
    if (v12)
    {
      v13 = (void *)v12;
      v14 = *(void (**)(void))(v12 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_onClassifierLoaded);
      sub_213BF1E48((uint64_t)v14);

      if (v14)
      {
        v14();
        sub_213BF1358((uint64_t)v14);
      }
    }
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_213BED51C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 200) = v1;
  swift_task_dealloc();
  if (v1)

  else
    *(_QWORD *)(v4 + 208) = a1;
  return swift_task_switch();
}

uint64_t sub_213BED598()
{
  uint64_t v0;
  char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void (*v12)(void);

  v1 = *(char **)(v0 + 184);
  v2 = *(void **)&v1[OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_classifier];
  *(_QWORD *)&v1[OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_classifier] = *(_QWORD *)(v0 + 208);

  v3 = *(_QWORD *)(v0 + 176) + 16;
  swift_beginAccess();
  v4 = MEMORY[0x2199BF54C](v3);
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (_QWORD *)(v4 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_isClassifierLoading);
    swift_beginAccess();
    v7 = (void *)v6[1];
    sub_213C127A4();
    *v6 = 0;
    v8 = v7;
    sub_213C127B0();
    swift_endAccess();

  }
  v9 = *(_QWORD *)(v0 + 176) + 16;
  swift_beginAccess();
  v10 = MEMORY[0x2199BF54C](v9);
  if (v10)
  {
    v11 = (void *)v10;
    v12 = *(void (**)(void))(v10 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_onClassifierLoaded);
    sub_213BF1E48((uint64_t)v12);

    if (v12)
    {
      v12();
      sub_213BF1358((uint64_t)v12);
    }
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_213BED6D4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_213BED6E0()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_213BED70C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_213BEB844;
  v3[22] = v2;
  return swift_task_switch();
}

uint64_t sub_213BED76C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[4];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D27CF0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_213BF1E04(a1, (uint64_t)v7, &qword_254D27CF0);
  v8 = sub_213C12708();
  v9 = *(_QWORD *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_213BE4088((uint64_t)v7, &qword_254D27CF0);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
  }
  else
  {
    sub_213C126FC();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
  }
  swift_getObjectType();
  swift_unknownObjectRetain();
  v10 = sub_213C126E4();
  v12 = v11;
  swift_unknownObjectRelease();
  if (v12 | v10)
  {
    v14[0] = 0;
    v14[1] = 0;
    v14[2] = v10;
    v14[3] = v12;
  }
  return swift_task_create();
}

void sub_213BED90C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  void (*v27)();
  uint64_t v28;
  void (**v29)();
  uint64_t v30;
  id v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v8 = v7;
  v39 = a6;
  v40 = a7;
  v37 = a2;
  v38 = a4;
  v12 = sub_213C12588();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v36 - v17;
  v19 = v7 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_isClassifierLoading;
  swift_beginAccess();
  v20 = *(_QWORD *)v19;
  v21 = *(id *)(v19 + 8);
  sub_213C127A4();
  sub_213C127B0();

  if (v20 <= 0)
  {
    if (qword_254D27930 != -1)
      swift_once();
    v32 = __swift_project_value_buffer(v12, (uint64_t)qword_254D27938);
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v18, v32, v12);
    v33 = sub_213C12570();
    v34 = sub_213C12750();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v35 = 0;
      MEMORY[0x2199BF4BC](v35, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
    sub_213BEDF64((uint64_t)a1, v37, a3, v38, a5, v39, v40);
  }
  else
  {
    if (qword_254D27930 != -1)
      swift_once();
    v22 = __swift_project_value_buffer(v12, (uint64_t)qword_254D27938);
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v16, v22, v12);
    v23 = sub_213C12570();
    v24 = sub_213C12750();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v25 = 0;
      MEMORY[0x2199BF4BC](v25, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
    v26 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v27 = (void (*)())swift_allocObject();
    *((_QWORD *)v27 + 2) = v26;
    *((_QWORD *)v27 + 3) = a1;
    *((_QWORD *)v27 + 4) = v37;
    *((_QWORD *)v27 + 5) = a3;
    *((_QWORD *)v27 + 6) = v38;
    *((_QWORD *)v27 + 7) = a5;
    v28 = v40;
    *((_QWORD *)v27 + 8) = v39;
    *((_QWORD *)v27 + 9) = v28;
    v29 = (void (**)())(v8 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_onClassifierLoaded);
    v30 = *(_QWORD *)(v8 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_onClassifierLoaded);
    *v29 = sub_213BF1344;
    v29[1] = v27;
    v31 = a1;
    swift_retain();
    swift_retain();
    swift_retain();
    sub_213BF1358(v30);
  }
}

void sub_213BEDC40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t *v25;
  uint8_t *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v32 = a3;
  v33 = a4;
  v31 = a2;
  v13 = sub_213C12588();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = a1 + 16;
  if (qword_254D27930 != -1)
    swift_once();
  v18 = __swift_project_value_buffer(v13, (uint64_t)qword_254D27938);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v18, v13);
  v19 = sub_213C12570();
  v20 = sub_213C12750();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    v30 = a5;
    v22 = a6;
    v23 = a7;
    v24 = a8;
    v25 = v21;
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_213BCD000, v19, v20, "PADInternalClassifier: Classifier loaded. Starting liveness from earlier call.", v21, 2u);
    v26 = v25;
    a8 = v24;
    a7 = v23;
    a6 = v22;
    a5 = v30;
    MEMORY[0x2199BF4BC](v26, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  swift_beginAccess();
  v27 = MEMORY[0x2199BF54C](v17);
  if (v27)
  {
    v28 = (void *)v27;
    sub_213BEDF64(v31, v32, v33, a5, a6, a7, a8);

  }
}

void sub_213BEDF18(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a1)
    v3 = sub_213C12480();
  else
    v3 = 0;
  v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);

}

void sub_213BEDF64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  id v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31[2];
  _QWORD v32[2];

  v30 = a6;
  v13 = sub_213C12588();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *(void **)(v7 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_classifier);
  if (v17)
  {
    v18 = (_QWORD *)(v7 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_gestureStartBlock);
    v19 = *(_QWORD *)(v7 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_gestureStartBlock);
    *v18 = a2;
    v18[1] = a3;
    v20 = v17;
    swift_retain();
    sub_213BF1358(v19);
    v21 = (_QWORD *)(v7 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_incorrectGestureDetectedBlock);
    v22 = *(_QWORD *)(v7 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_incorrectGestureDetectedBlock);
    *v21 = a4;
    v21[1] = a5;
    swift_retain();
    sub_213BF1358(v22);
    v23 = (_QWORD *)(v7 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_onGesturesFinishedBlock);
    v24 = *(_QWORD *)(v7 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_onGesturesFinishedBlock);
    *v23 = v30;
    v23[1] = a7;
    swift_retain();
    sub_213BF1358(v24);
    sub_213BEE18C(v32);
    v31[0] = v32[0];
    v31[1] = v32[1];
    sub_213BE08A8(v31);
    swift_bridgeObjectRelease();

  }
  else
  {
    if (qword_254D27930 != -1)
      swift_once();
    v25 = __swift_project_value_buffer(v13, (uint64_t)qword_254D27938);
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v25, v13);
    v26 = sub_213C12570();
    v27 = sub_213C1275C();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v28 = 0;
      MEMORY[0x2199BF4BC](v28, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  }
}

id sub_213BEE18C@<X0>(_QWORD *a1@<X8>)
{
  void *v1;
  id v3;
  unint64_t v4;
  uint64_t v5;
  id result;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  void *v10;
  unint64_t v11;
  unint64_t v13;
  unint64_t v14;
  id v15;
  _QWORD *v16;

  v3 = objc_msgSend(v1, sel_gestures);
  sub_213BF1DCC(0, &qword_254D27C38);
  v4 = sub_213C12690();

  if (!(v4 >> 62))
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = (id)swift_bridgeObjectRetain();
    v15 = v1;
    v16 = a1;
    if (v5)
      goto LABEL_3;
LABEL_19:
    v8 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_20:
    swift_bridgeObjectRelease_n();
    result = objc_msgSend(v15, sel_minNumberOfGestures);
    *v16 = v8;
    v16[1] = result;
    return result;
  }
  swift_bridgeObjectRetain();
  result = (id)sub_213C12918();
  v5 = (uint64_t)result;
  v15 = v1;
  v16 = a1;
  if (!result)
    goto LABEL_19;
LABEL_3:
  if (v5 >= 1)
  {
    v7 = 0;
    v8 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      if ((v4 & 0xC000000000000001) != 0)
        v9 = (id)MEMORY[0x2199BE994](v7, v4);
      else
        v9 = *(id *)(v4 + 8 * v7 + 32);
      v10 = v9;
      v11 = (unint64_t)objc_msgSend(v9, sel_integerValue, v15);

      if (v11 <= 0xA && ((1 << v11) & 0x73F) != 0)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v8 = sub_213BEA958(0, v8[2] + 1, 1, v8);
        v14 = v8[2];
        v13 = v8[3];
        if (v14 >= v13 >> 1)
          v8 = sub_213BEA958((_QWORD *)(v13 > 1), v14 + 1, 1, v8);
        v8[2] = v14 + 1;
        v8[v14 + 4] = v11;
      }
      ++v7;
    }
    while (v5 != v7);
    goto LABEL_20;
  }
  __break(1u);
  return result;
}

void sub_213BEE374(void *a1, int a2, unint64_t a3)
{
  uint64_t v3;
  id v6;
  char *v7;
  char v8;
  char *v9;
  id v10;
  unsigned __int8 v11[3];

  v6 = a1;
  v10 = sub_213BF16F0(v6);

  v7 = *(char **)(v3 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_classifier);
  if (v7)
  {
    if (a3 >= 3)
      v8 = 1;
    else
      v8 = a3;
    *(_BYTE *)(*(_QWORD *)&v7[OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_ta] + 185) = v8;
    v11[0] = BYTE1(a2) & 1;
    v11[1] = BYTE2(a2) & 1;
    v11[2] = a2 & 1;
    v9 = v7;
    sub_213BE0BB4(v10, v11);

  }
  else
  {

  }
}

void sub_213BEE494()
{
  sub_213BEE678(sub_213C07CD8);
}

void sub_213BEE4AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;

  v1 = sub_213C12588();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(char **)(v0 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_classifier);
  if (v5)
  {
    v6 = *(_QWORD *)&v5[OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_fac];
    v7 = qword_254D27930;
    v8 = v5;
    if (v7 != -1)
      swift_once();
    v9 = __swift_project_value_buffer(v1, (uint64_t)qword_254D27938);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v9, v1);
    v10 = sub_213C12570();
    v11 = sub_213C12750();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_213BCD000, v10, v11, "FAC Module: AX has been enabled", v12, 2u);
      MEMORY[0x2199BF4BC](v12, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    *(_BYTE *)(v6 + 257) = 1;

  }
}

void sub_213BEE624()
{
  sub_213BEE678((void (*)(void))sub_213C08778);
}

void sub_213BEE63C()
{
  sub_213BEE678((void (*)(void))sub_213C07F48);
}

void sub_213BEE654()
{
  sub_213BEE678((void (*)(void))sub_213C08204);
}

void sub_213BEE66C()
{
  sub_213BEE678((void (*)(void))sub_213C084C0);
}

void sub_213BEE678(void (*a1)(void))
{
  uint64_t v1;
  void *v2;
  id v4;

  v2 = *(void **)(v1 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_classifier);
  if (v2)
  {
    v4 = v2;
    a1();

  }
}

void sub_213BEE6E8(char *a1, uint64_t a2, void (*a3)(void))
{
  void *v3;
  char *v5;
  id v6;

  v3 = *(void **)&a1[OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_classifier];
  if (v3)
  {
    v5 = a1;
    v6 = v3;
    a3();

  }
}

void sub_213BEE764(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;

  v5 = v4;
  sub_213C127A4();
  v10 = (_QWORD *)(v4 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_selfieCompletionBlock);
  v11 = *(_QWORD *)(v4 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_selfieCompletionBlock);
  *v10 = a3;
  v10[1] = a4;
  swift_retain();
  sub_213BF1358(v11);
  sub_213C127B0();
  v12 = a1;
  v15 = sub_213BF16F0(v12);

  v13 = *(void **)(v5 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_classifier);
  if (v13)
  {
    v14 = v13;
    sub_213BE2BD4(v15, a2 & 1);

  }
}

void sub_213BEE8BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = sub_213C12480();
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);

}

void sub_213BEE914(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;

  sub_213C127A4();
  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_selfieCompletionBlock);
  v6 = *(_QWORD *)(v2 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_selfieCompletionBlock);
  *v5 = a1;
  v5[1] = a2;
  swift_retain();
  sub_213BF1358(v6);
  sub_213C127B0();
  v7 = *(void **)(v2 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_classifier);
  if (v7)
  {
    v8 = v7;
    sub_213BE0DEC();

  }
}

void sub_213BEE9E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t (**v7)();
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[3];
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[24];
  uint64_t v20;

  v3 = v2;
  sub_213C127A4();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  v7 = (uint64_t (**)())(v2 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_selfieCompletionBlock);
  v8 = *(_QWORD *)(v2 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_selfieCompletionBlock);
  *v7 = sub_213BF1B0C;
  v7[1] = (uint64_t (*)())v6;
  swift_retain();
  sub_213BF1358(v8);
  sub_213C127B0();
  v9 = OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_classifier;
  v10 = *(void **)(v2 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_classifier);
  if (v10)
  {
    v11 = (uint64_t)v10 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_delegate;
    swift_beginAccess();
    sub_213BF1E04(v11, (uint64_t)v19, (uint64_t *)&unk_254D28D30);
    if (v20)
    {
      sub_213BE2DA4((uint64_t)v19, (uint64_t)v16);
      v12 = v10;
      sub_213BE4088((uint64_t)v19, (uint64_t *)&unk_254D28D30);
      v13 = v17;
      v14 = v18;
      __swift_project_boxed_opaque_existential_1(v16, v17);
      (*(void (**)(_QWORD, uint64_t, uint64_t))(v14 + 56))(0, v13, v14);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);

    }
    else
    {
      sub_213BE4088((uint64_t)v19, (uint64_t *)&unk_254D28D30);
    }
    v15 = *(void **)(v3 + v9);
  }
  else
  {
    v15 = 0;
  }
  *(_QWORD *)(v3 + v9) = 0;

}

uint64_t sub_213BEEB68(void *a1, int a2, void *aBlock, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t))
{
  void *v9;
  uint64_t v10;
  id v11;

  v9 = _Block_copy(aBlock);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  v11 = a1;
  a6(a5, v10);

  return swift_release();
}

id PADInternalClassifier.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PADInternalClassifier();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::Void __swiftcall PADInternalClassifier.padClassifierDidFinishGestureDetection()()
{
  uint64_t v0;
  void (*v1)(_QWORD);

  v1 = *(void (**)(_QWORD))(v0 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_onGesturesFinishedBlock);
  if (v1)
  {
    swift_retain();
    v1(0);
    sub_213BF1358((uint64_t)v1);
  }
}

void PADInternalClassifier.padClassifierWillStartDetectingGesture(_:)()
{
  uint64_t v0;
  void (*v1)(void);
  id v2;

  v1 = *(void (**)(void))(v0 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_gestureStartBlock);
  if (v1)
  {
    swift_retain();
    v2 = (id)sub_213C1272C();
    v1();
    sub_213BF1358((uint64_t)v1);

  }
}

void PADInternalClassifier.padClassifierDidDetectIncorrectGesture(duringDetectionOfGesture:)()
{
  uint64_t v0;
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(v0
                                      + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_incorrectGestureDetectedBlock);
  if (v1)
  {
    v2 = swift_retain();
    v1(v2);
    sub_213BF1358((uint64_t)v1);
  }
}

uint64_t PADInternalClassifier.padClassifierDidDetectStitchWhileDetectingFrame(_:shouldBeIgnored:)(uint64_t a1, char a2)
{
  return sub_213BF153C(a2);
}

void sub_213BEEDF4()
{
  id v0;
  id v1;

  v0 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  v1 = v0;
  if (qword_254D27970 != -1)
  {
    swift_once();
    v0 = v1;
  }
  objc_msgSend(v0, sel_postNotificationName_object_, qword_254D286E0, 0);

}

uint64_t sub_213BEEE78(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t PADInternalClassifier.padClassifierDidCompleteAssessment(withResult:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t *v19;
  void (*v20)(id, _QWORD);
  id v21;
  uint64_t v22;
  _OWORD v24[15];
  uint64_t v25;

  v2 = v1;
  v4 = sub_213C12588();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_OWORD *)(a1 + 208);
  v24[12] = *(_OWORD *)(a1 + 192);
  v24[13] = v8;
  v24[14] = *(_OWORD *)(a1 + 224);
  v25 = *(_QWORD *)(a1 + 240);
  v9 = *(_OWORD *)(a1 + 144);
  v24[8] = *(_OWORD *)(a1 + 128);
  v24[9] = v9;
  v10 = *(_OWORD *)(a1 + 176);
  v24[10] = *(_OWORD *)(a1 + 160);
  v24[11] = v10;
  v11 = *(_OWORD *)(a1 + 80);
  v24[4] = *(_OWORD *)(a1 + 64);
  v24[5] = v11;
  v12 = *(_OWORD *)(a1 + 112);
  v24[6] = *(_OWORD *)(a1 + 96);
  v24[7] = v12;
  v13 = *(_OWORD *)(a1 + 16);
  v24[0] = *(_OWORD *)a1;
  v24[1] = v13;
  v14 = *(_OWORD *)(a1 + 48);
  v24[2] = *(_OWORD *)(a1 + 32);
  v24[3] = v14;
  if (qword_254D27930 != -1)
    swift_once();
  v15 = __swift_project_value_buffer(v4, (uint64_t)qword_254D27938);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v15, v4);
  v16 = sub_213C12570();
  v17 = sub_213C12750();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_213BCD000, v16, v17, "PADInternalClassifier padClassifierDidCompleteAssessment", v18, 2u);
    MEMORY[0x2199BF4BC](v18, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_213C127A4();
  v19 = (uint64_t *)(v2 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_selfieCompletionBlock);
  v20 = *(void (**)(id, _QWORD))(v2
                                          + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_selfieCompletionBlock);
  if (v20)
  {
    swift_retain();
    v21 = sub_213BEF0B4();
    v20(v21, 0);
    sub_213BF1358((uint64_t)v20);

    v22 = *v19;
  }
  else
  {
    v22 = 0;
  }
  *v19 = 0;
  v19[1] = 0;
  sub_213BF1358(v22);
  return sub_213C127B0();
}

id sub_213BEF0B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  void *v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  void *v37;
  int64_t v38;
  _QWORD *v39;
  const __CFAllocator **v40;
  uint64_t v41;
  uint64_t v42;
  const __CFAllocator *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  CFDictionaryRef v47;
  CFDictionaryRef v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  void *v54;
  int64_t v55;
  uint64_t v56;
  uint64_t v57;
  CMTimeValue value;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  id v64;
  double v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  void *v69;
  uint64_t v70;
  const __CFAllocator *v71;
  uint64_t v72;
  _QWORD *v73;
  CFDictionaryRef v74;
  CFDictionaryRef v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  const __CFAllocator *v82;
  uint64_t v83;
  _QWORD *v84;
  CFDictionaryRef v85;
  CFDictionaryRef v86;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  uint64_t v90;
  void *v91;
  id v92;
  double v93;
  id v94;
  id v95;
  id v96;
  double v97;
  id v98;
  id v99;
  double v100;
  id v101;
  id v102;
  id v103;
  double v104;
  id v105;
  id v106;
  double v107;
  id v108;
  id v109;
  double v110;
  id v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  id v126;
  uint64_t v127;
  int64_t v128;
  uint64_t v129;
  int64_t v130;
  uint64_t v131;
  CMTime time;
  uint64_t v133;

  v1 = *(_QWORD *)(v0 + 8);
  v3 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  v4 = *(_QWORD *)(v0 + 32);
  v127 = *(_QWORD *)(v0 + 48);
  v129 = *(_QWORD *)(v0 + 56);
  v124 = *(_QWORD *)(v0 + 40);
  v125 = *(_QWORD *)(v0 + 64);
  v5 = *(_DWORD *)(v0 + 72);
  v7 = *(_DWORD *)(v0 + 88);
  v6 = *(_DWORD *)(v0 + 92);
  v8 = *(_DWORD *)(v0 + 96);
  v9 = *(_DWORD *)(v0 + 100);
  v10 = *(_DWORD *)(v0 + 104);
  v122 = *(_QWORD *)(v0 + 80);
  v123 = *(_QWORD *)(v0 + 112);
  v121 = *(_QWORD *)(v0 + 128);
  v11 = objc_msgSend(objc_allocWithZone((Class)PADClassifierResult), sel_init);
  v12 = (void *)sub_213C1272C();
  v126 = v11;
  objc_msgSend(v11, sel_setLivenessLabel_, v12);

  v13 = *(_QWORD *)(v1 + 16);
  if (v13)
  {
    time.value = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_213C128D0();
    v14 = 0;
    do
    {
      v15 = v14 + 1;
      sub_213C1272C();
      sub_213C128B8();
      sub_213C128DC();
      sub_213C128E8();
      sub_213C128C4();
      v14 = v15;
    }
    while (v13 != v15);
    swift_bridgeObjectRelease();
  }
  sub_213BF1DCC(0, &qword_254D27C38);
  v16 = (void *)sub_213C12684();
  swift_bridgeObjectRelease();
  objc_msgSend(v126, sel_setGestureSequence_, v16);

  v17 = *(_QWORD *)(v3 + 16);
  if (v17)
  {
    time.value = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_213C128D0();
    v18 = 0;
    do
    {
      v19 = v18 + 1;
      sub_213C1272C();
      sub_213C128B8();
      sub_213C128DC();
      sub_213C128E8();
      sub_213C128C4();
      v18 = v19;
    }
    while (v17 != v19);
    swift_bridgeObjectRelease();
  }
  v20 = (void *)sub_213C12684();
  swift_bridgeObjectRelease();
  objc_msgSend(v126, sel_setAssessmentsFAC_, v20);

  v21 = *(_QWORD *)(v2 + 16);
  if (v21)
  {
    swift_bridgeObjectRetain_n();
    v22 = v2 + 56;
    v23 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      v24 = (void *)sub_213BF047C();
      v25 = sub_213BF0930();

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v23 = sub_213BEA838(0, v23[2] + 1, 1, v23);
      v27 = v23[2];
      v26 = v23[3];
      if (v27 >= v26 >> 1)
        v23 = sub_213BEA838((_QWORD *)(v26 > 1), v27 + 1, 1, v23);
      v23[2] = v27 + 1;
      v23[v27 + 4] = v25;
      v22 += 32;
      --v21;
    }
    while (v21);
    swift_bridgeObjectRelease_n();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D27EF0);
  v28 = (void *)sub_213C12684();
  swift_bridgeObjectRelease();
  objc_msgSend(v126, sel_setAssessmentsPRD_, v28);

  v29 = *(_QWORD *)(v4 + 16);
  if (v29)
  {
    swift_bridgeObjectRetain_n();
    v30 = v4 + 44;
    v31 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      v32 = (void *)sub_213BF06D4();
      v33 = sub_213BF0930();

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v31 = sub_213BEA838(0, v31[2] + 1, 1, v31);
      v35 = v31[2];
      v34 = v31[3];
      if (v35 >= v34 >> 1)
        v31 = sub_213BEA838((_QWORD *)(v34 > 1), v35 + 1, 1, v31);
      v31[2] = v35 + 1;
      v31[v35 + 4] = v33;
      v30 += 16;
      --v29;
    }
    while (v29);
    swift_bridgeObjectRelease_n();
  }
  v36 = v127;
  v37 = (void *)sub_213C12684();
  swift_bridgeObjectRelease();
  objc_msgSend(v126, sel_setAssessmentsTA_, v37);

  v38 = *(_QWORD *)(v124 + 16);
  v39 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (v38)
  {
    v133 = MEMORY[0x24BEE4AF8];
    v40 = (const __CFAllocator **)MEMORY[0x24BDBD240];
    swift_bridgeObjectRetain();
    sub_213C0D588(0, v38, 0);
    v41 = 0;
    v42 = v133;
    v43 = *v40;
    v128 = v38;
    do
    {
      v44 = *(_QWORD *)(v124 + 32 + 8 * v41);
      v45 = *(_QWORD *)(v44 + 16);
      if (v45)
      {
        v131 = v42;
        swift_bridgeObjectRetain_n();
        for (i = 0; i != v45; ++i)
        {
          CMTimeMake(&time, *(_QWORD *)(v44 + 8 * i + 32), 1000000000);
          v47 = CMTimeCopyAsDictionary(&time, v43);
          if (v47)
          {
            v48 = v47;
            time.value = 0;
            sub_213C125D0();

            if (time.value)
            {
              v49 = sub_213BF0F80(time.value);
              swift_bridgeObjectRelease();
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                v39 = sub_213BEA824(0, v39[2] + 1, 1, v39);
              v51 = v39[2];
              v50 = v39[3];
              if (v51 >= v50 >> 1)
                v39 = sub_213BEA824((_QWORD *)(v50 > 1), v51 + 1, 1, v39);
              v39[2] = v51 + 1;
              v39[v51 + 4] = v49;
            }
          }
        }
        swift_bridgeObjectRelease_n();
        v38 = v128;
        v42 = v131;
      }
      v133 = v42;
      v53 = *(_QWORD *)(v42 + 16);
      v52 = *(_QWORD *)(v42 + 24);
      if (v53 >= v52 >> 1)
      {
        sub_213C0D588(v52 > 1, v53 + 1, 1);
        v42 = v133;
      }
      ++v41;
      *(_QWORD *)(v42 + 16) = v53 + 1;
      *(_QWORD *)(v42 + 8 * v53 + 32) = v39;
      v39 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    while (v41 != v38);
    swift_bridgeObjectRelease();
    v36 = v127;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D27FB8);
  v54 = (void *)sub_213C12684();
  swift_bridgeObjectRelease();
  objc_msgSend(v126, sel_setTimestampsFAC_, v54);

  v55 = *(_QWORD *)(v125 + 16);
  v56 = MEMORY[0x24BEE4AF8];
  if (v55)
  {
    time.value = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_213C0D55C(0, v55, 0);
    v57 = 0;
    value = time.value;
    v130 = v55;
    do
    {
      v59 = *(_QWORD *)(v125 + 32 + 8 * v57);
      v60 = *(_QWORD *)(v59 + 16);
      if (v60)
      {
        v133 = v56;
        swift_bridgeObjectRetain();
        sub_213C128D0();
        v61 = 0;
        do
        {
          v62 = v61 + 1;
          v63 = *(_DWORD *)(v59 + 4 * v61 + 32);
          v64 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
          LODWORD(v65) = v63;
          objc_msgSend(v64, sel_initWithFloat_, v65);
          sub_213C128B8();
          sub_213C128DC();
          sub_213C128E8();
          sub_213C128C4();
          v61 = v62;
        }
        while (v60 != v62);
        v66 = v133;
        swift_bridgeObjectRelease();
        v56 = MEMORY[0x24BEE4AF8];
        v55 = v130;
      }
      else
      {
        v66 = v56;
      }
      time.value = value;
      v68 = *(_QWORD *)(value + 16);
      v67 = *(_QWORD *)(value + 24);
      if (v68 >= v67 >> 1)
      {
        sub_213C0D55C(v67 > 1, v68 + 1, 1);
        value = time.value;
      }
      ++v57;
      *(_QWORD *)(value + 16) = v68 + 1;
      *(_QWORD *)(value + 8 * v68 + 32) = v66;
    }
    while (v57 != v55);
    swift_bridgeObjectRelease();
    v36 = v127;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D27FC0);
  v69 = (void *)sub_213C12684();
  swift_bridgeObjectRelease();
  objc_msgSend(v126, sel_setFaceprintsID_, v69);

  v70 = *(_QWORD *)(v36 + 16);
  if (v70)
  {
    v71 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    swift_bridgeObjectRetain_n();
    v72 = 0;
    v73 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      CMTimeMake(&time, *(_QWORD *)(v36 + 8 * v72 + 32), 1000000000);
      v74 = CMTimeCopyAsDictionary(&time, v71);
      if (v74)
      {
        v75 = v74;
        time.value = 0;
        sub_213C125D0();

        if (time.value)
        {
          v76 = sub_213BF0F80(time.value);
          swift_bridgeObjectRelease();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v73 = sub_213BEA824(0, v73[2] + 1, 1, v73);
          v78 = v73[2];
          v77 = v73[3];
          if (v78 >= v77 >> 1)
            v73 = sub_213BEA824((_QWORD *)(v77 > 1), v78 + 1, 1, v73);
          v73[2] = v78 + 1;
          v73[v78 + 4] = v76;
          v36 = v127;
        }
      }
      ++v72;
    }
    while (v70 != v72);
    swift_bridgeObjectRelease_n();
  }
  v79 = v129;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D27EE0);
  v80 = (void *)sub_213C12684();
  swift_bridgeObjectRelease();
  objc_msgSend(v126, sel_setTimestampsID_, v80);

  v81 = *(_QWORD *)(v129 + 16);
  if (v81)
  {
    v82 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    swift_bridgeObjectRetain_n();
    v83 = 0;
    v84 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      CMTimeMake(&time, *(_QWORD *)(v79 + 8 * v83 + 32), 1000000000);
      v85 = CMTimeCopyAsDictionary(&time, v82);
      if (v85)
      {
        v86 = v85;
        time.value = 0;
        sub_213C125D0();

        if (time.value)
        {
          v87 = sub_213BF0F80(time.value);
          swift_bridgeObjectRelease();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v84 = sub_213BEA824(0, v84[2] + 1, 1, v84);
          v89 = v84[2];
          v88 = v84[3];
          if (v89 >= v88 >> 1)
            v84 = sub_213BEA824((_QWORD *)(v88 > 1), v89 + 1, 1, v84);
          v84[2] = v89 + 1;
          v84[v89 + 4] = v87;
        }
        v79 = v129;
      }
      ++v83;
    }
    while (v81 != v83);
    swift_bridgeObjectRelease_n();
    v90 = v121;
  }
  else
  {
    v90 = v121;
  }
  v91 = (void *)sub_213C12684();
  swift_bridgeObjectRelease();
  objc_msgSend(v126, sel_setTimestampsButtonPressed_, v91);

  v92 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
  LODWORD(v93) = v5;
  v94 = objc_msgSend(v92, sel_initWithFloat_, v93);
  objc_msgSend(v126, sel_setAssessmentFAC_, v94);

  v95 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, v122);
  objc_msgSend(v126, sel_setAssessmentTA_, v95);

  v96 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
  LODWORD(v97) = v9;
  v98 = objc_msgSend(v96, sel_initWithFloat_, v97);
  objc_msgSend(v126, sel_setMaxNccLow_, v98);

  v99 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
  LODWORD(v100) = v10;
  v101 = objc_msgSend(v99, sel_initWithFloat_, v100);
  objc_msgSend(v126, sel_setMaxNccHigh_, v101);

  v102 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, v123);
  objc_msgSend(v126, sel_setIgnoredStitches_, v102);

  v103 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
  LODWORD(v104) = v7;
  v105 = objc_msgSend(v103, sel_initWithFloat_, v104);
  objc_msgSend(v126, sel_setAssessmentFakePRD_, v105);

  v106 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
  LODWORD(v107) = v6;
  v108 = objc_msgSend(v106, sel_initWithFloat_, v107);
  objc_msgSend(v126, sel_setAssessmentLivePRD_, v108);

  v109 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
  LODWORD(v110) = v8;
  v111 = objc_msgSend(v109, sel_initWithFloat_, v110);
  objc_msgSend(v126, sel_setAssessmentID_, v111);

  if (v90)
    v112 = (void *)sub_213C125E8();
  else
    v112 = 0;
  objc_msgSend(v126, sel_setDeviceInfo_, v112);

  swift_bridgeObjectRetain();
  v113 = (void *)sub_213C125E8();
  swift_bridgeObjectRelease();
  objc_msgSend(v126, sel_setAgeLabel_, v113);

  swift_bridgeObjectRetain();
  v114 = (void *)sub_213C125E8();
  swift_bridgeObjectRelease();
  objc_msgSend(v126, sel_setSexLabel_, v114);

  swift_bridgeObjectRetain();
  v115 = (void *)sub_213C125E8();
  swift_bridgeObjectRelease();
  objc_msgSend(v126, sel_setSkintoneLabel_, v115);

  swift_bridgeObjectRetain();
  v116 = (void *)sub_213C125E8();
  swift_bridgeObjectRelease();
  objc_msgSend(v126, sel_setEthnicityLabel_, v116);

  swift_bridgeObjectRetain();
  v117 = (void *)sub_213C125E8();
  swift_bridgeObjectRelease();
  objc_msgSend(v126, sel_setFaceHairLabel_, v117);

  swift_bridgeObjectRetain();
  v118 = (void *)sub_213C125E8();
  swift_bridgeObjectRelease();
  objc_msgSend(v126, sel_setHeadgearLabel_, v118);

  swift_bridgeObjectRetain();
  v119 = (void *)sub_213C125E8();
  swift_bridgeObjectRelease();
  objc_msgSend(v126, sel_setGlassesLabel_, v119);

  return v126;
}

uint64_t PADInternalClassifier.padClassifierDidCancelWithError(_:)(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t *v18;
  void (*v19)(_QWORD, void *);
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v2 = v1;
  v4 = sub_213C12588();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_254D27930 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v4, (uint64_t)qword_254D27938);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = a1;
  v10 = a1;
  v11 = sub_213C12570();
  v12 = sub_213C12750();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v25 = v14;
    *(_DWORD *)v13 = 136315138;
    v23 = v1;
    if (a1)
    {
      swift_getErrorValue();
      v15 = sub_213C12A44();
      v17 = v16;
    }
    else
    {
      v17 = 0x8000000213C17990;
      v15 = 0xD000000000000017;
    }
    v24 = sub_213BEB0C8(v15, v17, &v25);
    sub_213C127F8();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_213BCD000, v11, v12, "PADInternalClassifier padClassifierDidCancelWithError: %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199BF4BC](v14, -1, -1);
    MEMORY[0x2199BF4BC](v13, -1, -1);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    v2 = v23;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  sub_213C127A4();
  v18 = (uint64_t *)(v2 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_selfieCompletionBlock);
  v19 = *(void (**)(_QWORD, void *))(v2
                                              + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_selfieCompletionBlock);
  if (v19)
  {
    swift_retain();
    v19(0, a1);
    sub_213BF1358((uint64_t)v19);
    v20 = *v18;
  }
  else
  {
    v20 = 0;
  }
  *v18 = 0;
  v18[1] = 0;
  sub_213BF1358(v20);
  return sub_213C127B0();
}

void sub_213BF0304()
{
  _QWORD *v0;
  void (*v1)(void);
  id v2;

  v1 = *(void (**)(void))(*v0 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_gestureStartBlock);
  if (v1)
  {
    swift_retain();
    v2 = (id)sub_213C1272C();
    v1();
    sub_213BF1358((uint64_t)v1);

  }
}

void sub_213BF0388()
{
  _QWORD *v0;
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(*v0
                                      + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_incorrectGestureDetectedBlock);
  if (v1)
  {
    v2 = swift_retain();
    v1(v2);
    sub_213BF1358((uint64_t)v1);
  }
}

uint64_t sub_213BF03DC(uint64_t a1, char a2)
{
  return sub_213BF153C(a2);
}

uint64_t sub_213BF03E4()
{
  _QWORD *v0;
  void (*v1)(_QWORD);
  uint64_t result;

  v1 = *(void (**)(_QWORD))(*v0 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_onGesturesFinishedBlock);
  if (v1)
  {
    swift_retain();
    v1(0);
    return sub_213BF1358((uint64_t)v1);
  }
  return result;
}

uint64_t sub_213BF043C(uint64_t a1)
{
  return PADInternalClassifier.padClassifierDidCompleteAssessment(withResult:)(a1);
}

uint64_t sub_213BF045C(void *a1)
{
  return PADInternalClassifier.padClassifierDidCancelWithError(_:)(a1);
}

uint64_t sub_213BF047C()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _BYTE v11[32];
  _OWORD v12[2];
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  _OWORD v16[2];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  sub_213C1242C();
  swift_allocObject();
  sub_213C12420();
  sub_213BDDC48();
  v0 = sub_213C12414();
  v2 = v1;
  swift_release();
  v3 = (void *)objc_opt_self();
  v4 = (void *)sub_213C1251C();
  *(_QWORD *)&v16[0] = 0;
  v5 = objc_msgSend(v3, sel_JSONObjectWithData_options_error_, v4, 4, v16);

  v6 = *(id *)&v16[0];
  if (v5)
  {
    sub_213C12810();
    swift_unknownObjectRelease();
  }
  else
  {
    v7 = v6;
    v8 = (void *)sub_213C1248C();

    swift_willThrow();
    memset(v16, 0, sizeof(v16));
  }
  sub_213BF1E04((uint64_t)v16, (uint64_t)&v13, &qword_254D27FD8);
  if (!v14)
    goto LABEL_8;
  sub_213BF1CC8(&v13, v12);
  sub_213BECBD4((uint64_t)v12, (uint64_t)v11);
  sub_213BF1DCC(0, &qword_254D27FD0);
  if ((swift_dynamicCast() & 1) == 0)
    v15 = 0;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  v9 = v15;
  if (!v15)
  {
LABEL_8:
    sub_213BF1DCC(0, &qword_254D27FD0);
    v9 = sub_213C12738();
  }
  sub_213BEBA50(v0, v2);
  sub_213BE4088((uint64_t)v16, &qword_254D27FD8);
  return v9;
}

uint64_t sub_213BF06D4()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _BYTE v11[32];
  _OWORD v12[2];
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  _OWORD v16[2];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  sub_213C1242C();
  swift_allocObject();
  sub_213C12420();
  sub_213BDDC8C();
  v0 = sub_213C12414();
  v2 = v1;
  swift_release();
  v3 = (void *)objc_opt_self();
  v4 = (void *)sub_213C1251C();
  *(_QWORD *)&v16[0] = 0;
  v5 = objc_msgSend(v3, sel_JSONObjectWithData_options_error_, v4, 4, v16);

  v6 = *(id *)&v16[0];
  if (v5)
  {
    sub_213C12810();
    swift_unknownObjectRelease();
  }
  else
  {
    v7 = v6;
    v8 = (void *)sub_213C1248C();

    swift_willThrow();
    memset(v16, 0, sizeof(v16));
  }
  sub_213BF1E04((uint64_t)v16, (uint64_t)&v13, &qword_254D27FD8);
  if (!v14)
    goto LABEL_8;
  sub_213BF1CC8(&v13, v12);
  sub_213BECBD4((uint64_t)v12, (uint64_t)v11);
  sub_213BF1DCC(0, &qword_254D27FD0);
  if ((swift_dynamicCast() & 1) == 0)
    v15 = 0;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  v9 = v15;
  if (!v15)
  {
LABEL_8:
    sub_213BF1DCC(0, &qword_254D27FD0);
    v9 = sub_213C12738();
  }
  sub_213BEBA50(v0, v2);
  sub_213BE4088((uint64_t)v16, &qword_254D27FD8);
  return v9;
}

uint64_t sub_213BF0930()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  _QWORD *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  char isUniquelyReferenced_nonNull_native;
  char v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  char v19;
  unint64_t v20;
  char v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  uint64_t v27;
  _BOOL8 v28;
  uint64_t v29;
  char v30;
  unint64_t v31;
  char v32;
  char v33;
  char v34;
  char v35;
  unint64_t v36;
  void *v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  BOOL v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t result;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  __int128 v52;
  double v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[3];
  uint64_t v57;
  __int128 v58;
  uint64_t v59;
  __int128 v60;
  uint64_t v61;

  v1 = v0;
  v2 = sub_213C124A4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend(v0, sel_keyEnumerator);
  sub_213C12744();

  sub_213C12498();
  if (!v61)
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
LABEL_47:
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return (uint64_t)v7;
  }
  v7 = (_QWORD *)MEMORY[0x24BEE4B00];
  v8 = MEMORY[0x24BEE4AD8];
  while (1)
  {
    sub_213BF1CC8(&v60, &v58);
    sub_213BECBD4((uint64_t)&v58, (uint64_t)v56);
    if (swift_dynamicCast())
      break;
LABEL_4:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v58);
    sub_213C12498();
    if (!v61)
      goto LABEL_47;
  }
  v52 = v54;
  __swift_project_boxed_opaque_existential_1(&v58, v59);
  v9 = objc_msgSend(v1, sel_objectForKey_, sub_213C12A08());
  swift_unknownObjectRelease();
  if (v9)
  {
    sub_213C12810();
    swift_unknownObjectRelease();
  }
  else
  {
    v54 = 0u;
    v55 = 0u;
  }
  sub_213BF1CD8((uint64_t)&v54, (uint64_t)v56);
  if (v57)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, v53);
      if (v10)
      {
        v49 = (uint64_t)v10;
        v51 = v1;
        v11 = v2;
        v12 = v8;
        v50 = v3;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v56[0] = v7;
        v15 = sub_213C0DF08(v52, *((uint64_t *)&v52 + 1));
        v16 = v7[2];
        v17 = (v14 & 1) == 0;
        v18 = v16 + v17;
        if (__OFADD__(v16, v17))
          goto LABEL_49;
        v19 = v14;
        if (v7[3] >= v18)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            sub_213C06C8C();
        }
        else
        {
          sub_213C05F08(v18, isUniquelyReferenced_nonNull_native);
          v20 = sub_213C0DF08(v52, *((uint64_t *)&v52 + 1));
          if ((v19 & 1) != (v21 & 1))
            goto LABEL_52;
          v15 = v20;
        }
        v8 = v12;
        v7 = (_QWORD *)v56[0];
        v2 = v11;
        if ((v19 & 1) == 0)
        {
          *(_QWORD *)(v56[0] + 8 * (v15 >> 6) + 64) |= 1 << v15;
          v45 = (_QWORD *)(v7[6] + 16 * v15);
          v46 = *((_QWORD *)&v52 + 1);
          *v45 = v52;
          v45[1] = v46;
          *(_QWORD *)(v7[7] + 8 * v15) = v49;
          v47 = v7[2];
          v41 = __OFADD__(v47, 1);
          v42 = v47 + 1;
          v1 = v51;
          if (v41)
            goto LABEL_51;
          goto LABEL_43;
        }
        goto LABEL_41;
      }
      swift_bridgeObjectRetain();
      *(_QWORD *)&v52 = sub_213C0DF08(v52, *((uint64_t *)&v52 + 1));
      v34 = v33;
      swift_bridgeObjectRelease();
      if ((v34 & 1) != 0)
      {
        v35 = swift_isUniquelyReferenced_nonNull_native();
        v56[0] = v7;
        if ((v35 & 1) == 0)
        {
          sub_213C06C8C();
          v7 = (_QWORD *)v56[0];
        }
        v36 = v52;
        swift_bridgeObjectRelease();
        v37 = *(void **)(v7[7] + 8 * v36);
        sub_213BF1368(v36, (uint64_t)v7);

        goto LABEL_44;
      }
      goto LABEL_27;
    }
  }
  else
  {
    sub_213BE4088((uint64_t)v56, &qword_254D27FD8);
  }
  __swift_project_boxed_opaque_existential_1(&v58, v59);
  v22 = objc_msgSend(v1, sel_objectForKey_, sub_213C12A08());
  swift_unknownObjectRelease();
  if (v22)
  {
    sub_213C12810();
    swift_unknownObjectRelease();
  }
  else
  {
    v54 = 0u;
    v55 = 0u;
  }
  sub_213BF1CD8((uint64_t)&v54, (uint64_t)v56);
  if (!v57)
  {
    swift_bridgeObjectRelease();
    sub_213BE4088((uint64_t)v56, &qword_254D27FD8);
    goto LABEL_4;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_27:
    swift_bridgeObjectRelease();
    goto LABEL_4;
  }
  v51 = v1;
  v23 = v2;
  v24 = v8;
  v50 = v3;
  v49 = sub_213C126D8();
  v25 = swift_isUniquelyReferenced_nonNull_native();
  v56[0] = v7;
  v15 = sub_213C0DF08(v52, *((uint64_t *)&v52 + 1));
  v27 = v7[2];
  v28 = (v26 & 1) == 0;
  v29 = v27 + v28;
  if (!__OFADD__(v27, v28))
  {
    v30 = v26;
    if (v7[3] >= v29)
    {
      if ((v25 & 1) == 0)
        sub_213C06C8C();
    }
    else
    {
      sub_213C05F08(v29, v25);
      v31 = sub_213C0DF08(v52, *((uint64_t *)&v52 + 1));
      if ((v30 & 1) != (v32 & 1))
        goto LABEL_52;
      v15 = v31;
    }
    v8 = v24;
    v7 = (_QWORD *)v56[0];
    v2 = v23;
    if ((v30 & 1) == 0)
    {
      *(_QWORD *)(v56[0] + 8 * (v15 >> 6) + 64) |= 1 << v15;
      v38 = (_QWORD *)(v7[6] + 16 * v15);
      v39 = *((_QWORD *)&v52 + 1);
      *v38 = v52;
      v38[1] = v39;
      *(_QWORD *)(v7[7] + 8 * v15) = v49;
      v40 = v7[2];
      v41 = __OFADD__(v40, 1);
      v42 = v40 + 1;
      v1 = v51;
      if (v41)
        goto LABEL_50;
LABEL_43:
      v7[2] = v42;
      swift_bridgeObjectRetain();
      v3 = v50;
LABEL_44:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_4;
    }
LABEL_41:
    v43 = v7[7];
    v44 = 8 * v15;

    *(_QWORD *)(v43 + v44) = v49;
    v3 = v50;
    v1 = v51;
    goto LABEL_44;
  }
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  __break(1u);
LABEL_52:
  result = sub_213C12A38();
  __break(1u);
  return result;
}

uint64_t sub_213BF0F80(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  _OWORD v31[2];
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  _OWORD v35[2];
  _OWORD v36[3];
  _OWORD v37[2];
  __int128 v38;
  _OWORD v39[2];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D27FC8);
    v2 = sub_213C1293C();
  }
  else
  {
    v2 = MEMORY[0x24BEE4B00];
  }
  v26 = a1 + 64;
  v3 = 1 << *(_BYTE *)(a1 + 32);
  if (v3 < 64)
    v4 = ~(-1 << v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v27 = (unint64_t)(v3 + 63) >> 6;
  v6 = v2 + 64;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v12 = v11 | (v8 << 6);
      goto LABEL_26;
    }
    v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v13 >= v27)
      goto LABEL_35;
    v14 = *(_QWORD *)(v26 + 8 * v13);
    ++v8;
    if (!v14)
    {
      v8 = v13 + 1;
      if (v13 + 1 >= v27)
        goto LABEL_35;
      v14 = *(_QWORD *)(v26 + 8 * v8);
      if (!v14)
      {
        v8 = v13 + 2;
        if (v13 + 2 >= v27)
          goto LABEL_35;
        v14 = *(_QWORD *)(v26 + 8 * v8);
        if (!v14)
          break;
      }
    }
LABEL_25:
    v5 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v8 << 6);
LABEL_26:
    v16 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v18 = *v16;
    v17 = v16[1];
    sub_213BECBD4(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)v39);
    *(_QWORD *)&v38 = v18;
    *((_QWORD *)&v38 + 1) = v17;
    v36[2] = v38;
    v37[0] = v39[0];
    v37[1] = v39[1];
    *(_QWORD *)&v36[0] = v18;
    *((_QWORD *)&v36[0] + 1) = v17;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_213BF1CC8(v37, v31);
    v32 = v28;
    v33 = v29;
    v34 = v30;
    sub_213BF1CC8(v31, v35);
    v28 = v32;
    v29 = v33;
    v30 = v34;
    sub_213BF1CC8(v35, v36);
    sub_213BF1CC8(v36, &v32);
    result = sub_213C12834();
    v19 = -1 << *(_BYTE *)(v2 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      v9 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v24 = v21 == v23;
        if (v21 == v23)
          v21 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v6 + 8 * v21);
      }
      while (v25 == -1);
      v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(_QWORD *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    v10 = *(_QWORD *)(v2 + 48) + 40 * v9;
    *(_OWORD *)v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(_QWORD *)(v10 + 32) = v30;
    result = (uint64_t)sub_213BF1CC8(&v32, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v15 = v13 + 3;
  if (v15 >= v27)
  {
LABEL_35:
    swift_release();
    swift_release();
    return v2;
  }
  v14 = *(_QWORD *)(v26 + 8 * v15);
  if (v14)
  {
    v8 = v15;
    goto LABEL_25;
  }
  while (1)
  {
    v8 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v8 >= v27)
      goto LABEL_35;
    v14 = *(_QWORD *)(v26 + 8 * v8);
    ++v15;
    if (v14)
      goto LABEL_25;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_213BF1300()
{
  uint64_t v0;

  swift_release();

  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_213BF1344()
{
  uint64_t *v0;

  sub_213BEDC40(v0[2], v0[3], v0[4], v0[5], v0[6], v0[7], v0[8], v0[9]);
}

uint64_t sub_213BF1358(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

unint64_t sub_213BF1368(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_213C12828();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_213C12A50();
        swift_bridgeObjectRetain();
        sub_213C1263C();
        v9 = sub_213C12A68();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 16 * v3);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = (_QWORD *)(v14 + 8 * v3);
          v16 = (_QWORD *)(v14 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_213BF153C(char a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  char *v10;
  void *v11;
  void *v12;
  _QWORD aBlock[6];

  v2 = sub_213C12594();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_213C125AC();
  v7 = *(_QWORD *)(v6 - 8);
  result = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) == 0)
  {
    sub_213BF1DCC(0, &qword_254D27FE0);
    v11 = (void *)sub_213C12780();
    aBlock[4] = sub_213BEEDF4;
    aBlock[5] = 0;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_213BEEE78;
    aBlock[3] = &block_descriptor_0;
    v12 = _Block_copy(aBlock);
    sub_213C125A0();
    aBlock[0] = MEMORY[0x24BEE4AF8];
    sub_213BF1D38();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D27FF0);
    sub_213BF1D80();
    sub_213C1281C();
    MEMORY[0x2199BE88C](0, v10, v5, v12);
    _Block_release(v12);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  return result;
}

id sub_213BF16F0(void *a1)
{
  id v2;
  void *v3;
  unint64_t v4;
  unint64_t v5;
  char v6;
  char v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  id result;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  double v24;
  float v25;
  double v26;
  float v27;
  double v28;
  float v29;
  objc_class *v30;
  char *v31;
  id v32;
  objc_class *v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  unsigned int v42;
  objc_class *v43;
  char *v44;
  char *v45;
  char v46;
  objc_super v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  objc_super v51;
  objc_super v52;

  v2 = objc_msgSend(a1, sel_gestureToDetect);
  if (v2)
  {
    v3 = v2;
    v4 = (unint64_t)objc_msgSend(v2, sel_integerValue);

  }
  else
  {
    v4 = 10;
  }
  v5 = sub_213BFCFD0(v4);
  v7 = v6;
  v8 = objc_msgSend(a1, sel_faces);
  sub_213BF1DCC(0, &qword_254D28000);
  v9 = sub_213C12690();

  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    v10 = sub_213C12918();
    swift_bridgeObjectRelease();
    if (v10)
      goto LABEL_6;
LABEL_14:
    swift_bridgeObjectRelease();
    v36 = MEMORY[0x24BEE4AF8];
    goto LABEL_15;
  }
  v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v10)
    goto LABEL_14;
LABEL_6:
  v48 = MEMORY[0x24BEE4AF8];
  result = (id)sub_213C128D0();
  if (v10 < 0)
  {
    __break(1u);
    return result;
  }
  v46 = v7;
  v12 = 0;
  do
  {
    if ((v9 & 0xC000000000000001) != 0)
      v13 = (id)MEMORY[0x2199BE994](v12, v9);
    else
      v13 = *(id *)(v9 + 8 * v12 + 32);
    v14 = v13;
    ++v12;
    objc_msgSend(v13, sel_bounds);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v23 = objc_msgSend(v14, sel_facePose);
    objc_msgSend(v23, sel_pitch);
    v25 = v24;
    objc_msgSend(v23, "yaw");
    v27 = v26;
    objc_msgSend(v23, sel_roll);
    v29 = v28;
    v30 = (objc_class *)type metadata accessor for PADSWPose();
    v31 = (char *)objc_allocWithZone(v30);
    *(double *)&v31[OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_pitch] = v25;
    *(double *)&v31[OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_yaw] = v27;
    *(double *)&v31[OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_roll] = v29;
    v52.receiver = v31;
    v52.super_class = v30;
    v32 = objc_msgSendSuper2(&v52, sel_init);

    v33 = (objc_class *)type metadata accessor for PADSWFace();
    v34 = (char *)objc_allocWithZone(v33);
    v35 = &v34[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds];
    *(_QWORD *)v35 = v16;
    *((_QWORD *)v35 + 1) = v18;
    *((_QWORD *)v35 + 2) = v20;
    *((_QWORD *)v35 + 3) = v22;
    *(_QWORD *)&v34[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_pose] = v32;
    v51.receiver = v34;
    v51.super_class = v33;
    objc_msgSendSuper2(&v51, sel_init);

    sub_213C128B8();
    sub_213C128DC();
    sub_213C128E8();
    sub_213C128C4();
  }
  while (v10 != v12);
  v36 = v48;
  swift_bridgeObjectRelease();
  v7 = v46;
LABEL_15:
  if ((v7 & 1) != 0)
    v37 = 10;
  else
    v37 = v5;
  objc_msgSend(a1, sel_time);
  v38 = v48;
  v39 = v50;
  v40 = v49;
  v41 = objc_msgSend(a1, sel_buffer);
  v42 = objc_msgSend(a1, sel_orientation);
  v43 = (objc_class *)type metadata accessor for PADSWFrame();
  v44 = (char *)objc_allocWithZone(v43);
  v45 = &v44[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_time];
  *(_QWORD *)v45 = v38;
  *((_QWORD *)v45 + 1) = v40;
  *((_QWORD *)v45 + 2) = v39;
  *(_QWORD *)&v44[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_buffer] = v41;
  *(_QWORD *)&v44[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_faces] = v36;
  *(_QWORD *)&v44[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_gesture] = v37;
  *(_DWORD *)&v44[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_orientation] = v42;
  v47.receiver = v44;
  v47.super_class = v43;
  return objc_msgSendSuper2(&v47, sel_init);
}

uint64_t sub_213BF1AE8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_213BF1B0C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t method lookup function for PADInternalClassifier()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PADInternalClassifier.startLiveness(_:onGestureStart:onIncorrectGestureDetected:onGesturesFinished:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of PADInternalClassifier.processLivenessFrame(_:withOptions:taOptions:)(uint64_t a1, int a2)
{
  _QWORD *v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))((*MEMORY[0x24BEE4EA0] & *v2) + 0x148))(a1, a2 & 0x10101);
}

uint64_t dispatch thunk of PADInternalClassifier.skipLivenessGesture()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of PADInternalClassifier.enableAccessibilityOptions()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of PADInternalClassifier.restartLivenessGesture()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of PADInternalClassifier.pauseLiveness()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of PADInternalClassifier.prepareToResumeLiveness()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of PADInternalClassifier.resumeLiveness()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of PADInternalClassifier.finishLivenessWithSelfie(_:performIDMatching:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of PADInternalClassifier.finishLivenessStepUp(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of PADInternalClassifier.cancelWithCompletion(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x190))();
}

uint64_t sub_213BF1C78()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_213BF1C9C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

void sub_213BF1CA8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_213BEE8BC(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_213BF1CB0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

void sub_213BF1CC0(uint64_t a1)
{
  uint64_t v1;

  sub_213BEDF18(a1, *(_QWORD *)(v1 + 16));
}

_OWORD *sub_213BF1CC8(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_213BF1CD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D27FD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

unint64_t sub_213BF1D38()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254D27FE8;
  if (!qword_254D27FE8)
  {
    v1 = sub_213C12594();
    result = MEMORY[0x2199BF420](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_254D27FE8);
  }
  return result;
}

unint64_t sub_213BF1D80()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254D27FF8;
  if (!qword_254D27FF8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D27FF0);
    result = MEMORY[0x2199BF420](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_254D27FF8);
  }
  return result;
}

uint64_t sub_213BF1DCC(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_213BF1E04(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_213BF1E48(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_213BF1E74()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[4] = v0;
  v2 = sub_213C124F8();
  v1[5] = v2;
  v1[6] = *(_QWORD *)(v2 - 8);
  v1[7] = swift_task_alloc();
  v3 = sub_213C12588();
  v1[8] = v3;
  v1[9] = *(_QWORD *)(v3 - 8);
  v1[10] = swift_task_alloc();
  v1[11] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_213BF1F0C()
{
  _QWORD *v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;

  v1 = v0[4];
  *(_QWORD *)(v1 + 16) = 0;
  *(_QWORD *)(v1 + 24) = 0;
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBFFD8]), sel_init);
  v0[12] = v2;
  v3 = 2;
  if ((sub_213BF2898(2) & 1) != 0)
  {
    if (qword_254D27930 != -1)
      swift_once();
    v4 = v0[11];
    v5 = v0[8];
    v6 = v0[9];
    v7 = __swift_project_value_buffer(v5, (uint64_t)qword_254D27938);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, v7, v5);
    v8 = sub_213C12570();
    v9 = sub_213C12750();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_213BCD000, v8, v9, "Processing models with CPU only", v10, 2u);
      MEMORY[0x2199BF4BC](v10, -1, -1);
    }
    v11 = v0[11];
    v12 = v0[8];
    v13 = v0[9];

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
    v3 = 0;
  }
  v14 = v0[7];
  objc_msgSend(v2, sel_setComputeUnits_, v3);
  v0[13] = type metadata accessor for PADFacePoseModel();
  sub_213C114FC(v14);
  sub_213BF285C();
  v15 = (_QWORD *)swift_task_alloc();
  v0[14] = v15;
  *v15 = v0;
  v15[1] = sub_213BF20C0;
  return sub_213C127E0();
}

uint64_t sub_213BF20C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = *(_QWORD **)v2;
  *(_QWORD *)(*(_QWORD *)v2 + 120) = v1;
  swift_task_dealloc();
  if (v1)
    (*(void (**)(_QWORD, _QWORD))(v4[6] + 8))(v4[7], v4[5]);
  else
    v4[16] = a1;
  return swift_task_switch();
}

uint64_t sub_213BF2144()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD *v9;

  v1 = v0[16];
  v2 = (void *)v0[12];
  v4 = v0[6];
  v3 = v0[7];
  v6 = v0[4];
  v5 = v0[5];
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v1;
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  *(_QWORD *)(v6 + 16) = v7;
  swift_release();
  type metadata accessor for PADPrintReplayModelManager();
  swift_allocObject();
  v8 = v2;
  v9 = (_QWORD *)swift_task_alloc();
  v0[17] = v9;
  *v9 = v0;
  v9[1] = sub_213BF2208;
  return sub_213BF75E0(v0[12]);
}

uint64_t sub_213BF2208(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 144) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 152) = a1;
  return swift_task_switch();
}

uint64_t sub_213BF227C()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 96);
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_213BF22E8()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 96);
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_213BF2354()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  *(_QWORD *)(*(_QWORD *)(v0 + 32) + 24) = *(_QWORD *)(v0 + 152);
  swift_release();
  if (qword_254D27930 != -1)
    swift_once();
  v2 = *(_QWORD *)(v0 + 72);
  v1 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 64);
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_254D27938);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_retain_n();
  v5 = sub_213C12570();
  v6 = sub_213C12750();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = *(_QWORD *)(v0 + 32);
    v8 = swift_slowAlloc();
    v23 = swift_slowAlloc();
    v24 = v23;
    *(_DWORD *)v8 = 136315394;
    v9 = sub_213BF2638();
    if (v10)
    {
      v11 = v10;
    }
    else
    {
      v9 = 0;
      v11 = 0xE000000000000000;
    }
    *(_QWORD *)(v0 + 16) = sub_213BEB0C8(v9, v11, &v24);
    sub_213C127F8();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v8 + 12) = 2080;
    if (!*(_QWORD *)(v7 + 24) || (swift_retain(), v12 = sub_213BF74A0(), v14 = v13, swift_release(), !v14))
    {
      swift_bridgeObjectRelease();
      v12 = 0;
      v14 = 0xE000000000000000;
    }
    v15 = *(_QWORD *)(v0 + 80);
    v20 = *(_QWORD *)(v0 + 72);
    v21 = *(void **)(v0 + 96);
    v22 = *(_QWORD *)(v0 + 64);
    *(_QWORD *)(v0 + 24) = sub_213BEB0C8(v12, v14, &v24);
    sub_213C127F8();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_213BCD000, v5, v6, "Successfully loaded FacePose v%s, PrintReplay v%s", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2199BF4BC](v23, -1, -1);
    MEMORY[0x2199BF4BC](v8, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v15, v22);
  }
  else
  {
    v17 = *(_QWORD *)(v0 + 72);
    v16 = *(_QWORD *)(v0 + 80);
    v18 = *(_QWORD *)(v0 + 64);

    swift_release_n();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 32));
}

uint64_t sub_213BF2638()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  char v7;
  uint64_t v9;
  __int128 v10;
  __int128 v11;

  v1 = *(_QWORD *)(v0 + 16);
  if (!v1)
  {
    v10 = 0u;
    v11 = 0u;
    goto LABEL_13;
  }
  v2 = objc_msgSend(*(id *)(v1 + 16), sel_modelDescription);
  v3 = objc_msgSend(v2, sel_metadata);

  type metadata accessor for MLModelMetadataKey(0);
  sub_213BF27D4();
  v4 = sub_213C125DC();

  if (!*(_QWORD *)(v4 + 16))
  {
    v10 = 0u;
    v11 = 0u;
LABEL_12:
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  v5 = (id)*MEMORY[0x24BDBFF50];
  v6 = sub_213C0DF9C();
  if ((v7 & 1) == 0)
  {
    v10 = 0u;
    v11 = 0u;

    goto LABEL_12;
  }
  sub_213BECBD4(*(_QWORD *)(v4 + 56) + 32 * v6, (uint64_t)&v10);

  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v11 + 1))
  {
LABEL_13:
    sub_213BF281C((uint64_t)&v10);
    return 0;
  }
  if (swift_dynamicCast())
    return v9;
  else
    return 0;
}

uint64_t sub_213BF2788()
{
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PADModelManager()
{
  return objc_opt_self();
}

unint64_t sub_213BF27D4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254D27A80;
  if (!qword_254D27A80)
  {
    type metadata accessor for MLModelMetadataKey(255);
    result = MEMORY[0x2199BF420](&unk_213C14758, v1);
    atomic_store(result, (unint64_t *)&qword_254D27A80);
  }
  return result;
}

uint64_t sub_213BF281C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D27FD8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_213BF285C()
{
  unint64_t result;

  result = qword_254D280F8;
  if (!qword_254D280F8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254D280F8);
  }
  return result;
}

uint64_t sub_213BF2898(char a1)
{
  uint64_t result;
  id v3;
  id v4;
  uint64_t v5;
  _OWORD v6[2];

  result = os_variant_has_internal_content();
  if ((_DWORD)result)
  {
    v3 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
    v4 = objc_msgSend(v3, sel_persistentDomainForName_, *MEMORY[0x24BDD0D70]);

    if (v4)
    {
      v5 = sub_213C125DC();

      if (v5)
        __asm { BR              X11 }
    }
    memset(v6, 0, sizeof(v6));
    sub_213BF281C((uint64_t)v6);
    return 0;
  }
  return result;
}

uint64_t sub_213BF2A78()
{
  return 0;
}

uint64_t sub_213BF2A80()
{
  swift_weakDestroy();
  return swift_deallocClassInstance();
}

uint64_t sub_213BF2AA4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 120))();
}

uint64_t sub_213BF2ACC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 128))();
}

uint64_t sub_213BF2AF4(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t i;
  unint64_t v6;
  unint64_t v7;
  id *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  _OWORD v12[2];
  uint64_t v13;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_213C12918();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v3 = MEMORY[0x24BEE4AF8];
  if (!v2)
    return v3;
  v13 = MEMORY[0x24BEE4AF8];
  result = sub_213C0D5B4(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v2; ++i)
      {
        MEMORY[0x2199BE994](i, a1);
        sub_213BF2E00();
        swift_dynamicCast();
        v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_213C0D5B4(0, *(_QWORD *)(v3 + 16) + 1, 1);
          v3 = v13;
        }
        v7 = *(_QWORD *)(v3 + 16);
        v6 = *(_QWORD *)(v3 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_213C0D5B4(v6 > 1, v7 + 1, 1);
          v3 = v13;
        }
        *(_QWORD *)(v3 + 16) = v7 + 1;
        sub_213BF1CC8(v12, (_OWORD *)(v3 + 32 * v7 + 32));
      }
    }
    else
    {
      v8 = (id *)(a1 + 32);
      sub_213BF2E00();
      do
      {
        v9 = *v8;
        swift_dynamicCast();
        v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_213C0D5B4(0, *(_QWORD *)(v3 + 16) + 1, 1);
          v3 = v13;
        }
        v11 = *(_QWORD *)(v3 + 16);
        v10 = *(_QWORD *)(v3 + 24);
        if (v11 >= v10 >> 1)
        {
          sub_213C0D5B4(v10 > 1, v11 + 1, 1);
          v3 = v13;
        }
        *(_QWORD *)(v3 + 16) = v11 + 1;
        sub_213BF1CC8(v12, (_OWORD *)(v3 + 32 * v11 + 32));
        ++v8;
        --v2;
      }
      while (v2);
    }
    return v3;
  }
  __break(1u);
  return result;
}

id sub_213BF2D24()
{
  id *v0;
  id v1;
  unint64_t v2;

  v1 = objc_msgSend(*v0, sel_results);
  if (v1)
  {
    sub_213BF2E00();
    v2 = sub_213C12690();

    v1 = (id)sub_213BF2AF4(v2);
    swift_bridgeObjectRelease();
  }
  return v1;
}

uint64_t sub_213BF2D90()
{
  sub_213BFC6D4(0xD00000000000003BLL, 0x8000000213C17C60, 0, 0, 0);
  return swift_willThrow();
}

uint64_t type metadata accessor for PADModelRequest()
{
  return objc_opt_self();
}

unint64_t sub_213BF2E00()
{
  unint64_t result;

  result = qword_254D281C8;
  if (!qword_254D281C8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254D281C8);
  }
  return result;
}

__n128 __swift_memcpy208_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __n128 result;
  __int128 v9;
  __int128 v10;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v2 = *(_OWORD *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  v5 = *(_OWORD *)(a2 + 80);
  v6 = *(_OWORD *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 96) = v6;
  result = *(__n128 *)(a2 + 144);
  v9 = *(_OWORD *)(a2 + 160);
  v10 = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 192) = v10;
  *(__n128 *)(a1 + 144) = result;
  *(_OWORD *)(a1 + 160) = v9;
  return result;
}

uint64_t getEnumTagSinglePayload for PADModelConfiguration(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 208))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for PADModelConfiguration(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 200) = 0;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 208) = v3;
  return result;
}

ValueMetadata *type metadata accessor for PADModelConfiguration()
{
  return &type metadata for PADModelConfiguration;
}

uint64_t sub_213BF2F08(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t result;
  int64_t v6;
  _QWORD *v7;
  int64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t i;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  id v16;
  id v17;
  id v18;
  id v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  unint64_t v23;
  uint64_t v24;
  int64_t v25;
  double v26;
  _BYTE v27[32];
  __int128 v28;
  _OWORD v29[2];
  __int128 v30;
  _OWORD v31[2];

  v2 = 1 << *(_BYTE *)(a1 + 32);
  v3 = -1;
  if (v2 < 64)
    v3 = ~(-1 << v2);
  v4 = v3 & *(_QWORD *)(a1 + 64);
  v25 = (unint64_t)(v2 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v6 = 0;
  v7 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (v4)
    goto LABEL_31;
LABEL_6:
  v8 = v6 + 1;
  if (!__OFADD__(v6, 1))
  {
    if (v8 < v25)
    {
      v9 = *(_QWORD *)(v24 + 8 * v8);
      ++v6;
      if (v9)
        goto LABEL_21;
      v6 = v8 + 1;
      if (v8 + 1 >= v25)
        goto LABEL_32;
      v9 = *(_QWORD *)(v24 + 8 * v6);
      if (v9)
        goto LABEL_21;
      v6 = v8 + 2;
      if (v8 + 2 >= v25)
        goto LABEL_32;
      v9 = *(_QWORD *)(v24 + 8 * v6);
      if (v9)
        goto LABEL_21;
      v6 = v8 + 3;
      if (v8 + 3 >= v25)
        goto LABEL_32;
      v9 = *(_QWORD *)(v24 + 8 * v6);
      if (v9)
      {
LABEL_21:
        v4 = (v9 - 1) & v9;
        for (i = __clz(__rbit64(v9)) + (v6 << 6); ; i = v23 | (v6 << 6))
        {
          v12 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * i);
          v13 = *v12;
          v14 = v12[1];
          sub_213BECBD4(*(_QWORD *)(a1 + 56) + 32 * i, (uint64_t)v31);
          *(_QWORD *)&v30 = v13;
          *((_QWORD *)&v30 + 1) = v14;
          v28 = v30;
          v29[0] = v31[0];
          v29[1] = v31[1];
          v15 = v30;
          sub_213BECBD4((uint64_t)v29, (uint64_t)v27);
          swift_bridgeObjectRetain();
          if (swift_dynamicCast())
          {
            v16 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
            swift_bridgeObjectRetain();
            v17 = objc_msgSend(v16, sel_initWithInteger_, *(_QWORD *)&v26);
          }
          else
          {
            sub_213BECBD4((uint64_t)v29, (uint64_t)v27);
            if (!swift_dynamicCast())
            {
              result = sub_213BE4088((uint64_t)&v28, &qword_254D28208);
              if (!v4)
                goto LABEL_6;
              goto LABEL_31;
            }
            v18 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
            swift_bridgeObjectRetain();
            v17 = objc_msgSend(v18, sel_initWithDouble_, v26);
          }
          v19 = v17;
          sub_213BE4088((uint64_t)&v28, &qword_254D28208);
          result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            result = (uint64_t)sub_213BEA370(0, v7[2] + 1, 1, v7);
            v7 = (_QWORD *)result;
          }
          v21 = v7[2];
          v20 = v7[3];
          if (v21 >= v20 >> 1)
          {
            result = (uint64_t)sub_213BEA370((_QWORD *)(v20 > 1), v21 + 1, 1, v7);
            v7 = (_QWORD *)result;
          }
          v7[2] = v21 + 1;
          v22 = &v7[3 * v21];
          *((_OWORD *)v22 + 2) = v15;
          v22[6] = v19;
          if (!v4)
            goto LABEL_6;
LABEL_31:
          v23 = __clz(__rbit64(v4));
          v4 &= v4 - 1;
        }
      }
      v10 = v8 + 4;
      if (v10 < v25)
      {
        v9 = *(_QWORD *)(v24 + 8 * v10);
        if (v9)
        {
          v6 = v10;
          goto LABEL_21;
        }
        while (1)
        {
          v6 = v10 + 1;
          if (__OFADD__(v10, 1))
            goto LABEL_34;
          if (v6 >= v25)
            break;
          v9 = *(_QWORD *)(v24 + 8 * v6);
          ++v10;
          if (v9)
            goto LABEL_21;
        }
      }
    }
LABEL_32:
    swift_release();
    return (uint64_t)v7;
  }
  __break(1u);
LABEL_34:
  __break(1u);
  return result;
}

unint64_t sub_213BF326C()
{
  _OWORD *v0;
  __int128 v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  _QWORD *v19;
  uint64_t v20;
  _OWORD v21[13];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  sub_213C1242C();
  swift_allocObject();
  sub_213C12420();
  v1 = v0[11];
  v21[10] = v0[10];
  v21[11] = v1;
  v21[12] = v0[12];
  v2 = v0[7];
  v21[6] = v0[6];
  v21[7] = v2;
  v3 = v0[9];
  v21[8] = v0[8];
  v21[9] = v3;
  v4 = v0[3];
  v21[2] = v0[2];
  v21[3] = v4;
  v5 = v0[5];
  v21[4] = v0[4];
  v21[5] = v5;
  v6 = v0[1];
  v21[0] = *v0;
  v21[1] = v6;
  sub_213BF5740();
  v7 = sub_213C12414();
  v9 = v8;
  swift_release();
  v11 = (void *)objc_opt_self();
  v12 = (void *)sub_213C1251C();
  *(_QWORD *)&v21[0] = 0;
  v13 = objc_msgSend(v11, sel_JSONObjectWithData_options_error_, v12, 0, v21);

  if (!v13)
  {
    v17 = *(id *)&v21[0];
    v18 = (void *)sub_213C1248C();

    swift_willThrow();
    sub_213BEBA50(v7, v9);

    return sub_213C05840(MEMORY[0x24BEE4AF8]);
  }
  v14 = *(id *)&v21[0];
  sub_213C12810();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D281F0);
  if ((swift_dynamicCast() & 1) == 0)
  {
    sub_213BEBA50(v7, v9);
    return sub_213C05840(MEMORY[0x24BEE4AF8]);
  }
  v15 = sub_213BF2F08(v20);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v15 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D281F8);
    v16 = sub_213C1293C();
  }
  else
  {
    v16 = MEMORY[0x24BEE4B00];
  }
  *(_QWORD *)&v21[0] = v16;
  v19 = (_QWORD *)swift_bridgeObjectRetain();
  sub_213BF3D20(v19, 1, v21);
  swift_bridgeObjectRelease();
  sub_213BEBA50(v7, v9);
  return *(_QWORD *)&v21[0];
}

uint64_t sub_213BF34EC(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_213BF3524 + 4 * byte_213C14BF0[a1]))(0xD000000000000010, 0x8000000213C17D00);
}

uint64_t sub_213BF3524()
{
  return 0x65736F507466656CLL;
}

uint64_t sub_213BF3598()
{
  return 0x52776F7262657965;
}

uint64_t sub_213BF35B8()
{
  return 0x7461526874756F6DLL;
}

uint64_t sub_213BF35D4()
{
  return 0x6F69746152657965;
}

uint64_t sub_213BF35EC(uint64_t a1)
{
  return a1 + 3;
}

uint64_t sub_213BF3748(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;
  char v9;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D281E0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_213BF56FC();
  sub_213C12A80();
  v9 = 0;
  sub_213C129C0();
  if (!v1)
  {
    v9 = 1;
    sub_213C129C0();
    v9 = 2;
    sub_213C129C0();
    v9 = 3;
    sub_213C129C0();
    v9 = 4;
    sub_213C129C0();
    v9 = 5;
    sub_213C129C0();
    v9 = 6;
    sub_213C129C0();
    v9 = 7;
    sub_213C129D8();
    v9 = 8;
    sub_213C129D8();
    v9 = 9;
    sub_213C129D8();
    v9 = 10;
    sub_213C129D8();
    v9 = 11;
    sub_213C129C0();
    v9 = 12;
    sub_213C129D8();
    v9 = 13;
    sub_213C129C0();
    v9 = 14;
    sub_213C129C0();
    v9 = 15;
    sub_213C129C0();
    v9 = 16;
    sub_213C129C0();
    v9 = 17;
    sub_213C129C0();
    v9 = 18;
    sub_213C129D8();
    v9 = 19;
    sub_213C129C0();
    v9 = 20;
    sub_213C129C0();
    v9 = 21;
    sub_213C129C0();
    v9 = 22;
    sub_213C129C0();
    v9 = 23;
    sub_213C129C0();
    v9 = 24;
    sub_213C129D8();
    v9 = 25;
    sub_213C129D8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_213BF3C1C()
{
  unsigned __int8 *v0;

  return sub_213BF34EC(*v0);
}

uint64_t sub_213BF3C24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_213BF478C(a1, a2);
  *a3 = result;
  return result;
}

void sub_213BF3C48(_BYTE *a1@<X8>)
{
  *a1 = 26;
}

uint64_t sub_213BF3C54()
{
  sub_213BF56FC();
  return sub_213C12A8C();
}

uint64_t sub_213BF3C7C()
{
  sub_213BF56FC();
  return sub_213C12A98();
}

__n128 sub_213BF3CA4@<Q0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __n128 result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[13];

  sub_213BF5140(a1, v10);
  if (!v2)
  {
    v5 = v10[11];
    *(_OWORD *)(a2 + 160) = v10[10];
    *(_OWORD *)(a2 + 176) = v5;
    *(_OWORD *)(a2 + 192) = v10[12];
    v6 = v10[7];
    *(_OWORD *)(a2 + 96) = v10[6];
    *(_OWORD *)(a2 + 112) = v6;
    v7 = v10[9];
    *(_OWORD *)(a2 + 128) = v10[8];
    *(_OWORD *)(a2 + 144) = v7;
    v8 = v10[3];
    *(_OWORD *)(a2 + 32) = v10[2];
    *(_OWORD *)(a2 + 48) = v8;
    v9 = v10[5];
    *(_OWORD *)(a2 + 64) = v10[4];
    *(_OWORD *)(a2 + 80) = v9;
    result = (__n128)v10[1];
    *(_OWORD *)a2 = v10[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_213BF3D0C(_QWORD *a1)
{
  return sub_213BF3748(a1);
}

void sub_213BF3D20(_QWORD *a1, char a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  id v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  unint64_t v17;
  char v18;
  void *v19;
  id v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  void **v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  _QWORD *v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  _BOOL8 v35;
  uint64_t v36;
  char v37;
  char v38;
  _QWORD *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  if (!a1[2])
  {
    swift_bridgeObjectRelease();
    return;
  }
  v43 = a1[2];
  v7 = a1[4];
  v6 = a1[5];
  v8 = (void *)a1[6];
  swift_bridgeObjectRetain();
  v9 = (_QWORD *)*a3;
  swift_bridgeObjectRetain();
  v10 = v8;
  v12 = sub_213C0DF08(v7, v6);
  v13 = v9[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
    goto LABEL_23;
  v16 = v11;
  if (v9[3] >= v15)
  {
    if ((a2 & 1) != 0)
    {
      if ((v11 & 1) != 0)
        goto LABEL_10;
    }
    else
    {
      sub_213C06C8C();
      if ((v16 & 1) != 0)
        goto LABEL_10;
    }
LABEL_13:
    v21 = (_QWORD *)*a3;
    *(_QWORD *)(*a3 + 8 * (v12 >> 6) + 64) |= 1 << v12;
    v22 = (uint64_t *)(v21[6] + 16 * v12);
    *v22 = v7;
    v22[1] = v6;
    *(_QWORD *)(v21[7] + 8 * v12) = v10;
    v23 = v21[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (v24)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v21[2] = v25;
    v26 = v43 - 1;
    if (v43 == 1)
    {
LABEL_22:
      swift_bridgeObjectRelease_n();
      return;
    }
    v27 = (void **)(a1 + 9);
    while (1)
    {
      v29 = (uint64_t)*(v27 - 2);
      v28 = (uint64_t)*(v27 - 1);
      v30 = *v27;
      v31 = (_QWORD *)*a3;
      swift_bridgeObjectRetain();
      v10 = v30;
      v32 = sub_213C0DF08(v29, v28);
      v34 = v31[2];
      v35 = (v33 & 1) == 0;
      v24 = __OFADD__(v34, v35);
      v36 = v34 + v35;
      if (v24)
        break;
      v37 = v33;
      if (v31[3] < v36)
      {
        sub_213C05F08(v36, 1);
        v32 = sub_213C0DF08(v29, v28);
        if ((v37 & 1) != (v38 & 1))
          goto LABEL_25;
      }
      if ((v37 & 1) != 0)
        goto LABEL_10;
      v39 = (_QWORD *)*a3;
      *(_QWORD *)(*a3 + 8 * (v32 >> 6) + 64) |= 1 << v32;
      v40 = (uint64_t *)(v39[6] + 16 * v32);
      *v40 = v29;
      v40[1] = v28;
      *(_QWORD *)(v39[7] + 8 * v32) = v10;
      v41 = v39[2];
      v24 = __OFADD__(v41, 1);
      v42 = v41 + 1;
      if (v24)
        goto LABEL_24;
      v39[2] = v42;
      v27 += 3;
      if (!--v26)
        goto LABEL_22;
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_213C05F08(v15, a2 & 1);
  v17 = sub_213C0DF08(v7, v6);
  if ((v16 & 1) == (v18 & 1))
  {
    v12 = v17;
    if ((v16 & 1) == 0)
      goto LABEL_13;
LABEL_10:
    v19 = (void *)swift_allocError();
    swift_willThrow();
    v20 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D28200);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease_n();
      return;
    }
    goto LABEL_26;
  }
LABEL_25:
  sub_213C12A38();
  __break(1u);
LABEL_26:
  sub_213C1287C();
  sub_213C12648();
  sub_213C128F4();
  sub_213C12648();
  sub_213C1290C();
  __break(1u);
}

uint64_t sub_213BF40AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t ObjCClassFromMetadata;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void (*v21)(char *, char *, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t result;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  double v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  int64x2_t v48;
  _QWORD v49[4];
  char *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  double v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  uint64_t v68;
  int64x2_t v69;

  v2 = sub_213C12588();
  v3 = *(_QWORD *)(v2 - 8);
  v52 = v2;
  v53 = v3;
  v4 = MEMORY[0x24BDAC7A8](v2);
  v49[3] = (char *)v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v51 = (char *)v49 - v6;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D27CE8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_213C124F8();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v50 = (char *)v49 - v15;
  type metadata accessor for PADSWClassifier();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v17 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v18 = (void *)sub_213C125E8();
  v19 = (void *)sub_213C125E8();
  v20 = objc_msgSend(v17, sel_URLForResource_withExtension_, v18, v19);

  if (v20)
  {
    sub_213C124D4();

    v21 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
    v21(v9, v14, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) != 1)
    {
      v21(v50, v9, v10);
      v29 = sub_213C12504();
      v31 = v30;
      sub_213C12450();
      swift_allocObject();
      sub_213C12444();
      sub_213BF5784();
      sub_213C12438();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v50, v10);
      swift_release();
      result = sub_213BEBA50(v29, v31);
      v34 = v54;
      v33 = v55;
      v35 = v56;
      v36 = v57;
      v37 = v58;
      v38 = v59;
      v39 = v60;
      v40 = v61;
      v41 = v62;
      v42 = v63;
      v43 = v64;
      v44 = v65;
      v45 = v66;
      v46 = v67;
      v47 = v68;
      v48 = v69;
      goto LABEL_10;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
  }
  sub_213BE4088((uint64_t)v9, &qword_254D27CE8);
  v22 = v53;
  if (qword_254D27930 != -1)
    swift_once();
  v23 = v52;
  v24 = __swift_project_value_buffer(v52, (uint64_t)qword_254D27938);
  v25 = v51;
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v51, v24, v23);
  v26 = sub_213C12570();
  v27 = sub_213C12750();
  if (os_log_type_enabled(v26, v27))
  {
    v28 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v28 = 0;
    _os_log_impl(&dword_213BCD000, v26, v27, "No PADModelConfiguration plist found in bundle. Using default values.", v28, 2u);
    MEMORY[0x2199BF4BC](v28, -1, -1);
  }

  result = (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v25, v23);
  v44 = 0;
  v46 = xmmword_213C14DA0;
  v45 = xmmword_213C14DB0;
  v42 = xmmword_213C14DC0;
  v41 = xmmword_213C14DD0;
  v35 = xmmword_213C14DE0;
  v33 = xmmword_213C14DF0;
  v34 = xmmword_213C14E00;
  v38 = xmmword_213C14E10;
  v47 = 0x3FC3333333333333;
  v48 = vdupq_n_s64(3uLL);
  v43 = 0.5;
  v37 = xmmword_213C14E20;
  v36 = 0x3FD3333333333333;
  v39 = 0x3F966CF41F212D77;
  v40 = 10;
LABEL_10:
  *(_OWORD *)a1 = v34;
  *(_OWORD *)(a1 + 16) = v33;
  *(_OWORD *)(a1 + 32) = v35;
  *(_QWORD *)(a1 + 48) = v36;
  *(_OWORD *)(a1 + 56) = v37;
  *(_OWORD *)(a1 + 72) = v38;
  *(_QWORD *)(a1 + 88) = v39;
  *(_QWORD *)(a1 + 96) = v40;
  *(_OWORD *)(a1 + 104) = v41;
  *(_OWORD *)(a1 + 120) = v42;
  *(double *)(a1 + 136) = v43;
  *(_QWORD *)(a1 + 144) = v44;
  *(_OWORD *)(a1 + 152) = v45;
  *(_OWORD *)(a1 + 168) = v46;
  *(_QWORD *)(a1 + 184) = v47;
  *(int64x2_t *)(a1 + 192) = v48;
  return result;
}

uint64_t sub_213BF478C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x65736F507466656CLL && a2 == 0xEE00656572676544;
  if (v3 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x736F507468676972 && a2 == 0xEF65657267654465 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x654465736F507075 && a2 == 0xEC00000065657267 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x65736F506E776F64 && a2 == 0xEE00656572676544 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x52776F7262657965 && a2 == 0xEC0000006F697461 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x7461526874756F6DLL && a2 == 0xEA00000000006F69 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6F69746152657965 && a2 == 0xE800000000000000 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000213C17D00 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x8000000213C17D20 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x4146726566667562 && a2 == 0xE900000000000043 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x4146726566667562 && a2 == 0xEC00000065794543 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000213C17D40 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0x4154726566667562 && a2 == 0xE800000000000000 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000213C17D60 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 13;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x8000000213C17D80 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 14;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000213C17DA0 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 15;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x8000000213C17DC0 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 16;
  }
  else if (a1 == 0x7365726854636166 && a2 == 0xEC000000646C6F68 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 17;
  }
  else if (a1 == 0x6873657268546174 && a2 == 0xEB00000000646C6FLL || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 18;
  }
  else if (a1 == 0x6873657268546469 && a2 == 0xEB00000000646C6FLL || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 19;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x8000000213C17DE0 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 20;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x8000000213C17E00 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 21;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x8000000213C17E20 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 22;
  }
  else if (a1 == 0xD00000000000001BLL && a2 == 0x8000000213C17E40 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 23;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x8000000213C17E60 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 24;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x8000000213C17E80)
  {
    swift_bridgeObjectRelease();
    return 25;
  }
  else
  {
    v6 = sub_213C12A14();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 25;
    else
      return 26;
  }
}

uint64_t sub_213BF5140@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
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
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t result;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D281D0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_213BF56FC();
  sub_213C12A74();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v59 = 0;
  sub_213C12978();
  v10 = v9;
  v59 = 1;
  sub_213C12978();
  v12 = v11;
  v59 = 2;
  sub_213C12978();
  v14 = v13;
  v59 = 3;
  sub_213C12978();
  v16 = v15;
  v59 = 4;
  sub_213C12978();
  v18 = v17;
  v59 = 5;
  sub_213C12978();
  v20 = v19;
  v59 = 6;
  sub_213C12978();
  v22 = v21;
  v59 = 7;
  v23 = sub_213C12990();
  v59 = 8;
  v24 = sub_213C12990();
  v59 = 9;
  v58 = sub_213C12990();
  v59 = 10;
  v57 = sub_213C12990();
  v59 = 11;
  sub_213C12978();
  v26 = v25;
  v59 = 12;
  v56 = sub_213C12990();
  v59 = 13;
  sub_213C12978();
  v55 = v27;
  v59 = 14;
  sub_213C12978();
  v54 = v28;
  v59 = 15;
  sub_213C12978();
  v53 = v29;
  v59 = 16;
  sub_213C12978();
  v52 = v30;
  v59 = 17;
  sub_213C12978();
  v51 = v31;
  v59 = 18;
  v50 = sub_213C12990();
  v59 = 19;
  sub_213C12978();
  v49 = v32;
  v59 = 20;
  sub_213C12978();
  v48 = v33;
  v59 = 21;
  sub_213C12978();
  v47 = v34;
  v59 = 22;
  sub_213C12978();
  v46 = v35;
  v59 = 23;
  sub_213C12978();
  v45 = v36;
  v59 = 24;
  v44 = sub_213C12990();
  v59 = 25;
  v37 = sub_213C12990();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  result = __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  *a2 = v10;
  a2[1] = v12;
  a2[2] = v14;
  a2[3] = v16;
  a2[4] = v18;
  a2[5] = v20;
  a2[6] = v22;
  a2[7] = v23;
  a2[8] = v24;
  v39 = v57;
  a2[9] = v58;
  a2[10] = v39;
  a2[11] = v26;
  a2[12] = v56;
  v40 = v54;
  a2[13] = v55;
  a2[14] = v40;
  v41 = v52;
  a2[15] = v53;
  a2[16] = v41;
  a2[17] = v51;
  a2[18] = v50;
  v42 = v48;
  a2[19] = v49;
  a2[20] = v42;
  v43 = v46;
  a2[21] = v47;
  a2[22] = v43;
  a2[23] = v45;
  a2[24] = v44;
  a2[25] = v37;
  return result;
}

unint64_t sub_213BF56FC()
{
  unint64_t result;

  result = qword_254D281D8;
  if (!qword_254D281D8)
  {
    result = MEMORY[0x2199BF420](&unk_213C14D4C, &type metadata for PADModelConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D281D8);
  }
  return result;
}

unint64_t sub_213BF5740()
{
  unint64_t result;

  result = qword_254D281E8;
  if (!qword_254D281E8)
  {
    result = MEMORY[0x2199BF420](&unk_213C14C38, &type metadata for PADModelConfiguration);
    atomic_store(result, (unint64_t *)&qword_254D281E8);
  }
  return result;
}

unint64_t sub_213BF5784()
{
  unint64_t result;

  result = qword_254D28210;
  if (!qword_254D28210)
  {
    result = MEMORY[0x2199BF420](&unk_213C14C60, &type metadata for PADModelConfiguration);
    atomic_store(result, (unint64_t *)&qword_254D28210);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PADModelConfiguration.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xE7)
    goto LABEL_17;
  if (a2 + 25 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 25) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 25;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 25;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 25;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x1A;
  v8 = v6 - 26;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for PADModelConfiguration.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 25 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 25) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xE7)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xE6)
    return ((uint64_t (*)(void))((char *)&loc_213BF58A4 + 4 * byte_213C14C0F[v4]))();
  *a1 = a2 + 25;
  return ((uint64_t (*)(void))((char *)sub_213BF58D8 + 4 * byte_213C14C0A[v4]))();
}

uint64_t sub_213BF58D8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_213BF58E0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x213BF58E8);
  return result;
}

uint64_t sub_213BF58F4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x213BF58FCLL);
  *(_BYTE *)result = a2 + 25;
  return result;
}

uint64_t sub_213BF5900(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_213BF5908(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PADModelConfiguration.CodingKeys()
{
  return &type metadata for PADModelConfiguration.CodingKeys;
}

unint64_t sub_213BF5928()
{
  unint64_t result;

  result = qword_254D28218;
  if (!qword_254D28218)
  {
    result = MEMORY[0x2199BF420](&unk_213C14D24, &type metadata for PADModelConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D28218);
  }
  return result;
}

unint64_t sub_213BF5970()
{
  unint64_t result;

  result = qword_254D28220;
  if (!qword_254D28220)
  {
    result = MEMORY[0x2199BF420](&unk_213C14C94, &type metadata for PADModelConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D28220);
  }
  return result;
}

unint64_t sub_213BF59B8()
{
  unint64_t result;

  result = qword_254D28228;
  if (!qword_254D28228)
  {
    result = MEMORY[0x2199BF420](&unk_213C14CBC, &type metadata for PADModelConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D28228);
  }
  return result;
}

uint64_t sub_213BF59FC()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PADAVFrame()
{
  return objc_opt_self();
}

uint64_t sub_213BF5A40(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 128) = a1;
  *(_QWORD *)(v2 + 136) = v1;
  return swift_task_switch();
}

uint64_t sub_213BF5A58()
{
  _QWORD *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v1 = (void *)sub_213C124BC();
  v2 = objc_msgSend((id)objc_opt_self(), sel_assetWithURL_, v1);
  v0[18] = v2;

  v3 = *MEMORY[0x24BDB1D50];
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_213BF5B40;
  v4 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v0[11] = 0x40000000;
  v0[12] = sub_213BF5DA4;
  v0[13] = &block_descriptor_1;
  v0[14] = v4;
  objc_msgSend(v2, sel_loadTracksWithMediaType_completionHandler_, v3, v0 + 10);
  return swift_continuation_await();
}

uint64_t sub_213BF5B40()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 152) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

void sub_213BF5BA0()
{
  uint64_t v0;
  unint64_t v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(v0 + 120);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v8 = sub_213C12918();
    swift_bridgeObjectRelease();
    if (v8)
      goto LABEL_3;
LABEL_8:
    v9 = *(void **)(v0 + 144);
    v10 = *(_QWORD *)(v0 + 128);
    swift_bridgeObjectRelease();
    sub_213BFC6D4(0xD00000000000002BLL, 0x8000000213C17FF0, 0, -2, 0);
    swift_willThrow();

    v11 = sub_213C124F8();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
    type metadata accessor for PADAVAssetReader();
    swift_deallocPartialClassInstance();
    (*(void (**)(void))(v0 + 8))();
    return;
  }
  if (!*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_8;
LABEL_3:
  if ((v1 & 0xC000000000000001) != 0)
  {
    v2 = (id)MEMORY[0x2199BE994](0, v1);
    goto LABEL_6;
  }
  if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v2 = *(id *)(v1 + 32);
LABEL_6:
    v3 = v2;
    v5 = *(_QWORD *)(v0 + 136);
    v4 = *(_QWORD *)(v0 + 144);
    v6 = *(_QWORD *)(v0 + 128);
    swift_bridgeObjectRelease();
    v7 = sub_213C124F8();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
    *(_QWORD *)(v5 + 16) = v4;
    *(_QWORD *)(v5 + 24) = v3;
    (*(void (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 136));
    return;
  }
  __break(1u);
}

uint64_t sub_213BF5D28()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(void **)(v0 + 144);
  v2 = *(_QWORD *)(v0 + 128);
  swift_willThrow();

  v3 = sub_213C124F8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  type metadata accessor for PADAVAssetReader();
  swift_deallocPartialClassInstance();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_213BF5DA4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  _QWORD *v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D28200);
    swift_allocError();
    *v5 = a3;
    v6 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    sub_213BF7464();
    **(_QWORD **)(*(_QWORD *)(v3 + 64) + 40) = sub_213C12690();
    return swift_continuation_throwingResume();
  }
}

id sub_213BF5E3C(uint64_t *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t inited;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v39;
  uint64_t v40;
  _OWORD v41[2];
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v5 = v4;
  v47 = *MEMORY[0x24BDAC8D0];
  v9 = *a1;
  v10 = a1[1];
  v11 = a1[2];
  v12 = a1[3];
  v13 = a1[4];
  v40 = a1[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D283A0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_213C14E40;
  *(_QWORD *)(inited + 32) = sub_213C1260C();
  *(_QWORD *)(inited + 40) = v15;
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE44F0];
  *(_DWORD *)(inited + 48) = 1111970369;
  sub_213C0584C(inited);
  if ((a4 & 1) == 0)
  {
    v16 = sub_213C1260C();
    v39 = v5;
    v17 = a3;
    v18 = v12;
    v19 = v9;
    v21 = v20;
    v44 = MEMORY[0x24BEE50B0];
    *(_QWORD *)&v42 = a2;
    sub_213BF1CC8(&v42, v41);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_213C0682C(v41, v16, v21, isUniquelyReferenced_nonNull_native);
    v9 = v19;
    v12 = v18;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v23 = sub_213C1260C();
    v25 = v24;
    v44 = MEMORY[0x24BEE50B0];
    *(_QWORD *)&v42 = v17;
    v5 = v39;
    sub_213BF1CC8(&v42, v41);
    v26 = swift_isUniquelyReferenced_nonNull_native();
    sub_213C0682C(v41, v23, v25, v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v27 = *(void **)(v5 + 24);
  v28 = objc_allocWithZone(MEMORY[0x24BDB23D0]);
  v29 = v27;
  v30 = (void *)sub_213C125C4();
  swift_bridgeObjectRelease();
  v31 = objc_msgSend(v28, sel_initWithTrack_outputSettings_, v29, v30);

  objc_msgSend(v31, sel_setAlwaysCopiesSampleData_, 0);
  v32 = *(void **)(v5 + 16);
  v33 = objc_allocWithZone(MEMORY[0x24BDB23B8]);
  *(_QWORD *)&v42 = 0;
  v34 = v32;
  v35 = objc_msgSend(v33, sel_initWithAsset_error_, v34, &v42);
  if (!v35)
  {
    v36 = (id)v42;
    sub_213C1248C();

LABEL_8:
    swift_willThrow();

    return v36;
  }
  v36 = v35;
  v37 = (id)v42;

  if ((objc_msgSend(v36, sel_canAddOutput_, v31) & 1) == 0)
  {
    sub_213BFC6D4(0xD000000000000025, 0x8000000213C17F10, 0, -2, 0);
    v34 = v36;
    goto LABEL_8;
  }
  *(_QWORD *)&v42 = v9;
  *((_QWORD *)&v42 + 1) = v10;
  v43 = v11;
  v44 = v12;
  v45 = v13;
  v46 = v40;
  objc_msgSend(v36, sel_setTimeRange_, &v42);
  objc_msgSend(v36, sel_addOutput_, v31);
  objc_msgSend(v36, sel_startReading);
  return v36;
}

uint64_t sub_213BF61D4()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PADAVAssetReader()
{
  return objc_opt_self();
}

uint64_t sub_213BF6220(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  _QWORD v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_213BF6E98(v2);
  v3 = *(_QWORD *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  result = sub_213BF6288(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_213BF6288(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  unint64_t v27;
  unint64_t v28;
  char *v29;
  char *v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  BOOL v42;
  unint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  BOOL v52;
  uint64_t v53;
  char v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  BOOL v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  char *v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  int v83;
  int v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  int v93;
  int v94;
  char *v96;
  uint64_t v97;
  unint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  unint64_t v103;
  _QWORD *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char *__dst;
  char *v110;

  v2 = a1;
  v3 = a1[1];
  result = sub_213C129F0();
  v108 = v3;
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_139;
    if ((unint64_t)v3 >= 2)
    {
      v85 = *v2;
      v86 = v85 + 40;
      v87 = -1;
      v88 = 1;
      do
      {
        v89 = v87;
        v90 = v86;
        do
        {
          v91 = v90 - 40;
          result = sub_213C127C8();
          if ((result & 1) == 0)
            break;
          if (!v85)
            goto LABEL_143;
          v92 = *(_QWORD *)(v90 - 24);
          *(_QWORD *)(v90 - 24) = *(_QWORD *)v90;
          v90 -= 24;
          result = *(_QWORD *)(v90 + 8);
          v93 = *(_DWORD *)(v90 + 16);
          v94 = *(_DWORD *)(v90 + 20);
          *(_OWORD *)(v91 + 24) = *(_OWORD *)v91;
          *(_QWORD *)(v91 + 40) = v92;
          *(_QWORD *)(v90 - 16) = result;
          *(_DWORD *)(v90 - 8) = v93;
          *(_DWORD *)(v90 - 4) = v94;
        }
        while (!__CFADD__(v89++, 1));
        ++v88;
        v86 += 24;
        --v87;
      }
      while (v88 != v108);
    }
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_148;
  v106 = result;
  if (v3 < 2)
  {
    v8 = MEMORY[0x24BEE4AF8];
    __dst = (char *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v11 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v96 = (char *)MEMORY[0x24BEE4AF8];
LABEL_105:
      v105 = v8;
      if (v11 >= 2)
      {
        v97 = *v2;
        do
        {
          v98 = v11 - 2;
          if (v11 < 2)
            goto LABEL_134;
          if (!v97)
            goto LABEL_147;
          v99 = v96;
          v100 = *(_QWORD *)&v96[16 * v98 + 32];
          v101 = *(_QWORD *)&v96[16 * v11 + 24];
          sub_213BF6A0C((char *)(v97 + 24 * v100), (char *)(v97 + 24 * *(_QWORD *)&v96[16 * v11 + 16]), v97 + 24 * v101, __dst);
          if (v1)
            break;
          if (v101 < v100)
            goto LABEL_135;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v99 = sub_213BF6E84((uint64_t)v99);
          if (v98 >= *((_QWORD *)v99 + 2))
            goto LABEL_136;
          v102 = &v99[16 * v98 + 32];
          *(_QWORD *)v102 = v100;
          *((_QWORD *)v102 + 1) = v101;
          v103 = *((_QWORD *)v99 + 2);
          if (v11 > v103)
            goto LABEL_137;
          memmove(&v99[16 * v11 + 16], &v99[16 * v11 + 32], 16 * (v103 - v11));
          v96 = v99;
          *((_QWORD *)v99 + 2) = v103 - 1;
          v11 = v103 - 1;
        }
        while (v103 > 2);
      }
LABEL_95:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v105 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v105 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v6 = v5 >> 1;
    type metadata accessor for CMTime(0);
    v7 = sub_213C126C0();
    *(_QWORD *)(v7 + 16) = v6;
    v105 = v7;
    __dst = (char *)(v7 + 32);
  }
  v9 = 0;
  v104 = v2;
  v10 = *v2;
  v110 = (char *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    v12 = v9++;
    if (v9 < v3)
    {
      v13 = sub_213C127C8();
      v9 = v12 + 2;
      if (v12 + 2 < v3)
      {
        v14 = v10 + 64 + 24 * v12;
        while (((v13 ^ sub_213C127C8()) & 1) == 0)
        {
          v14 += 24;
          if (v3 == ++v9)
          {
            v9 = v3;
            break;
          }
        }
      }
      if ((v13 & 1) != 0)
      {
        if (v9 < v12)
          goto LABEL_140;
        if (v12 < v9)
        {
          v15 = 24 * v9;
          v16 = 24 * v12;
          v17 = v9;
          v18 = v12;
          do
          {
            if (v18 != --v17)
            {
              if (!v10)
                goto LABEL_146;
              v19 = v10 + v16;
              v20 = v10 + v15;
              v21 = *(_QWORD *)(v10 + v16);
              v22 = *(_QWORD *)(v10 + v16 + 16);
              v23 = *(_QWORD *)(v10 + v16 + 8);
              v24 = *(_QWORD *)(v10 + v15 - 8);
              *(_OWORD *)v19 = *(_OWORD *)(v10 + v15 - 24);
              *(_QWORD *)(v19 + 16) = v24;
              *(_QWORD *)(v20 - 24) = v21;
              *(_QWORD *)(v20 - 16) = v23;
              *(_QWORD *)(v20 - 8) = v22;
            }
            ++v18;
            v15 -= 24;
            v16 += 24;
          }
          while (v18 < v17);
        }
      }
    }
    if (v9 >= v3)
      goto LABEL_39;
    if (__OFSUB__(v9, v12))
      goto LABEL_138;
    if (v9 - v12 >= v106)
      goto LABEL_39;
    if (__OFADD__(v12, v106))
      goto LABEL_141;
    v25 = v12 + v106 >= v3 ? v3 : v12 + v106;
    if (v25 < v12)
      break;
    if (v9 != v25)
    {
      v76 = v10 + 16 + 24 * v9;
      v26 = v110;
      v107 = v25;
      do
      {
        v77 = v12;
        v78 = v12;
        v79 = v76;
        do
        {
          v80 = v79 - 40;
          if ((sub_213C127C8() & 1) == 0)
            break;
          if (!v10)
            goto LABEL_144;
          v81 = *(_QWORD *)(v79 - 24);
          *(_QWORD *)(v79 - 24) = *(_QWORD *)v79;
          v79 -= 24;
          v82 = *(_QWORD *)(v79 + 8);
          v83 = *(_DWORD *)(v79 + 16);
          v84 = *(_DWORD *)(v79 + 20);
          *(_OWORD *)(v80 + 24) = *(_OWORD *)v80;
          *(_QWORD *)(v80 + 40) = v81;
          *(_QWORD *)(v79 - 16) = v82;
          *(_DWORD *)(v79 - 8) = v83;
          *(_DWORD *)(v79 - 4) = v84;
          ++v78;
        }
        while (v9 != v78);
        ++v9;
        v76 += 24;
        v12 = v77;
      }
      while (v9 != v107);
      v9 = v107;
      if (v107 < v77)
        goto LABEL_133;
      goto LABEL_40;
    }
LABEL_39:
    v26 = v110;
    if (v9 < v12)
      goto LABEL_133;
LABEL_40:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v26 = sub_213BF6CD0(0, *((_QWORD *)v26 + 2) + 1, 1, v26);
    v28 = *((_QWORD *)v26 + 2);
    v27 = *((_QWORD *)v26 + 3);
    v11 = v28 + 1;
    if (v28 >= v27 >> 1)
      v26 = sub_213BF6CD0((char *)(v27 > 1), v28 + 1, 1, v26);
    *((_QWORD *)v26 + 2) = v11;
    v29 = v26 + 32;
    v30 = &v26[16 * v28 + 32];
    *(_QWORD *)v30 = v12;
    *((_QWORD *)v30 + 1) = v9;
    v110 = v26;
    if (v28)
    {
      while (1)
      {
        v31 = v11 - 1;
        if (v11 >= 4)
        {
          v36 = &v29[16 * v11];
          v37 = *((_QWORD *)v36 - 8);
          v38 = *((_QWORD *)v36 - 7);
          v42 = __OFSUB__(v38, v37);
          v39 = v38 - v37;
          if (v42)
            goto LABEL_122;
          v41 = *((_QWORD *)v36 - 6);
          v40 = *((_QWORD *)v36 - 5);
          v42 = __OFSUB__(v40, v41);
          v34 = v40 - v41;
          v35 = v42;
          if (v42)
            goto LABEL_123;
          v43 = v11 - 2;
          v44 = &v29[16 * v11 - 32];
          v46 = *(_QWORD *)v44;
          v45 = *((_QWORD *)v44 + 1);
          v42 = __OFSUB__(v45, v46);
          v47 = v45 - v46;
          if (v42)
            goto LABEL_125;
          v42 = __OFADD__(v34, v47);
          v48 = v34 + v47;
          if (v42)
            goto LABEL_128;
          if (v48 >= v39)
          {
            v66 = &v29[16 * v31];
            v68 = *(_QWORD *)v66;
            v67 = *((_QWORD *)v66 + 1);
            v42 = __OFSUB__(v67, v68);
            v69 = v67 - v68;
            if (v42)
              goto LABEL_132;
            v59 = v34 < v69;
            goto LABEL_76;
          }
        }
        else
        {
          if (v11 != 3)
          {
            v60 = *((_QWORD *)v26 + 4);
            v61 = *((_QWORD *)v26 + 5);
            v42 = __OFSUB__(v61, v60);
            v53 = v61 - v60;
            v54 = v42;
            goto LABEL_70;
          }
          v33 = *((_QWORD *)v26 + 4);
          v32 = *((_QWORD *)v26 + 5);
          v42 = __OFSUB__(v32, v33);
          v34 = v32 - v33;
          v35 = v42;
        }
        if ((v35 & 1) != 0)
          goto LABEL_124;
        v43 = v11 - 2;
        v49 = &v29[16 * v11 - 32];
        v51 = *(_QWORD *)v49;
        v50 = *((_QWORD *)v49 + 1);
        v52 = __OFSUB__(v50, v51);
        v53 = v50 - v51;
        v54 = v52;
        if (v52)
          goto LABEL_127;
        v55 = &v29[16 * v31];
        v57 = *(_QWORD *)v55;
        v56 = *((_QWORD *)v55 + 1);
        v42 = __OFSUB__(v56, v57);
        v58 = v56 - v57;
        if (v42)
          goto LABEL_130;
        if (__OFADD__(v53, v58))
          goto LABEL_131;
        if (v53 + v58 >= v34)
        {
          v59 = v34 < v58;
LABEL_76:
          if (v59)
            v31 = v43;
          goto LABEL_78;
        }
LABEL_70:
        if ((v54 & 1) != 0)
          goto LABEL_126;
        v62 = &v29[16 * v31];
        v64 = *(_QWORD *)v62;
        v63 = *((_QWORD *)v62 + 1);
        v42 = __OFSUB__(v63, v64);
        v65 = v63 - v64;
        if (v42)
          goto LABEL_129;
        if (v65 < v53)
          goto LABEL_15;
LABEL_78:
        v70 = v31 - 1;
        if (v31 - 1 >= v11)
        {
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
          goto LABEL_142;
        }
        if (!v10)
          goto LABEL_145;
        v71 = &v29[16 * v70];
        v72 = *(_QWORD *)v71;
        v73 = &v29[16 * v31];
        v74 = *((_QWORD *)v73 + 1);
        sub_213BF6A0C((char *)(v10 + 24 * *(_QWORD *)v71), (char *)(v10 + 24 * *(_QWORD *)v73), v10 + 24 * v74, __dst);
        if (v1)
          goto LABEL_95;
        if (v74 < v72)
          goto LABEL_119;
        if (v31 > *((_QWORD *)v110 + 2))
          goto LABEL_120;
        *(_QWORD *)v71 = v72;
        *(_QWORD *)&v29[16 * v70 + 8] = v74;
        v75 = *((_QWORD *)v110 + 2);
        if (v31 >= v75)
          goto LABEL_121;
        v26 = v110;
        v11 = v75 - 1;
        memmove(&v29[16 * v31], v73 + 16, 16 * (v75 - 1 - v31));
        *((_QWORD *)v110 + 2) = v75 - 1;
        if (v75 <= 2)
          goto LABEL_15;
      }
    }
    v11 = 1;
LABEL_15:
    v3 = v108;
    if (v9 >= v108)
    {
      v8 = v105;
      v96 = v110;
      v2 = v104;
      goto LABEL_105;
    }
  }
LABEL_142:
  __break(1u);
LABEL_143:
  __break(1u);
LABEL_144:
  __break(1u);
LABEL_145:
  __break(1u);
LABEL_146:
  __break(1u);
LABEL_147:
  __break(1u);
LABEL_148:
  result = sub_213C12900();
  __break(1u);
  return result;
}

uint64_t sub_213BF6A0C(char *__src, char *a2, unint64_t a3, char *__dst)
{
  char *v4;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  __int128 v14;
  __int128 v15;
  char *v16;
  unint64_t v17;
  char *v18;
  char *v19;
  __int128 v20;
  __int128 v21;
  uint64_t result;
  char *v23;
  char *v24;
  char *v25;

  v4 = __dst;
  v6 = a2;
  v7 = __src;
  v8 = a2 - __src;
  v9 = (a2 - __src) / 24;
  v10 = a3 - (_QWORD)a2;
  v11 = (uint64_t)(a3 - (_QWORD)a2) / 24;
  v25 = __src;
  v24 = __dst;
  if (v9 >= v11)
  {
    if (v10 >= -23)
    {
      if (__dst != a2 || &a2[24 * v11] <= __dst)
        memmove(__dst, a2, 24 * v11);
      v16 = &v4[24 * v11];
      v23 = v16;
      v25 = v6;
      if (v7 < v6 && v10 >= 24)
      {
        v17 = a3 - 24;
        v18 = v6;
        while (1)
        {
          v19 = (char *)(v17 + 24);
          v18 -= 24;
          if ((sub_213C127C8() & 1) != 0)
          {
            if (v19 != v6 || v17 >= (unint64_t)v6)
            {
              v20 = *(_OWORD *)v18;
              *(_QWORD *)(v17 + 16) = *((_QWORD *)v18 + 2);
              *(_OWORD *)v17 = v20;
            }
            v25 = v18;
            if (v18 <= v7)
              goto LABEL_38;
          }
          else
          {
            v23 = v16 - 24;
            if (v19 < v16 || v17 >= (unint64_t)v16 || v19 != v16)
            {
              v21 = *(_OWORD *)(v16 - 24);
              *(_QWORD *)(v17 + 16) = *((_QWORD *)v16 - 1);
              *(_OWORD *)v17 = v21;
            }
            v18 = v6;
            v16 -= 24;
            if (v6 <= v7)
              goto LABEL_38;
          }
          v17 -= 24;
          v6 = v18;
          if (v16 <= v4)
            goto LABEL_38;
        }
      }
      goto LABEL_38;
    }
  }
  else if (v8 >= -23)
  {
    if (__dst != __src || &__src[24 * v9] <= __dst)
      memmove(__dst, __src, 24 * v9);
    v12 = &v4[24 * v9];
    v23 = v12;
    if ((unint64_t)v6 < a3 && v8 >= 24)
    {
      do
      {
        if ((sub_213C127C8() & 1) != 0)
        {
          v13 = v6 + 24;
          if (v7 < v6 || v7 >= v13 || v7 != v6)
          {
            v14 = *(_OWORD *)v6;
            *((_QWORD *)v7 + 2) = *((_QWORD *)v6 + 2);
            *(_OWORD *)v7 = v14;
          }
        }
        else
        {
          if (v7 != v4)
          {
            v15 = *(_OWORD *)v4;
            *((_QWORD *)v7 + 2) = *((_QWORD *)v4 + 2);
            *(_OWORD *)v7 = v15;
          }
          v4 += 24;
          v24 = v4;
          v13 = v6;
        }
        v7 += 24;
        if (v4 >= v12)
          break;
        v6 = v13;
      }
      while ((unint64_t)v13 < a3);
      v25 = v7;
    }
LABEL_38:
    sub_213BF6DC8((void **)&v25, (const void **)&v24, &v23);
    return 1;
  }
  result = sub_213C12948();
  __break(1u);
  return result;
}

char *sub_213BF6CD0(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D283A8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_213BF6DC8(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  char *result;
  uint64_t v6;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  if (v4 <= -24)
  {
    result = (char *)sub_213C12948();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v6 = v4 / 24;
    if (result != v3 || result >= &v3[24 * v6])
      return (char *)memmove(result, v3, 24 * v6);
  }
  return result;
}

char *sub_213BF6E84(uint64_t a1)
{
  return sub_213BF6CD0(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_213BF6E98(uint64_t a1)
{
  return sub_213C0D67C(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_213BF6EAC(CMTimeValue a1)
{
  uint64_t v1;
  uint64_t v2;
  CMTimeEpoch *v3;
  void *v4;
  id v5;
  CMTimeEpoch v6;
  CMTimeValue v7;
  void *v8;
  id v9;
  id v10;
  uint64_t result;
  uint64_t v12;
  CMTimeRange v13;
  CMTime duration;
  CMTime start;
  CMTimeRange v16;
  uint64_t v17;

  v13.start.value = a1;
  swift_bridgeObjectRetain();
  sub_213BF6220(&v13.start.value);
  if (v1)
  {
    result = swift_release();
    __break(1u);
  }
  else
  {
    v17 = MEMORY[0x24BEE4AF8];
    v2 = *(_QWORD *)(v13.start.value + 16);
    if (v2)
    {
      v3 = (CMTimeEpoch *)(v13.start.value + 48);
      do
      {
        v6 = *v3;
        v7 = *(v3 - 2);
        v12 = *(v3 - 1);
        CMTimeMake(&v13.start, 100000, v12);
        duration = v13.start;
        start.value = v7;
        *(_QWORD *)&start.timescale = v12;
        start.epoch = v6;
        CMTimeRangeMake(&v13, &start, &duration);
        v16 = v13;
        v5 = sub_213BF5E3C(&v16.start.value, 0, 0, 1);
        v4 = v8;
        v9 = objc_msgSend(v8, sel_copyNextSampleBuffer);
        if (v9)
        {
          v10 = v9;
          MEMORY[0x2199BE778]();
          if (*(_QWORD *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_213C126B4();
          sub_213C126CC();
          sub_213C126A8();

          v4 = v5;
          v5 = v10;
        }
        v3 += 3;

        --v2;
      }
      while (v2);
      swift_release();
      return v17;
    }
    else
    {
      swift_release();
      return MEMORY[0x24BEE4AF8];
    }
  }
  return result;
}

unint64_t sub_213BF7098(CMTimeValue a1)
{
  uint64_t v1;
  unint64_t result;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  opaqueCMSampleBuffer *v6;
  opaqueCMSampleBuffer *v7;
  __CVBuffer *v8;
  __CVBuffer *v9;
  void *BaseAddress;
  size_t BytesPerRow;
  size_t Width;
  size_t Height;
  CGColorSpace *DeviceRGB;
  CGContext *v15;
  CGContext *v16;
  CGImageRef Image;
  CGImageRef v18;
  id v19;
  CGColorSpaceRef v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  unint64_t v27;
  unint64_t v28;
  _QWORD *v29;
  void *v30;
  CGImageRef v31;
  _QWORD *v32;
  uint64_t v33;
  unint64_t v34;
  id v35;
  unint64_t v36;

  result = sub_213BF6EAC(a1);
  v3 = result;
  if (v1)
    return result;
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_213C12918();
    v4 = result;
    if (result)
      goto LABEL_4;
LABEL_26:
    v32 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_27:
    swift_bridgeObjectRelease_n();
    return (unint64_t)v32;
  }
  v4 = *(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain();
  if (!v4)
    goto LABEL_26;
LABEL_4:
  if (v4 >= 1)
  {
    v5 = 0;
    v36 = v3 & 0xC000000000000001;
    v32 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v33 = v4;
    v34 = v3;
    while (1)
    {
      if (v36)
        v6 = (opaqueCMSampleBuffer *)MEMORY[0x2199BE994](v5, v3);
      else
        v6 = (opaqueCMSampleBuffer *)*(id *)(v3 + 8 * v5 + 32);
      v7 = v6;
      v8 = CMSampleBufferGetImageBuffer(v6);
      if (v8)
      {
        v9 = v8;
        CVPixelBufferLockBaseAddress(v8, 1uLL);
        BaseAddress = CVPixelBufferGetBaseAddress(v9);
        BytesPerRow = CVPixelBufferGetBytesPerRow(v9);
        Width = CVPixelBufferGetWidth(v9);
        Height = CVPixelBufferGetHeight(v9);
        DeviceRGB = CGColorSpaceCreateDeviceRGB();
        v15 = CGBitmapContextCreate(BaseAddress, Width, Height, 8uLL, BytesPerRow, DeviceRGB, 0x2002u);
        if (v15)
        {
          v16 = v15;
          Image = CGBitmapContextCreateImage(v15);
          if (Image)
          {
            v18 = Image;
            CVPixelBufferUnlockBaseAddress(v9, 1uLL);
            v31 = v18;
            v35 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBF660]), sel_initWithCGImage_, v18);
            v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBF648]), sel_init);
            v20 = CGColorSpaceCreateDeviceRGB();
            sub_213C05980(MEMORY[0x24BEE4AF8]);
            type metadata accessor for CIImageRepresentationOption(0);
            sub_213BF741C();
            v21 = (void *)sub_213C125C4();
            swift_bridgeObjectRelease();
            v30 = v19;
            v22 = objc_msgSend(v19, sel_JPEGRepresentationOfImage_colorSpace_options_, v35, v20, v21);

            if (v22)
            {
              v23 = sub_213C12528();
              v25 = v24;

              if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
              {
                v4 = v33;
                v3 = v34;
                v26 = v32;
              }
              else
              {
                v26 = sub_213BEA84C(0, v32[2] + 1, 1, v32);
                v4 = v33;
                v3 = v34;
              }
              v28 = v26[2];
              v27 = v26[3];
              if (v28 >= v27 >> 1)
                v26 = sub_213BEA84C((_QWORD *)(v27 > 1), v28 + 1, 1, v26);
              v26[2] = v28 + 1;
              v32 = v26;
              v29 = &v26[2 * v28];
              v29[4] = v23;
              v29[5] = v25;
              goto LABEL_7;
            }

          }
          else
          {

          }
        }
        else
        {

        }
        v4 = v33;
        v3 = v34;
      }
      else
      {

      }
LABEL_7:
      if (v4 == ++v5)
        goto LABEL_27;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_213BF741C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254D27A70;
  if (!qword_254D27A70)
  {
    type metadata accessor for CIImageRepresentationOption(255);
    result = MEMORY[0x2199BF420](&unk_213C14714, v1);
    atomic_store(result, (unint64_t *)&qword_254D27A70);
  }
  return result;
}

unint64_t sub_213BF7464()
{
  unint64_t result;

  result = qword_254D283B8;
  if (!qword_254D283B8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254D283B8);
  }
  return result;
}

uint64_t sub_213BF74A0()
{
  uint64_t v0;
  id v1;
  id v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  char v6;
  uint64_t v8;
  __int128 v9;
  __int128 v10;

  v1 = objc_msgSend(*(id *)(*(_QWORD *)(v0 + 16) + 16), sel_modelDescription);
  v2 = objc_msgSend(v1, sel_metadata);

  type metadata accessor for MLModelMetadataKey(0);
  sub_213BF27D4();
  v3 = sub_213C125DC();

  if (!*(_QWORD *)(v3 + 16))
  {
    v9 = 0u;
    v10 = 0u;
LABEL_10:
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  v4 = (id)*MEMORY[0x24BDBFF50];
  v5 = sub_213C0DF9C();
  if ((v6 & 1) == 0)
  {
    v9 = 0u;
    v10 = 0u;

    goto LABEL_10;
  }
  sub_213BECBD4(*(_QWORD *)(v3 + 56) + 32 * v5, (uint64_t)&v9);

  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v10 + 1))
  {
LABEL_11:
    sub_213BF281C((uint64_t)&v9);
    return 0;
  }
  if (swift_dynamicCast())
    return v8;
  else
    return 0;
}

uint64_t sub_213BF75E0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = v1;
  v3 = sub_213C124F8();
  v2[4] = v3;
  v2[5] = *(_QWORD *)(v3 - 8);
  v2[6] = swift_task_alloc();
  v2[7] = type metadata accessor for PADPrintReplayS2Model();
  return swift_task_switch();
}

uint64_t sub_213BF764C()
{
  uint64_t v0;
  _QWORD *v1;

  sub_213C11A00(*(_QWORD *)(v0 + 48));
  sub_213BF1DCC(0, (unint64_t *)&qword_254D280F8);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v1;
  *v1 = v0;
  v1[1] = sub_213BF76C4;
  return sub_213C127E0();
}

uint64_t sub_213BF76C4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = *(_QWORD **)v2;
  *(_QWORD *)(*(_QWORD *)v2 + 72) = v1;
  swift_task_dealloc();
  if (v1)
    (*(void (**)(_QWORD, _QWORD))(v4[5] + 8))(v4[6], v4[4]);
  else
    v4[10] = a1;
  return swift_task_switch();
}

uint64_t sub_213BF7748()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 40);
  v6 = *(void **)(v0 + 16);
  v5 = *(_QWORD *)(v0 + 24);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v1;
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);

  *(_QWORD *)(v5 + 16) = v7;
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 24));
}

uint64_t sub_213BF77D4()
{
  uint64_t v0;

  type metadata accessor for PADPrintReplayModelManager();
  swift_deallocPartialClassInstance();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_213BF782C(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  unint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  id v22[2];

  v22[1] = *(id *)MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(v1 + 16);
  type metadata accessor for PADPrintReplayS2ModelInput();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  v5 = objc_allocWithZone(MEMORY[0x24BDC0018]);
  v6 = a1;
  v7 = objc_msgSend(v5, sel_init);
  v8 = *(void **)(v3 + 16);
  v22[0] = 0;
  v9 = objc_msgSend(v8, sel_predictionFromFeatures_options_error_, v4, v7, v22);
  v10 = v22[0];
  if (!v9)
  {
    v21 = v22[0];
    sub_213C1248C();

    swift_willThrow();
    swift_release();

    return;
  }
  v11 = v9;
  type metadata accessor for PADPrintReplayS2ModelOutput();
  *(_QWORD *)(swift_initStackObject() + 16) = v11;
  v12 = v10;
  swift_release();

  v13 = (void *)sub_213C125E8();
  v14 = objc_msgSend(v11, sel_featureValueForName_, v13);

  if (v14)
  {
    v15 = objc_msgSend(v14, sel_multiArrayValue);

    if (v15)
    {
      swift_release();
      v16 = objc_msgSend(v15, sel_numberArray);

      sub_213BF1DCC(0, &qword_254D27C38);
      v17 = sub_213C12690();

      if (v17 >> 62)
      {
        swift_bridgeObjectRetain();
        v18 = sub_213C12918();
        swift_bridgeObjectRelease();
        if (v18)
          goto LABEL_6;
      }
      else
      {
        v18 = *(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10);
        if (v18)
        {
LABEL_6:
          if ((v17 & 0xC000000000000001) != 0)
          {
            v19 = (id)MEMORY[0x2199BE994](0, v17);
          }
          else
          {
            if (!*(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10))
              __break(1u);
            v19 = *(id *)(v17 + 32);
          }
          v20 = v19;
          swift_bridgeObjectRelease();
          objc_msgSend(v20, sel_floatValue);

          goto LABEL_13;
        }
      }
      swift_bridgeObjectRelease();
LABEL_13:
      LOBYTE(v22[0]) = v18 == 0;
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_213BF7AF0()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PADPrintReplayModelManager()
{
  return objc_opt_self();
}

uint64_t sub_213BF7B34(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  __int128 v7[15];
  uint64_t v8;
  _OWORD v9[15];
  uint64_t v10;

  sub_213BF7BF0((uint64_t)v9);
  if (*(_QWORD *)(v3 + OBJC_IVAR____TtC10CoreIDVPAD30PADInternalAuditDataRepository_dataRecorder))
  {
    v7[12] = v9[12];
    v7[13] = v9[13];
    v7[14] = v9[14];
    v8 = v10;
    v7[8] = v9[8];
    v7[9] = v9[9];
    v7[10] = v9[10];
    v7[11] = v9[11];
    v7[4] = v9[4];
    v7[5] = v9[5];
    v7[6] = v9[6];
    v7[7] = v9[7];
    v7[0] = v9[0];
    v7[1] = v9[1];
    v7[2] = v9[2];
    v7[3] = v9[3];
    sub_213BE4D58(v7, a2, a3);
  }
  return sub_213BDF2F8((uint64_t)v9);
}

void sub_213BF7BF0(uint64_t a1@<X8>)
{
  void *v1;
  id v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  _QWORD *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  char v59;
  int v60;
  unint64_t v61;
  unint64_t v62;
  _QWORD *v63;
  id v64;
  uint64_t v65;
  int64_t v66;
  void **v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  unint64_t v79;
  char v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  unint64_t v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  id v94;
  uint64_t v95;
  int64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  id v103;
  void *v104;
  int v105;
  int v106;
  unint64_t v107;
  unint64_t v108;
  unint64_t v109;
  unint64_t v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  id v119;
  unint64_t v120;
  char v121;
  uint64_t v122;
  void *v123;
  uint64_t v124;
  uint64_t v125;
  id v126;
  unint64_t v127;
  unint64_t v128;
  id v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  id v138;
  unint64_t v139;
  char v140;
  uint64_t v141;
  void *v142;
  uint64_t v143;
  uint64_t v144;
  id v145;
  unint64_t v146;
  unint64_t v147;
  id v148;
  int v149;
  int v150;
  id v151;
  id v152;
  int v153;
  int v154;
  id v155;
  int v156;
  int v157;
  id v158;
  id v159;
  id v160;
  int v161;
  int v162;
  id v163;
  int v164;
  int v165;
  id v166;
  int v167;
  int v168;
  id v169;
  void *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  id v174;
  uint64_t v175;
  uint64_t v176;
  id v177;
  uint64_t v178;
  uint64_t v179;
  id v180;
  uint64_t v181;
  uint64_t v182;
  id v183;
  uint64_t v184;
  uint64_t v185;
  id v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  id v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  id v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  id v208;
  uint64_t v209;
  uint64_t v210;
  id v211;
  int64_t v212;
  uint64_t v213;
  id v214;
  _QWORD *v215;
  _QWORD *v216;
  uint64_t v217;
  int64_t v218;
  uint64_t v219;
  _QWORD *v220;
  __int128 v221;
  uint64_t v222;
  uint64_t v223;
  _QWORD *v224;
  id v225;
  __int128 v226;
  _QWORD *v227;
  uint64_t v228;
  id v229;
  id v230;
  id v231;
  uint64_t v232;
  _OWORD v233[3];
  __int128 v234;
  __int128 v235;
  uint64_t v236;

  v236 = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(v1, sel_livenessLabel);
  v208 = objc_msgSend(v3, sel_integerValue);

  v211 = v1;
  v4 = objc_msgSend(v1, sel_gestureSequence);
  sub_213BE2B78();
  v5 = sub_213C12690();

  v210 = a1;
  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    v6 = sub_213C12918();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v7 = MEMORY[0x24BEE4AF8];
  if (v6)
  {
    *(_QWORD *)&v233[0] = MEMORY[0x24BEE4AF8];
    sub_213C0D5FC(0, v6 & ~(v6 >> 63), 0);
    if (v6 < 0)
      goto LABEL_149;
    v8 = 0;
    v9 = *(_QWORD *)&v233[0];
    do
    {
      v10 = v9;
      if ((v5 & 0xC000000000000001) != 0)
        v11 = (id)MEMORY[0x2199BE994](v8, v5);
      else
        v11 = *(id *)(v5 + 8 * v8 + 32);
      v12 = v11;
      v13 = (unint64_t)objc_msgSend(v11, sel_integerValue);

      if (v13 > 0xA)
        v14 = 10;
      else
        v14 = qword_213C14F18[v13];
      v9 = v10;
      *(_QWORD *)&v233[0] = v10;
      v15 = *(_QWORD *)(v10 + 16);
      v16 = *(_QWORD *)(v9 + 24);
      if (v15 >= v16 >> 1)
      {
        sub_213C0D5FC(v16 > 1, v15 + 1, 1);
        v9 = *(_QWORD *)&v233[0];
      }
      ++v8;
      *(_QWORD *)(v9 + 16) = v15 + 1;
      *(_QWORD *)(v9 + 8 * v15 + 32) = v14;
    }
    while (v6 != v8);
    v207 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v207 = MEMORY[0x24BEE4AF8];
  }
  v17 = objc_msgSend(v211, sel_assessmentsFAC);
  v18 = sub_213C12690();

  if (v18 >> 62)
  {
    swift_bridgeObjectRetain();
    v19 = sub_213C12918();
    swift_bridgeObjectRelease();
    if (v19)
      goto LABEL_19;
LABEL_33:
    swift_bridgeObjectRelease();
    v21 = MEMORY[0x24BEE4AF8];
    goto LABEL_34;
  }
  v19 = *(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v19)
    goto LABEL_33;
LABEL_19:
  *(_QWORD *)&v233[0] = v7;
  sub_213C0D4C4(0, v19 & ~(v19 >> 63), 0);
  if (v19 < 0)
    goto LABEL_150;
  v20 = 0;
  v21 = *(_QWORD *)&v233[0];
  do
  {
    if ((v18 & 0xC000000000000001) != 0)
      v22 = (id)MEMORY[0x2199BE994](v20, v18);
    else
      v22 = *(id *)(v18 + 8 * v20 + 32);
    v23 = v22;
    v24 = objc_msgSend(v22, sel_integerValue);

    if ((unint64_t)v24 >= 5)
      v25 = 2;
    else
      v25 = (uint64_t)v24;
    *(_QWORD *)&v233[0] = v21;
    v27 = *(_QWORD *)(v21 + 16);
    v26 = *(_QWORD *)(v21 + 24);
    if (v27 >= v26 >> 1)
    {
      sub_213C0D4C4(v26 > 1, v27 + 1, 1);
      v21 = *(_QWORD *)&v233[0];
    }
    ++v20;
    *(_QWORD *)(v21 + 16) = v27 + 1;
    *(_QWORD *)(v21 + 8 * v27 + 32) = v25;
  }
  while (v19 != v20);
  swift_bridgeObjectRelease();
LABEL_34:
  v206 = v21;
  v28 = objc_msgSend(v211, sel_assessmentsPRD);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D27EF0);
  v29 = sub_213C12690();

  v30 = *(_QWORD *)(v29 + 16);
  if (v30)
  {
    v31 = (void *)objc_opt_self();
    swift_bridgeObjectRetain();
    v32 = 0;
    v216 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      swift_bridgeObjectRetain();
      v35 = (void *)sub_213C125C4();
      *(_QWORD *)&v233[0] = 0;
      v36 = objc_msgSend(v31, sel_dataWithJSONObject_options_error_, v35, 4, v233);

      v37 = *(id *)&v233[0];
      if (v36)
      {
        v38 = sub_213C12528();
        v40 = v39;

        sub_213C12408();
        swift_allocObject();
        sub_213C123FC();
        sub_213BDF08C();
        sub_213C123F0();
        sub_213BEBA50(v38, v40);
        swift_bridgeObjectRelease();
        swift_release();
        v226 = v233[0];
        v221 = v233[1];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v216 = sub_213BEAB78(0, v216[2] + 1, 1, v216);
        v42 = v216[2];
        v41 = v216[3];
        if (v42 >= v41 >> 1)
          v216 = sub_213BEAB78((_QWORD *)(v41 > 1), v42 + 1, 1, v216);
        v216[2] = v42 + 1;
        v43 = &v216[4 * v42];
        *((_OWORD *)v43 + 2) = v226;
        *((_OWORD *)v43 + 3) = v221;
      }
      else
      {
        v33 = v37;
        v34 = (void *)sub_213C1248C();

        swift_willThrow();
        swift_bridgeObjectRelease();
      }
      ++v32;
    }
    while (v30 != v32);
    swift_bridgeObjectRelease_n();
  }
  else
  {
    swift_bridgeObjectRelease();
    v216 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v44 = objc_msgSend(v211, sel_assessmentsTA);
  v45 = sub_213C12690();

  v46 = *(_QWORD *)(v45 + 16);
  v47 = MEMORY[0x24BEE4AF8];
  if (v46)
  {
    v48 = (void *)objc_opt_self();
    swift_bridgeObjectRetain();
    v49 = 0;
    v215 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      swift_bridgeObjectRetain();
      v52 = (void *)sub_213C125C4();
      *(_QWORD *)&v233[0] = 0;
      v53 = objc_msgSend(v48, sel_dataWithJSONObject_options_error_, v52, 4, v233);

      v54 = *(id *)&v233[0];
      if (v53)
      {
        v55 = sub_213C12528();
        v57 = v56;

        sub_213C12408();
        swift_allocObject();
        sub_213C123FC();
        sub_213BDF0D0();
        sub_213C123F0();
        sub_213BEBA50(v55, v57);
        swift_bridgeObjectRelease();
        swift_release();
        v58 = *(_QWORD *)&v233[0];
        v59 = BYTE8(v233[0]);
        v60 = HIDWORD(v233[0]);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v215 = sub_213BEA494(0, v215[2] + 1, 1, v215);
        v62 = v215[2];
        v61 = v215[3];
        if (v62 >= v61 >> 1)
          v215 = sub_213BEA494((_QWORD *)(v61 > 1), v62 + 1, 1, v215);
        v215[2] = v62 + 1;
        v63 = &v215[2 * v62];
        v63[4] = v58;
        *((_BYTE *)v63 + 40) = v59;
        *((_DWORD *)v63 + 11) = v60;
      }
      else
      {
        v50 = v54;
        v51 = (void *)sub_213C1248C();

        swift_willThrow();
        swift_bridgeObjectRelease();
      }
      ++v49;
    }
    while (v46 != v49);
    swift_bridgeObjectRelease();
    v47 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v215 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRelease();
  v64 = objc_msgSend(v211, sel_timestampsFAC);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D27FB8);
  v65 = sub_213C12690();

  v66 = *(_QWORD *)(v65 + 16);
  v67 = (void **)MEMORY[0x24BDC0D80];
  v68 = MEMORY[0x24BEE4AD8];
  if (v66)
  {
    v232 = v47;
    sub_213C0D498(0, v66, 0);
    v69 = 0;
    v217 = v65 + 32;
    v70 = *v67;
    v71 = MEMORY[0x24BEE0D00];
    v72 = MEMORY[0x24BEE0D10];
    v73 = v68 + 8;
    v212 = v66;
    while (1)
    {
      v222 = v69;
      v74 = *(_QWORD *)(v217 + 8 * v69);
      v75 = *(_QWORD *)(v74 + 16);
      if (v75)
        break;
      v227 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_78:
      v90 = v232;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_213C0D498(0, *(_QWORD *)(v232 + 16) + 1, 1);
        v90 = v232;
      }
      v91 = v222;
      v93 = *(_QWORD *)(v90 + 16);
      v92 = *(_QWORD *)(v90 + 24);
      if (v93 >= v92 >> 1)
      {
        sub_213C0D498(v92 > 1, v93 + 1, 1);
        v91 = v222;
        v90 = v232;
      }
      v69 = v91 + 1;
      *(_QWORD *)(v90 + 16) = v93 + 1;
      *(_QWORD *)(v90 + 8 * v93 + 32) = v227;
      if (v69 == v66)
      {
        v205 = v90;
        swift_bridgeObjectRelease();
        v47 = MEMORY[0x24BEE4AF8];
        goto LABEL_85;
      }
    }
    swift_bridgeObjectRetain_n();
    v76 = 0;
    v227 = (_QWORD *)MEMORY[0x24BEE4AF8];
    while (1)
    {
      v77 = *(_QWORD *)(v74 + 8 * v76 + 32);
      swift_bridgeObjectRetain();
      v78 = v70;
      v229 = (id)sub_213C12624();
      sub_213C1284C();
      if (*(_QWORD *)(v77 + 16) && (v79 = sub_213C0DF6C((uint64_t)v233), (v80 & 1) != 0))
      {
        sub_213BECBD4(*(_QWORD *)(v77 + 56) + 32 * v79, (uint64_t)&v234);
      }
      else
      {
        v234 = 0u;
        v235 = 0u;
      }
      sub_213BFA004((uint64_t)v233);
      if (*((_QWORD *)&v235 + 1))
      {
        if ((swift_dynamicCast() & 1) != 0)
        {
          v81 = v74;
          v82 = v75;
          v83 = v70;
          v84 = v73;
          v85 = v72;
          v86 = v71;
          v87 = objc_msgSend(v229, sel_longLongValue);
          swift_bridgeObjectRelease();

          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v227 = sub_213BEAA6C(0, v227[2] + 1, 1, v227);
          v89 = v227[2];
          v88 = v227[3];
          if (v89 >= v88 >> 1)
            v227 = sub_213BEAA6C((_QWORD *)(v88 > 1), v89 + 1, 1, v227);
          v227[2] = v89 + 1;
          v227[v89 + 4] = v87;
          v71 = v86;
          v72 = v85;
          v73 = v84;
          v70 = v83;
          v75 = v82;
          v74 = v81;
          goto LABEL_64;
        }
      }
      else
      {
        sub_213BF281C((uint64_t)&v234);
      }
      swift_bridgeObjectRelease();
LABEL_64:
      if (v75 == ++v76)
      {
        swift_bridgeObjectRelease_n();
        v66 = v212;
        goto LABEL_78;
      }
    }
  }
  swift_bridgeObjectRelease();
  v205 = MEMORY[0x24BEE4AF8];
LABEL_85:
  v94 = objc_msgSend(v211, sel_faceprintsID);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D27FC0);
  v95 = sub_213C12690();

  v96 = *(_QWORD *)(v95 + 16);
  if (v96)
  {
    *(_QWORD *)&v233[0] = v47;
    sub_213C0D5D0(0, v96, 0);
    v97 = 0;
    v98 = *(_QWORD *)&v233[0];
    v218 = v96;
    v223 = v95 + 32;
    while (1)
    {
      v99 = *(_QWORD *)(v223 + 8 * v97);
      if (v99 >> 62)
      {
        swift_bridgeObjectRetain();
        v100 = sub_213C12918();
        if (!v100)
        {
LABEL_99:
          swift_bridgeObjectRelease();
          v102 = v47;
          goto LABEL_100;
        }
      }
      else
      {
        v100 = *(_QWORD *)((v99 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (!v100)
          goto LABEL_99;
      }
      *(_QWORD *)&v234 = v47;
      sub_213C0D620(0, v100 & ~(v100 >> 63), 0);
      if (v100 < 0)
      {
        __break(1u);
LABEL_149:
        __break(1u);
LABEL_150:
        __break(1u);
      }
      v101 = 0;
      v102 = v234;
      do
      {
        if ((v99 & 0xC000000000000001) != 0)
          v103 = (id)MEMORY[0x2199BE994](v101, v99);
        else
          v103 = *(id *)(v99 + 8 * v101 + 32);
        v104 = v103;
        objc_msgSend(v103, sel_floatValue);
        v106 = v105;

        *(_QWORD *)&v234 = v102;
        v108 = *(_QWORD *)(v102 + 16);
        v107 = *(_QWORD *)(v102 + 24);
        if (v108 >= v107 >> 1)
        {
          sub_213C0D620(v107 > 1, v108 + 1, 1);
          v102 = v234;
        }
        ++v101;
        *(_QWORD *)(v102 + 16) = v108 + 1;
        *(_DWORD *)(v102 + 4 * v108 + 32) = v106;
      }
      while (v100 != v101);
      swift_bridgeObjectRelease();
      v47 = MEMORY[0x24BEE4AF8];
      v96 = v218;
LABEL_100:
      *(_QWORD *)&v233[0] = v98;
      v110 = *(_QWORD *)(v98 + 16);
      v109 = *(_QWORD *)(v98 + 24);
      if (v110 >= v109 >> 1)
      {
        sub_213C0D5D0(v109 > 1, v110 + 1, 1);
        v98 = *(_QWORD *)&v233[0];
      }
      ++v97;
      *(_QWORD *)(v98 + 16) = v110 + 1;
      *(_QWORD *)(v98 + 8 * v110 + 32) = v102;
      if (v97 == v96)
      {
        swift_bridgeObjectRelease();
        goto LABEL_105;
      }
    }
  }
  swift_bridgeObjectRelease();
  v98 = MEMORY[0x24BEE4AF8];
LABEL_105:
  v228 = v98;
  v111 = objc_msgSend(v211, sel_timestampsID);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D27EE0);
  v112 = sub_213C12690();

  v113 = *(_QWORD *)(v112 + 16);
  if (v113)
  {
    v114 = (void *)*MEMORY[0x24BDC0D80];
    swift_bridgeObjectRetain();
    v115 = 0;
    v224 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v116 = MEMORY[0x24BEE0D00];
    v117 = MEMORY[0x24BEE4AD8] + 8;
    v219 = v112;
    while (1)
    {
      v118 = *(_QWORD *)(v112 + 8 * v115 + 32);
      swift_bridgeObjectRetain();
      v119 = v114;
      v230 = (id)sub_213C12624();
      sub_213C1284C();
      if (*(_QWORD *)(v118 + 16) && (v120 = sub_213C0DF6C((uint64_t)v233), (v121 & 1) != 0))
      {
        sub_213BECBD4(*(_QWORD *)(v118 + 56) + 32 * v120, (uint64_t)&v234);
      }
      else
      {
        v234 = 0u;
        v235 = 0u;
      }
      sub_213BFA004((uint64_t)v233);
      if (*((_QWORD *)&v235 + 1))
      {
        if ((swift_dynamicCast() & 1) != 0)
        {
          v122 = v113;
          v123 = v114;
          v124 = v117;
          v125 = v116;
          v126 = objc_msgSend(v230, sel_longLongValue);
          swift_bridgeObjectRelease();

          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v224 = sub_213BEAA6C(0, v224[2] + 1, 1, v224);
          v128 = v224[2];
          v127 = v224[3];
          if (v128 >= v127 >> 1)
            v224 = sub_213BEAA6C((_QWORD *)(v127 > 1), v128 + 1, 1, v224);
          v224[2] = v128 + 1;
          v224[v128 + 4] = v126;
          v116 = v125;
          v117 = v124;
          v114 = v123;
          v113 = v122;
          v112 = v219;
          goto LABEL_109;
        }
      }
      else
      {
        sub_213BF281C((uint64_t)&v234);
      }
      swift_bridgeObjectRelease();
LABEL_109:
      if (v113 == ++v115)
      {
        swift_bridgeObjectRelease();
        goto LABEL_123;
      }
    }
  }
  v224 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_123:
  swift_bridgeObjectRelease();
  v129 = objc_msgSend(v211, sel_timestampsButtonPressed);
  v130 = sub_213C12690();

  v131 = *(_QWORD *)(v130 + 16);
  v132 = MEMORY[0x24BEE4AD8];
  if (v131)
  {
    v133 = (void *)*MEMORY[0x24BDC0D80];
    swift_bridgeObjectRetain();
    v134 = 0;
    v220 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v135 = MEMORY[0x24BEE0D10];
    v136 = v132 + 8;
    v213 = v130;
    while (1)
    {
      v137 = *(_QWORD *)(v130 + 8 * v134 + 32);
      swift_bridgeObjectRetain();
      v138 = v133;
      v231 = (id)sub_213C12624();
      sub_213C1284C();
      if (*(_QWORD *)(v137 + 16) && (v139 = sub_213C0DF6C((uint64_t)v233), (v140 & 1) != 0))
      {
        sub_213BECBD4(*(_QWORD *)(v137 + 56) + 32 * v139, (uint64_t)&v234);
      }
      else
      {
        v234 = 0u;
        v235 = 0u;
      }
      sub_213BFA004((uint64_t)v233);
      if (*((_QWORD *)&v235 + 1))
      {
        if ((swift_dynamicCast() & 1) != 0)
        {
          v141 = v131;
          v142 = v133;
          v143 = v136;
          v144 = v135;
          v145 = objc_msgSend(v231, sel_longLongValue);
          swift_bridgeObjectRelease();

          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v220 = sub_213BEAA6C(0, v220[2] + 1, 1, v220);
          v147 = v220[2];
          v146 = v220[3];
          if (v147 >= v146 >> 1)
            v220 = sub_213BEAA6C((_QWORD *)(v146 > 1), v147 + 1, 1, v220);
          v220[2] = v147 + 1;
          v220[v147 + 4] = v145;
          v135 = v144;
          v136 = v143;
          v133 = v142;
          v131 = v141;
          v130 = v213;
          goto LABEL_127;
        }
      }
      else
      {
        sub_213BF281C((uint64_t)&v234);
      }
      swift_bridgeObjectRelease();
LABEL_127:
      if (v131 == ++v134)
      {
        swift_bridgeObjectRelease();
        goto LABEL_141;
      }
    }
  }
  v220 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_141:
  swift_bridgeObjectRelease();
  v148 = objc_msgSend(v211, sel_assessmentFAC);
  objc_msgSend(v148, sel_floatValue);
  v150 = v149;

  v151 = objc_msgSend(v211, sel_assessmentTA);
  v225 = objc_msgSend(v151, sel_integerValue);

  v152 = objc_msgSend(v211, sel_maxNccLow);
  objc_msgSend(v152, sel_floatValue);
  v154 = v153;

  v155 = objc_msgSend(v211, sel_maxNccHigh);
  objc_msgSend(v155, sel_floatValue);
  v157 = v156;

  v158 = objc_msgSend(v211, sel_ignoredStitches);
  v159 = objc_msgSend(v158, sel_integerValue);

  v160 = objc_msgSend(v211, sel_assessmentFakePRD);
  objc_msgSend(v160, sel_floatValue);
  v162 = v161;

  v163 = objc_msgSend(v211, sel_assessmentLivePRD);
  objc_msgSend(v163, sel_floatValue);
  v165 = v164;

  v166 = objc_msgSend(v211, sel_assessmentID);
  objc_msgSend(v166, sel_floatValue);
  v168 = v167;

  v169 = objc_msgSend(v211, sel_deviceInfo);
  v214 = v159;
  if (v169)
  {
    v170 = v169;
    v171 = sub_213C1260C();
    v198 = v172;
    v199 = v171;

  }
  else
  {
    v198 = 0;
    v199 = 0;
  }
  if (v208 == (id)2)
    v173 = 2;
  else
    v173 = v208 == (id)1;
  v174 = objc_msgSend(v211, sel_ageLabel);
  v175 = sub_213C1260C();
  v209 = v176;

  v177 = objc_msgSend(v211, sel_sexLabel);
  v178 = sub_213C1260C();
  v203 = v179;
  v204 = v178;

  v180 = objc_msgSend(v211, sel_skintoneLabel);
  v181 = sub_213C1260C();
  v201 = v182;
  v202 = v181;

  v183 = objc_msgSend(v211, sel_ethnicityLabel);
  v200 = sub_213C1260C();
  v185 = v184;

  v186 = objc_msgSend(v211, sel_faceHairLabel);
  v187 = sub_213C1260C();
  v189 = v188;

  v190 = objc_msgSend(v211, sel_headgearLabel);
  v191 = sub_213C1260C();
  v193 = v192;

  v194 = objc_msgSend(v211, sel_glassesLabel);
  v195 = sub_213C1260C();
  v197 = v196;

  *(_QWORD *)v210 = v173;
  *(_QWORD *)(v210 + 8) = v207;
  *(_QWORD *)(v210 + 16) = v206;
  *(_QWORD *)(v210 + 24) = v216;
  *(_QWORD *)(v210 + 32) = v215;
  *(_QWORD *)(v210 + 40) = v205;
  *(_QWORD *)(v210 + 48) = v224;
  *(_QWORD *)(v210 + 56) = v220;
  *(_QWORD *)(v210 + 64) = v228;
  *(_DWORD *)(v210 + 72) = v150;
  *(_QWORD *)(v210 + 80) = v225;
  *(_DWORD *)(v210 + 88) = v162;
  *(_DWORD *)(v210 + 92) = v165;
  *(_DWORD *)(v210 + 96) = v168;
  *(_DWORD *)(v210 + 100) = v154;
  *(_DWORD *)(v210 + 104) = v157;
  *(_QWORD *)(v210 + 112) = v214;
  *(_QWORD *)(v210 + 120) = v199;
  *(_QWORD *)(v210 + 128) = v198;
  *(_QWORD *)(v210 + 136) = v175;
  *(_QWORD *)(v210 + 144) = v209;
  *(_QWORD *)(v210 + 152) = v204;
  *(_QWORD *)(v210 + 160) = v203;
  *(_QWORD *)(v210 + 168) = v202;
  *(_QWORD *)(v210 + 176) = v201;
  *(_QWORD *)(v210 + 184) = v200;
  *(_QWORD *)(v210 + 192) = v185;
  *(_QWORD *)(v210 + 200) = v187;
  *(_QWORD *)(v210 + 208) = v189;
  *(_QWORD *)(v210 + 216) = v191;
  *(_QWORD *)(v210 + 224) = v193;
  *(_QWORD *)(v210 + 232) = v195;
  *(_QWORD *)(v210 + 240) = v197;
}

uint64_t sub_213BF9210()
{
  uint64_t v0;
  uint64_t result;

  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC10CoreIDVPAD30PADInternalAuditDataRepository_dataRecorder))
    return sub_213BE8668();
  return result;
}

uint64_t sub_213BF92E8(uint64_t result, char *a2, uint64_t a3)
{
  uint64_t v3;

  if (*(_QWORD *)(v3 + OBJC_IVAR____TtC10CoreIDVPAD30PADInternalAuditDataRepository_dataRecorder))
    return sub_213BE8AD8(result, a2, a3);
  return result;
}

void sub_213BF9390(uint64_t a1, uint64_t a2, char *a3, void *a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  id v19;

  v9 = sub_213C12588();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_213BF9C6C(a4);
  if (v13)
  {
    if (*(_QWORD *)(v4 + OBJC_IVAR____TtC10CoreIDVPAD30PADInternalAuditDataRepository_dataRecorder))
    {
      v19 = v13;
      sub_213BE9074(a1, a2, a3, v13);

    }
    else
    {

    }
  }
  else
  {
    if (qword_254D27930 != -1)
      swift_once();
    v14 = __swift_project_value_buffer(v9, (uint64_t)qword_254D27938);
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v14, v9);
    v15 = sub_213C12570();
    v16 = sub_213C1275C();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_213BCD000, v15, v16, "PADInternalAuditDataRepository: Unable to create Face Pose representation from input dictionary.", v17, 2u);
      MEMORY[0x2199BF4BC](v17, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
}

void sub_213BF95CC(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;

  v3 = sub_213C12588();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_213BF983C(a1, &v22);
  v7 = v23;
  if (v23 == 2)
  {
    if (qword_254D27930 != -1)
      swift_once();
    v8 = __swift_project_value_buffer(v3, (uint64_t)qword_254D27938);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v8, v3);
    v9 = sub_213C12570();
    v10 = sub_213C1275C();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_213BCD000, v9, v10, "PADInternalAuditDataRepository: Unable to create TA assessment from input dictionary.", v11, 2u);
      MEMORY[0x2199BF4BC](v11, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  else
  {
    v12 = *(_QWORD *)(v1 + OBJC_IVAR____TtC10CoreIDVPAD30PADInternalAuditDataRepository_dataRecorder);
    if (v12)
    {
      v13 = v22;
      v14 = HIDWORD(v23);
      v15 = (_QWORD *)(v12 + 24);
      swift_beginAccess();
      v16 = *(_QWORD **)(v12 + 24);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(_QWORD *)(v12 + 24) = v16;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v16 = sub_213BEA494(0, v16[2] + 1, 1, v16);
        *v15 = v16;
      }
      v19 = v16[2];
      v18 = v16[3];
      if (v19 >= v18 >> 1)
      {
        v16 = sub_213BEA494((_QWORD *)(v18 > 1), v19 + 1, 1, v16);
        *v15 = v16;
      }
      v16[2] = v19 + 1;
      v20 = &v16[2 * v19];
      v20[4] = v13;
      *((_BYTE *)v20 + 40) = v7 & 1;
      *((_DWORD *)v20 + 11) = v14;
      swift_endAccess();
    }
  }
}

void sub_213BF983C(void *a1@<X0>, _QWORD *a2@<X8>)
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[24];
  uint64_t v20;

  v4 = (void *)sub_213C125E8();
  v5 = objc_msgSend(a1, sel_objectForKey_, v4);

  if (v5)
  {
    sub_213C12810();
    swift_unknownObjectRelease();
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
  }
  sub_213BF1CD8((uint64_t)&v17, (uint64_t)v19);
  if (!v20)
    goto LABEL_20;
  sub_213BE2B78();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_21:
    v11 = 0;
    v15 = 2;
    goto LABEL_22;
  }
  v6 = (void *)sub_213C125E8();
  v7 = objc_msgSend(a1, sel_objectForKey_, v6);

  if (v7)
  {
    sub_213C12810();
    swift_unknownObjectRelease();
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
  }
  sub_213BF1CD8((uint64_t)&v17, (uint64_t)v19);
  if (!v20)
    goto LABEL_19;
  if ((swift_dynamicCast() & 1) == 0)
  {

    goto LABEL_21;
  }
  v8 = (void *)sub_213C125E8();
  v9 = objc_msgSend(a1, sel_objectForKey_, v8);

  if (v9)
  {
    sub_213C12810();
    swift_unknownObjectRelease();
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
  }
  sub_213BF1CD8((uint64_t)&v17, (uint64_t)v19);
  if (!v20)
  {

LABEL_19:
LABEL_20:
    sub_213BF281C((uint64_t)v19);
    goto LABEL_21;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {

    goto LABEL_21;
  }
  objc_msgSend(v16, sel_doubleValue);
  v11 = v10;
  v12 = objc_msgSend(v16, sel_BOOLValue);
  objc_msgSend(v16, sel_floatValue);
  v14 = v13;

  v15 = v12 | ((unint64_t)v14 << 32);
LABEL_22:
  *a2 = v11;
  a2[1] = v15;
}

id PADInternalAuditDataRepository.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id PADInternalAuditDataRepository.init()()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  objc_super v5;

  v1 = OBJC_IVAR____TtC10CoreIDVPAD30PADInternalAuditDataRepository_dataRecorder;
  v2 = qword_254D27958;
  v3 = v0;
  if (v2 != -1)
    swift_once();
  *(_QWORD *)&v3[v1] = qword_254D27CD8;
  swift_retain();

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for PADInternalAuditDataRepository();
  return objc_msgSendSuper2(&v5, sel_init);
}

id PADInternalAuditDataRepository.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PADInternalAuditDataRepository();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_213BF9C6C(void *a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  objc_class *v17;
  char *v18;
  id v19;
  objc_super v21;
  id v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[24];
  uint64_t v26;

  v2 = (void *)sub_213C125E8();
  v3 = objc_msgSend(a1, sel_objectForKey_, v2);

  if (v3)
  {
    sub_213C12810();
    swift_unknownObjectRelease();
  }
  else
  {
    v23 = 0u;
    v24 = 0u;
  }
  sub_213BF1CD8((uint64_t)&v23, (uint64_t)v25);
  if (!v26)
    goto LABEL_20;
  sub_213BE2B78();
  if ((swift_dynamicCast() & 1) == 0)
    return 0;
  v4 = v22;
  v5 = (void *)sub_213C125E8();
  v6 = objc_msgSend(a1, sel_objectForKey_, v5);

  if (v6)
  {
    sub_213C12810();
    swift_unknownObjectRelease();
  }
  else
  {
    v23 = 0u;
    v24 = 0u;
  }
  sub_213BF1CD8((uint64_t)&v23, (uint64_t)v25);
  if (!v26)
    goto LABEL_19;
  if ((swift_dynamicCast() & 1) == 0)
  {

    return 0;
  }
  v7 = v22;
  v8 = (void *)sub_213C125E8();
  v9 = objc_msgSend(a1, sel_objectForKey_, v8);

  if (v9)
  {
    sub_213C12810();
    swift_unknownObjectRelease();
  }
  else
  {
    v23 = 0u;
    v24 = 0u;
  }
  sub_213BF1CD8((uint64_t)&v23, (uint64_t)v25);
  if (!v26)
  {

LABEL_19:
LABEL_20:
    sub_213BF281C((uint64_t)v25);
    return 0;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {

    return 0;
  }
  v10 = v22;
  objc_msgSend(v22, sel_floatValue);
  v12 = v11;
  objc_msgSend(v22, sel_floatValue);
  v14 = v13;
  objc_msgSend(v22, sel_floatValue);
  v16 = v15;
  v17 = (objc_class *)type metadata accessor for PADSWPose();
  v18 = (char *)objc_allocWithZone(v17);
  *(double *)&v18[OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_pitch] = v12;
  *(double *)&v18[OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_yaw] = v14;
  *(double *)&v18[OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_roll] = v16;
  v21.receiver = v18;
  v21.super_class = v17;
  v19 = objc_msgSendSuper2(&v21, sel_init);

  return v19;
}

uint64_t type metadata accessor for PADInternalAuditDataRepository()
{
  return objc_opt_self();
}

uint64_t method lookup function for PADInternalAuditDataRepository()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PADInternalAuditDataRepository.storeClassifierResult(_:imageData:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x58))();
}

uint64_t dispatch thunk of PADInternalAuditDataRepository.storeUnencryptedVideoFrom(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of PADInternalAuditDataRepository.storePRDBuffer(_:name:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of PADInternalAuditDataRepository.storeFACPoseBuffer(_:identifier:values:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of PADInternalAuditDataRepository.storeTAValues(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t sub_213BFA004(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

_QWORD *initializeBufferWithCopyOfBuffer for PADCounter(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  id v4;

  v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = v3;
  return a1;
}

void destroy for PADCounter(uint64_t a1)
{

}

_QWORD *assignWithCopy for PADCounter(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  id v5;

  *a1 = *a2;
  v3 = (void *)a2[1];
  v4 = (void *)a1[1];
  a1[1] = v3;
  v5 = v3;

  return a1;
}

_QWORD *assignWithTake for PADCounter(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  void *v4;

  v3 = a2[1];
  v4 = (void *)a1[1];
  *a1 = *a2;
  a1[1] = v3;

  return a1;
}

uint64_t getEnumTagSinglePayload for PADCounter(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PADCounter(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PADCounter()
{
  return &type metadata for PADCounter;
}

uint64_t sub_213BFA16C()
{
  sub_213C127A4();
  sub_213C127B0();
  return sub_213C129FC();
}

uint64_t (*sub_213BFA1B8())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_213BFA1F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  *(_OWORD *)(v2 + 16) = 0u;
  *(_OWORD *)(v2 + 32) = 0u;
  v5 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v2 + 48) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v2 + 72) = dispatch_semaphore_create(1);
  *(_QWORD *)(v2 + 80) = v5;
  *(_QWORD *)(v2 + 88) = 0;
  *(_BYTE *)(v2 + 96) = 0;
  *(_QWORD *)(v2 + 104) = 0;
  *(_QWORD *)(v2 + 112) = 0;
  *(_QWORD *)(v2 + 56) = a1;
  *(_QWORD *)(v2 + 64) = 0;
  *(_QWORD *)(v2 + 120) = a2;
  return v2;
}

uint64_t sub_213BFA254(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  dispatch_semaphore_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v13 = a1;
  v12 = sub_213C12774();
  v2 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_213C12768();
  v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v5);
  v7 = sub_213C125AC();
  MEMORY[0x24BDAC7A8](v7);
  *(_OWORD *)(v1 + 16) = 0u;
  *(_OWORD *)(v1 + 32) = 0u;
  v8 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v1 + 48) = MEMORY[0x24BEE4AF8];
  v9 = dispatch_semaphore_create(1);
  *(_QWORD *)(v1 + 64) = 0;
  *(_QWORD *)(v1 + 72) = v9;
  *(_QWORD *)(v1 + 80) = v8;
  *(_QWORD *)(v1 + 88) = 0;
  *(_BYTE *)(v1 + 96) = 0;
  sub_213BF1DCC(0, &qword_254D27FE0);
  *(_QWORD *)(v1 + 104) = 0;
  *(_QWORD *)(v1 + 112) = 0;
  sub_213C125A0();
  v14 = v8;
  sub_213BDBB94((unint64_t *)&qword_254D29950, v6, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D286C0);
  sub_213BFC4CC((unint64_t *)&qword_254D29960, &qword_254D286C0);
  sub_213C1281C();
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BEE5750], v12);
  *(_QWORD *)(v1 + 56) = sub_213C12798();
  *(_QWORD *)(v1 + 120) = v13;
  return v1;
}

void sub_213BFA454(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  _QWORD v18[3];
  _QWORD aBlock[6];

  v2 = v1;
  v4 = sub_213C12594();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_213C125AC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v12 = *(_QWORD *)(v1 + 64);
  v13 = *(id *)(v1 + 72);
  sub_213C127A4();
  sub_213C127B0();

  if (v12 <= 0)
  {
    v18[1] = *(_QWORD *)(v2 + 56);
    v14 = swift_allocObject();
    swift_weakInit();
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = v14;
    *(_QWORD *)(v15 + 24) = a1;
    aBlock[4] = sub_213BFC4C4;
    aBlock[5] = v15;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_213BEEE78;
    aBlock[3] = &block_descriptor_22;
    v16 = _Block_copy(aBlock);
    swift_retain();
    v17 = a1;
    sub_213C125A0();
    v18[2] = MEMORY[0x24BEE4AF8];
    sub_213BDBB94((unint64_t *)&qword_254D27FE8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D27FF0);
    v18[0] = v8;
    sub_213BFC4CC((unint64_t *)&qword_254D27FF8, &qword_254D27FF0);
    sub_213C1281C();
    MEMORY[0x2199BE88C](0, v11, v7, v16);
    _Block_release(v16);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(char *, _QWORD))(v9 + 8))(v11, v18[0]);
    swift_release();
    swift_release();
  }
}

uint64_t sub_213BFA6A8(uint64_t a1, char *a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  id v6;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v4 = result;
    swift_beginAccess();
    v5 = *(_QWORD *)(v4 + 64);
    v6 = *(id *)(v4 + 72);
    sub_213C127A4();
    sub_213C127B0();

    if (v5 <= 0 && ((*(uint64_t (**)(char *))(*(_QWORD *)v4 + 384))(a2) & 1) != 0)
      sub_213BFA75C(a2);
    return swift_release();
  }
  return result;
}

void sub_213BFA75C(char *a1)
{
  _BYTE *v1;
  _BYTE *v2;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t (*v7)(char *, uint64_t (*)(uint64_t, void *), uint64_t);
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  id v24;
  _QWORD *v25;
  unint64_t v26;
  unint64_t v27;
  char *v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  unsigned int v36;
  id v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  unint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  BOOL v56;
  uint64_t v57;
  id v58;
  void *v59;
  id v60;
  uint64_t v61;
  id v62;
  void *v63;
  _QWORD v64[2];
  char *v65;
  _BYTE *v66;
  uint64_t v67;
  uint64_t v68;
  __int128 v69;
  char *v70;
  id v71;
  _QWORD *v72;
  unint64_t v73;
  _QWORD v74[3];
  uint64_t v75;
  uint64_t v76;
  id v77[10];

  v2 = v1;
  v77[8] = *(id *)MEMORY[0x24BDAC8D0];
  v68 = sub_213C12588();
  v67 = *(_QWORD *)(v68 - 8);
  MEMORY[0x24BDAC7A8](v68);
  v5 = (char *)v64 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v1[96] = 1;
  v6 = swift_allocObject();
  swift_weakInit();
  v7 = *(uint64_t (**)(char *, uint64_t (*)(uint64_t, void *), uint64_t))(*(_QWORD *)v1 + 400);
  swift_retain();
  v8 = v7(a1, sub_213BFC3D0, v6);
  swift_release_n();
  *((_QWORD *)v2 + 10) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(*((_QWORD *)v2 + 10) + 16);
  v66 = v2 + 64;
  swift_beginAccess();
  v10 = (void *)*((_QWORD *)v2 + 9);
  sub_213C127A4();
  *((_QWORD *)v2 + 8) = v9;
  v11 = v10;
  sub_213C127B0();
  swift_endAccess();

  v70 = a1;
  v69 = *(_OWORD *)&a1[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_time];
  v12 = *(_QWORD *)&a1[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_time + 16];
  v13 = MEMORY[0x24BEE4AF8];
  v14 = sub_213C0599C(MEMORY[0x24BEE4AF8]);
  swift_beginAccess();
  *((_OWORD *)v2 + 1) = v69;
  *((_QWORD *)v2 + 4) = v12;
  *((_QWORD *)v2 + 5) = v14;
  swift_bridgeObjectRelease();
  v72 = (_QWORD *)v13;
  v73 = v13;
  v15 = *((_QWORD *)v2 + 10);
  v16 = *(_QWORD *)(v15 + 16);
  if (v16)
  {
    v65 = v5;
    *(_QWORD *)&v69 = v2;
    v17 = v15 + 32;
    v64[1] = v15;
    swift_bridgeObjectRetain();
    do
    {
      sub_213BE2DA4(v17, (uint64_t)v77);
      sub_213BE2DA4((uint64_t)v77, (uint64_t)v74);
      __swift_instantiateConcreteTypeFromMangledName(&qword_254D27E90);
      sub_213BF1DCC(0, &qword_254D28D80);
      if (swift_dynamicCast())
      {
        v24 = v71;
        MEMORY[0x2199BE778]();
        if (*(_QWORD *)((v73 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v73 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_213C126B4();
        sub_213C126CC();
        sub_213C126A8();

      }
      else
      {
        sub_213BE2DA4((uint64_t)v77, (uint64_t)v74);
        v25 = v72;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          v25 = sub_213BEAC84(0, v25[2] + 1, 1, v25);
          v72 = v25;
        }
        v27 = v25[2];
        v26 = v25[3];
        if (v27 >= v26 >> 1)
          v72 = sub_213BEAC84((_QWORD *)(v26 > 1), v27 + 1, 1, v25);
        v18 = v75;
        v19 = v76;
        v20 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v74, v75);
        MEMORY[0x24BDAC7A8](v20);
        v22 = (char *)v64 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v23 + 16))(v22);
        sub_213BFC318(v27, (uint64_t)v22, (uint64_t *)&v72, v18, v19);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v74);
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v77);
      v17 += 40;
      --v16;
    }
    while (v16);
    swift_bridgeObjectRelease();
    v13 = (uint64_t)v72;
    v2 = (_BYTE *)v69;
    v5 = v65;
  }
  v28 = v70;
  sub_213BFB2B8(v13, v70);
  swift_bridgeObjectRelease();
  v29 = *(void **)&v28[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_buffer];
  v30 = *(unsigned int *)&v28[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_orientation];
  v31 = v29;
  sub_213C05AB4(MEMORY[0x24BEE4AF8]);
  v32 = objc_allocWithZone(MEMORY[0x24BDF9C28]);
  type metadata accessor for VNImageOption(0);
  sub_213BDBB94(&qword_254D27A90, (uint64_t (*)(uint64_t))type metadata accessor for VNImageOption, (uint64_t)&unk_213C1479C);
  v33 = (void *)sub_213C125C4();
  swift_bridgeObjectRelease();
  v34 = objc_msgSend(v32, sel_initWithCVPixelBuffer_orientation_options_, v31, v30, v33);

  sub_213BF1DCC(0, &qword_254D28D80);
  swift_bridgeObjectRetain();
  v35 = (void *)sub_213C12684();
  swift_bridgeObjectRelease();
  v77[0] = 0;
  v36 = objc_msgSend(v34, sel_performRequests_error_, v35, v77);

  if (v36)
  {
    v37 = v77[0];

    swift_bridgeObjectRelease();
  }
  else
  {
    v38 = v77[0];
    v39 = (void *)sub_213C1248C();

    swift_willThrow();
    if (qword_254D27930 != -1)
      swift_once();
    v40 = v68;
    v41 = __swift_project_value_buffer(v68, (uint64_t)qword_254D27938);
    v42 = v67;
    (*(void (**)(char *, uint64_t, uint64_t))(v67 + 16))(v5, v41, v40);
    v43 = v39;
    v44 = v39;
    v45 = sub_213C12570();
    v46 = sub_213C1275C();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = (uint8_t *)swift_slowAlloc();
      v48 = (void *)swift_slowAlloc();
      *(_QWORD *)&v69 = v2;
      v49 = v48;
      v77[0] = v48;
      *(_DWORD *)v47 = 136315138;
      swift_getErrorValue();
      v50 = sub_213C12A44();
      v74[0] = sub_213BEB0C8(v50, v51, (uint64_t *)v77);
      sub_213C127F8();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_213BCD000, v45, v46, "Error dispatching Vision requests: %s", v47, 0xCu);
      swift_arrayDestroy();
      v52 = v49;
      v2 = (_BYTE *)v69;
      MEMORY[0x2199BF4BC](v52, -1, -1);
      MEMORY[0x2199BF4BC](v47, -1, -1);

      (*(void (**)(char *, uint64_t))(v67 + 8))(v5, v68);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v42 + 8))(v5, v40);
    }
    if (v73 >> 62)
    {
      swift_bridgeObjectRetain();
      v53 = sub_213C12918();
      swift_bridgeObjectRelease();
    }
    else
    {
      v53 = *(_QWORD *)((v73 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v54 = (void *)*((_QWORD *)v2 + 9);
    sub_213C127A4();
    v55 = *((_QWORD *)v2 + 8);
    v56 = __OFSUB__(v55, v53);
    v57 = v55 - v53;
    if (v56)
      __break(1u);
    *((_QWORD *)v2 + 8) = v57;
    v58 = v54;
    sub_213C127B0();
    swift_endAccess();

    v59 = (void *)*((_QWORD *)v2 + 11);
    *((_QWORD *)v2 + 11) = v39;
    v60 = v39;

    v61 = *((_QWORD *)v2 + 8);
    v62 = *((id *)v2 + 9);
    sub_213C127A4();
    sub_213C127B0();

    if (v61 <= 0)
    {
      (*(void (**)(void *))(*(_QWORD *)v2 + 440))(v39);

      v63 = (void *)*((_QWORD *)v2 + 11);
      *((_QWORD *)v2 + 11) = 0;
    }
    else
    {

      v63 = v39;
    }

  }
}

uint64_t sub_213BFAF9C(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t result;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD aBlock[6];
  __int128 v22[2];

  v4 = sub_213C12594();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_213C125AC();
  v8 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v12 = *(id *)(result + 56);
    swift_release();
    v13 = swift_allocObject();
    v18 = v5;
    swift_beginAccess();
    swift_weakLoadStrong();
    swift_weakInit();
    swift_release();
    sub_213BE2DA4(a1, (uint64_t)v22);
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = v13;
    sub_213BFC43C(v22, v14 + 24);
    *(_QWORD *)(v14 + 64) = a2;
    aBlock[4] = sub_213BFC488;
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_213BEEE78;
    aBlock[3] = &block_descriptor_15;
    v15 = _Block_copy(aBlock);
    swift_retain();
    v16 = a2;
    sub_213C125A0();
    v20 = MEMORY[0x24BEE4AF8];
    sub_213BDBB94((unint64_t *)&qword_254D27FE8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D27FF0);
    sub_213BFC4CC((unint64_t *)&qword_254D27FF8, &qword_254D27FF0);
    sub_213C1281C();
    MEMORY[0x2199BE88C](0, v10, v7, v15);
    _Block_release(v15);

    (*(void (**)(char *, uint64_t))(v18 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v19);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_213BFB248(uint64_t a1, _QWORD *a2, void *a3)
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_213BFB650(a2, a3);
    return swift_release();
  }
  return result;
}

uint64_t sub_213BFB2B8(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  id v17;
  _QWORD v19[2];
  uint64_t v20;
  uint64_t v21;
  _QWORD aBlock[6];

  v3 = v2;
  v6 = sub_213C12594();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v20 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_213C125AC();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[1] = *(_QWORD *)(v3 + 56);
  v14 = swift_allocObject();
  swift_weakInit();
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = a1;
  v15[3] = a2;
  v15[4] = v14;
  aBlock[4] = sub_213BFC3C4;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_213BEEE78;
  aBlock[3] = &block_descriptor_7;
  v16 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  v17 = a2;
  swift_retain();
  sub_213C125A0();
  v21 = MEMORY[0x24BEE4AF8];
  sub_213BDBB94((unint64_t *)&qword_254D27FE8, v7, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D27FF0);
  sub_213BFC4CC((unint64_t *)&qword_254D27FF8, &qword_254D27FF0);
  sub_213C1281C();
  MEMORY[0x2199BE88C](0, v13, v9, v16);
  _Block_release(v16);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  swift_release();
  return swift_release();
}

uint64_t sub_213BFB4EC(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[3];
  uint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)(result + 16);
  if (v2)
  {
    v4 = result + 32;
    swift_bridgeObjectRetain();
    swift_beginAccess();
    swift_beginAccess();
    do
    {
      sub_213BE2DA4(v4, (uint64_t)v7);
      v5 = v8;
      v6 = v9;
      __swift_project_boxed_opaque_existential_1(v7, v8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(a2, v5, v6);
      if (swift_weakLoadStrong())
      {
        sub_213BFB650(v7, 0);
        swift_release();
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
      v4 += 40;
      --v2;
    }
    while (v2);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_213BFB63C()
{
  return 1;
}

uint64_t sub_213BFB644()
{
  return MEMORY[0x24BEE4AF8];
}

void sub_213BFB650(_QWORD *a1, void *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t (*v52)();
  uint64_t v53;
  uint64_t v54;
  uint64_t DynamicType;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  char v66;
  unint64_t v67;
  unint64_t v68;
  _QWORD *v69;
  uint64_t v70;
  uint64_t v71;
  void (*v72)(uint64_t);
  uint64_t v73;
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD *v78;
  _QWORD *v79;
  _QWORD v80[5];
  uint64_t v81;
  _BYTE v82[40];
  uint64_t v83[4];

  v3 = v2;
  v6 = sub_213C12588();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v79 = (uint64_t *)((char *)&v75 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v75 - v10;
  v12 = v2 + 8;
  swift_beginAccess();
  v13 = (void *)v2[9];
  sub_213C127A4();
  v14 = v3[8];
  v15 = __OFSUB__(v14, 1);
  v16 = v14 - 1;
  if (v15)
  {
    __break(1u);
LABEL_38:
    swift_once();
    goto LABEL_4;
  }
  *v12 = v16;
  v17 = v13;
  sub_213C127B0();
  swift_endAccess();

  if (!a2)
    goto LABEL_8;
  v18 = a2;
  if (qword_254D27930 != -1)
    goto LABEL_38;
LABEL_4:
  v19 = __swift_project_value_buffer(v6, (uint64_t)qword_254D27938);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v11, v19, v6);
  sub_213BE2DA4((uint64_t)a1, (uint64_t)v82);
  v20 = a2;
  v21 = a2;
  v22 = sub_213C12570();
  v23 = sub_213C1275C();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = swift_slowAlloc();
    v78 = a1;
    v25 = v24;
    v26 = swift_slowAlloc();
    v83[0] = v26;
    *(_DWORD *)v25 = 136315394;
    v77 = v6;
    sub_213BE2DA4((uint64_t)v82, (uint64_t)v80);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D27E90);
    v27 = sub_213C12630();
    v76 = v7;
    v80[0] = sub_213BEB0C8(v27, v28, v83);
    sub_213C127F8();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v82);
    *(_WORD *)(v25 + 12) = 2080;
    swift_getErrorValue();
    v29 = sub_213C12A44();
    v80[0] = sub_213BEB0C8(v29, v30, v83);
    v6 = v77;
    v7 = v76;
    sub_213C127F8();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_213BCD000, v22, v23, "Request %s failed with error: %s", (uint8_t *)v25, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2199BF4BC](v26, -1, -1);
    v31 = v25;
    a1 = v78;
    MEMORY[0x2199BF4BC](v31, -1, -1);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v82);

  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v11, v6);
  v32 = (void *)v3[11];
  v3[11] = a2;

LABEL_8:
  v33 = (void *)v3[11];
  if (v33)
  {
    v35 = v3[8];
    v34 = (void *)v3[9];
    v36 = v33;
    v37 = v34;
    sub_213C127A4();
    sub_213C127B0();

    if (v35 <= 0)
    {
      (*(void (**)(void *))(*v3 + 440))(v33);

      v38 = (void *)v3[11];
      v3[11] = 0;
    }
    else
    {
      v38 = v33;
    }

  }
  else
  {
    swift_beginAccess();
    if (v3[5])
    {
      v39 = (*(uint64_t (**)(_QWORD *))(*v3 + 416))(a1);
      v40 = v39;
      if (!v39 || !*(_QWORD *)(v39 + 16))
      {
        if (qword_254D27930 != -1)
          swift_once();
        v41 = __swift_project_value_buffer(v6, (uint64_t)qword_254D27938);
        v42 = v79;
        (*(void (**)(_QWORD *, uint64_t, uint64_t))(v7 + 16))(v79, v41, v6);
        sub_213BE2DA4((uint64_t)a1, (uint64_t)v82);
        v43 = sub_213C12570();
        v44 = sub_213C1275C();
        if (os_log_type_enabled(v43, v44))
        {
          v76 = v7;
          v45 = (uint8_t *)swift_slowAlloc();
          v46 = swift_slowAlloc();
          v78 = a1;
          v47 = v46;
          v81 = v46;
          v77 = v6;
          *(_DWORD *)v45 = 136315138;
          sub_213BE2DA4((uint64_t)v82, (uint64_t)v80);
          __swift_instantiateConcreteTypeFromMangledName(&qword_254D27E90);
          v48 = sub_213C12630();
          v80[0] = sub_213BEB0C8(v48, v49, &v81);
          sub_213C127F8();
          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v82);
          _os_log_impl(&dword_213BCD000, v43, v44, "Request %s did not obtain any observations.", v45, 0xCu);
          swift_arrayDestroy();
          v50 = v47;
          a1 = v78;
          MEMORY[0x2199BF4BC](v50, -1, -1);
          MEMORY[0x2199BF4BC](v45, -1, -1);

          (*(void (**)(_QWORD *, uint64_t))(v76 + 8))(v79, v77);
        }
        else
        {
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v82);

          (*(void (**)(_QWORD *, uint64_t))(v7 + 8))(v42, v6);
        }
      }
      v52 = sub_213BFA1B8();
      if (*(_QWORD *)(v51 + 24))
      {
        v53 = v51;
        if (v40)
          v54 = v40;
        else
          v54 = MEMORY[0x24BEE4AF8];
        __swift_project_boxed_opaque_existential_1(a1, a1[3]);
        DynamicType = swift_getDynamicType();
        v56 = a1[4];
        v80[0] = DynamicType;
        v80[1] = v56;
        __swift_instantiateConcreteTypeFromMangledName(&qword_254D286B8);
        v57 = sub_213C12630();
        v59 = v58;
        swift_bridgeObjectRetain();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v80[0] = *(_QWORD *)(v53 + 24);
        *(_QWORD *)(v53 + 24) = 0x8000000000000000;
        sub_213C0695C(v54, v57, v59, isUniquelyReferenced_nonNull_native);
        *(_QWORD *)(v53 + 24) = v80[0];
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      ((void (*)(_BYTE *, _QWORD))v52)(v82, 0);
      v61 = v3[5];
      if (v61 && *(_QWORD *)(v61 + 16) == *(_QWORD *)(v3[10] + 16))
      {
        v63 = v3[2];
        v62 = v3[3];
        v64 = v3[4];
        swift_beginAccess();
        v65 = (_QWORD *)v3[6];
        swift_bridgeObjectRetain_n();
        v66 = swift_isUniquelyReferenced_nonNull_native();
        v3[6] = v65;
        v79 = v3 + 6;
        if ((v66 & 1) == 0)
        {
          v65 = sub_213BEAFBC(0, v65[2] + 1, 1, v65);
          v3[6] = v65;
        }
        v68 = v65[2];
        v67 = v65[3];
        if (v68 >= v67 >> 1)
        {
          v65 = sub_213BEAFBC((_QWORD *)(v67 > 1), v68 + 1, 1, v65);
          *v79 = v65;
        }
        v65[2] = v68 + 1;
        v69 = &v65[4 * v68];
        v69[4] = v63;
        v69[5] = v62;
        v69[6] = v64;
        v69[7] = v61;
        swift_endAccess();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*v3 + 424))(v63, v62, v64, v61);
        swift_bridgeObjectRelease();
        *((_OWORD *)v3 + 1) = 0u;
        *((_OWORD *)v3 + 2) = 0u;
        v70 = swift_bridgeObjectRelease();
        v71 = *(_QWORD *)(v3[6] + 16);
        if (v71 >= (*(uint64_t (**)(uint64_t))(*v3 + 392))(v70))
        {
          v72 = *(void (**)(uint64_t))(*v3 + 432);
          v73 = swift_bridgeObjectRetain();
          v72(v73);
          swift_bridgeObjectRelease();
          if (*(_QWORD *)(v3[6] + 16))
          {
            v74 = v79;
            swift_beginAccess();
            if (*(_QWORD *)(*v74 + 16))
            {
              swift_bridgeObjectRetain();
              sub_213C0F6F8(0, 1);
              swift_endAccess();
              swift_bridgeObjectRelease();
            }
            else
            {
              __break(1u);
            }
          }
        }
      }
    }
  }
}

uint64_t sub_213BFBE80(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = a1[3];
  v2 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2);
}

uint64_t sub_213BFBEC0()
{
  uint64_t v0;
  void (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(void (**)(uint64_t))(v0 + 104);
  *(_BYTE *)(v0 + 96) = 0;
  if (v1)
  {
    v2 = swift_retain();
    v1(v2);
    sub_213BF1358((uint64_t)v1);
    v3 = *(_QWORD *)(v0 + 104);
  }
  else
  {
    v3 = 0;
  }
  *(_QWORD *)(v0 + 104) = 0;
  *(_QWORD *)(v0 + 112) = 0;
  return sub_213BF1358(v3);
}

uint64_t sub_213BFBF24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[2];
  uint64_t v14;
  uint64_t v15;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_213C12594();
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v14 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_213C125AC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13[1] = *(_QWORD *)(v1 + 56);
  v10 = swift_allocObject();
  swift_weakInit();
  aBlock[4] = sub_213BFC2F8;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_213BEEE78;
  aBlock[3] = &block_descriptor_2;
  v11 = _Block_copy(aBlock);
  swift_retain();
  sub_213C125A0();
  v15 = MEMORY[0x24BEE4AF8];
  sub_213BDBB94((unint64_t *)&qword_254D27FE8, v3, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D27FF0);
  sub_213BFC4CC((unint64_t *)&qword_254D27FF8, &qword_254D27FF0);
  sub_213C1281C();
  MEMORY[0x2199BE88C](0, v9, v5, v11);
  _Block_release(v11);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v5, v2);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  swift_release();
  return swift_release();
}

uint64_t sub_213BFC128()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_213BFC17C();
    return swift_release();
  }
  return result;
}

void sub_213BFC17C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)();
  uint64_t v4;
  void *v5;
  id v6;
  _BYTE v7[32];

  v1 = v0;
  v3 = sub_213BFA1B8();
  if (*(_QWORD *)(v2 + 24))
  {
    v4 = v2;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v4 + 24) = MEMORY[0x24BEE4B00];
  }
  ((void (*)(_BYTE *, _QWORD))v3)(v7, 0);
  swift_beginAccess();
  *(_QWORD *)(v1 + 48) = MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v5 = *(void **)(v1 + 72);
  sub_213C127A4();
  *(_QWORD *)(v1 + 64) = 0;
  v6 = v5;
  sub_213C127B0();
  swift_endAccess();

  *(_BYTE *)(v1 + 96) = 0;
}

uint64_t sub_213BFC240()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_213BF1358(*(_QWORD *)(v0 + 104));
  swift_release();
  return v0;
}

uint64_t sub_213BFC294()
{
  sub_213BFC240();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PADSerialRequestsScheduler()
{
  return objc_opt_self();
}

uint64_t sub_213BFC2D4()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_213BFC2F8()
{
  return sub_213BFC128();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_213BFC318(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t v10;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v13 = a4;
  v14 = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 32))(boxed_opaque_existential_1, a2, a4);
  v10 = *a3;
  *(_QWORD *)(v10 + 16) = a1 + 1;
  return sub_213BFC43C(&v12, v10 + 40 * a1 + 32);
}

uint64_t sub_213BFC390()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_213BFC3C4()
{
  uint64_t v0;

  return sub_213BFB4EC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_213BFC3D0(uint64_t a1, void *a2)
{
  return sub_213BFAF9C(a1, a2);
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_213BFC43C(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_213BFC454()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);

  return swift_deallocObject();
}

uint64_t sub_213BFC488()
{
  uint64_t v0;

  return sub_213BFB248(*(_QWORD *)(v0 + 16), (_QWORD *)(v0 + 24), *(void **)(v0 + 64));
}

uint64_t sub_213BFC498()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_213BFC4C4()
{
  uint64_t v0;

  return sub_213BFA6A8(*(_QWORD *)(v0 + 16), *(char **)(v0 + 24));
}

uint64_t sub_213BFC4CC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2199BF420](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

void sub_213BFC528()
{
  qword_254D2CD10 = 0x726F727245444150;
  *(_QWORD *)algn_254D2CD18 = 0xE800000000000000;
}

uint64_t PADSWErrorCode.init(rawValue:)(uint64_t a1)
{
  return sub_213BFC664(a1);
}

BOOL sub_213BFC568(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_213BFC57C()
{
  sub_213C12A50();
  sub_213C12A5C();
  return sub_213C12A68();
}

uint64_t sub_213BFC5C0()
{
  return sub_213C12A5C();
}

uint64_t sub_213BFC5E8()
{
  sub_213C12A50();
  sub_213C12A5C();
  return sub_213C12A68();
}

uint64_t sub_213BFC628@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;

  result = sub_213BFC664(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_213BFC658(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_213BFC664(uint64_t result)
{
  if ((unint64_t)(result + 10) >= 0xB)
    return 0;
  return result;
}

unint64_t sub_213BFC680()
{
  unint64_t result;

  result = qword_254D286C8;
  if (!qword_254D286C8)
  {
    result = MEMORY[0x2199BF420](&protocol conformance descriptor for PADSWErrorCode, &type metadata for PADSWErrorCode);
    atomic_store(result, (unint64_t *)&qword_254D286C8);
  }
  return result;
}

ValueMetadata *type metadata accessor for PADSWErrorCode()
{
  return &type metadata for PADSWErrorCode;
}

id sub_213BFC6D4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, char a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char isUniquelyReferenced_nonNull_native;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  char v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  char v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  _OWORD v34[2];
  __int128 v35;
  unint64_t v36;

  sub_213C0584C(MEMORY[0x24BEE4AF8]);
  v10 = sub_213C1260C();
  v12 = v11;
  v36 = MEMORY[0x24BEE0D00];
  *(_QWORD *)&v35 = a1;
  *((_QWORD *)&v35 + 1) = a2;
  sub_213BF1CC8(&v35, v34);
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_213C0682C(v34, v10, v12, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (a3)
  {
    v14 = a3;
    v15 = (void *)sub_213C12480();
    v16 = objc_msgSend(v15, sel_domain);
    v17 = sub_213C1260C();
    v19 = v18;

    if (qword_254D27960 != -1)
      swift_once();
    if (v17 == qword_254D2CD10 && v19 == *(_QWORD *)algn_254D2CD18)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v20 = sub_213C12A14();
      swift_bridgeObjectRelease();
      if ((v20 & 1) == 0)
      {
        v24 = sub_213C1260C();
        v26 = v25;
        v36 = sub_213BFCA14();
        *(_QWORD *)&v35 = v15;
        sub_213BF1CC8(&v35, v34);
        v27 = v15;
        v28 = swift_isUniquelyReferenced_nonNull_native();
        sub_213C0682C(v34, v24, v26, v28);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        goto LABEL_13;
      }
    }
    swift_bridgeObjectRelease();
    if ((a5 & 1) == 0)
    {
      v21 = sub_213BFC664((uint64_t)objc_msgSend(v15, sel_code));
      if ((v22 & 1) == 0)
        a4 = v21;
    }
    v23 = objc_msgSend(v15, sel_userInfo);
    sub_213C125DC();

  }
LABEL_13:
  if (qword_254D27960 != -1)
    swift_once();
  v29 = objc_allocWithZone(MEMORY[0x24BDD1540]);
  swift_bridgeObjectRetain();
  v30 = (void *)sub_213C125E8();
  swift_bridgeObjectRelease();
  v31 = (void *)sub_213C125C4();
  swift_bridgeObjectRelease();
  v32 = objc_msgSend(v29, sel_initWithDomain_code_userInfo_, v30, a4, v31);

  return v32;
}

unint64_t sub_213BFCA14()
{
  unint64_t result;

  result = qword_254D286D0;
  if (!qword_254D286D0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254D286D0);
  }
  return result;
}

unint64_t PADSWGesture.init(rawValue:)(unint64_t a1)
{
  return sub_213BFCFD0(a1);
}

unint64_t PADSWAssessmentLabel.init(rawValue:)(unint64_t result)
{
  if (result > 2)
    return 0;
  return result;
}

unint64_t PADSWGestureAssessment.init(rawValue:)(unint64_t a1)
{
  return sub_213BFD000(a1);
}

uint64_t static PADSWGesture.count.getter()
{
  return 9;
}

void *static PADSWGesture.allCases.getter()
{
  return &unk_24D0CF4A8;
}

uint64_t PADSWGesture.description.getter(unint64_t a1)
{
  uint64_t result;

  if (a1 < 0xB && ((0x73Fu >> a1) & 1) != 0)
    return *(_QWORD *)&aTurnrighturnle[8 * a1];
  result = sub_213C12A20();
  __break(1u);
  return result;
}

uint64_t PADSWGesture.type.getter(unint64_t a1)
{
  if (a1 > 9)
    return 3;
  else
    return qword_213C15638[a1];
}

unint64_t sub_213BFCB48@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_213BFCFD0(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_213BFCB78(_QWORD *a1@<X8>)
{
  *a1 = &unk_24D0CF4A8;
}

uint64_t sub_213BFCB88()
{
  unint64_t *v0;

  return PADSWGesture.description.getter(*v0);
}

uint64_t sub_213BFCB90()
{
  sub_213BFD258();
  return sub_213C1266C();
}

uint64_t sub_213BFCBEC()
{
  sub_213BFD258();
  return sub_213C12660();
}

unint64_t PADSWGestureType.init(rawValue:)(unint64_t result)
{
  if (result > 3 || result == 1)
    return 0;
  return result;
}

uint64_t *sub_213BFCC54@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  BOOL v3;
  char v4;

  v2 = *result;
  v3 = (unint64_t)*result > 3 || v2 == 1;
  if (v3)
    v2 = 0;
  v4 = v3;
  *(_QWORD *)a2 = v2;
  *(_BYTE *)(a2 + 8) = v4;
  return result;
}

uint64_t PADSWGestureAssessment.description.getter(uint64_t a1)
{
  uint64_t result;

  result = 0xD000000000000011;
  switch(a1)
  {
    case 0:
      result = 0x64657070696B73;
      break;
    case 1:
      result = 0x6465746365746564;
      break;
    case 2:
      result = 0x6573657250746F6ELL;
      break;
    case 3:
      result = 0x6365746544746F6ELL;
      break;
    case 4:
      return result;
    default:
      result = sub_213C12A20();
      __break(1u);
      break;
  }
  return result;
}

unint64_t sub_213BFCD54@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_213BFD000(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_213BFCD84()
{
  uint64_t *v0;

  return PADSWGestureAssessment.description.getter(*v0);
}

uint64_t sub_213BFCD8C()
{
  sub_213BFD214();
  return sub_213C1266C();
}

uint64_t sub_213BFCDE8()
{
  sub_213BFD214();
  return sub_213C12660();
}

uint64_t *sub_213BFCE34@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  BOOL v3;

  v2 = *result;
  v3 = (unint64_t)*result > 2;
  if ((unint64_t)*result > 2)
    v2 = 0;
  *(_QWORD *)a2 = v2;
  *(_BYTE *)(a2 + 8) = v3;
  return result;
}

uint64_t sub_213BFCE50()
{
  sub_213BFD1D0();
  return sub_213C1266C();
}

uint64_t sub_213BFCEAC()
{
  sub_213BFD1D0();
  return sub_213C12660();
}

uint64_t sub_213BFCEF8()
{
  uint64_t result;

  result = sub_213C125E8();
  qword_254D286D8 = result;
  return result;
}

id static PADSWNotificationName.frameUnretained.getter()
{
  return sub_213BFCF98(&qword_254D27968, (id *)&qword_254D286D8);
}

uint64_t sub_213BFCF48()
{
  uint64_t result;

  result = sub_213C125E8();
  qword_254D286E0 = result;
  return result;
}

id static PADSWNotificationName.stitchDetected.getter()
{
  return sub_213BFCF98(&qword_254D27970, (id *)&qword_254D286E0);
}

id sub_213BFCF98(_QWORD *a1, id *a2)
{
  if (*a1 != -1)
    swift_once();
  return *a2;
}

unint64_t sub_213BFCFD0(unint64_t result)
{
  if (result > 0xA || ((1 << result) & 0x73F) == 0)
    return 0;
  return result;
}

unint64_t sub_213BFD000(unint64_t result)
{
  if (result > 4)
    return 0;
  return result;
}

unint64_t sub_213BFD014()
{
  unint64_t result;

  result = qword_254D286E8;
  if (!qword_254D286E8)
  {
    result = MEMORY[0x2199BF420](&protocol conformance descriptor for PADSWGesture, &type metadata for PADSWGesture);
    atomic_store(result, (unint64_t *)&qword_254D286E8);
  }
  return result;
}

unint64_t sub_213BFD05C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254D286F0;
  if (!qword_254D286F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D27B20);
    result = MEMORY[0x2199BF420](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_254D286F0);
  }
  return result;
}

unint64_t sub_213BFD0AC()
{
  unint64_t result;

  result = qword_254D286F8;
  if (!qword_254D286F8)
  {
    result = MEMORY[0x2199BF420](&protocol conformance descriptor for PADSWGestureType, &type metadata for PADSWGestureType);
    atomic_store(result, (unint64_t *)&qword_254D286F8);
  }
  return result;
}

unint64_t sub_213BFD0F4()
{
  unint64_t result;

  result = qword_254D28700;
  if (!qword_254D28700)
  {
    result = MEMORY[0x2199BF420](&protocol conformance descriptor for PADSWGestureAssessment, &type metadata for PADSWGestureAssessment);
    atomic_store(result, (unint64_t *)&qword_254D28700);
  }
  return result;
}

unint64_t sub_213BFD13C()
{
  unint64_t result;

  result = qword_254D28708;
  if (!qword_254D28708)
  {
    result = MEMORY[0x2199BF420](&protocol conformance descriptor for PADSWAssessmentLabel, &type metadata for PADSWAssessmentLabel);
    atomic_store(result, (unint64_t *)&qword_254D28708);
  }
  return result;
}

ValueMetadata *type metadata accessor for PADSWGesture()
{
  return &type metadata for PADSWGesture;
}

ValueMetadata *type metadata accessor for PADSWGestureType()
{
  return &type metadata for PADSWGestureType;
}

ValueMetadata *type metadata accessor for PADSWGestureAssessment()
{
  return &type metadata for PADSWGestureAssessment;
}

ValueMetadata *type metadata accessor for PADSWAssessmentLabel()
{
  return &type metadata for PADSWAssessmentLabel;
}

ValueMetadata *type metadata accessor for PADSWNotificationName()
{
  return &type metadata for PADSWNotificationName;
}

unint64_t sub_213BFD1D0()
{
  unint64_t result;

  result = qword_254D28710;
  if (!qword_254D28710)
  {
    result = MEMORY[0x2199BF420](&protocol conformance descriptor for PADSWAssessmentLabel, &type metadata for PADSWAssessmentLabel);
    atomic_store(result, (unint64_t *)&qword_254D28710);
  }
  return result;
}

unint64_t sub_213BFD214()
{
  unint64_t result;

  result = qword_254D28718;
  if (!qword_254D28718)
  {
    result = MEMORY[0x2199BF420](&protocol conformance descriptor for PADSWGestureAssessment, &type metadata for PADSWGestureAssessment);
    atomic_store(result, (unint64_t *)&qword_254D28718);
  }
  return result;
}

unint64_t sub_213BFD258()
{
  unint64_t result;

  result = qword_254D28720;
  if (!qword_254D28720)
  {
    result = MEMORY[0x2199BF420](&protocol conformance descriptor for PADSWGesture, &type metadata for PADSWGesture);
    atomic_store(result, (unint64_t *)&qword_254D28720);
  }
  return result;
}

void sub_213BFD2A8(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(id, void *);
  id v6;
  id v7;

  v5 = *(void (**)(id, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(v7, a3);
  swift_release();

}

void sub_213BFD31C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = sub_213C12540();
  MEMORY[0x24BDAC7A8](v3);
  __asm { BR              X10 }
}

_QWORD *sub_213BFD398()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  size_t v6;
  uint64_t v7;

  if (BYTE6(v0))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D27F08);
    v4 = (_QWORD *)swift_allocObject();
    v6 = _swift_stdlib_malloc_size(v4);
    v4[2] = BYTE6(v0);
    v4[3] = 2 * v6 - 64;
    sub_213BECCA4(v2, v0);
    v7 = sub_213C12510();
    sub_213BEBA50(v2, v0);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v1);
    if (v7 != BYTE6(v0))
    {
      __break(1u);
      JUMPOUT(0x213BFD46CLL);
    }
  }
  return v4;
}

id sub_213BFD484(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  id aBlock[7];

  aBlock[6] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = sub_213C12588();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&aBlock[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_allocWithZone(MEMORY[0x24BDF9B38]);
  aBlock[4] = a1;
  aBlock[5] = a2;
  aBlock[0] = (id)MEMORY[0x24BDAC760];
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_213BFD2A8;
  aBlock[3] = &block_descriptor_3;
  v9 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v10 = objc_msgSend(v8, sel_initWithCompletionHandler_, v9);
  _Block_release(v9);
  aBlock[0] = 0;
  if (objc_msgSend(v10, sel_setRevision_error_, 3737841667, aBlock))
  {
    v11 = aBlock[0];
  }
  else
  {
    v12 = aBlock[0];
    v13 = (void *)sub_213C1248C();

    swift_willThrow();
    if (qword_254D27930 != -1)
      swift_once();
    v14 = __swift_project_value_buffer(v4, (uint64_t)qword_254D27938);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v14, v4);
    v15 = sub_213C12570();
    v16 = sub_213C1275C();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_213BCD000, v15, v16, "Unable to set faceprint request revision to 3_1MD3, falling back to revision2", v17, 2u);
      MEMORY[0x2199BF4BC](v17, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return v10;
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

id sub_213BFD6E4(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  id aBlock[7];

  aBlock[6] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = sub_213C12588();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&aBlock[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_allocWithZone(MEMORY[0x24BDF9AF8]);
  aBlock[4] = a1;
  aBlock[5] = a2;
  aBlock[0] = (id)MEMORY[0x24BDAC760];
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_213BFD2A8;
  aBlock[3] = &block_descriptor_3;
  v9 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v10 = objc_msgSend(v8, sel_initWithCompletionHandler_, v9);
  _Block_release(v9);
  aBlock[0] = 0;
  if (objc_msgSend(v10, sel_setRevision_error_, 3737841666, aBlock))
  {
    v11 = aBlock[0];
  }
  else
  {
    v12 = aBlock[0];
    v13 = (void *)sub_213C1248C();

    swift_willThrow();
    if (qword_254D27930 != -1)
      swift_once();
    v14 = __swift_project_value_buffer(v4, (uint64_t)qword_254D27938);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v14, v4);
    v15 = sub_213C12570();
    v16 = sub_213C1275C();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_213BCD000, v15, v16, "SelfieAnalysisController failed to set private faceAttributes revision. Using default revision.", v17, 2u);
      MEMORY[0x2199BF4BC](v17, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return v10;
}

unint64_t sub_213BFD92C(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  char *v19;
  unint64_t result;
  unint64_t v21;
  uint64_t v22;
  unsigned int v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;

  v2 = sub_213C12588();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend(a1, sel_faceprint);
  if (!v6)
    goto LABEL_6;
  v7 = v6;
  if ((uint64_t)objc_msgSend(v6, sel_elementCount) < 1)
  {

LABEL_6:
    if (qword_254D27930 != -1)
      swift_once();
    v15 = __swift_project_value_buffer(v2, (uint64_t)qword_254D27938);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v15, v2);
    v16 = sub_213C12570();
    v17 = sub_213C1275C();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      MEMORY[0x2199BF4BC](v18, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return 0;
  }
  v8 = objc_msgSend(v7, sel_descriptorData);
  if (v8)
  {
    v9 = v8;
    v10 = sub_213C12528();
    v12 = v11;

    sub_213BECCA4(v10, v12);
    sub_213BFD31C(v10, v12);
    v14 = v13;
    sub_213BEBA50(v10, v12);
    sub_213BEBA50(v10, v12);
  }
  else
  {
    v14 = MEMORY[0x24BEE4AF8];
  }
  result = (unint64_t)objc_msgSend(v7, sel_elementCount);
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v21 = result;
    if (!result)
    {
      swift_bridgeObjectRelease();
      v19 = (char *)MEMORY[0x24BEE4AF8];
LABEL_23:

      return (unint64_t)v19;
    }
    if (result - 1 < *(_QWORD *)(v14 + 16))
    {
      v22 = 0;
      v19 = (char *)MEMORY[0x24BEE4AF8];
      do
      {
        v23 = *(unsigned __int8 *)(v14 + v22 + 32);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v19 = sub_213BEA264(0, *((_QWORD *)v19 + 2) + 1, 1, v19);
        v25 = *((_QWORD *)v19 + 2);
        v24 = *((_QWORD *)v19 + 3);
        if (v25 >= v24 >> 1)
          v19 = sub_213BEA264((char *)(v24 > 1), v25 + 1, 1, v19);
        ++v22;
        *((_QWORD *)v19 + 2) = v25 + 1;
        *(float *)&v19[4 * v25 + 32] = (float)v23;
      }
      while (v21 != v22);
      swift_bridgeObjectRelease();
      goto LABEL_23;
    }
  }
  __break(1u);
  return result;
}

uint64_t PADTrajectoryAnalysisMode.description.getter()
{
  char *v0;

  return qword_213C159B8[*v0];
}

CoreIDVPAD::PADTrajectoryAnalysisMode_optional __swiftcall PADTrajectoryAnalysisMode.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 4;
  if ((unint64_t)rawValue < 4)
    v2 = rawValue;
  *v1 = v2;
  return (CoreIDVPAD::PADTrajectoryAnalysisMode_optional)rawValue;
}

uint64_t PADTrajectoryAnalysisMode.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t sub_213BFDC40(char a1)
{
  return *(_QWORD *)&aTimestamstitch[8 * a1];
}

CoreIDVPAD::PADTrajectoryAnalysisMode_optional sub_213BFDC60(Swift::Int *a1)
{
  return PADTrajectoryAnalysisMode.init(rawValue:)(*a1);
}

void sub_213BFDC68(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t sub_213BFDC78()
{
  char *v0;

  return sub_213BFDC40(*v0);
}

uint64_t sub_213BFDC80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_213BFEDA0(a1, a2);
  *a3 = result;
  return result;
}

void sub_213BFDCA4(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_213BFDCB0()
{
  sub_213BFDE50();
  return sub_213C12A8C();
}

uint64_t sub_213BFDCD8()
{
  sub_213BFDE50();
  return sub_213C12A98();
}

uint64_t PADTrajectoryAnalysisAssessment.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;
  char v9;
  char v10;
  char v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D28728);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_213BFDE50();
  sub_213C12A80();
  v11 = 0;
  sub_213C129C0();
  if (!v1)
  {
    v10 = 1;
    sub_213C129B4();
    v9 = 2;
    sub_213C129CC();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_213BFDE50()
{
  unint64_t result;

  result = qword_254D28730;
  if (!qword_254D28730)
  {
    result = MEMORY[0x2199BF420](&unk_213C15964, &type metadata for PADTrajectoryAnalysisAssessment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D28730);
  }
  return result;
}

uint64_t PADTrajectoryAnalysisAssessment.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  int v13;
  int v14;
  uint64_t v15;
  char v16;
  char v17;
  char v18;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D28738);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_213BFDE50();
  sub_213C12A74();
  if (!v2)
  {
    v18 = 0;
    sub_213C12978();
    v10 = v9;
    v17 = 1;
    v12 = sub_213C1296C();
    v16 = 2;
    sub_213C12984();
    v14 = v13;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(_QWORD *)a2 = v10;
    *(_BYTE *)(a2 + 8) = v12 & 1;
    *(_DWORD *)(a2 + 12) = v14;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_213BFE01C()
{
  unint64_t result;

  result = qword_254D28740;
  if (!qword_254D28740)
  {
    result = MEMORY[0x2199BF420](&protocol conformance descriptor for PADTrajectoryAnalysisMode, &type metadata for PADTrajectoryAnalysisMode);
    atomic_store(result, (unint64_t *)&qword_254D28740);
  }
  return result;
}

uint64_t sub_213BFE060@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return PADTrajectoryAnalysisAssessment.init(from:)(a1, a2);
}

uint64_t sub_213BFE074(_QWORD *a1)
{
  return PADTrajectoryAnalysisAssessment.encode(to:)(a1);
}

uint64_t getEnumTagSinglePayload for PADTrajectoryAnalysisMode(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for PADTrajectoryAnalysisMode(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_213BFE164 + 4 * byte_213C15695[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_213BFE198 + 4 * byte_213C15690[v4]))();
}

uint64_t sub_213BFE198(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_213BFE1A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x213BFE1A8);
  return result;
}

uint64_t sub_213BFE1B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x213BFE1BCLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_213BFE1C0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_213BFE1C8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PADTrajectoryAnalysisMode()
{
  return &type metadata for PADTrajectoryAnalysisMode;
}

uint64_t getEnumTagSinglePayload for PADTrajectoryAnalysisAssessment(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 8);
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for PADTrajectoryAnalysisAssessment(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for PADTrajectoryAnalysisAssessment()
{
  return &type metadata for PADTrajectoryAnalysisAssessment;
}

void sub_213BFE288(char *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  char v17;
  id v18;
  char v19;
  float v20;
  float v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  id v31;
  int v32;
  float v33;
  float v34;
  _QWORD *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  NSObject *v42;
  NSObject *v43;
  os_log_type_t v44;
  uint64_t v45;
  CMTimeEpoch v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  _BOOL8 v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD v54[3];
  uint64_t v55;
  uint64_t v56;
  CMTime time;
  uint64_t v58;

  v2 = v1;
  v4 = sub_213C12588();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v54[-1] - v8;
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v54[-1] - v10;
  v12 = *(unsigned __int8 *)(v2 + 185);
  if (v12 != 3)
  {
    *(_BYTE *)(v2 + 184) = 1;
    v17 = v12 == 1;
    v18 = *(id *)&a1[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_buffer];
    v19 = sub_213C03A5C((uint64_t)v18, v17);
    v21 = v20;
    v53 = v5;

    if (MEMORY[0x2199BF54C](v2 + 200))
      swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D29860);
    v22 = swift_allocObject();
    v23 = MEMORY[0x24BEE14E8];
    *(_OWORD *)(v22 + 16) = xmmword_213C14E40;
    v24 = MEMORY[0x24BEE1568];
    *(_QWORD *)(v22 + 56) = v23;
    *(_QWORD *)(v22 + 64) = v24;
    *(float *)(v22 + 32) = v21;
    sub_213C12618();
    v26 = v25;
    time.value = 0;
    *(_QWORD *)&time.timescale = 0xE000000000000000;
    sub_213C1287C();
    swift_bridgeObjectRelease();
    time.value = 0xD000000000000013;
    *(_QWORD *)&time.timescale = 0x8000000213C18350;
    sub_213C12648();
    swift_bridgeObjectRelease();
    sub_213C12648();
    sub_213C12648();
    swift_bridgeObjectRelease();
    sub_213BDB2E8(time.value, *(unint64_t *)&time.timescale);
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v27 = *(void **)(v2 + 136);
    sub_213C127A4();
    v28 = *(_QWORD *)(v2 + 128);
    v29 = __OFADD__(v28, 1);
    v30 = v28 + 1;
    if (v29)
    {
      __break(1u);
LABEL_36:
      swift_once();
LABEL_26:
      v41 = __swift_project_value_buffer(v4, (uint64_t)qword_254D27938);
      (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v11, v41, v4);
      v42 = a1;
      swift_retain();
      v43 = sub_213C12570();
      v44 = sub_213C1275C();
      if (os_log_type_enabled(v43, v44))
      {
        v45 = swift_slowAlloc();
        *(_DWORD *)v45 = 134218496;
        *(double *)&time.value = v21;
        sub_213C127F8();
        *(_WORD *)(v45 + 12) = 2048;
        v46 = *(CMTimeEpoch *)((char *)&v42[2].isa + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_time);
        time.value = *(CMTimeValue *)((char *)v42 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_time);
        *&time.timescale = *((char *)v42 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_time + 8);
        time.epoch = v46;
        time.value = CMTimeGetSeconds(&time);
        sub_213C127F8();

        *(_WORD *)(v45 + 22) = 1024;
        LODWORD(time.value) = *(unsigned __int8 *)(v2 + 185) == 2;
        v26 = v53;
        sub_213C127F8();
        swift_release();
        _os_log_impl(&dword_213BCD000, v43, v44, "Stitch detected, nccSignal: %f, timestamp: %f, shouldIgnore: %{BOOL}d", (uint8_t *)v45, 0x1Cu);
        MEMORY[0x2199BF4BC](v45, -1, -1);
      }
      else
      {

        swift_release();
        v43 = v42;
      }

      (*(void (**)(char *, uint64_t))(v26 + 8))(v11, v4);
      v47 = MEMORY[0x2199BF54C](v2 + 200);
      if (v47)
      {
        v48 = *(unsigned __int8 *)(v2 + 185);
        v49 = v47 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_delegate;
        swift_beginAccess();
        sub_213BDF4D4(v49, (uint64_t)&time);
        if (v58)
        {
          v50 = v48 == 2;
          sub_213BE2DA4((uint64_t)&time, (uint64_t)v54);
          sub_213BFEF30((uint64_t)&time);
          v51 = v55;
          v52 = v56;
          __swift_project_boxed_opaque_existential_1(v54, v55);
          (*(void (**)(NSObject *, _BOOL8, uint64_t, uint64_t))(v52 + 32))(v42, v50, v51, v52);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v54);
        }
        else
        {
          sub_213BFEF30((uint64_t)&time);
        }
        swift_unknownObjectRelease();
      }
LABEL_34:
      *(_BYTE *)(v2 + 184) = 0;
      return;
    }
    *(_QWORD *)(v2 + 128) = v30;
    v31 = v27;
    sub_213C127B0();
    swift_endAccess();

    v32 = *(unsigned __int8 *)(v2 + 185);
    if (*(_BYTE *)(v2 + 185))
    {
      v26 = v53;
      if (v32 == 1)
      {
        v33 = *(float *)(v2 + 180);
        if (v33 < v21)
          v33 = v21;
        *(float *)(v2 + 180) = v33;
      }
      if ((v19 & 1) == 0)
        goto LABEL_34;
    }
    else
    {
      v34 = *(float *)(v2 + 176);
      if (v34 < v21)
        v34 = v21;
      *(float *)(v2 + 176) = v34;
      v26 = v53;
      if ((v19 & 1) == 0)
        goto LABEL_34;
    }
    if (v32 == 2)
    {
      v35 = (_QWORD *)(v2 + 144);
      swift_beginAccess();
      v36 = *(void **)(v2 + 152);
      sub_213C127A4();
      v37 = *(_QWORD *)(v2 + 144);
      v29 = __OFADD__(v37, 1);
      v38 = v37 + 1;
      if (!v29)
        goto LABEL_25;
      __break(1u);
    }
    v35 = (_QWORD *)(v2 + 160);
    swift_beginAccess();
    v36 = *(void **)(v2 + 168);
    sub_213C127A4();
    v39 = *(_QWORD *)(v2 + 160);
    v29 = __OFADD__(v39, 1);
    v38 = v39 + 1;
    if (v29)
    {
      __break(1u);
      return;
    }
LABEL_25:
    *v35 = v38;
    v40 = v36;
    sub_213C127B0();
    swift_endAccess();

    if (qword_254D27930 == -1)
      goto LABEL_26;
    goto LABEL_36;
  }
  if (qword_254D27930 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v4, (uint64_t)qword_254D27938);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v9, v13, v4);
  v14 = sub_213C12570();
  v15 = sub_213C12750();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_213BCD000, v14, v15, "Trajectory Analysis Controller mode sent to skip. Frame will not be processed by TA.", v16, 2u);
    MEMORY[0x2199BF4BC](v16, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v4);
}

uint64_t sub_213BFEAC4()
{
  id *v0;

  swift_bridgeObjectRelease();
  return sub_213BFEF0C((uint64_t)(v0 + 25));
}

uint64_t sub_213BFEAF8()
{
  id *v0;

  v0 = (id *)sub_213BFC240();

  swift_bridgeObjectRelease();
  sub_213BFEF0C((uint64_t)(v0 + 25));
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PADTrajectoryAnalysisController()
{
  return objc_opt_self();
}

uint64_t getEnumTagSinglePayload for PADFaceActionMode(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for PADTrajectoryAnalysisAssessment.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_213BFEC48 + 4 * byte_213C1569F[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_213BFEC7C + 4 * byte_213C1569A[v4]))();
}

uint64_t sub_213BFEC7C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_213BFEC84(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x213BFEC8CLL);
  return result;
}

uint64_t sub_213BFEC98(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x213BFECA0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_213BFECA4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_213BFECAC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PADTrajectoryAnalysisAssessment.CodingKeys()
{
  return &type metadata for PADTrajectoryAnalysisAssessment.CodingKeys;
}

unint64_t sub_213BFECCC()
{
  unint64_t result;

  result = qword_254D28A88;
  if (!qword_254D28A88)
  {
    result = MEMORY[0x2199BF420](&unk_213C1593C, &type metadata for PADTrajectoryAnalysisAssessment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D28A88);
  }
  return result;
}

unint64_t sub_213BFED14()
{
  unint64_t result;

  result = qword_254D28A90;
  if (!qword_254D28A90)
  {
    result = MEMORY[0x2199BF420](&unk_213C158AC, &type metadata for PADTrajectoryAnalysisAssessment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D28A90);
  }
  return result;
}

unint64_t sub_213BFED5C()
{
  unint64_t result;

  result = qword_254D28A98;
  if (!qword_254D28A98)
  {
    result = MEMORY[0x2199BF420](&unk_213C158D4, &type metadata for PADTrajectoryAnalysisAssessment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D28A98);
  }
  return result;
}

uint64_t sub_213BFEDA0(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0x6D617473656D6974 && a2 == 0xE900000000000070 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6544686374697473 && a2 == 0xEE00646574636574 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x616E67695363636ELL && a2 == 0xE90000000000006CLL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v5 = sub_213C12A14();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_213BFEF0C(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_213BFEF30(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D28D30);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_213BFEF78(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v10;
  _QWORD v11[3];
  uint64_t v12;
  uint64_t v13;
  _BYTE v14[24];
  uint64_t v15;

  if (*(_QWORD *)(v2 + 128))
  {
    v3 = MEMORY[0x2199BF54C](v2 + 144);
    if (v3)
    {
      v4 = v3;
      v5 = sub_213BFC6D4(0xD000000000000054, 0x8000000213C184D0, 0, -1, 0);
      v6 = v4 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_delegate;
      swift_beginAccess();
      sub_213BDF4D4(v6, (uint64_t)v14);
      if (v15)
      {
        sub_213BE2DA4((uint64_t)v14, (uint64_t)v11);
        sub_213BE4088((uint64_t)v14, (uint64_t *)&unk_254D28D30);
        v7 = v12;
        v8 = v13;
        __swift_project_boxed_opaque_existential_1(v11, v12);
        (*(void (**)(id, uint64_t, uint64_t))(v8 + 56))(v5, v7, v8);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
      }
      else
      {
        sub_213BE4088((uint64_t)v14, (uint64_t *)&unk_254D28D30);
      }
      swift_unknownObjectRelease();

    }
  }
  else
  {
    *(_QWORD *)(v2 + 128) = a1;
    *(_QWORD *)(v2 + 136) = a2;
    swift_bridgeObjectRetain();
    v10 = a1;
    sub_213C0119C(0);
    sub_213BFA454(v10);
  }
}

uint64_t sub_213BFF0D8(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t *v7;
  _UNKNOWN **v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  uint64_t v15;
  _QWORD *v16;
  id v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  CGFloat Width;
  CGFloat Height;
  uint64_t v55;
  uint64_t v56;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v58;
  unint64_t v59;
  _QWORD *v60;
  id v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  __int128 v72;
  void *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  _UNKNOWN **v78;
  CGRect v79;
  CGRect v80;

  v7 = (uint64_t *)sub_213C12588();
  v8 = (_UNKNOWN **)*(v7 - 1);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(void **)(v3 + 128);
  if (v11)
  {
    v67 = v3;
    v12 = *(_QWORD *)(v3 + 136);
    v13 = (_QWORD *)swift_allocObject();
    v13[2] = a2;
    v13[3] = a3;
    sub_213C011C8(v11);
    swift_retain();
    v14 = sub_213BFD6E4(sub_213C01388, v13);
    swift_release();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D28D60);
    v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_213C14E40;
    v8 = &off_24D0D0028;
    *(_QWORD *)(v15 + 56) = sub_213BF1DCC(0, &qword_254D298D0);
    *(_QWORD *)(v15 + 64) = &off_24D0D0028;
    *(_QWORD *)(v15 + 32) = v14;
    v16 = (_QWORD *)swift_allocObject();
    v16[2] = a2;
    v16[3] = a3;
    swift_retain();
    v68 = v14;
    v17 = sub_213BFD484(sub_213C01398, v16);
    swift_release();
    v10 = *(char **)(v15 + 16);
    v18 = *(_QWORD *)(v15 + 24);
    if ((unint64_t)v10 >= v18 >> 1)
      v15 = (uint64_t)sub_213BEAC84((_QWORD *)(v18 > 1), (int64_t)(v10 + 1), 1, (_QWORD *)v15);
    v77 = sub_213BF1DCC(0, (unint64_t *)&unk_254D28D70);
    v78 = &off_24D0D0028;
    *(_QWORD *)&v76 = v17;
    *(_QWORD *)(v15 + 16) = v10 + 1;
    v19 = v15 + 32;
    sub_213BFC43C(&v76, v15 + 32 + 40 * (_QWORD)v10);
    v20 = (uint64_t *)(a1 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_faces);
    swift_beginAccess();
    v21 = *v20;
    v22 = (unint64_t)*v20 >> 62;
    v69 = v20;
    if (v22)
    {
      swift_bridgeObjectRetain();
      v23 = sub_213C12918();
    }
    else
    {
      v23 = *(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
    }
    v7 = &OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds;
    if (!v23)
    {
      swift_bridgeObjectRelease();
      goto LABEL_37;
    }
    if ((v21 & 0xC000000000000001) != 0)
    {
      v24 = v15;
      v25 = (char *)MEMORY[0x2199BE994](0, v21);
      goto LABEL_10;
    }
    if (*(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v24 = v15;
      v25 = (char *)*(id *)(v21 + 32);
LABEL_10:
      v26 = v25;
      swift_bridgeObjectRelease();
      v27 = sub_213BECD34(*(double *)&v26[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds], *(double *)&v26[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds + 8], *(double *)&v26[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds + 16], *(double *)&v26[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds + 24]);
      v28 = *(_QWORD *)(v24 + 16);
      if (v28)
      {
        v62 = v26;
        v64 = v11;
        v65 = v12;
        v71 = *MEMORY[0x24BDD0D70];
        v63 = v24;
        swift_bridgeObjectRetain();
        v70 = MEMORY[0x24BEE4AD8] + 8;
        v66 = 0x8000000213C17BD0;
        v72 = xmmword_213C15A30;
        while (1)
        {
          sub_213BE2DA4(v19, (uint64_t)&v76);
          sub_213BE2DA4((uint64_t)&v76, (uint64_t)&v74);
          __swift_instantiateConcreteTypeFromMangledName(&qword_254D27E90);
          sub_213BF1DCC(0, &qword_254D28D80);
          if ((swift_dynamicCast() & 1) != 0)
            break;
LABEL_24:
          sub_213BE2DA4((uint64_t)&v76, (uint64_t)&v74);
          __swift_instantiateConcreteTypeFromMangledName(&qword_254D28D88);
          if ((swift_dynamicCast() & 1) != 0)
          {
            v35 = v73;
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D28D90);
            v36 = swift_allocObject();
            *(_OWORD *)(v36 + 16) = v72;
            *(_QWORD *)(v36 + 32) = v27;
            *(_QWORD *)&v74 = v36;
            sub_213C126A8();
            sub_213BF1DCC(0, (unint64_t *)&unk_254D28D40);
            v37 = v27;
            a2 = (_QWORD *)sub_213C12684();
            swift_bridgeObjectRelease();
            objc_msgSend(v35, sel_setInputFaceObservations_, a2);
            swift_unknownObjectRelease();

          }
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v76);
          v19 += 40;
          if (!--v28)
          {

            v15 = v63;
            swift_bridgeObjectRelease();
            v11 = v64;
            v7 = &OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds;
            goto LABEL_37;
          }
        }
        a2 = v73;
        if (!os_variant_has_internal_content())
          goto LABEL_22;
        v29 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
        v30 = objc_msgSend(v29, sel_persistentDomainForName_, v71);

        if (v30 && (v31 = sub_213C125DC(), v30, v31))
        {
          if (*(_QWORD *)(v31 + 16) && (v32 = sub_213C0DF08(0xD000000000000018, v66), (v33 & 1) != 0))
          {
            sub_213BECBD4(*(_QWORD *)(v31 + 56) + 32 * v32, (uint64_t)&v74);
          }
          else
          {
            v74 = 0u;
            v75 = 0u;
          }
          swift_bridgeObjectRelease();
          if (*((_QWORD *)&v75 + 1))
          {
            if (swift_dynamicCast())
            {
              v34 = v73;
              goto LABEL_23;
            }
LABEL_22:
            v34 = 0;
LABEL_23:
            objc_msgSend(a2, sel_setUsesCPUOnly_, v34);

            goto LABEL_24;
          }
        }
        else
        {
          v74 = 0u;
          v75 = 0u;
        }
        sub_213BE4088((uint64_t)&v74, &qword_254D27FD8);
        goto LABEL_22;
      }

      v15 = v24;
LABEL_37:
      v42 = *v69;
      if ((unint64_t)*v69 >> 62)
      {
        swift_bridgeObjectRetain();
        v43 = sub_213C12918();
        if (v43)
        {
LABEL_39:
          if ((v42 & 0xC000000000000001) != 0)
          {
            v44 = (char *)MEMORY[0x2199BE994](0, v42);
          }
          else
          {
            if (!*(_QWORD *)((v42 & 0xFFFFFFFFFFFFF8) + 0x10))
            {
              __break(1u);
              goto LABEL_56;
            }
            v44 = (char *)*(id *)(v42 + 32);
          }
          v45 = v44;
          swift_bridgeObjectRelease();
          v46 = *(double *)&v45[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds];
          v47 = *(double *)&v45[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds + 8];
          v48 = *(double *)&v45[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds + 16];
          v49 = *(double *)&v45[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds + 24];

          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D29860);
          v50 = swift_allocObject();
          *(_OWORD *)(v50 + 16) = xmmword_213C15A40;
          v51 = MEMORY[0x24BEE50B0];
          *(_QWORD *)(v50 + 56) = MEMORY[0x24BEE50B0];
          v52 = sub_213C011F8();
          *(_QWORD *)(v50 + 64) = v52;
          *(CGFloat *)(v50 + 32) = v46;
          *(_QWORD *)(v50 + 96) = v51;
          *(_QWORD *)(v50 + 104) = v52;
          *(CGFloat *)(v50 + 72) = v47;
          v79.origin.x = v46;
          v79.origin.y = v47;
          v79.size.width = v48;
          v79.size.height = v49;
          Width = CGRectGetWidth(v79);
          *(_QWORD *)(v50 + 136) = v51;
          *(_QWORD *)(v50 + 144) = v52;
          *(CGFloat *)(v50 + 112) = Width;
          v80.origin.x = v46;
          v80.origin.y = v47;
          v80.size.width = v48;
          v80.size.height = v49;
          Height = CGRectGetHeight(v80);
          *(_QWORD *)(v50 + 176) = v51;
          *(_QWORD *)(v50 + 184) = v52;
          *(CGFloat *)(v50 + 152) = Height;
          v42 = sub_213C12618();
          v43 = v55;
          v56 = v67;
          v7 = (uint64_t *)(v67 + 160);
          swift_beginAccess();
          a2 = *(_QWORD **)(v56 + 160);
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          *(_QWORD *)(v56 + 160) = a2;
          if ((isUniquelyReferenced_nonNull_native & 1) != 0)
          {
LABEL_43:
            v59 = a2[2];
            v58 = a2[3];
            if (v59 >= v58 >> 1)
            {
              a2 = sub_213BEADA4((_QWORD *)(v58 > 1), v59 + 1, 1, a2);
              *v7 = (uint64_t)a2;
            }
            a2[2] = v59 + 1;
            v60 = &a2[2 * v59];
            v60[4] = v42;
            v60[5] = v43;
            swift_endAccess();

            goto LABEL_49;
          }
LABEL_56:
          a2 = sub_213BEADA4(0, a2[2] + 1, 1, a2);
          *v7 = (uint64_t)a2;
          goto LABEL_43;
        }
      }
      else
      {
        v43 = *(_QWORD *)((v42 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (v43)
          goto LABEL_39;
      }

      swift_bridgeObjectRelease();
LABEL_49:
      swift_bridgeObjectRelease();
      return v15;
    }
    __break(1u);
    goto LABEL_53;
  }
  if (qword_254D27930 != -1)
LABEL_53:
    swift_once();
  v38 = __swift_project_value_buffer((uint64_t)v7, (uint64_t)qword_254D27938);
  ((void (*)(char *, uint64_t, uint64_t *))v8[2])(v10, v38, v7);
  v39 = sub_213C12570();
  v40 = sub_213C1275C();
  if (os_log_type_enabled(v39, v40))
  {
    v41 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v41 = 0;
    _os_log_impl(&dword_213BCD000, v39, v40, "Attempting to run a selfie through the Selfie Analysis Controller without a request set.", v41, 2u);
    MEMORY[0x2199BF4BC](v41, -1, -1);
  }

  ((void (*)(char *, uint64_t *))v8[1])(v10, v7);
  return MEMORY[0x24BEE4AF8];
}

void sub_213BFF9F0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  float v44;
  float v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  CGFloat Width;
  CGFloat Height;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  CGFloat v65;
  CGFloat v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  void *v70;
  id v71;
  id v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  void *v77;
  id v78;
  id v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  void *v84;
  id v85;
  id v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  void *v91;
  id v92;
  id v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  id v97;
  void *v98;
  id v99;
  id v100;
  id v101;
  uint64_t v102;
  uint64_t v103;
  id v104;
  void *v105;
  id v106;
  id v107;
  id v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  id v112;
  void *v113;
  id v114;
  id v115;
  id v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  void *v138;
  uint64_t v139;
  uint64_t v140;
  char *v141;
  _QWORD *v142;
  uint64_t v143;
  _OWORD v144[10];
  void *v145[3];
  uint64_t v146;
  uint64_t v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  CGRect v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;

  v2 = v1;
  v4 = sub_213C12588();
  MEMORY[0x24BDAC7A8](v4);
  v5 = (_QWORD *)(v1 + 128);
  v6 = *(char **)(v1 + 128);
  if (v6)
  {
    v7 = *(_QWORD *)(v1 + 136);
    if (a1[2])
    {
      v142 = (_QWORD *)(v1 + 128);
      v140 = v1;
      v9 = a1[6];
      v8 = a1[7];
      v11 = a1[4];
      v10 = a1[5];
      swift_bridgeObjectRetain();
      v141 = v6;
      v143 = v7;
      sub_213C011C8(v6);
      v12 = sub_213C07550(v11, v10, v9, v8);
      if (v12)
      {
        if (*(_QWORD *)(v12 + 16))
        {
          sub_213BECBD4(v12 + 32, (uint64_t)&v148);
          swift_bridgeObjectRelease();
          if (*((_QWORD *)&v149 + 1))
          {
            sub_213BF1DCC(0, (unint64_t *)&unk_254D28D40);
            if ((swift_dynamicCast() & 1) != 0)
            {
              v13 = v145[0];
              v14 = sub_213BFD92C(v145[0]);
              if (v14)
                v15 = v14;
              else
                v15 = MEMORY[0x24BEE4AF8];
              v16 = sub_213C07690(v11, v10, v9, v8);
              if (v16)
              {
                if (*(_QWORD *)(v16 + 16))
                {
                  sub_213BECBD4(v16 + 32, (uint64_t)&v148);
                }
                else
                {
                  v148 = 0u;
                  v149 = 0u;
                }
                swift_bridgeObjectRelease();
              }
              else
              {
                v148 = 0u;
                v149 = 0u;
              }
              swift_bridgeObjectRelease();
              v37 = v142;
              if (*((_QWORD *)&v149 + 1))
              {
                if ((swift_dynamicCast() & 1) != 0)
                {
                  v137 = v145[0];
                  if (v7)
                  {
                    swift_bridgeObjectRetain();
                    sub_213C035B4(v15, v7);
                    v45 = v44;
                    swift_bridgeObjectRelease();
                  }
                  else
                  {
                    v45 = -1.0;
                  }
                  v46 = &v141[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_faces];
                  swift_beginAccess();
                  v47 = *(_QWORD *)v46;
                  if (*(_QWORD *)v46 >> 62)
                  {
                    swift_bridgeObjectRetain();
                    v139 = v15;
                    if (sub_213C12918())
                      goto LABEL_54;
                  }
                  else
                  {
                    v48 = *(_QWORD *)((v47 & 0xFFFFFFFFFFFFF8) + 0x10);
                    swift_bridgeObjectRetain();
                    v139 = v15;
                    if (v48)
                    {
LABEL_54:
                      if ((v47 & 0xC000000000000001) != 0)
                      {
                        v49 = (char *)MEMORY[0x2199BE994](0, v47);
                      }
                      else
                      {
                        if (!*(_QWORD *)((v47 & 0xFFFFFFFFFFFFF8) + 0x10))
                        {
                          __break(1u);
                          return;
                        }
                        v49 = (char *)*(id *)(v47 + 32);
                      }
                      v50 = v49;
                      swift_bridgeObjectRelease();
                      v51 = *(double *)&v50[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds];
                      v52 = *(double *)&v50[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds + 8];
                      v53 = *(double *)&v50[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds + 16];
                      v54 = *(double *)&v50[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds + 24];
                      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D29860);
                      v55 = swift_allocObject();
                      *(_OWORD *)(v55 + 16) = xmmword_213C15A40;
                      v56 = MEMORY[0x24BEE50B0];
                      *(_QWORD *)(v55 + 56) = MEMORY[0x24BEE50B0];
                      v57 = sub_213C011F8();
                      *(_QWORD *)(v55 + 64) = v57;
                      *(CGFloat *)(v55 + 32) = v51;
                      *(_QWORD *)(v55 + 96) = v56;
                      *(_QWORD *)(v55 + 104) = v57;
                      *(CGFloat *)(v55 + 72) = v52;
                      v158.origin.x = v51;
                      v158.origin.y = v52;
                      v158.size.width = v53;
                      v158.size.height = v54;
                      Width = CGRectGetWidth(v158);
                      *(_QWORD *)(v55 + 136) = v56;
                      *(_QWORD *)(v55 + 144) = v57;
                      *(CGFloat *)(v55 + 112) = Width;
                      v159.origin.x = v51;
                      v159.origin.y = v52;
                      v159.size.width = v53;
                      v159.size.height = v54;
                      Height = CGRectGetHeight(v159);
                      *(_QWORD *)(v55 + 176) = v56;
                      *(_QWORD *)(v55 + 184) = v57;
                      *(CGFloat *)(v55 + 152) = Height;
                      v60 = sub_213C12618();
                      v135 = v61;
                      v136 = v60;

                      goto LABEL_60;
                    }
                  }
                  swift_bridgeObjectRelease();
                  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D29860);
                  v62 = swift_allocObject();
                  *(_OWORD *)(v62 + 16) = xmmword_213C15A40;
                  v63 = MEMORY[0x24BEE50B0];
                  *(_QWORD *)(v62 + 56) = MEMORY[0x24BEE50B0];
                  v64 = sub_213C011F8();
                  *(_QWORD *)(v62 + 32) = 0;
                  *(_QWORD *)(v62 + 96) = v63;
                  *(_QWORD *)(v62 + 104) = v64;
                  *(_QWORD *)(v62 + 64) = v64;
                  *(_QWORD *)(v62 + 72) = 0;
                  v160.origin.x = 0.0;
                  v160.origin.y = 0.0;
                  v160.size.width = 0.0;
                  v160.size.height = 0.0;
                  v65 = CGRectGetWidth(v160);
                  *(_QWORD *)(v62 + 136) = v63;
                  *(_QWORD *)(v62 + 144) = v64;
                  *(CGFloat *)(v62 + 112) = v65;
                  v161.origin.x = 0.0;
                  v161.origin.y = 0.0;
                  v161.size.width = 0.0;
                  v161.size.height = 0.0;
                  v66 = CGRectGetHeight(v161);
                  *(_QWORD *)(v62 + 176) = v63;
                  *(_QWORD *)(v62 + 184) = v64;
                  *(CGFloat *)(v62 + 152) = v66;
                  v67 = sub_213C12618();
                  v135 = v68;
                  v136 = v67;
LABEL_60:
                  v69 = objc_msgSend(v137, sel_faceAttributes);
                  if (v69)
                  {
                    v70 = v69;
                    v71 = objc_msgSend(v69, sel_ageCategory);

                    v72 = objc_msgSend(v71, sel_label);
                    v73 = objc_msgSend(v72, sel_identifier);

                    v74 = sub_213C1260C();
                    v133 = v75;
                    v134 = v74;

                  }
                  else
                  {
                    v133 = 0;
                    v134 = 0;
                  }
                  v76 = objc_msgSend(v137, sel_faceAttributes);
                  if (v76)
                  {
                    v77 = v76;
                    v78 = objc_msgSend(v76, sel_VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE);

                    v79 = objc_msgSend(v78, sel_label);
                    v80 = objc_msgSend(v79, sel_identifier);

                    v81 = sub_213C1260C();
                    v131 = v82;
                    v132 = v81;

                  }
                  else
                  {
                    v131 = 0;
                    v132 = 0;
                  }
                  v83 = objc_msgSend(v137, sel_faceAttributes);
                  if (v83)
                  {
                    v84 = v83;
                    v85 = objc_msgSend(v83, sel_VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq);

                    v86 = objc_msgSend(v85, sel_label);
                    v87 = objc_msgSend(v86, sel_identifier);

                    v88 = sub_213C1260C();
                    v129 = v89;
                    v130 = v88;

                  }
                  else
                  {
                    v129 = 0;
                    v130 = 0;
                  }
                  v90 = objc_msgSend(v137, sel_faceAttributes);
                  if (v90)
                  {
                    v91 = v90;
                    v92 = objc_msgSend(v90, sel_VN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB);

                    v93 = objc_msgSend(v92, sel_label);
                    v94 = objc_msgSend(v93, sel_identifier);

                    v95 = sub_213C1260C();
                    v127 = v96;
                    v128 = v95;

                  }
                  else
                  {
                    v127 = 0;
                    v128 = 0;
                  }
                  v97 = objc_msgSend(v137, sel_faceAttributes);
                  if (v97)
                  {
                    v98 = v97;
                    v99 = objc_msgSend(v97, sel_faceHairCategory);

                    v100 = objc_msgSend(v99, sel_label);
                    v101 = objc_msgSend(v100, sel_identifier);

                    v102 = sub_213C1260C();
                    v126 = v103;

                  }
                  else
                  {
                    v102 = 0;
                    v126 = 0;
                  }
                  v138 = v13;
                  v104 = objc_msgSend(v137, sel_faceAttributes);
                  if (v104)
                  {
                    v105 = v104;
                    v106 = objc_msgSend(v104, sel_VN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP);

                    v107 = objc_msgSend(v106, (SEL)&selRef_persistentDomainForName_);
                    v108 = objc_msgSend(v107, (SEL)&PADFaceActionController.ivar_lyt);

                    v109 = sub_213C1260C();
                    v111 = v110;

                  }
                  else
                  {
                    v109 = 0;
                    v111 = 0;
                  }
                  v112 = objc_msgSend(v137, sel_faceAttributes);
                  if (v112)
                  {
                    v113 = v112;
                    v114 = objc_msgSend(v112, sel_glassesCategory);

                    v115 = objc_msgSend(v114, (SEL)&selRef_persistentDomainForName_);
                    v116 = objc_msgSend(v115, (SEL)&PADFaceActionController.ivar_lyt);

                    v117 = sub_213C1260C();
                    v119 = v118;

                  }
                  else
                  {
                    v117 = 0;
                    v119 = 0;
                  }
                  if (v143)
                    v120 = v143;
                  else
                    v120 = MEMORY[0x24BEE4AF8];
                  swift_beginAccess();
                  v121 = *(_QWORD *)(v140 + 160);
                  *(float *)&v148 = v45;
                  *((_QWORD *)&v148 + 1) = v134;
                  *(_QWORD *)&v149 = v133;
                  *((_QWORD *)&v149 + 1) = v132;
                  *(_QWORD *)&v150 = v131;
                  *((_QWORD *)&v150 + 1) = v130;
                  *(_QWORD *)&v151 = v129;
                  *((_QWORD *)&v151 + 1) = v128;
                  *(_QWORD *)&v152 = v127;
                  *((_QWORD *)&v152 + 1) = v102;
                  *(_QWORD *)&v153 = v126;
                  *((_QWORD *)&v153 + 1) = v109;
                  *(_QWORD *)&v154 = v111;
                  *((_QWORD *)&v154 + 1) = v117;
                  *(_QWORD *)&v155 = v119;
                  *((_QWORD *)&v155 + 1) = v139;
                  *(_QWORD *)&v156 = v136;
                  *((_QWORD *)&v156 + 1) = v135;
                  *(_QWORD *)&v157 = v120;
                  *((_QWORD *)&v157 + 1) = v121;
                  v122 = MEMORY[0x2199BF54C](v140 + 144);
                  if (v122)
                  {
                    v123 = v122;
                    v144[6] = v154;
                    v144[7] = v155;
                    v144[8] = v156;
                    v144[9] = v157;
                    v144[2] = v150;
                    v144[3] = v151;
                    v144[4] = v152;
                    v144[5] = v153;
                    v144[0] = v148;
                    v144[1] = v149;
                    nullsub_1(v144);
                    v124 = v123 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_selfieResult;
                    sub_213BE3C10(v123 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_selfieResult, (uint64_t)v145);
                    sub_213BE3C10((uint64_t)v144, v124);
                    swift_bridgeObjectRetain();
                    swift_bridgeObjectRetain();
                    sub_213C0123C((uint64_t)&v148);
                    sub_213C01304((uint64_t *)v145);
                    sub_213BE1138();
                    swift_unknownObjectRelease();
                  }
                  else
                  {
                    swift_bridgeObjectRetain();
                    swift_bridgeObjectRetain();
                  }
                  v125 = *(void **)(v140 + 128);
                  *v142 = 0;
                  v142[1] = 0;
                  sub_213C0119C(v125);
                  swift_bridgeObjectRelease();

                  sub_213BE3EEC((uint64_t)&v148);
                  return;
                }
                swift_bridgeObjectRelease();
              }
              else
              {
                swift_bridgeObjectRelease();
                sub_213BE4088((uint64_t)&v148, &qword_254D27FD8);
              }
              v38 = sub_213BFC6D4(0xD00000000000002DLL, 0x8000000213C18440, 0, -1, 0);
              v39 = MEMORY[0x2199BF54C](v140 + 144);
              if (v39)
              {
                v40 = v39 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_delegate;
                swift_beginAccess();
                sub_213BDF4D4(v40, (uint64_t)&v148);
                if (*((_QWORD *)&v149 + 1))
                {
                  sub_213BE2DA4((uint64_t)&v148, (uint64_t)v145);
                  sub_213BE4088((uint64_t)&v148, (uint64_t *)&unk_254D28D30);
                  v41 = v146;
                  v42 = v147;
                  __swift_project_boxed_opaque_existential_1(v145, v146);
                  (*(void (**)(id, uint64_t, uint64_t))(v42 + 56))(v38, v41, v42);
                  __swift_destroy_boxed_opaque_existential_1((uint64_t)v145);
                }
                else
                {
                  sub_213BE4088((uint64_t)&v148, (uint64_t *)&unk_254D28D30);
                }
                swift_unknownObjectRelease();
                v37 = v142;
              }
              v43 = *(void **)(v140 + 128);
              *v37 = 0;
              v37[1] = 0;
              sub_213C0119C(v43);

LABEL_31:
              swift_bridgeObjectRelease();
              return;
            }
            swift_bridgeObjectRelease();
            v28 = v140;
LABEL_22:
            v29 = sub_213BFC6D4(0xD000000000000027, 0x8000000213C18410, 0, -1, 0);
            v30 = MEMORY[0x2199BF54C](v28 + 144);
            if (v30)
            {
              v31 = v30 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_delegate;
              swift_beginAccess();
              sub_213BDF4D4(v31, (uint64_t)&v148);
              if (*((_QWORD *)&v149 + 1))
              {
                sub_213BE2DA4((uint64_t)&v148, (uint64_t)v145);
                sub_213BE4088((uint64_t)&v148, (uint64_t *)&unk_254D28D30);
                v32 = v146;
                v33 = v147;
                __swift_project_boxed_opaque_existential_1(v145, v146);
                (*(void (**)(id, uint64_t, uint64_t))(v33 + 56))(v29, v32, v33);
                __swift_destroy_boxed_opaque_existential_1((uint64_t)v145);
              }
              else
              {
                sub_213BE4088((uint64_t)&v148, (uint64_t *)&unk_254D28D30);
              }
              swift_unknownObjectRelease();
            }
            v35 = *(void **)(v28 + 128);
            *v142 = 0;
            v142[1] = 0;
            sub_213C0119C(v35);

            goto LABEL_31;
          }
        }
        else
        {
          v148 = 0u;
          v149 = 0u;
          swift_bridgeObjectRelease();
        }
      }
      else
      {
        v148 = 0u;
        v149 = 0u;
      }
      swift_bridgeObjectRelease();
      sub_213BE4088((uint64_t)&v148, &qword_254D27FD8);
      v28 = v140;
      goto LABEL_22;
    }
    swift_bridgeObjectRetain();
    v22 = v6;
    v23 = sub_213BFC6D4(0xD000000000000039, 0x8000000213C18490, 0, -1, 0);
    v24 = MEMORY[0x2199BF54C](v1 + 144);
    if (v24)
    {
      v25 = v24 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_delegate;
      swift_beginAccess();
      sub_213BDF4D4(v25, (uint64_t)&v148);
      if (*((_QWORD *)&v149 + 1))
      {
        sub_213BE2DA4((uint64_t)&v148, (uint64_t)v145);
        sub_213BE4088((uint64_t)&v148, (uint64_t *)&unk_254D28D30);
        v26 = v146;
        v27 = v147;
        __swift_project_boxed_opaque_existential_1(v145, v146);
        (*(void (**)(id, uint64_t, uint64_t))(v27 + 56))(v23, v26, v27);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v145);
      }
      else
      {
        sub_213BE4088((uint64_t)&v148, (uint64_t *)&unk_254D28D30);
      }
      swift_unknownObjectRelease();
    }
    v36 = *(void **)(v2 + 128);
    *v5 = 0;
    v5[1] = 0;
    sub_213C0119C(v36);

    swift_bridgeObjectRelease();
  }
  else
  {
    v17 = sub_213BFC6D4(0xD000000000000037, 0x8000000213C183D0, 0, -1, 0);
    v18 = MEMORY[0x2199BF54C](v1 + 144);
    if (v18)
    {
      v19 = v18 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_delegate;
      swift_beginAccess();
      sub_213BDF4D4(v19, (uint64_t)&v148);
      if (*((_QWORD *)&v149 + 1))
      {
        sub_213BE2DA4((uint64_t)&v148, (uint64_t)v145);
        sub_213BE4088((uint64_t)&v148, (uint64_t *)&unk_254D28D30);
        v20 = v146;
        v21 = v147;
        __swift_project_boxed_opaque_existential_1(v145, v146);
        (*(void (**)(id, uint64_t, uint64_t))(v21 + 56))(v17, v20, v21);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v145);
      }
      else
      {
        sub_213BE4088((uint64_t)&v148, (uint64_t *)&unk_254D28D30);
      }
      swift_unknownObjectRelease();
    }
    v34 = *(void **)(v2 + 128);
    *v5 = 0;
    v5[1] = 0;
    sub_213C0119C(v34);

  }
}

uint64_t sub_213C00B64()
{
  uint64_t v0;

  sub_213C0119C(*(void **)(v0 + 128));
  sub_213BFEF0C(v0 + 144);
  return swift_bridgeObjectRelease();
}

uint64_t sub_213C00B88()
{
  uint64_t v0;

  v0 = sub_213BFC240();
  sub_213C0119C(*(void **)(v0 + 128));
  sub_213BFEF0C(v0 + 144);
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PADSelfieAnalysisController()
{
  return objc_opt_self();
}

_QWORD *initializeBufferWithCopyOfBuffer for PADSelfieAnalysisControllerRequest(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for PADSelfieAnalysisControllerRequest(id *a1)
{

  return swift_bridgeObjectRelease();
}

uint64_t assignWithCopy for PADSelfieAnalysisControllerRequest(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

id *assignWithTake for PADSelfieAnalysisControllerRequest(id *a1, _OWORD *a2)
{

  *(_OWORD *)a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for PADSelfieAnalysisControllerRequest()
{
  return &type metadata for PADSelfieAnalysisControllerRequest;
}

uint64_t destroy for PADSelfieAnalysisControllerResult()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PADSelfieAnalysisControllerResult(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  v6 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v6;
  v7 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v7;
  v8 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v8;
  v9 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v9;
  v10 = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = v10;
  v11 = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 144) = v11;
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PADSelfieAnalysisControllerResult(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy160_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __n128 result;
  __int128 v7;
  __int128 v8;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  result = *(__n128 *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 112);
  v8 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v8;
  *(__n128 *)(a1 + 96) = result;
  *(_OWORD *)(a1 + 112) = v7;
  return result;
}

uint64_t assignWithTake for PADSelfieAnalysisControllerResult(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v9;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PADSelfieAnalysisControllerResult(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 160))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 120);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PADSelfieAnalysisControllerResult(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 152) = 0;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 160) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 120) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 160) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PADSelfieAnalysisControllerResult()
{
  return &type metadata for PADSelfieAnalysisControllerResult;
}

void *sub_213C0119C(void *result)
{
  if (result)
  {

    return (void *)swift_bridgeObjectRelease();
  }
  return result;
}

id sub_213C011C8(id result)
{
  id v1;

  if (result)
  {
    v1 = result;
    swift_bridgeObjectRetain();
    return v1;
  }
  return result;
}

unint64_t sub_213C011F8()
{
  unint64_t result;

  result = qword_254D28D50;
  if (!qword_254D28D50)
  {
    result = MEMORY[0x2199BF420](MEMORY[0x24BEE5108], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_254D28D50);
  }
  return result;
}

uint64_t sub_213C0123C(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *sub_213C01304(uint64_t *a1)
{
  sub_213BE3DF4(*a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15]);
  return a1;
}

uint64_t sub_213C01364()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_213C01388(void *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_213C074D8(a1, a2, *(void (**)(_QWORD *, uint64_t))(v2 + 16));
}

void PADSWPose.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_213C013F4(char a1)
{
  return *(_QWORD *)&aPitch_5[8 * a1];
}

uint64_t sub_213C01414()
{
  char *v0;

  return sub_213C013F4(*v0);
}

uint64_t sub_213C0141C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_213C02678(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_213C01440()
{
  sub_213C0162C();
  return sub_213C12A8C();
}

uint64_t sub_213C01468()
{
  sub_213C0162C();
  return sub_213C12A98();
}

uint64_t PADSWPose.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  uint64_t v11;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D28DA0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_213C0162C();
  sub_213C12A80();
  v11 = *(_QWORD *)(v3 + OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_pitch);
  HIBYTE(v10) = 0;
  sub_213C01670();
  sub_213C129E4();
  if (!v2)
  {
    v11 = *(_QWORD *)(v3 + OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_yaw);
    HIBYTE(v10) = 1;
    sub_213C129E4();
    v11 = *(_QWORD *)(v3 + OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_roll);
    HIBYTE(v10) = 2;
    sub_213C129E4();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_213C0162C()
{
  unint64_t result;

  result = qword_254D28DA8;
  if (!qword_254D28DA8)
  {
    result = MEMORY[0x2199BF420](&unk_213C15C94, &type metadata for PADSWPose.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D28DA8);
  }
  return result;
}

unint64_t sub_213C01670()
{
  unint64_t result;

  result = qword_254D28DB8;
  if (!qword_254D28DB8)
  {
    result = MEMORY[0x2199BF420](MEMORY[0x24BEE50C0], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_254D28DB8);
  }
  return result;
}

id PADSWPose.__allocating_init(from:)(_QWORD *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return PADSWPose.init(from:)(a1);
}

id PADSWPose.init(from:)(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  objc_class *ObjectType;
  objc_super v15;
  char v16;
  uint64_t v17;

  ObjectType = (objc_class *)swift_getObjectType();
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D28DD0);
  v4 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_213C0162C();
  v7 = v1;
  sub_213C12A74();
  if (v2)
  {

    v10 = ObjectType;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_deallocPartialClassInstance();
  }
  else
  {
    v8 = v4;
    v16 = 0;
    sub_213C0193C();
    v9 = v13;
    sub_213C1299C();
    *(_QWORD *)&v7[OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_pitch] = v17;
    v16 = 1;
    sub_213C1299C();
    *(_QWORD *)&v7[OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_yaw] = v17;
    v16 = 2;
    sub_213C1299C();
    *(_QWORD *)&v7[OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_roll] = v17;

    v15.receiver = v7;
    v15.super_class = ObjectType;
    v10 = objc_msgSendSuper2(&v15, sel_init);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v9);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v10;
}

unint64_t sub_213C0193C()
{
  unint64_t result;

  result = qword_254D28DD8;
  if (!qword_254D28DD8)
  {
    result = MEMORY[0x2199BF420](MEMORY[0x24BEE50E8], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_254D28DD8);
  }
  return result;
}

id sub_213C01980@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  objc_class *v2;
  uint64_t v3;
  id v6;
  id result;

  v6 = objc_allocWithZone(v2);
  result = PADSWPose.init(from:)(a1);
  if (!v3)
    *a2 = result;
  return result;
}

uint64_t sub_213C019CC(_QWORD *a1)
{
  return PADSWPose.encode(to:)(a1);
}

void PADSWFace.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id _s10CoreIDVPAD9PADSWPoseCfD_0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id PADSWFrame.__allocating_init(time:buffer:faces:orientation:gesture:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, unint64_t a6, uint64_t a7)
{
  objc_class *v7;
  id v15;
  id v16;

  v15 = objc_allocWithZone(v7);
  v16 = sub_213C02794(a1, a2, a3, a4, a5, a6 | ((HIDWORD(a6) & 1) << 32), a7);

  return v16;
}

id PADSWFrame.init(time:buffer:faces:orientation:gesture:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, unint64_t a6, uint64_t a7)
{
  id v8;

  v8 = sub_213C02794(a1, a2, a3, a4, a5, a6 | ((HIDWORD(a6) & 1) << 32), a7);

  return v8;
}

id PADSWFrame.__deallocating_deinit()
{
  void *v0;
  id v1;
  objc_super v3;

  v1 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  if (qword_254D27968 != -1)
    swift_once();
  objc_msgSend(v1, sel_postNotificationName_object_, qword_254D286D8, 0);

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for PADSWFrame();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

void sub_213C01CF4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  id v11;
  id v12;
  void *v13;
  unint64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  unint64_t v19;
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
  objc_class *v30;
  char *v31;
  id v32;
  objc_class *v33;
  char *v34;
  char *v35;
  id v36;
  uint64_t v37;
  id v38;
  unint64_t v39;
  objc_super v40;
  objc_super v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;

  v1 = v0;
  v45 = *MEMORY[0x24BDAC8D0];
  v2 = (_QWORD *)(v0 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_faces);
  swift_beginAccess();
  if (*v2 >> 62)
  {
    swift_bridgeObjectRetain();
    v37 = sub_213C12918();
    swift_bridgeObjectRelease();
    if (v37)
      return;
  }
  else if (*(_QWORD *)((*v2 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    return;
  }
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDF9CE0]), sel_init);
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDF9B78]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D28D90);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_213C15A30;
  *(_QWORD *)(v5 + 32) = v4;
  v43 = (id)v5;
  sub_213C126A8();
  sub_213BF1DCC(0, &qword_254D28D80);
  v6 = v4;
  v7 = (void *)sub_213C12684();
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(v1 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_buffer);
  v9 = *(unsigned int *)(v1 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_orientation);
  v43 = 0;
  v10 = objc_msgSend(v3, sel_performRequests_onCVPixelBuffer_orientation_error_, v7, v8, v9, &v43);

  if (v10)
  {
    v11 = v43;
    v12 = objc_msgSend(v6, sel_results);
    if (!v12)
    {
LABEL_21:
      v43 = 0;
      v44 = 0xE000000000000000;
      sub_213C1287C();
      sub_213C12648();
      v38 = objc_msgSend(v6, sel_results);
      if (v38)
      {
        sub_213BF1DCC(0, (unint64_t *)&unk_254D28D40);
        v39 = sub_213C12690();

        if (v39 >> 62)
        {
          swift_bridgeObjectRetain();
          v38 = (id)sub_213C12918();
          swift_bridgeObjectRelease();
        }
        else
        {
          v38 = *(id *)((v39 & 0xFFFFFFFFFFFFF8) + 0x10);
        }
        swift_bridgeObjectRelease();
      }
      v42 = v38;
      sub_213C129FC();
      sub_213C12648();
      swift_bridgeObjectRelease();
      sub_213BFC6D4((uint64_t)v43, v44, 0, 0, 0);
      swift_bridgeObjectRelease();
      goto LABEL_26;
    }
    v13 = v12;
    sub_213BF1DCC(0, (unint64_t *)&unk_254D28D40);
    v14 = sub_213C12690();

    if (v14 >> 62)
    {
      swift_bridgeObjectRetain();
      v15 = (void *)sub_213C12918();
      swift_bridgeObjectRelease();
      if (v15)
      {
LABEL_7:
        if ((v14 & 0xC000000000000001) != 0)
        {
          v16 = (id)MEMORY[0x2199BE994](0, v14);
        }
        else
        {
          if (!*(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            goto LABEL_31;
          }
          v16 = *(id *)(v14 + 32);
        }
        v15 = v16;
        swift_bridgeObjectRelease();
        v17 = objc_msgSend(v6, sel_results);
        if (!v17)
        {
LABEL_16:

          goto LABEL_21;
        }
        v18 = v17;
        v19 = sub_213C12690();

        if (!(v19 >> 62))
        {
          v20 = *(_QWORD *)((v19 & 0xFFFFFFFFFFFFF8) + 0x10);
          goto LABEL_13;
        }
LABEL_31:
        swift_bridgeObjectRetain();
        v20 = sub_213C12918();
        swift_bridgeObjectRelease();
LABEL_13:
        swift_bridgeObjectRelease();
        if (v20 == 1)
        {
          v21 = swift_allocObject();
          *(_OWORD *)(v21 + 16) = xmmword_213C15A30;
          objc_msgSend(v15, sel_boundingBox);
          v23 = v22;
          v25 = v24;
          v27 = v26;
          v29 = v28;
          v30 = (objc_class *)type metadata accessor for PADSWPose();
          v31 = (char *)objc_allocWithZone(v30);
          *(_QWORD *)&v31[OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_pitch] = 0;
          *(_QWORD *)&v31[OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_yaw] = 0;
          *(_QWORD *)&v31[OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_roll] = 0;
          v41.receiver = v31;
          v41.super_class = v30;
          v32 = objc_msgSendSuper2(&v41, sel_init);
          v33 = (objc_class *)type metadata accessor for PADSWFace();
          v34 = (char *)objc_allocWithZone(v33);
          v35 = &v34[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds];
          *(_QWORD *)v35 = v23;
          *((_QWORD *)v35 + 1) = v25;
          *((_QWORD *)v35 + 2) = v27;
          *((_QWORD *)v35 + 3) = v29;
          *(_QWORD *)&v34[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_pose] = v32;
          v40.receiver = v34;
          v40.super_class = v33;
          *(_QWORD *)(v21 + 32) = objc_msgSendSuper2(&v40, sel_init);
          v43 = (id)v21;
          sub_213C126A8();
          *v2 = v43;

          swift_bridgeObjectRelease();
          return;
        }
        goto LABEL_16;
      }
    }
    else
    {
      v15 = *(void **)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v15)
        goto LABEL_7;
    }
    swift_bridgeObjectRelease();
    goto LABEL_21;
  }
  v36 = v43;
  sub_213C1248C();

LABEL_26:
  swift_willThrow();

}

char *sub_213C02270()
{
  char *v0;
  char *v1;
  unint64_t v2;
  uint64_t v3;
  char *v4;
  char *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double x;
  double y;
  double width;
  double height;
  uint64_t v16;
  int64_t v17;
  int64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  void *v24;
  uint64_t PixelFormatType;
  id v26;
  uint64_t v27;
  const char *v28;
  id v30[5];
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v30[4] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = &v0[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_faces];
  swift_beginAccess();
  v2 = *(_QWORD *)v1;
  if (!(v2 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3)
      goto LABEL_3;
LABEL_14:
    swift_bridgeObjectRelease();
    v27 = 0xD000000000000033;
    v28 = "No faces set for frame, unable to obtain face crop.";
    goto LABEL_15;
  }
  swift_bridgeObjectRetain();
  if (!sub_213C12918())
    goto LABEL_14;
LABEL_3:
  if ((v2 & 0xC000000000000001) != 0)
  {
    v4 = (char *)MEMORY[0x2199BE994](0, v2);
  }
  else
  {
    if (!*(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
      __break(1u);
    v4 = (char *)*(id *)(v2 + 32);
  }
  v5 = v4;
  swift_bridgeObjectRelease();
  v6 = *(double *)&v5[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds];
  v7 = *(double *)&v5[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds + 8];
  v8 = *(double *)&v5[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds + 16];
  v9 = *(double *)&v5[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds + 24];

  v31.origin.x = v6;
  v31.origin.y = v7;
  v31.size.width = v8;
  v31.size.height = v9;
  v10 = CGRectGetWidth(v31) * -0.765 * 0.5;
  v32.origin.x = v6;
  v32.origin.y = v7;
  v32.size.width = v8;
  v32.size.height = v9;
  v11 = CGRectGetHeight(v32) * -0.765 * 0.5;
  v33.origin.x = v6;
  v33.origin.y = v7;
  v33.size.width = v8;
  v33.size.height = v9;
  v34 = CGRectInset(v33, v10, v11);
  x = v34.origin.x;
  y = v34.origin.y;
  width = v34.size.width;
  height = v34.size.height;
  v34.origin.x = 0.0;
  v34.origin.y = 0.0;
  v34.size.width = 1.0;
  v34.size.height = 1.0;
  v39.origin.x = x;
  v39.origin.y = y;
  v39.size.width = width;
  v39.size.height = height;
  if (CGRectContainsRect(v34, v39))
  {
    v35.origin.x = 0.0;
    v35.origin.y = 0.0;
    v35.size.width = 1.0;
    v35.size.height = 1.0;
    v40.origin.x = x;
    v40.origin.y = y;
    v40.size.width = width;
    v40.size.height = height;
    v36 = CGRectIntersection(v35, v40);
    x = v36.origin.x;
    y = v36.origin.y;
    width = v36.size.width;
    height = v36.size.height;
  }
  v16 = OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_buffer;
  v17 = CVPixelBufferGetWidth(*(CVPixelBufferRef *)&v0[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_buffer]);
  CVPixelBufferGetHeight(*(CVPixelBufferRef *)&v0[v16]);
  CVPixelBufferGetWidth(*(CVPixelBufferRef *)&v0[v16]);
  v18 = CVPixelBufferGetHeight(*(CVPixelBufferRef *)&v0[v16]);
  v37.origin.x = x * (double)v17;
  v37.size.width = width * (double)v17;
  v37.origin.y = y * (double)v18;
  v37.size.height = height * (double)v18;
  v38 = CGRectIntegral(v37);
  v19 = v38.origin.x;
  v20 = v38.origin.y;
  v21 = v38.size.width;
  v22 = v38.size.height;
  v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDF9C20]), sel_initWithCVPixelBuffer_orientation_options_, *(_QWORD *)&v0[v16], *(unsigned int *)&v0[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_orientation], 0);
  if (!v23)
  {
    v27 = 0xD000000000000030;
    v28 = "Unable to creat VNImageBuffer from CVPixelBuffer";
LABEL_15:
    sub_213BFC6D4(v27, (unint64_t)(v28 - 32) | 0x8000000000000000, 0, 0, 0);
    swift_willThrow();
    return v0;
  }
  v24 = v23;
  PixelFormatType = CVPixelBufferGetPixelFormatType(*(CVPixelBufferRef *)&v0[v16]);
  v30[0] = 0;
  v0 = (char *)objc_msgSend(v24, sel_cropAndScaleBufferWithWidth_height_cropRect_format_imageCropAndScaleOption_options_error_calculatedNormalizedOriginOffset_calculatedScaleX_calculatedScaleY_, 128, 128, PixelFormatType, 2, 0, v30, v19, v20, v21, v22, 0, 0, 0);
  v26 = v30[0];
  if (!v0)
  {
    sub_213BFC6D4(0xD000000000000027, 0x8000000213C18690, 0, 0, 0);
    swift_willThrow();
  }

  return v0;
}

id PADSWFrame.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void PADSWFrame.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_213C02678(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6863746970 && a2 == 0xE500000000000000;
  if (v3 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 7823737 && a2 == 0xE300000000000000 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1819045746 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_213C12A14();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

id sub_213C02794(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  char *v7;
  char *v9;
  id v10;
  const __CFString *v11;
  char *v12;
  CFTypeRef v13;
  objc_super v15;
  CMAttachmentMode attachmentModeOut;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v9 = &v7[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_time];
  *(_QWORD *)v9 = a1;
  *((_QWORD *)v9 + 1) = a2;
  *((_QWORD *)v9 + 2) = a3;
  *(_QWORD *)&v7[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_buffer] = a4;
  *(_QWORD *)&v7[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_faces] = a5;
  *(_QWORD *)&v7[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_gesture] = a7;
  if ((a6 & 0x100000000) != 0)
  {
    attachmentModeOut = 0;
    v11 = (const __CFString *)*MEMORY[0x24BDD9698];
    v12 = v7;
    v13 = (id)CMGetAttachment(a4, v11, &attachmentModeOut);
    swift_unknownObjectRelease();
    *(_DWORD *)&v12[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_orientation] = attachmentModeOut;

  }
  else
  {
    *(_DWORD *)&v7[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_orientation] = a6;
    v10 = a4;
  }
  v15.receiver = v7;
  v15.super_class = (Class)type metadata accessor for PADSWFrame();
  return objc_msgSendSuper2(&v15, sel_init);
}

uint64_t type metadata accessor for PADSWFrame()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for PADSWPose()
{
  return objc_opt_self();
}

uint64_t method lookup function for PADSWPose()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PADSWPose.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t type metadata accessor for PADSWFace()
{
  return objc_opt_self();
}

uint64_t method lookup function for PADSWFace()
{
  return swift_lookUpClassMethod();
}

uint64_t method lookup function for PADSWFrame()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PADSWFrame.__allocating_init(time:buffer:faces:orientation:gesture:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v6;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))(v6 + 256))(a1, a2, a3, a4, a5, a6 | ((HIDWORD(a6) & 1) << 32));
}

uint64_t storeEnumTagSinglePayload for PADSWPose.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_213C029A8 + 4 * byte_213C15B15[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_213C029DC + 4 * byte_213C15B10[v4]))();
}

uint64_t sub_213C029DC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_213C029E4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x213C029ECLL);
  return result;
}

uint64_t sub_213C029F8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x213C02A00);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_213C02A04(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_213C02A0C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PADSWPose.CodingKeys()
{
  return &type metadata for PADSWPose.CodingKeys;
}

unint64_t sub_213C02A2C()
{
  unint64_t result;

  result = qword_254D28E90;
  if (!qword_254D28E90)
  {
    result = MEMORY[0x2199BF420](&unk_213C15C6C, &type metadata for PADSWPose.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D28E90);
  }
  return result;
}

unint64_t sub_213C02A74()
{
  unint64_t result;

  result = qword_254D28E98;
  if (!qword_254D28E98)
  {
    result = MEMORY[0x2199BF420](&unk_213C15BDC, &type metadata for PADSWPose.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D28E98);
  }
  return result;
}

unint64_t sub_213C02ABC()
{
  unint64_t result;

  result = qword_254D28EA0;
  if (!qword_254D28EA0)
  {
    result = MEMORY[0x2199BF420](&unk_213C15C04, &type metadata for PADSWPose.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D28EA0);
  }
  return result;
}

uint64_t destroy for PADObservationComposite()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PADObservationComposite(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PADObservationComposite(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 12) = *(_DWORD *)(a2 + 12);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for PADObservationComposite(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  *a1 = *a2;
  a1[1] = a2[1];
  v3 = a2[3];
  a1[2] = a2[2];
  a1[3] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PADObservationComposite(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PADObservationComposite(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PADObservationComposite()
{
  return &type metadata for PADObservationComposite;
}

uint64_t sub_213C02C74(uint64_t a1, unint64_t a2)
{
  return sub_213C0331C(a1, a2, (SEL *)&selRef_performFAC_gesture_error_);
}

void *sub_213C02CC8(uint64_t a1)
{
  char **p_name;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  id v31;
  double v32;
  void *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  id v43;
  double v44;
  id v45;
  void *v46;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  float v53;
  float v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;

  p_name = &stru_24D0D4FF8.name;
  v3 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  v4 = v3;
  v57 = MEMORY[0x24BEE4AF8];
  v52 = *(_QWORD *)(a1 + 16);
  if (!v52)
  {
    v45 = v3;
    goto LABEL_41;
  }
  v51 = a1 + 32;
  v50 = type metadata accessor for PADFacePoseRequest();
  v5 = v4;
  swift_bridgeObjectRetain();
  v6 = 0;
  v48 = v4;
  do
  {
    v7 = v51 + 32 * v6;
    v8 = *(_QWORD *)v7;
    v9 = *(unsigned int *)(v7 + 8);
    v10 = *(unsigned int *)(v7 + 12);
    v12 = *(_QWORD *)(v7 + 16);
    v11 = *(_QWORD *)(v7 + 24);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D28FE8);
    v13 = sub_213C12630();
    if (!*(_QWORD *)(v11 + 16) || (v15 = sub_213C0DF08(v13, v14), (v16 & 1) == 0))
    {
      swift_bridgeObjectRelease();
      v55 = 0u;
      v56 = 0u;
LABEL_4:
      sub_213BF281C((uint64_t)&v55);
LABEL_5:
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    v17 = *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v15);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    if (*(_QWORD *)(v17 + 16))
    {
      sub_213BECBD4(v17 + 32, (uint64_t)&v55);
    }
    else
    {
      v55 = 0u;
      v56 = 0u;
    }
    swift_bridgeObjectRelease();
    if (!*((_QWORD *)&v56 + 1))
      goto LABEL_4;
    if ((swift_dynamicCast() & 1) == 0)
      goto LABEL_5;
    v18 = objc_msgSend(objc_allocWithZone((Class)PADAlgorithmFacePoseInput), p_name[403]);
    objc_msgSend(v18, sel_setPitch_, v53);
    objc_msgSend(v18, sel_setYaw_, *((float *)&v50 + 1));
    objc_msgSend(v18, sel_setRoll_, *(float *)&v50);
    objc_msgSend(v18, sel_setSmile_, v54);
    v19 = v9 | (v10 << 32);
    v20 = v18;
    v21 = (void *)sub_213C03CD8(v8, v19, v12, v11, (uint64_t (*)(void))sub_213C076AC);
    if (v21)
    {
      v49 = v19;
      v22 = v21;
      v23 = objc_msgSend(v22, sel_landmarks);
      if (v23)
      {
        v24 = v23;
        v25 = objc_msgSend(v23, sel_allPoints);

        if (v25)
        {
          v26 = sub_213BDBD18();

          v27 = *((_QWORD *)v26 + 2);
          if (v27)
          {
            *(_QWORD *)&v55 = MEMORY[0x24BEE4AF8];
            sub_213C128D0();
            v28 = 0;
            do
            {
              v29 = v28 + 1;
              v30 = *(_DWORD *)&v26[4 * v28 + 32];
              v31 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
              LODWORD(v32) = v30;
              objc_msgSend(v31, sel_initWithFloat_, v32);
              sub_213C128B8();
              sub_213C128DC();
              sub_213C128E8();
              sub_213C128C4();
              v28 = v29;
            }
            while (v27 != v29);
            swift_bridgeObjectRelease();
            v4 = v48;
            p_name = (char **)(&stru_24D0D4FF8 + 8);
          }
          else
          {
            swift_bridgeObjectRelease();
            p_name = (char **)(&stru_24D0D4FF8 + 8);
          }
          sub_213BF1DCC(0, &qword_254D27C38);
          v25 = (id)sub_213C12684();
          swift_bridgeObjectRelease();
        }
        else
        {

        }
      }
      else
      {

        v25 = 0;
      }
      v19 = v49;
      objc_msgSend(v20, sel_setLandmarks_, v25);

    }
    v33 = (void *)sub_213C03CD8(v8, v19, v12, v11, (uint64_t (*)(void))sub_213C07550);
    swift_bridgeObjectRelease();
    v34 = v20;
    v35 = 0x24BDD1000uLL;
    if (v33)
    {
      v36 = v20;
      v37 = sub_213BFD92C(v33);
      if (v37)
      {
        v38 = v37;
        v39 = *(_QWORD *)(v37 + 16);
        if (v39)
        {
          *(_QWORD *)&v55 = MEMORY[0x24BEE4AF8];
          sub_213C128D0();
          v40 = 0;
          do
          {
            v41 = v40 + 1;
            v42 = *(_DWORD *)(v38 + 4 * v40 + 32);
            v43 = objc_allocWithZone(*(Class *)(v35 + 1760));
            LODWORD(v44) = v42;
            objc_msgSend(v43, sel_initWithFloat_, v44);
            sub_213C128B8();
            sub_213C128DC();
            v35 = 0x24BDD1000;
            sub_213C128E8();
            sub_213C128C4();
            v40 = v41;
          }
          while (v39 != v41);
          swift_bridgeObjectRelease();
          p_name = (char **)(&stru_24D0D4FF8 + 8);
          v4 = v48;
        }
        else
        {
          swift_bridgeObjectRelease();
        }
        v20 = v36;
        sub_213BF1DCC(0, &qword_254D27C38);
        v34 = (void *)sub_213C12684();
        swift_bridgeObjectRelease();
      }
      else
      {
        v34 = 0;
      }
      objc_msgSend(v20, sel_setFaceprint_, v34);

    }
    MEMORY[0x2199BE778]();
    if (*(_QWORD *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_213C126B4();
    sub_213C126CC();
    sub_213C126A8();
LABEL_6:
    ++v6;
  }
  while (v6 != v52);
  swift_bridgeObjectRelease();
LABEL_41:
  swift_bridgeObjectRelease();
  sub_213BF1DCC(0, &qword_254D28FF0);
  v46 = (void *)sub_213C12684();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setFacePoseValues_, v46);

  return v4;
}

uint64_t sub_213C032C8(uint64_t a1, unint64_t a2)
{
  return sub_213C0331C(a1, a2, (SEL *)&selRef_processFacePoseInput_gesture_error_);
}

uint64_t sub_213C0331C(uint64_t a1, unint64_t a2, SEL *a3)
{
  uint64_t v3;
  uint64_t v5;
  _QWORD *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t result;
  id v17[3];

  v5 = v3;
  v17[2] = *(id *)MEMORY[0x24BDAC8D0];
  if (a2 == 9 || a2 == 4)
    v7 = (_QWORD *)(v3 + 104);
  else
    v7 = (_QWORD *)(v3 + 96);
  if (*(_QWORD *)(a1 + 16) < *v7)
  {
    sub_213C1287C();
    sub_213C12648();
    v8 = (id)MEMORY[0x24BEE17D8];
    sub_213C129FC();
    sub_213C12648();
    swift_bridgeObjectRelease();
    sub_213C12648();
    sub_213C129FC();
    sub_213C12648();
    swift_bridgeObjectRelease();
    sub_213C12648();
    sub_213BFC6D4(0, 0xE000000000000000, 0, -5, 0);
    swift_bridgeObjectRelease();
    swift_willThrow();
    return (uint64_t)v8;
  }
  sub_213BF1DCC(0, &qword_254D28FD8);
  v9 = swift_bridgeObjectRetain();
  v10 = sub_213C02CC8(v9);
  if (a2 < 6 || a2 - 8 < 3)
  {
    v11 = *(void **)(v5 + 16);
    v17[0] = 0;
    v12 = objc_msgSend(v11, *a3, v10, a2, v17);
    v8 = v17[0];
    if (v12)
    {
      v13 = v12;
      v14 = v17[0];
      v8 = (id)sub_213C03D98(v13);
    }
    else
    {
      v15 = v17[0];
      sub_213C1248C();

      swift_willThrow();
    }

    return (uint64_t)v8;
  }
  result = sub_213C12A20();
  __break(1u);
  return result;
}

void sub_213C035B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  id v16;
  double v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28[3];

  v28[2] = *(id *)MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a2 + 16);
  if (!v3)
  {
    v7 = 0xD00000000000003BLL;
    v8 = "ID matching frame faceprints must contain at least 1 value.";
LABEL_10:
    sub_213BFC6D4(v7, (unint64_t)(v8 - 32) | 0x8000000000000000, 0, -1, 0);
LABEL_12:
    swift_willThrow();
    return;
  }
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
    v7 = 0xD000000000000034;
    v8 = "Selfie Faceprint must contain at least one dimension";
    goto LABEL_10;
  }
  v26 = a2 + 32;
  if (*(_QWORD *)(*(_QWORD *)(a2 + 32) + 16) != v4)
  {
LABEL_11:
    v28[0] = 0;
    v28[1] = (id)0xE000000000000000;
    sub_213C1287C();
    sub_213C12648();
    sub_213C129FC();
    sub_213C12648();
    swift_bridgeObjectRelease();
    sub_213C12648();
    sub_213BFC6D4(0, 0xE000000000000000, 0, -1, 0);
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  v5 = 0;
  while (v3 - 1 != v5)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a2 + 40 + 8 * v5++) + 16);
    if (v6 != v4)
      goto LABEL_11;
  }
  v28[0] = (id)MEMORY[0x24BEE4AF8];
  sub_213C0D55C(0, v3, 0);
  v9 = 0;
  v10 = v28[0];
  v25 = v3;
  do
  {
    v11 = *(_QWORD *)(v26 + 8 * v9);
    v12 = *(_QWORD *)(v11 + 16);
    if (v12)
    {
      v27 = MEMORY[0x24BEE4AF8];
      swift_bridgeObjectRetain();
      sub_213C128D0();
      v13 = 0;
      do
      {
        v14 = v13 + 1;
        v15 = *(_DWORD *)(v11 + 4 * v13 + 32);
        v16 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
        LODWORD(v17) = v15;
        objc_msgSend(v16, sel_initWithFloat_, v17);
        sub_213C128B8();
        sub_213C128DC();
        sub_213C128E8();
        sub_213C128C4();
        v13 = v14;
      }
      while (v12 != v14);
      v18 = v27;
      swift_bridgeObjectRelease();
      v3 = v25;
    }
    else
    {
      v18 = MEMORY[0x24BEE4AF8];
    }
    v28[0] = v10;
    v20 = v10[2];
    v19 = v10[3];
    if (v20 >= v19 >> 1)
    {
      sub_213C0D55C(v19 > 1, v20 + 1, 1);
      v10 = v28[0];
    }
    ++v9;
    v10[2] = v20 + 1;
    v10[v20 + 4] = v18;
  }
  while (v9 != v3);
  sub_213C03990(a1);
  v21 = *(void **)(v2 + 16);
  sub_213BF1DCC(0, &qword_254D27C38);
  v22 = (void *)sub_213C12684();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D27FC0);
  v23 = (void *)sub_213C12684();
  swift_bridgeObjectRelease();
  v28[0] = 0;
  objc_msgSend(v21, sel_performIDMatching_toFaceprints_error_, v22, v23, v28);

  if (v28[0])
  {
    v28[0];
    goto LABEL_12;
  }
}

uint64_t sub_213C03990(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int *v4;
  int v5;
  id v6;
  double v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v8 = MEMORY[0x24BEE4AF8];
    sub_213C128D0();
    v4 = (int *)(a1 + 32);
    do
    {
      v5 = *v4++;
      v6 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
      LODWORD(v7) = v5;
      objc_msgSend(v6, sel_initWithFloat_, v7);
      sub_213C128B8();
      sub_213C128DC();
      sub_213C128E8();
      sub_213C128C4();
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_213C03A5C(uint64_t a1, char a2)
{
  uint64_t v2;
  void *v4;
  char v5;
  id v7;
  char v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v9[0] = 0xBFF0000000000000;
  v8 = 0;
  v4 = *(void **)(v2 + 16);
  v7 = 0;
  objc_msgSend(v4, sel_performTA_nccSignal_stitchDetected_isSensitive_error_, a1, v9, &v8, a2 & 1, &v7);
  if (v7)
  {
    v7;
    swift_willThrow();
  }
  else
  {
    v5 = v8;
  }
  return v5 & 1;
}

uint64_t sub_213C03B14(float a1, float a2, float a3, float a4)
{
  uint64_t v4;
  void *v9;
  id v10;
  double v11;
  id v12;
  void *v13;
  id v14;
  double v15;
  id v16;
  id v17;
  double v18;
  id v19;
  id v20;
  double v21;
  id v22;
  id v23;
  id v25[2];

  v25[1] = *(id *)MEMORY[0x24BDAC8D0];
  v9 = *(void **)(v4 + 16);
  v10 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
  *(float *)&v11 = a1;
  v12 = objc_msgSend(v10, sel_initWithFloat_, v11);
  v13 = (void *)sub_213C1272C();
  v14 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
  *(float *)&v15 = a2;
  v16 = objc_msgSend(v14, sel_initWithFloat_, v15);
  v17 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
  *(float *)&v18 = a3;
  v19 = objc_msgSend(v17, sel_initWithFloat_, v18);
  v20 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
  *(float *)&v21 = a4;
  v22 = objc_msgSend(v20, sel_initWithFloat_, v21);
  v25[0] = 0;
  v23 = objc_msgSend(v9, sel_performSC_assessmentTA_assessmentFakePRD_assessmentLivePRD_assessmentID_error_, v12, v13, v16, v19, v22, v25);

  if (v25[0])
  {
    v25[0];
    return swift_willThrow();
  }
  else if (v23 == (id)2)
  {
    return 2;
  }
  else
  {
    return v23 == (id)1;
  }
}

uint64_t sub_213C03C8C()
{
  uint64_t v0;

  swift_weakDestroy();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PADLivenessClassifier()
{
  return objc_opt_self();
}

uint64_t sub_213C03CD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5;
  uint64_t v7;
  __int128 v8;
  __int128 v9;

  v5 = a5();
  if (!v5)
  {
    v8 = 0u;
    v9 = 0u;
    goto LABEL_9;
  }
  if (!*(_QWORD *)(v5 + 16))
  {
    v8 = 0u;
    v9 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  sub_213BECBD4(v5 + 32, (uint64_t)&v8);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v9 + 1))
  {
LABEL_9:
    sub_213BF281C((uint64_t)&v8);
    return 0;
  }
  sub_213BF1DCC(0, (unint64_t *)&unk_254D28D40);
  if (swift_dynamicCast())
    return v7;
  else
    return 0;
}

uint64_t sub_213C03D98(void *a1)
{
  id v1;
  void *v2;
  unint64_t v3;
  unint64_t v4;
  char v5;
  unint64_t v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  int v21;
  int v22;
  unint64_t v23;
  unint64_t v24;
  id v25;
  unint64_t v26;
  uint64_t v27;
  id v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  id v35;
  unint64_t v36;
  unint64_t v37;
  char v38;
  unint64_t v39;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;

  v1 = objc_msgSend(a1, sel_assessment);
  if (v1)
  {
    v2 = v1;
    v3 = (unint64_t)objc_msgSend(v1, sel_integerValue);

  }
  else
  {
    v3 = -1;
  }
  v4 = sub_213BFD000(v3);
  LOBYTE(v6) = v5;
  v7 = objc_msgSend(a1, sel_faceprints);
  sub_213BF1DCC(0, &qword_254D28FE0);
  v8 = sub_213C12690();

  if (v8 >> 62)
    goto LABEL_42;
  v9 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_6:
  v10 = MEMORY[0x24BEE4AF8];
  v39 = v4;
  v38 = v6;
  if (v9)
  {
    v47 = MEMORY[0x24BEE4AF8];
    result = sub_213C0D660(0, v9 & ~(v9 >> 63), 0);
    if ((v9 & 0x8000000000000000) == 0)
    {
      v12 = 0;
      v43 = v9;
      v44 = v8 & 0xC000000000000001;
      v13 = v47;
      v41 = v8 + 32;
      v42 = v8;
      while (1)
      {
        if (v12 == v9)
        {
          __break(1u);
LABEL_41:
          __break(1u);
LABEL_42:
          swift_bridgeObjectRetain();
          v9 = sub_213C12918();
          swift_bridgeObjectRelease();
          goto LABEL_6;
        }
        if (v44)
          v14 = (id)MEMORY[0x2199BE994](v12, v8);
        else
          v14 = *(id *)(v41 + 8 * v12);
        v4 = (unint64_t)v14;
        v15 = objc_msgSend(v14, sel_faceprint);
        sub_213BF1DCC(0, &qword_254D27C38);
        v6 = sub_213C12690();

        if (v6 >> 62)
        {
          swift_bridgeObjectRetain();
          v16 = sub_213C12918();
          swift_bridgeObjectRelease();
          v46 = (id)v4;
          if (!v16)
          {
LABEL_25:
            swift_bridgeObjectRelease();
            v18 = v10;
            goto LABEL_26;
          }
        }
        else
        {
          v16 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
          v46 = (id)v4;
          if (!v16)
            goto LABEL_25;
        }
        v45 = v13;
        sub_213C0D620(0, v16 & ~(v16 >> 63), 0);
        if (v16 < 0)
          goto LABEL_41;
        v17 = 0;
        v18 = v10;
        do
        {
          if ((v6 & 0xC000000000000001) != 0)
            v19 = (id)MEMORY[0x2199BE994](v17, v6);
          else
            v19 = *(id *)(v6 + 8 * v17 + 32);
          v20 = v19;
          objc_msgSend(v19, sel_floatValue);
          v22 = v21;

          v24 = *(_QWORD *)(v10 + 16);
          v23 = *(_QWORD *)(v10 + 24);
          if (v24 >= v23 >> 1)
            sub_213C0D620(v23 > 1, v24 + 1, 1);
          ++v17;
          *(_QWORD *)(v10 + 16) = v24 + 1;
          *(_DWORD *)(v10 + 4 * v24 + 32) = v22;
        }
        while (v16 != v17);
        swift_bridgeObjectRelease();
        v13 = v45;
        v10 = MEMORY[0x24BEE4AF8];
        v8 = v42;
LABEL_26:
        v25 = objc_msgSend(v46, sel_index);

        v6 = *(_QWORD *)(v13 + 16);
        v26 = *(_QWORD *)(v13 + 24);
        v4 = v6 + 1;
        if (v6 >= v26 >> 1)
          sub_213C0D660(v26 > 1, v6 + 1, 1);
        ++v12;
        *(_QWORD *)(v13 + 16) = v4;
        v27 = v13 + 16 * v6;
        *(_QWORD *)(v27 + 32) = v18;
        *(_QWORD *)(v27 + 40) = v25;
        v9 = v43;
        if (v12 == v43)
          goto LABEL_29;
      }
    }
    __break(1u);
    goto LABEL_48;
  }
LABEL_29:
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_isHeadMovementDetected);
  v28 = objc_msgSend(a1, sel_referenceFrameIndices);
  sub_213BF1DCC(0, &qword_254D27C38);
  v29 = sub_213C12690();

  if (v29 >> 62)
  {
    swift_bridgeObjectRetain();
    v30 = sub_213C12918();
    swift_bridgeObjectRelease();
    if (!v30)
      goto LABEL_44;
  }
  else
  {
    v30 = *(_QWORD *)((v29 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v30)
      goto LABEL_44;
  }
  result = sub_213C0D63C(0, v30 & ~(v30 >> 63), 0);
  if (v30 < 0)
  {
LABEL_48:
    __break(1u);
    return result;
  }
  v31 = 0;
  v32 = v10;
  do
  {
    if ((v29 & 0xC000000000000001) != 0)
      v33 = (id)MEMORY[0x2199BE994](v31, v29);
    else
      v33 = *(id *)(v29 + 8 * v31 + 32);
    v34 = v33;
    v35 = objc_msgSend(v33, sel_integerValue);

    v37 = *(_QWORD *)(v32 + 16);
    v36 = *(_QWORD *)(v32 + 24);
    if (v37 >= v36 >> 1)
      sub_213C0D63C(v36 > 1, v37 + 1, 1);
    ++v31;
    *(_QWORD *)(v32 + 16) = v37 + 1;
    *(_QWORD *)(v32 + 8 * v37 + 32) = v35;
  }
  while (v30 != v31);
LABEL_44:
  swift_bridgeObjectRelease();

  if ((v38 & 1) != 0)
    return 3;
  else
    return v39;
}

ValueMetadata *type metadata accessor for PADFaceActionClassifierFaceprintResult()
{
  return &type metadata for PADFaceActionClassifierFaceprintResult;
}

uint64_t sub_213C042E0(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_213C04318
                                                                     + 4 * asc_213C15DB0[a1]))(0xD000000000000010, 0x8000000213C18910);
}

uint64_t sub_213C04318()
{
  return 0x6863746970;
}

uint64_t sub_213C0432C()
{
  return 1819045746;
}

uint64_t sub_213C0433C()
{
  return 7823737;
}

uint64_t sub_213C0434C()
{
  unsigned __int8 *v0;

  return sub_213C042E0(*v0);
}

uint64_t sub_213C04354@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_213C0567C(a1, a2);
  *a3 = result;
  return result;
}

void sub_213C04378(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_213C04384()
{
  sub_213C04594();
  return sub_213C12A8C();
}

uint64_t sub_213C043AC()
{
  sub_213C04594();
  return sub_213C12A98();
}

uint64_t PADPrintReplayAssessment.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D28FF8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v1;
  v8 = v1[1];
  v11 = v1[2];
  v10 = v1[3];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_213C04594();
  sub_213C12A80();
  v14 = v9;
  HIBYTE(v13) = 0;
  sub_213C01670();
  sub_213C129E4();
  if (!v2)
  {
    v14 = v8;
    HIBYTE(v13) = 1;
    sub_213C129E4();
    v14 = v11;
    HIBYTE(v13) = 2;
    sub_213C129E4();
    v14 = v10;
    HIBYTE(v13) = 3;
    sub_213C129E4();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_213C04594()
{
  unint64_t result;

  result = qword_254D29000;
  if (!qword_254D29000)
  {
    result = MEMORY[0x2199BF420](&unk_213C15F5C, &type metadata for PADPrintReplayAssessment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D29000);
  }
  return result;
}

uint64_t PADPrintReplayAssessment.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D29008);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_213C04594();
  sub_213C12A74();
  if (!v2)
  {
    HIBYTE(v14) = 0;
    sub_213C0193C();
    sub_213C1299C();
    v9 = v15;
    HIBYTE(v14) = 1;
    sub_213C1299C();
    v10 = v15;
    HIBYTE(v14) = 2;
    sub_213C1299C();
    v12 = v15;
    HIBYTE(v14) = 3;
    sub_213C1299C();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v13 = v15;
    *a2 = v9;
    a2[1] = v10;
    a2[2] = v12;
    a2[3] = v13;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_213C047E0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return PADPrintReplayAssessment.init(from:)(a1, a2);
}

uint64_t sub_213C047F4(_QWORD *a1)
{
  return PADPrintReplayAssessment.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for PADPrintReplayAssessment()
{
  return &type metadata for PADPrintReplayAssessment;
}

float sub_213C04818()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  double *v7;
  float v8;
  uint64_t v9;
  double v10;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;

  v1 = sub_213C12588();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v5 = *(_QWORD *)(v0 + 128);
  v6 = *(_QWORD *)(v5 + 16);
  if (v6)
  {
    v7 = (double *)(v5 + 32);
    v8 = 0.0;
    v9 = v6;
    do
    {
      v10 = *v7;
      v7 += 4;
      if (*(double *)(*(_QWORD *)(v0 + 120) + 136) < v10)
        v8 = v8 + 1.0;
      --v9;
    }
    while (v9);
    return v8 / (float)v6;
  }
  else
  {
    if (qword_254D27930 != -1)
      swift_once();
    v12 = __swift_project_value_buffer(v1, (uint64_t)qword_254D27938);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v12, v1);
    v13 = sub_213C12570();
    v14 = sub_213C1275C();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      MEMORY[0x2199BF4BC](v15, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    return -1.0;
  }
}

float sub_213C049AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  double *v7;
  float v8;
  uint64_t v9;
  double v10;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;

  v1 = sub_213C12588();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v5 = *(_QWORD *)(v0 + 128);
  v6 = *(_QWORD *)(v5 + 16);
  if (v6)
  {
    v7 = (double *)(v5 + 32);
    v8 = 0.0;
    v9 = v6;
    do
    {
      v10 = *v7;
      v7 += 4;
      if (v10 < *(double *)(*(_QWORD *)(v0 + 120) + 152))
        v8 = v8 + 1.0;
      --v9;
    }
    while (v9);
    return v8 / (float)v6;
  }
  else
  {
    if (qword_254D27930 != -1)
      swift_once();
    v12 = __swift_project_value_buffer(v1, (uint64_t)qword_254D27938);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v12, v1);
    v13 = sub_213C12570();
    v14 = sub_213C1275C();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      MEMORY[0x2199BF4BC](v15, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    return -1.0;
  }
}

BOOL sub_213C04B40(char *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v2 = sub_213C12588();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = &a1[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_faces];
  swift_beginAccess();
  if (*(_QWORD *)v6 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_213C12918();
    swift_bridgeObjectRelease();
    if (v7 == 1)
      return v7 == 1;
  }
  else
  {
    v7 = *(_QWORD *)((*(_QWORD *)v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v7 == 1)
      return v7 == 1;
  }
  if (qword_254D27930 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v2, (uint64_t)qword_254D27938);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v8, v2);
  v9 = a1;
  v10 = sub_213C12570();
  v11 = sub_213C1275C();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v12 = 134217984;
    v13 = *(_QWORD *)v6;
    if (v13 >> 62)
    {
      v18 = v3;
      swift_bridgeObjectRetain();
      v16 = sub_213C12918();
      swift_bridgeObjectRelease();
      v14 = v16;
      v3 = v18;
    }
    else
    {
      v14 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v19 = v14;
    sub_213C127F8();

    _os_log_impl(&dword_213BCD000, v10, v11, "Found %ld faces in the frame. Skipping PRD.", v12, 0xCu);
    MEMORY[0x2199BF4BC](v12, -1, -1);
  }
  else
  {

    v10 = v9;
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v7 == 1;
}

uint64_t sub_213C04D88(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_time + 16);
  *(_OWORD *)(v1 + 136) = *(_OWORD *)(a1 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_time);
  *(_QWORD *)(v1 + 152) = v2;
  *(_BYTE *)(v1 + 160) = 0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D28D60);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_213C15FB0;
  swift_weakLoadStrong();
  v4 = type metadata accessor for PADFacePoseRequest();
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 24) = 0u;
  *(_OWORD *)(v5 + 40) = 0u;
  *(_BYTE *)(v5 + 56) = 1;
  swift_weakInit();
  swift_weakAssign();
  swift_release();
  *(_QWORD *)(v3 + 56) = v4;
  *(_QWORD *)(v3 + 64) = &off_24D0D0040;
  *(_QWORD *)(v3 + 32) = v5;
  swift_weakLoadStrong();
  v6 = type metadata accessor for PADPrintReplayRequest();
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 24) = xmmword_213C15FC0;
  swift_weakInit();
  swift_weakAssign();
  swift_release();
  *(_QWORD *)(v3 + 96) = v6;
  *(_QWORD *)(v3 + 104) = &off_24D0D0040;
  *(_QWORD *)(v3 + 72) = v7;
  return v3;
}

uint64_t sub_213C04EC8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[3];
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[24];
  uint64_t v10;

  swift_beginAccess();
  sub_213C057F8(v1 + 168, (uint64_t)v9);
  if (!v10)
    return sub_213BE4088((uint64_t)v9, &qword_254D27CD0);
  sub_213BE2DA4((uint64_t)v9, (uint64_t)v6);
  sub_213BE4088((uint64_t)v9, &qword_254D27CD0);
  v3 = v7;
  v4 = v8;
  __swift_project_boxed_opaque_existential_1(v6, v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 8))(a1, v3, v4);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
}

void sub_213C04F80(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  float v32;
  _QWORD *v33;
  _QWORD *v34;
  char isUniquelyReferenced_nonNull_native;
  double v36;
  unint64_t v37;
  unint64_t v38;
  double *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;

  v2 = v1;
  v4 = sub_213C12588();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v40 - v9;
  swift_beginAccess();
  sub_213C057F8(v1 + 168, (uint64_t)&v44);
  if (*((_QWORD *)&v45 + 1))
  {
    sub_213BE2DA4((uint64_t)&v44, (uint64_t)&v40);
    sub_213BE4088((uint64_t)&v44, &qword_254D27CD0);
    v11 = v42;
    v12 = v43;
    __swift_project_boxed_opaque_existential_1(&v40, v42);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v12 + 8))(0, v11, v12);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v40);
    v13 = a1[2];
    if (!v13)
      goto LABEL_9;
  }
  else
  {
    sub_213BE4088((uint64_t)&v44, &qword_254D27CD0);
    v13 = a1[2];
    if (!v13)
    {
LABEL_9:
      if (qword_254D27930 != -1)
        swift_once();
      v20 = __swift_project_value_buffer(v4, (uint64_t)qword_254D27938);
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v20, v4);
      swift_bridgeObjectRetain();
      v21 = sub_213C12570();
      v22 = sub_213C1275C();
      if (os_log_type_enabled(v21, v22))
      {
        v23 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v23 = 134217984;
        *(_QWORD *)&v44 = v13;
        sub_213C127F8();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_213BCD000, v21, v22, "Received unexpected number of PRD results: %ld. Expected 1.", v23, 0xCu);
        MEMORY[0x2199BF4BC](v23, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease();
      }
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
      return;
    }
  }
  if (v13 != 1)
    goto LABEL_9;
  v15 = a1[6];
  v14 = a1[7];
  v18 = a1 + 4;
  v16 = a1[4];
  v17 = v18[1];
  swift_bridgeObjectRetain();
  v19 = sub_213C075F8(v16, v17, v15, v14);
  if (v19)
  {
    if (*(_QWORD *)(v19 + 16))
    {
      sub_213BECBD4(v19 + 32, (uint64_t)&v44);
    }
    else
    {
      v44 = 0u;
      v45 = 0u;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v44 = 0u;
    v45 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v45 + 1))
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v24 = v41;
      if (v41)
      {
        v25 = *(double *)&v41[OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_pitch];
        v26 = *(double *)&v41[OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_roll];
        v27 = *(double *)&v41[OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_yaw];
      }
      else
      {
        v27 = -1.0;
        v25 = -1.0;
        v26 = -1.0;
      }
      v32 = *(float *)&v40;
      v33 = (_QWORD *)(v2 + 128);
      swift_beginAccess();
      v34 = *(_QWORD **)(v2 + 128);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(_QWORD *)(v2 + 128) = v34;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v34 = sub_213BEAB78(0, v34[2] + 1, 1, v34);
        *v33 = v34;
      }
      v36 = v32;
      v38 = v34[2];
      v37 = v34[3];
      if (v38 >= v37 >> 1)
      {
        v34 = sub_213BEAB78((_QWORD *)(v37 > 1), v38 + 1, 1, v34);
        *v33 = v34;
      }
      v34[2] = v38 + 1;
      v39 = (double *)&v34[4 * v38];
      v39[4] = v36;
      v39[5] = v25;
      v39[6] = v26;
      v39[7] = v27;
      swift_endAccess();

      return;
    }
  }
  else
  {
    sub_213BE4088((uint64_t)&v44, &qword_254D27FD8);
  }
  if (qword_254D27930 != -1)
    swift_once();
  v28 = __swift_project_value_buffer(v4, (uint64_t)qword_254D27938);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, v28, v4);
  v29 = sub_213C12570();
  v30 = sub_213C1275C();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v31 = 0;
    _os_log_impl(&dword_213BCD000, v29, v30, "PADPrintReplayRequest did not generate an observation for the current frame.", v31, 2u);
    MEMORY[0x2199BF4BC](v31, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
}

uint64_t sub_213C0544C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return sub_213BE4088(v0 + 168, &qword_254D27CD0);
}

uint64_t sub_213C05474()
{
  uint64_t v0;

  v0 = sub_213BFC240();
  swift_bridgeObjectRelease();
  sub_213BE4088(v0 + 168, &qword_254D27CD0);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PADPrintReplayController()
{
  return objc_opt_self();
}

uint64_t storeEnumTagSinglePayload for PADPrintReplayAssessment.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_213C05524 + 4 * byte_213C15DB9[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_213C05558 + 4 * byte_213C15DB4[v4]))();
}

uint64_t sub_213C05558(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_213C05560(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x213C05568);
  return result;
}

uint64_t sub_213C05574(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x213C0557CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_213C05580(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_213C05588(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PADPrintReplayAssessment.CodingKeys()
{
  return &type metadata for PADPrintReplayAssessment.CodingKeys;
}

unint64_t sub_213C055A8()
{
  unint64_t result;

  result = qword_254D292A8;
  if (!qword_254D292A8)
  {
    result = MEMORY[0x2199BF420](&unk_213C15F34, &type metadata for PADPrintReplayAssessment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D292A8);
  }
  return result;
}

unint64_t sub_213C055F0()
{
  unint64_t result;

  result = qword_254D292B0;
  if (!qword_254D292B0)
  {
    result = MEMORY[0x2199BF420](&unk_213C15EA4, &type metadata for PADPrintReplayAssessment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D292B0);
  }
  return result;
}

unint64_t sub_213C05638()
{
  unint64_t result;

  result = qword_254D292B8;
  if (!qword_254D292B8)
  {
    result = MEMORY[0x2199BF420]("ݯK9|[", &type metadata for PADPrintReplayAssessment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D292B8);
  }
  return result;
}

uint64_t sub_213C0567C(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000010 && a2 == 0x8000000213C18910 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6863746970 && a2 == 0xE500000000000000 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1819045746 && a2 == 0xE400000000000000 || (sub_213C12A14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 7823737 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v5 = sub_213C12A14();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_213C057F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D27CD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_213C05840(uint64_t a1)
{
  return sub_213C05BF8(a1, &qword_254D281F8);
}

unint64_t sub_213C0584C(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D292E8);
  v2 = sub_213C1293C();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_213BF1E04(v6, (uint64_t)&v15, &qword_254D292F0);
    v7 = v15;
    v8 = v16;
    result = sub_213C0DF08(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_213BF1CC8(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_213C05980(uint64_t a1)
{
  return sub_213C05AD0(a1, &qword_254D292F8, (uint64_t *)&unk_254D29300, (uint64_t (*)(uint64_t))sub_213C0DF9C);
}

unint64_t sub_213C0599C(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D292D0);
  v2 = (_QWORD *)sub_213C1293C();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v5 = *(v4 - 2);
    v6 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_213C0DF08(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_213C05AB4(uint64_t a1)
{
  return sub_213C05AD0(a1, &qword_254D292D8, &qword_254D292E0, (uint64_t (*)(uint64_t))sub_213C0DF9C);
}

unint64_t sub_213C05AD0(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t result;
  char v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;

  if (!*(_QWORD *)(a1 + 16))
  {
    v8 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v7 = sub_213C1293C();
  v8 = (_QWORD *)v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  v10 = v7 + 64;
  v11 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_213BF1E04(v11, (uint64_t)&v18, a3);
    v12 = v18;
    result = a4(v18);
    if ((v14 & 1) != 0)
      break;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v8[6] + 8 * result) = v12;
    result = (unint64_t)sub_213BF1CC8(&v19, (_OWORD *)(v8[7] + 32 * result));
    v15 = v8[2];
    v16 = __OFADD__(v15, 1);
    v17 = v15 + 1;
    if (v16)
      goto LABEL_11;
    v8[2] = v17;
    v11 += 40;
    if (!--v9)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_213C05BF8(uint64_t a1, uint64_t *a2)
{
  _QWORD *v3;
  uint64_t v4;
  void **v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  unint64_t result;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v3 = (_QWORD *)sub_213C1293C();
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  v5 = (void **)(a1 + 48);
  while (1)
  {
    v6 = (uint64_t)*(v5 - 2);
    v7 = (uint64_t)*(v5 - 1);
    v8 = *v5;
    swift_bridgeObjectRetain();
    v9 = v8;
    result = sub_213C0DF08(v6, v7);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v12 = (uint64_t *)(v3[6] + 16 * result);
    *v12 = v6;
    v12[1] = v7;
    *(_QWORD *)(v3[7] + 8 * result) = v9;
    v13 = v3[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v3[2] = v15;
    v5 += 3;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_213C05D0C(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  uint64_t v4;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;

  v3 = sub_213C05BF8(MEMORY[0x24BEE4AF8], &qword_254D292C8);
  v4 = sub_213C1272C();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_213C06AB8(v4, 0x65727574736567, 0xE700000000000000, isUniquelyReferenced_nonNull_native);
  v6 = v3;
  swift_bridgeObjectRelease();
  v7 = sub_213C1272C();
  v8 = swift_isUniquelyReferenced_nonNull_native();
  sub_213C06AB8(v7, 0x746C75736572, 0xE600000000000000, v8);
  swift_bridgeObjectRelease();
  v9 = sub_213C1272C();
  v10 = swift_isUniquelyReferenced_nonNull_native();
  sub_213C06AB8(v9, 0x6F43726566667562, 0xEB00000000746E75, v10);
  swift_bridgeObjectRelease();
  if (!a2)
  {
    v11 = sub_213C126D8();
    v12 = swift_isUniquelyReferenced_nonNull_native();
    sub_213C06AB8(v11, 0xD00000000000001FLL, 0x8000000213C18980, v12);
    swift_bridgeObjectRelease();
  }
  return v6;
}

id sub_213C05E94(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_213C0749C();
    v4 = (void *)sub_213C125C4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

uint64_t sub_213C05F08(uint64_t a1, char a2)
{
  return sub_213C06524(a1, a2, &qword_254D281F8);
}

uint64_t sub_213C05F14(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  _QWORD *v34;
  _OWORD v35[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D292E8);
  v6 = sub_213C12930();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v34 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v33 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v13 << 6);
      }
      else
      {
        v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33)
          goto LABEL_34;
        v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          v13 = v18 + 1;
          if (v18 + 1 >= v33)
            goto LABEL_34;
          v19 = v34[v13];
          if (!v19)
          {
            v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              v3 = v2;
              if ((a2 & 1) != 0)
              {
                v32 = 1 << *(_BYTE *)(v5 + 32);
                if (v32 >= 64)
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v34 = -1 << v32;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                v13 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_41;
                if (v13 >= v33)
                  goto LABEL_34;
                v19 = v34[v13];
                ++v20;
                if (v19)
                  goto LABEL_21;
              }
            }
            v13 = v20;
          }
        }
LABEL_21:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      v21 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
      v23 = *v21;
      v22 = v21[1];
      v24 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v17);
      if ((a2 & 1) != 0)
      {
        sub_213BF1CC8(v24, v35);
      }
      else
      {
        sub_213BECBD4((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_213C12A50();
      sub_213C1263C();
      result = sub_213C12A68();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      v15 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v14);
      *v15 = v23;
      v15[1] = v22;
      result = (uint64_t)sub_213BF1CC8(v35, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v14));
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_213C06210(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  char v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D292D0);
  v36 = a2;
  v6 = sub_213C12930();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v34)
        goto LABEL_33;
      v23 = *(_QWORD *)(v35 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v34)
              goto LABEL_33;
            v23 = *(_QWORD *)(v35 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_213C12A50();
    sub_213C1263C();
    result = sub_213C12A68();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((v36 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_213C06524(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  int64_t v37;
  uint64_t v38;
  char v39;

  v4 = v3;
  v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v39 = a2;
  v7 = sub_213C12930();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
    goto LABEL_40;
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v38 = v6 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v6 + 64);
  v36 = v3;
  v37 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v37)
      break;
    v23 = (_QWORD *)(v6 + 64);
    v24 = *(_QWORD *)(v38 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v37)
        goto LABEL_33;
      v24 = *(_QWORD *)(v38 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_33:
          swift_release();
          v4 = v36;
          if ((v39 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v37)
              goto LABEL_33;
            v24 = *(_QWORD *)(v38 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v11 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = (uint64_t *)(*(_QWORD *)(v6 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(void **)(*(_QWORD *)(v6 + 56) + 8 * v21);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v34 = v33;
    }
    sub_213C12A50();
    sub_213C1263C();
    result = sub_213C12A68();
    v15 = -1 << *(_BYTE *)(v8 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v18);
    *v19 = v32;
    v19[1] = v31;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v18) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release();
  v4 = v36;
  v23 = (_QWORD *)(v6 + 64);
  if ((v39 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v35 = 1 << *(_BYTE *)(v6 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v6 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v4 = v8;
  return result;
}

_OWORD *sub_213C0682C(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  _OWORD *v19;
  _OWORD *result;
  unint64_t v21;
  char v22;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_213C0DF08(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        v19 = (_OWORD *)(v18[7] + 32 * v12);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
        return sub_213BF1CC8(a1, v19);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_213C06C98();
      goto LABEL_7;
    }
    sub_213C05F14(v15, a4 & 1);
    v21 = sub_213C0DF08(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_213C06C24(v12, a2, a3, a1, v18);
      return (_OWORD *)swift_bridgeObjectRetain();
    }
  }
  result = (_OWORD *)sub_213C12A38();
  __break(1u);
  return result;
}

uint64_t sub_213C0695C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t result;
  unint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v5 = v4;
  v10 = *v4;
  v12 = sub_213C0DF08(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_213C06E7C();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_bridgeObjectRelease();
      *(_QWORD *)(v19 + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v23 = (uint64_t *)(v18[6] + 16 * v12);
    *v23 = a2;
    v23[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v24 = v18[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (!v25)
    {
      v18[2] = v26;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_213C06210(v15, a4 & 1);
  v21 = sub_213C0DF08(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_213C12A38();
  __break(1u);
  return result;
}

void sub_213C06AB8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v5 = v4;
  v10 = *v4;
  v12 = sub_213C0DF08(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_213C07030(&qword_254D292C8);
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];

      *(_QWORD *)(v19 + 8 * v12) = a1;
      return;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v22 = (uint64_t *)(v18[6] + 16 * v12);
    *v22 = a2;
    v22[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v23 = v18[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (!v24)
    {
      v18[2] = v25;
      swift_bridgeObjectRetain();
      return;
    }
    goto LABEL_14;
  }
  sub_213C06524(v15, a4 & 1, &qword_254D292C8);
  v20 = sub_213C0DF08(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    v12 = v20;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_213C12A38();
  __break(1u);
}

_OWORD *sub_213C06C24(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
{
  _QWORD *v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v6 = (_QWORD *)(a5[6] + 16 * a1);
  *v6 = a2;
  v6[1] = a3;
  result = sub_213BF1CC8(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

id sub_213C06C8C()
{
  return sub_213C07030(&qword_254D281F8);
}

void *sub_213C06C98()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  _OWORD v26[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D292E8);
  v2 = *v0;
  v3 = sub_213C12924();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v4;
    return result;
  }
  v25 = v1;
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 32 * v15;
    sub_213BECBD4(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_213BF1CC8(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_213C06E7C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D292D0);
  v2 = *v0;
  v3 = sub_213C12924();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_213C07030(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_213C12924();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v2 = v5;
    return result;
  }
  result = (id)(v4 + 64);
  v7 = v3 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      v10 = v23 + 1;
      if (v23 + 1 >= v14)
        goto LABEL_26;
      v24 = *(_QWORD *)(v7 + 8 * v10);
      if (!v24)
        break;
    }
LABEL_25:
    v13 = (v24 - 1) & v24;
    v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    v17 = 16 * v16;
    v18 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v16);
    v19 = v18[1];
    v20 = 8 * v16;
    v21 = *(void **)(*(_QWORD *)(v3 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v5 + 48) + v17);
    *v22 = *v18;
    v22[1] = v19;
    *(_QWORD *)(*(_QWORD *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    result = v21;
  }
  v25 = v23 + 2;
  if (v25 >= v14)
    goto LABEL_26;
  v24 = *(_QWORD *)(v7 + 8 * v25);
  if (v24)
  {
    v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v10);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void sub_213C071D8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD aBlock[6];

  v8 = sub_213C12588();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_254D27930 != -1)
    swift_once();
  v12 = __swift_project_value_buffer(v8, (uint64_t)qword_254D27938);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  v13 = sub_213C12570();
  v14 = sub_213C12750();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = swift_slowAlloc();
    *(_DWORD *)v15 = 134218752;
    v20 = a1;
    aBlock[0] = a1;
    sub_213C127F8();
    *(_WORD *)(v15 + 12) = 2048;
    aBlock[0] = a2;
    sub_213C127F8();
    *(_WORD *)(v15 + 22) = 2048;
    aBlock[0] = a3;
    a1 = v20;
    sub_213C127F8();
    *(_WORD *)(v15 + 32) = 1024;
    LODWORD(aBlock[0]) = a4 & 1;
    sub_213C127F8();
    _os_log_impl(&dword_213BCD000, v13, v14, "PADAnalytics.sendGestureCompleteEvent gesture = %ld, result = %ld, bufferCount = %ld, wasSkippedWithAccessibility = %{BOOL}d", (uint8_t *)v15, 0x26u);
    MEMORY[0x2199BF4BC](v15, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v16 = (void *)sub_213C125E8();
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a1;
  *(_QWORD *)(v17 + 24) = a2;
  *(_QWORD *)(v17 + 32) = a3;
  *(_BYTE *)(v17 + 40) = a4 & 1;
  aBlock[4] = sub_213C07474;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_213C05E94;
  aBlock[3] = &block_descriptor_4;
  v18 = _Block_copy(aBlock);
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v18);

}

uint64_t sub_213C07464()
{
  return swift_deallocObject();
}

unint64_t sub_213C07474()
{
  uint64_t v0;

  return sub_213C05D0C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

unint64_t sub_213C0749C()
{
  unint64_t result;

  result = qword_254D292C0;
  if (!qword_254D292C0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254D292C0);
  }
  return result;
}

uint64_t sub_213C074D8(void *a1, uint64_t a2, void (*a3)(_QWORD *, uint64_t))
{
  id v6;
  _QWORD v8[5];

  v8[3] = sub_213BF1DCC(0, &qword_254D28D80);
  v8[4] = &off_24D0D0028;
  v8[0] = a1;
  v6 = a1;
  a3(v8, a2);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

uint64_t sub_213C07550(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_213C0756C(a1, a2, a3, a4, (unint64_t *)&unk_254D28D70, 0x24BDF9B38, &qword_254D29890);
}

uint64_t sub_213C0756C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t *a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;

  sub_213BF1DCC(0, a5);
  __swift_instantiateConcreteTypeFromMangledName(a7);
  v9 = sub_213C12630();
  if (*(_QWORD *)(a4 + 16) && (v11 = sub_213C0DF08(v9, v10), (v12 & 1) != 0))
  {
    v13 = *(_QWORD *)(*(_QWORD *)(a4 + 56) + 8 * v11);
    swift_bridgeObjectRetain();
  }
  else
  {
    v13 = 0;
  }
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t sub_213C075F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_213C0760C(a1, a2, a3, a4, (void (*)(_QWORD))type metadata accessor for PADPrintReplayRequest, &qword_254D29898);
}

uint64_t sub_213C0760C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(_QWORD), uint64_t *a6)
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;

  a5(0);
  __swift_instantiateConcreteTypeFromMangledName(a6);
  v8 = sub_213C12630();
  if (*(_QWORD *)(a4 + 16) && (v10 = sub_213C0DF08(v8, v9), (v11 & 1) != 0))
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a4 + 56) + 8 * v10);
    swift_bridgeObjectRetain();
  }
  else
  {
    v12 = 0;
  }
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_213C07690(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_213C0756C(a1, a2, a3, a4, &qword_254D298D0, 0x24BDF9AF8, &qword_254D298D8);
}

uint64_t sub_213C076AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_213C0756C(a1, a2, a3, a4, (unint64_t *)&unk_254D29870, 0x24BDF9B68, &qword_254D298C8);
}

uint64_t PADFaceActionMode.description.getter()
{
  _BYTE *v0;
  unint64_t v1;

  v1 = 0xD000000000000016;
  if (*v0 != 1)
    v1 = 0x646573756170;
  if (*v0)
    return v1;
  else
    return 0x6547746365746564;
}

CoreIDVPAD::PADFaceActionMode_optional __swiftcall PADFaceActionMode.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 3;
  if ((unint64_t)rawValue < 3)
    v2 = rawValue;
  *v1 = v2;
  return (CoreIDVPAD::PADFaceActionMode_optional)rawValue;
}

uint64_t PADFaceActionMode.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

unint64_t sub_213C07750()
{
  unint64_t result;

  result = qword_254D29310;
  if (!qword_254D29310)
  {
    result = MEMORY[0x2199BF420](&protocol conformance descriptor for PADFaceActionMode, &type metadata for PADFaceActionMode);
    atomic_store(result, (unint64_t *)&qword_254D29310);
  }
  return result;
}

CoreIDVPAD::PADFaceActionMode_optional sub_213C07794(Swift::Int *a1)
{
  return PADFaceActionMode.init(rawValue:)(*a1);
}

uint64_t storeEnumTagSinglePayload for PADFaceActionMode(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_213C077EC + 4 * byte_213C15FE5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_213C07820 + 4 * byte_213C15FE0[v4]))();
}

uint64_t sub_213C07820(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_213C07828(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x213C07830);
  return result;
}

uint64_t sub_213C0783C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x213C07844);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_213C07848(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_213C07850(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PADFaceActionMode()
{
  return &type metadata for PADFaceActionMode;
}

uint64_t sub_213C0786C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 264);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    swift_bridgeObjectRetain();
    v3 = 0;
    v4 = MEMORY[0x24BEE4AF8];
    do
    {
      if (*(_QWORD *)(v1 + 8 * v3 + 32) == 1)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          sub_213C0D4C4(0, *(_QWORD *)(v4 + 16) + 1, 1);
        v6 = *(_QWORD *)(v4 + 16);
        v5 = *(_QWORD *)(v4 + 24);
        if (v6 >= v5 >> 1)
          sub_213C0D4C4(v5 > 1, v6 + 1, 1);
        *(_QWORD *)(v4 + 16) = v6 + 1;
        *(_QWORD *)(v4 + 8 * v6 + 32) = 1;
      }
      ++v3;
    }
    while (v2 != v3);
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = MEMORY[0x24BEE4AF8];
  }
  v7 = *(_QWORD *)(v4 + 16);
  swift_release();
  return v7;
}

uint64_t sub_213C0798C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v19;
  uint64_t v20;

  v3 = v2;
  v3[18] = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v3[19] = a2;
  v6 = *(_QWORD *)(a1 + 16);
  v7 = MEMORY[0x24BEE4AF8];
  if (v6)
  {
    v20 = MEMORY[0x24BEE4AF8];
    sub_213C0D514(0, v6, 0);
    v8 = v20;
    v9 = *(_QWORD *)(v20 + 16);
    v10 = v6;
    do
    {
      v11 = *(_QWORD *)(v20 + 24);
      if (v9 >= v11 >> 1)
        sub_213C0D514(v11 > 1, v9 + 1, 1);
      *(_QWORD *)(v20 + 16) = v9 + 1;
      *(_QWORD *)(v20 + 8 * v9++ + 32) = v7;
      --v10;
    }
    while (v10);
  }
  else
  {
    v8 = MEMORY[0x24BEE4AF8];
  }
  swift_beginAccess();
  v3[34] = v8;
  swift_bridgeObjectRelease();
  v12 = v3[34];
  swift_beginAccess();
  v3[35] = v12;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v13 = v3[34];
  swift_beginAccess();
  v3[36] = v13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14 = MEMORY[0x24BEE4AF8];
  if (v6)
  {
    v19 = MEMORY[0x24BEE4AF8];
    sub_213C0D4E8(0, v6, 0);
    v15 = v19;
    v16 = *(_QWORD *)(v19 + 16);
    do
    {
      v17 = *(_QWORD *)(v19 + 24);
      if (v16 >= v17 >> 1)
        sub_213C0D4E8(v17 > 1, v16 + 1, 1);
      *(_QWORD *)(v19 + 16) = v16 + 1;
      *(_QWORD *)(v19 + 8 * v16++ + 32) = v14;
      --v6;
    }
    while (v6);
  }
  else
  {
    v15 = MEMORY[0x24BEE4AF8];
  }
  swift_beginAccess();
  v3[37] = v15;
  swift_bridgeObjectRelease();
  return sub_213C0ACBC();
}

uint64_t sub_213C07B98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t result;
  uint64_t v11;

  v1 = v0;
  v2 = sub_213C12588();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_254D27930 != -1)
    swift_once();
  v6 = __swift_project_value_buffer(v2, (uint64_t)qword_254D27938);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = sub_213C12570();
  v8 = sub_213C12750();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_213BCD000, v7, v8, "FAC Module: AX has been enabled", v9, 2u);
    MEMORY[0x2199BF4BC](v9, -1, -1);
  }

  result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(_BYTE *)(v1 + 257) = 1;
  return result;
}

void sub_213C07CD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  int v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;

  v1 = v0;
  v2 = sub_213C12588();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v6 = *(_QWORD *)(v0 + 160);
  v7 = *(_QWORD *)(v0 + 144);
  v8 = *(id *)(v0 + 168);
  swift_bridgeObjectRetain();
  sub_213C127A4();
  sub_213C127B0();
  if ((v6 & 0x8000000000000000) != 0 || v6 >= *(_QWORD *)(v7 + 16))
  {

    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = *(_QWORD *)(v7 + 8 * v6 + 32);

    swift_bridgeObjectRelease();
    if (v9 != 10)
    {
      v10 = *(unsigned __int8 *)(v1 + 257);
      *(_BYTE *)(v1 + 258) = v10;
      if (v10 != 1)
      {
LABEL_18:
        sub_213C0AFF0(0, MEMORY[0x24BEE4AF8]);
        return;
      }
      v11 = *(_QWORD *)(v1 + 160);
      v12 = *(_QWORD *)(v1 + 144);
      v13 = *(id *)(v1 + 168);
      swift_bridgeObjectRetain();
      sub_213C127A4();
      sub_213C127B0();
      if ((v11 & 0x8000000000000000) != 0 || v11 >= *(_QWORD *)(v12 + 16))
      {

        swift_bridgeObjectRelease();
      }
      else
      {
        v14 = *(_QWORD *)(v12 + 8 * v11 + 32);

        swift_bridgeObjectRelease();
        if (v14 < 0xA)
        {
          v15 = qword_213C161F0[v14];
LABEL_17:
          swift_beginAccess();
          sub_213C0E344(&v21, v15);
          swift_endAccess();
          goto LABEL_18;
        }
      }
      v15 = 3;
      goto LABEL_17;
    }
  }
  if (qword_254D27930 != -1)
    swift_once();
  v16 = __swift_project_value_buffer(v2, (uint64_t)qword_254D27938);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v16, v2);
  v17 = sub_213C12570();
  v18 = sub_213C12750();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_213BCD000, v17, v18, "Requested to skip gesture, but no gesture is being monitored currently.", v19, 2u);
    MEMORY[0x2199BF4BC](v19, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_213C07F48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;

  v1 = v0;
  v2 = sub_213C12588();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v22 - v7;
  swift_beginAccess();
  v9 = *(_QWORD *)(v0 + 160);
  v10 = *(_QWORD *)(v0 + 144);
  v11 = *(id *)(v0 + 168);
  swift_bridgeObjectRetain();
  sub_213C127A4();
  sub_213C127B0();
  if ((v9 & 0x8000000000000000) != 0 || v9 >= *(_QWORD *)(v10 + 16))
  {

    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = *(_QWORD *)(v10 + 8 * v9 + 32);

    swift_bridgeObjectRelease();
    if (v12 != 10)
    {
      *(_BYTE *)(v1 + 256) = 2;
      if (qword_254D27930 != -1)
        swift_once();
      v13 = __swift_project_value_buffer(v2, (uint64_t)qword_254D27938);
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, v13, v2);
      v14 = sub_213C12570();
      v15 = sub_213C12750();
      if (os_log_type_enabled(v14, v15))
      {
        v16 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_213BCD000, v14, v15, "Invaliding current FAC buffer", v16, 2u);
        MEMORY[0x2199BF4BC](v16, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
      sub_213C0AC04();
      swift_bridgeObjectRelease();
      sub_213C0F014(MEMORY[0x24BEE4AF8]);
      return sub_213BFBF24();
    }
  }
  if (qword_254D27930 != -1)
    swift_once();
  v18 = __swift_project_value_buffer(v2, (uint64_t)qword_254D27938);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v18, v2);
  v19 = sub_213C12570();
  v20 = sub_213C12750();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_213BCD000, v19, v20, "Requested to pause gesture detection, but no gesture is being monitored currently.", v21, 2u);
    MEMORY[0x2199BF4BC](v21, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

uint64_t sub_213C08204()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;

  v1 = v0;
  v2 = sub_213C12588();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v22 - v7;
  swift_beginAccess();
  v9 = *(_QWORD *)(v0 + 160);
  v10 = *(_QWORD *)(v0 + 144);
  v11 = *(id *)(v0 + 168);
  swift_bridgeObjectRetain();
  sub_213C127A4();
  sub_213C127B0();
  if ((v9 & 0x8000000000000000) != 0 || v9 >= *(_QWORD *)(v10 + 16))
  {

    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = *(_QWORD *)(v10 + 8 * v9 + 32);

    swift_bridgeObjectRelease();
    if (v12 != 10)
    {
      *(_BYTE *)(v1 + 256) = 1;
      if (qword_254D27930 != -1)
        swift_once();
      v13 = __swift_project_value_buffer(v2, (uint64_t)qword_254D27938);
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, v13, v2);
      v14 = sub_213C12570();
      v15 = sub_213C12750();
      if (os_log_type_enabled(v14, v15))
      {
        v16 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_213BCD000, v14, v15, "Invaliding current FAC buffer", v16, 2u);
        MEMORY[0x2199BF4BC](v16, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
      sub_213C0AC04();
      swift_bridgeObjectRelease();
      sub_213C0F014(MEMORY[0x24BEE4AF8]);
      return sub_213BFBF24();
    }
  }
  if (qword_254D27930 != -1)
    swift_once();
  v18 = __swift_project_value_buffer(v2, (uint64_t)qword_254D27938);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v18, v2);
  v19 = sub_213C12570();
  v20 = sub_213C12750();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_213BCD000, v19, v20, "Requested to prepare to resume gesture detection, but no gesture is being monitored currently.", v21, 2u);
    MEMORY[0x2199BF4BC](v21, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

uint64_t sub_213C084C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;

  v1 = v0;
  v2 = sub_213C12588();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v22 - v7;
  swift_beginAccess();
  v9 = *(_QWORD *)(v0 + 160);
  v10 = *(_QWORD *)(v0 + 144);
  v11 = *(id *)(v0 + 168);
  swift_bridgeObjectRetain();
  sub_213C127A4();
  sub_213C127B0();
  if ((v9 & 0x8000000000000000) != 0 || v9 >= *(_QWORD *)(v10 + 16))
  {

    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = *(_QWORD *)(v10 + 8 * v9 + 32);

    swift_bridgeObjectRelease();
    if (v12 != 10)
    {
      *(_BYTE *)(v1 + 256) = 0;
      if (qword_254D27930 != -1)
        swift_once();
      v13 = __swift_project_value_buffer(v2, (uint64_t)qword_254D27938);
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, v13, v2);
      v14 = sub_213C12570();
      v15 = sub_213C12750();
      if (os_log_type_enabled(v14, v15))
      {
        v16 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_213BCD000, v14, v15, "Invaliding current FAC buffer", v16, 2u);
        MEMORY[0x2199BF4BC](v16, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
      sub_213C0AC04();
      swift_bridgeObjectRelease();
      sub_213C0F014(MEMORY[0x24BEE4AF8]);
      return sub_213BFBF24();
    }
  }
  if (qword_254D27930 != -1)
    swift_once();
  v18 = __swift_project_value_buffer(v2, (uint64_t)qword_254D27938);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v18, v2);
  v19 = sub_213C12570();
  v20 = sub_213C12750();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_213BCD000, v19, v20, "Requested to resume gesture detection, but no gesture is being monitored currently.", v21, 2u);
    MEMORY[0x2199BF4BC](v21, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

uint64_t sub_213C08778()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;

  v1 = sub_213C12588();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v21 - v6;
  swift_beginAccess();
  v8 = *(_QWORD *)(v0 + 160);
  v9 = *(_QWORD *)(v0 + 144);
  v10 = *(id *)(v0 + 168);
  swift_bridgeObjectRetain();
  sub_213C127A4();
  sub_213C127B0();
  if ((v8 & 0x8000000000000000) != 0 || v8 >= *(_QWORD *)(v9 + 16))
  {

    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = *(_QWORD *)(v9 + 8 * v8 + 32);

    swift_bridgeObjectRelease();
    if (v11 != 10)
    {
      if (qword_254D27930 != -1)
        swift_once();
      v12 = __swift_project_value_buffer(v1, (uint64_t)qword_254D27938);
      (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v7, v12, v1);
      v13 = sub_213C12570();
      v14 = sub_213C12750();
      if (os_log_type_enabled(v13, v14))
      {
        v15 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_213BCD000, v13, v14, "Invaliding current FAC buffer", v15, 2u);
        MEMORY[0x2199BF4BC](v15, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
      sub_213C0AC04();
      swift_bridgeObjectRelease();
      sub_213C0F014(MEMORY[0x24BEE4AF8]);
      return sub_213BFBF24();
    }
  }
  if (qword_254D27930 != -1)
    swift_once();
  v17 = __swift_project_value_buffer(v1, (uint64_t)qword_254D27938);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v17, v1);
  v18 = sub_213C12570();
  v19 = sub_213C12750();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_213BCD000, v18, v19, "Requested to resume gesture detection, but no gesture is being monitored currently.", v20, 2u);
    MEMORY[0x2199BF4BC](v20, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v5, v1);
}

uint64_t sub_213C08A2C(char *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *);
  NSObject *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  unint64_t v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t);
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  void (*v29)(char *);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v2 = v1;
  v4 = sub_213C12588();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v28 - v9;
  v11 = &a1[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_faces];
  swift_beginAccess();
  if (!(*(_QWORD *)v11 >> 62))
  {
    if (*(_QWORD *)((*(_QWORD *)v11 & 0xFFFFFFFFFFFFF8) + 0x10) == 1)
      goto LABEL_3;
LABEL_6:
    if (qword_254D27930 != -1)
      swift_once();
    v16 = __swift_project_value_buffer(v4, (uint64_t)qword_254D27938);
    v17 = *(void (**)(char *))(v5 + 16);
    v31 = v16;
    v17(v10);
    v18 = a1;
    v19 = sub_213C12570();
    v20 = sub_213C1275C();
    if (os_log_type_enabled(v19, v20))
    {
      v29 = v17;
      v30 = v2;
      v21 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v21 = 134217984;
      v22 = *(_QWORD *)v11;
      if (v22 >> 62)
      {
        swift_bridgeObjectRetain();
        v23 = sub_213C12918();
        swift_bridgeObjectRelease();
      }
      else
      {
        v23 = *(_QWORD *)((v22 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      v32 = v23;
      sub_213C127F8();

      _os_log_impl(&dword_213BCD000, v19, v20, "Found %ld in frame. Invalidating current FAC buffer.", v21, 0xCu);
      MEMORY[0x2199BF4BC](v21, -1, -1);
      v17 = v29;
    }
    else
    {

      v19 = v18;
    }

    v24 = *(void (**)(char *, uint64_t))(v5 + 8);
    v24(v10, v4);
    ((void (*)(char *, uint64_t, uint64_t))v17)(v8, v31, v4);
    v25 = sub_213C12570();
    v26 = sub_213C12750();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_213BCD000, v25, v26, "Invaliding current FAC buffer", v27, 2u);
      MEMORY[0x2199BF4BC](v27, -1, -1);
    }

    v24(v8, v4);
    sub_213C0AC04();
    swift_bridgeObjectRelease();
    sub_213C0F014(MEMORY[0x24BEE4AF8]);
    sub_213BFBF24();
    return 0;
  }
  swift_bridgeObjectRetain();
  v15 = sub_213C12918();
  swift_bridgeObjectRelease();
  if (v15 != 1)
    goto LABEL_6;
LABEL_3:
  if (*(_BYTE *)(v2 + 256) != 2)
  {
    v12 = *(_QWORD *)&a1[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_time + 16];
    v13 = *(_QWORD *)&a1[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_time + 8];
    *(_QWORD *)(v2 + 224) = *(_QWORD *)&a1[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_time];
    *(_QWORD *)(v2 + 232) = v13;
    *(_QWORD *)(v2 + 240) = v12;
    return 1;
  }
  return 0;
}

uint64_t sub_213C08D70()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 120);
  swift_beginAccess();
  v2 = *(_QWORD *)(v0 + 160);
  v3 = *(_QWORD *)(v0 + 144);
  v4 = *(id *)(v0 + 168);
  swift_bridgeObjectRetain();
  sub_213C127A4();
  sub_213C127B0();
  if ((v2 & 0x8000000000000000) != 0 || v2 >= *(_QWORD *)(v3 + 16))
  {

    swift_bridgeObjectRelease();
LABEL_10:
    v7 = v1 + 96;
    return *(_QWORD *)v7;
  }
  v5 = *(_QWORD *)(v3 + 8 * v2 + 32);

  swift_bridgeObjectRelease();
  if (v5 != 4 && v5 != 9)
    goto LABEL_10;
  v7 = v1 + 104;
  return *(_QWORD *)v7;
}

uint64_t sub_213C08E1C(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  id v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  _QWORD *v16;
  id v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  unint64_t v23;
  _QWORD *v24;
  unint64_t v25;
  _QWORD *v26;
  char *v27;
  char *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  void *v45;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  _UNKNOWN **v54;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D28D60);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_213C14E40;
  swift_weakLoadStrong();
  v8 = type metadata accessor for PADFacePoseRequest();
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 24) = 0u;
  *(_OWORD *)(v9 + 40) = 0u;
  *(_BYTE *)(v9 + 56) = 1;
  swift_weakInit();
  swift_weakAssign();
  swift_release();
  *(_QWORD *)(v7 + 56) = v8;
  *(_QWORD *)(v7 + 64) = &off_24D0D0040;
  *(_QWORD *)(v7 + 32) = v9;
  v10 = *(_QWORD *)(sub_213C09580() + 16);
  swift_bridgeObjectRelease();
  if (v10 > 1)
  {
    swift_beginAccess();
    v21 = *(_QWORD *)(v3 + 160);
    v15 = *(_QWORD *)(v3 + 144);
    v22 = *(id *)(v3 + 168);
    swift_bridgeObjectRetain();
    sub_213C127A4();
    sub_213C127B0();
    if ((v21 & 0x8000000000000000) != 0 || v21 >= *(_QWORD *)(v15 + 16))
    {

      swift_bridgeObjectRelease();
      goto LABEL_15;
    }
    v23 = *(_QWORD *)(v15 + 8 * v21 + 32);

    swift_bridgeObjectRelease();
    if (v23 > 9 || ((1 << v23) & 0x310) == 0)
      goto LABEL_15;
    v24 = (_QWORD *)swift_allocObject();
    v24[2] = a2;
    v24[3] = a3;
    swift_retain();
    v17 = sub_213BDBE40(sub_213C01388, v24);
    swift_release();
    v19 = *(_QWORD *)(v7 + 16);
    v25 = *(_QWORD *)(v7 + 24);
    a3 = v19 + 1;
    if (v19 >= v25 >> 1)
      v7 = (uint64_t)sub_213BEAC84((_QWORD *)(v25 > 1), v19 + 1, 1, (_QWORD *)v7);
    v20 = sub_213BF1DCC(0, (unint64_t *)&unk_254D29870);
    v54 = &off_24D0D0028;
    goto LABEL_6;
  }
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a2;
  v11[3] = a3;
  swift_retain();
  v12 = sub_213BFD484(sub_213C01398, v11);
  swift_release();
  v14 = *(_QWORD *)(v7 + 16);
  v13 = *(_QWORD *)(v7 + 24);
  v15 = v14 + 1;
  if (v14 >= v13 >> 1)
    goto LABEL_47;
  while (1)
  {
    v53 = sub_213BF1DCC(0, (unint64_t *)&unk_254D28D70);
    v54 = &off_24D0D0028;
    *(_QWORD *)&v52 = v12;
    *(_QWORD *)(v7 + 16) = v15;
    sub_213BFC43C(&v52, v7 + 40 * v14 + 32);
    v16 = (_QWORD *)swift_allocObject();
    v16[2] = a2;
    v16[3] = a3;
    swift_retain();
    v17 = sub_213BDBE40(sub_213C01398, v16);
    swift_release();
    v19 = *(_QWORD *)(v7 + 16);
    v18 = *(_QWORD *)(v7 + 24);
    a3 = v19 + 1;
    if (v19 >= v18 >> 1)
      v7 = (uint64_t)sub_213BEAC84((_QWORD *)(v18 > 1), v19 + 1, 1, (_QWORD *)v7);
    v20 = sub_213BF1DCC(0, (unint64_t *)&unk_254D29870);
    v54 = &off_24D0D0028;
LABEL_6:
    v53 = v20;
    *(_QWORD *)&v52 = v17;
    *(_QWORD *)(v7 + 16) = a3;
    sub_213BFC43C(&v52, v7 + 40 * v19 + 32);
LABEL_15:
    v26 = (_QWORD *)(a1 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_faces);
    swift_beginAccess();
    v12 = (id)*v26;
    if (*v26 >> 62)
    {
      swift_bridgeObjectRetain();
      v14 = sub_213C12918();
      if (!v14)
      {
LABEL_43:
        swift_bridgeObjectRelease();
        return v7;
      }
    }
    else
    {
      v14 = *(_QWORD *)(((unint64_t)v12 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v14)
        goto LABEL_43;
    }
    if (((unint64_t)v12 & 0xC000000000000001) != 0)
      break;
    v13 = *(_QWORD *)(((unint64_t)v12 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v13)
    {
      v27 = (char *)*((id *)v12 + 4);
      goto LABEL_20;
    }
    __break(1u);
LABEL_47:
    v7 = (uint64_t)sub_213BEAC84((_QWORD *)(v13 > 1), v15, 1, (_QWORD *)v7);
  }
  v27 = (char *)MEMORY[0x2199BE994](0, v12);
LABEL_20:
  v28 = v27;
  swift_bridgeObjectRelease();
  v29 = *(double *)&v28[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds];
  v30 = *(double *)&v28[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds + 8];
  v31 = *(double *)&v28[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds + 16];
  v32 = *(double *)&v28[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds + 24];

  v33 = sub_213BECD34(v29, v30, v31, v32);
  v34 = v33;
  v35 = *(_QWORD *)(v7 + 16);
  if (v35)
  {
    v36 = v7 + 32;
    v48 = *MEMORY[0x24BDD0D70];
    v47 = v7;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_213BE2DA4(v36, (uint64_t)&v52);
      sub_213BE2DA4((uint64_t)&v52, (uint64_t)&v50);
      __swift_instantiateConcreteTypeFromMangledName(&qword_254D27E90);
      sub_213BF1DCC(0, &qword_254D28D80);
      if ((swift_dynamicCast() & 1) != 0)
        break;
LABEL_34:
      sub_213BE2DA4((uint64_t)&v52, (uint64_t)&v50);
      __swift_instantiateConcreteTypeFromMangledName(&qword_254D28D88);
      if ((swift_dynamicCast() & 1) != 0)
      {
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D28D90);
        v43 = swift_allocObject();
        *(_OWORD *)(v43 + 16) = xmmword_213C15A30;
        *(_QWORD *)(v43 + 32) = v34;
        *(_QWORD *)&v50 = v43;
        sub_213C126A8();
        sub_213BF1DCC(0, (unint64_t *)&unk_254D28D40);
        v44 = v34;
        v45 = (void *)sub_213C12684();
        swift_bridgeObjectRelease();
        objc_msgSend(v49, sel_setInputFaceObservations_, v45);
        swift_unknownObjectRelease();

      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v52);
      v36 += 40;
      if (!--v35)
      {

        v7 = v47;
        goto LABEL_43;
      }
    }
    if (!os_variant_has_internal_content())
      goto LABEL_32;
    v37 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
    v38 = objc_msgSend(v37, sel_persistentDomainForName_, v48);

    if (v38 && (v39 = sub_213C125DC(), v38, v39))
    {
      if (*(_QWORD *)(v39 + 16) && (v40 = sub_213C0DF08(0xD000000000000018, 0x8000000213C17BD0), (v41 & 1) != 0))
      {
        sub_213BECBD4(*(_QWORD *)(v39 + 56) + 32 * v40, (uint64_t)&v50);
      }
      else
      {
        v50 = 0u;
        v51 = 0u;
      }
      swift_bridgeObjectRelease();
      if (*((_QWORD *)&v51 + 1))
      {
        if (swift_dynamicCast())
        {
          v42 = v49;
          goto LABEL_33;
        }
LABEL_32:
        v42 = 0;
LABEL_33:
        objc_msgSend(v49, sel_setUsesCPUOnly_, v42, v47);

        goto LABEL_34;
      }
    }
    else
    {
      v50 = 0u;
      v51 = 0u;
    }
    sub_213BE4088((uint64_t)&v50, &qword_254D27FD8);
    goto LABEL_32;
  }

  return v7;
}

uint64_t sub_213C09580()
{
  _QWORD *v0;
  unint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;

  swift_beginAccess();
  v1 = v0[20];
  v2 = (void *)v0[21];
  swift_beginAccess();
  v3 = v0[37];
  v4 = v2;
  swift_bridgeObjectRetain();
  sub_213C127A4();
  sub_213C127B0();
  if ((v1 & 0x8000000000000000) != 0 || v1 >= *(_QWORD *)(v3 + 16))
  {

    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  else
  {
    v5 = *(_QWORD *)(v3 + 8 * v1 + 32);
    swift_bridgeObjectRetain();

    swift_bridgeObjectRelease();
  }
  return v5;
}

uint64_t sub_213C09638(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v1 = a1[3];
  v2 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v1);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2);
  if (result)
  {
    if (*(_QWORD *)(result + 16) != 1)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  return result;
}

uint64_t sub_213C09690(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  int v19;
  __int128 v20;
  __int128 v21;

  v9 = *(void (**)(uint64_t))(v4 + 104);
  *(_BYTE *)(v4 + 96) = 0;
  if (v9)
  {
    v10 = swift_retain();
    v9(v10);
    sub_213BF1358((uint64_t)v9);
    v11 = *(_QWORD *)(v4 + 104);
  }
  else
  {
    v11 = 0;
  }
  *(_QWORD *)(v4 + 104) = 0;
  *(_QWORD *)(v4 + 112) = 0;
  sub_213BF1358(v11);
  v12 = sub_213C0760C(a1, a2, a3, a4, (void (*)(_QWORD))type metadata accessor for PADFacePoseRequest, &qword_254D28FE8);
  if (!v12)
  {
    v20 = 0u;
    v21 = 0u;
    return sub_213BE4088((uint64_t)&v20, &qword_254D27FD8);
  }
  if (!*(_QWORD *)(v12 + 16))
  {
    v20 = 0u;
    v21 = 0u;
    swift_bridgeObjectRelease();
    return sub_213BE4088((uint64_t)&v20, &qword_254D27FD8);
  }
  sub_213BECBD4(v12 + 32, (uint64_t)&v20);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v21 + 1))
    return sub_213BE4088((uint64_t)&v20, &qword_254D27FD8);
  result = swift_dynamicCast();
  if ((result & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D29860);
    v14 = swift_allocObject();
    v15 = MEMORY[0x24BEE14E8];
    *(_OWORD *)(v14 + 16) = xmmword_213C16240;
    v16 = MEMORY[0x24BEE1568];
    *(_QWORD *)(v14 + 56) = v15;
    *(_QWORD *)(v14 + 64) = v16;
    *(_DWORD *)(v14 + 32) = v17;
    *(_QWORD *)(v14 + 96) = v15;
    *(_QWORD *)(v14 + 104) = v16;
    *(_DWORD *)(v14 + 72) = v19;
    *(_QWORD *)(v14 + 136) = v15;
    *(_QWORD *)(v14 + 144) = v16;
    *(_DWORD *)(v14 + 112) = v18;
    sub_213C12618();
    *(_QWORD *)&v20 = 0x65736F5065636146;
    *((_QWORD *)&v20 + 1) = 0xEA0000000000203ALL;
    sub_213C12648();
    swift_bridgeObjectRelease();
    sub_213BDB2E8(v20, *((unint64_t *)&v20 + 1));
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_213C09890(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;

  v3 = sub_213C12588();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_BYTE *)(v1 + 256))
  {
    if (*(_BYTE *)(v1 + 256) == 1)
    {
      sub_213C09E98(a1);
    }
    else
    {
      if (qword_254D27930 != -1)
        swift_once();
      v7 = __swift_project_value_buffer(v3, (uint64_t)qword_254D27938);
      (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
      v8 = sub_213C12570();
      v9 = sub_213C12750();
      if (os_log_type_enabled(v8, v9))
      {
        v10 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_213BCD000, v8, v9, "Ignoring FAC composite set: classifier is paused", v10, 2u);
        MEMORY[0x2199BF4BC](v10, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    }
  }
  else
  {
    sub_213C09A0C(a1);
  }
}

void sub_213C09A0C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  char v22;
  uint64_t v23;
  int v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;

  v2 = v1;
  v4 = sub_213C12588();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v30 - v7;
  swift_beginAccess();
  v9 = *(_QWORD *)(v1 + 160);
  v10 = *(_QWORD *)(v1 + 144);
  v11 = *(id *)(v1 + 168);
  swift_bridgeObjectRetain();
  sub_213C127A4();
  sub_213C127B0();
  if ((v9 & 0x8000000000000000) != 0 || v9 >= *(_QWORD *)(v10 + 16))
  {

    swift_bridgeObjectRelease();
    return;
  }
  v31 = v5;
  v12 = *(_QWORD *)(v10 + 8 * v9 + 32);

  swift_bridgeObjectRelease();
  v13 = sub_213C02C74((uint64_t)a1, v12);
  if (a1[2] >= v14[2])
  {
    v22 = v15;
    v23 = v13;
    sub_213C0A294(v13, v14, 0, v16, a1);
    if (v12 > 9 || ((1 << v12) & 0x330) == 0)
    {
      if ((v23 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v22 & 1) != 0)
          v28 = 4;
        else
          v28 = 2;
        goto LABEL_19;
      }
      v29 = *(unsigned __int8 *)(v2 + 256);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v26 = v29 == 2;
      v27 = 3;
    }
    else
    {
      v25 = *(unsigned __int8 *)(v2 + 256);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v26 = v25 == 2;
      v27 = 2;
    }
    if (v26)
      v28 = v27;
    else
      v28 = v23;
LABEL_19:
    sub_213C0AFF0(v28, (uint64_t)a1);
    return;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_254D27930 != -1)
    swift_once();
  v17 = __swift_project_value_buffer(v4, (uint64_t)qword_254D27938);
  v18 = v31;
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v8, v17, v4);
  v19 = sub_213C12570();
  v20 = sub_213C1275C();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_213BCD000, v19, v20, "Received more faceprints than FAC timestamps. Each frame should contain no more than one faceprint.", v21, 2u);
    MEMORY[0x2199BF4BC](v21, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v18 + 8))(v8, v4);
}

uint64_t sub_213C09E98(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v20;

  v3 = sub_213C12588();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v20 - v6;
  swift_beginAccess();
  v8 = *(_QWORD *)(v1 + 160);
  v9 = *(_QWORD *)(v1 + 144);
  v10 = *(id *)(v1 + 168);
  swift_bridgeObjectRetain();
  sub_213C127A4();
  sub_213C127B0();
  if ((v8 & 0x8000000000000000) != 0 || v8 >= *(_QWORD *)(v9 + 16))
  {

    swift_bridgeObjectRelease();
    v11 = 10;
  }
  else
  {
    v11 = *(_QWORD *)(v9 + 8 * v8 + 32);

    swift_bridgeObjectRelease();
  }
  v12 = sub_213C032C8((uint64_t)a1, v11);
  if (a1[2] >= v13[2])
  {
    sub_213C0A294(v12, v13, 0, v14, a1);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_254D27930 != -1)
      swift_once();
    v15 = __swift_project_value_buffer(v3, (uint64_t)qword_254D27938);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v15, v3);
    v16 = sub_213C12570();
    v17 = sub_213C1275C();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_213BCD000, v16, v17, "Received more faceprints than FAC timestamps. Each frame should contain no more than one faceprint.", v18, 2u);
      MEMORY[0x2199BF4BC](v18, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }
}

uint64_t sub_213C0A294(uint64_t a1, _QWORD *a2, uint64_t a3, unint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  unint64_t *v19;
  uint64_t *v20;
  BOOL v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t result;
  char *v29;
  __int128 v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  id v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char *v44;
  NSObject *v45;
  os_log_type_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  _QWORD *v54;
  void *v55;
  id v56;
  _QWORD *v57;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v59;
  NSObject *v60;
  os_log_type_t v61;
  uint8_t *v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  char v72;
  uint64_t v73;
  void *v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  _QWORD *v79;
  _QWORD v80[2];
  __int128 v81;
  char *v82;
  char *v83;
  uint64_t v84;
  unint64_t v85;
  unint64_t v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  _QWORD *v91;
  __int128 v92;
  __int128 v93;
  uint64_t v94;
  int v95;
  int v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;

  v88 = a4;
  v8 = sub_213C12588();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v83 = (char *)v80 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v80 - v13;
  v15 = *(_BYTE *)(v5 + 260);
  v90 = v5;
  v91 = a5;
  v84 = v12;
  v86 = v9;
  if ((v15 & 1) == 0)
  {
    v87 = v5 + 260;
    if ((*(_BYTE *)(v5 + 261) & 1) == 0 && !a2[2])
    {
      if (qword_254D27930 == -1)
        goto LABEL_45;
      goto LABEL_76;
    }
  }
  if (a2[2])
  {
    *(_BYTE *)(v5 + 261) = 1;
    swift_bridgeObjectRetain();
  }
  else
  {
    a2 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
LABEL_7:
  v16 = a2[2];
  v17 = v90;
  if (v16)
  {
    v18 = v91 + 4;
    v19 = a2 + 5;
    v20 = (uint64_t *)MEMORY[0x24BDC0D88];
    do
    {
      v27 = *v19;
      if ((*v19 & 0x8000000000000000) != 0)
      {
        v22 = v20;
      }
      else
      {
        v21 = v27 >= v91[2];
        v22 = &v18[4 * v27];
        if (v21)
          v22 = v20;
      }
      v19 += 2;
      v23 = v22[1];
      v24 = v22[2];
      v25 = *v22;
      v26 = swift_bridgeObjectRetain();
      sub_213C0C718(v26, v25, v23, v24);
      swift_bridgeObjectRelease();
      --v16;
    }
    while (v16);
  }
  result = swift_bridgeObjectRelease();
  v9 = v88;
  v29 = *(char **)(v88 + 16);
  if (v29)
  {
    swift_bridgeObjectRetain();
    swift_beginAccess();
    v87 = v17 + 280;
    swift_beginAccess();
    v14 = 0;
    a5 = v91;
    v89 = (uint64_t)(v91 + 4);
    *(_QWORD *)&v30 = 136315138;
    v81 = v30;
    v80[1] = MEMORY[0x24BEE4AD8] + 8;
    v82 = v29;
    while (1)
    {
      v31 = *(_QWORD *)(v9 + 8 * (_QWORD)v14 + 32);
      if ((v31 & 0x8000000000000000) == 0 && v31 < a5[2])
      {
        v32 = v89 + 32 * v31;
        v33 = *(_QWORD *)v32;
        v35 = *(unsigned int *)(v32 + 8);
        v34 = *(_DWORD *)(v32 + 12);
        v36 = *(_QWORD *)(v32 + 16);
        if ((sub_213C125B8() & 1) != 0)
        {
          v37 = *(_QWORD *)(v90 + 160);
          v38 = *(_QWORD *)(v90 + 280);
          v39 = *(id *)(v90 + 168);
          swift_bridgeObjectRetain();
          sub_213C127A4();
          sub_213C127B0();
          if ((v37 & 0x8000000000000000) != 0 || v37 >= *(_QWORD *)(v38 + 16))
          {

            swift_bridgeObjectRelease();
            v40 = (_QWORD *)MEMORY[0x24BEE4AF8];
          }
          else
          {
            v40 = *(_QWORD **)(v38 + 8 * v37 + 32);
            swift_bridgeObjectRetain();

            swift_bridgeObjectRelease();
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v40 = sub_213BEA5AC(0, v40[2] + 1, 1, v40);
          v53 = v40[2];
          v52 = v40[3];
          if (v53 >= v52 >> 1)
            v40 = sub_213BEA5AC((_QWORD *)(v52 > 1), v53 + 1, 1, v40);
          v40[2] = v53 + 1;
          v54 = &v40[3 * v53];
          v54[4] = v33;
          *((_DWORD *)v54 + 10) = v35;
          *((_DWORD *)v54 + 11) = v34;
          v54[6] = v36;
          v8 = *(_QWORD *)(v90 + 160);
          v55 = *(void **)(v90 + 168);
          swift_beginAccess();
          v56 = v55;
          sub_213C127A4();
          sub_213C127B0();
          v9 = v88;
          a5 = v91;
          if ((v8 & 0x8000000000000000) == 0)
          {
            v57 = *(_QWORD **)v87;
            if (v8 < *(_QWORD *)(*(_QWORD *)v87 + 16))
            {
              swift_bridgeObjectRetain_n();
              isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
              *(_QWORD *)v87 = v57;
              if ((isUniquelyReferenced_nonNull_native & 1) == 0)
              {
                v57 = sub_213C103CC(v57);
                *(_QWORD *)v87 = v57;
              }
              if (v8 >= v57[2])
              {
                while (1)
                {
                  __break(1u);
LABEL_76:
                  swift_once();
LABEL_45:
                  v59 = __swift_project_value_buffer(v8, (uint64_t)qword_254D27938);
                  (*(void (**)(char *, uint64_t, unint64_t))(v9 + 16))(v14, v59, v8);
                  v60 = sub_213C12570();
                  v61 = sub_213C12750();
                  if (os_log_type_enabled(v60, v61))
                  {
                    v62 = (uint8_t *)swift_slowAlloc();
                    *(_WORD *)v62 = 0;
                    _os_log_impl(&dword_213BCD000, v60, v61, "ID matching frames not selected for gesture. Selecting 2 random frames to use as default.", v62, 2u);
                    MEMORY[0x2199BF4BC](v62, -1, -1);
                  }

                  result = (*(uint64_t (**)(char *, unint64_t))(v9 + 8))(v14, v8);
                  v9 = a5[2];
                  if (!v9)
                    break;
                  v8 = (unint64_t)(a5 + 4);
                  v63 = (_QWORD *)sub_213BF1DCC(0, (unint64_t *)&unk_254D28D70);
                  v64 = 0;
                  a2 = (_QWORD *)MEMORY[0x24BEE4AF8];
                  v65 = -1;
                  v66 = -(uint64_t)v9 % v9;
                  v89 = MEMORY[0x24BEE4AD8] + 8;
                  v85 = (unint64_t)(a5 + 4);
                  a5 = v63;
                  while (1)
                  {
                    v14 = (char *)v64;
                    v67 = v65;
                    do
                    {
                      *(_QWORD *)&v92 = 0;
                      MEMORY[0x2199BF4C8](&v92, 8);
                      v65 = ((unint64_t)v92 * (unsigned __int128)v9) >> 64;
                      if (v9 > (unint64_t)v92 * v9 && v66 > (unint64_t)v92 * v9)
                      {
                        do
                        {
                          *(_QWORD *)&v92 = 0;
                          MEMORY[0x2199BF4C8](&v92, 8);
                        }
                        while (v66 > (unint64_t)v92 * v9);
                        v65 = ((unint64_t)v92 * (unsigned __int128)v9) >> 64;
                      }
                    }
                    while (v67 == v65);
                    if (v65 >= (uint64_t)v9)
                      break;
                    v68 = *(_QWORD *)(v8 + 32 * v65 + 24);
                    v99 = v63;
                    swift_bridgeObjectRetain();
                    __swift_instantiateConcreteTypeFromMangledName(&qword_254D29890);
                    v69 = sub_213C12630();
                    if (*(_QWORD *)(v68 + 16) && (v71 = sub_213C0DF08(v69, v70), (v72 & 1) != 0))
                    {
                      v73 = *(_QWORD *)(*(_QWORD *)(v68 + 56) + 8 * v71);
                      swift_bridgeObjectRetain();
                      swift_bridgeObjectRelease();
                      if (*(_QWORD *)(v73 + 16))
                      {
                        sub_213BECBD4(v73 + 32, (uint64_t)&v92);
                      }
                      else
                      {
                        v92 = 0u;
                        v93 = 0u;
                      }
                      swift_bridgeObjectRelease();
                      v63 = a5;
                    }
                    else
                    {
                      swift_bridgeObjectRelease();
                      v92 = 0u;
                      v93 = 0u;
                    }
                    swift_bridgeObjectRelease();
                    if (*((_QWORD *)&v93 + 1))
                    {
                      sub_213BF1DCC(0, (unint64_t *)&unk_254D28D40);
                      if ((swift_dynamicCast() & 1) != 0)
                      {
                        v74 = v99;
                        v75 = sub_213BFD92C(v99);
                        if (v75)
                        {
                          v76 = v75;
                          *(_BYTE *)v87 = 1;
                          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                            a2 = sub_213BEAEB0(0, a2[2] + 1, 1, a2);
                          v78 = a2[2];
                          v77 = a2[3];
                          if (v78 >= v77 >> 1)
                            a2 = sub_213BEAEB0((_QWORD *)(v77 > 1), v78 + 1, 1, a2);
                          a2[2] = v78 + 1;
                          v79 = &a2[2 * v78];
                          v79[4] = v76;
                          v79[5] = v65;

                          v8 = v85;
                          v63 = a5;
                        }
                        else
                        {

                        }
                      }
                    }
                    else
                    {
                      sub_213BE4088((uint64_t)&v92, &qword_254D27FD8);
                    }
                    v64 = 1;
                    if ((v14 & 1) != 0)
                      goto LABEL_7;
                  }
                  __break(1u);
                }
                __break(1u);
                return result;
              }
              swift_bridgeObjectRetain();
              swift_bridgeObjectRelease();
              v57[v8 + 4] = v40;
              swift_bridgeObjectRelease_n();
            }
          }
          swift_endAccess();
          swift_bridgeObjectRelease();

        }
        else
        {
          v85 = v35;
          if (qword_254D27930 != -1)
            swift_once();
          v41 = v84;
          v42 = __swift_project_value_buffer(v84, (uint64_t)qword_254D27938);
          v43 = v86;
          v44 = v83;
          (*(void (**)(char *, uint64_t, uint64_t))(v86 + 16))(v83, v42, v41);
          v45 = sub_213C12570();
          v46 = sub_213C12750();
          if (os_log_type_enabled(v45, v46))
          {
            v47 = swift_slowAlloc();
            v48 = swift_slowAlloc();
            v97 = v36;
            v98 = v48;
            *(_DWORD *)v47 = v81;
            v94 = v33;
            v95 = v85;
            v96 = v34;
            type metadata accessor for CMTime(0);
            v49 = sub_213C12630();
            *(_QWORD *)(v47 + 4) = sub_213BEB0C8(v49, v50, &v98);
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_213BCD000, v45, v46, "Invalid reference frame timestamp received: %s", (uint8_t *)v47, 0xCu);
            swift_arrayDestroy();
            v51 = v48;
            v9 = v88;
            MEMORY[0x2199BF4BC](v51, -1, -1);
            MEMORY[0x2199BF4BC](v47, -1, -1);

            (*(void (**)(char *, uint64_t))(v86 + 8))(v44, v41);
          }
          else
          {

            (*(void (**)(char *, uint64_t))(v43 + 8))(v44, v41);
          }
          a5 = v91;
          v29 = v82;
        }
      }
      if (v29 == ++v14)
        return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_213C0AB4C()
{
  _QWORD *v0;
  unint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;

  swift_beginAccess();
  v1 = v0[20];
  v2 = (void *)v0[21];
  swift_beginAccess();
  v3 = v0[35];
  v4 = v2;
  swift_bridgeObjectRetain();
  sub_213C127A4();
  sub_213C127B0();
  if ((v1 & 0x8000000000000000) != 0 || v1 >= *(_QWORD *)(v3 + 16))
  {

    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  else
  {
    v5 = *(_QWORD *)(v3 + 8 * v1 + 32);
    swift_bridgeObjectRetain();

    swift_bridgeObjectRelease();
  }
  return v5;
}

uint64_t sub_213C0AC04()
{
  _QWORD *v0;
  unint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;

  swift_beginAccess();
  v1 = v0[20];
  v2 = (void *)v0[21];
  swift_beginAccess();
  v3 = v0[34];
  v4 = v2;
  swift_bridgeObjectRetain();
  sub_213C127A4();
  sub_213C127B0();
  if ((v1 & 0x8000000000000000) != 0 || v1 >= *(_QWORD *)(v3 + 16))
  {

    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  else
  {
    v5 = *(_QWORD *)(v3 + 8 * v1 + 32);
    swift_bridgeObjectRetain();

    swift_bridgeObjectRelease();
  }
  return v5;
}

uint64_t sub_213C0ACBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t *v24;
  unint64_t v25;
  _QWORD v26[3];
  uint64_t v27;
  uint64_t v28;
  uint64_t v29[5];

  v1 = v0;
  v2 = sub_213C12588();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_BYTE *)(v0 + 258) = 0;
  swift_beginAccess();
  v6 = *(_QWORD *)(v0 + 160);
  v7 = *(_QWORD *)(v0 + 144);
  v8 = *(id *)(v0 + 168);
  swift_bridgeObjectRetain();
  sub_213C127A4();
  sub_213C127B0();
  if ((v6 & 0x8000000000000000) != 0 || v6 >= *(_QWORD *)(v7 + 16))
  {

    swift_bridgeObjectRelease();
    return sub_213C0CB58();
  }
  v9 = *(_QWORD *)(v7 + 8 * v6 + 32);

  swift_bridgeObjectRelease();
  swift_beginAccess();
  v10 = *(_QWORD *)(v1 + 176);
  v11 = *(_QWORD *)(v1 + 152);
  v12 = *(id *)(v1 + 184);
  sub_213C127A4();
  sub_213C127B0();

  if (v10 >= v11)
    return sub_213C0CB58();
  v25 = v9;
  if (qword_254D27930 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v2, (uint64_t)qword_254D27938);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v13, v2);
  v14 = sub_213C12570();
  v15 = sub_213C12750();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    v17 = swift_slowAlloc();
    v29[0] = v17;
    *(_DWORD *)v16 = 136315138;
    v24 = v16 + 4;
    v18 = PADSWGesture.description.getter(v25);
    v26[0] = sub_213BEB0C8(v18, v19, v29);
    sub_213C127F8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_213BCD000, v14, v15, "Will start monitoring gesture %s", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199BF4BC](v17, -1, -1);
    MEMORY[0x2199BF4BC](v16, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  result = MEMORY[0x2199BF54C](v1 + 128);
  if (result)
  {
    v21 = result + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_delegate;
    swift_beginAccess();
    sub_213BDF4D4(v21, (uint64_t)v29);
    if (v29[3])
    {
      sub_213BE2DA4((uint64_t)v29, (uint64_t)v26);
      sub_213BE4088((uint64_t)v29, (uint64_t *)&unk_254D28D30);
      v22 = v27;
      v23 = v28;
      __swift_project_boxed_opaque_existential_1(v26, v27);
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v23 + 8))(v25, v22, v23);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    }
    else
    {
      sub_213BE4088((uint64_t)v29, (uint64_t *)&unk_254D28D30);
    }
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_213C0AFF0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t *v19;
  _QWORD *v20;
  void *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t, uint64_t);
  NSObject *v35;
  os_log_type_t v36;
  _BOOL4 v37;
  uint64_t v38;
  CMTimeValue v39;
  unint64_t v40;
  uint64_t v41;
  id v42;
  unint64_t v43;
  id v44;
  uint64_t v45;
  id v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  void *v64;
  uint64_t v65;
  id v66;
  CMTimeValue value;
  unint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  _QWORD *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint8_t *v80;
  NSObject *v81;
  os_log_type_t v82;
  CMTimeValue v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  unint64_t v88;
  CMTimeValue v89;
  uint8_t *v90;
  uint8_t *v91;
  unint64_t v92;
  NSObject *v93;
  os_log_type_t v94;
  uint8_t *v95;
  CMTimeValue v96;
  unint64_t v97;
  uint64_t v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  id v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t v105;
  id v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  id v113;
  void *v114;
  id v115;
  uint64_t v116;
  uint64_t v117;
  id v118;
  __int128 v119;
  unint64_t v120;
  id v121;
  unint64_t v122;
  id v123;
  uint64_t v124;
  NSObject *v125;
  os_log_type_t v126;
  CMTimeValue v127;
  unint64_t v128;
  uint64_t v129;
  id v130;
  unint64_t v131;
  uint8_t *v132;
  uint64_t v133;
  unint64_t v134;
  _QWORD *v135;
  char v136;
  unint64_t v137;
  unint64_t v138;
  void *v139;
  uint64_t v140;
  uint64_t v141;
  id v142;
  uint64_t v143;
  uint64_t v144;
  id v145;
  uint8_t *v146;
  NSObject *v147;
  os_log_type_t v148;
  unint64_t v149;
  uint64_t v150;
  id v151;
  unint64_t v152;
  uint64_t v153;
  unint64_t v154;
  CMTimeValue v155;
  CMTimeValue v156;
  CMTimeEpoch epoch;
  uint64_t v158;
  uint64_t v159;
  _QWORD *v160;
  char v161;
  unint64_t v162;
  unint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  CMTimeValue v167;
  uint8_t *v168;
  __int128 v169;
  uint8_t *v170;
  uint64_t v171;
  __int128 v172;
  uint64_t *v173;
  _QWORD *v174;
  uint8_t *v175;
  uint64_t v176;
  void (*v177)(uint8_t *, uint64_t);
  void (*v178)(uint64_t, uint64_t, uint64_t);
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  CMTime v184;
  uint64_t v185;

  v3 = v2;
  v6 = sub_213C12588();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v175 = (uint8_t *)&v167 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (uint8_t *)&v167 - v11;
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (uint8_t *)&v167 - v14;
  v16 = MEMORY[0x24BDAC7A8](v13);
  *(_QWORD *)&v172 = (char *)&v167 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v19 = (uint8_t *)&v167 - v18;
  v20 = (_QWORD *)(v2 + 192);
  swift_beginAccess();
  v21 = *(void **)(v2 + 200);
  sub_213C127A4();
  v22 = *(_QWORD *)(v3 + 192);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
  {
LABEL_108:
    __break(1u);
  }
  else
  {
    *v20 = v24;
    v25 = v21;
    sub_213C127B0();
    swift_endAccess();

    if ((unint64_t)(a1 - 2) >= 3)
    {
      v171 = a2;
      v170 = v15;
      *(_QWORD *)&v169 = v20;
      v168 = v12;
      if (qword_254D27930 == -1)
        goto LABEL_8;
      goto LABEL_110;
    }
    swift_beginAccess();
    v26 = *(void **)(v3 + 200);
    sub_213C127A4();
    v27 = *(_QWORD *)(v3 + 192);
    v23 = __OFADD__(v27, 1);
    v28 = v27 + 1;
    if (!v23)
    {
      *(_QWORD *)(v3 + 192) = v28;
      v29 = v26;
      sub_213C127B0();
      swift_endAccess();

      if (a1 != 4)
      {
        swift_beginAccess();
        v30 = *(void **)(v3 + 216);
        sub_213C127A4();
        *(_QWORD *)(v3 + 208) = 0;
        goto LABEL_14;
      }
      swift_beginAccess();
      v30 = *(void **)(v3 + 216);
      sub_213C127A4();
      v31 = *(_QWORD *)(v3 + 208);
      v23 = __OFADD__(v31, 1);
      v32 = v31 + 1;
      if (!v23)
      {
        *(_QWORD *)(v3 + 208) = v32;
LABEL_14:
        v44 = v30;
        sub_213C127B0();
        swift_endAccess();

        swift_beginAccess();
        v45 = *(_QWORD *)(v3 + 208);
        v46 = *(id *)(v3 + 216);
        sub_213C127A4();
        sub_213C127B0();

        if (v45 >= 10)
        {
          swift_beginAccess();
          v47 = *(void **)(v3 + 216);
          sub_213C127A4();
          *(_QWORD *)(v3 + 208) = 0;
          v48 = v47;
          sub_213C127B0();
          swift_endAccess();

          v49 = MEMORY[0x2199BF54C](v3 + 128);
          if (v49)
          {
            v50 = v49;
            swift_beginAccess();
            v51 = *(_QWORD *)(v3 + 160);
            v52 = *(_QWORD *)(v3 + 144);
            v53 = *(id *)(v3 + 168);
            swift_bridgeObjectRetain();
            sub_213C127A4();
            sub_213C127B0();
            if ((v51 & 0x8000000000000000) != 0 || v51 >= *(_QWORD *)(v52 + 16))
            {
              swift_bridgeObjectRelease();
              v54 = 10;
            }
            else
            {
              v54 = *(_QWORD *)(v52 + 8 * v51 + 32);
              swift_bridgeObjectRelease();
            }

            v164 = v50 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_delegate;
            swift_beginAccess();
            sub_213BDF4D4(v164, (uint64_t)&v184);
            if (v185)
            {
              sub_213BE2DA4((uint64_t)&v184, (uint64_t)&v180);
              sub_213BE4088((uint64_t)&v184, (uint64_t *)&unk_254D28D30);
              v165 = v182;
              v166 = v183;
              __swift_project_boxed_opaque_existential_1(&v180, v182);
              (*(void (**)(uint64_t, uint64_t, uint64_t))(v166 + 16))(v54, v165, v166);
              __swift_destroy_boxed_opaque_existential_1((uint64_t)&v180);
            }
            else
            {
              sub_213BE4088((uint64_t)&v184, (uint64_t *)&unk_254D28D30);
            }
            swift_unknownObjectRelease();
          }
        }
        return;
      }
      goto LABEL_113;
    }
  }
  __break(1u);
LABEL_110:
  swift_once();
LABEL_8:
  v33 = __swift_project_value_buffer(v6, (uint64_t)qword_254D27938);
  v34 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  v179 = v33;
  v178 = v34;
  ((void (*)(uint8_t *))v34)(v19);
  swift_retain_n();
  v35 = sub_213C12570();
  v36 = sub_213C12750();
  v37 = os_log_type_enabled(v35, v36);
  v176 = v6;
  v173 = (uint64_t *)a1;
  if (v37)
  {
    v38 = swift_slowAlloc();
    v39 = swift_slowAlloc();
    v184.value = v39;
    *(_DWORD *)v38 = 136315394;
    swift_beginAccess();
    v40 = *(_QWORD *)(v3 + 160);
    v41 = *(_QWORD *)(v3 + 144);
    v42 = *(id *)(v3 + 168);
    swift_bridgeObjectRetain();
    sub_213C127A4();
    sub_213C127B0();
    if ((v40 & 0x8000000000000000) != 0 || v40 >= *(_QWORD *)(v41 + 16))
    {

      swift_bridgeObjectRelease();
      v43 = 10;
    }
    else
    {
      v43 = *(_QWORD *)(v41 + 8 * v40 + 32);

      swift_bridgeObjectRelease();
    }
    v55 = PADSWGesture.description.getter(v43);
    v180 = sub_213BEB0C8(v55, v56, &v184.value);
    sub_213C127F8();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v38 + 12) = 2080;
    v32 = (uint64_t)v173;
    if (v173)
    {
      if (v173 != (uint64_t *)1)
      {
LABEL_114:
        v180 = v32;
        sub_213C12A20();
        __break(1u);
        return;
      }
      v57 = 0xE800000000000000;
      v58 = 0x6465746365746564;
    }
    else
    {
      v57 = 0xE700000000000000;
      v58 = 0x64657070696B73;
    }
    v180 = sub_213BEB0C8(v58, v57, &v184.value);
    sub_213C127F8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_213BCD000, v35, v36, "Did finish monitoring gesture %s with assessment %s", (uint8_t *)v38, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2199BF4BC](v39, -1, -1);
    MEMORY[0x2199BF4BC](v38, -1, -1);

    v6 = v176;
    v177 = *(void (**)(uint8_t *, uint64_t))(v7 + 8);
    v177(v19, v176);
    a1 = (uint64_t)v173;
  }
  else
  {

    swift_release_n();
    v177 = *(void (**)(uint8_t *, uint64_t))(v7 + 8);
    v177(v19, v6);
  }
  v174 = (_QWORD *)(v3 + 264);
  swift_beginAccess();
  v59 = *(_QWORD **)(v3 + 264);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v3 + 264) = v59;
  v61 = v171;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v59 = sub_213BEA5A0(0, v59[2] + 1, 1, v59);
    *v174 = v59;
  }
  v63 = v59[2];
  v62 = v59[3];
  if (v63 >= v62 >> 1)
  {
    v59 = sub_213BEA5A0((_QWORD *)(v62 > 1), v63 + 1, 1, v59);
    *v174 = v59;
  }
  v59[2] = v63 + 1;
  v59[v63 + 4] = a1;
  swift_endAccess();
  if (a1 == 1)
  {
    swift_beginAccess();
    v64 = *(void **)(v3 + 184);
    sub_213C127A4();
    v65 = *(_QWORD *)(v3 + 176);
    v23 = __OFADD__(v65, 1);
    v32 = v65 + 1;
    if (v23)
    {
LABEL_112:
      __break(1u);
LABEL_113:
      __break(1u);
      goto LABEL_114;
    }
    *(_QWORD *)(v3 + 176) = v32;
    v66 = v64;
    sub_213C127B0();
    swift_endAccess();

  }
  v19 = *(uint8_t **)(v61 + 16);
  value = MEMORY[0x24BEE4AF8];
  if (v19)
  {
    v184.value = MEMORY[0x24BEE4AF8];
    sub_213C0D540(0, (int64_t)v19, 0);
    value = v184.value;
    v68 = *(_QWORD *)(v184.value + 16);
    v69 = 24 * v68 + 32;
    v70 = (uint64_t *)(v61 + 48);
    do
    {
      v71 = *(v70 - 2);
      v72 = *(v70 - 1);
      v73 = *v70;
      v184.value = value;
      v74 = *(_QWORD *)(value + 24);
      v75 = v68 + 1;
      if (v68 >= v74 >> 1)
      {
        sub_213C0D540(v74 > 1, v68 + 1, 1);
        value = v184.value;
      }
      v70 += 4;
      *(_QWORD *)(value + 16) = v75;
      v76 = (_QWORD *)(value + v69);
      *v76 = v71;
      v76[1] = v72;
      v76[2] = v73;
      v69 += 24;
      v68 = v75;
      --v19;
    }
    while (v19);
    v6 = v176;
    a1 = (uint64_t)v173;
  }
  if (a1 == 1)
  {
    sub_213C0F014(value);
    swift_bridgeObjectRelease();
    v77 = sub_213C0AB4C();
  }
  else
  {
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D27EA0);
    v78 = swift_allocObject();
    *(_OWORD *)(v78 + 16) = xmmword_213C14E40;
    v79 = *(_QWORD *)(v3 + 240);
    *(_QWORD *)(v78 + 32) = *(_QWORD *)(v3 + 224);
    *(_QWORD *)(v78 + 40) = *(_QWORD *)(v3 + 232);
    *(_QWORD *)(v78 + 48) = v79;
    sub_213C0F014(v78);
    swift_bridgeObjectRelease();
    v77 = MEMORY[0x24BEE4AF8];
  }
  v80 = (uint8_t *)v172;
  sub_213C0F110(v77);
  swift_bridgeObjectRelease();
  v178((uint64_t)v80, v179, v6);
  swift_retain_n();
  v81 = sub_213C12570();
  v82 = sub_213C12750();
  if (os_log_type_enabled(v81, v82))
  {
    v19 = (uint8_t *)swift_slowAlloc();
    v83 = swift_slowAlloc();
    v184.value = v83;
    *(_DWORD *)v19 = 136315138;
    v84 = sub_213C0AC04();
    type metadata accessor for CMTime(0);
    v86 = MEMORY[0x2199BE79C](v84, v85);
    v88 = v87;
    swift_bridgeObjectRelease();
    v180 = sub_213BEB0C8(v86, v88, &v184.value);
    sub_213C127F8();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_213BCD000, v81, v82, "Current Gesture Timestamps FAC: %s", v19, 0xCu);
    swift_arrayDestroy();
    v89 = v83;
    v6 = v176;
    MEMORY[0x2199BF4BC](v89, -1, -1);
    MEMORY[0x2199BF4BC](v19, -1, -1);

    v90 = (uint8_t *)v172;
  }
  else
  {

    swift_release_n();
    v90 = v80;
  }
  v177(v90, v6);
  v91 = v170;
  v92 = *(_QWORD *)(sub_213C0C534() + 16);
  swift_bridgeObjectRelease();
  if (v92 <= 1)
  {
    v178((uint64_t)v91, v179, v6);
    swift_retain_n();
    v93 = sub_213C12570();
    v94 = sub_213C1275C();
    if (os_log_type_enabled(v93, v94))
    {
      v95 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v95 = 134217984;
      v19 = v95 + 12;
      v96 = *(_QWORD *)(sub_213C09580() + 16);
      swift_release();
      swift_bridgeObjectRelease();
      v184.value = v96;
      v6 = v176;
      sub_213C127F8();
      swift_release();
      _os_log_impl(&dword_213BCD000, v93, v94, "Obtained less faceprints than expected (%ld)", v95, 0xCu);
      MEMORY[0x2199BF4BC](v95, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    v177(v91, v6);
  }
  swift_beginAccess();
  v97 = *(_QWORD *)(v3 + 160);
  v98 = *(_QWORD *)(v3 + 144);
  v99 = *(id *)(v3 + 168);
  swift_bridgeObjectRetain();
  sub_213C127A4();
  sub_213C127B0();
  if ((v97 & 0x8000000000000000) != 0 || v97 >= *(_QWORD *)(v98 + 16))
  {

    swift_bridgeObjectRelease();
    v100 = 10;
  }
  else
  {
    v100 = *(_QWORD *)(v98 + 8 * v97 + 32);

    swift_bridgeObjectRelease();
  }
  v101 = *(_QWORD *)(v3 + 192);
  v102 = *(id *)(v3 + 200);
  sub_213C127A4();
  sub_213C127B0();

  v170 = (uint8_t *)(v3 + 257);
  sub_213C071D8(v100, (uint64_t)v173, v101, *(_BYTE *)(v3 + 258));
  sub_213C0AC04();
  sub_213C09580();
  sub_213C0C534();
  v103 = MEMORY[0x2199BF54C](v3 + 128);
  if (v103)
  {
    v19 = (uint8_t *)v103;
    v104 = *(_QWORD *)(v3 + 160);
    v105 = *(_QWORD *)(v3 + 144);
    v106 = *(id *)(v3 + 168);
    swift_bridgeObjectRetain();
    sub_213C127A4();
    sub_213C127B0();
    if ((v104 & 0x8000000000000000) != 0 || v104 >= *(_QWORD *)(v105 + 16))
    {
      swift_bridgeObjectRelease();
      v107 = 10;
    }
    else
    {
      v107 = *(_QWORD *)(v105 + 8 * v104 + 32);
      swift_bridgeObjectRelease();
    }

    v108 = (uint64_t)&v19[OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_delegate];
    swift_beginAccess();
    sub_213BDF4D4(v108, (uint64_t)&v184);
    if (v185)
    {
      sub_213BE2DA4((uint64_t)&v184, (uint64_t)&v180);
      sub_213BE4088((uint64_t)&v184, (uint64_t *)&unk_254D28D30);
      v109 = v182;
      v110 = v183;
      __swift_project_boxed_opaque_existential_1(&v180, v182);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v110 + 24))(v107, v109, v110);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v180);
    }
    else
    {
      sub_213BE4088((uint64_t)&v184, (uint64_t *)&unk_254D28D30);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    v6 = v176;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_beginAccess();
  v111 = *(void **)(v3 + 168);
  sub_213C127A4();
  v112 = *(_QWORD *)(v3 + 160);
  v23 = __OFADD__(v112, 1);
  v32 = v112 + 1;
  a1 = (uint64_t)v175;
  if (v23)
  {
    __break(1u);
    goto LABEL_112;
  }
  *(_QWORD *)(v3 + 160) = v32;
  v113 = v111;
  sub_213C127B0();
  swift_endAccess();

  swift_beginAccess();
  v114 = *(void **)(v3 + 200);
  sub_213C127A4();
  *(_QWORD *)(v3 + 192) = 0;
  v115 = v114;
  sub_213C127B0();
  swift_endAccess();

  sub_213C07F48();
  if (!sub_213C0C5EC())
  {
    v116 = *(_QWORD *)(v3 + 160);
    v117 = *(_QWORD *)(*(_QWORD *)(v3 + 144) + 16);
    v118 = *(id *)(v3 + 168);
    sub_213C127A4();
    sub_213C127B0();

    if (v116 < v117)
    {
      v173 = &v181;
      *(_QWORD *)&v119 = 136315138;
      v172 = v119;
      v7 = MEMORY[0x24BEE4AF8];
      v171 = MEMORY[0x24BEE4AD8] + 8;
      v169 = xmmword_213C14E40;
      do
      {
        v120 = *(_QWORD *)(v3 + 160);
        v121 = *(id *)(v3 + 168);
        sub_213C127A4();
        sub_213C127B0();

        if (!sub_213C0C99C(v120))
          break;
        v122 = *(_QWORD *)(v3 + 160);
        v123 = *(id *)(v3 + 168);
        sub_213C127A4();
        sub_213C127B0();

        if ((v122 & 0x8000000000000000) == 0
          && (v124 = *(_QWORD *)(v3 + 144), v122 < *(_QWORD *)(v124 + 16))
          && *(_QWORD *)(v124 + 8 * v122 + 32) == 4
          && *v170 == 1
          && !_AXSAttentionAwarenessFeaturesEnabled())
        {
          v146 = v168;
          v178((uint64_t)v168, v179, v6);
          swift_retain_n();
          v147 = sub_213C12570();
          v148 = sub_213C1275C();
          if (os_log_type_enabled(v147, v148))
          {
            v19 = (uint8_t *)swift_slowAlloc();
            v167 = swift_slowAlloc();
            v184.value = v167;
            *(_DWORD *)v19 = v172;
            v149 = *(_QWORD *)(v3 + 160);
            v150 = *(_QWORD *)(v3 + 144);
            v151 = *(id *)(v3 + 168);
            swift_bridgeObjectRetain();
            sub_213C127A4();
            sub_213C127B0();
            if ((v149 & 0x8000000000000000) != 0 || v149 >= *(_QWORD *)(v150 + 16))
            {

              swift_bridgeObjectRelease();
              v152 = 10;
            }
            else
            {
              v152 = *(_QWORD *)(v150 + 8 * v149 + 32);

              swift_bridgeObjectRelease();
            }
            v153 = PADSWGesture.description.getter(v152);
            v180 = sub_213BEB0C8(v153, v154, &v184.value);
            sub_213C127F8();
            swift_release_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_213BCD000, v147, v148, "Skipping gesture %s because attention awareness features are disabled.", v19, 0xCu);
            v155 = v167;
            swift_arrayDestroy();
            MEMORY[0x2199BF4BC](v155, -1, -1);
            MEMORY[0x2199BF4BC](v19, -1, -1);

            v177(v168, v6);
            a1 = (uint64_t)v175;
          }
          else
          {

            swift_release_n();
            v177(v146, v6);
          }
          CMTimeMake(&v184, 1, 1000000000);
          v156 = v184.value;
          epoch = v184.epoch;
          v158 = *(_QWORD *)&v184.timescale;
          __swift_instantiateConcreteTypeFromMangledName(&qword_254D27EA0);
          v159 = swift_allocObject();
          *(_OWORD *)(v159 + 16) = v169;
          *(_QWORD *)(v159 + 32) = v156;
          *(_QWORD *)(v159 + 40) = v158;
          *(_QWORD *)(v159 + 48) = epoch;
          sub_213C0F014(v159);
          swift_bridgeObjectRelease();
          swift_beginAccess();
          v160 = *(_QWORD **)(v3 + 264);
          v161 = swift_isUniquelyReferenced_nonNull_native();
          *(_QWORD *)(v3 + 264) = v160;
          if ((v161 & 1) == 0)
          {
            v160 = sub_213BEA5A0(0, v160[2] + 1, 1, v160);
            *v174 = v160;
          }
          v163 = v160[2];
          v162 = v160[3];
          if (v163 >= v162 >> 1)
          {
            v160 = sub_213BEA5A0((_QWORD *)(v162 > 1), v163 + 1, 1, v160);
            *v174 = v160;
          }
          v160[2] = v163 + 1;
          v160[v163 + 4] = 3;
        }
        else
        {
          v178(a1, v179, v6);
          swift_retain_n();
          v125 = sub_213C12570();
          v126 = sub_213C12750();
          if (os_log_type_enabled(v125, v126))
          {
            v19 = (uint8_t *)swift_slowAlloc();
            v127 = swift_slowAlloc();
            v184.value = v127;
            *(_DWORD *)v19 = v172;
            v128 = *(_QWORD *)(v3 + 160);
            v129 = *(_QWORD *)(v3 + 144);
            v130 = *(id *)(v3 + 168);
            swift_bridgeObjectRetain();
            sub_213C127A4();
            sub_213C127B0();
            if ((v128 & 0x8000000000000000) != 0 || v128 >= *(_QWORD *)(v129 + 16))
            {

              swift_bridgeObjectRelease();
              v131 = 10;
            }
            else
            {
              v131 = *(_QWORD *)(v129 + 8 * v128 + 32);

              swift_bridgeObjectRelease();
            }
            v133 = PADSWGesture.description.getter(v131);
            v180 = sub_213BEB0C8(v133, v134, &v184.value);
            sub_213C127F8();
            swift_release_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_213BCD000, v125, v126, "Skipping gesture %s because accessibility option is enabled.", v19, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x2199BF4BC](v127, -1, -1);
            MEMORY[0x2199BF4BC](v19, -1, -1);

            a1 = (uint64_t)v175;
            v132 = v175;
            v6 = v176;
          }
          else
          {

            swift_release_n();
            v132 = (uint8_t *)a1;
          }
          v177(v132, v6);
          sub_213C0F014(v7);
          swift_beginAccess();
          v135 = *(_QWORD **)(v3 + 264);
          v136 = swift_isUniquelyReferenced_nonNull_native();
          *(_QWORD *)(v3 + 264) = v135;
          if ((v136 & 1) == 0)
          {
            v135 = sub_213BEA5A0(0, v135[2] + 1, 1, v135);
            *v174 = v135;
          }
          v138 = v135[2];
          v137 = v135[3];
          if (v138 >= v137 >> 1)
          {
            v135 = sub_213BEA5A0((_QWORD *)(v137 > 1), v138 + 1, 1, v135);
            *v174 = v135;
          }
          v135[2] = v138 + 1;
          v135[v138 + 4] = 0;
        }
        swift_endAccess();
        sub_213C0F20C(v7);
        sub_213C0F308(v7);
        sub_213C0F110(v7);
        swift_beginAccess();
        v139 = *(void **)(v3 + 168);
        sub_213C127A4();
        v140 = *(_QWORD *)(v3 + 160);
        v23 = __OFADD__(v140, 1);
        v141 = v140 + 1;
        if (v23)
        {
          __break(1u);
          goto LABEL_108;
        }
        *(_QWORD *)(v3 + 160) = v141;
        v142 = v139;
        sub_213C127B0();
        swift_endAccess();

        v143 = *(_QWORD *)(v3 + 160);
        v144 = *(_QWORD *)(*(_QWORD *)(v3 + 144) + 16);
        v145 = *(id *)(v3 + 168);
        sub_213C127A4();
        sub_213C127B0();

      }
      while (v143 < v144);
    }
  }
  sub_213C0ACBC();
}

uint64_t sub_213C0C534()
{
  _QWORD *v0;
  unint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;

  swift_beginAccess();
  v1 = v0[20];
  v2 = (void *)v0[21];
  swift_beginAccess();
  v3 = v0[36];
  v4 = v2;
  swift_bridgeObjectRetain();
  sub_213C127A4();
  sub_213C127B0();
  if ((v1 & 0x8000000000000000) != 0 || v1 >= *(_QWORD *)(v3 + 16))
  {

    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  else
  {
    v5 = *(_QWORD *)(v3 + 8 * v1 + 32);
    swift_bridgeObjectRetain();

    swift_bridgeObjectRelease();
  }
  return v5;
}

BOOL sub_213C0C5EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v1 = v0;
  swift_beginAccess();
  v2 = *(_QWORD *)(v0 + 264);
  v3 = *(_QWORD *)(v2 + 16);
  if (v3)
  {
    swift_bridgeObjectRetain();
    v4 = 0;
    v5 = MEMORY[0x24BEE4AF8];
    do
    {
      if (*(_QWORD *)(v2 + 8 * v4 + 32) == 1)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          sub_213C0D4C4(0, *(_QWORD *)(v5 + 16) + 1, 1);
        v7 = *(_QWORD *)(v5 + 16);
        v6 = *(_QWORD *)(v5 + 24);
        if (v7 >= v6 >> 1)
          sub_213C0D4C4(v6 > 1, v7 + 1, 1);
        *(_QWORD *)(v5 + 16) = v7 + 1;
        *(_QWORD *)(v5 + 8 * v7 + 32) = 1;
      }
      ++v4;
    }
    while (v3 != v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = MEMORY[0x24BEE4AF8];
  }
  v8 = *(_QWORD *)(v5 + 16);
  swift_release();
  return v8 >= *(_QWORD *)(v1 + 152);
}

uint64_t sub_213C0C718(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t result;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;

  v8 = sub_213C0C534();
  v9 = *(_QWORD **)(v8 + 16);
  if (v9)
  {
    if ((sub_213C127D4() & 1) != 0)
      return swift_bridgeObjectRelease();
    if (v9 != (_QWORD *)1)
    {
      v10 = v8 + 72;
      v11 = 1;
      while (1)
      {
        v12 = (_QWORD *)(v11 + 1);
        if (__OFADD__(v11, 1))
          break;
        if ((sub_213C127D4() & 1) != 0)
          return swift_bridgeObjectRelease();
        v10 += 24;
        ++v11;
        if (v12 == v9)
          goto LABEL_9;
      }
      __break(1u);
      goto LABEL_23;
    }
  }
LABEL_9:
  swift_bridgeObjectRelease();
  v13 = *(_QWORD *)(sub_213C09580() + 16);
  swift_bridgeObjectRelease();
  if (v13 != 2)
  {
LABEL_13:
    swift_bridgeObjectRetain();
    v9 = (_QWORD *)sub_213C09580();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
    {
LABEL_14:
      v16 = v9[2];
      v15 = v9[3];
      if (v16 >= v15 >> 1)
        v9 = sub_213BEA6D0((_QWORD *)(v15 > 1), v16 + 1, 1, v9);
      v9[2] = v16 + 1;
      v9[v16 + 4] = a1;
      sub_213C0F20C((uint64_t)v9);
      swift_bridgeObjectRelease();
      v17 = (_QWORD *)sub_213C0C534();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v17 = sub_213BEA5AC(0, v17[2] + 1, 1, v17);
      v19 = v17[2];
      v18 = v17[3];
      if (v19 >= v18 >> 1)
        v17 = sub_213BEA5AC((_QWORD *)(v18 > 1), v19 + 1, 1, v17);
      v17[2] = v19 + 1;
      v20 = &v17[3 * v19];
      v20[4] = a2;
      v20[5] = a3;
      v20[6] = a4;
      sub_213C0F308((uint64_t)v17);
      return swift_bridgeObjectRelease();
    }
LABEL_23:
    v9 = sub_213BEA6D0(0, v9[2] + 1, 1, v9);
    goto LABEL_14;
  }
  result = sub_213C09580();
  v21 = result;
  if (*(_QWORD *)(result + 16))
  {
    sub_213C0F428(0, 1);
    sub_213C0F20C(v21);
    swift_bridgeObjectRelease();
    result = sub_213C0C534();
    v22 = result;
    if (*(_QWORD *)(result + 16))
    {
      sub_213C0F598(0, 1);
      sub_213C0F308(v22);
      swift_bridgeObjectRelease();
      goto LABEL_13;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

BOOL sub_213C0C99C(unint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((a1 & 0x8000000000000000) == 0)
  {
    v3 = *(_QWORD *)(v1 + 144);
    if (*(_QWORD *)(v3 + 16) > a1)
    {
      v4 = *(_QWORD *)(v3 + 8 * a1 + 32);
      swift_beginAccess();
      v5 = *(_QWORD *)(v1 + 248);
      if (v4 > 9)
      {
        if (!sub_213C0CA6C(3, v5))
          goto LABEL_5;
      }
      else if (!sub_213C0CA6C(qword_213C161F0[v4], v5))
      {
LABEL_5:
        v6 = *(_QWORD *)(v1 + 144);
        if (*(_QWORD *)(v6 + 16) > a1 && *(_QWORD *)(v6 + 8 * a1 + 32) == 4 && *(_BYTE *)(v1 + 257) == 1)
          return _AXSAttentionAwarenessFeaturesEnabled() == 0;
        return 0;
      }
      return 1;
    }
  }
  return 0;
}

BOOL sub_213C0CA6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 result;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  if (!*(_QWORD *)(a2 + 16))
    return 0;
  sub_213C12A50();
  sub_213C12A5C();
  v4 = sub_213C12A68();
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = v4 & ~v5;
  v7 = a2 + 56;
  if (((*(_QWORD *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
    return 0;
  v8 = *(_QWORD *)(a2 + 48);
  if (*(_QWORD *)(v8 + 8 * v6) == a1)
    return 1;
  v10 = ~v5;
  v11 = (v6 + 1) & v10;
  if (((*(_QWORD *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) == 0)
    return 0;
  do
  {
    v12 = *(_QWORD *)(v8 + 8 * v11);
    result = v12 == a1;
    if (v12 == a1)
      break;
    v11 = (v11 + 1) & v10;
  }
  while (((*(_QWORD *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
  return result;
}

uint64_t sub_213C0CB58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t *v19;
  float v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  int64_t v24;
  int64_t v25;
  _QWORD *v26;
  int64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  uint64_t v37;
  uint64_t v38;
  uint64_t result;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[6];

  v2 = *(_QWORD *)(*(_QWORD *)(v0 + 144) + 16);
  v3 = (uint64_t *)(v0 + 264);
  swift_beginAccess();
  v4 = v2 - *(_QWORD *)(*(_QWORD *)(v0 + 264) + 16);
  if (v4 < 0)
  {
LABEL_66:
    __break(1u);
LABEL_67:
    v1 = (uint64_t)sub_213BEA5A0(0, *(_QWORD *)(v1 + 16) + 1, 1, (_QWORD *)v1);
    goto LABEL_4;
  }
  if (!v4)
    goto LABEL_8;
  swift_beginAccess();
  v1 = *v3;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v3 = v1;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    goto LABEL_67;
  do
  {
LABEL_4:
    *v3 = v1;
    v7 = *(_QWORD *)(v1 + 16);
    v6 = *(_QWORD *)(v1 + 24);
    if (v7 >= v6 >> 1)
    {
      v1 = (uint64_t)sub_213BEA5A0((_QWORD *)(v6 > 1), v7 + 1, 1, (_QWORD *)v1);
      *v3 = v1;
    }
    *(_QWORD *)(v1 + 16) = v7 + 1;
    *(_QWORD *)(v1 + 8 * v7 + 32) = 2;
    v1 = *v3;
    --v4;
  }
  while (v4);
  swift_endAccess();
LABEL_8:
  v8 = v0 + 272;
  swift_beginAccess();
  v4 = *(_QWORD *)(*(_QWORD *)(v0 + 272) + 16);
  v9 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v40 = (uint64_t *)v0;
  if (v4)
  {
    v41 = v0 + 280;
    swift_beginAccess();
    v10 = -v4;
    v11 = MEMORY[0x24BEE4AF8];
    v1 = 4;
    v9 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      v12 = v1 - 4;
      if ((unint64_t)(v1 - 4) < *(_QWORD *)(*v3 + 16) && *(_QWORD *)(*v3 + 8 * v1) == 1)
      {
        if (v12 >= *(_QWORD *)(*(_QWORD *)v41 + 16))
          goto LABEL_64;
        if (v12 >= *(_QWORD *)(*(_QWORD *)v8 + 16))
        {
LABEL_65:
          __break(1u);
          goto LABEL_66;
        }
        v43[0] = *(_QWORD *)(*(_QWORD *)v41 + 8 * v1);
        swift_bridgeObjectRetain();
        v13 = swift_bridgeObjectRetain();
        sub_213C0EC60(v13);
        v0 = v43[0];
      }
      else
      {
        v0 = v11;
        if (v12 < *(_QWORD *)(*(_QWORD *)v8 + 16))
        {
          v14 = *(_QWORD **)(*(_QWORD *)v8 + 8 * v1);
          if (v14[2])
          {
            v15 = v14[4];
            v16 = v14[6];
            __swift_instantiateConcreteTypeFromMangledName(&qword_254D27EA0);
            v0 = swift_allocObject();
            v17 = v14[5];
            *(_OWORD *)(v0 + 16) = xmmword_213C14E40;
            *(_QWORD *)(v0 + 32) = v15;
            *(_QWORD *)(v0 + 40) = v17;
            *(_QWORD *)(v0 + 48) = v16;
          }
          else
          {
            v0 = v11;
          }
        }
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v9 = sub_213BEA6E4(0, v9[2] + 1, 1, v9);
      v4 = v9[2];
      v18 = v9[3];
      if (v4 >= v18 >> 1)
        v9 = sub_213BEA6E4((_QWORD *)(v18 > 1), v4 + 1, 1, v9);
      v9[2] = v4 + 1;
      v9[v4 + 4] = v0;
      ++v1;
    }
    while (v10 + v1 != 4);
  }
  v19 = v40;
  if (v40[19])
    v20 = (float)sub_213C0786C() / (float)v40[19];
  else
    v20 = 0.0;
  v21 = v40[33];
  swift_beginAccess();
  v0 = v40[37];
  v3 = *(uint64_t **)(v0 + 16);
  if (v3)
  {
    v42 = v21;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v4 = 0;
    v22 = (_QWORD *)MEMORY[0x24BEE4AF8];
    while (1)
    {
      v1 = *(_QWORD *)(v0 + 8 * v4 + 32);
      v23 = *(_QWORD *)(v1 + 16);
      v24 = v22[2];
      v25 = v24 + v23;
      if (__OFADD__(v24, v23))
      {
        __break(1u);
LABEL_61:
        __break(1u);
LABEL_62:
        __break(1u);
LABEL_63:
        __break(1u);
LABEL_64:
        __break(1u);
        goto LABEL_65;
      }
      swift_bridgeObjectRetain();
      v26 = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
      if ((_DWORD)v26 && v25 <= v22[3] >> 1)
      {
        if (*(_QWORD *)(v1 + 16))
          goto LABEL_40;
      }
      else
      {
        if (v24 <= v25)
          v27 = v24 + v23;
        else
          v27 = v24;
        v22 = sub_213BEA6D0(v26, v27, 1, v22);
        if (*(_QWORD *)(v1 + 16))
        {
LABEL_40:
          v28 = v22[2];
          if ((v22[3] >> 1) - v28 < v23)
            goto LABEL_62;
          v29 = (unint64_t)&v22[v28 + 4];
          if (v1 + 32 < v29 + 8 * v23 && v29 < v1 + 32 + 8 * v23)
          {
            result = sub_213C12948();
            __break(1u);
            return result;
          }
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D29880);
          swift_arrayInitWithCopy();
          if (v23)
          {
            v31 = v22[2];
            v32 = __OFADD__(v31, v23);
            v33 = v31 + v23;
            if (v32)
              goto LABEL_63;
            v22[2] = v33;
          }
          goto LABEL_30;
        }
      }
      if (v23)
        goto LABEL_61;
LABEL_30:
      ++v4;
      swift_bridgeObjectRelease();
      if (v3 == (uint64_t *)v4)
      {
        swift_bridgeObjectRelease();
        v19 = v40;
        v21 = v42;
        goto LABEL_51;
      }
    }
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v22 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_51:
  swift_beginAccess();
  v34 = v19[36];
  v43[0] = MEMORY[0x24BEE4AF8];
  v35 = *(_QWORD *)(v34 + 16);
  if (v35)
  {
    swift_bridgeObjectRetain_n();
    for (i = 0; i != v35; ++i)
    {
      v37 = swift_bridgeObjectRetain();
      sub_213C0EC60(v37);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v38 = v43[0];
  *(float *)v43 = v20;
  v43[1] = v21;
  v43[2] = v9;
  v43[3] = v22;
  v43[4] = v38;
  if (MEMORY[0x2199BF54C](v19 + 16))
  {
    sub_213BE1008(v43);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_213C0D110()
{
  id *v0;

  sub_213BFEF0C((uint64_t)(v0 + 16));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

id *sub_213C0D17C()
{
  id *v0;

  v0 = (id *)sub_213BFC240();
  sub_213BFEF0C((uint64_t)(v0 + 16));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_213C0D200()
{
  sub_213C0D17C();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PADFaceActionController()
{
  return objc_opt_self();
}

uint64_t destroy for PADFaceActionControllerResult()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PADFaceActionControllerResult(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PADFaceActionControllerResult(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for PADFaceActionControllerResult(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PADFaceActionControllerResult(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PADFaceActionControllerResult(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PADFaceActionControllerResult()
{
  return &type metadata for PADFaceActionControllerResult;
}

uint64_t sub_213C0D474(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_213C0DAEC(a1, a2, a3, *v3, &qword_254D298E0);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_213C0D498(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_213C0D960(a1, a2, a3, (_QWORD *)*v3, &qword_254D298E8, &qword_254D298F0);
  *v3 = result;
  return result;
}

uint64_t sub_213C0D4C4(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_213C0DAEC(a1, a2, a3, *v3, &qword_254D27EA8);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_213C0D4E8(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_213C0D960(a1, a2, a3, (_QWORD *)*v3, &qword_254D27EB0, (uint64_t *)&unk_254D29930);
  *v3 = result;
  return result;
}

uint64_t sub_213C0D514(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_213C0D960(a1, a2, a3, (_QWORD *)*v3, &qword_254D27E98, (uint64_t *)&unk_254D29940);
  *v3 = result;
  return result;
}

uint64_t sub_213C0D540(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_213C0D67C(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_213C0D55C(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_213C0D960(a1, a2, a3, (_QWORD *)*v3, (uint64_t *)&unk_254D298A0, &qword_254D27FC0);
  *v3 = result;
  return result;
}

uint64_t sub_213C0D588(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_213C0D960(a1, a2, a3, (_QWORD *)*v3, (uint64_t *)&unk_254D29910, &qword_254D27FB8);
  *v3 = result;
  return result;
}

uint64_t sub_213C0D5B4(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_213C0D7F4(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_213C0D5D0(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_213C0D960(a1, a2, a3, (_QWORD *)*v3, (uint64_t *)&unk_254D29900, (uint64_t *)&unk_254D29880);
  *v3 = result;
  return result;
}

uint64_t sub_213C0D5FC(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_213C0DAEC(a1, a2, a3, *v3, &qword_254D27EF8);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_213C0D620(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_213C0DC44(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_213C0D63C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_213C0DAEC(a1, a2, a3, *v3, (uint64_t *)&unk_254D298B0);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_213C0D660(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_213C0DDA0(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_213C0D67C(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D27EA0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8])
      memmove(v12, v13, 24 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[24 * v8] || v12 >= &v13[24 * v8])
  {
    memcpy(v12, v13, 24 * v8);
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_213C12948();
  __break(1u);
  return result;
}

uint64_t sub_213C0D7F4(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D298F8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_213C12948();
  __break(1u);
  return result;
}

uint64_t sub_213C0D960(char a1, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t *a6)
{
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = a4[2];
  if (v10 <= v11)
    v12 = a4[2];
  else
    v12 = v10;
  if (v12)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v13 = (_QWORD *)swift_allocObject();
    v14 = _swift_stdlib_malloc_size(v13);
    v15 = v14 - 32;
    if (v14 < 32)
      v15 = v14 - 25;
    v13[2] = v11;
    v13[3] = 2 * (v15 >> 3);
  }
  else
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v16 = (unint64_t)(v13 + 4);
  v17 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v13 != a4 || v16 >= v17 + 8 * v11)
      memmove(v13 + 4, a4 + 4, 8 * v11);
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v17 >= v16 + 8 * v11 || v16 >= v17 + 8 * v11)
  {
    __swift_instantiateConcreteTypeFromMangledName(a6);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_32:
  result = sub_213C12948();
  __break(1u);
  return result;
}

uint64_t sub_213C0DAEC(char a1, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v7 = *((_QWORD *)a4 + 3);
    v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v8 = a2;
    }
  }
  else
  {
    v8 = a2;
  }
  v9 = *((_QWORD *)a4 + 2);
  if (v8 <= v9)
    v10 = *((_QWORD *)a4 + 2);
  else
    v10 = v8;
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v11 = (char *)swift_allocObject();
    v12 = _swift_stdlib_malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 25;
    *((_QWORD *)v11 + 2) = v9;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 3);
  }
  else
  {
    v11 = (char *)MEMORY[0x24BEE4AF8];
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[8 * v9])
      memmove(v14, v15, 8 * v9);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v15 >= &v14[8 * v9] || v14 >= &v15[8 * v9])
  {
    memcpy(v14, v15, 8 * v9);
LABEL_30:
    swift_release();
    return (uint64_t)v11;
  }
LABEL_32:
  result = sub_213C12948();
  __break(1u);
  return result;
}

uint64_t sub_213C0DC44(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D27EB8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 29;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8])
      memmove(v13, v14, 4 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[4 * v8] || v13 >= &v14[4 * v8])
  {
    memcpy(v13, v14, 4 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_213C12948();
  __break(1u);
  return result;
}

uint64_t sub_213C0DDA0(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D298C0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_213C12948();
  __break(1u);
  return result;
}

unint64_t sub_213C0DF08(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_213C12A50();
  sub_213C1263C();
  v4 = sub_213C12A68();
  return sub_213C0E02C(a1, a2, v4);
}

unint64_t sub_213C0DF6C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_213C12834();
  return sub_213C0E10C(a1, v2);
}

unint64_t sub_213C0DFA0(uint64_t a1)
{
  uint64_t v2;

  sub_213C1260C();
  sub_213C12A50();
  sub_213C1263C();
  v2 = sub_213C12A68();
  swift_bridgeObjectRelease();
  return sub_213C0E1D0(a1, v2);
}

unint64_t sub_213C0E02C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_213C12A14() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_213C12A14() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_213C0E10C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_213C0F860(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x2199BE940](v9, a1);
      sub_213BFA004((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_213C0E1D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = sub_213C1260C();
    v8 = v7;
    if (v6 == sub_213C1260C() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_213C12A14();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = sub_213C1260C();
          v15 = v14;
          if (v13 == sub_213C1260C() && v15 == v16)
            break;
          v18 = sub_213C12A14();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_213C0E344(uint64_t *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v13;

  v5 = *v2;
  sub_213C12A50();
  sub_213C12A5C();
  v6 = sub_213C12A68();
  v7 = -1 << *(_BYTE *)(v5 + 32);
  v8 = v6 & ~v7;
  if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v13 = *v2;
    *v2 = 0x8000000000000000;
    sub_213C0E708(a2, v8, isUniquelyReferenced_nonNull_native);
    *v2 = v13;
    swift_bridgeObjectRelease();
    result = 1;
    goto LABEL_8;
  }
  v9 = *(_QWORD *)(v5 + 48);
  if (*(_QWORD *)(v9 + 8 * v8) != a2)
  {
    v10 = ~v7;
    do
    {
      v8 = (v8 + 1) & v10;
      if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
        goto LABEL_7;
    }
    while (*(_QWORD *)(v9 + 8 * v8) != a2);
  }
  result = 0;
  a2 = *(_QWORD *)(*(_QWORD *)(*v2 + 48) + 8 * v8);
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_213C0E460()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D29920);
  result = sub_213C12864();
  v4 = result;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 0;
    v6 = (_QWORD *)(v2 + 56);
    v7 = 1 << *(_BYTE *)(v2 + 32);
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(v2 + 56);
    v10 = (unint64_t)(v7 + 63) >> 6;
    v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        v14 = v13 | (v5 << 6);
      }
      else
      {
        v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10)
          goto LABEL_33;
        v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          v5 = v15 + 1;
          if (v15 + 1 >= v10)
            goto LABEL_33;
          v16 = v6[v5];
          if (!v16)
          {
            v5 = v15 + 2;
            if (v15 + 2 >= v10)
              goto LABEL_33;
            v16 = v6[v5];
            if (!v16)
            {
              v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                v26 = 1 << *(_BYTE *)(v2 + 32);
                if (v26 > 63)
                  bzero((void *)(v2 + 56), ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v6 = -1 << v26;
                v1 = v0;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  v5 = v17 + 1;
                  if (__OFADD__(v17, 1))
                    goto LABEL_39;
                  if (v5 >= v10)
                    goto LABEL_33;
                  v16 = v6[v5];
                  ++v17;
                  if (v16)
                    goto LABEL_23;
                }
              }
              v5 = v17;
            }
          }
        }
LABEL_23:
        v9 = (v16 - 1) & v16;
        v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v14);
      sub_213C12A50();
      sub_213C12A5C();
      result = sub_213C12A68();
      v19 = -1 << *(_BYTE *)(v4 + 32);
      v20 = result & ~v19;
      v21 = v20 >> 6;
      if (((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v22 = 0;
        v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v24 = v21 == v23;
          if (v21 == v23)
            v21 = 0;
          v22 |= v24;
          v25 = *(_QWORD *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(_QWORD *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v12) = v18;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_213C0E708(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  v5 = result;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_213C0E460();
  }
  else
  {
    if (v7 > v6)
    {
      result = (uint64_t)sub_213C0E854();
      goto LABEL_14;
    }
    sub_213C0E9E8();
  }
  v8 = *v3;
  sub_213C12A50();
  sub_213C12A5C();
  result = sub_213C12A68();
  v9 = -1 << *(_BYTE *)(v8 + 32);
  a2 = result & ~v9;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v10 = *(_QWORD *)(v8 + 48);
    if (*(_QWORD *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      result = sub_213C12A2C();
      __break(1u);
    }
    else
    {
      v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        if (*(_QWORD *)(v10 + 8 * a2) == v5)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v12 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v12 + 48) + 8 * a2) = v5;
  v13 = *(_QWORD *)(v12 + 16);
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    *(_QWORD *)(v12 + 16) = v15;
  return result;
}

void *sub_213C0E854()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D29920);
  v2 = *v0;
  v3 = sub_213C12858();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      v9 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_28;
      v17 = *(_QWORD *)(v6 + 8 * v9);
      if (!v17)
      {
        v9 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_28;
        v17 = *(_QWORD *)(v6 + 8 * v9);
        if (!v17)
          break;
      }
    }
LABEL_27:
    v12 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v15) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v9);
    ++v18;
    if (v17)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_213C0E9E8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D29920);
  result = sub_213C12864();
  v4 = result;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 0;
  v6 = v2 + 56;
  v7 = 1 << *(_BYTE *)(v2 + 32);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v2 + 56);
  v10 = (unint64_t)(v7 + 63) >> 6;
  v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      v5 = v15 + 1;
      if (v15 + 1 >= v10)
        goto LABEL_33;
      v16 = *(_QWORD *)(v6 + 8 * v5);
      if (!v16)
      {
        v5 = v15 + 2;
        if (v15 + 2 >= v10)
          goto LABEL_33;
        v16 = *(_QWORD *)(v6 + 8 * v5);
        if (!v16)
          break;
      }
    }
LABEL_23:
    v9 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v14);
    sub_213C12A50();
    sub_213C12A5C();
    result = sub_213C12A68();
    v19 = -1 << *(_BYTE *)(v4 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v24 = v21 == v23;
        if (v21 == v23)
          v21 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(_QWORD *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v12) = v18;
    ++*(_QWORD *)(v4 + 16);
  }
  v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    result = swift_release();
    v1 = v0;
    goto LABEL_35;
  }
  v16 = *(_QWORD *)(v6 + 8 * v17);
  if (v16)
  {
    v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v5 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v5 >= v10)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v5);
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_213C0EC60(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int64_t v14;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v14 = v4 + v2;
  else
    v14 = v4;
  v3 = sub_213BEA5AC(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v9 = &v3[3 * v8 + 4];
  if (a1 + 32 < (unint64_t)&v9[3 * v2] && (unint64_t)v9 < a1 + 32 + 24 * v2)
    goto LABEL_24;
  memcpy(v9, (const void *)(a1 + 32), 24 * v2);
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
  v11 = v3[2];
  v12 = __OFADD__(v11, v2);
  v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_213C12948();
  __break(1u);
  return result;
}

uint64_t sub_213C0EDAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  dispatch_semaphore_t v11;
  dispatch_semaphore_t v12;
  dispatch_semaphore_t v13;
  dispatch_semaphore_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v22 = a3;
  v23 = a2;
  v24 = a1;
  v4 = sub_213C12774();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_213C12768();
  MEMORY[0x24BDAC7A8](v8);
  v9 = sub_213C125AC();
  MEMORY[0x24BDAC7A8](v9);
  *(_QWORD *)(v3 + 136) = 0;
  swift_unknownObjectWeakInit();
  v10 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v3 + 144) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v3 + 152) = 3;
  swift_retain();
  v11 = dispatch_semaphore_create(1);
  *(_QWORD *)(v3 + 160) = 0;
  *(_QWORD *)(v3 + 168) = v11;
  v12 = dispatch_semaphore_create(1);
  *(_QWORD *)(v3 + 176) = 0;
  *(_QWORD *)(v3 + 184) = v12;
  v13 = dispatch_semaphore_create(1);
  *(_QWORD *)(v3 + 192) = 0;
  *(_QWORD *)(v3 + 200) = v13;
  v14 = dispatch_semaphore_create(1);
  *(_QWORD *)(v3 + 208) = 0;
  *(_QWORD *)(v3 + 216) = v14;
  v15 = MEMORY[0x24BDC0D88];
  v16 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  *(_QWORD *)(v3 + 224) = *MEMORY[0x24BDC0D88];
  v17 = *(_QWORD *)(v15 + 8);
  v18 = MEMORY[0x24BEE4B08];
  *(_QWORD *)(v3 + 232) = v17;
  *(_QWORD *)(v3 + 240) = v16;
  *(_QWORD *)(v3 + 248) = v18;
  *(_BYTE *)(v3 + 256) = 1;
  *(_DWORD *)(v3 + 257) = 0;
  *(_BYTE *)(v3 + 261) = 0;
  *(_QWORD *)(v3 + 264) = v10;
  *(_QWORD *)(v3 + 272) = v10;
  *(_QWORD *)(v3 + 280) = v10;
  *(_QWORD *)(v3 + 288) = v10;
  *(_QWORD *)(v3 + 296) = v10;
  swift_release();
  sub_213BF1DCC(0, &qword_254D27FE0);
  sub_213C125A0();
  v25 = v10;
  sub_213C0F89C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D286C0);
  sub_213C0F8E4();
  sub_213C1281C();
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BEE5750], v4);
  v19 = sub_213C12798();
  v20 = sub_213BFA1F4(v19, v22);
  *(_QWORD *)(v20 + 136) = v23;
  swift_unknownObjectWeakAssign();
  return v20;
}

void sub_213C0F014(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  char isUniquelyReferenced_nonNull_native;

  swift_beginAccess();
  v4 = *(_QWORD *)(v1 + 160);
  v3 = *(void **)(v1 + 168);
  v5 = v1 + 272;
  swift_beginAccess();
  v6 = v3;
  sub_213C127A4();
  sub_213C127B0();
  if ((v4 & 0x8000000000000000) != 0)
    goto LABEL_7;
  v7 = *(_QWORD **)v5;
  if (v4 >= *(_QWORD *)(*(_QWORD *)v5 + 16))
    goto LABEL_7;
  swift_bridgeObjectRetain_n();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)v5 = v7;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v7 = sub_213C103CC(v7);
    *(_QWORD *)v5 = v7;
  }
  if (v4 < v7[2])
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v7[v4 + 4] = a1;
    swift_bridgeObjectRelease_n();
LABEL_7:
    swift_endAccess();

    return;
  }
  __break(1u);
}

void sub_213C0F110(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  char isUniquelyReferenced_nonNull_native;

  swift_beginAccess();
  v4 = *(_QWORD *)(v1 + 160);
  v3 = *(void **)(v1 + 168);
  v5 = v1 + 280;
  swift_beginAccess();
  v6 = v3;
  sub_213C127A4();
  sub_213C127B0();
  if ((v4 & 0x8000000000000000) != 0)
    goto LABEL_7;
  v7 = *(_QWORD **)v5;
  if (v4 >= *(_QWORD *)(*(_QWORD *)v5 + 16))
    goto LABEL_7;
  swift_bridgeObjectRetain_n();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)v5 = v7;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v7 = sub_213C103CC(v7);
    *(_QWORD *)v5 = v7;
  }
  if (v4 < v7[2])
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v7[v4 + 4] = a1;
    swift_bridgeObjectRelease_n();
LABEL_7:
    swift_endAccess();

    return;
  }
  __break(1u);
}

void sub_213C0F20C(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  char isUniquelyReferenced_nonNull_native;

  swift_beginAccess();
  v4 = *(_QWORD *)(v1 + 160);
  v3 = *(void **)(v1 + 168);
  v5 = v1 + 296;
  swift_beginAccess();
  v6 = v3;
  sub_213C127A4();
  sub_213C127B0();
  if ((v4 & 0x8000000000000000) != 0)
    goto LABEL_7;
  v7 = *(_QWORD **)v5;
  if (v4 >= *(_QWORD *)(*(_QWORD *)v5 + 16))
    goto LABEL_7;
  swift_bridgeObjectRetain_n();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)v5 = v7;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v7 = sub_213C103E0(v7);
    *(_QWORD *)v5 = v7;
  }
  if (v4 < v7[2])
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v7[v4 + 4] = a1;
    swift_bridgeObjectRelease_n();
LABEL_7:
    swift_endAccess();

    return;
  }
  __break(1u);
}

void sub_213C0F308(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  char isUniquelyReferenced_nonNull_native;

  swift_beginAccess();
  v4 = *(_QWORD *)(v1 + 160);
  v3 = *(void **)(v1 + 168);
  v5 = v1 + 288;
  swift_beginAccess();
  v6 = v3;
  sub_213C127A4();
  sub_213C127B0();
  if ((v4 & 0x8000000000000000) != 0)
    goto LABEL_7;
  v7 = *(_QWORD **)v5;
  if (v4 >= *(_QWORD *)(*(_QWORD *)v5 + 16))
    goto LABEL_7;
  swift_bridgeObjectRetain_n();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)v5 = v7;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v7 = sub_213C103CC(v7);
    *(_QWORD *)v5 = v7;
  }
  if (v4 < v7[2])
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v7[v4 + 4] = a1;
    swift_bridgeObjectRelease_n();
LABEL_7:
    swift_endAccess();

    return;
  }
  __break(1u);
}

uint64_t sub_213C0F404()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_213C0F428(uint64_t a1, int64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  int64_t v5;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  _QWORD *isUniquelyReferenced_nonNull_native;
  int64_t v11;
  uint64_t result;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  v4 = *(_QWORD **)v2;
  v5 = *(_QWORD *)(*(_QWORD *)v2 + 16);
  if (v5 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v9 > v4[3] >> 1)
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    v4 = sub_213BEA6D0(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D29880);
  result = swift_arrayDestroy();
  if (!v7)
    goto LABEL_20;
  v13 = v4[2];
  v14 = __OFSUB__(v13, a2);
  v15 = v13 - a2;
  if (v14)
    goto LABEL_26;
  if ((v15 & 0x8000000000000000) == 0)
  {
    v16 = (char *)&v4[a2 + 4];
    if (a1 != a2 || &v4[a1 + 4] >= (_QWORD *)&v16[8 * v15])
      result = (uint64_t)memmove(&v4[a1 + 4], v16, 8 * v15);
    v17 = v4[2];
    v14 = __OFADD__(v17, v8);
    v18 = v17 - v7;
    if (!v14)
    {
      v4[2] = v18;
LABEL_20:
      *(_QWORD *)v2 = v4;
      return result;
    }
    goto LABEL_27;
  }
LABEL_28:
  result = sub_213C12948();
  __break(1u);
  return result;
}

char *sub_213C0F598(uint64_t a1, int64_t a2)
{
  char **v2;
  char *v4;
  int64_t v5;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  char *result;
  int64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  v4 = *v2;
  v5 = *((_QWORD *)*v2 + 2);
  if (v5 < a2)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  result = (char *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result && v9 <= *((_QWORD *)v4 + 3) >> 1)
  {
    if (!v8)
      goto LABEL_21;
  }
  else
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    result = (char *)sub_213BEA5AC(result, v11, 1, v4);
    v4 = result;
    if (!v8)
      goto LABEL_21;
  }
  v12 = *((_QWORD *)v4 + 2);
  v13 = __OFSUB__(v12, a2);
  v14 = v12 - a2;
  if (v13)
    goto LABEL_27;
  if ((v14 & 0x8000000000000000) == 0)
  {
    result = &v4[24 * a1 + 32];
    v15 = &v4[24 * a2 + 32];
    if (a1 != a2 || result >= &v15[24 * v14])
      result = (char *)memmove(result, v15, 24 * v14);
    v16 = *((_QWORD *)v4 + 2);
    v13 = __OFADD__(v16, v8);
    v17 = v16 + v8;
    if (!v13)
    {
      *((_QWORD *)v4 + 2) = v17;
LABEL_21:
      *v2 = v4;
      return result;
    }
    goto LABEL_28;
  }
LABEL_29:
  result = (char *)sub_213C12948();
  __break(1u);
  return result;
}

uint64_t sub_213C0F6F8(uint64_t a1, int64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  int64_t v5;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  _QWORD *isUniquelyReferenced_nonNull_native;
  int64_t v11;
  uint64_t result;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  v4 = *(_QWORD **)v2;
  v5 = *(_QWORD *)(*(_QWORD *)v2 + 16);
  if (v5 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v9 > v4[3] >> 1)
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    v4 = sub_213BEAFBC(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  result = swift_arrayDestroy();
  if (!v7)
    goto LABEL_20;
  v13 = v4[2];
  v14 = __OFSUB__(v13, a2);
  v15 = v13 - a2;
  if (v14)
    goto LABEL_26;
  if ((v15 & 0x8000000000000000) == 0)
  {
    v16 = (char *)&v4[4 * a2 + 4];
    if (a1 != a2 || &v4[4 * a1 + 4] >= (_QWORD *)&v16[32 * v15])
      result = (uint64_t)memmove(&v4[4 * a1 + 4], v16, 32 * v15);
    v17 = v4[2];
    v14 = __OFADD__(v17, v8);
    v18 = v17 - v7;
    if (!v14)
    {
      v4[2] = v18;
LABEL_20:
      *(_QWORD *)v2 = v4;
      return result;
    }
    goto LABEL_27;
  }
LABEL_28:
  result = sub_213C12948();
  __break(1u);
  return result;
}

uint64_t sub_213C0F860(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

unint64_t sub_213C0F89C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254D29950;
  if (!qword_254D29950)
  {
    v1 = sub_213C12768();
    result = MEMORY[0x2199BF420](MEMORY[0x24BEE5698], v1);
    atomic_store(result, (unint64_t *)&qword_254D29950);
  }
  return result;
}

unint64_t sub_213C0F8E4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254D29960;
  if (!qword_254D29960)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D286C0);
    result = MEMORY[0x2199BF420](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_254D29960);
  }
  return result;
}

void sub_213C0F938(unint64_t a1)
{
  char *v1;
  uint64_t v2;
  char *v3;
  unint64_t v4;
  double v5;
  CMTimeEpoch v6;
  unint64_t *v7;
  char *v8;
  char *v9;
  uint64_t Strong;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  float v17;
  void *value;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  unint64_t p_name;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  unint64_t v36;
  id v37;
  void *v38;
  float v39;
  id v40;
  id v41;
  void *v42;
  float v43;
  id v44;
  void *v45;
  float v46;
  id v47;
  void *v48;
  int v49;
  id v50;
  void *v51;
  unsigned int v52;
  unsigned int v53;
  CMTimeEpoch v54;
  Float64 Seconds;
  int8x16_t v56;
  objc_class *v57;
  char *v58;
  uint64_t v59;
  char *v60;
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  objc_class *v65;
  char *v66;
  char *v67;
  const char *v68;
  char *v69;
  id v70;
  unint64_t v71;
  id v72;
  int isUniquelyReferenced_nonNull_bridgeObject;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  float v79;
  float v80;
  float v81;
  __int128 v82;
  char *v83;
  objc_super v84;
  objc_super v85;
  CMTime v86;
  CMTime time;
  uint64_t v88;

  v3 = v1;
  v4 = a1;
  v88 = *MEMORY[0x24BDAC8D0];
  if ((v3[56] & 1) == 0)
  {
    v5 = *((double *)v3 + 6);
    v6 = *(_QWORD *)(a1 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_time + 16);
    time.value = *(_QWORD *)(a1 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_time);
    *(_QWORD *)&time.timescale = *(_QWORD *)(a1 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_time + 8);
    time.epoch = v6;
    if (v5 == CMTimeGetSeconds(&time))
    {
      sub_213BFC6D4(0xD00000000000002DLL, 0x8000000213C18CA0, 0, -8, 0);
      swift_willThrow();
      return;
    }
  }
  v7 = (unint64_t *)(v4 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_faces);
  swift_beginAccess();
  if (*v7 >> 62)
  {
    swift_bridgeObjectRetain();
    v75 = sub_213C12918();
    swift_bridgeObjectRelease();
    if (v75)
      goto LABEL_6;
  }
  else if (*(_QWORD *)((*v7 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_6;
  }
  sub_213C01CF4();
  if (v2)
    return;
LABEL_6:
  v8 = sub_213C02270();
  if (v2)
    return;
  v9 = v8;
  Strong = swift_weakLoadStrong();
  if (!Strong || (v11 = *(_QWORD *)(Strong + 16), swift_retain(), swift_release(), !v11))
  {
    sub_213BFC6D4(0xD000000000000036, 0x8000000213C18C60, 0, -9, 0);
    swift_willThrow();

    return;
  }
  type metadata accessor for PADFacePoseModelInput();
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v9;
  v13 = objc_allocWithZone(MEMORY[0x24BDC0018]);
  v83 = v9;
  v14 = objc_msgSend(v13, sel_init);
  v15 = *(void **)(v11 + 16);
  v86.value = 0;
  v16 = objc_msgSend(v15, sel_predictionFromFeatures_options_error_, v12, v14, &v86);
  v17 = *(float *)&v11;
  value = (void *)v86.value;
  if (!v16)
  {
    v41 = (id)v86.value;
    sub_213C1248C();

    swift_willThrow();
    swift_release();
    swift_release();

    return;
  }
  v19 = v16;
  v79 = v17;
  type metadata accessor for PADFacePoseModelOutput();
  *(_QWORD *)(swift_initStackObject() + 16) = v19;
  v20 = value;
  swift_release();

  v21 = (void *)sub_213C125E8();
  v22 = objc_msgSend(v19, sel_featureValueForName_, v21);

  if (!v22)
  {
    __break(1u);
    goto LABEL_70;
  }
  v23 = objc_msgSend(v22, sel_multiArrayValue);

  if (!v23)
  {
LABEL_70:
    __break(1u);
    goto LABEL_71;
  }
  v24 = objc_msgSend(v23, sel_numberArray);

  p_name = sub_213BE2B78();
  v26 = sub_213C12690();

  v27 = (void *)sub_213C125E8();
  v28 = objc_msgSend(v19, sel_featureValueForName_, v27);

  if (!v28)
  {
LABEL_71:
    __break(1u);
    goto LABEL_72;
  }
  v29 = objc_msgSend(v28, sel_multiArrayValue);

  if (!v29)
  {
LABEL_72:
    __break(1u);
    goto LABEL_73;
  }
  v30 = objc_msgSend(v29, sel_numberArray);

  v78 = sub_213C12690();
  v31 = (void *)sub_213C125E8();
  v32 = objc_msgSend(v19, sel_featureValueForName_, v31);

  if (!v32)
  {
LABEL_73:
    __break(1u);
    goto LABEL_74;
  }
  v33 = objc_msgSend(v32, sel_multiArrayValue);

  if (!v33)
  {
LABEL_74:
    __break(1u);
    return;
  }
  v34 = objc_msgSend(v33, sel_numberArray);

  v35 = sub_213C12690();
  v36 = v26 & 0xC000000000000001;
  if ((v26 & 0xC000000000000001) != 0)
  {
    v37 = (id)MEMORY[0x2199BE994](0, v26);
  }
  else
  {
    if (!*(_QWORD *)((v26 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
LABEL_51:
      v47 = (id)MEMORY[0x2199BE994](1, v26);
      goto LABEL_32;
    }
    v37 = *(id *)(v26 + 32);
  }
  v38 = v37;
  p_name = (unint64_t)&stru_24D0D4FF8.name;
  objc_msgSend(v37, sel_floatValue);
  v81 = v39;

  if (v36)
  {
    v40 = (id)MEMORY[0x2199BE994](1, v26);
  }
  else
  {
    if (*(_QWORD *)((v26 & 0xFFFFFFFFFFFFF8) + 0x10) < 2uLL)
    {
LABEL_67:
      __break(1u);
LABEL_68:
      __break(1u);
    }
    v40 = *(id *)(v26 + 40);
  }
  v42 = v40;
  objc_msgSend(v40, sel_floatValue);
  v80 = v43;

  if (v36)
  {
    v44 = (id)MEMORY[0x2199BE994](2, v26);
  }
  else
  {
    if (*(_QWORD *)((v26 & 0xFFFFFFFFFFFFF8) + 0x10) < 3uLL)
      goto LABEL_68;
    v44 = *(id *)(v26 + 48);
  }
  v45 = v44;
  swift_bridgeObjectRelease();
  objc_msgSend(v45, sel_floatValue);
  v79 = v46;

  v26 = v78;
  if ((v78 & 0xC000000000000001) != 0)
    goto LABEL_51;
  if (*(_QWORD *)((v78 & 0xFFFFFFFFFFFFF8) + 0x10) < 2uLL)
  {
    __break(1u);
    goto LABEL_53;
  }
  v47 = *(id *)(v78 + 40);
LABEL_32:
  v48 = v47;
  swift_bridgeObjectRelease();
  objc_msgSend(v48, *(SEL *)(p_name + 2392));
  LODWORD(v78) = v49;

  if ((v35 & 0xC000000000000001) != 0)
  {
LABEL_53:
    v50 = (id)MEMORY[0x2199BE994](0, v35);
    goto LABEL_35;
  }
  if (!*(_QWORD *)((v35 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_55;
  }
  v50 = *(id *)(v35 + 32);
LABEL_35:
  v51 = v50;
  swift_bridgeObjectRelease();
  objc_msgSend(v51, *(SEL *)(p_name + 2392));
  v53 = v52;

  v26 = v4 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_time;
  v54 = *(_QWORD *)(v4 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_time + 16);
  v86.value = *(_QWORD *)(v4 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_time);
  *(_QWORD *)&v86.timescale = *(_QWORD *)(v4 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_time + 8);
  v86.epoch = v54;
  Seconds = CMTimeGetSeconds(&v86);
  v56.i64[0] = LODWORD(v81);
  v56.i64[1] = LODWORD(v79);
  *(int8x16_t *)(v3 + 24) = vorrq_s8((int8x16_t)vshll_n_s32((int32x2_t)__PAIR64__(v78, LODWORD(v80)), 0x20uLL), v56);
  *((_QWORD *)v3 + 5) = v53;
  *((Float64 *)v3 + 6) = Seconds;
  v3[56] = 0;
  v57 = (objc_class *)type metadata accessor for PADSWPose();
  v58 = (char *)objc_allocWithZone(v57);
  *(double *)&v58[OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_pitch] = v79;
  *(double *)&v58[OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_yaw] = v80;
  *(double *)&v58[OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_roll] = v81;
  v85.receiver = v58;
  v85.super_class = v57;
  v35 = (uint64_t)&stru_24D0D4FF8.name;
  v3 = (char *)objc_msgSendSuper2(&v85, sel_init);
  v4 = *v7;
  if (!(*v7 >> 62))
  {
    v59 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    v60 = v83;
    if (v59)
      goto LABEL_37;
LABEL_56:
    swift_bridgeObjectRelease();
    goto LABEL_57;
  }
LABEL_55:
  swift_bridgeObjectRetain();
  v60 = v83;
  if (!sub_213C12918())
    goto LABEL_56;
LABEL_37:
  if ((v4 & 0xC000000000000001) != 0)
  {
    v61 = (char *)MEMORY[0x2199BE994](0, v4);
  }
  else
  {
    if (!*(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
LABEL_66:
      __break(1u);
      goto LABEL_67;
    }
    v61 = (char *)*(id *)(v4 + 32);
  }
  v62 = v61;
  swift_bridgeObjectRelease();
  v82 = *(_OWORD *)&v62[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds];
  v63 = *(_QWORD *)&v62[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds + 16];
  v64 = *(_QWORD *)&v62[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds + 24];
  v65 = (objc_class *)type metadata accessor for PADSWFace();
  v66 = (char *)objc_allocWithZone(v65);
  v67 = &v66[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds];
  *(_OWORD *)v67 = v82;
  *((_QWORD *)v67 + 2) = v63;
  *((_QWORD *)v67 + 3) = v64;
  *(_QWORD *)&v66[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_pose] = v3;
  v84.receiver = v66;
  v84.super_class = v65;
  v68 = *(const char **)(v35 + 3224);
  v69 = v3;
  v70 = objc_msgSendSuper2(&v84, v68);
  swift_beginAccess();
  v71 = *v7;
  v72 = v70;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v7 = v71;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v71 & 0x8000000000000000) != 0
    || (v71 & 0x4000000000000000) != 0)
  {
    sub_213C103F4(v71);
  }
  if (!*(_QWORD *)((v71 & 0xFFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_66;
  v74 = *(void **)((v71 & 0xFFFFFFFFFFFFFF8) + 0x20);
  *(_QWORD *)((v71 & 0xFFFFFFFFFFFFFF8) + 0x20) = v72;

  sub_213C126A8();
  swift_endAccess();

  v60 = v83;
LABEL_57:
  if (qword_254D27958 != -1)
    swift_once();
  if (qword_254D27CD8)
  {
    v86.value = *(_QWORD *)v26;
    v76 = sub_213C129FC();
    sub_213BE9074((uint64_t)v60, v76, v77, v3);
    swift_release();

    swift_bridgeObjectRelease();
  }
  else
  {
    swift_release();

  }
  swift_release();
}

uint64_t sub_213C102B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)(v0 + 56) & 1) != 0)
    return 0;
  v2 = *(_QWORD *)(v0 + 48);
  v4 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v5 = *(_QWORD *)(v0 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D298F8);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_213C14E40;
  *(_QWORD *)(v1 + 56) = &type metadata for PADFacePoseObservation;
  v6 = swift_allocObject();
  *(_QWORD *)(v1 + 32) = v6;
  *(_QWORD *)(v6 + 16) = v5;
  *(_QWORD *)(v6 + 24) = v4;
  *(_DWORD *)(v6 + 32) = v3;
  *(_QWORD *)(v6 + 40) = v2;
  return v1;
}

uint64_t sub_213C10368()
{
  swift_weakDestroy();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PADFacePoseRequest()
{
  return objc_opt_self();
}

ValueMetadata *type metadata accessor for PADFacePoseObservation()
{
  return &type metadata for PADFacePoseObservation;
}

uint64_t sub_213C103BC()
{
  return swift_deallocObject();
}

_QWORD *sub_213C103CC(_QWORD *a1)
{
  return sub_213BEA6E4(0, a1[2], 0, a1);
}

_QWORD *sub_213C103E0(_QWORD *a1)
{
  return sub_213BEA810(0, a1[2], 0, a1);
}

void sub_213C103F4(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_213C12918();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x2199BE9A0);
}

void sub_213C1045C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v5;
  float v6;
  float v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;

  v3 = v1;
  v5 = (uint64_t *)(a1 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_faces);
  swift_beginAccess();
  if ((unint64_t)*v5 >> 62)
  {
    swift_bridgeObjectRetain();
    v13 = sub_213C12918();
    swift_bridgeObjectRelease();
    if (v13)
      goto LABEL_3;
  }
  else if (*(_QWORD *)((*v5 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  sub_213C01CF4();
  if (v2)
    return;
LABEL_3:
  if (!((unint64_t)*v5 >> 62))
  {
    if (*(_QWORD *)((*v5 & 0xFFFFFFFFFFFFF8) + 0x10) == 1)
      goto LABEL_5;
LABEL_17:
    sub_213C1287C();
    sub_213C12648();
    if ((unint64_t)*v5 >> 62)
    {
      swift_bridgeObjectRetain();
      sub_213C12918();
      swift_bridgeObjectRelease();
    }
    sub_213C129FC();
    sub_213C12648();
    swift_bridgeObjectRelease();
    sub_213BFC6D4(0, 0xE000000000000000, 0, -6, 0);
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
  swift_bridgeObjectRetain();
  v14 = sub_213C12918();
  swift_bridgeObjectRelease();
  if (v14 != 1)
    goto LABEL_17;
LABEL_5:
  if (!sub_213C10780())
  {
    sub_213BFC6D4(0xD000000000000042, 0x8000000213C18D40, 0, -6, 0);
LABEL_20:
    swift_willThrow();
    return;
  }
  v6 = sub_213C10A08(a1);
  if (v2)
    return;
  v7 = v6;
  v8 = *v5;
  if ((unint64_t)*v5 >> 62)
  {
    swift_bridgeObjectRetain();
    if (sub_213C12918())
      goto LABEL_9;
LABEL_23:
    swift_bridgeObjectRelease();
    v11 = 0;
    goto LABEL_24;
  }
  v9 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v9)
    goto LABEL_23;
LABEL_9:
  if ((v8 & 0xC000000000000001) != 0)
  {
    v17 = MEMORY[0x2199BE994](0, v8);
    swift_bridgeObjectRelease();
    v11 = *(void **)(v17 + OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_pose);
    v18 = v11;
    swift_unknownObjectRelease();
    goto LABEL_24;
  }
  if (*(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v10 = (char *)*(id *)(v8 + 32);
    swift_bridgeObjectRelease();
    v11 = *(void **)&v10[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_pose];
    v12 = v11;

LABEL_24:
    v15 = *(_QWORD *)(v3 + 24);
    v16 = *(void **)(v3 + 32);
    *(_QWORD *)(v3 + 24) = LODWORD(v7);
    *(_QWORD *)(v3 + 32) = v11;
    sub_213C111A0(v15, v16);
    return;
  }
  __break(1u);
}

BOOL sub_213C10780()
{
  uint64_t v0;
  char *v1;
  unint64_t *v2;
  unint64_t v3;
  char *v4;
  char *v5;
  unint64_t v6;
  uint64_t v7;
  char *v8;
  double Height;
  char *v11;
  uint64_t v12;

  v2 = (unint64_t *)(v0 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_faces);
  swift_beginAccess();
  v3 = *v2;
  if (!(*v2 >> 62))
  {
    v4 = *(char **)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4)
      goto LABEL_3;
LABEL_16:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  v4 = (char *)sub_213C12918();
  if (!v4)
    goto LABEL_16;
LABEL_3:
  if ((v3 & 0xC000000000000001) != 0)
  {
    v5 = (char *)MEMORY[0x2199BE994](0, v3);
  }
  else
  {
    if (!*(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
LABEL_19:
      v11 = v1;
      swift_bridgeObjectRetain();
      v12 = sub_213C12918();
      swift_bridgeObjectRelease();
      if (v12 == 1)
        goto LABEL_9;
      goto LABEL_20;
    }
    v5 = (char *)*(id *)(v3 + 32);
  }
  v4 = v5;
  swift_bridgeObjectRelease();
  v1 = *(char **)&v4[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_pose];
  if (!v1)
  {

    return 0;
  }
  v6 = *v2;
  if (v6 >> 62)
    goto LABEL_19;
  v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  v8 = v1;
  if (v7 != 1)
  {
LABEL_20:

    return 0;
  }
LABEL_9:
  if (fabs(*(double *)&v1[OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_pitch]) <= 15.0
    || fabs(*(double *)&v1[OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_roll]) <= 15.0
    || fabs(*(double *)&v1[OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_yaw]) <= 15.0)
  {

    return 1;
  }
  else
  {
    Height = CGRectGetHeight(*(CGRect *)&v4[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds]);

    return Height > 0.15;
  }
}

uint64_t sub_213C10988()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(void **)(v0 + 32);
  if (v2 == (void *)1)
  {
    v3 = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D298F8);
    v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_213C14E40;
    *(_QWORD *)(v3 + 56) = &type metadata for PADPrintReplayObservation;
    *(_DWORD *)(v3 + 32) = v1;
    *(_QWORD *)(v3 + 40) = v2;
  }
  sub_213C111B0(v1, v2);
  return v3;
}

float sub_213C10A08(uint64_t a1)
{
  uint64_t v1;
  char *v2;
  void *v3;
  id v4;
  CGFloat v5;
  uint64_t v6;
  uint64_t Strong;
  uint64_t v9;
  id **v10;
  id *v11;
  uint64_t v12;
  char *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double x;
  double y;
  double width;
  double height;
  uint64_t v24;
  int64_t v25;
  int64_t v26;
  double v27;
  double v28;
  double v29;
  id *v30;
  uint64_t PixelFormatType;
  id v32;
  id v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  id v43;
  id v45[5];
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  v6 = v1;
  v45[4] = *(id *)MEMORY[0x24BDAC8D0];
  Strong = swift_weakLoadStrong();
  if (!Strong || (v9 = *(_QWORD *)(Strong + 24), swift_retain(), swift_release(), !v9))
  {
    sub_213BFC6D4(0xD000000000000019, 0x8000000213C18D90, 0, -9, 0);
    swift_willThrow();
    return *(float *)&v5;
  }
  v10 = (id **)(a1 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_faces);
  swift_beginAccess();
  v11 = *v10;
  if (!((unint64_t)*v10 >> 62))
  {
    v12 = *(_QWORD *)(((unint64_t)v11 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v12)
      goto LABEL_5;
LABEL_25:
    swift_bridgeObjectRelease();
    sub_213BFC6D4(0xD000000000000035, 0x8000000213C18E60, 0, -6, 0);
    swift_willThrow();
    goto LABEL_26;
  }
  swift_bridgeObjectRetain();
  if (!sub_213C12918())
    goto LABEL_25;
LABEL_5:
  if (((unint64_t)v11 & 0xC000000000000001) != 0)
  {
    v13 = (char *)MEMORY[0x2199BE994](0, v11);
  }
  else
  {
    if (!*(_QWORD *)(((unint64_t)v11 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
LABEL_30:
      swift_once();
      goto LABEL_13;
    }
    v13 = (char *)v11[4];
  }
  v2 = v13;
  swift_bridgeObjectRelease();
  v14 = *(double *)&v2[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds];
  v15 = *(double *)&v2[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds + 8];
  v16 = *(double *)&v2[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds + 16];
  v17 = *(double *)&v2[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds + 24];
  v46.origin.x = v14;
  v46.origin.y = v15;
  v46.size.width = v16;
  v46.size.height = v17;
  v18 = CGRectGetWidth(v46) * -0.544375 * 0.5;
  v47.origin.x = v14;
  v47.origin.y = v15;
  v47.size.width = v16;
  v47.size.height = v17;
  v19 = CGRectGetHeight(v47) * -0.544375 * 0.5;
  v48.origin.x = v14;
  v48.origin.y = v15;
  v48.size.width = v16;
  v48.size.height = v17;
  v49 = CGRectInset(v48, v18, v19);
  x = v49.origin.x;
  y = v49.origin.y;
  width = v49.size.width;
  height = v49.size.height;
  v49.origin.x = 0.0;
  v49.origin.y = 0.0;
  v49.size.width = 1.0;
  v49.size.height = 1.0;
  v54.origin.x = x;
  v54.origin.y = y;
  v54.size.width = width;
  v54.size.height = height;
  if (!CGRectContainsRect(v49, v54))
  {
    v50.origin.x = 0.0;
    v50.origin.y = 0.0;
    v50.size.width = 1.0;
    v50.size.height = 1.0;
    v55.origin.x = x;
    v55.origin.y = y;
    v55.size.width = width;
    v55.size.height = height;
    v51 = CGRectIntersection(v50, v55);
    x = v51.origin.x;
    y = v51.origin.y;
    width = v51.size.width;
    height = v51.size.height;
  }
  v24 = OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_buffer;
  v25 = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_buffer));
  CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + v24));
  CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + v24));
  v26 = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + v24));
  v52.origin.x = x * (double)v25;
  v52.size.width = width * (double)v25;
  v52.origin.y = y * (double)v26;
  v52.size.height = height * (double)v26;
  v53 = CGRectIntegral(v52);
  v5 = v53.origin.x;
  v27 = v53.origin.y;
  v28 = v53.size.width;
  v29 = v53.size.height;
  v30 = (id *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDF9C20]), sel_initWithCVPixelBuffer_orientation_options_, *(_QWORD *)(a1 + v24), *(unsigned int *)(a1 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_orientation), 0);
  if (!v30)
  {
    sub_213BFC6D4(0xD00000000000003BLL, 0x8000000213C18DB0, 0, -6, 0);
    swift_willThrow();

LABEL_26:
    swift_release();
    return *(float *)&v5;
  }
  v11 = v30;
  PixelFormatType = CVPixelBufferGetPixelFormatType(*(CVPixelBufferRef *)(a1 + v24));
  v45[0] = 0;
  v32 = objc_msgSend(v11, sel_cropAndScaleBufferWithWidth_height_cropRect_format_imageCropAndScaleOption_options_error_calculatedNormalizedOriginOffset_calculatedScaleX_calculatedScaleY_pixelBufferRepsCacheKey_, 224, 224, PixelFormatType, 2, 0, v45, v5, v27, v28, v29, 0, 0, 0, 0);
  v33 = v45[0];
  if (!v32)
  {
    v43 = v45[0];
    sub_213BFC6D4(0xD00000000000002ELL, 0x8000000213C18DF0, v33, -6, 0);

    swift_willThrow();
LABEL_23:

    swift_release();
    return *(float *)&v5;
  }
  v3 = v32;
  v34 = qword_254D27958;
  v4 = v45[0];
  if (v34 != -1)
    goto LABEL_30;
LABEL_13:
  if (qword_254D27CD8)
  {
    v45[0] = *(id *)(a1 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_time);
    v35 = (char *)sub_213C129FC();
    sub_213BE8AD8((uint64_t)v3, v35, v36);
    swift_bridgeObjectRelease();
  }
  sub_213BF782C(v3);
  if (v6)
    goto LABEL_22;
  if ((v37 & 0x100000000) != 0)
  {
    sub_213BFC6D4(0xD00000000000003CLL, 0x8000000213C18E20, 0, -6, 0);
    swift_willThrow();
LABEL_22:

    goto LABEL_23;
  }
  *(float *)&v5 = 1.0 - *(float *)&v37;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D29860);
  v38 = swift_allocObject();
  v39 = MEMORY[0x24BEE14E8];
  *(_OWORD *)(v38 + 16) = xmmword_213C14E40;
  v40 = MEMORY[0x24BEE1568];
  *(_QWORD *)(v38 + 56) = v39;
  *(_QWORD *)(v38 + 64) = v40;
  *(_DWORD *)(v38 + 32) = LODWORD(v5);
  v41 = sub_213C12618();
  sub_213BDB2E8(v41, v42);

  swift_bridgeObjectRelease();
  swift_release();

  return *(float *)&v5;
}

void sub_213C10FE8()
{
  uint64_t v0;

  sub_213C111A0(*(_QWORD *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_213C10FF0()
{
  uint64_t v0;

  swift_weakDestroy();
  sub_213C111A0(*(_QWORD *)(v0 + 24), *(void **)(v0 + 32));
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PADPrintReplayRequest()
{
  return objc_opt_self();
}

uint64_t initializeBufferWithCopyOfBuffer for PADPrintReplayObservation(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v3 = *(void **)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v3;
  v4 = v3;
  return a1;
}

uint64_t assignWithCopy for PADPrintReplayObservation(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v3 = *(void **)(a1 + 8);
  v4 = *(void **)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  v5 = v4;

  return a1;
}

uint64_t assignWithTake for PADPrintReplayObservation(uint64_t a1, uint64_t a2)
{
  void *v3;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v3 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);

  return a1;
}

uint64_t getEnumTagSinglePayload for PADPrintReplayObservation(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PADPrintReplayObservation(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for PADPrintReplayObservation()
{
  return &type metadata for PADPrintReplayObservation;
}

void sub_213C111A0(uint64_t a1, void *a2)
{
  if (a2 != (void *)1)

}

id sub_213C111B0(uint64_t a1, void *a2)
{
  id result;

  if (a2 != (void *)1)
    return a2;
  return result;
}

void sub_213C111C4()
{
  uint64_t v0;

}

uint64_t sub_213C111E0()
{
  id *v0;

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PADSerialAVAssetReader()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for PADFacePoseModelInput()
{
  return objc_opt_self();
}

uint64_t sub_213C114B8()
{
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PADFacePoseModelOutput()
{
  return objc_opt_self();
}

uint64_t sub_213C114FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t ObjCClassFromMetadata;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t result;
  uint64_t v16;

  v2 = sub_213C124F8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D27CE8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v10 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v11 = (void *)sub_213C125E8();
  v12 = (void *)sub_213C125E8();
  v13 = objc_msgSend(v10, sel_URLForResource_withExtension_, v11, v12);

  if (v13)
  {
    sub_213C124D4();

    v14 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
    v14(v8, v5, v2);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v3 + 56))(v8, 0, 1, v2);
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2);
    if ((_DWORD)result != 1)
    {

      return ((uint64_t (*)(uint64_t, char *, uint64_t))v14)(a1, v8, v2);
    }
  }
  else
  {
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v8, 1, 1, v2);
  }
  __break(1u);
  return result;
}

uint64_t sub_213C116D8()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PADFacePoseModel()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for PADPrintReplayS2ModelInput()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for PADPrintReplayS2ModelOutput()
{
  return objc_opt_self();
}

uint64_t sub_213C11A00@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t ObjCClassFromMetadata;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t result;
  uint64_t v16;

  v2 = sub_213C124F8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D27CE8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v10 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v11 = (void *)sub_213C125E8();
  v12 = (void *)sub_213C125E8();
  v13 = objc_msgSend(v10, sel_URLForResource_withExtension_, v11, v12);

  if (v13)
  {
    sub_213C124D4();

    v14 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
    v14(v8, v5, v2);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v3 + 56))(v8, 0, 1, v2);
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2);
    if ((_DWORD)result != 1)
    {

      return ((uint64_t (*)(uint64_t, char *, uint64_t))v14)(a1, v8, v2);
    }
  }
  else
  {
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v8, 1, 1, v2);
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for PADPrintReplayS2Model()
{
  return objc_opt_self();
}

uint64_t sub_213C11BFC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D2A1E0);
    v3 = sub_213C12870();
    v4 = 0;
    v5 = v3 + 56;
    v25 = a1 + 32;
    while (1)
    {
      v6 = (uint64_t *)(v25 + 16 * v4);
      v8 = *v6;
      v7 = v6[1];
      sub_213C12A50();
      swift_bridgeObjectRetain();
      sub_213C1263C();
      result = sub_213C12A68();
      v10 = -1 << *(_BYTE *)(v3 + 32);
      v11 = result & ~v10;
      v12 = v11 >> 6;
      v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
      v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        v15 = *(_QWORD *)(v3 + 48);
        v16 = (_QWORD *)(v15 + 16 * v11);
        v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (result = sub_213C12A14(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        v18 = ~v10;
        while (1)
        {
          v11 = (v11 + 1) & v18;
          v12 = v11 >> 6;
          v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
          v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0)
            break;
          v19 = (_QWORD *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            result = sub_213C12A14();
            if ((result & 1) == 0)
              continue;
          }
          goto LABEL_3;
        }
      }
      *(_QWORD *)(v5 + 8 * v12) = v14 | v13;
      v21 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v11);
      *v21 = v8;
      v21[1] = v7;
      v22 = *(_QWORD *)(v3 + 16);
      v23 = __OFADD__(v22, 1);
      v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1)
        return v3;
    }
  }
  return MEMORY[0x24BEE4B08];
}

void LivenessActionFromGesture(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_213BCD000, a2, OS_LOG_TYPE_FAULT, "Invalid gesture %i.", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_0();
}

void PADVNFaceprintInit(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_213BCD000, a1, a3, "The reported faceprint has invalid dimensions %d.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_0();
}

void std::vector<std::vector<std::vector<float>>>::vector(void ***a1, void **a2, void **a3)
{
  void **v5;
  void *v6;
  void **v8;
  char *v9;
  char *v10;
  char *v11;
  void *v12;
  void *v13;
  char *v14;

  v5 = *a1;
  v6 = a2;
  if (v5 != a2)
  {
    do
    {
      v8 = v5;
      v10 = (char *)*(v5 - 3);
      v5 -= 3;
      v9 = v10;
      if (v10)
      {
        v11 = (char *)*(v8 - 2);
        v12 = v9;
        if (v11 != v9)
        {
          do
          {
            v14 = v11 - 24;
            v13 = (void *)*((_QWORD *)v11 - 3);
            if (v13)
            {
              *((_QWORD *)v11 - 2) = v13;
              operator delete(v13);
            }
            v11 = v14;
          }
          while (v14 != v9);
          v12 = *v5;
        }
        *(v8 - 2) = v9;
        operator delete(v12);
      }
    }
    while (v5 != a2);
    v6 = *a3;
  }
  *a1 = a2;
  operator delete(v6);
}

void std::vector<std::vector<float>>::vector(void **a1, char *a2, void **a3)
{
  char *v5;
  void *v6;
  char *v8;
  void *v9;
  void *v10;

  v5 = (char *)*a1;
  v6 = a2;
  if (v5 != a2)
  {
    v8 = v5;
    do
    {
      v10 = (void *)*((_QWORD *)v8 - 3);
      v8 -= 24;
      v9 = v10;
      if (v10)
      {
        *((_QWORD *)v5 - 2) = v9;
        operator delete(v9);
      }
      v5 = v8;
    }
    while (v8 != a2);
    v6 = *a3;
  }
  *a1 = a2;
  operator delete(v6);
}

void PADVNFaceprintInit_cold_1(os_log_t log)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 67109120;
  v1[1] = 0;
  _os_log_error_impl(&dword_213BCD000, log, OS_LOG_TYPE_ERROR, "The reported faceprint has invalid dimensions %d.", (uint8_t *)v1, 8u);
  OUTLINED_FUNCTION_0();
}

void VNCreateFaceprintRequestInit_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_213BCD000, a2, OS_LOG_TYPE_ERROR, "FaceprintRequest update failed (%{public}@).", (uint8_t *)&v2, 0xCu);
}

uint64_t sub_213C123F0()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_213C123FC()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_213C12408()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_213C12414()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_213C12420()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_213C1242C()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_213C12438()
{
  return MEMORY[0x24BDCCA20]();
}

uint64_t sub_213C12444()
{
  return MEMORY[0x24BDCCA40]();
}

uint64_t sub_213C12450()
{
  return MEMORY[0x24BDCCA48]();
}

uint64_t sub_213C1245C()
{
  return MEMORY[0x24BDCCA60]();
}

uint64_t sub_213C12468()
{
  return MEMORY[0x24BDCCA88]();
}

uint64_t sub_213C12474()
{
  return MEMORY[0x24BDCCA90]();
}

uint64_t sub_213C12480()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_213C1248C()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_213C12498()
{
  return MEMORY[0x24BDCD508]();
}

uint64_t sub_213C124A4()
{
  return MEMORY[0x24BDCD520]();
}

uint64_t sub_213C124B0()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_213C124BC()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_213C124C8()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_213C124D4()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_213C124E0()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_213C124EC()
{
  return MEMORY[0x24BDCDAA8]();
}

uint64_t sub_213C124F8()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_213C12504()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_213C12510()
{
  return MEMORY[0x24BDCDBF8]();
}

uint64_t sub_213C1251C()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_213C12528()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_213C12534()
{
  return MEMORY[0x24BDCDD20]();
}

uint64_t sub_213C12540()
{
  return MEMORY[0x24BDCDD78]();
}

uint64_t sub_213C1254C()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t sub_213C12558()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_213C12564()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_213C12570()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_213C1257C()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_213C12588()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_213C12594()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_213C125A0()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_213C125AC()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_213C125B8()
{
  return MEMORY[0x24BEE51A8]();
}

uint64_t sub_213C125C4()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_213C125D0()
{
  return MEMORY[0x24BDCF828]();
}

uint64_t sub_213C125DC()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_213C125E8()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_213C125F4()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_213C12600()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_213C1260C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_213C12618()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_213C12624()
{
  return MEMORY[0x24BDCFB30]();
}

uint64_t sub_213C12630()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_213C1263C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_213C12648()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_213C12654()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_213C12660()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t sub_213C1266C()
{
  return MEMORY[0x24BEE1098]();
}

uint64_t sub_213C12678()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_213C12684()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_213C12690()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_213C1269C()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_213C126A8()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_213C126B4()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_213C126C0()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_213C126CC()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_213C126D8()
{
  return MEMORY[0x24BDCFC08]();
}

uint64_t sub_213C126E4()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_213C126F0()
{
  return MEMORY[0x24BEE6940]();
}

uint64_t sub_213C126FC()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_213C12708()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_213C12714()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_213C12720()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_213C1272C()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_213C12738()
{
  return MEMORY[0x24BDCFDF8]();
}

uint64_t sub_213C12744()
{
  return MEMORY[0x24BDCFE18]();
}

uint64_t sub_213C12750()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_213C1275C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_213C12768()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_213C12774()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_213C12780()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_213C1278C()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_213C12798()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_213C127A4()
{
  return MEMORY[0x24BEE5920]();
}

uint64_t sub_213C127B0()
{
  return MEMORY[0x24BEE5928]();
}

uint64_t sub_213C127BC()
{
  return MEMORY[0x24BDF9AC8]();
}

uint64_t sub_213C127C8()
{
  return MEMORY[0x24BEE52E0]();
}

uint64_t sub_213C127D4()
{
  return MEMORY[0x24BEE52F8]();
}

uint64_t sub_213C127E0()
{
  return MEMORY[0x24BDBFEE0]();
}

uint64_t sub_213C127EC()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_213C127F8()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_213C12804()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_213C12810()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_213C1281C()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_213C12828()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_213C12834()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_213C12840()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_213C1284C()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_213C12858()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_213C12864()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_213C12870()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_213C1287C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_213C12888()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_213C12894()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_213C128A0()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_213C128AC()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_213C128B8()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_213C128C4()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_213C128D0()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_213C128DC()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_213C128E8()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_213C128F4()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_213C12900()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_213C1290C()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_213C12918()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_213C12924()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_213C12930()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_213C1293C()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_213C12948()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_213C12954()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_213C12960()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_213C1296C()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_213C12978()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_213C12984()
{
  return MEMORY[0x24BEE3368]();
}

uint64_t sub_213C12990()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_213C1299C()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_213C129A8()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_213C129B4()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_213C129C0()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_213C129CC()
{
  return MEMORY[0x24BEE34B8]();
}

uint64_t sub_213C129D8()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_213C129E4()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_213C129F0()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_213C129FC()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_213C12A08()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_213C12A14()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_213C12A20()
{
  return MEMORY[0x24BEE3D98]();
}

uint64_t sub_213C12A2C()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_213C12A38()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_213C12A44()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_213C12A50()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_213C12A5C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_213C12A68()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_213C12A74()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_213C12A80()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_213C12A8C()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_213C12A98()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8F8](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD908](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x24BDBD920](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x24BDBDF30](c);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
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

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFC8]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x24BDC01E0](target, key, attachmentModeOut);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x24BDC02E8](sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x24BDC0320](retstr, sbuf);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x24BDC0468](time, allocator);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x24BDC0490](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x24BDC0498](retstr, value, *(_QWORD *)&timescale);
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x24BDC04A8](retstr, dictionaryRepresentation);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x24BDC0580](retstr, start, duration);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5248](allocator, width, height, *(_QWORD *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x24BDC5278](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x24BDC5288](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC5290](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x24BDC5298](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52B0](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x24BDC52B8](pixelBuffer, planeIndex);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52D0](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52D8](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52E8](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x24BDC52F0](pixelBuffer, planeIndex);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x24BDC5308](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x24BDC53B0](pixelBuffer, unlockFlags);
}

uint64_t MGGetProductType()
{
  return MEMORY[0x24BED8488]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x24BED84B0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t _AXSAttentionAwarenessFeaturesEnabled()
{
  return MEMORY[0x24BED20A0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
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
  return MEMORY[0x24BEDAF48]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
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
  off_24D0CED10(__p);
}

uint64_t operator delete()
{
  return off_24D0CED18();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24D0CED20(__sz);
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x24BDAF4D0]();
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x24BEE4D00]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x24BEE4F50]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x24BEE5010]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x24BEE5028]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x24BEE5030]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x24BEE5038]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

void vDSP_dotpr(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB31D0](__A, __IA, __B, __IB, __C, __N);
}

void vDSP_normalize(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, float *__Mean, float *__StandardDeviation, vDSP_Length __N)
{
  MEMORY[0x24BDB32B0](__A, __IA, __C, __IC, __Mean, __StandardDeviation, __N);
}

vImage_Error vImageBuffer_Init(vImage_Buffer *buf, vImagePixelCount height, vImagePixelCount width, uint32_t pixelBits, vImage_Flags flags)
{
  return MEMORY[0x24BDB3630](buf, height, width, *(_QWORD *)&pixelBits, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_Planar8toPlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, Pixel_F maxFloat, Pixel_F minFloat, vImage_Flags flags)
{
  return MEMORY[0x24BDB37A0](src, dest, *(_QWORD *)&flags, maxFloat, minFloat);
}

vImage_Error vImageConvert_RGBA8888toRGB888(const vImage_Buffer *a1, const vImage_Buffer *a2, vImage_Flags a3)
{
  return MEMORY[0x24BDB3830](a1, a2, *(_QWORD *)&a3);
}

vImage_Error vImageScale_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x24BDB3A10](src, dest, tempBuffer, *(_QWORD *)&flags);
}

