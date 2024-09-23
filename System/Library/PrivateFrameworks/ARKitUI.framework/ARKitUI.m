BOOL isSessionLoadingMap(void *a1)
{
  id v1;
  void *v2;
  char isKindOfClass;
  void *v4;
  char v5;
  char v6;
  void *v7;
  _BOOL8 v8;

  v1 = a1;
  objc_msgSend(v1, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v1, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    v5 = objc_opt_isKindOfClass();

    objc_msgSend(v1, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v5 & 1) == 0)
    {
      objc_opt_class();
      v6 = objc_opt_isKindOfClass();

      if ((v6 & 1) == 0)
      {
        v8 = 0;
        goto LABEL_6;
      }
      objc_msgSend(v1, "configuration");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_msgSend(v4, "initialWorldMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;

LABEL_6:
  return v8;
}

uint64_t isSessionValidForCoaching(uint64_t result)
{
  if (result)
    return objc_msgSend(MEMORY[0x1E0CF20D0], "isSupported");
  return result;
}

uint64_t validateCoachingGoalForSession(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  char v8;
  char v9;
  int v10;
  void *v11;
  int v12;
  unint64_t v13;
  NSObject *v14;
  const char *v15;
  uint8_t *v16;
  void *v17;
  char v18;
  int v19;
  __int16 v21;
  uint8_t buf[2];
  __int16 v23;

  v3 = a2;
  if (!v3 || !objc_msgSend(MEMORY[0x1E0CF20D0], "isSupported"))
    goto LABEL_34;
  objc_msgSend(v3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1 == 4)
  {
    if (objc_msgSend(v4, "isKindOfConfiguration:", objc_opt_class()))
    {

LABEL_18:
      a1 = 4;
      goto LABEL_34;
    }
    objc_msgSend(v3, "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
      goto LABEL_18;
LABEL_33:
    a1 = 0;
    goto LABEL_34;
  }
  v5 = objc_msgSend(v4, "isKindOfConfiguration:", objc_opt_class());

  objc_msgSend(v3, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 & 1) != 0)
    goto LABEL_12;
  v7 = objc_msgSend(v6, "isKindOfConfiguration:", objc_opt_class());

  objc_msgSend(v3, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 & 1) != 0)
    goto LABEL_12;
  v8 = objc_msgSend(v6, "isKindOfConfiguration:", objc_opt_class());

  objc_msgSend(v3, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v8 & 1) != 0)
    goto LABEL_12;
  v9 = objc_msgSend(v6, "isKindOfConfiguration:", objc_opt_class());

  objc_msgSend(v3, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v9 & 1) != 0)
    goto LABEL_12;
  v10 = objc_msgSend(v6, "isKindOfConfiguration:", objc_opt_class());

  if (v10)
  {
    objc_msgSend(v3, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
    objc_msgSend(v6, "getAsKindOfConfiguration:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "planeDetection") & 1;
    v13 = ((unint64_t)objc_msgSend(v11, "planeDetection") >> 1) & 1;

    goto LABEL_13;
  }
  LODWORD(v13) = 0;
  v12 = 0;
LABEL_13:
  if (a1 == 1 && (v12 & 1) == 0)
  {
    _ARLogCoaching();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 0;
      v15 = "Coaching requires a horizontal plane, but session does not support horizontal plane detection. Turning off h"
            "orizontal plane requirement for coaching.";
      v16 = (uint8_t *)&v23;
LABEL_31:
      _os_log_impl(&dword_1DCC73000, v14, OS_LOG_TYPE_DEFAULT, v15, v16, 2u);
      goto LABEL_32;
    }
    goto LABEL_32;
  }
  if (a1 == 2)
    v18 = v13;
  else
    v18 = 1;
  if ((v18 & 1) == 0)
  {
    _ARLogCoaching();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v15 = "Coaching requires a vertical plane, but session does not support vertical plane detection. Turning off verti"
            "cal plane requirement for coaching.";
      v16 = buf;
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  if (a1 == 3)
    v19 = v12;
  else
    v19 = 1;
  if (((v19 | v13) & 1) == 0)
  {
    _ARLogCoaching();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 0;
      v15 = "Coaching requires plane detection, but session does not support plane detection. Turning off plane requireme"
            "nt for coaching.";
      v16 = (uint8_t *)&v21;
      goto LABEL_31;
    }
LABEL_32:

    goto LABEL_33;
  }
LABEL_34:

  return a1;
}

id _ARLogCoaching()
{
  if (_ARLogCoaching_onceToken != -1)
    dispatch_once(&_ARLogCoaching_onceToken, &__block_literal_global);
  return (id)_ARLogCoaching_logObj;
}

void ARCoachingEnumeratePlaneAnchors(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, _QWORD);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v4[2](v4, v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

void sub_1DCC75AA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1DCC75E90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, uint64_t a19, void *a20,uint64_t a21)
{
  void *v21;
  void *v22;
  void *v23;

  if (__p)
    operator delete(__p);
  if (a20)
    operator delete(a20);

  _Unwind_Resume(a1);
}

void _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE7reserveEm(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  __int128 v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 4)
  {
    if (a2 >> 60)
      _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv3_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m(v3, a2);
    v7 = &v6[v5];
    v9 = &v6[16 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        v13 = *((_OWORD *)v10 - 1);
        v10 -= 16;
        *((_OWORD *)v12 - 1) = v13;
        v12 -= 16;
      }
      while (v10 != v11);
      v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

void _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE7reserveEm(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 3)
  {
    if (a2 >> 61)
      _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    v9 = &v6[8 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        v13 = *((_QWORD *)v10 - 1);
        v10 -= 8;
        *((_QWORD *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v10 != v11);
      v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

void ___ZL13_ARLogGeneralv_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ARKit", "General");
  v1 = (void *)_ARLogGeneral(void)::logObj;
  _ARLogGeneral(void)::logObj = (uint64_t)v0;

}

void _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1EA5860F8, MEMORY[0x1E0DE42D0]);
}

void sub_1DCC760D4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5020] + 16);
  return result;
}

void *_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv3_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(16 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E0DE4E98], MEMORY[0x1E0DE4390]);
}

void *_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

double ARFLDeceleratedRestPosition(double a1, double a2, double a3)
{
  return a2 / 1000.0 * a3 / (1.0 - a3) + a1;
}

double ARFLRubberbandValue(double a1, double a2, double a3, double a4)
{
  if (a3 == 0.0)
    return a2;
  if (a1 < a2)
    a3 = -a3;
  return a2 + (1.0 - 1.0 / (a4 * ((a1 - a2) / a3) + 1.0)) * a3;
}

double ARFLInverseRubberbandValue(double a1, double a2, double a3, double a4)
{
  if (a3 == 0.0)
    return a2;
  if (a1 < a2)
    a3 = -a3;
  return a2 + (-1.0 / ((a1 - a2) / a3 + -1.0) + -1.0) / a4 * a3;
}

id _ARLogCoaching_0()
{
  if (_ARLogCoaching_onceToken_0 != -1)
    dispatch_once(&_ARLogCoaching_onceToken_0, &__block_literal_global_3);
  return (id)_ARLogCoaching_logObj_0;
}

id _ARLogGeneral()
{
  if (_ARLogGeneral_onceToken != -1)
    dispatch_once(&_ARLogGeneral_onceToken, &__block_literal_global_144);
  return (id)_ARLogGeneral_logObj;
}

double simd_matrix4x4(float32x4_t a1)
{
  float v10;
  double v11;

  _S3 = a1.i32[1];
  _S5 = a1.i32[2];
  __asm { FMLS            S1, S5, V0.S[2] }
  _S7 = a1.i32[3];
  __asm { FMLA            S1, S7, V0.S[3] }
  v10 = vmlas_n_f32(vmuls_lane_f32(a1.f32[2], a1, 3), a1.f32[1], a1.f32[0]);
  LODWORD(v11) = _S1;
  *((float *)&v11 + 1) = v10 + v10;
  __asm
  {
    FMLA            S6, S3, V0.S[1]
    FMLA            S6, S7, V0.S[3]
    FMLS            S6, S0, V0.S[0]
    FMLA            S18, S5, V0.S[1]
    FMLA            S17, S0, V0.S[2]
    FMLA            S16, S5, V0.S[1]
    FMLA            S7, S5, V0.S[2]
    FMLS            S7, S0, V0.S[0]
    FMLS            S7, S3, V0.S[1]
  }
  return v11;
}

id _ARLogGeneral_0()
{
  if (_ARLogGeneral_onceToken_0 != -1)
    dispatch_once(&_ARLogGeneral_onceToken_0, &__block_literal_global_81);
  return (id)_ARLogGeneral_logObj_0;
}

double ARFLSpringConvertStiffnessDampingToDampingRatioResponse(double *a1, double *a2, double a3, double a4)
{
  double result;

  result = sqrt(a3);
  if (a1)
    *a1 = a4 / (result + result);
  if (a2)
  {
    result = 6.28318531 / result;
    *a2 = result;
  }
  return result;
}

double ARFLSpringConvertMassStiffnessDampingToDampingRatioResponse(double *a1, double *a2, double result, double a4, double a5)
{
  double v5;

  if (a1)
  {
    v5 = sqrt(result * a4);
    *a1 = a5 / (v5 + v5);
  }
  if (a2)
  {
    result = 6.28318531 / sqrt(a4 / result);
    *a2 = result;
  }
  return result;
}

double ARFLSpringConvertDampingRatioResponseToStiffnessDamping(double *a1, double *a2, double result, double a4)
{
  double v4;
  double v5;

  v4 = 6.28318531 / a4 * (6.28318531 / a4);
  if (a1)
    *a1 = v4;
  if (a2)
  {
    v5 = sqrt(v4);
    result = (v5 + v5) * result;
    *a2 = result;
  }
  return result;
}

double ARFLSpringConvertMassStiffnessDampingToStiffnessDamping(double *a1, double *a2, double result, double a4, double a5)
{
  double v5;
  double v6;
  double v7;
  double v8;

  v5 = sqrt(a4 / result);
  v6 = 6.28318531 / (6.28318531 / v5) * (6.28318531 / (6.28318531 / v5));
  if (a1)
    *a1 = v6;
  if (a2)
  {
    v7 = sqrt(result * a4);
    v8 = sqrt(v6);
    result = a5 / (v7 + v7) * (v8 + v8);
    *a2 = result;
  }
  return result;
}

id _ARLogGeneral_1()
{
  if (_ARLogGeneral_onceToken_1 != -1)
    dispatch_once(&_ARLogGeneral_onceToken_1, &__block_literal_global_5);
  return (id)_ARLogGeneral_logObj_1;
}

uint64_t operator==(uint64_t a1, uint64_t a2)
{
  uint32x4_t v2;
  uint32x4_t v3;
  uint32x2_t v5;

  v2 = (uint32x4_t)vceqq_f32(*(float32x4_t *)a1, *(float32x4_t *)a2);
  v2.i32[3] = v2.i32[2];
  if ((vminvq_u32(v2) & 0x80000000) == 0)
    return 0;
  v3 = (uint32x4_t)vceqq_f32(*(float32x4_t *)(a1 + 16), *(float32x4_t *)(a2 + 16));
  v3.i32[3] = v3.i32[2];
  if ((vminvq_u32(v3) & 0x80000000) == 0)
    return 0;
  v5 = (uint32x2_t)vceq_f32(*(float32x2_t *)(a1 + 32), *(float32x2_t *)(a2 + 32));
  return vpmin_u32(v5, v5).u32[0] >> 31;
}

void sub_1DCC7BAC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

id _ARLogGeneral(void)
{
  if (_ARLogGeneral(void)::onceToken != -1)
    dispatch_once(&_ARLogGeneral(void)::onceToken, &__block_literal_global_6);
  return (id)_ARLogGeneral(void)::logObj;
}

{
  if (_ARLogGeneral(void)::onceToken != -1)
    dispatch_once(&_ARLogGeneral(void)::onceToken, &__block_literal_global_7);
  return (id)_ARLogGeneral(void)::logObj;
}

void sub_1DCC7C2B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1DCC7C518(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DCC7C5F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void ___ZL13_ARLogGeneralv_block_invoke_0()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ARKit", "General");
  v1 = (void *)_ARLogGeneral(void)::logObj;
  _ARLogGeneral(void)::logObj = (uint64_t)v0;

}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(4 * a2);
}

float32x4_t *std::__hash_table<std::__hash_value_type<GTVertexData,unsigned int>,std::__unordered_map_hasher<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::hash<GTVertexData>,std::equal_to<GTVertexData>,true>,std::__unordered_map_equal<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::equal_to<GTVertexData>,std::hash<GTVertexData>,true>,std::allocator<std::__hash_value_type<GTVertexData,unsigned int>>>::find<GTVertexData>(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  int8x8_t v4;
  uint8x8_t v5;
  unint64_t v6;
  float32x4_t **v7;
  float32x4_t *result;
  unint64_t v9;
  uint32x4_t v10;
  uint32x4_t v11;
  uint32x2_t v12;

  v2 = 0;
  v3 = 0;
  do
  {
    v3 ^= (v3 << 8) ^ (v3 >> 8) ^ *(_QWORD *)(a2 + v2);
    v2 += 8;
  }
  while (v2 != 48);
  v4 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v4)
    return 0;
  v5 = (uint8x8_t)vcnt_s8(v4);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    v6 = v3;
    if (v3 >= *(_QWORD *)&v4)
      v6 = v3 % *(_QWORD *)&v4;
  }
  else
  {
    v6 = (*(_QWORD *)&v4 - 1) & v3;
  }
  v7 = *(float32x4_t ***)(*a1 + 8 * v6);
  if (!v7)
    return 0;
  for (result = *v7; result; result = (float32x4_t *)result->i64[0])
  {
    v9 = result->u64[1];
    if (v9 == v3)
    {
      v10 = (uint32x4_t)vceqq_f32(result[1], *(float32x4_t *)a2);
      v10.i32[3] = v10.i32[2];
      if ((vminvq_u32(v10) & 0x80000000) != 0)
      {
        v11 = (uint32x4_t)vceqq_f32(result[2], *(float32x4_t *)(a2 + 16));
        v11.i32[3] = v11.i32[2];
        if ((vminvq_u32(v11) & 0x80000000) != 0)
        {
          v12 = (uint32x2_t)vceq_f32(*(float32x2_t *)result[3].f32, *(float32x2_t *)(a2 + 32));
          if ((vpmin_u32(v12, v12).u32[0] & 0x80000000) != 0)
            return result;
        }
      }
    }
    else
    {
      if (v5.u32[0] > 1uLL)
      {
        if (v9 >= *(_QWORD *)&v4)
          v9 %= *(_QWORD *)&v4;
      }
      else
      {
        v9 &= *(_QWORD *)&v4 - 1;
      }
      if (v9 != v6)
        return 0;
    }
  }
  return result;
}

float32x4_t *std::__hash_table<std::__hash_value_type<GTVertexData,unsigned int>,std::__unordered_map_hasher<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::hash<GTVertexData>,std::equal_to<GTVertexData>,true>,std::__unordered_map_equal<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::equal_to<GTVertexData>,std::hash<GTVertexData>,true>,std::allocator<std::__hash_value_type<GTVertexData,unsigned int>>>::__emplace_unique_key_args<GTVertexData,std::pair<GTVertexData,unsigned int>>(uint64_t a1, uint64_t a2, float32x4_t *a3)
{
  unint64_t v3;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  void **v10;
  float32x4_t *v11;
  unint64_t v12;
  uint32x4_t v13;
  uint32x4_t v14;
  uint32x2_t v15;
  float32x4_t v16;
  float v17;
  float v18;
  _BOOL8 v19;
  unint64_t v20;
  unint64_t v21;
  size_t v22;
  uint64_t v23;
  float32x4_t **v24;
  unint64_t v25;

  v6 = 0;
  v7 = 0;
  do
  {
    v7 ^= (v7 << 8) ^ (v7 >> 8) ^ *(_QWORD *)(a2 + v6);
    v6 += 8;
  }
  while (v6 != 48);
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v3 = v7;
      if (v7 >= v8)
        v3 = v7 % v8;
    }
    else
    {
      v3 = (v8 - 1) & v7;
    }
    v10 = *(void ***)(*(_QWORD *)a1 + 8 * v3);
    if (v10)
    {
      v11 = (float32x4_t *)*v10;
      if (*v10)
      {
        do
        {
          v12 = v11->u64[1];
          if (v12 == v7)
          {
            v13 = (uint32x4_t)vceqq_f32(v11[1], *(float32x4_t *)a2);
            v13.i32[3] = v13.i32[2];
            if ((vminvq_u32(v13) & 0x80000000) != 0)
            {
              v14 = (uint32x4_t)vceqq_f32(v11[2], *(float32x4_t *)(a2 + 16));
              v14.i32[3] = v14.i32[2];
              if ((vminvq_u32(v14) & 0x80000000) != 0)
              {
                v15 = (uint32x2_t)vceq_f32(*(float32x2_t *)v11[3].f32, *(float32x2_t *)(a2 + 32));
                if ((vpmin_u32(v15, v15).u32[0] & 0x80000000) != 0)
                  return v11;
              }
            }
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8)
                v12 %= v8;
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v3)
              break;
          }
          v11 = (float32x4_t *)v11->i64[0];
        }
        while (v11);
      }
    }
  }
  v11 = (float32x4_t *)operator new(0x50uLL);
  v11->i64[0] = 0;
  v11->i64[1] = v7;
  v16 = a3[1];
  v11[1] = *a3;
  v11[2] = v16;
  v11[3] = a3[2];
  v11[4].i32[0] = a3[3].i32[0];
  v17 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v18 = *(float *)(a1 + 32);
  if (!v8 || (float)(v18 * (float)v8) < v17)
  {
    v19 = 1;
    if (v8 >= 3)
      v19 = (v8 & (v8 - 1)) != 0;
    v20 = v19 | (2 * v8);
    v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21)
      v22 = v21;
    else
      v22 = v20;
    std::__hash_table<std::__hash_value_type<GTVertexData,unsigned int>,std::__unordered_map_hasher<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::hash<GTVertexData>,std::equal_to<GTVertexData>,true>,std::__unordered_map_equal<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::equal_to<GTVertexData>,std::hash<GTVertexData>,true>,std::allocator<std::__hash_value_type<GTVertexData,unsigned int>>>::__rehash<true>(a1, v22);
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8)
        v3 = v7 % v8;
      else
        v3 = v7;
    }
    else
    {
      v3 = (v8 - 1) & v7;
    }
  }
  v23 = *(_QWORD *)a1;
  v24 = *(float32x4_t ***)(*(_QWORD *)a1 + 8 * v3);
  if (v24)
  {
    v11->i64[0] = (uint64_t)*v24;
LABEL_42:
    *v24 = v11;
    goto LABEL_43;
  }
  v11->i64[0] = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v11;
  *(_QWORD *)(v23 + 8 * v3) = a1 + 16;
  if (v11->i64[0])
  {
    v25 = *(_QWORD *)(v11->i64[0] + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v25 >= v8)
        v25 %= v8;
    }
    else
    {
      v25 &= v8 - 1;
    }
    v24 = (float32x4_t **)(*(_QWORD *)a1 + 8 * v25);
    goto LABEL_42;
  }
LABEL_43:
  ++*(_QWORD *)(a1 + 24);
  return v11;
}

void sub_1DCC7CAA0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<GTVertexData,unsigned int>,std::__unordered_map_hasher<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::hash<GTVertexData>,std::equal_to<GTVertexData>,true>,std::__unordered_map_equal<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::equal_to<GTVertexData>,std::hash<GTVertexData>,true>,std::allocator<std::__hash_value_type<GTVertexData,unsigned int>>>::__rehash<true>(uint64_t a1, size_t __n)
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
      std::__hash_table<std::__hash_value_type<GTVertexData,unsigned int>,std::__unordered_map_hasher<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::hash<GTVertexData>,std::equal_to<GTVertexData>,true>,std::__unordered_map_equal<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::equal_to<GTVertexData>,std::hash<GTVertexData>,true>,std::allocator<std::__hash_value_type<GTVertexData,unsigned int>>>::__do_rehash<true>(a1, prime);
  }
}

void std::__hash_table<std::__hash_value_type<GTVertexData,unsigned int>,std::__unordered_map_hasher<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::hash<GTVertexData>,std::equal_to<GTVertexData>,true>,std::__unordered_map_equal<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::equal_to<GTVertexData>,std::hash<GTVertexData>,true>,std::allocator<std::__hash_value_type<GTVertexData,unsigned int>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
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
      std::__throw_bad_array_new_length[abi:ne180100]();
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<GTVertexData>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(48 * a2);
}

_QWORD *std::__hash_table<std::__hash_value_type<GTVertexData,unsigned int>,std::__unordered_map_hasher<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::hash<GTVertexData>,std::equal_to<GTVertexData>,true>,std::__unordered_map_equal<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::equal_to<GTVertexData>,std::hash<GTVertexData>,true>,std::allocator<std::__hash_value_type<GTVertexData,unsigned int>>>::clear(_QWORD *result)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t i;

  if (result[3])
  {
    v1 = result;
    result = (_QWORD *)result[2];
    if (result)
    {
      do
      {
        v2 = (_QWORD *)*result;
        operator delete(result);
        result = v2;
      }
      while (v2);
    }
    v1[2] = 0;
    v3 = v1[1];
    if (v3)
    {
      for (i = 0; i != v3; ++i)
        *(_QWORD *)(*v1 + 8 * i) = 0;
    }
    v1[3] = 0;
  }
  return result;
}

uint64_t std::__hash_table<std::__hash_value_type<GTVertexData,unsigned int>,std::__unordered_map_hasher<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::hash<GTVertexData>,std::equal_to<GTVertexData>,true>,std::__unordered_map_equal<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::equal_to<GTVertexData>,std::hash<GTVertexData>,true>,std::allocator<std::__hash_value_type<GTVertexData,unsigned int>>>::~__hash_table(uint64_t a1)
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

void sub_1DCC7CF44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1DCC7D580(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,void *a28,uint64_t a29,uint64_t a30,id a31)
{
  void *v31;
  void *v32;
  void *v33;
  id *v34;
  void *v35;

  objc_destroyWeak(v34);

  objc_destroyWeak(location);
  objc_destroyWeak(&a31);

  _Unwind_Resume(a1);
}

void sub_1DCC7D730(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1DCC7D798(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1DCC7D7F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1DCC7D8A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;

  a9.super_class = (Class)ARSCNCompositor;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_1DCC7D980(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1DCC7D9E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1DCC7DAB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1DCC7DCAC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1DCC7DEDC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1DCC7E160(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1DCC7E36C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1DCC7E47C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1DCC7E50C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DCC7E570(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZL13_ARLogGeneralv_block_invoke_1()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ARKit", "General");
  v1 = (void *)_ARLogGeneral(void)::logObj;
  _ARLogGeneral(void)::logObj = (uint64_t)v0;

}

const __CFString *ARCoachingDeviceGlyphName()
{
  int v0;
  int HasHomeButton;
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  const __CFString *v5;
  int HasIsland;
  _BOOL4 v7;
  uint8_t v9[16];
  uint8_t v10[16];
  uint8_t v11[16];
  uint8_t v12[16];
  uint8_t buf[16];

  v0 = ARDeviceIsiPad();
  HasHomeButton = ARDeviceHasHomeButton();
  v2 = HasHomeButton;
  if (v0)
  {
    _ARLogCoaching_1();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
    if (v2)
    {
      if (v4)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DCC73000, v3, OS_LOG_TYPE_INFO, "Loading glyph for iPad with home button", buf, 2u);
      }
      v5 = CFSTR("DeviceC");
    }
    else
    {
      if (v4)
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1DCC73000, v3, OS_LOG_TYPE_INFO, "Loading glyph for iPad without home button", v12, 2u);
      }
      v5 = CFSTR("DeviceD");
    }
  }
  else if (HasHomeButton)
  {
    _ARLogCoaching_1();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1DCC73000, v3, OS_LOG_TYPE_INFO, "Loading glyph for iPhone device with home button", v11, 2u);
    }
    v5 = CFSTR("DeviceA");
  }
  else
  {
    HasIsland = ARDeviceHasIsland();
    _ARLogCoaching_1();
    v3 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
    if (HasIsland)
    {
      if (v7)
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1DCC73000, v3, OS_LOG_TYPE_INFO, "Loading glyph for iPhone with island", v10, 2u);
      }
      v5 = CFSTR("DeviceE");
    }
    else
    {
      if (v7)
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1DCC73000, v3, OS_LOG_TYPE_INFO, "Loading glyph for iPhone device with notch", v9, 2u);
      }
      v5 = CFSTR("DeviceB");
    }
  }

  return v5;
}

id _ARLogCoaching_1()
{
  if (_ARLogCoaching_onceToken_1 != -1)
    dispatch_once(&_ARLogCoaching_onceToken_1, &__block_literal_global_8);
  return (id)_ARLogCoaching_logObj_1;
}

id ARCoachingLoadDeviceGlyph()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)MEMORY[0x1E0CEA638];
  ARCoachingDeviceGlyphName();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  ARKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:", v1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_1DCC7FF00(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DCC7FFA4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

double ARCoachingLayoutScalar()
{
  int v0;
  double result;

  v0 = ARDeviceIsiPad();
  result = 0.75;
  if (v0)
    return 1.0;
  return result;
}

double ARCoachingMinimumActivationDelay(uint64_t a1)
{
  double result;

  result = 1.5;
  if (a1 == 4)
    return 0.5;
  return result;
}

double ARCoachingAdditionalActivationDelay(uint64_t a1, char a2)
{
  double result;
  int v3;

  result = 0.0;
  if (a1 != 4 && (a2 & 1) == 0)
  {
    v3 = ARDeviceSupportsJasper();
    result = 0.0;
    if (v3)
      return 8.5;
  }
  return result;
}

id _ARLogCoaching_2()
{
  if (_ARLogCoaching_onceToken_2 != -1)
    dispatch_once(&_ARLogCoaching_onceToken_2, &__block_literal_global_356);
  return (id)_ARLogCoaching_logObj_2;
}

__CFString *getCoachingText(uint64_t a1)
{
  void *v1;
  __CFString *v2;
  void *v3;
  void *v4;
  const __CFString *v5;

  switch(a1)
  {
    case 1:
      if (getMoveCoachingText_onceToken != -1)
        dispatch_once(&getMoveCoachingText_onceToken, &__block_literal_global_369);
      v1 = (void *)getMoveCoachingText_moveCoachingText;
      goto LABEL_17;
    case 2:
      if (getContinueCoachingText_onceToken != -1)
        dispatch_once(&getContinueCoachingText_onceToken, &__block_literal_global_384);
      v1 = (void *)getContinueCoachingText_continueCoachingText;
      goto LABEL_17;
    case 3:
      ARKitCoreBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Return to the previous area to resume");
      goto LABEL_19;
    case 4:
      ARKitCoreBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Move slowly");
      goto LABEL_19;
    case 5:
      ARKitCoreBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = &stru_1EA587300;
      goto LABEL_19;
    case 6:
      ARKitCoreBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Scan buildings across the street");
      goto LABEL_19;
    case 7:
      ARKitCoreBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Keep scanning different buildings");
      goto LABEL_19;
    case 8:
      if (getGeoTrackingLookUpCoachingText_onceToken != -1)
        dispatch_once(&getGeoTrackingLookUpCoachingText_onceToken, &__block_literal_global_393);
      v1 = (void *)getGeoTrackingLookUpCoachingText_lookUpCoachingText;
LABEL_17:
      v2 = v1;
      break;
    case 9:
      ARKitCoreBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Slow down");
LABEL_19:
      objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1EA587300, CFSTR("Localizable_iOS"));
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v2 = &stru_1EA587300;
      break;
  }
  return v2;
}

void __getMoveCoachingText_block_invoke()
{
  void *v0;
  void *v1;
  const __CFString *v2;
  int v3;
  uint64_t v4;
  void *v5;
  id v6;

  ARDeviceClass();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("iPhone")))
  {
    ARKitCoreBundle();
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = v0;
    v2 = CFSTR("Move iPhone to start");
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("iPad")))
  {
    ARKitCoreBundle();
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = v0;
    v2 = CFSTR("Move iPad to start");
  }
  else
  {
    v3 = objc_msgSend(v6, "isEqualToString:", CFSTR("iPod"));
    ARKitCoreBundle();
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = v0;
    if (v3)
      v2 = CFSTR("Move iPod touch to start");
    else
      v2 = CFSTR("Move device to start");
  }
  objc_msgSend(v0, "localizedStringForKey:value:table:", v2, &stru_1EA587300, CFSTR("Localizable_iOS"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)getMoveCoachingText_moveCoachingText;
  getMoveCoachingText_moveCoachingText = v4;

}

void __getContinueCoachingText_block_invoke()
{
  void *v0;
  void *v1;
  const __CFString *v2;
  int v3;
  uint64_t v4;
  void *v5;
  id v6;

  ARDeviceClass();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("iPhone")))
  {
    ARKitCoreBundle();
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = v0;
    v2 = CFSTR("Continue to move iPhone");
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("iPad")))
  {
    ARKitCoreBundle();
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = v0;
    v2 = CFSTR("Continue to move iPad");
  }
  else
  {
    v3 = objc_msgSend(v6, "isEqualToString:", CFSTR("iPod"));
    ARKitCoreBundle();
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = v0;
    if (v3)
      v2 = CFSTR("Continue to move iPod touch");
    else
      v2 = CFSTR("Continue to move device");
  }
  objc_msgSend(v0, "localizedStringForKey:value:table:", v2, &stru_1EA587300, CFSTR("Localizable_iOS"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)getContinueCoachingText_continueCoachingText;
  getContinueCoachingText_continueCoachingText = v4;

}

void __getGeoTrackingLookUpCoachingText_block_invoke()
{
  void *v0;
  void *v1;
  const __CFString *v2;
  int v3;
  uint64_t v4;
  void *v5;
  id v6;

  ARDeviceClass();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("iPhone")))
  {
    ARKitCoreBundle();
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = v0;
    v2 = CFSTR("Raise iPhone toward buildings");
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("iPad")))
  {
    ARKitCoreBundle();
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = v0;
    v2 = CFSTR("Raise iPad toward buildings");
  }
  else
  {
    v3 = objc_msgSend(v6, "isEqualToString:", CFSTR("iPod"));
    ARKitCoreBundle();
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = v0;
    if (v3)
      v2 = CFSTR("Raise iPod touch toward buildings");
    else
      v2 = CFSTR("Raise device toward buildings");
  }
  objc_msgSend(v0, "localizedStringForKey:value:table:", v2, &stru_1EA587300, CFSTR("Localizable_iOS"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)getGeoTrackingLookUpCoachingText_lookUpCoachingText;
  getGeoTrackingLookUpCoachingText_lookUpCoachingText = v4;

}

uint64_t ARViewToCameraImageTransform@<X0>(uint64_t result@<X0>, int a2@<W1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>)
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v7 = a5 / a4;
  v8 = a4 / a5;
  if ((unint64_t)(result - 3) <= 1)
    v7 = v8;
  v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v10 = a6 / a7;
  if (v7 >= v10)
  {
    v13 = *MEMORY[0x1E0C9D538];
    v11 = 1.0;
    if (v7 <= v10)
    {
      v12 = 1.0;
    }
    else
    {
      v12 = v10 / v7;
      v9 = (1.0 - v12) * 0.5;
    }
  }
  else
  {
    v11 = v7 / v10;
    v12 = 1.0;
    v13 = (1.0 - v11) * 0.5;
  }
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)a3 = 0u;
  if (!a2)
  {
    if (result == 2)
    {
      v13 = v13 + v11;
      *(double *)(a3 + 8) = v12;
      *(double *)(a3 + 16) = -v11;
      goto LABEL_25;
    }
    if (result == 4)
    {
      v13 = v13 + v11;
      *(double *)a3 = -v11;
      v9 = v9 + v12;
      *(_QWORD *)(a3 + 8) = 0;
      *(_QWORD *)(a3 + 16) = 0;
      *(double *)(a3 + 24) = -v12;
      goto LABEL_25;
    }
    if (result != 3)
    {
      v9 = v9 + v12;
      *(double *)(a3 + 8) = -v12;
      goto LABEL_24;
    }
    *(double *)a3 = v11;
LABEL_19:
    *(_QWORD *)(a3 + 8) = 0;
    *(_QWORD *)(a3 + 16) = 0;
    *(double *)(a3 + 24) = v12;
    goto LABEL_25;
  }
  if (result == 2)
  {
    v13 = v13 + v11;
    v9 = v9 + v12;
    *(double *)(a3 + 8) = -v12;
    *(double *)(a3 + 16) = -v11;
    goto LABEL_25;
  }
  if (result == 4)
  {
    *(double *)a3 = -v11;
    v13 = v13 + v11;
    goto LABEL_19;
  }
  if (result != 3)
  {
    *(double *)(a3 + 8) = v12;
LABEL_24:
    *(double *)(a3 + 16) = v11;
    goto LABEL_25;
  }
  *(double *)a3 = v11;
  v9 = v9 + v12;
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  *(double *)(a3 + 24) = -v12;
LABEL_25:
  *(double *)(a3 + 32) = v13;
  *(double *)(a3 + 40) = v9;
  return result;
}

CGAffineTransform *ARCameraImageToViewTransform@<X0>(uint64_t a1@<X0>, int a2@<W1>, CGAffineTransform *a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>)
{
  CGAffineTransform v9;

  ARViewToCameraImageTransform(a1, a2, (uint64_t)&v9, a6, a7, a4, a5);
  return CGAffineTransformInvert(a3, &v9);
}

uint64_t ARCameraToDisplayRotation(unint64_t a1)
{
  if (a1 > 4)
    return 90;
  else
    return qword_1DCCA1048[a1];
}

const __CFString *NSStringFromUIInterfaceOrientation(unint64_t a1)
{
  if (a1 > 4)
    return &stru_1EA587300;
  else
    return off_1EA586AA0[a1];
}

id _ARLogGeneral_2()
{
  if (_ARLogGeneral_onceToken_3 != -1)
    dispatch_once(&_ARLogGeneral_onceToken_3, &__block_literal_global_408);
  return (id)_ARLogGeneral_logObj_3;
}

void sub_1DCC8934C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DCC894DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

double ARCoachingGlyphPerspectiveEye()
{
  return 0.0;
}

double ARCoachingGlyphPerspectiveCenter()
{
  return -0.0000305175781;
}

void sub_1DCC8F830(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DCC8F8B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1DCC8F93C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1DCC8F9B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1DCC8FA34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1DCC8FF0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DCC8FFEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DCC902C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1DCC90BD0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1DCC90F64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  void *v18;

  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void sub_1DCC91468(_Unwind_Exception *a1)
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

void sub_1DCC916A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_1DCC91998(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DCC91A7C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DCC91B38(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DCC91C10(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_1DCC91CE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{

  _Unwind_Resume(a1);
}

void sub_1DCC91D88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{

  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ARCoachingControlPoint>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(32 * a2);
}

void sub_1DCC91F34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DCC92204(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

char *std::vector<ARCoachingControlPoint>::insert(uint64_t a1, char *__src, char *a3)
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
  __int128 v13;
  char *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  __int128 v21;
  __int128 v22;
  char *v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  uint64_t v27;
  __int128 v28;
  void *__p;
  char *v31;
  char *v32;
  char *v33;
  uint64_t v34;

  v3 = a3;
  v4 = __src;
  v6 = *(char **)(a1 + 8);
  v8 = a1 + 16;
  v7 = *(_QWORD *)(a1 + 16);
  if ((unint64_t)v6 >= v7)
  {
    v14 = *(char **)a1;
    v15 = ((uint64_t)&v6[-*(_QWORD *)a1] >> 5) + 1;
    if (v15 >> 59)
      _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
    v16 = __src - v14;
    v17 = (__src - v14) >> 5;
    v18 = v7 - (_QWORD)v14;
    if (v18 >> 4 > v15)
      v15 = v18 >> 4;
    if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFE0)
      v19 = 0x7FFFFFFFFFFFFFFLL;
    else
      v19 = v15;
    v34 = a1 + 16;
    if (v19)
      v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ARCoachingControlPoint>>(a1 + 16, v19);
    else
      v20 = 0;
    v23 = &v20[32 * v17];
    __p = v20;
    v31 = v23;
    v32 = v23;
    v33 = &v20[32 * v19];
    if (v17 == v19)
    {
      if (v16 < 1)
      {
        if (v14 == v4)
          v25 = 1;
        else
          v25 = v16 >> 4;
        v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ARCoachingControlPoint>>(v8, v25);
        v23 = &v26[32 * (v25 >> 2)];
        __p = v26;
        v31 = v23;
        v33 = &v26[32 * v27];
        if (v20)
          operator delete(v20);
      }
      else
      {
        v24 = v17 + 2;
        if (v17 >= -1)
          v24 = v17 + 1;
        v23 -= 32 * (v24 >> 1);
        v31 = v23;
      }
    }
    v28 = *((_OWORD *)v3 + 1);
    *(_OWORD *)v23 = *(_OWORD *)v3;
    *((_OWORD *)v23 + 1) = v28;
    v32 = v23 + 32;
    v4 = (char *)std::vector<ARCoachingControlPoint>::__swap_out_circular_buffer((void **)a1, (uint64_t)&__p, v4);
    if (v32 != v31)
      v32 += (v31 - v32 + 31) & 0xFFFFFFFFFFFFFFE0;
    if (__p)
      operator delete(__p);
  }
  else if (__src == v6)
  {
    v22 = *((_OWORD *)a3 + 1);
    *(_OWORD *)__src = *(_OWORD *)a3;
    *((_OWORD *)__src + 1) = v22;
    *(_QWORD *)(a1 + 8) = __src + 32;
  }
  else
  {
    v9 = __src + 32;
    v10 = v6 - 32;
    v11 = *(_OWORD **)(a1 + 8);
    while (v10 < v6)
    {
      v12 = *(_OWORD *)v10;
      v13 = *((_OWORD *)v10 + 1);
      v10 += 32;
      *v11 = v12;
      v11[1] = v13;
      v11 += 2;
    }
    *(_QWORD *)(a1 + 8) = v11;
    if (v6 != v9)
      memmove(&v6[-32 * ((v6 - v9) >> 5)], __src, v6 - v9);
    if (v4 <= v3)
      v3 += 32 * (*(_QWORD *)(a1 + 8) > (unint64_t)v3);
    v21 = *((_OWORD *)v3 + 1);
    *(_OWORD *)v4 = *(_OWORD *)v3;
    *((_OWORD *)v4 + 1) = v21;
  }
  return v4;
}

void sub_1DCC92618(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

char *std::vector<unsigned short>::insert(uint64_t a1, char *__src, char *a3)
{
  char *v3;
  char *v4;
  char *v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  _WORD *v11;
  __int16 v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  uint64_t v26;
  void *__p;
  char *v29;
  char *v30;
  char *v31;
  uint64_t v32;

  v3 = a3;
  v4 = __src;
  v6 = *(char **)(a1 + 8);
  v8 = a1 + 16;
  v7 = *(_QWORD *)(a1 + 16);
  if ((unint64_t)v6 >= v7)
  {
    v13 = *(char **)a1;
    v14 = (uint64_t)&v6[-*(_QWORD *)a1];
    if (v14 <= -3)
      _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
    v15 = __src - v13;
    v16 = (__src - v13) >> 1;
    v17 = v14 >> 1;
    v18 = v7 - (_QWORD)v13;
    if (v18 <= v17 + 1)
      v19 = v17 + 1;
    else
      v19 = v18;
    if (v18 >= 0x7FFFFFFFFFFFFFFELL)
      v20 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v20 = v19;
    v32 = a1 + 16;
    if (v20)
      v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(a1 + 16, v20);
    else
      v21 = 0;
    v22 = &v21[2 * v16];
    __p = v21;
    v29 = v22;
    v30 = v22;
    v31 = &v21[2 * v20];
    if (v16 == v20)
    {
      if (v15 < 1)
      {
        if (v13 == v4)
          v24 = 1;
        else
          v24 = v4 - v13;
        v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(v8, v24);
        v22 = &v25[2 * (v24 >> 2)];
        __p = v25;
        v29 = v22;
        v31 = &v25[2 * v26];
        if (v21)
          operator delete(v21);
      }
      else
      {
        v23 = v16 + 2;
        if (v16 >= -1)
          v23 = v16 + 1;
        v22 -= v23 & 0xFFFFFFFFFFFFFFFELL;
        v29 = v22;
      }
    }
    *(_WORD *)v22 = *(_WORD *)v3;
    v30 = v22 + 2;
    v4 = std::vector<unsigned short>::__swap_out_circular_buffer((void **)a1, (uint64_t)&__p, v4);
    if (v30 != v29)
      v30 += (v29 - v30 + 1) & 0xFFFFFFFFFFFFFFFELL;
    if (__p)
      operator delete(__p);
  }
  else if (__src == v6)
  {
    *(_WORD *)__src = *(_WORD *)a3;
    *(_QWORD *)(a1 + 8) = __src + 2;
  }
  else
  {
    v9 = __src + 2;
    v10 = v6 - 2;
    v11 = *(_WORD **)(a1 + 8);
    while (v10 < v6)
    {
      v12 = *(_WORD *)v10;
      v10 += 2;
      *v11++ = v12;
    }
    *(_QWORD *)(a1 + 8) = v11;
    if (v6 != v9)
      memmove(&v6[-2 * ((v6 - v9) >> 1)], __src, v6 - v9);
    if (v4 <= v3)
      v3 += 2 * (*(_QWORD *)(a1 + 8) > (unint64_t)v3);
    *(_WORD *)v4 = *(_WORD *)v3;
  }
  return v4;
}

void sub_1DCC92850(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

char *std::vector<ARCoachingPatchData>::insert(uint64_t a1, char *__src, char *a3)
{
  char *v3;
  char *v4;
  char *v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  _QWORD *v11;
  uint64_t v12;
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
    v14 = ((uint64_t)&v6[-*(_QWORD *)a1] >> 3) + 1;
    if (v14 >> 61)
      _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
    v15 = __src - v13;
    v16 = (__src - v13) >> 3;
    v17 = v7 - (_QWORD)v13;
    if (v17 >> 2 > v14)
      v14 = v17 >> 2;
    if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8)
      v18 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v18 = v14;
    v30 = a1 + 16;
    if (v18)
      v19 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m(a1 + 16, v18);
    else
      v19 = 0;
    v20 = &v19[8 * v16];
    __p = v19;
    v27 = v20;
    v28 = v20;
    v29 = &v19[8 * v18];
    if (v16 == v18)
    {
      if (v15 < 1)
      {
        if (v13 == v4)
          v22 = 1;
        else
          v22 = v15 >> 2;
        v23 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m(v8, v22);
        v20 = &v23[8 * (v22 >> 2)];
        __p = v23;
        v27 = v20;
        v29 = &v23[8 * v24];
        if (v19)
          operator delete(v19);
      }
      else
      {
        v21 = v16 + 2;
        if (v16 >= -1)
          v21 = v16 + 1;
        v20 -= 8 * (v21 >> 1);
        v27 = v20;
      }
    }
    *(_QWORD *)v20 = *(_QWORD *)v3;
    v28 = v20 + 8;
    v4 = std::vector<ARCoachingPatchData>::__swap_out_circular_buffer((void **)a1, (uint64_t)&__p, v4);
    if (v28 != v27)
      v28 += (v27 - v28 + 7) & 0xFFFFFFFFFFFFFFF8;
    if (__p)
      operator delete(__p);
  }
  else if (__src == v6)
  {
    *(_QWORD *)__src = *(_QWORD *)a3;
    *(_QWORD *)(a1 + 8) = __src + 8;
  }
  else
  {
    v9 = __src + 8;
    v10 = v6 - 8;
    v11 = *(_QWORD **)(a1 + 8);
    while (v10 < v6)
    {
      v12 = *(_QWORD *)v10;
      v10 += 8;
      *v11++ = v12;
    }
    *(_QWORD *)(a1 + 8) = v11;
    if (v6 != v9)
      memmove(&v6[-8 * ((v6 - v9) >> 3)], __src, v6 - v9);
    if (v4 <= v3)
      v3 += 8 * (*(_QWORD *)(a1 + 8) > (unint64_t)v3);
    *(_QWORD *)v4 = *(_QWORD *)v3;
  }
  return v4;
}

void sub_1DCC92A90(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_1DCC94890(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1DCC94F48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

char *std::vector<ARCoachingControlPoint>::__assign_with_size[abi:ne180100]<ARCoachingControlPoint*,ARCoachingControlPoint*>(char *result, char *__src, uint64_t a3, unint64_t a4)
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
  if (a4 > (v8 - *(_QWORD *)result) >> 5)
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
    if (a4 >> 59)
      _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
    v10 = v8 >> 4;
    if (v8 >> 4 <= a4)
      v10 = a4;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFE0)
      v11 = 0x7FFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = std::vector<ARCoachingControlPoint>::__vallocate[abi:ne180100](v7, v11);
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
  v15 = (v14 - v9) >> 5;
  if (v15 >= a4)
    goto LABEL_16;
  v16 = &__src[32 * v15];
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

char *std::vector<ARCoachingControlPoint>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 59)
    _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ARCoachingControlPoint>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[32 * v4];
  return result;
}

void *std::vector<ARCoachingControlPoint>::__swap_out_circular_buffer(void **a1, uint64_t a2, char *__src)
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
      v10 = *((_OWORD *)v8 - 1);
      v7 = (void *)(v9 - 32);
      *(_OWORD *)(v9 - 32) = *((_OWORD *)v8 - 2);
      *(_OWORD *)(v9 - 16) = v10;
      v8 -= 32;
      v9 -= 32;
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

char *std::vector<unsigned short>::__swap_out_circular_buffer(void **a1, uint64_t a2, char *__src)
{
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  __int16 v9;
  _BYTE *v10;
  uint64_t v11;
  int64_t v12;
  char *v13;
  void *v14;
  void *v15;

  v5 = *(char **)(a2 + 8);
  v6 = (char *)*a1;
  v7 = v5;
  if (*a1 != __src)
  {
    v8 = __src;
    v7 = *(char **)(a2 + 8);
    do
    {
      v9 = *((_WORD *)v8 - 1);
      v8 -= 2;
      *((_WORD *)v7 - 1) = v9;
      v7 -= 2;
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
    v7 = *(char **)(a2 + 8);
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(2 * a2);
}

char *std::vector<ARCoachingPatchData>::__swap_out_circular_buffer(void **a1, uint64_t a2, char *__src)
{
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  int64_t v12;
  char *v13;
  void *v14;
  void *v15;

  v5 = *(char **)(a2 + 8);
  v6 = (char *)*a1;
  v7 = v5;
  if (*a1 != __src)
  {
    v8 = __src;
    v7 = *(char **)(a2 + 8);
    do
    {
      v9 = *((_QWORD *)v8 - 1);
      v8 -= 8;
      *((_QWORD *)v7 - 1) = v9;
      v7 -= 8;
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
    v7 = *(char **)(a2 + 8);
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

double ARFLCompoundSpringMake@<D0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D3>, double a5@<D4>)
{
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  double result;
  __int128 v18;
  double v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  double v25;
  double v26;
  double v27;
  double v28;

  v27 = a5;
  v28 = a4;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_OWORD *)(a1 + 320) = 0u;
  *(_QWORD *)(a1 + 336) = 0;
  *(_OWORD *)(a1 + 16) = 0u;
  v9 = a1 + 16;
  *(double *)a1 = a2;
  *(double *)(a1 + 8) = a3;
  *(_BYTE *)(a1 + 336) = 1;
  v26 = 0.0;
  v25 = 0.0;
  ARFLSpringConvertDampingRatioResponseToStiffnessDamping(&v26, &v25, 1.0, 0.5);
  ARFLSimpleSpringMake(v9, a4, 0.0, a4, v26, v25);
  ARFLSimpleSpringMake((uint64_t)&v21, a5, 0.0, a5, v26, v25);
  v10 = v22;
  *(_OWORD *)(a1 + 80) = v21;
  *(_OWORD *)(a1 + 96) = v10;
  v11 = v24;
  *(_OWORD *)(a1 + 112) = v23;
  *(_OWORD *)(a1 + 128) = v11;
  v19 = 0.0;
  v20 = 0.0;
  ARFLSpringConvertStiffnessDampingToDampingRatioResponse(&v20, &v19, a4, a5);
  ARFLSimpleSpringMake((uint64_t)&v21, v20, 0.0, v20, v26, v25);
  v12 = v22;
  *(_OWORD *)(a1 + 144) = v21;
  *(_OWORD *)(a1 + 160) = v12;
  v13 = v24;
  *(_OWORD *)(a1 + 176) = v23;
  *(_OWORD *)(a1 + 192) = v13;
  ARFLSimpleSpringMake((uint64_t)&v21, v19, 0.0, v19, v26, v25);
  v14 = v22;
  *(_OWORD *)(a1 + 208) = v21;
  *(_OWORD *)(a1 + 224) = v14;
  v15 = v24;
  *(_OWORD *)(a1 + 240) = v23;
  *(_OWORD *)(a1 + 256) = v15;
  ARFLSpringConvertDampingRatioResponseToStiffnessDamping(&v28, &v27, v20, v19);
  ARFLSimpleSpringMake((uint64_t)&v21, a2, 0.0, a2, v26, v25);
  v16 = v22;
  *(_OWORD *)(a1 + 272) = v21;
  *(_OWORD *)(a1 + 288) = v16;
  result = *(double *)&v23;
  v18 = v24;
  *(_OWORD *)(a1 + 304) = v23;
  *(_OWORD *)(a1 + 320) = v18;
  return result;
}

void ARFLCompoundSpringMakeWithDampingRatioResponse(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D3>, double a5@<D4>)
{
  double v8;
  double v9;

  v8 = 0.0;
  v9 = 0.0;
  ARFLSpringConvertDampingRatioResponseToStiffnessDamping(&v9, &v8, a4, a5);
  ARFLCompoundSpringMake(a1, a2, a3, v9, v8);
}

uint64_t ARFLCompoundSpringSetAnchorImmediately(uint64_t result, double a2)
{
  *(double *)(result + 312) = a2;
  *(double *)(result + 272) = a2;
  *(_QWORD *)(result + 280) = 0;
  return result;
}

void ARFLCompoundSpringSetAnchorWithResponse(uint64_t a1, double a2, double a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a3 == 0.0)
  {
    *(double *)(a1 + 272) = a3;
    *(_QWORD *)(a1 + 280) = 0;
  }
  else
  {
    v6 = 0;
    v7 = 0;
    ARFLSpringConvertDampingRatioResponseToStiffnessDamping((double *)&v7, (double *)&v6, 1.0, a3);
    v5 = v6;
    *(_QWORD *)(a1 + 296) = v7;
    *(_QWORD *)(a1 + 304) = v5;
    a3 = a2;
  }
  *(double *)(a1 + 312) = a3;
}

void ARFLCompoundSpringSetAnchorWithIntermediatePositionAndResponse(uint64_t a1, double a2, double a3, double a4)
{
  if (a4 == 0.0)
  {
    *(double *)(a1 + 312) = a2;
  }
  else
  {
    ARFLCompoundSpringSetAnchorWithResponse(a1, a2, a4);
    a2 = a3;
  }
  *(double *)(a1 + 272) = a2;
  *(_QWORD *)(a1 + 280) = 0;
}

uint64_t ARFLCompoundSpringSetStiffnessImmediately(uint64_t result, double a2)
{
  *(double *)(result + 56) = a2;
  *(double *)(result + 16) = a2;
  *(_QWORD *)(result + 24) = 0;
  return result;
}

void ARFLCompoundSpringSetStiffnessWithResponse(uint64_t a1, double a2, double a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a3 == 0.0)
  {
    *(double *)(a1 + 16) = a2;
    *(_QWORD *)(a1 + 24) = 0;
  }
  else
  {
    v6 = 0;
    v7 = 0;
    ARFLSpringConvertDampingRatioResponseToStiffnessDamping((double *)&v7, (double *)&v6, 1.0, a3);
    v5 = v6;
    *(_QWORD *)(a1 + 40) = v7;
    *(_QWORD *)(a1 + 48) = v5;
  }
  *(double *)(a1 + 56) = a2;
}

uint64_t ARFLCompoundSpringSetDampingImmediately(uint64_t result, double a2)
{
  *(double *)(result + 120) = a2;
  *(double *)(result + 80) = a2;
  *(_QWORD *)(result + 88) = 0;
  return result;
}

void ARFLCompoundSpringSetDampingWithResponse(uint64_t a1, double a2, double a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a3 == 0.0)
  {
    *(double *)(a1 + 80) = a2;
    *(_QWORD *)(a1 + 88) = 0;
  }
  else
  {
    v6 = 0;
    v7 = 0;
    ARFLSpringConvertDampingRatioResponseToStiffnessDamping((double *)&v7, (double *)&v6, 1.0, a3);
    v5 = v6;
    *(_QWORD *)(a1 + 104) = v7;
    *(_QWORD *)(a1 + 112) = v5;
  }
  *(double *)(a1 + 120) = a2;
}

uint64_t ARFLCompoundSpringSetDampingRatioImmediately(uint64_t result, double a2)
{
  *(double *)(result + 184) = a2;
  *(double *)(result + 144) = a2;
  *(_QWORD *)(result + 152) = 0;
  return result;
}

void ARFLCompoundSpringSetDampingRatioSmoothly(uint64_t a1, double a2, double a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a3 == 0.0)
  {
    *(double *)(a1 + 144) = a2;
    *(_QWORD *)(a1 + 152) = 0;
  }
  else
  {
    v6 = 0;
    v7 = 0;
    ARFLSpringConvertDampingRatioResponseToStiffnessDamping((double *)&v7, (double *)&v6, 1.0, a3);
    v5 = v6;
    *(_QWORD *)(a1 + 168) = v7;
    *(_QWORD *)(a1 + 176) = v5;
  }
  *(double *)(a1 + 184) = a2;
}

uint64_t ARFLCompoundSpringSetResponseImmediately(uint64_t result, double a2)
{
  *(double *)(result + 248) = a2;
  *(double *)(result + 208) = a2;
  *(_QWORD *)(result + 216) = 0;
  return result;
}

void ARFLCompoundSpringSetResponseSmoothly(uint64_t a1, double a2, double a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a3 == 0.0)
  {
    *(double *)(a1 + 208) = a2;
    *(_QWORD *)(a1 + 216) = 0;
  }
  else
  {
    v6 = 0;
    v7 = 0;
    ARFLSpringConvertDampingRatioResponseToStiffnessDamping((double *)&v7, (double *)&v6, 1.0, a3);
    v5 = v6;
    *(_QWORD *)(a1 + 232) = v7;
    *(_QWORD *)(a1 + 240) = v5;
  }
  *(double *)(a1 + 248) = a2;
}

double ARFLCompoundSpringStep@<D0>(void *__src@<X0>, _OWORD *a2@<X8>, double a3@<D0>)
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  double result;
  _OWORD v22[4];
  _OWORD __dst[22];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;

  memcpy(a2, __src, 0x158uLL);
  if (*((_BYTE *)a2 + 336))
  {
    v5 = a2[10];
    __dst[0] = a2[9];
    __dst[1] = v5;
    v6 = a2[12];
    __dst[2] = a2[11];
    __dst[3] = v6;
    ARFLSimpleSpringStep((uint64_t)__dst, (uint64_t)(a2 + 9), a3);
    v7 = a2[14];
    v24 = a2[13];
    v25 = v7;
    v8 = a2[16];
    v26 = a2[15];
    v27 = v8;
    ARFLSimpleSpringStep((uint64_t)&v24, (uint64_t)__dst, a3);
    v9 = __dst[1];
    a2[13] = __dst[0];
    a2[14] = v9;
    v10 = __dst[3];
    a2[15] = __dst[2];
    a2[16] = v10;
  }
  else
  {
    v11 = a2[2];
    __dst[0] = a2[1];
    __dst[1] = v11;
    v12 = a2[4];
    __dst[2] = a2[3];
    __dst[3] = v12;
    ARFLSimpleSpringStep((uint64_t)__dst, (uint64_t)(a2 + 1), a3);
    v13 = a2[6];
    v24 = a2[5];
    v25 = v13;
    v14 = a2[8];
    v26 = a2[7];
    v27 = v14;
    ARFLSimpleSpringStep((uint64_t)&v24, (uint64_t)__dst, a3);
    v15 = __dst[1];
    a2[5] = __dst[0];
    a2[6] = v15;
    v16 = __dst[3];
    a2[7] = __dst[2];
    a2[8] = v16;
  }
  v17 = a2[18];
  v24 = a2[17];
  v25 = v17;
  v18 = a2[20];
  v26 = a2[19];
  v27 = v18;
  ARFLSimpleSpringStep((uint64_t)&v24, (uint64_t)__dst, a3);
  v19 = __dst[1];
  a2[17] = __dst[0];
  a2[18] = v19;
  v20 = __dst[3];
  a2[19] = __dst[2];
  a2[20] = v20;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  memcpy(__dst, a2, 0x158uLL);
  _ARFLSimpleSpringFromCompoundSpring((uint64_t)__dst, (uint64_t)&v24);
  v22[0] = v24;
  v22[1] = v25;
  v22[2] = v26;
  v22[3] = v27;
  ARFLSimpleSpringStep((uint64_t)v22, (uint64_t)__dst, a3);
  result = *(double *)__dst;
  *a2 = __dst[0];
  return result;
}

void _ARFLSimpleSpringFromCompoundSpring(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double v2;
  double v3;
  double v4;

  v2 = *(double *)a1;
  v3 = *(double *)(a1 + 8);
  v4 = *(double *)(a1 + 272);
  if (*(_BYTE *)(a1 + 336))
    ARFLSimpleSpringMakeWithDampingRatioResponse(a2, v2, v3, v4, *(double *)(a1 + 144), *(double *)(a1 + 208));
  else
    ARFLSimpleSpringMake(a2, v2, v3, v4, *(double *)(a1 + 16), *(double *)(a1 + 80));
}

BOOL ARFLCompoundSpringIsStable(void *__src)
{
  _BOOL8 result;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _OWORD v15[22];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  memcpy(v15, __src, 0x158uLL);
  _ARFLSimpleSpringFromCompoundSpring((uint64_t)v15, (uint64_t)&v16);
  if (*((_BYTE *)__src + 336))
  {
    v15[0] = v16;
    v15[1] = v17;
    v15[2] = v18;
    v15[3] = v19;
    result = ARFLSimpleSpringIsStable((double *)v15);
    if ((_DWORD)result)
    {
      v3 = *((_OWORD *)__src + 18);
      v15[0] = *((_OWORD *)__src + 17);
      v15[1] = v3;
      v4 = *((_OWORD *)__src + 20);
      v15[2] = *((_OWORD *)__src + 19);
      v15[3] = v4;
      result = ARFLSimpleSpringIsStable((double *)v15);
      if ((_DWORD)result)
      {
        v5 = *((_OWORD *)__src + 10);
        v15[0] = *((_OWORD *)__src + 9);
        v15[1] = v5;
        v6 = *((_OWORD *)__src + 12);
        v15[2] = *((_OWORD *)__src + 11);
        v15[3] = v6;
        result = ARFLSimpleSpringIsStable((double *)v15);
        if ((_DWORD)result)
        {
          v7 = *((_OWORD *)__src + 14);
          v15[0] = *((_OWORD *)__src + 13);
          v15[1] = v7;
          v8 = *((_OWORD *)__src + 15);
          v9 = *((_OWORD *)__src + 16);
LABEL_10:
          v15[2] = v8;
          v15[3] = v9;
          return ARFLSimpleSpringIsStable((double *)v15);
        }
      }
    }
  }
  else
  {
    v15[0] = v16;
    v15[1] = v17;
    v15[2] = v18;
    v15[3] = v19;
    result = ARFLSimpleSpringIsStable((double *)v15);
    if ((_DWORD)result)
    {
      v10 = *((_OWORD *)__src + 18);
      v15[0] = *((_OWORD *)__src + 17);
      v15[1] = v10;
      v11 = *((_OWORD *)__src + 20);
      v15[2] = *((_OWORD *)__src + 19);
      v15[3] = v11;
      result = ARFLSimpleSpringIsStable((double *)v15);
      if ((_DWORD)result)
      {
        v12 = *((_OWORD *)__src + 2);
        v15[0] = *((_OWORD *)__src + 1);
        v15[1] = v12;
        v13 = *((_OWORD *)__src + 4);
        v15[2] = *((_OWORD *)__src + 3);
        v15[3] = v13;
        result = ARFLSimpleSpringIsStable((double *)v15);
        if ((_DWORD)result)
        {
          v14 = *((_OWORD *)__src + 6);
          v15[0] = *((_OWORD *)__src + 5);
          v15[1] = v14;
          v8 = *((_OWORD *)__src + 7);
          v9 = *((_OWORD *)__src + 8);
          goto LABEL_10;
        }
      }
    }
  }
  return result;
}

id _ARLogCoaching_3()
{
  if (_ARLogCoaching_onceToken_3 != -1)
    dispatch_once(&_ARLogCoaching_onceToken_3, &__block_literal_global_12);
  return (id)_ARLogCoaching_logObj_3;
}

float ARCoachingDotsRenderParamsLerp@<S0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  *(float *)&a4 = a4;
  *(float32x2_t *)a3 = vmla_f32(*(float32x2_t *)a1, vsub_f32(*(float32x2_t *)a2, *(float32x2_t *)a1), (float32x2_t)*(_OWORD *)&vdupq_lane_s32(*(int32x2_t *)&a4, 0));
  *(float32x4_t *)(a3 + 8) = vmlaq_n_f32(*(float32x4_t *)(a1 + 8), vsubq_f32(*(float32x4_t *)(a2 + 8), *(float32x4_t *)(a1 + 8)), *(float *)&a4);
  return *(float *)&a4;
}

id _ARLogCoaching_4()
{
  if (_ARLogCoaching_onceToken_4 != -1)
    dispatch_once(&_ARLogCoaching_onceToken_4, &__block_literal_global_13);
  return (id)_ARLogCoaching_logObj_4;
}

void ARFLSimpleSpringMake(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>, double a6@<D4>)
{
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  *(double *)a1 = a2;
  *(double *)(a1 + 8) = a3;
  *(_QWORD *)(a1 + 16) = 0x3FF0000000000000;
  *(double *)(a1 + 24) = a5;
  *(double *)(a1 + 32) = a6;
  *(double *)(a1 + 40) = a4;
}

BOOL ARFLSimpleSpringIsStable(double *a1)
{
  return vabdd_f64(*a1, a1[5]) <= a1[6] && fabs(a1[1]) <= a1[7];
}

double ARFLSimpleSpringMakeWithDampingRatioResponse@<D0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>, double a6@<D4>)
{
  double result;
  uint64_t v11;
  uint64_t v12;
  double v13;

  v12 = 0;
  v13 = 0.0;
  ARFLSpringConvertDampingRatioResponseToStiffnessDamping(&v13, (double *)&v12, a5, a6);
  v11 = v12;
  result = v13;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  *(double *)a1 = a2;
  *(double *)(a1 + 8) = a3;
  *(_QWORD *)(a1 + 16) = 0x3FF0000000000000;
  *(double *)(a1 + 24) = result;
  *(_QWORD *)(a1 + 32) = v11;
  *(double *)(a1 + 40) = a4;
  return result;
}

double ARFLSimpleSpringSetDampingRatioResponse(uint64_t a1, double a2, double a3)
{
  double result;
  uint64_t v5;
  uint64_t v6;
  double v7;

  v6 = 0;
  v7 = 0.0;
  ARFLSpringConvertDampingRatioResponseToStiffnessDamping(&v7, (double *)&v6, a2, a3);
  v5 = v6;
  result = v7;
  *(double *)(a1 + 24) = v7;
  *(_QWORD *)(a1 + 32) = v5;
  return result;
}

void ARFLSimpleSpringStep(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  double v5;
  double v6;
  double v7;
  __int128 v8;
  __int128 v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  __double2 v18;
  double v19;
  double v20;
  long double v21;
  double v22;
  double v23;
  long double v24;
  __int128 v25;
  __int128 v26;

  v5 = *(double *)(a1 + 40);
  if (vabdd_f64(*(double *)a1, v5) <= *(double *)(a1 + 48))
  {
    v6 = *(double *)(a1 + 8);
    if (fabs(v6) <= *(double *)(a1 + 56))
    {
      v25 = *(_OWORD *)(a1 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a1;
      *(_OWORD *)(a2 + 16) = v25;
      v26 = *(_OWORD *)(a1 + 48);
      *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
      *(_OWORD *)(a2 + 48) = v26;
      return;
    }
  }
  else
  {
    v6 = *(double *)(a1 + 8);
  }
  v7 = *(double *)a1 - v5;
  v8 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v8;
  v9 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 48) = v9;
  v10 = sqrt(*(double *)(a1 + 24));
  v11 = *(double *)(a1 + 32) * 0.5;
  v12 = -v11;
  v13 = exp(-(v11 * a3));
  v14 = v6 + v11 * v7;
  if (v11 >= v10)
  {
    if (v11 <= v10)
    {
      v19 = v7 + v14 * a3;
    }
    else
    {
      v20 = sqrt(v11 * v11 - v10 * v10);
      v21 = v20 * a3;
      v22 = v14 / v20;
      v23 = cosh(v21);
      v24 = sinh(v21);
      v19 = v22 * v24 + v7 * v23;
      v14 = v20 * (v22 * v23) + v7 * v24 * v20;
    }
  }
  else
  {
    v15 = sqrt(v11 * v12 + v10 * v10);
    v16 = v15 * a3;
    v17 = v14 / v15;
    v18 = __sincos_stret(v16);
    v19 = v17 * v18.__sinval + v7 * v18.__cosval;
    v14 = v15 * (v17 * v18.__cosval) + -(v18.__sinval * v7) * v15;
  }
  *(double *)a2 = v5 + v13 * v19;
  *(double *)(a2 + 8) = v13 * v12 * v19 + v13 * v14;
}

id _ARLogCoaching_5()
{
  if (_ARLogCoaching_onceToken_5 != -1)
    dispatch_once(&_ARLogCoaching_onceToken_5, &__block_literal_global_16);
  return (id)_ARLogCoaching_logObj_5;
}

float ARCoachingDeviceRenderParamsLerp@<S0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  double v4;
  float v5;
  float32x2_t v6;
  float result;

  v4 = *(double *)a1 + a4 * (*(double *)a2 - *(double *)a1);
  v5 = a4;
  v6 = vmla_n_f32(*(float32x2_t *)(a1 + 8), vsub_f32(*(float32x2_t *)(a2 + 8), *(float32x2_t *)(a1 + 8)), v5);
  *(double *)a3 = v4;
  *(float32x2_t *)(a3 + 8) = v6;
  result = *(float *)(a1 + 16) + (float)(v5 * (float)(*(float *)(a2 + 16) - *(float *)(a1 + 16)));
  *(float *)(a3 + 16) = result;
  return result;
}

id _ARLogCoaching_6()
{
  if (_ARLogCoaching_onceToken_6 != -1)
    dispatch_once(&_ARLogCoaching_onceToken_6, &__block_literal_global_17);
  return (id)_ARLogCoaching_logObj_6;
}

void _simd_slerp_internal(float64x2_t *a1@<X0>, float64x2_t *a2@<X1>, float64x2_t *a3@<X8>)
{
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  long double v10;
  double v11;
  double v12;
  BOOL v13;
  double v14;
  double v15;
  float64x2_t v16;
  double v17;
  long double v18;
  double v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  double v23;
  float64x2_t v24;
  float64x2_t v25;
  double v26;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  float64x2_t v31;

  v4 = a1[1];
  v5 = a2[1];
  v6 = vsubq_f64(*a1, *a2);
  v7 = vsubq_f64(v4, v5);
  v6.f64[0] = sqrt(vaddvq_f64(vaddq_f64(vmulq_f64(v6, v6), vmulq_f64(v7, v7))));
  v29 = *a2;
  v30 = *a1;
  v8 = vaddq_f64(*a1, *a2);
  v31 = v4;
  v28 = v5;
  v9 = vaddq_f64(v4, v5);
  v10 = atan2(v6.f64[0], sqrt(vaddvq_f64(vaddq_f64(vmulq_f64(v8, v8), vmulq_f64(v9, v9)))));
  v11 = v10 + v10;
  v12 = 1.0;
  v13 = v10 + v10 == 0.0;
  v14 = 1.0;
  if (!v13)
    v14 = sin(v11) / v11;
  v15 = 1.0 / v14;
  if (v11 * 0.0 != 0.0)
    v12 = sin(v11 * 0.0) / (v11 * 0.0);
  v16 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v15 * v12 * 0.0), 0);
  v17 = 1.0;
  if (v11 != 0.0)
  {
    v27 = v16;
    v18 = sin(v11);
    v16 = v27;
    v17 = v18 / v11;
  }
  v19 = v15 * v17;
  v20 = vmulq_n_f64(v28, v19);
  v21 = vmlaq_f64(vmulq_n_f64(v29, v19), v30, v16);
  v22 = vmlaq_f64(v20, v31, v16);
  v23 = vaddvq_f64(vaddq_f64(vmulq_f64(v21, v21), vmulq_f64(v22, v22)));
  if (v23 == 0.0)
  {
    v24 = (float64x2_t)xmmword_1DCCA11D0;
    v25 = 0uLL;
  }
  else
  {
    v26 = 1.0 / sqrt(v23);
    v24 = vmulq_n_f64(v22, v26);
    v25 = vmulq_n_f64(v21, v26);
  }
  *a3 = v25;
  a3[1] = v24;
}

uint64_t ARCreateNonFixedPriorityDispatchQueue()
{
  return MEMORY[0x1E0CF1FF8]();
}

uint64_t ARDeviceClass()
{
  return MEMORY[0x1E0CF2000]();
}

uint64_t ARDeviceHasHomeButton()
{
  return MEMORY[0x1E0CF2008]();
}

uint64_t ARDeviceHasIsland()
{
  return MEMORY[0x1E0CF2010]();
}

uint64_t ARDeviceIsiPad()
{
  return MEMORY[0x1E0CF2018]();
}

uint64_t ARDeviceRequiresFrameTrendControllerWorkaround()
{
  return MEMORY[0x1E0CF2020]();
}

uint64_t ARDeviceSupportsJasper()
{
  return MEMORY[0x1E0CF2028]();
}

uint64_t ARErrorWithCodeAndUserInfo()
{
  return MEMORY[0x1E0CF2040]();
}

uint64_t ARIntrinsicsFromDeviceFormat()
{
  return MEMORY[0x1E0CF2048]();
}

uint64_t ARKitCoreBundle()
{
  return MEMORY[0x1E0CF2050]();
}

uint64_t ARKitUIBundle()
{
  return MEMORY[0x1E0CF2058]();
}

uint64_t ARLinkedOnOrAfterYukon()
{
  return MEMORY[0x1E0CF2060]();
}

uint64_t ARMatrix4x4Dictionary()
{
  return MEMORY[0x1E0CF2068]();
}

uint64_t ARMatrix4x4FromRotationAndTranslation()
{
  return MEMORY[0x1E0CF2070]();
}

uint64_t ARMatrixPerspectiveFlipZ()
{
  return MEMORY[0x1E0CF2078]();
}

uint64_t ARPixelBufferWithCIImage()
{
  return MEMORY[0x1E0CF2080]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x1E0CD2388]();
  return result;
}

CATransform3D *__cdecl CATransform3DRotate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x1E0CD2658](retstr, t, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DScale(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2668](retstr, t, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DTranslate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2678](retstr, t, tx, ty, tz);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAB0](retstr, t);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1E0C9BAB8](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD0](retstr, angle);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x1E0CA8BF0](texture);
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x1E0CA8BF8](texture);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1E0CEA110]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x1E0CEAFE8]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x1E0CEB680](image, compressionQuality);
}

uint64_t UIRoundToScreenScale()
{
  return MEMORY[0x1E0CEBB28]();
}

void UISaveVideoAtPathToSavedPhotosAlbum(NSString *videoPath, id completionTarget, SEL completionSelector, void *contextInfo)
{
  MEMORY[0x1E0CEBB38](videoPath, completionTarget, completionSelector, contextInfo);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete(void *__p)
{
  off_1EA586110(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1EA586118(__sz);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

simd_float4x4 __invert_f4(simd_float4x4 a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  simd_float4x4 result;

  MEMORY[0x1E0C80B38]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3]);
  result.columns[3].i64[1] = v8;
  result.columns[3].i64[0] = v7;
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x1E0C80BC8](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x1E0C80BD0](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincospif_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x1E0C80BD8](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x1E0C81620](__y, __x);
  return result;
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7AA8](cls, name);
}

float cosf(float a1)
{
  float result;

  MEMORY[0x1E0C82B48](a1);
  return result;
}

long double cosh(long double __x)
{
  long double result;

  MEMORY[0x1E0C82B50](__x);
  return result;
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void method_exchangeImplementations(Method m1, Method m2)
{
  MEMORY[0x1E0DE7B50](m1, m2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t pthread_set_fixedpriority_self()
{
  return MEMORY[0x1E0C84EE8]();
}

int pthread_set_qos_class_self_np(qos_class_t __qos_class, int __relative_priority)
{
  return MEMORY[0x1E0C84EF0](*(_QWORD *)&__qos_class, *(_QWORD *)&__relative_priority);
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x1E0C85418](__x);
  return result;
}

float sinf(float a1)
{
  float result;

  MEMORY[0x1E0C85420](a1);
  return result;
}

long double sinh(long double __x)
{
  long double result;

  MEMORY[0x1E0C85428](__x);
  return result;
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

float tanf(float a1)
{
  float result;

  MEMORY[0x1E0C857F0](a1);
  return result;
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

