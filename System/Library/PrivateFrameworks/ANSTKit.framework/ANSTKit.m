void sub_2358CDAC4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_2358CDADC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

void sub_2358CDAFC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

uint64_t sub_2358CDB0C(void **a1, const char *a2, uint64_t a3)
{
  return objc_msgSend_networkResolution(*a1, a2, a3);
}

id _ANSTLoggingGetOSLogForCategoryANSTKit()
{
  if (qword_254294A88 != -1)
    dispatch_once(&qword_254294A88, &unk_2506E3A60);
  return (id)qword_254294A90;
}

void sub_2358CDC40()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ANSTKit", "ANSTKit");
  v1 = (void *)qword_254294A90;
  qword_254294A90 = (uint64_t)v0;

}

__CFString *ANSTISPInferenceVersionToNSString(uint64_t a1, const char *a2)
{
  __CFString *v2;

  if (a1 == 0x10000)
  {
    v2 = CFSTR("Version1");
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("UnknownVersion(0x%zx)"), a1);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

__CFString *ANSTISPInferenceResolutionToNSString(uint64_t a1, const char *a2)
{
  __CFString *v2;

  if (!a1)
    return CFSTR("512x384");
  if (a1 == 1)
  {
    v2 = CFSTR("1024x576");
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("UnknownResolution(%zd)"), a1);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

__CFString *ANSTISPInferenceFrameRateToNSString(uint64_t a1, const char *a2)
{
  __CFString *v2;

  if (!a1)
    return CFSTR("Standard");
  if (a1 == 1)
  {
    v2 = CFSTR("Low");
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("UnknownFrameRate(%zd)"), a1);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

uint64_t ANSTSupportANE(void)
{
  if (qword_256308990 != -1)
    dispatch_once(&qword_256308990, &unk_2506E3A80);
  return byte_256308998;
}

uint64_t sub_2358CE768()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  byte_256308998 = result;
  return result;
}

uint64_t espressoPlanPriorityForQualityOfService(qos_class_t a1)
{
  unsigned int v1;
  unint64_t v2;

  HIDWORD(v2) = a1 - 9;
  LODWORD(v2) = a1 - 9;
  v1 = v2 >> 3;
  if (v1 > 3)
    return 0;
  else
    return dword_235914CC0[v1];
}

void sub_2358CE9D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_2358CED08(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2358CEF14(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2358CF004(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2358CF1E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2358CF2B8(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 - 33) < 0)
    operator delete(*(void **)(v1 - 56));
  _Unwind_Resume(exception_object);
}

void sub_2358CF4A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17)
{
  if (a15 < 0)
    operator delete(__p);
  if (a16)
    operator delete(a16);
  _Unwind_Resume(exception_object);
}

void sub_2358CF584(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2358CF6CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2358CF7DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2358CF924(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_2358CF9CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_2358CFA54(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_2358CFC4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2358CFD00(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2358CFDAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2358CFE58(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2358CFF9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  void *v17;

  _Unwind_Resume(a1);
}

void sub_2358D0064(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2358D0104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_2358D01B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_2358D0264(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_2358D02D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2358D03D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2358D0514(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2358D07AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  void *v14;
  void *v15;

  if (a14 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_2358D08EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_2358D09CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)ANSTBaseNetworkEspresso;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_2358D09F8(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_2358D0A40(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2358D0B68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2358D0BD8()
{
  void *v0;

  v0 = (void *)qword_2563089A8;
  qword_2563089A8 = (uint64_t)&unk_2506ED9F8;

}

_QWORD *sub_2358D0CEC(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    sub_2358D0D9C();
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

void sub_2358D0D9C()
{
  sub_2358D0DB0("basic_string");
}

void sub_2358D0DB0(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_2358D0E00(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2506E3558, MEMORY[0x24BEDAAF0]);
}

void sub_2358D0DEC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_2358D0E00(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void sub_2358D0E24()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

_QWORD *sub_2358D0E4C(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = sub_2358D0EC4(result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_2358D0EA8(_Unwind_Exception *exception_object)
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

char *sub_2358D0EC4(_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 61)
    sub_2358D0F04();
  result = (char *)sub_2358D0F18((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void sub_2358D0F04()
{
  sub_2358D0DB0("vector");
}

void *sub_2358D0F18(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    sub_2358D0E24();
  return operator new(8 * a2);
}

void sub_2358D0F4C(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;

  if (*(_QWORD *)(a1 + 24))
  {
    sub_2358D0FA0(a1, *(void ***)(a1 + 16));
    *(_QWORD *)(a1 + 16) = 0;
    v2 = *(_QWORD *)(a1 + 8);
    if (v2)
    {
      for (i = 0; i != v2; ++i)
        *(_QWORD *)(*(_QWORD *)a1 + 8 * i) = 0;
    }
    *(_QWORD *)(a1 + 24) = 0;
  }
}

void sub_2358D0FA0(int a1, void **__p)
{
  void **v2;
  void **v3;

  if (__p)
  {
    v2 = __p;
    do
    {
      v3 = (void **)*v2;
      if (*((char *)v2 + 39) < 0)
        operator delete(v2[2]);
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

char *sub_2358D0FE4(uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint8x8_t v13;
  unint64_t v14;
  void **v15;
  char *v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  float v25;
  float v26;
  _BOOL8 v27;
  unint64_t v28;
  unint64_t v29;
  size_t v30;
  uint64_t v31;
  _QWORD *v32;
  unint64_t v33;

  v9 = (_QWORD *)(a1 + 24);
  v10 = sub_2358D12B0(a1 + 24, (uint64_t)a2);
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 8);
  if (v12)
  {
    v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    v14 = v13.u32[0];
    if (v13.u32[0] > 1uLL)
    {
      v4 = v10;
      if (v10 >= v12)
        v4 = v10 % v12;
    }
    else
    {
      v4 = (v12 - 1) & v10;
    }
    v15 = *(void ***)(*(_QWORD *)a1 + 8 * v4);
    if (v15)
    {
      v16 = (char *)*v15;
      if (*v15)
      {
        do
        {
          v17 = *((_QWORD *)v16 + 1);
          if (v17 == v11)
          {
            if ((sub_2358D1758(a1 + 32, (unsigned __int8 *)v16 + 16, a2) & 1) != 0)
              return v16;
          }
          else
          {
            if (v14 > 1)
            {
              if (v17 >= v12)
                v17 %= v12;
            }
            else
            {
              v17 &= v12 - 1;
            }
            if (v17 != v4)
              break;
          }
          v16 = *(char **)v16;
        }
        while (v16);
      }
    }
  }
  v18 = (_QWORD *)(a1 + 16);
  v16 = (char *)operator new(0xD0uLL);
  *((_OWORD *)v16 + 1) = *(_OWORD *)a3;
  v19 = *(_QWORD *)(a3 + 16);
  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  v20 = *(_OWORD *)(a4 + 96);
  *(_OWORD *)(v16 + 152) = *(_OWORD *)(a4 + 112);
  v21 = *(_OWORD *)(a4 + 144);
  *(_OWORD *)(v16 + 168) = *(_OWORD *)(a4 + 128);
  *(_OWORD *)(v16 + 184) = v21;
  v22 = *(_OWORD *)(a4 + 32);
  *(_OWORD *)(v16 + 88) = *(_OWORD *)(a4 + 48);
  v23 = *(_OWORD *)(a4 + 80);
  *(_OWORD *)(v16 + 104) = *(_OWORD *)(a4 + 64);
  *(_OWORD *)(v16 + 120) = v23;
  *(_OWORD *)(v16 + 136) = v20;
  v24 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)(v16 + 40) = *(_OWORD *)a4;
  *(_QWORD *)v16 = 0;
  *((_QWORD *)v16 + 1) = v11;
  *((_QWORD *)v16 + 4) = v19;
  *((_QWORD *)v16 + 25) = *(_QWORD *)(a4 + 160);
  *(_OWORD *)(v16 + 56) = v24;
  *(_OWORD *)(v16 + 72) = v22;
  v25 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v26 = *(float *)(a1 + 32);
  if (!v12 || (float)(v26 * (float)v12) < v25)
  {
    v27 = 1;
    if (v12 >= 3)
      v27 = (v12 & (v12 - 1)) != 0;
    v28 = v27 | (2 * v12);
    v29 = vcvtps_u32_f32(v25 / v26);
    if (v28 <= v29)
      v30 = v29;
    else
      v30 = v28;
    sub_2358D17FC(a1, v30);
    v12 = *(_QWORD *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12)
        v4 = v11 % v12;
      else
        v4 = v11;
    }
    else
    {
      v4 = (v12 - 1) & v11;
    }
  }
  v31 = *(_QWORD *)a1;
  v32 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v32)
  {
    *(_QWORD *)v16 = *v32;
LABEL_38:
    *v32 = v16;
    goto LABEL_39;
  }
  *(_QWORD *)v16 = *v18;
  *v18 = v16;
  *(_QWORD *)(v31 + 8 * v4) = v18;
  if (*(_QWORD *)v16)
  {
    v33 = *(_QWORD *)(*(_QWORD *)v16 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v33 >= v12)
        v33 %= v12;
    }
    else
    {
      v33 &= v12 - 1;
    }
    v32 = (_QWORD *)(*(_QWORD *)a1 + 8 * v33);
    goto LABEL_38;
  }
LABEL_39:
  ++*v9;
  return v16;
}

void sub_2358D1294(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  void **v12;
  uint64_t v13;

  sub_2358D1A30(v13, v12);
  _Unwind_Resume(a1);
}

unint64_t sub_2358D12B0(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  char v5;

  v2 = *(_QWORD *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    v3 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(_QWORD *)a2;
    v3 = v2;
  }
  return sub_2358D12EC((uint64_t)&v5, (uint64_t *)a2, v3);
}

unint64_t sub_2358D12EC(uint64_t a1, uint64_t *a2, unint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
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
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;

  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      v11 = v7 + v9;
      v12 = 0x9DDFEA08EB382D69
          * (v6 ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))));
      v13 = 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47));
      v14 = v8 + a3 + v7 + v4;
      v15 = v14 + v5;
      v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297 * (v12 ^ (v12 >> 47)), 21);
      v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      v18 = v17 + v6 + v9;
      v19 = __ROR8__(v18, 44);
      v20 = v18 + v10;
      v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      v23 = *a2;
      v22 = a2 + 4;
      v24 = v23 - 0x4B6D499041670D8DLL * v5;
      v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        v26 = *(v22 - 3);
        v27 = v24 + v15 + v11 + v26;
        v28 = v22[2];
        v29 = v22[3];
        v30 = v22[1];
        v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        v31 = v13 + v20;
        v32 = *(v22 - 2);
        v33 = *(v22 - 1);
        v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        v35 = v34 + v20 + v33;
        v36 = v34 + v26 + v32;
        v15 = v36 + v33;
        v37 = __ROR8__(v36, 44) + v34;
        v38 = (0xB492B66FBE98F273 * __ROR8__(v27, 37)) ^ v21;
        v24 = 0xB492B66FBE98F273 * __ROR8__(v31, 33);
        v16 = v37 + __ROR8__(v35 + v38, 21);
        v39 = v24 + v21 + *v22;
        v20 = v39 + v30 + v28 + v29;
        v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        v13 = v38;
        v25 += 64;
      }
      while (v25);
      v40 = v24
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69 * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) >> 47));
      v41 = 0x9DDFEA08EB382D69
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69 * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }
    else
    {
      return sub_2358D1698(a2, a3);
    }
  }
  else if (a3 > 0x10)
  {
    return sub_2358D15EC(a2, a3);
  }
  else
  {
    return sub_2358D14F4(a2, a3);
  }
}

unint64_t sub_2358D14F4(_DWORD *a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if (a2 < 9)
  {
    if (a2 < 4)
    {
      result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        v8 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }
    else
    {
      v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      v7 = 0x9DDFEA08EB382D69 * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }
  else
  {
    v3 = *(_QWORD *)((char *)a1 + a2 - 8);
    v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)))) >> 47))) ^ v3;
  }
  return result;
}

unint64_t sub_2358D15EC(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v2 = a1[1];
  v3 = 0xB492B66FBE98F273 * *a1;
  v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(_QWORD *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(_QWORD *)((char *)a1 + a2 - 8);
  v6 = 0x9DDFEA08EB382D69 * (v5 ^ (v4 - 0x3C5A37A36834CED9 * *(_QWORD *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t sub_2358D1698(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
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
  unint64_t v13;

  v2 = *(_QWORD *)((char *)a1 + a2 - 16);
  v3 = *a1 - 0x3C5A37A36834CED9 * (v2 + a2);
  v5 = a1[2];
  v4 = a1[3];
  v6 = __ROR8__(v3 + v4, 52);
  v7 = v3 + a1[1];
  v8 = __ROR8__(v7, 7);
  v9 = v7 + v5;
  v10 = *(_QWORD *)((char *)a1 + a2 - 32) + v5;
  v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  v12 = *(_QWORD *)((char *)a1 + a2 - 24) + v10 + v2;
  v13 = 0xC3A5C85C97CB3127 * (v12 + *(_QWORD *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(_QWORD *)((char *)a1 + a2 - 24) + v10, 7)
       + __ROR8__(*(_QWORD *)((char *)a1 + a2 - 8) + v4 + v10, 52)
       + __ROR8__(v12, 31));
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) >> 47));
}

uint64_t sub_2358D1758(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  BOOL v14;
  uint64_t result;

  v3 = a3;
  v4 = a2[23];
  if ((v4 & 0x80u) == 0)
    v5 = a2[23];
  else
    v5 = *((_QWORD *)a2 + 1);
  v6 = a3[23];
  v7 = (char)v6;
  if ((v6 & 0x80u) != 0)
    v6 = *((_QWORD *)a3 + 1);
  if (v5 != v6)
    return 0;
  if (v7 < 0)
    v3 = *(unsigned __int8 **)a3;
  if ((v4 & 0x80) != 0)
    return memcmp(*(const void **)a2, v3, *((_QWORD *)a2 + 1)) == 0;
  if (!a2[23])
    return 1;
  v8 = v4 - 1;
  do
  {
    v10 = *a2++;
    v9 = v10;
    v12 = *v3++;
    v11 = v12;
    v14 = v8-- != 0;
    result = v9 == v11;
  }
  while (v9 == v11 && v14);
  return result;
}

void sub_2358D17FC(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  unint64_t v5;
  uint8x8_t v6;
  uint64_t v7;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(_QWORD *)&v4)
    goto LABEL_16;
  if (prime < *(_QWORD *)&v4)
  {
    v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      v5 = std::__next_prime(v5);
    }
    else
    {
      v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2)
        v5 = v7;
    }
    if (prime <= v5)
      prime = v5;
    if (prime < *(_QWORD *)&v4)
LABEL_16:
      sub_2358D18D8(a1, prime);
  }
}

void sub_2358D18D8(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint8x8_t v9;
  void *v10;
  _QWORD *v11;
  unint64_t v12;

  if (a2)
  {
    if (a2 >> 61)
      sub_2358D0E24();
    v4 = operator new(8 * a2);
    v5 = *(void **)a1;
    *(_QWORD *)a1 = v4;
    if (v5)
      operator delete(v5);
    v6 = 0;
    *(_QWORD *)(a1 + 8) = a2;
    do
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    v7 = *(_QWORD **)(a1 + 16);
    if (v7)
    {
      v8 = v7[1];
      v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2)
          v8 %= a2;
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v8) = a1 + 16;
      v11 = (_QWORD *)*v7;
      if (*v7)
      {
        do
        {
          v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2)
              v12 %= a2;
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v12))
            {
              *(_QWORD *)(*(_QWORD *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *v7 = *v11;
            *v11 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v12);
            **(_QWORD **)(*(_QWORD *)a1 + 8 * v12) = v11;
            v11 = v7;
          }
          v12 = v8;
LABEL_24:
          v7 = v11;
          v11 = (_QWORD *)*v11;
          v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    v10 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v10)
      operator delete(v10);
    *(_QWORD *)(a1 + 8) = 0;
  }
}

void sub_2358D1A30(uint64_t a1, void **__p)
{
  if (*(_BYTE *)(a1 + 8))
  {
    if (*((char *)__p + 39) < 0)
      operator delete(__p[2]);
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

unsigned __int8 *sub_2358D1A7C(uint64_t a1, unsigned __int8 *a2, uint64_t a3, __int128 **a4)
{
  unint64_t v4;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint8x8_t v12;
  unint64_t v13;
  unsigned __int8 **v14;
  unsigned __int8 *i;
  unint64_t v16;
  _QWORD *v17;
  __int128 *v18;
  __int128 v19;
  float v20;
  float v21;
  _BOOL8 v22;
  unint64_t v23;
  unint64_t v24;
  size_t v25;
  _QWORD *v26;
  unint64_t v27;
  _QWORD v29[2];
  char v30;

  v8 = (_QWORD *)(a1 + 24);
  v9 = sub_2358D12B0(a1 + 24, (uint64_t)a2);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 8);
  if (v11)
  {
    v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      v4 = v9;
      if (v9 >= v11)
        v4 = v9 % v11;
    }
    else
    {
      v4 = (v11 - 1) & v9;
    }
    v14 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v4);
    if (v14)
    {
      for (i = *v14; i; i = *(unsigned __int8 **)i)
      {
        v16 = *((_QWORD *)i + 1);
        if (v16 == v10)
        {
          if ((sub_2358D1758(a1 + 32, i + 16, a2) & 1) != 0)
            return i;
        }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11)
              v16 %= v11;
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4)
            break;
        }
      }
    }
  }
  v17 = operator new(0x40uLL);
  v29[0] = v17;
  v29[1] = a1 + 16;
  *v17 = 0;
  v17[1] = v10;
  v18 = *a4;
  v19 = **a4;
  v17[4] = *((_QWORD *)*a4 + 2);
  *((_OWORD *)v17 + 1) = v19;
  *((_QWORD *)v18 + 1) = 0;
  *((_QWORD *)v18 + 2) = 0;
  *(_QWORD *)v18 = 0;
  v17[6] = 0;
  v17[7] = 0;
  v17[5] = 0;
  v30 = 1;
  v20 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v21 = *(float *)(a1 + 32);
  if (!v11 || (float)(v21 * (float)v11) < v20)
  {
    v22 = 1;
    if (v11 >= 3)
      v22 = (v11 & (v11 - 1)) != 0;
    v23 = v22 | (2 * v11);
    v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24)
      v25 = v24;
    else
      v25 = v23;
    sub_2358D17FC(a1, v25);
    v11 = *(_QWORD *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
        v4 = v10 % v11;
      else
        v4 = v10;
    }
    else
    {
      v4 = (v11 - 1) & v10;
    }
  }
  v26 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v26)
  {
    *(_QWORD *)v29[0] = *v26;
    *v26 = v29[0];
  }
  else
  {
    *(_QWORD *)v29[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v29[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v29[0])
    {
      v27 = *(_QWORD *)(*(_QWORD *)v29[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v27 >= v11)
          v27 %= v11;
      }
      else
      {
        v27 &= v11 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v27) = v29[0];
    }
  }
  i = (unsigned __int8 *)v29[0];
  v29[0] = 0;
  ++*v8;
  sub_2358D1D20((uint64_t)v29, 0);
  return i;
}

void sub_2358D1D08(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_2358D1D20((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void sub_2358D1D20(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      sub_2358D1D64((uint64_t)v2 + 16);
    operator delete(v2);
  }
}

void sub_2358D1D64(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 24);
  if (v2)
  {
    *(_QWORD *)(a1 + 32) = v2;
    operator delete(v2);
  }
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

void sub_2358D1DA8(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_2358D1DF8(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2506E3560, MEMORY[0x24BEDAB00]);
}

void sub_2358D1DE4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_2358D1DF8(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8C0] + 16);
  return result;
}

char *sub_2358D1E1C(uint64_t a1, unsigned __int8 *a2, uint64_t a3, __int128 **a4)
{
  unint64_t v4;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint8x8_t v12;
  unint64_t v13;
  void **v14;
  char *v15;
  unint64_t v16;
  _QWORD *v17;
  __int128 *v18;
  __int128 v19;
  float v20;
  float v21;
  _BOOL8 v22;
  unint64_t v23;
  unint64_t v24;
  size_t v25;
  uint64_t v26;
  _QWORD *v27;
  unint64_t v28;

  v8 = (_QWORD *)(a1 + 24);
  v9 = sub_2358D12B0(a1 + 24, (uint64_t)a2);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 8);
  if (v11)
  {
    v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      v4 = v9;
      if (v9 >= v11)
        v4 = v9 % v11;
    }
    else
    {
      v4 = (v11 - 1) & v9;
    }
    v14 = *(void ***)(*(_QWORD *)a1 + 8 * v4);
    if (v14)
    {
      v15 = (char *)*v14;
      if (*v14)
      {
        do
        {
          v16 = *((_QWORD *)v15 + 1);
          if (v16 == v10)
          {
            if ((sub_2358D1758(a1 + 32, (unsigned __int8 *)v15 + 16, a2) & 1) != 0)
              return v15;
          }
          else
          {
            if (v13 > 1)
            {
              if (v16 >= v11)
                v16 %= v11;
            }
            else
            {
              v16 &= v11 - 1;
            }
            if (v16 != v4)
              break;
          }
          v15 = *(char **)v15;
        }
        while (v15);
      }
    }
  }
  v17 = (_QWORD *)(a1 + 16);
  v15 = (char *)operator new(0xD0uLL);
  *(_QWORD *)v15 = 0;
  *((_QWORD *)v15 + 1) = v10;
  v18 = *a4;
  v19 = **a4;
  *((_QWORD *)v15 + 4) = *((_QWORD *)*a4 + 2);
  *((_OWORD *)v15 + 1) = v19;
  *((_QWORD *)v18 + 1) = 0;
  *((_QWORD *)v18 + 2) = 0;
  *(_QWORD *)v18 = 0;
  *(_OWORD *)(v15 + 40) = 0u;
  *(_OWORD *)(v15 + 56) = 0u;
  *(_OWORD *)(v15 + 72) = 0u;
  *(_OWORD *)(v15 + 88) = 0u;
  *(_OWORD *)(v15 + 104) = 0u;
  *(_OWORD *)(v15 + 120) = 0u;
  *(_OWORD *)(v15 + 136) = 0u;
  *(_OWORD *)(v15 + 152) = 0u;
  *(_OWORD *)(v15 + 168) = 0u;
  *(_OWORD *)(v15 + 184) = 0u;
  *((_QWORD *)v15 + 25) = 0;
  v20 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v21 = *(float *)(a1 + 32);
  if (!v11 || (float)(v21 * (float)v11) < v20)
  {
    v22 = 1;
    if (v11 >= 3)
      v22 = (v11 & (v11 - 1)) != 0;
    v23 = v22 | (2 * v11);
    v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24)
      v25 = v24;
    else
      v25 = v23;
    sub_2358D17FC(a1, v25);
    v11 = *(_QWORD *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
        v4 = v10 % v11;
      else
        v4 = v10;
    }
    else
    {
      v4 = (v11 - 1) & v10;
    }
  }
  v26 = *(_QWORD *)a1;
  v27 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v27)
  {
    *(_QWORD *)v15 = *v27;
LABEL_38:
    *v27 = v15;
    goto LABEL_39;
  }
  *(_QWORD *)v15 = *v17;
  *v17 = v15;
  *(_QWORD *)(v26 + 8 * v4) = v17;
  if (*(_QWORD *)v15)
  {
    v28 = *(_QWORD *)(*(_QWORD *)v15 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v28 >= v11)
        v28 %= v11;
    }
    else
    {
      v28 &= v11 - 1;
    }
    v27 = (_QWORD *)(*(_QWORD *)a1 + 8 * v28);
    goto LABEL_38;
  }
LABEL_39:
  ++*v8;
  return v15;
}

void sub_2358D20B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  void **v10;
  uint64_t v11;

  sub_2358D1A30(v11, v10);
  _Unwind_Resume(a1);
}

void *sub_2358D20D0(uint64_t a1, unsigned __int8 *a2, uint64_t a3, __int128 **a4)
{
  unint64_t v4;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint8x8_t v12;
  unint64_t v13;
  void **v14;
  void *i;
  unint64_t v16;
  _QWORD *v17;
  __int128 *v18;
  __int128 v19;
  float v20;
  float v21;
  _BOOL8 v22;
  unint64_t v23;
  unint64_t v24;
  size_t v25;
  uint64_t v26;
  _QWORD *v27;
  unint64_t v28;

  v8 = (_QWORD *)(a1 + 24);
  v9 = sub_2358D12B0(a1 + 24, (uint64_t)a2);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 8);
  if (v11)
  {
    v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      v4 = v9;
      if (v9 >= v11)
        v4 = v9 % v11;
    }
    else
    {
      v4 = (v11 - 1) & v9;
    }
    v14 = *(void ***)(*(_QWORD *)a1 + 8 * v4);
    if (v14)
    {
      for (i = *v14; i; i = *(void **)i)
      {
        v16 = *((_QWORD *)i + 1);
        if (v16 == v10)
        {
          if ((sub_2358D1758(a1 + 32, (unsigned __int8 *)i + 16, a2) & 1) != 0)
            return i;
        }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11)
              v16 %= v11;
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4)
            break;
        }
      }
    }
  }
  v17 = (_QWORD *)(a1 + 16);
  i = operator new(0x30uLL);
  *(_QWORD *)i = 0;
  *((_QWORD *)i + 1) = v10;
  v18 = *a4;
  v19 = **a4;
  *((_QWORD *)i + 4) = *((_QWORD *)*a4 + 2);
  *((_OWORD *)i + 1) = v19;
  *((_QWORD *)v18 + 1) = 0;
  *((_QWORD *)v18 + 2) = 0;
  *(_QWORD *)v18 = 0;
  *((_QWORD *)i + 5) = 0;
  v20 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v21 = *(float *)(a1 + 32);
  if (!v11 || (float)(v21 * (float)v11) < v20)
  {
    v22 = 1;
    if (v11 >= 3)
      v22 = (v11 & (v11 - 1)) != 0;
    v23 = v22 | (2 * v11);
    v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24)
      v25 = v24;
    else
      v25 = v23;
    sub_2358D17FC(a1, v25);
    v11 = *(_QWORD *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
        v4 = v10 % v11;
      else
        v4 = v10;
    }
    else
    {
      v4 = (v11 - 1) & v10;
    }
  }
  v26 = *(_QWORD *)a1;
  v27 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v27)
  {
    *(_QWORD *)i = *v27;
LABEL_38:
    *v27 = i;
    goto LABEL_39;
  }
  *(_QWORD *)i = *v17;
  *v17 = i;
  *(_QWORD *)(v26 + 8 * v4) = v17;
  if (*(_QWORD *)i)
  {
    v28 = *(_QWORD *)(*(_QWORD *)i + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v28 >= v11)
        v28 %= v11;
    }
    else
    {
      v28 &= v11 - 1;
    }
    v27 = (_QWORD *)(*(_QWORD *)a1 + 8 * v28);
    goto LABEL_38;
  }
LABEL_39:
  ++*v8;
  return i;
}

void sub_2358D233C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  void **v10;
  uint64_t v11;

  sub_2358D1A30(v11, v10);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_2358D2358(_QWORD *a1, unsigned __int8 *a2)
{
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 **v10;
  unsigned __int8 *v11;
  uint64_t v12;
  unint64_t v13;

  v4 = sub_2358D12B0((uint64_t)(a1 + 3), (uint64_t)a2);
  v5 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v5)
    return 0;
  v6 = v4;
  v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    v9 = v4;
    if (v4 >= *(_QWORD *)&v5)
      v9 = v4 % *(_QWORD *)&v5;
  }
  else
  {
    v9 = (*(_QWORD *)&v5 - 1) & v4;
  }
  v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10)
    return 0;
  v11 = *v10;
  if (*v10)
  {
    v12 = (uint64_t)(a1 + 4);
    do
    {
      v13 = *((_QWORD *)v11 + 1);
      if (v13 == v6)
      {
        if ((sub_2358D1758(v12, v11 + 16, a2) & 1) != 0)
          return v11;
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(_QWORD *)&v5)
            v13 %= *(_QWORD *)&v5;
        }
        else
        {
          v13 &= *(_QWORD *)&v5 - 1;
        }
        if (v13 != v9)
          return 0;
      }
      v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

unsigned __int8 *sub_2358D2458(uint64_t a1, unsigned __int8 *a2, uint64_t a3, __int128 **a4)
{
  unint64_t v4;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint8x8_t v12;
  unint64_t v13;
  unsigned __int8 **v14;
  unsigned __int8 *i;
  unint64_t v16;
  float v17;
  float v18;
  _BOOL8 v19;
  unint64_t v20;
  unint64_t v21;
  size_t v22;
  _QWORD *v23;
  unint64_t v24;
  _QWORD v26[3];

  v8 = (_QWORD *)(a1 + 24);
  v9 = sub_2358D12B0(a1 + 24, (uint64_t)a2);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 8);
  if (v11)
  {
    v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      v4 = v9;
      if (v9 >= v11)
        v4 = v9 % v11;
    }
    else
    {
      v4 = (v11 - 1) & v9;
    }
    v14 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v4);
    if (v14)
    {
      for (i = *v14; i; i = *(unsigned __int8 **)i)
      {
        v16 = *((_QWORD *)i + 1);
        if (v16 == v10)
        {
          if ((sub_2358D1758(a1 + 32, i + 16, a2) & 1) != 0)
            return i;
        }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11)
              v16 %= v11;
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4)
            break;
        }
      }
    }
  }
  sub_2358D26EC(a1, v10, a4, (uint64_t)v26);
  v17 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v18 = *(float *)(a1 + 32);
  if (!v11 || (float)(v18 * (float)v11) < v17)
  {
    v19 = 1;
    if (v11 >= 3)
      v19 = (v11 & (v11 - 1)) != 0;
    v20 = v19 | (2 * v11);
    v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21)
      v22 = v21;
    else
      v22 = v20;
    sub_2358D17FC(a1, v22);
    v11 = *(_QWORD *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
        v4 = v10 % v11;
      else
        v4 = v10;
    }
    else
    {
      v4 = (v11 - 1) & v10;
    }
  }
  v23 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v23)
  {
    *(_QWORD *)v26[0] = *v23;
    *v23 = v26[0];
  }
  else
  {
    *(_QWORD *)v26[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v26[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v26[0])
    {
      v24 = *(_QWORD *)(*(_QWORD *)v26[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v24 >= v11)
          v24 %= v11;
      }
      else
      {
        v24 &= v11 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v24) = v26[0];
    }
  }
  i = (unsigned __int8 *)v26[0];
  ++*v8;
  return i;
}

void sub_2358D26C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void **__p, uint64_t a13)
{
  if (__p)
    sub_2358D1A30((uint64_t)&a13, __p);
  _Unwind_Resume(exception_object);
}

double sub_2358D26EC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7;
  char *v8;
  _BYTE *v9;
  __int128 *v10;
  __int128 v11;
  double result;

  v7 = a1 + 16;
  v8 = (char *)operator new(0xD0uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = a2;
  v9 = v8 + 16;
  v10 = *a3;
  if (*((char *)*a3 + 23) < 0)
  {
    sub_2358D27C0(v9, *(void **)v10, *((_QWORD *)v10 + 1));
  }
  else
  {
    v11 = *v10;
    *((_QWORD *)v8 + 4) = *((_QWORD *)v10 + 2);
    *(_OWORD *)v9 = v11;
  }
  *((_QWORD *)v8 + 25) = 0;
  result = 0.0;
  *(_OWORD *)(v8 + 184) = 0u;
  *(_OWORD *)(v8 + 168) = 0u;
  *(_OWORD *)(v8 + 152) = 0u;
  *(_OWORD *)(v8 + 136) = 0u;
  *(_OWORD *)(v8 + 120) = 0u;
  *(_OWORD *)(v8 + 104) = 0u;
  *(_OWORD *)(v8 + 88) = 0u;
  *(_OWORD *)(v8 + 72) = 0u;
  *(_OWORD *)(v8 + 56) = 0u;
  *(_OWORD *)(v8 + 40) = 0u;
  *(_BYTE *)(a4 + 16) = 1;
  return result;
}

void sub_2358D27A4(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  sub_2358D1A30(v3, v2);
  _Unwind_Resume(a1);
}

void *sub_2358D27C0(_BYTE *__dst, void *__src, unint64_t a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8)
      sub_2358D0D9C();
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

uint64_t sub_2358D284C(uint64_t a1)
{
  void *v2;

  sub_2358D0FA0(a1, *(void ***)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

uint64_t sub_2358D2884(uint64_t a1)
{
  void *v2;

  sub_2358D28BC(a1, *(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void sub_2358D28BC(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (_QWORD *)*v2;
      sub_2358D1D64((uint64_t)(v2 + 2));
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

void sub_2358D28F8(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_2358D2908(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t sub_2358D2914@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_QWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2082;
  *(_QWORD *)(a2 + 14) = result;
  return result;
}

uint64_t sub_2358D2928(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(a3 + 4) = v3;
  *(_WORD *)(a3 + 12) = 2082;
  *(_QWORD *)(a3 + 14) = result;
  *(_WORD *)(a3 + 22) = 2082;
  *(_QWORD *)(a3 + 24) = a2;
  return result;
}

void sub_2358D2944(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x20u);
}

void sub_2358D2954(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x1Cu);
}

uint64_t ANSTTensorDataTypeIsFloatingPoint(uint64_t a1)
{
  return ((unint64_t)(a1 - 68) < 0x25) & (0x1500000001uLL >> (a1 - 68));
}

uint64_t ANSTTensorDataTypeGetSize(uint64_t a1)
{
  uint64_t result;

  result = 1;
  if (a1 <= 82)
  {
    if (a1 > 72)
    {
      if (a1 == 73)
        return 4;
      else
        return 8;
    }
    else if (a1 != 67)
    {
      return 16;
    }
  }
  else
  {
    switch(a1)
    {
      case 'c':
        return result;
      case 'd':
      case 'q':
        return 8;
      case 'e':
      case 'g':
      case 'j':
      case 'k':
      case 'l':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
      case 'r':
        __break(1u);
        return result;
      case 'f':
      case 'i':
        return 4;
      case 'h':
      case 's':
        goto LABEL_12;
      case 't':
        return 16;
      default:
        if (a1 == 84)
          return 16;
LABEL_12:
        result = 2;
        break;
    }
  }
  return result;
}

uint64_t ANSTTensorDataTypeGetPreferredAlignment(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = 1;
  if (a1 <= 82)
  {
    v3 = 4;
    if (a1 != 73)
      v3 = 8;
    v4 = 8;
    if (a1 == 67)
      v4 = 1;
    if (a1 <= 72)
      return v4;
    else
      return v3;
  }
  else
  {
    switch(a1)
    {
      case 'c':
        return result;
      case 'd':
      case 'q':
      case 't':
        result = 8;
        break;
      case 'e':
      case 'g':
      case 'j':
      case 'k':
      case 'l':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
      case 'r':
        __break(1u);
        break;
      case 'f':
      case 'i':
        result = 4;
        break;
      case 'h':
      case 's':
        result = 2;
        break;
      default:
        if (a1 == 83)
          result = 2;
        else
          result = 8;
        break;
    }
  }
  return result;
}

const __CFString *ANSTTensorDataTypeToNSString(uint64_t a1)
{
  uint64_t v1;
  const __CFString *result;
  const __CFString *v3;
  const __CFString *v4;

  if (a1 <= 82)
  {
    v3 = CFSTR("UInt32");
    if (a1 != 73)
      v3 = CFSTR("UInt64");
    v4 = CFSTR("UInt8");
    if (a1 != 67)
      v4 = CFSTR("Float128");
    if (a1 <= 72)
      return v4;
    else
      return v3;
  }
  else
  {
    v1 = a1 - 99;
    result = CFSTR("Int8");
    switch(v1)
    {
      case 0:
        return result;
      case 1:
        result = CFSTR("Float64");
        break;
      case 2:
      case 4:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 15:
        __break(1u);
        break;
      case 3:
        result = CFSTR("Float32");
        break;
      case 5:
        result = CFSTR("Float16");
        break;
      case 6:
        result = CFSTR("Int32");
        break;
      case 14:
        result = CFSTR("Int64");
        break;
      case 16:
        result = CFSTR("Int16");
        break;
      case 17:
        result = CFSTR("Int128");
        break;
      default:
        if (CFSTR("Int8") == (__CFString *)83)
          result = CFSTR("UInt16");
        else
          result = CFSTR("UInt128");
        break;
    }
  }
  return result;
}

__CFString *ANSTObjectCategoryFromAcDetCategory(unsigned int a1)
{
  if (a1 > 0xB)
    return 0;
  else
    return off_2506E3B88[a1];
}

uint64_t AcImageOrientationFromANSTImageOrientation(uint64_t a1)
{
  NSObject *v2;

  if ((unint64_t)(a1 - 1) < 4)
    return dword_235914D10[a1 - 1];
  _ANSTLoggingGetOSLogForCategoryANSTKit();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    sub_23590F35C(v2);

  return 0;
}

uint64_t sub_2358D5A2C(void *a1, const char *a2, uint64_t a3)
{
  return objc_msgSend_resolution(a1, a2, a3);
}

void *sub_2358D5F88(uint64_t a1, const void *a2)
{
  return memcpy(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 48) * *(_QWORD *)(a1 + 40));
}

void sub_2358D7270(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x26u);
}

const __CFString *ANSTVideoMaskRefineAlgorithmVersionToNSString(uint64_t a1)
{
  NSObject *v3;

  if (a1 == 0x10000)
    return CFSTR("Version1");
  _ANSTLoggingGetOSLogForCategoryANSTKit();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    sub_235910060(a1, v3);

  return CFSTR("UNEXPECTED_ENUM_VALUE");
}

__CFString *ANSTAssetTypeToNSString(unint64_t a1, const char *a2)
{
  if (a1 < 3)
    return off_2506E3C28[a1];
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("UnknownType(0x%zx)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t sub_2358DA944(uint64_t a1, const char *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t result;
  _QWORD v7[8];

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_2358DA9C0;
  v7[3] = &unk_2506E3C48;
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 64);
  v7[6] = a2;
  v7[7] = v4;
  v5 = *(void **)(a1 + 32);
  v7[4] = *(_QWORD *)(a1 + 40);
  v7[5] = v3;
  result = objc_msgSend_performMutableDataAccessWithOptions_usingBlock_error_(v5, a2, 0, v7, *(_QWORD *)(a1 + 72));
  **(_BYTE **)(a1 + 48) = result;
  return result;
}

_QWORD *sub_2358DA9C0(_QWORD *result, uint64_t a2)
{
  _QWORD *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  size_t v7;
  char *v8;
  void *v9;
  void *v10;

  if (result[5])
  {
    v3 = result;
    v4 = 0;
    do
    {
      v5 = v3[7] * v4;
      v6 = v3[4];
      v7 = *(_QWORD *)(v6 + 88);
      v8 = (char *)(v3[6] + v5);
      v9 = (void *)(a2 + v5);
      v10 = (void *)(a2 + v5 + v7);
      memcpy(*(void **)(v6 + 80), &v8[v7], v7);
      memcpy(v10, v8, *(_QWORD *)(v3[4] + 88));
      result = memcpy(v9, *(const void **)(v3[4] + 80), *(_QWORD *)(v3[4] + 88));
      ++v4;
    }
    while (v4 < v3[5]);
  }
  return result;
}

uint64_t sub_2358DABC0(uint64_t a1, const char *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t result;
  _QWORD v6[5];
  __int128 v7;
  uint64_t v8;
  const char *v9;
  __int128 v10;
  uint64_t v11;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_2358DAC50;
  v6[3] = &unk_2506E3C98;
  v7 = *(_OWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 72);
  v9 = a2;
  v10 = *(_OWORD *)(a1 + 80);
  v3 = *(_QWORD *)(a1 + 104);
  v11 = *(_QWORD *)(a1 + 96);
  v4 = *(void **)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  result = objc_msgSend_performMutableDataAccessWithOptions_usingBlock_error_(v4, a2, 0, v6, v3);
  **(_BYTE **)(a1 + 48) = result;
  return result;
}

_QWORD *sub_2358DAC50(_QWORD *result, uint64_t a2)
{
  unint64_t v2;
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t i;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  size_t v15;
  char *v16;
  char *v17;

  v2 = result[5];
  if (v2)
  {
    v4 = result;
    v5 = 0;
    v6 = result[6];
    v7 = v6;
    do
    {
      if (v7)
      {
        v8 = 0;
        v9 = v4[7];
        do
        {
          if (v9)
          {
            for (i = 0; i < v9; ++i)
            {
              v11 = v4[9] * v5;
              v12 = v4[10] * v8 + v4[11] * i;
              v13 = (char *)(v4[8] + v11 + v12);
              v14 = v4[4];
              v15 = *(_QWORD *)(v14 + 104);
              v16 = (char *)(a2 + v11 + v12);
              v17 = &v16[v15];
              memcpy(*(void **)(v14 + 96), &v13[v15], v15);
              memcpy(v17, v13, *(_QWORD *)(v4[4] + 104));
              result = memcpy(v16, *(const void **)(v4[4] + 96), *(_QWORD *)(v4[4] + 104));
              v9 = v4[7];
            }
            v6 = v4[6];
          }
          ++v8;
        }
        while (v8 < v6);
        v2 = v4[5];
        v7 = v6;
      }
      ++v5;
    }
    while (v5 < v2);
  }
  return result;
}

__CFString *ANSTViSegHQInferenceVersionToNSString(uint64_t a1, const char *a2)
{
  __CFString *v2;

  if (a1 == 0x10000)
    return CFSTR("Version1");
  if (a1 == 0x20000)
  {
    v2 = CFSTR("Version2");
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("UnknownVersion(0x%zx)"), a1);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

__CFString *ANSTViSegHQInferenceResolutionToNSString(unint64_t a1, const char *a2)
{
  if (a1 < 4)
    return off_2506E3D00[a1];
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("UnknownResolution(%zd)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t sub_2358DCA18(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  if (a2)
  {
    v2 = a2;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

uint64_t sub_2358DCAD4(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  if (a2)
  {
    v2 = a2;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

uint64_t sub_2358DCB90(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  if (a2)
  {
    v2 = a2;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

uint64_t sub_2358DCC4C(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  if (a2)
  {
    v2 = a2;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

uint64_t sub_2358DCD08(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  if (a2)
  {
    v2 = a2;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

uint64_t sub_2358DCDC4(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  if (a2)
  {
    v2 = a2;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

uint64_t sub_2358DF800(size_t a1, const char *a2, CVPixelBufferRef *a3)
{
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  const __CFDictionary *v12;
  uint64_t v13;
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x24BDAC8D0];
  v15[0] = *MEMORY[0x24BDC5708];
  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], a2, a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  v15[1] = *MEMORY[0x24BDC5650];
  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v7, (uint64_t)a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  v15[2] = *MEMORY[0x24BDC56B8];
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v9, 1278226534);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = *MEMORY[0x24BDC5668];
  v16[2] = v10;
  v16[3] = MEMORY[0x24BDBD1B8];
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v11, (uint64_t)v16, v15, 4);
  v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v13 = CVPixelBufferCreate(0, a1, (size_t)a2, 0x4C303066u, v12, a3);
  return v13;
}

void sub_2358E0534(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x20u);
}

uint64_t sub_2358E0558(void **a1, const char *a2, uint64_t a3)
{
  return objc_msgSend_version(*a1, a2, a3);
}

uint64_t sub_2358E0564(uint64_t a1, const char *a2, uint64_t a3)
{
  void **v3;

  return objc_msgSend_networkResolution(*v3, a2, a3);
}

BOOL sub_2358E0814(void *a1, uint64_t *a2, const char *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;

  v5 = a1;
  v6 = objc_opt_class();
  NSStringFromSelector(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v5, v8, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    *a2 = objc_msgSend_unsignedIntegerValue(v9, v10, v11);

  return v9 != 0;
}

uint64_t sub_2358E08B0(void *a1, uint64_t a2, const char *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v16;

  v16 = a2;
  v4 = a1;
  v5 = objc_opt_class();
  NSStringFromSelector(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8
    && (v9 = objc_retainAutorelease(v8),
        v12 = (const char *)objc_msgSend_objCType(v9, v10, v11),
        !strcmp(v12, "{CGRect={CGPoint=dd}{CGSize=dd}}")))
  {
    objc_msgSend_getValue_size_(v9, v13, (uint64_t)&v16, 32);
    v14 = 1;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void sub_2358E0A48(void *a1, uint64_t a2, const char *a3)
{
  void *v5;
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  id v10;

  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a1;
  objc_msgSend_numberWithUnsignedInteger_(v5, v7, a2);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v6, v9, (uint64_t)v10, v8);

}

void sub_2358E0AC8(void *a1, const char *a2, double a3, double a4, double a5, double a6)
{
  void *v7;
  id v8;
  const char *v9;
  void *v10;
  void *v11;
  const char *v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v7 = (void *)MEMORY[0x24BDD1968];
  v8 = a1;
  objc_msgSend_valueWithBytes_objCType_(v7, v9, (uint64_t)&v13, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v8, v12, (uint64_t)v10, v11, *(_QWORD *)&v13, *(_QWORD *)&v14, *(_QWORD *)&v15, *(_QWORD *)&v16);

}

id sub_2358E0C58(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  id v8;
  const char *v9;
  CGFloat MinX;
  const char *v11;
  CGFloat MinY;
  const char *v13;
  CGFloat Width;
  const char *v15;
  CGFloat Height;
  const char *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v8 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend_appendString_(v8, v9, (uint64_t)CFSTR("CGRect("));
  v23.origin.x = a1;
  v23.origin.y = a2;
  v23.size.width = a3;
  v23.size.height = a4;
  MinX = CGRectGetMinX(v23);
  objc_msgSend_appendFormat_(v8, v11, (uint64_t)CFSTR("x=%.*g, "), 17, *(_QWORD *)&MinX);
  v24.origin.x = a1;
  v24.origin.y = a2;
  v24.size.width = a3;
  v24.size.height = a4;
  MinY = CGRectGetMinY(v24);
  objc_msgSend_appendFormat_(v8, v13, (uint64_t)CFSTR("y=%.*g, "), 17, *(_QWORD *)&MinY);
  v25.origin.x = a1;
  v25.origin.y = a2;
  v25.size.width = a3;
  v25.size.height = a4;
  Width = CGRectGetWidth(v25);
  objc_msgSend_appendFormat_(v8, v15, (uint64_t)CFSTR("w=%.*g, "), 17, *(_QWORD *)&Width);
  v26.origin.x = a1;
  v26.origin.y = a2;
  v26.size.width = a3;
  v26.size.height = a4;
  Height = CGRectGetHeight(v26);
  objc_msgSend_appendFormat_(v8, v17, (uint64_t)CFSTR("h=%.*g"), 17, *(_QWORD *)&Height);
  objc_msgSend_appendString_(v8, v18, (uint64_t)CFSTR(")"));
  v21 = (void *)objc_msgSend_copy(v8, v19, v20);

  return v21;
}

id sub_2358E0F0C(double a1, double a2, double a3, double a4, uint64_t a5, const char *a6, uint64_t a7)
{
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  _QWORD v23[4];
  _QWORD v24[5];

  v24[4] = *MEMORY[0x24BDAC8D0];
  v23[0] = CFSTR("x");
  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], a6, a7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v10;
  v23[1] = CFSTR("y");
  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v11, v12, a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v13;
  v23[2] = CFSTR("width");
  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v14, v15, a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v16;
  v23[3] = CFSTR("height");
  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v17, v18, a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v19;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v20, (uint64_t)v24, v23, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

BOOL sub_2358E124C(void *a1, uint64_t *a2, const char *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;

  v5 = a1;
  v6 = objc_opt_class();
  NSStringFromSelector(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v5, v8, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    *a2 = objc_msgSend_integerValue(v9, v10, v11);

  return v9 != 0;
}

void sub_2358E1360(void *a1, uint64_t a2, const char *a3)
{
  void *v5;
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  id v10;

  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a1;
  objc_msgSend_numberWithInteger_(v5, v7, a2);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v6, v9, (uint64_t)v10, v8);

}

BOOL sub_2358E2A14(void *a1, _BYTE *a2, const char *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;

  v5 = a1;
  v6 = objc_opt_class();
  NSStringFromSelector(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v5, v8, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    *a2 = objc_msgSend_BOOLValue(v9, v10, v11);

  return v9 != 0;
}

void sub_2358E2D00(void *a1, uint64_t a2, const char *a3)
{
  void *v5;
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  id v10;

  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a1;
  objc_msgSend_numberWithBool_(v5, v7, a2);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v6, v9, (uint64_t)v10, v8);

}

void sub_2358E6AB8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

const __CFString *ANSTISPAlgorithmVersionToNSString(uint64_t a1)
{
  NSObject *v2;

  if (a1 == 0x10000)
    return CFSTR("Version1");
  _ANSTLoggingGetOSLogForCategoryANSTKit();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    sub_235910F10();

  return CFSTR("UNEXPECTED_ENUM_VALUE");
}

const __CFString *ANSTISPAlgorithmResolutionToNSString(uint64_t a1)
{
  NSObject *v2;

  if (!a1)
    return CFSTR("512x384");
  if (a1 == 1)
    return CFSTR("1024x576");
  _ANSTLoggingGetOSLogForCategoryANSTKit();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    sub_235910F7C();

  return CFSTR("UNEXPECTED_ENUM_VALUE");
}

const __CFString *ANSTISPAlgorithmRunningFrameRateToNSString(uint64_t a1)
{
  NSObject *v2;

  if (!a1)
    return CFSTR("Standard");
  if (a1 == 1)
    return CFSTR("Low");
  _ANSTLoggingGetOSLogForCategoryANSTKit();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    sub_235910FE8();

  return CFSTR("UNEXPECTED_ENUM_VALUE");
}

void sub_2358E6ED0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

_BYTE *sub_2358E96FC(uint64_t a1, const char *a2)
{
  float *v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  size_t BytesPerRow;
  int v8;
  _BYTE *result;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  float *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 *v18;
  _WORD *v19;
  uint64_t v20;
  __int16 v21;

  v2 = (float *)a2;
  v4 = objc_msgSend_strideOfDimensionAt_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40) - 2);
  v6 = objc_msgSend_strideOfDimensionAt_(*(void **)(a1 + 32), v5, *(_QWORD *)(a1 + 40) - 1);
  BytesPerRow = CVPixelBufferGetBytesPerRow(*(CVPixelBufferRef *)(a1 + 48));
  v8 = *(_DWORD *)(a1 + 72);
  result = CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(a1 + 48));
  v10 = *(_QWORD *)(a1 + 56);
  if (v8 == 1278226488)
  {
    if (v10)
    {
      v11 = 0;
      v12 = *(_QWORD *)(a1 + 64);
      do
      {
        if (v12)
        {
          v13 = 0;
          v14 = v2;
          do
          {
            result[v13++] = (int)*v14;
            v12 = *(_QWORD *)(a1 + 64);
            v14 = (float *)((char *)v14 + v6);
          }
          while (v13 < v12);
          v10 = *(_QWORD *)(a1 + 56);
        }
        v2 = (float *)((char *)v2 + v4);
        result += BytesPerRow;
        ++v11;
      }
      while (v11 < v10);
    }
  }
  else if (v10)
  {
    v15 = 0;
    v16 = 0;
    v17 = *(_QWORD *)(a1 + 64);
    do
    {
      if (v17)
      {
        v18 = (__int16 *)v2 + v16;
        v19 = &result[2 * v16];
        v16 += v17;
        v20 = v17;
        do
        {
          v21 = *v18++;
          _H0 = v21;
          __asm { FCVT            S0, H0 }
          _S0 = _S0 / 255.0;
          __asm { FCVT            H0, S0 }
          *v19++ = LOWORD(_S0);
          --v20;
        }
        while (v20);
      }
      ++v15;
    }
    while (v15 != v10);
  }
  return result;
}

void sub_2358EA114(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x488], 8);
  _Unwind_Resume(a1);
}

void sub_2358EA174(uint32x2_t *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint32x2_t v7;
  _QWORD *v8;
  uint64_t v9;
  float32x4_t *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14[3];
  uint64_t v15;

  v4 = 0;
  v5 = 0;
  v15 = *MEMORY[0x24BDAC8D0];
  do
  {
    *(_QWORD *)(*(_QWORD *)&a1[7] + v4) = objc_msgSend_pointerAtIndex_(a2, (const char *)a2, v5++);
    v4 += 24;
  }
  while (v5 != 25);
  v14[0] = (uint64_t)a1[7];
  v14[1] = v14[0] + 408;
  v14[2] = v14[0] + 576;
  LODWORD(v13) = 1;
  v12 = 0x700000011;
  v7 = a1[4];
  v8 = *(_QWORD **)(*(_QWORD *)&v7 + 104);
  v9 = *(_QWORD *)&v7 + 112;
  v10 = (float32x4_t *)objc_msgSend_useE5(*(void **)(*(_QWORD *)&v7 + 64), (const char *)a2, v6, 0x700000011, v13, v14[0], v14[0] + 408, v14[0] + 576, v15);
  AcANSTPostProcessMultiNetOutputs(v8, a1 + 8, v9, v14, (unsigned int *)&v12, v10, (_DWORD *)(*(_QWORD *)&a1[4] + 2512), *(_QWORD *)(*(_QWORD *)&a1[6] + 8) + 32);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)&a1[5] + 8) + 24) = v11;
}

uint64_t sub_2358EA7F0(void *a1, uint64_t a2, void *a3, void *a4, _QWORD *a5)
{
  id v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v9 = a1;
  v10 = a3;
  v11 = a4;
  objc_msgSend_nextObject(v9, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 1;
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = sub_2358EA9D0;
    v29 = sub_2358EA9E0;
    v30 = 0;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = sub_2358EA9E8;
    v18[3] = &unk_2506E3ED8;
    v19 = v10;
    v22 = &v31;
    v20 = v9;
    v24 = a2;
    v21 = v11;
    v23 = &v25;
    if (objc_msgSend_performDataAccessWithOptions_usingBlock_error_(v14, v15, a2, v18, a5))
    {
      if (*((_BYTE *)v32 + 24))
      {
        v16 = 1;
LABEL_9:

        _Block_object_dispose(&v25, 8);
        _Block_object_dispose(&v31, 8);
        goto LABEL_10;
      }
      if (a5)
      {
        v16 = 0;
        *a5 = objc_retainAutorelease((id)v26[5]);
        goto LABEL_9;
      }
    }
    v16 = 0;
    goto LABEL_9;
  }
  (*((void (**)(id, id))v11 + 2))(v11, v10);
  v16 = 1;
LABEL_10:

  return v16;
}

void sub_2358EA9AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2358EA9D0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_2358EA9E0(uint64_t a1)
{

}

void sub_2358EA9E8(uint64_t a1, const char *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  id obj;

  objc_msgSend_addPointer_(*(void **)(a1 + 32), a2, (uint64_t)a2);
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 72);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v7 + 40);
  v8 = sub_2358EA7F0(v3, v6, v4, v5, &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v8;
}

void softmax(float *a1, float *a2, unsigned int a3)
{
  unsigned int v3;
  float *v4;
  float v5;
  float *v6;
  float v7;
  float v8;
  uint64_t v9;
  float *v10;
  float v11;
  float v12;
  unsigned int v13;
  float *v14;
  float v15;

  v3 = a3;
  v4 = a2;
  v5 = *a1;
  if (a3 >= 2)
  {
    v6 = a1 + 1;
    do
    {
      v7 = *v6++;
      v8 = v7;
      if (v5 < v7)
        v5 = v8;
    }
    while (v6 < &a1[a3]);
  }
  if (a3)
  {
    v9 = a3;
    v10 = a2;
    do
    {
      v11 = *a1++;
      *v10++ = v11 - v5;
      --v9;
    }
    while (v9);
    v12 = 0.0;
    v13 = a3;
    v14 = a2;
    do
    {
      v15 = *v14++;
      v12 = v12 + expf(v15);
      --v13;
    }
    while (v13);
    for (; v3; --v3)
    {
      *v4 = expf(*v4) / v12;
      ++v4;
    }
  }
}

const __CFString *ANSTActionToNSString(unint64_t a1)
{
  NSObject *v2;

  if (a1 < 0x36)
    return *(&off_2506E3F48 + a1);
  _ANSTLoggingGetOSLogForCategoryANSTKit();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    sub_2359118B0();

  return CFSTR("UNEXPECTED_ENUM_VALUE");
}

const __CFString *ANSTActionClassifierVersionToNSString(uint64_t a1)
{
  NSObject *v2;

  if (a1 == 0x10000)
    return CFSTR("Version1");
  _ANSTLoggingGetOSLogForCategoryANSTKit();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    sub_23591191C();

  return CFSTR("UNEXPECTED_ENUM_VALUE");
}

void sub_2358EB308(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  const char *v4;
  _QWORD v5[5];
  id v6;
  uint64_t v7;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_2358EB388;
  v5[3] = &unk_2506E3F00;
  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v7 = a2;
  v5[4] = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend_performDataAccessWithOptions_usingBlock_error_(v3, v4, 0, v5, 0);

}

void sub_2358EB388(uint64_t a1, uint64_t a2)
{
  uint64_t i;
  ANSTActionPrediction *v4;
  const char *v5;
  void *v6;
  double v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
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

  if (!*(_QWORD *)(a1 + 48))
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_235911A7C(v11, v12, v13, v14, v15, v16, v17, v18);
    goto LABEL_10;
  }
  if (!a2)
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_235911AEC(v11, v19, v20, v21, v22, v23, v24, v25);
LABEL_10:

    return;
  }
  LODWORD(v27) = 1;
  v26 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
  cblas_sgemv_NEWLAPACK();
  cblas_sscal_NEWLAPACK();
  softmax(*(float **)(*(_QWORD *)(a1 + 32) + 56), *(float **)(*(_QWORD *)(a1 + 32) + 64), 0x35u);
  for (i = 0; i != 53; ++i)
  {
    v4 = [ANSTActionPrediction alloc];
    v6 = (void *)objc_msgSend_initWithAction_(v4, v5, i + 1, v26, v27);
    LODWORD(v7) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 4 * i);
    objc_msgSend_setConfidence_(v6, v8, v9, v7);
    objc_msgSend_addObject_(*(void **)(a1 + 40), v10, (uint64_t)v6);

  }
}

void sub_2358EBE1C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

const __CFString *ANSTForegroundSegmentationVersionToNSString(uint64_t a1)
{
  NSObject *v2;

  if (a1 == 0x10000)
    return CFSTR("Version1");
  if (a1 == 0x20000)
    return CFSTR("Version2");
  _ANSTLoggingGetOSLogForCategoryANSTKit();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    sub_235911C3C();

  return CFSTR("UNEXPECTED_ENUM_VALUE");
}

const __CFString *ANSTForegroundSegmentationResolutionToNSString(unint64_t a1)
{
  NSObject *v2;

  if (a1 < 4)
    return *(&off_2506E40F8 + a1);
  _ANSTLoggingGetOSLogForCategoryANSTKit();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    sub_235911CA8();

  return CFSTR("UNEXPECTED_ENUM_VALUE");
}

const __CFString *ANSTVideoFeatureExtractorVersionToNSString(uint64_t a1)
{
  NSObject *v3;

  if (a1 == 0x10000)
    return CFSTR("Version1");
  _ANSTLoggingGetOSLogForCategoryANSTKit();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    sub_235911D14(a1, v3);

  return CFSTR("UNEXPECTED_ENUM_VALUE");
}

__CFString *ANSTInputModalityToNSString(uint64_t a1, const char *a2)
{
  __CFString *v2;

  if (!a1)
    return CFSTR("Video");
  if (a1 == 1)
  {
    v2 = CFSTR("Audio");
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("UnknownModality(0x%zx)"), a1);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

uint64_t sub_2358ED0FC(uint64_t a1, const char *a2, size_t a3, CVPixelBufferRef *a4)
{
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  const __CFDictionary *v14;
  uint64_t v15;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  v17[0] = *MEMORY[0x24BDC5708];
  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], a2, (uint64_t)a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v8;
  v17[1] = *MEMORY[0x24BDC5650];
  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v9, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  v17[2] = *MEMORY[0x24BDC56B8];
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v11, a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = *MEMORY[0x24BDC5668];
  v18[2] = v12;
  v18[3] = MEMORY[0x24BDBD1B8];
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v13, (uint64_t)v18, v17, 4);
  v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v15 = CVPixelBufferCreate(0, (size_t)a2, a3, a1, v14, a4);
  return v15;
}

const __CFString *ANSTVideoFoundationModelVersionToNSString(uint64_t a1)
{
  NSObject *v3;

  if (a1 == 0x10000)
    return CFSTR("Version1");
  _ANSTLoggingGetOSLogForCategoryANSTKit();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    sub_235911EFC(a1, v3);

  return CFSTR("UNEXPECTED_ENUM_VALUE");
}

uint64_t simResizeVisPipeBinning(uint64_t *a1, uint64_t *a2, float a3, float a4)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v14;
  int v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t i;
  uint64_t v19;
  _WORD *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  int v24;
  int v25;
  unsigned __int16 *v26;
  int v27;
  int v28;
  signed int v29;
  uint64_t v30;
  unsigned int v31;
  unint64_t v32;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int v37;
  int v38;
  uint64_t v39;
  unsigned int v40;
  uint64_t v41;
  _WORD *v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  signed int v46;
  uint64_t v47;
  int v48;
  unsigned int v49;
  uint16x8_t *v50;
  int32x4_t v51;
  uint64_t v52;
  int32x4_t v53;
  int32x4_t v54;
  int32x4_t v55;
  uint16x8_t v56;
  int v57;
  unsigned __int16 *v58;
  int v59;
  int v60;
  int v61;
  uint64_t v62;

  LODWORD(v4) = vcvtas_u32_f32(1.0 / a3);
  v6 = *((_DWORD *)a1 + 2);
  v7 = (*((_DWORD *)a1 + 3) / v4) & 0xFFFFFFFE;
  v9 = *((_DWORD *)a2 + 2);
  v8 = *((_DWORD *)a2 + 3);
  if (v8 >= v7)
    v10 = v7;
  else
    v10 = v8;
  LODWORD(v5) = vcvtas_u32_f32(1.0 / a4);
  if (v9 >= v6 / v5)
    v11 = v6 / v5;
  else
    v11 = v9;
  if ((_DWORD)v11)
  {
    if ((_DWORD)v10 && (_DWORD)v5 != 0)
    {
      v14 = *a2;
      v15 = *((_DWORD *)a2 + 4);
      if ((_DWORD)v4)
      {
        v16 = v4 >> 1;
        v17 = v5 >> 1;
        if (v4 >= 0x10)
        {
          v38 = 0;
          v39 = 0;
          v62 = *a2;
          v61 = *((_DWORD *)a2 + 4);
          do
          {
            v40 = 0;
            v41 = 0;
            v42 = (_WORD *)(v14 + (v15 * v39));
            v43 = *a1;
            v44 = *((_DWORD *)a1 + 4);
            v45 = *a1 + 16;
            do
            {
              v47 = 0;
              v48 = 0;
              v49 = v44 * v38;
              do
              {
                v50 = (uint16x8_t *)(v45 + 2 * v40 + v49);
                v51 = 0uLL;
                v52 = v4 & 0xFFFFFFF0;
                v53 = 0uLL;
                v54 = 0uLL;
                v55 = 0uLL;
                do
                {
                  v56 = v50[-1];
                  v53 = (int32x4_t)vaddw_high_u16((uint32x4_t)v53, v56);
                  v51 = (int32x4_t)vaddw_u16((uint32x4_t)v51, *(uint16x4_t *)v56.i8);
                  v55 = (int32x4_t)vaddw_high_u16((uint32x4_t)v55, *v50);
                  v54 = (int32x4_t)vaddw_u16((uint32x4_t)v54, *(uint16x4_t *)v50->i8);
                  v50 += 2;
                  v52 -= 16;
                }
                while (v52);
                v57 = vaddvq_s32(vaddq_s32(vaddq_s32(v54, v51), vaddq_s32(v55, v53)));
                if ((v4 & 0xFFFFFFF0) != v4)
                {
                  v58 = (unsigned __int16 *)(v43
                                           + 2 * (v41 * v4)
                                           + (v44 * (v39 * v5 + v47))
                                           + 2 * (v4 & 0xFFFFFFF0));
                  v59 = v4 - (v4 & 0xFFFFFFF0);
                  do
                  {
                    v60 = *v58++;
                    v57 += v60;
                    --v59;
                  }
                  while (v59);
                }
                v48 += (v57 + v16) / v4;
                ++v47;
                v49 += v44;
              }
              while (v47 != v5);
              v46 = (v48 + v17) / v5;
              if (v46 >= 0xFFFF)
                v46 = 0xFFFF;
              *v42++ = v46 & ~(unsigned __int16)(v46 >> 31);
              ++v41;
              v40 += v4;
            }
            while (v41 != v10);
            ++v39;
            v38 += v5;
            v14 = v62;
            v15 = v61;
          }
          while (v39 != v11);
        }
        else
        {
          for (i = 0; i != v11; ++i)
          {
            v19 = 0;
            v20 = (_WORD *)(v14 + (v15 * i));
            v21 = *a1;
            v22 = *((_DWORD *)a1 + 4);
            do
            {
              v23 = 0;
              v24 = 0;
              do
              {
                v25 = 0;
                v26 = (unsigned __int16 *)(v21 + 2 * (v19 * v4) + (v22 * (i * v5 + v23)));
                v27 = v4;
                do
                {
                  v28 = *v26++;
                  v25 += v28;
                  --v27;
                }
                while (v27);
                v24 += (v25 + v16) / v4;
                ++v23;
              }
              while (v23 != v5);
              v29 = (v24 + v17) / v5;
              if (v29 >= 0xFFFF)
                v29 = 0xFFFF;
              *v20++ = v29 & ~(unsigned __int16)(v29 >> 31);
              ++v19;
            }
            while (v19 != v10);
          }
        }
      }
      else
      {
        v30 = 0;
        if (v11 <= 1)
          goto LABEL_39;
        v31 = v15 >= 0 ? *((_DWORD *)a2 + 4) : -v15;
        v32 = v31 * (unint64_t)(v11 - 1);
        if ((_DWORD)v32 && v15 < 0)
          goto LABEL_39;
        if ((v32 & 0xFFFFFFFF00000000) != 0)
          goto LABEL_39;
        v34 = 0;
        v30 = v11 & 0xFFFFFFFE;
        v35 = v30;
        do
        {
          *(_WORD *)(v14 + v34) = 0;
          *(_WORD *)(v14 + v15 + v34) = 0;
          v34 += 2 * v15;
          v35 -= 2;
        }
        while (v35);
        if (v30 != v11)
        {
LABEL_39:
          v36 = v11 - v30;
          v37 = v15 * v30;
          do
          {
            *(_WORD *)(v14 + v37) = 0;
            v37 += v15;
            --v36;
          }
          while (v36);
        }
      }
    }
  }
  return 1;
}

uint64_t simResizeVisPipeArea(uint64_t *a1, uint64_t *a2, uint64_t *a3, float a4, float a5, float a6, float a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  int v12;
  uint64_t v13;
  unsigned int v14;
  int v15;
  int v16;
  uint64_t v17;
  _WORD *v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  __int16 v25;
  unsigned int v26;
  unsigned int v27;
  int v28;
  unsigned int v29;
  unsigned int v30;
  int v31;
  int v32;
  unsigned int v33;
  int v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  uint64_t v42;
  unsigned int v43;
  int v44;
  unsigned int v45;
  uint64_t v46;
  int v47;
  unsigned int v48;
  uint64x2_t v49;
  unsigned int v50;
  unsigned int v51;
  unsigned int v52;
  unsigned int v53;
  unsigned int v54;
  uint64_t v55;
  uint16x8_t *v56;
  char *v57;
  unsigned int v58;
  unsigned int v59;
  unsigned int v60;
  unsigned int v61;
  unsigned int v62;
  uint64_t v63;
  int v64;
  unsigned int v65;
  uint64_t v66;
  unsigned int v67;
  unsigned int v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  __int16 v72;
  int v73;
  uint64_t v74;
  unsigned int v75;
  int v76;
  unsigned int v77;
  unsigned int v78;
  unsigned int v79;
  unsigned int v80;
  unsigned int v81;
  uint64_t v82;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unsigned __int16 *v87;
  unsigned __int16 *v88;
  int v89;
  int v90;
  int v91;
  unint64_t v92;
  unint64_t v93;
  uint16x8_t *v94;
  int8x16_t *v95;
  int32x4_t v96;
  uint64_t v97;
  uint16x8_t v98;
  int32x4_t v99;
  int32x4_t v100;
  uint16x8_t v101;
  uint16x8_t v102;
  uint32x4_t v103;
  uint32x4_t v104;
  uint32x4_t v105;
  int64x2_t v106;
  int64x2_t v107;
  int64x2_t v108;
  int64x2_t v109;
  uint64x2_t v110;
  int8x16_t v111;
  unsigned int v113;
  int v115;
  unsigned int v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  unsigned int v121;
  uint64_t v122;
  unsigned int v123;

  v9 = *((unsigned int *)a2 + 3);
  v119 = *((unsigned int *)a2 + 2);
  v122 = *((unsigned int *)a1 + 2);
  if ((_DWORD)v122 && (_DWORD)v9)
  {
    v10 = 0;
    v11 = vcvtas_u32_f32(65536.0 / a4);
    LODWORD(v7) = vcvtas_u32_f32(a4 * 65536.0);
    v8 = vcvtas_u32_f32(a6 * 8.0) << 13;
    v120 = *a1;
    v12 = *((_DWORD *)a1 + 4);
    v13 = *a3;
    v14 = *((_DWORD *)a1 + 3) - 1;
    v15 = *((_DWORD *)a3 + 4);
    do
    {
      v16 = 0;
      v17 = v120 + (v12 * v10);
      v18 = (_WORD *)(v13 + (v15 * v10));
      v19 = v8 + v11;
      v20 = v8;
      do
      {
        v26 = HIWORD(v20);
        v27 = HIWORD(v20) + 1;
        v28 = 0x10000 - (unsigned __int16)v20;
        v20 += v11;
        v29 = HIWORD(v20);
        if (v14 >= v26)
          v30 = v26;
        else
          v30 = v14;
        v31 = v28 * *(unsigned __int16 *)(v17 + 2 * v30);
        if (v27 >= v29)
          goto LABEL_6;
        v32 = ~v26;
        v33 = ~v26 + (((_DWORD)v8 + v11 + v16 * v11) >> 16);
        if (v33 <= 1)
          goto LABEL_30;
        v34 = 0;
        v35 = (v32 + HIWORD(v19)) & 0xFFFFFFFE;
        v36 = v33 & 0xFFFFFFFE;
        v37 = v27;
        do
        {
          if (v14 >= v37)
            v38 = v37;
          else
            v38 = v14;
          if (v14 >= v37 + 1)
            v39 = v37 + 1;
          else
            v39 = v14;
          v31 += *(unsigned __int16 *)(v17 + 2 * v38) << 16;
          v34 += *(unsigned __int16 *)(v17 + 2 * v39) << 16;
          v37 += 2;
          v35 -= 2;
        }
        while (v35);
        v31 += v34;
        if (v33 != v36)
        {
          v27 += v36;
          do
          {
LABEL_30:
            if (v14 >= v27)
              v40 = v27;
            else
              v40 = v14;
            v31 += *(unsigned __int16 *)(v17 + 2 * v40) << 16;
            ++v27;
          }
          while (v27 < v29);
        }
LABEL_6:
        if (v14 >= v29)
          v21 = HIWORD(v20);
        else
          v21 = v14;
        v22 = (v31 + (unsigned __int16)v20 * *(unsigned __int16 *)(v17 + 2 * v21)) * v7;
        v23 = v22 + (v22 >> 63);
        v24 = (unint64_t)(v23 + 0x80000000) >> 32;
        if (v23 >= 0xFFFE80000000)
          LOWORD(v24) = -1;
        if (v23 <= 0x7FFFFFFF)
          v25 = 0;
        else
          v25 = v24;
        *v18++ = v25;
        ++v16;
        v19 += v11;
      }
      while (v16 != (_DWORD)v9);
      ++v10;
    }
    while (v10 != v122);
  }
  if ((_DWORD)v119 && (_DWORD)v9)
  {
    v41 = 0;
    v42 = 0;
    v43 = vcvtas_u32_f32(65536.0 / a5);
    LODWORD(v8) = vcvtas_u32_f32(a5 * 65536.0);
    v118 = *a2;
    v44 = *((_DWORD *)a2 + 4);
    v45 = v122 - 1;
    v46 = *a3;
    v47 = *((_DWORD *)a3 + 4);
    v48 = vcvtas_u32_f32(a7 * 8.0) << 13;
    v49 = (uint64x2_t)vdupq_n_s64(0xFFFE80000000uLL);
    v113 = v48 + v43;
    v115 = v44;
    v50 = v48 + v43;
    v117 = v43;
    while (1)
    {
      v51 = HIWORD(v48);
      v52 = HIWORD(v48) + 1;
      if (HIWORD(v50) >= v45)
        v53 = v45;
      else
        v53 = HIWORD(v50);
      if (v51 >= v45)
        v54 = v45;
      else
        v54 = HIWORD(v48);
      v55 = v47 * v54;
      v56 = (uint16x8_t *)(v46 + v55);
      v57 = (char *)(v118 + (v44 * v42));
      v58 = (v113 + (_DWORD)v42 * v43) >> 16;
      if (v58 >= v45)
        v59 = v45;
      else
        v59 = (v113 + (_DWORD)v42 * v43) >> 16;
      v60 = 0x10000 - (unsigned __int16)v48;
      v48 += v43;
      v61 = HIWORD(v48);
      if (v45 >= HIWORD(v48))
        v62 = HIWORD(v48);
      else
        v62 = v45;
      v123 = v41;
      v121 = v50;
      if (v52 < v61)
      {
        v63 = 0;
        v64 = ~v51;
        v65 = (~v51 + HIWORD(v50)) & 0xFFFFFFFE;
        v66 = v46 + v47 * v62;
        v67 = v58 + v64;
        v68 = (v58 + v64) & 0xFFFFFFFE;
        while (1)
        {
          v73 = v60 * v56->u16[v63];
          v74 = v46 + 2 * v63;
          if (v67 < 2)
            break;
          v76 = 0;
          v77 = v52;
          v78 = v65;
          do
          {
            if (v45 >= v77)
              v79 = v77;
            else
              v79 = v45;
            if (v45 >= v77 + 1)
              v80 = v77 + 1;
            else
              v80 = v45;
            v73 += *(unsigned __int16 *)(v74 + v79 * v47) << 16;
            v76 += *(unsigned __int16 *)(v74 + v80 * v47) << 16;
            v77 += 2;
            v78 -= 2;
          }
          while (v78);
          v73 += v76;
          v75 = v52 + v68;
          if (v67 != v68)
            goto LABEL_70;
LABEL_53:
          v69 = (v73 + (unsigned __int16)v48 * *(unsigned __int16 *)(v66 + 2 * v63)) * v8;
          v70 = v69 + (v69 >> 63);
          v71 = (unint64_t)(v70 + 0x80000000) >> 32;
          if (v70 >= 0xFFFE80000000)
            LOWORD(v71) = -1;
          if (v70 <= 0x7FFFFFFF)
            v72 = 0;
          else
            v72 = v71;
          *(_WORD *)v57 = v72;
          v57 += 2;
          if (++v63 == v9)
            goto LABEL_38;
        }
        v75 = v52;
        do
        {
LABEL_70:
          if (v45 >= v75)
            v81 = v75;
          else
            v81 = v45;
          v73 += *(unsigned __int16 *)(v74 + v81 * v47) << 16;
          ++v75;
        }
        while (v75 < v61);
        goto LABEL_53;
      }
      v82 = v47 * v53;
      if (v9 <= 7)
        break;
      if ((unint64_t)&v57[-v46 - v47 * v59] < 0x10 || (unint64_t)(v57 - (char *)v56) < 0x10)
        break;
      v94 = (uint16x8_t *)(v46 + v82);
      v95 = (int8x16_t *)(v118 + v41);
      v96 = vdupq_n_s32(v60);
      v97 = v9 & 0xFFFFFFF8;
      do
      {
        v98 = *v56++;
        v99 = (int32x4_t)vmovl_u16(*(uint16x4_t *)v98.i8);
        v100 = (int32x4_t)vmovl_high_u16(v98);
        v101 = *v94++;
        v102 = (uint16x8_t)vdupq_n_s16((unsigned __int16)v48);
        v103 = vmlal_u16((uint32x4_t)vmulq_s32(v96, v99), *(uint16x4_t *)v102.i8, *(uint16x4_t *)v101.i8);
        v104 = vmlal_high_u16((uint32x4_t)vmulq_s32(v96, v100), v102, v101);
        v105 = (uint32x4_t)vdupq_n_s32(v8);
        v106 = (int64x2_t)vmull_u32(*(uint32x2_t *)v105.i8, *(uint32x2_t *)v103.i8);
        v107 = (int64x2_t)vmull_high_u32(v105, v103);
        v108 = (int64x2_t)vmull_u32(*(uint32x2_t *)v105.i8, *(uint32x2_t *)v104.i8);
        v109 = (int64x2_t)vmull_high_u32(v105, v104);
        v110 = (uint64x2_t)vdupq_n_s64(0x7FFFFFFFuLL);
        v111 = (int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vcgtq_u64(v49, (uint64x2_t)v106), (int32x4_t)vcgtq_u64(v49, (uint64x2_t)v107)), (int16x8_t)vuzp1q_s32((int32x4_t)vcgtq_u64(v49, (uint64x2_t)v108), (int32x4_t)vcgtq_u64(v49, (uint64x2_t)v109)));
        *v95++ = vandq_s8(vornq_s8(vandq_s8((int8x16_t)vuzp1q_s16((int16x8_t)vraddhn_high_s64(vraddhn_s64(v106, (int64x2_t)0), v107, (int64x2_t)0), (int16x8_t)vraddhn_high_s64(vraddhn_s64(v108, (int64x2_t)0), v109, (int64x2_t)0)), v111), v111), (int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vcgtq_u64((uint64x2_t)v106, v110), (int32x4_t)vcgtq_u64((uint64x2_t)v107, v110)), (int16x8_t)vuzp1q_s32((int32x4_t)vcgtq_u64((uint64x2_t)v108, v110), (int32x4_t)vcgtq_u64((uint64x2_t)v109, v110))));
        v97 -= 8;
      }
      while (v97);
      if ((v9 & 0xFFFFFFF8) != v9)
      {
        v84 = v9 & 0xFFFFFFF8;
        v57 += 2 * v84;
LABEL_81:
        v85 = v9 - v84;
        v86 = v46 + 2 * v84;
        v87 = (unsigned __int16 *)(v86 + v82);
        v88 = (unsigned __int16 *)(v86 + v55);
        do
        {
          v89 = *v88++;
          v90 = v60 * v89;
          v91 = *v87++;
          v92 = v8 * (unint64_t)(v90 + (unsigned __int16)v48 * v91);
          v93 = (v92 + 0x80000000) >> 32;
          if (v92 >= 0xFFFE80000000)
            LOWORD(v93) = -1;
          if (!(v92 >> 31))
            LOWORD(v93) = 0;
          *(_WORD *)v57 = v93;
          v57 += 2;
          --v85;
        }
        while (v85);
      }
LABEL_38:
      ++v42;
      v43 = v117;
      v50 = v121 + v117;
      v44 = v115;
      v41 = v123 + v115;
      if (v42 == v119)
        return 1;
    }
    v84 = 0;
    goto LABEL_81;
  }
  return 1;
}

uint64_t simResizeVisPipeBilinear(uint64_t *a1, uint64_t *a2, float a3, float a4, float a5, float a6)
{
  uint64_t v6;
  int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  uint64_t v22;
  unsigned int v23;
  uint64_t v24;
  _WORD *v25;
  int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  int v33;
  __int16 v34;

  v6 = *((unsigned int *)a2 + 2);
  if ((_DWORD)v6)
  {
    v7 = *((_DWORD *)a2 + 3);
    if (v7)
    {
      v8 = 0;
      v9 = vcvtas_u32_f32(65536.0 / a3);
      v10 = vcvtas_u32_f32(65536.0 / a4);
      v11 = *((_DWORD *)a1 + 3);
      v12 = vcvtas_u32_f32(a5 * 8.0) << 13;
      v13 = *((_DWORD *)a1 + 2) - 1;
      v14 = *a1;
      v15 = *((_DWORD *)a1 + 4);
      v16 = *a2;
      v17 = *((_DWORD *)a2 + 4);
      v18 = v11 - 1;
      v19 = vcvtas_u32_f32(a6 * 8.0) << 13;
      do
      {
        v20 = HIWORD(v19);
        if (v13 >= HIWORD(v19))
          v21 = HIWORD(v19);
        else
          v21 = v13;
        v22 = v14 + v15 * v21;
        if (v13 >= v20 + 1)
          v23 = v20 + 1;
        else
          v23 = v13;
        v24 = v14 + v15 * v23;
        v25 = (_WORD *)(v16 + (v17 * v8));
        v26 = v7;
        v27 = v12;
        do
        {
          if (v18 >= HIWORD(v27))
            v28 = HIWORD(v27);
          else
            v28 = v18;
          if (v18 >= HIWORD(v27) + 1)
            v29 = HIWORD(v27) + 1;
          else
            v29 = v18;
          v30 = 2 * v29;
          v31 = 2 * v28;
          v32 = (*(unsigned __int16 *)(v22 + v30) - *(unsigned __int16 *)(v22 + v31)) * (unsigned __int16)v27
              + (*(unsigned __int16 *)(v22 + v31) << 16);
          LODWORD(v30) = (*(unsigned __int16 *)(v24 + v30) - *(unsigned __int16 *)(v24 + v31)) * (unsigned __int16)v27
                       + (*(unsigned __int16 *)(v24 + v31) << 16);
          LODWORD(v30) = ((v32 + (v32 >> 31) + 0x8000) & 0xFFFF0000)
                       + ((((int)v30 + ((int)v30 >> 31) + 0x8000) >> 16) - ((v32 + (v32 >> 31) + 0x8000) >> 16))
                       * (unsigned __int16)v19;
          v33 = v30 + ((int)v30 >> 31) + 0x8000;
          if (v33 < 0x10000)
            v34 = 0;
          else
            v34 = HIWORD(v33);
          *v25++ = v34;
          v27 += v9;
          --v26;
        }
        while (v26);
        ++v8;
        v19 += v10;
      }
      while (v8 != v6);
    }
  }
  return 1;
}

uint64_t simResizeVisPipe(uint64_t *a1, uint64_t a2, uint64_t *a3, int a4, unsigned int a5, float a6, float a7, float a8, float a9)
{
  uint64_t v9;
  uint64_t *v10;
  int v11;
  BOOL v13;
  int v21;
  char *v22;
  unsigned __int16 *v24;
  uint64_t v25;
  unsigned __int16 *v26;
  unint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint32x4_t v32;
  uint64_t v33;
  unsigned __int128 *v34;
  unsigned __int128 v35;
  unsigned int v36;
  int16x8_t *v37;
  uint64_t v38;
  uint64_t v39;
  int16x8_t *v40;
  unint64_t v41;
  uint64_t v42;
  uint32x4_t v43;
  int16x8_t *v44;
  unint64_t v45;
  uint16x8_t v46;
  __int128 v47;
  uint64_t v48;

  v9 = *((unsigned int *)a1 + 3);
  if (!(_DWORD)v9)
    return 0;
  v10 = a1;
  v11 = *((_DWORD *)a1 + 2);
  if (!v11)
    return 0;
  if (*(_DWORD *)(a2 + 12))
    v13 = *(_DWORD *)(a2 + 8) == 0;
  else
    v13 = 1;
  if (!v13)
  {
    if (!a5)
    {
      v22 = 0;
      goto LABEL_23;
    }
    v21 = *((_DWORD *)a1 + 4);
    if (v21 * v11)
    {
      v22 = (char *)operator new((v21 * v11));
      bzero(v22, (v21 * v11));
    }
    else
    {
      v22 = 0;
    }
    v47 = *(_OWORD *)v10;
    v48 = v10[2];
    *(_QWORD *)&v47 = v22;
    v24 = (unsigned __int16 *)*v10;
    v25 = ((v11 - 1) * v21);
    v26 = (unsigned __int16 *)(*v10 + 2 * v9 + v25);
    if ((unsigned __int16 *)*v10 != v26)
    {
      v27 = 2 * v9 + v25 - 2;
      if (v27 < 0x1E)
      {
        v28 = v22;
      }
      else
      {
        v28 = v22;
        if ((unint64_t)(v22 - (char *)v24) >= 0x20)
        {
          v29 = 0;
          v30 = (v27 >> 1) + 1;
          v31 = 2 * (v30 & 0x7FFFFFFFFFFFFFF0);
          v28 = &v22[v31];
          v32 = (uint32x4_t)vnegq_s32(vdupq_n_s32(a5));
          v33 = v30 & 0x7FFFFFFFFFFFFFF0;
          do
          {
            v34 = (unsigned __int128 *)&v22[v29 * 2];
            v35 = *(_OWORD *)&vuzp1q_s16((int16x8_t)vshlq_u32(vmovl_u16(*(uint16x4_t *)&v24[v29 + 8]), v32), (int16x8_t)vshlq_u32(vmovl_high_u16(*(uint16x8_t *)&v24[v29 + 8]), v32)) & __PAIR128__(0xFFF0FFF0FFF0FFFLL, 0xFFF0FFF0FFF0FFFLL);
            *v34 = *(_OWORD *)&vuzp1q_s16((int16x8_t)vshlq_u32(vmovl_u16(*(uint16x4_t *)&v24[v29]), v32), (int16x8_t)vshlq_u32(vmovl_high_u16(*(uint16x8_t *)&v24[v29]), v32)) & __PAIR128__(0xFFF0FFF0FFF0FFFLL, 0xFFF0FFF0FFF0FFFLL);
            v34[1] = v35;
            v29 += 16;
            v33 -= 16;
          }
          while (v33);
          if (v30 == (v30 & 0x7FFFFFFFFFFFFFF0))
            goto LABEL_22;
          v24 = (unsigned __int16 *)((char *)v24 + v31);
        }
      }
      do
      {
        v36 = *v24++;
        *(_WORD *)v28 = (v36 >> a5) & 0xFFF;
        v28 += 2;
      }
      while (v24 != v26);
    }
LABEL_22:
    v10 = (uint64_t *)&v47;
LABEL_23:
    if (a4 == 2)
    {
      simResizeVisPipeBinning(v10, (uint64_t *)a2, a6, a7);
      if (!a5)
        goto LABEL_37;
    }
    else if (a4 == 1)
    {
      simResizeVisPipeBilinear(v10, (uint64_t *)a2, a6, a7, a8, a9);
      if (!a5)
        goto LABEL_37;
    }
    else
    {
      simResizeVisPipeArea(v10, (uint64_t *)a2, a3, a6, a7, a8, a9);
      if (!a5)
        goto LABEL_37;
    }
    v37 = *(int16x8_t **)a2;
    v38 = ((*(_DWORD *)(a2 + 8) - 1) * *(_DWORD *)(a2 + 16));
    v39 = 2 * *(unsigned int *)(a2 + 12);
    v40 = (int16x8_t *)(*(_QWORD *)a2 + v39 + v38);
    if (*(int16x8_t **)a2 != v40)
    {
      v41 = v39 + v38 - 2;
      if (v41 >= 0x1E)
      {
        v42 = (v41 >> 1) + 1;
        v43 = (uint32x4_t)vdupq_n_s32(a5);
        v44 = v37 + 1;
        v45 = v42 & 0xFFFFFFFFFFFFFFF0;
        do
        {
          v46.i32[0] = *(_OWORD *)v44 & 0xFFF0FFF;
          v46.i16[2] = HIDWORD(v44->i64[0]) & 0xFFF;
          v46.i16[3] = v46.i16[2];
          v46.i32[2] = v44->i64[1] & 0xFFF0FFF;
          v46.i16[6] = v46.i16[2];
          v46.i16[7] = v46.i16[2];
          v44[-1] = vuzp1q_s16((int16x8_t)vshlq_u32(vmovl_u16((uint16x4_t)(v44[-1].i64[0] & 0xFFF0FFF0FFF0FFFLL)), v43), (int16x8_t)vshlq_u32(vmovl_high_u16((uint16x8_t)(*(_OWORD *)&v44[-1] & __PAIR128__(0xFFF0FFF0FFF0FFFLL, 0xFFF0FFF0FFF0FFFLL))), v43));
          *v44 = vuzp1q_s16((int16x8_t)vshlq_u32(vmovl_u16(*(uint16x4_t *)v46.i8), v43), (int16x8_t)vshlq_u32(vmovl_high_u16(v46), v43));
          v44 += 2;
          v45 -= 16;
        }
        while (v45);
        if (v42 == (v42 & 0xFFFFFFFFFFFFFFF0))
          goto LABEL_37;
        v37 = (int16x8_t *)((char *)v37 + 2 * (v42 & 0xFFFFFFFFFFFFFFF0));
      }
      do
      {
        v37->i16[0] = (v37->i16[0] & 0xFFF) << a5;
        v37 = (int16x8_t *)((char *)v37 + 2);
      }
      while (v37 != v40);
    }
LABEL_37:
    if (v22)
      operator delete(v22);
  }
  return 1;
}

uint64_t rtcv::simResize(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4, int a5, int a6, uint64_t a7, int a8, float a9, float a10, float a11, float a12, int a13, int a14)
{
  size_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v25;
  int v26;
  int v27;
  int v28;
  int v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;

  if (a5 != 1)
    return 0;
  *(_QWORD *)&v32 = a1;
  *((_QWORD *)&v32 + 1) = __PAIR64__(a2, a3);
  v33 = a4 | 0x500000000;
  v30 = v32;
  v31 = v33;
  v21 = a4 * a3;
  if ((_DWORD)v21)
  {
    v22 = operator new(a4 * a3);
    bzero(v22, v21);
  }
  else
  {
    v22 = 0;
  }
  *(_QWORD *)&v30 = v22;
  v25 = a7;
  v26 = a13;
  v27 = a8;
  v28 = a14;
  v29 = 5;
  if ((a6 - 1) <= 2)
  {
    v23 = simResizeVisPipe((uint64_t *)&v32, (uint64_t)&v25, (uint64_t *)&v30, dword_23591518C[a6 - 1], 2u, a9, a10, a11, a12);
    if (!v22)
      return v23;
    goto LABEL_10;
  }
  v23 = 0;
  if (v22)
LABEL_10:
    operator delete(v22);
  return v23;
}

BOOL rtcv::simResize(void *a1, unsigned int a2, unsigned int a3, unsigned int a4, int a5, int a6, int a7, void *a8, unsigned int a9, unsigned int a10, unsigned int a11)
{
  uint64_t v11;
  uint64_t v12;
  vImage_Buffer v19;
  vImage_Buffer src;
  uint64_t v21;
  uint64_t v22;

  if (a6 | a5 | a7)
    return 0;
  v21 = v11;
  v22 = v12;
  bzero(a8, a11 * a10);
  src.data = a1;
  src.height = a3;
  src.width = a2;
  src.rowBytes = a4;
  v19.data = a8;
  v19.height = a10;
  v19.width = a9;
  v19.rowBytes = a11;
  return vImageScale_ARGB8888(&src, &v19, 0, 8u) == 0;
}

BOOL rtcv::simCropResize(void *a1, unsigned int a2, unsigned int a3, unsigned int a4, int a5, int a6, int a7, void *a8, float a9, float a10, float a11, unsigned int a12, unsigned int a13, unsigned int a14)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v18;
  vImage_AffineTransform transform;
  vImage_Buffer dest;
  vImage_Buffer v21;
  uint64_t v22;
  uint64_t v23;

  if (a9 < 0.0 || (a6 | a5 | a7) != 0)
    return 0;
  v18 = 0;
  if ((float)(a2 - 1) >= a9 && a10 >= 0.0)
  {
    if ((float)(a3 - 1) < a10)
      return 0;
    v22 = v14;
    v23 = v15;
    v21.data = a1;
    v21.height = a3;
    v21.width = a2;
    v21.rowBytes = a4;
    dest.data = a8;
    dest.height = a13;
    dest.width = a12;
    dest.rowBytes = a14;
    transform.a = a11;
    transform.b = 0.0;
    transform.c = 0.0;
    transform.d = a11;
    transform.tx = -(float)(a11 * a9);
    transform.ty = (float)a13 - (float)(a11 * (float)((float)a3 - a10));
    return vImageAffineWarp_ARGB8888(&v21, &dest, 0, &transform, 0, 8u) == 0;
  }
  return v18;
}

uint64_t bmBufferResizeCHW(uint64_t result, int a2, unsigned int a3, uint64_t a4)
{
  unsigned int v4;
  unsigned int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  int v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  int v39;
  int v40;
  unsigned int v41;
  int i;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int v48;
  int v49;
  int v50;
  unsigned int v51;
  int j;
  unsigned int v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  int v61;

  if (!a2 && a3)
  {
    v4 = *(_DWORD *)(result + 12);
    v5 = *(_DWORD *)(result + 8) / a3;
    v6 = *(_DWORD *)(result + 16);
    v7 = *(_DWORD *)(a4 + 16);
    v8 = 2 * v4;
    v9 = 2 * v4 - 2;
    v10 = 2 * v4 - 1;
    v11 = v6 * (v5 - 1);
    v12 = *(_DWORD *)(a4 + 8) / a3;
    v13 = v12 - 1;
    v14 = (v7 * v13);
    if (v12 < 2)
    {
      if (v8)
      {
        for (i = 0; i != a3; ++i)
        {
          v43 = 0;
          v44 = *(_QWORD *)result + v11 + i * v5 * *(_DWORD *)(result + 16);
          v45 = *(_QWORD *)a4 + v14 + i * v12 * *(_DWORD *)(a4 + 16);
          do
          {
            v46 = v43 + 1;
            v47 = v43 >> 1;
            if ((int)v47 + 1 >= v4)
              v48 = v43 >> 1;
            else
              v48 = v47 + 1;
            v49 = ((2 * *(char *)(v44 + v47)) << ((v43 + 1) & 1))
                + (((int)((_DWORD)v43 << 31) >> 31) & (2 * *(char *)(v44 + v48)));
            v50 = v49 + 2;
            v51 = v49 + 5;
            if (v50 >= 0)
              v51 = v50;
            *(_BYTE *)(v45 + v43++) = v51 >> 2;
          }
          while (v10 != v46);
          *(_BYTE *)(v45 + v10) = *(_BYTE *)(v45 + v9);
        }
      }
      else
      {
        v56 = 0;
        do
        {
          v57 = *(_QWORD *)a4 + v14 + v56 * v12 * *(_DWORD *)(a4 + 16);
          *(_BYTE *)(v57 + 0xFFFFFFFFLL) = *(_BYTE *)(v57 + v9);
          ++v56;
          --a3;
        }
        while (a3);
      }
    }
    else if (v8)
    {
      v15 = 0;
      v60 = a4;
      v59 = *(_DWORD *)(a4 + 8) / a3;
      v58 = result;
      do
      {
        v16 = 0;
        v17 = *(_QWORD *)result + v15 * v5 * *(_DWORD *)(result + 16);
        v61 = v15;
        v18 = *(_QWORD *)a4 + v15 * v12 * *(_DWORD *)(a4 + 16);
        v19 = 1;
        do
        {
          v20 = 0;
          v21 = v18 + (v7 * v16);
          v22 = v16 >> 1;
          if ((v16 >> 1) + 1 >= v5)
            v23 = v16 >> 1;
          else
            v23 = v22 + 1;
          v24 = v17 + v22 * v6;
          v25 = v17 + v23 * v6;
          if ((v16 & 1) != 0)
            v26 = 1;
          else
            v26 = 2;
          do
          {
            v27 = v20 + 1;
            v28 = v20 >> 1;
            if ((int)v28 + 1 >= v4)
              v29 = v28;
            else
              v29 = (v28 + 1);
            v30 = (*(char *)(v24 + v28) << (((v20 + 1) & 1) + (v19 & 1)))
                + (((int)((_DWORD)v20 << 31) >> 31) & v26) * *(char *)(v24 + v29)
                + ((2 - v26) << ((v20 + 1) & 1)) * *(char *)(v25 + v28)
                + (((int)((_DWORD)v20 << 31) >> 31) & (2 - v26)) * *(char *)(v25 + v29);
            v31 = v30 + 2;
            v32 = v30 + 5;
            if (v31 >= 0)
              v32 = v31;
            *(_BYTE *)(v21 + v20++) = v32 >> 2;
          }
          while (v10 != v27);
          ++v16;
          *(_BYTE *)(v21 + v10) = *(_BYTE *)(v21 + v9);
          ++v19;
        }
        while (v16 != v13);
        v33 = 0;
        v34 = v17 + v6 * (v5 - 1);
        v35 = v18 + (v7 * v13);
        do
        {
          v36 = v33 + 1;
          v37 = v33 >> 1;
          if ((int)v37 + 1 >= v4)
            v38 = v33 >> 1;
          else
            v38 = v37 + 1;
          v39 = ((2 * *(char *)(v34 + v37)) << ((v33 + 1) & 1))
              + (((int)((_DWORD)v33 << 31) >> 31) & (2 * *(char *)(v34 + v38)));
          v40 = v39 + 2;
          v41 = v39 + 5;
          if (v40 >= 0)
            v41 = v40;
          *(_BYTE *)(v35 + v33++) = v41 >> 2;
        }
        while (v10 != v36);
        *(_BYTE *)(v35 + v10) = *(_BYTE *)(v35 + v9);
        v15 = v61 + 1;
        v12 = v59;
        a4 = v60;
        result = v58;
      }
      while (v61 + 1 != a3);
    }
    else
    {
      for (j = 0; j != a3; ++j)
      {
        v53 = 0;
        v54 = *(_QWORD *)a4 + j * v12 * *(_DWORD *)(a4 + 16);
        v55 = v12 - 1;
        do
        {
          result = v54 + v53;
          *(_BYTE *)(result + 0xFFFFFFFFLL) = *(_BYTE *)(result + v9);
          v53 += v7;
          --v55;
        }
        while (v55);
        *(_BYTE *)(v54 + v14 + 0xFFFFFFFFLL) = *(_BYTE *)(v54 + v14 + v9);
      }
    }
  }
  return result;
}

void bmBufferPartialResizeCHW(uint64_t a1, int a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned int a6, unsigned int a7, _DWORD *a8)
{
  unsigned int v8;
  _DWORD *v9;
  int v10;
  int v11;
  size_t v12;
  int v14;
  signed int v15;
  signed int v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  char *v22;
  float v23;
  float v24;
  uint64_t v25;
  float v26;
  signed int v27;
  float v28;
  float v29;
  float v30;
  int v31;
  signed int v32;
  uint64_t v33;
  uint64_t v34;
  int32x2_t v35;
  int32x2_t v36;
  uint64_t v37;
  uint64_t v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  uint64_t v46;
  float v47;
  signed int v48;
  float v49;
  float v50;
  float v51;
  unsigned int v52;
  unsigned int v53;
  uint64_t v54;
  uint64_t v55;
  int32x2_t v56;
  int8x8_t v57;
  uint64_t v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float v69;
  int v70;
  int v71;
  uint64_t v72;
  int32x2_t v73;
  int32x2_t v74;
  int32x2_t v75;
  float v76;
  float v77;
  int v78;
  int v79;
  int v82;
  size_t v83;

  if (a2 == 1)
  {
    v8 = a3;
    if (a3)
    {
      v9 = a8;
      v10 = a8[2] / a3;
      v11 = a8[4];
      v12 = (v11 * v10);
      v83 = v12;
      if (a4 >= a5)
      {
        v70 = 0;
        do
        {
          bzero((void *)(*(_QWORD *)v9 + (v70 * v10 * v9[4])), v83);
          ++v70;
          --v8;
        }
        while (v8);
      }
      else if (a6 >= a7)
      {
        v71 = 0;
        do
        {
          bzero((void *)(*(_QWORD *)v9 + (v71 * v10 * v9[4])), v83);
          ++v71;
          --v8;
        }
        while (v8);
      }
      else
      {
        v14 = 0;
        v78 = *(_DWORD *)(a1 + 8) / a3;
        v15 = v78 - 1;
        v16 = *(_DWORD *)(a1 + 12) - 1;
        v17 = *(_DWORD *)(a1 + 16);
        v18 = a6;
        v72 = a4;
        v19 = a5;
        v79 = a8[2] / a3;
        v77 = (float)(v10 - 1);
        v76 = (float)(a8[3] - 1);
        v75 = vdup_n_s32(v78 - 1);
        v73 = vdup_n_s32(v16);
        v74 = vdup_n_s32(v17);
        do
        {
          v20 = v10;
          v21 = *(_QWORD *)a1 + (v14 * v78 * *(_DWORD *)(a1 + 16));
          v82 = v14;
          v22 = (char *)(*(_QWORD *)v9 + (v14 * v20 * v9[4]));
          bzero(v22, v12);
          v23 = 2.0;
          v24 = -1.0;
          v25 = v72;
          do
          {
            v26 = (float)((float)v25 / v77) * (float)(v78 - 1);
            v27 = vcvtms_s32_f32(v26);
            v28 = v26 - (float)(int)floorf(v26);
            if (v28 <= 1.0)
              v29 = v28;
            else
              v29 = 1.0;
            if (v28 >= 0.0)
              v30 = v29;
            else
              v30 = 0.0;
            v31 = v27 - 1;
            if (v15 < v27 - 1)
              v31 = v78 - 1;
            if (v15 >= v27)
              v32 = v27;
            else
              v32 = v78 - 1;
            if (v27 <= 0)
              v31 = 0;
            v33 = v21 + v31 * v17;
            if (v27 < 0)
              v32 = 0;
            v34 = v21 + v32 * v17;
            v35 = vdup_n_s32(v27);
            v36 = vmul_s32((int32x2_t)vbic_s8((int8x8_t)vmin_s32(v75, vadd_s32(v35, (int32x2_t)0x200000001)), (int8x8_t)vcgt_s32((int32x2_t)0xFFFFFFFEFFFFFFFFLL, v35)), v74);
            v37 = v21 + v36.u32[0];
            v38 = v21 + v36.u32[1];
            *(float *)v36.i32 = vabds_f32(v24, v30);
            v39 = (float)((float)((float)(*(float *)v36.i32 * (float)(*(float *)v36.i32 * 3.75))
                                + (float)((float)(*(float *)v36.i32 * (float)(*(float *)v36.i32 * -0.75))
                                        * *(float *)v36.i32))
                        + (float)(*(float *)v36.i32 * -6.0))
                + 3.0;
            v40 = fabsf(v30);
            v41 = (float)((float)(v40 * (float)(v40 * -2.25)) + (float)((float)(v40 * (float)(v40 * 1.25)) * v40)) + 1.0;
            v42 = vabds_f32(1.0, v30);
            v43 = (float)((float)(v42 * (float)(v42 * -2.25)) + (float)((float)(v42 * (float)(v42 * 1.25)) * v42)) + 1.0;
            v44 = vabds_f32(v23, v30);
            v45 = (float)((float)((float)(v44 * (float)(v44 * 3.75)) + (float)((float)(v44 * (float)(v44 * -0.75)) * v44))
                        + (float)(v44 * -6.0))
                + 3.0;
            v46 = v18;
            do
            {
              v47 = (float)((float)v46 / v76) * (float)v16;
              v48 = vcvtms_s32_f32(v47);
              v49 = v47 - (float)(int)floorf(v47);
              if (v49 <= 1.0)
                v50 = v49;
              else
                v50 = 1.0;
              if (v49 >= 0.0)
                v51 = v50;
              else
                v51 = 0.0;
              v52 = v48 - 1;
              if (v16 < v48 - 1)
                v52 = v16;
              if (v16 >= v48)
                v53 = v48;
              else
                v53 = v16;
              if (v48 <= 0)
                v52 = 0;
              if (v48 < 0)
                v53 = 0;
              v54 = 4 * v52;
              v55 = 4 * v53;
              v56 = vdup_n_s32(v48);
              v57 = vbic_s8((int8x8_t)vmin_s32(v73, vadd_s32(v56, (int32x2_t)0x200000001)), (int8x8_t)vcgt_s32((int32x2_t)0xFFFFFFFEFFFFFFFFLL, v56));
              v58 = 4 * v57.u32[0];
              v59 = vabds_f32(-1.0, v51);
              v60 = (float)((float)((float)(v59 * (float)(v59 * 3.75))
                                  + (float)((float)(v59 * (float)(v59 * -0.75)) * v59))
                          + (float)(v59 * -6.0))
                  + 3.0;
              v61 = fabsf(v51);
              v62 = (float)((float)(v61 * (float)(v61 * -2.25)) + (float)((float)(v61 * (float)(v61 * 1.25)) * v61))
                  + 1.0;
              v63 = vabds_f32(1.0, v51);
              v64 = (float)((float)(v63 * (float)(v63 * -2.25)) + (float)((float)(v63 * (float)(v63 * 1.25)) * v63))
                  + 1.0;
              v65 = vabds_f32(v23, v51);
              v66 = (float)((float)((float)(v65 * (float)(v65 * 3.75))
                                  + (float)((float)(v65 * (float)(v65 * -0.75)) * v65))
                          + (float)(v65 * -6.0))
                  + 3.0;
              v67 = (float)((float)((float)(v62 * *(float *)(v33 + v55)) + (float)(v60 * *(float *)(v33 + v54)))
                          + (float)(v64 * *(float *)(v33 + v58)))
                  + (float)(v66 * *(float *)(v33 + 4 * v57.u32[1]));
              v68 = (float)((float)((float)(v62 * *(float *)(v34 + v55)) + (float)(v60 * *(float *)(v34 + v54)))
                          + (float)(v64 * *(float *)(v34 + v58)))
                  + (float)(v66 * *(float *)(v34 + 4 * v57.u32[1]));
              *(float *)v57.i32 = (float)((float)((float)(v62 * *(float *)(v37 + v55))
                                                + (float)(v60 * *(float *)(v37 + v54)))
                                        + (float)(v64 * *(float *)(v37 + v58)))
                                + (float)(v66 * *(float *)(v37 + 4 * v57.u32[1]));
              v69 = (float)(v62 * *(float *)(v38 + v55)) + (float)(v60 * *(float *)(v38 + v54));
              v24 = -1.0;
              v23 = 2.0;
              *(float *)&v22[4 * v46++ + (v11 * v25)] = (float)((float)((float)(v41 * v68)
                                                                                    + (float)(v39 * v67))
                                                                            + (float)(v43 * *(float *)v57.i32))
                                                                    + (float)(v45
                                                                            * (float)((float)(v69
                                                                                            + (float)(v64 * *(float *)(v38 + v58)))
                                                                                    + (float)(v66
                                                                                            * *(float *)(v38 + 4 * v57.u32[1]))));
            }
            while (a7 != (_DWORD)v46);
            ++v25;
          }
          while (v25 != v19);
          v14 = v82 + 1;
          v9 = a8;
          v10 = v79;
          v12 = v83;
        }
        while (v82 + 1 != v8);
      }
    }
  }
}

uint64_t bmBufferResizeCoordConvert(uint64_t result, unsigned int a2, unsigned int a3, unsigned int a4, int a5, float *a6, float *a7, float a8, float a9)
{
  float v9;
  float v10;

  if (!a5)
  {
    *a6 = (float)(a8 / (float)result) * (float)a3;
    v10 = (float)(a9 / (float)a2) * (float)a4;
    goto LABEL_7;
  }
  v9 = (float)a3 / (float)result;
  if (v9 >= (float)((float)a4 / (float)a2))
    v9 = (float)a4 / (float)a2;
  *a6 = v9 * a8;
  *a7 = v9 * a9;
  if (a5 == 2)
  {
    *a6 = (float)((float)((float)a3 - (float)(v9 * (float)result)) * 0.5) + *a6;
    v10 = (float)((float)((float)a4 - (float)(v9 * (float)a2)) * 0.5) + *a7;
LABEL_7:
    *a7 = v10;
  }
  return result;
}

float bmBufferResizeCoordConvertReversed(unsigned int a1, unsigned int a2, unsigned int a3, unsigned int a4, int a5, float *a6, float *a7, float a8, float a9)
{
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float result;

  v9 = (float)a3;
  if (a5)
  {
    v10 = v9 / (float)a1;
    if (v10 >= (float)((float)a4 / (float)a2))
      v10 = (float)a4 / (float)a2;
    v11 = (float)(v9 - (float)(v10 * (float)a1)) * 0.5;
    v12 = (float)((float)a4 - (float)(v10 * (float)a2)) * 0.5;
    if (a5 != 2)
    {
      v11 = 0.0;
      v12 = 0.0;
    }
    v13 = 1.0 / v10;
    *a6 = v13 * (float)(a8 - v11);
    result = v13 * (float)(a9 - v12);
    *a7 = result;
  }
  else
  {
    *a6 = (float)(a8 / v9) * (float)a1;
    result = (float)(a9 / (float)a4) * (float)a2;
    *a7 = result;
  }
  return result;
}

void BmMixedBufSize::BmMixedBufSize(BmMixedBufSize *this)
{
  *(_QWORD *)this = 0;
}

{
  *(_QWORD *)this = 0;
}

float bmMinimum(float result, float a2)
{
  if (result >= a2)
    return a2;
  return result;
}

uint64_t bmMinimum(uint64_t result, unsigned int a2)
{
  if (result >= a2)
    return a2;
  else
    return result;
}

uint64_t bmMinimum(uint64_t result, int a2)
{
  if ((int)result >= a2)
    return a2;
  else
    return result;
}

float bmMaximum(float result, float a2)
{
  if (result < a2)
    return a2;
  return result;
}

uint64_t bmMaximum(uint64_t result, unsigned int a2)
{
  if (result <= a2)
    return a2;
  else
    return result;
}

uint64_t bmMaximum(uint64_t result, int a2)
{
  if ((int)result <= a2)
    return a2;
  else
    return result;
}

uint64_t bmClamp(signed int a1, unsigned int a2, signed int a3)
{
  unsigned int v3;

  if (a3 >= a1)
    v3 = a1;
  else
    v3 = a3;
  if (a1 >= (int)a2)
    return v3;
  else
    return a2;
}

float bmClamp(float a1, float a2, float a3)
{
  if (a3 >= a1)
    a3 = a1;
  if (a1 >= a2)
    return a3;
  else
    return a2;
}

float bmSoftmax2(float a1, float a2)
{
  float v3;
  float v4;
  float v5;

  if (a1 >= a2)
    v3 = a1;
  else
    v3 = a2;
  v4 = expf(a1 - v3);
  v5 = expf(a2 - v3);
  return v5 / (float)(v4 + v5);
}

void bmSoftmax(float32x4_t *a1, float *a2, unsigned int a3, __n128 a4)
{
  float *v5;
  float *v6;
  float v7;
  float v8;
  uint64_t v9;
  float32x4_t v11;
  float *v12;
  float32x4_t *v13;
  uint64_t v14;
  float32x4_t v15;
  uint64_t v16;
  uint64_t v17;
  float *v18;
  float *v19;
  float v20;
  uint64_t v21;
  float *v22;
  float *v23;
  uint64_t v24;
  float v25;
  float v26;
  int v27;
  float v28;
  float v29;
  __n128 v30;
  uint64_t v31;
  float32x2_t v32;
  float *v33;
  uint64_t v34;
  float32x2_t v35;
  int v36;
  float v37;
  float v38;
  float v39;
  __n128 v40;
  float v41;

  v5 = a2;
  a4.n128_u32[0] = a1->i32[0];
  if (a3 >= 2)
  {
    v6 = &a1->f32[1];
    do
    {
      v7 = *v6++;
      v8 = v7;
      if (a4.n128_f32[0] < v7)
        a4.n128_f32[0] = v8;
    }
    while (v6 < &a1->f32[a3]);
  }
  if (!a3)
    return;
  v9 = 0;
  if (a3 < 8)
    goto LABEL_12;
  if ((unint64_t)((char *)a2 - (char *)a1) <= 0x1F)
    goto LABEL_12;
  v9 = a3 & 0xFFFFFFF8;
  v11 = (float32x4_t)vdupq_lane_s32((int32x2_t)a4.n128_u64[0], 0);
  v12 = a2 + 4;
  v13 = a1 + 1;
  v14 = v9;
  do
  {
    v15 = vsubq_f32(*v13, v11);
    *((float32x4_t *)v12 - 1) = vsubq_f32(v13[-1], v11);
    *(float32x4_t *)v12 = v15;
    v12 += 8;
    v13 += 2;
    v14 -= 8;
  }
  while (v14);
  if (v9 != a3)
  {
LABEL_12:
    v16 = a3 - v9;
    v17 = v9;
    v18 = &a2[v9];
    v19 = &a1->f32[v17];
    do
    {
      v20 = *v19++;
      *v18++ = v20 - a4.n128_f32[0];
      --v16;
    }
    while (v16);
  }
  if (a3 == 1)
  {
    LODWORD(v21) = 0;
    a4.n128_u32[0] = 0;
    v22 = a2;
  }
  else
  {
    v21 = a3 & 0xFFFFFFFE;
    v23 = a2 + 1;
    a4.n128_u32[0] = 0;
    v24 = v21;
    do
    {
      v39 = a4.n128_f32[0];
      v25 = *v23;
      v26 = expf(*(v23 - 1));
      a4.n128_f32[0] = (float)(v39 + v26) + expf(v25);
      v23 += 2;
      v24 -= 2;
    }
    while (v24);
    if (v21 == a3)
      goto LABEL_22;
    v22 = &v5[a3 & 0xFFFFFFFE];
  }
  v27 = a3 - v21;
  do
  {
    v40 = a4;
    v28 = *v22++;
    v29 = expf(v28);
    v30 = v40;
    v30.n128_f32[0] = v40.n128_f32[0] + v29;
    a4 = v30;
    --v27;
  }
  while (v27);
LABEL_22:
  v41 = a4.n128_f32[0];
  if (a3 == 1)
  {
    LODWORD(v31) = 0;
    goto LABEL_28;
  }
  v31 = a3 & 0xFFFFFFFE;
  v32 = (float32x2_t)vdup_lane_s32((int32x2_t)a4.n128_u64[0], 0);
  v33 = v5;
  v34 = v31;
  do
  {
    LODWORD(v37) = *(_QWORD *)v33;
    v38 = expf(COERCE_FLOAT(HIDWORD(*(_QWORD *)v33)));
    v35.f32[0] = expf(v37);
    v35.f32[1] = v38;
    *(float32x2_t *)v33 = vdiv_f32(v35, v32);
    v33 += 2;
    v34 -= 2;
  }
  while (v34);
  if (v31 != a3)
  {
    v5 += a3 & 0xFFFFFFFE;
LABEL_28:
    v36 = a3 - v31;
    do
    {
      *v5 = expf(*v5) / v41;
      ++v5;
      --v36;
    }
    while (v36);
  }
}

void bmSoftmax(float32x4_t *a1, float *a2, unsigned int a3, unsigned int a4, double a5)
{
  unsigned int v5;
  float *v6;
  unint64_t v7;
  const float *v8;
  uint64_t v9;
  float32x4_t v10;
  float32x4_t *v11;
  float *v12;
  uint64_t v13;
  float32x4_t v14;
  uint64_t v15;
  int v16;
  float v17;
  float *v18;
  unsigned int v19;

  v5 = a3;
  v6 = a2;
  LODWORD(a5) = a1->i32[0];
  v7 = 4 * a4;
  if (a4 * a3 > a4)
  {
    v8 = &a1->f32[v7 / 4];
    do
    {
      if (*(float *)&a5 < *v8)
        *(float *)&a5 = *v8;
      v8 = (const float *)((char *)v8 + v7);
    }
    while (v8 < &a1->f32[a4 * a3]);
  }
  if (a3)
  {
    v9 = 0;
    if (a3 < 8)
      goto LABEL_13;
    if (a4 != 1)
      goto LABEL_13;
    if ((unint64_t)((char *)a2 - (char *)a1) < 0x20)
      goto LABEL_13;
    v9 = a3 & 0xFFFFFFF8;
    v10 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a5, 0);
    v11 = a1 + 1;
    v12 = a2 + 4;
    v13 = v9;
    do
    {
      v14 = vsubq_f32(*v11, v10);
      *((float32x4_t *)v12 - 1) = vsubq_f32(v11[-1], v10);
      *(float32x4_t *)v12 = v14;
      v11 += 2;
      v12 += 8;
      v13 -= 8;
    }
    while (v13);
    if (v9 != a3)
    {
LABEL_13:
      v15 = a3 - v9;
      v16 = a4 * v9;
      do
      {
        a2[v16] = a1->f32[v16] - *(float *)&a5;
        v16 += a4;
        --v15;
      }
      while (v15);
    }
    v17 = 0.0;
    v18 = a2;
    v19 = a3;
    do
    {
      v17 = v17 + expf(*v18);
      v18 = (float *)((char *)v18 + v7);
      --v19;
    }
    while (v19);
    do
    {
      *v6 = expf(*v6) / v17;
      v6 = (float *)((char *)v6 + v7);
      --v5;
    }
    while (v5);
  }
}

char *bmArgMax(char *result, unsigned int a2, int a3)
{
  char *v3;
  char v4;
  unsigned int v5;
  int v6;

  if (a2 < 2)
    return 0;
  v3 = result;
  LODWORD(result) = 0;
  v4 = *v3;
  v5 = 1;
  v6 = a3;
  do
  {
    if (v3[v6] <= v4)
    {
      result = (char *)result;
    }
    else
    {
      v4 = v3[v6];
      result = (char *)v5;
    }
    ++v5;
    v6 += a3;
  }
  while (a2 != v5);
  return result;
}

unsigned int bmCeil(float a1)
{
  return vcvtps_s32_f32(a1);
}

uint64_t bmQsort(uint64_t result, unint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t, _QWORD *);
  _QWORD v8[6];

  if (a2 >= 2 && a3)
  {
    v8[4] = v4;
    v8[5] = v5;
    v6 = a3 >> 2;
    if ((a3 & 3) != 0)
      v6 = a3;
    v8[0] = a3;
    v8[1] = v6;
    if ((a3 & 3) != 0)
      v7 = sub_2358EFE6C;
    else
      v7 = sub_2358EFDB4;
    v8[2] = a4;
    v8[3] = v7;
    return sub_2358EFF74(result, a2, (uint64_t)v8);
  }
  return result;
}

uint64_t sub_2358EFDB4(uint64_t result, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  unint64_t v5;
  _DWORD *v6;
  _DWORD *v7;
  uint64_t v8;
  uint64_t v10;
  __int128 *v11;
  __int128 *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  int v17;

  v4 = a4[1];
  if ((_DWORD)v4)
  {
    v5 = result + *a4 * a3;
    v6 = (_DWORD *)(result + *a4 * a2);
    if (a4[1] < 8uLL)
    {
      v7 = (_DWORD *)(result + *a4 * a3);
      goto LABEL_13;
    }
    v8 = ((4 * v4 + 0x3FFFFFFFCLL) & 0x3FFFFFFFCLL) + 4;
    if (v5 + v8 > (unint64_t)v6 && (unint64_t)v6 + v8 > v5)
    {
      v7 = (_DWORD *)(result + *a4 * a3);
      do
      {
LABEL_13:
        v17 = *v6;
        *v6++ = *v7;
        *v7++ = v17;
        LODWORD(v4) = v4 - 1;
      }
      while ((_DWORD)v4);
      return result;
    }
    v10 = a4[1] - (a4[1] & 7);
    v7 = (_DWORD *)(v5 + 4 * v10);
    v11 = (__int128 *)(v6 + 4);
    v12 = (__int128 *)(v5 + 16);
    v13 = v10;
    do
    {
      v14 = *(v11 - 1);
      v15 = *v11;
      v16 = *v12;
      *(v11 - 1) = *(v12 - 1);
      *v11 = v16;
      *(v12 - 1) = v14;
      *v12 = v15;
      v11 += 2;
      v12 += 2;
      v13 -= 8;
    }
    while (v13);
    if ((v4 & 7) != 0)
    {
      LODWORD(v4) = v4 & 7;
      v6 += v10;
      goto LABEL_13;
    }
  }
  return result;
}

uint64_t sub_2358EFE6C(uint64_t result, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  unint64_t v5;
  _BYTE *v6;
  unint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  unint64_t v11;
  __int128 *v12;
  __int128 *v13;
  unint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v4 = a4[1];
  if ((_DWORD)v4)
  {
    v5 = result + *a4 * a3;
    v6 = (_BYTE *)(result + *a4 * a2);
    v7 = a4[1];
    if (v7 < 8)
    {
      v8 = (_BYTE *)(result + *a4 * a3);
      goto LABEL_20;
    }
    v9 = (v4 - 1) + 1;
    if (v5 + v9 > (unint64_t)v6 && (unint64_t)&v6[v9] > v5)
    {
      v8 = (_BYTE *)(result + *a4 * a3);
      goto LABEL_20;
    }
    if (v7 >= 0x20)
    {
      v11 = v7 - (a4[1] & 0x1FLL);
      v12 = (__int128 *)(v6 + 16);
      v13 = (__int128 *)(v5 + 16);
      v14 = v11;
      do
      {
        v15 = *(v12 - 1);
        v16 = *v12;
        v17 = *v13;
        *(v12 - 1) = *(v13 - 1);
        *v12 = v17;
        *(v13 - 1) = v15;
        *v13 = v16;
        v12 += 2;
        v13 += 2;
        v14 -= 32;
      }
      while (v14);
      if ((v4 & 0x1F) == 0)
        return result;
      if ((v4 & 0x1Fu) < 8uLL)
      {
        v6 += v11;
        v8 = (_BYTE *)(v5 + v11);
        LODWORD(v4) = v4 - v11;
        goto LABEL_20;
      }
    }
    else
    {
      v11 = 0;
    }
    v18 = v7 - (v4 & 7);
    v8 = (_BYTE *)(v5 + v18);
    v19 = v11 + (v4 & 7) - v7;
    v20 = (uint64_t *)&v6[v11];
    v21 = (uint64_t *)(v5 + v11);
    do
    {
      v22 = *v20;
      *v20++ = *v21;
      *v21++ = v22;
      v19 += 8;
    }
    while (v19);
    if ((v4 & 7) != 0)
    {
      LODWORD(v4) = v4 - v18;
      v6 += v18;
      do
      {
LABEL_20:
        v23 = *v6;
        *v6++ = *v8;
        *v8++ = v23;
        LODWORD(v4) = v4 - 1;
      }
      while ((_DWORD)v4);
    }
  }
  return result;
}

uint64_t sub_2358EFF74(uint64_t result, unint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a2;
  v5 = result;
  if (a2 >= 7)
  {
    do
    {
      v7 = 0;
      v8 = 0;
      v9 = v4 - 1;
      do
      {
        if ((*(int (**)(unint64_t, uint64_t))(a3 + 16))(v5 + *(_QWORD *)a3 * v9, v5 + *(_QWORD *)a3 * v8) >= 1)(*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a3 + 24))(v5, v7++, v8, a3);
        ++v8;
      }
      while (v9 != v8);
      (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(a3 + 24))(v5, v4 - 1, v7, a3);
      result = sub_2358EFF74(v5, v7, a3);
      v5 += *(_QWORD *)a3 + *(_QWORD *)a3 * v7;
      v4 += ~v7;
    }
    while (v4 > 6);
  }
  if (v4 >= 2)
  {
    for (i = 1; i != v4; ++i)
    {
      v10 = i;
      do
      {
        v11 = v10 - 1;
        result = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(v5 + *(_QWORD *)a3 * (v10 - 1), v5 + *(_QWORD *)a3 * v10);
        if ((int)result < 1)
          break;
        result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a3 + 24))(v5, v10 - 1, v10, a3);
        --v10;
      }
      while (v11);
    }
  }
  return result;
}

uint64_t bmHeapsort(uint64_t a1, unint64_t a2, unint64_t a3, int (*a4)(uint64_t, uint64_t))
{
  unint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t, _QWORD *);
  int v8;
  unint64_t v9;
  unint64_t v10;
  BOOL v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD v26[2];
  int (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t, uint64_t, uint64_t, _QWORD *);

  if (!a3)
    return 0xFFFFFFFFLL;
  v6 = a3 >> 2;
  if ((a3 & 3) != 0)
    v6 = a3;
  v26[0] = a3;
  v26[1] = v6;
  if ((a3 & 3) != 0)
    v7 = (void (*)(uint64_t, uint64_t, uint64_t, _QWORD *))sub_2358EFE6C;
  else
    v7 = (void (*)(uint64_t, uint64_t, uint64_t, _QWORD *))sub_2358EFDB4;
  v27 = a4;
  v28 = v7;
  if (a2 < 7)
  {
    if (a2 >= 2)
    {
      if (a4(a1, a1 + a3) >= 1)
        v7(a1, 0, 1, v26);
      if (a2 != 2)
      {
        v17 = 2 - a2;
        v18 = -3;
        do
        {
          if (v27(a1 + v26[0] * (v18 + 4), a1 + v26[0] * (v18 + 5)) >= 1)
          {
            v28(a1, v18 + 4, v18 + 5, v26);
            if (v27(a1 + v26[0] * (v18 + 3), a1 + v26[0] * (v18 + 4)) >= 1)
            {
              v28(a1, v18 + 3, v18 + 4, v26);
              if (v18 != -3 && v27(a1 + v26[0] * (v18 + 2), a1 + v26[0] * (v18 + 3)) >= 1)
              {
                v28(a1, v18 + 2, v18 + 3, v26);
                if (v18 != -2 && v27(a1 + v26[0] * (v18 + 1), a1 + v26[0] * (v18 + 2)) >= 1)
                {
                  v28(a1, v18 + 1, v18 + 2, v26);
                  if (v18 != -1 && v27(a1 + v26[0] * v18, a1 + v26[0] * (v18 + 1)) >= 1)
                    v28(a1, v18, v18 + 1, v26);
                }
              }
            }
          }
          ++v18;
        }
        while (v17 + v18 != -3);
      }
    }
  }
  else
  {
    v8 = a2 - 1;
    if ((int)a2 >= 1)
    {
      if ((int)a2 >= 2)
        v8 = a2 - 2;
      v9 = (v8 >> 1);
      v10 = a2 - 1;
      do
      {
        v12 = (2 * v9) | 1;
        if (v12 <= v10)
        {
          v13 = 2 * v9;
          v14 = v9;
          do
          {
            if (v27(a1 + v26[0] * v12, a1 + v26[0] * v14) <= 0)
              v15 = v14;
            else
              v15 = v12;
            if (v13 + 2 <= v10 && v27(a1 + v26[0] * (v13 + 2), a1 + v26[0] * v15) > 0)
              v15 = v13 + 2;
            if (v15 == v14)
              break;
            v28(a1, v14, v15, v26);
            v13 = 2 * v15;
            v12 = (2 * v15) | 1;
            v14 = v15;
          }
          while (v12 <= v10);
        }
        v11 = (int)v9-- <= 0;
      }
      while (!v11);
      if ((int)a2 >= 2)
      {
        v19 = a2;
        do
        {
          v28(a1, 0, (v19 - 1), v26);
          v20 = (v19 - 2);
          if ((_DWORD)v19 != 2)
          {
            v21 = 0;
            v22 = 0;
            v23 = 1;
            do
            {
              if (v27(a1 + v26[0] * v23, a1 + v26[0] * v22) <= 0)
                v24 = v22;
              else
                v24 = v23;
              v25 = v21 + 2;
              if (v25 <= v20 && v27(a1 + v26[0] * v25, a1 + v26[0] * v24) > 0)
                v24 = v25;
              if (v24 == v22)
                break;
              v28(a1, v22, v24, v26);
              v21 = 2 * v24;
              v23 = (2 * v24) | 1;
              v22 = v24;
            }
            while (v23 <= v20);
          }
          v11 = v19-- <= 2;
        }
        while (!v11);
      }
    }
  }
  return 0;
}

uint64_t isort_internal(uint64_t result, unint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;

  if (a2 >= 2)
  {
    v5 = result;
    for (i = 1; i != a2; ++i)
    {
      v7 = i;
      do
      {
        v8 = v7 - 1;
        result = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(v5 + *(_QWORD *)a3 * (v7 - 1), v5 + *(_QWORD *)a3 * v7);
        if ((int)result < 1)
          break;
        result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a3 + 24))(v5, v7 - 1, v7, a3);
        --v7;
      }
      while (v8);
    }
  }
  return result;
}

uint64_t bmMunkresTempBytes(int a1)
{
  return a1 * a1 + 12 * a1 + 4 * a1 * a1 + ((4 * a1) | 3) + 2 * (((4 * a1) | 3u) + a1) + 9;
}

void bmMunkres(float *a1, unsigned int a2, unsigned __int8 *a3, unsigned int a4, unsigned int *a5, unsigned int a6, unsigned int *a7, double a8)
{
  unsigned __int8 *v10;
  size_t v12;
  int v13;
  uint64_t v14;
  unsigned __int8 *v15;
  unsigned int v16;
  uint64_t v17;
  unsigned __int8 *v18;
  unint64_t v19;
  unsigned int v20;
  int v21;
  uint64_t i;
  unsigned int v23;
  float *v24;
  float v25;
  uint64_t v26;
  unsigned int v27;
  uint64_t v28;
  unsigned int v29;
  uint64_t v30;
  float32x4_t *v31;
  float *v32;
  uint64_t v33;
  float v34;
  float v35;
  uint64_t v36;
  float32x4_t v37;
  uint64_t v38;
  float32x4_t v39;
  uint64_t v40;
  float *v41;
  size_t v42;
  uint64_t v43;
  int32x4_t v44;
  unint64_t v45;
  unint64_t v46;
  unsigned __int8 *v47;
  int8x16_t *v48;
  unsigned __int8 *v49;
  uint64_t v50;
  int8x16_t *v51;
  unsigned __int8 *v52;
  BOOL v53;
  _BOOL4 v54;
  _BOOL4 v55;
  BOOL v57;
  unsigned int *v58;
  uint64_t v59;
  uint64_t v60;
  unsigned __int8 *v61;
  float *v62;
  uint64_t v63;
  size_t v64;
  unsigned __int8 *v65;
  int8x16_t v66;
  int8x16_t v67;
  size_t v68;
  unsigned int *v69;
  unsigned int v70;
  int v71;
  uint64_t v72;
  unsigned __int8 *v73;
  _DWORD *v74;
  size_t v75;
  float *v76;
  uint64_t v77;
  char v78;
  uint64_t v79;
  unsigned __int8 *v80;
  int v81;
  uint64_t v82;
  unsigned __int8 *v83;
  uint64_t v84;
  size_t v85;
  _DWORD *v86;
  uint64_t v87;
  char v88;
  int v89;
  uint64_t v90;
  unsigned __int8 *v91;
  uint64_t v92;
  uint64_t v93;
  unsigned __int8 *v94;
  uint64_t v95;
  char v96;
  uint64_t v97;
  unsigned __int8 *v98;
  char v99;
  int v100;
  uint64_t v101;
  unsigned __int8 *v102;
  uint64_t v103;
  uint64_t v104;
  int8x8_t v105;
  uint64_t v106;
  int v107;
  unsigned __int8 *v108;
  unsigned __int8 *v109;
  unsigned int *v110;
  size_t v111;
  int v112;
  int v113;
  int v114;
  uint64_t v116;
  BOOL v117;
  _BOOL4 v118;
  uint64_t v119;
  unsigned int v120;
  size_t v121;
  unsigned __int8 *v122;
  unsigned __int8 *v123;
  uint64_t v125;
  int32x4_t v126;
  int8x16_t *v127;
  int8x16_t *v128;
  int32x4_t v129;
  uint64_t v130;
  int32x4_t v131;
  int32x4_t v132;
  int32x4_t v133;
  int32x4_t v134;
  int32x4_t v135;
  int32x4_t v136;
  int8x16_t v137;
  int8x16_t v138;
  uint16x8_t v139;
  uint16x8_t v140;
  uint16x8_t v141;
  uint16x8_t v142;
  int32x4_t v143;
  int32x4_t v144;
  int8x8_t v145;
  uint16x8_t v146;
  size_t v147;
  BOOL *v148;
  unsigned __int8 *v149;
  int v150;
  uint64_t v151;
  uint64_t v152;
  int32x4_t v153;
  int32x4_t v154;
  int8x16_t *v155;
  _OWORD *v156;
  uint64_t v157;
  int32x4_t v158;
  int32x4_t v159;
  int32x4_t v160;
  int32x4_t v161;
  int32x4_t v162;
  int32x4_t v163;
  int8x16_t v164;
  int8x16_t v165;
  uint8x16_t v166;
  uint16x8_t v167;
  uint16x8_t v168;
  uint8x16_t v169;
  uint16x8_t v170;
  uint16x8_t v171;
  int32x4_t v172;
  int32x4_t v173;
  int8x8_t v174;
  uint16x8_t v175;
  size_t v176;
  unsigned __int8 *v177;
  unsigned __int8 *v178;
  int v179;
  uint64_t v180;
  uint64_t v181;
  unsigned int *v182;
  int8x8_t v183;
  unsigned int v184;
  uint64_t v185;
  float v186;
  float *v187;
  unsigned __int8 *v188;
  size_t v189;
  int v190;
  unsigned int v192;
  uint64_t v193;
  float *v194;
  unsigned __int8 *v195;
  uint64_t v196;
  float v197;
  size_t v199;
  unsigned int *v200;
  unsigned __int8 *v201;
  unint64_t v203;
  unsigned int v204;
  uint64_t v205;
  int v206;
  uint64_t v207;
  uint64_t v208;
  uint32x2_t *v209;
  uint32x2_t v210;
  uint32x2_t *v211;
  _DWORD *v212;
  uint64_t v213;
  uint32x2_t v214;
  uint32x2_t v215;
  uint32x2_t v216;
  unsigned int v217;
  unsigned __int8 *v218;
  unsigned int *v219;
  size_t v220;
  uint64_t v221;
  unsigned int v222;
  int v223;
  uint64_t v224;
  unsigned int *v225;
  uint64_t v226;
  unsigned int v227;
  uint64_t v228;
  unsigned int v229;
  uint64_t v230;
  uint64_t v231;
  unsigned int *v232;
  unsigned int v233;
  uint64_t v234;
  uint64_t v235;
  unsigned int *v236;
  uint64_t v237;
  uint64_t v238;
  unsigned int v239;
  uint64_t v240;
  uint64_t v241;
  size_t v242;
  uint64_t v243;
  _DWORD *v244;
  unsigned int *v245;
  unsigned int v246;
  unint64_t v247;
  size_t v248;
  _DWORD *v249;
  unsigned int *v250;
  unint64_t v251;
  uint32x2_t *__dst;
  unsigned int *v253;
  int8x16_t *v254;
  uint64_t v255;
  int8x16_t *v256;
  uint64_t v257;
  uint64_t v258;
  unsigned __int8 *v259;
  BOOL v260;
  unsigned __int8 *v261;
  unsigned __int8 *v262;
  unsigned __int8 *v263;
  unsigned __int8 *v264;
  _BOOL4 v265;
  _BOOL4 v266;
  BOOL v267;
  int32x4_t v268;
  size_t v269;
  uint64_t v271;
  uint64_t v272;
  unsigned __int8 *v273;
  unsigned __int8 *v274;
  unsigned __int8 *v275;

  if (a2 == 1)
    goto LABEL_15;
  v10 = a3;
  if (!a3)
    goto LABEL_15;
  v12 = a2;
  v13 = a2 * a2;
  v14 = a2 * a2 + 12 * a2 + 6;
  v15 = &a3[v14];
  v16 = a2 - (_DWORD)a3;
  v17 = a2 + v14;
  v18 = &a3[v17];
  v19 = (unint64_t)&a3[a2 + 3 + v17];
  v20 = v19 & 0xFFFFFFFC;
  if ((v19 & 0xFFFFFFFFFFFFFFFCLL) == 0)
  {
LABEL_15:
    *a5 = 0;
    return;
  }
  v21 = 4 * a2;
  if (a2)
  {
    for (i = 0; i != a2; ++i)
    {
      v23 = 0;
      v24 = &a1[i];
      v25 = 3.4028e38;
      v26 = a2;
      do
      {
        if (*(float *)((char *)v24 + v23) < v25)
          v25 = *(float *)((char *)v24 + v23);
        v23 += v21;
        --v26;
      }
      while (v26);
      if (v25 > 0.0)
      {
        v27 = 0;
        v28 = a2;
        do
        {
          *(float *)((char *)v24 + v27) = *(float *)((char *)v24 + v27) - v25;
          v27 += v21;
          --v28;
        }
        while (v28);
      }
    }
    v29 = 0;
    v30 = 0;
    v272 = a2 & 0xFFFFFFF8;
    while (1)
    {
      v31 = (float32x4_t *)((char *)a1 + v29 + 16);
      v32 = (float *)((char *)a1 + v29);
      LODWORD(a8) = 2139095039;
      v33 = a2;
      do
      {
        v34 = *v32++;
        v35 = v34;
        if (v34 < *(float *)&a8)
          *(float *)&a8 = v35;
        --v33;
      }
      while (v33);
      if (*(float *)&a8 <= 0.0)
        goto LABEL_18;
      if (a2 > 7)
      {
        v37 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a8, 0);
        v38 = a2 & 0xFFFFFFF8;
        do
        {
          v39 = vsubq_f32(*v31, v37);
          v31[-1] = vsubq_f32(v31[-1], v37);
          *v31 = v39;
          v31 += 2;
          v38 -= 8;
        }
        while (v38);
        v36 = a2 & 0xFFFFFFF8;
        if (v272 == a2)
          goto LABEL_18;
      }
      else
      {
        v36 = 0;
      }
      v40 = a2 - v36;
      v41 = (float *)((char *)&a1[v36] + v29);
      do
      {
        *v41 = *v41 - *(float *)&a8;
        ++v41;
        --v40;
      }
      while (v40);
LABEL_18:
      ++v30;
      v29 += v21;
      if (v30 == a2)
        goto LABEL_33;
    }
  }
  v272 = a2 & 0xFFFFFFF8;
LABEL_33:
  v42 = v13 + 8 * a2 + v21 + 6;
  if (v12 <= 1)
    v43 = 1;
  else
    v43 = v12;
  if (!a2)
  {
    bzero(v10, v42);
    return;
  }
  v269 = v42;
  v247 = v19;
  v249 = (_DWORD *)(v19 & 0xFFFFFFFFFFFFFFFCLL);
  v250 = a7;
  __dst = (uint32x2_t *)((unint64_t)&v10[v20 + 3 + v21 - (_DWORD)v10] & 0xFFFFFFFFFFFFFFFCLL);
  v251 = (unint64_t)&v10[((v20 + v21 + 3) & 0xFFFFFFFC) + 3 + v21 - (_DWORD)v10] & 0xFFFFFFFFFFFFFFFCLL;
  v253 = (unsigned int *)((unint64_t)&v10[4 * v13
                                               + 3
                                               + ((((v20 + v21 + 3) & 0xFFFFFFFC) + v21 + 3) & 0xFFFFFFFC)
                                               - v10] & 0xFFFFFFFFFFFFFFFCLL);
  v44 = vdupq_n_s32(a2);
  v258 = v12 & 0xFFFFFFE0;
  v248 = 4 * v12;
  v45 = (unint64_t)(v10 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  v46 = (unint64_t)&v10[(v45 + v21 - (_DWORD)v10) + 3] & 0xFFFFFFFFFFFFFFFCLL;
  v47 = &v10[(((_DWORD)v45 + v21 + 3) & 0xFFFFFFFC) + v21 - (_DWORD)v10];
  v48 = (int8x16_t *)&v10[v13 + (((_DWORD)v45 + v21 + 3) & 0xFFFFFFFC) + v21 - (_DWORD)v10];
  v49 = &v10[v16 + v13 + (((_DWORD)v45 + v21 + 3) & 0xFFFFFFFC) + v21];
  v50 = v16 + v49;
  v51 = (int8x16_t *)&v10[v50];
  v52 = &v10[v16 + (_DWORD)v10 + (_DWORD)v50];
  v53 = v50 - (unint64_t)(v16 + v48) < 8 || a2 < 8;
  v267 = v53;
  v54 = (unint64_t)(v18 - (unsigned __int8 *)v51) < 0x20 || a2 < 8;
  v266 = v54;
  v55 = (unint64_t)(v15 - (unsigned __int8 *)v48) < 0x20 || a2 < 8;
  v265 = v55;
  v274 = v52;
  v57 = &v52[v12] > (unsigned __int8 *)a5 && v52 < (unsigned __int8 *)&a5[v12] || a2 < 8;
  v260 = v57;
  v259 = &v10[v50 + 3];
  v262 = &v10[v17];
  v257 = (uint64_t)&v10[v17 + 16];
  v275 = &v10[v50];
  v261 = &v10[v14];
  v255 = (uint64_t)&v10[v14 + 16];
  v256 = v51 + 1;
  v254 = v48 + 1;
  v273 = v18;
  v271 = v43;
  v264 = v10;
  v268 = v44;
  v263 = (unsigned __int8 *)v48;
LABEL_53:
  bzero(v10, v269);
  v58 = a5 + 4;
  v59 = v272;
  if (a2 < 8)
  {
    v60 = 0;
    v61 = v273;
    v62 = a1;
    v63 = v271;
    v64 = 4 * a2;
    v10 = v264;
    v65 = v263;
    v66.i64[0] = 0x100000001;
    v66.i64[1] = 0x100000001;
    v67.i64[0] = 0x101010101010101;
    v67.i64[1] = 0x101010101010101;
LABEL_57:
    v68 = v12 - v60;
    v69 = &a5[v60];
    do
    {
      *v69++ = a2;
      --v68;
    }
    while (v68);
    goto LABEL_59;
  }
  do
  {
    *((int32x4_t *)v58 - 1) = v268;
    *(int32x4_t *)v58 = v268;
    v58 += 8;
    v59 -= 8;
  }
  while (v59);
  v60 = v272;
  v61 = v273;
  v62 = a1;
  v63 = v271;
  v64 = 4 * a2;
  v10 = v264;
  v65 = v263;
  v66.i64[0] = 0x100000001;
  v66.i64[1] = 0x100000001;
  v67.i64[0] = 0x101010101010101;
  v67.i64[1] = 0x101010101010101;
  if (v272 != v12)
    goto LABEL_57;
LABEL_59:
  v70 = 0;
  v71 = 0;
  v72 = 0;
  do
  {
    v73 = &v47[v71];
    v74 = (_DWORD *)v46;
    v75 = v12;
    v76 = (float *)((char *)v62 + v70);
    do
    {
      if (*v76 > 0.000001)
      {
        *v73 = 1;
      }
      else
      {
        ++*v74;
        ++*(_DWORD *)(v45 + 4 * v72);
      }
      ++v73;
      ++v74;
      ++v76;
      --v75;
    }
    while (v75);
    ++v72;
    v71 += a2;
    v70 += v64;
  }
  while (v72 != v12);
  v77 = 0;
  v78 = 0;
  while (1)
  {
    if (*(_DWORD *)(v45 + 4 * v77) == 1)
    {
      v79 = 0;
      v80 = &v47[v77 * a2];
      do
      {
        v81 = v80[v79];
        if (!v80[v79])
        {
          v49[v77] = 1;
          v80[v79] = 2;
          v82 = v79;
          a5[v82] = v77;
          --*(_DWORD *)(v45 + 4 * v77);
          *(_DWORD *)(v46 + v82 * 4) = *(_DWORD *)(v46 + 4 * v79) - 1;
          v83 = &v47[v79];
          v84 = v77;
          v85 = v12;
          v86 = (_DWORD *)v45;
          do
          {
            if (v84 && !v83[v81])
            {
              v83[v81] = 3;
              --*(_DWORD *)(v46 + 4 * v79);
              --*v86;
            }
            v81 += a2;
            ++v86;
            --v84;
            --v85;
          }
          while (v85);
          v78 = 1;
        }
        ++v79;
      }
      while (v79 != v12);
    }
    if (++v77 == v12)
    {
      v87 = 0;
      v88 = v78;
      do
      {
        if (*(_DWORD *)(v46 + 4 * v87) == 1)
        {
          v89 = 0;
          v90 = 0;
          do
          {
            v91 = &v47[v90 * a2];
            if (!v91[v87])
            {
              v92 = 0;
              v49[v90] = 1;
              v91[v87] = 2;
              v93 = v87;
              a5[v93] = v90;
              --*(_DWORD *)(v45 + 4 * v90);
              v94 = &v47[v89];
              *(_DWORD *)(v46 + v93 * 4) = *(_DWORD *)(v46 + 4 * v87) - 1;
              do
              {
                if (v87 != v92 && !v94[v92])
                {
                  v94[v92] = 3;
                  --*(_DWORD *)(v45 + 4 * v90);
                  --*(_DWORD *)(v46 + 4 * v92);
                }
                ++v92;
              }
              while (v12 != v92);
              v88 = 1;
            }
            ++v90;
            v89 += a2;
          }
          while (v90 != v12);
        }
        ++v87;
      }
      while (v87 != v12);
      v77 = 0;
      v78 = 0;
      if ((v88 & 1) == 0)
        break;
    }
  }
  v95 = 0;
  v96 = 0;
  do
  {
    if (*(_DWORD *)(v45 + 4 * v95))
    {
      v97 = 0;
      v98 = &v47[v95 * a2];
      v99 = 1;
      do
      {
        if (!v98[v97])
        {
          if ((v99 & 1) != 0)
          {
            v100 = 0;
            v101 = 0;
            v49[v95] = 1;
            v98[v97] = 2;
            a5[v97] = v95;
            v274[v97] = 1;
            --*(_DWORD *)(v45 + 4 * v95);
            --*(_DWORD *)(v46 + 4 * v97);
            v102 = &v47[v97];
            do
            {
              if (v95 != v101 && !v102[v100])
              {
                v102[v100] = 3;
                --*(_DWORD *)(v46 + 4 * v97);
                --*(_DWORD *)(v45 + 4 * v101);
              }
              ++v101;
              v100 += a2;
            }
            while (v12 != v101);
            v99 = 0;
            v96 = 1;
          }
          else
          {
            v99 = 0;
            v98[v97] = 3;
            --*(_DWORD *)(v45 + 4 * v95);
            --*(_DWORD *)(v46 + 4 * v97);
          }
        }
        ++v97;
      }
      while (v97 != v12);
    }
    ++v95;
  }
  while (v95 != v12);
  if (!v267)
  {
    v104 = 0;
    while (1)
    {
      v105 = vceqz_s8(*(int8x8_t *)&v49[v104]);
      if ((v105.i8[0] & 1) != 0)
      {
        v259[v104 - 3] = 1;
        if ((v105.i8[1] & 1) == 0)
          goto LABEL_111;
      }
      else if ((v105.i8[1] & 1) == 0)
      {
LABEL_111:
        if ((v105.i8[2] & 1) != 0)
          goto LABEL_112;
        goto LABEL_120;
      }
      v259[v104 - 2] = 1;
      if ((v105.i8[2] & 1) != 0)
      {
LABEL_112:
        v259[v104 - 1] = 1;
        if ((v105.i8[3] & 1) == 0)
          goto LABEL_113;
        goto LABEL_121;
      }
LABEL_120:
      if ((v105.i8[3] & 1) == 0)
      {
LABEL_113:
        if ((v105.i8[4] & 1) != 0)
          goto LABEL_114;
        goto LABEL_122;
      }
LABEL_121:
      v259[v104] = 1;
      if ((v105.i8[4] & 1) != 0)
      {
LABEL_114:
        v259[v104 + 1] = 1;
        if ((v105.i8[5] & 1) == 0)
          goto LABEL_115;
        goto LABEL_123;
      }
LABEL_122:
      if ((v105.i8[5] & 1) == 0)
      {
LABEL_115:
        if ((v105.i8[6] & 1) != 0)
          goto LABEL_116;
        goto LABEL_124;
      }
LABEL_123:
      v259[v104 + 2] = 1;
      if ((v105.i8[6] & 1) != 0)
      {
LABEL_116:
        v259[v104 + 3] = 1;
        if ((v105.i8[7] & 1) != 0)
          goto LABEL_125;
        goto LABEL_108;
      }
LABEL_124:
      if ((v105.i8[7] & 1) != 0)
LABEL_125:
        v259[v104 + 4] = 1;
LABEL_108:
      v104 += 8;
      if (v272 == v104)
      {
        v103 = v272;
        if (v272 == v12)
          goto LABEL_127;
        goto LABEL_149;
      }
    }
  }
  v103 = 0;
LABEL_149:
  v121 = v12 - v103;
  v122 = &v275[v103];
  v123 = &v49[v103];
  do
  {
    if (!*v123++)
      *v122 = 1;
    ++v122;
    --v121;
  }
  while (v121);
LABEL_127:
  v106 = 0;
  v107 = 0;
  do
  {
    if (v275[v106])
    {
      v108 = &v47[v106 * a2];
      v109 = v65;
      v110 = a5;
      v111 = v12;
      v112 = v107;
      do
      {
        v114 = *v108++;
        v113 = v114;
        if ((v114 == 3 || v113 == 0) && !*v109)
        {
          v112 = 1;
          *v109 = 1;
          v116 = *v110;
          if (v116 < a2)
          {
            v112 = 1;
            if (!v275[v116])
              v275[v116] = 1;
          }
        }
        ++v110;
        ++v109;
        --v111;
      }
      while (v111);
    }
    else
    {
      v112 = v107;
    }
    v117 = v106 + 1 == v12;
    v118 = v106 + 1 != v12;
    if (v106 + 1 == v12)
      v106 = 0;
    else
      ++v106;
    v107 = v118 & v112;
  }
  while (!v117 || (v112 & 1) != 0);
  if (v266)
  {
    v119 = 0;
    v120 = 0;
    goto LABEL_162;
  }
  if (a2 < 0x20)
  {
    v120 = 0;
    v125 = 0;
LABEL_159:
    v143 = 0uLL;
    v144 = (int32x4_t)v120;
    do
    {
      v145 = vceqz_s8(*(int8x8_t *)&v275[v125]);
      *(int8x8_t *)&v61[v125] = vand_s8(v145, (int8x8_t)0x101010101010101);
      v146 = vmovl_u8((uint8x8_t)v145);
      v143 = vaddq_s32(v143, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v146), v66));
      v144 = vaddq_s32(v144, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v146.i8), v66));
      v125 += 8;
    }
    while (v272 != v125);
    v120 = vaddvq_s32(vaddq_s32(v144, v143));
    v119 = v272;
    if (v272 == v12)
      goto LABEL_166;
    goto LABEL_162;
  }
  v126 = 0uLL;
  v127 = v256;
  v128 = (int8x16_t *)v257;
  v129 = 0uLL;
  v130 = v12 & 0xFFFFFFE0;
  v131 = 0uLL;
  v132 = 0uLL;
  v133 = 0uLL;
  v134 = 0uLL;
  v135 = 0uLL;
  v136 = 0uLL;
  do
  {
    v137 = vceqzq_s8(v127[-1]);
    v138 = vceqzq_s8(*v127);
    v128[-1] = vandq_s8(v137, v67);
    *v128 = vandq_s8(v138, v67);
    v139 = vmovl_u8(*(uint8x8_t *)v137.i8);
    v140 = vmovl_high_u8((uint8x16_t)v137);
    v141 = vmovl_u8(*(uint8x8_t *)v138.i8);
    v142 = vmovl_high_u8((uint8x16_t)v138);
    v132 = vaddq_s32(v132, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v140), v66));
    v131 = vaddq_s32(v131, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v140.i8), v66));
    v129 = vaddq_s32(v129, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v139), v66));
    v126 = vaddq_s32(v126, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v139.i8), v66));
    v136 = vaddq_s32(v136, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v142), v66));
    v135 = vaddq_s32(v135, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v142.i8), v66));
    v134 = vaddq_s32(v134, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v141), v66));
    v133 = vaddq_s32(v133, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v141.i8), v66));
    v128 += 2;
    v127 += 2;
    v130 -= 32;
  }
  while (v130);
  v120 = vaddvq_s32(vaddq_s32(vaddq_s32(vaddq_s32(v133, v126), vaddq_s32(v135, v131)), vaddq_s32(vaddq_s32(v134, v129), vaddq_s32(v136, v132))));
  if (v258 == v12)
    goto LABEL_166;
  v119 = v12 & 0xFFFFFFE0;
  v125 = v119;
  if ((v12 & 0x18) != 0)
    goto LABEL_159;
LABEL_162:
  v147 = v12 - v119;
  v148 = (BOOL *)&v262[v119];
  v149 = &v275[v119];
  do
  {
    v150 = *v149++;
    *v148++ = v150 == 0;
    if (!v150)
      ++v120;
    --v147;
  }
  while (v147);
LABEL_166:
  if (v265)
  {
    v151 = 0;
    goto LABEL_177;
  }
  if (a2 < 0x20)
  {
    v152 = 0;
LABEL_174:
    v172 = 0uLL;
    v173 = (int32x4_t)v120;
    do
    {
      v174 = *(int8x8_t *)&v65[v152];
      *(int8x8_t *)&v15[v152] = v174;
      v175 = vmovl_u8((uint8x8_t)vtst_s8(v174, v174));
      v172 = vaddq_s32(v172, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v175), v66));
      v173 = vaddq_s32(v173, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v175.i8), v66));
      v152 += 8;
    }
    while (v272 != v152);
    v120 = vaddvq_s32(vaddq_s32(v173, v172));
    v151 = v272;
    if (v272 == v12)
      goto LABEL_181;
    goto LABEL_177;
  }
  v153 = 0uLL;
  v154 = (int32x4_t)v120;
  v155 = v254;
  v156 = (_OWORD *)v255;
  v157 = v12 & 0xFFFFFFE0;
  v158 = 0uLL;
  v159 = 0uLL;
  v160 = 0uLL;
  v161 = 0uLL;
  v162 = 0uLL;
  v163 = 0uLL;
  do
  {
    v164 = v155[-1];
    v165 = *v155;
    *(v156 - 1) = v164;
    *v156 = v165;
    v166 = (uint8x16_t)vtstq_s8(v164, v164);
    v167 = vmovl_u8(*(uint8x8_t *)v166.i8);
    v168 = vmovl_high_u8(v166);
    v169 = (uint8x16_t)vtstq_s8(v165, v165);
    v170 = vmovl_u8(*(uint8x8_t *)v169.i8);
    v171 = vmovl_high_u8(v169);
    v159 = vaddq_s32(v159, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v168), v66));
    v158 = vaddq_s32(v158, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v168.i8), v66));
    v153 = vaddq_s32(v153, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v167), v66));
    v154 = vaddq_s32(v154, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v167.i8), v66));
    v163 = vaddq_s32(v163, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v171), v66));
    v162 = vaddq_s32(v162, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v171.i8), v66));
    v161 = vaddq_s32(v161, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v170), v66));
    v160 = vaddq_s32(v160, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v170.i8), v66));
    v156 += 2;
    v155 += 2;
    v157 -= 32;
  }
  while (v157);
  v120 = vaddvq_s32(vaddq_s32(vaddq_s32(vaddq_s32(v160, v154), vaddq_s32(v162, v158)), vaddq_s32(vaddq_s32(v161, v153), vaddq_s32(v163, v159))));
  if (v258 == v12)
    goto LABEL_181;
  v151 = v12 & 0xFFFFFFE0;
  v152 = v151;
  if ((v12 & 0x18) != 0)
    goto LABEL_174;
LABEL_177:
  v176 = v12 - v151;
  v177 = &v261[v151];
  v178 = &v65[v151];
  do
  {
    v179 = *v178++;
    *v177++ = v179;
    if (v179)
      ++v120;
    --v176;
  }
  while (v176);
LABEL_181:
  if (((v120 == a2) & v96) != 1)
    goto LABEL_204;
  if (!v260)
  {
    v181 = 0;
    v182 = a5 + 4;
    while (1)
    {
      v183 = vtst_s8(*(int8x8_t *)&v274[v181], *(int8x8_t *)&v274[v181]);
      if ((v183.i8[0] & 1) != 0)
      {
        *(v182 - 4) = a2;
        if ((v183.i8[1] & 1) == 0)
          goto LABEL_188;
      }
      else if ((v183.i8[1] & 1) == 0)
      {
LABEL_188:
        if ((v183.i8[2] & 1) != 0)
          goto LABEL_189;
        goto LABEL_197;
      }
      *(v182 - 3) = a2;
      if ((v183.i8[2] & 1) != 0)
      {
LABEL_189:
        *(v182 - 2) = a2;
        if ((v183.i8[3] & 1) == 0)
          goto LABEL_190;
        goto LABEL_198;
      }
LABEL_197:
      if ((v183.i8[3] & 1) == 0)
      {
LABEL_190:
        if ((v183.i8[4] & 1) != 0)
          goto LABEL_191;
        goto LABEL_199;
      }
LABEL_198:
      *(v182 - 1) = a2;
      if ((v183.i8[4] & 1) != 0)
      {
LABEL_191:
        *v182 = a2;
        if ((v183.i8[5] & 1) == 0)
          goto LABEL_192;
        goto LABEL_200;
      }
LABEL_199:
      if ((v183.i8[5] & 1) == 0)
      {
LABEL_192:
        if ((v183.i8[6] & 1) != 0)
          goto LABEL_193;
        goto LABEL_201;
      }
LABEL_200:
      v182[1] = a2;
      if ((v183.i8[6] & 1) != 0)
      {
LABEL_193:
        v182[2] = a2;
        if ((v183.i8[7] & 1) != 0)
          goto LABEL_202;
        goto LABEL_185;
      }
LABEL_201:
      if ((v183.i8[7] & 1) != 0)
LABEL_202:
        v182[3] = a2;
LABEL_185:
      v181 += 8;
      v182 += 8;
      if (v272 == v181)
      {
        v180 = v272;
        if (v272 == v12)
          goto LABEL_204;
        goto LABEL_228;
      }
    }
  }
  v180 = 0;
LABEL_228:
  v199 = v12 - v180;
  v200 = &a5[v180];
  v201 = &v274[v180];
  do
  {
    if (*v201++)
      *v200 = a2;
    ++v200;
    --v199;
  }
  while (v199);
LABEL_204:
  if (v120 != a2)
  {
    v184 = 0;
    v185 = 0;
    v186 = 3.4028e38;
    do
    {
      v187 = (float *)((char *)v62 + v184);
      v188 = v15;
      v189 = v12;
      do
      {
        v190 = *v188++;
        if (!v190 && !v61[v185] && *v187 < v186 && *v187 > 0.000001)
          v186 = *v187;
        ++v187;
        --v189;
      }
      while (v189);
      ++v185;
      v184 += v64;
    }
    while (v185 != v12);
    v192 = 0;
    v193 = 0;
LABEL_219:
    v194 = (float *)((char *)v62 + v192);
    v195 = v15;
    v196 = v63;
    while (1)
    {
      if (*v195++)
      {
        if (!v61[v193])
          goto LABEL_222;
        v197 = v186 + *v194;
      }
      else
      {
        if (v61[v193])
          goto LABEL_222;
        v197 = fmaxf(*v194 - v186, 0.0);
      }
      *v194 = v197;
LABEL_222:
      ++v194;
      if (!--v196)
      {
        ++v193;
        v192 += v64;
        if (v193 != v63)
          goto LABEL_219;
        goto LABEL_53;
      }
    }
  }
  v203 = 0;
  while (a5[v203 / 4] != a2)
  {
    v203 += 4;
    if (v248 == v203)
      return;
  }
  memcpy(__dst, a5, v64);
  bzero(v249, v248);
  v204 = 0;
  v205 = 0;
  do
  {
    v206 = 0;
    v207 = 0;
    do
    {
      if (a1[v204 + v207] <= 0.000001)
        *(_DWORD *)(v251 + 4 * (v206 + v249[v207]++)) = v205;
      ++v207;
      v206 += a2;
    }
    while (v12 != v207);
    ++v205;
    v204 += a2;
  }
  while (v205 != v12);
  v208 = 0;
  if (a2 < 4)
  {
    v209 = __dst;
  }
  else
  {
    v209 = __dst;
    if (v247 - (unint64_t)__dst > 0xF)
    {
      v208 = v12 & 0xFFFFFFFC;
      v210 = (uint32x2_t)vdup_n_s32(a2);
      v211 = __dst + 1;
      v212 = v249 + 2;
      v213 = v208;
      do
      {
        v214 = *v211;
        v215 = vcgt_u32(v210, v211[-1]);
        if ((v215.i8[0] & 1) != 0)
          *(v212 - 2) = 1;
        if ((v215.i8[4] & 1) != 0)
          *(v212 - 1) = 1;
        v216 = vcgt_u32(v210, v214);
        if ((v216.i8[0] & 1) != 0)
          *v212 = 1;
        if ((v216.i8[4] & 1) != 0)
          v212[1] = 1;
        v211 += 2;
        v212 += 4;
        v213 -= 4;
      }
      while (v213);
      if (v208 == v12)
        goto LABEL_256;
    }
  }
  v242 = v12 - v208;
  v243 = 4 * v208;
  v244 = &v249[v208];
  v245 = (unsigned int *)((char *)v209 + v243);
  do
  {
    v246 = *v245++;
    if (v246 < a2)
      *v244 = 1;
    ++v244;
    --v242;
  }
  while (v242);
LABEL_256:
  bzero(v253, v248);
  v217 = 0;
  v218 = v273;
  while (1)
  {
    do
    {
      while (1)
      {
        bzero(v218, v12);
        v219 = (unsigned int *)__dst;
        v220 = v12;
        do
        {
          v222 = *v219++;
          v221 = v222;
          if (v222 < a2)
            v273[v221] = 1;
          --v220;
        }
        while (v220);
        v223 = 0;
        v224 = 0;
        v218 = v273;
        v225 = v253;
        while (1)
        {
          LODWORD(v226) = __dst->i32[v224];
          if (v226 >= a2)
            break;
LABEL_263:
          a5[v224++] = v226;
          v223 += v12;
          if (v224 == v271)
            goto LABEL_293;
        }
        v227 = v253[v224];
        v228 = v249[v224];
        if (v227 < v228)
        {
          v229 = v217 + 1;
          v230 = v253[v224];
          do
          {
            v226 = *(unsigned int *)(v251 + 4 * (v223 + v230));
            if (!v273[v226])
            {
              v273[v226] = 1;
              v253[v224] = v230;
              v217 = v229;
              goto LABEL_263;
            }
            ++v230;
            ++v229;
          }
          while (v228 != v230);
          v217 = v217 + v228 - v227;
        }
        if (v224 < a2)
        {
          bzero(&v253[v224], 4 * (~(_DWORD)v224 + a2) + 4);
          v225 = v253;
          v218 = v273;
        }
        if (v217 > 0x1F3)
          break;
        v234 = v224;
        v232 = &v253[v224 - 1];
        while (1)
        {
          v235 = v234 - 1;
          if ((int)v234 < 1)
            break;
          v233 = *v232 + 1;
          if (v233 < v249[v234 - 1])
            goto LABEL_275;
          *v232-- = 0;
          --v234;
          if (!v235)
            goto LABEL_280;
        }
      }
    }
    while ((int)v224 < 1);
    v231 = (v224 - 1);
    v232 = &v225[v231];
    v233 = v225[v231] + 1;
    if (v233 >= v249[v231])
      break;
LABEL_275:
    *v232 = v233;
  }
  *v232 = 0;
LABEL_280:
  bzero(v218, v12);
  v236 = a5;
  v237 = a2;
  do
  {
    v239 = *v236++;
    v238 = v239;
    if (v239 < a2)
      v273[v238] = 1;
    --v237;
  }
  while (v237);
  v240 = 0;
  LODWORD(v241) = 0;
  do
  {
    if (a5[v240] >= a2)
    {
      if (v241 < a2)
      {
        v241 = v241;
        while (v273[v241])
        {
          if (v12 == ++v241)
          {
            LODWORD(v241) = v12;
            break;
          }
        }
      }
      a5[v240] = v241;
      LODWORD(v241) = v241 + 1;
    }
    ++v240;
  }
  while (v240 != a2);
LABEL_293:
  if (v250)
    *v250 = v217;
}

void *AcVisegNode::AcVisegNode(void *a1, uint64_t a2)
{
  bzero(a1, 0x298uLL);
  *(_DWORD *)(a2 + 8) = 0;
  *(_QWORD *)a2 = 0xDE7C00000001;
  return a1;
}

{
  bzero(a1, 0x298uLL);
  *(_DWORD *)(a2 + 8) = 0;
  *(_QWORD *)a2 = 0xDE7C00000001;
  return a1;
}

uint64_t AcVisegNode::init(void *a1, uint64_t a2)
{
  memcpy(a1, &kAcVisegNodeConfigDefaultRawData, 0x298uLL);
  *(_QWORD *)(a2 + 4) = 0xDE70000DE71;
  return 0;
}

uint64_t AcVisegNode::setRunViSeg(uint64_t this, char a2)
{
  *(_BYTE *)(this + 664) = a2;
  return this;
}

uint64_t AcVisegNode::getParams(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v5 = *(_OWORD *)(a1 + 20);
  *(_QWORD *)(a3 + 472) = *(_QWORD *)(a1 + 36);
  *(_OWORD *)(a3 + 456) = v5;
  strncpy((char *)(a3 + 1864), (const char *)(a1 + 216), 0x40uLL);
  *(_DWORD *)(a3 + 472) = *(_DWORD *)(a1 + 188);
  v6 = *(_OWORD *)(a1 + 44);
  *(_QWORD *)(a3 + 496) = *(_QWORD *)(a1 + 60);
  *(_OWORD *)(a3 + 480) = v6;
  strncpy((char *)(a3 + 1928), (const char *)(a1 + 280), 0x40uLL);
  *(_DWORD *)(a3 + 496) = *(_DWORD *)(a1 + 192);
  v7 = *(_OWORD *)(a1 + 68);
  *(_QWORD *)(a3 + 520) = *(_QWORD *)(a1 + 84);
  *(_OWORD *)(a3 + 504) = v7;
  strncpy((char *)(a3 + 1992), (const char *)(a1 + 344), 0x40uLL);
  *(_DWORD *)(a3 + 520) = *(_DWORD *)(a1 + 196);
  v8 = *(_OWORD *)(a1 + 92);
  *(_QWORD *)(a3 + 544) = *(_QWORD *)(a1 + 108);
  *(_OWORD *)(a3 + 528) = v8;
  strncpy((char *)(a3 + 2056), (const char *)(a1 + 408), 0x40uLL);
  *(_DWORD *)(a3 + 544) = *(_DWORD *)(a1 + 200);
  v9 = *(_OWORD *)(a1 + 116);
  *(_QWORD *)(a3 + 568) = *(_QWORD *)(a1 + 132);
  *(_OWORD *)(a3 + 552) = v9;
  strncpy((char *)(a3 + 2120), (const char *)(a1 + 472), 0x40uLL);
  *(_DWORD *)(a3 + 568) = *(_DWORD *)(a1 + 204);
  v10 = *(_OWORD *)(a1 + 140);
  *(_QWORD *)(a3 + 592) = *(_QWORD *)(a1 + 156);
  *(_OWORD *)(a3 + 576) = v10;
  strncpy((char *)(a3 + 2184), (const char *)(a1 + 536), 0x40uLL);
  *(_DWORD *)(a3 + 592) = *(_DWORD *)(a1 + 208);
  v11 = *(_OWORD *)(a1 + 164);
  *(_QWORD *)(a3 + 616) = *(_QWORD *)(a1 + 180);
  *(_OWORD *)(a3 + 600) = v11;
  strncpy((char *)(a3 + 2248), (const char *)(a1 + 600), 0x40uLL);
  *(_DWORD *)(a3 + 616) = *(_DWORD *)(a1 + 212);
  return 0;
}

unint64_t acNonMaxSuppression(uint64_t a1, unsigned int a2, _DWORD *a3, int a4, float a5, float a6)
{
  unint64_t v6;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  int v13;
  unint64_t v14;
  int v15;
  float *v16;
  float *v17;
  float *v18;
  int v19;
  unsigned int v20;
  uint64_t v21;
  int v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  BOOL v43;
  float v44;
  float v45;
  float v46;
  uint64_t v47;
  __int128 v48;
  _OWORD *v49;
  uint64_t v50;
  uint64_t v51;
  float v52;
  int *v53;
  unsigned int v54;
  uint64_t v55;
  int v56;
  int *v57;
  unsigned int v58;
  int v59;
  float v60;
  uint64_t v62;
  float *v63;
  int v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v68;

  if (!a2)
    return 0;
  LODWORD(v6) = a4;
  v10 = a1;
  bmHeapsort(a1, a2, 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
  if (a2 >= v6)
    v6 = v6;
  else
    v6 = a2;
  if ((_DWORD)v6)
  {
    v11 = 0;
    v12 = v10 + 32;
    v62 = v10;
    v13 = -2;
    do
    {
      v14 = v10 + 32 * v11++;
      *a3 = (int)*(float *)(v14 + 28);
      if (v11 >= v6)
      {
        v6 = v11;
        goto LABEL_8;
      }
      v15 = *(_DWORD *)(v14 + 16);
      v16 = (float *)(v14 + 8);
      v17 = (float *)(v14 + 12);
      v18 = (float *)(v14 + 4);
      v19 = v6 + v13;
      v20 = 1;
      v21 = v12;
      v22 = v15;
      v6 = v11;
      while (1)
      {
        if (v22 != *(_DWORD *)(v21 + 16))
        {
LABEL_55:
          v47 = v6;
          v6 = (v6 + 1);
          v48 = *(_OWORD *)(v21 + 16);
          v49 = (_OWORD *)(v10 + 32 * v47);
          *v49 = *(_OWORD *)v21;
          v49[1] = v48;
          goto LABEL_56;
        }
        if (v22)
        {
          v23 = *(float *)(v21 + 4);
          if (*(float *)v14 >= *(float *)v21)
            v24 = *(float *)v14;
          else
            v24 = *(float *)v21;
          if (*v18 >= v23)
            v25 = *v18;
          else
            v25 = *(float *)(v21 + 4);
          v26 = *(float *)(v21 + 8);
          v27 = *(float *)(v21 + 12);
          if (*v16 >= v26)
            v28 = *(float *)(v21 + 8);
          else
            v28 = *v16;
          if (*v17 >= v27)
            v29 = *(float *)(v21 + 12);
          else
            v29 = *v17;
          v30 = v28 - v24;
          v31 = 0.0;
          v32 = fmaxf(v30, 0.0) * fmaxf(v29 - v25, 0.0);
          if (v32 >= 0.00000011921)
          {
            v33 = (float)((float)(fmaxf(*v16 - *(float *)v14, 0.0) * fmaxf(*v17 - *v18, 0.0))
                        + (float)(fmaxf(v26 - *(float *)v21, 0.0) * fmaxf(v27 - v23, 0.0)))
                - v32;
            if (v33 >= 0.00000011921)
              v31 = v32 / v33;
            else
              v31 = 0.0;
          }
          if (v31 <= a5)
            goto LABEL_55;
        }
        else
        {
          v34 = *v16;
          v35 = *v17;
          v36 = fmaxf(*v16 - *(float *)v14, 0.0) * fmaxf(*v17 - *v18, 0.0);
          v37 = *(float *)(v21 + 4);
          if (*(float *)v14 >= *(float *)v21)
            v38 = *(float *)v14;
          else
            v38 = *(float *)v21;
          if (*v18 >= v37)
            v39 = *v18;
          else
            v39 = *(float *)(v21 + 4);
          v40 = *(float *)(v21 + 8);
          v41 = *(float *)(v21 + 12);
          if (v34 >= v40)
            v34 = *(float *)(v21 + 8);
          if (v35 >= v41)
            v35 = *(float *)(v21 + 12);
          v42 = fmaxf(v34 - v38, 0.0) * fmaxf(v35 - v39, 0.0);
          v43 = v42 < 0.00000011921 || v36 < 0.00000011921;
          v44 = v42 / v36;
          if (v43)
            v44 = 0.0;
          if (v44 <= a6)
          {
            v45 = 0.0;
            if (v42 >= 0.00000011921)
            {
              v46 = (float)(v36 + (float)(fmaxf(v40 - *(float *)v21, 0.0) * fmaxf(v41 - v37, 0.0))) - v42;
              if (v46 >= 0.00000011921)
                v45 = v42 / v46;
              else
                v45 = 0.0;
            }
            if (v45 <= a5)
              goto LABEL_55;
          }
        }
        if (!v15 && *(float *)(v21 + 24) > 0.57)
          a3[v20++] = (int)*(float *)(v21 + 28);
LABEL_56:
        if (!v19)
          break;
        v22 = *(_DWORD *)(v14 + 16);
        --v19;
        v21 += 32;
      }
      if (!v15 && v20 >= 2)
      {
        v63 = (float *)(v14 + 28);
        v64 = v13;
        v65 = v11;
        v66 = v12;
        v50 = 0;
        v51 = v20 - 1;
        v68 = v20;
        v52 = -3.4028e38;
        v53 = a3 + 1;
        v54 = v20 - 1;
        do
        {
          v55 = v50 + 1;
          if (v50 + 1 < v68)
          {
            v56 = a3[v50];
            v57 = v53;
            v58 = v54;
            do
            {
              v59 = *v57++;
              v60 = sinf((float)((float)(int)fabs((double)(v56 - v59)) * 3.1416) / 360.0);
              if (v52 <= v60)
                v52 = v60;
              --v58;
            }
            while (v58);
          }
          --v54;
          ++v53;
          v50 = v55;
        }
        while (v55 != v51);
        v10 = v62;
        v11 = v65;
        v12 = v66;
        v13 = v64;
        if (v52 > 0.22)
          *v63 = *v63 + 1080.0;
      }
LABEL_8:
      --v13;
      v12 += 32;
    }
    while (v11 < v6);
  }
  return v6;
}

unint64_t acNonMaxSuppressionAnimalHead(uint64_t a1, unint64_t a2, float a3)
{
  unint64_t v3;
  unint64_t v6;
  float32x2_t *v7;
  int v8;
  unint64_t v9;
  float32x2_t *v10;
  float32x2_t *v11;
  int v12;
  float32x2_t *v13;
  uint64_t v14;
  __int128 v15;
  _OWORD *v16;
  __int32 v17;
  float32x2_t v18;
  float32x2_t v19;
  float32x2_t v20;
  float32x2_t v21;
  BOOL v22;
  float v23;

  v3 = a2;
  if ((_DWORD)a2)
  {
    bmHeapsort(a1, a2, 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
    v6 = 0;
    v7 = (float32x2_t *)(a1 + 32);
    v8 = -1;
    do
    {
      v9 = v6 + 1;
      if (v6 + 1 >= v3)
      {
        v3 = v6 + 1;
      }
      else
      {
        v10 = (float32x2_t *)(a1 + 32 * v6);
        v11 = v10 + 1;
        v12 = v3 + v8;
        v13 = v7;
        v3 = v9;
        do
        {
          v17 = v10[2].i32[0];
          if (v17 != v13[2].i32[0])
            goto LABEL_7;
          if ((v17 & 0xFFFFFFFE) == 8)
          {
            v18 = vmaxnm_f32(vsub_f32(*v11, *v10), 0);
            v19 = vmul_lane_f32(v18, v18, 1);
            v20 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v13[1], *v11), (int8x8_t)*v11, (int8x8_t)v13[1]), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*v13, *v10), (int8x8_t)*v13, (int8x8_t)*v10)), 0);
            v21 = vmul_lane_f32(v20, v20, 1);
            v22 = v21.f32[0] < 0.00000011921 || v19.f32[0] < 0.00000011921;
            LODWORD(v23) = vdiv_f32(v21, v19).u32[0];
            if (v22)
              v23 = 0.0;
            if (v23 <= a3)
            {
LABEL_7:
              v14 = v3;
              v3 = (v3 + 1);
              v15 = *(_OWORD *)v13[2].f32;
              v16 = (_OWORD *)(a1 + 32 * v14);
              *v16 = *(_OWORD *)v13->f32;
              v16[1] = v15;
            }
          }
          v13 += 4;
          --v12;
        }
        while (v12);
      }
      v7 += 4;
      --v8;
      v6 = v9;
    }
    while (v9 < v3);
  }
  return v3;
}

unint64_t acNonMaxSuppressionHead(uint64_t a1, unint64_t a2, float a3)
{
  unint64_t v3;
  unint64_t v6;
  float32x2_t *v7;
  int v8;
  unint64_t v9;
  float32x2_t *v10;
  float32x2_t *v11;
  int v12;
  float32x2_t *v13;
  uint64_t v14;
  __int128 v15;
  _OWORD *v16;
  unsigned int v17;
  BOOL v18;
  int v19;
  float32x2_t v21;
  float32x2_t v22;
  float32x2_t v23;
  float32x2_t v24;
  BOOL v25;
  float v26;

  v3 = a2;
  if ((_DWORD)a2)
  {
    bmHeapsort(a1, a2, 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
    v6 = 0;
    v7 = (float32x2_t *)(a1 + 32);
    v8 = -1;
    do
    {
      v9 = v6 + 1;
      if (v6 + 1 >= v3)
      {
        v3 = v6 + 1;
      }
      else
      {
        v10 = (float32x2_t *)(a1 + 32 * v6);
        v11 = v10 + 1;
        v12 = v3 + v8;
        v13 = v7;
        v3 = v9;
        do
        {
          v17 = v10[2].u32[0];
          if (v17 == v13[2].i32[0])
          {
            v18 = v17 > 9;
            v19 = (1 << v17) & 0x302;
            if (v18 || v19 == 0)
              goto LABEL_7;
          }
          v21 = vmaxnm_f32(vsub_f32(*v11, *v10), 0);
          v22 = vmul_lane_f32(v21, v21, 1);
          v23 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v13[1], *v11), (int8x8_t)*v11, (int8x8_t)v13[1]), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*v13, *v10), (int8x8_t)*v13, (int8x8_t)*v10)), 0);
          v24 = vmul_lane_f32(v23, v23, 1);
          v25 = v24.f32[0] < 0.00000011921 || v22.f32[0] < 0.00000011921;
          LODWORD(v26) = vdiv_f32(v24, v22).u32[0];
          if (v25)
            v26 = 0.0;
          if (v26 <= a3)
          {
LABEL_7:
            v14 = v3;
            v3 = (v3 + 1);
            v15 = *(_OWORD *)v13[2].f32;
            v16 = (_OWORD *)(a1 + 32 * v14);
            *v16 = *(_OWORD *)v13->f32;
            v16[1] = v15;
          }
          v13 += 4;
          --v12;
        }
        while (v12);
      }
      v7 += 4;
      --v8;
      v6 = v9;
    }
    while (v9 < v3);
  }
  return v3;
}

unint64_t acNonMaxSuppressionSmallBox(uint64_t a1, unint64_t a2, float a3)
{
  unint64_t v3;
  unint64_t v6;
  float *v7;
  int v8;
  unint64_t v9;
  uint64_t v10;
  float *v11;
  float *v12;
  float *v13;
  int v14;
  float *v15;
  uint64_t v16;
  __int128 v17;
  _OWORD *v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;

  v3 = a2;
  if ((_DWORD)a2)
  {
    bmHeapsort(a1, a2, 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
    v6 = 0;
    v7 = (float *)(a1 + 48);
    v8 = -1;
    do
    {
      v9 = v6 + 1;
      if (v6 + 1 >= v3)
      {
        v3 = v6 + 1;
      }
      else
      {
        v10 = a1 + 32 * v6;
        v11 = (float *)(v10 + 8);
        v12 = (float *)(v10 + 12);
        v13 = (float *)(v10 + 4);
        v14 = v3 + v8;
        v15 = v7;
        v3 = v9;
        do
        {
          if (*(_DWORD *)(v10 + 16) != *(_DWORD *)v15)
            goto LABEL_7;
          v19 = *(v15 - 4);
          v20 = *(v15 - 3);
          if (*(float *)v10 >= v19)
            v21 = *(float *)v10;
          else
            v21 = *(v15 - 4);
          if (*v13 >= v20)
            v22 = *v13;
          else
            v22 = *(v15 - 3);
          v23 = *(v15 - 2);
          v24 = *(v15 - 1);
          if (*v11 >= v23)
            v25 = *(v15 - 2);
          else
            v25 = *v11;
          if (*v12 >= v24)
            v26 = *(v15 - 1);
          else
            v26 = *v12;
          v27 = v25 - v21;
          v28 = 0.0;
          v29 = fmaxf(v27, 0.0) * fmaxf(v26 - v22, 0.0);
          if (v29 >= 0.00000011921)
          {
            v30 = fmaxf(v23 - v19, 0.0) * fmaxf(v24 - v20, 0.0);
            v31 = fmaxf(*v11 - *(float *)v10, 0.0) * fmaxf(*v12 - *v13, 0.0);
            if (v31 >= v30)
              v31 = v30;
            if (v31 >= 0.00000011921)
              v28 = v29 / v31;
            else
              v28 = 0.0;
          }
          if (v28 <= a3)
          {
LABEL_7:
            v16 = v3;
            v3 = (v3 + 1);
            v17 = *(_OWORD *)v15;
            v18 = (_OWORD *)(a1 + 32 * v16);
            *v18 = *((_OWORD *)v15 - 1);
            v18[1] = v17;
          }
          v15 += 8;
          --v14;
        }
        while (v14);
      }
      v7 += 8;
      --v8;
      v6 = v9;
    }
    while (v9 < v3);
  }
  return v3;
}

unint64_t acNonMaxSuppressionFirstBox(uint64_t a1, unint64_t a2, float a3)
{
  unint64_t v3;
  unint64_t v6;
  float32x2_t *v7;
  int v8;
  unint64_t v9;
  float32x2_t *v10;
  float32x2_t *v11;
  int v12;
  float32x2_t *v13;
  uint64_t v14;
  __int128 v15;
  _OWORD *v16;
  float32x2_t v17;
  float32x2_t v18;
  float32x2_t v19;
  float32x2_t v20;
  BOOL v21;
  float v22;

  v3 = a2;
  if ((_DWORD)a2)
  {
    bmHeapsort(a1, a2, 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
    v6 = 0;
    v7 = (float32x2_t *)(a1 + 32);
    v8 = -1;
    do
    {
      v9 = v6 + 1;
      if (v6 + 1 >= v3)
      {
        v3 = v6 + 1;
      }
      else
      {
        v10 = (float32x2_t *)(a1 + 32 * v6);
        v11 = v10 + 1;
        v12 = v3 + v8;
        v13 = v7;
        v3 = v9;
        do
        {
          if (v10[2].i32[0] != v13[2].i32[0])
            goto LABEL_7;
          v17 = vmaxnm_f32(vsub_f32(*v11, *v10), 0);
          v18 = vmul_lane_f32(v17, v17, 1);
          v19 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v13[1], *v11), (int8x8_t)*v11, (int8x8_t)v13[1]), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*v13, *v10), (int8x8_t)*v13, (int8x8_t)*v10)), 0);
          v20 = vmul_lane_f32(v19, v19, 1);
          v21 = v20.f32[0] < 0.00000011921 || v18.f32[0] < 0.00000011921;
          LODWORD(v22) = vdiv_f32(v20, v18).u32[0];
          if (v21)
            v22 = 0.0;
          if (v22 <= a3)
          {
LABEL_7:
            v14 = v3;
            v3 = (v3 + 1);
            v15 = *(_OWORD *)v13[2].f32;
            v16 = (_OWORD *)(a1 + 32 * v14);
            *v16 = *(_OWORD *)v13->f32;
            v16[1] = v15;
          }
          v13 += 4;
          --v12;
        }
        while (v12);
      }
      v7 += 4;
      --v8;
      v6 = v9;
    }
    while (v9 < v3);
  }
  return v3;
}

uint64_t acRemoveOverlapBoxes(_OWORD *a1, unsigned int a2, unsigned __int8 *a3, float a4)
{
  unsigned __int8 *v4;
  unint64_t v7;
  uint64_t v8;
  float *v9;
  uint64_t v10;
  uint64_t v11;
  float *v12;
  float *v13;
  float *v14;
  float *v15;
  float *v16;
  uint64_t v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  uint64_t v29;
  uint64_t result;
  _OWORD *v31;
  __int128 v33;
  _OWORD *v34;

  if (!a2)
    return 0;
  v4 = a3;
  v7 = a2;
  bzero(a3, a2);
  v8 = 0;
  v9 = (float *)(a1 + 2);
  v10 = 1;
  do
  {
    v11 = v8 + 1;
    if (v8 + 1 < v7)
    {
      v12 = (float *)&a1[2 * v8];
      v13 = v12 + 2;
      v14 = v12 + 3;
      v15 = v12 + 1;
      v16 = v9;
      v17 = v10;
      do
      {
        v18 = v16[1];
        if (*v12 >= *v16)
          v19 = *v12;
        else
          v19 = *v16;
        if (*v15 >= v18)
          v20 = *v15;
        else
          v20 = v16[1];
        v21 = v16[2];
        v22 = v16[3];
        if (*v13 >= v21)
          v23 = v16[2];
        else
          v23 = *v13;
        if (*v14 >= v22)
          v24 = v16[3];
        else
          v24 = *v14;
        v25 = v23 - v19;
        v26 = 0.0;
        v27 = fmaxf(v25, 0.0) * fmaxf(v24 - v20, 0.0);
        if (v27 >= 0.00000011921)
        {
          v28 = (float)((float)(fmaxf(*v13 - *v12, 0.0) * fmaxf(*v14 - *v15, 0.0))
                      + (float)(fmaxf(v21 - *v16, 0.0) * fmaxf(v22 - v18, 0.0)))
              - v27;
          if (v28 >= 0.00000011921)
            v26 = v27 / v28;
          else
            v26 = 0.0;
        }
        if (v26 > a4)
        {
          if (v12[6] <= v16[6])
            v29 = v8;
          else
            v29 = v17;
          v4[v29] = 1;
        }
        ++v17;
        v16 += 8;
      }
      while ((_DWORD)v7 != (_DWORD)v17);
    }
    ++v10;
    v9 += 8;
    ++v8;
  }
  while (v11 != v7);
  result = 0;
  v31 = a1;
  do
  {
    if (!*v4++)
    {
      v33 = v31[1];
      v34 = &a1[2 * result];
      *v34 = *v31;
      v34[1] = v33;
      result = (result + 1);
    }
    v31 += 2;
    --v7;
  }
  while (v7);
  return result;
}

uint64_t acRemoveHeadOverlapBoxes(_OWORD *a1, unsigned int a2, unsigned __int8 *a3, float a4)
{
  unsigned __int8 *v4;
  unint64_t v7;
  uint64_t v8;
  float *v9;
  uint64_t v10;
  uint64_t v11;
  float32x2_t *v12;
  float32x2_t *v13;
  float *v14;
  uint64_t v15;
  unsigned int v16;
  BOOL v17;
  int v18;
  float32x2_t v20;
  float32x2_t v21;
  float32x2_t v22;
  float32x2_t v23;
  BOOL v24;
  float v25;
  uint64_t v26;
  uint64_t result;
  _OWORD *v28;
  __int128 v30;
  _OWORD *v31;

  if (!a2)
    return 0;
  v4 = a3;
  v7 = a2;
  bzero(a3, a2);
  v8 = 0;
  v9 = (float *)a1 + 14;
  v10 = 1;
  do
  {
    v11 = v8 + 1;
    if (v8 + 1 < v7)
    {
      v12 = (float32x2_t *)&a1[2 * v8];
      v13 = v12 + 1;
      v14 = v9;
      v15 = v10;
      do
      {
        v16 = v12[2].u32[0];
        v17 = v16 != *((_DWORD *)v14 - 2) || v16 > 9;
        v18 = (1 << v16) & 0x302;
        if (!v17 && v18 != 0)
        {
          v20 = vmaxnm_f32(vsub_f32(*v13, *v12), 0);
          v21 = vmul_lane_f32(v20, v20, 1);
          v22 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*(float32x2_t *)(v14 - 4), *v13), (int8x8_t)*v13, *(int8x8_t *)(v14 - 4)), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*(float32x2_t *)(v14 - 6), *v12), *(int8x8_t *)(v14 - 6), (int8x8_t)*v12)), 0);
          v23 = vmul_lane_f32(v22, v22, 1);
          v24 = v23.f32[0] < 0.00000011921 || v21.f32[0] < 0.00000011921;
          LODWORD(v25) = vdiv_f32(v23, v21).u32[0];
          if (v24)
            v25 = 0.0;
          if (v25 > a4)
          {
            if (v12[3].f32[0] <= *v14)
              v26 = v8;
            else
              v26 = v15;
            v4[v26] = 1;
          }
        }
        ++v15;
        v14 += 8;
      }
      while ((_DWORD)v7 != (_DWORD)v15);
    }
    ++v10;
    v9 += 8;
    ++v8;
  }
  while (v11 != v7);
  result = 0;
  v28 = a1;
  do
  {
    if (!*v4++)
    {
      v30 = v28[1];
      v31 = &a1[2 * result];
      *v31 = *v28;
      v31[1] = v30;
      result = (result + 1);
    }
    v28 += 2;
    --v7;
  }
  while (v7);
  return result;
}

BOOL acCheckOverlapBox(uint64_t a1, unsigned int a2, uint64_t a3, float a4, float a5)
{
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;

  if (a2)
  {
    v5 = 0;
    v6 = a1 + 8;
    v7 = 1;
    while (1)
    {
      if (*(_DWORD *)(v6 + 8))
      {
        v8 = *(float *)(v6 - 8);
        v9 = *(float *)a3;
        v10 = *(float *)(a3 + 4);
        v11 = *(float *)(a3 + 8);
        v12 = *(float *)(a3 + 12);
      }
      else
      {
        v8 = *(float *)(v6 - 8);
        v9 = *(float *)a3;
        v10 = *(float *)(a3 + 4);
        v11 = *(float *)(a3 + 8);
        v12 = *(float *)(a3 + 12);
        if (!*(_DWORD *)(a3 + 16))
        {
          if (v8 >= v9)
            v13 = *(float *)(v6 - 8);
          else
            v13 = *(float *)a3;
          v14 = *(float *)(v6 - 4);
          v15 = *(float *)v6;
          if (v14 >= v10)
            v16 = *(float *)(v6 - 4);
          else
            v16 = *(float *)(a3 + 4);
          v17 = *(float *)(v6 + 4);
          if (v15 >= v11)
            v18 = *(float *)(a3 + 8);
          else
            v18 = *(float *)v6;
          if (v17 >= v12)
            v19 = *(float *)(a3 + 12);
          else
            v19 = *(float *)(v6 + 4);
          v20 = v18 - v13;
          v21 = 0.0;
          v22 = fmaxf(v20, 0.0) * fmaxf(v19 - v16, 0.0);
          if (v22 >= 0.00000011921)
          {
            v23 = fmaxf(v12 - v10, 0.0);
            v24 = fmaxf(v11 - v9, 0.0);
            v25 = fmaxf(v15 - v8, 0.0) * fmaxf(v17 - v14, 0.0);
            if (v25 >= (float)(v24 * v23))
              v25 = v24 * v23;
            if (v25 >= 0.00000011921)
              v21 = v22 / v25;
            else
              v21 = 0.0;
          }
          if (v21 > a4)
            return v7;
        }
      }
      if (v8 >= v9)
        v26 = v8;
      else
        v26 = v9;
      v27 = *(float *)(v6 - 4);
      v28 = *(float *)v6;
      if (v27 >= v10)
        v29 = *(float *)(v6 - 4);
      else
        v29 = v10;
      v30 = *(float *)(v6 + 4);
      if (v28 >= v11)
        v31 = v11;
      else
        v31 = *(float *)v6;
      if (v30 >= v12)
        v32 = v12;
      else
        v32 = *(float *)(v6 + 4);
      v33 = v31 - v26;
      v34 = 0.0;
      v35 = fmaxf(v33, 0.0) * fmaxf(v32 - v29, 0.0);
      if (v35 >= 0.00000011921)
      {
        v36 = (float)((float)(fmaxf(v28 - v8, 0.0) * fmaxf(v30 - v27, 0.0))
                    + (float)(fmaxf(v11 - v9, 0.0) * fmaxf(v12 - v10, 0.0)))
            - v35;
        if (v36 >= 0.00000011921)
          v34 = v35 / v36;
        else
          v34 = 0.0;
      }
      if (v34 <= a5)
      {
        v7 = ++v5 < (unint64_t)a2;
        v6 += 32;
        if (a2 != v5)
          continue;
      }
      return v7;
    }
  }
  return 0;
}

BOOL acCheckHeadOverlapFace(float32x2_t *a1, unsigned int a2, float32x2_t *a3, float a4)
{
  uint64_t v4;
  float32x2_t *v5;
  BOOL v6;
  float32x2_t v7;
  float32x2_t v8;
  float32x2_t v9;
  float32x2_t v10;
  float32x2_t v11;
  BOOL v12;
  float v13;

  if (!a2)
    return 0;
  v4 = 0;
  v5 = a1 + 1;
  v6 = 1;
  do
  {
    v7 = v5[-1];
    v8 = vmaxnm_f32(vsub_f32(*v5, v7), 0);
    v9 = vmul_lane_f32(v8, v8, 1);
    v10 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(a3[1], *v5), (int8x8_t)*v5, (int8x8_t)a3[1]), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*a3, v7), (int8x8_t)*a3, (int8x8_t)v7)), 0);
    v11 = vmul_lane_f32(v10, v10, 1);
    v12 = v11.f32[0] < 0.00000011921 || v9.f32[0] < 0.00000011921;
    LODWORD(v13) = vdiv_f32(v11, v9).u32[0];
    if (v12)
      v13 = 0.0;
    if (v13 > a4)
      break;
    v6 = ++v4 < (unint64_t)a2;
    v5 += 4;
  }
  while (a2 != v4);
  return v6;
}

BOOL acCheckOverlapBoxNormal(uint64_t a1, unsigned int a2, float *a3, float a4)
{
  uint64_t v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float *v9;
  BOOL v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;

  if (!a2)
    return 0;
  v4 = 0;
  v5 = a3[1];
  v6 = a3[2];
  v7 = a3[3];
  v8 = fmaxf(v6 - *a3, 0.0) * fmaxf(v7 - v5, 0.0);
  v9 = (float *)(a1 + 8);
  v10 = 1;
  do
  {
    v11 = *(v9 - 2);
    v12 = *(v9 - 1);
    if (v11 >= *a3)
      v13 = *(v9 - 2);
    else
      v13 = *a3;
    if (v12 >= v5)
      v14 = *(v9 - 1);
    else
      v14 = a3[1];
    v15 = v9[1];
    if (*v9 >= v6)
      v16 = a3[2];
    else
      v16 = *v9;
    if (v15 >= v7)
      v17 = a3[3];
    else
      v17 = v9[1];
    v18 = fmaxf(v16 - v13, 0.0) * fmaxf(v17 - v14, 0.0);
    v19 = 0.0;
    if (v18 >= 0.00000011921)
    {
      v20 = (float)((float)(fmaxf(*v9 - v11, 0.0) * fmaxf(v15 - v12, 0.0)) + v8) - v18;
      if (v20 >= 0.00000011921)
        v19 = v18 / v20;
      else
        v19 = 0.0;
    }
    if (v19 > a4)
      break;
    v10 = ++v4 < (unint64_t)a2;
    v9 += 8;
  }
  while (a2 != v4);
  return v10;
}

uint64_t acNMSFaceHead(float32x2_t *a1, unsigned int a2, __int128 *a3, unsigned int *a4, float a5)
{
  uint64_t v5;
  unsigned int v6;
  uint64_t i;
  uint64_t v8;
  float32x2_t *v9;
  BOOL v10;
  float32x2_t *v11;
  float32x2_t v12;
  float32x2_t v13;
  float32x2_t v14;
  float32x2_t v15;
  float32x2_t v16;
  BOOL v17;
  float v18;
  __int128 *v19;
  __int128 v20;
  unsigned int v21;
  __int128 *v22;
  __int128 *v23;
  __int128 v24;
  __int128 v25;

  v5 = *a4;
  *a4 = 0;
  if ((_DWORD)v5)
  {
    if (a2)
    {
      v6 = 0;
      for (i = 0; i != v5; ++i)
      {
        v8 = 0;
        v9 = (float32x2_t *)&a3[2 * i];
        v10 = 1;
        v11 = a1 + 1;
        do
        {
          v12 = v11[-1];
          v13 = vmaxnm_f32(vsub_f32(*v11, v12), 0);
          v14 = vmul_lane_f32(v13, v13, 1);
          v15 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v9[1], *v11), (int8x8_t)*v11, (int8x8_t)v9[1]), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*v9, v12), (int8x8_t)*v9, (int8x8_t)v12)), 0);
          v16 = vmul_lane_f32(v15, v15, 1);
          v17 = v16.f32[0] < 0.00000011921 || v14.f32[0] < 0.00000011921;
          LODWORD(v18) = vdiv_f32(v16, v14).u32[0];
          if (v17)
            v18 = 0.0;
          if (v18 > a5)
            break;
          v10 = ++v8 < (unint64_t)a2;
          v11 += 4;
        }
        while (a2 != v8);
        if (!v10)
        {
          v19 = &a3[2 * v6];
          v20 = *(_OWORD *)v9[2].f32;
          *v19 = *(_OWORD *)v9->f32;
          v19[1] = v20;
          v6 = *a4 + 1;
          *a4 = v6;
        }
      }
    }
    else
    {
      v21 = 0;
      v22 = a3;
      do
      {
        v23 = &a3[2 * v21];
        v24 = *v22;
        v25 = v22[1];
        v22 += 2;
        *v23 = v24;
        v23[1] = v25;
        v21 = *a4 + 1;
        *a4 = v21;
        --v5;
      }
      while (v5);
    }
  }
  return 1;
}

uint64_t acClassASuppressB(float32x2_t *a1, unsigned int a2, __int128 *a3, unsigned int *a4, float a5)
{
  uint64_t v5;
  unsigned int v6;
  uint64_t i;
  uint64_t v8;
  float32x2_t *v9;
  BOOL v10;
  float32x2_t *v11;
  float32x2_t v12;
  float32x2_t v13;
  float32x2_t v14;
  float32x2_t v15;
  float32x2_t v16;
  BOOL v17;
  float v18;
  __int128 *v19;
  __int128 v20;
  unsigned int v21;
  __int128 *v22;
  __int128 *v23;
  __int128 v24;
  __int128 v25;

  v5 = *a4;
  *a4 = 0;
  if ((_DWORD)v5)
  {
    if (a2)
    {
      v6 = 0;
      for (i = 0; i != v5; ++i)
      {
        v8 = 0;
        v9 = (float32x2_t *)&a3[2 * i];
        v10 = 1;
        v11 = a1 + 1;
        do
        {
          v12 = v11[-1];
          v13 = vmaxnm_f32(vsub_f32(*v11, v12), 0);
          v14 = vmul_lane_f32(v13, v13, 1);
          v15 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v9[1], *v11), (int8x8_t)*v11, (int8x8_t)v9[1]), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*v9, v12), (int8x8_t)*v9, (int8x8_t)v12)), 0);
          v16 = vmul_lane_f32(v15, v15, 1);
          v17 = v16.f32[0] < 0.00000011921 || v14.f32[0] < 0.00000011921;
          LODWORD(v18) = vdiv_f32(v16, v14).u32[0];
          if (v17)
            v18 = 0.0;
          if (v18 > a5)
            break;
          v10 = ++v8 < (unint64_t)a2;
          v11 += 4;
        }
        while (a2 != v8);
        if (!v10)
        {
          v19 = &a3[2 * v6];
          v20 = *(_OWORD *)v9[2].f32;
          *v19 = *(_OWORD *)v9->f32;
          v19[1] = v20;
          v6 = *a4 + 1;
          *a4 = v6;
        }
      }
    }
    else
    {
      v21 = 0;
      v22 = a3;
      do
      {
        v23 = &a3[2 * v21];
        v24 = *v22;
        v25 = v22[1];
        v22 += 2;
        *v23 = v24;
        v23[1] = v25;
        v21 = *a4 + 1;
        *a4 = v21;
        --v5;
      }
      while (v5);
    }
  }
  return 1;
}

unint64_t acNonMaxSuppressionHand(uint64_t a1, unint64_t a2, float a3, float a4)
{
  unint64_t v4;
  unint64_t v8;
  float *v9;
  int i;
  unint64_t v11;
  uint64_t v12;
  float *v13;
  float *v14;
  float *v15;
  int v16;
  float *v17;
  uint64_t v18;
  __int128 v19;
  _OWORD *v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;

  v4 = a2;
  if ((_DWORD)a2)
  {
    bmHeapsort(a1, a2, 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
    v8 = 0;
    v9 = (float *)(a1 + 48);
    for (i = -1; ; --i)
    {
      v11 = v8 + 1;
      if (v8 + 1 < v4)
        break;
      v4 = v8 + 1;
LABEL_4:
      v9 += 8;
      v8 = v11;
      if (v11 >= v4)
        return v4;
    }
    v12 = a1 + 32 * v8;
    v13 = (float *)(v12 + 8);
    v14 = (float *)(v12 + 12);
    v15 = (float *)(v12 + 4);
    v16 = v4 + i;
    v17 = v9;
    v4 = v11;
    while (1)
    {
      if (*(_DWORD *)(v12 + 16) == *(_DWORD *)v17)
      {
        v21 = *(v17 - 4);
        v22 = *(v17 - 3);
        if (*(float *)v12 >= v21)
          v23 = *(float *)v12;
        else
          v23 = *(v17 - 4);
        if (*v15 >= v22)
          v24 = *v15;
        else
          v24 = *(v17 - 3);
        v25 = *(v17 - 2);
        v26 = *(v17 - 1);
        if (*v13 >= v25)
          v27 = *(v17 - 2);
        else
          v27 = *v13;
        if (*v14 >= v26)
          v28 = *(v17 - 1);
        else
          v28 = *v14;
        v29 = fmaxf(v27 - v23, 0.0) * fmaxf(v28 - v24, 0.0);
        if (v29 >= 0.00000011921)
        {
          v30 = fmaxf(v25 - v21, 0.0) * fmaxf(v26 - v22, 0.0);
          v31 = fmaxf(*v13 - *(float *)v12, 0.0) * fmaxf(*v14 - *v15, 0.0);
          v32 = (float)(v31 + v30) - v29;
          if (v32 >= 0.00000011921)
            v33 = v29 / v32;
          else
            v33 = 0.0;
          if (v33 > a3)
            goto LABEL_8;
          if (v31 < v30)
            v30 = v31;
          v34 = v30 >= 0.00000011921 ? v29 / v30 : 0.0;
          if (v34 > a4)
            goto LABEL_8;
        }
        else if (a3 < 0.0 || a4 < 0.0)
        {
          goto LABEL_8;
        }
      }
      v18 = v4;
      v4 = (v4 + 1);
      v19 = *(_OWORD *)v17;
      v20 = (_OWORD *)(a1 + 32 * v18);
      *v20 = *((_OWORD *)v17 - 1);
      v20[1] = v19;
LABEL_8:
      v17 += 8;
      if (!--v16)
        goto LABEL_4;
    }
  }
  return v4;
}

unint64_t acNonMaxSuppressionHandIntra(uint64_t a1, unint64_t a2, char a3, _OWORD *a4, int a5, int a6, float a7, float a8, float a9)
{
  unint64_t v9;
  uint64_t v18;
  unint64_t v19;
  int i;
  unint64_t v21;
  unsigned int v22;
  uint64_t v23;
  float *v24;
  float *v25;
  float *v26;
  int v27;
  uint64_t v28;
  unsigned int v29;
  _OWORD *v30;
  __int128 v31;
  __int128 v32;
  _OWORD *v33;
  float *v34;
  float *v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float32x4_t v50;
  uint64_t v51;
  float32x4_t *v52;
  float32x4_t v53;
  int8x16_t v54;
  int8x16_t v55;
  unint64_t v56;
  int j;
  unint64_t v58;
  unsigned int v59;
  uint64_t v60;
  float *v61;
  float *v62;
  float *v63;
  int v64;
  uint64_t v65;
  unsigned int v66;
  _OWORD *v67;
  __int128 v68;
  __int128 v69;
  _OWORD *v70;
  float *v71;
  float *v72;
  float v73;
  float v74;
  float v75;
  float v76;
  float v77;
  float v78;
  float v79;
  float v80;
  float v81;
  float v82;
  float v83;
  float v84;
  float v85;
  float v86;

  v9 = a2;
  if ((_DWORD)a2)
  {
    bmHeapsort(a1, a2, 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
    v18 = 0;
    if ((a3 & 1) != 0)
    {
      v19 = 0;
      for (i = -1; ; --i)
      {
        v21 = v19 + 1;
        if (v19 + 1 >= v9)
        {
          v9 = v19 + 1;
          goto LABEL_5;
        }
        v22 = 0;
        v23 = a1 + 32 * v19;
        v24 = (float *)(v23 + 8);
        v25 = (float *)(v23 + 12);
        v26 = (float *)(v23 + 4);
        v27 = v9 + i;
        v28 = v18;
        v9 = v21;
        do
        {
          v34 = (float *)(a1 + v28);
          v35 = (float *)(a1 + v28 + 32);
          if (*(_DWORD *)(v23 + 16) != *(_DWORD *)(a1 + v28 + 48))
          {
LABEL_8:
            v29 = v9;
            v9 = (v9 + 1);
            v30 = (_OWORD *)a1;
            goto LABEL_9;
          }
          if (*(float *)v23 >= *v35)
            v36 = *(float *)v23;
          else
            v36 = *v35;
          v37 = v34[9];
          v38 = v34[10];
          if (*v26 >= v37)
            v39 = *v26;
          else
            v39 = v34[9];
          if (*v24 >= v38)
            v40 = v34[10];
          else
            v40 = *v24;
          v41 = v34[11];
          if (*v25 >= v41)
            v42 = v34[11];
          else
            v42 = *v25;
          v43 = fmaxf(v40 - v36, 0.0) * fmaxf(v42 - v39, 0.0);
          if (v43 >= 0.00000011921)
          {
            v44 = fmaxf(v38 - *v35, 0.0) * fmaxf(v41 - v37, 0.0);
            v45 = fmaxf(*v24 - *(float *)v23, 0.0) * fmaxf(*v25 - *v26, 0.0);
            v46 = (float)(v45 + v44) - v43;
            if (v46 >= 0.00000011921)
              v47 = v43 / v46;
            else
              v47 = 0.0;
            if (v47 <= a7)
            {
              if (v45 < v44)
                v44 = v45;
              v48 = v43 / v44;
              v49 = v44 >= 0.00000011921 ? v48 : 0.0;
              if (v49 <= a8)
                goto LABEL_8;
            }
          }
          else if (a7 >= 0.0 && a8 >= 0.0)
          {
            goto LABEL_8;
          }
          v29 = v22++;
          v30 = a4;
LABEL_9:
          v31 = *(_OWORD *)v35;
          v32 = *(_OWORD *)(a1 + v28 + 48);
          v33 = &v30[2 * v29];
          *v33 = v31;
          v33[1] = v32;
          v28 += 32;
          --v27;
        }
        while (v27);
        if (v22 >= 2
          && (float)((float)((float)(*v24 - *(float *)v23) * (float)(*v25 - *v26)) / (float)(a6 * a5)) < a9)
        {
          v50 = *(float32x4_t *)a4;
          v51 = v22 - 1;
          v52 = (float32x4_t *)(a4 + 2);
          do
          {
            v53 = *v52;
            v52 += 2;
            v54.i64[0] = v53.i64[0];
            v55.i64[0] = v50.i64[0];
            v55.i64[1] = v53.i64[1];
            v54.i64[1] = v50.i64[1];
            v50 = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v53, v50), v55, v54);
            --v51;
          }
          while (v51);
          *(float32x4_t *)v23 = v50;
        }
LABEL_5:
        v18 += 32;
        v19 = v21;
        if (v21 >= v9)
          return v9;
      }
    }
    v56 = 0;
    for (j = -1; ; --j)
    {
      v58 = v56 + 1;
      if (v56 + 1 < v9)
        break;
      v9 = v56 + 1;
LABEL_45:
      v18 += 32;
      v56 = v58;
      if (v58 >= v9)
        return v9;
    }
    v59 = 0;
    v60 = a1 + 32 * v56;
    v61 = (float *)(v60 + 8);
    v62 = (float *)(v60 + 12);
    v63 = (float *)(v60 + 4);
    v64 = v9 + j;
    v65 = v18;
    v9 = v58;
    while (1)
    {
      v71 = (float *)(a1 + v65);
      v72 = (float *)(a1 + v65 + 32);
      if (*(_DWORD *)(v60 + 16) == *(_DWORD *)(a1 + v65 + 48))
      {
        if (*(float *)v60 >= *v72)
          v73 = *(float *)v60;
        else
          v73 = *v72;
        v74 = v71[9];
        v75 = v71[10];
        if (*v63 >= v74)
          v76 = *v63;
        else
          v76 = v71[9];
        if (*v61 >= v75)
          v77 = v71[10];
        else
          v77 = *v61;
        v78 = v71[11];
        if (*v62 >= v78)
          v79 = v71[11];
        else
          v79 = *v62;
        v80 = fmaxf(v77 - v73, 0.0) * fmaxf(v79 - v76, 0.0);
        if (v80 >= 0.00000011921)
        {
          v81 = fmaxf(v75 - *v72, 0.0) * fmaxf(v78 - v74, 0.0);
          v82 = fmaxf(*v61 - *(float *)v60, 0.0) * fmaxf(*v62 - *v63, 0.0);
          v83 = (float)(v82 + v81) - v80;
          if (v83 >= 0.00000011921)
            v84 = v80 / v83;
          else
            v84 = 0.0;
          if (v84 > a7)
            goto LABEL_77;
          if (v82 < v81)
            v81 = v82;
          v85 = v80 / v81;
          v86 = v81 >= 0.00000011921 ? v85 : 0.0;
          if (v86 > a8)
          {
LABEL_77:
            v66 = v59++;
            v67 = a4;
            goto LABEL_49;
          }
        }
        else if (a7 < 0.0 || a8 < 0.0)
        {
          goto LABEL_77;
        }
      }
      v66 = v9;
      v9 = (v9 + 1);
      v67 = (_OWORD *)a1;
LABEL_49:
      v68 = *(_OWORD *)v72;
      v69 = *(_OWORD *)(a1 + v65 + 48);
      v70 = &v67[2 * v66];
      *v70 = v68;
      v70[1] = v69;
      v65 += 32;
      if (!--v64)
        goto LABEL_45;
    }
  }
  return v9;
}

unint64_t acNonMaxSuppressionLowLogitFbody(uint64_t a1, unint64_t a2, float a3, float a4)
{
  unint64_t v4;
  unint64_t v8;
  float *v9;
  int v10;
  unint64_t v11;
  uint64_t v12;
  float *v13;
  float *v14;
  float *v15;
  int v16;
  float *v17;
  uint64_t v18;
  __int128 v19;
  _OWORD *v20;
  int v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  BOOL v32;
  float v33;
  float v34;
  float v35;

  v4 = a2;
  if ((_DWORD)a2)
  {
    bmHeapsort(a1, a2, 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectSizeCompare);
    v8 = 0;
    v9 = (float *)(a1 + 48);
    v10 = -1;
    do
    {
      v11 = v8 + 1;
      if (v8 + 1 >= v4)
      {
        v4 = v8 + 1;
      }
      else
      {
        v12 = a1 + 32 * v8;
        v13 = (float *)(v12 + 8);
        v14 = (float *)(v12 + 12);
        v15 = (float *)(v12 + 4);
        v16 = v4 + v10;
        v17 = v9;
        v4 = v11;
        do
        {
          v21 = *(_DWORD *)(v12 + 16);
          if (v21 != *(_DWORD *)v17)
            goto LABEL_7;
          if (v21 == 11)
          {
            v22 = *v13;
            v23 = *v14;
            v24 = fmaxf(*v13 - *(float *)v12, 0.0) * fmaxf(*v14 - *v15, 0.0);
            v25 = *(v17 - 4);
            v26 = *(v17 - 3);
            if (*(float *)v12 >= v25)
              v27 = *(float *)v12;
            else
              v27 = *(v17 - 4);
            if (*v15 >= v26)
              v28 = *v15;
            else
              v28 = *(v17 - 3);
            v29 = *(v17 - 2);
            v30 = *(v17 - 1);
            if (v22 >= v29)
              v22 = *(v17 - 2);
            if (v23 >= v30)
              v23 = *(v17 - 1);
            v31 = fmaxf(v22 - v27, 0.0) * fmaxf(v23 - v28, 0.0);
            v32 = v31 < 0.00000011921 || v24 < 0.00000011921;
            v33 = v31 / v24;
            if (v32)
              v33 = 0.0;
            if (v33 <= a4)
            {
              v34 = 0.0;
              if (v31 >= 0.00000011921)
              {
                v35 = (float)(v24 + (float)(fmaxf(v29 - v25, 0.0) * fmaxf(v30 - v26, 0.0))) - v31;
                if (v35 >= 0.00000011921)
                  v34 = v31 / v35;
                else
                  v34 = 0.0;
              }
              if (v34 <= a3)
              {
LABEL_7:
                v18 = v4;
                v4 = (v4 + 1);
                v19 = *(_OWORD *)v17;
                v20 = (_OWORD *)(a1 + 32 * v18);
                *v20 = *((_OWORD *)v17 - 1);
                v20[1] = v19;
              }
            }
          }
          v17 += 8;
          --v16;
        }
        while (v16);
      }
      v9 += 8;
      --v10;
      v8 = v11;
    }
    while (v11 < v4);
  }
  return v4;
}

BOOL acCheckOverlapSecondFullBody(float32x2_t *a1, unsigned int a2, float32x2_t *a3, float a4, float32_t a5)
{
  uint64_t v5;
  BOOL v6;
  float32x2_t v7;
  float32x2_t v8;
  float32x2_t v9;
  float32x2_t v10;
  float32x2_t v11;
  BOOL v12;
  float v13;

  if (!a2)
    return 0;
  v5 = 0;
  v6 = 1;
  do
  {
    if (a1[3].f32[0] >= a5)
    {
      v7 = a3[1];
      v8 = vmaxnm_f32(vsub_f32(v7, *a3), 0);
      v9 = vmul_lane_f32(v8, v8, 1);
      v10 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v7, a1[1]), (int8x8_t)a1[1], (int8x8_t)v7), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*a3, *a1), (int8x8_t)*a3, (int8x8_t)*a1)), 0);
      v11 = vmul_lane_f32(v10, v10, 1);
      v12 = v11.f32[0] < 0.00000011921 || v9.f32[0] < 0.00000011921;
      LODWORD(v13) = vdiv_f32(v11, v9).u32[0];
      if (v12)
        v13 = 0.0;
      if (v13 > a4)
        break;
    }
    v6 = ++v5 < (unint64_t)a2;
    a1 += 4;
  }
  while (a2 != v5);
  return v6;
}

float32x2_t *acFbodyHlogitSuppressLlogit(float32x2_t *result, unsigned int a2, uint64_t a3, unsigned int *a4, float a5, float32_t a6)
{
  unint64_t v6;
  unint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  float32x2_t v11;
  float32x2_t v12;
  float32x2_t v13;
  BOOL v14;
  float32x2_t *v15;
  float32x2_t v16;
  float32x2_t v17;
  BOOL v18;
  float v19;
  _OWORD *v20;
  __int128 v21;
  uint64_t v22;
  unint64_t v23;

  v6 = *a4;
  if ((_DWORD)v6)
  {
    if (a2)
    {
      v7 = 0;
      v8 = *a4;
      LODWORD(v6) = 0;
      do
      {
        v9 = 0;
        v10 = a3 + 32 * v7;
        v11 = *(float32x2_t *)(v10 + 8);
        v12 = vmaxnm_f32(vsub_f32(v11, *(float32x2_t *)v10), 0);
        v13 = vmul_lane_f32(v12, v12, 1);
        v14 = 1;
        v15 = result;
        do
        {
          if (v15[3].f32[0] >= a6)
          {
            v16 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v11, v15[1]), (int8x8_t)v15[1], (int8x8_t)v11), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*(float32x2_t *)v10, *v15), *(int8x8_t *)v10, (int8x8_t)*v15)), 0);
            v17 = vmul_lane_f32(v16, v16, 1);
            v18 = v17.f32[0] < 0.00000011921 || v13.f32[0] < 0.00000011921;
            LODWORD(v19) = vdiv_f32(v17, v13).u32[0];
            if (v18)
              v19 = 0.0;
            if (v19 > a5)
              break;
          }
          v14 = ++v9 < (unint64_t)a2;
          v15 += 4;
        }
        while (a2 != v9);
        if (!v14)
        {
          v20 = (_OWORD *)(a3 + 32 * v6);
          v21 = *(_OWORD *)(v10 + 16);
          *v20 = *(_OWORD *)v10;
          v20[1] = v21;
          LODWORD(v6) = v6 + 1;
          v8 = *a4;
        }
        ++v7;
      }
      while (v7 < v8);
    }
    else
    {
      if (v6 >= 2)
      {
        v22 = v6 & 0xFFFFFFFE;
        if (v22 == v6)
          goto LABEL_21;
      }
      else
      {
        v22 = 0;
      }
      v23 = v22 | 1;
      if (v23 > v6)
        LODWORD(v6) = v23;
    }
  }
LABEL_21:
  *a4 = v6;
  return result;
}

const char *AcV1CommitHash()
{
  return "0000000";
}

const char *AcCommitHash()
{
  return "0000000";
}

uint64_t acMemBlockCoalesce(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char v6;
  _DWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  _DWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD *v13;
  unint64_t v14;
  uint64_t v15;
  _DWORD *v16;
  uint64_t v17;
  uint64_t v18;

  v2 = a2;
  if (a2 >= 2)
  {
    v4 = a2;
    bmHeapsort(a1, a2, 0xCuLL, (int (*)(uint64_t, uint64_t))sub_2358F349C);
    v5 = 0;
    v6 = 0;
    v7 = (_DWORD *)(a1 + 20);
    v8 = 1;
    do
    {
      v9 = (_QWORD *)(a1 + 12 * v5);
      v12 = *v9;
      v10 = v9 + 1;
      v11 = v12;
      v13 = v7;
      v14 = v8;
      do
      {
        v15 = *v10;
        if (v11 + v15 == *((_QWORD *)v13 - 1))
        {
          *v10 = *v13 + v15;
          *v13 = 0;
          v6 = 1;
        }
        ++v14;
        v13 += 3;
      }
      while (v14 < v2);
      ++v8;
      ++v5;
      v7 += 3;
    }
    while (v5 != (_DWORD)v2 - 1);
    if ((v6 & 1) != 0)
    {
      v2 = 0;
      v16 = (_DWORD *)(a1 + 8);
      do
      {
        if (*v16)
        {
          v17 = a1 + 12 * v2;
          v18 = *((_QWORD *)v16 - 1);
          v2 = (v2 + 1);
          *(_DWORD *)(v17 + 8) = *v16;
          *(_QWORD *)v17 = v18;
        }
        v16 += 3;
        --v4;
      }
      while (v4);
    }
  }
  return v2;
}

BOOL sub_2358F349C(_QWORD *a1, _QWORD *a2)
{
  return *a1 > *a2;
}

uint64_t acMemBlockCoalesceNoSort(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char v3;
  _DWORD *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _DWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _DWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _DWORD *v14;
  uint64_t v15;
  uint64_t v16;

  if (a2 >= 2)
  {
    v2 = 0;
    v3 = 0;
    v4 = (_DWORD *)(a1 + 20);
    v5 = 1;
    v6 = a2;
    do
    {
      v7 = (_QWORD *)(a1 + 12 * v2);
      v10 = *v7;
      v8 = v7 + 1;
      v9 = v10;
      v11 = v4;
      v12 = v5;
      do
      {
        v13 = *v8;
        if (v9 + v13 == *((_QWORD *)v11 - 1))
        {
          *v8 = *v11 + v13;
          *v11 = 0;
          v3 = 1;
        }
        ++v12;
        v11 += 3;
      }
      while (v12 < a2);
      ++v5;
      ++v2;
      v4 += 3;
    }
    while (v2 != (_DWORD)a2 - 1);
    if ((v3 & 1) != 0)
    {
      a2 = 0;
      v14 = (_DWORD *)(a1 + 8);
      do
      {
        if (*v14)
        {
          v15 = a1 + 12 * a2;
          v16 = *((_QWORD *)v14 - 1);
          a2 = (a2 + 1);
          *(_DWORD *)(v15 + 8) = *v14;
          *(_QWORD *)v15 = v16;
        }
        v14 += 3;
        --v6;
      }
      while (v6);
    }
  }
  return a2;
}

uint64_t acTrkGroupAssignGetTempBuffers(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4;
  int v5;
  unint64_t v6;
  int v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;

  v4 = 4 * a1 * a1;
  v5 = a1 * a1 + 12 * a1 + v4 + ((4 * a1) | 3) + 2 * (((4 * a1) | 3) + a1) + 9;
  if (a2)
  {
    v6 = (a2 + 3) & 0xFFFFFFFFFFFFFFFCLL;
    v7 = 4 * a1 - a2;
    v8 = (a2 + 3 + (v6 + v7)) & 0xFFFFFFFFFFFFFFFCLL;
    *(_QWORD *)a4 = v6;
    *(_QWORD *)(a4 + 8) = v8;
    v9 = (a2 + 3 + (v8 + v7)) & 0xFFFFFFFFFFFFFFFCLL;
    v10 = (a2 + 3 + (v9 + v7)) & 0xFFFFFFFFFFFFFFFCLL;
    *(_QWORD *)(a4 + 16) = v9;
    *(_QWORD *)(a4 + 24) = v10;
    v11 = (a2 + 3 + (v10 + v7)) & 0xFFFFFFFFFFFFFFFCLL;
    v12 = (a2 + 3 + (v11 + v7)) & 0xFFFFFFFFFFFFFFFCLL;
    v13 = v4 - a2;
    *(_QWORD *)(a4 + 32) = v11;
    *(_QWORD *)(a4 + 40) = v12;
    v14 = (a2 + 3 + (v12 + v13)) & 0xFFFFFFFFFFFFFFFCLL;
    v15 = a2 + (v14 + v13);
    *(_DWORD *)(a4 + 64) = v5;
    *(_QWORD *)(a4 + 48) = v14;
    *(_QWORD *)(a4 + 56) = v15;
    v16 = (a2 + 3 + (v5 - a2 + v15)) & 0xFFFFFFFFFFFFFFFCLL;
    *(_QWORD *)(a4 + 72) = v16;
    *(_DWORD *)(a4 + 80) = a1 & 0x3FFFFFFF;
    v17 = (a2 + 3 + (v16 + v7)) & 0xFFFFFFFFFFFFFFFCLL;
    v18 = (a2 + 3 + (v17 + v7)) & 0xFFFFFFFFFFFFFFFCLL;
    *(_QWORD *)(a4 + 88) = v17;
    *(_QWORD *)(a4 + 96) = v18;
    v19 = (a2 + 3 + (v18 + v7)) & 0xFFFFFFFFFFFFFFFCLL;
    *(_QWORD *)(a4 + 104) = v19;
    *(_QWORD *)(a4 + 112) = (a2 + 3 + (v19 + v7)) & 0xFFFFFFFFFFFFFFFCLL;
  }
  return (v5 + 8 * a1 * a1 + 40 * a1 + 36);
}

uint64_t acTrkGroupAssignTempBytes(int a1)
{
  return a1 * a1 + (8 * a1 + 52) * a1 + 4 * a1 * a1 + 2 * (((4 * a1) | 3) + a1) + ((4 * a1) | 3u) + 45;
}

uint64_t acTrkGroupAssign(uint64_t a1, int a2, uint64_t a3, int a4, int a5, int a6, uint64_t a7, _DWORD *a8, int *a9, unsigned int *a10, void *a11)
{
  unsigned int TempBuffers;
  _DWORD *v19;
  _DWORD *v20;
  uint64_t result;
  __int128 v22;
  unsigned __int8 *v23;
  unsigned int *v24;
  _DWORD *v25;
  int *v26;
  uint64_t v27;
  unsigned int v28;
  _DWORD *v29;
  uint64_t v30;
  _DWORD *v31;
  uint64_t v32;
  unsigned int v33;
  unsigned int v34;
  int v35;
  int *v36;
  int v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  int *v41;
  int v42;
  unsigned int v43;
  unint64_t v44;
  unsigned int v45;
  uint64_t v46;
  float v47;
  float v48;
  unint64_t v49;
  int v50;
  int v51;
  int32x4_t v52;
  unsigned int v53;
  _DWORD *v54;
  uint64_t v55;
  float32x2_t v56;
  float32x2_t v57;
  int v58;
  _DWORD *v59;
  float v60;
  unsigned int v61;
  unsigned int *v62;
  uint64_t v63;
  float v64;
  float v65;
  float v66;
  unsigned int v67;
  unsigned int v68;
  unsigned int v69;
  uint64_t v70;
  float32x2_t v71;
  float32x2_t v72;
  float v73;
  float v74;
  float v75;
  float v76;
  float32x2_t v77;
  float32x2_t v78;
  float32x2_t v79;
  BOOL v80;
  float v81;
  int v82;
  BOOL v83;
  uint64_t v84;
  unsigned int v85;
  int32x4_t *v86;
  int v87;
  unsigned int v88;
  unsigned int v89;
  uint64_t v90;
  int32x4_t *v91;
  int v92;
  unsigned int v93;
  unsigned int *v94;
  uint64_t v95;
  float v96;
  float32x2_t v97;
  const void *v98;
  uint64_t v99;
  unsigned int *v100;
  int *v101;
  _DWORD *v102;
  unsigned int *v103;
  unsigned int v104;
  unsigned int v105;
  unsigned int v106;
  unint64_t v107;
  unsigned int v108;
  float v109;
  int *v110;
  uint64_t v111;
  uint64_t v112;
  int *v113;
  int v114;
  int v115;
  unint64_t v116;
  unsigned int *v117;
  unsigned int v118;
  uint64_t v119;
  float v120;
  unsigned int v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  int *v125;
  int v126;
  int v127;
  float v128;
  unsigned int v129;
  uint64_t v130;
  uint64_t v131;
  unsigned int v132;
  int *v133;
  int v134;
  int v135;
  uint64_t v136;
  uint64_t v137;
  int v138;
  int *v139;
  int v140;
  uint64_t v141;
  int *v142;
  int v143;
  uint64_t v144;
  uint64_t v145;
  int *v146;
  int v147;
  unsigned int v148;
  unsigned int v149;
  double v150;
  unsigned int *v151;
  unsigned int v152;
  unint64_t v153;
  float v154;
  uint64_t v155;
  _DWORD *v156;
  uint64_t v157;
  uint64_t v158;
  _DWORD *v159;
  int v160;
  uint64_t v161;
  int v162;
  uint64_t v163;
  int v164;
  int v165;
  int v166;
  unint64_t v167;
  int v168;
  int v169;
  uint64_t v170;
  int *v171;
  int v172;
  uint64_t v173;
  int v174;
  _DWORD *v175;
  uint64_t v176;
  uint64_t v177;
  int v178;
  int v179;
  unint64_t v180;
  int v181;
  _BOOL4 v182;
  uint64_t v183;
  unsigned int v184;
  uint64_t v185;
  _DWORD *v186;
  int v187;
  int v188;
  uint64_t i;
  int v190;
  uint64_t v191;
  _DWORD *v192;
  int v193;
  int v194;
  unint64_t v195;
  int v196;
  unsigned int v197;
  float *v198;
  unsigned int v199;
  unsigned __int8 *v200;
  unsigned int *__dst;
  unsigned int *v203;
  unsigned int *v204;
  _DWORD *v205;
  void *v206;
  unsigned int v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  uint64_t v215;

  v215 = 0;
  v213 = 0u;
  v214 = 0u;
  v211 = 0u;
  v212 = 0u;
  v209 = 0u;
  v210 = 0u;
  v208 = 0u;
  TempBuffers = acTrkGroupAssignGetTempBuffers(a4 + a2, (uint64_t)a11, a3, (uint64_t)&v208);
  bzero(a11, TempBuffers);
  v20 = (_DWORD *)*((_QWORD *)&v208 + 1);
  v19 = (_DWORD *)v208;
  __dst = (unsigned int *)*((_QWORD *)&v209 + 1);
  result = v209;
  v22 = v210;
  v23 = (unsigned __int8 *)*((_QWORD *)&v211 + 1);
  v206 = (void *)v211;
  v24 = (unsigned int *)*((_QWORD *)&v212 + 1);
  v25 = (_DWORD *)*((_QWORD *)&v213 + 1);
  v26 = (int *)v214;
  v203 = (unsigned int *)v209;
  if (a2)
  {
    v27 = 0;
    v28 = 0;
    v29 = (_DWORD *)(a1 + 8);
    do
    {
      if (*v29 == a5)
        v19[v28++] = v27;
      v29 += 431;
      ++v27;
    }
    while (a2 != v27);
    if (!a4)
    {
      v31 = a8;
      if (!v28)
        return result;
      goto LABEL_220;
    }
    v200 = v23;
    v30 = a7;
    v31 = a8;
  }
  else
  {
    v31 = a8;
    if (!a4)
      return result;
    v200 = (unsigned __int8 *)*((_QWORD *)&v211 + 1);
    v30 = a7;
    v28 = 0;
  }
  v32 = 0;
  v33 = 0;
  v34 = 0;
  do
  {
    v36 = (int *)(a3 + 1724 * v32);
    if (v36[2] == a6)
    {
      v20[v34] = v32;
      v37 = v36[1];
      if (v37)
        *(_DWORD *)(v22 + 4 * v33++) = v37;
      ++v34;
      v38 = *v36;
      v39 = *a10;
      v40 = v39;
      v41 = a9;
      if ((_DWORD)v39)
      {
        while (1)
        {
          v42 = *v41;
          v41 += 3;
          if (v42 == v38)
            break;
          if (!--v40)
          {
            v35 = *a10;
            goto LABEL_12;
          }
        }
      }
      else
      {
        v35 = 0;
LABEL_12:
        *a10 = v39 + 1;
        a9[3 * v35] = v38;
      }
    }
    ++v32;
  }
  while (v32 != a4);
  v205 = v25;
  if (!v28 || !v34)
  {
    if (!v28)
    {
      if (v34)
      {
        v98 = v20;
        v99 = v34;
        v100 = __dst;
        result = (uint64_t)memcpy(__dst, v98, 4 * v34);
        v101 = a9;
        v102 = v205;
        v103 = v203;
        v104 = 0;
        v105 = 0;
        goto LABEL_199;
      }
      return result;
    }
LABEL_220:
    v183 = v28;
    result = (uint64_t)memcpy((void *)result, v19, 4 * v28);
    v103 = v203;
    goto LABEL_223;
  }
  v199 = v33;
  v204 = v24;
  v198 = (float *)v30;
  v43 = 0;
  v44 = 0;
  v45 = 0;
  if (v28 <= v34)
    v46 = v34;
  else
    v46 = v28;
  v47 = *(float *)(v30 + 4);
  v48 = *(float *)(v30 + 8);
  v197 = *(_DWORD *)(v30 + 12);
  v49 = v28;
  v50 = v46 & 0xFFFFFFF8;
  v207 = v46 - v28;
  v51 = (v46 - v28) & 0xFFFFFFF8;
  v52 = vdupq_n_s32(0x42C80000u);
  do
  {
    if (v44 < v34)
    {
      v53 = 0;
      v54 = v20;
      v55 = a3 + 1724 * v20[v44];
      v56 = *(float32x2_t *)(v55 + 12);
      v57 = vadd_f32(v56, *(float32x2_t *)(v55 + 20));
      v58 = *(_DWORD *)(v55 + 8);
      v59 = (_DWORD *)(v55 + 512);
      v60 = (float)(fmaxf(vsub_f32(v57, v56).f32[0], 0.0) * fmaxf(v57.f32[1] - v56.f32[1], 0.0)) + 0.00000011921;
      v61 = v45 + 1;
      v62 = v19;
      v63 = v28;
      do
      {
        v67 = v45;
        v68 = *v62++;
        v69 = v61;
        v70 = a1 + 1724 * v68;
        v71 = *(float32x2_t *)(v70 + 12);
        v72 = vadd_f32(v71, *(float32x2_t *)(v70 + 20));
        v73 = v72.f32[1];
        v74 = v71.f32[1];
        if ((vcgt_f32(v56, v71).u8[0] & 1) != 0)
          v75 = v56.f32[0];
        else
          v75 = v71.f32[0];
        if (v71.f32[1] < v56.f32[1])
          v74 = v56.f32[1];
        if ((vcgt_f32(v57, v72).u8[0] & 1) != 0)
          v76 = v72.f32[0];
        else
          v76 = v57.f32[0];
        v77 = (float32x2_t)vdup_lane_s32((int32x2_t)v72, 0);
        v77.f32[0] = v76;
        v78 = (float32x2_t)vdup_lane_s32((int32x2_t)v71, 0);
        if (v72.f32[1] >= v57.f32[1])
          v73 = v57.f32[1];
        v78.f32[0] = v75;
        v72.f32[0] = v73;
        v71.f32[0] = v74;
        v79 = vmul_f32(vmaxnm_f32(vsub_f32(v77, v78), 0), vmaxnm_f32(vsub_f32(v72, v71), 0));
        v80 = v79.f32[0] < 0.00000011921 || v79.f32[1] < 0.00000011921;
        v81 = v79.f32[0] / v79.f32[1];
        if (v80)
          v81 = 0.0;
        if (v58 == 9 && *v59)
          v81 = 0.0;
        if ((*(_DWORD *)(v70 + 8) & 0xFFFFFFFE) == 0xA)
          v64 = 0.0;
        else
          v64 = v48;
        if ((float)(v79.f32[1] / v60) >= v47)
          v65 = 0.0;
        else
          v65 = v64;
        v66 = v81 - v65;
        if (v66 >= 0.95)
          ++v53;
        *(float *)(*((_QWORD *)&v22 + 1) + 4 * v67) = 10.0 - v66;
        v45 = v67 + 1;
        ++v61;
        --v63;
      }
      while (v63);
      if (v28 >= v34)
      {
        v20 = v54;
        goto LABEL_79;
      }
      if (v207 < 8)
      {
        v89 = v28;
        v20 = v54;
      }
      else
      {
        v88 = -2 - v67;
        v89 = v28;
        v90 = ((_DWORD)v46 - v28) & 0xFFFFFFF8;
        v20 = v54;
        if (v88 >= (_DWORD)v46 - 1 - v28)
        {
          do
          {
            v91 = (int32x4_t *)(*((_QWORD *)&v22 + 1) + 4 * v69);
            *v91 = v52;
            v91[1] = v52;
            v69 += 8;
            v90 -= 8;
          }
          while (v90);
          v45 += v51;
          v89 = v28 + v51;
          if (v207 == v51)
          {
LABEL_79:
            if (v28 >= 2 && v53 >= 2)
            {
              v93 = v43;
              v94 = v19;
              v95 = v28;
              do
              {
                v96 = *(float *)(*((_QWORD *)&v22 + 1) + 4 * v93);
                if ((float)(10.0 - v96) >= 0.95)
                {
                  v97 = vmaxnm_f32(vsub_f32(vadd_f32(*(float32x2_t *)(a1 + 1724 * *v94 + 12), *(float32x2_t *)(a1 + 1724 * *v94 + 20)), *(float32x2_t *)(a1 + 1724 * *v94 + 12)), 0);
                  *(float *)(*((_QWORD *)&v22 + 1) + 4 * v93) = v96 - (float)(vmul_lane_f32(v97, v97, 1).f32[0] / v60);
                }
                ++v94;
                ++v93;
                --v95;
              }
              while (v95);
            }
            goto LABEL_27;
          }
        }
      }
      v92 = v46 - v89;
      do
      {
        *(_DWORD *)(*((_QWORD *)&v22 + 1) + 4 * v45++) = 1120403456;
        --v92;
      }
      while (v92);
      goto LABEL_79;
    }
    v82 = 0;
    v83 = __CFADD__(v45, v46 - 1);
    if (v46 < 8)
      goto LABEL_66;
    if (v83)
      goto LABEL_66;
    v84 = v46 & 0xFFFFFFF8;
    v85 = v45;
    do
    {
      v86 = (int32x4_t *)(*((_QWORD *)&v22 + 1) + 4 * v85);
      *v86 = v52;
      v86[1] = v52;
      v85 += 8;
      v84 -= 8;
    }
    while (v84);
    v45 += v50;
    v82 = v46 & 0xFFFFFFF8;
    if ((_DWORD)v46 != v50)
    {
LABEL_66:
      v87 = v46 - v82;
      do
      {
        *(_DWORD *)(*((_QWORD *)&v22 + 1) + 4 * v45++) = 1120403456;
        --v87;
      }
      while (v87);
    }
LABEL_27:
    ++v44;
    v43 += v46;
  }
  while (v44 != v46);
  if (v197)
  {
    v106 = 0;
    v107 = 0;
    while (2)
    {
      if (v107 >= v34)
        goto LABEL_94;
      v110 = (int *)(a3 + 1724 * v20[v107]);
      v111 = *a10;
      if ((_DWORD)v111)
      {
        v112 = 0;
        v113 = a9;
        while (1)
        {
          v114 = *v113;
          v113 += 3;
          if (v114 == *v110)
            break;
          if (v111 == ++v112)
            goto LABEL_100;
        }
        v115 = a9[3 * v112 + 1];
      }
      else
      {
LABEL_100:
        v115 = -1;
      }
      v116 = v49;
      v117 = v19;
      while (1)
      {
        v118 = *v117++;
        if (*(_DWORD *)(a1 + 1724 * v118) == v115)
          break;
        if (!--v116)
          goto LABEL_94;
      }
      if (v115 == -1)
        goto LABEL_94;
      v119 = 0;
      while (v115 != *(_DWORD *)(a1 + 1724 * v19[v119]))
      {
        if (v49 == ++v119)
        {
          LODWORD(v119) = -1;
          break;
        }
      }
      v120 = 3.4028e38;
      v121 = v106;
      v122 = v46;
      do
      {
        if (*(float *)(*((_QWORD *)&v22 + 1) + 4 * v121) < v120)
          v120 = *(float *)(*((_QWORD *)&v22 + 1) + 4 * v121);
        ++v121;
        --v122;
      }
      while (v122);
      LODWORD(v123) = 0;
      v124 = v46;
      do
      {
        if (vabds_f32(v120, *(float *)(*((_QWORD *)&v22 + 1) + 4 * (v106 + v122))) < 0.00000011921)
        {
          v26[v123] = v122;
          LODWORD(v123) = v123 + 1;
        }
        LODWORD(v122) = v122 + 1;
        --v124;
      }
      while (v124);
      if ((_DWORD)v123)
      {
        v123 = v123;
        v125 = v26;
        while (1)
        {
          v126 = *v125++;
          if (v126 == (_DWORD)v119)
            break;
          if (!--v123)
            goto LABEL_123;
        }
        v127 = v119;
      }
      else
      {
LABEL_123:
        v127 = *v26;
      }
      v128 = 3.4028e38;
      v129 = v119;
      v130 = v46;
      do
      {
        if (*(float *)(*((_QWORD *)&v22 + 1) + 4 * v129) < v128)
          v128 = *(float *)(*((_QWORD *)&v22 + 1) + 4 * v129);
        v129 += v46;
        --v130;
      }
      while (v130);
      LODWORD(v131) = 0;
      v132 = v119;
      do
      {
        if (vabds_f32(v128, *(float *)(*((_QWORD *)&v22 + 1) + 4 * v132)) < 0.00000011921)
        {
          v26[v131] = v130;
          LODWORD(v131) = v131 + 1;
        }
        ++v130;
        v132 += v46;
      }
      while (v46 != v130);
      if ((_DWORD)v131)
      {
        v131 = v131;
        v133 = v26;
        while (1)
        {
          v134 = *v133++;
          if (v134 == (_DWORD)v107)
            break;
          if (!--v131)
            goto LABEL_137;
        }
        v135 = v107;
      }
      else
      {
LABEL_137:
        v135 = *v26;
      }
      v136 = *a10;
      if (v127 == (_DWORD)v119 && v107 == v135)
      {
        if (!(_DWORD)v136)
          goto LABEL_90;
        v137 = 0;
        v138 = *v110;
        v139 = a9;
        while (1)
        {
          v140 = *v139;
          v139 += 3;
          if (v140 == v138)
            break;
          if (v136 == ++v137)
            goto LABEL_150;
        }
        a9[3 * v137 + 2] = 0;
        v144 = *a10;
        if (!(_DWORD)v144)
          goto LABEL_90;
LABEL_151:
        v145 = 0;
        v146 = a9;
        while (1)
        {
          v147 = *v146;
          v146 += 3;
          if (v147 == v138)
            break;
          if (v144 == ++v145)
            goto LABEL_90;
        }
        v108 = a9[3 * v145 + 2];
      }
      else
      {
        if ((_DWORD)v136)
        {
          v141 = 0;
          v138 = *v110;
          v142 = a9;
          while (1)
          {
            v143 = *v142;
            v142 += 3;
            if (v143 == v138)
              break;
            if (v136 == ++v141)
            {
LABEL_150:
              v144 = *a10;
              if (!(_DWORD)v144)
                goto LABEL_90;
              goto LABEL_151;
            }
          }
          ++a9[3 * v141 + 2];
          v144 = *a10;
          if ((_DWORD)v144)
            goto LABEL_151;
        }
LABEL_90:
        v108 = 0;
      }
      v109 = 0.5 - (float)((float)((float)v108 * 0.5) / (float)v197);
      if (v109 < 0.0)
        v109 = 0.0;
      *(float *)(*((_QWORD *)&v22 + 1) + 4 * (v119 + v46 * v107)) = *(float *)(*((_QWORD *)&v22 + 1)
                                                                                             + 4
                                                                                             * (v119 + v46 * v107))
                                                                                  - v109;
LABEL_94:
      ++v107;
      v106 += v46;
      if (v107 == v46)
        break;
      continue;
    }
  }
  memcpy(v206, *((const void **)&v22 + 1), 4 * (v46 * v46));
  bmMunkres(*((float **)&v22 + 1), v46, v200, v148, v204, v149, 0, v150);
  v151 = v204;
  v101 = a9;
  v105 = 0;
  v104 = 0;
  v152 = 0;
  v153 = 0;
  v154 = *v198;
  v103 = v203;
  v102 = v205;
  v100 = __dst;
  while (2)
  {
    v155 = v151[v153];
    if (v153 >= v49)
    {
      result = v20[v155];
      __dst[v152++] = result;
    }
    else if (v155 >= v34)
    {
      result = v19[v153];
      v103[v104++] = result;
    }
    else if ((float)(10.0 - *((float *)v206 + (v153 + v155 * v46))) <= v154)
    {
      v161 = *a10;
      v162 = *(_DWORD *)(a3 + 1724 * v20[v155]);
      v163 = v161;
      if ((_DWORD)v161)
      {
        while (1)
        {
          v164 = *v101;
          v101 += 3;
          if (v164 == v162)
            break;
          if (!--v163)
          {
            v165 = *a10;
            goto LABEL_188;
          }
        }
        v170 = 0;
        v171 = a9;
        while (1)
        {
          v172 = *v171;
          v171 += 3;
          if (v172 == v162)
            break;
          if (v161 == ++v170)
            goto LABEL_189;
        }
        *(_QWORD *)&a9[3 * v170 + 1] = 0xFFFFFFFFLL;
      }
      else
      {
        v165 = 0;
LABEL_188:
        *a10 = v161 + 1;
        a9[3 * v165] = v162;
      }
LABEL_189:
      __dst[v152] = v20[v155];
      result = v19[v153];
      ++v152;
      v103[v104++] = result;
      v102 = v205;
LABEL_190:
      v101 = a9;
      v151 = v204;
    }
    else
    {
      v156 = (_DWORD *)(a1 + 1724 * v19[v153]);
      result = a3 + 1724 * v20[v155];
      v157 = *a10;
      if ((_DWORD)v157)
      {
        v158 = 0;
        v159 = a9 + 1;
        while (*(v159 - 1) != *(_DWORD *)result || *v159 == *v156)
        {
          ++v158;
          v159 += 3;
          if (v157 == v158)
            goto LABEL_172;
        }
        *v159 = *v156;
        a9[3 * v158 + 2] = 0;
      }
LABEL_172:
      v160 = *(_DWORD *)(result + 4);
      if (v160)
      {
        v156[1] = v160;
        result = *(unsigned int *)(result + 4);
        v102 = v205;
        v205[v105++] = result;
        v103 = v203;
        goto LABEL_190;
      }
      v166 = v156[1];
      v103 = v203;
      v151 = v204;
      if (!v166)
        goto LABEL_186;
      if (!v199)
        goto LABEL_196;
      if (*(_DWORD *)v22 == v166)
      {
LABEL_186:
        v169 = (*a8)++;
        *(_DWORD *)(result + 4) = v169;
        v156[1] = v169;
        v102 = v205;
        v101 = a9;
      }
      else
      {
        v167 = 0;
        while (v199 - 1 != v167)
        {
          v168 = *(_DWORD *)(v22 + 4 + 4 * v167++);
          if (v168 == v166)
          {
            if (v167 >= v199)
              break;
            goto LABEL_186;
          }
        }
LABEL_196:
        *(_DWORD *)(result + 4) = v166;
        result = v156[1];
        v102 = v205;
        v205[v105++] = result;
        v101 = a9;
      }
    }
    if (++v153 != v46)
      continue;
    break;
  }
  if (v152)
  {
    v99 = v152;
    v31 = a8;
LABEL_199:
    v173 = 0;
    while (2)
    {
      v175 = (_DWORD *)(a3 + 1724 * v100[v173]);
      v176 = *a10;
      if ((_DWORD)v176)
      {
        v177 = 0;
        result = (uint64_t)v101;
        while (1)
        {
          v178 = *(_DWORD *)result;
          result += 12;
          if (v178 == *v175)
            break;
          if (v176 == ++v177)
            goto LABEL_206;
        }
        *(_QWORD *)&v101[3 * v177 + 1] = 0xFFFFFFFFLL;
        v179 = v175[1];
        if (!v105)
        {
LABEL_213:
          v182 = 0;
          if (!v179)
            goto LABEL_200;
LABEL_217:
          if (v182)
            goto LABEL_200;
          v102[v105++] = v179;
          goto LABEL_201;
        }
      }
      else
      {
LABEL_206:
        v179 = v175[1];
        if (!v105)
          goto LABEL_213;
      }
      if (*v102 != v179)
      {
        v180 = 0;
        result = v105 - 1;
        while (result != v180)
        {
          v181 = v102[++v180];
          if (v181 == v179)
            goto LABEL_216;
        }
        v180 = v105;
LABEL_216:
        v182 = v180 < v105;
        if (v179)
          goto LABEL_217;
      }
LABEL_200:
      v174 = (*v31)++;
      v175[1] = v174;
LABEL_201:
      if (++v173 == v99)
        goto LABEL_226;
      continue;
    }
  }
  v31 = a8;
LABEL_226:
  if (v104)
  {
    v183 = v104;
    if (v105)
    {
      for (i = 0; i != v183; ++i)
      {
        v191 = a1 + 1724 * v103[i];
        v194 = *(_DWORD *)(v191 + 4);
        v192 = (_DWORD *)(v191 + 4);
        v193 = v194;
        if (*v102 == v194)
          goto LABEL_229;
        v195 = 0;
        while (v105 - 1 != v195)
        {
          v196 = v102[++v195];
          if (v196 == v193)
          {
            if (!v193)
              goto LABEL_229;
            goto LABEL_238;
          }
        }
        v195 = v105;
        if (!v193)
          goto LABEL_229;
LABEL_238:
        if (v195 < v105)
        {
LABEL_229:
          v190 = (*v31)++;
          *v192 = v190;
        }
      }
      return result;
    }
    do
    {
LABEL_223:
      v184 = *v103++;
      v185 = a1 + 1724 * v184;
      v187 = *(_DWORD *)(v185 + 4);
      v186 = (_DWORD *)(v185 + 4);
      if (!v187)
      {
        v188 = (*v31)++;
        *v186 = v188;
      }
      --v183;
    }
    while (v183);
  }
  return result;
}

double acTrkGroupTemporalInfoReset(uint64_t a1)
{
  double result;

  result = NAN;
  *(_QWORD *)a1 = -1;
  *(_DWORD *)(a1 + 8) = 0;
  return result;
}

uint64_t pythonModuloForAsso(int a1, int a2)
{
  return ((a1 % a2 + a2) % a2);
}

_DWORD *acTrkHandChiralityTemporalSmoothing(_DWORD *result, uint64_t a2, int a3, int a4, int a5, char a6, unsigned int a7, char a8)
{
  int v8;
  unsigned int v9;
  int v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  char v21;
  int v22;
  _DWORD *v23;

  v8 = *(_DWORD *)(a2 + 8);
  if ((v8 & 0xFFFFFFFE) != 0xA)
    return result;
  if ((a6 & 1) != 0)
  {
    v9 = result[195];
    if (a7 < v9)
      v9 = a7;
    if (v9 >= 6)
      v10 = 6;
    else
      v10 = v9;
    if (!v10)
    {
      if (v8 == a3)
      {
LABEL_59:
        if (*(_DWORD *)(a2 + 28) < 2u)
          v21 = a8;
        else
          v21 = 0;
        if (a3 != 10 || (v21 & 1) != 0)
        {
          if (a3 != 11)
            v21 = 1;
          if ((v21 & 1) == 0)
            ++result[415];
        }
        else
        {
          ++result[414];
        }
        goto LABEL_69;
      }
LABEL_58:
      result[2] = v8;
      a3 = *(_DWORD *)(a2 + 8);
      goto LABEL_59;
    }
    v11 = result[142];
    if (v11 == 11)
    {
      v13 = 0;
      v12 = 1;
      if (v10 == 1)
        goto LABEL_53;
    }
    else if (v11 == 10)
    {
      v12 = 0;
      v13 = 1;
      if (v10 == 1)
        goto LABEL_53;
    }
    else
    {
      v13 = 0;
      v12 = 0;
      if (v10 == 1)
      {
LABEL_53:
        if (v8 == a3)
          goto LABEL_59;
        if (v13 <= v12)
        {
          if (v13 < v12)
            v8 = 11;
        }
        else
        {
          v8 = 10;
        }
        goto LABEL_58;
      }
    }
    v16 = result[152];
    if (v16 == 10)
    {
      ++v13;
    }
    else if (v16 == 11)
    {
      ++v12;
    }
    if (v10 != 2)
    {
      v17 = result[162];
      if (v17 == 10)
      {
        ++v13;
      }
      else if (v17 == 11)
      {
        ++v12;
      }
      if (v10 != 3)
      {
        v18 = result[172];
        if (v18 == 10)
        {
          ++v13;
        }
        else if (v18 == 11)
        {
          ++v12;
        }
        if (v10 != 4)
        {
          v19 = result[182];
          if (v19 == 10)
          {
            ++v13;
          }
          else if (v19 == 11)
          {
            ++v12;
          }
          if (v10 != 5)
          {
            v20 = result[192];
            if (v20 == 10)
            {
              ++v13;
            }
            else if (v20 == 11)
            {
              ++v12;
            }
          }
        }
      }
    }
    goto LABEL_53;
  }
  if (v8 != a3)
  {
    v14 = result[414];
    v15 = result[415];
    if (v14 <= v15)
    {
      if (v14 >= v15)
      {
LABEL_24:
        result[2] = v8;
        goto LABEL_69;
      }
      if (v8 == 10 && v14 + a4 >= v15)
        goto LABEL_25;
    }
    else if (v8 != 11 || v15 + a5 < v14)
    {
LABEL_25:
      result[2] = 10;
      goto LABEL_69;
    }
    v8 = 11;
    goto LABEL_24;
  }
LABEL_69:
  v22 = *(_DWORD *)(a2 + 8);
  if (v22 == 11)
  {
    v23 = result + 415;
  }
  else
  {
    if (v22 != 10)
      return result;
    v23 = result + 414;
  }
  ++*v23;
  return result;
}

float acTrkLabelCenterSizeSmoothing(int *__src, char *__dst, uint64_t a3, int a4, uint64_t a5, int a6, int a7, unsigned int a8, float *a9, float *a10, float *a11, float *a12)
{
  unint64_t v18;
  float *v19;
  float *v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  BOOL v24;
  char v25;
  int v26;
  uint64_t v27;
  float *v29;
  float *v30;
  float v31;
  float result;
  int v33;
  float v34;
  int v35;
  int v36;
  BOOL v38;
  _BOOL4 v40;
  float v41;
  _BOOL4 v42;
  float v43;
  float v44;
  char v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  _BOOL4 v57;
  _BOOL4 v58;
  BOOL v59;
  float v60;
  _BOOL4 v61;
  int v62;
  float v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float v69;
  float v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float v75;
  unsigned int v76;
  float v77;
  unsigned int v78;
  uint64_t v79;
  _DWORD *v80;
  uint64_t v81;
  float32x2_t v82;
  float32x2_t v83;
  float32x2_t v84;
  float32x2_t v85;
  float32x2_t v86;
  float32x2_t v87;
  float v88;
  float32x2_t v89;
  float v90;
  float v91;
  float v92;
  float v93;
  unsigned int v95;
  float v96;
  int v97;
  int v98;
  unsigned int v99;
  unsigned int v100;
  float v101;
  float v102;
  float v103;
  float v104;
  float v105;
  float v106;
  float v107;
  float v108;
  unsigned int v109;
  int v110;
  float v111;
  int v112;
  int v113;
  __int128 v114;

  v18 = 0;
  v19 = a11;
  v20 = a12;
  *a9 = *((float *)__dst + 5);
  *a10 = *((float *)__dst + 6);
  v21 = __src[2];
  v22 = 5;
  if ((v21 & 0xFFFFFFFE) == 0xA)
    v22 = 6;
  v23 = __src[195];
  v24 = ((0x13Fu >> v21) & 1) == 0 || v21 > 8;
  v25 = v24;
  v26 = v23 - 1;
  v27 = v22;
  if ((v25 & 1) == 0)
LABEL_10:
    v27 = qword_235915288[v21];
  while (v18 < *(unsigned int *)(a5 + 4 * v27 + 8) && v18 < v23)
  {
    v29 = (float *)&__src[10 * v26];
    *a9 = v29[135] + *a9;
    *a10 = v29[136] + *a10;
    ++v18;
    --v26;
    v27 = v22;
    if ((v25 & 1) == 0)
      goto LABEL_10;
  }
  v30 = (float *)(__dst + 12);
  v31 = (float)(v18 + 1);
  *a9 = *a9 / v31;
  result = *a10 / v31;
  *a10 = result;
  v33 = *((_DWORD *)__dst + 2);
  switch(v33)
  {
    case 0:
      if (!*((_BYTE *)__src + 100) || __dst[100])
        goto LABEL_79;
      v35 = *(_DWORD *)(a5 + 180);
      v36 = __src[10];
      v38 = v36 >= 0 && v36 < v35;
      v40 = v36 <= 360 - v35 || v36 > 360;
      v41 = *((float *)__dst + 3);
      v42 = 1;
      if (v41 >= 0.0)
      {
        v43 = *((float *)__dst + 4);
        if (v43 >= 0.0 && (float)((float)(v41 + *((float *)__dst + 5)) - (float)a8) <= 0.0)
          v42 = (float)((float)(v43 + *((float *)__dst + 6)) - (float)a8) > 0.0;
      }
      v44 = *((float *)__src + 208);
      if (v38)
      {
        v45 = v44 >= 0.03 || v42;
        if ((v45 & 1) != 0)
          goto LABEL_79;
      }
      else
      {
        if (v44 >= 0.03)
          v40 = 1;
        if (v40 || v42)
        {
LABEL_79:
          __src[204] = 0;
          if (!a4)
            goto LABEL_104;
LABEL_80:
          v79 = 0;
          v80 = (_DWORD *)(a3 + 8);
          while (*(v80 - 1) != a6 || *v80 != 1)
          {
            ++v79;
            v80 += 431;
            if (a4 == v79)
              goto LABEL_104;
          }
          v81 = a3 + 1724 * v79;
          v82 = *(float32x2_t *)(v81 + 12);
          v83 = vadd_f32(v82, *(float32x2_t *)(v81 + 20));
          v84 = *(float32x2_t *)(__dst + 12);
          v85 = *(float32x2_t *)(__dst + 20);
          v86 = vadd_f32(v84, v85);
          v87 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v83, v86), (int8x8_t)v86, (int8x8_t)v83), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v82, v84), (int8x8_t)v82, (int8x8_t)v84)), 0);
          v88 = vmul_lane_f32(v87, v87, 1).f32[0];
          if (v88 >= 0.00000011921)
          {
            v89 = vmul_f32(vmaxnm_f32(vsub_f32((float32x2_t)vzip1_s32((int32x2_t)v86, (int32x2_t)v83), (float32x2_t)vzip1_s32((int32x2_t)v84, (int32x2_t)v82)), 0), vmaxnm_f32(vsub_f32((float32x2_t)vzip2_s32((int32x2_t)v86, (int32x2_t)v83), (float32x2_t)vzip2_s32((int32x2_t)v84, (int32x2_t)v82)), 0));
            v90 = v89.f32[0] >= v89.f32[1] ? v89.f32[1] : v89.f32[0];
            if (v90 >= 0.00000011921 && (float)(v88 / v90) > 0.75)
            {
              v91 = vmul_lane_f32(v85, v85, 1).f32[0] / (float)((float)(a8 * a7) + 0.0001);
              v92 = (float)(v89.f32[0] + v89.f32[1]) - v88;
              v93 = v88 / v92;
              if (v92 < 0.00000011921)
                v93 = 0.0;
              if (v93 > 0.6 && v91 < 0.15)
              {
                *(_DWORD *)a9 = __src[5];
                *(_DWORD *)a10 = __src[6];
              }
            }
          }
LABEL_104:
          v96 = *((float *)__dst + 5);
          result = *((float *)__dst + 6);
          v97 = __dst[100];
          v98 = *((unsigned __int8 *)__src + 100);
          if (v98 == v97)
          {
            if (__dst[100])
            {
              __src[199] = 0;
              *((_QWORD *)__src + 100) = 0;
            }
            else
            {
              v100 = __src[197];
              if (v100 && v100 < __src[201] + *(_DWORD *)(a5 + 160))
              {
                __src[199] = v100;
                __src[200] = __src[130];
              }
            }
            *(_QWORD *)(__src + 197) = 0;
            if (__src[196] % *(_DWORD *)(a5 + 172))
            {
              v99 = 0;
              *(_DWORD *)a9 = __src[5];
              result = *((float *)__src + 6);
            }
            else
            {
              __src[196] = 0;
              if (!v97)
              {
                v101 = *((float *)__src + 207);
                v102 = v96 * result;
                v103 = *a9 * *a10;
                if (v101 <= v103)
                  v104 = v101 / v103;
                else
                  v104 = v103 / v101;
                v24 = v101 <= v102;
                v105 = v101 / v102;
                v106 = v102 / v101;
                if (v24)
                  v106 = v105;
                if (v106 <= v104)
                  v96 = *a9;
                *a9 = v96;
                if (v106 <= v104)
                  result = *a10;
                *a10 = result;
              }
              result = *a9;
              v107 = *a9 / (float)(*((float *)__src + 5) + 0.0001);
              v99 = 0;
              if (v107 <= 1.5)
                goto LABEL_134;
              v108 = (float)(1.0 / (float)(v107 + 0.0001)) + 0.05;
              if (v108 <= 0.2)
                v108 = 0.6;
              *a9 = result * v108;
              result = v108 * *a10;
            }
          }
          else
          {
            __src[196] = 0;
            __src[206] = 0;
            if (v97 && !v98)
            {
              v99 = __src[197] + 1;
              __src[197] = v99;
              __src[198] = 1;
              if (*(_BYTE *)(a5 + 164))
              {
                result = (float)((float)((float)__src[200]
                                       / (float)((float)__src[130] + 0.0001))
                               * (float)(1.0
                                       - (float)((float)__src[199]
                                               / (float)((float)*(unsigned int *)(a5 + 160)
                                                       + (float)__src[201]))))
                       * (float)*(unsigned int *)(a5 + 168);
                __src[201] = vcvtps_s32_f32(result);
              }
              else
              {
                __src[201] = 0;
              }
              goto LABEL_134;
            }
            v99 = 0;
            *(_QWORD *)(__src + 197) = 0;
            *a9 = v96;
          }
          *a10 = result;
LABEL_134:
          v109 = __src[201] + *(_DWORD *)(a5 + 160);
          v110 = __src[198];
          if (v99 < v109 && v110)
          {
            *(_DWORD *)a9 = __src[5];
            result = *((float *)__src + 6);
            *a10 = result;
            v110 = __src[198];
          }
          if (v99 < v109 && v110)
          {
            v111 = 0.0;
            if ((float)((float)(*a9 * *a10) / (float)((float)(a8 * a7) + 0.0001)) > 0.1)
              v111 = 0.5;
            *v19 = (float)((float)(v111 * (float)(*((float *)__src + 3) + (float)(*((float *)__src + 5) * 0.5)))
                         + (float)((float)(1.0 - v111)
                                 * (float)(*((float *)__dst + 3) + (float)(*((float *)__dst + 5) * 0.5))))
                 - (float)(*a9 * 0.5);
            result = (float)((float)(v111 * (float)(*((float *)__src + 4) + (float)(*((float *)__src + 6) * 0.5)))
                           + (float)((float)(1.0 - v111)
                                   * (float)(*((float *)__dst + 4) + (float)(*((float *)__dst + 6) * 0.5))))
                   - (float)(*a10 * 0.5);
            *v20 = result;
          }
          return result;
        }
      }
      v78 = __src[204];
      if (v78)
      {
        if (v78 >= __src[205])
          goto LABEL_79;
      }
      else
      {
        __src[205] = 5;
      }
      v112 = *((_DWORD *)__dst + 7);
      v113 = a7;
      v114 = *(_OWORD *)v30;
      v95 = a8;
      memcpy(__dst, __src, 0x200uLL);
      a7 = v113;
      a8 = v95;
      v20 = a12;
      v19 = a11;
      *(_OWORD *)v30 = v114;
      *((_DWORD *)__dst + 7) = v112;
      ++__src[204];
      if (!a4)
        goto LABEL_104;
      goto LABEL_80;
    case 1:
      v34 = 0.03;
      break;
    case 9:
      *a9 = *((float *)__dst + 5);
      result = *((float *)__dst + 6);
      *a10 = result;
      v34 = 0.1;
      break;
    default:
      return result;
  }
  v46 = v34;
  v48 = *((float *)__dst + 3);
  v47 = *((float *)__dst + 4);
  v49 = *((float *)__dst + 5);
  v50 = *((float *)__dst + 6);
  v51 = v48 + v49;
  v52 = v47 + v50;
  v54 = *((float *)__src + 3);
  v53 = *((float *)__src + 4);
  v55 = *((float *)__src + 5);
  v56 = v53 + *((float *)__src + 6);
  v57 = (float)(vabds_f32(v48, v54) / v49) <= v34;
  v58 = (float)(vabds_f32(v48 + v49, v54 + v55) / v49) <= v46;
  v59 = (float)(vabds_f32(v47, v53) / v50) > v46;
  v60 = vabds_f32(v47 + v50, v56) / v50;
  v61 = !v59 && v57;
  v62 = !v59 && v58;
  if (v60 > v46)
  {
    v57 = 0;
    v58 = 0;
  }
  if ((v62 + v61 + v57 + v58) >= 2)
  {
    v63 = v48 - v54;
    v64 = v51 - (float)(v54 + v55);
    v65 = v47 - v53;
    v66 = v52 - v56;
    v67 = v65 * v65;
    v68 = sqrtf(v67 + (float)(v63 * v63));
    v69 = sqrtf(v67 + (float)(v64 * v64));
    v70 = v66 * v66;
    v71 = (float)(v66 * v66) + (float)(v63 * v63);
    v72 = 3.4028e38;
    if (v68 < 3.4028e38)
    {
      v62 = 0;
      v57 = 0;
      v58 = 0;
      LOBYTE(v61) = 1;
      v72 = v68;
    }
    v73 = v70 + (float)(v64 * v64);
    v74 = sqrtf(v71);
    if (v69 < v72)
    {
      LOBYTE(v61) = 0;
      v57 = 0;
      v58 = 0;
      v62 = 1;
      v72 = v69;
    }
    v75 = sqrtf(v73);
    if (v74 < v72)
    {
      LOBYTE(v61) = 0;
      v62 = 0;
      v58 = 0;
      v57 = 1;
      v72 = v74;
    }
    if (v75 < v72)
    {
      LOBYTE(v61) = 0;
      v62 = 0;
      v57 = 0;
      v58 = 1;
    }
  }
  if (v33 == 9)
    v76 = 5;
  else
    v76 = *(_DWORD *)(a5 + 184);
  if (__src[130] % v76)
    result = *((float *)__src + 6);
  else
    v55 = *a9;
  if (!v61)
  {
    if (v62)
    {
      *v30 = v51 - v55;
    }
    else
    {
      if (v58)
      {
        v77 = v52 - result;
        *((float *)__dst + 3) = v51 - v55;
      }
      else
      {
        if (!v57)
          return result;
        v77 = v52 - result;
      }
      *((float *)__dst + 4) = v77;
    }
  }
  *((float *)__dst + 5) = v55;
  *((float *)__dst + 6) = result;
  *a9 = v55;
  *a10 = result;
  return result;
}

uint64_t acTrkTermClassIndex(unsigned int a1)
{
  if (a1 < 9 && ((0x13Fu >> a1) & 1) != 0)
    return dword_2359151EC[a1];
  if ((a1 & 0xFFFFFFFE) == 0xA)
    return 6;
  return 5;
}

BOOL acTrkCheckBoxCornerNearImageBoundary(unsigned int a1, unsigned int a2, float a3, float a4, float a5, float a6)
{
  uint64_t v6;

  v6 = 1;
  if (a3 >= 0.0 && a4 >= 0.0 && (float)((float)(a3 + a5) - (float)a2) <= 0.0)
    return (float)((float)(a4 + a6) - (float)a1) > 0.0;
  return v6;
}

uint64_t acTrkFacialAttrTemporalSmoothing(uint64_t result, uint64_t a2, int a3, uint64_t a4, unsigned int a5, unsigned int a6, float a7)
{
  int v7;
  _OWORD *v8;
  int v9;
  int v10;
  char v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  unsigned int v16;
  int v17;
  int v18;
  char v20;
  int v21;
  char v22;
  char v23;
  float v24;
  uint64_t v25;
  int v26;
  unsigned int v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  int v35;
  unsigned int v36;
  uint64_t v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v45;
  uint64_t v46;
  float v47;
  int v48;
  int v49;
  int v50;
  int v51;
  float v54;
  float v55;
  float v56;
  int v57;
  uint64_t v58;
  float v59;
  float v60;
  float v62;
  __int128 v63;

  v7 = *(_DWORD *)(a2 + 8);
  if (!v7)
  {
    v63 = *(_OWORD *)(a2 + 12);
    v13 = *(_DWORD *)(a2 + 40);
    v14 = *(unsigned __int8 *)(a2 + 100);
    v15 = *(unsigned int *)(result + 780);
    if ((_DWORD)v15)
      v16 = v15 - 1;
    else
      v16 = 0;
    if (!*(_BYTE *)(a2 + 100))
    {
      v33 = result + 40 * v16;
      v34 = *(_DWORD *)(v33 + 556);
      v18 = *(_DWORD *)(v33 + 564);
      goto LABEL_86;
    }
    v17 = *(_DWORD *)(a2 + 44);
    v18 = *(_DWORD *)(a2 + 420);
    if (*(_DWORD *)(result + 788) < (*(_DWORD *)(result + 804) + *(_DWORD *)(a4 + 160))
      && *(_DWORD *)(result + 792) != 0)
    {
      v14 = 0;
      *(_OWORD *)(result + 132) = 0u;
      *(_DWORD *)(result + 48) = -361;
      *(_DWORD *)(result + 128) = -1;
      *(_DWORD *)(result + 392) = -1;
      *(_DWORD *)(result + 420) = -1;
      *(_QWORD *)(result + 424) = 0;
      *(_QWORD *)(result + 440) = 0;
      *(_QWORD *)(result + 432) = 0;
      *(int32x4_t *)(result + 32) = vdupq_n_s32(0xFFFFFE97);
      *(_OWORD *)(result + 52) = 0u;
      *(_OWORD *)(result + 68) = 0u;
      *(_OWORD *)(result + 84) = 0u;
      *(_OWORD *)(result + 100) = 0u;
      *(_OWORD *)(result + 112) = 0u;
      *(_OWORD *)(result + 148) = 0u;
      *(_OWORD *)(result + 164) = 0u;
      *(_OWORD *)(result + 180) = 0u;
      *(_OWORD *)(result + 196) = 0u;
      *(_OWORD *)(result + 212) = 0u;
      *(_OWORD *)(result + 228) = 0u;
      *(_OWORD *)(result + 244) = 0u;
      *(_OWORD *)(result + 260) = 0u;
      *(_OWORD *)(result + 276) = 0u;
      *(_OWORD *)(result + 292) = 0u;
      *(_OWORD *)(result + 308) = 0u;
      *(_OWORD *)(result + 324) = 0u;
      *(_OWORD *)(result + 340) = 0u;
      *(_OWORD *)(result + 356) = 0u;
      *(_OWORD *)(result + 372) = 0u;
      *(_DWORD *)(result + 388) = 0;
      *(_QWORD *)(result + 404) = 0;
      *(_QWORD *)(result + 412) = 0;
      *(_QWORD *)(result + 396) = 0;
      *(_OWORD *)(result + 452) = 0u;
      *(_OWORD *)(result + 468) = 0u;
      *(_OWORD *)(result + 484) = 0u;
      *(_OWORD *)(result + 496) = 0u;
    }
    if (*(float *)(a4 + 44) >= a7 && *(_BYTE *)(result + 40 * v16 + 548))
    {
      v20 = *(_BYTE *)(a2 + 100) != 0;
      v21 = *(_DWORD *)(a2 + 40);
      v22 = v21 < 0x5B;
      v23 = (v21 - 270) < 0x5B;
      v24 = (float)v21;
      v25 = *(unsigned int *)(a4 + 40);
      if ((_DWORD)v25)
      {
        if (v15 >= (int)v25 - 1)
          v26 = v25 - 1;
        else
          v26 = v15;
        v27 = v26 + 1;
        v28 = v26 + 2;
        v29 = v15;
        while (v29)
        {
          v30 = result + 40 * --v29;
          v20 &= *(_BYTE *)(v30 + 548);
          LODWORD(v30) = *(_DWORD *)(v30 + 552);
          v22 &= v30 < 0x5B;
          v23 &= (v30 - 270) < 0x5B;
          v24 = v24 + (float)(int)v30;
          if (!--v25)
          {
            v27 = v28;
            break;
          }
        }
      }
      else
      {
        v27 = 1;
      }
      if ((v20 & 1) != 0 && (v23 & 1) + (v22 & 1) == 1)
      {
        v35 = (int)(float)(v24 / (float)v27);
        *(_DWORD *)(result + 40) = v35;
        if (v35 >= 0x5B)
          v35 -= 360;
        if (v35 >= 90)
          v35 = 90;
        if (v35 <= -90)
          v35 = -90;
        v36 = (int)(float)((float)((float)(v35 + 90) / 45.0) + 0.5) % 5;
        if (v36 > 0xFFFFFFFA)
          v36 += 5;
        *(_DWORD *)(result + 32) = AcDetNode::m_kFacePoseYawCenters[v36];
      }
    }
    v37 = result + 40 * v16;
    v38 = *(_DWORD *)(v37 + 556);
    if (!v14)
    {
      *(_DWORD *)(result + 420) = -1;
      v18 = *(_DWORD *)(result + 40 * v16 + 564);
      v34 = v38;
      goto LABEL_86;
    }
    if (v38 != -361)
    {
      if (v17 > 500)
      {
        v34 = *(_DWORD *)(v37 + 556);
        if (v38 < 500)
        {
LABEL_61:
          if ((-858993459 * *(_DWORD *)(result + 784)) < 0x33333334 || a3 == -361)
            v45 = v34;
          else
            v45 = a3;
          *(_DWORD *)(result + 44) = v45;
          if (*(_DWORD *)(result + 28) >= 2u)
          {
            v46 = result + 40 * v16;
            v47 = (float)(*(float *)(v46 + 540) / (float)a6) * (float)(*(float *)(v46 + 544) / (float)a5);
            v48 = *(_DWORD *)(v46 + 552);
            if (v48 >= 91)
              v48 = 360 - v48;
            v49 = *(_DWORD *)(v46 + 560);
            v50 = 360 - v49;
            if (v49 < 61)
              v50 = *(_DWORD *)(v46 + 560);
            v51 = *(_DWORD *)(v46 + 564);
            if (v47 > 0.0013021 && v48 <= 29 && v50 < 25)
            {
              if (fabsf((float)v51 + 1.0) > 0.0001)
              {
                v54 = (float)*(int *)(a2 + 420) * 0.1;
                v55 = v54 + (float)((float)v51 * 0.9);
                v56 = *(float *)(result + 1696);
                if (fabsf(v56) >= 0.0001 || fabsf(*(float *)(result + 1700)) >= 0.0001)
                {
                  if (v55 >= (float)(v56 + 0.16))
                  {
                    v60 = v54 + (float)((float)(v56 + 0.16) * 0.9);
                    v59 = *(float *)(result + 1700);
                  }
                  else
                  {
                    v59 = *(float *)(result + 1700);
                    v60 = -1.0;
                    if (v55 <= (float)(v59 + -0.16))
                      v60 = v54 + (float)((float)(v59 + -0.16) * 0.9);
                  }
                  if (v60 <= 1.0001 && v60 >= -0.0001)
                    v55 = v60;
                  if (v56 >= v55)
                    v56 = v55;
                  *(float *)(result + 1696) = v56;
                  if (v59 >= v55)
                    v62 = v59;
                  else
                    v62 = v55;
                  *(float *)(result + 1700) = v62;
                }
                else
                {
                  *(float *)(result + 1696) = v55;
                  *(float *)(result + 1700) = v55;
                }
                v18 = (int)v55;
                *(_DWORD *)(result + 420) = (int)v55;
              }
              goto LABEL_86;
            }
            goto LABEL_85;
          }
          v51 = *(_DWORD *)(result + 40 * v16 + 564);
          if (fabsf((float)v51 + 1.0) > 0.0001)
          {
LABEL_85:
            *(_DWORD *)(result + 420) = v51;
            v18 = v51;
          }
LABEL_86:
          if (*(_DWORD *)(result + 8) == 9)
          {
            *(_OWORD *)(result + 532) = v63;
            *(_BYTE *)(result + 548) = v14;
            *(_DWORD *)(result + 564) = v18;
            *(_DWORD *)(result + 556) = v34;
            *(_DWORD *)(result + 552) = v13;
            *(_DWORD *)(result + 568) = 0;
            goto LABEL_88;
          }
          if (v15 >= 6)
          {
            *(_OWORD *)(result + 732) = v63;
            *(_BYTE *)(result + 748) = v14;
            *(_DWORD *)(result + 764) = v18;
            *(_DWORD *)(result + 756) = v34;
            *(_DWORD *)(result + 752) = v13;
            *(_DWORD *)(result + 768) = 0;
            return result;
          }
          v58 = result + 40 * v15;
          *(_OWORD *)(v58 + 532) = v63;
          *(_BYTE *)(v58 + 548) = v14;
          *(_DWORD *)(v58 + 564) = v18;
          *(_DWORD *)(v58 + 556) = v34;
          *(_DWORD *)(v58 + 552) = v13;
          *(_DWORD *)(v58 + 568) = 0;
LABEL_92:
          v57 = *(_DWORD *)(result + 780) + 1;
          goto LABEL_93;
        }
      }
      if (v17 >= 500 || v38 <= 500)
      {
        v39 = v38 - 1080;
        if (v38 <= 500)
          v39 = v38;
        v40 = v39 + 360;
        if ((float)((float)v39 + 0.0001) >= 0.0)
          v40 = v39;
        v34 = v17;
        if ((v40 - 121) <= 0x76)
        {
          v41 = v17 - 1080;
          if (v38 <= 500)
            v41 = v17;
          if ((float)((float)v41 + 0.0001) < 0.0)
            v41 += 360;
          v42 = v41 - v40;
          if (v42 < 11)
          {
            v43 = v38 - 10;
            if (v42 >= -10)
              v34 = v17;
            else
              v34 = v43;
          }
          else
          {
            v34 = v38 + 10;
          }
        }
        goto LABEL_61;
      }
    }
    v34 = v17;
    goto LABEL_61;
  }
  v8 = (_OWORD *)(a2 + 12);
  v9 = *(_DWORD *)(a2 + 40);
  v10 = *(_DWORD *)(a2 + 44);
  v11 = *(_BYTE *)(a2 + 100);
  v12 = *(_DWORD *)(a2 + 420);
  if (*(_DWORD *)(result + 8) != 9)
  {
    v31 = *(_DWORD *)(result + 780);
    if (v31 >= 6)
    {
      *(_OWORD *)(result + 732) = *v8;
      *(_BYTE *)(result + 748) = v11;
      *(_DWORD *)(result + 764) = v12;
      *(_DWORD *)(result + 756) = v10;
      *(_DWORD *)(result + 752) = v9;
      *(_DWORD *)(result + 768) = v7;
      return result;
    }
    v32 = result + 40 * v31;
    *(_OWORD *)(v32 + 532) = *v8;
    *(_BYTE *)(v32 + 548) = v11;
    *(_DWORD *)(v32 + 564) = v12;
    *(_DWORD *)(v32 + 556) = v10;
    *(_DWORD *)(v32 + 552) = v9;
    *(_DWORD *)(v32 + 568) = v7;
    goto LABEL_92;
  }
  *(_OWORD *)(result + 532) = *v8;
  *(_BYTE *)(result + 548) = v11;
  *(_DWORD *)(result + 564) = v12;
  *(_DWORD *)(result + 556) = v10;
  *(_DWORD *)(result + 552) = v9;
  *(_DWORD *)(result + 568) = v7;
LABEL_88:
  v57 = 1;
LABEL_93:
  *(_DWORD *)(result + 780) = v57;
  return result;
}

uint64_t acTrkObjectAssocTrkDetGetTempBuffers(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  unint64_t v12;
  int v13;
  int v14;
  int v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;

  v4 = 12 * a1;
  v5 = 4 * a1;
  v6 = (4 * a1) | 3;
  v7 = a1 * a1 + 12 * a1 + 4 * a1 * a1 + v6 + 2 * (v6 + a1) + 9;
  v8 = 4 * a1 * a1;
  v9 = 8 * a1;
  v10 = a1 << 9;
  if (a2)
  {
    v11 = a2 + 3;
    v12 = (a2 + 3) & 0xFFFFFFFFFFFFFFFCLL;
    v13 = v5 - a2;
    *(_QWORD *)a4 = v12;
    *(_QWORD *)(a4 + 8) = (a2 + 3 + (v12 + v5 - a2)) & 0xFFFFFFFFFFFFFFFCLL;
    *(_DWORD *)(a4 + 32) = v7;
    *(_QWORD *)(a4 + 16) = (a2 + 3 + (((_DWORD)v12 + v5 + 3) & 0xFFFFFFFC) + v8 - (_DWORD)a2) & 0xFFFFFFFFFFFFFFFCLL;
    *(_QWORD *)(a4 + 24) = a2 + (((((_DWORD)v12 + v5 + 3) & 0xFFFFFFFC) + v8 + 3) & 0xFFFFFFFC) + v8 - (_DWORD)a2;
    *(_QWORD *)(a4 + 40) = (a2
                          + 3
                          + v7
                          + (((((_DWORD)v12 + v5 + 3) & 0xFFFFFFFC) + v8 + 3) & 0xFFFFFFFC)
                          + v8
                          - (_DWORD)a2) & 0xFFFFFFFFFFFFFFFCLL;
    *(_DWORD *)(a4 + 48) = a1 & 0x3FFFFFFF;
    *(_QWORD *)(a4 + 56) = (a2
                          + 3
                          + ((v7 + (((((_DWORD)v12 + v5 + 3) & 0xFFFFFFFC) + v8 + 3) & 0xFFFFFFFC) + v8 + 3) & 0xFFFFFFFC)
                          + v5
                          - (_DWORD)a2) & 0xFFFFFFFFFFFFFFFCLL;
    *(_QWORD *)(a4 + 64) = (a2
                          + 3
                          + ((((v7 + (((((_DWORD)v12 + v5 + 3) & 0xFFFFFFFC) + v8 + 3) & 0xFFFFFFFC) + v8 + 3) & 0xFFFFFFFC)
                            + v5
                            + 3) & 0xFFFFFFFC)
                          + v9
                          - (_DWORD)a2) & 0xFFFFFFFFFFFFFFFCLL;
    v14 = a1 - a2;
    *(_QWORD *)(a4 + 72) = (a2
                          + 3
                          + ((((((v7 + (((((_DWORD)v12 + v5 + 3) & 0xFFFFFFFC) + v8 + 3) & 0xFFFFFFFC) + v8 + 3) & 0xFFFFFFFC)
                              + v5
                              + 3) & 0xFFFFFFFC)
                            + v9
                            + 3) & 0xFFFFFFFC)
                          + v4
                          - (_DWORD)a2) & 0xFFFFFFFFFFFFFFFCLL;
    *(_QWORD *)(a4 + 80) = a2
                         + ((((((((v7 + (((((_DWORD)v12 + v5 + 3) & 0xFFFFFFFC) + v8 + 3) & 0xFFFFFFFC) + v8 + 3) & 0xFFFFFFFC)
                               + v5
                               + 3) & 0xFFFFFFFC)
                             + v9
                             + 3) & 0xFFFFFFFC)
                           + v4
                           + 3) & 0xFFFFFFFC)
                         + v5
                         - (_DWORD)a2;
    v15 = 32 * a1 - a2;
    *(_QWORD *)(a4 + 88) = a2
                         + a1
                         - (_DWORD)a2
                         + ((((((((v7 + (((((_DWORD)v12 + v5 + 3) & 0xFFFFFFFC) + v8 + 3) & 0xFFFFFFFC) + v8 + 3) & 0xFFFFFFFC)
                               + v5
                               + 3) & 0xFFFFFFFC)
                             + v9
                             + 3) & 0xFFFFFFFC)
                           + v4
                           + 3) & 0xFFFFFFFC)
                         + v5;
    *(_QWORD *)(a4 + 96) = (a2
                          + 3
                          + a1
                          - (_DWORD)a2
                          + a1
                          + ((((((((v7 + (((((_DWORD)v12 + v5 + 3) & 0xFFFFFFFC) + v8 + 3) & 0xFFFFFFFC) + v8 + 3) & 0xFFFFFFFC)
                                + v5
                                + 3) & 0xFFFFFFFC)
                              + v9
                              + 3) & 0xFFFFFFFC)
                            + v4
                            + 3) & 0xFFFFFFFC)
                          + v5) & 0xFFFFFFFFFFFFFFFCLL;
    v16 = (a2
         + 3
         + ((a1
           + a1
           + ((((((((v7 + (((((_DWORD)v12 + v5 + 3) & 0xFFFFFFFC) + v8 + 3) & 0xFFFFFFFC) + v8 + 3) & 0xFFFFFFFC)
                 + v5
                 + 3) & 0xFFFFFFFC)
               + v9
               + 3) & 0xFFFFFFFC)
             + v4
             + 3) & 0xFFFFFFFC)
           + v5
           + 3) & 0xFFFFFFFC)
         + v15) & 0xFFFFFFFFFFFFFFFCLL;
    v17 = a2 + (v16 + v15);
    *(_DWORD *)(a4 + 120) = a1;
    *(_QWORD *)(a4 + 104) = v16;
    *(_QWORD *)(a4 + 112) = v17;
    v18 = (a2 + 3 + (a1 - a2 + v17)) & 0xFFFFFFFFFFFFFFFCLL;
    *(_QWORD *)(a4 + 128) = v18;
    *(_QWORD *)(a4 + 136) = (a2 + 3 + (v18 + v5 - a2)) & 0xFFFFFFFFFFFFFFFCLL;
    v19 = (a2 + 3 + (((_DWORD)v18 + v5 + 3) & 0xFFFFFFFC) + v8 - (_DWORD)a2) & 0xFFFFFFFFFFFFFFFCLL;
    *(_DWORD *)(a4 + 160) = v7;
    *(_QWORD *)(a4 + 144) = v19;
    *(_QWORD *)(a4 + 152) = a2 + (v19 + v8 - a2);
    v20 = (a2 + 3 + (v7 - a2 + v19 + v8)) & 0xFFFFFFFFFFFFFFFCLL;
    *(_QWORD *)(a4 + 168) = v20;
    *(_DWORD *)(a4 + 176) = a1 & 0x3FFFFFFF;
    v21 = (a2 + 3 + (v20 + v5 - a2)) & 0xFFFFFFFFFFFFFFFCLL;
    *(_QWORD *)(a4 + 184) = v21;
    *(_QWORD *)(a4 + 192) = (a2 + 3 + (v21 + v5 - a2)) & 0xFFFFFFFFFFFFFFFCLL;
    v22 = (a2 + 3 + (((_DWORD)v21 + v5 + 3) & 0xFFFFFFFC) + v5 - (_DWORD)a2) & 0xFFFFFFFFFFFFFFFCLL;
    *(_QWORD *)(a4 + 200) = v22;
    *(_QWORD *)(a4 + 208) = (a2 + 3 + (v22 + v10 - a2)) & 0xFFFFFFFFFFFFFFFCLL;
    v23 = (a2 + 3 + (((_DWORD)v22 + v10 + 3) & 0xFFFFFFFC) + v5 - (_DWORD)a2) & 0xFFFFFFFFFFFFFFFCLL;
    *(_DWORD *)(a4 + 248) = v7;
    *(_QWORD *)(a4 + 232) = (a2 + 3 + (v23 + v8 - a2)) & 0xFFFFFFFFFFFFFFFCLL;
    *(_QWORD *)(a4 + 240) = a2 + (((_DWORD)v23 + v8 + 3) & 0xFFFFFFFC) + v8 - (_DWORD)a2;
    *(_QWORD *)(a4 + 256) = (a2 + 3 + v7 - (_DWORD)a2 + (((_DWORD)v23 + v8 + 3) & 0xFFFFFFFC) + v8) & 0xFFFFFFFFFFFFFFFCLL;
    *(_DWORD *)(a4 + 264) = a1 & 0x3FFFFFFF;
    *(_QWORD *)(a4 + 272) = (a2
                           + 3
                           + ((v7 + (((_DWORD)v23 + v8 + 3) & 0xFFFFFFFC) + v8 + 3) & 0xFFFFFFFC)
                           + v5
                           - (_DWORD)a2) & 0xFFFFFFFFFFFFFFFCLL;
    *(_QWORD *)(a4 + 280) = (a2
                           + 3
                           + ((((v7 + (((_DWORD)v23 + v8 + 3) & 0xFFFFFFFC) + v8 + 3) & 0xFFFFFFFC) + v5 + 3) & 0xFFFFFFFC)
                           + v5
                           - (_DWORD)a2) & 0xFFFFFFFFFFFFFFFCLL;
    v24 = (a2
         + 3
         + ((((((v7 + (((_DWORD)v23 + v8 + 3) & 0xFFFFFFFC) + v8 + 3) & 0xFFFFFFFC) + v5 + 3) & 0xFFFFFFFC) + v5 + 3) & 0xFFFFFFFC)
         + v5
         - (_DWORD)a2) & 0xFFFFFFFFFFFFFFFCLL;
    v25 = a2
        + ((((((((v7 + (((_DWORD)v23 + v8 + 3) & 0xFFFFFFFC) + v8 + 3) & 0xFFFFFFFC) + v5 + 3) & 0xFFFFFFFC) + v5 + 3) & 0xFFFFFFFC)
          + v5
          + 3) & 0xFFFFFFFC)
        + v5
        - (_DWORD)a2;
    *(_QWORD *)(a4 + 288) = v24;
    *(_QWORD *)(a4 + 296) = v25;
    v26 = (v11 + (v14 + v25)) & 0xFFFFFFFFFFFFFFFCLL;
    *(_QWORD *)(a4 + 216) = v26;
    *(_QWORD *)(a4 + 224) = v23;
    *(_QWORD *)(a4 + 304) = (v11 + (v26 + v13)) & 0xFFFFFFFFFFFFFFFCLL;
  }
  return (v10 | 0x112) + (a1 << 6) + v4 + v9 - v6 + 8 * v6 + v5 + 6 * ((v8 | 3u) + v6) + 3 * v7;
}

uint64_t acTrkObjectAssocTrkDetTempBytes(int a1)
{
  int v1;

  v1 = (4 * a1) | 3;
  return (3 * (a1 * a1 + 12 * a1 + 4 * a1 * a1 + v1 + 2 * (v1 + a1))
                      + 600 * a1
                      - v1
                      + 8 * v1
                      + 6 * (v1 + 4 * a1 * a1)
                      + 319);
}

float acTrkObjectPriority(unsigned int a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3;
  float v4;
  BOOL v5;

  v3 = *(unsigned int *)(a3 + 8);
  v4 = 2.0;
  if ((_DWORD)v3)
    v5 = 0;
  else
    v5 = *(_BYTE *)(a3 + 100) == 0;
  if (!v5)
    v4 = flt_2359151A0[v3];
  return (float)(1.0 - (float)((float)(*(float *)(a3 + 20) * *(float *)(a3 + 24)) / (float)((float)a1 * (float)a2)))
       + v4;
}

const unsigned int *acTrkObectSurplusExchange(const unsigned int *a1, unsigned int *a2)
{
  const unsigned int *result;
  unsigned int v3;
  unsigned int v4;
  unsigned int *v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int *v12;

  v4 = a1[1];
  result = a1 + 1;
  v3 = v4;
  v7 = a2[1];
  v5 = a2 + 1;
  v6 = v7;
  v8 = result[1];
  v9 = v5[1];
  if (v3 < v7 && v8 > v9)
  {
    v12 = v5 + 1;
    goto LABEL_11;
  }
  if (v3 > v6 && v8 < v9)
  {
    v3 = result[1];
    v12 = v5;
    ++result;
    ++v5;
LABEL_11:
    *v12 = v6 - v3 + v9;
    *v5 = *result;
  }
  return result;
}

uint64_t acTrkObjectPickDet(unsigned int a1, unsigned int a2, uint64_t a3, unsigned int a4, int a5, uint64_t a6, int a7, uint64_t a8, unsigned int *a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, char a14, unsigned int a15)
{
  unint64_t v19;
  float *v20;
  float v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  float v25;
  BOOL v26;
  uint64_t v27;
  float *v28;
  float v29;
  uint64_t v30;
  uint64_t v31;
  float v32;
  BOOL v33;
  uint64_t v34;
  uint64_t result;
  unsigned int v36;
  unsigned int v37;
  _DWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unsigned int v43;
  int v44;
  float *v45;
  unint64_t v46;
  float *v47;
  unsigned int v48;
  uint64_t v49;
  unsigned int v50;
  float *v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  int v55;
  int v56;
  _DWORD *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  _BYTE *v62;
  BOOL v64;
  _BYTE *v65;
  unsigned int v66;
  unsigned int v67;
  uint64_t v68;
  unsigned int *v69;
  _DWORD *v70;
  BOOL v71;
  uint64_t v72;
  uint64_t v73;
  unsigned int v74;
  int v75;
  int v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _DWORD *v80;
  int v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  int *v85;
  int v86;
  uint64_t v87;
  unsigned int v88;
  uint64_t v89;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  int v94;
  _BYTE v95[28];
  _QWORD v96[6];

  v96[4] = *MEMORY[0x24BDAC8D0];
  LODWORD(v19) = *a9;
  if (*a9)
  {
    v19 = 0;
    v20 = (float *)(a10 + 8);
    do
    {
      v22 = *(unsigned int *)(a8 + 4 * v19);
      v23 = a6 + (v22 << 9);
      if (*(_DWORD *)(v23 + 28) < 2u)
      {
        v21 = 100.0;
      }
      else
      {
        v24 = *(unsigned int *)(v23 + 8);
        v25 = 2.0;
        if ((_DWORD)v24)
          v26 = 0;
        else
          v26 = *(_BYTE *)(v23 + 100) == 0;
        if (!v26)
          v25 = flt_2359151A0[v24];
        v21 = (float)(1.0
                    - (float)((float)(*(float *)(v23 + 20) * *(float *)(v23 + 24)) / (float)((float)a1 * (float)a2)))
            + v25;
      }
      *((_DWORD *)v20 - 2) = v22;
      *(v20 - 1) = *(float *)(a12 + 4 * v22);
      *v20 = v21;
      v20 += 3;
      ++v19;
    }
    while (v19 < *a9);
  }
  if (a7)
  {
    v27 = 0;
    v28 = (float *)(a6 + 100);
    do
    {
      if (*(_DWORD *)(a12 + 4 * v27) != -1)
      {
        v31 = *((unsigned int *)v28 - 23);
        v32 = 2.0;
        if ((_DWORD)v31)
          v33 = 0;
        else
          v33 = *(_BYTE *)v28 == 0;
        if (!v33)
          v32 = flt_2359151A0[v31];
        v29 = 1.0 - (float)((float)(*(v28 - 20) * *(v28 - 19)) / (float)((float)a1 * (float)a2));
        v30 = a10 + 12 * v19;
        *(_DWORD *)v30 = v27;
        *(_DWORD *)(v30 + 4) = *(_DWORD *)(a12 + 4 * v27);
        *(float *)(v30 + 8) = v29 + v32;
        LODWORD(v19) = v19 + 1;
      }
      ++v27;
      v28 += 128;
    }
    while (a7 != v27);
  }
  v34 = v19;
  result = bmHeapsort(a10, v19, 0xCuLL, (int (*)(uint64_t, uint64_t))sub_2358F6050);
  if (a14)
  {
    if ((_DWORD)v34)
    {
      v36 = 0;
      v37 = 0;
      v38 = (_DWORD *)(a10 + 4);
      v39 = v34;
      do
      {
        v40 = *(v38 - 1);
        if (!*(_DWORD *)(a6 + (v40 << 9) + 8))
        {
          ++v37;
          if (*v38 == -1)
          {
            v41 = a6 + (v40 << 9);
            if (*(_BYTE *)(v41 + 100) && v36 <= 0x1C)
              dword_2563089B0[v36++] = *(float *)(v41 + 24) * *(float *)(v41 + 20);
          }
        }
        v38 += 3;
        --v39;
      }
      while (v39);
    }
    else
    {
      v37 = 0;
      v36 = 0;
    }
    if (!a4)
      goto LABEL_53;
    v43 = 0;
    v44 = 0;
    v45 = (float *)(a3 + 24);
    v46 = 1;
    do
    {
      if (!*((_DWORD *)v45 - 4))
      {
        ++v44;
        v47 = &flt_256308A28[2 * v43];
        *v47 = *v45 * *(v45 - 1);
        ++v43;
        *((_DWORD *)v47 + 1) = v46 - 1;
      }
      if (v46 >= a4)
        break;
      ++v46;
      v45 += 431;
    }
    while (v43 < 0x1D);
    if (v44 == 10 && v37 > 0xA && v37 <= 0xF)
    {
      if (v36)
      {
        result = bmHeapsort((uint64_t)flt_256308A28, v43, 8uLL, (int (*)(uint64_t, uint64_t))sub_2358F6064);
        if (v43)
        {
          v48 = v43 - 1;
          if (v43 - 1 >= v36 - 1)
            v48 = v36 - 1;
          v49 = v48 + 1;
          v50 = v43 - 1;
          v51 = dword_2563089B0;
          do
          {
            if (*v51 <= (float)(flt_256308A28[2 * v50] * (float)a15))
              break;
            *(_DWORD *)(a3 + 1724 * LODWORD(flt_256308A28[2 * v50-- + 1]) + 528) = 2;
            ++v51;
            --v49;
          }
          while (v49);
        }
      }
    }
  }
  if (!a4)
  {
LABEL_53:
    memset((char *)v96 + 4, 0, 24);
    *(_OWORD *)v95 = xmmword_2359151D0;
    *(_OWORD *)&v95[12] = *(__int128 *)((char *)&xmmword_2359151D0 + 12);
    v53 = a5;
    v55 = 0;
    v56 = 0;
    v91 = 0;
    v92 = 0;
    v94 = 0;
    v93 = 0;
    goto LABEL_54;
  }
  v52 = a4;
  v53 = a5;
  if (a4 == 1)
  {
    v54 = 0;
    v55 = 0;
  }
  else
  {
    v75 = 0;
    v76 = 0;
    v54 = a4 & 0xFFFFFFFE;
    v77 = a3;
    v78 = v54;
    do
    {
      if (*(_DWORD *)(v77 + 528) != 2)
        ++v75;
      if (*(_DWORD *)(v77 + 2252) != 2)
        ++v76;
      v77 += 3448;
      v78 -= 2;
    }
    while (v78);
    v55 = v76 + v75;
    if (v54 == a4)
      goto LABEL_107;
  }
  v79 = a4 - v54;
  v80 = (_DWORD *)(a3 + 1724 * v54 + 528);
  do
  {
    if (*v80 != 2)
      ++v55;
    v80 += 431;
    --v79;
  }
  while (v79);
LABEL_107:
  v81 = a5 - v55 - *a9;
  if (v81 < 0)
  {
    v82 = 0;
    do
    {
      v83 = a3 + 1724 * v82;
      if (*(_DWORD *)(v83 + 528) != 2)
      {
        v84 = v34;
        v85 = (int *)(a10 + 4);
        if ((_DWORD)v34)
        {
          while (1)
          {
            v86 = *v85;
            v85 += 3;
            if (v82 == v86)
              break;
            if (!--v84)
              goto LABEL_113;
          }
        }
        else
        {
LABEL_113:
          *(_DWORD *)(v83 + 528) = 2;
          ++v81;
          --v55;
        }
      }
      ++v82;
    }
    while (v82 < a4 && v81 < 0);
  }
  v56 = 0;
  memset(v96, 0, 28);
  *(_OWORD *)v95 = xmmword_2359151D0;
  *(_OWORD *)&v95[12] = *(__int128 *)((char *)&xmmword_2359151D0 + 12);
  v91 = 0;
  v92 = 0;
  v94 = 0;
  v93 = 0;
  do
  {
    result = *(unsigned int *)(a3 + 528);
    if ((_DWORD)result != 2)
    {
      v88 = *(_DWORD *)(a3 + 8);
      v89 = 2;
      switch(v88)
      {
        case 0u:
          v87 = 0;
          ++v56;
          goto LABEL_118;
        case 1u:
          ++HIDWORD(v96[0]);
          v87 = 1;
          goto LABEL_118;
        case 2u:
        case 3u:
        case 4u:
        case 5u:
        case 8u:
          goto LABEL_122;
        case 9u:
          ++HIDWORD(v96[1]);
          v87 = 3;
          goto LABEL_118;
        default:
          if ((v88 & 0xFFFFFFFE) == 0xA)
            v89 = 4;
          else
            v89 = 5;
LABEL_122:
          ++*((_DWORD *)v96 + v89);
          if (v88 > 9)
            goto LABEL_133;
          if (((1 << v88) & 0x128) != 0 || ((1 << v88) & 0x14) != 0)
          {
            v87 = 2;
          }
          else if (v88 == 9)
          {
            v87 = 3;
          }
          else
          {
LABEL_133:
            if ((v88 & 0xFFFFFFFE) == 0xA)
              v87 = 4;
            else
              v87 = 5;
          }
LABEL_118:
          result = 4 * v87;
          ++*(_DWORD *)((char *)&v91 + result);
          break;
      }
    }
    a3 += 1724;
    --v52;
  }
  while (v52);
LABEL_54:
  LODWORD(v96[0]) = v56;
  if ((_DWORD)v34)
  {
    v57 = (_DWORD *)(a10 + 4);
    v58 = v34;
    do
    {
      if (*v57 == -1)
      {
        v60 = *(unsigned int *)(a6 + ((unint64_t)*(v57 - 1) << 9) + 8);
        if (v60 < 0xA && ((0x33Fu >> v60) & 1) != 0)
        {
          v59 = qword_235915210[v60];
        }
        else if ((v60 & 0xFFFFFFFE) == 0xA)
        {
          v59 = 4;
        }
        else
        {
          v59 = 5;
        }
        ++*((_DWORD *)&v91 + v59);
      }
      v57 += 3;
      --v58;
    }
    while (v58);
  }
  v61 = HIDWORD(v91);
  v62 = &v95[8];
  if (HIDWORD(v91) <= 7 && v92 > 8)
  {
    v65 = &v95[8];
    v62 = &v95[4];
    goto LABEL_77;
  }
  v64 = HIDWORD(v91) < 9 || v92 > 7;
  v61 = v92;
  v65 = &v95[4];
  if (!v64)
  {
LABEL_77:
    *(_DWORD *)v65 = 16 - v61;
    *(_DWORD *)v62 = v61;
    v66 = 0;
    if (!(_DWORD)v34)
      goto LABEL_95;
    goto LABEL_78;
  }
  v66 = 0;
  if (!(_DWORD)v34)
    goto LABEL_95;
LABEL_78:
  v67 = v53 - v55;
  v68 = v34 - 1;
  v69 = (unsigned int *)(a6 + 8);
  v70 = (_DWORD *)(a10 + 4);
  do
  {
    if (*v70 == -1)
    {
      v72 = *v69;
      if (v72 < 0xA && ((0x33Fu >> v72) & 1) != 0)
      {
        v73 = qword_235915210[v72];
      }
      else if ((v72 & 0xFFFFFFFE) == 0xA)
      {
        v73 = 4;
      }
      else
      {
        v73 = 5;
      }
      v74 = *((_DWORD *)v96 + v73);
      if (v74 < *(_DWORD *)&v95[4 * v73])
      {
        *(_DWORD *)(a8 + 4 * v66++) = *(v70 - 1);
        *((_DWORD *)v96 + v73) = v74 + 1;
      }
    }
    LODWORD(result) = *a9;
    if (v67 >= *a9)
      result = result;
    else
      result = v67;
    v71 = v66 == (_DWORD)result || v68-- == 0;
    v69 += 128;
    v70 += 3;
  }
  while (!v71);
LABEL_95:
  *a9 = v66;
  return result;
}

BOOL sub_2358F6050(uint64_t a1, uint64_t a2)
{
  return *(float *)(a1 + 8) > *(float *)(a2 + 8);
}

BOOL sub_2358F6064(float *a1, float *a2)
{
  return *a1 > *a2;
}

uint64_t acTrkCategoryLimitationIndex(unsigned int a1)
{
  if (a1 < 0xA && ((0x33Fu >> a1) & 1) != 0)
    return dword_235915260[a1];
  if ((a1 & 0xFFFFFFFE) == 0xA)
    return 4;
  return 5;
}

uint64_t acFilterMultiFaceinSameUbody(uint64_t a1, unsigned int a2, float32x2_t *a3, uint64_t a4, uint64_t a5, unsigned int *a6, float *a7, char *__b, int a9, int a10)
{
  uint64_t result;
  unsigned int v19;
  float32x2_t *v20;
  uint64_t v21;
  float32x2_t v22;
  float32x2_t v23;
  float32_t v24;
  float32x2_t *v25;
  uint64_t v26;
  uint64_t v27;
  float32x2_t *v28;
  float32x2_t *v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  float32x2_t v33;
  float32x2_t v34;
  float32x2_t v35;
  int32x2_t v36;
  float v37;
  float v38;
  float v39;
  int v40;
  float32x2_t *v41;
  float32x2_t v42;
  float32x2_t v43;
  float v44;
  float v45;
  float32x2_t v46;
  float v47;
  float32x2_t v48;
  float v49;
  BOOL v50;
  float v51;
  unint64_t v52;
  unint64_t v53;
  unsigned int v54;
  char v55;
  _DWORD *v56;
  uint64_t v57;
  uint64_t v58;
  float32x2_t *v59;
  float v60;
  float v61;
  uint64_t v62;
  float32x2_t v63;
  float32x2_t v64;
  float32x2_t v65;
  int32x2_t v66;
  float v67;
  float v68;
  float v69;
  int v70;
  float32x2_t *v71;
  float32x2_t v72;
  float32x2_t v73;
  float v74;
  float v75;
  float32x2_t v76;
  float v77;
  float32x2_t v78;
  float v79;
  BOOL v80;
  float v81;
  unsigned int v82;
  unint64_t v83;
  unsigned int v84;
  uint64_t v85;
  int v86;
  int64x2_t v87;
  int32x4_t v88;
  char *v89;
  uint64_t v90;
  int32x4_t v91;
  __int128 v92;
  int64x2_t v93;
  int64x2_t v94;
  int64x2_t v95;
  int64x2_t v96;
  uint64_t v97;
  char *v98;
  int v99;
  BOOL v100;

  result = (uint64_t)memset(__b, 255, 4 * a2);
  if (a2)
  {
    v19 = 0;
    v20 = (float32x2_t *)(a1 + 20);
    v21 = a2;
    do
    {
      if (v20[-2].i32[1] == 1)
      {
        v22 = v20[-1];
        v23 = vadd_f32(v22, *v20);
        v24 = (float)v20[1].u32[0] / 1000.0;
        v25 = &a3[4 * v19];
        *v25 = v22;
        v25[1] = v23;
        ++v19;
        v25[2].i32[0] = 2;
        v25[3].f32[0] = v24;
      }
      v20 = (float32x2_t *)((char *)v20 + 1724);
      --v21;
    }
    while (v21);
    if (v19)
    {
      v26 = 0;
      while (1)
      {
        v27 = 0;
        result = 0;
        v28 = &a3[4 * v26];
        v29 = v28 + 1;
        v30 = -1;
        do
        {
          v31 = a1 + 1724 * v27;
          if (!*(_DWORD *)(v31 + 8))
          {
            v32 = 0;
            v33 = *(float32x2_t *)(v31 + 12);
            v34 = vadd_f32(v33, *(float32x2_t *)(v31 + 20));
            v35 = vsub_f32(v34, v33);
            v36 = vcgtz_f32(v35);
            v37 = v35.f32[1];
            if ((v36.i8[4] & 1) == 0)
              v37 = 0.0;
            if ((v36.i8[0] & 1) == 0)
              v35.f32[0] = 0.0;
            v38 = v35.f32[0] * v37;
            v39 = -1.0;
            v40 = -1;
            v41 = a3 + 1;
            do
            {
              v42 = v41[-1];
              v43 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*v41, v34), (int8x8_t)v34, (int8x8_t)*v41), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v42, v33), (int8x8_t)v42, (int8x8_t)v33)), 0);
              v44 = vmul_lane_f32(v43, v43, 1).f32[0];
              v45 = 0.0;
              if (v44 >= 0.00000011921)
              {
                v46 = vsub_f32(*v41, v42);
                v46.f32[0] = (float)(v38 + (float)(fmaxf(v46.f32[0], 0.0) * fmaxf(v46.f32[1], 0.0))) - v44;
                v47 = v44 / v46.f32[0];
                if (v46.f32[0] >= 0.00000011921)
                  v45 = v47;
                else
                  v45 = 0.0;
              }
              if (v45 > v39)
              {
                v40 = v32;
                v39 = v45;
              }
              ++v32;
              v41 += 4;
            }
            while (v19 != v32);
            if (v26 == v40)
            {
              v48 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*v29, v34), (int8x8_t)v34, (int8x8_t)*v29), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*v28, v33), (int8x8_t)*v28, (int8x8_t)v33)), 0);
              v49 = vmul_lane_f32(v48, v48, 1).f32[0];
              v50 = v49 < 0.00000011921 || v38 < 0.00000011921;
              v51 = v49 / v38;
              if (v50)
                v51 = 0.0;
              if (v51 > *a7)
                v30 = v27;
              result = (v51 > *a7) | result;
            }
          }
          ++v27;
        }
        while (v27 != a2);
        if ((result & 1) == 0)
          goto LABEL_9;
        v52 = *a6;
        result = v30;
        if (!(_DWORD)v52)
          break;
        v53 = 0;
        v54 = 0;
        v55 = 0;
        v56 = (_DWORD *)(a1 + 1724 * result + 840);
        do
        {
          v57 = *(unsigned int *)(a5 + 4 * v53);
          v58 = a4 + (v57 << 9);
          v60 = *(float *)(v58 + 20);
          v59 = (float32x2_t *)(v58 + 20);
          v61 = v60;
          if (!v59[-2].i32[1]
            && (float)((float)(v61 * v59->f32[1]) / (float)((float)(a10 * a9) + 0.0001)) < 0.08)
          {
            v62 = 0;
            v63 = *(float32x2_t *)(a4 + (v57 << 9) + 12);
            v64 = vadd_f32(v63, *v59);
            v65 = vsub_f32(v64, v63);
            v66 = vcgtz_f32(v65);
            v67 = v65.f32[1];
            if ((v66.i8[4] & 1) == 0)
              v67 = 0.0;
            if ((v66.i8[0] & 1) == 0)
              v65.f32[0] = 0.0;
            v68 = v65.f32[0] * v67;
            v69 = -1.0;
            v70 = -1;
            v71 = a3 + 1;
            do
            {
              v72 = v71[-1];
              v73 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*v71, v64), (int8x8_t)v64, (int8x8_t)*v71), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v72, v63), (int8x8_t)v72, (int8x8_t)v63)), 0);
              v74 = vmul_lane_f32(v73, v73, 1).f32[0];
              v75 = 0.0;
              if (v74 >= 0.00000011921)
              {
                v76 = vsub_f32(*v71, v72);
                v76.f32[0] = (float)(v68 + (float)(fmaxf(v76.f32[0], 0.0) * fmaxf(v76.f32[1], 0.0))) - v74;
                v77 = v74 / v76.f32[0];
                if (v76.f32[0] >= 0.00000011921)
                  v75 = v77;
                else
                  v75 = 0.0;
              }
              if (v75 > v69)
              {
                v70 = v62;
                v69 = v75;
              }
              ++v62;
              v71 += 4;
            }
            while (v19 != v62);
            if (v26 == v70)
            {
              v78 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*v29, v64), (int8x8_t)v64, (int8x8_t)*v29), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*v28, v63), (int8x8_t)*v28, (int8x8_t)v63)), 0);
              v79 = vmul_lane_f32(v78, v78, 1).f32[0];
              v80 = v79 < 0.00000011921 || v68 < 0.00000011921;
              v81 = v79 / v68;
              if (v80)
                v81 = 0.0;
              if (v81 > a7[1] && *v56 <= 1u)
              {
                *(_DWORD *)&__b[4 * v54++] = v53;
                v52 = *a6;
                v55 = 1;
              }
            }
          }
          ++v53;
        }
        while (v53 < v52);
        if ((v55 & 1) == 0)
          goto LABEL_65;
        ++*v56;
        v82 = *a6;
        if (!*a6)
          goto LABEL_8;
LABEL_66:
        if (v54)
        {
          v83 = 0;
          v84 = 0;
          result = v54;
          while (v54 > 7)
          {
            v87 = vdupq_n_s64(v83);
            v88 = 0uLL;
            v89 = __b + 16;
            v90 = v54 & 0xFFFFFFF8;
            v91 = 0uLL;
            do
            {
              v92 = *((_OWORD *)v89 - 1);
              v93.i64[0] = v92;
              v93.i64[1] = DWORD1(v92);
              v94 = v93;
              v93.i64[0] = DWORD2(v92);
              v93.i64[1] = HIDWORD(v92);
              v95 = v93;
              v93.i64[0] = *(_OWORD *)v89;
              v93.i64[1] = HIDWORD(*(_QWORD *)v89);
              v96 = v93;
              v93.i64[0] = *((_QWORD *)v89 + 1);
              v93.i64[1] = HIDWORD(*(_OWORD *)v89);
              v88 = vsubq_s32(v88, (int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v87, v94), (int32x4_t)vceqq_s64(v87, v95))));
              v91 = vsubq_s32(v91, (int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v87, v96), (int32x4_t)vceqq_s64(v87, v93))));
              v89 += 32;
              v90 -= 8;
            }
            while (v90);
            v86 = vaddvq_s32(vaddq_s32(v91, v88));
            v85 = v54 & 0xFFFFFFF8;
            if (v85 != v54)
              goto LABEL_74;
LABEL_78:
            if (v86)
              v100 = v86 == v54;
            else
              v100 = 0;
            if (v100)
            {
              *(_DWORD *)(a5 + 4 * v84++) = *(_DWORD *)(a5 + 4 * v83);
              v82 = *a6;
            }
            if (++v83 >= v82)
              goto LABEL_8;
          }
          v85 = 0;
          v86 = 0;
LABEL_74:
          v97 = v54 - v85;
          v98 = &__b[4 * v85];
          do
          {
            v99 = *(_DWORD *)v98;
            v98 += 4;
            if (v83 != v99)
              ++v86;
            --v97;
          }
          while (v97);
          goto LABEL_78;
        }
LABEL_8:
        *a6 = v82 - v54;
LABEL_9:
        if (++v26 == v19)
          return result;
      }
      v54 = 0;
LABEL_65:
      *(_DWORD *)(a1 + 1724 * result + 840) = 0;
      v82 = *a6;
      if (!*a6)
        goto LABEL_8;
      goto LABEL_66;
    }
  }
  return result;
}

unint64_t acTrkObjectAssocTrkDet(int a1, unsigned int a2, _DWORD *a3, int a4, unsigned int a5, uint64_t a6, unsigned int a7, uint64_t a8, uint64_t a9, _DWORD *a10, _DWORD *a11, _DWORD *a12, char *a13, unsigned int *a14, float *a15, uint64_t a16, void *a17)
{
  unsigned int v17;
  uint64_t v19;
  char *v22;
  int v23;
  unsigned int TempBuffers;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int32x4_t *v28;
  void *v29;
  _DWORD *v30;
  void *v31;
  _DWORD *v32;
  __int128 v33;
  uint64_t v34;
  unsigned int v35;
  uint64_t v36;
  unsigned int v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int *v41;
  uint64_t v42;
  unsigned int v43;
  unsigned int v44;
  BOOL v45;
  int v46;
  _DWORD *v47;
  unsigned int v48;
  unsigned int v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  unint64_t v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  float v63;
  uint64_t v64;
  float v65;
  __int128 v66;
  uint64_t v67;
  int v68;
  unsigned int v69;
  _DWORD *v70;
  unsigned int v71;
  float32x2_t v72;
  float32x2_t v73;
  int32x4_t v74;
  float *v75;
  float32x2_t v76;
  float32x2_t v77;
  int v78;
  int v79;
  int v80;
  int v81;
  uint64_t v82;
  float32x2_t v83;
  float32x2_t v84;
  float32x2_t v85;
  float32x2_t v86;
  float32x2_t v87;
  float v88;
  float32x2_t v89;
  float32x2_t v90;
  unsigned __int32 v91;
  unsigned int v92;
  float v93;
  float v94;
  float32x2_t v95;
  float32x2_t v96;
  float v97;
  float32x2_t v98;
  unsigned __int32 v99;
  BOOL v100;
  float v101;
  float32x2_t v102;
  float32x2_t v103;
  BOOL v104;
  float v105;
  float32x2_t v106;
  float32x2_t v107;
  BOOL v108;
  float v109;
  float v110;
  float v111;
  int v113;
  uint64_t v114;
  _DWORD *v115;
  BOOL v117;
  uint16x4_t v118;
  BOOL v120;
  float v121;
  float v122;
  float v123;
  float v125;
  float v126;
  int v129;
  BOOL v130;
  uint64_t v131;
  int v132;
  _OWORD *v133;
  int v134;
  int v135;
  float v136;
  int v137;
  _DWORD *v138;
  uint64_t v139;
  float v140;
  float v141;
  float v142;
  int v143;
  int v144;
  float v145;
  int v146;
  float *v147;
  uint64_t v148;
  int v149;
  float v150;
  uint64_t v151;
  _DWORD *v152;
  int v153;
  int v155;
  int v156;
  float *v157;
  uint64_t v158;
  int v159;
  int v160;
  _DWORD *v161;
  uint64_t v162;
  int v163;
  int v164;
  int v165;
  float v166;
  int v167;
  _BYTE *v168;
  uint64_t v169;
  float v170;
  float v171;
  float v172;
  int v174;
  float v175;
  int *v177;
  int v178;
  _BYTE *v179;
  uint64_t v180;
  _BYTE *v182;
  uint64_t v183;
  int *v184;
  int v185;
  unsigned int v186;
  _BYTE *v187;
  _BYTE *v188;
  uint64_t v189;
  uint64_t v190;
  _BYTE *v191;
  uint64_t v192;
  _BYTE *v193;
  uint64_t v194;
  _DWORD *v195;
  unsigned int v196;
  uint64_t v197;
  _OWORD *v198;
  int v199;
  unsigned int v200;
  unsigned int v201;
  double v202;
  unsigned __int8 *v203;
  unint64_t v204;
  int v205;
  uint64_t v206;
  int32x4_t v207;
  uint64_t v208;
  uint64_t v209;
  _DWORD *v210;
  unint64_t v211;
  float32x2_t v212;
  float v213;
  float v214;
  int32x4_t v215;
  uint64_t v216;
  BOOL v218;
  int v219;
  float *v220;
  int v221;
  int v222;
  uint64_t v223;
  float32x2_t v224;
  float v225;
  float v226;
  unsigned int v227;
  BOOL v229;
  uint16x4_t v230;
  BOOL v232;
  int v233;
  BOOL v234;
  uint64_t v235;
  int v236;
  int32x4_t *v237;
  int v238;
  unsigned int v239;
  uint64_t v240;
  int32x4_t *v241;
  int v242;
  int32x4_t v243;
  int32x4_t *v244;
  int32x4_t v245;
  int32x4_t v246;
  uint64_t v247;
  uint64_t v248;
  unint64_t v249;
  int32x4_t *v250;
  _DWORD *v251;
  unint64_t v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  unint64_t v265;
  __int128 v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  unint64_t v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  _DWORD *v291;
  unsigned int v292;
  char *v293;
  int32x4_t *v294;
  _DWORD *v295;
  int32x4_t *v296;
  int v297;
  uint64_t v298;
  float v299;
  uint64_t v300;
  int v301;
  _OWORD *v302;
  int v303;
  int v304;
  char v305;
  int v306;
  _DWORD *v307;
  unsigned int v308;
  _DWORD *v309;
  uint64_t v310;
  unsigned int v311;
  unsigned int v312;
  double v313;
  int v314;
  uint64_t v315;
  int v316;
  unsigned int v317;
  unsigned int v318;
  unsigned int v319;
  uint64_t v320;
  unsigned int v321;
  uint64_t v322;
  unsigned int v323;
  unsigned int v324;
  unsigned int v325;
  double v326;
  int *v327;
  _BYTE *v328;
  uint64_t v329;
  int v330;
  uint64_t v331;
  uint64_t v332;
  unsigned int v333;
  unsigned int *v334;
  char *v335;
  uint64_t v336;
  unsigned int *v337;
  unsigned int v338;
  uint64_t v339;
  uint64_t v340;
  char *v341;
  unsigned int *v342;
  uint64_t v343;
  uint64_t v344;
  unint64_t v345;
  unsigned int v346;
  int *v347;
  char *v348;
  unint64_t v349;
  float v350;
  float v351;
  float *v352;
  float v353;
  float v354;
  float v355;
  float v356;
  float v357;
  float v358;
  float v359;
  float v360;
  BOOL v361;
  BOOL v362;
  float v364;
  unint64_t v366;
  unsigned int v367;
  uint64_t v368;
  int *v369;
  int v370;
  uint64_t v371;
  unsigned int v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  int v376;
  uint64_t v378;
  float *v379;
  float *v380;
  float *v381;
  float *v382;
  BOOL v383;
  float *v384;
  float v385;
  float v386;
  float v387;
  float v388;
  float v389;
  float v390;
  float v391;
  float v392;
  float v393;
  BOOL v394;
  BOOL v395;
  float v397;
  uint64_t v398;
  int v399;
  float *v400;
  float *v401;
  float *v402;
  float *v403;
  float *v404;
  float v405;
  float *v406;
  float v407;
  float v408;
  float v409;
  float v410;
  float v411;
  float v412;
  float v413;
  float v415;
  float v416;
  float v418;
  int v419;
  uint64_t v420;
  unsigned int v421;
  int v422;
  int v423;
  _DWORD *v424;
  uint64_t v425;
  uint64_t v426;
  _DWORD *v427;
  int v428;
  BOOL v429;
  float v430;
  uint64_t v432;
  uint64_t v433;
  float32x2_t *v434;
  int v435;
  float32x2_t v436;
  float32x2_t v437;
  float v438;
  unsigned int v439;
  uint64_t v440;
  uint64_t v441;
  unsigned int v442;
  float v443;
  float v444;
  int32x4_t *v445;
  uint64_t v446;
  uint64_t v447;
  unsigned int v448;
  int v449;
  float32x2_t v450;
  float v451;
  _OWORD *v452;
  uint64_t v453;
  __int32 v454;
  float32x2_t v455;
  float32x2_t v456;
  float32_t v457;
  float32x2_t *v458;
  __int32 v459;
  unsigned __int32 v460;
  unint64_t v461;
  unsigned int v462;
  unsigned int v463;
  BOOL v464;
  uint64_t v465;
  uint64_t v466;
  int32x2_t *v467;
  int32x2_t *v468;
  uint64_t v469;
  int32x2_t v470;
  uint64_t v471;
  __int32 *v472;
  __int32 *v473;
  __int32 v474;
  unint64_t v475;
  int32x4_t v476;
  unsigned int v477;
  unsigned int v478;
  void *v479;
  unint64_t v480;
  unsigned int v481;
  uint64_t v482;
  uint64_t v483;
  uint64_t v484;
  int *v485;
  uint64_t v486;
  int v487;
  int v488;
  uint64_t v489;
  _DWORD *v490;
  _DWORD *v491;
  int v492;
  int v493;
  _DWORD *v494;
  uint64_t v495;
  uint64_t v496;
  _DWORD *v497;
  uint64_t v498;
  uint64_t v499;
  uint64_t v500;
  _DWORD *v501;
  uint64_t v502;
  uint64_t v503;
  float *v504;
  float v505;
  float v506;
  float v507;
  float *v508;
  float v509;
  unint64_t v510;
  float v511;
  float v512;
  float v513;
  float v514;
  float v515;
  float v516;
  float v517;
  float v519;
  float v520;
  float v521;
  float v523;
  unint64_t v524;
  int *v525;
  int v526;
  unsigned int v527;
  int32x4_t *v528;
  void *v529;
  unint64_t v530;
  unsigned int v531;
  uint64_t v532;
  __int128 v533;
  _DWORD *v534;
  uint64_t v535;
  _DWORD *v536;
  __int128 v537;
  __int128 v538;
  __int128 v539;
  __int128 v540;
  __int128 v541;
  __int128 v542;
  __int128 v543;
  __int128 v544;
  __int128 v545;
  __int128 v546;
  __int128 v547;
  __int128 v548;
  __int128 v549;
  __int128 v550;
  __int128 v551;
  __int128 v552;
  __int128 v553;
  __int128 v554;
  __int128 v555;
  __int128 v556;
  __int128 v557;
  __int128 v558;
  __int128 v559;
  __int128 v560;
  __int128 v561;
  __int128 v562;
  __int128 v563;
  __int128 v564;
  __int128 v565;
  __int128 v566;
  __int128 v567;
  __int128 v568;
  __int128 v569;
  __int128 v570;
  __int128 v571;
  __int128 v572;
  uint64_t v573;
  unsigned int *v574;
  int v575;
  _DWORD *v576;
  uint64_t v577;
  int v578;
  int v579;
  __int128 *v580;
  int v581;
  int v582;
  char v583;
  int v584;
  _DWORD *v585;
  unsigned int v586;
  __int128 v587;
  _DWORD *v588;
  uint64_t v589;
  unsigned int v590;
  uint64_t v591;
  unint64_t v592;
  unint64_t v593;
  _DWORD *v594;
  unint64_t v595;
  int32x4_t v596;
  int32x4_t *v597;
  int32x4_t v598;
  int32x4_t v599;
  unint64_t v600;
  uint64_t v601;
  int *v602;
  uint64_t v603;
  _DWORD *v604;
  uint64_t v605;
  _DWORD *v606;
  int32x4_t v607;
  uint64_t i;
  int32x4_t v609;
  int32x4_t v610;
  unsigned int v611;
  uint64_t v612;
  int32x4_t *v613;
  uint64_t v614;
  uint64_t v615;
  _BYTE *v616;
  uint64_t v617;
  uint64_t v618;
  float v619;
  int v620;
  unsigned int v621;
  int v622;
  float *v623;
  int v624;
  int v625;
  float v626;
  _DWORD *v627;
  _DWORD *v628;
  void *v630;
  int v631;
  unsigned int *v632;
  void *v633;
  int v634;
  unsigned __int8 *v635;
  void *__dst;
  unsigned __int8 *v637;
  __int128 v638;
  unsigned int *v639;
  unsigned int *v640;
  uint64_t v641;
  BOOL v642;
  uint64_t v643;
  uint64_t v644;
  uint64_t v645;
  uint64_t v646;
  void *v647;
  void *v648;
  unsigned int v649;
  unsigned int v651;
  uint64_t v652;
  int v654;
  uint64_t v655;
  unsigned int v656;
  uint64_t v657;
  int v658;
  uint64_t v659;
  int32x4_t *v660;
  uint64_t v661;
  int32x4_t v662;
  unsigned int v663;
  uint64_t __n;
  size_t __na;
  int32x4_t *v666;
  unsigned int v667;
  unsigned int v668;
  int v669[2];
  uint64_t v670;
  unsigned int v671;
  unsigned int v672;
  int32x4_t v673;
  int32x4_t v675;
  _QWORD v676[2];
  int v677;
  float v678;
  unsigned int v679;
  int v680;
  unsigned int v681;
  __int128 v682;
  __int128 v683;
  __int128 v684;
  __int128 v685;
  __int128 v686;
  __int128 v687;
  int v688[4];
  void *v689[2];
  void *__b[2];
  __int128 v691;
  __int128 v692;
  void *v693[2];
  __int128 v694;
  __int128 v695;
  __int128 v696;
  __int128 v697;
  __int128 v698;
  __int128 v699;
  __int128 v700;
  uint64_t v701;
  _DWORD __src[433];

  v17 = a7;
  LODWORD(v19) = a4;
  v22 = a13;
  if (a5 <= a7)
    v23 = a7;
  else
    v23 = a5;
  v701 = 0;
  v699 = 0u;
  v700 = 0u;
  v697 = 0u;
  v698 = 0u;
  v695 = 0u;
  v696 = 0u;
  *(_OWORD *)v693 = 0u;
  v694 = 0u;
  v691 = 0u;
  v692 = 0u;
  *(_OWORD *)v689 = 0u;
  *(_OWORD *)__b = 0u;
  v687 = 0u;
  *(_OWORD *)v688 = 0u;
  v685 = 0u;
  v686 = 0u;
  v683 = 0u;
  v684 = 0u;
  v682 = 0u;
  TempBuffers = acTrkObjectAssocTrkDetGetTempBuffers(v23, (uint64_t)a17, (uint64_t)a3, (uint64_t)&v682);
  bzero(a17, TempBuffers);
  v25 = v682;
  v26 = *((_QWORD *)&v685 + 1);
  v28 = (int32x4_t *)*((_QWORD *)&v686 + 1);
  v27 = v686;
  v29 = __b[0];
  v666 = (int32x4_t *)v682;
  v660 = (int32x4_t *)*((_QWORD *)&v686 + 1);
  v663 = v17;
  v668 = v19;
  v648 = (void *)v687;
  v654 = a1;
  if (!v17)
  {
    v681 = 0;
    v37 = *a14;
    v35 = a5;
    if (!(v19 | *a14))
      goto LABEL_360;
    v642 = (_DWORD)v19 == 0;
    if (!(_DWORD)v19)
    {
      v40 = a8;
      v41 = a14;
LABEL_570:
      v645 = v27;
      v680 = v19;
      if (v37)
      {
        v475 = 0;
        v476 = vdupq_n_s32(0xFFFFFE97);
        do
        {
          *((_OWORD *)v22 + 30) = 0uLL;
          *((_OWORD *)v22 + 31) = 0uLL;
          *((_OWORD *)v22 + 28) = 0uLL;
          *((_OWORD *)v22 + 29) = 0uLL;
          *((_OWORD *)v22 + 26) = 0uLL;
          *((_OWORD *)v22 + 27) = 0uLL;
          *((_OWORD *)v22 + 24) = 0uLL;
          *((_OWORD *)v22 + 25) = 0uLL;
          *((_OWORD *)v22 + 22) = 0uLL;
          *((_OWORD *)v22 + 23) = 0uLL;
          *((_OWORD *)v22 + 20) = 0uLL;
          *((_OWORD *)v22 + 21) = 0uLL;
          *((_OWORD *)v22 + 18) = 0uLL;
          *((_OWORD *)v22 + 19) = 0uLL;
          *((_OWORD *)v22 + 16) = 0uLL;
          *((_OWORD *)v22 + 17) = 0uLL;
          *((_OWORD *)v22 + 14) = 0uLL;
          *((_OWORD *)v22 + 15) = 0uLL;
          *((_OWORD *)v22 + 12) = 0uLL;
          *((_OWORD *)v22 + 13) = 0uLL;
          *((_OWORD *)v22 + 10) = 0uLL;
          *((_OWORD *)v22 + 11) = 0uLL;
          *((_OWORD *)v22 + 8) = 0uLL;
          *((_OWORD *)v22 + 9) = 0uLL;
          *((_OWORD *)v22 + 6) = 0uLL;
          *((_OWORD *)v22 + 7) = 0uLL;
          *((_OWORD *)v22 + 4) = 0uLL;
          *((_OWORD *)v22 + 5) = 0uLL;
          *((_OWORD *)v22 + 2) = 0uLL;
          *((_OWORD *)v22 + 3) = 0uLL;
          *(_OWORD *)v22 = 0uLL;
          *((_OWORD *)v22 + 1) = 0uLL;
          *((int32x4_t *)v22 + 2) = v476;
          *((_DWORD *)v22 + 12) = -361;
          *((_DWORD *)v22 + 32) = -1;
          *((_DWORD *)v22 + 98) = -1;
          *((_DWORD *)v22 + 105) = -1;
          *((_DWORD *)v22 + 128) = 0;
          v22[516] = 0;
          ++v475;
          v22 += 520;
        }
        while (v475 < *v41);
      }
      v463 = 0;
      *v41 = 0;
      goto LABEL_574;
    }
    v38 = v19;
    v39 = 0;
    LODWORD(v19) = 0;
    v40 = a8;
    v41 = a14;
    while (2)
    {
      v47 = &a3[v39];
      a3[v39 + 112] = 1;
      v48 = a3[v39 + 195];
      v49 = v48 - 1;
      if (!v48)
        v49 = 0;
      v50 = (uint64_t)&v47[10 * v49 + 133];
      v42 = v47[2];
      if ((_DWORD)v42 == 9)
      {
        v51 = *(_OWORD *)v50;
        v52 = *(_OWORD *)(v50 + 16);
        *(_QWORD *)(v47 + 141) = *(_QWORD *)(v50 + 32);
        *(_OWORD *)(v47 + 133) = v51;
        *(_OWORD *)(v47 + 137) = v52;
        v47[195] = 1;
        if (!a6)
          goto LABEL_24;
        break;
      }
      if (v48 < 6)
      {
        v56 = (uint64_t)&a3[10 * v48 + 133 + v39];
        v57 = *(_OWORD *)v50;
        v58 = *(_OWORD *)(v50 + 16);
        *(_QWORD *)(v56 + 32) = *(_QWORD *)(v50 + 32);
        *(_OWORD *)v56 = v57;
        *(_OWORD *)(v56 + 16) = v58;
        ++v47[195];
        if (!a6)
        {
LABEL_24:
          switch((int)v42)
          {
            case 0:
              if (LOBYTE(a3[v39 + 25]))
              {
                v43 = *(_DWORD *)(a8 + 60);
                if (v668 > 2)
                  v43 = 2;
              }
              else
              {
                v43 = 2;
              }
              goto LABEL_13;
            case 1:
              goto LABEL_12;
            case 2:
            case 4:
              v42 = 2;
              goto LABEL_12;
            case 3:
            case 5:
              v42 = 3;
              goto LABEL_12;
            case 8:
              v42 = 4;
              goto LABEL_12;
            default:
              if ((v42 & 0xFFFFFFFE) == 0xA)
                v42 = 6;
              else
                v42 = 5;
LABEL_12:
              v43 = *(_DWORD *)(a8 + 4 * v42 + 60);
LABEL_13:
              v44 = a3[v39 + 128];
              v45 = v44 >= v43;
              if (v44 < v43)
                v46 = 1;
              else
                v46 = 2;
              if (v45)
                LODWORD(v19) = v19 + 1;
              a3[v39 + 132] = v46;
              v39 += 431;
              if (431 * v38 != v39)
                continue;
              v37 = *a14;
              v25 = (uint64_t)v666;
              break;
          }
          goto LABEL_570;
        }
      }
      else
      {
        v53 = (uint64_t)&a3[v39 + 183];
        v54 = *(_OWORD *)v50;
        v55 = *(_OWORD *)(v50 + 16);
        *(_QWORD *)(v53 + 32) = *(_QWORD *)(v50 + 32);
        *(_OWORD *)v53 = v54;
        *(_OWORD *)(v53 + 16) = v55;
        if (!a6)
          goto LABEL_24;
      }
      break;
    }
    ++a3[v39 + 128];
    goto LABEL_24;
  }
  v643 = *((_QWORD *)&v685 + 1);
  v30 = (_DWORD *)*((_QWORD *)&v682 + 1);
  v31 = (void *)v683;
  v32 = __b[1];
  v635 = (unsigned __int8 *)*((_QWORD *)&v683 + 1);
  v632 = (unsigned int *)*((_QWORD *)&v692 + 1);
  v633 = (void *)v691;
  v33 = v694;
  v652 = v695;
  v645 = v686;
  v646 = *((_QWORD *)&v695 + 1);
  v638 = v696;
  v637 = (unsigned __int8 *)v697;
  v34 = v17;
  v639 = (unsigned int *)v698;
  v640 = (unsigned int *)*((_QWORD *)&v684 + 1);
  v641 = *((_QWORD *)&v699 + 1);
  v647 = __b[0];
  memset(__b[0], 255, 4 * v17);
  if (!(v19 | *a14))
  {
    v35 = a5;
    if (v17 > 7)
    {
      v36 = v17 & 0xFFFFFFF8;
      v243 = (int32x4_t)xmmword_2359168E0;
      v25 = (uint64_t)v666;
      v244 = v666 + 1;
      v245.i64[0] = 0x400000004;
      v245.i64[1] = 0x400000004;
      v246.i64[0] = 0x800000008;
      v246.i64[1] = 0x800000008;
      v247 = v36;
      v27 = v645;
      v29 = v647;
      do
      {
        v244[-1] = v243;
        *v244 = vaddq_s32(v243, v245);
        v243 = vaddq_s32(v243, v246);
        v244 += 2;
        v247 -= 8;
      }
      while (v247);
      if (v36 == v17)
        goto LABEL_360;
    }
    else
    {
      v36 = 0;
      v25 = (uint64_t)v666;
      v27 = v645;
      v29 = v647;
    }
    do
    {
      *(_DWORD *)(v25 + 4 * v36) = v36;
      ++v36;
    }
    while (v17 != v36);
LABEL_360:
    v681 = v17;
    acTrkObjectPickDet(v654, a2, (uint64_t)a3, 0, v35, a6, v17, v25, &v681, v27, (uint64_t)v630, (uint64_t)v29, v631, *(_BYTE *)(a8 + 194), *(_DWORD *)(a8 + 196));
    v248 = v681;
    if (v681)
    {
      v671 = 0;
      v249 = 0;
      v675 = vdupq_n_s32(0xFFFFFE97);
      v250 = v666;
      do
      {
        v292 = *(_DWORD *)(a6 + ((unint64_t)v250->u32[0] << 9) + 28);
        if (v292 > 1)
        {
          v295 = &a3[431 * v249];
          v296 = v250;
          bzero(v295, 0x6BCuLL);
          *((int32x4_t *)v295 + 2) = v675;
          v295[12] = -361;
          v295[32] = -1;
          v295[98] = -1;
          v295[105] = -1;
          *(_QWORD *)(v295 + 193) = 0xFF7FFFFFFFFFFFFFLL;
          v295[198] = 0;
          *(_QWORD *)(v295 + 207) = 0;
          v295[209] = 0;
          memcpy(v295, (const void *)(a6 + ((unint64_t)v296->u32[0] << 9)), 0x200uLL);
          v250 = v296;
          v297 = (*a12)++;
          *v295 = v297;
          ++v295[130];
          v298 = v296->u32[0];
          v295[131] = LODWORD(a15[v298]);
          v299 = *((float *)v295 + 5) * *((float *)v295 + 6);
          *((float *)v295 + 207) = v299;
          *((float *)v295 + 208) = v299 / (float)((float)(a2 * v654) + 0.0001);
          v300 = a6 + (v298 << 9);
          v301 = *(_DWORD *)(v300 + 8);
          v302 = (_OWORD *)(v300 + 12);
          v303 = *(_DWORD *)(v300 + 40);
          v304 = *(_DWORD *)(v300 + 44);
          v305 = *(_BYTE *)(v300 + 100);
          v306 = *(_DWORD *)(v300 + 420);
          if (v295[2] == 9)
          {
            v251 = &a3[431 * v249];
            *(_OWORD *)(v251 + 133) = *v302;
            *((_BYTE *)v251 + 548) = v305;
            v251[141] = v306;
            v251[139] = v304;
            v251[138] = v303;
            v251[142] = v301;
            v251[195] = 1;
            v252 = a6 + ((unint64_t)v296->u32[0] << 9);
            v253 = *(_OWORD *)(v252 + 212);
            v254 = *(_OWORD *)(v252 + 244);
            v255 = *(_OWORD *)(v252 + 196);
            *((_OWORD *)v251 + 61) = *(_OWORD *)(v252 + 228);
            *((_OWORD *)v251 + 62) = v254;
            *((_OWORD *)v251 + 59) = v255;
            *((_OWORD *)v251 + 60) = v253;
            v256 = *(_OWORD *)(v252 + 132);
            v257 = *(_OWORD *)(v252 + 148);
            v258 = *(_OWORD *)(v252 + 180);
            *((_OWORD *)v251 + 57) = *(_OWORD *)(v252 + 164);
            *((_OWORD *)v251 + 58) = v258;
            *((_OWORD *)v251 + 55) = v256;
            *((_OWORD *)v251 + 56) = v257;
            v259 = *(_OWORD *)(v252 + 324);
            v260 = *(_OWORD *)(v252 + 340);
            v261 = *(_OWORD *)(v252 + 356);
            *((_OWORD *)v251 + 70) = *(_OWORD *)(v252 + 372);
            *((_OWORD *)v251 + 69) = v261;
            *((_OWORD *)v251 + 68) = v260;
            *((_OWORD *)v251 + 67) = v259;
            v262 = *(_OWORD *)(v252 + 260);
            v263 = *(_OWORD *)(v252 + 276);
            v264 = *(_OWORD *)(v252 + 292);
            *((_OWORD *)v251 + 66) = *(_OWORD *)(v252 + 308);
            *((_OWORD *)v251 + 65) = v264;
            *((_OWORD *)v251 + 63) = v262;
            *((_OWORD *)v251 + 64) = v263;
            v265 = a6 + ((unint64_t)v296->u32[0] << 9);
            v266 = *(_OWORD *)(v265 + 132);
            v267 = *(_OWORD *)(v265 + 148);
            v268 = *(_OWORD *)(v265 + 164);
            *((_OWORD *)v251 + 74) = *(_OWORD *)(v265 + 180);
            *((_OWORD *)v251 + 73) = v268;
            *((_OWORD *)v251 + 72) = v267;
            *((_OWORD *)v251 + 71) = v266;
            v269 = *(_OWORD *)(v265 + 196);
            v270 = *(_OWORD *)(v265 + 212);
            v271 = *(_OWORD *)(v265 + 228);
            *((_OWORD *)v251 + 78) = *(_OWORD *)(v265 + 244);
            *((_OWORD *)v251 + 77) = v271;
            *((_OWORD *)v251 + 76) = v270;
            *((_OWORD *)v251 + 75) = v269;
            v272 = *(_OWORD *)(v265 + 260);
            v273 = *(_OWORD *)(v265 + 276);
            v274 = *(_OWORD *)(v265 + 292);
            *((_OWORD *)v251 + 82) = *(_OWORD *)(v265 + 308);
            *((_OWORD *)v251 + 81) = v274;
            *((_OWORD *)v251 + 80) = v273;
            *((_OWORD *)v251 + 79) = v272;
            v275 = *(_OWORD *)(v265 + 324);
            v276 = *(_OWORD *)(v265 + 340);
            v277 = *(_OWORD *)(v265 + 356);
            *((_OWORD *)v251 + 86) = *(_OWORD *)(v265 + 372);
            *((_OWORD *)v251 + 85) = v277;
            *((_OWORD *)v251 + 84) = v276;
            *((_OWORD *)v251 + 83) = v275;
            v278 = a6 + ((unint64_t)v296->u32[0] << 9);
            v279 = *(_OWORD *)(v278 + 132);
            v280 = *(_OWORD *)(v278 + 148);
            v281 = *(_OWORD *)(v278 + 164);
            *((_OWORD *)v251 + 90) = *(_OWORD *)(v278 + 180);
            *((_OWORD *)v251 + 89) = v281;
            *((_OWORD *)v251 + 88) = v280;
            *((_OWORD *)v251 + 87) = v279;
            v282 = *(_OWORD *)(v278 + 196);
            v283 = *(_OWORD *)(v278 + 212);
            v284 = *(_OWORD *)(v278 + 228);
            *((_OWORD *)v251 + 94) = *(_OWORD *)(v278 + 244);
            *((_OWORD *)v251 + 93) = v284;
            *((_OWORD *)v251 + 92) = v283;
            *((_OWORD *)v251 + 91) = v282;
            v285 = *(_OWORD *)(v278 + 260);
            v286 = *(_OWORD *)(v278 + 276);
            v287 = *(_OWORD *)(v278 + 292);
            *((_OWORD *)v251 + 98) = *(_OWORD *)(v278 + 308);
            *((_OWORD *)v251 + 97) = v287;
            *((_OWORD *)v251 + 96) = v286;
            *((_OWORD *)v251 + 95) = v285;
            v288 = *(_OWORD *)(v278 + 324);
            v289 = *(_OWORD *)(v278 + 340);
            v290 = *(_OWORD *)(v278 + 356);
            *((_OWORD *)v251 + 102) = *(_OWORD *)(v278 + 372);
            *((_OWORD *)v251 + 101) = v290;
            *((_OWORD *)v251 + 100) = v289;
            *((_OWORD *)v251 + 99) = v288;
          }
          else
          {
            v307 = &a3[431 * v249];
            v308 = v307[195];
            if (v308 < 6)
            {
              v310 = (uint64_t)&a3[431 * v249 + 10 * v308];
              *(_OWORD *)(v310 + 532) = *v302;
              *(_BYTE *)(v310 + 548) = v305;
              *(_DWORD *)(v310 + 564) = v306;
              *(_DWORD *)(v310 + 556) = v304;
              *(_DWORD *)(v310 + 552) = v303;
              *(_DWORD *)(v310 + 568) = v301;
              ++v307[195];
            }
            else
            {
              v309 = &a3[431 * v249];
              *(_OWORD *)(v309 + 183) = *v302;
              *((_BYTE *)v309 + 748) = v305;
              v309[191] = v306;
              v309[189] = v304;
              v309[188] = v303;
              v309[192] = v301;
            }
          }
          v291 = &a3[431 * v249];
          *((_OWORD *)v291 + 104) = *(_OWORD *)(a6 + ((unint64_t)v296->u32[0] << 9) + 12);
          *((_OWORD *)v291 + 105) = *(_OWORD *)(a6 + ((unint64_t)v296->u32[0] << 9) + 12);
          *((float *)v291 + 412) = (float)*(unsigned int *)(a6 + ((unint64_t)v296->u32[0] << 9) + 28);
          v249 = (v249 + 1);
        }
        else if (v292)
        {
          v293 = &a13[520 * v671];
          *((_OWORD *)v293 + 30) = 0u;
          *((_OWORD *)v293 + 31) = 0u;
          *((_OWORD *)v293 + 28) = 0u;
          *((_OWORD *)v293 + 29) = 0u;
          *((_OWORD *)v293 + 26) = 0u;
          *((_OWORD *)v293 + 27) = 0u;
          *((_OWORD *)v293 + 24) = 0u;
          *((_OWORD *)v293 + 25) = 0u;
          *((_OWORD *)v293 + 22) = 0u;
          *((_OWORD *)v293 + 23) = 0u;
          *((_OWORD *)v293 + 20) = 0u;
          *((_OWORD *)v293 + 21) = 0u;
          *((_OWORD *)v293 + 18) = 0u;
          *((_OWORD *)v293 + 19) = 0u;
          *((_OWORD *)v293 + 16) = 0u;
          *((_OWORD *)v293 + 17) = 0u;
          *((_OWORD *)v293 + 14) = 0u;
          *((_OWORD *)v293 + 15) = 0u;
          *((_OWORD *)v293 + 12) = 0u;
          *((_OWORD *)v293 + 13) = 0u;
          *((_OWORD *)v293 + 10) = 0u;
          *((_OWORD *)v293 + 11) = 0u;
          *((_OWORD *)v293 + 8) = 0u;
          *((_OWORD *)v293 + 9) = 0u;
          *((_OWORD *)v293 + 6) = 0u;
          *((_OWORD *)v293 + 7) = 0u;
          *((_OWORD *)v293 + 4) = 0u;
          *((_OWORD *)v293 + 5) = 0u;
          *((_OWORD *)v293 + 2) = 0u;
          *((_OWORD *)v293 + 3) = 0u;
          *(_OWORD *)v293 = 0u;
          *((_OWORD *)v293 + 1) = 0u;
          *((int32x4_t *)v293 + 2) = v675;
          *((_DWORD *)v293 + 12) = -361;
          *((_DWORD *)v293 + 32) = -1;
          *((_DWORD *)v293 + 98) = -1;
          *((_DWORD *)v293 + 105) = -1;
          *((_DWORD *)v293 + 128) = 0;
          v293[516] = 0;
          v294 = v250;
          memcpy(v293, (const void *)(a6 + ((unint64_t)v250->u32[0] << 9)), 0x200uLL);
          v250 = v294;
          ++v671;
        }
        v250 = (int32x4_t *)((char *)v250 + 4);
        --v248;
      }
      while (v248);
    }
    else
    {
      v249 = 0;
      v671 = 0;
    }
    *a10 = v249;
    *a11 = 0;
    *a14 = v671;
    return v249;
  }
  __dst = v31;
  v642 = (_DWORD)v19 == 0;
  v59 = 0;
  v60 = 0;
  v680 = 0;
  if (v19 <= v17)
    v61 = v17;
  else
    v61 = v19;
  v62 = a8;
  v63 = *(float *)(a8 + 56);
  v634 = *(_DWORD *)(a8 + 180);
  if (v19 <= 1)
    v64 = 1;
  else
    v64 = v19;
  v670 = v64;
  v65 = (float)(a2 * v654) + 0.0001;
  v19 = v19;
  v658 = v61 - 1;
  v651 = v61 - 1 - v17;
  v657 = v61 & 0xFFFFFFF8;
  v656 = v61 - v17;
  v655 = ((_DWORD)v61 - v17) & 0xFFFFFFF8;
  v649 = v655 + v17;
  *(_QWORD *)&v66 = 0x4000000040000000;
  *((_QWORD *)&v66 + 1) = 0x4000000040000000;
  v661 = v61;
  while (2)
  {
    if (v59 >= v19)
    {
      v129 = 0;
      v130 = __CFADD__(v60, v658);
      if (v61 < 8)
        goto LABEL_154;
      if (v130)
        goto LABEL_154;
      v131 = v657;
      v132 = v60;
      do
      {
        v133 = &v30[v132];
        *v133 = v66;
        v133[1] = v66;
        v132 += 8;
        v131 -= 8;
      }
      while (v131);
      v60 += v657;
      v129 = v657;
      v79 = v60;
      if ((_DWORD)v61 != (_DWORD)v657)
      {
LABEL_154:
        v134 = v61 - v129;
        v79 = v60;
        do
        {
          v30[v79++] = 0x40000000;
          --v134;
        }
        while (v134);
      }
      goto LABEL_48;
    }
    v67 = 0;
    v68 = 0;
    v69 = 0;
    v70 = &a3[431 * v59];
    v71 = v70[2];
    v72 = *(float32x2_t *)(v70 + 3);
    v73 = vadd_f32(v72, *(float32x2_t *)(v70 + 5));
    v74 = vdupq_n_s32(v71);
    v75 = (float *)(v70 + 207);
    v76 = vmaxnm_f32(vsub_f32(v73, v72), 0);
    v77 = vmul_lane_f32(v76, v76, 1);
    v78 = v60 + 1;
    v79 = v60;
    do
    {
      v80 = v79;
      v81 = v78;
      v82 = a6 + (v67 << 9);
      v83 = *(float32x2_t *)(v82 + 12);
      v84 = *(float32x2_t *)(v82 + 20);
      v85 = vadd_f32(v83, v84);
      v86 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v73, v85), (int8x8_t)v85, (int8x8_t)v73), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v72, v83), (int8x8_t)v72, (int8x8_t)v83)), 0);
      v87 = vmul_lane_f32(v86, v86, 1);
      v88 = 0.0;
      if (v87.f32[0] >= 0.00000011921)
      {
        v89 = vmaxnm_f32(vsub_f32(v85, v83), 0);
        v90 = vsub_f32(vadd_f32(vmul_lane_f32(v89, v89, 1), v77), v87);
        v91 = vdiv_f32(v87, v90).u32[0];
        if (v90.f32[0] >= 0.00000011921)
          v88 = *(float *)&v91;
        else
          v88 = 0.0;
      }
      v92 = *(_DWORD *)(v82 + 8);
      if (v71 == v92)
      {
        if (v71 == 1)
        {
          if (v88 > 0.2)
          {
            v121 = v84.f32[0] * v84.f32[1];
            if (*v75 <= v121)
              v122 = *v75;
            else
              v122 = v121;
            if (*v75 > v121)
              v121 = *v75;
            v109 = fminf(fmaxf((float)((float)(v122 / (float)(v121 + 0.0001)) * 0.1) + (float)(v88 * 0.9), 0.2), 0.99);
            v88 = v109;
            goto LABEL_139;
          }
        }
        else if (!v71)
        {
          v93 = 0.0;
          v94 = 0.0;
          if (v87.f32[0] >= 0.00000011921)
          {
            v95 = vmaxnm_f32(vsub_f32(v85, v83), 0);
            v96 = vmul_lane_f32(v95, v95, 1);
            if ((vcgt_f32(v77, v96).u8[0] & 1) != 0)
              v97 = v96.f32[0];
            else
              v97 = v77.f32[0];
            if (v97 >= 0.00000011921)
              v93 = v87.f32[0] / v97;
            else
              v93 = 0.0;
            v98 = vsub_f32(vadd_f32(v96, v77), v87);
            v99 = vdiv_f32(v87, v98).u32[0];
            if (v98.f32[0] >= 0.00000011921)
              v94 = *(float *)&v99;
            else
              v94 = 0.0;
          }
          if (a15[v67] < *(float *)(v62 + 188) && !*(_BYTE *)(a6 + (v67 << 9) + 100))
          {
            v100 = v94 >= 0.5 && *((_BYTE *)v70 + 100) == 0;
            if (!v100)
              v93 = 0.0;
          }
          v101 = v94 + 0.2;
          if (v93 >= 0.2)
            v93 = v101;
          v102 = vmaxnm_f32(vsub_f32(v85, v83), 0);
          v103 = vmul_lane_f32(v102, v102, 1);
          v104 = v87.f32[0] < 0.00000011921 || v103.f32[0] < 0.00000011921;
          LODWORD(v105) = vdiv_f32(v87, v103).u32[0];
          if (v104)
            v105 = 0.0;
          v106 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v85, v73), (int8x8_t)v73, (int8x8_t)v85), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v83, v72), (int8x8_t)v83, (int8x8_t)v72)), 0);
          v107 = vmul_lane_f32(v106, v106, 1);
          v108 = v107.f32[0] < 0.00000011921 || v77.f32[0] < 0.00000011921;
          v109 = fminf(v93, 0.99);
          LODWORD(v110) = vdiv_f32(v107, v77).u32[0];
          if (v108)
            v110 = 0.0;
          v111 = v84.f32[0] * v84.f32[1];
          if (v110 > 0.95 && v105 < 0.25)
          {
            v113 = v70[1];
            if (v113)
            {
              v114 = 0;
              v115 = a3 + 2;
              while (*(v115 - 1) != v113 || *v115 != 1)
              {
                ++v114;
                v115 += 431;
                if (v19 == v114)
                {
                  v109 = 0.0;
                  v62 = a8;
                  goto LABEL_126;
                }
              }
              v62 = a8;
              if ((float)(v111 / (float)(*(float *)&a3[431 * v114 + 207] + 0.0001)) <= 0.4)
                goto LABEL_126;
            }
            v109 = 0.0;
          }
LABEL_126:
          v123 = *v75;
          if (*((_BYTE *)v70 + 100))
          {
            if (v111 < (float)(v123 * 0.8) && *(_BYTE *)(a6 + (v67 << 9) + 100) == 0)
              v109 = 0.0;
          }
          else if (*(_BYTE *)(a6 + (v67 << 9) + 100))
          {
            v125 = v111 / v65;
            v126 = v111 * 0.8;
            if (v125 > 0.008 && v123 < v126)
              v109 = 0.0;
          }
          goto LABEL_139;
        }
        v109 = v88;
      }
      else
      {
        v117 = v71 == 10 && v92 == 11;
        v118 = (uint16x4_t)vmovn_s32((int32x4_t)vandq_s8((int8x16_t)vceqq_s32(v74, (int32x4_t)xmmword_2359168C0), (int8x16_t)vceqq_s32(vdupq_n_s32(v92), (int32x4_t)xmmword_2359168D0)));
        v120 = v71 == 11 && v92 == 10;
        v109 = v88;
        if ((vmaxv_u16(v118) & 1) == 0 && !v117 && !v120)
        {
          v30[v80] = 1065353216;
          goto LABEL_52;
        }
      }
LABEL_139:
      *(float *)&v30[v80] = 1.0 - v109;
      if ((float)(1.0 - v109) < 1.0 && v88 > 0.075)
      {
        ++v69;
        if (*(_DWORD *)(a6 + (v67 << 9) + 28) > 1u)
          ++v68;
      }
LABEL_52:
      ++v67;
      v79 = v80 + 1;
      v78 = v81 + 1;
    }
    while (v67 != v34);
    if (v71)
      goto LABEL_158;
    v143 = 0;
    v144 = 0;
    v145 = *(float *)(v62 + 188);
    v146 = v60;
    v147 = a15;
    v148 = v34;
    do
    {
      if (*(float *)&v30[v146] < 1.0)
      {
        if (*v147 <= v145)
          ++v143;
        else
          ++v144;
      }
      ++v147;
      ++v146;
      --v148;
    }
    while (v148);
    v149 = v70[1];
    v150 = 0.0;
    if (v149)
    {
      v151 = 0;
      v152 = a3 + 2;
      while (*(v152 - 1) != v149 || *v152 != 1)
      {
        ++v151;
        v152 += 431;
        if (v64 == v151)
          goto LABEL_193;
      }
      v153 = 0;
      v150 = *(float *)&a3[431 * v151 + 208];
      v62 = a8;
      if (!v144)
      {
LABEL_185:
        if (v150 < 0.45 || a3[431 * v59 + 209] > 2u)
          v155 = 1;
        else
          v155 = v153;
        if (!v155)
          goto LABEL_158;
      }
    }
    else
    {
LABEL_193:
      v153 = 1;
      v62 = a8;
      if (!v144)
        goto LABEL_185;
    }
    if (v143)
    {
      v156 = v60;
      v157 = a15;
      v158 = v34;
      do
      {
        if (*(float *)&v30[v156] < 1.0 && *v157 < *(float *)(v62 + 188))
          v30[v156] = 1065353216;
        ++v157;
        ++v156;
        --v158;
      }
      while (v158);
    }
LABEL_158:
    if (v69 < 2 || !v68)
    {
LABEL_204:
      v17 = v663;
      if (v71 || v69 < 2)
        goto LABEL_278;
      v163 = 0;
      v164 = 0;
      v165 = 0;
      v166 = 0.0;
      v167 = v60;
      v168 = (_BYTE *)(a6 + 100);
      v169 = v34;
      v170 = 0.0;
      do
      {
        v171 = *(float *)&v30[v167];
        v104 = v171 < 1.0;
        v172 = 1.0 - v171;
        if (v104 && v172 >= 0.2)
        {
          if (*v168)
          {
            if (v172 > v170)
              v170 = v172;
            v163 = *((_DWORD *)v168 - 15);
            v165 = 1;
          }
          else
          {
            if (v172 > v166)
              v166 = v172;
            v164 = 1;
          }
        }
        v168 += 512;
        ++v167;
        --v169;
      }
      while (v169);
      v62 = a8;
      if ((v165 & v164 & 1) == 0)
        goto LABEL_278;
      if (!*((_BYTE *)v70 + 100))
      {
        if ((float)(v170 / v166) > 0.93 && (float)(v170 / v166) < 1.07)
        {
          v191 = (_BYTE *)(a6 + 100);
          v192 = v34;
          do
          {
            if (*(float *)&v30[v60] < 1.0 && *v191)
              v30[v60] = 1065353216;
            v191 += 512;
            ++v60;
            --v192;
          }
          while (v192);
        }
        else if (v166 > v170)
        {
          v182 = (_BYTE *)(a6 + 100);
          v183 = v34;
          do
          {
            if (*(float *)&v30[v60] < 1.0 && *v182)
              v30[v60] = 1065353216;
            v182 += 512;
            ++v60;
            --v183;
          }
          while (v183);
        }
        goto LABEL_278;
      }
      v174 = v70[10];
      if ((v174 < v634 || v174 >= 91) && (v174 < 270 || v174 > 360 - v634))
      {
        v193 = (_BYTE *)(a6 + 100);
        v194 = v34;
        do
        {
          if (*(float *)&v30[v60] < 1.0 && *v193 != 1)
            v30[v60] = 1065353216;
          v193 += 512;
          ++v60;
          --v194;
        }
        while (v194);
        goto LABEL_278;
      }
      v175 = v170 / (float)(v166 + 1.1755e-38);
      if (v175 > 0.93 && v175 < 1.07)
      {
        v177 = &a3[431 * v59 + 212];
        v178 = *v177;
        if (*v177 <= 2)
        {
          v179 = (_BYTE *)(a6 + 100);
          v180 = v34;
          do
          {
            if (*(float *)&v30[v60] < 1.0 && *v179 != 1)
              v30[v60] = 1065353216;
            v179 += 512;
            ++v60;
            --v180;
          }
          while (v180);
          *v177 = v178 + 1;
          goto LABEL_278;
        }
      }
      v184 = &a3[431 * v59 + 202];
      v185 = *v184;
      if (*v184 && a3[431 * v59 + 203] + 1 == a3[431 * v59 + 130])
      {
        if ((v163 - 1) < 0x45)
        {
          v188 = (_BYTE *)(a6 + 100);
          v189 = v34;
          goto LABEL_274;
        }
        v186 = v163 - 291;
        v187 = (_BYTE *)(a6 + 100);
        v188 = (_BYTE *)(a6 + 100);
        v189 = v34;
        v190 = v34;
        if (v186 <= 0x44)
        {
          do
          {
LABEL_274:
            if (*(float *)&v30[v60] < 1.0 && *v188 == 1)
              v30[v60] = 1065353216;
            v188 += 512;
            ++v60;
            --v189;
          }
          while (v189);
          *(_QWORD *)v184 = 0;
          goto LABEL_278;
        }
      }
      else
      {
        v187 = (_BYTE *)(a6 + 100);
        v190 = v34;
      }
      do
      {
        if (*(float *)&v30[v60] < 1.0 && *v187 != 1)
          v30[v60] = 1065353216;
        v187 += 512;
        ++v60;
        --v190;
      }
      while (v190);
      *v184 = v185 + 1;
      a3[431 * v59 + 203] = a3[431 * v59 + 130];
      goto LABEL_278;
    }
    v17 = v663;
    if (v71 < 9 && ((0x13Fu >> v71) & 1) != 0)
    {
      v135 = 0;
      v136 = 0.0;
      v137 = v60;
      v138 = (_DWORD *)(a6 + 28);
      v139 = v34;
      v140 = 0.0;
      do
      {
        v141 = *(float *)&v30[v137];
        if (v141 < 1.0)
        {
          v142 = 1.0 - v141;
          if (*v138 < 2u)
          {
            if (v142 > v140)
              v140 = v142;
          }
          else
          {
            if (v142 > v63)
              v135 = 1;
            if (v142 > v136)
              v136 = v142;
          }
        }
        v138 += 128;
        ++v137;
        --v139;
      }
      while (v139);
      if (v136 <= v140)
        v159 = v135;
      else
        v159 = v135 + 1;
      v160 = v60;
      v161 = (_DWORD *)(a6 + 28);
      v162 = v34;
      if (v159 == 2)
      {
        do
        {
          if (*(float *)&v30[v160] < 1.0 && *v161 <= 1u)
            v30[v160] = 1065353216;
          v161 += 128;
          ++v160;
          --v162;
        }
        while (v162);
      }
      goto LABEL_204;
    }
LABEL_278:
    v195 = &a3[431 * v59];
    if (v195[202] && a3[431 * v59 + 203] != a3[431 * v59 + 130])
      *((_QWORD *)v195 + 101) = 0;
    if (v17 >= v19)
    {
      v61 = v661;
    }
    else
    {
      if (v656 < 8)
      {
        v196 = v17;
        v61 = v661;
        goto LABEL_289;
      }
      v196 = v17;
      v61 = v661;
      if (-2 - v80 < v651)
        goto LABEL_289;
      v197 = v655;
      do
      {
        v198 = &v30[v81];
        *v198 = v66;
        v198[1] = v66;
        v81 += 8;
        v197 -= 8;
      }
      while (v197);
      v79 += v655;
      v196 = v649;
      if (v656 != (_DWORD)v655)
      {
LABEL_289:
        v199 = v61 - v196;
        do
        {
          v30[v79++] = 0x40000000;
          --v199;
        }
        while (v199);
      }
    }
LABEL_48:
    ++v59;
    v60 = v79;
    if (v59 != v61)
      continue;
    break;
  }
  if (!(_DWORD)v19)
  {
    v681 = v17;
    v314 = a2;
    sub_2358F94A8(a3, 0, a6, v17, (uint64_t)v640, (uint64_t)__dst, v62, &v680, v666, &v681, (uint64_t)v647, (uint64_t)a15, v654, a2);
    v317 = v681;
    v28 = v660;
    if (v681)
      goto LABEL_602;
    goto LABEL_378;
  }
  __n = 4 * (v61 * v61);
  memcpy(__dst, v30, __n);
  bmMunkres((float *)v30, v61, v635, v200, v640, v201, 0, v202);
  v203 = (unsigned __int8 *)*((_QWORD *)&v691 + 1);
  v681 = v17;
  sub_2358F94A8(a3, v19, a6, v17, (uint64_t)v640, (uint64_t)__dst, v62, &v680, v666, &v681, (uint64_t)v647, (uint64_t)a15, v654, a2);
  if (!v681)
  {
    v318 = 0;
    v319 = 0;
    v314 = a2;
    v320 = (uint64_t)v666;
    v28 = v660;
    goto LABEL_380;
  }
  v204 = 0;
  v205 = 0;
  v206 = v34 << 9;
  v207 = vdupq_n_s32(0x47C35000u);
  v208 = v661;
  while (2)
  {
    if (v204 >= v19)
    {
      v233 = 0;
      v234 = __CFADD__(v205, v658);
      if (v208 < 8)
        goto LABEL_343;
      if (v234)
        goto LABEL_343;
      v235 = v657;
      v236 = v205;
      do
      {
        v237 = (int32x4_t *)&v32[v236];
        *v237 = v207;
        v237[1] = v207;
        v236 += 8;
        v235 -= 8;
      }
      while (v235);
      v205 += v657;
      v233 = v657;
      if ((_DWORD)v208 != (_DWORD)v657)
      {
LABEL_343:
        v238 = v208 - v233;
        do
        {
          v32[v205++] = 1203982336;
          --v238;
        }
        while (v238);
      }
    }
    else
    {
      v209 = 0;
      v210 = &a3[431 * v204];
      v211 = v210[2];
      v212 = vadd_f32(*(float32x2_t *)(v210 + 3), vadd_f32(*(float32x2_t *)(v210 + 3), *(float32x2_t *)(v210 + 5)));
      v213 = 0.5 * v212.f32[0];
      v214 = vmuls_lane_f32(0.5, v212, 1);
      v215 = vdupq_n_s32(v211);
      if ((v211 & 0xFFFFFFFE) == 0xA)
        v216 = 6;
      else
        v216 = 5;
      v218 = ((0x13Fu >> v211) & 1) == 0 || v211 > 8;
      v219 = v205 + 1;
      v220 = a15;
      do
      {
        v221 = v205;
        v222 = v219;
        v223 = v216;
        if (!v218)
          v223 = qword_235915288[v211];
        v224 = vadd_f32(*(float32x2_t *)(a6 + v209 + 12), vadd_f32(*(float32x2_t *)(a6 + v209 + 12), *(float32x2_t *)(a6 + v209 + 20)));
        v225 = 0.5 * v224.f32[0];
        v224.f32[0] = vmuls_lane_f32(0.5, v224, 1);
        v226 = sqrtf((float)((float)(v214 - v224.f32[0]) * (float)(v214 - v224.f32[0]))+ (float)((float)(v213 - v225) * (float)(v213 - v225)));
        if (v226 > (float)((float)((float)(*(float *)(v62 + 4 * v223 + 116) + 0.01)
                                  * (float)(*((float *)v210 + 5) + *((float *)v210 + 6)))
                          * 0.5))
          v226 = 100000.0;
        if (*v220 < *(float *)(v62 + 188) && !*(_BYTE *)(a6 + v209 + 100))
          v226 = 100000.0;
        v227 = *(_DWORD *)(a6 + v209 + 8);
        if ((_DWORD)v211 == v227)
        {
          *(float *)&v32[v205] = v226;
        }
        else
        {
          v229 = (_DWORD)v211 == 10 && v227 == 11;
          v230 = (uint16x4_t)vmovn_s32((int32x4_t)vandq_s8((int8x16_t)vceqq_s32(v215, (int32x4_t)xmmword_2359168C0), (int8x16_t)vceqq_s32(vdupq_n_s32(v227), (int32x4_t)xmmword_2359168D0)));
          v232 = (_DWORD)v211 == 11 && v227 == 10;
          if ((vmaxv_u16(v230) & 1) != 0 || v229 || v232)
          {
            *(float *)&v32[v221] = v226;
            v62 = a8;
          }
          else
          {
            v32[v221] = 1203982336;
            v62 = a8;
          }
        }
        v205 = v221 + 1;
        v209 += 512;
        ++v220;
        v219 = v222 + 1;
      }
      while (v206 != v209);
      v17 = v663;
      if (v663 >= v19)
      {
        v208 = v661;
      }
      else
      {
        if (v656 < 8)
        {
          v239 = v663;
          v208 = v661;
          goto LABEL_353;
        }
        v239 = v663;
        v240 = v655;
        v208 = v661;
        if (-2 - v221 < v651)
          goto LABEL_353;
        do
        {
          v241 = (int32x4_t *)&v32[v222];
          *v241 = v207;
          v241[1] = v207;
          v222 += 8;
          v240 -= 8;
        }
        while (v240);
        v205 += v655;
        v239 = v649;
        if (v656 != (_DWORD)v655)
        {
LABEL_353:
          v242 = v208 - v239;
          do
          {
            v32[v205++] = 1203982336;
            --v242;
          }
          while (v242);
        }
      }
    }
    if (++v204 != v208)
      continue;
    break;
  }
  memcpy(v633, v32, __n);
  bmMunkres((float *)v32, v208, v203, v311, v632, v312, 0, v313);
  v314 = a2;
  sub_2358FA1B4((uint64_t)a3, v19, a6, v17, (uint64_t)v632, (uint64_t)v633, v62, v666->i8, &v681, (uint64_t)v647, (void *)v33, (uint64_t)a15, v654, a2);
  if (v670 < 2)
  {
    v315 = 0;
    v316 = 0;
    v28 = v660;
    goto LABEL_597;
  }
  v492 = 0;
  v493 = 0;
  v315 = v670 & 0xFFFFFFFE;
  v494 = a3;
  v495 = v315;
  v28 = v660;
  do
  {
    if (v494[132] == 2)
      ++v492;
    if (v494[563] == 2)
      ++v493;
    v494 += 862;
    v495 -= 2;
  }
  while (v495);
  v316 = v493 + v492;
  if (v315 != v670)
  {
LABEL_597:
    v496 = v670 - v315;
    v497 = &a3[431 * v315 + 132];
    do
    {
      if (*v497 == 2)
        ++v316;
      v497 += 431;
      --v496;
    }
    while (v496);
  }
  v680 = v316;
  v317 = v681;
  if (!v681)
  {
LABEL_378:
    v318 = 0;
    v319 = 0;
    v320 = (uint64_t)v666;
    goto LABEL_380;
  }
LABEL_602:
  v498 = 0;
  v319 = 0;
  v318 = 0;
  v499 = v317;
  v320 = (uint64_t)v666;
  do
  {
    v500 = *(unsigned int *)(v320 + 4 * v498);
    v501 = (_DWORD *)(a6 + (v500 << 9));
    if (v501[7] < 2u)
    {
      if (v501[2])
        goto LABEL_609;
      v502 = a6 + (v500 << 9);
      if (*(_BYTE *)(v502 + 100) || a15[v500] >= *(float *)(a8 + 188))
      {
        v503 = 0;
        v504 = (float *)(v502 + 12);
        v506 = *(float *)(v502 + 20);
        v505 = *(float *)(v502 + 24);
        v507 = v505 * v506;
        v508 = (float *)(v502 + 16);
        v509 = 0.0;
        do
        {
          if (v498 != v503)
          {
            v510 = a6 + ((unint64_t)*(unsigned int *)(v320 + 4 * v503) << 9);
            if (*(_DWORD *)(v510 + 8) == 1)
            {
              v511 = *v504;
              v512 = *v504 + v506;
              v513 = *v508;
              v514 = *v508 + v505;
              v515 = *(float *)(v510 + 12);
              v516 = *(float *)(v510 + 16);
              v517 = 0.0;
              if (v512 > v515 && v514 > v516)
              {
                v519 = *(float *)(v510 + 20);
                v520 = *(float *)(v510 + 24);
                v521 = v516 + v520;
                if ((float)(v515 + v519) > v511 && v521 > v513)
                {
                  v523 = fmaxf(fminf(v512, v515 + v519) - fmaxf(v511, v515), 0.0)
                       * fmaxf(fminf(v514, v521) - fmaxf(v513, v516), 0.0);
                  v517 = v523 / fmaxf((float)(v507 + (float)(v519 * v520)) - v523, 0.00001);
                }
              }
              if (v517 > v509)
                v509 = v517;
            }
          }
          ++v503;
        }
        while (v499 != v503);
        if (v509 <= 0.85 || (float)(v507 / v65) >= 0.11)
        {
LABEL_609:
          memcpy((void *)(*((_QWORD *)&v33 + 1) + ((unint64_t)v319 << 9)), v501, 0x200uLL);
          v320 = (uint64_t)v666;
          *(_DWORD *)(v652 + 4 * v319++) = v500;
        }
      }
    }
    else
    {
      if (v498 != v318)
        *(_DWORD *)(v320 + 4 * v318) = v500;
      ++v318;
    }
    v28 = v660;
    ++v498;
  }
  while (v498 != v499);
LABEL_380:
  v672 = v318;
  v681 = v318;
  if (*a14 <= v319)
    v321 = v319;
  else
    v321 = *a14;
  v322 = a8;
  v323 = v19;
  if (v321)
  {
    sub_2358FA7DC((uint64_t)a13, *a14, *((uint64_t *)&v33 + 1), v319, v638, a8, a15);
    memcpy(*((void **)&v638 + 1), (const void *)v638, 4 * v321 * v321);
    bmMunkres((float *)v638, v321, v637, v324, v639, v325, 0, v326);
    __src[0] = 0;
    v679 = 0;
    sub_2358FADA8(a13, *a14, *((_DWORD **)&v33 + 1), v319, (uint64_t)v639, *((uint64_t *)&v638 + 1), (float *)a9, v646, v641, &v679, __src);
    v659 = *((_QWORD *)&v700 + 1);
    __na = __src[0];
    if (__src[0])
    {
      v327 = (int *)v641;
      v328 = (_BYTE *)*((_QWORD *)&v700 + 1);
      v329 = __src[0];
      do
      {
        v330 = *v327++;
        *v328++ = a13[520 * v639[v330] + 516];
        --v329;
      }
      while (v329);
    }
    v331 = *a14;
    if ((_DWORD)v331)
    {
      v332 = 0;
      v333 = 0;
      v334 = (unsigned int *)(a9 + 88);
      v335 = a13;
      v336 = *((_QWORD *)&v33 + 1);
      v337 = (unsigned int *)v646;
      do
      {
        v338 = *((_DWORD *)v335 + 128);
        if (v338)
        {
          v339 = *((unsigned int *)v335 + 2);
          switch((int)v339)
          {
            case 0:
              if (v335[100])
              {
                if (v338 < *v334)
                  goto LABEL_403;
              }
              else if (v338 < *(_DWORD *)(a9 + 84))
              {
                goto LABEL_403;
              }
              break;
            case 1:
              goto LABEL_402;
            case 2:
            case 4:
              v339 = 2;
              goto LABEL_402;
            case 3:
            case 5:
              v339 = 3;
              goto LABEL_402;
            case 8:
              v339 = 4;
              goto LABEL_402;
            default:
              v100 = (v339 & 0xFFFFFFFE) == 10;
              v339 = 5;
              if (v100)
                v339 = 6;
LABEL_402:
              if (v338 < v334[v339])
              {
LABEL_403:
                if (v332 != v333)
                {
                  memcpy(&a13[520 * v333], v335, 0x208uLL);
                  v337 = (unsigned int *)v646;
                  v336 = *((_QWORD *)&v33 + 1);
                }
                ++v333;
              }
              break;
          }
        }
        v335 += 520;
        ++v332;
      }
      while (v331 != v332);
    }
    else
    {
      v333 = 0;
      v336 = *((_QWORD *)&v33 + 1);
      v337 = (unsigned int *)v646;
    }
    *a14 = v333;
    v340 = v679;
    if (v679)
    {
      v662 = vdupq_n_s32(0xFFFFFE97);
      do
      {
        if (*(_DWORD *)(v336 + ((unint64_t)*v337 << 9) + 28))
        {
          v341 = &a13[520 * v333];
          *((_OWORD *)v341 + 30) = 0u;
          *((_OWORD *)v341 + 31) = 0u;
          *((_OWORD *)v341 + 28) = 0u;
          *((_OWORD *)v341 + 29) = 0u;
          *((_OWORD *)v341 + 26) = 0u;
          *((_OWORD *)v341 + 27) = 0u;
          *((_OWORD *)v341 + 24) = 0u;
          *((_OWORD *)v341 + 25) = 0u;
          *((_OWORD *)v341 + 22) = 0u;
          *((_OWORD *)v341 + 23) = 0u;
          *((_OWORD *)v341 + 20) = 0u;
          *((_OWORD *)v341 + 21) = 0u;
          *((_OWORD *)v341 + 18) = 0u;
          *((_OWORD *)v341 + 19) = 0u;
          *((_OWORD *)v341 + 16) = 0u;
          *((_OWORD *)v341 + 17) = 0u;
          *((_OWORD *)v341 + 14) = 0u;
          *((_OWORD *)v341 + 15) = 0u;
          *((_OWORD *)v341 + 12) = 0u;
          *((_OWORD *)v341 + 13) = 0u;
          *((_OWORD *)v341 + 10) = 0u;
          *((_OWORD *)v341 + 11) = 0u;
          *((_OWORD *)v341 + 8) = 0u;
          *((_OWORD *)v341 + 9) = 0u;
          *((_OWORD *)v341 + 6) = 0u;
          *((_OWORD *)v341 + 7) = 0u;
          *((_OWORD *)v341 + 4) = 0u;
          *((_OWORD *)v341 + 5) = 0u;
          *((_OWORD *)v341 + 2) = 0u;
          *((_OWORD *)v341 + 3) = 0u;
          *(_OWORD *)v341 = 0u;
          *((_OWORD *)v341 + 1) = 0u;
          *((int32x4_t *)v341 + 2) = v662;
          *((_DWORD *)v341 + 12) = -361;
          *((_DWORD *)v341 + 32) = -1;
          *((_DWORD *)v341 + 98) = -1;
          *((_DWORD *)v341 + 105) = -1;
          *((_DWORD *)v341 + 128) = 0;
          v341[516] = 0;
          v342 = v337;
          memcpy(&a13[520 * *a14], (const void *)(*((_QWORD *)&v33 + 1) + ((unint64_t)*v337 << 9)), 0x200uLL);
          v337 = v342;
          v336 = *((_QWORD *)&v33 + 1);
          v343 = *v342;
          v344 = *((_QWORD *)&v33 + 1) + (v343 << 9);
          if (!*(_DWORD *)(v344 + 8)
            && *(_BYTE *)(v344 + 100)
            && a15[*(unsigned int *)(v652 + 4 * v343)] < *(float *)(a9 + 32))
          {
            a13[520 * *a14 + 516] = 1;
          }
          v333 = *a14 + 1;
          *a14 = v333;
        }
        ++v337;
        --v340;
      }
      while (v340);
    }
    if (!v333)
      goto LABEL_451;
    v345 = 0;
    v346 = 0;
    v347 = (int *)v700;
    do
    {
      v348 = &a13[520 * v345];
      if (!*((_DWORD *)v348 + 2))
      {
        if (!v333)
          goto LABEL_451;
        v349 = 0;
        v351 = *((float *)v348 + 5);
        v350 = *((float *)v348 + 6);
        v352 = (float *)(a13 + 12);
        do
        {
          if (v345 != v349 && !*((_DWORD *)v352 - 1))
          {
            v354 = v352[2];
            v353 = v352[3];
            v355 = *((float *)v348 + 3);
            v356 = *((float *)v348 + 4);
            v357 = v356 + v350;
            v358 = v352[1];
            v359 = *v352 + v354;
            v360 = v358 + v353;
            v361 = (float)(v355 + v351) > *v352 && v357 > v358;
            v362 = v361 && v359 > v355;
            if (v362 && v360 > v356)
            {
              v364 = v354 * v353;
              if ((float)((float)(fmaxf(fminf(v355 + v351, v359) - fmaxf(v355, *v352), 0.0)
                                 * fmaxf(fminf(v357, v360) - fmaxf(v356, v358), 0.0))
                         / fmaxf(fminf(v350 * v351, v364), 0.00001)) > 0.9
                && v364 > (float)((float)(v350 * v351) * 1.5))
              {
                v347[v346++] = v349;
                v333 = *a14;
              }
            }
          }
          ++v349;
          v352 += 130;
        }
        while (v349 < v333);
      }
      ++v345;
    }
    while (v345 < v333);
    if (v333)
    {
      v366 = 0;
      v367 = 0;
      do
      {
        v368 = v346;
        v369 = v347;
        if (v346)
        {
          while (1)
          {
            v370 = *v369++;
            if (v366 == v370)
              break;
            if (!--v368)
              goto LABEL_449;
          }
        }
        else
        {
LABEL_449:
          if (v366 != v367)
          {
            memcpy(&a13[520 * v367], &a13[520 * v366], 0x208uLL);
            v333 = *a14;
          }
          ++v367;
        }
        ++v366;
      }
      while (v366 < v333);
    }
    else
    {
LABEL_451:
      v367 = 0;
    }
    *a14 = v367;
    if ((_DWORD)__na)
    {
      v371 = 0;
      v372 = a2;
      v322 = a8;
      v28 = v660;
      v323 = v19;
      v373 = v641;
      while (1)
      {
        v374 = *(unsigned int *)(v652 + 4 * *(unsigned int *)(v373 + 4 * v371));
        v375 = a6 + (v374 << 9);
        v376 = *(_DWORD *)(v375 + 8);
        if (v376 != 1 || v323 == 0)
        {
          if (!v376)
          {
            if (!v323)
              goto LABEL_496;
            v398 = 0;
            v399 = 0;
            v400 = (float *)(a6 + (v374 << 9));
            v401 = v400 + 3;
            v402 = v400 + 5;
            v403 = v400 + 4;
            v404 = v400 + 6;
            v405 = -1.0;
            v406 = (float *)(a3 + 6);
            do
            {
              if (*((_DWORD *)v406 - 4) == 1)
              {
                v407 = *v401;
                v408 = *v401 + *v402;
                v409 = *v403;
                v410 = *v403 + *v404;
                v411 = *(v406 - 3);
                v412 = *(v406 - 2);
                v413 = 0.0;
                if (v408 > v411 && v410 > v412)
                {
                  v415 = *(v406 - 1);
                  v416 = v412 + *v406;
                  if ((float)(v411 + v415) > v407 && v416 > v409)
                  {
                    v418 = fmaxf(fminf(v408, v411 + v415) - fmaxf(v407, v411), 0.0)
                         * fmaxf(fminf(v410, v416) - fmaxf(v409, v412), 0.0);
                    v413 = v418 / fmaxf((float)((float)(*v402 * *v404) + (float)(v415 * *v406)) - v418, 0.00001);
                  }
                }
                if (v413 > v405)
                {
                  v399 = v398;
                  v405 = v413;
                }
              }
              v406 += 431;
              ++v398;
            }
            while (v19 != v398);
            if (v405 <= 0.0)
            {
LABEL_496:
              v28 = v660;
              if (*(_BYTE *)(v659 + v371))
                goto LABEL_456;
              goto LABEL_455;
            }
            v419 = a3[431 * v399 + 1];
            if (v323 < 2)
            {
              v420 = 0;
              v421 = 0;
              goto LABEL_507;
            }
            v422 = 0;
            v423 = 0;
            v424 = a3;
            v425 = v19 & 0xFFFFFFFE;
            do
            {
              if (v424[1] == v419)
                ++v422;
              if (v424[432] == v419)
                ++v423;
              v424 += 862;
              v425 -= 2;
            }
            while (v425);
            v421 = v423 + v422;
            v420 = v19 & 0xFFFFFFFE;
            v322 = a8;
            v323 = v19;
            v373 = v641;
            if (v420 != v19)
            {
LABEL_507:
              v426 = v19 - v420;
              v427 = &a3[431 * v420 + 1];
              do
              {
                if (*v427 == v419)
                  ++v421;
                v427 += 431;
                --v426;
              }
              while (v426);
            }
            v428 = v399;
            if (*(_BYTE *)(v659 + v371))
            {
              v28 = v660;
              if (v421 > 1 || *(float *)&a3[431 * v428 + 131] < 0.7)
                goto LABEL_456;
            }
            else
            {
              v429 = v421 != 1 || v405 <= 0.6;
              v28 = v660;
              if (!v429)
              {
                v430 = *v404 * *v402;
                if (v430 > (float)(*(float *)&a3[431 * v428 + 207] * 0.8) && (float)(v430 / v65) < 0.15)
                  goto LABEL_456;
              }
            }
          }
        }
        else
        {
          v378 = 0;
          v379 = (float *)(v375 + 12);
          v380 = (float *)(v375 + 20);
          v381 = (float *)(v375 + 16);
          v382 = (float *)(v375 + 24);
          v383 = 1;
          v384 = (float *)(a3 + 6);
          do
          {
            if (*((_DWORD *)v384 - 4) == 1)
            {
              v385 = *v379;
              v386 = *v379 + *v380;
              v387 = *v381;
              v388 = *v381 + *v382;
              v390 = *(v384 - 2);
              v389 = *(v384 - 1);
              v391 = *(v384 - 3);
              v392 = v391 + v389;
              v393 = v390 + *v384;
              v394 = v386 > v391 && v388 > v390;
              v395 = v394 && v392 > v385;
              if (v395 && v393 > v387)
              {
                v397 = fmaxf(fminf(v386, v392) - fmaxf(v385, v391), 0.0)
                     * fmaxf(fminf(v388, v393) - fmaxf(v387, v390), 0.0);
                if ((float)(v397 / fmaxf((float)((float)(*v380 * *v382) + (float)(v389 * *v384)) - v397, 0.00001)) > 0.4)
                  break;
              }
            }
            v384 += 431;
            v383 = ++v378 < (unint64_t)v19;
          }
          while (v19 != v378);
          if (v383)
            goto LABEL_456;
        }
LABEL_455:
        v666->i32[v672++] = v374;
LABEL_456:
        if (++v371 == __na)
          goto LABEL_526;
      }
    }
    v372 = a2;
    v322 = a8;
    v28 = v660;
    v323 = v19;
LABEL_526:
    v681 = v672;
    v320 = (uint64_t)v666;
    v314 = v372;
  }
  v432 = *(_QWORD *)v688;
  acFilterMultiFaceinSameUbody((uint64_t)a3, v323, *(float32x2_t **)v688, a6, v320, &v681, (float *)(v322 + 144), (char *)v693[1], v654, v314);
  if (v323)
  {
    v433 = v432 + 16;
    v434 = (float32x2_t *)(a3 + 5);
    do
    {
      v439 = v434[-2].i32[1] - 1;
      if (v439 <= 0xB)
        v435 = dword_23591559C[v439];
      else
        v435 = 0;
      v436 = v434[-1];
      v437 = vadd_f32(v436, *v434);
      v438 = (float)v434[1].u32[0];
      *(float32x2_t *)(v433 - 16) = v436;
      *(float32x2_t *)(v433 - 8) = v437;
      *(_DWORD *)v433 = v435;
      *(float *)(v433 + 8) = v438 / 1000.0;
      v433 += 32;
      v434 = (float32x2_t *)((char *)v434 + 1724);
      --v19;
    }
    while (v19);
  }
  v440 = v681;
  if (!v681)
  {
    v442 = 0;
    v452 = *(_OWORD **)&v688[2];
LABEL_552:
    v40 = a8;
    v35 = a5;
    goto LABEL_553;
  }
  v441 = 0;
  v442 = 0;
  v443 = *(float *)(a8 + 36);
  v444 = *(float *)(a8 + 48);
  v445 = v666;
  do
  {
    v446 = v445->u32[v441];
    v447 = a6 + (v446 << 9);
    v448 = *(_DWORD *)(v447 + 8) - 1;
    if (v448 > 0xB)
      v449 = 0;
    else
      v449 = dword_23591559C[v448];
    v450 = vadd_f32(*(float32x2_t *)(v447 + 12), *(float32x2_t *)(v447 + 20));
    v451 = (float)*(unsigned int *)(v447 + 28);
    v676[0] = *(_QWORD *)(v447 + 12);
    v676[1] = v450;
    v677 = v449;
    v678 = v451 / 1000.0;
    if (acCheckOverlapBox(v432, v668, (uint64_t)v676, v443, v444))
    {
      v445 = v666;
    }
    else
    {
      v445 = v666;
      if (v441 != v442)
        v666->i32[v442] = v446;
      ++v442;
    }
    ++v441;
  }
  while (v440 != v441);
  v452 = *(_OWORD **)&v688[2];
  if (!v442)
    goto LABEL_552;
  v453 = 0;
  v35 = a5;
  do
  {
    v460 = v445->i32[0];
    v445 = (int32x4_t *)((char *)v445 + 4);
    v459 = v460;
    v461 = a6 + ((unint64_t)v460 << 9);
    v462 = *(_DWORD *)(v461 + 8) - 1;
    if (v462 <= 0xB)
      v454 = dword_23591559C[v462];
    else
      v454 = 0;
    v455 = *(float32x2_t *)(v461 + 12);
    v456 = vadd_f32(v455, *(float32x2_t *)(v461 + 20));
    v457 = (float)*(unsigned int *)(v461 + 28) / 1000.0;
    v458 = (float32x2_t *)&v452[v453];
    *v458 = v455;
    v458[1] = v456;
    v458[3].f32[0] = v457;
    v458[2].i32[0] = v454;
    v458[2].i32[1] = v459;
    v453 += 2;
  }
  while (2 * v442 != v453);
  v40 = a8;
LABEL_553:
  v463 = acRemoveOverlapBoxes(v452, v442, (unsigned __int8 *)v689[0], *(float *)(v40 + 48));
  v25 = (uint64_t)v666;
  v29 = v647;
  v26 = v643;
  if (v463)
  {
    if (v463 > 0xA
      && (v666 < (int32x4_t *)((char *)&v452[2 * v463 - 1] + 8)
        ? (v464 = (char *)v452 + 20 >= &v666->i8[4 * v463])
        : (v464 = 1),
          v464))
    {
      v465 = v463 & 3;
      if ((v463 & 3) == 0)
        v465 = 4;
      v466 = v463 - v465;
      v467 = (int32x2_t *)&v666->u64[1];
      v468 = (int32x2_t *)((char *)v452 + 84);
      v469 = v466;
      do
      {
        v470 = vzip1_s32(*v468, v468[4]);
        v467[-1] = vzip1_s32(v468[-8], v468[-4]);
        *v467 = v470;
        v467 += 2;
        v468 += 16;
        v469 -= 4;
      }
      while (v469);
    }
    else
    {
      v466 = 0;
    }
    v471 = v463 - v466;
    v472 = &v666->i32[v466];
    v473 = (__int32 *)&v452[2 * v466 + 1] + 1;
    do
    {
      v474 = *v473;
      v473 += 8;
      *v472++ = v474;
      --v471;
    }
    while (v471);
  }
  v681 = v463;
  LODWORD(v19) = v680;
  v17 = v663;
LABEL_574:
  v477 = v668;
  if (v668 - (_DWORD)v19 + v463 > v35)
  {
    if (v642)
    {
      v478 = 0;
    }
    else
    {
      v489 = 0;
      v478 = 0;
      v490 = a3 + 132;
      do
      {
        if (*v490 == 1)
        {
          v491 = (_DWORD *)(v26 + 8 * v478);
          *v491 = v489;
          v491[1] = *(v490 - 2);
          ++v478;
        }
        ++v489;
        v490 += 431;
      }
      while (v668 != v489);
    }
    v479 = v29;
    v480 = v478;
    v644 = v26;
    bmHeapsort(v26, v478, 8uLL, (int (*)(uint64_t, uint64_t))sub_2358FAFFC);
    if (!v478)
    {
      v25 = (uint64_t)v666;
      v35 = a5;
      v29 = v479;
      goto LABEL_638;
    }
    v35 = a5;
    v481 = v668 + v463 - a5;
    if (v19 >= v481)
    {
      v25 = (uint64_t)v666;
      v29 = v479;
      goto LABEL_638;
    }
    v482 = v480 - 1;
    if (v480 - 1 >= v463 + v668 + ~(_DWORD)v19 - a5)
      v482 = v463 + v668 + ~(_DWORD)v19 - a5;
    v25 = (uint64_t)v666;
    v29 = v479;
    if (v482)
    {
      v483 = v482 + 1;
      v482 = (v482 + 1) & 0x1FFFFFFFELL;
      v484 = v644;
      v485 = (int *)(v644 + 8);
      v486 = v482;
      do
      {
        v487 = *(v485 - 2);
        v488 = *v485;
        v485 += 4;
        a3[431 * v487 + 132] = 2;
        a3[431 * v488 + 132] = 2;
        v486 -= 2;
      }
      while (v486);
      LODWORD(v19) = v19 + v482;
      if (v483 == v482)
        goto LABEL_638;
    }
    else
    {
      v484 = v644;
    }
    v524 = v482 + 1;
    v525 = (int *)(v484 + 8 * v482);
    do
    {
      v526 = *v525;
      v525 += 2;
      a3[431 * v526 + 132] = 2;
      LODWORD(v19) = v19 + 1;
      if (v524 >= v480)
        break;
      ++v524;
    }
    while (v19 < v481);
LABEL_638:
    v680 = v19;
    v17 = v663;
    v477 = v668;
  }
  acTrkObjectPickDet(v654, a2, (uint64_t)a3, v477, v35, a6, v17, v25, &v681, v645, (uint64_t)v630, (uint64_t)v29, v631, *(_BYTE *)(v40 + 194), *(_DWORD *)(v40 + 196));
  if (v642)
  {
    v527 = 0;
    v528 = v666;
    v529 = v648;
  }
  else
  {
    v601 = 0;
    v527 = 0;
    v602 = a3;
    v528 = v666;
    v529 = v648;
    do
    {
      if (v602[132] <= 1)
      {
        if (v601 != v527)
        {
          memcpy(&a3[431 * v527], v602, 0x6BCuLL);
          v528 = v666;
        }
        ++v527;
      }
      v602 += 431;
      ++v601;
    }
    while (v477 != v601);
  }
  if (v527 >= a5)
    v530 = a5;
  else
    v530 = v527;
  v531 = v681;
  if (v681 >= a5)
    v531 = a5;
  if (v531 + v530 <= a5)
    v532 = v531;
  else
    v532 = a5 - v530;
  if ((_DWORD)v532)
  {
    v667 = v531 + v530;
    v673 = vdupq_n_s32(0xFFFFFE97);
    *(_QWORD *)v669 = v530;
    LODWORD(v249) = v530;
    do
    {
      v573 = v528->u32[0];
      v574 = &v528->u32[1];
      v575 = v249;
      v576 = &a3[431 * v249];
      bzero(v576, 0x6BCuLL);
      *((int32x4_t *)v576 + 2) = v673;
      v576[12] = -361;
      v576[32] = -1;
      v576[98] = -1;
      v576[105] = -1;
      *(_QWORD *)(v576 + 193) = 0xFF7FFFFFFFFFFFFFLL;
      v576[198] = 0;
      *(_QWORD *)(v576 + 207) = 0;
      v577 = a6 + (v573 << 9);
      v576[209] = 0;
      memcpy(v576, (const void *)v577, 0x200uLL);
      v578 = (*a12)++;
      *v576 = v578;
      v576[131] = LODWORD(a15[v573]);
      v579 = *(_DWORD *)(v577 + 8);
      v580 = (__int128 *)(v577 + 12);
      v581 = *(_DWORD *)(v577 + 40);
      v582 = *(_DWORD *)(v577 + 44);
      v583 = *(_BYTE *)(v577 + 100);
      v584 = *(_DWORD *)(v577 + 420);
      if (v576[2] == 9)
      {
        v533 = *v580;
        v534 = &a3[431 * v575];
        *(_OWORD *)(v534 + 133) = v533;
        *((_BYTE *)v534 + 548) = v583;
        v534[141] = v584;
        v534[139] = v582;
        v534[138] = v581;
        v534[142] = v579;
        v534[195] = 1;
      }
      else
      {
        v585 = &a3[431 * v575];
        v586 = v585[195];
        if (v586 < 6)
        {
          v589 = (uint64_t)&a3[431 * v575 + 10 * v586];
          *(_OWORD *)(v589 + 532) = *v580;
          *(_BYTE *)(v589 + 548) = v583;
          *(_DWORD *)(v589 + 564) = v584;
          *(_DWORD *)(v589 + 556) = v582;
          *(_DWORD *)(v589 + 552) = v581;
          *(_DWORD *)(v589 + 568) = v579;
          ++v585[195];
        }
        else
        {
          v587 = *v580;
          v588 = &a3[431 * v575];
          *(_OWORD *)(v588 + 183) = v587;
          *((_BYTE *)v588 + 748) = v583;
          v588[191] = v584;
          v588[189] = v582;
          v588[188] = v581;
          v588[192] = v579;
        }
      }
      v528 = (int32x4_t *)v574;
      v535 = a6 + (v573 << 9);
      v536 = &a3[431 * v575];
      *((_OWORD *)v536 + 104) = *(_OWORD *)(v535 + 12);
      *((_OWORD *)v536 + 105) = *(_OWORD *)(v535 + 12);
      v537 = *(_OWORD *)(v535 + 212);
      v538 = *(_OWORD *)(v535 + 244);
      v539 = *(_OWORD *)(v535 + 196);
      *((_OWORD *)v536 + 61) = *(_OWORD *)(v535 + 228);
      *((_OWORD *)v536 + 62) = v538;
      *((_OWORD *)v536 + 59) = v539;
      *((_OWORD *)v536 + 60) = v537;
      v540 = *(_OWORD *)(v535 + 292);
      v542 = *(_OWORD *)(v535 + 260);
      v541 = *(_OWORD *)(v535 + 276);
      *((_OWORD *)v536 + 66) = *(_OWORD *)(v535 + 308);
      *((_OWORD *)v536 + 65) = v540;
      *((_OWORD *)v536 + 63) = v542;
      *((_OWORD *)v536 + 64) = v541;
      v543 = *(_OWORD *)(v535 + 356);
      v544 = *(_OWORD *)(v535 + 372);
      v545 = *(_OWORD *)(v535 + 340);
      *((_OWORD *)v536 + 67) = *(_OWORD *)(v535 + 324);
      *((_OWORD *)v536 + 70) = v544;
      *((_OWORD *)v536 + 69) = v543;
      *((_OWORD *)v536 + 68) = v545;
      v546 = *(_OWORD *)(v535 + 132);
      v547 = *(_OWORD *)(v535 + 148);
      v548 = *(_OWORD *)(v535 + 180);
      *((_OWORD *)v536 + 57) = *(_OWORD *)(v535 + 164);
      *((_OWORD *)v536 + 58) = v548;
      *((_OWORD *)v536 + 55) = v546;
      *((_OWORD *)v536 + 56) = v547;
      v549 = *(_OWORD *)(v535 + 132);
      v550 = *(_OWORD *)(v535 + 148);
      v551 = *(_OWORD *)(v535 + 164);
      *((_OWORD *)v536 + 74) = *(_OWORD *)(v535 + 180);
      *((_OWORD *)v536 + 73) = v551;
      *((_OWORD *)v536 + 72) = v550;
      *((_OWORD *)v536 + 71) = v549;
      v552 = *(_OWORD *)(v535 + 196);
      v553 = *(_OWORD *)(v535 + 212);
      v554 = *(_OWORD *)(v535 + 228);
      *((_OWORD *)v536 + 78) = *(_OWORD *)(v535 + 244);
      *((_OWORD *)v536 + 77) = v554;
      *((_OWORD *)v536 + 76) = v553;
      *((_OWORD *)v536 + 75) = v552;
      v555 = *(_OWORD *)(v535 + 260);
      v556 = *(_OWORD *)(v535 + 276);
      v557 = *(_OWORD *)(v535 + 292);
      *((_OWORD *)v536 + 82) = *(_OWORD *)(v535 + 308);
      *((_OWORD *)v536 + 81) = v557;
      *((_OWORD *)v536 + 80) = v556;
      *((_OWORD *)v536 + 79) = v555;
      v558 = *(_OWORD *)(v535 + 324);
      v559 = *(_OWORD *)(v535 + 340);
      v560 = *(_OWORD *)(v535 + 356);
      *((_OWORD *)v536 + 86) = *(_OWORD *)(v535 + 372);
      *((_OWORD *)v536 + 85) = v560;
      *((_OWORD *)v536 + 84) = v559;
      *((_OWORD *)v536 + 83) = v558;
      v561 = *(_OWORD *)(v535 + 132);
      v562 = *(_OWORD *)(v535 + 148);
      v563 = *(_OWORD *)(v535 + 164);
      *((_OWORD *)v536 + 90) = *(_OWORD *)(v535 + 180);
      *((_OWORD *)v536 + 89) = v563;
      *((_OWORD *)v536 + 88) = v562;
      *((_OWORD *)v536 + 87) = v561;
      v564 = *(_OWORD *)(v535 + 196);
      v565 = *(_OWORD *)(v535 + 212);
      v566 = *(_OWORD *)(v535 + 228);
      *((_OWORD *)v536 + 94) = *(_OWORD *)(v535 + 244);
      *((_OWORD *)v536 + 93) = v566;
      *((_OWORD *)v536 + 92) = v565;
      *((_OWORD *)v536 + 91) = v564;
      v567 = *(_OWORD *)(v535 + 260);
      v568 = *(_OWORD *)(v535 + 276);
      v569 = *(_OWORD *)(v535 + 292);
      *((_OWORD *)v536 + 98) = *(_OWORD *)(v535 + 308);
      *((_OWORD *)v536 + 97) = v569;
      *((_OWORD *)v536 + 96) = v568;
      *((_OWORD *)v536 + 95) = v567;
      v570 = *(_OWORD *)(v535 + 324);
      v571 = *(_OWORD *)(v535 + 340);
      v572 = *(_OWORD *)(v535 + 356);
      *((_OWORD *)v536 + 102) = *(_OWORD *)(v535 + 372);
      *((_OWORD *)v536 + 101) = v572;
      *((_OWORD *)v536 + 100) = v571;
      *((_OWORD *)v536 + 99) = v570;
      *((float *)v536 + 412) = (float)*(unsigned int *)(v535 + 28);
      v249 = (v575 + 1);
      --v532;
    }
    while (v532);
    v530 = *(_QWORD *)v669;
    v590 = v249 - v669[0];
    *a10 = v249 - v669[0];
    if (v249 <= v669[0])
    {
      v594 = a11;
      *a11 = 0;
      v28 = v660;
      v529 = v648;
      if (!v669[0])
        goto LABEL_695;
      goto LABEL_685;
    }
    if (a5 >= v667)
      v591 = v667;
    else
      v591 = a5;
    v592 = v591 - *(_QWORD *)v669;
    v593 = *(_QWORD *)v669;
    v594 = a11;
    v28 = v660;
    v529 = v648;
    if (v592 <= 7)
    {
      do
      {
LABEL_666:
        v660->i32[v593 - *(_QWORD *)v669] = v593;
        ++v593;
      }
      while (v249 != v593);
    }
    else
    {
      v595 = v592 & 0xFFFFFFFFFFFFFFF8;
      v596 = vaddq_s32(vdupq_n_s32(v669[0]), (int32x4_t)xmmword_2359168E0);
      v597 = v660 + 1;
      v598.i64[0] = 0x400000004;
      v598.i64[1] = 0x400000004;
      v599.i64[0] = 0x800000008;
      v599.i64[1] = 0x800000008;
      v600 = v592 & 0xFFFFFFFFFFFFFFF8;
      do
      {
        v597[-1] = v596;
        *v597 = vaddq_s32(v596, v598);
        v596 = vaddq_s32(v596, v599);
        v597 += 2;
        v600 -= 8;
      }
      while (v600);
      if (v592 != v595)
      {
        v593 = v595 + *(_QWORD *)v669;
        goto LABEL_666;
      }
    }
    *a11 = 0;
    if (a6)
    {
LABEL_668:
      if (!(_DWORD)v530)
        goto LABEL_695;
LABEL_685:
      v603 = 0;
      v604 = a3 + 128;
      do
      {
        if (!*v604)
        {
          v28->i32[v590++] = v603;
          ++*v594;
        }
        v604 += 431;
        ++v603;
      }
      while (v530 != v603);
      v605 = 0;
      v606 = a3 + 128;
      do
      {
        if (*v606)
          v28->i32[v590++] = v605;
        v606 += 431;
        ++v605;
      }
      while (v530 != v605);
      goto LABEL_695;
    }
  }
  else
  {
    v590 = 0;
    v594 = a11;
    *a10 = 0;
    v249 = v530;
    *a11 = 0;
    if (a6)
      goto LABEL_668;
  }
  if (!(_DWORD)v530)
    goto LABEL_695;
  if (v530 <= 0xB || __CFADD__(v590, v530 - 1))
  {
    for (i = 0; i != v530; ++i)
LABEL_682:
      v28->i32[v590 + i] = i;
    goto LABEL_695;
  }
  v607 = (int32x4_t)xmmword_2359168E0;
  i = v530 & 0xFFFFFFF8;
  v609.i64[0] = 0x400000004;
  v609.i64[1] = 0x400000004;
  v610.i64[0] = 0x800000008;
  v610.i64[1] = 0x800000008;
  v611 = v590;
  v612 = i;
  do
  {
    v613 = (int32x4_t *)((char *)v28 + 4 * v611);
    *v613 = v607;
    v613[1] = vaddq_s32(v607, v609);
    v607 = vaddq_s32(v607, v610);
    v611 += 8;
    v612 -= 8;
  }
  while (v612);
  if (i != v530)
    goto LABEL_682;
LABEL_695:
  bzero(v529, v249);
  if ((_DWORD)v249)
  {
    v614 = 0;
    do
    {
      if (!*((_BYTE *)v529 + v614))
      {
        memcpy(__src, &a3[431 * v614], 0x6BCuLL);
        *((_BYTE *)v529 + v614) = 1;
        v615 = v28->u32[v614];
        v616 = v529;
        v617 = v614;
        if (v614 != v615)
        {
          v617 = v614;
          do
          {
            memcpy(&a3[431 * v617], &a3[431 * v615], 0x6BCuLL);
            v617 = v28->u32[v617];
            v616[v617] = 1;
            v615 = v28->u32[v617];
          }
          while (v614 != v615);
        }
        memcpy(&a3[431 * v617], __src, 0x6BCuLL);
        v529 = v616;
      }
      ++v614;
    }
    while (v614 != v249);
    v618 = 0;
    v619 = *(float *)(a8 + 188);
    do
    {
      v623 = (float *)&a3[v618];
      v624 = a3[v618 + 130];
      if (v624 == -1)
        v625 = -1;
      else
        v625 = v624 + 1;
      *((_DWORD *)v623 + 130) = v625;
      v626 = v623[5] * v623[6];
      v623[207] = v626;
      v623[208] = v626 / (float)((float)(a2 * v654) + 0.0001);
      if (!*((_DWORD *)v623 + 2))
      {
        ++*((_DWORD *)v623 + 196);
        if (*((_BYTE *)v623 + 100))
        {
          v627 = &a3[v618];
          ++a3[v618 + 206];
          v622 = a3[v618 + 11];
          if (v622 >= 501)
          {
            v622 -= 1080;
            v627[11] = v622;
          }
          v620 = (v622 + 540) % 360;
          if (v620 > 0xFFFFFE97)
            v620 += 360;
          v621 = (int)(float)((float)((float)v620 / 30.0) + 0.5) % 12;
          if (v621 > 0xFFFFFFF3)
            v621 += 12;
          v627[9] = *(_DWORD *)(a16 + 4 * v621);
          if ((float)((float)v622 + 0.00000011921) < 0.0)
            v622 += 360;
          v627[11] = v622;
        }
        else
        {
          v628 = &a3[v618];
          if (*(float *)&a3[v618 + 131] >= v619)
            v628[209] = 0;
          else
            ++v628[209];
        }
      }
      v618 += 431;
    }
    while (431 * v249 != v618);
  }
  return v249;
}

_DWORD *sub_2358F94A8(_DWORD *result, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7, _DWORD *a8, _DWORD *a9, _DWORD *a10, uint64_t a11, uint64_t a12, int a13, unsigned int a14)
{
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  _DWORD *v18;
  uint64_t v19;
  _DWORD *v20;
  uint64_t v21;
  uint64_t v22;
  _DWORD *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unsigned int v27;
  uint64_t v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  uint64_t v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  int v39;
  BOOL v40;
  int v41;
  _DWORD *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  float32x4_t v51;
  uint64_t v52;
  float32x4_t *v53;
  float v54;
  float *v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v61;
  BOOL v62;
  uint64_t v63;
  float32x4_t *v64;
  uint64_t v65;
  uint64_t i;
  uint64_t v67;
  uint64_t j;
  float32x4_t v69;
  float32x4_t v70;
  float32x4_t v71;
  float32x4_t v72;
  float32x4_t v73;
  float32x4_t v74;
  float32x4_t v75;
  float32x4_t v76;
  float32x4_t v77;
  float32x4_t v78;
  float32x4_t v79;
  float32x4_t v80;
  float32x4_t v81;
  float32x4_t v82;
  float32x4_t v83;
  float32x4_t v84;
  float32x4_t v85;
  float32x4_t v86;
  float32x4_t v87;
  float32x4_t v88;
  float v89;
  float v90;
  float v91;
  float v92;
  float32x4_t v93;
  float32x4_t v94;
  float32x4_t v95;
  float32x4_t v96;
  float32x4_t v97;
  float32x4_t v98;
  float32x4_t v99;
  float32x4_t v100;
  float32x4_t v101;
  float32x4_t v102;
  _DWORD *v103;
  uint64_t v104;
  _DWORD *v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v110;
  uint64_t v111;
  _DWORD *v112;
  int v113;
  int v114;
  _BYTE __dst[512];
  uint64_t v116;
  unsigned int v117[4];

  v15 = a3;
  v16 = a2;
  v17 = (uint64_t)result;
  v18 = a10;
  *a8 = 0;
  *a10 = 0;
  if (!a2)
    goto LABEL_9;
  if (a2 == 1)
  {
    v19 = 0;
  }
  else
  {
    v19 = a2 & 0xFFFFFFFE;
    v20 = result;
    v21 = v19;
    do
    {
      v20[132] = 0;
      v20[563] = 0;
      v20[112] = 1;
      v20[543] = 1;
      v20 += 862;
      v21 -= 2;
    }
    while (v21);
    if (v19 == a2)
      goto LABEL_9;
  }
  v22 = a2 - v19;
  v23 = &result[431 * v19 + 112];
  do
  {
    v23[20] = 0;
    *v23 = 1;
    v23 += 431;
    --v22;
  }
  while (v22);
LABEL_9:
  if (a2 <= a4)
    v24 = a4;
  else
    v24 = a2;
  if ((_DWORD)v24)
  {
    v25 = 0;
    v26 = a4;
    v27 = a14;
    v105 = result + 220;
    v28 = a3 + 132;
    v103 = result + 284;
    result = a9;
    v104 = a3 + 132;
    v111 = a6;
    v112 = a8;
    v110 = a5;
    v107 = v24;
    v106 = a4;
    while (1)
    {
      v29 = *(_DWORD *)(a5 + 4 * v25);
      if (v25 >= v26)
      {
        v36 = v17 + 1724 * v29;
        v33 = *(_DWORD *)(v36 + 512) + 1;
        *(_DWORD *)(v36 + 512) = v33;
        v34 = *(unsigned int *)(v36 + 8);
        switch((int)v34)
        {
          case 0:
            if (*(_BYTE *)(v36 + 100))
            {
LABEL_43:
              v35 = *(_DWORD *)(a7 + 60);
              if (v16 > 2)
                v35 = 2;
            }
            else
            {
LABEL_21:
              v35 = 2;
            }
            goto LABEL_40;
          case 1:
            goto LABEL_39;
          case 2:
          case 4:
LABEL_23:
            v34 = 2;
            goto LABEL_39;
          case 3:
          case 5:
LABEL_25:
            v34 = 3;
            goto LABEL_39;
          case 8:
LABEL_38:
            v34 = 4;
            goto LABEL_39;
          default:
LABEL_35:
            v40 = (v34 & 0xFFFFFFFE) == 10;
            v34 = 5;
            if (v40)
              v34 = 6;
LABEL_39:
            v35 = *(_DWORD *)(a7 + 4 * v34 + 60);
LABEL_40:
            v42 = (_DWORD *)(v17 + 1724 * v29 + 528);
            if (v33 < v35)
            {
              *v42 = 1;
            }
            else
            {
              *v42 = 2;
              ++*a8;
            }
            break;
        }
        goto LABEL_15;
      }
      if (v29 < v16)
        break;
      v37 = *v18;
      *v18 = v37 + 1;
      result[v37] = v25;
LABEL_15:
      ++v25;
      v28 += 512;
      if (v25 == v24)
        return result;
    }
    v30 = v17 + 1724 * v29;
    if ((float)(1.0 - *(float *)(a6 + 4 * (v25 + v29 * (_DWORD)v24))) < *(float *)a7)
    {
      v31 = *v18;
      *v18 = v31 + 1;
      result[v31] = v25;
      v32 = v17 + 1724 * v29;
      v33 = *(_DWORD *)(v32 + 512) + 1;
      *(_DWORD *)(v32 + 512) = v33;
      v34 = *(unsigned int *)(v30 + 8);
      switch((int)v34)
      {
        case 0:
          if (!*(_BYTE *)(v30 + 100))
            goto LABEL_21;
          goto LABEL_43;
        case 1:
          goto LABEL_39;
        case 2:
        case 4:
          goto LABEL_23;
        case 3:
        case 5:
          goto LABEL_25;
        case 8:
          goto LABEL_38;
        default:
          goto LABEL_35;
      }
    }
    *(_DWORD *)(v17 + 1724 * v29 + 512) = 0;
    if (!*(_BYTE *)(a7 + 176))
      goto LABEL_73;
    v114 = *(_DWORD *)v30;
    v38 = *(_DWORD *)(v30 + 8);
    v39 = *(_DWORD *)(v15 + (v25 << 9) + 8);
    if (v38 == v39 || (v38 == 4 ? (v40 = v39 == 2) : (v40 = 0), v40))
    {
LABEL_51:
      v41 = *(_DWORD *)(v30 + 4);
    }
    else
    {
      v41 = 0;
      switch(v38)
      {
        case 2:
          if (v39 == 4)
            goto LABEL_51;
          goto LABEL_34;
        case 3:
          if (v39 == 5)
            goto LABEL_51;
          goto LABEL_34;
        case 5:
          if (v39 == 3)
            goto LABEL_51;
          goto LABEL_34;
        case 10:
          if (v39 == 11)
            goto LABEL_51;
          goto LABEL_34;
        case 11:
          if (v39 == 10)
            goto LABEL_51;
LABEL_34:
          v41 = 0;
          break;
        default:
          break;
      }
    }
    v113 = *(_DWORD *)(v30 + 8);
    v116 = 0;
    *(_QWORD *)v117 = 0;
    v43 = (char *)(v15 + (v25 << 9));
    acTrkLabelCenterSizeSmoothing((int *)v30, v43, v17, v16, a7, v41, a13, v27, (float *)&v117[1], (float *)v117, (float *)&v116 + 1, (float *)&v116);
    v44 = a7;
    v45 = v15;
    v46 = *(_DWORD *)(v30 + 44);
    memcpy((void *)v30, v43, 0x200uLL);
    *(_DWORD *)(v30 + 448) = 0;
    v47 = v45 + (v25 << 9);
    a7 = v44;
    v48 = *(_QWORD *)v117;
    *(float32x2_t *)(v30 + 12) = vadd_f32(*(float32x2_t *)(v30 + 12), vmul_f32(vsub_f32(*(float32x2_t *)(v47 + 20), (float32x2_t)__PAIR64__(v117[0], v117[1])), (float32x2_t)0x3F0000003F000000));
    *(_DWORD *)(v30 + 20) = HIDWORD(v48);
    *(_DWORD *)(v30 + 24) = v48;
    *(_DWORD *)v30 = v114;
    *(_DWORD *)(v30 + 4) = v41;
    if (*(_DWORD *)(v17 + 1724 * v29 + 788) < (*(_DWORD *)(v17 + 1724 * v29 + 804)
                                                              + *(_DWORD *)(v44 + 160))
      && *(_DWORD *)(v17 + 1724 * v29 + 792))
    {
      v49 = v116;
      *(_DWORD *)(v30 + 12) = HIDWORD(v116);
      *(_DWORD *)(v30 + 16) = v49;
    }
    memcpy(__dst, v43, sizeof(__dst));
    v50 = v44;
    v27 = a14;
    acTrkFacialAttrTemporalSmoothing(v30, (uint64_t)__dst, v46, v50, a14, a13, *(float *)(a12 + 4 * v25));
    if (*(_BYTE *)(a7 + 193))
      acTrkHandChiralityTemporalSmoothing((_DWORD *)v30, (uint64_t)v43, v113, *(_DWORD *)(a7 + 216), *(_DWORD *)(a7 + 220), *(_BYTE *)(a7 + 205), *(_DWORD *)(a7 + 208), *(_BYTE *)(a7 + 212));
    *(_DWORD *)(v17 + 1724 * v29 + 524) = *(_DWORD *)(a12 + 4 * v25);
    a6 = v111;
    a8 = v112;
    v15 = a3;
    a5 = v110;
    v16 = a2;
    v24 = v107;
    v18 = a10;
    v26 = v106;
    result = a9;
    if (*(_DWORD *)(v30 + 8) != 9)
    {
LABEL_73:
      *(_DWORD *)(a11 + 4 * v25) = v29;
      goto LABEL_15;
    }
    v52 = a3 + (v25 << 9);
    v54 = *(float *)(v52 + 132);
    v53 = (float32x4_t *)(v52 + 132);
    v55 = (float *)(v17 + 1724 * v29);
    v56 = (float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v55[220] + 0.0) + v55[221]) + v55[222]) + v55[223]) + v55[224]) + v55[225]) + v55[226]) + v55[227]) + v55[228]) + v55[229]) + v55[230]) + v55[231]) + v55[232]) + v55[233]) + v55[234]) + v55[235]) + v55[236]) + v55[237]) + v55[238]) + v55[239]) + v55[240]) + v55[241]) + v55[242]) + v55[243]) + v55[244]) + v55[245]) + v55[246]) + v55[247]) + v55[248]) + v55[249])
                                                                                                + v55[250])
                                                                                        + v55[251])
                                                                                + v55[252])
                                                                        + v55[253])
                                                                + v55[254])
                                                        + v55[255])
                                                + v55[256])
                                        + v55[257])
                                + v55[258])
                        + v55[259])
                + v55[260])
        + v55[261];
    v57 = v53[3].f32[0];
    v58 = (float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v54 * v54) + 0.0) + (float)(v53->f32[1] * v53->f32[1])) + (float)(v53->f32[2] * v53->f32[2])) + (float)(v53->f32[3] * v53->f32[3])) + (float)(v53[1].f32[0] * v53[1].f32[0])) + (float)(v53[1].f32[1] * v53[1].f32[1])) + (float)(v53[1].f32[2] * v53[1].f32[2])) + (float)(v53[1].f32[3] * v53[1].f32[3])) + (float)(v53[2].f32[0] * v53[2].f32[0]))
                                                                                                + (float)(v53[2].f32[1] * v53[2].f32[1]))
                                                                                        + (float)(v53[2].f32[2]
                                                                                                * v53[2].f32[2]))
                                                                                + (float)(v53[2].f32[3] * v53[2].f32[3]))
                                                                        + (float)(v57 * v57))
                                                                + (float)(v53[3].f32[1] * v53[3].f32[1]))
                                                        + (float)(v53[3].f32[2] * v53[3].f32[2]))
                                                + (float)(v53[3].f32[3] * v53[3].f32[3]))
                                        + (float)(v53[4].f32[0] * v53[4].f32[0]))
                                + (float)(v53[4].f32[1] * v53[4].f32[1]))
                        + (float)(v53[4].f32[2] * v53[4].f32[2]))
                + (float)(v53[4].f32[3] * v53[4].f32[3]))
        + (float)(v53[5].f32[0] * v53[5].f32[0]);
    v59 = v53[8].f32[0];
    v60 = (float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v58 + (float)(v53[5].f32[1] * v53[5].f32[1])) + (float)(v53[5].f32[2] * v53[5].f32[2])) + (float)(v53[5].f32[3] * v53[5].f32[3])) + (float)(v53[6].f32[0] * v53[6].f32[0])) + (float)(v53[6].f32[1] * v53[6].f32[1])) + (float)(v53[6].f32[2] * v53[6].f32[2])) + (float)(v53[6].f32[3] * v53[6].f32[3])) + (float)(v53[7].f32[0] * v53[7].f32[0])) + (float)(v53[7].f32[1] * v53[7].f32[1])) + (float)(v53[7].f32[2] * v53[7].f32[2]))
                                                                                                + (float)(v53[7].f32[3] * v53[7].f32[3]))
                                                                                        + (float)(v59 * v59))
                                                                                + (float)(v53[8].f32[1] * v53[8].f32[1]))
                                                                        + (float)(v53[8].f32[2] * v53[8].f32[2]))
                                                                + (float)(v53[8].f32[3] * v53[8].f32[3]))
                                                        + (float)(v53[9].f32[0] * v53[9].f32[0]))
                                                + (float)(v53[9].f32[1] * v53[9].f32[1]))
                                        + (float)(v53[9].f32[2] * v53[9].f32[2]))
                                + (float)(v53[9].f32[3] * v53[9].f32[3]))
                        + (float)(v53[10].f32[0] * v53[10].f32[0]))
                + (float)(v53[10].f32[1] * v53[10].f32[1]))
        + (float)(v53[10].f32[2] * v53[10].f32[2]);
    v61 = v53[13].f32[2];
    v62 = fabsf((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v56 + v55[262]) + v55[263]) + v55[264]) + v55[265]) + v55[266]) + v55[267]) + v55[268]) + v55[269]) + v55[270]) + v55[271])+ v55[272])+ v55[273])+ v55[274])+ v55[275])+ v55[276])+ v55[277])+ v55[278])+ v55[279])+ v55[280])+ v55[281])+ v55[282])+ v55[283]) < 0.0001;
    v51.f32[0] = sqrtf((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v60 + (float)(v53[10].f32[3] * v53[10].f32[3])) + (float)(v53[11].f32[0] * v53[11].f32[0])) + (float)(v53[11].f32[1] * v53[11].f32[1])) + (float)(v53[11].f32[2] * v53[11].f32[2])) + (float)(v53[11].f32[3] * v53[11].f32[3])) + (float)(v53[12].f32[0] * v53[12].f32[0])) + (float)(v53[12].f32[1] * v53[12].f32[1])) + (float)(v53[12].f32[2] * v53[12].f32[2])) + (float)(v53[12].f32[3] * v53[12].f32[3])) + (float)(v53[13].f32[0] * v53[13].f32[0]))+ (float)(v53[13].f32[1] * v53[13].f32[1]))+ (float)(v61 * v61))+ (float)(v53[13].f32[3]* v53[13].f32[3]))+ (float)(v53[14].f32[0] * v53[14].f32[0]))+ (float)(v53[14].f32[1] * v53[14].f32[1]))+ (float)(v53[14].f32[2] * v53[14].f32[2]))+ (float)(v53[14].f32[3] * v53[14].f32[3]))+ (float)(v53[15].f32[0] * v53[15].f32[0]))+ (float)(v53[15].f32[1] * v53[15].f32[1]))+ (float)(v53[15].f32[2] * v53[15].f32[2]))+ (float)(v53[15].f32[3] * v53[15].f32[3]))+ 0.0000001;
    v63 = v25 << 9;
    v64 = (float32x4_t *)(v55 + 220);
    v65 = 431 * v29;
    if (v62)
    {
      if ((unint64_t)&v105[v65] - v104 - v63 <= 0x1F)
      {
        for (i = 0; i != 64; ++i)
          v64->f32[i] = *(float *)(v28 + i * 4) / v51.f32[0];
        goto LABEL_72;
      }
      v69 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v51.f32, 0);
      v70 = vdivq_f32(v53[1], v69);
      *v64 = vdivq_f32(*v53, v69);
      v64[1] = v70;
      v71 = vdivq_f32(v53[3], v69);
      v64[2] = vdivq_f32(v53[2], v69);
      v64[3] = v71;
      v72 = vdivq_f32(v53[5], v69);
      v64[4] = vdivq_f32(v53[4], v69);
      v64[5] = v72;
      v73 = vdivq_f32(v53[7], v69);
      v64[6] = vdivq_f32(v53[6], v69);
      v64[7] = v73;
      v74 = vdivq_f32(v53[9], v69);
      v64[8] = vdivq_f32(v53[8], v69);
      v64[9] = v74;
      v75 = vdivq_f32(v53[11], v69);
      v64[10] = vdivq_f32(v53[10], v69);
      v64[11] = v75;
      v76 = vdivq_f32(v53[13], v69);
      v64[12] = vdivq_f32(v53[12], v69);
      v64[13] = v76;
      v77 = vdivq_f32(v53[14], v69);
      v51 = vdivq_f32(v53[15], v69);
    }
    else
    {
      v67 = a3 + v63;
      if ((unint64_t)v64 < v67 + 388 && v67 + 132 < (unint64_t)&v103[v65])
      {
        for (j = 0; j != 64; ++j)
          v64->f32[j] = (float)((float)(*(float *)(v28 + j * 4) * 0.2) / v51.f32[0]) + (float)(v64->f32[j] * 0.8);
        goto LABEL_72;
      }
      v78 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v51.f32, 0);
      v79 = (float32x4_t)vdupq_n_s32(0x3E4CCCCCu);
      v80 = (float32x4_t)vdupq_n_s32(0x3F4CCCCDu);
      v81 = vmlaq_f32(vdivq_f32(vmulq_f32(v53[1], v79), v78), v80, v64[1]);
      *v64 = vmlaq_f32(vdivq_f32(vmulq_f32(*v53, v79), v78), v80, *v64);
      v64[1] = v81;
      v82 = vmlaq_f32(vdivq_f32(vmulq_f32(v53[3], v79), v78), v80, v64[3]);
      v64[2] = vmlaq_f32(vdivq_f32(vmulq_f32(v53[2], v79), v78), v80, v64[2]);
      v64[3] = v82;
      v83 = vmlaq_f32(vdivq_f32(vmulq_f32(v53[5], v79), v78), v80, v64[5]);
      v64[4] = vmlaq_f32(vdivq_f32(vmulq_f32(v53[4], v79), v78), v80, v64[4]);
      v64[5] = v83;
      v84 = vmlaq_f32(vdivq_f32(vmulq_f32(v53[7], v79), v78), v80, v64[7]);
      v64[6] = vmlaq_f32(vdivq_f32(vmulq_f32(v53[6], v79), v78), v80, v64[6]);
      v64[7] = v84;
      v85 = vmlaq_f32(vdivq_f32(vmulq_f32(v53[9], v79), v78), v80, v64[9]);
      v64[8] = vmlaq_f32(vdivq_f32(vmulq_f32(v53[8], v79), v78), v80, v64[8]);
      v64[9] = v85;
      v86 = vmlaq_f32(vdivq_f32(vmulq_f32(v53[11], v79), v78), v80, v64[11]);
      v64[10] = vmlaq_f32(vdivq_f32(vmulq_f32(v53[10], v79), v78), v80, v64[10]);
      v64[11] = v86;
      v87 = vmlaq_f32(vdivq_f32(vmulq_f32(v53[13], v79), v78), v80, v64[13]);
      v64[12] = vmlaq_f32(vdivq_f32(vmulq_f32(v53[12], v79), v78), v80, v64[12]);
      v64[13] = v87;
      v88 = vmulq_f32(v53[15], v79);
      v77 = vmlaq_f32(vdivq_f32(vmulq_f32(v53[14], v79), v78), v80, v64[14]);
      v51 = vmlaq_f32(vdivq_f32(v88, v78), v80, v64[15]);
    }
    v64[14] = v77;
    v64[15] = v51;
LABEL_72:
    v89 = v64[3].f32[0];
    v51.f32[0] = (float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v64->f32[0] * v64->f32[0]) + 0.0) + (float)(v64->f32[1] * v64->f32[1])) + (float)(v64->f32[2] * v64->f32[2])) + (float)(v64->f32[3] * v64->f32[3])) + (float)(v64[1].f32[0] * v64[1].f32[0])) + (float)(v64[1].f32[1] * v64[1].f32[1])) + (float)(v64[1].f32[2] * v64[1].f32[2])) + (float)(v64[1].f32[3] * v64[1].f32[3])) + (float)(v64[2].f32[0] * v64[2].f32[0])) + (float)(v64[2].f32[1] * v64[2].f32[1]))
                                                                                               + (float)(v64[2].f32[2] * v64[2].f32[2]))
                                                                                       + (float)(v64[2].f32[3]
                                                                                               * v64[2].f32[3]))
                                                                               + (float)(v89 * v89))
                                                                       + (float)(v64[3].f32[1] * v64[3].f32[1]))
                                                               + (float)(v64[3].f32[2] * v64[3].f32[2]))
                                                       + (float)(v64[3].f32[3] * v64[3].f32[3]))
                                               + (float)(v64[4].f32[0] * v64[4].f32[0]))
                                       + (float)(v64[4].f32[1] * v64[4].f32[1]))
                               + (float)(v64[4].f32[2] * v64[4].f32[2]))
                       + (float)(v64[4].f32[3] * v64[4].f32[3]))
               + (float)(v64[5].f32[0] * v64[5].f32[0]);
    v90 = v64[8].f32[0];
    v51.f32[0] = (float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v51.f32[0] + (float)(v64[5].f32[1] * v64[5].f32[1])) + (float)(v64[5].f32[2] * v64[5].f32[2])) + (float)(v64[5].f32[3] * v64[5].f32[3])) + (float)(v64[6].f32[0] * v64[6].f32[0])) + (float)(v64[6].f32[1] * v64[6].f32[1])) + (float)(v64[6].f32[2] * v64[6].f32[2])) + (float)(v64[6].f32[3] * v64[6].f32[3])) + (float)(v64[7].f32[0] * v64[7].f32[0])) + (float)(v64[7].f32[1] * v64[7].f32[1])) + (float)(v64[7].f32[2] * v64[7].f32[2])) + (float)(v64[7].f32[3] * v64[7].f32[3]))
                                                                                               + (float)(v90 * v90))
                                                                                       + (float)(v64[8].f32[1]
                                                                                               * v64[8].f32[1]))
                                                                               + (float)(v64[8].f32[2] * v64[8].f32[2]))
                                                                       + (float)(v64[8].f32[3] * v64[8].f32[3]))
                                                               + (float)(v64[9].f32[0] * v64[9].f32[0]))
                                                       + (float)(v64[9].f32[1] * v64[9].f32[1]))
                                               + (float)(v64[9].f32[2] * v64[9].f32[2]))
                                       + (float)(v64[9].f32[3] * v64[9].f32[3]))
                               + (float)(v64[10].f32[0] * v64[10].f32[0]))
                       + (float)(v64[10].f32[1] * v64[10].f32[1]))
               + (float)(v64[10].f32[2] * v64[10].f32[2]);
    v91 = v64[13].f32[2];
    v92 = v64[15].f32[3];
    v51.f32[0] = sqrtf((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v51.f32[0] + (float)(v64[10].f32[3] * v64[10].f32[3])) + (float)(v64[11].f32[0] * v64[11].f32[0])) + (float)(v64[11].f32[1] * v64[11].f32[1])) + (float)(v64[11].f32[2] * v64[11].f32[2])) + (float)(v64[11].f32[3] * v64[11].f32[3])) + (float)(v64[12].f32[0] * v64[12].f32[0])) + (float)(v64[12].f32[1] * v64[12].f32[1])) + (float)(v64[12].f32[2] * v64[12].f32[2])) + (float)(v64[12].f32[3] * v64[12].f32[3])) + (float)(v64[13].f32[0] * v64[13].f32[0]))+ (float)(v64[13].f32[1] * v64[13].f32[1]))+ (float)(v91 * v91))+ (float)(v64[13].f32[3]* v64[13].f32[3]))+ (float)(v64[14].f32[0] * v64[14].f32[0]))+ (float)(v64[14].f32[1] * v64[14].f32[1]))+ (float)(v64[14].f32[2] * v64[14].f32[2]))+ (float)(v64[14].f32[3] * v64[14].f32[3]))+ (float)(v64[15].f32[0] * v64[15].f32[0]))+ (float)(v64[15].f32[1] * v64[15].f32[1]))+ (float)(v64[15].f32[2] * v64[15].f32[2]))+ (float)(v92 * v92))+ 0.00001;
    v93 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v51.f32, 0);
    v94 = vdivq_f32(v64[1], v93);
    *v64 = vdivq_f32(*v64, v93);
    v64[1] = v94;
    v95 = vdivq_f32(v64[3], v93);
    v64[2] = vdivq_f32(v64[2], v93);
    v64[3] = v95;
    v96 = vdivq_f32(v64[5], v93);
    v64[4] = vdivq_f32(v64[4], v93);
    v64[5] = v96;
    v97 = vdivq_f32(v64[7], v93);
    v64[6] = vdivq_f32(v64[6], v93);
    v64[7] = v97;
    v98 = vdivq_f32(v64[9], v93);
    v64[8] = vdivq_f32(v64[8], v93);
    v64[9] = v98;
    v99 = vdivq_f32(v64[11], v93);
    v64[10] = vdivq_f32(v64[10], v93);
    v64[11] = v99;
    v100 = vdivq_f32(v64[13], v93);
    v64[12] = vdivq_f32(v64[12], v93);
    v64[13] = v100;
    v101 = vdivq_f32(v64[14], v93);
    v102 = vdivq_f32(v64[15], v93);
    v64[14] = v101;
    v64[15] = v102;
    goto LABEL_73;
  }
  return result;
}

void *sub_2358FA1B4(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7, char *__src, _DWORD *a9, uint64_t a10, void *__dst, uint64_t a12, int a13, unsigned int a14)
{
  char *v14;
  uint64_t v17;
  size_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char *v22;
  int *v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  int64x2_t v33;
  int32x4_t v34;
  char *v35;
  uint64_t v36;
  int32x4_t v37;
  __int128 v38;
  int64x2_t v39;
  int64x2_t v40;
  int64x2_t v41;
  int64x2_t v42;
  uint64_t v43;
  char *v44;
  int v45;
  unsigned int v46;
  int *v47;
  uint64_t v48;
  float v49;
  uint64_t v50;
  float v51;
  float v52;
  float v53;
  uint64_t v54;
  uint64_t v55;
  float v56;
  float v57;
  int v58;
  BOOL v59;
  BOOL v60;
  BOOL v61;
  BOOL v62;
  BOOL v63;
  float v64;
  uint64_t v65;
  int v67;
  uint64_t v68;
  int v69;
  int v70;
  uint64_t v71;
  int *v72;
  int v73;
  int v74;
  void *result;
  uint64_t v76;
  char *v77;
  unint64_t v78;
  unsigned int v79;
  int v80;
  char *v81;
  int v82;
  _BYTE v88[512];
  uint64_t v89;
  unsigned int v90[4];

  v14 = __src;
  v17 = *a9;
  v18 = 4 * v17;
  memcpy(__dst, __src, 4 * v17);
  if (a2 <= a4)
    v19 = a4;
  else
    v19 = a2;
  if (!(_DWORD)v19)
  {
    v24 = (int *)__dst;
    goto LABEL_105;
  }
  v20 = 0;
  v21 = a4;
  v22 = v14 + 16;
  v24 = (int *)__dst;
  v25 = a7;
  v26 = v17;
  v28 = a3;
  v27 = a5;
  v29 = a1;
  do
  {
    v30 = *a9;
    if (!(_DWORD)v30)
    {
      v32 = 0;
      goto LABEL_19;
    }
    if (v30 > 7)
    {
      v31 = v30 & 0xFFFFFFF8;
      v33 = vdupq_n_s64(v20);
      v34 = 0uLL;
      v35 = v22;
      v36 = v31;
      v37 = 0uLL;
      do
      {
        v38 = *((_OWORD *)v35 - 1);
        v39.i64[0] = v38;
        v39.i64[1] = DWORD1(v38);
        v40 = v39;
        v39.i64[0] = DWORD2(v38);
        v39.i64[1] = HIDWORD(v38);
        v41 = v39;
        v39.i64[0] = *(_OWORD *)v35;
        v39.i64[1] = HIDWORD(*(_QWORD *)v35);
        v42 = v39;
        v39.i64[0] = *((_QWORD *)v35 + 1);
        v39.i64[1] = HIDWORD(*(_OWORD *)v35);
        v34 = vsubq_s32(v34, (int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v33, v40), (int32x4_t)vceqq_s64(v33, v41))));
        v37 = vsubq_s32(v37, (int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v33, v42), (int32x4_t)vceqq_s64(v33, v39))));
        v35 += 32;
        v36 -= 8;
      }
      while (v36);
      v32 = vaddvq_s32(vaddq_s32(v37, v34));
      if (v31 == v30)
        goto LABEL_19;
    }
    else
    {
      v31 = 0;
      v32 = 0;
    }
    v43 = v30 - v31;
    v44 = &v14[4 * v31];
    do
    {
      v45 = *(_DWORD *)v44;
      v44 += 4;
      if (v20 != v45)
        ++v32;
      --v43;
    }
    while (v43);
LABEL_19:
    if (v32 != (_DWORD)v30)
    {
      v46 = *(_DWORD *)(v27 + 4 * v20);
      if (v46 < a2 && v20 < v21)
      {
        v47 = (int *)(v29 + 1724 * v46);
        if (v47[128])
        {
          v48 = v28 + (v20 << 9);
          v49 = *(float *)(v48 + 20) * *(float *)(v48 + 24);
          v50 = v29 + 1724 * v46;
          v51 = *(float *)(v50 + 828);
          if (v49 <= v51)
            v52 = *(float *)(v50 + 828);
          else
            v52 = *(float *)(v48 + 20) * *(float *)(v48 + 24);
          if (v49 <= v51)
            v51 = *(float *)(v48 + 20) * *(float *)(v48 + 24);
          v53 = *(float *)(v50 + 832);
          v54 = v47[2];
          v55 = v54;
          switch((int)v54)
          {
            case 0:
              goto LABEL_38;
            case 1:
              v56 = (float)((float)((float)(0.009 - v53) / 0.009) * 0.15) + 0.07;
              if (v53 >= 0.009)
                v56 = 0.0;
              v57 = *(float *)(v25 + 92) - v56;
              goto LABEL_39;
            case 2:
            case 4:
              v55 = 2;
              goto LABEL_38;
            case 3:
            case 5:
              v55 = 3;
              goto LABEL_38;
            case 8:
              v55 = 4;
              goto LABEL_38;
            default:
              if ((v54 & 0xFFFFFFFE) == 0xA)
                v55 = 6;
              else
                v55 = 5;
LABEL_38:
              v57 = *(float *)(v25 + 4 * v55 + 88);
LABEL_39:
              if ((float)(v51 / (float)(v52 + 0.00001)) >= v57)
              {
                v58 = *(_DWORD *)(v28 + (v20 << 9) + 8);
                if ((_DWORD)v54 == v58
                  || ((_DWORD)v54 == 2 ? (v59 = v58 == 4) : (v59 = 0),
                      v59
                   || ((_DWORD)v54 == 4 ? (v60 = v58 == 2) : (v60 = 0),
                       v60
                    || ((_DWORD)v54 == 3 ? (v61 = v58 == 5) : (v61 = 0),
                        v61
                     || ((_DWORD)v54 == 5 ? (v62 = v58 == 3) : (v62 = 0),
                         v62
                      || ((_DWORD)v54 == 10 ? (v63 = v58 == 11) : (v63 = 0),
                          v63 || (v64 = 10000000.0, (_DWORD)v54 == 11) && v58 == 10))))))
                {
                  v64 = *(float *)(a6 + 4 * (v20 + v46 * (_DWORD)v19));
                }
                if (v54 < 9 && ((0x13Fu >> v54) & 1) != 0)
                {
                  v65 = qword_235915288[v54];
                }
                else if ((v54 & 0xFFFFFFFE) == 0xA)
                {
                  v65 = 6;
                }
                else
                {
                  v65 = 5;
                }
                if (v64 < (float)((float)(*(float *)(v25 + 4 * v65 + 116)
                                         * (float)(*((float *)v47 + 5) + *((float *)v47 + 6)))
                                 * 0.5)
                  && v53 < 0.1)
                {
                  v47[128] = 0;
                  if (*(_BYTE *)(v25 + 176))
                  {
                    v81 = v14;
                    v82 = *v47;
                    if ((_DWORD)v54 == v58 || (_DWORD)v54 == 4 && v58 == 2)
                    {
LABEL_79:
                      v67 = v47[1];
                    }
                    else
                    {
                      v67 = 0;
                      switch((int)v54)
                      {
                        case 2:
                          if (v58 == 4)
                            goto LABEL_79;
                          goto LABEL_102;
                        case 3:
                          if (v58 == 5)
                            goto LABEL_79;
                          goto LABEL_102;
                        case 5:
                          if (v58 == 3)
                            goto LABEL_79;
                          goto LABEL_102;
                        case 10:
                          if (v58 == 11)
                            goto LABEL_79;
                          goto LABEL_102;
                        case 11:
                          if (v58 == 10)
                            goto LABEL_79;
LABEL_102:
                          v67 = 0;
                          break;
                        default:
                          break;
                      }
                    }
                    v76 = a10;
                    v77 = v22;
                    v78 = v21;
                    v79 = v26;
                    v89 = 0;
                    *(_QWORD *)v90 = 0;
                    acTrkLabelCenterSizeSmoothing((int *)(v29 + 1724 * v46), (char *)(v28 + (v20 << 9)), a1, a2, v25, v67, a13, a14, (float *)&v90[1], (float *)v90, (float *)&v89 + 1, (float *)&v89);
                    v80 = v47[11];
                    memcpy(v47, (const void *)v48, 0x200uLL);
                    v47[112] = 0;
                    v68 = *(_QWORD *)v90;
                    *(float32x2_t *)(v47 + 3) = vadd_f32(*(float32x2_t *)(v47 + 3), vmul_f32(vsub_f32(*(float32x2_t *)(v48 + 20), (float32x2_t)__PAIR64__(v90[0], v90[1])), (float32x2_t)0x3F0000003F000000));
                    v47[5] = HIDWORD(v68);
                    v47[6] = v68;
                    *v47 = v82;
                    v47[1] = v67;
                    if (*(_DWORD *)(a1 + 1724 * v46 + 788) < (*(_DWORD *)(a1 + 1724 * v46 + 804)
                                                                             + *(_DWORD *)(a7 + 160))
                      && *(_DWORD *)(a1 + 1724 * v46 + 792))
                    {
                      v69 = v89;
                      v47[3] = HIDWORD(v89);
                      v47[4] = v69;
                    }
                    *(_DWORD *)(a1 + 1724 * v46 + 528) = 0;
                    memcpy(v88, (const void *)v48, sizeof(v88));
                    acTrkFacialAttrTemporalSmoothing((uint64_t)v47, (uint64_t)v88, v80, a7, a14, a13, *(float *)(a12 + 4 * v20));
                    v25 = a7;
                    v14 = v81;
                    if (*(_BYTE *)(a7 + 193))
                    {
                      acTrkHandChiralityTemporalSmoothing(v47, v48, v54, *(_DWORD *)(a7 + 216), *(_DWORD *)(a7 + 220), *(_BYTE *)(a7 + 205), *(_DWORD *)(a7 + 208), *(_BYTE *)(a7 + 212));
                      v24 = (int *)__dst;
                      v25 = a7;
                      v26 = v79;
                      v28 = a3;
                      v27 = a5;
                      v29 = a1;
                    }
                    else
                    {
                      v29 = a1;
                      *(_QWORD *)(a1 + 1724 * v46 + 1656) = 0;
                      v24 = (int *)__dst;
                      v26 = v79;
                      v28 = a3;
                      v27 = a5;
                    }
                    v22 = v77;
                    v21 = v78;
                    a10 = v76;
                    *(_DWORD *)(v29 + 1724 * v46 + 524) = *(_DWORD *)(a12 + 4 * v20);
                  }
                  *(_DWORD *)(a10 + 4 * v20) = v46;
                  if (v26)
                  {
                    v70 = 0;
                    v71 = v26;
                    v72 = v24;
                    do
                    {
                      v74 = *v72++;
                      v73 = v74;
                      if (v20 != v74)
                        v24[v70++] = v73;
                      --v71;
                    }
                    while (v71);
                  }
                  --v26;
                }
              }
              break;
          }
        }
      }
    }
    ++v20;
  }
  while (v20 != v19);
  v18 = 4 * v26;
  LODWORD(v17) = v26;
LABEL_105:
  result = memcpy(v14, v24, v18);
  *a9 = v17;
  return result;
}

uint64_t sub_2358FA7DC(uint64_t result, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, float *a7)
{
  uint64_t v7;
  unint64_t v8;
  unsigned int v9;
  float v10;
  int v11;
  int v12;
  __int128 v13;
  uint64_t v14;
  int v15;
  unsigned int v16;
  float *v17;
  uint64_t v18;
  unsigned int v19;
  float32x2_t v20;
  int32x4_t v21;
  float32x2_t v22;
  float32x2_t v23;
  float32x2_t v24;
  unsigned int v25;
  float32x2_t v26;
  float32x2_t v27;
  float32x2_t v28;
  float32x2_t v29;
  float v30;
  float32x2_t v31;
  float32x2_t v32;
  unsigned __int32 v33;
  float v34;
  float v35;
  float32x2_t v36;
  float32x2_t v37;
  float v38;
  float32x2_t v39;
  unsigned __int32 v40;
  float v41;
  float32x2_t v42;
  float32x2_t v43;
  BOOL v44;
  float v45;
  float32x2_t v46;
  float32x2_t v47;
  BOOL v48;
  float v49;
  float v50;
  float v52;
  BOOL v54;
  uint16x4_t v55;
  int v58;
  BOOL v59;
  uint64_t v60;
  unsigned int v61;
  _OWORD *v62;
  int v63;
  int v64;
  float v65;
  unsigned int v66;
  _DWORD *v67;
  uint64_t v68;
  float v69;
  float v70;
  float v71;
  unsigned int v72;
  unsigned int v73;
  int v74;
  unsigned int v75;
  _DWORD *v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  int v80;
  float v81;
  _BYTE *v82;
  float v83;
  float v84;
  float v85;
  float v87;
  int v89;
  unsigned int v90;
  unsigned int v91;
  _OWORD *v92;
  int v93;
  unsigned __int8 *v94;
  uint64_t v95;
  uint64_t v96;

  v96 = result;
  if (a2 <= a4)
    v7 = a4;
  else
    v7 = a2;
  if ((_DWORD)v7)
  {
    v8 = 0;
    v9 = 0;
    v10 = *(float *)(a6 + 56);
    v11 = v7 - 1;
    v12 = v7 & 0xFFFFFFF8;
    *(_QWORD *)&v13 = 0x4000000040000000;
    *((_QWORD *)&v13 + 1) = 0x4000000040000000;
    do
    {
      if (v8 >= a2)
      {
        v58 = 0;
        v59 = __CFADD__(v9, v11);
        if (v7 < 8)
          goto LABEL_83;
        if (v59)
          goto LABEL_83;
        v60 = v7 & 0xFFFFFFF8;
        v61 = v9;
        do
        {
          v62 = (_OWORD *)(a5 + 4 * v61);
          *v62 = v13;
          v62[1] = v13;
          v61 += 8;
          v60 -= 8;
        }
        while (v60);
        v9 += v12;
        v58 = v7 & 0xFFFFFFF8;
        if ((_DWORD)v7 != v12)
        {
LABEL_83:
          v63 = v7 - v58;
          do
          {
            *(_DWORD *)(a5 + 4 * v9++) = 0x40000000;
            --v63;
          }
          while (v63);
        }
        goto LABEL_7;
      }
      if (!a4)
      {
        v72 = 0;
        v73 = v7;
        goto LABEL_130;
      }
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = a7;
      v18 = v96 + 520 * v8;
      v19 = *(_DWORD *)(v18 + 8);
      v20 = *(float32x2_t *)(v18 + 12);
      v21 = vdupq_n_s32(v19);
      v22 = vadd_f32(v20, *(float32x2_t *)(v18 + 20));
      v23 = vmaxnm_f32(vsub_f32(v22, v20), 0);
      v24 = vmul_lane_f32(v23, v23, 1);
      v25 = v9;
      do
      {
        v26 = *(float32x2_t *)(a3 + v14 + 12);
        v27 = vadd_f32(v26, *(float32x2_t *)(a3 + v14 + 20));
        v28 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v22, v27), (int8x8_t)v27, (int8x8_t)v22), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v20, v26), (int8x8_t)v20, (int8x8_t)v26)), 0);
        v29 = vmul_lane_f32(v28, v28, 1);
        v30 = 0.0;
        if (v29.f32[0] >= 0.00000011921)
        {
          v31 = vmaxnm_f32(vsub_f32(v27, v26), 0);
          v32 = vsub_f32(vadd_f32(vmul_lane_f32(v31, v31, 1), v24), v29);
          v33 = vdiv_f32(v29, v32).u32[0];
          if (v32.f32[0] >= 0.00000011921)
            v30 = *(float *)&v33;
          else
            v30 = 0.0;
        }
        result = *(unsigned int *)(a3 + v14 + 8);
        if (v19 == (_DWORD)result)
        {
          if (!v19)
          {
            v34 = 0.0;
            v35 = 0.0;
            if (v29.f32[0] >= 0.00000011921)
            {
              v36 = vmaxnm_f32(vsub_f32(v27, v26), 0);
              v37 = vmul_lane_f32(v36, v36, 1);
              if ((vcgt_f32(v24, v37).u8[0] & 1) != 0)
                v38 = v37.f32[0];
              else
                v38 = v24.f32[0];
              if (v38 >= 0.00000011921)
                v34 = v29.f32[0] / v38;
              else
                v34 = 0.0;
              v39 = vsub_f32(vadd_f32(v37, v24), v29);
              v40 = vdiv_f32(v29, v39).u32[0];
              if (v39.f32[0] >= 0.00000011921)
                v35 = *(float *)&v40;
              else
                v35 = 0.0;
            }
            if (*v17 < *(float *)(a6 + 188) && !*(_BYTE *)(a3 + v14 + 100))
            {
              v34 = 0.0;
              v35 = 0.0;
            }
            v41 = v35 + 0.2;
            if (v34 > 0.2)
              v34 = v41;
            v42 = vmaxnm_f32(vsub_f32(v27, v26), 0);
            v43 = vmul_lane_f32(v42, v42, 1);
            v44 = v29.f32[0] < 0.00000011921 || v43.f32[0] < 0.00000011921;
            LODWORD(v45) = vdiv_f32(v29, v43).u32[0];
            if (v44)
              v45 = 0.0;
            v46 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v27, v22), (int8x8_t)v22, (int8x8_t)v27), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v26, v20), (int8x8_t)v26, (int8x8_t)v20)), 0);
            v47 = vmul_lane_f32(v46, v46, 1);
            v48 = v47.f32[0] < 0.00000011921 || v24.f32[0] < 0.00000011921;
            v49 = 1.0 - v34;
            LODWORD(v50) = vdiv_f32(v47, v24).u32[0];
            if (v48)
              v50 = 0.0;
            if (v34 >= 0.99)
              v49 = 0.01;
            if (v45 >= 0.25 || v50 <= 0.95)
              v52 = v49;
            else
              v52 = 1.0;
            goto LABEL_68;
          }
        }
        else
        {
          v54 = v19 == 10 && (_DWORD)result == 11;
          v55 = (uint16x4_t)vmovn_s32((int32x4_t)vandq_s8((int8x16_t)vceqq_s32(v21, (int32x4_t)xmmword_2359168C0), (int8x16_t)vceqq_s32(vdupq_n_s32(result), (int32x4_t)xmmword_2359168D0)));
          result = v19 == 11 && (_DWORD)result == 10;
          if ((vmaxv_u16(v55) & 1) == 0 && !v54 && !(_DWORD)result)
          {
            *(_DWORD *)(a5 + 4 * v25) = 1065353216;
            goto LABEL_12;
          }
        }
        v52 = 1.0 - v30;
LABEL_68:
        *(float *)(a5 + 4 * v25) = v52;
        if (v52 < 1.0 && v30 > 0.1)
        {
          ++v16;
          if (*(_DWORD *)(a3 + v14 + 28) > 1u)
            ++v15;
        }
LABEL_12:
        ++v25;
        v14 += 512;
        ++v17;
      }
      while ((unint64_t)a4 << 9 != v14);
      if (v16 < 2 || !v15)
        goto LABEL_106;
      if (v19 < 9 && ((0x13Fu >> v19) & 1) != 0)
      {
        v64 = 0;
        v65 = 0.0;
        v66 = v9;
        v67 = (_DWORD *)(a3 + 28);
        v68 = a4;
        v69 = 0.0;
        do
        {
          v70 = *(float *)(a5 + 4 * v66);
          if (v70 < 1.0)
          {
            v71 = 1.0 - v70;
            if (*v67 < 2u)
            {
              if (v71 > v69)
                v69 = v71;
            }
            else
            {
              if (v71 > v10)
                v64 = 1;
              if (v71 > v65)
                v65 = v71;
            }
          }
          v67 += 128;
          ++v66;
          --v68;
        }
        while (v68);
        if (v65 <= v69)
          v74 = v64;
        else
          v74 = v64 + 1;
        v75 = v9;
        v76 = (_DWORD *)(a3 + 28);
        v77 = a4;
        if (v74 == 2)
        {
          do
          {
            if (*(float *)(a5 + 4 * v75) < 1.0 && *v76 <= 1u)
              *(_DWORD *)(a5 + 4 * v75) = 1065353216;
            v76 += 128;
            ++v75;
            --v77;
          }
          while (v77);
        }
LABEL_106:
        if (!v19)
        {
          v78 = 0;
          v79 = 0;
          v80 = 0;
          v81 = 0.0;
          v82 = (_BYTE *)(a3 + 100);
          v83 = 0.0;
          do
          {
            v84 = *(float *)(a5 + 4 * (v9 + v78));
            v44 = v84 < 1.0;
            v85 = 1.0 - v84;
            if (v44 && v85 >= 0.2)
            {
              if (*v82)
              {
                if (v85 > v83)
                  v83 = v85;
                v80 = 1;
              }
              else
              {
                if (v85 > v81)
                  v81 = v85;
                v79 = 1;
              }
            }
            ++v78;
            v82 += 512;
          }
          while (a4 != v78);
          if ((v80 & v79 & 1) != 0)
          {
            v87 = v83 / (float)(v81 + 1.1755e-38);
            if (v87 > 0.95 && v87 < 1.05)
            {
              v93 = *(unsigned __int8 *)(v18 + 100) != 0;
              v94 = (unsigned __int8 *)(a3 + 100);
              v95 = a4;
              do
              {
                if (*(float *)(a5 + 4 * v9) < 1.0)
                {
                  result = *v94;
                  if ((_DWORD)result != v93)
                    *(_DWORD *)(a5 + 4 * v9) = 1065353216;
                }
                v94 += 512;
                ++v9;
                --v95;
              }
              while (v95);
            }
          }
        }
      }
      v9 = v25;
      v72 = a4;
      v11 = v7 - 1;
      v73 = v7 - a4;
      if (v7 > a4)
      {
LABEL_130:
        if (v73 < 8 || __CFADD__(v9, v11 - v72))
        {
          v91 = v9;
LABEL_134:
          v89 = v7 - v72;
          v9 = v91;
          do
          {
            *(_DWORD *)(a5 + 4 * v9++) = 0x40000000;
            --v89;
          }
          while (v89);
        }
        else
        {
          v90 = v73 & 0xFFFFFFF8;
          v91 = v9 + (v73 & 0xFFFFFFF8);
          result = v73 & 0xFFFFFFF8;
          do
          {
            v92 = (_OWORD *)(a5 + 4 * v9);
            *v92 = v13;
            v92[1] = v13;
            v9 += 8;
            result -= 8;
          }
          while (result);
          if (v73 != v90)
          {
            v72 += v90;
            goto LABEL_134;
          }
          v9 = v91;
        }
      }
LABEL_7:
      ++v8;
    }
    while (v8 != v7);
  }
  return result;
}

char *sub_2358FADA8(char *result, unsigned int a2, _DWORD *__src, unsigned int a4, uint64_t a5, uint64_t a6, float *a7, uint64_t a8, uint64_t a9, _DWORD *a10, _DWORD *a11)
{
  uint64_t v11;
  _DWORD *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unsigned int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  float v26;
  float *v27;
  char *v28;
  int v29;
  uint64_t v30;
  float *v31;
  char *v32;
  unsigned int v33;
  int v34;

  if (a2 <= a4)
    v11 = a4;
  else
    v11 = a2;
  *a10 = 0;
  *a11 = 0;
  if ((_DWORD)v11)
  {
    v17 = result;
    v18 = 0;
    v31 = a7 + 21;
    v19 = a4;
    v33 = a2;
    v32 = result;
    do
    {
      v21 = *(_DWORD *)(a5 + 4 * v18);
      if (v18 >= v19)
      {
LABEL_7:
        v17[130 * v21 + 128] = 0;
      }
      else if (v21 >= a2)
      {
        v24 = *a10;
        *a10 = v24 + 1;
        *(_DWORD *)(a8 + 4 * v24) = v18;
      }
      else
      {
        result = (char *)&v17[130 * v21];
        v22 = *((_DWORD *)result + 2);
        v23 = 2;
        switch(v22)
        {
          case 0:
            if (result[100])
            {
              v25 = 0;
              v26 = *a7;
              goto LABEL_26;
            }
            v26 = a7[20];
            v27 = v31;
            goto LABEL_27;
          case 1:
            v26 = a7[1];
            v25 = 1;
            goto LABEL_26;
          case 2:
          case 4:
            goto LABEL_19;
          case 3:
          case 5:
            v23 = 3;
            goto LABEL_19;
          case 8:
            v26 = a7[4];
            v25 = 4;
            goto LABEL_26;
          default:
            v23 = 5;
            if ((v22 & 0xFFFFFFFE) == 0xA)
              v23 = 6;
LABEL_19:
            v26 = a7[v23];
            v25 = 4;
            switch(v22)
            {
              case 2:
              case 4:
                v25 = 2;
                break;
              case 3:
              case 5:
                v25 = 3;
                break;
              case 8:
                break;
              default:
                if ((v22 & 0xFFFFFFFE) == 0xA)
                  v25 = 6;
                else
                  v25 = 5;
                break;
            }
LABEL_26:
            v27 = &a7[v25 + 22];
LABEL_27:
            if ((float)(1.0 - *(float *)(a6 + 4 * (v18 + v21 * (_DWORD)v11))) < v26
              || __src[7] < LOBYTE(v17[130 * v21 + 129]))
            {
              v20 = *a10;
              *a10 = v20 + 1;
              *(_DWORD *)(a8 + 4 * v20) = v18;
              goto LABEL_7;
            }
            v34 = *(_DWORD *)v27;
            result = (char *)memcpy(result, __src, 0x200uLL);
            v17 = v32;
            v28 = &v32[520 * v21];
            v29 = *((_DWORD *)v28 + 128) + 1;
            *((_DWORD *)v28 + 128) = v29;
            a2 = v33;
            if (v29 == v34)
            {
              v30 = *a11;
              *a11 = v30 + 1;
              *(_DWORD *)(a9 + 4 * v30) = v18;
            }
            break;
        }
      }
      ++v18;
      __src += 128;
    }
    while (v11 != v18);
  }
  return result;
}

BOOL sub_2358FAFFC(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(a1 + 4) < *(_DWORD *)(a2 + 4);
}

float acTrkObjectRectIntersectOverUnion(float *a1, float *a2, float a3)
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v13;
  float v14;
  float v15;
  float v17;

  v3 = *a1;
  v4 = a1[1];
  v5 = a1[2];
  v6 = a1[3];
  v7 = *a1 + v5;
  v8 = v4 + v6;
  v9 = *a2;
  v10 = a2[1];
  v11 = 0.0;
  if (v7 > *a2 && v8 > v10)
  {
    v13 = a2[2];
    v14 = a2[3];
    v15 = v10 + v14;
    if ((float)(v9 + v13) > v3 && v15 > v4)
    {
      v17 = fmaxf(fminf(v7, v9 + v13) - fmaxf(v3, v9), 0.0) * fmaxf(fminf(v8, v15) - fmaxf(v4, v10), 0.0);
      return v17 / fmaxf(a3, (float)((float)(v5 * v6) + (float)(v13 * v14)) - v17);
    }
  }
  return v11;
}

float acTrkObjectRectIntersectOverSmaller(float *a1, float *a2, float a3)
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v13;
  float v14;
  float v15;

  v3 = *a1;
  v4 = a1[1];
  v5 = a1[2];
  v6 = a1[3];
  v7 = *a1 + v5;
  v8 = v4 + v6;
  v9 = *a2;
  v10 = a2[1];
  v11 = 0.0;
  if (v7 > *a2 && v8 > v10)
  {
    v13 = a2[2];
    v14 = a2[3];
    v15 = v10 + v14;
    if ((float)(v9 + v13) > v3 && v15 > v4)
      return (float)(fmaxf(fminf(v7, v9 + v13) - fmaxf(v3, v9), 0.0) * fmaxf(fminf(v8, v15) - fmaxf(v4, v10), 0.0))
           / fmaxf(a3, fminf(v5 * v6, v13 * v14));
  }
  return v11;
}

uint64_t acTrkObjectRemoveKilled(char *__src, unsigned int a2, int a3)
{
  uint64_t v5;
  uint64_t v6;
  _DWORD *v7;
  uint64_t v8;

  if (!a2)
    return 0;
  v5 = 0;
  v6 = 0;
  v7 = __src;
  v8 = a2;
  do
  {
    if (v7[132] < a3)
    {
      if (v5 != v6)
        memcpy(&__src[1724 * v6], v7, 0x6BCuLL);
      v6 = (v6 + 1);
    }
    v7 += 431;
    ++v5;
  }
  while (v8 != v5);
  return v6;
}

void acTrkObjectRearrange(uint64_t a1, uint64_t a2, void *a3, unsigned int a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE __src[1724];

  v8 = a4;
  bzero(a3, a4);
  if (a4)
  {
    v9 = 0;
    do
    {
      if (!*((_BYTE *)a3 + v9))
      {
        memcpy(__src, (const void *)(a1 + 1724 * v9), sizeof(__src));
        *((_BYTE *)a3 + v9) = 1;
        v10 = *(unsigned int *)(a2 + 4 * v9);
        v11 = v9;
        if (v9 != v10)
        {
          v11 = v9;
          do
          {
            memcpy((void *)(a1 + 1724 * v11), (const void *)(a1 + 1724 * v10), 0x6BCuLL);
            v11 = *(unsigned int *)(a2 + 4 * v11);
            *((_BYTE *)a3 + v11) = 1;
            v10 = *(unsigned int *)(a2 + 4 * v11);
          }
          while (v9 != v10);
        }
        memcpy((void *)(a1 + 1724 * v11), __src, 0x6BCuLL);
      }
      ++v9;
    }
    while (v9 != v8);
  }
}

unint64_t acTrkFullBodyAssocTrkDet(unsigned int a1, unsigned int a2, uint64_t a3, uint64_t a4, unsigned int a5, unsigned int a6, uint64_t a7, unsigned int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14, char *a15, unsigned int *a16, float *a17, uint64_t a18, uint64_t a19, unsigned int a20,void *a21)
{
  unsigned int v23;
  char *v27;
  int v28;
  size_t TempBuffers;
  unsigned int v30;
  int32x4_t *v31;
  uint64_t v32;
  uint64_t v33;
  int32x4_t *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  float32x4_t *v41;
  uint64_t v42;
  uint64_t v43;
  unsigned int v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unsigned int v49;
  unsigned int v50;
  BOOL v51;
  int v52;
  uint64_t v53;
  unsigned int v54;
  unsigned int v55;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  unsigned int v66;
  unsigned int v67;
  unsigned int v68;
  unsigned int v69;
  unsigned int v70;
  double v71;
  unsigned __int8 *v72;
  unsigned int v73;
  unsigned int v74;
  unsigned int v75;
  unsigned int v76;
  double v77;
  uint64_t v78;
  int32x4_t v79;
  int32x4_t *v80;
  int32x4_t v81;
  int32x4_t v82;
  uint64_t v83;
  uint64_t v84;
  unsigned int v85;
  unint64_t v86;
  float v87;
  __int128 v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  unint64_t v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  unint64_t v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  unsigned int v130;
  char *v131;
  _DWORD *v132;
  int v133;
  uint64_t v134;
  float v135;
  uint64_t v136;
  int v137;
  __int128 *v138;
  int v139;
  int v140;
  char v141;
  int v142;
  uint64_t v143;
  unsigned int v144;
  __int128 v145;
  uint64_t v146;
  uint64_t v147;
  unsigned int *v148;
  int v149;
  int v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  _DWORD *v154;
  uint64_t v155;
  unsigned int v156;
  unsigned int v157;
  uint64_t v158;
  uint64_t v159;
  _DWORD *v160;
  unsigned int v161;
  unsigned int v162;
  unsigned int v163;
  double v164;
  uint64_t v165;
  _BYTE *v166;
  int *v167;
  uint64_t v168;
  int v169;
  uint64_t v170;
  uint64_t v171;
  unsigned int v172;
  unsigned int *v173;
  char *v174;
  unsigned int v175;
  uint64_t v176;
  BOOL v177;
  unsigned int *v178;
  uint64_t v179;
  uint64_t v180;
  unsigned int *v181;
  char *v182;
  unsigned int v183;
  uint64_t v184;
  unint64_t v185;
  int32x4_t v186;
  unsigned int v187;
  unint64_t v188;
  unsigned int *v189;
  unsigned int v190;
  uint64_t v191;
  uint64_t v192;
  float32x2_t *v193;
  int v194;
  float32x2_t v195;
  float32x2_t v196;
  float v197;
  unsigned int v198;
  uint64_t v199;
  unsigned int v200;
  float v201;
  float v202;
  uint64_t v203;
  float32x2_t v204;
  float32x2_t v205;
  int32x2_t v206;
  float v207;
  float v208;
  unint64_t v209;
  BOOL v210;
  uint64_t v211;
  uint64_t v212;
  float v213;
  float v214;
  float v215;
  float v216;
  float v217;
  float v218;
  float v219;
  unint64_t v220;
  float v221;
  float v222;
  float32x2_t v223;
  float32x2_t v224;
  float32x2_t v225;
  float v226;
  float v227;
  float32x2_t v228;
  float v229;
  float v230;
  unint64_t v231;
  uint64_t v232;
  uint64_t v233;
  float v234;
  float v235;
  float v236;
  float v237;
  float v238;
  float v239;
  float v240;
  unint64_t v241;
  float v242;
  float v243;
  float32x2_t v244;
  float32x2_t v245;
  float32x2_t v246;
  float v247;
  float v248;
  float32x2_t v249;
  float v250;
  _OWORD *v251;
  uint64_t v252;
  int32x4_t *v253;
  __int32 v254;
  float32x2_t v255;
  float32x2_t v256;
  float32_t v257;
  float32x2_t *v258;
  __int32 v259;
  unsigned __int32 v260;
  unint64_t v261;
  unsigned int v262;
  unsigned int v263;
  BOOL v264;
  uint64_t v265;
  uint64_t v266;
  int32x2_t *v267;
  int32x2_t *v268;
  uint64_t v269;
  int32x2_t v270;
  uint64_t v271;
  unsigned int *v272;
  unsigned int *v273;
  unsigned int v274;
  unsigned int v275;
  unsigned int v276;
  unsigned int v277;
  uint64_t v278;
  unsigned int v279;
  unsigned int v280;
  unint64_t v281;
  unint64_t v282;
  unsigned int *v283;
  unint64_t v284;
  unsigned int v285;
  unsigned int v286;
  unint64_t v287;
  unsigned int v288;
  unsigned int *v289;
  unsigned int v290;
  unsigned int v291;
  unint64_t v292;
  unsigned int v293;
  uint64_t v294;
  uint64_t v295;
  __int128 v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  __int128 v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  __int128 v313;
  __int128 v314;
  __int128 v315;
  __int128 v316;
  __int128 v317;
  __int128 v318;
  __int128 v319;
  __int128 v320;
  __int128 v321;
  __int128 v322;
  __int128 v323;
  __int128 v324;
  __int128 v325;
  __int128 v326;
  __int128 v327;
  __int128 v328;
  __int128 v329;
  __int128 v330;
  __int128 v331;
  __int128 v332;
  __int128 v333;
  __int128 v334;
  __int128 v335;
  uint64_t v336;
  unsigned __int32 v337;
  unsigned int v338;
  _DWORD *v339;
  unint64_t v340;
  int v341;
  int v342;
  __int128 *v343;
  int v344;
  int v345;
  char v346;
  int v347;
  uint64_t v348;
  unsigned int v349;
  __int128 v350;
  uint64_t v351;
  uint64_t v352;
  unsigned int v353;
  unint64_t v354;
  unint64_t v355;
  _DWORD *v356;
  void *v357;
  unint64_t v358;
  int32x4_t v359;
  unint64_t v360;
  int32x4_t *v361;
  int32x4_t v362;
  int32x4_t v363;
  uint64_t v364;
  int *v365;
  uint64_t v366;
  _DWORD *v367;
  uint64_t v368;
  _DWORD *v369;
  uint64_t v370;
  _DWORD *v371;
  _DWORD *v372;
  int32x4_t v373;
  uint64_t i;
  int32x4_t v375;
  int32x4_t v376;
  unsigned int v377;
  uint64_t v378;
  int32x4_t *v379;
  uint64_t v380;
  uint64_t v381;
  uint64_t v382;
  uint64_t v383;
  int v384;
  int v385;
  float v386;
  float32x4_t *v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  int v392;
  void *v393;
  unsigned int *v394;
  void *v395;
  unsigned int v396;
  unsigned __int8 *v397;
  __int128 v398;
  unsigned int *v399;
  uint64_t v400;
  void *v401;
  uint64_t v402;
  unsigned int __dst;
  BOOL v404;
  unsigned int v405;
  int32x4_t *v406;
  int32x4_t *v407;
  unsigned int v408;
  uint64_t v409;
  uint64_t v410;
  unsigned int v411;
  unsigned int *v412;
  unsigned int *v413[2];
  int v415;
  unsigned int v416;
  int v417[2];
  unsigned int v418;
  int32x4_t v419;
  int32x4_t v420;
  uint64_t v421;
  _DWORD v422[128];
  unsigned int v423;
  unsigned int v424;
  __int128 v425;
  __int128 v426;
  __int128 v427;
  __int128 v428;
  __int128 v429;
  __int128 v430;
  __int128 v431;
  __int128 v432;
  __int128 __b;
  __int128 v434;
  __int128 v435;
  __int128 v436;
  __int128 v437;
  __int128 v438;
  __int128 v439;
  __int128 v440;
  __int128 v441;
  __int128 v442;
  __int128 v443;
  float32x4_t *v444;
  _DWORD __src[435];

  v23 = a6;
  v27 = a15;
  if (a6 <= a8)
    v28 = a8;
  else
    v28 = a6;
  v444 = 0;
  v442 = 0u;
  v443 = 0u;
  v440 = 0u;
  v441 = 0u;
  v438 = 0u;
  v439 = 0u;
  v436 = 0u;
  v437 = 0u;
  v434 = 0u;
  v435 = 0u;
  v432 = 0u;
  __b = 0u;
  v430 = 0u;
  v431 = 0u;
  v428 = 0u;
  v429 = 0u;
  v426 = 0u;
  v427 = 0u;
  v425 = 0u;
  TempBuffers = acTrkObjectAssocTrkDetGetTempBuffers(v28, (uint64_t)a21, a3, (uint64_t)&v425);
  v30 = a8;
  bzero(a21, TempBuffers);
  v31 = (int32x4_t *)v425;
  v32 = *((_QWORD *)&v428 + 1);
  v34 = (int32x4_t *)*((_QWORD *)&v429 + 1);
  v33 = v429;
  v35 = __b;
  v421 = a7;
  if (v30)
  {
    v36 = (void *)v430;
    v400 = *((_QWORD *)&v428 + 1);
    v409 = v429;
    v405 = v23;
    v411 = a1;
    v37 = (void *)*((_QWORD *)&v425 + 1);
    v38 = v426;
    v412 = (unsigned int *)*((_QWORD *)&v427 + 1);
    v394 = (unsigned int *)*((_QWORD *)&v435 + 1);
    v395 = (void *)v434;
    v393 = (void *)*((_QWORD *)&__b + 1);
    v39 = v437;
    v40 = v438;
    v41 = v444;
    v398 = v439;
    v397 = (unsigned __int8 *)v440;
    v399 = (unsigned int *)v441;
    v402 = *((_QWORD *)&v442 + 1);
    v410 = __b;
    memset((void *)__b, 255, 4 * v30);
    if (!(a5 | *a16))
    {
      if (v30 > 7)
      {
        v43 = v30 & 0xFFFFFFF8;
        v79 = (int32x4_t)xmmword_2359168E0;
        v80 = v31 + 1;
        v81.i64[0] = 0x400000004;
        v81.i64[1] = 0x400000004;
        v82.i64[0] = 0x800000008;
        v82.i64[1] = 0x800000008;
        v83 = v43;
        a7 = v421;
        v44 = a2;
        v23 = v405;
        do
        {
          v80[-1] = v79;
          *v80 = vaddq_s32(v79, v81);
          v79 = vaddq_s32(v79, v82);
          v80 += 2;
          v83 -= 8;
        }
        while (v83);
        a1 = v411;
        v33 = v409;
        v35 = v410;
        if (v43 == v30)
          goto LABEL_47;
      }
      else
      {
        v43 = 0;
        a7 = v421;
        v44 = a2;
        a1 = v411;
        v23 = v405;
        v33 = v409;
        v35 = v410;
      }
      do
      {
        v31->i32[v43] = v43;
        ++v43;
      }
      while (v30 != v43);
LABEL_47:
      v424 = v30;
      acTrkObjectPickDet(a1, v44, a4, 0, v23, a7, v30, (uint64_t)v31, &v424, v33, v389, v35, v392, *(_BYTE *)(a9 + 194), *(_DWORD *)(a9 + 196));
      v84 = v424;
      if (v424)
      {
        v416 = 0;
        v85 = a1;
        v86 = 0;
        v87 = (float)(v44 * v85) + 0.0001;
        v419 = vdupq_n_s32(0xFFFFFE97);
        do
        {
          v130 = *(_DWORD *)(a7 + ((unint64_t)v31->u32[0] << 9) + 28);
          if (v130 > 1)
          {
            v132 = (_DWORD *)(a4 + 1724 * v86);
            bzero(v132, 0x6BCuLL);
            *((int32x4_t *)v132 + 2) = v419;
            v132[12] = -361;
            v132[32] = -1;
            v132[98] = -1;
            v132[105] = -1;
            *(_QWORD *)(v132 + 193) = 0xFF7FFFFFFFFFFFFFLL;
            v132[198] = 0;
            *(_QWORD *)(v132 + 207) = 0;
            v132[209] = 0;
            memcpy(v132, (const void *)(a7 + ((unint64_t)v31->u32[0] << 9)), 0x200uLL);
            v133 = (*a14)++;
            *v132 = v133;
            ++v132[130];
            v134 = v31->u32[0];
            v132[131] = LODWORD(a17[v134]);
            v135 = *((float *)v132 + 5) * *((float *)v132 + 6);
            *((float *)v132 + 207) = v135;
            *((float *)v132 + 208) = v135 / v87;
            v136 = a7 + (v134 << 9);
            v137 = *(_DWORD *)(v136 + 8);
            v138 = (__int128 *)(v136 + 12);
            v139 = *(_DWORD *)(v136 + 40);
            v140 = *(_DWORD *)(v136 + 44);
            v141 = *(_BYTE *)(v136 + 100);
            v142 = *(_DWORD *)(v136 + 420);
            if (v132[2] == 9)
            {
              v88 = *v138;
              v89 = a4 + 1724 * v86;
              *(_OWORD *)(v89 + 532) = v88;
              *(_BYTE *)(v89 + 548) = v141;
              *(_DWORD *)(v89 + 564) = v142;
              *(_DWORD *)(v89 + 556) = v140;
              *(_DWORD *)(v89 + 552) = v139;
              *(_DWORD *)(v89 + 568) = v137;
              *(_DWORD *)(v89 + 780) = 1;
            }
            else
            {
              v143 = a4 + 1724 * v86;
              v144 = *(_DWORD *)(v143 + 780);
              if (v144 < 6)
              {
                v147 = a4 + 1724 * v86 + 40 * v144;
                *(_OWORD *)(v147 + 532) = *v138;
                *(_BYTE *)(v147 + 548) = v141;
                *(_DWORD *)(v147 + 564) = v142;
                *(_DWORD *)(v147 + 556) = v140;
                *(_DWORD *)(v147 + 552) = v139;
                *(_DWORD *)(v147 + 568) = v137;
                ++*(_DWORD *)(v143 + 780);
              }
              else
              {
                v145 = *v138;
                v146 = a4 + 1724 * v86;
                *(_OWORD *)(v146 + 732) = v145;
                *(_BYTE *)(v146 + 748) = v141;
                *(_DWORD *)(v146 + 764) = v142;
                *(_DWORD *)(v146 + 756) = v140;
                *(_DWORD *)(v146 + 752) = v139;
                *(_DWORD *)(v146 + 768) = v137;
              }
            }
            v90 = a4 + 1724 * v86;
            a7 = v421;
            v91 = v421 + ((unint64_t)v31->u32[0] << 9);
            v92 = *(_OWORD *)(v91 + 132);
            v93 = *(_OWORD *)(v91 + 148);
            v94 = *(_OWORD *)(v91 + 180);
            *(_OWORD *)(v90 + 912) = *(_OWORD *)(v91 + 164);
            *(_OWORD *)(v90 + 928) = v94;
            *(_OWORD *)(v90 + 880) = v92;
            *(_OWORD *)(v90 + 896) = v93;
            v95 = *(_OWORD *)(v91 + 196);
            v96 = *(_OWORD *)(v91 + 212);
            v97 = *(_OWORD *)(v91 + 244);
            *(_OWORD *)(v90 + 976) = *(_OWORD *)(v91 + 228);
            *(_OWORD *)(v90 + 992) = v97;
            *(_OWORD *)(v90 + 944) = v95;
            *(_OWORD *)(v90 + 960) = v96;
            v98 = *(_OWORD *)(v91 + 260);
            v99 = *(_OWORD *)(v91 + 276);
            v100 = *(_OWORD *)(v91 + 292);
            *(_OWORD *)(v90 + 1056) = *(_OWORD *)(v91 + 308);
            *(_OWORD *)(v90 + 1040) = v100;
            *(_OWORD *)(v90 + 1008) = v98;
            *(_OWORD *)(v90 + 1024) = v99;
            v101 = *(_OWORD *)(v91 + 324);
            v102 = *(_OWORD *)(v91 + 340);
            v103 = *(_OWORD *)(v91 + 356);
            *(_OWORD *)(v90 + 1120) = *(_OWORD *)(v91 + 372);
            *(_OWORD *)(v90 + 1104) = v103;
            *(_OWORD *)(v90 + 1088) = v102;
            *(_OWORD *)(v90 + 1072) = v101;
            v104 = v421 + ((unint64_t)v31->u32[0] << 9);
            v105 = *(_OWORD *)(v104 + 132);
            v106 = *(_OWORD *)(v104 + 148);
            v107 = *(_OWORD *)(v104 + 164);
            *(_OWORD *)(v90 + 1184) = *(_OWORD *)(v104 + 180);
            *(_OWORD *)(v90 + 1168) = v107;
            *(_OWORD *)(v90 + 1152) = v106;
            *(_OWORD *)(v90 + 1136) = v105;
            v108 = *(_OWORD *)(v104 + 196);
            v109 = *(_OWORD *)(v104 + 212);
            v110 = *(_OWORD *)(v104 + 228);
            *(_OWORD *)(v90 + 1248) = *(_OWORD *)(v104 + 244);
            *(_OWORD *)(v90 + 1232) = v110;
            *(_OWORD *)(v90 + 1216) = v109;
            *(_OWORD *)(v90 + 1200) = v108;
            v111 = *(_OWORD *)(v104 + 260);
            v112 = *(_OWORD *)(v104 + 276);
            v113 = *(_OWORD *)(v104 + 292);
            *(_OWORD *)(v90 + 1312) = *(_OWORD *)(v104 + 308);
            *(_OWORD *)(v90 + 1296) = v113;
            *(_OWORD *)(v90 + 1280) = v112;
            *(_OWORD *)(v90 + 1264) = v111;
            v114 = *(_OWORD *)(v104 + 324);
            v115 = *(_OWORD *)(v104 + 340);
            v116 = *(_OWORD *)(v104 + 356);
            *(_OWORD *)(v90 + 1376) = *(_OWORD *)(v104 + 372);
            *(_OWORD *)(v90 + 1360) = v116;
            *(_OWORD *)(v90 + 1344) = v115;
            *(_OWORD *)(v90 + 1328) = v114;
            v117 = v421 + ((unint64_t)v31->u32[0] << 9);
            v118 = *(_OWORD *)(v117 + 132);
            v119 = *(_OWORD *)(v117 + 148);
            v120 = *(_OWORD *)(v117 + 164);
            *(_OWORD *)(v90 + 1440) = *(_OWORD *)(v117 + 180);
            *(_OWORD *)(v90 + 1424) = v120;
            *(_OWORD *)(v90 + 1408) = v119;
            *(_OWORD *)(v90 + 1392) = v118;
            v121 = *(_OWORD *)(v117 + 196);
            v122 = *(_OWORD *)(v117 + 212);
            v123 = *(_OWORD *)(v117 + 228);
            *(_OWORD *)(v90 + 1504) = *(_OWORD *)(v117 + 244);
            *(_OWORD *)(v90 + 1488) = v123;
            *(_OWORD *)(v90 + 1472) = v122;
            *(_OWORD *)(v90 + 1456) = v121;
            v124 = *(_OWORD *)(v117 + 260);
            v125 = *(_OWORD *)(v117 + 276);
            v126 = *(_OWORD *)(v117 + 292);
            *(_OWORD *)(v90 + 1568) = *(_OWORD *)(v117 + 308);
            *(_OWORD *)(v90 + 1552) = v126;
            *(_OWORD *)(v90 + 1536) = v125;
            *(_OWORD *)(v90 + 1520) = v124;
            v127 = *(_OWORD *)(v117 + 324);
            v128 = *(_OWORD *)(v117 + 340);
            v129 = *(_OWORD *)(v117 + 356);
            *(_OWORD *)(v90 + 1632) = *(_OWORD *)(v117 + 372);
            *(_OWORD *)(v90 + 1616) = v129;
            *(_OWORD *)(v90 + 1600) = v128;
            *(_OWORD *)(v90 + 1584) = v127;
            *(_OWORD *)(v90 + 1664) = *(_OWORD *)(v421 + ((unint64_t)v31->u32[0] << 9) + 12);
            *(_OWORD *)(v90 + 1680) = *(_OWORD *)(v421 + ((unint64_t)v31->u32[0] << 9) + 12);
            *(float *)(v90 + 1648) = (float)*(unsigned int *)(v421 + ((unint64_t)v31->u32[0] << 9) + 28);
            v86 = (v86 + 1);
          }
          else if (v130)
          {
            v131 = &a15[520 * v416];
            *((_OWORD *)v131 + 30) = 0u;
            *((_OWORD *)v131 + 31) = 0u;
            *((_OWORD *)v131 + 28) = 0u;
            *((_OWORD *)v131 + 29) = 0u;
            *((_OWORD *)v131 + 26) = 0u;
            *((_OWORD *)v131 + 27) = 0u;
            *((_OWORD *)v131 + 24) = 0u;
            *((_OWORD *)v131 + 25) = 0u;
            *((_OWORD *)v131 + 22) = 0u;
            *((_OWORD *)v131 + 23) = 0u;
            *((_OWORD *)v131 + 20) = 0u;
            *((_OWORD *)v131 + 21) = 0u;
            *((_OWORD *)v131 + 18) = 0u;
            *((_OWORD *)v131 + 19) = 0u;
            *((_OWORD *)v131 + 16) = 0u;
            *((_OWORD *)v131 + 17) = 0u;
            *((_OWORD *)v131 + 14) = 0u;
            *((_OWORD *)v131 + 15) = 0u;
            *((_OWORD *)v131 + 12) = 0u;
            *((_OWORD *)v131 + 13) = 0u;
            *((_OWORD *)v131 + 10) = 0u;
            *((_OWORD *)v131 + 11) = 0u;
            *((_OWORD *)v131 + 8) = 0u;
            *((_OWORD *)v131 + 9) = 0u;
            *((_OWORD *)v131 + 6) = 0u;
            *((_OWORD *)v131 + 7) = 0u;
            *((_OWORD *)v131 + 4) = 0u;
            *((_OWORD *)v131 + 5) = 0u;
            *((_OWORD *)v131 + 2) = 0u;
            *((_OWORD *)v131 + 3) = 0u;
            *(_OWORD *)v131 = 0u;
            *((_OWORD *)v131 + 1) = 0u;
            *((int32x4_t *)v131 + 2) = v419;
            *((_DWORD *)v131 + 12) = -361;
            *((_DWORD *)v131 + 32) = -1;
            *((_DWORD *)v131 + 98) = -1;
            *((_DWORD *)v131 + 105) = -1;
            *((_DWORD *)v131 + 128) = 0;
            v131[516] = 0;
            memcpy(v131, (const void *)(a7 + ((unint64_t)v31->u32[0] << 9)), 0x200uLL);
            ++v416;
          }
          v31 = (int32x4_t *)((char *)v31 + 4);
          --v84;
        }
        while (v84);
      }
      else
      {
        v86 = 0;
        v416 = 0;
      }
      *a12 = v86;
      *a13 = 0;
      *a16 = v416;
      return v86;
    }
    v404 = a5 == 0;
    v401 = v36;
    v406 = v34;
    if (a5 <= v30)
      v66 = v30;
    else
      v66 = a5;
    v67 = v66 * v66;
    v388 = v41;
    v68 = v66;
    v408 = v30;
    acTrkObjectSetUpFeatureMunkresCost(a4, a5, v421, v30, (uint64_t)v37, v42, a9, a11, v388);
    v418 = a5;
    if (a5 && v68 <= 0x1D)
    {
      memcpy((void *)v38, v37, 4 * v67);
      bmMunkres((float *)v37, v68, *((unsigned __int8 **)&v38 + 1), v69, v412, v70, 0, v71);
    }
    v72 = (unsigned __int8 *)*((_QWORD *)&v434 + 1);
    v424 = v408;
    acTrkObjectFeatureAssocCore((_DWORD *)a4, a5, v421, v408, (uint64_t)v412, v38, a11, a9, (uint64_t)v31, &v424, v410, v390, (uint64_t)a17, v411, a2, a19, a20);
    v73 = 0;
    v74 = v424;
    if (!a5 || !v424)
    {
LABEL_74:
      __dst = v73;
      if (v74)
      {
        v155 = 0;
        v156 = 0;
        v157 = 0;
        v158 = v74;
        do
        {
          v159 = v31->u32[v155];
          v160 = (_DWORD *)(v421 + (v159 << 9));
          if (v160[7] < 2u)
          {
            memcpy((void *)(*((_QWORD *)&v39 + 1) + ((unint64_t)v156 << 9)), v160, 0x200uLL);
            *(_DWORD *)(v40 + 4 * v156++) = v159;
          }
          else
          {
            if (v155 != v157)
              v31->i32[v157] = v159;
            ++v157;
          }
          ++v155;
        }
        while (v158 != v155);
      }
      else
      {
        v157 = 0;
        v156 = 0;
      }
      v424 = v157;
      if (*a16 <= v156)
        v161 = v156;
      else
        v161 = *a16;
      if (!v161)
      {
LABEL_132:
        a5 = __dst;
        if (v418)
        {
          v191 = v418;
          v192 = v431 + 16;
          v193 = (float32x2_t *)(a4 + 20);
          do
          {
            v198 = v193[-2].i32[1] - 1;
            if (v198 <= 0xB)
              v194 = dword_23591559C[v198];
            else
              v194 = 0;
            v195 = v193[-1];
            v196 = vadd_f32(v195, *v193);
            v197 = (float)v193[1].u32[0];
            *(float32x2_t *)(v192 - 16) = v195;
            *(float32x2_t *)(v192 - 8) = v196;
            *(_DWORD *)v192 = v194;
            *(float *)(v192 + 8) = v197 / 1000.0;
            v192 += 32;
            v193 = (float32x2_t *)((char *)v193 + 1724);
            --v191;
          }
          while (v191);
        }
        if (v157)
        {
          v199 = 0;
          v200 = 0;
          v201 = *(float *)(a11 + 44);
          v202 = *(float *)(a11 + 48);
          v415 = *(unsigned __int8 *)(a11 + 108);
          do
          {
            v203 = v31->u32[v199];
            memcpy(v422, (const void *)(v421 + (v203 << 9)), sizeof(v422));
            if (!v418)
              goto LABEL_178;
            v204 = vadd_f32(*(float32x2_t *)&v422[3], *(float32x2_t *)&v422[5]);
            v205 = vsub_f32(v204, *(float32x2_t *)&v422[3]);
            v206 = vcgtz_f32(v205);
            v207 = v205.f32[1];
            if ((v206.i8[4] & 1) == 0)
              v207 = 0.0;
            if ((v206.i8[0] & 1) == 0)
              v205.f32[0] = 0.0;
            v208 = v205.f32[0] * v207;
            if (v415)
            {
              v209 = 0;
              v210 = 1;
              v211 = a4 + 884;
              while (1)
              {
                v212 = 0;
                v213 = 0.0;
                v214 = 0.0;
                v215 = 0.0;
                do
                {
                  v216 = *(float *)&v422[v212 + 33];
                  v217 = *(float *)&v422[v212 + 34];
                  v218 = *(float *)(v211 + v212 * 4 - 4);
                  v219 = *(float *)(v211 + v212 * 4);
                  v213 = (float)(v213 + (float)(v218 * v218)) + (float)(v219 * v219);
                  v214 = (float)(v214 + (float)(v216 * v216)) + (float)(v217 * v217);
                  v215 = (float)(v215 + (float)(v216 * v218)) + (float)(v217 * v219);
                  v212 += 2;
                }
                while (v212 != 64);
                v220 = a4 + 1724 * v209;
                v221 = 1.0 - (float)(v215 / (float)((float)(sqrtf(v214) * sqrtf(v213)) + 0.00001));
                if (v221 <= 0.0)
                  v222 = 1.0;
                else
                  v222 = 1.0 - v221;
                v223 = *(float32x2_t *)(v220 + 12);
                v224 = vadd_f32(v223, *(float32x2_t *)(v220 + 20));
                v225 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v204, v224), (int8x8_t)v224, (int8x8_t)v204), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*(float32x2_t *)&v422[3], v223), *(int8x8_t *)&v422[3], (int8x8_t)v223)), 0);
                v226 = vmul_lane_f32(v225, v225, 1).f32[0];
                v227 = 0.0;
                if (v226 >= 0.00000011921)
                {
                  v228 = vsub_f32(v224, v223);
                  v229 = fmaxf(v228.f32[0], 0.0) * fmaxf(v228.f32[1], 0.0);
                  if (v229 >= v208)
                    v229 = v208;
                  v230 = v226 / v229;
                  if (v229 >= 0.00000011921)
                    v227 = v230;
                  else
                    v227 = 0.0;
                }
                if (v227 > v202 && v222 > v201)
                  break;
                ++v209;
                v211 += 1724;
                v210 = v209 < v418;
                if (v209 == v418)
                  goto LABEL_178;
              }
            }
            else
            {
              v231 = 0;
              v210 = 1;
              v232 = a4 + 884;
              while (1)
              {
                v233 = 0;
                v234 = 0.0;
                v235 = 0.0;
                v236 = 0.0;
                do
                {
                  v237 = *(float *)&v422[v233 + 33];
                  v238 = *(float *)&v422[v233 + 34];
                  v239 = *(float *)(v232 + v233 * 4 - 4);
                  v240 = *(float *)(v232 + v233 * 4);
                  v234 = (float)(v234 + (float)(v239 * v239)) + (float)(v240 * v240);
                  v235 = (float)(v235 + (float)(v237 * v237)) + (float)(v238 * v238);
                  v236 = (float)(v236 + (float)(v237 * v239)) + (float)(v238 * v240);
                  v233 += 2;
                }
                while (v233 != 64);
                v241 = a4 + 1724 * v231;
                v242 = 1.0 - (float)(v236 / (float)((float)(sqrtf(v235) * sqrtf(v234)) + 0.00001));
                if (v242 <= 0.0)
                  v243 = 1.0;
                else
                  v243 = 1.0 - v242;
                v244 = *(float32x2_t *)(v241 + 12);
                v245 = vadd_f32(v244, *(float32x2_t *)(v241 + 20));
                v246 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v204, v245), (int8x8_t)v245, (int8x8_t)v204), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*(float32x2_t *)&v422[3], v244), *(int8x8_t *)&v422[3], (int8x8_t)v244)), 0);
                v247 = vmul_lane_f32(v246, v246, 1).f32[0];
                v248 = 0.0;
                if (v247 >= 0.00000011921)
                {
                  v249 = vsub_f32(v245, v244);
                  v249.f32[0] = (float)((float)(fmaxf(v249.f32[0], 0.0) * fmaxf(v249.f32[1], 0.0)) + v208) - v247;
                  v250 = v247 / v249.f32[0];
                  if (v249.f32[0] >= 0.00000011921)
                    v248 = v250;
                  else
                    v248 = 0.0;
                }
                if (v248 > v202 && v243 > v201)
                  break;
                ++v231;
                v232 += 1724;
                v210 = v231 < v418;
                if (v231 == v418)
                  goto LABEL_178;
              }
            }
            if (!v210)
            {
LABEL_178:
              if (v199 != v200)
                v31->i32[v200] = v203;
              ++v200;
            }
            ++v199;
          }
          while (v199 != v157);
          v251 = (_OWORD *)*((_QWORD *)&v431 + 1);
          a5 = __dst;
          if (v200)
          {
            v252 = 0;
            v253 = v31;
            v44 = a2;
            v23 = v405;
            do
            {
              v260 = v253->i32[0];
              v253 = (int32x4_t *)((char *)v253 + 4);
              v259 = v260;
              v261 = v421 + ((unint64_t)v260 << 9);
              v262 = *(_DWORD *)(v261 + 8) - 1;
              if (v262 <= 0xB)
                v254 = dword_23591559C[v262];
              else
                v254 = 0;
              v255 = *(float32x2_t *)(v261 + 12);
              v256 = vadd_f32(v255, *(float32x2_t *)(v261 + 20));
              v257 = (float)*(unsigned int *)(v261 + 28) / 1000.0;
              v258 = (float32x2_t *)&v251[v252];
              *v258 = v255;
              v258[1] = v256;
              v258[3].f32[0] = v257;
              v258[2].i32[0] = v254;
              v258[2].i32[1] = v259;
              v252 += 2;
            }
            while (2 * v200 != v252);
            goto LABEL_188;
          }
        }
        else
        {
          v200 = 0;
          v251 = (_OWORD *)*((_QWORD *)&v431 + 1);
        }
        v44 = a2;
        v23 = v405;
LABEL_188:
        v263 = acRemoveOverlapBoxes(v251, v200, (unsigned __int8 *)v432, *(float *)(a9 + 48));
        v187 = v263;
        v32 = v400;
        if (v263)
        {
          if (v263 > 0xA
            && (v31 < (int32x4_t *)((char *)&v251[2 * v263 - 1] + 8)
              ? (v264 = (char *)v251 + 20 >= &v31->i8[4 * v263])
              : (v264 = 1),
                v264))
          {
            v265 = v263 & 3;
            if ((v263 & 3) == 0)
              v265 = 4;
            v266 = v263 - v265;
            v267 = (int32x2_t *)&v31->u64[1];
            v268 = (int32x2_t *)((char *)v251 + 84);
            v269 = v266;
            do
            {
              v270 = vzip1_s32(*v268, v268[4]);
              v267[-1] = vzip1_s32(v268[-8], v268[-4]);
              *v267 = v270;
              v267 += 2;
              v268 += 16;
              v269 -= 4;
            }
            while (v269);
          }
          else
          {
            v266 = 0;
          }
          v271 = v263 - v266;
          v272 = (unsigned int *)v31 + v266;
          v273 = (unsigned int *)&v251[2 * v266 + 1] + 1;
          do
          {
            v274 = *v273;
            v273 += 8;
            *v272++ = v274;
            --v271;
          }
          while (v271);
        }
        v424 = v263;
        v34 = v406;
        goto LABEL_204;
      }
      sub_2358FA7DC((uint64_t)a15, *a16, *((uint64_t *)&v39 + 1), v156, v398, a9, a17);
      memcpy(*((void **)&v398 + 1), (const void *)v398, 4 * v161 * v161);
      bmMunkres((float *)v398, v161, v397, v162, v399, v163, 0, v164);
      __src[0] = 0;
      v423 = 0;
      sub_2358FADA8(a15, *a16, *((_DWORD **)&v39 + 1), v156, (uint64_t)v399, *((uint64_t *)&v398 + 1), (float *)a10, *((uint64_t *)&v40 + 1), v402, &v423, __src);
      v165 = __src[0];
      if (__src[0])
      {
        v166 = (_BYTE *)*((_QWORD *)&v443 + 1);
        v167 = (int *)v402;
        v168 = __src[0];
        do
        {
          v169 = *v167++;
          *v166++ = a15[520 * v399[v169] + 516];
          --v168;
        }
        while (v168);
      }
      v170 = *a16;
      if ((_DWORD)v170)
      {
        v171 = 0;
        v172 = 0;
        v173 = (unsigned int *)(a10 + 88);
        v174 = a15;
        v396 = v157;
        do
        {
          v175 = *((_DWORD *)v174 + 128);
          if (v175)
          {
            v176 = *((unsigned int *)v174 + 2);
            switch((int)v176)
            {
              case 0:
                if (v174[100])
                {
                  if (v175 < *v173)
                    goto LABEL_106;
                }
                else if (v175 < *(_DWORD *)(a10 + 84))
                {
                  goto LABEL_106;
                }
                break;
              case 1:
                goto LABEL_105;
              case 2:
              case 4:
                v176 = 2;
                goto LABEL_105;
              case 3:
              case 5:
                v176 = 3;
                goto LABEL_105;
              case 8:
                v176 = 4;
                goto LABEL_105;
              default:
                v177 = (v176 & 0xFFFFFFFE) == 10;
                v176 = 5;
                if (v177)
                  v176 = 6;
LABEL_105:
                if (v175 < v173[v176])
                {
LABEL_106:
                  if (v171 != v172)
                  {
                    v178 = v173;
                    memcpy(&a15[520 * v172], v174, 0x208uLL);
                    v173 = v178;
                    v157 = v396;
                  }
                  ++v172;
                }
                break;
            }
          }
          v174 += 520;
          ++v171;
        }
        while (v170 != v171);
      }
      else
      {
        v172 = 0;
      }
      v179 = *((_QWORD *)&v39 + 1);
      *a16 = v172;
      v180 = v423;
      if (v423)
      {
        *(int32x4_t *)v413 = vdupq_n_s32(0xFFFFFE97);
        v181 = (unsigned int *)*((_QWORD *)&v40 + 1);
        do
        {
          if (*(_DWORD *)(v179 + ((unint64_t)*v181 << 9) + 28))
          {
            v182 = &a15[520 * v172];
            *((_OWORD *)v182 + 30) = 0u;
            *((_OWORD *)v182 + 31) = 0u;
            *((_OWORD *)v182 + 28) = 0u;
            *((_OWORD *)v182 + 29) = 0u;
            *((_OWORD *)v182 + 26) = 0u;
            *((_OWORD *)v182 + 27) = 0u;
            *((_OWORD *)v182 + 24) = 0u;
            *((_OWORD *)v182 + 25) = 0u;
            *((_OWORD *)v182 + 22) = 0u;
            *((_OWORD *)v182 + 23) = 0u;
            *((_OWORD *)v182 + 20) = 0u;
            *((_OWORD *)v182 + 21) = 0u;
            *((_OWORD *)v182 + 18) = 0u;
            *((_OWORD *)v182 + 19) = 0u;
            *((_OWORD *)v182 + 16) = 0u;
            *((_OWORD *)v182 + 17) = 0u;
            *((_OWORD *)v182 + 14) = 0u;
            *((_OWORD *)v182 + 15) = 0u;
            *((_OWORD *)v182 + 12) = 0u;
            *((_OWORD *)v182 + 13) = 0u;
            *((_OWORD *)v182 + 10) = 0u;
            *((_OWORD *)v182 + 11) = 0u;
            *((_OWORD *)v182 + 8) = 0u;
            *((_OWORD *)v182 + 9) = 0u;
            *((_OWORD *)v182 + 6) = 0u;
            *((_OWORD *)v182 + 7) = 0u;
            *((_OWORD *)v182 + 4) = 0u;
            *((_OWORD *)v182 + 5) = 0u;
            *((_OWORD *)v182 + 2) = 0u;
            *((_OWORD *)v182 + 3) = 0u;
            *(_OWORD *)v182 = 0u;
            *((_OWORD *)v182 + 1) = 0u;
            *((_OWORD *)v182 + 2) = *(_OWORD *)v413;
            *((_DWORD *)v182 + 12) = -361;
            *((_DWORD *)v182 + 32) = -1;
            *((_DWORD *)v182 + 98) = -1;
            *((_DWORD *)v182 + 105) = -1;
            *((_DWORD *)v182 + 128) = 0;
            v182[516] = 0;
            memcpy(&a15[520 * *a16], (const void *)(v179 + ((unint64_t)*v181 << 9)), 0x200uLL);
            v172 = *a16 + 1;
            *a16 = v172;
            v179 = *((_QWORD *)&v39 + 1);
          }
          ++v181;
          --v180;
        }
        while (v180);
      }
      if (v172)
      {
        v183 = v172;
        if (v172 == 1)
        {
          v184 = 0;
          goto LABEL_126;
        }
        v184 = v172 & 0xFFFFFFFE;
        if (v184 != v172)
        {
LABEL_126:
          v188 = v184 | 1;
          if (v188 > v172)
            v183 = v188;
        }
      }
      else
      {
        v183 = 0;
      }
      *a16 = v183;
      if ((_DWORD)v165)
      {
        v189 = (unsigned int *)v402;
        do
        {
          v190 = *v189++;
          v31->i32[v157++] = *(_DWORD *)(v40 + 4 * v190);
          --v165;
        }
        while (v165);
        v424 = v157;
      }
      goto LABEL_132;
    }
    acTrkObjectSetUpIoUMunkresCost((_OWORD *)a4, a5, v421, v408, (uint64_t)v393);
    memcpy(v395, v393, 4 * v67);
    bmMunkres((float *)v393, v68, v72, v75, v394, v76, 0, v77);
    acTrkObjectIoUAssocCore((_DWORD *)a4, a5, v421, v408, (uint64_t)v394, (uint64_t)v395, a9, a11, v31, &v424, v410, v391, (void *)v39, (uint64_t)a17, a19, a20);
    if (a5 >= 2)
    {
      v149 = 0;
      v150 = 0;
      v78 = a5 & 0xFFFFFFFE;
      v151 = a4;
      v152 = v78;
      do
      {
        if (*(_DWORD *)(v151 + 528) == 2)
          ++v149;
        if (*(_DWORD *)(v151 + 2252) == 2)
          ++v150;
        v151 += 3448;
        v152 -= 2;
      }
      while (v152);
      v73 = v150 + v149;
      if (v78 == a5)
        goto LABEL_73;
    }
    else
    {
      v78 = 0;
      v73 = 0;
    }
    v153 = a5 - v78;
    v154 = (_DWORD *)(a4 + 1724 * v78 + 528);
    do
    {
      if (*v154 == 2)
        ++v73;
      v154 += 431;
      --v153;
    }
    while (v153);
LABEL_73:
    v74 = v424;
    goto LABEL_74;
  }
  v424 = 0;
  v45 = *a16;
  v44 = a2;
  if (!(a5 | *a16))
    goto LABEL_47;
  v401 = (void *)v430;
  v404 = a5 == 0;
  v410 = __b;
  v409 = v429;
  v418 = a5;
  if (a5)
  {
    v46 = 0;
    v47 = 1724 * a5;
    a5 = 0;
    while (1)
    {
      v53 = a4 + v46;
      *(_DWORD *)(a4 + v46 + 448) = 1;
      v54 = *(_DWORD *)(a4 + v46 + 780);
      v55 = v54 - 1;
      if (!v54)
        v55 = 0;
      v56 = v53 + 40 * v55 + 532;
      v57 = *(unsigned int *)(v53 + 8);
      if ((_DWORD)v57 == 9)
        break;
      if (v54 < 6)
      {
        v63 = a4 + 40 * v54 + v46 + 532;
        v64 = *(_OWORD *)v56;
        v65 = *(_OWORD *)(v56 + 16);
        *(_QWORD *)(v63 + 32) = *(_QWORD *)(v56 + 32);
        *(_OWORD *)v63 = v64;
        *(_OWORD *)(v63 + 16) = v65;
        ++*(_DWORD *)(v53 + 780);
        if (a7)
          goto LABEL_24;
      }
      else
      {
        v60 = a4 + v46 + 732;
        v61 = *(_OWORD *)v56;
        v62 = *(_OWORD *)(v56 + 16);
        *(_QWORD *)(v60 + 32) = *(_QWORD *)(v56 + 32);
        *(_OWORD *)v60 = v61;
        *(_OWORD *)(v60 + 16) = v62;
        if (a7)
          goto LABEL_24;
      }
LABEL_25:
      if (v57 < 9 && ((0x13Fu >> v57) & 1) != 0)
      {
        v48 = qword_235915288[v57];
      }
      else if ((v57 & 0xFFFFFFFE) == 0xA)
      {
        v48 = 6;
      }
      else
      {
        v48 = 5;
      }
      v49 = *(_DWORD *)(a9 + 4 * v48 + 60);
      v50 = *(_DWORD *)(a4 + v46 + 512);
      v51 = v50 >= v49;
      if (v50 < v49)
        v52 = 1;
      else
        v52 = 2;
      if (v51)
        ++a5;
      *(_DWORD *)(a4 + v46 + 528) = v52;
      v46 += 1724;
      if (v47 == v46)
      {
        v148 = a16;
        v45 = *a16;
        goto LABEL_121;
      }
    }
    v58 = *(_OWORD *)v56;
    v59 = *(_OWORD *)(v56 + 16);
    *(_QWORD *)(v53 + 564) = *(_QWORD *)(v56 + 32);
    *(_OWORD *)(v53 + 532) = v58;
    *(_OWORD *)(v53 + 548) = v59;
    *(_DWORD *)(v53 + 780) = 1;
    if (!a7)
      goto LABEL_25;
LABEL_24:
    ++*(_DWORD *)(a4 + v46 + 512);
    goto LABEL_25;
  }
  v148 = a16;
LABEL_121:
  v411 = a1;
  v408 = v30;
  if (v45)
  {
    v185 = 0;
    v186 = vdupq_n_s32(0xFFFFFE97);
    do
    {
      *((_OWORD *)v27 + 30) = 0uLL;
      *((_OWORD *)v27 + 31) = 0uLL;
      *((_OWORD *)v27 + 28) = 0uLL;
      *((_OWORD *)v27 + 29) = 0uLL;
      *((_OWORD *)v27 + 26) = 0uLL;
      *((_OWORD *)v27 + 27) = 0uLL;
      *((_OWORD *)v27 + 24) = 0uLL;
      *((_OWORD *)v27 + 25) = 0uLL;
      *((_OWORD *)v27 + 22) = 0uLL;
      *((_OWORD *)v27 + 23) = 0uLL;
      *((_OWORD *)v27 + 20) = 0uLL;
      *((_OWORD *)v27 + 21) = 0uLL;
      *((_OWORD *)v27 + 18) = 0uLL;
      *((_OWORD *)v27 + 19) = 0uLL;
      *((_OWORD *)v27 + 16) = 0uLL;
      *((_OWORD *)v27 + 17) = 0uLL;
      *((_OWORD *)v27 + 14) = 0uLL;
      *((_OWORD *)v27 + 15) = 0uLL;
      *((_OWORD *)v27 + 12) = 0uLL;
      *((_OWORD *)v27 + 13) = 0uLL;
      *((_OWORD *)v27 + 10) = 0uLL;
      *((_OWORD *)v27 + 11) = 0uLL;
      *((_OWORD *)v27 + 8) = 0uLL;
      *((_OWORD *)v27 + 9) = 0uLL;
      *((_OWORD *)v27 + 6) = 0uLL;
      *((_OWORD *)v27 + 7) = 0uLL;
      *((_OWORD *)v27 + 4) = 0uLL;
      *((_OWORD *)v27 + 5) = 0uLL;
      *((_OWORD *)v27 + 2) = 0uLL;
      *((_OWORD *)v27 + 3) = 0uLL;
      *(_OWORD *)v27 = 0uLL;
      *((_OWORD *)v27 + 1) = 0uLL;
      *((int32x4_t *)v27 + 2) = v186;
      *((_DWORD *)v27 + 12) = -361;
      *((_DWORD *)v27 + 32) = -1;
      *((_DWORD *)v27 + 98) = -1;
      *((_DWORD *)v27 + 105) = -1;
      *((_DWORD *)v27 + 128) = 0;
      v27[516] = 0;
      ++v185;
      v27 += 520;
    }
    while (v185 < *v148);
  }
  v187 = 0;
  *v148 = 0;
LABEL_204:
  v275 = v418 - a5 + v187;
  if (v275 > v23)
  {
    if (v404)
    {
      v276 = a5;
      v277 = 0;
    }
    else
    {
      v276 = a5;
      v370 = 0;
      v277 = 0;
      v371 = (_DWORD *)(a4 + 528);
      do
      {
        if (*v371 == 1)
        {
          v372 = (_DWORD *)(v32 + 8 * v277);
          *v372 = v370;
          v372[1] = *(v371 - 2);
          ++v277;
        }
        ++v370;
        v371 += 431;
      }
      while (v418 != v370);
    }
    v278 = v32;
    bmHeapsort(v32, v277, 8uLL, (int (*)(uint64_t, uint64_t))sub_2358FAFFC);
    v279 = v276;
    v44 = a2;
    if (v277)
    {
      v280 = v279 - v23 + v275;
      if (v279 < v280)
      {
        v281 = v277 - 1;
        if (v281 >= v187 + v418 + ~v279 - v23)
          v281 = v187 + v418 + ~v279 - v23;
        if (v281)
        {
          v282 = v281 + 1;
          v281 = (v281 + 1) & 0x1FFFFFFFELL;
          v283 = (unsigned int *)(v278 + 8);
          v284 = v281;
          do
          {
            v285 = *(v283 - 2);
            v286 = *v283;
            v283 += 4;
            *(_DWORD *)(a4 + 1724 * v285 + 528) = 2;
            *(_DWORD *)(a4 + 1724 * v286 + 528) = 2;
            v284 -= 2;
          }
          while (v284);
          if (v282 == v281)
            goto LABEL_220;
          v279 += v281;
        }
        v287 = v281 + 1;
        v288 = v279 + 1;
        v289 = (unsigned int *)(v278 + 8 * v281);
        do
        {
          v290 = *v289;
          v289 += 2;
          *(_DWORD *)(a4 + 1724 * v290 + 528) = 2;
          if (v287 >= v277)
            break;
          ++v287;
          v51 = v288++ >= v280;
        }
        while (!v51);
      }
    }
  }
LABEL_220:
  acTrkObjectPickDet(v411, v44, a4, v418, v23, v421, v408, (uint64_t)v31, &v424, v409, v389, v410, v392, *(_BYTE *)(a9 + 194), *(_DWORD *)(a9 + 196));
  if (v404)
  {
    v291 = 0;
  }
  else
  {
    v364 = 0;
    v291 = 0;
    v365 = (int *)a4;
    do
    {
      if (v365[132] <= 1)
      {
        if (v364 != v291)
          memcpy((void *)(a4 + 1724 * v291), v365, 0x6BCuLL);
        ++v291;
      }
      v365 += 431;
      ++v364;
    }
    while (v418 != v364);
  }
  if (v291 >= v23)
    v292 = v23;
  else
    v292 = v291;
  v293 = v424;
  if (v424 >= v23)
    v293 = v23;
  if (v293 + v292 <= v23)
    v294 = v293;
  else
    v294 = v23 - v292;
  if ((_DWORD)v294)
  {
    v407 = v34;
    v420 = vdupq_n_s32(0xFFFFFE97);
    *(_QWORD *)v417 = v292;
    LODWORD(v86) = v292;
    v295 = v421;
    do
    {
      v337 = v31->i32[0];
      v31 = (int32x4_t *)((char *)v31 + 4);
      v336 = v337;
      v338 = v86;
      v339 = (_DWORD *)(a4 + 1724 * v86);
      bzero(v339, 0x6BCuLL);
      *((int32x4_t *)v339 + 2) = v420;
      v339[12] = -361;
      v339[32] = -1;
      v339[98] = -1;
      v339[105] = -1;
      *(_QWORD *)(v339 + 193) = 0xFF7FFFFFFFFFFFFFLL;
      v339[198] = 0;
      *(_QWORD *)(v339 + 207) = 0;
      v340 = v295 + ((unint64_t)v337 << 9);
      v339[209] = 0;
      memcpy(v339, (const void *)v340, 0x200uLL);
      v341 = (*a14)++;
      *v339 = v341;
      v339[131] = LODWORD(a17[v337]);
      v342 = *(_DWORD *)(v340 + 8);
      v343 = (__int128 *)(v340 + 12);
      v344 = *(_DWORD *)(v340 + 40);
      v345 = *(_DWORD *)(v340 + 44);
      v346 = *(_BYTE *)(v340 + 100);
      v347 = *(_DWORD *)(v340 + 420);
      if (v339[2] == 9)
      {
        v296 = *v343;
        v297 = a4 + 1724 * v338;
        *(_OWORD *)(v297 + 532) = v296;
        *(_BYTE *)(v297 + 548) = v346;
        *(_DWORD *)(v297 + 564) = v347;
        *(_DWORD *)(v297 + 556) = v345;
        *(_DWORD *)(v297 + 552) = v344;
        *(_DWORD *)(v297 + 568) = v342;
        *(_DWORD *)(v297 + 780) = 1;
      }
      else
      {
        v348 = a4 + 1724 * v338;
        v349 = *(_DWORD *)(v348 + 780);
        if (v349 < 6)
        {
          v352 = a4 + 1724 * v338 + 40 * v349;
          *(_OWORD *)(v352 + 532) = *v343;
          *(_BYTE *)(v352 + 548) = v346;
          *(_DWORD *)(v352 + 564) = v347;
          *(_DWORD *)(v352 + 556) = v345;
          *(_DWORD *)(v352 + 552) = v344;
          *(_DWORD *)(v352 + 568) = v342;
          ++*(_DWORD *)(v348 + 780);
        }
        else
        {
          v350 = *v343;
          v351 = a4 + 1724 * v338;
          *(_OWORD *)(v351 + 732) = v350;
          *(_BYTE *)(v351 + 748) = v346;
          *(_DWORD *)(v351 + 764) = v347;
          *(_DWORD *)(v351 + 756) = v345;
          *(_DWORD *)(v351 + 752) = v344;
          *(_DWORD *)(v351 + 768) = v342;
        }
      }
      v298 = a4 + 1724 * v338;
      v295 = v421;
      v299 = v421 + (v336 << 9);
      v300 = *(_OWORD *)(v299 + 132);
      v301 = *(_OWORD *)(v299 + 148);
      v302 = *(_OWORD *)(v299 + 180);
      *(_OWORD *)(v298 + 912) = *(_OWORD *)(v299 + 164);
      *(_OWORD *)(v298 + 928) = v302;
      *(_OWORD *)(v298 + 880) = v300;
      *(_OWORD *)(v298 + 896) = v301;
      v303 = *(_OWORD *)(v299 + 196);
      v304 = *(_OWORD *)(v299 + 212);
      v305 = *(_OWORD *)(v299 + 244);
      *(_OWORD *)(v298 + 976) = *(_OWORD *)(v299 + 228);
      *(_OWORD *)(v298 + 992) = v305;
      *(_OWORD *)(v298 + 944) = v303;
      *(_OWORD *)(v298 + 960) = v304;
      v306 = *(_OWORD *)(v299 + 260);
      v307 = *(_OWORD *)(v299 + 276);
      v308 = *(_OWORD *)(v299 + 292);
      *(_OWORD *)(v298 + 1056) = *(_OWORD *)(v299 + 308);
      *(_OWORD *)(v298 + 1040) = v308;
      *(_OWORD *)(v298 + 1008) = v306;
      *(_OWORD *)(v298 + 1024) = v307;
      v309 = *(_OWORD *)(v299 + 324);
      v310 = *(_OWORD *)(v299 + 340);
      v311 = *(_OWORD *)(v299 + 356);
      *(_OWORD *)(v298 + 1120) = *(_OWORD *)(v299 + 372);
      *(_OWORD *)(v298 + 1104) = v311;
      *(_OWORD *)(v298 + 1088) = v310;
      *(_OWORD *)(v298 + 1072) = v309;
      v312 = *(_OWORD *)(v299 + 132);
      v313 = *(_OWORD *)(v299 + 148);
      v314 = *(_OWORD *)(v299 + 164);
      *(_OWORD *)(v298 + 1184) = *(_OWORD *)(v299 + 180);
      *(_OWORD *)(v298 + 1168) = v314;
      *(_OWORD *)(v298 + 1152) = v313;
      *(_OWORD *)(v298 + 1136) = v312;
      v315 = *(_OWORD *)(v299 + 196);
      v316 = *(_OWORD *)(v299 + 212);
      v317 = *(_OWORD *)(v299 + 228);
      *(_OWORD *)(v298 + 1248) = *(_OWORD *)(v299 + 244);
      *(_OWORD *)(v298 + 1232) = v317;
      *(_OWORD *)(v298 + 1216) = v316;
      *(_OWORD *)(v298 + 1200) = v315;
      v318 = *(_OWORD *)(v299 + 260);
      v319 = *(_OWORD *)(v299 + 276);
      v320 = *(_OWORD *)(v299 + 292);
      *(_OWORD *)(v298 + 1312) = *(_OWORD *)(v299 + 308);
      *(_OWORD *)(v298 + 1296) = v320;
      *(_OWORD *)(v298 + 1280) = v319;
      *(_OWORD *)(v298 + 1264) = v318;
      v321 = *(_OWORD *)(v299 + 324);
      v322 = *(_OWORD *)(v299 + 340);
      v323 = *(_OWORD *)(v299 + 356);
      *(_OWORD *)(v298 + 1376) = *(_OWORD *)(v299 + 372);
      *(_OWORD *)(v298 + 1360) = v323;
      *(_OWORD *)(v298 + 1344) = v322;
      *(_OWORD *)(v298 + 1328) = v321;
      v324 = *(_OWORD *)(v299 + 132);
      v325 = *(_OWORD *)(v299 + 148);
      v326 = *(_OWORD *)(v299 + 164);
      *(_OWORD *)(v298 + 1440) = *(_OWORD *)(v299 + 180);
      *(_OWORD *)(v298 + 1424) = v326;
      *(_OWORD *)(v298 + 1408) = v325;
      *(_OWORD *)(v298 + 1392) = v324;
      v327 = *(_OWORD *)(v299 + 196);
      v328 = *(_OWORD *)(v299 + 212);
      v329 = *(_OWORD *)(v299 + 228);
      *(_OWORD *)(v298 + 1504) = *(_OWORD *)(v299 + 244);
      *(_OWORD *)(v298 + 1488) = v329;
      *(_OWORD *)(v298 + 1472) = v328;
      *(_OWORD *)(v298 + 1456) = v327;
      v330 = *(_OWORD *)(v299 + 260);
      v331 = *(_OWORD *)(v299 + 276);
      v332 = *(_OWORD *)(v299 + 292);
      *(_OWORD *)(v298 + 1568) = *(_OWORD *)(v299 + 308);
      *(_OWORD *)(v298 + 1552) = v332;
      *(_OWORD *)(v298 + 1536) = v331;
      *(_OWORD *)(v298 + 1520) = v330;
      v333 = *(_OWORD *)(v299 + 324);
      v334 = *(_OWORD *)(v299 + 340);
      v335 = *(_OWORD *)(v299 + 356);
      *(_OWORD *)(v298 + 1632) = *(_OWORD *)(v299 + 372);
      *(_OWORD *)(v298 + 1616) = v335;
      *(_OWORD *)(v298 + 1600) = v334;
      *(_OWORD *)(v298 + 1584) = v333;
      *(_OWORD *)(v298 + 1664) = *(_OWORD *)(v299 + 12);
      *(_OWORD *)(v298 + 1680) = *(_OWORD *)(v299 + 12);
      *(float *)(v298 + 1648) = (float)*(unsigned int *)(v299 + 28);
      v86 = v338 + 1;
      --v294;
    }
    while (v294);
    v292 = *(_QWORD *)v417;
    v353 = v86 - v417[0];
    *a12 = v86 - v417[0];
    if (v86 <= v417[0])
    {
      v356 = a13;
      *a13 = 0;
      v44 = a2;
      v34 = v407;
      v357 = v401;
      if (!v417[0])
        goto LABEL_277;
      goto LABEL_263;
    }
    v354 = v86 - *(_QWORD *)v417;
    v355 = *(_QWORD *)v417;
    v356 = a13;
    v44 = a2;
    v34 = v407;
    v357 = v401;
    if (v86 - *(_QWORD *)v417 > 7)
    {
      v358 = v354 & 0xFFFFFFFFFFFFFFF8;
      v359 = vaddq_s32(vdupq_n_s32(v417[0]), (int32x4_t)xmmword_2359168E0);
      v360 = (v86 - *(_QWORD *)v417) & 0xFFFFFFFFFFFFFFF8;
      v361 = v407 + 1;
      v362.i64[0] = 0x400000004;
      v362.i64[1] = 0x400000004;
      v363.i64[0] = 0x800000008;
      v363.i64[1] = 0x800000008;
      do
      {
        v361[-1] = v359;
        *v361 = vaddq_s32(v359, v362);
        v359 = vaddq_s32(v359, v363);
        v361 += 2;
        v360 -= 8;
      }
      while (v360);
      if (v354 == v358)
      {
LABEL_245:
        *a13 = 0;
        if (v421)
          goto LABEL_246;
        goto LABEL_255;
      }
      v355 = v358 + *(_QWORD *)v417;
    }
    do
    {
      v407->i32[v355 - *(_QWORD *)v417] = v355;
      ++v355;
    }
    while (v86 != v355);
    goto LABEL_245;
  }
  v353 = 0;
  v356 = a13;
  *a12 = 0;
  v86 = v292;
  v357 = v401;
  *a13 = 0;
  if (v421)
  {
LABEL_246:
    if (!(_DWORD)v292)
      goto LABEL_277;
LABEL_263:
    v366 = 0;
    v367 = (_DWORD *)(a4 + 512);
    do
    {
      if (!*v367)
      {
        v34->i32[v353++] = v366;
        ++*v356;
      }
      v367 += 431;
      ++v366;
    }
    while (v292 != v366);
    v368 = 0;
    v369 = (_DWORD *)(a4 + 512);
    do
    {
      if (*v369)
        v34->i32[v353++] = v368;
      v369 += 431;
      ++v368;
    }
    while (v292 != v368);
    goto LABEL_277;
  }
LABEL_255:
  if (!(_DWORD)v292)
    goto LABEL_277;
  if (v292 <= 0xB || __CFADD__(v353, v292 - 1))
  {
    for (i = 0; i != v292; ++i)
LABEL_260:
      v34->i32[v353 + i] = i;
    goto LABEL_277;
  }
  v373 = (int32x4_t)xmmword_2359168E0;
  i = v292 & 0xFFFFFFF8;
  v375.i64[0] = 0x400000004;
  v375.i64[1] = 0x400000004;
  v376.i64[0] = 0x800000008;
  v376.i64[1] = 0x800000008;
  v377 = v353;
  v378 = i;
  do
  {
    v379 = (int32x4_t *)((char *)v34 + 4 * v377);
    *v379 = v373;
    v379[1] = vaddq_s32(v373, v375);
    v373 = vaddq_s32(v373, v376);
    v377 += 8;
    v378 -= 8;
  }
  while (v378);
  if (i != v292)
    goto LABEL_260;
LABEL_277:
  v380 = v86;
  bzero(v357, v86);
  if ((_DWORD)v86)
  {
    v381 = 0;
    do
    {
      if (!*((_BYTE *)v357 + v381))
      {
        memcpy(__src, (const void *)(a4 + 1724 * v381), 0x6BCuLL);
        *((_BYTE *)v357 + v381) = 1;
        v382 = v34->u32[v381];
        v383 = v381;
        if (v381 != v382)
        {
          v383 = v381;
          do
          {
            memcpy((void *)(a4 + 1724 * v383), (const void *)(a4 + 1724 * v382), 0x6BCuLL);
            v383 = v34->u32[v383];
            *((_BYTE *)v357 + v383) = 1;
            v382 = v34->u32[v383];
          }
          while (v381 != v382);
        }
        memcpy((void *)(a4 + 1724 * v383), __src, 0x6BCuLL);
      }
      ++v381;
    }
    while (v381 != v86);
    do
    {
      v384 = *(_DWORD *)(a4 + 520);
      if (v384 == -1)
        v385 = -1;
      else
        v385 = v384 + 1;
      *(_DWORD *)(a4 + 520) = v385;
      v386 = *(float *)(a4 + 20) * *(float *)(a4 + 24);
      *(float *)(a4 + 828) = v386;
      *(float *)(a4 + 832) = v386 / (float)((float)(v44 * v411) + 0.0001);
      a4 += 1724;
      --v380;
    }
    while (v380);
  }
  return v86;
}

BOOL acTrkObjectAgeComp(_DWORD *a1, _DWORD *a2)
{
  return a1[130] > a2[130];
}

BOOL acTrkObjectAgeCompReverse(_DWORD *a1, _DWORD *a2)
{
  return a1[130] < a2[130];
}

uint64_t AcTrkObjectGroupIdCount(uint64_t result, unsigned int a2, char *__b)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unsigned int v8;
  int *v9;
  _DWORD *v10;
  uint64_t v11;
  int v12;
  _DWORD *v13;
  int *v14;
  int v15;
  BOOL v16;
  int v17;

  if (a2)
  {
    v5 = result;
    v6 = a2;
    result = (uint64_t)memset(__b, 255, 4 * a2);
    v7 = 0;
    v8 = a2 - 1;
    v9 = (int *)(__b + 4);
    v10 = (_DWORD *)(v5 + 1728);
    do
    {
      v11 = v7 + 1;
      if (v7 + 1 < v6)
      {
        v12 = *(_DWORD *)(v5 + 1724 * v7 + 4);
        v13 = v10;
        v14 = v9;
        LODWORD(result) = v8;
        do
        {
          if (v12 == *v13)
          {
            v15 = *(_DWORD *)&__b[4 * v7];
            v16 = __CFADD__(v15, 1);
            v17 = v15 + 1;
            if (v16)
              v17 = 2;
            *(_DWORD *)&__b[4 * v7] = v17;
            *v14 = v17;
          }
          v13 += 431;
          ++v14;
          result = (result - 1);
        }
        while ((_DWORD)result);
      }
      --v8;
      ++v9;
      v10 += 431;
      ++v7;
    }
    while (v11 != v6);
  }
  return result;
}

unint64_t acTrkObjectRemoveOldOverlapObjects(uint64_t a1, unint64_t a2, int *a3, float a4)
{
  unint64_t v4;
  uint64_t v8;
  int v9;
  int *v10;
  _DWORD *v11;
  uint64_t v12;
  int v13;
  _DWORD *v14;
  int *v15;
  int v16;
  int v17;
  BOOL v18;
  int v19;
  unint64_t v20;
  _DWORD *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  int v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v37;
  float v38;
  float v39;
  BOOL v41;
  unint64_t v43;
  _DWORD *v44;

  v4 = a2;
  if ((_DWORD)a2)
  {
    bmHeapsort(a1, a2, 0x6BCuLL, (int (*)(uint64_t, uint64_t))acTrkObjectAgeComp);
    memset(a3, 255, 4 * v4);
    v8 = 0;
    v9 = v4 - 1;
    v10 = a3 + 1;
    v11 = (_DWORD *)(a1 + 1728);
    do
    {
      v12 = v8 + 1;
      if (v8 + 1 < (unint64_t)v4)
      {
        v13 = *(_DWORD *)(a1 + 1724 * v8 + 4);
        v14 = v11;
        v15 = v10;
        v16 = v9;
        do
        {
          if (v13 == *v14)
          {
            v17 = a3[v8];
            v18 = __CFADD__(v17, 1);
            v19 = v17 + 1;
            if (v18)
              v19 = 2;
            a3[v8] = v19;
            *v15 = v19;
          }
          v14 += 431;
          ++v15;
          --v16;
        }
        while (v16);
      }
      --v9;
      ++v10;
      v11 += 431;
      ++v8;
    }
    while (v12 != v4);
    v20 = 0;
    v21 = a3 + 1;
    v22 = a1 + 1724;
    v23 = -1;
    do
    {
      v43 = v20 + 1;
      v44 = v21;
      if (v20 + 1 >= v4)
      {
        v4 = v20 + 1;
      }
      else
      {
        v24 = a1 + 1724 * v20;
        v25 = v4 + v23;
        v4 = v20 + 1;
        v26 = v22;
        do
        {
          v27 = *(_DWORD *)(v24 + 8);
          if (v27 != *(_DWORD *)(v26 + 8))
            goto LABEL_34;
          v28 = *(float *)(v24 + 12);
          v29 = *(float *)(v24 + 16);
          v30 = *(float *)(v24 + 20);
          v31 = *(float *)(v24 + 24);
          v32 = v29 + v31;
          v33 = *(float *)(v26 + 12);
          v34 = *(float *)(v26 + 16);
          v35 = 0.0;
          if ((float)(v28 + v30) > v33 && v32 > v34)
          {
            v37 = *(float *)(v26 + 20);
            v38 = *(float *)(v26 + 24);
            v39 = v34 + v38;
            if ((float)(v33 + v37) > v28 && v39 > v29)
              v35 = (float)(fmaxf(fminf(v28 + v30, v33 + v37) - fmaxf(v28, v33), 0.0)
                          * fmaxf(fminf(v32, v39) - fmaxf(v29, v34), 0.0))
                  / fmaxf(fminf(v30 * v31, v37 * v38), 0.00001);
          }
          if (v35 <= a4 || ((v27 - 1) >= 2 ? (v41 = v27 == 4) : (v41 = 1), v41 || !v27 && *v21 == 2))
          {
LABEL_34:
            memcpy((void *)(a1 + 1724 * v4), (const void *)v26, 0x6BCuLL);
            v4 = (v4 + 1);
          }
          ++v21;
          v26 += 1724;
          --v25;
        }
        while (v25);
      }
      --v23;
      v21 = v44 + 1;
      v22 += 1724;
      v20 = v43;
    }
    while (v43 < v4);
  }
  return v4;
}

unint64_t acTrkFullBodyRemoveYoungOverlapObjects(uint64_t a1, unint64_t a2, float a3)
{
  unint64_t v3;
  unint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v21;
  float v22;
  float v23;
  unint64_t v26;

  v3 = a2;
  if ((_DWORD)a2)
  {
    bmHeapsort(a1, a2, 0x6BCuLL, (int (*)(uint64_t, uint64_t))acTrkObjectAgeComp);
    v6 = 0;
    v7 = a1 + 1724;
    v8 = -1;
    do
    {
      v26 = v6 + 1;
      if (v6 + 1 >= v3)
      {
        v3 = v6 + 1;
      }
      else
      {
        v9 = a1 + 1724 * v6;
        v10 = v3 + v8;
        v11 = v7;
        v3 = v6 + 1;
        do
        {
          if (*(_DWORD *)(v9 + 8) != *(_DWORD *)(v11 + 8))
            goto LABEL_7;
          v12 = *(float *)(v9 + 12);
          v13 = *(float *)(v9 + 16);
          v14 = *(float *)(v9 + 20);
          v15 = *(float *)(v9 + 24);
          v16 = v13 + v15;
          v17 = *(float *)(v11 + 12);
          v18 = *(float *)(v11 + 16);
          v19 = 0.0;
          if ((float)(v12 + v14) > v17 && v16 > v18)
          {
            v21 = *(float *)(v11 + 20);
            v22 = *(float *)(v11 + 24);
            v23 = v18 + v22;
            if ((float)(v17 + v21) > v12 && v23 > v13)
              v19 = (float)(fmaxf(fminf(v12 + v14, v17 + v21) - fmaxf(v12, v17), 0.0)
                          * fmaxf(fminf(v16, v23) - fmaxf(v13, v18), 0.0))
                  / fmaxf(fminf(v14 * v15, v21 * v22), 0.00001);
          }
          if (v19 <= a3 || *(_DWORD *)(v9 + 512))
          {
LABEL_7:
            memcpy((void *)(a1 + 1724 * v3), (const void *)v11, 0x6BCuLL);
            v3 = (v3 + 1);
          }
          v11 += 1724;
          --v10;
        }
        while (v10);
      }
      --v8;
      v7 += 1724;
      v6 = v26;
    }
    while (v26 < v3);
  }
  return v3;
}

unint64_t acTrkHandRemoveYoungOverlapObjects(uint64_t a1, unint64_t a2, unsigned int a3, unsigned int a4, float a5, float a6)
{
  unint64_t v6;
  unint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  int v15;
  uint64_t v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v26;
  float v27;
  float v28;
  float v30;
  int v31;
  unint64_t v33;

  v6 = a2;
  if ((_DWORD)a2)
  {
    bmHeapsort(a1, a2, 0x6BCuLL, (int (*)(uint64_t, uint64_t))acTrkObjectAgeCompReverse);
    v10 = 0;
    v11 = -1;
    v12 = a1;
    do
    {
      v33 = v10 + 1;
      if (v10 + 1 >= v6)
      {
        v6 = v10 + 1;
      }
      else
      {
        v13 = a1 + 1724 * v10;
        v14 = (int *)(v13 + 1720);
        v15 = v6 + v11;
        v16 = v12;
        v6 = v10 + 1;
        do
        {
          if (*(_DWORD *)(v13 + 8) == *(_DWORD *)(v16 + 1732))
            goto LABEL_24;
          v17 = *(float *)(v13 + 12);
          v18 = *(float *)(v13 + 16);
          v19 = *(float *)(v13 + 20);
          v20 = *(float *)(v13 + 24);
          v21 = v18 + v20;
          v22 = *(float *)(v16 + 1736);
          v23 = *(float *)(v16 + 1740);
          v24 = 0.0;
          if ((float)(v17 + v19) > v22 && v21 > v23)
          {
            v26 = *(float *)(v16 + 1744);
            v27 = *(float *)(v16 + 1748);
            v28 = v23 + v27;
            if ((float)(v22 + v26) > v17 && v28 > v18)
            {
              v30 = fmaxf(fminf(v17 + v19, v22 + v26) - fmaxf(v17, v22), 0.0)
                  * fmaxf(fminf(v21, v28) - fmaxf(v18, v23), 0.0);
              v24 = v30 / fmaxf((float)((float)(v19 * v20) + (float)(v26 * v27)) - v30, 0.00001);
            }
          }
          if (v24 <= a5 || *(_DWORD *)(v16 + 2244) > a3 || *v14 >= a4 || *(float *)(v16 + 2556) <= a6)
          {
LABEL_24:
            memcpy((void *)(a1 + 1724 * v6), (const void *)(v16 + 1724), 0x6BCuLL);
            v31 = 0;
            v6 = (v6 + 1);
          }
          else
          {
            v31 = *v14 + 1;
          }
          *v14 = v31;
          v16 += 1724;
          --v15;
        }
        while (v15);
      }
      --v11;
      v12 += 1724;
      v10 = v33;
    }
    while (v33 < v6);
  }
  return v6;
}

uint64_t acTrkObjectRemoveYoungOverlapObjects(uint64_t a1, uint64_t a2, char *a3, float a4)
{
  uint64_t v4;
  uint64_t v8;
  int v9;
  int *v10;
  _DWORD *v11;
  uint64_t v12;
  int v13;
  _DWORD *v14;
  int *v15;
  int v16;
  int v17;
  BOOL v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  int v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v36;
  float v38;
  float v39;
  BOOL v40;
  unint64_t v42;
  uint64_t v43;

  v4 = a2;
  if ((_DWORD)a2)
  {
    bmHeapsort(a1, a2, 0x6BCuLL, (int (*)(uint64_t, uint64_t))acTrkObjectAgeCompReverse);
    memset(a3, 255, 4 * v4);
    v8 = 0;
    v9 = v4 - 1;
    v10 = (int *)(a3 + 4);
    v11 = (_DWORD *)(a1 + 1728);
    do
    {
      v12 = v8 + 1;
      if (v8 + 1 < (unint64_t)v4)
      {
        v13 = *(_DWORD *)(a1 + 1724 * v8 + 4);
        v14 = v11;
        v15 = v10;
        v16 = v9;
        do
        {
          if (v13 == *v14)
          {
            v17 = *(_DWORD *)&a3[4 * v8];
            v18 = __CFADD__(v17, 1);
            v19 = v17 + 1;
            if (v18)
              v19 = 2;
            *(_DWORD *)&a3[4 * v8] = v19;
            *v15 = v19;
          }
          v14 += 431;
          ++v15;
          --v16;
        }
        while (v16);
      }
      --v9;
      ++v10;
      v11 += 431;
      ++v8;
    }
    while (v12 != v4);
    v20 = 0;
    v21 = a1 + 1724;
    v22 = -1;
    do
    {
      v42 = v20 + 1;
      v43 = v21;
      if (v20 + 1 >= (unint64_t)v4)
      {
        v4 = v20 + 1;
      }
      else
      {
        v23 = a1 + 1724 * v20;
        v24 = v4 + v22;
        v4 = v20 + 1;
        do
        {
          if (*(_DWORD *)(v21 + 8) | *(_DWORD *)(v23 + 8))
            goto LABEL_33;
          v25 = *(float *)(v23 + 12);
          v26 = *(float *)(v23 + 16);
          v27 = *(float *)(v23 + 20);
          v28 = *(float *)(v23 + 24);
          v29 = v26 + v28;
          v30 = *(float *)(v21 + 12);
          v31 = *(float *)(v21 + 16);
          v32 = *(float *)(v21 + 20);
          v33 = *(float *)(v21 + 24);
          v34 = 0.0;
          if ((float)(v25 + v27) > v30 && v29 > v31)
          {
            v36 = v31 + v33;
            if ((float)(v30 + v32) > v25 && v36 > v26)
              v34 = (float)(fmaxf(fminf(v25 + v27, v30 + v32) - fmaxf(v25, v30), 0.0)
                          * fmaxf(fminf(v29, v36) - fmaxf(v26, v31), 0.0))
                  / fmaxf(fminf(v27 * v28, v32 * v33), 0.00001);
          }
          if (v34 <= a4
            || ((v38 = v33 * v32, v39 = v28 * v27, *(_DWORD *)&a3[4 * v20] == 2) ? (v40 = v38 < v39) : (v40 = 0), !v40))
          {
LABEL_33:
            memcpy((void *)(a1 + 1724 * v4), (const void *)v21, 0x6BCuLL);
            v4 = (v4 + 1);
          }
          v21 += 1724;
          --v24;
        }
        while (v24);
      }
      --v22;
      v21 = v43 + 1724;
      ++v20;
    }
    while (v42 < v4);
  }
  return v4;
}

unint64_t acTrkObjectRemoveOldCrossClassOverlapObjects(uint64_t a1, unint64_t a2, float a3)
{
  unint64_t v3;
  unint64_t v6;
  uint64_t v7;
  int v8;
  unint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v22;
  float v23;
  float v24;
  float v26;
  int v27;
  int v28;
  BOOL v29;
  BOOL v30;
  BOOL v31;

  v3 = a2;
  if ((_DWORD)a2)
  {
    bmHeapsort(a1, a2, 0x6BCuLL, (int (*)(uint64_t, uint64_t))acTrkObjectAgeComp);
    v6 = 0;
    v7 = a1 + 1724;
    v8 = -1;
    do
    {
      v9 = v6 + 1;
      if (v6 + 1 >= v3)
      {
        v3 = v6 + 1;
      }
      else
      {
        v10 = a1 + 1724 * v6;
        v11 = v3 + v8;
        v12 = v7;
        v3 = v6 + 1;
        do
        {
          v13 = *(float *)(v10 + 12);
          v14 = *(float *)(v10 + 16);
          v15 = *(float *)(v10 + 20);
          v16 = *(float *)(v10 + 24);
          v17 = v14 + v16;
          v18 = *(float *)(v12 + 12);
          v19 = *(float *)(v12 + 16);
          v20 = 0.0;
          if ((float)(v13 + v15) > v18 && v17 > v19)
          {
            v22 = *(float *)(v12 + 20);
            v23 = *(float *)(v12 + 24);
            v24 = v19 + v23;
            if ((float)(v18 + v22) > v13 && v24 > v14)
            {
              v26 = fmaxf(fminf(v13 + v15, v18 + v22) - fmaxf(v13, v18), 0.0)
                  * fmaxf(fminf(v17, v24) - fmaxf(v14, v19), 0.0);
              v20 = v26 / fmaxf((float)((float)(v15 * v16) + (float)(v22 * v23)) - v26, 0.00001);
            }
          }
          if (v20 <= a3
            || (v27 = *(_DWORD *)(v10 + 8), v27 == 1)
            || ((v28 = *(_DWORD *)(v12 + 8), v28 != 4) ? (v29 = v27 == 4) : (v29 = 1),
                !v29 ? (v30 = v27 == 2) : (v30 = 1),
                !v30 ? (v31 = (v28 - 1) > 1) : (v31 = 0),
                !v31))
          {
            memcpy((void *)(a1 + 1724 * v3), (const void *)v12, 0x6BCuLL);
            v3 = (v3 + 1);
          }
          v12 += 1724;
          --v11;
        }
        while (v11);
      }
      --v8;
      v7 += 1724;
      v6 = v9;
    }
    while (v9 < v3);
  }
  return v3;
}

float *mapBoxCenterToFeatMap(float *result, uint64_t *a2, int a3, unsigned int a4, unsigned int a5, int *a6)
{
  int v6;
  unsigned int v7;
  unsigned int v8;
  float v9;
  unsigned int v10;
  float v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  int v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  int v21;
  float v22;

  v6 = *((_DWORD *)a2 + 3);
  v7 = *((_DWORD *)a2 + 2) / 0xCu;
  v8 = (float)((float)((float)((float)((float)(8 * v6) / (float)a5)
                                           * (float)(*result + (float)(result[2] * 0.5)))
                                   + -4.0)
                           * 0.125);
  if (v8 >= v6 - 1)
    v8 = v6 - 1;
  v9 = (float)v8;
  v10 = (float)((float)((float)((float)((float)(8 * v7) / (float)a4)
                                            * (float)(result[1] + (float)(result[3] * 0.5)))
                                    + -4.0)
                            * 0.125);
  if (v10 >= v7 - 1)
    v10 = v7 - 1;
  v11 = (float)v10;
  v12 = *a2;
  v13 = v9 + (v11 + v7 * a3) * v6;
  if (*((_DWORD *)a2 + 5) != 7)
  {
    *a6 = *(_DWORD *)(v12 + 4 * v13);
    return result;
  }
  v14 = *(__int16 *)(v12 + 2 * v13);
  v15 = v14 & 0x80000000;
  v16 = (v14 >> 10) & 0x1F;
  v17 = (unsigned __int16)v14 << 13;
  v18 = v17 & 0x7FE000;
  if (v16 == 31)
  {
    if (v18)
      v21 = 2143289344;
    else
      v21 = 2139095040;
    v20 = v15 | v17 | v21;
    goto LABEL_16;
  }
  if (v16)
  {
LABEL_10:
    v20 = ((v18 | (v16 << 23)) + 939524096) | v15;
LABEL_16:
    *a6 = v20;
    return result;
  }
  if (v18)
  {
    v19 = __clz(v18);
    v16 = 9 - v19;
    v18 = (v17 << (v19 - 8)) & 0x7FE000;
    goto LABEL_10;
  }
  v22 = -0.0;
  if (!v15)
    v22 = 0.0;
  *(float *)a6 = v22;
  return result;
}

uint64_t largeFaceSuppressSameSizeUBody(uint64_t result, int a2, int a3, int a4, uint64_t a5, int *a6)
{
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  float32x2_t *v12;
  float32x2_t v13;
  uint64_t v14;
  float32x2_t v15;
  float32x2_t v16;
  float32x2_t v17;
  float32x2_t v18;
  float32x2_t v19;
  float32x2_t v20;
  float v21;
  uint64_t i;
  uint64_t v25;
  int *v26;
  int v27;

  if (a2)
  {
    v6 = 0;
    v7 = 0;
    v8 = result;
    do
    {
      if (!*(_DWORD *)(v8 + 8)
        && *(_BYTE *)(v8 + 100)
        && (float)((float)(*(float *)(v8 + 20) * *(float *)(v8 + 24)) / (float)((float)(a4 * a3) + 0.0001)) > 0.1
        && *(float *)(v8 + 524) > 0.7)
      {
        *(_DWORD *)(a5 + 4 * v7++) = v6;
      }
      ++v6;
      v8 += 1724;
    }
    while (a2 != v6);
    if (v7)
    {
      v9 = 0;
      v10 = 0;
      do
      {
        v11 = 0;
        v12 = (float32x2_t *)(result + 12);
        do
        {
          if (v12[-1].i32[1] == 1)
          {
            v13 = vadd_f32(*v12, v12[1]);
            v14 = result + 1724 * *(unsigned int *)(a5 + 4 * v9);
            v15 = *(float32x2_t *)(v14 + 12);
            v16 = vadd_f32(v15, *(float32x2_t *)(v14 + 20));
            v17 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v16, v13), (int8x8_t)v13, (int8x8_t)v16), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v15, *v12), (int8x8_t)v15, (int8x8_t)*v12)), 0);
            v18 = vmul_lane_f32(v17, v17, 1);
            v19 = vmul_f32(vmaxnm_f32(vsub_f32((float32x2_t)vzip1_s32((int32x2_t)v13, (int32x2_t)v16), (float32x2_t)vzip1_s32((int32x2_t)*v12, (int32x2_t)v15)), 0), vmaxnm_f32(vsub_f32((float32x2_t)vzip2_s32((int32x2_t)v13, (int32x2_t)v16), (float32x2_t)vzip2_s32((int32x2_t)*v12, (int32x2_t)v15)), 0));
            v20 = vsub_f32(vadd_f32(v19, (float32x2_t)vdup_lane_s32((int32x2_t)v19, 1)), v18);
            LODWORD(v21) = vdiv_f32(v18, v20).u32[0];
            if (v18.f32[0] >= 0.00000011921 && v20.f32[0] >= 0.00000011921 && v21 > 0.7)
              a6[v10++] = v11;
          }
          ++v11;
          v12 = (float32x2_t *)((char *)v12 + 1724);
        }
        while (a2 != v11);
        ++v9;
      }
      while (v9 != v7);
      if (v10)
      {
        for (i = 0; i != a2; ++i)
        {
          v25 = v10;
          v26 = a6;
          while (1)
          {
            v27 = *v26++;
            if (i == v27)
              break;
            if (!--v25)
              goto LABEL_26;
          }
          *(_DWORD *)(result + 1724 * i + 528) = 2;
LABEL_26:
          ;
        }
      }
    }
  }
  return result;
}

float *acTrkFilterMultiUbodyinSameFbody(float *result, unsigned int *a2, uint64_t a3, unsigned int a4, float *a5, _DWORD *a6, _DWORD *a7, uint64_t a8)
{
  float *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  float32x2_t *v12;
  unsigned int v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  float *v19;
  uint64_t v20;
  float32x2_t v21;
  float32x2_t v22;
  float32x2_t v23;
  int32x2_t v24;
  float v25;
  float v26;
  int v27;
  float v28;
  float32x2_t *v29;
  float32x2_t v30;
  float32x2_t v31;
  float32x2_t v32;
  float v33;
  float v34;
  float32x2_t v35;
  float v36;
  float32x2_t v37;
  float32x2_t v38;
  float32x2_t v39;
  float v40;
  BOOL v41;
  float v42;
  float v43;
  uint64_t v44;
  uint64_t v45;
  int *v46;
  int v47;
  unsigned int v48;
  unint64_t v49;
  unsigned int v50;
  char v51;
  float *v52;
  float *v53;
  float32x2_t v54;
  float32x2_t v55;
  float32x2_t v56;
  float32x2_t v57;
  __int32 v58;
  float v59;
  float32x2_t v60;
  float32x2_t v61;
  float32x2_t v62;
  BOOL v63;
  float v64;
  uint64_t v65;
  float v66;
  int v67;
  float32x2_t *v68;
  float32x2_t v69;
  float32x2_t v70;
  float32x2_t v71;
  float v72;
  float v73;
  float32x2_t v74;
  float v75;
  unint64_t v76;
  unint64_t v77;
  uint64_t v78;
  int v79;
  int64x2_t v80;
  int32x4_t v81;
  uint64_t v82;
  uint64_t v83;
  int32x4_t v84;
  __int128 v85;
  int64x2_t v86;
  int64x2_t v87;
  int64x2_t v88;
  int64x2_t v89;
  uint64_t v90;
  int *v91;
  int v92;
  unsigned int v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  float *v97;
  _DWORD *v98;
  _DWORD *v99;
  uint64_t v100;

  *a7 = 0;
  if (a4)
  {
    v8 = result;
    v9 = 0;
    v10 = a4;
    v11 = *a2;
    v12 = (float32x2_t *)(a3 + 20);
    v99 = a7;
    v100 = a8 + 16;
    v13 = *a2;
    v97 = a5;
    v98 = a6;
    v96 = a3;
    do
    {
      if (v13)
      {
        v14 = 0;
        v15 = 0;
        v16 = a3 + 1724 * v9;
        v17 = -1;
        do
        {
          v19 = &v8[431 * v14];
          if (*((_DWORD *)v19 + 2) == 1)
          {
            v20 = 0;
            v21 = *(float32x2_t *)(v19 + 3);
            v22 = vadd_f32(v21, *(float32x2_t *)(v19 + 5));
            v23 = vsub_f32(v22, v21);
            v24 = vcgtz_f32(v23);
            v25 = v23.f32[1];
            if ((v24.i8[4] & 1) == 0)
              v25 = 0.0;
            if ((v24.i8[0] & 1) == 0)
              v23.f32[0] = 0.0;
            v26 = v23.f32[0] * v25;
            v27 = -1;
            v28 = -1.0;
            v29 = v12;
            do
            {
              v30 = v29[-1];
              v31 = vadd_f32(v30, *v29);
              v32 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v31, v22), (int8x8_t)v22, (int8x8_t)v31), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v30, v21), (int8x8_t)v30, (int8x8_t)v21)), 0);
              v33 = vmul_lane_f32(v32, v32, 1).f32[0];
              v34 = 0.0;
              if (v33 >= 0.00000011921)
              {
                v35 = vsub_f32(v31, v30);
                v35.f32[0] = (float)(v26 + (float)(fmaxf(v35.f32[0], 0.0) * fmaxf(v35.f32[1], 0.0))) - v33;
                v36 = v33 / v35.f32[0];
                if (v35.f32[0] >= 0.00000011921)
                  v34 = v36;
                else
                  v34 = 0.0;
              }
              if (v34 > v28)
              {
                v27 = v20;
                v28 = v34;
              }
              ++v20;
              v29 = (float32x2_t *)((char *)v29 + 1724);
            }
            while (v10 != v20);
            if (v9 == v27)
            {
              v37 = *(float32x2_t *)(v16 + 12);
              v38 = vadd_f32(v37, *(float32x2_t *)(v16 + 20));
              v39 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v38, v22), (int8x8_t)v22, (int8x8_t)v38), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v37, v21), (int8x8_t)v37, (int8x8_t)v21)), 0);
              v40 = vmul_lane_f32(v39, v39, 1).f32[0];
              v41 = v40 < 0.00000011921 || v26 < 0.00000011921;
              v42 = v40 / v26;
              if (v41)
                v42 = 0.0;
              if (v42 > *a5 && LODWORD(v8[431 * v14 + 130]) >= 2)
              {
                v43 = v8[431 * v14 + 208];
                if (v43 < 0.5)
                  v17 = v14;
                v15 |= v43 < 0.5;
                if (*((_DWORD *)v19 + 7) >= 2u)
                {
                  v44 = *a7;
                  v45 = v44;
                  v46 = a6;
                  if ((_DWORD)v44)
                  {
                    while (1)
                    {
                      v47 = *v46++;
                      if (v9 == v47)
                        break;
                      if (!--v45)
                      {
                        v18 = *a7;
                        goto LABEL_8;
                      }
                    }
                  }
                  else
                  {
                    v18 = 0;
LABEL_8:
                    *a7 = v44 + 1;
                    a6[v18] = v9;
                    v11 = *a2;
                  }
                }
              }
            }
          }
          ++v14;
        }
        while (v14 < v11);
        if ((v15 & 1) != 0)
        {
          v48 = v17;
          if (v11)
          {
            v49 = 0;
            v50 = 0;
            v51 = 0;
            v52 = &v8[431 * v48 + 211];
            do
            {
              v53 = &v8[431 * v49];
              if (*((_DWORD *)v53 + 2) == 1)
              {
                v54 = *(float32x2_t *)(v53 + 3);
                v55 = vadd_f32(v54, *(float32x2_t *)(v53 + 5));
                v56 = *(float32x2_t *)(v16 + 12);
                v57 = vadd_f32(v56, *(float32x2_t *)(v16 + 20));
                if ((vcgt_f32(v56, v54).u8[0] & 1) != 0)
                  v58 = *(_QWORD *)(v16 + 12);
                else
                  v58 = *(_QWORD *)(v53 + 3);
                v56.i32[0] = HIDWORD(*(_QWORD *)(v16 + 12));
                if (COERCE_FLOAT(HIDWORD(*(_QWORD *)(v53 + 3))) >= v56.f32[1])
                  v56.i32[0] = HIDWORD(*(_QWORD *)(v53 + 3));
                if ((vcgt_f32(v57, v55).u8[0] & 1) != 0)
                  v59 = v55.f32[0];
                else
                  v59 = v57.f32[0];
                v57.i32[0] = v57.i32[1];
                if (v55.f32[1] < v57.f32[1])
                  v57.f32[0] = v55.f32[1];
                v60 = (float32x2_t)vdup_lane_s32((int32x2_t)v55, 0);
                v60.f32[0] = v59;
                v61 = (float32x2_t)vdup_lane_s32((int32x2_t)v54, 0);
                v61.i32[0] = v58;
                v62 = vmul_f32(vmaxnm_f32(vsub_f32(v60, v61), 0), vmaxnm_f32(vsub_f32((float32x2_t)__PAIR64__(v55.u32[1], v57.u32[0]), (float32x2_t)__PAIR64__(v54.u32[1], v56.u32[0])), 0));
                v63 = v62.f32[0] < 0.00000011921 || v62.f32[1] < 0.00000011921;
                v64 = v62.f32[0] / v62.f32[1];
                if (v63)
                  v64 = 0.0;
                if (v64 > a5[1] && LODWORD(v8[431 * v49 + 130]) == 1 && *(_DWORD *)v52 <= 4u)
                {
                  v65 = 0;
                  v66 = -1.0;
                  v67 = -1;
                  v68 = v12;
                  do
                  {
                    v69 = v68[-1];
                    v70 = vadd_f32(v69, *v68);
                    v71 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v70, v55), (int8x8_t)v55, (int8x8_t)v70), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v69, v54), (int8x8_t)v69, (int8x8_t)v54)), 0);
                    v72 = vmul_lane_f32(v71, v71, 1).f32[0];
                    v73 = 0.0;
                    if (v72 >= 0.00000011921)
                    {
                      v74 = vsub_f32(v70, v69);
                      v74.f32[0] = (float)(v62.f32[1] + (float)(fmaxf(v74.f32[0], 0.0) * fmaxf(v74.f32[1], 0.0))) - v72;
                      v75 = v72 / v74.f32[0];
                      if (v74.f32[0] >= 0.00000011921)
                        v73 = v75;
                      else
                        v73 = 0.0;
                    }
                    if (v73 > v66)
                    {
                      v67 = v65;
                      v66 = v73;
                    }
                    ++v65;
                    v68 = (float32x2_t *)((char *)v68 + 1724);
                  }
                  while (v10 != v65);
                  if (v9 == v67)
                  {
                    *(_DWORD *)(a8 + 4 * v50++) = v49;
                    v11 = *a2;
                    v51 = 1;
                  }
                }
              }
              ++v49;
            }
            while (v49 < v11);
            if ((v51 & 1) != 0)
            {
              ++*(_DWORD *)v52;
              goto LABEL_75;
            }
          }
          else
          {
            v50 = 0;
          }
          v8[431 * v48 + 211] = 0.0;
LABEL_75:
          v76 = *a2;
          if ((_DWORD)v76)
          {
            if (v50)
            {
              v77 = 0;
              v11 = 0;
              while (v50 > 7)
              {
                v80 = vdupq_n_s64(v77);
                v81 = 0uLL;
                v82 = v100;
                v83 = v50 & 0xFFFFFFF8;
                v84 = 0uLL;
                do
                {
                  v85 = *(_OWORD *)(v82 - 16);
                  v86.i64[0] = v85;
                  v86.i64[1] = DWORD1(v85);
                  v87 = v86;
                  v86.i64[0] = DWORD2(v85);
                  v86.i64[1] = HIDWORD(v85);
                  v88 = v86;
                  v86.i64[0] = *(_OWORD *)v82;
                  v86.i64[1] = HIDWORD(*(_QWORD *)v82);
                  v89 = v86;
                  v86.i64[0] = *(_QWORD *)(v82 + 8);
                  v86.i64[1] = HIDWORD(*(_OWORD *)v82);
                  v81 = vsubq_s32(v81, (int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v80, v87), (int32x4_t)vceqq_s64(v80, v88))));
                  v84 = vsubq_s32(v84, (int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v80, v89), (int32x4_t)vceqq_s64(v80, v86))));
                  v82 += 32;
                  v83 -= 8;
                }
                while (v83);
                v79 = vaddvq_s32(vaddq_s32(v84, v81));
                v78 = v50 & 0xFFFFFFF8;
                if (v78 != v50)
                  goto LABEL_84;
LABEL_88:
                if (v79 == v50)
                {
                  v93 = v11 + 1;
                  result = (float *)memcpy(&v8[431 * v11], &v8[431 * v77], 0x6BCuLL);
                  v76 = *a2;
                  v11 = v93;
                }
                if (++v77 >= v76)
                  goto LABEL_97;
              }
              v78 = 0;
              v79 = 0;
LABEL_84:
              v90 = v50 - v78;
              v91 = (int *)(a8 + 4 * v78);
              do
              {
                v92 = *v91++;
                if (v77 != v92)
                  ++v79;
                --v90;
              }
              while (v90);
              goto LABEL_88;
            }
            if (v76 >= 2)
            {
              v94 = v76 & 0xFFFFFFFE;
              if (v94 != v76)
                goto LABEL_94;
            }
            else
            {
              v94 = 0;
LABEL_94:
              v95 = v94 | 1;
              if (v95 > v76)
                LODWORD(v76) = v95;
            }
            v11 = v76;
          }
          else
          {
            v11 = 0;
          }
LABEL_97:
          *a2 = v11;
          v13 = v11;
          a6 = v98;
          a7 = v99;
          a3 = v96;
          a5 = v97;
          goto LABEL_4;
        }
        v13 = v11;
      }
LABEL_4:
      ++v9;
    }
    while (v9 != v10);
  }
  return result;
}

uint64_t acTrkFilterFPHandinSameFbody(uint64_t a1, unsigned int a2, int a3, unsigned int a4, char *__src, float a6, unsigned int a7)
{
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  int *v11;
  uint64_t v12;
  int v13;
  unsigned int v14;
  uint64_t v15;
  float v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  float v20;
  int v21;
  float v22;
  float v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  int64x2_t v33;
  int64x2_t v34;
  int64x2_t v35;
  int64x2_t v36;
  int64x2_t v37;
  _DWORD *v38;
  uint64_t v39;
  int32x2_t v40;
  int64x2_t v41;
  int32x2_t v42;
  uint64_t v43;
  int *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v8 = a7;
  if (a2)
  {
    v9 = 0;
    v10 = 0;
    v11 = (int *)(a1 + 8);
    v12 = a2;
    do
    {
      v13 = *v11;
      v11 += 431;
      if (v13 == 1)
        v14 = v10 + 1;
      else
        v14 = v10;
      if (v13)
        v10 = v14;
      else
        ++v9;
      --v12;
    }
    while (v12);
    if (a4 > 1)
      return a7;
  }
  else
  {
    v10 = 0;
    v9 = 0;
    if (a4 > 1)
      return a7;
  }
  if (v10 > 1 || v9 >= 2 || !a7 || v9 + v10 == -a4)
    return a7;
  v15 = 0;
  v16 = -1.0;
  LODWORD(v17) = -1;
  v18 = __src;
  LODWORD(v19) = -1;
  v20 = -1.0;
  do
  {
    v21 = *((_DWORD *)v18 + 2);
    if (v21 == 11)
    {
      if (*((float *)v18 + 131) > v16)
      {
        v16 = *((float *)v18 + 131);
        LODWORD(v17) = v15;
      }
    }
    else if (v21 == 10 && *((float *)v18 + 131) > v20)
    {
      v20 = *((float *)v18 + 131);
      LODWORD(v19) = v15;
    }
    ++v15;
    v18 += 1724;
  }
  while (a7 != v15);
  if ((int)(v19 & v17) < 0 != __OFSUB__(a7, v15))
    return a7;
  v22 = v16 - a6;
  if ((v19 & 0x80000000) == 0)
  {
    v23 = v20 - a6;
    v24 = a7;
    v25 = __src;
    v19 = v19;
    v26 = v17;
    while (1)
    {
      if (!v19 || !v26)
        goto LABEL_29;
      v27 = *((_DWORD *)v25 + 2);
      if (v27 == 10)
      {
        if (*((float *)v25 + 131) > v23)
          goto LABEL_29;
      }
      else if ((v17 & 0x80000000) == 0 && v27 == 11 && *((float *)v25 + 131) > v22)
      {
        goto LABEL_29;
      }
      *((_DWORD *)v25 + 132) = 2;
LABEL_29:
      v25 += 1724;
      --v26;
      --v19;
      if (!--v24)
        goto LABEL_63;
    }
  }
  if ((v17 & 0x80000000) != 0)
  {
    if (a7 > 3)
    {
      v32 = a7 & 0xFFFFFFFC;
      v33 = vdupq_n_s64(v19);
      v34 = (int64x2_t)xmmword_2359168F0;
      v35 = vdupq_n_s64(v17);
      v36 = vdupq_n_s64(2uLL);
      v37 = vdupq_n_s64(4uLL);
      v38 = __src;
      v39 = v32;
      do
      {
        v40 = vmovn_s64((int64x2_t)vbicq_s8(vmvnq_s8((int8x16_t)vceqq_s64(v34, v33)), (int8x16_t)vceqq_s64(v34, v35)));
        if ((v40.i8[0] & 1) != 0)
          v38[132] = 2;
        if ((v40.i8[4] & 1) != 0)
          v38[563] = 2;
        v41 = vaddq_s64(v34, v36);
        v42 = vmovn_s64((int64x2_t)vbicq_s8(vmvnq_s8((int8x16_t)vceqq_s64(v41, v33)), (int8x16_t)vceqq_s64(v41, v35)));
        if ((v42.i8[0] & 1) != 0)
          v38[994] = 2;
        if ((v42.i8[4] & 1) != 0)
          v38[1425] = 2;
        v34 = vaddq_s64(v34, v37);
        v38 += 1724;
        v39 -= 4;
      }
      while (v39);
      if (v32 == a7)
        goto LABEL_63;
    }
    else
    {
      v32 = 0;
    }
    v45 = &__src[1724 * v32 + 528];
    v46 = a7 - v32;
    v47 = v17 - v32;
    v48 = v19 - v32;
    do
    {
      if (v48 && v47)
        *(_DWORD *)v45 = 2;
      v45 += 1724;
      --v47;
      --v48;
      --v46;
    }
    while (v46);
  }
  else
  {
    v30 = a7;
    v31 = __src;
    v19 = v19;
    v17 = v17;
    do
    {
      if (v19 && v17 && (*((_DWORD *)v31 + 2) != 11 || *((float *)v31 + 131) <= v22))
        *((_DWORD *)v31 + 132) = 2;
      v31 += 1724;
      --v17;
      --v19;
      --v30;
    }
    while (v30);
  }
LABEL_63:
  v43 = 0;
  v28 = 0;
  v44 = (int *)__src;
  do
  {
    if (v44[132] <= 1)
    {
      if (v43 != v28)
        memcpy(&__src[1724 * v28], v44, 0x6BCuLL);
      v28 = (v28 + 1);
    }
    v44 += 431;
    ++v43;
  }
  while (v8 != v43);
  return v28;
}

float l2Norm(const float *a1, unsigned int a2)
{
  uint64_t v2;
  float v3;
  float *v5;
  uint64_t v6;
  uint64_t v7;
  float *v8;
  float v9;

  if (!a2)
    return sqrtf(0.0);
  if (a2 == 1)
  {
    v2 = 0;
    v3 = 0.0;
  }
  else
  {
    v2 = a2 & 0xFFFFFFFE;
    v5 = (float *)(a1 + 1);
    v3 = 0.0;
    v6 = v2;
    do
    {
      v3 = (float)(v3 + (float)(*(v5 - 1) * *(v5 - 1))) + (float)(*v5 * *v5);
      v5 += 2;
      v6 -= 2;
    }
    while (v6);
    if (v2 == a2)
      return sqrtf(v3);
  }
  v7 = a2 - v2;
  v8 = (float *)&a1[v2];
  do
  {
    v9 = *v8++;
    v3 = v3 + (float)(v9 * v9);
    --v7;
  }
  while (v7);
  return sqrtf(v3);
}

float32x4_t *updateEmbeddedFeat(float32x4_t *result, float32x4_t *a2, unsigned int a3, double a4)
{
  uint64_t v4;
  float v5;
  float *v6;
  uint64_t v7;
  uint64_t v8;
  float *v9;
  float v10;
  float v11;
  uint64_t v12;
  float v13;
  float *v14;
  uint64_t v15;
  uint64_t v16;
  float *v17;
  float v18;
  uint64_t v19;
  float32x4_t v20;
  float *f32;
  float32x4_t *v22;
  uint64_t v23;
  float32x4_t v24;
  uint64_t v25;
  uint64_t v26;
  float *v27;
  float *v28;
  float v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  float *v33;
  float *v34;
  float v35;
  uint64_t v36;
  float v37;
  float *v38;
  uint64_t v39;
  uint64_t v40;
  float *v41;
  float v42;
  uint64_t v43;
  float32x4_t v44;
  float32x4_t *v45;
  uint64_t v46;
  float32x4_t v47;
  uint64_t v48;
  float *v49;
  float32x4_t v50;
  float32x4_t *v51;
  float32x4_t *v52;
  float32x4_t v53;
  float32x4_t v54;
  uint64_t v55;
  float32x4_t v56;

  if (!a3)
    return result;
  if (a3 == 1)
  {
    v4 = 0;
    v5 = 0.0;
LABEL_7:
    v8 = a3 - v4;
    v9 = &result->f32[v4];
    do
    {
      v10 = *v9++;
      v5 = v5 + (float)(v10 * v10);
      --v8;
    }
    while (v8);
    goto LABEL_9;
  }
  v4 = a3 & 0xFFFFFFFE;
  v6 = &result->f32[1];
  v5 = 0.0;
  v7 = v4;
  do
  {
    v5 = (float)(v5 + (float)(*(v6 - 1) * *(v6 - 1))) + (float)(*v6 * *v6);
    v6 += 2;
    v7 -= 2;
  }
  while (v7);
  if (v4 != a3)
    goto LABEL_7;
LABEL_9:
  v11 = sqrtf(v5);
  if (a3 <= 1)
  {
    v12 = 0;
    v13 = 0.0;
LABEL_14:
    v16 = a3 - v12;
    v17 = &a2->f32[v12];
    do
    {
      v18 = *v17++;
      v13 = v13 + v18;
      --v16;
    }
    while (v16);
    goto LABEL_16;
  }
  v12 = a3 & 0xFFFFFFFE;
  v14 = &a2->f32[1];
  v13 = 0.0;
  v15 = v12;
  do
  {
    v13 = (float)(v13 + *(v14 - 1)) + *v14;
    v14 += 2;
    v15 -= 2;
  }
  while (v15);
  if (v12 != a3)
    goto LABEL_14;
LABEL_16:
  *(float *)&a4 = v11 + 0.0000001;
  if (fabsf(v13) >= 0.0001)
  {
    if (a3 > 7 && ((float32x4_t *)&result->f32[a3] <= a2 || (float32x4_t *)&a2->f32[a3] <= result))
    {
      v30 = a3 & 0xFFFFFFF8;
      v50 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a4, 0);
      v51 = result + 1;
      v52 = a2 + 1;
      v53 = (float32x4_t)vdupq_n_s32(0x3E4CCCCCu);
      v54 = (float32x4_t)vdupq_n_s32(0x3F4CCCCDu);
      v55 = v30;
      do
      {
        v56 = vmlaq_f32(vdivq_f32(vmulq_f32(*v51, v53), v50), v54, *v52);
        v52[-1] = vmlaq_f32(vdivq_f32(vmulq_f32(v51[-1], v53), v50), v54, v52[-1]);
        *v52 = v56;
        v51 += 2;
        v52 += 2;
        v55 -= 8;
      }
      while (v55);
      if (v30 == a3)
        goto LABEL_31;
    }
    else
    {
      v30 = 0;
    }
    v31 = a3 - v30;
    v32 = v30;
    v33 = &result->f32[v30];
    v34 = &a2->f32[v32];
    do
    {
      v35 = *v33++;
      *v34 = (float)((float)(v35 * 0.2) / *(float *)&a4) + (float)(*v34 * 0.8);
      ++v34;
      --v31;
    }
    while (v31);
    goto LABEL_31;
  }
  v19 = 0;
  if (a3 < 8)
    goto LABEL_22;
  if ((unint64_t)((char *)a2 - (char *)result) < 0x20)
    goto LABEL_22;
  v19 = a3 & 0xFFFFFFF8;
  v20 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a4, 0);
  f32 = a2[1].f32;
  v22 = result + 1;
  v23 = v19;
  do
  {
    v24 = vdivq_f32(*v22, v20);
    *((float32x4_t *)f32 - 1) = vdivq_f32(v22[-1], v20);
    *(float32x4_t *)f32 = v24;
    f32 += 8;
    v22 += 2;
    v23 -= 8;
  }
  while (v23);
  if (v19 != a3)
  {
LABEL_22:
    v25 = a3 - v19;
    v26 = v19;
    v27 = &a2->f32[v19];
    v28 = &result->f32[v26];
    do
    {
      v29 = *v28++;
      *v27++ = v29 / *(float *)&a4;
      --v25;
    }
    while (v25);
  }
LABEL_31:
  if (a3 >= 2)
  {
    v36 = a3 & 0xFFFFFFFE;
    v38 = &a2->f32[1];
    v37 = 0.0;
    v39 = v36;
    do
    {
      v37 = (float)(v37 + (float)(*(v38 - 1) * *(v38 - 1))) + (float)(*v38 * *v38);
      v38 += 2;
      v39 -= 2;
    }
    while (v39);
    if (v36 == a3)
      goto LABEL_38;
  }
  else
  {
    v36 = 0;
    v37 = 0.0;
  }
  v40 = a3 - v36;
  v41 = &a2->f32[v36];
  do
  {
    v42 = *v41++;
    v37 = v37 + (float)(v42 * v42);
    --v40;
  }
  while (v40);
LABEL_38:
  *(float *)&a4 = sqrtf(v37) + 0.00001;
  if (a3 <= 7)
  {
    v43 = 0;
LABEL_43:
    v48 = a3 - v43;
    v49 = &a2->f32[v43];
    do
    {
      *v49 = *v49 / *(float *)&a4;
      ++v49;
      --v48;
    }
    while (v48);
    return result;
  }
  v43 = a3 & 0xFFFFFFF8;
  v44 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a4, 0);
  v45 = a2 + 1;
  v46 = v43;
  do
  {
    v47 = vdivq_f32(*v45, v44);
    v45[-1] = vdivq_f32(v45[-1], v44);
    *v45 = v47;
    v45 += 2;
    v46 -= 8;
  }
  while (v46);
  if (v43 != a3)
    goto LABEL_43;
  return result;
}

void acLGroupIDDominanPersonPatch(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6)
{
  int v6;
  int v7;
  BOOL v8;
  int v9;
  BOOL v10;
  int v11;
  float v12;
  _BOOL4 v13;
  uint64_t v14;
  unsigned int v15;
  float32x2_t v16;
  int32x2_t v17;
  float32x2_t v18;
  int32x2_t v19;
  float32x2_t v20;
  float32x2_t v21;
  float32x2_t v22;
  float32x2_t v23;
  float32x2_t v24;
  float32x2_t *v25;
  float v26;
  int8x8_t v27;
  float32x2_t v28;
  int32x2_t v29;
  float32x2_t v30;
  float32x2_t v31;
  float32x2_t v32;
  float32x2_t v33;
  float32x2_t v34;
  float v35;
  uint64_t v36;

  if (a6 == 2)
  {
    v6 = *(_DWORD *)(a5 + 8);
    v7 = *(_DWORD *)(a5 + 1732);
    v8 = v6 == 10 && v7 == 11;
    v9 = v8;
    v10 = v6 == 11 && v7 == 10;
    v11 = v10 ? 1 : v9;
    v12 = *(float *)(a5 + 832) / (float)(*(float *)(a5 + 2556) + 0.00001);
    v13 = v12 >= 1.7 || v12 <= 0.58;
    if (a4)
    {
      v14 = 0;
      v15 = 0;
      v16 = *(float32x2_t *)(a5 + 12);
      v17 = (int32x2_t)vadd_f32(v16, *(float32x2_t *)(a5 + 20));
      v18 = *(float32x2_t *)(a5 + 1736);
      v19 = (int32x2_t)vadd_f32(v18, *(float32x2_t *)(a5 + 1744));
      v20 = (float32x2_t)vzip1_s32(v17, v19);
      v21 = (float32x2_t)vzip1_s32((int32x2_t)v16, (int32x2_t)v18);
      v22 = (float32x2_t)vzip2_s32(v17, v19);
      v23 = (float32x2_t)vzip2_s32((int32x2_t)v16, (int32x2_t)v18);
      v24 = vmul_f32(vmaxnm_f32(vsub_f32(v20, v21), 0), vmaxnm_f32(vsub_f32(v22, v23), 0));
      v25 = (float32x2_t *)(a3 + 20);
      v26 = -1.0;
      v27 = (int8x8_t)vcgt_f32((float32x2_t)0x3400000034000000, v24);
      do
      {
        v28 = v25[-1];
        v29 = (int32x2_t)vadd_f32(v28, *v25);
        v30 = (float32x2_t)vdup_lane_s32((int32x2_t)v28, 0);
        v31 = (float32x2_t)vdup_lane_s32((int32x2_t)v28, 1);
        v32 = (float32x2_t)vdup_lane_s32(v29, 0);
        v33 = (float32x2_t)vdup_lane_s32(v29, 1);
        v34 = vmul_f32(vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v32, v20), (int8x8_t)v20, (int8x8_t)v32), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v30, v21), (int8x8_t)v30, (int8x8_t)v21)), 0), vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v33, v22), (int8x8_t)v22, (int8x8_t)v33), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v31, v23), (int8x8_t)v31, (int8x8_t)v23)), 0));
        v35 = vaddv_f32((float32x2_t)vbic_s8((int8x8_t)vdiv_f32(v34, v24), vorr_s8(v27, (int8x8_t)vcgt_f32((float32x2_t)0x3400000034000000, v34))));
        if (v35 > v26)
        {
          v15 = v14;
          v26 = v35;
        }
        ++v14;
        v25 = (float32x2_t *)((char *)v25 + 1724);
      }
      while (a4 != v14);
      if (((v11 ^ 1 | v13) & 1) == 0)
      {
        v36 = a3 + 1724 * v15;
        *(_DWORD *)(a5 + 4) = *(_DWORD *)(v36 + 4);
        *(_DWORD *)(a5 + 1728) = *(_DWORD *)(v36 + 4);
      }
    }
  }
}

uint64_t acTrkHandAssocTrkDet(unsigned int a1, unsigned int a2, uint64_t a3, unsigned int a4, unsigned int a5, uint64_t a6, unsigned int a7, uint64_t a8, uint64_t a9, _DWORD *a10, _DWORD *a11, _DWORD *a12, char *a13, unsigned int *a14, float *a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  unsigned int v20;
  unsigned int v22;
  uint64_t v24;
  char *v26;
  int v27;
  unsigned int TempBuffers;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  void *v32;
  _DWORD *v33;
  _DWORD *v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  unsigned int v39;
  uint64_t v40;
  unsigned int v41;
  unsigned int *v42;
  uint64_t v43;
  unsigned int v44;
  unsigned int v45;
  BOOL v46;
  int v47;
  uint64_t v48;
  unsigned int v49;
  unsigned int v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  unint64_t v60;
  int v61;
  uint64_t v62;
  __int128 v63;
  unint64_t v64;
  int v65;
  int v66;
  unsigned int v67;
  uint64_t v68;
  unsigned int v69;
  float32x2_t v70;
  float32x2_t v71;
  int32x4_t v72;
  float32x2_t v73;
  int32x2_t v74;
  float v75;
  float v76;
  int v77;
  uint64_t v78;
  float32x2_t *v79;
  int v80;
  int v81;
  int v82;
  float32x2_t v83;
  float32x2_t v84;
  float v85;
  float v86;
  float32x2_t v87;
  float v88;
  unsigned int v89;
  int v91;
  BOOL v92;
  char v93;
  uint16x4_t v94;
  BOOL v95;
  char v96;
  int v97;
  BOOL v98;
  uint64_t v99;
  int v100;
  _OWORD *v101;
  int v102;
  _DWORD *v103;
  uint64_t v104;
  unsigned int v105;
  uint64_t v106;
  _OWORD *v107;
  int v108;
  unsigned int v109;
  unsigned int v110;
  double v111;
  unint64_t v112;
  int v113;
  int32x4_t v114;
  unint64_t v115;
  uint64_t v116;
  uint64_t v117;
  unint64_t v118;
  float32x2_t v119;
  float v120;
  float v121;
  int32x4_t v122;
  uint64_t v123;
  BOOL v125;
  int v126;
  float *v127;
  int v128;
  int v129;
  uint64_t v130;
  float32x2_t v131;
  float v132;
  float v133;
  unsigned int v134;
  BOOL v136;
  uint16x4_t v137;
  BOOL v139;
  int v140;
  BOOL v141;
  uint64_t v142;
  int v143;
  int32x4_t *v144;
  int v145;
  unsigned int v146;
  uint64_t v147;
  int32x4_t *v148;
  int v149;
  int32x4_t v150;
  int32x4_t *v151;
  int32x4_t v152;
  int32x4_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  int32x4_t *v157;
  unsigned int *v158;
  __int128 v159;
  uint64_t v160;
  uint64_t v161;
  unsigned int v162;
  char *v163;
  int32x4_t *v164;
  _DWORD *v165;
  int32x4_t *v166;
  int v167;
  uint64_t v168;
  float v169;
  uint64_t v170;
  int v171;
  __int128 *v172;
  int v173;
  int v174;
  char v175;
  int v176;
  uint64_t v177;
  unsigned int v178;
  __int128 v179;
  uint64_t v180;
  uint64_t v181;
  unsigned int v182;
  unsigned int v183;
  double v184;
  uint64_t v185;
  uint64_t v186;
  int v187;
  unsigned int v188;
  unsigned int v189;
  unsigned int v190;
  uint64_t v191;
  unsigned int v192;
  unsigned int v193;
  unsigned int v194;
  double v195;
  uint64_t v196;
  _BYTE *v197;
  int *v198;
  uint64_t v199;
  int v200;
  uint64_t v201;
  uint64_t v202;
  unsigned int v203;
  unsigned int *v204;
  char *v205;
  _DWORD *v206;
  unsigned int v207;
  uint64_t v208;
  unsigned int *v209;
  uint64_t v210;
  unsigned int *v211;
  char *v212;
  uint64_t v213;
  _DWORD *v214;
  unint64_t v215;
  unsigned int v216;
  int *v217;
  char *v218;
  unint64_t v219;
  float v220;
  float v221;
  float *v222;
  float v223;
  float v224;
  float v225;
  float v226;
  float v227;
  float v228;
  float v229;
  float v230;
  BOOL v231;
  BOOL v232;
  float v234;
  unint64_t v236;
  unsigned int v237;
  uint64_t v238;
  int *v239;
  int v240;
  int *v241;
  uint64_t v242;
  unsigned int *v243;
  unsigned int v244;
  unsigned int v245;
  uint64_t v246;
  unsigned int v247;
  unint64_t v248;
  uint64_t v249;
  float32x2_t *v250;
  int v251;
  float32x2_t v252;
  float32x2_t v253;
  float v254;
  unsigned int v255;
  uint64_t v256;
  uint64_t v257;
  unsigned int v258;
  float v259;
  float v260;
  int32x4_t *v261;
  uint64_t v262;
  uint64_t v263;
  unsigned int v264;
  int v265;
  float32x2_t v266;
  float v267;
  _OWORD *v268;
  uint64_t v269;
  __int32 v270;
  float32x2_t v271;
  float32x2_t v272;
  float32_t v273;
  float32x2_t *v274;
  __int32 v275;
  unsigned __int32 v276;
  unint64_t v277;
  unsigned int v278;
  unsigned int v279;
  unsigned int v280;
  BOOL v281;
  uint64_t v282;
  uint64_t v283;
  int32x2_t *v284;
  int32x2_t *v285;
  uint64_t v286;
  int32x2_t v287;
  uint64_t v288;
  __int32 *v289;
  __int32 *v290;
  __int32 v291;
  unint64_t v292;
  int32x4_t v293;
  unsigned int v294;
  unsigned int v295;
  uint64_t v296;
  uint64_t v297;
  unsigned int v298;
  unint64_t v299;
  unint64_t v300;
  unsigned int *v301;
  unint64_t v302;
  unsigned int v303;
  unsigned int v304;
  unint64_t v305;
  unsigned int v306;
  unsigned int *v307;
  unsigned int v308;
  unsigned int v309;
  unsigned int v310;
  unsigned int v311;
  int32x4_t *v312;
  uint64_t v313;
  unsigned int v314;
  uint64_t v315;
  __int128 v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  unsigned int *v321;
  unsigned int v322;
  _DWORD *v323;
  uint64_t v324;
  int v325;
  int v326;
  __int128 *v327;
  int v328;
  int v329;
  char v330;
  int v331;
  uint64_t v332;
  unsigned int v333;
  __int128 v334;
  uint64_t v335;
  uint64_t v336;
  unsigned int v337;
  _DWORD *v338;
  uint64_t v339;
  unint64_t v340;
  uint64_t v341;
  uint64_t v342;
  unint64_t v343;
  int32x4_t v344;
  int32x4_t *v345;
  int32x4_t v346;
  int32x4_t v347;
  unint64_t v348;
  uint64_t v349;
  int *v350;
  _BYTE *v351;
  uint64_t v352;
  _DWORD *v353;
  uint64_t v354;
  _DWORD *v355;
  uint64_t v356;
  _BYTE *v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  int v361;
  int v362;
  float v363;
  uint64_t v365;
  _DWORD *v366;
  _DWORD *v367;
  int v368;
  int v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  _DWORD *v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  _DWORD *v377;
  int32x4_t v378;
  uint64_t v379;
  int32x4_t v380;
  int32x4_t v381;
  unsigned int v382;
  uint64_t v383;
  int32x4_t *v384;
  void *v385;
  int v386;
  char v387;
  unsigned int v388;
  void *v389;
  unsigned int *v390;
  void *v391;
  unsigned __int8 *v392;
  unsigned __int8 *v393;
  unsigned __int8 *v394;
  __int128 v395;
  unsigned int *v396;
  unsigned int *v397;
  void *__dst;
  uint64_t v399;
  uint64_t v400;
  uint64_t v401;
  BOOL v402;
  _BYTE *v403;
  unsigned int v404;
  unsigned int v405;
  void *v406;
  unsigned int v407;
  unsigned int v408;
  uint64_t v410;
  unsigned int v411;
  int v412;
  uint64_t v413;
  int v414;
  unsigned int v415;
  unint64_t v416;
  unsigned int v417;
  uint64_t v418;
  int32x4_t v419;
  _DWORD *v420;
  unsigned int v421;
  unsigned int v422;
  unsigned int v423;
  int32x4_t v424;
  uint64_t v425;
  int32x4_t *v426;
  void *v427[2];
  _QWORD v428[2];
  int v429;
  float v430;
  unsigned int v431;
  int v432;
  unsigned int v433;
  __int128 v434;
  __int128 v435;
  __int128 v436;
  __int128 v437;
  __int128 v438;
  __int128 v439;
  int v440[4];
  void *v441[2];
  void *__b[2];
  __int128 v443;
  __int128 v444;
  void *v445[2];
  __int128 v446;
  __int128 v447;
  __int128 v448;
  __int128 v449;
  __int128 v450;
  __int128 v451;
  __int128 v452;
  uint64_t v453;
  _DWORD __src[433];

  v20 = a7;
  v22 = a5;
  v24 = a3;
  v26 = a13;
  if (a5 <= a7)
    v27 = a7;
  else
    v27 = a5;
  v453 = 0;
  v451 = 0u;
  v452 = 0u;
  v449 = 0u;
  v450 = 0u;
  v447 = 0u;
  v448 = 0u;
  *(_OWORD *)v445 = 0u;
  v446 = 0u;
  v443 = 0u;
  v444 = 0u;
  *(_OWORD *)v441 = 0u;
  *(_OWORD *)__b = 0u;
  v439 = 0u;
  *(_OWORD *)v440 = 0u;
  v437 = 0u;
  v438 = 0u;
  v435 = 0u;
  v436 = 0u;
  v434 = 0u;
  TempBuffers = acTrkObjectAssocTrkDetGetTempBuffers(v27, (uint64_t)a19, a3, (uint64_t)&v434);
  bzero(a19, TempBuffers);
  v29 = v434;
  v30 = *((_QWORD *)&v437 + 1);
  v31 = v438;
  v32 = __b[0];
  v426 = (int32x4_t *)v434;
  v417 = v20;
  v423 = a4;
  v407 = a2;
  v404 = v22;
  if (!v20)
  {
    v433 = 0;
    v38 = *a14;
    if (!(a4 | *a14))
      goto LABEL_183;
    v39 = a4;
    v402 = a4 == 0;
    v406 = __b[0];
    v403 = (_BYTE *)v439;
    v432 = 0;
    if (!a4)
    {
      v41 = 0;
      v42 = a14;
      v401 = v438;
      if (v38)
      {
LABEL_327:
        v292 = 0;
        v293 = vdupq_n_s32(0xFFFFFE97);
        do
        {
          *((_OWORD *)v26 + 30) = 0uLL;
          *((_OWORD *)v26 + 31) = 0uLL;
          *((_OWORD *)v26 + 28) = 0uLL;
          *((_OWORD *)v26 + 29) = 0uLL;
          *((_OWORD *)v26 + 26) = 0uLL;
          *((_OWORD *)v26 + 27) = 0uLL;
          *((_OWORD *)v26 + 24) = 0uLL;
          *((_OWORD *)v26 + 25) = 0uLL;
          *((_OWORD *)v26 + 22) = 0uLL;
          *((_OWORD *)v26 + 23) = 0uLL;
          *((_OWORD *)v26 + 20) = 0uLL;
          *((_OWORD *)v26 + 21) = 0uLL;
          *((_OWORD *)v26 + 18) = 0uLL;
          *((_OWORD *)v26 + 19) = 0uLL;
          *((_OWORD *)v26 + 16) = 0uLL;
          *((_OWORD *)v26 + 17) = 0uLL;
          *((_OWORD *)v26 + 14) = 0uLL;
          *((_OWORD *)v26 + 15) = 0uLL;
          *((_OWORD *)v26 + 12) = 0uLL;
          *((_OWORD *)v26 + 13) = 0uLL;
          *((_OWORD *)v26 + 10) = 0uLL;
          *((_OWORD *)v26 + 11) = 0uLL;
          *((_OWORD *)v26 + 8) = 0uLL;
          *((_OWORD *)v26 + 9) = 0uLL;
          *((_OWORD *)v26 + 6) = 0uLL;
          *((_OWORD *)v26 + 7) = 0uLL;
          *((_OWORD *)v26 + 4) = 0uLL;
          *((_OWORD *)v26 + 5) = 0uLL;
          *((_OWORD *)v26 + 2) = 0uLL;
          *((_OWORD *)v26 + 3) = 0uLL;
          *(_OWORD *)v26 = 0uLL;
          *((_OWORD *)v26 + 1) = 0uLL;
          *((int32x4_t *)v26 + 2) = v293;
          *((_DWORD *)v26 + 12) = -361;
          *((_DWORD *)v26 + 32) = -1;
          *((_DWORD *)v26 + 98) = -1;
          *((_DWORD *)v26 + 105) = -1;
          *((_DWORD *)v26 + 128) = 0;
          v26[516] = 0;
          ++v292;
          v26 += 520;
        }
        while (v292 < *v42);
      }
LABEL_329:
      v280 = 0;
      *v42 = 0;
      goto LABEL_330;
    }
    v40 = 0;
    v41 = 0;
    v42 = a14;
    while (2)
    {
      v48 = v24 + v40;
      *(_DWORD *)(v24 + v40 + 448) = 1;
      v49 = *(_DWORD *)(v24 + v40 + 780);
      v50 = v49 - 1;
      if (!v49)
        v50 = 0;
      v51 = v48 + 40 * v50 + 532;
      v43 = *(unsigned int *)(v48 + 8);
      if ((_DWORD)v43 == 9)
      {
        v52 = *(_OWORD *)v51;
        v53 = *(_OWORD *)(v51 + 16);
        *(_QWORD *)(v48 + 564) = *(_QWORD *)(v51 + 32);
        *(_OWORD *)(v48 + 532) = v52;
        *(_OWORD *)(v48 + 548) = v53;
        *(_DWORD *)(v48 + 780) = 1;
        if (!a6)
        {
LABEL_24:
          switch((int)v43)
          {
            case 0:
              if (*(_BYTE *)(v24 + v40 + 100))
              {
                v44 = *(_DWORD *)(a8 + 60);
                if (a4 > 2)
                  v44 = 2;
              }
              else
              {
                v44 = 2;
              }
              goto LABEL_13;
            case 1:
              goto LABEL_12;
            case 2:
            case 4:
              v43 = 2;
              goto LABEL_12;
            case 3:
            case 5:
              v43 = 3;
              goto LABEL_12;
            case 8:
              v43 = 4;
              goto LABEL_12;
            default:
              if ((v43 & 0xFFFFFFFE) == 0xA)
                v43 = 6;
              else
                v43 = 5;
LABEL_12:
              v44 = *(_DWORD *)(a8 + 4 * v43 + 60);
LABEL_13:
              v45 = *(_DWORD *)(v24 + v40 + 512);
              v46 = v45 >= v44;
              if (v45 < v44)
                v47 = 1;
              else
                v47 = 2;
              if (v46)
                ++v41;
              *(_DWORD *)(v24 + v40 + 528) = v47;
              v40 += 1724;
              if (1724 * a4 != v40)
                continue;
              v401 = v31;
              if (!*a14)
                goto LABEL_329;
              goto LABEL_327;
          }
        }
      }
      else if (v49 < 6)
      {
        v57 = v24 + 40 * v49 + v40 + 532;
        v58 = *(_OWORD *)v51;
        v59 = *(_OWORD *)(v51 + 16);
        *(_QWORD *)(v57 + 32) = *(_QWORD *)(v51 + 32);
        *(_OWORD *)v57 = v58;
        *(_OWORD *)(v57 + 16) = v59;
        ++*(_DWORD *)(v48 + 780);
        if (!a6)
          goto LABEL_24;
      }
      else
      {
        v54 = v24 + v40 + 732;
        v55 = *(_OWORD *)v51;
        v56 = *(_OWORD *)(v51 + 16);
        *(_QWORD *)(v54 + 32) = *(_QWORD *)(v51 + 32);
        *(_OWORD *)v54 = v55;
        *(_OWORD *)(v54 + 16) = v56;
        if (!a6)
          goto LABEL_24;
      }
      break;
    }
    ++*(_DWORD *)(v24 + v40 + 512);
    goto LABEL_24;
  }
  v403 = (_BYTE *)v439;
  v33 = (_DWORD *)*((_QWORD *)&v434 + 1);
  __dst = (void *)v435;
  v399 = *((_QWORD *)&v437 + 1);
  v34 = __b[1];
  v391 = (void *)v443;
  v392 = (unsigned __int8 *)*((_QWORD *)&v435 + 1);
  v397 = (unsigned int *)*((_QWORD *)&v436 + 1);
  v389 = (void *)v446;
  v390 = (unsigned int *)*((_QWORD *)&v444 + 1);
  v420 = (_DWORD *)*((_QWORD *)&v446 + 1);
  v35 = v447;
  v395 = v448;
  v394 = (unsigned __int8 *)v449;
  v418 = v20;
  v396 = (unsigned int *)v450;
  v400 = *((_QWORD *)&v451 + 1);
  v406 = __b[0];
  memset(__b[0], 255, 4 * v20);
  if (!(a4 | *a14))
  {
    if (v20 > 7)
    {
      v37 = v20;
      v36 = v20 & 0xFFFFFFF8;
      v150 = (int32x4_t)xmmword_2359168E0;
      v29 = (uint64_t)v426;
      v151 = v426 + 1;
      v152.i64[0] = 0x400000004;
      v152.i64[1] = 0x400000004;
      v153.i64[0] = 0x800000008;
      v153.i64[1] = 0x800000008;
      v154 = v36;
      a2 = v407;
      v22 = v404;
      v32 = v406;
      do
      {
        v151[-1] = v150;
        *v151 = vaddq_s32(v150, v152);
        v150 = vaddq_s32(v150, v153);
        v151 += 2;
        v154 -= 8;
      }
      while (v154);
      if (v36 == v20)
        goto LABEL_183;
    }
    else
    {
      v36 = 0;
      a2 = v407;
      v29 = (uint64_t)v426;
      v22 = v404;
      v32 = v406;
      v37 = v20;
    }
    do
    {
      *(_DWORD *)(v29 + 4 * v36) = v36;
      ++v36;
    }
    while (v37 != v36);
LABEL_183:
    v433 = v20;
    acTrkObjectPickDet(a1, a2, v24, 0, v22, a6, v20, v29, &v433, v31, (uint64_t)v385, (uint64_t)v32, v386, *(_BYTE *)(a8 + 194), *(_DWORD *)(a8 + 196));
    v155 = v433;
    if (v433)
    {
      v421 = 0;
      v156 = 0;
      v424 = vdupq_n_s32(0xFFFFFE97);
      v157 = v426;
      v158 = a14;
      do
      {
        v162 = *(_DWORD *)(a6 + ((unint64_t)v157->u32[0] << 9) + 28);
        if (v162 > 1)
        {
          v165 = (_DWORD *)(v24 + 1724 * v156);
          v166 = v157;
          bzero(v165, 0x6BCuLL);
          *((int32x4_t *)v165 + 2) = v424;
          v165[12] = -361;
          v165[32] = -1;
          v165[98] = -1;
          v165[105] = -1;
          *(_QWORD *)(v165 + 193) = 0xFF7FFFFFFFFFFFFFLL;
          v165[198] = 0;
          *(_QWORD *)(v165 + 207) = 0;
          v165[209] = 0;
          memcpy(v165, (const void *)(a6 + ((unint64_t)v166->u32[0] << 9)), 0x200uLL);
          v157 = v166;
          v167 = (*a12)++;
          *v165 = v167;
          ++v165[130];
          v168 = v166->u32[0];
          v165[131] = LODWORD(a15[v168]);
          v169 = *((float *)v165 + 5) * *((float *)v165 + 6);
          *((float *)v165 + 207) = v169;
          *((float *)v165 + 208) = v169 / (float)((float)(a2 * a1) + 0.0001);
          v170 = a6 + (v168 << 9);
          v171 = *(_DWORD *)(v170 + 8);
          v172 = (__int128 *)(v170 + 12);
          v173 = *(_DWORD *)(v170 + 40);
          v174 = *(_DWORD *)(v170 + 44);
          v175 = *(_BYTE *)(v170 + 100);
          v176 = *(_DWORD *)(v170 + 420);
          if (v165[2] == 9)
          {
            v159 = *v172;
            v160 = v24 + 1724 * v156;
            *(_OWORD *)(v160 + 532) = v159;
            *(_BYTE *)(v160 + 548) = v175;
            *(_DWORD *)(v160 + 564) = v176;
            *(_DWORD *)(v160 + 556) = v174;
            *(_DWORD *)(v160 + 552) = v173;
            *(_DWORD *)(v160 + 568) = v171;
            *(_DWORD *)(v160 + 780) = 1;
            v158 = a14;
          }
          else
          {
            v177 = v24 + 1724 * v156;
            v178 = *(_DWORD *)(v177 + 780);
            if (v178 < 6)
            {
              v181 = v24 + 1724 * v156 + 40 * v178;
              *(_OWORD *)(v181 + 532) = *v172;
              *(_BYTE *)(v181 + 548) = v175;
              *(_DWORD *)(v181 + 564) = v176;
              *(_DWORD *)(v181 + 556) = v174;
              *(_DWORD *)(v181 + 552) = v173;
              *(_DWORD *)(v181 + 568) = v171;
              ++*(_DWORD *)(v177 + 780);
            }
            else
            {
              v179 = *v172;
              v180 = v24 + 1724 * v156;
              *(_OWORD *)(v180 + 732) = v179;
              *(_BYTE *)(v180 + 748) = v175;
              *(_DWORD *)(v180 + 764) = v176;
              *(_DWORD *)(v180 + 756) = v174;
              *(_DWORD *)(v180 + 752) = v173;
              *(_DWORD *)(v180 + 768) = v171;
            }
            v158 = a14;
          }
          v161 = v24 + 1724 * v156;
          *(_OWORD *)(v161 + 1664) = *(_OWORD *)(a6 + ((unint64_t)v157->u32[0] << 9) + 12);
          *(_OWORD *)(v161 + 1680) = *(_OWORD *)(a6 + ((unint64_t)v157->u32[0] << 9) + 12);
          *(float *)(v161 + 1648) = (float)*(unsigned int *)(a6 + ((unint64_t)v157->u32[0] << 9) + 28);
          v156 = (v156 + 1);
        }
        else if (v162)
        {
          v163 = &a13[520 * v421];
          *((_OWORD *)v163 + 30) = 0u;
          *((_OWORD *)v163 + 31) = 0u;
          *((_OWORD *)v163 + 28) = 0u;
          *((_OWORD *)v163 + 29) = 0u;
          *((_OWORD *)v163 + 26) = 0u;
          *((_OWORD *)v163 + 27) = 0u;
          *((_OWORD *)v163 + 24) = 0u;
          *((_OWORD *)v163 + 25) = 0u;
          *((_OWORD *)v163 + 22) = 0u;
          *((_OWORD *)v163 + 23) = 0u;
          *((_OWORD *)v163 + 20) = 0u;
          *((_OWORD *)v163 + 21) = 0u;
          *((_OWORD *)v163 + 18) = 0u;
          *((_OWORD *)v163 + 19) = 0u;
          *((_OWORD *)v163 + 16) = 0u;
          *((_OWORD *)v163 + 17) = 0u;
          *((_OWORD *)v163 + 14) = 0u;
          *((_OWORD *)v163 + 15) = 0u;
          *((_OWORD *)v163 + 12) = 0u;
          *((_OWORD *)v163 + 13) = 0u;
          *((_OWORD *)v163 + 10) = 0u;
          *((_OWORD *)v163 + 11) = 0u;
          *((_OWORD *)v163 + 8) = 0u;
          *((_OWORD *)v163 + 9) = 0u;
          *((_OWORD *)v163 + 6) = 0u;
          *((_OWORD *)v163 + 7) = 0u;
          *((_OWORD *)v163 + 4) = 0u;
          *((_OWORD *)v163 + 5) = 0u;
          *((_OWORD *)v163 + 2) = 0u;
          *((_OWORD *)v163 + 3) = 0u;
          *(_OWORD *)v163 = 0u;
          *((_OWORD *)v163 + 1) = 0u;
          *((int32x4_t *)v163 + 2) = v424;
          *((_DWORD *)v163 + 12) = -361;
          *((_DWORD *)v163 + 32) = -1;
          *((_DWORD *)v163 + 98) = -1;
          *((_DWORD *)v163 + 105) = -1;
          *((_DWORD *)v163 + 128) = 0;
          v163[516] = 0;
          v164 = v157;
          memcpy(v163, (const void *)(a6 + ((unint64_t)v157->u32[0] << 9)), 0x200uLL);
          v157 = v164;
          ++v421;
        }
        v157 = (int32x4_t *)((char *)v157 + 4);
        --v155;
      }
      while (v155);
    }
    else
    {
      v156 = 0;
      v421 = 0;
      v158 = a14;
    }
    *a10 = v156;
    *a11 = 0;
    *v158 = v421;
    return v156;
  }
  v402 = a4 == 0;
  v401 = v31;
  v60 = 0;
  v61 = 0;
  v432 = 0;
  if (a4 <= v20)
    v62 = v20;
  else
    v62 = a4;
  v414 = v62 - 1;
  v408 = v62 - 1 - v20;
  v412 = v62 & 0xFFFFFFF8;
  v411 = v62 - v20;
  v410 = ((_DWORD)v62 - v20) & 0xFFFFFFF8;
  v405 = v410 + v20;
  *(_QWORD *)&v63 = 0x4000000040000000;
  *((_QWORD *)&v63 + 1) = 0x4000000040000000;
  v64 = a4;
  v416 = a4;
  do
  {
    if (v60 >= v64)
    {
      v97 = 0;
      v98 = __CFADD__(v61, v414);
      if (v62 < 8)
        goto LABEL_94;
      if (v98)
        goto LABEL_94;
      v99 = v62 & 0xFFFFFFF8;
      v100 = v61;
      do
      {
        v101 = &v33[v100];
        *v101 = v63;
        v101[1] = v63;
        v100 += 8;
        v99 -= 8;
      }
      while (v99);
      v61 += v412;
      v97 = v62 & 0xFFFFFFF8;
      v80 = v61;
      if ((_DWORD)v62 != v412)
      {
LABEL_94:
        v102 = v62 - v97;
        v80 = v61;
        do
        {
          v33[v80++] = 0x40000000;
          --v102;
        }
        while (v102);
      }
    }
    else
    {
      v65 = 0;
      v66 = 0;
      v67 = 0;
      v68 = v24 + 1724 * v60;
      v69 = *(_DWORD *)(v68 + 8);
      v70 = *(float32x2_t *)(v68 + 12);
      v71 = vadd_f32(v70, *(float32x2_t *)(v68 + 20));
      v72 = vdupq_n_s32(v69);
      v73 = vsub_f32(v71, v70);
      v74 = vcgtz_f32(v73);
      v75 = v73.f32[1];
      if ((v74.i8[4] & 1) == 0)
        v75 = 0.0;
      if ((v74.i8[0] & 1) == 0)
        v73.f32[0] = 0.0;
      v76 = v73.f32[0] * v75;
      v77 = v61 + 1;
      v78 = v418;
      v79 = (float32x2_t *)(a6 + 12);
      v80 = v61;
      do
      {
        v81 = v80;
        v82 = v77;
        v83 = vadd_f32(*v79, v79[1]);
        v84 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v71, v83), (int8x8_t)v83, (int8x8_t)v71), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v70, *v79), (int8x8_t)v70, (int8x8_t)*v79)), 0);
        v85 = vmul_lane_f32(v84, v84, 1).f32[0];
        v86 = 0.0;
        if (v85 >= 0.00000011921)
        {
          v87 = vsub_f32(v83, *v79);
          v88 = (float)((float)(fmaxf(v87.f32[0], 0.0) * fmaxf(v87.f32[1], 0.0)) + v76) - v85;
          if (v88 >= 0.00000011921)
            v86 = v85 / v88;
          else
            v86 = 0.0;
        }
        v89 = v79[-1].u32[1];
        if (v69 == v89
          || (v69 == 10 ? (v92 = v89 == 11) : (v92 = 0),
              !v92 ? (v93 = 0) : (v93 = 1),
              (v94 = (uint16x4_t)vmovn_s32((int32x4_t)vandq_s8((int8x16_t)vceqq_s32(v72, (int32x4_t)xmmword_2359168C0), (int8x16_t)vceqq_s32(vdupq_n_s32(v89), (int32x4_t)xmmword_2359168D0))), v69 == 11)? (v95 = v89 == 10): (v95 = 0), !v95 ? (v96 = 0) : (v96 = 1), (vmaxv_u16(v94) & 1) != 0 || (v93 & 1) != 0 || (v96 & 1) != 0))
        {
          *(float *)&v33[v81] = 1.0 - v86;
          if (v86 > 0.2 && (float)(1.0 - v86) < 1.0)
          {
            ++v67;
            if (v89 == 11)
              v91 = 1;
            else
              v91 = v65;
            if (v89 == 10)
              v66 = 1;
            else
              v65 = v91;
          }
        }
        else
        {
          v33[v81] = 1065353216;
        }
        v80 = v81 + 1;
        v79 += 64;
        v77 = v82 + 1;
        --v78;
      }
      while (v78);
      v20 = v417;
      if (((v67 > 1) & v66 & v65) == 1 && (v69 & 0xFFFFFFFE) == 0xA)
      {
        v103 = (_DWORD *)(a6 + 8);
        v104 = v418;
        do
        {
          if (*(float *)&v33[v61] < 1.0 && *v103 != v69)
            v33[v61] = 1065353216;
          v103 += 128;
          ++v61;
          --v104;
        }
        while (v104);
      }
      a4 = v423;
      if (v417 >= v423)
      {
        v64 = v416;
        goto LABEL_45;
      }
      if (v411 < 8)
      {
        v105 = v417;
        v64 = v416;
LABEL_112:
        v108 = v62 - v105;
        do
        {
          v33[v80++] = 0x40000000;
          --v108;
        }
        while (v108);
        goto LABEL_45;
      }
      v105 = v417;
      v64 = v416;
      if (-2 - v81 < v408)
        goto LABEL_112;
      v106 = v410;
      do
      {
        v107 = &v33[v82];
        *v107 = v63;
        v107[1] = v63;
        v82 += 8;
        v106 -= 8;
      }
      while (v106);
      v80 += v410;
      v105 = v405;
      if (v411 != (_DWORD)v410)
        goto LABEL_112;
    }
LABEL_45:
    ++v60;
    v61 = v80;
  }
  while (v60 != v62);
  if (!a4)
  {
    v433 = v20;
    sub_2358F94A8((_DWORD *)v24, 0, a6, v20, (uint64_t)v397, (uint64_t)__dst, a8, &v432, v426, &v433, (uint64_t)v406, (uint64_t)a15, a1, v407);
    v188 = v433;
    if (v433)
      goto LABEL_431;
    goto LABEL_206;
  }
  memcpy(__dst, v33, 4 * (v62 * v62));
  bmMunkres((float *)v33, v62, v392, v109, v397, v110, 0, v111);
  v393 = (unsigned __int8 *)*((_QWORD *)&v443 + 1);
  v433 = v20;
  sub_2358F94A8((_DWORD *)v24, a4, a6, v20, (uint64_t)v397, (uint64_t)__dst, a8, &v432, v426, &v433, (uint64_t)v406, (uint64_t)a15, a1, v407);
  if (!v433)
  {
LABEL_206:
    v189 = 0;
    v190 = 0;
    v191 = (uint64_t)v426;
    goto LABEL_207;
  }
  v112 = 0;
  v113 = 0;
  v114 = vdupq_n_s32(0x47C35000u);
  v115 = v416;
  while (2)
  {
    if (v112 >= v115)
    {
      v140 = 0;
      v141 = __CFADD__(v113, v414);
      if (v62 < 8)
        goto LABEL_166;
      if (v141)
        goto LABEL_166;
      v142 = v62 & 0xFFFFFFF8;
      v143 = v113;
      do
      {
        v144 = (int32x4_t *)&v34[v143];
        *v144 = v114;
        v144[1] = v114;
        v143 += 8;
        v142 -= 8;
      }
      while (v142);
      v113 += v412;
      v140 = v62 & 0xFFFFFFF8;
      if ((_DWORD)v62 != v412)
      {
LABEL_166:
        v145 = v62 - v140;
        do
        {
          v34[v113++] = 1203982336;
          --v145;
        }
        while (v145);
      }
    }
    else
    {
      v116 = 0;
      v117 = v24 + 1724 * v112;
      v118 = *(unsigned int *)(v117 + 8);
      v119 = vadd_f32(*(float32x2_t *)(v117 + 12), vadd_f32(*(float32x2_t *)(v117 + 12), *(float32x2_t *)(v117 + 20)));
      v120 = 0.5 * v119.f32[0];
      v121 = vmuls_lane_f32(0.5, v119, 1);
      v122 = vdupq_n_s32(v118);
      if ((v118 & 0xFFFFFFFE) == 0xA)
        v123 = 6;
      else
        v123 = 5;
      v125 = ((0x13Fu >> v118) & 1) == 0 || v118 > 8;
      v126 = v113 + 1;
      v127 = a15;
      do
      {
        v128 = v113;
        v129 = v126;
        v130 = v123;
        if (!v125)
          v130 = qword_235915288[v118];
        v131 = vadd_f32(*(float32x2_t *)(a6 + v116 + 12), vadd_f32(*(float32x2_t *)(a6 + v116 + 12), *(float32x2_t *)(a6 + v116 + 20)));
        v132 = 0.5 * v131.f32[0];
        v131.f32[0] = vmuls_lane_f32(0.5, v131, 1);
        v133 = sqrtf((float)((float)(v121 - v131.f32[0]) * (float)(v121 - v131.f32[0]))+ (float)((float)(v120 - v132) * (float)(v120 - v132)));
        if (v133 > (float)((float)((float)(*(float *)(a8 + 4 * v130 + 116) + 0.01)
                                  * (float)(*(float *)(v117 + 20) + *(float *)(v117 + 24)))
                          * 0.5))
          v133 = 100000.0;
        if (*v127 < *(float *)(a8 + 188) && !*(_BYTE *)(a6 + v116 + 100))
          v133 = 100000.0;
        v134 = *(_DWORD *)(a6 + v116 + 8);
        if ((_DWORD)v118 == v134)
        {
          *(float *)&v34[v113] = v133;
        }
        else
        {
          v136 = (_DWORD)v118 == 10 && v134 == 11;
          v137 = (uint16x4_t)vmovn_s32((int32x4_t)vandq_s8((int8x16_t)vceqq_s32(v122, (int32x4_t)xmmword_2359168C0), (int8x16_t)vceqq_s32(vdupq_n_s32(v134), (int32x4_t)xmmword_2359168D0)));
          v139 = (_DWORD)v118 == 11 && v134 == 10;
          if ((vmaxv_u16(v137) & 1) != 0 || v136 || v139)
            *(float *)&v34[v128] = v133;
          else
            v34[v128] = 1203982336;
        }
        v113 = v128 + 1;
        v116 += 512;
        ++v127;
        v126 = v129 + 1;
      }
      while (v418 << 9 != v116);
      v20 = v417;
      if (v417 >= v423)
      {
        v115 = v416;
      }
      else
      {
        if (v411 < 8)
        {
          v146 = v417;
          v115 = v416;
          goto LABEL_176;
        }
        v146 = v417;
        v147 = v410;
        v115 = v416;
        if (-2 - v128 < v408)
          goto LABEL_176;
        do
        {
          v148 = (int32x4_t *)&v34[v129];
          *v148 = v114;
          v148[1] = v114;
          v129 += 8;
          v147 -= 8;
        }
        while (v147);
        v113 += v410;
        v146 = v405;
        if (v411 != (_DWORD)v410)
        {
LABEL_176:
          v149 = v62 - v146;
          do
          {
            v34[v113++] = 1203982336;
            --v149;
          }
          while (v149);
        }
      }
    }
    if (++v112 != v62)
      continue;
    break;
  }
  memcpy(v391, v34, 4 * (v62 * v62));
  bmMunkres((float *)v34, v62, v393, v182, v390, v183, 0, v184);
  sub_2358FA1B4(v24, v423, a6, v20, (uint64_t)v390, (uint64_t)v391, a8, v426->i8, &v433, (uint64_t)v406, v389, (uint64_t)a15, a1, v407);
  if (v423 <= 1)
    v185 = 1;
  else
    v185 = v423;
  if (v185 < 2)
  {
    v186 = 0;
    v187 = 0;
    goto LABEL_426;
  }
  v368 = 0;
  v369 = 0;
  v186 = v185 & 0xFFFFFFFE;
  v370 = v24;
  v371 = v186;
  do
  {
    if (*(_DWORD *)(v370 + 528) == 2)
      ++v368;
    if (*(_DWORD *)(v370 + 2252) == 2)
      ++v369;
    v370 += 3448;
    v371 -= 2;
  }
  while (v371);
  v187 = v369 + v368;
  if (v186 != v185)
  {
LABEL_426:
    v372 = v185 - v186;
    v373 = (_DWORD *)(v24 + 1724 * v186 + 528);
    do
    {
      if (*v373 == 2)
        ++v187;
      v373 += 431;
      --v372;
    }
    while (v372);
  }
  v432 = v187;
  v188 = v433;
  if (!v433)
    goto LABEL_206;
LABEL_431:
  v374 = 0;
  v190 = 0;
  v189 = 0;
  v375 = v188;
  v191 = (uint64_t)v426;
  do
  {
    v376 = *(unsigned int *)(v191 + 4 * v374);
    v377 = (_DWORD *)(a6 + (v376 << 9));
    if (v377[7] < 2u)
    {
      memcpy(&v420[128 * (unint64_t)v190], v377, 0x200uLL);
      v191 = (uint64_t)v426;
      *(_DWORD *)(v35 + 4 * v190++) = v376;
    }
    else
    {
      if (v374 != v189)
        *(_DWORD *)(v191 + 4 * v189) = v376;
      ++v189;
    }
    ++v374;
  }
  while (v375 != v374);
LABEL_207:
  v433 = v189;
  if (*a14 <= v190)
    v192 = v190;
  else
    v192 = *a14;
  if (v192)
  {
    sub_2358FA7DC((uint64_t)a13, *a14, (uint64_t)v420, v190, v395, a8, a15);
    memcpy(*((void **)&v395 + 1), (const void *)v395, 4 * v192 * v192);
    bmMunkres((float *)v395, v192, v394, v193, v396, v194, 0, v195);
    __src[0] = 0;
    v431 = 0;
    sub_2358FADA8(a13, *a14, v420, v190, (uint64_t)v396, *((uint64_t *)&v395 + 1), (float *)a9, *((uint64_t *)&v35 + 1), v400, &v431, __src);
    v196 = __src[0];
    if (__src[0])
    {
      v197 = (_BYTE *)*((_QWORD *)&v452 + 1);
      v198 = (int *)v400;
      v199 = __src[0];
      do
      {
        v200 = *v198++;
        *v197++ = a13[520 * v396[v200] + 516];
        --v199;
      }
      while (v199);
    }
    v201 = *a14;
    v413 = v196;
    if ((_DWORD)v201)
    {
      v202 = 0;
      v203 = 0;
      v204 = (unsigned int *)(a9 + 88);
      v205 = a13;
      v191 = (uint64_t)v426;
      v206 = v420;
      v415 = v189;
      do
      {
        v207 = *((_DWORD *)v205 + 128);
        if (v207)
        {
          v208 = *((unsigned int *)v205 + 2);
          switch((int)v208)
          {
            case 0:
              if (v205[100])
              {
                if (v207 < *v204)
                  goto LABEL_230;
              }
              else if (v207 < *(_DWORD *)(a9 + 84))
              {
                goto LABEL_230;
              }
              break;
            case 1:
              goto LABEL_229;
            case 2:
            case 4:
              v208 = 2;
              goto LABEL_229;
            case 3:
            case 5:
              v208 = 3;
              goto LABEL_229;
            case 8:
              v208 = 4;
              goto LABEL_229;
            default:
              v92 = (v208 & 0xFFFFFFFE) == 10;
              v208 = 5;
              if (v92)
                v208 = 6;
LABEL_229:
              if (v207 < v204[v208])
              {
LABEL_230:
                if (v202 != v203)
                {
                  v209 = v204;
                  memcpy(&a13[520 * v203], v205, 0x208uLL);
                  v204 = v209;
                  v189 = v415;
                  v206 = v420;
                  v191 = (uint64_t)v426;
                }
                ++v203;
              }
              break;
          }
        }
        v205 += 520;
        ++v202;
      }
      while (v201 != v202);
    }
    else
    {
      v203 = 0;
      v191 = (uint64_t)v426;
      v206 = v420;
    }
    *a14 = v203;
    v210 = v431;
    v211 = (unsigned int *)*((_QWORD *)&v35 + 1);
    if (v431)
    {
      v419 = vdupq_n_s32(0xFFFFFE97);
      do
      {
        if (v206[128 * (unint64_t)*v211 + 7])
        {
          v212 = &a13[520 * v203];
          *((_OWORD *)v212 + 30) = 0u;
          *((_OWORD *)v212 + 31) = 0u;
          *((_OWORD *)v212 + 28) = 0u;
          *((_OWORD *)v212 + 29) = 0u;
          *((_OWORD *)v212 + 26) = 0u;
          *((_OWORD *)v212 + 27) = 0u;
          *((_OWORD *)v212 + 24) = 0u;
          *((_OWORD *)v212 + 25) = 0u;
          *((_OWORD *)v212 + 22) = 0u;
          *((_OWORD *)v212 + 23) = 0u;
          *((_OWORD *)v212 + 20) = 0u;
          *((_OWORD *)v212 + 21) = 0u;
          *((_OWORD *)v212 + 18) = 0u;
          *((_OWORD *)v212 + 19) = 0u;
          *((_OWORD *)v212 + 16) = 0u;
          *((_OWORD *)v212 + 17) = 0u;
          *((_OWORD *)v212 + 14) = 0u;
          *((_OWORD *)v212 + 15) = 0u;
          *((_OWORD *)v212 + 12) = 0u;
          *((_OWORD *)v212 + 13) = 0u;
          *((_OWORD *)v212 + 10) = 0u;
          *((_OWORD *)v212 + 11) = 0u;
          *((_OWORD *)v212 + 8) = 0u;
          *((_OWORD *)v212 + 9) = 0u;
          *((_OWORD *)v212 + 6) = 0u;
          *((_OWORD *)v212 + 7) = 0u;
          *((_OWORD *)v212 + 4) = 0u;
          *((_OWORD *)v212 + 5) = 0u;
          *((_OWORD *)v212 + 2) = 0u;
          *((_OWORD *)v212 + 3) = 0u;
          *(_OWORD *)v212 = 0u;
          *((_OWORD *)v212 + 1) = 0u;
          *((int32x4_t *)v212 + 2) = v419;
          *((_DWORD *)v212 + 12) = -361;
          *((_DWORD *)v212 + 32) = -1;
          *((_DWORD *)v212 + 98) = -1;
          *((_DWORD *)v212 + 105) = -1;
          *((_DWORD *)v212 + 128) = 0;
          v212[516] = 0;
          memcpy(&a13[520 * *a14], &v420[128 * (unint64_t)*v211], 0x200uLL);
          v206 = v420;
          v213 = *v211;
          v214 = &v420[128 * v213];
          if (!v214[2] && *((_BYTE *)v214 + 100) && a15[*(unsigned int *)(v35 + 4 * v213)] < *(float *)(a9 + 32))
            a13[520 * *a14 + 516] = 1;
          v203 = *a14 + 1;
          *a14 = v203;
          v191 = (uint64_t)v426;
        }
        ++v211;
        --v210;
      }
      while (v210);
    }
    if (!v203)
      goto LABEL_278;
    v215 = 0;
    v216 = 0;
    v217 = (int *)v452;
    do
    {
      v218 = &a13[520 * v215];
      if (!*((_DWORD *)v218 + 2))
      {
        if (!v203)
          goto LABEL_278;
        v219 = 0;
        v221 = *((float *)v218 + 5);
        v220 = *((float *)v218 + 6);
        v222 = (float *)(a13 + 12);
        do
        {
          if (v215 != v219 && !*((_DWORD *)v222 - 1))
          {
            v224 = v222[2];
            v223 = v222[3];
            v225 = *((float *)v218 + 3);
            v226 = *((float *)v218 + 4);
            v227 = v226 + v220;
            v228 = v222[1];
            v229 = *v222 + v224;
            v230 = v228 + v223;
            v231 = (float)(v225 + v221) > *v222 && v227 > v228;
            v232 = v231 && v229 > v225;
            if (v232 && v230 > v226)
            {
              v234 = v224 * v223;
              if ((float)((float)(fmaxf(fminf(v225 + v221, v229) - fmaxf(v225, *v222), 0.0)
                                 * fmaxf(fminf(v227, v230) - fmaxf(v226, v228), 0.0))
                         / fmaxf(fminf(v220 * v221, v234), 0.00001)) > 0.9
                && v234 > (float)((float)(v220 * v221) * 1.5))
              {
                v217[v216++] = v219;
                v203 = *a14;
              }
            }
          }
          ++v219;
          v222 += 130;
        }
        while (v219 < v203);
      }
      ++v215;
    }
    while (v215 < v203);
    if (v203)
    {
      v236 = 0;
      v237 = 0;
      do
      {
        v238 = v216;
        v239 = v217;
        if (v216)
        {
          while (1)
          {
            v240 = *v239++;
            if (v236 == v240)
              break;
            if (!--v238)
              goto LABEL_276;
          }
        }
        else
        {
LABEL_276:
          if (v236 != v237)
          {
            v241 = v217;
            memcpy(&a13[520 * v237], &a13[520 * v236], 0x208uLL);
            v217 = v241;
            v191 = (uint64_t)v426;
            v203 = *a14;
          }
          ++v237;
        }
        ++v236;
      }
      while (v236 < v203);
    }
    else
    {
LABEL_278:
      v237 = 0;
    }
    *a14 = v237;
    v242 = v413;
    if ((_DWORD)v413)
    {
      v243 = (unsigned int *)v400;
      do
      {
        v244 = *v243++;
        v245 = v189 + 1;
        *(_DWORD *)(v191 + 4 * v189++) = *(_DWORD *)(v35 + 4 * v244);
        --v242;
      }
      while (v242);
    }
    else
    {
      v245 = v189;
    }
    v433 = v245;
  }
  v246 = *(_QWORD *)v440;
  a2 = v407;
  acFilterMultiFaceinSameUbody(v24, v423, *(float32x2_t **)v440, a6, v191, &v433, (float *)(a8 + 144), (char *)v445[1], a1, v407);
  v247 = v423;
  v248 = v416;
  if (v423)
  {
    v249 = v246 + 16;
    v250 = (float32x2_t *)(v24 + 20);
    do
    {
      v255 = v250[-2].i32[1] - 1;
      if (v255 <= 0xB)
        v251 = dword_23591559C[v255];
      else
        v251 = 0;
      v252 = v250[-1];
      v253 = vadd_f32(v252, *v250);
      v254 = (float)v250[1].u32[0];
      *(float32x2_t *)(v249 - 16) = v252;
      *(float32x2_t *)(v249 - 8) = v253;
      *(_DWORD *)v249 = v251;
      *(float *)(v249 + 8) = v254 / 1000.0;
      v249 += 32;
      v250 = (float32x2_t *)((char *)v250 + 1724);
      --v248;
    }
    while (v248);
  }
  v256 = v433;
  if (v433)
  {
    v257 = 0;
    v258 = 0;
    v259 = *(float *)(a8 + 36);
    v260 = *(float *)(a8 + 48);
    v261 = v426;
    do
    {
      v262 = v261->u32[v257];
      v263 = a6 + (v262 << 9);
      v264 = *(_DWORD *)(v263 + 8) - 1;
      if (v264 > 0xB)
        v265 = 0;
      else
        v265 = dword_23591559C[v264];
      v266 = vadd_f32(*(float32x2_t *)(v263 + 12), *(float32x2_t *)(v263 + 20));
      v267 = (float)*(unsigned int *)(v263 + 28);
      v428[0] = *(_QWORD *)(v263 + 12);
      v428[1] = v266;
      v429 = v265;
      v430 = v267 / 1000.0;
      if (acCheckOverlapBox(v246, v247, (uint64_t)v428, v259, v260))
      {
        v261 = v426;
      }
      else
      {
        v261 = v426;
        if (v257 != v258)
          v426->i32[v258] = v262;
        ++v258;
      }
      v247 = v423;
      ++v257;
    }
    while (v256 != v257);
    v268 = *(_OWORD **)&v440[2];
    if (v258)
    {
      v269 = 0;
      a2 = v407;
      do
      {
        v276 = v261->i32[0];
        v261 = (int32x4_t *)((char *)v261 + 4);
        v275 = v276;
        v277 = a6 + ((unint64_t)v276 << 9);
        v278 = *(_DWORD *)(v277 + 8) - 1;
        if (v278 <= 0xB)
          v270 = dword_23591559C[v278];
        else
          v270 = 0;
        v271 = *(float32x2_t *)(v277 + 12);
        v272 = vadd_f32(v271, *(float32x2_t *)(v277 + 20));
        v273 = (float)*(unsigned int *)(v277 + 28) / 1000.0;
        v274 = (float32x2_t *)&v268[v269];
        *v274 = v271;
        v274[1] = v272;
        v274[3].f32[0] = v273;
        v274[2].i32[0] = v270;
        v274[2].i32[1] = v275;
        v269 += 2;
      }
      while (2 * v258 != v269);
    }
    else
    {
      a2 = v407;
    }
  }
  else
  {
    v258 = 0;
    v268 = *(_OWORD **)&v440[2];
  }
  v22 = v404;
  v279 = acRemoveOverlapBoxes(v268, v258, (unsigned __int8 *)v441[0], *(float *)(a8 + 48));
  v280 = v279;
  v29 = (uint64_t)v426;
  v39 = v423;
  v30 = v399;
  if (v279)
  {
    if (v279 > 0xA
      && (v426 < (int32x4_t *)((char *)&v268[2 * v279 - 1] + 8)
        ? (v281 = (char *)v268 + 20 >= &v426->i8[4 * v279])
        : (v281 = 1),
          v281))
    {
      v282 = v279 & 3;
      if ((v279 & 3) == 0)
        v282 = 4;
      v283 = v279 - v282;
      v284 = (int32x2_t *)&v426->u64[1];
      v285 = (int32x2_t *)((char *)v268 + 84);
      v286 = v283;
      do
      {
        v287 = vzip1_s32(*v285, v285[4]);
        v284[-1] = vzip1_s32(v285[-8], v285[-4]);
        *v284 = v287;
        v284 += 2;
        v285 += 16;
        v286 -= 4;
      }
      while (v286);
    }
    else
    {
      v283 = 0;
    }
    v288 = v279 - v283;
    v289 = &v426->i32[v283];
    v290 = (__int32 *)&v268[2 * v283 + 1] + 1;
    do
    {
      v291 = *v290;
      v290 += 8;
      *v289++ = v291;
      --v288;
    }
    while (v288);
  }
  v433 = v279;
  v41 = v432;
LABEL_330:
  v294 = v39 - v41 + v280;
  if (v294 > v22)
  {
    if (v402)
    {
      v295 = 0;
    }
    else
    {
      v365 = 0;
      v295 = 0;
      v366 = (_DWORD *)(v24 + 528);
      do
      {
        if (*v366 == 1)
        {
          v367 = (_DWORD *)(v30 + 8 * v295);
          *v367 = v365;
          v367[1] = *(v366 - 2);
          ++v295;
        }
        ++v365;
        v366 += 431;
      }
      while (v39 != v365);
    }
    v296 = v30;
    bmHeapsort(v30, v295, 8uLL, (int (*)(uint64_t, uint64_t))sub_2358FAFFC);
    v297 = v296;
    v39 = v423;
    v29 = (uint64_t)v426;
    a2 = v407;
    if (v295)
    {
      v298 = v41 - v22 + v294;
      if (v41 < v298)
      {
        v299 = v295 - 1;
        if (v299 >= v280 + v423 + ~v41 - v22)
          v299 = v280 + v423 + ~v41 - v22;
        if (v299)
        {
          v300 = v299 + 1;
          v299 = (v299 + 1) & 0x1FFFFFFFELL;
          v301 = (unsigned int *)(v297 + 8);
          v302 = v299;
          do
          {
            v303 = *(v301 - 2);
            v304 = *v301;
            v301 += 4;
            *(_DWORD *)(v24 + 1724 * v303 + 528) = 2;
            *(_DWORD *)(v24 + 1724 * v304 + 528) = 2;
            v302 -= 2;
          }
          while (v302);
          if (v300 != v299)
          {
            v41 += v299;
            goto LABEL_342;
          }
        }
        else
        {
LABEL_342:
          v305 = v299 + 1;
          v306 = v41 + 1;
          v307 = (unsigned int *)(v297 + 8 * v299);
          do
          {
            v308 = *v307;
            v307 += 2;
            *(_DWORD *)(v24 + 1724 * v308 + 528) = 2;
            if (v305 >= v295)
              break;
            ++v305;
            v46 = v306++ >= v298;
          }
          while (!v46);
        }
      }
    }
  }
  v388 = *(_DWORD *)(a8 + 196);
  v387 = *(_BYTE *)(a8 + 194);
  v309 = a1;
  v310 = v39;
  acTrkObjectPickDet(a1, a2, v24, v39, v22, a6, v417, v29, &v433, v401, (uint64_t)v385, (uint64_t)v406, v386, v387, v388);
  if (v402)
  {
    v311 = 0;
    v312 = v426;
  }
  else
  {
    v349 = 0;
    v311 = 0;
    v350 = (int *)v24;
    v312 = v426;
    do
    {
      if (v350[132] <= 1)
      {
        if (v349 != v311)
        {
          memcpy((void *)(v24 + 1724 * v311), v350, 0x6BCuLL);
          v312 = v426;
        }
        ++v311;
      }
      v350 += 431;
      ++v349;
    }
    while (v310 != v349);
  }
  if (v311 >= v22)
    v313 = v22;
  else
    v313 = v311;
  v314 = v433;
  if (v433 >= v22)
    v314 = v22;
  if (v314 + v313 <= v22)
    v315 = v314;
  else
    v315 = v22 - v313;
  if (!(_DWORD)v315)
  {
    v337 = 0;
    v338 = a11;
    *a10 = 0;
    v156 = v313;
    v342 = *((_QWORD *)&v31 + 1);
    *a11 = 0;
    if (a6)
      goto LABEL_375;
LABEL_384:
    if (!(_DWORD)v313)
      goto LABEL_400;
    if (v313 <= 0xB || __CFADD__(v337, v313 - 1))
    {
      v379 = 0;
      v351 = v403;
    }
    else
    {
      v378 = (int32x4_t)xmmword_2359168E0;
      v379 = v313 & 0xFFFFFFF8;
      v380.i64[0] = 0x400000004;
      v380.i64[1] = 0x400000004;
      v381.i64[0] = 0x800000008;
      v381.i64[1] = 0x800000008;
      v382 = v337;
      v383 = v379;
      do
      {
        v384 = (int32x4_t *)(v342 + 4 * v382);
        *v384 = v378;
        v384[1] = vaddq_s32(v378, v380);
        v378 = vaddq_s32(v378, v381);
        v382 += 8;
        v383 -= 8;
      }
      while (v383);
      v351 = v403;
      if (v379 == v313)
        goto LABEL_401;
    }
    do
    {
      *(_DWORD *)(v342 + 4 * (v337 + v379)) = v379;
      ++v379;
    }
    while (v313 != v379);
    goto LABEL_401;
  }
  v422 = v314 + v313;
  *(int32x4_t *)v427 = vdupq_n_s32(0xFFFFFE97);
  v425 = v313;
  LODWORD(v156) = v313;
  do
  {
    v320 = v312->u32[0];
    v321 = &v312->u32[1];
    v322 = v156;
    v323 = (_DWORD *)(v24 + 1724 * v156);
    bzero(v323, 0x6BCuLL);
    *((_OWORD *)v323 + 2) = *(_OWORD *)v427;
    v323[12] = -361;
    v323[32] = -1;
    v323[98] = -1;
    v323[105] = -1;
    *(_QWORD *)(v323 + 193) = 0xFF7FFFFFFFFFFFFFLL;
    v323[198] = 0;
    *(_QWORD *)(v323 + 207) = 0;
    v324 = a6 + (v320 << 9);
    v323[209] = 0;
    memcpy(v323, (const void *)v324, 0x200uLL);
    v325 = (*a12)++;
    *v323 = v325;
    v323[131] = LODWORD(a15[v320]);
    v326 = *(_DWORD *)(v324 + 8);
    v327 = (__int128 *)(v324 + 12);
    v328 = *(_DWORD *)(v324 + 40);
    v329 = *(_DWORD *)(v324 + 44);
    v330 = *(_BYTE *)(v324 + 100);
    v331 = *(_DWORD *)(v324 + 420);
    if (v323[2] == 9)
    {
      v316 = *v327;
      v317 = v24 + 1724 * v322;
      *(_OWORD *)(v317 + 532) = v316;
      *(_BYTE *)(v317 + 548) = v330;
      *(_DWORD *)(v317 + 564) = v331;
      *(_DWORD *)(v317 + 556) = v329;
      *(_DWORD *)(v317 + 552) = v328;
      *(_DWORD *)(v317 + 568) = v326;
      *(_DWORD *)(v317 + 780) = 1;
    }
    else
    {
      v332 = v24 + 1724 * v322;
      v333 = *(_DWORD *)(v332 + 780);
      if (v333 < 6)
      {
        v336 = v24 + 1724 * v322 + 40 * v333;
        *(_OWORD *)(v336 + 532) = *v327;
        *(_BYTE *)(v336 + 548) = v330;
        *(_DWORD *)(v336 + 564) = v331;
        *(_DWORD *)(v336 + 556) = v329;
        *(_DWORD *)(v336 + 552) = v328;
        *(_DWORD *)(v336 + 568) = v326;
        ++*(_DWORD *)(v332 + 780);
      }
      else
      {
        v334 = *v327;
        v335 = v24 + 1724 * v322;
        *(_OWORD *)(v335 + 732) = v334;
        *(_BYTE *)(v335 + 748) = v330;
        *(_DWORD *)(v335 + 764) = v331;
        *(_DWORD *)(v335 + 756) = v329;
        *(_DWORD *)(v335 + 752) = v328;
        *(_DWORD *)(v335 + 768) = v326;
      }
    }
    v312 = (int32x4_t *)v321;
    v318 = a6 + (v320 << 9);
    v319 = v24 + 1724 * v322;
    *(_OWORD *)(v319 + 1664) = *(_OWORD *)(v318 + 12);
    *(_OWORD *)(v319 + 1680) = *(_OWORD *)(v318 + 12);
    *(float *)(v319 + 1648) = (float)*(unsigned int *)(v318 + 28);
    v156 = v322 + 1;
    --v315;
  }
  while (v315);
  v313 = v425;
  v337 = v156 - v425;
  v338 = a11;
  *a10 = v156 - v425;
  if (v156 <= v425)
  {
    *a11 = 0;
    v309 = a1;
    v342 = *((_QWORD *)&v31 + 1);
    if (!(_DWORD)v425)
      goto LABEL_400;
    goto LABEL_392;
  }
  if (v404 >= v422)
    v339 = v422;
  else
    v339 = v404;
  v340 = v339 - v425;
  v341 = v425;
  v309 = a1;
  v342 = *((_QWORD *)&v31 + 1);
  if (v340 <= 7)
  {
    do
    {
LABEL_373:
      *(_DWORD *)(*((_QWORD *)&v31 + 1) - 4 * v425 + 4 * v341) = v341;
      ++v341;
    }
    while ((_QWORD)v31 != v341);
  }
  else
  {
    v343 = v340 & 0xFFFFFFFFFFFFFFF8;
    v344 = vaddq_s32(vdupq_n_s32(v425), (int32x4_t)xmmword_2359168E0);
    v345 = (int32x4_t *)(*((_QWORD *)&v31 + 1) + 16);
    v346.i64[0] = 0x400000004;
    v346.i64[1] = 0x400000004;
    v347.i64[0] = 0x800000008;
    v347.i64[1] = 0x800000008;
    v348 = v340 & 0xFFFFFFFFFFFFFFF8;
    do
    {
      v345[-1] = v344;
      *v345 = vaddq_s32(v344, v346);
      v344 = vaddq_s32(v344, v347);
      v345 += 2;
      v348 -= 8;
    }
    while (v348);
    if (v340 != v343)
    {
      v341 = v343 + v425;
      goto LABEL_373;
    }
  }
  *a11 = 0;
  if (!a6)
    goto LABEL_384;
LABEL_375:
  if (!(_DWORD)v313)
  {
LABEL_400:
    v351 = v403;
    goto LABEL_401;
  }
LABEL_392:
  v352 = 0;
  v353 = (_DWORD *)(v24 + 512);
  do
  {
    if (!*v353)
    {
      *(_DWORD *)(v342 + 4 * v337++) = v352;
      ++*v338;
    }
    v353 += 431;
    ++v352;
  }
  while (v313 != v352);
  v354 = 0;
  v355 = (_DWORD *)(v24 + 512);
  v351 = v403;
  do
  {
    if (*v355)
      *(_DWORD *)(v342 + 4 * v337++) = v354;
    v355 += 431;
    ++v354;
  }
  while (v313 != v354);
LABEL_401:
  v356 = v156;
  v357 = v351;
  bzero(v351, v156);
  if ((_DWORD)v156)
  {
    v358 = 0;
    do
    {
      if (!v357[v358])
      {
        memcpy(__src, (const void *)(v24 + 1724 * v358), 0x6BCuLL);
        v357[v358] = 1;
        v359 = *(unsigned int *)(v342 + 4 * v358);
        v360 = v358;
        if (v358 != v359)
        {
          v360 = v358;
          do
          {
            memcpy((void *)(v24 + 1724 * v360), (const void *)(v24 + 1724 * v359), 0x6BCuLL);
            v360 = *(unsigned int *)(v342 + 4 * v360);
            v357[v360] = 1;
            v359 = *(unsigned int *)(v342 + 4 * v360);
          }
          while (v358 != v359);
        }
        memcpy((void *)(v24 + 1724 * v360), __src, 0x6BCuLL);
      }
      ++v358;
    }
    while (v358 != v156);
    do
    {
      v361 = *(_DWORD *)(v24 + 520);
      if (v361 == -1)
        v362 = -1;
      else
        v362 = v361 + 1;
      *(_DWORD *)(v24 + 520) = v362;
      v363 = *(float *)(v24 + 20) * *(float *)(v24 + 24);
      *(float *)(v24 + 828) = v363;
      *(float *)(v24 + 832) = v363 / (float)((float)(v407 * v309) + 0.0001);
      v24 += 1724;
      --v356;
    }
    while (v356);
  }
  return v156;
}

uint64_t getLargestConnectedRegion(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, unsigned int a7, _OWORD *a8)
{
  unsigned int v8;
  unint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v19;
  float v20;
  uint64_t v21;
  unsigned __int16 v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  float *v26;
  float v27;
  uint64_t v28;
  float *v29;
  float v30;
  float v31;
  uint64_t v32;
  float v33;
  uint64_t v34;
  float v35;
  float *v36;
  float v37;
  float v38;
  float v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  int v44;
  unsigned __int16 v45;
  unsigned int v46;
  uint64_t v47;
  BOOL v49;
  float v50;
  float *v51;
  float v52;
  uint64_t v53;
  float *v54;
  float v55;
  float v56;
  uint64_t v57;
  float v58;
  uint64_t v59;
  float v60;
  float *v61;
  float v62;
  float v63;
  float v64;
  int v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  float v69;
  float *v70;
  float v71;
  float v72;
  float *v73;
  float v74;
  uint64_t v75;
  float v76;
  uint64_t v77;
  float v78;
  float v79;
  float *v80;
  float v81;

  v8 = *((_DWORD *)a1 + 2);
  if (!v8)
    return 0;
  v9 = *((unsigned int *)a1 + 3);
  if (!(_DWORD)v9)
    return 0;
  LODWORD(v10) = 0;
  v11 = 0;
  v12 = *a1;
  v13 = *a1 + 1;
  v14 = -1;
  __asm { FMOV            V0.2S, #1.0 }
  v19 = 1;
  do
  {
    if (!v19)
      goto LABEL_5;
    v20 = (float)v11;
    v21 = *a2;
    if (*(unsigned __int8 *)(v12 + *((_DWORD *)a1 + 4) * v11) > a7)
    {
      if (v11)
        v22 = *(_WORD *)(v21 + *((_DWORD *)a2 + 4) * (v11 - 1));
      else
        v22 = a6;
      if (v22 >= (unsigned __int16)a6)
        v23 = (unsigned __int16)a6;
      else
        v23 = v22;
      if (v22 > (unsigned __int16)a6 && v22 < a6 && *(_DWORD *)(a5 + 4 * v22) > (int)v23)
        *(_DWORD *)(a5 + 4 * v22) = v23;
      if (v22 < (unsigned __int16)a6
        && a6 >= 0x10000
        && *(_DWORD *)(a5 + 4 * (unsigned __int16)a6) > (int)v23)
      {
        *(_DWORD *)(a5 + 4 * (unsigned __int16)a6) = v23;
      }
      if ((_DWORD)v23 == a6)
      {
        v24 = a4 + 16 * (int)v10;
        v25 = v10 + 1;
        LOWORD(v23) = v10;
        v10 = 4 * (int)v10;
        *(_DWORD *)(a5 + v10) = a6;
        *(_DWORD *)v24 = 0;
        *(float *)(v24 + 4) = v20;
        *(_QWORD *)(v24 + 8) = _D0;
        *(_DWORD *)(a3 + v10) = 1;
        LODWORD(v10) = v25;
LABEL_33:
        *(_WORD *)(v21 + *((_DWORD *)a2 + 4) * v11) = v23;
        v9 = *((unsigned int *)a1 + 3);
        goto LABEL_34;
      }
      v26 = (float *)(a4 + 16 * v23);
      v27 = *v26;
      if (*v26 <= 0.0)
      {
        v32 = a4 + 16 * v23;
        v33 = *(float *)(v32 + 8);
        v29 = (float *)(v32 + 8);
        v31 = v33;
        if ((float)(v27 + v33) > 0.0)
          goto LABEL_28;
      }
      else
      {
        *v26 = v27 + -1.0;
        v28 = a4 + 16 * v23;
        v30 = *(float *)(v28 + 8);
        v29 = (float *)(v28 + 8);
        v31 = v30;
      }
      *v29 = v31 + 1.0;
LABEL_28:
      v34 = a4 + 16 * v23;
      v35 = *(float *)(v34 + 4);
      if (v35 <= v20)
      {
        v39 = *(float *)(v34 + 12);
        v36 = (float *)(v34 + 12);
        v38 = v39;
        if ((float)(v35 + v39) > v20)
        {
LABEL_32:
          ++*(_DWORD *)(a3 + 4 * v23);
          goto LABEL_33;
        }
      }
      else
      {
        *(float *)(v34 + 4) = v35 + -1.0;
        v37 = *(float *)(v34 + 12);
        v36 = (float *)(v34 + 12);
        v38 = v37;
      }
      *v36 = v38 + 1.0;
      goto LABEL_32;
    }
LABEL_34:
    if (v9 >= 2)
    {
      v40 = 0;
      while (2)
      {
        if (*(unsigned __int8 *)(v13 + v11 * *((_DWORD *)a1 + 4) + v40) <= a7)
          goto LABEL_38;
        v44 = *((_DWORD *)a2 + 4);
        if (v11)
          v45 = *(_WORD *)(v21 + (v14 * v44) + 2 * v40 + 2);
        else
          v45 = a6;
        v46 = (unsigned __int16)a6;
        v47 = *(unsigned __int16 *)(v21 + v11 * v44 + 2 * v40);
        if (v45 < (unsigned __int16)a6)
          v46 = v45;
        if (v47 >= v46)
          v42 = v46;
        else
          v42 = *(unsigned __int16 *)(v21 + v11 * v44 + 2 * v40);
        _CF = v45 <= v42 || v45 >= a6;
        if (!_CF && *(_DWORD *)(a5 + 4 * v45) > (int)v42)
          *(_DWORD *)(a5 + 4 * v45) = v42;
        v49 = v47 <= v46 || v47 >= a6;
        if (!v49 && *(_DWORD *)(a5 + 4 * v47) > (int)v42)
          *(_DWORD *)(a5 + 4 * v47) = v42;
        if ((_DWORD)v42 == a6)
        {
          v42 = 4 * (int)v10;
          *(_DWORD *)(a5 + v42) = a6;
          v41 = a4 + 16 * (int)v10;
          *(float *)v41 = (float)(v40 + 1);
          *(float *)(v41 + 4) = v20;
          *(_QWORD *)(v41 + 8) = _D0;
          *(_DWORD *)(a3 + v42) = 1;
          LOWORD(v42) = v10;
          LODWORD(v10) = v10 + 1;
        }
        else
        {
          v50 = (float)(v40 + 1);
          v51 = (float *)(a4 + 16 * v42);
          v52 = *v51;
          if (*v51 > v50)
          {
            *v51 = v52 + -1.0;
            v53 = a4 + 16 * v42;
            v55 = *(float *)(v53 + 8);
            v54 = (float *)(v53 + 8);
            v56 = v55;
            goto LABEL_64;
          }
          v57 = a4 + 16 * v42;
          v58 = *(float *)(v57 + 8);
          v54 = (float *)(v57 + 8);
          v56 = v58;
          if ((float)(v52 + v58) <= v50)
LABEL_64:
            *v54 = v56 + 1.0;
          v59 = a4 + 16 * v42;
          v60 = *(float *)(v59 + 4);
          if (v60 > v20)
          {
            *(float *)(v59 + 4) = v60 + -1.0;
            v62 = *(float *)(v59 + 12);
            v61 = (float *)(v59 + 12);
            v63 = v62;
            goto LABEL_68;
          }
          v64 = *(float *)(v59 + 12);
          v61 = (float *)(v59 + 12);
          v63 = v64;
          if ((float)(v60 + v64) <= v20)
LABEL_68:
            *v61 = v63 + 1.0;
          ++*(_DWORD *)(a3 + 4 * v42);
        }
        *(_WORD *)(v21 + v11 * *((_DWORD *)a2 + 4) + 2 * v40 + 2) = v42;
        v9 = *((unsigned int *)a1 + 3);
LABEL_38:
        v43 = v40 + 2;
        ++v40;
        if (v43 >= v9)
          break;
        continue;
      }
    }
    v8 = *((_DWORD *)a1 + 2);
    v19 = v9;
LABEL_5:
    ++v11;
    ++v14;
  }
  while (v11 < v8);
  if ((int)v10 >= 1)
  {
    v65 = 0;
    v10 = v10;
    do
    {
      v66 = 4 * --v10;
      v67 = *(int *)(a5 + v66);
      v68 = *(_DWORD *)(a3 + v66);
      if ((int)v67 >= (int)v10)
      {
        if (v68 > v65)
        {
          a6 = v10;
          v65 = v68;
        }
      }
      else
      {
        *(_DWORD *)(a3 + 4 * v67) += v68;
        v69 = *(float *)(a4 + 16 * v10);
        v70 = (float *)(a4 + 16 * v67);
        v71 = *v70;
        if (v69 >= *v70)
        {
          v72 = v69 + *(float *)(a4 + 16 * v10 + 8);
          v74 = v70[2];
          v73 = v70 + 2;
          if (v72 >= (float)(v71 + v74))
            *v73 = v72 - v71;
        }
        else
        {
          v70[2] = (float)(v71 - v69) + v70[2];
          *v70 = v69;
        }
        v75 = a4 + 16 * v10;
        v76 = *(float *)(v75 + 4);
        v77 = a4 + 16 * v67;
        v78 = *(float *)(v77 + 4);
        if (v76 >= v78)
        {
          v79 = v76 + *(float *)(v75 + 12);
          v81 = *(float *)(v77 + 12);
          v80 = (float *)(v77 + 12);
          if (v79 >= (float)(v78 + v81))
            *v80 = v79 - v78;
        }
        else
        {
          *(float *)(v77 + 12) = (float)(v78 - v76) + *(float *)(v77 + 12);
          *(float *)(v77 + 4) = v76;
        }
      }
    }
    while ((unint64_t)(v10 + 1) > 1);
    if (v65 >= 1)
      *a8 = *(_OWORD *)(a4 + 16 * (int)a6);
  }
  return 0;
}

__n128 getInitialPos(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, unsigned int a5, uint64_t a6, BOOL *a7, __n128 result)
{
  uint64_t v9;
  uint64_t v11;
  unsigned int v15;
  uint64_t v16;
  unsigned int v17;
  unsigned __int8 v18;
  uint64_t v19;
  __n128 *v20;
  float v21;
  uint64_t v22;
  uint64_t v23;
  uint8x16_t *v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  unsigned int v28;
  float v29;
  uint64_t v31;
  uint64_t v32;
  uint8x16_t v33;
  uint64_t v34;
  uint8x16_t v35;
  uint8x16_t v36;
  uint8x8_t v37;
  uint64_t v38;
  uint8x8_t *v39;
  uint8x8_t v40;
  uint64_t v41;
  unsigned __int8 *v42;
  unsigned int v43;
  unsigned int v44;
  uint64_t v45;
  uint8x16_t v46;
  uint64_t v47;
  uint8x16_t v48;
  uint8x16_t v49;
  uint8x8_t v50;
  uint64_t v51;
  uint8x8_t *v52;
  uint8x8_t v53;
  uint64_t v54;
  unsigned __int8 *v55;
  unsigned int v56;
  unsigned int v57;
  unsigned __int8 v58;
  uint64_t v59;
  size_t v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  unint64_t v64;
  int v65;
  uint64_t v66;
  int v67;
  int v68;
  int v69;
  int v70;

  v9 = *(unsigned int *)(a1 + 8);
  if (!(_DWORD)v9 || (v11 = *(unsigned int *)(a1 + 12), !(_DWORD)v11))
  {
    *a7 = 1;
    return result;
  }
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v19 = *(_QWORD *)a1;
  v20 = (__n128 *)(a2 + 12);
  result.n128_u32[0] = *(_DWORD *)(a2 + 12);
  v21 = *(float *)(a2 + 16);
  v22 = v11 & 0xFFFFFFE0;
  v23 = v11 & 0xFFFFFFF8;
  do
  {
    v24 = (uint8x16_t *)(*(_QWORD *)a1 + 16 + v15);
    if (v21 > (float)v16)
    {
      if (v11 > 7)
      {
        if (v11 >= 0x20)
        {
          v33 = (uint8x16_t)vdupq_n_s8(v17);
          v34 = v11 & 0xFFFFFFE0;
          v35 = v33;
          do
          {
            v33 = vmaxq_u8(v24[-1], v33);
            v35 = vmaxq_u8(*v24, v35);
            v24 += 2;
            v34 -= 32;
          }
          while (v34);
          v36 = vmaxq_u8(v33, v35);
          v36.i8[0] = vmaxvq_u8(v36);
          v17 = v36.i32[0];
          if (v22 == v11)
            goto LABEL_4;
          v25 = v11 & 0xFFFFFFE0;
          v31 = v25;
          if ((v11 & 0x18) == 0)
            goto LABEL_32;
        }
        else
        {
          v31 = 0;
        }
        v37 = (uint8x8_t)vdup_n_s8(v17);
        v38 = v31 - (v11 & 0xFFFFFFF8);
        v39 = (uint8x8_t *)(v19 + v31 + v15);
        do
        {
          v40 = *v39++;
          v37 = vmax_u8(v40, v37);
          v38 += 8;
        }
        while (v38);
        v37.i8[0] = vmaxv_u8(v37);
        v17 = v37.i32[0];
        v25 = v11 & 0xFFFFFFF8;
        if (v23 == v11)
          goto LABEL_4;
      }
      else
      {
        v25 = 0;
      }
LABEL_32:
      v41 = v11 - v25;
      v42 = (unsigned __int8 *)(v19 + v25 + v15);
      do
      {
        v44 = *v42++;
        v43 = v44;
        v17 = v17;
        if (v44 > v17)
          v17 = v43;
        --v41;
      }
      while (v41);
      goto LABEL_4;
    }
    if ((float)(v21 + *(float *)(a2 + 24)) > (float)v16)
    {
      for (i = 0; i != v11; ++i)
      {
        v27 = v19 + v15;
        v28 = *(unsigned __int8 *)(v27 + i);
        v17 = v17;
        if (v28 > v17)
          v17 = *(unsigned __int8 *)(v27 + i);
        v29 = (float)i;
        if (v28 <= v18)
          LOBYTE(v28) = v18;
        if ((float)(result.n128_f32[0] + *(float *)(a2 + 20)) > v29 && result.n128_f32[0] <= v29)
          v18 = v28;
      }
      goto LABEL_4;
    }
    if (v11 > 7)
    {
      if (v11 >= 0x20)
      {
        v46 = (uint8x16_t)vdupq_n_s8(v17);
        v47 = v11 & 0xFFFFFFE0;
        v48 = v46;
        do
        {
          v46 = vmaxq_u8(v24[-1], v46);
          v48 = vmaxq_u8(*v24, v48);
          v24 += 2;
          v47 -= 32;
        }
        while (v47);
        v49 = vmaxq_u8(v46, v48);
        v49.i8[0] = vmaxvq_u8(v49);
        v17 = v49.i32[0];
        if (v22 == v11)
          goto LABEL_4;
        v32 = v11 & 0xFFFFFFE0;
        v45 = v32;
        if ((v11 & 0x18) == 0)
          goto LABEL_46;
      }
      else
      {
        v45 = 0;
      }
      v50 = (uint8x8_t)vdup_n_s8(v17);
      v51 = v45 - (v11 & 0xFFFFFFF8);
      v52 = (uint8x8_t *)(v19 + v45 + v15);
      do
      {
        v53 = *v52++;
        v50 = vmax_u8(v53, v50);
        v51 += 8;
      }
      while (v51);
      v50.i8[0] = vmaxv_u8(v50);
      v17 = v50.i32[0];
      v32 = v11 & 0xFFFFFFF8;
      if (v23 == v11)
        goto LABEL_4;
    }
    else
    {
      v32 = 0;
    }
LABEL_46:
    v54 = v11 - v32;
    v55 = (unsigned __int8 *)(v19 + v32 + v15);
    do
    {
      v57 = *v55++;
      v56 = v57;
      v17 = v17;
      if (v57 > v17)
        v17 = v56;
      --v54;
    }
    while (v54);
LABEL_4:
    ++v16;
    v15 += *(_DWORD *)(a1 + 16);
  }
  while (v16 != v9);
  *a7 = v17 == 0;
  if ((_BYTE)v17)
  {
    if (*(_DWORD *)(a2 + 28)
      && v17 >> 1 < v18
      && (result.n128_f32[0] = *(float *)(a2 + 12) + *(float *)(a2 + 20), result.n128_f32[0] <= (float)v11)
      && (result.n128_f32[0] = *(float *)(a2 + 16) + *(float *)(a2 + 24), result.n128_f32[0] <= (float)v9))
    {
      result = *v20;
      *(__n128 *)a6 = *v20;
    }
    else
    {
      v58 = atomic_load((unsigned __int8 *)&qword_256308B20);
      if ((v58 & 1) == 0)
      {
        v64 = a4;
        v65 = __cxa_guard_acquire(&qword_256308B20);
        a4 = v64;
        if (v65)
        {
          dword_256308B18 = (*(_DWORD *)(a1 + 12) * *(_DWORD *)(a1 + 8)) >> 2;
          __cxa_guard_release(&qword_256308B20);
          a4 = v64;
        }
      }
      v59 = dword_256308B18;
      v60 = 2 * *(unsigned int *)(a1 + 8) * (unint64_t)*(unsigned int *)(a1 + 12);
      if (v60 + 24 * dword_256308B18 <= a4)
      {
        v61 = a3 + 4 * dword_256308B18;
        v62 = v61 + 16 * dword_256308B18;
        memset((void *)(v62 + 4 * dword_256308B18), 255, v60);
        v66 = v62 + 4 * v59;
        v63 = *(_DWORD *)(a1 + 12);
        v67 = *(_DWORD *)(a1 + 8);
        v68 = v63;
        v69 = 2 * v63;
        v70 = 5;
        *(_QWORD *)a6 = 0;
        *(_QWORD *)(a6 + 8) = 0;
        getLargestConnectedRegion((uint64_t *)a1, &v66, a3, a3 + 4 * v59, v61 + 16 * v59, v59, a5, (_OWORD *)a6);
        result.n128_u32[0] = *(_DWORD *)(a6 + 8);
        if (result.n128_f32[0] < 0.00000011921
          || (result.n128_u32[0] = *(_DWORD *)(a6 + 12), result.n128_f32[0] < 0.00000011921))
        {
          *a7 = 1;
        }
      }
    }
  }
  return result;
}

uint64_t computeIntegralImage(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  float *v12;
  float *v13;
  float v14;
  uint64_t v15;
  unsigned __int8 *v16;
  unsigned int v17;
  float v18;

  v2 = *((unsigned int *)a1 + 2);
  if (*(_DWORD *)(a2 + 8) != (_DWORD)v2 + 1)
    return 4294967292;
  v3 = *((unsigned int *)a1 + 3);
  if (*(_DWORD *)(a2 + 12) != (_DWORD)v3 + 1)
    return 4294967292;
  if ((_DWORD)v2 && (_DWORD)v3)
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = *a1;
    v8 = *((_DWORD *)a1 + 4);
    v9 = *(_DWORD *)(a2 + 16);
    v10 = *(_QWORD *)a2 + 4;
    v11 = v9;
    do
    {
      v12 = (float *)(v10 + v11);
      v13 = (float *)(v10 + v5);
      ++v6;
      v14 = 0.0;
      v15 = v3;
      v16 = (unsigned __int8 *)(v7 + v4);
      do
      {
        v17 = *v16++;
        v14 = (float)((float)v17 / 255.0) * (float)((float)v17 / 255.0) + v14;
        v18 = *v13++;
        *v12++ = v18 + v14;
        --v15;
      }
      while (v15);
      v11 += v9;
      v5 += v9;
      v4 += v8;
    }
    while (v6 != v2);
  }
  return 0;
}

void convertSaliencyMapToBoundingBoxes(uint64_t a1, uint64_t a2, char *a3, unsigned int a4, unsigned int a5, uint64_t a6, int a7, float a8, float a9)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v19;
  uint64_t v20;
  int v21;
  __n128 v22;
  int v23;
  BOOL v24;
  unsigned int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  char *v30;
  int v31;
  float *v32;
  float *v33;
  float v34;
  uint64_t v35;
  unsigned __int8 *v36;
  unsigned int v37;
  float v38;
  float v39;
  int v40;
  float v41;
  float v42;
  float v43;
  float v44;
  char *v45;
  uint64_t v46;
  float v47;
  float v48;
  float v49;
  char *v50;
  uint64_t v51;
  float v52;
  float v53;
  float v54;
  float v55;
  char *v56;
  float v57;
  float v58;
  uint64_t v59;
  float v60;
  char *v61;
  float v62;
  _BOOL8 v63;
  _BOOL8 v64;
  float v65;
  _BOOL8 v66;
  float v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  BOOL v72;
  __int128 v73;

  if (a3)
  {
    v10 = a2 + 17912;
    v11 = 4 * *(unsigned __int16 *)(a2 + 21026) + 4;
    if (v11 + v11 * (unint64_t)*(unsigned __int16 *)(a2 + 21024) <= a4)
    {
      if (*(_BYTE *)(a2 + 21030))
      {
        bzero(a3, a4);
        v19 = *(unsigned __int16 *)(v10 + 3114);
        v20 = *(unsigned __int16 *)(v10 + 3112);
        v21 = 4 * v20 + 4;
        v72 = 0;
        getInitialPos(a1, a6, (uint64_t)&a3[(v21 + v21 * v19)], (int)(a4 - (v21 + v21 * v19)), a5, (uint64_t)&v73, &v72, v22);
        v24 = !v23 && !v72;
        if (v24 && *(_DWORD *)(a1 + 8) == (_DWORD)v19 && *(_DWORD *)(a1 + 12) == (_DWORD)v20)
        {
          if ((_DWORD)v19 && (_DWORD)v20)
          {
            v25 = 0;
            v26 = 0;
            v27 = 0;
            v28 = *(_QWORD *)a1;
            v29 = *(_DWORD *)(a1 + 16);
            v30 = a3 + 4;
            v31 = 4 * v20 + 4;
            do
            {
              v32 = (float *)&v30[v31];
              v33 = (float *)&v30[v26];
              ++v27;
              v34 = 0.0;
              v35 = v20;
              v36 = (unsigned __int8 *)(v28 + v25);
              do
              {
                v37 = *v36++;
                v34 = (float)((float)v37 / 255.0) * (float)((float)v37 / 255.0) + v34;
                v38 = *v33++;
                *v32++ = v38 + v34;
                --v35;
              }
              while (v35);
              v31 += v21;
              v26 += v21;
              v25 += v29;
            }
            while (v27 != v19);
          }
          v39 = *(float *)&v73;
          if (a7)
          {
            v40 = 0;
            v41 = -a8;
            v43 = *((float *)&v73 + 2);
            v42 = *((float *)&v73 + 1);
            v44 = *((float *)&v73 + 3);
            do
            {
              v45 = &a3[v21 * v42];
              v46 = 4 * v39;
              v47 = *(float *)&v45[v46];
              v48 = v39 + v43;
              v49 = v42 + v44;
              v50 = &a3[v21 * (float)(v42 + v44)];
              v51 = 4 * (float)(v39 + v43);
              v52 = *(float *)&v50[v51];
              v53 = *(float *)&v50[v46];
              v54 = *(float *)&v45[v51];
              v55 = (float)((float)((float)(v47 + v52) - v53) - v54) / (float)(v43 * v44);
              v56 = &a3[v21 * (float)(v42 + 1.0)];
              v57 = (float)((float)((float)((float)(v47 + *(float *)&v50[4 * (float)(v39 + 1.0)]) - v53)
                                  - *(float *)&v45[4 * (float)(v39 + 1.0)])
                          / v44)
                  + (float)(v41 * v55);
              v58 = (float)((float)((float)((float)(v47 + *(float *)&v56[v51]) - *(float *)&v56[v46]) - v54) / v43)
                  + (float)(v41 * v55);
              v59 = 4 * (float)((float)(v39 + v43) + -1.0);
              v60 = (float)((float)((float)((float)(v52 + *(float *)&v45[v59]) - *(float *)&v50[v59]) - v54) / v44)
                  + (float)(v41 * v55);
              v61 = &a3[v21 * (float)(v49 + -1.0)];
              v62 = (float)((float)((float)((float)(v52 + *(float *)&v61[v46]) - v53) - *(float *)&v61[v51]) / v43)
                  + (float)(v41 * v55);
              v63 = v62 > 0.0;
              v64 = v62 < 0.0;
              if (fabsf(v57) > (float)(v55 * a9))
                ++v40;
              v40 += 2 * (fabsf(v58) > (float)(v55 * a9))
                   + 4 * (fabsf(v60) > (float)(v55 * a9))
                   + 8 * (fabsf(v62) > (float)(v55 * a9));
              v65 = (float)(int)((__PAIR64__(v57 < 0.0, 0.0) - LODWORD(v57)) >> 32);
              v66 = v63 - v64;
              if ((v40 & 1) == 0)
                v65 = 0.0;
              v39 = v39 + v65;
              if (v39 < 0.0)
                v39 = 0.0;
              v67 = (float)(int)((__PAIR64__(v58 < 0.0, 0.0) - LODWORD(v58)) >> 32);
              if ((v40 & 2) == 0)
                v67 = 0.0;
              v42 = v42 + v67;
              if (v42 < 0.0)
                v42 = 0.0;
              if ((v40 & 4) != 0)
                v68 = (v60 > 0.0) - (unint64_t)(v60 < 0.0);
              else
                v68 = 0;
              v69 = v68 + (uint64_t)v48;
              if (v69 >= v20)
                v69 = v20;
              if ((v40 & 8) == 0)
                v66 = 0;
              v70 = v66 + (uint64_t)v49;
              if (v70 >= v19)
                v70 = v19;
              v43 = (float)v69 - v39;
              v44 = (float)v70 - v42;
              --a7;
            }
            while (a7);
            *((float *)&v73 + 1) = v42;
            *((float *)&v73 + 2) = (float)v69 - v39;
            *((float *)&v73 + 3) = (float)v70 - v42;
          }
          *(float *)&v73 = v39;
          *(_OWORD *)(a2 + 17928) = v73;
          *(_DWORD *)(v10 + 32) = 1;
          *(_DWORD *)(v10 + 12) = 6;
          *(_DWORD *)v10 = 1;
        }
      }
    }
  }
}

double acDetRectNull@<D0>(_OWORD *a1@<X8>)
{
  double result;

  result = 0.0;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

int32x4_t acFaceNull@<Q0>(int32x4_t *a1@<X8>)
{
  int32x4_t result;

  bzero(a1, 0x658uLL);
  result = vdupq_n_s32(0xFFFFFE97);
  a1[2] = result;
  a1[3].i32[0] = -361;
  a1[8].i32[0] = -1;
  a1[24].i32[2] = -1;
  a1[26].i32[1] = -1;
  return result;
}

int32x4_t acFaceInternalNull@<Q0>(uint64_t a1@<X8>)
{
  int32x4_t result;

  *(_OWORD *)(a1 + 480) = 0u;
  *(_OWORD *)(a1 + 496) = 0u;
  *(_OWORD *)(a1 + 448) = 0u;
  *(_OWORD *)(a1 + 464) = 0u;
  *(_OWORD *)(a1 + 416) = 0u;
  *(_OWORD *)(a1 + 432) = 0u;
  *(_OWORD *)(a1 + 384) = 0u;
  *(_OWORD *)(a1 + 400) = 0u;
  *(_OWORD *)(a1 + 352) = 0u;
  *(_OWORD *)(a1 + 368) = 0u;
  *(_OWORD *)(a1 + 320) = 0u;
  *(_OWORD *)(a1 + 336) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  result = vdupq_n_s32(0xFFFFFE97);
  *(int32x4_t *)(a1 + 32) = result;
  *(_DWORD *)(a1 + 48) = -361;
  *(_DWORD *)(a1 + 128) = -1;
  *(_DWORD *)(a1 + 392) = -1;
  *(_DWORD *)(a1 + 420) = -1;
  return result;
}

int32x4_t acFaceReset(int32x4_t *a1)
{
  int32x4_t result;

  bzero(a1, 0x658uLL);
  result = vdupq_n_s32(0xFFFFFE97);
  a1[2] = result;
  a1[3].i32[0] = -361;
  a1[8].i32[0] = -1;
  a1[24].i32[2] = -1;
  a1[26].i32[1] = -1;
  return result;
}

int32x4_t acFaceInternalReset(uint64_t a1)
{
  int32x4_t result;

  *(_OWORD *)(a1 + 480) = 0u;
  *(_OWORD *)(a1 + 496) = 0u;
  *(_OWORD *)(a1 + 448) = 0u;
  *(_OWORD *)(a1 + 464) = 0u;
  *(_OWORD *)(a1 + 416) = 0u;
  *(_OWORD *)(a1 + 432) = 0u;
  *(_OWORD *)(a1 + 384) = 0u;
  *(_OWORD *)(a1 + 400) = 0u;
  *(_OWORD *)(a1 + 352) = 0u;
  *(_OWORD *)(a1 + 368) = 0u;
  *(_OWORD *)(a1 + 320) = 0u;
  *(_OWORD *)(a1 + 336) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  result = vdupq_n_s32(0xFFFFFE97);
  *(int32x4_t *)(a1 + 32) = result;
  *(_DWORD *)(a1 + 48) = -361;
  *(_DWORD *)(a1 + 128) = -1;
  *(_DWORD *)(a1 + 392) = -1;
  *(_DWORD *)(a1 + 420) = -1;
  return result;
}

float acDetRectWidth(float *a1)
{
  return fmaxf(a1[2] - *a1, 0.0);
}

float acDetRectHeight(uint64_t a1)
{
  return fmaxf(*(float *)(a1 + 12) - *(float *)(a1 + 4), 0.0);
}

float acDetRectCenterX(float *a1)
{
  return (float)(*a1 + a1[2]) * 0.5;
}

float acDetRectCenterY(uint64_t a1)
{
  return (float)(*(float *)(a1 + 4) + *(float *)(a1 + 12)) * 0.5;
}

float32x2_t acDetRectArea(float32x2_t *a1)
{
  float32x2_t v1;

  v1 = vmaxnm_f32(vsub_f32(a1[1], *a1), 0);
  return vmul_lane_f32(v1, v1, 1);
}

float32x4_t *acDetRectIntersect@<X0>(float32x4_t *result@<X0>, float32x4_t *a2@<X1>, uint64_t a3@<X8>)
{
  int8x16_t v3;
  int8x16_t v4;
  float v5;

  v3 = *(int8x16_t *)result;
  v4.i64[0] = a2->i64[0];
  v4.i64[1] = result->i64[1];
  v3.i64[1] = a2->i64[1];
  *(int8x16_t *)a3 = vbslq_s8((int8x16_t)vcgtq_f32(*a2, *result), v4, v3);
  v5 = result[1].f32[2];
  if (v5 < a2[1].f32[2])
    v5 = a2[1].f32[2];
  *(float *)(a3 + 24) = v5;
  return result;
}

float32x4_t *acSmallestEnclosingBox@<X0>(float32x4_t *result@<X0>, float32x4_t *a2@<X1>, uint64_t a3@<X8>)
{
  int8x16_t v3;
  int8x16_t v4;
  float v5;

  v3 = *(int8x16_t *)a2;
  v4.i64[0] = result->i64[0];
  v4.i64[1] = a2->i64[1];
  v3.i64[1] = result->i64[1];
  *(int8x16_t *)a3 = vbslq_s8((int8x16_t)vcgtq_f32(*a2, *result), v4, v3);
  v5 = result[1].f32[2];
  if (v5 < a2[1].f32[2])
    v5 = a2[1].f32[2];
  *(float *)(a3 + 24) = v5;
  return result;
}

float acGenealizedOverlap(float *a1, float *a2)
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float result;
  float v14;

  v2 = a1[1];
  v3 = a2[1];
  if (*a1 >= *a2)
    v4 = *a2;
  else
    v4 = *a1;
  if (v2 >= v3)
    v5 = a2[1];
  else
    v5 = a1[1];
  v6 = a1[2];
  v7 = a1[3];
  v8 = a2[2];
  v9 = a2[3];
  if (v6 >= v8)
    v10 = a1[2];
  else
    v10 = a2[2];
  if (v7 >= v9)
    v11 = a1[3];
  else
    v11 = a2[3];
  v12 = v10 - v4;
  result = 0.0;
  v14 = fmaxf(v12, 0.0) * fmaxf(v11 - v5, 0.0);
  if (v14 >= 0.00000011921)
    return (float)((float)(fmaxf(v6 - *a1, 0.0) * fmaxf(v7 - v2, 0.0))
                 + (float)(fmaxf(v8 - *a2, 0.0) * fmaxf(v9 - v3, 0.0)))
         / v14;
  return result;
}

float acDetRectOverlap(float *a1, float *a2)
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float result;
  float v14;
  float v15;

  v2 = a1[1];
  v3 = a2[1];
  if (*a1 >= *a2)
    v4 = *a1;
  else
    v4 = *a2;
  if (v2 >= v3)
    v5 = a1[1];
  else
    v5 = a2[1];
  v6 = a1[2];
  v7 = a1[3];
  v8 = a2[2];
  v9 = a2[3];
  if (v6 >= v8)
    v10 = a2[2];
  else
    v10 = a1[2];
  if (v7 >= v9)
    v11 = a2[3];
  else
    v11 = a1[3];
  v12 = v10 - v4;
  result = 0.0;
  v14 = fmaxf(v12, 0.0) * fmaxf(v11 - v5, 0.0);
  if (v14 >= 0.00000011921)
  {
    v15 = (float)((float)(fmaxf(v6 - *a1, 0.0) * fmaxf(v7 - v2, 0.0))
                + (float)(fmaxf(v8 - *a2, 0.0) * fmaxf(v9 - v3, 0.0)))
        - v14;
    if (v15 >= 0.00000011921)
      return v14 / v15;
    else
      return 0.0;
  }
  return result;
}

float acDetRectOverlapSmallbox(float *a1, float *a2)
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float result;
  float v14;
  float v15;
  float v16;

  v2 = a1[1];
  v3 = a2[1];
  if (*a1 >= *a2)
    v4 = *a1;
  else
    v4 = *a2;
  if (v2 >= v3)
    v5 = a1[1];
  else
    v5 = a2[1];
  v6 = a1[2];
  v7 = a1[3];
  v8 = a2[2];
  v9 = a2[3];
  if (v6 >= v8)
    v10 = a2[2];
  else
    v10 = a1[2];
  if (v7 >= v9)
    v11 = a2[3];
  else
    v11 = a1[3];
  v12 = v10 - v4;
  result = 0.0;
  v14 = fmaxf(v12, 0.0) * fmaxf(v11 - v5, 0.0);
  if (v14 >= 0.00000011921)
  {
    v15 = fmaxf(v8 - *a2, 0.0) * fmaxf(v9 - v3, 0.0);
    v16 = fmaxf(v6 - *a1, 0.0) * fmaxf(v7 - v2, 0.0);
    if (v16 < v15)
      v15 = v16;
    if (v15 >= 0.00000011921)
      return v14 / v15;
    else
      return 0.0;
  }
  return result;
}

float acRectIntersectOverUnion(float *a1, float *a2)
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float result;
  float v12;
  float v13;
  float v14;
  float v16;

  v2 = *a1;
  v3 = a1[1];
  v4 = a1[2];
  v5 = a1[3];
  v6 = *a1 + v4;
  v7 = v3 + v5;
  v9 = *a2;
  v8 = a2[1];
  result = 0.0;
  if (v6 > *a2 && v7 > v8)
  {
    v12 = a2[2];
    v13 = a2[3];
    v14 = v8 + v13;
    if ((float)(v9 + v12) > v2 && v14 > v3)
    {
      if (v2 < v9)
        v2 = *a2;
      if (v3 < v8)
        v3 = a2[1];
      if (v6 >= (float)(v9 + v12))
        v6 = v9 + v12;
      if (v7 >= v14)
        v7 = v8 + v13;
      v16 = fmaxf(v6 - v2, 0.0) * fmaxf(v7 - v3, 0.0);
      return v16 / fmaxf((float)((float)(v4 * v5) + (float)(v12 * v13)) - v16, 0.00000011921);
    }
  }
  return result;
}

float acDetRectOverlapFirstBox(float32x2_t *a1, float32x2_t *a2)
{
  float32x2_t v2;
  float32x2_t v3;
  float32x2_t v4;
  float32x2_t v5;
  float32x2_t v6;
  BOOL v7;
  float result;

  v2 = a1[1];
  v3 = vmaxnm_f32(vsub_f32(v2, *a1), 0);
  v4 = vmul_lane_f32(v3, v3, 1);
  v5 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(a2[1], v2), (int8x8_t)v2, (int8x8_t)a2[1]), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*a2, *a1), (int8x8_t)*a2, (int8x8_t)*a1)), 0);
  v6 = vmul_lane_f32(v5, v5, 1);
  v7 = v6.f32[0] < 0.00000011921 || v4.f32[0] < 0.00000011921;
  LODWORD(result) = vdiv_f32(v6, v4).u32[0];
  if (v7)
    return 0.0;
  return result;
}

float acDetRectOverlapSecondBox(float32x2_t *a1, float32x2_t *a2)
{
  float32x2_t v2;
  float32x2_t v3;
  float32x2_t v4;
  float32x2_t v5;
  float32x2_t v6;
  BOOL v7;
  float result;

  v2 = a2[1];
  v3 = vmaxnm_f32(vsub_f32(v2, *a2), 0);
  v4 = vmul_lane_f32(v3, v3, 1);
  v5 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v2, a1[1]), (int8x8_t)a1[1], (int8x8_t)v2), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*a2, *a1), (int8x8_t)*a2, (int8x8_t)*a1)), 0);
  v6 = vmul_lane_f32(v5, v5, 1);
  v7 = v6.f32[0] < 0.00000011921 || v4.f32[0] < 0.00000011921;
  LODWORD(result) = vdiv_f32(v6, v4).u32[0];
  if (v7)
    return 0.0;
  return result;
}

BOOL acDetRectScoreCompare(float *a1, float *a2)
{
  return a1[6] < a2[6];
}

BOOL acDetRectSizeCompare(float *a1, float *a2)
{
  return (float)((float)(a1[3] - a1[1]) * (float)(a1[2] - *a1)) < (float)((float)(a2[3] - a2[1]) * (float)(a2[2] - *a2));
}

BOOL acDetRectClassCompare(_DWORD *a1, _DWORD *a2)
{
  return a1[4] < a2[4];
}

BOOL acDetRectClassCompareReverse(_DWORD *a1, _DWORD *a2)
{
  return a1[4] > a2[4];
}

uint64_t acDetRectFilterByScore(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  float *v5;
  uint64_t v6;
  __int128 v7;
  _OWORD *v8;

  v3 = 0;
  if (a2)
  {
    v4 = a2;
    v5 = (float *)(a1 + 24);
    do
    {
      if (*v5 > *(float *)(a3 + 4 * *((unsigned int *)v5 - 2)))
      {
        v6 = v3;
        v3 = (v3 + 1);
        v7 = *(_OWORD *)(v5 - 2);
        v8 = (_OWORD *)(a1 + 32 * v6);
        *v8 = *(_OWORD *)(v5 - 6);
        v8[1] = v7;
      }
      v5 += 8;
      --v4;
    }
    while (v4);
  }
  return v3;
}

float32_t acDetRectFromFace@<S0>(uint64_t a1@<X0>, float32x2_t *a2@<X8>)
{
  float32x2_t v2;
  float32x2_t v3;
  unsigned int v4;
  __int32 v5;
  float32_t result;

  v2 = *(float32x2_t *)(a1 + 12);
  v3 = vadd_f32(v2, *(float32x2_t *)(a1 + 20));
  *a2 = v2;
  a2[1] = v3;
  v4 = *(_DWORD *)(a1 + 8) - 1;
  if (v4 > 0xB)
    v5 = 0;
  else
    v5 = dword_23591559C[v4];
  a2[2].i32[0] = v5;
  result = (float)*(unsigned int *)(a1 + 28) / 1000.0;
  a2[3].f32[0] = result;
  return result;
}

float32_t acDetRectFromFaceInternal@<S0>(uint64_t a1@<X0>, float32x2_t *a2@<X8>)
{
  float32x2_t v2;
  float32x2_t v3;
  unsigned int v4;
  __int32 v5;
  float32_t result;

  v2 = *(float32x2_t *)(a1 + 12);
  v3 = vadd_f32(v2, *(float32x2_t *)(a1 + 20));
  *a2 = v2;
  a2[1] = v3;
  v4 = *(_DWORD *)(a1 + 8) - 1;
  if (v4 > 0xB)
    v5 = 0;
  else
    v5 = dword_23591559C[v4];
  a2[2].i32[0] = v5;
  result = (float)*(unsigned int *)(a1 + 28) / 1000.0;
  a2[3].f32[0] = result;
  return result;
}

float acDetRectFromAcSalientFace@<S0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  float result;

  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_DWORD *)(a2 + 16) = *(_DWORD *)(a1 + 16);
  result = *(float *)(a1 + 24);
  *(float *)(a2 + 24) = result;
  return result;
}

void acFaceSkinToneMapping(uint64_t a1, double a2, int32x2_t a3)
{
  uint64_t v4;
  float v5;
  float v6;
  float32x4_t v7;
  float32x4_t v8;
  float v9;
  float32x4_t v10;
  float v11;
  float32x4_t v12;
  float v18;
  float v19;
  float32x2_t v20;
  float v21;
  int32x2_t v22;
  float32x4_t v23;
  int32x4_t v24;
  float32x2_t v26;
  float32x2_t v28;
  float32x4_t v29;
  float v30;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  int32x2_t v36;

  if (*(_BYTE *)(a1 + 440))
  {
    v4 = a1 + 404;
    *(float *)a3.i32 = (float)*(int *)(a1 + 420) / 1000.0;
    v36 = a3;
    v5 = (float)(*(float *)a3.i32 + -0.1) * (float)(*(float *)a3.i32 + -0.1);
    v6 = 1.0 / expf(v5 * 40.0);
    v29 = (float32x4_t)vdupq_lane_s32(v36, 0);
    v7 = vaddq_f32(v29, (float32x4_t)xmmword_235916900);
    v33 = vmulq_f32(vmulq_f32(v7, v7), (float32x4_t)xmmword_235916910);
    v30 = expf(v33.f32[1]);
    v8.f32[0] = expf(v33.f32[0]);
    v8.f32[1] = v30;
    v31 = v8;
    v9 = expf(v33.f32[2]);
    v10 = v31;
    v10.f32[2] = v9;
    v32 = v10;
    v11 = expf(v33.f32[3]);
    v12 = v32;
    v12.f32[3] = v11;
    __asm { FMOV            V0.4S, #1.0 }
    v34 = vdivq_f32(_Q0, v12);
    v18 = 1.0 / expf(v5 * 8.0);
    v19 = 1.0 / expf((float)((float)(*(float *)v36.i32 + -0.88) * (float)(*(float *)v36.i32 + -0.88)) * 8.0);
    v20 = vadd_f32(*(float32x2_t *)v29.f32, (float32x2_t)0xBF266666BE75C28FLL);
    *(float32x2_t *)v32.f32 = vmul_f32(v20, v20);
    v21 = 1.0 / expf(80.0 * v32.f32[0]);
    *(float *)v22.i32 = v34.f32[3] + (float)(v34.f32[2] + (float)(v34.f32[1] + (float)(v34.f32[0] + (float)(v6 + v21))));
    *(_DWORD *)(a1 + 396) = (int)(float)((float)(v6 / *(float *)v22.i32) * 1000.0);
    *(_DWORD *)(a1 + 400) = (int)(float)((float)(v21 / *(float *)v22.i32) * 1000.0);
    v23 = vdivq_f32(v34, (float32x4_t)vdupq_lane_s32(v22, 0));
    v35 = (float32x4_t)vdupq_n_s32(0x447A0000u);
    v24 = vcvtq_s32_f32(vmulq_f32(v23, v35));
    *(int32x4_t *)v4 = v24;
    v24.i32[0] = 1047904911;
    v24.i32[0] = vdup_lane_s32(*(int32x2_t *)v24.i8, 0).u32[0];
    v24.i32[1] = v36.i32[0];
    __asm { FMOV            V1.2S, #16.0 }
    *(float32x2_t *)v24.i8 = vmul_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*(float32x2_t *)v24.i8, (float32x2_t)(v29.u32[0] | 0x3F26666600000000)), (int8x8_t)0x4100000041000000, _D1), *(float32x2_t *)v32.f32);
    v32.i32[0] = v24.i32[0];
    v36.i32[0] = expf(*(float *)&v24.i32[1]);
    v26.f32[0] = expf(v32.f32[0]);
    v26.i32[1] = v36.i32[0];
    __asm { FMOV            V1.2S, #1.0 }
    v28 = vdiv_f32(_D1, v26);
    _D1.f32[0] = v19 + (float)(v28.f32[1] + (float)(v18 + v28.f32[0]));
    *(_DWORD *)(a1 + 424) = (int)(float)((float)(v18 / _D1.f32[0]) * 1000.0);
    *(int32x2_t *)(v4 + 24) = vcvt_s32_f32(vmul_f32(vdiv_f32(v28, (float32x2_t)vdup_lane_s32((int32x2_t)_D1, 0)), *(float32x2_t *)v35.f32));
    *(_DWORD *)(a1 + 436) = (int)(float)((float)(v19 / _D1.f32[0]) * 1000.0);
  }
}

uint64_t acTrkGroupCheckNewArgmin(const float *a1, int a2, int a3, unsigned int a4, uint64_t a5, unsigned int *a6)
{
  float v6;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int *v15;
  int v16;

  if (!a4)
    return *a6;
  v6 = 3.4028e38;
  if (a3)
  {
    v7 = a2;
    v8 = a4;
    do
    {
      if (a1[v7] < v6)
        v6 = a1[v7];
      v7 += a3;
      --v8;
    }
    while (v8);
  }
  else
  {
    v9 = a4 * a2;
    v10 = a4;
    do
    {
      if (a1[v9] < v6)
        v6 = a1[v9];
      ++v9;
      --v10;
    }
    while (v10);
  }
  if (a3)
  {
    v11 = 0;
    v12 = 0;
    do
    {
      if (vabds_f32(v6, a1[a2]) < 0.00000011921)
        a6[v12++] = v11;
      ++v11;
      a2 += a3;
    }
    while (a4 != v11);
  }
  else
  {
    v13 = 0;
    v12 = 0;
    do
    {
      if (vabds_f32(v6, a1[a4 * a2 + v13]) < 0.00000011921)
        a6[v12++] = v13;
      ++v13;
    }
    while (a4 != v13);
  }
  if (!v12)
    return *a6;
  v14 = v12;
  v15 = a6;
  while (1)
  {
    v16 = *v15++;
    if (v16 == (_DWORD)a5)
      break;
    if (!--v14)
      return *a6;
  }
  return a5;
}

uint64_t acTrkObjectSetUpFeatureMunkresCost(uint64_t result, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, float32x4_t *a9)
{
  uint64_t v9;
  unint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  __int8 *v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  uint64_t v31;
  unsigned int v32;
  float v33;
  float32x2_t v34;
  float32x2_t v35;
  int v36;
  float32x4_t v37;
  int32x2_t v38;
  float v39;
  float v40;
  float v41;
  uint64_t v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  float32x4_t v46;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t v51;
  float32x4_t v52;
  float32x4_t v53;
  float32x4_t v54;
  uint64_t v55;
  float v56;
  float v57;
  uint64_t v58;
  float32x4_t v59;
  float32x4_t v60;
  float32x4_t v61;
  float32x4_t v62;
  float32x4_t v63;
  float32x4_t v64;
  float32x4_t v65;
  float32x4_t v66;
  float32x4_t v67;
  uint64_t v68;
  float v69;
  float v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float v75;
  float v76;
  float v78;
  uint64_t v79;
  float v80;
  float v81;
  float v82;
  float v83;
  float v84;
  float v85;
  float v86;
  uint64_t v87;
  float v88;
  float v89;
  uint64_t v90;
  uint64_t v91;
  float v92;
  float v93;
  float v94;
  float v95;
  float v96;
  float v97;
  float v98;
  uint64_t v99;
  float v100;
  uint64_t v101;
  uint64_t v102;
  float v103;
  float v104;
  float v105;
  float v106;
  float v107;
  float v108;
  float v109;
  float v110;
  uint64_t v111;
  float32x2_t v112;
  float32x2_t v113;
  int8x8_t v114;
  int8x8_t v115;
  float32x2_t v116;
  float v117;
  float32x2_t v118;
  float32x2_t v119;
  float v120;
  float v121;
  float v122;
  float32x2_t v123;
  float v124;
  float v125;
  BOOL v126;
  uint64_t v128;
  float32x2_t v129;
  float32x2_t v130;
  float32x2_t v131;
  float v132;
  float32x2_t v133;
  float v134;
  float v135;
  float v136;
  unsigned int v137;
  BOOL v138;
  unsigned int v139;
  float v140;
  float v141;
  uint64_t v142;
  float32x2_t v143;
  float32x2_t v144;
  float v145;
  float v146;
  float v147;
  int v148;
  BOOL v149;
  uint64_t v150;
  unsigned int v151;
  _OWORD *v152;
  int v153;
  uint64_t v154;
  float32x2_t *v155;
  float32x2_t v156;
  float32x2_t v157;
  float32x2_t v158;
  float v159;
  float v160;
  float32x2_t v161;
  float v162;
  BOOL v164;
  BOOL v165;
  uint64_t v166;
  unsigned int v167;
  _OWORD *v168;
  unsigned int v169;
  int v170;
  float32x2_t *v171;
  unsigned int v172;
  uint64_t v173;
  int v174;
  uint64_t v175;
  uint64_t v176;
  unsigned int v177;
  uint64_t v178;
  unsigned int v180;
  uint64_t v181;
  int v182;
  unint64_t v184;
  float v185;
  unsigned int v186;
  int v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  int v193;
  int v194;
  float v195;
  float32x2_t v196;
  float v197;
  uint64_t v198;
  int v199;
  int v200;
  int v201;
  int v202;
  unsigned int *v203;
  float v204;
  unsigned int v205;
  unsigned int v206;

  if (a2 <= a4)
    v9 = a4;
  else
    v9 = a2;
  if ((_DWORD)v9)
  {
    v10 = 0;
    v11 = 0;
    v181 = v9 & 0xFFFFFFF8;
    v182 = v9 - 1;
    v174 = v9 - 1 - a4;
    v180 = v9 - a4;
    v173 = ((_DWORD)v9 - a4) & 0xFFFFFFF8;
    v172 = v173 + a4;
    v12 = result + 1136;
    v13 = result + 1392;
    v14 = &a9->i8[4];
    v178 = a3 + 132;
    v188 = a3 + 136;
    v189 = result + 884;
    v171 = (float32x2_t *)(a3 + 20);
    *(_QWORD *)&v15 = 0x4000000040000000;
    *((_QWORD *)&v15 + 1) = 0x4000000040000000;
    v16 = a4;
    v191 = a5;
    v192 = a8;
    v177 = a4;
    v190 = a3;
    v175 = v9;
    v176 = result;
    do
    {
      if (v10 >= a2)
      {
        v148 = 0;
        v149 = __CFADD__(v11, v182);
        if (v9 < 8)
          goto LABEL_104;
        if (v149)
          goto LABEL_104;
        v150 = v181;
        v151 = v11;
        do
        {
          v152 = (_OWORD *)(a5 + 4 * v151);
          *v152 = v15;
          v152[1] = v15;
          v151 += 8;
          v150 -= 8;
        }
        while (v150);
        v11 += v181;
        v148 = v181;
        if ((_DWORD)v9 != (_DWORD)v181)
        {
LABEL_104:
          v153 = v9 - v148;
          do
          {
            *(_DWORD *)(a5 + 4 * v11++) = 0x40000000;
            --v153;
          }
          while (v153);
        }
        goto LABEL_6;
      }
      v17 = result + 1724 * v10;
      v18 = *(_DWORD *)(v17 + 8);
      v19 = *(float32x4_t *)(v17 + 880);
      v20 = *(float32x4_t *)(v17 + 896);
      v21 = *(float32x4_t *)(v17 + 928);
      a9[2] = *(float32x4_t *)(v17 + 912);
      a9[3] = v21;
      *a9 = v19;
      a9[1] = v20;
      v22 = *(float32x4_t *)(v17 + 944);
      v23 = *(float32x4_t *)(v17 + 960);
      v24 = *(float32x4_t *)(v17 + 992);
      a9[6] = *(float32x4_t *)(v17 + 976);
      a9[7] = v24;
      a9[4] = v22;
      a9[5] = v23;
      v25 = *(float32x4_t *)(v17 + 1008);
      v26 = *(float32x4_t *)(v17 + 1024);
      v27 = *(float32x4_t *)(v17 + 1056);
      a9[10] = *(float32x4_t *)(v17 + 1040);
      a9[11] = v27;
      a9[8] = v25;
      a9[9] = v26;
      v28 = *(float32x4_t *)(v17 + 1072);
      v29 = *(float32x4_t *)(v17 + 1088);
      v30 = *(float32x4_t *)(v17 + 1120);
      a9[14] = *(float32x4_t *)(v17 + 1104);
      a9[15] = v30;
      a9[12] = v28;
      a9[13] = v29;
      if (a4)
      {
        v31 = 0;
        v32 = 0;
        v33 = *(float *)a8;
        v34 = *(float32x2_t *)(v17 + 12);
        v35 = vadd_f32(v34, *(float32x2_t *)(v17 + 20));
        v184 = v10;
        v203 = (unsigned int *)(result + 1724 * v10 + 512);
        v201 = *(unsigned __int8 *)(a8 + 64);
        v202 = *(unsigned __int8 *)(a8 + 65);
        v36 = *(unsigned __int8 *)(a8 + 58);
        v200 = *(unsigned __int8 *)(a8 + 57);
        v199 = *(unsigned __int8 *)(a8 + 19);
        *(float32x2_t *)v37.f32 = vsub_f32(v35, v34);
        v38 = vcgtz_f32(*(float32x2_t *)v37.f32);
        v39 = v37.f32[1];
        v40 = 0.0;
        if ((v38.i8[4] & 1) == 0)
          v39 = 0.0;
        if ((v38.i8[0] & 1) == 0)
          v37.f32[0] = 0.0;
        v41 = v37.f32[0] * v39;
        v42 = v178;
        v186 = *(_DWORD *)(a8 + 124);
        v187 = *(unsigned __int8 *)(a8 + 120);
        v185 = (float)*(unsigned int *)(a7 + 80);
        v43 = v11;
        v198 = v12;
        v197 = *(float *)a8;
        v196 = v35;
        v195 = v37.f32[0] * v39;
        v193 = *(unsigned __int8 *)(a8 + 58);
        v194 = v18;
        do
        {
          if (v18 == 9 && *(_DWORD *)(a3 + (v31 << 9) + 8) == 9)
          {
            if (v202)
            {
              v44 = 0;
              do
              {
                a9->f32[v44] = (float)(a9->f32[v44] * 0.5) + (float)(*(float *)(v12 + v44 * 4) * 0.5);
                ++v44;
              }
              while ((_DWORD)(v44 * 4) != 256);
              v45 = 0;
              v37.i32[0] = 0;
              do
              {
                v37.f32[0] = (float)(v37.f32[0] + (float)(a9->f32[v45] * a9->f32[v45]))
                           + (float)(a9->f32[v45 + 1] * a9->f32[v45 + 1]);
                v45 += 2;
              }
              while (v45 != 64);
              v37.f32[0] = (float)(1.0 / sqrtf(v37.f32[0])) + 0.0000001;
              v46 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v37.f32, 0);
              v47 = vdivq_f32(a9[1], v46);
              *a9 = vdivq_f32(*a9, v46);
              a9[1] = v47;
              v48 = vdivq_f32(a9[3], v46);
              a9[2] = vdivq_f32(a9[2], v46);
              a9[3] = v48;
              v49 = vdivq_f32(a9[5], v46);
              a9[4] = vdivq_f32(a9[4], v46);
              a9[5] = v49;
              v50 = vdivq_f32(a9[7], v46);
              a9[6] = vdivq_f32(a9[6], v46);
              a9[7] = v50;
              v51 = vdivq_f32(a9[9], v46);
              a9[8] = vdivq_f32(a9[8], v46);
              a9[9] = v51;
              v52 = vdivq_f32(a9[11], v46);
              a9[10] = vdivq_f32(a9[10], v46);
              a9[11] = v52;
              v53 = vdivq_f32(a9[13], v46);
              a9[12] = vdivq_f32(a9[12], v46);
              a9[13] = v53;
              v54 = vdivq_f32(a9[14], v46);
              v37 = vdivq_f32(a9[15], v46);
              a9[14] = v54;
              a9[15] = v37;
            }
            if (v201)
            {
              v55 = 0;
              v56 = *(float *)(a8 + 112);
              v57 = *(float *)(a8 + 116);
              do
              {
                a9->f32[v55] = (float)(a9->f32[v55] * v57) + (float)(*(float *)(v13 + v55 * 4) * v56);
                ++v55;
              }
              while ((_DWORD)(v55 * 4) != 256);
              v58 = 0;
              v37.i32[0] = 0;
              do
              {
                v37.f32[0] = (float)(v37.f32[0] + (float)(a9->f32[v58] * a9->f32[v58]))
                           + (float)(a9->f32[v58 + 1] * a9->f32[v58 + 1]);
                v58 += 2;
              }
              while (v58 != 64);
              v37.f32[0] = sqrtf(v37.f32[0]) + 0.0000001;
              v59 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v37.f32, 0);
              v60 = vdivq_f32(a9[1], v59);
              *a9 = vdivq_f32(*a9, v59);
              a9[1] = v60;
              v61 = vdivq_f32(a9[3], v59);
              a9[2] = vdivq_f32(a9[2], v59);
              a9[3] = v61;
              v62 = vdivq_f32(a9[5], v59);
              a9[4] = vdivq_f32(a9[4], v59);
              a9[5] = v62;
              v63 = vdivq_f32(a9[7], v59);
              a9[6] = vdivq_f32(a9[6], v59);
              a9[7] = v63;
              v64 = vdivq_f32(a9[9], v59);
              a9[8] = vdivq_f32(a9[8], v59);
              a9[9] = v64;
              v65 = vdivq_f32(a9[11], v59);
              a9[10] = vdivq_f32(a9[10], v59);
              a9[11] = v65;
              v66 = vdivq_f32(a9[13], v59);
              a9[12] = vdivq_f32(a9[12], v59);
              a9[13] = v66;
              v67 = vdivq_f32(a9[14], v59);
              v37 = vdivq_f32(a9[15], v59);
              a9[14] = v67;
              a9[15] = v37;
            }
            v68 = 0;
            v69 = 0.0;
            v70 = 0.0;
            v71 = 0.0;
            do
            {
              v72 = *(float *)(v42 + v68 * 4);
              v73 = *(float *)(v42 + v68 * 4 + 4);
              v74 = a9->f32[v68];
              v75 = *(float *)&v14[v68 * 4];
              v69 = (float)(v69 + (float)(v74 * v74)) + (float)(v75 * v75);
              v70 = (float)(v70 + (float)(v72 * v72)) + (float)(v73 * v73);
              v71 = (float)(v71 + (float)(v72 * v74)) + (float)(v73 * v75);
              v68 += 2;
            }
            while (v68 != 64);
            v76 = fmaxf(1.0 - (float)(v71 / (float)((float)(sqrtf(v70) * sqrtf(v69)) + 0.00001)), 0.0);
            if (v76 <= 1.0 || v36 == 0)
              v78 = v76;
            else
              v78 = 1.0;
            if (v200)
            {
              v204 = v40;
              v205 = v32;
              v206 = v43;
              v79 = 0;
              v80 = 0.0;
              v81 = 0.0;
              v82 = 0.0;
              do
              {
                v83 = *(float *)(v42 + v79 * 4);
                v84 = *(float *)(v42 + v79 * 4 + 4);
                v85 = a9->f32[v79];
                v86 = *(float *)&v14[v79 * 4];
                v80 = (float)(v80 + (float)(v85 * v85)) + (float)(v86 * v86);
                v81 = (float)(v81 + (float)(v83 * v83)) + (float)(v84 * v84);
                v82 = (float)(v82 + (float)(v83 * v85)) + (float)(v84 * v86);
                v79 += 2;
              }
              while (v79 != 64);
              v87 = 0;
              v88 = (float)(sqrtf(v81) * sqrtf(v80)) + 0.00001;
              v89 = 0.0;
              v90 = v189;
              do
              {
                v91 = 0;
                v92 = 0.0;
                v93 = 0.0;
                v94 = 0.0;
                do
                {
                  v95 = *(float *)(v42 + v91);
                  v96 = *(float *)(v42 + v91 + 4);
                  v97 = *(float *)(v90 + v91 - 4);
                  v98 = *(float *)(v90 + v91);
                  v92 = (float)(v92 + (float)(v97 * v97)) + (float)(v98 * v98);
                  v93 = (float)(v93 + (float)(v95 * v95)) + (float)(v96 * v96);
                  v94 = (float)(v94 + (float)(v95 * v97)) + (float)(v96 * v98);
                  v91 += 8;
                }
                while (v91 != 256);
                v89 = v89
                    + expf((float)((float)(v94 / (float)((float)(sqrtf(v93) * sqrtf(v92)) + 0.00001)) + -1.0) + 1.0);
                ++v87;
                v90 += 1724;
              }
              while (v87 != a2);
              v99 = 0;
              v100 = 0.0;
              v101 = v188;
              do
              {
                v102 = 0;
                v103 = 0.0;
                v104 = 0.0;
                v105 = 0.0;
                do
                {
                  v106 = a9->f32[v102];
                  v107 = a9->f32[v102 + 1];
                  v108 = *(float *)(v101 + v102 * 4 - 4);
                  v109 = *(float *)(v101 + v102 * 4);
                  v103 = (float)(v103 + (float)(v108 * v108)) + (float)(v109 * v109);
                  v104 = (float)(v104 + (float)(v106 * v106)) + (float)(v107 * v107);
                  v105 = (float)(v105 + (float)(v106 * v108)) + (float)(v107 * v109);
                  v102 += 2;
                }
                while (v102 != 64);
                v100 = v100
                     + expf((float)((float)(v105 / (float)((float)(sqrtf(v104) * sqrtf(v103)) + 0.00001)) + -1.0) + 1.0);
                ++v99;
                v101 += 512;
              }
              while (v99 != v16);
              v37.f32[0] = expf((float)((float)(v82 / v88) + -1.0) + 1.0);
              v78 = 1.0
                  - (float)((float)((float)(v37.f32[0] / (float)(v89 + 0.000001)) * 0.5)
                          + (float)((float)(v37.f32[0] / (float)(v100 + 0.000001)) * 0.5));
              a5 = v191;
              a8 = v192;
              a3 = v190;
              v12 = v198;
              v33 = v197;
              v35 = v196;
              v41 = v195;
              v36 = v193;
              v18 = v194;
              v32 = v205;
              v43 = v206;
              v40 = v204;
            }
            *(float *)(a5 + 4 * v43) = v78;
            v110 = 1.0 - v78;
            if (v199 && !*v203)
            {
              v111 = a3 + (v31 << 9);
              v112 = *(float32x2_t *)(v111 + 12);
              v113 = vadd_f32(v112, *(float32x2_t *)(v111 + 20));
              v114 = (int8x8_t)vcgt_f32(v34, v112);
              v115 = (int8x8_t)vcgt_f32(v35, v113);
              v116 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8(v115, (int8x8_t)v113, (int8x8_t)v35), (float32x2_t)vbsl_s8(v114, (int8x8_t)v34, (int8x8_t)v112)), 0);
              v117 = vmul_lane_f32(v116, v116, 1).f32[0];
              v118 = vsub_f32(v113, v112);
              v119 = vmaxnm_f32(v118, 0);
              v120 = (float)(vmul_lane_f32(v119, v119, 1).f32[0] + v41) - v117;
              if (v120 >= 0.00000011921)
                v121 = v117 / v120;
              else
                v121 = 0.0;
              if (v117 >= 0.00000011921)
                v122 = v121;
              else
                v122 = 0.0;
              v123 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8(v115, (int8x8_t)v35, (int8x8_t)v113), (float32x2_t)vbsl_s8(v114, (int8x8_t)v112, (int8x8_t)v34)), 0);
              v123.f32[0] = vmul_lane_f32(v123, v123, 1).f32[0];
              v164 = v123.f32[0] < 0.00000011921;
              v124 = (float)((float)(fmaxf(v118.f32[0], 0.0) * fmaxf(v118.f32[1], 0.0)) + v41) / v123.f32[0];
              if (v164)
                v124 = 0.0;
              if (v122 > 0.0)
                v125 = v122;
              else
                v125 = v124;
              v126 = v124 >= *(float *)(a8 + 12) || v122 > 0.0;
              v78 = 1.0 - (float)((float)(v125 * 0.02) + (float)(v110 * 0.98));
              if (!v126)
                v78 = 1.0;
              *(float *)(a5 + 4 * v43) = v78;
            }
            if (v110 > v33 && *(_BYTE *)(a8 + 20) != 0)
            {
              v128 = a3 + (v31 << 9);
              v129 = *(float32x2_t *)(v128 + 12);
              v130 = vadd_f32(v129, *(float32x2_t *)(v128 + 20));
              v131 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v35, v130), (int8x8_t)v130, (int8x8_t)v35), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v34, v129), (int8x8_t)v34, (int8x8_t)v129)), 0);
              v132 = vmul_lane_f32(v131, v131, 1).f32[0];
              v133 = vsub_f32(v130, v129);
              v134 = (float)((float)(fmaxf(v133.f32[0], 0.0) * fmaxf(v133.f32[1], 0.0)) + v41) - v132;
              if (v134 >= 0.00000011921)
                v135 = v132 / v134;
              else
                v135 = 0.0;
              if (v132 < 0.00000011921)
                v135 = 0.0;
              v136 = *(float *)(a8 + 52);
              v137 = *v203;
              if (v187)
              {
                v138 = v186 >= v137;
                v139 = v186 - v137;
                v140 = v136 * (float)((float)v139 / (float)v186);
                if (v139 == 0 || !v138)
                  v140 = 0.0;
              }
              else
              {
                v140 = v136 * (float)((float)(v185 - (float)v137) / v185);
              }
              v141 = (float)(v135 * v140) + (float)((float)(1.0 - v140) * v110);
              v78 = 1.0 - v141;
              if (v141 > 1.0)
                v78 = 0.0;
              *(float *)(a5 + 4 * v43) = v78;
            }
            if (v36 && (float)(1.0 - v78) < v33)
            {
              *(_DWORD *)(a5 + 4 * v43) = 1065353216;
              v78 = 1.0;
            }
          }
          else
          {
            *(_DWORD *)(a5 + 4 * v43) = 0x40000000;
            v78 = 2.0;
          }
          if ((float)(1.0 - v78) > v33)
          {
            v142 = a3 + (v31 << 9);
            v37.i64[0] = *(_QWORD *)(v142 + 12);
            v143 = vadd_f32(*(float32x2_t *)v37.f32, *(float32x2_t *)(v142 + 20));
            v144 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v35, v143), (int8x8_t)v143, (int8x8_t)v35), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v34, *(float32x2_t *)v37.f32), (int8x8_t)v34, *(int8x8_t *)v37.f32)), 0);
            v145 = vmul_lane_f32(v144, v144, 1).f32[0];
            v146 = 0.0;
            if (v145 >= 0.00000011921)
            {
              *(float32x2_t *)v37.f32 = vsub_f32(v143, *(float32x2_t *)v37.f32);
              v37.f32[0] = (float)((float)(fmaxf(v37.f32[0], 0.0) * fmaxf(v37.f32[1], 0.0)) + v41) - v145;
              v147 = v145 / v37.f32[0];
              if (v37.f32[0] >= 0.00000011921)
                v146 = v147;
              else
                v146 = 0.0;
            }
            ++v32;
            if (v146 > v40)
              v40 = v146;
          }
          ++v31;
          ++v43;
          v42 += 512;
        }
        while (v31 != v16);
        if (*(_BYTE *)(a8 + 16) && v32 >= 2)
        {
          a4 = v177;
          v9 = v175;
          result = v176;
          v10 = v184;
          if (!*v203 && v18 == 9)
          {
            v154 = v16;
            v155 = v171;
            do
            {
              v156 = v155[-1];
              v157 = vadd_f32(v156, *v155);
              v158 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v35, v157), (int8x8_t)v157, (int8x8_t)v35), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v34, v156), (int8x8_t)v34, (int8x8_t)v156)), 0);
              v159 = vmul_lane_f32(v158, v158, 1).f32[0];
              v160 = 0.0;
              if (v159 >= 0.00000011921)
              {
                v161 = vsub_f32(v157, v156);
                v161.f32[0] = (float)((float)(fmaxf(v161.f32[0], 0.0) * fmaxf(v161.f32[1], 0.0)) + v41) - v159;
                v162 = v159 / v161.f32[0];
                if (v161.f32[0] >= 0.00000011921)
                  v160 = v162;
                else
                  v160 = 0.0;
              }
              v164 = (float)(1.0 - *(float *)(a5 + 4 * v11)) > v33 && v160 <= 0.7 && v160 < (float)(v40 + -0.005);
              if (v164)
                *(_DWORD *)(a5 + 4 * v11) = 1065353216;
              v155 += 64;
              ++v11;
              --v154;
            }
            while (v154);
          }
          v11 = v43;
        }
        else
        {
          v11 = v43;
          a4 = v177;
          v9 = v175;
          result = v176;
          v10 = v184;
        }
        *(_QWORD *)&v15 = 0x4000000040000000;
        *((_QWORD *)&v15 + 1) = 0x4000000040000000;
      }
      if (a4 < a2)
      {
        v165 = __CFADD__(v11, v174);
        if (v180 < 8 || v165)
        {
          v169 = a4;
        }
        else
        {
          v166 = v173;
          v167 = v11;
          do
          {
            v168 = (_OWORD *)(a5 + 4 * v167);
            *v168 = v15;
            v168[1] = v15;
            v167 += 8;
            v166 -= 8;
          }
          while (v166);
          v11 += v173;
          v169 = v172;
          if (v180 == (_DWORD)v173)
            goto LABEL_6;
        }
        v170 = v9 - v169;
        do
        {
          *(_DWORD *)(a5 + 4 * v11++) = 0x40000000;
          --v170;
        }
        while (v170);
      }
LABEL_6:
      ++v10;
      v12 += 1724;
      v13 += 1724;
    }
    while (v10 != v9);
  }
  return result;
}

_OWORD *acTrkObjectSetUpIoUMunkresCost(_OWORD *result, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5)
{
  uint64_t v5;
  unint64_t v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  int v10;
  __int128 v11;
  char *v12;
  int v13;
  float32x2_t v14;
  float32x2_t v15;
  float32x2_t v16;
  int32x2_t v17;
  float v18;
  float v19;
  unsigned int v20;
  uint64_t v21;
  float32x2_t *v22;
  BOOL v23;
  float v24;
  unsigned int v25;
  unsigned int v26;
  float32x2_t v27;
  float32x2_t v28;
  float v29;
  float v30;
  float32x2_t v31;
  float v32;
  int v33;
  BOOL v34;
  uint64_t v35;
  unsigned int v36;
  _OWORD *v37;
  int v38;
  unsigned int v39;
  unsigned int v40;
  uint64_t v41;
  _OWORD *v42;
  unsigned int v43;
  unint64_t i;
  int v45;
  unsigned int v46;
  unint64_t v47;
  unsigned int v48;
  int v49;
  __int128 v50;
  int v51;
  unsigned int v52;
  unsigned int v53;
  uint64_t v54;
  unsigned int v55;
  uint64_t v56;
  unsigned int v57;

  if (a2 <= a4)
    v5 = a4;
  else
    v5 = a2;
  if (!(_DWORD)v5)
    return result;
  if (a4)
  {
    v6 = 0;
    v7 = 0;
    v8 = v5 - a4;
    v9 = v5 & 0xFFFFFFF8;
    v10 = (v5 - a4) & 0xFFFFFFF8;
    *(_QWORD *)&v11 = 0x4000000040000000;
    *((_QWORD *)&v11 + 1) = 0x4000000040000000;
    while (1)
    {
      if (v6 >= a2)
      {
        v33 = 0;
        v34 = __CFADD__(v7, v5 - 1);
        if (v5 < 8)
          goto LABEL_32;
        if (v34)
          goto LABEL_32;
        v35 = v5 & 0xFFFFFFF8;
        v36 = v7;
        do
        {
          v37 = (_OWORD *)(a5 + 4 * v36);
          *v37 = v11;
          v37[1] = v11;
          v36 += 8;
          v35 -= 8;
        }
        while (v35);
        v7 += v9;
        v33 = v5 & 0xFFFFFFF8;
        if ((_DWORD)v5 != v9)
        {
LABEL_32:
          v38 = v5 - v33;
          do
          {
            *(_DWORD *)(a5 + 4 * v7++) = 0x40000000;
            --v38;
          }
          while (v38);
        }
        goto LABEL_7;
      }
      v12 = (char *)result + 1724 * v6;
      v13 = *((_DWORD *)v12 + 2);
      v14 = *(float32x2_t *)(v12 + 12);
      v15 = vadd_f32(v14, *(float32x2_t *)(v12 + 20));
      v16 = vsub_f32(v15, v14);
      v17 = vcgtz_f32(v16);
      v18 = v16.f32[1];
      if ((v17.i8[4] & 1) == 0)
        v18 = 0.0;
      if ((v17.i8[0] & 1) == 0)
        v16.f32[0] = 0.0;
      v19 = v16.f32[0] * v18;
      v20 = v7 + 1;
      v21 = a4;
      v22 = (float32x2_t *)(a3 + 12);
      do
      {
        v25 = v7;
        v26 = v20;
        v27 = vadd_f32(*v22, v22[1]);
        v28 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v15, v27), (int8x8_t)v27, (int8x8_t)v15), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v14, *v22), (int8x8_t)v14, (int8x8_t)*v22)), 0);
        v29 = vmul_lane_f32(v28, v28, 1).f32[0];
        v30 = 0.0;
        if (v29 >= 0.00000011921)
        {
          v31 = vsub_f32(v27, *v22);
          v31.f32[0] = (float)((float)(fmaxf(v31.f32[0], 0.0) * fmaxf(v31.f32[1], 0.0)) + v19) - v29;
          v32 = v29 / v31.f32[0];
          if (v31.f32[0] >= 0.00000011921)
            v30 = v32;
          else
            v30 = 0.0;
        }
        v23 = v22[-1].i32[1] == 9 && v13 == 9;
        v24 = 1.0 - v30;
        if (!v23)
          v24 = 2.0;
        *(float *)(a5 + 4 * v7++) = v24;
        v22 += 64;
        ++v20;
        --v21;
      }
      while (v21);
      if (a4 < a2)
      {
        if (v8 < 8)
        {
          v40 = a4;
        }
        else
        {
          v39 = -2 - v25;
          v40 = a4;
          v41 = v8 & 0xFFFFFFF8;
          if (v39 >= (_DWORD)v5 - 1 - a4)
          {
            do
            {
              v42 = (_OWORD *)(a5 + 4 * v26);
              *v42 = v11;
              v42[1] = v11;
              v26 += 8;
              v41 -= 8;
            }
            while (v41);
            v7 += v10;
            v40 = v10 + a4;
            if (v8 == v10)
              goto LABEL_7;
          }
        }
        do
        {
          *(_DWORD *)(a5 + 4 * v7) = 0x40000000;
          ++v40;
          ++v7;
        }
        while (v40 < v5);
      }
LABEL_7:
      if (++v6 == v5)
        return result;
    }
  }
  if (v5 >= 8)
  {
    v46 = 0;
    v47 = 0;
    v48 = v5 - 1;
    v49 = v5 & 0xFFFFFFF8;
    *(_QWORD *)&v50 = 0x4000000040000000;
    *((_QWORD *)&v50 + 1) = 0x4000000040000000;
    v51 = v5;
    while (1)
    {
      v52 = ~v46;
      v53 = v46;
      if (v47 >= a2)
      {
        if (v48 <= v52)
        {
          v56 = v5 & 0xFFFFFFF8;
          v57 = v46;
          do
          {
            result = (_OWORD *)(a5 + 4 * v57);
            *result = v50;
            result[1] = v50;
            v57 += 8;
            v56 -= 8;
          }
          while (v56);
          if ((_DWORD)v5 == v49)
            goto LABEL_59;
          v53 = v46 + v49;
        }
        do
          *(_DWORD *)(a5 + 4 * v53++) = 0x40000000;
        while (v51 != v53);
      }
      else
      {
        if (v48 <= v52)
        {
          v54 = v5 & 0xFFFFFFF8;
          v55 = v46;
          do
          {
            result = (_OWORD *)(a5 + 4 * v55);
            *result = v50;
            result[1] = v50;
            v55 += 8;
            v54 -= 8;
          }
          while (v54);
          if ((_DWORD)v5 == v49)
            goto LABEL_59;
          v53 = v46 + v49;
        }
        do
          *(_DWORD *)(a5 + 4 * v53++) = 0x40000000;
        while (v51 != v53);
      }
LABEL_59:
      ++v47;
      v46 += v5;
      v51 += v5;
      if (v47 == v5)
        return result;
    }
  }
  v43 = 0;
  for (i = 0; i != v5; ++i)
  {
    if (i >= a2)
    {
      *(_DWORD *)(a5 + 4 * v43) = 0x40000000;
      if ((_DWORD)v5 != 1)
      {
        *(_DWORD *)(a5 + 4 * (v43 + 1)) = 0x40000000;
        if ((_DWORD)v5 != 2)
        {
          *(_DWORD *)(a5 + 4 * (v43 + 2)) = 0x40000000;
          if ((_DWORD)v5 != 3)
          {
            *(_DWORD *)(a5 + 4 * (v43 + 3)) = 0x40000000;
            if ((_DWORD)v5 != 4)
            {
              *(_DWORD *)(a5 + 4 * (v43 + 4)) = 0x40000000;
              if ((_DWORD)v5 != 5)
              {
                *(_DWORD *)(a5 + 4 * (v43 + 5)) = 0x40000000;
                if ((_DWORD)v5 != 6)
                  *(_DWORD *)(a5 + 4 * (v43 + 6)) = 0x40000000;
              }
            }
          }
        }
      }
    }
    else
    {
      v45 = 0;
      do
        *(_DWORD *)(a5 + 4 * (v43 + v45++)) = 0x40000000;
      while ((_DWORD)v5 != v45);
    }
    v43 += v5;
  }
  return result;
}

uint64_t acTrkObjectFeatureAssocCore(_DWORD *a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, _DWORD *a10, uint64_t a11, uint64_t a12, uint64_t a13, unsigned int a14, unsigned int a15, uint64_t a16, unsigned int a17)
{
  unsigned int v19;
  _DWORD *v21;
  uint64_t v22;
  _DWORD *v23;
  uint64_t v24;
  uint64_t v25;
  _DWORD *v26;
  uint64_t result;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  float v34;
  int v35;
  unsigned int v36;
  float v37;
  uint64_t v38;
  uint64_t v39;
  float v40;
  float v41;
  float v42;
  float v44;
  _DWORD *v45;
  unsigned int v46;
  uint64_t v47;
  unsigned int v48;
  uint64_t v49;
  float v50;
  int v52;
  float *v53;
  uint64_t v54;
  _DWORD *v55;
  uint64_t v56;
  uint64_t v57;
  float v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float v63;
  float v64;
  BOOL v65;
  float v66;
  float v67;
  unsigned int v68;
  unsigned int v69;
  uint64_t v70;
  float32x2_t *v71;
  float32x2_t *v72;
  uint64_t v73;
  float32x2_t *v74;
  float32x2_t v75;
  float32x2_t v76;
  float32x2_t v77;
  float32x2_t v78;
  float32x2_t v79;
  float v80;
  float v81;
  float v82;
  float32x2_t v83;
  float32x2_t v84;
  float32x2_t v85;
  float32x2_t v86;
  float v87;
  float32x2_t v88;
  float32x2_t v89;
  float32x2_t v90;
  float v91;
  float32x2_t v92;
  _BOOL4 v94;
  uint64_t v95;
  unsigned int v96;
  float32x4_t v97;
  float32x2_t v98;
  float32x2_t v99;
  int32x2_t v100;
  float v101;
  float v102;
  float v103;
  uint64_t v104;
  float32x2_t *v105;
  int v106;
  float32x2_t v107;
  float32x2_t v108;
  float32x2_t v109;
  float v110;
  float v111;
  float32x2_t v112;
  float v113;
  float v114;
  float v115;
  uint64_t v116;
  _DWORD *v117;
  uint64_t v118;
  int v119;
  BOOL v120;
  char v121;
  float32x4_t *v122;
  float *v123;
  float32x4_t v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  _DWORD *v135;
  float32x4_t *v136;
  float32x2_t *v137;
  uint64_t v138;
  uint64_t v139;
  unint64_t v140;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  unsigned int *v146;

  v19 = a2;
  v21 = a10;
  *a10 = 0;
  if (!a2)
    goto LABEL_9;
  if (a2 == 1)
  {
    v22 = 0;
  }
  else
  {
    v22 = a2 & 0xFFFFFFFE;
    v23 = a1;
    v24 = v22;
    do
    {
      v23[132] = 0;
      v23[563] = 0;
      v23[112] = 1;
      v23[543] = 1;
      v23 += 862;
      v24 -= 2;
    }
    while (v24);
    if (v22 == a2)
      goto LABEL_9;
  }
  v25 = a2 - v22;
  v26 = &a1[431 * v22 + 112];
  do
  {
    v26[20] = 0;
    *v26 = 1;
    v26 += 431;
    --v25;
  }
  while (v25);
LABEL_9:
  if (a2 <= a4)
    result = a4;
  else
    result = a2;
  if ((_DWORD)result)
  {
    v28 = 0;
    v29 = a9;
    if (a4 <= 1)
      v30 = 1;
    else
      v30 = a4;
    v138 = v30;
    v31 = a4;
    v32 = a17;
    v33 = a3 + 136;
    v137 = (float32x2_t *)(a3 + 20);
    v34 = 10.0;
    v139 = a8;
    v140 = v31;
    v144 = a6;
    v145 = a3;
    v142 = a5;
    v143 = result;
    while (1)
    {
      v36 = *(_DWORD *)(a5 + 4 * v28);
      if (v28 >= v31)
      {
        v45 = &a1[431 * v36];
        v46 = v45[128] + 1;
        v45[128] = v46;
        v47 = v45[2];
        if (v47 < 9 && ((0x13Fu >> v47) & 1) != 0)
        {
          v48 = dword_2359151EC[v47];
        }
        else if ((v47 & 0xFFFFFFFE) == 0xA)
        {
          v48 = 6;
        }
        else
        {
          v48 = 5;
        }
        goto LABEL_128;
      }
      if (v36 >= v19)
      {
        v49 = *v21;
        *v21 = v49 + 1;
        *(_DWORD *)(v29 + 4 * v49) = v28;
        goto LABEL_19;
      }
      v37 = *(float *)a7;
      if (*(_BYTE *)(a7 + 56))
        v37 = fminf(v37 + (float)(fmaxf(roundf((float)(a1[431 * v36 + 128] - 30) / v34), 0.0) * 0.1), 0.6);
      if (!*(_BYTE *)(a7 + 88))
        goto LABEL_45;
      v38 = a3 + (v28 << 9);
      v41 = *(float *)(v38 + 12);
      v40 = *(float *)(v38 + 16);
      v39 = v38 + 12;
      v42 = *(float *)(v39 + 12);
      if (v41 < 20.0 || v40 < 20.0)
        break;
      v44 = *(float *)(v39 + 8);
      v50 = (float)(v40 + v42) - (float)a15;
      if ((float)((float)(v41 + v44) - (float)a14) > -20.0 || v50 > -20.0)
        goto LABEL_42;
LABEL_45:
      v146 = (unsigned int *)(a3 + (v28 << 9) + 28);
      if (*v146 <= 1)
      {
        if (a1[431 * v36 + 128] <= *(_DWORD *)(a7 + 40))
          v53 = (float *)(a7 + 32);
        else
          v53 = (float *)(a7 + 36);
        v37 = *v53;
      }
      v54 = 0;
      v55 = &a1[431 * v36];
      v56 = a3 + (v28 << 9) + 132;
      v57 = (uint64_t)&a1[431 * v36 + 285];
      v58 = 0.0;
      v59 = 0.0;
      v60 = 0.0;
      do
      {
        v61 = *(float *)(v33 + v54 - 4);
        v62 = *(float *)(v33 + v54);
        v63 = *(float *)(v57 + v54 - 4);
        v64 = *(float *)(v57 + v54);
        v58 = (float)(v58 + (float)(v63 * v63)) + (float)(v64 * v64);
        v59 = (float)(v59 + (float)(v61 * v61)) + (float)(v62 * v62);
        v60 = (float)(v60 + (float)(v61 * v63)) + (float)(v62 * v64);
        v54 += 8;
      }
      while (v54 != 256);
      v65 = (float)(1.0 - *(float *)(a6 + 4 * (v28 + v36 * (_DWORD)result))) >= v37;
      v66 = 1.0 - (float)(v60 / (float)((float)(sqrtf(v59) * sqrtf(v58)) + 0.00001));
      if (v66 <= 0.0)
        v67 = 1.0;
      else
        v67 = 1.0 - v66;
      if (v67 <= *(float *)(a7 + 28))
        v65 = 0;
      if ((_DWORD)v32)
      {
        v68 = 0;
        v69 = 0;
        v70 = a3 + (v28 << 9);
        v71 = (float32x2_t *)(v70 + 12);
        v72 = (float32x2_t *)(v70 + 20);
        v73 = v32;
        v74 = (float32x2_t *)(a16 + 12);
        do
        {
          if (v74[-1].i32[1] == 1)
          {
            v75 = *v74;
            v76 = vadd_f32(*v74, v74[1]);
            v77 = *(float32x2_t *)(v55 + 3);
            v78 = vadd_f32(v77, *(float32x2_t *)(v55 + 5));
            v79 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v76, v78), (int8x8_t)v78, (int8x8_t)v76), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*v74, v77), (int8x8_t)*v74, (int8x8_t)v77)), 0);
            v80 = vmul_lane_f32(v79, v79, 1).f32[0];
            v81 = 0.0;
            v82 = 0.0;
            if (v80 >= 0.00000011921)
            {
              v83 = vmaxnm_f32(vsub_f32(v76, v75), 0);
              v84 = vsub_f32(v78, v77);
              v85 = (float32x2_t)vdup_lane_s32((int32x2_t)v83, 0);
              v85.i32[0] = fmaxf(v84.f32[0], 0.0);
              v83.i32[0] = fmaxf(v84.f32[1], 0.0);
              v86 = vmul_f32(v85, v83);
              if (v86.f32[0] >= v86.f32[1])
                v86.f32[0] = v86.f32[1];
              v87 = v80 / v86.f32[0];
              if (v86.f32[0] >= 0.00000011921)
                v82 = v87;
              else
                v82 = 0.0;
            }
            v88 = *v71;
            v89 = vadd_f32(*v71, *v72);
            if (v82 > 0.5)
              ++v68;
            v90 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v76, v89), (int8x8_t)v89, (int8x8_t)v76), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v75, v88), (int8x8_t)v75, (int8x8_t)v88)), 0);
            v91 = vmul_lane_f32(v90, v90, 1).f32[0];
            if (v91 >= 0.00000011921)
            {
              v92 = vmul_f32(vmaxnm_f32(vsub_f32((float32x2_t)vzip1_s32((int32x2_t)v89, (int32x2_t)v76), (float32x2_t)vzip1_s32((int32x2_t)v88, (int32x2_t)v75)), 0), vmaxnm_f32(vsub_f32((float32x2_t)vzip2_s32((int32x2_t)v89, (int32x2_t)v76), (float32x2_t)vzip2_s32((int32x2_t)v88, (int32x2_t)v75)), 0));
              if (v92.f32[0] >= v92.f32[1])
                v92.f32[0] = v92.f32[1];
              if (v92.f32[0] >= 0.00000011921)
                v81 = v91 / v92.f32[0];
              else
                v81 = 0.0;
            }
            if (v81 > 0.5)
              ++v69;
          }
          v74 += 64;
          --v73;
        }
        while (v73);
      }
      else
      {
        v69 = 0;
        v68 = 0;
      }
      v94 = v69 < 2 && v68 < 2;
      if (!v65)
      {
        v116 = *v21;
        *v21 = v116 + 1;
        *(_DWORD *)(v29 + 4 * v116) = v28;
        v117 = &a1[431 * v36];
        v46 = v117[128] + 1;
        v117[128] = v46;
        v118 = v55[2];
        if (v118 < 9 && ((0x13Fu >> v118) & 1) != 0)
        {
          v48 = dword_2359151EC[v118];
        }
        else if ((v118 & 0xFFFFFFFE) == 0xA)
        {
          v48 = 6;
        }
        else
        {
          v48 = 5;
        }
LABEL_128:
        if (v46 < *(_DWORD *)(a8 + 4 * v48 + 60))
          v35 = 1;
        else
          v35 = 2;
        a1[431 * v36 + 132] = v35;
        goto LABEL_19;
      }
      a1[431 * v36 + 128] = 0;
      if (!*(_BYTE *)(a8 + 176))
        goto LABEL_126;
      v95 = *(_QWORD *)v55;
      memcpy(&a1[431 * v36], (const void *)(a3 + (v28 << 9)), 0x200uLL);
      v96 = 0;
      v55[112] = 0;
      a1[431 * v36 + 131] = *(_DWORD *)(a13 + 4 * v28);
      v97.i64[0] = *(_QWORD *)(v55 + 3);
      v98 = vadd_f32(*(float32x2_t *)v97.f32, *(float32x2_t *)(v55 + 5));
      v99 = vsub_f32(v98, *(float32x2_t *)v97.f32);
      v100 = vcgtz_f32(v99);
      *(_QWORD *)v55 = v95;
      v101 = v99.f32[1];
      if ((v100.i8[4] & 1) == 0)
        v101 = 0.0;
      if ((v100.i8[0] & 1) == 0)
        v99.f32[0] = 0.0;
      v102 = v99.f32[0] * v101;
      v103 = *(float *)(a7 + 68);
      v105 = v137;
      v104 = v138;
      do
      {
        v107 = v105[-1];
        v108 = vadd_f32(v107, *v105);
        v109 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v108, v98), (int8x8_t)v98, (int8x8_t)v108), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v107, *(float32x2_t *)v97.f32), (int8x8_t)v107, *(int8x8_t *)v97.f32)), 0);
        v110 = vmul_lane_f32(v109, v109, 1).f32[0];
        if (v110 >= 0.00000011921)
        {
          v112 = vsub_f32(v108, v107);
          v113 = (float)(v102 + (float)(fmaxf(v112.f32[0], 0.0) * fmaxf(v112.f32[1], 0.0))) - v110;
          if (v113 >= 0.00000011921)
            v114 = v110 / v113;
          else
            v114 = 0.0;
          if (v114 < v103)
          {
LABEL_91:
            v106 = 0;
            goto LABEL_92;
          }
          v115 = fmaxf(v112.f32[0], 0.0) * fmaxf(v112.f32[1], 0.0);
          if (v102 < v115)
            v115 = v102;
          v111 = v110 / v115;
          if (v115 < 0.00000011921)
            v111 = 0.0;
        }
        else
        {
          v111 = 0.0;
          if (v103 > 0.0)
            goto LABEL_91;
        }
        v106 = v111 >= *(float *)(a7 + 72);
LABEL_92:
        v96 += v106;
        v105 += 64;
        --v104;
      }
      while (v104);
      if (*(_BYTE *)(a7 + 66))
        v119 = v94;
      else
        v119 = 1;
      if (*(_BYTE *)(a7 + 67))
        v120 = v96 >= 2;
      else
        v120 = 0;
      v121 = !v120;
      result = v143;
      a6 = v144;
      if (v119 == 1 && (v121 & 1) != 0)
      {
        v122 = (float32x4_t *)&a1[431 * v36];
        updateEmbeddedFeat((float32x4_t *)v56, v122 + 55, 0x40u, *(double *)v97.i64);
        result = v143;
        a6 = v144;
        v97 = *(float32x4_t *)(v145 + (v28 << 9) + 12);
        v122[104] = v97;
      }
      v97.f32[0] = (float)*v146;
      v123 = (float *)&a1[431 * v36];
      a8 = v139;
      a3 = v145;
      v34 = 10.0;
      if (v123[412] < v97.f32[0])
      {
        v124 = *(float32x4_t *)v56;
        v125 = *(_OWORD *)(v56 + 16);
        v126 = *(_OWORD *)(v56 + 48);
        *(_OWORD *)&a1[431 * v36 + 292] = *(_OWORD *)(v56 + 32);
        *(_OWORD *)&a1[431 * v36 + 296] = v126;
        *(float32x4_t *)&a1[431 * v36 + 284] = v124;
        *(_OWORD *)&a1[431 * v36 + 288] = v125;
        v127 = *(_OWORD *)(v56 + 64);
        v128 = *(_OWORD *)(v56 + 80);
        v129 = *(_OWORD *)(v56 + 112);
        *(_OWORD *)&a1[431 * v36 + 308] = *(_OWORD *)(v56 + 96);
        *(_OWORD *)&a1[431 * v36 + 312] = v129;
        *(_OWORD *)&a1[431 * v36 + 300] = v127;
        *(_OWORD *)&a1[431 * v36 + 304] = v128;
        v130 = *(_OWORD *)(v56 + 128);
        v131 = *(_OWORD *)(v56 + 144);
        v132 = *(_OWORD *)(v56 + 176);
        *(_OWORD *)&a1[431 * v36 + 324] = *(_OWORD *)(v56 + 160);
        *(_OWORD *)&a1[431 * v36 + 328] = v132;
        *(_OWORD *)&a1[431 * v36 + 316] = v130;
        *(_OWORD *)&a1[431 * v36 + 320] = v131;
        v97 = *(float32x4_t *)(v56 + 192);
        v133 = *(_OWORD *)(v56 + 208);
        v134 = *(_OWORD *)(v56 + 240);
        *(_OWORD *)&a1[431 * v36 + 340] = *(_OWORD *)(v56 + 224);
        *(_OWORD *)&a1[431 * v36 + 344] = v134;
        *(float32x4_t *)&a1[431 * v36 + 332] = v97;
        *(_OWORD *)&a1[431 * v36 + 336] = v133;
        v97.f32[0] = (float)*v146;
        v123[412] = v97.f32[0];
      }
      v135 = &a1[431 * v36];
      v135[413] = 0;
      a5 = v142;
      v19 = a2;
      v32 = a17;
      v21 = a10;
      v31 = v140;
      v29 = a9;
      if (!(v135[130] % *(_DWORD *)(a7 + 60)))
      {
        v136 = (float32x4_t *)&a1[431 * v36];
        updateEmbeddedFeat((float32x4_t *)v56, v136 + 87, 0x40u, *(double *)v97.i64);
        v31 = v140;
        v29 = a9;
        v32 = a17;
        v21 = a10;
        result = v143;
        a6 = v144;
        v19 = a2;
        a3 = v145;
        a5 = v142;
        v136[105] = *(float32x4_t *)(v145 + (v28 << 9) + 12);
      }
LABEL_126:
      *(_DWORD *)(a11 + 4 * v28) = v36;
LABEL_19:
      ++v28;
      v33 += 512;
      if (v28 == result)
        return result;
    }
    v44 = *(float *)(a3 + (v28 << 9) + 20);
LABEL_42:
    v52 = a1[431 * v36 + 128];
    if (v52 && (float)((float)(v44 * v42) / (float)((float)(a15 * a14) + 0.0001)) < *(float *)(a7 + 92))
      v37 = fminf((float)(fmaxf((float)(v52 - 30) / 30.0, 0.0) * 0.25) + 0.4, 0.9);
    goto LABEL_45;
  }
  return result;
}

uint64_t acTrkObjectIoUAssocCore(_DWORD *a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, unsigned int *a10, uint64_t a11, uint64_t a12, void *__dst, uint64_t a14, uint64_t a15, unsigned int a16)
{
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
  _DWORD *v25;
  uint64_t v26;
  uint64_t v27;
  _DWORD *v28;
  uint64_t v29;
  unsigned int v30;
  unint64_t v31;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _DWORD *v39;
  float32x2_t *v40;
  int *v41;
  uint64_t v42;
  unsigned int v43;
  int *v44;
  int v45;
  _DWORD *v46;
  unsigned int v47;
  uint64_t v48;
  float v49;
  _DWORD *v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  uint64_t v58;
  float v59;
  float v60;
  float32x2_t *v61;
  float v62;
  uint64_t v63;
  float32x2_t *v64;
  float v65;
  float32x2_t v66;
  float32x2_t v67;
  float32x2_t v68;
  float32x2_t v69;
  float32x2_t v70;
  float v71;
  float v72;
  float v73;
  float32x2_t v74;
  float32x2_t v75;
  float32x2_t v76;
  float32x2_t v77;
  float v78;
  float32x2_t v79;
  float32x2_t v80;
  float v81;
  float32x2_t v82;
  float v83;
  _BOOL4 v84;
  int v85;
  uint64_t v86;
  unsigned int v87;
  _DWORD *v88;
  float32x2_t v89;
  float32x2_t v90;
  float32x2_t v91;
  int32x2_t v92;
  float v93;
  float v94;
  float v95;
  uint64_t v96;
  float32x2_t *v97;
  int v98;
  float32x2_t v99;
  float32x2_t v100;
  float32x2_t v101;
  float v102;
  float v103;
  float32x2_t v104;
  float v105;
  float v106;
  float v107;
  char v108;
  BOOL v109;
  uint64_t v110;
  unsigned int *v111;
  unsigned int v112;
  float *v113;
  float32x4_t v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  int v126;
  uint64_t v127;
  int *v128;
  int v129;
  int v130;
  BOOL v131;
  float32x2_t *v132;
  _DWORD *v133;
  unint64_t v134;
  uint64_t v135;
  uint64_t v136;
  unsigned int v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  float *v141;
  uint64_t v142;

  v22 = *a10;
  result = (uint64_t)memcpy(__dst, a9, 4 * v22);
  if (!a2)
    goto LABEL_9;
  if (a2 == 1)
  {
    v24 = 0;
  }
  else
  {
    v24 = a2 & 0xFFFFFFFE;
    v25 = a1;
    v26 = v24;
    do
    {
      v25[132] = 0;
      v25[563] = 0;
      v25[112] = 1;
      v25[543] = 1;
      v25 += 862;
      v26 -= 2;
    }
    while (v26);
    if (v24 == a2)
      goto LABEL_9;
  }
  v27 = a2 - v24;
  v28 = &a1[431 * v24 + 112];
  do
  {
    v28[20] = 0;
    *v28 = 1;
    v28 += 431;
    --v27;
  }
  while (v27);
LABEL_9:
  if (a2 <= a4)
    v29 = a4;
  else
    v29 = a2;
  if ((_DWORD)v29)
  {
    v30 = v22;
    if (*a10)
    {
      v142 = a6;
      v140 = a7;
      v31 = 0;
      result = a16;
      if (a4 <= 1)
        v34 = 1;
      else
        v34 = a4;
      v35 = a4;
      v37 = a3;
      v36 = a8;
      v38 = a3 + 136;
      v39 = a1 + 285;
      v40 = (float32x2_t *)(a15 + 12);
      v41 = (int *)__dst;
      while (1)
      {
        v42 = *a10;
        if (!(_DWORD)v42)
          goto LABEL_20;
        v43 = *(_DWORD *)(a5 + 4 * v31);
        v44 = (int *)a9;
        while (1)
        {
          v45 = *v44++;
          if (v31 == v45)
            break;
          if (!--v42)
            goto LABEL_20;
        }
        if (v43 < a2)
        {
          v46 = &a1[431 * v43];
          v47 = v46[128] - 1;
          if (v47 < *(_DWORD *)(v36 + 24) && v31 < v35)
          {
            v48 = 0;
            v49 = *(float *)(v36 + 8) + (float)((float)v47 * 0.2);
            v141 = (float *)(v37 + (v31 << 9) + 132);
            v50 = &v39[431 * v43];
            v51 = 0.0;
            v52 = 0.0;
            v53 = 0.0;
            do
            {
              v54 = *(float *)(v38 + v48 * 4 - 4);
              v55 = *(float *)(v38 + v48 * 4);
              v56 = *(float *)&v50[v48 - 1];
              v57 = *(float *)&v50[v48];
              v51 = (float)(v51 + (float)(v56 * v56)) + (float)(v57 * v57);
              v52 = (float)(v52 + (float)(v54 * v54)) + (float)(v55 * v55);
              v53 = (float)(v53 + (float)(v54 * v56)) + (float)(v55 * v57);
              v48 += 2;
            }
            while (v48 != 64);
            v58 = v37 + (v31 << 9);
            v59 = 1.0 - (float)(v53 / (float)((float)(sqrtf(v52) * sqrtf(v51)) + 0.00001));
            v60 = v59 <= 0.0 ? 1.0 : 1.0 - v59;
            if ((_DWORD)result)
            {
              v61 = (float32x2_t *)(v58 + 12);
              v62 = 0.0;
              v63 = result;
              v64 = v40;
              v65 = 0.0;
              do
              {
                if (v64[-1].i32[1] == 1)
                {
                  v66 = *v64;
                  v67 = vadd_f32(*v64, v64[1]);
                  v68 = *(float32x2_t *)(v46 + 3);
                  v69 = vadd_f32(v68, *(float32x2_t *)(v46 + 5));
                  v70 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v67, v69), (int8x8_t)v69, (int8x8_t)v67), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*v64, v68), (int8x8_t)*v64, (int8x8_t)v68)), 0);
                  v71 = vmul_lane_f32(v70, v70, 1).f32[0];
                  v72 = 0.0;
                  v73 = 0.0;
                  if (v71 >= 0.00000011921)
                  {
                    v74 = vmaxnm_f32(vsub_f32(v67, v66), 0);
                    v75 = vsub_f32(v69, v68);
                    v76 = (float32x2_t)vdup_lane_s32((int32x2_t)v74, 0);
                    v76.i32[0] = fmaxf(v75.f32[0], 0.0);
                    v74.i32[0] = fmaxf(v75.f32[1], 0.0);
                    v77 = vmul_f32(v76, v74);
                    if (v77.f32[0] >= v77.f32[1])
                      v77.f32[0] = v77.f32[1];
                    v78 = v71 / v77.f32[0];
                    if (v77.f32[0] >= 0.00000011921)
                      v73 = v78;
                    else
                      v73 = 0.0;
                  }
                  v79 = vadd_f32(*v61, *(float32x2_t *)(v58 + 20));
                  v80 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v67, v79), (int8x8_t)v79, (int8x8_t)v67), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v66, *v61), (int8x8_t)v66, (int8x8_t)*v61)), 0);
                  v81 = vmul_lane_f32(v80, v80, 1).f32[0];
                  if (v81 >= 0.00000011921)
                  {
                    v82 = vmul_f32(vmaxnm_f32(vsub_f32((float32x2_t)vzip1_s32((int32x2_t)v79, (int32x2_t)v67), (float32x2_t)vzip1_s32((int32x2_t)*v61, (int32x2_t)v66)), 0), vmaxnm_f32(vsub_f32((float32x2_t)vzip2_s32((int32x2_t)v79, (int32x2_t)v67), (float32x2_t)vzip2_s32((int32x2_t)*v61, (int32x2_t)v66)), 0));
                    if (v82.f32[0] >= v82.f32[1])
                      v82.f32[0] = v82.f32[1];
                    if (v82.f32[0] >= 0.00000011921)
                      v72 = v81 / v82.f32[0];
                    else
                      v72 = 0.0;
                  }
                  if (v73 > 0.5)
                    v65 = v65 + 1.0;
                  if (v72 > 0.5)
                    v62 = v62 + 1.0;
                }
                v64 += 64;
                --v63;
              }
              while (v63);
            }
            else
            {
              v65 = 0.0;
              v62 = 0.0;
            }
            v83 = fminf(v49, 1.0);
            v84 = v65 < 2.0 && v62 < 2.0;
            if ((float)(1.0 - *(float *)(v142 + 4 * (v31 + v43 * (_DWORD)v29))) >= v83)
            {
              v85 = v60 >= *(float *)(v36 + 28) || v84;
              if (v85 == 1)
                break;
            }
          }
        }
LABEL_20:
        ++v31;
        v38 += 512;
        if (v31 == v29)
          goto LABEL_19;
      }
      v46[128] = 0;
      if (!*(_BYTE *)(v140 + 176))
        goto LABEL_94;
      v131 = v84;
      v132 = v40;
      v133 = v39;
      v134 = v35;
      v135 = a11;
      v136 = result;
      v137 = v30;
      v86 = *(_QWORD *)v46;
      v138 = v34;
      v139 = a14;
      memcpy(&a1[431 * v43], (const void *)v58, 0x200uLL);
      v34 = v138;
      a14 = v139;
      v36 = a8;
      v87 = 0;
      v46[112] = 0;
      *(_QWORD *)v46 = v86;
      v88 = &a1[431 * v43];
      v88[132] = 0;
      v89 = *(float32x2_t *)(v46 + 3);
      v90 = vadd_f32(v89, *(float32x2_t *)(v46 + 5));
      v91 = vsub_f32(v90, v89);
      v92 = vcgtz_f32(v91);
      v88[131] = *(_DWORD *)(v139 + 4 * v31);
      v93 = v91.f32[1];
      if ((v92.i8[4] & 1) == 0)
        v93 = 0.0;
      if ((v92.i8[0] & 1) == 0)
        v91.f32[0] = 0.0;
      v94 = v91.f32[0] * v93;
      v95 = *(float *)(a8 + 80);
      v96 = v138;
      v97 = (float32x2_t *)(a3 + 20);
      while (1)
      {
        v99 = v97[-1];
        v100 = vadd_f32(v99, *v97);
        v101 = vmaxnm_f32(vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v100, v90), (int8x8_t)v90, (int8x8_t)v100), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v99, v89), (int8x8_t)v99, (int8x8_t)v89)), 0);
        v102 = vmul_lane_f32(v101, v101, 1).f32[0];
        if (v102 >= 0.00000011921)
        {
          v104 = vsub_f32(v100, v99);
          v105 = (float)(v94 + (float)(fmaxf(v104.f32[0], 0.0) * fmaxf(v104.f32[1], 0.0))) - v102;
          if (v105 >= 0.00000011921)
            v106 = v102 / v105;
          else
            v106 = 0.0;
          if (v106 >= v95)
          {
            v107 = fmaxf(v104.f32[0], 0.0) * fmaxf(v104.f32[1], 0.0);
            if (v94 < v107)
              v107 = v94;
            v103 = v102 / v107;
            if (v107 < 0.00000011921)
              v103 = 0.0;
LABEL_82:
            v98 = v103 >= *(float *)(a8 + 84);
            goto LABEL_70;
          }
        }
        else
        {
          v103 = 0.0;
          if (v95 <= 0.0)
            goto LABEL_82;
        }
        v98 = 0;
LABEL_70:
        v87 += v98;
        v97 += 64;
        if (!--v96)
        {
          v108 = v131;
          if (!*(_BYTE *)(a8 + 78))
            v108 = 1;
          v109 = v87 < 2 || *(_BYTE *)(a8 + 77) == 0;
          v37 = a3;
          if (v109 && (v108 & 1) != 0)
          {
            updateEmbeddedFeat((float32x4_t *)v141, (float32x4_t *)&a1[431 * v43 + 220], 0x40u, *(double *)&v89);
            v34 = v138;
            a14 = v139;
            v37 = a3;
            v36 = a8;
            *(_OWORD *)&a1[431 * v43 + 416] = *(_OWORD *)(a3 + (v31 << 9) + 12);
          }
          v110 = v37 + (v31 << 9);
          v112 = *(_DWORD *)(v110 + 28);
          v111 = (unsigned int *)(v110 + 28);
          v113 = (float *)&a1[431 * v43];
          result = v136;
          v30 = v137;
          v41 = (int *)__dst;
          v35 = v134;
          a11 = v135;
          v40 = v132;
          v39 = v133;
          if (v113[412] < (float)v112)
          {
            v114 = *(float32x4_t *)v141;
            v115 = *((_OWORD *)v141 + 1);
            v116 = *((_OWORD *)v141 + 3);
            *(_OWORD *)&a1[431 * v43 + 292] = *((_OWORD *)v141 + 2);
            *(_OWORD *)&a1[431 * v43 + 296] = v116;
            *(float32x4_t *)&a1[431 * v43 + 284] = v114;
            *(_OWORD *)&a1[431 * v43 + 288] = v115;
            v117 = *((_OWORD *)v141 + 4);
            v118 = *((_OWORD *)v141 + 5);
            v119 = *((_OWORD *)v141 + 7);
            *(_OWORD *)&a1[431 * v43 + 308] = *((_OWORD *)v141 + 6);
            *(_OWORD *)&a1[431 * v43 + 312] = v119;
            *(_OWORD *)&a1[431 * v43 + 300] = v117;
            *(_OWORD *)&a1[431 * v43 + 304] = v118;
            v120 = *((_OWORD *)v141 + 8);
            v121 = *((_OWORD *)v141 + 9);
            v122 = *((_OWORD *)v141 + 11);
            *(_OWORD *)&a1[431 * v43 + 324] = *((_OWORD *)v141 + 10);
            *(_OWORD *)&a1[431 * v43 + 328] = v122;
            *(_OWORD *)&a1[431 * v43 + 316] = v120;
            *(_OWORD *)&a1[431 * v43 + 320] = v121;
            v123 = *((_OWORD *)v141 + 12);
            v124 = *((_OWORD *)v141 + 13);
            v125 = *((_OWORD *)v141 + 15);
            *(_OWORD *)&a1[431 * v43 + 340] = *((_OWORD *)v141 + 14);
            *(_OWORD *)&a1[431 * v43 + 344] = v125;
            *(_OWORD *)&a1[431 * v43 + 332] = v123;
            *(_OWORD *)&a1[431 * v43 + 336] = v124;
            v113[412] = (float)*v111;
          }
LABEL_94:
          *(_DWORD *)(a11 + 4 * v31) = v43;
          if (v30)
          {
            v126 = 0;
            v127 = v30;
            v128 = v41;
            do
            {
              v130 = *v128++;
              v129 = v130;
              if (v31 != v130)
                v41[v126++] = v129;
              --v127;
            }
            while (v127);
          }
          --v30;
          goto LABEL_20;
        }
      }
    }
  }
  else
  {
    v30 = v22;
  }
LABEL_19:
  *a10 = v30;
  return result;
}

double AcSaliencyNode::AcSaliencyNode(uint64_t a1, uint64_t a2)
{
  double result;

  *(_DWORD *)(a1 + 128) = 0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_BYTE *)(a1 + 184) = 0;
  *(_DWORD *)(a2 + 8) = 0;
  *(_QWORD *)&result = 0xDE7C00000001;
  *(_QWORD *)a2 = 0xDE7C00000001;
  return result;
}

{
  double result;

  *(_DWORD *)(a1 + 128) = 0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_BYTE *)(a1 + 184) = 0;
  *(_DWORD *)(a2 + 8) = 0;
  *(_QWORD *)&result = 0xDE7C00000001;
  *(_QWORD *)a2 = 0xDE7C00000001;
  return result;
}

void AcSaliencyNode::~AcSaliencyNode(AcSaliencyNode *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 17);
  if (v2)
  {
    MEMORY[0x23B7DA6CC](v2, 0x1000C8077774924);
    *((_QWORD *)this + 17) = 0;
  }
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 17);
  if (v2)
  {
    MEMORY[0x23B7DA6CC](v2, 0x1000C8077774924);
    *((_QWORD *)this + 17) = 0;
  }
}

uint64_t AcSaliencyNode::init(uint64_t a1, _DWORD *a2)
{
  int v3;
  uint64_t v6;
  uint64_t result;

  if (*a2 != 1)
    return 4294967289;
  v3 = a2[1];
  if (v3 != 56956 && v3 != 56945)
    return 4294967292;
  *(_DWORD *)(a1 + 128) = 1045220557;
  *(_OWORD *)(a1 + 64) = xmmword_235915640;
  *(_OWORD *)(a1 + 80) = unk_235915650;
  *(_OWORD *)(a1 + 96) = xmmword_235915660;
  *(_OWORD *)(a1 + 112) = unk_235915670;
  *(_OWORD *)a1 = kAcSaliencyNodeConfigDefaultRawData;
  *(_OWORD *)(a1 + 16) = unk_235915610;
  *(_OWORD *)(a1 + 32) = xmmword_235915620;
  strcpy((char *)(a1 + 48), "saliency@output");
  *(_DWORD *)(a1 + 144) = 51604;
  v6 = operator new[]();
  result = 0;
  *(_QWORD *)(a1 + 136) = v6;
  *(_QWORD *)(a2 + 1) = 0xDE70000DE71;
  *(_QWORD *)(a1 + 178) = 0;
  *(_OWORD *)(a1 + 164) = 0u;
  *(_OWORD *)(a1 + 148) = 0u;
  return result;
}

void AcSaliencyNode::postProcess(uint64_t a1, uint64_t *a2, int a3, _DWORD *a4, uint64_t a5)
{
  int v8;
  double v9;
  float v10;
  double v11;
  float v12;

  if (*a4 == 1 && a3 == 1 && a4[1] == 56945)
  {
    *(_DWORD *)(a5 + 21024) = 3145792;
    *(_WORD *)(a5 + 21028) = 64;
    std::chrono::steady_clock::now();
    AcSaliencyNode::postProcessSaliency(a1, a2, 1, v8, a5, v9, v10, v11, v12);
  }
}

__n128 AcSaliencyNode::postProcessSaliency(uint64_t a1, uint64_t *a2, int a3, int a4, uint64_t a5, double a6, float a7, double a8, float a9)
{
  uint64_t v9;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  unsigned __int16 v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  float v22;
  int v23;
  unsigned int v24;
  int v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  unsigned int v34;
  BOOL v35;
  __n128 result;
  __int128 v37;
  uint64_t v38;
  unsigned int v39;
  int v40;
  int v41;
  int v42;

  v9 = a5 + 17912;
  *(_DWORD *)(a5 + 17912) = 0;
  if (a3)
  {
    v13 = a5 + 17952;
    v14 = *(unsigned __int16 *)(a5 + 21026);
    if (*(_WORD *)(a5 + 21026))
    {
      v15 = 0;
      v16 = *a2;
      v17 = *(_WORD *)(a5 + 21024);
      LOWORD(v18) = v17;
      v19 = a5 + 17952;
      do
      {
        if ((_WORD)v18)
        {
          v21 = 0;
          do
          {
            LOWORD(a7) = *(_WORD *)(a5 + 21026);
            v22 = *(float *)(v16
                           + 4
                           * ((float)((float)(*((_DWORD *)a2 + 3) * v21)
                                                  / (float)(unsigned __int16)v18)
                            + *((_DWORD *)a2 + 3)
                            * (float)((float)(*((_DWORD *)a2 + 2) * v15) / (float)LODWORD(a7))))
                * *(float *)(a1 + 44);
            a7 = v22 * 255.0;
            v23 = (int)(float)(v22 * 255.0);
            if (v22 <= 0.0)
              LOBYTE(v23) = 0;
            *(_BYTE *)(v19 + v21++) = v23;
            v18 = *(unsigned __int16 *)(a5 + 21024);
          }
          while (v21 < v18);
          v14 = *(unsigned __int16 *)(a5 + 21026);
          v17 = *(_WORD *)(a5 + 21024);
        }
        else
        {
          LOWORD(v18) = 0;
        }
        v20 = *(unsigned __int16 *)(a5 + 21028);
        v19 += v20;
        ++v15;
      }
      while (v15 < v14);
    }
    else
    {
      v17 = *(_WORD *)(a5 + 21024);
      LODWORD(v20) = *(unsigned __int16 *)(a5 + 21028);
    }
    *(_BYTE *)(a5 + 21030) = 1;
    v38 = a5 + 17952;
    v39 = v14;
    v40 = v17;
    v41 = v20;
    v42 = 1;
    if (*(_BYTE *)(a1 + 184))
    {
      convertSaliencyMapToBoundingBoxes((uint64_t)&v38, a5, *(char **)(a1 + 136), *(_DWORD *)(a1 + 144), *(unsigned __int8 *)(a1 + 124), a1 + 148, 50, *(float *)(a1 + 112), *(float *)(a1 + 116));
      v14 = *(unsigned __int16 *)(v9 + 3114);
    }
    if (v14)
    {
      v24 = 0;
      v25 = 0;
      v26 = *a2;
      LOWORD(v27) = *(_WORD *)(v9 + 3112);
      do
      {
        if ((_WORD)v27)
        {
          v28 = 0;
          v29 = (float)v24;
          do
          {
            LOWORD(a9) = *(_WORD *)(v9 + 3114);
            v30 = *(float *)(v26
                           + 4
                           * ((float)((float)(*((_DWORD *)a2 + 3) * v28)
                                                  / (float)(unsigned __int16)v27)
                            + *((_DWORD *)a2 + 3)
                            * (float)((float)(*((_DWORD *)a2 + 2) * v24) / (float)LODWORD(a9))))
                * *(float *)(a1 + 44);
            v31 = (float)(v30 - *(float *)(a1 + 120)) / (float)(1.0 - *(float *)(a1 + 120));
            v32 = 0.0;
            if (v31 >= 0.0)
            {
              v32 = (float)(v30 - *(float *)(a1 + 120)) / (float)(1.0 - *(float *)(a1 + 120));
              if (v31 > 1.0)
                v32 = 1.0;
            }
            *(_BYTE *)(v13 + v28) = (int)(float)(v32 * 255.0);
            a9 = *(float *)(v9 + 20);
            if (a9 <= v29)
            {
              v33 = *(float *)(v9 + 16);
              if (v33 <= (float)v28 && (float)(v33 + *(float *)(v9 + 24)) > (float)v28)
              {
                a9 = a9 + *(float *)(v9 + 28);
                if (a9 > v29)
                {
                  v34 = 1132396544;
                  LOBYTE(v34) = *(_BYTE *)(a1 + 125);
                  a9 = (float)v34;
                  if ((float)(v30 * 255.0) > a9)
                    ++v25;
                }
              }
            }
            ++v28;
            v27 = *(unsigned __int16 *)(v9 + 3112);
          }
          while (v28 < v27);
          v14 = *(unsigned __int16 *)(v9 + 3114);
        }
        else
        {
          LOWORD(v27) = 0;
        }
        v13 += *(unsigned __int16 *)(v9 + 3116);
        ++v24;
      }
      while (v24 < v14);
    }
    else
    {
      v25 = 0;
    }
    *(_DWORD *)(v9 + 32) = v25;
    if (*(_DWORD *)v9)
      v35 = v25 == 0;
    else
      v35 = 1;
    if (v35)
    {
      *(_QWORD *)(v9 + 32) = 0;
      *(_OWORD *)v9 = 0u;
      *(_OWORD *)(v9 + 16) = 0u;
    }
    result = *(__n128 *)(a5 + 17916);
    v37 = *(_OWORD *)(a5 + 17932);
    *(_DWORD *)(a1 + 180) = *(_DWORD *)(a5 + 17948);
    *(_OWORD *)(a1 + 164) = v37;
    *(__n128 *)(a1 + 148) = result;
  }
  else
  {
    *(_BYTE *)(a5 + 21030) = 0;
  }
  return result;
}

uint64_t AcSaliencyNode::getParams(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  __int128 v5;
  uint64_t result;

  if (*a2 != 1)
    return 4294967289;
  if (a2[1] != 56945)
    return 4294967292;
  v5 = *(_OWORD *)(a1 + 20);
  *(_QWORD *)(a3 + 640) = *(_QWORD *)(a1 + 36);
  *(_OWORD *)(a3 + 624) = v5;
  strncpy((char *)(a3 + 2312), (const char *)(a1 + 48), 0x40uLL);
  result = 0;
  *(_DWORD *)(a3 + 640) = *(_DWORD *)(a1 + 44);
  return result;
}

uint64_t AcSaliencyNode::computeConfidence(AcSaliencyNode *this, float a2)
{
  return (float)(powf(a2, *((float *)this + 32)) * 1000.0);
}

uint64_t acAssoPostProcess(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8;
  uint64_t v10;
  int *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  float v18;
  float v19;
  float v20;
  float v21;
  int v22;
  __int128 v24;
  uint64_t v25;

  if (a1)
  {
    if (!*(_QWORD *)a1)
      return 4294967292;
    v8 = *(_QWORD *)(a1 + 8);
    if (!v8 || !*(_QWORD *)(a1 + 16) || !*(_QWORD *)(a1 + 24))
      return 4294967292;
    v10 = 4294967292;
    if (a2 && a4 && a5)
    {
      v13 = (int *)(a5 + 51740);
      if (*(_BYTE *)(a2 + 20) != 1)
      {
LABEL_13:
        v14 = a5 + 12;
        v10 = AcAssoNode::associationPreProc(v8, *(_DWORD *)a2, *(_DWORD *)(a2 + 4), *(_DWORD *)(a2 + 16), a2, (_DWORD *)(a1 + 32), a7, (_DWORD *)(a5 + 12));
        if (!(_DWORD)v10)
        {
          v15 = *(_QWORD *)(a1 + 8);
          v16 = *(_DWORD *)a2;
          v17 = *(_DWORD *)(a2 + 4);
          v18 = *(float *)(a2 + 24);
          v19 = *(float *)(a2 + 28);
          v20 = *(float *)(a2 + 32);
          v21 = *(float *)(a2 + 36);
          v22 = *v13;
          v24 = *(_OWORD *)a3;
          v25 = *(_QWORD *)(a3 + 16);
          v10 = AcAssoNode::associationPostProc(v15, v16, v17, v22, &v24, v14, a1 + 32, (uint64_t)a4, v18, v19, v20, v21);
          if (!(_DWORD)v10)
          {
            if (*a4 <= 3u)
              return 0;
            else
              return 4294967292;
          }
        }
        return v10;
      }
      if (*(_DWORD *)(a5 + 12) == 1 && (*(_DWORD *)(a5 + 16) | 8) == 0x721C9)
      {
        *v13 = 0;
        *(_DWORD *)(a5 + 202376) = 0;
        *(_QWORD *)(a5 + 202384) = 0xBF80000000000000;
        *(_DWORD *)(a5 + 103464) = 0;
        *(_DWORD *)(a5 + 119068) = 0;
        *(_DWORD *)(a5 + 134672) = 0;
        *(_DWORD *)(a5 + 186396) = 0;
        *(_DWORD *)(a5 + 202000) = 0;
        *(_BYTE *)(v8 + 748) = 0;
        goto LABEL_13;
      }
      return 4294967289;
    }
    return v10;
  }
  return 4294967292;
}

uint64_t AcANSTCreate(AcDetNode ***a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  AcDetNode **v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v10;
  AcDetNode *v11;
  uint64_t v12;
  uint64_t v13;
  AcDetNode *v14;

  v3 = 4294967292;
  if (a1 && a2)
  {
    v6 = (AcDetNode **)operator new();
    bzero(v6, 0xC718uLL);
    v7 = operator new();
    *(_QWORD *)(v7 + 250240) = 0;
    bzero((void *)v7, 0x58FuLL);
    *(_OWORD *)(v7 + 1440) = 0u;
    *(_OWORD *)(v7 + 1424) = 0u;
    *(_DWORD *)(a3 + 8) = 0;
    *(_QWORD *)a3 = 0xDE7C00000002;
    *v6 = (AcDetNode *)v7;
    v8 = AcDetNode::init(v7, 0, (_DWORD *)a3);
    if ((_DWORD)v8)
    {
      v3 = v8;
      AcDetNode::~AcDetNode((AcDetNode *)v7);
    }
    else
    {
      v10 = (_BYTE *)operator new();
      bzero(v10, 0x2ECuLL);
      *(_QWORD *)(a3 + 12) = 0x721CC00000001;
      v10[1472] = 0;
      v6[1] = (AcDetNode *)v10;
      v3 = AcAssoNode::sec_init((uint64_t)v10, a3 + 12);
      if (!(_DWORD)v3)
      {
        v12 = a3 + 202392;
        bzero(v6 + 4, 0xC6F8uLL);
        v13 = operator new();
        *(_BYTE *)(v13 + 184) = 0;
        *(_DWORD *)(v12 + 8) = 0;
        *(_QWORD *)v12 = 0xDE7C00000001;
        v6[2] = (AcDetNode *)v13;
        *(_DWORD *)(v13 + 128) = 1045220557;
        *(_OWORD *)v13 = kAcSaliencyNodeConfigDefaultRawData;
        *(_OWORD *)(v13 + 16) = unk_235915610;
        *(_OWORD *)(v13 + 32) = xmmword_235915620;
        strcpy((char *)(v13 + 48), "saliency@output");
        *(_OWORD *)(v13 + 64) = xmmword_235915640;
        *(_OWORD *)(v13 + 80) = unk_235915650;
        *(_OWORD *)(v13 + 96) = xmmword_235915660;
        *(_OWORD *)(v13 + 112) = unk_235915670;
        *(_DWORD *)(v13 + 144) = 51604;
        *(_QWORD *)(v13 + 136) = operator new[]();
        *(_QWORD *)(v12 + 4) = 0xDE70000DE71;
        *(_OWORD *)(v13 + 148) = 0u;
        *(_OWORD *)(v13 + 164) = 0u;
        *(_QWORD *)(v13 + 178) = 0;
        v14 = (AcDetNode *)operator new();
        *(_QWORD *)(v12 + 12) = 0xDE7C00000001;
        v6[3] = v14;
        memcpy(v14, &kAcVisegNodeConfigDefaultRawData, 0x298uLL);
        *(_QWORD *)(v12 + 16) = 0xDE70000DE71;
        *a1 = v6;
        return v3;
      }
      if (*v6)
      {
        AcDetNode::~AcDetNode(*v6);
        MEMORY[0x23B7DA6E4]();
      }
      v11 = v6[1];
      if (!v11)
        goto LABEL_6;
      if (*(_QWORD *)v11)
      {
        MEMORY[0x23B7DA6CC](*(_QWORD *)v11, 0x1000C8077774924);
        *(_QWORD *)v11 = 0;
      }
    }
    MEMORY[0x23B7DA6E4]();
LABEL_6:
    MEMORY[0x23B7DA6E4](v6, 0x1020C40383DF02ELL);
  }
  return v3;
}

uint64_t AcANSTDestroy(uint64_t a1)
{
  AcDetNode *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (!a1)
    return 4294967292;
  v2 = *(AcDetNode **)a1;
  if (!v2 || !*(_QWORD *)(a1 + 8) || !*(_QWORD *)(a1 + 16) || !*(_QWORD *)(a1 + 24))
    return 4294967292;
  AcDetNode::~AcDetNode(v2);
  MEMORY[0x23B7DA6E4]();
  v3 = *(_QWORD **)(a1 + 8);
  if (v3)
  {
    if (*v3)
    {
      MEMORY[0x23B7DA6CC](*v3, 0x1000C8077774924);
      *v3 = 0;
    }
    MEMORY[0x23B7DA6E4](v3, 0x1010C4009CF0F80);
  }
  v4 = *(_QWORD *)(a1 + 16);
  if (v4)
  {
    v5 = *(_QWORD *)(v4 + 136);
    if (v5)
    {
      MEMORY[0x23B7DA6CC](v5, 0x1000C8077774924);
      *(_QWORD *)(v4 + 136) = 0;
    }
    MEMORY[0x23B7DA6E4](v4, 0x1010C404CE027BELL);
  }
  v6 = *(_QWORD *)(a1 + 24);
  if (v6)
    MEMORY[0x23B7DA6E4](v6, 0x1000C40CA00EA9ELL);
  MEMORY[0x23B7DA6E4](a1, 0x1020C40383DF02ELL);
  return 0;
}

uint64_t AcANSTStart(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (!a1)
    return 4294967292;
  if (!*a1)
    return 4294967292;
  v2 = a1[1];
  if (!v2 || !a1[2] || !a1[3])
    return 4294967292;
  *(_WORD *)(*a1 + 1421) = 0;
  if (*(_DWORD *)(a2 + 12) != 1 || (*(_DWORD *)(a2 + 16) | 8) != 0x721C9)
    return 4294967289;
  result = 0;
  *(_DWORD *)(a2 + 51740) = 0;
  *(_DWORD *)(a2 + 202376) = 0;
  *(_QWORD *)(a2 + 202384) = 0xBF80000000000000;
  *(_DWORD *)(a2 + 103464) = 0;
  *(_DWORD *)(a2 + 119068) = 0;
  *(_DWORD *)(a2 + 134672) = 0;
  *(_DWORD *)(a2 + 186396) = 0;
  *(_DWORD *)(a2 + 202000) = 0;
  *(_BYTE *)(v2 + 748) = 0;
  return result;
}

uint64_t AcANSTStop(_QWORD *a1)
{
  uint64_t v2;
  uint64_t result;

  if (!a1 || !*a1 || !a1[1])
    return 4294967292;
  v2 = a1[2];
  result = 4294967292;
  if (v2)
  {
    if (a1[3])
      return 0;
    else
      return 4294967292;
  }
  return result;
}

uint64_t AcANSTGetParams(uint64_t *a1, _DWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v8;
  _DWORD *v9;
  uint64_t v10;
  __int128 v11;

  if (!a1)
    return 4294967292;
  v4 = *a1;
  if (!*a1 || !a1[1] || !a1[2] || !a1[3])
    return 4294967292;
  result = 4294967292;
  if (a2)
  {
    if (a3)
    {
      result = AcDetNode::getParams(v4, a2, a3);
      if (!(_DWORD)result)
      {
        v9 = a2 + 50598;
        AcVisegNode::getParams(a1[3], v8, a3);
        if (*v9 != 1)
          return 4294967289;
        if (v9[1] == 56945)
        {
          v10 = a1[2];
          v11 = *(_OWORD *)(v10 + 20);
          *(_QWORD *)(a3 + 640) = *(_QWORD *)(v10 + 36);
          *(_OWORD *)(a3 + 624) = v11;
          strncpy((char *)(a3 + 2312), (const char *)(v10 + 48), 0x40uLL);
          result = 0;
          *(_DWORD *)(a3 + 640) = *(_DWORD *)(v10 + 44);
          return result;
        }
        return 4294967292;
      }
    }
  }
  return result;
}

uint64_t AcANSTSetRunViSeg(_QWORD *a1, char a2)
{
  uint64_t v2;
  uint64_t result;

  if (!a1)
    return 4294967292;
  if (!*a1)
    return 4294967292;
  if (!a1[1])
    return 4294967292;
  if (!a1[2])
    return 4294967292;
  v2 = a1[3];
  if (!v2)
    return 4294967292;
  result = 0;
  *(_BYTE *)(v2 + 664) = a2;
  return result;
}

uint64_t AcANSTSetRunSaliency(_QWORD *a1, char a2)
{
  uint64_t v2;
  uint64_t result;

  if (!a1)
    return 4294967292;
  if (!*a1)
    return 4294967292;
  if (!a1[1])
    return 4294967292;
  v2 = a1[2];
  if (!v2 || !a1[3])
    return 4294967292;
  result = 0;
  *(_BYTE *)(v2 + 185) = a2;
  return result;
}

uint64_t AcANSTSetRunSaliencyObjectDetection(_QWORD *a1, char a2)
{
  uint64_t v2;
  uint64_t result;

  if (!a1)
    return 4294967292;
  if (!*a1)
    return 4294967292;
  if (!a1[1])
    return 4294967292;
  v2 = a1[2];
  if (!v2 || !a1[3])
    return 4294967292;
  result = 0;
  *(_BYTE *)(v2 + 184) = a2;
  return result;
}

uint64_t AcANSTGetProcedureId(AcANSTContext *a1, unsigned int *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t result;

  if (!a1)
    return 4294967292;
  if (!*(_QWORD *)a1)
    return 4294967292;
  if (!*((_QWORD *)a1 + 1))
    return 4294967292;
  v2 = *((_QWORD *)a1 + 2);
  if (!v2)
    return 4294967292;
  v3 = *((_QWORD *)a1 + 3);
  if (!v3)
    return 4294967292;
  v4 = 2 * *(unsigned __int8 *)(v3 + 664);
  *a2 = v4;
  result = 0;
  if (*(_BYTE *)(v2 + 185))
    *a2 = v4 | 1;
  return result;
}

uint64_t AcANSTPreProcessRef(uint64_t *a1, uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  vImagePixelCount v17;
  size_t v18;
  vImagePixelCount v19;
  vImagePixelCount v20;
  size_t v21;
  vImagePixelCount v22;
  _DWORD v23[600];
  vImage_Buffer dest;
  vImage_Buffer src;

  if (!a1)
    return 4294967292;
  v5 = *a1;
  if (!*a1)
    return 4294967292;
  if (!a1[1])
    return 4294967292;
  v6 = a1[2];
  if (!v6)
    return 4294967292;
  v7 = a1[3];
  if (!v7)
    return 4294967292;
  result = 4294967292;
  if (!a2)
    return result;
  if (!a4)
    return result;
  if (!a5)
    return result;
  v12 = *(void **)a3;
  if (!*(_QWORD *)a3)
    return result;
  v13 = *(void **)a5;
  if (!*(_QWORD *)a5)
    return result;
  result = AcDetNode::getParams(v5, a4, (uint64_t)v23);
  if ((_DWORD)result)
    return result;
  AcVisegNode::getParams(v7, v14, (uint64_t)v23);
  result = AcSaliencyNode::getParams(v6, a4 + 50598, (uint64_t)v23);
  if ((_DWORD)result)
    return result;
  v15 = *(unsigned int *)(a3 + 12);
  if ((v15 & 3) != 0)
    return 4294967292;
  v16 = *(unsigned int *)(a5 + 12);
  if ((_DWORD)v16 != 4 * v23[1])
    return 4294967292;
  v17 = *(unsigned int *)(a5 + 8);
  if ((_DWORD)v17 != v23[0])
    return 4294967292;
  v18 = *(unsigned int *)(a5 + 16);
  result = 4294967292;
  if (v18 >= v16 && (v18 & 0x3F) == 0)
  {
    v19 = v15 >> 2;
    v20 = *(unsigned int *)(a3 + 8);
    v21 = *(unsigned int *)(a3 + 16);
    v22 = v16 >> 2;
    bzero(v13, (v18 * v17));
    src.data = v12;
    src.height = v20;
    src.width = v19;
    src.rowBytes = v21;
    dest.data = v13;
    dest.height = v17;
    dest.width = v22;
    dest.rowBytes = v18;
    if (vImageScale_ARGB8888(&src, &dest, 0, 8u))
      return 4294967288;
    else
      return 0;
  }
  return result;
}

void AcANSTPostProcess(uint64_t *a1, uint32x2_t *a2, uint64_t *a3, _DWORD *a4, void *a5)
{
  uint64_t v5;
  unint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v12;
  uint64_t v15;
  int v16;
  unsigned int *v17;
  unint64_t v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE *v23;
  _BYTE *v24;
  int v25;
  int v26;
  int v27;
  unsigned int v28;
  _BYTE *v29;
  int v30;
  uint64_t v31;
  unint64_t v32;
  int *v33;
  int *v34;
  int v35;
  int v36;
  unsigned int v37;
  int v38;
  uint64_t v39;
  _BYTE v40[60];
  int v41;
  _BYTE *v42;
  uint64_t *v43;
  _QWORD *v44;
  _BYTE v45[12];
  int v46;
  uint64_t v47;
  _QWORD v48[5];

  v48[3] = *MEMORY[0x24BDAC8D0];
  v5 = *a3;
  if (*a3)
  {
    v7 = *((unsigned int *)a3 + 2);
    if ((_DWORD)v7)
    {
      v8 = *((unsigned int *)a3 + 28);
      if ((_DWORD)v8)
      {
        if (a1)
        {
          if (*a1)
          {
            if (a1[1])
            {
              v10 = a1[2];
              if (v10)
              {
                if (a4)
                {
                  v12 = a1[3];
                  if (v12)
                  {
                    if (!AcDetNode::getParams(*a1, a4, (uint64_t)v40))
                    {
                      AcVisegNode::getParams(v12, v15, (uint64_t)v40);
                      if (!AcSaliencyNode::getParams(v10, a4 + 50598, (uint64_t)v40))
                      {
                        v16 = *(unsigned __int8 *)(v10 + 185) | (2 * *(unsigned __int8 *)(v12 + 664));
                        v43 = 0;
                        v42 = 0;
                        v44 = 0;
                        v17 = (unsigned int *)a3 + 3;
                        if (v16 == 1)
                        {
                          v18 = 0;
                          v19 = 0;
                          while (1)
                          {
                            v20 = *v17++;
                            v21 = v19;
                            v22 = 24 * v19;
                            v23 = &v45[v22];
                            *(_QWORD *)v23 = v5 + v20;
                            v24 = &v40[v22];
                            v26 = *(_DWORD *)&v40[v22 + 48];
                            v25 = *(_DWORD *)&v40[v22 + 52];
                            v27 = *((_DWORD *)v24 + 14) * v26;
                            *((_DWORD *)v23 + 2) = v27;
                            *((_DWORD *)v23 + 3) = v25;
                            if (v19 > 0x16 || ((1 << v19) & 0x7EC040) == 0)
                              v25 *= 2;
                            v28 = (v25 + 63) & 0xFFFFFFC0;
                            v29 = &v45[24 * v21];
                            v30 = *(_DWORD *)&v40[24 * v21 + 60];
                            *((_DWORD *)v29 + 4) = v28;
                            *((_DWORD *)v29 + 5) = v30;
                            v18 += v28 * v27;
                            if (v18 > v7)
                              break;
                            if ((_DWORD)v21 == 22)
                              v19 = 24;
                            else
                              v19 = v21 + 1;
                            if (!--v8)
                              goto LABEL_31;
                          }
                        }
                        else
                        {
                          v31 = 0;
                          v32 = 0;
                          v33 = &v46;
                          v34 = &v41;
                          while (1)
                          {
                            *(_QWORD *)(v33 - 3) = v5 + v17[v31];
                            v35 = *(v34 - 2);
                            v36 = *(v34 - 1) * *(v34 - 3);
                            *(v33 - 1) = v36;
                            *v33 = v35;
                            if (v31 > 0x17 || ((1 << v31) & 0xFEC040) == 0)
                              v35 *= 2;
                            v37 = (v35 + 63) & 0xFFFFFFC0;
                            v38 = *v34;
                            v33[1] = v37;
                            v33[2] = v38;
                            v32 += v37 * v36;
                            if (v32 > v7)
                              break;
                            ++v31;
                            v33 += 6;
                            v34 += 6;
                            if (v8 == v31)
                            {
LABEL_31:
                              v42 = v45;
                              v43 = &v47;
                              v44 = v48;
                              bzero(a5, 0x5228uLL);
                              AcANSTPostProcessMultiNetOutputs(a1, a2, v39, (uint64_t *)&v42, dword_235915684, 0, a4, (uint64_t)a5);
                              return;
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

void AcANSTPostProcessMultiNetOutputs(_QWORD *a1, uint32x2_t *a2, uint64_t a3, uint64_t *a4, unsigned int *a5, float32x4_t *a6, _DWORD *a7, uint64_t a8)
{
  int32x4_t *v12;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  float32x2_t v20;
  float32x2_t v21;
  float32x2_t *v22;
  float32x2_t v23;
  float32x2_t v24;
  int32x2_t v25;
  unint64_t v26;
  float32x2_t v27;
  float32x2_t v28;
  uint64_t v29;
  _QWORD *v30;
  float32x2_t *v31;
  float32x2_t *v32;
  float32x2_t v33;
  float32x2_t v34;
  float32x2_t v35;
  float32x2_t v36;
  float32x2_t v37;
  float32x2_t v38;
  float32x2_t v39;
  float32x2_t *v40;
  float32x2_t v41;
  float32x2_t v42;
  float32x2_t v43;
  float32x2_t v44;
  float32x2_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  int32x2_t v54;
  uint64_t v56;
  float32x4_t v57;
  float32x4_t v58;
  float v59;
  float32x4_t v60;
  float v61;
  float32x4_t v62;
  float v63;
  float v64;
  float32x2_t v65;
  float32x2_t v66;
  float32x2_t v67;
  uint64_t v68;
  float32x2_t v69;
  int32x2_t v70;
  float32x2_t v71;
  float32x4_t v72;
  int32x4_t v73;
  uint64_t v74;
  float32x2_t v75;
  float32x2_t v76;
  int *v77;
  int v78;
  _OWORD *v79;
  uint64_t v80;
  char v81;
  int v82;
  uint64_t v83;
  __int128 v84;
  int v85;
  int8x8_t v86;
  float32x4_t v87;
  float v88;
  float32x4_t v89;
  float32_t v90;
  uint64_t v91;
  float32x4_t v92;
  float v93;
  float v94;
  float32x4_t v95;
  float32x4_t v96;
  float32x4_t v97;
  float32x4_t v98;
  __int128 v99;
  uint64_t v100;

  if (a1 && *a1 && a1[1] && a1[2] && a1[3] && a7 && a2 && a8 && a2->i32[0] && a2->i32[1])
  {
    *(_QWORD *)(a8 + 205) = 0;
    *(_OWORD *)(a8 + 176) = 0u;
    *(_OWORD *)(a8 + 192) = 0u;
    *(_OWORD *)(a8 + 144) = 0u;
    *(_OWORD *)(a8 + 160) = 0u;
    *(_OWORD *)(a8 + 112) = 0u;
    *(_OWORD *)(a8 + 128) = 0u;
    *(_OWORD *)(a8 + 80) = 0u;
    *(_OWORD *)(a8 + 96) = 0u;
    *(_OWORD *)(a8 + 48) = 0u;
    *(_OWORD *)(a8 + 64) = 0u;
    *(_OWORD *)(a8 + 16) = 0u;
    *(_OWORD *)(a8 + 32) = 0u;
    *(_OWORD *)a8 = 0u;
    v12 = (int32x4_t *)*a5;
    if (!(_DWORD)v12)
      goto LABEL_36;
    AcDetNode::postProcess((_QWORD *)*a1, *a4, v12, a6, a7, (uint64_t)a2, (uint64_t)(a1 + 4), (int32x4_t)0);
    if (!v16)
    {
      v17 = *((unsigned int *)a1 + 1928);
      v18 = *((unsigned int *)a1 + 10179);
      v19 = *((unsigned int *)a1 + 12740);
      if (!*(_BYTE *)(*a1 + 1422) && (_DWORD)v18 + (_DWORD)v17 != -(int)v19)
      {
        *(_WORD *)(*a1 + 1421) = 257;
        *(_BYTE *)(a1[1] + 1472) = 1;
      }
      if ((_DWORD)v17)
      {
        v20 = vcvt_f32_u32(a2[1]);
        v21 = vcvt_f32_u32(*a2);
        v22 = (float32x2_t *)((char *)a1 + 44);
        do
        {
          v23 = vmul_f32(vdiv_f32(*v22, v20), v21);
          v24 = vmul_f32(vdiv_f32(vadd_f32(*v22, v22[1]), v20), v21);
          v25 = (int32x2_t)vsub_f32(vadd_f32(vsub_f32(v24, v23), (float32x2_t)vdup_lane_s32((int32x2_t)v24, 1)), (float32x2_t)vdup_lane_s32((int32x2_t)v23, 1));
          *(float *)v25.i32 = 0.5 * *(float *)v25.i32;
          *v22 = vmul_f32(vsub_f32(vadd_f32(v24, v23), (float32x2_t)vdup_lane_s32(v25, 0)), (float32x2_t)0x3F0000003F000000);
          v22[1].i32[0] = v25.i32[0];
          v22[1].i32[1] = v25.i32[0];
          v22 += 64;
          --v17;
        }
        while (v17);
      }
      if ((_DWORD)v18)
      {
        v26 = 0;
        v27 = vcvt_f32_u32(a2[1]);
        v28 = vcvt_f32_u32(*a2);
        v29 = v18 << 9;
        v30 = a1 + 3226;
        do
        {
          v31 = (float32x2_t *)&v30[v26 / 8 - 55];
          v32 = (float32x2_t *)&a1[v26 / 8];
          v33 = vmul_f32(vdiv_f32(*v31, v27), v28);
          v34 = vmul_f32(vdiv_f32(vadd_f32(*v31, (float32x2_t)a1[v26 / 8 + 3172]), v27), v28);
          *v31 = v33;
          a1[v26 / 8 + 3172] = vsub_f32(v34, v33);
          if (*((_DWORD *)&v30[v26 / 8 - 55] - 1) == 9)
          {
            v35 = (float32x2_t)v30[v26 / 8];
            v36 = vmul_f32(vdiv_f32(vadd_f32(v35, v32[3227]), v27), v28);
            v37 = vmul_f32(vdiv_f32(v35, v27), v28);
            v30[v26 / 8] = v37;
            v32[3227] = vsub_f32(v36, v37);
          }
          v26 += 512;
        }
        while (v29 != v26);
      }
      if ((_DWORD)v19)
      {
        v38 = vcvt_f32_u32(a2[1]);
        v39 = vcvt_f32_u32(*a2);
        v40 = (float32x2_t *)((char *)a1 + 40732);
        do
        {
          v41 = vmul_f32(vdiv_f32(*v40, v38), v39);
          v42 = vsub_f32(vmul_f32(vdiv_f32(vadd_f32(*v40, v40[1]), v38), v39), v41);
          *v40 = v41;
          v40[1] = v42;
          v43 = v40[55];
          v44 = vadd_f32(v43, v40[56]);
          v45 = vmul_f32(vdiv_f32(v43, v38), v39);
          v40[55] = v45;
          v40[56] = vsub_f32(vmul_f32(vdiv_f32(v44, v38), v39), v45);
          v40 += 64;
          --v19;
        }
        while (v19);
      }
      v46 = *a4;
      v99 = *(_OWORD *)*a4;
      v100 = *(_QWORD *)(v46 + 16);
      if (!acAssoPostProcess((uint64_t)a1, (uint64_t)a2, (uint64_t)&v99, (unsigned __int8 *)a8, (uint64_t)a7, v14, v15))
      {
        v47 = *(unsigned int *)(a8 + 220);
        if ((_DWORD)v47)
        {
          v48 = 0;
          __asm { FMOV            V0.4S, #1.0 }
          v87 = _Q0;
          v54.i32[1] = 1117782016;
          v89 = (float32x4_t)vdupq_n_s32(0x447A0000u);
          __asm
          {
            FMOV            V12.2S, #1.0
            FMOV            V0.2S, #16.0
          }
          v86 = *(int8x8_t *)_Q0.f32;
          v56 = a8;
          do
          {
            if (*(_BYTE *)(v56 + 664))
            {
              *(float *)v54.i32 = (float)*(int *)(v56 + 644) / 1000.0;
              v93 = *(float *)v54.i32;
              v90 = (float)(*(float *)v54.i32 + -0.1) * (float)(*(float *)v54.i32 + -0.1);
              v92 = (float32x4_t)vdupq_lane_s32(v54, 0);
              v57 = vaddq_f32(v92, (float32x4_t)xmmword_235916900);
              v98 = vmulq_f32(vmulq_f32(v57, v57), (float32x4_t)xmmword_235916910);
              v94 = expf(v98.f32[1]);
              v58.f32[0] = expf(v98.f32[0]);
              v58.f32[1] = v94;
              v95 = v58;
              v59 = expf(v98.f32[2]);
              v60 = v95;
              v60.f32[2] = v59;
              v96 = v60;
              v61 = expf(v98.f32[3]);
              v62 = v96;
              v62.f32[3] = v61;
              v97 = vdivq_f32(v87, v62);
              v63 = 1.0 / expf(v90 * 8.0);
              v64 = 1.0 / expf((float)((float)(v93 + -0.88) * (float)(v93 + -0.88)) * 8.0);
              v65 = vadd_f32(*(float32x2_t *)v92.f32, (float32x2_t)0xBF266666BE75C28FLL);
              *(float32x2_t *)v98.f32 = vmul_f32(v65, v65);
              v66 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v98.f32, 0);
              v66.f32[0] = v90;
              v67 = vmul_f32(v66, (float32x2_t)0x42A0000042200000);
              v88 = v67.f32[0];
              *(float *)&v68 = expf(v67.f32[1]);
              v91 = v68;
              v69.f32[0] = expf(v88);
              v70.i32[1] = HIDWORD(v91);
              v69.i32[1] = v91;
              v71 = vdiv_f32(_D12, v69);
              *(float *)v70.i32 = v97.f32[3]
                                + (float)(v97.f32[2] + (float)(v97.f32[1] + (float)(v97.f32[0] + vaddv_f32(v71))));
              v72 = (float32x4_t)vdupq_lane_s32(v70, 0);
              *(int32x2_t *)(v56 + 620) = vcvt_s32_f32(vmul_f32(vdiv_f32(v71, *(float32x2_t *)v72.f32), *(float32x2_t *)v89.f32));
              v73 = vcvtq_s32_f32(vmulq_f32(vdivq_f32(v97, v72), v89));
              *(int32x4_t *)(v56 + 628) = v73;
              v73.i32[0] = 1047904911;
              v73.i32[0] = vdup_lane_s32(*(int32x2_t *)v73.i8, 0).u32[0];
              *(float *)&v73.i32[1] = v93;
              *(float32x2_t *)v73.i8 = vmul_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*(float32x2_t *)v73.i8, (float32x2_t)(v92.u32[0] | 0x3F26666600000000)), (int8x8_t)0x4100000041000000, v86), *(float32x2_t *)v98.f32);
              v97.i32[0] = v73.i32[0];
              *(float *)&v74 = expf(*(float *)&v73.i32[1]);
              v98.i64[0] = v74;
              v75.f32[0] = expf(v97.f32[0]);
              v54.i32[1] = v98.i32[1];
              v75.i32[1] = v98.i32[0];
              v76 = vdiv_f32(_D12, v75);
              *(float *)v54.i32 = v64 + (float)(v76.f32[1] + (float)(v63 + v76.f32[0]));
              *(_DWORD *)(v56 + 648) = (int)(float)((float)(v63 / *(float *)v54.i32) * 1000.0);
              *(int32x2_t *)(v56 + 652) = vcvt_s32_f32(vmul_f32(vdiv_f32(v76, (float32x2_t)vdup_lane_s32(v54, 0)), *(float32x2_t *)v89.f32));
              *(_DWORD *)(v56 + 660) = (int)(float)((float)(v64 / *(float *)v54.i32) * 1000.0);
            }
            ++v48;
            v56 += 1624;
          }
          while (v48 < v47);
        }
        if (!*(_BYTE *)a8)
        {
LABEL_36:
          v77 = a7 + 50595;
          v78 = a7[50595];
          *(_OWORD *)(a8 + 1) = *(_OWORD *)"0000000";
          *(_DWORD *)(a8 + 17) = 0;
          v79 = (_OWORD *)(a8 + 21);
          v80 = a8 + 101;
          *(_DWORD *)(a8 + 37) = 0;
          if (v78)
          {
            *v79 = xmmword_2359156A5;
            v81 = 1;
          }
          else
          {
            *v79 = xmmword_235915690;
            v82 = *(_DWORD *)(*a1 + 16);
            *(_OWORD *)v80 = *(_OWORD *)*a1;
            *(_DWORD *)(a8 + 117) = v82;
            *(_BYTE *)a8 = 1;
            *(_DWORD *)(a8 + 57) = 0;
            *(_OWORD *)(a8 + 41) = xmmword_2359156A5;
            v80 = a8 + 121;
            v81 = 2;
          }
          v83 = a1[1];
          v84 = *(_OWORD *)(v83 + 12);
          *(_DWORD *)(v80 + 16) = *(_DWORD *)(v83 + 28);
          *(_OWORD *)v80 = v84;
          *(_BYTE *)a8 = v81;
          if (*v77 == 4)
            v85 = 0;
          else
            v85 = *v77 + 1;
          *v77 = v85;
        }
      }
    }
  }
}

uint64_t AcANSTUseLowThresholds(uint64_t *a1)
{
  uint64_t v1;
  uint64_t result;

  if (!a1)
    return 4294967292;
  v1 = *a1;
  if (!*a1 || !a1[1] || !a1[2] || !a1[3])
    return 4294967292;
  result = 0;
  *(_BYTE *)(v1 + 1420) = 1;
  return result;
}

uint64_t AcANSTGetExtState(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t result;
  int v6;

  if (!a1 || !*a1 || !a1[1] || !a1[2] || !a1[3])
    return 4294967292;
  result = 4294967292;
  if (a2 && a3 && a4)
  {
    *(_QWORD *)(a4 + 4) = a2;
    *(_DWORD *)(a4 + 12) = 202416;
    *(_QWORD *)(a4 + 16) = a3;
    *(_DWORD *)(a4 + 24) = a5;
    if (a2 + 202416 == a3)
    {
      *(_DWORD *)(a4 + 12) = a5 + 202416;
      *(_DWORD *)(a4 + 24) = 0;
      v6 = a5 != -202416;
    }
    else
    {
      v6 = 2;
    }
    result = 0;
    *(_DWORD *)a4 = v6;
  }
  return result;
}

uint64_t AcANSTCallExtState(_QWORD *a1, void *__dst, int a3, char *__src, uint64_t a5, _DWORD *a6, int a7)
{
  uint64_t result;

  if (!a1)
    return 4294967292;
  if (!*a1 || !a1[1] || !a1[2] || !a1[3])
    return 4294967292;
  result = 4294967292;
  if (__dst)
  {
    if (__src)
    {
      memcpy(__dst, __src, 0x316B0uLL);
      result = 0;
      *(_WORD *)(*a1 + 1421) = 257;
      *(_BYTE *)(a1[1] + 1472) = 1;
      *(_QWORD *)a5 = __src + 202416;
      *(_DWORD *)(a5 + 8) = a7;
      *(_DWORD *)(a5 + 12) = *a6;
      *(_DWORD *)(a5 + 16) = a6[1];
      *(_DWORD *)(a5 + 20) = a6[2];
      *(_DWORD *)(a5 + 24) = a6[3];
      *(_DWORD *)(a5 + 28) = a6[4];
      *(_DWORD *)(a5 + 32) = a6[5];
      *(_DWORD *)(a5 + 36) = a6[6];
      *(_DWORD *)(a5 + 40) = a6[7];
      *(_DWORD *)(a5 + 44) = a6[8];
      *(_DWORD *)(a5 + 48) = a6[9];
      *(_DWORD *)(a5 + 52) = a6[10];
      *(_DWORD *)(a5 + 56) = a6[11];
      *(_DWORD *)(a5 + 60) = a6[12];
      *(_DWORD *)(a5 + 64) = a6[13];
      *(_DWORD *)(a5 + 68) = a6[14];
      *(_DWORD *)(a5 + 72) = a6[15];
      *(_DWORD *)(a5 + 76) = a6[16];
      *(_DWORD *)(a5 + 80) = a6[17];
      *(_DWORD *)(a5 + 84) = a6[18];
      *(_DWORD *)(a5 + 88) = a6[19];
      *(_DWORD *)(a5 + 92) = a6[20];
      *(_DWORD *)(a5 + 96) = a6[21];
      *(_DWORD *)(a5 + 100) = a6[22];
      *(_DWORD *)(a5 + 104) = a6[23];
      *(_DWORD *)(a5 + 108) = a6[24];
      *(_DWORD *)(a5 + 112) = 25;
    }
  }
  return result;
}

uint64_t acTrkLGroupIoUCost(uint64_t result, unsigned int a2, int *a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int *a10, uint64_t a11)
{
  int8x16_t v11;
  uint64_t v12;
  unint64_t v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  int v17;
  unint64_t v18;
  unint64_t v19;
  __int128 v20;
  float32x4_t v21;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  BOOL v28;
  uint64_t v29;
  unsigned int v30;
  _OWORD *v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  BOOL v37;
  BOOL v38;
  const float *v39;
  float32x4_t v40;
  const float *v41;
  float32x4_t v42;
  uint64_t v43;
  float32x4_t v44;
  float32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;
  __int32 *v48;
  unsigned int v49;
  float32x4_t v50;
  float32x4_t v51;
  float32x4_t v52;
  float32x4_t v53;
  float32x4_t v54;
  float32x4_t v55;
  float32x4_t v56;
  int8x16_t v57;
  float32x4_t v58;
  float32x4_t v59;
  unsigned int v60;
  uint64_t v61;
  float *v62;
  float v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float v69;
  float v70;
  float v71;
  float v73;
  float v74;
  float v75;
  float v77;
  unsigned int v78;
  uint64_t v79;
  unsigned int v80;
  _OWORD *v81;
  unsigned int v82;
  unsigned int v83;
  unsigned int v84;
  int v85;
  __int128 v86;
  int v87;
  BOOL v89;
  unsigned int v90;
  uint64_t v91;
  unsigned int v92;
  _OWORD *v93;
  _OWORD *v94;
  unsigned int v97;
  unint64_t v98;
  int *v99;
  unint64_t v100;
  uint64_t v101;
  unsigned int v102;
  unint64_t v103;
  int *v104;
  unint64_t v105;
  uint64_t v106;
  int v107;
  float v108;
  uint64_t v109;
  float v110;
  int v111;
  uint64_t v112;
  int *v113;
  int v114;
  unsigned int v115;
  uint64_t v116;
  int *v117;
  int v118;
  float v119;
  unsigned int v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  int *v124;
  int v125;
  int v126;
  float v127;
  unsigned int v128;
  uint64_t v129;
  unsigned int v130;
  uint64_t v131;
  int *v132;
  int v133;
  int v134;
  int *v135;
  int v136;
  float v137;
  uint64_t v138;
  float v139;
  int v140;
  uint64_t v141;
  int *v142;
  int v143;
  unsigned int v144;
  uint64_t v145;
  int *v146;
  int v147;
  float v148;
  unsigned int v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  int *v153;
  int v154;
  int v155;
  float v156;
  unsigned int v157;
  uint64_t v158;
  unsigned int v159;
  uint64_t v160;
  int *v161;
  int v162;
  int v163;
  int *v164;
  uint64_t v165;
  uint64_t v166;

  if (a4 <= a2)
    v12 = a2;
  else
    v12 = a4;
  if ((_DWORD)v12)
  {
    if (a4)
    {
      v13 = 0;
      v14 = 0;
      v15 = v12 - a4;
      v16 = v12 & 0xFFFFFFF8;
      v17 = (v12 - a4) & 0xFFFFFFF8;
      v18 = a4 - 1;
      v19 = (unint64_t)&a3[15 * a4 - 11];
      v166 = a4 & 0xFFFFFFFC;
      v165 = result;
      *(_QWORD *)&v20 = 0x4000000040000000;
      *((_QWORD *)&v20 + 1) = 0x4000000040000000;
      v21.i64[0] = 0x3400000034000000;
      v21.i64[1] = 0x3400000034000000;
      __asm { FMOV            V6.4S, #1.0 }
      while (v13 >= a2)
      {
        v27 = v12 + v14;
        v28 = __CFADD__(v14, v12 - 1);
        if (v12 >= 8 && !v28)
        {
          v29 = v12 & 0xFFFFFFF8;
          v30 = v14;
          do
          {
            v31 = (_OWORD *)(a5 + 4 * v30);
            *v31 = v20;
            v31[1] = v20;
            v30 += 8;
            v29 -= 8;
          }
          while (v29);
          if ((_DWORD)v12 == v16)
            goto LABEL_7;
          v14 += v16;
        }
        do
          *(_DWORD *)(a5 + 4 * v14++) = 0x40000000;
        while (v27 != v14);
LABEL_7:
        ++v13;
        v14 = v27;
        if (v13 == v12)
          goto LABEL_94;
      }
      v25 = result + 60 * v13;
      if (a4 >= 4)
      {
        v26 = 0;
        if (!__CFADD__(v14, (_DWORD)v18) && !HIDWORD(v18))
        {
          v26 = 0;
          v32 = result + 60 * v13;
          v33 = 4 * v14;
          v34 = a5 + v33;
          v35 = a5 + 4 * a4 + v33;
          _CF = v32 >= v35 || v34 >= v32 + 16;
          v37 = !_CF;
          v38 = v34 < v19 && v35 > (unint64_t)a3;
          if (!v38 && !v37)
          {
            v39 = (const float *)(result + 60 * v13);
            v40 = vld1q_dup_f32(v39++);
            v41 = (const float *)(v25 + 8);
            v42 = vld1q_dup_f32(v41);
            v43 = a4 & 0xFFFFFFFC;
            v27 = v14 + v166;
            v44 = vld1q_dup_f32(v39);
            v11.i32[0] = *(_DWORD *)(v25 + 12);
            v45 = vaddq_f32(v40, v42);
            v46 = vaddq_f32(v44, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v11.i8, 0));
            v47 = vmulq_n_f32(v42, *(float *)v11.i32);
            v48 = a3 + 30;
            v49 = v14;
            do
            {
              v50.i32[0] = *(v48 - 30);
              v51.i32[0] = *(v48 - 29);
              v50.i32[1] = *(v48 - 15);
              v50.i32[2] = *v48;
              v50.i32[3] = v48[15];
              v52.i32[0] = *(v48 - 28);
              v53.i32[0] = *(v48 - 27);
              v52.i32[1] = *(v48 - 13);
              v52.i32[2] = v48[2];
              v52.i32[3] = v48[17];
              v51.i32[1] = *(v48 - 14);
              v51.i32[2] = v48[1];
              v51.i32[3] = v48[16];
              v53.i32[1] = *(v48 - 12);
              v54 = vaddq_f32(v50, v52);
              v53.i32[2] = v48[3];
              v53.i32[3] = v48[18];
              v55 = vaddq_f32(v51, v53);
              v56 = vmulq_f32(v52, v53);
              v57 = vorrq_s8((int8x16_t)vcgeq_f32(v50, v45), (int8x16_t)vcgeq_f32(v51, v46));
              v58 = vmulq_f32(vmaxnmq_f32(vsubq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v45, v54), (int8x16_t)v54, (int8x16_t)v45), (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v40, v50), (int8x16_t)v40, (int8x16_t)v50)), (float32x4_t)0), vmaxnmq_f32(vsubq_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v46, v55), (int8x16_t)v55, (int8x16_t)v46), (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v44, v51), (int8x16_t)v44, (int8x16_t)v51)), (float32x4_t)0));
              v59 = (float32x4_t)vandq_s8(vbicq_s8((int8x16_t)vdivq_f32(v58, vmaxnmq_f32(vsubq_f32(vaddq_f32(v56, v47), v58), v21)), v57), vbicq_s8(vmvnq_s8((int8x16_t)vcgeq_f32(v40, v54)), (int8x16_t)vcgeq_f32(v44, v55)));
              v11 = vbslq_s8((int8x16_t)vcltzq_f32(v59), (int8x16_t)_Q6, (int8x16_t)vsubq_f32(_Q6, v59));
              *(int8x16_t *)(a5 + 4 * v49) = v11;
              v49 += 4;
              v48 += 60;
              v43 -= 4;
            }
            while (v43);
            v26 = a4 & 0xFFFFFFFC;
            if (v166 == a4)
            {
              v60 = v14 + v166 - 1;
              v19 = (unint64_t)&a3[15 * a4 - 11];
              result = v165;
              if (a4 >= a2)
                goto LABEL_7;
              goto LABEL_65;
            }
            v14 += v166;
            v19 = (unint64_t)&a3[15 * a4 - 11];
            result = v165;
          }
        }
      }
      else
      {
        v26 = 0;
      }
      v61 = a4 - v26;
      v62 = (float *)&a3[15 * v26 + 2];
      v27 = v14;
      do
      {
        v64 = *(v62 - 2);
        v65 = *(v62 - 1);
        v66 = v62[1];
        v67 = v64 + *v62;
        v68 = v65 + v66;
        v70 = *(float *)v25;
        v69 = *(float *)(v25 + 4);
        v71 = 0.0;
        if (v67 > *(float *)v25 && v68 > v69)
        {
          v73 = *(float *)(v25 + 8);
          v74 = *(float *)(v25 + 12);
          v75 = v69 + v74;
          if ((float)(v70 + v73) > v64 && v75 > v65)
          {
            if (v64 < v70)
              v64 = *(float *)v25;
            if (v65 < v69)
              v65 = *(float *)(v25 + 4);
            if (v67 >= (float)(v70 + v73))
              v67 = v70 + v73;
            if (v68 >= v75)
              v68 = v69 + v74;
            v77 = fmaxf(v67 - v64, 0.0) * fmaxf(v68 - v65, 0.0);
            v71 = v77 / fmaxf((float)((float)(*v62 * v66) + (float)(v73 * v74)) - v77, 0.00000011921);
          }
        }
        v63 = 1.0 - v71;
        if (v71 < 0.0)
          v63 = 1.0;
        *(float *)(a5 + 4 * v27++) = v63;
        v62 += 15;
        --v61;
      }
      while (v61);
      v60 = v27 - 1;
      if (a4 >= a2)
        goto LABEL_7;
LABEL_65:
      if (v15 < 8 || (v78 = -2 - v60, v79 = v15 & 0xFFFFFFF8, v80 = v27, v78 < (_DWORD)v12 - 1 - a4))
      {
        v82 = a4;
      }
      else
      {
        do
        {
          v81 = (_OWORD *)(a5 + 4 * v80);
          *v81 = v20;
          v81[1] = v20;
          v80 += 8;
          v79 -= 8;
        }
        while (v79);
        v27 += v17;
        v82 = v17 + a4;
        if (v15 == v17)
          goto LABEL_7;
      }
      do
      {
        *(_DWORD *)(a5 + 4 * v27) = 0x40000000;
        ++v82;
        ++v27;
      }
      while (v82 < v12);
      goto LABEL_7;
    }
    v83 = 0;
    v84 = 0;
    v85 = v12 & 0xFFFFFFF8;
    *(_QWORD *)&v86 = 0x4000000040000000;
    *((_QWORD *)&v86 + 1) = 0x4000000040000000;
    v87 = v12;
    do
    {
      v89 = __CFADD__(v83, v12 - 1) || v12 < 8;
      v90 = v83;
      v91 = v12 & 0xFFFFFFF8;
      v92 = v83;
      if (v84 >= a2)
      {
        if (!v89)
        {
          do
          {
            v94 = (_OWORD *)(a5 + 4 * v92);
            *v94 = v86;
            v94[1] = v86;
            v92 += 8;
            v91 -= 8;
          }
          while (v91);
          if ((_DWORD)v12 == v85)
            goto LABEL_74;
          v90 = v83 + v85;
        }
        do
          *(_DWORD *)(a5 + 4 * v90++) = 0x40000000;
        while (v87 != v90);
      }
      else
      {
        if (!v89)
        {
          do
          {
            v93 = (_OWORD *)(a5 + 4 * v92);
            *v93 = v86;
            v93[1] = v86;
            v92 += 8;
            v91 -= 8;
          }
          while (v91);
          if ((_DWORD)v12 == v85)
            goto LABEL_74;
          v90 = v83 + v85;
        }
        do
          *(_DWORD *)(a5 + 4 * v90++) = 0x40000000;
        while (v87 != v90);
      }
LABEL_74:
      v83 += v12;
      ++v84;
      v87 += v12;
    }
    while (v84 != (_DWORD)v12);
  }
LABEL_94:
  if (*(_BYTE *)(a11 + 5))
  {
    if (a9 == 10)
    {
      if ((_DWORD)v12 && a4)
      {
        v97 = 0;
        v98 = 0;
        v99 = a3 + 8;
        v100 = a2;
        v101 = a4;
        do
        {
          if (v98 < v100)
          {
            v111 = *(_DWORD *)(result + 60 * v98 + 40);
            v112 = v101;
            v113 = v99;
            if (v111 != -1)
            {
              while (1)
              {
                v114 = *v113;
                v113 += 15;
                if (v114 == v111)
                  break;
                if (!--v112)
                  goto LABEL_114;
              }
              v115 = 0;
              v116 = 0;
              v117 = v99;
              while (1)
              {
                v118 = *v117;
                v117 += 15;
                if (v111 == v118)
                  break;
                ++v116;
                ++v115;
                if (v101 == v116)
                  goto LABEL_114;
              }
              if ((v116 & 0x80000000) == 0)
              {
                v119 = 3.4028e38;
                v120 = v97;
                v121 = v12;
                do
                {
                  if (*(float *)(a5 + 4 * v120) < v119)
                    v119 = *(float *)(a5 + 4 * v120);
                  ++v120;
                  --v121;
                }
                while (v121);
                LODWORD(v122) = 0;
                v123 = v12;
                do
                {
                  if (vabds_f32(v119, *(float *)(a5 + 4 * (v97 + v121))) < 0.00000011921)
                  {
                    a10[v122] = v121;
                    LODWORD(v122) = v122 + 1;
                  }
                  LODWORD(v121) = v121 + 1;
                  --v123;
                }
                while (v123);
                if ((_DWORD)v122)
                {
                  v122 = v122;
                  v124 = a10;
                  while (1)
                  {
                    v125 = *v124++;
                    if (v125 == (_DWORD)v116)
                      break;
                    if (!--v122)
                      goto LABEL_137;
                  }
                  v126 = v116;
                }
                else
                {
LABEL_137:
                  v126 = *a10;
                }
                v127 = 3.4028e38;
                v128 = v115;
                v129 = v12;
                do
                {
                  if (*(float *)(a5 + 4 * v128) < v127)
                    v127 = *(float *)(a5 + 4 * v128);
                  v128 += v12;
                  --v129;
                }
                while (v129);
                v130 = 0;
                do
                {
                  if (vabds_f32(v127, *(float *)(a5 + 4 * v115)) < 0.00000011921)
                    a10[v130++] = v129;
                  ++v129;
                  v115 += v12;
                }
                while (v12 != v129);
                if (v130)
                {
                  v131 = v130;
                  v132 = a10;
                  while (1)
                  {
                    v133 = *v132++;
                    if (v133 == (_DWORD)v98)
                      break;
                    if (!--v131)
                      goto LABEL_151;
                  }
                  v134 = v98;
                }
                else
                {
LABEL_151:
                  v134 = *a10;
                }
                v135 = (int *)(result + 60 * v98 + 48);
                if (v126 == (_DWORD)v116 && v98 == v134)
                {
                  v107 = 0;
                  v108 = 0.0;
                }
                else
                {
                  v107 = *v135 + 1;
                  if (*v135 >= 6)
                    v108 = 0.0;
                  else
                    v108 = 2.0;
                }
                *v135 = v107;
                v109 = 4 * (v12 * v98 + v116);
                v110 = *(float *)(a5 + v109) - v108;
                if (v110 < 0.0)
                  v110 = 0.0;
                *(float *)(a5 + v109) = v110;
              }
            }
          }
LABEL_114:
          ++v98;
          v97 += v12;
        }
        while (v98 != v12);
      }
    }
    else if (a9 == 11 && (_DWORD)v12 != 0 && a4 != 0)
    {
      v102 = 0;
      v103 = 0;
      v104 = a3 + 9;
      v105 = a2;
      v106 = a4;
      do
      {
        if (v103 < v105)
        {
          v140 = *(_DWORD *)(result + 60 * v103 + 44);
          v141 = v106;
          v142 = v104;
          if (v140 != -1)
          {
            while (1)
            {
              v143 = *v142;
              v142 += 15;
              if (v143 == v140)
                break;
              if (!--v141)
                goto LABEL_162;
            }
            v144 = 0;
            v145 = 0;
            v146 = v104;
            while (1)
            {
              v147 = *v146;
              v146 += 15;
              if (v140 == v147)
                break;
              ++v145;
              ++v144;
              if (v106 == v145)
                goto LABEL_162;
            }
            if ((v145 & 0x80000000) == 0)
            {
              v148 = 3.4028e38;
              v149 = v102;
              v150 = v12;
              do
              {
                if (*(float *)(a5 + 4 * v149) < v148)
                  v148 = *(float *)(a5 + 4 * v149);
                ++v149;
                --v150;
              }
              while (v150);
              LODWORD(v151) = 0;
              v152 = v12;
              do
              {
                if (vabds_f32(v148, *(float *)(a5 + 4 * (v102 + v150))) < 0.00000011921)
                {
                  a10[v151] = v150;
                  LODWORD(v151) = v151 + 1;
                }
                LODWORD(v150) = v150 + 1;
                --v152;
              }
              while (v152);
              if ((_DWORD)v151)
              {
                v151 = v151;
                v153 = a10;
                while (1)
                {
                  v154 = *v153++;
                  if (v154 == (_DWORD)v145)
                    break;
                  if (!--v151)
                    goto LABEL_185;
                }
                v155 = v145;
              }
              else
              {
LABEL_185:
                v155 = *a10;
              }
              v156 = 3.4028e38;
              v157 = v144;
              v158 = v12;
              do
              {
                if (*(float *)(a5 + 4 * v157) < v156)
                  v156 = *(float *)(a5 + 4 * v157);
                v157 += v12;
                --v158;
              }
              while (v158);
              v159 = 0;
              do
              {
                if (vabds_f32(v156, *(float *)(a5 + 4 * v144)) < 0.00000011921)
                  a10[v159++] = v158;
                ++v158;
                v144 += v12;
              }
              while (v12 != v158);
              if (v159)
              {
                v160 = v159;
                v161 = a10;
                while (1)
                {
                  v162 = *v161++;
                  if (v162 == (_DWORD)v103)
                    break;
                  if (!--v160)
                    goto LABEL_199;
                }
                v163 = v103;
              }
              else
              {
LABEL_199:
                v163 = *a10;
              }
              v164 = (int *)(result + 60 * v103 + 52);
              if (v155 == (_DWORD)v145 && v103 == v163)
              {
                v136 = 0;
                v137 = 0.0;
              }
              else
              {
                v136 = *v164 + 1;
                if (*v164 >= 6)
                  v137 = 0.0;
                else
                  v137 = 2.0;
              }
              *v164 = v136;
              v138 = 4 * (v12 * v103 + v145);
              v139 = *(float *)(a5 + v138) - v137;
              if (v139 < 0.0)
                v139 = 0.0;
              *(float *)(a5 + v138) = v139;
            }
          }
        }
LABEL_162:
        ++v103;
        v102 += v12;
      }
      while (v103 != v12);
    }
  }
  return result;
}

uint64_t acTrkLGroupHandAsso(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, int *a6, int *a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  int v22;
  uint64_t v23;
  int *v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int *v27;
  int *v28;
  uint64_t v29;
  unsigned int v30;
  unsigned int v31;
  uint64_t v32;
  int *v33;
  int v34;
  int *v35;
  uint64_t v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  double v40;
  unsigned int v41;
  unint64_t v42;
  _DWORD *v43;
  uint64_t v44;
  void *v45;
  size_t v46;
  uint64_t v47;
  unsigned int v48;
  uint64_t v49;
  _DWORD *v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  int *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unsigned int v59;
  unsigned int v60;
  unsigned int v61;
  double v62;
  unint64_t v63;
  int *v64;
  int *v65;
  _DWORD *v66;
  uint64_t result;
  unsigned int v68;
  uint64_t v69;
  unsigned int v70;
  unsigned int v71;
  uint64_t v72;
  _DWORD *v73;
  int v74;
  uint64_t v75;
  uint64_t v76;
  int *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int *v82;
  uint64_t v83;
  int v84;
  uint64_t v85;
  uint64_t v86;
  int *v87;
  uint64_t v88;
  int *v89;
  uint64_t v90;
  int v91;
  uint64_t v92;
  uint64_t v93;
  int *v94;
  uint64_t v95;
  _BOOL4 v96;
  int *v97;
  uint64_t v98;
  int v99;
  int v100;
  uint64_t v104;
  int v105;
  uint64_t v106;
  int v107;
  unsigned __int8 *v108;
  size_t TempBuffers;
  unsigned int v110;
  unsigned int v111;
  int *v112;
  unsigned int v113;
  int *v114;
  float *v116;
  void *__dst;
  _BYTE v119[44];
  _OWORD v120[2];
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  uint64_t v126;

  v126 = 0;
  v124 = 0u;
  v125 = 0u;
  v122 = 0u;
  v123 = 0u;
  v121 = 0u;
  memset(v120, 0, sizeof(v120));
  TempBuffers = acTrkGroupAssignGetTempBuffers(20, (uint64_t)a10, a3, (uint64_t)v120);
  bzero(a10, TempBuffers);
  v116 = (float *)*((_QWORD *)&v121 + 1);
  __dst = (void *)v122;
  if (a2)
  {
    v20 = 0;
    v21 = 0;
    v22 = 1;
    v23 = a1;
    v24 = a6;
    v25 = a5;
    do
    {
      if (!*(_DWORD *)(v23 + 512))
      {
        v26 = a5 + 60 * v21;
        *(_DWORD *)(v26 + 16) = 9;
        *(_OWORD *)v26 = *(_OWORD *)(v23 + 452);
        *(_DWORD *)(v26 + 20) = v20;
        *(_DWORD *)(v26 + 24) = v22;
        *(_DWORD *)(v26 + 28) = *(_DWORD *)v23;
        *(_OWORD *)(v26 + 40) = *(_OWORD *)(v23 + 1704);
        ++v21;
        ++v22;
      }
      ++v20;
      v23 += 1724;
    }
    while (a2 != v20);
  }
  else
  {
    v21 = 0;
    v22 = 1;
    v24 = a6;
    v25 = a5;
  }
  v108 = (unsigned __int8 *)*((_QWORD *)&v122 + 1);
  v27 = (unsigned int *)*((_QWORD *)&v123 + 1);
  v28 = (int *)v125;
  if (a4)
  {
    v29 = 0;
    v30 = 0;
    v31 = 0;
    v32 = a3;
    do
    {
      if (!*(_DWORD *)(v32 + 512))
      {
        v34 = *(_DWORD *)(v32 + 8);
        if (v34 == 11)
        {
          *(_OWORD *)&v119[28] = 0uLL;
          *(_OWORD *)v119 = 0uLL;
          memset(&v119[12], 255, 20);
          v33 = &a7[15 * v30];
          *(_OWORD *)v33 = 0uLL;
          *((_OWORD *)v33 + 1) = *(_OWORD *)v119;
          *((_OWORD *)v33 + 2) = *(_OWORD *)&v119[16];
          *(_OWORD *)(v33 + 11) = *(_OWORD *)&v119[28];
          *(_OWORD *)v33 = *(_OWORD *)(v32 + 452);
          v33[4] = 11;
          v33[5] = v29;
          v33[6] = 0;
          v33[9] = *(_DWORD *)v32;
          ++v30;
        }
        else if (v34 == 10)
        {
          *(_OWORD *)&v119[28] = 0uLL;
          *(_OWORD *)v119 = 0uLL;
          memset(&v119[12], 255, 20);
          v35 = &v24[15 * v31];
          *(_OWORD *)v35 = 0uLL;
          *((_OWORD *)v35 + 1) = *(_OWORD *)v119;
          *((_OWORD *)v35 + 2) = *(_OWORD *)&v119[16];
          *(_OWORD *)(v35 + 11) = *(_OWORD *)&v119[28];
          *(_OWORD *)v35 = *(_OWORD *)(v32 + 452);
          v35[4] = 10;
          v35[5] = v29;
          v35[6] = 0;
          v35[8] = *(_DWORD *)v32;
          ++v31;
        }
      }
      v32 += 1724;
      ++v29;
    }
    while (a4 != v29);
  }
  else
  {
    v31 = 0;
    v30 = 0;
  }
  v113 = v31;
  v114 = a7;
  v110 = a2;
  v111 = a4;
  if (v21 <= v31)
    v36 = v31;
  else
    v36 = v21;
  if (v36 >= 0x14)
    v37 = 20;
  else
    v37 = v36;
  v112 = v28;
  acTrkLGroupIoUCost(v25, v21, v24, v31, (uint64_t)v116, v17, v18, v19, 10, v28, a12);
  memcpy(__dst, v116, 4 * v37 * v37);
  if (v21 && v113)
  {
    v41 = v30;
    bmMunkres(v116, v37, v108, v38, v27, v39, 0, v40);
    v42 = 0;
    v43 = a6 + 6;
    v44 = a5;
    v46 = TempBuffers;
    v45 = a10;
    v47 = a12;
    do
    {
      if (v42 < v113)
      {
        v48 = v27[v42];
        if (v48 >= v21 || (float)(1.0 - *((float *)__dst + v42 + v48 * (_DWORD)v36)) < 0.2)
          *v43 = v22++;
        else
          *v43 = *(_DWORD *)(a5 + 60 * v48 + 24);
      }
      ++v42;
      v43 += 15;
    }
    while (v36 != v42);
    goto LABEL_42;
  }
  v41 = v30;
  if (v21)
  {
    v44 = a5;
    v46 = TempBuffers;
    v45 = a10;
    goto LABEL_36;
  }
  v44 = a5;
  v46 = TempBuffers;
  v45 = a10;
  if (!v113)
  {
LABEL_36:
    v47 = a12;
    goto LABEL_42;
  }
  if (v113 >= 2)
  {
    v49 = v113 & 0xFFFFFFFE;
    v50 = a6 + 21;
    v51 = v22;
    v52 = v49;
    v47 = a12;
    do
    {
      *(v50 - 15) = v51;
      *v50 = v51 + 1;
      v50 += 30;
      v51 += 2;
      v52 -= 2;
    }
    while (v52);
    v22 += v49;
    if (v49 == v113)
      goto LABEL_42;
  }
  else
  {
    v49 = 0;
    v47 = a12;
  }
  v53 = v113 - v49;
  v54 = &a6[15 * v49 + 6];
  do
  {
    *v54 = v22;
    v54 += 15;
    ++v22;
    --v53;
  }
  while (v53);
LABEL_42:
  bzero(v45, v46);
  if (v21 <= v41)
    v58 = v41;
  else
    v58 = v21;
  if (v58 >= 0x14)
    v59 = 20;
  else
    v59 = v58;
  acTrkLGroupIoUCost(v44, v21, v114, v41, (uint64_t)v116, v55, v56, v57, 11, v112, v47);
  memcpy(__dst, v116, 4 * v59 * v59);
  if (v21 && v41)
  {
    bmMunkres(v116, v59, v108, v60, v27, v61, 0, v62);
    v63 = 0;
    v64 = v114;
    v65 = a6;
    v66 = v114 + 6;
    result = v110;
    v68 = v111;
    v69 = a5;
    v70 = v113;
    do
    {
      if (v63 < v41)
      {
        v71 = v27[v63];
        if (v71 >= v21 || (float)(1.0 - *((float *)__dst + v63 + v71 * (_DWORD)v58)) < 0.2)
          *v66 = v22++;
        else
          *v66 = *(_DWORD *)(a5 + 60 * v71 + 24);
      }
      ++v63;
      v66 += 15;
    }
    while (v58 != v63);
  }
  else
  {
    result = v110;
    v68 = v111;
    v64 = v114;
    v65 = a6;
    v69 = a5;
    v70 = v113;
    if (!v21 && v41)
    {
      if (v41 >= 2)
      {
        v72 = v41 & 0xFFFFFFFE;
        v73 = v114 + 21;
        v74 = v22;
        v75 = v72;
        do
        {
          *(v73 - 15) = v74;
          *v73 = v74 + 1;
          v73 += 30;
          v74 += 2;
          v75 -= 2;
        }
        while (v75);
        if (v72 == v41)
          goto LABEL_67;
        v22 += v72;
      }
      else
      {
        v72 = 0;
      }
      v76 = v41 - v72;
      v77 = &v114[15 * v72 + 6];
      do
      {
        *v77 = v22;
        v77 += 15;
        ++v22;
        --v76;
      }
      while (v76);
    }
  }
LABEL_67:
  if (v21)
  {
    v78 = v21;
    v79 = v69 + 24;
    do
    {
      v80 = a1 + 1724 * *(unsigned int *)(v79 - 4);
      *(_DWORD *)(v80 + 4) = *(_DWORD *)v79;
      *(_QWORD *)(v80 + 1712) = *(_QWORD *)(v79 + 24);
      v79 += 60;
      --v78;
    }
    while (v78);
  }
  if (v70)
  {
    if (v70 == 1)
    {
      v81 = 0;
LABEL_76:
      v86 = v70 - v81;
      v87 = &v65[15 * v81 + 6];
      do
      {
        *(_DWORD *)(a3 + 1724 * *(v87 - 1) + 4) = *v87;
        v87 += 15;
        --v86;
      }
      while (v86);
      goto LABEL_78;
    }
    v81 = v70 & 0xFFFFFFFE;
    v82 = v65 + 21;
    v83 = v81;
    do
    {
      v84 = *v82;
      v85 = a3 + 1724 * *(v82 - 1);
      *(_DWORD *)(a3 + 1724 * *(v82 - 16) + 4) = *(v82 - 15);
      *(_DWORD *)(v85 + 4) = v84;
      v82 += 30;
      v83 -= 2;
    }
    while (v83);
    if (v81 != v70)
      goto LABEL_76;
  }
LABEL_78:
  if (!v41)
    goto LABEL_86;
  if (v41 == 1)
  {
    v88 = 0;
LABEL_84:
    v93 = v41 - v88;
    v94 = &v64[15 * v88 + 6];
    do
    {
      *(_DWORD *)(a3 + 1724 * *(v94 - 1) + 4) = *v94;
      v94 += 15;
      --v93;
    }
    while (v93);
    goto LABEL_86;
  }
  v88 = v41 & 0xFFFFFFFE;
  v89 = v64 + 21;
  v90 = v88;
  do
  {
    v91 = *v89;
    v92 = a3 + 1724 * *(v89 - 1);
    *(_DWORD *)(a3 + 1724 * *(v89 - 16) + 4) = *(v89 - 15);
    *(_DWORD *)(v92 + 4) = v91;
    v89 += 30;
    v90 -= 2;
  }
  while (v90);
  if (v88 != v41)
    goto LABEL_84;
LABEL_86:
  if ((_DWORD)result)
  {
    v95 = 0;
    do
    {
      if (!*(_DWORD *)(a1 + 1724 * v95 + 512))
      {
        if (v68)
        {
          LOBYTE(v96) = 0;
          v97 = (int *)a3;
          v98 = v68;
          do
          {
            if (!v97[128])
            {
              v99 = v97[1];
              v100 = v97[2];
              v96 = *(_DWORD *)(a1 + 1724 * v95 + 4) == v99 && v99 != 0;
              if (v100 == 10 && v96)
              {
                v106 = a1 + 1724 * v95;
                v107 = *v97;
                if (*(_DWORD *)(v106 + 1704) != v107)
                  *(_DWORD *)(a1 + 1724 * v95 + 1712) = 0;
                *(_DWORD *)(v106 + 1704) = v107;
                goto LABEL_89;
              }
              if (v100 == 11 && v96)
              {
                v104 = a1 + 1724 * v95;
                v105 = *v97;
                if (*(_DWORD *)(v104 + 1708) != v105)
                  *(_DWORD *)(a1 + 1724 * v95 + 1716) = 0;
                *(_DWORD *)(v104 + 1708) = v105;
                goto LABEL_89;
              }
            }
            v97 += 431;
            --v98;
          }
          while (v98);
          if (v96)
            goto LABEL_89;
        }
        *(_OWORD *)(a1 + 1724 * v95 + 1704) = xmmword_235916920;
      }
LABEL_89:
      ++v95;
    }
    while (v95 != result);
  }
  return result;
}

int *AcTrkProcLearnedGroupID(int *result, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int *a11, uint64_t a12, uint64_t a13, uint64_t a14, _DWORD *a15, _DWORD *a16)
{
  unsigned int v16;
  uint64_t v17;
  int *v18;
  uint64_t i;
  uint64_t v20;
  _DWORD *v21;
  int v22;
  uint64_t v23;
  int *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  int *v29;
  int v30;
  uint64_t v31;
  unsigned int v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  int *v41;
  int v42;
  __int128 *v43;
  unsigned int v44;
  uint64_t v45;
  __int128 v46;

  v16 = 0;
  if (a2)
  {
    v17 = a2;
    v18 = result + 2;
    do
    {
      if (*v18 <= 5)
        a11[v16++] = *(v18 - 1);
      v18 += 431;
      --v17;
    }
    while (v17);
  }
  if (!a6)
    goto LABEL_27;
  for (i = 0; i != a6; ++i)
  {
    if (a2)
    {
      v20 = 0;
      v21 = result + 2;
      while (*v21 != 1 || *(_DWORD *)(a9 + 4 * v20) != *(_DWORD *)(a7 + 4 * i))
      {
        v21 += 431;
        if (a2 == ++v20)
          goto LABEL_16;
      }
      v22 = result[431 * v20 + 1];
    }
    else
    {
LABEL_16:
      v22 = *(_DWORD *)(a5 + 1724 * i + 4);
      v23 = v16;
      v24 = a11;
      if (v16)
      {
        while (1)
        {
          v25 = *v24++;
          if (v25 == v22)
            break;
          if (!--v23)
            goto LABEL_19;
        }
LABEL_8:
        *(_DWORD *)(a12 + 4 * i) = (*a16)++;
        continue;
      }
LABEL_19:
      if (!v22)
        goto LABEL_8;
    }
    *(_DWORD *)(a12 + 4 * i) = v22;
  }
  if (a6 <= 0xF || __CFADD__(v16, a6 - 1) || (unint64_t)&a11[v16] - a12 < 0x20)
  {
    v26 = 0;
    goto LABEL_25;
  }
  v26 = a6 & 0xFFFFFFF8;
  v43 = (__int128 *)(a12 + 16);
  v44 = v16;
  v45 = v26;
  do
  {
    v46 = *v43;
    result = &a11[v44];
    *(_OWORD *)result = *(v43 - 1);
    *((_OWORD *)result + 1) = v46;
    v43 += 2;
    v44 += 8;
    v45 -= 8;
  }
  while (v45);
  if (v26 != a6)
  {
LABEL_25:
    v27 = a6 - v26;
    v28 = v16 + v26;
    v29 = (int *)(a12 + 4 * v26);
    do
    {
      v30 = *v29++;
      a11[v28++] = v30;
      --v27;
    }
    while (v27);
  }
LABEL_27:
  *a15 = 0;
  if (a4)
  {
    v31 = 0;
    v32 = v16 + a6;
    v33 = a4;
    result = (int *)a6;
    do
    {
      v36 = a3 + 1724 * v31;
      v37 = *(_DWORD *)(v36 + 8);
      if (v37 == 11)
      {
        if (a6)
        {
          v38 = 0;
          while (*(_DWORD *)(a8 + 4 * v38) != *(_DWORD *)(a10 + 4 * v31))
          {
            if (a6 == ++v38)
              goto LABEL_42;
          }
          goto LABEL_49;
        }
      }
      else if (v37 == 10 && a6)
      {
        v38 = 0;
        while (*(_DWORD *)(a8 + 4 * v38) != *(_DWORD *)(a10 + 4 * v31))
        {
          if (a6 == ++v38)
            goto LABEL_42;
        }
        v38 = v38;
LABEL_49:
        *(_DWORD *)(a13 + 4 * v31) = *(_DWORD *)(a12 + 4 * v38);
        a11[v32] = *(_DWORD *)(v36 + 4);
        v34 = 1;
        goto LABEL_30;
      }
LABEL_42:
      v39 = *(_DWORD *)(v36 + 4);
      if (v32)
      {
        v40 = v32;
        v41 = a11;
        while (1)
        {
          v42 = *v41++;
          if (v42 == v39)
            break;
          if (!--v40)
            goto LABEL_46;
        }
      }
      else
      {
LABEL_46:
        if (v39)
        {
          v34 = 0;
          *(_DWORD *)(a13 + 4 * v31) = v39;
          a11[v32] = *(_DWORD *)(v36 + 4);
          goto LABEL_30;
        }
      }
      v34 = 0;
      *(_DWORD *)(a13 + 4 * v31) = *a16;
      a11[v32] = (*a16)++;
LABEL_30:
      ++v31;
      ++v32;
      v35 = *a15;
      *a15 = v35 + 1;
      *(_DWORD *)(a14 + 4 * v35) = v34;
    }
    while (v31 != v33);
  }
  return result;
}

uint64_t acTrkProcGroupID(uint64_t result, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int *a13, uint64_t a14, uint64_t a15, _DWORD *a16)
{
  unsigned int v16;
  uint64_t v17;
  _DWORD *v18;
  uint64_t i;
  uint64_t v20;
  _DWORD *v21;
  int v22;
  uint64_t v23;
  int *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  int *v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  int *v39;
  int v40;
  __int128 *v41;
  unsigned int v42;
  uint64_t v43;
  __int128 v44;
  int *v45;

  v16 = 0;
  if (a2)
  {
    v17 = a2;
    v18 = (_DWORD *)(result + 8);
    do
    {
      if (*v18 <= 1u)
        a13[v16++] = *(v18 - 1);
      v18 += 431;
      --v17;
    }
    while (v17);
  }
  if (!a6)
    goto LABEL_27;
  for (i = 0; i != a6; ++i)
  {
    if (a2)
    {
      v20 = 0;
      v21 = (_DWORD *)(result + 8);
      while (*v21 != 1 || *(_DWORD *)(a10 + 4 * v20) != *(_DWORD *)(a7 + 4 * i))
      {
        v21 += 431;
        if (a2 == ++v20)
          goto LABEL_16;
      }
      v22 = *(_DWORD *)(result + 1724 * v20 + 4);
    }
    else
    {
LABEL_16:
      v22 = *(_DWORD *)(a5 + 1724 * i + 4);
      v23 = v16;
      v24 = a13;
      if (v16)
      {
        while (1)
        {
          v25 = *v24++;
          if (v25 == v22)
            break;
          if (!--v23)
            goto LABEL_19;
        }
LABEL_8:
        *(_DWORD *)(a14 + 4 * i) = (*a16)++;
        continue;
      }
LABEL_19:
      if (!v22)
        goto LABEL_8;
    }
    *(_DWORD *)(a14 + 4 * i) = v22;
  }
  if (a6 <= 0xF || __CFADD__(v16, a6 - 1) || (unint64_t)&a13[v16] - a14 < 0x20)
  {
    v26 = 0;
    goto LABEL_25;
  }
  v26 = a6 & 0xFFFFFFF8;
  v41 = (__int128 *)(a14 + 16);
  v42 = v16;
  v43 = v26;
  do
  {
    v44 = *v41;
    v45 = &a13[v42];
    *(_OWORD *)v45 = *(v41 - 1);
    *((_OWORD *)v45 + 1) = v44;
    v41 += 2;
    v42 += 8;
    v43 -= 8;
  }
  while (v43);
  if (v26 != a6)
  {
LABEL_25:
    v27 = a6 - v26;
    v28 = v16 + v26;
    v29 = (int *)(a14 + 4 * v26);
    do
    {
      v30 = *v29++;
      a13[v28++] = v30;
      --v27;
    }
    while (v27);
  }
LABEL_27:
  if (a4)
  {
    v31 = 0;
    v32 = v16 + a6;
    v33 = a4;
    result = a9;
    do
    {
      v34 = a3 + 1724 * v31;
      v35 = *(_DWORD *)(v34 + 8);
      if (v35 == 11)
      {
        if (a6)
        {
          v36 = 0;
          while (*(_DWORD *)(a9 + 4 * v36) != *(_DWORD *)(a12 + 4 * v31))
          {
            if (a6 == ++v36)
              goto LABEL_42;
          }
          goto LABEL_48;
        }
      }
      else if (v35 == 10 && a6)
      {
        v36 = 0;
        while (*(_DWORD *)(a8 + 4 * v36) != *(_DWORD *)(a11 + 4 * v31))
        {
          if (a6 == ++v36)
            goto LABEL_42;
        }
        v36 = v36;
LABEL_48:
        *(_DWORD *)(a15 + 4 * v31) = *(_DWORD *)(a14 + 4 * v36);
        goto LABEL_30;
      }
LABEL_42:
      v37 = *(_DWORD *)(v34 + 4);
      v38 = v32;
      v39 = a13;
      if ((_DWORD)v32)
      {
        while (1)
        {
          v40 = *v39++;
          if (v40 == v37)
            break;
          if (!--v38)
            goto LABEL_45;
        }
      }
      else
      {
LABEL_45:
        if (v37)
        {
          *(_DWORD *)(a15 + 4 * v31) = v37;
          goto LABEL_30;
        }
      }
      *(_DWORD *)(a15 + 4 * v31) = (*a16)++;
LABEL_30:
      ++v31;
    }
    while (v31 != v33);
  }
  return result;
}

BOOL acTrkGetTrackGroup(_DWORD *a1, unsigned int a2, int a3, _DWORD *a4)
{
  _BOOL8 result;
  unint64_t v5;
  int *v6;
  int v7;

  if (a2)
  {
    if (*a1 == a3)
    {
      result = 1;
      *a4 = 0;
      return result;
    }
    v5 = 0;
    v6 = a1 + 7;
    while (a2 - 1 != v5)
    {
      v7 = *v6;
      v6 += 7;
      ++v5;
      if (v7 == a3)
      {
        result = v5 < a2;
        *a4 = v5;
        return result;
      }
    }
  }
  return 0;
}

unint64_t acTrkHandbyLGroup(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7, int *a8, int *a9, uint64_t a10, int *a11, _DWORD *a12, unsigned int a13, int *a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  _DWORD *v28;
  _OWORD *v29;
  uint64_t v30;
  int v31;
  unsigned int v32;
  unsigned int *v33;
  int *v34;
  uint64_t v35;
  unsigned int v36;
  unsigned int v37;
  uint64_t v38;
  int *v39;
  int v40;
  int *v41;
  uint64_t v42;
  unsigned int v43;
  unsigned int v44;
  double v45;
  unint64_t v46;
  _DWORD *v47;
  uint64_t v48;
  void *v49;
  size_t v50;
  unsigned int v51;
  uint64_t v52;
  _DWORD *v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  int *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unsigned int v62;
  unsigned int v63;
  double v64;
  unint64_t v65;
  uint64_t v66;
  int *v67;
  _DWORD *v68;
  unint64_t result;
  unsigned int v70;
  uint64_t v71;
  _DWORD *v72;
  int v73;
  uint64_t v74;
  uint64_t v75;
  int *v76;
  _DWORD *v77;
  uint64_t v78;
  uint64_t v79;
  int *v80;
  uint64_t v81;
  int v82;
  uint64_t v83;
  uint64_t v84;
  _DWORD *v85;
  uint64_t v86;
  int *v87;
  uint64_t v88;
  int v89;
  unint64_t v90;
  uint64_t v91;
  int *v92;
  uint64_t v93;
  int *v94;
  uint64_t v95;
  int v96;
  unint64_t v97;
  uint64_t v98;
  int *v99;
  uint64_t v100;
  unsigned int v101;
  unint64_t v103;
  uint64_t v104;
  _DWORD *v105;
  int v106;
  _DWORD *v107;
  _DWORD *v108;
  int v109;
  int v110;
  char v111;
  unint64_t v112;
  unsigned int v113;
  uint64_t v114;
  unsigned int v115;
  BOOL v116;
  _DWORD *v117;
  _DWORD *v118;
  int *v119;
  char v120;
  int v121;
  int *v122;
  int v123;
  uint64_t v124;
  BOOL v125;
  _DWORD *v126;
  _DWORD *v127;
  _DWORD *v128;
  unsigned int v129;
  char v130;
  _DWORD *v131;
  int v132;
  uint64_t v133;
  _DWORD *v134;
  _DWORD *v135;
  unsigned int v136;
  _DWORD *v137;
  int v138;
  uint64_t v139;
  _DWORD *v140;
  uint64_t v141;
  _DWORD *v142;
  _OWORD *v143;
  __int128 v144;
  unsigned __int8 *v145;
  size_t TempBuffers;
  int *v147;
  uint64_t v148;
  uint64_t v149;
  _DWORD *v151;
  float *v154;
  _OWORD v155[2];
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  uint64_t v161;

  v161 = 0;
  v159 = 0u;
  v160 = 0u;
  v157 = 0u;
  v158 = 0u;
  v156 = 0u;
  memset(v155, 0, sizeof(v155));
  TempBuffers = acTrkGroupAssignGetTempBuffers(20, (uint64_t)a16, a3, (uint64_t)v155);
  bzero(a16, TempBuffers);
  v26 = (void *)v157;
  v154 = (float *)*((_QWORD *)&v156 + 1);
  v151 = (_DWORD *)a1;
  if (a2)
  {
    v27 = 0;
    v28 = (_DWORD *)(a7 + 24);
    v29 = (_OWORD *)(a1 + 452);
    v30 = a7;
    do
    {
      *(v28 - 2) = 9;
      *(_OWORD *)(v28 - 6) = *v29;
      *(v28 - 1) = v27;
      *v28 = ++v27;
      v28 += 15;
      v29 = (_OWORD *)((char *)v29 + 1724);
    }
    while (a2 != v27);
    v31 = v27 + 1;
    v32 = a4;
  }
  else
  {
    v31 = 1;
    v32 = a4;
    v30 = a7;
  }
  v145 = (unsigned __int8 *)*((_QWORD *)&v157 + 1);
  v33 = (unsigned int *)*((_QWORD *)&v158 + 1);
  v34 = (int *)v160;
  if (v32)
  {
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v38 = a3;
    while (1)
    {
      v40 = *(_DWORD *)(v38 + 8);
      if (v40 == 11)
      {
        v39 = &a9[15 * v36];
        *(_OWORD *)v39 = *(_OWORD *)(v38 + 452);
        v39[4] = 11;
        v39[5] = v35;
        v39[6] = v31;
        v39[14] = *(_DWORD *)(a10 + 4 * v35);
        ++v36;
      }
      else
      {
        if (v40 != 10)
          goto LABEL_10;
        v41 = &a8[15 * v37];
        *(_OWORD *)v41 = *(_OWORD *)(v38 + 452);
        v41[4] = 10;
        v41[5] = v35;
        v41[6] = v31;
        v41[14] = *(_DWORD *)(a10 + 4 * v35);
        ++v37;
      }
      ++v31;
LABEL_10:
      ++v35;
      v38 += 512;
      if (v32 == v35)
        goto LABEL_15;
    }
  }
  v37 = 0;
  v36 = 0;
LABEL_15:
  v148 = v30;
  if (a2 <= v37)
    v42 = v37;
  else
    v42 = a2;
  v147 = v34;
  acTrkLGroupIoUCost(v30, a2, a8, v37, (uint64_t)v154, v23, v24, v25, 10, v34, a18);
  memcpy(v26, v154, 4 * (v42 * v42));
  if (a2 && v37)
  {
    bmMunkres(v154, v42, v145, v43, v33, v44, 0, v45);
    v46 = 0;
    v47 = a8 + 6;
    v48 = v148;
    v50 = TempBuffers;
    v49 = a16;
    do
    {
      if (v46 < v37)
      {
        v51 = v33[v46];
        if (v51 >= a2 || (float)(1.0 - *((float *)v26 + v46 + v51 * (_DWORD)v42)) < 0.2)
          *v47 = v31++;
        else
          *v47 = *(_DWORD *)(v148 + 60 * v51 + 24);
      }
      ++v46;
      v47 += 15;
    }
    while (v42 != v46);
  }
  else if (a2)
  {
    v48 = v148;
    v50 = TempBuffers;
    v49 = a16;
  }
  else
  {
    v48 = v148;
    v50 = TempBuffers;
    v49 = a16;
    if (v37)
    {
      if (v37 >= 2)
      {
        v52 = v37 & 0xFFFFFFFE;
        v53 = a8 + 21;
        v54 = v31;
        v55 = v52;
        do
        {
          *(v53 - 15) = v54;
          *v53 = v54 + 1;
          v53 += 30;
          v54 += 2;
          v55 -= 2;
        }
        while (v55);
        v31 += v52;
        if (v52 == v37)
          goto LABEL_37;
      }
      else
      {
        v52 = 0;
      }
      v56 = v37 - v52;
      v57 = &a8[15 * v52 + 6];
      do
      {
        *v57 = v31;
        v57 += 15;
        ++v31;
        --v56;
      }
      while (v56);
    }
  }
LABEL_37:
  bzero(v49, v50);
  if (a2 <= v36)
    v61 = v36;
  else
    v61 = a2;
  acTrkLGroupIoUCost(v48, a2, a9, v36, (uint64_t)v154, v58, v59, v60, 11, v147, a18);
  memcpy(v26, v154, 4 * (v61 * v61));
  if (a2 && v36)
  {
    bmMunkres(v154, v61, v145, v62, v33, v63, 0, v64);
    v65 = 0;
    v66 = v148;
    v67 = a9;
    v68 = a9 + 6;
    result = a4;
    do
    {
      if (v65 < v36)
      {
        v70 = v33[v65];
        if (v70 >= a2 || (float)(1.0 - *((float *)v26 + v65 + v70 * (_DWORD)v61)) < 0.2)
          *v68 = v31++;
        else
          *v68 = *(_DWORD *)(v148 + 60 * v70 + 24);
      }
      ++v65;
      v68 += 15;
    }
    while (v61 != v65);
  }
  else
  {
    result = a4;
    v66 = v148;
    v67 = a9;
    if (!a2 && v36)
    {
      if (v36 >= 2)
      {
        v71 = v36 & 0xFFFFFFFE;
        v72 = a9 + 21;
        v73 = v31;
        v74 = v71;
        do
        {
          *(v72 - 15) = v73;
          *v72 = v73 + 1;
          v72 += 30;
          v73 += 2;
          v74 -= 2;
        }
        while (v74);
        if (v71 == v36)
          goto LABEL_59;
        v31 += v71;
      }
      else
      {
        v71 = 0;
      }
      v75 = v36 - v71;
      v76 = &a9[15 * v71 + 6];
      do
      {
        *v76 = v31;
        v76 += 15;
        ++v31;
        --v75;
      }
      while (v75);
    }
  }
LABEL_59:
  v77 = (_DWORD *)a1;
  v78 = a3;
  if (!a2)
    goto LABEL_67;
  if (a2 == 1)
  {
    v79 = 0;
LABEL_65:
    v84 = a2 - v79;
    v85 = (_DWORD *)(v66 + 60 * v79 + 24);
    do
    {
      *(_DWORD *)(a1 + 1724 * *(v85 - 1) + 4) = *v85;
      v85 += 15;
      --v84;
    }
    while (v84);
    goto LABEL_67;
  }
  v79 = a2 & 0xFFFFFFFE;
  v80 = (int *)(v66 + 84);
  v81 = v79;
  do
  {
    v82 = *v80;
    v83 = a1 + 1724 * *(v80 - 1);
    *(_DWORD *)(a1 + 1724 * *(v80 - 16) + 4) = *(v80 - 15);
    *(_DWORD *)(v83 + 4) = v82;
    v80 += 30;
    v81 -= 2;
  }
  while (v81);
  if (v79 != a2)
    goto LABEL_65;
LABEL_67:
  if (!v37)
    goto LABEL_75;
  if (v37 == 1)
  {
    v86 = 0;
LABEL_73:
    v91 = v37 - v86;
    v92 = &a8[15 * v86 + 6];
    do
    {
      *(_DWORD *)(a3 + ((unint64_t)*(v92 - 1) << 9) + 4) = *v92;
      v92 += 15;
      --v91;
    }
    while (v91);
    goto LABEL_75;
  }
  v86 = v37 & 0xFFFFFFFE;
  v87 = a8 + 21;
  v88 = v86;
  do
  {
    v89 = *v87;
    v90 = a3 + ((unint64_t)*(v87 - 1) << 9);
    *(_DWORD *)(a3 + ((unint64_t)*(v87 - 16) << 9) + 4) = *(v87 - 15);
    *(_DWORD *)(v90 + 4) = v89;
    v87 += 30;
    v88 -= 2;
  }
  while (v88);
  if (v86 != v37)
    goto LABEL_73;
LABEL_75:
  if (v36)
  {
    if (v36 == 1)
    {
      v93 = 0;
    }
    else
    {
      v93 = v36 & 0xFFFFFFFE;
      v94 = v67 + 21;
      v95 = v93;
      do
      {
        v96 = *v94;
        v97 = a3 + ((unint64_t)*(v94 - 1) << 9);
        *(_DWORD *)(a3 + ((unint64_t)*(v94 - 16) << 9) + 4) = *(v94 - 15);
        *(_DWORD *)(v97 + 4) = v96;
        v94 += 30;
        v95 -= 2;
      }
      while (v95);
      if (v93 == v36)
        goto LABEL_83;
    }
    v98 = v36 - v93;
    v99 = &v67[15 * v93 + 6];
    do
    {
      *(_DWORD *)(a3 + ((unint64_t)*(v99 - 1) << 9) + 4) = *v99;
      v99 += 15;
      --v98;
    }
    while (v98);
  }
LABEL_83:
  if (!a2)
  {
    *a14 = 0;
    return result;
  }
  v100 = 0;
  v101 = 0;
  v103 = result;
  v104 = a2;
  v105 = (_DWORD *)(a3 + 8);
  v149 = a2;
  do
  {
    v110 = v77[431 * v100];
    v109 = v77[431 * v100 + 1];
    if (a13)
    {
      if (*a12 == v110)
      {
        v111 = 0;
        LODWORD(v112) = 0;
        if (!(_DWORD)result)
          goto LABEL_85;
        goto LABEL_94;
      }
      v112 = 0;
      v113 = a13;
      v122 = a12 + 7;
      while (a13 - 1 != v112)
      {
        v123 = *v122;
        v122 += 7;
        ++v112;
        if (v123 == v110)
        {
          if (v112 >= a13)
            break;
          v111 = 0;
          if ((_DWORD)result)
            goto LABEL_94;
          goto LABEL_85;
        }
      }
    }
    else
    {
      v113 = 0;
    }
    a12[7 * v113] = v110;
    LODWORD(v112) = a13++;
    v111 = 1;
    if (!(_DWORD)result)
    {
LABEL_85:
      v106 = v112;
      v107 = &a12[7 * v112 + 3];
      goto LABEL_86;
    }
LABEL_94:
    v114 = 0;
    v115 = *(_DWORD *)(a19 + 84);
    v116 = 1;
    v117 = v105;
    while (*(v117 - 1) != v109 || *v117 != 10)
    {
      v116 = ++v114 < v103;
      v117 += 128;
      if (v103 == v114)
      {
        v116 = 0;
        LODWORD(v114) = 0;
        goto LABEL_113;
      }
    }
    v118 = &a12[7 * v112];
    v119 = v118 + 1;
    if (v118[3] > v115)
      v120 = 1;
    else
      v120 = v111;
    if ((v120 & 1) != 0 || !a12[7 * v112 + 5])
    {
      *v119 = *a11;
      v121 = (*a11)++;
    }
    else
    {
      v121 = *v119;
    }
    *(_DWORD *)(v78 + (v114 << 9)) = v121;
LABEL_113:
    v124 = 0;
    v125 = 1;
    v126 = v105;
    do
    {
      if (*(v126 - 1) == v109 && *v126 == 11)
      {
        v106 = v112;
        v127 = &a12[7 * v112];
        v129 = v127[4];
        v128 = v127 + 4;
        if (v129 > v115)
          v130 = 1;
        else
          v130 = v111;
        if ((v130 & 1) != 0 || (v131 = &a12[7 * v112], !v131[6]))
        {
          a12[7 * v112 + 1] = *a11;
          v132 = (*a11)++;
        }
        else
        {
          v132 = v131[2];
        }
        *(_DWORD *)(v78 + (v124 << 9)) = v132;
        if (v116)
        {
          v133 = v101 + 1;
          memcpy((void *)(a5 + ((unint64_t)v101 << 9)), (const void *)(v78 + ((unint64_t)v114 << 9)), 0x200uLL);
          if (!v125)
          {
            LODWORD(result) = a4;
            v105 = (_DWORD *)(a3 + 8);
            v104 = v149;
            goto LABEL_133;
          }
          memcpy((void *)(a5 + (v133 << 9)), (const void *)(a3 + ((unint64_t)v124 << 9)), 0x200uLL);
          v134 = &a12[7 * v112];
          v134[3] = 0;
          v135 = v134 + 5;
          LODWORD(result) = a4;
          v105 = (_DWORD *)(a3 + 8);
          v104 = v149;
        }
        else
        {
          if (!v125)
            goto LABEL_85;
          v136 = v101;
          memcpy((void *)(a5 + ((unint64_t)v101 << 9)), (const void *)(v78 + ((unint64_t)v124 << 9)), 0x200uLL);
          v105 = (_DWORD *)(a3 + 8);
          v104 = v149;
          LODWORD(result) = a4;
          v135 = &a12[7 * v106 + 3];
          LODWORD(v133) = v136;
        }
        v101 = v133 + 1;
        ++*v135;
        *v128 = 0;
        v108 = &a12[7 * v106 + 6];
        v77 = v151;
        v78 = a3;
        goto LABEL_87;
      }
      v125 = ++v124 < v103;
      v126 += 128;
    }
    while (v103 != v124);
    if (!v116)
      goto LABEL_85;
    LODWORD(v133) = v101 + 1;
    memcpy((void *)(a5 + ((unint64_t)v101 << 9)), (const void *)(v78 + ((unint64_t)v114 << 9)), 0x200uLL);
    v105 = (_DWORD *)(a3 + 8);
    v104 = v149;
    LODWORD(result) = a4;
    v106 = v112;
LABEL_133:
    v137 = &a12[7 * v106];
    v137[3] = 0;
    v107 = v137 + 5;
    v101 = v133;
    v77 = v151;
    v78 = a3;
LABEL_86:
    ++*v107;
    v108 = &a12[7 * v106 + 4];
LABEL_87:
    ++*v108;
    ++v100;
  }
  while (v100 != v104);
  result = (unint64_t)a14;
  *a14 = 0;
  if (a13)
  {
    v138 = 0;
    v139 = 0;
    do
    {
      v140 = &a12[7 * v139];
      v141 = v104;
      v142 = v77;
      while (*v142 != *v140)
      {
        v142 += 431;
        if (!--v141)
          goto LABEL_137;
      }
      if (v139 != v138)
      {
        v143 = &a12[7 * v138];
        v144 = *(_OWORD *)v140;
        *(_OWORD *)((char *)v143 + 12) = *(_OWORD *)(v140 + 3);
        *v143 = v144;
        v138 = *a14;
      }
      *a14 = ++v138;
LABEL_137:
      ++v139;
    }
    while (v139 != a13);
  }
  return result;
}

void acLGroupHandFbody(uint64_t a1, int a2, uint64_t a3, int a4, uint64_t a5, int *a6, uint64_t a7, int a8, uint64_t a9, _DWORD *a10, uint64_t a11, _DWORD *a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16)
{
  unsigned int TempBuffers;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  int *v34;
  uint64_t v35;
  unsigned int v36;
  uint64_t v37;
  int *v38;
  unsigned __int8 *v39;
  unsigned int *v40;
  uint64_t v41;
  void *v42;
  unsigned int v43;
  unsigned int v44;
  double v45;
  unint64_t v46;
  _DWORD *v47;
  unsigned int v48;
  int v49;
  void *__dst;
  _OWORD v51[2];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;

  v57 = 0;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v52 = 0u;
  memset(v51, 0, sizeof(v51));
  TempBuffers = acTrkGroupAssignGetTempBuffers(20, (uint64_t)a14, a3, (uint64_t)v51);
  bzero(a14, TempBuffers);
  v28 = *((_QWORD *)&v52 + 1);
  v27 = (void *)v53;
  if (a2)
  {
    v29 = 0;
    v30 = 0;
    v31 = a1 + 452;
    v32 = 1;
    do
    {
      if (!*(_DWORD *)(v31 + 60))
      {
        v33 = a5 + 60 * v30;
        *(_DWORD *)(v33 + 16) = 9;
        *(_OWORD *)v33 = *(_OWORD *)v31;
        *(_DWORD *)(v33 + 20) = v29;
        *(_DWORD *)(v33 + 24) = v32;
        ++v30;
        ++v32;
      }
      ++v29;
      v31 += 1724;
    }
    while (a2 != v29);
  }
  else
  {
    v30 = 0;
    v32 = 1;
  }
  v34 = (int *)v56;
  __dst = v27;
  if (a4)
  {
    v35 = 0;
    v36 = 0;
    v37 = a3 + 452;
    do
    {
      if (!*(_DWORD *)(v37 + 60) && *(_DWORD *)(v37 - 444) == a8)
      {
        v38 = &a6[15 * v36];
        *(_OWORD *)v38 = *(_OWORD *)v37;
        v38[4] = 10;
        v38[5] = v35;
        v38[6] = v32;
        ++v36;
        ++v32;
      }
      v37 += 1724;
      ++v35;
    }
    while (a4 != v35);
  }
  else
  {
    v36 = 0;
  }
  v39 = (unsigned __int8 *)*((_QWORD *)&v53 + 1);
  v40 = (unsigned int *)*((_QWORD *)&v54 + 1);
  if (v30 <= v36)
    v41 = v36;
  else
    v41 = v30;
  *a10 = 0;
  *a12 = 0;
  v49 = a8;
  v42 = (void *)v28;
  acTrkLGroupIoUCost(a5, v30, a6, v36, v28, v24, v25, v26, v49, v34, a16);
  memcpy(__dst, v42, 4 * (v41 * v41));
  if (v30 && v36)
  {
    bmMunkres((float *)v42, v41, v39, v43, v40, v44, 0, v45);
    v46 = 0;
    v47 = a6 + 6;
    do
    {
      if (v46 < v36)
      {
        v48 = v40[v46];
        if (v48 >= v30 || (float)(1.0 - *((float *)__dst + v46 + v48 * (_DWORD)v41)) < 0.2)
          *v47 = v32++;
        else
          *v47 = *(_DWORD *)(a5 + 60 * v48 + 24);
      }
      ++v46;
      v47 += 15;
    }
    while (v41 != v46);
  }
}

uint64_t AcDetNode::AcDetNode(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a1 + 250240) = 0;
  bzero((void *)a1, 0x58FuLL);
  *(_OWORD *)(a1 + 1440) = 0u;
  *(_OWORD *)(a1 + 1424) = 0u;
  *(_DWORD *)(a2 + 8) = 0;
  *(_QWORD *)a2 = 0xDE7C00000002;
  return a1;
}

{
  *(_QWORD *)(a1 + 250240) = 0;
  bzero((void *)a1, 0x58FuLL);
  *(_OWORD *)(a1 + 1440) = 0u;
  *(_OWORD *)(a1 + 1424) = 0u;
  *(_DWORD *)(a2 + 8) = 0;
  *(_QWORD *)a2 = 0xDE7C00000002;
  return a1;
}

void AcDetNode::~AcDetNode(AcDetNode *this)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = (_QWORD *)((char *)this + 250240);
  v3 = *((_QWORD *)this + 31280);
  if (v3)
  {
    MEMORY[0x23B7DA6CC](v3, 0x1000C8077774924);
    *v2 = 0;
  }
  v4 = *((_QWORD *)this + 178);
  if (v4)
  {
    MEMORY[0x23B7DA6CC](v4, 0x1000C8052888210);
    *((_QWORD *)this + 178) = 0;
  }
  v5 = *((_QWORD *)this + 179);
  if (v5)
  {
    MEMORY[0x23B7DA6CC](v5, 0x1000C8052888210);
    *((_QWORD *)this + 179) = 0;
  }
  v6 = *((_QWORD *)this + 180);
  if (v6)
  {
    MEMORY[0x23B7DA6CC](v6, 0x1000C8052888210);
    *((_QWORD *)this + 180) = 0;
  }
  v7 = *((_QWORD *)this + 181);
  if (v7)
  {
    MEMORY[0x23B7DA6CC](v7, 0x1000C8052888210);
    *((_QWORD *)this + 181) = 0;
  }
}

uint64_t AcDetNode::init(uint64_t a1, float *a2, _DWORD *a3)
{
  int v3;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  if (*a3 != 2)
    return 4294967289;
  v3 = a3[1];
  if (v3 != 56956 && v3 != 56945)
    return 4294967292;
  if (!a2)
    a2 = (float *)&kAcDetNodeConfigFPS30RawData;
  if (!*((_DWORD *)a2 + 6)
    || !*((_DWORD *)a2 + 5)
    || a2[17] < 0.0
    || *((_DWORD *)a2 + 61) > 0x40u
    || *((_DWORD *)a2 + 62) > 0x30u
    || !*((_DWORD *)a2 + 63)
    || *((_BYTE *)a2 + 387)
    || *((_BYTE *)a2 + 451)
    || *((_BYTE *)a2 + 515)
    || *((_BYTE *)a2 + 579)
    || *((_BYTE *)a2 + 643)
    || *((_BYTE *)a2 + 707)
    || *((_BYTE *)a2 + 771)
    || *((_BYTE *)a2 + 835)
    || *((_BYTE *)a2 + 899)
    || *((_BYTE *)a2 + 963)
    || *((_BYTE *)a2 + 1027)
    || *((_BYTE *)a2 + 1091)
    || *((_BYTE *)a2 + 1155)
    || *((_BYTE *)a2 + 1219)
    || *((_BYTE *)a2 + 1283)
    || *((_BYTE *)a2 + 1347)
    || *((_BYTE *)a2 + 1411))
  {
    return 4294967292;
  }
  v6 = a1 + 250240;
  *(_BYTE *)(a1 + 1422) = 0;
  *(_WORD *)(a1 + 1420) = 0;
  memcpy((void *)a1, a2, 0x58CuLL);
  *(_BYTE *)(v6 + 20) = 0;
  *(_QWORD *)(a3 + 1) = 0xDE70000DE71;
  *(_DWORD *)(v6 + 8) = 2538;
  v7 = operator new[]();
  result = 0;
  *(_QWORD *)v6 = v7;
  return result;
}

void AcDetNode::generateFCOSLocations(AcDetNode *this, unsigned int a2, unsigned int a3, unsigned int a4, float *a5, float *a6, double a7, double a8, double a9, double a10, double a11, __n128 a12)
{
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  float v15;
  unsigned int v16;
  float v17;
  float v18;
  unsigned int v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  uint64_t v25;
  float *v26;
  float *v27;
  int32x4_t v28;
  int32x4_t v29;
  unsigned int v30;
  uint64_t v31;
  int32x4_t v32;
  int32x4_t v33;
  uint64_t v34;
  float *v35;
  float *v36;
  unsigned int v37;
  uint64_t v38;
  __n128 *v39;
  float32x4_t *v40;
  uint64_t v41;
  int32x4_t v42;
  unsigned int v43;
  uint64_t v44;
  int32x4_t v45;
  int32x4_t v46;
  uint64_t v47;
  uint64_t v48;
  float *v49;
  float32x4_t *v50;
  int32x4_t v51;
  uint64_t v52;
  int32x4_t v53;
  uint64_t v54;
  uint64_t v55;
  _DWORD *v56;
  float *v57;
  unsigned int v58;

  if (a2 && a3)
  {
    v12 = a4 >> 1;
    v13 = a2;
    if (a3 > 7)
    {
      v28 = vdupq_n_s32(a4);
      v29 = vdupq_n_s32(v12);
      if ((a3 & 0xFFFFFFF8) == (unint64_t)a3)
      {
        v30 = 0;
        v31 = 0;
        v32.i64[0] = 0x400000004;
        v32.i64[1] = 0x400000004;
        v33.i64[0] = 0x800000008;
        v33.i64[1] = 0x800000008;
        do
        {
          v34 = v30;
          a12.n128_f32[0] = (float)(v12 + v31 * a4);
          if ((unint64_t)((char *)a6 - (char *)a5) > 0x1F)
          {
            v39 = (__n128 *)&a6[v34 + 4];
            v40 = (float32x4_t *)&a5[v34 + 4];
            a12 = (__n128)vdupq_lane_s32((int32x2_t)a12.n128_u64[0], 0);
            v41 = a3;
            v42 = (int32x4_t)xmmword_2359168E0;
            do
            {
              v40[-1] = vcvtq_f32_u32((uint32x4_t)vmlaq_s32(v29, v42, v28));
              *v40 = vcvtq_f32_u32((uint32x4_t)vmlaq_s32(v29, vaddq_s32(v42, v32), v28));
              v39[-1] = a12;
              *v39 = a12;
              v42 = vaddq_s32(v42, v33);
              v39 += 2;
              v40 += 2;
              v41 -= 8;
            }
            while (v41);
          }
          else
          {
            v35 = &a6[v34];
            v36 = &a5[v34];
            v37 = a4 >> 1;
            v38 = a3;
            do
            {
              *v36++ = (float)v37;
              *v35++ = a12.n128_f32[0];
              v37 += a4;
              --v38;
            }
            while (v38);
          }
          ++v31;
          v30 += a3;
        }
        while (v31 != a2);
      }
      else
      {
        v43 = 0;
        v44 = 0;
        v45.i64[0] = 0x400000004;
        v45.i64[1] = 0x400000004;
        v46.i64[0] = 0x800000008;
        v46.i64[1] = 0x800000008;
        do
        {
          v47 = v43;
          a12.n128_f32[0] = (float)(v12 + v44 * a4);
          if ((unint64_t)((char *)a6 - (char *)a5) >= 0x20)
          {
            v49 = &a6[v47 + 4];
            v50 = (float32x4_t *)&a5[v47 + 4];
            v51 = vdupq_lane_s32((int32x2_t)a12.n128_u64[0], 0);
            v52 = a3 & 0xFFFFFFF8;
            v53 = (int32x4_t)xmmword_2359168E0;
            do
            {
              v50[-1] = vcvtq_f32_u32((uint32x4_t)vmlaq_s32(v29, v53, v28));
              *v50 = vcvtq_f32_u32((uint32x4_t)vmlaq_s32(v29, vaddq_s32(v53, v45), v28));
              *((int32x4_t *)v49 - 1) = v51;
              *(int32x4_t *)v49 = v51;
              v53 = vaddq_s32(v53, v46);
              v49 += 8;
              v50 += 2;
              v52 -= 8;
            }
            while (v52);
            v48 = a3 & 0xFFFFFFF8;
          }
          else
          {
            v48 = 0;
          }
          v54 = a3 - v48;
          v55 = v47 * 4 + 4 * v48;
          v56 = (_DWORD *)((char *)a6 + v55);
          v57 = (float *)((char *)a5 + v55);
          v58 = v12 + a4 * v48;
          do
          {
            *v57++ = (float)v58;
            *v56++ = a12.n128_u32[0];
            v58 += a4;
            --v54;
          }
          while (v54);
          ++v44;
          v43 += a3;
        }
        while (v44 != v13);
      }
    }
    else
    {
      v14 = 0;
      v15 = (float)(v12 + a4);
      v16 = v12 + 2 * a4;
      v17 = (float)v16;
      v18 = (float)(v16 + a4);
      v19 = v12 + 4 * a4;
      v20 = (float)v19;
      v21 = (float)(v19 + a4);
      v22 = (float)(v12 + 6 * a4);
      v23 = (float)v12;
      do
      {
        v24 = (float)v12;
        v25 = v14;
        v26 = &a5[v25];
        v27 = &a6[v25];
        *v26 = v23;
        *v27 = (float)v12;
        if (a3 != 1)
        {
          v26[1] = v15;
          v27[1] = v24;
          if (a3 != 2)
          {
            v26[2] = v17;
            v27[2] = v24;
            if (a3 != 3)
            {
              v26[3] = v18;
              v27[3] = v24;
              if (a3 != 4)
              {
                v26[4] = v20;
                v27[4] = v24;
                if (a3 != 5)
                {
                  v26[5] = v21;
                  v27[5] = v24;
                  if (a3 != 6)
                  {
                    v26[6] = v22;
                    v27[6] = v24;
                  }
                }
              }
            }
          }
        }
        v14 += a3;
        v12 += a4;
        --v13;
      }
      while (v13);
    }
  }
}

void AcDetNode::postProcess(_QWORD *__dst, uint64_t a2, int32x4_t *a3, float32x4_t *a4, _DWORD *a5, uint64_t a6, uint64_t a7, int32x4_t a8)
{
  int v11;
  int v13;
  const void *v14;
  uint64_t v15;
  int32x4_t v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  float v25;
  float v26;
  unsigned int v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  uint64_t v33;
  uint64_t v34;
  float *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  int32x4_t v41;
  unsigned int v42;
  uint64_t v43;
  int32x4_t v44;
  int32x4_t v45;
  uint64_t v46;
  unsigned int v47;
  uint64_t v48;
  uint64_t v49;
  int32x4_t v50;
  unsigned int v51;
  uint64_t v52;
  int32x4_t v53;
  int32x4_t v54;
  uint64_t v55;
  uint64_t v56;
  int32x4_t *v57;
  float32x4_t *v58;
  int32x4_t v59;
  uint64_t v60;
  int32x4_t v61;
  uint64_t v62;
  float *v63;
  unsigned int v64;
  uint64_t v65;
  uint64_t v66;
  unsigned int v67;
  uint64_t v68;
  unsigned int v69;
  unsigned int v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float v75;
  float v76;
  float v77;
  uint64_t v78;
  uint64_t v79;
  float *v80;
  unsigned int v81;
  uint64_t v82;
  int32x4_t v83;
  int32x4_t v84;
  int32x4_t v85;
  uint64_t v86;
  uint64_t v87;
  int32x4_t v88;
  uint64_t v89;
  int32x4_t v90;
  uint64_t v91;
  _DWORD *v92;
  unsigned int v93;

  if (*a5 != 2 || (_DWORD)a3 != 17 || a5[1] != 56945)
    return;
  v11 = (int)a4;
  if (!__dst[178])
  {
    __dst[178] = operator new[]();
    __dst[179] = operator new[]();
    __dst[180] = operator new[]();
    v15 = operator new[]();
    __dst[181] = v15;
    v17 = *(unsigned int *)(a2 + 32);
    v18 = *((_DWORD *)__dst + 63);
    if ((_DWORD)v17)
    {
      v19 = *(unsigned int *)(a2 + 36);
      if ((_DWORD)v19)
      {
        v20 = __dst[178];
        v21 = __dst[179];
        v22 = v18 >> 1;
        if (v19 > 7)
        {
          a8 = vdupq_n_s32(v18);
          v41 = vdupq_n_s32(v22);
          if ((v19 & 0xFFFFFFF8) == v19)
          {
            v42 = 0;
            v43 = 0;
            v44.i64[0] = 0x400000004;
            v44.i64[1] = 0x400000004;
            v45.i64[0] = 0x800000008;
            v45.i64[1] = 0x800000008;
            do
            {
              v46 = 4 * v42;
              *(float *)v16.i32 = (float)(v22 + v18 * v43);
              if ((unint64_t)(v21 - v20) > 0x1F)
              {
                a3 = (int32x4_t *)(v21 + 16 + v46);
                a4 = (float32x4_t *)(v20 + 16 + v46);
                v16 = vdupq_lane_s32(*(int32x2_t *)v16.i8, 0);
                v49 = v19 & 0xFFFFFFF8;
                v50 = (int32x4_t)xmmword_2359168E0;
                do
                {
                  a4[-1] = vcvtq_f32_u32((uint32x4_t)vmlaq_s32(v41, a8, v50));
                  *a4 = vcvtq_f32_u32((uint32x4_t)vmlaq_s32(v41, a8, vaddq_s32(v50, v44)));
                  a3[-1] = v16;
                  *a3 = v16;
                  v50 = vaddq_s32(v50, v45);
                  a3 += 2;
                  a4 += 2;
                  v49 -= 8;
                }
                while (v49);
              }
              else
              {
                a3 = (int32x4_t *)(v21 + v46);
                a4 = (float32x4_t *)(v20 + v46);
                v47 = v18 >> 1;
                v48 = v19;
                do
                {
                  a4->f32[0] = (float)v47;
                  a4 = (float32x4_t *)((char *)a4 + 4);
                  a3->i32[0] = v16.i32[0];
                  a3 = (int32x4_t *)((char *)a3 + 4);
                  v47 += v18;
                  --v48;
                }
                while (v48);
              }
              ++v43;
              v42 += v19;
            }
            while (v43 != v17);
          }
          else
          {
            v51 = 0;
            v52 = 0;
            v53.i64[0] = 0x400000004;
            v53.i64[1] = 0x400000004;
            v54.i64[0] = 0x800000008;
            v54.i64[1] = 0x800000008;
            do
            {
              v55 = 4 * v51;
              *(float *)v16.i32 = (float)(v22 + v18 * v52);
              if ((unint64_t)(v21 - v20) >= 0x20)
              {
                v57 = (int32x4_t *)(v21 + 16 + v55);
                v58 = (float32x4_t *)(v20 + 16 + v55);
                v59 = vdupq_lane_s32(*(int32x2_t *)v16.i8, 0);
                v60 = v19 & 0xFFFFFFF8;
                v61 = (int32x4_t)xmmword_2359168E0;
                do
                {
                  v58[-1] = vcvtq_f32_u32((uint32x4_t)vmlaq_s32(v41, a8, v61));
                  *v58 = vcvtq_f32_u32((uint32x4_t)vmlaq_s32(v41, a8, vaddq_s32(v61, v53)));
                  v57[-1] = v59;
                  *v57 = v59;
                  v61 = vaddq_s32(v61, v54);
                  v57 += 2;
                  v58 += 2;
                  v60 -= 8;
                }
                while (v60);
                v56 = v19 & 0xFFFFFFF8;
              }
              else
              {
                v56 = 0;
              }
              a4 = (float32x4_t *)(v19 - v56);
              v62 = v55 + 4 * v56;
              a3 = (int32x4_t *)(v21 + v62);
              v63 = (float *)(v20 + v62);
              v64 = v22 + v18 * v56;
              do
              {
                *v63++ = (float)v64;
                a3->i32[0] = v16.i32[0];
                a3 = (int32x4_t *)((char *)a3 + 4);
                v64 += v18;
                a4 = (float32x4_t *)((char *)a4 - 1);
              }
              while (a4);
              ++v52;
              v51 += v19;
            }
            while (v52 != v17);
          }
        }
        else
        {
          v23 = 0;
          *(float *)a8.i32 = (float)(v18 + v22);
          v24 = v22 + 2 * v18;
          v25 = (float)v24;
          v26 = (float)(v24 + v18);
          v27 = v22 + 4 * v18;
          v28 = (float)v27;
          v29 = (float)(v27 + v18);
          v30 = (float)(v22 + 6 * v18);
          v31 = (float)v22;
          do
          {
            v32 = (float)v22;
            v33 = 4 * v23;
            v34 = v20 + v33;
            v35 = (float *)(v21 + v33);
            *(float *)v34 = v31;
            *v35 = (float)v22;
            if ((_DWORD)v19 != 1)
            {
              *(_DWORD *)(v34 + 4) = a8.i32[0];
              v35[1] = v32;
              if ((_DWORD)v19 != 2)
              {
                *(float *)(v34 + 8) = v25;
                v35[2] = v32;
                if ((_DWORD)v19 != 3)
                {
                  *(float *)(v34 + 12) = v26;
                  v35[3] = v32;
                  if ((_DWORD)v19 != 4)
                  {
                    *(float *)(v34 + 16) = v28;
                    v35[4] = v32;
                    if ((_DWORD)v19 != 5)
                    {
                      *(float *)(v34 + 20) = v29;
                      v35[5] = v32;
                      if ((_DWORD)v19 != 6)
                      {
                        *(float *)(v34 + 24) = v30;
                        v35[6] = v32;
                      }
                    }
                  }
                }
              }
            }
            v23 += v19;
            v22 += v18;
            --v17;
          }
          while (v17);
        }
      }
    }
    v65 = *(unsigned int *)(a2 + 296);
    if ((_DWORD)v65)
    {
      v66 = *(unsigned int *)(a2 + 300);
      if ((_DWORD)v66)
      {
        v67 = 4 * v18;
        v68 = __dst[180];
        v69 = 2 * (v18 & 0x3FFFFFFF);
        if (v66 < 8)
        {
          v70 = 0;
          *(float *)a8.i32 = (float)(v67 + v69);
          v71 = (float)(v69 + 8 * v18);
          v72 = (float)(v69 + 12 * v18);
          v73 = (float)(v69 + 16 * v18);
          v74 = (float)(v69 + 20 * v18);
          v75 = (float)v69;
          v76 = (float)(v69 + 24 * v18);
          do
          {
            v77 = (float)v69;
            v78 = 4 * v70;
            v79 = v68 + v78;
            v80 = (float *)(v15 + v78);
            *(float *)v79 = v75;
            *v80 = (float)v69;
            if ((_DWORD)v66 != 1)
            {
              *(_DWORD *)(v79 + 4) = a8.i32[0];
              v80[1] = v77;
              if ((_DWORD)v66 != 2)
              {
                *(float *)(v79 + 8) = v71;
                v80[2] = v77;
                if ((_DWORD)v66 != 3)
                {
                  *(float *)(v79 + 12) = v72;
                  v80[3] = v77;
                  if ((_DWORD)v66 != 4)
                  {
                    *(float *)(v79 + 16) = v73;
                    v80[4] = v77;
                    if ((_DWORD)v66 != 5)
                    {
                      *(float *)(v79 + 20) = v74;
                      v80[5] = v77;
                      if ((_DWORD)v66 != 6)
                      {
                        *(float *)(v79 + 24) = v76;
                        v80[6] = v77;
                      }
                    }
                  }
                }
              }
            }
            v70 += v66;
            v69 += v67;
            --v65;
          }
          while (v65);
          goto LABEL_5;
        }
        v81 = 0;
        v82 = 0;
        a8 = vdupq_n_s32(v67);
        v83 = vdupq_n_s32(v69);
        v84.i64[0] = 0x400000004;
        v84.i64[1] = 0x400000004;
        v85.i64[0] = 0x800000008;
        v85.i64[1] = 0x800000008;
        do
        {
          v86 = 4 * v81;
          *(float *)v16.i32 = (float)(v69 + v67 * v82);
          if ((unint64_t)(v15 - v68) >= 0x20)
          {
            a3 = (int32x4_t *)(v15 + 16 + v86);
            a4 = (float32x4_t *)(v68 + 16 + v86);
            v88 = vdupq_lane_s32(*(int32x2_t *)v16.i8, 0);
            v89 = v66 & 0xFFFFFFF8;
            v90 = (int32x4_t)xmmword_2359168E0;
            do
            {
              a4[-1] = vcvtq_f32_u32((uint32x4_t)vmlaq_s32(v83, a8, v90));
              *a4 = vcvtq_f32_u32((uint32x4_t)vmlaq_s32(v83, a8, vaddq_s32(v90, v84)));
              a3[-1] = v88;
              *a3 = v88;
              v90 = vaddq_s32(v90, v85);
              a3 += 2;
              a4 += 2;
              v89 -= 8;
            }
            while (v89);
            v87 = v66 & 0xFFFFFFF8;
            if (v87 == v66)
              goto LABEL_60;
          }
          else
          {
            v87 = 0;
          }
          a3 = (int32x4_t *)(v66 - v87);
          v91 = v86 + 4 * v87;
          v92 = (_DWORD *)(v15 + v91);
          a4 = (float32x4_t *)(v68 + v91);
          v93 = v69 + v67 * v87;
          do
          {
            a4->f32[0] = (float)v93;
            a4 = (float32x4_t *)((char *)a4 + 4);
            *v92++ = v16.i32[0];
            v93 += v67;
            a3 = (int32x4_t *)((char *)a3 - 1);
          }
          while (a3);
LABEL_60:
          ++v82;
          v81 += v66;
        }
        while (v82 != v65);
      }
    }
  }
LABEL_5:
  v13 = *(unsigned __int8 *)(a6 + 21);
  if (v13 != *((unsigned __int8 *)__dst + 250260))
  {
    *((_BYTE *)__dst + 250260) = v13;
    if (v13)
      v14 = &kAcDetNodeConfigFPS5RawData;
    else
      v14 = &kAcDetNodeConfigFPS30RawData;
    memcpy(__dst, v14, 0x58CuLL);
  }
  if (v11)
  {
    AcDetNode::postProcessDetHalf((uint64_t)__dst, (uint64_t *)a2, (uint64_t)a3, (uint64_t)a4, a7);
    AcDetNode::postProcessHandHalf((uint64_t)__dst, (_QWORD *)a2, v36, v37, a7);
  }
  else
  {
    AcDetNode::postProcessDetFloat((uint64_t)__dst, (uint64_t *)a2, *(float *)a8.i32, (uint64_t)a3, (uint64_t)a4, a7);
    if (!v40)
      AcDetNode::postProcessHandFloat((uint64_t)__dst, (_QWORD *)a2, v38, v39, a7);
  }
}

uint64_t AcDetNode::postProcessDetHalf(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int *v10;
  unsigned int *v11;
  uint64_t v12;
  float v13;
  uint64_t v14;
  uint64_t v15;
  float v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  char v21;
  int v22;
  unsigned int v23;
  int v24;
  float v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v29;
  unsigned int v30;
  int v31;
  int v32;
  unsigned int v33;
  unsigned int v34;
  char v35;
  int v36;
  int v37;
  float v38;
  int v39;
  int v40;
  int v41;
  int v42;
  float v43;
  uint64_t v44;
  float v45;
  float v46;
  uint64_t v47;
  unsigned int v48;
  unsigned int v49;
  int v50;
  int v51;
  unsigned int v52;
  unsigned int v53;
  char v54;
  int v55;
  int v56;
  float v57;
  unsigned int v58;
  unsigned int v59;
  int v60;
  int v61;
  unsigned int v62;
  unsigned int v63;
  char v64;
  int v65;
  int v66;
  float v67;
  unsigned int v68;
  unsigned int v69;
  int v70;
  int v71;
  unsigned int v72;
  unsigned int v73;
  char v74;
  int v75;
  int v76;
  float v77;
  unsigned int v78;
  unsigned int v79;
  int v80;
  int v81;
  unsigned int v82;
  unsigned int v83;
  char v84;
  int v85;
  int v86;
  float v87;
  float v88;
  uint64_t v89;
  float v90;
  uint64_t v91;
  uint64_t v92;
  float v93;
  float v94;
  float v95;
  float v96;
  float v97;
  unsigned int v99;
  unsigned int v100;
  int v101;
  int v102;
  uint64_t v103;
  uint64_t v104;
  unsigned int v105;
  float *v106;
  uint64_t v107;
  __int128 v108;
  _OWORD *v109;
  unsigned int v110;
  uint64_t v111;
  unsigned int *v112;
  uint64_t v113;
  unsigned int v114;
  unint64_t v115;
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
  __int128 v126;
  float32x2_t v127;
  float v128;
  unsigned int v129;
  float32x2_t *v130;
  unsigned int v131;
  unsigned int v132;
  _DWORD *v133;
  unsigned int v134;
  BOOL v135;
  uint64_t v136;
  __int128 v137;
  uint64_t v138;
  unsigned int v139;
  unsigned int v140;
  int v141;
  _OWORD *v142;
  unsigned int v143;
  uint64_t v144;
  uint64_t v146;
  __int128 v147;
  unsigned int v148;
  float *v149;
  uint64_t v150;
  float v151;
  float32x2_t v152;
  unsigned int v153;
  unint64_t v154;
  float *v155;
  float32x2_t v156;
  int32x4_t v157;
  int v158;
  uint64_t v159;
  uint64_t v160;
  int v161;
  int v162;
  float32x2_t v163;
  _BYTE *v164;
  uint64_t v165;
  unsigned int v166;
  unsigned int v167;
  int v168;
  int v169;
  unsigned int v170;
  unsigned int v171;
  int v172;
  int v173;
  float v174;
  float32x2_t v176;
  int v177;
  uint64_t v178;
  unsigned int v179;
  unsigned int v180;
  int v181;
  int v182;
  unsigned int v183;
  unsigned int v184;
  int v185;
  int v186;
  float v187;
  float v188;
  unsigned int v189;
  int v190;
  unsigned int v191;
  unsigned int v192;
  int v193;
  int v194;
  unsigned int v195;
  unsigned int v196;
  char v197;
  int v198;
  int v199;
  float v200;
  int v201;
  unsigned int v202;
  int32x2_t *v203;
  unsigned int v204;
  int v205;
  float v206;
  unsigned int v207;
  unsigned int v208;
  int v209;
  int v210;
  unsigned int v211;
  unsigned int v212;
  int v213;
  int v214;
  float v215;
  float v216;
  int v217;
  unsigned int v218;
  unsigned int v219;
  int v220;
  int v221;
  unsigned int v222;
  unsigned int v223;
  int v224;
  int v225;
  float v226;
  float v227;
  int v228;
  uint64_t v229;
  int v230;
  unsigned int v231;
  int v232;
  unsigned int v233;
  unsigned int v234;
  int v235;
  int v236;
  float v237;
  int v238;
  unsigned int v239;
  unsigned int v240;
  unint64_t v241;
  uint64_t v242;
  _OWORD *v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  unsigned int v247;
  uint64_t v248;
  float32x2_t *v249;
  unsigned int v250;
  unint64_t v251;
  unsigned int v252;
  int v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  float32x2_t *v257;
  float32x2_t v258;
  int v259;
  uint64_t v260;
  uint64_t v261;
  unsigned int v262;
  float v263;
  unsigned int v264;
  float v265;
  uint64_t v266;
  _WORD *v267;
  float v268;
  float v269;
  float v270;
  float v271;
  float v272;
  uint64_t v273;
  __int128 *v274;
  unsigned int v275;
  int v276;
  uint64_t v277;
  unsigned __int16 *v278;
  unsigned int v279;
  int v280;
  unsigned int v281;
  int v282;
  float v283;
  unsigned int v284;
  unsigned int v285;
  int v286;
  int v287;
  unsigned int v288;
  unsigned int v289;
  int v290;
  int v291;
  unsigned int v292;
  unsigned int v293;
  int v294;
  int v295;
  float v296;
  unsigned __int16 *v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  unsigned int *v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  _BYTE v309[44];

  v7 = *a2;
  v8 = a2[3];
  v304 = a5 + 40684;
  v9 = a2[6];
  v10 = (unsigned int *)(a1 + 239696);
  v308 = a2[9];
  v11 = (unsigned int *)(a1 + 99760);
  v303 = a2[12];
  v300 = a2[45];
  v301 = a2[15];
  v298 = (unsigned __int16 *)a2[48];
  v299 = a2[18];
  *(_DWORD *)(a1 + 99760) = 0;
  *(_DWORD *)(a1 + 102964) = 0;
  *(_DWORD *)(a1 + 103928) = 0;
  std::chrono::steady_clock::now();
  v12 = 0;
  *(_OWORD *)v10 = 0u;
  *((_OWORD *)v10 + 1) = 0u;
  v302 = v10;
  *((_OWORD *)v10 + 2) = 0u;
  v13 = *(float *)(a1 + 68);
  v306 = a2[6];
  v307 = a2[3];
  while (2)
  {
    v14 = 0;
    v15 = 0;
    v16 = 0.05;
    if (v12 == 1)
    {
      v17 = 10;
    }
    else
    {
      v16 = v13;
      v17 = 12;
    }
    while (2)
    {
      v18 = 0;
      v19 = v14;
      do
      {
        if (*(__int16 *)(v7 + v18) < 0)
          goto LABEL_13;
        v26 = *(unsigned __int16 *)(v7 + v18);
        v27 = (v26 >> 10) & 0x1F;
        if (v27 < v17)
          goto LABEL_13;
        if (v12 != 1 && (v26 & 0x3F8) <= 0x257 && v27 == v17)
          goto LABEL_13;
        v29 = *(__int16 *)(v8 + v18);
        v30 = v29 & 0x80000000;
        v31 = (v29 >> 10) & 0x1F;
        v32 = *(unsigned __int16 *)(v8 + v18) << 13;
        v33 = v32 & 0x7FE000;
        if (v31 == 31)
        {
          if (v33)
            v37 = 2143289344;
          else
            v37 = 2139095040;
          v36 = v30 | v32 | v37;
        }
        else
        {
          if (!v31)
          {
            if (!v33)
            {
              if (v30)
                v38 = -0.0;
              else
                v38 = 0.0;
              goto LABEL_31;
            }
            v34 = __clz(v33);
            v35 = v34 - 8;
            v31 = 9 - v34;
            v33 = (v32 << v35) & 0x7FE000;
          }
          v36 = ((v33 | (v31 << 23)) + 939524096) | v30;
        }
        v38 = *(float *)&v36;
LABEL_31:
        v39 = v26 << 13;
        v40 = (v39 & 0x7FE000 | (v27 << 23)) + 939524096;
        if ((v39 & 0x7FE000) != 0)
          v41 = 2143289344;
        else
          v41 = 2139095040;
        v42 = v41 | v39;
        if (v27 != 31)
          v42 = v40;
        if (!*(_BYTE *)(a1 + v12 + 224))
          goto LABEL_13;
        v43 = *(float *)&v42;
        if (v16 >= *(float *)&v42)
          goto LABEL_13;
        v44 = *v11;
        if (v44 > 0xBFE)
          goto LABEL_13;
        v45 = sqrtf(v38 * *(float *)&v42);
        if (v12 == 1 && v13 > *(float *)&v42)
        {
          v46 = *(float *)(a1 + 100);
          if (v45 > v46)
            v45 = v46 + -0.01;
        }
        v47 = a1 + 32 * v44;
        *(float *)(v47 + 1480) = v45;
        *(_DWORD *)(v47 + 1472) = v12;
        v48 = *(__int16 *)(v9 + v18);
        v49 = v48 & 0x80000000;
        v50 = (v48 >> 10) & 0x1F;
        v51 = *(unsigned __int16 *)(v9 + v18) << 13;
        v52 = v51 & 0x7FE000;
        if (v50 == 31)
        {
          if (v52)
            v56 = 2143289344;
          else
            v56 = 2139095040;
          v55 = v49 | v51 | v56;
          goto LABEL_55;
        }
        if (v50)
          goto LABEL_47;
        if (v52)
        {
          v53 = __clz(v52);
          v54 = v53 - 8;
          v50 = 9 - v53;
          v52 = (v51 << v54) & 0x7FE000;
LABEL_47:
          v55 = ((v52 | (v50 << 23)) + 939524096) | v49;
LABEL_55:
          v57 = *(float *)&v55;
          goto LABEL_56;
        }
        if (v49)
          v57 = -0.0;
        else
          v57 = 0.0;
LABEL_56:
        v58 = *(__int16 *)(v9 + v18 + 6144);
        v59 = v58 & 0x80000000;
        v60 = (v58 >> 10) & 0x1F;
        v61 = *(unsigned __int16 *)(v9 + v18 + 6144) << 13;
        v62 = v61 & 0x7FE000;
        if (v60 == 31)
        {
          if (v62)
            v66 = 2143289344;
          else
            v66 = 2139095040;
          v65 = v59 | v61 | v66;
          goto LABEL_65;
        }
        if (v60)
          goto LABEL_60;
        if (v62)
        {
          v63 = __clz(v62);
          v64 = v63 - 8;
          v60 = 9 - v63;
          v62 = (v61 << v64) & 0x7FE000;
LABEL_60:
          v65 = ((v62 | (v60 << 23)) + 939524096) | v59;
LABEL_65:
          v67 = *(float *)&v65;
          goto LABEL_66;
        }
        if (v59)
          v67 = -0.0;
        else
          v67 = 0.0;
LABEL_66:
        v68 = *(__int16 *)(v9 + v18 + 12288);
        v69 = v68 & 0x80000000;
        v70 = (v68 >> 10) & 0x1F;
        v71 = *(unsigned __int16 *)(v9 + v18 + 12288) << 13;
        v72 = v71 & 0x7FE000;
        if (v70 == 31)
        {
          if (v72)
            v76 = 2143289344;
          else
            v76 = 2139095040;
          v75 = v69 | v71 | v76;
          goto LABEL_75;
        }
        if (v70)
          goto LABEL_70;
        if (v72)
        {
          v73 = __clz(v72);
          v74 = v73 - 8;
          v70 = 9 - v73;
          v72 = (v71 << v74) & 0x7FE000;
LABEL_70:
          v75 = ((v72 | (v70 << 23)) + 939524096) | v69;
LABEL_75:
          v77 = *(float *)&v75;
          goto LABEL_76;
        }
        if (v69)
          v77 = -0.0;
        else
          v77 = 0.0;
LABEL_76:
        v78 = *(__int16 *)(v9 + v18 + 18432);
        v79 = v78 & 0x80000000;
        v80 = (v78 >> 10) & 0x1F;
        v81 = *(unsigned __int16 *)(v9 + v18 + 18432) << 13;
        v82 = v81 & 0x7FE000;
        if (v80 == 31)
        {
          if (v82)
            v86 = 2143289344;
          else
            v86 = 2139095040;
          v85 = v79 | v81 | v86;
        }
        else
        {
          if (!v80)
          {
            if (!v82)
            {
              if (v79)
                v87 = -0.0;
              else
                v87 = 0.0;
              goto LABEL_86;
            }
            v83 = __clz(v82);
            v84 = v83 - 8;
            v80 = 9 - v83;
            v82 = (v81 << v84) & 0x7FE000;
          }
          v85 = ((v82 | (v80 << 23)) + 939524096) | v79;
        }
        v87 = *(float *)&v85;
LABEL_86:
        v88 = (float)*(unsigned int *)(a1 + 252);
        v89 = *(_QWORD *)(a1 + 1424);
        v90 = *(float *)(v89 + 4 * v19) - (float)(v57 * v88);
        v91 = a1 + 32 * v44;
        *(float *)(v91 + 1456) = v90;
        v92 = *(_QWORD *)(a1 + 1432);
        v93 = v87 * v88;
        v94 = *(float *)(v92 + 4 * v19) - (float)(v67 * v88);
        *(float *)(v91 + 1460) = v94;
        v95 = (float)(v77 * v88) + *(float *)(v89 + 4 * v19);
        *(float *)(v91 + 1464) = v95;
        v96 = v93 + *(float *)(v92 + 4 * v19);
        *(float *)(v91 + 1468) = v96;
        *(_DWORD *)(v91 + 1476) = v19;
        if (!v12)
        {
          v99 = *(__int16 *)(v308 + 6144);
          v100 = v99 & 0x80000000;
          v22 = (v99 >> 10) & 0x1F;
          v101 = *(unsigned __int16 *)(v308 + 6144) << 13;
          v23 = v101 & 0x7FE000;
          if (v22 == 31)
          {
            if (v23)
              v102 = 2143289344;
            else
              v102 = 2139095040;
            v24 = v100 | v101 | v102;
          }
          else
          {
            if (!v22)
            {
              if (!v23)
              {
                if (v100)
                  v25 = -0.0;
                else
                  v25 = 0.0;
                goto LABEL_11;
              }
              v20 = __clz(v23);
              v21 = v20 - 8;
              v22 = 9 - v20;
              v23 = (v101 << v21) & 0x7FE000;
            }
            v24 = ((v23 | (v22 << 23)) + 939524096) | v100;
          }
          v25 = *(float *)&v24;
LABEL_11:
          *(float *)(a1 + 32 * v44 + 1484) = (float)(v25 * -360.0) + 180.0;
LABEL_12:
          ++*(_DWORD *)(a1 + 4 * v12 + 239696);
          *v11 = v44 + 1;
          goto LABEL_13;
        }
        if (v12 != 3 || v43 >= 0.32)
          goto LABEL_12;
        v97 = (float)((float)(v95 - v90) * (float)(v96 - v94))
            / (float)(*(_DWORD *)(a1 + 20) * *(_DWORD *)(a1 + 24));
        if (v97 <= 0.9 || v97 >= 1.1)
          goto LABEL_12;
LABEL_13:
        v18 += 2;
        ++v19;
      }
      while (v18 != 128);
      v9 += 128;
      v8 += 128;
      v7 += 128;
      ++v15;
      v14 += 64;
      if (v15 != 48)
        continue;
      break;
    }
    ++v12;
    v9 = v306;
    v8 = v307;
    if (v12 != 12)
      continue;
    break;
  }
  std::chrono::steady_clock::now();
  *v11 = acNonMaxSuppression(a1 + 1456, *v11, (_DWORD *)(a1 + 227408), 500, *(float *)(a1 + 72), *(float *)(a1 + 76));
  std::chrono::steady_clock::now();
  if (*(_BYTE *)(a1 + 1420) && *(_BYTE *)(a1 + 1421))
    v103 = a1 + 160;
  else
    v103 = a1 + 112;
  LODWORD(v104) = *v11;
  if (*v11 >= 0xBFF)
    v104 = 3071;
  else
    v104 = v104;
  *v11 = v104;
  v105 = 0;
  if ((_DWORD)v104)
  {
    v106 = (float *)(a1 + 1480);
    do
    {
      if (*v106 > *(float *)(v103 + 4 * *((unsigned int *)v106 - 2)))
      {
        v107 = v105++;
        v108 = *(_OWORD *)(v106 - 2);
        v109 = (_OWORD *)(a1 + 1456 + 32 * v107);
        *v109 = *(_OWORD *)(v106 - 6);
        v109[1] = v108;
      }
      v106 += 8;
      --v104;
    }
    while (v104);
  }
  *v11 = v105;
  v110 = acRemoveHeadOverlapBoxes((_OWORD *)(a1 + 1456), v105, (unsigned __int8 *)(a1 + 224336), *(float *)(a1 + 76));
  *v11 = v110;
  bmHeapsort(a1 + 1456, v110, 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectClassCompareReverse);
  *(_OWORD *)v302 = 0u;
  *((_OWORD *)v302 + 1) = 0u;
  *((_OWORD *)v302 + 2) = 0u;
  v111 = *v11;
  if ((_DWORD)v111)
  {
    v112 = (unsigned int *)(a1 + 1472);
    do
    {
      v114 = *v112;
      v112 += 8;
      v113 = v114;
      if (v114 == 1)
      {
        ++*v302;
      }
      else if (v113 <= 0xB)
      {
        ++*(_DWORD *)(a1 + 4 * v113 + 239696);
      }
      --v111;
    }
    while (v111);
    v115 = *v302;
  }
  else
  {
    v115 = 0;
  }
  bmHeapsort(a1 + 1456, v115, 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
  v116 = *v302;
  bmHeapsort(a1 + 1456 + 32 * v116, v302[1], 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
  v117 = v302[1] + v116;
  bmHeapsort(a1 + 1456 + 32 * v117, v302[2], 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
  v118 = v302[2] + v117;
  bmHeapsort(a1 + 1456 + 32 * v118, v302[3], 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
  v119 = v302[3] + v118;
  bmHeapsort(a1 + 1456 + 32 * v119, v302[4], 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
  v120 = v302[4] + v119;
  bmHeapsort(a1 + 1456 + 32 * v120, v302[5], 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
  v121 = v302[5] + v120;
  bmHeapsort(a1 + 1456 + 32 * v121, v302[6], 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
  v122 = v302[6] + v121;
  bmHeapsort(a1 + 1456 + 32 * v122, v302[7], 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
  v123 = v302[7] + v122;
  bmHeapsort(a1 + 1456 + 32 * v123, v302[8], 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
  v124 = v302[8] + v123;
  bmHeapsort(a1 + 1456 + 32 * v124, v302[9], 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
  v125 = v302[9] + v124;
  bmHeapsort(a1 + 1456 + 32 * v125, v302[10], 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
  bmHeapsort(a1 + 1456 + 32 * (v302[10] + v125), v302[11], 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
  v129 = v302[2];
  v130 = (float32x2_t *)*v11;
  v135 = v129 >= 0xF;
  v131 = v129 - 15;
  if (v131 != 0 && v135)
  {
    v132 = 0;
    if ((_DWORD)v130)
    {
      v133 = (_DWORD *)(a1 + 1472);
      v134 = v131;
      v138 = a5;
      do
      {
        v135 = *v133 == 2 && ++v132 >= 0x10;
        if (v135)
        {
          v136 = a1 + 32 * v134;
          v137 = *(_OWORD *)(v136 + 1472);
          *((_OWORD *)v133 - 1) = *(_OWORD *)(v136 + 1456);
          *(_OWORD *)v133 = v137;
        }
        ++v134;
        v133 += 8;
        v130 = (float32x2_t *)((char *)v130 - 1);
      }
      while (v130);
      v132 = *v11;
    }
    else
    {
      v138 = a5;
    }
    LODWORD(v130) = v132 - v131;
    *v11 = v132 - v131;
  }
  else
  {
    v138 = a5;
  }
  v139 = v302[11];
  if (v139 >= 0x10)
  {
    v140 = v139 - 8;
    if ((_DWORD)v130)
    {
      v141 = 0;
      v142 = (_OWORD *)(a1 + 1472);
      v143 = v140;
      v144 = v130;
      do
      {
        if (*(_DWORD *)v142 == 11 && ++v141 >= 0x10)
        {
          v146 = a1 + 32 * v143;
          v147 = *(_OWORD *)(v146 + 1472);
          *(v142 - 1) = *(_OWORD *)(v146 + 1456);
          *v142 = v147;
        }
        ++v143;
        v142 += 2;
        --v144;
      }
      while (v144);
      v148 = *v11;
      v139 = v302[11];
    }
    else
    {
      v148 = 0;
    }
    LODWORD(v130) = v148 - v140;
    *v11 = v148 - v140;
  }
  if (v139 > 5)
  {
LABEL_174:
    *(_DWORD *)(v138 + 7680) = 0;
    *(_DWORD *)v304 = 0;
    *(_DWORD *)(v304 + 10244) = 0;
    if (!(_DWORD)v130)
      goto LABEL_337;
    v153 = 0;
    v154 = 0;
    v155 = (float *)(a1 + 1480);
    v156 = (float32x2_t)vdup_n_s32(0x43B40000u);
    v157 = vdupq_n_s32(0xFFFFFE97);
    while (v153 < 0xF)
    {
      if (*((_DWORD *)v155 - 2) > 1u)
        goto LABEL_178;
      v160 = v138 + ((unint64_t)v153 << 9);
      *(_DWORD *)(v160 + 4) = 0;
      *(_DWORD *)(v160 + 8) = 0;
      *(_DWORD *)v160 = v154 + 1;
      v161 = (int)(float)((float)(*v155 * 1000.0) + 0.5);
      if (v161 >= 1000)
        v161 = 1000;
      if (v161 <= 1)
        v161 = 1;
      *(_DWORD *)(v160 + 28) = v161;
      v162 = *((_DWORD *)v155 - 2);
      v163 = *(float32x2_t *)(v155 - 6);
      *(float32x2_t *)(v160 + 12) = v163;
      v127 = *(float32x2_t *)(v155 - 4);
      *(float32x2_t *)&v126 = vsub_f32(v127, v163);
      *(_QWORD *)(v160 + 20) = v126;
      v164 = (_BYTE *)(v160 + 96);
      if (!v162)
      {
        *v164 = 1;
        v165 = *((unsigned int *)v155 - 1);
        v166 = *(__int16 *)(v308 + 2 * v165 + 12288);
        v167 = v166 & 0x80000000;
        v168 = (v166 >> 10) & 0x1F;
        v169 = *(unsigned __int16 *)(v308 + 2 * v165 + 12288) << 13;
        v170 = v169 & 0x7FE000;
        if (v168 == 31)
        {
          if (v170)
            v173 = 2143289344;
          else
            v173 = 2139095040;
          v172 = v167 | v169 | v173;
          goto LABEL_195;
        }
        if (v168)
          goto LABEL_190;
        if (v170)
        {
          v171 = __clz(v170);
          v168 = 9 - v171;
          v170 = (v169 << (v171 - 8)) & 0x7FE000;
LABEL_190:
          v172 = ((v170 | (v168 << 23)) + 939524096) | v167;
LABEL_195:
          v174 = *(float *)&v172;
        }
        else if (v167)
        {
          v174 = -0.0;
        }
        else
        {
          v174 = 0.0;
        }
        if (v174 < 1.05 && v174 > 1.0)
          v174 = 1.0;
        v176.f32[0] = (float)(v174 * 180.0) + -90.0;
        v177 = (int)v176.f32[0];
        if ((int)v176.f32[0] >= 90)
          v177 = 90;
        if (v177 <= -90)
          v177 = -90;
        v178 = v165 + 3072;
        v179 = *(__int16 *)(v308 + 2 * (v165 + 3072));
        v180 = v179 & 0x80000000;
        v181 = (v179 >> 10) & 0x1F;
        v182 = *(unsigned __int16 *)(v308 + 2 * (v165 + 3072)) << 13;
        v183 = v182 & 0x7FE000;
        if (v181 == 31)
        {
          if (v183)
            v186 = 2143289344;
          else
            v186 = 2139095040;
          v185 = v180 | v182 | v186;
          goto LABEL_214;
        }
        if (v181)
          goto LABEL_209;
        if (v183)
        {
          v184 = __clz(v183);
          v181 = 9 - v184;
          v183 = (v182 << (v184 - 8)) & 0x7FE000;
LABEL_209:
          v185 = ((v183 | (v181 << 23)) + 939524096) | v180;
LABEL_214:
          v187 = *(float *)&v185;
        }
        else if (v180)
        {
          v187 = -0.0;
        }
        else
        {
          v187 = 0.0;
        }
        v188 = 180.0 - (float)(v187 * 360.0);
        v189 = (int)(float)((float)(v188 + 180.0) + 360.0) % 360;
        v190 = v189 + 360;
        if (v189 <= 0xFFFFFE97)
          v190 = (int)(float)((float)(v188 + 180.0) + 360.0) % 360;
        v191 = *(__int16 *)(v308 + 2 * v165);
        v192 = v191 & 0x80000000;
        v193 = (v191 >> 10) & 0x1F;
        v194 = *(unsigned __int16 *)(v308 + 2 * v165) << 13;
        v195 = v194 & 0x7FE000;
        if (v193 == 31)
        {
          if (v195)
            v199 = 2143289344;
          else
            v199 = 2139095040;
          v198 = v192 | v194 | v199;
          goto LABEL_226;
        }
        if (v193)
          goto LABEL_221;
        if (v195)
        {
          v196 = __clz(v195);
          v197 = v196 - 8;
          v193 = 9 - v196;
          v195 = (v194 << v197) & 0x7FE000;
LABEL_221:
          v198 = ((v195 | (v193 << 23)) + 939524096) | v192;
LABEL_226:
          v200 = *(float *)&v198;
        }
        else if (v192)
        {
          v200 = -0.0;
        }
        else
        {
          v200 = 0.0;
        }
        v138 = a5;
        v201 = (int)(float)((float)((float)v190 / 30.0) + 0.5);
        v128 = (float)(v200 * 180.0) + -90.0;
        v202 = (int)(float)((float)((float)(v177 + 90) / 45.0) + 0.5) % 5;
        if (v202 > 0xFFFFFFFA)
          v202 += 5;
        v203 = (int32x2_t *)(a5 + ((unint64_t)v153 << 9));
        v203[4].i32[0] = AcDetNode::m_kFacePoseYawCenters[v202];
        v204 = v201 % 12;
        v205 = v201 % 12 + 12;
        if (v204 > 0xFFFFFFF3)
          v204 = v205;
        v203[4].i32[1] = AcDetNode::m_kFacePoseRollCenters[v204];
        v176.f32[1] = v188;
        v203[5] = vcvt_s32_f32((float32x2_t)vbsl_s8((int8x8_t)vcgez_f32(vadd_f32(v176, (float32x2_t)0x3400000034000000)), (int8x8_t)v176, (int8x8_t)vadd_f32(v176, v156)));
        if ((float)(v128 + 0.00000011921) < 0.0)
          v206 = v128 + 360.0;
        else
          v206 = v128;
        v203[6].i32[0] = (int)v206;
        v207 = *(__int16 *)(v303 + 2 * v165);
        v208 = v207 & 0x80000000;
        v209 = (v207 >> 10) & 0x1F;
        v210 = *(unsigned __int16 *)(v303 + 2 * v165) << 13;
        v211 = v210 & 0x7FE000;
        if (v209 == 31)
        {
          if (v211)
            v214 = 2143289344;
          else
            v214 = 2139095040;
          v213 = v208 | v210 | v214;
          goto LABEL_243;
        }
        if (v209)
          goto LABEL_238;
        if (v211)
        {
          v212 = __clz(v211);
          v209 = 9 - v212;
          v138 = a5;
          v211 = (v210 << (v212 - 8)) & 0x7FE000;
LABEL_238:
          v213 = ((v211 | (v209 << 23)) + 939524096) | v208;
LABEL_243:
          v215 = *(float *)&v213;
        }
        else if (v208)
        {
          v215 = -0.0;
        }
        else
        {
          v215 = 0.0;
        }
        v216 = (float)(v215 - *(float *)(a1 + 236)) / (float)(1.0 - *(float *)(a1 + 236));
        if (v216 >= 0.0)
        {
          v217 = (int)(float)((float)(v216 * 1000.0) + 0.5);
          if (v217 >= 1000)
            v217 = 1000;
          if (v217 <= 1)
            v217 = 1;
          v165 = *((unsigned int *)v155 - 1);
          v178 = v165 + 3072;
        }
        else
        {
          v217 = 0;
        }
        *(_DWORD *)(v138 + ((unint64_t)v153 << 9) + 128) = v217;
        v218 = *(__int16 *)(v303 + 2 * v178);
        v219 = v218 & 0x80000000;
        v220 = (v218 >> 10) & 0x1F;
        v221 = *(unsigned __int16 *)(v303 + 2 * v178) << 13;
        v222 = v221 & 0x7FE000;
        if (v220 == 31)
        {
          if (v222)
            v225 = 2143289344;
          else
            v225 = 2139095040;
          v224 = v219 | v221 | v225;
          goto LABEL_260;
        }
        if (v220)
          goto LABEL_255;
        if (v222)
        {
          v223 = __clz(v222);
          v220 = 9 - v223;
          v138 = a5;
          v222 = (v221 << (v223 - 8)) & 0x7FE000;
LABEL_255:
          v224 = ((v222 | (v220 << 23)) + 939524096) | v219;
LABEL_260:
          v226 = *(float *)&v224;
        }
        else if (v219)
        {
          v226 = -0.0;
        }
        else
        {
          v226 = 0.0;
        }
        v227 = (float)(v226 - *(float *)(a1 + 240)) / (float)(1.0 - *(float *)(a1 + 240));
        if (v227 >= 0.0)
        {
          v228 = (int)(float)((float)(v227 * 1000.0) + 0.5);
          if (v228 >= 1000)
            v228 = 1000;
          if (v228 <= 1)
            v228 = 1;
          v165 = *((unsigned int *)v155 - 1);
        }
        else
        {
          v228 = 0;
        }
        v229 = v138 + ((unint64_t)v153 << 9);
        *(_DWORD *)(v229 + 392) = v228;
        *(_BYTE *)(v229 + 100) = 1;
        *(_BYTE *)(v229 + 440) = 1;
        LODWORD(v229) = *(__int16 *)(v301 + 2 * v165);
        v230 = v229 & 0x80000000;
        v231 = (v229 >> 10) & 0x1F;
        v232 = *(unsigned __int16 *)(v301 + 2 * v165) << 13;
        v233 = v232 & 0x7FE000;
        if (v231 != 31)
        {
          if (v231)
            goto LABEL_272;
          if (v233)
          {
            v234 = __clz(v233);
            v231 = 9 - v234;
            v233 = (v232 << (v234 - 8)) & 0x7FE000;
LABEL_272:
            v235 = ((v233 | (v231 << 23)) + 939524096) | v230;
LABEL_277:
            v237 = *(float *)&v235;
          }
          else if (v230)
          {
            v237 = -0.0;
          }
          else
          {
            v237 = 0.0;
          }
          v127.i16[1] = 17530;
          *(float *)&v126 = (float)(v237 * 1000.0) + 0.5;
          v238 = (int)*(float *)&v126;
          if ((int)*(float *)&v126 >= 1000)
            v238 = 1000;
          if (v238 <= 1)
            v158 = 1;
          else
            v158 = v238;
          goto LABEL_177;
        }
        if (v233)
          v236 = 2143289344;
        else
          v236 = 2139095040;
        v235 = v230 | v232 | v236;
        goto LABEL_277;
      }
      *v164 = 0;
      *(int32x4_t *)(v160 + 32) = v157;
      *(_DWORD *)(v160 + 48) = -361;
      v158 = -1;
      *(_DWORD *)(v160 + 128) = -1;
      *(_DWORD *)(v160 + 392) = -1;
      *(_BYTE *)(v160 + 100) = 0;
      *(_BYTE *)(v160 + 440) = 0;
LABEL_177:
      v159 = v138 + ((unint64_t)v153 << 9);
      *(_DWORD *)(v159 + 420) = v158;
      *(_BYTE *)(v159 + 388) = 0;
      *(_DWORD *)(v159 + 448) = 0;
      *(_DWORD *)(v159 + 444) = 0;
      *(_DWORD *)(v138 + 7680) = ++v153;
      LODWORD(v130) = *v11;
LABEL_178:
      ++v154;
      v155 += 8;
      if (v154 >= v130)
        break;
    }
    v302[462] = 0;
    if (!(_DWORD)v130)
      goto LABEL_338;
    v239 = 0;
    v240 = 0;
    v241 = 0;
    v242 = a1 + 239744;
    while (2)
    {
      if (v240 >= 0x1E)
        goto LABEL_338;
      v249 = (float32x2_t *)(a1 + 32 * v241);
      v250 = v249[184].u32[0];
      v251 = v241 + 1;
      v252 = v250 - 2;
      if (v250 >= 2)
      {
        v253 = 0;
        v254 = v240;
        v255 = a5 + ((unint64_t)v240 << 9);
        *(_QWORD *)(v255 + 25324) = v251;
        if (v252 <= 0xA)
          v253 = dword_23591624C[v252];
        v256 = v255 + 25324;
        *(_DWORD *)(v255 + 25332) = v253;
        v257 = (float32x2_t *)(a1 + 32 * v241);
        v258 = v249[182];
        *(float32x2_t *)(v255 + 25336) = v258;
        *(float32x2_t *)(v255 + 25344) = vsub_f32(v257[183], v258);
        v259 = (int)(float)((float)(v257[185].f32[0] * 1000.0) + 0.5);
        if (v259 >= 1000)
          v259 = 1000;
        if (v259 <= 1)
          v259 = 1;
        *(_DWORD *)(v256 + 28) = v259;
        *(_DWORD *)(v256 + 448) = 0;
        if (v250 == 11 && v239 <= 0x1D)
        {
          v260 = 0;
          v130 = v249 + 184;
          v261 = a1 + 32 * v241;
          *(float *)&v262 = (float)(*(float *)(v261 + 1460) + *(float *)(v261 + 1468)) * 0.5;
          v263 = (float)*(unsigned int *)(a1 + 252);
          v264 = (float)((float)((float)(v249[182].f32[0] + v257[183].f32[0]) * 0.5) / v263);
          v265 = *(float *)&v262 / v263;
          v266 = *(unsigned int *)(v261 + 1476);
          v267 = (_WORD *)(v300 + 2 * v266);
          LOWORD(v262) = *v267;
          LOWORD(v126) = v267[3072];
          v127.i16[0] = v267[6144];
          LOWORD(v128) = v267[9216];
          v266 *= 4;
          v268 = *(float *)(*(_QWORD *)(a1 + 1424) + v266);
          v269 = v268 + (float)((float)((float)v262 * -0.5) * v263);
          v127.f32[0] = v268 + (float)((float)((float)v127.u32[0] * 0.5) * v263);
          v270 = *(float *)(*(_QWORD *)(a1 + 1432) + v266);
          v271 = v270 + (float)((float)((float)v126 * -0.5) * v263);
          v272 = v270 + (float)((float)((float)LODWORD(v128) * 0.5) * v263);
          *(_OWORD *)&v309[28] = 0uLL;
          *(_OWORD *)v309 = 0uLL;
          memset(&v309[12], 255, 20);
          v273 = a5 + 25324 + (v254 << 9);
          v274 = (__int128 *)(v273 + 452);
          *(_OWORD *)(v273 + 452) = 0uLL;
          *(_OWORD *)(v273 + 468) = *(_OWORD *)v309;
          *(_OWORD *)(v273 + 484) = *(_OWORD *)&v309[16];
          HIWORD(v128) = -1;
          *(_OWORD *)(v273 + 496) = *(_OWORD *)&v309[28];
          *(float *)(v273 + 452) = v269;
          *(float *)(v273 + 456) = v271;
          *(float *)(v273 + 460) = v127.f32[0] - v269;
          *(float *)(v273 + 464) = v272 - v271;
          v275 = v265;
          if (v264 >= 0x3F)
            v276 = 63;
          else
            v276 = v264;
          if (v275 >= 0x2F)
            v275 = 47;
          v277 = a5 + 25456 + (v254 << 9);
          v278 = (unsigned __int16 *)(v299 + 2 * (v276 | (v275 << 6)));
          while (1)
          {
            v284 = (__int16)*v278;
            v285 = v284 & 0x80000000;
            v280 = (v284 >> 10) & 0x1F;
            v286 = *v278 << 13;
            v281 = v286 & 0x7FE000;
            if (v280 == 31)
            {
              if (v281)
                v287 = 2143289344;
              else
                v287 = 2139095040;
              v282 = v285 | v286 | v287;
            }
            else
            {
              if (!v280)
              {
                if (!v281)
                {
                  if (v285)
                    v283 = -0.0;
                  else
                    v283 = 0.0;
                  goto LABEL_325;
                }
                v279 = __clz(v281);
                v280 = 9 - v279;
                v281 = (v286 << (v279 - 8)) & 0x7FE000;
              }
              v282 = ((v281 | (v280 << 23)) + 939524096) | v285;
            }
            v283 = *(float *)&v282;
LABEL_325:
            v278 += 3072;
            *(float *)(v277 + v260) = v283;
            v260 += 4;
            if (v260 == 256)
            {
              v243 = (_OWORD *)(v242 + 60 * v302[462]);
              v244 = *v274;
              v245 = v274[1];
              v246 = v274[2];
              v126 = *(__int128 *)((char *)v274 + 44);
              *(_OWORD *)((char *)v243 + 44) = v126;
              v243[1] = v245;
              v243[2] = v246;
              *v243 = v244;
              v247 = v302[462];
              v248 = v242 + 60 * v247;
              *(_DWORD *)(v248 + 16) = v130->i32[0];
              v240 = *(_DWORD *)v304;
              v239 = v247 + 1;
              v302[462] = v247 + 1;
              *(_DWORD *)(v248 + 20) = v240;
              LODWORD(v130) = *v11;
              break;
            }
          }
        }
        *(_DWORD *)v304 = ++v240;
      }
      v241 = v251;
      if (v251 >= v130)
        goto LABEL_338;
      continue;
    }
  }
  if ((_DWORD)v130)
  {
    v149 = (float *)(a1 + 1480);
    v150 = v130;
    do
    {
      if (*((_DWORD *)v149 - 2) == 11 && *v149 >= 0.55)
      {
        v151 = *(float *)(a1 + 156);
        if (*v149 < v151)
        {
          v152 = vsub_f32(*(float32x2_t *)(v149 - 4), *(float32x2_t *)(v149 - 6));
          if ((float)(vmul_lane_f32(v152, v152, 1).f32[0]
                     / (float)(*(_DWORD *)(a1 + 20) * *(_DWORD *)(a1 + 24))) > 0.15)
            *v149 = v151 + 0.01;
        }
      }
      v149 += 8;
      --v150;
    }
    while (v150);
    goto LABEL_174;
  }
  *(_DWORD *)(v138 + 7680) = 0;
  *(_DWORD *)v304 = 0;
  *(_DWORD *)(v304 + 10244) = 0;
LABEL_337:
  v302[462] = 0;
LABEL_338:
  v288 = (__int16)*v298;
  v289 = v288 & 0x80000000;
  v290 = (v288 >> 10) & 0x1F;
  v291 = *v298 << 13;
  v292 = v291 & 0x7FE000;
  if (v290 == 31)
  {
    if (v292)
      v295 = 2143289344;
    else
      v295 = 2139095040;
    v294 = v289 | v291 | v295;
    goto LABEL_347;
  }
  if (v290)
    goto LABEL_342;
  if (v292)
  {
    v293 = __clz(v292);
    v290 = 9 - v293;
    v292 = (v291 << (v293 - 8)) & 0x7FE000;
LABEL_342:
    v294 = ((v292 | (v290 << 23)) + 939524096) | v289;
LABEL_347:
    v296 = *(float *)&v294;
  }
  else
  {
    v296 = -0.0;
    if (!v289)
      v296 = 0.0;
  }
  *(float *)(v304 + 10248) = v296;
  return 0;
}

uint64_t AcDetNode::postProcessHandHalf(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int *v7;
  _DWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  int v21;
  unsigned int v22;
  int v23;
  float v24;
  unsigned int v25;
  unsigned int v26;
  int v28;
  int v29;
  int v30;
  int v31;
  float v32;
  unsigned int v33;
  unsigned int v34;
  int v35;
  int v36;
  unsigned int v37;
  unsigned int v38;
  int v39;
  int v40;
  float v41;
  float v42;
  unsigned int v43;
  unsigned int v44;
  int v45;
  int v46;
  unsigned int v47;
  unsigned int v48;
  int v49;
  int v50;
  float v51;
  unsigned int v52;
  unsigned int v53;
  int v54;
  int v55;
  unsigned int v56;
  unsigned int v57;
  int v58;
  int v59;
  float v60;
  unsigned int v61;
  unsigned int v62;
  int v63;
  int v64;
  unsigned int v65;
  unsigned int v66;
  int v67;
  int v68;
  float v69;
  unsigned int v70;
  unsigned int v71;
  int v72;
  int v73;
  unsigned int v74;
  unsigned int v75;
  int v76;
  int v77;
  float v78;
  float v79;
  uint64_t v80;
  float *v81;
  uint64_t v82;
  unsigned int v83;
  unsigned int v84;
  int v85;
  int v86;
  __int128 v87;
  __int128 v88;
  uint64_t v89;
  uint64_t v90;
  unsigned int v91;
  float *v92;
  uint64_t v93;
  __int128 v94;
  _OWORD *v95;
  unsigned int v96;
  unint64_t v97;
  uint64_t v98;
  float *v99;
  uint64_t v100;
  int v101;
  float32x2_t v102;
  int v103;
  int8x8_t v104;
  uint64_t v105;
  int8x8_t v106;
  float v107;
  float v108;
  float v109;
  _OWORD *v110;
  __int128 v111;
  __int128 v112;
  uint64_t v113;
  int v114;
  _BYTE v116[44];

  v7 = (int *)(a5 + 40684);
  v8 = (_DWORD *)(a1 + 243348);
  v9 = a1 + 99788;
  v10 = a2[21];
  v11 = a2[24];
  v12 = a2[27];
  v13 = a2[30];
  v14 = a2[45];
  *(_DWORD *)(a1 + 102964) = 0;
  std::chrono::steady_clock::now();
  v15 = 0;
  v16 = 0;
  v17 = *(unsigned int *)(v9 + 3176);
  while (2)
  {
    v18 = 0;
    v19 = v15;
    do
    {
      if (v17 > 0x63)
        goto LABEL_8;
      if (*(__int16 *)(v10 + v18) < 0)
        goto LABEL_8;
      v25 = *(unsigned __int16 *)(v10 + v18);
      v26 = (v25 >> 10) & 0x1F;
      if (v26 < 0xC)
        goto LABEL_8;
      if ((v25 & 0x3F8) <= 0x257 && v26 == 12)
        goto LABEL_8;
      v28 = v25 << 13;
      v29 = (v28 & 0x7FE000 | (v26 << 23)) + 939524096;
      if ((v28 & 0x7FE000) != 0)
        v30 = 2143289344;
      else
        v30 = 2139095040;
      v31 = v30 | v28;
      if (v26 == 31)
        v32 = *(float *)&v31;
      else
        v32 = *(float *)&v29;
      v33 = *(__int16 *)(v11 + v18);
      v34 = v33 & 0x80000000;
      v35 = (v33 >> 10) & 0x1F;
      v36 = *(unsigned __int16 *)(v11 + v18) << 13;
      v37 = v36 & 0x7FE000;
      if (v35 == 31)
      {
        if (v37)
          v40 = 2143289344;
        else
          v40 = 2139095040;
        v39 = v34 | v36 | v40;
        goto LABEL_31;
      }
      if (v35)
        goto LABEL_26;
      if (v37)
      {
        v38 = __clz(v37);
        v35 = 9 - v38;
        v37 = (v36 << (v38 - 8)) & 0x7FE000;
LABEL_26:
        v39 = ((v37 | (v35 << 23)) + 939524096) | v34;
LABEL_31:
        v41 = *(float *)&v39;
        goto LABEL_32;
      }
      if (v34)
        v41 = -0.0;
      else
        v41 = 0.0;
LABEL_32:
      v42 = v32;
      if (v32 > 0.2)
      {
        v43 = *(__int16 *)(v12 + v18);
        v44 = v43 & 0x80000000;
        v45 = (v43 >> 10) & 0x1F;
        v46 = *(unsigned __int16 *)(v12 + v18) << 13;
        v47 = v46 & 0x7FE000;
        if (v45 == 31)
        {
          if (v47)
            v50 = 2143289344;
          else
            v50 = 2139095040;
          v49 = v44 | v46 | v50;
          goto LABEL_42;
        }
        if (v45)
          goto LABEL_37;
        if (v47)
        {
          v48 = __clz(v47);
          v45 = 9 - v48;
          v47 = (v46 << (v48 - 8)) & 0x7FE000;
LABEL_37:
          v49 = ((v47 | (v45 << 23)) + 939524096) | v44;
LABEL_42:
          v51 = *(float *)&v49;
        }
        else if (v44)
        {
          v51 = -0.0;
        }
        else
        {
          v51 = 0.0;
        }
        v52 = *(__int16 *)(v12 + v18 + 6144);
        v53 = v52 & 0x80000000;
        v54 = (v52 >> 10) & 0x1F;
        v55 = *(unsigned __int16 *)(v12 + v18 + 6144) << 13;
        v56 = v55 & 0x7FE000;
        if (v54 == 31)
        {
          if (v56)
            v59 = 2143289344;
          else
            v59 = 2139095040;
          v58 = v53 | v55 | v59;
          goto LABEL_52;
        }
        if (v54)
          goto LABEL_47;
        if (v56)
        {
          v57 = __clz(v56);
          v54 = 9 - v57;
          v56 = (v55 << (v57 - 8)) & 0x7FE000;
LABEL_47:
          v58 = ((v56 | (v54 << 23)) + 939524096) | v53;
LABEL_52:
          v60 = *(float *)&v58;
        }
        else if (v53)
        {
          v60 = -0.0;
        }
        else
        {
          v60 = 0.0;
        }
        v61 = *(__int16 *)(v12 + v18 + 12288);
        v62 = v61 & 0x80000000;
        v63 = (v61 >> 10) & 0x1F;
        v64 = *(unsigned __int16 *)(v12 + v18 + 12288) << 13;
        v65 = v64 & 0x7FE000;
        if (v63 == 31)
        {
          if (v65)
            v68 = 2143289344;
          else
            v68 = 2139095040;
          v67 = v62 | v64 | v68;
          goto LABEL_62;
        }
        if (v63)
          goto LABEL_57;
        if (v65)
        {
          v66 = __clz(v65);
          v63 = 9 - v66;
          v65 = (v64 << (v66 - 8)) & 0x7FE000;
LABEL_57:
          v67 = ((v65 | (v63 << 23)) + 939524096) | v62;
LABEL_62:
          v69 = *(float *)&v67;
        }
        else if (v62)
        {
          v69 = -0.0;
        }
        else
        {
          v69 = 0.0;
        }
        v70 = *(__int16 *)(v12 + v18 + 18432);
        v71 = v70 & 0x80000000;
        v72 = (v70 >> 10) & 0x1F;
        v73 = *(unsigned __int16 *)(v12 + v18 + 18432) << 13;
        v74 = v73 & 0x7FE000;
        if (v72 == 31)
        {
          if (v74)
            v77 = 2143289344;
          else
            v77 = 2139095040;
          v76 = v71 | v73 | v77;
          goto LABEL_72;
        }
        if (v72)
          goto LABEL_67;
        if (v74)
        {
          v75 = __clz(v74);
          v72 = 9 - v75;
          v74 = (v73 << (v75 - 8)) & 0x7FE000;
LABEL_67:
          v76 = ((v74 | (v72 << 23)) + 939524096) | v71;
LABEL_72:
          v78 = *(float *)&v76;
        }
        else if (v71)
        {
          v78 = -0.0;
        }
        else
        {
          v78 = 0.0;
        }
        v79 = (float)*(unsigned int *)(a1 + 252);
        v80 = *(_QWORD *)(a1 + 1424);
        v81 = (float *)(a1 + 32 * v17 + 99764);
        *v81 = *(float *)(v80 + 4 * v19) - (float)(v51 * v79);
        v82 = *(_QWORD *)(a1 + 1432);
        v81[1] = *(float *)(v82 + 4 * v19) - (float)(v60 * v79);
        v81[2] = (float)(v69 * v79) + *(float *)(v80 + 4 * v19);
        v81[3] = (float)(v78 * v79) + *(float *)(v82 + 4 * v19);
        v83 = *(__int16 *)(v13 + v18);
        v84 = v83 & 0x80000000;
        v21 = (v83 >> 10) & 0x1F;
        v85 = *(unsigned __int16 *)(v13 + v18) << 13;
        v22 = v85 & 0x7FE000;
        if (v21 == 31)
        {
          if (v22)
            v86 = 2143289344;
          else
            v86 = 2139095040;
          v23 = v84 | v85 | v86;
        }
        else
        {
          if (!v21)
          {
            if (!v22)
            {
              if (v84)
                v24 = -0.0;
              else
                v24 = 0.0;
              goto LABEL_7;
            }
            v20 = __clz(v22);
            v21 = 9 - v20;
            v22 = (v85 << (v20 - 8)) & 0x7FE000;
          }
          v23 = ((v22 | (v21 << 23)) + 939524096) | v84;
        }
        v24 = *(float *)&v23;
LABEL_7:
        *(float *)(a1 + 32 * v17 + 99788) = sqrtf(v41 * v42);
        *(_DWORD *)(a1 + 32 * v17 + 99780) = v24 > 0.5;
        *(_DWORD *)(a1 + 32 * v17++ + 99784) = v19;
        *(_DWORD *)(v9 + 3176) = v17;
      }
LABEL_8:
      v18 += 2;
      ++v19;
    }
    while (v18 != 128);
    v13 += 128;
    v12 += 128;
    v11 += 128;
    v10 += 128;
    ++v16;
    v15 += 64;
    if (v16 != 48)
      continue;
    break;
  }
  std::chrono::steady_clock::now();
  *(_DWORD *)(v9 + 3176) = acNonMaxSuppressionHandIntra(a1 + 99764, *(unsigned int *)(v9 + 3176), *(_BYTE *)(a1 + 1416), (_OWORD *)(a1 + 1456), *(_DWORD *)(a1 + 24), *(_DWORD *)(a1 + 20), *(float *)(a1 + 72), 0.3, *(float *)(a1 + 1412));
  std::chrono::steady_clock::now();
  if (*(_BYTE *)(a1 + 1420) && *(_BYTE *)(a1 + 1421))
  {
    v89 = a1 + 208;
    v90 = *(unsigned int *)(v9 + 3176);
    if (!(_DWORD)v90)
      goto LABEL_101;
LABEL_103:
    v91 = 0;
    v92 = (float *)v9;
    do
    {
      if (*v92 > *(float *)(v89 + 4 * *((unsigned int *)v92 - 2)))
      {
        v93 = v91++;
        v94 = *(_OWORD *)(v92 - 2);
        v95 = (_OWORD *)(a1 + 99764 + 32 * v93);
        *v95 = *(_OWORD *)(v92 - 6);
        v95[1] = v94;
      }
      v92 += 8;
      --v90;
    }
    while (v90);
    *(_DWORD *)(v9 + 3176) = v91;
    v7[2561] = 0;
    *v8 = 0;
    if (v91)
    {
      v96 = 0;
      v97 = 0;
      v98 = a1 + 241548;
      v99 = (float *)v9;
      do
      {
        if (v96 >= 0x14)
          break;
        ++v97;
        v100 = a5 + ((unint64_t)v96 << 9);
        *(_QWORD *)(v100 + 40688) = v97;
        if (*((_DWORD *)v99 - 2))
          v101 = 11;
        else
          v101 = 10;
        *(_DWORD *)(v100 + 40696) = v101;
        v102 = *(float32x2_t *)(v99 - 6);
        *(float32x2_t *)(v100 + 40700) = v102;
        *(float32x2_t *)(v100 + 40708) = vsub_f32(*(float32x2_t *)(v99 - 4), v102);
        v103 = (int)(float)((float)(*v99 * 1000.0) + 0.5);
        if (v103 >= 1000)
          v103 = 1000;
        if (v103 <= 1)
          v103 = 1;
        *(_DWORD *)(v100 + 40716) = v103;
        *(_DWORD *)(v100 + 41136) = 0;
        *(_OWORD *)&v116[28] = 0uLL;
        *(_OWORD *)v116 = 0uLL;
        memset(&v116[12], 255, 20);
        *(_OWORD *)(v100 + 41140) = 0uLL;
        *(_OWORD *)(v100 + 41156) = *(_OWORD *)v116;
        *(_OWORD *)(v100 + 41172) = *(_OWORD *)&v116[16];
        v104 = *(int8x8_t *)&v116[28];
        *(_OWORD *)(v100 + 41184) = *(_OWORD *)&v116[28];
        v105 = *((unsigned int *)v99 - 1);
        v104.i8[0] = *(_BYTE *)(v14 + v105);
        v106 = (int8x8_t)*(unsigned __int8 *)(v14 + v105 + 3072);
        LOBYTE(v87) = *(_BYTE *)(v14 + v105 + 6144);
        LOBYTE(v88) = *(_BYTE *)(v14 + v105 + 9216);
        v105 *= 4;
        v107 = *(float *)(*(_QWORD *)(a1 + 1424) + v105);
        v108 = (float)*(unsigned int *)(a1 + 252);
        *(float *)v104.i32 = v107
                           + (float)((float)((float)vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(v104)).i32[0] * -0.5)
                                   * v108);
        v109 = *(float *)(*(_QWORD *)(a1 + 1432) + v105);
        *(float *)v106.i32 = v109
                           + (float)((float)((float)vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(v106)).i32[0] * -0.5)
                                   * v108);
        *(_OWORD *)&v116[28] = 0uLL;
        *(_OWORD *)v116 = 0uLL;
        memset(&v116[12], 255, 20);
        *(_OWORD *)(v100 + 41140) = 0uLL;
        *(_OWORD *)(v100 + 41156) = *(_OWORD *)v116;
        *(_OWORD *)(v100 + 41172) = *(_OWORD *)&v116[16];
        *(_OWORD *)(v100 + 41184) = *(_OWORD *)&v116[28];
        *(_DWORD *)(v100 + 41140) = v104.i32[0];
        *(_DWORD *)(v100 + 41144) = v106.i32[0];
        *(float *)(v100 + 41148) = (float)(v107
                                         + (float)((float)((float)vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)&v87)).i32[0]
                                                         * 0.5)
                                                 * v108))
                                 - *(float *)v104.i32;
        *(float *)(v100 + 41152) = (float)(v109
                                         + (float)((float)((float)vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)&v88)).i32[0]
                                                         * 0.5)
                                                 * v108))
                                 - *(float *)v106.i32;
        v110 = (_OWORD *)(v98 + 60 * *v8);
        v111 = *(_OWORD *)(v100 + 41140);
        v112 = *(_OWORD *)(v100 + 41156);
        v87 = *(_OWORD *)(v100 + 41172);
        v88 = *(_OWORD *)(v100 + 41184);
        *(_OWORD *)((char *)v110 + 44) = v88;
        v110[1] = v112;
        v110[2] = v87;
        *v110 = v111;
        LODWORD(v110) = *v8;
        v113 = v98 + 60 * *v8;
        *(float *)(v113 + 16) = *(v99 - 2);
        v114 = *v7;
        *v8 = (_DWORD)v110 + 1;
        *(_DWORD *)(v113 + 20) = v114;
        v96 = v7[2561] + 1;
        v7[2561] = v96;
        v99 += 8;
      }
      while (v97 < *(unsigned int *)(v9 + 3176));
    }
  }
  else
  {
    v89 = a1 + 216;
    v90 = *(unsigned int *)(v9 + 3176);
    if ((_DWORD)v90)
      goto LABEL_103;
LABEL_101:
    *(_DWORD *)(v9 + 3176) = 0;
    v7[2561] = 0;
    *v8 = 0;
  }
  return 0;
}

float AcDetNode::postProcessDetFloat(uint64_t a1, uint64_t *a2, float result, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unsigned int *v18;
  float v19;
  uint64_t v20;
  float v21;
  uint64_t v22;
  int v23;
  uint64_t i;
  uint64_t v25;
  int v26;
  float v27;
  BOOL v28;
  float v29;
  float v30;
  BOOL v31;
  unsigned int v32;
  uint64_t v33;
  float v34;
  float v35;
  float v36;
  float v37;
  uint64_t v38;
  float v39;
  uint64_t v40;
  float v41;
  float v42;
  float v43;
  float v44;
  _OWORD *v45;
  __int128 v46;
  unsigned int v47;
  _DWORD *v48;
  unsigned int v49;
  float v50;
  uint64_t v51;
  float *v52;
  float32x2_t v53;
  float v54;
  uint64_t v55;
  float *v56;
  uint64_t v57;
  uint64_t v58;
  float *v59;
  unint64_t v60;
  __int128 *v61;
  unint64_t v62;
  uint64_t v63;
  __int128 v64;
  uint64_t v65;
  uint64_t v66;
  unsigned int v67;
  float *v68;
  uint64_t v69;
  __int128 v70;
  _OWORD *v71;
  unsigned int v72;
  uint64_t v73;
  unsigned int *v74;
  uint64_t v75;
  unsigned int v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unsigned int v88;
  _DWORD *v89;
  uint64_t v90;
  unsigned int v91;
  int v92;
  _DWORD *v93;
  unsigned int v94;
  BOOL v95;
  uint64_t v96;
  __int128 v97;
  unsigned int v98;
  unsigned int v99;
  int v100;
  _OWORD *v101;
  unsigned int v102;
  uint64_t v104;
  __int128 v105;
  float *v106;
  uint64_t v107;
  float v108;
  float32x2_t v109;
  unsigned int v110;
  unint64_t v111;
  float *v112;
  float32x2_t v113;
  int32x4_t v114;
  int v115;
  uint64_t v116;
  int v117;
  int v118;
  float32x2_t v119;
  _BYTE *v120;
  uint64_t v121;
  float v122;
  float32x2_t v124;
  int v125;
  int v126;
  uint64_t v127;
  float v128;
  int v129;
  int v130;
  unsigned int v131;
  int v132;
  float v133;
  unsigned int v134;
  float v135;
  float v136;
  int v137;
  int v138;
  uint64_t v139;
  float v140;
  int v141;
  int v142;
  int v143;
  unsigned int v144;
  unsigned int v145;
  unint64_t v146;
  uint64_t v147;
  float32x2_t *v148;
  unsigned int v149;
  unint64_t v150;
  unsigned int v151;
  int v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  float32x2_t *v156;
  float32x2_t v157;
  int v158;
  uint64_t v159;
  uint64_t v160;
  float v161;
  unint64_t v162;
  float32x2_t *v163;
  unsigned int v164;
  uint64_t v165;
  float v166;
  float v167;
  float v168;
  float v169;
  float v170;
  float v171;
  uint64_t v172;
  uint64_t v173;
  unsigned int v174;
  uint64_t v175;
  _DWORD *v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  unsigned int v180;
  uint64_t v181;
  float *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  unsigned int *v188;
  uint64_t v189;
  unsigned int *v190;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  unsigned int *v197;
  unint64_t v198;
  _BYTE v199[44];

  v7 = *a2;
  if (*a2)
  {
    v8 = a2[3];
    if (v8)
    {
      v9 = a2[6];
      if (v9)
      {
        v10 = a2[9];
        if (v10)
        {
          v189 = a2[12];
          if (v189)
          {
            v186 = a2[15];
            if (v186)
            {
              v185 = a2[18];
              if (v185)
              {
                v184 = a2[45];
                if (v184)
                {
                  if (a2[48])
                  {
                    v182 = (float *)a2[48];
                    v11 = 0;
                    v12 = 0;
                    v13 = 0;
                    v14 = 0;
                    v190 = (unsigned int *)(a6 + 40684);
                    v15 = *((unsigned int *)a2 + 9);
                    *(_DWORD *)(a1 + 250252) = v15;
                    v16 = *((unsigned int *)a2 + 8);
                    v188 = (unsigned int *)(a1 + 239696);
                    *(_DWORD *)(a1 + 250256) = v16;
                    v17 = v16 * (unint64_t)v15;
                    *(_DWORD *)(a1 + 99760) = 0;
                    *(_DWORD *)(a1 + 102964) = 0;
                    v18 = (unsigned int *)(a1 + 103928);
                    v196 = v16;
                    v197 = (unsigned int *)(a1 + 99760);
                    *(_DWORD *)(a1 + 103928) = 0;
                    v187 = 2 * v17;
                    v183 = 3 * v17;
                    v194 = 12 * v17;
                    v195 = v15;
                    v19 = *(float *)(a1 + 68);
                    v193 = 8 * v17;
                    v198 = v17;
                    v192 = 4 * v17;
                    v20 = 4 * v15;
                    do
                    {
                      if (v13 == 1)
                      {
                        v21 = 0.05;
                      }
                      else
                      {
                        v21 = v19;
                        if (v13 == 11)
                        {
                          v21 = v19;
                          if (*(_BYTE *)(a1 + 104))
                            v21 = *(float *)(a1 + 108);
                        }
                      }
                      if ((_DWORD)v196 && (_DWORD)v195)
                      {
                        v22 = 0;
                        v23 = 0;
                        for (i = 0; i != v196; ++i)
                        {
                          v25 = 0;
                          v26 = v23;
                          do
                          {
                            v27 = *(float *)(v7 + v25);
                            if (*(_BYTE *)(a1 + v13 + 224))
                              v28 = v27 <= v21;
                            else
                              v28 = 1;
                            if (!v28)
                            {
                              v29 = sqrtf(v27 * *(float *)(v8 + v25));
                              if (v13 == 1)
                              {
                                if (v27 < v19)
                                {
                                  v30 = *(float *)(a1 + 100);
                                  if (v29 > v30)
                                    v29 = v30 + -0.01;
                                }
                                v31 = 1;
                              }
                              else
                              {
                                if (v27 <= v19)
                                  v32 = v14;
                                else
                                  v32 = v14 + 1;
                                v31 = v13 != 11;
                                if (v13 == 11)
                                  v14 = v32;
                              }
                              v33 = a1 + 32 * v12;
                              *(float *)(v33 + 1480) = v29;
                              *(_DWORD *)(v33 + 1472) = v13;
                              v34 = (float)*(unsigned int *)(a1 + 252);
                              v35 = *(float *)(v9 + v192 + v25) * v34;
                              v36 = *(float *)(v9 + v193 + v25) * v34;
                              v37 = *(float *)(v9 + v194 + v25);
                              v38 = *(_QWORD *)(a1 + 1424) + v22;
                              v39 = *(float *)(v38 + v25) - (float)(*(float *)(v9 + v25) * v34);
                              *(float *)(v33 + 1456) = v39;
                              v40 = *(_QWORD *)(a1 + 1432) + v22;
                              v41 = v37 * v34;
                              v42 = *(float *)(v40 + v25) - v35;
                              *(float *)(v33 + 1460) = v42;
                              v43 = v36 + *(float *)(v38 + v25);
                              *(float *)(v33 + 1464) = v43;
                              v44 = v41 + *(float *)(v40 + v25);
                              *(float *)(v33 + 1468) = v44;
                              *(_DWORD *)(v33 + 1476) = v26;
                              if (!v13)
                                *(float *)(v33 + 1484) = (float)(*(float *)(v10 + 4 * v198) * -360.0) + 180.0;
                              if (v27 > v19)
                                v31 = 1;
                              if (v31)
                              {
                                if (v12 <= 0xBFE)
                                  *v197 = ++v12;
                              }
                              else if (v27 < 0.2
                                     && v11 <= 0x1D
                                     && (float)((float)((float)(v43 - v39) * (float)(v44 - v42))
                                              / (float)(*(_DWORD *)(a1 + 20) * *(_DWORD *)(a1 + 24))) > 0.04)
                              {
                                v45 = (_OWORD *)(a1 + 32 * v11 + 102968);
                                v46 = *(_OWORD *)(v33 + 1472);
                                *v45 = *(_OWORD *)(v33 + 1456);
                                v45[1] = v46;
                                v11 = *v18 + 1;
                                *v18 = v11;
                              }
                            }
                            v25 += 4;
                            ++v26;
                          }
                          while (v20 != v25);
                          v9 += v25;
                          v8 += v25;
                          v7 += v25;
                          v23 += v195;
                          v22 += v20;
                        }
                        v8 = a2[3];
                        v9 = a2[6];
                      }
                      ++v13;
                    }
                    while (v13 != 12);
                    v47 = acNonMaxSuppression(a1 + 1456, v12, (_DWORD *)(a1 + 227408), 500, *(float *)(a1 + 72), *(float *)(a1 + 76));
                    v48 = (_DWORD *)(a1 + 99760);
                    *v197 = v47;
                    if (v14 <= 0x1E || !*(_BYTE *)(a1 + 104))
                      goto LABEL_71;
                    v49 = acNonMaxSuppressionLowLogitFbody(a1 + 102968, *v18, 0.2, 0.8);
                    *v18 = v49;
                    if (v49)
                    {
                      if (!*(_BYTE *)(a1 + 105))
                      {
                        v54 = *(float *)(a1 + 204) + 0.01;
                        if (v49 >= 2)
                        {
                          v55 = v49 & 0xFFFFFFFE;
                          v56 = (float *)(a1 + 103024);
                          v57 = v55;
                          do
                          {
                            *(v56 - 8) = v54;
                            *v56 = v54;
                            v56 += 16;
                            v57 -= 2;
                          }
                          while (v57);
                          if (v55 == v49)
                            goto LABEL_64;
                        }
                        else
                        {
                          v55 = 0;
                        }
                        v58 = v49 - v55;
                        v59 = (float *)(a1 + 32 * v55 + 102992);
                        do
                        {
                          *v59 = v54;
                          v59 += 8;
                          --v58;
                        }
                        while (v58);
                        goto LABEL_64;
                      }
                      v50 = (float)(*(_DWORD *)(a1 + 20) * *(_DWORD *)(a1 + 24));
                      v51 = v49;
                      v52 = (float *)(a1 + 102992);
                      do
                      {
                        v53 = vsub_f32(*(float32x2_t *)(v52 - 4), *(float32x2_t *)(v52 - 6));
                        if ((float)(vmul_lane_f32(v53, v53, 1).f32[0] / v50) > 0.1)
                          *v52 = *(float *)(a1 + 156) + 0.01;
                        v52 += 8;
                        --v51;
                      }
                      while (v51);
                    }
LABEL_64:
                    acFbodyHlogitSuppressLlogit((float32x2_t *)(a1 + 1456), *v197, a1 + 102968, (unsigned int *)(a1 + 103928), 0.5, *(float32_t *)(a1 + 204));
                    v48 = (_DWORD *)(a1 + 99760);
                    if (*(_DWORD *)(a1 + 103928))
                    {
                      v60 = *v197;
                      if (v60 <= 0xBFE)
                      {
                        v61 = (__int128 *)(a1 + 102968);
                        v62 = 1;
LABEL_67:
                        *v197 = v60 + 1;
                        v63 = a1 + 32 * v60;
                        v64 = *v61;
                        *(_OWORD *)(v63 + 1472) = v61[1];
                        *(_OWORD *)(v63 + 1456) = v64;
                        while (v62 < *(unsigned int *)(a1 + 103928))
                        {
                          v60 = *v197;
                          ++v62;
                          v61 += 2;
                          if (v60 <= 0xBFE)
                            goto LABEL_67;
                        }
                      }
                    }
LABEL_71:
                    if (*(_BYTE *)(a1 + 1420) && *(_BYTE *)(a1 + 1421))
                      v65 = a1 + 160;
                    else
                      v65 = a1 + 112;
                    LODWORD(v66) = *v48;
                    if (*v48 >= 0xBFFu)
                      v66 = 3071;
                    else
                      v66 = v66;
                    *v48 = v66;
                    v67 = 0;
                    if ((_DWORD)v66)
                    {
                      v68 = (float *)(a1 + 1480);
                      do
                      {
                        if (*v68 > *(float *)(v65 + 4 * *((unsigned int *)v68 - 2)))
                        {
                          v69 = v67++;
                          v70 = *(_OWORD *)(v68 - 2);
                          v71 = (_OWORD *)(a1 + 1456 + 32 * v69);
                          *v71 = *(_OWORD *)(v68 - 6);
                          v71[1] = v70;
                        }
                        v68 += 8;
                        --v66;
                      }
                      while (v66);
                    }
                    *v197 = v67;
                    v72 = acRemoveHeadOverlapBoxes((_OWORD *)(a1 + 1456), v67, (unsigned __int8 *)(a1 + 224336), *(float *)(a1 + 76));
                    *v197 = v72;
                    bmHeapsort(a1 + 1456, v72, 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectClassCompareReverse);
                    *(_OWORD *)v188 = 0u;
                    *(_OWORD *)(a1 + 239712) = 0u;
                    *(_OWORD *)(a1 + 239728) = 0u;
                    v73 = *v197;
                    if ((_DWORD)v73)
                    {
                      v74 = (unsigned int *)(a1 + 1472);
                      do
                      {
                        v76 = *v74;
                        v74 += 8;
                        v75 = v76;
                        if (v76 == 1)
                        {
                          ++*v188;
                        }
                        else if (v75 <= 0xB)
                        {
                          ++*(_DWORD *)(a1 + 4 * v75 + 239696);
                        }
                        --v73;
                      }
                      while (v73);
                      v77 = *v188;
                    }
                    else
                    {
                      v77 = 0;
                    }
                    bmHeapsort(a1 + 1456, v77, 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
                    v78 = *v188;
                    bmHeapsort(a1 + 1456 + 32 * v78, *(unsigned int *)(a1 + 239700), 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
                    v79 = (*(_DWORD *)(a1 + 239700) + v78);
                    bmHeapsort(a1 + 1456 + 32 * v79, *(unsigned int *)(a1 + 239704), 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
                    v80 = (*(_DWORD *)(a1 + 239704) + v79);
                    bmHeapsort(a1 + 1456 + 32 * v80, *(unsigned int *)(a1 + 239708), 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
                    v81 = (*(_DWORD *)(a1 + 239708) + v80);
                    bmHeapsort(a1 + 1456 + 32 * v81, *(unsigned int *)(a1 + 239712), 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
                    v82 = (*(_DWORD *)(a1 + 239712) + v81);
                    bmHeapsort(a1 + 1456 + 32 * v82, *(unsigned int *)(a1 + 239716), 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
                    v83 = (*(_DWORD *)(a1 + 239716) + v82);
                    bmHeapsort(a1 + 1456 + 32 * v83, *(unsigned int *)(a1 + 239720), 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
                    v84 = (*(_DWORD *)(a1 + 239720) + v83);
                    bmHeapsort(a1 + 1456 + 32 * v84, *(unsigned int *)(a1 + 239724), 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
                    v85 = (*(_DWORD *)(a1 + 239724) + v84);
                    bmHeapsort(a1 + 1456 + 32 * v85, *(unsigned int *)(a1 + 239728), 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
                    v86 = (*(_DWORD *)(a1 + 239728) + v85);
                    bmHeapsort(a1 + 1456 + 32 * v86, *(unsigned int *)(a1 + 239732), 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
                    v87 = (*(_DWORD *)(a1 + 239732) + v86);
                    bmHeapsort(a1 + 1456 + 32 * v87, *(unsigned int *)(a1 + 239736), 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
                    bmHeapsort(a1 + 1456 + 32 * (*(_DWORD *)(a1 + 239736) + v87), *(unsigned int *)(a1 + 239740), 0x20uLL, (int (*)(uint64_t, uint64_t))acDetRectScoreCompare);
                    v88 = *(_DWORD *)(a1 + 239704);
                    v89 = (_DWORD *)(a1 + 99760);
                    v90 = *v197;
                    v95 = v88 >= 0xF;
                    v91 = v88 - 15;
                    if (v91 != 0 && v95)
                    {
                      if ((_DWORD)v90)
                      {
                        v92 = 0;
                        v93 = (_DWORD *)(a1 + 1472);
                        v94 = v91;
                        do
                        {
                          v95 = *v93 == 2 && ++v92 >= 0x10;
                          if (v95)
                          {
                            v96 = a1 + 32 * v94;
                            v97 = *(_OWORD *)(v96 + 1472);
                            *((_OWORD *)v93 - 1) = *(_OWORD *)(v96 + 1456);
                            *(_OWORD *)v93 = v97;
                          }
                          ++v94;
                          v93 += 8;
                          --v90;
                        }
                        while (v90);
                        LODWORD(v90) = *v197;
                      }
                      LODWORD(v90) = v90 - v91;
                      *v197 = v90;
                    }
                    v98 = *(_DWORD *)(a1 + 239740);
                    if (v98 >= 0x10)
                    {
                      v99 = v98 - 8;
                      if ((_DWORD)v90)
                      {
                        v100 = 0;
                        v101 = (_OWORD *)(a1 + 1472);
                        v102 = v99;
                        v90 = v90;
                        do
                        {
                          if (*(_DWORD *)v101 == 11 && ++v100 >= 0x10)
                          {
                            v104 = a1 + 32 * v102;
                            v105 = *(_OWORD *)(v104 + 1472);
                            *(v101 - 1) = *(_OWORD *)(v104 + 1456);
                            *v101 = v105;
                          }
                          ++v102;
                          v101 += 2;
                          --v90;
                        }
                        while (v90);
                        LODWORD(v90) = *v197;
                        v98 = *(_DWORD *)(a1 + 239740);
                      }
                      LODWORD(v90) = v90 - v99;
                      *v197 = v90;
                    }
                    if (v98 <= 5)
                    {
                      if (!(_DWORD)v90)
                      {
                        *(_DWORD *)(a6 + 7680) = 0;
                        *v190 = 0;
                        v190[2561] = 0;
                        goto LABEL_200;
                      }
                      v106 = (float *)(a1 + 1480);
                      v107 = v90;
                      do
                      {
                        if (*((_DWORD *)v106 - 2) == 11 && *v106 >= 0.55)
                        {
                          v108 = *(float *)(a1 + 156);
                          if (*v106 < v108)
                          {
                            v109 = vsub_f32(*(float32x2_t *)(v106 - 4), *(float32x2_t *)(v106 - 6));
                            if ((float)(vmul_lane_f32(v109, v109, 1).f32[0]
                                       / (float)(*(_DWORD *)(a1 + 20) * *(_DWORD *)(a1 + 24))) > 0.15)
                              *v106 = v108 + 0.01;
                          }
                        }
                        v106 += 8;
                        --v107;
                      }
                      while (v107);
                    }
                    *(_DWORD *)(a6 + 7680) = 0;
                    *v190 = 0;
                    v190[2561] = 0;
                    if ((_DWORD)v90)
                    {
                      v110 = 0;
                      v111 = 0;
                      v112 = (float *)(a1 + 1480);
                      v113 = (float32x2_t)vdup_n_s32(0x43B40000u);
                      v114 = vdupq_n_s32(0xFFFFFE97);
                      do
                      {
                        if (v110 >= 0xF)
                          break;
                        if (*((_DWORD *)v112 - 2) <= 1u)
                        {
                          v116 = a6 + ((unint64_t)v110 << 9);
                          *(_DWORD *)(v116 + 4) = 0;
                          *(_DWORD *)(v116 + 8) = 0;
                          *(_DWORD *)v116 = v111 + 1;
                          v117 = (int)(float)((float)(*v112 * 1000.0) + 0.5);
                          if (v117 >= 1000)
                            v117 = 1000;
                          if (v117 <= 1)
                            v117 = 1;
                          *(_DWORD *)(v116 + 28) = v117;
                          v118 = *((_DWORD *)v112 - 2);
                          v119 = *(float32x2_t *)(v112 - 6);
                          *(float32x2_t *)(v116 + 12) = v119;
                          *(float32x2_t *)(v116 + 20) = vsub_f32(*(float32x2_t *)(v112 - 4), v119);
                          v120 = (_BYTE *)(v116 + 96);
                          if (v118)
                          {
                            *v120 = 0;
                            *(int32x4_t *)(v116 + 32) = v114;
                            *(_DWORD *)(v116 + 48) = -361;
                            v115 = -1;
                            *(_DWORD *)(v116 + 128) = -1;
                            *(_DWORD *)(v116 + 392) = -1;
                            *(_BYTE *)(v116 + 100) = 0;
                            *(_BYTE *)(v116 + 440) = 0;
                          }
                          else
                          {
                            *v120 = 1;
                            v121 = *((unsigned int *)v112 - 1);
                            v122 = *(float *)(v10 + 4 * (v187 + v121));
                            if (v122 < 1.05 && v122 > 1.0)
                              v122 = 1.0;
                            v124.f32[0] = (float)(v122 * 180.0) + -90.0;
                            v125 = (int)v124.f32[0];
                            if ((int)v124.f32[0] >= 90)
                              v125 = 90;
                            if (v125 <= -90)
                              v125 = -90;
                            v126 = (int)(float)((float)((float)(v125 + 90) / 45.0) + 0.5);
                            v127 = v198 + v121;
                            v128 = 180.0 - (float)(*(float *)(v10 + 4 * (v198 + v121)) * 360.0);
                            v129 = (int)(float)((float)(v128 + 180.0) + 360.0) % 360;
                            if (v129 > 0xFFFFFE97)
                              v129 += 360;
                            v130 = (int)(float)((float)((float)v129 / 30.0) + 0.5);
                            v131 = v126 % 5;
                            v132 = v126 % 5 + 5;
                            if (v131 > 0xFFFFFFFA)
                              v131 = v132;
                            v133 = (float)(*(float *)(v10 + 4 * v121) * 180.0) + -90.0;
                            *(_DWORD *)(v116 + 32) = AcDetNode::m_kFacePoseYawCenters[v131];
                            v134 = v130 % 12;
                            if (v134 > 0xFFFFFFF3)
                              v134 += 12;
                            *(_DWORD *)(v116 + 36) = AcDetNode::m_kFacePoseRollCenters[v134];
                            v124.f32[1] = v128;
                            *(int32x2_t *)(v116 + 40) = vcvt_s32_f32((float32x2_t)vbsl_s8((int8x8_t)vcgez_f32(vadd_f32(v124, (float32x2_t)0x3400000034000000)), (int8x8_t)v124, (int8x8_t)vadd_f32(v124, v113)));
                            if ((float)(v133 + 0.00000011921) < 0.0)
                              v135 = v133 + 360.0;
                            else
                              v135 = v133;
                            *(_DWORD *)(v116 + 48) = (int)v135;
                            v136 = (float)(*(float *)(v189 + 4 * v121) - *(float *)(a1 + 236))
                                 / (float)(1.0 - *(float *)(a1 + 236));
                            if (v136 >= 0.0)
                            {
                              v138 = (int)(float)((float)(v136 * 1000.0) + 0.5);
                              if (v138 >= 1000)
                                v138 = 1000;
                              if (v138 <= 1)
                                v137 = 1;
                              else
                                v137 = v138;
                              v121 = *((unsigned int *)v112 - 1);
                              v127 = v198 + v121;
                            }
                            else
                            {
                              v137 = 0;
                            }
                            v139 = a6 + ((unint64_t)v110 << 9);
                            *(_DWORD *)(v139 + 128) = v137;
                            v140 = (float)(*(float *)(v189 + 4 * v127) - *(float *)(a1 + 240))
                                 / (float)(1.0 - *(float *)(a1 + 240));
                            v89 = (_DWORD *)(a1 + 99760);
                            if (v140 >= 0.0)
                            {
                              v142 = (int)(float)((float)(v140 * 1000.0) + 0.5);
                              if (v142 >= 1000)
                                v142 = 1000;
                              if (v142 <= 1)
                                v141 = 1;
                              else
                                v141 = v142;
                              v121 = *((unsigned int *)v112 - 1);
                            }
                            else
                            {
                              v141 = 0;
                            }
                            *(_DWORD *)(v139 + 392) = v141;
                            *(_BYTE *)(v139 + 100) = 1;
                            *(_BYTE *)(v139 + 440) = 1;
                            v143 = (int)(float)((float)(*(float *)(v186 + 4 * v121) * 1000.0) + 0.5);
                            if (v143 >= 1000)
                              v143 = 1000;
                            if (v143 <= 1)
                              v115 = 1;
                            else
                              v115 = v143;
                          }
                          v90 = a6 + ((unint64_t)v110 << 9);
                          *(_DWORD *)(v90 + 420) = v115;
                          *(_BYTE *)(v90 + 388) = 0;
                          *(_DWORD *)(v90 + 448) = 0;
                          *(_DWORD *)(v90 + 444) = 0;
                          *(_DWORD *)(a6 + 7680) = ++v110;
                          LODWORD(v90) = *v89;
                        }
                        ++v111;
                        v112 += 8;
                      }
                      while (v111 < v90);
                      *(_DWORD *)(a1 + 241544) = 0;
                      if ((_DWORD)v90)
                      {
                        v144 = 0;
                        v145 = 0;
                        v146 = 0;
                        v147 = a1 + 239744;
                        do
                        {
                          if (v145 >= 0x1E)
                            break;
                          v148 = (float32x2_t *)(a1 + 32 * v146);
                          v149 = v148[184].u32[0];
                          v150 = v146 + 1;
                          v151 = v149 - 2;
                          if (v149 >= 2)
                          {
                            v152 = 0;
                            v153 = v145;
                            v154 = a6 + ((unint64_t)v145 << 9);
                            *(_QWORD *)(v154 + 25324) = v150;
                            if (v151 <= 0xA)
                              v152 = dword_23591624C[v151];
                            v155 = v154 + 25324;
                            *(_DWORD *)(v154 + 25332) = v152;
                            v156 = (float32x2_t *)(a1 + 32 * v146);
                            v157 = v148[182];
                            *(float32x2_t *)(v154 + 25336) = v157;
                            *(float32x2_t *)(v154 + 25344) = vsub_f32(v156[183], v157);
                            v158 = (int)(float)((float)(v156[185].f32[0] * 1000.0) + 0.5);
                            if (v158 >= 1000)
                              v158 = 1000;
                            if (v158 <= 1)
                              v158 = 1;
                            *(_DWORD *)(v155 + 28) = v158;
                            *(_DWORD *)(v155 + 448) = 0;
                            if (v149 == 11 && v144 <= 0x1D)
                            {
                              v159 = 0;
                              v160 = a1 + 32 * v146;
                              v161 = (float)*(unsigned int *)(a1 + 252);
                              v162 = (float)((float)((float)(v148[182].f32[0] + v156[183].f32[0]) * 0.5)
                                                         / v161);
                              v163 = v148 + 184;
                              if (v195 - 1 <= v162)
                                LODWORD(v162) = v195 - 1;
                              if (v196 - 1 <= (unint64_t)(float)((float)((float)(*(float *)(v160 + 1460) + *(float *)(v160 + 1468))
                                                                                             * 0.5)
                                                                                     / v161))
                                v164 = v196 - 1;
                              else
                                v164 = (float)((float)((float)(*(float *)(v160 + 1460)
                                                                           + *(float *)(v160 + 1468))
                                                                   * 0.5)
                                                           / v161);
                              v165 = *(unsigned int *)(v160 + 1476);
                              v166 = *(float *)(*(_QWORD *)(a1 + 1424) + 4 * v165);
                              v167 = v166 + (float)((float)(*(float *)(v184 + 4 * v165) * -0.5) * v161);
                              v168 = *(float *)(*(_QWORD *)(a1 + 1432) + 4 * v165);
                              v169 = v168 + (float)((float)(*(float *)(v184 + 4 * (v198 + v165)) * -0.5) * v161);
                              v170 = v166 + (float)((float)(*(float *)(v184 + 4 * (v187 + v165)) * 0.5) * v161);
                              *(_OWORD *)&v199[28] = 0uLL;
                              *(_OWORD *)v199 = 0uLL;
                              memset(&v199[12], 255, 20);
                              v171 = v168 + (float)((float)(*(float *)(v184 + 4 * (v183 + v165)) * 0.5) * v161);
                              v172 = v153 << 9;
                              v173 = a6 + 25324 + v172;
                              *(_OWORD *)(v173 + 452) = 0uLL;
                              *(_OWORD *)(v173 + 468) = *(_OWORD *)v199;
                              *(_OWORD *)(v173 + 484) = *(_OWORD *)&v199[16];
                              *(_OWORD *)(v173 + 496) = *(_OWORD *)&v199[28];
                              *(float *)(v173 + 452) = v167;
                              *(float *)(v173 + 456) = v169;
                              *(float *)(v173 + 460) = v170 - v167;
                              *(float *)(v173 + 464) = v171 - v169;
                              v174 = v162 + v164 * v195;
                              v175 = a6 + 25456 + v172;
                              v176 = (_DWORD *)(v185 + 4 * v174);
                              do
                              {
                                *(_DWORD *)(v175 + v159) = *v176;
                                v159 += 4;
                                v176 += (v196 * v195);
                              }
                              while (v159 != 256);
                              v90 = v147 + 60 * *(unsigned int *)(a1 + 241544);
                              v177 = *(_OWORD *)(v173 + 452);
                              v178 = *(_OWORD *)(v173 + 468);
                              v179 = *(_OWORD *)(v173 + 484);
                              *(_OWORD *)(v90 + 44) = *(_OWORD *)(v173 + 496);
                              *(_OWORD *)(v90 + 16) = v178;
                              *(_OWORD *)(v90 + 32) = v179;
                              *(_OWORD *)v90 = v177;
                              v180 = *(_DWORD *)(a1 + 241544);
                              v181 = v147 + 60 * v180;
                              *(_DWORD *)(v181 + 16) = v163->i32[0];
                              v145 = *v190;
                              v144 = v180 + 1;
                              *(_DWORD *)(a1 + 241544) = v144;
                              *(_DWORD *)(v181 + 20) = v145;
                              LODWORD(v90) = *v197;
                            }
                            *v190 = ++v145;
                          }
                          v146 = v150;
                        }
                        while (v150 < v90);
                      }
                      goto LABEL_201;
                    }
LABEL_200:
                    *(_DWORD *)(a1 + 241544) = 0;
LABEL_201:
                    result = *v182;
                    v190[2562] = *(_DWORD *)v182;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t AcDetNode::postProcessHandFloat(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _DWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  uint64_t v31;
  float v32;
  float *v33;
  uint64_t v34;
  float v35;
  unsigned int v36;
  uint64_t v37;
  unsigned int v38;
  unint64_t v39;
  uint64_t v40;
  float *v41;
  uint64_t v42;
  __int128 v43;
  _OWORD *v44;
  unsigned int v45;
  unint64_t v46;
  uint64_t v47;
  float *v48;
  uint64_t v49;
  int v50;
  float32x2_t v51;
  int v52;
  uint64_t v53;
  float v54;
  float v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  _OWORD *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  int v66;
  _BYTE v68[44];

  v7 = (_DWORD *)(a1 + 243348);
  v8 = a1 + 99788;
  v9 = a2[21];
  v10 = a2[24];
  v11 = a2[27];
  v12 = a2[30];
  v13 = a2[45];
  v14 = *(unsigned int *)(a1 + 250252);
  v15 = *(unsigned int *)(a1 + 250256);
  *(_DWORD *)(a1 + 102964) = 0;
  if ((_DWORD)v15 && (_DWORD)v14)
  {
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = v15 * (unint64_t)v14;
    v21 = 8 * v20;
    v22 = 4 * v20;
    v23 = 4 * v14;
    do
    {
      v24 = 0;
      v25 = v17;
      do
      {
        v26 = *(float *)(v9 + v24);
        if (v26 > 0.2 && v18 <= 0x63)
        {
          v27 = sqrtf(v26 * *(float *)(v10 + v24));
          v28 = (float)*(unsigned int *)(a1 + 252);
          v29 = *(float *)(v11 + v22 + v24) * v28;
          v30 = *(float *)(v11 + v21 + v24) * v28;
          v31 = *(_QWORD *)(a1 + 1424) + v16;
          v32 = *(float *)(v11 + 12 * v15 * (unint64_t)v14 + v24);
          v33 = (float *)(a1 + 32 * v18 + 99764);
          *v33 = *(float *)(v31 + v24) - (float)(*(float *)(v11 + v24) * v28);
          v34 = *(_QWORD *)(a1 + 1432) + v16;
          v33[1] = *(float *)(v34 + v24) - v29;
          v33[2] = v30 + *(float *)(v31 + v24);
          v33[3] = (float)(v32 * v28) + *(float *)(v34 + v24);
          v35 = *(float *)(v12 + v24);
          v33[6] = v27;
          *(_DWORD *)(a1 + 32 * v18 + 99780) = v35 > 0.5;
          *(_DWORD *)(a1 + 32 * v18 + 99784) = v25;
          v18 = (v18 + 1);
          *(_DWORD *)(v8 + 3176) = v18;
        }
        v24 += 4;
        ++v25;
      }
      while (v23 != v24);
      v12 += v24;
      v11 += v24;
      v10 += v24;
      v9 += v24;
      ++v19;
      v17 += v14;
      v16 += v23;
    }
    while (v19 != v15);
  }
  else
  {
    v18 = 0;
  }
  v36 = acNonMaxSuppressionHandIntra(a1 + 99764, v18, *(_BYTE *)(a1 + 1416), (_OWORD *)(a1 + 1456), *(_DWORD *)(a1 + 24), *(_DWORD *)(a1 + 20), *(float *)(a1 + 72), 0.3, *(float *)(a1 + 1412));
  *(_DWORD *)(v8 + 3176) = v36;
  if (*(_BYTE *)(a1 + 1420) && *(_BYTE *)(a1 + 1421))
  {
    v37 = a1 + 208;
    if (!v36)
    {
LABEL_14:
      *(_DWORD *)(v8 + 3176) = 0;
      *(_DWORD *)(a5 + 50928) = 0;
      *v7 = 0;
      return 0;
    }
  }
  else
  {
    v37 = a1 + 216;
    if (!v36)
      goto LABEL_14;
  }
  v38 = 0;
  v39 = v15 * (unint64_t)v14;
  v40 = v36;
  v41 = (float *)v8;
  do
  {
    if (*v41 > *(float *)(v37 + 4 * *((unsigned int *)v41 - 2)))
    {
      v42 = v38++;
      v43 = *(_OWORD *)(v41 - 2);
      v44 = (_OWORD *)(a1 + 99764 + 32 * v42);
      *v44 = *(_OWORD *)(v41 - 6);
      v44[1] = v43;
    }
    v41 += 8;
    --v40;
  }
  while (v40);
  *(_DWORD *)(v8 + 3176) = v38;
  *(_DWORD *)(a5 + 50928) = 0;
  *v7 = 0;
  if (v38)
  {
    v45 = 0;
    v46 = 0;
    v47 = a1 + 241548;
    v48 = (float *)v8;
    do
    {
      if (v45 >= 0x14)
        break;
      ++v46;
      v49 = a5 + ((unint64_t)v45 << 9);
      *(_QWORD *)(v49 + 40688) = v46;
      if (*((_DWORD *)v48 - 2))
        v50 = 11;
      else
        v50 = 10;
      *(_DWORD *)(v49 + 40696) = v50;
      v51 = *(float32x2_t *)(v48 - 6);
      *(float32x2_t *)(v49 + 40700) = v51;
      *(float32x2_t *)(v49 + 40708) = vsub_f32(*(float32x2_t *)(v48 - 4), v51);
      v52 = (int)(float)((float)(*v48 * 1000.0) + 0.5);
      if (v52 >= 1000)
        v52 = 1000;
      if (v52 <= 1)
        v52 = 1;
      *(_DWORD *)(v49 + 40716) = v52;
      *(_DWORD *)(v49 + 41136) = 0;
      *(_OWORD *)&v68[28] = 0uLL;
      *(_OWORD *)v68 = 0uLL;
      memset(&v68[12], 255, 20);
      *(_OWORD *)(v49 + 41140) = 0uLL;
      *(_OWORD *)(v49 + 41156) = *(_OWORD *)v68;
      *(_OWORD *)(v49 + 41172) = *(_OWORD *)&v68[16];
      *(_OWORD *)(v49 + 41184) = *(_OWORD *)&v68[28];
      v53 = *((unsigned int *)v48 - 1);
      v54 = *(float *)(*(_QWORD *)(a1 + 1424) + 4 * v53);
      v55 = (float)*(unsigned int *)(a1 + 252);
      v56 = v54 + (float)((float)(*(float *)(v13 + 4 * v53) * -0.5) * v55);
      v57 = *(float *)(*(_QWORD *)(a1 + 1432) + 4 * v53);
      v58 = v57 + (float)((float)(*(float *)(v13 + 4 * (v39 + v53)) * -0.5) * v55);
      v59 = v54 + (float)((float)(*(float *)(v13 + 4 * (2 * v39 + v53)) * 0.5) * v55);
      v60 = v57
          + (float)((float)(*(float *)(v13 + 4 * (3 * v15 * (unint64_t)v14 + v53))
                          * 0.5)
                  * v55);
      *(_OWORD *)&v68[28] = 0uLL;
      *(_OWORD *)v68 = 0uLL;
      memset(&v68[12], 255, 20);
      *(_OWORD *)(v49 + 41140) = 0uLL;
      *(_OWORD *)(v49 + 41156) = *(_OWORD *)v68;
      *(_OWORD *)(v49 + 41172) = *(_OWORD *)&v68[16];
      *(_OWORD *)(v49 + 41184) = *(_OWORD *)&v68[28];
      *(float *)(v49 + 41140) = v56;
      *(float *)(v49 + 41144) = v58;
      *(float *)(v49 + 41148) = v59 - v56;
      *(float *)(v49 + 41152) = v60 - v58;
      v61 = (_OWORD *)(v47 + 60 * *v7);
      v62 = *(_OWORD *)(v49 + 41140);
      v63 = *(_OWORD *)(v49 + 41156);
      v64 = *(_OWORD *)(v49 + 41172);
      *(_OWORD *)((char *)v61 + 44) = *(_OWORD *)(v49 + 41184);
      v61[1] = v63;
      v61[2] = v64;
      *v61 = v62;
      LODWORD(v61) = *v7;
      v65 = v47 + 60 * *v7;
      *(float *)(v65 + 16) = *(v48 - 2);
      v66 = *(_DWORD *)(a5 + 40684);
      *v7 = (_DWORD)v61 + 1;
      *(_DWORD *)(v65 + 20) = v66;
      v45 = *(_DWORD *)(a5 + 50928) + 1;
      *(_DWORD *)(a5 + 50928) = v45;
      v48 += 8;
    }
    while (v46 < *(unsigned int *)(v8 + 3176));
  }
  return 0;
}

uint64_t AcDetNode::postProcessFacialLandmarkHalf()
{
  return 0;
}

uint64_t AcDetNode::postProcessFacialLandmarkFloat()
{
  return 0;
}

uint64_t AcDetNode::getParams(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  __int128 v5;
  __int128 v6;
  unsigned int v7;
  unsigned int v8;

  if (*a2 != 2)
    return 4294967289;
  if (a2[1] != 56945)
    return 4294967292;
  v5 = *(_OWORD *)(a1 + 20);
  *(_QWORD *)(a3 + 16) = *(_QWORD *)(a1 + 36);
  *(_OWORD *)a3 = v5;
  v6 = *(_OWORD *)(a1 + 44);
  *(_QWORD *)(a3 + 40) = *(_QWORD *)(a1 + 60);
  *(_OWORD *)(a3 + 24) = v6;
  v7 = *(_DWORD *)(a1 + 244);
  v8 = *(_DWORD *)(a1 + 248);
  *(_DWORD *)(a3 + 48) = v8;
  *(_DWORD *)(a3 + 52) = v7;
  *(_QWORD *)(a3 + 56) = 0x70000000CLL;
  *(_QWORD *)(a3 + 64) = 1065353216;
  *(_DWORD *)(a3 + 72) = v8;
  *(_DWORD *)(a3 + 76) = v7;
  *(_QWORD *)(a3 + 80) = 0x700000001;
  *(_QWORD *)(a3 + 88) = 1065353216;
  *(_DWORD *)(a3 + 96) = v8;
  *(_DWORD *)(a3 + 100) = v7;
  *(_QWORD *)(a3 + 104) = 0x700000004;
  *(_QWORD *)(a3 + 112) = 1065353216;
  *(_DWORD *)(a3 + 120) = v8;
  *(_DWORD *)(a3 + 124) = v7;
  *(_QWORD *)(a3 + 128) = 0x700000003;
  *(_QWORD *)(a3 + 136) = 1065353216;
  *(_DWORD *)(a3 + 144) = v8;
  *(_DWORD *)(a3 + 148) = v7;
  *(_QWORD *)(a3 + 152) = 0x700000002;
  *(_QWORD *)(a3 + 160) = 1065353216;
  *(_DWORD *)(a3 + 168) = v8;
  *(_DWORD *)(a3 + 172) = v7;
  *(_QWORD *)(a3 + 176) = 0x700000003;
  *(_QWORD *)(a3 + 184) = 1065353216;
  *(_DWORD *)(a3 + 192) = v8;
  *(_DWORD *)(a3 + 196) = v7;
  *(_QWORD *)(a3 + 200) = 64;
  *(_QWORD *)(a3 + 208) = 1065353216;
  *(_DWORD *)(a3 + 216) = v8;
  *(_DWORD *)(a3 + 220) = v7;
  *(_QWORD *)(a3 + 224) = 0x700000001;
  *(_QWORD *)(a3 + 232) = 1065353216;
  *(_DWORD *)(a3 + 240) = v8;
  *(_DWORD *)(a3 + 244) = v7;
  *(_QWORD *)(a3 + 248) = 0x700000001;
  *(_QWORD *)(a3 + 256) = 1065353216;
  *(_DWORD *)(a3 + 268) = v7;
  *(_DWORD *)(a3 + 264) = v8;
  *(_QWORD *)(a3 + 272) = 0x700000004;
  *(_QWORD *)(a3 + 280) = 1065353216;
  *(_DWORD *)(a3 + 292) = v7;
  *(_DWORD *)(a3 + 288) = v8;
  *(_QWORD *)(a3 + 296) = 0x700000001;
  *(_QWORD *)(a3 + 304) = 1065353216;
  *(_DWORD *)(a3 + 316) = v7 >> 1;
  *(_DWORD *)(a3 + 312) = v8 >> 2;
  *(_QWORD *)(a3 + 320) = 0x700000001;
  *(_QWORD *)(a3 + 328) = 1065353216;
  *(_DWORD *)(a3 + 340) = v7 >> 1;
  *(_DWORD *)(a3 + 336) = v8 >> 2;
  *(_QWORD *)(a3 + 344) = 0x700000001;
  *(_QWORD *)(a3 + 352) = 1065353216;
  *(_DWORD *)(a3 + 364) = v7 >> 1;
  *(_DWORD *)(a3 + 360) = v8 >> 2;
  *(_QWORD *)(a3 + 368) = 0x700000004;
  *(_QWORD *)(a3 + 376) = 1065353216;
  *(_DWORD *)(a3 + 388) = v7;
  *(_DWORD *)(a3 + 384) = v8 >> 2;
  *(_QWORD *)(a3 + 392) = 98;
  *(_QWORD *)(a3 + 400) = 1065353216;
  *(_DWORD *)(a3 + 412) = v7;
  *(_DWORD *)(a3 + 408) = v8;
  *(_QWORD *)(a3 + 416) = 4;
  *(_QWORD *)(a3 + 424) = 1065353216;
  *(_OWORD *)(a3 + 432) = xmmword_235916930;
  *(_QWORD *)(a3 + 448) = 1065353216;
  strncpy((char *)(a3 + 776), (const char *)(a1 + 324), 0x40uLL);
  strncpy((char *)(a3 + 840), (const char *)(a1 + 388), 0x40uLL);
  strncpy((char *)(a3 + 904), (const char *)(a1 + 452), 0x40uLL);
  strncpy((char *)(a3 + 968), (const char *)(a1 + 516), 0x40uLL);
  strncpy((char *)(a3 + 1032), (const char *)(a1 + 580), 0x40uLL);
  strncpy((char *)(a3 + 1096), (const char *)(a1 + 644), 0x40uLL);
  strncpy((char *)(a3 + 1160), (const char *)(a1 + 708), 0x40uLL);
  strncpy((char *)(a3 + 1224), (const char *)(a1 + 772), 0x40uLL);
  strncpy((char *)(a3 + 1288), (const char *)(a1 + 836), 0x40uLL);
  strncpy((char *)(a3 + 1352), (const char *)(a1 + 900), 0x40uLL);
  strncpy((char *)(a3 + 1416), (const char *)(a1 + 964), 0x40uLL);
  strncpy((char *)(a3 + 1480), (const char *)(a1 + 1028), 0x40uLL);
  strncpy((char *)(a3 + 1544), (const char *)(a1 + 1092), 0x40uLL);
  strncpy((char *)(a3 + 1608), (const char *)(a1 + 1156), 0x40uLL);
  strncpy((char *)(a3 + 1672), (const char *)(a1 + 1220), 0x40uLL);
  strncpy((char *)(a3 + 1736), (const char *)(a1 + 1284), 0x40uLL);
  strncpy((char *)(a3 + 1800), (const char *)(a1 + 1348), 0x40uLL);
  return 0;
}

uint64_t AcDetNode::useLowThresholds(uint64_t this, char a2)
{
  *(_BYTE *)(this + 1420) = a2;
  return this;
}

uint64_t AcDetNode::internalUseLowThresholds(uint64_t this, char a2)
{
  *(_BYTE *)(this + 1421) = a2;
  *(_BYTE *)(this + 1422) = a2;
  return this;
}

float cosineDistance(const float *a1, const float *a2, unsigned int a3)
{
  uint64_t v3;
  float v4;
  float v5;
  float v6;
  float *v7;
  float *v8;
  uint64_t v9;
  float v10;
  float v11;
  uint64_t v12;
  uint64_t v13;
  float *v14;
  const float *v15;
  float v16;
  float v17;
  float v18;

  if (!a3)
  {
    v6 = 0.0;
    v5 = 0.0;
    v4 = 0.0;
    return 1.0 - (float)(v6 / (float)((float)(sqrtf(v5) * sqrtf(v4)) + 0.00001));
  }
  if (a3 == 1)
  {
    v3 = 0;
    v4 = 0.0;
    v5 = 0.0;
    v6 = 0.0;
LABEL_8:
    v12 = a3 - v3;
    v13 = v3;
    v14 = (float *)&a2[v3];
    v15 = &a1[v13];
    do
    {
      v16 = *v15++;
      v17 = v16;
      v18 = *v14++;
      v6 = v6 + (float)(v17 * v18);
      v5 = v5 + (float)(v17 * v17);
      v4 = v4 + (float)(v18 * v18);
      --v12;
    }
    while (v12);
    return 1.0 - (float)(v6 / (float)((float)(sqrtf(v5) * sqrtf(v4)) + 0.00001));
  }
  v3 = a3 & 0xFFFFFFFE;
  v7 = (float *)(a2 + 1);
  v8 = (float *)(a1 + 1);
  v4 = 0.0;
  v9 = v3;
  v5 = 0.0;
  v6 = 0.0;
  do
  {
    v10 = *(v8 - 1);
    v11 = *(v7 - 1);
    v4 = (float)(v4 + (float)(v11 * v11)) + (float)(*v7 * *v7);
    v5 = (float)(v5 + (float)(v10 * v10)) + (float)(*v8 * *v8);
    v6 = (float)(v6 + (float)(v10 * v11)) + (float)(*v8 * *v7);
    v7 += 2;
    v8 += 2;
    v9 -= 2;
  }
  while (v9);
  if (v3 != a3)
    goto LABEL_8;
  return 1.0 - (float)(v6 / (float)((float)(sqrtf(v5) * sqrtf(v4)) + 0.00001));
}

float32x4_t *vectorAdd(float32x4_t *result, double a2, float32x4_t *a3, float a4, float *a5, unsigned int a6)
{
  uint64_t v6;
  uint64_t v7;
  float32x4_t v8;
  float32x4_t *v9;
  float32x4_t *v10;
  float *v11;
  uint64_t v12;
  float32x4_t v13;
  int v14;
  float v15;
  float v16;
  float v17;

  if (a6)
  {
    if (a6 <= 7)
    {
      LODWORD(v6) = 0;
      goto LABEL_10;
    }
    LODWORD(v6) = 0;
    if ((unint64_t)((char *)a5 - (char *)result) < 0x20 || (unint64_t)((char *)a5 - (char *)a3) < 0x20)
      goto LABEL_10;
    v6 = a6 & 0xFFFFFFF8;
    v7 = 4 * v6;
    v8 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a2, 0);
    v9 = result + 1;
    v10 = a3 + 1;
    v11 = a5 + 4;
    v12 = v6;
    do
    {
      v13 = vmlaq_f32(vmulq_n_f32(*v10, a4), v8, *v9);
      *((float32x4_t *)v11 - 1) = vmlaq_f32(vmulq_n_f32(v10[-1], a4), v8, v9[-1]);
      *(float32x4_t *)v11 = v13;
      v9 += 2;
      v10 += 2;
      v11 += 8;
      v12 -= 8;
    }
    while (v12);
    if (v6 != a6)
    {
      a5 = (float *)((char *)a5 + v7);
      result = (float32x4_t *)((char *)result + v7);
      a3 = (float32x4_t *)((char *)a3 + 4 * v6);
LABEL_10:
      v14 = a6 - v6;
      do
      {
        v15 = result->f32[0];
        result = (float32x4_t *)((char *)result + 4);
        v16 = v15;
        v17 = a3->f32[0];
        a3 = (float32x4_t *)((char *)a3 + 4);
        *a5++ = (float)(v17 * a4) + (float)(v16 * *(float *)&a2);
        --v14;
      }
      while (v14);
    }
  }
  return result;
}

float vectorNorm(float *a1, int a2)
{
  uint64_t v2;
  float v3;
  float *v5;
  uint64_t v6;
  int v7;
  float v8;

  if (!a2)
    return sqrtf(0.0);
  if (a2 == 1)
  {
    LODWORD(v2) = 0;
    v3 = 0.0;
  }
  else
  {
    v2 = a2 & 0xFFFFFFFE;
    v5 = a1 + 1;
    v3 = 0.0;
    v6 = v2;
    do
    {
      v3 = (float)(v3 + (float)(*(v5 - 1) * *(v5 - 1))) + (float)(*v5 * *v5);
      v5 += 2;
      v6 -= 2;
    }
    while (v6);
    if (v2 == a2)
      return sqrtf(v3);
    a1 += v2;
  }
  v7 = a2 - v2;
  do
  {
    v8 = *a1++;
    v3 = v3 + (float)(v8 * v8);
    --v7;
  }
  while (v7);
  return sqrtf(v3);
}

float *vectorScaleInPlace(float *result, double a2, unsigned int a3)
{
  uint64_t v3;
  float32x4_t v4;
  float32x4_t *v5;
  uint64_t v6;
  float32x4_t v7;
  int v8;

  if (a3)
  {
    *(float *)&a2 = *(float *)&a2 + 0.0000001;
    if (a3 <= 7)
    {
      LODWORD(v3) = 0;
      goto LABEL_8;
    }
    v3 = a3 & 0xFFFFFFF8;
    v4 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a2, 0);
    v5 = (float32x4_t *)(result + 4);
    v6 = v3;
    do
    {
      v7 = vdivq_f32(*v5, v4);
      v5[-1] = vdivq_f32(v5[-1], v4);
      *v5 = v7;
      v5 += 2;
      v6 -= 8;
    }
    while (v6);
    if (v3 != a3)
    {
      result += v3;
LABEL_8:
      v8 = a3 - v3;
      do
      {
        *result = *result / *(float *)&a2;
        ++result;
        --v8;
      }
      while (v8);
    }
  }
  return result;
}

double acAssoPointNull@<D0>(uint64_t a1@<X8>)
{
  double result;

  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 44) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_QWORD *)(a1 + 28) = -1;
  *(_QWORD *)(a1 + 36) = -1;
  *(_DWORD *)(a1 + 44) = -1;
  return result;
}

__n128 acObjectFromFace@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v3;
  *(_DWORD *)(a2 + 32) = *(_DWORD *)(a1 + 1620);
  return result;
}

__n128 acObjectToFace@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __n128 result;
  __int128 v5;

  bzero((void *)(a2 + 32), 0x634uLL);
  result = *(__n128 *)a1;
  v5 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v5;
  *(_DWORD *)(a2 + 1620) = *(_DWORD *)(a1 + 32);
  return result;
}

__n128 acObjectToFaceInternal@<Q0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  __n128 result;
  __int128 v3;

  a2[30] = 0u;
  a2[31] = 0u;
  a2[28] = 0u;
  a2[29] = 0u;
  a2[26] = 0u;
  a2[27] = 0u;
  a2[24] = 0u;
  a2[25] = 0u;
  a2[22] = 0u;
  a2[23] = 0u;
  a2[20] = 0u;
  a2[21] = 0u;
  a2[18] = 0u;
  a2[19] = 0u;
  a2[16] = 0u;
  a2[17] = 0u;
  a2[14] = 0u;
  a2[15] = 0u;
  a2[12] = 0u;
  a2[13] = 0u;
  a2[10] = 0u;
  a2[11] = 0u;
  a2[8] = 0u;
  a2[9] = 0u;
  a2[6] = 0u;
  a2[7] = 0u;
  a2[4] = 0u;
  a2[5] = 0u;
  a2[2] = 0u;
  a2[3] = 0u;
  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  *((_DWORD *)a2 + 112) = *(_DWORD *)(a1 + 32);
  return result;
}

void *acFaceInternalToFace@<X0>(_DWORD *a1@<X0>, const void *a2@<X1>, int a3@<W2>, _DWORD *a4@<X8>)
{
  void *v8;
  void *result;

  v8 = a4 + 111;
  bzero(a4 + 111, 0x498uLL);
  result = memcpy(a4, a1, 0x1BCuLL);
  if (a3)
    result = memcpy(v8, a2, 0x498uLL);
  a4[405] = a1[112];
  return result;
}

__n128 acObjectFromFaceInternal@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v3;
  *(_DWORD *)(a2 + 32) = *(_DWORD *)(a1 + 448);
  return result;
}

_BYTE *AcAssoNode::AcAssoNode(_BYTE *a1, _QWORD *a2)
{
  bzero(a1, 0x2ECuLL);
  *a2 = 0x721CC00000001;
  a1[1472] = 0;
  return a1;
}

{
  bzero(a1, 0x2ECuLL);
  *a2 = 0x721CC00000001;
  a1[1472] = 0;
  return a1;
}

void AcAssoNode::~AcAssoNode(AcAssoNode *this)
{
  uint64_t v2;

  v2 = *(_QWORD *)this;
  if (v2)
  {
    MEMORY[0x23B7DA6CC](v2, 0x1000C8077774924);
    *(_QWORD *)this = 0;
  }
}

{
  uint64_t v2;

  v2 = *(_QWORD *)this;
  if (v2)
  {
    MEMORY[0x23B7DA6CC](v2, 0x1000C8077774924);
    *(_QWORD *)this = 0;
  }
}

uint64_t AcAssoNode::sec_init(uint64_t a1, uint64_t a2)
{
  _DWORD *v5;
  uint64_t v6;
  uint64_t result;

  if (*(_DWORD *)a2 != 1)
    return 4294967289;
  if ((*(_DWORD *)(a2 + 4) - 467393) > 0xB || ((1 << (*(_BYTE *)(a2 + 4) + 63)) & 0x901) == 0)
    return 4294967292;
  v5 = (_DWORD *)(a2 + 186384);
  *(_DWORD *)(a2 + 4) = 467404;
  memcpy((void *)(a1 + 12), &kAcAssoNodeConfigFPS30RawData, 0x2E0uLL);
  *(_BYTE *)(a1 + 748) = 0;
  *(_DWORD *)(a1 + 8) = 212610;
  v6 = operator new[]();
  result = 0;
  *(_QWORD *)a1 = v6;
  *(_DWORD *)(a2 + 4) = 467393;
  *(_DWORD *)(a2 + 51728) = 0;
  *(_QWORD *)(a2 + 202368) = 0;
  *(_DWORD *)(a2 + 103452) = 0;
  *(_DWORD *)(a2 + 119056) = 0;
  *(_DWORD *)(a2 + 134660) = 0;
  *v5 = 0;
  *(_DWORD *)(a2 + 201988) = 0;
  *(_OWORD *)(a2 + 202352) = xmmword_235916940;
  *(_DWORD *)(a2 + 202376) = -1082130432;
  *(_BYTE *)(a1 + 748) = 0;
  return result;
}

uint64_t AcAssoNode::restart(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (*(_DWORD *)a2 != 1 || (*(_DWORD *)(a2 + 4) | 8) != 0x721C9)
    return 4294967289;
  result = 0;
  *(_DWORD *)(a2 + 51728) = 0;
  *(_DWORD *)(a2 + 202364) = 0;
  *(_QWORD *)(a2 + 202372) = 0xBF80000000000000;
  *(_DWORD *)(a2 + 103452) = 0;
  *(_DWORD *)(a2 + 119056) = 0;
  *(_DWORD *)(a2 + 134660) = 0;
  *(_DWORD *)(a2 + 186384) = 0;
  *(_DWORD *)(a2 + 201988) = 0;
  *(_BYTE *)(a1 + 748) = 0;
  return result;
}

uint64_t AcAssoNode::associationPreProc(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4, uint64_t a5, _DWORD *__src, uint64_t a7, _DWORD *a8)
{
  char *v14;
  int v15;
  void *v16;
  const void *v17;
  uint64_t result;
  char *v19;
  unint64_t v20;
  char *v21;
  unsigned int *v22;
  unint64_t v23;
  unsigned int *v24;
  uint64_t v25;
  _DWORD *v26;
  float *v27;
  unint64_t v28;
  unsigned int *v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  int v33;
  int v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float *v48;
  float v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  float v58;
  _BOOL4 v60;
  _BOOL4 v62;
  float v63;
  float v64;
  float v65;
  float v66;
  float v68;
  float v69;
  float v70;
  float v71;
  _BOOL4 v74;
  _BOOL4 v76;
  float v77;
  float v78;
  float v79;
  float v80;
  float v82;
  float v83;
  float v84;
  float v85;
  float v87;
  BOOL v89;
  float v90;
  unsigned int v91;
  uint64_t v92;
  _DWORD *v93;
  _DWORD *v94;
  uint64_t v95;
  unsigned int v96;
  _DWORD *v97;
  _DWORD *v98;
  unsigned int v99;
  _DWORD *v100;
  int *v101;
  unsigned int v102;
  uint64_t v103;
  _DWORD *v104;
  uint64_t v105;
  uint64_t v106;
  _DWORD *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  _DWORD *v112;
  unsigned int v113;
  int *v114;
  unsigned int v115;
  unsigned int v116;
  int v117;
  _DWORD v118[3];

  if (*a8 != 1 || a8[1] != 467393)
    return 4294967289;
  v14 = (char *)(__src + 6338);
  v15 = *(unsigned __int8 *)(a5 + 21);
  if (v15 != *(unsigned __int8 *)(a1 + 748))
  {
    *(_BYTE *)(a1 + 748) = v15;
    v16 = (void *)(a1 + 12);
    if (v15)
      v17 = &kAcAssoNodeConfigFPS5RawData;
    else
      v17 = &kAcAssoNodeConfigFPS30RawData;
    memcpy(v16, v17, 0x2E0uLL);
  }
  v19 = (char *)(__src + 10179);
  v112 = a8;
  v115 = a2;
  v116 = a3;
  v113 = a4;
  if (!__src[1920])
  {
    LODWORD(v20) = 0;
    if (!*((_DWORD *)v14 + 3833))
      goto LABEL_18;
    goto LABEL_15;
  }
  v20 = 0;
  v21 = (char *)(a1 + 1476);
  v22 = __src;
  do
  {
    memcpy(v21, v22, 0x200uLL);
    *(float *)(a1 + 34756 + 4 * v20++) = (float)v22[7] / 1000.0;
    v22 += 128;
    v21 += 512;
  }
  while (v20 < __src[1920]);
  if (*((_DWORD *)v14 + 3833))
  {
LABEL_15:
    v23 = 0;
    v24 = (unsigned int *)v14;
    do
    {
      v25 = (v20 + v23);
      memcpy((void *)(a1 + (v25 << 9) + 1476), v24 - 7, 0x200uLL);
      *(float *)(a1 + 4 * v25 + 34756) = (float)*v24 / 1000.0;
      ++v23;
      v24 += 128;
    }
    while (v23 < *((unsigned int *)v14 + 3833));
    LODWORD(v20) = v20 + v23;
  }
LABEL_18:
  v26 = v112;
  v27 = (float *)(v112 + 25863);
  v114 = v112 + 12932;
  if (__src[12732])
  {
    v28 = 0;
    v29 = __src + 10179;
    do
    {
      v30 = (v20 + v28);
      memcpy((void *)(a1 + (v30 << 9) + 1476), v29 - 7, 0x200uLL);
      *(float *)(a1 + 4 * v30 + 34756) = (float)*v29 / 1000.0;
      ++v28;
      v29 += 128;
    }
    while (v28 < *((unsigned int *)v19 + 2553));
    LODWORD(v20) = v20 + v28;
    v26 = v112;
    v27 = (float *)(v112 + 25863);
  }
  if (*(_BYTE *)(a1 + 1472) && (_DWORD)v20)
  {
    v31 = v20;
    v32 = *v114;
    v33 = *((_DWORD *)v27 + 3901);
    v34 = v33 + *v114;
    v35 = *((float *)v26 + 5);
    v36 = *((float *)v26 + 6);
    v37 = *((float *)v26 + 7);
    v38 = *((float *)v26 + 8);
    v39 = v35 + v37;
    v40 = v36 + v38;
    v41 = v37 * v38;
    v42 = v27[4];
    v43 = v27[5];
    v44 = v27[6];
    v45 = v27[7];
    v46 = v42 + v44;
    v47 = v43 + v45;
    v48 = (float *)(a1 + 1484);
    v49 = v44 * v45;
    do
    {
      v51 = *(unsigned int *)v48;
      v52 = a1 + 4 * v51;
      v53 = *(float *)(v52 + 312);
      v54 = *(float *)(v52 + 476);
      v56 = v48[3];
      v55 = v48[4];
      v57 = v56 * v55;
      v58 = (float)(v56 * v55) / (float)((float)(a3 * v115) + 0.0001);
      switch((int)v51)
      {
        case 0:
          if (*((_BYTE *)v48 + 92))
          {
            v60 = v32 == 1 && v26[4] == 1;
            v62 = v33 == 1 && *((_DWORD *)v27 + 3) == 1;
            v63 = 0.0;
            if (v60)
            {
              v64 = v48[1];
              if (v39 > v64)
              {
                v65 = v48[2];
                if (v40 > v65)
                {
                  v66 = v65 + v55;
                  if ((float)(v64 + v56) > v35 && v66 > v36)
                    v63 = (float)(fmaxf(fminf(v39, v64 + v56) - fmaxf(v35, v64), 0.0)
                                * fmaxf(fminf(v40, v66) - fmaxf(v36, v65), 0.0))
                        / fmaxf(fminf(v41, v57), 0.00001);
                }
              }
            }
            if (v62)
            {
              v68 = v48[1];
              v63 = 0.0;
              if (v46 > v68)
              {
                v69 = v48[2];
                if (v47 > v69)
                {
                  v70 = v68 + v56;
                  v71 = v69 + v55;
                  if (v70 > v42 && v71 > v43)
                    v63 = (float)(fmaxf(fminf(v46, v70) - fmaxf(v42, v68), 0.0)
                                * fmaxf(fminf(v47, v71) - fmaxf(v43, v69), 0.0))
                        / fmaxf(fminf(v49, v57), 0.00001);
                }
              }
            }
            if (!(v32 | *((_DWORD *)v27 + 3901)) || v62 + v60 == 1 && v34 == 1 && v63 > 0.9)
            {
              v54 = *(float *)(a1 + 568);
            }
            else if (v58 < 0.005)
            {
              v54 = 0.5;
            }
          }
          else
          {
            v53 = *(float *)(a1 + 304);
            v54 = *(float *)(a1 + 472);
          }
          break;
        case 1:
          v74 = v32 == 1 && v26[4] == 0;
          v76 = v33 == 1 && *((_DWORD *)v27 + 3) == 0;
          v77 = 0.0;
          if (v74)
          {
            v78 = v48[1];
            if (v39 > v78)
            {
              v79 = v48[2];
              if (v40 > v79)
              {
                v80 = v79 + v55;
                if ((float)(v78 + v56) > v35 && v80 > v36)
                  v77 = (float)(fmaxf(fminf(v39, v78 + v56) - fmaxf(v35, v78), 0.0)
                              * fmaxf(fminf(v40, v80) - fmaxf(v36, v79), 0.0))
                      / fmaxf(fminf(v41, v57), 0.00001);
              }
            }
          }
          if (v76)
          {
            v82 = v48[1];
            v77 = 0.0;
            if (v46 > v82)
            {
              v83 = v48[2];
              if (v47 > v83)
              {
                v84 = v82 + v56;
                v85 = v83 + v55;
                if (v84 > v42 && v85 > v43)
                  v77 = (float)(fmaxf(fminf(v46, v84) - fmaxf(v42, v82), 0.0)
                              * fmaxf(fminf(v47, v85) - fmaxf(v43, v83), 0.0))
                      / fmaxf(fminf(v49, v57), 0.00001);
              }
            }
          }
          if (v32 | *((_DWORD *)v27 + 3901))
          {
            if (v76 + v74 == 1 && v34 == 1 && v77 > 0.9)
            {
              v54 = 0.516;
            }
            else if (v58 < 0.01)
            {
              v54 = *(float *)(a1 + 564);
              v53 = *(float *)(a1 + 744);
            }
          }
          else
          {
            v54 = 0.54;
          }
          break;
        case 3:
        case 5:
          if (v58 > 0.01)
            v53 = *(float *)(v52 + 476);
          break;
        case 8:
          v87 = v56 / v55;
          v89 = v58 >= 0.002 && v87 > 0.9 && v87 < 1.1;
          v53 = *(float *)(v52 + 476);
          if (!v89)
          {
            v54 = *(float *)(a1 + 560);
            v53 = *(float *)(a1 + 412);
          }
          break;
        default:
          break;
      }
      v90 = (float)*((unsigned int *)v48 + 5) / 1000.0;
      if (v90 <= v53)
      {
        v50 = v90 > v54;
      }
      else
      {
        v50 = (int)(float)((float)((float)((float)(v90 - v53) / (float)(1.0 - v53)) * 1000.0) + 0.5);
        if (v50 >= 1000)
          v50 = 1000;
        if (v50 <= 2)
          v50 = 2;
      }
      *((_DWORD *)v48 + 5) = v50;
      v48 += 128;
      --v31;
    }
    while (v31);
  }
  if ((_DWORD)v20)
  {
    v91 = 0;
    v92 = v20;
    v93 = (_DWORD *)(a1 + 34756);
    v94 = (_DWORD *)(a1 + 1476);
    v95 = v20;
    do
    {
      if (v94[2] == 9)
      {
        memcpy((void *)(a1 + ((unint64_t)v91 << 9) + 35016), v94, 0x200uLL);
        *(_DWORD *)(a1 + 4 * v91++ + 68296) = *v93;
      }
      ++v93;
      v94 += 128;
      --v95;
    }
    while (v95);
    v96 = 0;
    v97 = (_DWORD *)(a1 + 34756);
    v98 = (_DWORD *)(a1 + 1476);
    v20 = v20;
    do
    {
      if ((v98[2] & 0xFFFFFFFE) == 0xA)
      {
        memcpy((void *)(a1 + ((unint64_t)v96 << 9) + 68556), v98, 0x200uLL);
        *(_DWORD *)(a1 + 4 * v96++ + 101836) = *v97;
      }
      ++v97;
      v98 += 128;
      --v20;
    }
    while (v20);
    v99 = 0;
    v100 = (_DWORD *)(a1 + 34756);
    v101 = (int *)(a1 + 1476);
    do
    {
      if (v101[2] <= 8)
      {
        memcpy((void *)(a1 + ((unint64_t)v99 << 9) + 1476), v101, 0x200uLL);
        *(_DWORD *)(a1 + 4 * v99++ + 34756) = *v100;
      }
      ++v100;
      v101 += 128;
      --v92;
    }
    while (v92);
  }
  else
  {
    v96 = 0;
    v91 = 0;
    v99 = 0;
  }
  v117 = 0;
  v112[25863] = acTrkFullBodyAssocTrkDet(v115, v116, v113, (uint64_t)(v26 + 12933), v112[25863], *(_DWORD *)(a1 + 276), a1 + 35016, v91, a1 + 32, a1 + 444, a1 + 572, v118, &v117, v26 + 50589, (char *)v26 + 119060, v26 + 33665, (float *)(a1 + 68296), v110, a1 + 1476,
                  v99,
                  *(void **)a1);
  v117 = 0;
  v26[46596] = acTrkHandAssocTrkDet(v115, v116, (uint64_t)(v26 + 33666), v26[46596], *(_DWORD *)(a1 + 276), a1 + 68556, v96, a1 + 32, a1 + 444, v118, &v117, v26 + 50589, (char *)v26 + 186388, v26 + 50497, (float *)(a1 + 101836), v108, v109, v111, *(void **)a1);
  v117 = 0;
  v102 = acTrkObjectAssocTrkDet(v115, v116, v26 + 2, *v114, *(_DWORD *)(a1 + 276), a1 + 1476, v99, a1 + 32, a1 + 444, v118, &v117, v26 + 50589, (char *)v26 + 103456, v26 + 29764, (float *)(a1 + 34756), (uint64_t)&AcAssoNode::m_kFacePoseRollCenters, *(void **)a1);
  *v114 = v102;
  if (!v102)
    goto LABEL_142;
  if (v102 == 1)
  {
    v103 = 0;
  }
  else
  {
    v103 = v102 & 0xFFFFFFFE;
    v104 = v26;
    v105 = v103;
    do
    {
      v104[134] = 0;
      v104[565] = 0;
      v104 += 862;
      v105 -= 2;
    }
    while (v105);
    if (v103 == v102)
      goto LABEL_142;
  }
  v106 = v102 - v103;
  v107 = &v26[431 * v103 + 134];
  do
  {
    *v107 = 0;
    v107 += 431;
    --v106;
  }
  while (v106);
LABEL_142:
  result = 0;
  v26[1] = 467401;
  return result;
}

uint64_t AcAssoNode::associationPostProc(uint64_t a1, int a2, int a3, int a4, __int128 *a5, uint64_t a6, uint64_t a7, uint64_t a8, float a9, float a10, float a11, float a12)
{
  int *v13;
  _DWORD *v22;
  unsigned int *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t result;
  unint64_t v30;
  uint64_t v31;
  unsigned int v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unsigned int v36;
  int v37;
  unint64_t v38;
  unint64_t v39;
  unsigned int v40;
  _DWORD *v41;
  uint64_t v42;
  uint64_t v44;
  unsigned int v45;
  unsigned int *v46;
  unsigned int v47;
  unsigned int *v48;
  unsigned int v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _DWORD *v54;
  uint64_t v55;
  int *v56;
  int v57;
  int *v58;
  int *v59;
  uint64_t v60;
  uint64_t v61;
  float32x2_t v62;
  uint64_t v63;
  unsigned int *v64;
  uint64_t v65;
  unsigned int v66;
  unint64_t v67;
  float *v68;
  uint64_t v69;
  _BOOL4 v70;
  uint64_t v71;
  float32x2_t v72;
  uint64_t v73;
  unsigned int v74;
  int v75;
  uint64_t v76;
  int *v77;
  int v78;
  uint64_t v79;
  __int128 v80;
  float32x2_t v81;
  int8x8_t v82;
  unint64_t v83;
  float32x2_t v84;
  unint64_t v85;
  uint64_t v86;
  unint64_t v87;
  float v88;
  int v89;
  uint64_t v90;
  __int128 v91;
  float32x2_t v92;
  int8x8_t v93;
  BOOL v94;
  float v95;
  float v96;
  int v97;
  unint64_t v98;
  unint64_t v99;
  unint64_t v100;
  uint64_t v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  unint64_t v107;
  unint64_t v108;
  _DWORD *v109;
  unint64_t v110;
  __int128 v111;
  _DWORD *v112;
  __int128 v113;
  _DWORD *v114;
  __int128 v115;
  _DWORD *v116;
  __int128 v117;
  _DWORD *v118;
  __int128 v119;
  unsigned int v120;
  unsigned int v121;
  unsigned int v122;
  unsigned int v123;
  uint64_t v124;
  uint64_t v125;
  float v126;
  _OWORD *v127;
  int v128;
  int v129;
  unsigned int v130;
  __int128 v131;
  uint64_t v132;
  int *v133;
  uint64_t v134;
  unsigned int v135;
  float v136;
  uint64_t v137;
  __int128 v138;
  float32x2_t v139;
  int8x8_t v140;
  unsigned int v141;
  int v142;
  _DWORD *v143;
  float *v144;
  _BOOL4 v145;
  float v146;
  _BOOL4 v147;
  float v148;
  unsigned int v149;
  int v150;
  unsigned int v151;
  uint64_t v152;
  void *v153;
  uint64_t v154;
  _BYTE *v155;
  _QWORD *v156;
  unsigned int v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  int v161;
  unsigned int v162;
  unsigned int v163;
  _BOOL4 v164;
  unsigned int *v165;
  uint64_t v166;
  uint64_t v168;
  uint32x2_t v169;
  _BOOL4 v170;
  unsigned int *v171;
  unsigned int *v173;
  unsigned int v174;
  unsigned int *v175;
  int __dst[406];
  __int128 v177;
  uint64_t v178;
  __int128 v179;
  uint64_t v180;
  unsigned int v181[5];

  if (*(_DWORD *)a6 != 1)
    return 4294967289;
  if (*(_DWORD *)(a6 + 4) != 467401)
    return 4294967292;
  v13 = (int *)(a6 + 51728);
  if (*(_DWORD *)(a6 + 51728) != a4)
    return 4294967292;
  v22 = (_DWORD *)(a6 + 186384);
  v23 = (unsigned int *)(a6 + 103452);
  if (*(_BYTE *)(a1 + 672))
    *v23 = acTrkFullBodyRemoveYoungOverlapObjects(a6 + 51732, *v23, *(float *)(a1 + 676));
  v168 = a7;
  if (*(_BYTE *)(a1 + 724))
    *v22 = acTrkHandRemoveYoungOverlapObjects(a6 + 134664, *v22, *(_DWORD *)(a1 + 736), *(_DWORD *)(a1 + 732), *(float *)(a1 + 728), *(float *)(a1 + 740));
  v171 = (unsigned int *)(a6 + 186384);
  v24 = a6 + 8;
  v169 = (uint32x2_t)__PAIR64__(a3, a2);
  largeFaceSuppressSameSizeUBody(a6 + 8, *v13, a3, a2, a1 + 102336, (int *)(a1 + 102456));
  v175 = (unsigned int *)(a6 + 51728);
  v25 = *v13;
  if ((_DWORD)v25)
  {
    v26 = 0;
    v27 = 0;
    v28 = a6;
    do
    {
      if (*(int *)(v28 + 536) <= 1)
      {
        if (v26 != v27)
          memcpy((void *)(v24 + 1724 * v27), (const void *)(v28 + 8), 0x6BCuLL);
        ++v27;
      }
      v28 += 1724;
      ++v26;
    }
    while (v25 != v26);
  }
  else
  {
    v27 = 0;
  }
  *v175 = v27;
  v181[0] = 0;
  acTrkFilterMultiUbodyinSameFbody((float *)(a6 + 8), v175, a6 + 51732, *v23, (float *)(a1 + 184), (_DWORD *)(a1 + 102216), v181, a1 + 1232);
  v30 = *v175;
  if ((_DWORD)v30)
  {
    v31 = 0;
    v32 = 0;
    v33 = a6;
    do
    {
      if (*(int *)(v33 + 536) <= 1)
      {
        if (v31 != v32)
          memcpy((void *)(v24 + 1724 * v32), (const void *)(v33 + 8), 0x6BCuLL);
        ++v32;
      }
      v33 += 1724;
      ++v31;
    }
    while (v30 != v31);
  }
  else
  {
    v32 = 0;
  }
  if (v32 != (_DWORD)v30)
    return 4294967289;
  v34 = acTrkObjectRemoveOldOverlapObjects(a6 + 8, v30, (int *)(a1 + 102096), *(float *)(a1 + 292));
  v35 = acTrkObjectRemoveYoungOverlapObjects(a6 + 8, v34, (char *)(a1 + 102096), *(float *)(a1 + 292));
  v36 = acTrkObjectRemoveOldCrossClassOverlapObjects(a6 + 8, v35, *(float *)(a1 + 296));
  *v175 = v36;
  v165 = v23;
  *v171 = acTrkFilterFPHandinSameFbody(a6 + 8, v36, v37, *v23, (char *)(a6 + 134664), 0.1, *v171);
  v38 = *v175;
  if ((_DWORD)v38)
  {
    v39 = 0;
    v40 = 0;
    v41 = (_DWORD *)(a6 + 16);
    v42 = a8;
    do
    {
      if (*v41 <= 4u && ((1 << *v41) & 0x16) != 0)
      {
        v44 = a1 + 4 * v40++;
        *(_DWORD *)(v44 + 1112) = *(v41 - 2);
        v38 = *v175;
      }
      ++v39;
      v41 += 431;
    }
    while (v39 < v38);
  }
  else
  {
    v40 = 0;
    v42 = a8;
  }
  v45 = 0;
  *(_QWORD *)(a1 + 752) = -1;
  v46 = (unsigned int *)(v42 + 16464);
  *(_DWORD *)(a1 + 760) = 0;
  *(_QWORD *)(a1 + 764) = -1;
  *(_DWORD *)(a1 + 772) = 0;
  *(_QWORD *)(a1 + 776) = -1;
  *(_DWORD *)(a1 + 784) = 0;
  *(_QWORD *)(a1 + 788) = -1;
  *(_DWORD *)(a1 + 796) = 0;
  *(_QWORD *)(a1 + 800) = -1;
  *(_DWORD *)(a1 + 808) = 0;
  *(_QWORD *)(a1 + 812) = -1;
  *(_DWORD *)(a1 + 820) = 0;
  *(_QWORD *)(a1 + 824) = -1;
  *(_DWORD *)(a1 + 832) = 0;
  *(_QWORD *)(a1 + 836) = -1;
  *(_DWORD *)(a1 + 844) = 0;
  *(_QWORD *)(a1 + 848) = -1;
  *(_DWORD *)(a1 + 856) = 0;
  *(_QWORD *)(a1 + 860) = -1;
  *(_DWORD *)(a1 + 868) = 0;
  *(_QWORD *)(a1 + 872) = -1;
  *(_DWORD *)(a1 + 880) = 0;
  *(_QWORD *)(a1 + 884) = -1;
  *(_DWORD *)(a1 + 892) = 0;
  *(_QWORD *)(a1 + 896) = -1;
  *(_DWORD *)(a1 + 904) = 0;
  *(_QWORD *)(a1 + 908) = -1;
  *(_DWORD *)(a1 + 916) = 0;
  *(_QWORD *)(a1 + 920) = -1;
  *(_DWORD *)(a1 + 928) = 0;
  *(_QWORD *)(a1 + 932) = -1;
  *(_DWORD *)(a1 + 940) = 0;
  *(_QWORD *)(a1 + 944) = -1;
  *(_DWORD *)(a1 + 952) = 0;
  *(_QWORD *)(a1 + 956) = -1;
  *(_DWORD *)(a1 + 964) = 0;
  *(_QWORD *)(a1 + 968) = -1;
  *(_DWORD *)(a1 + 976) = 0;
  *(_QWORD *)(a1 + 980) = -1;
  *(_DWORD *)(a1 + 988) = 0;
  *(_QWORD *)(a1 + 992) = -1;
  *(_DWORD *)(a1 + 1000) = 0;
  *(_QWORD *)(a1 + 1004) = -1;
  *(_DWORD *)(a1 + 1012) = 0;
  *(_QWORD *)(a1 + 1016) = -1;
  *(_DWORD *)(a1 + 1024) = 0;
  *(_QWORD *)(a1 + 1028) = -1;
  *(_DWORD *)(a1 + 1036) = 0;
  *(_QWORD *)(a1 + 1040) = -1;
  *(_DWORD *)(a1 + 1048) = 0;
  *(_QWORD *)(a1 + 1052) = -1;
  *(_DWORD *)(a1 + 1060) = 0;
  *(_QWORD *)(a1 + 1064) = -1;
  *(_DWORD *)(a1 + 1072) = 0;
  *(_QWORD *)(a1 + 1076) = -1;
  *(_DWORD *)(a1 + 1084) = 0;
  *(_QWORD *)(a1 + 1088) = -1;
  *(_DWORD *)(a1 + 1096) = 0;
  *(_QWORD *)(a1 + 1100) = -1;
  *(_DWORD *)(a1 + 1108) = 0;
  v47 = *(_DWORD *)(a1 + 276);
  v48 = (unsigned int *)(a6 + 202352);
  v49 = *(_DWORD *)(a6 + 202352);
  if (v47 < v49)
    v49 = *(_DWORD *)(a1 + 276);
  *(_DWORD *)(a6 + 202352) = v49;
  if (v49)
  {
    v50 = a6 + 51732;
    if (v40)
    {
      v51 = 0;
      v45 = 0;
      do
      {
        if (v45 < v47)
        {
          v54 = (_DWORD *)(a6 + 12 * v51 + 201992);
          v55 = v40;
          v56 = (int *)(a1 + 1112);
          while (1)
          {
            v57 = *v56++;
            if (*v54 == v57)
              break;
            if (!--v55)
              goto LABEL_42;
          }
          v52 = a1 + 12 * v45++;
          v53 = *(_QWORD *)v54;
          *(_DWORD *)(v52 + 760) = *(_DWORD *)(a6 + 12 * v51 + 202000);
          *(_QWORD *)(v52 + 752) = v53;
          v49 = *v48;
        }
LABEL_42:
        ++v51;
      }
      while (v51 < v49);
    }
  }
  else
  {
    v50 = a6 + 51732;
  }
  v173 = v46;
  memcpy((void *)(a6 + 201992), (const void *)(a1 + 752), 0x168uLL);
  *(_DWORD *)(a6 + 202352) = v45;
  v58 = (int *)(a6 + 51728);
  acTrkGroupAssign(a6 + 8, *v175, a6 + 8, *v175, 0, 1, a1 + 256, (_DWORD *)(a6 + 202360), (int *)(a6 + 201992), v48, *(void **)a1);
  acTrkGroupAssign(a6 + 8, *v58, a6 + 8, *v58, 3, 2, a1 + 256, (_DWORD *)(a6 + 202360), (int *)(a6 + 201992), v48, *(void **)a1);
  acTrkGroupAssign(a6 + 8, *v58, a6 + 8, *v58, 5, 4, a1 + 256, (_DWORD *)(a6 + 202360), (int *)(a6 + 201992), v48, *(void **)a1);
  v59 = AcAssoNode::procLearnedGroupID(a1, (_DWORD *)a6);
  acLGroupIDDominanPersonPatch((uint64_t)v59, v60, v50, *v23, a6 + 134664, *v171);
  v170 = *(_DWORD *)(a6 + 202364) != 0;
  if (v36)
  {
    v61 = 0;
    v174 = 0;
    v62 = vcvt_f32_u32(v169);
    v63 = 1724 * v36;
    v65 = a8;
    v64 = v173;
    v166 = v63;
    while (1)
    {
      v122 = *(_DWORD *)(v65 + 220);
      if (v122 > 9)
        goto LABEL_52;
      v123 = *v64;
      if (*v64 >= 0x14)
        goto LABEL_52;
      v124 = a6 + v61;
      v125 = *(unsigned int *)(a6 + v61 + 16);
      v126 = *(float *)(a1 + 4 * v125 + 476);
      if (!(_DWORD)v125 && !*(_BYTE *)(v124 + 108))
        v126 = *(float *)(a1 + 472);
      v127 = (_OWORD *)(v124 + 8);
      v128 = (int)(float)((float)((float)((float)(*(float *)(v124 + 532) - v126) / (float)(1.0 - v126)) * 1000.0) + 0.5) >= 1000
           ? 1000
           : (int)(float)((float)((float)((float)(*(float *)(v124 + 532) - v126) / (float)(1.0 - v126)) * 1000.0) + 0.5);
      v129 = v128 <= 1 ? 1 : v128;
      if (!*(_BYTE *)(a1 + 409))
        break;
      if (v125 < 9 && ((0x13Fu >> v125) & 1) != 0)
      {
        v130 = dword_2359151EC[v125];
      }
      else if ((v125 & 0xFFFFFFFE) == 0xA)
      {
        v130 = 6;
      }
      else
      {
        v130 = 5;
      }
      v134 = a6 + v61;
      v135 = *(_DWORD *)(a6 + v61 + 520);
      if (v135 <= *(_DWORD *)(a1 + 4 * v130 + 416))
      {
        if ((_DWORD)v125)
        {
          v58 = (int *)(a6 + 51728);
          if ((_DWORD)v125 == 1)
          {
            __dst[0] = 0;
            v179 = *a5;
            v180 = *((_QWORD *)a5 + 2);
            mapBoxCenterToFeatMap((float *)(a6 + v61 + 20), (uint64_t *)&v179, 2, v169.u32[1], v169.u32[0], __dst);
            v63 = v166;
            v65 = a8;
            v64 = v173;
            v136 = 0.05;
            if (v135 < 4)
              v136 = 0.009;
            if (v135 >= 3 && *(float *)__dst <= v136)
              goto LABEL_114;
          }
          v137 = v65 + 36 * v123;
          v138 = v127[1];
          *(_OWORD *)(v137 + 16468) = *v127;
          *(_OWORD *)(v137 + 16484) = v138;
          *(_DWORD *)(v137 + 16496) = v129;
          *(_DWORD *)(v137 + 16500) = v170;
          *v64 = v123 + 1;
          v139 = *(float32x2_t *)(a6 + v61 + 20);
          v140 = (int8x8_t)vcltz_f32(v139);
          *(float32x2_t *)&v138 = vsub_f32(vsub_f32(*(float32x2_t *)(a6 + v61 + 28), (float32x2_t)vand_s8((int8x8_t)vabs_f32(v139), v140)), vmaxnm_f32(vsub_f32(vadd_f32(v139, *(float32x2_t *)(a6 + v61 + 28)), v62), 0));
          *(int8x8_t *)(v137 + 16480) = vbic_s8((int8x8_t)v139, v140);
          *(_QWORD *)(v137 + 16488) = v138;
          goto LABEL_147;
        }
        v144 = (float *)(a6 + v61);
        v145 = *(_BYTE *)(a6 + v61 + 108) == 0;
        __dst[0] = 0;
        v177 = *a5;
        v178 = *((_QWORD *)a5 + 2);
        mapBoxCenterToFeatMap((float *)(a6 + v61 + 20), (uint64_t *)&v177, v145, v169.u32[1], v169.u32[0], __dst);
        if (*(float *)__dst < 0.009 && v135)
          goto LABEL_169;
        v146 = v144[5];
        v147 = 1;
        if (v146 >= 0.0)
        {
          v148 = v144[6];
          if (v148 >= 0.0)
          {
            v147 = (float)((float)(v148 + v144[8]) - (float)v169.u32[1]) > 0.0;
            if ((float)((float)(v146 + *(float *)(a6 + v61 + 28)) - (float)v169.u32[0]) > 0.0)
              v147 = 1;
          }
        }
        v164 = v147;
        v149 = *(_DWORD *)(a6 + v61 + 452);
        v150 = *(unsigned __int8 *)(a6 + v61 + 396);
        bzero(&__dst[111], 0x498uLL);
        memcpy(__dst, v127, 0x1BCuLL);
        if (v150)
        {
          if (v149 >= 0xE)
            v151 = 14;
          else
            v151 = v149;
          memcpy(&__dst[111], (const void *)(v168 + 1176 * v151 + 7684), 0x498uLL);
        }
        v152 = a8 + 1624 * v122;
        v153 = memcpy((void *)(v152 + 224), __dst, 0x654uLL);
        *(_DWORD *)(v152 + 252) = v129;
        *(_BYTE *)(v152 + 348) = 0;
        if (v164 && (v154 = a6 + v61, *(_BYTE *)(a6 + v61 + 108)))
        {
          v155 = (_BYTE *)(v152 + 348);
          v156 = (_QWORD *)(v154 + 860);
          v157 = *(_DWORD *)(v154 + 860);
          if (v128 > 1)
          {
            v158 = a8;
            if (v157 < 3 || (v163 = *(_DWORD *)(a6 + v61 + 864), v163 > 2))
            {
              *v156 = 0;
            }
            else
            {
              *v155 = 1;
              *(_DWORD *)(a6 + v61 + 864) = v163 + 1;
            }
          }
          else
          {
            v158 = a8;
            if (v157 >= 2)
              *v155 = 1;
            *(_DWORD *)v156 = v157 + 1;
            *(_DWORD *)(a6 + v61 + 864) = 0;
          }
        }
        else
        {
          *(_QWORD *)(a6 + v61 + 860) = 0;
          v158 = a8;
        }
        v159 = v158 + 1624 * v122;
        *(_DWORD *)(v159 + 1844) = v170;
        *(_DWORD *)(v159 + 328) = *(_DWORD *)(v134 + 520);
        v160 = a6 + v61;
        v161 = *(_DWORD *)(a6 + v61 + 788);
        v94 = v161 != 0;
        v162 = v161 - 1;
        if (!v94)
          v162 = 0;
        *(_OWORD *)(v159 + 332) = *(_OWORD *)(v160 + 40 * v162 + 540);
        AcAssoNode::filterANSTBboxforBESCrop(a9, a10, a11, a12, (uint64_t)v153, (uint64_t)v127, v169.u32[1], v169.u32[0]);
        if (*(_BYTE *)(v160 + 868))
        {
LABEL_169:
          v58 = (int *)(a6 + 51728);
          v65 = a8;
          v64 = v173;
          v63 = v166;
          goto LABEL_114;
        }
        v64 = v173;
        v63 = v166;
        if (*(_BYTE *)(v160 + 869))
        {
          v58 = (int *)(a6 + 51728);
          v65 = a8;
          goto LABEL_114;
        }
        v65 = a8;
        if (!*(_BYTE *)(a6 + v61 + 871)
          && !*(_BYTE *)(a6 + v61 + 870)
          && (!v164 || !*(_DWORD *)(v134 + 520) || *(float *)(a6 + v61 + 840) >= 0.2))
        {
          ++*(_DWORD *)(a8 + 220);
          v58 = (int *)(a6 + 51728);
LABEL_147:
          ++v174;
          goto LABEL_114;
        }
      }
      v58 = (int *)(a6 + 51728);
LABEL_114:
      v61 += 1724;
      if (v63 == v61)
        goto LABEL_52;
    }
    if ((_DWORD)v125)
    {
      v131 = *(_OWORD *)(v124 + 24);
      v132 = v65 + 36 * v123;
      *(_OWORD *)(v132 + 16468) = *v127;
      *(_OWORD *)(v132 + 16484) = v131;
      *(_DWORD *)(v132 + 16500) = v170;
      *v64 = v123 + 1;
      v133 = (int *)(v132 + 16496);
    }
    else
    {
      v141 = *(_DWORD *)(a6 + v61 + 452);
      v142 = *(unsigned __int8 *)(a6 + v61 + 396);
      bzero(&__dst[111], 0x498uLL);
      memcpy(__dst, v127, 0x1BCuLL);
      if (v142)
        memcpy(&__dst[111], (const void *)(v168 + 1176 * v141 + 7684), 0x498uLL);
      v143 = (_DWORD *)(a8 + 1624 * v122);
      memcpy(v143 + 56, __dst, 0x654uLL);
      v65 = a8;
      v143[461] = v170;
      *(_DWORD *)(a8 + 220) = v122 + 1;
      v133 = v143 + 63;
      v64 = v173;
      v63 = v166;
    }
    *v133 = v129;
    goto LABEL_147;
  }
  v174 = 0;
  v65 = a8;
  v64 = v173;
LABEL_52:
  v66 = v174;
  if (v174 > 0x1D)
  {
    v68 = (float *)(a6 + 186384);
    v69 = v168;
    v70 = v170;
  }
  else
  {
    v67 = *v165;
    v68 = (float *)(a6 + 186384);
    v69 = v168;
    v70 = v170;
    if (*v165)
    {
      v71 = 0;
      v72 = vcvt_f32_u32(v169);
      v73 = v181[0];
      v74 = *v64;
      while (1)
      {
        if (v74 > 0x13)
          goto LABEL_73;
        v75 = (int)(float)((float)((float)((float)(*(float *)(a6 + 1724 * v71 + 52256) - *(float *)(a1 + 512))
                                         / (float)(1.0 - *(float *)(a1 + 512)))
                                 * 1000.0)
                         + 0.5);
        if (v75 >= 1000)
          v75 = 1000;
        if (v75 <= 1)
          v75 = 1;
        if (*(_DWORD *)(a6 + 1724 * v71 + 52244))
          goto LABEL_67;
        if (!*(_BYTE *)(a1 + 410))
          goto LABEL_66;
        v76 = v73;
        v77 = (int *)(a1 + 102216);
        if ((_DWORD)v73)
          break;
LABEL_65:
        if (*(float *)(a6 + 1724 * v71 + 52564) > 0.015)
          goto LABEL_66;
        v64 = v173;
        if (v66 > 0x1D)
          goto LABEL_73;
LABEL_68:
        if (++v71 >= v67)
          goto LABEL_73;
      }
      while (1)
      {
        v78 = *v77++;
        if (v71 == v78)
          break;
        if (!--v76)
          goto LABEL_65;
      }
LABEL_66:
      v79 = v65 + 36 * v74;
      v80 = *(_OWORD *)(a6 + 1724 * v71 + 51748);
      *(_OWORD *)(v79 + 16468) = *(_OWORD *)(a6 + 1724 * v71 + 51732);
      *(_OWORD *)(v79 + 16484) = v80;
      *(_DWORD *)(v79 + 16496) = v75;
      *(_DWORD *)(v79 + 16500) = v170;
      ++v74;
      v64 = v173;
      *v173 = v74;
      v81 = *(float32x2_t *)(a6 + 1724 * v71 + 51744);
      v82 = (int8x8_t)vcltz_f32(v81);
      *(float32x2_t *)&v80 = vsub_f32(vsub_f32(*(float32x2_t *)(a6 + 1724 * v71 + 51752), (float32x2_t)vand_s8((int8x8_t)vabs_f32(v81), v82)), vmaxnm_f32(vsub_f32(vadd_f32(v81, *(float32x2_t *)(a6 + 1724 * v71 + 51752)), v72), 0));
      *(int8x8_t *)(v79 + 16480) = vbic_s8((int8x8_t)v81, v82);
      *(_QWORD *)(v79 + 16488) = v80;
      ++v66;
      v67 = *v165;
LABEL_67:
      if (v66 > 0x1D)
        goto LABEL_73;
      goto LABEL_68;
    }
  }
LABEL_73:
  if (v66 <= 0x31)
  {
    v83 = *(unsigned int *)v68;
    if (*(_DWORD *)v68)
    {
      v84 = vcvt_f32_u32(v169);
      v85 = *v64;
      v86 = a6 + 134664;
      v87 = 1;
      do
      {
        if (v85 > 0x27)
          break;
        if (!*(_DWORD *)(v86 + 512))
        {
          v88 = *(float *)(a1 + 4 * *(unsigned int *)(v86 + 8) + 476);
          v89 = (int)(float)((float)((float)((float)(*(float *)(v86 + 524) - v88) / (float)(1.0 - v88)) * 1000.0) + 0.5);
          if (v89 >= 1000)
            v89 = 1000;
          if (v89 <= 1)
            v89 = 1;
          v90 = v65 + 36 * v85;
          v91 = *(_OWORD *)(v86 + 16);
          *(_OWORD *)(v90 + 16468) = *(_OWORD *)v86;
          *(_OWORD *)(v90 + 16484) = v91;
          *(_DWORD *)(v90 + 16496) = v89;
          *(_DWORD *)(v90 + 16500) = v70;
          *v64 = ++v85;
          v92 = *(float32x2_t *)(v86 + 12);
          v93 = (int8x8_t)vcltz_f32(v92);
          *(float32x2_t *)&v91 = vsub_f32(vsub_f32(*(float32x2_t *)(v86 + 20), (float32x2_t)vand_s8((int8x8_t)vabs_f32(v92), v93)), vmaxnm_f32(vsub_f32(vadd_f32(v92, *(float32x2_t *)(v86 + 20)), v84), 0));
          *(int8x8_t *)(v90 + 16480) = vbic_s8((int8x8_t)v92, v93);
          *(_QWORD *)(v90 + 16488) = v91;
          ++v66;
          v83 = *(unsigned int *)v68;
        }
        if (v66 > 0x31)
          break;
        v86 += 1724;
        v94 = v87++ >= v83;
      }
      while (!v94);
    }
  }
  v95 = v68[3998];
  v96 = *(float *)(v69 + 50932);
  if (v95 > -1.0)
    v96 = (float)(v95 * 0.9) + (float)(v96 * 0.1);
  v68[3998] = v96;
  if (v96 >= 0.5)
  {
    v97 = (int)(float)((float)((float)((float)(v96 + -0.5) + (float)(v96 + -0.5)) * 1000.0) + 0.5);
    if (v97 >= 1000)
      v97 = 1000;
    if (v97 <= 1)
      v97 = 1;
  }
  else
  {
    v97 = 1;
  }
  v64[361] = v97;
  v98 = *v58;
  if ((_DWORD)v98)
  {
    v99 = 0;
    v100 = *v58;
    v101 = a6 + 540;
    do
    {
      if (*(_DWORD *)(v101 + 248) >= 6u)
      {
        v102 = *(_OWORD *)(v101 + 56);
        *(_OWORD *)v101 = *(_OWORD *)(v101 + 40);
        *(_OWORD *)(v101 + 16) = v102;
        *(_QWORD *)(v101 + 32) = *(_QWORD *)(v101 + 72);
        v103 = *(_OWORD *)(v101 + 96);
        *(_OWORD *)(v101 + 40) = *(_OWORD *)(v101 + 80);
        *(_OWORD *)(v101 + 56) = v103;
        *(_QWORD *)(v101 + 72) = *(_QWORD *)(v101 + 112);
        v104 = *(_OWORD *)(v101 + 136);
        *(_OWORD *)(v101 + 80) = *(_OWORD *)(v101 + 120);
        *(_OWORD *)(v101 + 96) = v104;
        *(_QWORD *)(v101 + 112) = *(_QWORD *)(v101 + 152);
        v105 = *(_OWORD *)(v101 + 176);
        *(_OWORD *)(v101 + 120) = *(_OWORD *)(v101 + 160);
        *(_OWORD *)(v101 + 136) = v105;
        *(_QWORD *)(v101 + 152) = *(_QWORD *)(v101 + 192);
        v106 = *(_OWORD *)(v101 + 216);
        *(_OWORD *)(v101 + 160) = *(_OWORD *)(v101 + 200);
        *(_OWORD *)(v101 + 176) = v106;
        *(_QWORD *)(v101 + 192) = *(_QWORD *)(v101 + 232);
        *(_DWORD *)(v101 + 248) = 5;
        v98 = v100;
      }
      ++v99;
      v101 += 1724;
    }
    while (v99 < v98);
  }
  v107 = *(unsigned int *)v68;
  if ((_DWORD)v107)
  {
    v108 = 0;
    v109 = (_DWORD *)(a6 + 135444);
    v110 = *(unsigned int *)v68;
    do
    {
      if (*v109 >= 6u)
      {
        v111 = *((_OWORD *)v109 - 12);
        *(_OWORD *)(v109 - 62) = *((_OWORD *)v109 - 13);
        *(_OWORD *)(v109 - 58) = v111;
        *((_QWORD *)v109 - 27) = *((_QWORD *)v109 - 22);
        v112 = v109 - 52;
        v113 = *(_OWORD *)(v109 - 38);
        *(_OWORD *)v112 = *(_OWORD *)(v109 - 42);
        *((_OWORD *)v112 + 1) = v113;
        *((_QWORD *)v112 + 4) = *((_QWORD *)v109 - 17);
        v114 = v109 - 42;
        v115 = *((_OWORD *)v109 - 7);
        *(_OWORD *)v114 = *((_OWORD *)v109 - 8);
        *((_OWORD *)v114 + 1) = v115;
        *((_QWORD *)v114 + 4) = *((_QWORD *)v109 - 12);
        v116 = v109 - 32;
        v117 = *(_OWORD *)(v109 - 18);
        *(_OWORD *)v116 = *(_OWORD *)(v109 - 22);
        *((_OWORD *)v116 + 1) = v117;
        *((_QWORD *)v116 + 4) = *((_QWORD *)v109 - 7);
        v118 = v109 - 22;
        v119 = *((_OWORD *)v109 - 2);
        *(_OWORD *)v118 = *((_OWORD *)v109 - 3);
        *((_OWORD *)v118 + 1) = v119;
        *((_QWORD *)v118 + 4) = *((_QWORD *)v109 - 2);
        *v109 = 5;
        v107 = v110;
      }
      ++v108;
      v109 += 431;
    }
    while (v108 < v107);
  }
  v120 = *((_DWORD *)v68 + 3995);
  if (v66)
  {
    if (v120 + 1 == *(_DWORD *)(a1 + 284))
      v121 = 0;
    else
      v121 = v120 + 1;
    goto LABEL_110;
  }
  if (v120)
  {
    v121 = 0;
LABEL_110:
    *((_DWORD *)v68 + 3995) = v121;
  }
  result = 0;
  *(_DWORD *)(a6 + 4) = 467393;
  return result;
}

int *AcAssoNode::procLearnedGroupID(uint64_t a1, _DWORD *a2)
{
  _DWORD *v4;
  unsigned int *v5;
  unint64_t v6;
  _DWORD *v7;
  unint64_t v8;
  unint64_t v9;
  _DWORD *v10;
  unint64_t v11;
  _DWORD *v12;
  uint64_t v13;
  unint64_t v14;
  _DWORD *v15;
  uint64_t v16;
  int v17;
  _DWORD *v18;
  unint64_t v19;
  unint64_t v20;
  _DWORD *v21;
  uint64_t v22;
  int v23;
  unint64_t v24;
  _DWORD *v25;
  unint64_t v26;
  unint64_t v27;
  _DWORD *v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  _DWORD *v32;
  int v33;
  unint64_t v34;
  unint64_t v35;
  _DWORD *v36;
  uint64_t v37;
  int v38;
  unint64_t v39;
  int *v40;
  int *result;
  uint64_t v42;
  int *v43;
  int v44;
  uint64_t v45;
  _DWORD *v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  int v51;

  v4 = a2 + 25863;
  v5 = a2 + 12932;
  if (a2[12932])
  {
    v6 = 0;
    v7 = a2 + 3;
    do
    {
      *(_DWORD *)(a1 + 102576 + 4 * v6) = *v7;
      *v7 = 0;
      ++v6;
      v8 = *v5;
      v7 += 431;
    }
    while (v6 < v8);
    if (*v4)
      goto LABEL_5;
LABEL_9:
    LODWORD(v11) = 0;
    goto LABEL_10;
  }
  LODWORD(v8) = 0;
  if (!*v4)
    goto LABEL_9;
LABEL_5:
  v9 = 0;
  v10 = v5 + 2;
  do
  {
    *(_DWORD *)(a1 + 102936 + 4 * v9) = *v10;
    *v10 = 0;
    ++v9;
    v11 = *v4;
    v10 += 431;
  }
  while (v9 < v11);
  LODWORD(v8) = *v5;
LABEL_10:
  v12 = a2 + 46596;
  v51 = 1;
  acTrkGroupAssign((uint64_t)(a2 + 2), v8, (uint64_t)(a2 + 12933), v11, 1, 9, a1 + 256, &v51, a2 + 50498, a2 + 50588, *(void **)a1);
  if (*v5)
  {
    v14 = 0;
    v15 = a2 + 3;
    v16 = a1 + 102576;
    do
    {
      v17 = *(_DWORD *)(v16 + 4 * v14);
      *(_DWORD *)(v16 + 4 * v14) = *v15;
      *v15 = v17;
      ++v14;
      v15 += 431;
    }
    while (v14 < *v5);
  }
  v18 = a2 + 33667;
  LODWORD(v19) = *v4;
  if (*v4)
  {
    v20 = 0;
    v21 = v5 + 2;
    v22 = a1 + 102936;
    do
    {
      v23 = *(_DWORD *)(v22 + 4 * v20);
      *(_DWORD *)(v22 + 4 * v20) = *v21;
      *v21 = v23;
      ++v20;
      v19 = *v4;
      v21 += 431;
    }
    while (v20 < v19);
  }
  if (*v12)
  {
    v24 = 0;
    v25 = a2 + 33667;
    do
    {
      *(_DWORD *)(a1 + 102696 + 4 * v24) = *v25;
      *v25 = 0;
      ++v24;
      v26 = *v12;
      v25 += 431;
    }
    while (v24 < v26);
    if (*v4)
      goto LABEL_20;
LABEL_24:
    LODWORD(v29) = 0;
    goto LABEL_25;
  }
  LODWORD(v26) = 0;
  if (!(_DWORD)v19)
    goto LABEL_24;
LABEL_20:
  v27 = 0;
  v28 = v5 + 2;
  do
  {
    *(_DWORD *)(a1 + 103056 + 4 * v27) = *v28;
    *v28 = 0;
    ++v27;
    v29 = *v4;
    v28 += 431;
  }
  while (v27 < v29);
  LODWORD(v26) = *v12;
LABEL_25:
  acTrkLGroupHandAsso((uint64_t)(a2 + 12933), v29, (uint64_t)(a2 + 33666), v26, a1 + 104016, (int *)(a1 + 105816), (int *)(a1 + 107616), v13, v48, *(void **)a1, v49, a1 + 700);
  if (*v12)
  {
    v30 = 0;
    v31 = a1 + 102696;
    v32 = a2 + 33667;
    do
    {
      v33 = *(_DWORD *)(v31 + 4 * v30);
      *(_DWORD *)(v31 + 4 * v30) = *v32;
      *v32 = v33;
      ++v30;
      v34 = *v12;
      v32 += 431;
    }
    while (v30 < v34);
    if (*v4)
      goto LABEL_29;
LABEL_33:
    LODWORD(v39) = 0;
    goto LABEL_34;
  }
  LODWORD(v34) = 0;
  if (!*v4)
    goto LABEL_33;
LABEL_29:
  v35 = 0;
  v36 = v5 + 2;
  v37 = a1 + 103056;
  do
  {
    v38 = *(_DWORD *)(v37 + 4 * v35);
    *(_DWORD *)(v37 + 4 * v35) = *v36;
    *v36 = v38;
    ++v35;
    v39 = *v4;
    v36 += 431;
  }
  while (v35 < v39);
  LODWORD(v34) = *v12;
LABEL_34:
  v40 = (int *)(a1 + 103776);
  v50 = 0;
  result = AcTrkProcLearnedGroupID(a2 + 2, *v5, (uint64_t)(a2 + 33666), v34, (uint64_t)(a2 + 12933), v39, a1 + 102936, a1 + 103056, a1 + 102576, a1 + 102696, (int *)(a1 + 103416), a1 + 103776, a1 + 103896, a1 + 103296, &v50, a2 + 50590);
  v42 = *v12;
  if ((_DWORD)v42)
  {
    v43 = (int *)(a1 + 103896);
    do
    {
      v44 = *v43++;
      *v18 = v44;
      v18 += 431;
      --v42;
    }
    while (v42);
  }
  v45 = *v4;
  if ((_DWORD)v45)
  {
    v46 = v5 + 2;
    do
    {
      v47 = *v40++;
      *v46 = v47;
      v46 += 431;
      --v45;
    }
    while (v45);
  }
  return result;
}

void AcAssoNode::filterANSTBboxforBESCrop(float a1, float a2, float a3, float a4, uint64_t a5, uint64_t a6, unsigned int a7, unsigned int a8)
{
  float v8;
  float v9;
  BOOL v10;
  float v12;
  float v13;
  float v15;
  int v16;
  float v17;
  float v18;
  float v20;
  int v21;
  int v22;
  int v24;
  float v25;
  float v26;

  if (a1 < 0.0)
    return;
  v8 = a1 + a3;
  v9 = a2 + a4;
  v10 = a2 >= 0.0 && v8 <= (float)(a8 + 1);
  if (!v10 || v9 > (float)(a7 + 1))
    return;
  v12 = *(float *)(a6 + 12);
  if (*(_BYTE *)(a6 + 860))
  {
    if (v12 >= 0.0)
      goto LABEL_26;
    v13 = 0.7;
    if (!*(_BYTE *)(a6 + 100))
      v13 = 0.5;
    if (v12 >= 0.0 || (float)((float)(a1 + fabsf(v12)) / *(float *)(a6 + 20)) < v13)
    {
LABEL_26:
      v16 = *(_DWORD *)(a6 + 864) + 1;
      *(_DWORD *)(a6 + 864) = v16;
      if (v16 != 2)
        goto LABEL_29;
      *(_BYTE *)(a6 + 860) = 0;
    }
    *(_DWORD *)(a6 + 864) = 0;
  }
  else if (v12 < 0.0 && *(float *)(a6 + 832) < 0.1)
  {
    v15 = 0.7;
    if (!*(_BYTE *)(a6 + 100))
      v15 = 0.5;
    if ((float)((float)(a1 + fabsf(v12)) / *(float *)(a6 + 20)) > v15)
      *(_BYTE *)(a6 + 860) = 1;
  }
LABEL_29:
  v17 = *(float *)(a6 + 16);
  if (*(_BYTE *)(a6 + 861))
  {
    if (v17 >= 0.0)
      goto LABEL_45;
    v18 = 0.7;
    if (!*(_BYTE *)(a6 + 100))
      v18 = 0.5;
    if (v17 >= 0.0 || (float)((float)(a2 + fabsf(v17)) / *(float *)(a6 + 24)) < v18)
    {
LABEL_45:
      v21 = *(_DWORD *)(a6 + 868) + 1;
      *(_DWORD *)(a6 + 868) = v21;
      if (v21 != 2)
        goto LABEL_48;
      *(_BYTE *)(a6 + 861) = 0;
    }
    *(_DWORD *)(a6 + 868) = 0;
  }
  else if (v17 < 0.0 && *(float *)(a6 + 832) < 0.1)
  {
    v20 = 0.7;
    if (!*(_BYTE *)(a6 + 100))
      v20 = 0.5;
    if ((float)((float)(a2 + fabsf(v17)) / *(float *)(a6 + 24)) >= v20)
      *(_BYTE *)(a6 + 861) = 1;
  }
LABEL_48:
  if (!*(_BYTE *)(a6 + 863))
  {
    if (*(float *)(a6 + 832) < 0.1
      && a3 < (float)a8
      && (float)((float)(v12 + *(float *)(a6 + 20)) - (float)a8) > 0.0
      && v8 <= (float)(v12 + 5.0))
    {
      *(_BYTE *)(a6 + 863) = 1;
    }
    goto LABEL_60;
  }
  if (v8 <= (float)(v12 + 5.0))
    goto LABEL_52;
  v22 = *(_DWORD *)(a6 + 876) + 1;
  *(_DWORD *)(a6 + 876) = v22;
  if (v22 == 2)
  {
    *(_BYTE *)(a6 + 863) = 0;
LABEL_52:
    *(_DWORD *)(a6 + 876) = 0;
  }
LABEL_60:
  if (*(_BYTE *)(a6 + 862))
  {
    if (v9 > (float)(v17 + 5.0))
    {
      v24 = *(_DWORD *)(a6 + 872) + 1;
      *(_DWORD *)(a6 + 872) = v24;
      if (v24 != 2)
        return;
      *(_BYTE *)(a6 + 862) = 0;
    }
    *(_DWORD *)(a6 + 872) = 0;
    return;
  }
  if (*(float *)(a6 + 832) < 0.1)
  {
    v25 = (float)(v17 + *(float *)(a6 + 24)) - (float)a7;
    v26 = v17 + 5.0;
    if (v25 > 0.0 && a4 < (float)a7 && v9 <= v26)
      *(_BYTE *)(a6 + 862) = 1;
  }
}

float AcAssoNode::clipANSTBbox(uint64_t a1, uint64_t a2)
{
  float v2;

  v2 = *(float *)(a2 + 12);
  if (v2 >= 0.0)
    return *(float *)(a2 + 12);
  else
    return 0.0;
}

uint64_t AcAssoNode::config(AcAssoNode *this)
{
  return (uint64_t)this + 12;
}

uint64_t AcAssoNode::getParams(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  uint64_t result;

  if (*a2 != 1 || (a2[1] | 8) != 0x721C9)
    return 4294967289;
  result = 0;
  *(_DWORD *)(a3 + 2376) = *(_DWORD *)(a1 + 276);
  *(_DWORD *)(a3 + 2384) = *(_DWORD *)(a1 + 280);
  *(_QWORD *)(a3 + 2388) = *(_QWORD *)(a1 + 288);
  *(_DWORD *)(a3 + 2396) = *(_DWORD *)(a1 + 296);
  return result;
}

uint64_t AcAssoNode::detUseLowThresholds(uint64_t this, char a2)
{
  *(_BYTE *)(this + 1472) = a2;
  return this;
}

void sub_23590E32C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Failed to prepare espresso network.", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_23590E39C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Failed to prepare resized input buffer.", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_23590E40C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Failed to prepare VTPixelTransferSession.", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_23590E47C(void **a1, char *a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend_version(*a1, a2, a3);
  v5 = 136446466;
  v6 = "-[ANSTForegroundSegmentation_Internal prepareWithError:]";
  v7 = 2048;
  v8 = v4;
  _os_log_error_impl(&dword_2358CB000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "%{public}s: Unsupported algorithm version %ld", (uint8_t *)&v5, 0x16u);
  sub_2358CDAF0();
}

void sub_23590E514(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Abort because ANSTKit has deprecated non-ANE execution support.", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_23590E584(void **a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_2358CDB0C(a1, a2, a3);
  sub_2358CDB18();
  sub_2358CDADC(&dword_2358CB000, v3, v4, "%{public}s: Unexpected network resolution value %{public}lu", v5, v6, v7, v8, 2u);
  sub_2358CDAF0();
}

void sub_23590E5F8(void **a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_2358CDB0C(a1, a2, a3);
  sub_2358CDB18();
  sub_2358CDADC(&dword_2358CB000, v3, v4, "%{public}s: Unexpected network resolution value %{public}lu", v5, v6, v7, v8, 2u);
  sub_2358CDAF0();
}

void sub_23590E66C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAD4();
}

void sub_23590E6DC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Nil input buffer. Returning nil.", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_23590E74C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Failed to run vmtracker network. Returning nil.", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_23590E7BC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Failed to run initializer network. Returning nil.", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_23590E82C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Resizing failed. Returning nil.", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_23590E89C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_2358CDB2C();
  sub_2358CDAFC(&dword_2358CB000, v0, v1, "%{public}s: Failed to create CVPixelBuffer (CVReturn %d). Returning nil.", v2, v3, v4, v5, 2u);
  sub_2358CDAD4();
}

void sub_23590E908()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_2358CDB2C();
  sub_2358CDAFC(&dword_2358CB000, v0, v1, "%{public}s: Source Espresso Buffer has unexpected storage type (%d). Returning nil.", v2, v3, v4, v5, 2u);
  sub_2358CDAD4();
}

void sub_23590E974(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Source Espresso Buffer has more than 1 channel. Returning nil.", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_23590E9E4(int a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136446466;
  v3 = "-[ANSTBaseNetworkEspresso createEsressoTensorDimension:dtype:]";
  v4 = 1026;
  v5 = a1;
  _os_log_error_impl(&dword_2358CB000, a2, OS_LOG_TYPE_ERROR, "%{public}s: espresso_buffer_pack_tensor_shape failed with code %{public}d", (uint8_t *)&v2, 0x12u);
  sub_2358CDAD4();
}

void sub_23590EA68(uint64_t a1, _DWORD *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  *a2 = 136446466;
  sub_2358D2914(a1, (uint64_t)a2, (uint64_t)"-[ANSTBaseNetworkEspresso buildPlan]");
  sub_2358D28F8(&dword_2358CB000, v2, v3, "%{public}s: espresso_plan_build failed (%{public}s)", v4);
}

void sub_23590EAA8(uint64_t a1, _DWORD *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  *a2 = 136446466;
  sub_2358D2914(a1, (uint64_t)a2, (uint64_t)"-[ANSTBaseNetworkEspresso initContext]");
  sub_2358D28F8(&dword_2358CB000, v2, v3, "%{public}s: espresso_create_context failed (%{public}s)", v4);
}

void sub_23590EAE8(uint64_t a1, _DWORD *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  *a2 = 136446466;
  sub_2358D2914(a1, (uint64_t)a2, (uint64_t)"-[ANSTBaseNetworkEspresso initContext]");
  sub_2358D28F8(&dword_2358CB000, v2, v3, "%{public}s: espresso_context_set_low_precision_accumulation failed (%{public}s)", v4);
}

void sub_23590EB28(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[ANSTBaseNetworkEspresso initContext]";
  v4 = 2048;
  v5 = a1;
  _os_log_fault_impl(&dword_2358CB000, a2, OS_LOG_TYPE_FAULT, "%s: Unexpected engine type %ld. Falling back to CPU.", (uint8_t *)&v2, 0x16u);
  sub_2358CDAD4();
}

void sub_23590EBAC(uint64_t a1, _DWORD *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  *a2 = 136446466;
  sub_2358D2914(a1, (uint64_t)a2, (uint64_t)"-[ANSTBaseNetworkEspresso initPlan]");
  sub_2358D28F8(&dword_2358CB000, v2, v3, "%{public}s: espresso_create_plan failed (%{public}s)", v4);
}

void sub_23590EBEC(uint64_t a1, _DWORD *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  *a2 = 136446466;
  sub_2358D2914(a1, (uint64_t)a2, (uint64_t)"-[ANSTBaseNetworkEspresso initPlan]");
  sub_2358D28F8(&dword_2358CB000, v2, v3, "%{public}s: espresso_plan_set_priority failed (%{public}s)", v4);
}

void sub_23590EC2C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Nil _netPath", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_23590EC9C(uint64_t a1, _DWORD *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  *a2 = 136446466;
  sub_2358D2914(a1, (uint64_t)a2, (uint64_t)"-[ANSTBaseNetworkEspresso initNetwork]");
  sub_2358D28F8(&dword_2358CB000, v2, v3, "%{public}s: espresso_network_select_configuration failed (%{public}s)", v4);
}

void sub_23590ECDC(char *a1, _QWORD *a2, NSObject *a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  _QWORD *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (*a1 < 0)
    a2 = (_QWORD *)*a2;
  v3 = 136446466;
  v4 = "-[ANSTBaseNetworkEspresso validateNetworkOutputDimension]";
  v5 = 2082;
  v6 = a2;
  sub_2358D28F8(&dword_2358CB000, (int)a2, a3, "%{public}s: Shape mismatch in blob \"%{public}s\"", (uint8_t *)&v3);
  sub_2358CDAD4();
}

void sub_23590ED64(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint8_t *v3;
  NSObject *v4;

  *a3 = 136446722;
  sub_2358D2928(a1, a2, (uint64_t)a3);
  sub_2358D2944(&dword_2358CB000, "%{public}s: espresso_network_query_blob_dimensions failed for blob \"%{public}s\" (%{public}s)", v3, v4);
}

void sub_23590EDA8(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint8_t *v3;
  NSObject *v4;

  *a3 = 136446722;
  sub_2358D2928(a1, a2, (uint64_t)a3);
  sub_2358D2944(&dword_2358CB000, "%{public}s: Failure to bind input image to network for \"%{public}s\" (espresso error %{public}s)", v3, v4);
}

void sub_23590EDEC(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint8_t *v3;
  NSObject *v4;

  *a3 = 136446722;
  sub_2358D2928(a1, a2, (uint64_t)a3);
  sub_2358D2944(&dword_2358CB000, "%{public}s: espresso_network_bind_buffer for \"%{public}s\" (espresso error %{public}s)", v3, v4);
}

void sub_23590EE30(uint64_t a1, _DWORD *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  *a2 = 136446466;
  sub_2358D2914(a1, (uint64_t)a2, (uint64_t)"-[ANSTBaseNetworkEspresso bindNetworkOutput:]");
  sub_2358D28F8(&dword_2358CB000, v2, v3, "%{public}s: espresso_network_bind_buffer failed (%{public}s)", v4);
}

void sub_23590EE70(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: initializing the network output buffer fail when switching the configuration!", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_23590EEE0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: validation for network output fail when switching the configuration!", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_23590EF50(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: build plan fail when switching the configuration!", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_23590EFC0(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 8);
  v4 = 136446466;
  v5 = "-[ANSTBaseNetworkEspresso switchConfiguration:]";
  v6 = 2112;
  v7 = v3;
  sub_2358D2908(&dword_2358CB000, a2, a3, "%{public}s: Could not switch the configuration for the model: %@", (uint8_t *)&v4);
  sub_2358CDAD4();
}

void sub_23590F040(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[28];

  *(_DWORD *)v3 = 136446722;
  *(_QWORD *)&v3[4] = "-[ANSTBaseNetworkEspresso getInputLength:]";
  *(_WORD *)&v3[12] = 1026;
  *(_DWORD *)&v3[14] = a2;
  *(_WORD *)&v3[18] = 2114;
  *(_QWORD *)&v3[20] = a1;
  sub_2358D2954(&dword_2358CB000, a2, a3, "%{public}s: getInputLength failed with status: %{public}d for name %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *(_DWORD *)&v3[24]);
}

void sub_23590F0C8(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[28];

  *(_DWORD *)v3 = 136446722;
  *(_QWORD *)&v3[4] = "-[ANSTBaseNetworkEspresso getOutputLength:]";
  *(_WORD *)&v3[12] = 1024;
  *(_DWORD *)&v3[14] = a2;
  *(_WORD *)&v3[18] = 2112;
  *(_QWORD *)&v3[20] = a1;
  sub_2358D2954(&dword_2358CB000, a2, a3, "%{public}s: getOutputLength failed with status: %d for name %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *(_DWORD *)&v3[24]);
}

void sub_23590F150(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Backend library does not support getOpsForLibrary. (You are probably not running with E5RT)", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_23590F1C0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Model is not prepared before setting the input", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_23590F230(uint64_t a1, _DWORD *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  *a2 = 136446466;
  sub_2358D2914(a1, (uint64_t)a2, (uint64_t)"-[ANSTBaseNetworkEspresso setInput:fromCVPixelBuffer:]");
  sub_2358D28F8(&dword_2358CB000, v2, v3, "%{public}s: espresso_buffer_pack_tensor_shape failed (%{public}s)", v4);
}

void sub_23590F270(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Model is not prepared before setting the input", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_23590F2E0(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 136446466;
  v4 = "-[ANSTBaseNetworkEspresso setInput:fromRawPointer:]";
  v5 = 2114;
  v6 = a1;
  sub_2358D2908(&dword_2358CB000, a2, a3, "%{public}s: Input %{public}@ does not exist", (uint8_t *)&v3);
  sub_2358CDAD4();
}

void sub_23590F35C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_2358CB000, log, OS_LOG_TYPE_FAULT, "AcImageOrientationFromANSTImageOrientation: Unable to convert unspecified orientation. Proceeding with kAcImageOrientation_CC0.", v1, 2u);
}

void sub_23590F39C(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_2358D5A2C(a1, a2, a3);
  sub_2358D5A18();
  sub_2358CDADC(&dword_2358CB000, v3, v4, "%s: Unexpected resolution %ld. Returning nil.", v5, v6, v7, v8, 2u);
  sub_2358CDAF0();
}

void sub_23590F410(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_2358D5A2C(a1, a2, a3);
  sub_2358D5A18();
  sub_2358CDADC(&dword_2358CB000, v3, v4, "%s: Unexpected resolution %ld. Returning nil.", v5, v6, v7, v8, 2u);
  sub_2358CDAF0();
}

void sub_23590F484(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_2358D5A2C(a1, a2, a3);
  sub_2358D5A18();
  sub_2358CDADC(&dword_2358CB000, v3, v4, "%s: Unexpected resolution %ld. Returning nil.", v5, v6, v7, v8, 2u);
  sub_2358CDAF0();
}

void sub_23590F4F8(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_2358D5A2C(a1, a2, a3);
  sub_2358D5A18();
  sub_2358CDADC(&dword_2358CB000, v3, v4, "%s: Unexpected resolution %ld. Returning nil.", v5, v6, v7, v8, 2u);
  sub_2358CDAF0();
}

void sub_23590F56C(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_2358D5A2C(a1, a2, a3);
  sub_2358D5A18();
  sub_2358CDADC(&dword_2358CB000, v3, v4, "%s: Unexpected resolution %ld. Returning nil.", v5, v6, v7, v8, 2u);
  sub_2358CDAF0();
}

void sub_23590F5E0(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_2358D5A2C(a1, a2, a3);
  sub_2358D5A18();
  sub_2358CDADC(&dword_2358CB000, v3, v4, "%s: Unexpected resolution %ld. Returning nil.", v5, v6, v7, v8, 2u);
  sub_2358CDAF0();
}

void sub_23590F654(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_2358D5A2C(a1, a2, a3);
  sub_2358D5A18();
  sub_2358CDADC(&dword_2358CB000, v3, v4, "%s: Unexpected resolution %ld. Returning nil.", v5, v6, v7, v8, 2u);
  sub_2358CDAF0();
}

void sub_23590F6C8()
{
  uint64_t v0;
  os_log_t v1;

  sub_2358D7284();
  sub_2358D7254();
  sub_2358D7270(&dword_2358CB000, v0, v1, "%{public}s: %{public}s failed with error code %{public}d (%{public}s)");
  sub_2358D7298();
}

void sub_23590F73C()
{
  uint64_t v0;
  os_log_t v1;

  sub_2358D7284();
  sub_2358D7254();
  sub_2358D7270(&dword_2358CB000, v0, v1, "%{public}s: %{public}s failed with error code %{public}d (%{public}s)");
  sub_2358D7298();
}

void sub_23590F7B0()
{
  uint64_t v0;
  os_log_t v1;

  sub_2358D7284();
  sub_2358D7254();
  sub_2358D7270(&dword_2358CB000, v0, v1, "%{public}s: %{public}s failed with error code %{public}d (%{public}s)");
  sub_2358D7298();
}

void sub_23590F824()
{
  uint64_t v0;
  os_log_t v1;

  sub_2358D7284();
  sub_2358D7254();
  sub_2358D7270(&dword_2358CB000, v0, v1, "%{public}s: %{public}s failed with error code %{public}d (%{public}s)");
  sub_2358D7298();
}

void sub_23590F898()
{
  uint64_t v0;
  os_log_t v1;

  sub_2358D7284();
  sub_2358D7254();
  sub_2358D7270(&dword_2358CB000, v0, v1, "%{public}s: %{public}s failed with error code %{public}d (%{public}s)");
  sub_2358D7298();
}

void sub_23590F90C(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136446466;
  v3 = "-[ANSTVideoFoundationModel prepareWithError:]";
  v4 = 2082;
  v5 = a1;
  _os_log_error_impl(&dword_2358CB000, a2, OS_LOG_TYPE_ERROR, "%{public}s: MIL compilation failed due to E5 error (%{public}s)", (uint8_t *)&v2, 0x16u);
}

void sub_23590F994()
{
  uint64_t v0;
  os_log_t v1;

  sub_2358D7284();
  sub_2358D7254();
  sub_2358D7270(&dword_2358CB000, v0, v1, "%{public}s: %{public}s failed with error code %{public}d (%{public}s)");
  sub_2358D7298();
}

void sub_23590FA08()
{
  uint64_t v0;
  os_log_t v1;

  sub_2358D7284();
  sub_2358D7254();
  sub_2358D7270(&dword_2358CB000, v0, v1, "%{public}s: %{public}s failed with error code %{public}d (%{public}s)");
  sub_2358D7298();
}

void sub_23590FA7C()
{
  uint64_t v0;
  os_log_t v1;

  sub_2358D7284();
  sub_2358D7254();
  sub_2358D7270(&dword_2358CB000, v0, v1, "%{public}s: %{public}s failed with error code %{public}d (%{public}s)");
  sub_2358D7298();
}

void sub_23590FAF0()
{
  uint64_t v0;
  os_log_t v1;

  sub_2358D7284();
  sub_2358D7254();
  sub_2358D7270(&dword_2358CB000, v0, v1, "%{public}s: %{public}s failed with error code %{public}d (%{public}s)");
  sub_2358D7298();
}

void sub_23590FB64()
{
  uint64_t v0;
  os_log_t v1;

  sub_2358D7284();
  sub_2358D7254();
  sub_2358D7270(&dword_2358CB000, v0, v1, "%{public}s: %{public}s failed with error code %{public}d (%{public}s)");
  sub_2358D7298();
}

void sub_23590FBD8()
{
  uint64_t v0;
  os_log_t v1;

  sub_2358D7284();
  sub_2358D7254();
  sub_2358D7270(&dword_2358CB000, v0, v1, "%{public}s: %{public}s failed with error code %{public}d (%{public}s)");
  sub_2358D7298();
}

void sub_23590FC4C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_2358CB000, a2, OS_LOG_TYPE_DEBUG, "Deallocating ANSTVideoFoundationModel[%p]", (uint8_t *)&v2, 0xCu);
}

void sub_23590FCC0()
{
  uint64_t v0;
  os_log_t v1;

  sub_2358D7284();
  sub_2358D7254();
  sub_2358D7270(&dword_2358CB000, v0, v1, "%{public}s: %{public}s failed with error code %{public}d (%{public}s)");
  sub_2358D7298();
}

void sub_23590FD34()
{
  uint64_t v0;
  os_log_t v1;

  sub_2358D7284();
  sub_2358D7254();
  sub_2358D7270(&dword_2358CB000, v0, v1, "%{public}s: %{public}s failed with error code %{public}d (%{public}s)");
  sub_2358D7298();
}

void sub_23590FDA8()
{
  uint64_t v0;
  os_log_t v1;

  sub_2358D7284();
  sub_2358D7254();
  sub_2358D7270(&dword_2358CB000, v0, v1, "%{public}s: %{public}s failed with error code %{public}d (%{public}s)");
  sub_2358D7298();
}

void sub_23590FE1C()
{
  uint64_t v0;
  os_log_t v1;

  sub_2358D7284();
  sub_2358D7254();
  sub_2358D7270(&dword_2358CB000, v0, v1, "%{public}s: %{public}s failed with error code %{public}d (%{public}s)");
  sub_2358D7298();
}

void sub_23590FE90()
{
  uint64_t v0;
  os_log_t v1;

  sub_2358D7284();
  sub_2358D7254();
  sub_2358D7270(&dword_2358CB000, v0, v1, "%{public}s: %{public}s failed with error code %{public}d (%{public}s)");
  sub_2358D7298();
}

void sub_23590FF04()
{
  uint64_t v0;
  os_log_t v1;

  sub_2358D7284();
  sub_2358D7254();
  sub_2358D7270(&dword_2358CB000, v0, v1, "%{public}s: %{public}s failed with error code %{public}d (%{public}s)");
  sub_2358D7298();
}

void sub_23590FF78()
{
  uint64_t v0;
  os_log_t v1;

  sub_2358D7284();
  sub_2358D7254();
  sub_2358D7270(&dword_2358CB000, v0, v1, "%{public}s: %{public}s failed with error code %{public}d (%{public}s)");
  sub_2358D7298();
}

void sub_23590FFEC()
{
  uint64_t v0;
  os_log_t v1;

  sub_2358D7284();
  sub_2358D7254();
  sub_2358D7270(&dword_2358CB000, v0, v1, "%{public}s: %{public}s failed with error code %{public}d (%{public}s)");
  sub_2358D7298();
}

void sub_235910060(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136446466;
  v3 = "NSString * _Nonnull ANSTVideoMaskRefineAlgorithmVersionToNSString(ANSTVideoMaskRefineAlgorithmVersion)";
  v4 = 2048;
  v5 = a1;
  _os_log_fault_impl(&dword_2358CB000, a2, OS_LOG_TYPE_FAULT, "%{public}s: Unexpected value %lu", (uint8_t *)&v2, 0x16u);
}

void sub_2359100E8(int a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136446466;
  v3 = "NSString * _Nonnull qualityOfServiceString(qos_class_t)";
  v4 = 1026;
  v5 = a1;
  _os_log_fault_impl(&dword_2358CB000, a2, OS_LOG_TYPE_FAULT, "%{public}s: Unexpected enum value %{public}d", (uint8_t *)&v2, 0x12u);
}

void sub_235910170(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "+[ANSTViSegHQInferenceConfiguration availableInferenceResolutionForVersion:]";
  v4 = 2048;
  v5 = a1;
  _os_log_fault_impl(&dword_2358CB000, a2, OS_LOG_TYPE_FAULT, "%s: Unexpected veresion %ld. Returning empty array.", (uint8_t *)&v2, 0x16u);
}

void sub_2359101F8(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136446210;
  v2 = "-[ANSTViSegHQInferenceConfiguration initWithVersion:resolution:]";
  _os_log_error_impl(&dword_2358CB000, log, OS_LOG_TYPE_ERROR, "%{public}s: The given model version does not support the given resolution. Please check against +[ANSTViSegHQInferenceConfiguration availableInferenceResolutionForVersion:].", (uint8_t *)&v1, 0xCu);
}

void sub_235910278(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_2358CB000, a2, OS_LOG_TYPE_ERROR, "Failed to create pixel buffer (CVReturn %d)", (uint8_t *)v2, 8u);
}

void sub_2359102EC(void **a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = sub_2358E0558(a1, a2, a3);
  sub_2358E0564(v3, v4, v5);
  sub_2358E0518();
  sub_2358E0534(&dword_2358CB000, v6, v7, "%{public}s: Unexpected version %{public}ld resolution %{public}ld. Returning nil.", v8, v9, v10, v11, 2u);
  sub_2358E0548();
}

void sub_23591036C(void **a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = sub_2358E0558(a1, a2, a3);
  sub_2358E0564(v3, v4, v5);
  sub_2358E0518();
  sub_2358E0534(&dword_2358CB000, v6, v7, "%{public}s: Unexpected version %{public}ld resolution %{public}ld. Returning nil.", v8, v9, v10, v11, 2u);
  sub_2358E0548();
}

void sub_2359103EC(void **a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = sub_2358E0558(a1, a2, a3);
  sub_2358E0564(v3, v4, v5);
  sub_2358E0518();
  sub_2358E0534(&dword_2358CB000, v6, v7, "%{public}s: Unexpected version %{public}ld resolution %{public}ld. Returning nil.", v8, v9, v10, v11, 2u);
  sub_2358E0548();
}

void sub_23591046C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_2358E58BC();
  sub_2358CDAFC(&dword_2358CB000, v0, v1, "%{public}s: AcANSTDestroy failed (code %{public}d)", v2, v3, v4, v5, 2u);
  sub_2358CDAD4();
}

void sub_2359104D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_2358E58BC();
  sub_2358CDAFC(&dword_2358CB000, v0, v1, "%{public}s: AcANSTStop failed (code %{public}d)", v2, v3, v4, v5, 2u);
  sub_2358CDAD4();
}

void sub_235910544(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Failed to prepare resized input buffer.", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_2359105B4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Failed to prepare output pixel buffer pool.", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_235910624(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Failed to prepare VTPixelTransferSession.", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_235910694()
{
  __int16 v0;
  int v1;
  os_log_t v2;
  int v3[4];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 136446722;
  sub_2358E58BC();
  v4 = v0;
  v5 = v1;
  _os_log_error_impl(&dword_2358CB000, v2, OS_LOG_TYPE_ERROR, "%{public}s: Unexpected network input width %{public}u height %{public}u from Espresso.", (uint8_t *)v3, 0x18u);
  sub_2358CDAD4();
}

void sub_235910718(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Failed to prepare espresso network.", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_235910788(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Abort because ANSTKit has deprecated non-ANE execution support.", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_2359107F8()
{
  os_log_t v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136446466;
  v2 = "-[ANSTISPAlgorithmV1 prepareWithError:]";
  sub_2358E58D0();
  _os_log_error_impl(&dword_2358CB000, v0, OS_LOG_TYPE_ERROR, "%{public}s: %{public}@", (uint8_t *)&v1, 0x16u);
  sub_2358CDAD4();
}

void sub_235910878(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Nil input buffer. Returning nil.", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_2359108E8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Input pixel buffer not in landscape. Returning nil.", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_235910958(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Resizing failed. Returning nil.", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_2359109C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_2358E58BC();
  sub_2358CDAFC(&dword_2358CB000, v0, v1, "%{public}s: Failed to create AcResult (AcReturn %{public}d). Returning nil.", v2, v3, v4, v5, 2u);
  sub_2358CDAD4();
}

void sub_235910A34()
{
  os_log_t v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315394;
  v2 = "uint8_t expectedPipelineRunningOn(ANSTISPAlgorithmRunningFrameRate)";
  sub_2358E58D0();
  _os_log_fault_impl(&dword_2358CB000, v0, OS_LOG_TYPE_FAULT, "%s: Unexpected runningFrameRate %ld. Falling back to standard FPS.", (uint8_t *)&v1, 0x16u);
  sub_2358CDAD4();
}

void sub_235910AB4(void **a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_2358CDB0C(a1, a2, a3);
  sub_2358E58D0();
  sub_2358CDADC(&dword_2358CB000, v3, v4, "%{public}s: Unexpected network resolution value %{public}lu", v5, v6, v7, v8, 2u);
  sub_2358CDAF0();
}

void sub_235910B30(void **a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_2358CDB0C(a1, a2, a3);
  sub_2358E58D0();
  sub_2358CDADC(&dword_2358CB000, v3, v4, "%{public}s: Unexpected network resolution value %{public}lu", v5, v6, v7, v8, 2u);
  sub_2358CDAF0();
}

void sub_235910BAC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Source Espresso Buffer has unexpected width and height. Returning nil.", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_235910C1C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_2358E58BC();
  sub_2358CDAFC(&dword_2358CB000, v0, v1, "%{public}s: Failed to create CVPixelBuffer (CVReturn %{public}d). Returning nil.", v2, v3, v4, v5, 2u);
  sub_2358CDAD4();
}

void sub_235910C88()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_2358E58BC();
  sub_2358CDAFC(&dword_2358CB000, v0, v1, "%{public}s: Source Espresso Buffer has unexpected storage type (%{public}d). Returning nil.", v2, v3, v4, v5, 2u);
  sub_2358CDAD4();
}

void sub_235910CF4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Source Espresso Buffer has more than 1 channel. Returning nil.", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_235910D64(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Input saliency map is not valid. Returning nil.", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_235910DD4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_2358E58BC();
  sub_2358CDAFC(&dword_2358CB000, v0, v1, "%{public}s: Failed to create CVPixelBuffer (CVReturn %{public}d). Returning nil.", v2, v3, v4, v5, 2u);
  sub_2358CDAD4();
}

void sub_235910E40(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358E6AB8(&dword_2358CB000, a2, a3, "Failed to create pixel buffer (CVReturn %d)", a5, a6, a7, a8, 0);
}

void sub_235910EA8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358E6AB8(&dword_2358CB000, a2, a3, "Failed to create pixel buffer pool (CVReturn %d)", a5, a6, a7, a8, 0);
}

void sub_235910F10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_2358D5A18();
  sub_2358E6ED0(&dword_2358CB000, v0, v1, "%{public}s: Unexpected value %lu", v2, v3, v4, v5, 2u);
  sub_2358CDAD4();
}

void sub_235910F7C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_2358D5A18();
  sub_2358E6ED0(&dword_2358CB000, v0, v1, "%{public}s: Unexpected value %lu", v2, v3, v4, v5, 2u);
  sub_2358CDAD4();
}

void sub_235910FE8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_2358D5A18();
  sub_2358E6ED0(&dword_2358CB000, v0, v1, "%{public}s: Unexpected value %lu", v2, v3, v4, v5, 2u);
  sub_2358CDAD4();
}

void sub_235911054(int a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136446466;
  v3 = "NSString * _Nonnull qualityOfServiceString(qos_class_t)";
  v4 = 1026;
  v5 = a1;
  _os_log_fault_impl(&dword_2358CB000, a2, OS_LOG_TYPE_FAULT, "%{public}s: Unexpected enum value %{public}d", (uint8_t *)&v2, 0x12u);
  sub_2358CDAD4();
}

void sub_2359110D8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Failed to prepare resized input buffer.", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_235911148(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Failed to prepare output pixel buffer pool.", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_2359111B8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Failed to prepare VTPixelTransferSession.", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_235911228(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Failed to prepare espresso network.", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_235911298(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Abort because ANSTKit has deprecated non-ANE execution support.", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_235911308(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Nil input buffer. Returning nil.", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_235911378(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Input pixel buffer not in landscape. Returning nil.", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_2359113E8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Missing one or more required coarse input mask.", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_235911458(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Unexpected input mask pixel format. VMRefiner expects OneComponent8.", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_2359114C8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Unexpected input mask dimension. VMRefiner expects 256 x 192 input.", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_235911538(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Resizing failed. Returning nil.", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_2359115A8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Unexpected nil skinMask. Returning nil.", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_235911618(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Unexpected nil hairMask. Returning nil.", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_235911688(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Unexpected nil personMask. Returning nil.", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_2359116F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_2358CDB2C();
  sub_2358CDAFC(&dword_2358CB000, v0, v1, "%{public}s: Failed to create CVPixelBuffer (CVReturn %d). Returning nil.", v2, v3, v4, v5, 2u);
  sub_2358CDAD4();
}

void sub_235911764()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_2358CDB2C();
  sub_2358CDAFC(&dword_2358CB000, v0, v1, "%{public}s: Source Espresso Buffer has unexpected storage type (%d). Returning nil.", v2, v3, v4, v5, 2u);
  sub_2358CDAD4();
}

void sub_2359117D0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Source Espresso Buffer has unexpected width and height. Returning nil.", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_235911840(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Source Espresso Buffer has more than 1 channel. Returning nil.", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_2359118B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_2358D5A18();
  sub_2358E6ED0(&dword_2358CB000, v0, v1, "%{public}s: Unexpected value %lu", v2, v3, v4, v5, 2u);
  sub_2358CDAD4();
}

void sub_23591191C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_2358D5A18();
  sub_2358E6ED0(&dword_2358CB000, v0, v1, "%{public}s: Unexpected value %lu", v2, v3, v4, v5, 2u);
  sub_2358CDAD4();
}

void sub_235911988(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: This init is deprecated as it is unsafe. Please use the failable initializer [initWithConfig:error:] instead ASAP.", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_2359119F8(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136446466;
  v3 = "-[ANSTActionClassifier initWithConfig:error:]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_2358CB000, a2, OS_LOG_TYPE_ERROR, "%{public}s: %@. Returning nil.", (uint8_t *)&v2, 0x16u);
  sub_2358CDAD4();
}

void sub_235911A7C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Failed - decodingMatrixDataPointer is NULL", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_235911AEC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Failed - featureVectorDataPointer is NULL", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_235911B5C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_2358EBE2C();
  sub_2358EBE1C(&dword_2358CB000, v0, v1, "%{public}s: Unexpected object category %{public}@. Returning nil.", v2, v3, v4, v5, 2u);
}

void sub_235911BCC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_2358EBE2C();
  sub_2358EBE1C(&dword_2358CB000, v0, v1, "%{public}s: Unexpected semantic category %{public}@. Returning nil.", v2, v3, v4, v5, 2u);
}

void sub_235911C3C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_2358D5A18();
  sub_2358E6ED0(&dword_2358CB000, v0, v1, "%{public}s: Unexpected value %lu", v2, v3, v4, v5, 2u);
  sub_2358CDAD4();
}

void sub_235911CA8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_2358D5A18();
  sub_2358E6ED0(&dword_2358CB000, v0, v1, "%{public}s: Unexpected value %lu", v2, v3, v4, v5, 2u);
  sub_2358CDAD4();
}

void sub_235911D14(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136446466;
  v3 = "NSString * _Nonnull ANSTVideoFeatureExtractorVersionToNSString(ANSTVideoFeatureExtractorVersion)";
  v4 = 2048;
  v5 = a1;
  _os_log_fault_impl(&dword_2358CB000, a2, OS_LOG_TYPE_FAULT, "%{public}s: Unexpected value %lu", (uint8_t *)&v2, 0x16u);
  sub_2358CDAD4();
}

void sub_235911D98(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: This init is deprecated as it is unsafe. Please use the failable initializer [initWithConfig:error:] instead ASAP.", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_235911E08(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136446466;
  v3 = "-[ANSTVideoFeatureExtractor initWithConfig:error:]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_2358CB000, a2, OS_LOG_TYPE_ERROR, "%{public}s: %@. Returning nil.", (uint8_t *)&v2, 0x16u);
  sub_2358CDAD4();
}

void sub_235911E8C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2358CDAC4(&dword_2358CB000, a1, a3, "%{public}s: Preprocessing failed. Returning nil.", a5, a6, a7, a8, 2u);
  sub_2358CDAD4();
}

void sub_235911EFC(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136446466;
  v3 = "NSString * _Nonnull ANSTVideoFoundationModelVersionToNSString(ANSTVideoFoundationModelVersion)";
  v4 = 2048;
  v5 = a1;
  _os_log_fault_impl(&dword_2358CB000, a2, OS_LOG_TYPE_FAULT, "%{public}s: Unexpected value %lu", (uint8_t *)&v2, 0x16u);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

CVBufferRef CVBufferRetain(CVBufferRef buffer)
{
  return (CVBufferRef)MEMORY[0x24BDC5178](buffer);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5248](allocator, width, height, *(_QWORD *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x24BDC5278](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC5290](pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52B0](pixelBuffer);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x24BDC52C0](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52D0](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52E8](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x24BDC5308](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return MEMORY[0x24BDC5318](allocator, poolAttributes, pixelBufferAttributes, poolOut);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5320](allocator, pixelBufferPool, pixelBufferOut);
}

void CVPixelBufferPoolRelease(CVPixelBufferPoolRef pixelBufferPool)
{
  MEMORY[0x24BDC5358](pixelBufferPool);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x24BDC5398](texture);
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x24BDC53A0](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x24BDC53B0](pixelBuffer, unlockFlags);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x24BDD8B80](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x24BDD8D08](buffer, *(_QWORD *)&options, seed);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x24BDD8DD0](buffer, *(_QWORD *)&options, seed);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x24BDF9168](allocator, pixelTransferSessionOut);
}

void VTPixelTransferSessionInvalidate(VTPixelTransferSessionRef session)
{
  MEMORY[0x24BDF9170](session);
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x24BDF9178](session, sourceBuffer, destinationBuffer);
}

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return MEMORY[0x24BDF91A8](session, propertyKey, propertyValue);
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

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x24BEDB3E0]();
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete[]()
{
  return off_2506E3580();
}

void operator delete(void *__p)
{
  off_2506E3588(__p);
}

uint64_t operator delete()
{
  return off_2506E3590();
}

uint64_t operator new[]()
{
  return off_2506E3598();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_2506E35A0(__sz);
}

uint64_t operator new()
{
  return off_2506E35A8();
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

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

uint64_t cblas_saxpy_NEWLAPACK()
{
  return MEMORY[0x24BDB2BA0]();
}

uint64_t cblas_sgemv_NEWLAPACK()
{
  return MEMORY[0x24BDB2BE8]();
}

uint64_t cblas_snrm2_NEWLAPACK()
{
  return MEMORY[0x24BDB2C10]();
}

uint64_t cblas_sscal_NEWLAPACK()
{
  return MEMORY[0x24BDB2C20]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

uint64_t e5rt_buffer_object_get_iosurface()
{
  return MEMORY[0x24BE2F710]();
}

uint64_t e5rt_buffer_object_release()
{
  return MEMORY[0x24BE2F720]();
}

uint64_t e5rt_e5_compiler_compile()
{
  return MEMORY[0x24BE2F738]();
}

uint64_t e5rt_e5_compiler_create()
{
  return MEMORY[0x24BE2F758]();
}

uint64_t e5rt_e5_compiler_options_create()
{
  return MEMORY[0x24BE2F770]();
}

uint64_t e5rt_e5_compiler_options_release()
{
  return MEMORY[0x24BE2F778]();
}

uint64_t e5rt_e5_compiler_release()
{
  return MEMORY[0x24BE2F790]();
}

uint64_t e5rt_execution_stream_create()
{
  return MEMORY[0x24BE2F7A0]();
}

uint64_t e5rt_execution_stream_encode_operation()
{
  return MEMORY[0x24BE2F7B0]();
}

uint64_t e5rt_execution_stream_execute_sync()
{
  return MEMORY[0x24BE2F7C0]();
}

uint64_t e5rt_execution_stream_operation_create_precompiled_compute_operation_with_options()
{
  return MEMORY[0x24BE2F7E0]();
}

uint64_t e5rt_execution_stream_operation_release()
{
  return MEMORY[0x24BE2F830]();
}

uint64_t e5rt_execution_stream_operation_retain_input_port()
{
  return MEMORY[0x24BE2F840]();
}

uint64_t e5rt_execution_stream_operation_retain_output_port()
{
  return MEMORY[0x24BE2F850]();
}

uint64_t e5rt_execution_stream_release()
{
  return MEMORY[0x24BE2F870]();
}

uint64_t e5rt_execution_stream_reset()
{
  return MEMORY[0x24BE2F888]();
}

uint64_t e5rt_get_last_error_message()
{
  return MEMORY[0x24BE2F8A0]();
}

uint64_t e5rt_io_port_bind_buffer_object()
{
  return MEMORY[0x24BE2F8A8]();
}

uint64_t e5rt_io_port_bind_surface_object()
{
  return MEMORY[0x24BE2F8C0]();
}

uint64_t e5rt_io_port_release()
{
  return MEMORY[0x24BE2F8E8]();
}

uint64_t e5rt_io_port_retain_tensor_desc()
{
  return MEMORY[0x24BE2F908]();
}

uint64_t e5rt_precompiled_compute_op_create_options_create_with_program_function()
{
  return MEMORY[0x24BE2F910]();
}

uint64_t e5rt_precompiled_compute_op_create_options_release()
{
  return MEMORY[0x24BE2F918]();
}

uint64_t e5rt_program_function_release()
{
  return MEMORY[0x24BE2F948]();
}

uint64_t e5rt_program_library_release()
{
  return MEMORY[0x24BE2F998]();
}

uint64_t e5rt_program_library_retain_program_function()
{
  return MEMORY[0x24BE2F9A0]();
}

uint64_t e5rt_surface_object_create_from_iosurface()
{
  return MEMORY[0x24BE2FA08]();
}

uint64_t e5rt_surface_object_release()
{
  return MEMORY[0x24BE2FA18]();
}

uint64_t e5rt_tensor_desc_alloc_buffer_object()
{
  return MEMORY[0x24BE2FA20]();
}

uint64_t e5rt_tensor_desc_release()
{
  return MEMORY[0x24BE2FAA8]();
}

uint64_t espresso_buffer_pack_tensor_shape()
{
  return MEMORY[0x24BE2FAE8]();
}

uint64_t espresso_buffer_unpack_tensor_shape()
{
  return MEMORY[0x24BE2FAF0]();
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x24BE2FB00]();
}

uint64_t espresso_context_set_low_precision_accumulation()
{
  return MEMORY[0x24BE2FB10]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x24BE2FB18]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x24BE2FB38]();
}

uint64_t espresso_get_last_error()
{
  return MEMORY[0x24BE2FB60]();
}

uint64_t espresso_get_output_blob_name()
{
  return MEMORY[0x24BE2FB68]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x24BE2FB88]();
}

uint64_t espresso_network_bind_cvpixelbuffer()
{
  return MEMORY[0x24BE2FBA0]();
}

uint64_t espresso_network_get_version()
{
  return MEMORY[0x24BE2FC28]();
}

uint64_t espresso_network_query_blob_dimensions()
{
  return MEMORY[0x24BE2FC38]();
}

uint64_t espresso_network_select_configuration()
{
  return MEMORY[0x24BE2FC50]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x24BE2FC70]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x24BE2FC80]();
}

uint64_t espresso_plan_build_clean()
{
  return MEMORY[0x24BE2FC88]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x24BE2FC90]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x24BE2FCA0]();
}

uint64_t espresso_plan_set_priority()
{
  return MEMORY[0x24BE2FCC0]();
}

float expf(float a1)
{
  float result;

  MEMORY[0x24BDAE288](a1);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
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

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x24BDAF410](log, ptr);
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAF690](a1, a2);
  return result;
}

float sinf(float a1)
{
  float result;

  MEMORY[0x24BDAFE20](a1);
  return result;
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF70](__dst, __src, __n);
}

vImage_Error vImageAffineWarp_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, const vImage_AffineTransform *transform, const Pixel_8888 backColor, vImage_Flags flags)
{
  return MEMORY[0x24BDB35F8](src, dest, tempBuffer, transform, backColor, *(_QWORD *)&flags);
}

vImage_Error vImageScale_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x24BDB3A10](src, dest, tempBuffer, *(_QWORD *)&flags);
}

