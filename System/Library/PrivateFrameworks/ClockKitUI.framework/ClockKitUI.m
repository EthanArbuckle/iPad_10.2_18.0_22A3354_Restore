void sub_1CB9A6434(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1CB9A70A4(_Unwind_Exception *a1)
{
  id *v1;

  _Unwind_Resume(a1);
}

__n64 _convertToRGBfFromSRGB8_fast(__int16 a1)
{
  __n64 result;

  result.n64_u32[0] = _CLKUIDecodeSRGBTable[a1];
  result.n64_u32[1] = _CLKUIDecodeSRGBTable[HIBYTE(a1)];
  return result;
}

double _convertToRGBfFromSRGBf_fast(double a1)
{
  double v1;

  LODWORD(v1) = _CLKUIDecodeSRGBTable[(float)(255.0 * *(float *)&a1)];
  HIDWORD(v1) = _CLKUIDecodeSRGBTable[vmuls_lane_f32(255.0, *(float32x2_t *)&a1, 1)];
  return v1;
}

double CLKUIConvertToRGBfFromXRSRGBf(int8x16_t a1)
{
  int8x16_t v2;
  float32x4_t v8;
  double result;
  unsigned __int128 v10;
  float32x4_t v11;

  v2.i64[0] = 0x8000000080000000;
  v2.i64[1] = 0x8000000080000000;
  __asm { FMOV            V1.4S, #1.0 }
  v10 = *(_OWORD *)&a1 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL);
  v11 = (float32x4_t)vbicq_s8(vorrq_s8(vandq_s8(a1, v2), _Q1), (int8x16_t)vceqzq_f32((float32x4_t)a1));
  v8 = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32((float32x4_t)vdupq_n_s32(0x3D25AEE6u), (float32x4_t)v10), (int8x16_t)vmulq_f32((float32x4_t)v10, (float32x4_t)vdupq_n_s32(0x3D9E8391u)), (int8x16_t)_simd_pow_f4((simd_float4)vmlaq_f32((float32x4_t)vdupq_n_s32(0x3D55891Au), (float32x4_t)v10, (float32x4_t)vdupq_n_s32(0x3F72A76Fu)), (simd_float4)vdupq_n_s64(0x4019999A4019999AuLL)));
  v8.i32[3] = HIDWORD(v10);
  *(_QWORD *)&result = vmulq_f32(v8, v11).u64[0];
  return result;
}

double CLKUIConvertToXRSRGBfFromRGBf(int8x16_t a1)
{
  int8x16_t v1;
  int8x16_t v2;
  float32x4_t v8;
  double result;
  unsigned __int128 v10;
  float32x4_t v11;

  v1.i64[0] = 0x8000000080000000;
  v1.i64[1] = 0x8000000080000000;
  v2 = vandq_s8(a1, v1);
  __asm { FMOV            V1.4S, #1.0 }
  v10 = *(_OWORD *)&a1 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL);
  v11 = (float32x4_t)vbicq_s8(vorrq_s8(v2, _Q1), (int8x16_t)vceqzq_f32((float32x4_t)a1));
  v8 = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32((float32x4_t)vdupq_n_s32(0x3B4D2C6Eu), (float32x4_t)v10), (int8x16_t)vmulq_f32((float32x4_t)v10, (float32x4_t)vdupq_n_s32(0x414EB852u)), (int8x16_t)vmlaq_f32((float32x4_t)vdupq_n_s32(0xBD6147AE), (float32x4_t)_simd_pow_f4((simd_float4)v10, (simd_float4)vdupq_n_s64(0x3ED555553ED55555uLL)), (float32x4_t)vdupq_n_s32(0x3F870A3Du)));
  v8.i32[3] = HIDWORD(v10);
  *(_QWORD *)&result = vmulq_f32(v8, v11).u64[0];
  return result;
}

__n64 CLKUIConvertToRGBfFromSRGBf_fast(float32x4_t a1)
{
  __n64 result;

  __asm { FMOV            V1.4S, #1.0 }
  _Q1.i64[0] = vminnmq_f32(vmaxnmq_f32(a1, (float32x4_t)0), _Q1).u64[0];
  result.n64_u32[0] = _CLKUIDecodeSRGBTable[(float)(255.0 * _Q1.f32[0])];
  result.n64_u32[1] = _CLKUIDecodeSRGBTable[vmuls_lane_f32(255.0, *(float32x2_t *)_Q1.f32, 1)];
  return result;
}

__n64 CLKUIConvertToSRGBfFromRGBf_fast(float32x4_t a1)
{
  unint64_t v6;
  __n64 result;

  __asm { FMOV            V1.4S, #1.0 }
  v6 = vmulq_f32(vminnmq_f32(vmaxnmq_f32(a1, (float32x4_t)0), _Q1), (float32x4_t)vdupq_n_s32(0x45CDF000u)).u64[0];
  result.n64_u32[0] = _CLKUIEncodeSRGBTable[*(float *)&v6];
  result.n64_u32[1] = _CLKUIEncodeSRGBTable[*((float *)&v6 + 1)];
  return result;
}

uint64_t CLKUIConvertToSRGB8FromRGBf_fast(float32x4_t a1)
{
  float32x4_t v1;
  int8x16_t v2;
  int v3;

  v1 = vmulq_f32(a1, (float32x4_t)vdupq_n_s32(0x45CDF000u));
  v1.i32[0] = _CLKUIEncodeSRGBTable[v1.f32[0]];
  v1.i32[1] = _CLKUIEncodeSRGBTable[v1.f32[1]];
  v1.i32[2] = _CLKUIEncodeSRGBTable[v1.f32[2]];
  v1.i32[3] = a1.i32[3];
  v2 = (int8x16_t)vmulq_f32(v1, (float32x4_t)vdupq_n_s32(0x437F0000u));
  v3 = (int)*(float *)v2.i32;
  v2.i32[0] = vextq_s8(v2, v2, 8uLL).i32[1];
  *(uint32x2_t *)v2.i8 = vshl_u32((uint32x2_t)vcvt_s32_f32(*(float32x2_t *)v2.i8), (uint32x2_t)0x800000018);
  return v2.i32[0] | ((int)*(float *)&v2.i32[2] << 16) | v3 | v2.i32[1];
}

__n64 CLKUIConvertToRGBfFromSRGB8_fast(__int16 a1)
{
  __n64 result;

  result.n64_u32[0] = _CLKUIDecodeSRGBTable[a1];
  result.n64_u32[1] = _CLKUIDecodeSRGBTable[HIBYTE(a1)];
  return result;
}

__n64 CLKUIConvertToRGBfFromUIColor_fast(void *a1)
{
  float v1;
  float v2;
  __n64 result;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;

  v7 = 0.0;
  v5 = 0;
  v6 = 0.0;
  v4 = 0;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v7, &v6, &v5, &v4);
  v1 = v7;
  v2 = v6;
  result.n64_u32[0] = _CLKUIDecodeSRGBTable[(float)(v1 * 255.0)];
  result.n64_u32[1] = _CLKUIDecodeSRGBTable[(float)(v2 * 255.0)];
  return result;
}

uint64_t CLKUIConvertToUIColorFromRGBf_fast(float32x4_t a1)
{
  float32x4_t v1;

  v1 = vmulq_f32(a1, (float32x4_t)vdupq_n_s32(0x45CDF000u));
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", *(float *)&_CLKUIEncodeSRGBTable[v1.f32[0]], *(float *)&_CLKUIEncodeSRGBTable[v1.f32[1]], *(float *)&_CLKUIEncodeSRGBTable[v1.f32[2]], a1.f32[3]);
}

int8x16_t CLKUIConvertToRGBfFromUIColor(void *a1)
{
  float64x2_t v1;
  float64x2_t v2;
  int8x16_t result;
  float32x4_t v4;
  __int32 v5;
  float64_t v6;
  float64_t v7;
  float64_t v8;
  float64_t v9;

  v8 = 0.0;
  v9 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v9, &v8, &v7, &v6);
  v1.f64[0] = v9;
  v2.f64[0] = v7;
  v1.f64[1] = v8;
  v2.f64[1] = v6;
  v4 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v1), v2);
  v5 = vcvt_f32_f64(v2).i32[1];
  result = (int8x16_t)_simd_pow_f4((simd_float4)vmlaq_f32((float32x4_t)vdupq_n_s32(0x3D55891Au), v4, (float32x4_t)vdupq_n_s32(0x3F72A76Fu)), (simd_float4)vdupq_n_s64(0x4019999A4019999AuLL));
  result.i64[0] = vbslq_s8((int8x16_t)vcgtq_f32((float32x4_t)vdupq_n_s32(0x3D25AEE6u), v4), (int8x16_t)vmulq_f32(v4, (float32x4_t)vdupq_n_s32(0x3D9E8391u)), result).u64[0];
  result.i32[3] = v5;
  return result;
}

uint64_t CLKUIConvertToUIColorFromRGBf(float32x4_t a1)
{
  int8x16_t v1;

  v1 = vbslq_s8((int8x16_t)vcgtq_f32((float32x4_t)vdupq_n_s32(0x3B4D2C6Eu), a1), (int8x16_t)vmulq_f32(a1, (float32x4_t)vdupq_n_s32(0x414EB852u)), (int8x16_t)vmlaq_f32((float32x4_t)vdupq_n_s32(0xBD6147AE), (float32x4_t)_simd_pow_f4((simd_float4)a1, (simd_float4)vdupq_n_s64(0x3ED555553ED55555uLL)), (float32x4_t)vdupq_n_s32(0x3F870A3Du)));
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", *(float *)v1.i32, *(float *)&v1.i32[1], *(float *)&v1.i32[2], a1.f32[3]);
}

int8x16_t CLKUIConvertToRGBfFromUIColor_dynamic(void *a1)
{
  float v1;
  int8x16_t result;
  float64x2_t v3;
  float32x2_t v4;
  float32x4_t v5;
  unsigned __int32 *v11;
  float32x4_t v12;
  unsigned __int32 v13;
  float64_t v14;
  float64_t v15;
  double v16;
  double v17;

  v16 = 0.0;
  v17 = 0.0;
  v14 = 0.0;
  v15 = 0.0;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v17, &v16, &v15, &v14);
  v1 = v17;
  *(float *)result.i32 = v16;
  v3.f64[0] = v15;
  v3.f64[1] = v14;
  v4 = vcvt_f32_f64(v3);
  v5 = vcvt_hight_f32_f64((int32x2_t)__PAIR64__(result.u32[0], LODWORD(v1)), v3);
  if ((vmaxvq_u32((uint32x4_t)vcltzq_f32(v5)) & 0x80000000) != 0)
    goto LABEL_4;
  __asm { FMOV            V2.4S, #1.0 }
  if ((vmaxvq_u32((uint32x4_t)vcgtq_f32(v5, _Q2)) & 0x80000000) != 0)
  {
LABEL_4:
    v12 = v5;
    v13 = v4.u32[1];
    result = (int8x16_t)_simd_pow_f4((simd_float4)vmlaq_f32((float32x4_t)vdupq_n_s32(0x3D55891Au), v5, (float32x4_t)vdupq_n_s32(0x3F72A76Fu)), (simd_float4)vdupq_n_s64(0x4019999A4019999AuLL));
    result.i64[0] = vbslq_s8((int8x16_t)vcgtq_f32((float32x4_t)vdupq_n_s32(0x3D25AEE6u), v12), (int8x16_t)vmulq_f32(v12, (float32x4_t)vdupq_n_s32(0x3D9E8391u)), result).u64[0];
    result.i32[3] = v13;
  }
  else
  {
    v11 = &_CLKUIDecodeSRGBTable[(float)(*(float *)result.i32 * 255.0)];
    result.i32[0] = _CLKUIDecodeSRGBTable[(float)(v1 * 255.0)];
    result.i32[1] = *v11;
  }
  return result;
}

uint64_t CLKUIConvertToUIColorFromRGBf_dynamic(float32x4_t a1)
{
  float32x4_t v1;
  float32x4_t v7;
  int8x16_t v8;
  float32x4_t v9;
  float32x4_t v11;

  v1 = a1;
  if ((vmaxvq_u32((uint32x4_t)vcltzq_f32(a1)) & 0x80000000) != 0)
    goto LABEL_4;
  __asm { FMOV            V0.4S, #1.0 }
  if ((vmaxvq_u32((uint32x4_t)vcgtq_f32(v1, _Q0)) & 0x80000000) != 0)
  {
LABEL_4:
    v11 = v1;
    v9 = (float32x4_t)_simd_pow_f4((simd_float4)v1, (simd_float4)vdupq_n_s64(0x3ED555553ED55555uLL));
    v1.i32[3] = v11.i32[3];
    v8 = vbslq_s8((int8x16_t)vcgtq_f32((float32x4_t)vdupq_n_s32(0x3B4D2C6Eu), v11), (int8x16_t)vmulq_f32(v11, (float32x4_t)vdupq_n_s32(0x414EB852u)), (int8x16_t)vmlaq_f32((float32x4_t)vdupq_n_s32(0xBD6147AE), v9, (float32x4_t)vdupq_n_s32(0x3F870A3Du)));
  }
  else
  {
    v7 = vmulq_f32(v1, (float32x4_t)vdupq_n_s32(0x45CDF000u));
    v8.i32[0] = _CLKUIEncodeSRGBTable[v7.f32[0]];
    v8.i32[1] = _CLKUIEncodeSRGBTable[v7.f32[1]];
    v8.i32[2] = _CLKUIEncodeSRGBTable[v7.f32[2]];
  }
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", *(float *)v8.i32, *(float *)&v8.i32[1], *(float *)&v8.i32[2], v1.f32[3]);
}

float CLKUIConvertToRGBFromSRGB_fast(float a1)
{
  return *(float *)&_CLKUIDecodeSRGBTable[(float)(a1 * 255.0)];
}

float CLKUIConvertToSRGBFromRGB_fast(float a1)
{
  return *(float *)&_CLKUIEncodeSRGBTable[(float)(a1 * 6590.0)];
}

uint64_t _CLKUIRawImageGenerateMipmapsSRGB8(uint64_t result, unsigned int a2)
{
  unsigned __int32 *v2;
  float32x4_t v3;
  float32x4_t v9;
  unint64_t v10;
  uint64_t v11;
  unsigned __int32 *v12;
  unint64_t v13;
  int *v14;
  int *v15;
  int *v16;
  int v17;
  int v18;
  float v19;
  float32x4_t v20;
  float32x4_t v21;
  int v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  int8x16_t v27;

  if ((int)a2 >= 2)
  {
    v2 = (unsigned __int32 *)(result + 4 * a2 * a2);
    v3 = (float32x4_t)vdupq_n_s32(0x44CDF000u);
    __asm { FMOV            V1.4S, #0.25 }
    v9 = (float32x4_t)vdupq_n_s32(0x437F0000u);
    do
    {
      v10 = 0;
      v11 = a2;
      v12 = v2;
      v13 = a2;
      do
      {
        v14 = (int *)(result + 4 * v10 * v13);
        v15 = &v14[v13];
        do
        {
          v16 = &v14[v11];
          v17 = *v14;
          v18 = v14[1];
          v14 += 2;
          v19 = (float)HIBYTE(v17);
          v20.i32[0] = _CLKUIDecodeSRGBTable[v17];
          v20.i32[1] = _CLKUIDecodeSRGBTable[BYTE1(v17)];
          v21.i32[0] = _CLKUIDecodeSRGBTable[v18];
          v21.i32[1] = _CLKUIDecodeSRGBTable[BYTE1(v18)];
          v20.i32[2] = _CLKUIDecodeSRGBTable[BYTE2(v17)];
          v21.i32[2] = _CLKUIDecodeSRGBTable[BYTE2(v18)];
          v22 = *v16;
          LODWORD(v16) = v16[1];
          v23.i32[0] = _CLKUIDecodeSRGBTable[v22];
          v23.i32[1] = _CLKUIDecodeSRGBTable[BYTE1(v22)];
          v23.i32[2] = _CLKUIDecodeSRGBTable[BYTE2(v22)];
          v20.f32[3] = v19 * 0.0039216;
          v21.f32[3] = (float)HIBYTE(v18) * 0.0039216;
          v23.f32[3] = (float)HIBYTE(v22) * 0.0039216;
          v24.i32[0] = _CLKUIDecodeSRGBTable[v16];
          v24.i32[1] = _CLKUIDecodeSRGBTable[BYTE1(v16)];
          v24.i32[2] = _CLKUIDecodeSRGBTable[BYTE2(v16)];
          v24.f32[3] = (float)BYTE3(v16) * 0.0039216;
          v25 = vaddq_f32(vaddq_f32(v21, v20), vaddq_f32(v23, v24));
          v26 = vmulq_f32(v25, v3);
          v26.i32[0] = _CLKUIEncodeSRGBTable[v26.f32[0]];
          v26.i32[1] = _CLKUIEncodeSRGBTable[v26.f32[1]];
          v26.i32[2] = _CLKUIEncodeSRGBTable[v26.f32[2]];
          v26.i32[3] = vmulq_f32(v25, _Q1).i32[3];
          v27 = (int8x16_t)vmulq_f32(v26, v9);
          LODWORD(v16) = (int)*(float *)v27.i32;
          v27.i32[0] = vextq_s8(v27, v27, 8uLL).i32[1];
          *(uint32x2_t *)v27.i8 = vshl_u32((uint32x2_t)vcvt_s32_f32(*(float32x2_t *)v27.i8), (uint32x2_t)0x800000018);
          *v12++ = v27.i32[0] | ((int)*(float *)&v27.i32[2] << 16) | v16 | v27.i32[1];
        }
        while (v14 < v15);
        v10 += 2;
      }
      while (v10 < v13);
      result += 4 * (v13 * v13);
      a2 = v13 >> 1;
      v2 += a2 * a2;
    }
    while (v13 > 3);
  }
  return result;
}

uint64_t _CLKUIRawImageWriteToFileSRGB8(const void *a1, int a2, int a3, void *a4)
{
  id v7;
  CGDataProvider *v8;
  CGColorSpace *v9;
  CGImage *v10;
  UIImage *v11;
  void *v12;

  v7 = a4;
  v8 = CGDataProviderCreateWithData(0, a1, 4 * a2 * a3, 0);
  v9 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
  v10 = CGImageCreate(a2, a3, 8uLL, 0x20uLL, 4 * a2, v9, 0, v8, 0, 0, kCGRenderingIntentDefault);
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", v10);
  v11 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "writeToFile:atomically:", v7, 1);
  CGImageRelease(v10);
  CGDataProviderRelease(v8);
  CGColorSpaceRelease(v9);

  return 1;
}

void sub_1CB9A7E5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1CB9A7E70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1CB9A7E80(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1CB9A7E90(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1CB9A7EA0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1CB9A7EB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id CLKUIInterpolateBetweenColors(void *a1, void *a2, float a3)
{
  id v4;
  id v5;
  id v6;
  float v7;
  float64x2_t v8;
  int8x16_t v9;
  __int128 v10;
  float32x4_t v11;
  __int32 *v17;
  float v18;
  float64x2_t v19;
  float v20;
  __int128 v21;
  float32x4_t v22;
  __int32 *v23;
  float32x4_t v24;
  int8x16_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  int8x16_t v29;
  float32x4_t v30;
  void *v31;
  float32x4_t v33;
  __int128 v34;
  __int128 v35;
  float32x4_t v36;
  float32x4_t v38;
  float32x4_t v39;
  float64_t v40;
  float64_t v41;
  double v42;
  double v43;

  v4 = a1;
  v5 = a2;
  if (CLKEqualObjects())
  {
    v6 = v5;
  }
  else
  {
    v42 = 0.0;
    v43 = 0.0;
    v40 = 0.0;
    v41 = 0.0;
    objc_msgSend(v4, "getRed:green:blue:alpha:", &v43, &v42, &v41, &v40);
    v7 = v43;
    v8.f64[0] = v41;
    *(float *)v9.i32 = v42;
    v8.f64[1] = v40;
    *(float32x2_t *)&v10 = vcvt_f32_f64(v8);
    v11 = vcvt_hight_f32_f64((int32x2_t)__PAIR64__(v9.u32[0], LODWORD(v7)), v8);
    __asm { FMOV            V3.4S, #1.0 }
    v35 = v10;
    v36 = _Q3;
    if ((vmaxvq_u32((uint32x4_t)vcltzq_f32(v11)) & 0x80000000) != 0
      || (vmaxvq_u32((uint32x4_t)vcgtq_f32(v11, _Q3)) & 0x80000000) != 0)
    {
      v9 = vbslq_s8((int8x16_t)vcgtq_f32((float32x4_t)vdupq_n_s32(0x3D25AEE6u), v11), (int8x16_t)vmulq_f32(v11, (float32x4_t)vdupq_n_s32(0x3D9E8391u)), (int8x16_t)_simd_pow_f4((simd_float4)vmlaq_f32((float32x4_t)vdupq_n_s32(0x3D55891Au), v11, (float32x4_t)vdupq_n_s32(0x3F72A76Fu)), (simd_float4)vdupq_n_s64(0x4019999A4019999AuLL)));
    }
    else
    {
      v17 = &_CLKUIDecodeSRGBTable[(float)(*(float *)v9.i32 * 255.0)];
      v9.i32[0] = _CLKUIDecodeSRGBTable[(float)(v7 * 255.0)];
      v9.i32[1] = *v17;
      v9.i32[2] = _CLKUIDecodeSRGBTable[(float)(255.0 * *(float *)&v10)];
    }
    v38 = (float32x4_t)v9;
    v42 = 0.0;
    v43 = 0.0;
    v40 = 0.0;
    v41 = 0.0;
    objc_msgSend(v5, "getRed:green:blue:alpha:", &v43, &v42, &v41, &v40);
    v18 = v43;
    v19.f64[0] = v41;
    v20 = v42;
    v19.f64[1] = v40;
    *(float32x2_t *)&v21 = vcvt_f32_f64(v19);
    v22 = vcvt_hight_f32_f64((int32x2_t)__PAIR64__(LODWORD(v20), LODWORD(v18)), v19);
    if ((vmaxvq_u32((uint32x4_t)vcltzq_f32(v22)) & 0x80000000) != 0
      || (vmaxvq_u32((uint32x4_t)vcgtq_f32(v22, v36)) & 0x80000000) != 0)
    {
      v33 = v22;
      v34 = v21;
      v25 = (int8x16_t)_simd_pow_f4((simd_float4)vmlaq_f32((float32x4_t)vdupq_n_s32(0x3D55891Au), v22, (float32x4_t)vdupq_n_s32(0x3F72A76Fu)), (simd_float4)vdupq_n_s64(0x4019999A4019999AuLL));
      *(_QWORD *)&v21 = v34;
      v24 = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32((float32x4_t)vdupq_n_s32(0x3D25AEE6u), v33), (int8x16_t)vmulq_f32(v33, (float32x4_t)vdupq_n_s32(0x3D9E8391u)), v25);
    }
    else
    {
      v23 = &_CLKUIDecodeSRGBTable[(float)(v20 * 255.0)];
      v24.i32[0] = _CLKUIDecodeSRGBTable[(float)(v18 * 255.0)];
      v24.i32[1] = *v23;
      v24.i32[2] = _CLKUIDecodeSRGBTable[(float)(255.0 * *(float *)&v21)];
    }
    v26 = v38;
    v26.i32[3] = DWORD1(v35);
    v24.i32[3] = DWORD1(v21);
    v27 = vmlaq_n_f32(v26, vsubq_f32(v24, v26), a3);
    if ((vmaxvq_u32((uint32x4_t)vcltzq_f32(v27)) & 0x80000000) != 0
      || (vmaxvq_u32((uint32x4_t)vcgtq_f32(v27, v36)) & 0x80000000) != 0)
    {
      v39 = v27;
      v30 = (float32x4_t)_simd_pow_f4((simd_float4)v27, (simd_float4)vdupq_n_s64(0x3ED555553ED55555uLL));
      v27.i32[3] = v39.i32[3];
      v29 = vbslq_s8((int8x16_t)vcgtq_f32((float32x4_t)vdupq_n_s32(0x3B4D2C6Eu), v39), (int8x16_t)vmulq_f32(v39, (float32x4_t)vdupq_n_s32(0x414EB852u)), (int8x16_t)vmlaq_f32((float32x4_t)vdupq_n_s32(0xBD6147AE), v30, (float32x4_t)vdupq_n_s32(0x3F870A3Du)));
    }
    else
    {
      v28 = vmulq_f32(v27, (float32x4_t)vdupq_n_s32(0x45CDF000u));
      v29.i32[0] = _CLKUIEncodeSRGBTable[v28.f32[0]];
      v29.i32[1] = _CLKUIEncodeSRGBTable[v28.f32[1]];
      v29.i32[2] = _CLKUIEncodeSRGBTable[v28.f32[2]];
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", *(float *)v29.i32, *(float *)&v29.i32[1], *(float *)&v29.i32[2], v27.f32[3], *(double *)&v21, *(_OWORD *)&v33, v34, v35);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v31 = v6;

  return v31;
}

void sub_1CB9A825C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1CB9A8270(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1CB9A8284(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1CB9A8298(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

double _CLKUIRGB2LAB(float32x4_t a1)
{
  float32x4_t v1;
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  double v7;
  float32x4_t v9;

  v1 = vmulq_f32(vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32((float32x4_t)xmmword_1CB9DB3D0, *(float32x2_t *)a1.f32, 1), (float32x4_t)xmmword_1CB9DB3C0, a1.f32[0]), (float32x4_t)xmmword_1CB9DB3E0, a1, 2), (float32x4_t)xmmword_1CB9DB3F0);
  v9 = v1;
  if (v1.f32[0] < 0.0088565)
  {
    v2 = (float)(v1.f32[0] * 7.787) + 0.13793;
    v3 = v1.f32[1];
    if (v1.f32[1] >= 0.0088565)
      goto LABEL_3;
LABEL_6:
    v4 = (float)(v3 * 7.787) + 0.13793;
    v5 = v1.f32[2];
    if (v1.f32[2] < 0.0088565)
      goto LABEL_7;
    goto LABEL_4;
  }
  v6 = cbrtf(v1.f32[0]);
  v1.i32[2] = v9.i32[2];
  v2 = v6;
  v3 = v9.f32[1];
  if (v9.f32[1] < 0.0088565)
    goto LABEL_6;
LABEL_3:
  v4 = cbrtf(v3);
  v5 = v9.f32[2];
  if (v9.f32[2] >= 0.0088565)
LABEL_4:
    cbrtf(v5);
LABEL_7:
  *(float *)&v7 = (float)(v4 * 116.0) + -16.0;
  *((float *)&v7 + 1) = (float)(v2 - v4) * 500.0;
  return v7;
}

double _CLKUILAB2RGB(int32x4_t a1, double a2, float32x2_t a3, double a4, double a5, double a6)
{
  float32x2_t v6;
  float32x2_t v7;
  int32x2_t v8;
  float32x2_t v9;
  float32x2_t v10;
  float32x2_t v11;
  unsigned __int32 v12;
  float32x4_t v13;
  double result;

  v6 = (float32x2_t)vdup_laneq_s32(a1, 2);
  v6.f32[0] = 0.0086207 * *(float *)a1.i32;
  a3.i32[0] = 1041055179;
  v7.f32[0] = vadd_f32(v6, a3).f32[0];
  v8 = (int32x2_t)vmul_f32(v6, (float32x2_t)vdup_n_s32(0x3BA3D70Au));
  *(float *)&a2 = v7.f32[0] + vmuls_lane_f32(0.002, *(float32x2_t *)a1.i8, 1);
  v7.i32[1] = v8.i32[1];
  v9 = vsub_f32(v7, (float32x2_t)vdup_lane_s32(v8, 1));
  *(float *)&a6 = *(float *)&a2 * 0.12842;
  v10 = (float32x2_t)vzip1_s32(*(int32x2_t *)&a2, (int32x2_t)v7);
  v11 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)a1.i8, 0);
  v11.i32[0] = LODWORD(a6);
  LODWORD(a6) = -1131341145;
  v11.i32[0] = vadd_f32(v11, *(float32x2_t *)&a6).u32[0];
  v11.i32[1] = vmul_n_f32((float32x2_t)vdup_n_s32(0x3A911AA7u), *(float *)&a1).i32[1];
  *(int8x8_t *)a1.i8 = vbsl_s8((int8x8_t)vcgt_f32((float32x2_t)vdup_n_s32(0x3E53DCB1u), v10), (int8x8_t)v11, (int8x8_t)vmul_f32(vmul_f32(v10, v10), v10));
  v12 = vmul_f32(vmul_f32(v9, v9), v9).u32[0];
  if (v9.f32[0] < 0.2069)
    *(float *)&v12 = (float)(0.12842 * v9.f32[0]) + -0.017713;
  a1.i32[2] = v12;
  v13 = vmulq_f32((float32x4_t)a1, (float32x4_t)xmmword_1CB9DB400);
  *(_QWORD *)&result = vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32((float32x4_t)xmmword_1CB9DB420, *(float32x2_t *)v13.f32, 1), (float32x4_t)xmmword_1CB9DB410, v13.f32[0]), (float32x4_t)xmmword_1CB9DB430, v13, 2).u64[0];
  return result;
}

double CLKUIConvertRGBtoLAB(float32x4_t a1)
{
  float32x4_t v1;
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  double v7;
  float32x4_t v9;

  v1 = vmulq_f32(vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32((float32x4_t)xmmword_1CB9DB3D0, *(float32x2_t *)a1.f32, 1), (float32x4_t)xmmword_1CB9DB3C0, a1.f32[0]), (float32x4_t)xmmword_1CB9DB3E0, a1, 2), (float32x4_t)xmmword_1CB9DB3F0);
  v9 = v1;
  if (v1.f32[0] < 0.0088565)
  {
    v2 = (float)(v1.f32[0] * 7.787) + 0.13793;
    v3 = v1.f32[1];
    if (v1.f32[1] >= 0.0088565)
      goto LABEL_3;
LABEL_6:
    v4 = (float)(v3 * 7.787) + 0.13793;
    v5 = v1.f32[2];
    if (v1.f32[2] < 0.0088565)
      goto LABEL_7;
    goto LABEL_4;
  }
  v6 = cbrtf(v1.f32[0]);
  v1.i32[2] = v9.i32[2];
  v2 = v6;
  v3 = v9.f32[1];
  if (v9.f32[1] < 0.0088565)
    goto LABEL_6;
LABEL_3:
  v4 = cbrtf(v3);
  v5 = v9.f32[2];
  if (v9.f32[2] >= 0.0088565)
LABEL_4:
    cbrtf(v5);
LABEL_7:
  *(float *)&v7 = (float)(v4 * 116.0) + -16.0;
  *((float *)&v7 + 1) = (float)(v2 - v4) * 500.0;
  return v7;
}

double CLKUIConvertLABtoRGB(int32x4_t a1, float32x4_t a2, double a3, double a4, double a5, float32x2_t a6)
{
  float32x2_t v6;
  float32x2_t v7;
  int32x2_t v8;
  float32x2_t v9;
  float32x2_t v10;
  float32x2_t v11;
  int8x8_t v12;
  unsigned __int32 v13;
  float32x4_t v14;
  double result;

  v6 = (float32x2_t)vdup_laneq_s32(a1, 2);
  v6.f32[0] = 0.0086207 * *(float *)a1.i32;
  a2.i32[0] = 1041055179;
  v7.f32[0] = vadd_f32(v6, *(float32x2_t *)a2.f32).f32[0];
  v8 = (int32x2_t)vmul_f32(v6, (float32x2_t)vdup_n_s32(0x3BA3D70Au));
  *(float *)&a3 = v7.f32[0] + vmuls_lane_f32(0.002, *(float32x2_t *)a1.i8, 1);
  v7.i32[1] = v8.i32[1];
  v9 = vsub_f32(v7, (float32x2_t)vdup_lane_s32(v8, 1));
  v10 = (float32x2_t)vzip1_s32(*(int32x2_t *)&a3, (int32x2_t)v7);
  v11 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)a1.i8, 0);
  v11.f32[0] = *(float *)&a3 * 0.12842;
  a6.i32[0] = -1131341145;
  v12.i32[0] = vadd_f32(v11, a6).u32[0];
  v12.i32[1] = vmul_n_f32((float32x2_t)vdup_n_s32(0x3A911AA7u), *(float *)&a1).i32[1];
  *(int8x8_t *)a2.f32 = vbsl_s8((int8x8_t)vcgt_f32((float32x2_t)vdup_n_s32(0x3E53DCB1u), v10), v12, (int8x8_t)vmul_f32(vmul_f32(v10, v10), v10));
  v13 = vmul_f32(vmul_f32(v9, v9), v9).u32[0];
  if (v9.f32[0] < 0.2069)
    *(float *)&v13 = (float)(0.12842 * v9.f32[0]) + -0.017713;
  a2.i32[2] = v13;
  v14 = vmulq_f32(a2, (float32x4_t)xmmword_1CB9DB400);
  *(_QWORD *)&result = vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32((float32x4_t)xmmword_1CB9DB420, *(float32x2_t *)v14.f32, 1), (float32x4_t)xmmword_1CB9DB410, v14.f32[0]), (float32x4_t)xmmword_1CB9DB430, v14, 2).u64[0];
  return result;
}

float CLKUILightnessForColor(void *a1)
{
  id v1;
  float v2;
  float v3;
  float64x2_t v4;
  float32x4_t v5;
  _DWORD *v11;
  float32x2_t v12;
  float v13;
  float v14;
  float v15;
  float64_t v17;
  float64_t v18;
  double v19;
  double v20;

  v1 = a1;
  v19 = 0.0;
  v20 = 0.0;
  v17 = 0.0;
  v18 = 0.0;
  objc_msgSend(v1, "getRed:green:blue:alpha:", &v20, &v19, &v18, &v17);
  v2 = v20;
  v3 = v19;
  v4.f64[0] = v18;
  v4.f64[1] = v17;
  v5 = vcvt_hight_f32_f64((int32x2_t)__PAIR64__(LODWORD(v3), LODWORD(v2)), v4);
  if ((vmaxvq_u32((uint32x4_t)vcltzq_f32(v5)) & 0x80000000) != 0)
    goto LABEL_4;
  __asm { FMOV            V3.4S, #1.0 }
  if ((vmaxvq_u32((uint32x4_t)vcgtq_f32(v5, _Q3)) & 0x80000000) != 0)
  {
LABEL_4:
    v4 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f32((float32x4_t)vdupq_n_s32(0x3D25AEE6u), v5), (int8x16_t)vmulq_f32(v5, (float32x4_t)vdupq_n_s32(0x3D9E8391u)), (int8x16_t)_simd_pow_f4((simd_float4)vmlaq_f32((float32x4_t)vdupq_n_s32(0x3D55891Au), v5, (float32x4_t)vdupq_n_s32(0x3F72A76Fu)), (simd_float4)vdupq_n_s64(0x4019999A4019999AuLL)));
  }
  else
  {
    v11 = &_CLKUIDecodeSRGBTable[(float)(255.0 * vcvt_f32_f64(v4).f32[0])];
    LODWORD(v4.f64[0]) = _CLKUIDecodeSRGBTable[(float)(v2 * 255.0)];
    HIDWORD(v4.f64[0]) = _CLKUIDecodeSRGBTable[(float)(v3 * 255.0)];
    LODWORD(v4.f64[1]) = *v11;
  }
  v12 = vmul_f32((float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v4, (int8x16_t)v4, 4uLL), (float32x2_t)0x3D93DDDB3F371567);
  v13 = (float)(v12.f32[0] + (float)(0.21259 * *(float *)v4.f64)) + v12.f32[1];
  if (v13 >= 0.0088565)
    v14 = cbrtf(v13);
  else
    v14 = (float)(v13 * 7.787) + 0.13793;
  v15 = (float)(v14 * 116.0) + -16.0;

  return v15;
}

void sub_1CB9A8978(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t CLKUICompareColorsByLightness(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  float v6;
  float v7;
  uint64_t v8;

  v3 = a1;
  v4 = a2;
  if ((objc_msgSend(v3, "isEqual:", v4) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v6 = CLKUILightnessForColor(v3);
    v7 = CLKUILightnessForColor(v4);
    if (v6 >= v7)
      v8 = 0;
    else
      v8 = -1;
    if (v6 > v7)
      v5 = 1;
    else
      v5 = v8;
  }

  return v5;
}

void sub_1CB9A8A08(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1CB9A8A1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1CB9A8A30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id CLKGetBytesFromImage(void *a1, size_t a2, size_t a3, uint64_t a4, size_t a5, CGColorSpace *a6, uint32_t a7)
{
  CGImage *v13;
  size_t v14;
  void *v15;
  CGContext *v16;
  void *v17;
  CGRect v19;

  v13 = (CGImage *)objc_msgSend(objc_retainAutorelease(a1), "CGImage");
  v14 = a4 * a2;
  v15 = malloc_type_calloc(v14 * a3, 1uLL, 0x100004077774924uLL);
  v16 = CGBitmapContextCreate(v15, a2, a3, a5, v14, a6, a7);
  v19.size.width = (double)a2;
  v19.size.height = (double)a3;
  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  CGContextDrawImage(v16, v19, v13);
  CGContextRelease(v16);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v15, v14 * a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  free(v15);
  return v17;
}

id CLKCreateImageFromBytes(UInt8 *bytes, size_t a2, size_t a3, uint64_t a4, size_t a5, CGColorSpace *a6, CGBitmapInfo a7)
{
  size_t v13;
  const __CFData *v14;
  CGDataProvider *v15;
  CGImage *v16;
  void *v17;

  v13 = a4 * a2;
  v14 = CFDataCreate(0, bytes, a4 * a2 * a3);
  v15 = CGDataProviderCreateWithCFData(v14);
  v16 = CGImageCreate(a2, a3, a5, a5 * a4, v13, a6, a7, v15, 0, 0, kCGRenderingIntentDefault);
  CGDataProviderRelease(v15);
  CFRelease(v14);
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v16);
  return v17;
}

void sub_1CB9A8C10(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t _CLKTextureCoordinateToRgb(double a1)
{
  return (int)(a1 * 127.5 + 127.5);
}

double _CLKIntensityForPixel(float32x4_t a1)
{
  return vaddq_f32(vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)a1.f32, 1), a1), (float32x4_t)vdupq_laneq_s32((int32x4_t)a1, 2)).f32[0]* 0.333333333;
}

unint64_t _CLKClamp(uint64_t a1, unint64_t a2)
{
  if (a1 <= a2)
    return a1 & ~(a1 >> 63);
  else
    return a2;
}

double _CLKPixelAtPosition(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint8x8_t a6)
{
  uint64_t v6;
  uint64_t v7;
  double result;

  v6 = a2 - 1;
  if (a2 - 1 >= (unint64_t)a4)
    v6 = a4 & ~(a4 >> 63);
  v7 = a3 - 1;
  if (a3 - 1 >= (unint64_t)a5)
    v7 = a5 & ~(a5 >> 63);
  a6.i32[0] = *(_DWORD *)&a1[4 * v6 + 4 * v7 * a2];
  *(_QWORD *)&result = vcvtq_f32_u32(vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(a6))).u64[0];
  return result;
}

double _CLKIntensityForPixelAtPosition(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, float a6, float a7, float a8)
{
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 *v10;

  v8 = a2 - 1;
  if (a2 - 1 >= (unint64_t)a4)
    v8 = a4 & ~(a4 >> 63);
  v9 = a3 - 1;
  if (a3 - 1 >= (unint64_t)a5)
    v9 = a5 & ~(a5 >> 63);
  v10 = &a1[4 * v8 + 4 * v9 * a2];
  LOBYTE(a6) = *v10;
  LOBYTE(a7) = v10[1];
  LOBYTE(a8) = v10[2];
  return (float)((float)((float)LODWORD(a7) + (float)LODWORD(a6)) + (float)LODWORD(a8)) * 0.333333333;
}

double _CLKCalculateNormal(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, float a6, float a7, float a8, float a9, float a10, float a11, float a12, float a13)
{
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int8 *v22;
  float v23;
  double v24;
  unsigned int v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  unsigned __int8 *v29;
  float v30;
  float v31;
  double v32;
  unint64_t v33;
  unsigned __int8 *v34;
  float v35;
  double v36;
  uint64_t v37;
  unsigned __int8 *v38;
  unsigned int v39;
  unsigned int v40;
  double v41;
  unsigned __int8 *v42;
  float v43;
  float v44;
  double v45;
  unsigned __int8 *v46;
  unsigned int v47;
  unsigned int v48;
  double v49;
  unsigned __int8 *v50;
  unsigned int v51;
  unsigned int v52;
  double v53;
  unsigned __int8 *v54;
  double v55;
  float32_t v56;
  double v57;
  float32x4_t v58;
  int32x4_t v59;
  float32x2_t v60;
  double result;

  v16 = a5 - 1;
  v17 = a2 - 1;
  if (a2 - 1 >= (unint64_t)(a4 - 1))
    v18 = (a4 - 1) & ~((a4 - 1) >> 63);
  else
    v18 = a2 - 1;
  v19 = a3 - 1;
  v20 = v16 & ~(v16 >> 63);
  if (a3 - 1 < (unint64_t)v16)
    v20 = a3 - 1;
  v21 = v20 * a2;
  v22 = &a1[4 * v21 + 4 * v18];
  LOBYTE(a6) = *v22;
  LOBYTE(a7) = v22[1];
  LOBYTE(a8) = v22[2];
  v23 = (float)LODWORD(a8);
  v24 = (float)((float)((float)LODWORD(a7) + (float)LODWORD(a6)) + v23);
  v25 = 1431655765;
  v26 = v24 * -0.333333333;
  v27 = a5 & ~(a5 >> 63);
  if (v19 < a5)
    v27 = a3 - 1;
  v28 = v27 * a2;
  v29 = &a1[4 * v28 + 4 * v18];
  LOBYTE(v25) = *v29;
  LOBYTE(v23) = v29[1];
  v30 = (float)LODWORD(v23);
  LOBYTE(a9) = v29[2];
  v31 = (float)LODWORD(a9);
  v32 = (float)((float)(v30 + (float)v25) + v31);
  if (v19 >= a5 + 1)
    v19 = (a5 + 1) & ~((a5 + 1) >> 63);
  v33 = v19 * a2;
  v34 = &a1[4 * v33 + 4 * v18];
  LOBYTE(v30) = *v34;
  LOBYTE(v31) = v34[1];
  LOBYTE(a10) = v34[2];
  v35 = (float)LODWORD(a10);
  v36 = (float)((float)((float)LODWORD(v31) + (float)LODWORD(v30)) + v35) * 0.333333333;
  v37 = a4 & ~(a4 >> 63);
  if (v17 < a4)
    v37 = a2 - 1;
  v38 = &a1[4 * v21 + 4 * v37];
  LOBYTE(v35) = *v38;
  LOBYTE(a11) = v38[1];
  *(float *)&v39 = (float)LODWORD(a11);
  LOBYTE(a12) = v38[2];
  *(float *)&v40 = (float)LODWORD(a12);
  v41 = (float)((float)(*(float *)&v39 + (float)LODWORD(v35)) + *(float *)&v40);
  v42 = &a1[4 * v33 + 4 * v37];
  LOBYTE(v39) = *v42;
  LOBYTE(v40) = v42[1];
  v43 = (float)v40;
  LOBYTE(a13) = v42[2];
  v44 = (float)LODWORD(a13);
  v45 = (float)((float)(v43 + (float)v39) + v44);
  if (v17 >= a4 + 1)
    v17 = (a4 + 1) & ~((a4 + 1) >> 63);
  v46 = &a1[4 * v21 + 4 * v17];
  LOBYTE(v43) = *v46;
  LOBYTE(v44) = v46[1];
  *(float *)&v47 = (float)LODWORD(v44);
  LOBYTE(v13) = v46[2];
  *(float *)&v48 = (float)v13;
  v49 = (float)((float)(*(float *)&v47 + (float)LODWORD(v43)) + *(float *)&v48) * 0.333333333;
  v50 = &a1[4 * v28 + 4 * v17];
  LOBYTE(v47) = *v50;
  LOBYTE(v48) = v50[1];
  *(float *)&v51 = (float)v48;
  LOBYTE(v14) = v50[2];
  *(float *)&v52 = (float)v14;
  v53 = (float)((float)(*(float *)&v51 + (float)v47) + *(float *)&v52);
  v54 = &a1[4 * v33 + 4 * v17];
  LOBYTE(v51) = *v54;
  LOBYTE(v52) = v54[1];
  LOBYTE(v15) = v54[2];
  v55 = (float)((float)((float)v52 + (float)v51) + (float)v15) * 0.333333333;
  v56 = v26 - v36 + v49 + (v53 - v32) * 0.666666667 + v55;
  v57 = v36 + v26 + (v45 - v41) * 0.666666667 - v49 + v55;
  v58.i64[1] = 0x3F0000003F000000;
  v58.f32[0] = v56;
  *(float *)&v57 = v57;
  v58.i32[1] = LODWORD(v57);
  v59 = (int32x4_t)vmulq_f32(v58, v58);
  v59.i32[0] = vadd_f32(vadd_f32(*(float32x2_t *)v59.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v59.i8, 1)), (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v59, 2)).u32[0];
  v60 = vrsqrte_f32((float32x2_t)v59.u32[0]);
  *(_QWORD *)&result = vmulq_n_f32(v58, vmul_f32(vrsqrts_f32((float32x2_t)v59.u32[0], vmul_f32(v60, v60)), v60).f32[0]).u64[0];
  return result;
}

char *_CLKGenerateNormalMap(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *result;
  double v9;
  float32x2_t v10;
  float v11;
  double v12;
  double v13;
  unsigned int v14;
  double v15;
  float v16;
  float v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  _BYTE *v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  _BYTE *v28;
  uint64_t v29;
  uint64_t v30;
  unsigned __int8 *v31;
  float v32;
  float v33;
  unint64_t v34;
  unint64_t v35;
  float v36;
  unsigned __int8 *v37;
  float v38;
  unint64_t v39;
  unint64_t v40;
  float v41;
  unint64_t v42;
  unsigned __int8 *v43;
  float v44;
  unsigned int v45;
  unsigned int v46;
  float v47;
  unsigned __int8 *v48;
  float v49;
  unsigned int v50;
  unsigned int v51;
  float v52;
  float v53;
  unsigned __int8 *v54;
  unsigned int v55;
  unsigned int v56;
  float v57;
  unsigned __int8 *v58;
  unsigned int v59;
  unsigned int v60;
  unsigned int v61;
  double v62;
  double v63;
  unsigned __int8 *v64;
  unsigned int v65;
  unsigned int v66;
  double v67;
  double v68;
  unsigned __int8 *v69;
  double v70;
  double v71;
  double v72;
  float32x4_t v73;
  int32x4_t v74;
  float32x2_t v75;
  float32x4_t v76;
  int v77;

  result = (char *)malloc_type_malloc(a3 * a2 * a4, 0x100004077774924uLL);
  if (a2 && a3)
  {
    v18 = 0;
    v19 = a2 - 1;
    v20 = a3 - 1;
    v21 = result + 1;
    do
    {
      v22 = 0;
      v23 = v18;
      v24 = v18 - 1;
      v25 = v24 & ~(v24 >> 63);
      if (v19 < v24)
        v25 = a2 - 1;
      if (v19 >= v23)
        v26 = v23;
      else
        v26 = a2 - 1;
      v18 = v23 + 1;
      if (v19 >= v23 + 1)
        v27 = v23 + 1;
      else
        v27 = a2 - 1;
      v28 = v21;
      do
      {
        if (v20 >= v22 - 1)
          v29 = (v22 - 1) & ~((uint64_t)(v22 - 1) >> 63);
        else
          v29 = a3 - 1;
        v30 = v29 * a2;
        v31 = &a1[4 * v29 * a2 + 4 * v25];
        LOBYTE(v9) = *v31;
        v32 = (float)LODWORD(v9);
        LOBYTE(v9) = v31[1];
        v33 = (float)LODWORD(v9);
        v10.i8[0] = v31[2];
        if (v20 >= v22)
          v34 = v22;
        else
          v34 = a3 - 1;
        v35 = v34 * a2;
        v36 = (float)v10.u32[0];
        v37 = &a1[4 * v34 * a2 + 4 * v25];
        LOBYTE(v11) = *v37;
        v38 = (float)LODWORD(v11);
        LOBYTE(v12) = v37[1];
        *(float *)&v12 = (float)LODWORD(v12);
        LOBYTE(v13) = v37[2];
        *(float *)&v13 = (float)LODWORD(v13);
        v39 = v22 + 1;
        if (v20 >= v22 + 1)
          v40 = v22 + 1;
        else
          v40 = a3 - 1;
        v41 = v33 + v32;
        v42 = v40 * a2;
        v43 = &a1[4 * v42 + 4 * v25];
        LOBYTE(v33) = *v43;
        v44 = *(float *)&v12 + v38;
        LOBYTE(v12) = v43[1];
        *(float *)&v45 = (float)LODWORD(v12);
        LOBYTE(v14) = v43[2];
        *(float *)&v46 = (float)v14;
        v47 = *(float *)&v45 + (float)LODWORD(v33);
        v48 = &a1[4 * v30 + 4 * v26];
        LOBYTE(v45) = *v48;
        v49 = v44 + *(float *)&v13;
        LOBYTE(v13) = v48[1];
        *(float *)&v50 = (float)LODWORD(v13);
        LOBYTE(v15) = v48[2];
        *(float *)&v51 = (float)LODWORD(v15);
        v52 = v47 + *(float *)&v46;
        v53 = (float)(*(float *)&v50 + (float)v45) + *(float *)&v51;
        v54 = &a1[4 * v42 + 4 * v26];
        LOBYTE(v50) = *v54;
        LOBYTE(v46) = v54[1];
        *(float *)&v55 = (float)v46;
        LOBYTE(v51) = v54[2];
        *(float *)&v56 = (float)v51;
        v57 = (float)(*(float *)&v55 + (float)v50) + *(float *)&v56;
        v58 = &a1[4 * v30 + 4 * v27];
        LOBYTE(v55) = *v58;
        LOBYTE(v56) = v58[1];
        *(float *)&v59 = (float)v56;
        LOBYTE(v16) = v58[2];
        *(float *)&v60 = (float)LODWORD(v16);
        *(float *)&v61 = *(float *)&v59 + (float)v55;
        v62 = (float)(v41 + v36) * -0.333333333;
        v63 = (float)(*(float *)&v61 + *(float *)&v60);
        v64 = &a1[4 * v35 + 4 * v27];
        LOBYTE(v61) = *v64;
        LOBYTE(v59) = v64[1];
        *(float *)&v65 = (float)v59;
        LOBYTE(v60) = v64[2];
        *(float *)&v66 = (float)v60;
        v67 = v52 * 0.333333333;
        v68 = (float)((float)(*(float *)&v65 + (float)v61) + *(float *)&v66);
        v69 = &a1[4 * v42 + 4 * v27];
        v13 = v57;
        LOBYTE(v65) = *v69;
        LOBYTE(v66) = v69[1];
        v16 = (float)v66;
        LOBYTE(v17) = v69[2];
        v70 = v63 * 0.333333333;
        v17 = (float)LODWORD(v17);
        v71 = v68 - v49;
        v72 = (float)((float)(v16 + (float)v65) + v17) * 0.333333333;
        v14 = 1431655765;
        v15 = v62 - v67 + v70;
        v11 = v15 + v71 * 0.666666667 + v72;
        v12 = v13 - v53;
        *(float *)&v62 = v67 + v62 + v12 * 0.666666667 - v70 + v72;
        v73.i64[1] = 0x3F0000003F000000;
        v73.i64[0] = __PAIR64__(LODWORD(v62), LODWORD(v11));
        v74 = (int32x4_t)vmulq_f32(v73, v73);
        v74.i32[0] = vadd_f32(vadd_f32(*(float32x2_t *)v74.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v74.i8, 1)), (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v74, 2)).u32[0];
        v75 = vrsqrte_f32((float32x2_t)v74.u32[0]);
        v10 = vmul_f32(v75, v75);
        v76 = vmulq_n_f32(v73, vmul_f32(vrsqrts_f32((float32x2_t)v74.u32[0], v10), v75).f32[0]);
        LODWORD(v69) = (int)(v76.f32[0] * 127.5 + 127.5);
        v77 = (int)(v76.f32[1] * 127.5 + 127.5);
        v9 = v76.f32[2] * 127.5 + 127.5;
        *(v28 - 1) = (_BYTE)v69;
        *v28 = v77;
        v28[1] = (int)v9;
        v28[2] = 1;
        v28 += a4 * a2;
        v22 = v39;
      }
      while (a3 != v39);
      v21 += a4;
    }
    while (v18 != a2);
  }
  return result;
}

id CLKGenerateNormalMapFromImageInRGBA8(void *a1)
{
  id v1;
  CGImage *v2;
  unint64_t Width;
  unint64_t Height;
  CGColorSpace *v5;
  id v6;
  CGImage *v7;
  size_t v8;
  void *v9;
  CGContext *v10;
  void *v11;
  id v12;
  char *v13;
  void *v14;
  CGRect v16;

  v1 = objc_retainAutorelease(a1);
  v2 = (CGImage *)objc_msgSend(v1, "CGImage");
  Width = CGImageGetWidth(v2);
  Height = CGImageGetHeight(v2);
  v5 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
  v6 = objc_retainAutorelease(v1);
  v7 = (CGImage *)objc_msgSend(v6, "CGImage");
  v8 = Height * 4 * Width;
  v9 = malloc_type_calloc(v8, 1uLL, 0x100004077774924uLL);
  v10 = CGBitmapContextCreate(v9, Width, Height, 8uLL, 4 * Width, v5, 0x4001u);
  v16.size.width = (double)Width;
  v16.size.height = (double)Height;
  v16.origin.x = 0.0;
  v16.origin.y = 0.0;
  CGContextDrawImage(v10, v16, v7);
  CGContextRelease(v10);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  free(v9);
  CGColorSpaceRelease(v5);
  v12 = objc_retainAutorelease(v11);
  v13 = _CLKGenerateNormalMap((unsigned __int8 *)objc_msgSend(v12, "bytes"), Width, Height, 4);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v13, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  free(v13);

  return v14;
}

void sub_1CB9A9414(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1CB9A9470(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id CLKUIConvertUIImageToMTLTexture(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  id v5;
  CGImage *v6;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  size_t BitsPerPixel;
  size_t v11;
  size_t v12;
  CGDataProvider *DataProvider;
  const __CFData *v14;
  const __CFData *v15;
  const UInt8 *BytePtr;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v25;
  void *v26;
  id v27;
  _QWORD aBlock[4];
  id v29;
  id v30;
  size_t v31;
  size_t v32;
  size_t v33;
  _QWORD block[10];

  v3 = a1;
  +[CLKUIMetalResourceManager sharedDevice](CLKUIMetalResourceManager, "sharedDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(v3);
  v6 = (CGImage *)objc_msgSend(v5, "CGImage");
  Width = CGImageGetWidth(v6);
  Height = CGImageGetHeight(v6);
  BytesPerRow = CGImageGetBytesPerRow(v6);
  BitsPerPixel = CGImageGetBitsPerPixel(v6);
  if ((BitsPerPixel & 7) != 0)
    __assert_rtn("CLKUIConvertUIImageToMTLTexture", "CLKUIImageUtilities.mm", 1301, "bitsPerPixel % 8 == 0");
  v25 = v3;
  v26 = v4;
  v11 = BitsPerPixel >> 3;
  v12 = (BitsPerPixel >> 3) * Width;
  v27 = (id)objc_msgSend(v4, "newBufferWithLength:options:", v12 * Height, 0, v25);
  DataProvider = CGImageGetDataProvider(v6);
  v14 = CGDataProviderCopyData(DataProvider);
  v15 = v14;
  if (v14)
  {
    BytePtr = CFDataGetBytePtr(v14);
    v17 = objc_retainAutorelease(v27);
    v18 = objc_msgSend(v17, "contents");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __CLKUIConvertUIImageToMTLTexture_block_invoke;
    block[3] = &__block_descriptor_72_e8_v16__0Q8l;
    block[4] = BytePtr;
    block[5] = Height;
    block[6] = BytesPerRow;
    block[7] = v18;
    block[8] = v12;
    dispatch_apply(Height, 0, block);
    CFRelease(v15);
    objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", a2, Width, Height, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setStorageMode:", 2);
    objc_msgSend(v19, "setUsage:", 1);
    v20 = (void *)objc_msgSend(v26, "newTextureWithDescriptor:", v19);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __CLKUIConvertUIImageToMTLTexture_block_invoke_2;
    aBlock[3] = &unk_1E86DFE20;
    v31 = Width;
    v32 = v11;
    v33 = Height;
    v29 = v17;
    v30 = v20;
    v21 = v20;
    v22 = _Block_copy(aBlock);
    v23 = _Block_copy(v22);

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

void sub_1CB9A96C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11)
{
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1CB9A9768(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1CB9A9830(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void frameBufferReleaseCallback(void *a1, void *a2)
{
  free(a2);
}

id CLKUIConvertMTLTextureToUIImage(void *a1, uint64_t a2, double a3)
{
  id v5;
  void *v6;
  int v7;
  CFStringRef *v8;
  void *v9;
  CGColorSpace *v10;
  CGBitmapInfo v11;
  size_t v12;
  double v13;
  double v14;
  size_t v15;
  void *v16;
  size_t v17;
  CGDataProvider *v18;
  CGImage *v19;
  _QWORD v21[6];

  v5 = a1;
  v6 = v5;
  if (v5)
  {
    v7 = 1397;
    if (a2 > 552)
    {
      if (a2 == 553 || a2 == 555)
      {
        if (objc_msgSend(v5, "pixelFormat", 1397) == 555)
        {
          v10 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D960]);
          v11 = 270336;
          v12 = 10;
LABEL_15:
          v13 = (double)(unint64_t)objc_msgSend(v6, "width");
          v14 = (double)(unint64_t)objc_msgSend(v6, "height");
          v15 = (unint64_t)(v14 * trunc(v13 * 4.0));
          v16 = malloc_type_malloc(v15, 0x772CBF55uLL);
          v17 = vcvtd_n_u64_f64(v13, 2uLL);
          memset(v21, 0, 24);
          v21[3] = (unint64_t)v13;
          v21[4] = (unint64_t)v14;
          v21[5] = 1;
          objc_msgSend(v6, "getBytes:bytesPerRow:fromRegion:mipmapLevel:", v16, v17, v21, 0);
          v18 = CGDataProviderCreateWithData(0, v16, v15, (CGDataProviderReleaseDataCallback)frameBufferReleaseCallback);
          v19 = CGImageCreate((unint64_t)v13, (unint64_t)v14, v12, 0x20uLL, v17, v10, v11, v18, 0, 1, kCGRenderingIntentDefault);
          objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", v19, 0, a3);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          CGImageRelease(v19);
          CGColorSpaceRelease(v10);
          CGDataProviderRelease(v18);
          goto LABEL_16;
        }
        if (objc_msgSend(v6, "pixelFormat") == 71)
        {
          v8 = (CFStringRef *)MEMORY[0x1E0C9D908];
          goto LABEL_14;
        }
        v7 = 1392;
      }
    }
    else
    {
      if (a2 == 80)
      {
        v8 = (CFStringRef *)MEMORY[0x1E0C9D988];
        goto LABEL_14;
      }
      if (a2 == 81)
      {
        v8 = (CFStringRef *)MEMORY[0x1E0C9DA10];
LABEL_14:
        v10 = CGColorSpaceCreateWithName(*v8);
        v11 = 8194;
        v12 = 8;
        goto LABEL_15;
      }
    }
    __assert_rtn("CLKUIConvertMTLTextureToUIImage", "CLKUIImageUtilities.mm", v7, "NO");
  }
  v9 = 0;
LABEL_16:

  return v9;
}

void sub_1CB9A9A88(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1CB9A9AB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id CLKUIShadowImage(void *a1, void *a2, void *a3, double a4, double a5, double a6)
{
  id v11;
  id v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  CGImage *v23;
  CGColor *v24;
  CGColorSpace *DeviceRGB;
  size_t BitsPerComponent;
  CGContext *v27;
  CGImage *Image;
  CGSize v30;
  CGRect v31;

  v11 = a1;
  v12 = a2;
  v13 = a3;
  v14 = v13;
  if (v11)
  {
    if (v13)
      objc_msgSend(v13, "CGSizeValue");
    else
      objc_msgSend(v11, "size");
    v18 = v15;
    v19 = v16;
    v17 = 0;
    if (v15 >= 1.0 && v16 >= 1.0)
    {
      objc_msgSend(v11, "scale");
      v21 = v20;
      v22 = objc_retainAutorelease(v11);
      v23 = (CGImage *)objc_msgSend(v22, "CGImage");
      v24 = (CGColor *)objc_msgSend(objc_retainAutorelease(v12), "CGColor");
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      BitsPerComponent = CGImageGetBitsPerComponent(v23);
      v27 = CGBitmapContextCreate(0, (unint64_t)(v21 * (v18 + a4 + a6 + a4 + a6)), (unint64_t)(v21 * (v19 + a5 + a6 + a5 + a6)), BitsPerComponent, 0, DeviceRGB, 1u);
      CGColorSpaceRelease(DeviceRGB);
      v30.width = v21 * a4;
      v30.height = v21 * a5;
      CGContextSetShadowWithColor(v27, v30, v21 * a6, v24);
      CGContextSetFillColorWithColor(v27, v24);
      CGContextSetBlendMode(v27, kCGBlendModeColor);
      v31.origin.x = v21 * (a4 + a6);
      v31.origin.y = v21 * (a5 + a6);
      v31.size.width = v21 * v18;
      v31.size.height = v21 * v19;
      CGContextDrawImage(v27, v31, v23);
      Image = CGBitmapContextCreateImage(v27);
      CGContextRelease(v27);
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", Image, objc_msgSend(v22, "imageOrientation"), v21);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      CGImageRelease(Image);
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

void sub_1CB9A9CB4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1CB9A9CD0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1CB9A9CE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1CB9A9D00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1CB9A9D18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1CB9A9D30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1CB9A9D48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1CB9A9D60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1CB9A9D78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id CLKUIShadowImageFromView(void *a1, void *a2, void *a3, double a4, double a5, double a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  CGColorSpace *DeviceRGB;
  double v34;
  CGContext *v35;
  CGImage *Image;

  v11 = a1;
  v12 = a2;
  v13 = a3;
  if (v11)
  {
    v14 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(v11, "image");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithImage:", v15);

    if (v13)
    {
      objc_msgSend(v13, "CGSizeValue");
      v18 = v17;
      v20 = v19;
      v21 = 0;
      v22 = 1.0;
      if (v18 < 1.0)
        goto LABEL_13;
    }
    else
    {
      objc_msgSend(v11, "frame");
      v18 = v23;
      v20 = v24;
      v21 = 0;
      v22 = 1.0;
      if (v23 < 1.0)
      {
LABEL_13:

        goto LABEL_14;
      }
    }
    if (v20 >= v22)
    {
      objc_msgSend(v16, "image");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "scale");
      v27 = v26;

      objc_msgSend(v16, "layer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v29) = 1.0;
      objc_msgSend(v28, "setShadowOpacity:", v29);
      v30 = v27 * a6;
      objc_msgSend(v28, "setShadowRadius:", v27 * a6);
      v31 = v12;
      if (!v12)
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v28, "setShadowColor:", objc_msgSend(objc_retainAutorelease(v31), "CGColor"));
      v32 = v27 * (v18 + a4 + a6 + a4 + a6);
      if (!v12)

      objc_msgSend(v28, "setShadowOffset:", -v32, 0.0);
      objc_msgSend(v16, "setFrame:", a4, a5, v18, v20);
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      v34 = v27 * (v20 + a5 + a6 + a5 + a6);
      v35 = CGBitmapContextCreate(0, (unint64_t)v32, (unint64_t)v34, 8uLL, 0, DeviceRGB, 1u);
      CGColorSpaceRelease(DeviceRGB);
      CGContextTranslateCTM(v35, v32 + v30, v34 - v30);
      CGContextScaleCTM(v35, v27, -v27);
      objc_msgSend(v28, "renderInContext:", v35);
      Image = CGBitmapContextCreateImage(v35);
      CGContextRelease(v35);
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", Image, 0, v27);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      CGImageRelease(Image);

    }
    goto LABEL_13;
  }
  v21 = 0;
LABEL_14:

  return v21;
}

void sub_1CB9AA018(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1CB9AA060()
{
  uint64_t v0;
  void *v1;

  if (!v0)

  JUMPOUT(0x1CB9AA0ACLL);
}

void sub_1CB9AA070(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1CB9AA08C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1CB9AA0A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

const __CFString *CLKUIMetalElapsedTimeCategoryDescription(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("Binary Archive");
  if (a1 == 1)
    v1 = CFSTR("Render Pipeline");
  if (a1 == 2)
    return CFSTR("Function");
  else
    return v1;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void _LayoutConstants(void *a1@<X0>, void *a2@<X8>)
{
  id WeakRetained;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id obj;

  obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock);
  WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v4 = WeakRetained;
  v5 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice);
  if (v5 != obj)
  {

LABEL_5:
    v8 = objc_storeWeak(&_LayoutConstants___cachedDevice, obj);
    _LayoutConstants___previousCLKDeviceVersion = objc_msgSend(obj, "version");

    ___LayoutConstants_block_invoke(v9, obj);
    goto LABEL_6;
  }
  v6 = objc_msgSend(obj, "version");
  v7 = _LayoutConstants___previousCLKDeviceVersion;

  if (v6 != v7)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock);
  memcpy(a2, &_LayoutConstants___constants, 0x138uLL);

}

void sub_1CB9ADFD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id filterNamesToIndicesMap()
{
  if (filterNamesToIndicesMap_onceToken != -1)
    dispatch_once(&filterNamesToIndicesMap_onceToken, &__block_literal_global_0);
  return (id)filterNamesToIndicesMap_namesToIndices;
}

void __filterNamesToIndicesMap_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("CLKUITritiumViewFilterTypeBrightnessName");
  v2[1] = CFSTR("CLKUITritiumViewFilterTypeSaturationName");
  v3[0] = &unk_1E86EEEA0;
  v3[1] = &unk_1E86EEEB8;
  v2[2] = CFSTR("CLKUIViewFilterTypeNameTritiumTapThrough");
  v3[2] = &unk_1E86EEED0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)filterNamesToIndicesMap_namesToIndices;
  filterNamesToIndicesMap_namesToIndices = v0;

}

float CLKUITritiumMaxAPL()
{
  void **p_vtable;
  void *v1;
  unint64_t v2;
  void *v3;
  void *v4;
  float v5;
  float v6;

  if (qword_1EF9AEDE0 == -1)
  {
    p_vtable = CLKUIWheelsOfTimeButton.vtable;
    if ((_MergedGlobals & 1) != 0)
      return *((float *)p_vtable + 358);
  }
  else
  {
    dispatch_once(&qword_1EF9AEDE0, &__block_literal_global_1);
    p_vtable = (void **)(CLKUIWheelsOfTimeButton + 24);
    if ((_MergedGlobals & 1) != 0)
      return *((float *)p_vtable + 358);
  }
  _MergedGlobals = 1;
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "deviceCategory");

  if (v2 <= 5)
    *((_DWORD *)p_vtable + 358) = dword_1CB9E2418[v2];
  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("NTKMaxTritiumFaceAPL"), CFSTR("com.apple.NanoTimeKit"));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "floatValue");
    v6 = fmin(fmax(v5 * 0.01, 0.0), 1.0);
    *((float *)p_vtable + 358) = v6;
  }

  return *((float *)p_vtable + 358);
}

float _linearizeAndComputeAPL(uint64_t a1, vDSP_Length a2)
{
  const float *v4;
  float *v5;
  const float *v6;
  const float *v7;
  unsigned __int8 *v8;
  vDSP_Length v9;
  float *v10;
  int v11;
  float32x4_t v12;
  double v13;
  NSObject *v14;
  float32_t v16;
  uint64_t __C;

  if (!a1)
  {
    _CLKUILoggingObjectForDomain(1, (uint64_t)"CLKUILoggingDomainTritium");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      _linearizeAndComputeAPL_cold_1();
    goto LABEL_11;
  }
  v4 = (const float *)malloc_type_malloc(12 * a2, 0x100004052888210uLL);
  if (!v4)
  {
    _CLKUILoggingObjectForDomain(1, (uint64_t)"CLKUILoggingDomainTritium");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      _linearizeAndComputeAPL_cold_2();
LABEL_11:

    LODWORD(v13) = 0;
    return *(float *)&v13;
  }
  v5 = (float *)v4;
  v6 = &v4[a2];
  v7 = &v4[2 * a2];
  if (a2)
  {
    v8 = (unsigned __int8 *)(a1 + 2);
    v9 = a2;
    v10 = (float *)v4;
    do
    {
      *v10 = _NTKAPLGammaTable[*(v8 - 2)];
      v10[a2] = _NTKAPLGammaTable[*(v8 - 1)];
      v11 = *v8;
      v8 += 4;
      v10[2 * a2] = _NTKAPLGammaTable[v11];
      ++v10;
      --v9;
    }
    while (v9);
  }
  __C = 0;
  v16 = 0.0;
  vDSP_meanv(v4, 1, (float *)&__C + 1, a2);
  vDSP_meanv(v6, 1, (float *)&__C, a2);
  vDSP_meanv(v7, 1, &v16, a2);
  free(v5);
  v12.i64[0] = __PAIR64__(__C, HIDWORD(__C));
  v12.f32[2] = v16;
  v13 = CLKUIConvertP3ToAPL(v12);
  return *(float *)&v13;
}

CGContext *CreateDrawImageToBitmap(void *a1)
{
  id v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGColorSpace *v9;
  CGContext *v10;
  CGImage *v11;
  NSObject *v12;
  uint8_t v14[16];
  CGRect v15;

  v1 = a1;
  objc_msgSend(v1, "size");
  v4 = v2 * v3;
  v5 = 1.0;
  if (v2 * v3 > 64000000.0)
    v5 = 2.0;
  if (v4 > 16000000.0)
    v5 = v5 + v5;
  if (v4 > 4000000.0)
    v5 = v5 + v5;
  if (v4 <= 1000000.0)
    v6 = v5;
  else
    v6 = v5 + v5;
  v7 = v2 / v6;
  if (v2 / v6 == 0.0 || (v8 = v3 / v6, v3 / v6 == 0.0))
  {
    _CLKUILoggingObjectForDomain(1, (uint64_t)"CLKUILoggingDomainTritium");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1CB9A4000, v12, OS_LOG_TYPE_DEFAULT, "Attempting to compute apl of image with 0 size.", v14, 2u);
    }

    v10 = 0;
  }
  else
  {
    v9 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D908]);
    v10 = CGBitmapContextCreate(0, (unint64_t)v7, (unint64_t)v8, 8uLL, 0, v9, 1u);
    CGContextSetInterpolationQuality(v10, kCGInterpolationNone);
    v11 = (CGImage *)objc_msgSend(objc_retainAutorelease(v1), "CGImage");
    v15.origin.x = 0.0;
    v15.origin.y = 0.0;
    v15.size.width = v7;
    v15.size.height = v8;
    CGContextDrawImage(v10, v15, v11);
    CGColorSpaceRelease(v9);
  }

  return v10;
}

void CLKUIComputeDimmingRequiredToObtainAPLGivenAPL(float a1, float a2, float a3)
{
  float v6;

  v6 = CLKUITritiumMaxAPL();
  powf(fmaxf(v6 - a2, 0.0) / (float)(a3 * a1), 0.45455);
}

float CLKUIComputeImageAPL(void *a1)
{
  id v1;
  void *v2;
  float v3;
  CGContext *DrawImageToBitmap;
  CGContext *v5;
  size_t Width;
  size_t Height;
  void *Data;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  v3 = 0.0;
  if (v1)
  {
    DrawImageToBitmap = CreateDrawImageToBitmap(v1);
    if (DrawImageToBitmap)
    {
      v5 = DrawImageToBitmap;
      Width = CGBitmapContextGetWidth(DrawImageToBitmap);
      Height = CGBitmapContextGetHeight(v5);
      Data = CGBitmapContextGetData(v5);
      if (Data)
      {
        v3 = _linearizeAndComputeAPL((uint64_t)Data, (unint64_t)((double)Height * (double)Width));
      }
      else
      {
        _CLKUILoggingObjectForDomain(1, (uint64_t)"CLKUILoggingDomainTritium");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          CLKUIComputeImageAPL_cold_1();

      }
      CGContextRelease(v5);
    }
    else
    {
      _CLKUILoggingObjectForDomain(1, (uint64_t)"CLKUILoggingDomainTritium");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v2, "description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412290;
        v14 = v10;
        _os_log_impl(&dword_1CB9A4000, v9, OS_LOG_TYPE_DEFAULT, "Failed to create bitmap context for APL computation of image %@", (uint8_t *)&v13, 0xCu);

      }
    }
  }

  return v3;
}

void CLKUIComputeDimmingRequiredToObtainImageAPLUnclamped(void *a1, float a2, float a3)
{
  float v5;
  float v6;

  v5 = CLKUIComputeImageAPL(a1);
  v6 = CLKUITritiumMaxAPL();
  powf(fmaxf(v6 - a2, 0.0) / (float)(v5 * a3), 0.45455);
}

float CLKUIComputeDimmingRequiredToObtainImageAPL(void *a1, float a2, float a3)
{
  float v5;
  float v6;

  v5 = CLKUIComputeImageAPL(a1);
  v6 = CLKUITritiumMaxAPL();
  return fmin(powf(fmaxf(v6 - a2, 0.0) / (float)(v5 * a3), 0.45455), 1.0);
}

float CLKUIComputeDimmingRequiredToObtainImageAPLClamped(void *a1, float a2)
{
  float v2;
  float v3;
  float v4;

  v2 = a2 + -0.082;
  v3 = CLKUIComputeImageAPL(a1);
  v4 = CLKUITritiumMaxAPL();
  return fmin(powf(fmaxf(v4 + v2, 0.0) / v3, 0.45455), 1.0);
}

void CLKUIComputeDimmingRequiredToObtainQuadAPLUnclamped(void *a1, float a2, float a3)
{
  float v5;
  float v6;
  float v7;

  objc_msgSend(a1, "computeAPL");
  v6 = v5;
  v7 = CLKUITritiumMaxAPL();
  powf(fmaxf(v7 - a2, 0.0) / (float)(v6 * a3), 0.45455);
}

float CLKUIComputeDimmingRequiredToObtainQuadAPL(void *a1, float a2, float a3)
{
  float v5;
  float v6;
  float v7;

  objc_msgSend(a1, "computeAPL");
  v6 = v5;
  v7 = CLKUITritiumMaxAPL();
  return fmin(powf(fmaxf(v7 - a2, 0.0) / (float)(v6 * a3), 0.45455), 1.0);
}

id _CLKUIComputeTextureAPL(void *a1, void *a2, id *a3)
{
  void *v3;
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  id v29;
  id v30;

  v6 = a2;
  v7 = a1;
  +[CLKUIMetalResourceManager sharedDevice](CLKUIMetalResourceManager, "sharedDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "supportsFamily:", 1004);
  if (!*a3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    v11 = (void *)objc_msgSend(v8, "newDefaultLibraryWithBundle:error:", v10, &v30);
    v12 = v30;

    v13 = (void *)objc_msgSend(v11, "newFunctionWithName:", CFSTR("compute_apl"));
    v29 = v12;
    v3 = (void *)objc_msgSend(v8, "newComputePipelineStateWithFunction:error:", v13, &v29);
    v14 = v29;

    v15 = v3;
    *a3 = v15;

  }
  v16 = (void *)objc_msgSend(v8, "newBufferWithLength:options:", 12, 1);
  objc_msgSend(v6, "computeCommandEncoder");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setComputePipelineState:", *a3);
  objc_msgSend(v17, "setBuffer:offset:atIndex:", v16, 0, 2);
  objc_msgSend(v17, "setBuffer:offset:atIndex:", v16, 4, 3);
  objc_msgSend(v17, "setBuffer:offset:atIndex:", v16, 8, 4);
  objc_msgSend(v17, "setTexture:atIndex:", v7, 0);
  v18 = objc_msgSend(*a3, "threadExecutionWidth");
  v19 = objc_msgSend(*a3, "maxTotalThreadsPerThreadgroup") / v18;
  LODWORD(v3) = vcvtpd_u64_f64((double)(unint64_t)objc_msgSend(v7, "width") * 0.166666667);
  v20 = objc_msgSend(v7, "height");

  LODWORD(v21) = vcvtpd_u64_f64((double)v20 * 0.166666667);
  if (v9)
  {
    v26 = (unint64_t)v3;
    v27 = v21;
    v28 = 1;
    v23 = v18;
    v24 = v19;
    v25 = 1;
    objc_msgSend(v17, "dispatchThreads:threadsPerThreadgroup:", &v26, &v23);
  }
  else
  {
    v26 = ((unint64_t)v3 + v18 - 1) / v18;
    v27 = (v19 + v21 - 1) / v19;
    v28 = 1;
    v23 = v18;
    v24 = v19;
    v25 = 1;
    objc_msgSend(v17, "dispatchThreadgroups:threadsPerThreadgroup:", &v26, &v23);
  }
  objc_msgSend(v17, "endEncoding");

  return v16;
}

double CLKUIGetAPLFromSumBuffer(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64x2_t v4;
  float64x2_t v5;
  float32x4_t v6;
  uint64_t v8;

  *(double *)&v8 = (double)(unint64_t)(a3 * a2) * 255.0;
  v3 = objc_msgSend(objc_retainAutorelease(a1), "contents");
  v4.i64[0] = *(_QWORD *)v3;
  v4.i64[1] = HIDWORD(*(_QWORD *)v3);
  v5 = (float64x2_t)vdupq_lane_s64(v8, 0);
  v6 = (float32x4_t)vdivq_f64(vcvtq_f64_u64(v4), v5);
  *(float32x2_t *)v6.f32 = vcvt_f32_f64((float64x2_t)v6);
  LODWORD(v5.f64[0]) = *(_DWORD *)(v3 + 8);
  *(float *)v5.f64 = (double)*(unint64_t *)&v5.f64[0] / *(double *)&v8;
  v6.i32[2] = LODWORD(v5.f64[0]);
  return CLKUIConvertSRGBToAPL(v6);
}

id CLKUIComputeTextureAPL(void *a1, void *a2, id *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a1;
  _CLKUIComputeTextureAPL(v5, a2, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __CLKUIComputeTextureAPL_block_invoke;
  v12[3] = &unk_1E86DFFD8;
  v13 = v6;
  v14 = v5;
  v7 = v5;
  v8 = v6;
  v9 = _Block_copy(v12);
  v10 = _Block_copy(v9);

  return v10;
}

float CLKUIComputeColorAPL(void *a1)
{
  const __CFString *v1;
  id v2;
  CGColorSpace *v3;
  id v4;
  CGColor *v5;
  CGColor *CopyByMatchingToColorSpace;
  float64x2_t *Components;
  float32x4_t v8;
  float32_t v9;
  double v10;
  float v11;

  v1 = (const __CFString *)*MEMORY[0x1E0C9D940];
  v2 = a1;
  v3 = CGColorSpaceCreateWithName(v1);
  v4 = objc_retainAutorelease(v2);
  v5 = (CGColor *)objc_msgSend(v4, "CGColor");

  CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v3, kCGRenderingIntentDefault, v5, 0);
  Components = (float64x2_t *)CGColorGetComponents(CopyByMatchingToColorSpace);
  v8 = *(float32x4_t *)Components;
  *(float32x2_t *)v8.f32 = vcvt_f32_f64(*Components);
  v9 = Components[1].f64[0];
  v8.f32[2] = v9;
  v10 = CLKUIConvertP3ToAPL(v8);
  v11 = *(float *)&v10;
  CGColorRelease(CopyByMatchingToColorSpace);
  CGColorSpaceRelease(v3);
  return v11;
}

void CLKUIComputeDimmingRequiredToObtainColorAPLUnclamped(void *a1, float a2, float a3)
{
  const __CFString *v5;
  id v6;
  CGColorSpace *v7;
  id v8;
  CGColor *v9;
  CGColor *CopyByMatchingToColorSpace;
  float64x2_t *Components;
  float32x4_t v12;
  float32_t v13;
  double v14;
  float v15;
  float v16;

  v5 = (const __CFString *)*MEMORY[0x1E0C9D940];
  v6 = a1;
  v7 = CGColorSpaceCreateWithName(v5);
  v8 = objc_retainAutorelease(v6);
  v9 = (CGColor *)objc_msgSend(v8, "CGColor");

  CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v7, kCGRenderingIntentDefault, v9, 0);
  Components = (float64x2_t *)CGColorGetComponents(CopyByMatchingToColorSpace);
  v12 = *(float32x4_t *)Components;
  *(float32x2_t *)v12.f32 = vcvt_f32_f64(*Components);
  v13 = Components[1].f64[0];
  v12.f32[2] = v13;
  v14 = CLKUIConvertP3ToAPL(v12);
  v15 = *(float *)&v14;
  CGColorRelease(CopyByMatchingToColorSpace);
  CGColorSpaceRelease(v7);
  v16 = CLKUITritiumMaxAPL();
  powf(fmaxf(v16 - a2, 0.0) / (float)(v15 * a3), 0.45455);
}

float CLKUIComputeDimmingRequiredToObtainColorAPL(void *a1, float a2, float a3)
{
  const __CFString *v5;
  id v6;
  CGColorSpace *v7;
  id v8;
  CGColor *v9;
  CGColor *CopyByMatchingToColorSpace;
  float64x2_t *Components;
  float32x4_t v12;
  float32_t v13;
  double v14;
  float v15;
  float v16;

  v5 = (const __CFString *)*MEMORY[0x1E0C9D940];
  v6 = a1;
  v7 = CGColorSpaceCreateWithName(v5);
  v8 = objc_retainAutorelease(v6);
  v9 = (CGColor *)objc_msgSend(v8, "CGColor");

  CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v7, kCGRenderingIntentDefault, v9, 0);
  Components = (float64x2_t *)CGColorGetComponents(CopyByMatchingToColorSpace);
  v12 = *(float32x4_t *)Components;
  *(float32x2_t *)v12.f32 = vcvt_f32_f64(*Components);
  v13 = Components[1].f64[0];
  v12.f32[2] = v13;
  v14 = CLKUIConvertP3ToAPL(v12);
  v15 = *(float *)&v14;
  CGColorRelease(CopyByMatchingToColorSpace);
  CGColorSpaceRelease(v7);
  v16 = CLKUITritiumMaxAPL();
  return fmin(powf(fmaxf(v16 - a2, 0.0) / (float)(v15 * a3), 0.45455), 1.0);
}

void CLKUIConvertTextureFromXRSRGBtoP3(void *a1, void *a2, void *a3, id *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  id v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  id v50;
  id v51;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = objc_msgSend(v7, "width");
  if (v10 == objc_msgSend(v8, "width"))
  {
    v11 = objc_msgSend(v7, "height");
    v12 = objc_msgSend(v8, "height");
    if (v8)
    {
      if (v7 && v11 == v12)
      {
        +[CLKUIMetalResourceManager sharedDevice](CLKUIMetalResourceManager, "sharedDevice");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "supportsFamily:", 1004);
        if (!*a4)
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = 0;
          v16 = (void *)objc_msgSend(v13, "newDefaultLibraryWithBundle:error:", v15, &v51);
          v17 = v51;

          if (v17)
          {
            _CLKUILoggingObjectForDomain(0, (uint64_t)"CLKUILoggingDomainMetalQuadView");
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
              CLKUIConvertTextureFromXRSRGBtoP3_cold_5((uint64_t)v17, v18, v19, v20, v21, v22, v23, v24);

          }
          if (!v16)
          {
            _CLKUILoggingObjectForDomain(0, (uint64_t)"CLKUILoggingDomainMetalQuadView");
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
              CLKUIConvertTextureFromXRSRGBtoP3_cold_4();

          }
          v26 = (void *)objc_msgSend(v16, "newFunctionWithName:", CFSTR("compute_convert_xrsrgb_to_p3"));
          if (!v26)
          {
            _CLKUILoggingObjectForDomain(0, (uint64_t)"CLKUILoggingDomainMetalQuadView");
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
              CLKUIConvertTextureFromXRSRGBtoP3_cold_3();

          }
          v50 = 0;
          v28 = (void *)objc_msgSend(v13, "newComputePipelineStateWithFunction:error:", v26, &v50);
          v29 = v50;
          v30 = v28;
          *a4 = v30;
          if (v29)
          {
            _CLKUILoggingObjectForDomain(0, (uint64_t)"CLKUILoggingDomainMetalQuadView");
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
              CLKUIConvertTextureFromXRSRGBtoP3_cold_2((uint64_t)v29, v31, v32, v33, v34, v35, v36, v37);

            v30 = *a4;
          }
          if (!v30)
          {
            _CLKUILoggingObjectForDomain(0, (uint64_t)"CLKUILoggingDomainMetalQuadView");
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
              CLKUIConvertTextureFromXRSRGBtoP3_cold_1();

          }
        }
        objc_msgSend(v9, "computeCommandEncoder");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setComputePipelineState:", *a4);
        objc_msgSend(v39, "setTexture:atIndex:", v7, 0);
        objc_msgSend(v39, "setTexture:atIndex:", v8, 1);
        v40 = objc_msgSend(*a4, "threadExecutionWidth");
        v41 = objc_msgSend(*a4, "maxTotalThreadsPerThreadgroup") / v40;
        v42 = objc_msgSend(v7, "width");
        v43 = objc_msgSend(v7, "height");
        if (v14)
        {
          v47 = v42;
          v48 = v43;
          v49 = 1;
          v44 = v40;
          v45 = v41;
          v46 = 1;
          objc_msgSend(v39, "dispatchThreads:threadsPerThreadgroup:", &v47, &v44);
        }
        else
        {
          v47 = (v40 + v42 - 1) / v40;
          v48 = (v41 + v43 - 1) / v41;
          v49 = 1;
          v44 = v40;
          v45 = v41;
          v46 = 1;
          objc_msgSend(v39, "dispatchThreadgroups:threadsPerThreadgroup:", &v47, &v44);
        }
        objc_msgSend(v39, "endEncoding");

      }
    }
  }

}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_1CB9B0E28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CB9B0EC4(_Unwind_Exception *a1)
{
  id *v1;

  _Unwind_Resume(a1);
}

void ___disabledLayerActions_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[11];
  _QWORD v4[12];

  v4[11] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = CFSTR("affineTransform");
  v3[1] = CFSTR("backgroundColor");
  v4[0] = v0;
  v4[1] = v0;
  v3[2] = CFSTR("bounds");
  v3[3] = CFSTR("contentsMultiplyColor");
  v4[2] = v0;
  v4[3] = v0;
  v3[4] = CFSTR("hidden");
  v3[5] = CFSTR("instanceCount");
  v4[4] = v0;
  v4[5] = v0;
  v3[6] = CFSTR("instanceDelay");
  v3[7] = CFSTR("instanceTransform");
  v4[6] = v0;
  v4[7] = v0;
  v3[8] = CFSTR("opacity");
  v3[9] = CFSTR("position");
  v4[8] = v0;
  v4[9] = v0;
  v3[10] = CFSTR("transform");
  v4[10] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 11);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_disabledLayerActions__dictionary;
  _disabledLayerActions__dictionary = v1;

}

id CLKUILocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  _CLKUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_1E86E1470, CFSTR("ClockKitUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id _CLKUIBundle()
{
  if (_CLKUIBundle_onceToken != -1)
    dispatch_once(&_CLKUIBundle_onceToken, &__block_literal_global_124);
  return (id)_CLKUIBundle___bundle;
}

uint64_t _ImageNamedInBundle(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:compatibleWithTraitCollection:", a1, a2, 0);
}

id CLKUIImageNamed(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = (void *)MEMORY[0x1E0C94510];
  v2 = a1;
  objc_msgSend(v1, "sharedRenderingContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CLKUIImageNamedForDevice(v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id CLKUIImageNamedForDevice(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = a1;
  _CLKUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CLKUIImageNamedFromBundleForDevice(v5, v4, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id CLKUIImageNamedFromBundleForDevice(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (objc_msgSend(v7, "deviceCategory") != 3
    || (objc_msgSend(v6, "stringByAppendingString:", CFSTR("-aloe")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:compatibleWithTraitCollection:", v8, v5, 0),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        !v9))
  {
    _CLKVersionedImageNameIfPreGlory(v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:compatibleWithTraitCollection:", v10, v5, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

id _CLKVersionedImageNameIfPreGlory(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;

  v3 = a1;
  objc_msgSend(a2, "nrDeviceVersion");
  v4 = v3;
  if ((NRVersionIsGreaterThanOrEqual() & 1) == 0)
  {
    _PreGloryVersionedImageNames();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v3);

    v4 = v3;
    if (v6)
    {
      objc_msgSend(v3, "stringByAppendingString:", CFSTR("-pre5_0"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v4;
}

uint64_t _CLKUIOrderedImageSizeSuffixesForSizeClass(unint64_t a1)
{
  if (a1 > 8)
    return 0;
  else
    return (uint64_t)*(&off_1E86E00E8 + a1);
}

id CLKUIOrderedSuffixesForDevice(void *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CLKUIOrderedSuffixesForDevice___lock);
  WeakRetained = objc_loadWeakRetained(&CLKUIOrderedSuffixesForDevice___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&CLKUIOrderedSuffixesForDevice___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&CLKUIOrderedSuffixesForDevice___cachedDevice, v1);
    CLKUIOrderedSuffixesForDevice___previousCLKDeviceVersion = objc_msgSend(v1, "version");

    __CLKUIOrderedSuffixesForDevice_block_invoke(v8, v1);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v1, "version");
  v6 = CLKUIOrderedSuffixesForDevice___previousCLKDeviceVersion;

  if (v5 != v6)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CLKUIOrderedSuffixesForDevice___lock);
  v9 = (id)CLKUIOrderedSuffixesForDevice___suffixes;

  return v9;
}

id _CLKUIImageNamedFromBundleForDeviceWithSuffixes(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a1;
  v7 = a2;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = a4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v7, "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12), (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:compatibleWithTraitCollection:", v13, v6, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {

          goto LABEL_11;
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:compatibleWithTraitCollection:", v7, v6, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v14;
}

id CLKUIAssetBundleSuffixesForSizeClass()
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", &stru_1E86E1470);
  objc_msgSend(v0, "addObject:", CFSTR("-agave"));
  objc_msgSend(v0, "addObject:", CFSTR("-aloe"));
  objc_msgSend(v0, "addObject:", CFSTR("-luxo"));
  objc_msgSend(v0, "addObject:", CFSTR("-sunscreen"));
  return v0;
}

id CLKUIImageNamedFromAssetBundleForDevice(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v5 = a3;
  v6 = a2;
  v7 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CLKUIImageNamedFromAssetBundleForDevice___lock);
  WeakRetained = objc_loadWeakRetained(&CLKUIImageNamedFromAssetBundleForDevice___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v9 = WeakRetained;
  v10 = objc_loadWeakRetained(&CLKUIImageNamedFromAssetBundleForDevice___cachedDevice);
  if (v10 != v5)
  {

LABEL_5:
    v13 = objc_storeWeak(&CLKUIImageNamedFromAssetBundleForDevice___cachedDevice, v5);
    CLKUIImageNamedFromAssetBundleForDevice___previousCLKDeviceVersion = objc_msgSend(v5, "version");

    __CLKUIImageNamedFromAssetBundleForDevice_block_invoke(v14, v5);
    goto LABEL_6;
  }
  v11 = objc_msgSend(v5, "version");
  v12 = CLKUIImageNamedFromAssetBundleForDevice___previousCLKDeviceVersion;

  if (v11 != v12)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CLKUIImageNamedFromAssetBundleForDevice___lock);
  _CLKUIImageNamedFromBundleForDeviceWithSuffixes(v7, v6, v15, (void *)CLKUIImageNamedFromAssetBundleForDevice___suffixes);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id _PreGloryVersionedImageNames()
{
  if (_PreGloryVersionedImageNames_onceToken != -1)
    dispatch_once(&_PreGloryVersionedImageNames_onceToken, &__block_literal_global_52);
  return (id)_PreGloryVersionedImageNames___preGloryVersionedImages;
}

void sub_1CB9B28C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id _CLKUILoggingObjectForDomain(uint64_t a1, uint64_t a2)
{
  dispatch_once_t *v3;
  _QWORD v5[6];

  v3 = (dispatch_once_t *)((char *)&_CLKUILoggingObjectForDomain_onceTokens + 8 * a1);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = ___CLKUILoggingObjectForDomain_block_invoke;
  v5[3] = &__block_descriptor_48_e5_v8__0l;
  v5[4] = a1;
  v5[5] = a2;
  if (*v3 != -1)
    dispatch_once(v3, v5);
  return (id)_CLKUILoggingObjectForDomain___logObjects[a1];
}

double CLKUITextureFormatGetASTCBlockSize(int a1)
{
  return s_artFormatsAstcBlockSize[a1];
}

double CLKUIComputePow2SubRect(void *a1)
{
  id v1;

  if (a1)
  {
    v1 = a1;
    objc_msgSend(v1, "size");
    objc_msgSend(v1, "scale");
    objc_msgSend(v1, "size");
    objc_msgSend(v1, "scale");

  }
  return 0.0;
}

uint64_t _CLKUIDeterminePlaneLength(int a1, int a2, int a3, int a4)
{
  unsigned int v4;
  unsigned int v6;
  unsigned int v7;

  if ((a1 - 5) > 1)
  {
    if ((a1 - 11) > 0x37)
    {
      return (a3 * a2 * a4);
    }
    else
    {
      v6 = HIDWORD(*(_QWORD *)&s_artFormatsAstcBlockSize[a1]);
      v7 = *(_QWORD *)&s_artFormatsAstcBlockSize[a1];
      return 16 * (a2 + v7 - 1) / v7 * ((a3 + v6 - 1) / v6);
    }
  }
  else
  {
    v4 = 4 * a3 * a2 + 7;
    if (v4 >= 0x100)
      return v4 >> 3;
    else
      return 0;
  }
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_7(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

uint64_t CLKUIAnalogHandsDefaultPreferredFramesPerSecondForDevice()
{
  double v0;

  CLKValueForDeviceMetrics();
  return (uint64_t)v0;
}

void startAndEndOfDayForDateInTimeZone(_QWORD *a1, _QWORD *a2, void *a3, void *a4)
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v7 = (void *)MEMORY[0x1E0C99D48];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "currentCalendar");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTimeZone:", v8);

  objc_msgSend(v11, "startOfDayForDate:", v9);
  *a1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dateByAddingUnit:value:toDate:options:", 16, 1, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "startOfDayForDate:", v10);
  *a2 = (id)objc_claimAutoreleasedReturnValue();

}

BOOL isDateBetweenDates(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  _BOOL8 v8;

  v5 = a1;
  v6 = a3;
  v7 = objc_msgSend(a2, "compare:", v5);
  if (v7)
    v8 = v7 == -1 && objc_msgSend(v6, "compare:", v5) >= 0;
  else
    v8 = 1;

  return v8;
}

double _LayoutConstants_0(void *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_0);
  WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_0);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_0);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&_LayoutConstants___cachedDevice_0, v1);
    _LayoutConstants___previousCLKDeviceVersion_0 = objc_msgSend(v1, "version");

    ___LayoutConstants_block_invoke_0(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v1, "version");
  v6 = _LayoutConstants___previousCLKDeviceVersion_0;

  if (v5 != v6)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_0);
  v9 = *(double *)&_LayoutConstants__constants_0;

  return v9;
}

uint64_t CLKUIFetchPrimaryGamutMatrix(_OWORD *a1)
{
  uint64_t v1;
  __int128 v2;

  v1 = MEMORY[0x1E0C83FE8];
  v2 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 16);
  *a1 = *MEMORY[0x1E0C83FE8];
  a1[1] = v2;
  a1[2] = *(_OWORD *)(v1 + 32);
  return 1;
}

double CLKUIPrimaryGamutMatrix()
{
  if (CLKUIPrimaryGamutMatrix_onceToken != -1)
    dispatch_once(&CLKUIPrimaryGamutMatrix_onceToken, &__block_literal_global_5);
  return *(double *)&CLKUIPrimaryGamutMatrix_p3ToNativeMatrix;
}

double CLKUINativeToAPLCoeff()
{
  if (CLKUINativeToAPLCoeff_onceToken != -1)
    dispatch_once(&CLKUINativeToAPLCoeff_onceToken, &__block_literal_global_1);
  return *(double *)&CLKUINativeToAPLCoeff_coefficients;
}

double CLKUIConvertP3ToNative(float32x4_t a1)
{
  float32x4_t v1;
  float32x4_t v2;
  double result;

  v1 = a1;
  if (CLKUIPrimaryGamutMatrix_onceToken != -1)
  {
    dispatch_once(&CLKUIPrimaryGamutMatrix_onceToken, &__block_literal_global_5);
    v1 = a1;
  }
  v2 = (float32x4_t)vtrn2q_s32((int32x4_t)CLKUIPrimaryGamutMatrix_p3ToNativeMatrix, *(int32x4_t *)algn_1EF9AEED0);
  v2.i32[2] = DWORD1(xmmword_1EF9AEEE0);
  *(_QWORD *)&result = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)vzip1q_s32(vzip1q_s32((int32x4_t)CLKUIPrimaryGamutMatrix_p3ToNativeMatrix, (int32x4_t)xmmword_1EF9AEEE0), *(int32x4_t *)algn_1EF9AEED0), v1.f32[0]), v2, *(float32x2_t *)v1.f32, 1), (float32x4_t)vzip1q_s32(vzip2q_s32((int32x4_t)CLKUIPrimaryGamutMatrix_p3ToNativeMatrix, (int32x4_t)xmmword_1EF9AEEE0), vdupq_laneq_s32(*(int32x4_t *)algn_1EF9AEED0, 2)), v1, 2).u64[0];
  return result;
}

double CLKUIConvertNativeToAPL(float32x4_t a1)
{
  float32x4_t v1;
  double result;
  float32x4_t v3;

  if (CLKUINativeToAPLCoeff_onceToken != -1)
  {
    v3 = a1;
    dispatch_once(&CLKUINativeToAPLCoeff_onceToken, &__block_literal_global_1);
    a1 = v3;
  }
  v1 = vmulq_f32((float32x4_t)CLKUINativeToAPLCoeff_coefficients, a1);
  *(_QWORD *)&result = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v1, 2), vaddq_f32(v1, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v1.f32, 1))).u64[0];
  return result;
}

double CLKUIConvertP3ToAPL(float32x4_t a1)
{
  int32x4_t v1;
  int32x4_t v2;
  int32x4_t v3;
  float32x4_t v4;
  float32x4_t v5;
  double result;
  __int128 v7;
  __int128 v8;
  int32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;

  if (CLKUIPrimaryGamutMatrix_onceToken != -1)
  {
    v10 = a1;
    dispatch_once(&CLKUIPrimaryGamutMatrix_onceToken, &__block_literal_global_5);
    a1 = v10;
  }
  v2 = (int32x4_t)CLKUIPrimaryGamutMatrix_p3ToNativeMatrix;
  v1 = *(int32x4_t *)algn_1EF9AEED0;
  v3 = (int32x4_t)xmmword_1EF9AEEE0;
  if (CLKUINativeToAPLCoeff_onceToken != -1)
  {
    v11 = a1;
    v8 = CLKUIPrimaryGamutMatrix_p3ToNativeMatrix;
    v9 = *(int32x4_t *)algn_1EF9AEED0;
    v7 = xmmword_1EF9AEEE0;
    dispatch_once(&CLKUINativeToAPLCoeff_onceToken, &__block_literal_global_1);
    v3 = (int32x4_t)v7;
    v2 = (int32x4_t)v8;
    v1 = v9;
    a1 = v11;
  }
  v4 = (float32x4_t)vtrn2q_s32(v2, v1);
  v4.i32[2] = v3.i32[1];
  v5 = vmulq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)vzip1q_s32(vzip1q_s32(v2, v3), v1), a1.f32[0]), v4, *(float32x2_t *)a1.f32, 1), (float32x4_t)vzip1q_s32(vzip2q_s32(v2, v3), vdupq_laneq_s32(v1, 2)), a1, 2), (float32x4_t)CLKUINativeToAPLCoeff_coefficients);
  *(_QWORD *)&result = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v5, 2), vaddq_f32(v5, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v5.f32, 1))).u64[0];
  return result;
}

double sRGBtoNative()
{
  if (sRGBtoNative_onceToken != -1)
    dispatch_once(&sRGBtoNative_onceToken, &__block_literal_global_2);
  return *(double *)&sRGBtoNative_sRGBToNative;
}

double __sRGBtoNative_block_invoke()
{
  uint64_t v0;
  __int128 v1;
  __int128 v2;
  __int128 v3;
  double result;
  _OWORD v5[3];
  __int128 v6;
  __int128 v7;
  __int128 v8;

  if (CLKUIPrimaryGamutMatrix_onceToken != -1)
    dispatch_once(&CLKUIPrimaryGamutMatrix_onceToken, &__block_literal_global_5);
  v0 = 0;
  v1 = CLKUIPrimaryGamutMatrix_p3ToNativeMatrix;
  v2 = *(_OWORD *)algn_1EF9AEED0;
  HIDWORD(v1) = 0;
  HIDWORD(v2) = 0;
  v3 = xmmword_1EF9AEEE0;
  HIDWORD(v3) = 0;
  v5[0] = v1;
  v5[1] = v2;
  v5[2] = v3;
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  do
  {
    *(__int128 *)((char *)&v6 + v0 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1CB9E2760, COERCE_FLOAT(v5[v0])), (float32x4_t)xmmword_1CB9E2770, *(float32x2_t *)&v5[v0], 1), (float32x4_t)xmmword_1CB9E2780, (float32x4_t)v5[v0], 2);
    ++v0;
  }
  while (v0 != 3);
  result = *(double *)&v6;
  DWORD2(sRGBtoNative_sRGBToNative) = DWORD2(v6);
  *(_DWORD *)algn_1EF9AEF28 = DWORD2(v7);
  *(_QWORD *)&sRGBtoNative_sRGBToNative = v6;
  qword_1EF9AEF20 = v7;
  DWORD2(xmmword_1EF9AEF30) = DWORD2(v8);
  *(_QWORD *)&xmmword_1EF9AEF30 = v8;
  return result;
}

double CLKUIConvertSRGBToAPL(float32x4_t a1)
{
  int32x4_t v1;
  int32x4_t v2;
  int32x4_t v3;
  float32x4_t v4;
  float32x4_t v5;
  double result;
  __int128 v7;
  __int128 v8;
  int32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;

  if (sRGBtoNative_onceToken != -1)
  {
    v10 = a1;
    dispatch_once(&sRGBtoNative_onceToken, &__block_literal_global_2);
    a1 = v10;
  }
  v2 = (int32x4_t)sRGBtoNative_sRGBToNative;
  v1 = *(int32x4_t *)&qword_1EF9AEF20;
  v3 = (int32x4_t)xmmword_1EF9AEF30;
  if (CLKUINativeToAPLCoeff_onceToken != -1)
  {
    v11 = a1;
    v8 = sRGBtoNative_sRGBToNative;
    v9 = *(int32x4_t *)&qword_1EF9AEF20;
    v7 = xmmword_1EF9AEF30;
    dispatch_once(&CLKUINativeToAPLCoeff_onceToken, &__block_literal_global_1);
    v3 = (int32x4_t)v7;
    v2 = (int32x4_t)v8;
    v1 = v9;
    a1 = v11;
  }
  v4 = (float32x4_t)vtrn2q_s32(v2, v1);
  v4.i32[2] = v3.i32[1];
  v5 = vmulq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)vzip1q_s32(vzip1q_s32(v2, v3), v1), a1.f32[0]), v4, *(float32x2_t *)a1.f32, 1), (float32x4_t)vzip1q_s32(vzip2q_s32(v2, v3), vdupq_laneq_s32(v1, 2)), a1, 2), (float32x4_t)CLKUINativeToAPLCoeff_coefficients);
  *(_QWORD *)&result = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v5, 2), vaddq_f32(v5, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v5.f32, 1))).u64[0];
  return result;
}

float interpolate_identity_to_color@<S0>(void *a1@<X0>, uint64_t a2@<X8>, float a3@<S0>)
{
  float v5;
  float v6;
  float v7;
  float result;
  double v9;
  double v10;
  double v11;
  double v12;

  v11 = 0.0;
  v12 = 0.0;
  v9 = 0.0;
  v10 = 0.0;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v12, &v11, &v10, &v9);
  *(float *)a2 = 1.0 - a3;
  *(_QWORD *)(a2 + 4) = 0;
  *(_DWORD *)(a2 + 12) = 0;
  v5 = v12 * a3;
  *(float *)(a2 + 16) = v5;
  *(_DWORD *)(a2 + 20) = 0;
  *(float *)(a2 + 24) = 1.0 - a3;
  *(_QWORD *)(a2 + 28) = 0;
  v6 = v11 * a3;
  *(float *)(a2 + 36) = v6;
  *(_QWORD *)(a2 + 40) = 0;
  *(float *)(a2 + 48) = 1.0 - a3;
  *(_DWORD *)(a2 + 52) = 0;
  v7 = v10 * a3;
  *(float *)(a2 + 56) = v7;
  *(_QWORD *)(a2 + 60) = 0;
  *(_DWORD *)(a2 + 68) = 0;
  result = (float)(1.0 - a3) + a3 * v9;
  *(float *)(a2 + 72) = result;
  *(_DWORD *)(a2 + 76) = 0;
  return result;
}

uint64_t source_over_for_color(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v4 = 0;
  v5 = 0;
  v2 = 0;
  v3 = 0;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v5, &v4, &v3, &v2);
  return CAColorMatrixMakeColorSourceOver();
}

id CLKUIFlatMonochromeFilters(void *a1, double a2)
{
  void *v2;
  _QWORD *v3;
  float v4;
  void *v5;
  void *v6;
  void *v7;
  _OWORD v9[5];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v10 = 0u;
  if (a2 == 1.0)
  {
    source_over_for_color(a1);
    v2 = (void *)MEMORY[0x1E0CD2780];
    v3 = (_QWORD *)MEMORY[0x1E0CD2F08];
  }
  else
  {
    v4 = a2;
    interpolate_identity_to_color(a1, (uint64_t)&v10, v4);
    v2 = (void *)MEMORY[0x1E0CD2780];
    v3 = (_QWORD *)MEMORY[0x1E0CD2BF0];
  }
  objc_msgSend(v2, "filterWithType:", *v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v12;
  v9[3] = v13;
  v9[4] = v14;
  v9[0] = v10;
  v9[1] = v11;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v6, CFSTR("inputColorMatrix"));

  v15[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id CLKUIFlatMonochromeFiltersOpaque(void *a1)
{
  return CLKUIFlatMonochromeFilters(a1, 1.0);
}

id CLKUIFlatMonochromeFiltersWhite(double a1)
{
  void *v2;
  void *v3;

  CLKUIDefaultComplicationBackgroundColor();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CLKUIFlatMonochromeFilters(v2, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id CLKUIDefaultComplicationBackgroundColor()
{
  if (CLKUIDefaultComplicationBackgroundColor_onceToken != -1)
    dispatch_once(&CLKUIDefaultComplicationBackgroundColor_onceToken, &__block_literal_global_5_0);
  return (id)CLKUIDefaultComplicationBackgroundColor___backgroundColor;
}

id CLKUIFlatMonochromeFiltersWhiteOpaque()
{
  void *v0;
  void *v1;

  CLKUIDefaultComplicationBackgroundColor();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  CLKUIFlatMonochromeFilters(v0, 1.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

CGImageRef _CLKUICreateMonochromeMapImage(void *a1, double a2)
{
  id v3;
  CGColorSpace *DeviceRGB;
  CGContext *v5;
  id v6;
  CGColor *CopyByMatchingToColorSpace;
  const CGFloat *Components;
  unint64_t i;
  double v10;
  CGImageRef Image;
  CGRect v13;

  v3 = a1;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v5 = CGBitmapContextCreate(0, 0xFFuLL, 1uLL, 8uLL, 0x1FE0uLL, DeviceRGB, 0x4001u);
  v6 = objc_retainAutorelease(v3);
  CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(DeviceRGB, kCGRenderingIntentDefault, (CGColorRef)objc_msgSend(v6, "CGColor"), 0);
  Components = CGColorGetComponents(CopyByMatchingToColorSpace);
  for (i = 0; i != 255; ++i)
  {
    if (i)
      v10 = (float)((float)i / 254.0) + a2;
    else
      v10 = 0.0;
    CGContextSetRGBFillColor(v5, *Components, Components[1], Components[2], v10);
    v13.origin.x = (double)i;
    v13.origin.y = 0.0;
    v13.size.width = 1.0;
    v13.size.height = 1.0;
    CGContextFillRect(v5, v13);
  }
  Image = CGBitmapContextCreateImage(v5);
  CGColorRelease(CopyByMatchingToColorSpace);
  CGContextRelease(v5);
  CGColorSpaceRelease(DeviceRGB);

  return Image;
}

id CLKUIDesatMonochromeFiltersWithTintedBackground(void *a1, void *a2, double a3)
{
  id v5;
  id v6;
  void *v7;
  float v8;
  float v9;
  float v10;
  float v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  double v29;
  double v30;
  double v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "_luminance");
    objc_msgSend(v5, "_luminance");
  }
  v30 = 0.0;
  v31 = 0.0;
  v29 = 0.0;
  objc_msgSend(v5, "getRed:green:blue:alpha:", &v31, &v30, &v29, 0);
  v8 = a3;
  v9 = v31 * v8;
  v10 = v30 * v8;
  v11 = v29 * v8;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v24 = 0u;
  *(float *)&v19 = 1.0 - v8;
  *(_QWORD *)((char *)&v19 + 4) = 0;
  *((float *)&v19 + 3) = v9;
  *(_QWORD *)&v20 = 0;
  *((_QWORD *)&v20 + 1) = COERCE_UNSIGNED_INT(1.0 - v8);
  *(float *)&v21 = v10;
  *(_QWORD *)((char *)&v21 + 4) = 0;
  HIDWORD(v21) = 0;
  *(float *)&v22 = 1.0 - v8;
  *((float *)&v22 + 1) = v11;
  *((_QWORD *)&v22 + 1) = 0;
  *(_QWORD *)&v23 = 0;
  *((_QWORD *)&v23 + 1) = 1065353216;
  *(float *)&v16 = 1.0 - v8;
  *(float *)&v17 = 1.0 - v8;
  *(float *)&v18 = 1.0 - v8;
  CAColorMatrixConcat();
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BF0], v16, 0, 0, v17, 0, 0, v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", &v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setValue:forKey:", v13, *MEMORY[0x1E0CD2D20]);

  objc_msgSend(v12, "setValue:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD2D80]);
  v32[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id CLKUIDesatMonochromeFilters(void *a1, double a2)
{
  return CLKUIDesatMonochromeFiltersWithTintedBackground(a1, 0, a2);
}

id CLKUIDesatMonochromeFiltersOpaque(void *a1)
{
  return CLKUIDesatMonochromeFiltersWithTintedBackground(a1, 0, 1.0);
}

id CLKUIDesatMonochromeFiltersWhite(double a1)
{
  void *v2;
  void *v3;

  CLKUIDefaultAlternateComplicationColor();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CLKUIDesatMonochromeFiltersWithTintedBackground(v2, 0, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id CLKUIDefaultAlternateComplicationColor()
{
  if (CLKUIDefaultAlternateComplicationColor_onceToken != -1)
    dispatch_once(&CLKUIDefaultAlternateComplicationColor_onceToken, &__block_literal_global_7);
  return (id)CLKUIDefaultAlternateComplicationColor___color;
}

id CLKUIDesatMonochromeFiltersWhiteOpaque()
{
  void *v0;
  void *v1;

  CLKUIDefaultAlternateComplicationColor();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  CLKUIDesatMonochromeFiltersWithTintedBackground(v0, 0, 1.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id CLKUIMonochromeFiltersForStyle(void *a1, void *a2, void *a3, double a4)
{
  return CLKUIMonochromeFiltersForStyleWithTintedBackground(a1, a2, a3, 0, a4);
}

id CLKUIMonochromeFiltersForStyleWithTintedBackground(void *a1, void *a2, void *a3, void *a4, double a5)
{
  id v9;
  id v10;
  id v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (fabs(a5) >= 0.00000011920929)
  {
    switch((unint64_t)a1)
    {
      case 0uLL:
        v12 = a5;
        v13 = v9;
        goto LABEL_7;
      case 1uLL:
        v14 = a5;
        v15 = v9;
        goto LABEL_9;
      case 2uLL:
        v12 = a5;
        v13 = v10;
LABEL_7:
        CLKUIFlatMonochromeFilters(v13, v12);
        v16 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      case 3uLL:
        v14 = a5;
        v15 = v10;
LABEL_9:
        v17 = 0;
        goto LABEL_13;
      case 4uLL:
        v14 = a5;
        v15 = v9;
        goto LABEL_12;
      case 5uLL:
        v14 = a5;
        v15 = v10;
LABEL_12:
        v17 = v11;
LABEL_13:
        CLKUIDesatMonochromeFiltersWithTintedBackground(v15, v17, v14);
        v16 = objc_claimAutoreleasedReturnValue();
LABEL_14:
        a1 = (void *)v16;
        break;
      default:
        break;
    }
  }
  else
  {
    a1 = (void *)MEMORY[0x1E0C9AA60];
  }

  return a1;
}

uint64_t CLKUIAssociatedNonAccentStyle(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4)
    return 0;
  else
    return qword_1CB9E2818[a1 - 1];
}

uint64_t CLKUIAssociatedAccentStyle(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4)
    return 2;
  else
    return qword_1CB9E2840[a1 - 1];
}

uint64_t CLKUIAssociatedDesaturatedType(uint64_t a1)
{
  if ((unint64_t)(a1 - 2) > 3)
    return 1;
  else
    return qword_1CB9E2868[a1 - 2];
}

uint64_t CLKUIDefaultComplicationBackgroundColorWithNonAccentColor(void *a1, const char *a2)
{
  return objc_msgSend(a1, "colorWithAlphaComponent:", 0.1);
}

id NTKFlatMonochromeFilter(void *a1, double a2)
{
  void *v2;
  _QWORD *v3;
  float v4;
  void *v5;
  void *v6;
  _OWORD v8[5];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  if (a2 == 1.0)
  {
    source_over_for_color(a1);
    v2 = (void *)MEMORY[0x1E0CD2780];
    v3 = (_QWORD *)MEMORY[0x1E0CD2F08];
  }
  else
  {
    v4 = a2;
    interpolate_identity_to_color(a1, (uint64_t)&v9, v4);
    v2 = (void *)MEMORY[0x1E0CD2780];
    v3 = (_QWORD *)MEMORY[0x1E0CD2BF0];
  }
  objc_msgSend(v2, "filterWithType:", *v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v11;
  v8[3] = v12;
  v8[4] = v13;
  v8[0] = v9;
  v8[1] = v10;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v6, CFSTR("inputColorMatrix"));

  return v5;
}

id NTKFlatMonochromeFilterOpaque(void *a1)
{
  return NTKFlatMonochromeFilter(a1, 1.0);
}

id NTKFlatMonochromeFilterWhite(double a1)
{
  void *v2;
  void *v3;

  CLKUIDefaultComplicationBackgroundColor();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NTKFlatMonochromeFilter(v2, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id NTKFlatMonochromeFilterWhiteOpaque()
{
  void *v0;
  void *v1;

  CLKUIDefaultComplicationBackgroundColor();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  NTKFlatMonochromeFilter(v0, 1.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id NTKDesatMonochromeFilter(void *a1, double a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  CGImage *v8;

  v3 = (void *)MEMORY[0x1E0CD2780];
  v4 = *MEMORY[0x1E0CD2E20];
  v5 = a1;
  objc_msgSend(v3, "filterWithType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2 * 0.95);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("inputAmount"));

  v8 = _CLKUICreateMonochromeMapImage(v5, a2 * 0.2);
  objc_msgSend(v6, "setValue:forKey:", v8, CFSTR("inputColorMap"));
  CGImageRelease(v8);
  return v6;
}

id NTKDesatMonochromeFilterOpaque(void *a1)
{
  return NTKDesatMonochromeFilter(a1, 1.0);
}

id NTKDesatMonochromeFilterWhite(double a1)
{
  void *v2;
  void *v3;

  CLKUIDefaultAlternateComplicationColor();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NTKDesatMonochromeFilter(v2, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id NTKDesatMonochromeFilterWhiteOpaque()
{
  void *v0;
  void *v1;

  CLKUIDefaultAlternateComplicationColor();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  NTKDesatMonochromeFilter(v0, 1.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id NTKMonochromeFilterForStyle(unint64_t a1, void *a2, void *a3, double a4)
{
  id v7;
  id v8;
  void *v9;

  v7 = a2;
  v8 = a3;
  v9 = v8;
  if (a1 <= 5)
  {
    if (((1 << a1) & 0x13) != 0)
      v8 = v7;
    NTKDesatMonochromeFilter(v8, a4);
    a1 = objc_claimAutoreleasedReturnValue();
  }

  return (id)a1;
}

void sub_1CB9B892C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1CB9B9024(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
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

void sub_1CB9B98DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double CLKUICurvedColoringLabelCornerSize(void *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CLKUICurvedColoringLabelCornerSize___lock);
  WeakRetained = objc_loadWeakRetained(&CLKUICurvedColoringLabelCornerSize___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&CLKUICurvedColoringLabelCornerSize___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&CLKUICurvedColoringLabelCornerSize___cachedDevice, v1);
    CLKUICurvedColoringLabelCornerSize___previousCLKDeviceVersion = objc_msgSend(v1, "version");

    __CLKUICurvedColoringLabelCornerSize_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v1, "version");
  v6 = CLKUICurvedColoringLabelCornerSize___previousCLKDeviceVersion;

  if (v5 != v6)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CLKUICurvedColoringLabelCornerSize___lock);
  v9 = *(double *)&CLKUICurvedColoringLabelCornerSize__size_0;

  return v9;
}

double CLKUICurvedColoringLabelCenterSize(void *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CLKUICurvedColoringLabelCenterSize___lock);
  WeakRetained = objc_loadWeakRetained(&CLKUICurvedColoringLabelCenterSize___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&CLKUICurvedColoringLabelCenterSize___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&CLKUICurvedColoringLabelCenterSize___cachedDevice, v1);
    CLKUICurvedColoringLabelCenterSize___previousCLKDeviceVersion = objc_msgSend(v1, "version");

    __CLKUICurvedColoringLabelCenterSize_block_invoke(v8, v1);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v1, "version");
  v6 = CLKUICurvedColoringLabelCenterSize___previousCLKDeviceVersion;

  if (v5 != v6)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CLKUICurvedColoringLabelCenterSize___lock);
  v9 = *(double *)&CLKUICurvedColoringLabelCenterSize__size_0;

  return v9;
}

void _LayoutConstants_1(void *a1@<X0>, uint64_t a2@<X8>)
{
  id WeakRetained;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  id obj;

  obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_2);
  WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_2);
  if (!WeakRetained)
    goto LABEL_5;
  v4 = WeakRetained;
  v5 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_2);
  if (v5 != obj)
  {

LABEL_5:
    v8 = objc_storeWeak(&_LayoutConstants___cachedDevice_2, obj);
    _LayoutConstants___previousCLKDeviceVersion_2 = objc_msgSend(obj, "version");

    ___LayoutConstants_block_invoke_2(v9, obj);
    goto LABEL_6;
  }
  v6 = objc_msgSend(obj, "version");
  v7 = _LayoutConstants___previousCLKDeviceVersion_2;

  if (v6 != v7)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_2);
  v10 = xmmword_1EF9AF018;
  *(_OWORD *)a2 = _LayoutConstants__constants;
  *(_OWORD *)(a2 + 16) = v10;
  *(_QWORD *)(a2 + 32) = qword_1EF9AF028;

}

id _FontWithCenteredColons(void *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void **v7;
  uint64_t *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fontDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(a2 + 1) > 1)
  {
    if ((unint64_t)(a2 - 1) > 0xD)
      v9 = 0;
    else
      v9 = off_1E86E05D0[a2 - 1];
    v10 = *MEMORY[0x1E0CA8320];
    v15 = v9;
    v16 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v5;
    v6 = (void *)MEMORY[0x1E0C99D80];
    v7 = &v17;
    v8 = &v16;
  }
  else
  {
    if (_FontWithCenteredColons_onceToken != -1)
      dispatch_once(&_FontWithCenteredColons_onceToken, &__block_literal_global_8);
    v4 = *MEMORY[0x1E0DC4A28];
    v18 = _FontWithCenteredColons___centeredColonsFeatureSetting;
    v19 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v5;
    v6 = (void *)MEMORY[0x1E0C99D80];
    v7 = (void **)v20;
    v8 = &v19;
  }
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v7, v8, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontDescriptorByAddingAttributes:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C944D0], "fontWithDescriptor:size:", v12, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id _IdentifyingInfoForView(void *a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = a1;
  v3 = objc_opt_class();
  objc_msgSend(v2, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recursiveDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@ <%p> in window %@"), v3, v2, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void sub_1CB9C7208(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
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

void sub_1CB9C753C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1CB9C7AB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CB9C8B84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id location)
{
  id *v31;

  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CB9C8E50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__34(uint64_t a1, uint64_t a2)
{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__35(uint64_t a1)
{

}

void _LayoutConstants_2(void *a1@<X0>, uint64_t a2@<X8>)
{
  id WeakRetained;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  id obj;

  obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_3);
  WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_3);
  if (!WeakRetained)
    goto LABEL_5;
  v4 = WeakRetained;
  v5 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_3);
  if (v5 != obj)
  {

LABEL_5:
    v8 = objc_storeWeak(&_LayoutConstants___cachedDevice_3, obj);
    _LayoutConstants___previousCLKDeviceVersion_3 = objc_msgSend(obj, "version");

    ___LayoutConstants_block_invoke_3(v9, (uint64_t)obj);
    goto LABEL_6;
  }
  v6 = objc_msgSend(obj, "version");
  v7 = _LayoutConstants___previousCLKDeviceVersion_3;

  if (v6 != v7)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_3);
  v10 = *(_OWORD *)&qword_1EF9AF0B0;
  *(_OWORD *)(a2 + 64) = xmmword_1EF9AF0A0;
  *(_OWORD *)(a2 + 80) = v10;
  *(_OWORD *)(a2 + 96) = xmmword_1EF9AF0C0;
  *(_QWORD *)(a2 + 112) = qword_1EF9AF0D0;
  v11 = *(_OWORD *)&qword_1EF9AF070;
  *(_OWORD *)a2 = _LayoutConstants__constants_0;
  *(_OWORD *)(a2 + 16) = v11;
  v12 = *(_OWORD *)&qword_1EF9AF090;
  *(_OWORD *)(a2 + 32) = xmmword_1EF9AF080;
  *(_OWORD *)(a2 + 48) = v12;

}

void sub_1CB9CA1EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CB9CA264(_Unwind_Exception *a1)
{
  id *v1;

  _Unwind_Resume(a1);
}

void sub_1CB9CD358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CB9CE300(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

double _centerInBounds(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, double a7)
{
  double MidX;
  double v14;
  CGRect v16;

  MidX = CGRectGetMidX(*(CGRect *)&a1);
  v14 = MidX - a6 * __sincos_stret(a7).__sinval;
  v16.origin.x = a1;
  v16.origin.y = a2;
  v16.size.width = a3;
  v16.size.height = a4;
  CGRectGetMinY(v16);
  return v14;
}

double _angleForPositionInWidth(double a1, double a2, double a3, double a4)
{
  double v4;

  v4 = 0.0;
  if (a3 != 0.0)
    return (a1 + a2 * -0.5) / a3 + a4;
  return v4;
}

void sub_1CB9CEC14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CB9CFD64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1CB9CFEB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const __CFString *CLKUIMetalAtlasPrewarmStateDescription(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("none");
  if (a1 == 1)
    v1 = CFSTR("prewarming");
  if (a1 == 2)
    return CFSTR("prewarmed");
  else
    return v1;
}

uint64_t _CLKUICalculateNumCompressedTexMipmaps(unsigned int a1, unsigned int a2, unsigned int a3)
{
  uint64_t result;
  char v5;
  char v6;

  if (a3 < 0x20)
    goto LABEL_9;
  LODWORD(result) = 0;
  do
  {
    if (a1 == 1 && a2 == 1)
      return (result + 1);
    v5 = a1 > 1;
    a1 >>= a1 > 1;
    v6 = a2 > 1;
    a2 >>= a2 > 1;
    a3 = a3 >> v5 >> v6;
    result = (result + 1);
  }
  while (a3 >= 0x20);
  if (!(_DWORD)result)
LABEL_9:
    _CLKUICalculateNumCompressedTexMipmaps_cold_1();
  return result;
}

uint64_t _CLKUIMetalAtlasComputeCompressedPlaneLength(int a1, int a2, int a3)
{
  unsigned int v5;
  double ASTCBlockSize;

  if ((a1 - 5) > 1u)
  {
    if ((a1 - 11) > 0x37)
    {
      return 0;
    }
    else
    {
      ASTCBlockSize = CLKUITextureFormatGetASTCBlockSize(a1);
      return 16
           * (a2 + LODWORD(ASTCBlockSize) - 1)
           / LODWORD(ASTCBlockSize)
           * ((a3 + HIDWORD(ASTCBlockSize) - 1)
            / HIDWORD(ASTCBlockSize));
    }
  }
  else
  {
    v5 = 4 * a2 * a3 + 7;
    if (v5 >= 0x100)
      return v5 >> 3;
    else
      return 0;
  }
}

void sub_1CB9D1158(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double SlopedPoint.point.getter()
{
  return sub_1CB9D2194(&OBJC_IVAR___CLKUISlopedPoint_point);
}

uint64_t SlopedPoint.point.setter(double a1, double a2)
{
  return sub_1CB9D223C(&OBJC_IVAR___CLKUISlopedPoint_point, a1, a2);
}

uint64_t (*SlopedPoint.point.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

double sub_1CB9D2148(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;

  v3 = a1 + *a3;
  swift_beginAccess();
  return *(double *)v3;
}

double SlopedPoint.tangent.getter()
{
  return sub_1CB9D2194(&OBJC_IVAR___CLKUISlopedPoint_tangent);
}

double sub_1CB9D2194(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = v1 + *a1;
  swift_beginAccess();
  return *(double *)v2;
}

uint64_t sub_1CB9D21E0(uint64_t a1, double a2, double a3, uint64_t a4, _QWORD *a5)
{
  double *v7;
  uint64_t result;

  v7 = (double *)(a1 + *a5);
  result = swift_beginAccess();
  *v7 = a2;
  v7[1] = a3;
  return result;
}

uint64_t SlopedPoint.tangent.setter(double a1, double a2)
{
  return sub_1CB9D223C(&OBJC_IVAR___CLKUISlopedPoint_tangent, a1, a2);
}

uint64_t sub_1CB9D223C(_QWORD *a1, double a2, double a3)
{
  uint64_t v3;
  double *v6;
  uint64_t result;

  v6 = (double *)(v3 + *a1);
  result = swift_beginAccess();
  *v6 = a2;
  v6[1] = a3;
  return result;
}

uint64_t (*SlopedPoint.tangent.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id SlopedPoint.__allocating_init(point:tangent:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;
  char *v9;
  double *v10;
  double *v11;
  objc_super v13;

  v9 = (char *)objc_allocWithZone(v4);
  v10 = (double *)&v9[OBJC_IVAR___CLKUISlopedPoint_point];
  *v10 = a1;
  v10[1] = a2;
  v11 = (double *)&v9[OBJC_IVAR___CLKUISlopedPoint_tangent];
  *v11 = a3;
  v11[1] = a4;
  v13.receiver = v9;
  v13.super_class = v4;
  return objc_msgSendSuper2(&v13, sel_init);
}

id SlopedPoint.init(point:tangent:)(double a1, double a2, double a3, double a4)
{
  char *v4;
  objc_class *ObjectType;
  double *v10;
  double *v11;
  objc_super v13;

  ObjectType = (objc_class *)swift_getObjectType();
  v10 = (double *)&v4[OBJC_IVAR___CLKUISlopedPoint_point];
  *v10 = a1;
  v10[1] = a2;
  v11 = (double *)&v4[OBJC_IVAR___CLKUISlopedPoint_tangent];
  *v11 = a3;
  v11[1] = a4;
  v13.receiver = v4;
  v13.super_class = ObjectType;
  return objc_msgSendSuper2(&v13, sel_init);
}

id SlopedPoint.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void SlopedPoint.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_1CB9D24B0(double a1)
{
  uint64_t v1;
  __int128 v3;
  uint64_t inited;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_class *v11;
  char *v12;
  double *v13;
  double *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  char v28;

  sub_1CB9D5428(v1, (uint64_t)&v23);
  if (v28)
  {
    v20 = v24;
    v21 = v23;
    if (v28 == 1)
    {
      v3 = v25;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9AEB70);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_1CB9E2C80;
      *(_OWORD *)(inited + 32) = v21;
      *(_OWORD *)(inited + 48) = v20;
      *(_OWORD *)(inited + 64) = v3;
    }
    else
    {
      v19 = v25;
      v16 = v26;
      v17 = v27;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9AEB70);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_1CB9E2C70;
      *(_OWORD *)(inited + 32) = v21;
      *(_OWORD *)(inited + 48) = v20;
      *(_OWORD *)(inited + 64) = v19;
      *(_QWORD *)(inited + 80) = v16;
      *(_QWORD *)(inited + 88) = v17;
    }
    v15 = sub_1CB9D4A10(inited, a1);
    swift_setDeallocating();
  }
  else
  {
    v5 = *(double *)&v23;
    v6 = v5 + (*(double *)&v24 - v5) * a1;
    v7 = *((double *)&v23 + 1) + (*((double *)&v24 + 1) - *((double *)&v23 + 1)) * a1;
    v8 = sqrt((v5 - *(double *)&v24) * (v5 - *(double *)&v24)+ (*((double *)&v23 + 1) - *((double *)&v24 + 1)) * (*((double *)&v23 + 1) - *((double *)&v24 + 1)));
    v9 = (*(double *)&v24 - *(double *)&v23) / v8;
    v10 = (*((double *)&v24 + 1) - *((double *)&v23 + 1)) / v8;
    v11 = (objc_class *)type metadata accessor for SlopedPoint();
    v12 = (char *)objc_allocWithZone(v11);
    v13 = (double *)&v12[OBJC_IVAR___CLKUISlopedPoint_point];
    *v13 = v6;
    v13[1] = v7;
    v14 = (double *)&v12[OBJC_IVAR___CLKUISlopedPoint_tangent];
    *v14 = v9;
    v14[1] = v10;
    v22.receiver = v12;
    v22.super_class = v11;
    return objc_msgSendSuper2(&v22, sel_init);
  }
  return v15;
}

uint64_t sub_1CB9D2640(uint64_t result, double a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  unint64_t v10;

  v2 = *(_QWORD *)(result + 16);
  if (!v2)
  {
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  if (*(double *)(result + 40) <= a2)
  {
    v3 = result + 32;
    v4 = v2 - 1;
    if (*(double *)(result + 32 + 16 * (v2 - 1) + 8) > a2)
    {
      if (v2 >= 2)
      {
        v5 = 0;
        while (1)
        {
          v6 = v5 + v4;
          if (__OFADD__(v5, v4))
            break;
          if (v6 >= 0)
            v7 = v5 + v4;
          else
            v7 = v6 + 1;
          if (v6 < -1)
            goto LABEL_28;
          v8 = v7 >> 1;
          if (v7 >> 1 >= (uint64_t)v2)
            goto LABEL_28;
          if (*(double *)(v3 + 16 * v8 + 8) < a2)
            v5 = v8 + 1;
          else
            v4 = v7 >> 1;
          if ((uint64_t)v5 >= v4)
            goto LABEL_18;
        }
        __break(1u);
LABEL_28:
        __break(1u);
        goto LABEL_29;
      }
      v5 = 0;
LABEL_18:
      if (v5 >= v2)
        goto LABEL_30;
      v9 = *(double *)(v3 + 16 * v5 + 8);
      if (v9 <= a2)
      {
        if (v9 >= a2)
          return result;
        v10 = v5++;
        if (v10 < v2)
          goto LABEL_21;
      }
      else if (v5 - 1 < v2)
      {
LABEL_21:
        if (v5 >= v2)
        {
LABEL_31:
          __break(1u);
          return result;
        }
        return result;
      }
      __break(1u);
    }
  }
  return result;
}

void *CLKUIBezierPathStepper.path.getter()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR___CLKUIBezierPathStepper_path);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void CLKUIBezierPathStepper.path.setter(void *a1)
{
  uint64_t v1;
  id *v3;
  id v4;
  id v5;
  id v6;

  v3 = (id *)(v1 + OBJC_IVAR___CLKUIBezierPathStepper_path);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;
  v5 = a1;

  if (*v3)
  {
    v6 = *v3;
    CLKUIBezierPathStepper.updateSegments(path:)((UIBezierPath)v6);

    v5 = v6;
  }

}

id sub_1CB9D2900@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR___CLKUIBezierPathStepper_path);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

void sub_1CB9D2950(void **a1, _QWORD *a2)
{
  void *v2;
  id *v3;
  id v4;
  id v5;
  id v6;

  v2 = *a1;
  v3 = (id *)(*a2 + OBJC_IVAR___CLKUIBezierPathStepper_path);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

  if (*v3)
  {
    v6 = *v3;
    CLKUIBezierPathStepper.updateSegments(path:)((UIBezierPath)v6);

    v5 = v6;
  }

}

Swift::Void __swiftcall CLKUIBezierPathStepper.updateSegments(path:)(UIBezierPath path)
{
  char *v1;
  uint64_t v2;
  const CGPath *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD aBlock[6];
  uint64_t v12;
  _QWORD v13[2];
  _QWORD v14[2];

  v14[0] = 0;
  v14[1] = 0;
  v13[0] = 0;
  v13[1] = 0;
  v2 = MEMORY[0x1E0DEE9D8];
  v12 = MEMORY[0x1E0DEE9D8];
  v3 = (const CGPath *)-[objc_class CGPath](path.super.isa, sel_CGPath);
  v4 = (_QWORD *)swift_allocObject();
  v4[2] = v14;
  v4[3] = v13;
  v4[4] = &v12;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = sub_1CB9D306C;
  *(_QWORD *)(v5 + 24) = v4;
  aBlock[4] = sub_1CB9D3088;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1CB9D30A8;
  aBlock[3] = &block_descriptor;
  v6 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  CGPathApplyWithBlock(v3, v6);

  _Block_release(v6);
  LOBYTE(v3) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((v3 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)&v1[OBJC_IVAR___CLKUIBezierPathStepper_segments] = v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v7 = OBJC_IVAR___CLKUIBezierPathStepper_segmentLengthTables;
    *(_QWORD *)&v1[OBJC_IVAR___CLKUIBezierPathStepper_segmentLengthTables] = v2;
    swift_bridgeObjectRelease();
    v8 = v1;
    v9 = swift_bridgeObjectRetain();
    v10 = sub_1CB9D52F0(v9);
    swift_bridgeObjectRelease();

    *(_QWORD *)&v1[v7] = v10;
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
  }
}

void (*CLKUIBezierPathStepper.path.modify(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___CLKUIBezierPathStepper_path;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_1CB9D2C0C;
}

void sub_1CB9D2C0C(_QWORD **a1, char a2)
{
  _QWORD *v3;
  void *v4;
  id v5;

  v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    v4 = *(void **)(v3[3] + v3[4]);
    if (v4)
    {
      v5 = v4;
      CLKUIBezierPathStepper.updateSegments(path:)((UIBezierPath)v5);

    }
  }
  free(v3);
}

id CLKUIBezierPathStepper.init()()
{
  char *v0;
  objc_class *ObjectType;
  void **v2;
  uint64_t v3;
  void *v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v2 = (void **)&v0[OBJC_IVAR___CLKUIBezierPathStepper_path];
  *(_QWORD *)&v0[OBJC_IVAR___CLKUIBezierPathStepper_path] = 0;
  v3 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)&v0[OBJC_IVAR___CLKUIBezierPathStepper_segments] = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)&v0[OBJC_IVAR___CLKUIBezierPathStepper_segmentLengthTables] = v3;
  swift_beginAccess();
  v4 = *v2;
  *v2 = 0;

  v6.receiver = v0;
  v6.super_class = ObjectType;
  return objc_msgSendSuper2(&v6, sel_init);
}

uint64_t sub_1CB9D2D90(uint64_t result, uint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t *v5;
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
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  char *v39;
  unint64_t v40;
  unint64_t v41;

  v5 = *(uint64_t **)(result + 8);
  switch(*(_DWORD *)result)
  {
    case 0:
      v6 = *v5;
      v7 = v5[1];
      *a2 = *v5;
      a2[1] = v7;
      *a3 = v6;
      a3[1] = v7;
      return result;
    case 1:
      v10 = *v5;
      v11 = v5[1];
      v8 = *a2;
      v9 = a2[1];
      goto LABEL_16;
    case 2:
      v12 = *a2;
      v13 = a2[1];
      v14 = *v5;
      v15 = v5[1];
      v16 = v5[2];
      v17 = v5[3];
      *a2 = v16;
      a2[1] = v17;
      v18 = *a4;
      result = swift_isUniquelyReferenced_nonNull_native();
      *a4 = v18;
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_1CB9D38DC(0, *(_QWORD *)(v18 + 16) + 1, 1, (char *)v18);
        v18 = result;
        *a4 = result;
      }
      v20 = *(_QWORD *)(v18 + 16);
      v19 = *(_QWORD *)(v18 + 24);
      v21 = v20 + 1;
      if (v20 >= v19 >> 1)
      {
        result = (uint64_t)sub_1CB9D38DC((char *)(v19 > 1), v20 + 1, 1, (char *)v18);
        v21 = v20 + 1;
        v18 = result;
      }
      *(_QWORD *)(v18 + 16) = v21;
      v22 = v18 + 72 * v20;
      *(_QWORD *)(v22 + 32) = v12;
      *(_QWORD *)(v22 + 40) = v13;
      *(_QWORD *)(v22 + 48) = v14;
      *(_QWORD *)(v22 + 56) = v15;
      *(_QWORD *)(v22 + 64) = v16;
      *(_QWORD *)(v22 + 72) = v17;
      *(_QWORD *)(v22 + 80) = 0;
      *(_QWORD *)(v22 + 88) = 0;
      v23 = 1;
      goto LABEL_14;
    case 3:
      v24 = *a2;
      v25 = a2[1];
      v26 = *v5;
      v27 = v5[1];
      v28 = v5[2];
      v29 = v5[3];
      v30 = v5[4];
      v31 = v5[5];
      *a2 = v30;
      a2[1] = v31;
      v18 = *a4;
      result = swift_isUniquelyReferenced_nonNull_native();
      *a4 = v18;
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_1CB9D38DC(0, *(_QWORD *)(v18 + 16) + 1, 1, (char *)v18);
        v18 = result;
        *a4 = result;
      }
      v32 = *(_QWORD *)(v18 + 16);
      v33 = *(_QWORD *)(v18 + 24);
      v34 = v32 + 1;
      if (v32 >= v33 >> 1)
      {
        v41 = v32 + 1;
        v39 = (char *)v18;
        v40 = *(_QWORD *)(v18 + 16);
        result = (uint64_t)sub_1CB9D38DC((char *)(v33 > 1), v32 + 1, 1, v39);
        v32 = v40;
        v34 = v41;
        v18 = result;
      }
      *(_QWORD *)(v18 + 16) = v34;
      v22 = v18 + 72 * v32;
      *(_QWORD *)(v22 + 32) = v24;
      *(_QWORD *)(v22 + 40) = v25;
      *(_QWORD *)(v22 + 48) = v26;
      *(_QWORD *)(v22 + 56) = v27;
      *(_QWORD *)(v22 + 64) = v28;
      *(_QWORD *)(v22 + 72) = v29;
      *(_QWORD *)(v22 + 80) = v30;
      *(_QWORD *)(v22 + 88) = v31;
      v23 = 2;
LABEL_14:
      *(_BYTE *)(v22 + 96) = v23;
      goto LABEL_21;
    case 4:
      v8 = *a2;
      v9 = a2[1];
      v10 = *a3;
      v11 = a3[1];
LABEL_16:
      *a2 = v10;
      a2[1] = v11;
      v18 = *a4;
      result = swift_isUniquelyReferenced_nonNull_native();
      *a4 = v18;
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_1CB9D38DC(0, *(_QWORD *)(v18 + 16) + 1, 1, (char *)v18);
        v18 = result;
        *a4 = result;
      }
      v36 = *(_QWORD *)(v18 + 16);
      v35 = *(_QWORD *)(v18 + 24);
      v37 = v36 + 1;
      if (v36 >= v35 >> 1)
      {
        result = (uint64_t)sub_1CB9D38DC((char *)(v35 > 1), v36 + 1, 1, (char *)v18);
        v37 = v36 + 1;
        v18 = result;
      }
      *(_QWORD *)(v18 + 16) = v37;
      v38 = v18 + 72 * v36;
      *(_QWORD *)(v38 + 32) = v8;
      *(_QWORD *)(v38 + 40) = v9;
      *(_QWORD *)(v38 + 48) = v10;
      *(_QWORD *)(v38 + 56) = v11;
      *(_OWORD *)(v38 + 64) = 0u;
      *(_OWORD *)(v38 + 80) = 0u;
      *(_BYTE *)(v38 + 96) = 0;
LABEL_21:
      *a4 = v18;
      break;
    default:
      result = sub_1CB9D6BC0();
      __break(1u);
      break;
  }
  return result;
}

uint64_t sub_1CB9D305C()
{
  return swift_deallocObject();
}

uint64_t sub_1CB9D306C(uint64_t a1)
{
  uint64_t **v1;

  return sub_1CB9D2D90(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_1CB9D3078()
{
  return swift_deallocObject();
}

uint64_t sub_1CB9D3088()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1CB9D30A8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a1 + 32))(a2);
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

uint64_t sub_1CB9D3138(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v10 = MEMORY[0x1E0DEE9D8];
  sub_1CB9D3B60(0, 0, 0);
  v2 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v2)
  {
    v3 = 0;
    v4 = *(_QWORD *)(v10 + 16);
    v5 = 16 * v4;
    do
    {
      v6 = *(_QWORD *)(a1 + 32 + 8 * v3);
      v7 = *(_QWORD *)(v10 + 24);
      if (v4 + v3 >= v7 >> 1)
        sub_1CB9D3B60((char *)(v7 > 1), v4 + v3 + 1, 1);
      *(_QWORD *)(v10 + 16) = v4 + v3 + 1;
      v8 = v10 + v5;
      *(_QWORD *)(v8 + 32) = v3;
      *(_QWORD *)(v8 + 40) = v6;
      v5 += 16;
      ++v3;
    }
    while (v2 != v3);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1CB9D3240(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  __int128 v8;
  uint64_t v9;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x1E0DEE9D8];
  if (v1)
  {
    v9 = MEMORY[0x1E0DEE9D8];
    sub_1CB9D3AFC(0, v1, 0);
    v4 = a1 + 32;
    v2 = v9;
    do
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9AEB98);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9AEBA0);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1CB9D3AFC(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v9;
      }
      v6 = *(_QWORD *)(v2 + 16);
      v5 = *(_QWORD *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_1CB9D3AFC((char *)(v5 > 1), v6 + 1, 1);
        v2 = v9;
      }
      *(_QWORD *)(v2 + 16) = v6 + 1;
      *(_OWORD *)(v2 + 16 * v6 + 32) = v8;
      v4 += 16;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t CLKUIBezierPathStepper.mapOffsetsToPathPositions(_:)()
{
  uint64_t v0;
  char *v1;
  char *v2;
  objc_class *v3;
  char *v4;
  char *v5;
  char *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  double v18;
  uint64_t v19;
  unint64_t v20;
  double *v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  id v26;
  unint64_t v27;
  id v28;
  void *v29;
  uint64_t result;
  uint64_t v31;
  objc_super v32;
  void *v33;
  char *v34[9];

  v0 = swift_bridgeObjectRetain();
  v1 = (char *)sub_1CB9D3138(v0);
  swift_bridgeObjectRelease();
  v34[0] = v1;
  swift_bridgeObjectRetain();
  sub_1CB9D3F60(v34);
  swift_bridgeObjectRelease();
  v2 = v34[0];
  v3 = (objc_class *)type metadata accessor for SlopedPoint();
  v4 = (char *)objc_allocWithZone(v3);
  v5 = &v4[OBJC_IVAR___CLKUISlopedPoint_point];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  v6 = &v4[OBJC_IVAR___CLKUISlopedPoint_tangent];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  v32.receiver = v4;
  v32.super_class = v3;
  v7 = objc_msgSendSuper2(&v32, sel_init);
  v33 = sub_1CB9D35CC(v7, *((_QWORD *)v2 + 2));
  v8 = *((_QWORD *)v2 + 2);
  if (v8)
  {
    v9 = 0;
    v10 = 0;
    v11 = OBJC_IVAR___CLKUIBezierPathStepper_segments;
    v12 = OBJC_IVAR___CLKUIBezierPathStepper_segmentLengthTables;
    v13 = 0.0;
    while (v10 < *((_QWORD *)v2 + 2))
    {
      v14 = *(_QWORD *)(v31 + v11);
      v15 = *(_QWORD *)(v14 + 16);
      if ((uint64_t)v9 >= v15)
        goto LABEL_20;
      v16 = (uint64_t)&v2[16 * v10 + 32];
      v17 = *(_QWORD *)v16;
      v18 = *(double *)(v16 + 8);
      ++v10;
      v19 = *(_QWORD *)(v31 + v12);
      v20 = *(_QWORD *)(v19 + 16);
      if (v9 > v20)
        v20 = v9;
      v21 = (double *)(v19 + 16 * v9 + 40);
      v22 = v14 + 72 * v9 + 32;
      while (1)
      {
        if (v20 == v9)
        {
          __break(1u);
          goto LABEL_22;
        }
        v23 = v13 + *v21;
        if (v23 >= v18)
          break;
        ++v9;
        v21 += 2;
        v22 += 72;
        v13 = v23;
        if (v15 == v9)
          goto LABEL_20;
      }
      sub_1CB9D2640(*((_QWORD *)v21 - 1), v18 - v13);
      if (v9 >= *(_QWORD *)(v14 + 16))
        goto LABEL_23;
      v25 = v24;
      sub_1CB9D5428(v22, (uint64_t)v34);
      v26 = sub_1CB9D24B0(v25);
      v27 = (unint64_t)v33;
      v28 = v26;
      if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
        || (v27 & 0x8000000000000000) != 0
        || (v27 & 0x4000000000000000) != 0)
      {
        sub_1CB9D3FC8(v27);
      }
      if ((v17 & 0x8000000000000000) != 0)
        goto LABEL_24;
      if (v17 >= *(_QWORD *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_25;
      v29 = *(void **)((v27 & 0xFFFFFFFFFFFFFF8) + 8 * v17 + 0x20);
      *(_QWORD *)((v27 & 0xFFFFFFFFFFFFFF8) + 8 * v17 + 0x20) = v28;

      sub_1CB9D6B48();
      if (v10 == v8)
        goto LABEL_20;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    result = swift_release();
    __break(1u);
  }
  else
  {
LABEL_20:
    swift_release();
    return (uint64_t)v33;
  }
  return result;
}

void *sub_1CB9D35CC(void *result, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  id v9;
  uint64_t v10;

  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    v3 = result;
    if (a2)
    {
      type metadata accessor for SlopedPoint();
      v4 = sub_1CB9D6B54();
      v5 = v4 & 0xFFFFFFFFFFFFFF8;
      *(_QWORD *)(v5 + 16) = a2;
      v10 = v4;
      *(_QWORD *)(v5 + 32) = v3;
      if (a2 != 1)
      {
        *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x28) = v3;
        v6 = a2 - 2;
        if (v6)
        {
          v7 = (_QWORD *)(v5 + 48);
          do
          {
            *v7++ = v3;
            v8 = v3;
            --v6;
          }
          while (v6);
        }
        v9 = v3;
      }
    }
    else
    {
      v10 = MEMORY[0x1E0DEE9D8];

    }
    sub_1CB9D6B48();
    return (void *)v10;
  }
  return result;
}

void CLKUIBezierPathStepper.totalLength()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  double *v5;
  double v6;
  double v7;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + OBJC_IVAR___CLKUIBezierPathStepper_segments) + 16);
  if (v1)
  {
    v2 = *(_QWORD *)(v0 + OBJC_IVAR___CLKUIBezierPathStepper_segmentLengthTables);
    v3 = *(_QWORD *)(v2 + 16);
    v4 = v1 - 1;
    v5 = (double *)(v2 + 40);
    v6 = 0.0;
    while (v3 > v4)
    {
      v7 = *v5;
      v5 += 2;
      v6 = v6 + v7;
      if (!--v1)
        return;
    }
    __break(1u);
  }
}

id _s10ClockKitUI11SlopedPointCfD_0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

char *sub_1CB9D37E4(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9AEB70);
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
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1CB9D38DC(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  size_t v14;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9AEBC0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 72);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  v14 = 72 * v8;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v14])
      memmove(v12, v13, v14);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v14);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1CB9D39E8(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9AEB90);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1CB9D3AE0(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_1CB9D3B7C(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_1CB9D3AFC(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_1CB9D3C7C(a1, a2, a3, *v3, &qword_1EF9AEBA8);
  *v3 = result;
  return result;
}

char *sub_1CB9D3B20(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_1CB9D3C7C(a1, a2, a3, *v3, &qword_1EF9AEBB0);
  *v3 = result;
  return result;
}

char *sub_1CB9D3B44(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_1CB9D3D70(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_1CB9D3B60(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_1CB9D3E68(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_1CB9D3B7C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9AEBB8);
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

char *sub_1CB9D3C7C(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;

  v6 = (char)result;
  if ((a3 & 1) != 0)
  {
    v7 = *((_QWORD *)a4 + 3);
    v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
      v13 = v12 - 17;
    *((_QWORD *)v11 + 2) = v9;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
  }
  else
  {
    v11 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((v6 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v9])
      memmove(v14, v15, 16 * v9);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 16 * v9);
  }
  swift_release();
  return v11;
}

char *sub_1CB9D3D70(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9AEB90);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_release();
  return v10;
}

char *sub_1CB9D3E68(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9AEB88);
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
    memcpy(v13, v14, 16 * v8);
  }
  swift_release();
  return v10;
}

uint64_t sub_1CB9D3F60(char **a1)
{
  char *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1CB9D49FC((uint64_t)v2);
  v3 = *((_QWORD *)v2 + 2);
  v5[0] = (uint64_t)(v2 + 32);
  v5[1] = v3;
  result = sub_1CB9D4030(v5);
  *a1 = v2;
  return result;
}

void sub_1CB9D3FC8(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_1CB9D6BCC();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x1D17A1118);
}

uint64_t sub_1CB9D4030(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double *v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double *v27;
  double v28;
  uint64_t v29;
  double *v30;
  double v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  BOOL v47;
  unint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  BOOL v57;
  uint64_t v58;
  char v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  BOOL v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  _QWORD *v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t i;
  double v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  _QWORD *v96;
  unint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  double *v104;

  v3 = a1[1];
  result = sub_1CB9D6BE4();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_138;
    if ((unint64_t)v3 >= 2)
    {
      v82 = *a1;
      v83 = *a1 + 8;
      v84 = -1;
      for (i = 1; i != v3; ++i)
      {
        v86 = *(double *)(v82 + 16 * i + 8);
        v87 = v84;
        v88 = v83;
        do
        {
          if (v86 >= *(double *)v88)
            break;
          if (!v82)
            goto LABEL_142;
          v89 = *(_QWORD *)(v88 + 8);
          *(_OWORD *)(v88 + 8) = *(_OWORD *)(v88 - 8);
          *(_QWORD *)(v88 - 8) = v89;
          *(double *)v88 = v86;
          v88 -= 16;
        }
        while (!__CFADD__(v87++, 1));
        v83 += 16;
        --v84;
      }
    }
  }
  else
  {
    if (v3 >= 0)
      v5 = v3;
    else
      v5 = v3 + 1;
    if (v3 < -1)
      goto LABEL_137;
    v6 = result;
    v98 = a1;
    if (v3 > 1)
    {
      v7 = v5 >> 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9AEB78);
      result = sub_1CB9D6B54();
      *(_QWORD *)(result + 16) = v7;
      v100 = result;
      v104 = (double *)(result + 32);
LABEL_13:
      v9 = 0;
      v10 = *a1;
      v99 = *a1 + 40;
      v11 = MEMORY[0x1E0DEE9D8];
      v101 = v6;
      v102 = v3;
      v103 = v10;
      while (1)
      {
        v13 = v9++;
        if (v9 < v3)
        {
          v14 = *(double *)(v10 + 16 * v9 + 8);
          v15 = *(double *)(v10 + 16 * v13 + 8);
          v9 = v13 + 2;
          if (v13 + 2 < v3)
          {
            v16 = (double *)(v99 + 16 * v13);
            v17 = v14;
            while (1)
            {
              v18 = v17;
              v17 = *v16;
              if (v14 < v15 == *v16 >= v18)
                break;
              ++v9;
              v16 += 2;
              if (v3 == v9)
              {
                v9 = v3;
                break;
              }
            }
          }
          if (v14 < v15)
          {
            if (v9 < v13)
              goto LABEL_139;
            if (v13 < v9)
            {
              v19 = 16 * v9;
              v20 = 16 * v13;
              v21 = v9;
              v22 = v13;
              do
              {
                if (v22 != --v21)
                {
                  if (!v10)
                    goto LABEL_145;
                  v23 = v10 + v19;
                  v24 = *(_QWORD *)(v10 + v20);
                  v25 = *(_QWORD *)(v10 + v20 + 8);
                  *(_OWORD *)(v10 + v20) = *(_OWORD *)(v10 + v19 - 16);
                  *(_QWORD *)(v23 - 16) = v24;
                  *(_QWORD *)(v23 - 8) = v25;
                }
                ++v22;
                v19 -= 16;
                v20 += 16;
              }
              while (v22 < v21);
            }
          }
        }
        if (v9 < v3)
        {
          if (__OFSUB__(v9, v13))
            goto LABEL_136;
          if (v9 - v13 < v6)
          {
            v26 = v13 + v6;
            if (__OFADD__(v13, v6))
              goto LABEL_140;
            if (v26 >= v3)
              v26 = v3;
            if (v26 < v13)
            {
LABEL_141:
              __break(1u);
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
              return result;
            }
            if (v9 != v26)
            {
              v27 = (double *)(v10 + 16 * v9);
              do
              {
                v28 = *(double *)(v10 + 16 * v9 + 8);
                v29 = v13;
                v30 = v27;
                do
                {
                  if (v28 >= *(v30 - 1))
                    break;
                  if (!v10)
                    goto LABEL_143;
                  v31 = *v30;
                  *(_OWORD *)v30 = *((_OWORD *)v30 - 1);
                  *(v30 - 1) = v28;
                  *(v30 - 2) = v31;
                  v30 -= 2;
                  ++v29;
                }
                while (v9 != v29);
                ++v9;
                v27 += 2;
              }
              while (v9 != v26);
              v9 = v26;
            }
          }
        }
        if (v9 < v13)
          goto LABEL_131;
        result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          result = (uint64_t)sub_1CB9D48F0(0, *(_QWORD *)(v11 + 16) + 1, 1, (char *)v11);
          v11 = result;
        }
        v33 = *(_QWORD *)(v11 + 16);
        v32 = *(_QWORD *)(v11 + 24);
        v12 = v33 + 1;
        v10 = v103;
        if (v33 >= v32 >> 1)
        {
          result = (uint64_t)sub_1CB9D48F0((char *)(v32 > 1), v33 + 1, 1, (char *)v11);
          v10 = v103;
          v11 = result;
        }
        *(_QWORD *)(v11 + 16) = v12;
        v34 = v11 + 32;
        v35 = (uint64_t *)(v11 + 32 + 16 * v33);
        *v35 = v13;
        v35[1] = v9;
        if (v33)
        {
          while (1)
          {
            v36 = v12 - 1;
            if (v12 >= 4)
            {
              v41 = v34 + 16 * v12;
              v42 = *(_QWORD *)(v41 - 64);
              v43 = *(_QWORD *)(v41 - 56);
              v47 = __OFSUB__(v43, v42);
              v44 = v43 - v42;
              if (v47)
                goto LABEL_120;
              v46 = *(_QWORD *)(v41 - 48);
              v45 = *(_QWORD *)(v41 - 40);
              v47 = __OFSUB__(v45, v46);
              v39 = v45 - v46;
              v40 = v47;
              if (v47)
                goto LABEL_121;
              v48 = v12 - 2;
              v49 = (uint64_t *)(v34 + 16 * (v12 - 2));
              v51 = *v49;
              v50 = v49[1];
              v47 = __OFSUB__(v50, v51);
              v52 = v50 - v51;
              if (v47)
                goto LABEL_122;
              v47 = __OFADD__(v39, v52);
              v53 = v39 + v52;
              if (v47)
                goto LABEL_124;
              if (v53 >= v44)
              {
                v71 = (uint64_t *)(v34 + 16 * v36);
                v73 = *v71;
                v72 = v71[1];
                v47 = __OFSUB__(v72, v73);
                v74 = v72 - v73;
                if (v47)
                  goto LABEL_130;
                v64 = v39 < v74;
                goto LABEL_83;
              }
            }
            else
            {
              if (v12 != 3)
              {
                v65 = *(_QWORD *)(v11 + 32);
                v66 = *(_QWORD *)(v11 + 40);
                v47 = __OFSUB__(v66, v65);
                v58 = v66 - v65;
                v59 = v47;
                goto LABEL_77;
              }
              v38 = *(_QWORD *)(v11 + 32);
              v37 = *(_QWORD *)(v11 + 40);
              v47 = __OFSUB__(v37, v38);
              v39 = v37 - v38;
              v40 = v47;
            }
            if ((v40 & 1) != 0)
              goto LABEL_123;
            v48 = v12 - 2;
            v54 = (uint64_t *)(v34 + 16 * (v12 - 2));
            v56 = *v54;
            v55 = v54[1];
            v57 = __OFSUB__(v55, v56);
            v58 = v55 - v56;
            v59 = v57;
            if (v57)
              goto LABEL_125;
            v60 = (uint64_t *)(v34 + 16 * v36);
            v62 = *v60;
            v61 = v60[1];
            v47 = __OFSUB__(v61, v62);
            v63 = v61 - v62;
            if (v47)
              goto LABEL_127;
            if (__OFADD__(v58, v63))
              goto LABEL_129;
            if (v58 + v63 >= v39)
            {
              v64 = v39 < v63;
LABEL_83:
              if (v64)
                v36 = v48;
              goto LABEL_85;
            }
LABEL_77:
            if ((v59 & 1) != 0)
              goto LABEL_126;
            v67 = (uint64_t *)(v34 + 16 * v36);
            v69 = *v67;
            v68 = v67[1];
            v47 = __OFSUB__(v68, v69);
            v70 = v68 - v69;
            if (v47)
              goto LABEL_128;
            if (v70 < v58)
              goto LABEL_15;
LABEL_85:
            v75 = v36 - 1;
            if (v36 - 1 >= v12)
            {
              __break(1u);
LABEL_117:
              __break(1u);
LABEL_118:
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
              goto LABEL_141;
            }
            if (!v10)
              goto LABEL_144;
            v76 = v11;
            v77 = (uint64_t *)(v34 + 16 * v75);
            v78 = *v77;
            v79 = (_QWORD *)(v34 + 16 * v36);
            v80 = v79[1];
            result = sub_1CB9D46CC((double *)(v10 + 16 * *v77), (double *)(v10 + 16 * *v79), v10 + 16 * v80, v104);
            if (v1)
              goto LABEL_93;
            if (v80 < v78)
              goto LABEL_117;
            if (v36 > *(_QWORD *)(v76 + 16))
              goto LABEL_118;
            *v77 = v78;
            *(_QWORD *)(v34 + 16 * v75 + 8) = v80;
            v81 = *(_QWORD *)(v76 + 16);
            if (v36 >= v81)
              goto LABEL_119;
            v11 = v76;
            v12 = v81 - 1;
            result = (uint64_t)memmove((void *)(v34 + 16 * v36), v79 + 2, 16 * (v81 - 1 - v36));
            *(_QWORD *)(v76 + 16) = v81 - 1;
            v10 = v103;
            if (v81 <= 2)
              goto LABEL_15;
          }
        }
        v12 = 1;
LABEL_15:
        v6 = v101;
        v3 = v102;
        if (v9 >= v102)
        {
          v8 = v100;
          goto LABEL_103;
        }
      }
    }
    v8 = MEMORY[0x1E0DEE9D8];
    v104 = (double *)(MEMORY[0x1E0DEE9D8] + 32);
    if (v3 == 1)
    {
      v100 = MEMORY[0x1E0DEE9D8];
      goto LABEL_13;
    }
    v12 = *(_QWORD *)(MEMORY[0x1E0DEE9D8] + 16);
    v11 = MEMORY[0x1E0DEE9D8];
LABEL_103:
    result = v11;
    v100 = v8;
    if (v12 >= 2)
    {
      v91 = *v98;
      do
      {
        v92 = v12 - 2;
        if (v12 < 2)
          goto LABEL_132;
        if (!v91)
          goto LABEL_146;
        v93 = result;
        v94 = *(_QWORD *)(result + 32 + 16 * v92);
        v95 = *(_QWORD *)(result + 32 + 16 * (v12 - 1) + 8);
        result = sub_1CB9D46CC((double *)(v91 + 16 * v94), (double *)(v91 + 16 * *(_QWORD *)(result + 32 + 16 * (v12 - 1))), v91 + 16 * v95, v104);
        if (v1)
          break;
        if (v95 < v94)
          goto LABEL_133;
        result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          result = (uint64_t)sub_1CB9D49E8(v93);
          v93 = result;
        }
        if (v92 >= *(_QWORD *)(v93 + 16))
          goto LABEL_134;
        v96 = (_QWORD *)(v93 + 32 + 16 * v92);
        *v96 = v94;
        v96[1] = v95;
        v97 = *(_QWORD *)(v93 + 16);
        if (v12 > v97)
          goto LABEL_135;
        memmove((void *)(v93 + 32 + 16 * (v12 - 1)), (const void *)(v93 + 32 + 16 * v12), 16 * (v97 - v12));
        result = v93;
        *(_QWORD *)(v93 + 16) = v97 - 1;
        v12 = v97 - 1;
      }
      while (v97 > 2);
    }
LABEL_93:
    swift_bridgeObjectRelease();
    *(_QWORD *)(v100 + 16) = 0;
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1CB9D46CC(double *__dst, double *__src, unint64_t a3, double *a4)
{
  double *v4;
  double *v6;
  double *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double *v14;
  double *v15;
  double *v16;
  double *v17;
  double *v18;
  double *v19;
  double *v20;
  BOOL v21;
  int64_t v22;

  v4 = a4;
  v6 = __src;
  v7 = __dst;
  v8 = (char *)__src - (char *)__dst;
  v9 = (char *)__src - (char *)__dst + 15;
  if ((char *)__src - (char *)__dst >= 0)
    v9 = (char *)__src - (char *)__dst;
  v10 = v9 >> 4;
  v11 = a3 - (_QWORD)__src;
  v12 = a3 - (_QWORD)__src + 15;
  if ((uint64_t)(a3 - (_QWORD)__src) >= 0)
    v12 = a3 - (_QWORD)__src;
  v13 = v12 >> 4;
  if (v10 >= v12 >> 4)
  {
    if (a4 != __src || &__src[2 * v13] <= a4)
      memmove(a4, __src, 16 * v13);
    v14 = &v4[2 * v13];
    if (v7 >= v6 || v11 < 16)
      goto LABEL_43;
    v18 = (double *)(a3 - 16);
    while (1)
    {
      v19 = v18 + 2;
      if (*(v14 - 1) >= *(v6 - 1))
      {
        v20 = v14 - 2;
        if (v19 != v14)
        {
          v14 -= 2;
          goto LABEL_40;
        }
        v21 = v18 >= v14;
        v14 -= 2;
        if (v21)
          goto LABEL_40;
      }
      else
      {
        v20 = v6 - 2;
        if (v19 != v6)
        {
          v6 -= 2;
LABEL_40:
          *(_OWORD *)v18 = *(_OWORD *)v20;
          goto LABEL_41;
        }
        v21 = v18 >= v6;
        v6 -= 2;
        if (v21)
          goto LABEL_40;
      }
LABEL_41:
      if (v6 > v7)
      {
        v18 -= 2;
        if (v14 > v4)
          continue;
      }
      goto LABEL_43;
    }
  }
  if (a4 != __dst || &__dst[2 * v10] <= a4)
    memmove(a4, __dst, 16 * v10);
  v14 = &v4[2 * v10];
  if ((unint64_t)v6 < a3 && v8 >= 16)
  {
    while (1)
    {
      if (v6[1] >= v4[1])
      {
        v17 = v4 + 2;
        v16 = v4;
        v15 = v6;
        if (v7 == v4)
        {
          v4 += 2;
          if (v7 < v17)
            goto LABEL_20;
        }
        else
        {
          v4 += 2;
        }
      }
      else
      {
        v15 = v6 + 2;
        v16 = v6;
        if (v7 == v6 && v7 < v15)
          goto LABEL_20;
      }
      *(_OWORD *)v7 = *(_OWORD *)v16;
LABEL_20:
      v7 += 2;
      if (v4 < v14)
      {
        v6 = v15;
        if ((unint64_t)v15 < a3)
          continue;
      }
      break;
    }
  }
  v6 = v7;
LABEL_43:
  v22 = (char *)v14 - (char *)v4 + ((char *)v14 - (char *)v4 < 0 ? 0xFuLL : 0);
  if (v6 != v4 || v6 >= (double *)((char *)v4 + (v22 & 0xFFFFFFFFFFFFFFF0)))
    memmove(v6, v4, 16 * (v22 >> 4));
  return 1;
}

char *sub_1CB9D48F0(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9AEB80);
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
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1CB9D49E8(uint64_t a1)
{
  return sub_1CB9D48F0(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

char *sub_1CB9D49FC(uint64_t a1)
{
  return sub_1CB9D3E68(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

id sub_1CB9D4A10(uint64_t a1, double a2)
{
  char *v2;
  unint64_t v3;
  id result;
  char *v5;
  float64x2_t *v6;
  unint64_t v7;
  unint64_t v8;
  double v9;
  float64x2_t v10;
  float64x2_t v11;
  unint64_t v12;
  char *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  objc_class *v24;
  char *v25;
  double *v26;
  double *v27;
  float64x2_t v28;
  float64x2_t v29;
  objc_super v31;

  v2 = (char *)a1;
  v3 = *(_QWORD *)(a1 + 16);
  result = (id)swift_bridgeObjectRetain();
  if (v3 >= 3)
  {
    v5 = (char *)MEMORY[0x1E0DEE9D8];
    do
    {
      v6 = (float64x2_t *)(v2 + 48);
      v2 = sub_1CB9D37E4(0, 1, 1, v5);
      v7 = *((_QWORD *)v2 + 2);
      v8 = v3 - 1;
      v9 = a2;
      do
      {
        v11 = v6[-1];
        v10 = *v6;
        v12 = *((_QWORD *)v2 + 3);
        if (v7 >= v12 >> 1)
        {
          v28 = *v6;
          v29 = v6[-1];
          v13 = sub_1CB9D37E4((char *)(v12 > 1), v7 + 1, 1, v2);
          v10 = v28;
          v11 = v29;
          v9 = a2;
          v2 = v13;
        }
        *((_QWORD *)v2 + 2) = v7 + 1;
        *(float64x2_t *)&v2[16 * v7 + 32] = vaddq_f64(v11, vmulq_n_f64(vsubq_f64(v10, v11), v9));
        ++v6;
        ++v7;
        --v8;
      }
      while (v8);
      result = (id)swift_bridgeObjectRelease();
      v3 = *((_QWORD *)v2 + 2);
    }
    while (v3 > 2);
  }
  if (v3)
  {
    if (v3 != 1)
    {
      v15 = *((double *)v2 + 4);
      v14 = *((double *)v2 + 5);
      v16 = *((double *)v2 + 6);
      v17 = *((double *)v2 + 7);
      swift_bridgeObjectRelease();
      v18 = v17 - v14;
      v19 = v15 + (v16 - v15) * a2;
      v20 = v14 + (v17 - v14) * a2;
      v21 = sqrt((v15 - v16) * (v15 - v16) + (v14 - v17) * (v14 - v17));
      v22 = (v16 - v15) / v21;
      v23 = v18 / v21;
      v24 = (objc_class *)type metadata accessor for SlopedPoint();
      v25 = (char *)objc_allocWithZone(v24);
      v26 = (double *)&v25[OBJC_IVAR___CLKUISlopedPoint_point];
      *v26 = v19;
      v26[1] = v20;
      v27 = (double *)&v25[OBJC_IVAR___CLKUISlopedPoint_tangent];
      *v27 = v22;
      v27[1] = v23;
      v31.receiver = v25;
      v31.super_class = v24;
      return objc_msgSendSuper2(&v31, sel_init);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1CB9D4BD0(uint64_t a1, double (*a2)(uint64_t, double))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v14 = MEMORY[0x1E0DEE9D8];
  sub_1CB9D3B20(0, 0, 0);
  v4 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v4)
  {
    v5 = 0;
    v6 = a1 + 32;
    do
    {
      v7 = a2(v5, *(double *)(v6 + 8 * v5));
      v9 = v8;
      v11 = *(_QWORD *)(v14 + 16);
      v10 = *(_QWORD *)(v14 + 24);
      if (v11 >= v10 >> 1)
        sub_1CB9D3B20((char *)(v10 > 1), v11 + 1, 1);
      ++v5;
      *(_QWORD *)(v14 + 16) = v11 + 1;
      v12 = v14 + 16 * v11;
      *(double *)(v12 + 32) = v7;
      *(_QWORD *)(v12 + 40) = v9;
    }
    while (v4 != v5);
  }
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_1CB9D4CE0(uint64_t a1, int64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_class *v19;
  char *v20;
  double *v21;
  double *v22;
  double v23;
  __int128 v24;
  uint64_t inited;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  BOOL v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void **v47;
  double v48;
  void *v49;
  double *v50;
  double v51;
  double v52;
  double *v53;
  double v54;
  double v55;
  unint64_t v56;
  unint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t result;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  __int128 v66;
  uint64_t v67;
  objc_super v68;
  uint64_t v69;
  unint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  uint64_t v75;
  char v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  if (a2 < 0)
  {
    __break(1u);
    goto LABEL_43;
  }
  v4 = MEMORY[0x1E0DEE9D8];
  if (a2)
  {
    *(_QWORD *)&v71 = MEMORY[0x1E0DEE9D8];
    sub_1CB9D3B44(0, a2, 0);
    v8 = 0;
    v3 = v71;
    v9 = *(_QWORD *)(v71 + 16);
    do
    {
      *(_QWORD *)&v71 = v3;
      v10 = *(_QWORD *)(v3 + 24);
      v11 = v9 + 1;
      if (v9 >= v10 >> 1)
      {
        sub_1CB9D3B44((char *)(v10 > 1), v9 + 1, 1);
        v3 = v71;
      }
      *(_QWORD *)(v3 + 16) = v11;
      *(double *)(v3 + 8 * v9++ + 32) = (double)v8++ / (double)(a2 - 1);
    }
    while (a2 != v8);
  }
  else
  {
    v11 = *(_QWORD *)(MEMORY[0x1E0DEE9D8] + 16);
    v3 = MEMORY[0x1E0DEE9D8];
    if (!v11)
      goto LABEL_18;
  }
  v70 = v4;
  sub_1CB9D6B9C();
  v12 = 0;
  do
  {
    v23 = *(double *)(v3 + 8 * v12 + 32);
    sub_1CB9D5428(a1, (uint64_t)&v71);
    if (v76)
    {
      v64 = v72;
      v66 = v71;
      if (v76 == 1)
      {
        v24 = v73;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9AEB70);
        inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_1CB9E2C80;
        *(_OWORD *)(inited + 32) = v66;
        *(_OWORD *)(inited + 48) = v64;
        *(_OWORD *)(inited + 64) = v24;
      }
      else
      {
        v63 = v73;
        v26 = v74;
        v27 = v75;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9AEB70);
        inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_1CB9E2C70;
        *(_OWORD *)(inited + 32) = v66;
        *(_OWORD *)(inited + 48) = v64;
        *(_OWORD *)(inited + 64) = v63;
        *(_QWORD *)(inited + 80) = v26;
        *(_QWORD *)(inited + 88) = v27;
      }
      sub_1CB9D4A10(inited, v23);
      swift_setDeallocating();
    }
    else
    {
      v13 = *(double *)&v71;
      v14 = v13 + v23 * (*(double *)&v72 - v13);
      v15 = *((double *)&v71 + 1) + v23 * (*((double *)&v72 + 1) - *((double *)&v71 + 1));
      v16 = sqrt((v13 - *(double *)&v72) * (v13 - *(double *)&v72)+ (*((double *)&v71 + 1) - *((double *)&v72 + 1)) * (*((double *)&v71 + 1) - *((double *)&v72 + 1)));
      v17 = (*(double *)&v72 - *(double *)&v71) / v16;
      v18 = (*((double *)&v72 + 1) - *((double *)&v71 + 1)) / v16;
      v19 = (objc_class *)type metadata accessor for SlopedPoint();
      v20 = (char *)objc_allocWithZone(v19);
      v21 = (double *)&v20[OBJC_IVAR___CLKUISlopedPoint_point];
      *v21 = v14;
      v21[1] = v15;
      v22 = (double *)&v20[OBJC_IVAR___CLKUISlopedPoint_tangent];
      *v22 = v17;
      v22[1] = v18;
      v68.receiver = v20;
      v68.super_class = v19;
      objc_msgSendSuper2(&v68, sel_init);
    }
    ++v12;
    sub_1CB9D6B84();
    sub_1CB9D6BA8();
    sub_1CB9D6BB4();
    sub_1CB9D6B90();
  }
  while (v11 != v12);
  v4 = v70;
LABEL_18:
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9AEB90);
  v2 = swift_initStackObject();
  *(_OWORD *)(v2 + 16) = xmmword_1CB9E2C90;
  *(_QWORD *)(v2 + 32) = 0;
  v69 = v2;
  v5 = v4 & 0xC000000000000001;
  if ((v4 & 0xC000000000000001) != 0)
  {
LABEL_43:
    v28 = (char *)MEMORY[0x1D17A110C](0, v4);
    goto LABEL_21;
  }
  if (!*(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  v28 = (char *)*(id *)(v4 + 32);
LABEL_21:
  v29 = v28;
  if (!(v4 >> 62))
  {
    v30 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v30 >= 1)
      v31 = 1;
    else
      v31 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v30 >= (unint64_t)v31)
      goto LABEL_26;
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  swift_bridgeObjectRetain();
  v30 = sub_1CB9D6BCC();
  result = swift_bridgeObjectRelease();
  if ((v30 & 0x8000000000000000) == 0)
  {
    if (v30 >= 1)
      v31 = 1;
    else
      v31 = v30;
    swift_bridgeObjectRetain();
    v65 = sub_1CB9D6BCC();
    swift_bridgeObjectRelease();
    if (v65 >= v31)
    {
      swift_bridgeObjectRetain();
      v62 = sub_1CB9D6BCC();
      swift_bridgeObjectRelease();
      if (v62 >= v30)
      {
LABEL_26:
        if (v5 && (unint64_t)v30 >= 2)
        {
          type metadata accessor for SlopedPoint();
          v32 = v31;
          do
          {
            v33 = v32 + 1;
            sub_1CB9D6B60();
            v32 = v33;
          }
          while (v30 != v33);
        }
        if (v4 >> 62)
        {
          swift_bridgeObjectRetain();
          sub_1CB9D6BD8();
          v34 = v35;
          v31 = v36;
          v38 = v37;
          swift_bridgeObjectRelease_n();
          v30 = v38 >> 1;
        }
        else
        {
          v34 = (v4 & 0xFFFFFFFFFFFFFF8) + 32;
        }
        v39 = __OFSUB__(v30, v31);
        v40 = v30 - v31;
        v67 = v3;
        if (!v40)
        {
          v41 = swift_unknownObjectRelease();
LABEL_41:
          MEMORY[0x1E0C80A78](v41, v42, v43, v44, v45, v46);
          v59 = sub_1CB9D4BD0(v67, (double (*)(uint64_t, double))sub_1CB9D5844);
          swift_bridgeObjectRelease();
          v60 = sub_1CB9D3240(v59);

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return v60;
        }
        if (!((v40 < 0) ^ v39 | (v40 == 0)))
        {
          v47 = (void **)(v34 + 8 * v31);
          v48 = 0.0;
          do
          {
            v49 = *v47;
            v50 = (double *)((char *)*v47 + OBJC_IVAR___CLKUISlopedPoint_point);
            swift_beginAccess();
            v52 = *v50;
            v51 = v50[1];
            v53 = (double *)&v29[OBJC_IVAR___CLKUISlopedPoint_point];
            swift_beginAccess();
            v55 = *v53;
            v54 = v53[1];
            v56 = *(_QWORD *)(v2 + 16);
            v57 = *(_QWORD *)(v2 + 24);
            v58 = v49;
            if (v56 >= v57 >> 1)
              v2 = (uint64_t)sub_1CB9D39E8((char *)(v57 > 1), v56 + 1, 1, (char *)v2);
            v48 = v48 + sqrt((v52 - v55) * (v52 - v55) + (v51 - v54) * (v51 - v54));
            *(_QWORD *)(v2 + 16) = v56 + 1;
            *(double *)(v2 + 8 * v56 + 32) = v48;

            ++v47;
            v29 = v58;
            --v40;
          }
          while (v40);
          v41 = swift_unknownObjectRelease();
          v69 = v2;
          v29 = v58;
          goto LABEL_41;
        }
LABEL_53:
        __break(1u);
      }
      __break(1u);
    }
    goto LABEL_51;
  }
  __break(1u);
  return result;
}

uint64_t sub_1CB9D52F0(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v13;
  _BYTE v14[72];
  _BYTE v15[72];

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x1E0DEE9D8];
  if (v1)
  {
    v13 = MEMORY[0x1E0DEE9D8];
    sub_1CB9D3AE0(0, v1, 0);
    v2 = v13;
    v4 = a1 + 32;
    do
    {
      sub_1CB9D5428(v4, (uint64_t)v14);
      sub_1CB9D5428((uint64_t)v14, (uint64_t)v15);
      if (v15[64])
        v5 = 16;
      else
        v5 = 2;
      v6 = sub_1CB9D4CE0((uint64_t)v14, v5);
      v8 = v7;
      v10 = *(_QWORD *)(v13 + 16);
      v9 = *(_QWORD *)(v13 + 24);
      if (v10 >= v9 >> 1)
        sub_1CB9D3AE0((char *)(v9 > 1), v10 + 1, 1);
      *(_QWORD *)(v13 + 16) = v10 + 1;
      v11 = v13 + 16 * v10;
      *(_QWORD *)(v11 + 32) = v6;
      *(_QWORD *)(v11 + 40) = v8;
      v4 += 72;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t type metadata accessor for SlopedPoint()
{
  return objc_opt_self();
}

uint64_t sub_1CB9D5428(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a2 = *(_OWORD *)a1;
  v2 = *(_OWORD *)(a1 + 16);
  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 48);
  *(_BYTE *)(a2 + 64) = *(_BYTE *)(a1 + 64);
  *(_OWORD *)(a2 + 32) = v3;
  *(_OWORD *)(a2 + 48) = v4;
  *(_OWORD *)(a2 + 16) = v2;
  return a2;
}

uint64_t method lookup function for SlopedPoint()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SlopedPoint.__allocating_init(point:tangent:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t type metadata accessor for CLKUIBezierPathStepper()
{
  return objc_opt_self();
}

_QWORD *initializeBufferWithCopyOfBuffer for LengthTable(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for LengthTable()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for LengthTable(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for LengthTable(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for LengthTable(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for LengthTable(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for LengthTable()
{
  return &type metadata for LengthTable;
}

void type metadata accessor for CGVector(uint64_t a1)
{
  sub_1CB9D5884(a1, &qword_1EF9AEB58);
}

uint64_t initializeBufferWithCopyOfBuffer for PathSegment(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy65_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for PathSegment(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 65))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 64);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PathSegment(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 64) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 65) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 65) = 0;
    if (a2)
      *(_BYTE *)(result + 64) = -(char)a2;
  }
  return result;
}

uint64_t sub_1CB9D56EC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 64);
}

uint64_t sub_1CB9D56F8(uint64_t result, char a2)
{
  *(_BYTE *)(result + 64) = a2;
  return result;
}

ValueMetadata *type metadata accessor for PathSegment()
{
  return &type metadata for PathSegment;
}

uint64_t sub_1CB9D5710(uint64_t a1, int a2)
{
  int v3;

  if (!a2)
    return 0;
  if (a2 != 1 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2);
  if (*(_QWORD *)(a1 + 8))
    v3 = -1;
  else
    v3 = 0;
  return (v3 + 1);
}

uint64_t sub_1CB9D5754(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(_QWORD *)result = a2 - 2;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 2)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 2)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = 0;
  }
  return result;
}

void type metadata accessor for CGPathElement(uint64_t a1)
{
  sub_1CB9D5884(a1, &qword_1EF9AEB60);
}

uint64_t sub_1CB9D57A4(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1CB9D57C4(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_1CB9D5884(a1, &qword_1EF9AEB68);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1D17A1DE4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_1CB9D5844(unint64_t result)
{
  uint64_t v1;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_5;
  }
  if (*(_QWORD *)(**(_QWORD **)(v1 + 16) + 16) <= result)
LABEL_5:
    __break(1u);
  return result;
}

void type metadata accessor for CGPathElementType(uint64_t a1)
{
  sub_1CB9D5884(a1, &qword_1EF9AEBC8);
}

void sub_1CB9D5884(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1CB9D58DC()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

void _linearizeAndComputeAPL_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB9A4000, v0, v1, "Cannot compute APL for NULL pixels.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void _linearizeAndComputeAPL_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB9A4000, v0, v1, "Failed to allocate memory for APL workspace.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void CLKUIComputeImageAPL_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB9A4000, v0, v1, "Failed to get data from bitmap context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void CLKUIConvertTextureFromXRSRGBtoP3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB9A4000, v0, v1, "xsrgb: newComputePipelineStateWithFunction returned nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void CLKUIConvertTextureFromXRSRGBtoP3_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1CB9A4000, a2, a3, "xsrgb: newComputePipelineStateWithFunction error=%@", a5, a6, a7, a8, 2u);
}

void CLKUIConvertTextureFromXRSRGBtoP3_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB9A4000, v0, v1, "xsrgb: newFunctionWithName returned nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void CLKUIConvertTextureFromXRSRGBtoP3_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB9A4000, v0, v1, "xsrgb: newDefaultLibraryWithBundle returned nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void CLKUIConvertTextureFromXRSRGBtoP3_cold_5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1CB9A4000, a2, a3, "xsrgb: newDefaultLibraryWithBundle error=%@", a5, a6, a7, a8, 2u);
}

void _CLKUICalculateNumCompressedTexMipmaps_cold_1()
{
  __assert_rtn("_CLKUICalculateNumCompressedTexMipmaps", "CLKUIMetalTexture.m", 100, "mipCount != 0");
}

uint64_t sub_1CB9D6B30()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1CB9D6B3C()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1CB9D6B48()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1CB9D6B54()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1CB9D6B60()
{
  return MEMORY[0x1E0DEC3D0]();
}

uint64_t sub_1CB9D6B6C()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1CB9D6B78()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1CB9D6B84()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1CB9D6B90()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1CB9D6B9C()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1CB9D6BA8()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1CB9D6BB4()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1CB9D6BC0()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1CB9D6BCC()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1CB9D6BD8()
{
  return MEMORY[0x1E0DECD20]();
}

uint64_t sub_1CB9D6BE4()
{
  return MEMORY[0x1E0DED1B0]();
}

uint64_t BSCurrentUserDirectory()
{
  return MEMORY[0x1E0D01178]();
}

uint64_t CAColorMatrixConcat()
{
  return MEMORY[0x1E0CD2330]();
}

uint64_t CAColorMatrixMakeColorSourceOver()
{
  return MEMORY[0x1E0CD2348]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x1E0CD2388]();
  return result;
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x1E0CD2638](retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2640](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DRotate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x1E0CD2658](retstr, t, angle, x, y, z);
}

CFMutableAttributedStringRef CFAttributedStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableAttributedStringRef)MEMORY[0x1E0C97E00](alloc, maxLength);
}

CFIndex CFAttributedStringGetLength(CFAttributedStringRef aStr)
{
  return MEMORY[0x1E0C97E48](aStr);
}

void CFAttributedStringReplaceString(CFMutableAttributedStringRef aStr, CFRange range, CFStringRef replacement)
{
  MEMORY[0x1E0C97E70](aStr, range.location, range.length, replacement);
}

void CFAttributedStringSetAttribute(CFMutableAttributedStringRef aStr, CFRange range, CFStringRef attrName, CFTypeRef value)
{
  MEMORY[0x1E0C97E78](aStr, range.location, range.length, attrName, value);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BA90](retstr, t1, t2);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1E0C9BAB8](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD0](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF0](retstr, t, angle);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x1E0C9BB70](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x1E0C9BB78](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x1E0C9BB80](context);
}

CGColorRef CGColorCreateCopyByMatchingToColorSpace(CGColorSpaceRef a1, CGColorRenderingIntent intent, CGColorRef color, CFDictionaryRef options)
{
  return (CGColorRef)MEMORY[0x1E0C9BC88](a1, *(_QWORD *)&intent, color, options);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1E0C9BD08](color);
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x1E0C9BD60](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE50](name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
  MEMORY[0x1E0C9C050](c, transform);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x1E0C9C370](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x1E0C9C388](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x1E0C9C390](c, sx, sy);
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
  MEMORY[0x1E0C9C3C8](c, *(_QWORD *)&mode);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x1E0C9C458](c, *(_QWORD *)&quality);
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  MEMORY[0x1E0C9C4A0](c, red, green, blue, alpha);
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
  MEMORY[0x1E0C9C4C0](c, color, (__n128)offset, *(__n128 *)&offset.height, blur);
}

void CGContextSetShouldSubpixelQuantizeFonts(CGContextRef c, BOOL shouldSubpixelQuantizeFonts)
{
  MEMORY[0x1E0C9C4F0](c, shouldSubpixelQuantizeFonts);
}

void CGContextSetTextMatrix(CGContextRef c, CGAffineTransform *t)
{
  MEMORY[0x1E0C9C530](c, t);
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9C538](c, x, y);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x1E0C9C588](c, tx, ty);
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x1E0C9C5D8](provider);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C5F0](data);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C600](info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x1E0C9C638](provider);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1E0C9CB80](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(_QWORD *)&bitmapInfo, provider);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1E0C9CBF8](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x1E0C9CC00](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x1E0C9CC08](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9CC38](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
  MEMORY[0x1E0C9D280](path, m, clockwise, x, y, radius, startAngle, endAngle);
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D2A8](path, m, x, y);
}

void CGPathAddPath(CGMutablePathRef path1, const CGAffineTransform *m, CGPathRef path2)
{
  MEMORY[0x1E0C9D2B8](path1, m, path2);
}

void CGPathApplyWithBlock(CGPathRef path, CGPathApplyBlock block)
{
  MEMORY[0x1E0C9D300](path, block);
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
  MEMORY[0x1E0C9D310](path);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1E0C9D388]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D490](path, m, x, y);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x1E0C9D498](path);
}

CGPathRef CGPathRetain(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x1E0C9D4A0](path);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D548](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
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

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D630]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D640]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CLKBuildVersion()
{
  return MEMORY[0x1E0C93E58]();
}

uint64_t CLKCeilForDevice()
{
  return MEMORY[0x1E0C93E60]();
}

uint64_t CLKCompressFraction()
{
  return MEMORY[0x1E0C93EB8]();
}

uint64_t CLKDialDiameterForDevice()
{
  return MEMORY[0x1E0C93EE8]();
}

uint64_t CLKEqualObjects()
{
  return MEMORY[0x1E0C93EF8]();
}

uint64_t CLKFloatEqualsFloat()
{
  return MEMORY[0x1E0C93F00]();
}

uint64_t CLKFloorForDevice()
{
  return MEMORY[0x1E0C93F08]();
}

uint64_t CLKHourMinuteSecondAnglesForTime()
{
  return MEMORY[0x1E0C93F28]();
}

uint64_t CLKInternalBuild()
{
  return MEMORY[0x1E0C93F30]();
}

uint64_t CLKInterpolateBetweenColors()
{
  return MEMORY[0x1E0C93F38]();
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return MEMORY[0x1E0C93F40]();
}

uint64_t CLKKernValueForDesignSpecTrackingValue()
{
  return MEMORY[0x1E0C93FB0]();
}

uint64_t CLKLocaleRenderingHintLanguageIdentifierForNumberingSystem()
{
  return MEMORY[0x1E0C93FF0]();
}

uint64_t CLKLoggingObjectForDomain()
{
  return MEMORY[0x1E0C93FF8]();
}

uint64_t CLKNormalizeAngle()
{
  return MEMORY[0x1E0C94008]();
}

uint64_t CLKPixelAlignRectForDevice()
{
  return MEMORY[0x1E0C94010]();
}

uint64_t CLKRectEqualsRect()
{
  return MEMORY[0x1E0C94048]();
}

uint64_t CLKRectGetCenter()
{
  return MEMORY[0x1E0C94050]();
}

uint64_t CLKRoundForDevice()
{
  return MEMORY[0x1E0C940A0]();
}

uint64_t CLKRunningInProcess()
{
  return MEMORY[0x1E0C940B0]();
}

uint64_t CLKSceneSizeForDevice()
{
  return MEMORY[0x1E0C940B8]();
}

uint64_t CLKSizeEqualsSize()
{
  return MEMORY[0x1E0C940D0]();
}

uint64_t CLKSizeIsEmpty()
{
  return MEMORY[0x1E0C940E0]();
}

uint64_t CLKValueForDeviceMetrics()
{
  return MEMORY[0x1E0C94100]();
}

CGRect CTFontGetBoundingRectsForGlyphs(CTFontRef font, CTFontOrientation orientation, const CGGlyph *glyphs, CGRect *boundingRects, CFIndex count)
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  MEMORY[0x1E0CA7BB8](font, *(_QWORD *)&orientation, glyphs, boundingRects, count);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

CGRect CTFontGetOpticalBoundsForGlyphs(CTFontRef font, const CGGlyph *glyphs, CGRect *boundingRects, CFIndex count, CFOptionFlags options)
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  MEMORY[0x1E0CA7C38](font, glyphs, boundingRects, count, options);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x1E0CA7E88](attrString);
}

void CTLineDraw(CTLineRef line, CGContextRef context)
{
  MEMORY[0x1E0CA7EA8](line, context);
}

CGRect CTLineGetBoundsWithOptions(CTLineRef line, CTLineBoundsOptions options)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0CA7EC0](line, options);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGRect CTLineGetImageBounds(CTLineRef line, CGContextRef context)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0CA7EE0](line, context);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

double CTLineGetTypographicBounds(CTLineRef line, CGFloat *ascent, CGFloat *descent, CGFloat *leading)
{
  double result;

  MEMORY[0x1E0CA7F18](line, ascent, descent, leading);
  return result;
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1E0CC6980]();
}

uint64_t NRVersionIsGreaterThanOrEqual()
{
  return MEMORY[0x1E0D51810]();
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1E0DC32F0]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x1E0DC4BC0](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x1E0DC4BD8]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1E0DC4BE8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1E0DC4BF0]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1E0DC4C60](image);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
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

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

simd_float4 _simd_pow_f4(simd_float4 x, simd_float4 y)
{
  simd_float4 result;

  MEMORY[0x1E0C811F8]((__n128)x, (__n128)y);
  return result;
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

long double acos(long double __x)
{
  long double result;

  MEMORY[0x1E0C81500](__x);
  return result;
}

float asinf(float a1)
{
  float result;

  MEMORY[0x1E0C815A0](a1);
  return result;
}

float cbrtf(float a1)
{
  float result;

  MEMORY[0x1E0C81858](a1);
  return result;
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return MEMORY[0x1E0DE5290](stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return MEMORY[0x1E0DE52A0](stream, *(_QWORD *)&operation, *(_QWORD *)&algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return MEMORY[0x1E0DE52B0](stream, *(_QWORD *)&flags);
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
  MEMORY[0x1E0C82BD8](iterations, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
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

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

uint64_t geo_isDayLightForLocation()
{
  return MEMORY[0x1E0D278F8]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

float log2f(float a1)
{
  float result;

  MEMORY[0x1E0C83BF0](a1);
  return result;
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1E0C83E60](a1, a2, *(_QWORD *)&a3);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
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

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

size_t os_proc_available_memory(void)
{
  return MEMORY[0x1E0C84908]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C84BC0](a1, a2);
  return result;
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

void vDSP_meanv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C1E8](__A, __IA, __C, __N);
}

