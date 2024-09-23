void ____filenameForKeyAndExtension_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("%/"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invertedSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)qword_1ECEC3918;
  qword_1ECEC3918 = v1;

}

void sub_1A0235B94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A0235DA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

id _readCPBitmapImageFromPathWithOptions(void *a1)
{
  id v1;
  const void *MappedDataFromPath;
  const __CFArray *ImagesFromData;
  CFIndex Count;
  NSObject *v5;
  id v6;
  const void *ValueAtIndex;
  void *v8;
  int v10;
  double valuePtr;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  MappedDataFromPath = (const void *)CPBitmapCreateMappedDataFromPath();
  if (MappedDataFromPath)
  {
    ImagesFromData = (const __CFArray *)CPBitmapCreateImagesFromData();
    if (ImagesFromData)
    {
      Count = CFArrayGetCount(ImagesFromData);
      if (Count == 1)
        goto LABEL_7;
      BSLogCommon();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v10 = CFArrayGetCount(ImagesFromData);
        LODWORD(valuePtr) = 67109378;
        HIDWORD(valuePtr) = v10;
        v12 = 2114;
        v13 = v1;
        _os_log_error_impl(&dword_1A0234000, v5, OS_LOG_TYPE_ERROR, "BSUIMappedImageCache: unexpected imageCount=%i in CPBitmapData from path=%{public}@", (uint8_t *)&valuePtr, 0x12u);
      }

      if (Count >= 1)
      {
LABEL_7:
        valuePtr = 1.0;
        v6 = objc_alloc(MEMORY[0x1E0CEA638]);
        ValueAtIndex = CFArrayGetValueAtIndex(ImagesFromData, 0);
        v8 = (void *)objc_msgSend(v6, "initWithCGImage:scale:orientation:", ValueAtIndex, 0, valuePtr);
      }
      else
      {
        v8 = 0;
      }
      CFRelease(ImagesFromData);
    }
    else
    {
      v8 = 0;
    }
    CFRelease(MappedDataFromPath);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void sub_1A02360D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id __pathForKeyAndExtension(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v10 = v6;
    v11 = v8;
    if (qword_1ECEC3920 != -1)
      dispatch_once(&qword_1ECEC3920, &__block_literal_global_0);
    objc_msgSend(v10, "stringByAddingPercentEncodingWithAllowedCharacters:", qword_1ECEC3918);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingPathExtension:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "stringByAppendingPathComponent:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

void sub_1A0236214(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A02365D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,void *a37,void *a38)
{
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;

  _Block_object_dispose((const void *)(v42 - 200), 8);
  _Block_object_dispose((const void *)(v42 - 152), 8);

  _Unwind_Resume(a1);
}

void sub_1A02366C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0236890(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0236ACC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0236CDC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1A0236DD0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A02370C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1A0237420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1A0237574(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A02375F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0237724(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0237794(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A02377F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A02378C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A02379A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A0237A44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A0237AD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A0238504(_Unwind_Exception *a1)
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

void sub_1A0238708(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0238764(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A02387F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A02388A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0238BD4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0238E1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1A0238FD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A0239048(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0239204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A02392F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

double _BSUITransformFromOrientationToOrientation@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  CGFloat v7;
  __int128 v8;
  CGAffineTransform v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  v4 = MEMORY[0x1E0C9BAA8];
  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *a3 = *MEMORY[0x1E0C9BAA8];
  a3[1] = v5;
  v6 = *(_OWORD *)(v4 + 32);
  a3[2] = v6;
  if (a1 != a2)
  {
    BSDegreesToRadians();
    CGAffineTransformMakeRotation(&v10, v7);
    UIIntegralTransform();
    v8 = v12;
    *a3 = v11;
    a3[1] = v8;
    *(_QWORD *)&v6 = v13;
    a3[2] = v13;
  }
  return *(double *)&v6;
}

void sub_1A0239660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A0239790(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A023998C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0239B1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A0239C58(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1A0239CD4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0239D3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A0239DCC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0239E64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A023A1C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void sub_1A023A368(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A023A5B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  void *v28;
  uint64_t v29;

  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a23, 8);

  _Block_object_dispose((const void *)(v29 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A023A664(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A023A97C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1A023ABBC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1A023ACC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A023AE50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A023AEFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A023B028(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

double BSUIVibrancyMapBias(double a1, double a2)
{
  double v2;

  v2 = fmin(fmax(a2, 2.22044605e-16), 1.0);
  return v2 * a1 / (-(v2 - (v2 + v2) * a1) - a1 + 1.0) + 0.0;
}

void sub_1A023B170(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A023B200(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A023B4F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

float32x4_t _lerpColorMatrices(uint64_t a1, float32x2_t *a2, float32x4_t *a3, double a4)
{
  __int128 v4;
  float32x4_t result;
  float32x4_t v6;
  float32x4_t v7;
  float v8;
  double v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;

  if (a4 == 0.0)
  {
    v4 = *(_OWORD *)a2[6].f32;
    *(_OWORD *)(a1 + 32) = *(_OWORD *)a2[4].f32;
    *(_OWORD *)(a1 + 48) = v4;
    *(_OWORD *)(a1 + 64) = *(_OWORD *)a2[8].f32;
    v6 = *(float32x4_t *)a2->f32;
    result = *(float32x4_t *)a2[2].f32;
LABEL_5:
    *(float32x4_t *)a1 = v6;
    *(float32x4_t *)(a1 + 16) = result;
    return result;
  }
  if (a4 == 1.0)
  {
    v7 = a3[3];
    *(float32x4_t *)(a1 + 32) = a3[2];
    *(float32x4_t *)(a1 + 48) = v7;
    *(float32x4_t *)(a1 + 64) = a3[4];
    v6 = *a3;
    result = a3[1];
    goto LABEL_5;
  }
  v8 = a4;
  v9 = 1.0 - v8;
  v10 = vmulq_n_f32(*a3, v8);
  v11 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmlaq_n_f64(vcvtq_f64_f32(*(float32x2_t *)v10.f32), vcvtq_f64_f32(*a2), v9)), vmlaq_n_f64(vcvt_hight_f64_f32(v10), vcvt_hight_f64_f32(*(float32x4_t *)a2->f32), v9));
  v12 = vmulq_n_f32(a3[1], v8);
  v13 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmlaq_n_f64(vcvtq_f64_f32(*(float32x2_t *)v12.f32), vcvtq_f64_f32(a2[2]), v9)), vmlaq_n_f64(vcvt_hight_f64_f32(v12), vcvt_hight_f64_f32(*(float32x4_t *)a2[2].f32), v9));
  *(float32x4_t *)a1 = v11;
  *(float32x4_t *)(a1 + 16) = v13;
  v14 = vmulq_n_f32(a3[2], v8);
  v15 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmlaq_n_f64(vcvtq_f64_f32(*(float32x2_t *)v14.f32), vcvtq_f64_f32(a2[4]), v9)), vmlaq_n_f64(vcvt_hight_f64_f32(v14), vcvt_hight_f64_f32(*(float32x4_t *)a2[4].f32), v9));
  v16 = vmulq_n_f32(a3[3], v8);
  v17 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmlaq_n_f64(vcvtq_f64_f32(*(float32x2_t *)v16.f32), vcvtq_f64_f32(a2[6]), v9)), vmlaq_n_f64(vcvt_hight_f64_f32(v16), vcvt_hight_f64_f32(*(float32x4_t *)a2[6].f32), v9));
  *(float32x4_t *)(a1 + 32) = v15;
  *(float32x4_t *)(a1 + 48) = v17;
  v18 = vmulq_n_f32(a3[4], v8);
  result = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmlaq_n_f64(vcvtq_f64_f32(*(float32x2_t *)v18.f32), vcvtq_f64_f32(a2[8]), v9)), vmlaq_n_f64(vcvt_hight_f64_f32(v18), vcvt_hight_f64_f32(*(float32x4_t *)a2[8].f32), v9));
  *(float32x4_t *)(a1 + 64) = result;
  return result;
}

unint64_t _colorMatrixHash(float *a1)
{
  return (unint64_t)fabs((float)(a1[4]+ (float)((float)((float)((float)(a1[1] * 0.2) + (float)(*a1 * 0.1))+ (float)(a1[2] * 0.3))+ (float)(a1[3] * 0.4)))+ (float)(a1[9]+ (float)((float)((float)((float)(a1[6] * 0.2) + (float)(a1[5] * 0.1))+ (float)(a1[7] * 0.3))+ (float)(a1[8] * 0.4)))* 100.0+ (float)(a1[14]+ (float)((float)((float)((float)(a1[11] * 0.2) + (float)(a1[10] * 0.1))+ (float)(a1[12] * 0.3))+ (float)(a1[13] * 0.4)))* 10000.0+ (float)(a1[19]+ (float)((float)((float)((float)(a1[16] * 0.2) + (float)(a1[15] * 0.1))+ (float)(a1[17] * 0.3))+ (float)(a1[18] * 0.4)))* 1000000.0);
}

void sub_1A023B794(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id _transformUIColor(void *a1, float *a2)
{
  float v3;
  float v4;
  float v5;
  float v6;
  double v8;
  double v9;
  double v10;
  double v11;

  v10 = 0.0;
  v11 = 0.0;
  v8 = 0.0;
  v9 = 0.0;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v11, &v10, &v9, &v8);
  v3 = v11;
  v4 = v10;
  v5 = v9;
  v6 = v8;
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", (float)(a2[4]+ (float)((float)((float)((float)(a2[1] * v4) + (float)(v3 * *a2)) + (float)(v5 * a2[2])) + (float)(v6 * a2[3]))), (float)(a2[9]+ (float)((float)((float)((float)(a2[6] * v4) + (float)(v3 * a2[5])) + (float)(v5 * a2[7]))+ (float)(v6 * a2[8]))), (float)(a2[14]+ (float)((float)((float)((float)(a2[11] * v4) + (float)(v3 * a2[10])) + (float)(v5 * a2[12]))+ (float)(v6 * a2[13]))), (float)(a2[19]+ (float)((float)((float)((float)(a2[16] * v4) + (float)(v3 * a2[15])) + (float)(v5 * a2[17]))+ (float)(v6 * a2[18]))));
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_1A023B8E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A023B9F8(_Unwind_Exception *a1)
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

void sub_1A023BB6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A023BFB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

float _curve(double a1, double a2, double a3, __n128 a4)
{
  unsigned __int32 v4;
  float v5;
  float v6;
  float v7;
  void *v8;
  double v9;
  float v10;
  float v11;

  v4 = a4.n128_u32[0];
  v5 = *(float *)&a2;
  v6 = *(float *)&a3 - *(float *)&a2;
  v7 = fminf(fmaxf((float)(*(float *)&a1 - *(float *)&a2) / (float)(*(float *)&a3 - *(float *)&a2), 0.0), 1.0);
  LODWORD(a2) = a4.n128_u32[1];
  LODWORD(a3) = a4.n128_u32[2];
  a4.n128_u32[0] = a4.n128_u32[3];
  LODWORD(a1) = v4;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", a1, a2, a3, a4.n128_f64[0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v9 = v7;
  objc_msgSend(v8, "_solveForInput:", v9);
  v11 = v5 + (float)(v6 * v10);

  return v11;
}

void sub_1A023C058(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A023C15C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A023C694(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A023C704(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A023C858(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t BSIntervalInterpolatorUIRubberBanding_block_invoke()
{
  uint64_t result;

  BSIntervalMin();
  BSIntervalMax();
  result = BSFloatIsZero();
  if ((result & 1) == 0)
    return BSIntervalMin();
  return result;
}

uint64_t BSIntervalInterpolatorInvertUIRubberBanding_block_invoke_2()
{
  uint64_t result;

  BSIntervalMin();
  BSIntervalMax();
  result = BSFloatIsZero();
  if ((result & 1) == 0)
    return BSIntervalMin();
  return result;
}

uint64_t BSUIConstrainValueWithRubberBand()
{
  return BSIntervalInterpolate();
}

double BSUIConstrainValueToIntervalWithRubberBand(double a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  BSIntervalMin();
  v3 = v2;
  BSIntervalMax();
  if (v3 <= a1)
  {
    v6 = v4;
    if (v4 < a1)
    {
      BSIntervalInterpolate();
      return v6 + v7;
    }
  }
  else
  {
    BSIntervalInterpolate();
    return v3 - v5;
  }
  return a1;
}

uint64_t BSUIInvertRubberBandValue()
{
  return BSIntervalInterpolate();
}

double BSUIInvertRubberBandValueForInterval(double a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  BSIntervalMin();
  v3 = v2;
  BSIntervalMax();
  if (v3 <= a1)
  {
    v6 = v4;
    if (v4 < a1)
    {
      BSIntervalInterpolate();
      return v6 + v7;
    }
  }
  else
  {
    BSIntervalInterpolate();
    return v3 - v5;
  }
  return a1;
}

void sub_1A023CF30(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A023CFC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A023D02C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t BSUIFontDescriptorSymbolicTraitForHIFontStyle(unsigned int a1)
{
  return (a1 << 12) & 0x18000 | (a1 >> 1) & 3;
}

void sub_1A023D408(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A023D570(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A023D980(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, objc_super a13)
{
  void *v13;
  void *v14;

  a13.super_class = (Class)BSUIMappedImageCache;
  -[_Unwind_Exception dealloc](&a13, sel_dealloc);
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

id _workBlockGenerator(void *a1, void *a2, char a3, void *a4, uint64_t a5, int a6, void *a7, void *a8, void *a9, void *a10, void *a11, void *a12)
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  id v62;
  id v64;
  void *v65;
  id v66;
  id v67;
  void *v68;
  _QWORD v69[4];
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  uint64_t v79;
  int v80;
  char v81;

  v17 = a1;
  v18 = a2;
  v19 = a4;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v67 = a11;
  v24 = v20;
  v65 = v19;
  v66 = a12;
  v68 = v17;
  if (v17)
  {
    if (v18)
      goto LABEL_3;
  }
  else
  {
    v36 = v21;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BSUIMappedImageCacheFutureWorkBlock _workBlockGenerator(BSUIMappedImageCacheFuture *__strong, UIImage *__strong, BOOL, NSString *__strong, BSUIMappedImageCachePersistenceOptions, CPBitmapReadFlags, NSString *__strong, NSString *__strong, __strong dispatch_queue_t, __strong dispatch_queue_t, NSMutableDictionary<NSString *,id> *__strong, __strong BSUIMappedImageCachePersistenceCompletion)");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", v38, CFSTR("BSUIMappedImageCache.m"), 369, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("future"));

    v21 = v36;
    if (v18)
    {
LABEL_3:
      if (v19)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  v39 = v21;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BSUIMappedImageCacheFutureWorkBlock _workBlockGenerator(BSUIMappedImageCacheFuture *__strong, UIImage *__strong, BOOL, NSString *__strong, BSUIMappedImageCachePersistenceOptions, CPBitmapReadFlags, NSString *__strong, NSString *__strong, __strong dispatch_queue_t, __strong dispatch_queue_t, NSMutableDictionary<NSString *,id> *__strong, __strong BSUIMappedImageCachePersistenceCompletion)");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "handleFailureInFunction:file:lineNumber:description:", v41, CFSTR("BSUIMappedImageCache.m"), 370, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("image"));

  v21 = v39;
  if (v19)
  {
LABEL_4:
    if (v24)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v42 = v21;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BSUIMappedImageCacheFutureWorkBlock _workBlockGenerator(BSUIMappedImageCacheFuture *__strong, UIImage *__strong, BOOL, NSString *__strong, BSUIMappedImageCachePersistenceOptions, CPBitmapReadFlags, NSString *__strong, NSString *__strong, __strong dispatch_queue_t, __strong dispatch_queue_t, NSMutableDictionary<NSString *,id> *__strong, __strong BSUIMappedImageCachePersistenceCompletion)");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, CFSTR("BSUIMappedImageCache.m"), 371, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  v21 = v42;
  if (v24)
  {
LABEL_5:
    if (v21)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  v45 = v21;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BSUIMappedImageCacheFutureWorkBlock _workBlockGenerator(BSUIMappedImageCacheFuture *__strong, UIImage *__strong, BOOL, NSString *__strong, BSUIMappedImageCachePersistenceOptions, CPBitmapReadFlags, NSString *__strong, NSString *__strong, __strong dispatch_queue_t, __strong dispatch_queue_t, NSMutableDictionary<NSString *,id> *__strong, __strong BSUIMappedImageCachePersistenceCompletion)");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "handleFailureInFunction:file:lineNumber:description:", v47, CFSTR("BSUIMappedImageCache.m"), 372, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tmp_dir_path"));

  v21 = v45;
  if (v45)
  {
LABEL_6:
    if (v23)
      goto LABEL_7;
LABEL_16:
    v51 = v21;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BSUIMappedImageCacheFutureWorkBlock _workBlockGenerator(BSUIMappedImageCacheFuture *__strong, UIImage *__strong, BOOL, NSString *__strong, BSUIMappedImageCachePersistenceOptions, CPBitmapReadFlags, NSString *__strong, NSString *__strong, __strong dispatch_queue_t, __strong dispatch_queue_t, NSMutableDictionary<NSString *,id> *__strong, __strong BSUIMappedImageCachePersistenceCompletion)");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, CFSTR("BSUIMappedImageCache.m"), 374, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion_queue"));

    v21 = v51;
    if (v22)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_15:
  v48 = v21;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BSUIMappedImageCacheFutureWorkBlock _workBlockGenerator(BSUIMappedImageCacheFuture *__strong, UIImage *__strong, BOOL, NSString *__strong, BSUIMappedImageCachePersistenceOptions, CPBitmapReadFlags, NSString *__strong, NSString *__strong, __strong dispatch_queue_t, __strong dispatch_queue_t, NSMutableDictionary<NSString *,id> *__strong, __strong BSUIMappedImageCachePersistenceCompletion)");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "handleFailureInFunction:file:lineNumber:description:", v50, CFSTR("BSUIMappedImageCache.m"), 373, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("local_path"));

  v21 = v48;
  if (!v23)
    goto LABEL_16;
LABEL_7:
  if (v22)
    goto LABEL_8;
LABEL_17:
  v54 = v21;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BSUIMappedImageCacheFutureWorkBlock _workBlockGenerator(BSUIMappedImageCacheFuture *__strong, UIImage *__strong, BOOL, NSString *__strong, BSUIMappedImageCachePersistenceOptions, CPBitmapReadFlags, NSString *__strong, NSString *__strong, __strong dispatch_queue_t, __strong dispatch_queue_t, NSMutableDictionary<NSString *,id> *__strong, __strong BSUIMappedImageCachePersistenceCompletion)");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "handleFailureInFunction:file:lineNumber:description:", v56, CFSTR("BSUIMappedImageCache.m"), 375, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("local_queue"));

  v21 = v54;
LABEL_8:
  v25 = v67;
  if (!v67)
  {
    v57 = v21;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BSUIMappedImageCacheFutureWorkBlock _workBlockGenerator(BSUIMappedImageCacheFuture *__strong, UIImage *__strong, BOOL, NSString *__strong, BSUIMappedImageCachePersistenceOptions, CPBitmapReadFlags, NSString *__strong, NSString *__strong, __strong dispatch_queue_t, __strong dispatch_queue_t, NSMutableDictionary<NSString *,id> *__strong, __strong BSUIMappedImageCachePersistenceCompletion)");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "handleFailureInFunction:file:lineNumber:description:", v59, CFSTR("BSUIMappedImageCache.m"), 376, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("local_queue_keysToImagesOrFutures"));

    v21 = v57;
    v25 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D018B0], "referenceWithObject:", v17);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = MEMORY[0x1E0C809B0];
  v69[1] = 3221225472;
  v69[2] = ___workBlockGenerator_block_invoke;
  v69[3] = &unk_1E4348F08;
  v70 = v26;
  v80 = a6;
  v60 = v18;
  v71 = v60;
  v79 = a5;
  v27 = v24;
  v72 = v27;
  v28 = v65;
  v73 = v28;
  v29 = v22;
  v74 = v29;
  v30 = v25;
  v75 = v30;
  v31 = v21;
  v76 = v31;
  v32 = v66;
  v78 = v32;
  v33 = v23;
  v77 = v33;
  v81 = a3;
  v64 = v26;
  v34 = (void *)MEMORY[0x1A1AF63A8](v69);
  v62 = (id)objc_msgSend(v34, "copy");

  return v62;
}

void sub_1A023DFF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, void *a18, void *a19, void *a20)
{
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  _Unwind_Resume(a1);
}

void sub_1A023E150(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A023E2E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A023E3D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1A023E560(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A023E638(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A023E824(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A023E8FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A023EA6C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A023EB0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A023EB70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A023EBEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A023EC34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A023EE18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A023EF7C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A023F150(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A023F23C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___workBlockGenerator_block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(id, id);
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id *v8;
  __CFString *v9;
  uint64_t *v10;
  id (*v11)(uint64_t, void *);
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  _QWORD block[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  __CFString *v29;
  id v30;
  id v31;
  id v32;
  int v33;
  char v34;
  int v35;
  uint64_t v36;
  _QWORD v37[4];
  _QWORD v38[2];
  uint64_t v39;
  _QWORD v40[4];
  _QWORD v41[7];

  v41[5] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_msgSend(*(id *)(a1 + 40), "ioSurface");
    v6 = MEMORY[0x1E0C809B0];
    if (v5)
    {
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = ___workBlockGenerator_block_invoke_2;
      v40[3] = &unk_1E4348E48;
      v41[0] = *(id *)(a1 + 40);
      v7 = (void *)MEMORY[0x1A1AF63A8](v40);
      v8 = (id *)v41;
      v39 = v6;
      v9 = CFSTR("surface");
      v10 = &v39;
      v11 = ___workBlockGenerator_block_invoke_3;
    }
    else
    {
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = ___workBlockGenerator_block_invoke_4;
      v37[3] = &unk_1E4348E90;
      v12 = *(id *)(a1 + 40);
      v13 = *(_QWORD *)(a1 + 104);
      v38[0] = v12;
      v38[1] = v13;
      v7 = (void *)MEMORY[0x1A1AF63A8](v37);
      v8 = (id *)v38;
      v36 = v6;
      v9 = CFSTR("cpbitmap");
      v10 = &v36;
      v11 = ___workBlockGenerator_block_invoke_5;
    }
    v10[1] = 3221225472;
    v10[2] = (uint64_t)v11;
    v10[3] = (uint64_t)&__block_descriptor_36_e27___UIImage_16__0__NSString_8l;
    *((_DWORD *)v10 + 8) = *(_DWORD *)(a1 + 112);
    v21 = (void *)MEMORY[0x1A1AF63A8]();

    v35 = -1;
    __pathForKeyAndExtension(*(void **)(a1 + 48), *(void **)(a1 + 56), v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    BSTemporaryFileAtPath();
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = *(id *)(a1 + 40);
    v3[2](v3, v16);
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = ___workBlockGenerator_block_invoke_203;
    block[3] = &unk_1E4348EE0;
    v17 = *(NSObject **)(a1 + 64);
    v23 = *(id *)(a1 + 72);
    v24 = *(id *)(a1 + 56);
    v25 = v4;
    v26 = v16;
    v27 = 0;
    v28 = *(id *)(a1 + 80);
    v29 = v9;
    v30 = v15;
    v33 = -1;
    v32 = *(id *)(a1 + 96);
    v31 = *(id *)(a1 + 88);
    v34 = *(_BYTE *)(a1 + 116);
    v18 = v15;
    v19 = 0;
    v20 = v16;
    dispatch_async(v17, block);

  }
}

void sub_1A023F6EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

BOOL ___workBlockGenerator_block_invoke_2(uint64_t a1, int a2)
{
  return +[BSUIMappedSurfaceImage writeSurfaceImage:toFileDescriptor:]((uint64_t)BSUIMappedSurfaceImage, *(void **)(a1 + 32), a2);
}

id ___workBlockGenerator_block_invoke_3(uint64_t a1, void *a2)
{
  +[BSUIMappedSurfaceImage mappedSurfaceImageFromPath:loadEagerly:]((uint64_t)BSUIMappedSurfaceImage, a2, (*(_DWORD *)(a1 + 32) >> 1) & 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t ___workBlockGenerator_block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;
  CGImage *v3;
  CGImage *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  CFNumberRef v8;
  const void *v9;
  CGColorSpace *ColorSpace;
  uint64_t valuePtr;
  uint8_t buf[4];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 40);
  v2 = objc_retainAutorelease(*(id *)(a1 + 32));
  v3 = (CGImage *)objc_msgSend(v2, "CGImage");
  v4 = v3;
  if (v3)
  {
    if ((v1 & 4) == 0 && (v1 & 8) == 0 && !CGImageIsMask(v3) && (CGImageHasAlpha() & 1) == 0)
    {
      ColorSpace = CGImageGetColorSpace(v4);
      if (CGColorSpaceGetNumberOfComponents(ColorSpace) >= 3)
        CGImageGetBitsPerComponent(v4);
    }
    objc_msgSend(v2, "scale");
    valuePtr = v7;
    if ((BSFloatIsOne() & 1) != 0)
      v8 = 0;
    else
      v8 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberCGFloatType, &valuePtr);
    v9 = (const void *)CPBitmapWriterCreateWithFileDescriptor();
    if (v9)
    {
      v6 = CPBitmapWriterAddImage();
      CPBitmapWriterFinalize();
      CFRelease(v9);
      if (!v8)
        goto LABEL_17;
      goto LABEL_16;
    }
    v6 = 0;
    if (v8)
LABEL_16:
      CFRelease(v8);
  }
  else
  {
    BSLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0234000, v5, OS_LOG_TYPE_ERROR, "BSUIMappedImageCache: error serializing non-CGImage to CPBitmap", buf, 2u);
    }

    v6 = 0;
  }
LABEL_17:

  return v6;
}

void sub_1A023FAF0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id ___workBlockGenerator_block_invoke_5(uint64_t a1, void *a2)
{
  _readCPBitmapImageFromPathWithOptions(a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

void ___workBlockGenerator_block_invoke_203(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  BOOL v5;
  NSObject *v6;
  void *v7;
  const std::__fs::filesystem::path *v8;
  const std::__fs::filesystem::path *v9;
  std::error_code *v10;
  int v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD block[4];
  id v21;
  id v22;
  char v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  NSObject *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = *(_QWORD *)(a1 + 56);
  if (v2 == *(_QWORD *)(a1 + 48) || (v5 = v2 == v4, v4 = v2, v5))
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v4, *(_QWORD *)(a1 + 40));
    if (*(_QWORD *)(a1 + 64) == *(_QWORD *)(a1 + 56))
    {
      __pathForKeyAndExtension(*(void **)(a1 + 72), *(void **)(a1 + 40), *(void **)(a1 + 80));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (const std::__fs::filesystem::path *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 88)), "fileSystemRepresentation");
      v6 = objc_retainAutorelease(v7);
      v9 = (const std::__fs::filesystem::path *)-[NSObject fileSystemRepresentation](v6, "fileSystemRepresentation");
      rename(v8, v9, v10);
      if (v11)
      {
        unlink((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 88)), "fileSystemRepresentation"));
        BSLogCommon();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v19 = *(_QWORD *)(a1 + 88);
          *(_DWORD *)buf = 138543618;
          v25 = v19;
          v26 = 2114;
          v27 = v6;
          _os_log_error_impl(&dword_1A0234000, v12, OS_LOG_TYPE_ERROR, " **** failed to move item at tempPath=%{public}@ to path=%{public}@ : leaving in cache but it won't survive process termination", buf, 0x16u);
        }

      }
    }
    else
    {
      if (*(_DWORD *)(a1 + 112) == -1)
        goto LABEL_15;
      unlink((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 88)), "fileSystemRepresentation"));
      BSLogCommon();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v18 = *(_QWORD *)(a1 + 88);
        *(_DWORD *)buf = 138543362;
        v25 = v18;
        _os_log_error_impl(&dword_1A0234000, v6, OS_LOG_TYPE_ERROR, " **** failed to write item at tempPath=%{public}@", buf, 0xCu);
      }
    }

  }
  else if (*(_DWORD *)(a1 + 112) != -1)
  {
    unlink((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 88)), "fileSystemRepresentation"));
  }
LABEL_15:
  v13 = *(_DWORD *)(a1 + 112);
  if (v13 == -1)
  {
    BSLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(a1 + 88);
      *(_DWORD *)buf = 138543362;
      v25 = v17;
      _os_log_error_impl(&dword_1A0234000, v14, OS_LOG_TYPE_ERROR, " **** failed to open fd at tempPath=%{public}@", buf, 0xCu);
    }

  }
  else
  {
    close(v13);
  }
  v15 = *(void **)(a1 + 104);
  if (v15)
  {
    v16 = *(NSObject **)(a1 + 96);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___workBlockGenerator_block_invoke_204;
    block[3] = &unk_1E4348EB8;
    v22 = v15;
    v23 = *(_BYTE *)(a1 + 116);
    v21 = *(id *)(a1 + 64);
    dispatch_async(v16, block);

  }
}

void sub_1A023FE30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t ___workBlockGenerator_block_invoke_204(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

id BSUISurfaceWithColorSpaceAndDrawBlock(uint64_t a1, CGColorSpace *a2, void *a3, double a4, double a5, double a6)
{
  id v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  _QWORD *v16;
  void *v17;
  CGColorSpace *v18;
  CGColorSpace *v19;
  CGColorSpaceRef v20;
  CGColorSpace *v21;
  CGColorSpace *DeviceRGB;
  CGContext *v23;
  CGContext *v24;
  id v25;
  CGColorSpace *v26;
  id v27;
  void *v29;
  void *v30;
  _QWORD *v31;
  _QWORD v32[2];
  void (*v33)(uint64_t, uint64_t, CGColorSpace *);
  void *v34;
  uint64_t *v35;
  _QWORD v36[2];
  void (*v37)(uint64_t, CGContext *);
  void *v38;
  id v39;
  double v40;
  double v41;
  double v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  CGRect v50;

  v11 = a3;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "IOSurface *BSUISurfaceWithColorSpaceAndDrawBlock(CGSize, CGFloat, BSIOSurfaceOptions, CGColorSpaceRef, __strong BSBlock)");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, CFSTR("BSUIImageUtilities.m"), 104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("drawBlock"), 0);

  }
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__0;
  v47 = __Block_byref_object_dispose__0;
  v48 = 0;
  v12 = vcvtpd_u64_f64(a4 * a6);
  v13 = vcvtpd_u64_f64(a5 * a6);
  v14 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v37 = __BSUISurfaceWithColorSpaceAndDrawBlock_block_invoke;
  v38 = &unk_1E4348F30;
  v40 = a4;
  v41 = a5;
  v42 = a6;
  v15 = v11;
  v39 = v15;
  v32[0] = v14;
  v32[1] = 3221225472;
  v33 = __BSUISurfaceWithColorSpaceAndDrawBlock_block_invoke_2;
  v34 = &unk_1E4348F58;
  v35 = &v43;
  v31 = v36;
  v16 = v32;
  v49 = a1;
  v17 = (void *)objc_msgSend(MEMORY[0x1E0CBBEA0], "bs_IOSurfaceWithWidth:height:options:", v12, v13, &v49);
  if (v17)
  {
    v18 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
    v19 = v18;
    if ((v49 & 2) != 0)
      v20 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D960]);
    else
      v20 = CGColorSpaceRetain(v18);
    v21 = v20;
    if (a2)
    {
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      if (CGColorSpaceEqualToColorSpace())
        a2 = v19;
      CGColorSpaceRelease(DeviceRGB);
    }
    if (!a2)
      a2 = v21;
    if (v21)
    {
      v23 = (CGContext *)CGIOSurfaceContextCreate();
      v24 = v23;
      if (v23)
      {
        if ((a1 & 1) != 0)
        {
          CGContextSaveGState(v23);
          objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
          v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          CGContextSetFillColorWithColor(v24, (CGColorRef)objc_msgSend(v25, "CGColor"));

          v50.size.width = (double)v12;
          v50.size.height = (double)v13;
          v50.origin.x = 0.0;
          v50.origin.y = 0.0;
          CGContextFillRect(v24, v50);
          CGContextRestoreGState(v24);
        }
        v37((uint64_t)v31, v24);
        if (CGColorSpaceEqualToColorSpace())
          v26 = 0;
        else
          v26 = a2;
        v33((uint64_t)v16, (uint64_t)v24, v26);
        CGContextRelease(v24);
      }
      CGColorSpaceRelease(v21);
    }
    CGColorSpaceRelease(v19);
  }

  v27 = (id)v44[5];
  _Block_object_dispose(&v43, 8);

  return v27;
}

void sub_1A02401D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;

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

void sub_1A02403F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A0240548(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

id BSUISurfaceImageWithColorSpaceAndDrawBlock(uint64_t a1, CGColorSpace *a2, void *a3, double a4, double a5, double a6)
{
  id v11;
  const void *v12;
  void *v13;

  v11 = a3;
  BSUISurfaceWithColorSpaceAndDrawBlock(a1, a2, v11, a4, a5, a6);
  v12 = (const void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "_initWithIOSurface:scale:orientation:", v12, 0, a6);
    CFRelease(v12);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void sub_1A0240634(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0240758(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A024085C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0240B00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A0240D9C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A0240E88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A024100C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id BSLutIdentifierForName(void *a1, int a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a1;
  v4 = v3;
  if (a2)
  {
    objc_msgSend(CFSTR("luminance_reduced_"), "stringByAppendingString:", v3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v3;
  }
  v6 = v5;

  return v6;
}

void sub_1A02410A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0241144(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A0241314(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A0241410(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1A024154C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A0241668(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A0241774(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A0241890(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A02419A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A0241B00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0241B70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)BSUIRelativeDateLabel;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1A024215C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0242274(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A0242364(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A0242444(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A02426C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1A02427E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A02428FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A02429B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A0242F14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

BOOL __writeDataToFileDescriptor(int __fd, uint64_t a2, unint64_t a3)
{
  unint64_t i;
  ssize_t v7;

  if (!a3)
    return 1;
  for (i = 0; i < a3; i += v7 & ~(v7 >> 63))
  {
    v7 = write(__fd, (const void *)(a2 + i), a3 - i);
    if (v7 < 0)
      break;
  }
  return v7 >= 0;
}

void sub_1A0243840(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1A0243C00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1A0243ECC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;

  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a23, 8);

  _Block_object_dispose((const void *)(v31 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A0244008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A02443A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{

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

void sub_1A024455C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0244640(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0244774(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0244804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)BSUIDateLabelFactory;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1A02449A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1A0244B44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A0244BE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t _BSUI_Private_IsN84()
{
  if (qword_1ECEC3940 != -1)
    dispatch_once(&qword_1ECEC3940, &__block_literal_global_3);
  return _MergedGlobals_11;
}

void sub_1A0244CB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A0244D48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0244DB0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0244E0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0244E68(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0244EC4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0244F20(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0244F7C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0244FD8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0245034(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A02450A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0245158(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0245204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A024529C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A0245388(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A0245424(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0245518(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0245618(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0245890(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24)
{
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  _Unwind_Resume(a1);
}

void sub_1A024598C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_1A0245AAC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0245B18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A0245CE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24)
{
  void *v24;
  void *v25;
  void *v26;

  _Unwind_Resume(a1);
}

void sub_1A0245DB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_1A0245EE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0245F60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A0245FE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0246078(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A02460EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0246168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A02461EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)BSUIScrollView;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1A02463A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1A0246570(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1A0246694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  id *v13;
  void *v14;
  uint64_t v15;

  objc_destroyWeak(v13);
  objc_destroyWeak((id *)(v15 - 56));
  _Unwind_Resume(a1);
}

void sub_1A024671C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A02467A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A024688C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A024696C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0246ACC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1A0246BD4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A0246CE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A0246DF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A0246F38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0247088(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A024719C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A0247238(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1A02472B8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1A02474A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A0247618(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A02476F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A02478A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1A02479E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A0247B90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1A0247D6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A0247EEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0247FD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;

  a9.super_class = (Class)BSUIMappedImageCacheFuture;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1A02481C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0248310(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0248574(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A0248780(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A02487EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)BSUIDefaultDateLabel;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1A0248B70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

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

void sub_1A0248C34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0248CB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A0248D40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A0248DD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A0248EDC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A0248F18()
{
  JUMPOUT(0x1A0248F08);
}

void sub_1A0248FA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A0249130(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A02493E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1A0249DE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1A024A044(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A024A240(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A024A648(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A024A700(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A024AC90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A024ADD8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A024B018(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A024B2DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A024B444(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A024B4D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A024B55C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A024B6FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A024B7A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A024B9B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A024BF54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void _setLayerFilters(void *a1, void *a2)
{
  uint64_t v3;
  unint64_t v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id obj;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  uint64_t i;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v36 = a1;
  v33 = a2;
  if (qword_1ECEC3980 != -1)
    dispatch_once(&qword_1ECEC3980, &__block_literal_global_145);
  v34 = (id)qword_1ECEC3978;
  objc_msgSend(v36, "filters");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v30, "count");
  if (v3 != objc_msgSend(v33, "count"))
    goto LABEL_12;
  v4 = 0;
  v5 = 0;
  while (v4 < objc_msgSend(v33, "count"))
  {
    objc_msgSend(v30, "objectAtIndexedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectAtIndexedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_11;
    objc_msgSend(v6, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = BSEqualObjects();

    if (!v11
      || (objc_msgSend(v6, "type"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "type"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = BSEqualObjects(),
          v13,
          v12,
          !v14))
    {
LABEL_11:

      goto LABEL_12;
    }
    objc_msgSend(v7, "type");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    ++v4;
    v5 = 1;
    if (!v16)
      goto LABEL_12;
  }
  if ((v5 & 1) != 0)
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = v33;
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v32)
    {
      v31 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v42 != v31)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend(v17, "type");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v20 = v19;
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
          if (v21)
          {
            v22 = *(_QWORD *)v38;
            do
            {
              for (j = 0; j != v21; ++j)
              {
                if (*(_QWORD *)v38 != v22)
                  objc_enumerationMutation(v20);
                v24 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j);
                v25 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v17, "name");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "stringWithFormat:", CFSTR("filters.%@.%@"), v26, v24);
                v27 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v17, "valueForKey:", v24);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "setValue:forKeyPath:", v28, v27);

              }
              v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
            }
            while (v21);
          }

        }
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v32);
    }

  }
  else
  {
LABEL_12:
    objc_msgSend(v36, "setFilters:", v33);
  }

}

void sub_1A024C444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, void *a15, void *a16, uint64_t a17, void *a18)
{

  _Unwind_Resume(a1);
}

void sub_1A024C7CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A024C9DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A024CA4C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A024CAA0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A024CAFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A024CB5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A024CC04(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A024CDE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A024CF08(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A024CFE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A024D06C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___filterPropertyKeysByType_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[2];
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v10[0] = *MEMORY[0x1E0CD2BF0];
  v9 = *MEMORY[0x1E0CD2D20];
  v0 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v1;
  v10[1] = *MEMORY[0x1E0CD2F08];
  v8 = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v2;
  v10[2] = *MEMORY[0x1E0CD2C88];
  v3 = *MEMORY[0x1E0CD2D58];
  v7[0] = *MEMORY[0x1E0CD2D90];
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_1ECEC3978;
  qword_1ECEC3978 = v5;

}

void sub_1A024D1C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

uint64_t BSDateAtStartOfDay()
{
  return MEMORY[0x1E0D01180]();
}

uint64_t BSDegreesToRadians()
{
  return MEMORY[0x1E0D01190]();
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x1E0D01208]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x1E0D01220]();
}

uint64_t BSDispatchQueueAssertNot()
{
  return MEMORY[0x1E0D01228]();
}

uint64_t BSDispatchQueueCreateWithQualityOfService()
{
  return MEMORY[0x1E0D01250]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1E0D01280]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x1E0D01290]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x1E0D012D0]();
}

uint64_t BSFloatIsOne()
{
  return MEMORY[0x1E0D012F0]();
}

uint64_t BSFloatIsZero()
{
  return MEMORY[0x1E0D012F8]();
}

uint64_t BSInterfaceOrientationDescription()
{
  return MEMORY[0x1E0D01340]();
}

uint64_t BSIntervalClip()
{
  return MEMORY[0x1E0D01370]();
}

uint64_t BSIntervalInterpolate()
{
  return MEMORY[0x1E0D01380]();
}

uint64_t BSIntervalMax()
{
  return MEMORY[0x1E0D01390]();
}

uint64_t BSIntervalMin()
{
  return MEMORY[0x1E0D01398]();
}

uint64_t BSIntervalValueForFraction()
{
  return MEMORY[0x1E0D013B8]();
}

uint64_t BSLogCommon()
{
  return MEMORY[0x1E0D013E0]();
}

uint64_t BSPointEqualToPoint()
{
  return MEMORY[0x1E0D01480]();
}

uint64_t BSTemporaryFileAtPath()
{
  return MEMORY[0x1E0D01638]();
}

uint64_t CAColorMatrixConcat()
{
  return MEMORY[0x1E0CD2330]();
}

BOOL CAFrameRateRangeIsEqualToRange(CAFrameRateRange range, CAFrameRateRange other)
{
  return MEMORY[0x1E0CD23C8](*(__n128 *)&range.minimum, *(__n128 *)&range.maximum, *(__n128 *)&range.preferred, *(__n128 *)&other.minimum, *(__n128 *)&other.maximum, *(__n128 *)&other.preferred);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2640](retstr, sx, sy, sz);
}

uint64_t CEMEnumerateEmojiTokensInStringWithBlock()
{
  return MEMORY[0x1E0D15DA8]();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x1E0C98660](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x1E0C98670](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0C98AA0](allocator, propertyList, format, options, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C40]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x1E0C98C80](rl, mode, block);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BA90](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAB0](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD0](retstr, angle);
}

CFPropertyListRef CGColorSpaceCopyPropertyList(CGColorSpaceRef space)
{
  return (CFPropertyListRef)MEMORY[0x1E0C9BDC0](space);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE50](name);
}

uint64_t CGColorSpaceEqualToColorSpace()
{
  return MEMORY[0x1E0C9BE68]();
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BED8](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

CGColorSpaceRef CGColorSpaceRetain(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BF38](space);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGAffineTransform *__cdecl CGContextGetCTM(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9C250](retstr, c);
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

uint64_t CGContextSetBaseCTM()
{
  return MEMORY[0x1E0C9C3C0]();
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x1E0C9C588](c, tx, ty);
}

uint64_t CGIOSurfaceContextCreate()
{
  return MEMORY[0x1E0C9CAD8]();
}

uint64_t CGIOSurfaceContextGetSurface()
{
  return MEMORY[0x1E0C9CAF8]();
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1E0C9CBF8](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9CC20](image);
}

uint64_t CGImageHasAlpha()
{
  return MEMORY[0x1E0C9CCD8]();
}

BOOL CGImageIsMask(CGImageRef image)
{
  return MEMORY[0x1E0C9CCE8](image);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t CPBitmapCreateImagesFromData()
{
  return MEMORY[0x1E0CFA1C8]();
}

uint64_t CPBitmapCreateMappedDataFromPath()
{
  return MEMORY[0x1E0CFA1D8]();
}

uint64_t CPBitmapWriterAddImage()
{
  return MEMORY[0x1E0CFA1E8]();
}

uint64_t CPBitmapWriterCreateWithFileDescriptor()
{
  return MEMORY[0x1E0CFA1F8]();
}

uint64_t CPBitmapWriterFinalize()
{
  return MEMORY[0x1E0CFA208]();
}

CFDictionaryRef IOSurfaceCopyAllValues(IOSurfaceRef buffer)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBBAE0](buffer);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x1E0CBBAF0](properties);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBB38](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1E0CBBB40](buffer);
}

void *__cdecl IOSurfaceGetBaseAddressOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return (void *)MEMORY[0x1E0CBBB68](buffer, planeIndex);
}

size_t IOSurfaceGetBytesPerElementOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1E0CBBB88](buffer, planeIndex);
}

size_t IOSurfaceGetBytesPerRowOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1E0CBBBA0](buffer, planeIndex);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC28](buffer);
}

size_t IOSurfaceGetHeightOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1E0CBBC38](buffer, planeIndex);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC68](buffer);
}

size_t IOSurfaceGetPlaneCount(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC70](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBCE0](buffer);
}

size_t IOSurfaceGetWidthOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1E0CBBCF0](buffer, planeIndex);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1E0CBBD28](buffer, *(_QWORD *)&options, seed);
}

void IOSurfaceSetValue(IOSurfaceRef buffer, CFStringRef key, CFTypeRef value)
{
  MEMORY[0x1E0CBBE40](buffer, key, value);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1E0CBBE88](buffer, *(_QWORD *)&options, seed);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

void UIGraphicsBeginImageContext(CGSize size)
{
  MEMORY[0x1E0CEB628]((__n128)size, *(__n128 *)&size.height);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x1E0CEB638]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1E0CEB648]();
}

void UIGraphicsPopContext(void)
{
  MEMORY[0x1E0CEB650]();
}

void UIGraphicsPushContext(CGContextRef context)
{
  MEMORY[0x1E0CEB658](context);
}

uint64_t UIIntegralTransform()
{
  return MEMORY[0x1E0CEB718]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _UIWindowConvertPointFromOrientationToOrientation()
{
  return MEMORY[0x1E0CEC338]();
}

uint64_t _UIWindowConvertRectFromOrientationToOrientation()
{
  return MEMORY[0x1E0CEC340]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x1E0D018D8]();
}

uint64_t _dirhelper_relative()
{
  return MEMORY[0x1E0C80CD0]();
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

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C83C38](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1E0C83E60](a1, a2, *(_QWORD *)&a3);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
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

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

