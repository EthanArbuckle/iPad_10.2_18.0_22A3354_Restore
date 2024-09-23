void sub_1A0339180(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0339364(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0339494(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A033956C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A03397D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A03398A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

const __CFString *NIAcwgSessionTriggerReasonToString(uint64_t a1)
{
  const __CFString *v1;
  const __CFString *v2;
  const __CFString *v3;

  v1 = CFSTR("DeviceCloserIntent");
  v2 = CFSTR("DeviceFallbackWalletInteractionIntent");
  v3 = CFSTR("LockSelfInitiated");
  if (a1 != 200)
    v3 = CFSTR("DeviceCloserIntent");
  if (a1 != 103)
    v2 = v3;
  if (a1 == 102)
    v1 = CFSTR("DeviceFallbackGeofenceEntryIntent");
  if (a1 == 101)
    v1 = CFSTR("DeviceFallbackWristRaiseIntent");
  if (a1 <= 102)
    return v1;
  else
    return v2;
}

const __CFString *NIAcwgSuspendTriggerReasonToString(uint64_t a1)
{
  const __CFString *result;
  const __CFString *v2;

  switch(a1)
  {
    case 'e':
      result = CFSTR("DeviceReceivedUnlockNotification");
      break;
    case 'f':
      result = CFSTR("DeviceStationary");
      break;
    case 'g':
      result = CFSTR("DeviceNITimeout");
      break;
    case 'h':
      result = CFSTR("DeviceNIInterrupted");
      break;
    case 'i':
      result = CFSTR("DeviceNIInvalidated");
      break;
    case 'j':
      result = CFSTR("DeviceNIError");
      break;
    case 'k':
      result = CFSTR("DeviceClientPause");
      break;
    default:
      v2 = CFSTR("DeviceFarther");
      if (a1 == 201)
        v2 = CFSTR("LockUnilaterallySuspended");
      if (a1 == 200)
        result = CFSTR("LockSelfInitiatedRequest");
      else
        result = v2;
      break;
  }
  return result;
}

void sub_1A0339A58(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0339B34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0339BC8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  if (__p)
    operator delete(__p);
  if (a12)
    operator delete(a12);
  _Unwind_Resume(exception_object);
}

void nsNumberArrayToStdVector<unsigned short>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  id v7;
  __int16 v8;
  __int16 v9;
  char *v10;
  void *v11;
  char *v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  __int16 v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  void *__p[2];
  char *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  __p[0] = 0;
  __p[1] = 0;
  v26 = 0;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = a1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  v20 = a2;
  if (v4)
  {
    v5 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(v3);
        v7 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * i);
        v8 = objc_msgSend(v7, "longLongValue");
        v9 = v8;
        v10 = (char *)__p[1];
        if (__p[1] >= v26)
        {
          v12 = (char *)__p[0];
          v13 = (char *)__p[1] - (char *)__p[0];
          if ((char *)__p[1] - (char *)__p[0] <= -3)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v14 = v13 >> 1;
          if (v26 - (char *)__p[0] <= (unint64_t)((v13 >> 1) + 1))
            v15 = v14 + 1;
          else
            v15 = v26 - (char *)__p[0];
          if ((unint64_t)(v26 - (char *)__p[0]) >= 0x7FFFFFFFFFFFFFFELL)
            v16 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v16 = v15;
          if (v16)
          {
            v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)&v26, v16);
            v12 = (char *)__p[0];
            v10 = (char *)__p[1];
          }
          else
          {
            v17 = 0;
          }
          v18 = &v17[2 * v14];
          *(_WORD *)v18 = v9;
          v11 = v18 + 2;
          while (v10 != v12)
          {
            v19 = *((_WORD *)v10 - 1);
            v10 -= 2;
            *((_WORD *)v18 - 1) = v19;
            v18 -= 2;
          }
          __p[0] = v18;
          __p[1] = v11;
          v26 = &v17[2 * v16];
          if (v12)
            operator delete(v12);
        }
        else
        {
          *(_WORD *)__p[1] = v8;
          v11 = v10 + 2;
        }
        __p[1] = v11;

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v4);
  }

  *(_OWORD *)v20 = *(_OWORD *)__p;
  *(_QWORD *)(v20 + 16) = v26;

}

void sub_1A0339DE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20)
{
  void *v20;

  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void nsNumberArrayToStdVector<unsigned char>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  char v9;
  char v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  size_t v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  char v21;
  char *v22;
  uint64_t *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  char *v29;
  char *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v28 = 0;
  v29 = 0;
  v30 = 0;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v3 = a1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
  v23 = a2;
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(v3);
        v8 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "longLongValue");
        v10 = v9;
        if (v5 >= v30)
        {
          v11 = v28;
          v12 = &v5[-v28];
          v13 = (uint64_t)&v5[-v28 + 1];
          if (v13 < 0)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v14 = (unint64_t)&v30[-v28];
          if (2 * (uint64_t)&v30[-v28] > (unint64_t)v13)
            v13 = 2 * v14;
          if (v14 >= 0x3FFFFFFFFFFFFFFFLL)
            v15 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v15 = v13;
          if (v15)
            v16 = (char *)operator new(v15);
          else
            v16 = 0;
          v17 = &v12[(_QWORD)v16];
          v18 = &v12[(_QWORD)v16];
          *v18 = v10;
          v19 = v18 + 1;
          if (v5 != (char *)v11)
          {
            v20 = &v5[~v11];
            do
            {
              v21 = *--v5;
              (v20--)[(_QWORD)v16] = v21;
            }
            while (v5 != (char *)v11);
            v5 = (char *)v28;
            v17 = v16;
          }
          v28 = (uint64_t)v17;
          v29 = v19;
          v30 = &v16[v15];
          if (v5)
            operator delete(v5);
          v5 = v19;
        }
        else
        {
          *v5++ = v9;
        }
        v29 = v5;

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
    }
    while (v4);
    v4 = v28;
    v22 = v30;
  }
  else
  {
    v22 = 0;
    v5 = 0;
  }

  *v23 = v4;
  v23[1] = (uint64_t)v5;
  v23[2] = (uint64_t)v22;

}

void sub_1A033A020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21)
{
  void *v21;

  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_1A033A120(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A033A1F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A033A3EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A033A5AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A033A684(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A033A868(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A033A9B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A033AA8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A033AC04(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A033AD30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A033ADCC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A033AEE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A033AFC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A033B038(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void std::vector<unsigned short>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E4361988, MEMORY[0x1E0DE42D0]);
}

void sub_1A033B0AC(_Unwind_Exception *a1)
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(2 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E0DE4E98], MEMORY[0x1E0DE4390]);
}

uint64_t rose::alisha::AcwgM1MsgStruct::AcwgM1MsgStruct(uint64_t a1, uint64_t a2, uint64_t a3, char a4, int a5)
{
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  std::vector<unsigned short>::__init_with_size[abi:ne180100]<unsigned short *,unsigned short *>((_QWORD *)a1, *(const void **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 1);
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>((_QWORD *)(a1 + 24), *(const void **)a3, *(_QWORD *)(a3 + 8), *(_QWORD *)(a3 + 8) - *(_QWORD *)a3);
  *(_BYTE *)(a1 + 48) = a4;
  *(_DWORD *)(a1 + 52) = a5;
  return a1;
}

void sub_1A033B1AC(_Unwind_Exception *exception_object)
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

_QWORD *std::vector<unsigned short>::__init_with_size[abi:ne180100]<unsigned short *,unsigned short *>(_QWORD *result, const void *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<unsigned short>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1A033B224(_Unwind_Exception *exception_object)
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

char *std::vector<unsigned short>::__vallocate[abi:ne180100](_QWORD *a1, uint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 < 0)
    std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[2 * v4];
  return result;
}

_QWORD *std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(_QWORD *result, const void *a2, uint64_t a3, size_t __sz)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (__sz)
  {
    v6 = result;
    result = std::vector<unsigned char>::__vallocate[abi:ne180100](result, __sz);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1A033B2D8(_Unwind_Exception *exception_object)
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
    std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
  result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

double combinedQuaternionFromAoA(float a1, float a2)
{
  __float2 v3;
  __float2 v4;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  double result;
  float32x4_t v10;

  v3 = __sincosf_stret(a1 * 0.5);
  v10 = vmulq_n_f32((float32x4_t)xmmword_1A036EEA0, v3.__sinval);
  v4 = __sincosf_stret(a2 * 0.5);
  v5 = vmulq_n_f32((float32x4_t)xmmword_1A036EEB0, v4.__sinval);
  v6.i32[0] = LODWORD(v4.__cosval);
  v6.f32[1] = -v5.f32[2];
  v6.i32[2] = v5.i32[1];
  *(float32x2_t *)v7.f32 = vneg_f32(*(float32x2_t *)v5.f32);
  v6.i32[3] = v7.i32[0];
  v8.i32[0] = vdupq_laneq_s32((int32x4_t)v5, 2).u32[0];
  v8.i32[1] = LODWORD(v4.__cosval);
  v8.i64[1] = v7.i64[0];
  v7.i32[0] = vdup_lane_s32(*(int32x2_t *)v7.f32, 1).u32[0];
  v7.i32[1] = v5.i32[0];
  v7.i32[2] = LODWORD(v4.__cosval);
  v7.f32[3] = -v5.f32[2];
  v5.i32[3] = LODWORD(v4.__cosval);
  *(_QWORD *)&result = vmlaq_n_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v6, v10.f32[0]), v8, *(float32x2_t *)v10.f32, 1), v7, v10, 2), v5, v3.__cosval).u64[0];
  return result;
}

__n64 unitVectorForAoAInNearbydCoordinates(float *a1)
{
  __float2 v2;
  float cosval;
  __n64 result;

  v2 = __sincosf_stret(*a1);
  cosval = __sincosf_stret(a1[4]).__cosval;
  result.n64_u32[0] = LODWORD(v2.__sinval);
  result.n64_f32[1] = v2.__cosval * cosval;
  return result;
}

double unitVectorForAoAInSpatialCoordinates(float *a1)
{
  __float2 v2;

  v2 = __sincosf_stret(*a1);
  return COERCE_DOUBLE(__PAIR64__(v2.__cosval * __sincosf_stret(a1[1]).__sinval, LODWORD(v2.__sinval)));
}

float convertAoAFromNearbydCoordinatesToSpatialCoordinates(float *a1)
{
  float v2;
  float v3;
  __float2 v4;

  v2 = *a1;
  v3 = cosf(*a1);
  v4 = __sincosf_stret(a1[1]);
  atan2f(v3 * v4.__cosval, -(float)(v3 * v4.__sinval));
  return v2;
}

float calculateAoAFromUnitVectorInSpatialCoordinates(float a1, float a2, float a3)
{
  float v3;
  float v4;
  float v5;
  float v6;

  v3 = a3;
  v4 = a2;
  v5 = sqrtf((float)((float)(a2 * a2) + (float)(a1 * a1)) + (float)(a3 * a3));
  if (v5 >= 0.000001)
  {
    a1 = a1 / v5;
    v4 = v4 / v5;
    v3 = a3 / v5;
  }
  v6 = asinf(a1);
  atan2f(v4, -v3);
  return v6;
}

void sub_1A033BE38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  void *v24;
  void *v25;
  id *v26;
  id *v27;
  void *v28;

  objc_destroyWeak(v27);
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1A033BED4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A033BF1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A033BF8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A033BFE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A033C120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;
  void *v21;
  void *v22;

  _Block_object_dispose(&a15, 8);
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

void sub_1A033C3FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A033C53C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A033C698(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A033C7F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A033C948(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A033CA88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A033CCBC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A033D058(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);

  _Unwind_Resume(a1);
}

void sub_1A033D0C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A033D170(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A033D26C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A033D534(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A033D648(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A033D894(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A033D90C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A033DA78(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A033DB58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  _Unwind_Resume(exception_object);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_1A033DC80(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A033DDE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__550(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)(a2 + 48);
  v3 = *(_OWORD *)(a2 + 64);
  v4 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v4;
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v3;
  return result;
}

void sub_1A033E000(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A033E088(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A033E268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  void *v22;

  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1A033E328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1A033E520(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A033E6AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A033E900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  void *v20;

  _Unwind_Resume(a1);
}

void sub_1A033E97C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A033E9D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A033EA7C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A033EC8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1A033ED50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A033EDDC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A033EE64(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A033F124(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A033F258(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A033F584(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1A033F674(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1A033F6DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A033F734(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A033F868(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A033F8C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A033F978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1A033F9DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A033FB0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1A033FB74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A033FD10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1A033FD94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A033FE64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A033FF38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A033FFD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1A0340030(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A03400E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A03401AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1A0340214(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A03402E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1A0340348(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A0340414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1A034047C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A0340534(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A03405E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A0340694(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A034073C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1A0340798(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A03408F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1A0340970(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A0340A98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1A0340B00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A0340C34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0340C98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A0340F20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,void *a23)
{
  void *v23;
  void *v24;
  void *v25;

  _Unwind_Resume(a1);
}

void sub_1A0341004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A0341068(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

__CFString *NIAlgorithmConvergenceStatusReasonDescription_Private(void *a1)
{
  __CFString *v1;
  __CFString *v2;
  __CFString *v3;
  const __CFString *v4;
  __CFString *v5;

  v1 = a1;
  v2 = v1;
  if (v1 == CFSTR("insufficientSignalStrength"))
  {
    v4 = CFSTR("NIALGORITHMCONVERGENCESTATUSREASON_INSUFFICIENTSIGNALSTRENGTH");
LABEL_12:
    +[NILocalization _niLocalizedStringFromFrameworkBundleWithKey:](NILocalization, "_niLocalizedStringFromFrameworkBundleWithKey:", v4);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (v1 == CFSTR("insufficientHorizontalSweep"))
  {
    v4 = CFSTR("NIALGORITHMCONVERGENCESTATUSREASON_INSUFFICIENTHORIZONTALSWEEP");
    goto LABEL_12;
  }
  if (v1 == CFSTR("insufficientVerticalSweep"))
  {
    v4 = CFSTR("NIALGORITHMCONVERGENCESTATUSREASON_INSUFFICIENTVERTICALSWEEP");
    goto LABEL_12;
  }
  if (v1 == CFSTR("insufficientMovement"))
  {
    v4 = CFSTR("NIALGORITHMCONVERGENCESTATUSREASON_INSUFFICIENTMOVEMENT");
    goto LABEL_12;
  }
  if (v1 == CFSTR("insufficientLighting"))
  {
    v4 = CFSTR("NIALGORITHMCONVERGENCESTATUSREASON_INSUFFICIENTLIGHTING");
    goto LABEL_12;
  }
  v3 = v1;
LABEL_13:
  v5 = v3;

  return v5;
}

void sub_1A0341148(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

NSString *__cdecl NIAlgorithmConvergenceStatusReasonDescription(const NIAlgorithmConvergenceStatusReason reason)
{
  NIAlgorithmConvergenceStatusReasonDescription_Private(reason);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_1A0341538(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0341764(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id a18)
{
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1A0341858(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0341904(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A03419A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0341B24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A0341E0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v1;

  _Unwind_Resume(a1);
}

void sub_1A0341F04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A03423AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A034248C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0342508(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A03425A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0342614(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0342670(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A0342854(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A03428A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A0342C24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0342DA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0342EE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0343078(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A03430D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A0343204(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A034334C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A034340C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A0343574(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A03436AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1A034371C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A03437D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0343A1C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0343AA8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0343B10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A0343C90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A0343DA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A0343E28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0343FE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A034411C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A03441A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0344248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1A03442A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A034438C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0344410(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A03444B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1A0344510(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A0344584(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A03445F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A0344734(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A034479C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A03448B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A034491C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A0344A04(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0344AD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1A0344B40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A0344BB8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0344D54(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0344DE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A0344F84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0345010(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A03451B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0345240(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A03453E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0345470(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A03455E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0345668(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A03457E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0345860(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A0345A18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A0345B14(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0345BD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1A0345DF0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0345F9C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A034602C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0346150(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A03461B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A0346340(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A03463C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0346460(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A03465BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A034660C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A03466F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0346748(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A03467FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A03468B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A0346960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A0346A70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A0346B54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A0346BCC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0346CD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A0346D38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A0346F80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1A0347038(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A03473D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A03474C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A03477EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A03478CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A0347AAC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0347B40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A0347D20(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0347DB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A0348008(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A03480A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A0348110(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0348174(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A03482A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A0348320(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A03484BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0348548(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A034871C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1A03487B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void NINotifySystemShutdownWithReason(uint64_t a1, void *a2)
{
  void (**v3)(id, _QWORD);
  void *v4;
  void *v5;
  dispatch_semaphore_t v6;
  NSObject *v7;
  dispatch_time_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  NSObject *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[NIServerConnection createOneShotConnectionAndResume:](NIServerConnection, "createOneShotConnectionAndResume:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 1;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  v6 = dispatch_semaphore_create(0);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __NINotifySystemShutdownWithReason_block_invoke;
  v16 = &unk_1E4362958;
  v18 = &v26;
  v19 = &v20;
  v7 = v6;
  v17 = v7;
  objc_msgSend(v5, "notifySystemShutdownWithReason:reply:", a1, &v13);
  v8 = dispatch_time(0, (uint64_t)(*(double *)&kNISystemShutdownCompletionTimeoutSeconds * 1000000000.0));
  dispatch_semaphore_wait(v7, v8);
  objc_msgSend(v4, "invalidate", v13, v14, v15, v16);
  if (*((_BYTE *)v27 + 24))
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v30 = *MEMORY[0x1E0CB2D50];
    v31[0] = CFSTR("Shutdown notification timed out.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v21[5];
    v21[5] = v11;

  }
  v3[2](v3, v21[5]);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

}

void sub_1A0348A48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, ...)
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  va_list va;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v15 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  v20 = va_arg(va1, _QWORD);
  v21 = va_arg(va1, id);
  v13 = v12;

  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);

  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<UWBSessionInterruptionBookkeeping>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(16 * a2);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1A0348DC0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A0348FCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A0349390(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A03497FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0349B44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0349DC8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A034A1AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,void *a30)
{
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;

  _Unwind_Resume(a1);
}

void sub_1A034A5F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A034A754(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A034A824(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A034A928(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A034AA58(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A034AB18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A034AC50(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A034AD38(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A034AE94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A034AF44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A034B03C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A034B15C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A034B200(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A034B2CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A034B3D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A034B460(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A034B4D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A034B5C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A034B6E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A034BA04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A034BBF0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A034BD14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A034BE64(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A034C158(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1A034C330(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A034C42C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A034C584(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A034C684(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A034C8E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A034CA2C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A034CB1C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A034CBD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A034CDF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1A034CFB4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A034D0DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A034D2DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A034D46C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  void *v22;
  void *v23;
  void *v24;

  _Block_object_dispose(&a17, 8);
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

void sub_1A034D55C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A034D650(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A034D6F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A034D788(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A034D854(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A034D93C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A034DA44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;

  _Block_object_dispose(&a15, 8);

  _Unwind_Resume(a1);
}

void sub_1A034DB38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1A034DC6C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A034DD50(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A034DE38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A034DF64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A034E004(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A034E0A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A034E144(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A034E2A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A034E368(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A034E4BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  operator delete(v4);
  operator delete(v3);

  _Unwind_Resume(a1);
}

void sub_1A034E674(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A034E798(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A034E8AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A034EB04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A034EBAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A034ED88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A034EEF0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A034F08C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A034F544(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1A034F6D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A034F924(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A034F9EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A034FB18(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A034FC20(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A034FED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1A035012C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A0350290(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A03503EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A03505DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A03506D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A035078C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A03509C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v7 = v5;

  _Unwind_Resume(a1);
}

void sub_1A0350B38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1A0350C40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0350D30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

_QWORD *std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(_QWORD *result, const void *a2, uint64_t a3, size_t __sz)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (__sz)
  {
    v6 = result;
    result = std::vector<unsigned char>::__vallocate[abi:ne180100](result, __sz);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1A0350E38(_Unwind_Exception *exception_object)
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

void sub_1A035107C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1A03511C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0351324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1A035147C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A03515E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1A0351740(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A0351AA8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

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

void sub_1A0351EA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30)
{
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  v37 = v36;

  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a17, 8);

  _Unwind_Resume(a1);
}

void sub_1A0352294(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A03526A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;

  v34 = v32;

  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a23, 8);

  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1A0352AF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;

  v34 = v32;

  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a23, 8);

  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1A0352F28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;

  v34 = v32;

  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a23, 8);

  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1A0353210(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A03532C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A03534C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A035362C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0353750(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0353944(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0353B54(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0353CD8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0353E7C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0354200(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A0354558(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A03545B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A03548FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A0354E58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,void *a28,void *a29,void *a30,void *a31)
{
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  _Unwind_Resume(a1);
}

void sub_1A0354F58()
{
  JUMPOUT(0x1A0354F48);
}

void sub_1A0355604(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  _Unwind_Resume(a1);
}

void sub_1A03556E4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 160) = v0;
  JUMPOUT(0x1A03556D4);
}

void sub_1A0355C60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13)
{
  uint64_t v13;
  float v14;
  double v15;
  float v16;
  float v17;
  double v18;
  float v19;

  if (v16 != v19)
  if (v15 != v18)

  if (v14 != v17)
  _Unwind_Resume(a1);
}

void sub_1A0355D70()
{
  JUMPOUT(0x1A0355CCCLL);
}

void sub_1A0355D78()
{
  JUMPOUT(0x1A0355CD0);
}

void sub_1A0355D80()
{
  JUMPOUT(0x1A0355CD4);
}

void sub_1A0355D88()
{
  JUMPOUT(0x1A0355CD8);
}

void sub_1A0355D90()
{
  JUMPOUT(0x1A0355CF0);
}

void sub_1A0355D98()
{
  JUMPOUT(0x1A0355CF8);
}

void sub_1A0355DA0()
{
  JUMPOUT(0x1A0355D00);
}

void sub_1A0355DA8()
{
  JUMPOUT(0x1A0355D38);
}

void sub_1A0355DB0()
{
  JUMPOUT(0x1A0355D40);
}

void sub_1A0355DB8()
{
  JUMPOUT(0x1A0355CE8);
}

void sub_1A0355DC0()
{
  JUMPOUT(0x1A0355CE0);
}

void sub_1A0355DC8()
{
  JUMPOUT(0x1A0355D08);
}

void sub_1A0355DD0()
{
  JUMPOUT(0x1A0355D30);
}

uint64_t extractHashFromSimdFloat3(__n128 a1)
{
  void *v1;
  uint64_t v2;
  double v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "hash");
  HIDWORD(v3) = a1.n128_u32[1];
  LODWORD(v3) = a1.n128_u32[1];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[2])));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ v2 ^ objc_msgSend(v6, "hash");

  return v7;
}

void sub_1A0355E7C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A0356094(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A03565F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  double v3;
  double v4;

  if (v3 != v4)

  _Unwind_Resume(a1);
}

void sub_1A0356714(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A0356A7C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0356B8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A0356C38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0356D40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A0356F24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A0357034(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A03571C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0357320(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1A0357368()
{
  JUMPOUT(0x1A0357358);
}

void sub_1A0357448(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0357598(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A03576F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A0357864(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A0357974(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A0357BC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A0357E40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0357F94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A03580D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0358AF8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0358B6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0358C34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A0358D94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1A0358DF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A0358F10(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0359018(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A03592A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A03594E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A03595D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A03596FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A03599E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A0359B04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A0359C24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A0359C84(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0359CD4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0359DF8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A0359EDC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0359F6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A035A1AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1A035A324(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A035A43C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id NIErrorWithCodeAndUserInfo(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = a1 + 5889;
  if ((unint64_t)(a1 + 5889) <= 9)
  {
    v6 = *((_QWORD *)&off_1E4362BD8 + v5);
    v7 = *((_QWORD *)&off_1E4362C28 + v5);
    +[NILocalization _niLocalizedStringFromFrameworkBundleWithKey:](NILocalization, "_niLocalizedStringFromFrameworkBundleWithKey:", *((_QWORD *)&off_1E4362B88 + v5));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CB2D50]);

    +[NILocalization _niLocalizedStringFromFrameworkBundleWithKey:](NILocalization, "_niLocalizedStringFromFrameworkBundleWithKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CB2D68]);

    +[NILocalization _niLocalizedStringFromFrameworkBundleWithKey:](NILocalization, "_niLocalizedStringFromFrameworkBundleWithKey:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CB2D80]);

  }
  if (v3)
    objc_msgSend(v4, "addEntriesFromDictionary:", v3);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), a1, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id NIInternalErrorWithCodeAndUserInfo(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  switch(a1)
  {
    case -19889:
      v6 = CFSTR("Check the message from the vehicle for format violation");
      v7 = CFSTR("The session was given an invalid or unexpected DCK message.");
      goto LABEL_25;
    case -19888:
      v6 = CFSTR("Try again or check the vehicle");
      v7 = CFSTR("The session was expecting a response from the vehicle and did not receive it for over the allowed time.");
      goto LABEL_25;
    case -19887:
      v6 = CFSTR("Event from bluetooth is corrupted");
      v7 = CFSTR("The bluetooth event provided to the session was of an invalid type or contained invalid values.");
      goto LABEL_25;
    case -19886:
      v6 = CFSTR("Check the logs for specific internal error");
      v7 = CFSTR("The given debug key was invalid or the system was not able to set it. Inspect error message.");
      goto LABEL_25;
    case -19885:
      v6 = CFSTR("Vehicle possibly changed its ranging capabilities");
      v7 = CFSTR("The capabilities specified in a DCK message are not supported. An action should be taken to indicate this to the vehicle.");
      goto LABEL_25;
    case -19884:
      v6 = CFSTR("Try again at a later time");
      v7 = CFSTR("A DCK request to recover a suspended ranging session has been received, but recovery has failed. An action should be taken to indicate this to the vehicle.");
      goto LABEL_25;
    case -19883:
      v6 = CFSTR("Most likely an internal error, try again.");
      v7 = CFSTR("URSKs could not be deleted");
      goto LABEL_25;
    case -19882:
      v6 = CFSTR("Pick one of the supported policies");
      v7 = CFSTR("The priority provided to the session was of an invalid type or contained invalid values");
      goto LABEL_25;
    case -19881:
      v6 = CFSTR("Check the event notification parameters or format");
      v7 = CFSTR("The session was notified of a Car Key event, but the event or its parameters were invalid");
LABEL_25:
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CB2D68]);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CB2D80]);
      break;
    default:
      v6 = CFSTR("Check Bluetooth settings, status and configuration.");
      v7 = CFSTR("Bluetooth is currently unavailable.");
      switch(a1)
      {
        case -10017:
          goto LABEL_25;
        case -10016:
          v7 = CFSTR("Failed to produce a Discovery Token.");
          goto LABEL_25;
        case -10015:
        case -10009:
          goto LABEL_26;
        case -10014:
          v6 = CFSTR("Monitor session suspension callbacks. Try again when suspension ends.");
          v7 = CFSTR("Usage while suspended.");
          goto LABEL_25;
        case -10013:
          v6 = CFSTR("Ensure region predicates are using NIDevicePresencePreset. Use NIRegionPredicate initWithName:devicePresencePreset: initializer. Ensure the smaller region predicate is specified as the inner boundary.");
          v7 = CFSTR("Region predicate verification failed.");
          goto LABEL_25;
        case -10012:
          v6 = CFSTR("Ensure peer discovery token was generated correctly.");
          v7 = CFSTR("Peer discovery token was either invalid or did not contain required information for specialized session.");
          goto LABEL_25;
        case -10011:
          v6 = CFSTR("Try running the session again at a later time. Implement throttling if necessary.");
          v7 = CFSTR("Activation reply not received. The server may be unavailable right now.");
          goto LABEL_25;
        case -10010:
          v6 = CFSTR("Check the errors and run the session again.");
          v7 = CFSTR("Camera Assistance ARSession failed.");
          goto LABEL_25;
        case -10008:
          v6 = CFSTR("No action needed as the session completed successfully");
          v7 = CFSTR("The session completed successfully");
          goto LABEL_25;
        default:
          switch(a1)
          {
            case -19703:
              v6 = CFSTR("Wrong UWB session ID possibly");
              v7 = CFSTR("Indicates URSK corresponding to the UWB Session Identifier is not found.");
              goto LABEL_25;
            case -19702:
              v6 = CFSTR("Rework the message parameters or fix the order");
              v7 = CFSTR("Indicates use of unsupported message or message format.");
              goto LABEL_25;
            case -19701:
              v6 = CFSTR("Try again later");
              v7 = CFSTR("Indicates internal resource unavailability.");
              goto LABEL_25;
            case -19700:
              v6 = CFSTR("Check the logs for specific internal error");
              v7 = CFSTR("No specific reason for failure is indicated.");
              goto LABEL_25;
            default:
              goto LABEL_26;
          }
      }
  }
LABEL_26:
  if (v3)
    objc_msgSend(v5, "addEntriesFromDictionary:", v3);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), a1, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void sub_1A035ABAC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A035AD64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A035AF78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A035B234(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A035B500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21,void *a22,void *a23)
{
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;

  _Unwind_Resume(a1);
}

void sub_1A035B580()
{
  JUMPOUT(0x1A035B538);
}

void sub_1A035B588()
{
  JUMPOUT(0x1A035B540);
}

void sub_1A035B590()
{
  JUMPOUT(0x1A035B548);
}

void sub_1A035B598()
{
  JUMPOUT(0x1A035B550);
}

void sub_1A035B5A0()
{
  JUMPOUT(0x1A035B558);
}

void sub_1A035B5A8()
{
  JUMPOUT(0x1A035B560);
}

void sub_1A035B5B0()
{
  JUMPOUT(0x1A035B568);
}

void sub_1A035B5B8()
{
  JUMPOUT(0x1A035B570);
}

void sub_1A035B644(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A035B950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27)
{
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;

  _Unwind_Resume(a1);
}

void sub_1A035BA00()
{
  JUMPOUT(0x1A035B9C0);
}

void sub_1A035BA14()
{
  JUMPOUT(0x1A035B9C8);
}

void sub_1A035BA24()
{
  JUMPOUT(0x1A035B9D0);
}

void sub_1A035BA34()
{
  JUMPOUT(0x1A035B9D8);
}

void sub_1A035BA44()
{
  JUMPOUT(0x1A035B9E0);
}

void sub_1A035BA54()
{
  JUMPOUT(0x1A035B9E4);
}

void sub_1A035BA60()
{
  JUMPOUT(0x1A035B9E8);
}

void sub_1A035BA68()
{
  JUMPOUT(0x1A035B9F0);
}

void sub_1A035BC24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A035BCF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A035BDFC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A035BF4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A035C040(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A035C0EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A035C1F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A035C300(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A035C454(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A035C524(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A035C660(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A035C7D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A035C890(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A035C924(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A035CBA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A035CC2C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A035CD54(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A035CDEC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A035CE90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A035CF34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A035CFE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A035D0FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A035D260(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A035D38C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A035D488(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

const __CFString *NIRegionSizeCategoryToString(uint64_t a1)
{
  if (!a1)
    return CFSTR("Default");
  if (a1 != 10)
    -[NIRegionPredicate descriptionInternal].cold.1();
  return CFSTR("Large");
}

double PRCommonConvertTicksToSeconds(unint64_t a1)
{
  double v2;
  uint32_t denom;
  uint32_t numer;
  uint32_t v5;
  unsigned int v6;
  uint32_t v7;
  uint32_t v8;
  mach_timebase_info info;

  v2 = *(double *)&PRCommonConvertTicksToSeconds(unsigned long long)::ticksToSeconds;
  if (*(double *)&PRCommonConvertTicksToSeconds(unsigned long long)::ticksToSeconds == 0.0)
  {
    if (mach_timebase_info(&info))
      PRCommonConvertTicksToSeconds();
    if (info.denom)
    {
      denom = info.denom;
      numer = info.numer;
      do
      {
        v5 = denom;
        denom = numer % denom;
        numer = v5;
      }
      while (denom);
    }
    else
    {
      v5 = info.numer;
    }
    v6 = 1000000000;
    v7 = info.numer / v5;
    do
    {
      v8 = v7;
      v7 = v6;
      v6 = v8 % v6;
    }
    while (v6);
    v2 = (double)(info.numer / v5 / v7) / (double)(0x3B9ACA00 / v7 * (unint64_t)(info.denom / v5));
    *(double *)&PRCommonConvertTicksToSeconds(unsigned long long)::ticksToSeconds = v2;
  }
  return v2 * (double)a1;
}

double PRCommonGetMachTimeSeconds(void)
{
  uint64_t v0;

  v0 = mach_absolute_time();
  return PRCommonConvertTicksToSeconds(v0);
}

double PRCommonGetMachContinuousTimeSeconds(void)
{
  uint64_t v0;

  v0 = mach_continuous_time();
  return PRCommonConvertTicksToSeconds(v0);
}

BOOL PRCommonGetAllTimes(double *a1, double *a2, double *a3)
{
  int times;
  uint64_t v8;
  uint64_t v9;

  times = mach_get_times();
  if (!times)
  {
    if (a1)
      *a1 = (double)v9 / 1000000000.0 + (double)v8 - *MEMORY[0x1E0C9ADF8];
    if (a2)
      *a2 = PRCommonConvertTicksToSeconds(0);
    if (a3)
      *a3 = PRCommonConvertTicksToSeconds(0);
  }
  return times == 0;
}

id PRCommonConvertNSDataToHexNSString(NSData *a1, int a2)
{
  NSData *v3;
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  id v6;
  void **v7;
  std::string::size_type v8;
  std::string *v9;
  void *v10;
  void *__p[2];
  unsigned __int8 v13;
  void *v14;
  unsigned __int8 *v15;
  std::string v16;

  v3 = a1;
  memset(&v16, 0, sizeof(v16));
  std::vector<unsigned char>::vector(&v14, -[NSData length](v3, "length"));
  -[NSData getBytes:length:](v3, "getBytes:length:", v14, -[NSData length](v3, "length"));
  v4 = (unsigned __int8 *)v14;
  v5 = v15;
  if (v14 == v15)
  {
    v9 = &v16;
  }
  else
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02X"), *v4);
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v6, "UTF8String"));

      if ((v13 & 0x80u) == 0)
        v7 = __p;
      else
        v7 = (void **)__p[0];
      if ((v13 & 0x80u) == 0)
        v8 = v13;
      else
        v8 = (std::string::size_type)__p[1];
      if (a2)
        std::string::insert(&v16, 0, (const std::string::value_type *)v7, v8);
      else
        std::string::append(&v16, (const std::string::value_type *)v7, v8);
      if ((char)v13 < 0)
        operator delete(__p[0]);
      ++v4;
    }
    while (v4 != v5);
    if ((v16.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v9 = &v16;
    else
      v9 = (std::string *)v16.__r_.__value_.__r.__words[0];
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (unsigned __int8 *)v14;
    operator delete(v14);
  }
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v16.__r_.__value_.__l.__data_);

  return v10;
}

void sub_1A035D980(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  void *v24;

  if (a24 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

id PRCommonConvertHexNSStringToNSData(NSString *a1)
{
  NSString *v1;
  void *v2;
  BOOL v3;
  unint64_t v4;
  uint64_t v5;
  char *p_p;
  unint64_t v7;
  unint64_t v8;
  char __str[2];
  __int16 v11;
  void *__p;
  unint64_t v13;
  unsigned __int8 v14;

  v1 = a1;
  if ((-[NSString length](v1, "length") & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)-[NSString UTF8String](objc_retainAutorelease(v1), "UTF8String"));
    v2 = (void *)objc_opt_new();
    v11 = 0;
    v3 = (v14 & 0x80u) != 0;
    v4 = v14;
    if ((v14 & 0x80u) != 0)
      v4 = v13;
    if (v4 >= 2)
    {
      v5 = 0;
      do
      {
        if (v3)
          p_p = (char *)__p;
        else
          p_p = (char *)&__p;
        *(_WORD *)__str = *(_WORD *)&p_p[v5];
        HIBYTE(v11) = strtol(__str, 0, 16);
        objc_msgSend(v2, "appendBytes:length:", (char *)&v11 + 1, 1);
        v7 = v5 + 3;
        v5 += 2;
        v3 = (v14 & 0x80u) != 0;
        v8 = v14;
        if ((v14 & 0x80u) != 0)
          v8 = v13;
      }
      while (v8 > v7);
    }
    if ((char)v14 < 0)
      operator delete(__p);
  }

  return v2;
}

void sub_1A035DAEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

char *PRCommonSerializePrintableState(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = (void *)MEMORY[0x1A1AF8270]();
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v4, 200, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "length") > 0x8000)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WARNING: statedump too big (%d > %d)"), objc_msgSend(v6, "length"), 0x8000);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB38B0];
    v15 = v3;
    v16[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dataWithPropertyList:format:options:error:", v9, 200, 0, 0);
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v10;
  }
  v11 = (char *)malloc_type_calloc(1uLL, objc_msgSend(v6, "length") + 200, 0x7E1CA1B2uLL);
  *(_DWORD *)v11 = 1;
  *((_DWORD *)v11 + 1) = objc_msgSend(v6, "length");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[nearbyd] %@"), v3);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  strlcpy(v11 + 136, (const char *)objc_msgSend(v12, "UTF8String"), 0x40uLL);

  v13 = objc_retainAutorelease(v6);
  memcpy(v11 + 200, (const void *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"));

  objc_autoreleasePoolPop(v5);
  return v11;
}

{
  id v3;
  id v4;
  void *v5;
  char *v6;
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v8 = v3;
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = PRCommonSerializePrintableState(v3, v5);

  return v6;
}

void sub_1A035DD0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1A035DE10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
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

void sub_1A035DE8C(_Unwind_Exception *exception_object)
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

void sub_1A035E54C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A035E5E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A035E69C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A035E76C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A035E838(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A035E920(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A035EA04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A035EA90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A035EB48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A035EBFC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A035ECA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id UWBMakeSessionServerXPCInterface()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  _QWORD v68[3];
  uint64_t v69;
  _QWORD v70[2];
  _QWORD v71[6];
  _QWORD v72[3];
  _QWORD v73[6];

  v73[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE59EEC8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc(MEMORY[0x1E0C99E60]);
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v66 = (void *)objc_msgSend(v1, "initWithObjects:", v2, v3, objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:");
  v4 = objc_alloc(MEMORY[0x1E0C99E60]);
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v65 = (void *)objc_msgSend(v4, "initWithObjects:", v5, v6, v7, objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:");
  v8 = objc_alloc(MEMORY[0x1E0C99E60]);
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v64 = (void *)objc_msgSend(v8, "initWithObjects:", v9, v10, objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:");
  v11 = objc_alloc(MEMORY[0x1E0C99E20]);
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v67 = (void *)objc_msgSend(v11, "initWithObjects:", v12, v13, v14, v15, v16, objc_opt_class(), 0);
  v73[0] = objc_opt_class();
  v73[1] = objc_opt_class();
  v73[2] = objc_opt_class();
  v73[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 4);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "addObjectsFromArray:");
  v72[0] = objc_opt_class();
  v72[1] = objc_opt_class();
  v72[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 3);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "addObjectsFromArray:");
  v71[0] = objc_opt_class();
  v71[1] = objc_opt_class();
  v71[2] = objc_opt_class();
  v71[3] = objc_opt_class();
  v71[4] = objc_opt_class();
  v71[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 6);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "addObjectsFromArray:");
  v70[0] = objc_opt_class();
  v70[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 2);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "addObjectsFromArray:");
  v69 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "addObjectsFromArray:");
  v68[0] = objc_opt_class();
  v68[1] = objc_opt_class();
  v68[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 3);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "addObjectsFromArray:");
  v17 = objc_alloc(MEMORY[0x1E0C99E60]);
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  v61 = (void *)objc_msgSend(v17, "initWithObjects:", v18, v19, objc_opt_class(), 0);
  objc_msgSend(v67, "setByAddingObjectsFromSet:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_runWithConfiguration_reply_, 0, 0);

  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel__addObject_reply_, 0, 0);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel__removeObject_reply_, 0, 0);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_processDCKMessage_reply_, 0, 0);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_processDCKMessage_reply_, 0, 1);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_processDCKMessage_reply_, 1, 1);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_processBluetoothHostTimeSyncWithType_btcClockTicks_eventCounter_reply_, 0, 1);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_isRangingLimitExceeded_, 1, 1);
  v21 = objc_alloc(MEMORY[0x1E0C99E60]);
  v22 = objc_opt_class();
  v23 = objc_opt_class();
  v56 = (void *)objc_msgSend(v21, "initWithObjects:", v22, v23, objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:");
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel__processCarKeyEvent_reply_, 0, 1);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_processAcwgM1Msg_withSessionTriggerReason_, 0, 0);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_processAcwgM3Msg_, 0, 0);
  v24 = objc_alloc(MEMORY[0x1E0C99E60]);
  v25 = objc_opt_class();
  v53 = (void *)objc_msgSend(v24, "initWithObjects:", v25, objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:");
  v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:");
  v26 = objc_alloc(MEMORY[0x1E0C99E60]);
  v27 = objc_opt_class();
  v55 = (void *)objc_msgSend(v26, "initWithObjects:", v27, objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:");
  v28 = objc_alloc(MEMORY[0x1E0C99E60]);
  v29 = objc_opt_class();
  v30 = (void *)objc_msgSend(v28, "initWithObjects:", v29, objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_setLocalDeviceCanInteract_withDiscoveryTokens_reply_, 1, 0);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setLocalDeviceCanInteract_withDiscoveryTokens_reply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_setLocalDeviceInteractableDiscoveryTokens_reply_, 0, 0);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setLocalDeviceInteractableDiscoveryTokens_reply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_getInteractableDiscoveryTokens_, 0, 1);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getInteractableDiscoveryTokens_, 1, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_getActivelyInteractingDiscoveryTokens_, 0, 1);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getActivelyInteractingDiscoveryTokens_, 1, 1);
  v31 = objc_alloc(MEMORY[0x1E0C99E60]);
  v32 = objc_opt_class();
  v33 = objc_opt_class();
  v52 = (void *)objc_msgSend(v31, "initWithObjects:", v32, v33, objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:");
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getLocalDevicePrintableState_, 1, 1);
  v34 = objc_alloc(MEMORY[0x1E0C99E60]);
  v35 = objc_opt_class();
  v36 = objc_opt_class();
  v37 = objc_opt_class();
  v38 = objc_opt_class();
  v39 = objc_opt_class();
  v40 = objc_opt_class();
  v41 = objc_opt_class();
  v42 = (void *)objc_msgSend(v34, "initWithObjects:", v35, v36, v37, v38, v39, v40, v41, objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v42, sel__processFindingEvent_reply_, 0, 0);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel__processFindingEvent_reply_, 0, 1);
  v43 = objc_alloc(MEMORY[0x1E0C99E60]);
  v44 = objc_opt_class();
  v45 = objc_opt_class();
  v46 = (void *)objc_msgSend(v43, "initWithObjects:", v44, v45, objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v46, sel_setLocalDeviceDebugParameters_reply_, 0, 0);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setLocalDeviceDebugParameters_reply_, 0, 1);
  v47 = objc_alloc(MEMORY[0x1E0C99E60]);
  v48 = objc_opt_class();
  v49 = objc_opt_class();
  v50 = (void *)objc_msgSend(v47, "initWithObjects:", v48, v49, objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v50, sel__processSystemEvent_reply_, 0, 0);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel__processSystemEvent_reply_, 0, 1);

  return v0;
}

void sub_1A035F940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28,void *a29,void *a30,void *a31,void *a32,void *a33)
{
  void *v33;

  _Unwind_Resume(a1);
}

id UWBMakeSessionDelegateXPCInterface()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE598B38);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_didUpdateLocalDiscoveryToken_, 0, 0);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_uwbSessionDidInvalidateWithError_, 0, 0);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_uwbSessionDidFailWithError_, 0, 0);
  v1 = objc_alloc(MEMORY[0x1E0C99E60]);
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = (void *)objc_msgSend(v1, "initWithObjects:", v2, v3, v4, v5, v6, objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_didUpdateNearbyObjects_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_didRemoveNearbyObjects_withReason_, 0, 0);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_didDiscoverNearbyObject_, 0, 0);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_object_didUpdateRegion_previousRegion_, 0, 0);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_object_didUpdateRegion_previousRegion_, 1, 0);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_object_didUpdateRegion_previousRegion_, 2, 0);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_relayDCKMessage_, 0, 0);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_didProcessAcwgM1MsgWithResponse_error_, 0, 0);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_didProcessAcwgM3MsgWithResponse_error_, 0, 0);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_didProcessAcwgRangingSessionResumeRequestMsgWithResponse_error_, 0, 0);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_didReceiveRangingAuthRecommendation_forObject_, 1, 0);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_didUpdateAlgorithmState_forObject_, 0, 0);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_didUpdateAlgorithmState_forObject_, 1, 0);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_systemDidUpdateState_, 0, 0);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_systemDidUpdateResourceUsageLimitExceeded_forSessionConfigurationTypeWithName_, 1, 0);

  return v0;
}

void sub_1A035FE58(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

const __CFString *UWBSessionInterruptionReasonInternalToString(unint64_t a1)
{
  if (a1 > 7)
    return CFSTR("AirplaneModeActive");
  else
    return off_1E4362CB8[a1];
}

const __CFString *UWBTrackingStopReasonInternalToString(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("Timeout");
  if (a1 == 1)
    v1 = CFSTR("PeerEnded");
  if (a1 == 2)
    return CFSTR("LocalForceRemoved");
  else
    return v1;
}

void sub_1A0360034(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A0360130(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0360200(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A036039C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1A0360508(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0360634(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A03606E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0360898(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0360988(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A0360AA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0360C00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0360C98(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0360E28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

unint64_t NINearbyObject.distance.getter()
{
  return sub_1A0360FAC((SEL *)&selRef_distance, &NINearbyObjectDistanceNotAvailable_Private);
}

double NINearbyObject.direction.getter()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  BOOL v3;
  float v4;
  float v5;
  __int128 v7;
  __int128 v8;

  objc_msgSend(v0, sel_direction);
  v2 = 0;
  while (1)
  {
    v7 = v1;
    v4 = *(float *)((unint64_t)&v7 & 0xFFFFFFFFFFFFFFF3 | (4 * (v2 & 3)));
    v8 = NINearbyObjectDirectionNotAvailable_Private;
    v5 = *(float *)((unint64_t)&v8 & 0xFFFFFFFFFFFFFFF3 | (4 * (v2 & 3)));
    v3 = v4 == v5;
    if (v2 == 2)
      break;
    while (1)
    {
      ++v2;
      if (v3)
        break;
      if (v2 == 2)
        goto LABEL_8;
      v3 = 0;
    }
  }
  if (v4 != v5)
LABEL_8:
    objc_msgSend(v0, sel_direction, v7, v8);
  return *(double *)&v1;
}

unint64_t NINearbyObject.horizontalAngle.getter()
{
  return sub_1A0360FAC((SEL *)&selRef_horizontalAngle, &NINearbyObjectAngleNotAvailable_Private);
}

unint64_t NINearbyObject.horizontalAngleAccuracy.getter()
{
  return sub_1A0360FAC((SEL *)&selRef_horizontalAngleAccuracy, &NINearbyObjectAngleNotAvailable_Private);
}

unint64_t sub_1A0360FAC(SEL *a1, float *a2)
{
  void *v2;
  float v5;
  float v6;
  float v7;
  uint64_t v8;
  unsigned int v9;

  objc_msgSend(v2, *a1);
  v6 = v5;
  v7 = *a2;
  if (v5 == *a2)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v2, *a1);
    v8 = v9;
  }
  return v8 | ((unint64_t)(v6 == v7) << 32);
}

uint64_t sub_1A0361030(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  unint64_t v7;
  uint64_t *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a1 + 16);
  v5 = a2 + 32;
  swift_bridgeObjectRetain();
  result = swift_bridgeObjectRetain();
  v7 = 0;
  v8 = (uint64_t *)(a1 + 40);
  while (v7 == v3)
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v7 = v3;
    if (!v4)
      goto LABEL_19;
LABEL_10:
    v14 = *(v8 - 1);
    v12 = *v8;
    swift_bridgeObjectRetain();
    if (!v10)
      goto LABEL_19;
    if (!v12)
      goto LABEL_16;
    if (v11 == v14 && v10 == v12)
    {
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
    }
    else
    {
      v9 = sub_1A03628A0();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      if ((v9 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        goto LABEL_20;
      }
    }
    --v4;
    v8 += 2;
  }
  if (v7 >= v3)
  {
    __break(1u);
    return result;
  }
  v13 = (uint64_t *)(v5 + 16 * v7);
  v11 = *v13;
  v10 = v13[1];
  swift_bridgeObjectRetain();
  if (v4)
  {
    ++v7;
    goto LABEL_10;
  }
  if (v10)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
  v12 = 0;
LABEL_19:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v12)
  {
LABEL_20:
    swift_bridgeObjectRelease();
    return 0;
  }
  return 1;
}

uint64_t NIAlgorithmConvergenceStatus.Reason.rawValue.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t NIAlgorithmConvergenceStatus.Reason.rawValue.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*NIAlgorithmConvergenceStatus.Reason.rawValue.modify())()
{
  return nullsub_1;
}

NearbyInteraction::NIAlgorithmConvergenceStatus::Reason __swiftcall NIAlgorithmConvergenceStatus.Reason.init(rawValue:)(NearbyInteraction::NIAlgorithmConvergenceStatus::Reason rawValue)
{
  NearbyInteraction::NIAlgorithmConvergenceStatus::Reason *v1;

  *v1 = rawValue;
  return rawValue;
}

uint64_t NIAlgorithmConvergenceStatus.Reason.localizedDescription.getter()
{
  void *v0;
  __CFString *v1;
  uint64_t v2;

  v0 = (void *)sub_1A036284C();
  v1 = NIAlgorithmConvergenceStatusReasonDescription_Private(v0);

  v2 = sub_1A0362870();
  return v2;
}

uint64_t sub_1A036128C()
{
  sub_1A03628AC();
  swift_bridgeObjectRetain();
  sub_1A036287C();
  swift_bridgeObjectRelease();
  return sub_1A03628B8();
}

uint64_t sub_1A03612E4()
{
  swift_bridgeObjectRetain();
  sub_1A036287C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A0361328()
{
  sub_1A03628AC();
  swift_bridgeObjectRetain();
  sub_1A036287C();
  swift_bridgeObjectRelease();
  return sub_1A03628B8();
}

uint64_t sub_1A036137C(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_1A03628A0();
}

_QWORD *sub_1A03613AC@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = result[1];
  *a2 = *result;
  a2[1] = v2;
  return result;
}

uint64_t sub_1A03613B8@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1A03613C4()
{
  uint64_t result;
  uint64_t v1;

  result = sub_1A0362870();
  qword_1EE596048 = result;
  unk_1EE596050 = v1;
  return result;
}

uint64_t *sub_1A03613F0()
{
  if (qword_1EE596040 != -1)
    swift_once();
  return &qword_1EE596048;
}

uint64_t static NIAlgorithmConvergenceStatus.Reason.insufficientSignalStrength.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_1A0361680(&qword_1EE596040, &qword_1EE596048, &qword_1EE596050, a1);
}

uint64_t sub_1A0361450()
{
  uint64_t result;
  uint64_t v1;

  result = sub_1A0362870();
  qword_1EE596060 = result;
  *(_QWORD *)algn_1EE596068 = v1;
  return result;
}

uint64_t *sub_1A036147C()
{
  if (qword_1EE596058 != -1)
    swift_once();
  return &qword_1EE596060;
}

uint64_t static NIAlgorithmConvergenceStatus.Reason.insufficientHorizontalSweep.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_1A0361680(&qword_1EE596058, &qword_1EE596060, (uint64_t *)algn_1EE596068, a1);
}

uint64_t sub_1A03614DC()
{
  uint64_t result;
  uint64_t v1;

  result = sub_1A0362870();
  qword_1EE596078 = result;
  unk_1EE596080 = v1;
  return result;
}

uint64_t *sub_1A0361508()
{
  if (qword_1EE596070 != -1)
    swift_once();
  return &qword_1EE596078;
}

uint64_t static NIAlgorithmConvergenceStatus.Reason.insufficientVerticalSweep.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_1A0361680(&qword_1EE596070, &qword_1EE596078, &qword_1EE596080, a1);
}

uint64_t sub_1A0361568()
{
  uint64_t result;
  uint64_t v1;

  result = sub_1A0362870();
  qword_1EE596090 = result;
  *(_QWORD *)algn_1EE596098 = v1;
  return result;
}

uint64_t *sub_1A0361594()
{
  if (qword_1EE596088 != -1)
    swift_once();
  return &qword_1EE596090;
}

uint64_t static NIAlgorithmConvergenceStatus.Reason.insufficientMovement.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_1A0361680(&qword_1EE596088, &qword_1EE596090, (uint64_t *)algn_1EE596098, a1);
}

uint64_t sub_1A03615F4()
{
  uint64_t result;
  uint64_t v1;

  result = sub_1A0362870();
  qword_1EE5960A8 = result;
  unk_1EE5960B0 = v1;
  return result;
}

uint64_t *sub_1A0361620()
{
  if (qword_1EE5960A0 != -1)
    swift_once();
  return &qword_1EE5960A8;
}

uint64_t static NIAlgorithmConvergenceStatus.Reason.insufficientLighting.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_1A0361680(&qword_1EE5960A0, &qword_1EE5960A8, qword_1EE5960B0, a1);
}

uint64_t sub_1A0361680@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X1>, uint64_t *a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v7;

  if (*a1 != -1)
    swift_once();
  v7 = *a3;
  *a4 = *a2;
  a4[1] = v7;
  return swift_bridgeObjectRetain();
}

id NIAlgorithmConvergence.status.getter@<X0>(uint64_t *a1@<X8>)
{
  void *v1;
  id result;
  id v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;

  result = objc_msgSend(v1, sel_status);
  if (!result)
    goto LABEL_10;
  if (result == (id)2)
  {
    v8 = 1;
    goto LABEL_13;
  }
  if (result == (id)1)
  {
    v4 = objc_msgSend(v1, sel_reasonsPrivate);
    type metadata accessor for Reason(0);
    v5 = sub_1A0362888();

    v6 = *(_QWORD *)(v5 + 16);
    if (v6)
    {
      v15 = MEMORY[0x1E0DEE9D8];
      sub_1A0361C54(0, v6, 0);
      v7 = 0;
      v8 = v15;
      do
      {
        v9 = sub_1A0362870();
        v11 = v10;
        v13 = *(_QWORD *)(v15 + 16);
        v12 = *(_QWORD *)(v15 + 24);
        if (v13 >= v12 >> 1)
          sub_1A0361C54((char *)(v12 > 1), v13 + 1, 1);
        ++v7;
        *(_QWORD *)(v15 + 16) = v13 + 1;
        v14 = v15 + 16 * v13;
        *(_QWORD *)(v14 + 32) = v9;
        *(_QWORD *)(v14 + 40) = v11;
      }
      while (v6 != v7);
      result = (id)swift_bridgeObjectRelease();
    }
    else
    {
      result = (id)swift_bridgeObjectRelease();
      v8 = MEMORY[0x1E0DEE9D8];
    }
  }
  else
  {
LABEL_10:
    v8 = 0;
  }
LABEL_13:
  *a1 = v8;
  return result;
}

void __swiftcall NISession.worldTransform(for:)(simd_float4x4_optional *__return_ptr retstr, NINearbyObject *a2)
{
  void *v2;
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  int v8;

  objc_msgSend(v2, sel_worldTransformForObject_, a2);
  v8 = vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(v5, *(float32x4_t *)algn_1EE596610), (int8x16_t)vceqq_f32(v4, (float32x4_t)NINearbyObjectWorldTransformNotAvailable_Private)), vandq_s8((int8x16_t)vceqq_f32(v6, (float32x4_t)xmmword_1EE596620), (int8x16_t)vceqq_f32(v7, unk_1EE596630))));
  if (v8 < 0)
  {
    v4 = 0uLL;
    v5 = 0uLL;
    v6 = 0uLL;
    v7 = 0uLL;
  }
  retstr->value.columns[0] = (simd_float4)v4;
  retstr->value.columns[1] = (simd_float4)v5;
  retstr->value.columns[2] = (simd_float4)v6;
  retstr->value.columns[3] = (simd_float4)v7;
  retstr->is_nil = v8 < 0;
}

uint64_t sub_1A03618C0(uint64_t a1, uint64_t a2)
{
  return sub_1A0361AE0(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB1940]);
}

uint64_t sub_1A03618CC(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_1A0362858();
  *a2 = 0;
  return result;
}

uint64_t sub_1A0361940(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_1A0362864();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1A03619BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_1A0362870();
  v2 = sub_1A036284C();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1A03619FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_1A036284C();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1A0361A40@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1A0362870();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1A0361A68()
{
  sub_1A0362264(&qword_1EE595FF0, (uint64_t)&unk_1A036F278);
  sub_1A0362264(&qword_1EE595FF8, (uint64_t)&unk_1A036F218);
  return sub_1A0362894();
}

uint64_t sub_1A0361AD4(uint64_t a1, uint64_t a2)
{
  return sub_1A0361AE0(a1, a2, MEMORY[0x1E0DEA950]);
}

uint64_t sub_1A0361AE0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_1A0362870();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1A0361B1C()
{
  sub_1A0362870();
  sub_1A036287C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A0361B5C()
{
  uint64_t v0;

  sub_1A0362870();
  sub_1A03628AC();
  sub_1A036287C();
  v0 = sub_1A03628B8();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1A0361BCC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_1A0362870();
  v2 = v1;
  if (v0 == sub_1A0362870() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_1A03628A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

char *sub_1A0361C54(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_1A0361C70(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_1A0361C70(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE596000);
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
    v10 = (char *)MEMORY[0x1E0DEE9D8];
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
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t _s17NearbyInteraction28NIAlgorithmConvergenceStatusO2eeoiySbAC_ACtFZ_0(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  char v5;

  v2 = *a1;
  v3 = *a2;
  if (!*a1)
  {
    if (!v3)
    {
      v4 = 0;
      v5 = 1;
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  if (v2 != 1)
  {
    if (v3 >= 2)
    {
      sub_1A036230C(*a2);
      sub_1A036230C(v2);
      sub_1A036230C(v2);
      sub_1A036230C(v3);
      v5 = sub_1A0361030(v3, v2);
      sub_1A036231C(v2);
      sub_1A036231C(v3);
      v4 = v3;
      v3 = v2;
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  if (v3 != 1)
  {
LABEL_8:
    sub_1A036230C(*a1);
    sub_1A036230C(v3);
    v5 = 0;
    v4 = v2;
    goto LABEL_10;
  }
  v4 = 1;
  v5 = 1;
LABEL_10:
  sub_1A036231C(v4);
  sub_1A036231C(v3);
  return v5 & 1;
}

void type metadata accessor for Reason(uint64_t a1)
{
  sub_1A0362340(a1, &qword_1EE595FD0);
}

unint64_t sub_1A0361E5C()
{
  unint64_t result;

  result = qword_1EE595FC8;
  if (!qword_1EE595FC8)
  {
    result = MEMORY[0x1A1AF8570](&protocol conformance descriptor for NIAlgorithmConvergenceStatus.Reason, &type metadata for NIAlgorithmConvergenceStatus.Reason);
    atomic_store(result, (unint64_t *)&qword_1EE595FC8);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for NIAlgorithmConvergenceStatus(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF)
    v3 = swift_bridgeObjectRetain();
  *a1 = v3;
  return a1;
}

unint64_t destroy for NIAlgorithmConvergenceStatus(unint64_t *a1)
{
  unint64_t result;

  result = *a1;
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease();
  return result;
}

unint64_t *assignWithCopy for NIAlgorithmConvergenceStatus(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;
  unint64_t v4;

  v3 = *a1;
  v4 = *a2;
  if (v3 < 0xFFFFFFFF)
  {
    *a1 = v4;
    if (v4 >= 0xFFFFFFFF)
      swift_bridgeObjectRetain();
  }
  else if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    *a1 = *a2;
  }
  else
  {
    *a1 = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

unint64_t *assignWithTake for NIAlgorithmConvergenceStatus(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;

  v3 = *a2;
  if (*a1 < 0xFFFFFFFF)
    goto LABEL_5;
  if (v3 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *a1 = v3;
    return a1;
  }
  *a1 = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for NIAlgorithmConvergenceStatus(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFE && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 2147483646);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 1;
  if (v4 >= 3)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for NIAlgorithmConvergenceStatus(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_DWORD *)result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2 + 1;
  }
  return result;
}

uint64_t sub_1A0362090(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_1A03620A8(_QWORD *result, int a2)
{
  unsigned int v2;

  if (a2 < 0)
  {
    v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2)
      return result;
    v2 = a2 - 1;
  }
  *result = v2;
  return result;
}

ValueMetadata *type metadata accessor for NIAlgorithmConvergenceStatus()
{
  return &type metadata for NIAlgorithmConvergenceStatus;
}

_QWORD *initializeBufferWithCopyOfBuffer for NIAlgorithmConvergenceStatus.Reason(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for NIAlgorithmConvergenceStatus.Reason()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for NIAlgorithmConvergenceStatus.Reason(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for NIAlgorithmConvergenceStatus.Reason(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for NIAlgorithmConvergenceStatus.Reason(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for NIAlgorithmConvergenceStatus.Reason(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for NIAlgorithmConvergenceStatus.Reason()
{
  return &type metadata for NIAlgorithmConvergenceStatus.Reason;
}

uint64_t sub_1A036221C()
{
  return sub_1A0362264(&qword_1EE595FD8, (uint64_t)&unk_1A036F1DC);
}

uint64_t sub_1A0362240()
{
  return sub_1A0362264(&qword_1EE595FE0, (uint64_t)&unk_1A036F1B0);
}

uint64_t sub_1A0362264(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for Reason(255);
    result = MEMORY[0x1A1AF8570](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1A03622A4()
{
  return sub_1A0362264(&qword_1EE595FE8, (uint64_t)&unk_1A036F24C);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1A1AF8564]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_1A036230C(unint64_t result)
{
  if (result >= 2)
    return swift_bridgeObjectRetain();
  return result;
}

unint64_t sub_1A036231C(unint64_t result)
{
  if (result >= 2)
    return swift_bridgeObjectRelease();
  return result;
}

void type metadata accessor for __NIAlgorithmConvergenceStatus(uint64_t a1)
{
  sub_1A0362340(a1, &qword_1EE596008);
}

void sub_1A0362340(uint64_t a1, unint64_t *a2)
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

void PRCommonConvertTicksToSeconds()
{
  __assert_rtn("PRCommonConvertTicksToSeconds", "PRCommon.mm", 43, "timebaseResult == KERN_SUCCESS");
}

uint64_t sub_1A036284C()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1A0362858()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1A0362864()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1A0362870()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1A036287C()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1A0362888()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1A0362894()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1A03628A0()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1A03628AC()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1A03628B8()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

uint64_t CUPrintNSObjectMasked()
{
  return MEMORY[0x1E0D1ABD8]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1E0DE2B68]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

uint64_t NSRandomData()
{
  return MEMORY[0x1E0D1B228]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

uint64_t OPACKDecodeData()
{
  return MEMORY[0x1E0D1B4C0]();
}

uint64_t OPACKEncoderCreateData()
{
  return MEMORY[0x1E0D1B4D0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
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

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4428](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4470](this, __pos, __s, __n);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete(void *__p)
{
  off_1E43619A0(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E43619A8(__sz);
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

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

float asinf(float a1)
{
  float result;

  MEMORY[0x1E0C815A0](a1);
  return result;
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C81628](a1, a2);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

float cosf(float a1)
{
  float result;

  MEMORY[0x1E0C82B48](a1);
  return result;
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
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

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

uint64_t mach_get_times()
{
  return MEMORY[0x1E0C83C88]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x1E0DE7C30](dest, src, size, atomic, hasStrong);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

