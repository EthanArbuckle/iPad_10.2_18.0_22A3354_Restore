float STS_N_CalculateQuaternionOrientationFromTransform(_OWORD *a1, _OWORD *a2)
{
  float32x4_t v2;
  int32x4_t v3;
  float32x4_t v4;
  float v5;
  float v6;
  float v7;
  float v9;
  float v10;
  float v11;
  float32x2_t v12;
  float32x2_t v13;
  unsigned __int32 v14;
  unsigned __int32 v15;
  float v16;
  float v17;
  float32x2_t v18;
  float32x2_t v19;
  float v20;
  float v21;
  unsigned int v22;
  float32x2_t v23;
  float32x2_t v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float result;
  float v30;
  float v31;
  float32x2_t v32;
  float32x2_t v33;
  __int128 v34;

  v3 = *(int32x4_t *)a1;
  v2 = *((float32x4_t *)a1 + 1);
  v4 = *((float32x4_t *)a1 + 2);
  LODWORD(v5) = HIDWORD(*((_QWORD *)a1 + 2));
  v6 = COERCE_FLOAT(*((_QWORD *)a1 + 5));
  v7 = v6 + (float)(COERCE_FLOAT(*a1) + v5);
  if (v7 >= 0.0)
  {
    v16 = sqrtf(v7 + 1.0);
    v17 = v16 + v16;
    v18 = vrecpe_f32((float32x2_t)COERCE_UNSIGNED_INT(v16 + v16));
    v19 = vmul_f32(v18, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v16 + v16), v18));
    LODWORD(v20) = vmul_f32(v19, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v16 + v16), v19)).u32[0];
    v26 = vmuls_lane_f32(v20, (float32x2_t)*(_OWORD *)&vsubq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v2, 2), v4), 1);
    v27 = vmuls_n_f32(vsubq_f32(v4, (float32x4_t)vdupq_laneq_s32(v3, 2)).f32[0], v20);
    v28 = vmuls_n_f32(vsubq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v3.i8, 1), v2).f32[0], v20);
    result = v17 * 0.25;
  }
  else if (*(float *)v3.i32 < v5 || *(float *)v3.i32 < v6)
  {
    v9 = 1.0 - *(float *)v3.i32;
    if (v5 >= v6)
    {
      v30 = sqrtf(v5 + (float)(v9 - v6));
      v31 = v30 + v30;
      v32 = vrecpe_f32((float32x2_t)COERCE_UNSIGNED_INT(v30 + v30));
      v33 = vmul_f32(v32, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v30 + v30), v32));
      v14 = vmul_f32(v33, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v30 + v30), v33)).u32[0];
      v26 = vmuls_n_f32(vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v3.i8, 1), v2).f32[0], *(float *)&v14);
      v27 = v31 * 0.25;
      v28 = vmuls_lane_f32(*(float *)&v14, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v2, 2), v4), 1);
      v15 = vsubq_f32(v4, (float32x4_t)vdupq_laneq_s32(v3, 2)).u32[0];
    }
    else
    {
      v10 = sqrtf(v6 + (float)(v9 - v5));
      v11 = v10 + v10;
      v12 = vrecpe_f32((float32x2_t)COERCE_UNSIGNED_INT(v10 + v10));
      v13 = vmul_f32(v12, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v10 + v10), v12));
      v14 = vmul_f32(v13, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v10 + v10), v13)).u32[0];
      v26 = vmuls_n_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32(v3, 2), v4).f32[0], *(float *)&v14);
      v27 = vmuls_lane_f32(*(float *)&v14, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v2, 2), v4), 1);
      v28 = v11 * 0.25;
      v15 = vsubq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v3.i8, 1), v2).u32[0];
    }
    result = vmuls_n_f32(*(float *)&v15, *(float *)&v14);
  }
  else
  {
    v21 = sqrtf(*(float *)v3.i32 + (float)((float)(1.0 - v5) - v6));
    *(float *)&v22 = v21 + v21;
    v23 = vrecpe_f32((float32x2_t)v22);
    v24 = vmul_f32(v23, vrecps_f32((float32x2_t)v22, v23));
    LODWORD(v25) = vmul_f32(v24, vrecps_f32((float32x2_t)v22, v24)).u32[0];
    v26 = *(float *)&v22 * 0.25;
    v27 = vmuls_n_f32(vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v3.i8, 1), v2).f32[0], v25);
    v28 = vmuls_n_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32(v3, 2), v4).f32[0], v25);
    result = vmuls_lane_f32(v25, (float32x2_t)*(_OWORD *)&vsubq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v2, 2), v4), 1);
  }
  *(float *)&v34 = -v28;
  *((float *)&v34 + 1) = v26;
  *((float *)&v34 + 2) = -v27;
  *((float *)&v34 + 3) = result;
  *a2 = v34;
  return result;
}

void STS_N_CalculateAngularOrientationFromTransform(uint64_t a1, float *a2, float *a3, float *a4)
{
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  double v14;
  float v16;
  double v17;
  double v19;
  float v21;

  LODWORD(v8) = HIDWORD(*(_QWORD *)(a1 + 32));
  if (fabsf(v8) >= 1.0)
  {
    v9 = atan2f(-COERCE_FLOAT(*(_QWORD *)(a1 + 8)), COERCE_FLOAT(*(_OWORD *)a1));
    v10 = 0.0;
  }
  else
  {
    v9 = atan2f(COERCE_FLOAT(*(_OWORD *)(a1 + 32)), COERCE_FLOAT(*(_QWORD *)(a1 + 40)));
    v10 = atan2f(*(float *)(a1 + 4), *(float *)(a1 + 20)) * 57.2957795;
  }
  v11 = -v8;
  if (v8 < -1.0)
    v11 = 1.0;
  if (v8 > 1.0)
    v11 = -1.0;
  v12 = asinf(v11);
  v13 = (float)-v9 * 57.2957795;
  v14 = fabsf(v13);
  if (v14 >= 1.0e15 || v14 <= 1.0e-15)
    v13 = 0.0;
  *a2 = v13;
  v16 = v12 * 57.2957795;
  v17 = fabsf(v16);
  if (v17 >= 1.0e15 || v17 <= 1.0e-15)
    v16 = 0.0;
  *a3 = v16;
  v19 = fabsf(v10);
  if (v19 >= 1.0e15 || v19 <= 1.0e-15)
    v21 = 0.0;
  else
    v21 = v10;
  *a4 = v21;
}

void sub_2290E46A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2290E4828(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2290E48AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2290E49CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id STS_N_Log(void)
{
  if (STS_N_Log(void)::onceToken != -1)
    dispatch_once(&STS_N_Log(void)::onceToken, &__block_literal_global);
  return (id)STS_N_Log(void)::log;
}

void ___Z9STS_N_Logv_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.STS-N", "STS-N");
  v1 = (void *)STS_N_Log(void)::log;
  STS_N_Log(void)::log = (uint64_t)v0;

}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]();
}

void std::__throw_length_error[abi:ne180100]()
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception);
}

void sub_2290E4B08(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, "basic_string");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void getkFigSTSLabel_Global(void)
{
  uint64_t v0;
  void *v1;
  void *v2;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = getkFigSTSLabel_GlobalSymbolLoc(void)::ptr;
  v7 = getkFigSTSLabel_GlobalSymbolLoc(void)::ptr;
  if (!getkFigSTSLabel_GlobalSymbolLoc(void)::ptr)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = ___ZL31getkFigSTSLabel_GlobalSymbolLocv_block_invoke;
    v3[3] = &unk_24F1D0390;
    v3[4] = &v4;
    ___ZL31getkFigSTSLabel_GlobalSymbolLocv_block_invoke(v3);
    v0 = v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CFStringRef getkFigSTSLabel_Global()");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("STS_N_Singleton.mm"), 21, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_2290E4C50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::unique_ptr<STS_N::PerLabelInfo>>,0>(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = 0;
  if (v2)
    std::default_delete<STS_N::PerLabelInfo>::operator()[abi:ne180100](v2);
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

void std::default_delete<STS_N::PerLabelInfo>::operator()[abi:ne180100](uint64_t a1)
{
  const void *v2;

  v2 = *(const void **)(a1 + 104);
  if (v2)
    CFRelease(v2);
  std::__hash_table<OpaqueAudioComponentInstance *,std::hash<OpaqueAudioComponentInstance *>,std::equal_to<OpaqueAudioComponentInstance *>,std::allocator<OpaqueAudioComponentInstance *>>::~__hash_table(a1 + 64);
  std::__hash_table<OpaqueAudioComponentInstance *,std::hash<OpaqueAudioComponentInstance *>,std::equal_to<OpaqueAudioComponentInstance *>,std::allocator<OpaqueAudioComponentInstance *>>::~__hash_table(a1 + 24);
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  JUMPOUT(0x22E2C1708);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t std::__hash_table<OpaqueAudioComponentInstance *,std::hash<OpaqueAudioComponentInstance *>,std::equal_to<OpaqueAudioComponentInstance *>,std::allocator<OpaqueAudioComponentInstance *>>::~__hash_table(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  v2 = *(_QWORD **)(a1 + 16);
  if (v2)
  {
    do
    {
      v3 = (_QWORD *)*v2;
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
  v4 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v4)
    operator delete(v4);
  return a1;
}

void std::__destroy_at[abi:ne180100]<std::pair<OpaqueAudioComponentInstance * const,std::pair<std::string,std::string>>,0>(uint64_t a1)
{
  if (*(char *)(a1 + 55) < 0)
    operator delete(*(void **)(a1 + 32));
  if (*(char *)(a1 + 31) < 0)
    operator delete(*(void **)(a1 + 8));
}

void sub_2290E4FAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object)
{
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void STS_N::UpdateGlobalState(uint64_t a1, uint64_t a2)
{
  _QWORD *i;
  float32x4_t *v5;
  uint64_t v6;
  OSStatus v7;
  NSObject *v8;
  float32x4_t v9;
  uint64_t j;
  OSStatus v11;
  NSObject *v12;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _DWORD v17[3];
  __int128 inData;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  OSStatus v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  STS_N_CalculateQuaternionOrientationFromTransform((_OWORD *)(a2 + 16), &inData);
  os_unfair_lock_lock((os_unfair_lock_t)a1);
  for (i = *(_QWORD **)(a1 + 24); i; i = (_QWORD *)*i)
  {
    v5 = (float32x4_t *)i[5];
    if (!v5[7].i32[1])
    {
      v6 = v5[5].i64[0];
      if (v6)
      {
        do
        {
          v7 = AudioUnitSetProperty(*(AudioUnit *)(v6 + 16), 0xC1Eu, 0, 0, &inData, 0x10u);
          if (v7)
          {
            STS_N_Log();
            v8 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              v20 = "UpdateGlobalState";
              v21 = 1024;
              v22 = 180;
              v23 = 1024;
              v24 = v7;
              _os_log_error_impl(&dword_2290E3000, v8, OS_LOG_TYPE_ERROR, "%s:%d error: %d", buf, 0x18u);
            }

          }
          v6 = *(_QWORD *)v6;
        }
        while (v6);
        v5 = (float32x4_t *)i[5];
      }
      if (v5[15].i8[0])
      {
        v9 = vsubq_f32(v5[13], *(float32x4_t *)(a2 + 64));
        v17[0] = v9.i32[0];
        *(float *)&v17[1] = -v9.f32[2];
        v17[2] = v9.i32[1];
        for (j = v5[5].i64[0]; j; j = *(_QWORD *)j)
        {
          v11 = AudioUnitSetProperty(*(AudioUnit *)(j + 16), 0xC2Bu, 0, 0, v17, 0xCu);
          if (v11)
          {
            STS_N_Log();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              v20 = "UpdateGlobalState";
              v21 = 1024;
              v22 = 194;
              v23 = 1024;
              v24 = v11;
              _os_log_error_impl(&dword_2290E3000, v12, OS_LOG_TYPE_ERROR, "%s:%d error: %d", buf, 0x18u);
            }

          }
        }
      }
    }
  }
  kdebug_trace();
  v13 = *(unsigned __int8 *)(a1 + 176);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)a2;
  v14 = *(_OWORD *)(a2 + 64);
  v16 = *(_OWORD *)(a2 + 16);
  v15 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 160) = v14;
  *(_OWORD *)(a1 + 112) = v16;
  *(_OWORD *)(a1 + 128) = v15;
  if (!v13)
    *(_BYTE *)(a1 + 176) = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)a1);
}

void sub_2290E5240(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t STS_N::InfoForLabel(uint64_t a1, unsigned __int8 *a2)
{
  unint64_t v2;
  unsigned __int8 *v3;
  void **v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  std::string *v8;
  uint64_t v9;
  ForcedReconfigurationCallbackContainer *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint8x8_t v15;
  unint64_t v16;
  unsigned __int8 **v17;
  unsigned __int8 *i;
  unint64_t v19;
  _QWORD *v20;
  unsigned __int8 **v21;
  std::string *v22;
  float v23;
  float v24;
  _BOOL8 v25;
  unint64_t v26;
  unint64_t v27;
  int8x8_t prime;
  void *v29;
  void *v30;
  uint64_t v31;
  unsigned __int8 *v32;
  unint64_t v33;
  uint8x8_t v34;
  unint64_t v35;
  uint8x8_t v36;
  uint64_t v37;
  unsigned __int8 *v38;
  unint64_t v39;
  unsigned __int8 **v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  unsigned __int8 *v45;
  uint64_t v46;
  uint64_t v47;
  unsigned __int8 *v48;
  unsigned __int8 *v49;
  unsigned __int8 *v50;
  CFIndex Count;
  CFMutableDictionaryRef MutableCopy;
  const void *v53;
  CFMutableDictionaryRef Mutable;
  const void *v55;
  void *v57;
  std::string __p;
  uint64_t v59;
  _QWORD v60[2];
  char v61;

  v3 = a2;
  v5 = (void **)(a1 + 8);
  v6 = std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>>>::find<std::string>((_QWORD *)(a1 + 8), a2);
  if (v6)
  {
    v7 = v6 + 40;
    return *(_QWORD *)v7;
  }
  v8 = (std::string *)operator new();
  v9 = (uint64_t)v8;
  if ((char)v3[23] < 0)
  {
    std::string::__init_copy_ctor_external(v8, *(const std::string::value_type **)v3, *((_QWORD *)v3 + 1));
  }
  else
  {
    *(_OWORD *)&v8->__r_.__value_.__l.__data_ = *(_OWORD *)v3;
    v8->__r_.__value_.__r.__words[2] = *((_QWORD *)v3 + 2);
  }
  *(_OWORD *)(v9 + 24) = 0u;
  *(_OWORD *)(v9 + 40) = 0u;
  *(_DWORD *)(v9 + 56) = 1065353216;
  *(_OWORD *)(v9 + 64) = 0u;
  *(_OWORD *)(v9 + 80) = 0u;
  *(_DWORD *)(v9 + 96) = 1065353216;
  *(_QWORD *)(v9 + 104) = 0;
  *(_BYTE *)(v9 + 112) = 1;
  *(_DWORD *)(v9 + 116) = 0;
  *(_DWORD *)(v9 + 120) = 0;
  *(_DWORD *)(v9 + 124) = 1056964608;
  *(_OWORD *)(v9 + 128) = xmmword_2290EEFF0;
  *(_QWORD *)(v9 + 144) = 0;
  *(_BYTE *)(v9 + 152) = 0;
  *(_BYTE *)(v9 + 160) = 0;
  *(_BYTE *)(v9 + 240) = 0;
  v10 = -[ForcedReconfigurationCallbackContainer initWithLabel:]([ForcedReconfigurationCallbackContainer alloc], "initWithLabel:", v9);
  v11 = *(void **)(v9 + 144);
  *(_QWORD *)(v9 + 144) = v10;

  if ((char)v3[23] < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v3, *((_QWORD *)v3 + 1));
  else
    __p = *(std::string *)v3;
  v59 = v9;
  v12 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)&__p);
  v13 = v12;
  v14 = *(_QWORD *)(a1 + 16);
  if (v14)
  {
    v15 = (uint8x8_t)vcnt_s8((int8x8_t)v14);
    v15.i16[0] = vaddlv_u8(v15);
    v16 = v15.u32[0];
    if (v15.u32[0] > 1uLL)
    {
      v2 = v12;
      if (v12 >= v14)
        v2 = v12 % v14;
    }
    else
    {
      v2 = (v14 - 1) & v12;
    }
    v17 = (unsigned __int8 **)*((_QWORD *)*v5 + v2);
    if (v17)
    {
      for (i = *v17; i; i = *(unsigned __int8 **)i)
      {
        v19 = *((_QWORD *)i + 1);
        if (v19 == v13)
        {
          if (std::equal_to<std::string>::operator()[abi:ne180100](i + 16, (unsigned __int8 *)&__p))
            goto LABEL_85;
        }
        else
        {
          if (v16 > 1)
          {
            if (v19 >= v14)
              v19 %= v14;
          }
          else
          {
            v19 &= v14 - 1;
          }
          if (v19 != v2)
            break;
        }
      }
    }
  }
  v20 = operator new(0x30uLL);
  v21 = (unsigned __int8 **)(a1 + 24);
  v60[0] = v20;
  v60[1] = a1 + 24;
  v61 = 0;
  *v20 = 0;
  v20[1] = v13;
  v22 = (std::string *)(v20 + 2);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(v22, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  }
  else
  {
    *(_OWORD *)&v22->__r_.__value_.__l.__data_ = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    v20[4] = *((_QWORD *)&__p.__r_.__value_.__l + 2);
  }
  v59 = 0;
  v20[5] = v9;
  v61 = 1;
  v23 = (float)(unint64_t)(*(_QWORD *)(a1 + 32) + 1);
  v24 = *(float *)(a1 + 40);
  if (!v14 || (float)(v24 * (float)v14) < v23)
  {
    v25 = 1;
    if (v14 >= 3)
      v25 = (v14 & (v14 - 1)) != 0;
    v26 = v25 | (2 * v14);
    v27 = vcvtps_u32_f32(v23 / v24);
    if (v26 <= v27)
      prime = (int8x8_t)v27;
    else
      prime = (int8x8_t)v26;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
    }
    v14 = *(_QWORD *)(a1 + 16);
    if (*(_QWORD *)&prime > v14)
      goto LABEL_41;
    if (*(_QWORD *)&prime < v14)
    {
      v35 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 32) / *(float *)(a1 + 40));
      if (v14 < 3 || (v36 = (uint8x8_t)vcnt_s8((int8x8_t)v14), v36.i16[0] = vaddlv_u8(v36), v36.u32[0] > 1uLL))
      {
        v35 = std::__next_prime(v35);
      }
      else
      {
        v37 = 1 << -(char)__clz(v35 - 1);
        if (v35 >= 2)
          v35 = v37;
      }
      if (*(_QWORD *)&prime <= v35)
        prime = (int8x8_t)v35;
      if (*(_QWORD *)&prime >= v14)
      {
        v14 = *(_QWORD *)(a1 + 16);
      }
      else
      {
        if (prime)
        {
LABEL_41:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v29 = operator new(8 * *(_QWORD *)&prime);
          v30 = *v5;
          *v5 = v29;
          if (v30)
            operator delete(v30);
          v31 = 0;
          *(int8x8_t *)(a1 + 16) = prime;
          do
            *((_QWORD *)*v5 + v31++) = 0;
          while (*(_QWORD *)&prime != v31);
          v32 = *v21;
          if (*v21)
          {
            v33 = *((_QWORD *)v32 + 1);
            v34 = (uint8x8_t)vcnt_s8(prime);
            v34.i16[0] = vaddlv_u8(v34);
            if (v34.u32[0] > 1uLL)
            {
              if (v33 >= *(_QWORD *)&prime)
                v33 %= *(_QWORD *)&prime;
            }
            else
            {
              v33 &= *(_QWORD *)&prime - 1;
            }
            *((_QWORD *)*v5 + v33) = v21;
            v38 = *(unsigned __int8 **)v32;
            if (*(_QWORD *)v32)
            {
              do
              {
                v39 = *((_QWORD *)v38 + 1);
                if (v34.u32[0] > 1uLL)
                {
                  if (v39 >= *(_QWORD *)&prime)
                    v39 %= *(_QWORD *)&prime;
                }
                else
                {
                  v39 &= *(_QWORD *)&prime - 1;
                }
                if (v39 != v33)
                {
                  if (!*((_QWORD *)*v5 + v39))
                  {
                    *((_QWORD *)*v5 + v39) = v32;
                    goto LABEL_66;
                  }
                  *(_QWORD *)v32 = *(_QWORD *)v38;
                  *(_QWORD *)v38 = **((_QWORD **)*v5 + v39);
                  **((_QWORD **)*v5 + v39) = v38;
                  v38 = v32;
                }
                v39 = v33;
LABEL_66:
                v32 = v38;
                v38 = *(unsigned __int8 **)v38;
                v33 = v39;
              }
              while (v38);
            }
          }
          v14 = (unint64_t)prime;
          goto LABEL_70;
        }
        v57 = *v5;
        *v5 = 0;
        if (v57)
          operator delete(v57);
        v14 = 0;
        *(_QWORD *)(a1 + 16) = 0;
      }
    }
LABEL_70:
    if ((v14 & (v14 - 1)) != 0)
    {
      if (v13 >= v14)
        v2 = v13 % v14;
      else
        v2 = v13;
    }
    else
    {
      v2 = (v14 - 1) & v13;
    }
  }
  v40 = (unsigned __int8 **)*((_QWORD *)*v5 + v2);
  i = (unsigned __int8 *)v60[0];
  if (v40)
  {
    *(_QWORD *)v60[0] = *v40;
  }
  else
  {
    *(_QWORD *)v60[0] = *v21;
    *v21 = i;
    *((_QWORD *)*v5 + v2) = v21;
    if (!*(_QWORD *)i)
      goto LABEL_84;
    v41 = *(_QWORD *)(*(_QWORD *)i + 8);
    if ((v14 & (v14 - 1)) != 0)
    {
      if (v41 >= v14)
        v41 %= v14;
    }
    else
    {
      v41 &= v14 - 1;
    }
    v40 = (unsigned __int8 **)((char *)*v5 + 8 * v41);
  }
  *v40 = i;
LABEL_84:
  v60[0] = 0;
  ++*(_QWORD *)(a1 + 32);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,void *>>>>::reset[abi:ne180100]((uint64_t)v60);
  v9 = v59;
  if (v59)
LABEL_85:
    std::default_delete<STS_N::PerLabelInfo>::operator()[abi:ne180100](v9);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v42 = v3[23];
  v43 = *(unsigned __int8 *)(a1 + 215);
  v44 = (char)v43;
  v45 = (unsigned __int8 *)(a1 + 192);
  v46 = *(_QWORD *)(a1 + 200);
  v7 = i + 40;
  if ((v42 & 0x80u) == 0)
    v47 = v3[23];
  else
    v47 = *((_QWORD *)v3 + 1);
  if ((v43 & 0x80u) != 0)
    v43 = v46;
  if (v47 != v43)
    goto LABEL_103;
  if (v44 >= 0)
    v48 = v45;
  else
    v48 = *(unsigned __int8 **)v45;
  if ((v42 & 0x80) != 0)
  {
    if (memcmp(*(const void **)v3, v48, *((_QWORD *)v3 + 1)))
    {
LABEL_103:
      v49 = std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>>>::find<std::string>(v5, v45);
      if (v49)
      {
        v50 = v49;
        Count = CFDictionaryGetCount(*(CFDictionaryRef *)(*((_QWORD *)v49 + 5) + 104));
        MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], Count, *(CFDictionaryRef *)(*((_QWORD *)v50 + 5) + 104));
        v53 = *(const void **)(*(_QWORD *)v7 + 104);
        *(_QWORD *)(*(_QWORD *)v7 + 104) = MutableCopy;
        if (v53)
          CFRelease(v53);
      }
    }
  }
  else if (v3[23])
  {
    while (*v3 == *v48)
    {
      ++v3;
      ++v48;
      if (!--v42)
        goto LABEL_106;
    }
    goto LABEL_103;
  }
LABEL_106:
  if (!*(_QWORD *)(*(_QWORD *)v7 + 104))
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
    v55 = *(const void **)(*(_QWORD *)v7 + 104);
    *(_QWORD *)(*(_QWORD *)v7 + 104) = Mutable;
    if (v55)
      CFRelease(v55);
  }
  return *(_QWORD *)v7;
}

void sub_2290E58E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,void *>>>>::reset[abi:ne180100]((uint64_t)&a14);
  std::pair<std::string const,std::unique_ptr<STS_N::PerLabelInfo>>::~pair((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void std::__hash_table<OpaqueFigSTS *,std::hash<OpaqueFigSTS *>,std::equal_to<OpaqueFigSTS *>,std::allocator<OpaqueFigSTS *>>::__erase_unique<OpaqueFigSTS *>(uint64_t *a1, unint64_t a2)
{
  int8x8_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint8x8_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;

  v2 = (int8x8_t)a1[1];
  if (v2)
  {
    v3 = 0x9DDFEA08EB382D69 * (((8 * a2) + 8) ^ HIDWORD(a2));
    v4 = 0x9DDFEA08EB382D69 * (HIDWORD(a2) ^ (v3 >> 47) ^ v3);
    v5 = 0x9DDFEA08EB382D69 * (v4 ^ (v4 >> 47));
    v6 = (uint8x8_t)vcnt_s8(v2);
    v6.i16[0] = vaddlv_u8(v6);
    if (v6.u32[0] > 1uLL)
    {
      v7 = 0x9DDFEA08EB382D69 * (v4 ^ (v4 >> 47));
      if (v5 >= *(_QWORD *)&v2)
        v7 = v5 % *(_QWORD *)&v2;
    }
    else
    {
      v7 = v5 & (*(_QWORD *)&v2 - 1);
    }
    v8 = *a1;
    v9 = *(uint64_t ***)(*a1 + 8 * v7);
    if (v9)
    {
      v10 = *v9;
      if (v10)
      {
        v11 = *(_QWORD *)&v2 - 1;
        do
        {
          v12 = v10[1];
          if (v12 == v5)
          {
            if (v10[2] == a2)
            {
              if (v6.u32[0] > 1uLL)
              {
                if (v5 >= *(_QWORD *)&v2)
                  v5 %= *(_QWORD *)&v2;
              }
              else
              {
                v5 &= v11;
              }
              v13 = *(uint64_t **)(v8 + 8 * v5);
              do
              {
                v14 = v13;
                v13 = (uint64_t *)*v13;
              }
              while (v13 != v10);
              if (v14 == a1 + 2)
                goto LABEL_36;
              v15 = v14[1];
              if (v6.u32[0] > 1uLL)
              {
                if (v15 >= *(_QWORD *)&v2)
                  v15 %= *(_QWORD *)&v2;
              }
              else
              {
                v15 &= v11;
              }
              if (v15 != v5)
              {
LABEL_36:
                if (!*v10)
                  goto LABEL_37;
                v16 = *(_QWORD *)(*v10 + 8);
                if (v6.u32[0] > 1uLL)
                {
                  if (v16 >= *(_QWORD *)&v2)
                    v16 %= *(_QWORD *)&v2;
                }
                else
                {
                  v16 &= v11;
                }
                if (v16 != v5)
LABEL_37:
                  *(_QWORD *)(v8 + 8 * v5) = 0;
              }
              v17 = *v10;
              if (*v10)
              {
                v18 = *(_QWORD *)(v17 + 8);
                if (v6.u32[0] > 1uLL)
                {
                  if (v18 >= *(_QWORD *)&v2)
                    v18 %= *(_QWORD *)&v2;
                }
                else
                {
                  v18 &= v11;
                }
                if (v18 != v5)
                {
                  *(_QWORD *)(*a1 + 8 * v18) = v14;
                  v17 = *v10;
                }
              }
              *v14 = v17;
              *v10 = 0;
              --a1[3];
              operator delete(v10);
              return;
            }
          }
          else
          {
            if (v6.u32[0] > 1uLL)
            {
              if (v12 >= *(_QWORD *)&v2)
                v12 %= *(_QWORD *)&v2;
            }
            else
            {
              v12 &= v11;
            }
            if (v12 != v7)
              return;
          }
          v10 = (uint64_t *)*v10;
        }
        while (v10);
      }
    }
  }
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

void STS_N::LabelValidityDidChange(STS_N *a1, unsigned __int8 *a2)
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  const __CFAllocator *v7;
  unint64_t v8;
  uint64_t v9;
  std::string::size_type size;
  uint64_t v11;
  int v12;
  unsigned __int8 *v13;
  std::string *v14;
  unsigned __int8 *v15;
  int8x8_t *v16;
  int8x8_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint8x8_t v21;
  unint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  unint64_t v25;
  std::string *p_p;
  __CFString *v27;
  BOOL v28;
  uint64_t v29;
  BOOL v30;
  BOOL v31;
  std::string __p;
  std::string v34;

  v4 = STS_N::InfoForLabel((uint64_t)a1, a2);
  v5 = (uint64_t *)*((_QWORD *)a1 + 8);
  if (!v5)
    return;
  v6 = v4;
  v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  do
  {
    v8 = v5[2];
    if (*((char *)v5 + 47) < 0)
      std::string::__init_copy_ctor_external(&v34, (const std::string::value_type *)v5[3], v5[4]);
    else
      v34 = *(std::string *)((_BYTE *)v5 + 1);
    if (*((char *)v5 + 71) < 0)
      std::string::__init_copy_ctor_external(&__p, (const std::string::value_type *)v5[6], v5[7]);
    else
      __p = *(std::string *)((_BYTE *)v5 + 2);
    v9 = HIBYTE(v34.__r_.__value_.__r.__words[2]);
    if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v34.__r_.__value_.__r.__words[2]);
    else
      size = v34.__r_.__value_.__l.__size_;
    v11 = a2[23];
    v12 = (char)v11;
    if ((v11 & 0x80u) != 0)
      v11 = *((_QWORD *)a2 + 1);
    if (size != v11)
      goto LABEL_49;
    if (v12 >= 0)
      v13 = a2;
    else
      v13 = *(unsigned __int8 **)a2;
    if ((*((_BYTE *)&v34.__r_.__value_.__s + 23) & 0x80) != 0)
    {
      if (memcmp(v34.__r_.__value_.__l.__data_, v13, v34.__r_.__value_.__l.__size_))
        goto LABEL_49;
    }
    else if (*((_BYTE *)&v34.__r_.__value_.__s + 23))
    {
      v14 = &v34;
      do
      {
        if (v14->__r_.__value_.__s.__data_[0] != *v13)
          goto LABEL_49;
        v14 = (std::string *)((char *)v14 + 1);
        ++v13;
        --v9;
      }
      while (v9);
    }
    v15 = std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>>>::find<std::string>((_QWORD *)a1 + 1, (unsigned __int8 *)&__p);
    if (!v15)
      goto LABEL_42;
    v16 = (int8x8_t *)*((_QWORD *)v15 + 5);
    v17 = v16[9];
    if (!*(_QWORD *)&v17)
      goto LABEL_42;
    v18 = 0x9DDFEA08EB382D69 * (((8 * v8) + 8) ^ HIDWORD(v8));
    v19 = 0x9DDFEA08EB382D69 * (HIDWORD(v8) ^ (v18 >> 47) ^ v18);
    v20 = 0x9DDFEA08EB382D69 * (v19 ^ (v19 >> 47));
    v21 = (uint8x8_t)vcnt_s8(v17);
    v21.i16[0] = vaddlv_u8(v21);
    if (v21.u32[0] > 1uLL)
    {
      v22 = v20;
      if (v20 >= *(_QWORD *)&v17)
        v22 = v20 % *(_QWORD *)&v17;
    }
    else
    {
      v22 = v20 & (*(_QWORD *)&v17 - 1);
    }
    v23 = *(_QWORD **)(*(_QWORD *)&v16[8] + 8 * v22);
    if (!v23 || (v24 = (_QWORD *)*v23) == 0)
    {
LABEL_42:
      v28 = 0;
      v31 = *(_QWORD *)(v6 + 48) != 0;
      goto LABEL_43;
    }
    while (1)
    {
      v25 = v24[1];
      if (v20 == v25)
        break;
      if (v21.u32[0] > 1uLL)
      {
        if (v25 >= *(_QWORD *)&v17)
          v25 %= *(_QWORD *)&v17;
      }
      else
      {
        v25 &= *(_QWORD *)&v17 - 1;
      }
      if (v25 != v22)
        goto LABEL_42;
LABEL_41:
      v24 = (_QWORD *)*v24;
      if (!v24)
        goto LABEL_42;
    }
    if (v24[2] != v8)
      goto LABEL_41;
    v28 = v24 != 0;
    v29 = *(_QWORD *)(v6 + 48);
    v30 = v29 == 0;
    v31 = v29 != 0;
    if (!v30 && v24 != 0)
    {
      STS_N::UnregisterSpatializerUnderLock(a1, v8);
      if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &v34;
      else
        p_p = (std::string *)v34.__r_.__value_.__r.__words[0];
      goto LABEL_48;
    }
LABEL_43:
    if (!v31 && !v28)
    {
      STS_N::UnregisterSpatializerUnderLock(a1, v8);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      else
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
LABEL_48:
      v27 = (__CFString *)CFStringCreateWithCString(v7, (const char *)p_p, 0x8000100u);
      STS_N::RegisterSpatializerUnderLock(a1, (OpaqueAudioComponentInstance *)v8, v27);
      CFRelease(v27);
    }
LABEL_49:
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v34.__r_.__value_.__l.__data_);
    v5 = (uint64_t *)*v5;
  }
  while (v5);
}

void sub_2290E5F08(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a14 < 0)
    operator delete(__p);
  if (a21 < 0)
    operator delete(a16);
  _Unwind_Resume(exception_object);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>>>::find<std::string>(_QWORD *a1, unsigned __int8 *a2)
{
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 **v10;
  unsigned __int8 *i;
  unint64_t v12;

  v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)a2);
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
  for (i = *v10; i; i = *(unsigned __int8 **)i)
  {
    v12 = *((_QWORD *)i + 1);
    if (v12 == v6)
    {
      if (std::equal_to<std::string>::operator()[abi:ne180100](i + 16, a2))
        return i;
    }
    else
    {
      if (v8 > 1)
      {
        if (v12 >= *(_QWORD *)&v5)
          v12 %= *(_QWORD *)&v5;
      }
      else
      {
        v12 &= *(_QWORD *)&v5 - 1;
      }
      if (v12 != v9)
        return 0;
    }
  }
  return i;
}

void STS_N::UnregisterSpatializerUnderLock(STS_N *this, unint64_t a2)
{
  NSObject *v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  int8x8_t *v9;
  int8x8_t v10;
  uint8x8_t v11;
  unint64_t v12;
  int8x8_t v13;
  OpaqueAudioComponentInstance ***v14;
  OpaqueAudioComponentInstance **v15;
  uint64_t v16;
  OpaqueAudioComponentInstance *v17;
  unint64_t v18;
  OpaqueAudioComponentInstance **v19;
  OpaqueAudioComponentInstance **v20;
  unint64_t v21;
  unint64_t v22;
  OpaqueAudioComponentInstance *v23;
  unint64_t v24;
  _QWORD *v25;
  int v26;
  unint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    STS_N_Log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v26 = 134217984;
      v27 = a2;
      _os_log_debug_impl(&dword_2290E3000, v4, OS_LOG_TYPE_DEBUG, "Unregistering spatializer %p", (uint8_t *)&v26, 0xCu);
    }

    v5 = (_QWORD *)*((_QWORD *)this + 3);
    if (v5)
    {
      v6 = 0x9DDFEA08EB382D69 * (((8 * a2) + 8) ^ HIDWORD(a2));
      v7 = 0x9DDFEA08EB382D69 * (HIDWORD(a2) ^ (v6 >> 47) ^ v6);
      v8 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
      do
      {
        while (1)
        {
          v9 = (int8x8_t *)v5[5];
          v10 = v9[9];
          if (v10)
          {
            v11 = (uint8x8_t)vcnt_s8(v10);
            v11.i16[0] = vaddlv_u8(v11);
            if (v11.u32[0] > 1uLL)
            {
              v12 = v8;
              if (v8 >= *(_QWORD *)&v10)
                v12 = v8 % *(_QWORD *)&v10;
            }
            else
            {
              v12 = v8 & (*(_QWORD *)&v10 - 1);
            }
            v13 = v9[8];
            v14 = *(OpaqueAudioComponentInstance ****)(*(_QWORD *)&v13 + 8 * v12);
            if (v14)
            {
              v15 = *v14;
              if (*v14)
              {
                v16 = *(_QWORD *)&v10 - 1;
                do
                {
                  v17 = v15[1];
                  if (v17 == (OpaqueAudioComponentInstance *)v8)
                  {
                    if (v15[2] == (OpaqueAudioComponentInstance *)a2)
                    {
                      if (v11.u32[0] > 1uLL)
                      {
                        v18 = v8;
                        if (v8 >= *(_QWORD *)&v10)
                          v18 = v8 % *(_QWORD *)&v10;
                      }
                      else
                      {
                        v18 = v16 & v8;
                      }
                      v19 = *(OpaqueAudioComponentInstance ***)(*(_QWORD *)&v13 + 8 * v18);
                      do
                      {
                        v20 = v19;
                        v19 = (OpaqueAudioComponentInstance **)*v19;
                      }
                      while (v19 != v15);
                      if (v20 == (OpaqueAudioComponentInstance **)&v9[10])
                        goto LABEL_41;
                      v21 = (unint64_t)v20[1];
                      if (v11.u32[0] > 1uLL)
                      {
                        if (v21 >= *(_QWORD *)&v10)
                          v21 %= *(_QWORD *)&v10;
                      }
                      else
                      {
                        v21 &= v16;
                      }
                      if (v21 != v18)
                      {
LABEL_41:
                        if (!*v15)
                          goto LABEL_42;
                        v22 = *((_QWORD *)*v15 + 1);
                        if (v11.u32[0] > 1uLL)
                        {
                          if (v22 >= *(_QWORD *)&v10)
                            v22 %= *(_QWORD *)&v10;
                        }
                        else
                        {
                          v22 &= v16;
                        }
                        if (v22 != v18)
LABEL_42:
                          *(_QWORD *)(*(_QWORD *)&v13 + 8 * v18) = 0;
                      }
                      v23 = *v15;
                      if (*v15)
                      {
                        v24 = *((_QWORD *)v23 + 1);
                        if (v11.u32[0] > 1uLL)
                        {
                          if (v24 >= *(_QWORD *)&v10)
                            v24 %= *(_QWORD *)&v10;
                        }
                        else
                        {
                          v24 &= v16;
                        }
                        if (v24 != v18)
                        {
                          *(_QWORD *)(*(_QWORD *)&v9[8] + 8 * v24) = v20;
                          v23 = *v15;
                        }
                      }
                      *v20 = v23;
                      *v15 = 0;
                      --*(_QWORD *)&v9[11];
                      operator delete(v15);
                      v9 = (int8x8_t *)v5[5];
                      break;
                    }
                  }
                  else
                  {
                    if (v11.u32[0] > 1uLL)
                    {
                      if ((unint64_t)v17 >= *(_QWORD *)&v10)
                        v17 = (OpaqueAudioComponentInstance *)((unint64_t)v17 % *(_QWORD *)&v10);
                    }
                    else
                    {
                      v17 = (OpaqueAudioComponentInstance *)((unint64_t)v17 & v16);
                    }
                    if (v17 != (OpaqueAudioComponentInstance *)v12)
                      break;
                  }
                  v15 = (OpaqueAudioComponentInstance **)*v15;
                }
                while (v15);
              }
            }
          }
          if (!STS_N::CanDeleteSpatializerInfo((uint64_t)this, (unsigned __int8 *)v9))
            break;
          v25 = (_QWORD *)*v5;
          std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>>>::remove((uint64_t)&v26, (_QWORD *)this + 1, v5);
          std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,void *>>>>::reset[abi:ne180100]((uint64_t)&v26);
          v5 = v25;
          if (!v25)
            return;
        }
        v5 = (_QWORD *)*v5;
      }
      while (v5);
    }
  }
}

void STS_N::RegisterSpatializerUnderLock(STS_N *this, OpaqueAudioComponentInstance *a2, __CFString *a3)
{
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  int v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __CFString *v27;
  __CFString *v28;
  int v29;
  uint64_t v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint8_t buf[32];
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  STS_N_Log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = a2;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = a3;
    _os_log_impl(&dword_2290E3000, v6, OS_LOG_TYPE_DEFAULT, "Registering spatializer %p with label %@", buf, 0x16u);
  }

  v7 = STS_N::InfoForLabel(this, a3);
  std::__hash_table<OpaqueAudioComponentInstance *,std::hash<OpaqueAudioComponentInstance *>,std::equal_to<OpaqueAudioComponentInstance *>,std::allocator<OpaqueAudioComponentInstance *>>::__emplace_unique_key_args<OpaqueAudioComponentInstance *,OpaqueAudioComponentInstance * const&>((float *)(v7 + 64), (unint64_t)a2, (uint64_t)a2);
  STS_N::ApplyStoredPerLabelStateToSpatializers((uint64_t)this, v7, (unint64_t)a2);
  v8 = *(unsigned __int8 *)(v7 + 152);
  v31 = (void *)objc_msgSend(*(id *)(v7 + 104), "copy");
  memset(buf, 0, sizeof(buf));
  v43 = 1065353216;
  std::__hash_table<OpaqueAudioComponentInstance *,std::hash<OpaqueAudioComponentInstance *>,std::equal_to<OpaqueAudioComponentInstance *>,std::allocator<OpaqueAudioComponentInstance *>>::__emplace_unique_key_args<OpaqueAudioComponentInstance *,OpaqueAudioComponentInstance * const&>((float *)buf, (unint64_t)a2, (uint64_t)a2);
  getkFigSTSLabel_Global();
  if ((-[__CFString isEqualToString:](a3, "isEqualToString:", v9) & 1) == 0)
  {
    getkFigSTSLabel_Global();
    v11 = STS_N::InfoForLabel(this, v10);
    v12 = (void *)objc_msgSend(*(id *)(v11 + 104), "copy");
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (!v14)
      goto LABEL_23;
    v15 = *(_QWORD *)v37;
    while (1)
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v37 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v16);
        objc_msgSend(v31, "objectForKey:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {

          goto LABEL_18;
        }
        v19 = v17;
        v20 = v19;
        if (!v8
          || (-[__CFString isEqualToString:](v19, "isEqualToString:", CFSTR("ListenerPose")) & 1) != 0
          || (-[__CFString isEqualToString:](v20, "isEqualToString:", CFSTR("SourcePose")) & 1) != 0
          || (-[__CFString isEqualToString:](v20, "isEqualToString:", CFSTR("SoundStageSize")) & 1) != 0
          || (-[__CFString isEqualToString:](v20, "isEqualToString:", CFSTR("SoundStageTransitionTime")) & 1) != 0)
        {

LABEL_17:
          STS_N::SetPropertyOnSpatializers(v11, v20, (void *)objc_msgSend(v13, "objectForKey:", v20), (uint64_t)buf);
          goto LABEL_18;
        }
        v21 = -[__CFString isEqualToString:](v20, "isEqualToString:", CFSTR("RoomConfiguration"));

        if (v21)
          goto LABEL_17;
LABEL_18:
        ++v16;
      }
      while (v14 != v16);
      v22 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      v14 = v22;
      if (!v22)
      {
LABEL_23:

        break;
      }
    }
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v23 = v31;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (!v24)
    goto LABEL_41;
  v25 = *(_QWORD *)v33;
  do
  {
    v26 = 0;
    do
    {
      if (*(_QWORD *)v33 != v25)
        objc_enumerationMutation(v23);
      v27 = (__CFString *)*(id *)(*((_QWORD *)&v32 + 1) + 8 * v26);
      v28 = v27;
      if (!v8
        || (-[__CFString isEqualToString:](v27, "isEqualToString:", CFSTR("ListenerPose")) & 1) != 0
        || (-[__CFString isEqualToString:](v28, "isEqualToString:", CFSTR("SourcePose")) & 1) != 0
        || (-[__CFString isEqualToString:](v28, "isEqualToString:", CFSTR("SoundStageSize")) & 1) != 0
        || (-[__CFString isEqualToString:](v28, "isEqualToString:", CFSTR("SoundStageTransitionTime")) & 1) != 0)
      {

LABEL_35:
        STS_N::SetPropertyOnSpatializers(v7, v28, (void *)objc_msgSend(v23, "objectForKey:", v28), (uint64_t)buf);
        goto LABEL_36;
      }
      v29 = -[__CFString isEqualToString:](v28, "isEqualToString:", CFSTR("RoomConfiguration"));

      if (v29)
        goto LABEL_35;
LABEL_36:
      ++v26;
    }
    while (v24 != v26);
    v30 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    v24 = v30;
  }
  while (v30);
LABEL_41:

  std::__hash_table<OpaqueAudioComponentInstance *,std::hash<OpaqueAudioComponentInstance *>,std::equal_to<OpaqueAudioComponentInstance *>,std::allocator<OpaqueAudioComponentInstance *>>::~__hash_table((uint64_t)buf);
}

void sub_2290E6720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  uint64_t v11;

  std::__hash_table<OpaqueAudioComponentInstance *,std::hash<OpaqueAudioComponentInstance *>,std::equal_to<OpaqueAudioComponentInstance *>,std::allocator<OpaqueAudioComponentInstance *>>::~__hash_table(v11 - 144);
  _Unwind_Resume(a1);
}

uint64_t STS_N::InfoForLabel(STS_N *this, id a2)
{
  uint64_t v3;
  void *__p[2];
  char v6;

  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(a2), "UTF8String"));
  v3 = STS_N::InfoForLabel((uint64_t)this, (unsigned __int8 *)__p);
  if (v6 < 0)
    operator delete(__p[0]);
  return v3;
}

void sub_2290E67F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__hash_table<OpaqueAudioComponentInstance *,std::hash<OpaqueAudioComponentInstance *>,std::equal_to<OpaqueAudioComponentInstance *>,std::allocator<OpaqueAudioComponentInstance *>>::__emplace_unique_key_args<OpaqueAudioComponentInstance *,OpaqueAudioComponentInstance * const&>(float *a1, unint64_t a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint8x8_t v10;
  _QWORD *v11;
  _QWORD *i;
  unint64_t v13;
  _QWORD *v14;
  float v15;
  float v16;
  _BOOL8 v17;
  unint64_t v18;
  unint64_t v19;
  int8x8_t prime;
  void *v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD *v24;
  unint64_t v25;
  uint8x8_t v26;
  unint64_t v27;
  uint8x8_t v28;
  uint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  unint64_t v34;
  _QWORD *v35;

  v6 = 0x9DDFEA08EB382D69 * (((8 * a2) + 8) ^ HIDWORD(a2));
  v7 = 0x9DDFEA08EB382D69 * (HIDWORD(a2) ^ (v6 >> 47) ^ v6);
  v8 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
  v9 = *((_QWORD *)a1 + 1);
  if (v9)
  {
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      v3 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
      if (v8 >= v9)
        v3 = v8 % v9;
    }
    else
    {
      v3 = v8 & (v9 - 1);
    }
    v11 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
    if (v11)
    {
      for (i = (_QWORD *)*v11; i; i = (_QWORD *)*i)
      {
        v13 = i[1];
        if (v13 == v8)
        {
          if (i[2] == a2)
            return;
        }
        else
        {
          if (v10.u32[0] > 1uLL)
          {
            if (v13 >= v9)
              v13 %= v9;
          }
          else
          {
            v13 &= v9 - 1;
          }
          if (v13 != v3)
            break;
        }
      }
    }
  }
  v14 = operator new(0x18uLL);
  *v14 = 0;
  v14[1] = v8;
  v14[2] = a3;
  v15 = (float)(unint64_t)(*((_QWORD *)a1 + 3) + 1);
  v16 = a1[8];
  if (!v9 || (float)(v16 * (float)v9) < v15)
  {
    v17 = 1;
    if (v9 >= 3)
      v17 = (v9 & (v9 - 1)) != 0;
    v18 = v17 | (2 * v9);
    v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19)
      prime = (int8x8_t)v19;
    else
      prime = (int8x8_t)v18;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      v9 = *((_QWORD *)a1 + 1);
    }
    if (*(_QWORD *)&prime > v9)
      goto LABEL_30;
    if (*(_QWORD *)&prime < v9)
    {
      v27 = vcvtps_u32_f32((float)*((unint64_t *)a1 + 3) / a1[8]);
      if (v9 < 3 || (v28 = (uint8x8_t)vcnt_s8((int8x8_t)v9), v28.i16[0] = vaddlv_u8(v28), v28.u32[0] > 1uLL))
      {
        v27 = std::__next_prime(v27);
      }
      else
      {
        v29 = 1 << -(char)__clz(v27 - 1);
        if (v27 >= 2)
          v27 = v29;
      }
      if (*(_QWORD *)&prime <= v27)
        prime = (int8x8_t)v27;
      if (*(_QWORD *)&prime >= v9)
      {
        v9 = *((_QWORD *)a1 + 1);
      }
      else
      {
        if (prime)
        {
LABEL_30:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v21 = operator new(8 * *(_QWORD *)&prime);
          v22 = *(_QWORD **)a1;
          *(_QWORD *)a1 = v21;
          if (v22)
            operator delete(v22);
          v23 = 0;
          *((int8x8_t *)a1 + 1) = prime;
          do
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v23++) = 0;
          while (*(_QWORD *)&prime != v23);
          v24 = (_QWORD *)*((_QWORD *)a1 + 2);
          if (v24)
          {
            v25 = v24[1];
            v26 = (uint8x8_t)vcnt_s8(prime);
            v26.i16[0] = vaddlv_u8(v26);
            if (v26.u32[0] > 1uLL)
            {
              if (v25 >= *(_QWORD *)&prime)
                v25 %= *(_QWORD *)&prime;
            }
            else
            {
              v25 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v25) = a1 + 4;
            v30 = (_QWORD *)*v24;
            if (*v24)
            {
              do
              {
                v31 = v30[1];
                if (v26.u32[0] > 1uLL)
                {
                  if (v31 >= *(_QWORD *)&prime)
                    v31 %= *(_QWORD *)&prime;
                }
                else
                {
                  v31 &= *(_QWORD *)&prime - 1;
                }
                if (v31 != v25)
                {
                  if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v31))
                  {
                    *(_QWORD *)(*(_QWORD *)a1 + 8 * v31) = v24;
                    goto LABEL_55;
                  }
                  *v24 = *v30;
                  *v30 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v31);
                  **(_QWORD **)(*(_QWORD *)a1 + 8 * v31) = v30;
                  v30 = v24;
                }
                v31 = v25;
LABEL_55:
                v24 = v30;
                v30 = (_QWORD *)*v30;
                v25 = v31;
              }
              while (v30);
            }
          }
          v9 = (unint64_t)prime;
          goto LABEL_59;
        }
        v35 = *(_QWORD **)a1;
        *(_QWORD *)a1 = 0;
        if (v35)
          operator delete(v35);
        v9 = 0;
        *((_QWORD *)a1 + 1) = 0;
      }
    }
LABEL_59:
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9)
        v3 = v8 % v9;
      else
        v3 = v8;
    }
    else
    {
      v3 = (v9 - 1) & v8;
    }
  }
  v32 = *(_QWORD **)a1;
  v33 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v33)
  {
    *v14 = *v33;
LABEL_72:
    *v33 = v14;
    goto LABEL_73;
  }
  *v14 = *((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = v14;
  v32[v3] = a1 + 4;
  if (*v14)
  {
    v34 = *(_QWORD *)(*v14 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v34 >= v9)
        v34 %= v9;
    }
    else
    {
      v34 &= v9 - 1;
    }
    v33 = (_QWORD *)(*(_QWORD *)a1 + 8 * v34);
    goto LABEL_72;
  }
LABEL_73:
  ++*((_QWORD *)a1 + 3);
}

void sub_2290E6C10(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t STS_N::ApplyStoredPerLabelStateToSpatializers(uint64_t a1, uint64_t a2, unint64_t a3)
{
  float32x4_t *v5;
  __int128 v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  uint64_t **j;
  OSStatus v11;
  NSObject *v12;
  OSStatus v13;
  NSObject *v14;
  OSStatus v15;
  NSObject *v16;
  OSStatus v17;
  NSObject *v18;
  OSStatus v19;
  NSObject *v20;
  _QWORD *i;
  _QWORD *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t **k;
  OSStatus v27;
  NSObject *v28;
  float32x4_t v29;
  uint64_t **m;
  OSStatus v31;
  NSObject *v32;
  uint64_t **v33;
  AudioUnitParameterValue v34;
  AudioUnitParameterValue v35;
  AudioUnitParameterValue v36;
  OSStatus v37;
  NSObject *v38;
  OSStatus v39;
  NSObject *v40;
  OSStatus v41;
  NSObject *v42;
  int v43;
  uint64_t **n;
  OSStatus v45;
  NSObject *v46;
  OSStatus v47;
  NSObject *v48;
  uint64_t **ii;
  OSStatus v50;
  NSObject *v51;
  float v53[3];
  __int128 inData;
  __int128 v55;
  __int128 v56;
  int v57;
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  int v61;
  __int16 v62;
  OSStatus v63;
  _BYTE v64[32];
  __int128 v65;
  float32x4_t v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v55 = 0u;
  v56 = 0u;
  v57 = 1065353216;
  if (a3)
  {
    std::__hash_table<OpaqueAudioComponentInstance *,std::hash<OpaqueAudioComponentInstance *>,std::equal_to<OpaqueAudioComponentInstance *>,std::allocator<OpaqueAudioComponentInstance *>>::__emplace_unique_key_args<OpaqueAudioComponentInstance *,OpaqueAudioComponentInstance * const&>((float *)&v55, a3, a3);
  }
  else if (&v55 != (__int128 *)(a2 + 64))
  {
    v57 = *(_DWORD *)(a2 + 96);
    for (i = *(_QWORD **)(a2 + 80); i; i = (_QWORD *)*i)
    {
      v22 = operator new(0x18uLL);
      *v22 = 0;
      v23 = i[2];
      v24 = 0x9DDFEA08EB382D69 * (((8 * v23) + 8) ^ HIDWORD(v23));
      v25 = 0x9DDFEA08EB382D69 * (HIDWORD(v23) ^ (v24 >> 47) ^ v24);
      v22[1] = 0x9DDFEA08EB382D69 * (v25 ^ (v25 >> 47));
      v22[2] = v23;
      std::__hash_table<OpaqueAudioComponentInstance *,std::hash<OpaqueAudioComponentInstance *>,std::equal_to<OpaqueAudioComponentInstance *>,std::allocator<OpaqueAudioComponentInstance *>>::__node_insert_multi((uint64_t)&v55, v22);
    }
  }
  if (*(_DWORD *)(a2 + 116))
  {
    v5 = (float32x4_t *)MEMORY[0x24BDAEE00];
    v6 = *(_OWORD *)(MEMORY[0x24BDAEE00] + 16);
    *(_OWORD *)v64 = *MEMORY[0x24BDAEE00];
    *(_OWORD *)&v64[16] = v6;
    v7 = *(float32x4_t *)(MEMORY[0x24BDAEE00] + 48);
    v65 = *(_OWORD *)(MEMORY[0x24BDAEE00] + 32);
    v66 = v7;
    STS_N_CalculateQuaternionOrientationFromTransform(v64, &inData);
    v8 = v5[3];
    v8.i32[2] = -1.0;
    v9 = vsubq_f32(v8, v66);
    v53[0] = v9.f32[0];
    v53[1] = -v9.f32[2];
    v53[2] = v9.f32[1];
    for (j = (uint64_t **)v56; j; j = (uint64_t **)*j)
    {
      v11 = AudioUnitSetProperty((AudioUnit)j[2], 0xC1Eu, 0, 0, &inData, 0x10u);
      if (v11)
      {
        STS_N_Log();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v59 = "ApplyStoredPerLabelStateToSpatializers";
          v60 = 1024;
          v61 = 987;
          v62 = 1024;
          v63 = v11;
          _os_log_error_impl(&dword_2290E3000, v12, OS_LOG_TYPE_ERROR, "%s:%d error: %d", buf, 0x18u);
        }

      }
      v13 = AudioUnitSetProperty((AudioUnit)j[2], 0xC2Bu, 0, 0, v53, 0xCu);
      if (v13)
      {
        STS_N_Log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v59 = "ApplyStoredPerLabelStateToSpatializers";
          v60 = 1024;
          v61 = 994;
          v62 = 1024;
          v63 = v13;
          _os_log_error_impl(&dword_2290E3000, v14, OS_LOG_TYPE_ERROR, "%s:%d error: %d", buf, 0x18u);
        }

      }
      v15 = AudioUnitSetParameter((AudioUnit)j[2], 0x16u, 1u, 0, 0.0, 0);
      if (v15)
      {
        STS_N_Log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v59 = "ApplyStoredPerLabelStateToSpatializers";
          v60 = 1024;
          v61 = 999;
          v62 = 1024;
          v63 = v15;
          _os_log_error_impl(&dword_2290E3000, v16, OS_LOG_TYPE_ERROR, "%s:%d error: %d", buf, 0x18u);
        }

      }
      v17 = AudioUnitSetParameter((AudioUnit)j[2], 0x17u, 1u, 0, 0.0, 0);
      if (v17)
      {
        STS_N_Log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v59 = "ApplyStoredPerLabelStateToSpatializers";
          v60 = 1024;
          v61 = 1000;
          v62 = 1024;
          v63 = v17;
          _os_log_error_impl(&dword_2290E3000, v18, OS_LOG_TYPE_ERROR, "%s:%d error: %d", buf, 0x18u);
        }

      }
      v19 = AudioUnitSetParameter((AudioUnit)j[2], 0x18u, 1u, 0, 0.0, 0);
      if (v19)
      {
        STS_N_Log();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v59 = "ApplyStoredPerLabelStateToSpatializers";
          v60 = 1024;
          v61 = 1001;
          v62 = 1024;
          v63 = v19;
          _os_log_error_impl(&dword_2290E3000, v20, OS_LOG_TYPE_ERROR, "%s:%d error: %d", buf, 0x18u);
        }

      }
    }
  }
  else
  {
    if (*(_BYTE *)(a1 + 176))
    {
      STS_N_CalculateQuaternionOrientationFromTransform((_OWORD *)(a1 + 112), buf);
      for (k = (uint64_t **)v56; k; k = (uint64_t **)*k)
      {
        v27 = AudioUnitSetProperty((AudioUnit)k[2], 0xC1Eu, 0, 0, buf, 0x10u);
        if (v27)
        {
          STS_N_Log();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v64 = 136315650;
            *(_QWORD *)&v64[4] = "ApplyStoredPerLabelStateToSpatializers";
            *(_WORD *)&v64[12] = 1024;
            *(_DWORD *)&v64[14] = 1015;
            *(_WORD *)&v64[18] = 1024;
            *(_DWORD *)&v64[20] = v27;
            _os_log_error_impl(&dword_2290E3000, v28, OS_LOG_TYPE_ERROR, "%s:%d error: %d", v64, 0x18u);
          }

        }
      }
      if (*(_BYTE *)(a2 + 240))
      {
        v29 = vsubq_f32(*(float32x4_t *)(a2 + 208), *(float32x4_t *)(a1 + 160));
        LODWORD(inData) = v29.i32[0];
        *((float *)&inData + 1) = -v29.f32[2];
        DWORD2(inData) = v29.i32[1];
        for (m = (uint64_t **)v56; m; m = (uint64_t **)*m)
        {
          v31 = AudioUnitSetProperty((AudioUnit)m[2], 0xC2Bu, 0, 0, &inData, 0xCu);
          if (v31)
          {
            STS_N_Log();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v64 = 136315650;
              *(_QWORD *)&v64[4] = "ApplyStoredPerLabelStateToSpatializers";
              *(_WORD *)&v64[12] = 1024;
              *(_DWORD *)&v64[14] = 1030;
              *(_WORD *)&v64[18] = 1024;
              *(_DWORD *)&v64[20] = v31;
              _os_log_error_impl(&dword_2290E3000, v32, OS_LOG_TYPE_ERROR, "%s:%d error: %d", v64, 0x18u);
            }

          }
        }
      }
    }
    if (*(_BYTE *)(a2 + 240))
    {
      *(_DWORD *)buf = 0;
      LODWORD(inData) = 0;
      v53[0] = 0.0;
      STS_N_CalculateAngularOrientationFromTransform(a2 + 160, (float *)&inData, (float *)buf, v53);
      v33 = (uint64_t **)v56;
      if ((_QWORD)v56)
      {
        v34 = *(float *)&inData;
        v35 = *(float *)buf;
        v36 = v53[0];
        do
        {
          v37 = AudioUnitSetParameter((AudioUnit)v33[2], 0x16u, 1u, 0, v34, 0);
          if (v37)
          {
            STS_N_Log();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v64 = 136315650;
              *(_QWORD *)&v64[4] = "ApplyStoredPerLabelStateToSpatializers";
              *(_WORD *)&v64[12] = 1024;
              *(_DWORD *)&v64[14] = 1040;
              *(_WORD *)&v64[18] = 1024;
              *(_DWORD *)&v64[20] = v37;
              _os_log_error_impl(&dword_2290E3000, v38, OS_LOG_TYPE_ERROR, "%s:%d error: %d", v64, 0x18u);
            }

          }
          v39 = AudioUnitSetParameter((AudioUnit)v33[2], 0x17u, 1u, 0, v35, 0);
          if (v39)
          {
            STS_N_Log();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v64 = 136315650;
              *(_QWORD *)&v64[4] = "ApplyStoredPerLabelStateToSpatializers";
              *(_WORD *)&v64[12] = 1024;
              *(_DWORD *)&v64[14] = 1041;
              *(_WORD *)&v64[18] = 1024;
              *(_DWORD *)&v64[20] = v39;
              _os_log_error_impl(&dword_2290E3000, v40, OS_LOG_TYPE_ERROR, "%s:%d error: %d", v64, 0x18u);
            }

          }
          v41 = AudioUnitSetParameter((AudioUnit)v33[2], 0x18u, 1u, 0, v36, 0);
          if (v41)
          {
            STS_N_Log();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v64 = 136315650;
              *(_QWORD *)&v64[4] = "ApplyStoredPerLabelStateToSpatializers";
              *(_WORD *)&v64[12] = 1024;
              *(_DWORD *)&v64[14] = 1042;
              *(_WORD *)&v64[18] = 1024;
              *(_DWORD *)&v64[20] = v41;
              _os_log_error_impl(&dword_2290E3000, v42, OS_LOG_TYPE_ERROR, "%s:%d error: %d", v64, 0x18u);
            }

          }
          v33 = (uint64_t **)*v33;
        }
        while (v33);
      }
    }
  }
  if (!*(_BYTE *)(a2 + 152))
  {
    if (*(_BYTE *)(a2 + 240))
    {
      for (n = (uint64_t **)v56; n; n = (uint64_t **)*n)
      {
        v45 = AudioUnitSetParameter((AudioUnit)n[2], 3u, 1u, 0, *(AudioUnitParameterValue *)(a2 + 228), 0);
        if (v45)
        {
          STS_N_Log();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v64 = 136315650;
            *(_QWORD *)&v64[4] = "ApplyStoredPerLabelStateToSpatializers";
            *(_WORD *)&v64[12] = 1024;
            *(_DWORD *)&v64[14] = 1050;
            *(_WORD *)&v64[18] = 1024;
            *(_DWORD *)&v64[20] = v45;
            _os_log_error_impl(&dword_2290E3000, v46, OS_LOG_TYPE_ERROR, "%s:%d error: %d", v64, 0x18u);
          }

        }
        v47 = AudioUnitSetParameter((AudioUnit)n[2], 0x23u, 1u, 0, *(AudioUnitParameterValue *)(a2 + 232), 0);
        if (v47)
        {
          STS_N_Log();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v64 = 136315650;
            *(_QWORD *)&v64[4] = "ApplyStoredPerLabelStateToSpatializers";
            *(_WORD *)&v64[12] = 1024;
            *(_DWORD *)&v64[14] = 1051;
            *(_WORD *)&v64[18] = 1024;
            *(_DWORD *)&v64[20] = v47;
            _os_log_error_impl(&dword_2290E3000, v48, OS_LOG_TYPE_ERROR, "%s:%d error: %d", v64, 0x18u);
          }

        }
      }
    }
  }
  if (*(_DWORD *)(a2 + 116) == 20)
  {
    v43 = 1;
  }
  else if (*(_BYTE *)(a2 + 152) || !*(_BYTE *)(a2 + 240))
  {
    v43 = 3;
  }
  else
  {
    v43 = *(_DWORD *)(a2 + 224);
  }
  *(_DWORD *)buf = v43;
  for (ii = (uint64_t **)v56; ii; ii = (uint64_t **)*ii)
  {
    v50 = AudioUnitSetProperty((AudioUnit)ii[2], 0xBBDu, 1u, 0, buf, 4u);
    if (v50)
    {
      STS_N_Log();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v64 = 136315650;
        *(_QWORD *)&v64[4] = "ApplyStoredPerLabelStateToSpatializers";
        *(_WORD *)&v64[12] = 1024;
        *(_DWORD *)&v64[14] = 1063;
        *(_WORD *)&v64[18] = 1024;
        *(_DWORD *)&v64[20] = v50;
        _os_log_error_impl(&dword_2290E3000, v51, OS_LOG_TYPE_ERROR, "%s:%d error: %d", v64, 0x18u);
      }

    }
  }
  return std::__hash_table<OpaqueAudioComponentInstance *,std::hash<OpaqueAudioComponentInstance *>,std::equal_to<OpaqueAudioComponentInstance *>,std::allocator<OpaqueAudioComponentInstance *>>::~__hash_table((uint64_t)&v55);
}

void sub_2290E767C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  std::__hash_table<OpaqueAudioComponentInstance *,std::hash<OpaqueAudioComponentInstance *>,std::equal_to<OpaqueAudioComponentInstance *>,std::allocator<OpaqueAudioComponentInstance *>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

void STS_N::SetPropertyOnSpatializers(uint64_t a1, const __CFString *a2, void *value, uint64_t a4)
{
  __CFDictionary *v8;
  float32x4_t *v9;
  __int128 v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  const __CFData *v14;
  float32x4_t v15;
  uint64_t **i;
  OSStatus v17;
  OSStatus v18;
  NSObject *v19;
  OSStatus v20;
  OSStatus v21;
  NSObject *v22;
  const __CFNumber *v23;
  AudioUnitScope v24;
  __int128 v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  const __CFData *v29;
  float32x4_t v30;
  uint64_t **v31;
  uint64_t v32;
  AudioUnitParameterValue v33;
  OSStatus v34;
  OSStatus v35;
  NSObject *v36;
  OSStatus v37;
  OSStatus v38;
  NSObject *v39;
  OSStatus v40;
  OSStatus v41;
  NSObject *v42;
  OSStatus v43;
  OSStatus v44;
  NSObject *v45;
  int v46;
  int v47;
  int v48;
  uint64_t **k;
  OSStatus v50;
  OSStatus v51;
  NSObject *v52;
  uint64_t v53;
  UInt32 Length;
  void **p_inData;
  int v56;
  NSObject *v57;
  uint64_t **j;
  OSStatus v59;
  OSStatus v60;
  NSObject *v61;
  NSObject *v62;
  float v63;
  uint64_t v64;
  float v65;
  __int32 v66;
  __int128 inData;
  UInt8 valuePtr[16];
  float32x4_t v69;
  float32x4_t v70;
  float32x4_t v71;
  void *v72;
  uint8_t buf[4];
  const char *v74;
  __int16 v75;
  int v76;
  __int16 v77;
  OSStatus v78;
  _BYTE buffer[32];
  __int128 v80;
  float32x4_t v81;
  uint64_t v82;
  CFRange v83;
  CFRange v84;
  CFRange v85;
  CFRange v86;

  v82 = *MEMORY[0x24BDAC8D0];
  v72 = value;
  v8 = *(__CFDictionary **)(a1 + 104);
  if (value)
    CFDictionarySetValue(v8, a2, value);
  else
    CFDictionaryRemoveValue(v8, a2);
  if (!a4)
    a4 = a1 + 64;
  if (!*(_QWORD *)(a4 + 24))
    return;
  if (CFEqual(a2, CFSTR("ListenerPose")))
  {
    v9 = (float32x4_t *)MEMORY[0x24BDAEE00];
    if (value)
    {
      v83.location = 0;
      v83.length = 64;
      CFDataGetBytes((CFDataRef)value, v83, buffer);
    }
    else
    {
      v10 = *(_OWORD *)(MEMORY[0x24BDAEE00] + 16);
      *(_OWORD *)buffer = *MEMORY[0x24BDAEE00];
      *(_OWORD *)&buffer[16] = v10;
      v11 = *(float32x4_t *)(MEMORY[0x24BDAEE00] + 48);
      v80 = *(_OWORD *)(MEMORY[0x24BDAEE00] + 32);
      v81 = v11;
    }
    v12 = v9[1];
    *(float32x4_t *)valuePtr = *v9;
    v69 = v12;
    v13 = v9[3];
    v70 = v9[2];
    v71 = v13;
    v14 = (const __CFData *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 104), CFSTR("SourcePose"));
    if (v14)
    {
      v85.location = 0;
      v85.length = 64;
      CFDataGetBytes(v14, v85, valuePtr);
    }
    STS_N_CalculateQuaternionOrientationFromTransform(buffer, &inData);
    v15 = vsubq_f32(v71, v81);
    HIDWORD(v64) = v15.i32[0];
    v65 = -v15.f32[2];
    v66 = v15.i32[1];
    for (i = *(uint64_t ***)(a4 + 16); i; i = (uint64_t **)*i)
    {
      v17 = AudioUnitSetProperty((AudioUnit)i[2], 0xC1Eu, 0, 0, &inData, 0x10u);
      if (v17)
      {
        v18 = v17;
        STS_N_Log();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v74 = "SetPropertyOnSpatializers";
          v75 = 1024;
          v76 = 399;
          v77 = 1024;
          v78 = v18;
          _os_log_error_impl(&dword_2290E3000, v19, OS_LOG_TYPE_ERROR, "%s:%d error: %d", buf, 0x18u);
        }

      }
      v20 = AudioUnitSetProperty((AudioUnit)i[2], 0xC2Bu, 0, 0, (char *)&v64 + 4, 0xCu);
      if (v20)
      {
        v21 = v20;
        STS_N_Log();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v74 = "SetPropertyOnSpatializers";
          v75 = 1024;
          v76 = 406;
          v77 = 1024;
          v78 = v21;
          _os_log_error_impl(&dword_2290E3000, v22, OS_LOG_TYPE_ERROR, "%s:%d error: %d", buf, 0x18u);
        }

      }
    }
    return;
  }
  if (CFEqual(a2, CFSTR("SourcePose")))
  {
    if (value)
    {
      v84.location = 0;
      v84.length = 64;
      CFDataGetBytes((CFDataRef)value, v84, buffer);
    }
    else
    {
      v25 = *(_OWORD *)(MEMORY[0x24BDAEE00] + 16);
      *(_OWORD *)buffer = *MEMORY[0x24BDAEE00];
      *(_OWORD *)&buffer[16] = v25;
      v26 = *(float32x4_t *)(MEMORY[0x24BDAEE00] + 48);
      v80 = *(_OWORD *)(MEMORY[0x24BDAEE00] + 32);
      v81 = v26;
    }
    v27 = *(float32x4_t *)(MEMORY[0x24BDAEE00] + 16);
    *(_OWORD *)valuePtr = *MEMORY[0x24BDAEE00];
    v69 = v27;
    v28 = *(float32x4_t *)(MEMORY[0x24BDAEE00] + 48);
    v70 = *(float32x4_t *)(MEMORY[0x24BDAEE00] + 32);
    v71 = v28;
    v29 = (const __CFData *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 104), CFSTR("ListenerPose"));
    if (v29)
    {
      v86.location = 0;
      v86.length = 64;
      CFDataGetBytes(v29, v86, valuePtr);
    }
    v64 = 0;
    v63 = 0.0;
    STS_N_CalculateAngularOrientationFromTransform((uint64_t)buffer, (float *)&v64, (float *)&v64 + 1, &v63);
    v30 = vsubq_f32(v81, v71);
    LODWORD(inData) = v30.i32[0];
    *((float *)&inData + 1) = -v30.f32[2];
    DWORD2(inData) = v30.i32[1];
    v31 = *(uint64_t ***)(a4 + 16);
    if (v31)
    {
      v32 = v64;
      v33 = v63;
      do
      {
        v34 = AudioUnitSetParameter((AudioUnit)v31[2], 0x16u, 1u, 0, *(AudioUnitParameterValue *)&v32, 0);
        if (v34)
        {
          v35 = v34;
          STS_N_Log();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v74 = "SetPropertyOnSpatializers";
            v75 = 1024;
            v76 = 433;
            v77 = 1024;
            v78 = v35;
            _os_log_error_impl(&dword_2290E3000, v36, OS_LOG_TYPE_ERROR, "%s:%d error: %d", buf, 0x18u);
          }

        }
        v37 = AudioUnitSetParameter((AudioUnit)v31[2], 0x17u, 1u, 0, *((AudioUnitParameterValue *)&v32 + 1), 0);
        if (v37)
        {
          v38 = v37;
          STS_N_Log();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v74 = "SetPropertyOnSpatializers";
            v75 = 1024;
            v76 = 434;
            v77 = 1024;
            v78 = v38;
            _os_log_error_impl(&dword_2290E3000, v39, OS_LOG_TYPE_ERROR, "%s:%d error: %d", buf, 0x18u);
          }

        }
        v40 = AudioUnitSetParameter((AudioUnit)v31[2], 0x18u, 1u, 0, v33, 0);
        if (v40)
        {
          v41 = v40;
          STS_N_Log();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v74 = "SetPropertyOnSpatializers";
            v75 = 1024;
            v76 = 435;
            v77 = 1024;
            v78 = v41;
            _os_log_error_impl(&dword_2290E3000, v42, OS_LOG_TYPE_ERROR, "%s:%d error: %d", buf, 0x18u);
          }

        }
        v43 = AudioUnitSetProperty((AudioUnit)v31[2], 0xC2Bu, 0, 0, &inData, 0xCu);
        if (v43)
        {
          v44 = v43;
          STS_N_Log();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v74 = "SetPropertyOnSpatializers";
            v75 = 1024;
            v76 = 442;
            v77 = 1024;
            v78 = v44;
            _os_log_error_impl(&dword_2290E3000, v45, OS_LOG_TYPE_ERROR, "%s:%d error: %d", buf, 0x18u);
          }

        }
        v31 = (uint64_t **)*v31;
      }
      while (v31);
    }
    return;
  }
  *(_DWORD *)buf = 0;
  if (STS_N::GetPropertyInfo(__CFString const*,unsigned int *,unsigned int *,unsigned char *)::onceToken != -1)
    dispatch_once(&STS_N::GetPropertyInfo(__CFString const*,unsigned int *,unsigned int *,unsigned char *)::onceToken, &__block_literal_global_31);
  v23 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)STS_N::GetPropertyInfo(__CFString const*,unsigned int *,unsigned int *,unsigned char *)::globalPropertyMap, a2);
  if (v23 && CFNumberGetValue(v23, kCFNumberSInt32Type, buf))
  {
    if (CFEqual(a2, CFSTR("ReverbRoomType")))
      goto LABEL_32;
    if (CFEqual(a2, CFSTR("SourceMode")))
    {
      v24 = 1;
      goto LABEL_94;
    }
    if (CFEqual(a2, CFSTR("SoundStageSize")) || CFEqual(a2, CFSTR("SoundStageTransitionTime")))
    {
LABEL_32:
      v24 = 0;
LABEL_94:
      LOBYTE(inData) = 0;
      *(_DWORD *)valuePtr = 0;
      v53 = (*(_DWORD *)buf - 3200);
      if (!value)
      {
        Length = v53 < 0xA;
        if (v53 >= 0xA)
          p_inData = 0;
        else
          p_inData = (void **)&inData;
        switch(*(_DWORD *)buf)
        {
          case 0xC80:
            v56 = 3201;
            goto LABEL_113;
          case 0xC82:
            v56 = 3203;
            goto LABEL_113;
          case 0xC84:
            v56 = 3205;
            goto LABEL_113;
          case 0xC86:
            v56 = 3207;
            goto LABEL_113;
          case 0xC88:
            v56 = 3209;
LABEL_113:
            *(_DWORD *)buf = v56;
            break;
          default:
            goto LABEL_114;
        }
        goto LABEL_114;
      }
      if (v53 > 0x29)
        goto LABEL_108;
      if (((1 << (buf[0] + 0x80)) & 0x8000000155) != 0)
      {
        Length = 8;
        p_inData = &v72;
        goto LABEL_114;
      }
      if (v53 != 41)
      {
LABEL_108:
        p_inData = (void **)CFDataGetBytePtr((CFDataRef)value);
        Length = CFDataGetLength((CFDataRef)value);
LABEL_114:
        for (j = *(uint64_t ***)(a4 + 16); j; j = (uint64_t **)*j)
        {
          v59 = AudioUnitSetProperty((AudioUnit)j[2], *(AudioUnitPropertyID *)buf, v24, 0, p_inData, Length);
          if (v59)
          {
            v60 = v59;
            STS_N_Log();
            v61 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buffer = 136315650;
              *(_QWORD *)&buffer[4] = "SetPropertyOnSpatializers";
              *(_WORD *)&buffer[12] = 1024;
              *(_DWORD *)&buffer[14] = 647;
              *(_WORD *)&buffer[18] = 1024;
              *(_DWORD *)&buffer[20] = v60;
              _os_log_error_impl(&dword_2290E3000, v61, OS_LOG_TYPE_ERROR, "%s:%d error: %d", buffer, 0x18u);
            }

          }
        }
        return;
      }
      p_inData = (void **)valuePtr;
      if (CFNumberGetValue((CFNumberRef)value, kCFNumberFloat32Type, valuePtr))
      {
        Length = 4;
        goto LABEL_114;
      }
      STS_N_Log();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        goto LABEL_127;
      goto LABEL_104;
    }
    v24 = CFEqual(a2, CFSTR("RoomConfiguration")) == 0;
    v48 = v24;
    goto LABEL_83;
  }
  if (!CFStringGetCString(a2, (char *)valuePtr, 5, 0x8000100u))
    return;
  v46 = strtoul((const char *)valuePtr, 0, 16);
  *(_DWORD *)buf = v46;
  if (v46 > 3099)
  {
    if ((v46 - 3200) <= 9)
    {
      if (((1 << (v46 + 0x80)) & 0x3CF) != 0)
        goto LABEL_82;
LABEL_80:
      v48 = 0;
      v24 = 1;
      goto LABEL_83;
    }
    if ((v46 - 3100) <= 9)
    {
      v47 = 1 << (v46 - 28);
      if ((v47 & 0x238) != 0)
        goto LABEL_80;
      if ((v47 & 0x43) != 0)
        goto LABEL_82;
    }
    if (v46 == 4600)
      goto LABEL_82;
LABEL_123:
    STS_N_Log();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buffer = 67109120;
      *(_DWORD *)&buffer[4] = *(_DWORD *)buf;
      _os_log_error_impl(&dword_2290E3000, v62, OS_LOG_TYPE_ERROR, "setting unknown property/parameter %u", buffer, 8u);
    }

    return;
  }
  if (v46 > 0x25)
    goto LABEL_81;
  if (((1 << v46) & 0x801C00DFFLL) != 0)
  {
    v24 = 1;
LABEL_73:
    v48 = 1;
    goto LABEL_83;
  }
  if (((1 << v46) & 0x3FC200) != 0)
  {
    v24 = 0;
    goto LABEL_73;
  }
  if (((1 << v46) & 0x2004000000) == 0)
  {
LABEL_81:
    if ((v46 - 3000) <= 0xD && ((1 << (v46 + 72)) & 0x2429) != 0)
      goto LABEL_80;
    if (v46 != 1005)
      goto LABEL_123;
  }
LABEL_82:
  v24 = 0;
  v48 = 0;
LABEL_83:
  if (!value || !v48)
  {
    if (v48)
      return;
    goto LABEL_94;
  }
  *(_DWORD *)valuePtr = 0;
  if (!CFNumberGetValue((CFNumberRef)value, kCFNumberFloatType, valuePtr))
  {
    STS_N_Log();
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
LABEL_127:
      *(_DWORD *)buffer = 67109378;
      *(_DWORD *)&buffer[4] = *(_DWORD *)buf;
      *(_WORD *)&buffer[8] = 2112;
      *(_QWORD *)&buffer[10] = value;
      _os_log_error_impl(&dword_2290E3000, v57, OS_LOG_TYPE_ERROR, "failed to get value for propertyID %u from %@", buffer, 0x12u);
    }
LABEL_104:

    return;
  }
  for (k = *(uint64_t ***)(a4 + 16); k; k = (uint64_t **)*k)
  {
    v50 = AudioUnitSetParameter((AudioUnit)k[2], *(AudioUnitParameterID *)buf, v24, 0, *(AudioUnitParameterValue *)valuePtr, 0);
    if (v50)
    {
      v51 = v50;
      STS_N_Log();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buffer = 136315650;
        *(_QWORD *)&buffer[4] = "SetPropertyOnSpatializers";
        *(_WORD *)&buffer[12] = 1024;
        *(_DWORD *)&buffer[14] = 538;
        *(_WORD *)&buffer[18] = 1024;
        *(_DWORD *)&buffer[20] = v51;
        _os_log_error_impl(&dword_2290E3000, v52, OS_LOG_TYPE_ERROR, "%s:%d error: %d", buffer, 0x18u);
      }

    }
  }
}

void ___ZN5STS_N15GetPropertyInfoEPK10__CFStringPjS3_Ph_block_invoke()
{
  const __CFAllocator *v0;
  CFNumberRef v1;
  CFNumberRef v2;
  CFNumberRef v3;
  CFNumberRef v4;
  CFNumberRef v5;
  CFNumberRef v6;
  CFNumberRef v7;
  CFNumberRef v8;
  CFNumberRef v9;
  int valuePtr;

  v0 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  STS_N::GetPropertyInfo(__CFString const*,unsigned int *,unsigned int *,unsigned char *)::globalPropertyMap = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 5, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
  valuePtr = 3;
  v1 = CFNumberCreate(v0, kCFNumberSInt32Type, &valuePtr);
  CFDictionaryAddValue((CFMutableDictionaryRef)STS_N::GetPropertyInfo(__CFString const*,unsigned int *,unsigned int *,unsigned char *)::globalPropertyMap, CFSTR("Gain"), v1);
  CFRelease(v1);
  valuePtr = 11;
  v2 = CFNumberCreate(v0, kCFNumberSInt32Type, &valuePtr);
  CFDictionaryAddValue((CFMutableDictionaryRef)STS_N::GetPropertyInfo(__CFString const*,unsigned int *,unsigned int *,unsigned char *)::globalPropertyMap, CFSTR("ObstructionAttenuation"), v2);
  CFRelease(v2);
  valuePtr = 10;
  v3 = CFNumberCreate(v0, kCFNumberSInt32Type, &valuePtr);
  CFDictionaryAddValue((CFMutableDictionaryRef)STS_N::GetPropertyInfo(__CFString const*,unsigned int *,unsigned int *,unsigned char *)::globalPropertyMap, CFSTR("OcclusionAttenuation"), v3);
  CFRelease(v3);
  valuePtr = 35;
  v4 = CFNumberCreate(v0, kCFNumberSInt32Type, &valuePtr);
  CFDictionaryAddValue((CFMutableDictionaryRef)STS_N::GetPropertyInfo(__CFString const*,unsigned int *,unsigned int *,unsigned char *)::globalPropertyMap, CFSTR("ReverbBlend"), v4);
  CFRelease(v4);
  valuePtr = 3005;
  v5 = CFNumberCreate(v0, kCFNumberSInt32Type, &valuePtr);
  CFDictionaryAddValue((CFMutableDictionaryRef)STS_N::GetPropertyInfo(__CFString const*,unsigned int *,unsigned int *,unsigned char *)::globalPropertyMap, CFSTR("SourceMode"), v5);
  CFRelease(v5);
  valuePtr = 3240;
  v6 = CFNumberCreate(v0, kCFNumberSInt32Type, &valuePtr);
  CFDictionaryAddValue((CFMutableDictionaryRef)STS_N::GetPropertyInfo(__CFString const*,unsigned int *,unsigned int *,unsigned char *)::globalPropertyMap, CFSTR("SoundStageSize"), v6);
  CFRelease(v6);
  valuePtr = 3241;
  v7 = CFNumberCreate(v0, kCFNumberSInt32Type, &valuePtr);
  CFDictionaryAddValue((CFMutableDictionaryRef)STS_N::GetPropertyInfo(__CFString const*,unsigned int *,unsigned int *,unsigned char *)::globalPropertyMap, CFSTR("SoundStageTransitionTime"), v7);
  CFRelease(v7);
  valuePtr = 3239;
  v8 = CFNumberCreate(v0, kCFNumberSInt32Type, &valuePtr);
  CFDictionaryAddValue((CFMutableDictionaryRef)STS_N::GetPropertyInfo(__CFString const*,unsigned int *,unsigned int *,unsigned char *)::globalPropertyMap, CFSTR("RoomConfiguration"), v8);
  CFRelease(v8);
  valuePtr = 10;
  v9 = CFNumberCreate(v0, kCFNumberSInt32Type, &valuePtr);
  CFDictionaryAddValue((CFMutableDictionaryRef)STS_N::GetPropertyInfo(__CFString const*,unsigned int *,unsigned int *,unsigned char *)::globalPropertyMap, CFSTR("ReverbRoomType"), v9);
  CFRelease(v9);
}

void std::__hash_table<OpaqueAudioComponentInstance *,std::hash<OpaqueAudioComponentInstance *>,std::equal_to<OpaqueAudioComponentInstance *>,std::allocator<OpaqueAudioComponentInstance *>>::__node_insert_multi(uint64_t a1, _QWORD *a2)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  float v9;
  float v10;
  _BOOL8 v11;
  unint64_t v12;
  unint64_t v13;
  int8x8_t prime;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  uint8x8_t v20;
  unint64_t v21;
  uint8x8_t v22;
  uint64_t v23;
  _QWORD *i;
  unint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint8x8_t v28;
  unint64_t v29;
  _QWORD *v30;
  int v31;
  _QWORD *v32;
  unint64_t v33;
  unint64_t v34;
  _BOOL4 v35;
  int v36;
  unint64_t v37;
  unint64_t v38;
  void *v39;

  v4 = a2[2];
  v5 = HIDWORD(v4);
  v6 = 0x9DDFEA08EB382D69 * (((8 * v4) + 8) ^ HIDWORD(v4));
  v7 = 0x9DDFEA08EB382D69
     * ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
  a2[1] = v7;
  v8 = *(_QWORD *)(a1 + 8);
  v9 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v10 = *(float *)(a1 + 32);
  if (!v8 || (float)(v10 * (float)v8) < v9)
  {
    v11 = 1;
    if (v8 >= 3)
      v11 = (v8 & (v8 - 1)) != 0;
    v12 = v11 | (2 * v8);
    v13 = vcvtps_u32_f32(v9 / v10);
    if (v12 <= v13)
      prime = (int8x8_t)v13;
    else
      prime = (int8x8_t)v12;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      v8 = *(_QWORD *)(a1 + 8);
    }
    if (*(_QWORD *)&prime > v8)
      goto LABEL_92;
    if (*(_QWORD *)&prime >= v8)
      goto LABEL_43;
    v21 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (v8 < 3 || (v22 = (uint8x8_t)vcnt_s8((int8x8_t)v8), v22.i16[0] = vaddlv_u8(v22), v22.u32[0] > 1uLL))
    {
      v21 = std::__next_prime(v21);
    }
    else
    {
      v23 = 1 << -(char)__clz(v21 - 1);
      if (v21 >= 2)
        v21 = v23;
    }
    if (*(_QWORD *)&prime <= v21)
      prime = (int8x8_t)v21;
    if (*(_QWORD *)&prime >= v8)
    {
      v8 = *(_QWORD *)(a1 + 8);
      goto LABEL_43;
    }
    if (prime)
    {
LABEL_92:
      if (*(_QWORD *)&prime >> 61)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v15 = operator new(8 * *(_QWORD *)&prime);
      v16 = *(void **)a1;
      *(_QWORD *)a1 = v15;
      if (v16)
        operator delete(v16);
      v17 = 0;
      *(int8x8_t *)(a1 + 8) = prime;
      do
        *(_QWORD *)(*(_QWORD *)a1 + 8 * v17++) = 0;
      while (*(_QWORD *)&prime != v17);
      v18 = *(_QWORD **)(a1 + 16);
      if (v18)
      {
        v19 = v18[1];
        v20 = (uint8x8_t)vcnt_s8(prime);
        v20.i16[0] = vaddlv_u8(v20);
        if (v20.u32[0] > 1uLL)
        {
          if (v19 >= *(_QWORD *)&prime)
            v19 %= *(_QWORD *)&prime;
        }
        else
        {
          v19 &= *(_QWORD *)&prime - 1;
        }
        *(_QWORD *)(*(_QWORD *)a1 + 8 * v19) = a1 + 16;
        for (i = (_QWORD *)*v18; *v18; i = (_QWORD *)*v18)
        {
          v25 = i[1];
          if (v20.u32[0] > 1uLL)
          {
            if (v25 >= *(_QWORD *)&prime)
              v25 %= *(_QWORD *)&prime;
          }
          else
          {
            v25 &= *(_QWORD *)&prime - 1;
          }
          if (v25 == v19)
          {
            v18 = i;
          }
          else
          {
            v26 = i;
            if (*(_QWORD *)(*(_QWORD *)a1 + 8 * v25))
            {
              do
              {
                v27 = v26;
                v26 = (_QWORD *)*v26;
              }
              while (v26 && i[2] == v26[2]);
              *v18 = v26;
              *v27 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v25);
              **(_QWORD **)(*(_QWORD *)a1 + 8 * v25) = i;
            }
            else
            {
              *(_QWORD *)(*(_QWORD *)a1 + 8 * v25) = v18;
              v18 = i;
              v19 = v25;
            }
          }
        }
      }
      v8 = (unint64_t)prime;
    }
    else
    {
      v39 = *(void **)a1;
      *(_QWORD *)a1 = 0;
      if (v39)
        operator delete(v39);
      v8 = 0;
      *(_QWORD *)(a1 + 8) = 0;
    }
  }
LABEL_43:
  v28 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
  v28.i16[0] = vaddlv_u8(v28);
  if (v28.u32[0] > 1uLL)
  {
    v29 = v7;
    if (v8 <= v7)
      v29 = v7 % v8;
  }
  else
  {
    v29 = (v8 - 1) & v7;
  }
  v30 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v29);
  if (v30)
  {
    v31 = 0;
    do
    {
      v32 = v30;
      v30 = (_QWORD *)*v30;
      if (!v30)
        break;
      v33 = v30[1];
      if (v28.u32[0] > 1uLL)
      {
        v34 = v30[1];
        if (v33 >= v8)
          v34 = v33 % v8;
      }
      else
      {
        v34 = v33 & (v8 - 1);
      }
      if (v34 != v29)
        break;
      v35 = v33 == v7 && v30[2] == a2[2];
      v36 = v31 & !v35;
      v31 |= v35;
    }
    while (v36 != 1);
  }
  else
  {
    v32 = 0;
  }
  v37 = a2[1];
  if (v28.u32[0] > 1uLL)
  {
    if (v37 >= v8)
      v37 %= v8;
  }
  else
  {
    v37 &= v8 - 1;
  }
  if (!v32)
  {
    *a2 = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = a2;
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v37) = a1 + 16;
    if (!*a2)
      goto LABEL_79;
    v38 = *(_QWORD *)(*a2 + 8);
    if (v28.u32[0] > 1uLL)
    {
      if (v38 >= v8)
        v38 %= v8;
    }
    else
    {
      v38 &= v8 - 1;
    }
LABEL_78:
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v38) = a2;
    goto LABEL_79;
  }
  *a2 = *v32;
  *v32 = a2;
  if (*a2)
  {
    v38 = *(_QWORD *)(*a2 + 8);
    if (v28.u32[0] > 1uLL)
    {
      if (v38 >= v8)
        v38 %= v8;
    }
    else
    {
      v38 &= v8 - 1;
    }
    if (v38 != v37)
      goto LABEL_78;
  }
LABEL_79:
  ++*(_QWORD *)(a1 + 24);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t STS_N::CanDeleteSpatializerInfo(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  unsigned __int8 *v11;
  unsigned __int8 *v12;
  unsigned __int8 *i;

  if (*((_QWORD *)a2 + 6) || *((_QWORD *)a2 + 11))
    return 0;
  result = objc_msgSend(*((id *)a2 + 18), "isEmpty");
  if ((_DWORD)result)
  {
    v5 = a2[23];
    if ((v5 & 0x80u) == 0)
      v6 = a2[23];
    else
      v6 = *((_QWORD *)a2 + 1);
    v7 = *(unsigned __int8 *)(a1 + 215);
    v8 = (char)v7;
    if ((v7 & 0x80u) != 0)
      v7 = *(_QWORD *)(a1 + 200);
    if (v6 == v7)
    {
      v11 = *(unsigned __int8 **)(a1 + 192);
      v10 = (unsigned __int8 *)(a1 + 192);
      v9 = v11;
      if (v8 >= 0)
        v12 = v10;
      else
        v12 = v9;
      if ((v5 & 0x80) == 0)
      {
        if (a2[23])
        {
          for (i = a2; *i == *v12; ++i)
          {
            ++v12;
            if (!--v5)
              return CFDictionaryGetCount(*((CFDictionaryRef *)a2 + 13)) == 0;
          }
          return 1;
        }
        return CFDictionaryGetCount(*((CFDictionaryRef *)a2 + 13)) == 0;
      }
      if (!memcmp(*(const void **)a2, v12, *((_QWORD *)a2 + 1)))
        return CFDictionaryGetCount(*((CFDictionaryRef *)a2 + 13)) == 0;
    }
    return 1;
  }
  return result;
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>>>::remove(uint64_t result, _QWORD *a2, _QWORD *a3)
{
  int8x8_t v3;
  unint64_t v4;
  uint8x8_t v5;
  _QWORD *v6;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v3 = (int8x8_t)a2[1];
  v4 = a3[1];
  v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(_QWORD *)&v3)
      v4 %= *(_QWORD *)&v3;
  }
  else
  {
    v4 &= *(_QWORD *)&v3 - 1;
  }
  v6 = *(_QWORD **)(*a2 + 8 * v4);
  do
  {
    v7 = v6;
    v6 = (_QWORD *)*v6;
  }
  while (v6 != a3);
  if (v7 == a2 + 2)
    goto LABEL_18;
  v8 = v7[1];
  if (v5.u32[0] > 1uLL)
  {
    if (v8 >= *(_QWORD *)&v3)
      v8 %= *(_QWORD *)&v3;
  }
  else
  {
    v8 &= *(_QWORD *)&v3 - 1;
  }
  if (v8 != v4)
  {
LABEL_18:
    if (!*a3)
      goto LABEL_19;
    v9 = *(_QWORD *)(*a3 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v9 >= *(_QWORD *)&v3)
        v9 %= *(_QWORD *)&v3;
    }
    else
    {
      v9 &= *(_QWORD *)&v3 - 1;
    }
    if (v9 != v4)
LABEL_19:
      *(_QWORD *)(*a2 + 8 * v4) = 0;
  }
  v10 = *a3;
  if (*a3)
  {
    v11 = *(_QWORD *)(v10 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v11 >= *(_QWORD *)&v3)
        v11 %= *(_QWORD *)&v3;
    }
    else
    {
      v11 &= *(_QWORD *)&v3 - 1;
    }
    if (v11 != v4)
    {
      *(_QWORD *)(*a2 + 8 * v11) = v7;
      v10 = *a3;
    }
  }
  *v7 = v10;
  *a3 = 0;
  --a2[3];
  *(_QWORD *)result = a3;
  *(_QWORD *)(result + 8) = a2 + 2;
  *(_BYTE *)(result + 16) = 1;
  return result;
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,void *>>>>::reset[abi:ne180100](uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v1)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::unique_ptr<STS_N::PerLabelInfo>>,0>((uint64_t)v1 + 16);
    operator delete(v1);
  }
}

unint64_t std::__string_hash<char>::operator()[abi:ne180100](uint64_t a1)
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

BOOL std::equal_to<std::string>::operator()[abi:ne180100](unsigned __int8 *a1, unsigned __int8 *a2)
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

uint64_t std::pair<std::string const,std::unique_ptr<STS_N::PerLabelInfo>>::~pair(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = 0;
  if (v2)
    std::default_delete<STS_N::PerLabelInfo>::operator()[abi:ne180100](v2);
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  return a1;
}

const void **applesauce::CF::ObjectRef<__CFDictionary *>::~ObjectRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

void std::__hash_table<OpaqueFigSTS *,std::hash<OpaqueFigSTS *>,std::equal_to<OpaqueFigSTS *>,std::allocator<OpaqueFigSTS *>>::__emplace_unique_key_args<OpaqueFigSTS *,OpaqueFigSTS * const&>(float *a1, unint64_t a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint8x8_t v10;
  _QWORD *v11;
  _QWORD *i;
  unint64_t v13;
  _QWORD *v14;
  float v15;
  float v16;
  _BOOL8 v17;
  unint64_t v18;
  unint64_t v19;
  int8x8_t prime;
  void *v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD *v24;
  unint64_t v25;
  uint8x8_t v26;
  unint64_t v27;
  uint8x8_t v28;
  uint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  unint64_t v34;
  _QWORD *v35;

  v6 = 0x9DDFEA08EB382D69 * (((8 * a2) + 8) ^ HIDWORD(a2));
  v7 = 0x9DDFEA08EB382D69 * (HIDWORD(a2) ^ (v6 >> 47) ^ v6);
  v8 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
  v9 = *((_QWORD *)a1 + 1);
  if (v9)
  {
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      v3 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
      if (v8 >= v9)
        v3 = v8 % v9;
    }
    else
    {
      v3 = v8 & (v9 - 1);
    }
    v11 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
    if (v11)
    {
      for (i = (_QWORD *)*v11; i; i = (_QWORD *)*i)
      {
        v13 = i[1];
        if (v13 == v8)
        {
          if (i[2] == a2)
            return;
        }
        else
        {
          if (v10.u32[0] > 1uLL)
          {
            if (v13 >= v9)
              v13 %= v9;
          }
          else
          {
            v13 &= v9 - 1;
          }
          if (v13 != v3)
            break;
        }
      }
    }
  }
  v14 = operator new(0x18uLL);
  *v14 = 0;
  v14[1] = v8;
  v14[2] = a3;
  v15 = (float)(unint64_t)(*((_QWORD *)a1 + 3) + 1);
  v16 = a1[8];
  if (!v9 || (float)(v16 * (float)v9) < v15)
  {
    v17 = 1;
    if (v9 >= 3)
      v17 = (v9 & (v9 - 1)) != 0;
    v18 = v17 | (2 * v9);
    v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19)
      prime = (int8x8_t)v19;
    else
      prime = (int8x8_t)v18;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      v9 = *((_QWORD *)a1 + 1);
    }
    if (*(_QWORD *)&prime > v9)
      goto LABEL_30;
    if (*(_QWORD *)&prime < v9)
    {
      v27 = vcvtps_u32_f32((float)*((unint64_t *)a1 + 3) / a1[8]);
      if (v9 < 3 || (v28 = (uint8x8_t)vcnt_s8((int8x8_t)v9), v28.i16[0] = vaddlv_u8(v28), v28.u32[0] > 1uLL))
      {
        v27 = std::__next_prime(v27);
      }
      else
      {
        v29 = 1 << -(char)__clz(v27 - 1);
        if (v27 >= 2)
          v27 = v29;
      }
      if (*(_QWORD *)&prime <= v27)
        prime = (int8x8_t)v27;
      if (*(_QWORD *)&prime >= v9)
      {
        v9 = *((_QWORD *)a1 + 1);
      }
      else
      {
        if (prime)
        {
LABEL_30:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v21 = operator new(8 * *(_QWORD *)&prime);
          v22 = *(_QWORD **)a1;
          *(_QWORD *)a1 = v21;
          if (v22)
            operator delete(v22);
          v23 = 0;
          *((int8x8_t *)a1 + 1) = prime;
          do
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v23++) = 0;
          while (*(_QWORD *)&prime != v23);
          v24 = (_QWORD *)*((_QWORD *)a1 + 2);
          if (v24)
          {
            v25 = v24[1];
            v26 = (uint8x8_t)vcnt_s8(prime);
            v26.i16[0] = vaddlv_u8(v26);
            if (v26.u32[0] > 1uLL)
            {
              if (v25 >= *(_QWORD *)&prime)
                v25 %= *(_QWORD *)&prime;
            }
            else
            {
              v25 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v25) = a1 + 4;
            v30 = (_QWORD *)*v24;
            if (*v24)
            {
              do
              {
                v31 = v30[1];
                if (v26.u32[0] > 1uLL)
                {
                  if (v31 >= *(_QWORD *)&prime)
                    v31 %= *(_QWORD *)&prime;
                }
                else
                {
                  v31 &= *(_QWORD *)&prime - 1;
                }
                if (v31 != v25)
                {
                  if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v31))
                  {
                    *(_QWORD *)(*(_QWORD *)a1 + 8 * v31) = v24;
                    goto LABEL_55;
                  }
                  *v24 = *v30;
                  *v30 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v31);
                  **(_QWORD **)(*(_QWORD *)a1 + 8 * v31) = v30;
                  v30 = v24;
                }
                v31 = v25;
LABEL_55:
                v24 = v30;
                v30 = (_QWORD *)*v30;
                v25 = v31;
              }
              while (v30);
            }
          }
          v9 = (unint64_t)prime;
          goto LABEL_59;
        }
        v35 = *(_QWORD **)a1;
        *(_QWORD *)a1 = 0;
        if (v35)
          operator delete(v35);
        v9 = 0;
        *((_QWORD *)a1 + 1) = 0;
      }
    }
LABEL_59:
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9)
        v3 = v8 % v9;
      else
        v3 = v8;
    }
    else
    {
      v3 = (v9 - 1) & v8;
    }
  }
  v32 = *(_QWORD **)a1;
  v33 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v33)
  {
    *v14 = *v33;
LABEL_72:
    *v33 = v14;
    goto LABEL_73;
  }
  *v14 = *((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = v14;
  v32[v3] = a1 + 4;
  if (*v14)
  {
    v34 = *(_QWORD *)(*v14 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v34 >= v9)
        v34 %= v9;
    }
    else
    {
      v34 &= v9 - 1;
    }
    v33 = (_QWORD *)(*(_QWORD *)a1 + 8 * v34);
    goto LABEL_72;
  }
LABEL_73:
  ++*((_QWORD *)a1 + 3);
}

void sub_2290E94E4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void STS_N::SetSoundStageTransitionDurationOnSpatializers(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  STS_N::SetPropertyOnSpatializers(a1, CFSTR("SoundStageTransitionTime"), v2, 0);

}

void sub_2290E954C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void STS_N::SetSoundStageSizeOnSpatializers(uint64_t a1, int a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  uint8_t buf[16];

  if ((a2 - 1) >= 3)
  {
    if (a2)
    {
      a2 = 0;
    }
    else
    {
      STS_N_Log();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_2290E3000, v3, OS_LOG_TYPE_ERROR, "Attempted to convert kSTSSoundStageSize_Automatic to an AUSM AudioUnitPropertyID, but it does not exist. Defaulting to kSTSSoundStageSize_Large", buf, 2u);
      }

      a2 = 3;
    }
  }
  v5 = a2;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v5, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  STS_N::SetPropertyOnSpatializers(a1, CFSTR("SoundStageSize"), v4, 0);

}

void sub_2290E9624(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void STS_N::SetPropertyForLabel(os_unfair_lock_t lock, unint64_t a2, void *a3, const __CFString *a4, void *a5)
{
  void *v7;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  CFTypeRef v13;
  uint64_t *i;
  uint64_t v15;
  uint64_t v16;
  uint64_t os_unfair_lock_opaque_high;
  int v18;
  const void **v19;
  os_unfair_lock_t v20;

  v7 = a3;
  if (!a3)
  {
    getkFigSTSLabel_Global();
    v7 = v10;
  }
  os_unfair_lock_lock(lock);
  v11 = STS_N::InfoForLabel((STS_N *)lock, v7);
  v12 = v11;
  if (a2)
    std::__hash_table<OpaqueFigSTS *,std::hash<OpaqueFigSTS *>,std::equal_to<OpaqueFigSTS *>,std::allocator<OpaqueFigSTS *>>::__emplace_unique_key_args<OpaqueFigSTS *,OpaqueFigSTS * const&>((float *)(v11 + 24), a2, a2);
  STS_N::SetPropertyOnSpatializers(v12, a4, a5, 0);
  getkFigSTSLabel_Global();
  if (CFEqual(v7, v13))
  {
    for (i = *(uint64_t **)&lock[6]._os_unfair_lock_opaque; i; i = (uint64_t *)*i)
    {
      v15 = *((unsigned __int8 *)i + 39);
      if ((v15 & 0x80u) == 0)
        v16 = *((unsigned __int8 *)i + 39);
      else
        v16 = i[3];
      os_unfair_lock_opaque_high = HIBYTE(lock[53]._os_unfair_lock_opaque);
      v18 = (char)os_unfair_lock_opaque_high;
      if ((os_unfair_lock_opaque_high & 0x80u) != 0)
        os_unfair_lock_opaque_high = *(_QWORD *)&lock[50]._os_unfair_lock_opaque;
      if (v16 != os_unfair_lock_opaque_high)
        goto LABEL_22;
      v19 = (const void **)(i + 2);
      if (v18 >= 0)
        v20 = lock + 48;
      else
        v20 = *(os_unfair_lock_t *)&lock[48]._os_unfair_lock_opaque;
      if ((v15 & 0x80) != 0)
      {
        if (memcmp(*v19, v20, i[3]))
          goto LABEL_22;
      }
      else if (*((_BYTE *)i + 39))
      {
        while (*(unsigned __int8 *)v19 == LOBYTE(v20->_os_unfair_lock_opaque))
        {
          v19 = (const void **)((char *)v19 + 1);
          v20 = (os_unfair_lock_t)((char *)v20 + 1);
          if (!--v15)
            goto LABEL_23;
        }
LABEL_22:
        STS_N::SetPropertyOnSpatializers(i[5], a4, a5, 0);
      }
LABEL_23:
      ;
    }
  }
  os_unfair_lock_unlock(lock);
}

void sub_2290E9774(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<OpaqueAudioComponentInstance *,std::pair<std::string,std::string>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<OpaqueAudioComponentInstance *,std::pair<std::string,std::string>>,void *>>>>::reset[abi:ne180100](uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v1)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<OpaqueAudioComponentInstance * const,std::pair<std::string,std::string>>,0>((uint64_t)v1 + 16);
    operator delete(v1);
  }
}

void STSUnregisterSpatializer(unint64_t a1)
{
  os_unfair_lock_s *v2;
  os_unfair_lock_s *v3;
  int8x8_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  unint64_t v9;
  uint64_t v10;
  os_unfair_lock_s **v11;
  os_unfair_lock_s *v12;
  uint64_t v13;
  unint64_t v14;
  os_unfair_lock_s *v15;
  os_unfair_lock_s *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  _QWORD v21[2];
  char v22;

  v2 = (os_unfair_lock_s *)CADeprecated::TSingleton<STS_N>::instance();
  if (a1)
  {
    v3 = v2;
    os_unfair_lock_lock(v2);
    v4 = *(int8x8_t *)&v3[14]._os_unfair_lock_opaque;
    if (v4)
    {
      v5 = 0x9DDFEA08EB382D69 * (((8 * a1) + 8) ^ HIDWORD(a1));
      v6 = 0x9DDFEA08EB382D69 * (HIDWORD(a1) ^ (v5 >> 47) ^ v5);
      v7 = 0x9DDFEA08EB382D69 * (v6 ^ (v6 >> 47));
      v8 = (uint8x8_t)vcnt_s8(v4);
      v8.i16[0] = vaddlv_u8(v8);
      if (v8.u32[0] > 1uLL)
      {
        v9 = v7;
        if (v7 >= *(_QWORD *)&v4)
          v9 = v7 % *(_QWORD *)&v4;
      }
      else
      {
        v9 = v7 & (*(_QWORD *)&v4 - 1);
      }
      v10 = *(_QWORD *)&v3[12]._os_unfair_lock_opaque;
      v11 = *(os_unfair_lock_s ***)(v10 + 8 * v9);
      if (v11)
      {
        v12 = *v11;
        if (v12)
        {
          v13 = *(_QWORD *)&v4 - 1;
          do
          {
            v14 = *(_QWORD *)&v12[2]._os_unfair_lock_opaque;
            if (v14 == v7)
            {
              if (*(_QWORD *)&v12[4]._os_unfair_lock_opaque == a1)
              {
                if (v8.u32[0] > 1uLL)
                {
                  if (v7 >= *(_QWORD *)&v4)
                    v7 %= *(_QWORD *)&v4;
                }
                else
                {
                  v7 &= v13;
                }
                v15 = *(os_unfair_lock_s **)(v10 + 8 * v7);
                do
                {
                  v16 = v15;
                  v15 = *(os_unfair_lock_s **)&v15->_os_unfair_lock_opaque;
                }
                while (v15 != v12);
                if (v16 == &v3[16])
                  goto LABEL_38;
                v17 = *(_QWORD *)&v16[2]._os_unfair_lock_opaque;
                if (v8.u32[0] > 1uLL)
                {
                  if (v17 >= *(_QWORD *)&v4)
                    v17 %= *(_QWORD *)&v4;
                }
                else
                {
                  v17 &= v13;
                }
                if (v17 != v7)
                {
LABEL_38:
                  if (!*(_QWORD *)&v12->_os_unfair_lock_opaque)
                    goto LABEL_39;
                  v18 = *(_QWORD *)(*(_QWORD *)&v12->_os_unfair_lock_opaque + 8);
                  if (v8.u32[0] > 1uLL)
                  {
                    if (v18 >= *(_QWORD *)&v4)
                      v18 %= *(_QWORD *)&v4;
                  }
                  else
                  {
                    v18 &= v13;
                  }
                  if (v18 != v7)
LABEL_39:
                    *(_QWORD *)(v10 + 8 * v7) = 0;
                }
                v19 = *(_QWORD *)&v12->_os_unfair_lock_opaque;
                if (*(_QWORD *)&v12->_os_unfair_lock_opaque)
                {
                  v20 = *(_QWORD *)(v19 + 8);
                  if (v8.u32[0] > 1uLL)
                  {
                    if (v20 >= *(_QWORD *)&v4)
                      v20 %= *(_QWORD *)&v4;
                  }
                  else
                  {
                    v20 &= v13;
                  }
                  if (v20 != v7)
                  {
                    *(_QWORD *)(*(_QWORD *)&v3[12]._os_unfair_lock_opaque + 8 * v20) = v16;
                    v19 = *(_QWORD *)&v12->_os_unfair_lock_opaque;
                  }
                }
                *(_QWORD *)&v16->_os_unfair_lock_opaque = v19;
                *(_QWORD *)&v12->_os_unfair_lock_opaque = 0;
                --*(_QWORD *)&v3[18]._os_unfair_lock_opaque;
                v21[0] = v12;
                v21[1] = v3 + 16;
                v22 = 1;
                std::unique_ptr<std::__hash_node<std::__hash_value_type<OpaqueAudioComponentInstance *,std::pair<std::string,std::string>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<OpaqueAudioComponentInstance *,std::pair<std::string,std::string>>,void *>>>>::reset[abi:ne180100]((uint64_t)v21);
                break;
              }
            }
            else
            {
              if (v8.u32[0] > 1uLL)
              {
                if (v14 >= *(_QWORD *)&v4)
                  v14 %= *(_QWORD *)&v4;
              }
              else
              {
                v14 &= v13;
              }
              if (v14 != v9)
                break;
            }
            v12 = *(os_unfair_lock_s **)&v12->_os_unfair_lock_opaque;
          }
          while (v12);
        }
      }
    }
    STS_N::UnregisterSpatializerUnderLock((STS_N *)v3, a1);
    os_unfair_lock_unlock(v3);
  }
}

void sub_2290E9A10(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t CADeprecated::TSingleton<STS_N>::instance()
{
  unint64_t v0;
  char v2;
  char **v3;
  char *v4;

  v0 = atomic_load(&CADeprecated::TSingleton<STS_N>::sOnce);
  if (v0 != -1)
  {
    v4 = &v2;
    v3 = &v4;
    std::__call_once(&CADeprecated::TSingleton<STS_N>::sOnce, &v3, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<CADeprecated::TSingleton<STS_N>::instance(void)::{lambda(void)#1} &&>>);
  }
  return CADeprecated::TSingleton<STS_N>::sInstance;
}

_QWORD *std::__call_once_proxy[abi:ne180100]<std::tuple<CADeprecated::TSingleton<STS_N>::instance(void)::{lambda(void)#1} &&>>()
{
  uint64_t v0;
  id v1;
  _QWORD *result;

  v0 = operator new();
  *(_DWORD *)v0 = 0;
  *(_OWORD *)(v0 + 8) = 0u;
  *(_OWORD *)(v0 + 24) = 0u;
  *(_DWORD *)(v0 + 40) = 1065353216;
  *(_OWORD *)(v0 + 48) = 0u;
  *(_OWORD *)(v0 + 64) = 0u;
  *(_DWORD *)(v0 + 80) = 1065353216;
  *(_BYTE *)(v0 + 96) = 0;
  *(_BYTE *)(v0 + 176) = 0;
  getkFigSTSLabel_Global();
  result = std::string::basic_string[abi:ne180100]<0>((_QWORD *)(v0 + 192), (char *)objc_msgSend(objc_retainAutorelease(v1), "UTF8String"));
  __dmb(0xBu);
  CADeprecated::TSingleton<STS_N>::sInstance = v0;
  return result;
}

void sub_2290E9B1C(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;
  void **v3;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;

  v5 = *(_QWORD **)(v1 + 64);
  if (v5)
  {
    do
    {
      v6 = (_QWORD *)*v5;
      std::__destroy_at[abi:ne180100]<std::pair<OpaqueAudioComponentInstance * const,std::pair<std::string,std::string>>,0>((uint64_t)(v5 + 2));
      operator delete(v5);
      v5 = v6;
    }
    while (v6);
  }
  v7 = *v3;
  *v3 = 0;
  if (v7)
    operator delete(v7);
  v8 = *(_QWORD **)(v1 + 24);
  if (v8)
  {
    do
    {
      v9 = (_QWORD *)*v8;
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::unique_ptr<STS_N::PerLabelInfo>>,0>((uint64_t)(v8 + 2));
      operator delete(v8);
      v8 = v9;
    }
    while (v9);
  }
  v10 = *v2;
  *v2 = 0;
  if (v10)
    operator delete(v10);
  MEMORY[0x22E2C1708](v1, 0x10B2C40B7A7108ALL);
  _Unwind_Resume(a1);
}

void STSRegisterSpatializerWithFallback(OpaqueAudioComponentInstance *a1, __CFString *a2, __CFString *a3)
{
  unint64_t v3;
  uint64_t v7;
  _BOOL4 v8;
  NSObject *v9;
  char *CStringPtr;
  char *v11;
  __CFString *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint8x8_t v21;
  _QWORD *v22;
  _QWORD *v23;
  unint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  float v28;
  float v29;
  _BOOL8 v30;
  unint64_t v31;
  unint64_t v32;
  int8x8_t prime;
  void *v34;
  void *v35;
  uint64_t v36;
  _QWORD *v37;
  unint64_t v38;
  uint8x8_t v39;
  unint64_t v40;
  uint8x8_t v41;
  uint64_t v42;
  _QWORD *v43;
  unint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  unint64_t v48;
  void *v49;
  void *__p;
  __int128 v51;
  void *v52;
  __int128 v53;
  _QWORD v54[2];
  _QWORD v55[6];
  _BYTE buf[22];
  __int16 v57;
  __CFString *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v7 = CADeprecated::TSingleton<STS_N>::instance();
  v8 = 0;
  if (a2 && a3)
    v8 = CFStringCompare(a2, a3, 0) == kCFCompareEqualTo;
  if (!a3 || v8)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v7);
    if (!a2)
    {
      getkFigSTSLabel_Global();
      a2 = v12;
    }
    STS_N::RegisterSpatializerUnderLock((STS_N *)v7, a1, a2);
    os_unfair_lock_unlock((os_unfair_lock_t)v7);
    return;
  }
  STS_N_Log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = a1;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = a2;
    v57 = 2112;
    v58 = a3;
    _os_log_impl(&dword_2290E3000, v9, OS_LOG_TYPE_DEFAULT, "registering spatializer:%p with preferredLabel:%@ and backupLabel:%@", buf, 0x20u);
  }

  os_unfair_lock_lock((os_unfair_lock_t)v7);
  CStringPtr = (char *)CFStringGetCStringPtr(a2, 0x8000100u);
  v11 = (char *)CFStringGetCStringPtr(a3, 0x8000100u);
  if (*(_QWORD *)(STS_N::InfoForLabel((STS_N *)v7, a2) + 48))
    STS_N::RegisterSpatializerUnderLock((STS_N *)v7, a1, a2);
  else
    STS_N::RegisterSpatializerUnderLock((STS_N *)v7, a1, a3);
  std::string::basic_string[abi:ne180100]<0>(&v52, CStringPtr);
  std::string::basic_string[abi:ne180100]<0>(&__p, v11);
  v13 = v52;
  v55[0] = v53;
  *(_QWORD *)((char *)v55 + 7) = *(_QWORD *)((char *)&v53 + 7);
  v14 = SHIBYTE(v53);
  v53 = 0uLL;
  v15 = __p;
  v54[0] = v51;
  *(_QWORD *)((char *)v54 + 7) = *(_QWORD *)((char *)&v51 + 7);
  v16 = SHIBYTE(v51);
  v52 = 0;
  __p = 0;
  v51 = 0uLL;
  *(_QWORD *)((char *)&v55[4] + 7) = *(_QWORD *)((char *)v55 + 7);
  v55[4] = v55[0];
  v55[0] = 0;
  *(_QWORD *)((char *)v55 + 7) = 0;
  *(_QWORD *)((char *)&v55[2] + 7) = *(_QWORD *)((char *)v54 + 7);
  v55[2] = v54[0];
  v54[0] = 0;
  *(_QWORD *)((char *)v54 + 7) = 0;
  v17 = 0x9DDFEA08EB382D69 * (((8 * (_DWORD)a1) + 8) ^ ((unint64_t)a1 >> 32));
  v18 = 0x9DDFEA08EB382D69 * (((unint64_t)a1 >> 32) ^ (v17 >> 47) ^ v17);
  v19 = 0x9DDFEA08EB382D69 * (v18 ^ (v18 >> 47));
  v20 = *(_QWORD *)(v7 + 56);
  if (!v20)
    goto LABEL_31;
  v21 = (uint8x8_t)vcnt_s8((int8x8_t)v20);
  v21.i16[0] = vaddlv_u8(v21);
  if (v21.u32[0] > 1uLL)
  {
    v3 = 0x9DDFEA08EB382D69 * (v18 ^ (v18 >> 47));
    if (v19 >= v20)
      v3 = v19 % v20;
  }
  else
  {
    v3 = v19 & (v20 - 1);
  }
  v22 = *(_QWORD **)(*(_QWORD *)(v7 + 48) + 8 * v3);
  if (!v22 || (v23 = (_QWORD *)*v22) == 0)
  {
LABEL_31:
    v25 = operator new(0x48uLL);
    v26 = (_QWORD *)(v7 + 64);
    *(_QWORD *)buf = v25;
    *(_QWORD *)&buf[8] = v7 + 64;
    *v25 = 0;
    v25[1] = v19;
    v25[2] = a1;
    v25[3] = v13;
    v25[4] = v55[4];
    *(_QWORD *)((char *)v25 + 39) = *(_QWORD *)((char *)&v55[4] + 7);
    *((_BYTE *)v25 + 47) = v14;
    memset(&v55[4], 0, 15);
    *(_QWORD *)((char *)v25 + 63) = *(_QWORD *)((char *)&v55[2] + 7);
    v27 = v55[2];
    v25[6] = v15;
    v25[7] = v27;
    *((_BYTE *)v25 + 71) = v16;
    memset(&v55[2], 0, 15);
    buf[16] = 1;
    v28 = (float)(unint64_t)(*(_QWORD *)(v7 + 72) + 1);
    v29 = *(float *)(v7 + 80);
    if (v20 && (float)(v29 * (float)v20) >= v28)
    {
LABEL_77:
      v46 = *(_QWORD **)(*(_QWORD *)(v7 + 48) + 8 * v3);
      v47 = *(_QWORD *)buf;
      if (v46)
      {
        **(_QWORD **)buf = *v46;
      }
      else
      {
        **(_QWORD **)buf = *(_QWORD *)(v7 + 64);
        *(_QWORD *)(v7 + 64) = v47;
        *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v3) = v26;
        if (!*(_QWORD *)v47)
        {
LABEL_86:
          *(_QWORD *)buf = 0;
          ++*(_QWORD *)(v7 + 72);
          std::unique_ptr<std::__hash_node<std::__hash_value_type<OpaqueAudioComponentInstance *,std::pair<std::string,std::string>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<OpaqueAudioComponentInstance *,std::pair<std::string,std::string>>,void *>>>>::reset[abi:ne180100]((uint64_t)buf);
          goto LABEL_87;
        }
        v48 = *(_QWORD *)(*(_QWORD *)v47 + 8);
        if ((v20 & (v20 - 1)) != 0)
        {
          if (v48 >= v20)
            v48 %= v20;
        }
        else
        {
          v48 &= v20 - 1;
        }
        v46 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v48);
      }
      *v46 = v47;
      goto LABEL_86;
    }
    v30 = 1;
    if (v20 >= 3)
      v30 = (v20 & (v20 - 1)) != 0;
    v31 = v30 | (2 * v20);
    v32 = vcvtps_u32_f32(v28 / v29);
    if (v31 <= v32)
      prime = (int8x8_t)v32;
    else
      prime = (int8x8_t)v31;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      v20 = *(_QWORD *)(v7 + 56);
    }
    if (*(_QWORD *)&prime > v20)
      goto LABEL_43;
    if (*(_QWORD *)&prime < v20)
    {
      v40 = vcvtps_u32_f32((float)*(unint64_t *)(v7 + 72) / *(float *)(v7 + 80));
      if (v20 < 3 || (v41 = (uint8x8_t)vcnt_s8((int8x8_t)v20), v41.i16[0] = vaddlv_u8(v41), v41.u32[0] > 1uLL))
      {
        v40 = std::__next_prime(v40);
      }
      else
      {
        v42 = 1 << -(char)__clz(v40 - 1);
        if (v40 >= 2)
          v40 = v42;
      }
      if (*(_QWORD *)&prime <= v40)
        prime = (int8x8_t)v40;
      if (*(_QWORD *)&prime >= v20)
      {
        v20 = *(_QWORD *)(v7 + 56);
      }
      else
      {
        if (prime)
        {
LABEL_43:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v34 = operator new(8 * *(_QWORD *)&prime);
          v35 = *(void **)(v7 + 48);
          *(_QWORD *)(v7 + 48) = v34;
          if (v35)
            operator delete(v35);
          v36 = 0;
          *(int8x8_t *)(v7 + 56) = prime;
          do
            *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v36++) = 0;
          while (*(_QWORD *)&prime != v36);
          v37 = (_QWORD *)*v26;
          if (*v26)
          {
            v38 = v37[1];
            v39 = (uint8x8_t)vcnt_s8(prime);
            v39.i16[0] = vaddlv_u8(v39);
            if (v39.u32[0] > 1uLL)
            {
              if (v38 >= *(_QWORD *)&prime)
                v38 %= *(_QWORD *)&prime;
            }
            else
            {
              v38 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v38) = v26;
            v43 = (_QWORD *)*v37;
            if (*v37)
            {
              do
              {
                v44 = v43[1];
                if (v39.u32[0] > 1uLL)
                {
                  if (v44 >= *(_QWORD *)&prime)
                    v44 %= *(_QWORD *)&prime;
                }
                else
                {
                  v44 &= *(_QWORD *)&prime - 1;
                }
                if (v44 != v38)
                {
                  v45 = *(_QWORD *)(v7 + 48);
                  if (!*(_QWORD *)(v45 + 8 * v44))
                  {
                    *(_QWORD *)(v45 + 8 * v44) = v37;
                    goto LABEL_68;
                  }
                  *v37 = *v43;
                  *v43 = **(_QWORD **)(*(_QWORD *)(v7 + 48) + 8 * v44);
                  **(_QWORD **)(*(_QWORD *)(v7 + 48) + 8 * v44) = v43;
                  v43 = v37;
                }
                v44 = v38;
LABEL_68:
                v37 = v43;
                v43 = (_QWORD *)*v43;
                v38 = v44;
              }
              while (v43);
            }
          }
          v20 = (unint64_t)prime;
          goto LABEL_72;
        }
        v49 = *(void **)(v7 + 48);
        *(_QWORD *)(v7 + 48) = 0;
        if (v49)
          operator delete(v49);
        v20 = 0;
        *(_QWORD *)(v7 + 56) = 0;
      }
    }
LABEL_72:
    if ((v20 & (v20 - 1)) != 0)
    {
      if (v19 >= v20)
        v3 = v19 % v20;
      else
        v3 = v19;
    }
    else
    {
      v3 = (v20 - 1) & v19;
    }
    goto LABEL_77;
  }
  while (1)
  {
    v24 = v23[1];
    if (v24 == v19)
      break;
    if (v21.u32[0] > 1uLL)
    {
      if (v24 >= v20)
        v24 %= v20;
    }
    else
    {
      v24 &= v20 - 1;
    }
    if (v24 != v3)
      goto LABEL_31;
LABEL_30:
    v23 = (_QWORD *)*v23;
    if (!v23)
      goto LABEL_31;
  }
  if ((OpaqueAudioComponentInstance *)v23[2] != a1)
    goto LABEL_30;
  if (v16 < 0)
    operator delete(v15);
  if (v14 < 0)
    operator delete(v13);
LABEL_87:
  if (SHIBYTE(v51) < 0)
    operator delete(__p);
  if (SHIBYTE(v53) < 0)
    operator delete(v52);
  os_unfair_lock_unlock((os_unfair_lock_t)v7);
}

void sub_2290EA260(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  os_unfair_lock_s *v29;

  std::unique_ptr<std::__hash_node<std::__hash_value_type<OpaqueAudioComponentInstance *,std::pair<std::string,std::string>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<OpaqueAudioComponentInstance *,std::pair<std::string,std::string>>,void *>>>>::reset[abi:ne180100]((uint64_t)&a29);
  if (a14 < 0)
    operator delete(__p);
  if (a20 < 0)
    operator delete(a15);
  os_unfair_lock_unlock(v29);
  _Unwind_Resume(a1);
}

void STSSetSoundStageParameters(uint64_t a1, void *a2)
{
  void *v2;
  void *v4;
  os_unfair_lock_s *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  float v14;
  int v15;
  int v16;
  NSObject *v17;
  int v18;
  NSObject *v19;
  float v20;
  NSObject *v21;
  unsigned int v22;
  NSObject *v23;
  char *v24;
  char *v25;
  int v26;
  _BYTE v27[18];
  uint64_t v28;

  v2 = a2;
  v28 = *MEMORY[0x24BDAC8D0];
  if (!a2)
  {
    getkFigSTSLabel_Global();
    v2 = v4;
  }
  v5 = (os_unfair_lock_s *)CADeprecated::TSingleton<STS_N>::instance();
  STS_N_Log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 138412290;
    *(_QWORD *)v27 = v2;
    _os_log_impl(&dword_2290E3000, v6, OS_LOG_TYPE_DEFAULT, "STSSetSoundStageParameters called for spatializer with label %@", (uint8_t *)&v26, 0xCu);
  }

  os_unfair_lock_lock(v5);
  v7 = STS_N::InfoForLabel((STS_N *)v5, v2);
  v8 = v7;
  if (*(_BYTE *)(a1 + 1))
    *(_BYTE *)(v7 + 112) = *(_BYTE *)a1;
  if (*(_BYTE *)(a1 + 8))
  {
    v9 = *(_DWORD *)(a1 + 4);
    if (*(_DWORD *)(v7 + 116) != v9)
    {
      *(_DWORD *)(v7 + 116) = v9;
      *(_BYTE *)(v7 + 140) = 1;
    }
  }
  if (*(_BYTE *)(a1 + 16))
    *(_DWORD *)(v7 + 120) = *(_DWORD *)(a1 + 12);
  v10 = *(_DWORD *)(v7 + 136);
  if (*(_DWORD *)(v7 + 116) == 20)
  {
    v11 = 4;
  }
  else
  {
    v12 = *(unsigned int *)(v7 + 120);
    if (v12 > 2)
      v11 = 3;
    else
      v11 = dword_2290EF000[v12];
  }
  *(_DWORD *)(v7 + 136) = v11;
  if (v11 != v10)
  {
    STSSoundStageControllerLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v25 = STSSoundStageController::SoundStageSizeToString(*(_DWORD *)(v8 + 136));
      v26 = 136315138;
      *(_QWORD *)v27 = v25;
      _os_log_debug_impl(&dword_2290E3000, v13, OS_LOG_TYPE_DEBUG, "STSSoundStageController::pickSoundStageSize() picked a new, different sound stage: %s", (uint8_t *)&v26, 0xCu);
    }

    *(_BYTE *)(v8 + 141) = 1;
  }
  if (*(_BYTE *)(a1 + 24))
  {
    v14 = *(float *)(a1 + 20);
    if (vabds_f32(v14, *(float *)(v8 + 124)) > 0.001)
    {
      *(float *)(v8 + 124) = v14;
      *(_BYTE *)(v8 + 142) = 1;
    }
  }
  if (*(_BYTE *)(a1 + 32))
  {
    v15 = *(_DWORD *)(a1 + 28);
    if (v15 != *(_DWORD *)(v8 + 128))
    {
      *(_DWORD *)(v8 + 128) = v15;
      *(_BYTE *)(v8 + 143) = 1;
    }
  }
  if (*(_BYTE *)(a1 + 40))
  {
    v16 = *(_DWORD *)(a1 + 36);
    if (v16 != *(_DWORD *)(v8 + 132))
    {
      *(_DWORD *)(v8 + 132) = v16;
      *(_BYTE *)(v8 + 143) = 1;
    }
  }
  if (*(_BYTE *)(v8 + 143))
  {
    STS_N_Log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 138412290;
      *(_QWORD *)v27 = v2;
      _os_log_impl(&dword_2290E3000, v17, OS_LOG_TYPE_DEFAULT, "SetSoundStageParameters caused spatializer's soundStageController to update preset for label %@", (uint8_t *)&v26, 0xCu);
    }

    objc_msgSend(*(id *)(v8 + 144), "fireAll");
  }
  if (*(_BYTE *)(v8 + 140))
  {
    v18 = *(_DWORD *)(v8 + 116);
    STS_N_Log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 67109378;
      *(_DWORD *)v27 = v18;
      *(_WORD *)&v27[4] = 2112;
      *(_QWORD *)&v27[6] = v2;
      _os_log_impl(&dword_2290E3000, v19, OS_LOG_TYPE_DEFAULT, "SetSoundStageParameters updating spatialization preference to %d for label %@", (uint8_t *)&v26, 0x12u);
    }

    STS_N::ApplyStoredPerLabelStateToSpatializers((uint64_t)v5, v8, 0);
  }
  if (*(_BYTE *)(v8 + 142))
  {
    v20 = *(float *)(v8 + 124);
    STS_N_Log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 134218242;
      *(double *)v27 = v20;
      *(_WORD *)&v27[8] = 2112;
      *(_QWORD *)&v27[10] = v2;
      _os_log_impl(&dword_2290E3000, v21, OS_LOG_TYPE_DEFAULT, "SetSoundStageParameters updating sound stage transition duration to %0.2f for label %@", (uint8_t *)&v26, 0x16u);
    }

    STS_N::SetSoundStageTransitionDurationOnSpatializers(v8);
  }
  if (*(_BYTE *)(v8 + 141))
  {
    v22 = *(_DWORD *)(v8 + 136);
    STS_N_Log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = STSSoundStageController::SoundStageSizeToString(v22);
      v26 = 136315394;
      *(_QWORD *)v27 = v24;
      *(_WORD *)&v27[8] = 2112;
      *(_QWORD *)&v27[10] = v2;
      _os_log_impl(&dword_2290E3000, v23, OS_LOG_TYPE_DEFAULT, "SetSoundStageParameters updating sound stage size to %s for label %@", (uint8_t *)&v26, 0x16u);
    }

    STS_N::SetSoundStageSizeOnSpatializers(v8, v22);
  }
  *(_DWORD *)(v8 + 140) = 0;
  os_unfair_lock_unlock(v5);
}

void sub_2290EA708(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void STSSetRoomConfigurationDictionary(void *a1, void *a2)
{
  void *v2;
  void *v4;
  NSObject *v5;
  os_unfair_lock_s *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v2 = a2;
  v11 = *MEMORY[0x24BDAC8D0];
  if (!a2)
  {
    getkFigSTSLabel_Global();
    v2 = v4;
  }
  STS_N_Log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412546;
    v8 = v2;
    v9 = 2112;
    v10 = a1;
    _os_log_impl(&dword_2290E3000, v5, OS_LOG_TYPE_DEFAULT, "STSSetRoomConfigurationDictionary with label=\"%@\", config=%@", (uint8_t *)&v7, 0x16u);
  }

  v6 = (os_unfair_lock_s *)CADeprecated::TSingleton<STS_N>::instance();
  STS_N::SetPropertyForLabel(v6, 0, v2, CFSTR("RoomConfiguration"), a1);
}

uint64_t STSAddForcedReconfigurationCallback(void *a1, void *a2)
{
  id v3;
  os_unfair_lock_s *v4;
  id v5;
  uint64_t v6;

  v3 = a2;
  v4 = (os_unfair_lock_s *)CADeprecated::TSingleton<STS_N>::instance();
  v5 = v3;
  os_unfair_lock_lock(v4);
  v6 = objc_msgSend(*(id *)(STS_N::InfoForLabel((STS_N *)v4, a1) + 144), "addCallback:", v5);
  os_unfair_lock_unlock(v4);

  return v6;
}

void sub_2290EA884(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void STSRemoveForcedReconfigurationCallback(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 *v6;
  void *__p[2];
  char v8;
  _BYTE v9[24];

  v4 = CADeprecated::TSingleton<STS_N>::instance();
  os_unfair_lock_lock((os_unfair_lock_t)v4);
  v5 = STS_N::InfoForLabel((STS_N *)v4, a1);
  objc_msgSend(*(id *)(v5 + 144), "removeCallback:", a2);
  if (STS_N::CanDeleteSpatializerInfo(v4, (unsigned __int8 *)v5))
  {
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String"));
    v6 = std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>>>::find<std::string>((_QWORD *)(v4 + 8), (unsigned __int8 *)__p);
    if (v6)
    {
      std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>>>::remove((uint64_t)v9, (_QWORD *)(v4 + 8), v6);
      std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,void *>>>>::reset[abi:ne180100]((uint64_t)v9);
    }
    if (v8 < 0)
      operator delete(__p[0]);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)v4);
}

void sub_2290EA96C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t STSTrackedLabelCount()
{
  uint64_t v0;
  uint64_t v1;

  v0 = CADeprecated::TSingleton<STS_N>::instance();
  os_unfair_lock_lock((os_unfair_lock_t)v0);
  v1 = *(_QWORD *)(v0 + 32);
  os_unfair_lock_unlock((os_unfair_lock_t)v0);
  return v1;
}

char *STSSoundStageController::SoundStageSizeToString(unsigned int a1)
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  unsigned int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (a1 < 5)
    return off_24F1D03C8[a1];
  STSSoundStageControllerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315650;
    v5 = "STSSoundStageController.mm";
    v6 = 1024;
    v7 = 28;
    v8 = 1024;
    v9 = a1;
    _os_log_impl(&dword_2290E3000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d SoundStageSizeToString failed to find string for input SoundStageSize of value: %u. Returning emtpy string", (uint8_t *)&v4, 0x18u);
  }

  return (char *)&unk_2290F01DE;
}

id STSSoundStageControllerLog(void)
{
  unsigned __int8 v0;
  unint64_t v1;
  int v3;

  v1 = 0x255A27000uLL;
  if ((v0 & 1) == 0)
  {
    v1 = 0x255A27000;
    if (v3)
    {
      STSSoundStageControllerLog(void)::sLog = (uint64_t)os_log_create("com.apple.STS-N", "STSSoundStageController");
      v1 = 0x255A27000;
    }
  }
  return *(id *)(v1 + 680);
}

uint64_t STSCreateFlavorN(const __CFAllocator *a1, const void *a2, CFTypeRef *a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD *DerivedStorage;
  char *v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  _QWORD *v18;
  CFMutableDictionaryRef Mutable;
  CFTypeRef v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  void *v25;
  void *v26;
  CFTypeRef cf;
  _BYTE buf[24];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  cf = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v6 = getFigSTSGetClassIDSymbolLoc(void)::ptr;
  v29 = getFigSTSGetClassIDSymbolLoc(void)::ptr;
  if (!getFigSTSGetClassIDSymbolLoc(void)::ptr)
  {
    v7 = MediaExperienceLibrary();
    v6 = dlsym(v7, "FigSTSGetClassID");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v6;
    getFigSTSGetClassIDSymbolLoc(void)::ptr = v6;
  }
  _Block_object_dispose(buf, 8);
  if (!v6)
  {
    v25 = (void *)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CMBaseClassID softLink_FigSTSGetClassID()"), CFSTR("STS_N.mm"), 34, CFSTR("%s"), dlerror());
    goto LABEL_30;
  }
  v8 = ((uint64_t (*)(void))v6)();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v9 = getCMDerivedObjectCreateSymbolLoc(void)::ptr;
  v29 = getCMDerivedObjectCreateSymbolLoc(void)::ptr;
  if (!getCMDerivedObjectCreateSymbolLoc(void)::ptr)
  {
    v10 = CoreMediaLibrary();
    v9 = dlsym(v10, "CMDerivedObjectCreate");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v9;
    getCMDerivedObjectCreateSymbolLoc(void)::ptr = v9;
  }
  _Block_object_dispose(buf, 8);
  if (!v9)
  {
    v26 = (void *)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "OSStatus softLink_CMDerivedObjectCreate(CFAllocatorRef, const CMBaseVTable *, CMBaseClassID, CMBaseObjectRef *)"), CFSTR("STS_N.mm"), 29, CFSTR("%s"), dlerror());
LABEL_30:
    __break(1u);
  }
  v11 = ((uint64_t (*)(const __CFAllocator *, void *, uint64_t, CFTypeRef *))v9)(a1, &kSTS_N_VTable, v8, &cf);
  if ((_DWORD)v11)
  {
    v12 = STS_N_Log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "STSCreateFlavorN";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 632;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v11;
      _os_log_error_impl(&dword_2290E3000, v12, OS_LOG_TYPE_ERROR, "%s:%d error: %d", buf, 0x18u);
    }
LABEL_10:
    if (cf)
      CFRelease(cf);
    return v11;
  }
  DerivedStorage = (_QWORD *)softLink_CMBaseObjectGetDerivedStorage((uint64_t)cf);
  *DerivedStorage = 0;
  DerivedStorage[1] = 0;
  v14 = (char *)operator new(0x78uLL);
  *((_QWORD *)v14 + 1) = 0;
  *((_QWORD *)v14 + 2) = 0;
  *(_QWORD *)v14 = &off_24F1D0570;
  *(_OWORD *)(v14 + 24) = 0u;
  *(_OWORD *)(v14 + 40) = 0u;
  *(_OWORD *)(v14 + 56) = 0u;
  *(_OWORD *)(v14 + 72) = 0u;
  *(_OWORD *)(v14 + 88) = 0u;
  *(_OWORD *)(v14 + 104) = 0u;
  MEMORY[0x22E2C1654](v14 + 64);
  *((_WORD *)v14 + 36) = 0;
  *((_OWORD *)v14 + 5) = 0u;
  *((_OWORD *)v14 + 6) = 0u;
  *((_DWORD *)v14 + 28) = 1065353216;
  *(_QWORD *)buf = v14 + 24;
  *(_QWORD *)&buf[8] = v14;
  std::shared_ptr<STS_N_Storage>::operator=[abi:ne180100]((uint64_t)DerivedStorage, (__int128 *)buf);
  v15 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v16 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  v18 = (_QWORD *)*DerivedStorage;
  Mutable = CFDictionaryCreateMutable(a1, 0, MEMORY[0x24BDBD6A0], &STSCreateFlavorN::perLabelInfoDictCallbacks);
  v18[2] = Mutable;
  if (!Mutable)
  {
    v21 = STS_N_Log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "STSCreateFlavorN";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 642;
      _os_log_error_impl(&dword_2290E3000, v21, OS_LOG_TYPE_ERROR, "%s:%d error", buf, 0x12u);
    }
    v11 = 4294951305;
    goto LABEL_10;
  }
  if (a2)
    v20 = CFRetain(a2);
  else
    v20 = 0;
  v18[1] = v20;
  v22 = STS_N_Log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = getkFigSTSFlavor_N();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v23;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = cf;
    *(_WORD *)&buf[22] = 2048;
    v29 = v18;
    _os_log_impl(&dword_2290E3000, v22, OS_LOG_TYPE_DEFAULT, "Created new %@ flavor sts %p (%p)", buf, 0x20u);
  }
  v11 = 0;
  *a3 = cf;
  return v11;
}

void sub_2290EAF3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  std::__shared_weak_count *v11;
  void *v13;

  std::__shared_weak_count::~__shared_weak_count(v11);
  operator delete(v13);
  _Unwind_Resume(a1);
}

void *MediaExperienceLibrary(void)
{
  void *v0;
  void *v2;

  if (!MediaExperienceLibraryCore(char **)::frameworkLibrary)
    MediaExperienceLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  v0 = (void *)MediaExperienceLibraryCore(char **)::frameworkLibrary;
  if (!MediaExperienceLibraryCore(char **)::frameworkLibrary)
  {
    v0 = (void *)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *MediaExperienceLibrary()"), CFSTR("STS_N.mm"), 33, CFSTR("%s"), 0);
    __break(1u);
    free(v2);
  }
  return v0;
}

void *CoreMediaLibrary(void)
{
  void *v0;
  void *v2;

  if (!CoreMediaLibraryCore(char **)::frameworkLibrary)
    CoreMediaLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  v0 = (void *)CoreMediaLibraryCore(char **)::frameworkLibrary;
  if (!CoreMediaLibraryCore(char **)::frameworkLibrary)
  {
    v0 = (void *)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CoreMediaLibrary()"), CFSTR("STS_N.mm"), 27, CFSTR("%s"), 0);
    __break(1u);
    free(v2);
  }
  return v0;
}

uint64_t softLink_CMBaseObjectGetDerivedStorage(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;
  void *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = getCMBaseObjectGetDerivedStorageSymbolLoc(void)::ptr;
  v9 = getCMBaseObjectGetDerivedStorageSymbolLoc(void)::ptr;
  if (!getCMBaseObjectGetDerivedStorageSymbolLoc(void)::ptr)
  {
    v3 = CoreMediaLibrary();
    v2 = dlsym(v3, "CMBaseObjectGetDerivedStorage");
    v7[3] = (uint64_t)v2;
    getCMBaseObjectGetDerivedStorageSymbolLoc(void)::ptr = v2;
  }
  _Block_object_dispose(&v6, 8);
  if (v2)
    return ((uint64_t (*)(uint64_t))v2)(a1);
  v5 = (void *)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  result = objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *softLink_CMBaseObjectGetDerivedStorage(CMBaseObjectRef)"), CFSTR("STS_N.mm"), 28, CFSTR("%s"), dlerror());
  __break(1u);
  return result;
}

void sub_2290EB234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t std::shared_ptr<STS_N_Storage>::operator=[abi:ne180100](uint64_t a1, __int128 *a2)
{
  __int128 v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;

  v3 = *a2;
  *(_QWORD *)a2 = 0;
  *((_QWORD *)a2 + 1) = 0;
  v4 = *(std::__shared_weak_count **)(a1 + 8);
  *(_OWORD *)a1 = v3;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  return a1;
}

uint64_t getkFigSTSFlavor_N(void)
{
  void *v0;
  void *v1;
  uint64_t result;
  void *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (void *)getkFigSTSFlavor_NSymbolLoc(void)::ptr;
  v7 = getkFigSTSFlavor_NSymbolLoc(void)::ptr;
  if (!getkFigSTSFlavor_NSymbolLoc(void)::ptr)
  {
    v1 = MediaExperienceLibrary();
    v0 = dlsym(v1, "kFigSTSFlavor_N");
    v5[3] = (uint64_t)v0;
    getkFigSTSFlavor_NSymbolLoc(void)::ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (v0)
    return *(_QWORD *)v0;
  v3 = (void *)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  result = objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CFStringRef getkFigSTSFlavor_N()"), CFSTR("STS_N.mm"), 35, CFSTR("%s"), dlerror());
  __break(1u);
  return result;
}

void sub_2290EB380(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void PerLabelInfoDictReleaseCallBack(const __CFAllocator *a1, CFTypeRef *a2)
{
  if (a2)
  {
    if (*a2)
      CFRelease(*a2);
    JUMPOUT(0x22E2C1708);
  }
}

void std::__shared_ptr_emplace<STS_N_Storage>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24F1D0570;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<STS_N_Storage>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24F1D0570;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x22E2C1708);
}

void std::__shared_ptr_emplace<STS_N_Storage>::__on_zero_shared(_QWORD *a1)
{
  void *v2;
  unint64_t v3;
  size_t v4;
  const void *v5;
  const void *v6;
  void **v7;
  void **v8;
  void *v9;

  v2 = (void *)a1[7];
  if (v2)
  {
    v3 = 0xE970uLL / *MEMORY[0x24BDB03C8] * *MEMORY[0x24BDB03C8];
    if (v3 == 59760)
      v4 = 59760;
    else
      v4 = *MEMORY[0x24BDB03C8] + v3;
    munmap(v2, v4);
  }
  v5 = (const void *)a1[4];
  if (v5)
  {
    CFRelease(v5);
    a1[4] = 0;
  }
  v6 = (const void *)a1[5];
  if (v6)
  {
    CFRelease(v6);
    a1[5] = 0;
  }
  v7 = (void **)a1[12];
  if (v7)
  {
    do
    {
      v8 = (void **)*v7;
      if (*((char *)v7 + 39) < 0)
        operator delete(v7[2]);
      operator delete(v7);
      v7 = v8;
    }
    while (v8);
  }
  v9 = (void *)a1[10];
  a1[10] = 0;
  if (v9)
    operator delete(v9);
  JUMPOUT(0x22E2C1660);
}

uint64_t STS_N_SetActive(uint64_t a1, const void *a2, int a3)
{
  os_unfair_lock_s *v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  const void *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = *(os_unfair_lock_s **)softLink_CMBaseObjectGetDerivedStorage(a1);
  v15 = 0;
  os_unfair_lock_lock(v6);
  if (a2)
  {
    STS_N_EnsureInfoForLabel((uint64_t)v6, a2, &v15);
    v7 = STS_N_Log();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
    v9 = v15;
    if (v8)
    {
      if (*(unsigned __int8 *)(v15 + 8) == a3)
        v13 = "already";
      else
        v13 = "becomes";
      v14 = "active";
      *(_DWORD *)buf = 134218754;
      v17 = (const char *)a1;
      v18 = 2112;
      v19 = a2;
      v20 = 2080;
      if (!a3)
        v14 = "inactive";
      v21 = v13;
      v22 = 2080;
      v23 = v14;
      _os_log_debug_impl(&dword_2290E3000, v7, OS_LOG_TYPE_DEBUG, "sts %p label \"%@\" %s %s", buf, 0x2Au);
    }
    v10 = 0;
    *(_BYTE *)(v9 + 8) = a3;
  }
  else
  {
    v11 = STS_N_Log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "STS_N_SetActive";
      v18 = 1024;
      LODWORD(v19) = 331;
      _os_log_error_impl(&dword_2290E3000, v11, OS_LOG_TYPE_ERROR, "%s:%d error", buf, 0x12u);
    }
    v10 = 4294951306;
  }
  os_unfair_lock_unlock(v6);
  return v10;
}

void sub_2290EB68C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t STS_N_GetActive(uint64_t a1, const void *a2, _BYTE *a3)
{
  os_unfair_lock_s *v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  int v13;
  const char *v14;
  uint64_t v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  const void *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = *(os_unfair_lock_s **)softLink_CMBaseObjectGetDerivedStorage(a1);
  v15 = 0;
  os_unfair_lock_lock(v6);
  if (!a2)
  {
    v11 = STS_N_Log();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_8:
      v10 = 4294951306;
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136315394;
    v17 = "STS_N_GetActive";
    v18 = 1024;
    LODWORD(v19) = 352;
LABEL_15:
    _os_log_error_impl(&dword_2290E3000, v11, OS_LOG_TYPE_ERROR, "%s:%d error", buf, 0x12u);
    goto LABEL_8;
  }
  if (!a3)
  {
    v11 = STS_N_Log();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    *(_DWORD *)buf = 136315394;
    v17 = "STS_N_GetActive";
    v18 = 1024;
    LODWORD(v19) = 353;
    goto LABEL_15;
  }
  STS_N_EnsureInfoForLabel((uint64_t)v6, a2, &v15);
  v7 = STS_N_Log();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  v9 = v15;
  if (v8)
  {
    v13 = *(unsigned __int8 *)(v15 + 8);
    *(_DWORD *)buf = 134218498;
    if (v13)
      v14 = "YES";
    else
      v14 = "NO";
    v17 = (const char *)a1;
    v18 = 2112;
    v19 = a2;
    v20 = 2080;
    v21 = v14;
    _os_log_debug_impl(&dword_2290E3000, v7, OS_LOG_TYPE_DEBUG, "sts %p label \"%@\" active == %s", buf, 0x20u);
  }
  v10 = 0;
  *a3 = *(_BYTE *)(v9 + 8);
LABEL_9:
  os_unfair_lock_unlock(v6);
  return v10;
}

void sub_2290EB88C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t STS_N_SetPropertyByLabel(unint64_t a1, void *a2, const __CFString *a3, void *a4)
{
  os_unfair_lock_s *v8;
  uint64_t v9;
  NSObject *v10;
  __CFDictionary **v11;
  __CFDictionary *v12;
  os_unfair_lock_s *v13;
  __CFDictionary **v15;
  uint8_t buf[4];
  os_unfair_lock_s *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = *(os_unfair_lock_s **)softLink_CMBaseObjectGetDerivedStorage(a1);
  v15 = 0;
  os_unfair_lock_lock(v8);
  v9 = 4294951306;
  if (!a2 || !a3)
    goto LABEL_11;
  STS_N_EnsureInfoForLabel((uint64_t)v8, a2, (uint64_t *)&v15);
  v10 = STS_N_Log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v17 = v8;
    v18 = 2112;
    v19 = a2;
    v20 = 2112;
    v21 = a3;
    _os_log_debug_impl(&dword_2290E3000, v10, OS_LOG_TYPE_DEBUG, "sts %p label \"%@\" setting %@", buf, 0x20u);
  }
  v11 = v15;
  v12 = *v15;
  if (a4)
    CFDictionarySetValue(v12, a3, a4);
  else
    CFDictionaryRemoveValue(v12, a3);
  if (!*((_BYTE *)v11 + 8))
  {
    v9 = 0;
LABEL_11:
    os_unfair_lock_unlock(v8);
    return v9;
  }
  os_unfair_lock_unlock(v8);
  v13 = (os_unfair_lock_s *)CADeprecated::TSingleton<STS_N>::instance();
  STS_N::SetPropertyForLabel(v13, a1, a2, a3, a4);
  return 0;
}

void sub_2290EBA00(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

uint64_t STS_N_CopyPropertyByLabel(uint64_t a1, const void *a2, const void *a3, CFTypeRef *a4)
{
  os_unfair_lock_s *v8;
  NSObject *v9;
  const void *Value;
  uint64_t v11;
  NSObject *v12;
  NSObject *v14;
  CFDictionaryRef *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  const void *v19;
  __int16 v20;
  const void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = *(os_unfair_lock_s **)softLink_CMBaseObjectGetDerivedStorage(a1);
  v15 = 0;
  os_unfair_lock_lock(v8);
  if (!a2)
  {
    v12 = STS_N_Log();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    *(_DWORD *)buf = 136315394;
    v17 = "STS_N_CopyPropertyByLabel";
    v18 = 1024;
    LODWORD(v19) = 425;
LABEL_14:
    _os_log_error_impl(&dword_2290E3000, v12, OS_LOG_TYPE_ERROR, "%s:%d error", buf, 0x12u);
    goto LABEL_15;
  }
  if (!a3)
  {
    v12 = STS_N_Log();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    *(_DWORD *)buf = 136315394;
    v17 = "STS_N_CopyPropertyByLabel";
    v18 = 1024;
    LODWORD(v19) = 426;
    goto LABEL_14;
  }
  if (!a4)
  {
    v12 = STS_N_Log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "STS_N_CopyPropertyByLabel";
      v18 = 1024;
      LODWORD(v19) = 427;
      goto LABEL_14;
    }
LABEL_15:
    v11 = 4294951306;
    goto LABEL_16;
  }
  STS_N_EnsureInfoForLabel((uint64_t)v8, a2, (uint64_t *)&v15);
  v9 = STS_N_Log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v17 = (const char *)a1;
    v18 = 2112;
    v19 = a2;
    v20 = 2112;
    v21 = a3;
    _os_log_debug_impl(&dword_2290E3000, v9, OS_LOG_TYPE_DEBUG, "sts %p label \"%@\" copying %@", buf, 0x20u);
  }
  Value = CFDictionaryGetValue(*v15, a3);
  if (Value)
  {
    v11 = 0;
    *a4 = CFRetain(Value);
  }
  else
  {
    v14 = STS_N_Log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v17 = (const char *)a1;
      v18 = 2112;
      v19 = a2;
      _os_log_error_impl(&dword_2290E3000, v14, OS_LOG_TYPE_ERROR, "sts %p copying unknown label \"%@\"", buf, 0x16u);
    }
    v11 = 4294951301;
  }
LABEL_16:
  os_unfair_lock_unlock(v8);
  return v11;
}

void sub_2290EBCAC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t STS_N_CopyShmem(uint64_t a1, const void *a2, _QWORD *a3)
{
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  unint64_t *v9;
  unint64_t v10;
  size_t v11;
  uint64_t v12;
  xpc_object_t v13;
  xpc_object_t v14;
  void *v15;
  uint64_t *DerivedStorage;
  std::__shared_weak_count *v17;
  uint64_t v18;
  unint64_t *p_shared_weak_owners;
  unint64_t v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  NSObject *v32;
  unint64_t v33;
  uint64_t v34;
  NSObject *v35;
  unint64_t *v36;
  unint64_t v37;
  uint64_t v38;
  std::string __p;
  uint64_t v41;
  char v42;
  uint64_t v43;
  std::string buf;
  size_t v45;
  _BYTE v46[30];
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v6 = *(_QWORD *)softLink_CMBaseObjectGetDerivedStorage(a1);
  os_unfair_lock_lock((os_unfair_lock_t)v6);
  if (!a2)
  {
    v21 = STS_N_Log();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    LODWORD(buf.__r_.__value_.__l.__data_) = 136315394;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"STS_N_CopyShmem";
    WORD2(buf.__r_.__value_.__r.__words[1]) = 1024;
    *(_DWORD *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = 455;
    v22 = v21;
LABEL_44:
    _os_log_error_impl(&dword_2290E3000, v22, OS_LOG_TYPE_ERROR, "%s:%d error", (uint8_t *)&buf, 0x12u);
    goto LABEL_22;
  }
  v7 = STS_N_Log();
  v8 = v7;
  if (a3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.__r_.__value_.__l.__data_) = 134218242;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = a1;
      WORD2(buf.__r_.__value_.__r.__words[1]) = 2112;
      *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)a2;
      _os_log_impl(&dword_2290E3000, v8, OS_LOG_TYPE_DEFAULT, "sts %p copy shmemName \"%@\"", (uint8_t *)&buf, 0x16u);
    }
    if (!CFEqual(a2, CFSTR("SharedStorage")))
    {
      v13 = 0;
      v23 = 4294951299;
LABEL_56:
      *a3 = v13;
      goto LABEL_57;
    }
    v9 = (unint64_t *)MEMORY[0x24BDB03C8];
    v10 = 0xE970uLL / *MEMORY[0x24BDB03C8] * *MEMORY[0x24BDB03C8];
    if (v10 == 59760)
      v11 = 59760;
    else
      v11 = *MEMORY[0x24BDB03C8] + v10;
    v12 = *(_QWORD *)(v6 + 32);
    if (!v12)
    {
      v24 = mmap(0, v11, 3, 4097, -1, 0);
      *(_QWORD *)(v6 + 32) = v24;
      if (!v24)
      {
        v35 = STS_N_Log();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf.__r_.__value_.__l.__data_) = 136315394;
          *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"STS_N_CopyShmem";
          WORD2(buf.__r_.__value_.__r.__words[1]) = 1024;
          *(_DWORD *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = 467;
          goto LABEL_41;
        }
        goto LABEL_42;
      }
      bzero(v24, v11);
      v25 = *(_QWORD **)(v6 + 32);
      bzero(v25, 0xE970uLL);
      v26 = 0;
      *(_DWORD *)v25 = -1;
      do
      {
        v27 = &v25[v26];
        *((_BYTE *)v27 + 16) = 0;
        *((_BYTE *)v27 + 112) = 0;
        v26 += 14;
      }
      while (v26 != 42);
      v28 = 0;
      v25[44] = 0;
      v29 = v25;
      do
      {
        v30 = 0;
        v25[116 * v28 + 46] = 0xFFFFFFFFLL;
        do
        {
          v31 = &v29[v30];
          *((_BYTE *)v31 + 384) = 0;
          *((_BYTE *)v31 + 672) = 0;
          v30 += 38;
        }
        while (v30 != 114);
        ++v28;
        v29 += 116;
      }
      while (v28 != 64);
      v32 = STS_N_Log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = *v9;
        v34 = objc_msgSend(MEMORY[0x24BDB6BF0], "maxNumberOfPerLabelStates");
        LODWORD(buf.__r_.__value_.__l.__data_) = 134219520;
        *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = a1;
        WORD2(buf.__r_.__value_.__r.__words[1]) = 2048;
        *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = v11;
        HIWORD(buf.__r_.__value_.__r.__words[2]) = 2048;
        v45 = v11 / v33;
        *(_WORD *)v46 = 2048;
        *(_QWORD *)&v46[2] = v33;
        *(_WORD *)&v46[10] = 2048;
        *(_QWORD *)&v46[12] = v25;
        *(_WORD *)&v46[20] = 2048;
        *(_QWORD *)&v46[22] = 59760;
        v47 = 2048;
        v48 = v34;
        _os_log_impl(&dword_2290E3000, v32, OS_LOG_TYPE_DEFAULT, "sts %p created %zd-byte (%lu pages of %zd bytes each) sharedMemoryRegion %p to cover storage of size %zd bytes with a capacity for %zu labels", (uint8_t *)&buf, 0x48u);
      }
    }
    v13 = xpc_dictionary_create(0, 0, 0);
    if (v13)
    {
      v14 = xpc_shmem_create(*(void **)(v6 + 32), v11);
      if (v14)
      {
        xpc_dictionary_set_value(v13, "sharedstorage", v14);
        xpc_release(v14);
        v15 = (void *)xpc_mach_send_create();
        if (v15)
        {
          xpc_dictionary_set_value(v13, "controlsemaphore", v15);
          xpc_release(v15);
          xpc_dictionary_set_BOOL(v13, "allowautomaticheadtracking", *(_BYTE *)(v6 + 49));
          if (!v12)
          {
            DerivedStorage = (uint64_t *)softLink_CMBaseObjectGetDerivedStorage(a1);
            v18 = *DerivedStorage;
            v17 = (std::__shared_weak_count *)DerivedStorage[1];
            if (v17)
            {
              p_shared_weak_owners = (unint64_t *)&v17->__shared_weak_owners_;
              do
                v20 = __ldxr(p_shared_weak_owners);
              while (__stxr(v20 + 1, p_shared_weak_owners));
            }
            std::string::basic_string[abi:ne180100]<0>(&__p, "spatial tracking service");
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
              std::string::__init_copy_ctor_external(&buf, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
            else
              buf = __p;
            LOBYTE(v45) = 1;
            *(_QWORD *)v46 = 0x100000037;
            *(_DWORD *)&v46[16] = 2;
            v46[20] = 1;
            *(_DWORD *)&v46[24] = 1;
            v46[28] = 1;
            if (v17)
            {
              v36 = (unint64_t *)&v17->__shared_weak_owners_;
              do
                v37 = __ldxr(v36);
              while (__stxr(v37 + 1, v36));
            }
            v41 = 0;
            v42 = 0;
            v38 = operator new();
            std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100]((std::string *)v38, (__int128 *)&buf);
            *(_OWORD *)(v38 + 32) = *(_OWORD *)v46;
            *(_OWORD *)(v38 + 45) = *(_OWORD *)&v46[13];
            *(_QWORD *)(v38 + 64) = a1;
            *(_QWORD *)(v38 + 72) = v18;
            *(_QWORD *)(v38 + 80) = v17;
            v43 = v38;
            caulk::thread::start((caulk::thread *)&v41, (caulk::thread::attributes *)v38, (void *(*)(void *))caulk::thread_proxy<std::tuple<caulk::thread::attributes,STS_N_CopyShmem(OpaqueFigSTS *,__CFString const*,NSObject  {objcproto13OS_xpc_object}**)::$_0,std::tuple<>>>, (void *)v38);
            v43 = 0;
            std::unique_ptr<std::tuple<caulk::thread::attributes,STS_N_CopyShmem(OpaqueFigSTS *,__CFString const*,NSObject  {objcproto13OS_xpc_object}**)::$_0,std::tuple<>>>::~unique_ptr[abi:ne180100](&v43);
            if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
              operator delete(buf.__r_.__value_.__l.__data_);
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
              operator delete(__p.__r_.__value_.__l.__data_);
            caulk::thread::~thread((caulk::thread *)&v41);
            if (v17)
              std::__shared_weak_count::__release_weak(v17);
          }
          v23 = 0;
          goto LABEL_56;
        }
        v35 = STS_N_Log();
        if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          goto LABEL_42;
        LODWORD(buf.__r_.__value_.__l.__data_) = 136315394;
        *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"STS_N_CopyShmem";
        WORD2(buf.__r_.__value_.__r.__words[1]) = 1024;
        *(_DWORD *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = 492;
        goto LABEL_41;
      }
      v35 = STS_N_Log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf.__r_.__value_.__l.__data_) = 136315394;
        *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"STS_N_CopyShmem";
        WORD2(buf.__r_.__value_.__r.__words[1]) = 1024;
        *(_DWORD *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = 486;
        goto LABEL_41;
      }
    }
    else
    {
      v35 = STS_N_Log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf.__r_.__value_.__l.__data_) = 136315394;
        *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"STS_N_CopyShmem";
        WORD2(buf.__r_.__value_.__r.__words[1]) = 1024;
        *(_DWORD *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = 482;
LABEL_41:
        _os_log_error_impl(&dword_2290E3000, v35, OS_LOG_TYPE_ERROR, "%s:%d error", (uint8_t *)&buf, 0x12u);
      }
    }
LABEL_42:
    v23 = 4294951305;
    goto LABEL_57;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf.__r_.__value_.__l.__data_) = 136315394;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"STS_N_CopyShmem";
    WORD2(buf.__r_.__value_.__r.__words[1]) = 1024;
    *(_DWORD *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = 456;
    v22 = v8;
    goto LABEL_44;
  }
LABEL_22:
  v23 = 4294951306;
LABEL_57:
  os_unfair_lock_unlock((os_unfair_lock_t)v6);
  return v23;
}

void sub_2290EC320(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  os_unfair_lock_s *v23;
  std::__shared_weak_count *v24;

  if (a14 < 0)
    operator delete(__p);
  if (v24)
    std::__shared_weak_count::__release_weak(v24);
  os_unfair_lock_unlock(v23);
  _Unwind_Resume(a1);
}

std::string *std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](std::string *this, __int128 *a2)
{
  __int128 v3;

  this->__r_.__value_.__s.__data_[0] = 0;
  this[1].__r_.__value_.__s.__data_[0] = 0;
  if (*((_BYTE *)a2 + 24))
  {
    if (*((char *)a2 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
    }
    else
    {
      v3 = *a2;
      this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
      *(_OWORD *)&this->__r_.__value_.__l.__data_ = v3;
    }
    this[1].__r_.__value_.__s.__data_[0] = 1;
  }
  return this;
}

void sub_2290EC43C(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(_BYTE *)(v1 + 24))
  {
    if (*(char *)(v1 + 23) < 0)
      operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t caulk::thread_proxy<std::tuple<caulk::thread::attributes,STS_N_CopyShmem(OpaqueFigSTS *,__CFString const*,NSObject  {objcproto13OS_xpc_object}**)::$_0,std::tuple<>>>(caulk::thread::attributes *a1)
{
  uint64_t v1;
  unint64_t v2;
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  char v10;
  NSObject *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  int v14;
  int v15;
  std::__shared_weak_count *v16;
  std::__shared_weak_count *v17;
  uint64_t v18;
  unsigned int *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  NSObject *v27;
  char v28;
  unsigned int *v29;
  unsigned int *v30;
  unint64_t v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  size_t v36;
  uint64_t *v37;
  int v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint8x8_t v42;
  unsigned __int8 **v43;
  unsigned __int8 *v44;
  unint64_t v45;
  char *v46;
  float v47;
  _BOOL8 v48;
  unint64_t v49;
  unint64_t v50;
  size_t v51;
  uint64_t v52;
  _QWORD *v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  void **v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unsigned int *v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint8x8_t v71;
  unint64_t v72;
  unint64_t v73;
  __int128 **v74;
  __int128 *v75;
  unint64_t v76;
  __int128 *v77;
  __int128 *v78;
  unint64_t v79;
  unint64_t v80;
  uint64_t v81;
  unint64_t v82;
  unsigned __int8 *v83;
  unint64_t v84;
  NSObject *v85;
  Class v86;
  unint64_t v87;
  unint64_t v88;
  unint64_t v89;
  uint8x8_t v90;
  unint64_t v91;
  void **v92;
  char *v93;
  unint64_t v94;
  std::string *v95;
  float v96;
  float v97;
  _BOOL8 v98;
  unint64_t v99;
  unint64_t v100;
  int8x8_t prime;
  int8x8_t v102;
  void *v103;
  void *v104;
  uint64_t v105;
  _QWORD *v106;
  unint64_t v107;
  uint8x8_t v108;
  unint64_t v109;
  uint8x8_t v110;
  uint64_t v111;
  _QWORD *v112;
  unint64_t v113;
  void *v114;
  _QWORD *v115;
  unint64_t v116;
  os_unfair_lock_s *v117;
  int v118;
  uint64_t v119;
  uint64_t v120;
  float *v121;
  int8x8_t v122;
  uint8x8_t v123;
  unint64_t v124;
  _QWORD *v125;
  _QWORD *i;
  unint64_t v127;
  BOOL v128;
  int v129;
  std::string *p_p;
  NSObject *v131;
  const char *v132;
  std::string *v133;
  int v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  int v138;
  const void *v139;
  _BOOL4 v140;
  uint64_t **k;
  OSStatus v142;
  OSStatus v143;
  OSStatus v144;
  OSStatus v145;
  OSStatus v146;
  OSStatus v147;
  int v148;
  float32x4_t v149;
  uint64_t **j;
  OSStatus v151;
  uint64_t *m;
  unsigned __int8 *v153;
  int8x8_t v154;
  unint64_t v155;
  uint8x8_t v156;
  unsigned __int8 *v157;
  unsigned __int8 *v158;
  unint64_t v159;
  unint64_t v160;
  uint64_t v161;
  unint64_t v162;
  uint64_t v163;
  unint64_t v164;
  int8x8_t v165;
  unint64_t v166;
  uint8x8_t v167;
  unint64_t v168;
  unint64_t v169;
  unsigned __int8 **v170;
  unsigned __int8 *n;
  unint64_t v172;
  uint64_t v173;
  uint64_t v174;
  unint64_t *v175;
  unint64_t v176;
  NSObject *v177;
  std::__shared_weak_count *v179;
  uint64_t v180;
  unint64_t v181;
  unint64_t v182;
  uint64_t lock;
  os_unfair_lock_t locka;
  unint64_t v185;
  unsigned __int8 *v186;
  uint64_t v187;
  caulk::thread::attributes *v188;
  std::string __p;
  __int128 v190;
  __int128 v191;
  float v192;
  _QWORD v193[2];
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  _DWORD inData[3];
  AudioUnitParameterValue v199;
  uint64_t v200;
  uint8_t buf[16];
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  std::string v206;
  uint64_t v207;
  std::string v208;
  uint64_t v209;

  v209 = *MEMORY[0x24BDAC8D0];
  v188 = a1;
  caulk::thread::attributes::apply_to_this_thread(a1);
  v1 = (uint64_t)v188;
  v2 = (unint64_t)"exiting spatial tracking service update thread because storage destructed";
  v180 = (uint64_t)v188;
  while (1)
  {
    v3 = *(std::__shared_weak_count **)(v1 + 80);
    if (!v3)
    {
      v5 = 0;
LABEL_10:
      v11 = STS_N_Log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2290E3000, v11, OS_LOG_TYPE_DEFAULT, "exiting spatial tracking service update thread because storage destructed", buf, 2u);
      }
      if (!v5)
        goto LABEL_408;
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v13 = __ldaxr(p_shared_owners);
      while (__stlxr(v13 - 1, p_shared_owners));
      if (v13)
        goto LABEL_408;
      v7 = 0;
      v10 = 1;
      goto LABEL_17;
    }
    v4 = std::__shared_weak_count::lock(v3);
    v5 = v4;
    if (!v4)
      goto LABEL_10;
    v6 = *(_QWORD *)(v1 + 72);
    if (!v6)
      goto LABEL_10;
    v7 = *(unsigned int *)(v6 + 40);
    v8 = (unint64_t *)&v4->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (v9)
      goto LABEL_18;
    v10 = 0;
LABEL_17:
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
    if ((v10 & 1) != 0)
      goto LABEL_408;
LABEL_18:
    v14 = MEMORY[0x22E2C19C0](v7);
    v15 = v14;
    if (v14 == 14)
      continue;
    if (v14)
      break;
    v16 = *(std::__shared_weak_count **)(v1 + 80);
    if (!v16)
    {
      v17 = 0;
      goto LABEL_35;
    }
    v17 = std::__shared_weak_count::lock(v16);
    if (!v17)
      goto LABEL_35;
    v18 = *(_QWORD *)(v1 + 72);
    if (!v18)
    {
      v2 = (unint64_t)"exiting spatial tracking service update thread because storage destructed";
LABEL_35:
      v27 = STS_N_Log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2290E3000, v27, OS_LOG_TYPE_DEFAULT, "exiting spatial tracking service update thread after successful wait because storage destructed", buf, 2u);
      }
      v28 = 1;
      if (v17)
        goto LABEL_400;
      goto LABEL_404;
    }
    v185 = *(_QWORD *)(v1 + 64);
    os_unfair_lock_lock((os_unfair_lock_t)v18);
    v19 = *(unsigned int **)(v18 + 32);
    if (!v19)
      goto LABEL_399;
    v20 = atomic_load(v19);
    v21 = v20 >> 16;
    if (v20 >> 16 == 0xFFFF)
    {
      LOWORD(v22) = v20;
    }
    else
    {
      do
      {
        while (1)
        {
          v22 = __ldaxr(v19);
          if (v22 != v20)
            break;
          if (!__stlxr(v21 | 0xFFFF0000, v19))
            goto LABEL_39;
        }
        __clrex();
        v21 = v22 >> 16;
        v20 = v22;
      }
      while (v22 >> 16 != 0xFFFF);
    }
    v21 = (unsigned __int16)v22;
    if ((unsigned __int16)v22 == 0xFFFFLL)
    {
      if (!*(_BYTE *)(v18 + 49))
        goto LABEL_52;
      v23 = 0;
      v24 = 0;
      v25 = *(_OWORD *)(MEMORY[0x24BDAEE00] + 16);
      *(_OWORD *)buf = *MEMORY[0x24BDAEE00];
      v202 = v25;
      v26 = *(_OWORD *)(MEMORY[0x24BDAEE00] + 48);
      v203 = *(_OWORD *)(MEMORY[0x24BDAEE00] + 32);
      v204 = v26;
LABEL_47:
      v34 = CADeprecated::TSingleton<STS_N>::instance();
      v193[0] = v24;
      v193[1] = v23;
      v194 = *(_OWORD *)buf;
      v195 = v202;
      v196 = v203;
      v197 = v204;
      STS_N::UpdateGlobalState(v34, (uint64_t)v193);
      goto LABEL_52;
    }
LABEL_39:
    v29 = &v19[28 * v21];
    if (!*((_BYTE *)v29 + 112))
      goto LABEL_410;
    v30 = v29 + 4;
    v31 = *((_QWORD *)v29 + 2);
    v32 = *(_QWORD *)(v18 + 24);
    if (v31)
      v33 = v31 == v32;
    else
      v33 = 1;
    if (v33)
    {
      if (!*(_BYTE *)(v18 + 49))
        goto LABEL_52;
      v24 = *((_QWORD *)v30 + 2);
      v23 = *((_QWORD *)v30 + 3);
      *(_OWORD *)buf = *((_OWORD *)v30 + 2);
      v202 = *((_OWORD *)v30 + 3);
      v203 = *((_OWORD *)v30 + 4);
      v204 = *((_OWORD *)v30 + 5);
      goto LABEL_47;
    }
    if (v31 < v32)
    {
      v1 = (uint64_t)STS_N_Log();
      if (os_log_type_enabled((os_log_t)v1, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2290E3000, (os_log_t)v1, OS_LOG_TYPE_DEFAULT, "global state cycled generations", buf, 2u);
      }
    }
    *(_QWORD *)(v18 + 24) = *(_QWORD *)v30;
    v35 = CADeprecated::TSingleton<STS_N>::instance();
    v202 = *((_OWORD *)v30 + 2);
    v203 = *((_OWORD *)v30 + 3);
    v204 = *((_OWORD *)v30 + 4);
    v205 = *((_OWORD *)v30 + 5);
    *(_OWORD *)buf = *((_OWORD *)v30 + 1);
    STS_N::UpdateGlobalState(v35, (uint64_t)buf);
LABEL_52:
    v36 = *(_QWORD *)(v18 + 80);
    v190 = 0u;
    v191 = 0u;
    v192 = 1.0;
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>((uint64_t)&v190, v36);
    v37 = *(uint64_t **)(v18 + 72);
    v186 = (unsigned __int8 *)(v18 + 72);
    v187 = v18;
    if (!v37)
      goto LABEL_103;
    do
    {
      if (*((char *)v37 + 39) < 0)
        std::string::__init_copy_ctor_external(&v206, (const std::string::value_type *)v37[2], v37[3]);
      else
        v206 = *(std::string *)(v37 + 2);
      v207 = v37[5];
      v38 = SHIBYTE(v206.__r_.__value_.__r.__words[2]);
      if (SHIBYTE(v206.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&v208, v206.__r_.__value_.__l.__data_, v206.__r_.__value_.__l.__size_);
      else
        v208 = v206;
      v39 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)&v208);
      v40 = v39;
      v41 = *((_QWORD *)&v190 + 1);
      if (!*((_QWORD *)&v190 + 1))
        goto LABEL_75;
      v42 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v190 + 8));
      v42.i16[0] = vaddlv_u8(v42);
      v2 = v42.u32[0];
      if (v42.u32[0] > 1uLL)
      {
        v1 = v39;
        if (v39 >= *((_QWORD *)&v190 + 1))
          v1 = v39 % *((_QWORD *)&v190 + 1);
      }
      else
      {
        v1 = (*((_QWORD *)&v190 + 1) - 1) & v39;
      }
      v43 = *(unsigned __int8 ***)(v190 + 8 * v1);
      if (!v43 || (v44 = *v43) == 0)
      {
LABEL_75:
        v46 = (char *)operator new(0x28uLL);
        *(_QWORD *)v46 = 0;
        *((_QWORD *)v46 + 1) = v40;
        *(std::string *)(v46 + 16) = v208;
        memset(&v208, 0, sizeof(v208));
        v47 = (float)(unint64_t)(*((_QWORD *)&v191 + 1) + 1);
        if (!v41 || (float)(v192 * (float)v41) < v47)
        {
          v48 = (v41 & (v41 - 1)) != 0;
          if (v41 < 3)
            v48 = 1;
          v49 = v48 | (2 * v41);
          v50 = vcvtps_u32_f32(v47 / v192);
          if (v49 <= v50)
            v51 = v50;
          else
            v51 = v49;
          std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>((uint64_t)&v190, v51);
          v41 = *((_QWORD *)&v190 + 1);
          if ((*((_QWORD *)&v190 + 1) & (*((_QWORD *)&v190 + 1) - 1)) != 0)
          {
            if (v40 >= *((_QWORD *)&v190 + 1))
              v1 = v40 % *((_QWORD *)&v190 + 1);
            else
              v1 = v40;
          }
          else
          {
            v1 = (*((_QWORD *)&v190 + 1) - 1) & v40;
          }
        }
        v52 = v190;
        v53 = *(_QWORD **)(v190 + 8 * v1);
        if (v53)
        {
          *(_QWORD *)v46 = *v53;
        }
        else
        {
          *(_QWORD *)v46 = v191;
          *(_QWORD *)&v191 = v46;
          *(_QWORD *)(v52 + 8 * v1) = &v191;
          if (!*(_QWORD *)v46)
          {
LABEL_96:
            ++*((_QWORD *)&v191 + 1);
            goto LABEL_97;
          }
          v54 = *(_QWORD *)(*(_QWORD *)v46 + 8);
          if ((v41 & (v41 - 1)) != 0)
          {
            if (v54 >= v41)
              v54 %= v41;
          }
          else
          {
            v54 &= v41 - 1;
          }
          v53 = (_QWORD *)(v190 + 8 * v54);
        }
        *v53 = v46;
        goto LABEL_96;
      }
      while (1)
      {
        v45 = *((_QWORD *)v44 + 1);
        if (v45 == v40)
          break;
        if (v2 > 1)
        {
          if (v45 >= v41)
            v45 %= v41;
        }
        else
        {
          v45 &= v41 - 1;
        }
        if (v45 != v1)
          goto LABEL_75;
LABEL_74:
        v44 = *(unsigned __int8 **)v44;
        if (!v44)
          goto LABEL_75;
      }
      if (!std::equal_to<std::string>::operator()[abi:ne180100](v44 + 16, (unsigned __int8 *)&v208))
        goto LABEL_74;
      if (SHIBYTE(v208.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v208.__r_.__value_.__l.__data_);
LABEL_97:
      if (v38 < 0)
        operator delete(v206.__r_.__value_.__l.__data_);
      v37 = (uint64_t *)*v37;
    }
    while (v37);
LABEL_103:
    v179 = v17;
    v55 = 0;
    v56 = v18;
    v57 = (void **)(v18 + 56);
    v58 = 0x9DDFEA08EB382D69 * (((8 * v185) + 8) ^ HIDWORD(v185));
    v59 = HIDWORD(v185) ^ (v58 >> 47) ^ v58;
    v60 = atomic_load((unint64_t *)(*(_QWORD *)(v56 + 32) + 352));
    v182 = 0x9DDFEA08EB382D69 * ((0x9DDFEA08EB382D69 * v59) ^ ((0x9DDFEA08EB382D69 * v59) >> 47));
    v181 = v60;
    while (v55 < objc_msgSend(MEMORY[0x24BDB6BF0], "maxNumberOfPerLabelStates"))
    {
      if (v55 <= 0x3F && ((v60 >> v55) & 1) != 0)
      {
        v61 = *(_QWORD *)(v187 + 32) + 368;
        v62 = (unsigned int *)(v61 + 928 * v55);
        v63 = atomic_load(v62);
        v64 = v63 >> 16;
        if (v63 >> 16 == 0xFFFF)
        {
          LOWORD(v65) = v63;
        }
        else
        {
          do
          {
            while (1)
            {
              v65 = __ldaxr(v62);
              if (v65 != v63)
                break;
              if (!__stlxr(v64 | 0xFFFF0000, v62))
                goto LABEL_114;
            }
            __clrex();
            v64 = v65 >> 16;
            v63 = v65;
          }
          while (v65 >> 16 != 0xFFFF);
        }
        v64 = (unsigned __int16)v65;
        if ((unsigned __int16)v65 != 0xFFFFLL)
        {
LABEL_114:
          v66 = v61 + 928 * v55 + 304 * v64;
          if (!*(_BYTE *)(v66 + 304))
          {
            _os_assert_log();
            _os_crash();
            __break(1u);
LABEL_410:
            _os_assert_log();
            _os_crash();
            __break(1u);
          }
          v67 = v66 + 16;
          if (*(_QWORD *)(v66 + 16))
          {
            std::string::basic_string[abi:ne180100]<0>(&__p, (char *)(v66 + 24));
            v68 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)&__p);
            v69 = *((_QWORD *)&v190 + 1);
            if (*((_QWORD *)&v190 + 1))
            {
              v70 = v68;
              v71 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v190 + 8));
              v71.i16[0] = vaddlv_u8(v71);
              v72 = v71.u32[0];
              if (v71.u32[0] > 1uLL)
              {
                v73 = v68;
                if (v68 >= *((_QWORD *)&v190 + 1))
                  v73 = v68 % *((_QWORD *)&v190 + 1);
              }
              else
              {
                v73 = (*((_QWORD *)&v190 + 1) - 1) & v68;
              }
              v2 = v190;
              v74 = *(__int128 ***)(v190 + 8 * v73);
              if (v74)
              {
                v75 = *v74;
                if (*v74)
                {
                  lock = *((_QWORD *)&v190 + 1) - 1;
                  do
                  {
                    v76 = *((_QWORD *)v75 + 1);
                    if (v76 == v70)
                    {
                      if (std::equal_to<std::string>::operator()[abi:ne180100]((unsigned __int8 *)v75 + 16, (unsigned __int8 *)&__p))
                      {
                        if (v72 > 1)
                        {
                          if (v70 >= v69)
                            v70 %= v69;
                        }
                        else
                        {
                          v70 &= lock;
                        }
                        v77 = *(__int128 **)(v2 + 8 * v70);
                        do
                        {
                          v78 = v77;
                          v77 = *(__int128 **)v77;
                        }
                        while (v77 != v75);
                        if (v78 == &v191)
                          goto LABEL_151;
                        v79 = *((_QWORD *)v78 + 1);
                        if (v72 > 1)
                        {
                          if (v79 >= v69)
                            v79 %= v69;
                        }
                        else
                        {
                          v79 &= lock;
                        }
                        if (v79 != v70)
                        {
LABEL_151:
                          if (!*(_QWORD *)v75)
                            goto LABEL_152;
                          v80 = *(_QWORD *)(*(_QWORD *)v75 + 8);
                          if (v72 > 1)
                          {
                            if (v80 >= v69)
                              v80 %= v69;
                          }
                          else
                          {
                            v80 &= lock;
                          }
                          if (v80 != v70)
LABEL_152:
                            *(_QWORD *)(v2 + 8 * v70) = 0;
                        }
                        v81 = *(_QWORD *)v75;
                        if (*(_QWORD *)v75)
                        {
                          v82 = *(_QWORD *)(v81 + 8);
                          if (v72 > 1)
                          {
                            if (v82 >= v69)
                              v82 %= v69;
                          }
                          else
                          {
                            v82 &= lock;
                          }
                          if (v82 != v70)
                          {
                            *(_QWORD *)(v190 + 8 * v82) = v78;
                            v81 = *(_QWORD *)v75;
                          }
                        }
                        *(_QWORD *)v78 = v81;
                        *(_QWORD *)v75 = 0;
                        --*((_QWORD *)&v191 + 1);
                        std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,unsigned long long>,void *>>>::operator()[abi:ne180100](1, (void **)v75);
                        break;
                      }
                    }
                    else
                    {
                      if (v72 > 1)
                      {
                        if (v76 >= v69)
                          v76 %= v69;
                      }
                      else
                      {
                        v76 &= lock;
                      }
                      if (v76 != v73)
                        break;
                    }
                    v75 = *(__int128 **)v75;
                  }
                  while (v75);
                }
              }
            }
            v83 = std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>>>::find<std::string>(v57, (unsigned __int8 *)&__p);
            if (v83)
            {
              v2 = (unint64_t)v83;
              v84 = *((_QWORD *)v83 + 5);
              if (*(_QWORD *)v67 != v84)
              {
                if (*(_QWORD *)v67 < v84)
                {
                  v85 = STS_N_Log();
                  if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
                  {
                    LODWORD(v206.__r_.__value_.__l.__data_) = 136315138;
                    *(std::string::size_type *)((char *)v206.__r_.__value_.__r.__words + 4) = v67 + 8;
                    _os_log_impl(&dword_2290E3000, v85, OS_LOG_TYPE_DEFAULT, "label %s cycled state generations", (uint8_t *)&v206, 0xCu);
                  }
                }
                *(_QWORD *)(v2 + 40) = *(_QWORD *)v67;
                goto LABEL_250;
              }
LABEL_327:
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
                operator delete(__p.__r_.__value_.__l.__data_);
              v60 = v181;
              goto LABEL_330;
            }
            v86 = *(Class *)v67;
            v87 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)&__p);
            v88 = v87;
            v89 = *(_QWORD *)(v187 + 64);
            if (v89)
            {
              v90 = (uint8x8_t)vcnt_s8((int8x8_t)v89);
              v90.i16[0] = vaddlv_u8(v90);
              v91 = v90.u32[0];
              if (v90.u32[0] > 1uLL)
              {
                v2 = v87;
                if (v87 >= v89)
                  v2 = v87 % v89;
              }
              else
              {
                v2 = (v89 - 1) & v87;
              }
              v92 = (void **)*((_QWORD *)*v57 + v2);
              if (v92)
              {
                v93 = (char *)*v92;
                if (*v92)
                {
                  do
                  {
                    v94 = *((_QWORD *)v93 + 1);
                    if (v94 == v88)
                    {
                      if (std::equal_to<std::string>::operator()[abi:ne180100]((unsigned __int8 *)v93 + 16, (unsigned __int8 *)&__p))
                      {
                        goto LABEL_249;
                      }
                    }
                    else
                    {
                      if (v91 > 1)
                      {
                        if (v94 >= v89)
                          v94 %= v89;
                      }
                      else
                      {
                        v94 &= v89 - 1;
                      }
                      if (v94 != v2)
                        break;
                    }
                    v93 = *(char **)v93;
                  }
                  while (v93);
                }
              }
            }
            v93 = (char *)operator new(0x30uLL);
            *(_QWORD *)v93 = 0;
            *((_QWORD *)v93 + 1) = v88;
            v95 = (std::string *)(v93 + 16);
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
            {
              std::string::__init_copy_ctor_external(v95, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
            }
            else
            {
              *(_OWORD *)&v95->__r_.__value_.__l.__data_ = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
              *((_QWORD *)v93 + 4) = *((_QWORD *)&__p.__r_.__value_.__l + 2);
            }
            *((_QWORD *)v93 + 5) = 0;
            v96 = (float)(unint64_t)(*(_QWORD *)(v187 + 80) + 1);
            v97 = *(float *)(v187 + 88);
            if (!v89 || (float)(v97 * (float)v89) < v96)
            {
              v98 = (v89 & (v89 - 1)) != 0;
              if (v89 < 3)
                v98 = 1;
              v99 = v98 | (2 * v89);
              v100 = vcvtps_u32_f32(v96 / v97);
              if (v99 <= v100)
                prime = (int8x8_t)v100;
              else
                prime = (int8x8_t)v99;
              if (*(_QWORD *)&prime == 1)
              {
                prime = (int8x8_t)2;
              }
              else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
              {
                prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
              }
              v102 = *(int8x8_t *)(v187 + 64);
              if (*(_QWORD *)&prime <= *(_QWORD *)&v102)
              {
                if (*(_QWORD *)&prime < *(_QWORD *)&v102)
                {
                  v109 = vcvtps_u32_f32((float)*(unint64_t *)(v187 + 80) / *(float *)(v187 + 88));
                  if (*(_QWORD *)&v102 < 3uLL
                    || (v110 = (uint8x8_t)vcnt_s8(v102), v110.i16[0] = vaddlv_u8(v110), v110.u32[0] > 1uLL))
                  {
                    v109 = std::__next_prime(v109);
                  }
                  else
                  {
                    v111 = 1 << -(char)__clz(v109 - 1);
                    if (v109 >= 2)
                      v109 = v111;
                  }
                  if (*(_QWORD *)&prime <= v109)
                    prime = (int8x8_t)v109;
                  if (*(_QWORD *)&prime < *(_QWORD *)&v102)
                  {
                    if (prime)
                      goto LABEL_198;
                    v114 = *v57;
                    *v57 = 0;
                    if (v114)
                      operator delete(v114);
                    *(_QWORD *)(v187 + 64) = 0;
                  }
                }
              }
              else
              {
LABEL_198:
                if (*(_QWORD *)&prime >> 61)
                  std::__throw_bad_array_new_length[abi:ne180100]();
                v103 = operator new(8 * *(_QWORD *)&prime);
                v104 = *v57;
                *v57 = v103;
                if (v104)
                  operator delete(v104);
                v105 = 0;
                *(int8x8_t *)(v187 + 64) = prime;
                do
                  *((_QWORD *)*v57 + v105++) = 0;
                while (*(_QWORD *)&prime != v105);
                v106 = *(_QWORD **)v186;
                if (*(_QWORD *)v186)
                {
                  v107 = v106[1];
                  v108 = (uint8x8_t)vcnt_s8(prime);
                  v108.i16[0] = vaddlv_u8(v108);
                  if (v108.u32[0] > 1uLL)
                  {
                    if (v107 >= *(_QWORD *)&prime)
                      v107 %= *(_QWORD *)&prime;
                  }
                  else
                  {
                    v107 &= *(_QWORD *)&prime - 1;
                  }
                  *((_QWORD *)*v57 + v107) = v186;
                  v112 = (_QWORD *)*v106;
                  if (*v106)
                  {
                    do
                    {
                      v113 = v112[1];
                      if (v108.u32[0] > 1uLL)
                      {
                        if (v113 >= *(_QWORD *)&prime)
                          v113 %= *(_QWORD *)&prime;
                      }
                      else
                      {
                        v113 &= *(_QWORD *)&prime - 1;
                      }
                      if (v113 != v107)
                      {
                        if (!*((_QWORD *)*v57 + v113))
                        {
                          *((_QWORD *)*v57 + v113) = v106;
                          goto LABEL_223;
                        }
                        *v106 = *v112;
                        *v112 = **((_QWORD **)*v57 + v113);
                        **((_QWORD **)*v57 + v113) = v112;
                        v112 = v106;
                      }
                      v113 = v107;
LABEL_223:
                      v106 = v112;
                      v112 = (_QWORD *)*v112;
                      v107 = v113;
                    }
                    while (v112);
                  }
                }
              }
              v89 = *(_QWORD *)(v187 + 64);
              if ((v89 & (v89 - 1)) != 0)
              {
                if (v88 >= v89)
                  v2 = v88 % v89;
                else
                  v2 = v88;
              }
              else
              {
                v2 = (v89 - 1) & v88;
              }
            }
            v115 = (_QWORD *)*((_QWORD *)*v57 + v2);
            if (v115)
            {
              *(_QWORD *)v93 = *v115;
              goto LABEL_247;
            }
            *(_QWORD *)v93 = *(_QWORD *)v186;
            *(_QWORD *)v186 = v93;
            *((_QWORD *)*v57 + v2) = v186;
            if (*(_QWORD *)v93)
            {
              v116 = *(_QWORD *)(*(_QWORD *)v93 + 8);
              if ((v89 & (v89 - 1)) != 0)
              {
                if (v116 >= v89)
                  v116 %= v89;
              }
              else
              {
                v116 &= v89 - 1;
              }
              v115 = (char *)*v57 + 8 * v116;
LABEL_247:
              *v115 = v93;
            }
            ++*(_QWORD *)(v187 + 80);
LABEL_249:
            *((_QWORD *)v93 + 5) = v86;
LABEL_250:
            v117 = (os_unfair_lock_s *)CADeprecated::TSingleton<STS_N>::instance();
            v118 = *(unsigned __int8 *)(v67 + 272);
            v200 = 0;
            v199 = 0.0;
            STS_N_CalculateAngularOrientationFromTransform(v67 + 192, (float *)&v200, (float *)&v200 + 1, &v199);
            os_unfair_lock_lock(v117);
            locka = v117;
            v119 = STS_N::InfoForLabel((uint64_t)v117, (unsigned __int8 *)&__p);
            v120 = v119;
            if (v185)
            {
              v121 = (float *)(v119 + 24);
              v122 = *(int8x8_t *)(v120 + 32);
              if (v122)
              {
                v123 = (uint8x8_t)vcnt_s8(v122);
                v123.i16[0] = vaddlv_u8(v123);
                if (v123.u32[0] > 1uLL)
                {
                  v124 = v182;
                  if (v182 >= *(_QWORD *)&v122)
                    v124 = v182 % *(_QWORD *)&v122;
                }
                else
                {
                  v124 = v182 & (*(_QWORD *)&v122 - 1);
                }
                v125 = *(_QWORD **)(*(_QWORD *)v121 + 8 * v124);
                if (v125)
                {
                  for (i = (_QWORD *)*v125; i; i = (_QWORD *)*i)
                  {
                    v127 = i[1];
                    if (v182 == v127)
                    {
                      if (i[2] == v185)
                        goto LABEL_272;
                    }
                    else
                    {
                      if (v123.u32[0] > 1uLL)
                      {
                        if (v127 >= *(_QWORD *)&v122)
                          v127 %= *(_QWORD *)&v122;
                      }
                      else
                      {
                        v127 &= *(_QWORD *)&v122 - 1;
                      }
                      if (v127 != v124)
                        break;
                    }
                  }
                }
              }
              std::__hash_table<OpaqueFigSTS *,std::hash<OpaqueFigSTS *>,std::equal_to<OpaqueFigSTS *>,std::allocator<OpaqueFigSTS *>>::__emplace_unique_key_args<OpaqueFigSTS *,OpaqueFigSTS * const&>(v121, v185, v185);
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
                std::string::__init_copy_ctor_external(&v206, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
              else
                v206 = __p;
              STS_N::LabelValidityDidChange((STS_N *)v117, (unsigned __int8 *)&v206);
              if (SHIBYTE(v206.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v206.__r_.__value_.__l.__data_);
            }
LABEL_272:
            if (*(_BYTE *)(v120 + 152))
              v128 = 1;
            else
              v128 = v118 == 0;
            v129 = !v128;
            if (!v128)
            {
              STS_N_Log();
              v2 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_DEFAULT))
              {
                p_p = &__p;
                if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                  p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
                LODWORD(v208.__r_.__value_.__l.__data_) = 136315138;
                *(std::string::size_type *)((char *)v208.__r_.__value_.__r.__words + 4) = (std::string::size_type)p_p;
                v131 = v2;
                v132 = "STSLabel %s is deferring to system tuning";
                goto LABEL_289;
              }
              goto LABEL_290;
            }
            if (*(_BYTE *)(v120 + 152) && !v118)
            {
              STS_N_Log();
              v2 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_DEFAULT))
              {
                v133 = &__p;
                if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                  v133 = (std::string *)__p.__r_.__value_.__r.__words[0];
                LODWORD(v208.__r_.__value_.__l.__data_) = 136315138;
                *(std::string::size_type *)((char *)v208.__r_.__value_.__r.__words + 4) = (std::string::size_type)v133;
                v131 = v2;
                v132 = "STSLabel %s is no longer deferring to system tuning";
LABEL_289:
                _os_log_impl(&dword_2290E3000, v131, OS_LOG_TYPE_DEFAULT, v132, (uint8_t *)&v208, 0xCu);
              }
LABEL_290:

            }
            v134 = *(unsigned __int8 *)(v120 + 240);
            *(_OWORD *)(v120 + 160) = *(_OWORD *)(v67 + 192);
            v135 = *(_OWORD *)(v67 + 256);
            v137 = *(_OWORD *)(v67 + 208);
            v136 = *(_OWORD *)(v67 + 224);
            *(_OWORD *)(v120 + 208) = *(_OWORD *)(v67 + 240);
            *(_OWORD *)(v120 + 224) = v135;
            *(_OWORD *)(v120 + 176) = v137;
            *(_OWORD *)(v120 + 192) = v136;
            if (!v134)
              *(_BYTE *)(v120 + 240) = 1;
            *(_BYTE *)(v120 + 152) = v118;
            if (v129)
            {
              objc_msgSend(*(id *)(v120 + 144), "fireAll");
              STS_N::ApplyStoredPerLabelStateToSpatializers((uint64_t)locka, v120, 0);
              STS_N::SetSoundStageTransitionDurationOnSpatializers(v120);
              STS_N::SetSoundStageSizeOnSpatializers(v120, *(_DWORD *)(v120 + 136));
            }
            v138 = *(_DWORD *)(v120 + 116);
            if (v138 == 20)
            {
              v139 = (const void *)(v67 + 256);
              v140 = *(_DWORD *)(v67 + 256) == 1;
            }
            else
            {
              if (*(_BYTE *)(v120 + 152) || !*(_BYTE *)(v120 + 240))
                v148 = 3;
              else
                v148 = *(_DWORD *)(v120 + 224);
              v139 = (const void *)(v67 + 256);
              v140 = v148 == *(_DWORD *)(v67 + 256);
              if (!v138)
              {
                if (LOBYTE(locka[44]._os_unfair_lock_opaque))
                {
                  v149 = vsubq_f32(*(float32x4_t *)(v67 + 240), *(float32x4_t *)&locka[40]._os_unfair_lock_opaque);
                  inData[0] = v149.i32[0];
                  *(float *)&inData[1] = -v149.f32[2];
                  inData[2] = v149.i32[1];
                  for (j = *(uint64_t ***)(v120 + 80); j; j = (uint64_t **)*j)
                  {
                    v151 = AudioUnitSetProperty((AudioUnit)j[2], 0xC2Bu, 0, 0, inData, 0xCu);
                    if (v151)
                    {
                      STS_N_Log();
                      v2 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_ERROR))
                      {
                        LODWORD(v208.__r_.__value_.__l.__data_) = 136315650;
                        *(std::string::size_type *)((char *)v208.__r_.__value_.__r.__words + 4) = (std::string::size_type)"UpdateLabelState";
                        WORD2(v208.__r_.__value_.__r.__words[1]) = 1024;
                        *(_DWORD *)((char *)&v208.__r_.__value_.__r.__words[1] + 6) = 282;
                        WORD1(v208.__r_.__value_.__r.__words[2]) = 1024;
                        HIDWORD(v208.__r_.__value_.__r.__words[2]) = v151;
                        _os_log_error_impl(&dword_2290E3000, (os_log_t)v2, OS_LOG_TYPE_ERROR, "%s:%d error: %d", (uint8_t *)&v208, 0x18u);
                      }

                    }
                  }
                }
              }
            }
            for (k = *(uint64_t ***)(v120 + 80); k; k = (uint64_t **)*k)
            {
              if (!v138)
              {
                v142 = AudioUnitSetParameter((AudioUnit)k[2], 0x16u, 1u, 0, *(AudioUnitParameterValue *)&v200, 0);
                if (v142)
                {
                  STS_N_Log();
                  v2 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_ERROR))
                  {
                    LODWORD(v208.__r_.__value_.__l.__data_) = 136315650;
                    *(std::string::size_type *)((char *)v208.__r_.__value_.__r.__words + 4) = (std::string::size_type)"UpdateLabelState";
                    WORD2(v208.__r_.__value_.__r.__words[1]) = 1024;
                    *(_DWORD *)((char *)&v208.__r_.__value_.__r.__words[1] + 6) = 290;
                    WORD1(v208.__r_.__value_.__r.__words[2]) = 1024;
                    HIDWORD(v208.__r_.__value_.__r.__words[2]) = v142;
                    _os_log_error_impl(&dword_2290E3000, (os_log_t)v2, OS_LOG_TYPE_ERROR, "%s:%d error: %d", (uint8_t *)&v208, 0x18u);
                  }

                }
                v143 = AudioUnitSetParameter((AudioUnit)k[2], 0x17u, 1u, 0, *((AudioUnitParameterValue *)&v200 + 1), 0);
                if (v143)
                {
                  STS_N_Log();
                  v2 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_ERROR))
                  {
                    LODWORD(v208.__r_.__value_.__l.__data_) = 136315650;
                    *(std::string::size_type *)((char *)v208.__r_.__value_.__r.__words + 4) = (std::string::size_type)"UpdateLabelState";
                    WORD2(v208.__r_.__value_.__r.__words[1]) = 1024;
                    *(_DWORD *)((char *)&v208.__r_.__value_.__r.__words[1] + 6) = 291;
                    WORD1(v208.__r_.__value_.__r.__words[2]) = 1024;
                    HIDWORD(v208.__r_.__value_.__r.__words[2]) = v143;
                    _os_log_error_impl(&dword_2290E3000, (os_log_t)v2, OS_LOG_TYPE_ERROR, "%s:%d error: %d", (uint8_t *)&v208, 0x18u);
                  }

                }
                v144 = AudioUnitSetParameter((AudioUnit)k[2], 0x18u, 1u, 0, v199, 0);
                if (v144)
                {
                  STS_N_Log();
                  v2 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_ERROR))
                  {
                    LODWORD(v208.__r_.__value_.__l.__data_) = 136315650;
                    *(std::string::size_type *)((char *)v208.__r_.__value_.__r.__words + 4) = (std::string::size_type)"UpdateLabelState";
                    WORD2(v208.__r_.__value_.__r.__words[1]) = 1024;
                    *(_DWORD *)((char *)&v208.__r_.__value_.__r.__words[1] + 6) = 292;
                    WORD1(v208.__r_.__value_.__r.__words[2]) = 1024;
                    HIDWORD(v208.__r_.__value_.__r.__words[2]) = v144;
                    _os_log_error_impl(&dword_2290E3000, (os_log_t)v2, OS_LOG_TYPE_ERROR, "%s:%d error: %d", (uint8_t *)&v208, 0x18u);
                  }

                }
              }
              if (!*(_BYTE *)(v120 + 152))
              {
                v145 = AudioUnitSetParameter((AudioUnit)k[2], 3u, 1u, 0, *(AudioUnitParameterValue *)(v67 + 260), 0);
                if (v145)
                {
                  STS_N_Log();
                  v2 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_ERROR))
                  {
                    LODWORD(v208.__r_.__value_.__l.__data_) = 136315650;
                    *(std::string::size_type *)((char *)v208.__r_.__value_.__r.__words + 4) = (std::string::size_type)"UpdateLabelState";
                    WORD2(v208.__r_.__value_.__r.__words[1]) = 1024;
                    *(_DWORD *)((char *)&v208.__r_.__value_.__r.__words[1] + 6) = 298;
                    WORD1(v208.__r_.__value_.__r.__words[2]) = 1024;
                    HIDWORD(v208.__r_.__value_.__r.__words[2]) = v145;
                    _os_log_error_impl(&dword_2290E3000, (os_log_t)v2, OS_LOG_TYPE_ERROR, "%s:%d error: %d", (uint8_t *)&v208, 0x18u);
                  }

                }
                v146 = AudioUnitSetParameter((AudioUnit)k[2], 0x23u, 1u, 0, *(AudioUnitParameterValue *)(v67 + 264), 0);
                if (v146)
                {
                  STS_N_Log();
                  v2 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_ERROR))
                  {
                    LODWORD(v208.__r_.__value_.__l.__data_) = 136315650;
                    *(std::string::size_type *)((char *)v208.__r_.__value_.__r.__words + 4) = (std::string::size_type)"UpdateLabelState";
                    WORD2(v208.__r_.__value_.__r.__words[1]) = 1024;
                    *(_DWORD *)((char *)&v208.__r_.__value_.__r.__words[1] + 6) = 301;
                    WORD1(v208.__r_.__value_.__r.__words[2]) = 1024;
                    HIDWORD(v208.__r_.__value_.__r.__words[2]) = v146;
                    _os_log_error_impl(&dword_2290E3000, (os_log_t)v2, OS_LOG_TYPE_ERROR, "%s:%d error: %d", (uint8_t *)&v208, 0x18u);
                  }

                }
              }
              if (v140)
              {
                v147 = AudioUnitSetProperty((AudioUnit)k[2], 0xBBDu, 1u, 0, v139, 4u);
                if (v147)
                {
                  STS_N_Log();
                  v2 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_ERROR))
                  {
                    LODWORD(v208.__r_.__value_.__l.__data_) = 136315650;
                    *(std::string::size_type *)((char *)v208.__r_.__value_.__r.__words + 4) = (std::string::size_type)"UpdateLabelState";
                    WORD2(v208.__r_.__value_.__r.__words[1]) = 1024;
                    *(_DWORD *)((char *)&v208.__r_.__value_.__r.__words[1] + 6) = 311;
                    WORD1(v208.__r_.__value_.__r.__words[2]) = 1024;
                    HIDWORD(v208.__r_.__value_.__r.__words[2]) = v147;
                    _os_log_error_impl(&dword_2290E3000, (os_log_t)v2, OS_LOG_TYPE_ERROR, "%s:%d error: %d", (uint8_t *)&v208, 0x18u);
                  }

                }
              }
            }
            os_unfair_lock_unlock(locka);
            goto LABEL_327;
          }
        }
      }
LABEL_330:
      ++v55;
    }
    for (m = (uint64_t *)v191; m; m = (uint64_t *)*m)
    {
      v153 = std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>>>::find<std::string>(v57, (unsigned __int8 *)m + 16);
      if (v153)
      {
        v154 = *(int8x8_t *)(v187 + 64);
        v155 = *((_QWORD *)v153 + 1);
        v156 = (uint8x8_t)vcnt_s8(v154);
        v156.i16[0] = vaddlv_u8(v156);
        if (v156.u32[0] > 1uLL)
        {
          if (v155 >= *(_QWORD *)&v154)
            v155 %= *(_QWORD *)&v154;
        }
        else
        {
          v155 &= *(_QWORD *)&v154 - 1;
        }
        v157 = (unsigned __int8 *)*((_QWORD *)*v57 + v155);
        do
        {
          v158 = v157;
          v157 = *(unsigned __int8 **)v157;
        }
        while (v157 != v153);
        if (v158 == v186)
          goto LABEL_363;
        v159 = *((_QWORD *)v158 + 1);
        if (v156.u32[0] > 1uLL)
        {
          if (v159 >= *(_QWORD *)&v154)
            v159 %= *(_QWORD *)&v154;
        }
        else
        {
          v159 &= *(_QWORD *)&v154 - 1;
        }
        if (v159 != v155)
        {
LABEL_363:
          if (!*(_QWORD *)v153)
            goto LABEL_364;
          v160 = *(_QWORD *)(*(_QWORD *)v153 + 8);
          if (v156.u32[0] > 1uLL)
          {
            if (v160 >= *(_QWORD *)&v154)
              v160 %= *(_QWORD *)&v154;
          }
          else
          {
            v160 &= *(_QWORD *)&v154 - 1;
          }
          if (v160 != v155)
LABEL_364:
            *((_QWORD *)*v57 + v155) = 0;
        }
        v161 = *(_QWORD *)v153;
        if (*(_QWORD *)v153)
        {
          v162 = *(_QWORD *)(v161 + 8);
          if (v156.u32[0] > 1uLL)
          {
            if (v162 >= *(_QWORD *)&v154)
              v162 %= *(_QWORD *)&v154;
          }
          else
          {
            v162 &= *(_QWORD *)&v154 - 1;
          }
          if (v162 != v155)
          {
            *((_QWORD *)*v57 + v162) = v158;
            v161 = *(_QWORD *)v153;
          }
        }
        *(_QWORD *)v158 = v161;
        *(_QWORD *)v153 = 0;
        --*(_QWORD *)(v187 + 80);
        std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,unsigned long long>,void *>>>::operator()[abi:ne180100](1, (void **)v153);
      }
      v163 = CADeprecated::TSingleton<STS_N>::instance();
      os_unfair_lock_lock((os_unfair_lock_t)v163);
      v164 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(m + 2));
      v165 = *(int8x8_t *)(v163 + 16);
      if (v165)
      {
        v166 = v164;
        v167 = (uint8x8_t)vcnt_s8(v165);
        v167.i16[0] = vaddlv_u8(v167);
        v168 = v167.u32[0];
        if (v167.u32[0] > 1uLL)
        {
          v169 = v164;
          if (v164 >= *(_QWORD *)&v165)
            v169 = v164 % *(_QWORD *)&v165;
        }
        else
        {
          v169 = (*(_QWORD *)&v165 - 1) & v164;
        }
        v170 = *(unsigned __int8 ***)(*(_QWORD *)(v163 + 8) + 8 * v169);
        if (v170)
        {
          for (n = *v170; n; n = *(unsigned __int8 **)n)
          {
            v172 = *((_QWORD *)n + 1);
            if (v166 == v172)
            {
              if (std::equal_to<std::string>::operator()[abi:ne180100](n + 16, (unsigned __int8 *)m + 16))
              {
                v173 = STS_N::InfoForLabel(v163, (unsigned __int8 *)m + 16);
                v174 = *(_QWORD *)(v173 + 48);
                std::__hash_table<OpaqueFigSTS *,std::hash<OpaqueFigSTS *>,std::equal_to<OpaqueFigSTS *>,std::allocator<OpaqueFigSTS *>>::__erase_unique<OpaqueFigSTS *>((uint64_t *)(v173 + 24), v185);
                if (v174 && !*(_QWORD *)(v173 + 48))
                {
                  if (*((char *)m + 39) < 0)
                    std::string::__init_copy_ctor_external(&v206, (const std::string::value_type *)m[2], m[3]);
                  else
                    v206 = *(std::string *)(m + 2);
                  STS_N::LabelValidityDidChange((STS_N *)v163, (unsigned __int8 *)&v206);
                  if (SHIBYTE(v206.__r_.__value_.__r.__words[2]) < 0)
                    operator delete(v206.__r_.__value_.__l.__data_);
                }
                break;
              }
            }
            else
            {
              if (v168 > 1)
              {
                if (v172 >= *(_QWORD *)&v165)
                  v172 %= *(_QWORD *)&v165;
              }
              else
              {
                v172 &= *(_QWORD *)&v165 - 1;
              }
              if (v172 != v169)
                break;
            }
          }
        }
      }
      os_unfair_lock_unlock((os_unfair_lock_t)v163);
    }
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)&v190);
    v17 = v179;
    v18 = v187;
LABEL_399:
    os_unfair_lock_unlock((os_unfair_lock_t)v18);
    v28 = 0;
    v1 = v180;
    v2 = (unint64_t)"exiting spatial tracking service update thread because storage destructed";
LABEL_400:
    v175 = (unint64_t *)&v17->__shared_owners_;
    do
      v176 = __ldaxr(v175);
    while (__stlxr(v176 - 1, v175));
    if (!v176)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
LABEL_404:
    if ((v28 & 1) != 0)
      goto LABEL_408;
  }
  v177 = STS_N_Log();
  if (os_log_type_enabled(v177, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v15;
    _os_log_error_impl(&dword_2290E3000, v177, OS_LOG_TYPE_ERROR, "exiting spatial tracking service update thread because wait returned %d", buf, 8u);
  }
LABEL_408:
  std::unique_ptr<std::tuple<caulk::thread::attributes,STS_N_CopyShmem(OpaqueFigSTS *,__CFString const*,NSObject  {objcproto13OS_xpc_object}**)::$_0,std::tuple<>>>::~unique_ptr[abi:ne180100]((uint64_t *)&v188);
  return 0;
}

void sub_2290EDD20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,os_unfair_lock_t lock,uint64_t a22,uint64_t a23,os_unfair_lock_s *a24,uint64_t a25,void *__p,uint64_t a27,int a28,__int16 a29,char a30,char a31,char a32)
{
  os_unfair_lock_s *v32;
  unint64_t *p_shared_owners;
  unint64_t v35;

  os_unfair_lock_unlock(v32);
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)&a32);
  os_unfair_lock_unlock(a24);
  p_shared_owners = (unint64_t *)&a11->__shared_owners_;
  do
    v35 = __ldaxr(p_shared_owners);
  while (__stlxr(v35 - 1, p_shared_owners));
  if (!v35)
  {
    ((void (*)(std::__shared_weak_count *))a11->__on_zero_shared)(a11);
    std::__shared_weak_count::__release_weak(a11);
  }
  std::unique_ptr<std::tuple<caulk::thread::attributes,STS_N_CopyShmem(OpaqueFigSTS *,__CFString const*,NSObject  {objcproto13OS_xpc_object}**)::$_0,std::tuple<>>>::~unique_ptr[abi:ne180100](&a25);
  _Unwind_Resume(a1);
}

uint64_t *std::unique_ptr<std::tuple<caulk::thread::attributes,STS_N_CopyShmem(OpaqueFigSTS *,__CFString const*,NSObject  {objcproto13OS_xpc_object}**)::$_0,std::tuple<>>>::~unique_ptr[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    v3 = *(std::__shared_weak_count **)(v2 + 80);
    if (v3)
      std::__shared_weak_count::__release_weak(v3);
    if (*(_BYTE *)(v2 + 24) && *(char *)(v2 + 23) < 0)
      operator delete(*(void **)v2);
    MEMORY[0x22E2C1708](v2, 0x1032C40A8465C26);
  }
  return a1;
}

void std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  size_t v9;
  uint8x8_t v10;
  unint64_t v11;
  uint8x8_t v12;
  uint64_t v13;
  _QWORD *v14;
  size_t v15;
  void *v16;

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
  if (prime <= *(_QWORD *)&v4)
  {
    if (prime >= *(_QWORD *)&v4)
      return;
    v11 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v12 = (uint8x8_t)vcnt_s8(v4), v12.i16[0] = vaddlv_u8(v12), v12.u32[0] > 1uLL))
    {
      v11 = std::__next_prime(v11);
    }
    else
    {
      v13 = 1 << -(char)__clz(v11 - 1);
      if (v11 >= 2)
        v11 = v13;
    }
    if (prime <= v11)
      prime = v11;
    if (prime >= *(_QWORD *)&v4)
      return;
    if (!prime)
    {
      v16 = *(void **)a1;
      *(_QWORD *)a1 = 0;
      if (v16)
        operator delete(v16);
      *(_QWORD *)(a1 + 8) = 0;
      return;
    }
  }
  if (prime >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  v5 = operator new(8 * prime);
  v6 = *(void **)a1;
  *(_QWORD *)a1 = v5;
  if (v6)
    operator delete(v6);
  v7 = 0;
  *(_QWORD *)(a1 + 8) = prime;
  do
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v7++) = 0;
  while (prime != v7);
  v8 = *(_QWORD **)(a1 + 16);
  if (v8)
  {
    v9 = v8[1];
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)prime);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      if (v9 >= prime)
        v9 %= prime;
    }
    else
    {
      v9 &= prime - 1;
    }
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v9) = a1 + 16;
    v14 = (_QWORD *)*v8;
    if (*v8)
    {
      do
      {
        v15 = v14[1];
        if (v10.u32[0] > 1uLL)
        {
          if (v15 >= prime)
            v15 %= prime;
        }
        else
        {
          v15 &= prime - 1;
        }
        if (v15 != v9)
        {
          if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v15))
          {
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v15) = v8;
            goto LABEL_31;
          }
          *v8 = *v14;
          *v14 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v15);
          **(_QWORD **)(*(_QWORD *)a1 + 8 * v15) = v14;
          v14 = v8;
        }
        v15 = v9;
LABEL_31:
        v8 = v14;
        v14 = (_QWORD *)*v14;
        v9 = v15;
      }
      while (v14);
    }
  }
}

uint64_t std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table(uint64_t a1)
{
  void **v2;
  void **v3;
  void *v4;

  v2 = *(void ***)(a1 + 16);
  if (v2)
  {
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
  v4 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v4)
    operator delete(v4);
  return a1;
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,unsigned long long>,void *>>>::operator()[abi:ne180100](char a1, void **__p)
{
  if (a1)
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

void STS_N_EnsureInfoForLabel(uint64_t a1, const void *a2, uint64_t *a3)
{
  uint64_t Value;
  const __CFAllocator *v7;
  const void *v8;
  const __CFDictionary *v9;
  const void *v10;
  CFDictionaryRef *v11;
  CFDictionaryRef *v12;
  CFIndex Count;

  Value = (uint64_t)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), a2);
  if (!Value)
  {
    Value = operator new();
    *(_QWORD *)Value = 0;
    *(_BYTE *)(Value + 8) = 1;
    v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    *(_QWORD *)Value = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
    v8 = (const void *)getkFigSTSLabel_Global();
    if (!CFEqual(a2, v8))
    {
      v9 = *(const __CFDictionary **)(a1 + 16);
      v10 = (const void *)getkFigSTSLabel_Global();
      v11 = (CFDictionaryRef *)CFDictionaryGetValue(v9, v10);
      if (v11)
      {
        v12 = v11;
        CFRelease(*(CFTypeRef *)Value);
        Count = CFDictionaryGetCount(*v12);
        *(_QWORD *)Value = CFDictionaryCreateMutableCopy(v7, Count, *v12);
      }
    }
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), a2, (const void *)Value);
  }
  *a3 = Value;
}

uint64_t getkFigSTSLabel_Global()
{
  void *v0;
  void *v1;
  uint64_t result;
  void *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (void *)getkFigSTSLabel_GlobalSymbolLoc(void)::ptr;
  v7 = getkFigSTSLabel_GlobalSymbolLoc(void)::ptr;
  if (!getkFigSTSLabel_GlobalSymbolLoc(void)::ptr)
  {
    v1 = MediaExperienceLibrary();
    v0 = dlsym(v1, "kFigSTSLabel_Global");
    v5[3] = (uint64_t)v0;
    getkFigSTSLabel_GlobalSymbolLoc(void)::ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (v0)
    return *(_QWORD *)v0;
  v3 = (void *)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  result = objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CFStringRef getkFigSTSLabel_Global()"), CFSTR("STS_N.mm"), 36, CFSTR("%s"), dlerror());
  __break(1u);
  return result;
}

void sub_2290EE388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void STS_N_Finalize(unint64_t a1)
{
  uint64_t v2;
  uint64_t *i;
  uint64_t *v4;
  uint64_t DerivedStorage;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  __int128 v12;

  v2 = CADeprecated::TSingleton<STS_N>::instance();
  os_unfair_lock_lock((os_unfair_lock_t)v2);
  for (i = *(uint64_t **)(v2 + 24); i; i = (uint64_t *)*i)
  {
    while (1)
    {
      std::__hash_table<OpaqueFigSTS *,std::hash<OpaqueFigSTS *>,std::equal_to<OpaqueFigSTS *>,std::allocator<OpaqueFigSTS *>>::__erase_unique<OpaqueFigSTS *>((uint64_t *)(i[5] + 24), a1);
      if (!STS_N::CanDeleteSpatializerInfo(v2, (unsigned __int8 *)i[5]))
        break;
      v4 = (uint64_t *)*i;
      std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>>>::remove((uint64_t)&v12, (_QWORD *)(v2 + 8), i);
      std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,void *>>>>::reset[abi:ne180100]((uint64_t)&v12);
      i = v4;
      if (!v4)
        goto LABEL_6;
    }
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)v2);
  DerivedStorage = softLink_CMBaseObjectGetDerivedStorage(a1);
  v12 = 0uLL;
  std::shared_ptr<STS_N_Storage>::operator=[abi:ne180100](DerivedStorage, &v12);
  v6 = (std::__shared_weak_count *)*((_QWORD *)&v12 + 1);
  if (*((_QWORD *)&v12 + 1))
  {
    v7 = (unint64_t *)(*((_QWORD *)&v12 + 1) + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  v9 = *(std::__shared_weak_count **)(DerivedStorage + 8);
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
}

void sub_2290EE4E0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *STS_N_CopyDebugDescription(const void *a1)
{
  const __CFAllocator *v2;
  __CFString *Mutable;
  CFIndex v4;

  v2 = CFGetAllocator(a1);
  Mutable = CFStringCreateMutable(v2, 0);
  v4 = CFGetRetainCount(a1);
  CFStringAppendFormat(Mutable, 0, CFSTR("<STS_N %p RC: %ld >"), a1, v4);
  return Mutable;
}

uint64_t STS_N_CopyProperty(uint64_t a1, const void *a2, uint64_t a3, CFTypeRef *a4)
{
  CFTypeRef *v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  CFTypeRef *v14;
  void *v15;
  CFTypeRef v16;
  NSObject *v17;
  NSObject *v18;
  void *v20;
  void *v21;
  _BYTE buf[24];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v7 = (CFTypeRef *)getkFigSTSProperty_FlavorSymbolLoc(void)::ptr;
  v23 = getkFigSTSProperty_FlavorSymbolLoc(void)::ptr;
  if (!getkFigSTSProperty_FlavorSymbolLoc(void)::ptr)
  {
    v8 = MediaExperienceLibrary();
    v7 = (CFTypeRef *)dlsym(v8, "kFigSTSProperty_Flavor");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v7;
    getkFigSTSProperty_FlavorSymbolLoc(void)::ptr = (uint64_t)v7;
  }
  _Block_object_dispose(buf, 8);
  if (!v7)
  {
    v20 = (void *)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CFStringRef getkFigSTSProperty_Flavor()"), CFSTR("STS_N.mm"), 37, CFSTR("%s"), dlerror());
    goto LABEL_27;
  }
  if (!CFEqual(a2, *v7))
  {
    v11 = *(_QWORD *)softLink_CMBaseObjectGetDerivedStorage(a1);
    os_unfair_lock_lock((os_unfair_lock_t)v11);
    if (a2)
    {
      v12 = STS_N_Log();
      v13 = v12;
      if (a4)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = a1;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = a2;
          _os_log_debug_impl(&dword_2290E3000, v13, OS_LOG_TYPE_DEBUG, "sts %p copying %@", buf, 0x16u);
        }
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v14 = (CFTypeRef *)getkFigSTSProperty_OptionsDictSymbolLoc(void)::ptr;
        v23 = getkFigSTSProperty_OptionsDictSymbolLoc(void)::ptr;
        if (!getkFigSTSProperty_OptionsDictSymbolLoc(void)::ptr)
        {
          v15 = MediaExperienceLibrary();
          v14 = (CFTypeRef *)dlsym(v15, "kFigSTSProperty_OptionsDict");
          *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v14;
          getkFigSTSProperty_OptionsDictSymbolLoc(void)::ptr = (uint64_t)v14;
        }
        _Block_object_dispose(buf, 8);
        if (!v14)
        {
          while (1)
          {
            v21 = (void *)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CFStringRef getkFigSTSProperty_OptionsDict()"), CFSTR("STS_N.mm"), 38, CFSTR("%s"), dlerror());
LABEL_27:
            __break(1u);
          }
        }
        if (CFEqual(a2, *v14))
        {
          v16 = *(CFTypeRef *)(v11 + 8);
          if (v16)
            v16 = CFRetain(v16);
          v10 = 0;
          *a4 = v16;
        }
        else
        {
          v10 = 4294954512;
        }
        goto LABEL_21;
      }
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
LABEL_20:
        v10 = 4294951306;
LABEL_21:
        os_unfair_lock_unlock((os_unfair_lock_t)v11);
        return v10;
      }
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "STS_N_CopyProperty";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 307;
      v18 = v13;
    }
    else
    {
      v17 = STS_N_Log();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        goto LABEL_20;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "STS_N_CopyProperty";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 306;
      v18 = v17;
    }
    _os_log_error_impl(&dword_2290E3000, v18, OS_LOG_TYPE_ERROR, "%s:%d error", buf, 0x12u);
    goto LABEL_20;
  }
  v9 = (const void *)getkFigSTSFlavor_N();
  v10 = 0;
  *a4 = CFRetain(v9);
  return v10;
}

void sub_2290EE898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  os_unfair_lock_s *v3;
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  os_unfair_lock_unlock(v3);
  _Unwind_Resume(a1);
}

uint64_t softLink_FigBaseObjectStandardNotificationBarrier(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;
  void *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = getFigBaseObjectStandardNotificationBarrierSymbolLoc(void)::ptr;
  v9 = getFigBaseObjectStandardNotificationBarrierSymbolLoc(void)::ptr;
  if (!getFigBaseObjectStandardNotificationBarrierSymbolLoc(void)::ptr)
  {
    v3 = CoreMediaLibrary();
    v2 = dlsym(v3, "FigBaseObjectStandardNotificationBarrier");
    v7[3] = (uint64_t)v2;
    getFigBaseObjectStandardNotificationBarrierSymbolLoc(void)::ptr = v2;
  }
  _Block_object_dispose(&v6, 8);
  if (v2)
    return ((uint64_t (*)(uint64_t))v2)(a1);
  v5 = (void *)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  result = objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "OSStatus softLink_FigBaseObjectStandardNotificationBarrier(CMBaseObjectRef)"), CFSTR("STS_N.mm"), 30, CFSTR("%s"), dlerror());
  __break(1u);
  return result;
}

void sub_2290EE9BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

OSStatus AudioUnitSetParameter(AudioUnit inUnit, AudioUnitParameterID inID, AudioUnitScope inScope, AudioUnitElement inElement, AudioUnitParameterValue inValue, UInt32 inBufferOffsetInFrames)
{
  return MEMORY[0x24BDB6A48](inUnit, *(_QWORD *)&inID, *(_QWORD *)&inScope, *(_QWORD *)&inElement, *(_QWORD *)&inBufferOffsetInFrames, inValue);
}

OSStatus AudioUnitSetProperty(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitScope inScope, AudioUnitElement inElement, const void *inData, UInt32 inDataSize)
{
  return MEMORY[0x24BDB6A50](inUnit, *(_QWORD *)&inID, *(_QWORD *)&inScope, *(_QWORD *)&inElement, inData, *(_QWORD *)&inDataSize);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x24BDBBCE8](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x24BDBBE48](theDict, key);
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

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEE8](cf);
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

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x24BDBC4C0](theString, formatOptions, format);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
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

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t caulk::mach::semaphore::semaphore(caulk::mach::semaphore *this)
{
  return MEMORY[0x24BEC6E90](this);
}

void caulk::mach::semaphore::~semaphore(caulk::mach::semaphore *this)
{
  MEMORY[0x24BEC6E98](this);
}

uint64_t caulk::thread::attributes::apply_to_this_thread(caulk::thread::attributes *this)
{
  return MEMORY[0x24BEC6EC0](this);
}

uint64_t caulk::thread::start(caulk::thread *this, caulk::thread::attributes *a2, void *(*a3)(void *), void *a4)
{
  return MEMORY[0x24BEC6ED0](this, a2, a3, a4);
}

void caulk::thread::~thread(caulk::thread *this)
{
  MEMORY[0x24BEC6ED8](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
  MEMORY[0x24BEDABC0](a1, a2, a3);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x24BEDB188](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24F1D00C0(__p);
}

uint64_t operator delete()
{
  return off_24F1D00C8();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24F1D00D0(__sz);
}

uint64_t operator new()
{
  return off_24F1D00D8();
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

uint64_t _os_assert_log()
{
  return MEMORY[0x24BDACB40]();
}

uint64_t _os_crash()
{
  return MEMORY[0x24BDACB50]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

float asinf(float a1)
{
  float result;

  MEMORY[0x24BDAD190](a1);
  return result;
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAD228](a1, a2);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDAEFA8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFF0](a1, a2);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

kern_return_t semaphore_wait(semaphore_t semaphore)
{
  return MEMORY[0x24BDAFCD8](*(_QWORD *)&semaphore);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0030](__str, __endptr, *(_QWORD *)&__base);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

uint64_t xpc_mach_send_create()
{
  return MEMORY[0x24BDB0A98]();
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

xpc_object_t xpc_shmem_create(void *region, size_t length)
{
  return (xpc_object_t)MEMORY[0x24BDB0B60](region, length);
}

