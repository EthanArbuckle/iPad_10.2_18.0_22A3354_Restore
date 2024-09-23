uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1D8256F50]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_5()
{
  return objc_opt_class();
}

void OUTLINED_FUNCTION_5_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

id OUTLINED_FUNCTION_4_2(void *a1)
{
  return a1;
}

void OUTLINED_FUNCTION_4_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

uint64_t OUTLINED_FUNCTION_3_0(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(_QWORD *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_2_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_2_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_7_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_3_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
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

_QWORD *std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::__emplace_unique_key_args<unsigned long,unsigned long const&>(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  _QWORD **v9;
  _QWORD *i;
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
      if (v6 >= v7)
        v3 = v6 % v7;
    }
    else
    {
      v3 = (v7 - 1) & v6;
    }
    v9 = *(_QWORD ***)(*(_QWORD *)a1 + 8 * v3);
    if (v9)
    {
      for (i = *v9; i; i = (_QWORD *)*i)
      {
        v11 = i[1];
        if (v11 == v6)
        {
          if (i[2] == v6)
            return i;
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
      }
    }
  }
  i = operator new(0x18uLL);
  *i = 0;
  i[1] = v6;
  i[2] = *a3;
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
    std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::__rehash<true>(a1, v17);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7)
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
    *i = *v19;
LABEL_38:
    *v19 = i;
    goto LABEL_39;
  }
  *i = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = i;
  *(_QWORD *)(v18 + 8 * v3) = a1 + 16;
  if (*i)
  {
    v20 = *(_QWORD *)(*i + 8);
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
  return i;
}

void sub_1D3FAC82C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::__rehash<true>(uint64_t a1, size_t __n)
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
      std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::__do_rehash<true>(a1, prime);
  }
}

id _DPSemanticVersionError(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB35C8];
  v7 = *MEMORY[0x1E0CB2D50];
  v8[0] = a1;
  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = a1;
  objc_msgSend(v2, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "errorWithDomain:code:userInfo:", CFSTR("com.apple.DifferentialPrivacy.SemanticVersionError"), 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id _DPPrivacyBudgetError(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB2D50];
  v10[0] = a2;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a2;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("com.apple.DifferentialPrivacy.DPPrivacyBudgetError"), a1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id _DPPrivacyBudgetErrorWithUnderlyingError(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = *MEMORY[0x1E0CB3388];
  v13[0] = *MEMORY[0x1E0CB2D50];
  v13[1] = v6;
  v14[0] = a2;
  v14[1] = a3;
  v7 = (void *)MEMORY[0x1E0C99D80];
  v8 = a3;
  v9 = a2;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.DifferentialPrivacy.DPPrivacyBudgetError"), a1, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void sub_1D3FB2288(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

_DWORD **poly_memory_alloc(size_t a1)
{
  _DWORD **v1;

  if (a1 - 4293918721u < 0xFFFFFFFF00100001)
    return 0;
  v1 = (_DWORD **)malloc_type_calloc(1uLL, 0x40uLL, 0x1004098A284A9uLL);
  *v1 = malloc_type_calloc(a1, 4uLL, 0x100004052888210uLL);
  v1[1] = malloc_type_calloc(a1, 4uLL, 0x100004052888210uLL);
  v1[2] = malloc_type_calloc(a1 >> 1, 4uLL, 0x100004052888210uLL);
  v1[3] = malloc_type_calloc(a1 >> 1, 4uLL, 0x100004052888210uLL);
  v1[4] = malloc_type_calloc(a1, 4uLL, 0x100004052888210uLL);
  v1[5] = malloc_type_calloc(a1, 4uLL, 0x100004052888210uLL);
  v1[6] = malloc_type_calloc(a1, 4uLL, 0x100004052888210uLL);
  v1[7] = malloc_type_calloc(a1, 4uLL, 0x100004052888210uLL);
  poly_fft_get_roots(*v1, a1, 0);
  poly_fft_get_roots(v1[1], a1, 1);
  poly_fft_get_roots(v1[2], a1 >> 1, 0);
  poly_fft_get_roots(v1[3], a1 >> 1, 1);
  return v1;
}

BOOL poly_fft_get_roots(_DWORD *a1, unint64_t a2, int a3)
{
  unint64_t v3;
  unsigned int v6;
  unsigned int v7;
  unsigned int *v8;
  unint64_t v9;
  unsigned int v10;

  v3 = a2 - 2;
  if (a2 - 2 <= 0xFFFFE)
  {
    v6 = -368989143;
    if (a3)
      v6 = invmod(0xEA01AC29);
    *a1 = 1;
    v7 = expmod(v6, 0x100000 / a2);
    a1[1] = v7;
    if (a2 >= 3)
    {
      v8 = a1 + 2;
      v9 = v3;
      v10 = v7;
      do
      {
        v7 = v10 * v7
           - v10 * (unint64_t)v7 / 0xFFF00001
           + ((v10 * (unint64_t)v7 / 0xFFF00001) << 20);
        *v8++ = v7;
        --v9;
      }
      while (v9);
    }
  }
  return v3 < 0xFFFFF;
}

void poly_memory_free(void **a1)
{
  if (a1)
  {
    free(*a1);
    free(a1[1]);
    free(a1[2]);
    free(a1[3]);
    free(a1[4]);
    free(a1[5]);
    free(a1[6]);
    free(a1[7]);
  }
  free(a1);
}

BOOL poly_fft(int *a1, _DWORD *a2, _DWORD *a3, unint64_t a4, int a5, int **a6)
{
  _BOOL8 result;
  unint64_t v9;
  unsigned int i;

  if (a4 > 0xFFF00000)
    return 0;
  v9 = a4;
  result = isNonZeroPowerOfTwo(a4);
  if (result)
  {
    fft_recurse(a1, v9, a3, a2, *a6, a6[1], a6[2]);
    if (a5)
    {
      for (i = invmod(v9); v9; --v9)
      {
        *a1 = *a1 * i
            - *a1 * (unint64_t)i / 0xFFF00001
            + ((*a1 * (unint64_t)i / 0xFFF00001) << 20);
        ++a1;
      }
    }
    return 1;
  }
  return result;
}

int *fft_recurse(int *result, unint64_t a2, _DWORD *a3, _DWORD *a4, int *a5, _DWORD *a6, _DWORD *a7)
{
  _DWORD *v11;
  _DWORD *v12;
  _DWORD *v13;
  int *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int *v18;
  unsigned int v19;
  unsigned int v20;
  BOOL v21;
  unsigned int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  int *v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unint64_t v32;
  uint64_t v33;
  _DWORD *v34;
  int v35;
  _DWORD *v36;
  int *v37;

  do
  {
    while (1)
    {
      v11 = a4;
      if (a2 == 1)
      {
        *result = *a4;
        return result;
      }
      v12 = a7;
      v13 = a6;
      v14 = a5;
      v15 = a2 >> 1;
      if (a2)
        break;
      a5 += v15;
      a6 += v15;
      a7 += v15;
      fft_recurse(v14, v15, v12, v13, &v14[v15], &v13[v15], &v12[v15]);
      result = v14;
      a2 = 0;
      a3 = v12;
      a4 = v13;
    }
    v36 = a3;
    v37 = result;
    v16 = 0;
    if (v15 <= 1)
      v17 = 1;
    else
      v17 = a2 >> 1;
    v18 = a3;
    do
    {
      v19 = a4[v16];
      v20 = -1048575 - a4[v15 + v16];
      v21 = v19 >= v20;
      v22 = v19 - v20;
      if (!v21)
        v22 -= 0xFFFFF;
      a6[v16] = v22;
      v23 = *v18;
      v18 += 2;
      a7[v16++] = v23;
    }
    while (v17 != v16);
    a5 += v15;
    a6 += v15;
    a7 += v15;
    fft_recurse(v14, a2 >> 1, v12, v13, &v14[v15], &v13[v15], &v12[v15]);
    result = v14;
    a3 = v12;
    a4 = v13;
    v21 = a2 >= 2;
    a2 >>= 1;
  }
  while (!v21);
  v24 = 0;
  if (v15 <= 1)
    v25 = 1;
  else
    v25 = v15;
  v26 = v37;
  do
  {
    *v26 = v14[v24];
    v26 += 2;
    ++v24;
  }
  while (v25 != v24);
  v27 = 0;
  if (v15 <= 1)
    v28 = 1;
  else
    v28 = v15;
  do
  {
    v29 = v11[v27];
    v30 = v11[v15 + v27];
    v21 = v29 >= v30;
    v31 = v29 - v30;
    if (!v21)
      v31 -= 0xFFFFF;
    v13[v27] = v31;
    v32 = v36[v27] * (unint64_t)v31;
    v13[v27++] = v32 - v32 / 0xFFF00001 + ((v32 / 0xFFF00001) << 20);
  }
  while (v28 != v27);
  result = (int *)fft_recurse(v14, v15, v12, v13, &v14[v15], &v13[v15], &v12[v15]);
  if (v15 <= 1)
    v33 = 1;
  else
    v33 = v15;
  v34 = v37 + 1;
  do
  {
    v35 = *v14++;
    *v34 = v35;
    v34 += 2;
    --v33;
  }
  while (v33);
  return result;
}

float _DPL2Norm(float *a1, uint64_t a2)
{
  float i;
  float v3;

  for (i = 0.0; a2; --a2)
  {
    v3 = *a1++;
    i = i + (float)(v3 * v3);
  }
  return sqrtf(i);
}

float _DPClipNorm(float *a1, uint64_t a2, float a3)
{
  float v3;
  float *v4;
  uint64_t v5;
  float v6;
  float v7;

  v3 = 0.0;
  if (a2)
  {
    v4 = a1;
    v5 = a2;
    do
    {
      v6 = *v4++;
      v3 = v3 + (float)(v6 * v6);
      --v5;
    }
    while (v5);
    v7 = sqrtf(v3);
    if (v7 > a3)
      v3 = a3;
    else
      v3 = v7;
    if (v7 > a3 && a2 != 0)
    {
      do
      {
        *a1 = (float)(a3 / v7) * *a1;
        ++a1;
        --a2;
      }
      while (a2);
      return a3;
    }
  }
  else if (a3 < 0.0)
  {
    return a3;
  }
  return v3;
}

long double _DPGaussianMechanismMinimumDelta(long double a1, double a2, double a3)
{
  double v5;
  long double v6;
  long double v7;
  long double v8;

  v5 = a2 + a2;
  v6 = a1 * a2 / a3;
  v7 = erfc((a3 / (a2 + a2) - v6) / -1.41421356) * 0.5;
  v8 = erfc((-a3 / v5 - v6) / -1.41421356) * 0.5;
  return v7 - exp(a1) * v8;
}

void _DPMomentsAccountantSubSampledRenyiEpsilon(unsigned int a1, double a2, double a3)
{
  double v6;
  double *v7;
  double *v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  long double v20;
  long double v21;

  if (a2 >= 1.0e-14 && vabdd_f64(1.0, a2) >= 1.0e-14)
  {
    v6 = 1.0 - a2;
    v7 = (double *)malloc_type_calloc(a1 - 1, 8uLL, 0x100004000313F17uLL);
    v8 = v7;
    v9 = (double)a1;
    v10 = ((double)a1 + -1.0) * (double)a1 * 0.5;
    *v7 = v10;
    if (a1 >= 3)
    {
      v11 = 0;
      v12 = 3.0;
      do
      {
        v10 = v10 * (v9 + 1.0 - v12) / v12;
        v7[v11 + 1] = v10;
        v12 = (double)(unint64_t)(v11 + 4);
        ++v11;
      }
      while (v12 <= v9);
    }
    v13 = a2 / v6;
    v14 = log(a2 / v6);
    v15 = log(v9 * v13 + 1.0);
    if (a1 >= 2)
    {
      v16 = 0;
      v17 = 1.0 / ((a3 + a3) * a3);
      v18 = a1 - 1;
      do
      {
        v19 = v16 + 1;
        v20 = log(v8[v16])
            + (double)(unint64_t)((v16 + 1) * (v16 + 2)) * v17
            + (double)(unint64_t)(v16 + 2) * v14;
        v21 = exp(v15 - v20);
        v15 = v20 + log(v21 + 1.0);
        v16 = v19;
      }
      while (v18 != v19);
    }
    free(v8);
    log(v6);
  }
}

double _DPBinomialCoef(double *a1, double result)
{
  double v2;
  double v3;
  uint64_t v4;

  v2 = (result + -1.0) * result * 0.5;
  *a1 = v2;
  v3 = 3.0;
  if (result >= 3.0)
  {
    v4 = 0;
    do
    {
      v2 = (result + 1.0 - v3) * v2 / v3;
      a1[v4 + 1] = v2;
      v3 = (double)(unint64_t)(v4 + 4);
      ++v4;
    }
    while (v3 <= result);
  }
  return result;
}

void sub_1D3FB50A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3FB5400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
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

void sub_1D3FB5D34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__25(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x1D8256D34](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__26(uint64_t a1)
{

}

void sub_1D3FB620C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3FB72B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_1D3FB7DEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  void *v17;

  objc_sync_exit(v17);
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

void sub_1D3FB7FC4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void reportCoreAnalyticsUploadEvent(void *a1, uint64_t a2, double a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "systemUptime");
  v8 = v7;

  v9 = (void *)MEMORY[0x1E0C99E08];
  v19[0] = CFSTR("connectionType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v10;
  v19[1] = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8 - a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v11;
  v19[2] = CFSTR("success");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5 == 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryWithDictionary:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@_%ld"), v16, objc_msgSend(v5, "code"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("domainCode"));

  }
  +[_DPCoreAnalyticsCollector sharedInstance](_DPCoreAnalyticsCollector, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "reportMetricsForEvent:withMetrics:", CFSTR("com.apple.DifferentialPrivacy.DediscoUpload"), v14);

}

float *accumulate(float *result, float *a2, uint64_t a3)
{
  float v3;

  for (; a3; --a3)
  {
    v3 = *a2++;
    *result = v3 + *result;
    ++result;
  }
  return result;
}

_QWORD *prio_memory_alloc(uint64_t a1)
{
  unint64_t PowerOfTwo;
  size_t v2;
  _QWORD *v3;
  size_t v4;

  PowerOfTwo = nextPowerOfTwo(a1 + 1);
  v2 = 2 * PowerOfTwo;
  if (2 * PowerOfTwo > 0x100000)
    return 0;
  v4 = PowerOfTwo;
  v3 = malloc_type_malloc(0x30uLL, 0x300407BB6DF5BuLL);
  *v3 = malloc_type_calloc(v2, 4uLL, 0x100004052888210uLL);
  v3[1] = malloc_type_calloc(v4, 4uLL, 0x100004052888210uLL);
  v3[2] = malloc_type_calloc(v4, 4uLL, 0x100004052888210uLL);
  v3[3] = malloc_type_calloc(v2, 4uLL, 0x100004052888210uLL);
  v3[4] = malloc_type_calloc(v2, 4uLL, 0x100004052888210uLL);
  v3[5] = poly_memory_alloc(v2);
  return v3;
}

void prio_memory_free(void *a1)
{
  if (a1)
  {
    free(*(void **)a1);
    free(*((void **)a1 + 1));
    free(*((void **)a1 + 2));
    free(*((void **)a1 + 3));
    free(*((void **)a1 + 4));
    poly_memory_free(*((void ***)a1 + 5));
  }
  free(a1);
}

unsigned int *share_array_prng(unsigned int *result, unsigned int *a2, uint64_t a3)
{
  unsigned int v3;
  unsigned int v4;

  for (; a3; --a3)
  {
    v3 = *a2++;
    v4 = *result - v3;
    if (*result < v3)
      v4 -= 0xFFFFF;
    *result++ = v4;
  }
  return result;
}

unint64_t prio_share_length(uint64_t a1)
{
  return a1 + nextPowerOfTwo(a1 + 1) + 3;
}

BOOL prio_encode(uint64_t a1, int *a2, uint64_t a3, _QWORD *a4)
{
  unint64_t v8;
  unint64_t v9;
  uint32_t *v10;
  unint64_t PowerOfTwo;
  uint32_t *v12;
  uint32_t *v13;
  uint32_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int *v18;
  _DWORD *v19;
  int v20;
  int v21;
  int v22;
  _DWORD *v23;
  unsigned int *v24;
  unsigned int *v25;
  unint64_t v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unint64_t v31;
  int *v32;
  int *v33;
  uint64_t v34;

  v8 = a1 + 1;
  v9 = a1 + nextPowerOfTwo(a1 + 1) + 3;
  if (v9 == a3)
  {
    v10 = (uint32_t *)&a2[a1];
    PowerOfTwo = nextPowerOfTwo(v8);
    v13 = (uint32_t *)a4[1];
    v12 = (uint32_t *)a4[2];
    v33 = (int *)a4[3];
    v34 = 2 * PowerOfTwo;
    v31 = PowerOfTwo;
    v32 = (int *)a4[4];
    *v13 = arc4random_uniform(0xFFF00001);
    *v12 = arc4random_uniform(0xFFF00001);
    v14 = *v13;
    *v10 = *v13;
    v15 = *v12 * (unint64_t)v14;
    v10[1] = *v12;
    v10[2] = v15 % 0xFFF00001;
    if (a1)
    {
      v16 = 2;
      if (v8 > 2)
        v16 = v8;
      v17 = v16 - 1;
      v18 = (int *)(v12 + 1);
      v19 = v13 + 1;
      do
      {
        v20 = *a2++;
        *v19++ = v20;
        v21 = v20 - 1;
        if (v20)
          v22 = v21;
        else
          v22 = -1048576;
        *v18++ = v22;
        --v17;
      }
      while (v17);
    }
    poly_interpolate_eval_2N(v31 & 0x7FFFFFFFFFFFFFFFLL, v13, v33, (uint64_t)a4);
    poly_interpolate_eval_2N(v31 & 0x7FFFFFFFFFFFFFFFLL, v12, v32, (uint64_t)a4);
    if (v34)
    {
      v23 = v10 + 3;
      v24 = (unsigned int *)(v32 + 1);
      v25 = (unsigned int *)(v33 + 1);
      v26 = ((unint64_t)(v34 - 2) >> 1) + 1;
      do
      {
        v28 = *v25;
        v25 += 2;
        v27 = v28;
        v29 = *v24;
        v24 += 2;
        *v23++ = v29 * (unint64_t)v27 % 0xFFF00001;
        --v26;
      }
      while (v26);
    }
  }
  return v9 == a3;
}

BOOL poly_interpolate_eval_2N(unint64_t a1, _DWORD *a2, int *a3, uint64_t a4)
{
  int *v7;

  v7 = *(int **)a4;
  poly_fft(*(int **)a4, a2, *(_DWORD **)(*(_QWORD *)(a4 + 40) + 24), a1, 1, (int **)(*(_QWORD *)(a4 + 40) + 40));
  return poly_fft(a3, v7, **(_DWORD ***)(a4 + 40), 2 * a1, 0, (int **)(*(_QWORD *)(a4 + 40) + 40));
}

void sub_1D3FBC6B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D3FBCDAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_1D3FBD6FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1D3FBE1A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3FBE56C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3FBE968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3FBFA68(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D3FBFC38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL sampleUniformWithoutReplace<unsigned long,std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>(_QWORD *a1, unint64_t *a2, unint64_t *a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v14;
  _QWORD v15[2];
  unint64_t v16;

  v4 = *a3;
  v5 = *a2;
  if (*a3 <= *a2)
  {
    std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::clear(a1);
    v10 = *a2;
    v11 = *a2 - *a3;
    v16 = v11;
    while (v11 < v10)
    {
      v15[0] = 0;
      v15[1] = v11;
      v14 = 0;
      v14 = std::uniform_int_distribution<unsigned long>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((uint64_t)v15, a4, v15);
      std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::__emplace_unique_key_args<unsigned long,unsigned long const&>((uint64_t)a1, (unint64_t *)&v14, &v14);
      if ((v12 & 1) == 0)
        std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::__emplace_unique_key_args<unsigned long,unsigned long const&>((uint64_t)a1, &v16, &v16);
      v11 = ++v16;
      v10 = *a2;
    }
  }
  return v4 <= v5;
}

void sub_1D3FBFE44(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D3FC003C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::~__hash_table(uint64_t a1)
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

_QWORD *std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::clear(_QWORD *result)
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

uint64_t std::uniform_int_distribution<unsigned long>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v4;
  unint64_t v5;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _BYTE v10[64];

  result = a3[1];
  v4 = result - *a3;
  if (result != *a3)
  {
    v5 = v4 + 1;
    if (v4 == -1)
    {
      std::__independent_bits_engine<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>,unsigned long>::__independent_bits_engine((uint64_t)v10, a2, 0x40uLL);
      return std::__independent_bits_engine<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>,unsigned long>::__eval((uint64_t)v10);
    }
    else
    {
      v7 = __clz(v5);
      v8 = 63;
      if (((v5 << v7) & 0x7FFFFFFFFFFFFFFFLL) != 0)
        v8 = 64;
      std::__independent_bits_engine<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>,unsigned long>::__independent_bits_engine((uint64_t)v10, a2, v8 - v7);
      do
        v9 = std::__independent_bits_engine<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>,unsigned long>::__eval((uint64_t)v10);
      while (v9 >= v5);
      return *a3 + v9;
    }
  }
  return result;
}

uint64_t std::__independent_bits_engine<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>,unsigned long>::__independent_bits_engine(uint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unsigned int v7;
  unsigned int v8;

  *(_QWORD *)result = a2;
  *(_QWORD *)(result + 8) = a3;
  if ((a3 & 0x1F) != 0)
    v3 = (a3 >> 5) + 1;
  else
    v3 = a3 >> 5;
  v4 = a3 / v3;
  *(_QWORD *)(result + 16) = a3 / v3;
  *(_QWORD *)(result + 24) = v3;
  v5 = (-1 << (a3 / v3)) & 0x100000000;
  if (a3 / v3 >= 0x40)
    v5 = 0;
  *(_QWORD *)(result + 40) = v5;
  if ((v5 ^ 0x100000000) > v5 / v3)
  {
    ++v3;
    v4 = a3 / v3;
    *(_QWORD *)(result + 16) = a3 / v3;
    *(_QWORD *)(result + 24) = v3;
    if (a3 / v3 > 0x3F)
    {
      v6 = 0;
      *(_QWORD *)(result + 32) = v3 + v4 * v3 - a3;
      *(_QWORD *)(result + 40) = 0;
      goto LABEL_13;
    }
    *(_QWORD *)(result + 40) = (-1 << v4) & 0x100000000;
  }
  *(_QWORD *)(result + 32) = v3 + a3 / v3 * v3 - a3;
  if (v4 > 0x3E)
    v6 = 0;
  else
    v6 = 0x80000000uLL >> v4 << (v4 + 1);
LABEL_13:
  *(_QWORD *)(result + 48) = v6;
  v7 = 0xFFFFFFFF >> -(char)v4;
  if (!v4)
    v7 = 0;
  if (v4 >= 0x1F)
    v8 = -1;
  else
    v8 = 0xFFFFFFFF >> ~(_BYTE)v4;
  *(_DWORD *)(result + 56) = v7;
  *(_DWORD *)(result + 60) = v8;
  return result;
}

uint64_t std::__independent_bits_engine<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>,unsigned long>::__eval(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v8;
  unint64_t v9;
  uint64_t v10;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = 0;
    v3 = 0;
    do
    {
      do
        v4 = std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(*(std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> **)a1);
      while (*(_QWORD *)(a1 + 40) <= (unint64_t)v4);
      v5 = *(_QWORD *)(a1 + 16);
      if (v5 >= 0x40)
        v6 = 0;
      else
        v6 = v2 << v5;
      v2 = v6 + (*(_DWORD *)(a1 + 56) & v4);
      ++v3;
      v7 = *(_QWORD *)(a1 + 32);
    }
    while (v3 < v7);
  }
  else
  {
    v2 = 0;
    v7 = 0;
  }
  for (; v7 < *(_QWORD *)(a1 + 24); ++v7)
  {
    do
      v8 = std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(*(std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> **)a1);
    while (*(_QWORD *)(a1 + 48) <= (unint64_t)v8);
    v9 = *(_QWORD *)(a1 + 16);
    if (v9 >= 0x3F)
      v10 = 0;
    else
      v10 = v2 << (v9 + 1);
    v2 = v10 + (*(_DWORD *)(a1 + 60) & v8);
  }
  return v2;
}

std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *this)
{
  size_t i;
  size_t v2;
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v3;

  i = this->__i_;
  v2 = (i + 1) % 0x270;
  v3 = this->__x_[(i + 397) % 0x270] ^ ((this->__x_[v2] & 0x7FFFFFFE | this->__x_[i] & 0x80000000) >> 1) ^ ((int)(this->__x_[v2] << 31) >> 31) & 0x9908B0DF;
  this->__x_[i] = v3;
  this->__i_ = v2;
  LODWORD(i) = ((v3 ^ (v3 >> 11)) << 7) & 0x9D2C5680 ^ v3 ^ (v3 >> 11);
  return ((_DWORD)i << 15) & 0xEFC60000 ^ i ^ ((((_DWORD)i << 15) & 0xEFC60000 ^ i) >> 18);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E0DE4E98], MEMORY[0x1E0DE4390]);
}

void std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
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

uint64_t *std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::__erase_unique<unsigned long>(_QWORD *a1, unint64_t *a2)
{
  uint64_t *result;

  result = std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::find<unsigned long>(a1, a2);
  if (result)
  {
    std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::erase(a1, result);
    return (uint64_t *)1;
  }
  return result;
}

_QWORD *std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::find<unsigned long>(_QWORD *a1, unint64_t *a2)
{
  int8x8_t v2;
  unint64_t v3;
  uint8x8_t v4;
  unint64_t v5;
  _QWORD *v6;
  _QWORD *result;
  unint64_t v8;

  v2 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v2)
    return 0;
  v3 = *a2;
  v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = *a2;
    if (v3 >= *(_QWORD *)&v2)
      v5 = v3 % *(_QWORD *)&v2;
  }
  else
  {
    v5 = (*(_QWORD *)&v2 - 1) & v3;
  }
  v6 = *(_QWORD **)(*a1 + 8 * v5);
  if (!v6)
    return 0;
  result = (_QWORD *)*v6;
  if (*v6)
  {
    do
    {
      v8 = result[1];
      if (v8 == v3)
      {
        if (result[2] == v3)
          return result;
      }
      else
      {
        if (v4.u32[0] > 1uLL)
        {
          if (v8 >= *(_QWORD *)&v2)
            v8 %= *(_QWORD *)&v2;
        }
        else
        {
          v8 &= *(_QWORD *)&v2 - 1;
        }
        if (v8 != v5)
          return 0;
      }
      result = (_QWORD *)*result;
    }
    while (result);
  }
  return result;
}

uint64_t std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::erase(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  void *v3;
  void *__p;

  v2 = *a2;
  std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::remove(a1, a2, (uint64_t)&__p);
  v3 = __p;
  __p = 0;
  if (v3)
    operator delete(v3);
  return v2;
}

_QWORD *std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::remove@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X8>)
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

  v3 = (int8x8_t)result[1];
  v4 = a2[1];
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
  v6 = *(_QWORD **)(*result + 8 * v4);
  do
  {
    v7 = v6;
    v6 = (_QWORD *)*v6;
  }
  while (v6 != a2);
  if (v7 == result + 2)
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
    if (!*a2)
      goto LABEL_19;
    v9 = *(_QWORD *)(*a2 + 8);
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
      *(_QWORD *)(*result + 8 * v4) = 0;
  }
  v10 = *a2;
  if (*a2)
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
      *(_QWORD *)(*result + 8 * v11) = v7;
      v10 = *a2;
    }
  }
  *v7 = v10;
  *a2 = 0;
  --result[3];
  *(_QWORD *)a3 = a2;
  *(_QWORD *)(a3 + 8) = result + 2;
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

uint64_t std::binomial_distribution<unsigned long>::param_type::param_type(uint64_t a1, unint64_t a2, double a3)
{
  double v5;
  double v6;
  double v7;
  unint64_t v8;
  long double v9;
  long double v10;
  double v11;
  long double v12;
  int v14;
  int v15;
  int v16;

  *(_QWORD *)a1 = a2;
  *(double *)(a1 + 8) = a3;
  if (a3 > 0.0 && a3 < 1.0)
  {
    *(_QWORD *)(a1 + 32) = (unint64_t)((double)(a2 + 1) * a3);
    v5 = lgamma_r((double)a2 + 1.0, &v14);
    v6 = v5 - lgamma_r((double)*(unint64_t *)(a1 + 32) + 1.0, &v15);
    v7 = v6 - lgamma_r((double)(unint64_t)(*(_QWORD *)a1 - *(_QWORD *)(a1 + 32)) + 1.0, &v16);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(double *)(a1 + 8);
    v10 = v7 + (double)v8 * log(v9);
    v11 = (double)(*(_QWORD *)a1 - v8);
    v12 = log(1.0 - v9);
    *(long double *)(a1 + 16) = exp(v10 + v11 * v12);
    *(long double *)(a1 + 24) = v9 / (1.0 - v9);
  }
  return a1;
}

unint64_t std::binomial_distribution<unsigned long>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>(int a1, std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *this, uint64_t a3)
{
  unint64_t result;
  double v5;
  double v7;
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v8;
  double v9;
  double v10;
  unint64_t v11;
  double v12;
  unint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  result = *(_QWORD *)a3;
  if (*(_QWORD *)a3)
  {
    v5 = *(double *)(a3 + 8);
    if (v5 == 0.0)
    {
      return 0;
    }
    else if (v5 != 1.0)
    {
      v7 = (double)std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this);
      v8 = std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this);
      v9 = *(double *)(a3 + 16);
      v10 = (v7 + (double)v8 * 4294967300.0) * 5.42101086e-20 + 0.0 - v9;
      v11 = *(_QWORD *)(a3 + 32);
      if (v10 >= 0.0)
      {
        v12 = *(double *)(a3 + 24);
        v13 = *(_QWORD *)a3;
        v14 = *(double *)(a3 + 16);
        v15 = *(_QWORD *)(a3 + 32);
        while (2)
        {
          v16 = 0;
          v17 = 0;
          v18 = v15;
          while (1)
          {
            v19 = v17;
            if (v15 == v17)
              break;
            v14 = v14
                * ((double)(unint64_t)(v15 + v16)
                 / (v12
                  * (double)(unint64_t)(*(_QWORD *)a3 + 1 - v15 + v17)));
            v10 = v10 - v14;
            if (v10 < 0.0)
              return ~v17 + v15;
            ++v17;
            result = v11 + v19 + 1;
            --v16;
            --v18;
            if (result <= v13)
            {
              v15 += v16;
              goto LABEL_15;
            }
          }
          result = v11 + v17 + 1;
          if (result > v13)
            return 0;
          v15 = v15 - (v18 != 0) - v17;
LABEL_15:
          v9 = v9 * (v12 * (double)(v13 - v11 - v19) / (double)result);
          v10 = v10 - v9;
          v11 = result;
          if (v10 >= 0.0)
            continue;
          break;
        }
      }
      else
      {
        return *(_QWORD *)(a3 + 32);
      }
    }
  }
  return result;
}

void sub_1D3FC2B54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  uint64_t v41;

  _Block_object_dispose(&a41, 8);
  _Block_object_dispose((const void *)(v41 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void sub_1D3FC3748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3FC3864(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3FC3AA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

Class __getSTCommunicationClientClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!ScreenTimeCoreLibraryCore_frameworkLibrary)
  {
    ScreenTimeCoreLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!ScreenTimeCoreLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("STCommunicationClient");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSTCommunicationClientClass_block_invoke_cold_1();
    free(v3);
  }
  getSTCommunicationClientClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAKAccountManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AuthKitLibraryCore_frameworkLibrary)
  {
    AuthKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AuthKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("AKAccountManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getAKAccountManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getAKAccountManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getFAFetchFamilyCircleRequestClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!FamilyCircleLibraryCore_frameworkLibrary)
  {
    FamilyCircleLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!FamilyCircleLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("FAFetchFamilyCircleRequest");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getFAFetchFamilyCircleRequestClass_block_invoke_cold_1();
    free(v3);
  }
  getFAFetchFamilyCircleRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1D3FC6798(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1D3FC6F78(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1D3FC7E28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

uint64_t set_bit(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(a2 + ((unint64_t)result >> 3)) ^= 1 << (result & 7);
  return result;
}

uint64_t uint32_from_string(unsigned int a1, const char *a2, unsigned int a3)
{
  CC_LONG v5;
  CC_SHA256_CTX v7;
  unsigned int data;
  unsigned __int8 md[32];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  data = bswap32(a1);
  memset(&v7, 0, sizeof(v7));
  CC_SHA256_Init(&v7);
  CC_SHA256_Update(&v7, &data, 4u);
  v5 = strlen(a2);
  CC_SHA256_Update(&v7, a2, v5);
  CC_SHA256_Final(md, &v7);
  return *(_DWORD *)md % a3;
}

unint64_t expmod(unsigned int a1, unsigned int a2)
{
  unint64_t v2;
  unint64_t result;
  char v4;

  if (!a2)
    return 1;
  v2 = a1;
  result = 1;
  do
  {
    if ((a2 & 1) == 0)
    {
      do
      {
        v4 = a2;
        a2 >>= 1;
        v2 = v2 * v2 % 0xFFF00001;
      }
      while ((v4 & 2) == 0);
    }
    result = result * v2 % 0xFFF00001;
    --a2;
  }
  while (a2);
  return result;
}

uint64_t invmod(unsigned int a1)
{
  int v1;
  int v2;
  unsigned int v3;
  int v4;
  unsigned int v5;
  int v6;

  v1 = 0;
  v2 = 0;
  v3 = -1048575;
  v4 = 1;
  do
  {
    v5 = v3;
    v6 = v4;
    v4 = v2 - v4 * v1;
    v1 = a1 / v3;
    v3 = a1 % v3;
    v2 = v6;
    a1 = v5;
  }
  while (v3);
  if (v4 >= 0)
    return v4;
  else
    return (v4 - 0xFFFFF);
}

uint64_t OUTLINED_FUNCTION_10()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_11(uint64_t a1)
{
  return *(_QWORD *)(a1 + 48);
}

_DWORD *pi_rappor_get_coefficients(_DWORD *result, uint64_t a2, unint64_t a3, unsigned int a4)
{
  for (; a2; --a2)
  {
    *result++ = a3 % a4;
    a3 /= a4;
  }
  return result;
}

BOOL pi_rappor_BOOL_func(unsigned int a1, unsigned int a2)
{
  return a1 < a2;
}

uint64_t pi_rappor_inverse_BOOL_func(uint64_t result, int a2, int a3, _DWORD *a4, _DWORD *a5)
{
  int v5;
  int v6;

  if ((_DWORD)result)
    v5 = 0;
  else
    v5 = a2;
  if ((_DWORD)result)
    v6 = a2;
  else
    v6 = a3;
  *a4 = v5;
  *a5 = v6;
  return result;
}

void sub_1D3FD0878(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3FD08F0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3FD0998(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3FD0A40(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3FD0AE8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3FD0B90(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3FD0C2C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3FD0CC8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3FD0D84(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3FD0ECC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3FD0F40(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3FD13D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1D3FD15E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1D3FD1930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void sub_1D3FD1B7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3FD1D24(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3FD1EFC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3FDE6EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void __one_time_setup_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  id v5;
  const char *v6;
  id v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  id v14;
  void *v15;
  char v16;
  id v17;
  NSObject *v18;
  void *v19;
  char v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v27 = 0;
  v4 = objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v27);
  v5 = v27;
  if (!v4)
  {
    +[_DPLog daemon](_DPLog, "daemon");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      __one_time_setup_block_invoke_cold_7();

    exit(1);
  }
  v6 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
  +[_DPStrings dataValueStorageClass](_DPStrings, "dataValueStorageClass");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "UTF8String");
  v8 = rootless_check_datavault_flag();
  +[_DPLog daemon](_DPLog, "daemon");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 != 1)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __one_time_setup_block_invoke_cold_6(v10);
    goto LABEL_14;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3FAA000, v10, OS_LOG_TYPE_INFO, "Database directory needs conversion to Data Vault", buf, 2u);
  }

  if (chmod(v6, 0x1C0u))
  {
    +[_DPLog daemon](_DPLog, "daemon");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __one_time_setup_block_invoke_cold_5();

  }
  if (rootless_convert_to_datavault())
  {
    +[_DPLog daemon](_DPLog, "daemon");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __one_time_setup_block_invoke_cold_4();
LABEL_14:

  }
  v12 = *(_QWORD *)(a1 + 40);
  v26 = v5;
  v13 = objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v12, 1, 0, &v26);
  v14 = v26;

  if (v13)
  {
    +[_DPReportFilesMaintainer retiredReportsPath:](_DPReportFilesMaintainer, "retiredReportsPath:", *(_QWORD *)(a1 + 40));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v14;
    v16 = objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v15, 1, 0, &v25);
    v17 = v25;

    if ((v16 & 1) != 0)
      goto LABEL_23;
    +[_DPLog daemon](_DPLog, "daemon");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      __one_time_setup_block_invoke_cold_2();
  }
  else
  {
    +[_DPLog daemon](_DPLog, "daemon");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      __one_time_setup_block_invoke_cold_3();
    v17 = v14;
  }

LABEL_23:
  +[_DPStrings transparencyLogDirectoryPath](_DPStrings, "transparencyLogDirectoryPath");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v17;
  v20 = objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v19, 1, 0, &v24);
  v21 = v24;

  if ((v20 & 1) == 0)
  {
    +[_DPLog daemon](_DPLog, "daemon");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      __one_time_setup_block_invoke_cold_1();

  }
}

id _DPVDAFError(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB2D50];
  v10[0] = a2;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a2;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("com.apple.DifferentialPrivacy.DPVDAFError"), a1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void sub_1D3FE4634(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D3FE49C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a45, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void sub_1D3FE5F64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3FE6224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_1D3FE63E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getLBFEventManagerClass_block_invoke(uint64_t a1)
{
  LighthouseBitacoraFrameworkLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("LBFEventManager");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getLBFEventManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getLBFEventManagerClass_block_invoke_cold_1();
    LighthouseBitacoraFrameworkLibrary();
  }
}

void LighthouseBitacoraFrameworkLibrary()
{
  void *v0;

  if (!LighthouseBitacoraFrameworkLibraryCore_frameworkLibrary)
    LighthouseBitacoraFrameworkLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!LighthouseBitacoraFrameworkLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getLBFTrialIdentifiersClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  LighthouseBitacoraFrameworkLibrary();
  result = objc_getClass("LBFTrialIdentifiers");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getLBFTrialIdentifiersClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getLBFTrialIdentifiersClass_block_invoke_cold_1();
    return (Class)__getLBFDprivacydEventClass_block_invoke(v3);
  }
  return result;
}

_DPHCMSSequenceRecord *__getLBFDprivacydEventClass_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _DPHCMSSequenceRecord *result;
  _DPHCMSSequenceRecord *v11;
  SEL v12;
  id v13;
  id v14;
  id v15;
  unsigned __int16 v16;
  unsigned int v17;
  BOOL v18;
  double v19;

  LighthouseBitacoraFrameworkLibrary();
  result = (_DPHCMSSequenceRecord *)objc_getClass("LBFDprivacydEvent");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getLBFDprivacydEventClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v11 = (_DPHCMSSequenceRecord *)__getLBFDprivacydEventClass_block_invoke_cold_1();
    return -[_DPHCMSSequenceRecord initWithKey:plainSequence:sequence:sequenceHashIndex:sequenceBitIndex:creationDate:submitted:objectId:](v11, v12, v13, v14, v15, v16, v17, v19, v18, a9);
  }
  return result;
}

uint64_t XXH_versionNumber()
{
  return 702;
}

uint64_t XXH32(int *a1, unint64_t a2, unsigned int a3)
{
  int *v3;
  int32x4_t v4;
  int32x4_t v5;
  int32x4_t v6;
  int32x4_t v7;
  int32x4_t v8;
  int32x4_t v9;
  int32x4_t v10;
  int32x4_t v11;
  int32x4_t v12;
  int v13;

  v3 = a1;
  if ((a1 & 3) == 0)
  {
    if (a2 >= 0x10)
    {
      *(int32x2_t *)v4.i8 = vadd_s32(vdup_n_s32(a3), (int32x2_t)0x85EBCA7724234428);
      v4.i32[2] = a3;
      v4.i32[3] = a3 + 1640531535;
      v9 = vdupq_n_s32(0x85EBCA77);
      v10 = vdupq_n_s32(0x9E3779B1);
      do
      {
        v11 = *(int32x4_t *)v3;
        v3 += 4;
        v12 = vmlaq_s32(v4, v11, v9);
        v4 = vmulq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_n_s32(v12, 0xDuLL), (int8x16_t)vshrq_n_u32((uint32x4_t)v12, 0x13uLL)), v10);
      }
      while (v3 < (int *)((char *)a1 + a2 - 15));
      goto LABEL_9;
    }
LABEL_10:
    v13 = a3 + 374761393;
    return XXH32_finalize(v13 + (int)a2, v3, a2 & 0xF);
  }
  if (a2 < 0x10)
    goto LABEL_10;
  *(int32x2_t *)v4.i8 = vadd_s32(vdup_n_s32(a3), (int32x2_t)0x85EBCA7724234428);
  v4.i32[2] = a3;
  v4.i32[3] = a3 + 1640531535;
  v5 = vdupq_n_s32(0x85EBCA77);
  v6 = vdupq_n_s32(0x9E3779B1);
  do
  {
    v7 = *(int32x4_t *)v3;
    v3 += 4;
    v8 = vmlaq_s32(v4, v7, v5);
    v4 = vmulq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_n_s32(v8, 0xDuLL), (int8x16_t)vshrq_n_u32((uint32x4_t)v8, 0x13uLL)), v6);
  }
  while (v3 < (int *)((char *)a1 + a2 - 15));
LABEL_9:
  v13 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32((uint32x4_t)v4, (uint32x4_t)xmmword_1D400B710), (int8x16_t)vshlq_u32((uint32x4_t)v4, (uint32x4_t)xmmword_1D400B700)));
  return XXH32_finalize(v13 + (int)a2, v3, a2 & 0xF);
}

void *XXH32_createState()
{
  return malloc_type_malloc(0x30uLL, 0x7DE129A8uLL);
}

uint64_t XXH32_freeState(void *a1)
{
  free(a1);
  return 0;
}

__n128 XXH32_copyState(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t XXH32_reset(uint64_t a1, unsigned int a2)
{
  *(_QWORD *)a1 = 0;
  *(int32x2_t *)(a1 + 8) = vadd_s32(vdup_n_s32(a2), (int32x2_t)0x85EBCA7724234428);
  *(_DWORD *)(a1 + 16) = a2;
  *(_DWORD *)(a1 + 20) = a2 + 1640531535;
  *(_DWORD *)(a1 + 40) = 0;
  *(_OWORD *)(a1 + 24) = 0uLL;
  return 0;
}

uint64_t XXH32_update(uint64_t a1, int32x4_t *__src, size_t __n)
{
  int v3;
  int32x4_t *v4;
  int v6;
  unsigned int v7;
  _BOOL4 v9;
  uint64_t v10;
  size_t v11;
  uint64_t result;
  int32x4_t *v13;
  int32x4_t v14;
  int32x4_t v15;
  int32x4_t v16;
  int32x4_t v17;
  int32x4_t v18;
  int32x4_t v19;

  if (!__src)
    return 1;
  v3 = __n;
  v4 = __src;
  v6 = *(_DWORD *)(a1 + 4);
  v7 = *(_DWORD *)a1 + __n;
  v9 = __n > 0xF || v7 > 0xF;
  *(_DWORD *)a1 = v7;
  *(_DWORD *)(a1 + 4) = v6 | v9;
  v10 = *(unsigned int *)(a1 + 40);
  if (v10 + __n <= 0xF)
  {
    memcpy((void *)(a1 + v10 + 24), __src, __n);
    LODWORD(v11) = *(_DWORD *)(a1 + 40) + v3;
LABEL_19:
    result = 0;
    *(_DWORD *)(a1 + 40) = v11;
    return result;
  }
  v13 = (int32x4_t *)((char *)__src + __n);
  if ((_DWORD)v10)
  {
    memcpy((void *)(a1 + 24 + v10), __src, (16 - v10));
    v14 = vmlaq_s32(*(int32x4_t *)(a1 + 8), *(int32x4_t *)(a1 + 24), vdupq_n_s32(0x85EBCA77));
    *(int32x4_t *)(a1 + 8) = vmulq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_n_s32(v14, 0xDuLL), (int8x16_t)vshrq_n_u32((uint32x4_t)v14, 0x13uLL)), vdupq_n_s32(0x9E3779B1));
    v4 = (int32x4_t *)((char *)v4 + (16 - *(_DWORD *)(a1 + 40)));
    *(_DWORD *)(a1 + 40) = 0;
  }
  if (v4 <= &v13[-1])
  {
    v15 = *(int32x4_t *)(a1 + 8);
    v16 = vdupq_n_s32(0x85EBCA77);
    v17 = vdupq_n_s32(0x9E3779B1);
    do
    {
      v18 = *v4++;
      v19 = vmlaq_s32(v15, v18, v16);
      v15 = vmulq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_n_s32(v19, 0xDuLL), (int8x16_t)vshrq_n_u32((uint32x4_t)v19, 0x13uLL)), v17);
    }
    while (v4 <= &v13[-1]);
    *(int32x4_t *)(a1 + 8) = v15;
  }
  if (v4 < v13)
  {
    v11 = (char *)v13 - (char *)v4;
    memcpy((void *)(a1 + 24), v4, v11);
    goto LABEL_19;
  }
  return 0;
}

uint64_t XXH32_digest(uint64_t a1)
{
  int v1;

  if (*(_DWORD *)(a1 + 4))
    v1 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(*(uint32x4_t *)(a1 + 8), (uint32x4_t)xmmword_1D400B710), (int8x16_t)vshlq_u32(*(uint32x4_t *)(a1 + 8), (uint32x4_t)xmmword_1D400B700)));
  else
    v1 = *(_DWORD *)(a1 + 16) + 374761393;
  return XXH32_finalize(*(_DWORD *)a1 + v1, (int *)(a1 + 24), *(_DWORD *)(a1 + 40));
}

uint64_t XXH32_finalize(unsigned int a1, int *a2, char a3)
{
  unint64_t v3;
  int v4;
  unint64_t v5;
  int v6;
  unint64_t v7;
  unsigned int v8;

  v3 = a3 & 0xF;
  if (v3 >= 4)
  {
    do
    {
      v4 = *a2++;
      HIDWORD(v5) = a1 - 1028477379 * v4;
      LODWORD(v5) = HIDWORD(v5);
      a1 = 668265263 * (v5 >> 15);
      v3 -= 4;
    }
    while (v3 > 3);
  }
  for (; v3; --v3)
  {
    v6 = *(unsigned __int8 *)a2;
    a2 = (int *)((char *)a2 + 1);
    HIDWORD(v7) = a1 + 374761393 * v6;
    LODWORD(v7) = HIDWORD(v7);
    a1 = -1640531535 * (v7 >> 21);
  }
  v8 = -1028477379 * ((-2048144777 * (a1 ^ (a1 >> 15))) ^ ((-2048144777 * (a1 ^ (a1 >> 15))) >> 13));
  return v8 ^ HIWORD(v8);
}

_DWORD *XXH32_canonicalFromHash(_DWORD *result, unsigned int a2)
{
  *result = bswap32(a2);
  return result;
}

uint64_t XXH32_hashFromCanonical(unsigned int *a1)
{
  return bswap32(*a1);
}

unint64_t XXH64(uint64_t *a1, unint64_t a2, unint64_t a3)
{
  uint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;

  v4 = a1;
  if ((a1 & 7) == 0)
  {
    if (a2 >= 0x20)
    {
      v13 = (unint64_t)a1 + a2 - 32;
      v6 = a3 + 0x60EA27EEADC0B5D6;
      v7 = a3 - 0x3D4D51C2D82B14B1;
      v8 = a3 + 0x61C8864E7A143579;
      do
      {
        v9 = __ROR8__(v6 - 0x3D4D51C2D82B14B1 * *v4, 33);
        v6 = 0x9E3779B185EBCA87 * v9;
        v10 = __ROR8__(v7 - 0x3D4D51C2D82B14B1 * v4[1], 33);
        v7 = 0x9E3779B185EBCA87 * v10;
        v11 = __ROR8__(a3 - 0x3D4D51C2D82B14B1 * v4[2], 33);
        a3 = 0x9E3779B185EBCA87 * v11;
        v12 = __ROR8__(v8 - 0x3D4D51C2D82B14B1 * v4[3], 33);
        v8 = 0x9E3779B185EBCA87 * v12;
        v4 += 4;
      }
      while ((unint64_t)v4 <= v13);
      goto LABEL_9;
    }
LABEL_10:
    v14 = a3 + 0x27D4EB2F165667C5;
    return XXH64_finalize(v14 + a2, v4, a2);
  }
  if (a2 < 0x20)
    goto LABEL_10;
  v5 = (unint64_t)a1 + a2 - 32;
  v6 = a3 + 0x60EA27EEADC0B5D6;
  v7 = a3 - 0x3D4D51C2D82B14B1;
  v8 = a3 + 0x61C8864E7A143579;
  do
  {
    v9 = __ROR8__(v6 - 0x3D4D51C2D82B14B1 * *v4, 33);
    v6 = 0x9E3779B185EBCA87 * v9;
    v10 = __ROR8__(v7 - 0x3D4D51C2D82B14B1 * v4[1], 33);
    v7 = 0x9E3779B185EBCA87 * v10;
    v11 = __ROR8__(a3 - 0x3D4D51C2D82B14B1 * v4[2], 33);
    a3 = 0x9E3779B185EBCA87 * v11;
    v12 = __ROR8__(v8 - 0x3D4D51C2D82B14B1 * v4[3], 33);
    v8 = 0x9E3779B185EBCA87 * v12;
    v4 += 4;
  }
  while ((unint64_t)v4 <= v5);
LABEL_9:
  v14 = 0x9E3779B185EBCA87
      * ((0x9E3779B185EBCA87
        * ((0x9E3779B185EBCA87
          * ((0x9E3779B185EBCA87
            * ((__ROR8__(v7, 57) + __ROR8__(v6, 63) + __ROR8__(a3, 52) + __ROR8__(v8, 46)) ^ (0x9E3779B185EBCA87
                                                                                            * __ROR8__(0xDEF35B010F796CA9* v9, 33)))- 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87 * __ROR8__(0xDEF35B010F796CA9 * v10, 33)))- 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87 * __ROR8__(0xDEF35B010F796CA9 * v11, 33)))- 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87 * __ROR8__(0xDEF35B010F796CA9 * v12, 33)))- 0x7A1435883D4D519DLL;
  return XXH64_finalize(v14 + a2, v4, a2);
}

void *XXH64_createState()
{
  return malloc_type_malloc(0x58uLL, 0x7DE129A8uLL);
}

uint64_t XXH64_freeState(void *a1)
{
  free(a1);
  return 0;
}

__n128 XXH64_copyState(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t XXH64_reset(uint64_t a1, unint64_t a2)
{
  __int128 v3;
  __int128 v4;

  *(_QWORD *)a1 = 0;
  *(int64x2_t *)(a1 + 8) = vaddq_s64(vdupq_n_s64(a2), (int64x2_t)xmmword_1D400B720);
  *(_QWORD *)(a1 + 24) = a2;
  *(_QWORD *)(a1 + 32) = a2 + 0x61C8864E7A143579;
  *(_OWORD *)(a1 + 40) = v3;
  *(_OWORD *)(a1 + 56) = v4;
  *(_QWORD *)(a1 + 72) = 0;
  return 0;
}

uint64_t XXH64_update(uint64_t a1, char *__src, size_t __n)
{
  int v3;
  char *v4;
  uint64_t v6;
  size_t v7;
  uint64_t result;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;

  if (!__src)
    return 1;
  v3 = __n;
  v4 = __src;
  *(_QWORD *)a1 += __n;
  v6 = *(unsigned int *)(a1 + 72);
  if (v6 + __n <= 0x1F)
  {
    memcpy((void *)(a1 + v6 + 40), __src, __n);
    LODWORD(v7) = *(_DWORD *)(a1 + 72) + v3;
LABEL_13:
    result = 0;
    *(_DWORD *)(a1 + 72) = v7;
    return result;
  }
  v9 = &__src[__n];
  if ((_DWORD)v6)
  {
    memcpy((void *)(a1 + 40 + v6), __src, (32 - v6));
    v10 = __ROR8__(*(_QWORD *)(a1 + 16) - 0x3D4D51C2D82B14B1 * *(_QWORD *)(a1 + 48), 33);
    *(_QWORD *)(a1 + 8) = 0x9E3779B185EBCA87
                        * __ROR8__(*(_QWORD *)(a1 + 8) - 0x3D4D51C2D82B14B1 * *(_QWORD *)(a1 + 40), 33);
    *(_QWORD *)(a1 + 16) = 0x9E3779B185EBCA87 * v10;
    v11 = 0x9E3779B185EBCA87 * __ROR8__(*(_QWORD *)(a1 + 32) - 0x3D4D51C2D82B14B1 * *(_QWORD *)(a1 + 64), 33);
    *(_QWORD *)(a1 + 24) = 0x9E3779B185EBCA87
                         * __ROR8__(*(_QWORD *)(a1 + 24) - 0x3D4D51C2D82B14B1 * *(_QWORD *)(a1 + 56), 33);
    *(_QWORD *)(a1 + 32) = v11;
    v4 += (32 - *(_DWORD *)(a1 + 72));
    *(_DWORD *)(a1 + 72) = 0;
  }
  if (v4 + 32 <= v9)
  {
    v12 = *(_QWORD *)(a1 + 8);
    v13 = *(_QWORD *)(a1 + 16);
    v15 = *(_QWORD *)(a1 + 24);
    v14 = *(_QWORD *)(a1 + 32);
    do
    {
      v12 = 0x9E3779B185EBCA87 * __ROR8__(v12 - 0x3D4D51C2D82B14B1 * *(_QWORD *)v4, 33);
      v13 = 0x9E3779B185EBCA87 * __ROR8__(v13 - 0x3D4D51C2D82B14B1 * *((_QWORD *)v4 + 1), 33);
      v15 = 0x9E3779B185EBCA87 * __ROR8__(v15 - 0x3D4D51C2D82B14B1 * *((_QWORD *)v4 + 2), 33);
      v14 = 0x9E3779B185EBCA87 * __ROR8__(v14 - 0x3D4D51C2D82B14B1 * *((_QWORD *)v4 + 3), 33);
      v4 += 32;
    }
    while (v4 <= v9 - 32);
    *(_QWORD *)(a1 + 8) = v12;
    *(_QWORD *)(a1 + 16) = v13;
    *(_QWORD *)(a1 + 24) = v15;
    *(_QWORD *)(a1 + 32) = v14;
  }
  if (v4 < v9)
  {
    v7 = v9 - v4;
    memcpy((void *)(a1 + 40), v4, v7);
    goto LABEL_13;
  }
  return 0;
}

unint64_t XXH64_digest(_QWORD *a1)
{
  uint64_t v1;

  if (*a1 < 0x20uLL)
    v1 = a1[3] + 0x27D4EB2F165667C5;
  else
    v1 = 0x9E3779B185EBCA87
       * ((0x9E3779B185EBCA87
         * ((0x9E3779B185EBCA87
           * ((0x9E3779B185EBCA87
             * ((__ROR8__(a1[2], 57) + __ROR8__(a1[1], 63) + __ROR8__(a1[3], 52) + __ROR8__(a1[4], 46)) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * a1[1], 33)))
             - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * a1[2], 33)))
           - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * a1[3], 33)))
         - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * a1[4], 33)))
       - 0x7A1435883D4D519DLL;
  return XXH64_finalize(v1 + *a1, a1 + 5, *a1);
}

unint64_t XXH64_finalize(unint64_t a1, uint64_t *a2, char a3)
{
  unint64_t v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  unint64_t v7;

  v3 = a3 & 0x1F;
  if (v3 >= 8)
  {
    do
    {
      v4 = *a2++;
      a1 = 0x85EBCA77C2B2AE63
         - 0x61C8864E7A143579 * __ROR8__((0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v4, 33)) ^ a1, 37);
      v3 -= 8;
    }
    while (v3 > 7);
  }
  if (v3 >= 4)
  {
    v5 = *(_DWORD *)a2;
    a2 = (uint64_t *)((char *)a2 + 4);
    a1 = 0x165667B19E3779F9 - 0x3D4D51C2D82B14B1 * __ROR8__((0x9E3779B185EBCA87 * v5) ^ a1, 41);
    v3 -= 4;
  }
  for (; v3; --v3)
  {
    v6 = *(unsigned __int8 *)a2;
    a2 = (uint64_t *)((char *)a2 + 1);
    a1 = 0x9E3779B185EBCA87 * __ROR8__((0x27D4EB2F165667C5 * v6) ^ a1, 53);
  }
  v7 = 0x165667B19E3779F9
     * ((0xC2B2AE3D27D4EB4FLL * (a1 ^ (a1 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (a1 ^ (a1 >> 33))) >> 29));
  return v7 ^ HIDWORD(v7);
}

_QWORD *XXH64_canonicalFromHash(_QWORD *result, unint64_t a2)
{
  *result = bswap64(a2);
  return result;
}

unint64_t XXH64_hashFromCanonical(unint64_t *a1)
{
  return bswap64(*a1);
}

unint64_t XXH3_64bits(int8x16_t *a1, unint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  int8x16_t v4;
  uint64_t v5;
  int8x16_t v6;
  int8x16_t v7;
  uint64_t v8;
  int8x16_t v9;
  int8x16_t v10;
  uint64_t v11;
  int8x16_t v12;
  int8x16_t v13;
  uint64_t v14;
  int8x16_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;

  if (a2 > 0x10)
  {
    if (a2 <= 0x80)
    {
      v3 = 0x9E3779B185EBCA87 * a2;
      if (a2 >= 0x21)
      {
        if (a2 >= 0x41)
        {
          if (a2 >= 0x61)
          {
            v4 = veorq_s8(a1[3], (int8x16_t)xmmword_1D400B730);
            v5 = ((v4.u64[1] * (unsigned __int128)v4.u64[0]) >> 64) ^ (v4.i64[1] * v4.i64[0]);
            v6 = veorq_s8(*(int8x16_t *)((char *)&a1[-4] + a2), (int8x16_t)xmmword_1D400B740);
            v3 += v5 + (((v6.u64[1] * (unsigned __int128)v6.u64[0]) >> 64) ^ (v6.i64[1] * v6.i64[0]));
          }
          v7 = veorq_s8(a1[2], (int8x16_t)xmmword_1D400B750);
          v8 = ((v7.u64[1] * (unsigned __int128)v7.u64[0]) >> 64) ^ (v7.i64[1] * v7.i64[0]);
          v9 = veorq_s8(*(int8x16_t *)((char *)&a1[-3] + a2), (int8x16_t)xmmword_1D400B760);
          v3 += v8 + (((v9.u64[1] * (unsigned __int128)v9.u64[0]) >> 64) ^ (v9.i64[1] * v9.i64[0]));
        }
        v10 = veorq_s8(a1[1], (int8x16_t)xmmword_1D400B770);
        v11 = ((v10.u64[1] * (unsigned __int128)v10.u64[0]) >> 64) ^ (v10.i64[1] * v10.i64[0]);
        v12 = veorq_s8(*(int8x16_t *)((char *)&a1[-2] + a2), (int8x16_t)xmmword_1D400B780);
        v3 += v11 + (((v12.u64[1] * (unsigned __int128)v12.u64[0]) >> 64) ^ (v12.i64[1] * v12.i64[0]));
      }
      v13 = veorq_s8(*a1, (int8x16_t)xmmword_1D400B790);
      v14 = v3 + (((v13.u64[1] * (unsigned __int128)v13.u64[0]) >> 64) ^ (v13.i64[1] * v13.i64[0]));
      v15 = veorq_s8(*(int8x16_t *)((char *)&a1[-1] + a2), (int8x16_t)xmmword_1D400B7A0);
      v2 = v14 + (((v15.u64[1] * (unsigned __int128)v15.u64[0]) >> 64) ^ (v15.i64[1] * v15.i64[0]));
      return (0x165667B19E3779F9 * (v2 ^ (v2 >> 37))) ^ ((0x165667B19E3779F9 * (v2 ^ (v2 >> 37))) >> 32);
    }
    if (a2 > 0xF0)
      return XXH3_hashLong_64b_defaultSecret((uint64_t)a1, a2);
    else
      return XXH3_len_129to240_64b((uint64_t)a1, a2, (uint64_t)&kSecret, 0);
  }
  else
  {
    if (a2 >= 9)
    {
      v2 = (a1->i64[0] ^ 0xBE4BA423396CFEB8)
         + a2
         + (*(uint64_t *)((char *)&a1->i64[-1] + a2) ^ 0x1CAD21F72C81017CLL)
         + ((((*(uint64_t *)((char *)&a1->i64[-1] + a2) ^ 0x1CAD21F72C81017CuLL)
            * (unsigned __int128)(a1->i64[0] ^ 0xBE4BA423396CFEB8)) >> 64) ^ ((*(uint64_t *)((char *)&a1->i64[-1] + a2) ^ 0x1CAD21F72C81017CLL)
                                                                              * (a1->i64[0] ^ 0xBE4BA423396CFEB8)));
      return (0x165667B19E3779F9 * (v2 ^ (v2 >> 37))) ^ ((0x165667B19E3779F9 * (v2 ^ (v2 >> 37))) >> 32);
    }
    if (a2 >= 4)
    {
      v16 = (a1->u32[0] | ((unint64_t)*(unsigned int *)((char *)&a1->u32[-1] + a2) << 32)) ^ 0xBE4BA423396CFEB8;
      v17 = (a2 + 2654435761u * (v16 ^ (v16 >> 51))) ^ ((a2 + 2654435761u * (v16 ^ (v16 >> 51))) >> 47);
      v18 = 0xC2B2AE3D27D4EB4FLL;
LABEL_18:
      v2 = v17 * v18;
      return (0x165667B19E3779F9 * (v2 ^ (v2 >> 37))) ^ ((0x165667B19E3779F9 * (v2 ^ (v2 >> 37))) >> 32);
    }
    if (a2)
    {
      v17 = (((_DWORD)a2 << 24) | (unint64_t)a1->u8[0] | ((unint64_t)a1->u8[a2 >> 1] << 8) | ((unint64_t)a1->u8[a2 - 1] << 16)) ^ 0x396CFEB8;
      v18 = 0x9E3779B185EBCA87;
      goto LABEL_18;
    }
    return 0;
  }
}

unint64_t XXH3_len_129to240_64b(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  int64x2_t v5;
  int64x2_t v6;
  const double *v7;
  const double *v8;
  int8x16_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  float64x2x2_t v22;
  float64x2x2_t v23;

  v4 = 0;
  v5 = (int64x2_t)(0x9E3779B185EBCA87 * a2);
  v6 = vdupq_n_s64(a4);
  do
  {
    v7 = (const double *)(a1 + v4);
    v22 = vld2q_f64(v7);
    v8 = (const double *)(a3 + v4);
    v23 = vld2q_f64(v8);
    v9 = veorq_s8((int8x16_t)vaddq_s64((int64x2_t)v23.val[0], v6), (int8x16_t)v22.val[0]);
    v22.val[0] = (float64x2_t)veorq_s8((int8x16_t)vsubq_s64((int64x2_t)v23.val[1], v6), (int8x16_t)v22.val[1]);
    *(_QWORD *)&v22.val[1].f64[0] = ((*(unint64_t *)&v22.val[0].f64[0] * (unsigned __int128)v9.u64[0]) >> 64) ^ (*(_QWORD *)&v22.val[0].f64[0] * v9.i64[0]);
    *(_QWORD *)&v22.val[1].f64[1] = ((*(unint64_t *)&v22.val[0].f64[1] * (unsigned __int128)v9.u64[1]) >> 64) ^ (*(_QWORD *)&v22.val[0].f64[1] * v9.i64[1]);
    v5 = vaddq_s64(v5, (int64x2_t)v22.val[1]);
    v4 += 32;
  }
  while (v4 != 128);
  v10 = vaddvq_s64(v5);
  v11 = (0x165667B19E3779F9 * (v10 ^ (v10 >> 37))) ^ ((0x165667B19E3779F9 * (v10 ^ (v10 >> 37))) >> 32);
  if (a2 >= 0x90)
  {
    v12 = (uint64_t *)(a3 + 11);
    v13 = (_QWORD *)(a1 + 136);
    v14 = (a2 >> 4) - 8;
    do
    {
      v15 = (*(v12 - 1) + a4) ^ *(v13 - 1);
      v16 = *v12;
      v12 += 2;
      v11 += ((((v16 - a4) ^ *v13) * (unsigned __int128)v15) >> 64) ^ (((v16 - a4) ^ *v13) * v15);
      v13 += 2;
      --v14;
    }
    while (v14);
  }
  v17 = (*(_QWORD *)(a3 + 119) + a4) ^ *(_QWORD *)(a1 + a2 - 16);
  v18 = (*(_QWORD *)(a3 + 127) - a4) ^ *(_QWORD *)(a1 + a2 - 8);
  v19 = ((v18 * (unsigned __int128)v17) >> 64) ^ (v18 * v17);
  v20 = 0x165667B19E3779F9 * ((v11 + v19) ^ ((v11 + v19) >> 37));
  return v20 ^ HIDWORD(v20);
}

unint64_t XXH3_hashLong_64b_defaultSecret(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint32x2_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t i;
  int64x2_t v9;
  int64x2_t v10;
  uint64_t j;
  int8x16_t v12;
  int8x16_t v13;
  const float *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t k;
  int64x2_t v20;
  int64x2_t v21;
  uint64_t m;
  int64x2_t v23;
  int64x2_t v24;
  int8x16_t v26[4];
  uint64_t v27;
  float32x2x2_t v28;

  v27 = *MEMORY[0x1E0C80C00];
  v26[0] = (int8x16_t)xmmword_1D400B8C0;
  v26[1] = (int8x16_t)unk_1D400B8D0;
  v26[2] = (int8x16_t)xmmword_1D400B8E0;
  v26[3] = (int8x16_t)unk_1D400B8F0;
  if (a2 >= 0x400)
  {
    v2 = 0;
    v3 = (uint32x2_t)vdup_n_s32(0x9E3779B1);
    v4 = a1;
    do
    {
      v5 = 0;
      v6 = v4;
      v7 = (char *)&kSecret;
      do
      {
        for (i = 0; i != 4; ++i)
        {
          v9 = *(int64x2_t *)(v6 + i * 16);
          v10 = (int64x2_t)veorq_s8(*(int8x16_t *)&v7[i * 16], (int8x16_t)v9);
          v26[i] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v26[i], v9), (uint32x2_t)vmovn_s64(v10), (uint32x2_t)vshrn_n_s64(v10, 0x20uLL));
        }
        ++v5;
        v7 += 8;
        v6 += 64;
      }
      while (v5 != 16);
      for (j = 0; j != 4; ++j)
      {
        v12 = v26[j];
        v13 = veorq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v12, 0x2FuLL), v12);
        v14 = (const float *)((char *)&kSecret + j * 16 + 128);
        v28 = vld2_f32(v14);
        v26[j] = (int8x16_t)vmlal_u32((uint64x2_t)vshlq_n_s64((int64x2_t)vmull_u32((uint32x2_t)veor_s8((int8x8_t)v28.val[1], (int8x8_t)vzip2_s32(*(int32x2_t *)v12.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v12, v12, 8uLL))), v3), 0x20uLL), (uint32x2_t)veor_s8((int8x8_t)v28.val[0], (int8x8_t)vzip1_s32(*(int32x2_t *)v13.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v13, v13, 8uLL))), v3);
      }
      ++v2;
      v4 += 1024;
    }
    while (v2 != a2 >> 10);
  }
  v15 = (a2 >> 6) & 0xF;
  if (v15)
  {
    v16 = 0;
    v17 = a1 + (a2 & 0xFFFFFFFFFFFFFC00);
    v18 = (char *)&kSecret;
    do
    {
      for (k = 0; k != 4; ++k)
      {
        v20 = *(int64x2_t *)(v17 + k * 16);
        v21 = (int64x2_t)veorq_s8(*(int8x16_t *)&v18[k * 16], (int8x16_t)v20);
        v26[k] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v26[k], v20), (uint32x2_t)vmovn_s64(v21), (uint32x2_t)vshrn_n_s64(v21, 0x20uLL));
      }
      ++v16;
      v18 += 8;
      v17 += 64;
    }
    while (v16 != v15);
  }
  if ((a2 & 0x3F) != 0)
  {
    for (m = 0; m != 4; ++m)
    {
      v23 = *(int64x2_t *)(a1 + a2 - 64 + m * 16);
      v24 = (int64x2_t)veorq_s8(*(int8x16_t *)((char *)&kSecret + m * 16 + 121), (int8x16_t)v23);
      v26[m] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v26[m], v23), (uint32x2_t)vmovn_s64(v24), (uint32x2_t)vshrn_n_s64(v24, 0x20uLL));
    }
  }
  return XXH3_mergeAccs(v26, xmmword_1D400B80B, 0x9E3779B185EBCA87 * a2);
}

unint64_t XXH3_64bits_withSecret(int8x16_t *a1, unint64_t a2, int8x16_t *a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int8x16_t v7;
  uint64_t v8;
  int8x16_t v9;
  int8x16_t v10;
  uint64_t v11;
  int8x16_t v12;
  int8x16_t v13;
  uint64_t v14;
  int8x16_t v15;
  int8x16_t v16;
  uint64_t v17;
  int8x16_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;

  if (a2 > 0x10)
  {
    if (a2 <= 0x80)
    {
      v6 = 0x9E3779B185EBCA87 * a2;
      if (a2 >= 0x21)
      {
        if (a2 >= 0x41)
        {
          if (a2 >= 0x61)
          {
            v7 = veorq_s8(a3[6], a1[3]);
            v8 = ((v7.u64[1] * (unsigned __int128)v7.u64[0]) >> 64) ^ (v7.i64[1] * v7.i64[0]);
            v9 = veorq_s8(a3[7], *(int8x16_t *)((char *)&a1[-4] + a2));
            v6 += v8 + (((v9.u64[1] * (unsigned __int128)v9.u64[0]) >> 64) ^ (v9.i64[1] * v9.i64[0]));
          }
          v10 = veorq_s8(a3[4], a1[2]);
          v11 = ((v10.u64[1] * (unsigned __int128)v10.u64[0]) >> 64) ^ (v10.i64[1] * v10.i64[0]);
          v12 = veorq_s8(a3[5], *(int8x16_t *)((char *)&a1[-3] + a2));
          v6 += v11 + (((v12.u64[1] * (unsigned __int128)v12.u64[0]) >> 64) ^ (v12.i64[1] * v12.i64[0]));
        }
        v13 = veorq_s8(a3[2], a1[1]);
        v14 = ((v13.u64[1] * (unsigned __int128)v13.u64[0]) >> 64) ^ (v13.i64[1] * v13.i64[0]);
        v15 = veorq_s8(a3[3], *(int8x16_t *)((char *)&a1[-2] + a2));
        v6 += v14 + (((v15.u64[1] * (unsigned __int128)v15.u64[0]) >> 64) ^ (v15.i64[1] * v15.i64[0]));
      }
      v16 = veorq_s8(*a3, *a1);
      v17 = v6 + (((v16.u64[1] * (unsigned __int128)v16.u64[0]) >> 64) ^ (v16.i64[1] * v16.i64[0]));
      v18 = veorq_s8(a3[1], *(int8x16_t *)((char *)&a1[-1] + a2));
      v5 = v17 + (((v18.u64[1] * (unsigned __int128)v18.u64[0]) >> 64) ^ (v18.i64[1] * v18.i64[0]));
      return (0x165667B19E3779F9 * (v5 ^ (v5 >> 37))) ^ ((0x165667B19E3779F9 * (v5 ^ (v5 >> 37))) >> 32);
    }
    if (a2 > 0xF0)
      return XXH3_hashLong_64b_withSecret((uint64_t)a1, a2, (uint64_t)a3, a4);
    else
      return XXH3_len_129to240_64b((uint64_t)a1, a2, (uint64_t)a3, 0);
  }
  else
  {
    if (a2 >= 9)
    {
      v4 = a3->i64[1] ^ *(uint64_t *)((char *)&a1->i64[-1] + a2);
      v5 = (a3->i64[0] ^ a1->i64[0])
         + a2
         + v4
         + ((((unint64_t)v4 * (unsigned __int128)(unint64_t)(a3->i64[0] ^ a1->i64[0])) >> 64) ^ (v4 * (a3->i64[0] ^ a1->i64[0])));
      return (0x165667B19E3779F9 * (v5 ^ (v5 >> 37))) ^ ((0x165667B19E3779F9 * (v5 ^ (v5 >> 37))) >> 32);
    }
    if (a2 >= 4)
    {
      v19 = (a1->u32[0] | ((unint64_t)*(unsigned int *)((char *)&a1->u32[-1] + a2) << 32)) ^ a3->i64[0];
      v20 = (a2 + 2654435761u * (v19 ^ (v19 >> 51))) ^ ((a2 + 2654435761u * (v19 ^ (v19 >> 51))) >> 47);
      v21 = 0xC2B2AE3D27D4EB4FLL;
LABEL_18:
      v5 = v20 * v21;
      return (0x165667B19E3779F9 * (v5 ^ (v5 >> 37))) ^ ((0x165667B19E3779F9 * (v5 ^ (v5 >> 37))) >> 32);
    }
    if (a2)
    {
      v20 = (((_DWORD)a2 << 24) | (unint64_t)a1->u8[0] | ((unint64_t)a1->u8[a2 >> 1] << 8) | ((unint64_t)a1->u8[a2 - 1] << 16)) ^ a3->u32[0];
      v21 = 0x9E3779B185EBCA87;
      goto LABEL_18;
    }
    return 0;
  }
}

unint64_t XXH3_hashLong_64b_withSecret(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint32x2_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  int64x2_t v15;
  int64x2_t v16;
  uint64_t j;
  int8x16_t v18;
  int8x16_t v19;
  const float *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int64x2_t v29;
  int64x2_t v30;
  uint64_t k;
  int64x2_t v32;
  int64x2_t v33;
  int8x16_t v35[4];
  uint64_t v36;
  float32x2x2_t v37;

  v36 = *MEMORY[0x1E0C80C00];
  v35[0] = (int8x16_t)xmmword_1D400B8C0;
  v35[1] = (int8x16_t)unk_1D400B8D0;
  v35[2] = (int8x16_t)xmmword_1D400B8E0;
  v35[3] = (int8x16_t)unk_1D400B8F0;
  v4 = (unint64_t)(a4 - 64) >> 3;
  v5 = v4 << 6;
  v6 = a2 / (v4 << 6);
  if (v4 << 6 <= a2)
  {
    v7 = 0;
    if (v4 <= 1)
      v4 = 1;
    if (v6 <= 1)
      v8 = 1;
    else
      v8 = v6;
    v9 = (uint32x2_t)vdup_n_s32(0x9E3779B1);
    v10 = a1;
    do
    {
      if ((unint64_t)(a4 - 64) >= 8)
      {
        v11 = 0;
        v12 = v10;
        v13 = a3;
        do
        {
          for (i = 0; i != 4; ++i)
          {
            v15 = *(int64x2_t *)(v12 + i * 16);
            v16 = (int64x2_t)veorq_s8(*(int8x16_t *)(v13 + i * 16), (int8x16_t)v15);
            v35[i] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v35[i], v15), (uint32x2_t)vmovn_s64(v16), (uint32x2_t)vshrn_n_s64(v16, 0x20uLL));
          }
          ++v11;
          v13 += 8;
          v12 += 64;
        }
        while (v11 != v4);
      }
      for (j = 0; j != 4; ++j)
      {
        v18 = v35[j];
        v19 = veorq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v18, 0x2FuLL), v18);
        v20 = (const float *)(a3 + a4 - 64 + j * 16);
        v37 = vld2_f32(v20);
        v35[j] = (int8x16_t)vmlal_u32((uint64x2_t)vshlq_n_s64((int64x2_t)vmull_u32((uint32x2_t)veor_s8((int8x8_t)v37.val[1], (int8x8_t)vzip2_s32(*(int32x2_t *)v18.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v18, v18, 8uLL))), v9), 0x20uLL), (uint32x2_t)veor_s8((int8x8_t)v37.val[0], (int8x8_t)vzip1_s32(*(int32x2_t *)v19.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v19, v19, 8uLL))), v9);
      }
      ++v7;
      v10 += v5;
    }
    while (v7 != v8);
  }
  v21 = v6 * v5;
  v22 = a2 - v21;
  if (a2 - v21 >= 0x40)
  {
    v23 = 0;
    v24 = a1 + v21;
    v25 = v22 >> 6;
    if (v25 <= 1)
      v25 = 1;
    v26 = a3;
    do
    {
      v27 = 0;
      v28 = 0;
      do
      {
        v29 = *(int64x2_t *)(v24 + (v23 << 6) + 16 * v28);
        v30 = (int64x2_t)veorq_s8(*(int8x16_t *)(v26 + v27 * 16), (int8x16_t)v29);
        v35[v27] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v35[v27], v29), (uint32x2_t)vmovn_s64(v30), (uint32x2_t)vshrn_n_s64(v30, 0x20uLL));
        ++v28;
        ++v27;
      }
      while (v27 != 4);
      ++v23;
      v26 += 8;
    }
    while (v23 != v25);
  }
  if ((a2 & 0x3F) != 0)
  {
    for (k = 0; k != 4; ++k)
    {
      v32 = *(int64x2_t *)(a1 + a2 - 64 + k * 16);
      v33 = (int64x2_t)veorq_s8(*(int8x16_t *)(a3 + a4 - 71 + k * 16), (int8x16_t)v32);
      v35[k] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v35[k], v32), (uint32x2_t)vmovn_s64(v33), (uint32x2_t)vshrn_n_s64(v33, 0x20uLL));
    }
  }
  return XXH3_mergeAccs(v35, (int8x16_t *)(a3 + 11), 0x9E3779B185EBCA87 * a2);
}

unint64_t XXH3_64bits_withSeed(_QWORD *a1, unint64_t a2, unint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;

  if (a2 > 0x10)
  {
    if (a2 <= 0x80)
    {
      v5 = 0x9E3779B185EBCA87 * a2;
      if (a2 >= 0x21)
      {
        if (a2 >= 0x41)
        {
          if (a2 >= 0x61)
          {
            v6 = *(_QWORD *)((char *)a1 + a2 - 64) ^ (a3 + 0x3159B4CD4BE0518ALL);
            v7 = *(_QWORD *)((char *)a1 + a2 - 56) ^ (0x647378D9C97E9FC8 - a3);
            v5 += ((((a1[7] ^ (0x1D4F0BC7C7BBDCF9 - a3)) * (unsigned __int128)(a1[6] ^ (a3 + 0x3F349CE33F76FAA8))) >> 64) ^ ((a1[7] ^ (0x1D4F0BC7C7BBDCF9 - a3)) * (a1[6] ^ (a3 + 0x3F349CE33F76FAA8))))
                + ((((unint64_t)v7 * (unsigned __int128)(unint64_t)v6) >> 64) ^ (v7 * v6));
          }
          v8 = *(_QWORD *)((char *)a1 + a2 - 48) ^ (a3 + 0x4EF90DA297486471);
          v9 = *(_QWORD *)((char *)a1 + a2 - 40) ^ (0xD8ACDEA946EF1938 - a3);
          v5 += ((((a1[5] ^ (0xA32E531B8B65D088 - a3)) * (unsigned __int128)(a1[4] ^ (a3 - 0x34FF3C6E44ADD7C4))) >> 64) ^ ((a1[5] ^ (0xA32E531B8B65D088 - a3)) * (a1[4] ^ (a3 - 0x34FF3C6E44ADD7C4))))
              + (((v9 * (unsigned __int128)(unint64_t)v8) >> 64) ^ (v9 * v8));
        }
        v10 = *(_QWORD *)((char *)a1 + a2 - 32) ^ (a3 - 0x71DBBC088BB9F748);
        v11 = *(_QWORD *)((char *)a1 + a2 - 24) ^ (0x4C263A81E69035E0 - a3);
        v5 += ((((a1[3] ^ (0x2172FFCC7DD05A82 - a3)) * (unsigned __int128)(a1[2] ^ (a3 + 0x78E5C0CC4EE679CBLL))) >> 64) ^ ((a1[3] ^ (0x2172FFCC7DD05A82 - a3)) * (a1[2] ^ (a3 + 0x78E5C0CC4EE679CBLL))))
            + ((((unint64_t)v11 * (unsigned __int128)(unint64_t)v10) >> 64) ^ (v11 * v10));
      }
      v12 = *(_QWORD *)((char *)a1 + a2 - 16) ^ (a3 - 0x24686F7C16922B22);
      v13 = *(_QWORD *)((char *)a1 + a2 - 8) ^ (0x1F67B3B7A4A44072 - a3);
      v4 = v5
         + ((((a1[1] ^ (0x1CAD21F72C81017CLL - a3)) * (unsigned __int128)(*a1 ^ (a3 - 0x41B45BDCC6930148))) >> 64) ^ ((a1[1] ^ (0x1CAD21F72C81017CLL - a3)) * (*a1 ^ (a3 - 0x41B45BDCC6930148))))
         + ((((unint64_t)v13 * (unsigned __int128)(unint64_t)v12) >> 64) ^ (v13 * v12));
      return (0x165667B19E3779F9 * (v4 ^ (v4 >> 37))) ^ ((0x165667B19E3779F9 * (v4 ^ (v4 >> 37))) >> 32);
    }
    if (a2 > 0xF0)
      return XXH3_hashLong_64b_withSeed((uint64_t)a1, a2, a3);
    else
      return XXH3_len_129to240_64b((uint64_t)a1, a2, (uint64_t)&kSecret, a3);
  }
  else
  {
    if (a2 >= 9)
    {
      v3 = *(_QWORD *)((char *)a1 + a2 - 8) ^ (0x1CAD21F72C81017CLL - a3);
      v4 = (*a1 ^ (a3 - 0x41B45BDCC6930148))
         + a2
         + v3
         + ((((unint64_t)v3 * (unsigned __int128)(*a1 ^ (a3 - 0x41B45BDCC6930148))) >> 64) ^ (v3 * (*a1 ^ (a3 - 0x41B45BDCC6930148))));
      return (0x165667B19E3779F9 * (v4 ^ (v4 >> 37))) ^ ((0x165667B19E3779F9 * (v4 ^ (v4 >> 37))) >> 32);
    }
    if (a2 >= 4)
    {
      v14 = (*(unsigned int *)a1 | ((unint64_t)*(unsigned int *)((char *)a1 + a2 - 4) << 32)) ^ (a3 - 0x41B45BDCC6930148);
      v15 = (a2 + 2654435761u * (v14 ^ (v14 >> 51))) ^ ((a2 + 2654435761u * (v14 ^ (v14 >> 51))) >> 47);
      v16 = 0xC2B2AE3D27D4EB4FLL;
LABEL_18:
      v4 = v15 * v16;
      return (0x165667B19E3779F9 * (v4 ^ (v4 >> 37))) ^ ((0x165667B19E3779F9 * (v4 ^ (v4 >> 37))) >> 32);
    }
    if (a2)
    {
      v15 = (((_DWORD)a2 << 24) | (unint64_t)*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8) | ((unint64_t)*((unsigned __int8 *)a1 + a2 - 1) << 16)) ^ (a3 + 963444408);
      v16 = 0x9E3779B185EBCA87;
      goto LABEL_18;
    }
    return 0;
  }
}

unint64_t XXH3_hashLong_64b_withSeed(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t i;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint32x2_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t j;
  int64x2_t v13;
  int64x2_t v14;
  uint64_t k;
  int8x16_t v16;
  int8x16_t v17;
  const float *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  _BYTE *v22;
  uint64_t m;
  int64x2_t v24;
  int64x2_t v25;
  uint64_t n;
  int64x2_t v27;
  int64x2_t v28;
  _BYTE v30[11];
  int8x16_t v31[11];
  int8x16_t v32[4];
  uint64_t v33;
  float32x2x2_t v34;

  v33 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return XXH3_hashLong_64b_defaultSecret(a1, a2);
  for (i = 0; i != 192; i += 16)
  {
    v4 = &v30[i];
    v5 = *(_QWORD *)((char *)&kSecret + i + 8) - a3;
    *v4 = *(_QWORD *)((char *)&kSecret + i) + a3;
    v4[1] = v5;
  }
  v32[0] = (int8x16_t)xmmword_1D400B8C0;
  v32[1] = (int8x16_t)unk_1D400B8D0;
  v32[2] = (int8x16_t)xmmword_1D400B8E0;
  v32[3] = (int8x16_t)unk_1D400B8F0;
  if (a2 >= 0x400)
  {
    v6 = 0;
    v7 = (uint32x2_t)vdup_n_s32(0x9E3779B1);
    v8 = a1;
    do
    {
      v9 = 0;
      v10 = v30;
      v11 = v8;
      do
      {
        for (j = 0; j != 4; ++j)
        {
          v13 = *(int64x2_t *)(v11 + j * 16);
          v14 = (int64x2_t)veorq_s8(*(int8x16_t *)&v10[j * 16], (int8x16_t)v13);
          v32[j] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v32[j], v13), (uint32x2_t)vmovn_s64(v14), (uint32x2_t)vshrn_n_s64(v14, 0x20uLL));
        }
        ++v9;
        v10 += 8;
        v11 += 64;
      }
      while (v9 != 16);
      for (k = 0; k != 4; ++k)
      {
        v16 = v32[k];
        v17 = veorq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v16, 0x2FuLL), v16);
        v18 = (const float *)((char *)&v31[k + 7].i32[1] + 1);
        v34 = vld2_f32(v18);
        v32[k] = (int8x16_t)vmlal_u32((uint64x2_t)vshlq_n_s64((int64x2_t)vmull_u32((uint32x2_t)veor_s8((int8x8_t)v34.val[1], (int8x8_t)vzip2_s32(*(int32x2_t *)v16.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v16, v16, 8uLL))), v7), 0x20uLL), (uint32x2_t)veor_s8((int8x8_t)v34.val[0], (int8x8_t)vzip1_s32(*(int32x2_t *)v17.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v17, v17, 8uLL))), v7);
      }
      ++v6;
      v8 += 1024;
    }
    while (v6 != a2 >> 10);
  }
  v19 = (a2 >> 6) & 0xF;
  if (v19)
  {
    v20 = 0;
    v21 = a1 + (a2 & 0xFFFFFFFFFFFFFC00);
    v22 = v30;
    do
    {
      for (m = 0; m != 4; ++m)
      {
        v24 = *(int64x2_t *)(v21 + m * 16);
        v25 = (int64x2_t)veorq_s8(*(int8x16_t *)&v22[m * 16], (int8x16_t)v24);
        v32[m] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v32[m], v24), (uint32x2_t)vmovn_s64(v25), (uint32x2_t)vshrn_n_s64(v25, 0x20uLL));
      }
      ++v20;
      v22 += 8;
      v21 += 64;
    }
    while (v20 != v19);
  }
  if ((a2 & 0x3F) != 0)
  {
    for (n = 0; n != 4; ++n)
    {
      v27 = *(int64x2_t *)(a1 + a2 - 64 + n * 16);
      v28 = (int64x2_t)veorq_s8(*(int8x16_t *)((char *)&v31[n + 6] + 14), (int8x16_t)v27);
      v32[n] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v32[n], v27), (uint32x2_t)vmovn_s64(v28), (uint32x2_t)vshrn_n_s64(v28, 0x20uLL));
    }
  }
  return XXH3_mergeAccs(v32, v31, 0x9E3779B185EBCA87 * a2);
}

void *XXH3_createState()
{
  return malloc_type_malloc(0x240uLL, 0x7DE129A8uLL);
}

uint64_t XXH3_freeState(void *a1)
{
  free(a1);
  return 0;
}

void *XXH3_copyState(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x240uLL);
}

uint64_t XXH3_64bits_reset(_OWORD *a1)
{
  uint64_t result;

  if (!a1)
    return 1;
  bzero(a1, 0x240uLL);
  result = 0;
  *a1 = xmmword_1D400B7B0;
  a1[1] = xmmword_1D400B7C0;
  *((_QWORD *)a1 + 70) = &kSecret;
  *((_DWORD *)a1 + 131) = 128;
  *((_DWORD *)a1 + 129) = 16;
  a1[2] = xmmword_1D400B7D0;
  a1[3] = xmmword_1D400B7E0;
  *((_QWORD *)a1 + 68) = 0;
  return result;
}

BOOL XXH3_64bits_reset_withSecret(_OWORD *a1, uint64_t a2, unint64_t a3)
{
  if (!a1)
    return 1;
  bzero(a1, 0x240uLL);
  *a1 = xmmword_1D400B7B0;
  a1[1] = xmmword_1D400B7C0;
  a1[2] = xmmword_1D400B7D0;
  a1[3] = xmmword_1D400B7E0;
  *((_QWORD *)a1 + 68) = 0;
  *((_QWORD *)a1 + 70) = a2;
  *((_DWORD *)a1 + 131) = a3 - 64;
  *((_DWORD *)a1 + 129) = (a3 - 64) >> 3;
  return !a2 || a3 < 0x88;
}

uint64_t XXH3_64bits_reset_withSeed(_OWORD *a1, uint64_t a2)
{
  uint64_t v4;
  _OWORD *v5;
  uint64_t result;

  if (!a1)
    return 1;
  bzero(a1, 0x240uLL);
  v4 = 0;
  *a1 = xmmword_1D400B7B0;
  a1[1] = xmmword_1D400B7C0;
  a1[2] = xmmword_1D400B7D0;
  a1[3] = xmmword_1D400B7E0;
  *((_QWORD *)a1 + 68) = a2;
  *((_DWORD *)a1 + 131) = 128;
  *((_DWORD *)a1 + 129) = 16;
  do
  {
    v5 = &a1[v4];
    *((_QWORD *)v5 + 8) = *(_QWORD *)((char *)&kSecret + v4 * 16) + a2;
    *((_QWORD *)v5 + 9) = *(_QWORD *)((char *)&kSecret + v4 * 16 + 8) - a2;
    ++v4;
  }
  while (v4 != 12);
  result = 0;
  *((_QWORD *)a1 + 70) = a1 + 4;
  return result;
}

uint64_t XXH3_64bits_update(uint64_t a1, char *__src, size_t __n)
{
  int v3;
  char *v4;
  uint64_t v6;
  int v7;
  uint64_t result;
  char *v9;
  size_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t k;
  uint64_t m;
  int64x2_t v19;
  int64x2_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  int64x2_t v27;
  int64x2_t v28;
  uint64_t v29;
  uint64_t v30;
  uint32x2_t v31;
  int8x16_t v32;
  int8x16_t v33;
  const float *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  int64x2_t v39;
  int64x2_t v40;
  unint64_t v41;
  uint32x2_t v42;
  int v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t jj;
  int64x2_t v50;
  int64x2_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t n;
  int64x2_t v57;
  int64x2_t v58;
  uint64_t v59;
  uint64_t v60;
  int8x16_t v61;
  int8x16_t v62;
  const float *v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t ii;
  int64x2_t v69;
  int64x2_t v70;
  float32x2x2_t v71;
  float32x2x2_t v72;

  if (!__src)
    return 1;
  v3 = __n;
  v4 = __src;
  *(_QWORD *)(a1 + 536) += __n;
  v6 = *(unsigned int *)(a1 + 512);
  if (v6 + __n <= 0x100)
  {
    memcpy((void *)(a1 + v6 + 256), __src, __n);
    v7 = *(_DWORD *)(a1 + 512) + v3;
LABEL_59:
    result = 0;
    *(_DWORD *)(a1 + 512) = v7;
    return result;
  }
  v9 = &__src[__n];
  if ((_DWORD)v6)
  {
    v10 = (256 - v6);
    v11 = a1 + 256;
    memcpy((void *)(a1 + 256 + v6), __src, v10);
    v4 += v10;
    v12 = *(_DWORD *)(a1 + 516);
    v13 = *(_QWORD *)(a1 + 560);
    v14 = *(_DWORD *)(a1 + 520);
    v15 = (v12 - v14);
    v16 = v13 + (8 * v14);
    if (v15 < 5)
    {
      v22 = *(unsigned int *)(a1 + 524);
      if (v12 != v14)
      {
        v23 = 0;
        if (v15 <= 1)
          v24 = 1;
        else
          v24 = v15;
        v25 = a1 + 256;
        do
        {
          for (i = 0; i != 64; i += 16)
          {
            v27 = *(int64x2_t *)(v25 + i);
            v28 = (int64x2_t)veorq_s8(*(int8x16_t *)(v16 + i), (int8x16_t)v27);
            *(uint64x2_t *)(a1 + i) = vmlal_u32((uint64x2_t)vaddq_s64(*(int64x2_t *)(a1 + i), v27), (uint32x2_t)vmovn_s64(v28), (uint32x2_t)vshrn_n_s64(v28, 0x20uLL));
          }
          ++v23;
          v16 += 8;
          v25 += 64;
        }
        while (v23 != v24);
      }
      v29 = 0;
      v30 = v13 + v22;
      v31 = (uint32x2_t)vdup_n_s32(0x9E3779B1);
      do
      {
        v32 = *(int8x16_t *)(a1 + v29);
        v33 = veorq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v32, 0x2FuLL), v32);
        v34 = (const float *)(v30 + v29);
        v71 = vld2_f32(v34);
        *(uint64x2_t *)(a1 + v29) = vmlal_u32((uint64x2_t)vshlq_n_s64((int64x2_t)vmull_u32((uint32x2_t)veor_s8((int8x8_t)v71.val[1], (int8x8_t)vzip2_s32(*(int32x2_t *)v32.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v32, v32, 8uLL))), v31), 0x20uLL), (uint32x2_t)veor_s8((int8x8_t)v71.val[0], (int8x8_t)vzip1_s32(*(int32x2_t *)v33.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v33, v33, 8uLL))), v31);
        v29 += 16;
      }
      while (v29 != 64);
      v21 = 4 - v15;
      if ((_DWORD)v15 != 4)
      {
        v35 = 0;
        v36 = v11 + (v15 << 6);
        if (v21 <= 1)
          v37 = 1;
        else
          v37 = v21;
        do
        {
          for (j = 0; j != 64; j += 16)
          {
            v39 = *(int64x2_t *)(v36 + j);
            v40 = (int64x2_t)veorq_s8(*(int8x16_t *)(v13 + j), (int8x16_t)v39);
            *(uint64x2_t *)(a1 + j) = vmlal_u32((uint64x2_t)vaddq_s64(*(int64x2_t *)(a1 + j), v39), (uint32x2_t)vmovn_s64(v40), (uint32x2_t)vshrn_n_s64(v40, 0x20uLL));
          }
          ++v35;
          v13 += 8;
          v36 += 64;
        }
        while (v35 != v37);
      }
    }
    else
    {
      for (k = 0; k != 4; ++k)
      {
        for (m = 0; m != 64; m += 16)
        {
          v19 = *(int64x2_t *)(v11 + m);
          v20 = (int64x2_t)veorq_s8(*(int8x16_t *)(v16 + m), (int8x16_t)v19);
          *(uint64x2_t *)(a1 + m) = vmlal_u32((uint64x2_t)vaddq_s64(*(int64x2_t *)(a1 + m), v19), (uint32x2_t)vmovn_s64(v20), (uint32x2_t)vshrn_n_s64(v20, 0x20uLL));
        }
        v16 += 8;
        v11 += 64;
      }
      LODWORD(v21) = *(_DWORD *)(a1 + 520) + 4;
    }
    *(_DWORD *)(a1 + 520) = v21;
    *(_DWORD *)(a1 + 512) = 0;
  }
  if (v4 + 256 <= v9)
  {
    LODWORD(v41) = *(_DWORD *)(a1 + 520);
    v42 = (uint32x2_t)vdup_n_s32(0x9E3779B1);
    do
    {
      v43 = *(_DWORD *)(a1 + 516);
      v44 = *(_QWORD *)(a1 + 560);
      v45 = (v43 - v41);
      v46 = v44 + (8 * v41);
      if (v45 < 5)
      {
        v52 = *(unsigned int *)(a1 + 524);
        if (v43 != (_DWORD)v41)
        {
          v53 = 0;
          if (v45 <= 1)
            v54 = 1;
          else
            v54 = v45;
          v55 = v4;
          do
          {
            for (n = 0; n != 64; n += 16)
            {
              v57 = *(int64x2_t *)&v55[n];
              v58 = (int64x2_t)veorq_s8(*(int8x16_t *)(v46 + n), (int8x16_t)v57);
              *(uint64x2_t *)(a1 + n) = vmlal_u32((uint64x2_t)vaddq_s64(*(int64x2_t *)(a1 + n), v57), (uint32x2_t)vmovn_s64(v58), (uint32x2_t)vshrn_n_s64(v58, 0x20uLL));
            }
            ++v53;
            v46 += 8;
            v55 += 64;
          }
          while (v53 != v54);
        }
        v59 = 0;
        v60 = v44 + v52;
        do
        {
          v61 = *(int8x16_t *)(a1 + v59);
          v62 = veorq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v61, 0x2FuLL), v61);
          v63 = (const float *)(v60 + v59);
          v72 = vld2_f32(v63);
          *(uint64x2_t *)(a1 + v59) = vmlal_u32((uint64x2_t)vshlq_n_s64((int64x2_t)vmull_u32((uint32x2_t)veor_s8((int8x8_t)v72.val[1], (int8x8_t)vzip2_s32(*(int32x2_t *)v61.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v61, v61, 8uLL))), v42), 0x20uLL), (uint32x2_t)veor_s8((int8x8_t)v72.val[0], (int8x8_t)vzip1_s32(*(int32x2_t *)v62.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v62, v62, 8uLL))), v42);
          v59 += 16;
        }
        while (v59 != 64);
        v41 = 4 - v45;
        if ((_DWORD)v45 != 4)
        {
          v64 = 0;
          v65 = v45 << 6;
          if (v41 <= 1)
            v66 = 1;
          else
            v66 = 4 - v45;
          v67 = &v4[v65];
          do
          {
            for (ii = 0; ii != 64; ii += 16)
            {
              v69 = *(int64x2_t *)&v67[ii];
              v70 = (int64x2_t)veorq_s8(*(int8x16_t *)(v44 + ii), (int8x16_t)v69);
              *(uint64x2_t *)(a1 + ii) = vmlal_u32((uint64x2_t)vaddq_s64(*(int64x2_t *)(a1 + ii), v69), (uint32x2_t)vmovn_s64(v70), (uint32x2_t)vshrn_n_s64(v70, 0x20uLL));
            }
            ++v64;
            v44 += 8;
            v67 += 64;
          }
          while (v64 != v66);
        }
      }
      else
      {
        v47 = 0;
        v48 = v4;
        do
        {
          for (jj = 0; jj != 64; jj += 16)
          {
            v50 = *(int64x2_t *)&v48[jj];
            v51 = (int64x2_t)veorq_s8(*(int8x16_t *)(v46 + jj), (int8x16_t)v50);
            *(uint64x2_t *)(a1 + jj) = vmlal_u32((uint64x2_t)vaddq_s64(*(int64x2_t *)(a1 + jj), v50), (uint32x2_t)vmovn_s64(v51), (uint32x2_t)vshrn_n_s64(v51, 0x20uLL));
          }
          ++v47;
          v46 += 8;
          v48 += 64;
        }
        while (v47 != 4);
        LODWORD(v41) = *(_DWORD *)(a1 + 520) + 4;
      }
      *(_DWORD *)(a1 + 520) = v41;
      v4 += 256;
    }
    while (v4 <= v9 - 256);
  }
  if (v4 < v9)
  {
    v7 = (_DWORD)v9 - (_DWORD)v4;
    memcpy((void *)(a1 + 256), v4, v9 - v4);
    goto LABEL_59;
  }
  return 0;
}

unint64_t XXH3_64bits_digest(uint64_t a1)
{
  unint64_t v2;
  int8x16_t v3;
  int8x16_t v4;
  size_t v5;
  size_t v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t k;
  int64x2_t v17;
  int64x2_t v18;
  unint64_t v19;
  int8x16_t *v20;
  uint64_t v22;
  uint64_t v23;
  int64x2_t v24;
  int64x2_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  int64x2_t v30;
  int64x2_t v31;
  uint64_t v32;
  uint32x2_t v33;
  int8x16_t v34;
  int8x16_t v35;
  const float *v36;
  uint64_t v37;
  size_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  int64x2_t v42;
  int64x2_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int64x2_t v47;
  int64x2_t v48;
  int8x16_t v49[8];
  uint64_t v50;
  float32x2x2_t v51;

  v50 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 536);
  if (v2 < 0xF1)
  {
    v19 = *(_QWORD *)(a1 + 544);
    v20 = (int8x16_t *)(a1 + 256);
    if (v19)
      return XXH3_64bits_withSeed(v20, v2, v19);
    else
      return XXH3_64bits_withSecret(v20, v2, *(int8x16_t **)(a1 + 560), (*(_DWORD *)(a1 + 524) + 64));
  }
  else
  {
    v3 = *(int8x16_t *)(a1 + 16);
    v49[0] = *(int8x16_t *)a1;
    v49[1] = v3;
    v4 = *(int8x16_t *)(a1 + 48);
    v49[2] = *(int8x16_t *)(a1 + 32);
    v49[3] = v4;
    v5 = *(unsigned int *)(a1 + 512);
    if (v5 < 0x40)
    {
      if ((_DWORD)v5)
      {
        __memcpy_chk();
        memcpy((char *)&v49[4].u64[1] + (64 - v5), (const void *)(a1 + 256), v5);
        v22 = 0;
        v10 = *(_QWORD *)(a1 + 560);
        v23 = v10 + *(unsigned int *)(a1 + 524) - 7;
        do
        {
          v24 = *(int64x2_t *)((char *)&v49[v22 + 4] + 8);
          v25 = (int64x2_t)veorq_s8(*(int8x16_t *)(v23 + v22 * 16), (int8x16_t)v24);
          v49[v22] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v49[v22], v24), (uint32x2_t)vmovn_s64(v25), (uint32x2_t)vshrn_n_s64(v25, 0x20uLL));
          ++v22;
        }
        while (v22 != 4);
      }
      else
      {
        v10 = *(_QWORD *)(a1 + 560);
      }
    }
    else
    {
      v6 = v5 >> 6;
      v7 = *(_DWORD *)(a1 + 520);
      v8 = *(_DWORD *)(a1 + 516);
      v9 = a1 + 256;
      v10 = *(_QWORD *)(a1 + 560);
      v11 = *(unsigned int *)(a1 + 524);
      v12 = (v8 - v7);
      v13 = v10 + (8 * v7);
      if (v12 <= *(_DWORD *)(a1 + 512) >> 6)
      {
        if (v8 != v7)
        {
          v26 = 0;
          if (v12 <= 1)
            v27 = 1;
          else
            v27 = v12;
          v28 = a1 + 256;
          do
          {
            for (i = 0; i != 4; ++i)
            {
              v30 = *(int64x2_t *)(v28 + i * 16);
              v31 = (int64x2_t)veorq_s8(*(int8x16_t *)(v13 + i * 16), (int8x16_t)v30);
              v49[i] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v49[i], v30), (uint32x2_t)vmovn_s64(v31), (uint32x2_t)vshrn_n_s64(v31, 0x20uLL));
            }
            ++v26;
            v13 += 8;
            v28 += 64;
          }
          while (v26 != v27);
        }
        v32 = 0;
        v33 = (uint32x2_t)vdup_n_s32(0x9E3779B1);
        do
        {
          v34 = v49[v32];
          v35 = veorq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v34, 0x2FuLL), v34);
          v36 = (const float *)(v10 + v11 + v32 * 16);
          v51 = vld2_f32(v36);
          v49[v32++] = (int8x16_t)vmlal_u32((uint64x2_t)vshlq_n_s64((int64x2_t)vmull_u32((uint32x2_t)veor_s8((int8x8_t)v51.val[1], (int8x8_t)vzip2_s32(*(int32x2_t *)v34.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v34, v34, 8uLL))), v33), 0x20uLL), (uint32x2_t)veor_s8((int8x8_t)v51.val[0], (int8x8_t)vzip1_s32(*(int32x2_t *)v35.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v35, v35, 8uLL))), v33);
        }
        while (v32 != 4);
        if ((_DWORD)v6 != (_DWORD)v12)
        {
          v37 = 0;
          v38 = v6 - v12;
          v39 = v10;
          v40 = v9 + (v12 << 6);
          do
          {
            for (j = 0; j != 4; ++j)
            {
              v42 = *(int64x2_t *)(v40 + j * 16);
              v43 = (int64x2_t)veorq_s8(*(int8x16_t *)(v39 + j * 16), (int8x16_t)v42);
              v49[j] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v49[j], v42), (uint32x2_t)vmovn_s64(v43), (uint32x2_t)vshrn_n_s64(v43, 0x20uLL));
            }
            ++v37;
            v39 += 8;
            v40 += 64;
          }
          while (v37 != v38);
        }
      }
      else
      {
        v14 = 0;
        v15 = a1 + 256;
        do
        {
          for (k = 0; k != 4; ++k)
          {
            v17 = *(int64x2_t *)(v15 + k * 16);
            v18 = (int64x2_t)veorq_s8(*(int8x16_t *)(v13 + k * 16), (int8x16_t)v17);
            v49[k] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v49[k], v17), (uint32x2_t)vmovn_s64(v18), (uint32x2_t)vshrn_n_s64(v18, 0x20uLL));
          }
          ++v14;
          v13 += 8;
          v15 += 64;
        }
        while (v14 != v6);
      }
      if ((v5 & 0x3F) != 0)
      {
        v44 = 0;
        v45 = v9 + v5 - 64;
        v46 = v10 + v11 - 7;
        do
        {
          v47 = *(int64x2_t *)(v45 + v44 * 16);
          v48 = (int64x2_t)veorq_s8(*(int8x16_t *)(v46 + v44 * 16), (int8x16_t)v47);
          v49[v44] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v49[v44], v47), (uint32x2_t)vmovn_s64(v48), (uint32x2_t)vshrn_n_s64(v48, 0x20uLL));
          ++v44;
        }
        while (v44 != 4);
      }
    }
    return XXH3_mergeAccs(v49, (int8x16_t *)(v10 + 11), 0x9E3779B185EBCA87 * v2);
  }
}

unint64_t XXH3_mergeAccs(int8x16_t *a1, int8x16_t *a2, uint64_t a3)
{
  int8x16_t v3;
  uint64_t v4;
  uint64_t v5;
  int8x16_t v6;
  uint64_t v7;
  uint64_t v8;
  int8x16_t v9;
  uint64_t v10;
  int8x16_t v11;
  unint64_t v12;

  v3 = veorq_s8(*a2, *a1);
  v4 = v3.i64[1];
  v5 = v3.i64[0];
  v6 = veorq_s8(a2[1], a1[1]);
  v7 = v6.i64[1];
  v8 = v6.i64[0];
  v9 = veorq_s8(a2[2], a1[2]);
  v10 = ((((unint64_t)v4 * (unsigned __int128)(unint64_t)v5) >> 64) ^ (v4 * v5))
      + a3
      + ((((unint64_t)v7 * (unsigned __int128)(unint64_t)v8) >> 64) ^ (v7 * v8))
      + (((v9.u64[1] * (unsigned __int128)v9.u64[0]) >> 64) ^ (v9.i64[1] * v9.i64[0]));
  v11 = veorq_s8(a2[3], a1[3]);
  v12 = v10 + (((v11.u64[1] * (unsigned __int128)v11.u64[0]) >> 64) ^ (v11.i64[1] * v11.i64[0]));
  return (0x165667B19E3779F9 * (v12 ^ (v12 >> 37))) ^ ((0x165667B19E3779F9 * (v12 ^ (v12 >> 37))) >> 32);
}

unint64_t XXH3_128bits(_QWORD *a1, unint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
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

  if (a2 > 0x10)
  {
    if (a2 > 0x80)
    {
      if (a2 > 0xF0)
        return XXH3_hashLong_128b_defaultSecret((uint64_t)a1, a2);
      else
        return XXH3_len_129to240_128b((uint64_t)a1, a2, (uint64_t)&kSecret, 0);
    }
    else
    {
      v4 = 0x9E3779B185EBCA87 * a2;
      if (a2 < 0x21)
      {
        v13 = 0;
      }
      else
      {
        if (a2 < 0x41)
        {
          v14 = 0;
        }
        else
        {
          if (a2 < 0x61)
          {
            v9 = 0;
          }
          else
          {
            v5 = a1[6];
            v6 = a1[7];
            v8 = *(_QWORD *)((char *)a1 + a2 - 64);
            v7 = *(_QWORD *)((char *)a1 + a2 - 56);
            v4 = (v4
                + ((((v6 ^ 0x1D4F0BC7C7BBDCF9uLL) * (unsigned __int128)(v5 ^ 0x3F349CE33F76FAA8uLL)) >> 64) ^ ((v6 ^ 0x1D4F0BC7C7BBDCF9) * (v5 ^ 0x3F349CE33F76FAA8)))) ^ (v7 + v8);
            v9 = (v6 + v5) ^ (((v7 ^ 0x647378D9C97E9FC8uLL) * (unsigned __int128)(v8 ^ 0x3159B4CD4BE0518AuLL)) >> 64) ^ ((v7 ^ 0x647378D9C97E9FC8) * (v8 ^ 0x3159B4CD4BE0518ALL));
          }
          v15 = a1[4];
          v16 = a1[5];
          v18 = *(_QWORD *)((char *)a1 + a2 - 48);
          v17 = *(_QWORD *)((char *)a1 + a2 - 40);
          v4 = (v4
              + ((((v16 ^ 0xA32E531B8B65D088) * (unsigned __int128)(v15 ^ 0xCB00C391BB52283CLL)) >> 64) ^ ((v16 ^ 0xA32E531B8B65D088) * (v15 ^ 0xCB00C391BB52283CLL)))) ^ (v17 + v18);
          v14 = (v9
               + ((((v17 ^ 0xD8ACDEA946EF1938) * (unsigned __int128)(v18 ^ 0x4EF90DA297486471uLL)) >> 64) ^ ((v17 ^ 0xD8ACDEA946EF1938) * (v18 ^ 0x4EF90DA297486471)))) ^ (v16 + v15);
        }
        v19 = a1[2];
        v20 = a1[3];
        v22 = *(_QWORD *)((char *)a1 + a2 - 32);
        v21 = *(_QWORD *)((char *)a1 + a2 - 24);
        v4 = (v4
            + ((((v20 ^ 0x2172FFCC7DD05A82uLL) * (unsigned __int128)(v19 ^ 0x78E5C0CC4EE679CBuLL)) >> 64) ^ ((v20 ^ 0x2172FFCC7DD05A82) * (v19 ^ 0x78E5C0CC4EE679CBLL)))) ^ (v21 + v22);
        v13 = (v14
             + ((((v21 ^ 0x4C263A81E69035E0uLL) * (unsigned __int128)(v22 ^ 0x8E2443F7744608B8)) >> 64) ^ ((v21 ^ 0x4C263A81E69035E0) * (v22 ^ 0x8E2443F7744608B8)))) ^ (v20 + v19);
      }
      v23 = a1[1];
      v25 = *(_QWORD *)((char *)a1 + a2 - 16);
      v24 = *(_QWORD *)((char *)a1 + a2 - 8);
      v26 = (v4
           + ((((v23 ^ 0x1CAD21F72C81017CuLL) * (unsigned __int128)(*a1 ^ 0xBE4BA423396CFEB8)) >> 64) ^ ((v23 ^ 0x1CAD21F72C81017CLL) * (*a1 ^ 0xBE4BA423396CFEB8)))) ^ (v24 + v25);
      v27 = (v13
           + ((((v24 ^ 0x1F67B3B7A4A44072uLL) * (unsigned __int128)(v25 ^ 0xDB979083E96DD4DELL)) >> 64) ^ ((v24 ^ 0x1F67B3B7A4A44072) * (v25 ^ 0xDB979083E96DD4DELL)))) ^ (v23 + *a1);
      return (0x165667B19E3779F9 * ((v27 + v26) ^ ((unint64_t)(v27 + v26) >> 37))) ^ ((0x165667B19E3779F9
                                                                                              * ((v27 + v26) ^ ((unint64_t)(v27 + v26) >> 37))) >> 32);
    }
  }
  else
  {
    if (a2 >= 9)
    {
      v2 = (0x9E3779B185EBCA87
          * (*a1 ^ 0xBE4BA423396CFEB8 ^ *(_QWORD *)((char *)a1 + a2 - 8) ^ 0x1CAD21F72C81017CLL)
          + 374761393 * a2) ^ ((unint64_t)((__PAIR128__(*(_QWORD *)((char *)a1 + a2 - 8) ^ 0x1CAD21F72C81017CuLL, *a1 ^ 0xBE4BA423396CFEB8 ^ *(_QWORD *)((char *)a1 + a2 - 8) ^ 0x1CAD21F72C81017CLL)* 0x9E3779B185EBCA87) >> 64) >> 32);
      v3 = (0xC2B2AE3D27D4EB4FLL * v2) ^ ((0xC2B2AE3D27D4EB4FLL * v2) >> 37);
      return (0x165667B19E3779F9 * v3) ^ ((0x165667B19E3779F9 * v3) >> 32);
    }
    if (a2 >= 4)
    {
      v10 = (*(unsigned int *)a1 | ((unint64_t)*(unsigned int *)((char *)a1 + a2 - 4) << 32)) ^ 0xBE4BA423396CFEB8;
      v11 = 0xC2B2AE3D27D4EB4FLL
          * ((a2 + 2654435761u * (v10 ^ (v10 >> 51))) ^ ((a2 + 2654435761u * (v10 ^ (v10 >> 51))) >> 47));
LABEL_16:
      v3 = v11 ^ (v11 >> 37);
      return (0x165667B19E3779F9 * v3) ^ ((0x165667B19E3779F9 * v3) >> 32);
    }
    if (a2)
    {
      v11 = 0x9E3779B185EBCA87
          * ((*(unsigned __int8 *)a1 | (*((unsigned __int8 *)a1 + (a2 >> 1)) << 8) | (*((unsigned __int8 *)a1 + a2 - 1) << 16) | ((_DWORD)a2 << 24)) ^ 0x396CFEB8u);
      goto LABEL_16;
    }
    return 0;
  }
}

unint64_t XXH3_len_129to240_128b(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;

  v4 = 0;
  v5 = 0;
  v6 = 0x9E3779B185EBCA87 * a2;
  v7 = a1 + 24;
  v8 = a3 + 16;
  do
  {
    v9 = *(_QWORD *)(a1 + v4);
    v10 = *(_QWORD *)(v7 + v4 - 16);
    v11 = (*(_QWORD *)(v8 + v4 - 8) - a4) ^ v10;
    v12 = *(_QWORD *)(v7 + v4 - 8);
    v13 = *(_QWORD *)(v7 + v4);
    v6 = (v6
        + ((((unint64_t)v11 * (unsigned __int128)((*(_QWORD *)(a3 + v4) + a4) ^ v9)) >> 64) ^ (v11 * ((*(_QWORD *)(a3 + v4) + a4) ^ v9)))) ^ (v13 + v12);
    v14 = (*(_QWORD *)(v8 + v4 + 8) - a4) ^ v13;
    v5 = (v5
        + ((((unint64_t)v14 * (unsigned __int128)((*(_QWORD *)(v8 + v4) + a4) ^ v12)) >> 64) ^ (v14 * ((*(_QWORD *)(v8 + v4) + a4) ^ v12)))) ^ (v10 + v9);
    v4 += 32;
  }
  while (v4 != 128);
  v15 = (0x165667B19E3779F9 * (v6 ^ (v6 >> 37))) ^ ((0x165667B19E3779F9 * (v6 ^ (v6 >> 37))) >> 32);
  v16 = (0x165667B19E3779F9 * (v5 ^ (v5 >> 37))) ^ ((0x165667B19E3779F9 * (v5 ^ (v5 >> 37))) >> 32);
  if (a2 >= 0xA0)
  {
    v17 = (a2 >> 5) - 4;
    v18 = (_QWORD *)(a1 + 152);
    v19 = (uint64_t *)(a3 + 19);
    do
    {
      v20 = *(v18 - 3);
      v21 = *(v18 - 2);
      v22 = *(v18 - 1);
      v15 = (v15
           + (((((*(v19 - 1) - a4) ^ v21) * (unsigned __int128)((*(v19 - 2) + a4) ^ v20)) >> 64) ^ (((*(v19 - 1) - a4) ^ v21)
                                                                                                  * ((*(v19 - 2) + a4) ^ v20)))) ^ (*v18 + v22);
      v23 = *v19;
      v24 = v19[1];
      v19 += 4;
      v16 = (v16
           + (((((unint64_t)(v24 - a4) ^ *v18) * (unsigned __int128)((v23 + a4) ^ v22)) >> 64) ^ (((v24 - a4) ^ *v18) * ((v23 + a4) ^ v22)))) ^ (v21 + v20);
      v18 += 4;
      --v17;
    }
    while (v17);
  }
  v25 = *(_QWORD *)(a1 + a2 - 16);
  v26 = *(_QWORD *)(a1 + a2 - 8);
  v28 = *(_QWORD *)(a1 + a2 - 32);
  v27 = *(_QWORD *)(a1 + a2 - 24);
  v29 = (v15
       + (((((*(_QWORD *)(a3 + 111) + a4) ^ v26) * (unsigned __int128)((*(_QWORD *)(a3 + 103) - a4) ^ v25)) >> 64) ^ (((*(_QWORD *)(a3 + 111) + a4) ^ v26) * ((*(_QWORD *)(a3 + 103) - a4) ^ v25)))) ^ (v27 + v28);
  v30 = (v16
       + (((((*(_QWORD *)(a3 + 127) + a4) ^ v27) * (unsigned __int128)((*(_QWORD *)(a3 + 119) - a4) ^ v28)) >> 64) ^ (((*(_QWORD *)(a3 + 127) + a4) ^ v27) * ((*(_QWORD *)(a3 + 119) - a4) ^ v28)))) ^ (v26 + v25);
  v31 = 0x165667B19E3779F9 * ((v30 + v29) ^ ((unint64_t)(v30 + v29) >> 37));
  return v31 ^ HIDWORD(v31);
}

unint64_t XXH3_hashLong_128b_defaultSecret(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  uint32x2_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t i;
  int8x16_t v10;
  int64x2_t v11;
  uint64_t j;
  int8x16_t v13;
  int8x16_t v14;
  const float *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t k;
  int8x16_t v21;
  int64x2_t v22;
  uint64_t m;
  int8x16_t v24;
  int64x2_t v25;
  unint64_t v26;
  int8x16_t v28[4];
  uint64_t v29;
  float32x2x2_t v30;

  v29 = *MEMORY[0x1E0C80C00];
  v28[0] = (int8x16_t)xmmword_1D400B8C0;
  v28[1] = (int8x16_t)unk_1D400B8D0;
  v28[2] = (int8x16_t)xmmword_1D400B8E0;
  v28[3] = (int8x16_t)unk_1D400B8F0;
  if (a2 >= 0x400)
  {
    v3 = 0;
    v4 = (uint32x2_t)vdup_n_s32(0x9E3779B1);
    v5 = a1;
    do
    {
      v6 = 0;
      v7 = v5;
      v8 = (char *)&kSecret;
      do
      {
        for (i = 0; i != 4; ++i)
        {
          v10 = *(int8x16_t *)(v7 + i * 16);
          v11 = (int64x2_t)veorq_s8(*(int8x16_t *)&v8[i * 16], v10);
          v28[i] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v28[i], (int64x2_t)vextq_s8(v10, v10, 8uLL)), (uint32x2_t)vmovn_s64(v11), (uint32x2_t)vshrn_n_s64(v11, 0x20uLL));
        }
        ++v6;
        v8 += 8;
        v7 += 64;
      }
      while (v6 != 16);
      for (j = 0; j != 4; ++j)
      {
        v13 = v28[j];
        v14 = veorq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v13, 0x2FuLL), v13);
        v15 = (const float *)((char *)&kSecret + j * 16 + 128);
        v30 = vld2_f32(v15);
        v28[j] = (int8x16_t)vmlal_u32((uint64x2_t)vshlq_n_s64((int64x2_t)vmull_u32((uint32x2_t)veor_s8((int8x8_t)v30.val[1], (int8x8_t)vzip2_s32(*(int32x2_t *)v13.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v13, v13, 8uLL))), v4), 0x20uLL), (uint32x2_t)veor_s8((int8x8_t)v30.val[0], (int8x8_t)vzip1_s32(*(int32x2_t *)v14.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v14, v14, 8uLL))), v4);
      }
      ++v3;
      v5 += 1024;
    }
    while (v3 != a2 >> 10);
  }
  v16 = (a2 >> 6) & 0xF;
  if (v16)
  {
    v17 = 0;
    v18 = a1 + (a2 & 0xFFFFFFFFFFFFFC00);
    v19 = (char *)&kSecret;
    do
    {
      for (k = 0; k != 4; ++k)
      {
        v21 = *(int8x16_t *)(v18 + k * 16);
        v22 = (int64x2_t)veorq_s8(*(int8x16_t *)&v19[k * 16], v21);
        v28[k] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v28[k], (int64x2_t)vextq_s8(v21, v21, 8uLL)), (uint32x2_t)vmovn_s64(v22), (uint32x2_t)vshrn_n_s64(v22, 0x20uLL));
      }
      ++v17;
      v19 += 8;
      v18 += 64;
    }
    while (v17 != v16);
  }
  if ((a2 & 0x3F) != 0)
  {
    for (m = 0; m != 4; ++m)
    {
      v24 = *(int8x16_t *)(a1 + a2 - 64 + m * 16);
      v25 = (int64x2_t)veorq_s8(*(int8x16_t *)((char *)&kSecret + m * 16 + 121), v24);
      v28[m] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v28[m], (int64x2_t)vextq_s8(v24, v24, 8uLL)), (uint32x2_t)vmovn_s64(v25), (uint32x2_t)vshrn_n_s64(v25, 0x20uLL));
    }
  }
  v26 = XXH3_mergeAccs(v28, xmmword_1D400B80B, 0x9E3779B185EBCA87 * a2);
  XXH3_mergeAccs(v28, (int8x16_t *)((char *)&xmmword_1D400B80B[6].u64[1] + 2), ~(0xC2B2AE3D27D4EB4FLL * a2));
  return v26;
}

unint64_t XXH3_128bits_withSecret(_QWORD *a1, unint64_t a2, _QWORD *a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;

  if (a2 > 0x10)
  {
    if (a2 > 0x80)
    {
      if (a2 > 0xF0)
        return XXH3_hashLong_128b_withSecret((uint64_t)a1, a2, (uint64_t)a3, a4);
      else
        return XXH3_len_129to240_128b((uint64_t)a1, a2, (uint64_t)a3, 0);
    }
    else
    {
      v8 = 0x9E3779B185EBCA87 * a2;
      if (a2 < 0x21)
      {
        v17 = 0;
      }
      else
      {
        if (a2 < 0x41)
        {
          v18 = 0;
        }
        else
        {
          if (a2 < 0x61)
          {
            v13 = 0;
          }
          else
          {
            v9 = a1[6];
            v10 = a1[7];
            v12 = *(_QWORD *)((char *)a1 + a2 - 64);
            v11 = *(_QWORD *)((char *)a1 + a2 - 56);
            v8 = (v8 + ((((a3[13] ^ v10) * (unsigned __int128)(a3[12] ^ v9)) >> 64) ^ ((a3[13] ^ v10) * (a3[12] ^ v9)))) ^ (v11 + v12);
            v13 = (v10 + v9) ^ (((a3[15] ^ v11) * (unsigned __int128)(a3[14] ^ v12)) >> 64) ^ ((a3[15] ^ v11)
                                                                                             * (a3[14] ^ v12));
          }
          v19 = a1[4];
          v20 = a1[5];
          v22 = *(_QWORD *)((char *)a1 + a2 - 48);
          v21 = *(_QWORD *)((char *)a1 + a2 - 40);
          v8 = (v8 + ((((a3[9] ^ v20) * (unsigned __int128)(a3[8] ^ v19)) >> 64) ^ ((a3[9] ^ v20) * (a3[8] ^ v19)))) ^ (v21 + v22);
          v18 = (v13 + ((((a3[11] ^ v21) * (unsigned __int128)(a3[10] ^ v22)) >> 64) ^ ((a3[11] ^ v21) * (a3[10] ^ v22)))) ^ (v20 + v19);
        }
        v23 = a1[2];
        v24 = a1[3];
        v26 = *(_QWORD *)((char *)a1 + a2 - 32);
        v25 = *(_QWORD *)((char *)a1 + a2 - 24);
        v8 = (v8 + ((((a3[5] ^ v24) * (unsigned __int128)(a3[4] ^ v23)) >> 64) ^ ((a3[5] ^ v24) * (a3[4] ^ v23)))) ^ (v25 + v26);
        v17 = (v18 + ((((a3[7] ^ v25) * (unsigned __int128)(a3[6] ^ v26)) >> 64) ^ ((a3[7] ^ v25) * (a3[6] ^ v26)))) ^ (v24 + v23);
      }
      v27 = a1[1];
      v29 = *(_QWORD *)((char *)a1 + a2 - 16);
      v28 = *(_QWORD *)((char *)a1 + a2 - 8);
      v30 = (v8
           + ((((a3[1] ^ v27) * (unsigned __int128)(unint64_t)(*a3 ^ *a1)) >> 64) ^ ((a3[1] ^ v27) * (*a3 ^ *a1)))) ^ (v28 + v29);
      v31 = (v17 + ((((a3[3] ^ v28) * (unsigned __int128)(a3[2] ^ v29)) >> 64) ^ ((a3[3] ^ v28) * (a3[2] ^ v29)))) ^ (v27 + *a1);
      return (0x165667B19E3779F9 * ((v31 + v30) ^ ((unint64_t)(v31 + v30) >> 37))) ^ ((0x165667B19E3779F9
                                                                                              * ((v31 + v30) ^ ((unint64_t)(v31 + v30) >> 37))) >> 32);
    }
  }
  else
  {
    if (a2 >= 9)
    {
      v4 = a3[1] ^ *(_QWORD *)((char *)a1 + a2 - 8);
      v5 = (0x9E3779B185EBCA87 * (*a3 ^ *a1 ^ v4) + 374761393 * a2) ^ ((unint64_t)((__PAIR128__(v4, *a3 ^ *a1 ^ v4)* 0x9E3779B185EBCA87) >> 64) >> 32);
      v6 = 0x165667B19E3779F9 * ((0xC2B2AE3D27D4EB4FLL * v5) ^ ((0xC2B2AE3D27D4EB4FLL * v5) >> 37));
      return v6 ^ HIDWORD(v6);
    }
    if (a2 < 4)
    {
      if (!a2)
        return 0;
      v16 = 0x9E3779B185EBCA87
          * ((*(unsigned __int8 *)a1 | (*((unsigned __int8 *)a1 + (a2 >> 1)) << 8) | (*((unsigned __int8 *)a1 + a2 - 1) << 16) | ((_DWORD)a2 << 24)) ^ *(_DWORD *)a3);
    }
    else
    {
      v14 = *(unsigned int *)a1 | ((unint64_t)*(unsigned int *)((char *)a1 + a2 - 4) << 32);
      v15 = a2 + 2654435761u * (v14 ^ *a3 ^ ((v14 ^ *a3) >> 51));
      v16 = 0xC2B2AE3D27D4EB4FLL * (v15 ^ (v15 >> 47));
    }
    return (0x165667B19E3779F9 * (v16 ^ (v16 >> 37))) ^ ((0x165667B19E3779F9 * (v16 ^ (v16 >> 37))) >> 32);
  }
}

unint64_t XXH3_hashLong_128b_withSecret(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint32x2_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  int8x16_t v19;
  int64x2_t v20;
  uint64_t j;
  int8x16_t v22;
  int8x16_t v23;
  const float *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int8x16_t v33;
  int64x2_t v34;
  uint64_t k;
  int8x16_t v36;
  int64x2_t v37;
  unint64_t v38;
  int8x16_t v40[4];
  uint64_t v41;
  float32x2x2_t v42;

  v41 = *MEMORY[0x1E0C80C00];
  v40[0] = (int8x16_t)xmmword_1D400B8C0;
  v40[1] = (int8x16_t)unk_1D400B8D0;
  v40[2] = (int8x16_t)xmmword_1D400B8E0;
  v40[3] = (int8x16_t)unk_1D400B8F0;
  v7 = a4 - 64;
  v8 = (unint64_t)(a4 - 64) >> 3;
  v9 = v8 << 6;
  v10 = a2 / (v8 << 6);
  if (v8 << 6 <= a2)
  {
    v11 = 0;
    if (v8 <= 1)
      v8 = 1;
    if (v10 <= 1)
      v12 = 1;
    else
      v12 = v10;
    v13 = (uint32x2_t)vdup_n_s32(0x9E3779B1);
    v14 = a1;
    do
    {
      if (v7 >= 8)
      {
        v15 = 0;
        v16 = v14;
        v17 = a3;
        do
        {
          for (i = 0; i != 4; ++i)
          {
            v19 = *(int8x16_t *)(v16 + i * 16);
            v20 = (int64x2_t)veorq_s8(*(int8x16_t *)(v17 + i * 16), v19);
            v40[i] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v40[i], (int64x2_t)vextq_s8(v19, v19, 8uLL)), (uint32x2_t)vmovn_s64(v20), (uint32x2_t)vshrn_n_s64(v20, 0x20uLL));
          }
          ++v15;
          v17 += 8;
          v16 += 64;
        }
        while (v15 != v8);
      }
      for (j = 0; j != 4; ++j)
      {
        v22 = v40[j];
        v23 = veorq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v22, 0x2FuLL), v22);
        v24 = (const float *)(a3 + a4 - 64 + j * 16);
        v42 = vld2_f32(v24);
        v40[j] = (int8x16_t)vmlal_u32((uint64x2_t)vshlq_n_s64((int64x2_t)vmull_u32((uint32x2_t)veor_s8((int8x8_t)v42.val[1], (int8x8_t)vzip2_s32(*(int32x2_t *)v22.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v22, v22, 8uLL))), v13), 0x20uLL), (uint32x2_t)veor_s8((int8x8_t)v42.val[0], (int8x8_t)vzip1_s32(*(int32x2_t *)v23.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v23, v23, 8uLL))), v13);
      }
      ++v11;
      v14 += v9;
    }
    while (v11 != v12);
  }
  v25 = v10 * v9;
  v26 = a2 - v25;
  if (a2 - v25 >= 0x40)
  {
    v27 = 0;
    v28 = a1 + v25;
    v29 = v26 >> 6;
    if (v29 <= 1)
      v29 = 1;
    v30 = a3;
    do
    {
      v31 = 0;
      v32 = 0;
      do
      {
        v33 = *(int8x16_t *)(v28 + (v27 << 6) + 16 * v32);
        v34 = (int64x2_t)veorq_s8(*(int8x16_t *)(v30 + v31 * 16), v33);
        v40[v31] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v40[v31], (int64x2_t)vextq_s8(v33, v33, 8uLL)), (uint32x2_t)vmovn_s64(v34), (uint32x2_t)vshrn_n_s64(v34, 0x20uLL));
        ++v32;
        ++v31;
      }
      while (v31 != 4);
      ++v27;
      v30 += 8;
    }
    while (v27 != v29);
  }
  if ((a2 & 0x3F) != 0)
  {
    for (k = 0; k != 4; ++k)
    {
      v36 = *(int8x16_t *)(a1 + a2 - 64 + k * 16);
      v37 = (int64x2_t)veorq_s8(*(int8x16_t *)(a3 + a4 - 71 + k * 16), v36);
      v40[k] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v40[k], (int64x2_t)vextq_s8(v36, v36, 8uLL)), (uint32x2_t)vmovn_s64(v37), (uint32x2_t)vshrn_n_s64(v37, 0x20uLL));
    }
  }
  v38 = XXH3_mergeAccs(v40, (int8x16_t *)(a3 + 11), 0x9E3779B185EBCA87 * a2);
  XXH3_mergeAccs(v40, (int8x16_t *)(a3 + a4 - 75), ~(0xC2B2AE3D27D4EB4FLL * a2));
  return v38;
}

unint64_t XXH3_128bits_withSeed(_QWORD *a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
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

  if (a2 > 0x10)
  {
    if (a2 > 0x80)
    {
      if (a2 > 0xF0)
        return XXH3_hashLong_128b_withSeed((uint64_t)a1, a2, a3);
      else
        return XXH3_len_129to240_128b((uint64_t)a1, a2, (uint64_t)&kSecret, a3);
    }
    else
    {
      v7 = 0x9E3779B185EBCA87 * a2;
      if (a2 < 0x21)
      {
        v16 = 0;
      }
      else
      {
        if (a2 < 0x41)
        {
          v17 = 0;
        }
        else
        {
          if (a2 < 0x61)
          {
            v12 = 0;
          }
          else
          {
            v8 = a1[6];
            v9 = a1[7];
            v11 = *(_QWORD *)((char *)a1 + a2 - 64);
            v10 = *(_QWORD *)((char *)a1 + a2 - 56);
            v7 = (v7
                + ((((v9 ^ (unint64_t)(0x1D4F0BC7C7BBDCF9 - a3))
                   * (unsigned __int128)(v8 ^ (unint64_t)(a3 + 0x3F349CE33F76FAA8))) >> 64) ^ ((v9 ^ (0x1D4F0BC7C7BBDCF9 - a3)) * (v8 ^ (a3 + 0x3F349CE33F76FAA8))))) ^ (v10 + v11);
            v12 = (v9 + v8) ^ (((v10 ^ (unint64_t)(0x647378D9C97E9FC8 - a3))
                              * (unsigned __int128)(v11 ^ (unint64_t)(a3 + 0x3159B4CD4BE0518ALL))) >> 64) ^ ((v10 ^ (0x647378D9C97E9FC8 - a3)) * (v11 ^ (a3 + 0x3159B4CD4BE0518ALL)));
          }
          v18 = a1[4];
          v19 = a1[5];
          v21 = *(_QWORD *)((char *)a1 + a2 - 48);
          v20 = *(_QWORD *)((char *)a1 + a2 - 40);
          v7 = (v7
              + ((((v19 ^ (0xA32E531B8B65D088 - a3))
                 * (unsigned __int128)(v18 ^ (unint64_t)(a3 - 0x34FF3C6E44ADD7C4))) >> 64) ^ ((v19 ^ (0xA32E531B8B65D088 - a3)) * (v18 ^ (a3 - 0x34FF3C6E44ADD7C4))))) ^ (v20 + v21);
          v17 = (v12
               + ((((v20 ^ (0xD8ACDEA946EF1938 - a3))
                  * (unsigned __int128)(v21 ^ (unint64_t)(a3 + 0x4EF90DA297486471))) >> 64) ^ ((v20 ^ (0xD8ACDEA946EF1938 - a3)) * (v21 ^ (a3 + 0x4EF90DA297486471))))) ^ (v19 + v18);
        }
        v22 = a1[2];
        v23 = a1[3];
        v25 = *(_QWORD *)((char *)a1 + a2 - 32);
        v24 = *(_QWORD *)((char *)a1 + a2 - 24);
        v7 = (v7
            + ((((v23 ^ (unint64_t)(0x2172FFCC7DD05A82 - a3))
               * (unsigned __int128)(v22 ^ (unint64_t)(a3 + 0x78E5C0CC4EE679CBLL))) >> 64) ^ ((v23 ^ (0x2172FFCC7DD05A82 - a3)) * (v22 ^ (a3 + 0x78E5C0CC4EE679CBLL))))) ^ (v24 + v25);
        v16 = (v17
             + ((((v24 ^ (unint64_t)(0x4C263A81E69035E0 - a3))
                * (unsigned __int128)(v25 ^ (unint64_t)(a3 - 0x71DBBC088BB9F748))) >> 64) ^ ((v24 ^ (0x4C263A81E69035E0 - a3)) * (v25 ^ (a3 - 0x71DBBC088BB9F748))))) ^ (v23 + v22);
      }
      v26 = a1[1];
      v28 = *(_QWORD *)((char *)a1 + a2 - 16);
      v27 = *(_QWORD *)((char *)a1 + a2 - 8);
      v29 = (v7
           + ((((v26 ^ (unint64_t)(0x1CAD21F72C81017CLL - a3))
              * (unsigned __int128)(*a1 ^ (unint64_t)(a3 - 0x41B45BDCC6930148))) >> 64) ^ ((v26 ^ (0x1CAD21F72C81017CLL - a3))
                                                                                                  * (*a1 ^ (a3 - 0x41B45BDCC6930148))))) ^ (v27 + v28);
      v30 = (v16
           + ((((v27 ^ (unint64_t)(0x1F67B3B7A4A44072 - a3))
              * (unsigned __int128)(v28 ^ (unint64_t)(a3 - 0x24686F7C16922B22))) >> 64) ^ ((v27 ^ (0x1F67B3B7A4A44072 - a3))
                                                                                                  * (v28 ^ (a3 - 0x24686F7C16922B22))))) ^ (v26 + *a1);
      return (0x165667B19E3779F9 * ((v30 + v29) ^ ((unint64_t)(v30 + v29) >> 37))) ^ ((0x165667B19E3779F9
                                                                                              * ((v30 + v29) ^ ((unint64_t)(v30 + v29) >> 37))) >> 32);
    }
  }
  else
  {
    if (a2 >= 9)
    {
      v3 = *(_QWORD *)((char *)a1 + a2 - 8) ^ (0x1CAD21F72C81017CLL - a3);
      v4 = (0x9E3779B185EBCA87 * (*a1 ^ (a3 - 0x41B45BDCC6930148) ^ v3) + 374761393 * a2) ^ ((unint64_t)((__PAIR128__(v3, *a1 ^ (a3 - 0x41B45BDCC6930148) ^ (unint64_t)v3) * 0x9E3779B185EBCA87) >> 64) >> 32);
      v5 = 0x165667B19E3779F9 * ((0xC2B2AE3D27D4EB4FLL * v4) ^ ((0xC2B2AE3D27D4EB4FLL * v4) >> 37));
      return v5 ^ HIDWORD(v5);
    }
    if (a2 < 4)
    {
      if (!a2)
        return 0;
      v15 = 0x9E3779B185EBCA87
          * ((a3 + 963444408) ^ (*(unsigned __int8 *)a1 | (*((unsigned __int8 *)a1 + (a2 >> 1)) << 8) | (*((unsigned __int8 *)a1 + a2 - 1) << 16) | ((_DWORD)a2 << 24)));
    }
    else
    {
      v13 = *(unsigned int *)a1 | ((unint64_t)*(unsigned int *)((char *)a1 + a2 - 4) << 32);
      v14 = a2 + 2654435761u * (v13 ^ (a3 - 0x41B45BDCC6930148) ^ ((v13 ^ (a3 - 0x41B45BDCC6930148)) >> 51));
      v15 = 0xC2B2AE3D27D4EB4FLL * (v14 ^ (v14 >> 47));
    }
    return (0x165667B19E3779F9 * (v15 ^ (v15 >> 37))) ^ ((0x165667B19E3779F9 * (v15 ^ (v15 >> 37))) >> 32);
  }
}

unint64_t XXH3_hashLong_128b_withSeed(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t i;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint32x2_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t j;
  int8x16_t v14;
  int64x2_t v15;
  uint64_t k;
  int8x16_t v17;
  int8x16_t v18;
  const float *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  _BYTE *v23;
  uint64_t m;
  int8x16_t v25;
  int64x2_t v26;
  uint64_t n;
  int8x16_t v28;
  int64x2_t v29;
  unint64_t v30;
  _BYTE v32[11];
  int8x16_t v33[6];
  int8x16_t v34[4];
  int8x16_t v35[4];
  uint64_t v36;
  float32x2x2_t v37;

  v36 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return XXH3_hashLong_128b_defaultSecret(a1, a2);
  for (i = 0; i != 192; i += 16)
  {
    v5 = &v32[i];
    v6 = *(_QWORD *)((char *)&kSecret + i + 8) - a3;
    *v5 = *(_QWORD *)((char *)&kSecret + i) + a3;
    v5[1] = v6;
  }
  v35[0] = (int8x16_t)xmmword_1D400B8C0;
  v35[1] = (int8x16_t)unk_1D400B8D0;
  v35[2] = (int8x16_t)xmmword_1D400B8E0;
  v35[3] = (int8x16_t)unk_1D400B8F0;
  if (a2 >= 0x400)
  {
    v7 = 0;
    v8 = (uint32x2_t)vdup_n_s32(0x9E3779B1);
    v9 = a1;
    do
    {
      v10 = 0;
      v11 = v32;
      v12 = v9;
      do
      {
        for (j = 0; j != 4; ++j)
        {
          v14 = *(int8x16_t *)(v12 + j * 16);
          v15 = (int64x2_t)veorq_s8(*(int8x16_t *)&v11[j * 16], v14);
          v35[j] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v35[j], (int64x2_t)vextq_s8(v14, v14, 8uLL)), (uint32x2_t)vmovn_s64(v15), (uint32x2_t)vshrn_n_s64(v15, 0x20uLL));
        }
        ++v10;
        v11 += 8;
        v12 += 64;
      }
      while (v10 != 16);
      for (k = 0; k != 4; ++k)
      {
        v17 = v35[k];
        v18 = veorq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v17, 0x2FuLL), v17);
        v19 = (const float *)((char *)&v34[k].i32[2] + 3);
        v37 = vld2_f32(v19);
        v35[k] = (int8x16_t)vmlal_u32((uint64x2_t)vshlq_n_s64((int64x2_t)vmull_u32((uint32x2_t)veor_s8((int8x8_t)v37.val[1], (int8x8_t)vzip2_s32(*(int32x2_t *)v17.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v17, v17, 8uLL))), v8), 0x20uLL), (uint32x2_t)veor_s8((int8x8_t)v37.val[0], (int8x8_t)vzip1_s32(*(int32x2_t *)v18.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v18, v18, 8uLL))), v8);
      }
      ++v7;
      v9 += 1024;
    }
    while (v7 != a2 >> 10);
  }
  v20 = (a2 >> 6) & 0xF;
  if (v20)
  {
    v21 = 0;
    v22 = a1 + (a2 & 0xFFFFFFFFFFFFFC00);
    v23 = v32;
    do
    {
      for (m = 0; m != 4; ++m)
      {
        v25 = *(int8x16_t *)(v22 + m * 16);
        v26 = (int64x2_t)veorq_s8(*(int8x16_t *)&v23[m * 16], v25);
        v35[m] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v35[m], (int64x2_t)vextq_s8(v25, v25, 8uLL)), (uint32x2_t)vmovn_s64(v26), (uint32x2_t)vshrn_n_s64(v26, 0x20uLL));
      }
      ++v21;
      v23 += 8;
      v22 += 64;
    }
    while (v21 != v20);
  }
  if ((a2 & 0x3F) != 0)
  {
    for (n = 0; n != 4; ++n)
    {
      v28 = *(int8x16_t *)(a1 + a2 - 64 + n * 16);
      v29 = (int64x2_t)veorq_s8(*(int8x16_t *)((char *)&v34[n] + 4), v28);
      v35[n] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v35[n], (int64x2_t)vextq_s8(v28, v28, 8uLL)), (uint32x2_t)vmovn_s64(v29), (uint32x2_t)vshrn_n_s64(v29, 0x20uLL));
    }
  }
  v30 = XXH3_mergeAccs(v35, v33, 0x9E3779B185EBCA87 * a2);
  XXH3_mergeAccs(v35, v34, ~(0xC2B2AE3D27D4EB4FLL * a2));
  return v30;
}

uint64_t XXH3_128bits_reset(_OWORD *a1)
{
  uint64_t result;

  if (!a1)
    return 1;
  bzero(a1, 0x240uLL);
  result = 0;
  *a1 = xmmword_1D400B7B0;
  a1[1] = xmmword_1D400B7C0;
  *((_QWORD *)a1 + 70) = &kSecret;
  *((_DWORD *)a1 + 131) = 128;
  *((_DWORD *)a1 + 129) = 16;
  a1[2] = xmmword_1D400B7D0;
  a1[3] = xmmword_1D400B7E0;
  *((_QWORD *)a1 + 68) = 0;
  return result;
}

BOOL XXH3_128bits_reset_withSecret(_OWORD *a1, uint64_t a2, unint64_t a3)
{
  if (!a1)
    return 1;
  bzero(a1, 0x240uLL);
  *a1 = xmmword_1D400B7B0;
  a1[1] = xmmword_1D400B7C0;
  a1[2] = xmmword_1D400B7D0;
  a1[3] = xmmword_1D400B7E0;
  *((_QWORD *)a1 + 68) = 0;
  *((_QWORD *)a1 + 70) = a2;
  *((_DWORD *)a1 + 131) = a3 - 64;
  *((_DWORD *)a1 + 129) = (a3 - 64) >> 3;
  return !a2 || a3 < 0x88;
}

uint64_t XXH3_128bits_reset_withSeed(_OWORD *a1, uint64_t a2)
{
  uint64_t v4;
  _OWORD *v5;
  uint64_t result;

  if (!a1)
    return 1;
  bzero(a1, 0x240uLL);
  v4 = 0;
  *a1 = xmmword_1D400B7B0;
  a1[1] = xmmword_1D400B7C0;
  a1[2] = xmmword_1D400B7D0;
  a1[3] = xmmword_1D400B7E0;
  *((_QWORD *)a1 + 68) = a2;
  *((_DWORD *)a1 + 131) = 128;
  *((_DWORD *)a1 + 129) = 16;
  do
  {
    v5 = &a1[v4];
    *((_QWORD *)v5 + 8) = *(_QWORD *)((char *)&kSecret + v4 * 16) + a2;
    *((_QWORD *)v5 + 9) = *(_QWORD *)((char *)&kSecret + v4 * 16 + 8) - a2;
    ++v4;
  }
  while (v4 != 12);
  result = 0;
  *((_QWORD *)a1 + 70) = a1 + 4;
  return result;
}

uint64_t XXH3_128bits_update(uint64_t a1, char *__src, size_t __n)
{
  int v3;
  char *v4;
  uint64_t v6;
  int v7;
  uint64_t result;
  char *v9;
  size_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t k;
  uint64_t m;
  int8x16_t v19;
  int64x2_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  int8x16_t v27;
  int64x2_t v28;
  uint64_t v29;
  uint64_t v30;
  uint32x2_t v31;
  int8x16_t v32;
  int8x16_t v33;
  const float *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  int8x16_t v39;
  int64x2_t v40;
  unint64_t v41;
  uint32x2_t v42;
  int v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t jj;
  int8x16_t v50;
  int64x2_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t n;
  int8x16_t v57;
  int64x2_t v58;
  uint64_t v59;
  uint64_t v60;
  int8x16_t v61;
  int8x16_t v62;
  const float *v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t ii;
  int8x16_t v69;
  int64x2_t v70;
  float32x2x2_t v71;
  float32x2x2_t v72;

  if (!__src)
    return 1;
  v3 = __n;
  v4 = __src;
  *(_QWORD *)(a1 + 536) += __n;
  v6 = *(unsigned int *)(a1 + 512);
  if (v6 + __n <= 0x100)
  {
    memcpy((void *)(a1 + v6 + 256), __src, __n);
    v7 = *(_DWORD *)(a1 + 512) + v3;
LABEL_59:
    result = 0;
    *(_DWORD *)(a1 + 512) = v7;
    return result;
  }
  v9 = &__src[__n];
  if ((_DWORD)v6)
  {
    v10 = (256 - v6);
    v11 = a1 + 256;
    memcpy((void *)(a1 + 256 + v6), __src, v10);
    v4 += v10;
    v12 = *(_DWORD *)(a1 + 516);
    v13 = *(_QWORD *)(a1 + 560);
    v14 = *(_DWORD *)(a1 + 520);
    v15 = (v12 - v14);
    v16 = v13 + (8 * v14);
    if (v15 < 5)
    {
      v22 = *(unsigned int *)(a1 + 524);
      if (v12 != v14)
      {
        v23 = 0;
        if (v15 <= 1)
          v24 = 1;
        else
          v24 = v15;
        v25 = a1 + 256;
        do
        {
          for (i = 0; i != 64; i += 16)
          {
            v27 = *(int8x16_t *)(v25 + i);
            v28 = (int64x2_t)veorq_s8(*(int8x16_t *)(v16 + i), v27);
            *(uint64x2_t *)(a1 + i) = vmlal_u32((uint64x2_t)vaddq_s64(*(int64x2_t *)(a1 + i), (int64x2_t)vextq_s8(v27, v27, 8uLL)), (uint32x2_t)vmovn_s64(v28), (uint32x2_t)vshrn_n_s64(v28, 0x20uLL));
          }
          ++v23;
          v16 += 8;
          v25 += 64;
        }
        while (v23 != v24);
      }
      v29 = 0;
      v30 = v13 + v22;
      v31 = (uint32x2_t)vdup_n_s32(0x9E3779B1);
      do
      {
        v32 = *(int8x16_t *)(a1 + v29);
        v33 = veorq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v32, 0x2FuLL), v32);
        v34 = (const float *)(v30 + v29);
        v71 = vld2_f32(v34);
        *(uint64x2_t *)(a1 + v29) = vmlal_u32((uint64x2_t)vshlq_n_s64((int64x2_t)vmull_u32((uint32x2_t)veor_s8((int8x8_t)v71.val[1], (int8x8_t)vzip2_s32(*(int32x2_t *)v32.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v32, v32, 8uLL))), v31), 0x20uLL), (uint32x2_t)veor_s8((int8x8_t)v71.val[0], (int8x8_t)vzip1_s32(*(int32x2_t *)v33.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v33, v33, 8uLL))), v31);
        v29 += 16;
      }
      while (v29 != 64);
      v21 = 4 - v15;
      if ((_DWORD)v15 != 4)
      {
        v35 = 0;
        v36 = v11 + (v15 << 6);
        if (v21 <= 1)
          v37 = 1;
        else
          v37 = v21;
        do
        {
          for (j = 0; j != 64; j += 16)
          {
            v39 = *(int8x16_t *)(v36 + j);
            v40 = (int64x2_t)veorq_s8(*(int8x16_t *)(v13 + j), v39);
            *(uint64x2_t *)(a1 + j) = vmlal_u32((uint64x2_t)vaddq_s64(*(int64x2_t *)(a1 + j), (int64x2_t)vextq_s8(v39, v39, 8uLL)), (uint32x2_t)vmovn_s64(v40), (uint32x2_t)vshrn_n_s64(v40, 0x20uLL));
          }
          ++v35;
          v13 += 8;
          v36 += 64;
        }
        while (v35 != v37);
      }
    }
    else
    {
      for (k = 0; k != 4; ++k)
      {
        for (m = 0; m != 64; m += 16)
        {
          v19 = *(int8x16_t *)(v11 + m);
          v20 = (int64x2_t)veorq_s8(*(int8x16_t *)(v16 + m), v19);
          *(uint64x2_t *)(a1 + m) = vmlal_u32((uint64x2_t)vaddq_s64(*(int64x2_t *)(a1 + m), (int64x2_t)vextq_s8(v19, v19, 8uLL)), (uint32x2_t)vmovn_s64(v20), (uint32x2_t)vshrn_n_s64(v20, 0x20uLL));
        }
        v16 += 8;
        v11 += 64;
      }
      LODWORD(v21) = *(_DWORD *)(a1 + 520) + 4;
    }
    *(_DWORD *)(a1 + 520) = v21;
    *(_DWORD *)(a1 + 512) = 0;
  }
  if (v4 + 256 <= v9)
  {
    LODWORD(v41) = *(_DWORD *)(a1 + 520);
    v42 = (uint32x2_t)vdup_n_s32(0x9E3779B1);
    do
    {
      v43 = *(_DWORD *)(a1 + 516);
      v44 = *(_QWORD *)(a1 + 560);
      v45 = (v43 - v41);
      v46 = v44 + (8 * v41);
      if (v45 < 5)
      {
        v52 = *(unsigned int *)(a1 + 524);
        if (v43 != (_DWORD)v41)
        {
          v53 = 0;
          if (v45 <= 1)
            v54 = 1;
          else
            v54 = v45;
          v55 = v4;
          do
          {
            for (n = 0; n != 64; n += 16)
            {
              v57 = *(int8x16_t *)&v55[n];
              v58 = (int64x2_t)veorq_s8(*(int8x16_t *)(v46 + n), v57);
              *(uint64x2_t *)(a1 + n) = vmlal_u32((uint64x2_t)vaddq_s64(*(int64x2_t *)(a1 + n), (int64x2_t)vextq_s8(v57, v57, 8uLL)), (uint32x2_t)vmovn_s64(v58), (uint32x2_t)vshrn_n_s64(v58, 0x20uLL));
            }
            ++v53;
            v46 += 8;
            v55 += 64;
          }
          while (v53 != v54);
        }
        v59 = 0;
        v60 = v44 + v52;
        do
        {
          v61 = *(int8x16_t *)(a1 + v59);
          v62 = veorq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v61, 0x2FuLL), v61);
          v63 = (const float *)(v60 + v59);
          v72 = vld2_f32(v63);
          *(uint64x2_t *)(a1 + v59) = vmlal_u32((uint64x2_t)vshlq_n_s64((int64x2_t)vmull_u32((uint32x2_t)veor_s8((int8x8_t)v72.val[1], (int8x8_t)vzip2_s32(*(int32x2_t *)v61.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v61, v61, 8uLL))), v42), 0x20uLL), (uint32x2_t)veor_s8((int8x8_t)v72.val[0], (int8x8_t)vzip1_s32(*(int32x2_t *)v62.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v62, v62, 8uLL))), v42);
          v59 += 16;
        }
        while (v59 != 64);
        v41 = 4 - v45;
        if ((_DWORD)v45 != 4)
        {
          v64 = 0;
          v65 = v45 << 6;
          if (v41 <= 1)
            v66 = 1;
          else
            v66 = 4 - v45;
          v67 = &v4[v65];
          do
          {
            for (ii = 0; ii != 64; ii += 16)
            {
              v69 = *(int8x16_t *)&v67[ii];
              v70 = (int64x2_t)veorq_s8(*(int8x16_t *)(v44 + ii), v69);
              *(uint64x2_t *)(a1 + ii) = vmlal_u32((uint64x2_t)vaddq_s64(*(int64x2_t *)(a1 + ii), (int64x2_t)vextq_s8(v69, v69, 8uLL)), (uint32x2_t)vmovn_s64(v70), (uint32x2_t)vshrn_n_s64(v70, 0x20uLL));
            }
            ++v64;
            v44 += 8;
            v67 += 64;
          }
          while (v64 != v66);
        }
      }
      else
      {
        v47 = 0;
        v48 = v4;
        do
        {
          for (jj = 0; jj != 64; jj += 16)
          {
            v50 = *(int8x16_t *)&v48[jj];
            v51 = (int64x2_t)veorq_s8(*(int8x16_t *)(v46 + jj), v50);
            *(uint64x2_t *)(a1 + jj) = vmlal_u32((uint64x2_t)vaddq_s64(*(int64x2_t *)(a1 + jj), (int64x2_t)vextq_s8(v50, v50, 8uLL)), (uint32x2_t)vmovn_s64(v51), (uint32x2_t)vshrn_n_s64(v51, 0x20uLL));
          }
          ++v47;
          v46 += 8;
          v48 += 64;
        }
        while (v47 != 4);
        LODWORD(v41) = *(_DWORD *)(a1 + 520) + 4;
      }
      *(_DWORD *)(a1 + 520) = v41;
      v4 += 256;
    }
    while (v4 <= v9 - 256);
  }
  if (v4 < v9)
  {
    v7 = (_DWORD)v9 - (_DWORD)v4;
    memcpy((void *)(a1 + 256), v4, v9 - v4);
    goto LABEL_59;
  }
  return 0;
}

unint64_t XXH3_128bits_digest(uint64_t a1)
{
  unint64_t v2;
  int8x16_t v3;
  int8x16_t v4;
  size_t v5;
  size_t v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t k;
  int8x16_t v17;
  int64x2_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v22;
  int8x16_t v23;
  int64x2_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  int8x16_t v30;
  int64x2_t v31;
  uint64_t v32;
  uint32x2_t v33;
  int8x16_t v34;
  int8x16_t v35;
  const float *v36;
  uint64_t v37;
  size_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  int8x16_t v42;
  int64x2_t v43;
  uint64_t v44;
  uint64_t v45;
  int8x16_t v46;
  int64x2_t v47;
  int8x16_t v49[8];
  uint64_t v50;
  float32x2x2_t v51;

  v50 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 536);
  if (v2 < 0xF1)
  {
    v19 = *(_QWORD *)(a1 + 544);
    v20 = (_QWORD *)(a1 + 256);
    if (v19)
      return XXH3_128bits_withSeed(v20, v2, v19);
    else
      return XXH3_128bits_withSecret(v20, v2, *(_QWORD **)(a1 + 560), (*(_DWORD *)(a1 + 524) + 64));
  }
  else
  {
    v3 = *(int8x16_t *)(a1 + 16);
    v49[0] = *(int8x16_t *)a1;
    v49[1] = v3;
    v4 = *(int8x16_t *)(a1 + 48);
    v49[2] = *(int8x16_t *)(a1 + 32);
    v49[3] = v4;
    v5 = *(unsigned int *)(a1 + 512);
    if (v5 < 0x40)
    {
      if ((_DWORD)v5)
      {
        __memcpy_chk();
        memcpy((char *)&v49[4].u64[1] + (64 - v5), (const void *)(a1 + 256), v5);
        v22 = 0;
        v10 = *(_QWORD *)(a1 + 560);
        v11 = *(unsigned int *)(a1 + 524);
        do
        {
          v23 = *(int8x16_t *)((char *)&v49[v22 + 4] + 8);
          v24 = (int64x2_t)veorq_s8(*(int8x16_t *)(v10 + v11 - 7 + v22 * 16), v23);
          v49[v22] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v49[v22], (int64x2_t)vextq_s8(v23, v23, 8uLL)), (uint32x2_t)vmovn_s64(v24), (uint32x2_t)vshrn_n_s64(v24, 0x20uLL));
          ++v22;
        }
        while (v22 != 4);
      }
      else
      {
        v10 = *(_QWORD *)(a1 + 560);
        v11 = *(unsigned int *)(a1 + 524);
      }
    }
    else
    {
      v6 = v5 >> 6;
      v7 = *(_DWORD *)(a1 + 520);
      v8 = *(_DWORD *)(a1 + 516);
      v9 = a1 + 256;
      v10 = *(_QWORD *)(a1 + 560);
      v11 = *(unsigned int *)(a1 + 524);
      v12 = (v8 - v7);
      v13 = v10 + (8 * v7);
      if (v12 <= *(_DWORD *)(a1 + 512) >> 6)
      {
        if (v8 != v7)
        {
          v26 = 0;
          if (v12 <= 1)
            v27 = 1;
          else
            v27 = v12;
          v28 = a1 + 256;
          do
          {
            for (i = 0; i != 4; ++i)
            {
              v30 = *(int8x16_t *)(v28 + i * 16);
              v31 = (int64x2_t)veorq_s8(*(int8x16_t *)(v13 + i * 16), v30);
              v49[i] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v49[i], (int64x2_t)vextq_s8(v30, v30, 8uLL)), (uint32x2_t)vmovn_s64(v31), (uint32x2_t)vshrn_n_s64(v31, 0x20uLL));
            }
            ++v26;
            v13 += 8;
            v28 += 64;
          }
          while (v26 != v27);
        }
        v32 = 0;
        v33 = (uint32x2_t)vdup_n_s32(0x9E3779B1);
        do
        {
          v34 = v49[v32];
          v35 = veorq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v34, 0x2FuLL), v34);
          v36 = (const float *)(v10 + v11 + v32 * 16);
          v51 = vld2_f32(v36);
          v49[v32++] = (int8x16_t)vmlal_u32((uint64x2_t)vshlq_n_s64((int64x2_t)vmull_u32((uint32x2_t)veor_s8((int8x8_t)v51.val[1], (int8x8_t)vzip2_s32(*(int32x2_t *)v34.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v34, v34, 8uLL))), v33), 0x20uLL), (uint32x2_t)veor_s8((int8x8_t)v51.val[0], (int8x8_t)vzip1_s32(*(int32x2_t *)v35.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v35, v35, 8uLL))), v33);
        }
        while (v32 != 4);
        if ((_DWORD)v6 != (_DWORD)v12)
        {
          v37 = 0;
          v38 = v6 - v12;
          v39 = v10;
          v40 = v9 + (v12 << 6);
          do
          {
            for (j = 0; j != 4; ++j)
            {
              v42 = *(int8x16_t *)(v40 + j * 16);
              v43 = (int64x2_t)veorq_s8(*(int8x16_t *)(v39 + j * 16), v42);
              v49[j] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v49[j], (int64x2_t)vextq_s8(v42, v42, 8uLL)), (uint32x2_t)vmovn_s64(v43), (uint32x2_t)vshrn_n_s64(v43, 0x20uLL));
            }
            ++v37;
            v39 += 8;
            v40 += 64;
          }
          while (v37 != v38);
        }
      }
      else
      {
        v14 = 0;
        v15 = a1 + 256;
        do
        {
          for (k = 0; k != 4; ++k)
          {
            v17 = *(int8x16_t *)(v15 + k * 16);
            v18 = (int64x2_t)veorq_s8(*(int8x16_t *)(v13 + k * 16), v17);
            v49[k] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v49[k], (int64x2_t)vextq_s8(v17, v17, 8uLL)), (uint32x2_t)vmovn_s64(v18), (uint32x2_t)vshrn_n_s64(v18, 0x20uLL));
          }
          ++v14;
          v13 += 8;
          v15 += 64;
        }
        while (v14 != v6);
      }
      if ((v5 & 0x3F) != 0)
      {
        v44 = 0;
        v45 = v9 + v5 - 64;
        do
        {
          v46 = *(int8x16_t *)(v45 + v44 * 16);
          v47 = (int64x2_t)veorq_s8(*(int8x16_t *)(v10 + v11 - 7 + v44 * 16), v46);
          v49[v44] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v49[v44], (int64x2_t)vextq_s8(v46, v46, 8uLL)), (uint32x2_t)vmovn_s64(v47), (uint32x2_t)vshrn_n_s64(v47, 0x20uLL));
          ++v44;
        }
        while (v44 != 4);
      }
    }
    v25 = XXH3_mergeAccs(v49, (int8x16_t *)(v10 + 11), 0x9E3779B185EBCA87 * v2);
    XXH3_mergeAccs(v49, (int8x16_t *)(v10 + v11 - 11), ~(0xC2B2AE3D27D4EB4FLL * v2));
  }
  return v25;
}

BOOL XXH128_isEqual(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1 == a3 && a2 == a4;
}

uint64_t XXH128_cmp(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  v2 = (a1[1] > a2[1]) - (a2[1] > a1[1]);
  if (!(_DWORD)v2)
    return (*a1 > *a2) - (*a2 > *a1);
  return v2;
}

_QWORD *XXH128_canonicalFromHash(_QWORD *result, unint64_t a2, unint64_t a3)
{
  *result = bswap64(a3);
  result[1] = bswap64(a2);
  return result;
}

unint64_t XXH128_hashFromCanonical(uint64_t a1)
{
  return bswap64(*(_QWORD *)(a1 + 8));
}

void sub_1D3FF03DC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1D3FF1778(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3FF17FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3FF53BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3FF5438(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1D3FF54A4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3FF5510(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3FF609C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3FF637C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void sub_1D3FF65E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _DPMetadataRequiredKeys()
{
  if (_DPMetadataRequiredKeys_onceToken != -1)
    dispatch_once(&_DPMetadataRequiredKeys_onceToken, &__block_literal_global_17);
  return (id)_DPMetadataRequiredKeys__DPMetadataRequiredKeys;
}

id _DPMetadataOptionalKeys()
{
  if (_DPMetadataOptionalKeys_onceToken != -1)
    dispatch_once(&_DPMetadataOptionalKeys_onceToken, &__block_literal_global_96);
  return (id)_DPMetadataOptionalKeys__DPMetadataOptionalKeys;
}

id _DPMetadataExpectedClasses()
{
  if (_DPMetadataExpectedClasses_onceToken != -1)
    dispatch_once(&_DPMetadataExpectedClasses_onceToken, &__block_literal_global_97);
  return (id)_DPMetadataExpectedClasses__DPMetadataExpectedClassesSet;
}

BOOL isEqualToOne(double a1)
{
  return vabdd_f64(1.0, a1) <= 2.22044605e-16;
}

BOOL areEqualTimeIntervals(double a1, double a2)
{
  return vabdd_f64(a1, a2) < 0.0000001;
}

double uniformRandomProbability()
{
  return (double)arc4random() / 4294967300.0;
}

double uniformRandomProbabilityExcludingOne()
{
  return (double)arc4random() * 2.32830644e-10;
}

BOOL isInvalidEpsilon(double a1)
{
  return *(double *)&epsilonMAX < a1 || a1 < 0.0;
}

BOOL isNonZeroPowerOfTwo(uint64_t a1)
{
  return a1 && (a1 & (a1 - 1)) == 0;
}

unint64_t nextPowerOfTwo(unint64_t result)
{
  int v1;
  unint64_t v2;
  BOOL v3;

  v1 = 0;
  if (result)
  {
    v2 = result;
    do
    {
      ++v1;
      v3 = v2 >= 2;
      v2 >>= 1;
    }
    while (v3);
  }
  if ((unint64_t)(1 << v1) >> 1 != result || v1 == 0)
    return 1 << v1;
  return result;
}

uint64_t submod32(unsigned int a1, unsigned int a2, int a3)
{
  if (a1 >= a2)
    a3 = 0;
  return a1 - a2 + a3;
}

uint64_t addmod32(unsigned int a1, int a2, int a3)
{
  int v3;

  if (a1 >= a3 - a2)
    v3 = 0;
  else
    v3 = a3;
  return a1 - (a3 - a2) + v3;
}

unint64_t mulmod32(unsigned int a1, unsigned int a2, unsigned int a3)
{
  return a2 * (unint64_t)a1 % a3;
}

uint64_t dotprod_mod32(unsigned int *a1, unsigned int *a2, uint64_t a3, unsigned int a4)
{
  uint64_t i;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  BOOL v10;
  unsigned int v11;
  unsigned int v12;

  for (i = 0; a3; --a3)
  {
    v6 = *a1++;
    v5 = v6;
    v7 = *a2++;
    v8 = v7 * (unint64_t)v5 % a4;
    v9 = a4 - i;
    v10 = v8 >= v9;
    v11 = v8 - v9;
    if (v10)
      v12 = 0;
    else
      v12 = a4;
    i = v11 + v12;
  }
  return i;
}

long double logaddexp(double a1, double a2)
{
  double v2;
  double v3;
  long double v4;

  v2 = a1 - a2;
  if (a1 - a2 <= 0.0)
  {
    v3 = a2;
  }
  else
  {
    v2 = -(a1 - a2);
    v3 = a1;
  }
  v4 = exp(v2);
  return log1p(v4) + v3;
}

id _DPDaemonInterface()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  v9[2] = objc_opt_class();
  v9[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = (void *)MEMORY[0x1E0C99E60];
  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFE37B20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_recordNumbers_forKey_withReply_, 0, 0);
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_recordNumbers_metadata_forKey_withReply_, 0, 0);
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_recordNumbersVectors_forKey_withReply_, 0, 0);
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_recordNumbersVectors_metadata_forKey_withReply_, 0, 0);
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_recordBitValues_forKey_withReply_, 0, 0);
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_recordBitValues_metadata_forKey_withReply_, 0, 0);
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_recordStrings_forKey_withReply_, 0, 0);
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_recordWords_forKey_withReply_, 0, 0);
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_reportsNotYetSubmittedWithReply_, 1, 1);
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_retireReports_withReply_, 0, 0);

  return v6;
}

id _DPDediscoPrioPiRapporShare.__allocating_init(prioShare:numberOfEncodedIndices:piRapporOtherPhi:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_class *v5;
  char *v11;
  char *v12;
  char *v13;
  objc_super v15;

  v11 = (char *)objc_allocWithZone(v5);
  v12 = &v11[OBJC_IVAR____DPDediscoPrioPiRapporShare_prioShare];
  *(_QWORD *)v12 = a1;
  *((_QWORD *)v12 + 1) = a2;
  *(_QWORD *)&v11[OBJC_IVAR____DPDediscoPrioPiRapporShare_numberOfEncodedIndices] = a3;
  v13 = &v11[OBJC_IVAR____DPDediscoPrioPiRapporShare_piRapporOtherPhi];
  *(_QWORD *)v13 = a4;
  *((_QWORD *)v13 + 1) = a5;
  v15.receiver = v11;
  v15.super_class = v5;
  return objc_msgSendSuper2(&v15, sel_init);
}

id _DPDediscoPrioPiRapporShare.init(prioShare:numberOfEncodedIndices:piRapporOtherPhi:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char *v5;
  char *v6;
  char *v7;
  objc_super v9;

  v6 = &v5[OBJC_IVAR____DPDediscoPrioPiRapporShare_prioShare];
  *(_QWORD *)v6 = a1;
  *((_QWORD *)v6 + 1) = a2;
  *(_QWORD *)&v5[OBJC_IVAR____DPDediscoPrioPiRapporShare_numberOfEncodedIndices] = a3;
  v7 = &v5[OBJC_IVAR____DPDediscoPrioPiRapporShare_piRapporOtherPhi];
  *(_QWORD *)v7 = a4;
  *((_QWORD *)v7 + 1) = a5;
  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for _DPDediscoPrioPiRapporShare();
  return objc_msgSendSuper2(&v9, sel_init);
}

uint64_t type metadata accessor for _DPDediscoPrioPiRapporShare()
{
  return objc_opt_self();
}

id _DPDediscoPrioPiRapporShare.__allocating_init(serializedData:)(uint64_t a1, unint64_t a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return _DPDediscoPrioPiRapporShare.init(serializedData:)(a1, a2);
}

id _DPDediscoPrioPiRapporShare.init(serializedData:)(uint64_t a1, unint64_t a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  _OWORD v16[2];
  uint64_t v17;
  uint64_t v18;

  v4 = v2;
  sub_1D4005704();
  MEMORY[0x1E0C80A78]();
  type metadata accessor for DediscoPrioPiRapporShare();
  MEMORY[0x1E0C80A78]();
  v8 = (uint64_t *)((char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v17 = 0;
  memset(v16, 0, sizeof(v16));
  sub_1D3FFB350(a1, a2);
  sub_1D40056F8();
  sub_1D3FFB394();
  sub_1D4005758();
  if (v3)
  {
    sub_1D3FFB3DC(a1, a2);
    swift_getObjectType();
    swift_deallocPartialClassInstance();
  }
  else
  {
    v9 = *v8;
    v10 = v8[1];
    sub_1D3FFB350(*v8, v10);
    v11 = (void *)sub_1D40056BC();
    sub_1D3FFB3DC(v9, v10);
    v12 = v8[3];
    v18 = v8[2];
    v13 = v8[4];
    sub_1D3FFB350(v12, v13);
    v14 = (void *)sub_1D40056BC();
    sub_1D3FFB3DC(v12, v13);
    v4 = objc_msgSend(v2, sel_initWithPrioShare_numberOfEncodedIndices_piRapporOtherPhi_, v11, v18, v14);

    sub_1D3FFB3DC(a1, a2);
    sub_1D3FFB420((uint64_t)v8);
  }
  return v4;
}

uint64_t sub_1D3FFB350(uint64_t a1, unint64_t a2)
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

unint64_t sub_1D3FFB394()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EFE347A8;
  if (!qword_1EFE347A8)
  {
    v1 = type metadata accessor for DediscoPrioPiRapporShare();
    result = MEMORY[0x1D8256F68](&unk_1D400BC28, v1);
    atomic_store(result, (unint64_t *)&qword_1EFE347A8);
  }
  return result;
}

uint64_t sub_1D3FFB3DC(uint64_t a1, unint64_t a2)
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

uint64_t sub_1D3FFB420(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for DediscoPrioPiRapporShare();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1D3FFB504()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____DPDediscoPrioPiRapporShare_prioShare);
  sub_1D3FFB350(v1, *(_QWORD *)(v0 + OBJC_IVAR____DPDediscoPrioPiRapporShare_prioShare + 8));
  return v1;
}

uint64_t sub_1D3FFB54C()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____DPDediscoPrioPiRapporShare_numberOfEncodedIndices);
}

uint64_t sub_1D3FFB56C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____DPDediscoPrioPiRapporShare_piRapporOtherPhi);
  sub_1D3FFB350(v1, *(_QWORD *)(v0 + OBJC_IVAR____DPDediscoPrioPiRapporShare_piRapporOtherPhi + 8));
  return v1;
}

id sub_1D3FFB5B4(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;

  v3 = (uint64_t *)(a1 + *a3);
  v4 = *v3;
  v5 = v3[1];
  sub_1D3FFB350(*v3, v5);
  v6 = (void *)sub_1D40056BC();
  sub_1D3FFB3DC(v4, v5);
  return v6;
}

uint64_t sub_1D3FFB60C(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t result;

  v4 = *(_QWORD *)(a2 + OBJC_IVAR____DPDediscoPrioPiRapporShare_prioShare);
  v5 = *(_QWORD *)(a2 + OBJC_IVAR____DPDediscoPrioPiRapporShare_prioShare + 8);
  v6 = *a1;
  v7 = a1[1];
  sub_1D3FFB350(v4, v5);
  sub_1D3FFB3DC(v6, v7);
  *a1 = v4;
  a1[1] = v5;
  a1[2] = *(_QWORD *)(a2 + OBJC_IVAR____DPDediscoPrioPiRapporShare_numberOfEncodedIndices);
  v8 = a2 + OBJC_IVAR____DPDediscoPrioPiRapporShare_piRapporOtherPhi;
  v9 = *(_QWORD *)(a2 + OBJC_IVAR____DPDediscoPrioPiRapporShare_piRapporOtherPhi);
  v10 = *(_QWORD *)(v8 + 8);
  v11 = a1[3];
  v12 = a1[4];
  sub_1D3FFB350(v9, v10);
  result = sub_1D3FFB3DC(v11, v12);
  a1[3] = v9;
  a1[4] = v10;
  return result;
}

uint64_t sub_1D3FFB6BC()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v3;
  _BYTE v5[16];
  uint64_t v6;

  type metadata accessor for DediscoPrioPiRapporShare();
  MEMORY[0x1E0C80A78]();
  v2 = &v5[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = v0;
  sub_1D3FFB394();
  sub_1D4005788();
  v3 = sub_1D4005764();
  sub_1D3FFB420((uint64_t)v2);
  return v3;
}

uint64_t sub_1D3FFB78C(uint64_t *a1)
{
  uint64_t v1;

  return sub_1D3FFB60C(a1, *(_QWORD *)(v1 + 16));
}

id _DPDediscoPrioPiRapporShare.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void _DPDediscoPrioPiRapporShare.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id _DPDediscoPrioPiRapporShare.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _DPDediscoPrioPiRapporShare();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for _DPDediscoPrioPiRapporShare()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of _DPDediscoPrioPiRapporShare.__allocating_init(prioShare:numberOfEncodedIndices:piRapporOtherPhi:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of _DPDediscoPrioPiRapporShare.getPrioShare()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of _DPDediscoPrioPiRapporShare.getNumberOfEncodedIndices()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of _DPDediscoPrioPiRapporShare.getPiRapporOtherPhi()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of _DPDediscoPrioPiRapporShare.serialize()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

uint64_t sub_1D3FFBA64(uint64_t *a1)
{
  return sub_1D3FFB78C(a1);
}

unint64_t PINEShim.PINEType.init(rawValue:)(int a1)
{
  uint64_t v1;

  v1 = 4294905860;
  if (a1 != -61436)
    v1 = 0;
  return v1 | ((unint64_t)(a1 != -61436) << 32);
}

BOOL sub_1D3FFBAA4(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1D3FFBAB8()
{
  sub_1D40058E4();
  sub_1D40058F0();
  return sub_1D40058FC();
}

uint64_t sub_1D3FFBAFC()
{
  return sub_1D40058F0();
}

uint64_t sub_1D3FFBB24()
{
  sub_1D40058E4();
  sub_1D40058F0();
  return sub_1D40058FC();
}

_DWORD *sub_1D3FFBB64@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2;
  int v3;

  v2 = *result != -61436;
  if (*result == -61436)
    v3 = -61436;
  else
    v3 = 0;
  *(_DWORD *)a2 = v3;
  *(_BYTE *)(a2 + 4) = v2;
  return result;
}

void sub_1D3FFBB84(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

uint64_t PINEShim.Parameter.fractionalBitCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____DPPINEParameter_fractionalBitCount);
}

float PINEShim.Parameter.l2NormBound.getter()
{
  uint64_t v0;

  return *(float *)(v0 + OBJC_IVAR____DPPINEParameter_l2NormBound);
}

uint64_t PINEShim.Parameter.numOfProofs.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____DPPINEParameter_numOfProofs);
}

uint64_t PINEShim.Parameter.pineType.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + OBJC_IVAR____DPPINEParameter_pineType);
}

id PINEShim.Parameter.__allocating_init(fractionalBitCount:l2NormBound:numOfProofs:pineType:)(uint64_t a1, uint64_t a2, int a3, float a4)
{
  objc_class *v4;
  char *v9;
  objc_super v11;

  v9 = (char *)objc_allocWithZone(v4);
  *(_QWORD *)&v9[OBJC_IVAR____DPPINEParameter_fractionalBitCount] = a1;
  *(float *)&v9[OBJC_IVAR____DPPINEParameter_l2NormBound] = a4;
  *(_QWORD *)&v9[OBJC_IVAR____DPPINEParameter_numOfProofs] = a2;
  *(_DWORD *)&v9[OBJC_IVAR____DPPINEParameter_pineType] = a3;
  v11.receiver = v9;
  v11.super_class = v4;
  return objc_msgSendSuper2(&v11, sel_init);
}

id PINEShim.Parameter.init(fractionalBitCount:l2NormBound:numOfProofs:pineType:)(uint64_t a1, uint64_t a2, int a3, float a4)
{
  char *v4;
  objc_class *ObjectType;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&v4[OBJC_IVAR____DPPINEParameter_fractionalBitCount] = a1;
  *(float *)&v4[OBJC_IVAR____DPPINEParameter_l2NormBound] = a4;
  *(_QWORD *)&v4[OBJC_IVAR____DPPINEParameter_numOfProofs] = a2;
  *(_DWORD *)&v4[OBJC_IVAR____DPPINEParameter_pineType] = a3;
  v11.receiver = v4;
  v11.super_class = ObjectType;
  return objc_msgSendSuper2(&v11, sel_init);
}

void PINEShim.Parameter.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t PINEShim.ShardResult.publicShare.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____DPPINEShardResult_publicShare);
  sub_1D3FFB350(v1, *(_QWORD *)(v0 + OBJC_IVAR____DPPINEShardResult_publicShare + 8));
  return v1;
}

uint64_t PINEShim.ShardResult.inputShares.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PINEShim.ShardResult.nonce.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____DPPINEShardResult_nonce);
  sub_1D3FFB350(v1, *(_QWORD *)(v0 + OBJC_IVAR____DPPINEShardResult_nonce + 8));
  return v1;
}

uint64_t PINEShim.ShardResult.dimension.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____DPPINEShardResult_dimension);
}

uint64_t PINEShim.ShardResult.chunkLength.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____DPPINEShardResult_chunkLength);
}

float PINEShim.ShardResult.l2NormBound.getter()
{
  uint64_t v0;

  return *(float *)(v0 + OBJC_IVAR____DPPINEShardResult_l2NormBound);
}

id PINEShim.ShardResult.__allocating_init(publicShare:inputShares:nonce:dimension:chunkLength:l2NormBound:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, float a8)
{
  objc_class *v8;
  char *v17;
  char *v18;
  char *v19;
  objc_super v21;

  v17 = (char *)objc_allocWithZone(v8);
  v18 = &v17[OBJC_IVAR____DPPINEShardResult_publicShare];
  *(_QWORD *)v18 = a1;
  *((_QWORD *)v18 + 1) = a2;
  *(_QWORD *)&v17[OBJC_IVAR____DPPINEShardResult_inputShares] = a3;
  v19 = &v17[OBJC_IVAR____DPPINEShardResult_nonce];
  *(_QWORD *)v19 = a4;
  *((_QWORD *)v19 + 1) = a5;
  *(_QWORD *)&v17[OBJC_IVAR____DPPINEShardResult_dimension] = a6;
  *(_QWORD *)&v17[OBJC_IVAR____DPPINEShardResult_chunkLength] = a7;
  *(float *)&v17[OBJC_IVAR____DPPINEShardResult_l2NormBound] = a8;
  v21.receiver = v17;
  v21.super_class = v8;
  return objc_msgSendSuper2(&v21, sel_init);
}

id PINEShim.ShardResult.init(publicShare:inputShares:nonce:dimension:chunkLength:l2NormBound:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, float a8)
{
  char *v8;
  objc_class *ObjectType;
  char *v18;
  char *v19;
  objc_super v21;

  ObjectType = (objc_class *)swift_getObjectType();
  v18 = &v8[OBJC_IVAR____DPPINEShardResult_publicShare];
  *(_QWORD *)v18 = a1;
  *((_QWORD *)v18 + 1) = a2;
  *(_QWORD *)&v8[OBJC_IVAR____DPPINEShardResult_inputShares] = a3;
  v19 = &v8[OBJC_IVAR____DPPINEShardResult_nonce];
  *(_QWORD *)v19 = a4;
  *((_QWORD *)v19 + 1) = a5;
  *(_QWORD *)&v8[OBJC_IVAR____DPPINEShardResult_dimension] = a6;
  *(_QWORD *)&v8[OBJC_IVAR____DPPINEShardResult_chunkLength] = a7;
  *(float *)&v8[OBJC_IVAR____DPPINEShardResult_l2NormBound] = a8;
  v21.receiver = v8;
  v21.super_class = ObjectType;
  return objc_msgSendSuper2(&v21, sel_init);
}

id PINEShim.ShardResult.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void PINEShim.ShardResult.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id _s19DifferentialPrivacy8PINEShimC9ParameterCfD_0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id PINEShim.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PINEShim();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for PINEShim()
{
  return objc_opt_self();
}

uint64_t sub_1D3FFC3A4@<X0>(uint64_t *a1@<X3>, uint64_t *a2@<X4>, uint64_t a3@<X5>, uint64_t a4@<X6>, _QWORD *a5@<X7>, uint64_t *a6@<X8>)
{
  uint64_t v6;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  int v23;
  objc_class *v24;
  char *v25;
  char *v26;
  uint64_t *v27;
  objc_super v32;

  v8 = *a1;
  v9 = a1[1];
  v11 = *a2;
  v10 = a2[1];
  sub_1D3FFB350(*a1, v9);
  sub_1D3FFB350(v11, v10);
  v12 = sub_1D4005830();
  if (v6)
  {
    sub_1D3FFB3DC(v11, v10);
    result = sub_1D3FFB3DC(v8, v9);
    *a5 = v6;
  }
  else
  {
    v16 = v12;
    v17 = v14;
    v18 = v11;
    v19 = v13;
    sub_1D3FFB3DC(v18, v10);
    sub_1D3FFB3DC(v8, v9);
    v20 = *a1;
    v21 = a1[1];
    sub_1D3FFB350(*a1, v21);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFE34808);
    v22 = sub_1D4005800();
    v23 = *(_DWORD *)(a4 + OBJC_IVAR____DPPINEParameter_l2NormBound);
    v24 = (objc_class *)type metadata accessor for PINEShim.ShardResult();
    v25 = (char *)objc_allocWithZone(v24);
    v26 = &v25[OBJC_IVAR____DPPINEShardResult_publicShare];
    *(_QWORD *)v26 = v16;
    *((_QWORD *)v26 + 1) = v19;
    *(_QWORD *)&v25[OBJC_IVAR____DPPINEShardResult_inputShares] = v17;
    v27 = (uint64_t *)&v25[OBJC_IVAR____DPPINEShardResult_nonce];
    *v27 = v20;
    v27[1] = v21;
    *(_QWORD *)&v25[OBJC_IVAR____DPPINEShardResult_dimension] = a3;
    *(_QWORD *)&v25[OBJC_IVAR____DPPINEShardResult_chunkLength] = v22;
    *(_DWORD *)&v25[OBJC_IVAR____DPPINEShardResult_l2NormBound] = v23;
    v32.receiver = v25;
    v32.super_class = v24;
    result = (uint64_t)objc_msgSendSuper2(&v32, sel_init);
    *a6 = result;
  }
  return result;
}

uint64_t static PINEShim.shard(_:parameter:)(void *a1, uint64_t a2)
{
  uint64_t result;

  if (*(_DWORD *)(a2 + OBJC_IVAR____DPPINEParameter_pineType) == -61436)
    return sub_1D3FFCAA0(a1, a2);
  result = sub_1D40058D8();
  __break(1u);
  return result;
}

unint64_t static PINEShim.isValidPINEType(_:)(unint64_t result)
{
  if (!HIDWORD(result))
    return result == 4294905860;
  __break(1u);
  return result;
}

BOOL static PINEShim.isValidNumOfProofs(_:)(uint64_t a1)
{
  return (unint64_t)(a1 - 2) < 3;
}

id PINEShim.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PINEShim();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1D3FFC718(uint64_t a1)
{
  __asm { BR              X13 }
}

uint64_t sub_1D3FFC77C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t bytes, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t result;
  unint64_t v32;
  uint64_t v33;
  unsigned int v34;
  unsigned __int8 v35;
  unsigned __int8 v36;
  unsigned __int8 v37;

  v33 = v29;
  LOWORD(v34) = v28;
  BYTE2(v34) = BYTE2(v28);
  HIBYTE(v34) = BYTE3(v28);
  v35 = BYTE4(v28);
  v36 = BYTE5(v28);
  v37 = BYTE6(v28);
  result = SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E0CD7000], BYTE6(v28), &v33);
  if ((_DWORD)result)
  {
    sub_1D40058CC();
    __break(1u);
    JUMPOUT(0x1D3FFC9A0);
  }
  v32 = v34 | ((unint64_t)v35 << 32) | ((unint64_t)v36 << 40) | ((unint64_t)v37 << 48);
  *v30 = v33;
  v30[1] = v32;
  return result;
}

uint64_t sub_1D3FFC9B0(int *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  size_t v10;
  uint64_t result;

  sub_1D40056A4();
  v2 = *a1;
  v3 = a1[1];
  if ((int)v3 < (int)v2)
  {
    __break(1u);
    goto LABEL_10;
  }
  v4 = sub_1D4005650();
  if (!v4)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    result = sub_1D40058CC();
    __break(1u);
    return result;
  }
  v5 = v4;
  v6 = sub_1D4005674();
  v7 = v2 - v6;
  if (__OFSUB__(v2, v6))
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v8 = v3 - v2;
  v9 = sub_1D4005668();
  if (v9 >= v8)
    v10 = v8;
  else
    v10 = v9;
  result = SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E0CD7000], v10, (void *)(v5 + v7));
  if ((_DWORD)result)
    goto LABEL_12;
  return result;
}

uint64_t sub_1D3FFCAA0(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v20;
  id v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFE34808);
  v5 = *(_QWORD *)(v4 - 8);
  v23 = v4;
  v24 = v5;
  MEMORY[0x1E0C80A78]();
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = a1;
  v8 = (uint64_t)objc_msgSend(a1, sel_length);
  LODWORD(v32) = *(_DWORD *)(a2 + OBJC_IVAR____DPPINEParameter_l2NormBound);
  v27 = *(_QWORD *)(a2 + OBJC_IVAR____DPPINEParameter_fractionalBitCount);
  v28 = v8 / 4;
  v26 = *(_QWORD *)(a2 + OBJC_IVAR____DPPINEParameter_numOfProofs);
  sub_1D40057F4();
  v25 = sub_1D40057DC();
  sub_1D40057E8();
  sub_1D4005878();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFE34810);
  sub_1D40057D0();
  sub_1D3FFCEC0();
  sub_1D3FFCF08();
  sub_1D3FFCF98();
  v22 = v7;
  v10 = v28;
  v11 = v29;
  sub_1D400580C();
  if (!v11)
  {
    v12 = sub_1D4005824();
    *(_QWORD *)&v31 = sub_1D3FFF3D4(v12);
    *((_QWORD *)&v31 + 1) = v13;
    sub_1D3FFEDE4((uint64_t)&v31);
    v32 = v31;
    sub_1D3FFC718((uint64_t)&v32);
    v14 = v22;
    v15 = v23;
    v16 = sub_1D4005818();
    *(_QWORD *)&v30 = sub_1D3FFF3D4(v16);
    *((_QWORD *)&v30 + 1) = v17;
    sub_1D3FFEDE4((uint64_t)&v30);
    v31 = v30;
    sub_1D3FFC718((uint64_t)&v31);
    v18 = objc_retainAutorelease(v21);
    objc_msgSend(v18, sel_bytes);
    objc_msgSend(v18, sel_length);
    sub_1D3FFC3A4((uint64_t *)&v32, (uint64_t *)&v31, v10, a2, &v33, (uint64_t *)&v30);
    v9 = v30;
    (*(void (**)(char *, uint64_t))(v24 + 8))(v14, v15);
    sub_1D3FFB3DC(v31, *((unint64_t *)&v31 + 1));
    sub_1D3FFB3DC(v32, *((unint64_t *)&v32 + 1));
  }
  return v9;
}

unint64_t sub_1D3FFCE04()
{
  unint64_t result;

  result = qword_1EFE34800;
  if (!qword_1EFE34800)
  {
    result = MEMORY[0x1D8256F68](&protocol conformance descriptor for PINEShim.PINEType, &type metadata for PINEShim.PINEType);
    atomic_store(result, (unint64_t *)&qword_1EFE34800);
  }
  return result;
}

ValueMetadata *type metadata accessor for PINEShim.PINEType()
{
  return &type metadata for PINEShim.PINEType;
}

uint64_t type metadata accessor for PINEShim.Parameter()
{
  return objc_opt_self();
}

uint64_t method lookup function for PINEShim.Parameter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PINEShim.Parameter.__allocating_init(fractionalBitCount:l2NormBound:numOfProofs:pineType:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t type metadata accessor for PINEShim.ShardResult()
{
  return objc_opt_self();
}

uint64_t method lookup function for PINEShim.ShardResult()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PINEShim.ShardResult.__allocating_init(publicShare:inputShares:nonce:dimension:chunkLength:l2NormBound:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

unint64_t sub_1D3FFCEC0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EFE34818;
  if (!qword_1EFE34818)
  {
    v1 = sub_1D4005878();
    result = MEMORY[0x1D8256F68](MEMORY[0x1E0DC6248], v1);
    atomic_store(result, (unint64_t *)&qword_1EFE34818);
  }
  return result;
}

unint64_t sub_1D3FFCF08()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EFE34820;
  if (!qword_1EFE34820)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFE34810);
    result = MEMORY[0x1D8256F68](MEMORY[0x1E0DEA5E8], v1);
    atomic_store(result, (unint64_t *)&qword_1EFE34820);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1D8256F5C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_1D3FFCF98()
{
  unint64_t result;

  result = qword_1EFE34828;
  if (!qword_1EFE34828)
  {
    result = MEMORY[0x1D8256F68](MEMORY[0x1E0DEB190], MEMORY[0x1E0DEB188]);
    atomic_store(result, (unint64_t *)&qword_1EFE34828);
  }
  return result;
}

uint64_t *sub_1D3FFCFE4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = *a2;
    v8 = a2[1];
    sub_1D3FFB350(*a2, v8);
    *a1 = v7;
    a1[1] = v8;
    v9 = a2[3];
    a1[2] = a2[2];
    v10 = a2[4];
    sub_1D3FFB350(v9, v10);
    a1[3] = v9;
    a1[4] = v10;
    v11 = *(int *)(a3 + 28);
    v12 = (char *)a1 + v11;
    v13 = (char *)a2 + v11;
    v14 = sub_1D40056EC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
  }
  return a1;
}

uint64_t sub_1D3FFD0A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_1D3FFB3DC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  sub_1D3FFB3DC(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32));
  v4 = a1 + *(int *)(a2 + 28);
  v5 = sub_1D40056EC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t *sub_1D3FFD0F8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v6 = *a2;
  v7 = a2[1];
  sub_1D3FFB350(*a2, v7);
  *a1 = v6;
  a1[1] = v7;
  v8 = a2[3];
  a1[2] = a2[2];
  v9 = a2[4];
  sub_1D3FFB350(v8, v9);
  a1[3] = v8;
  a1[4] = v9;
  v10 = *(int *)(a3 + 28);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_1D40056EC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
  return a1;
}

uint64_t *sub_1D3FFD18C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;

  v6 = *a2;
  v7 = a2[1];
  sub_1D3FFB350(*a2, v7);
  v8 = *a1;
  v9 = a1[1];
  *a1 = v6;
  a1[1] = v7;
  sub_1D3FFB3DC(v8, v9);
  a1[2] = a2[2];
  v10 = a2[3];
  v11 = a2[4];
  sub_1D3FFB350(v10, v11);
  v12 = a1[3];
  v13 = a1[4];
  a1[3] = v10;
  a1[4] = v11;
  sub_1D3FFB3DC(v12, v13);
  v14 = *(int *)(a3 + 28);
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  v17 = sub_1D40056EC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 24))(v15, v16, v17);
  return a1;
}

uint64_t sub_1D3FFD230(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  v4 = *(int *)(a3 + 28);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = sub_1D40056EC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_1D3FFD29C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_1D3FFB3DC(v6, v7);
  v8 = *(_QWORD *)(a2 + 32);
  v9 = *(_QWORD *)(a1 + 24);
  v10 = *(_QWORD *)(a1 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = v8;
  sub_1D3FFB3DC(v9, v10);
  v11 = *(int *)(a3 + 28);
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_1D40056EC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t sub_1D3FFD324()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1D3FFD330(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 12)
  {
    v4 = *(_QWORD *)(a1 + 8) >> 60;
    if (((4 * (_DWORD)v4) & 0xC) != 0)
      return 16 - ((4 * (_DWORD)v4) & 0xC | (v4 >> 2));
    else
      return 0;
  }
  else
  {
    v8 = sub_1D40056EC();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t sub_1D3FFD3B8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_1D3FFD3C4(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 12)
  {
    *(_QWORD *)result = 0;
    *((_QWORD *)result + 1) = (unint64_t)(((-(int)a2 >> 2) & 3) - 4 * (_DWORD)a2) << 60;
  }
  else
  {
    v7 = sub_1D40056EC();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 28)], a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for DediscoPrioPiRapporShare()
{
  uint64_t result;

  result = qword_1EFE34830;
  if (!qword_1EFE34830)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1D3FFD47C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1D40056EC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1D3FFD500()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;
  uint64_t v12;

  v0 = sub_1D40057C4();
  __swift_allocate_value_buffer(v0, qword_1EFE35040);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EFE35040);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFE34860);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFE34868);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1D400BAD0;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "prio_share";
  *(_QWORD *)(v7 + 8) = 10;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x1E0D3EF20];
  v9 = sub_1D40057AC();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "number_of_encoded_indices";
  *((_QWORD *)v11 + 1) = 25;
  v11[16] = 2;
  v10();
  v12 = (uint64_t)v6 + 2 * v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + 2 * v3) = 3;
  *(_QWORD *)v12 = "pi_rappor_other_phi";
  *(_QWORD *)(v12 + 8) = 19;
  *(_BYTE *)(v12 + 16) = 2;
  v10();
  return sub_1D40057B8();
}

uint64_t sub_1D3FFD694()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  result = sub_1D4005728();
  if (!v0)
  {
    while (1)
    {
      if ((v2 & 1) != 0)
        return result;
      switch(result)
      {
        case 3:
          goto LABEL_10;
        case 2:
          sub_1D4005740();
          break;
        case 1:
LABEL_10:
          sub_1D4005734();
          break;
      }
      result = sub_1D4005728();
    }
  }
  return result;
}

void sub_1D3FFD748()
{
  __asm { BR              X10 }
}

uint64_t sub_1D3FFD790(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  if ((a2 & 0xFF000000000000) == 0 || (result = sub_1D4005794(), !v2))
  {
    if (!*(_QWORD *)(v3 + 16) || (result = sub_1D40057A0(), !v2))
      __asm { BR              X10 }
  }
  return result;
}

uint64_t sub_1D3FFD8B0@<X0>(uint64_t a1@<X8>)
{
  *(_OWORD *)a1 = xmmword_1D400BAE0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0xC000000000000000;
  return sub_1D40056E0();
}

unint64_t sub_1D3FFD8E4()
{
  return 0xD000000000000018;
}

uint64_t sub_1D3FFD904@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 28);
  v5 = sub_1D40056EC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_1D3FFD944(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a2 + 28);
  v5 = sub_1D40056EC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(v4, a1, v5);
}

uint64_t (*sub_1D3FFD984())()
{
  return nullsub_1;
}

uint64_t sub_1D3FFD99C()
{
  return sub_1D3FFD694();
}

void sub_1D3FFD9B0()
{
  sub_1D3FFD748();
}

uint64_t sub_1D3FFD9C8()
{
  sub_1D3FFE430(&qword_1EFE34858, (uint64_t (*)(uint64_t))type metadata accessor for DediscoPrioPiRapporShare, (uint64_t)&unk_1D400BBF0);
  return sub_1D400571C();
}

uint64_t sub_1D3FFDA1C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1EFE34788 != -1)
    swift_once();
  v2 = sub_1D40057C4();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EFE35040);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_1D3FFDA8C()
{
  sub_1D3FFE430((unint64_t *)&qword_1EFE347A8, (uint64_t (*)(uint64_t))type metadata accessor for DediscoPrioPiRapporShare, (uint64_t)&unk_1D400BC28);
  return sub_1D4005770();
}

uint64_t sub_1D3FFDACC()
{
  sub_1D40058E4();
  sub_1D4005884();
  return sub_1D40058FC();
}

uint64_t sub_1D3FFDB20()
{
  sub_1D3FFE430((unint64_t *)&qword_1EFE347A8, (uint64_t (*)(uint64_t))type metadata accessor for DediscoPrioPiRapporShare, (uint64_t)&unk_1D400BC28);
  return sub_1D400577C();
}

uint64_t sub_1D3FFDB70()
{
  sub_1D40058E4();
  sub_1D4005884();
  return sub_1D40058FC();
}

uint64_t sub_1D3FFDBC4()
{
  return sub_1D3FFE430(&qword_1EFE34840, (uint64_t (*)(uint64_t))type metadata accessor for DediscoPrioPiRapporShare, (uint64_t)&unk_1D400BB38);
}

uint64_t sub_1D3FFDBF0()
{
  return sub_1D3FFE430((unint64_t *)&qword_1EFE347A8, (uint64_t (*)(uint64_t))type metadata accessor for DediscoPrioPiRapporShare, (uint64_t)&unk_1D400BC28);
}

uint64_t sub_1D3FFDC1C()
{
  return sub_1D3FFE430(&qword_1EFE34848, (uint64_t (*)(uint64_t))type metadata accessor for DediscoPrioPiRapporShare, (uint64_t)&unk_1D400BB60);
}

uint64_t sub_1D3FFDC48()
{
  return sub_1D3FFE430(&qword_1EFE34850, (uint64_t (*)(uint64_t))type metadata accessor for DediscoPrioPiRapporShare, (uint64_t)&unk_1D400BBA0);
}

void sub_1D3FFDC74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_1D3FFDCD4(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  BOOL *v37;
  const void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  __int16 v43;
  char v44;
  char v45;
  char v46;
  char v47;

  v42 = v39;
  v43 = v40;
  v44 = BYTE2(v40);
  v45 = BYTE3(v40);
  v46 = BYTE4(v40);
  v47 = BYTE5(v40);
  if (!v38)
  {
    __break(1u);
    JUMPOUT(0x1D3FFDEB8);
  }
  result = memcmp(v38, &v42, BYTE6(v40));
  *v37 = (_DWORD)result == 0;
  return result;
}

uint64_t sub_1D3FFDEDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  char v5;
  char v7;
  uint64_t v8;
  __int16 v9;
  char v10;
  char v11;
  char v12;
  char v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = a1;
  v9 = a2;
  v10 = BYTE2(a2);
  v11 = BYTE3(a2);
  v12 = BYTE4(a2);
  v13 = BYTE5(a2);
  sub_1D3FFDC74((uint64_t)&v8, (uint64_t)&v8 + BYTE6(a2), a3, a4);
  if (!v4)
    v5 = v7;
  return v5 & 1;
}

uint64_t sub_1D3FFDFB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;

  result = sub_1D4005650();
  v11 = result;
  if (result)
  {
    result = sub_1D4005674();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  v12 = __OFSUB__(a2, a1);
  v13 = a2 - a1;
  if (v12)
  {
    __break(1u);
    goto LABEL_15;
  }
  v14 = sub_1D4005668();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  v16 = v11 + v15;
  if (v11)
    v17 = v16;
  else
    v17 = 0;
  sub_1D3FFDC74(v11, v17, a4, a5);
  if (!v5)
    v18 = v19;
  return v18 & 1;
}

void sub_1D3FFE064(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_1D3FFE0B0()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_1D3FFE0E4 + dword_1D3FFE2BC[v0 >> 62]))();
}

uint64_t sub_1D3FFE0F4@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  if (v1 == BYTE6(v2))
  {
    if (v1 >= 1)
      __asm { BR              X10 }
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

uint64_t sub_1D3FFE2DC(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char v11;
  char v12;
  uint64_t v13;
  char *v14;
  void (*v15)(char *, char *, uint64_t);
  char v16;
  void (*v17)(char *, uint64_t);
  uint64_t v19;

  v4 = sub_1D40056EC();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v19 - v9;
  sub_1D3FFE064(*a1, a1[1]);
  if ((v11 & 1) != 0 && a1[2] == *(_QWORD *)(a2 + 16) && (sub_1D3FFE064(a1[3], a1[4]), (v12 & 1) != 0))
  {
    v13 = type metadata accessor for DediscoPrioPiRapporShare();
    v14 = (char *)a1 + *(int *)(v13 + 28);
    v15 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
    v15(v10, v14, v4);
    v15(v8, (char *)(a2 + *(int *)(v13 + 28)), v4);
    sub_1D3FFE430(&qword_1EFE34870, (uint64_t (*)(uint64_t))MEMORY[0x1E0D3E998], MEMORY[0x1E0D3E9A8]);
    v16 = sub_1D4005890();
    v17 = *(void (**)(char *, uint64_t))(v5 + 8);
    v17(v8, v4);
    v17(v10, v4);
  }
  else
  {
    v16 = 0;
  }
  return v16 & 1;
}

uint64_t sub_1D3FFE430(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1D8256F68](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t Prio3SumVectorShim.VDAFType.init(rawValue:)(int a1)
{
  uint64_t v1;

  v1 = 4294905859;
  if (a1 != -61437)
    v1 = 0;
  return v1 | ((unint64_t)(a1 != -61437) << 32);
}

_DWORD *sub_1D3FFE49C@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2;
  int v3;

  v2 = *result != -61437;
  if (*result == -61437)
    v3 = -61437;
  else
    v3 = 0;
  *(_DWORD *)a2 = v3;
  *(_BYTE *)(a2 + 4) = v2;
  return result;
}

BOOL static Prio3SumVectorShim.isValidVDAFType(_:)(int a1)
{
  return a1 == -61437;
}

uint64_t Prio3SumVectorShim.Parameter.bitWidth.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____DPPrio3SumVectorParameter_bitWidth);
}

uint64_t Prio3SumVectorShim.Parameter.numOfAggregators.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____DPPrio3SumVectorParameter_numOfAggregators);
}

uint64_t Prio3SumVectorShim.Parameter.numberOfProofs.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____DPPrio3SumVectorParameter_numberOfProofs);
}

uint64_t Prio3SumVectorShim.Parameter.vdafType.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + OBJC_IVAR____DPPrio3SumVectorParameter_vdafType);
}

id Prio3SumVectorShim.Parameter.__allocating_init(bitWidth:numOfAggregators:numOfProofs:vdafType:)(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  objc_class *v4;
  char *v9;
  objc_super v11;

  v9 = (char *)objc_allocWithZone(v4);
  *(_QWORD *)&v9[OBJC_IVAR____DPPrio3SumVectorParameter_bitWidth] = a1;
  *(_QWORD *)&v9[OBJC_IVAR____DPPrio3SumVectorParameter_numOfAggregators] = a2;
  *(_QWORD *)&v9[OBJC_IVAR____DPPrio3SumVectorParameter_numberOfProofs] = a3;
  *(_DWORD *)&v9[OBJC_IVAR____DPPrio3SumVectorParameter_vdafType] = a4;
  v11.receiver = v9;
  v11.super_class = v4;
  return objc_msgSendSuper2(&v11, sel_init);
}

id Prio3SumVectorShim.Parameter.init(bitWidth:numOfAggregators:numOfProofs:vdafType:)(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  char *v4;
  objc_class *ObjectType;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&v4[OBJC_IVAR____DPPrio3SumVectorParameter_bitWidth] = a1;
  *(_QWORD *)&v4[OBJC_IVAR____DPPrio3SumVectorParameter_numOfAggregators] = a2;
  *(_QWORD *)&v4[OBJC_IVAR____DPPrio3SumVectorParameter_numberOfProofs] = a3;
  *(_DWORD *)&v4[OBJC_IVAR____DPPrio3SumVectorParameter_vdafType] = a4;
  v11.receiver = v4;
  v11.super_class = ObjectType;
  return objc_msgSendSuper2(&v11, sel_init);
}

void Prio3SumVectorShim.Parameter.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t Prio3SumVectorShim.ShardResult.publicShare.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____DPVDAFShardResult_publicShare);
  sub_1D3FFB350(v1, *(_QWORD *)(v0 + OBJC_IVAR____DPVDAFShardResult_publicShare + 8));
  return v1;
}

uint64_t Prio3SumVectorShim.ShardResult.inputShares.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Prio3SumVectorShim.ShardResult.nonce.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____DPVDAFShardResult_nonce);
  sub_1D3FFB350(v1, *(_QWORD *)(v0 + OBJC_IVAR____DPVDAFShardResult_nonce + 8));
  return v1;
}

uint64_t Prio3SumVectorShim.ShardResult.dimension.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____DPVDAFShardResult_dimension);
}

uint64_t Prio3SumVectorShim.ShardResult.chunkLength.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____DPVDAFShardResult_chunkLength);
}

id Prio3SumVectorShim.ShardResult.__allocating_init(publicShare:inputShares:nonce:dimension:chunkLength:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  objc_class *v7;
  char *v15;
  char *v16;
  char *v17;
  objc_super v19;

  v15 = (char *)objc_allocWithZone(v7);
  v16 = &v15[OBJC_IVAR____DPVDAFShardResult_publicShare];
  *(_QWORD *)v16 = a1;
  *((_QWORD *)v16 + 1) = a2;
  *(_QWORD *)&v15[OBJC_IVAR____DPVDAFShardResult_inputShares] = a3;
  v17 = &v15[OBJC_IVAR____DPVDAFShardResult_nonce];
  *(_QWORD *)v17 = a4;
  *((_QWORD *)v17 + 1) = a5;
  *(_QWORD *)&v15[OBJC_IVAR____DPVDAFShardResult_dimension] = a6;
  *(_QWORD *)&v15[OBJC_IVAR____DPVDAFShardResult_chunkLength] = a7;
  v19.receiver = v15;
  v19.super_class = v7;
  return objc_msgSendSuper2(&v19, sel_init);
}

id Prio3SumVectorShim.ShardResult.init(publicShare:inputShares:nonce:dimension:chunkLength:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  char *v7;
  objc_class *ObjectType;
  char *v16;
  char *v17;
  objc_super v19;

  ObjectType = (objc_class *)swift_getObjectType();
  v16 = &v7[OBJC_IVAR____DPVDAFShardResult_publicShare];
  *(_QWORD *)v16 = a1;
  *((_QWORD *)v16 + 1) = a2;
  *(_QWORD *)&v7[OBJC_IVAR____DPVDAFShardResult_inputShares] = a3;
  v17 = &v7[OBJC_IVAR____DPVDAFShardResult_nonce];
  *(_QWORD *)v17 = a4;
  *((_QWORD *)v17 + 1) = a5;
  *(_QWORD *)&v7[OBJC_IVAR____DPVDAFShardResult_dimension] = a6;
  *(_QWORD *)&v7[OBJC_IVAR____DPVDAFShardResult_chunkLength] = a7;
  v19.receiver = v7;
  v19.super_class = ObjectType;
  return objc_msgSendSuper2(&v19, sel_init);
}

id Prio3SumVectorShim.ShardResult.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void Prio3SumVectorShim.ShardResult.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id Prio3SumVectorShim.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Prio3SumVectorShim();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for Prio3SumVectorShim()
{
  return objc_opt_self();
}

void static Prio3SumVectorShim.shard(_:parameter:)(void *a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + OBJC_IVAR____DPPrio3SumVectorParameter_vdafType) == -61437)
  {
    sub_1D3FFF470(a1);
  }
  else
  {
    sub_1D40058D8();
    __break(1u);
  }
}

BOOL static Prio3SumVectorShim.isValidNumOfProofs(_:)(uint64_t a1)
{
  return (unint64_t)(a1 - 2) < 3;
}

id Prio3SumVectorShim.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Prio3SumVectorShim();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1D3FFEDE4(uint64_t a1)
{
  __asm { BR              X13 }
}

void *sub_1D3FFEE40(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t __b, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  int v27;
  void *result;
  unint64_t v29;
  uint64_t v30;
  unsigned int v31;
  unsigned __int8 v32;
  unsigned __int8 v33;
  unsigned __int8 v34;

  v30 = v25;
  LOWORD(v31) = v24;
  BYTE2(v31) = BYTE2(v24);
  HIBYTE(v31) = BYTE3(v24);
  v32 = BYTE4(v24);
  v33 = BYTE5(v24);
  v34 = BYTE6(v24);
  result = memset(&v30, v27, BYTE6(v24));
  v29 = v31 | ((unint64_t)v32 << 32) | ((unint64_t)v33 << 40) | ((unint64_t)v34 << 48);
  *v26 = v30;
  v26[1] = v29;
  return result;
}

void sub_1D3FFEFCC(uint64_t a1)
{
  __asm { BR              X13 }
}

uint64_t sub_1D3FFF030(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t bytes, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t result;
  unint64_t v32;
  uint64_t v33;
  unsigned int v34;
  unsigned __int8 v35;
  unsigned __int8 v36;
  unsigned __int8 v37;

  v33 = v29;
  LOWORD(v34) = v28;
  BYTE2(v34) = BYTE2(v28);
  HIBYTE(v34) = BYTE3(v28);
  v35 = BYTE4(v28);
  v36 = BYTE5(v28);
  v37 = BYTE6(v28);
  result = SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E0CD7000], BYTE6(v28), &v33);
  if ((_DWORD)result)
  {
    sub_1D40058CC();
    __break(1u);
    JUMPOUT(0x1D3FFF254);
  }
  v32 = v34 | ((unint64_t)v35 << 32) | ((unint64_t)v36 << 40) | ((unint64_t)v37 << 48);
  *v30 = v33;
  v30[1] = v32;
  return result;
}

uint64_t sub_1D3FFF264(int *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  size_t v10;
  uint64_t result;

  sub_1D40056A4();
  v2 = *a1;
  v3 = a1[1];
  if ((int)v3 < (int)v2)
  {
    __break(1u);
    goto LABEL_10;
  }
  v4 = sub_1D4005650();
  if (!v4)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    result = sub_1D40058CC();
    __break(1u);
    return result;
  }
  v5 = v4;
  v6 = sub_1D4005674();
  v7 = v2 - v6;
  if (__OFSUB__(v2, v6))
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v8 = v3 - v2;
  v9 = sub_1D4005668();
  if (v9 >= v8)
    v10 = v8;
  else
    v10 = v9;
  result = SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E0CD7000], v10, (void *)(v5 + v7));
  if ((_DWORD)result)
    goto LABEL_12;
  return result;
}

char *sub_1D3FFF354(int *a1, int a2)
{
  char *result;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  size_t v11;

  result = (char *)sub_1D40056A4();
  v5 = *a1;
  v6 = a1[1];
  if ((int)v6 < (int)v5)
  {
    __break(1u);
    goto LABEL_9;
  }
  result = (char *)sub_1D4005650();
  if (!result)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  v7 = result;
  result = (char *)sub_1D4005674();
  v8 = v5 - (_QWORD)result;
  if (__OFSUB__(v5, result))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v9 = v6 - v5;
  v10 = sub_1D4005668();
  if (v10 >= v9)
    v11 = v9;
  else
    v11 = v10;
  return (char *)memset(&v7[v8], a2, v11);
}

uint64_t sub_1D3FFF3D4(uint64_t result)
{
  unint64_t v1;

  if (result)
  {
    v1 = result;
    if (result <= 14)
    {
      if (result < 0)
        __break(1u);
      else
        return 0;
    }
    else
    {
      sub_1D4005680();
      swift_allocObject();
      sub_1D400565C();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_1D40056B0();
        result = swift_allocObject();
        *(_QWORD *)(result + 16) = 0;
        *(_QWORD *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

void sub_1D3FFF470(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v15;
  id v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  objc_class *v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  objc_super v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  char *v48;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFE348C8);
  v42 = *(_QWORD *)(v3 - 8);
  v43 = v3;
  MEMORY[0x1E0C80A78](v3);
  v48 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = a1;
  v6 = sub_1D40058B4();
  v7 = sub_1D40058C0();
  v8 = sub_1D40058B4();
  v9 = sub_1D40058C0();
  if (v6 < v8 || v9 < v6)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v10 = sub_1D40058B4();
  v11 = sub_1D40058C0();

  if (v7 < v10 || v11 < v7)
    goto LABEL_16;
  if (__OFSUB__(v7, v6))
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  sub_1D400586C();
  if (!v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFE348D0);
    sub_1D40057D0();
    sub_1D3FFF960();
    v12 = sub_1D4005848();
    *(_QWORD *)&v46 = sub_1D3FFF3D4(v12);
    *((_QWORD *)&v46 + 1) = v13;
    sub_1D3FFEDE4((uint64_t)&v46);
    v47 = v46;
    sub_1D3FFEFCC((uint64_t)&v47);
    v14 = sub_1D400583C();
    *(_QWORD *)&v45 = sub_1D3FFF3D4(v14);
    *((_QWORD *)&v45 + 1) = v15;
    sub_1D3FFEDE4((uint64_t)&v45);
    v46 = v45;
    sub_1D3FFEFCC((uint64_t)&v46);
    v16 = objc_retainAutorelease(v5);
    objc_msgSend(v16, sel_bytes);
    objc_msgSend(v16, sel_length);
    v17 = v47;
    v18 = v46;
    sub_1D3FFB350(v47, *((unint64_t *)&v47 + 1));
    sub_1D3FFB350(v18, *((unint64_t *)&v18 + 1));
    v19 = sub_1D4005860();
    v21 = v20;
    v23 = v22;
    sub_1D3FFB3DC(v18, *((unint64_t *)&v18 + 1));
    sub_1D3FFB3DC(v17, *((unint64_t *)&v17 + 1));
    v39 = v21;
    v40 = v19;
    v41 = v23;
    v24 = v16;
    sub_1D3FFB350(v17, *((unint64_t *)&v17 + 1));
    v25 = sub_1D40058B4();
    v26 = sub_1D40058C0();
    v27 = sub_1D40058B4();
    v28 = sub_1D40058C0();
    if (v25 >= v27 && v28 >= v25)
    {
      v38 = v25;
      v29 = sub_1D40058B4();
      v30 = sub_1D40058C0();

      if (v26 >= v29 && v30 >= v26)
      {
        v31 = v26 - v38;
        if (!__OFSUB__(v26, v38))
        {
          v32 = v48;
          v33 = sub_1D4005854();
          v34 = (objc_class *)type metadata accessor for Prio3SumVectorShim.ShardResult();
          v35 = (char *)objc_allocWithZone(v34);
          v36 = &v35[OBJC_IVAR____DPVDAFShardResult_publicShare];
          v37 = v39;
          *(_QWORD *)v36 = v40;
          *((_QWORD *)v36 + 1) = v37;
          *(_QWORD *)&v35[OBJC_IVAR____DPVDAFShardResult_inputShares] = v41;
          *(_OWORD *)&v35[OBJC_IVAR____DPVDAFShardResult_nonce] = v17;
          *(_QWORD *)&v35[OBJC_IVAR____DPVDAFShardResult_dimension] = v31;
          *(_QWORD *)&v35[OBJC_IVAR____DPVDAFShardResult_chunkLength] = v33;
          v44.receiver = v35;
          v44.super_class = v34;
          objc_msgSendSuper2(&v44, sel_init);
          sub_1D3FFB3DC(v18, *((unint64_t *)&v18 + 1));
          sub_1D3FFB3DC(v17, *((unint64_t *)&v17 + 1));
          (*(void (**)(char *, uint64_t))(v42 + 8))(v32, v43);
          return;
        }
        goto LABEL_20;
      }
LABEL_19:
      __break(1u);
LABEL_20:
      __break(1u);
      return;
    }
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
}

unint64_t sub_1D3FFF8A4()
{
  unint64_t result;

  result = qword_1EFE348C0;
  if (!qword_1EFE348C0)
  {
    result = MEMORY[0x1D8256F68](&protocol conformance descriptor for Prio3SumVectorShim.VDAFType, &type metadata for Prio3SumVectorShim.VDAFType);
    atomic_store(result, (unint64_t *)&qword_1EFE348C0);
  }
  return result;
}

ValueMetadata *type metadata accessor for Prio3SumVectorShim.VDAFType()
{
  return &type metadata for Prio3SumVectorShim.VDAFType;
}

uint64_t type metadata accessor for Prio3SumVectorShim.Parameter()
{
  return objc_opt_self();
}

uint64_t method lookup function for Prio3SumVectorShim.Parameter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Prio3SumVectorShim.Parameter.__allocating_init(bitWidth:numOfAggregators:numOfProofs:vdafType:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t type metadata accessor for Prio3SumVectorShim.ShardResult()
{
  return objc_opt_self();
}

uint64_t method lookup function for Prio3SumVectorShim.ShardResult()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Prio3SumVectorShim.ShardResult.__allocating_init(publicShare:inputShares:nonce:dimension:chunkLength:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

unint64_t sub_1D3FFF960()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EFE348D8;
  if (!qword_1EFE348D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFE348D0);
    result = MEMORY[0x1D8256F68](MEMORY[0x1E0DC61B0], v1);
    atomic_store(result, (unint64_t *)&qword_1EFE348D8);
  }
  return result;
}

uint64_t __getSTCommunicationClientClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getAKAccountManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getAKAccountManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getFAFetchFamilyCircleRequestClass_block_invoke_cold_1(v0);
}

uint64_t __getFAFetchFamilyCircleRequestClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[_DPSymmetricRAPPORBudgetAuditor initWithMetadata:plistParameters:error:].cold.1(v0);
}

void __one_time_setup_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, v0, v1, "PPM reports directory creation failed with %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __one_time_setup_block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, v0, v1, "Retired reports directory creation failed with %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __one_time_setup_block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, v0, v1, "Reports directory creation failed with %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __one_time_setup_block_invoke_cold_4()
{
  int *v0;
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;

  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_4_4();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x26u);
  OUTLINED_FUNCTION_6_1();
}

void __one_time_setup_block_invoke_cold_5()
{
  int *v0;
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;

  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_4_4();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x22u);
  OUTLINED_FUNCTION_6_1();
}

void __one_time_setup_block_invoke_cold_6(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D3FAA000, log, OS_LOG_TYPE_DEBUG, "Database directory does not need convertion to Data Vault", v1, 2u);
}

void __one_time_setup_block_invoke_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, v0, v1, "Database directory creation failed with %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

uint64_t __getLBFEventManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getLBFTrialIdentifiersClass_block_invoke_cold_1(v0);
}

uint64_t __getLBFTrialIdentifiersClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getLBFDprivacydEventClass_block_invoke_cold_1(v0);
}

uint64_t __getLBFDprivacydEventClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[_DPPrioValueRandomizer initWithEpsilon:parameters:].cold.1(v0);
}

uint64_t sub_1D4005650()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t sub_1D400565C()
{
  return MEMORY[0x1E0CAE8D8]();
}

uint64_t sub_1D4005668()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t sub_1D4005674()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t sub_1D4005680()
{
  return MEMORY[0x1E0CAE910]();
}

uint64_t sub_1D400568C()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1D4005698()
{
  return MEMORY[0x1E0CB0088]();
}

uint64_t sub_1D40056A4()
{
  return MEMORY[0x1E0CB00F0]();
}

uint64_t sub_1D40056B0()
{
  return MEMORY[0x1E0CB0140]();
}

uint64_t sub_1D40056BC()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1D40056C8()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1D40056D4()
{
  return MEMORY[0x1E0D3E988]();
}

uint64_t sub_1D40056E0()
{
  return MEMORY[0x1E0D3E990]();
}

uint64_t sub_1D40056EC()
{
  return MEMORY[0x1E0D3E998]();
}

uint64_t sub_1D40056F8()
{
  return MEMORY[0x1E0D3EA60]();
}

uint64_t sub_1D4005704()
{
  return MEMORY[0x1E0D3EA68]();
}

uint64_t sub_1D4005710()
{
  return MEMORY[0x1E0D3EA80]();
}

uint64_t sub_1D400571C()
{
  return MEMORY[0x1E0D3EA90]();
}

uint64_t sub_1D4005728()
{
  return MEMORY[0x1E0D3EAB8]();
}

uint64_t sub_1D4005734()
{
  return MEMORY[0x1E0D3EB18]();
}

uint64_t sub_1D4005740()
{
  return MEMORY[0x1E0D3EBB0]();
}

uint64_t sub_1D400574C()
{
  return MEMORY[0x1E0D3EC48]();
}

uint64_t sub_1D4005758()
{
  return MEMORY[0x1E0D3EC50]();
}

uint64_t sub_1D4005764()
{
  return MEMORY[0x1E0D3EC58]();
}

uint64_t sub_1D4005770()
{
  return MEMORY[0x1E0D3EC68]();
}

uint64_t sub_1D400577C()
{
  return MEMORY[0x1E0D3EC80]();
}

uint64_t sub_1D4005788()
{
  return MEMORY[0x1E0D3EC88]();
}

uint64_t sub_1D4005794()
{
  return MEMORY[0x1E0D3ED28]();
}

uint64_t sub_1D40057A0()
{
  return MEMORY[0x1E0D3ED78]();
}

uint64_t sub_1D40057AC()
{
  return MEMORY[0x1E0D3EF28]();
}

uint64_t sub_1D40057B8()
{
  return MEMORY[0x1E0D3EF38]();
}

uint64_t sub_1D40057C4()
{
  return MEMORY[0x1E0D3EF48]();
}

uint64_t sub_1D40057D0()
{
  return MEMORY[0x1E0DC61C0]();
}

uint64_t sub_1D40057DC()
{
  return MEMORY[0x1E0DC61D0]();
}

uint64_t sub_1D40057E8()
{
  return MEMORY[0x1E0DC61D8]();
}

uint64_t sub_1D40057F4()
{
  return MEMORY[0x1E0DC61E0]();
}

uint64_t sub_1D4005800()
{
  return MEMORY[0x1E0DC61E8]();
}

uint64_t sub_1D400580C()
{
  return MEMORY[0x1E0DC61F0]();
}

uint64_t sub_1D4005818()
{
  return MEMORY[0x1E0DC61F8]();
}

uint64_t sub_1D4005824()
{
  return MEMORY[0x1E0DC6200]();
}

uint64_t sub_1D4005830()
{
  return MEMORY[0x1E0DC6208]();
}

uint64_t sub_1D400583C()
{
  return MEMORY[0x1E0DC6218]();
}

uint64_t sub_1D4005848()
{
  return MEMORY[0x1E0DC6220]();
}

uint64_t sub_1D4005854()
{
  return MEMORY[0x1E0DC6228]();
}

uint64_t sub_1D4005860()
{
  return MEMORY[0x1E0DC6230]();
}

uint64_t sub_1D400586C()
{
  return MEMORY[0x1E0DC6238]();
}

uint64_t sub_1D4005878()
{
  return MEMORY[0x1E0DC6250]();
}

uint64_t sub_1D4005884()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_1D4005890()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1D400589C()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1D40058A8()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1D40058B4()
{
  return MEMORY[0x1E0CB1FC0]();
}

uint64_t sub_1D40058C0()
{
  return MEMORY[0x1E0CB1FC8]();
}

uint64_t sub_1D40058CC()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1D40058D8()
{
  return MEMORY[0x1E0DED9C8]();
}

uint64_t sub_1D40058E4()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1D40058F0()
{
  return MEMORY[0x1E0DEDF28]();
}

uint64_t sub_1D40058FC()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

CCCryptorStatus CCCrypt(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1E0C80088](*(_QWORD *)&op, *(_QWORD *)&alg, *(_QWORD *)&options, key, keyLength, iv, dataIn, dataInLength);
}

CCCryptorStatus CCCryptorCreateWithMode(CCOperation op, CCMode mode, CCAlgorithm alg, CCPadding padding, const void *iv, const void *key, size_t keyLength, const void *tweak, size_t tweakLength, int numRounds, CCModeOptions options, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x1E0C800A0](*(_QWORD *)&op, *(_QWORD *)&mode, *(_QWORD *)&alg, *(_QWORD *)&padding, iv, key, keyLength, tweak);
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return MEMORY[0x1E0C80108](cryptorRef);
}

CCCryptorStatus CCCryptorUpdate(CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1E0C80118](cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80370](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80378](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80380](c, data, *(_QWORD *)&len);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

uint64_t DiagnosticLogSubmissionEnabled()
{
  return MEMORY[0x1E0D1BCD8]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B28]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B48]();
}

uint64_t MKBDeviceFormattedForContentProtection()
{
  return MEMORY[0x1E0D4E470]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1E0D4E498]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

uint64_t OSAGetDATaskingValue()
{
  return MEMORY[0x1E0D1BCF0]();
}

uint64_t OSASetDATaskingValue()
{
  return MEMORY[0x1E0D1BD20]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1E0CD65A0](rnd, count, bytes);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

void operator delete(void *__p)
{
  off_1E95D8648(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E95D8650(__sz);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x1E0C81580](__buf, __nbytes);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C82638](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_main(void)
{
  MEMORY[0x1E0C82DF0]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

long double erfc(long double __x)
{
  long double result;

  MEMORY[0x1E0C831F8](__x);
  return result;
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

double lgamma_r(double a1, int *a2)
{
  double result;

  MEMORY[0x1E0C83B68](a2, a1);
  return result;
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

long double log1p(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BD0](__x);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
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

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
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

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

uint64_t proc_set_cpumon_defaults()
{
  return MEMORY[0x1E0C84C70]();
}

uint64_t proc_set_cpumon_params()
{
  return MEMORY[0x1E0C84C78]();
}

int puts(const char *a1)
{
  return MEMORY[0x1E0C84F60](a1);
}

uint64_t rootless_check_datavault_flag()
{
  return MEMORY[0x1E0C85140]();
}

uint64_t rootless_convert_to_datavault()
{
  return MEMORY[0x1E0C85150]();
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x1E0C85D80](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85D90](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x1E0C85D98](identifier, criteria, handler);
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
  MEMORY[0x1E0C85DB0](activity, criteria);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1E0C85DB8](activity, state);
}

void xpc_activity_unregister(const char *identifier)
{
  MEMORY[0x1E0C85DD0](identifier);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x1E0C85EF0](value);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1E0C86420](object1, object2);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1E0C86568](value);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1E0C86720](string);
}

