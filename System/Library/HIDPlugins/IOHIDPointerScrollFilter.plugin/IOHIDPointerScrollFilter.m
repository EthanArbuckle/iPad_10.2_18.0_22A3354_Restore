_QWORD *IOHIDSimpleAccelerator::serialize(IOHIDSimpleAccelerator *this, __CFDictionary *a2)
{
  void *v4;
  CFMutableDictionaryRef theDict;

  v4 = (void *)0xAAAAAAAAAAAAAAAALL;
  theDict = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
  sub_23111BEFC(&v4, a2, 0);
  v4 = &unk_2500015D8;
  CFDictionarySetValue(theDict, CFSTR("Class"), CFSTR("IOHIDSimpleAccelerator"));
  sub_23111B770((uint64_t)&v4, CFSTR("Multiplier"), vcvtd_n_u64_f64(*((double *)this + 1), 0x10uLL));
  return sub_23111BFF0(&v4);
}

void sub_23111B75C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_23111BFF0(&a9);
  _Unwind_Resume(a1);
}

_QWORD *sub_23111B770(uint64_t a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  void *value;

  sub_23111C0A8(&v6, a3);
  if (a2 && value)
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 8), a2, value);
  return sub_23111C114(&v6);
}

void sub_23111B7C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_23111C114(&a9);
  _Unwind_Resume(a1);
}

BOOL IOHIDSimpleAccelerator::accelerate(IOHIDSimpleAccelerator *this, double *a2, uint64_t a3)
{
  double v3;

  v3 = *((double *)this + 1);
  if (v3 != 1.0 && a3 != 0)
  {
    do
    {
      *a2 = *((double *)this + 1) * *a2;
      ++a2;
      --a3;
    }
    while (a3);
  }
  return v3 != 1.0;
}

BOOL IOHIDScrollAccelerator::accelerate(IOHIDScrollAccelerator *this, double *a2, unint64_t a3, uint64_t a4, double a5, double a6, double a7)
{
  double v9;
  int v10;
  uint64_t v11;
  double *v12;
  int v13;
  int v14;
  unsigned int v15;
  double v16;
  int v17;
  double v18;
  double v19;
  unsigned int v20;
  int v21;
  double *v22;
  double v23;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;

  LODWORD(a6) = IOHIDScrollAccelerator::_timebase;
  LODWORD(a7) = dword_255EB52A4;
  v9 = (double)(unint64_t)(a4 - *((_QWORD *)this + 4))
     * (double)*(unint64_t *)&a6
     / (double)*(unint64_t *)&a7
     / 1000000.0;
  *((_QWORD *)this + 4) = a4;
  v10 = *((_DWORD *)this + 4);
  v11 = *((int *)this + 5);
  v12 = (double *)((char *)this + 16 * v11);
  v12[8] = v9;
  v12[9] = fabs(*a2);
  v13 = ((int)v11 + 1) % 9;
  *((_DWORD *)this + 5) = v13;
  if (v13 == v10)
  {
    v10 = (char)(v13 + 1 - 9 * ((((57 * (char)(v13 + 1)) & 0x8000) != 0) + ((57 * (char)(v13 + 1)) >> 9)));
    *((_DWORD *)this + 4) = v10;
  }
  v14 = *a2 > 0.0;
  if (*((unsigned __int8 *)this + 24) != v14 || v9 > 500.0)
  {
    *((_DWORD *)this + 4) = v11;
    *((_BYTE *)this + 24) = v14;
    v10 = v11;
  }
  v15 = 0;
  v16 = 0.0;
  v17 = 16;
  v18 = 150.0;
  v19 = 0.0;
  while (1)
  {
    v20 = v15;
    v21 = v17;
    if (v13)
      --v13;
    else
      v13 = 8;
    v22 = (double *)((char *)this + 16 * v13);
    v23 = v22[8];
    v19 = v19 + v22[9];
    if (v23 > 150.0)
      break;
    v16 = v16 + v23;
    v17 += 16;
    v15 = v20 + 1;
    if (v16 >= 500.0 || v13 == v10)
      goto LABEL_18;
  }
  v16 = v16 + 150.0;
LABEL_18:
  v25 = *((double *)this + 6) / 67.0;
  v26 = (double)(int)(v20 + 1);
  v27 = v16 / v26 * v25;
  if (v27 <= 150.0)
  {
    v18 = v27;
    if (v27 < 1.0)
      v18 = 1.0;
  }
  v28 = v25 * (v19 / v26 * (v18 * -0.0145721436 + v18 * 0.0000305175781 * v18 + 1.50099182));
  if (v28 >= 0.0000152587891)
    v29 = v28;
  else
    v29 = 0.0000152587891;
  if ((*(unsigned int (**)(_QWORD))(**((_QWORD **)this + 1) + 24))(*((_QWORD *)this + 1)))
  {
    v30 = (*(double (**)(_QWORD, double))(**((_QWORD **)this + 1) + 16))(*((_QWORD *)this + 1), v29);
    v31 = *a2;
    v32 = v30 / v29;
  }
  else
  {
    if (v20 >= 2)
      v29 = sqrt((double)v21) * v29 * 0.25;
    v33 = (*(double (**)(_QWORD, double))(**((_QWORD **)this + 1) + 16))(*((_QWORD *)this + 1), v29);
    v31 = *a2;
    v32 = v33 / fabs(*a2);
  }
  *a2 = v32 * v31 * 0.100006104;
  return v32 != 1.0;
}

_QWORD *IOHIDScrollAccelerator::serialize(IOHIDScrollAccelerator *this, __CFDictionary *a2)
{
  uint64_t v3;
  unint64_t v5;
  void *value;
  void *v7;
  CFMutableDictionaryRef theDict;

  v7 = (void *)0xAAAAAAAAAAAAAAAALL;
  theDict = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
  sub_23111BEFC(&v7, a2, 0);
  v7 = &unk_2500015D8;
  CFDictionarySetValue(theDict, CFSTR("Class"), CFSTR("IOHIDScrollAccelerator"));
  sub_23111B770((uint64_t)&v7, CFSTR("Resolution"), vcvtd_n_u64_f64(*((double *)this + 5), 0x10uLL));
  sub_23111B770((uint64_t)&v7, CFSTR("Rate"), vcvtd_n_u64_f64(*((double *)this + 6), 0x10uLL));
  v5 = 0xAAAAAAAAAAAAAAAALL;
  value = (void *)0xAAAAAAAAAAAAAAAALL;
  sub_23111C040(&v5, 0);
  v3 = *((_QWORD *)this + 1);
  if (v3)
    (*(void (**)(uint64_t, void *))(*(_QWORD *)v3 + 32))(v3, value);
  if (value)
    CFDictionarySetValue(theDict, CFSTR("Accelerator"), value);
  sub_23111BFF0(&v5);
  return sub_23111BFF0(&v7);
}

void sub_23111BB90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23111BFF0((uint64_t *)va);
  _Unwind_Resume(a1);
}

BOOL IOHIDPointerAccelerator::accelerate(IOHIDPointerAccelerator *this, float64x2_t *a2, unint64_t a3, uint64_t a4, double a5, double a6, double a7, double a8)
{
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v9 = *((double *)this + 4);
  v10 = 1.0;
  if (v9 != 0.0)
  {
    LODWORD(a7) = IOHIDPointerAccelerator::_timebase;
    LODWORD(a8) = dword_255EB52AC;
    v11 = (double)(unint64_t)(a4 - *((_QWORD *)this + 2))
        * (double)*(unint64_t *)&a7
        / (double)*(unint64_t *)&a8
        / 1000000.0;
    v10 = 1.0;
    if (v11 != 0.0)
    {
      v12 = 1000.0 / v9;
      if (v11 >= v12)
        v13 = v11;
      else
        v13 = v12;
      v10 = v12 / v13;
    }
  }
  *((_QWORD *)this + 2) = a4;
  v14 = floor(sqrt(a2->f64[0] * a2->f64[0] + a2->f64[1] * a2->f64[1]));
  if (*((double *)this + 5) != 1.0)
    v10 = *((double *)this + 5);
  v15 = v10 * v14;
  if (v15 >= 0.0000152587891)
    v16 = v15;
  else
    v16 = 0.0000152587891;
  v17 = (*(double (**)(_QWORD, double))(**((_QWORD **)this + 1) + 16))(*((_QWORD *)this + 1), v16) / v16;
  *a2 = vmulq_n_f64(*a2, v17);
  return v17 != 1.0;
}

_QWORD *IOHIDPointerAccelerator::serialize(IOHIDPointerAccelerator *this, __CFDictionary *a2)
{
  uint64_t v3;
  unint64_t v5;
  void *value;
  void *v7;
  CFMutableDictionaryRef theDict;

  v7 = (void *)0xAAAAAAAAAAAAAAAALL;
  theDict = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
  sub_23111BEFC(&v7, a2, 0);
  v7 = &unk_2500015D8;
  CFDictionarySetValue(theDict, CFSTR("Class"), CFSTR("IOHIDPointerAccelerator"));
  sub_23111B770((uint64_t)&v7, CFSTR("Resolution"), vcvtd_n_u64_f64(*((double *)this + 3), 0x10uLL));
  sub_23111B770((uint64_t)&v7, CFSTR("Rate"), vcvtd_n_u64_f64(*((double *)this + 4), 0x10uLL));
  v5 = 0xAAAAAAAAAAAAAAAALL;
  value = (void *)0xAAAAAAAAAAAAAAAALL;
  sub_23111C040(&v5, 0);
  v3 = *((_QWORD *)this + 1);
  if (v3)
    (*(void (**)(uint64_t, void *))(*(_QWORD *)v3 + 32))(v3, value);
  if (value)
    CFDictionarySetValue(theDict, CFSTR("Accelerator"), value);
  sub_23111BFF0(&v5);
  return sub_23111BFF0(&v7);
}

void sub_23111BD9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23111BFF0((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_23111BDC8()
{
  JUMPOUT(0x2348D2B0CLL);
}

_QWORD *sub_23111BDDC(_QWORD *a1)
{
  uint64_t v2;

  *a1 = &off_250001548;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_23111BE1C(_QWORD *a1)
{
  uint64_t v1;

  *a1 = &off_250001548;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  JUMPOUT(0x2348D2B0CLL);
}

_QWORD *sub_23111BE6C(_QWORD *a1)
{
  uint64_t v2;

  *a1 = &off_250001590;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_23111BEAC(_QWORD *a1)
{
  uint64_t v1;

  *a1 = &off_250001590;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  JUMPOUT(0x2348D2B0CLL);
}

_QWORD *sub_23111BEFC(_QWORD *a1, CFTypeRef cf, char a3)
{
  CFTypeID v6;
  CFTypeRef v7;

  if (cf)
  {
    v6 = CFGetTypeID(cf);
    if (v6 == CFDictionaryGetTypeID())
      v7 = cf;
    else
      v7 = 0;
    *a1 = &unk_250001658;
    a1[1] = v7;
    if (v7 && (a3 & 1) == 0)
      CFRetain(v7);
  }
  else
  {
    a1[1] = 0;
  }
  *a1 = &unk_250001638;
  return a1;
}

void sub_23111BF7C(_QWORD *a1)
{
  sub_23111BFF0(a1);
  JUMPOUT(0x2348D2B0CLL);
}

void sub_23111BFA4(_QWORD *a1)
{
  sub_23111BFF0(a1);
  JUMPOUT(0x2348D2B0CLL);
}

void sub_23111BFCC(_QWORD *a1)
{
  sub_23111BFF0(a1);
  JUMPOUT(0x2348D2B0CLL);
}

_QWORD *sub_23111BFF0(_QWORD *a1)
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &unk_250001658;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

void sub_23111C030(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

_QWORD *sub_23111C040(_QWORD *a1, int a2)
{
  *a1 = &unk_2500015D8;
  a1[1] = CFDictionaryCreateMutable(0, a2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  return a1;
}

void sub_23111C090(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_23111BFF0(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_23111C0A8(_QWORD *a1, uint64_t a2)
{
  uint64_t valuePtr;

  valuePtr = a2;
  *a1 = &unk_250001678;
  a1[1] = 0;
  a1[1] = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt64Type, &valuePtr);
  return a1;
}

void sub_23111C100(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_23111C114(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_23111C114(_QWORD *a1)
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &unk_2500016C0;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

void sub_23111C154(_QWORD *a1)
{
  sub_23111C114(a1);
  JUMPOUT(0x2348D2B0CLL);
}

void sub_23111C17C(_QWORD *a1)
{
  sub_23111C114(a1);
  JUMPOUT(0x2348D2B0CLL);
}

void IOHIDParametricAcceleration::GetCurve(IOHIDParametricAcceleration *this@<X0>, const __CFString *a2@<X2>, uint64_t a3@<X8>)
{
  __int128 v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;

  *(_QWORD *)(a3 + 48) = -1;
  *(_QWORD *)&v6 = -1;
  *((_QWORD *)&v6 + 1) = -1;
  *(_OWORD *)(a3 + 16) = v6;
  *(_OWORD *)(a3 + 32) = v6;
  *(_OWORD *)a3 = v6;
  *(double *)a3 = IOHIDParametricAcceleration::GetCurveParameter(this, (const __CFDictionary *)CFSTR("HIDAccelIndex"), a2);
  *(double *)(a3 + 8) = IOHIDParametricAcceleration::GetCurveParameter(this, (const __CFDictionary *)CFSTR("HIDAccelGainLinear"), v7);
  *(double *)(a3 + 16) = IOHIDParametricAcceleration::GetCurveParameter(this, (const __CFDictionary *)CFSTR("HIDAccelGainParabolic"), v8);
  *(double *)(a3 + 24) = IOHIDParametricAcceleration::GetCurveParameter(this, (const __CFDictionary *)CFSTR("HIDAccelGainCubic"), v9);
  *(double *)(a3 + 32) = IOHIDParametricAcceleration::GetCurveParameter(this, (const __CFDictionary *)CFSTR("HIDAccelGainQuartic"), v10);
  *(double *)(a3 + 40) = IOHIDParametricAcceleration::GetCurveParameter(this, (const __CFDictionary *)CFSTR("HIDAccelTangentSpeedLinear"), v11);
  *(double *)(a3 + 48) = IOHIDParametricAcceleration::GetCurveParameter(this, (const __CFDictionary *)CFSTR("HIDAccelTangentSpeedParabolicRoot"), v12);
}

double IOHIDParametricAcceleration::GetCurveParameter(CFTypeRef cf, const __CFDictionary *a2, const __CFString *a3)
{
  const void *Value;
  double v5;
  unint64_t v7;
  CFNumberRef number;
  void *v9;
  CFDictionaryRef theDict;
  uint64_t valuePtr;

  v9 = (void *)0xAAAAAAAAAAAAAAAALL;
  theDict = (CFDictionaryRef)0xAAAAAAAAAAAAAAAALL;
  sub_23111DD10(&v9, cf, 0);
  number = (CFNumberRef)0xAAAAAAAAAAAAAAAALL;
  v9 = &unk_2500017A8;
  v7 = 0xAAAAAAAAAAAAAAAALL;
  Value = CFDictionaryGetValue(theDict, a2);
  sub_23111DE44(&v7, Value, 0);
  if (number)
  {
    valuePtr = 0;
    CFNumberGetValue(number, kCFNumberSInt64Type, &valuePtr);
    v5 = (double)valuePtr * 0.0000152587891;
  }
  else
  {
    v5 = 0.0;
  }
  sub_23111C114(&v7);
  sub_23111DE04(&v9);
  return v5;
}

void sub_23111C318(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v3;
  va_list va;
  uint64_t v5;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, _QWORD);
  v5 = va_arg(va1, _QWORD);
  sub_23111C114((uint64_t *)va);
  sub_23111DE04((uint64_t *)va1);
  _Unwind_Resume(a1);
}

uint64_t IOHIDParametricAcceleration::CreateWithParameters(IOHIDParametricAcceleration *this, const __CFArray *a2, double a3, double a4, double a5)
{
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  CFIndex v12;
  __int128 v13;
  IOHIDParametricAcceleration *ValueAtIndex;
  const __CFString *v15;
  char *v16;
  char *v17;
  char *v18;
  unint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  char *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  char *v31;
  double v32;
  char *v33;
  double v34;
  double v35;
  char *v36;
  float64x2_t v37;
  float64x2_t v38;
  __int128 v39;
  double v40;
  double v41;
  long double v42;
  long double v43;
  long double v44;
  long double v45;
  long double v46;
  long double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  long double v56;
  long double v57;
  long double v58;
  long double v59;
  long double v60;
  long double v61;
  long double v62;
  double __x;
  char *__p;
  char *v66;
  char *v67;
  void *v68;
  CFArrayRef theArray;
  _BYTE buf[48];
  uint64_t v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v9 = _IOHIDLogCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218496;
    *(double *)&buf[4] = a3;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = a4;
    *(_WORD *)&buf[22] = 2048;
    *(double *)&buf[24] = a5;
    _os_log_debug_impl(&dword_23111A000, v9, OS_LOG_TYPE_DEBUG, "acceleration %f resolution %f rate %f\n", buf, 0x20u);
  }
  v10 = 0;
  if (this && a3 >= 0.0)
  {
    v68 = (void *)0xAAAAAAAAAAAAAAAALL;
    theArray = (CFArrayRef)0xAAAAAAAAAAAAAAAALL;
    sub_23111DEC4(&v68, this, 0);
    v11 = 0;
    v12 = 0;
    v67 = 0;
    v68 = &unk_250001848;
    __p = 0;
    v66 = 0;
    while (v12 < CFArrayGetCount(theArray))
    {
      v71 = -1;
      *(_QWORD *)&v13 = -1;
      *((_QWORD *)&v13 + 1) = -1;
      *(_OWORD *)&buf[16] = v13;
      *(_OWORD *)&buf[32] = v13;
      *(_OWORD *)buf = v13;
      ValueAtIndex = (IOHIDParametricAcceleration *)CFArrayGetValueAtIndex(theArray, v12);
      IOHIDParametricAcceleration::GetCurve(ValueAtIndex, v15, (uint64_t)buf);
      if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_f64(*(float64x2_t *)&buf[8]), (int32x4_t)vceqzq_f64(*(float64x2_t *)&buf[24]))))) & 1) != 0)
      {
        v16 = v66;
        if (v66 >= v67)
        {
          v18 = __p;
          v19 = 0x6DB6DB6DB6DB6DB7 * ((v66 - __p) >> 3) + 1;
          if (v19 > 0x492492492492492)
            sub_23111E2D8();
          if (0xDB6DB6DB6DB6DB6ELL * ((v67 - __p) >> 3) > v19)
            v19 = 0xDB6DB6DB6DB6DB6ELL * ((v67 - __p) >> 3);
          if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((v67 - __p) >> 3)) >= 0x249249249249249)
            v20 = 0x492492492492492;
          else
            v20 = v19;
          if (v20)
          {
            v21 = (char *)sub_23111E3BC((uint64_t)&v67, v20);
            v18 = __p;
            v16 = v66;
          }
          else
          {
            v21 = 0;
          }
          v22 = &v21[8 * ((v66 - __p) >> 3)];
          *(_OWORD *)v22 = *(_OWORD *)buf;
          *((_OWORD *)v22 + 1) = *(_OWORD *)&buf[16];
          *((_OWORD *)v22 + 2) = *(_OWORD *)&buf[32];
          *((_QWORD *)v22 + 6) = v71;
          if (v16 == v18)
          {
            v27 = &v21[8 * ((v66 - __p) >> 3)];
          }
          else
          {
            v23 = &v21[8 * ((v66 - __p) >> 3)];
            do
            {
              v24 = *(_OWORD *)(v16 - 56);
              v25 = *(_OWORD *)(v16 - 40);
              v26 = *(_OWORD *)(v16 - 24);
              v27 = v23 - 56;
              *((_QWORD *)v23 - 1) = *((_QWORD *)v16 - 1);
              *(_OWORD *)(v23 - 24) = v26;
              *(_OWORD *)(v23 - 40) = v25;
              *(_OWORD *)(v23 - 56) = v24;
              v16 -= 56;
              v23 -= 56;
            }
            while (v16 != v18);
          }
          v17 = v22 + 56;
          __p = v27;
          v67 = &v21[56 * v20];
          if (v18)
            operator delete(v18);
        }
        else
        {
          *(_OWORD *)v66 = *(_OWORD *)buf;
          *((_OWORD *)v66 + 1) = *(_OWORD *)&buf[16];
          *((_OWORD *)v66 + 2) = *(_OWORD *)&buf[32];
          *((_QWORD *)v66 + 6) = v71;
          v17 = v66 + 56;
        }
        v66 = v17;
        if (*(double *)buf <= a3)
          v11 = v12;
      }
      ++v12;
    }
    v28 = v66;
    if (v66 == __p)
    {
      v10 = 0;
      if (!v66)
        goto LABEL_44;
    }
    else
    {
      v10 = operator new();
      *(_QWORD *)v10 = &off_2500016F8;
      *(double *)(v10 + 112) = a4;
      *(double *)(v10 + 120) = a5;
      *(double *)(v10 + 128) = a3;
      v29 = _IOHIDLogCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        sub_231122C30(v11, v29, v30);
      v28 = __p;
      v31 = &__p[56 * v11];
      v32 = *(double *)v31;
      if (*(double *)v31 >= a3 || v11 + 1 >= (unint64_t)(0x6DB6DB6DB6DB6DB7 * ((v66 - __p) >> 3)))
      {
        v39 = *((_OWORD *)v31 + 1);
        *(_OWORD *)(v10 + 88) = *((_OWORD *)v31 + 2);
        *(_OWORD *)(v10 + 56) = *(_OWORD *)v31;
        *(_OWORD *)(v10 + 72) = v39;
        *(_QWORD *)(v10 + 104) = *((_QWORD *)v31 + 6);
        v38.f64[0] = *(float64_t *)(v10 + 96);
      }
      else
      {
        v33 = &__p[56 * v11 + 56];
        v34 = *(double *)v33 - v32;
        v35 = (a3 - v32) / v34;
        *(double *)(v10 + 56) = v32 + v35 * v34;
        v36 = &__p[56 * v11];
        v37 = vmlaq_n_f64(*(float64x2_t *)(v36 + 24), vsubq_f64(*(float64x2_t *)(v33 + 24), *(float64x2_t *)(v36 + 24)), v35);
        *(float64x2_t *)(v10 + 64) = vmlaq_n_f64(*(float64x2_t *)(v36 + 8), vsubq_f64(*(float64x2_t *)(v33 + 8), *(float64x2_t *)(v36 + 8)), v35);
        *(float64x2_t *)(v10 + 80) = v37;
        v38 = vmlaq_n_f64(*(float64x2_t *)(v36 + 40), vsubq_f64(*(float64x2_t *)(v33 + 40), *(float64x2_t *)(v36 + 40)), v35);
        *(float64x2_t *)(v10 + 96) = v38;
      }
      *(int64x2_t *)(v10 + 8) = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
      if (v38.f64[0] == 0.0)
      {
        v53 = *(double *)(v10 + 104);
        if (v53 != 0.0)
        {
          v54 = *(double *)(v10 + 64);
          v55 = *(double *)(v10 + 72);
          v56 = *(double *)(v10 + 80);
          v57 = v53 * v55 * (v53 * v55) + v54 * v53 + pow(v53 * v56, 3.0);
          v58 = *(double *)(v10 + 88);
          v59 = v57 + pow(v53 * v58, 4.0);
          v60 = v54 + (v53 + v53) * (v55 * v55) + v53 * v53 * 3.0 * pow(v56, 3.0);
          v61 = pow(v53, 3.0) * 4.0;
          v62 = v60 + v61 * pow(v58, 4.0);
          *(long double *)(v10 + 32) = v62;
          *(long double *)(v10 + 48) = v59 * v59 - v62 * v53;
          *(double *)(v10 + 8) = v53;
        }
      }
      else
      {
        v40 = *(double *)(v10 + 64);
        v41 = *(double *)(v10 + 72);
        v42 = *(double *)(v10 + 80);
        __x = v38.f64[0];
        v43 = v38.f64[0] * v41 * (v38.f64[0] * v41) + v40 * v38.f64[0] + pow(v38.f64[0] * v42, 3.0);
        v44 = *(double *)(v10 + 88);
        v45 = v43 + pow(__x * v44, 4.0);
        v46 = v40 + (__x + __x) * (v41 * v41) + __x * __x * 3.0 * pow(v42, 3.0);
        v47 = pow(__x, 3.0) * 4.0;
        v48 = v46 + v47 * pow(v44, 4.0);
        *(double *)(v10 + 24) = v48;
        v49 = v45 - v48 * __x;
        *(double *)(v10 + 40) = v49;
        *(double *)(v10 + 8) = __x;
        v50 = *(double *)(v10 + 104);
        if (v50 != 0.0)
        {
          v51 = v49 + v48 * v50;
          v52 = v48 * (v51 + v51);
          *(double *)(v10 + 32) = v52;
          *(double *)(v10 + 48) = v51 * v51 - v52 * v50;
          *(double *)(v10 + 16) = v50;
        }
      }
    }
    operator delete(v28);
LABEL_44:
    sub_23111DFB8(&v68);
  }
  return v10;
}

void sub_23111C92C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, uint64_t a14, uint64_t a15)
{
  if (__p)
    operator delete(__p);
  sub_23111DFB8(&a15);
  _Unwind_Resume(a1);
}

double IOHIDParametricAcceleration::multiplier(IOHIDParametricAcceleration *this, double a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  long double v7;

  v3 = a2 / (*((double *)this + 14) / *((double *)this + 15));
  v4 = *((double *)this + 1);
  if (v3 <= v4)
  {
    v6 = v3 * *((double *)this + 9) * (v3 * *((double *)this + 9)) + *((double *)this + 8) * v3;
    v7 = v6 + pow(v3 * *((double *)this + 10), 3.0);
    v5 = v7 + pow(v3 * *((double *)this + 11), 4.0);
  }
  else if (v3 <= *((double *)this + 2) && v4 == *((double *)this + 12))
  {
    v5 = *((double *)this + 5) + *((double *)this + 3) * v3;
  }
  else
  {
    v5 = sqrt(*((double *)this + 6) + *((double *)this + 4) * v3);
  }
  return v5 * 1.43283582;
}

_QWORD *IOHIDParametricAcceleration::serialize(IOHIDParametricAcceleration *this, __CFDictionary *a2)
{
  void *v4;
  CFMutableDictionaryRef theDict;

  v4 = (void *)0xAAAAAAAAAAAAAAAALL;
  theDict = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
  sub_23111BEFC(&v4, a2, 0);
  v4 = &unk_2500015D8;
  CFDictionarySetValue(theDict, CFSTR("Class"), CFSTR("IOHIDParametricAcceleration"));
  sub_23111B770((uint64_t)&v4, CFSTR("AccelIndex"), vcvtd_n_u64_f64(*((double *)this + 7), 0x10uLL));
  sub_23111B770((uint64_t)&v4, CFSTR("GainLinear"), vcvtd_n_u64_f64(*((double *)this + 8), 0x10uLL));
  sub_23111B770((uint64_t)&v4, CFSTR("GainCubic"), vcvtd_n_u64_f64(*((double *)this + 10), 0x10uLL));
  sub_23111B770((uint64_t)&v4, CFSTR("TangentSpeedLinear"), vcvtd_n_u64_f64(*((double *)this + 12), 0x10uLL));
  sub_23111B770((uint64_t)&v4, CFSTR("TangentSpeedParabolicRoot"), vcvtd_n_u64_f64(*((double *)this + 13), 0x10uLL));
  return sub_23111BFF0(&v4);
}

void sub_23111CB1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_23111BFF0(&a9);
  _Unwind_Resume(a1);
}

BOOL operator<(double *a1, double *a2)
{
  return *a1 < *a2;
}

BOOL operator==(double *a1, double *a2)
{
  return *a1 == *a2;
}

double IOHIDTableAcceleration::InterpolatePoint(uint64_t a1, uint64_t a2)
{
  return *(double *)a2;
}

double IOHIDTableAcceleration::InterpolatePoint(uint64_t a1)
{
  return *(double *)a1;
}

uint64_t IOHIDTableAcceleration::InterpolateFunction(int a1, ACCEL_TABLE_ENTRY *a2, ACCEL_TABLE_ENTRY *this, double a4, uint64_t **a5)
{
  double v9;
  double v10;
  double v11;
  uint64_t result;
  unsigned int v13;
  unsigned int v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double i;
  double v20;
  double v21;
  double v22;
  __int128 v23;

  v9 = ACCEL_TABLE_ENTRY::point(this, 0);
  v11 = v10;
  result = ACCEL_TABLE_ENTRY::count(a2);
  if ((_DWORD)result)
  {
    v13 = 0;
    v14 = 0;
    v15 = 0.0;
    v16 = 0.0;
    do
    {
      v17 = ACCEL_TABLE_ENTRY::point(a2, v14);
      for (i = v18; v17 > v9; v11 = v20)
      {
        if (v13 >= ACCEL_TABLE_ENTRY::count(this) - 1)
          break;
        v16 = v9;
        v15 = v11;
        v9 = ACCEL_TABLE_ENTRY::point(this, ++v13);
      }
      v21 = v11 - (v11 - v15) / (v9 - v16) * v9 + v17 * ((v11 - v15) / (v9 - v16));
      if (v21 >= i)
        v22 = i;
      else
        v22 = v11 - (v11 - v15) / (v9 - v16) * v9 + v17 * ((v11 - v15) / (v9 - v16));
      *(double *)&v23 = v17;
      *((double *)&v23 + 1) = v22 + vabdd_f64(i, v21) * a4;
      sub_23111E404(a5, (double *)&v23, &v23);
      ++v14;
      result = ACCEL_TABLE_ENTRY::count(a2);
    }
    while (v14 < result);
  }
  return result;
}

uint64_t IOHIDTableAcceleration::CreateWithTable(IOHIDTableAcceleration *this, const __CFData *a2, double a3, double a4, double a5)
{
  ACCEL_TABLE *BytePtr;
  ACCEL_TABLE *v9;
  uint64_t v10;
  void **v11;
  NSObject *v12;
  unsigned int *v13;
  __int128 v14;
  NSObject *v15;
  unsigned int v16;
  unsigned int *v17;
  unsigned int *v18;
  NSObject *v19;
  unsigned int v20;
  double v21;
  double v22;
  double v23;
  NSObject *v24;
  double v25;
  double v26;
  double v27;
  int v28;
  int v29;
  uint64_t *v30;
  _QWORD *v31;
  double *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double *v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  char *v44;
  double *v45;
  double *v46;
  __int128 v47;
  uint64_t *v48;
  uint64_t *v49;
  BOOL v50;
  uint64_t v51;
  __int128 v53;
  uint64_t *v54;
  _QWORD *v55[2];
  char v56[24];
  char v57[16];
  _BYTE buf[32];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  void *__p[2];
  __int128 v63;
  __int128 v64;
  _OWORD v65[9];
  unint64_t v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  BytePtr = (ACCEL_TABLE *)CFDataGetBytePtr(this);
  if (!BytePtr)
  {
    v19 = _IOHIDLogCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      sub_231122C9C(v19);
    return 0;
  }
  v9 = BytePtr;
  if (ACCEL_TABLE::signature(BytePtr) != 808464960
    && ACCEL_TABLE::signature(v9) != 708989781)
  {
    v24 = _IOHIDLogCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      sub_231122D44(v9, v24);
    return 0;
  }
  v10 = operator new();
  *(_QWORD *)v10 = &off_250001758;
  *(_QWORD *)(v10 + 8) = 0;
  v11 = (void **)(v10 + 8);
  *(_QWORD *)(v10 + 16) = 0;
  *(_QWORD *)(v10 + 24) = 0;
  v12 = _IOHIDLogCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218496;
    *(double *)&buf[4] = a3;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = a4;
    *(_WORD *)&buf[22] = 2048;
    *(double *)&buf[24] = a5;
    _os_log_debug_impl(&dword_23111A000, v12, OS_LOG_TYPE_DEBUG, "acceleration %f resolution %f rate %f\n", buf, 0x20u);
  }
  *(double *)(v10 + 32) = a4;
  *(double *)(v10 + 40) = a5;
  v13 = (unsigned int *)ACCEL_TABLE::entry(v9, 0);
  v66 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v14 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v65[7] = v14;
  v65[8] = v14;
  v65[5] = v14;
  v65[6] = v14;
  v65[3] = v14;
  v65[4] = v14;
  v65[1] = v14;
  v65[2] = v14;
  v64 = v14;
  v65[0] = v14;
  *(_OWORD *)__p = v14;
  v63 = v14;
  v60 = v14;
  v61 = v14;
  *(_OWORD *)&buf[16] = v14;
  v59 = v14;
  *(_OWORD *)buf = v14;
  sub_23111D2D8((uint64_t)buf);
  operator<<(&buf[16], (uint64_t)v9);
  v15 = _IOHIDLogCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    std::stringbuf::str();
    sub_231122CDC(v56, (uint64_t)v57, v15);
  }
  v16 = 0;
  v55[0] = 0;
  v55[1] = 0;
  v54 = (uint64_t *)v55;
  v17 = v13;
  while (1)
  {
    v18 = v13;
    if (v16 >= ACCEL_TABLE::count(v9))
      break;
    v13 = (unsigned int *)ACCEL_TABLE::entry(v9, v16++);
    v17 = v18;
    if (ACCEL_TABLE_ENTRY::acceleration<double>(v13) >= a3)
    {
      if (ACCEL_TABLE_ENTRY::acceleration<double>(v13) == a3)
        v17 = v13;
      else
        v17 = v18;
      break;
    }
  }
  if (v13 == v17 || ACCEL_TABLE_ENTRY::acceleration<double>(v13) < a3)
  {
    v20 = 0;
    v21 = a3 + 1.0;
    while (v20 < ACCEL_TABLE_ENTRY::count((ACCEL_TABLE_ENTRY *)v13))
    {
      v22 = ACCEL_TABLE_ENTRY::acceleration<double>(v13);
      *(_QWORD *)&v53 = -1;
      *((_QWORD *)&v53 + 1) = -1;
      *(_QWORD *)&v53 = ACCEL_TABLE_ENTRY::point((ACCEL_TABLE_ENTRY *)v13, v20);
      *((double *)&v53 + 1) = v21 / (v22 + 1.0) * v23;
      sub_23111E404(&v54, (double *)&v53, &v53);
      ++v20;
    }
  }
  else
  {
    v25 = ACCEL_TABLE_ENTRY::acceleration<double>(v17);
    v26 = ACCEL_TABLE_ENTRY::acceleration<double>(v13);
    v27 = (a3 - v25) / (v26 - ACCEL_TABLE_ENTRY::acceleration<double>(v17));
    v29 = IOHIDTableAcceleration::InterpolateFunction(v28, (ACCEL_TABLE_ENTRY *)v17, (ACCEL_TABLE_ENTRY *)v13, v27, &v54);
    IOHIDTableAcceleration::InterpolateFunction(v29, (ACCEL_TABLE_ENTRY *)v13, (ACCEL_TABLE_ENTRY *)v17, v27, &v54);
  }
  v30 = v54;
  if (v54 != (uint64_t *)v55)
  {
    v31 = (_QWORD *)(v10 + 24);
    v32 = *(double **)(v10 + 16);
    v33 = 0.0;
    v34 = 0.0;
    v35 = a4 / a5;
    do
    {
      v36 = v34;
      v37 = v33;
      v34 = v35 * *((double *)v30 + 4);
      v33 = *((double *)v30 + 5) * 1.43283582;
      v38 = (v33 - v37) / (v34 - v36);
      v39 = v33 - v38 * v34;
      if ((unint64_t)v32 >= *v31)
      {
        v40 = (double *)*v11;
        v41 = 0xAAAAAAAAAAAAAAABLL * (((char *)v32 - (_BYTE *)*v11) >> 3);
        v42 = v41 + 1;
        if (v41 + 1 > 0xAAAAAAAAAAAAAAALL)
          sub_23111E2D8();
        if (0x5555555555555556 * ((uint64_t)(*v31 - (_QWORD)v40) >> 3) > v42)
          v42 = 0x5555555555555556 * ((uint64_t)(*v31 - (_QWORD)v40) >> 3);
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*v31 - (_QWORD)v40) >> 3) >= 0x555555555555555)
          v43 = 0xAAAAAAAAAAAAAAALL;
        else
          v43 = v42;
        if (v43)
        {
          v44 = (char *)sub_23111E6E8(v10 + 24, v43);
          v40 = *(double **)(v10 + 8);
          v32 = *(double **)(v10 + 16);
        }
        else
        {
          v44 = 0;
        }
        v45 = (double *)&v44[24 * v41];
        *v45 = v38;
        v45[1] = v39;
        v45[2] = v34;
        v46 = v45;
        if (v32 != v40)
        {
          do
          {
            v47 = *(_OWORD *)(v32 - 3);
            *(v46 - 1) = *(v32 - 1);
            *(_OWORD *)(v46 - 3) = v47;
            v46 -= 3;
            v32 -= 3;
          }
          while (v32 != v40);
          v40 = (double *)*v11;
        }
        v32 = v45 + 3;
        *(_QWORD *)(v10 + 8) = v46;
        *(_QWORD *)(v10 + 16) = v45 + 3;
        *(_QWORD *)(v10 + 24) = &v44[24 * v43];
        if (v40)
          operator delete(v40);
      }
      else
      {
        *v32 = v38;
        v32[1] = v39;
        v32[2] = v34;
        v32 += 3;
      }
      *(_QWORD *)(v10 + 16) = v32;
      v48 = (uint64_t *)v30[1];
      if (v48)
      {
        do
        {
          v49 = v48;
          v48 = (uint64_t *)*v48;
        }
        while (v48);
      }
      else
      {
        do
        {
          v49 = (uint64_t *)v30[2];
          v50 = *v49 == (_QWORD)v30;
          v30 = v49;
        }
        while (!v50);
      }
      v30 = v49;
    }
    while (v49 != (uint64_t *)v55);
  }
  sub_23111E6A8((uint64_t)&v54, v55[0]);
  *(_QWORD *)buf = *MEMORY[0x24BEDB7F0];
  v51 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)&buf[*(_QWORD *)(*(_QWORD *)buf - 24)] = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  *(_QWORD *)&buf[16] = v51;
  *(_QWORD *)&buf[24] = MEMORY[0x24BEDB848] + 16;
  if (SHIBYTE(v63) < 0)
    operator delete(__p[1]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x2348D2AE8](v65);
  return v10;
}

void sub_23111D280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  uint64_t v4;
  va_list va;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  va_list va1;

  va_start(va1, a3);
  va_start(va, a3);
  v4 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD *);
  v7 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  sub_23111E6A8((uint64_t)va, v6);
  sub_23111D404((uint64_t)va1);
  _Unwind_Resume(a1);
}

uint64_t sub_23111D2D8(uint64_t a1)
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

void sub_23111D3DC(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::iostream::~basic_iostream();
  MEMORY[0x2348D2AE8](v1);
  _Unwind_Resume(a1);
}

uint64_t sub_23111D404(uint64_t a1)
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
  MEMORY[0x2348D2AE8](a1 + 128);
  return a1;
}

uint64_t IOHIDTableAcceleration::CreateOriginalWithTable(IOHIDTableAcceleration *this, const __CFData *a2, double a3, double a4, double a5)
{
  uint64_t v5;
  void **v10;
  const UInt8 *BytePtr;
  double v12;
  double v13;
  unsigned int v14;
  const UInt8 *v15;
  unsigned int v16;
  double v17;
  unsigned int *v18;
  int v19;
  int v20;
  int v21;
  unsigned int *v22;
  int v23;
  double v24;
  int v25;
  double v26;
  double v27;
  double *v28;
  double v29;
  unsigned int *v30;
  double v31;
  double v32;
  unsigned int *v33;
  double v34;
  double v35;
  double v36;
  _QWORD *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  int v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  int v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double *v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  char *v67;
  double *v68;
  double *v69;
  __int128 v70;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;

  v5 = 0;
  if (this && a4 != 0.0 && a5 != 0.0)
  {
    v5 = operator new();
    *(_QWORD *)v5 = &off_250001758;
    *(_QWORD *)(v5 + 8) = 0;
    v10 = (void **)(v5 + 8);
    *(_QWORD *)(v5 + 16) = 0;
    *(_QWORD *)(v5 + 24) = 0;
    *(double *)(v5 + 32) = a4;
    *(double *)(v5 + 40) = a5;
    BytePtr = CFDataGetBytePtr(this);
    v12 = (double)(int)bswap32(*(_DWORD *)BytePtr) * 0.0000152587891;
    if (a3 <= 0.5)
      v13 = v12 * a3;
    else
      v13 = v12 + (a3 + -0.5) * (1.0 - v12) * 2.0;
    v14 = *((unsigned __int16 *)BytePtr + 4);
    v16 = *(_DWORD *)(BytePtr + 10);
    v15 = BytePtr + 10;
    v17 = (double)(int)bswap32(v16) * 0.0000152587891;
    v18 = (unsigned int *)(v15 + 6);
    v19 = (int)bswap32(*((unsigned __int16 *)v15 + 2)) >> 16;
    if (v13 <= v17)
    {
      v23 = 0;
      v26 = 1.0;
    }
    else
    {
      v20 = (int)bswap32(v14) >> 16;
      v21 = v20 - 1;
      if (v20 != 1)
      {
        v22 = (unsigned int *)(v15 + 6);
        v23 = v19;
        while (1)
        {
          v15 = (const UInt8 *)v22 + (8 * v23);
          v24 = (double)(int)bswap32(*(_DWORD *)v15) * 0.0000152587891;
          v25 = bswap32(*((unsigned __int16 *)v15 + 2));
          v18 = (unsigned int *)(v15 + 6);
          v19 = v25 >> 16;
          if (v13 <= v24)
            break;
          v17 = v24;
          v22 = (unsigned int *)(v15 + 6);
          v23 = v25 >> 16;
          if (!--v21)
            goto LABEL_15;
        }
        v26 = 0.0;
        if (v24 != v17)
          v26 = (v13 - v17) / (v24 - v17);
        goto LABEL_19;
      }
      v24 = v17;
LABEL_15:
      v23 = 0;
      v27 = v13 / v24;
      if (v24 == 0.0)
        v26 = 0.0;
      else
        v26 = v27;
    }
    v22 = v18;
LABEL_19:
    v28 = 0;
    v29 = (double)(int)bswap32(*v22) * 0.0000152587891;
    v30 = v22 + 2;
    v31 = (double)(int)bswap32(v22[1]) * 0.0000152587891;
    v32 = (double)(int)bswap32(*v18) * 0.0000152587891;
    v33 = (unsigned int *)(v15 + 14);
    v34 = (double)(int)bswap32(*(_DWORD *)(v15 + 10)) * 0.0000152587891;
    v35 = -v26;
    v36 = a4 / a5;
    v37 = (_QWORD *)(v5 + 24);
    v38 = 0.0;
    v39 = 0.0;
    v40 = 0.0;
    v41 = 0.0;
    v42 = 0.0;
    v43 = 0.0;
    v73 = -v26;
    v74 = v26;
    v72 = a4 / a5;
    do
    {
      v44 = v43;
      v45 = v42;
      v46 = v41;
      v47 = v40;
      v42 = v39;
      v43 = v38;
      if (v23)
      {
        if (!v19 || v29 <= v32)
        {
          v48 = 0;
          if (--v23)
          {
            v49 = (double)(int)bswap32(v30[1]);
            v50 = v29;
            v29 = (double)(int)bswap32(*v30) * 0.0000152587891;
            v30 += 2;
            v51 = v31;
            v31 = v49 * 0.0000152587891;
            v52 = v34;
            v53 = v32;
          }
          else
          {
            v52 = v34;
            v53 = v32;
            v51 = v31;
            v50 = v29;
          }
          goto LABEL_31;
        }
      }
      else if (!v19)
      {
        v23 = 0;
LABEL_29:
        v48 = 1;
        v52 = v31;
        v53 = v29;
        v51 = v34;
        v50 = v32;
        goto LABEL_31;
      }
      if (!--v19)
        goto LABEL_29;
      v50 = v32;
      v32 = (double)(int)bswap32(*v33) * 0.0000152587891;
      v54 = bswap32(v33[1]);
      v33 += 2;
      v55 = (double)v54;
      v48 = 1;
      v51 = v34;
      v34 = v55 * 0.0000152587891;
      v52 = v31;
      v53 = v29;
LABEL_31:
      v56 = 0.0;
      v57 = 0.0;
      if (v53 != v42)
        v57 = (v52 - v43) / (v53 - v42);
      v58 = v43 - v57 * v42 + v57 * v50;
      v59 = v51 + v35 * (v51 - v58);
      v60 = v58 + v26 * (v51 - v58);
      if (!v48)
        v60 = v59;
      v40 = v36 * v50;
      v41 = v60 * 1.43283582;
      if (v36 * v50 != v47)
        v56 = (v41 - v46) / (v40 - v47);
      v61 = v41 - v56 * v40;
      if (v23 | v19)
        v62 = v36 * v50;
      else
        v62 = 32768.0;
      if ((unint64_t)v28 >= *v37)
      {
        v63 = (double *)*v10;
        v64 = 0xAAAAAAAAAAAAAAABLL * (((char *)v28 - (_BYTE *)*v10) >> 3);
        v65 = v64 + 1;
        if (v64 + 1 > 0xAAAAAAAAAAAAAAALL)
          sub_23111E2D8();
        v75 = v45;
        v76 = v44;
        v77 = v43;
        v78 = v34;
        v79 = v32;
        v80 = v31;
        v81 = v29;
        if (0x5555555555555556 * ((uint64_t)(*v37 - (_QWORD)v63) >> 3) > v65)
          v65 = 0x5555555555555556 * ((uint64_t)(*v37 - (_QWORD)v63) >> 3);
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*v37 - (_QWORD)v63) >> 3) >= 0x555555555555555)
          v66 = 0xAAAAAAAAAAAAAAALL;
        else
          v66 = v65;
        if (v66)
        {
          v67 = (char *)sub_23111E6E8(v5 + 24, v66);
          v63 = *(double **)(v5 + 8);
          v28 = *(double **)(v5 + 16);
        }
        else
        {
          v67 = 0;
        }
        v68 = (double *)&v67[24 * v64];
        *v68 = v56;
        v68[1] = v61;
        v68[2] = v62;
        v69 = v68;
        if (v28 != v63)
        {
          do
          {
            v70 = *(_OWORD *)(v28 - 3);
            *(v69 - 1) = *(v28 - 1);
            *(_OWORD *)(v69 - 3) = v70;
            v69 -= 3;
            v28 -= 3;
          }
          while (v28 != v63);
          v63 = (double *)*v10;
        }
        v28 = v68 + 3;
        *(_QWORD *)(v5 + 8) = v69;
        *(_QWORD *)(v5 + 16) = v68 + 3;
        *(_QWORD *)(v5 + 24) = &v67[24 * v66];
        if (v63)
          operator delete(v63);
        v35 = v73;
        v26 = v74;
        v31 = v80;
        v29 = v81;
        v34 = v78;
        v32 = v79;
        v36 = v72;
        v44 = v76;
        v43 = v77;
        v45 = v75;
      }
      else
      {
        *v28 = v56;
        v28[1] = v61;
        v28[2] = v62;
        v28 += 3;
      }
      *(_QWORD *)(v5 + 16) = v28;
      if (v23)
      {
        if (v19)
        {
          v44 = v43;
          v45 = v42;
          if (v29 <= v32)
          {
            v44 = v51;
            v45 = v50;
          }
        }
      }
      v38 = v44;
      v39 = v45;
    }
    while (v23 | v19);
  }
  return v5;
}

double IOHIDTableAcceleration::multiplier(IOHIDTableAcceleration *this, double a2)
{
  double *v2;
  double *v3;
  double *v4;
  double *v5;
  BOOL v6;

  v3 = (double *)*((_QWORD *)this + 1);
  v2 = (double *)*((_QWORD *)this + 2);
  if (v3 != v2)
  {
    v4 = v3 + 3;
    do
    {
      v5 = v4 + 3;
      v6 = *(v4 - 1) >= a2 || v4 == v2;
      v4 += 3;
    }
    while (!v6);
    v3 = v5 - 6;
  }
  return v3[1] + *v3 * a2;
}

_QWORD *IOHIDTableAcceleration::serialize(IOHIDTableAcceleration *this, __CFDictionary *a2)
{
  CFMutableArrayRef Mutable;
  double *i;
  _QWORD v6[2];
  _QWORD v7[2];
  _QWORD v8[2];
  void *v9[2];
  void *v10;
  CFMutableArrayRef theArray;
  void *v12;
  CFMutableDictionaryRef theDict;
  _QWORD v14[3];
  __int128 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = (void *)0xAAAAAAAAAAAAAAAALL;
  theDict = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
  sub_23111BEFC(&v12, a2, 0);
  v12 = &unk_2500015D8;
  CFDictionarySetValue(theDict, CFSTR("Class"), CFSTR("IOHIDTableAcceleration"));
  v10 = (void *)0xAAAAAAAAAAAAAAAALL;
  theArray = (CFMutableArrayRef)0xAAAAAAAAAAAAAAAALL;
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  sub_23111DFF8(&v10, Mutable, 1);
  v10 = &unk_2500018E8;
  for (i = (double *)*((_QWORD *)this + 1); i != *((double **)this + 2); i += 3)
  {
    v15 = xmmword_2500016D0;
    v16 = CFSTR("x");
    sub_23111C0A8(v8, vcvtd_n_u64_f64(*i, 0x10uLL));
    v14[0] = v8[1];
    sub_23111C0A8(v7, vcvtd_n_u64_f64(i[1], 0x10uLL));
    v14[1] = v7[1];
    sub_23111C0A8(v6, vcvtd_n_u64_f64(i[2], 0x10uLL));
    v14[2] = v6[1];
    sub_23111E12C(v9, &v15, 3uLL, v14, 3uLL);
    CFArrayAppendValue(theArray, v9[1]);
    sub_23111DE04(v9);
    sub_23111C114(v6);
    sub_23111C114(v7);
    sub_23111C114(v8);
  }
  if (theArray)
    CFDictionarySetValue(theDict, CFSTR("Curves"), theArray);
  sub_23111E0EC(&v10);
  return sub_23111BFF0(&v12);
}

void sub_23111DBE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  uint64_t v13;
  va_list va;
  uint64_t v15;
  va_list va1;

  va_start(va1, a12);
  va_start(va, a12);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  sub_23111E0EC((uint64_t *)va);
  sub_23111BFF0((uint64_t *)va1);
  _Unwind_Resume(a1);
}

void sub_23111DC64()
{
  JUMPOUT(0x2348D2B0CLL);
}

uint64_t sub_23111DC78()
{
  return 1;
}

_QWORD *sub_23111DC80(_QWORD *a1)
{
  void *v2;

  *a1 = &off_250001758;
  v2 = (void *)a1[1];
  if (v2)
  {
    a1[2] = v2;
    operator delete(v2);
  }
  return a1;
}

void sub_23111DCBC(_QWORD *a1)
{
  void *v2;

  *a1 = &off_250001758;
  v2 = (void *)a1[1];
  if (v2)
  {
    a1[2] = v2;
    operator delete(v2);
  }
  JUMPOUT(0x2348D2B0CLL);
}

uint64_t sub_23111DD08()
{
  return 0;
}

_QWORD *sub_23111DD10(_QWORD *a1, CFTypeRef cf, char a3)
{
  CFTypeID v6;
  CFTypeRef v7;

  if (cf)
  {
    v6 = CFGetTypeID(cf);
    if (v6 == CFDictionaryGetTypeID())
      v7 = cf;
    else
      v7 = 0;
    *a1 = &unk_250001828;
    a1[1] = v7;
    if (v7 && (a3 & 1) == 0)
      CFRetain(v7);
  }
  else
  {
    a1[1] = 0;
  }
  *a1 = &unk_250001808;
  return a1;
}

void sub_23111DD90(_QWORD *a1)
{
  sub_23111DE04(a1);
  JUMPOUT(0x2348D2B0CLL);
}

void sub_23111DDB8(_QWORD *a1)
{
  sub_23111DE04(a1);
  JUMPOUT(0x2348D2B0CLL);
}

void sub_23111DDE0(_QWORD *a1)
{
  sub_23111DE04(a1);
  JUMPOUT(0x2348D2B0CLL);
}

_QWORD *sub_23111DE04(_QWORD *a1)
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &unk_250001828;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

_QWORD *sub_23111DE44(_QWORD *a1, CFTypeRef cf, char a3)
{
  CFTypeID v6;
  CFTypeRef v7;

  if (cf)
  {
    v6 = CFGetTypeID(cf);
    if (v6 == CFNumberGetTypeID())
      v7 = cf;
    else
      v7 = 0;
    *a1 = &unk_2500016C0;
    a1[1] = v7;
    if (v7 && (a3 & 1) == 0)
      CFRetain(v7);
  }
  else
  {
    a1[1] = 0;
  }
  *a1 = &unk_250001678;
  return a1;
}

_QWORD *sub_23111DEC4(_QWORD *a1, CFTypeRef cf, char a3)
{
  CFTypeID v6;
  CFTypeRef v7;

  if (cf)
  {
    v6 = CFGetTypeID(cf);
    if (v6 == CFArrayGetTypeID())
      v7 = cf;
    else
      v7 = 0;
    *a1 = &unk_2500018C8;
    a1[1] = v7;
    if (v7 && (a3 & 1) == 0)
      CFRetain(v7);
  }
  else
  {
    a1[1] = 0;
  }
  *a1 = &unk_2500018A8;
  return a1;
}

void sub_23111DF44(_QWORD *a1)
{
  sub_23111DFB8(a1);
  JUMPOUT(0x2348D2B0CLL);
}

void sub_23111DF6C(_QWORD *a1)
{
  sub_23111DFB8(a1);
  JUMPOUT(0x2348D2B0CLL);
}

void sub_23111DF94(_QWORD *a1)
{
  sub_23111DFB8(a1);
  JUMPOUT(0x2348D2B0CLL);
}

_QWORD *sub_23111DFB8(_QWORD *a1)
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &unk_2500018C8;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

_QWORD *sub_23111DFF8(_QWORD *a1, CFTypeRef cf, char a3)
{
  CFTypeID v6;
  CFTypeRef v7;

  if (cf)
  {
    v6 = CFGetTypeID(cf);
    if (v6 == CFArrayGetTypeID())
      v7 = cf;
    else
      v7 = 0;
    *a1 = &unk_250001968;
    a1[1] = v7;
    if (v7 && (a3 & 1) == 0)
      CFRetain(v7);
  }
  else
  {
    a1[1] = 0;
  }
  *a1 = &unk_250001948;
  return a1;
}

void sub_23111E078(_QWORD *a1)
{
  sub_23111E0EC(a1);
  JUMPOUT(0x2348D2B0CLL);
}

void sub_23111E0A0(_QWORD *a1)
{
  sub_23111E0EC(a1);
  JUMPOUT(0x2348D2B0CLL);
}

void sub_23111E0C8(_QWORD *a1)
{
  sub_23111E0EC(a1);
  JUMPOUT(0x2348D2B0CLL);
}

_QWORD *sub_23111E0EC(_QWORD *a1)
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &unk_250001968;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

_QWORD *sub_23111E12C(_QWORD *a1, const void *a2, unint64_t a3, const void *a4, unint64_t a5)
{
  char *v10;
  char *v11;
  char *v12;
  const void **v13;
  void *__p;
  void *v16;
  uint64_t v17;
  void **keys;
  void *__dst;
  uint64_t v20;

  __dst = 0;
  *a1 = &unk_2500017A8;
  keys = 0;
  v20 = 0;
  if (a3)
  {
    sub_23111E298(&keys, a3);
    v10 = (char *)__dst;
    memmove(__dst, a2, 8 * a3);
    v11 = &v10[8 * a3];
    __dst = v11;
  }
  else
  {
    v11 = 0;
  }
  __p = 0;
  v16 = 0;
  v17 = 0;
  if (a5)
  {
    sub_23111E298(&__p, a5);
    v12 = (char *)v16;
    memmove(v16, a4, 8 * a5);
    v16 = &v12[8 * a5];
    v13 = (const void **)__p;
    v11 = (char *)__dst;
  }
  else
  {
    v13 = 0;
  }
  a1[1] = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)keys, v13, (v11 - (char *)keys) >> 3, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (__p)
  {
    v16 = __p;
    operator delete(__p);
  }
  if (keys)
  {
    __dst = keys;
    operator delete(keys);
  }
  return a1;
}

void sub_23111E258(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  _QWORD *v13;

  if (__p)
    operator delete(__p);
  if (a12)
    operator delete(a12);
  sub_23111DE04(v13);
  _Unwind_Resume(a1);
}

char *sub_23111E298(_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 61)
    sub_23111E2D8();
  result = (char *)sub_23111E2EC((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void sub_23111E2D8()
{
  sub_23111E320("vector");
}

void *sub_23111E2EC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    sub_23111E394();
  return operator new(8 * a2);
}

void sub_23111E320(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_23111E370(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_250001360, MEMORY[0x24BEDAAF0]);
}

void sub_23111E35C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_23111E370(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void sub_23111E394()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void *sub_23111E3BC(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x492492492492493)
    sub_23111E394();
  return operator new(56 * a2);
}

uint64_t **sub_23111E404(uint64_t **a1, double *a2, _OWORD *a3)
{
  uint64_t *v5;
  uint64_t **v6;
  double v7;
  uint64_t **v8;
  double v9;
  uint64_t *v10;

  v6 = a1 + 1;
  v5 = a1[1];
  if (v5)
  {
    v7 = *a2;
    while (1)
    {
      while (1)
      {
        v8 = (uint64_t **)v5;
        v9 = *((double *)v5 + 4);
        if (v7 >= v9)
          break;
        v5 = (uint64_t *)*v5;
        v6 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (v9 >= v7)
        break;
      v5 = (uint64_t *)v5[1];
      if (!v5)
      {
        v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v8 = a1 + 1;
LABEL_10:
    v10 = (uint64_t *)operator new(0x30uLL);
    *((_OWORD *)v10 + 2) = *a3;
    sub_23111E4BC(a1, (uint64_t)v8, v6, v10);
    return (uint64_t **)v10;
  }
  return v8;
}

uint64_t *sub_23111E4BC(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
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
  result = sub_23111E510(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *sub_23111E510(uint64_t *result, uint64_t *a2)
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

void sub_23111E6A8(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    sub_23111E6A8(a1, *a2);
    sub_23111E6A8(a1, a2[1]);
    operator delete(a2);
  }
}

void *sub_23111E6E8(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    sub_23111E394();
  return operator new(24 * a2);
}

void sub_23111E72C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

uint64_t ACCEL_TABLE_ENTRY::acceleration<int>(unsigned int *a1)
{
  return bswap32(*a1);
}

double ACCEL_TABLE_ENTRY::acceleration<double>(unsigned int *a1)
{
  return (double)(int)bswap32(*a1) * 0.0000152587891;
}

uint64_t ACCEL_TABLE_ENTRY::count(ACCEL_TABLE_ENTRY *this)
{
  return bswap32(*((unsigned __int16 *)this + 2)) >> 16;
}

uint64_t ACCEL_TABLE_ENTRY::x<int>(uint64_t a1, unsigned int a2)
{
  return bswap32(*(_DWORD *)(a1 + 8 * a2 + 6));
}

double ACCEL_TABLE_ENTRY::x<double>(uint64_t a1, unsigned int a2)
{
  return (double)(int)bswap32(*(_DWORD *)(a1 + 8 * a2 + 6)) * 0.0000152587891;
}

uint64_t ACCEL_TABLE_ENTRY::y<int>(uint64_t a1, unsigned int a2)
{
  return bswap32(*(_DWORD *)(a1 + 8 * a2 + 10));
}

double ACCEL_TABLE_ENTRY::y<double>(uint64_t a1, unsigned int a2)
{
  return (double)(int)bswap32(*(_DWORD *)(a1 + 8 * a2 + 10)) * 0.0000152587891;
}

double ACCEL_TABLE_ENTRY::point(ACCEL_TABLE_ENTRY *this, unsigned int a2)
{
  return (double)(int)bswap32(*(_DWORD *)((char *)this + 8 * a2 + 6)) * 0.0000152587891;
}

uint64_t ACCEL_TABLE_ENTRY::length(ACCEL_TABLE_ENTRY *this)
{
  return (bswap32(*((unsigned __int16 *)this + 2)) >> 13) & 0x7FFF8 | 6;
}

uint64_t ACCEL_TABLE::scale<int>(unsigned int *a1)
{
  return bswap32(*a1);
}

double ACCEL_TABLE::scale<double>(unsigned int *a1)
{
  return (double)(int)bswap32(*a1) * 0.0000152587891;
}

uint64_t ACCEL_TABLE::count(ACCEL_TABLE *this)
{
  return bswap32(*((unsigned __int16 *)this + 4)) >> 16;
}

uint64_t ACCEL_TABLE::signature(ACCEL_TABLE *this)
{
  return *((unsigned int *)this + 1);
}

uint64_t ACCEL_TABLE::entry(ACCEL_TABLE *this, int a2)
{
  uint64_t result;

  result = (uint64_t)this + 10;
  if (a2 >= 1)
  {
    do
    {
      result += 8 * (bswap32(*(unsigned __int16 *)(result + 4)) >> 16) + 6;
      --a2;
    }
    while (a2);
  }
  return result;
}

_QWORD *operator<<(_QWORD *a1, uint64_t a2)
{
  uint64_t *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  char v12;

  v4 = sub_23111EC50(a1, (uint64_t)" Table: ", 8);
  v5 = *v4;
  *(_DWORD *)((char *)v4 + *(_QWORD *)(*v4 - 24) + 8) = *(_DWORD *)((_BYTE *)v4 + *(_QWORD *)(*v4 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(uint64_t *)((char *)v4 + *(_QWORD *)(v5 - 24) + 24) = 16;
  v12 = 48;
  sub_23111E9B8(v4, &v12);
  v6 = (_QWORD *)std::ostream::operator<<();
  sub_23111EC50(v6, (uint64_t)"\n", 1);
  sub_23111EC50(a1, (uint64_t)"   scale: ", 10);
  v7 = (_QWORD *)std::ostream::operator<<();
  sub_23111EC50(v7, (uint64_t)"\n", 1);
  if (*(_WORD *)(a2 + 8))
  {
    v8 = 0;
    do
    {
      v9 = a2 + 10;
      if (v8)
      {
        v10 = v8;
        v9 = a2 + 10;
        do
        {
          v9 += 8 * (bswap32(*(unsigned __int16 *)(v9 + 4)) >> 16) + 6;
          --v10;
        }
        while (v10);
      }
      sub_23111EA58(a1, v9);
      ++v8;
    }
    while (v8 < bswap32(*(unsigned __int16 *)(a2 + 8)) >> 16);
  }
  return a1;
}

_QWORD *sub_23111E9B8(_QWORD *a1, char *a2)
{
  char *v3;
  int v4;
  const std::locale::facet *v5;
  int v6;
  std::locale v8;

  v3 = (char *)a1 + *(_QWORD *)(*a1 - 24);
  v4 = *a2;
  if (*((_DWORD *)v3 + 36) == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
    v5 = std::locale::use_facet(&v8, MEMORY[0x24BEDB350]);
    v6 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v5->__vftable[2].~facet_0)(v5, 32);
    std::locale::~locale(&v8);
    *((_DWORD *)v3 + 36) = v6;
  }
  *((_DWORD *)v3 + 36) = v4;
  return a1;
}

void sub_23111EA44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
  std::locale::~locale(&a10);
  _Unwind_Resume(a1);
}

_QWORD *sub_23111EA58(_QWORD *a1, uint64_t a2)
{
  uint64_t *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;

  v4 = sub_23111EC50(a1, (uint64_t)" Entry: ", 8);
  v5 = *v4;
  *(uint64_t *)((char *)v4 + *(_QWORD *)(*v4 - 24) + 24) = 16;
  *(_DWORD *)((char *)v4 + *(_QWORD *)(v5 - 24) + 8) = *(_DWORD *)((_BYTE *)v4 + *(_QWORD *)(v5 - 24) + 8) & 0xFFFFFFB5 | 8;
  v6 = (_QWORD *)std::ostream::operator<<();
  sub_23111EC50(v6, (uint64_t)"\n", 1);
  sub_23111EC50(a1, (uint64_t)"    acceleration: ", 18);
  v7 = (_QWORD *)std::ostream::operator<<();
  sub_23111EC50(v7, (uint64_t)"\n", 1);
  if (*(_WORD *)(a2 + 4))
  {
    v8 = 0;
    v9 = a2 + 10;
    do
    {
      sub_23111EC50(a1, (uint64_t)"    x: ", 7);
      v10 = (_QWORD *)std::ostream::operator<<();
      v11 = sub_23111EC50(v10, (uint64_t)"(", 1);
      *(_DWORD *)((char *)v11 + *(_QWORD *)(*v11 - 24) + 8) = *(_DWORD *)((_BYTE *)v11 + *(_QWORD *)(*v11 - 24) + 8) & 0xFFFFFFB5 | 8;
      v12 = (_QWORD *)std::ostream::operator<<();
      v13 = sub_23111EC50(v12, (uint64_t)")\n", 2);
      sub_23111EC50(v13, (uint64_t)"    y: ", 7);
      v14 = (_QWORD *)std::ostream::operator<<();
      v15 = sub_23111EC50(v14, (uint64_t)"(", 1);
      *(_DWORD *)((char *)v15 + *(_QWORD *)(*v15 - 24) + 8) = *(_DWORD *)((_BYTE *)v15 + *(_QWORD *)(*v15 - 24) + 8) & 0xFFFFFFB5 | 8;
      v9 += 8;
      v16 = (_QWORD *)std::ostream::operator<<();
      sub_23111EC50(v16, (uint64_t)")\n", 2);
      ++v8;
    }
    while (v8 < bswap32(*(unsigned __int16 *)(a2 + 4)) >> 16);
  }
  return a1;
}

_QWORD *sub_23111EC50(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  _QWORD v13[2];
  std::locale v14;

  v13[0] = 0xAAAAAAAAAAAAAAAALL;
  v13[1] = 0xAAAAAAAAAAAAAAAALL;
  MEMORY[0x2348D2A58](v13, a1);
  if (LOBYTE(v13[0]))
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
    if (!sub_23111EDBC(v7, a2, v11, a2 + a3, v6, (char)v9))
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
  MEMORY[0x2348D2A64](v13);
  return a1;
}

void sub_23111ED60(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x2348D2A64](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x23111ED40);
}

void sub_23111EDA8(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t sub_23111EDBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6;
  uint64_t v11;
  int64_t v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  void *__p[3];

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
      memset(__p, 170, sizeof(__p));
      sub_23111EF04(__p, v12, __c);
      v13 = SHIBYTE(__p[2]) >= 0 ? __p : (void **)__p[0];
      v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(_QWORD *)v6 + 96))(v6, v13, v12);
      if (SHIBYTE(__p[2]) < 0)
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

void sub_23111EEE8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_23111EF04(_QWORD *__b, size_t __len, int __c)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    sub_23111EFAC();
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

void sub_23111EFAC()
{
  sub_23111E320("basic_string");
}

IOHIDPointerScrollFilter *IOHIDPointerScrollFilterFactory(uint64_t a1, const void *a2)
{
  const __CFAllocator *v3;
  CFUUIDRef v4;
  IOHIDPointerScrollFilter *v5;
  const __CFUUID *v6;

  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD260];
  v4 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 0x6Bu, 3u, 0x40u, 0xD3u, 0x57u, 0x98u, 0x40u, 0x64u, 0xAAu, 0x17u, 0x92u, 4u, 0xC7u, 0xB0u, 0x6Fu, 0xFDu);
  if (!CFEqual(a2, v4))
    return 0;
  v5 = (IOHIDPointerScrollFilter *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x24BDBD240], 184, 0);
  v6 = CFUUIDGetConstantUUIDWithBytes(v3, 0x73u, 0x61u, 0x69u, 0xDCu, 0xA8u, 0xBCu, 0x45u, 0xB4u, 0xBCu, 0x14u, 0x64u, 0x5Bu, 0x55u, 0x26u, 0xE5u, 0x85u);
  IOHIDPointerScrollFilter::IOHIDPointerScrollFilter(v5, v6);
  return v5;
}

uint64_t IOHIDPointerScrollFilter::AddRef(IOHIDPointerScrollFilter *this, void *a2)
{
  uint64_t v2;

  v2 = (*((_DWORD *)this + 4) + 1);
  *((_DWORD *)this + 4) = v2;
  return v2;
}

uint64_t IOHIDPointerScrollFilter::close(uint64_t result)
{
  *(_QWORD *)(result + 120) = 0;
  return result;
}

{
  *(_QWORD *)(result + 120) = 0;
  return result;
}

void IOHIDPointerScrollFilter::scheduleWithDispatchQueue(IOHIDPointerScrollFilter *this, void *a2, dispatch_queue_s *a3)
{
  *((_QWORD *)this + 10) = a2;
  IOHIDPointerScrollFilter::createAccelStatsTimer((dispatch_queue_t *)this);
  IOHIDPointerScrollFilter::setupAcceleration((CFDictionaryRef *)this);
}

_QWORD *IOHIDPointerScrollFilter::setEventCallback(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  result[3] = a2;
  result[4] = a3;
  result[5] = a4;
  return result;
}

{
  result[3] = a2;
  result[4] = a3;
  result[5] = a4;
  return result;
}

void IOHIDPointerScrollFilter::IOHIDPointerScrollFilter(IOHIDPointerScrollFilter *this, const __CFUUID *a2)
{
  *(_QWORD *)this = &IOHIDPointerScrollFilter::sIOHIDPointerScrollFilterFtbl;
  *((_QWORD *)this + 1) = 0;
  *((_DWORD *)this + 4) = 1;
  *((_QWORD *)this + 10) = 0;
  *(_OWORD *)((char *)this + 20) = 0u;
  *(_OWORD *)((char *)this + 36) = 0u;
  *((_DWORD *)this + 13) = 0;
  sub_23111C040((_QWORD *)this + 11, 0);
  sub_23111C040((_QWORD *)this + 13, 0);
  *((_QWORD *)this + 15) = 0;
  *((_OWORD *)this + 8) = xmmword_231123F30;
  *((_OWORD *)this + 9) = xmmword_231123F40;
  *((_DWORD *)this + 40) = 0;
  *((_WORD *)this + 82) = 257;
  *((_BYTE *)this + 166) = 1;
  *((_QWORD *)this + 21) = 0;
  *((_QWORD *)this + 22) = 60000;
  *((_QWORD *)this + 8) = 0;
  *((_QWORD *)this + 9) = 0;
  *((_QWORD *)this + 7) = 0;
  if (a2)
  {
    *((_QWORD *)this + 1) = CFRetain(a2);
    CFPlugInAddInstanceForFactory(a2);
  }
}

void sub_23111F1F4(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_23111BFF0(v1);
  _Unwind_Resume(a1);
}

void IOHIDPointerScrollFilter::~IOHIDPointerScrollFilter(IOHIDPointerScrollFilter *this)
{
  const __CFUUID *v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;

  v2 = (const __CFUUID *)*((_QWORD *)this + 1);
  if (v2)
  {
    CFPlugInRemoveInstanceForFactory(v2);
    CFRelease(*((CFTypeRef *)this + 1));
  }
  v3 = *((_QWORD *)this + 6);
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  for (i = 56; i != 80; i += 8)
  {
    v5 = *(_QWORD *)((char *)this + i);
    if (v5)
      (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
  }
  sub_23111BFF0((_QWORD *)this + 13);
  sub_23111BFF0((_QWORD *)this + 11);
}

uint64_t IOHIDPointerScrollFilter::QueryInterface(IOHIDPointerScrollFilter *this, CFUUIDBytes a2, void **a3)
{
  CFUUIDRef v5;
  const __CFAllocator *v6;
  CFUUIDRef v7;
  CFUUIDRef v8;
  CFUUIDRef v9;
  uint64_t v10;

  v5 = CFUUIDCreateFromUUIDBytes(0, a2);
  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD260];
  v7 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 5u, 5u, 0xD7u, 0x8Du, 0x4Fu, 0x4Eu, 0x4Cu, 0x41u, 0xA3u, 0xA6u, 0xC7u, 0xA7u, 0x7Bu, 0x41u, 0xBDu, 0xACu);
  if (CFEqual(v5, v7)
    || (v8 = CFUUIDGetConstantUUIDWithBytes(v6, 0xC7u, 0x10u, 0x95u, 0x1Du, 0x18u, 0x40u, 0x45u, 0x6Eu, 0x82u, 0xE7u, 0xFCu, 0xA1u, 0xA0u, 0xFAu, 0x7Fu, 0xE4u), CFEqual(v5, v8))|| (v9 = CFUUIDGetConstantUUIDWithBytes(v6, 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u), CFEqual(v5, v9)))
  {
    v10 = 0;
    ++*((_DWORD *)this + 4);
  }
  else
  {
    this = 0;
    v10 = 2147483652;
  }
  *a3 = this;
  CFRelease(v5);
  return v10;
}

uint64_t IOHIDPointerScrollFilter::AddRef(IOHIDPointerScrollFilter *this)
{
  uint64_t v1;

  v1 = (*((_DWORD *)this + 4) + 1);
  *((_DWORD *)this + 4) = v1;
  return v1;
}

uint64_t IOHIDPointerScrollFilter::Release(IOHIDPointerScrollFilter *this)
{
  int v1;
  uint64_t v2;

  v1 = *((_DWORD *)this + 4);
  v2 = (v1 - 1);
  *((_DWORD *)this + 4) = v2;
  if (v1 == 1)
  {
    IOHIDPointerScrollFilter::~IOHIDPointerScrollFilter(this);
    MEMORY[0x2348D2B0C]();
  }
  return v2;
}

void IOHIDPointerScrollFilter::open(uint64_t a1, uint64_t a2)
{
  const void *v3;

  *(_QWORD *)(a1 + 120) = a2;
  v3 = (const void *)IOHIDServiceCopyProperty();
  if (v3)
  {
    *(_DWORD *)(a1 + 160) = 1;
    CFRelease(v3);
  }
}

void IOHIDPointerScrollFilter::scheduleWithDispatchQueue(IOHIDPointerScrollFilter *this, dispatch_queue_s *a2)
{
  *((_QWORD *)this + 10) = a2;
  IOHIDPointerScrollFilter::createAccelStatsTimer((dispatch_queue_t *)this);
  IOHIDPointerScrollFilter::setupAcceleration((CFDictionaryRef *)this);
}

void IOHIDPointerScrollFilter::createAccelStatsTimer(dispatch_queue_t *this)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, this[10]);
  this[21] = v2;
  if (v2)
  {
    dispatch_set_context(v2, this);
    dispatch_source_set_event_handler_f(this[21], (dispatch_function_t)IOHIDPointerScrollFilter::statsTimerCallback);
    dispatch_source_set_timer(this[21], 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    dispatch_resume(this[21]);
  }
  else
  {
    v3 = _IOHIDLogCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_231122DCC(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

void IOHIDPointerScrollFilter::setupAcceleration(CFDictionaryRef *this)
{
  const __CFNumber *v2;
  const __CFNumber *v3;
  CFTypeID v4;
  const __CFNumber *v5;
  const __CFNumber *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t RegistryID;
  void *v10;
  CFNumberRef number;
  int valuePtr;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (this[15])
  {
    v10 = (void *)0xAAAAAAAAAAAAAAAALL;
    number = (CFNumberRef)0xAAAAAAAAAAAAAAAALL;
    v2 = (const __CFNumber *)IOHIDPointerScrollFilter::copyCachedProperty(this, CFSTR("HIDPointerAccelerationMultiplier"));
    if (v2)
    {
      v3 = v2;
      v4 = CFGetTypeID(v2);
      if (v4 == CFNumberGetTypeID())
        v5 = v3;
      else
        v5 = 0;
      v10 = &unk_250001678;
      number = v5;
      if (v5)
      {
        valuePtr = 0;
        CFNumberGetValue(v5, kCFNumberSInt32Type, &valuePtr);
        if (valuePtr)
        {
          v6 = number;
          goto LABEL_13;
        }
      }
    }
    else
    {
      v10 = &unk_250001678;
      number = 0;
    }
    sub_231122B18(&valuePtr, 0x10000);
    sub_2311209CC((uint64_t)&v10, (uint64_t)&valuePtr);
    sub_23111C114(&valuePtr);
    v6 = number;
    if (!number)
    {
      v8 = _IOHIDLogCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        RegistryID = (uint64_t)this[15];
        if (RegistryID)
          RegistryID = IOHIDServiceGetRegistryID();
        valuePtr = 138412290;
        v13 = RegistryID;
        _os_log_impl(&dword_23111A000, v8, OS_LOG_TYPE_INFO, "[%@] Could not get/create pointer acceleration multiplier\n", (uint8_t *)&valuePtr, 0xCu);
      }
      goto LABEL_14;
    }
LABEL_13:
    valuePtr = 0;
    CFNumberGetValue(v6, kCFNumberSInt32Type, &valuePtr);
    IOHIDPointerScrollFilter::setupPointerAcceleration((IOHIDPointerScrollFilter *)this, (double)valuePtr * 0.0000152587891);
    IOHIDPointerScrollFilter::setupScrollAcceleration(this, 1.0);
    IOHIDPointerScrollFilter::startAccelStatsTimer((IOHIDPointerScrollFilter *)this);
LABEL_14:
    sub_23111C114(&v10);
    return;
  }
  v7 = _IOHIDLogCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_231122E00((uint64_t)this, v7);
}

void sub_23111F730(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_23111C114(&a9);
  _Unwind_Resume(a1);
}

void IOHIDPointerScrollFilter::unscheduleFromDispatchQueue(CFTypeRef *this, dispatch_queue_s *a2)
{
  CFTypeRef v3;
  NSObject *v4;
  _QWORD v5[6];

  if (this[21])
  {
    v3 = CFRetain(this[15]);
    v4 = this[10];
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 0x40000000;
    v5[2] = sub_23111F7E0;
    v5[3] = &unk_250001978;
    v5[4] = this;
    v5[5] = v3;
    dispatch_async(v4, v5);
  }
  this[10] = 0;
}

void sub_23111F7E0(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  dispatch_source_cancel(*(dispatch_source_t *)(v2 + 168));
  dispatch_release(*(dispatch_object_t *)(v2 + 168));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

CFTypeRef IOHIDPointerScrollFilter::copyPropertyForClient(IOHIDPointerScrollFilter *this, CFTypeRef cf1, const void *a3)
{
  CFTypeRef v4;
  unint64_t v6;
  CFTypeRef cf;

  if (!CFEqual(cf1, CFSTR("ServiceFilterDebug")))
    return 0;
  v6 = 0xAAAAAAAAAAAAAAAALL;
  cf = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
  sub_23111C040(&v6, 0);
  IOHIDPointerScrollFilter::serialize(this, (__CFDictionary *)cf);
  if (cf)
    v4 = CFRetain(cf);
  else
    v4 = 0;
  sub_23111BFF0(&v6);
  return v4;
}

void sub_23111F8A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_23111BFF0(&a9);
  _Unwind_Resume(a1);
}

_QWORD *IOHIDPointerScrollFilter::serialize(IOHIDPointerScrollFilter *this, __CFDictionary *a2)
{
  const void *v3;
  const __CFNumber *v4;
  const __CFNumber *v5;
  CFTypeID v6;
  const __CFNumber *v7;
  CFTypeID v8;
  const __CFString *v9;
  const void *v10;
  const __CFNumber *v11;
  const __CFNumber *v12;
  CFTypeID v13;
  const __CFNumber *v14;
  CFTypeID v15;
  const __CFString *v16;
  const void *v17;
  uint64_t v18;
  char *v19;
  void **v20;
  std::string::size_type v21;
  std::string *v22;
  __int128 v23;
  void **v24;
  std::string::size_type v25;
  std::string *v26;
  __int128 v27;
  void *v29[2];
  unsigned __int8 v30;
  void *v31[2];
  unsigned __int8 v32;
  std::string valuePtr;
  std::string value;
  void *__p[2];
  std::string::size_type v36;
  unint64_t v37;
  void *key;
  unint64_t v39;
  void *v40;
  void *v41;
  CFNumberRef v42;
  void *v43;
  unint64_t v44;
  void *v45;
  CFNumberRef v46;
  _QWORD v47[2];
  void *v48;
  CFMutableDictionaryRef v49;

  v48 = (void *)0xAAAAAAAAAAAAAAAALL;
  v49 = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
  sub_23111BEFC(&v48, a2, 0);
  v48 = &unk_2500015D8;
  if (v49)
  {
    v3 = IOHIDPointerScrollFilter::copyCachedProperty((CFDictionaryRef *)this, CFSTR("HIDPointerAccelerationType"));
    v47[0] = &unk_250001AA0;
    v47[1] = v3;
    if (v3)
      CFDictionarySetValue(v49, CFSTR("HIDPointerAccelerationType"), v3);
    v45 = (void *)0xAAAAAAAAAAAAAAAALL;
    v46 = (CFNumberRef)0xAAAAAAAAAAAAAAAALL;
    v4 = (const __CFNumber *)IOHIDPointerScrollFilter::copyCachedProperty((CFDictionaryRef *)this, CFSTR("HIDPointerAccelerationAlgorithm"));
    v5 = v4;
    if (v4)
    {
      v6 = CFGetTypeID(v4);
      if (v6 == CFNumberGetTypeID())
        v7 = v5;
      else
        v7 = 0;
      v45 = &unk_250001678;
      v46 = v7;
      if (v7)
      {
        v8 = CFGetTypeID(v7);
        if (v8 == CFNumberGetTypeID())
        {
          value.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
          value.__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
          valuePtr.__r_.__value_.__s.__data_[0] = 0;
          CFNumberGetValue(v46, kCFNumberSInt8Type, &valuePtr);
          if ((unint64_t)valuePtr.__r_.__value_.__s.__data_[0] > 2)
            v9 = CFSTR("Unknown");
          else
            v9 = *(&off_250001B10 + valuePtr.__r_.__value_.__s.__data_[0]);
          sub_23112289C(&value, v9, 0);
          if (value.__r_.__value_.__l.__size_)
            CFDictionarySetValue(v49, CFSTR("HIDPointerAccelerationAlgorithm"), (const void *)value.__r_.__value_.__l.__size_);
          sub_231122964(&value);
        }
      }
    }
    else
    {
      v45 = &unk_250001678;
      v46 = 0;
    }
    v43 = (void *)0xAAAAAAAAAAAAAAAALL;
    v44 = 0xAAAAAAAAAAAAAAAALL;
    v10 = IOHIDPointerScrollFilter::copyCachedProperty((CFDictionaryRef *)this, CFSTR("HIDScrollAccelerationType"));
    v43 = &unk_250001AA0;
    v44 = (unint64_t)v10;
    if (v10)
      CFDictionarySetValue(v49, CFSTR("HIDScrollAccelerationType"), v10);
    v41 = (void *)0xAAAAAAAAAAAAAAAALL;
    v42 = (CFNumberRef)0xAAAAAAAAAAAAAAAALL;
    v11 = (const __CFNumber *)IOHIDPointerScrollFilter::copyCachedProperty((CFDictionaryRef *)this, CFSTR("HIDScrollAccelerationAlgorithm"));
    v12 = v11;
    if (v11)
    {
      v13 = CFGetTypeID(v11);
      if (v13 == CFNumberGetTypeID())
        v14 = v12;
      else
        v14 = 0;
      v41 = &unk_250001678;
      v42 = v14;
      if (v14)
      {
        v15 = CFGetTypeID(v14);
        if (v15 == CFNumberGetTypeID())
        {
          value.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
          value.__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
          valuePtr.__r_.__value_.__s.__data_[0] = 0;
          CFNumberGetValue(v42, kCFNumberSInt8Type, &valuePtr);
          if ((unint64_t)valuePtr.__r_.__value_.__s.__data_[0] > 2)
            v16 = CFSTR("Unknown");
          else
            v16 = *(&off_250001B10 + valuePtr.__r_.__value_.__s.__data_[0]);
          sub_23112289C(&value, v16, 0);
          if (value.__r_.__value_.__l.__size_)
            CFDictionarySetValue(v49, CFSTR("HIDScrollAccelerationAlgorithm"), (const void *)value.__r_.__value_.__l.__size_);
          sub_231122964(&value);
        }
      }
    }
    else
    {
      v41 = &unk_250001678;
      v42 = 0;
    }
    CFDictionarySetValue(v49, CFSTR("Class"), CFSTR("IOHIDPointerScrollFilter"));
    sub_23111B770((uint64_t)&v48, CFSTR("PointerAccelerationValue"), vcvtd_n_u64_f64(*((double *)this + 16), 0x10uLL));
    sub_23111B770((uint64_t)&v48, CFSTR("PointerAccelerationMinimum"), vcvtd_n_u64_f64(*((double *)this + 17), 0x10uLL));
    sub_23111B770((uint64_t)&v48, CFSTR("ScrollAccelerationValue"), vcvtd_n_u64_f64(*((double *)this + 18), 0x10uLL));
    sub_23111B770((uint64_t)&v48, CFSTR("MatchScore"), *((int *)this + 5));
    v17 = (const void *)*((_QWORD *)this + 12);
    if (v17)
      CFDictionarySetValue(v49, CFSTR("Property"), v17);
    if (*((_QWORD *)this + 6))
    {
      value.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
      value.__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
      sub_23111C040(&value, 0);
      (*(void (**)(_QWORD, std::string::size_type))(**((_QWORD **)this + 6) + 24))(*((_QWORD *)this + 6), value.__r_.__value_.__l.__size_);
      if (value.__r_.__value_.__l.__size_)
        CFDictionarySetValue(v49, CFSTR("Pointer Accelerator"), (const void *)value.__r_.__value_.__l.__size_);
      sub_23111BFF0(&value);
    }
    v18 = 0;
    v19 = (char *)this + 56;
    do
    {
      if (*(_QWORD *)&v19[v18 * 8])
      {
        v39 = 0xAAAAAAAAAAAAAAAALL;
        v40 = (void *)0xAAAAAAAAAAAAAAAALL;
        sub_23111C040(&v39, 0);
        v37 = 0xAAAAAAAAAAAAAAAALL;
        key = (void *)0xAAAAAAAAAAAAAAAALL;
        sub_231122A04(&valuePtr, "Scroll Accelerator(axis: ");
        sub_231122A04(v31, off_2500019C8[v18]);
        if ((v32 & 0x80u) == 0)
          v20 = v31;
        else
          v20 = (void **)v31[0];
        if ((v32 & 0x80u) == 0)
          v21 = v32;
        else
          v21 = (std::string::size_type)v31[1];
        v22 = std::string::append(&valuePtr, (const std::string::value_type *)v20, v21);
        v23 = *(_OWORD *)&v22->__r_.__value_.__l.__data_;
        value.__r_.__value_.__r.__words[2] = v22->__r_.__value_.__r.__words[2];
        *(_OWORD *)&value.__r_.__value_.__l.__data_ = v23;
        v22->__r_.__value_.__l.__size_ = 0;
        v22->__r_.__value_.__r.__words[2] = 0;
        v22->__r_.__value_.__r.__words[0] = 0;
        sub_231122A04(v29, ")");
        if ((v30 & 0x80u) == 0)
          v24 = v29;
        else
          v24 = (void **)v29[0];
        if ((v30 & 0x80u) == 0)
          v25 = v30;
        else
          v25 = (std::string::size_type)v29[1];
        v26 = std::string::append(&value, (const std::string::value_type *)v24, v25);
        v27 = *(_OWORD *)&v26->__r_.__value_.__l.__data_;
        v36 = v26->__r_.__value_.__r.__words[2];
        *(_OWORD *)__p = v27;
        v26->__r_.__value_.__l.__size_ = 0;
        v26->__r_.__value_.__r.__words[2] = 0;
        v26->__r_.__value_.__r.__words[0] = 0;
        sub_2311229A4(&v37, (const char *)__p);
        if (SHIBYTE(v36) < 0)
          operator delete(__p[0]);
        if ((char)v30 < 0)
          operator delete(v29[0]);
        if (SHIBYTE(value.__r_.__value_.__r.__words[2]) < 0)
          operator delete(value.__r_.__value_.__l.__data_);
        if ((char)v32 < 0)
          operator delete(v31[0]);
        if (SHIBYTE(valuePtr.__r_.__value_.__r.__words[2]) < 0)
          operator delete(valuePtr.__r_.__value_.__l.__data_);
        (*(void (**)(_QWORD, void *))(**(_QWORD **)&v19[v18 * 8] + 24))(*(_QWORD *)&v19[v18 * 8], v40);
        if (key && v40)
          CFDictionarySetValue(v49, key, v40);
        sub_231122964(&v37);
        sub_23111BFF0(&v39);
      }
      ++v18;
    }
    while (v18 != 3);
    sub_23111C114(&v41);
    sub_231122964(&v43);
    sub_23111C114(&v45);
    sub_231122964(v47);
  }
  return sub_23111BFF0(&v48);
}

void sub_23111FDDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34,void *__p,uint64_t a36,int a37,__int16 a38,char a39,char a40,uint64_t a41,char a42,uint64_t a43,char a44)
{
  uint64_t v44;

  sub_231122964(&a28);
  sub_23111C114((_QWORD *)(v44 - 160));
  sub_231122964((_QWORD *)(v44 - 144));
  sub_23111C114((_QWORD *)(v44 - 128));
  sub_231122964((_QWORD *)(v44 - 112));
  sub_23111BFF0((_QWORD *)(v44 - 96));
  _Unwind_Resume(a1);
}

void IOHIDPointerScrollFilter::setPropertyForClient(CFMutableDictionaryRef *this, CFStringRef theString1, const void *a3, const void *a4)
{
  uint64_t v8;
  CFTypeID v9;
  NSObject *v10;
  uint64_t RegistryID;
  CFMutableDictionaryRef v12;
  const char *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  CFStringRef v17;
  __int16 v18;
  const void *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (theString1)
  {
    if (CFStringCompare(theString1, CFSTR("DropAccelPropertyEvents"), 0))
    {
      if (CFStringCompare(theString1, CFSTR("IOHIDAcclerationStatsDelayMS"), 0))
      {
        v8 = 0;
        while (!CFEqual(theString1, *(__CFString **)((char *)&IOHIDPointerScrollFilter::_cachedPropertyList + v8)))
        {
          v8 += 8;
          if (v8 == 152)
            return;
        }
        if (a3)
        {
          CFDictionarySetValue(this[14], theString1, a3);
          CFDictionarySetValue(this[12], theString1, a3);
        }
        v10 = _IOHIDLogCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          RegistryID = (uint64_t)this[15];
          if (RegistryID)
            RegistryID = IOHIDServiceGetRegistryID();
          v12 = this[10];
          v14 = 138413314;
          if (v12)
            v13 = "yes";
          else
            v13 = "no";
          v15 = RegistryID;
          v16 = 2112;
          v17 = theString1;
          v18 = 2112;
          v19 = a3;
          v20 = 2080;
          v21 = v13;
          v22 = 2112;
          v23 = a4;
          _os_log_impl(&dword_23111A000, v10, OS_LOG_TYPE_DEFAULT, "[%@] Acceleration key:%@ value:%@ apply:%s client:%@\n", (uint8_t *)&v14, 0x34u);
        }
        if (this[10])
        {
          IOHIDPointerScrollFilter::setupAcceleration(this);
          CFDictionaryRemoveAllValues(this[14]);
        }
      }
      else
      {
        v9 = CFGetTypeID(a3);
        if (v9 == CFNumberGetTypeID())
          CFNumberGetValue((CFNumberRef)a3, kCFNumberLongLongType, this + 22);
      }
    }
    else
    {
      *((_BYTE *)this + 166) = *MEMORY[0x24BDBD270] == (_QWORD)a3;
    }
  }
}

uint64_t IOHIDPointerScrollFilter::match(uint64_t a1)
{
  int v2;
  NSObject *v3;
  uint64_t RegistryID;
  int v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (IOHIDServiceConformsTo() || IOHIDServiceConformsTo())
  {
    v2 = 100;
  }
  else
  {
    v2 = 100;
    if (!IOHIDServiceConformsTo())
    {
      if (IOHIDServiceConformsTo())
        v2 = 100;
      else
        v2 = 0;
    }
  }
  *(_DWORD *)(a1 + 20) = v2;
  v3 = _IOHIDLogCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    RegistryID = IOHIDServiceGetRegistryID();
    v6 = *(_DWORD *)(a1 + 20);
    v7 = 134218498;
    v8 = a1;
    v9 = 2112;
    v10 = RegistryID;
    v11 = 1024;
    v12 = v6;
    _os_log_debug_impl(&dword_23111A000, v3, OS_LOG_TYPE_DEBUG, "(%p) for ServiceID %@ with score %d\n", (uint8_t *)&v7, 0x1Cu);
  }
  return *(unsigned int *)(a1 + 20);
}

uint64_t IOHIDPointerScrollFilter::filter(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  if (!a2)
    return 0;
  v3 = IOHIDPointerScrollFilter::filterPropertyEvent((uint64_t)a1, a2);
  if (a1[6] && IOHIDEventConformsTo() && !IOHIDEventIsAbsolute()
    || (a1[7] || a1[8] || a1[9]) && IOHIDEventConformsTo())
  {
    IOHIDPointerScrollFilter::accelerateEvent((uint64_t)a1);
  }
  return v3;
}

uint64_t IOHIDPointerScrollFilter::filterPropertyEvent(uint64_t a1, uint64_t a2)
{
  const char *DataValue;
  size_t IntegerValue;
  const __CFDictionary *v6;
  NSObject *v7;
  CFStringRef v8;
  const __CFDictionary *v9;
  CFTypeID v10;
  const __CFDictionary *Value;
  const __CFDictionary *v12;
  CFTypeID v13;
  int v14;
  CFStringRef errorString;

  if (IOHIDEventConformsTo() && IOHIDEventGetIntegerValue() == 65280 && IOHIDEventGetIntegerValue() == 91)
  {
    DataValue = (const char *)IOHIDEventGetDataValue();
    errorString = 0;
    IntegerValue = IOHIDEventGetIntegerValue();
    v6 = (const __CFDictionary *)IOCFUnserializeBinary(DataValue, IntegerValue, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0, &errorString);
    if (errorString)
    {
      v7 = _IOHIDLogCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_231122E74(&errorString, v7);
      v8 = errorString;
      goto LABEL_16;
    }
    v9 = v6;
    if (v6)
    {
      v10 = CFGetTypeID(v6);
      if (v10 != CFDictionaryGetTypeID()
        || (Value = (const __CFDictionary *)CFDictionaryGetValue(v9, CFSTR("IOHIDSetAcceleration"))) == 0
        || (v12 = Value, v13 = CFGetTypeID(Value), v13 != CFDictionaryGetTypeID()))
      {
        v8 = (CFStringRef)v9;
LABEL_16:
        CFRelease(v8);
        return a2;
      }
      CFDictionaryApplyFunction(v12, (CFDictionaryApplierFunction)sub_231120858, *(void **)(a1 + 120));
      v14 = *(unsigned __int8 *)(a1 + 166);
      CFRelease(v9);
      if (v14)
        return 0;
    }
  }
  return a2;
}

uint64_t IOHIDPointerScrollFilter::accelerateEvent(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  uint64_t v5;
  uint64_t TimeStamp;
  uint64_t Copy;
  const void *v8;
  __CFArray *Children;
  const __CFNumber *v10;
  const __CFNumber *v11;
  CFTypeID v12;
  double v13;
  double v14;
  NSObject *v15;
  uint64_t RegistryID;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int *v20;
  double v21;
  double *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const void *v26;
  __CFArray *v27;
  uint64_t i;
  float valuePtr;
  _BYTE buf[22];
  __int16 v32;
  uint64_t v33;
  _QWORD v34[4];

  v34[3] = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 48))
  {
    if (*(_BYTE *)(a1 + 164))
    {
      if (IOHIDEventGetType() == 17
        && (IOHIDEventGetEventFlags() & 0x100) == 0
        && (IOHIDEventGetEventFlags() & 0x10000) == 0)
      {
        IOHIDEventGetFloatValue();
        v3 = v2;
        *(double *)buf = v2;
        IOHIDEventGetFloatValue();
        *(double *)&buf[8] = v4;
        if (v3 != 0.0 || v4 != 0.0)
        {
          v5 = *(_QWORD *)(a1 + 48);
          TimeStamp = IOHIDEventGetTimeStamp();
          if ((*(unsigned int (**)(uint64_t, _BYTE *, uint64_t, uint64_t))(*(_QWORD *)v5 + 16))(v5, buf, 2, TimeStamp))
          {
            Copy = IOHIDEventCreateCopy();
            if (Copy)
            {
              v8 = (const void *)Copy;
              Children = (__CFArray *)IOHIDEventGetChildren();
              if (Children)
                CFArrayRemoveAllValues(Children);
              IOHIDEventSetFloatValue();
              IOHIDEventSetFloatValue();
              IOHIDEventGetEventFlags();
              IOHIDEventSetEventFlags();
              IOHIDEventAppendEvent();
              CFRelease(v8);
            }
          }
        }
      }
    }
  }
  if (*(_BYTE *)(a1 + 165)
    && IOHIDEventGetType() == 6
    && (IOHIDEventGetEventFlags() & 0x100) == 0
    && (IOHIDEventGetEventFlags() & 0x10000) == 0)
  {
    memset(v34, 255, 24);
    if (IOHIDEventGetScrollMomentum() && (v10 = (const __CFNumber *)_IOHIDEventCopyAttachment()) != 0)
    {
      v11 = v10;
      v12 = CFGetTypeID(v10);
      if (v12 == CFNumberGetTypeID())
      {
        v13 = *(double *)(a1 + 152);
        valuePtr = 60.0;
        CFNumberGetValue(v11, kCFNumberFloatType, &valuePtr);
        v14 = valuePtr / 60.0;
        *(double *)(a1 + 152) = v14;
        if (vabdd_f64(v13, v14) > 0.5)
        {
          v15 = _IOHIDLogCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            RegistryID = *(_QWORD *)(a1 + 120);
            if (RegistryID)
              RegistryID = IOHIDServiceGetRegistryID();
            v17 = *(_QWORD *)(a1 + 152);
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = RegistryID;
            *(_WORD *)&buf[12] = 2048;
            *(double *)&buf[14] = v13;
            v32 = 2048;
            v33 = v17;
            _os_log_impl(&dword_23111A000, v15, OS_LOG_TYPE_INFO, "[%@] _scrollMomentumMult:%.3f->%.3f\n", buf, 0x20u);
          }
        }
      }
      else
      {
        *(_QWORD *)(a1 + 152) = 0x3FF0000000000000;
      }
      CFRelease(v11);
    }
    else
    {
      *(_QWORD *)(a1 + 152) = 0x3FF0000000000000;
    }
    v18 = 0;
    v19 = 0;
    v20 = &dword_231123F88;
    do
    {
      ++v20;
      IOHIDEventGetFloatValue();
      v22 = (double *)&v34[v18];
      *(double *)&v34[v18] = v21;
      if (v21 != 0.0)
      {
        v23 = *(_QWORD *)(a1 + 56 + v18 * 8);
        if (v23)
        {
          *v22 = *(double *)(a1 + 152) * v21;
          v24 = IOHIDEventGetTimeStamp();
          v19 |= (*(uint64_t (**)(uint64_t, _QWORD *, uint64_t, uint64_t))(*(_QWORD *)v23 + 16))(v23, &v34[v18], 1, v24);
          *v22 = *v22 / *(double *)(a1 + 152);
        }
      }
      ++v18;
    }
    while (v18 != 3);
    if ((v19 & 1) != 0)
    {
      v25 = IOHIDEventCreateCopy();
      if (v25)
      {
        v26 = (const void *)v25;
        v27 = (__CFArray *)IOHIDEventGetChildren();
        if (v27)
          CFArrayRemoveAllValues(v27);
        for (i = 0; i != 3; ++i)
        {
          *(double *)&v34[i] = *(double *)&v34[i] * 10.0;
          IOHIDEventSetFloatValue();
        }
        IOHIDEventGetEventFlags();
        IOHIDEventSetEventFlags();
        IOHIDEventAppendEvent();
        CFRelease(v26);
      }
    }
  }
  return IOHIDPointerScrollFilter::accelerateChildrens(a1);
}

uint64_t sub_231120858()
{
  return IOHIDServiceSetProperty();
}

uint64_t IOHIDPointerScrollFilter::accelerateChildrens(uint64_t a1)
{
  uint64_t result;
  const __CFArray *v3;
  uint64_t v4;
  CFIndex i;
  const void *ValueAtIndex;

  result = IOHIDEventGetChildren();
  if (result)
  {
    v3 = (const __CFArray *)result;
    result = CFArrayGetCount((CFArrayRef)result);
    if (result >= 1)
    {
      v4 = result;
      for (i = 0; i != v4; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v3, i);
        result = IOHIDPointerScrollFilter::accelerateEvent(a1, ValueAtIndex);
      }
    }
  }
  return result;
}

uint64_t IOHIDPointerScrollFilter::createPointerTableAlgorithm(IOHIDPointerScrollFilter *this, int a2)
{
  IOHIDTableAcceleration *v4;
  const __CFData *v5;
  CFDataRef v6;
  uint64_t v7;
  _QWORD v9[2];
  void *v10;
  IOHIDTableAcceleration *v11;

  v4 = (IOHIDTableAcceleration *)IOHIDServiceCopyProperty();
  v10 = &unk_250001AC0;
  v11 = v4;
  if (v4
    || (v6 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], byte_231123F94, 102),
        v9[0] = &unk_250001AC0,
        v9[1] = v6,
        sub_2311209CC((uint64_t)&v10, (uint64_t)v9),
        sub_231122AD8(v9),
        (v4 = v11) != 0))
  {
    v7 = IOHIDTableAcceleration::CreateWithTable(v4, v5, *((double *)this + 16), (double)a2 * 0.0000152587891, 67.0);
  }
  else
  {
    v7 = 0;
  }
  sub_231122AD8(&v10);
  return v7;
}

void sub_2311209A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  sub_231122AD8(&a9);
  sub_231122AD8(&a11);
  _Unwind_Resume(a1);
}

uint64_t sub_2311209CC(uint64_t a1, uint64_t a2)
{
  const void *v3;
  const void *v4;

  v3 = *(const void **)(a1 + 8);
  v4 = *(const void **)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  if (v4)
    CFRetain(v4);
  if (v3)
    CFRelease(v3);
  return a1;
}

uint64_t IOHIDPointerScrollFilter::createPointerParametricAlgorithm(IOHIDPointerScrollFilter *this, int a2)
{
  const __CFArray *v4;
  const __CFArray *v5;
  CFTypeID v6;
  CFTypeID TypeID;
  IOHIDParametricAcceleration *v8;
  const __CFArray *v9;
  uint64_t v10;
  IOHIDParametricAcceleration *v11;
  const __CFArray *v12;
  _QWORD v14[2];
  void *v15;
  IOHIDParametricAcceleration *v16;

  v15 = (void *)0xAAAAAAAAAAAAAAAALL;
  v16 = (IOHIDParametricAcceleration *)0xAAAAAAAAAAAAAAAALL;
  v4 = (const __CFArray *)IOHIDPointerScrollFilter::copyCachedProperty((CFDictionaryRef *)this, CFSTR("UserPointerAccelCurvesKey"));
  if (v4)
  {
    v5 = v4;
    v6 = CFGetTypeID(v4);
    TypeID = CFArrayGetTypeID();
    if (v6 == TypeID)
      v8 = v5;
    else
      v8 = 0;
    v15 = &unk_250001848;
    v16 = v8;
    if (v6 == TypeID && CFArrayGetCount(v5) >= 1)
    {
      v10 = IOHIDParametricAcceleration::CreateWithParameters(v16, v9, *((double *)this + 16), (double)a2 * 0.0000152587891, 67.0);
      goto LABEL_13;
    }
  }
  else
  {
    v15 = &unk_250001848;
    v16 = 0;
  }
  v11 = (IOHIDParametricAcceleration *)IOHIDServiceCopyProperty();
  v14[0] = &unk_2500018C8;
  v14[1] = v11;
  if (v11)
    v10 = IOHIDParametricAcceleration::CreateWithParameters(v11, v12, *((double *)this + 16), (double)a2 * 0.0000152587891, 67.0);
  else
    v10 = 0;
  sub_23111DFB8(v14);
LABEL_13:
  sub_23111DFB8(&v15);
  return v10;
}

void sub_231120B34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  sub_23111DFB8(&a9);
  sub_23111DFB8(&a11);
  _Unwind_Resume(a1);
}

const void *IOHIDPointerScrollFilter::copyCachedProperty(CFDictionaryRef *this, const __CFString *a2)
{
  const void *Value;

  Value = CFDictionaryGetValue(this[14], a2);
  if (Value
    || (Value = (const void *)IOHIDServiceCopyProperty()) == 0 && (Value = CFDictionaryGetValue(this[12], a2)) != 0)
  {
    CFRetain(Value);
  }
  return Value;
}

uint64_t IOHIDPointerScrollFilter::createPointerAlgorithm(CFDictionaryRef *this, int a2)
{
  const __CFNumber *v4;
  const __CFNumber *v5;
  CFTypeID v6;
  const __CFNumber *v7;
  CFTypeID v8;
  uint64_t PointerParametricAlgorithm;
  uint64_t PointerTableAlgorithm;
  void *v12;
  CFNumberRef number;
  int valuePtr;

  v12 = (void *)0xAAAAAAAAAAAAAAAALL;
  number = (CFNumberRef)0xAAAAAAAAAAAAAAAALL;
  v4 = (const __CFNumber *)IOHIDPointerScrollFilter::copyCachedProperty(this, CFSTR("HIDPointerAccelerationAlgorithm"));
  if (!v4)
  {
    v12 = &unk_250001678;
    number = 0;
    goto LABEL_12;
  }
  v5 = v4;
  v6 = CFGetTypeID(v4);
  if (v6 == CFNumberGetTypeID())
    v7 = v5;
  else
    v7 = 0;
  v12 = &unk_250001678;
  number = v7;
  if (!v7)
    goto LABEL_12;
  v8 = CFGetTypeID(v7);
  if (v8 != CFNumberGetTypeID())
    goto LABEL_12;
  valuePtr = 0;
  CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
  switch(valuePtr)
  {
    case 0:
LABEL_13:
      PointerTableAlgorithm = IOHIDPointerScrollFilter::createPointerTableAlgorithm((IOHIDPointerScrollFilter *)this, a2);
LABEL_14:
      PointerParametricAlgorithm = PointerTableAlgorithm;
      goto LABEL_15;
    case 1:
      PointerTableAlgorithm = IOHIDPointerScrollFilter::createPointerParametricAlgorithm((IOHIDPointerScrollFilter *)this, a2);
      goto LABEL_14;
    case 2:
LABEL_12:
      PointerParametricAlgorithm = IOHIDPointerScrollFilter::createPointerParametricAlgorithm((IOHIDPointerScrollFilter *)this, a2);
      if (PointerParametricAlgorithm)
        goto LABEL_15;
      goto LABEL_13;
  }
  PointerParametricAlgorithm = 0;
LABEL_15:
  sub_23111C114(&v12);
  return PointerParametricAlgorithm;
}

void sub_231120CE8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_23111C114((uint64_t *)va);
  _Unwind_Resume(a1);
}

const void *sub_231120D00(uint64_t a1)
{
  const void *result;
  CFTypeID v2;

  result = *(const void **)(a1 + 8);
  if (result)
  {
    v2 = CFGetTypeID(result);
    return (const void *)(v2 == CFNumberGetTypeID());
  }
  return result;
}

uint64_t IOHIDPointerScrollFilter::createScrollTableAlgorithm(IOHIDPointerScrollFilter *this, unint64_t a2, int a3, int a4)
{
  IOHIDTableAcceleration *v7;
  const __CFData *v8;
  CFDataRef v9;
  uint64_t v10;
  void *v12;
  uint64_t v13;
  void *v14;
  IOHIDTableAcceleration *v15;

  v7 = (IOHIDTableAcceleration *)IOHIDServiceCopyProperty();
  v14 = &unk_250001AC0;
  v15 = v7;
  if (v7)
    goto LABEL_4;
  v12 = &unk_250001AC0;
  v13 = IOHIDServiceCopyProperty();
  sub_2311209CC((uint64_t)&v14, (uint64_t)&v12);
  sub_231122AD8(&v12);
  v7 = v15;
  if (v15
    || (v9 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], byte_231123F94, 102),
        v12 = &unk_250001AC0,
        v13 = (uint64_t)v9,
        sub_2311209CC((uint64_t)&v14, (uint64_t)&v12),
        sub_231122AD8(&v12),
        (v7 = v15) != 0))
  {
LABEL_4:
    v10 = IOHIDTableAcceleration::CreateWithTable(v7, v8, *((double *)this + 18), (double)a3 * 0.0000152587891, (double)a4 * 0.0000152587891);
  }
  else
  {
    v10 = 0;
  }
  sub_231122AD8(&v14);
  return v10;
}

void sub_231120E3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  sub_231122AD8(&a9);
  sub_231122AD8(&a11);
  _Unwind_Resume(a1);
}

uint64_t IOHIDPointerScrollFilter::createScrollParametricAlgorithm(IOHIDPointerScrollFilter *this, unint64_t a2, int a3, int a4)
{
  const __CFArray *v7;
  const __CFArray *v8;
  CFTypeID v9;
  CFTypeID TypeID;
  IOHIDParametricAcceleration *v11;
  const __CFArray *v12;
  uint64_t v13;
  IOHIDParametricAcceleration *v14;
  const __CFArray *v15;
  _QWORD v17[2];
  void *v18;
  IOHIDParametricAcceleration *v19;

  v18 = (void *)0xAAAAAAAAAAAAAAAALL;
  v19 = (IOHIDParametricAcceleration *)0xAAAAAAAAAAAAAAAALL;
  v7 = (const __CFArray *)IOHIDPointerScrollFilter::copyCachedProperty((CFDictionaryRef *)this, CFSTR("UserScrollAccelCurvesKey"));
  if (v7)
  {
    v8 = v7;
    v9 = CFGetTypeID(v7);
    TypeID = CFArrayGetTypeID();
    if (v9 == TypeID)
      v11 = v8;
    else
      v11 = 0;
    v18 = &unk_250001848;
    v19 = v11;
    if (v9 == TypeID && CFArrayGetCount(v8) >= 1)
    {
      v13 = IOHIDParametricAcceleration::CreateWithParameters(v19, v12, *((double *)this + 18), (double)a3 * 0.0000152587891, (double)a4 * 0.0000152587891);
      goto LABEL_13;
    }
  }
  else
  {
    v18 = &unk_250001848;
    v19 = 0;
  }
  v14 = (IOHIDParametricAcceleration *)IOHIDServiceCopyProperty();
  v17[0] = &unk_2500018C8;
  v17[1] = v14;
  if (v14)
    v13 = IOHIDParametricAcceleration::CreateWithParameters(v14, v15, *((double *)this + 18), (double)a3 * 0.0000152587891, (double)a4 * 0.0000152587891);
  else
    v13 = 0;
  sub_23111DFB8(v17);
LABEL_13:
  sub_23111DFB8(&v18);
  return v13;
}

void sub_231120F9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  sub_23111DFB8(&a9);
  sub_23111DFB8(&a11);
  _Unwind_Resume(a1);
}

uint64_t IOHIDPointerScrollFilter::createScrollAlgorithm(CFDictionaryRef *this, unint64_t a2, int a3, int a4)
{
  const __CFNumber *v8;
  unint64_t v9;
  const __CFNumber *v10;
  CFTypeID v11;
  const __CFNumber *v12;
  CFTypeID v13;
  uint64_t ScrollParametricAlgorithm;
  uint64_t ScrollTableAlgorithm;
  void *v17;
  CFNumberRef number;
  int valuePtr;

  v17 = (void *)0xAAAAAAAAAAAAAAAALL;
  number = (CFNumberRef)0xAAAAAAAAAAAAAAAALL;
  v8 = (const __CFNumber *)IOHIDPointerScrollFilter::copyCachedProperty(this, CFSTR("HIDScrollAccelerationAlgorithm"));
  if (!v8)
  {
    v17 = &unk_250001678;
    number = 0;
    goto LABEL_12;
  }
  v10 = v8;
  v11 = CFGetTypeID(v8);
  if (v11 == CFNumberGetTypeID())
    v12 = v10;
  else
    v12 = 0;
  v17 = &unk_250001678;
  number = v12;
  if (!v12)
    goto LABEL_12;
  v13 = CFGetTypeID(v12);
  if (v13 != CFNumberGetTypeID())
    goto LABEL_12;
  valuePtr = 0;
  CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
  switch(valuePtr)
  {
    case 0:
LABEL_13:
      ScrollTableAlgorithm = IOHIDPointerScrollFilter::createScrollTableAlgorithm((IOHIDPointerScrollFilter *)this, a2, a3, a4);
LABEL_14:
      ScrollParametricAlgorithm = ScrollTableAlgorithm;
      goto LABEL_15;
    case 1:
      ScrollTableAlgorithm = IOHIDPointerScrollFilter::createScrollParametricAlgorithm((IOHIDPointerScrollFilter *)this, v9, a3, a4);
      goto LABEL_14;
    case 2:
LABEL_12:
      ScrollParametricAlgorithm = IOHIDPointerScrollFilter::createScrollParametricAlgorithm((IOHIDPointerScrollFilter *)this, v9, a3, a4);
      if (ScrollParametricAlgorithm)
        goto LABEL_15;
      goto LABEL_13;
  }
  ScrollParametricAlgorithm = 0;
LABEL_15:
  sub_23111C114(&v17);
  return ScrollParametricAlgorithm;
}

void sub_231121108(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_23111C114((uint64_t *)va);
  _Unwind_Resume(a1);
}

_QWORD *IOHIDPointerScrollFilter::setupPointerAcceleration(IOHIDPointerScrollFilter *this, double a2)
{
  int v3;
  _QWORD *result;
  const void *v6;
  unint64_t v7;
  CFTypeID v8;
  unint64_t v9;
  unsigned __int8 v10;
  const __CFNumber *v11;
  const __CFNumber *v12;
  CFTypeID v13;
  const __CFNumber *v14;
  const __CFNumber *v15;
  const __CFNumber *v16;
  CFTypeID v17;
  const __CFNumber *v18;
  NSObject *v19;
  uint64_t RegistryID;
  const void *v21;
  const void *v22;
  _QWORD *v23;
  _BOOL4 v24;
  const __CFNumber *v25;
  const void *v26;
  _QWORD *v27;
  NSObject *v28;
  uint64_t v29;
  const void *v30;
  _QWORD *v31;
  NSObject *v32;
  uint64_t v33;
  const char *v34;
  NSObject *v35;
  const __CFNumber *v36;
  const __CFNumber *v37;
  CFTypeID v38;
  const __CFNumber *v39;
  NSObject *v40;
  NSObject *v41;
  uint64_t v42;
  const void *v43;
  double v44;
  const void *v45;
  NSObject *v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  unsigned int v50;
  const char *v51;
  const char *v52;
  uint64_t PointerAlgorithm;
  uint64_t v54;
  int v55;
  double v56;
  NSObject *v57;
  uint64_t v58;
  unint64_t v59;
  CFNumberRef v60;
  void *v61;
  CFNumberRef v62;
  void *v63;
  CFNumberRef number;
  void *v65;
  CFTypeRef v66;
  void *v67;
  CFTypeRef v68;
  void *v69;
  CFTypeRef cf;
  void *v71;
  CFTypeRef cf1;
  void *v73;
  CFNumberRef v74;
  void *v75;
  CFNumberRef v76;
  void *v77;
  unint64_t v78;
  int v79;
  _BYTE valuePtr[22];
  __int16 v81;
  CFTypeRef v82;
  __int16 v83;
  CFTypeRef v84;
  __int16 v85;
  const char *v86;
  __int16 v87;
  CFTypeRef v88;
  __int16 v89;
  const char *v90;
  __int16 v91;
  CFTypeRef v92;
  __int16 v93;
  CFNumberRef v94;
  uint64_t v95;

  v95 = *MEMORY[0x24BDAC8D0];
  v3 = *((_DWORD *)this + 40);
  result = (_QWORD *)*((_QWORD *)this + 6);
  if (!v3)
  {
    *((_QWORD *)this + 6) = 0;
    if (result)
      (*(void (**)(_QWORD *))(*result + 8))(result);
    v77 = (void *)0xAAAAAAAAAAAAAAAALL;
    v78 = 0xAAAAAAAAAAAAAAAALL;
    v6 = IOHIDPointerScrollFilter::copyCachedProperty((CFDictionaryRef *)this, CFSTR("HIDSupportsPointerAcceleration"));
    if (v6)
    {
      v7 = (unint64_t)v6;
      v8 = CFGetTypeID(v6);
      if (v8 == CFBooleanGetTypeID())
        v9 = v7;
      else
        v9 = 0;
      v77 = &unk_2500019F0;
      v78 = v9;
      if (v9)
      {
        v10 = sub_231121CB8((uint64_t)&v77);
        goto LABEL_14;
      }
    }
    else
    {
      v77 = &unk_2500019F0;
      v78 = 0;
    }
    v10 = 1;
LABEL_14:
    *((_BYTE *)this + 164) = v10;
    v75 = (void *)0xAAAAAAAAAAAAAAAALL;
    v76 = (CFNumberRef)0xAAAAAAAAAAAAAAAALL;
    v11 = (const __CFNumber *)IOHIDServiceCopyProperty();
    v12 = v11;
    if (v11)
    {
      v13 = CFGetTypeID(v11);
      if (v13 == CFNumberGetTypeID())
        v14 = v12;
      else
        v14 = 0;
      v75 = &unk_250001678;
      v76 = v14;
      if (v14)
      {
        *(_DWORD *)valuePtr = 0;
        CFNumberGetValue(v14, kCFNumberSInt32Type, valuePtr);
        if (*(_DWORD *)valuePtr)
          goto LABEL_23;
      }
    }
    else
    {
      v75 = &unk_250001678;
      v76 = 0;
    }
    sub_231122B18(valuePtr, 26214400);
    sub_2311209CC((uint64_t)&v75, (uint64_t)valuePtr);
    sub_23111C114(valuePtr);
    if (!v76)
    {
      v19 = _IOHIDLogCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        RegistryID = *((_QWORD *)this + 15);
        if (RegistryID)
          RegistryID = IOHIDServiceGetRegistryID();
        *(_DWORD *)valuePtr = 138412290;
        *(_QWORD *)&valuePtr[4] = RegistryID;
        _os_log_impl(&dword_23111A000, v19, OS_LOG_TYPE_INFO, "[%@] Could not get/create pointer resolution\n", valuePtr, 0xCu);
      }
      goto LABEL_105;
    }
LABEL_23:
    v73 = (void *)0xAAAAAAAAAAAAAAAALL;
    v74 = (CFNumberRef)0xAAAAAAAAAAAAAAAALL;
    v15 = (const __CFNumber *)IOHIDPointerScrollFilter::copyCachedProperty((CFDictionaryRef *)this, CFSTR("HIDPointerReportRate"));
    v16 = v15;
    if (v15)
    {
      v17 = CFGetTypeID(v15);
      if (v17 == CFNumberGetTypeID())
        v18 = v16;
      else
        v18 = 0;
      v73 = &unk_250001678;
      v74 = v18;
      if (v18)
        goto LABEL_35;
    }
    else
    {
      v73 = &unk_250001678;
      v74 = 0;
    }
    sub_231122B18(valuePtr, 0);
    sub_2311209CC((uint64_t)&v73, (uint64_t)valuePtr);
    sub_23111C114(valuePtr);
    if (!v74)
    {
      v28 = _IOHIDLogCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        v29 = *((_QWORD *)this + 15);
        if (v29)
          v29 = IOHIDServiceGetRegistryID();
        *(_DWORD *)valuePtr = 138412290;
        *(_QWORD *)&valuePtr[4] = v29;
        _os_log_impl(&dword_23111A000, v28, OS_LOG_TYPE_INFO, "[%@] Could not get/create pointer report rate\n", valuePtr, 0xCu);
      }
      goto LABEL_104;
    }
LABEL_35:
    v71 = &unk_250001AF0;
    cf1 = 0;
    v69 = &unk_250001AF0;
    cf = 0;
    v67 = &unk_250001AF0;
    v68 = 0;
    v65 = &unk_250001AF0;
    v66 = 0;
    v63 = &unk_250001678;
    number = 0;
    v21 = IOHIDPointerScrollFilter::copyCachedProperty((CFDictionaryRef *)this, CFSTR("HIDPointerAccelerationType"));
    *(_QWORD *)valuePtr = &unk_250001AF0;
    *(_QWORD *)&valuePtr[8] = v21;
    sub_2311209CC((uint64_t)&v71, (uint64_t)valuePtr);
    sub_231122BA8(valuePtr);
    if (cf1)
    {
      v22 = IOHIDPointerScrollFilter::copyCachedProperty((CFDictionaryRef *)this, (const __CFString *)cf1);
      *(_QWORD *)valuePtr = &unk_250001AF0;
      *(_QWORD *)&valuePtr[8] = v22;
      sub_2311209CC((uint64_t)&v69, (uint64_t)valuePtr);
      v23 = sub_231122BA8(valuePtr);
      sub_23111DE44(v23, cf, 0);
      sub_2311209CC((uint64_t)&v63, (uint64_t)valuePtr);
      sub_23111C114(valuePtr);
      v24 = CFEqual(cf1, CFSTR("HIDMouseAcceleration")) != 0;
    }
    else
    {
      v24 = 0;
    }
    v25 = number;
    if (!number)
    {
      v26 = IOHIDPointerScrollFilter::copyCachedProperty((CFDictionaryRef *)this, CFSTR("HIDMouseAcceleration"));
      *(_QWORD *)valuePtr = &unk_250001AF0;
      *(_QWORD *)&valuePtr[8] = v26;
      sub_2311209CC((uint64_t)&v67, (uint64_t)valuePtr);
      v27 = sub_231122BA8(valuePtr);
      sub_23111DE44(v27, v68, 0);
      sub_2311209CC((uint64_t)&v63, (uint64_t)valuePtr);
      sub_23111C114(valuePtr);
      v25 = number;
      if (number)
      {
        v24 = 1;
      }
      else
      {
        v30 = IOHIDPointerScrollFilter::copyCachedProperty((CFDictionaryRef *)this, CFSTR("HIDPointerAcceleration"));
        *(_QWORD *)valuePtr = &unk_250001AF0;
        *(_QWORD *)&valuePtr[8] = v30;
        sub_2311209CC((uint64_t)&v65, (uint64_t)valuePtr);
        v31 = sub_231122BA8(valuePtr);
        sub_23111DE44(v31, v66, 0);
        sub_2311209CC((uint64_t)&v63, (uint64_t)valuePtr);
        sub_23111C114(valuePtr);
        v24 = 0;
        v25 = number;
        if (!number)
          goto LABEL_47;
      }
    }
    *(_DWORD *)valuePtr = 0;
    CFNumberGetValue(v25, kCFNumberSInt32Type, valuePtr);
    *((double *)this + 16) = (double)*(int *)valuePtr * 0.0000152587891;
LABEL_47:
    v32 = _IOHIDLogCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = *((_QWORD *)this + 15);
      if (v33)
        v33 = IOHIDServiceGetRegistryID();
      v34 = "enabled";
      if (*((double *)this + 16) < 0.0)
        v34 = "disabled";
      *(_DWORD *)valuePtr = 138414338;
      *(_QWORD *)&valuePtr[4] = v33;
      *(_WORD *)&valuePtr[12] = 2080;
      *(_QWORD *)&valuePtr[14] = v34;
      v81 = 2112;
      v82 = cf1;
      v83 = 2112;
      v84 = cf;
      v85 = 2080;
      v86 = "HIDMouseAcceleration";
      v87 = 2112;
      v88 = v68;
      v89 = 2080;
      v90 = "HIDPointerAcceleration";
      v91 = 2112;
      v92 = v66;
      v93 = 2112;
      v94 = number;
      _os_log_impl(&dword_23111A000, v32, OS_LOG_TYPE_DEFAULT, "[%@] Pointer acceleration (%s) %@:%@ %s:%@ %s:%@ %@\n", valuePtr, 0x5Cu);
    }
    if (*((double *)this + 16) < 0.0)
      goto LABEL_103;
    v35 = _IOHIDLogCategory();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      if (*((_QWORD *)this + 15))
        IOHIDServiceGetRegistryID();
      sub_231122F38();
    }
    v61 = (void *)0xAAAAAAAAAAAAAAAALL;
    v62 = (CFNumberRef)0xAAAAAAAAAAAAAAAALL;
    v36 = (const __CFNumber *)IOHIDPointerScrollFilter::copyCachedProperty((CFDictionaryRef *)this, CFSTR("HIDUseLinearScalingMouseAcceleration"));
    v37 = v36;
    if (v36)
    {
      v38 = CFGetTypeID(v36);
      if (v38 == CFNumberGetTypeID())
        v39 = v37;
      else
        v39 = 0;
    }
    else
    {
      v39 = 0;
    }
    v61 = &unk_250001678;
    v62 = v39;
    v40 = _IOHIDLogCategory();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      if (*((_QWORD *)this + 15))
        v49 = IOHIDServiceGetRegistryID();
      else
        v49 = 0;
      v50 = sub_231120D00((uint64_t)&v61);
      v51 = "no";
      if (v24)
        v52 = "yes";
      else
        v52 = "no";
      *(_DWORD *)valuePtr = 138412802;
      *(_QWORD *)&valuePtr[4] = v49;
      *(_WORD *)&valuePtr[12] = 2080;
      *(_QWORD *)&valuePtr[14] = v52;
      if (v50)
        v51 = "yes";
      v81 = 2080;
      v82 = v51;
      _os_log_debug_impl(&dword_23111A000, v40, OS_LOG_TYPE_DEBUG, "[%@] Is mouse acceleration? %s Use linear? %s\n", valuePtr, 0x20u);
      if (!v24)
        goto LABEL_94;
    }
    else if (!v24)
    {
      goto LABEL_94;
    }
    if (v62)
    {
      *(_DWORD *)valuePtr = 0;
      CFNumberGetValue(v62, kCFNumberSInt32Type, valuePtr);
      if (*(_DWORD *)valuePtr)
      {
        v41 = _IOHIDLogCategory();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          v42 = *((_QWORD *)this + 15);
          if (v42)
            v42 = IOHIDServiceGetRegistryID();
          *(_DWORD *)valuePtr = 138412290;
          *(_QWORD *)&valuePtr[4] = v42;
          _os_log_impl(&dword_23111A000, v41, OS_LOG_TYPE_DEFAULT, "[%@] Using linear scaling\n", valuePtr, 0xCu);
        }
        if (*((double *)this + 16) == 0.0)
        {
          v59 = 0xAAAAAAAAAAAAAAAALL;
          v60 = (CFNumberRef)0xAAAAAAAAAAAAAAAALL;
          v43 = IOHIDPointerScrollFilter::copyCachedProperty((CFDictionaryRef *)this, CFSTR("HIDPointerAccelerationMinimum"));
          sub_23111DE44(&v59, v43, 1);
          if (sub_231120D00((uint64_t)&v59)
            && (*(_DWORD *)valuePtr = 0, CFNumberGetValue(v60, kCFNumberSInt32Type, valuePtr), *(_DWORD *)valuePtr))
          {
            *(_DWORD *)valuePtr = 0;
            CFNumberGetValue(v60, kCFNumberSInt32Type, valuePtr);
            v44 = (double)*(int *)valuePtr * 0.0000152587891;
            *((double *)this + 17) = v44;
          }
          else
          {
            memset(valuePtr, 170, 16);
            v45 = (const void *)IOHIDPreferencesCopyDomain();
            sub_23111DE44(valuePtr, v45, 1);
            if (*(_QWORD *)&valuePtr[8])
            {
              v79 = 0;
              CFNumberGetValue(*(CFNumberRef *)&valuePtr[8], kCFNumberSInt32Type, &v79);
              if (v79)
              {
                v79 = 0;
                CFNumberGetValue(*(CFNumberRef *)&valuePtr[8], kCFNumberSInt32Type, &v79);
                *((double *)this + 17) = (double)v79 * 0.0000152587891;
              }
            }
            sub_23111C114(valuePtr);
            v44 = *((double *)this + 17);
          }
          *((double *)this + 16) = v44;
          v46 = _IOHIDLogCategory();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          {
            if (*((_QWORD *)this + 15))
              IOHIDServiceGetRegistryID();
            sub_231122F04();
          }
          sub_23111C114(&v59);
        }
        v47 = (_QWORD *)operator new();
        v48 = *((_QWORD *)this + 16);
        *v47 = &unk_2500014F0;
        v47[1] = v48;
        *((_QWORD *)this + 6) = v47;
LABEL_102:
        sub_23111C114(&v61);
LABEL_103:
        sub_23111C114(&v63);
        sub_231122BA8(&v65);
        sub_231122BA8(&v67);
        sub_231122BA8(&v69);
        sub_231122BA8(&v71);
LABEL_104:
        sub_23111C114(&v73);
LABEL_105:
        sub_23111C114(&v75);
        return sub_23112285C(&v77);
      }
    }
LABEL_94:
    *(_DWORD *)valuePtr = 0;
    CFNumberGetValue(v76, kCFNumberSInt32Type, valuePtr);
    PointerAlgorithm = IOHIDPointerScrollFilter::createPointerAlgorithm((CFDictionaryRef *)this, *(int *)valuePtr);
    if (PointerAlgorithm)
    {
      v54 = operator new();
      *(_DWORD *)valuePtr = 0;
      CFNumberGetValue(v76, kCFNumberSInt32Type, valuePtr);
      v55 = *(_DWORD *)valuePtr;
      *(_DWORD *)valuePtr = 0;
      CFNumberGetValue(v74, kCFNumberSInt32Type, valuePtr);
      v56 = (double)*(int *)valuePtr;
      *(_QWORD *)v54 = &off_250001590;
      *(_QWORD *)(v54 + 8) = PointerAlgorithm;
      *(double *)(v54 + 24) = (double)v55 * 0.0000152587891;
      *(double *)(v54 + 32) = v56;
      *(double *)(v54 + 40) = a2;
      if (!dword_255EB52AC)
        mach_timebase_info((mach_timebase_info_t)&IOHIDPointerAccelerator::_timebase);
      *((_QWORD *)this + 6) = v54;
    }
    else
    {
      v57 = _IOHIDLogCategory();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
      {
        v58 = *((_QWORD *)this + 15);
        if (v58)
          v58 = IOHIDServiceGetRegistryID();
        *(_DWORD *)valuePtr = 138412290;
        *(_QWORD *)&valuePtr[4] = v58;
        _os_log_impl(&dword_23111A000, v57, OS_LOG_TYPE_INFO, "[%@] Could not create accelerator\n", valuePtr, 0xCu);
      }
    }
    goto LABEL_102;
  }
  if (!result)
  {
    result = (_QWORD *)operator new();
    *result = &unk_2500014F0;
    result[1] = 0x3FF0000000000000;
    *((_QWORD *)this + 6) = result;
  }
  return result;
}

void sub_231121B38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  sub_23111C114(&a10);
  sub_23111C114(&a12);
  sub_23111C114(&a14);
  sub_231122BA8(&a16);
  sub_231122BA8(&a18);
  sub_231122BA8(&a20);
  sub_231122BA8(&a22);
  sub_23111C114(&a24);
  sub_23111C114(&a26);
  sub_23112285C(&a28);
  _Unwind_Resume(a1);
}

const void *sub_231121CB8(uint64_t a1)
{
  const void *result;
  CFTypeID v3;

  result = *(const void **)(a1 + 8);
  if (result)
  {
    v3 = CFGetTypeID(result);
    if (v3 == CFBooleanGetTypeID())
      return (const void *)(CFBooleanGetValue(*(CFBooleanRef *)(a1 + 8)) != 0);
    else
      return 0;
  }
  return result;
}

_QWORD *IOHIDPointerScrollFilter::setupScrollAcceleration(_QWORD *this, double a2)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  const void *v6;
  unint64_t v7;
  CFTypeID v8;
  unint64_t v9;
  unsigned __int8 v10;
  char *v11;
  const void *v12;
  const void *v13;
  const __CFNumber *v14;
  const void *v15;
  const void *v16;
  NSObject *v17;
  uint64_t RegistryID;
  const char *v19;
  NSObject *v20;
  const __CFNumber *v21;
  const __CFNumber *v22;
  CFTypeID v23;
  const __CFNumber *v24;
  unint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  const __CFNumber *v28;
  const __CFNumber *v29;
  CFTypeID v30;
  const __CFNumber *v31;
  const void *v32;
  const void *v33;
  CFTypeID v34;
  const void *v35;
  int v36;
  uint64_t ScrollAlgorithm;
  uint64_t v38;
  char *v39;
  int v40;
  double v41;
  NSObject *v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  CFNumberRef v47;
  void *v48;
  CFTypeRef v49;
  void *v50;
  CFTypeRef v51;
  void *v52;
  CFTypeRef cf;
  void *v54;
  __CFString *v55;
  void *v56;
  CFNumberRef number;
  void *v58;
  unint64_t v59;
  __int128 v60;
  uint8_t buf[16];
  _BYTE valuePtr[22];
  __int16 v63;
  __CFString *v64;
  __int16 v65;
  CFTypeRef v66;
  __int16 v67;
  const char *v68;
  __int16 v69;
  CFTypeRef v70;
  __int16 v71;
  const char *v72;
  __int16 v73;
  CFTypeRef v74;
  __int16 v75;
  CFNumberRef v76;
  uint64_t v77;

  v2 = this;
  v77 = *MEMORY[0x24BDAC8D0];
  if (!*((_DWORD *)this + 40))
  {
    v58 = (void *)0xAAAAAAAAAAAAAAAALL;
    v59 = 0xAAAAAAAAAAAAAAAALL;
    v6 = IOHIDPointerScrollFilter::copyCachedProperty((CFDictionaryRef *)this, CFSTR("HIDSupportsScrollAcceleration"));
    if (v6)
    {
      v7 = (unint64_t)v6;
      v8 = CFGetTypeID(v6);
      if (v8 == CFBooleanGetTypeID())
        v9 = v7;
      else
        v9 = 0;
      v58 = &unk_2500019F0;
      v59 = v9;
      if (v9)
      {
        v10 = sub_231121CB8((uint64_t)&v58);
        goto LABEL_15;
      }
    }
    else
    {
      v58 = &unk_2500019F0;
      v59 = 0;
    }
    v10 = 1;
LABEL_15:
    *((_BYTE *)v2 + 165) = v10;
    v11 = (char *)&unk_250001668;
    v56 = &unk_250001678;
    number = 0;
    v54 = &unk_250001AF0;
    v55 = 0;
    v52 = &unk_250001AF0;
    cf = 0;
    v50 = &unk_250001AF0;
    v51 = 0;
    v48 = &unk_250001AF0;
    v49 = 0;
    v12 = IOHIDPointerScrollFilter::copyCachedProperty((CFDictionaryRef *)v2, CFSTR("HIDScrollAccelerationType"));
    *(_QWORD *)valuePtr = &unk_250001AF0;
    *(_QWORD *)&valuePtr[8] = v12;
    sub_2311209CC((uint64_t)&v54, (uint64_t)valuePtr);
    sub_231122BA8(valuePtr);
    if (v55)
    {
      v13 = IOHIDPointerScrollFilter::copyCachedProperty((CFDictionaryRef *)v2, v55);
      *(_QWORD *)valuePtr = &unk_250001AF0;
      *(_QWORD *)&valuePtr[8] = v13;
      sub_2311209CC((uint64_t)&v52, (uint64_t)valuePtr);
      sub_231122BA8(valuePtr);
      sub_23111DE44(valuePtr, cf, 0);
      sub_2311209CC((uint64_t)&v56, (uint64_t)valuePtr);
      sub_23111C114(valuePtr);
    }
    v14 = number;
    if (number)
      goto LABEL_20;
    v15 = IOHIDPointerScrollFilter::copyCachedProperty((CFDictionaryRef *)v2, CFSTR("HIDMouseScrollAcceleration"));
    *(_QWORD *)valuePtr = &unk_250001AF0;
    *(_QWORD *)&valuePtr[8] = v15;
    sub_2311209CC((uint64_t)&v50, (uint64_t)valuePtr);
    sub_231122BA8(valuePtr);
    sub_23111DE44(valuePtr, v51, 0);
    sub_2311209CC((uint64_t)&v56, (uint64_t)valuePtr);
    sub_23111C114(valuePtr);
    v14 = number;
    if (number)
      goto LABEL_20;
    v16 = IOHIDPointerScrollFilter::copyCachedProperty((CFDictionaryRef *)v2, CFSTR("HIDScrollAcceleration"));
    *(_QWORD *)valuePtr = &unk_250001AF0;
    *(_QWORD *)&valuePtr[8] = v16;
    sub_2311209CC((uint64_t)&v48, (uint64_t)valuePtr);
    sub_231122BA8(valuePtr);
    sub_23111DE44(valuePtr, v49, 0);
    sub_2311209CC((uint64_t)&v56, (uint64_t)valuePtr);
    sub_23111C114(valuePtr);
    v14 = number;
    if (number)
    {
LABEL_20:
      *(_DWORD *)valuePtr = 0;
      CFNumberGetValue(v14, kCFNumberSInt32Type, valuePtr);
      *((double *)v2 + 18) = (double)*(int *)valuePtr * 0.0000152587891;
    }
    v17 = _IOHIDLogCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      RegistryID = v2[15];
      if (RegistryID)
        RegistryID = IOHIDServiceGetRegistryID();
      v19 = "enabled";
      if (*((double *)v2 + 18) < 0.0)
        v19 = "disabled";
      *(_DWORD *)valuePtr = 138414338;
      *(_QWORD *)&valuePtr[4] = RegistryID;
      *(_WORD *)&valuePtr[12] = 2080;
      *(_QWORD *)&valuePtr[14] = v19;
      v63 = 2112;
      v64 = v55;
      v65 = 2112;
      v66 = cf;
      v67 = 2080;
      v68 = "HIDMouseScrollAcceleration";
      v69 = 2112;
      v70 = v51;
      v71 = 2080;
      v72 = "HIDScrollAcceleration";
      v73 = 2112;
      v74 = v49;
      v75 = 2112;
      v76 = number;
      _os_log_impl(&dword_23111A000, v17, OS_LOG_TYPE_DEFAULT, "[%@] Scroll acceleration (%s) %@:%@ %s:%@ %s:%@ %@\n", valuePtr, 0x5Cu);
    }
    if (*((double *)v2 + 18) >= 0.0)
    {
      v20 = _IOHIDLogCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        if (v2[15])
          IOHIDServiceGetRegistryID();
        sub_231122F6C();
      }
      v46 = (void *)0xAAAAAAAAAAAAAAAALL;
      v47 = (CFNumberRef)0xAAAAAAAAAAAAAAAALL;
      v21 = (const __CFNumber *)IOHIDPointerScrollFilter::copyCachedProperty((CFDictionaryRef *)v2, CFSTR("HIDScrollReportRate"));
      v22 = v21;
      if (v21)
      {
        v23 = CFGetTypeID(v21);
        if (v23 == CFNumberGetTypeID())
          v24 = v22;
        else
          v24 = 0;
        v46 = &unk_250001678;
        v47 = v24;
        if (v24)
        {
          *(_DWORD *)buf = 0;
          CFNumberGetValue(v24, kCFNumberSInt32Type, buf);
          if (*(_DWORD *)buf)
            goto LABEL_41;
        }
      }
      else
      {
        v46 = &unk_250001678;
        v47 = 0;
      }
      sub_231122B18(buf, 4390912);
      sub_2311209CC((uint64_t)&v46, (uint64_t)buf);
      sub_23111C114(buf);
      if (v47)
      {
LABEL_41:
        v25 = 0;
        while (1)
        {
          v26 = &v2[v25];
          v27 = v26[7];
          v26[7] = 0;
          if (v27)
            (*(void (**)(uint64_t))(*(_QWORD *)v27 + 8))(v27);
          memset(buf, 170, sizeof(buf));
          v28 = (const __CFNumber *)IOHIDServiceCopyProperty();
          v29 = v28;
          if (v28)
          {
            v30 = CFGetTypeID(v28);
            if (v30 == CFNumberGetTypeID())
              v31 = v29;
            else
              v31 = 0;
            *(_QWORD *)buf = v11 + 16;
            *(_QWORD *)&buf[8] = v31;
            if (v31)
              goto LABEL_57;
          }
          else
          {
            *(_QWORD *)buf = &unk_250001678;
            *(_QWORD *)&buf[8] = 0;
          }
          v32 = (const void *)IOHIDServiceCopyProperty();
          v33 = v32;
          if (v32)
          {
            v34 = CFGetTypeID(v32);
            if (v34 == CFNumberGetTypeID())
              v35 = v33;
            else
              v35 = 0;
          }
          else
          {
            v35 = 0;
          }
          *(_QWORD *)&v60 = v11 + 16;
          *((_QWORD *)&v60 + 1) = v35;
          sub_2311209CC((uint64_t)buf, (uint64_t)&v60);
          sub_23111C114(&v60);
          v29 = *(const __CFNumber **)&buf[8];
          if (!*(_QWORD *)&buf[8])
          {
            v44 = _IOHIDLogCategory();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
            {
              v45 = v2[15];
              if (v45)
                v45 = IOHIDServiceGetRegistryID();
              LODWORD(v60) = 138412290;
              *(_QWORD *)((char *)&v60 + 4) = v45;
              _os_log_impl(&dword_23111A000, v44, OS_LOG_TYPE_INFO, "[%@] Could not get kIOHIDScrollResolutionKey\n", (uint8_t *)&v60, 0xCu);
            }
            sub_23111C114(buf);
            goto LABEL_72;
          }
LABEL_57:
          LODWORD(v60) = 0;
          CFNumberGetValue(v29, kCFNumberSInt32Type, &v60);
          v36 = v60;
          LODWORD(v60) = 0;
          CFNumberGetValue(v47, kCFNumberSInt32Type, &v60);
          ScrollAlgorithm = IOHIDPointerScrollFilter::createScrollAlgorithm((CFDictionaryRef *)v2, v25, v36, v60);
          if (ScrollAlgorithm)
          {
            v38 = operator new();
            v39 = v11;
            LODWORD(v60) = 0;
            CFNumberGetValue(*(CFNumberRef *)&buf[8], kCFNumberSInt32Type, &v60);
            v40 = v60;
            LODWORD(v60) = 0;
            CFNumberGetValue(v47, kCFNumberSInt32Type, &v60);
            v41 = (double)(int)v60 * 0.0000152587891;
            *(_QWORD *)v38 = &off_250001548;
            *(_QWORD *)(v38 + 8) = ScrollAlgorithm;
            *(_QWORD *)(v38 + 16) = 0;
            *(double *)(v38 + 40) = (double)v40 * 0.0000152587891;
            *(double *)(v38 + 48) = v41;
            *(double *)(v38 + 56) = a2;
            if (!dword_255EB52A4)
              mach_timebase_info((mach_timebase_info_t)&IOHIDScrollAccelerator::_timebase);
            v26[7] = v38;
            v11 = v39;
          }
          sub_23111C114(buf);
          if (++v25 == 3)
            goto LABEL_72;
        }
      }
      v42 = _IOHIDLogCategory();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        v43 = v2[15];
        if (v43)
          v43 = IOHIDServiceGetRegistryID();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v43;
        _os_log_impl(&dword_23111A000, v42, OS_LOG_TYPE_INFO, "[%@] Could not get/create report rate\n", buf, 0xCu);
      }
LABEL_72:
      sub_23111C114(&v46);
    }
    sub_231122BA8(&v48);
    sub_231122BA8(&v50);
    sub_231122BA8(&v52);
    sub_231122BA8(&v54);
    sub_23111C114(&v56);
    return sub_23112285C(&v58);
  }
  v3 = 0;
  v4 = this + 7;
  do
  {
    if (!v4[v3])
    {
      this = (_QWORD *)operator new();
      *this = &unk_2500014F0;
      this[1] = 0x3FB999999999999ALL;
      v4[v3] = this;
    }
    ++v3;
  }
  while (v3 != 3);
  return this;
}

void sub_231122464(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  sub_23111C114(&a27);
  sub_23111C114(&a11);
  sub_231122BA8(&a13);
  sub_231122BA8(&a15);
  sub_231122BA8(&a17);
  sub_231122BA8(&a19);
  sub_23111C114(&a21);
  sub_23112285C(&a23);
  _Unwind_Resume(a1);
}

void IOHIDPointerScrollFilter::startAccelStatsTimer(IOHIDPointerScrollFilter *this)
{
  NSObject *v1;
  dispatch_time_t v2;

  v1 = *((_QWORD *)this + 21);
  if (v1)
  {
    v2 = dispatch_time(0, 1000000 * *((_QWORD *)this + 22));
    dispatch_source_set_timer(v1, v2, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
}

const __CFString *IOHIDPointerScrollFilter::getAccelerationAlgorithmString(IOHIDPointerScrollFilter *this, unsigned int a2)
{
  if (a2 > 2)
    return CFSTR("Unknown");
  else
    return *(&off_250001B10 + (char)a2);
}

void IOHIDPointerScrollFilter::statsTimerCallback(dispatch_source_t *this, void *a2)
{
  double v3;
  double v4;
  const __CFNumber *v5;
  const __CFNumber *v6;
  CFTypeID v7;
  const __CFNumber *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFNumber *v17;
  const __CFNumber *v18;
  CFTypeID v19;
  const __CFNumber *v20;
  uint64_t v21;
  uint64_t v22;
  xpc_object_t v23;
  void *v24;
  CFNumberRef v25;
  void *v26;
  CFNumberRef number;
  unsigned __int16 valuePtr;

  if (this[15])
  {
    dispatch_source_set_timer(this[21], 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    v3 = *((double *)this + 16);
    v4 = *((double *)this + 18);
    v5 = (const __CFNumber *)IOHIDServiceCopyProperty();
    if (v5)
    {
      v6 = v5;
      v7 = CFGetTypeID(v5);
      if (v7 == CFNumberGetTypeID())
        v8 = v6;
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
    }
    v26 = &unk_250001678;
    number = v8;
    v17 = (const __CFNumber *)IOHIDServiceCopyProperty();
    v18 = v17;
    if (v17)
    {
      v19 = CFGetTypeID(v17);
      if (v19 == CFNumberGetTypeID())
        v20 = v18;
      else
        v20 = 0;
    }
    else
    {
      v20 = 0;
    }
    v24 = &unk_250001678;
    v25 = v20;
    if (number)
    {
      valuePtr = 0;
      CFNumberGetValue(number, kCFNumberSInt16Type, &valuePtr);
      v21 = valuePtr;
      v20 = v25;
      if (v25)
      {
LABEL_16:
        valuePtr = 0;
        CFNumberGetValue(v20, kCFNumberSInt16Type, &valuePtr);
        v22 = valuePtr;
LABEL_19:
        if (analytics_is_event_used())
        {
          v23 = xpc_dictionary_create(0, 0, 0);
          xpc_dictionary_set_uint64(v23, "PointerAccelerationValue", vcvtd_n_u64_f64(v3, 0x10uLL));
          xpc_dictionary_set_uint64(v23, "ScrollAccelerationValue", vcvtd_n_u64_f64(v4, 0x10uLL));
          xpc_dictionary_set_uint64(v23, "VendorID", v22);
          xpc_dictionary_set_uint64(v23, "ProductID", v21);
          analytics_send_event();
          xpc_release(v23);
        }
        sub_23111C114(&v24);
        sub_23111C114(&v26);
        return;
      }
    }
    else
    {
      v21 = 0;
      if (v20)
        goto LABEL_16;
    }
    v22 = 0;
    goto LABEL_19;
  }
  v9 = _IOHIDLogCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    sub_231122FA0(v9, v10, v11, v12, v13, v14, v15, v16);
}

void sub_2311227E0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v3;
  va_list va;
  uint64_t v5;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, _QWORD);
  v5 = va_arg(va1, _QWORD);
  sub_23111C114((uint64_t *)va);
  sub_23111C114((uint64_t *)va1);
  _Unwind_Resume(a1);
}

void sub_231122810(_QWORD *a1)
{
  sub_23112285C(a1);
  JUMPOUT(0x2348D2B0CLL);
}

void sub_231122838(_QWORD *a1)
{
  sub_23112285C(a1);
  JUMPOUT(0x2348D2B0CLL);
}

_QWORD *sub_23112285C(_QWORD *a1)
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &unk_250001A38;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

_QWORD *sub_23112289C(_QWORD *a1, CFTypeRef cf, char a3)
{
  CFTypeID v6;
  CFTypeRef v7;

  if (cf)
  {
    v6 = CFGetTypeID(cf);
    if (v6 == CFStringGetTypeID())
      v7 = cf;
    else
      v7 = 0;
    *a1 = &unk_250001AA0;
    a1[1] = v7;
    if (v7 && (a3 & 1) == 0)
      CFRetain(v7);
  }
  else
  {
    a1[1] = 0;
  }
  *a1 = &unk_250001A58;
  return a1;
}

void sub_23112291C(_QWORD *a1)
{
  sub_231122964(a1);
  JUMPOUT(0x2348D2B0CLL);
}

void sub_231122940(_QWORD *a1)
{
  sub_231122964(a1);
  JUMPOUT(0x2348D2B0CLL);
}

_QWORD *sub_231122964(_QWORD *a1)
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &unk_250001AA0;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

_QWORD *sub_2311229A4(_QWORD *a1, const char *a2)
{
  *a1 = &unk_250001A58;
  if (a2[23] < 0)
    a2 = *(const char **)a2;
  a1[1] = CFStringCreateWithCString(0, a2, 0);
  return a1;
}

void sub_2311229F0(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_231122964(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_231122A04(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    sub_23111EFAC();
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

void sub_231122AB4(_QWORD *a1)
{
  sub_231122AD8(a1);
  JUMPOUT(0x2348D2B0CLL);
}

_QWORD *sub_231122AD8(_QWORD *a1)
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &unk_250001AC0;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

_QWORD *sub_231122B18(_QWORD *a1, int a2)
{
  int valuePtr;

  valuePtr = a2;
  *a1 = &unk_250001678;
  a1[1] = 0;
  a1[1] = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &valuePtr);
  return a1;
}

void sub_231122B70(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_23111C114(v1);
  _Unwind_Resume(a1);
}

void sub_231122B84(_QWORD *a1)
{
  sub_231122BA8(a1);
  JUMPOUT(0x2348D2B0CLL);
}

_QWORD *sub_231122BA8(_QWORD *a1)
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &unk_250001AF0;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

uint64_t sub_231122BE8(uint64_t result, float a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(float *)a4 = a2;
  *(_QWORD *)(a4 + 4) = result;
  *(_WORD *)(a4 + 12) = 2048;
  *(_QWORD *)(a4 + 14) = v4;
  return result;
}

void sub_231122C00(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_debug_impl(a1, a4, OS_LOG_TYPE_DEBUG, a2, a3, 0x16u);
}

void sub_231122C20(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_231122C30(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 134217984;
  v4 = a1;
  sub_23111E72C(&dword_23111A000, a2, a3, "table index %zu\n", (uint8_t *)&v3);
}

void sub_231122C9C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_23111A000, log, OS_LOG_TYPE_DEBUG, "table in NULL\n", v1, 2u);
}

void sub_231122CDC(char *a1, uint64_t a2, NSObject *a3)
{
  char *v4;

  if (a1[23] >= 0)
    v4 = a1;
  else
    v4 = *(char **)a1;
  *(_DWORD *)a2 = 136315138;
  *(_QWORD *)(a2 + 4) = v4;
  sub_23111E72C(&dword_23111A000, a3, (uint64_t)a3, "Acceleration table %s\n", (uint8_t *)a2);
  if (a1[23] < 0)
    operator delete(*(void **)a1);
}

void sub_231122D44(ACCEL_TABLE *a1, NSObject *a2)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = ACCEL_TABLE::signature(a1);
  _os_log_debug_impl(&dword_23111A000, a2, OS_LOG_TYPE_DEBUG, "unsupported table signature  %d\n", (uint8_t *)v3, 8u);
}

void sub_231122DCC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_231122C20(&dword_23111A000, a1, a3, "Unable to create stats timer, no acceleration stats will be collected\n", a5, a6, a7, a8, 0);
}

void sub_231122E00(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_23111A000, a2, OS_LOG_TYPE_DEBUG, "(%p) setupAcceleration service not available\n", (uint8_t *)&v2, 0xCu);
}

void sub_231122E74(CFStringRef *a1, NSObject *a2)
{
  const char *CStringPtr;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  CStringPtr = CFStringGetCStringPtr(*a1, 0);
  v4 = 136315138;
  v5 = CStringPtr;
  _os_log_error_impl(&dword_23111A000, a2, OS_LOG_TYPE_ERROR, "Unable to deserialize HID Property Event %s", (uint8_t *)&v4, 0xCu);
}

void sub_231122F04()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint8_t *v3;
  NSObject *v4;

  sub_231122C10();
  sub_231122BE8(v0, 5.778e-34, v1, v2);
  sub_231122C00(&dword_23111A000, "[%@] Override pointer acceleration value with minimum %f\n", v3, v4);
}

void sub_231122F38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint8_t *v3;
  NSObject *v4;

  sub_231122C10();
  sub_231122BE8(v0, 5.778e-34, v1, v2);
  sub_231122C00(&dword_23111A000, "[%@] Pointer acceleration value %f\n", v3, v4);
}

void sub_231122F6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint8_t *v3;
  NSObject *v4;

  sub_231122C10();
  sub_231122BE8(v0, 5.778e-34, v1, v2);
  sub_231122C00(&dword_23111A000, "[%@] Scroll acceleration value %f\n", v3, v4);
}

void sub_231122FA0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_231122C20(&dword_23111A000, a1, a3, "_service is null, no acceleration stats will be collected\n", a5, a6, a7, a8, 0);
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x24BDBB790](allocator, size, hint);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
  MEMORY[0x24BDBB878](theArray);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x24BDBBDB8](theDict, applier, context);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
  MEMORY[0x24BDBBE40](theDict);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

void CFPlugInAddInstanceForFactory(CFUUIDRef factoryID)
{
  MEMORY[0x24BDBC140](factoryID);
}

void CFPlugInRemoveInstanceForFactory(CFUUIDRef factoryID)
{
  MEMORY[0x24BDBC148](factoryID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8E0](alloc, *(_QWORD *)&bytes.byte0, *(_QWORD *)&bytes.byte8);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8F8](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

CFTypeRef IOCFUnserializeBinary(const char *buffer, size_t bufferSize, CFAllocatorRef allocator, CFOptionFlags options, CFStringRef *errorString)
{
  return (CFTypeRef)MEMORY[0x24BDD7EC8](buffer, bufferSize, allocator, options, errorString);
}

uint64_t IOHIDEventAppendEvent()
{
  return MEMORY[0x24BDD8148]();
}

uint64_t IOHIDEventConformsTo()
{
  return MEMORY[0x24BDD8150]();
}

uint64_t IOHIDEventCreateCopy()
{
  return MEMORY[0x24BDD8188]();
}

uint64_t IOHIDEventGetChildren()
{
  return MEMORY[0x24BDD8260]();
}

uint64_t IOHIDEventGetDataValue()
{
  return MEMORY[0x24BDD8268]();
}

uint64_t IOHIDEventGetEventFlags()
{
  return MEMORY[0x24BDD8280]();
}

uint64_t IOHIDEventGetFloatValue()
{
  return MEMORY[0x24BDD8290]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x24BDD8298]();
}

uint64_t IOHIDEventGetScrollMomentum()
{
  return MEMORY[0x24BDD82B0]();
}

uint64_t IOHIDEventGetTimeStamp()
{
  return MEMORY[0x24BDD82C0]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x24BDD82D0]();
}

uint64_t IOHIDEventIsAbsolute()
{
  return MEMORY[0x24BDD82F0]();
}

uint64_t IOHIDEventSetEventFlags()
{
  return MEMORY[0x24BDD8310]();
}

uint64_t IOHIDEventSetFloatValue()
{
  return MEMORY[0x24BDD8318]();
}

uint64_t IOHIDPreferencesCopyDomain()
{
  return MEMORY[0x24BDD8508]();
}

uint64_t IOHIDServiceConformsTo()
{
  return MEMORY[0x24BDD8560]();
}

uint64_t IOHIDServiceCopyProperty()
{
  return MEMORY[0x24BDD8568]();
}

uint64_t IOHIDServiceGetRegistryID()
{
  return MEMORY[0x24BDD8578]();
}

uint64_t IOHIDServiceSetProperty()
{
  return MEMORY[0x24BDD8588]();
}

uint64_t _IOHIDEventCopyAttachment()
{
  return MEMORY[0x24BDD8A80]();
}

uint64_t _IOHIDLogCategory()
{
  return MEMORY[0x24BDD8AB0]();
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

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
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
  return MEMORY[0x24BEDAF18]();
}

{
  return MEMORY[0x24BEDAF30]();
}

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
  off_250001390(__p);
}

uint64_t operator delete()
{
  return off_250001398();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_2500013A0(__sz);
}

uint64_t operator new()
{
  return off_2500013A8();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t analytics_is_event_used()
{
  return MEMORY[0x24BE1A1D8]();
}

uint64_t analytics_send_event()
{
  return MEMORY[0x24BE1A1E8]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
  MEMORY[0x24BDADF40](object, context);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
  MEMORY[0x24BDADFB8](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

