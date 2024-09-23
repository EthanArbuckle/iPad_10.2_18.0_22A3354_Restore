__CFDictionary *ABPKcreateAttributeDictionaryNewWithZeroCopyOption(unsigned int a1, unsigned int a2, int a3, int a4)
{
  const __CFAllocator *v5;
  __CFDictionary *Mutable;
  CFNumberRef v7;
  CFNumberRef v8;
  CFMutableDictionaryRef v9;
  CFMutableDictionaryRef v10;
  CFNumberRef v11;
  CFNumberRef v12;
  CFNumberRef v13;
  CFNumberRef v14;
  CFNumberRef v15;
  CFNumberRef v16;
  uint64_t v18;
  unint64_t v19;

  v19 = __PAIR64__(a1, a2);
  LODWORD(v18) = 16;
  HIDWORD(v18) = a3;
  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (Mutable)
  {
    v7 = CFNumberCreate(v5, kCFNumberIntType, (char *)&v18 + 4);
    if (!v7)
      goto LABEL_9;
    v8 = v7;
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDC56B8], v7);
    CFRelease(v8);
    v9 = CFDictionaryCreateMutable(v5, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (!v9)
      goto LABEL_9;
    v10 = v9;
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDC5668], v9);
    CFRelease(v10);
    v11 = CFNumberCreate(v5, kCFNumberIntType, (char *)&v19 + 4);
    if (!v11)
      goto LABEL_9;
    v12 = v11;
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDC5708], v11);
    CFRelease(v12);
    v13 = CFNumberCreate(v5, kCFNumberIntType, &v19);
    if (!v13)
      goto LABEL_9;
    v14 = v13;
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDC5650], v13);
    CFRelease(v14);
    v15 = CFNumberCreate(v5, kCFNumberIntType, &v18);
    if (v15)
    {
      v16 = v15;
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDC56C8], v15);
      CFRelease(v16);
      if (a4)
        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDC55D0], (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 64, v18, v19));
    }
    else
    {
LABEL_9:
      CFRelease(Mutable);
      return 0;
    }
  }
  return Mutable;
}

uint64_t ABPK_pixelBufferPoolCreateNewWithZeroCopyOption(unsigned int a1, unsigned int a2, int a3, CVPixelBufferPoolRef *a4, int a5)
{
  __CFDictionary *v6;
  __CFDictionary *v7;
  uint64_t v8;

  v6 = ABPKcreateAttributeDictionaryNewWithZeroCopyOption(a1, a2, a3, a5);
  if (v6)
  {
    v7 = v6;
    v8 = CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, v6, a4);
    CFRelease(v7);
    if (!(_DWORD)v8)
      return v8;
  }
  else
  {
    v8 = 4294960636;
  }
  *a4 = 0;
  return v8;
}

uint64_t ABPKRecreatePixelBufferPoolOnConfigurationChangesWithZeroCopyOption(CVPixelBufferPoolRef *a1, int a2, int a3, double a4, double a5)
{
  __CVPixelBufferPool *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t NewWithZeroCopyOption;
  NSObject *v19;
  CVPixelBufferPoolRef v20;
  NSObject *v21;
  int v23;
  CVPixelBufferPoolRef v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v10 = *a1;
  if (v10)
  {
    CVPixelBufferPoolGetPixelBufferAttributes(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDC5708]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "integerValue");

    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDC5650]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "integerValue");

    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDC56B8]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "integerValue");

    if (v13 == (int)a4 && v15 == (int)a5)
    {

      if (v17 == a2)
        return 0;
    }
    else
    {

    }
  }
  else
  {
    v13 = 0;
    v15 = 0;
    v17 = 0;
  }
  __ABPKLogSharedInstance();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = *a1;
    v23 = 134219520;
    v24 = v20;
    v25 = 2048;
    v26 = v13;
    v27 = 2048;
    v28 = v15;
    v29 = 2048;
    v30 = v17;
    v31 = 1024;
    v32 = (int)a4;
    v33 = 1024;
    v34 = (int)a5;
    v35 = 1024;
    v36 = a2;
    _os_log_impl(&dword_210836000, v19, OS_LOG_TYPE_INFO, " ARSystemTools: Recreating pixel buffer pool (%p) due to configuration changes: %li,%li/%li => %i,%i/%i ", (uint8_t *)&v23, 0x3Cu);
  }

  if (*a1)
  {
    CVPixelBufferPoolRelease(*a1);
    *a1 = 0;
  }
  NewWithZeroCopyOption = ABPK_pixelBufferPoolCreateNewWithZeroCopyOption((int)a4, (int)a5, a2, a1, a3);
  if ((_DWORD)NewWithZeroCopyOption)
  {
    __ABPKLogSharedInstance();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_210836000, v21, OS_LOG_TYPE_ERROR, " ARSystemTools: Could not create pixel buffer pool. ", (uint8_t *)&v23, 2u);
    }

  }
  return NewWithZeroCopyOption;
}

CVPixelBufferRef ABPKCreateCVPixelBufferFromPoolWithZeroCopyOption(CVPixelBufferPoolRef *a1, int a2, void *a3, void *a4, int a5, double a6, double a7)
{
  id v13;
  id v14;
  CVReturn v15;
  CVReturn v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  const char *v20;
  CVReturn v21;
  CVReturn v22;
  objc_class *v23;
  CVPixelBufferRef v24;
  CVPixelBufferRef pixelBufferOut;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  CVReturn v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  pixelBufferOut = 0;
  v15 = ABPKRecreatePixelBufferPoolOnConfigurationChangesWithZeroCopyOption(a1, a2, a5, a6, a7);
  if (v15)
  {
    v16 = v15;
    __ABPKLogSharedInstance();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v28 = v19;
      v29 = 2048;
      v30 = v13;
      v31 = 2112;
      v32 = v14;
      v33 = 1024;
      v34 = v16;
      v20 = " %@(%p): Unable to configure pixelbuffer pool for %@: %i ";
LABEL_7:
      _os_log_impl(&dword_210836000, v17, OS_LOG_TYPE_ERROR, v20, buf, 0x26u);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v21 = CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x24BDBD240], *a1, &pixelBufferOut);
  if (v21)
  {
    v22 = v21;
    __ABPKLogSharedInstance();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v28 = v19;
      v29 = 2048;
      v30 = v13;
      v31 = 2112;
      v32 = v14;
      v33 = 1024;
      v34 = v22;
      v20 = " %@(%p): Unable to create pixel buffer for %@: %i ";
      goto LABEL_7;
    }
LABEL_8:

  }
  v24 = pixelBufferOut;

  return v24;
}

void sub_2108383EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210838530(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void abpk::GetRawDetectionXYVisbilityWithRawDetection2D(abpk *this@<X0>, float64x2_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  float v9;
  double v10;
  abpk *v11;

  v11 = this;
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  *(_QWORD *)a3 = 0;
  std::vector<std::array<float,3ul>>::reserve((char **)a3, 0x10uLL);
  v6 = -[abpk rawJointsOutput](v11, "rawJointsOutput");
  v7 = -[abpk jointTrackingStates](v11, "jointTrackingStates");
  v8 = *(char **)a3;
  if (*(float *)(*(_QWORD *)a3 + 92) != 0.0 && *((float *)v8 + 29) != 0.0)
  {
    v9 = *((float *)v8 + 25);
    v10 = (float)(*((float *)v8 + 21) - *((float *)v8 + 24));
    *(float *)&v10 = sqrt(v10 * v10 + (float)(*((float *)v8 + 22) - v9) * (float)(*((float *)v8 + 22) - v9));
    *(float *)&v10 = v9 + *(float *)&v10 * -0.5;
    *((_DWORD *)v8 + 28) = LODWORD(v10);
  }

}

void sub_210838808(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
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

void std::vector<std::array<float,3ul>>::reserve(char **a1, unint64_t a2)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;
  int v14;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - *a1) >> 2) < a2)
  {
    if (a2 >= 0x1555555555555556)
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    v5 = (a1[1] - *a1) / 12;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::array<float,3ul>>>(v3, a2);
    v7 = &v6[12 * v5];
    v9 = &v6[12 * v8];
    v11 = *a1;
    v10 = a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        v13 = *(_QWORD *)(v10 - 12);
        v10 -= 12;
        v14 = *((_DWORD *)v10 + 2);
        *(_QWORD *)(v12 - 12) = v13;
        v12 -= 12;
        *((_DWORD *)v12 + 2) = v14;
      }
      while (v10 != v11);
      v10 = *a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

void `anonymous namespace'::XYVisbilityConvertionHelper(char **a1, uint64_t a2, uint64_t a3, float64x2_t *a4, uint64_t a5)
{
  float32x2_t v6;
  float v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  float32x2_t v16;
  float v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char *v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char *v30;
  char *v31;
  char *v32;
  char *v34;
  char *v35;
  uint64_t v36;
  int v37;
  char *v38;
  uint64_t v39;
  int v40;

  v6 = *(float32x2_t *)(a2 + 8 * a5);
  if (v6.f32[0] == -1.0 || COERCE_FLOAT(HIDWORD(*(_QWORD *)(a2 + 8 * a5))) == -1.0)
  {
    v8 = (float)*(unsigned int *)(a3 + 4 * a5);
    v9 = (uint64_t)(a1 + 2);
    v10 = (unint64_t)a1[2];
    v11 = (unint64_t)a1[1];
    if (v11 < v10)
    {
      __asm { FMOV            V0.2S, #-1.0 }
      *(_QWORD *)v11 = _D0;
      *(float *)(v11 + 8) = v8;
LABEL_10:
      v20 = (char *)(v11 + 12);
      goto LABEL_37;
    }
    v21 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v11 - (_QWORD)*a1) >> 2);
    v22 = v21 + 1;
    if (v21 + 1 <= 0x1555555555555555)
    {
      v23 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v10 - (_QWORD)*a1) >> 2);
      if (2 * v23 > v22)
        v22 = 2 * v23;
      if (v23 >= 0xAAAAAAAAAAAAAAALL)
        v24 = 0x1555555555555555;
      else
        v24 = v22;
      if (v24)
        v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::array<float,3ul>>>(v9, v24);
      else
        v25 = 0;
      v31 = &v25[12 * v21];
      v32 = &v25[12 * v24];
      __asm { FMOV            V0.2S, #-1.0 }
      *(_QWORD *)v31 = _D0;
      *((float *)v31 + 2) = v8;
      v20 = v31 + 12;
      v35 = *a1;
      v34 = a1[1];
      if (v34 == *a1)
        goto LABEL_35;
      do
      {
        v36 = *(_QWORD *)(v34 - 12);
        v34 -= 12;
        v37 = *((_DWORD *)v34 + 2);
        *(_QWORD *)(v31 - 12) = v36;
        v31 -= 12;
        *((_DWORD *)v31 + 2) = v37;
      }
      while (v34 != v35);
      goto LABEL_34;
    }
LABEL_38:
    std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
  }
  v16 = vcvt_f32_f64(vmulq_f64(*a4, vcvtq_f64_f32(v6)));
  v17 = (float)*(unsigned int *)(a3 + 4 * a5);
  v18 = (uint64_t)(a1 + 2);
  v19 = (unint64_t)a1[2];
  v11 = (unint64_t)a1[1];
  if (v11 < v19)
  {
    *(float32x2_t *)v11 = v16;
    *(float *)(v11 + 8) = v17;
    goto LABEL_10;
  }
  v26 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v11 - (_QWORD)*a1) >> 2);
  v27 = v26 + 1;
  if (v26 + 1 > 0x1555555555555555)
    goto LABEL_38;
  v28 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v19 - (_QWORD)*a1) >> 2);
  if (2 * v28 > v27)
    v27 = 2 * v28;
  if (v28 >= 0xAAAAAAAAAAAAAAALL)
    v29 = 0x1555555555555555;
  else
    v29 = v27;
  if (v29)
    v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::array<float,3ul>>>(v18, v29);
  else
    v30 = 0;
  v31 = &v30[12 * v26];
  v32 = &v30[12 * v29];
  *(float32x2_t *)v31 = v16;
  *((float *)v31 + 2) = v17;
  v20 = v31 + 12;
  v38 = *a1;
  v34 = a1[1];
  if (v34 == *a1)
    goto LABEL_35;
  do
  {
    v39 = *(_QWORD *)(v34 - 12);
    v34 -= 12;
    v40 = *((_DWORD *)v34 + 2);
    *(_QWORD *)(v31 - 12) = v39;
    v31 -= 12;
    *((_DWORD *)v31 + 2) = v40;
  }
  while (v34 != v38);
LABEL_34:
  v34 = *a1;
LABEL_35:
  *a1 = v31;
  a1[1] = v20;
  a1[2] = v32;
  if (v34)
    operator delete(v34);
LABEL_37:
  a1[1] = v20;
}

void abpk::Normalize2DCoordinates(float32x2_t **a1, uint64_t *a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  float32x2_t *v7;
  float32x2_t *v8;
  float64x2_t v9;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float32x2_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  __ABPKLogSharedInstance();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = *a2;
    v6 = a2[1];
    v19 = 134218240;
    v20 = v5;
    v21 = 2048;
    v22 = v6;
    _os_log_impl(&dword_210836000, v4, OS_LOG_TYPE_DEBUG, " \t Normalizing the raw 2D x and y coordinates with image width = %f and height = %f ", (uint8_t *)&v19, 0x16u);
  }

  v7 = *a1;
  v8 = a1[1];
  if (*a1 != v8)
  {
    v9 = (float64x2_t)vdupq_lane_s64(*a2, 0);
    __asm { FMOV            V1.2D, #-1.0 }
    _Q1.f64[1] = *((double *)a2 + 1) / *(double *)a2;
    do
    {
      if (v7[1].f32[0] == 0.0)
      {
        v18 = 0;
      }
      else
      {
        v15 = vcvtq_f64_f32(*v7);
        v16 = vdivq_f64(vaddq_f64(v15, v15), v9);
        *(_QWORD *)&v17.f64[0] = *(_OWORD *)&vaddq_f64(v16, _Q1);
        v17.f64[1] = vsubq_f64(v16, _Q1).f64[1];
        v18 = vcvt_f32_f64(v17);
      }
      *v7 = v18;
      v7 = (float32x2_t *)((char *)v7 + 12);
    }
    while (v7 != v8);
  }
}

void abpk::Normalize2DCoordinatesSquareCrop(float **a1, double *a2, uint64_t a3)
{
  float v5;
  float v6;
  NSObject *v7;
  double v8;
  double v9;
  float *v10;
  float *v11;
  double v12;
  double v13;
  float v14;
  float v15;
  BOOL v17;
  float v18;
  float v19;
  int v20;
  double v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = *a2;
  v6 = a2[1];
  __ABPKLogSharedInstance();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v5;
  v9 = v6;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v20 = 134218240;
    v21 = v5;
    v22 = 2048;
    v23 = v6;
    _os_log_impl(&dword_210836000, v7, OS_LOG_TYPE_DEBUG, " \t Normalizing the raw 2D x and y coordinates with image width = %f and height = %f. Center cropping in normalization for better model performance. ", (uint8_t *)&v20, 0x16u);
  }

  v10 = *a1;
  v11 = a1[1];
  if (*a1 != v11)
  {
    v12 = (float)(v5 - v6) * 0.5;
    v13 = (float)(v6 - v5) * 0.5;
    do
    {
      v15 = *v10;
      v14 = v10[1];
      if ((unint64_t)(a3 - 1) > 1)
      {
        if ((unint64_t)(a3 - 3) > 1 || (v12 <= v15 ? (v17 = v8 - v12 < v15) : (v17 = 1), !v17))
        {
LABEL_18:
          if (v10[2] == 0.0)
          {
            v18 = 0.0;
            v19 = 0.0;
          }
          else
          {
            v18 = (v15 + v15) / v8 + -1.0;
            v19 = (v14 + v14) / v8 - v9 / v8;
          }
          *v10 = v18;
          v10[1] = v19;
          goto LABEL_22;
        }
      }
      else if (v13 <= v14 && v9 - v13 >= v14)
      {
        goto LABEL_18;
      }
      *(_QWORD *)v10 = 0;
      v10[2] = 0.0;
LABEL_22:
      v10 += 3;
    }
    while (v10 != v11);
  }
}

void std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24CA6E260, MEMORY[0x24BEDAAF0]);
}

void sub_210838E2C(_Unwind_Exception *a1)
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::array<float,3ul>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x1555555555555556)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(12 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void sub_210839CB8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210839D14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)ABPKRetargeting;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_21083A198(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21083A65C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

int32x2_t *distanceBetweenTwoPoses(int32x2_t *result, float32x2_t *a2, uint64_t a3)
{
  float i;
  float32x4_t v4;
  float32x2_t v5;

  for (i = 0.0; a3; --a3)
  {
    *(int32x2_t *)v4.f32 = vrev64_s32(*result);
    *(float32x2_t *)&v4.u32[2] = *a2;
    if ((vmaxv_u16((uint16x4_t)vmovn_s32(vcltzq_f32(v4))) & 1) == 0)
    {
      v5 = vsub_f32((float32x2_t)*result, *a2);
      i = i + sqrtf(vaddv_f32(vmul_f32(v5, v5)));
    }
    ++a2;
    ++result;
  }
  return result;
}

{
  float i;
  float32x4_t v4;
  float32x2_t v5;

  for (i = 0.0; a3; --a3)
  {
    *(int32x2_t *)v4.f32 = vrev64_s32(*result);
    *(float32x2_t *)&v4.u32[2] = *a2;
    if ((vmaxv_u16((uint16x4_t)vmovn_s32(vcltzq_f32(v4))) & 1) == 0)
    {
      v5 = vsub_f32((float32x2_t)*result, *a2);
      i = i + sqrtf(vaddv_f32(vmul_f32(v5, v5)));
    }
    ++a2;
    ++result;
  }
  return result;
}

BOOL isValueInVector(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD **)a1;
  v3 = *(_QWORD *)(a1 + 8) - *(_QWORD *)a1;
  if (!v3)
    return 0;
  v4 = v3 >> 3;
  if (v4 <= 1)
    v5 = 1;
  else
    v5 = v4;
  if (*v2 == a2)
    return 1;
  v7 = 1;
  do
  {
    v8 = v7;
    if (v5 == v7)
      break;
    v9 = v2[v7++];
  }
  while (v9 != a2);
  return v8 < v4;
}

void sub_21083B3FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,void *a25,uint64_t a26,uint64_t a27,void *__p,uint64_t a29)
{
  void *v29;
  uint64_t v30;
  void *v32;

  if (__p)
    operator delete(__p);
  v32 = *(void **)(v30 - 176);
  if (v32)
  {
    *(_QWORD *)(v30 - 168) = v32;
    operator delete(v32);
  }

  _Unwind_Resume(a1);
}

void sub_21083BBFC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_21083BDBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_21083C494(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30)
{
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v35;
  void *v36;

  if (__p)
    operator delete(__p);
  if (a17)
    operator delete(a17);
  if (a20)
    operator delete(a20);
  if (a23)
    operator delete(a23);
  if (a26)
    operator delete(a26);
  if (a29)
    operator delete(a29);
  v35 = *(void **)(v33 - 152);
  if (v35)
  {
    *(_QWORD *)(v33 - 144) = v35;
    operator delete(v35);
  }
  v36 = *(void **)(v33 - 128);
  if (v36)
  {
    *(_QWORD *)(v33 - 120) = v36;
    operator delete(v36);
  }

  _Unwind_Resume(a1);
}

void sub_21083C830(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

_QWORD *std::vector<unsigned long>::vector(_QWORD *a1, unint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<unsigned long>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_21083CAA4(_Unwind_Exception *exception_object)
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

char *std::vector<unsigned long>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 61)
    std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

_QWORD *std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<unsigned long>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_21083CB90(_Unwind_Exception *exception_object)
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

_QWORD *_ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEEC2Em(_QWORD *a1, unint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<unsigned long>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_21083CC04(_Unwind_Exception *exception_object)
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

void sub_21083CCA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void abpk::getJointPositionsAndMaximasLegacy(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, char a5, unsigned int a6, uint64_t a7, _QWORD *a8)
{
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void **v16;
  char **v17;
  _QWORD *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v30;
  char *v31;
  char *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  int v37;
  char *v38;
  char *v39;
  char *v40;
  char *v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  __int16 *v45;
  int v48;
  int v50;
  __int16 v51;
  char **v53;
  unint64_t v54;
  void **v55;
  unint64_t v56;
  _QWORD *v57;
  void *v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  char *v63;
  char *v64;
  char *v65;
  char *v66;
  char *v67;
  int v68;
  _OWORD **v69;
  uint64_t v70;
  _OWORD *v71;
  _OWORD *v72;
  _OWORD *v73;
  int v74;
  uint64_t v75;
  _QWORD *v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  void **v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  char *v87;
  char *v88;
  char *v89;
  char *v90;
  char *v91;
  uint64_t v95;
  uint64_t v96;
  uint64_t v98;
  unint64_t v99;
  uint64_t v101;
  void **v102;
  uint64_t (*v103)(void);

  v8 = *a3 - 1;
  v96 = v8;
  if ((a5 & 1) != 0)
  {
    if (*a3 == 1)
      return;
    v9 = 0;
    v10 = 0;
    v101 = a3[1];
    v98 = a4[1];
    v99 = a3[2];
    if (v99 <= 1)
      v11 = 1;
    else
      v11 = a3[2];
    do
    {
      v95 = v9;
      if (v101)
      {
        v12 = 0;
        v13 = *a4 * v9;
        v14 = a2 + 2 * v13;
        v15 = a1 + 2 * v13;
        v16 = (void **)(a7 + 24 * v9);
        v17 = (char **)(v16 + 1);
        v18 = v16 + 2;
        v19 = v99;
        v102 = v16;
        do
        {
          if (v19)
          {
            v20 = 0;
            v21 = v12 * v98;
            do
            {
              _H9 = *(_WORD *)(v15 + 2 * (v20 + v21));
              _H0 = *(_WORD *)(v14 + 2 * (v20 + v21));
              __asm
              {
                FCVT            S1, H9
                FCVT            S0, H0
              }
              if (_NF ^ _VF | _ZF)
                _ZF = 0;
              else
                _ZF = _S1 == _S0;
              if (_ZF)
              {
                v30 = *v17;
                if ((unint64_t)*v17 >= *v18)
                {
                  v32 = (char *)*v16;
                  v33 = (v30 - (_BYTE *)*v16) >> 4;
                  v34 = v33 + 1;
                  if ((unint64_t)(v33 + 1) >> 60)
                    std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
                  v35 = *v18 - (_QWORD)v32;
                  if (v35 >> 3 > v34)
                    v34 = v35 >> 3;
                  if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFF0)
                    v36 = 0xFFFFFFFFFFFFFFFLL;
                  else
                    v36 = v34;
                  if (v36)
                  {
                    v37 = v10;
                    v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::peak>>((uint64_t)v18, v36);
                    v16 = v102;
                    v10 = v37;
                    v39 = v38;
                    v30 = *v17;
                    v32 = (char *)*v102;
                  }
                  else
                  {
                    v39 = 0;
                  }
                  v40 = &v39[16 * v33];
                  *(_DWORD *)v40 = v20;
                  *((_DWORD *)v40 + 1) = v12;
                  *((_WORD *)v40 + 4) = _H9;
                  *((_DWORD *)v40 + 3) = v10;
                  v41 = v40;
                  if (v30 != v32)
                  {
                    do
                    {
                      *((_OWORD *)v41 - 1) = *((_OWORD *)v30 - 1);
                      v41 -= 16;
                      v30 -= 16;
                    }
                    while (v30 != v32);
                    v32 = (char *)*v16;
                  }
                  *v16 = v41;
                  v31 = v40 + 16;
                  *v17 = v40 + 16;
                  *v18 = &v39[16 * v36];
                  if (v32)
                  {
                    v42 = v10;
                    operator delete(v32);
                    v16 = v102;
                    v10 = v42;
                  }
                }
                else
                {
                  *(_DWORD *)v30 = v20;
                  *((_DWORD *)v30 + 1) = v12;
                  *((_WORD *)v30 + 4) = _H9;
                  v31 = v30 + 16;
                  *((_DWORD *)v30 + 3) = v10;
                }
                ++v10;
                *v17 = v31;
              }
              ++v20;
            }
            while (v20 != v11);
            v19 = v99;
          }
          ++v12;
        }
        while (v12 != v101);
      }
      v8 = v96;
      v9 = v95 + 1;
    }
    while (v95 + 1 != v96);
  }
  else
  {
    if (!a6)
    {
      v10 = 0;
      if (*a3 == 1)
        return;
      goto LABEL_58;
    }
    v43 = 0;
    v44 = a6;
    do
    {
      v45 = (__int16 *)(a1 + 8 * v43);
      _H0 = *v45;
      __asm { FCVT            S0, H0 }
      v48 = (int)_S0;
      LOWORD(_S0) = v45[1];
      __asm { FCVT            S0, H0 }
      v50 = (int)_S0;
      v51 = v45[3];
      LOWORD(_S0) = v45[2];
      __asm { FCVT            S0, H0 }
      v53 = (char **)(a7 + 24 * (int)_S0);
      v55 = (void **)(v53 + 1);
      v54 = (unint64_t)v53[1];
      v57 = v53 + 2;
      v56 = (unint64_t)v53[2];
      if (v54 >= v56)
      {
        v59 = (uint64_t)(v54 - (_QWORD)*v53) >> 4;
        v60 = v59 + 1;
        if ((unint64_t)(v59 + 1) >> 60)
          std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
        v61 = v56 - (_QWORD)*v53;
        if (v61 >> 3 > v60)
          v60 = v61 >> 3;
        if ((unint64_t)v61 >= 0x7FFFFFFFFFFFFFF0)
          v62 = 0xFFFFFFFFFFFFFFFLL;
        else
          v62 = v60;
        if (v62)
          v63 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::peak>>((uint64_t)v57, v62);
        else
          v63 = 0;
        v64 = &v63[16 * v59];
        *(_DWORD *)v64 = v48;
        *((_DWORD *)v64 + 1) = v50;
        *((_WORD *)v64 + 4) = v51;
        *((_DWORD *)v64 + 3) = 0;
        v65 = (char *)*v55;
        v66 = *v53;
        v67 = v64;
        if (*v55 != *v53)
        {
          do
          {
            *((_OWORD *)v67 - 1) = *((_OWORD *)v65 - 1);
            v67 -= 16;
            v65 -= 16;
          }
          while (v65 != v66);
          v65 = *v53;
        }
        *v53 = v67;
        v58 = v64 + 16;
        *v55 = v64 + 16;
        *v57 = &v63[16 * v62];
        if (v65)
          operator delete(v65);
      }
      else
      {
        *(_DWORD *)v54 = v48;
        *(_DWORD *)(v54 + 4) = v50;
        *(_WORD *)(v54 + 8) = v51;
        v58 = (void *)(v54 + 16);
        *(_DWORD *)(v54 + 12) = 0;
      }
      *v55 = v58;
      ++v43;
    }
    while (v43 != v44);
    v10 = 0;
  }
  if (!v8)
    return;
LABEL_58:
  v68 = v10;
  v69 = (_OWORD **)(a7 + 8);
  v70 = v8;
  do
  {
    v71 = *(v69 - 1);
    v72 = *v69;
    v103 = (uint64_t (*)(void))abpk::isDuplicate;
    v73 = std::__unique[abi:ne180100]<std::_ClassicAlgPolicy,std::__wrap_iter<abpk::peak *>,std::__wrap_iter<abpk::peak *>,BOOL (*&)(abpk::peak const&,abpk::peak const&)>(v71, v72, &v103);
    if (*v69 != v73)
      *v69 = v73;
    v69 += 3;
    --v70;
  }
  while (v70);
  v74 = v68;
  v75 = 0;
  v76 = a8 + 2;
  do
  {
    v77 = (uint64_t *)(a7 + 24 * v75);
    v78 = *v77;
    if ((int)((unint64_t)(v77[1] - *v77) >> 4) >= 1)
    {
      v79 = 0;
      v80 = (void **)a8;
      v81 = (char *)a8[1];
      do
      {
        v82 = v78 + 16 * v79;
        *(_DWORD *)(v82 + 12) = v74;
        if ((unint64_t)v81 >= *v76)
        {
          v83 = (v81 - (_BYTE *)*v80) >> 4;
          if ((unint64_t)(v83 + 1) >> 60)
            std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
          v84 = *v76 - (_QWORD)*v80;
          v85 = v84 >> 3;
          if (v84 >> 3 <= (unint64_t)(v83 + 1))
            v85 = v83 + 1;
          if ((unint64_t)v84 >= 0x7FFFFFFFFFFFFFF0)
            v86 = 0xFFFFFFFFFFFFFFFLL;
          else
            v86 = v85;
          if (v86)
          {
            v87 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::peak>>((uint64_t)v76, v86);
            v80 = (void **)a8;
          }
          else
          {
            v87 = 0;
          }
          v88 = &v87[16 * v83];
          *(_OWORD *)v88 = *(_OWORD *)v82;
          v90 = (char *)*v80;
          v89 = (char *)v80[1];
          v91 = v88;
          if (v89 != *v80)
          {
            do
            {
              *((_OWORD *)v91 - 1) = *((_OWORD *)v89 - 1);
              v91 -= 16;
              v89 -= 16;
            }
            while (v89 != v90);
            v89 = (char *)*v80;
          }
          v81 = v88 + 16;
          *v80 = v91;
          v80[1] = v88 + 16;
          v80[2] = &v87[16 * v86];
          if (v89)
          {
            operator delete(v89);
            v80 = (void **)a8;
          }
        }
        else
        {
          *(_OWORD *)v81 = *(_OWORD *)v82;
          v81 += 16;
        }
        ++v74;
        v80[1] = v81;
        ++v79;
        v78 = *v77;
      }
      while (v79 < (int)((unint64_t)(v77[1] - *v77) >> 4));
    }
    ++v75;
  }
  while (v75 != v96);
}

BOOL abpk::isDuplicate(_DWORD *a1, _DWORD *a2)
{
  int v2;
  int v3;

  v2 = *a1 - *a2;
  if (v2 < 0)
    v2 = *a2 - *a1;
  if (v2 > 1)
    return 0;
  v3 = a1[1] - a2[1];
  if (v3 < 0)
    v3 = a2[1] - a1[1];
  return v3 < 2;
}

{
  int v2;
  int v3;

  v2 = *a1 - *a2;
  if (v2 < 0)
    v2 = *a2 - *a1;
  if (v2 > 1)
    return 0;
  v3 = a1[1] - a2[1];
  if (v3 < 0)
    v3 = a2[1] - a1[1];
  return v3 < 2;
}

void abpk::extractHumansLegacy(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X5>, char a7@<W6>, unsigned int a8@<W7>, uint64_t *a9@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  double v14;
  int *v15;
  int v16;
  int v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int *v27;
  _DWORD *v28;
  float v29;
  float v30;
  float v31;
  double v32;
  double v33;
  unint64_t *v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float16x4_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  char *v48;
  unint64_t *v49;
  char *v50;
  char *v51;
  unint64_t v52;
  uint64_t v53;
  unsigned int v54;
  float v55;
  float v56;
  float v57;
  float v66;
  float32x2_t *v67;
  float32x2_t *v68;
  float32x2_t *v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  unint64_t v73;
  char *v74;
  char *v75;
  char *v76;
  char *v77;
  char *v78;
  unint64_t v79;
  uint64_t v80;
  char *v81;
  char *v82;
  uint64_t v83;
  char *v84;
  _DWORD *v85;
  _QWORD *v86;
  char *v87;
  _DWORD *v88;
  uint64_t v89;
  unint64_t v90;
  int *v91;
  int v92;
  int v93;
  uint64_t v94;
  _DWORD *v95;
  int v96;
  int v97;
  int v98;
  int v99;
  unint64_t v100;
  unint64_t v101;
  char *v102;
  char *v103;
  char *v104;
  __int128 v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t v110;
  int *v111;
  uint64_t v112;
  uint64_t v113;
  __n128 *v114;
  char *v115;
  uint64_t v116;
  int v117;
  int v118;
  int v119;
  int *v120;
  int *v121;
  int v122;
  float v123;
  _QWORD *v124;
  uint64_t v125;
  int v126;
  uint64_t *v127;
  int v128;
  uint64_t *v129;
  uint64_t v130;
  uint64_t v131;
  float *v134;
  float *v135;
  uint64_t v136;
  uint64_t v137;
  _QWORD *v144;
  void *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  float v153;
  char *v154;
  char *v155;
  _QWORD *v156;
  char *v157;
  void *v158;
  void *v159;
  __n128 *v160;
  int64_t v161;
  unint64_t v162;
  uint64_t v163;
  char *v164;
  float v165;
  __n128 *v166;
  _QWORD *n128_u64;
  __n128 *v168;
  void *v169;
  void *v170;
  unint64_t v172;
  uint64_t v174;
  float32x2_t v175;
  float32x2_t v176;
  float32x2_t *v177;
  float32x2_t *v178;
  float32x2_t *v179;
  uint64_t v180;
  unint64_t v181;
  unint64_t v182;
  char *v183;
  uint64_t v184;
  unint64_t v185;
  float32x2_t *v186;
  _DWORD *v187;
  _DWORD *v188;
  float32x2_t v189;
  _DWORD *v190;
  float32x2_t v191;
  unint64_t v192;
  uint64_t v193;
  uint64_t *v194;
  uint64_t v195;
  void *v196;
  uint64_t v197;
  void *v198;
  uint64_t v200;
  uint64_t v201;
  uint64_t *v202;
  uint64_t *v203;
  uint64_t v204;
  uint64_t *v205;
  int *v206;
  float v208;
  uint64_t *v209;
  uint64_t v210;
  unint64_t __len;
  _DWORD **__lena;
  uint64x2_t __lenb;
  void *__b;
  float32x2_t *v215;
  unint64_t v216;
  void *v217;
  _QWORD v218[2];
  _OWORD v219[25];
  uint64_t v220;
  void *v221;
  void *__p;
  unint64_t v223;
  _OWORD v224[24];
  uint64_t v225;

  v225 = *MEMORY[0x24BDAC8D0];
  v220 = 0;
  memset(v219, 0, sizeof(v219));
  v217 = 0;
  v218[0] = 0;
  v218[1] = 0;
  abpk::getJointPositionsAndMaximasLegacy(a1, a2, a4, a6, a7, a8, (uint64_t)v219, &v217);
  v12 = 0;
  v200 = *a4;
  v13 = *a4 - 1;
  memset(v224, 0, sizeof(v224));
  v14 = 1.0e-12;
  do
  {
    v201 = v12;
    v15 = &abpk::bones[2 * v12];
    v16 = *v15;
    v17 = v15[1];
    __b = 0;
    v215 = 0;
    v216 = 0;
    v18 = (uint64_t *)v219 + 3 * v16;
    v19 = v18[1];
    v202 = v18 + 1;
    v203 = v18;
    v20 = *v18;
    if (v19 != v20)
    {
      v21 = (uint64_t *)v219 + 3 * v17;
      v23 = v21 + 1;
      v22 = v21[1];
      v209 = v21;
      v24 = *v21;
      if (v22 != *v21)
      {
        if ((int)((unint64_t)(v19 - v20) >> 4) < 1)
        {
          v78 = 0;
          v77 = 0;
        }
        else
        {
          v204 = 0;
          v205 = v21 + 1;
          v206 = (int *)((char *)&abpk::s_bonesmap + 8 * v201);
          do
          {
            if ((int)((unint64_t)(v22 - v24) >> 4) >= 1)
            {
              v25 = 0;
              v26 = v20 + 16 * v204;
              v27 = (int *)(v26 + 4);
              do
              {
                v28 = (_DWORD *)(v24 + 16 * v25);
                v29 = (float)(*v28 - *(_DWORD *)v26);
                v30 = (float)(v28[1] - *v27);
                v31 = sqrtf((float)(v30 * v30) + (float)(v29 * v29));
                v32 = v31;
                if (v31 >= v14)
                {
                  v33 = v14;
                  v34 = 0;
                  v35 = 0;
                  v208 = (float)*(unint64_t *)(a5 + 8);
                  v36 = v206[1];
                  v37 = *v206;
                  v38 = v29 / v31;
                  v39 = v30 / v31;
                  __p = 0;
                  v221 = 0;
                  v223 = 0;
                  v40 = v29 / 10.0;
                  v41 = v30 / 10.0;
                  do
                  {
                    *(double *)&v42 = (float)((float)*v27 + (float)((float)v35 * v41)) + 0.5;
                    v43 = a6[1] * (int)*(_QWORD *)&v42
                        + (int)((float)((float)*(int *)v26 + (float)((float)v35 * v40)) + 0.5);
                    v42.i16[0] = *(_WORD *)(a3 + 2 * (v43 + *a6 * v37));
                    v42.i16[1] = *(_WORD *)(a3 + 2 * (v43 + *a6 * v36));
                    v44 = vcvtq_f32_f16(v42).u64[0];
                    if ((unint64_t)v34 >= v223)
                    {
                      __len = v44;
                      v45 = ((char *)v34 - (_BYTE *)v221) >> 3;
                      if ((unint64_t)(v45 + 1) >> 61)
                        std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
                      v46 = (uint64_t)(v223 - (_QWORD)v221) >> 2;
                      if (v46 <= v45 + 1)
                        v46 = v45 + 1;
                      if (v223 - (unint64_t)v221 >= 0x7FFFFFFFFFFFFFF8)
                        v47 = 0x1FFFFFFFFFFFFFFFLL;
                      else
                        v47 = v46;
                      if (v47)
                        v48 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v223, v47);
                      else
                        v48 = 0;
                      v49 = (unint64_t *)&v48[8 * v45];
                      *v49 = __len;
                      v34 = v49 + 1;
                      v50 = (char *)__p;
                      v51 = (char *)v221;
                      if (__p != v221)
                      {
                        do
                        {
                          v52 = *((_QWORD *)v50 - 1);
                          v50 -= 8;
                          *--v49 = v52;
                        }
                        while (v50 != v51);
                        v50 = (char *)v221;
                      }
                      v221 = v49;
                      __p = v34;
                      v223 = (unint64_t)&v48[8 * v47];
                      if (v50)
                        operator delete(v50);
                    }
                    else
                    {
                      *v34++ = v44;
                    }
                    __p = v34;
                    ++v35;
                  }
                  while (v35 != 10);
                  v53 = 0;
                  v54 = 0;
                  v55 = 0.0;
                  do
                  {
                    v56 = vmlas_n_f32(vmuls_lane_f32(v39, *(float32x2_t *)((char *)v221 + v53), 1), v38, COERCE_FLOAT(*(_QWORD *)((char *)v221 + v53)));
                    v55 = v55 + v56;
                    if (v56 > 0.05)
                      ++v54;
                    v53 += 8;
                  }
                  while (v53 != 80);
                  __p = v221;
                  operator delete(v221);
                  v13 = v200 - 1;
                  v14 = v33;
                  v23 = v205;
                  if (v54 >= 7)
                  {
                    v57 = fmin(v208 * 0.5 / v32 + -1.0, 0.0) + v55 / 10.0;
                    if (v57 > 0.0)
                    {
                      _H0 = *(_WORD *)(v26 + 8);
                      __asm { FCVT            S0, H0 }
                      _H1 = *(_WORD *)(v24 + 16 * v25 + 8);
                      __asm { FCVT            S1, H1 }
                      v66 = (float)(v57 + _S0) + _S1;
                      v67 = v215;
                      if ((unint64_t)v215 >= v216)
                      {
                        v69 = (float32x2_t *)__b;
                        v70 = ((char *)v215 - (_BYTE *)__b) >> 4;
                        v71 = v70 + 1;
                        if ((unint64_t)(v70 + 1) >> 60)
                          std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
                        v72 = v216 - (_QWORD)__b;
                        if ((uint64_t)(v216 - (_QWORD)__b) >> 3 > v71)
                          v71 = v72 >> 3;
                        if ((unint64_t)v72 >= 0x7FFFFFFFFFFFFFF0)
                          v73 = 0xFFFFFFFFFFFFFFFLL;
                        else
                          v73 = v71;
                        if (v73)
                        {
                          v74 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::peak>>((uint64_t)&v216, v73);
                          v69 = (float32x2_t *)__b;
                          v67 = v215;
                        }
                        else
                        {
                          v74 = 0;
                        }
                        v75 = &v74[16 * v70];
                        *(_DWORD *)v75 = v204;
                        *((_DWORD *)v75 + 1) = v25;
                        *((float *)v75 + 2) = v57;
                        *((float *)v75 + 3) = v66;
                        v76 = v75;
                        if (v67 != v69)
                        {
                          do
                          {
                            *((_OWORD *)v76 - 1) = *(_OWORD *)v67[-2].f32;
                            v76 -= 16;
                            v67 -= 2;
                          }
                          while (v67 != v69);
                          v69 = (float32x2_t *)__b;
                        }
                        v68 = (float32x2_t *)(v75 + 16);
                        __b = v76;
                        v215 = (float32x2_t *)(v75 + 16);
                        v216 = (unint64_t)&v74[16 * v73];
                        if (v69)
                          operator delete(v69);
                      }
                      else
                      {
                        v215->i32[0] = v204;
                        v67->i32[1] = v25;
                        v68 = v67 + 2;
                        v67[1].f32[0] = v57;
                        v67[1].f32[1] = v66;
                      }
                      v215 = v68;
                    }
                  }
                }
                ++v25;
                v22 = *v23;
                v24 = *v209;
              }
              while (v25 < (int)((unint64_t)(*v23 - *v209) >> 4));
              v19 = *v202;
              v20 = *v203;
            }
            ++v204;
          }
          while (v204 < (int)((unint64_t)(v19 - v20) >> 4));
          v77 = (char *)__b;
          v78 = (char *)v215;
        }
        v79 = 126 - 2 * __clz((v78 - v77) >> 4);
        v221 = abpk::compareCandidate;
        if (v78 == v77)
          v80 = 0;
        else
          v80 = v79;
        std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*,false>(v77, v78, (uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))&v221, v80, 1);
        v81 = (char *)__b;
        v82 = (char *)v215;
        if ((int)((unint64_t)((char *)v215 - (_BYTE *)__b) >> 4) >= 1)
        {
          v83 = 0;
          v84 = (char *)v224 + 24 * v201;
          v85 = (_DWORD *)*((_QWORD *)v84 + 1);
          __lena = (_DWORD **)(v84 + 8);
          v86 = v84 + 16;
          do
          {
            v87 = &v81[16 * v83];
            v88 = *(_DWORD **)v84;
            v89 = ((uint64_t)v85 - *(_QWORD *)v84) >> 2;
            v90 = 0xCCCCCCCCCCCCCCCDLL * v89;
            v93 = *(_DWORD *)v87;
            v91 = (int *)(v87 + 4);
            v92 = v93;
            if (-858993459 * (int)v89 <= 0)
            {
              v96 = *v91;
LABEL_68:
              v97 = *(_DWORD *)&v81[16 * v83 + 8];
              v98 = *(_DWORD *)(*v203 + 16 * v92 + 12);
              v99 = *(_DWORD *)(*v209 + 16 * v96 + 12);
              if ((unint64_t)v85 >= *v86)
              {
                v100 = v90 + 1;
                if (v90 + 1 > 0xCCCCCCCCCCCCCCCLL)
                  std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
                if (0x999999999999999ALL * ((uint64_t)(*v86 - (_QWORD)v88) >> 2) > v100)
                  v100 = 0x999999999999999ALL * ((uint64_t)(*v86 - (_QWORD)v88) >> 2);
                if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*v86 - (_QWORD)v88) >> 2) >= 0x666666666666666)
                  v101 = 0xCCCCCCCCCCCCCCCLL;
                else
                  v101 = v100;
                if (v101)
                {
                  v102 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::Connection>>((uint64_t)v86, v101);
                  v85 = *__lena;
                  v88 = *(_DWORD **)v84;
                  v86 = v84 + 16;
                }
                else
                {
                  v102 = 0;
                }
                v103 = &v102[20 * v90];
                *(_DWORD *)v103 = v98;
                *((_DWORD *)v103 + 1) = v99;
                *((_DWORD *)v103 + 2) = v97;
                *((_DWORD *)v103 + 3) = v92;
                *((_DWORD *)v103 + 4) = v96;
                v104 = v103;
                if (v85 == v88)
                {
                  v13 = v200 - 1;
                }
                else
                {
                  v13 = v200 - 1;
                  do
                  {
                    v105 = *(_OWORD *)(v85 - 5);
                    *((_DWORD *)v104 - 1) = *(v85 - 1);
                    *(_OWORD *)(v104 - 20) = v105;
                    v104 -= 20;
                    v85 -= 5;
                  }
                  while (v85 != v88);
                  v88 = *(_DWORD **)v84;
                }
                *(_QWORD *)v84 = v104;
                v85 = v103 + 20;
                *__lena = v103 + 20;
                *v86 = &v102[20 * v101];
                if (v88)
                {
                  operator delete(v88);
                  v86 = v84 + 16;
                }
              }
              else
              {
                *v85 = v98;
                v85[1] = v99;
                v85[2] = v97;
                v85[3] = v92;
                v85[4] = v96;
                v85 += 5;
                v13 = v200 - 1;
              }
              *__lena = v85;
              v81 = (char *)__b;
              v82 = (char *)v215;
            }
            else
            {
              v94 = (-858993459 * v89);
              v95 = v88 + 4;
              while (*(v95 - 1) != v92)
              {
                v96 = *v91;
                if (*v95 == *v91)
                  break;
                v95 += 5;
                if (!--v94)
                  goto LABEL_68;
              }
              v13 = v200 - 1;
            }
            ++v83;
          }
          while (v83 < (int)((unint64_t)(v82 - v81) >> 4));
        }
        if (v81)
        {
          v215 = (float32x2_t *)v81;
          operator delete(v81);
        }
      }
    }
    v12 = v201 + 1;
  }
  while (v201 != 15);
  v106 = 0;
  v107 = v200;
  __p = 0;
  v221 = 0;
  v223 = 0;
  do
  {
    v210 = v106;
    v108 = (uint64_t *)v224 + 3 * v106;
    v109 = *v108;
    if ((int)(-858993459 * ((unint64_t)(v108[1] - *v108) >> 2)) >= 1)
    {
      v110 = 0;
      v111 = &abpk::bones[2 * v106];
      v112 = *v111;
      v113 = v111[1];
      do
      {
        v114 = (__n128 *)__p;
        v115 = (char *)v221;
        if ((int)(-1431655765 * (((_BYTE *)__p - (_BYTE *)v221) >> 3)) < 1)
          goto LABEL_115;
        v116 = 0;
        v117 = 0;
        v118 = 0;
        v119 = 0;
        v120 = (int *)(v109 + 20 * v110);
        v122 = *v120;
        v121 = v120 + 1;
        v123 = (float)v122;
        v124 = v221;
        do
        {
          if (*(float *)(*v124 + 4 * v112) == v123 || *(float *)(*v124 + 4 * v113) == (float)*v121)
          {
            if (!v119)
              v118 = v116;
            if (v119 == 1)
              v117 = v116;
            ++v119;
          }
          ++v116;
          v124 += 3;
        }
        while (-1431655765 * (((_BYTE *)__p - (_BYTE *)v221) >> 3) != v116);
        switch(v119)
        {
          case 0:
LABEL_115:
            std::vector<float>::vector(&__b, v200 + 1);
            v134 = (float *)__b;
            if (v200 != -1)
              memset_pattern16(__b, &unk_210881730, 4 * v200 + 4);
            v135 = (float *)(*v108 + 20 * v110);
            v136 = *(int *)v135;
            v134[v112] = (float)(int)v136;
            v137 = *((int *)v135 + 1);
            v134[v113] = (float)(int)v137;
            v134[v107] = 2.0;
            _H0 = *((_WORD *)v217 + 8 * v136 + 4);
            _H1 = *((_WORD *)v217 + 8 * v137 + 4);
            __asm
            {
              FCVT            S1, H1
              FCVT            S0, H0
            }
            _S0 = _S0 + _S1;
            __asm
            {
              FCVT            H0, S0
              FCVT            S0, H0
            }
            v134[v200 - 1] = v135[2] + _S0;
            v144 = __p;
            if ((unint64_t)__p >= v223)
            {
              v145 = (void *)std::vector<std::vector<float>>::__push_back_slow_path<std::vector<float> const&>((uint64_t *)&v221, (uint64_t)&__b);
            }
            else
            {
              *(_QWORD *)__p = 0;
              v144[1] = 0;
              v144[2] = 0;
              std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v144, __b, (uint64_t)v215, ((char *)v215 - (_BYTE *)__b) >> 2);
              v145 = v144 + 3;
            }
            __p = v145;
            v13 = v200 - 1;
            if (__b)
            {
              v215 = (float32x2_t *)__b;
              operator delete(__b);
            }
            break;
          case 1:
            v146 = *((_QWORD *)v221 + 3 * v118);
            v147 = *v121;
            if (*(float *)(v146 + 4 * v113) != (float)(int)v147)
            {
              *(float *)(v146 + 4 * v113) = (float)(int)v147;
              *(float *)(v146 + 4 * v107) = *(float *)(v146 + 4 * v107) + 1.0;
              _H0 = *((_WORD *)v217 + 8 * v147 + 4);
              __asm { FCVT            S0, H0 }
              *(float *)(v146 + 4 * v13) = *(float *)(v146 + 4 * v13) + (float)(*(float *)(v109 + 20 * v110 + 8) + _S0);
            }
            break;
          case 2:
            if (!v13)
            {
              v128 = v117;
              v150 = *((_QWORD *)v221 + 3 * v117);
              v151 = *((_QWORD *)v221 + 3 * v118);
LABEL_127:
              *(float *)(v151 + 4 * v107) = *(float *)(v150 + 4 * v107) + *(float *)(v151 + 4 * v107);
              v153 = *(float *)(v150 + 4 * v13) + *(float *)(v151 + 4 * v13);
              *(float *)(v151 + 4 * v13) = v153;
              *(float *)(v151 + 4 * v13) = v153 + *(float *)(v109 + 20 * v110 + 8);
              std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,std::vector<float> *,std::vector<float> *,std::vector<float> *,0>((__n128 *)&v115[24 * v128 + 24], v114, (uint64_t)&v115[24 * v128]);
              v155 = v154;
              v156 = __p;
              if (__p != v154)
              {
                v157 = (char *)__p;
                do
                {
                  v159 = (void *)*((_QWORD *)v157 - 3);
                  v157 -= 24;
                  v158 = v159;
                  if (v159)
                  {
                    *(v156 - 2) = v158;
                    operator delete(v158);
                  }
                  v156 = v157;
                }
                while (v157 != v155);
              }
              __p = v155;
              v107 = v200;
              v13 = v200 - 1;
              break;
            }
            v125 = 0;
            v126 = 0;
            v127 = (uint64_t *)((char *)v221 + 24 * v118);
            v128 = v117;
            v129 = (uint64_t *)((char *)v221 + 24 * v117);
            do
            {
              if (*(float *)(*v127 + 4 * v125) > 0.0 && *(float *)(*v129 + 4 * v125) > 0.0)
                v126 = 2;
              ++v125;
            }
            while (v13 != v125);
            if (!v126)
            {
              v152 = 0;
              v150 = *v129;
              v151 = *v127;
              do
              {
                *(float *)(v151 + 4 * v152) = (float)(*(float *)(v150 + 4 * v152) + 1.0) + *(float *)(v151 + 4 * v152);
                ++v152;
              }
              while (v13 != v152);
              goto LABEL_127;
            }
            v130 = *v121;
            v131 = *v127;
            *(float *)(*v127 + 4 * v113) = (float)(int)v130;
            *(float *)(v131 + 4 * v107) = *(float *)(v131 + 4 * v107) + 1.0;
            _H0 = *((_WORD *)v217 + 8 * v130 + 4);
            __asm { FCVT            S0, H0 }
            *(float *)(v131 + 4 * v13) = *(float *)(v131 + 4 * v13) + (float)(*(float *)(v109 + 20 * v110 + 8) + _S0);
            break;
        }
        ++v110;
        v109 = *v108;
      }
      while (v110 < (int)(-858993459 * ((unint64_t)(v108[1] - *v108) >> 2)));
    }
    v106 = v210 + 1;
  }
  while (v210 != 15);
  v160 = (__n128 *)__p;
  v161 = ((_BYTE *)__p - (_BYTE *)v221) >> 3;
  v162 = 0xAAAAAAAAAAAAAAABLL * v161;
  if (-1431655765 * (int)v161 >= 1)
  {
    v163 = (-1431655765 * v161);
    do
    {
      v164 = (char *)v221 + 24 * (v163 - 1);
      v165 = *(float *)(*(_QWORD *)v164 + 4 * v107);
      if (v165 < 8.0 || (float)(*(float *)(*(_QWORD *)v164 + 4 * v13) / v165) < 0.3)
      {
        std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,std::vector<float> *,std::vector<float> *,std::vector<float> *,0>((__n128 *)(v164 + 24), v160, (uint64_t)v164);
        v160 = v166;
        n128_u64 = __p;
        if (__p != v166)
        {
          v168 = (__n128 *)__p;
          do
          {
            v170 = (void *)v168[-2].n128_u64[1];
            v168 = (__n128 *)((char *)v168 - 24);
            v169 = v170;
            if (v170)
            {
              *(n128_u64 - 2) = v169;
              operator delete(v169);
            }
            n128_u64 = v168->n128_u64;
          }
          while (v168 != v160);
        }
        __p = v160;
      }
    }
    while (v163-- > 1);
    v162 = 0xAAAAAAAAAAAAAAABLL * (((char *)v160 - (_BYTE *)v221) >> 3);
  }
  *a9 = 0;
  a9[1] = 0;
  a9[2] = 0;
  std::vector<abpk::Human>::reserve(a9, v162);
  if (__p != v221)
  {
    v172 = 0;
    __asm { FMOV            V8.2S, #-1.0 }
    do
    {
      __lenb = *(uint64x2_t *)(a5 + 8);
      v215 = 0;
      v216 = 0;
      __b = 0;
      _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE7reserveEm(&__b, 0x11uLL);
      v174 = 0;
      v175 = (float32x2_t)vrev64_s32((int32x2_t)vcvt_f32_f64(vcvtq_f64_u64(__lenb)));
      do
      {
        if (((int)*(float *)(*((_QWORD *)v221 + 3 * v172) + 4 * v174) & 0x80000000) == 0)
        {
          v176 = vdiv_f32(vcvt_f32_s32(*(int32x2_t *)((char *)v217+ 16* (int)*(float *)(*((_QWORD *)v221 + 3 * v172) + 4 * v174))), v175);
          v177 = v215;
          if ((unint64_t)v215 < v216)
          {
            *v215 = v176;
            v178 = v177 + 1;
            goto LABEL_182;
          }
          v180 = ((char *)v215 - (_BYTE *)__b) >> 3;
          if ((unint64_t)(v180 + 1) >> 61)
            std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
          v181 = (uint64_t)(v216 - (_QWORD)__b) >> 2;
          if (v181 <= v180 + 1)
            v181 = v180 + 1;
          if (v216 - (unint64_t)__b >= 0x7FFFFFFFFFFFFFF8)
            v182 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v182 = v181;
          if (v182)
            v183 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v216, v182);
          else
            v183 = 0;
          v186 = (float32x2_t *)&v183[8 * v180];
          *v186 = v176;
          v178 = v186 + 1;
          v188 = __b;
          v187 = v215;
          if (v215 == __b)
            goto LABEL_180;
          do
          {
            v189 = *(float32x2_t *)(v187 - 2);
            v187 -= 2;
            v186[-1] = v189;
            --v186;
          }
          while (v187 != v188);
          goto LABEL_179;
        }
        v179 = v215;
        if ((unint64_t)v215 < v216)
        {
          *v215 = _D8;
          v178 = v179 + 1;
          goto LABEL_182;
        }
        v184 = ((char *)v215 - (_BYTE *)__b) >> 3;
        if ((unint64_t)(v184 + 1) >> 61)
          std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
        v185 = (uint64_t)(v216 - (_QWORD)__b) >> 2;
        if (v185 <= v184 + 1)
          v185 = v184 + 1;
        if (v216 - (unint64_t)__b >= 0x7FFFFFFFFFFFFFF8)
          v182 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v182 = v185;
        if (v182)
          v183 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v216, v182);
        else
          v183 = 0;
        v186 = (float32x2_t *)&v183[8 * v184];
        *v186 = _D8;
        v178 = v186 + 1;
        v190 = __b;
        v187 = v215;
        if (v215 != __b)
        {
          do
          {
            v191 = *(float32x2_t *)(v187 - 2);
            v187 -= 2;
            v186[-1] = v191;
            --v186;
          }
          while (v187 != v190);
LABEL_179:
          v187 = __b;
        }
LABEL_180:
        __b = v186;
        v215 = v178;
        v216 = (unint64_t)&v183[8 * v182];
        if (v187)
          operator delete(v187);
LABEL_182:
        v215 = v178;
        ++v174;
      }
      while (v174 != 17);
      v192 = a9[1];
      if (v192 >= a9[2])
      {
        v193 = _ZNSt3__16vectorIN4abpk5HumanENS_9allocatorIS2_EEE24__emplace_back_slow_pathIJNS0_IDv2_fNS3_IS7_EEEEEEEPS2_DpOT_(a9, (uint64_t)&__b);
        v194 = a9;
      }
      else
      {
        _ZNSt3__19allocatorIN4abpk5HumanEE9constructB8ne180100IS2_JNS_6vectorIDv2_fNS0_IS6_EEEEEEEvPT_DpOT0_((uint64_t)(a9 + 2), a9[1], (uint64_t)&__b);
        v193 = v192 + 120;
        v194 = a9;
        a9[1] = v192 + 120;
      }
      v194[1] = v193;
      if (__b)
      {
        v215 = (float32x2_t *)__b;
        operator delete(__b);
      }
      ++v172;
    }
    while (0xAAAAAAAAAAAAAAABLL * (((_BYTE *)__p - (_BYTE *)v221) >> 3) > v172);
  }
  __b = &v221;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__b);
  v195 = 384;
  do
  {
    v196 = *(void **)((char *)&v221 + v195);
    if (v196)
    {
      *(void **)((char *)&__p + v195) = v196;
      operator delete(v196);
    }
    v195 -= 24;
  }
  while (v195);
  if (v217)
  {
    v218[0] = v217;
    operator delete(v217);
  }
  v197 = 51;
  do
  {
    v198 = (void *)v218[v197 - 1];
    if (v198)
    {
      v218[v197] = v198;
      operator delete(v198);
    }
    v197 -= 3;
  }
  while (v197 * 8);
}

void sub_21083E3F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,void *__p,uint64_t a31)
{
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;

  a27 = a9;
  std::vector<abpk::Human>::__destroy_vector::operator()[abi:ne180100]((void ***)&a27);
  a27 = &STACK[0x258];
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a27);
  v32 = 384;
  while (1)
  {
    v33 = *(void **)((char *)&STACK[0x270] + v32 - 24);
    if (v33)
    {
      *(unint64_t *)((char *)&STACK[0x270] + v32 - 16) = (unint64_t)v33;
      operator delete(v33);
    }
    v32 -= 24;
    if (!v32)
    {
      if (__p)
      {
        a31 = (uint64_t)__p;
        operator delete(__p);
      }
      v34 = 408;
      while (1)
      {
        v35 = *(void **)((char *)&__p + v34);
        if (v35)
        {
          *(uint64_t *)((char *)&a31 + v34) = (uint64_t)v35;
          operator delete(v35);
        }
        v34 -= 24;
        if (!v34)
          _Unwind_Resume(a1);
      }
    }
  }
}

BOOL abpk::compareCandidate(uint64_t a1, int a2, uint64_t a3, int a4)
{
  return *(float *)&a2 > *(float *)&a4;
}

{
  return *(float *)&a2 > *(float *)&a4;
}

void **std::vector<abpk::Human>::reserve(uint64_t *a1, unint64_t a2)
{
  void **result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7[5];

  v4 = a1[2];
  result = (void **)(a1 + 2);
  if (0xEEEEEEEEEEEEEEEFLL * ((v4 - *a1) >> 3) < a2)
  {
    if (a2 >= 0x222222222222223)
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::Human>>((uint64_t)result, a2);
    v7[1] = (char *)v7[0] + v5;
    v7[2] = (char *)v7[0] + v5;
    v7[3] = (char *)v7[0] + 120 * v6;
    std::vector<abpk::Human>::__swap_out_circular_buffer(a1, v7);
    return std::__split_buffer<abpk::Human>::~__split_buffer(v7);
  }
  return result;
}

void sub_21083E5FC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<abpk::Human>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
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
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v3, a2);
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::peak>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(16 * a2);
}

_OWORD *std::__unique[abi:ne180100]<std::_ClassicAlgPolicy,std::__wrap_iter<abpk::peak *>,std::__wrap_iter<abpk::peak *>,BOOL (*&)(abpk::peak const&,abpk::peak const&)>(_OWORD *a1, _OWORD *a2, uint64_t (**a3)(void))
{
  _OWORD *v4;
  _OWORD *v6;
  int v7;
  _OWORD *v8;
  _OWORD *v9;

  v4 = a2;
  if (a1 != a2)
  {
    do
    {
      v6 = a1 + 1;
      if (a1 + 1 == a2)
        return a2;
      v7 = (*a3)();
      a1 = v6;
    }
    while (!v7);
    v8 = v6 + 1;
    v9 = v6 - 1;
    while (v8 != a2)
    {
      if ((((uint64_t (*)(_OWORD *, _OWORD *))*a3)(v9, v8) & 1) == 0)
      {
        v9[1] = *v8;
        ++v9;
      }
      ++v8;
    }
    return v9 + 1;
  }
  return v4;
}

void std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*,false>(char *a1, char *a2, uint64_t (**a3)(uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a4, char a5)
{
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  char *v16;
  char v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  __int128 v22;
  __int128 v23;

LABEL_1:
  v9 = a1;
LABEL_2:
  v10 = 1 - a4;
  while (2)
  {
    a1 = v9;
    v11 = v10;
    v12 = a2 - v9;
    v13 = (a2 - v9) >> 4;
    switch(v13)
    {
      case 0uLL:
      case 1uLL:
        return;
      case 2uLL:
        v19 = *((_QWORD *)a2 - 2);
        v20 = *((_QWORD *)a2 - 1);
        v21 = a2 - 16;
        if ((*a3)(v19, v20, *(_QWORD *)v9, *((_QWORD *)v9 + 1)))
        {
          v23 = *(_OWORD *)v9;
          *(_OWORD *)v9 = *(_OWORD *)v21;
          *(_OWORD *)v21 = v23;
        }
        return;
      case 3uLL:
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(v9, (_QWORD *)v9 + 2, (_QWORD *)a2 - 2, a3);
        return;
      case 4uLL:
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(v9, (_QWORD *)v9 + 2, (_QWORD *)v9 + 4, (_QWORD *)a2 - 2, a3);
        return;
      case 5uLL:
        std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(v9, (_QWORD *)v9 + 2, (_QWORD *)v9 + 4, (_QWORD *)v9 + 6, (_QWORD *)a2 - 2, a3);
        return;
      default:
        if (v12 <= 383)
        {
          if ((a5 & 1) != 0)
            std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>((uint64_t)v9, a2, a3);
          else
            std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>((uint64_t)v9, a2, a3);
          return;
        }
        if (v11 != 1)
        {
          v14 = v13 >> 1;
          v15 = &v9[16 * (v13 >> 1)];
          if ((unint64_t)v12 < 0x801)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(&v9[16 * (v13 >> 1)], v9, (_QWORD *)a2 - 2, a3);
            if ((a5 & 1) != 0)
              goto LABEL_11;
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(v9, &v9[16 * (v13 >> 1)], (_QWORD *)a2 - 2, a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>((_QWORD *)v9 + 2, (_QWORD *)v15 - 2, (_QWORD *)a2 - 4, a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>((_QWORD *)v9 + 4, &v9[16 * v14 + 16], (_QWORD *)a2 - 6, a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>((_QWORD *)v15 - 2, v15, &v9[16 * v14 + 16], a3);
            v22 = *(_OWORD *)v9;
            *(_OWORD *)v9 = *(_OWORD *)v15;
            *(_OWORD *)v15 = v22;
            if ((a5 & 1) != 0)
              goto LABEL_11;
          }
          if (((*a3)(*((_QWORD *)v9 - 2), *((_QWORD *)v9 - 1), *(_QWORD *)v9, *((_QWORD *)v9 + 1)) & 1) == 0)
          {
            v9 = (char *)std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,abpk::Candidate *,BOOL (*&)(abpk::Candidate,abpk::Candidate)>(v9, a2, a3);
            goto LABEL_16;
          }
LABEL_11:
          v16 = (char *)std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,abpk::Candidate *,BOOL (*&)(abpk::Candidate,abpk::Candidate)>((uint64_t *)v9, (uint64_t *)a2, a3);
          if ((v17 & 1) == 0)
            goto LABEL_14;
          v18 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(v9, v16, a3);
          v9 = v16 + 16;
          if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(v16 + 16, a2, a3))
          {
            v10 = v11 + 1;
            if (v18)
              continue;
LABEL_14:
            std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*,false>(a1, v16, a3, -v11, a5 & 1);
            v9 = v16 + 16;
LABEL_16:
            a5 = 0;
            a4 = -v11;
            goto LABEL_2;
          }
          a4 = -v11;
          a2 = v16;
          if (v18)
            return;
          goto LABEL_1;
        }
        if (v9 != a2)
          std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*,abpk::Candidate*>(v9, a2, a2, a3);
        return;
    }
  }
}

uint64_t std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(uint64_t result, _QWORD *a2, uint64_t (**a3)(uint64_t, uint64_t, _QWORD, _QWORD))
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  if ((_QWORD *)result != a2)
  {
    v4 = (_QWORD *)result;
    v5 = (_QWORD *)(result + 16);
    if ((_QWORD *)(result + 16) != a2)
    {
      v7 = 0;
      v8 = (_QWORD *)result;
      do
      {
        v9 = v5;
        result = (*a3)(v8[2], v8[3], *v8, v8[1]);
        if ((_DWORD)result)
        {
          v10 = *v9;
          v11 = v8[3];
          v12 = v7;
          while (1)
          {
            *(_OWORD *)((char *)v4 + v12 + 16) = *(_OWORD *)((char *)v4 + v12);
            if (!v12)
              break;
            result = (*a3)(v10, v11, *(_QWORD *)((char *)v4 + v12 - 16), *(_QWORD *)((char *)v4 + v12 - 8));
            v12 -= 16;
            if ((result & 1) == 0)
            {
              v13 = (_QWORD *)((char *)v4 + v12 + 16);
              goto LABEL_10;
            }
          }
          v13 = v4;
LABEL_10:
          *v13 = v10;
          v13[1] = v11;
        }
        v5 = v9 + 2;
        v7 += 16;
        v8 = v9;
      }
      while (v9 + 2 != a2);
    }
  }
  return result;
}

uint64_t std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(uint64_t result, _QWORD *a2, uint64_t (**a3)(uint64_t, uint64_t, _QWORD, _QWORD))
{
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  _QWORD *v11;

  if ((_QWORD *)result != a2)
  {
    v4 = (_QWORD *)result;
    v5 = (_QWORD *)(result + 16);
    if ((_QWORD *)(result + 16) != a2)
    {
      do
      {
        v7 = v5;
        result = (*a3)(v4[2], v4[3], *v4, v4[1]);
        if ((_DWORD)result)
        {
          v8 = *v7;
          v9 = v4[3];
          v10 = v7;
          do
          {
            v11 = v10 - 1;
            *v10 = *(v10 - 1);
            result = (*a3)(v8, v9, *((_QWORD *)v10 - 4), *((_QWORD *)v10 - 3));
            v10 = v11;
          }
          while ((result & 1) != 0);
          *v11 = v8;
          v11[1] = v9;
        }
        v5 = v7 + 2;
        v4 = v7;
      }
      while (v7 + 2 != a2);
    }
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(_QWORD *a1, _QWORD *a2, _QWORD *a3, uint64_t (**a4)(_QWORD, _QWORD, _QWORD, _QWORD))
{
  char v8;
  uint64_t result;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v8 = (*a4)(*a2, a2[1], *a1, a1[1]);
  result = (*a4)(*a3, a3[1], *a2, a2[1]);
  if ((v8 & 1) == 0)
  {
    if (!(_DWORD)result)
      return result;
    v11 = *(_OWORD *)a2;
    *(_OWORD *)a2 = *(_OWORD *)a3;
    *(_OWORD *)a3 = v11;
    if (!(*a4)(*a2, a2[1], *a1, a1[1]))
      return 1;
    v12 = *(_OWORD *)a1;
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)a2 = v12;
    return 2;
  }
  if (!(_DWORD)result)
  {
    v13 = *(_OWORD *)a1;
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)a2 = v13;
    if (!(*a4)(*a3, a3[1], *a2, a2[1]))
      return 1;
    v14 = *(_OWORD *)a2;
    *(_OWORD *)a2 = *(_OWORD *)a3;
    *(_OWORD *)a3 = v14;
    return 2;
  }
  v10 = *(_OWORD *)a1;
  *(_OWORD *)a1 = *(_OWORD *)a3;
  *(_OWORD *)a3 = v10;
  return 1;
}

_QWORD *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,abpk::Candidate *,BOOL (*&)(abpk::Candidate,abpk::Candidate)>(_QWORD *a1, _OWORD *a2, uint64_t (**a3)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  _OWORD *v4;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;

  v4 = a2;
  v6 = *a1;
  v7 = a1[1];
  if (((*a3)(*a1, v7, *((_QWORD *)a2 - 2), *((_QWORD *)a2 - 1)) & 1) != 0)
  {
    v8 = a1;
    do
    {
      v9 = v8[2];
      v10 = v8[3];
      v8 += 2;
    }
    while (((*a3)(v6, v7, v9, v10) & 1) == 0);
  }
  else
  {
    v11 = a1 + 2;
    do
    {
      v8 = v11;
      if (v11 >= (_QWORD *)v4)
        break;
      v12 = (*a3)(v6, v7, *v11, v11[1]);
      v11 = v8 + 2;
    }
    while (!v12);
  }
  if (v8 < (_QWORD *)v4)
  {
    do
    {
      v13 = *((_QWORD *)v4 - 2);
      v14 = *((_QWORD *)v4-- - 1);
    }
    while (((*a3)(v6, v7, v13, v14) & 1) != 0);
  }
  while (v8 < (_QWORD *)v4)
  {
    v20 = *(_OWORD *)v8;
    *(_OWORD *)v8 = *v4;
    *v4 = v20;
    do
    {
      v15 = v8[2];
      v16 = v8[3];
      v8 += 2;
    }
    while (!(*a3)(v6, v7, v15, v16));
    do
    {
      v17 = *((_QWORD *)v4 - 2);
      v18 = *((_QWORD *)v4-- - 1);
    }
    while (((*a3)(v6, v7, v17, v18) & 1) != 0);
  }
  if (v8 - 2 != a1)
    *(_OWORD *)a1 = *((_OWORD *)v8 - 1);
  *(v8 - 2) = v6;
  *(v8 - 1) = v7;
  return v8;
}

uint64_t *std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,abpk::Candidate *,BOOL (*&)(abpk::Candidate,abpk::Candidate)>(uint64_t *a1, uint64_t *a2, uint64_t (**a3)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *result;

  v6 = 0;
  v7 = *a1;
  v8 = a1[1];
  do
  {
    v9 = (*a3)(a1[v6 + 2], a1[v6 + 3], v7, v8);
    v6 += 2;
  }
  while ((v9 & 1) != 0);
  v10 = &a1[v6];
  if (v6 == 2)
  {
    do
    {
      if (v10 >= a2)
        break;
      v13 = *(a2 - 2);
      v14 = *(a2 - 1);
      a2 -= 2;
    }
    while (((*a3)(v13, v14, v7, v8) & 1) == 0);
  }
  else
  {
    do
    {
      v11 = *(a2 - 2);
      v12 = *(a2 - 1);
      a2 -= 2;
    }
    while (!(*a3)(v11, v12, v7, v8));
  }
  v15 = &a1[v6];
  if (v10 < a2)
  {
    v16 = a2;
    do
    {
      v17 = *(_OWORD *)v15;
      *(_OWORD *)v15 = *(_OWORD *)v16;
      *(_OWORD *)v16 = v17;
      do
      {
        v18 = v15[2];
        v19 = v15[3];
        v15 += 2;
      }
      while (((*a3)(v18, v19, v7, v8) & 1) != 0);
      do
      {
        v20 = *(v16 - 2);
        v21 = *(v16 - 1);
        v16 -= 2;
      }
      while (!(*a3)(v20, v21, v7, v8));
    }
    while (v15 < v16);
  }
  result = v15 - 2;
  if (v15 - 2 != a1)
    *(_OWORD *)a1 = *(_OWORD *)result;
  *(v15 - 2) = v7;
  *(v15 - 1) = v8;
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(char *a1, char *a2, uint64_t (**a3)(uint64_t, uint64_t, _QWORD, _QWORD))
{
  uint64_t v6;
  _BOOL8 result;
  char *v8;
  __int128 v9;
  char *v10;
  char *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;

  v6 = (a2 - a1) >> 4;
  result = 1;
  switch(v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v8 = a2 - 16;
      if ((*a3)(*((_QWORD *)a2 - 2), *((_QWORD *)a2 - 1), *(_QWORD *)a1, *((_QWORD *)a1 + 1)))
      {
        v9 = *(_OWORD *)a1;
        *(_OWORD *)a1 = *(_OWORD *)v8;
        *(_OWORD *)v8 = v9;
      }
      return 1;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(a1, (_QWORD *)a1 + 2, (_QWORD *)a2 - 2, a3);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(a1, (_QWORD *)a1 + 2, (_QWORD *)a1 + 4, (_QWORD *)a2 - 2, a3);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(a1, (_QWORD *)a1 + 2, (_QWORD *)a1 + 4, (_QWORD *)a1 + 6, (_QWORD *)a2 - 2, a3);
      return 1;
    default:
      v10 = a1 + 32;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(a1, (_QWORD *)a1 + 2, (_QWORD *)a1 + 4, a3);
      v11 = a1 + 48;
      if (a1 + 48 == a2)
        return 1;
      v12 = 0;
      v13 = 0;
      break;
  }
  while (1)
  {
    if ((*a3)(*(_QWORD *)v11, *((_QWORD *)v11 + 1), *(_QWORD *)v10, *((_QWORD *)v10 + 1)))
    {
      v14 = *(_QWORD *)v11;
      v15 = *((_QWORD *)v11 + 1);
      v16 = v12;
      while (1)
      {
        v17 = &a1[v16];
        *(_OWORD *)&a1[v16 + 48] = *(_OWORD *)&a1[v16 + 32];
        if (v16 == -32)
          break;
        v16 -= 16;
        if (((*a3)(v14, v15, *((_QWORD *)v17 + 2), *((_QWORD *)v17 + 3)) & 1) == 0)
        {
          v18 = &a1[v16 + 48];
          goto LABEL_12;
        }
      }
      v18 = a1;
LABEL_12:
      *(_QWORD *)v18 = v14;
      *((_QWORD *)v18 + 1) = v15;
      if (++v13 == 8)
        return v11 + 16 == a2;
    }
    v10 = v11;
    v12 += 16;
    v11 += 16;
    if (v11 == a2)
      return 1;
  }
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(_QWORD *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, uint64_t (**a5)(_QWORD, _QWORD, _QWORD, _QWORD))
{
  __n128 result;
  __int128 v11;
  __int128 v12;

  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(a1, a2, a3, a5);
  if ((*a5)(*a4, a4[1], *a3, a3[1]))
  {
    v11 = *(_OWORD *)a3;
    *(_OWORD *)a3 = *(_OWORD *)a4;
    *(_OWORD *)a4 = v11;
    if ((*a5)(*a3, a3[1], *a2, a2[1]))
    {
      v12 = *(_OWORD *)a2;
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(_OWORD *)a3 = v12;
      if ((*a5)(*a2, a2[1], *a1, a1[1]))
      {
        result = *(__n128 *)a1;
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(__n128 *)a2 = result;
      }
    }
  }
  return result;
}

__n128 std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(_QWORD *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, uint64_t (**a6)(_QWORD, _QWORD, _QWORD, _QWORD))
{
  __n128 v12;
  __n128 result;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v12 = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(a1, a2, a3, a4, a6);
  if (((unsigned int (*)(_QWORD, _QWORD, _QWORD, _QWORD, __n128))*a6)(*a5, a5[1], *a4, a4[1], v12))
  {
    v14 = *(_OWORD *)a4;
    *(_OWORD *)a4 = *(_OWORD *)a5;
    *(_OWORD *)a5 = v14;
    if ((*a6)(*a4, a4[1], *a3, a3[1]))
    {
      v15 = *(_OWORD *)a3;
      *(_OWORD *)a3 = *(_OWORD *)a4;
      *(_OWORD *)a4 = v15;
      if ((*a6)(*a3, a3[1], *a2, a2[1]))
      {
        v16 = *(_OWORD *)a2;
        *(_OWORD *)a2 = *(_OWORD *)a3;
        *(_OWORD *)a3 = v16;
        if ((*a6)(*a2, a2[1], *a1, a1[1]))
        {
          result = *(__n128 *)a1;
          *(_OWORD *)a1 = *(_OWORD *)a2;
          *(__n128 *)a2 = result;
        }
      }
    }
  }
  return result;
}

char *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*,abpk::Candidate*>(char *a1, char *a2, char *a3, uint64_t (**a4)(_QWORD, _QWORD, uint64_t, uint64_t))
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  __int128 v15;
  uint64_t v16;
  char *v17;
  char *v18;
  __int128 v21;

  if (a1 != a2)
  {
    v8 = a2 - a1;
    v9 = (a2 - a1) >> 4;
    if (a2 - a1 >= 17)
    {
      v10 = (unint64_t)(v9 - 2) >> 1;
      v11 = v10 + 1;
      v12 = &a1[16 * v10];
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>((uint64_t)a1, (unsigned int (**)(_QWORD, _QWORD, _QWORD, _QWORD))a4, v9, v12);
        v12 -= 16;
        --v11;
      }
      while (v11);
    }
    v13 = a2;
    if (a2 != a3)
    {
      v14 = a2;
      do
      {
        if ((*a4)(*(_QWORD *)v14, *((_QWORD *)v14 + 1), *(_QWORD *)a1, *((_QWORD *)a1 + 1)))
        {
          v15 = *(_OWORD *)v14;
          *(_OWORD *)v14 = *(_OWORD *)a1;
          *(_OWORD *)a1 = v15;
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>((uint64_t)a1, (unsigned int (**)(_QWORD, _QWORD, _QWORD, _QWORD))a4, v9, a1);
        }
        v14 += 16;
      }
      while (v14 != a3);
      v13 = a3;
    }
    if (v8 >= 17)
    {
      v16 = (unint64_t)v8 >> 4;
      v17 = a2 - 16;
      do
      {
        v21 = *(_OWORD *)a1;
        v18 = (char *)std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(a1, (unsigned int (**)(_QWORD, _QWORD, _QWORD, _QWORD))a4, v16);
        if (v17 == v18)
        {
          *(_OWORD *)v18 = v21;
        }
        else
        {
          *(_OWORD *)v18 = *(_OWORD *)v17;
          *(_OWORD *)v17 = v21;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>((uint64_t)a1, (uint64_t)(v18 + 16), a4, (v18 + 16 - a1) >> 4);
        }
        v17 -= 16;
      }
      while (v16-- > 2);
    }
    return v13;
  }
  return a3;
}

uint64_t std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(uint64_t result, unsigned int (**a2)(_QWORD, _QWORD, _QWORD, _QWORD), uint64_t a3, _QWORD *a4)
{
  unint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  int64_t v17;

  v4 = a3 - 2;
  if (a3 >= 2)
  {
    v5 = a4;
    v6 = result;
    v17 = v4 >> 1;
    if ((uint64_t)(v4 >> 1) >= ((uint64_t)a4 - result) >> 4)
    {
      v9 = ((uint64_t)a4 - result) >> 3;
      v10 = v9 + 1;
      v11 = (_QWORD *)(result + 16 * (v9 + 1));
      v12 = v9 + 2;
      if (v9 + 2 < a3 && (*a2)(*v11, v11[1], v11[2], v11[3]))
      {
        v11 += 2;
        v10 = v12;
      }
      result = ((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))*a2)(*v11, v11[1], *v5, v5[1]);
      if ((result & 1) == 0)
      {
        v13 = *v5;
        v14 = v5[1];
        do
        {
          v15 = v11;
          *(_OWORD *)v5 = *(_OWORD *)v11;
          if (v17 < v10)
            break;
          v16 = (2 * v10) | 1;
          v11 = (_QWORD *)(v6 + 16 * v16);
          if (2 * v10 + 2 < a3)
          {
            if ((*a2)(*v11, v11[1], v11[2], v11[3]))
            {
              v11 += 2;
              v16 = 2 * v10 + 2;
            }
          }
          result = ((uint64_t (*)(_QWORD, _QWORD, uint64_t, uint64_t))*a2)(*v11, v11[1], v13, v14);
          v5 = v15;
          v10 = v16;
        }
        while (!(_DWORD)result);
        *v15 = v13;
        v15[1] = v14;
      }
    }
  }
  return result;
}

_OWORD *std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(_OWORD *a1, unsigned int (**a2)(_QWORD, _QWORD, _QWORD, _QWORD), uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = 0;
  v7 = a3 - 2;
  if (a3 < 2)
    v7 = a3 - 1;
  v8 = v7 >> 1;
  do
  {
    v9 = &a1[v6 + 1];
    v10 = (2 * v6) | 1;
    v11 = 2 * v6 + 2;
    if (v11 < a3
      && (*a2)(*(_QWORD *)&a1[v6 + 1], *((_QWORD *)&a1[v6 + 1] + 1), *(_QWORD *)&a1[v6 + 2], *((_QWORD *)&a1[v6 + 2] + 1)))
    {
      ++v9;
      v10 = v11;
    }
    *a1 = *v9;
    a1 = v9;
    v6 = v10;
  }
  while (v10 <= v8);
  return v9;
}

uint64_t std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(uint64_t result, uint64_t a2, uint64_t (**a3)(_QWORD, _QWORD, uint64_t, uint64_t), uint64_t a4)
{
  unint64_t v4;
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  _OWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v4 = a4 - 2;
  if (a4 >= 2)
  {
    v7 = result;
    v8 = v4 >> 1;
    v9 = (_QWORD *)(result + 16 * (v4 >> 1));
    v10 = (_OWORD *)(a2 - 16);
    result = (*a3)(*v9, v9[1], *(_QWORD *)(a2 - 16), *(_QWORD *)(a2 - 8));
    if ((_DWORD)result)
    {
      v11 = *(_QWORD *)(a2 - 16);
      v12 = *(_QWORD *)(a2 - 8);
      do
      {
        v13 = v9;
        *v10 = *(_OWORD *)v9;
        if (!v8)
          break;
        v8 = (v8 - 1) >> 1;
        v9 = (_QWORD *)(v7 + 16 * v8);
        result = (*a3)(*v9, v9[1], v11, v12);
        v10 = v13;
      }
      while ((result & 1) != 0);
      *v13 = v11;
      v13[1] = v12;
    }
  }
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::Connection>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xCCCCCCCCCCCCCCDLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(20 * a2);
}

void std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::vector<float>>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<std::vector<float>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = *a1;
  v2 = a1[1];
  if (v2 != *a1)
  {
    v4 = a1[1];
    do
    {
      v6 = *(void **)(v4 - 24);
      v4 -= 24;
      v5 = v6;
      if (v6)
      {
        *(_QWORD *)(v2 - 16) = v5;
        operator delete(v5);
      }
      v2 = v4;
    }
    while (v4 != v3);
  }
  a1[1] = v3;
}

__n128 *std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,std::vector<float> *,std::vector<float> *,std::vector<float> *,0>(__n128 *a1, __n128 *a2, uint64_t a3)
{
  __n128 *v4;

  v4 = a1;
  if (a1 != a2)
  {
    do
    {
      std::vector<float>::__move_assign(a3, v4);
      v4 = (__n128 *)((char *)v4 + 24);
      a3 += 24;
    }
    while (v4 != a2);
    return a2;
  }
  return v4;
}

__n128 std::vector<float>::__move_assign(uint64_t a1, __n128 *a2)
{
  void *v4;
  __n128 result;

  v4 = *(void **)a1;
  if (v4)
  {
    *(_QWORD *)(a1 + 8) = v4;
    operator delete(v4);
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
  }
  result = *a2;
  *(__n128 *)a1 = *a2;
  *(_QWORD *)(a1 + 16) = a2[1].n128_u64[0];
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  a2[1].n128_u64[0] = 0;
  return result;
}

_QWORD *std::vector<float>::vector(_QWORD *a1, unint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<float>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    bzero(v4, 4 * a2);
    a1[1] = &v4[4 * a2];
  }
  return a1;
}

void sub_21083F8C8(_Unwind_Exception *exception_object)
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

char *std::vector<float>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 62)
    std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(4 * a2);
}

uint64_t std::vector<std::vector<float>>::__push_back_slow_path<std::vector<float> const&>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  _QWORD v14[2];
  char *v15;
  char *v16;
  uint64_t *v17;

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL)
    std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x555555555555555)
    v9 = 0xAAAAAAAAAAAAAAALL;
  else
    v9 = v5;
  v17 = a1 + 2;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<float>>>(v7, v9);
  else
    v10 = 0;
  v11 = &v10[24 * v4];
  v14[0] = v10;
  v14[1] = v11;
  v15 = v11;
  v16 = &v10[24 * v9];
  *(_QWORD *)v11 = 0;
  *((_QWORD *)v11 + 1) = 0;
  *((_QWORD *)v11 + 2) = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v11, *(const void **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 2);
  v15 += 24;
  std::vector<std::vector<float>>::__swap_out_circular_buffer(a1, v14);
  v12 = a1[1];
  std::__split_buffer<std::vector<float>>::~__split_buffer((uint64_t)v14);
  return v12;
}

void sub_21083FA58(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<std::vector<float>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<float>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_21083FAC8(_Unwind_Exception *exception_object)
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

uint64_t std::vector<std::vector<float>>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>,std::reverse_iterator<std::vector<float>*>,std::reverse_iterator<std::vector<float>*>>((uint64_t)(a1 + 2), a1[1], (_QWORD *)a1[1], *a1, (_QWORD *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<float>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(24 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>,std::reverse_iterator<std::vector<float>*>,std::reverse_iterator<std::vector<float>*>>(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  _QWORD v11[3];
  char v12;
  __int128 v13;
  __int128 v14;

  v7 = a7;
  *(_QWORD *)&v14 = a6;
  *((_QWORD *)&v14 + 1) = a7;
  v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    v9 = a6;
  }
  else
  {
    do
    {
      *(_QWORD *)(v7 - 24) = 0;
      *(_QWORD *)(v7 - 16) = 0;
      *(_QWORD *)(v7 - 8) = 0;
      v8 = *(_OWORD *)(a3 - 3);
      a3 -= 3;
      *(_OWORD *)(v7 - 24) = v8;
      *(_QWORD *)(v7 - 8) = a3[2];
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      v7 = *((_QWORD *)&v14 + 1) - 24;
      *((_QWORD *)&v14 + 1) -= 24;
    }
    while (a3 != a5);
    v9 = v14;
  }
  v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    v3 = *(void **)v1;
    if (*(_QWORD *)v1)
    {
      *(_QWORD *)(v1 + 8) = v3;
      operator delete(v3);
    }
    v1 += 24;
  }
}

uint64_t std::__split_buffer<std::vector<float>>::~__split_buffer(uint64_t a1)
{
  std::__split_buffer<std::vector<float>>::__destruct_at_end[abi:ne180100](a1, *(_QWORD *)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__split_buffer<std::vector<float>>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v5;

  v2 = *(_QWORD *)(a1 + 16);
  while (v2 != a2)
  {
    v5 = *(void **)(v2 - 24);
    *(_QWORD *)(a1 + 16) = v2 - 24;
    if (v5)
    {
      *(_QWORD *)(v2 - 16) = v5;
      operator delete(v5);
      v2 = *(_QWORD *)(a1 + 16);
    }
    else
    {
      v2 -= 24;
    }
  }
}

void std::vector<abpk::Human>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void *v2;
  uint64_t v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = (uint64_t)v1[1];
    v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 120;
        std::allocator<abpk::Human>::destroy[abi:ne180100]((uint64_t)(v1 + 2), v4);
      }
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::allocator<abpk::Human>::destroy[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (*(_BYTE *)(a2 + 96))
  {
    v3 = *(void **)(a2 + 72);
    if (v3)
    {
      *(_QWORD *)(a2 + 80) = v3;
      operator delete(v3);
    }
  }
  v4 = *(void **)(a2 + 48);
  if (v4)
  {
    *(_QWORD *)(a2 + 56) = v4;
    operator delete(v4);
  }
  v5 = *(void **)(a2 + 24);
  if (v5)
  {
    *(_QWORD *)(a2 + 32) = v5;
    operator delete(v5);
  }
  v6 = *(void **)a2;
  if (*(_QWORD *)a2)
  {
    *(_QWORD *)(a2 + 8) = v6;
    operator delete(v6);
  }
}

uint64_t std::vector<abpk::Human>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<abpk::Human>,std::reverse_iterator<abpk::Human*>,std::reverse_iterator<abpk::Human*>,std::reverse_iterator<abpk::Human*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::Human>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x222222222222223)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(120 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<abpk::Human>,std::reverse_iterator<abpk::Human*>,std::reverse_iterator<abpk::Human*>,std::reverse_iterator<abpk::Human*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v9;
  uint64_t v11;
  _QWORD v13[3];
  char v14;
  __int128 v15;
  __int128 v16;

  v7 = a7;
  *(_QWORD *)&v16 = a6;
  *((_QWORD *)&v16 + 1) = a7;
  v15 = v16;
  v13[0] = a1;
  v13[1] = &v15;
  v13[2] = &v16;
  v14 = 0;
  if (a3 == a5)
  {
    v11 = a6;
  }
  else
  {
    v9 = a3;
    do
    {
      v9 -= 120;
      std::allocator<abpk::Human>::construct[abi:ne180100]<abpk::Human,abpk::Human>(a1, v7 - 120, v9);
      v7 = *((_QWORD *)&v16 + 1) - 120;
      *((_QWORD *)&v16 + 1) -= 120;
    }
    while (v9 != a5);
    v11 = v16;
  }
  v14 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<abpk::Human>,std::reverse_iterator<abpk::Human*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v13);
  return v11;
}

void std::allocator<abpk::Human>::construct[abi:ne180100]<abpk::Human,abpk::Human>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_OWORD *)a2 = *(_OWORD *)a3;
  *(_QWORD *)(a2 + 16) = *(_QWORD *)(a3 + 16);
  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  *(_OWORD *)(a2 + 24) = *(_OWORD *)(a3 + 24);
  *(_QWORD *)(a2 + 40) = *(_QWORD *)(a3 + 40);
  *(_QWORD *)(a3 + 24) = 0;
  *(_QWORD *)(a3 + 32) = 0;
  *(_QWORD *)(a3 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 64) = 0;
  *(_OWORD *)(a2 + 48) = *(_OWORD *)(a3 + 48);
  *(_QWORD *)(a2 + 64) = *(_QWORD *)(a3 + 64);
  *(_QWORD *)(a3 + 48) = 0;
  *(_QWORD *)(a3 + 56) = 0;
  *(_QWORD *)(a3 + 64) = 0;
  *(_BYTE *)(a2 + 72) = 0;
  *(_BYTE *)(a2 + 96) = 0;
  if (*(_BYTE *)(a3 + 96))
  {
    *(_QWORD *)(a2 + 72) = 0;
    *(_QWORD *)(a2 + 80) = 0;
    *(_QWORD *)(a2 + 88) = 0;
    *(_OWORD *)(a2 + 72) = *(_OWORD *)(a3 + 72);
    *(_QWORD *)(a2 + 88) = *(_QWORD *)(a3 + 88);
    *(_QWORD *)(a3 + 72) = 0;
    *(_QWORD *)(a3 + 80) = 0;
    *(_QWORD *)(a3 + 88) = 0;
    *(_BYTE *)(a2 + 96) = 1;
  }
  v3 = *(_QWORD *)(a3 + 104);
  *(_QWORD *)(a2 + 109) = *(_QWORD *)(a3 + 109);
  *(_QWORD *)(a2 + 104) = v3;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<abpk::Human>,std::reverse_iterator<abpk::Human*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<abpk::Human>,std::reverse_iterator<abpk::Human*>>::operator()[abi:ne180100]((uint64_t *)a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<abpk::Human>,std::reverse_iterator<abpk::Human*>>::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(a1[2] + 8);
  v2 = *(_QWORD *)(a1[1] + 8);
  if (v1 != v2)
  {
    v3 = *a1;
    do
    {
      std::allocator<abpk::Human>::destroy[abi:ne180100](v3, v1);
      v1 += 120;
    }
    while (v1 != v2);
  }
}

void **std::__split_buffer<abpk::Human>::~__split_buffer(void **a1)
{
  std::__split_buffer<abpk::Human>::clear[abi:ne180100](a1);
  if (*a1)
    operator delete(*a1);
  return a1;
}

void std::__split_buffer<abpk::Human>::clear[abi:ne180100](_QWORD *a1)
{
  uint64_t i;
  uint64_t v2;
  uint64_t v4;

  v2 = a1[1];
  for (i = a1[2]; i != v2; i = a1[2])
  {
    v4 = a1[4];
    a1[2] = i - 120;
    std::allocator<abpk::Human>::destroy[abi:ne180100](v4, i - 120);
  }
}

uint64_t _ZNSt3__16vectorIN4abpk5HumanENS_9allocatorIS2_EEE24__emplace_back_slow_pathIJNS0_IDv2_fNS3_IS7_EEEEEEEPS2_DpOT_(uint64_t *a1, uint64_t a2)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  void *v10;
  char *v11;
  char *v12;
  char *v13;
  uint64_t *v14;

  v3 = 0xEEEEEEEEEEEEEEEFLL * ((a1[1] - *a1) >> 3);
  v4 = v3 + 1;
  if (v3 + 1 > 0x222222222222222)
    std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
  if (0xDDDDDDDDDDDDDDDELL * ((a1[2] - *a1) >> 3) > v4)
    v4 = 0xDDDDDDDDDDDDDDDELL * ((a1[2] - *a1) >> 3);
  if (0xEEEEEEEEEEEEEEEFLL * ((a1[2] - *a1) >> 3) >= 0x111111111111111)
    v6 = 0x222222222222222;
  else
    v6 = v4;
  v14 = a1 + 2;
  if (v6)
    v7 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::Human>>((uint64_t)(a1 + 2), v6);
  else
    v7 = 0;
  v10 = v7;
  v11 = &v7[120 * v3];
  v13 = &v7[120 * v6];
  _ZNSt3__19allocatorIN4abpk5HumanEE9constructB8ne180100IS2_JNS_6vectorIDv2_fNS0_IS6_EEEEEEEvPT_DpOT0_((uint64_t)(a1 + 2), (uint64_t)v11, a2);
  v12 = v11 + 120;
  std::vector<abpk::Human>::__swap_out_circular_buffer(a1, &v10);
  v8 = a1[1];
  std::__split_buffer<abpk::Human>::~__split_buffer(&v10);
  return v8;
}

void sub_21084023C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<abpk::Human>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

void _ZNSt3__19allocatorIN4abpk5HumanEE9constructB8ne180100IS2_JNS_6vectorIDv2_fNS0_IS6_EEEEEEEvPT_DpOT0_(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *__p[2];
  uint64_t v4;

  *(_OWORD *)__p = *(_OWORD *)a3;
  v4 = *(_QWORD *)(a3 + 16);
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  *(_QWORD *)a3 = 0;
  abpk::Human::Human(a2, __p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

void sub_2108402A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_2108404DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2108405EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

double simd_quaternion(simd_float4x4 a1)
{
  float v1;
  float v3;
  float32x2_t v4;
  float32x2_t v5;
  float32x2_t v6;
  float32x2_t v7;
  float32x2_t v8;
  float32x2_t v9;
  float32x2_t v10;
  unsigned __int32 v11;
  float32x2_t v16;
  float32x2_t v17;
  float32x2_t v18;

  v1 = a1.columns[2].f32[2] + (float)(a1.columns[0].f32[0] + a1.columns[1].f32[1]);
  if (v1 >= 0.0)
  {
    a1.columns[3].f32[0] = sqrtf(v1 + 1.0);
    v5 = vrecpe_f32((float32x2_t)COERCE_UNSIGNED_INT(a1.columns[3].f32[0] + a1.columns[3].f32[0]));
    v6 = vmul_f32(v5, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(a1.columns[3].f32[0] + a1.columns[3].f32[0]), v5));
    *(float32x2_t *)a1.columns[3].f32 = vmul_n_f32(vsub_f32((float32x2_t)vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)a1.columns[1], (int8x16_t)a1.columns[1], 8uLL), *(int32x2_t *)a1.columns[2].f32), (float32x2_t)vext_s8(*(int8x8_t *)a1.columns[2].f32, (int8x8_t)*(_OWORD *)&vextq_s8((int8x16_t)a1.columns[0], (int8x16_t)a1.columns[0], 8uLL), 4uLL)), vmul_f32(v6, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(a1.columns[3].f32[0] + a1.columns[3].f32[0]), v6)).f32[0]);
  }
  else if (a1.columns[0].f32[0] < a1.columns[1].f32[1] || a1.columns[0].f32[0] < a1.columns[2].f32[2])
  {
    v3 = 1.0 - a1.columns[0].f32[0];
    if (a1.columns[1].f32[1] >= a1.columns[2].f32[2])
    {
      a1.columns[3].f32[0] = sqrtf(a1.columns[1].f32[1] + (float)(v3 - a1.columns[2].f32[2]));
      a1.columns[3].f32[0] = a1.columns[3].f32[0] + a1.columns[3].f32[0];
      v16 = vrecpe_f32((float32x2_t)a1.columns[3].u32[0]);
      v17 = vmul_f32(v16, vrecps_f32((float32x2_t)a1.columns[3].u32[0], v16));
      v18.i32[0] = vmul_f32(v17, vrecps_f32((float32x2_t)a1.columns[3].u32[0], v17)).u32[0];
      v17.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_lane_s32(*(int32x2_t *)a1.columns[0].f32, 1), *(float32x2_t *)a1.columns[1].f32).u32[0];
      v17.i32[1] = a1.columns[3].i32[0];
      v18.i32[1] = 0.25;
      *(float32x2_t *)a1.columns[3].f32 = vmul_f32(v17, v18);
    }
    else
    {
      v4 = (float32x2_t)__PAIR64__(a1.columns[0].u32[1], COERCE_UNSIGNED_INT(sqrtf(a1.columns[2].f32[2] + (float)(v3 - a1.columns[1].f32[1]))));
      *(float32x2_t *)a1.columns[2].f32 = vadd_f32((float32x2_t)vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)a1.columns[0], (int8x16_t)a1.columns[0], 8uLL), (int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)a1.columns[1], (int8x16_t)a1.columns[1], 8uLL)), *(float32x2_t *)a1.columns[2].f32);
      *(int32x2_t *)a1.columns[1].f32 = vdup_lane_s32(*(int32x2_t *)a1.columns[1].f32, 0);
      a1.columns[1].i32[0] = 2.0;
      a1.columns[1].i32[0] = vmul_f32(v4, *(float32x2_t *)a1.columns[1].f32).u32[0];
      *(float32x2_t *)a1.columns[3].f32 = vrecpe_f32((float32x2_t)a1.columns[1].u32[0]);
      *(float32x2_t *)a1.columns[3].f32 = vmul_f32(*(float32x2_t *)a1.columns[3].f32, vrecps_f32((float32x2_t)a1.columns[1].u32[0], *(float32x2_t *)a1.columns[3].f32));
      *(float32x2_t *)a1.columns[3].f32 = vmul_n_f32(*(float32x2_t *)a1.columns[2].f32, vmul_f32(*(float32x2_t *)a1.columns[3].f32, vrecps_f32((float32x2_t)a1.columns[1].u32[0], *(float32x2_t *)a1.columns[3].f32)).f32[0]);
      __asm { FMOV            V2.2S, #0.25 }
    }
  }
  else
  {
    *(int32x2_t *)a1.columns[3].f32 = vdup_lane_s32(*(int32x2_t *)a1.columns[1].f32, 0);
    v7 = vadd_f32(*(float32x2_t *)a1.columns[0].f32, *(float32x2_t *)a1.columns[3].f32);
    a1.columns[3].i32[0] = 2.0;
    v8.i32[0] = vmul_f32((float32x2_t)__PAIR64__(a1.columns[0].u32[1], COERCE_UNSIGNED_INT(sqrtf(a1.columns[0].f32[0]+ (float)((float)(1.0 - a1.columns[1].f32[1]) - a1.columns[2].f32[2])))), *(float32x2_t *)a1.columns[3].f32).u32[0];
    v8.i32[1] = v7.i32[1];
    v9 = vrecpe_f32((float32x2_t)v8.u32[0]);
    v10 = vmul_f32(v9, vrecps_f32((float32x2_t)v8.u32[0], v9));
    v11 = vmul_f32(v10, vrecps_f32((float32x2_t)v8.u32[0], v10)).u32[0];
    __asm { FMOV            V5.2S, #0.25 }
    _D5.i32[1] = v11;
    *(float32x2_t *)a1.columns[3].f32 = vmul_f32(v8, _D5);
  }
  return *(double *)a1.columns[3].i64;
}

void sub_210840950(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210840B24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id a18)
{
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

void sub_210840BC8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210840D0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210840F0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
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

void sub_2108411EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21084159C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_2108419F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

_QWORD *std::vector<ABPKTransform>::vector(_QWORD *a1, unint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<ABPKTransform>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    bzero(v4, 32 * a2);
    a1[1] = &v4[32 * a2];
  }
  return a1;
}

void sub_210841B3C(_Unwind_Exception *exception_object)
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

char *std::vector<ABPKTransform>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 59)
    std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ABPKTransform>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[32 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ABPKTransform>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(32 * a2);
}

_QWORD *std::vector<simd_float4x4>::vector(_QWORD *a1, unint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<simd_float4x4>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    bzero(v4, a2 << 6);
    a1[1] = &v4[64 * a2];
  }
  return a1;
}

void sub_210841C24(_Unwind_Exception *exception_object)
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

char *std::vector<simd_float4x4>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 58)
    std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<simd_float4x4>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[64 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<simd_float4x4>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 58)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(a2 << 6);
}

void sub_21084215C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210842C40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,void **a29)
{
  void *v29;
  void *v30;
  uint64_t v31;

  a29 = (void **)(v31 - 160);
  std::vector<abpk::Human>::__destroy_vector::operator()[abi:ne180100](&a29);
  *(_QWORD *)(v31 - 160) = &a25;
  std::vector<abpk::HeatmapPersonData>::__destroy_vector::operator()[abi:ne180100]((void ***)(v31 - 160));

  _Unwind_Resume(a1);
}

void sub_210842DFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_210842EEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_210842FA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_210843054(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2108430E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_210843238(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210843350(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void std::vector<abpk::HeatmapPersonData>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void *v2;
  uint64_t v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = (uint64_t)v1[1];
    v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 56;
        std::allocator<abpk::HeatmapPersonData>::destroy[abi:ne180100]((uint64_t)(v1 + 2), v4);
      }
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::allocator<abpk::HeatmapPersonData>::destroy[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  v3 = *(void **)(a2 + 24);
  if (v3)
  {
    *(_QWORD *)(a2 + 32) = v3;
    operator delete(v3);
  }
  v4 = *(void **)a2;
  if (*(_QWORD *)a2)
  {
    *(_QWORD *)(a2 + 8) = v4;
    operator delete(v4);
  }
}

void abpk::getJointPositionsAndMaximas(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, char a5, unsigned int a6, uint64_t a7, _QWORD *a8)
{
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void **v16;
  char **v17;
  _QWORD *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v30;
  char *v31;
  char *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  int v37;
  char *v38;
  char *v39;
  char *v40;
  char *v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  __int16 *v45;
  int v48;
  int v50;
  __int16 v51;
  char **v53;
  unint64_t v54;
  void **v55;
  unint64_t v56;
  _QWORD *v57;
  void *v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  char *v63;
  char *v64;
  char *v65;
  char *v66;
  char *v67;
  int v68;
  _OWORD **v69;
  uint64_t v70;
  _OWORD *v71;
  _OWORD *v72;
  _OWORD *v73;
  int v74;
  uint64_t v75;
  _QWORD *v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  void **v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  char *v87;
  char *v88;
  char *v89;
  char *v90;
  char *v91;
  uint64_t v95;
  uint64_t v96;
  uint64_t v98;
  unint64_t v99;
  uint64_t v101;
  void **v102;
  uint64_t (*v103)(void);

  v8 = *a3 - 1;
  v96 = v8;
  if ((a5 & 1) != 0)
  {
    if (*a3 == 1)
      return;
    v9 = 0;
    v10 = 0;
    v101 = a3[1];
    v98 = a4[1];
    v99 = a3[2];
    if (v99 <= 1)
      v11 = 1;
    else
      v11 = a3[2];
    do
    {
      v95 = v9;
      if (v101)
      {
        v12 = 0;
        v13 = *a4 * v9;
        v14 = a2 + 2 * v13;
        v15 = a1 + 2 * v13;
        v16 = (void **)(a7 + 24 * v9);
        v17 = (char **)(v16 + 1);
        v18 = v16 + 2;
        v19 = v99;
        v102 = v16;
        do
        {
          if (v19)
          {
            v20 = 0;
            v21 = v12 * v98;
            do
            {
              _H9 = *(_WORD *)(v15 + 2 * (v20 + v21));
              _H0 = *(_WORD *)(v14 + 2 * (v20 + v21));
              __asm
              {
                FCVT            S1, H9
                FCVT            S0, H0
              }
              if (_NF ^ _VF | _ZF)
                _ZF = 0;
              else
                _ZF = _S1 == _S0;
              if (_ZF)
              {
                v30 = *v17;
                if ((unint64_t)*v17 >= *v18)
                {
                  v32 = (char *)*v16;
                  v33 = (v30 - (_BYTE *)*v16) >> 4;
                  v34 = v33 + 1;
                  if ((unint64_t)(v33 + 1) >> 60)
                    std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
                  v35 = *v18 - (_QWORD)v32;
                  if (v35 >> 3 > v34)
                    v34 = v35 >> 3;
                  if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFF0)
                    v36 = 0xFFFFFFFFFFFFFFFLL;
                  else
                    v36 = v34;
                  if (v36)
                  {
                    v37 = v10;
                    v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::peak>>((uint64_t)v18, v36);
                    v16 = v102;
                    v10 = v37;
                    v39 = v38;
                    v30 = *v17;
                    v32 = (char *)*v102;
                  }
                  else
                  {
                    v39 = 0;
                  }
                  v40 = &v39[16 * v33];
                  *(_DWORD *)v40 = v20;
                  *((_DWORD *)v40 + 1) = v12;
                  *((_WORD *)v40 + 4) = _H9;
                  *((_DWORD *)v40 + 3) = v10;
                  v41 = v40;
                  if (v30 != v32)
                  {
                    do
                    {
                      *((_OWORD *)v41 - 1) = *((_OWORD *)v30 - 1);
                      v41 -= 16;
                      v30 -= 16;
                    }
                    while (v30 != v32);
                    v32 = (char *)*v16;
                  }
                  *v16 = v41;
                  v31 = v40 + 16;
                  *v17 = v40 + 16;
                  *v18 = &v39[16 * v36];
                  if (v32)
                  {
                    v42 = v10;
                    operator delete(v32);
                    v16 = v102;
                    v10 = v42;
                  }
                }
                else
                {
                  *(_DWORD *)v30 = v20;
                  *((_DWORD *)v30 + 1) = v12;
                  *((_WORD *)v30 + 4) = _H9;
                  v31 = v30 + 16;
                  *((_DWORD *)v30 + 3) = v10;
                }
                ++v10;
                *v17 = v31;
              }
              ++v20;
            }
            while (v20 != v11);
            v19 = v99;
          }
          ++v12;
        }
        while (v12 != v101);
      }
      v8 = v96;
      v9 = v95 + 1;
    }
    while (v95 + 1 != v96);
  }
  else
  {
    if (!a6)
    {
      v10 = 0;
      if (*a3 == 1)
        return;
      goto LABEL_58;
    }
    v43 = 0;
    v44 = a6;
    do
    {
      v45 = (__int16 *)(a1 + 8 * v43);
      _H0 = *v45;
      __asm { FCVT            S0, H0 }
      v48 = (int)_S0;
      LOWORD(_S0) = v45[1];
      __asm { FCVT            S0, H0 }
      v50 = (int)_S0;
      v51 = v45[3];
      LOWORD(_S0) = v45[2];
      __asm { FCVT            S0, H0 }
      v53 = (char **)(a7 + 24 * (int)_S0);
      v55 = (void **)(v53 + 1);
      v54 = (unint64_t)v53[1];
      v57 = v53 + 2;
      v56 = (unint64_t)v53[2];
      if (v54 >= v56)
      {
        v59 = (uint64_t)(v54 - (_QWORD)*v53) >> 4;
        v60 = v59 + 1;
        if ((unint64_t)(v59 + 1) >> 60)
          std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
        v61 = v56 - (_QWORD)*v53;
        if (v61 >> 3 > v60)
          v60 = v61 >> 3;
        if ((unint64_t)v61 >= 0x7FFFFFFFFFFFFFF0)
          v62 = 0xFFFFFFFFFFFFFFFLL;
        else
          v62 = v60;
        if (v62)
          v63 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::peak>>((uint64_t)v57, v62);
        else
          v63 = 0;
        v64 = &v63[16 * v59];
        *(_DWORD *)v64 = v48;
        *((_DWORD *)v64 + 1) = v50;
        *((_WORD *)v64 + 4) = v51;
        *((_DWORD *)v64 + 3) = 0;
        v65 = (char *)*v55;
        v66 = *v53;
        v67 = v64;
        if (*v55 != *v53)
        {
          do
          {
            *((_OWORD *)v67 - 1) = *((_OWORD *)v65 - 1);
            v67 -= 16;
            v65 -= 16;
          }
          while (v65 != v66);
          v65 = *v53;
        }
        *v53 = v67;
        v58 = v64 + 16;
        *v55 = v64 + 16;
        *v57 = &v63[16 * v62];
        if (v65)
          operator delete(v65);
      }
      else
      {
        *(_DWORD *)v54 = v48;
        *(_DWORD *)(v54 + 4) = v50;
        *(_WORD *)(v54 + 8) = v51;
        v58 = (void *)(v54 + 16);
        *(_DWORD *)(v54 + 12) = 0;
      }
      *v55 = v58;
      ++v43;
    }
    while (v43 != v44);
    v10 = 0;
  }
  if (!v8)
    return;
LABEL_58:
  v68 = v10;
  v69 = (_OWORD **)(a7 + 8);
  v70 = v8;
  do
  {
    v71 = *(v69 - 1);
    v72 = *v69;
    v103 = (uint64_t (*)(void))abpk::isDuplicate;
    v73 = std::__unique[abi:ne180100]<std::_ClassicAlgPolicy,std::__wrap_iter<abpk::peak *>,std::__wrap_iter<abpk::peak *>,BOOL (*&)(abpk::peak const&,abpk::peak const&)>(v71, v72, &v103);
    if (*v69 != v73)
      *v69 = v73;
    v69 += 3;
    --v70;
  }
  while (v70);
  v74 = v68;
  v75 = 0;
  v76 = a8 + 2;
  do
  {
    v77 = (uint64_t *)(a7 + 24 * v75);
    v78 = *v77;
    if ((int)((unint64_t)(v77[1] - *v77) >> 4) >= 1)
    {
      v79 = 0;
      v80 = (void **)a8;
      v81 = (char *)a8[1];
      do
      {
        v82 = v78 + 16 * v79;
        *(_DWORD *)(v82 + 12) = v74;
        if ((unint64_t)v81 >= *v76)
        {
          v83 = (v81 - (_BYTE *)*v80) >> 4;
          if ((unint64_t)(v83 + 1) >> 60)
            std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
          v84 = *v76 - (_QWORD)*v80;
          v85 = v84 >> 3;
          if (v84 >> 3 <= (unint64_t)(v83 + 1))
            v85 = v83 + 1;
          if ((unint64_t)v84 >= 0x7FFFFFFFFFFFFFF0)
            v86 = 0xFFFFFFFFFFFFFFFLL;
          else
            v86 = v85;
          if (v86)
          {
            v87 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::peak>>((uint64_t)v76, v86);
            v80 = (void **)a8;
          }
          else
          {
            v87 = 0;
          }
          v88 = &v87[16 * v83];
          *(_OWORD *)v88 = *(_OWORD *)v82;
          v90 = (char *)*v80;
          v89 = (char *)v80[1];
          v91 = v88;
          if (v89 != *v80)
          {
            do
            {
              *((_OWORD *)v91 - 1) = *((_OWORD *)v89 - 1);
              v91 -= 16;
              v89 -= 16;
            }
            while (v89 != v90);
            v89 = (char *)*v80;
          }
          v81 = v88 + 16;
          *v80 = v91;
          v80[1] = v88 + 16;
          v80[2] = &v87[16 * v86];
          if (v89)
          {
            operator delete(v89);
            v80 = (void **)a8;
          }
        }
        else
        {
          *(_OWORD *)v81 = *(_OWORD *)v82;
          v81 += 16;
        }
        ++v74;
        v80[1] = v81;
        ++v79;
        v78 = *v77;
      }
      while (v79 < (int)((unint64_t)(v77[1] - *v77) >> 4));
    }
    ++v75;
  }
  while (v75 != v96);
}

void abpk::extractHumans(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X5>, char a7@<W6>, unsigned int a8@<W7>, uint64_t *a9@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  double v14;
  int *v15;
  int v16;
  int v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int *v27;
  _DWORD *v28;
  float v29;
  float v30;
  float v31;
  double v32;
  double v33;
  unint64_t *v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float16x4_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  char *v48;
  unint64_t *v49;
  char *v50;
  char *v51;
  unint64_t v52;
  uint64_t v53;
  unsigned int v54;
  float v55;
  float v56;
  float v57;
  float v66;
  float32x2_t *v67;
  float32x2_t *v68;
  float32x2_t *v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  unint64_t v73;
  char *v74;
  char *v75;
  char *v76;
  char *v77;
  char *v78;
  unint64_t v79;
  uint64_t v80;
  char *v81;
  char *v82;
  uint64_t v83;
  char *v84;
  _DWORD *v85;
  _QWORD *v86;
  char *v87;
  _DWORD *v88;
  uint64_t v89;
  unint64_t v90;
  int *v91;
  int v92;
  int v93;
  uint64_t v94;
  _DWORD *v95;
  int v96;
  int v97;
  int v98;
  int v99;
  unint64_t v100;
  unint64_t v101;
  char *v102;
  char *v103;
  char *v104;
  __int128 v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t v110;
  int *v111;
  uint64_t v112;
  uint64_t v113;
  __n128 *v114;
  char *v115;
  uint64_t v116;
  int v117;
  int v118;
  int v119;
  int *v120;
  int *v121;
  int v122;
  float v123;
  _QWORD *v124;
  uint64_t v125;
  int v126;
  uint64_t *v127;
  int v128;
  uint64_t *v129;
  uint64_t v130;
  uint64_t v131;
  float *v134;
  float *v135;
  uint64_t v136;
  uint64_t v137;
  _QWORD *v144;
  void *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  float v153;
  char *v154;
  char *v155;
  _QWORD *v156;
  char *v157;
  void *v158;
  void *v159;
  __n128 *v160;
  int64_t v161;
  unint64_t v162;
  uint64_t v163;
  char *v164;
  float v165;
  __n128 *v166;
  _QWORD *n128_u64;
  __n128 *v168;
  void *v169;
  void *v170;
  unint64_t v172;
  uint64_t v174;
  float32x2_t v175;
  float32x2_t v176;
  float32x2_t *v177;
  float32x2_t *v178;
  float32x2_t *v179;
  uint64_t v180;
  unint64_t v181;
  unint64_t v182;
  char *v183;
  uint64_t v184;
  unint64_t v185;
  float32x2_t *v186;
  _DWORD *v187;
  _DWORD *v188;
  float32x2_t v189;
  _DWORD *v190;
  float32x2_t v191;
  unint64_t v192;
  uint64_t v193;
  uint64_t *v194;
  uint64_t v195;
  void *v196;
  uint64_t v197;
  void *v198;
  uint64_t v200;
  uint64_t v201;
  uint64_t *v202;
  uint64_t *v203;
  uint64_t v204;
  uint64_t *v205;
  int *v206;
  float v208;
  uint64_t *v209;
  uint64_t v210;
  unint64_t __len;
  _DWORD **__lena;
  uint64x2_t __lenb;
  void *__b;
  float32x2_t *v215;
  unint64_t v216;
  void *v217;
  _QWORD v218[2];
  _OWORD v219[28];
  uint64_t v220;
  void *v221;
  void *__p;
  unint64_t v223;
  _OWORD v224[27];
  uint64_t v225;

  v225 = *MEMORY[0x24BDAC8D0];
  v220 = 0;
  memset(v219, 0, sizeof(v219));
  v217 = 0;
  v218[0] = 0;
  v218[1] = 0;
  abpk::getJointPositionsAndMaximas(a1, a2, a4, a6, a7, a8, (uint64_t)v219, &v217);
  v12 = 0;
  v200 = *a4;
  v13 = *a4 - 1;
  memset(v224, 0, sizeof(v224));
  v14 = 1.0e-12;
  do
  {
    v201 = v12;
    v15 = &abpk::bones[2 * v12];
    v16 = *v15;
    v17 = v15[1];
    __b = 0;
    v215 = 0;
    v216 = 0;
    v18 = (uint64_t *)v219 + 3 * v16;
    v19 = v18[1];
    v202 = v18 + 1;
    v203 = v18;
    v20 = *v18;
    if (v19 != v20)
    {
      v21 = (uint64_t *)v219 + 3 * v17;
      v23 = v21 + 1;
      v22 = v21[1];
      v209 = v21;
      v24 = *v21;
      if (v22 != *v21)
      {
        if ((int)((unint64_t)(v19 - v20) >> 4) < 1)
        {
          v78 = 0;
          v77 = 0;
        }
        else
        {
          v204 = 0;
          v205 = v21 + 1;
          v206 = (int *)((char *)&abpk::s_bonesmap + 8 * v201);
          do
          {
            if ((int)((unint64_t)(v22 - v24) >> 4) >= 1)
            {
              v25 = 0;
              v26 = v20 + 16 * v204;
              v27 = (int *)(v26 + 4);
              do
              {
                v28 = (_DWORD *)(v24 + 16 * v25);
                v29 = (float)(*v28 - *(_DWORD *)v26);
                v30 = (float)(v28[1] - *v27);
                v31 = sqrtf((float)(v30 * v30) + (float)(v29 * v29));
                v32 = v31;
                if (v31 >= v14)
                {
                  v33 = v14;
                  v34 = 0;
                  v35 = 0;
                  v208 = (float)*(unint64_t *)(a5 + 8);
                  v36 = v206[1];
                  v37 = *v206;
                  v38 = v29 / v31;
                  v39 = v30 / v31;
                  __p = 0;
                  v221 = 0;
                  v223 = 0;
                  v40 = v29 / 10.0;
                  v41 = v30 / 10.0;
                  do
                  {
                    *(double *)&v42 = (float)((float)*v27 + (float)((float)v35 * v41)) + 0.5;
                    v43 = a6[1] * (int)*(_QWORD *)&v42
                        + (int)((float)((float)*(int *)v26 + (float)((float)v35 * v40)) + 0.5);
                    v42.i16[0] = *(_WORD *)(a3 + 2 * (v43 + *a6 * v37));
                    v42.i16[1] = *(_WORD *)(a3 + 2 * (v43 + *a6 * v36));
                    v44 = vcvtq_f32_f16(v42).u64[0];
                    if ((unint64_t)v34 >= v223)
                    {
                      __len = v44;
                      v45 = ((char *)v34 - (_BYTE *)v221) >> 3;
                      if ((unint64_t)(v45 + 1) >> 61)
                        std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
                      v46 = (uint64_t)(v223 - (_QWORD)v221) >> 2;
                      if (v46 <= v45 + 1)
                        v46 = v45 + 1;
                      if (v223 - (unint64_t)v221 >= 0x7FFFFFFFFFFFFFF8)
                        v47 = 0x1FFFFFFFFFFFFFFFLL;
                      else
                        v47 = v46;
                      if (v47)
                        v48 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v223, v47);
                      else
                        v48 = 0;
                      v49 = (unint64_t *)&v48[8 * v45];
                      *v49 = __len;
                      v34 = v49 + 1;
                      v50 = (char *)__p;
                      v51 = (char *)v221;
                      if (__p != v221)
                      {
                        do
                        {
                          v52 = *((_QWORD *)v50 - 1);
                          v50 -= 8;
                          *--v49 = v52;
                        }
                        while (v50 != v51);
                        v50 = (char *)v221;
                      }
                      v221 = v49;
                      __p = v34;
                      v223 = (unint64_t)&v48[8 * v47];
                      if (v50)
                        operator delete(v50);
                    }
                    else
                    {
                      *v34++ = v44;
                    }
                    __p = v34;
                    ++v35;
                  }
                  while (v35 != 10);
                  v53 = 0;
                  v54 = 0;
                  v55 = 0.0;
                  do
                  {
                    v56 = vmlas_n_f32(vmuls_lane_f32(v39, *(float32x2_t *)((char *)v221 + v53), 1), v38, COERCE_FLOAT(*(_QWORD *)((char *)v221 + v53)));
                    v55 = v55 + v56;
                    if (v56 > 0.05)
                      ++v54;
                    v53 += 8;
                  }
                  while (v53 != 80);
                  __p = v221;
                  operator delete(v221);
                  v13 = v200 - 1;
                  v14 = v33;
                  v23 = v205;
                  if (v54 >= 7)
                  {
                    v57 = fmin(v208 * 0.5 / v32 + -1.0, 0.0) + v55 / 10.0;
                    if (v57 > 0.0)
                    {
                      _H0 = *(_WORD *)(v26 + 8);
                      __asm { FCVT            S0, H0 }
                      _H1 = *(_WORD *)(v24 + 16 * v25 + 8);
                      __asm { FCVT            S1, H1 }
                      v66 = (float)(v57 + _S0) + _S1;
                      v67 = v215;
                      if ((unint64_t)v215 >= v216)
                      {
                        v69 = (float32x2_t *)__b;
                        v70 = ((char *)v215 - (_BYTE *)__b) >> 4;
                        v71 = v70 + 1;
                        if ((unint64_t)(v70 + 1) >> 60)
                          std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
                        v72 = v216 - (_QWORD)__b;
                        if ((uint64_t)(v216 - (_QWORD)__b) >> 3 > v71)
                          v71 = v72 >> 3;
                        if ((unint64_t)v72 >= 0x7FFFFFFFFFFFFFF0)
                          v73 = 0xFFFFFFFFFFFFFFFLL;
                        else
                          v73 = v71;
                        if (v73)
                        {
                          v74 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::peak>>((uint64_t)&v216, v73);
                          v69 = (float32x2_t *)__b;
                          v67 = v215;
                        }
                        else
                        {
                          v74 = 0;
                        }
                        v75 = &v74[16 * v70];
                        *(_DWORD *)v75 = v204;
                        *((_DWORD *)v75 + 1) = v25;
                        *((float *)v75 + 2) = v57;
                        *((float *)v75 + 3) = v66;
                        v76 = v75;
                        if (v67 != v69)
                        {
                          do
                          {
                            *((_OWORD *)v76 - 1) = *(_OWORD *)v67[-2].f32;
                            v76 -= 16;
                            v67 -= 2;
                          }
                          while (v67 != v69);
                          v69 = (float32x2_t *)__b;
                        }
                        v68 = (float32x2_t *)(v75 + 16);
                        __b = v76;
                        v215 = (float32x2_t *)(v75 + 16);
                        v216 = (unint64_t)&v74[16 * v73];
                        if (v69)
                          operator delete(v69);
                      }
                      else
                      {
                        v215->i32[0] = v204;
                        v67->i32[1] = v25;
                        v68 = v67 + 2;
                        v67[1].f32[0] = v57;
                        v67[1].f32[1] = v66;
                      }
                      v215 = v68;
                    }
                  }
                }
                ++v25;
                v22 = *v23;
                v24 = *v209;
              }
              while (v25 < (int)((unint64_t)(*v23 - *v209) >> 4));
              v19 = *v202;
              v20 = *v203;
            }
            ++v204;
          }
          while (v204 < (int)((unint64_t)(v19 - v20) >> 4));
          v77 = (char *)__b;
          v78 = (char *)v215;
        }
        v79 = 126 - 2 * __clz((v78 - v77) >> 4);
        v221 = abpk::compareCandidate;
        if (v78 == v77)
          v80 = 0;
        else
          v80 = v79;
        std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*,false>(v77, v78, (uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))&v221, v80, 1);
        v81 = (char *)__b;
        v82 = (char *)v215;
        if ((int)((unint64_t)((char *)v215 - (_BYTE *)__b) >> 4) >= 1)
        {
          v83 = 0;
          v84 = (char *)v224 + 24 * v201;
          v85 = (_DWORD *)*((_QWORD *)v84 + 1);
          __lena = (_DWORD **)(v84 + 8);
          v86 = v84 + 16;
          do
          {
            v87 = &v81[16 * v83];
            v88 = *(_DWORD **)v84;
            v89 = ((uint64_t)v85 - *(_QWORD *)v84) >> 2;
            v90 = 0xCCCCCCCCCCCCCCCDLL * v89;
            v93 = *(_DWORD *)v87;
            v91 = (int *)(v87 + 4);
            v92 = v93;
            if (-858993459 * (int)v89 <= 0)
            {
              v96 = *v91;
LABEL_68:
              v97 = *(_DWORD *)&v81[16 * v83 + 8];
              v98 = *(_DWORD *)(*v203 + 16 * v92 + 12);
              v99 = *(_DWORD *)(*v209 + 16 * v96 + 12);
              if ((unint64_t)v85 >= *v86)
              {
                v100 = v90 + 1;
                if (v90 + 1 > 0xCCCCCCCCCCCCCCCLL)
                  std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
                if (0x999999999999999ALL * ((uint64_t)(*v86 - (_QWORD)v88) >> 2) > v100)
                  v100 = 0x999999999999999ALL * ((uint64_t)(*v86 - (_QWORD)v88) >> 2);
                if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*v86 - (_QWORD)v88) >> 2) >= 0x666666666666666)
                  v101 = 0xCCCCCCCCCCCCCCCLL;
                else
                  v101 = v100;
                if (v101)
                {
                  v102 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::Connection>>((uint64_t)v86, v101);
                  v85 = *__lena;
                  v88 = *(_DWORD **)v84;
                  v86 = v84 + 16;
                }
                else
                {
                  v102 = 0;
                }
                v103 = &v102[20 * v90];
                *(_DWORD *)v103 = v98;
                *((_DWORD *)v103 + 1) = v99;
                *((_DWORD *)v103 + 2) = v97;
                *((_DWORD *)v103 + 3) = v92;
                *((_DWORD *)v103 + 4) = v96;
                v104 = v103;
                if (v85 == v88)
                {
                  v13 = v200 - 1;
                }
                else
                {
                  v13 = v200 - 1;
                  do
                  {
                    v105 = *(_OWORD *)(v85 - 5);
                    *((_DWORD *)v104 - 1) = *(v85 - 1);
                    *(_OWORD *)(v104 - 20) = v105;
                    v104 -= 20;
                    v85 -= 5;
                  }
                  while (v85 != v88);
                  v88 = *(_DWORD **)v84;
                }
                *(_QWORD *)v84 = v104;
                v85 = v103 + 20;
                *__lena = v103 + 20;
                *v86 = &v102[20 * v101];
                if (v88)
                {
                  operator delete(v88);
                  v86 = v84 + 16;
                }
              }
              else
              {
                *v85 = v98;
                v85[1] = v99;
                v85[2] = v97;
                v85[3] = v92;
                v85[4] = v96;
                v85 += 5;
                v13 = v200 - 1;
              }
              *__lena = v85;
              v81 = (char *)__b;
              v82 = (char *)v215;
            }
            else
            {
              v94 = (-858993459 * v89);
              v95 = v88 + 4;
              while (*(v95 - 1) != v92)
              {
                v96 = *v91;
                if (*v95 == *v91)
                  break;
                v95 += 5;
                if (!--v94)
                  goto LABEL_68;
              }
              v13 = v200 - 1;
            }
            ++v83;
          }
          while (v83 < (int)((unint64_t)(v82 - v81) >> 4));
        }
        if (v81)
        {
          v215 = (float32x2_t *)v81;
          operator delete(v81);
        }
      }
    }
    v12 = v201 + 1;
  }
  while (v201 != 17);
  v106 = 0;
  v107 = v200;
  __p = 0;
  v221 = 0;
  v223 = 0;
  do
  {
    v210 = v106;
    v108 = (uint64_t *)v224 + 3 * v106;
    v109 = *v108;
    if ((int)(-858993459 * ((unint64_t)(v108[1] - *v108) >> 2)) >= 1)
    {
      v110 = 0;
      v111 = &abpk::bones[2 * v106];
      v112 = *v111;
      v113 = v111[1];
      do
      {
        v114 = (__n128 *)__p;
        v115 = (char *)v221;
        if ((int)(-1431655765 * (((_BYTE *)__p - (_BYTE *)v221) >> 3)) < 1)
          goto LABEL_115;
        v116 = 0;
        v117 = 0;
        v118 = 0;
        v119 = 0;
        v120 = (int *)(v109 + 20 * v110);
        v122 = *v120;
        v121 = v120 + 1;
        v123 = (float)v122;
        v124 = v221;
        do
        {
          if (*(float *)(*v124 + 4 * v112) == v123 || *(float *)(*v124 + 4 * v113) == (float)*v121)
          {
            if (!v119)
              v118 = v116;
            if (v119 == 1)
              v117 = v116;
            ++v119;
          }
          ++v116;
          v124 += 3;
        }
        while (-1431655765 * (((_BYTE *)__p - (_BYTE *)v221) >> 3) != v116);
        switch(v119)
        {
          case 0:
LABEL_115:
            std::vector<float>::vector(&__b, v200 + 1);
            v134 = (float *)__b;
            if (v200 != -1)
              memset_pattern16(__b, &unk_210881730, 4 * v200 + 4);
            v135 = (float *)(*v108 + 20 * v110);
            v136 = *(int *)v135;
            v134[v112] = (float)(int)v136;
            v137 = *((int *)v135 + 1);
            v134[v113] = (float)(int)v137;
            v134[v107] = 2.0;
            _H0 = *((_WORD *)v217 + 8 * v136 + 4);
            _H1 = *((_WORD *)v217 + 8 * v137 + 4);
            __asm
            {
              FCVT            S1, H1
              FCVT            S0, H0
            }
            _S0 = _S0 + _S1;
            __asm
            {
              FCVT            H0, S0
              FCVT            S0, H0
            }
            v134[v200 - 1] = v135[2] + _S0;
            v144 = __p;
            if ((unint64_t)__p >= v223)
            {
              v145 = (void *)std::vector<std::vector<float>>::__push_back_slow_path<std::vector<float> const&>((uint64_t *)&v221, (uint64_t)&__b);
            }
            else
            {
              *(_QWORD *)__p = 0;
              v144[1] = 0;
              v144[2] = 0;
              std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v144, __b, (uint64_t)v215, ((char *)v215 - (_BYTE *)__b) >> 2);
              v145 = v144 + 3;
            }
            __p = v145;
            v13 = v200 - 1;
            if (__b)
            {
              v215 = (float32x2_t *)__b;
              operator delete(__b);
            }
            break;
          case 1:
            v146 = *((_QWORD *)v221 + 3 * v118);
            v147 = *v121;
            if (*(float *)(v146 + 4 * v113) != (float)(int)v147)
            {
              *(float *)(v146 + 4 * v113) = (float)(int)v147;
              *(float *)(v146 + 4 * v107) = *(float *)(v146 + 4 * v107) + 1.0;
              _H0 = *((_WORD *)v217 + 8 * v147 + 4);
              __asm { FCVT            S0, H0 }
              *(float *)(v146 + 4 * v13) = *(float *)(v146 + 4 * v13) + (float)(*(float *)(v109 + 20 * v110 + 8) + _S0);
            }
            break;
          case 2:
            if (!v13)
            {
              v128 = v117;
              v150 = *((_QWORD *)v221 + 3 * v117);
              v151 = *((_QWORD *)v221 + 3 * v118);
LABEL_127:
              *(float *)(v151 + 4 * v107) = *(float *)(v150 + 4 * v107) + *(float *)(v151 + 4 * v107);
              v153 = *(float *)(v150 + 4 * v13) + *(float *)(v151 + 4 * v13);
              *(float *)(v151 + 4 * v13) = v153;
              *(float *)(v151 + 4 * v13) = v153 + *(float *)(v109 + 20 * v110 + 8);
              std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,std::vector<float> *,std::vector<float> *,std::vector<float> *,0>((__n128 *)&v115[24 * v128 + 24], v114, (uint64_t)&v115[24 * v128]);
              v155 = v154;
              v156 = __p;
              if (__p != v154)
              {
                v157 = (char *)__p;
                do
                {
                  v159 = (void *)*((_QWORD *)v157 - 3);
                  v157 -= 24;
                  v158 = v159;
                  if (v159)
                  {
                    *(v156 - 2) = v158;
                    operator delete(v158);
                  }
                  v156 = v157;
                }
                while (v157 != v155);
              }
              __p = v155;
              v107 = v200;
              v13 = v200 - 1;
              break;
            }
            v125 = 0;
            v126 = 0;
            v127 = (uint64_t *)((char *)v221 + 24 * v118);
            v128 = v117;
            v129 = (uint64_t *)((char *)v221 + 24 * v117);
            do
            {
              if (*(float *)(*v127 + 4 * v125) > 0.0 && *(float *)(*v129 + 4 * v125) > 0.0)
                v126 = 2;
              ++v125;
            }
            while (v13 != v125);
            if (!v126)
            {
              v152 = 0;
              v150 = *v129;
              v151 = *v127;
              do
              {
                *(float *)(v151 + 4 * v152) = (float)(*(float *)(v150 + 4 * v152) + 1.0) + *(float *)(v151 + 4 * v152);
                ++v152;
              }
              while (v13 != v152);
              goto LABEL_127;
            }
            v130 = *v121;
            v131 = *v127;
            *(float *)(*v127 + 4 * v113) = (float)(int)v130;
            *(float *)(v131 + 4 * v107) = *(float *)(v131 + 4 * v107) + 1.0;
            _H0 = *((_WORD *)v217 + 8 * v130 + 4);
            __asm { FCVT            S0, H0 }
            *(float *)(v131 + 4 * v13) = *(float *)(v131 + 4 * v13) + (float)(*(float *)(v109 + 20 * v110 + 8) + _S0);
            break;
        }
        ++v110;
        v109 = *v108;
      }
      while (v110 < (int)(-858993459 * ((unint64_t)(v108[1] - *v108) >> 2)));
    }
    v106 = v210 + 1;
  }
  while (v210 != 17);
  v160 = (__n128 *)__p;
  v161 = ((_BYTE *)__p - (_BYTE *)v221) >> 3;
  v162 = 0xAAAAAAAAAAAAAAABLL * v161;
  if (-1431655765 * (int)v161 >= 1)
  {
    v163 = (-1431655765 * v161);
    do
    {
      v164 = (char *)v221 + 24 * (v163 - 1);
      v165 = *(float *)(*(_QWORD *)v164 + 4 * v107);
      if (v165 < 8.0 || (float)(*(float *)(*(_QWORD *)v164 + 4 * v13) / v165) < 0.3)
      {
        std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,std::vector<float> *,std::vector<float> *,std::vector<float> *,0>((__n128 *)(v164 + 24), v160, (uint64_t)v164);
        v160 = v166;
        n128_u64 = __p;
        if (__p != v166)
        {
          v168 = (__n128 *)__p;
          do
          {
            v170 = (void *)v168[-2].n128_u64[1];
            v168 = (__n128 *)((char *)v168 - 24);
            v169 = v170;
            if (v170)
            {
              *(n128_u64 - 2) = v169;
              operator delete(v169);
            }
            n128_u64 = v168->n128_u64;
          }
          while (v168 != v160);
        }
        __p = v160;
      }
    }
    while (v163-- > 1);
    v162 = 0xAAAAAAAAAAAAAAABLL * (((char *)v160 - (_BYTE *)v221) >> 3);
  }
  *a9 = 0;
  a9[1] = 0;
  a9[2] = 0;
  std::vector<abpk::Human>::reserve(a9, v162);
  if (__p != v221)
  {
    v172 = 0;
    __asm { FMOV            V8.2S, #-1.0 }
    do
    {
      __lenb = *(uint64x2_t *)(a5 + 8);
      v215 = 0;
      v216 = 0;
      __b = 0;
      _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE7reserveEm(&__b, 0x13uLL);
      v174 = 0;
      v175 = (float32x2_t)vrev64_s32((int32x2_t)vcvt_f32_f64(vcvtq_f64_u64(__lenb)));
      do
      {
        if (((int)*(float *)(*((_QWORD *)v221 + 3 * v172) + 4 * v174) & 0x80000000) == 0)
        {
          v176 = vdiv_f32(vcvt_f32_s32(*(int32x2_t *)((char *)v217+ 16* (int)*(float *)(*((_QWORD *)v221 + 3 * v172) + 4 * v174))), v175);
          v177 = v215;
          if ((unint64_t)v215 < v216)
          {
            *v215 = v176;
            v178 = v177 + 1;
            goto LABEL_182;
          }
          v180 = ((char *)v215 - (_BYTE *)__b) >> 3;
          if ((unint64_t)(v180 + 1) >> 61)
            std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
          v181 = (uint64_t)(v216 - (_QWORD)__b) >> 2;
          if (v181 <= v180 + 1)
            v181 = v180 + 1;
          if (v216 - (unint64_t)__b >= 0x7FFFFFFFFFFFFFF8)
            v182 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v182 = v181;
          if (v182)
            v183 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v216, v182);
          else
            v183 = 0;
          v186 = (float32x2_t *)&v183[8 * v180];
          *v186 = v176;
          v178 = v186 + 1;
          v188 = __b;
          v187 = v215;
          if (v215 == __b)
            goto LABEL_180;
          do
          {
            v189 = *(float32x2_t *)(v187 - 2);
            v187 -= 2;
            v186[-1] = v189;
            --v186;
          }
          while (v187 != v188);
          goto LABEL_179;
        }
        v179 = v215;
        if ((unint64_t)v215 < v216)
        {
          *v215 = _D8;
          v178 = v179 + 1;
          goto LABEL_182;
        }
        v184 = ((char *)v215 - (_BYTE *)__b) >> 3;
        if ((unint64_t)(v184 + 1) >> 61)
          std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
        v185 = (uint64_t)(v216 - (_QWORD)__b) >> 2;
        if (v185 <= v184 + 1)
          v185 = v184 + 1;
        if (v216 - (unint64_t)__b >= 0x7FFFFFFFFFFFFFF8)
          v182 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v182 = v185;
        if (v182)
          v183 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v216, v182);
        else
          v183 = 0;
        v186 = (float32x2_t *)&v183[8 * v184];
        *v186 = _D8;
        v178 = v186 + 1;
        v190 = __b;
        v187 = v215;
        if (v215 != __b)
        {
          do
          {
            v191 = *(float32x2_t *)(v187 - 2);
            v187 -= 2;
            v186[-1] = v191;
            --v186;
          }
          while (v187 != v190);
LABEL_179:
          v187 = __b;
        }
LABEL_180:
        __b = v186;
        v215 = v178;
        v216 = (unint64_t)&v183[8 * v182];
        if (v187)
          operator delete(v187);
LABEL_182:
        v215 = v178;
        ++v174;
      }
      while (v174 != 19);
      v192 = a9[1];
      if (v192 >= a9[2])
      {
        v193 = _ZNSt3__16vectorIN4abpk5HumanENS_9allocatorIS2_EEE24__emplace_back_slow_pathIJNS0_IDv2_fNS3_IS7_EEEEEEEPS2_DpOT_(a9, (uint64_t)&__b);
        v194 = a9;
      }
      else
      {
        _ZNSt3__19allocatorIN4abpk5HumanEE9constructB8ne180100IS2_JNS_6vectorIDv2_fNS0_IS6_EEEEEEEvPT_DpOT0_((uint64_t)(a9 + 2), a9[1], (uint64_t)&__b);
        v193 = v192 + 120;
        v194 = a9;
        a9[1] = v192 + 120;
      }
      v194[1] = v193;
      if (__b)
      {
        v215 = (float32x2_t *)__b;
        operator delete(__b);
      }
      ++v172;
    }
    while (0xAAAAAAAAAAAAAAABLL * (((_BYTE *)__p - (_BYTE *)v221) >> 3) > v172);
  }
  __b = &v221;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__b);
  v195 = 432;
  do
  {
    v196 = *(void **)((char *)&v221 + v195);
    if (v196)
    {
      *(void **)((char *)&__p + v195) = v196;
      operator delete(v196);
    }
    v195 -= 24;
  }
  while (v195);
  if (v217)
  {
    v218[0] = v217;
    operator delete(v217);
  }
  v197 = 57;
  do
  {
    v198 = (void *)v218[v197 - 1];
    if (v198)
    {
      v218[v197] = v198;
      operator delete(v198);
    }
    v197 -= 3;
  }
  while (v197 * 8);
}

void sub_210844B90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,void *__p,uint64_t a31)
{
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;

  a27 = a9;
  std::vector<abpk::Human>::__destroy_vector::operator()[abi:ne180100]((void ***)&a27);
  a27 = &STACK[0x288];
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a27);
  v32 = 432;
  while (1)
  {
    v33 = *(void **)((char *)&STACK[0x2A0] + v32 - 24);
    if (v33)
    {
      *(unint64_t *)((char *)&STACK[0x2A0] + v32 - 16) = (unint64_t)v33;
      operator delete(v33);
    }
    v32 -= 24;
    if (!v32)
    {
      if (__p)
      {
        a31 = (uint64_t)__p;
        operator delete(__p);
      }
      v34 = 456;
      while (1)
      {
        v35 = *(void **)((char *)&__p + v34);
        if (v35)
        {
          *(uint64_t *)((char *)&a31 + v34) = (uint64_t)v35;
          operator delete(v35);
        }
        v34 -= 24;
        if (!v34)
          _Unwind_Resume(a1);
      }
    }
  }
}

void sub_2108451D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2108452B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210845950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void std::vector<long>::reserve(void **a1, unint64_t a2)
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
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    v9 = &v6[8 * v8];
    v10 = (char *)*a1;
    v11 = (char *)a1[1];
    v12 = v7;
    if (v11 != *a1)
    {
      v12 = v7;
      do
      {
        v13 = *((_QWORD *)v11 - 1);
        v11 -= 8;
        *((_QWORD *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

void sub_210845B00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_210845BC4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210845CFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210845DB8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210846394(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23)
{
  if (__p)
    operator delete(__p);
  if (a16)
    operator delete(a16);
  if (a19)
    operator delete(a19);
  if (a22)
    operator delete(a22);
  _Unwind_Resume(exception_object);
}

void std::vector<int>::reserve(std::vector<unsigned int> *this, std::vector<unsigned int>::size_type __n)
{
  std::__compressed_pair<unsigned int *> *p_end_cap;
  unsigned int *value;
  int64_t v5;
  char *v6;
  unsigned int *v7;
  uint64_t v8;
  unsigned int *v9;
  std::vector<unsigned int>::pointer begin;
  unsigned int *end;
  unsigned int *v12;
  unsigned int v13;

  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  if (__n > value - this->__begin_)
  {
    if (__n >> 62)
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    v5 = (char *)this->__end_ - (char *)this->__begin_;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)p_end_cap, __n);
    v7 = (unsigned int *)&v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    v9 = (unsigned int *)&v6[4 * v8];
    begin = this->__begin_;
    end = this->__end_;
    v12 = v7;
    if (end != this->__begin_)
    {
      v12 = v7;
      do
      {
        v13 = *--end;
        *--v12 = v13;
      }
      while (end != begin);
    }
    this->__begin_ = v12;
    this->__end_ = v7;
    this->__end_cap_.__value_ = v9;
    if (begin)
      operator delete(begin);
  }
}

uint64_t *std::__tree<std::__value_type<long,std::vector<long>>,std::__map_value_compare<long,std::__value_type<long,std::vector<long>>,std::less<long>,true>,std::allocator<std::__value_type<long,std::vector<long>>>>::__emplace_unique_key_args<long,std::piecewise_construct_t const&,std::tuple<long const&>,std::tuple<>>(uint64_t **a1, uint64_t *a2, uint64_t a3, uint64_t **a4)
{
  uint64_t *v6;
  uint64_t **v7;
  uint64_t v8;
  uint64_t **v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;

  v7 = a1 + 1;
  v6 = a1[1];
  if (v6)
  {
    v8 = *a2;
    while (1)
    {
      while (1)
      {
        v9 = (uint64_t **)v6;
        v10 = v6[4];
        if (v8 >= v10)
          break;
        v6 = *v9;
        v7 = v9;
        if (!*v9)
          goto LABEL_10;
      }
      if (v10 >= v8)
        break;
      v6 = v9[1];
      if (!v6)
      {
        v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v9 = a1 + 1;
LABEL_10:
    v11 = (uint64_t *)operator new(0x40uLL);
    v12 = **a4;
    v11[6] = 0;
    v11[7] = 0;
    v11[4] = v12;
    v11[5] = 0;
    std::__tree<std::__value_type<long,std::vector<long>>,std::__map_value_compare<long,std::__value_type<long,std::vector<long>>,std::less<long>,true>,std::allocator<std::__value_type<long,std::vector<long>>>>::__insert_node_at(a1, (uint64_t)v9, v7, v11);
    return v11;
  }
  return (uint64_t *)v9;
}

uint64_t *std::__tree<std::__value_type<long,std::vector<long>>,std::__map_value_compare<long,std::__value_type<long,std::vector<long>>,std::less<long>,true>,std::allocator<std::__value_type<long,std::vector<long>>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
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
  result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
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

std::vector<int> *__cdecl std::vector<int>::vector(std::vector<int> *this, std::vector<int>::size_type __n, const std::vector<int>::value_type *__x)
{
  std::vector<int>::pointer end;
  int *v7;
  std::vector<int>::size_type v8;

  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  if (__n)
  {
    std::vector<float>::__vallocate[abi:ne180100](this, __n);
    end = this->__end_;
    v7 = &end[__n];
    v8 = 4 * __n;
    do
    {
      *end++ = *__x;
      v8 -= 4;
    }
    while (v8);
    this->__end_ = v7;
  }
  return this;
}

void sub_210846864(_Unwind_Exception *exception_object)
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

void std::__tree<std::__value_type<long,std::vector<long>>,std::__map_value_compare<long,std::__value_type<long,std::vector<long>>,std::less<long>,true>,std::allocator<std::__value_type<long,std::vector<long>>>>::destroy(uint64_t a1, _QWORD *a2)
{
  void *v4;

  if (a2)
  {
    std::__tree<std::__value_type<long,std::vector<long>>,std::__map_value_compare<long,std::__value_type<long,std::vector<long>>,std::less<long>,true>,std::allocator<std::__value_type<long,std::vector<long>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<long,std::vector<long>>,std::__map_value_compare<long,std::__value_type<long,std::vector<long>>,std::less<long>,true>,std::allocator<std::__value_type<long,std::vector<long>>>>::destroy(a1, a2[1]);
    v4 = (void *)a2[5];
    if (v4)
    {
      a2[6] = v4;
      operator delete(v4);
    }
    operator delete(a2);
  }
}

void sub_2108469E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void std::vector<simd_float4x4>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2;

  v2 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 6;
  if (a2 <= v2)
  {
    if (a2 < v2)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + (a2 << 6);
  }
  else
  {
    std::vector<simd_float4x4>::__append((void **)a1, a2 - v2);
  }
}

void sub_210846B50(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210846BF4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210846E20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_210846EE0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210846F74(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210847860(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,void *__p,uint64_t a28)
{
  void *v28;
  void *v29;
  uint64_t v30;
  void *v32;
  void *v33;

  if (__p)
    operator delete(__p);
  v32 = *(void **)(v30 - 160);
  if (v32)
  {
    *(_QWORD *)(v30 - 152) = v32;
    operator delete(v32);
  }

  v33 = *(void **)(v30 - 128);
  if (v33)
  {
    *(_QWORD *)(v30 - 120) = v33;
    operator delete(v33);
  }

  _Unwind_Resume(a1);
}

void std::vector<float>::reserve(void **a1, unint64_t a2)
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
  int v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 2)
  {
    if (a2 >> 62)
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    v9 = &v6[4 * v8];
    v10 = (char *)*a1;
    v11 = (char *)a1[1];
    v12 = v7;
    if (v11 != *a1)
    {
      v12 = v7;
      do
      {
        v13 = *((_DWORD *)v11 - 1);
        v11 -= 4;
        *((_DWORD *)v12 - 1) = v13;
        v12 -= 4;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

void sub_210847F14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, id a12, void *a13, void *a14, uint64_t a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_210848264(_Unwind_Exception *a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  void *v15;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  std::deque<std::pair<long,long>>::~deque[abi:ne180100](a2);
  v15 = *(void **)(v13 - 136);
  if (v15)
  {
    *(_QWORD *)(v13 - 128) = v15;
    operator delete(v15);
  }
  _Unwind_Resume(a1);
}

double __Block_byref_object_copy_(_QWORD *a1, _QWORD *a2)
{
  double result;

  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  a1[9] = a2[9];
  result = 0.0;
  *((_OWORD *)a2 + 3) = 0u;
  *((_OWORD *)a2 + 4) = 0u;
  a1[10] = a2[10];
  a1[11] = a2[11];
  a2[10] = 0;
  a2[11] = 0;
  return result;
}

uint64_t __Block_byref_object_dispose_(uint64_t a1)
{
  return std::deque<std::pair<long,long>>::~deque[abi:ne180100]((_QWORD *)(a1 + 48));
}

uint64_t std::deque<std::pair<long,long>>::emplace_back<long &,int>(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  uint64_t v16;

  v6 = a1[2];
  v7 = a1[1];
  if (v6 == v7)
    v8 = 0;
  else
    v8 = 32 * (v6 - v7) - 1;
  v9 = a1[4];
  v10 = a1[5] + v9;
  if (v8 == v10)
  {
    std::deque<std::pair<long,long>>::__add_back_capacity(a1);
    v7 = a1[1];
    v9 = a1[4];
    v10 = a1[5] + v9;
  }
  v11 = (_QWORD *)(*(_QWORD *)(v7 + ((v10 >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * v10);
  v12 = *a3;
  *v11 = *a2;
  v11[1] = v12;
  v13 = a1[5] + 1;
  a1[5] = v13;
  v14 = v13 + v9;
  v15 = (_QWORD *)(v7 + 8 * (v14 >> 8));
  if ((_BYTE)v14)
    v16 = *v15 + 16 * v14;
  else
    v16 = *(v15 - 1) + 4096;
  return v16 - 16;
}

uint64_t std::deque<std::pair<long,long>>::emplace_back<long &,long const&>(_QWORD *a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  uint64_t v15;

  v6 = a1[2];
  v7 = a1[1];
  if (v6 == v7)
    v8 = 0;
  else
    v8 = 32 * (v6 - v7) - 1;
  v9 = a1[4];
  v10 = a1[5] + v9;
  if (v8 == v10)
  {
    std::deque<std::pair<long,long>>::__add_back_capacity(a1);
    v7 = a1[1];
    v9 = a1[4];
    v10 = a1[5] + v9;
  }
  v11 = (_QWORD *)(*(_QWORD *)(v7 + ((v10 >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * v10);
  *v11 = *a2;
  v11[1] = *a3;
  v12 = a1[5] + 1;
  a1[5] = v12;
  v13 = v12 + v9;
  v14 = (_QWORD *)(v7 + 8 * (v13 >> 8));
  if ((_BYTE)v13)
    v15 = *v14 + 16 * v13;
  else
    v15 = *(v14 - 1) + 4096;
  return v15 - 16;
}

void std::vector<simd_float4x4>::__append(void **a1, unint64_t a2)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 6)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), a2 << 6);
      v7 += 64 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = v7 - (_BYTE *)*a1;
    v9 = a2 + (v8 >> 6);
    if (v9 >> 58)
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    v10 = v8 >> 6;
    v11 = v5 - (_BYTE *)*a1;
    if (v11 >> 5 > v9)
      v9 = v11 >> 5;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFC0)
      v12 = 0x3FFFFFFFFFFFFFFLL;
    else
      v12 = v9;
    if (v12)
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<simd_float4x4>>(v4, v12);
    else
      v13 = 0;
    v14 = &v13[64 * v10];
    v15 = &v13[64 * v12];
    bzero(v14, a2 << 6);
    v16 = &v14[64 * a2];
    v18 = (char *)*a1;
    v17 = (char *)a1[1];
    if (v17 != *a1)
    {
      do
      {
        v19 = *((_OWORD *)v17 - 4);
        v20 = *((_OWORD *)v17 - 3);
        v21 = *((_OWORD *)v17 - 1);
        *((_OWORD *)v14 - 2) = *((_OWORD *)v17 - 2);
        *((_OWORD *)v14 - 1) = v21;
        *((_OWORD *)v14 - 4) = v19;
        *((_OWORD *)v14 - 3) = v20;
        v14 -= 64;
        v17 -= 64;
      }
      while (v17 != v18);
      v17 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v16;
    a1[2] = v15;
    if (v17)
      operator delete(v17);
  }
}

_QWORD *_ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE11__vallocateB8ne180100Em(result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_2108487C0(_Unwind_Exception *exception_object)
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

char *_ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE11__vallocateB8ne180100Em(_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 60)
    std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::peak>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

uint64_t std::deque<std::pair<long,long>>::~deque[abi:ne180100](_QWORD *a1)
{
  void **v2;
  void **v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = (void **)a1[1];
  v3 = (void **)a1[2];
  a1[5] = 0;
  v4 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      v3 = (void **)a1[2];
      v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      v4 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  v5 = v4 >> 3;
  if (v5 == 1)
  {
    v6 = 128;
  }
  else
  {
    if (v5 != 2)
      goto LABEL_9;
    v6 = 256;
  }
  a1[4] = v6;
LABEL_9:
  while (v2 != v3)
  {
    v7 = *v2++;
    operator delete(v7);
  }
  return std::__split_buffer<std::pair<long,long> *,std::allocator<std::pair<long,long> *>>::~__split_buffer((uint64_t)a1);
}

uint64_t std::__split_buffer<std::pair<long,long> *,std::allocator<std::pair<long,long> *>>::~__split_buffer(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)(a1 + 8);
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != v3)
    *(_QWORD *)(a1 + 16) = v2 + ((v3 - v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  v4 = *(void **)a1;
  if (*(_QWORD *)a1)
    operator delete(v4);
  return a1;
}

void std::deque<std::pair<long,long>>::__add_back_capacity(_QWORD *a1)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  char *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  unint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  _QWORD *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  _QWORD *v56;

  v2 = a1[4];
  v3 = v2 >= 0x100;
  v4 = v2 - 256;
  if (v3)
  {
    v5 = (uint64_t)(a1 + 3);
    v6 = (char *)a1[3];
    a1[4] = v4;
    v7 = (_QWORD *)a1[1];
    v8 = (char *)a1[2];
    v11 = *v7;
    v9 = (char *)(v7 + 1);
    v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(_QWORD *)v8 = v10;
      a1[2] += 8;
      return;
    }
    v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1)
        v33 = 1;
      else
        v33 = (uint64_t)&v8[-*a1] >> 2;
      v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v5, v33);
      v35 = &v34[8 * (v33 >> 2)];
      v37 = &v34[8 * v36];
      v38 = (uint64_t *)a1[1];
      v8 = v35;
      v39 = a1[2] - (_QWORD)v38;
      if (v39)
      {
        v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        v40 = 8 * (v39 >> 3);
        v41 = &v34[8 * (v33 >> 2)];
        do
        {
          v42 = *v38++;
          *(_QWORD *)v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    v13 = v12 >> 3;
    v14 = v12 >> 3 < -1;
    v15 = (v12 >> 3) + 2;
    if (v14)
      v16 = v15;
    else
      v16 = v13 + 1;
    v17 = -(v16 >> 1);
    v18 = v16 >> 1;
    v19 = &v9[-8 * v18];
    v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      v9 = (char *)a1[1];
    }
    v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  v21 = a1[2];
  v22 = (v21 - a1[1]) >> 3;
  v23 = a1[3];
  v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(_QWORD *)&v54 = operator new(0x1000uLL);
      std::__split_buffer<std::pair<long,long> *,std::allocator<std::pair<long,long> *>>::push_back(a1, &v54);
      return;
    }
    *(_QWORD *)&v54 = operator new(0x1000uLL);
    std::__split_buffer<std::pair<long,long> *,std::allocator<std::pair<long,long> *>>::push_front((uint64_t)a1, &v54);
    v44 = (_QWORD *)a1[1];
    v8 = (char *)a1[2];
    v45 = *v44;
    v9 = (char *)(v44 + 1);
    v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3])
      goto LABEL_33;
    v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1)
        v46 = 1;
      else
        v46 = (uint64_t)&v8[-*a1] >> 2;
      v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(a1 + 3), v46);
      v35 = &v34[8 * (v46 >> 2)];
      v37 = &v34[8 * v47];
      v48 = (uint64_t *)a1[1];
      v8 = v35;
      v49 = a1[2] - (_QWORD)v48;
      if (v49)
      {
        v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        v50 = 8 * (v49 >> 3);
        v51 = &v34[8 * (v46 >> 2)];
        do
        {
          v52 = *v48++;
          *(_QWORD *)v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1)
    v25 = 1;
  else
    v25 = v24 >> 2;
  v56 = a1 + 3;
  *(_QWORD *)&v54 = std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(a1 + 3), v25);
  *((_QWORD *)&v54 + 1) = v54 + 8 * v22;
  *(_QWORD *)&v55 = *((_QWORD *)&v54 + 1);
  *((_QWORD *)&v55 + 1) = v54 + 8 * v26;
  v53 = operator new(0x1000uLL);
  std::__split_buffer<std::pair<long,long> *,std::allocator<std::pair<long,long> *> &>::push_back(&v54, &v53);
  v27 = (_QWORD *)a1[2];
  v28 = -7 - (_QWORD)v27;
  while (v27 != (_QWORD *)a1[1])
  {
    --v27;
    v28 += 8;
    std::__split_buffer<std::pair<long,long> *,std::allocator<std::pair<long,long> *> &>::push_front((uint64_t)&v54, v27);
  }
  v29 = (char *)*a1;
  v30 = v54;
  v31 = v55;
  *(_QWORD *)&v54 = *a1;
  *((_QWORD *)&v54 + 1) = v27;
  v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  v55 = v32;
  if (v27 != (_QWORD *)v32)
    *(_QWORD *)&v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  if (v29)
    operator delete(v29);
}

void sub_210848BC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  void *v13;

  operator delete(v13);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void std::__split_buffer<std::pair<long,long> *,std::allocator<std::pair<long,long> *>>::push_back(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int64_t v16;
  char *v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;

  v5 = (char *)a1[3];
  v4 = (uint64_t)(a1 + 3);
  v6 = *(char **)(v4 - 8);
  if (v6 == v5)
  {
    v7 = (char *)a1[1];
    v8 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1)
        v18 = 1;
      else
        v18 = (uint64_t)&v6[-*a1] >> 2;
      v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v4, v18);
      v21 = &v19[8 * (v18 >> 2)];
      v22 = (uint64_t *)a1[1];
      v6 = v21;
      v23 = a1[2] - (_QWORD)v22;
      if (v23)
      {
        v6 = &v21[v23 & 0xFFFFFFFFFFFFFFF8];
        v24 = 8 * (v23 >> 3);
        v25 = &v19[8 * (v18 >> 2)];
        do
        {
          v26 = *v22++;
          *(_QWORD *)v25 = v26;
          v25 += 8;
          v24 -= 8;
        }
        while (v24);
      }
      v27 = (char *)*a1;
      *a1 = v19;
      a1[1] = v21;
      a1[2] = v6;
      a1[3] = &v19[8 * v20];
      if (v27)
      {
        operator delete(v27);
        v6 = (char *)a1[2];
      }
    }
    else
    {
      v9 = v8 >> 3;
      v10 = v8 >> 3 < -1;
      v11 = (v8 >> 3) + 2;
      if (v10)
        v12 = v11;
      else
        v12 = v9 + 1;
      v13 = -(v12 >> 1);
      v14 = v12 >> 1;
      v15 = &v7[-8 * v14];
      v16 = v6 - v7;
      if (v6 != v7)
      {
        memmove(&v7[-8 * v14], v7, v6 - v7);
        v6 = (char *)a1[1];
      }
      v17 = &v6[8 * v13];
      v6 = &v15[v16];
      a1[1] = v17;
      a1[2] = &v15[v16];
    }
  }
  *(_QWORD *)v6 = *a2;
  a1[2] += 8;
}

void std::__split_buffer<std::pair<long,long> *,std::allocator<std::pair<long,long> *>>::push_front(uint64_t a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;

  v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    v6 = a1 + 24;
    v7 = *(_BYTE **)(a1 + 24);
    v8 = *(_BYTE **)(a1 + 16);
    if (v8 >= v7)
    {
      if (v7 == v4)
        v12 = 1;
      else
        v12 = (v7 - v4) >> 2;
      v13 = 2 * v12;
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v6, v12);
      v5 = &v14[(v13 + 6) & 0xFFFFFFFFFFFFFFF8];
      v16 = *(uint64_t **)(a1 + 8);
      v17 = v5;
      v18 = *(_QWORD *)(a1 + 16) - (_QWORD)v16;
      if (v18)
      {
        v17 = &v5[v18 & 0xFFFFFFFFFFFFFFF8];
        v19 = 8 * (v18 >> 3);
        v20 = v5;
        do
        {
          v21 = *v16++;
          *(_QWORD *)v20 = v21;
          v20 += 8;
          v19 -= 8;
        }
        while (v19);
      }
      v22 = *(char **)a1;
      *(_QWORD *)a1 = v14;
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v17;
      *(_QWORD *)(a1 + 24) = &v14[8 * v15];
      if (v22)
      {
        operator delete(v22);
        v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      v9 = (v7 - v8) >> 3;
      if (v9 >= -1)
        v10 = v9 + 1;
      else
        v10 = v9 + 2;
      v11 = v10 >> 1;
      v5 = &v4[8 * (v10 >> 1)];
      if (v8 != v4)
      {
        memmove(&v4[8 * (v10 >> 1)], v4, v8 - v4);
        v4 = *(char **)(a1 + 16);
      }
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = &v4[8 * v11];
    }
  }
  else
  {
    v5 = *(char **)(a1 + 8);
  }
  *((_QWORD *)v5 - 1) = *a2;
  *(_QWORD *)(a1 + 8) -= 8;
}

void std::__split_buffer<std::pair<long,long> *,std::allocator<std::pair<long,long> *> &>::push_back(_QWORD *a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int64_t v14;
  char *v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;

  v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    v5 = (char *)a1[1];
    v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      if (v4 == (char *)*a1)
        v16 = 1;
      else
        v16 = (uint64_t)&v4[-*a1] >> 2;
      v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(a1[4], v16);
      v19 = &v17[8 * (v16 >> 2)];
      v20 = (uint64_t *)a1[1];
      v4 = v19;
      v21 = a1[2] - (_QWORD)v20;
      if (v21)
      {
        v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8];
        v22 = 8 * (v21 >> 3);
        v23 = &v17[8 * (v16 >> 2)];
        do
        {
          v24 = *v20++;
          *(_QWORD *)v23 = v24;
          v23 += 8;
          v22 -= 8;
        }
        while (v22);
      }
      v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        v4 = (char *)a1[2];
      }
    }
    else
    {
      v7 = v6 >> 3;
      v8 = v6 >> 3 < -1;
      v9 = (v6 >> 3) + 2;
      if (v8)
        v10 = v9;
      else
        v10 = v7 + 1;
      v11 = -(v10 >> 1);
      v12 = v10 >> 1;
      v13 = &v5[-8 * v12];
      v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        v4 = (char *)a1[1];
      }
      v15 = &v4[8 * v11];
      v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }
  *(_QWORD *)v4 = *a2;
  a1[2] += 8;
}

void std::__split_buffer<std::pair<long,long> *,std::allocator<std::pair<long,long> *> &>::push_front(uint64_t a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  _BYTE *v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;

  v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    v6 = *(_BYTE **)(a1 + 16);
    v7 = *(_BYTE **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4)
        v11 = 1;
      else
        v11 = (v7 - v4) >> 2;
      v12 = 2 * v11;
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(*(_QWORD *)(a1 + 32), v11);
      v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8];
      v15 = *(uint64_t **)(a1 + 8);
      v16 = v5;
      v17 = *(_QWORD *)(a1 + 16) - (_QWORD)v15;
      if (v17)
      {
        v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8];
        v18 = 8 * (v17 >> 3);
        v19 = v5;
        do
        {
          v20 = *v15++;
          *(_QWORD *)v19 = v20;
          v19 += 8;
          v18 -= 8;
        }
        while (v18);
      }
      v21 = *(char **)a1;
      *(_QWORD *)a1 = v13;
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v16;
      *(_QWORD *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      v8 = (v7 - v6) >> 3;
      if (v8 >= -1)
        v9 = v8 + 1;
      else
        v9 = v8 + 2;
      v10 = v9 >> 1;
      v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        v4 = *(char **)(a1 + 16);
      }
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = &v4[8 * v10];
    }
  }
  else
  {
    v5 = *(char **)(a1 + 8);
  }
  *((_QWORD *)v5 - 1) = *a2;
  *(_QWORD *)(a1 + 8) -= 8;
}

uint64_t std::deque<std::pair<long,long>>::__maybe_remove_front_spare[abi:ne180100](uint64_t a1, int a2)
{
  unint64_t v2;
  int v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 < 0x100)
    a2 = 1;
  if (v2 < 0x200)
    v4 = a2;
  else
    v4 = 0;
  if ((v4 & 1) == 0)
  {
    operator delete(**(void ***)(a1 + 8));
    *(_QWORD *)(a1 + 8) += 8;
    *(_QWORD *)(a1 + 32) -= 256;
  }
  return v4 ^ 1u;
}

void sub_21084949C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18)
{
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  _Unwind_Resume(a1);
}

void sub_210849760(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2108497E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)ABPKOutput;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_210849958(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_210849E8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_21084A818(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21084AFD8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  _Unwind_Resume(a1);
}

void sub_21084B594(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_21084B83C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21084B920(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_21084C094(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  std::shared_ptr<Espresso::abstract_context>::~shared_ptr[abi:ne180100](v5 - 144);
  _Unwind_Resume(a1);
}

void sub_21084C274(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void std::vector<espresso_buffer_t>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;

  v2 = 0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3);
  v3 = a2 >= v2;
  v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    std::vector<espresso_buffer_t>::__append((void **)a1, v4);
  }
  else if (!v3)
  {
    *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 168 * a2;
  }
}

void std::vector<__CVPixelBufferPool *>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2;

  v2 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3;
  if (a2 <= v2)
  {
    if (a2 < v2)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 8 * a2;
  }
  else
  {
    std::vector<__CVPixelBufferPool *>::__append((void **)a1, a2 - v2);
  }
}

void sub_21084C400(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_21084C59C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21084C738(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21084CAC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21084D4E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *__p, uint64_t a15, uint64_t a16, void *a17, uint64_t a18)
{
  void *v18;

  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_21084D77C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21084D89C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21084DB18(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21084DCCC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21084DE6C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21084E0F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21084E1C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)ABPK2DDetection;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

uint64_t std::shared_ptr<Espresso::abstract_context>::~shared_ptr[abi:ne180100](uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v2 = *(std::__shared_weak_count **)(a1 + 8);
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
    }
  }
  return a1;
}

void std::vector<espresso_buffer_t>::__append(void **a1, unint64_t a2)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  char *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  size_t v13;
  char *v14;
  char *v15;
  size_t v16;
  char *v17;
  char *v18;
  char *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (0xCF3CF3CF3CF3CF3DLL * ((v6 - v7) >> 3) >= a2)
  {
    if (a2)
    {
      v13 = 168 * ((168 * a2 - 168) / 0xA8) + 168;
      bzero(*(void **)(v4 - 8), v13);
      v7 += v13;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = 0xCF3CF3CF3CF3CF3DLL * ((v7 - (_BYTE *)*a1) >> 3);
    v9 = v8 + a2;
    if (v8 + a2 > 0x186186186186186)
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    v10 = 0xCF3CF3CF3CF3CF3DLL * ((v5 - (_BYTE *)*a1) >> 3);
    if (2 * v10 > v9)
      v9 = 2 * v10;
    if (v10 >= 0xC30C30C30C30C3)
      v11 = 0x186186186186186;
    else
      v11 = v9;
    if (v11)
      v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<espresso_buffer_t>>(v4, v11);
    else
      v12 = 0;
    v14 = &v12[168 * v8];
    v15 = &v12[168 * v11];
    v16 = 168 * ((168 * a2 - 168) / 0xA8) + 168;
    bzero(v14, v16);
    v17 = &v14[v16];
    v19 = (char *)*a1;
    v18 = (char *)a1[1];
    if (v18 != *a1)
    {
      do
      {
        v20 = *(_OWORD *)(v18 - 168);
        v21 = *(_OWORD *)(v18 - 152);
        *(_OWORD *)(v14 - 136) = *(_OWORD *)(v18 - 136);
        *(_OWORD *)(v14 - 152) = v21;
        *(_OWORD *)(v14 - 168) = v20;
        v22 = *(_OWORD *)(v18 - 120);
        v23 = *(_OWORD *)(v18 - 104);
        v24 = *(_OWORD *)(v18 - 88);
        *(_OWORD *)(v14 - 72) = *(_OWORD *)(v18 - 72);
        *(_OWORD *)(v14 - 88) = v24;
        *(_OWORD *)(v14 - 104) = v23;
        *(_OWORD *)(v14 - 120) = v22;
        v25 = *(_OWORD *)(v18 - 56);
        v26 = *(_OWORD *)(v18 - 40);
        v27 = *(_OWORD *)(v18 - 24);
        *((_QWORD *)v14 - 1) = *((_QWORD *)v18 - 1);
        *(_OWORD *)(v14 - 24) = v27;
        *(_OWORD *)(v14 - 40) = v26;
        *(_OWORD *)(v14 - 56) = v25;
        v14 -= 168;
        v18 -= 168;
      }
      while (v18 != v19);
      v18 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v17;
    a1[2] = v15;
    if (v18)
      operator delete(v18);
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<espresso_buffer_t>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x186186186186187)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(168 * a2);
}

void std::vector<__CVPixelBufferPool *>::__append(void **a1, unint64_t a2)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 3)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 8 * a2);
      v7 += 8 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = v7 - (_BYTE *)*a1;
    v9 = a2 + (v8 >> 3);
    if (v9 >> 61)
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    v10 = v8 >> 3;
    v11 = v5 - (_BYTE *)*a1;
    if (v11 >> 2 > v9)
      v9 = v11 >> 2;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
      v12 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v12 = v9;
    if (v12)
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v4, v12);
    else
      v13 = 0;
    v14 = &v13[8 * v10];
    v15 = &v13[8 * v12];
    bzero(v14, 8 * a2);
    v16 = &v14[8 * a2];
    v18 = (char *)*a1;
    v17 = (char *)a1[1];
    if (v17 != *a1)
    {
      do
      {
        v19 = *((_QWORD *)v17 - 1);
        v17 -= 8;
        *((_QWORD *)v14 - 1) = v19;
        v14 -= 8;
      }
      while (v17 != v18);
      v17 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v16;
    a1[2] = v15;
    if (v17)
      operator delete(v17);
  }
}

id __ABPKLogSharedInstance()
{
  if (__ABPKLogSharedInstance_onceToken != -1)
    dispatch_once(&__ABPKLogSharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance;
}

void sub_21084EC50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, char a12)
{
  if (__p)
    operator delete(__p);
  -[ABPK3DLiftingResult init].cold.1((uint64_t)&a12);
  _Unwind_Resume(a1);
}

void sub_21084ED0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21084EE00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  void *v13;
  void *v14;

  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_21084EF38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  void *v13;

  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

_QWORD *_ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE11__vallocateB8ne180100Em(result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_21084F0B4(_Unwind_Exception *exception_object)
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

_QWORD *_ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEEC2Em(_QWORD *a1, unint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE11__vallocateB8ne180100Em(a1, a2);
    v4 = (char *)a1[1];
    bzero(v4, 16 * a2);
    a1[1] = &v4[16 * a2];
  }
  return a1;
}

void sub_21084F128(_Unwind_Exception *exception_object)
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

uint64_t abpk::Human::Human(uint64_t a1, uint64_t a2)
{
  void **v3;
  void **v4;
  std::vector<unsigned int>::size_type v5;
  _QWORD *v6;
  _QWORD *v7;
  unint64_t v8;
  char *v9;
  _DWORD *v11;
  _DWORD *v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  char *v25;
  int v26;
  unint64_t v27;
  char *v28;
  _DWORD *v29;
  char *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char *v35;
  char *v36;
  int v37;
  unint64_t v38;
  char *v39;
  _DWORD *v40;
  char *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char *v46;
  char *v47;
  int v48;
  char *v49;
  int v50;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_OWORD *)(a1 + 24) = 0u;
  v3 = (void **)(a1 + 24);
  v4 = (void **)(a1 + 48);
  *(_BYTE *)(a1 + 96) = 0;
  *(_QWORD *)(a1 + 104) = 0;
  *(_BYTE *)(a1 + 112) = 0;
  *(_BYTE *)(a1 + 116) = 0;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_BYTE *)(a1 + 72) = 0;
  v5 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3;
  std::vector<int>::reserve((std::vector<unsigned int> *)(a1 + 24), v5);
  std::vector<float>::reserve(v4, v5);
  v6 = *(_QWORD **)a1;
  v7 = *(_QWORD **)(a1 + 8);
  if (*(_QWORD **)a1 != v7)
  {
    do
    {
      v9 = *(char **)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      if (COERCE_FLOAT(*v6) == -1.0 || COERCE_FLOAT(HIDWORD(*v6)) == -1.0)
      {
        if ((unint64_t)v9 >= v8)
        {
          v13 = (char *)*v3;
          v14 = (v9 - (_BYTE *)*v3) >> 2;
          v15 = v14 + 1;
          if ((unint64_t)(v14 + 1) >> 62)
            std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
          v16 = v8 - (_QWORD)v13;
          if (v16 >> 1 > v15)
            v15 = v16 >> 1;
          if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFFCLL)
            v17 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v17 = v15;
          if (v17)
          {
            v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(a1 + 40, v17);
            v13 = *(char **)(a1 + 24);
            v9 = *(char **)(a1 + 32);
          }
          else
          {
            v18 = 0;
          }
          v25 = &v18[4 * v14];
          *(_DWORD *)v25 = 0;
          v11 = v25 + 4;
          while (v9 != v13)
          {
            v26 = *((_DWORD *)v9 - 1);
            v9 -= 4;
            *((_DWORD *)v25 - 1) = v26;
            v25 -= 4;
          }
          *(_QWORD *)(a1 + 24) = v25;
          *(_QWORD *)(a1 + 32) = v11;
          *(_QWORD *)(a1 + 40) = &v18[4 * v17];
          if (v13)
            operator delete(v13);
        }
        else
        {
          *(_DWORD *)v9 = 0;
          v11 = v9 + 4;
        }
        *(_QWORD *)(a1 + 32) = v11;
        v28 = *(char **)(a1 + 56);
        v27 = *(_QWORD *)(a1 + 64);
        if ((unint64_t)v28 >= v27)
        {
          v30 = (char *)*v4;
          v31 = (v28 - (_BYTE *)*v4) >> 2;
          v32 = v31 + 1;
          if ((unint64_t)(v31 + 1) >> 62)
            std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
          v33 = v27 - (_QWORD)v30;
          if (v33 >> 1 > v32)
            v32 = v33 >> 1;
          if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFFCLL)
            v34 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v34 = v32;
          if (v34)
          {
            v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(a1 + 64, v34);
            v30 = *(char **)(a1 + 48);
            v28 = *(char **)(a1 + 56);
          }
          else
          {
            v35 = 0;
          }
          v47 = &v35[4 * v31];
          *(_DWORD *)v47 = 0;
          v29 = v47 + 4;
          while (v28 != v30)
          {
            v48 = *((_DWORD *)v28 - 1);
            v28 -= 4;
            *((_DWORD *)v47 - 1) = v48;
            v47 -= 4;
          }
          *(_QWORD *)(a1 + 48) = v47;
          *(_QWORD *)(a1 + 56) = v29;
          *(_QWORD *)(a1 + 64) = &v35[4 * v34];
          if (v30)
            operator delete(v30);
        }
        else
        {
          *(_DWORD *)v28 = 0;
          v29 = v28 + 4;
        }
        *(_QWORD *)(a1 + 56) = v29;
      }
      else
      {
        if ((unint64_t)v9 >= v8)
        {
          v19 = (char *)*v3;
          v20 = (v9 - (_BYTE *)*v3) >> 2;
          v21 = v20 + 1;
          if ((unint64_t)(v20 + 1) >> 62)
            std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
          v22 = v8 - (_QWORD)v19;
          if (v22 >> 1 > v21)
            v21 = v22 >> 1;
          if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFFCLL)
            v23 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v23 = v21;
          if (v23)
          {
            v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(a1 + 40, v23);
            v19 = *(char **)(a1 + 24);
            v9 = *(char **)(a1 + 32);
          }
          else
          {
            v24 = 0;
          }
          v36 = &v24[4 * v20];
          *(_DWORD *)v36 = 1;
          v12 = v36 + 4;
          while (v9 != v19)
          {
            v37 = *((_DWORD *)v9 - 1);
            v9 -= 4;
            *((_DWORD *)v36 - 1) = v37;
            v36 -= 4;
          }
          *(_QWORD *)(a1 + 24) = v36;
          *(_QWORD *)(a1 + 32) = v12;
          *(_QWORD *)(a1 + 40) = &v24[4 * v23];
          if (v19)
            operator delete(v19);
        }
        else
        {
          *(_DWORD *)v9 = 1;
          v12 = v9 + 4;
        }
        *(_QWORD *)(a1 + 32) = v12;
        v39 = *(char **)(a1 + 56);
        v38 = *(_QWORD *)(a1 + 64);
        if ((unint64_t)v39 >= v38)
        {
          v41 = (char *)*v4;
          v42 = (v39 - (_BYTE *)*v4) >> 2;
          v43 = v42 + 1;
          if ((unint64_t)(v42 + 1) >> 62)
            std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
          v44 = v38 - (_QWORD)v41;
          if (v44 >> 1 > v43)
            v43 = v44 >> 1;
          if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFFCLL)
            v45 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v45 = v43;
          if (v45)
          {
            v46 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(a1 + 64, v45);
            v41 = *(char **)(a1 + 48);
            v39 = *(char **)(a1 + 56);
          }
          else
          {
            v46 = 0;
          }
          v49 = &v46[4 * v42];
          *(_DWORD *)v49 = 1056964608;
          v40 = v49 + 4;
          while (v39 != v41)
          {
            v50 = *((_DWORD *)v39 - 1);
            v39 -= 4;
            *((_DWORD *)v49 - 1) = v50;
            v49 -= 4;
          }
          *(_QWORD *)(a1 + 48) = v49;
          *(_QWORD *)(a1 + 56) = v40;
          *(_QWORD *)(a1 + 64) = &v46[4 * v45];
          if (v41)
            operator delete(v41);
        }
        else
        {
          *(_DWORD *)v39 = 1056964608;
          v40 = v39 + 4;
        }
        *(_QWORD *)(a1 + 56) = v40;
        ++*(_QWORD *)(a1 + 104);
      }
      ++v6;
    }
    while (v6 != v7);
  }
  return a1;
}

void sub_21084F4F8(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void **v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (*(_BYTE *)(v1 + 96))
  {
    v5 = *(void **)(v1 + 72);
    if (v5)
    {
      *(_QWORD *)(v1 + 80) = v5;
      operator delete(v5);
    }
  }
  v6 = *v3;
  if (*v3)
  {
    *(_QWORD *)(v1 + 56) = v6;
    operator delete(v6);
  }
  v7 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 32) = v7;
    operator delete(v7);
  }
  v8 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v8;
    operator delete(v8);
  }
  _Unwind_Resume(exception_object);
}

uint64_t abpk::Human::Human(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void **v4;
  _QWORD *v5;
  _QWORD *v6;
  unint64_t v7;
  char *v8;
  _DWORD *v10;
  _DWORD *v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  char *v24;
  int v25;
  char *v26;
  int v27;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_OWORD *)(a1 + 24) = 0u;
  v4 = (void **)(a1 + 24);
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)a3;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a3 + 16);
  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  *(_BYTE *)(a1 + 72) = 0;
  *(_BYTE *)(a1 + 96) = 0;
  *(_QWORD *)(a1 + 104) = 0;
  *(_BYTE *)(a1 + 112) = 0;
  *(_BYTE *)(a1 + 116) = 0;
  std::vector<int>::reserve((std::vector<unsigned int> *)(a1 + 24), (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3);
  v5 = *(_QWORD **)a1;
  v6 = *(_QWORD **)(a1 + 8);
  if (*(_QWORD **)a1 != v6)
  {
    do
    {
      v8 = *(char **)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      if (COERCE_FLOAT(*v5) == -1.0 || COERCE_FLOAT(HIDWORD(*v5)) == -1.0)
      {
        if ((unint64_t)v8 >= v7)
        {
          v12 = (char *)*v4;
          v13 = (v8 - (_BYTE *)*v4) >> 2;
          v14 = v13 + 1;
          if ((unint64_t)(v13 + 1) >> 62)
            std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
          v15 = v7 - (_QWORD)v12;
          if (v15 >> 1 > v14)
            v14 = v15 >> 1;
          if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFFCLL)
            v16 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v16 = v14;
          if (v16)
          {
            v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(a1 + 40, v16);
            v12 = *(char **)(a1 + 24);
            v8 = *(char **)(a1 + 32);
          }
          else
          {
            v17 = 0;
          }
          v24 = &v17[4 * v13];
          *(_DWORD *)v24 = 0;
          v10 = v24 + 4;
          while (v8 != v12)
          {
            v25 = *((_DWORD *)v8 - 1);
            v8 -= 4;
            *((_DWORD *)v24 - 1) = v25;
            v24 -= 4;
          }
          *(_QWORD *)(a1 + 24) = v24;
          *(_QWORD *)(a1 + 32) = v10;
          *(_QWORD *)(a1 + 40) = &v17[4 * v16];
          if (v12)
            operator delete(v12);
        }
        else
        {
          *(_DWORD *)v8 = 0;
          v10 = v8 + 4;
        }
        *(_QWORD *)(a1 + 32) = v10;
      }
      else
      {
        if ((unint64_t)v8 >= v7)
        {
          v18 = (char *)*v4;
          v19 = (v8 - (_BYTE *)*v4) >> 2;
          v20 = v19 + 1;
          if ((unint64_t)(v19 + 1) >> 62)
            std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
          v21 = v7 - (_QWORD)v18;
          if (v21 >> 1 > v20)
            v20 = v21 >> 1;
          if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFFCLL)
            v22 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v22 = v20;
          if (v22)
          {
            v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(a1 + 40, v22);
            v18 = *(char **)(a1 + 24);
            v8 = *(char **)(a1 + 32);
          }
          else
          {
            v23 = 0;
          }
          v26 = &v23[4 * v19];
          *(_DWORD *)v26 = 1;
          v11 = v26 + 4;
          while (v8 != v18)
          {
            v27 = *((_DWORD *)v8 - 1);
            v8 -= 4;
            *((_DWORD *)v26 - 1) = v27;
            v26 -= 4;
          }
          *(_QWORD *)(a1 + 24) = v26;
          *(_QWORD *)(a1 + 32) = v11;
          *(_QWORD *)(a1 + 40) = &v23[4 * v22];
          if (v18)
            operator delete(v18);
        }
        else
        {
          *(_DWORD *)v8 = 1;
          v11 = v8 + 4;
        }
        *(_QWORD *)(a1 + 32) = v11;
        ++*(_QWORD *)(a1 + 104);
      }
      ++v5;
    }
    while (v5 != v6);
  }
  return a1;
}

void sub_21084F7C8(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (*(_BYTE *)(v1 + 96))
  {
    v4 = *(void **)(v1 + 72);
    if (v4)
    {
      *(_QWORD *)(v1 + 80) = v4;
      operator delete(v4);
    }
  }
  v5 = *(void **)(v1 + 48);
  if (v5)
  {
    *(_QWORD *)(v1 + 56) = v5;
    operator delete(v5);
  }
  v6 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 32) = v6;
    operator delete(v6);
  }
  v7 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v7;
    operator delete(v7);
  }
  _Unwind_Resume(exception_object);
}

void abpk::Human::resize(abpk::Human *this, unint64_t a2)
{
  int *v4;
  std::vector<unsigned int> *v5;
  int *v6;
  int v7;
  int v8;
  uint64_t v9;
  void *v10;

  if (a2 > (uint64_t)(*((_QWORD *)this + 1) - *(_QWORD *)this) >> 3)
    abpk::Human::resize();
  v4 = (int *)*((_QWORD *)this + 4);
  v5 = (std::vector<unsigned int> *)((char *)this + 24);
  v6 = (int *)(*((_QWORD *)this + 3) + 4 * a2);
  if (v6 == v4)
  {
    v9 = 0;
  }
  else
  {
    v7 = 0;
    do
    {
      v8 = *v6++;
      v7 += v8;
    }
    while (v6 != v4);
    v9 = v7;
  }
  _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)this, a2);
  std::vector<unsigned int>::resize(v5, a2);
  if (*((_BYTE *)this + 96))
  {
    v10 = (void *)*((_QWORD *)this + 9);
    if (v10)
    {
      *((_QWORD *)this + 10) = v10;
      operator delete(v10);
    }
    *((_BYTE *)this + 96) = 0;
  }
  if (*((_BYTE *)this + 116))
    *((_BYTE *)this + 116) = 0;
  *((_QWORD *)this + 13) -= v9;
}

void _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE6resizeEm(uint64_t a1, unint64_t a2)
{
  unint64_t v2;

  v2 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3;
  if (a2 <= v2)
  {
    if (a2 < v2)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 8 * a2;
  }
  else
  {
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE8__appendEm((void **)a1, a2 - v2);
  }
}

void std::vector<unsigned int>::resize(std::vector<unsigned int> *this, std::vector<unsigned int>::size_type __sz)
{
  std::vector<unsigned int>::size_type v2;

  v2 = this->__end_ - this->__begin_;
  if (__sz <= v2)
  {
    if (__sz < v2)
      this->__end_ = &this->__begin_[__sz];
  }
  else
  {
    std::vector<unsigned int>::__append(this, __sz - v2);
  }
}

void abpk::Human::updateFromRawJointArray(uint64_t *a1, _QWORD *a2)
{
  unsigned __int8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;
  uint64_t v8;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  float32x4_t v17;
  int16x4_t v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  float v23;
  void *v24;
  int v25;
  _QWORD *v26;
  int v27;
  char v28;

  if ((v3 & 1) == 0)
  {
    v26 = a2;
    a2 = v26;
    if (v25)
    {
      v27 = 286199296;
      v28 = 18;
      std::set<unsigned char>::set[abi:ne180100]((uint64_t)&abpk::Human::updateFromRawJointArray(std::vector<float> const&)::ignoreJointIndexes, (unsigned __int8 *)&v27, 5);
      __cxa_atexit((void (*)(void *))std::set<unsigned char>::~set[abi:ne180100], &abpk::Human::updateFromRawJointArray(std::vector<float> const&)::ignoreJointIndexes, &dword_210836000);
      a2 = v26;
    }
  }
  v4 = *a1;
  v5 = a1[1];
  if (v5 != *a1)
  {
    v6 = 0;
    v7 = 0;
    v8 = qword_254A71E50;
    __asm { FMOV            V1.2S, #-1.0 }
    do
    {
      if (v8)
      {
        v14 = v8;
        do
        {
          v15 = *(unsigned __int8 *)(v14 + 25);
          if (v15 <= v7)
          {
            if (v15 >= v7)
              goto LABEL_17;
            v14 += 8;
          }
          v14 = *(_QWORD *)v14;
        }
        while (v14);
      }
      v16 = *(_QWORD *)(*a2 + 8 * v6);
      v17.i64[0] = v16;
      v17.i64[1] = v16;
      v18.i32[0] = vmovn_s32(vcgtq_f32(v17, (float32x4_t)xmmword_210881980)).u32[0];
      v18.i32[1] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_210881980, v17)).i32[1];
      v19 = a1[3];
      v20 = *(_DWORD *)(v19 + 4 * v6);
      if ((vmaxv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v18, 0xFuLL))) & 1) != 0)
      {
        v16 = _D1;
        if (v20 != 1)
          goto LABEL_16;
        v21 = 0;
        v22 = -1;
        v23 = 0.0;
        v16 = _D1;
      }
      else
      {
        if (v20)
          goto LABEL_16;
        v23 = 0.5;
        v21 = 1;
        v22 = 1;
      }
      *(_DWORD *)(v19 + 4 * v6) = v21;
      *(float *)(a1[6] + 4 * v6) = v23;
      a1[13] += v22;
LABEL_16:
      *(_QWORD *)(v4 + 8 * v6) = v16;
      v8 = qword_254A71E50;
      v4 = *a1;
      v5 = a1[1];
LABEL_17:
      v6 = ++v7;
    }
    while (v7 < (unint64_t)((v5 - v4) >> 3));
  }
  if (*((_BYTE *)a1 + 96))
  {
    v24 = (void *)a1[9];
    if (v24)
    {
      a1[10] = (uint64_t)v24;
      operator delete(v24);
    }
    *((_BYTE *)a1 + 96) = 0;
  }
  if (*((_BYTE *)a1 + 116))
    *((_BYTE *)a1 + 116) = 0;
}

void sub_21084FB10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t std::set<unsigned char>::~set[abi:ne180100](uint64_t a1)
{
  std::__tree<unsigned char>::destroy(a1, *(_QWORD **)(a1 + 8));
  return a1;
}

void abpk::Human::updateJoint(uint64_t a1, uint64_t a2, double _D0)
{
  BOOL v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v11;
  float v12;
  uint64_t v13;
  void *v14;

  v4 = *(float *)&_D0 >= 0.0 && *(float *)&_D0 <= 1.0;
  if (v4 && (*((float *)&_D0 + 1) >= 0.0 ? (v5 = *((float *)&_D0 + 1) <= 1.0) : (v5 = 0), v5))
  {
    v13 = *(_QWORD *)(a1 + 24);
    if (*(_DWORD *)(v13 + 4 * a2))
      goto LABEL_16;
    v11 = 1;
    *(_DWORD *)(v13 + 4 * a2) = 1;
    v12 = 0.5;
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 24);
    if (*(_DWORD *)(v6 + 4 * a2) != 1)
    {
      __asm { FMOV            V0.2S, #-1.0 }
      goto LABEL_16;
    }
    *(_DWORD *)(v6 + 4 * a2) = 0;
    __asm { FMOV            V0.2S, #-1.0 }
    v11 = -1;
    v12 = 0.0;
  }
  *(float *)(*(_QWORD *)(a1 + 48) + 4 * a2) = v12;
  *(_QWORD *)(a1 + 104) += v11;
LABEL_16:
  *(double *)(*(_QWORD *)a1 + 8 * a2) = _D0;
  if (*(_BYTE *)(a1 + 96))
  {
    v14 = *(void **)(a1 + 72);
    if (v14)
    {
      *(_QWORD *)(a1 + 80) = v14;
      operator delete(v14);
    }
    *(_BYTE *)(a1 + 96) = 0;
  }
  if (*(_BYTE *)(a1 + 116))
    *(_BYTE *)(a1 + 116) = 0;
}

abpk::Human *abpk::Human::jointVector(abpk::Human *this)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  unint64_t v5;
  int32x2_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  int32x2_t *v16;
  char *v17;
  unint64_t v18;
  int32x2_t v19;
  unint64_t v20;
  int32x2_t v21;
  __n128 __p;
  unint64_t v24;

  v2 = *((_QWORD *)this + 1) - *(_QWORD *)this;
  if (*((_QWORD *)this + 13) == v2 >> 3)
    return this;
  v3 = (char *)this + 72;
  if (*((_BYTE *)this + 96))
    return (abpk::Human *)v3;
  __p = 0uLL;
  v24 = 0;
  _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE7reserveEm((void **)&__p, v2 >> 3);
  v4 = *(_QWORD *)this;
  if (*((_QWORD *)this + 1) != *(_QWORD *)this)
  {
    v5 = 0;
    v6 = vdup_n_s32(0x7FC00000u);
    do
    {
      if (*(_DWORD *)(*((_QWORD *)this + 3) + 4 * v5))
      {
        v7 = __p.n128_u64[1];
        if (__p.n128_u64[1] >= v24)
        {
          v10 = (uint64_t)(__p.n128_u64[1] - __p.n128_u64[0]) >> 3;
          if ((unint64_t)(v10 + 1) >> 61)
            std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
          v11 = (uint64_t)(v24 - __p.n128_u64[0]) >> 2;
          if (v11 <= v10 + 1)
            v11 = v10 + 1;
          if (v24 - __p.n128_u64[0] >= 0x7FFFFFFFFFFFFFF8)
            v12 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v12 = v11;
          if (v12)
            v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v24, v12);
          else
            v13 = 0;
          v16 = (int32x2_t *)&v13[8 * v10];
          *v16 = *(int32x2_t *)(v4 + 8 * v5);
          v8 = (unint64_t)&v16[1];
          v17 = (char *)__p.n128_u64[1];
          v18 = __p.n128_u64[0];
          if (__p.n128_u64[1] != __p.n128_u64[0])
          {
            do
            {
              v19 = *(int32x2_t *)(v17 - 8);
              v17 -= 8;
              v16[-1] = v19;
              --v16;
            }
            while (v17 != (char *)v18);
            goto LABEL_34;
          }
          goto LABEL_35;
        }
        *(_QWORD *)__p.n128_u64[1] = *(_QWORD *)(v4 + 8 * v5);
        v8 = v7 + 8;
      }
      else
      {
        v9 = __p.n128_u64[1];
        if (__p.n128_u64[1] >= v24)
        {
          v14 = (uint64_t)(__p.n128_u64[1] - __p.n128_u64[0]) >> 3;
          if ((unint64_t)(v14 + 1) >> 61)
            std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
          v15 = (uint64_t)(v24 - __p.n128_u64[0]) >> 2;
          if (v15 <= v14 + 1)
            v15 = v14 + 1;
          if (v24 - __p.n128_u64[0] >= 0x7FFFFFFFFFFFFFF8)
            v12 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v12 = v15;
          if (v12)
            v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v24, v12);
          else
            v13 = 0;
          v16 = (int32x2_t *)&v13[8 * v14];
          *v16 = v6;
          v8 = (unint64_t)&v16[1];
          v17 = (char *)__p.n128_u64[1];
          v20 = __p.n128_u64[0];
          if (__p.n128_u64[1] != __p.n128_u64[0])
          {
            do
            {
              v21 = *(int32x2_t *)(v17 - 8);
              v17 -= 8;
              v16[-1] = v21;
              --v16;
            }
            while (v17 != (char *)v20);
LABEL_34:
            v17 = (char *)__p.n128_u64[0];
          }
LABEL_35:
          __p.n128_u64[0] = (unint64_t)v16;
          __p.n128_u64[1] = v8;
          v24 = (unint64_t)&v13[8 * v12];
          if (v17)
            operator delete(v17);
          goto LABEL_37;
        }
        *(int32x2_t *)__p.n128_u64[1] = v6;
        v8 = v9 + 8;
      }
LABEL_37:
      __p.n128_u64[1] = v8;
      ++v5;
      v4 = *(_QWORD *)this;
    }
    while (v5 < (uint64_t)(*((_QWORD *)this + 1) - *(_QWORD *)this) >> 3);
  }
  _ZNSt3__18optionalINS_6vectorIDv2_fNS_9allocatorIS2_EEEEEaSB8ne180100IS5_vEERS6_OT_((uint64_t)this + 72, &__p);
  if (__p.n128_u64[0])
  {
    __p.n128_u64[1] = __p.n128_u64[0];
    operator delete((void *)__p.n128_u64[0]);
  }
  return (abpk::Human *)v3;
}

void sub_21084FE40(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t _ZNSt3__18optionalINS_6vectorIDv2_fNS_9allocatorIS2_EEEEEaSB8ne180100IS5_vEERS6_OT_(uint64_t a1, __n128 *a2)
{
  if (*(_BYTE *)(a1 + 24))
  {
    std::vector<float>::__move_assign(a1, a2);
  }
  else
  {
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
    *(__n128 *)a1 = *a2;
    *(_QWORD *)(a1 + 16) = a2[1].n128_u64[0];
    a2->n128_u64[0] = 0;
    a2->n128_u64[1] = 0;
    a2[1].n128_u64[0] = 0;
    *(_BYTE *)(a1 + 24) = 1;
  }
  return a1;
}

double abpk::Human::boundingBox(abpk::Human *this, CGSize a2)
{
  _QWORD *v2;
  uint64_t v3;
  unint64_t v4;
  float v5;
  float v6;
  float v7;
  float v8;
  uint64_t v9;
  float v10;
  float v12;

  v2 = *(_QWORD **)this;
  v3 = *((_QWORD *)this + 1) - *(_QWORD *)this;
  if (v3)
  {
    v4 = v3 >> 3;
    if (v4 <= 1)
      v4 = 1;
    v5 = 0.0;
    v6 = 3.4028e38;
    v7 = 3.4028e38;
    v8 = 0.0;
    do
    {
      v9 = *v2;
      LODWORD(v10) = HIDWORD(*v2);
      if (COERCE_FLOAT(*v2) != -1.0 && v10 != -1.0)
      {
        if (*(float *)&v9 > v8)
          LODWORD(v12) = *v2;
        else
          v12 = v8;
        if (*(float *)&v9 < v6)
          LODWORD(v6) = *v2;
        else
          v8 = v12;
        if (v10 >= v7)
        {
          if (v10 > v5)
            LODWORD(v5) = HIDWORD(*v2);
        }
        else
        {
          LODWORD(v7) = HIDWORD(*v2);
        }
      }
      ++v2;
      --v4;
    }
    while (v4);
  }
  else
  {
    v6 = 3.4028e38;
  }
  return (float)(v6 * (float)(unint64_t)a2.width);
}

float32x2_t abpk::Human::area(abpk::Human *this, float32x2_t result)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  float32x2_t v6;
  float32x2_t v7;
  float32x2_t v8;
  float32x2_t v9;

  if (*((_BYTE *)this + 116))
  {
    result.i32[0] = *((_DWORD *)this + 28);
  }
  else
  {
    v2 = *((_QWORD *)this + 1);
    v3 = v2 - *(_QWORD *)this;
    if (v2 == *(_QWORD *)this)
    {
      v9 = (float32x2_t)0x80000000800000;
    }
    else
    {
      v4 = 0;
      v5 = v3 >> 3;
      v6 = (float32x2_t)vdup_n_s32(0x7F7FFFFFu);
      v7 = (float32x2_t)0x80000000800000;
      do
      {
        if (*(_DWORD *)(*((_QWORD *)this + 3) + 4 * v4))
        {
          v8 = *(float32x2_t *)(*(_QWORD *)this + 8 * v4);
          v6 = vminnm_f32(v6, v8);
          v7 = vmaxnm_f32(v7, v8);
        }
        ++v4;
      }
      while (v5 > v4);
      v9 = vsub_f32(v7, v6);
    }
    result = vmul_lane_f32(v9, v9, 1);
    *((_DWORD *)this + 28) = result.i32[0];
    *((_BYTE *)this + 116) = 1;
  }
  return result;
}

void abpk::Human::printData(abpk::Human *this)
{
  unint64_t i;
  NSObject *v3;
  NSObject *v4;
  int v5;
  NSObject *v6;
  double v7;
  NSObject *v8;
  double v9;
  double v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  uint32_t v14;
  NSObject *v15;
  uint64_t v16;
  uint8_t buf[4];
  double v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (*((_QWORD *)this + 1) != *(_QWORD *)this)
  {
    for (i = 0; i < (uint64_t)(*((_QWORD *)this + 1) - *(_QWORD *)this) >> 3; ++i)
    {
      v3 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v18) = i;
        _os_log_impl(&dword_210836000, v3, OS_LOG_TYPE_DEBUG, " \t\t Joint: %d ", buf, 8u);
      }
      v4 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        v5 = *(_DWORD *)(*((_QWORD *)this + 3) + 4 * i);
        *(_DWORD *)buf = 67109120;
        LODWORD(v18) = v5;
        _os_log_impl(&dword_210836000, v4, OS_LOG_TYPE_DEBUG, " \t\t\t %d ", buf, 8u);
      }
      v6 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        v7 = *(float *)(*((_QWORD *)this + 6) + 4 * i);
        *(_DWORD *)buf = 134217984;
        v18 = v7;
        _os_log_impl(&dword_210836000, v6, OS_LOG_TYPE_DEBUG, " \t\t\t Confidence: %f ", buf, 0xCu);
      }
      v8 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v9 = COERCE_FLOAT(*(_QWORD *)(*(_QWORD *)this + 8 * i));
        v10 = COERCE_FLOAT(HIDWORD(*(_QWORD *)(*(_QWORD *)this + 8 * i)));
        *(_DWORD *)buf = 134218240;
        v18 = v9;
        v19 = 2048;
        v20 = v10;
        _os_log_impl(&dword_210836000, v8, OS_LOG_TYPE_DEBUG, " \t\t\t RawArray: (%f, %f) ", buf, 0x16u);
      }
      if (*(_DWORD *)(*((_QWORD *)this + 3) + 4 * i))
      {
        v16 = *(_QWORD *)(*(_QWORD *)this + 8 * i);
        v11 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218240;
          v18 = *(float *)&v16;
          v19 = 2048;
          v20 = *((float *)&v16 + 1);
          v12 = v11;
          v13 = " \t\t\t JointMap: (%f, %f) ";
          v14 = 22;
LABEL_16:
          _os_log_impl(&dword_210836000, v12, OS_LOG_TYPE_DEBUG, v13, buf, v14);
        }
      }
      else
      {
        v15 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          v12 = v15;
          v13 = " \t\t\t JointMap: Missing ";
          v14 = 2;
          goto LABEL_16;
        }
      }
    }
  }
}

uint64_t abpk::Human::printMissingJoints(abpk::Human *this)
{
  uint64_t v1;
  char *v3;
  unint64_t v4;
  char v5;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char *v17;
  int v18;
  int v19;
  NSObject *v20;
  char *v21;
  unint64_t v22;
  NSObject *v23;
  int v24;
  char *__p;
  char *v27;
  char *v28;
  uint8_t buf[4];
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  __p = 0;
  v27 = 0;
  v28 = 0;
  v1 = *(_QWORD *)this;
  if (*((_QWORD *)this + 1) == *(_QWORD *)this)
    goto LABEL_49;
  v3 = 0;
  v4 = 0;
  v5 = 0;
  do
  {
    if (!*(_DWORD *)(*((_QWORD *)this + 3) + 4 * v4))
    {
      if (v3 < v28)
        goto LABEL_19;
      v7 = __p;
      v14 = (v3 - __p) >> 2;
      v15 = v14 + 1;
      if ((unint64_t)(v14 + 1) >> 62)
        std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
      v16 = v28 - __p;
      if ((v28 - __p) >> 1 > v15)
        v15 = v16 >> 1;
      if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFFCLL)
        v11 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v11 = v15;
      if (v11)
      {
        v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v28, v11);
        v7 = __p;
        v3 = v27;
      }
      else
      {
        v12 = 0;
      }
      v17 = &v12[4 * v14];
      *(_DWORD *)v17 = v4;
      v13 = v17 + 4;
      while (v3 != v7)
      {
        v18 = *((_DWORD *)v3 - 1);
        v3 -= 4;
        *((_DWORD *)v17 - 1) = v18;
        v17 -= 4;
      }
LABEL_36:
      __p = v17;
      v28 = &v12[4 * v11];
      if (v7)
        operator delete(v7);
LABEL_38:
      v27 = v13;
      v5 = 1;
      v3 = v13;
      goto LABEL_39;
    }
    if (COERCE_FLOAT(*(_QWORD *)(v1 + 8 * v4)) == -1.0 || COERCE_FLOAT(HIDWORD(*(_QWORD *)(v1 + 8 * v4))) == -1.0)
    {
      if (v3 >= v28)
      {
        v7 = __p;
        v8 = (v3 - __p) >> 2;
        v9 = v8 + 1;
        if ((unint64_t)(v8 + 1) >> 62)
          std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
        v10 = v28 - __p;
        if ((v28 - __p) >> 1 > v9)
          v9 = v10 >> 1;
        if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFFCLL)
          v11 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v11 = v9;
        if (v11)
        {
          v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v28, v11);
          v7 = __p;
          v3 = v27;
        }
        else
        {
          v12 = 0;
        }
        v17 = &v12[4 * v8];
        *(_DWORD *)v17 = v4;
        v13 = v17 + 4;
        while (v3 != v7)
        {
          v19 = *((_DWORD *)v3 - 1);
          v3 -= 4;
          *((_DWORD *)v17 - 1) = v19;
          v17 -= 4;
        }
        goto LABEL_36;
      }
LABEL_19:
      *(_DWORD *)v3 = v4;
      v13 = v3 + 4;
      goto LABEL_38;
    }
LABEL_39:
    ++v4;
    v1 = *(_QWORD *)this;
  }
  while (v4 < (uint64_t)(*((_QWORD *)this + 1) - *(_QWORD *)this) >> 3);
  if ((v5 & 1) == 0)
  {
LABEL_49:
    v5 = 0;
    v21 = __p;
    goto LABEL_50;
  }
  v20 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, v20, OS_LOG_TYPE_DEBUG, " \tMissing Joints: ", buf, 2u);
  }
  v21 = v27;
  if (v27 == __p)
  {
    v5 = 1;
    if (v27)
      goto LABEL_51;
  }
  else
  {
    v22 = 0;
    do
    {
      v23 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v24 = *(_DWORD *)&__p[4 * v22];
        *(_DWORD *)buf = 67109120;
        v30 = v24;
        _os_log_impl(&dword_210836000, v23, OS_LOG_TYPE_DEBUG, " \t\t %d ", buf, 8u);
      }
      ++v22;
      v21 = __p;
    }
    while (v22 < (v27 - __p) >> 2);
LABEL_50:
    if (v21)
LABEL_51:
      operator delete(v21);
  }
  return v5 & 1;
}

void sub_2108505B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE8__appendEm(void **a1, unint64_t a2)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 3)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 8 * a2);
      v7 += 8 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = v7 - (_BYTE *)*a1;
    v9 = a2 + (v8 >> 3);
    if (v9 >> 61)
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    v10 = v8 >> 3;
    v11 = v5 - (_BYTE *)*a1;
    if (v11 >> 2 > v9)
      v9 = v11 >> 2;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
      v12 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v12 = v9;
    if (v12)
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v4, v12);
    else
      v13 = 0;
    v14 = &v13[8 * v10];
    v15 = &v13[8 * v12];
    bzero(v14, 8 * a2);
    v16 = &v14[8 * a2];
    v18 = (char *)*a1;
    v17 = (char *)a1[1];
    if (v17 != *a1)
    {
      do
      {
        v19 = *((_QWORD *)v17 - 1);
        v17 -= 8;
        *((_QWORD *)v14 - 1) = v19;
        v14 -= 8;
      }
      while (v17 != v18);
      v17 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v16;
    a1[2] = v15;
    if (v17)
      operator delete(v17);
  }
}

void std::vector<unsigned int>::__append(std::vector<unsigned int> *this, std::vector<unsigned int>::size_type __n)
{
  std::__compressed_pair<unsigned int *> *p_end_cap;
  unsigned int *v5;
  unsigned int *value;
  unsigned int *end;
  std::vector<unsigned int>::pointer begin;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  unsigned int *v16;
  unsigned int *v17;
  int v18;

  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  v5 = value;
  end = p_end_cap[-1].__value_;
  if (__n <= value - end)
  {
    if (__n)
    {
      bzero(p_end_cap[-1].__value_, 4 * __n);
      end += __n;
    }
    this->__end_ = end;
  }
  else
  {
    begin = this->__begin_;
    v9 = (char *)end - (char *)this->__begin_;
    v10 = __n + (v9 >> 2);
    if (v10 >> 62)
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    v11 = v9 >> 2;
    v12 = (char *)v5 - (char *)begin;
    if (v12 >> 1 > v10)
      v10 = v12 >> 1;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL)
      v13 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v13 = v10;
    if (v13)
    {
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)p_end_cap, v13);
      begin = this->__begin_;
      end = this->__end_;
    }
    else
    {
      v14 = 0;
    }
    v15 = &v14[4 * v11];
    v16 = (unsigned int *)&v14[4 * v13];
    bzero(v15, 4 * __n);
    v17 = (unsigned int *)&v15[4 * __n];
    while (end != begin)
    {
      v18 = *--end;
      *((_DWORD *)v15 - 1) = v18;
      v15 -= 4;
    }
    this->__begin_ = (std::vector<unsigned int>::pointer)v15;
    this->__end_ = v17;
    this->__end_cap_.__value_ = v16;
    if (begin)
      operator delete(begin);
  }
}

uint64_t std::set<unsigned char>::set[abi:ne180100](uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;

  *(_QWORD *)(a1 + 8) = 0;
  v4 = (uint64_t *)(a1 + 8);
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = a1 + 8;
  if (a3)
  {
    v5 = a3;
    do
    {
      std::__tree<unsigned char>::__emplace_hint_unique_key_args<unsigned char,unsigned char const&>((uint64_t **)a1, v4, a2, a2);
      ++a2;
      --v5;
    }
    while (v5);
  }
  return a1;
}

void sub_210850854(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<unsigned char>::destroy(v1, *(_QWORD **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<unsigned char>::__emplace_hint_unique_key_args<unsigned char,unsigned char const&>(uint64_t **a1, uint64_t *a2, unsigned __int8 *a3, _BYTE *a4)
{
  uint64_t *v6;
  uint64_t *v7;
  uint64_t **v8;
  uint64_t v10;
  uint64_t *v11;

  v6 = std::__tree<unsigned char>::__find_equal<unsigned char>(a1, a2, &v11, &v10, a3);
  v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    v8 = (uint64_t **)v6;
    v7 = (uint64_t *)operator new(0x20uLL);
    *((_BYTE *)v7 + 25) = *a4;
    std::__tree<std::__value_type<long,std::vector<long>>,std::__map_value_compare<long,std::__value_type<long,std::vector<long>>,std::less<long>,true>,std::allocator<std::__value_type<long,std::vector<long>>>>::__insert_node_at(a1, (uint64_t)v11, v8, v7);
  }
  return v7;
}

uint64_t *std::__tree<unsigned char>::__find_equal<unsigned char>(_QWORD *a1, uint64_t *a2, uint64_t **a3, uint64_t *a4, unsigned __int8 *a5)
{
  uint64_t *v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  BOOL v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t *v17;
  unsigned int v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  unsigned int v22;

  v5 = a1 + 1;
  if (a1 + 1 == a2 || (v6 = *a5, v7 = *((unsigned __int8 *)a2 + 25), v6 < v7))
  {
    v8 = (uint64_t *)*a2;
    if ((uint64_t *)*a1 == a2)
    {
      v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      v9 = (uint64_t *)*a2;
      do
      {
        v10 = v9;
        v9 = (uint64_t *)v9[1];
      }
      while (v9);
    }
    else
    {
      v13 = a2;
      do
      {
        v10 = (uint64_t *)v13[2];
        v14 = *v10 == (_QWORD)v13;
        v13 = v10;
      }
      while (v14);
    }
    v15 = *a5;
    if (*((unsigned __int8 *)v10 + 25) < v15)
      goto LABEL_17;
    v16 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v17 = (uint64_t *)v16;
          v18 = *(unsigned __int8 *)(v16 + 25);
          if (v15 >= v18)
            break;
          v16 = *v17;
          v5 = v17;
          if (!*v17)
            goto LABEL_29;
        }
        if (v18 >= v15)
          break;
        v5 = v17 + 1;
        v16 = v17[1];
      }
      while (v16);
    }
    else
    {
      v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = (uint64_t)a2;
    return a4;
  }
  v11 = a2[1];
  if (v11)
  {
    v12 = (uint64_t *)a2[1];
    do
    {
      a4 = v12;
      v12 = (uint64_t *)*v12;
    }
    while (v12);
  }
  else
  {
    v19 = a2;
    do
    {
      a4 = (uint64_t *)v19[2];
      v14 = *a4 == (_QWORD)v19;
      v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= *((unsigned __int8 *)a4 + 25))
  {
    v20 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v21 = (uint64_t *)v20;
          v22 = *(unsigned __int8 *)(v20 + 25);
          if (v6 >= v22)
            break;
          v20 = *v21;
          v5 = v21;
          if (!*v21)
            goto LABEL_48;
        }
        if (v22 >= v6)
          break;
        v5 = v21 + 1;
        v20 = v21[1];
      }
      while (v20);
    }
    else
    {
      v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

void std::__tree<unsigned char>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<unsigned char>::destroy(a1, *a2);
    std::__tree<unsigned char>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

void abpk::parsePersonsfromHeatmapBuffer(uint64_t a1@<X0>, unint64_t a2@<X2>, unint64_t a3@<X3>, uint64_t *a4@<X8>, __n128 a5@<Q0>)
{
  void **v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  const void *v17;
  __int128 v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  int v28;
  unsigned int v29;
  unint64_t v30;
  BOOL v32;
  uint64_t i;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  float v43;
  float v44;
  uint64_t v45;
  float *v46;
  uint64_t v47;
  uint64_t *v48;
  unint64_t v49;
  uint64_t v50;
  __int128 v51;
  int v52;
  uint64_t v53;
  float *v54;
  uint64_t v55;
  uint64_t *v56;
  _QWORD *v57;
  _QWORD *v58;
  uint64_t k;
  int v61;
  unint64_t v64;
  unint64_t v65;
  BOOL v69;
  int m;
  unint64_t v71;
  char v72;
  uint64_t v92;
  uint64_t v96;
  size_t v97;
  uint64_t v98;
  unint64_t v99;
  uint64_t v100;
  char *v101;
  __int128 v102;
  uint64_t v103;
  int v104;
  uint64_t *v105;
  int v106;
  float *v107;
  __int128 v108;
  __int128 v109;
  uint64_t v110;
  int v111;
  uint64_t v112;

  _H8 = a5.n128_u16[0];
  v112 = *MEMORY[0x24BDAC8D0];
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  v105 = a4;
  v9 = std::vector<abpk::HeatmapPersonData>::reserve(a4, 5uLL);
  if (a1)
  {
    v96 = (uint64_t)&v96;
    v99 = a3 * a2;
    v97 = 2 * a3 * a2;
    MEMORY[0x24BDAC7A8](v9);
    v11 = (char *)&v96 - v10;
    v12 = 0;
    __asm { FCVT            S8, H8 }
    v98 = a1;
    v101 = (char *)&v96 - v10;
    do
    {
      v17 = (const void *)(a1 + 2 * v99 * v12);
      memcpy(v11, v17, v97);
      v100 = v12;
      v20 = v105;
      if (a2)
      {
        v21 = 0;
        LODWORD(v22) = 0;
        v103 = v98 + 2 * v99 * (v100 + 19);
        v20 = v105;
        v104 = -3;
        do
        {
          if (a3)
          {
            v23 = 0;
            *(float *)&v18 = (float)(int)v21;
            v102 = v18;
            v22 = (int)v22;
            v24 = v11;
            do
            {
              _H0 = *(_WORD *)&v11[2 * v22];
              __asm { FCVT            S1, H0 }
              if (_S1 >= _S8)
              {
                v28 = -3;
                v29 = v104;
                while (2)
                {
                  v30 = (v28 + v21);
                  v32 = (v30 & 0x80000000) != 0 || v30 >= a2;
                  for (i = -3; i != 4; ++i)
                  {
                    if (!v32 && v23 + i >= 0 && (v23 + i) < a3)
                    {
                      _H2 = *(_WORD *)&v24[2 * i + 2 * a3 * v29];
                      __asm { FCVT            S2, H2 }
                      if (_S2 > _S1)
                      {
                        _S0 = _S1 + -1.0;
                        __asm { FCVT            H0, S0 }
                        *(_WORD *)&v11[2 * v22] = _H0;
                        goto LABEL_25;
                      }
                    }
                  }
                  ++v28;
                  ++v29;
                  if (v28 != 4)
                    continue;
                  break;
                }
LABEL_25:
                __asm { FCVT            S14, H0 }
                v20 = v105;
                if (_S14 >= _S8)
                {
                  _H0 = *(_WORD *)(v103 + 2 * v22);
                  __asm { FCVT            S0, H0 }
                  v111 = LODWORD(_S0);
                  v40 = *v105;
                  v41 = v105[1];
                  if (*v105 != v41)
                  {
                    for (j = v40 + 56; j != v41; j += 56)
                    {
                      if (vabds_f32(_S0, *(float *)(j + 48)) < vabds_f32(_S0, *(float *)(v40 + 48)))
                        v40 = j;
                    }
                  }
                  if (v40 == v41 || (v43 = *(float *)(v40 + 48), vabds_f32(_S0, v43) >= 0.3))
                  {
                    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEEC2Em(&v109, 0x13uLL);
                    *(float *)&v45 = (float)(int)v23;
                    HIDWORD(v45) = v102;
                    *(_QWORD *)(v109 + 8 * v19) = v45;
                    std::vector<float>::vector(&v107, 0x13uLL);
                    v46 = v107;
                    v47 = v19;
                    v107[v19] = _S14;
                    v106 = 1065353216;
                    v48 = v105;
                    v49 = v105[1];
                    if (v49 >= v105[2])
                    {
                      v53 = _ZNSt3__16vectorIN4abpk17HeatmapPersonDataENS_9allocatorIS2_EEE24__emplace_back_slow_pathIJNS0_IDv2_fNS3_IS7_EEEENS0_IfNS3_IfEEEERKffEEEPS2_DpOT_(v105, &v109, (__int128 *)&v107, &v111, &v106);
                      v54 = v107;
                      v48[1] = v53;
                      if (v54)
                      {
                        *(_QWORD *)&v108 = v54;
                        operator delete(v54);
                      }
                    }
                    else
                    {
                      v50 = v110;
                      v51 = v108;
                      v18 = v109;
                      v110 = 0;
                      v109 = 0uLL;
                      v52 = v111;
                      *(_OWORD *)v49 = v18;
                      *(_QWORD *)(v49 + 16) = v50;
                      *(_QWORD *)(v49 + 24) = v46;
                      *(_OWORD *)(v49 + 32) = v51;
                      *(_DWORD *)(v49 + 48) = v52;
                      *(_DWORD *)(v49 + 52) = 1065353216;
                      v48[1] = v49 + 56;
                    }
                    v19 = v47;
                    if ((_QWORD)v109)
                    {
                      *((_QWORD *)&v109 + 1) = v109;
                      operator delete((void *)v109);
                    }
                    v11 = v101;
                  }
                  else
                  {
                    v44 = *(float *)(v40 + 52);
                    *(float *)(v40 + 48) = (float)(_S0 + (float)(v43 * v44)) / (float)(v44 + 1.0);
                    *(float *)(v40 + 52) = v44 + 1.0;
                    if (*(float *)(*(_QWORD *)(v40 + 24) + 4 * v19) < _S14)
                    {
                      *(float *)&v18 = (float)(int)v23;
                      DWORD1(v18) = v102;
                      *(_QWORD *)(*(_QWORD *)v40 + 8 * v19) = v18;
                      *(float *)(*(_QWORD *)(v40 + 24) + 4 * v19) = _S14;
                    }
                  }
                  v20 = v105;
                }
              }
              else
              {
                _S0 = _S1 + -1.0;
                __asm { FCVT            H0, S0 }
                *(_WORD *)&v11[2 * v22] = LOWORD(_S0);
              }
              ++v23;
              ++v22;
              v24 += 2;
            }
            while (v23 != a3);
          }
          ++v21;
          ++v104;
        }
        while (v21 != a2);
      }
      v55 = v19;
      v56 = v20;
      v57 = (_QWORD *)*v20;
      v58 = (_QWORD *)v56[1];
      a1 = v98;
      for (k = v100; v57 != v58; v57 += 7)
      {
        _H1 = 0;
        v61 = -3;
        _H0 = 0;
        _H2 = 0;
        do
        {
          v64 = (v61 + (int)COERCE_FLOAT(HIDWORD(*(_QWORD *)(*v57 + 8 * v55))));
          v65 = v64 * a3;
          _S3 = (float)(int)v64;
          __asm { FCVT            H3, S3 }
          v69 = _NF != _VF || v64 >= a2;
          for (m = -3; m != 4; ++m)
          {
            v71 = ((int)COERCE_FLOAT(*(_QWORD *)(*v57 + 8 * v55)) + m);
            v72 = (v71 & 0x80000000) != 0 || v69;
            if ((v72 & 1) == 0 && v71 < a3)
            {
              _H4 = *((_WORD *)v17 + v65 + v71);
              __asm { FCVT            S4, H4 }
              if (_S4 > 0.049988)
              {
                __asm { FCVT            S1, H1 }
                _S1 = _S1 + _S4;
                __asm { FCVT            H1, S1 }
                _S5 = (float)(int)v71;
                __asm
                {
                  FCVT            H5, S5
                  FCVT            S5, H5
                }
                _S5 = _S4 * _S5;
                __asm
                {
                  FCVT            H5, S5
                  FCVT            S5, H5
                  FCVT            S2, H2
                }
                _S2 = _S5 + _S2;
                __asm
                {
                  FCVT            H2, S2
                  FCVT            S5, H3
                }
                _S4 = _S4 * _S5;
                __asm
                {
                  FCVT            H4, S4
                  FCVT            S4, H4
                  FCVT            S0, H0
                }
                _S0 = _S4 + _S0;
                __asm { FCVT            H0, S0 }
              }
            }
          }
          ++v61;
        }
        while (v61 != 4);
        __asm { FCVT            S1, H1 }
        if (_S1 > 0.0)
        {
          __asm { FCVT            S2, H2 }
          _S2 = _S2 / _S1;
          __asm
          {
            FCVT            H2, S2
            FCVT            S2, H2
          }
          *(float *)&v92 = _S2 + 0.5;
          __asm { FCVT            S0, H0 }
          _S0 = _S0 / _S1;
          __asm
          {
            FCVT            H0, S0
            FCVT            S0, H0
          }
          *((float *)&v92 + 1) = _S0 + 0.5;
          *(_QWORD *)(*v57 + 8 * v55) = v92;
        }
      }
      v12 = k + 1;
    }
    while (v12 != 19);
  }
}

void sub_21085105C(_Unwind_Exception *a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 192) = *(_QWORD *)(v1 - 232);
  std::vector<abpk::HeatmapPersonData>::__destroy_vector::operator()[abi:ne180100]((void ***)(v1 - 192));
  _Unwind_Resume(a1);
}

void **std::vector<abpk::HeatmapPersonData>::reserve(uint64_t *a1, unint64_t a2)
{
  void **result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7[5];

  v4 = a1[2];
  result = (void **)(a1 + 2);
  if (0x6DB6DB6DB6DB6DB7 * ((v4 - *a1) >> 3) < a2)
  {
    if (a2 >= 0x492492492492493)
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::HeatmapPersonData>>((uint64_t)result, a2);
    v7[1] = (char *)v7[0] + v5;
    v7[2] = (char *)v7[0] + v5;
    v7[3] = (char *)v7[0] + 56 * v6;
    std::vector<abpk::HeatmapPersonData>::__swap_out_circular_buffer(a1, v7);
    return std::__split_buffer<abpk::HeatmapPersonData>::~__split_buffer(v7);
  }
  return result;
}

void sub_210851154(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<abpk::HeatmapPersonData>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

uint64_t abpk::convertPersonsToHuman@<X0>(uint64_t **a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  BOOL v20;
  unint64_t v21;

  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  result = (uint64_t)std::vector<abpk::Human>::reserve(a3, 0x6DB6DB6DB6DB6DB7 * (a1[1] - *a1));
  v7 = *a1;
  v8 = a1[1];
  if (*a1 != v8)
  {
    __asm { FMOV            V9.2S, #-1.0 }
    do
    {
      _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)v7, a2);
      std::vector<float>::resize((uint64_t)(v7 + 3), a2);
      v15 = *v7;
      v14 = v7[1];
      if (v14 != *v7)
      {
        v16 = 0;
        do
        {
          v17 = v7[3];
          v18 = *(_QWORD *)(v15 + 8 * v16);
          v19 = *(float *)&v18 >= 0.0 && *(float *)&v18 <= 1.0;
          if (!v19
            || (*((float *)&v18 + 1) >= 0.0 ? (v20 = *((float *)&v18 + 1) <= 1.0) : (v20 = 0),
                !v20 || *(float *)(v17 + 4 * v16) == 0.0))
          {
            *(_QWORD *)(v15 + 8 * v16) = _D9;
            *(_DWORD *)(v17 + 4 * v16) = 0;
            v15 = *v7;
            v14 = v7[1];
          }
          ++v16;
        }
        while (v16 < (v14 - v15) >> 3);
      }
      v21 = a3[1];
      if (v21 >= a3[2])
      {
        result = _ZNSt3__16vectorIN4abpk5HumanENS_9allocatorIS2_EEE24__emplace_back_slow_pathIJNS0_IDv2_fNS3_IS7_EEEENS0_IfNS3_IfEEEEEEEPS2_DpOT_(a3, (uint64_t)v7, (uint64_t)(v7 + 3));
      }
      else
      {
        _ZNSt3__19allocatorIN4abpk5HumanEE9constructB8ne180100IS2_JNS_6vectorIDv2_fNS0_IS6_EEEENS5_IfNS0_IfEEEEEEEvPT_DpOT0_((uint64_t)(a3 + 2), a3[1], (uint64_t)v7, (uint64_t)(v7 + 3));
        result = v21 + 120;
        a3[1] = v21 + 120;
      }
      a3[1] = result;
      v7 += 7;
    }
    while (v7 != v8);
  }
  return result;
}

void sub_2108512C0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::vector<abpk::Human>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

void std::vector<float>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2;

  v2 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 2;
  if (a2 <= v2)
  {
    if (a2 < v2)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 4 * a2;
  }
  else
  {
    std::vector<float>::__append((char **)a1, a2 - v2);
  }
}

uint64_t abpk::filterValidPersons(__n128 **a1, uint64_t a2, uint64_t a3, float a4)
{
  __n128 *v5;
  __n128 *v6;
  uint64_t v8;
  uint64x2_t v9;
  float32x2_t v10;
  unint64_t v16;
  unint64_t v17;
  float v18;
  float32x2_t v19;
  float32x2_t v20;
  float v21;
  float32x2_t v22;
  float v23;
  float32x2_t v24;
  float v26;
  __n128 *v28;
  __n128 *v30;
  unint64_t v31;
  unint64_t v32;
  float v33;
  float32x2_t v34;
  float32x2_t v35;
  float v36;
  float32x2_t v37;
  float v38;
  float32x2_t v39;
  float v41;

  v5 = *a1;
  v6 = a1[1];
  if (*a1 == v6)
    goto LABEL_43;
  v8 = (uint64_t)a1[1];
  v9.i64[0] = a2;
  v9.i64[1] = a3;
  v10 = vcvt_f32_f64(vcvtq_f64_u64(v9));
  __asm { FMOV            V0.2S, #1.0 }
  while (1)
  {
    v16 = v5->n128_u64[0];
    if (v5->n128_u64[1] == v5->n128_u64[0])
      break;
    v17 = 0;
    v18 = 0.0;
    v19 = 0;
    v20 = _D0;
    v21 = 0.0;
    do
    {
      v22 = vdiv_f32(*(float32x2_t *)(v16 + 8 * v17), v10);
      *(float32x2_t *)(v16 + 8 * v17) = v22;
      v23 = *(float *)(v5[1].n128_u64[1] + 4 * v17);
      if (v23 > a4)
      {
        v20 = vminnm_f32(v20, v22);
        v19 = vmaxnm_f32(v19, v22);
        v18 = v18 + v23;
        v21 = v21 + 1.0;
      }
      ++v17;
      v16 = v5->n128_u64[0];
    }
    while (v17 < (uint64_t)(v5->n128_u64[1] - v5->n128_u64[0]) >> 3);
    v24 = vsub_f32(v19, v20);
    if (v24.f32[0] <= 0.0)
      break;
    if (v24.f32[1] <= 0.0 || v21 <= 4.0)
      break;
    if (v24.f32[0] < v24.f32[1])
      v24.f32[0] = v24.f32[1];
    v26 = v18 / v21;
    if (v24.f32[0] <= 0.1 || v26 <= a4)
      break;
    v5 = (__n128 *)((char *)v5 + 56);
    if (v5 == v6)
      return std::vector<abpk::HeatmapPersonData>::erase((uint64_t)a1, v8, (uint64_t)a1[1]);
  }
  if (v5 != v6)
  {
    v28 = (__n128 *)((char *)v5 + 56);
    if (&v5[3].n128_i8[8] != (__int8 *)v6)
    {
      __asm { FMOV            V11.2S, #1.0 }
      v8 = (uint64_t)v5;
      do
      {
        v30 = v5;
        v5 = v28;
        v31 = v30[3].n128_u64[1];
        if (v30[4].n128_u64[0] != v31)
        {
          v32 = 0;
          v33 = 0.0;
          v34 = 0;
          v35 = _D11;
          v36 = 0.0;
          do
          {
            v37 = vdiv_f32(*(float32x2_t *)(v31 + 8 * v32), v10);
            *(float32x2_t *)(v31 + 8 * v32) = v37;
            v38 = *(float *)(v30[5].n128_u64[0] + 4 * v32);
            if (v38 > a4)
            {
              v35 = vminnm_f32(v35, v37);
              v34 = vmaxnm_f32(v34, v37);
              v33 = v33 + v38;
              v36 = v36 + 1.0;
            }
            ++v32;
            v31 = v5->n128_u64[0];
          }
          while (v32 < (uint64_t)(v30[4].n128_u64[0] - v5->n128_u64[0]) >> 3);
          v39 = vsub_f32(v34, v35);
          if (v39.f32[0] > 0.0 && v39.f32[1] > 0.0 && v36 > 4.0)
          {
            if (v39.f32[0] < v39.f32[1])
              v39.f32[0] = v39.f32[1];
            v41 = v33 / v36;
            if (v39.f32[0] > 0.1 && v41 > a4)
            {
              std::vector<float>::__move_assign(v8, v5);
              std::vector<float>::__move_assign(v8 + 24, v30 + 5);
              *(_QWORD *)(v8 + 48) = v30[6].n128_u64[1];
              v8 += 56;
            }
          }
        }
        v28 = (__n128 *)((char *)v5 + 56);
      }
      while (&v5[3].n128_i8[8] != (__int8 *)v6);
      return std::vector<abpk::HeatmapPersonData>::erase((uint64_t)a1, v8, (uint64_t)a1[1]);
    }
LABEL_43:
    v8 = (uint64_t)v5;
  }
  return std::vector<abpk::HeatmapPersonData>::erase((uint64_t)a1, v8, (uint64_t)a1[1]);
}

uint64_t std::vector<abpk::HeatmapPersonData>::erase(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;

  if (a2 != a3)
  {
    std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<abpk::HeatmapPersonData *,abpk::HeatmapPersonData *,abpk::HeatmapPersonData *>((uint64_t)&v9, a3, *(_QWORD *)(a1 + 8), a2);
    v6 = v5;
    v7 = *(_QWORD *)(a1 + 8);
    if (v7 != v5)
    {
      do
      {
        v7 -= 56;
        std::allocator<abpk::HeatmapPersonData>::destroy[abi:ne180100](a1 + 16, v7);
      }
      while (v7 != v6);
    }
    *(_QWORD *)(a1 + 8) = v6;
  }
  return a2;
}

uint64_t std::vector<abpk::HeatmapPersonData>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<abpk::HeatmapPersonData>,std::reverse_iterator<abpk::HeatmapPersonData*>,std::reverse_iterator<abpk::HeatmapPersonData*>,std::reverse_iterator<abpk::HeatmapPersonData*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::HeatmapPersonData>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x492492492492493)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(56 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<abpk::HeatmapPersonData>,std::reverse_iterator<abpk::HeatmapPersonData*>,std::reverse_iterator<abpk::HeatmapPersonData*>,std::reverse_iterator<abpk::HeatmapPersonData*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  _QWORD v11[3];
  char v12;
  __int128 v13;
  __int128 v14;

  v7 = a7;
  *(_QWORD *)&v14 = a6;
  *((_QWORD *)&v14 + 1) = a7;
  v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    v9 = a6;
  }
  else
  {
    do
    {
      *(_QWORD *)(v7 - 56) = 0;
      *(_QWORD *)(v7 - 48) = 0;
      *(_QWORD *)(v7 - 40) = 0;
      v8 = *(_OWORD *)(a3 - 56);
      a3 -= 56;
      *(_OWORD *)(v7 - 56) = v8;
      *(_QWORD *)(v7 - 40) = *(_QWORD *)(a3 + 16);
      *(_QWORD *)a3 = 0;
      *(_QWORD *)(a3 + 8) = 0;
      *(_QWORD *)(a3 + 16) = 0;
      *(_QWORD *)(v7 - 32) = 0;
      *(_QWORD *)(v7 - 24) = 0;
      *(_QWORD *)(v7 - 16) = 0;
      *(_OWORD *)(v7 - 32) = *(_OWORD *)(a3 + 24);
      *(_QWORD *)(v7 - 16) = *(_QWORD *)(a3 + 40);
      *(_QWORD *)(a3 + 24) = 0;
      *(_QWORD *)(a3 + 32) = 0;
      *(_QWORD *)(a3 + 40) = 0;
      *(_QWORD *)(v7 - 8) = *(_QWORD *)(a3 + 48);
      v7 = *((_QWORD *)&v14 + 1) - 56;
      *((_QWORD *)&v14 + 1) -= 56;
    }
    while (a3 != a5);
    v9 = v14;
  }
  v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<abpk::HeatmapPersonData>,std::reverse_iterator<abpk::HeatmapPersonData*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<abpk::HeatmapPersonData>,std::reverse_iterator<abpk::HeatmapPersonData*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<abpk::HeatmapPersonData>,std::reverse_iterator<abpk::HeatmapPersonData*>>::operator()[abi:ne180100]((uint64_t *)a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<abpk::HeatmapPersonData>,std::reverse_iterator<abpk::HeatmapPersonData*>>::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(a1[2] + 8);
  v2 = *(_QWORD *)(a1[1] + 8);
  if (v1 != v2)
  {
    v3 = *a1;
    do
    {
      std::allocator<abpk::HeatmapPersonData>::destroy[abi:ne180100](v3, v1);
      v1 += 56;
    }
    while (v1 != v2);
  }
}

void **std::__split_buffer<abpk::HeatmapPersonData>::~__split_buffer(void **a1)
{
  std::__split_buffer<abpk::HeatmapPersonData>::clear[abi:ne180100](a1);
  if (*a1)
    operator delete(*a1);
  return a1;
}

void std::__split_buffer<abpk::HeatmapPersonData>::clear[abi:ne180100](_QWORD *a1)
{
  uint64_t i;
  uint64_t v2;
  uint64_t v4;

  v2 = a1[1];
  for (i = a1[2]; i != v2; i = a1[2])
  {
    v4 = a1[4];
    a1[2] = i - 56;
    std::allocator<abpk::HeatmapPersonData>::destroy[abi:ne180100](v4, i - 56);
  }
}

uint64_t _ZNSt3__16vectorIN4abpk17HeatmapPersonDataENS_9allocatorIS2_EEE24__emplace_back_slow_pathIJNS0_IDv2_fNS3_IS7_EEEENS0_IfNS3_IfEEEERKffEEEPS2_DpOT_(uint64_t *a1, __int128 *a2, __int128 *a3, int *a4, int *a5)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  int v23;
  int v24;
  uint64_t v25;
  void *v27[5];

  v6 = *a1;
  v7 = 0x6DB6DB6DB6DB6DB7 * ((a1[1] - *a1) >> 3);
  v8 = v7 + 1;
  if ((unint64_t)(v7 + 1) > 0x492492492492492)
    std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
  v13 = (uint64_t)(a1 + 2);
  v14 = 0x6DB6DB6DB6DB6DB7 * ((a1[2] - v6) >> 3);
  if (2 * v14 > v8)
    v8 = 2 * v14;
  if (v14 >= 0x249249249249249)
    v15 = 0x492492492492492;
  else
    v15 = v8;
  v27[4] = a1 + 2;
  v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::HeatmapPersonData>>(v13, v15);
  v17 = &v16[56 * v7];
  v27[0] = v16;
  v27[1] = v17;
  v27[3] = &v16[56 * v18];
  v19 = *((_QWORD *)a2 + 2);
  v20 = *a2;
  *((_QWORD *)a2 + 1) = 0;
  *((_QWORD *)a2 + 2) = 0;
  *(_QWORD *)a2 = 0;
  v21 = *((_QWORD *)a3 + 2);
  v22 = *a3;
  *(_QWORD *)a3 = 0;
  *((_QWORD *)a3 + 1) = 0;
  *((_QWORD *)a3 + 2) = 0;
  v23 = *a4;
  v24 = *a5;
  *(_OWORD *)v17 = v20;
  *((_QWORD *)v17 + 2) = v19;
  *(_OWORD *)(v17 + 24) = v22;
  *((_QWORD *)v17 + 5) = v21;
  *((_DWORD *)v17 + 12) = v23;
  *((_DWORD *)v17 + 13) = v24;
  v27[2] = v17 + 56;
  std::vector<abpk::HeatmapPersonData>::__swap_out_circular_buffer(a1, v27);
  v25 = a1[1];
  std::__split_buffer<abpk::HeatmapPersonData>::~__split_buffer(v27);
  return v25;
}

void sub_210851988(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<abpk::HeatmapPersonData>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

void std::vector<float>::__append(char **a1, unint64_t a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  int v18;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 2)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 4 * a2);
      v7 += 4 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = *a1;
    v9 = v7 - *a1;
    v10 = a2 + (v9 >> 2);
    if (v10 >> 62)
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    v11 = v9 >> 2;
    v12 = v5 - v8;
    if (v12 >> 1 > v10)
      v10 = v12 >> 1;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL)
      v13 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v13 = v10;
    if (v13)
    {
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v4, v13);
      v8 = *a1;
      v7 = a1[1];
    }
    else
    {
      v14 = 0;
    }
    v15 = &v14[4 * v11];
    v16 = &v14[4 * v13];
    bzero(v15, 4 * a2);
    v17 = &v15[4 * a2];
    while (v7 != v8)
    {
      v18 = *((_DWORD *)v7 - 1);
      v7 -= 4;
      *((_DWORD *)v15 - 1) = v18;
      v15 -= 4;
    }
    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8)
      operator delete(v8);
  }
}

uint64_t _ZNSt3__16vectorIN4abpk5HumanENS_9allocatorIS2_EEE24__emplace_back_slow_pathIJNS0_IDv2_fNS3_IS7_EEEENS0_IfNS3_IfEEEEEEEPS2_DpOT_(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  void *v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t *v16;

  v4 = 0xEEEEEEEEEEEEEEEFLL * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if (v4 + 1 > 0x222222222222222)
    std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
  if (0xDDDDDDDDDDDDDDDELL * ((a1[2] - *a1) >> 3) > v5)
    v5 = 0xDDDDDDDDDDDDDDDELL * ((a1[2] - *a1) >> 3);
  if (0xEEEEEEEEEEEEEEEFLL * ((a1[2] - *a1) >> 3) >= 0x111111111111111)
    v8 = 0x222222222222222;
  else
    v8 = v5;
  v16 = a1 + 2;
  if (v8)
    v9 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::Human>>((uint64_t)(a1 + 2), v8);
  else
    v9 = 0;
  v12 = v9;
  v13 = &v9[120 * v4];
  v15 = &v9[120 * v8];
  _ZNSt3__19allocatorIN4abpk5HumanEE9constructB8ne180100IS2_JNS_6vectorIDv2_fNS0_IS6_EEEENS5_IfNS0_IfEEEEEEEvPT_DpOT0_((uint64_t)(a1 + 2), (uint64_t)v13, a2, a3);
  v14 = v13 + 120;
  std::vector<abpk::Human>::__swap_out_circular_buffer(a1, &v12);
  v10 = a1[1];
  std::__split_buffer<abpk::Human>::~__split_buffer(&v12);
  return v10;
}

void sub_210851BAC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<abpk::Human>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

void _ZNSt3__19allocatorIN4abpk5HumanEE9constructB8ne180100IS2_JNS_6vectorIDv2_fNS0_IS6_EEEENS5_IfNS0_IfEEEEEEEvPT_DpOT0_(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *__p[2];
  uint64_t v5;
  void *v6[2];
  uint64_t v7;

  *(_OWORD *)v6 = *(_OWORD *)a3;
  v7 = *(_QWORD *)(a3 + 16);
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  *(_QWORD *)a3 = 0;
  *(_OWORD *)__p = *(_OWORD *)a4;
  v5 = *(_QWORD *)(a4 + 16);
  *(_QWORD *)(a4 + 8) = 0;
  *(_QWORD *)(a4 + 16) = 0;
  *(_QWORD *)a4 = 0;
  abpk::Human::Human(a2, v6, __p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v6[0])
  {
    v6[1] = v6[0];
    operator delete(v6[0]);
  }
}

void sub_210851C40(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14)
{
  if (__p)
    operator delete(__p);
  if (a13)
    operator delete(a13);
  _Unwind_Resume(exception_object);
}

uint64_t std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<abpk::HeatmapPersonData *,abpk::HeatmapPersonData *,abpk::HeatmapPersonData *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;

  v5 = a2;
  if (a2 == a3)
    return a2;
  v6 = a3;
  do
  {
    std::vector<float>::__move_assign(a4, (__n128 *)v5);
    std::vector<float>::__move_assign(a4 + 24, (__n128 *)(v5 + 24));
    *(_QWORD *)(a4 + 48) = *(_QWORD *)(v5 + 48);
    a4 += 56;
    v5 += 56;
  }
  while (v5 != v6);
  return v6;
}

void sub_210852138(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210852714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void **a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  void *v23;
  void *v24;
  void *v25;

  a19 = (void **)&a23;
  std::vector<abpk::Human>::__destroy_vector::operator()[abi:ne180100](&a19);

  _Unwind_Resume(a1);
}

void sub_210852844(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_210852934(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2108529F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_210852A9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_210852B2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_210852C80(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210852D98(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void std::vector<abpk::Human>::__vdeallocate(void **a1)
{
  void *v1;
  uint64_t v3;
  void *v4;

  v1 = *a1;
  if (*a1)
  {
    v3 = (uint64_t)a1[1];
    v4 = *a1;
    if ((void *)v3 != v1)
    {
      do
      {
        v3 -= 120;
        std::allocator<abpk::Human>::destroy[abi:ne180100]((uint64_t)(a1 + 2), v3);
      }
      while ((void *)v3 != v1);
      v4 = *a1;
    }
    a1[1] = v1;
    operator delete(v4);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

void sub_2108535D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21085368C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_210853734(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2108537D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210853874(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210853914(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2108539B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210853A4C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210853AD8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210853B64(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210853DB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

_QWORD *_ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<unsigned long>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_210853EC4(_Unwind_Exception *exception_object)
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

float64x2_t btr::ProjectPoints@<Q0>(double **a1@<X0>, uint64_t a2@<X1>, float64x2_t **a3@<X8>)
{
  float64x2_t result;
  double *v6;
  double *v7;
  float64x2_t *v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v13;
  uint64_t v14;
  _QWORD v15[2];
  double *v16[2];
  __int128 v17;
  uint64_t v18;
  float64x2_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  std::vector<cva::Matrix<double,2u,1u,false>>::vector(a3, 0xAAAAAAAAAAAAAAABLL * (a1[1] - *a1));
  v6 = *a1;
  v7 = a1[1];
  if (*a1 != v7)
  {
    v8 = *a3;
    v9 = a2 + 168;
    do
    {
      v15[0] = a2 + 72;
      v15[1] = 4;
      v16[0] = (double *)v15;
      v16[1] = v6;
      v20 = 0;
      v21 = 0;
      v19.f64[1] = 0.0;
      cva::assign<false,false,cva::Matrix<double,3u,1u,false>,cva::MatrixRef<double const,3u,3u,false>,cva::Matrix<double,3u,1u,false>>((uint64_t)&v19.f64[1], v16);
      v13 = 0uLL;
      v14 = 0;
      if ((__int128 *)(a2 + 72) == &v13)
      {
        v11 = 0;
        v17 = 0uLL;
        v18 = 0;
        do
        {
          *(double *)((char *)&v17 + v11 * 8) = v19.f64[v11 + 1] + *(double *)(v9 + v11 * 8);
          ++v11;
        }
        while (v11 != 3);
        v13 = v17;
        v14 = v18;
      }
      else
      {
        for (i = 0; i != 3; ++i)
          *(double *)((char *)&v13 + i * 8) = v19.f64[i + 1] + *(double *)(v9 + i * 8);
      }
      *(_QWORD *)&v17 = a2;
      *((_QWORD *)&v17 + 1) = &v13;
      v20 = 0;
      v19 = 0uLL;
      cva::assign<false,false,cva::Matrix<double,3u,1u,false>,cva::Matrix<double,3u,3u,false>,cva::Matrix<double,3u,1u,false>>((uint64_t)&v19, (uint64_t *)&v17);
      result = vdivq_f64(v19, (float64x2_t)vdupq_lane_s64(v20, 0));
      *v8++ = result;
      v6 += 3;
    }
    while (v6 != v7);
  }
  return result;
}

void sub_21085406C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  void *v11;

  v11 = *(void **)a10;
  if (*(_QWORD *)a10)
  {
    *(_QWORD *)(a10 + 8) = v11;
    operator delete(v11);
  }
  _Unwind_Resume(exception_object);
}

double btr::ComputeReprojectionAvg(btr *this, const CameraPoseInfo *a2, const Correspondences2d3d *a3)
{
  double v4;
  uint64_t v5;
  unint64_t v6;
  int v7;
  uint64_t v8;
  double *v9;
  double *v10;
  double v11;
  double v12;
  void *__p[3];

  btr::ProjectPoints((double **)&a2->camera_matrix.m_data[3], (uint64_t)this, (float64x2_t **)__p);
  v4 = a2->camera_matrix.m_data[0];
  v5 = *(_QWORD *)&a2->camera_matrix.m_data[1] - *(_QWORD *)&a2->camera_matrix.m_data[0];
  v6 = v5 >> 4;
  v7 = 0;
  if (!v5)
  {
    v11 = 0.0;
    if (!__p[0])
      return v11 / (double)(v6 - v7);
    goto LABEL_12;
  }
  if (v6 <= 1)
    v8 = 1;
  else
    v8 = v5 >> 4;
  v9 = (double *)(*(_QWORD *)&v4 + 8);
  v10 = (double *)((char *)__p[0] + 8);
  v11 = 0.0;
  do
  {
    v12 = *(v9 - 1);
    if (v12 <= 0.0 || *v9 <= 0.0)
      ++v7;
    else
      v11 = v11 + sqrt((v12 - *(v10 - 1)) * (v12 - *(v10 - 1)) + (*v9 - *v10) * (*v9 - *v10));
    v9 += 2;
    v10 += 2;
    --v8;
  }
  while (v8);
  if (__p[0])
  {
LABEL_12:
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return v11 / (double)(v6 - v7);
}

double btr::ComputeTotalBoneLength(uint64_t *a1)
{
  uint64_t v1;
  double result;
  int *v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  float64x2_t v8;
  float64x2_t v9;

  v1 = *a1;
  result = 0.0;
  if (a1[1] - *a1 == 384)
  {
    v3 = &btr::kBonesVertices;
    do
    {
      v4 = *v3;
      v5 = v3[1];
      v3 += 2;
      v6 = v1 + 24 * v4;
      v7 = v1 + 24 * v5;
      v8 = vsubq_f64(*(float64x2_t *)(v6 + 8), *(float64x2_t *)(v7 + 8));
      v9 = vmulq_f64(v8, v8);
      result = result + sqrt((*(double *)v6 - *(double *)v7) * (*(double *)v6 - *(double *)v7) + v9.f64[0] + v9.f64[1]);
    }
    while (v3 != (int *)&xmmword_210881BD8);
  }
  return result;
}

void btr::BodyRegistration::RegisterBody(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, float32x2_t *a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  void **v12;
  int v13;
  char **v17;
  uint64_t v18;
  _QWORD *v19;
  float64x2_t *v20;
  float64x2_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  float64x2_t *v27;
  float64x2_t *v28;
  float64x2_t *v29;
  unint64_t v30;
  _QWORD *v31;
  float64x2_t *v32;
  unint64_t v33;
  float32x2_t *v34;
  double v35;
  float64x2_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  char *v40;
  char *v41;
  char *v42;
  char *v43;
  char *v44;
  __int128 v45;
  _OWORD *v46;
  CameraPoseInfo *v47;
  uint64_t v48;
  NSObject *v49;
  const Correspondences2d3d *v50;
  NSObject *v51;
  const char *v52;
  uint8_t *v53;
  NSObject *v54;
  os_log_type_t v55;
  NSObject *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  double v65;
  double v66;
  double v67;
  int v68;
  NSObject *v69;
  const Correspondences2d3d *v70;
  int v71;
  NSObject *v72;
  NSObject *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 *v82;
  __int128 *v83;
  _OWORD *v84;
  void **v85;
  _OWORD *v86;
  uint64_t v88;
  float64x2_t v90;
  float64x2_t v91;
  __int16 v92;
  uint8_t v93[16];
  uint8_t v94[16];
  uint8_t buf[16];
  uint8_t v96[16];
  uint8_t v97[2];

  *(_OWORD *)(a9 + 152) = xmmword_210881C80;
  *(_OWORD *)(a9 + 168) = unk_210881C90;
  *(_OWORD *)(a9 + 184) = xmmword_210881CA0;
  *(_OWORD *)(a9 + 200) = unk_210881CB0;
  *(_OWORD *)(a9 + 88) = xmmword_210881C40;
  *(_OWORD *)(a9 + 104) = *(_OWORD *)algn_210881C50;
  *(_OWORD *)(a9 + 120) = xmmword_210881C60;
  *(_OWORD *)(a9 + 16) = 0u;
  v10 = a9 + 16;
  *(_DWORD *)a9 = 5;
  *(_OWORD *)(a9 + 32) = 0u;
  *(_OWORD *)(a9 + 48) = 0u;
  *(_OWORD *)(a9 + 64) = 0u;
  *(_QWORD *)(a9 + 80) = 0;
  *(_OWORD *)(a9 + 136) = unk_210881C70;
  *(_OWORD *)(a9 + 224) = 0u;
  v11 = a9 + 224;
  *(_OWORD *)(a9 + 288) = 0u;
  v12 = (void **)(a9 + 288);
  *(_OWORD *)(a9 + 304) = 0u;
  *(_OWORD *)(a9 + 320) = 0u;
  *(_OWORD *)(a9 + 256) = 0u;
  *(_OWORD *)(a9 + 272) = 0u;
  v13 = 1;
  *(_OWORD *)(v11 + 16) = 0u;
  if (!a2 || !a4 || !a6 || (v13 = 2, !a3) || !a5 || !a7)
  {
    *(_DWORD *)a9 = v13;
    *(_DWORD *)a1 = v13;
    v51 = __ABPKLogSharedInstance();
    if (!os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      return;
    *(_WORD *)v97 = 0;
    v52 = " Failed to find 2d-3d correspondences ";
    v53 = v97;
    v54 = v51;
    v55 = OS_LOG_TYPE_ERROR;
    goto LABEL_52;
  }
  v88 = v10;
  std::vector<cva::Matrix<double,2u,1u,false>>::reserve(v12, a3);
  v17 = (char **)(v11 + 88);
  std::vector<cva::Matrix<double,3u,1u,false>>::reserve((void **)(v11 + 88), a3);
  v86 = (_OWORD *)v11;
  v18 = 0;
  v84 = (_OWORD *)(a9 + 88);
  v19 = (_QWORD *)(a9 + 304);
  v20 = *(float64x2_t **)(a9 + 296);
  do
  {
    v21 = vcvtq_f64_f32(*(float32x2_t *)(a2 + 8 * v18));
    if ((unint64_t)v20 >= *v19)
    {
      v90 = v21;
      v22 = ((char *)v20 - (_BYTE *)*v12) >> 4;
      if ((unint64_t)(v22 + 1) >> 60)
        std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
      v23 = *v19 - (_QWORD)*v12;
      v24 = v23 >> 3;
      if (v23 >> 3 <= (unint64_t)(v22 + 1))
        v24 = v22 + 1;
      if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFF0)
        v25 = 0xFFFFFFFFFFFFFFFLL;
      else
        v25 = v24;
      if (v25)
        v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::peak>>(a9 + 304, v25);
      else
        v26 = 0;
      v27 = (float64x2_t *)&v26[16 * v22];
      *v27 = v90;
      v20 = v27 + 1;
      v29 = *(float64x2_t **)(a9 + 288);
      v28 = *(float64x2_t **)(a9 + 296);
      if (v28 != v29)
      {
        do
        {
          v27[-1] = v28[-1];
          --v27;
          --v28;
        }
        while (v28 != v29);
        v28 = (float64x2_t *)*v12;
      }
      *(_QWORD *)(a9 + 288) = v27;
      *(_QWORD *)(a9 + 296) = v20;
      *(_QWORD *)(a9 + 304) = &v26[16 * v25];
      if (v28)
        operator delete(v28);
    }
    else
    {
      *v20++ = v21;
    }
    *(_QWORD *)(a9 + 296) = v20;
    ++v18;
  }
  while (v18 != a3);
  v85 = v12;
  v30 = 0;
  v31 = (_QWORD *)(a9 + 328);
  v32 = *(float64x2_t **)(a9 + 320);
  do
  {
    if (v30 <= 6)
      v33 = v30;
    else
      v33 = v30 + 1;
    v34 = (float32x2_t *)(a4 + 16 * v33);
    v35 = v34[1].f32[0];
    v36 = vcvtq_f64_f32(*v34);
    if ((unint64_t)v32 >= *v31)
    {
      v91 = v36;
      v37 = 0xAAAAAAAAAAAAAAABLL * (((char *)v32 - *v17) >> 3);
      v38 = v37 + 1;
      if (v37 + 1 > 0xAAAAAAAAAAAAAAALL)
        std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
      if (0x5555555555555556 * ((uint64_t)(*v31 - (_QWORD)*v17) >> 3) > v38)
        v38 = 0x5555555555555556 * ((uint64_t)(*v31 - (_QWORD)*v17) >> 3);
      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*v31 - (_QWORD)*v17) >> 3) >= 0x555555555555555)
        v39 = 0xAAAAAAAAAAAAAAALL;
      else
        v39 = v38;
      if (v39)
        v40 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<float>>>(a9 + 328, v39);
      else
        v40 = 0;
      v41 = &v40[24 * v37];
      *(float64x2_t *)v41 = v91;
      *((double *)v41 + 2) = v35;
      v43 = *(char **)(a9 + 312);
      v42 = *(char **)(a9 + 320);
      v44 = v41;
      if (v42 != v43)
      {
        do
        {
          v45 = *(_OWORD *)(v42 - 24);
          *((_QWORD *)v44 - 1) = *((_QWORD *)v42 - 1);
          *(_OWORD *)(v44 - 24) = v45;
          v44 -= 24;
          v42 -= 24;
        }
        while (v42 != v43);
        v42 = *v17;
      }
      v32 = (float64x2_t *)(v41 + 24);
      *(_QWORD *)(a9 + 312) = v44;
      *(_QWORD *)(a9 + 320) = v41 + 24;
      *(_QWORD *)(a9 + 328) = &v40[24 * v39];
      if (v42)
        operator delete(v42);
    }
    else
    {
      *v32 = v36;
      v32[1].f64[0] = v35;
      v32 = (float64x2_t *)((char *)v32 + 24);
    }
    *(_QWORD *)(a9 + 320) = v32;
    ++v30;
  }
  while (v30 != a3);
  *(_DWORD *)a9 = 0;
  if (*(_DWORD *)a1)
  {
    v47 = (CameraPoseInfo *)v85;
    v46 = v86;
    v48 = v88;
    v49 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210836000, v49, OS_LOG_TYPE_DEBUG, " Previous body-camera registration failed. Reinitializing.. ", buf, 2u);
    }
    *(_QWORD *)(a9 + 200) = 0x3FF0000000000000;
  }
  else
  {
    v47 = (CameraPoseInfo *)v85;
    v46 = v86;
    v48 = v88;
    v56 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v96 = 0;
      _os_log_impl(&dword_210836000, v56, OS_LOG_TYPE_DEBUG, " Previous body-camera registration successful. Initializing with previos pose.. ", v96, 2u);
    }
    if (a9 != a1)
    {
      v57 = *(_OWORD *)(a1 + 64);
      *(_OWORD *)(v88 + 32) = *(_OWORD *)(a1 + 48);
      *(_OWORD *)(v88 + 48) = v57;
      *(_QWORD *)(v88 + 64) = *(_QWORD *)(a1 + 80);
      v58 = *(_OWORD *)(a1 + 32);
      *(_OWORD *)v88 = *(_OWORD *)(a1 + 16);
      *(_OWORD *)(v88 + 16) = v58;
      v59 = *(_OWORD *)(a1 + 168);
      *(_OWORD *)(a9 + 152) = *(_OWORD *)(a1 + 152);
      *(_OWORD *)(a9 + 168) = v59;
      v60 = *(_OWORD *)(a1 + 200);
      *(_OWORD *)(a9 + 184) = *(_OWORD *)(a1 + 184);
      *(_OWORD *)(a9 + 200) = v60;
      v61 = *(_OWORD *)(a1 + 104);
      *v84 = *(_OWORD *)(a1 + 88);
      *(_OWORD *)(a9 + 104) = v61;
      v62 = *(_OWORD *)(a1 + 136);
      *(_OWORD *)(a9 + 120) = *(_OWORD *)(a1 + 120);
      *(_OWORD *)(a9 + 136) = v62;
    }
    v63 = *(_OWORD *)(a1 + 240);
    *v86 = *(_OWORD *)(a1 + 224);
    v86[1] = v63;
    v64 = *(_OWORD *)(a1 + 272);
    v86[2] = *(_OWORD *)(a1 + 256);
    v86[3] = v64;
  }
  v65 = a8[1].f32[0];
  v66 = a8[3].f32[0];
  v67 = a8[5].f32[0];
  *(float64x2_t *)(a9 + 16) = vcvtq_f64_f32(*a8);
  *(double *)(a9 + 32) = v65;
  *(float64x2_t *)(a9 + 40) = vcvtq_f64_f32(a8[2]);
  *(double *)(a9 + 56) = v66;
  *(float64x2_t *)(a9 + 64) = vcvtq_f64_f32(a8[4]);
  *(double *)(a9 + 80) = v67;
  *(_DWORD *)a9 = v68;
  if (!v68)
    goto LABEL_65;
  v69 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v94 = 0;
    _os_log_impl(&dword_210836000, v69, OS_LOG_TYPE_DEBUG, " Trying with a different init pose ", v94, 2u);
  }
  *(_QWORD *)(a9 + 200) = 0x3FE0000000000000;
  *(_DWORD *)a9 = v71;
  if (v71)
  {
    *(_DWORD *)a1 = v71;
    v72 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
    {
      v92 = 0;
      v52 = " Registration Failed with a different init pose ";
      v53 = (uint8_t *)&v92;
      v54 = v72;
      v55 = OS_LOG_TYPE_DEBUG;
LABEL_52:
      _os_log_impl(&dword_210836000, v54, v55, v52, v53, 2u);
    }
  }
  else
  {
LABEL_65:
    v73 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v93 = 0;
      _os_log_impl(&dword_210836000, v73, OS_LOG_TYPE_DEBUG, " Registration successful ", v93, 2u);
    }
    *(_DWORD *)a1 = *(_DWORD *)a9;
    if (a1 != a9)
    {
      v74 = *(_OWORD *)(v48 + 48);
      *(_OWORD *)(a1 + 48) = *(_OWORD *)(v48 + 32);
      *(_OWORD *)(a1 + 64) = v74;
      *(_QWORD *)(a1 + 80) = *(_QWORD *)(v48 + 64);
      v75 = *(_OWORD *)(v48 + 16);
      *(_OWORD *)(a1 + 16) = *(_OWORD *)v48;
      *(_OWORD *)(a1 + 32) = v75;
      v76 = *(_OWORD *)(a9 + 168);
      *(_OWORD *)(a1 + 152) = *(_OWORD *)(a9 + 152);
      *(_OWORD *)(a1 + 168) = v76;
      v77 = *(_OWORD *)(a9 + 200);
      *(_OWORD *)(a1 + 184) = *(_OWORD *)(a9 + 184);
      *(_OWORD *)(a1 + 200) = v77;
      v78 = *(_OWORD *)(a9 + 104);
      *(_OWORD *)(a1 + 88) = *v84;
      *(_OWORD *)(a1 + 104) = v78;
      v79 = *(_OWORD *)(a9 + 136);
      *(_OWORD *)(a1 + 120) = *(_OWORD *)(a9 + 120);
      *(_OWORD *)(a1 + 136) = v79;
      v80 = v46[3];
      *(_OWORD *)(a1 + 256) = v46[2];
      *(_OWORD *)(a1 + 272) = v80;
      v81 = v46[1];
      v82 = *(__int128 **)(a9 + 288);
      v83 = *(__int128 **)(a9 + 296);
      *(_OWORD *)(a1 + 224) = *v46;
      *(_OWORD *)(a1 + 240) = v81;
      std::vector<cva::Matrix<double,2u,1u,false>>::__assign_with_size[abi:ne180100]<cva::Matrix<double,2u,1u,false>*,cva::Matrix<double,2u,1u,false>*>((__int128 **)(a1 + 288), v82, v83, v83 - v82);
      std::vector<cva::Matrix<double,3u,1u,false>>::__assign_with_size[abi:ne180100]<cva::Matrix<double,3u,1u,false>*,cva::Matrix<double,3u,1u,false>*>((_QWORD *)(a1 + 312), *(_QWORD **)(a9 + 312), *(_QWORD **)(a9 + 320), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a9 + 320) - *(_QWORD *)(a9 + 312)) >> 3));
    }
  }
}

void sub_21085484C(_Unwind_Exception *a1)
{
  btr::BodyRegistrationInfo *v1;

  btr::BodyRegistrationInfo::~BodyRegistrationInfo(v1);
  _Unwind_Resume(a1);
}

uint64_t btr::`anonymous namespace'::EstimatePoseFromCorrespondences(btr::_anonymous_namespace_ *this, CameraPoseInfo *a2, const Correspondences2d3d *a3)
{
  unint64_t v5;
  int v6;
  uint64_t v7;
  double *v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  unint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  __int128 *v18;
  __int128 v19;
  char *v20;
  NSObject *v21;
  int v22;
  __int128 v23;
  unsigned int v24;
  __int128 v25;
  unsigned int v26;
  __int128 v27;
  unsigned int v28;
  __int128 v29;
  unsigned int v30;
  uint64_t v32;
  uint8_t buf[8];
  __int128 v34;
  int v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62[5];

  v5 = (uint64_t)(*(_QWORD *)&a2->camera_matrix.m_data[1] - *(_QWORD *)&a2->camera_matrix.m_data[0]) >> 4;
  v6 = 0;
  if (*(_QWORD *)&a2->camera_matrix.m_data[1] != *(_QWORD *)&a2->camera_matrix.m_data[0])
  {
    if (v5 <= 1)
      v7 = 1;
    else
      v7 = (uint64_t)(*(_QWORD *)&a2->camera_matrix.m_data[1] - *(_QWORD *)&a2->camera_matrix.m_data[0]) >> 4;
    v8 = (double *)(*(_QWORD *)&a2->camera_matrix.m_data[0] + 8);
    do
    {
      if (*(v8 - 1) <= 0.0 || *v8 <= 0.0)
        ++v6;
      v8 += 2;
      --v7;
    }
    while (v7);
  }
  std::vector<std::pair<cva::Matrix<double,3u,1u,false>,cva::Matrix<double,2u,1u,false>>>::vector(v62, v5 - v6);
  v9 = a2->camera_matrix.m_data[0];
  if (*(_QWORD *)&a2->camera_matrix.m_data[1] != *(_QWORD *)&a2->camera_matrix.m_data[0])
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    do
    {
      v14 = *(double *)(*(_QWORD *)&v9 + v11);
      if (v14 <= 0.0 || (v15 = *(double *)(*(_QWORD *)&v9 + v11 + 8), v15 <= 0.0))
      {
        v21 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_210836000, v21, OS_LOG_TYPE_DEBUG, " ABPKRegistrationUtils: Skipping because of invisible joints ", buf, 2u);
        }
      }
      else
      {
        v16 = (v14 - *((double *)this + 6)) / *(double *)this;
        v17 = (v15 - *((double *)this + 7)) / *((double *)this + 4);
        v18 = (__int128 *)(*(_QWORD *)&a2->camera_matrix.m_data[3] + v10);
        v19 = *v18;
        v20 = (char *)v62[0] + 40 * v12;
        *((_QWORD *)v20 + 2) = *((_QWORD *)v18 + 2);
        *(_OWORD *)v20 = v19;
        ++v12;
        *((double *)v20 + 3) = v16;
        *((double *)v20 + 4) = v17;
      }
      ++v13;
      v9 = a2->camera_matrix.m_data[0];
      v11 += 16;
      v10 += 24;
    }
    while (v13 < (uint64_t)(*(_QWORD *)&a2->camera_matrix.m_data[1] - *(_QWORD *)&a2->camera_matrix.m_data[0]) >> 4);
  }
  *(_QWORD *)buf = 0x6400000000;
  v34 = xmmword_210881B50;
  v35 = 3;
  v60 = 0;
  v61 = 0;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v59 = 0;
  v58 = 0;
  v32 = 0;
  v22 = cva::PoseRefiner<double>::refinePose((uint64_t)buf, (uint64_t *)v62, (uint64_t)this + 72, (double *)&v32);
  *(float32x2_t *)&v23 = vcvt_f32_f64(*(float64x2_t *)((char *)this + 72));
  *(float *)&v24 = *((double *)this + 11);
  *((_QWORD *)&v23 + 1) = v24;
  *(float32x2_t *)&v25 = vcvt_f32_f64(*(float64x2_t *)((char *)this + 104));
  *(float *)&v26 = *((double *)this + 15);
  *((_QWORD *)&v25 + 1) = v26;
  *(float32x2_t *)&v27 = vcvt_f32_f64(*(float64x2_t *)((char *)this + 136));
  *(float *)&v28 = *((double *)this + 19);
  *((_QWORD *)&v27 + 1) = v28;
  *(float32x2_t *)&v29 = vcvt_f32_f64(*(float64x2_t *)((char *)this + 168));
  *(float *)&v30 = *((double *)this + 23);
  *((_QWORD *)&v29 + 1) = __PAIR64__(1.0, v30);
  *((_OWORD *)this + 13) = v23;
  *((_OWORD *)this + 14) = v25;
  *((_OWORD *)this + 15) = v27;
  *((_OWORD *)this + 16) = v29;
  cva::PoseRefiner<double>::~PoseRefiner(buf);
  if (v62[0])
  {
    v62[1] = v62[0];
    operator delete(v62[0]);
  }
  if (v22)
    return 0;
  else
    return 4;
}

void sub_210854B64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  uint64_t v11;
  void *v13;

  v13 = *(void **)(v11 - 120);
  if (v13)
  {
    *(_QWORD *)(v11 - 112) = v13;
    operator delete(v13);
  }
  _Unwind_Resume(exception_object);
}

void btr::BodyRegistrationInfo::~BodyRegistrationInfo(btr::BodyRegistrationInfo *this)
{
  void *v2;
  void *v3;

  v2 = (void *)*((_QWORD *)this + 39);
  if (v2)
  {
    *((_QWORD *)this + 40) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((_QWORD *)this + 36);
  if (v3)
  {
    *((_QWORD *)this + 37) = v3;
    operator delete(v3);
  }
}

void std::vector<cva::Matrix<double,2u,1u,false>>::reserve(void **a1, unint64_t a2)
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

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 4)
  {
    if (a2 >> 60)
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::peak>>(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF0];
    v9 = &v6[16 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        *((_OWORD *)v12 - 1) = *((_OWORD *)v10 - 1);
        v12 -= 16;
        v10 -= 16;
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

void std::vector<cva::Matrix<double,3u,1u,false>>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
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
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - (_BYTE *)*a1) >> 3) < a2)
  {
    if (a2 >= 0xAAAAAAAAAAAAAABLL)
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    v5 = ((_BYTE *)a1[1] - (_BYTE *)*a1) / 24;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<float>>>(v3, a2);
    v7 = &v6[24 * v5];
    v9 = &v6[24 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        v13 = *(_OWORD *)(v10 - 24);
        *((_QWORD *)v12 - 1) = *((_QWORD *)v10 - 1);
        *(_OWORD *)(v12 - 24) = v13;
        v12 -= 24;
        v10 -= 24;
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

uint64_t cva::PoseRefiner<double>::refinePose(uint64_t a1, uint64_t *a2, uint64_t a3, double *a4)
{
  double **v8;
  unint64_t v9;
  uint64_t *v10;
  int i;
  unint64_t v12;
  _BOOL8 v13;
  double v14;
  __int128 v15;
  double *v16;
  double *v17;
  double *v18;
  uint64_t v19;
  double v20;
  double v21;
  double *v22;
  double v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  float64x2_t v27;
  double v28;
  double v29;
  double v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  double v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t *v41;
  double v42;
  _OWORD v43[8];
  __int128 v44;
  double v45;
  _BYTE __dst[288];
  _BYTE v47[48];
  float64x2_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  double v56;
  double v57;
  double v58;
  double v59[5];

  v8 = (double **)(a1 + 400);
  v9 = 0xCCCCCCCCCCCCCCCDLL * ((a2[1] - *a2) >> 3);
  v41 = a2;
  if (v9 > (uint64_t)(*(_QWORD *)(a1 + 408) - *(_QWORD *)(a1 + 400)) >> 3)
  {
    std::vector<double>::resize(a1 + 400, v9);
    v9 = 0xCCCCCCCCCCCCCCCDLL * ((a2[1] - *a2) >> 3);
  }
  if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(_QWORD *)(a1 + 40) - *(_QWORD *)(a1 + 32)) >> 4) < v9)
    std::vector<cva::PoseRefiner<double>::projData,std::allocator<cva::PoseRefiner<double>::projData>>::resize((uint64_t *)(a1 + 32), v9);
  v10 = a2;
  if (*(int *)(a1 + 4) < 1)
    return 1;
  for (i = 0; i < *(_DWORD *)(a1 + 4); ++i)
  {
    cva::PoseRefiner<double>::computeError(a1, v10, a3);
    v12 = *(unsigned int *)(a1 + 392);
    v13 = v12 > 4;
    if (v12 < 5)
      break;
    v14 = 0.0;
    v15 = 0uLL;
    if (*(_DWORD *)a1 == 1)
    {
      v16 = a4;
      v17 = *v8;
      v18 = *v8;
      v19 = *(unsigned int *)(a1 + 392);
      do
      {
        v20 = *v18;
        if (*v18 < 0.0)
          v20 = -*v18;
        *v18++ = v20;
        --v19;
      }
      while (v19);
      v21 = std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>(v17, &v17[v12 >> 1], &v17[v12], v20);
      v22 = *v8;
      v23 = (*v8)[v12 >> 1];
      if ((v12 & 1) != 0)
      {
        v15 = 0uLL;
      }
      else
      {
        v24 = (v12 >> 1) - 1;
        if (v24 != v12)
        {
          std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>(v22, &v22[v24], &v22[v12], v21);
          v22 = *v8;
        }
        v15 = 0uLL;
        v23 = (v23 + v22[v24]) * 0.5;
      }
      v14 = v23 * 3.0;
      a4 = v16;
      v10 = v41;
      if (v23 * 3.0 < 1.0e-10)
        v14 = 1.0e-10;
    }
    *(_OWORD *)(a1 + 360) = v15;
    *(_OWORD *)(a1 + 376) = v15;
    *(_OWORD *)(a1 + 328) = v15;
    *(_OWORD *)(a1 + 344) = v15;
    *(_OWORD *)(a1 + 296) = v15;
    *(_OWORD *)(a1 + 312) = v15;
    *(_OWORD *)(a1 + 264) = v15;
    *(_OWORD *)(a1 + 280) = v15;
    *(_OWORD *)(a1 + 232) = v15;
    *(_OWORD *)(a1 + 248) = v15;
    *(_OWORD *)(a1 + 200) = v15;
    *(_OWORD *)(a1 + 216) = v15;
    *(_OWORD *)(a1 + 168) = v15;
    *(_OWORD *)(a1 + 184) = v15;
    *(_OWORD *)(a1 + 136) = v15;
    *(_OWORD *)(a1 + 152) = v15;
    *(_OWORD *)(a1 + 104) = v15;
    *(_OWORD *)(a1 + 120) = v15;
    *(_OWORD *)(a1 + 72) = v15;
    *(_OWORD *)(a1 + 88) = v15;
    *(_OWORD *)(a1 + 56) = v15;
    cva::PoseRefiner<double>::accumuateJacobian(a1, a4, v14);
    v25 = *(_OWORD *)(a1 + 360);
    *(_OWORD *)v47 = *(_OWORD *)(a1 + 344);
    *(_OWORD *)&v47[16] = v25;
    *(_OWORD *)&v47[32] = *(_OWORD *)(a1 + 376);
    memcpy(__dst, (const void *)(a1 + 56), sizeof(__dst));
    if (!cva::ldlt<double,6u,1u>())
      return 0;
    v26 = *(_OWORD *)v47;
    v42 = *(double *)&v47[16];
    v44 = *(_OWORD *)&v47[24];
    v45 = *(double *)&v47[40];
    v48 = (float64x2_t)xmmword_210881BD8;
    v49 = unk_210881BE8;
    v50 = xmmword_210881BF8;
    v51 = unk_210881C08;
    *(_QWORD *)&v52 = 0x3FF0000000000000;
    v27 = vmulq_f64(*(float64x2_t *)&v47[8], *(float64x2_t *)&v47[8]);
    cva::ExponentialCoefficients<double,3>::ExponentialCoefficients(&v56, *(double *)&v26 * *(double *)&v26 + v27.f64[0] + v27.f64[1]);
    *(double *)&v52 = v56 + v58 * v42 * v42;
    v28 = *(double *)&v26 * v58 * *((double *)&v26 + 1);
    v29 = *(double *)&v26 * v58 * v42;
    v30 = v58 * *((double *)&v26 + 1) * v42;
    v48.f64[0] = v56 + *(double *)&v26 * v58 * *(double *)&v26;
    v48.f64[1] = v28 + v57 * v42;
    *(double *)&v51 = v57 * *((double *)&v26 + 1) + v29;
    *((double *)&v51 + 1) = v30 - *(double *)&v26 * v57;
    *((double *)&v49 + 1) = v28 - v57 * v42;
    *(double *)&v49 = v29 - v57 * *((double *)&v26 + 1);
    *(double *)&v50 = v56 + v58 * *((double *)&v26 + 1) * *((double *)&v26 + 1);
    *((double *)&v50 + 1) = *(double *)&v26 * v57 + v30;
    cva::SE3GroupStorage<double,cva::Matrix<double,4u,4u,false>>::SE3GroupStorage(v43, (uint64_t *)&v48, (uint64_t)&v44);
    v56 = COERCE_DOUBLE(v43);
    v57 = *(double *)&a3;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    cva::assign<false,false,cva::Matrix<double,4u,4u,false>,cva::Matrix<double,4u,4u,false>,cva::Matrix<double,4u,4u,false>>(&v48, (float64x2_t **)&v56);
    v31 = v53;
    *(_OWORD *)(a3 + 64) = v52;
    *(_OWORD *)(a3 + 80) = v31;
    v32 = v55;
    *(_OWORD *)(a3 + 96) = v54;
    *(_OWORD *)(a3 + 112) = v32;
    v33 = v49;
    *(float64x2_t *)a3 = v48;
    *(_OWORD *)(a3 + 16) = v33;
    v34 = v51;
    *(_OWORD *)(a3 + 32) = v50;
    *(_OWORD *)(a3 + 48) = v34;
    cva::SE3GroupStorage<double,cva::Matrix<double,4u,4u,false>>::log(a3, (uint64_t)&v56);
    v35 = v56 * v56 + v57 * v57 + v58 * v58;
    if (v35 >= 9.8706044)
      cva::PoseRefiner<double>::refinePose();
    v52 = xmmword_210881C80;
    v53 = unk_210881C90;
    v54 = xmmword_210881CA0;
    v55 = unk_210881CB0;
    v48 = (float64x2_t)xmmword_210881C40;
    v49 = *(_OWORD *)algn_210881C50;
    v50 = xmmword_210881C60;
    v51 = unk_210881C70;
    cva::ExponentialCoefficients<double,3>::ExponentialCoefficients(v59, v35);
    cva::computeExponentialMatrix<double,cva::Matrix<double,6u,1u,false>,cva::Matrix<double,4u,4u,false>>((uint64_t *)&v56, v59, (uint64_t)&v48);
    v36 = v53;
    *(_OWORD *)(a3 + 64) = v52;
    *(_OWORD *)(a3 + 80) = v36;
    v37 = v55;
    *(_OWORD *)(a3 + 96) = v54;
    *(_OWORD *)(a3 + 112) = v37;
    v38 = v49;
    *(float64x2_t *)a3 = v48;
    *(_OWORD *)(a3 + 16) = v38;
    v39 = v51;
    *(_OWORD *)(a3 + 32) = v50;
    *(_OWORD *)(a3 + 48) = v39;
    if (i >= *(_DWORD *)(a1 + 24)
      && sqrt(*(double *)&v26 * *(double *)&v26 + *((double *)&v26 + 1) * *((double *)&v26 + 1) + v42 * v42) < *(double *)(a1 + 8)
      && sqrt(*(double *)&v44 * *(double *)&v44 + *((double *)&v44 + 1) * *((double *)&v44 + 1) + v45 * v45) < *(double *)(a1 + 16))
    {
      return 1;
    }
  }
  return v13;
}

_QWORD *std::vector<std::pair<cva::Matrix<double,3u,1u,false>,cva::Matrix<double,2u,1u,false>>>::vector(_QWORD *a1, unint64_t a2)
{
  char *v4;
  size_t v5;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<std::pair<cva::Matrix<double,3u,1u,false>,cva::Matrix<double,2u,1u,false>>>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    v5 = 40 * ((40 * a2 - 40) / 0x28) + 40;
    bzero(v4, v5);
    a1[1] = &v4[v5];
  }
  return a1;
}

void sub_210855270(_Unwind_Exception *exception_object)
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

char *std::vector<std::pair<cva::Matrix<double,3u,1u,false>,cva::Matrix<double,2u,1u,false>>>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0x666666666666667)
    std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<cva::Matrix<double,3u,1u,false>,cva::Matrix<double,2u,1u,false>>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[40 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<cva::Matrix<double,3u,1u,false>,cva::Matrix<double,2u,1u,false>>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(40 * a2);
}

void std::vector<double>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2;

  v2 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3;
  if (a2 <= v2)
  {
    if (a2 < v2)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 8 * a2;
  }
  else
  {
    std::vector<double>::__append((char **)a1, a2 - v2);
  }
}

void std::vector<cva::PoseRefiner<double>::projData,std::allocator<cva::PoseRefiner<double>::projData>>::resize(uint64_t *a1, unint64_t a2)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;

  v2 = 0xCCCCCCCCCCCCCCCDLL * ((a1[1] - *a1) >> 4);
  v3 = a2 >= v2;
  v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    std::vector<cva::PoseRefiner<double>::projData,std::allocator<cva::PoseRefiner<double>::projData>>::__append(a1, v4);
  }
  else if (!v3)
  {
    a1[1] = *a1 + 80 * a2;
  }
}

void cva::PoseRefiner<double>::computeError(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  double v13;
  double v14;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  double *v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  _QWORD v28[2];
  double *v29[3];
  _BYTE v30[40];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)(a1 + 392) = 0;
  v3 = *a2;
  if (a2[1] != *a2)
  {
    v7 = 0;
    v8 = a3 + 96;
    do
    {
      v9 = *(_QWORD *)(a1 + 32);
      v28[0] = a3;
      v28[1] = 4;
      v29[0] = (double *)v28;
      v29[1] = (double *)(v3 + 40 * v7);
      memset(v30, 0, 24);
      cva::assign<false,false,cva::Matrix<double,3u,1u,false>,cva::MatrixRef<double const,3u,3u,false>,cva::Matrix<double,3u,1u,false>>((uint64_t)v30, v29);
      v10 = 0;
      v26 = 0uLL;
      v27 = 0;
      do
      {
        *(double *)((char *)&v26 + v10 * 8) = *(double *)&v29[v10 + 3] + *(double *)(v8 + v10 * 8);
        ++v10;
      }
      while (v10 != 3);
      v11 = 0;
      v12 = v9 + 80 * v7;
      *(_QWORD *)(v12 + 24) = v27;
      *(_OWORD *)(v12 + 8) = v26;
      v13 = *(double *)(v12 + 24);
      if (v13 < 0.0)
        v14 = -1.0e-15;
      else
        v14 = 1.0e-15;
      if (v13 > -1.0e-15 && v13 < 1.0e-15)
        v13 = v14;
      v16 = 1.0 / v13;
      v17 = *(double *)(v12 + 8) * (1.0 / v13);
      v18 = *(double *)(v12 + 16) * (1.0 / v13);
      *(double *)(v12 + 32) = v17;
      *(double *)(v12 + 40) = v18;
      *(double *)(v12 + 48) = v16;
      if (v16 >= 0.0 && v16 <= 1.0e14)
      {
        v19 = v3 + 40 * v7;
        v20 = *(double *)(v19 + 24) - v17;
        v21 = (double *)(v9 + 80 * v7);
        v21[7] = v20;
        v22 = *(double *)(v19 + 32) - v18;
        if (v20 < 0.0)
          v20 = -v20;
        v23 = -v22;
        if (v22 >= 0.0)
          v23 = v22;
        v24 = v20 + v23;
        v21[8] = v22;
        v21[9] = v24;
        v25 = *(unsigned int *)(a1 + 392);
        *(double *)(*(_QWORD *)(a1 + 400) + 8 * v25) = v24;
        *(_DWORD *)(a1 + 392) = v25 + 1;
        v11 = 1;
      }
      *(_BYTE *)v12 = v11;
      ++v7;
      v3 = *a2;
    }
    while (v7 < 0xCCCCCCCCCCCCCCCDLL * ((a2[1] - *a2) >> 3));
  }
}

uint64_t cva::PoseRefiner<double>::accumuateJacobian(uint64_t result, double *a2, double a3)
{
  unint64_t v3;
  unint64_t v4;
  double *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
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
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
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
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;

  *a2 = 0.0;
  v3 = *(unsigned int *)(result + 392);
  if ((_DWORD)v3)
  {
    v4 = 0;
    v58 = a3 * a3;
    v5 = (double *)(*(_QWORD *)(result + 32) + 72);
    v62 = 0.0;
    v63 = 0.0;
    v6 = 0.0;
    v7 = 0.0;
    v8 = 0.0;
    v9 = 0.0;
    v10 = 0.0;
    v11 = 0.0;
    v12 = 0.0;
    v13 = 0.0;
    v14 = 0.0;
    v15 = 0.0;
    v16 = 0.0;
    v17 = 0.0;
    v18 = 0.0;
    v73 = 0.0;
    v74 = 0.0;
    v19 = 0.0;
    v71 = 0.0;
    v72 = 0.0;
    v20 = 0.0;
    v21 = 0.0;
    v22 = 0.0;
    v68 = 0.0;
    v70 = 0.0;
    v65 = 0.0;
    v66 = 0.0;
    v23 = 0.0;
    v64 = 0.0;
    do
    {
      if (*((_BYTE *)v5 - 72))
      {
        ++v4;
        v24 = *v5;
        v25 = 1.0;
        if (*(_DWORD *)result != 1
          || v24 * v24 < v58 && (v25 = (1.0 - v24 * v24 / v58) * (1.0 - v24 * v24 / v58), v25 >= 0.00000001))
        {
          v26 = -v24;
          if (v24 >= 0.0)
            v26 = *v5;
          v61 = v23 + v25 * v26;
          *a2 = v61;
          v27 = *(v5 - 3);
          v28 = *(v5 - 8);
          v29 = *(v5 - 7);
          v30 = v27 * v27 * (v28 * v29);
          v31 = v28 * v28 * (v27 * v27) + 1.0;
          v32 = -(v29 * v29) * (v27 * v27) + -1.0;
          v33 = -(v29 * v27);
          v34 = -(v29 * (v27 * v27));
          v35 = -(v28 * (v27 * v27));
          v36 = -(v30 * v25);
          v37 = v63 - v36 * v30;
          v38 = v6 + v36 * v31;
          v39 = v7 + v36 * v33;
          v60 = v8 + v36 * v27;
          v59 = v9 + v36 * 0.0;
          v40 = v10 + v36 * v35;
          v41 = v62 + v25 * v31 * v31;
          v42 = v11 + v25 * v31 * v33;
          v43 = v12 + v25 * v31 * v27;
          v44 = v13 + v25 * v31 * 0.0;
          v45 = v14 + v25 * v31 * v35;
          v46 = v15 + v25 * v33 * v33;
          v47 = v16 + v25 * v33 * v27;
          v48 = v17 + v25 * v33 * 0.0;
          v49 = v18 + v25 * v33 * v35;
          v50 = v25 * *(v5 - 2);
          v67 = v66 + v50 * v31;
          v69 = v68 + v50 * v33;
          v51 = v22 + v50 * v35;
          v52 = v64 - v50 * v30;
          v53 = v70 + v50 * v27;
          v54 = v71 + v50 * 0.0;
          v55 = v27 * v28;
          v63 = v37 + v25 * v32 * v32;
          v9 = v59 + v25 * v32 * v27;
          v10 = v40 + v25 * v32 * v34;
          v62 = v41 + v25 * v30 * v30;
          v11 = v42 + v25 * v30 * v55;
          v12 = v43 + v25 * v30 * 0.0;
          v13 = v44 + v25 * v30 * v27;
          v14 = v45 + v25 * v30 * v34;
          v15 = v46 + v25 * v55 * v55;
          v16 = v47 + v25 * v55 * 0.0;
          v17 = v48 + v25 * v55 * v27;
          v18 = v49 + v25 * v55 * v34;
          v74 = v74 + v25 * v27 * v27 + v25 * 0.0 * 0.0;
          v73 = v73 + v25 * v27 * 0.0 + v25 * 0.0 * v27;
          v7 = v39 + v25 * v32 * v55;
          v19 = v19 + v25 * v27 * v35 + v25 * 0.0 * v34;
          v6 = v38 + v25 * v32 * v30;
          v8 = v60 + v25 * v32 * 0.0;
          v72 = v72 + v25 * 0.0 * 0.0 + v25 * v27 * v27;
          v20 = v20 + v25 * 0.0 * v35 + v25 * v27 * v34;
          v21 = v21 + v25 * v35 * v35 + v25 * v34 * v34;
          v65 = v65 + v25;
          v56 = v25 * *(v5 - 1);
          v64 = v52 + v56 * v32;
          v66 = v67 + v56 * v30;
          v68 = v69 + v56 * v55;
          v22 = v51 + v56 * v34;
          v23 = v61;
          v70 = v53 + v56 * 0.0;
          v71 = v54 + v56 * v27;
        }
      }
      v5 += 10;
    }
    while (v4 < v3);
  }
  else
  {
    v62 = 0.0;
    v63 = 0.0;
    v6 = 0.0;
    v7 = 0.0;
    v8 = 0.0;
    v9 = 0.0;
    v10 = 0.0;
    v11 = 0.0;
    v12 = 0.0;
    v13 = 0.0;
    v14 = 0.0;
    v15 = 0.0;
    v16 = 0.0;
    v17 = 0.0;
    v18 = 0.0;
    v73 = 0.0;
    v74 = 0.0;
    v19 = 0.0;
    v71 = 0.0;
    v72 = 0.0;
    v20 = 0.0;
    v21 = 0.0;
    v66 = 0.0;
    v68 = 0.0;
    v70 = 0.0;
    v22 = 0.0;
    v64 = 0.0;
    v65 = 0.0;
  }
  *(double *)(result + 56) = v63;
  *(double *)(result + 64) = v6;
  *(double *)(result + 72) = v7;
  *(double *)(result + 80) = v8;
  *(double *)(result + 88) = v9;
  *(double *)(result + 96) = v10;
  *(double *)(result + 104) = v6;
  *(double *)(result + 112) = v62;
  *(double *)(result + 152) = v7;
  *(double *)(result + 160) = v11;
  *(double *)(result + 120) = v11;
  *(double *)(result + 128) = v12;
  *(double *)(result + 200) = v8;
  *(double *)(result + 208) = v12;
  *(double *)(result + 248) = v9;
  *(double *)(result + 256) = v13;
  *(double *)(result + 136) = v13;
  *(double *)(result + 144) = v14;
  *(double *)(result + 296) = v10;
  *(double *)(result + 304) = v14;
  *(double *)(result + 168) = v15;
  *(double *)(result + 176) = v16;
  *(double *)(result + 184) = v17;
  *(double *)(result + 192) = v18;
  *(double *)(result + 216) = v16;
  *(double *)(result + 224) = v74;
  *(double *)(result + 264) = v17;
  *(double *)(result + 272) = v73;
  *(double *)(result + 232) = v73;
  *(double *)(result + 240) = v19;
  *(double *)(result + 312) = v18;
  *(double *)(result + 320) = v19;
  *(double *)(result + 280) = v72;
  *(double *)(result + 288) = v20;
  *(double *)(result + 328) = v20;
  *(double *)(result + 336) = v21;
  *(double *)(result + 344) = v64;
  *(double *)(result + 352) = v66;
  *(double *)(result + 360) = v68;
  *(double *)(result + 368) = v70;
  *(double *)(result + 376) = v71;
  *(double *)(result + 384) = v22;
  if (v65 <= 1.0e-10)
    v57 = 1.79769313e308;
  else
    v57 = *a2 / v65;
  *a2 = v57;
  return result;
}

BOOL cva::ldlt<double,6u,1u>()
{
  cva::Logger *v0;
  _BOOL8 v1;
  void *v3[2];
  int v4;
  uint64_t v5;
  int v6;
  void *v7[2];
  int v8;

  v7[0] = 0;
  v7[1] = 0;
  cva::MatrixData<int,0ul,0ul,false>::allocate(v7, 6);
  v8 = 6;
  v6 = 0;
  v5 = 0;
  cva::vecLib::sysv<double>();
  v3[0] = 0;
  v3[1] = 0;
  cva::MatrixData<double,0ul,0ul,false>::allocate(v3, (int)0.0);
  v4 = (int)0.0;
  v0 = (cva::Logger *)cva::vecLib::sysv<double>();
  if (v6 < 0)
    __assert_rtn("ldlt", "linearalgebra.h", 2235, "(0 <= info) || cva::detail::assertMessage(\"sysv() Linear system failed to be solved!\")");
  if (v6)
  {
    cva::Logger::instance(v0);
    cva::Logger::logInCategory();
  }
  free(v3[0]);
  v1 = v6 == 0;
  free(v7[0]);
  return v1;
}

void sub_210855B1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  uint64_t v13;

  free(*(void **)(v13 - 56));
  _Unwind_Resume(a1);
}

void std::vector<double>::__append(char **a1, unint64_t a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 3)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 8 * a2);
      v7 += 8 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = *a1;
    v9 = v7 - *a1;
    v10 = a2 + (v9 >> 3);
    if (v10 >> 61)
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    v11 = v9 >> 3;
    v12 = v5 - v8;
    if (v12 >> 2 > v10)
      v10 = v12 >> 2;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8)
      v13 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v13 = v10;
    if (v13)
    {
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v4, v13);
      v8 = *a1;
      v7 = a1[1];
    }
    else
    {
      v14 = 0;
    }
    v15 = &v14[8 * v11];
    v16 = &v14[8 * v13];
    bzero(v15, 8 * a2);
    v17 = &v15[8 * a2];
    while (v7 != v8)
    {
      v18 = *((_QWORD *)v7 - 1);
      v7 -= 8;
      *((_QWORD *)v15 - 1) = v18;
      v15 -= 8;
    }
    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8)
      operator delete(v8);
  }
}

void std::vector<cva::PoseRefiner<double>::projData,std::allocator<cva::PoseRefiner<double>::projData>>::__append(uint64_t *a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  size_t v13;
  size_t v14;
  void *__p;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(v4 - 8);
  if (0xCCCCCCCCCCCCCCCDLL * ((v6 - v7) >> 4) >= a2)
  {
    if (a2)
    {
      v13 = 80 * ((80 * a2 - 80) / 0x50) + 80;
      bzero(*(void **)(v4 - 8), v13);
      v7 += v13;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = 0xCCCCCCCCCCCCCCCDLL * ((v7 - *a1) >> 4);
    v9 = v8 + a2;
    if (v8 + a2 > 0x333333333333333)
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    v10 = 0xCCCCCCCCCCCCCCCDLL * ((v5 - *a1) >> 4);
    if (2 * v10 > v9)
      v9 = 2 * v10;
    if (v10 >= 0x199999999999999)
      v11 = 0x333333333333333;
    else
      v11 = v9;
    v19 = v4;
    if (v11)
      v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<cva::PoseRefiner<double>::projData>>(v4, v11);
    else
      v12 = 0;
    __p = v12;
    v16 = &v12[80 * v8];
    v18 = &v12[80 * v11];
    v14 = 80 * ((80 * a2 - 80) / 0x50) + 80;
    bzero(v16, v14);
    v17 = &v16[v14];
    std::vector<cva::PoseRefiner<double>::projData,std::allocator<cva::PoseRefiner<double>::projData>>::__swap_out_circular_buffer(a1, &__p);
    if (v17 != v16)
      v17 = &v16[(v17 - v16 - 80) % 0x50uLL];
    if (__p)
      operator delete(__p);
  }
}

void sub_210855DD4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t *std::vector<cva::PoseRefiner<double>::projData,std::allocator<cva::PoseRefiner<double>::projData>>::__swap_out_circular_buffer(uint64_t *result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = *result;
  v2 = result[1];
  v4 = a2[1];
  if (v2 != *result)
  {
    v5 = 0;
    do
    {
      v6 = v4 + v5;
      *(_BYTE *)(v6 - 80) = *(_BYTE *)(v2 + v5 - 80);
      v7 = *(_OWORD *)(v2 + v5 - 72);
      *(_QWORD *)(v6 - 56) = *(_QWORD *)(v2 + v5 - 56);
      *(_OWORD *)(v6 - 72) = v7;
      *(_OWORD *)(v6 - 48) = *(_OWORD *)(v2 + v5 - 48);
      *(_QWORD *)(v6 - 32) = *(_QWORD *)(v2 + v5 - 32);
      *(_OWORD *)(v6 - 24) = *(_OWORD *)(v2 + v5 - 24);
      *(_QWORD *)(v6 - 8) = *(_QWORD *)(v2 + v5 - 8);
      v5 -= 80;
    }
    while (v2 + v5 != v3);
    v4 += v5;
  }
  a2[1] = v4;
  v8 = *result;
  *result = v4;
  a2[1] = v8;
  v9 = result[1];
  result[1] = a2[2];
  a2[2] = v9;
  v10 = result[2];
  result[2] = a2[3];
  a2[3] = v10;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<cva::PoseRefiner<double>::projData>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x333333333333334)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(80 * a2);
}

double cva::assign<false,false,cva::Matrix<double,3u,1u,false>,cva::MatrixRef<double const,3u,3u,false>,cva::Matrix<double,3u,1u,false>>(uint64_t a1, double **a2)
{
  uint64_t v3;
  double *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double result;
  double *v9;
  double v10;
  __int128 v11;
  uint64_t v12;

  v3 = *(_QWORD *)*a2;
  if (v3 - 8 * *((unsigned int *)*a2 + 3) == a1 || (v4 = a2[1], v4 == (double *)a1))
  {
    v11 = 0uLL;
    v12 = 0;
    cva::assign<false,false,cva::Matrix<double,3u,1u,false>,cva::MatrixRef<double const,3u,3u,false>,cva::Matrix<double,3u,1u,false>>(&v11);
    result = *(double *)&v11;
    *(_OWORD *)a1 = v11;
    *(_QWORD *)(a1 + 16) = v12;
  }
  else
  {
    v5 = 0;
    v6 = *((unsigned int *)*a2 + 2);
    do
    {
      if ((_DWORD)v6)
      {
        v7 = 0;
        result = 0.0;
        v9 = v4;
        do
        {
          v10 = *v9++;
          result = result + *(double *)(v3 + v7) * v10;
          v7 += 8 * v6;
        }
        while (8 * (3 * v6) != v7);
      }
      else
      {
        result = 0.0;
      }
      *(double *)(a1 + 8 * v5++) = result;
      v3 += 8;
    }
    while (v5 != 3);
  }
  return result;
}

double std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>(double *a1, double *a2, double *a3, double result)
{
  double *v4;
  unint64_t v7;
  double *v8;
  double *v9;
  int v10;
  double *v11;
  double *v12;
  double *v13;
  double v14;
  double v15;
  double *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double *v21;
  double v22;
  double *v23;
  double v24;
  double v25;
  double v26;
  double *v27;
  double v28;
  double v29;
  double v30;

  if (a3 != a2)
  {
    v4 = a3;
    do
    {
      v7 = v4 - a1;
      if (v7 < 2)
        break;
      if (v7 == 3)
      {
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>(a1, a1 + 1, v4 - 1);
        return result;
      }
      if (v7 == 2)
      {
        result = *(v4 - 1);
        v30 = *a1;
        if (result < *a1)
        {
          *a1 = result;
          *(v4 - 1) = v30;
        }
        return result;
      }
      if ((char *)v4 - (char *)a1 <= 63)
        return std::__selection_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>(a1, v4, result);
      v8 = &a1[v7 >> 1];
      v9 = v4 - 1;
      v10 = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>(a1, v8, v4 - 1);
      result = *a1;
      if (*a1 >= *v8)
      {
        v11 = v4 - 1;
        while (--v11 != a1)
        {
          if (*v11 < *v8)
          {
            *a1 = *v11;
            *v11 = result;
            ++v10;
            goto LABEL_13;
          }
        }
        v21 = a1 + 1;
        if (result >= *v9)
        {
          while (v21 != v9)
          {
            v22 = *v21;
            if (result < *v21)
            {
              *v21++ = *v9;
              *v9 = v22;
              goto LABEL_45;
            }
            ++v21;
          }
          return result;
        }
LABEL_45:
        if (v21 == v9)
          return result;
        while (1)
        {
          v25 = *a1;
          do
          {
            v26 = *v21++;
            result = v26;
          }
          while (v25 >= v26);
          v27 = v21 - 1;
          do
          {
            v28 = *--v9;
            v29 = v28;
          }
          while (v25 < v28);
          if (v27 >= v9)
            break;
          *v27 = v29;
          *v9 = result;
        }
        a1 = v21 - 1;
        if (v27 > a2)
          return result;
      }
      else
      {
        v11 = v4 - 1;
LABEL_13:
        v12 = a1 + 1;
        if (a1 + 1 >= v11)
        {
          v16 = a1 + 1;
        }
        else
        {
          v13 = a1 + 1;
          while (1)
          {
            v14 = *v8;
            do
            {
              v15 = *v13++;
              result = v15;
            }
            while (v15 < v14);
            v16 = v13 - 1;
            do
            {
              v17 = *--v11;
              v18 = v17;
            }
            while (v17 >= v14);
            if (v16 >= v11)
              break;
            *v16 = v18;
            *v11 = result;
            ++v10;
            if (v16 == v8)
              v8 = v11;
          }
        }
        if (v16 != v8)
        {
          result = *v8;
          v19 = *v16;
          if (*v8 < *v16)
          {
            *v16 = result;
            *v8 = v19;
            ++v10;
          }
        }
        if (v16 == a2)
          return result;
        if (!v10)
        {
          if (v16 <= a2)
          {
            v23 = v16 + 1;
            while (v23 != v4)
            {
              v24 = *(v23 - 1);
              result = *v23++;
              if (result < v24)
                goto LABEL_29;
            }
          }
          else
          {
            while (v12 != v16)
            {
              v20 = *(v12 - 1);
              result = *v12++;
              if (result < v20)
                goto LABEL_29;
            }
          }
          return result;
        }
LABEL_29:
        if (v16 <= a2)
          a1 = v16 + 1;
        else
          v4 = v16;
      }
    }
    while (v4 != a2);
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>(double *a1, double *a2, double *a3)
{
  double v3;
  double v4;
  double v5;
  double v6;

  v3 = *a2;
  v4 = *a1;
  v5 = *a3;
  if (*a2 < *a1)
  {
    if (v5 < v3)
    {
      *a1 = v5;
      *a3 = v4;
      return 1;
    }
    *a1 = v3;
    *a2 = v4;
    if (*a3 >= v4)
      return 1;
    *a2 = *a3;
    *a3 = v4;
    return 2;
  }
  if (v5 < v3)
  {
    *a2 = v5;
    *a3 = v3;
    v6 = *a1;
    if (*a2 >= *a1)
      return 1;
    *a1 = *a2;
    *a2 = v6;
    return 2;
  }
  return 0;
}

double std::__selection_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>(double *a1, double *a2, double result)
{
  double *v3;
  double *v4;
  double *v5;
  double *v6;
  double v7;
  double v8;

  while (a1 != a2 - 1)
  {
    v3 = a1++;
    if (v3 != a2 && a1 != a2)
    {
      result = *v3;
      v4 = a1;
      v5 = v3;
      v6 = a1;
      do
      {
        v7 = *v6++;
        v8 = v7;
        if (v7 < result)
        {
          result = v8;
          v5 = v4;
        }
        v4 = v6;
      }
      while (v6 != a2);
      if (v5 != v3)
      {
        result = *v3;
        *v3 = *v5;
        *v5 = result;
      }
    }
  }
  return result;
}

uint64_t cva::MatrixData<int,0ul,0ul,false>::allocate(void **a1, uint64_t a2)
{
  size_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *memptr;

  if (*a1)
    cva::MatrixData<int,0ul,0ul,false>::allocate();
  v3 = (4 * a2 + 31) & 0xFFFFFFFFFFFFFFE0;
  a1[1] = (void *)(v3 >> 2);
  memptr = 0;
  result = malloc_type_posix_memalign(&memptr, 0x20uLL, v3, 0x49090899uLL);
  v7 = memptr;
  *a1 = memptr;
  if (!v7)
    cva::MatrixData<int,0ul,0ul,false>::allocate(result, v5, v6);
  return result;
}

uint64_t cva::MatrixData<double,0ul,0ul,false>::allocate(void **a1, uint64_t a2)
{
  size_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *memptr;

  if (*a1)
    cva::MatrixData<int,0ul,0ul,false>::allocate();
  v3 = (8 * a2 + 31) & 0xFFFFFFFFFFFFFFE0;
  a1[1] = (void *)(v3 >> 3);
  memptr = 0;
  result = malloc_type_posix_memalign(&memptr, 0x20uLL, v3, 0x49090899uLL);
  v7 = memptr;
  *a1 = memptr;
  if (!v7)
    cva::MatrixData<int,0ul,0ul,false>::allocate(result, v5, v6);
  return result;
}

double *cva::ExponentialCoefficients<double,3>::ExponentialCoefficients(double *a1, double a2)
{
  double v4;
  double v5;
  double v6;
  double cosval;
  double v8;
  __double2 v9;

  if (a2 >= 0.0000002635)
  {
    v8 = sqrt(a2);
    v9 = __sincos_stret(v8);
    cosval = v9.__cosval;
    v6 = v9.__sinval / v8;
    v4 = 1.0 / a2 * (1.0 - v9.__cosval);
    v5 = 1.0 / a2 * (1.0 - v9.__sinval / v8);
  }
  else
  {
    v4 = 0.5 - a2 * (a2 / -720.0 + 0.0416666667);
    v5 = 0.166666667 - a2 * (a2 / -5040.0 + 0.00833333333);
    v6 = 1.0 - a2 * v5;
    cosval = 1.0 - a2 * v4;
  }
  a1[2] = v4;
  a1[3] = v5;
  *a1 = cosval;
  a1[1] = v6;
  return a1;
}

double cva::SE3GroupStorage<double,cva::Matrix<double,4u,4u,false>>::SE3GroupStorage(_OWORD *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t i;
  double result;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;

  v3 = 0;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  v4 = 0x100000000;
  *a1 = 0u;
  a1[1] = 0u;
  do
  {
    v5 = *a2++;
    *((_QWORD *)a1 + v3) = v5;
    v6 = HIDWORD(v4);
    v7 = (int)v4 < 2;
    if ((int)v4 < 2)
      v6 = 0;
    v8 = v3 + v6;
    v9 = (v4 + 1);
    v10 = v4 & 0xFFFFFFFF00000000;
    if (!v7)
      v9 = 0;
    v4 = v9 | v10;
    v3 = v8 + 1;
  }
  while (v3 != 12);
  for (i = 0; i != 24; i += 8)
  {
    result = *(double *)(a3 + i);
    *(double *)((char *)a1 + i + 96) = result;
  }
  v13 = 0;
  v14 = 0;
  v15 = (char *)a1 + 24;
  do
  {
    while (v14 == 4)
    {
      *(_QWORD *)&v15[32 * v13++] = 0;
      if (v13 == 4)
        return result;
    }
    result = dbl_210881C20[v14];
    v16 = v14 + 1;
    *(double *)&v15[32 * v13++] = result;
    ++v14;
  }
  while (v13 != 4);
  if (v16 != 4)
    cva::SE3GroupStorage<double,cva::Matrix<double,4u,4u,false>>::SE3GroupStorage((uint64_t)a1, (uint64_t)a2, a3);
  return result;
}

float64_t cva::assign<false,false,cva::Matrix<double,4u,4u,false>,cva::Matrix<double,4u,4u,false>,cva::Matrix<double,4u,4u,false>>(float64x2_t *a1, float64x2_t **a2)
{
  float64x2_t *v3;
  float64x2_t *v4;
  uint64_t i;
  uint64_t v6;
  float64x2_t v7;
  float64x2_t *v8;
  float64x2_t v9;
  double v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t *v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  float64x2_t v26;

  v3 = *a2;
  if (*a2 == a1 || (v4 = a2[1], v4 == a1))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    cva::assign<false,false,cva::Matrix<double,4u,4u,false>,cva::Matrix<double,4u,4u,false>,cva::Matrix<double,4u,4u,false>>(&v19);
    v14 = v24;
    a1[4] = v23;
    a1[5] = v14;
    v15 = v26;
    a1[6] = v25;
    a1[7] = v15;
    v16 = v20;
    *a1 = v19;
    a1[1] = v16;
    v7.f64[0] = v21.f64[0];
    v17 = v22;
    a1[2] = v21;
    a1[3] = v17;
  }
  else
  {
    for (i = 0; i != 4; ++i)
    {
      v6 = 0;
      v7 = 0uLL;
      v8 = v3;
      v9 = 0uLL;
      do
      {
        v10 = v4->f64[v6];
        v11 = *v8;
        v12 = v8[1];
        v8 += 2;
        v9 = vmlaq_n_f64(v9, v12, v10);
        v7 = vmlaq_n_f64(v7, v11, v10);
        ++v6;
      }
      while (v6 != 4);
      v13 = &a1[2 * i];
      *v13 = v7;
      v13[1] = v9;
      v4 += 2;
    }
  }
  return v7.f64[0];
}

double *cva::SE3GroupStorage<double,cva::Matrix<double,4u,4u,false>>::log@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double v4;
  double *result;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD v17[2];
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double *v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  _QWORD v27[4];
  __int128 v28;
  uint64_t v29;
  double v30;
  _QWORD v31[5];

  v31[4] = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_QWORD *)&v28 = a1;
  *((_QWORD *)&v28 + 1) = 4;
  v23 = (double *)a2;
  v24 = 6;
  cva::computeLogarithmVector<cva::MatrixRef<double const,3u,3u,false>,cva::MatrixRef<double,3u,1u,false>>((uint64_t)&v28, &v23);
  v4 = *(double *)a2 * *(double *)a2
     + *(double *)(a2 + 8) * *(double *)(a2 + 8)
     + *(double *)(a2 + 16) * *(double *)(a2 + 16);
  result = cva::ExponentialCoefficients<double,3>::ExponentialCoefficients(&v19, v4);
  if (v4 >= 2.775e-15)
  {
    v6 = (v21 + v20 * -0.5) / (v4 * v21);
    if (v4 <= 9.0)
      v6 = -(v22 - v21 * 0.5) / v20;
  }
  else
  {
    v6 = v4 * 0.00138888889 + 0.0833333333 + v4 * 0.0000330687831;
  }
  v7 = 0;
  v9 = *(_QWORD *)(a1 + 96);
  v10 = *(_QWORD *)(a1 + 104);
  v8 = a1 + 96;
  v17[0] = 0;
  v17[1] = 0;
  v18 = 0;
  v11 = *(double *)a2;
  v12 = *(_QWORD *)(a2 + 16);
  v13 = *(_QWORD *)(v8 + 16);
  *((_QWORD *)&v28 + 1) = *(_QWORD *)(a2 + 8);
  v29 = v12;
  v30 = v11;
  v31[0] = v13;
  v31[1] = v9;
  v31[2] = v10;
  v24 = v12;
  v25 = v11;
  v26 = *((_QWORD *)&v28 + 1);
  v27[0] = v10;
  v27[1] = v13;
  v27[2] = v9;
  do
  {
    *(double *)&v17[v7] = *(double *)((char *)&v28 + v7 * 8 + 8) * *(double *)&v31[v7]
                        - *(double *)&(&v23)[v7 + 1] * *(double *)&v27[v7];
    ++v7;
  }
  while (v7 != 3);
  v14 = 0;
  v28 = 0uLL;
  v29 = 0;
  v15 = 2;
  do
  {
    if (v14 == 2)
      v16 = 0;
    else
      v16 = v14 + 1;
    *((double *)&v28 + v14) = *(double *)(v8 + 8 * v14)
                            + *(double *)&v17[v14] * -0.5
                            + v6
                            * (*(double *)(a2 + 8 * v16) * *((double *)&v18 + v14 + -3 * (v15 / 3))
                             - *(double *)(a2 + 16 - 24 * (v15 / 3) + 8 * v14) * *(double *)&v17[v16]);
    ++v15;
    ++v14;
  }
  while (v14 != 3);
  *(_OWORD *)(a2 + 24) = v28;
  *(_QWORD *)(a2 + 40) = v29;
  return result;
}

void cva::computeLogarithmVector<cva::MatrixRef<double const,3u,3u,false>,cva::MatrixRef<double,3u,1u,false>>(uint64_t a1, double **a2)
{
  double *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double *v7;
  float64x2_t *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _BOOL4 v17;
  double v19;
  double v20;
  long double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  float64x2_t v38;

  v2 = *(double **)a1;
  v3 = *(unsigned int *)(a1 + 8);
  v4 = (v3 + 2);
  v5 = (2 * (_DWORD)v3) | 1u;
  v6 = (*(double *)(*(_QWORD *)a1 + 8 * v4) - *(double *)(*(_QWORD *)a1 + 8 * v5)) * 0.5;
  v7 = *a2;
  *v7 = v6;
  v8 = (float64x2_t *)&v2[(2 * v3)];
  v9 = (v8->f64[0] - v2[2]) * 0.5;
  v7[1] = v9;
  v10 = (v2[1] - v2[v3]) * 0.5;
  v7[2] = v10;
  v11 = *v2;
  v12 = v2[(v3 + 1)];
  v13 = v2[(2 * v3 + 2)];
  v14 = -1.0;
  v15 = (*v2 + v12 + v13 + -1.0) * 0.5;
  v16 = v9 * v9 + v6 * v6 + v10 * v10;
  if (v15 >= -1.0 || v15 + 1.0 <= -0.00001)
  {
    v17 = v15 > 1.0;
    if (v15 + -1.0 >= 0.00001)
      v17 = 0;
    if (v15 > 0.99 || v17)
    {
      v19 = v16 * (v16 * (v16 * 5.0 / 112.0 + 0.075) + 0.166666667) + 1.0;
LABEL_12:
      *v7 = v6 * v19;
      v7[1] = v9 * v19;
      v20 = v10 * v19;
LABEL_23:
      v7[2] = v20;
      return;
    }
    if (v15 > -0.99)
    {
      v19 = acos(v15) / sqrt(v16);
      goto LABEL_12;
    }
    v14 = (*v2 + v12 + v13 + -1.0) * 0.5;
  }
  v21 = asin(sqrt(v16));
  v22 = (3.14159265 - v21) * (3.14159265 - v21) / (1.0 - v14);
  v23 = (v11 - v14) * v22;
  v24 = (v12 - v14) * v22;
  v25 = (v13 - v14) * v22;
  if (v23 <= v24)
  {
    v30 = v22 * 0.5;
    if (v24 > v25)
    {
      v31 = sqrt(v24);
      if (v9 < 0.0)
        v31 = -v31;
      v7[1] = v31;
      v32 = 1.0 / v31;
      v33 = v2[v5] + v2[v4];
      *v7 = v32 * (v30 * (v2[v3] + v2[1]));
      v20 = v32 * (v30 * v33);
      goto LABEL_23;
    }
    v37 = sqrt(v25);
    if (v10 < 0.0)
      v37 = -v37;
    v7[2] = v37;
    v38.f64[0] = v2[2];
    v38.f64[1] = v2[v4];
    *(float64x2_t *)v7 = vmulq_n_f64(vmulq_n_f64(vaddq_f64(*v8, v38), v30), 1.0 / v37);
  }
  else
  {
    v26 = v22 * 0.5;
    v27 = v26 * (v8->f64[0] + v2[2]);
    if (v23 <= v25)
    {
      v34 = sqrt(v25);
      if (v10 < 0.0)
        v34 = -v34;
      v7[2] = v34;
      v35 = 1.0 / v34;
      v36 = v35 * (v26 * (v2[v5] + v2[v4]));
      *v7 = v35 * v27;
      v7[1] = v36;
    }
    else
    {
      v28 = sqrt(v23);
      if (v6 < 0.0)
        v28 = -v28;
      *v7 = v28;
      v29 = 1.0 / v28;
      v7[1] = v29 * (v26 * (v2[v3] + v2[1]));
      v7[2] = v29 * v27;
    }
  }
}

double cva::computeExponentialMatrix<double,cva::Matrix<double,6u,1u,false>,cva::Matrix<double,4u,4u,false>>(uint64_t *a1, double *a2, uint64_t a3)
{
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double result;
  double v16;
  double *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD v24[2];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[4];
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[5];

  v34[4] = *MEMORY[0x24BDAC8D0];
  v6 = *a2;
  v7 = a2[1];
  v8 = a2[2];
  *(_QWORD *)&v31 = a1;
  *((_QWORD *)&v31 + 1) = 6;
  v26 = a3;
  v27 = 4;
  cva::computeExponentialMatrix<double,cva::MatrixRef<double const,3u,1u,false>,cva::MatrixRef<double,3u,3u,false>>((double **)&v31, (uint64_t)&v26, v6, v7, v8);
  v9 = 0;
  v24[0] = 0;
  v24[1] = 0;
  v25 = 0;
  v10 = *a1;
  v11 = a1[2];
  v12 = a1[3];
  v13 = a1[4];
  v14 = a1[5];
  *((_QWORD *)&v31 + 1) = a1[1];
  v32 = v11;
  v33 = v10;
  v34[0] = v14;
  v34[1] = v12;
  v34[2] = v13;
  v27 = v11;
  v28 = v10;
  v29 = *((_QWORD *)&v31 + 1);
  v30[0] = v13;
  v30[1] = v14;
  v30[2] = v12;
  do
  {
    *(double *)&v24[v9] = *(double *)((char *)&v31 + v9 * 8 + 8) * *(double *)&v34[v9]
                        - *(double *)((char *)&v26 + v9 * 8 + 8) * *(double *)&v30[v9];
    ++v9;
  }
  while (v9 != 3);
  result = a2[2];
  v16 = a2[3];
  v17 = (double *)(a3 + 96);
  if (a1 == (uint64_t *)a3)
  {
    v21 = 0;
    v31 = 0uLL;
    v32 = 0;
    v22 = 2;
    do
    {
      if (v21 == 2)
        v23 = 0;
      else
        v23 = v21 + 1;
      *((double *)&v31 + v21) = *(double *)&a1[v21 + 3]
                              + result * *(double *)&v24[v21]
                              + v16
                              * (*(double *)&a1[v23] * *((double *)&v25 + v21 + -3 * (v22 / 3))
                               - *(double *)&a1[v21 + 2 + -3 * (v22 / 3)] * *(double *)&v24[v23]);
      ++v22;
      ++v21;
    }
    while (v21 != 3);
    result = *(double *)&v31;
    *(_OWORD *)v17 = v31;
    *(_QWORD *)(a3 + 112) = v32;
  }
  else
  {
    v18 = 0;
    v19 = 2;
    do
    {
      if (v18 == 2)
        v20 = 0;
      else
        v20 = v18 + 1;
      v17[v18] = *(double *)&a1[v18 + 3]
               + result * *(double *)&v24[v18]
               + v16
               * (*(double *)&a1[v20] * *((double *)&v25 + v18 + -3 * (v19 / 3))
                - *(double *)&a1[v18 + 2 + -3 * (v19 / 3)] * *(double *)&v24[v20]);
      ++v19;
      ++v18;
    }
    while (v18 != 3);
  }
  return result;
}

double cva::computeExponentialMatrix<double,cva::MatrixRef<double const,3u,1u,false>,cva::MatrixRef<double,3u,3u,false>>(double **a1, uint64_t a2, double a3, double a4, double a5)
{
  double *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double *v10;
  uint64_t v11;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double result;

  v5 = *a1;
  v6 = **a1;
  v7 = v6 * a5;
  v8 = (*a1)[1] * a5;
  v9 = (*a1)[2] * a5;
  v10 = *(double **)a2;
  *v10 = a3 + v7 * v6;
  v11 = *(unsigned int *)(a2 + 8);
  v10[(v11 + 1)] = a3 + v8 * v5[1];
  v12 = 2 * v11;
  v10[v12 + 2] = a3 + v9 * v5[2];
  v13 = v5[1];
  v14 = v7 * v13;
  v15 = v5[2];
  v16 = v7 * v15;
  v17 = v8 * v15;
  v18 = *v5 * a4;
  v19 = v13 * a4;
  v20 = v15 * a4;
  v10[v11] = v14 - v20;
  v10[v12] = v19 + v16;
  v10[1] = v14 + v20;
  v10[(2 * (_DWORD)v11) | 1u] = v17 - v18;
  v10[2] = v16 - v19;
  result = v17 + v18;
  v10[(v11 + 2)] = v17 + v18;
  return result;
}

_QWORD *cva::PoseRefiner<double>::~PoseRefiner(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)a1[50];
  if (v2)
  {
    a1[51] = v2;
    operator delete(v2);
  }
  v3 = (void *)a1[4];
  if (v3)
  {
    a1[5] = v3;
    operator delete(v3);
  }
  return a1;
}

__int128 *std::vector<cva::Matrix<double,2u,1u,false>>::__assign_with_size[abi:ne180100]<cva::Matrix<double,2u,1u,false>*,cva::Matrix<double,2u,1u,false>*>(__int128 **a1, __int128 *a2, __int128 *a3, unint64_t a4)
{
  __int128 *v6;
  uint64_t v8;
  __int128 *result;
  uint64_t v10;
  unint64_t v11;
  __int128 **v12;
  __int128 *v13;
  char *v14;
  __int128 v15;
  __int128 *v16;
  __int128 *v17;
  unint64_t v18;
  __int128 *v19;
  uint64_t v20;
  char *v21;
  __int128 *v22;
  __int128 v23;
  int64_t v24;
  __int128 *v25;

  v6 = a2;
  v8 = (uint64_t)a1[2];
  result = *a1;
  if (a4 > (v8 - (uint64_t)result) >> 4)
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      v8 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a4 >> 60)
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    v10 = v8 >> 3;
    if (v8 >> 3 <= a4)
      v10 = a4;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0)
      v11 = 0xFFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE11__vallocateB8ne180100Em(a1, v11);
    v13 = a1[1];
    v12 = a1 + 1;
    result = v13;
    v14 = (char *)v13;
    if (v6 != a3)
    {
      v14 = (char *)result;
      do
      {
        v15 = *v6++;
        *(_OWORD *)v14 = v15;
        v14 += 16;
      }
      while (v6 != a3);
    }
LABEL_30:
    v24 = v14 - (char *)result;
    goto LABEL_31;
  }
  v17 = a1[1];
  v12 = a1 + 1;
  v16 = v17;
  v18 = v17 - result;
  if (v18 >= a4)
  {
    v14 = (char *)result;
    if (a2 != a3)
    {
      v25 = result;
      do
      {
        if (v6 != v25)
          *v25 = *v6;
        ++v6;
        ++v25;
        v14 += 16;
      }
      while (v6 != a3);
    }
    goto LABEL_30;
  }
  v19 = &a2[v18];
  if (v16 != result)
  {
    v20 = 16 * v18;
    do
    {
      if (v6 != result)
        *result = *v6;
      ++v6;
      ++result;
      v20 -= 16;
    }
    while (v20);
    result = *v12;
  }
  v21 = (char *)result;
  if (v19 != a3)
  {
    v21 = (char *)result;
    v22 = result;
    do
    {
      v23 = *v19++;
      *v22++ = v23;
      v21 += 16;
    }
    while (v19 != a3);
  }
  v24 = v21 - (char *)result;
LABEL_31:
  *v12 = (__int128 *)((char *)result + v24);
  return result;
}

_QWORD *std::vector<cva::Matrix<double,3u,1u,false>>::__assign_with_size[abi:ne180100]<cva::Matrix<double,3u,1u,false>*,cva::Matrix<double,3u,1u,false>*>(_QWORD *a1, _QWORD *a2, _QWORD *a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v8;
  _QWORD *result;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD **v13;
  _QWORD *v14;
  char *v15;
  __int128 v16;
  _QWORD *v17;
  _QWORD *v18;
  unint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  __int128 v22;
  char *v23;
  _QWORD *v24;
  __int128 v25;
  int64_t v26;
  _QWORD *v27;
  __int128 v28;

  v6 = a2;
  v8 = a1[2];
  result = (_QWORD *)*a1;
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - (uint64_t)result) >> 3) < a4)
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      v8 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a4 > 0xAAAAAAAAAAAAAAALL)
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    v10 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 3);
    v11 = 2 * v10;
    if (2 * v10 <= a4)
      v11 = a4;
    if (v10 >= 0x555555555555555)
      v12 = 0xAAAAAAAAAAAAAAALL;
    else
      v12 = v11;
    std::vector<cva::Matrix<double,3u,1u,false>>::__vallocate[abi:ne180100](a1, v12);
    v14 = (_QWORD *)a1[1];
    v13 = (_QWORD **)(a1 + 1);
    result = v14;
    v15 = (char *)v14;
    if (v6 != a3)
    {
      v15 = (char *)result;
      do
      {
        v16 = *(_OWORD *)v6;
        *((_QWORD *)v15 + 2) = v6[2];
        *(_OWORD *)v15 = v16;
        v15 += 24;
        v6 += 3;
      }
      while (v6 != a3);
    }
LABEL_30:
    v26 = v15 - (char *)result;
    goto LABEL_31;
  }
  v18 = (_QWORD *)a1[1];
  v13 = (_QWORD **)(a1 + 1);
  v17 = v18;
  v19 = 0xAAAAAAAAAAAAAAABLL * (v18 - result);
  if (v19 >= a4)
  {
    v15 = (char *)result;
    if (a2 != a3)
    {
      v27 = result;
      do
      {
        if (v6 != v27)
        {
          v28 = *(_OWORD *)v6;
          v27[2] = v6[2];
          *(_OWORD *)v27 = v28;
        }
        v6 += 3;
        v27 += 3;
        v15 += 24;
      }
      while (v6 != a3);
    }
    goto LABEL_30;
  }
  v20 = &a2[3 * v19];
  if (v17 != result)
  {
    v21 = 24 * v19;
    do
    {
      if (v6 != result)
      {
        v22 = *(_OWORD *)v6;
        result[2] = v6[2];
        *(_OWORD *)result = v22;
      }
      v6 += 3;
      result += 3;
      v21 -= 24;
    }
    while (v21);
    result = *v13;
  }
  v23 = (char *)result;
  if (v20 != a3)
  {
    v23 = (char *)result;
    v24 = result;
    do
    {
      v25 = *(_OWORD *)v20;
      v24[2] = v20[2];
      *(_OWORD *)v24 = v25;
      v24 += 3;
      v20 += 3;
      v23 += 24;
    }
    while (v20 != a3);
  }
  v26 = v23 - (char *)result;
LABEL_31:
  *v13 = (_QWORD *)((char *)result + v26);
  return result;
}

char *std::vector<cva::Matrix<double,3u,1u,false>>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<float>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

_QWORD *std::vector<cva::Matrix<double,2u,1u,false>>::vector(_QWORD *a1, unint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE11__vallocateB8ne180100Em(a1, a2);
    v4 = (char *)a1[1];
    bzero(v4, 16 * a2);
    a1[1] = &v4[16 * a2];
  }
  return a1;
}

void sub_2108572D8(_Unwind_Exception *exception_object)
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

double cva::assign<false,false,cva::Matrix<double,3u,1u,false>,cva::Matrix<double,3u,3u,false>,cva::Matrix<double,3u,1u,false>>(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  double *v4;
  uint64_t i;
  uint64_t v6;
  double result;
  double *v8;
  double v9;
  __int128 v10;
  uint64_t v11;

  v3 = *a2;
  if (*a2 == a1 || (v4 = (double *)a2[1], v4 == (double *)a1))
  {
    v10 = 0uLL;
    v11 = 0;
    cva::assign<false,false,cva::Matrix<double,3u,1u,false>,cva::Matrix<double,3u,3u,false>,cva::Matrix<double,3u,1u,false>>(&v10);
    result = *(double *)&v10;
    *(_OWORD *)a1 = v10;
    *(_QWORD *)(a1 + 16) = v11;
  }
  else
  {
    for (i = 0; i != 3; ++i)
    {
      v6 = 0;
      result = 0.0;
      v8 = v4;
      do
      {
        v9 = *v8++;
        result = result + *(double *)(v3 + v6) * v9;
        v6 += 24;
      }
      while (v6 != 72);
      *(double *)(a1 + 8 * i) = result;
      v3 += 8;
    }
  }
  return result;
}

void OUTLINED_FUNCTION_0(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 490, a4);
}

uint64_t GetDimensionForIndexBackwards(uint64_t a1, unint64_t a2, int a3)
{
  if (a3 >= a2)
    return 1;
  else
    return *(_QWORD *)(a1 + 8 * (~(uint64_t)a3 + a2));
}

uint64_t GetStrideForIndexBackwards(uint64_t a1, unint64_t a2, int a3)
{
  unint64_t v3;

  if (a3 >= a2)
    v3 = 0;
  else
    v3 = ~(uint64_t)a3 + a2;
  return *(_QWORD *)(a1 + 8 * v3);
}

uint64_t convertFloatToInt(float a1)
{
  double v1;
  BOOL v2;
  double v3;

  v1 = a1;
  v2 = a1 < 0.0;
  v3 = 0.5;
  if (v2)
    v3 = -0.5;
  return (int)(v3 + v1);
}

size_t wrapCVPixelBufferVImage@<X0>(__CVBuffer *a1@<X0>, void **a2@<X8>)
{
  size_t result;

  *a2 = CVPixelBufferGetBaseAddress(a1);
  a2[1] = (void *)CVPixelBufferGetHeight(a1);
  a2[2] = (void *)CVPixelBufferGetWidth(a1);
  result = CVPixelBufferGetBytesPerRow(a1);
  a2[3] = (void *)result;
  return result;
}

size_t vImage_Buffer_From_CVPixelBufferPlane@<X0>(__CVBuffer *a1@<X0>, size_t a2@<X1>, uint64_t a3@<X8>)
{
  size_t result;

  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_QWORD *)a3 = CVPixelBufferGetBaseAddressOfPlane(a1, a2);
  *(_QWORD *)(a3 + 8) = CVPixelBufferGetHeightOfPlane(a1, a2);
  *(_QWORD *)(a3 + 16) = CVPixelBufferGetWidthOfPlane(a1, a2);
  result = CVPixelBufferGetBytesPerRowOfPlane(a1, a2);
  *(_QWORD *)(a3 + 24) = result;
  return result;
}

double getImageDimensionsFromFile(uint64_t a1)
{
  const __CFURL *v1;
  CGImageSource *v2;
  CGImageSource *v3;
  CGImage *ImageAtIndex;
  size_t Width;
  double v6;
  NSObject *v7;
  uint8_t v9[16];

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", a1);
  v1 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v2 = CGImageSourceCreateWithURL(v1, 0);
  v3 = v2;
  if (v2)
  {
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v2, 0, 0);
    Width = CGImageGetWidth(ImageAtIndex);
    CGImageGetHeight(ImageAtIndex);
    CGImageRelease(ImageAtIndex);
    CFRelease(v3);
    v6 = (double)Width;
  }
  else
  {
    __ABPKLogSharedInstance();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_210836000, v7, OS_LOG_TYPE_ERROR, " CGImageSourceCreateWithURL error: Couldn't create cgimagesource with URL ", v9, 2u);
    }

    v6 = 0.0;
  }

  return v6;
}

void sub_210858E7C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void readImage(uint64_t a1, CVPixelBufferRef *a2)
{
  const __CFURL *v3;
  CGImageSource *v4;
  CGImageSource *v5;
  CGImage *ImageAtIndex;
  void *BaseAddress;
  size_t BitsPerComponent;
  size_t BytesPerRow;
  CGColorSpace *DeviceRGB;
  size_t Width;
  size_t Height;
  CGContext *v13;
  size_t v14;
  size_t v15;
  NSObject *v16;
  const char *v17;
  CGAffineTransform v18;
  uint8_t buf[16];
  CGRect v20;

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", a1);
  v3 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v4 = CGImageSourceCreateWithURL(v3, 0);
  v5 = v4;
  if (!v4)
  {
    __ABPKLogSharedInstance();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v17 = " CGImageSourceCreateWithURL error: Couldn't create cgimagesource with URL ";
LABEL_8:
      _os_log_impl(&dword_210836000, v16, OS_LOG_TYPE_ERROR, v17, buf, 2u);
    }
LABEL_9:

    goto LABEL_10;
  }
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v4, 0, 0);
  CFRelease(v5);
  if (!ImageAtIndex)
  {
    __ABPKLogSharedInstance();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v17 = " CGImageSourceCreateImageAtIndex error: Couldn't create image. ";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  CVPixelBufferLockBaseAddress(*a2, 0);
  BaseAddress = CVPixelBufferGetBaseAddress(*a2);
  BitsPerComponent = CGImageGetBitsPerComponent(ImageAtIndex);
  BytesPerRow = CVPixelBufferGetBytesPerRow(*a2);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  Width = CGImageGetWidth(ImageAtIndex);
  Height = CGImageGetHeight(ImageAtIndex);
  v13 = CGBitmapContextCreate(BaseAddress, Width, Height, BitsPerComponent, BytesPerRow, DeviceRGB, 6u);
  CGAffineTransformMakeRotation(&v18, 0.0);
  CGContextConcatCTM(v13, &v18);
  v14 = CGImageGetWidth(ImageAtIndex);
  v15 = CGImageGetHeight(ImageAtIndex);
  v20.size.width = (double)v14;
  v20.size.height = (double)v15;
  v20.origin.x = 0.0;
  v20.origin.y = 0.0;
  CGContextDrawImage(v13, v20, ImageAtIndex);
  CGColorSpaceRelease(DeviceRGB);
  CGContextRelease(v13);
  CGImageRelease(ImageAtIndex);
  CVPixelBufferUnlockBaseAddress(*a2, 0);
LABEL_10:

}

void sub_210859078(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t readGrayScaleImage(uint64_t a1, CVPixelBufferRef *a2)
{
  const __CFURL *v3;
  CGImageSource *v4;
  CGImageSource *v5;
  CGImage *ImageAtIndex;
  void *BaseAddress;
  size_t BitsPerComponent;
  size_t BytesPerRow;
  CGColorSpace *ColorSpace;
  size_t Width;
  size_t Height;
  uint32_t BitmapInfo;
  CGContext *v14;
  size_t v15;
  size_t v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  CGAffineTransform v21;
  uint8_t buf[16];
  CGRect v23;

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", a1);
  v3 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v4 = CGImageSourceCreateWithURL(v3, 0);
  v5 = v4;
  if (!v4)
  {
    __ABPKLogSharedInstance();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v19 = " CGImageSourceCreateWithURL error: Couldn't create cgimagesource with URL ";
LABEL_8:
      _os_log_impl(&dword_210836000, v18, OS_LOG_TYPE_ERROR, v19, buf, 2u);
    }
LABEL_9:

    v17 = 4294960636;
    goto LABEL_10;
  }
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v4, 0, 0);
  CFRelease(v5);
  if (!ImageAtIndex)
  {
    __ABPKLogSharedInstance();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v19 = " CGImageSourceCreateImageAtIndex error: Couldn't create image. ";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  CVPixelBufferLockBaseAddress(*a2, 0);
  BaseAddress = CVPixelBufferGetBaseAddress(*a2);
  BitsPerComponent = CGImageGetBitsPerComponent(ImageAtIndex);
  BytesPerRow = CVPixelBufferGetBytesPerRow(*a2);
  ColorSpace = CGImageGetColorSpace(ImageAtIndex);
  Width = CGImageGetWidth(ImageAtIndex);
  Height = CGImageGetHeight(ImageAtIndex);
  BitmapInfo = CGImageGetBitmapInfo(ImageAtIndex);
  v14 = CGBitmapContextCreate(BaseAddress, Width, Height, BitsPerComponent, BytesPerRow, ColorSpace, BitmapInfo);
  CGAffineTransformMakeRotation(&v21, 0.0);
  CGContextConcatCTM(v14, &v21);
  v15 = CGImageGetWidth(ImageAtIndex);
  v16 = CGImageGetHeight(ImageAtIndex);
  v23.size.width = (double)v15;
  v23.size.height = (double)v16;
  v23.origin.x = 0.0;
  v23.origin.y = 0.0;
  CGContextDrawImage(v14, v23, ImageAtIndex);
  CGImageRelease(ImageAtIndex);
  CGContextRelease(v14);
  CVPixelBufferUnlockBaseAddress(*a2, 0);
  v17 = 0;
LABEL_10:

  return v17;
}

void sub_2108592A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t readImageAndConvertToYCbCr(void *a1, CVPixelBufferRef *a2)
{
  id v3;
  size_t Width;
  size_t Height;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  const char *v12;
  uint8_t v14[16];
  CVPixelBufferRef pixelBufferOut[2];

  v3 = a1;
  if ((CVPixelBufferGetPixelFormatType(*a2) & 0xFFFFFFEF) == 0x34323066)
  {
    Width = CVPixelBufferGetWidth(*a2);
    Height = CVPixelBufferGetHeight(*a2);
    pixelBufferOut[0] = 0;
    v6 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], Width, Height, 0x20u, 0, pixelBufferOut);
    if ((_DWORD)v6)
    {
      __ABPKLogSharedInstance();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_210836000, v7, OS_LOG_TYPE_ERROR, " Could not create imageARGB buffer of type kCVPixelFormatType_32ARGB ", v14, 2u);
      }

      goto LABEL_26;
    }
    readImage((uint64_t)v3, pixelBufferOut);
    if (pixelBufferOut[0])
    {
      if (CVPixelBufferGetPixelFormatType(pixelBufferOut[0]) == 32)
      {
        if (convertFormatARGBToYCbCr(pixelBufferOut[0], a2))
        {
          __ABPKLogSharedInstance();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v14 = 0;
            v10 = " Could not convert pixelBuffer from ARGB->YCbCr ";
LABEL_24:
            _os_log_impl(&dword_210836000, v9, OS_LOG_TYPE_ERROR, v10, v14, 2u);
            goto LABEL_25;
          }
          goto LABEL_25;
        }
        if (CVPixelBufferGetPixelFormatType(*a2) != 875704438)
        {
          __ABPKLogSharedInstance();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v14 = 0;
            v10 = " Invalid pixel buffer format for imageYCbCr ";
            goto LABEL_24;
          }
LABEL_25:

          CVPixelBufferRelease(pixelBufferOut[0]);
          v6 = 1;
          goto LABEL_26;
        }
LABEL_20:
        CVPixelBufferRelease(pixelBufferOut[0]);
        v6 = 0;
        goto LABEL_26;
      }
      __ABPKLogSharedInstance();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v14 = 0;
        v12 = " Invalid pixel buffer format for imageARGB ";
        goto LABEL_18;
      }
    }
    else
    {
      __ABPKLogSharedInstance();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v14 = 0;
        v12 = " Failed to read imageARGB from the specified path ";
LABEL_18:
        _os_log_impl(&dword_210836000, v11, OS_LOG_TYPE_ERROR, v12, v14, 2u);
      }
    }

    goto LABEL_20;
  }
  __ABPKLogSharedInstance();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    LOWORD(pixelBufferOut[0]) = 0;
    _os_log_impl(&dword_210836000, v8, OS_LOG_TYPE_ERROR, " Supported formats are kCVPixelFormatType_420YpCbCr8BiPlanarVideoRange, kCVPixelFormatType_420YpCbCr8BiPlanarFullRange ", (uint8_t *)pixelBufferOut, 2u);
  }

  v6 = 4294960616;
LABEL_26:

  return v6;
}

void sub_210859548(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

vImage_Error convertFormatARGBToYCbCr(__CVBuffer *a1, CVPixelBufferRef *a2)
{
  OSType PixelFormatType;
  const vImage_ARGBToYpCbCrMatrix *v5;
  int32x2_t v6;
  int32x2_t v7;
  int8x8_t v8;
  int32_t v9;
  NSObject *v10;
  const char *v11;
  vImage_Error result;
  uint8_t v13[16];
  vImage_YpCbCrPixelRange pixelRange;
  vImage_Buffer destCbCr;
  vImage_Buffer destYp;
  uint8_t permuteMap[4];
  vImage_Buffer src;
  vImage_ARGBToYpCbCr outInfo;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  CVPixelBufferLockBaseAddress(a1, 0);
  CVPixelBufferLockBaseAddress(*a2, 0);
  memset(&src, 0, sizeof(src));
  wrapCVPixelBufferVImage(a1, &src.data);
  *(_DWORD *)permuteMap = 50462976;
  memset(&destYp, 0, sizeof(destYp));
  vImage_Buffer_From_CVPixelBufferPlane(*a2, 0, (uint64_t)&destYp);
  memset(&destCbCr, 0, sizeof(destCbCr));
  vImage_Buffer_From_CVPixelBufferPlane(*a2, 1uLL, (uint64_t)&destCbCr);
  v5 = (const vImage_ARGBToYpCbCrMatrix *)*MEMORY[0x24BDB3BB0];
  v6.i32[0] = 875704422;
  v7.i32[0] = PixelFormatType;
  v8 = vbsl_s8((int8x8_t)vdup_lane_s32(vceq_s32(v7, v6), 0), (int8x8_t)0x1000000FFLL, (int8x8_t)0x10000000EBLL);
  pixelRange.Yp_bias = 16 * (PixelFormatType != 875704422);
  pixelRange.CbCr_bias = 128;
  pixelRange.YpRangeMax = v8.i32[0];
  if (PixelFormatType == 875704422)
    v9 = 255;
  else
    v9 = 240;
  pixelRange.CbCrRangeMax = v9;
  *(int8x8_t *)&pixelRange.YpMax = v8;
  pixelRange.CbCrMax = v9;
  pixelRange.CbCrMin = 16 * (PixelFormatType != 875704422);
  if (vImageConvert_ARGBToYpCbCr_GenerateConversion(v5, &pixelRange, &outInfo, kvImageARGB8888, kvImage420Yp8_CbCr8, 0))
  {
    __ABPKLogSharedInstance();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      v11 = " Could not generate the conversion format ";
LABEL_10:
      _os_log_impl(&dword_210836000, v10, OS_LOG_TYPE_ERROR, v11, v13, 2u);
    }
  }
  else
  {
    result = vImageConvert_ARGB8888To420Yp8_CbCr8(&src, &destYp, &destCbCr, &outInfo, permuteMap, 0);
    if (!result)
      return result;
    __ABPKLogSharedInstance();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      v11 = " Could not generate the convert image ";
      goto LABEL_10;
    }
  }

  return 4294960636;
}

uint64_t writeImage(__CVBuffer *a1, void *a2)
{
  id v3;
  signed int PixelFormatType;
  signed int v5;
  int v6;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  const __CFAllocator *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  vImage_Error v16;
  NSObject *v17;
  unsigned int Width;
  NSObject *v19;
  uint8_t v21[16];
  uint8_t v22[8];
  unint64_t v23;
  size_t v24;
  void *BaseAddressOfPlane;
  vImage_Buffer v26;
  vImage_Buffer buf;
  CVPixelBufferRef v28;
  CVPixelBufferRef pixelBufferOut;

  v3 = a2;
  PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  v5 = PixelFormatType;
  if (PixelFormatType <= 875704437)
  {
    if (PixelFormatType == 32)
      goto LABEL_8;
    v6 = 875704422;
  }
  else
  {
    if (PixelFormatType == 875704438 || PixelFormatType == 1111970369)
      goto LABEL_8;
    v6 = 1278226488;
  }
  if (PixelFormatType != v6)
  {
    __ABPKLogSharedInstance();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.data) = 0;
      _os_log_impl(&dword_210836000, v13, OS_LOG_TYPE_ERROR, " Supported formats are kCVPixelFormatType_420YpCbCr8BiPlanarVideoRange, kCVPixelFormatType_420YpCbCr8BiPlanarFullRange, kCVPixelFormatType_OneComponent8 or kCVPixelFormatType_32ARGB or kCVPixelFormatType_32BGRA ", (uint8_t *)&buf, 2u);
    }

    v10 = 4294960616;
    goto LABEL_42;
  }
LABEL_8:
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(a1, 0);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(a1, 0);
  pixelBufferOut = 0;
  if ((v5 & 0xFFFFFFEF) == 0x34323066)
  {
    v9 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v10 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], WidthOfPlane, HeightOfPlane, 0x20u, 0, &pixelBufferOut);
    if ((_DWORD)v10)
    {
      __ABPKLogSharedInstance();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.data) = 0;
        v12 = " Could not create image buffer of type kCVPixelFormatType_32ARGB ";
LABEL_23:
        _os_log_impl(&dword_210836000, v11, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&buf, 2u);
        goto LABEL_24;
      }
      goto LABEL_24;
    }
    v10 = convertFormatYCbCrToARGB(a1, &pixelBufferOut);
    if ((_DWORD)v10)
    {
      __ABPKLogSharedInstance();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.data) = 0;
        v12 = " Could not convert pixel formats ";
        goto LABEL_23;
      }
      goto LABEL_24;
    }
  }
  else if (v5 == 1111970369)
  {
    v9 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v10 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], WidthOfPlane, HeightOfPlane, 0x20u, 0, &pixelBufferOut);
    if ((_DWORD)v10)
    {
      __ABPKLogSharedInstance();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.data) = 0;
        v12 = " Could not create image buffer of type kCVPixelFormatType_32ARGB ";
        goto LABEL_23;
      }
LABEL_24:

      goto LABEL_42;
    }
    if (changeChannelsARGB(a1, &pixelBufferOut))
    {
      __ABPKLogSharedInstance();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.data) = 0;
        _os_log_impl(&dword_210836000, v14, OS_LOG_TYPE_ERROR, " Conversion failed BGRA->ARGB ", (uint8_t *)&buf, 2u);
      }

    }
  }
  else
  {
    pixelBufferOut = a1;
    CVPixelBufferRetain(a1);
    v9 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  }
  v28 = 0;
  v10 = CVPixelBufferCreate(v9, WidthOfPlane, HeightOfPlane, 0x18u, 0, &v28);
  if ((_DWORD)v10)
  {
    __ABPKLogSharedInstance();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.data) = 0;
      _os_log_impl(&dword_210836000, v15, OS_LOG_TYPE_ERROR, " Could not convert image buffer to kCVPixelFormatType_24RGB ", (uint8_t *)&buf, 2u);
    }

    CVPixelBufferRelease(pixelBufferOut);
  }
  else
  {
    CVPixelBufferLockBaseAddress(v28, 0);
    CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
    memset(&buf, 0, sizeof(buf));
    buf.data = CVPixelBufferGetBaseAddress(pixelBufferOut);
    buf.height = CVPixelBufferGetHeight(pixelBufferOut);
    buf.width = CVPixelBufferGetWidth(pixelBufferOut);
    buf.rowBytes = CVPixelBufferGetBytesPerRow(pixelBufferOut);
    v26.data = CVPixelBufferGetBaseAddress(v28);
    v26.height = CVPixelBufferGetHeight(v28);
    v26.width = CVPixelBufferGetWidth(v28);
    v26.rowBytes = CVPixelBufferGetBytesPerRow(v28);
    v16 = vImageConvert_ARGB8888toRGB888(&buf, &v26, 0x10u);
    CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
    CVPixelBufferUnlockBaseAddress(v28, 0);
    if (v16)
    {
      __ABPKLogSharedInstance();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v22 = 0;
        _os_log_impl(&dword_210836000, v17, OS_LOG_TYPE_ERROR, " Could not convert ARGB to RGB ", v22, 2u);
      }

      CVPixelBufferRelease(pixelBufferOut);
      CVPixelBufferRelease(v28);
      v10 = 4294960633;
    }
    else
    {
      CVPixelBufferLockBaseAddress(v28, 0);
      Width = CVPixelBufferGetWidth(v28);
      *(_QWORD *)v22 = 0;
      v23 = Width | ((unint64_t)CVPixelBufferGetHeight(v28) << 32);
      v24 = (CVPixelBufferGetBytesPerRowOfPlane(v28, 0) << 32) | 3;
      BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(v28, 0);
      objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
      LOBYTE(Width) = cva::imwrite<cva::Matrix<unsigned char,3u,1u,false>>();
      CVPixelBufferUnlockBaseAddress(v28, 0);
      CVPixelBufferRelease(v28);
      CVPixelBufferRelease(pixelBufferOut);
      if ((Width & 1) != 0)
      {
        v10 = 0;
      }
      else
      {
        __ABPKLogSharedInstance();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v21 = 0;
          _os_log_impl(&dword_210836000, v19, OS_LOG_TYPE_ERROR, " Could not save image to file ", v21, 2u);
        }

        v10 = 4294960636;
      }
    }
  }
LABEL_42:

  return v10;
}

void sub_210859C94(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t convertFormatYCbCrToARGB(__CVBuffer *a1, CVPixelBufferRef *a2)
{
  OSType PixelFormatType;
  int Width;
  int Height;
  int v7;
  OSType v8;
  int v9;
  int v10;
  int32x2_t v11;
  int32x2_t v12;
  const vImage_YpCbCrToARGBMatrix *v13;
  int8x8_t v14;
  int32_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v21;
  uint8_t v22[16];
  vImage_Buffer dest;
  vImage_Buffer srcCbCr;
  vImage_Buffer buf;
  vImage_YpCbCrPixelRange pixelRange;
  uint8_t permuteMap[4];
  vImage_YpCbCrToARGB outInfo;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  Width = CVPixelBufferGetWidth(a1);
  Height = CVPixelBufferGetHeight(a1);
  if (a1)
  {
    v7 = Height;
    v8 = CVPixelBufferGetPixelFormatType(*a2);
    v9 = CVPixelBufferGetWidth(*a2);
    v10 = CVPixelBufferGetHeight(*a2);
    if (v8 == 32)
    {
      if (v10 == v7 && v9 == Width)
      {
        CVPixelBufferLockBaseAddress(*a2, 0);
        CVPixelBufferLockBaseAddress(a1, 0);
        v13 = (const vImage_YpCbCrToARGBMatrix *)*MEMORY[0x24BDB3BC0];
        *(_DWORD *)permuteMap = 50462976;
        if ((PixelFormatType | 0x10) == 0x34323076)
        {
          v11.i32[0] = 875704422;
          v12.i32[0] = PixelFormatType;
          v14 = vbsl_s8((int8x8_t)vdup_lane_s32(vceq_s32(v12, v11), 0), (int8x8_t)0x1000000FFLL, (int8x8_t)0x10000000EBLL);
          pixelRange.Yp_bias = 16 * (PixelFormatType != 875704422);
          pixelRange.CbCr_bias = 128;
          pixelRange.YpRangeMax = v14.i32[0];
          if (PixelFormatType == 875704422)
            v15 = 255;
          else
            v15 = 240;
          pixelRange.CbCrRangeMax = v15;
          *(int8x8_t *)&pixelRange.YpMax = v14;
          pixelRange.CbCrMax = v15;
          pixelRange.CbCrMin = 16 * (PixelFormatType != 875704422);
          if (vImageConvert_YpCbCrToARGB_GenerateConversion(v13, &pixelRange, &outInfo, kvImage420Yp8_CbCr8, kvImageARGB8888, 0))
          {
            __ABPKLogSharedInstance();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              LOWORD(buf.data) = 0;
              _os_log_impl(&dword_210836000, v16, OS_LOG_TYPE_ERROR, " Could not generate the conversion format ", (uint8_t *)&buf, 2u);
            }

          }
          memset(&buf, 0, sizeof(buf));
          __convertFormatYCbCrToARGB_block_invoke(a1, 0, (uint64_t)&buf);
          memset(&srcCbCr, 0, sizeof(srcCbCr));
          __convertFormatYCbCrToARGB_block_invoke(a1, 1uLL, (uint64_t)&srcCbCr);
          memset(&dest, 0, sizeof(dest));
          __convertFormatYCbCrToARGB_block_invoke(*a2, 0, (uint64_t)&dest);
          if (!vImageConvert_420Yp8_CbCr8ToARGB8888(&buf, &srcCbCr, &dest, &outInfo, permuteMap, 0xFFu, 0))
          {
            v19 = 0;
            goto LABEL_32;
          }
          __ABPKLogSharedInstance();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v22 = 0;
            _os_log_impl(&dword_210836000, v17, OS_LOG_TYPE_ERROR, " Could not convert color formats ", v22, 2u);
          }

        }
        else
        {
          __ABPKLogSharedInstance();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)outInfo.opaque = 0;
            _os_log_impl(&dword_210836000, v21, OS_LOG_TYPE_ERROR, " Pixel format not supported ", outInfo.opaque, 2u);
          }

        }
        v19 = 4294960636;
LABEL_32:
        CVPixelBufferUnlockBaseAddress(*a2, 0);
        CVPixelBufferUnlockBaseAddress(a1, 0);
        return v19;
      }
      __ABPKLogSharedInstance();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)outInfo.opaque = 0;
        _os_log_impl(&dword_210836000, v18, OS_LOG_TYPE_ERROR, " Output pixel buffer must have same dimensions as input pixel buffer ", outInfo.opaque, 2u);
      }
    }
    else
    {
      __ABPKLogSharedInstance();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)outInfo.opaque = 0;
        _os_log_impl(&dword_210836000, v18, OS_LOG_TYPE_ERROR, " Output pixel buffer must have format kCVPixelFormatType_32ARGB ", outInfo.opaque, 2u);
      }
    }
  }
  else
  {
    __ABPKLogSharedInstance();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)outInfo.opaque = 0;
      _os_log_impl(&dword_210836000, v18, OS_LOG_TYPE_ERROR, " Input buffer cannot be null ", outInfo.opaque, 2u);
    }
  }

  return 0;
}

uint64_t changeChannelsARGB(__CVBuffer *a1, CVPixelBufferRef *a2)
{
  vImage_Error v4;
  NSObject *v5;
  uint8_t v7[12];
  uint8_t permuteMap[4];
  vImage_Buffer dest;
  vImage_Buffer src;

  CVPixelBufferLockBaseAddress(a1, 0);
  CVPixelBufferLockBaseAddress(*a2, 0);
  memset(&src, 0, sizeof(src));
  wrapCVPixelBufferVImage(a1, &src.data);
  memset(&dest, 0, sizeof(dest));
  wrapCVPixelBufferVImage(*a2, &dest.data);
  *(_DWORD *)permuteMap = 66051;
  v4 = vImagePermuteChannels_ARGB8888(&src, &dest, permuteMap, 0);
  CVPixelBufferUnlockBaseAddress(*a2, 0);
  CVPixelBufferUnlockBaseAddress(a1, 0);
  if (!v4)
    return 0;
  __ABPKLogSharedInstance();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_210836000, v5, OS_LOG_TYPE_ERROR, " Could not convert ARGB to RGB ", v7, 2u);
  }

  return 4294960633;
}

uint64_t saveDepthBufferToFile(__CVBuffer *a1, void *a2, float a3)
{
  id v5;
  __int128 v6;
  __int128 v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  BOOL v16;
  uint64_t v17;
  float v18;
  _BOOL4 v19;
  unsigned int v20;
  unsigned int v21;
  BOOL v22;
  int v23;
  id v24;
  void *v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  unint64_t v30;

  v5 = a2;
  CVPixelBufferLockBaseAddress(a1, 0);
  v27 = 0u;
  v28 = 0u;
  wrapCVPixelBufferVImage(a1, (void **)&v27);
  v6 = v28;
  v7 = v27;
  v8 = v28 | ((unint64_t)DWORD2(v27) << 32);
  v9 = (((_QWORD)v28 << 33) + 0xF00000000) & 0xFFFFFFF000000000;
  v29 = v9 | 2;
  v30 = v8;
  v10 = (char *)cva::Array<unsigned short,2u,16u>::allocate((uint64_t)&v30, (uint64_t)&v29);
  v26 = v10;
  if ((_DWORD)v6)
  {
    v11 = 0;
    do
    {
      if (DWORD2(v7))
      {
        v12 = 0;
        do
        {
          v13 = 0;
          v29 = v11 | (v12 << 32);
          v30 = v8;
          do
          {
            v14 = *(_DWORD *)((char *)&v29 + v13);
            v15 = *(_DWORD *)((char *)&v30 + v13);
            v16 = v14 >= v15 || v13 == 4;
            v13 += 4;
          }
          while (!v16);
          if (v14 >= v15)
            goto LABEL_28;
          v17 = 0;
          v18 = *(float *)(v7 + (4 * v11 + v12 * DWORD2(v6))) * a3;
          v19 = v18 < 0.0;
          if (v18 > 65535.0)
            v19 = 1;
          v29 = v11 | (v12 << 32);
          v30 = v8;
          do
          {
            v20 = *(_DWORD *)((char *)&v29 + v17);
            v21 = *(_DWORD *)((char *)&v30 + v17);
            v22 = v20 >= v21 || v17 == 4;
            v17 += 4;
          }
          while (!v22);
          if (v20 >= v21)
LABEL_28:
            __assert_rtn("operator[]", "arrayview.h", 267, "(check_bounds(*this, idx)) || cva::detail::assertMessage(\"Index out of bounds!\")");
          v23 = (int)v18;
          if (v19)
            LOWORD(v23) = 0;
          *(_WORD *)&v10[(2 * (_DWORD)v11 + HIDWORD(v9) * (_DWORD)v12++) & 0xFFFFFFFE] = v23;
        }
        while (v12 != DWORD2(v7));
      }
      ++v11;
    }
    while (v11 != v6);
  }
  v24 = objc_retainAutorelease(v5);
  objc_msgSend(v24, "UTF8String", 0, v8, v9 | 2);
  cva::imwrite<unsigned short>();
  CVPixelBufferUnlockBaseAddress(a1, 0);
  if (v26)
    free(v26);

  return 0;
}

void sub_21085A3A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

size_t __convertFormatYCbCrToARGB_block_invoke@<X0>(CVPixelBufferRef pixelBuffer@<X1>, size_t planeIndex@<X2>, uint64_t a3@<X8>)
{
  size_t result;

  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_QWORD *)a3 = CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, planeIndex);
  *(_QWORD *)(a3 + 8) = CVPixelBufferGetHeightOfPlane(pixelBuffer, planeIndex);
  *(_QWORD *)(a3 + 16) = CVPixelBufferGetWidthOfPlane(pixelBuffer, planeIndex);
  result = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, planeIndex);
  *(_QWORD *)(a3 + 24) = result;
  return result;
}

uint64_t convertFormatYCbCrToBGRA(__CVBuffer *a1, CVPixelBufferRef *a2)
{
  OSType PixelFormatType;
  int Width;
  int Height;
  int v7;
  OSType v8;
  int v9;
  int v10;
  int32x2_t v11;
  int32x2_t v12;
  const vImage_YpCbCrToARGBMatrix *v13;
  int8x8_t v14;
  int32_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v21;
  uint8_t v22[16];
  vImage_Buffer dest;
  vImage_Buffer srcCbCr;
  vImage_Buffer buf;
  vImage_YpCbCrPixelRange pixelRange;
  uint8_t permuteMap[4];
  vImage_YpCbCrToARGB outInfo;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  Width = CVPixelBufferGetWidth(a1);
  Height = CVPixelBufferGetHeight(a1);
  if (a1)
  {
    v7 = Height;
    v8 = CVPixelBufferGetPixelFormatType(*a2);
    v9 = CVPixelBufferGetWidth(*a2);
    v10 = CVPixelBufferGetHeight(*a2);
    if (v8 == 1111970369)
    {
      if (v10 == v7 && v9 == Width)
      {
        CVPixelBufferLockBaseAddress(*a2, 0);
        CVPixelBufferLockBaseAddress(a1, 0);
        v13 = (const vImage_YpCbCrToARGBMatrix *)*MEMORY[0x24BDB3BC0];
        *(_DWORD *)permuteMap = 66051;
        if ((PixelFormatType | 0x10) == 0x34323076)
        {
          v11.i32[0] = 875704422;
          v12.i32[0] = PixelFormatType;
          v14 = vbsl_s8((int8x8_t)vdup_lane_s32(vceq_s32(v12, v11), 0), (int8x8_t)0x1000000FFLL, (int8x8_t)0x10000000EBLL);
          pixelRange.Yp_bias = 16 * (PixelFormatType != 875704422);
          pixelRange.CbCr_bias = 128;
          pixelRange.YpRangeMax = v14.i32[0];
          if (PixelFormatType == 875704422)
            v15 = 255;
          else
            v15 = 240;
          pixelRange.CbCrRangeMax = v15;
          *(int8x8_t *)&pixelRange.YpMax = v14;
          pixelRange.CbCrMax = v15;
          pixelRange.CbCrMin = 16 * (PixelFormatType != 875704422);
          if (vImageConvert_YpCbCrToARGB_GenerateConversion(v13, &pixelRange, &outInfo, kvImage420Yp8_CbCr8, kvImageARGB8888, 0))
          {
            __ABPKLogSharedInstance();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              LOWORD(buf.data) = 0;
              _os_log_impl(&dword_210836000, v16, OS_LOG_TYPE_ERROR, " Could not generate the conversion format ", (uint8_t *)&buf, 2u);
            }

          }
          memset(&buf, 0, sizeof(buf));
          __convertFormatYCbCrToARGB_block_invoke(a1, 0, (uint64_t)&buf);
          memset(&srcCbCr, 0, sizeof(srcCbCr));
          __convertFormatYCbCrToARGB_block_invoke(a1, 1uLL, (uint64_t)&srcCbCr);
          memset(&dest, 0, sizeof(dest));
          __convertFormatYCbCrToARGB_block_invoke(*a2, 0, (uint64_t)&dest);
          if (!vImageConvert_420Yp8_CbCr8ToARGB8888(&buf, &srcCbCr, &dest, &outInfo, permuteMap, 0xFFu, 0))
          {
            v19 = 0;
            goto LABEL_32;
          }
          __ABPKLogSharedInstance();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v22 = 0;
            _os_log_impl(&dword_210836000, v17, OS_LOG_TYPE_ERROR, " Could not convert color formats ", v22, 2u);
          }

        }
        else
        {
          __ABPKLogSharedInstance();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)outInfo.opaque = 0;
            _os_log_impl(&dword_210836000, v21, OS_LOG_TYPE_ERROR, " Pixel format not supported ", outInfo.opaque, 2u);
          }

        }
        v19 = 4294960636;
LABEL_32:
        CVPixelBufferUnlockBaseAddress(*a2, 0);
        CVPixelBufferUnlockBaseAddress(a1, 0);
        return v19;
      }
      __ABPKLogSharedInstance();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)outInfo.opaque = 0;
        _os_log_impl(&dword_210836000, v18, OS_LOG_TYPE_ERROR, " Output pixel buffer must have same dimensions as input pixel buffer ", outInfo.opaque, 2u);
      }
    }
    else
    {
      __ABPKLogSharedInstance();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)outInfo.opaque = 0;
        _os_log_impl(&dword_210836000, v18, OS_LOG_TYPE_ERROR, " Output pixel buffer must have format kCVPixelFormatType_32BGRA ", outInfo.opaque, 2u);
      }
    }
  }
  else
  {
    __ABPKLogSharedInstance();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)outInfo.opaque = 0;
      _os_log_impl(&dword_210836000, v18, OS_LOG_TYPE_ERROR, " Input buffer cannot be null ", outInfo.opaque, 2u);
    }
  }

  return 0;
}

uint64_t convertFormatGrayscaleToYCbCr(__CVBuffer *a1, CVPixelBufferRef *a2)
{
  size_t Width;
  size_t Height;
  const __CFDictionary *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint64_t v10;
  uint8_t v12[16];
  CVPixelBufferRef pixelBufferOut;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  if (CVPixelBufferGetPixelFormatType(a1) == 1278226488)
  {
    if (CVPixelBufferGetPixelFormatType(*a2) == 875704422 || CVPixelBufferGetPixelFormatType(*a2) == 875704438)
    {
      pixelBufferOut = 0;
      Width = CVPixelBufferGetWidth(a1);
      Height = CVPixelBufferGetHeight(a1);
      v14 = *MEMORY[0x24BDC5668];
      v15[0] = MEMORY[0x24BDBD1B8];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], Width, Height, 0x20u, v6, &pixelBufferOut))
      {
        __ABPKLogSharedInstance();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v12 = 0;
          v8 = " Could not create pixelBuffer for kCVPixelFormatType_32ARGB. ";
LABEL_13:
          _os_log_impl(&dword_210836000, v7, OS_LOG_TYPE_ERROR, v8, v12, 2u);
        }
      }
      else
      {
        convertFormatGrayScaleToARGB_BGRA(a1, &pixelBufferOut);
        if (!convertFormatARGBToYCbCr(pixelBufferOut, a2))
        {
          CVPixelBufferRelease(pixelBufferOut);
          v10 = 0;
          goto LABEL_15;
        }
        __ABPKLogSharedInstance();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v12 = 0;
          v8 = " Could not convert pixelBuffer from ARGB->YCbCr ";
          goto LABEL_13;
        }
      }

      CVPixelBufferRelease(pixelBufferOut);
      v10 = 4294960636;
LABEL_15:

      return v10;
    }
    __ABPKLogSharedInstance();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(pixelBufferOut) = 0;
      _os_log_impl(&dword_210836000, v9, OS_LOG_TYPE_ERROR, " Output pixel buffer must have format kCVPixelFormatType_420YpCbCr8BiPlanarFullRange or kCVPixelFormatType_420YpCbCr8BiPlanarVideoRange ", (uint8_t *)&pixelBufferOut, 2u);
    }
  }
  else
  {
    __ABPKLogSharedInstance();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(pixelBufferOut) = 0;
      _os_log_impl(&dword_210836000, v9, OS_LOG_TYPE_ERROR, " Input pixel buffer must have format kCVPixelFormatType_OneComponent8 ", (uint8_t *)&pixelBufferOut, 2u);
    }
  }

  return 4294960635;
}

void sub_21085AA88(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t convertFormatGrayScaleToARGB_BGRA(__CVBuffer *a1, CVPixelBufferRef *a2)
{
  vImage_Buffer v5;
  vImage_Buffer dest;

  CVPixelBufferLockBaseAddress(a1, 0);
  CVPixelBufferLockBaseAddress(*a2, 0);
  dest.data = CVPixelBufferGetBaseAddress(*a2);
  dest.height = CVPixelBufferGetHeight(*a2);
  dest.width = CVPixelBufferGetWidth(*a2);
  dest.rowBytes = CVPixelBufferGetBytesPerRow(*a2);
  v5.data = CVPixelBufferGetBaseAddress(a1);
  v5.height = CVPixelBufferGetHeight(a1);
  v5.width = CVPixelBufferGetWidth(a1);
  v5.rowBytes = CVPixelBufferGetBytesPerRow(a1);
  vImageOverwriteChannels_ARGB8888(&v5, &dest, &dest, 2u, 0x10u);
  vImageOverwriteChannels_ARGB8888(&v5, &dest, &dest, 4u, 0x10u);
  vImageOverwriteChannels_ARGB8888(&v5, &dest, &dest, 8u, 0x10u);
  vImageOverwriteChannelsWithScalar_ARGB8888(0xFFu, &dest, &dest, 1u, 0x10u);
  CVPixelBufferUnlockBaseAddress(a1, 0);
  CVPixelBufferUnlockBaseAddress(*a2, 0);
  return 0;
}

uint64_t cropImage(__CVBuffer *a1, CVPixelBufferRef *a2, unsigned int *a3)
{
  uint64_t v5;
  uint64_t v6;
  vImagePixelCount v7;
  vImagePixelCount v8;
  char *BaseAddress;
  vImage_Error v10;
  NSObject *v11;
  uint8_t v13[16];
  vImage_Buffer dest;
  vImage_Buffer src;

  v5 = *a3;
  v6 = a3[1];
  v7 = a3[2];
  v8 = a3[3];
  CVPixelBufferLockBaseAddress(a1, 0);
  CVPixelBufferLockBaseAddress(*a2, 0);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a1);
  src.width = v8;
  src.rowBytes = CVPixelBufferGetBytesPerRow(a1);
  src.data = &BaseAddress[4 * v6 + src.rowBytes * v5];
  src.height = v7;
  memset(&dest, 0, sizeof(dest));
  wrapCVPixelBufferVImage(*a2, &dest.data);
  v10 = vImageScale_ARGB8888(&src, &dest, 0, 0);
  CVPixelBufferUnlockBaseAddress(a1, 0);
  CVPixelBufferUnlockBaseAddress(*a2, 0);
  if (!v10)
    return 0;
  __ABPKLogSharedInstance();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_210836000, v11, OS_LOG_TYPE_ERROR, " Could not crop image ", v13, 2u);
  }

  return 4294960633;
}

uint64_t flipImage(__CVBuffer *a1, CVPixelBufferRef *a2)
{
  vImage_Error v4;
  NSObject *v5;
  uint8_t v7[16];
  vImage_Buffer dest;
  vImage_Buffer src;

  CVPixelBufferLockBaseAddress(a1, 0);
  CVPixelBufferLockBaseAddress(*a2, 0);
  memset(&src, 0, sizeof(src));
  wrapCVPixelBufferVImage(a1, &src.data);
  memset(&dest, 0, sizeof(dest));
  wrapCVPixelBufferVImage(*a2, &dest.data);
  v4 = vImageVerticalReflect_ARGB8888(&src, &dest, 0x10u);
  CVPixelBufferUnlockBaseAddress(*a2, 0);
  CVPixelBufferUnlockBaseAddress(a1, 0);
  if (!v4)
    return 0;
  __ABPKLogSharedInstance();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_210836000, v5, OS_LOG_TYPE_ERROR, " Could not flip image ", v7, 2u);
  }

  return 4294960633;
}

uint64_t rotateImage90(__CVBuffer *a1, int a2, CVPixelBufferRef *a3)
{
  uint8_t v6;
  NSObject *v7;
  const char *v8;
  vImage_Error v9;
  uint8_t v11[16];
  vImage_Buffer dest;
  vImage_Buffer src;

  CVPixelBufferLockBaseAddress(a1, 0);
  CVPixelBufferLockBaseAddress(*a3, 0);
  memset(&src, 0, sizeof(src));
  wrapCVPixelBufferVImage(a1, &src.data);
  memset(&dest, 0, sizeof(dest));
  wrapCVPixelBufferVImage(*a3, &dest.data);
  v6 = 0;
  if (a2 > 89)
  {
    if (a2 <= 269)
    {
      if (a2 != 90)
      {
        if (a2 != 180)
          goto LABEL_15;
LABEL_9:
        v6 = 2;
        goto LABEL_19;
      }
      goto LABEL_17;
    }
    if (a2 != 270)
    {
      if (a2 != 360)
        goto LABEL_15;
      goto LABEL_19;
    }
LABEL_18:
    v6 = 1;
    goto LABEL_19;
  }
  if (a2 <= -91)
  {
    if (a2 != -270)
    {
      if (a2 != -180)
        goto LABEL_15;
      goto LABEL_9;
    }
LABEL_17:
    v6 = 3;
    goto LABEL_19;
  }
  if (a2 == -90)
    goto LABEL_18;
  if (a2)
  {
LABEL_15:
    __ABPKLogSharedInstance();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      v8 = " Invalid rotation angle specified ";
LABEL_22:
      _os_log_impl(&dword_210836000, v7, OS_LOG_TYPE_ERROR, v8, v11, 2u);
      goto LABEL_23;
    }
    goto LABEL_23;
  }
LABEL_19:
  v9 = vImageRotate90_ARGB8888(&src, &dest, v6, rotateImage90::bgColor, 0x10u);
  CVPixelBufferUnlockBaseAddress(*a3, 0);
  CVPixelBufferUnlockBaseAddress(a1, 0);
  if (v9)
  {
    __ABPKLogSharedInstance();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      v8 = " Could not rotate image ";
      goto LABEL_22;
    }
LABEL_23:

    return 4294960633;
  }
  return 0;
}

uint64_t scaleImage(__CVBuffer *a1, CVPixelBufferRef *a2)
{
  vImage_Error v4;
  NSObject *v5;
  uint8_t v7[16];
  vImage_Buffer dest;
  vImage_Buffer src;

  CVPixelBufferLockBaseAddress(a1, 0);
  CVPixelBufferLockBaseAddress(*a2, 0);
  memset(&src, 0, sizeof(src));
  wrapCVPixelBufferVImage(a1, &src.data);
  memset(&dest, 0, sizeof(dest));
  wrapCVPixelBufferVImage(*a2, &dest.data);
  v4 = vImageScale_ARGB8888(&src, &dest, 0, 0);
  CVPixelBufferUnlockBaseAddress(*a2, 0);
  CVPixelBufferUnlockBaseAddress(a1, 0);
  if (!v4)
    return 0;
  __ABPKLogSharedInstance();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_210836000, v5, OS_LOG_TYPE_ERROR, " Could not scale image ", v7, 2u);
  }

  return 4294960633;
}

uint64_t padImage(__CVBuffer *a1, CVPixelBufferRef *a2, uint64_t a3, uint64_t a4)
{
  OSType PixelFormatType;
  size_t BytesPerRow;
  char *BaseAddress;
  size_t Height;
  size_t v12;
  char *v13;
  char *v14;

  CVPixelBufferLockBaseAddress(a1, 0);
  CVPixelBufferLockBaseAddress(*a2, 0);
  PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a1);
  Height = CVPixelBufferGetHeight(a1);
  v12 = CVPixelBufferGetBytesPerRow(*a2);
  v13 = (char *)CVPixelBufferGetBaseAddress(*a2);
  if (Height)
  {
    v14 = &v13[(a4 << (2 * (PixelFormatType != 1278226488))) + v12 * a3];
    do
    {
      memcpy(v14, BaseAddress, BytesPerRow);
      v14 += v12;
      BaseAddress += BytesPerRow;
      --Height;
    }
    while (Height);
  }
  CVPixelBufferUnlockBaseAddress(a1, 0);
  CVPixelBufferUnlockBaseAddress(*a2, 0);
  return 0;
}

void reprojectOnImage(uint64_t a1, uint64_t a2, void *a3, float a4, double a5, double a6, float32x4_t a7, float32x4_t a8, float32x4_t a9, float32x4_t a10)
{
  id v12;
  uint64_t v13;
  float32x4_t v15;
  float32x4_t v16;
  float v17;
  void *v18;
  double v25;
  void *v26;
  void *v27;
  int v34;
  __int32 v35;
  _QWORD v36[3];

  v34 = HIDWORD(a5);
  v36[2] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  if (a2)
  {
    v13 = 0;
    _S8 = v34;
    do
    {
      *(double *)v15.i64 = transform_point(a7, a8, a9, a10, *(float32x4_t *)(a1 + 16 * v13));
      v16 = v15;
      v17 = v15.f32[2];
      v15.i32[1] = HIDWORD(a6);
      v35 = v16.i32[1];
      v15.f32[0] = vmlas_n_f32(vmuls_lane_f32(*(float *)&a6, v16, 2), a4, v16.f32[0]) / v15.f32[2];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", *(double *)v15.i64);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      _V1.S[1] = v35;
      __asm { FMLA            S0, S8, V1.S[1] }
      *(float *)&v25 = _S0 / v17;
      v36[0] = v18;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v36[1] = v26;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:atIndexedSubscript:", v27, v13);

      ++v13;
    }
    while (a2 != v13);
  }

}

void sub_21085B2BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

id normalize2dKeypoints(NSMutableArray *a1, CGSize a2)
{
  double height;
  double width;
  NSMutableArray *v4;
  unint64_t i;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  float v14;
  void *v15;
  void *v16;
  id v18;
  _QWORD v19[3];

  height = a2.height;
  width = a2.width;
  v19[2] = *MEMORY[0x24BDAC8D0];
  v4 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSMutableArray count](v4, "count"));
  v18 = (id)objc_claimAutoreleasedReturnValue();
  for (i = 0; -[NSMutableArray count](v4, "count", v18) > i; ++i)
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    -[NSMutableArray objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", i);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    objc_msgSend(v6, "numberWithDouble:", v9 / width);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v10;
    v11 = (void *)MEMORY[0x24BDD16E0];
    -[NSMutableArray objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", i);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "floatValue");
    objc_msgSend(v11, "numberWithDouble:", v14 / height);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:atIndexedSubscript:", v16, i);

  }
  return v18;
}

void sub_21085B4A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t overlay2dSkeleton(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, double a6)
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;

  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = (void *)objc_opt_new();
  v14 = objc_msgSend(v13, "generateStickFigureImageFrom:detectedBodies2d:confidences:skeletonDefinition:overlayImage:color:faceOnly:", a1, v10, v11, v12, a5, 0, a6);

  return v14;
}

void sub_21085B5C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

uint64_t overlay2dBoundingBox(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7)
{
  void *v13;
  uint64_t v14;

  v13 = (void *)objc_opt_new();
  v14 = objc_msgSend(v13, "drawBoundingBox:withColor:OnImage:andGenerateOverlayImage:", a1, a2, a3, a4, a5, a6, a7);

  return v14;
}

void sub_21085B674(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t overlay2dFace(uint64_t a1, void *a2, void *a3, uint64_t a4, __n128 a5)
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v17;
  uint8_t buf[16];

  v8 = a2;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  if (*(_DWORD *)objc_msgSend(v9, "visibility") == 1
    && *(_DWORD *)(objc_msgSend(v9, "visibility") + 56) == 1
    && *(_DWORD *)(objc_msgSend(v9, "visibility") + 60) == 1
    && *(_DWORD *)(objc_msgSend(v9, "visibility") + 68) == 1
    && *(_DWORD *)(objc_msgSend(v9, "visibility") + 72) == 1)
  {
    __ABPKLogSharedInstance();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210836000, v11, OS_LOG_TYPE_INFO, " Not all 5 face joints are visible. This person is probably not facing the camera at this frame. ", buf, 2u);
    }

    objc_msgSend(v9, "skeletonDefinition");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "drawFaceBbox:detectedBodies2d:skeletonDefinition:overlayImage:color:", a1, v8, v12, a4, a5.n128_f64[0]);

  }
  objc_msgSend(v9, "skeletonDefinition", *(_OWORD *)&a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v10, "generateStickFigureImageFrom:detectedBodies2d:confidences:skeletonDefinition:overlayImage:color:faceOnly:", a1, v8, 0, v13, a4, 1, v17);

  return v14;
}

void sub_21085B808(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

uint64_t overlay2dResultOnImage(void *a1, uint64_t a2, uint64_t a3, double a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  float v15;
  float v16;
  char v17;
  uint64_t v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  char v35;
  uint64_t v36;
  _QWORD v38[3];

  v38[2] = *MEMORY[0x24BDAC8D0];
  v6 = a1;
  objc_msgSend(v6, "skeletonDefinition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "jointCount");

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = a3;
  objc_msgSend(v6, "imageRes");
  v12 = v11;
  objc_msgSend(v6, "imageRes");
  if (v8)
  {
    v14 = 0;
    v15 = v12;
    v16 = v13;
    v34 = v8 - 1;
    v17 = 1;
LABEL_3:
    v35 = v17;
    v18 = (8 * v14) | 4;
    do
    {
      v19 = (void *)MEMORY[0x24BDD16E0];
      v20 = *(double *)(objc_msgSend(v6, "keypoints2d", v34) + 8 * v14);
      *(float *)&v20 = *(float *)&v20 / v15;
      objc_msgSend(v19, "numberWithFloat:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = v21;
      v22 = (void *)MEMORY[0x24BDD16E0];
      *(float *)&v23 = *(float *)(objc_msgSend(v6, "keypoints2d") + v18) / v16;
      objc_msgSend(v22, "numberWithFloat:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v38[1] = v24;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:atIndexedSubscript:", v25, v14);

      v26 = (void *)MEMORY[0x24BDD16E0];
      LODWORD(v27) = *(_DWORD *)(objc_msgSend(v6, "confidences") + 4 * v14);
      objc_msgSend(v26, "numberWithFloat:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:atIndexedSubscript:", v28, v14);

      if (*(float *)(objc_msgSend(v6, "confidences") + 4 * v14) != 0.5
        && *(float *)(objc_msgSend(v6, "confidences") + 4 * v14) != 0.0)
      {
        v17 = 0;
        if (v34 != v14++)
          goto LABEL_3;
        goto LABEL_13;
      }
      ++v14;
      v18 += 8;
    }
    while (v8 != v14);
    if ((v35 & 1) != 0)
      goto LABEL_12;
LABEL_13:
    objc_msgSend(v6, "skeletonDefinition");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = overlay2dSkeleton(a2, v9, v10, v30, v36, a4);
  }
  else
  {
LABEL_12:
    objc_msgSend(v6, "skeletonDefinition");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = overlay2dSkeleton(a2, v9, 0, v30, v36, a4);
  }
  v32 = v31;

  return v32;
}

void sub_21085BAE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

uint64_t overlay3dResultOnImage(void *a1, uint64_t a2, uint64_t a3, __n128 a4, __n128 a5, __n128 a6, CGFloat a7, CGFloat a8, __n128 a9)
{
  id v13;
  void *v14;
  uint64_t v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  __n128 v29;
  double v30;
  __n128 v31;
  __n128 v32;
  __n128 v33;
  void *__p[3];
  CGSize v35;

  v29 = a9;
  v31 = a4;
  v32 = a5;
  v33 = a6;
  v13 = a1;
  objc_msgSend(v13, "skeletonDefinition");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "jointCount");

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v15);
  v16 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEEC2Em(__p, v15);
  if (v15)
  {
    v17 = 0;
    v18 = 48;
    do
    {
      v19 = objc_msgSend(v13, "modelPoses", *(_OWORD *)&v29, *(_OWORD *)&v31, *(_OWORD *)&v32, *(_OWORD *)&v33);
      *((_OWORD *)__p[0] + v17++) = *(_OWORD *)(v19 + v18);
      v18 += 64;
    }
    while (v15 != v17);
  }
  v20 = __p[0];
  objc_msgSend(v13, "cameraRootTransform", v29.n128_u64[0]);
  reprojectOnImage((uint64_t)v20, v15, v16, v31.n128_f32[0], v32.n128_f64[0], v33.n128_f64[0], v21, v22, v23, v24);
  v35.width = a7;
  v35.height = a8;
  normalize2dKeypoints(v16, v35);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "skeletonDefinition");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = overlay2dSkeleton(a2, v25, 0, v26, a3, v30);

  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  return v27;
}

void sub_21085BCF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19)
{
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

uint64_t drawFullyVisibleFace(void *a1, uint64_t a2, uint64_t a3, __n128 a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  float v14;
  float v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v6 = a1;
  objc_msgSend(v6, "skeletonDefinition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "jointCount");

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageRes");
  v11 = v10;
  objc_msgSend(v6, "imageRes");
  if (v8)
  {
    v13 = 0;
    v14 = v11;
    v15 = v12;
    do
    {
      v16 = (void *)MEMORY[0x24BDD16E0];
      v17 = *(double *)(objc_msgSend(v6, "keypoints2d") + 8 * v13);
      *(float *)&v17 = *(float *)&v17 / v14;
      objc_msgSend(v16, "numberWithFloat:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v18;
      v19 = (void *)MEMORY[0x24BDD16E0];
      *(float *)&v20 = *(float *)(objc_msgSend(v6, "keypoints2d") + 8 * v13 + 4) / v15;
      objc_msgSend(v19, "numberWithFloat:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v26[1] = v21;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:atIndexedSubscript:", v22, v13);

      ++v13;
    }
    while (v13 != v8);
  }
  v23 = overlay2dFace(a2, v9, v6, a3, a4);

  return v23;
}

void sub_21085BEF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

BOOL transferCVPixelBuffer(__CVBuffer *a1, __CVBuffer *a2)
{
  OSStatus v4;
  NSObject *v5;
  uint8_t v7[8];
  VTPixelTransferSessionRef pixelTransferSessionOut;

  pixelTransferSessionOut = 0;
  VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], &pixelTransferSessionOut);
  v4 = VTPixelTransferSessionTransferImage(pixelTransferSessionOut, a1, a2);
  if (v4)
  {
    __ABPKLogSharedInstance();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_210836000, v5, OS_LOG_TYPE_ERROR, " Could not transfer image. ", v7, 2u);
    }

  }
  else
  {
    VTPixelTransferSessionInvalidate(pixelTransferSessionOut);
  }
  return v4 == 0;
}

uint64_t convert16BitDepthToFloat32Depth(__CVBuffer *a1, __CVBuffer *a2)
{
  OSType PixelFormatType;
  OSType v5;
  BOOL v6;
  uint64_t v7;
  size_t BytesPerRow;
  size_t v9;
  size_t Height;
  size_t Width;
  unsigned __int16 *BaseAddress;
  float *v13;
  uint64_t i;
  size_t v15;
  float *v16;
  unsigned __int16 *j;
  unsigned int v18;
  NSObject *v19;
  uint8_t v22[16];

  PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  v5 = CVPixelBufferGetPixelFormatType(a2);
  v6 = PixelFormatType == 1278226742 && v5 == 1717855600;
  v7 = v6;
  if (v6)
  {
    BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
    v9 = CVPixelBufferGetBytesPerRow(a2);
    Height = CVPixelBufferGetHeight(a2);
    Width = CVPixelBufferGetWidth(a2);
    CVPixelBufferLockBaseAddress(a1, 0);
    CVPixelBufferLockBaseAddress(a2, 0);
    BaseAddress = (unsigned __int16 *)CVPixelBufferGetBaseAddress(a1);
    v13 = (float *)CVPixelBufferGetBaseAddress(a2);
    if (Height)
    {
      for (i = 0; i != Height; ++i)
      {
        v15 = Width;
        v16 = v13;
        for (j = BaseAddress; v15; --v15)
        {
          v18 = *j++;
          *v16++ = (float)v18 / 10000.0;
        }
        BaseAddress = (unsigned __int16 *)((char *)BaseAddress + BytesPerRow);
        v13 = (float *)((char *)v13 + v9);
      }
    }
    CVPixelBufferUnlockBaseAddress(a1, 0);
    CVPixelBufferUnlockBaseAddress(a2, 0);
  }
  else
  {
    __ABPKLogSharedInstance();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_210836000, v19, OS_LOG_TYPE_ERROR, " Source buffer must have pixel format kCVPixelFormatType_OneComponent16 and destination buffer kCVPixelFormatType_DepthFloat32. ", v22, 2u);
    }

  }
  return v7;
}

uint64_t unWrapOneComponent16BufferDepth32BitsBuffer(__CVBuffer *a1, __CVBuffer *a2)
{
  OSType PixelFormatType;
  OSType v5;
  size_t BytesPerRow;
  size_t Height;
  size_t Width;
  size_t v9;
  size_t v10;
  size_t v11;
  size_t v12;
  char *BaseAddress;
  char *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  uint8_t *v18;
  uint64_t i;
  uint64_t v21;
  size_t v22;
  __int16 v23;
  __int16 v24;
  __int16 v25;

  PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  v5 = CVPixelBufferGetPixelFormatType(a2);
  if (PixelFormatType != 1278226742 || v5 != 1717855600)
  {
    __ABPKLogSharedInstance();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    v25 = 0;
    v17 = " Source buffer must have pixel format kCVPixelFormatType_OneComponent16 and destination buffer kCVPixelFormatT"
          "ype_DepthFloat32. ";
    v18 = (uint8_t *)&v25;
LABEL_16:
    _os_log_impl(&dword_210836000, v16, OS_LOG_TYPE_ERROR, v17, v18, 2u);
    goto LABEL_17;
  }
  BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
  Height = CVPixelBufferGetHeight(a1);
  Width = CVPixelBufferGetWidth(a1);
  v9 = CVPixelBufferGetBytesPerRow(a2);
  v10 = CVPixelBufferGetHeight(a2);
  v11 = CVPixelBufferGetWidth(a2);
  if (Height != v10)
  {
    __ABPKLogSharedInstance();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    v24 = 0;
    v17 = " Source buffer and destination buffer must have the same height ";
    v18 = (uint8_t *)&v24;
    goto LABEL_16;
  }
  v12 = v11;
  if (Width != 2 * v11)
  {
    __ABPKLogSharedInstance();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v23 = 0;
      v17 = " Source buffer must have double the width of the source buffer ";
      v18 = (uint8_t *)&v23;
      goto LABEL_16;
    }
LABEL_17:

    return 0;
  }
  CVPixelBufferLockBaseAddress(a1, 0);
  CVPixelBufferLockBaseAddress(a2, 0);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a1);
  v14 = (char *)CVPixelBufferGetBaseAddress(a2);
  if (BytesPerRow == v9)
  {
    if (Height)
    {
      v15 = 0;
      do
      {
        memcpy(&v14[v15], &BaseAddress[v15], BytesPerRow);
        v15 += BytesPerRow;
        --Height;
      }
      while (Height);
    }
  }
  else if (Height)
  {
    for (i = 0; i != Height; ++i)
    {
      if (v12)
      {
        v21 = 0;
        v22 = v12;
        do
        {
          *(_WORD *)&v14[v21] = *(_WORD *)&BaseAddress[i * BytesPerRow + (v21 & 0xFFFFFFFC)];
          v21 += 4;
          --v22;
        }
        while (v22);
      }
      v14 += v9;
    }
  }
  CVPixelBufferUnlockBaseAddress(a1, 0);
  CVPixelBufferUnlockBaseAddress(a2, 0);
  return 1;
}

const __CFString *getPixelBufferFormatTypeAsString(__CVBuffer *a1)
{
  signed int PixelFormatType;
  const __CFString *v2;
  int v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;

  PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  v2 = &stru_24CA6F820;
  if (PixelFormatType > 1278226487)
  {
    v3 = 1278226535;
    v7 = CFSTR("kCVPixelFormatType_DepthFloat32");
    v8 = CFSTR("kCVPixelFormatType_OneComponent16");
    if (PixelFormatType != 1278226742)
      v8 = &stru_24CA6F820;
    if (PixelFormatType != 1717855600)
      v7 = v8;
    if (PixelFormatType == 1278226536)
      v6 = CFSTR("kCVPixelFormatType_OneComponent16Half");
    else
      v6 = v7;
    if (PixelFormatType == 1278226534)
      v2 = CFSTR("kCVPixelFormatType_OneComponent32Float");
    if (PixelFormatType == 1278226488)
      v2 = CFSTR("kCVPixelFormatType_OneComponent8");
  }
  else
  {
    v3 = 875704421;
    v4 = CFSTR("kCVPixelFormatType_32BGRA");
    if (PixelFormatType != 1111970369)
      v4 = &stru_24CA6F820;
    if (PixelFormatType == 875704438)
      v5 = CFSTR("kCVPixelFormatType_420YpCbCr8BiPlanarVideoRange");
    else
      v5 = v4;
    if (PixelFormatType == 875704422)
      v6 = CFSTR("kCVPixelFormatType_420YpCbCr8BiPlanarFullRange");
    else
      v6 = v5;
    if (PixelFormatType == 32)
      v2 = CFSTR("kCVPixelFormatType_32ARGB");
    if (PixelFormatType == 24)
      v2 = CFSTR("kCVPixelFormatType_24RGB");
  }
  if (PixelFormatType <= v3)
    return v2;
  else
    return v6;
}

void *cva::Array<unsigned short,2u,16u>::allocate(uint64_t a1, uint64_t a2)
{
  void *result;
  unint64_t size;

  size = *(unsigned int *)(a1 + 4) * (unint64_t)*(unsigned int *)(a2 + 4);
  if (!size)
    return 0;
  result = malloc_type_malloc(size, 0xA153FF5uLL);
  if (!result)
    cva::Array<unsigned short,2u,16u>::allocate();
  return result;
}

void printErrorCode(int a1)
{
  NSObject *v1;
  const char *v2;
  uint8_t v3[16];

  switch(a1)
  {
    case -6666:
      __ABPKLogSharedInstance();
      v1 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v3 = 0;
        v2 = " Skeleton image overlay failed ";
        goto LABEL_19;
      }
      goto LABEL_20;
    case -6665:
      __ABPKLogSharedInstance();
      v1 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v3 = 0;
        v2 = " Skeleton conversion failed ";
        goto LABEL_19;
      }
      goto LABEL_20;
    case -6664:
      __ABPKLogSharedInstance();
      v1 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v3 = 0;
        v2 = " 3d camera-bodypose registration failed ";
        goto LABEL_19;
      }
      goto LABEL_20;
    case -6663:
      goto LABEL_7;
    case -6662:
      __ABPKLogSharedInstance();
      v1 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
        goto LABEL_20;
      *(_WORD *)v3 = 0;
      v2 = " 2d-3d lifting failed ";
      goto LABEL_19;
    case -6661:
      __ABPKLogSharedInstance();
      v1 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
        goto LABEL_20;
      *(_WORD *)v3 = 0;
      v2 = " 2d Pose estimation failed ";
      goto LABEL_19;
    case -6660:
      __ABPKLogSharedInstance();
      v1 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
        goto LABEL_20;
      *(_WORD *)v3 = 0;
      v2 = " Image preprocessing failed ";
      goto LABEL_19;
    default:
      if (a1)
      {
LABEL_7:
        __ABPKLogSharedInstance();
        v1 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
          goto LABEL_20;
        *(_WORD *)v3 = 0;
        v2 = " Invalid error code ";
      }
      else
      {
        __ABPKLogSharedInstance();
        v1 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
          goto LABEL_20;
        *(_WORD *)v3 = 0;
        v2 = " Algorithm executed successfully ";
      }
LABEL_19:
      _os_log_impl(&dword_210836000, v1, OS_LOG_TYPE_DEBUG, v2, v3, 2u);
LABEL_20:

      return;
  }
}

void sub_21085D264(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

float std::deque<float>::push_back(_QWORD *a1, float *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  float result;

  v4 = a1[2];
  v5 = a1[1];
  if (v4 == v5)
    v6 = 0;
  else
    v6 = ((v4 - v5) << 7) - 1;
  v7 = a1[5];
  v8 = v7 + a1[4];
  if (v6 == v8)
  {
    std::deque<float>::__add_back_capacity(a1);
    v5 = a1[1];
    v7 = a1[5];
    v8 = a1[4] + v7;
  }
  result = *a2;
  *(float *)(*(_QWORD *)(v5 + ((v8 >> 7) & 0x1FFFFFFFFFFFFF8)) + 4 * (v8 & 0x3FF)) = *a2;
  a1[5] = v7 + 1;
  return result;
}

void sub_21085D85C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,uint64_t a28,void *a29)
{
  cva::SVD<cva::Matrix<float,0u,0u,false>,true>::~SVD(&a15);
  free(a29);
  _Unwind_Resume(a1);
}

void cva::SVD<cva::Matrix<float,0u,0u,false>,true>::inverse(_DWORD *a1@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  _DWORD *v12;
  _QWORD v13[2];
  _QWORD v14[2];
  _DWORD *v15;
  _QWORD v16[2];
  _BYTE v17[8];
  _QWORD *v18;
  _QWORD *v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v15 = a1 + 6;
  v6 = cva::SVD<cva::Matrix<float,0u,0u,false>,true>::S(a1);
  v13[0] = v6;
  v13[1] = v7;
  v9 = *a2;
  v14[0] = v13;
  v14[1] = v9;
  if (a1[10] != HIDWORD(v6))
    cva::SVD<cva::Matrix<float,0u,0u,false>,true>::inverse(v6, v7, v8);
  v16[0] = &v15;
  v16[1] = v14;
  v12 = a1;
  if (a1[5] != (_DWORD)v6)
    cva::SVD<cva::Matrix<float,0u,0u,false>,true>::inverse(v6, v7, v8);
  v10 = (a1[4] * a1[11]);
  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  cva::MatrixData<float,0ul,0ul,false>::allocate((void **)a3, v10);
  v11 = a1[4];
  *(_DWORD *)(a3 + 16) = v15[5];
  *(_DWORD *)(a3 + 20) = v11;
  v18 = v16;
  v19 = &v12;
  if (*(_DWORD *)v14[0] != a1[5])
    __assert_rtn("MatrixMultExpr", "matrixmultexpr.h", 100, "((lhs.ref().columns() == rhs.ref().rows())) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
  v20 = 1065353216;
  cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixMultExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>>>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>>(a3, (uint64_t)v17);
}

void sub_21085DA24(_Unwind_Exception *a1)
{
  void **v1;

  free(*v1);
  _Unwind_Resume(a1);
}

void **cva::SVD<cva::Matrix<float,0u,0u,false>,true>::~SVD(void **a1)
{
  free(a1[6]);
  free(a1[3]);
  free(*a1);
  return a1;
}

void cva::MatrixData<float,0ul,0ul,false>::reserve(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (*(_QWORD *)(a1 + 8) < a2)
    {
      free(*(void **)a1);
      *(_QWORD *)a1 = 0;
      cva::MatrixData<float,0ul,0ul,false>::allocate((void **)a1, a2);
    }
  }
  else
  {
    free(*(void **)a1);
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
  }
}

uint64_t cva::MatrixData<float,0ul,0ul,false>::allocate(void **a1, uint64_t a2)
{
  size_t v3;
  uint64_t result;
  void *v5;
  void *memptr;

  if (*a1)
    cva::MatrixData<int,0ul,0ul,false>::allocate();
  v3 = (4 * a2 + 31) & 0xFFFFFFFFFFFFFFE0;
  a1[1] = (void *)(v3 >> 2);
  memptr = 0;
  result = malloc_type_posix_memalign(&memptr, 0x20uLL, v3, 0x49090899uLL);
  v5 = memptr;
  *a1 = memptr;
  if (!v5)
    cva::MatrixData<float,0ul,0ul,false>::allocate();
  return result;
}

void std::deque<float>::__add_back_capacity(_QWORD *a1)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  char *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  unint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  _QWORD *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  _QWORD *v56;

  v2 = a1[4];
  v3 = v2 >= 0x400;
  v4 = v2 - 1024;
  if (v3)
  {
    v5 = (uint64_t)(a1 + 3);
    v6 = (char *)a1[3];
    a1[4] = v4;
    v7 = (_QWORD *)a1[1];
    v8 = (char *)a1[2];
    v11 = *v7;
    v9 = (char *)(v7 + 1);
    v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(_QWORD *)v8 = v10;
      a1[2] += 8;
      return;
    }
    v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1)
        v33 = 1;
      else
        v33 = (uint64_t)&v8[-*a1] >> 2;
      v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v5, v33);
      v35 = &v34[8 * (v33 >> 2)];
      v37 = &v34[8 * v36];
      v38 = (uint64_t *)a1[1];
      v8 = v35;
      v39 = a1[2] - (_QWORD)v38;
      if (v39)
      {
        v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        v40 = 8 * (v39 >> 3);
        v41 = &v34[8 * (v33 >> 2)];
        do
        {
          v42 = *v38++;
          *(_QWORD *)v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    v13 = v12 >> 3;
    v14 = v12 >> 3 < -1;
    v15 = (v12 >> 3) + 2;
    if (v14)
      v16 = v15;
    else
      v16 = v13 + 1;
    v17 = -(v16 >> 1);
    v18 = v16 >> 1;
    v19 = &v9[-8 * v18];
    v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      v9 = (char *)a1[1];
    }
    v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  v21 = a1[2];
  v22 = (v21 - a1[1]) >> 3;
  v23 = a1[3];
  v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(_QWORD *)&v54 = operator new(0x1000uLL);
      std::__split_buffer<std::pair<long,long> *,std::allocator<std::pair<long,long> *>>::push_back(a1, &v54);
      return;
    }
    *(_QWORD *)&v54 = operator new(0x1000uLL);
    std::__split_buffer<std::pair<long,long> *,std::allocator<std::pair<long,long> *>>::push_front((uint64_t)a1, &v54);
    v44 = (_QWORD *)a1[1];
    v8 = (char *)a1[2];
    v45 = *v44;
    v9 = (char *)(v44 + 1);
    v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3])
      goto LABEL_33;
    v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1)
        v46 = 1;
      else
        v46 = (uint64_t)&v8[-*a1] >> 2;
      v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(a1 + 3), v46);
      v35 = &v34[8 * (v46 >> 2)];
      v37 = &v34[8 * v47];
      v48 = (uint64_t *)a1[1];
      v8 = v35;
      v49 = a1[2] - (_QWORD)v48;
      if (v49)
      {
        v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        v50 = 8 * (v49 >> 3);
        v51 = &v34[8 * (v46 >> 2)];
        do
        {
          v52 = *v48++;
          *(_QWORD *)v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1)
    v25 = 1;
  else
    v25 = v24 >> 2;
  v56 = a1 + 3;
  *(_QWORD *)&v54 = std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(a1 + 3), v25);
  *((_QWORD *)&v54 + 1) = v54 + 8 * v22;
  *(_QWORD *)&v55 = *((_QWORD *)&v54 + 1);
  *((_QWORD *)&v55 + 1) = v54 + 8 * v26;
  v53 = operator new(0x1000uLL);
  std::__split_buffer<std::pair<long,long> *,std::allocator<std::pair<long,long> *> &>::push_back(&v54, &v53);
  v27 = (_QWORD *)a1[2];
  v28 = -7 - (_QWORD)v27;
  while (v27 != (_QWORD *)a1[1])
  {
    --v27;
    v28 += 8;
    std::__split_buffer<std::pair<long,long> *,std::allocator<std::pair<long,long> *> &>::push_front((uint64_t)&v54, v27);
  }
  v29 = (char *)*a1;
  v30 = v54;
  v31 = v55;
  *(_QWORD *)&v54 = *a1;
  *((_QWORD *)&v54 + 1) = v27;
  v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  v55 = v32;
  if (v27 != (_QWORD *)v32)
    *(_QWORD *)&v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  if (v29)
    operator delete(v29);
}

void sub_21085DF90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  void *v13;

  operator delete(v13);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t std::deque<float>::__maybe_remove_front_spare[abi:ne180100](uint64_t a1, int a2)
{
  unint64_t v2;
  int v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 < 0x400)
    a2 = 1;
  if (v2 < 0x800)
    v4 = a2;
  else
    v4 = 0;
  if ((v4 & 1) == 0)
  {
    operator delete(**(void ***)(a1 + 8));
    *(_QWORD *)(a1 + 8) += 8;
    *(_QWORD *)(a1 + 32) -= 1024;
  }
  return v4 ^ 1u;
}

uint64_t cva::SVD<cva::Matrix<float,0u,0u,false>,true>::SVD<cva::Matrix<float,0u,0u,false>>(uint64_t a1, _DWORD *a2, char a3, int a4)
{
  *(_DWORD *)(a1 + 64) = 0;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)(a1 + 72) = 0;
  *(_BYTE *)(a1 + 80) = 0;
  cva::SVD<cva::Matrix<float,0u,0u,false>,true>::decompose<cva::Matrix<float,0u,0u,false> const&>(a1, a2, a3, a4);
  return a1;
}

void sub_21085E074(_Unwind_Exception *a1)
{
  void **v1;

  free(v1[6]);
  free(v1[3]);
  free(*v1);
  _Unwind_Resume(a1);
}

void cva::SVD<cva::Matrix<float,0u,0u,false>,true>::decompose<cva::Matrix<float,0u,0u,false> const&>(uint64_t a1, _DWORD *a2, char a3, int a4)
{
  int v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a2[4];
  v6 = a2[5];
  *(_DWORD *)(a1 + 72) = v5;
  *(_DWORD *)(a1 + 76) = v6;
  if (!(v5 | v6))
  {
    *(_BYTE *)(a1 + 80) = 1;
LABEL_8:
    v7 = *(void **)(a1 + 48);
    *(_DWORD *)(a1 + 64) = 0;
    *(_QWORD *)(a1 + 48) = 0;
    *(_QWORD *)(a1 + 56) = 0;
    free(v7);
    v8 = *(void **)a1;
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
    *(_QWORD *)a1 = 0;
    free(v8);
    v9 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 32) = 0;
    *(_QWORD *)(a1 + 40) = 0;
    *(_QWORD *)(a1 + 24) = 0;
    free(v9);
    return;
  }
  if (a4 && fabsf((float)(v5 - v6)) >= (float)((float)(v6 + v5) * 0.1))
    cva::SVD<cva::Matrix<float,0u,0u,false>,true>::decomposeRectangular<cva::Matrix<float,0u,0u,false>>(a1, a2, a3);
  else
    cva::SVD<cva::Matrix<float,0u,0u,false>,true>::decomposeDirect<cva::Matrix<float,0u,0u,false>>(a1, (uint64_t)a2, a3);
  if (!*(_BYTE *)(a1 + 80))
    goto LABEL_8;
}

void cva::SVD<cva::Matrix<float,0u,0u,false>,true>::decomposeDirect<cva::Matrix<float,0u,0u,false>>(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6;
  void *__dst[3];

  v6 = (*(_DWORD *)(a2 + 20) * *(_DWORD *)(a2 + 16));
  __dst[0] = 0;
  __dst[1] = 0;
  cva::MatrixData<float,0ul,0ul,false>::allocate(__dst, v6);
  if ((_DWORD)v6)
    memcpy(__dst[0], *(const void **)a2, 4 * v6);
  __dst[2] = *(void **)(a2 + 16);
  cva::SVD<cva::Matrix<float,0u,0u,false>,true>::decomposeDirect<0u,0u>(a1, (uint64_t)__dst, a3);
  free(__dst[0]);
}

void sub_21085E1D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10)
{
  free(a10);
  _Unwind_Resume(a1);
}

void cva::SVD<cva::Matrix<float,0u,0u,false>,true>::decomposeRectangular<cva::Matrix<float,0u,0u,false>>(uint64_t a1, _DWORD *a2, int a3)
{
  char v3;
  uint64_t v6;
  float *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  float *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t *v19;
  int v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  int v33;
  int v34;
  int v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void **v53;
  void **v54;
  uint64_t **v55;
  int v56;
  uint64_t v57;

  v3 = a3;
  v57 = *MEMORY[0x24BDAC8D0];
  if (a2[5] >= a2[4])
  {
    v50 = a2;
    v53 = (void **)a2;
    v54 = &v50;
    cva::SVD<cva::Matrix<float,0u,0u,false>,true>::decomposeDirect<cva::MatrixMultExpr<cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>>>(a1, &v53, a3 != 0);
    if (!*(_BYTE *)(a1 + 80))
      return;
    v13 = *(unsigned int *)(a1 + 64);
    if ((_DWORD)v13)
    {
      v14 = *(float **)(a1 + 48);
      v15 = 4 * v13;
      do
      {
        *v14 = sqrtf(*v14);
        ++v14;
        v15 -= 4;
      }
      while (v15);
    }
    if ((v3 & 2) == 0)
      return;
    v16 = cva::SVD<cva::Matrix<float,0u,0u,false>,true>::S((_DWORD *)a1);
    v43 = v16;
    v44 = v17;
    v45 = &v43;
    v46 = 925353388;
    v47 = a1;
    if (*(_DWORD *)(a1 + 20) != (_DWORD)v16)
      cva::SVD<cva::Matrix<float,0u,0u,false>,true>::inverse(v16, (uint64_t)v17, v18);
    v48 = (uint64_t *)&v45;
    v49 = &v47;
    if (*(_DWORD *)(a1 + 16) != a2[4])
      cva::SVD<cva::Matrix<float,0u,0u,false>,true>::inverse(v16, (uint64_t)v17, v18);
    v19 = (uint64_t *)(a1 + 24);
    v20 = HIDWORD(v43);
    if (__PAIR64__(a2[5], HIDWORD(v43)) == *(_QWORD *)(a1 + 40))
    {
      v54 = (void **)&v48;
      v55 = (uint64_t **)a2;
LABEL_30:
      v56 = 1065353216;
      cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixMultExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>>>,cva::Matrix<float,0u,0u,false>>(a1 + 24, (uint64_t)&v53);
      return;
    }
    v27 = *v19;
    if (*v17 == *v19)
    {
      v28 = a2[5];
    }
    else
    {
      v28 = a2[5];
      if (*(_QWORD *)a1 != v27 && *(_QWORD *)a2 != v27)
      {
        *(_DWORD *)(a1 + 40) = HIDWORD(v43);
        *(_DWORD *)(a1 + 44) = v28;
        cva::MatrixData<float,0ul,0ul,false>::reserve(a1 + 24, (v28 * v20));
        v32 = a2[4];
        v33 = *(_DWORD *)(*v49 + 16);
        v54 = (void **)&v48;
        v55 = (uint64_t **)a2;
        if (v33 != v32)
          cva::SVD<cva::Matrix<float,0u,0u,false>,true>::inverse(v29, v30, v31);
        goto LABEL_30;
      }
    }
    v50 = 0;
    v51 = 0;
    cva::MatrixData<float,0ul,0ul,false>::allocate(&v50, (v28 * HIDWORD(v43)));
    v40 = a2[4];
    v39 = a2[5];
    LODWORD(v52) = *(_DWORD *)(*v48 + 4);
    HIDWORD(v52) = v39;
    v54 = (void **)&v48;
    v55 = (uint64_t **)a2;
    if (*(_DWORD *)(*v49 + 16) != v40)
      __assert_rtn("MatrixMultExpr", "matrixmultexpr.h", 100, "((lhs.ref().columns() == rhs.ref().rows())) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
    v56 = 1065353216;
    cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixMultExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>>>,cva::Matrix<float,0u,0u,false>>((uint64_t)&v50, (uint64_t)&v53);
    v36 = *(void **)(a1 + 24);
    v41 = *(_QWORD *)(a1 + 32);
    v42 = v51;
    *(_QWORD *)(a1 + 24) = v50;
    *(_QWORD *)(a1 + 32) = v42;
    v50 = v36;
    v51 = v41;
    *(_QWORD *)(a1 + 40) = v52;
LABEL_36:
    v52 = 0;
    free(v36);
    return;
  }
  v50 = a2;
  v53 = &v50;
  v54 = (void **)a2;
  cva::SVD<cva::Matrix<float,0u,0u,false>,true>::decomposeDirect<cva::MatrixMultExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::Matrix<float,0u,0u,false>>>(a1, (uint64_t **)&v53, 2 * (a3 != 0));
  if (*(_BYTE *)(a1 + 80))
  {
    v6 = *(unsigned int *)(a1 + 64);
    if ((_DWORD)v6)
    {
      v7 = *(float **)(a1 + 48);
      v8 = 4 * v6;
      do
      {
        *v7 = sqrtf(*v7);
        ++v7;
        v8 -= 4;
      }
      while (v8);
    }
    if ((v3 & 1) != 0)
    {
      v47 = a1 + 24;
      v9 = cva::SVD<cva::Matrix<float,0u,0u,false>,true>::S((_DWORD *)a1);
      v43 = v9;
      v44 = v10;
      v45 = &v43;
      v46 = 925353388;
      if (*(_DWORD *)(a1 + 40) != HIDWORD(v9))
        cva::SVD<cva::Matrix<float,0u,0u,false>,true>::inverse(v9, (uint64_t)v10, v11);
      v48 = &v47;
      v49 = (uint64_t *)&v45;
      if (a2[5] != *(_DWORD *)(a1 + 44))
        cva::SVD<cva::Matrix<float,0u,0u,false>,true>::inverse(v9, (uint64_t)v10, v11);
      v12 = a2[4];
      if (v12 == *(_DWORD *)(a1 + 16) && *(_DWORD *)(a1 + 20) == (_DWORD)v9)
      {
        v54 = (void **)a2;
        v55 = &v48;
LABEL_25:
        v56 = 1065353216;
        cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,0u,false>,cva::MatrixMultExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>>,cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>>>>(a1, (uint64_t)&v53);
        return;
      }
      v21 = *(void **)a1;
      if (*(_QWORD *)a2 != *(_QWORD *)a1 && *(void **)(a1 + 24) != v21 && (void *)*v10 != v21)
      {
        *(_DWORD *)(a1 + 16) = v12;
        *(_DWORD *)(a1 + 20) = v9;
        cva::MatrixData<float,0ul,0ul,false>::reserve(a1, (v12 * v9));
        v25 = a2[5];
        v26 = *(_DWORD *)(*v48 + 20);
        v54 = (void **)a2;
        v55 = &v48;
        if (v25 != v26)
          cva::SVD<cva::Matrix<float,0u,0u,false>,true>::inverse(v22, v23, v24);
        goto LABEL_25;
      }
      v50 = 0;
      v51 = 0;
      cva::MatrixData<float,0ul,0ul,false>::allocate(&v50, (v12 * v9));
      v34 = *(_DWORD *)*v49;
      v35 = a2[5];
      LODWORD(v52) = a2[4];
      HIDWORD(v52) = v34;
      v54 = (void **)a2;
      v55 = &v48;
      if (v35 != *(_DWORD *)(*v48 + 20))
        __assert_rtn("MatrixMultExpr", "matrixmultexpr.h", 100, "((lhs.ref().columns() == rhs.ref().rows())) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
      v56 = 1065353216;
      cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,0u,false>,cva::MatrixMultExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>>,cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>>>>((uint64_t)&v50, (uint64_t)&v53);
      v36 = *(void **)a1;
      v37 = *(_QWORD *)(a1 + 8);
      v38 = v51;
      *(_QWORD *)a1 = v50;
      *(_QWORD *)(a1 + 8) = v38;
      v50 = v36;
      v51 = v37;
      *(_QWORD *)(a1 + 16) = v52;
      goto LABEL_36;
    }
  }
}

void sub_21085E620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  free(a17);
  _Unwind_Resume(a1);
}

void cva::SVD<cva::Matrix<float,0u,0u,false>,true>::decomposeDirect<0u,0u>(uint64_t a1, uint64_t a2, char a3)
{
  unsigned int v5;
  unsigned int v6;
  unint64_t v7;
  void *v8;
  void **v9;
  void *v10;
  cva::Logger *v11;
  void *v12[2];
  unsigned int v13;
  int v14;
  int v15;

  v6 = *(_DWORD *)(a2 + 16);
  v5 = *(_DWORD *)(a2 + 20);
  if ((int)v5 >= (int)v6)
    v7 = v6;
  else
    v7 = v5;
  *(_DWORD *)(a1 + 64) = v7;
  cva::MatrixData<float,0ul,0ul,false>::reserve(a1 + 48, v7);
  if ((a3 & 1) != 0)
  {
    *(_DWORD *)(a1 + 16) = v6;
    *(_DWORD *)(a1 + 20) = v7;
    cva::MatrixData<float,0ul,0ul,false>::reserve(a1, v7 * v6);
  }
  else
  {
    v8 = *(void **)a1;
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
    *(_QWORD *)a1 = 0;
    free(v8);
  }
  v9 = (void **)(a1 + 24);
  if ((a3 & 2) != 0)
  {
    *(_DWORD *)(a1 + 40) = v7;
    *(_DWORD *)(a1 + 44) = v5;
    cva::MatrixData<float,0ul,0ul,false>::reserve(a1 + 24, v7 * v5);
  }
  else
  {
    v10 = *v9;
    *(_QWORD *)(a1 + 32) = 0;
    *(_QWORD *)(a1 + 40) = 0;
    *v9 = 0;
    free(v10);
  }
  v15 = 0;
  v14 = 0;
  cva::vecLib::gesvd<float>();
  v12[0] = 0;
  v12[1] = 0;
  cva::MatrixData<float,0ul,0ul,false>::allocate(v12, 0.0);
  v13 = 0.0;
  v11 = (cva::Logger *)cva::vecLib::gesvd<float>();
  if (v14 < 0)
    __assert_rtn("decomposeDirect", "matrixsvd.h", 439, "(info >= 0) || cva::detail::assertMessage(\"gesvd() compute SVD failed!\")");
  if (v14)
  {
    cva::Logger::instance(v11);
    cva::Logger::logInCategory();
  }
  free(v12[0]);
  *(_BYTE *)(a1 + 80) = v14 == 0;
}

void sub_21085E8A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  free(a17);
  _Unwind_Resume(a1);
}

void cva::SVD<cva::Matrix<float,0u,0u,false>,true>::decomposeDirect<cva::MatrixMultExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::Matrix<float,0u,0u,false>>>(uint64_t a1, uint64_t **a2, char a3)
{
  _QWORD **v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  _DWORD *v10;
  int v11;
  void *v12[2];
  int v13;
  int v14;
  char v15[8];
  uint64_t *v16;
  _DWORD *v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a2 + 1;
  v7 = (*((_DWORD *)a2[1] + 5) * *(_DWORD *)(**a2 + 20));
  v12[0] = 0;
  v12[1] = 0;
  cva::MatrixData<float,0ul,0ul,false>::allocate(v12, v7);
  v8 = *a2;
  v9 = **a2;
  v10 = *v6;
  v11 = *((_DWORD *)*v6 + 5);
  v13 = *(_DWORD *)(v9 + 20);
  v14 = v11;
  v16 = v8;
  v17 = v10;
  if (*(_DWORD *)(v9 + 16) != v10[4])
    __assert_rtn("MatrixMultExpr", "matrixmultexpr.h", 100, "((lhs.ref().columns() == rhs.ref().rows())) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
  v18 = 1065353216;
  cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::Matrix<float,0u,0u,false>>((uint64_t)v12, (uint64_t)v15);
  cva::SVD<cva::Matrix<float,0u,0u,false>,true>::decomposeDirect<0u,0u>(a1, (uint64_t)v12, a3);
  free(v12[0]);
}

void sub_21085E9BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9)
{
  free(a9);
  _Unwind_Resume(a1);
}

uint64_t cva::SVD<cva::Matrix<float,0u,0u,false>,true>::S(_DWORD *a1)
{
  uint64_t v1;
  unsigned int v2;

  v2 = a1[18];
  LODWORD(v1) = a1[19];
  if (v1 >= v2)
    v1 = v2;
  else
    v1 = v1;
  if (v1 > a1[16])
    cva::SVD<cva::Matrix<float,0u,0u,false>,true>::S();
  return v1 | (v1 << 32);
}

void cva::SVD<cva::Matrix<float,0u,0u,false>,true>::decomposeDirect<cva::MatrixMultExpr<cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>>>(uint64_t a1, _QWORD **a2, char a3)
{
  uint64_t **v6;
  uint64_t v7;
  _DWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;
  void *v12[2];
  int v13;
  int v14;
  char v15[8];
  _DWORD *v16;
  uint64_t *v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a2 + 1;
  v7 = (*(_DWORD *)(*a2[1] + 16) * *((_DWORD *)*a2 + 4));
  v12[0] = 0;
  v12[1] = 0;
  cva::MatrixData<float,0ul,0ul,false>::allocate(v12, v7);
  v8 = *a2;
  v9 = *v6;
  v10 = **v6;
  v11 = *(_DWORD *)(v10 + 16);
  v13 = *((_DWORD *)*a2 + 4);
  v14 = v11;
  v16 = v8;
  v17 = v9;
  if (v8[5] != *(_DWORD *)(v10 + 20))
    __assert_rtn("MatrixMultExpr", "matrixmultexpr.h", 100, "((lhs.ref().columns() == rhs.ref().rows())) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
  v18 = 1065353216;
  cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>>((uint64_t)v12, (uint64_t)v15);
  cva::SVD<cva::Matrix<float,0u,0u,false>,true>::decomposeDirect<0u,0u>(a1, (uint64_t)v12, a3);
  free(v12[0]);
}

void sub_21085EB14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9)
{
  free(a9);
  _Unwind_Resume(a1);
}

void cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::Matrix<float,0u,0u,false>>(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = *(_QWORD *)(a2 + 16);
  v5 = **(_QWORD **)(a2 + 8);
  if (*(_QWORD *)v5 == *(_QWORD *)a1 || *(_QWORD *)v4 == *(_QWORD *)a1)
  {
    v10 = (*(_DWORD *)(v4 + 20) * *(_DWORD *)(v5 + 20));
    v15 = 0;
    v16 = 0;
    cva::MatrixData<float,0ul,0ul,false>::allocate(&v15, v10);
    v11 = *(_DWORD *)(*(_QWORD *)(a2 + 16) + 20);
    LODWORD(v17) = *(_DWORD *)(**(_QWORD **)(a2 + 8) + 20);
    HIDWORD(v17) = v11;
    cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::Matrix<float,0u,0u,false>>(&v15, a2);
    v12 = *(void **)a1;
    v13 = *(_QWORD *)(a1 + 8);
    v14 = v16;
    *(_QWORD *)a1 = v15;
    *(_QWORD *)(a1 + 8) = v14;
    v15 = v12;
    v16 = v13;
    *(_QWORD *)(a1 + 16) = v17;
    v17 = 0;
    free(v12);
  }
  else
  {
    LODWORD(v6) = *(_DWORD *)(a1 + 16);
    if ((_DWORD)v6 != *(_DWORD *)(v5 + 20) || (v7 = *(_DWORD *)(a1 + 20), v7 != *(_DWORD *)(v4 + 20)))
    {
      cva::Logger::instance((cva::Logger *)a1);
      v8 = cva::Logger::logInCategory();
      v6 = *(unsigned int *)(a1 + 16);
      v5 = **(_QWORD **)(a2 + 8);
      if ((_DWORD)v6 != *(_DWORD *)(v5 + 20)
        || (v4 = *(_QWORD *)(a2 + 16), v7 = *(_DWORD *)(v4 + 20), *(_DWORD *)(a1 + 20) != v7))
      {
        cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::Matrix<float,0u,0u,false>>(v8, v9, v6);
      }
    }
    if (*(_DWORD *)(v5 + 16) * (_DWORD)v6 && v7 * *(_DWORD *)(v4 + 16))
    {
      cva::VecLib<float>::gemm();
    }
    else if ((_DWORD)v6 * v7)
    {
      bzero(*(void **)a1, 4 * (v6 * v7));
    }
  }
}

void sub_21085ECD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  free(a14);
  _Unwind_Resume(a1);
}

void cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,0u,false>,cva::MatrixMultExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>>,cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>>>>(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  int v6;
  _DWORD ***v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;

  v4 = *(_QWORD *)(a2 + 8);
  if (*(_QWORD *)v4 == *(_QWORD *)a1)
  {
    v16 = (***(_DWORD ***)(*(_QWORD *)(a2 + 16) + 8) * *(_DWORD *)(v4 + 16));
    v20 = 0;
    v21 = 0;
    cva::MatrixData<float,0ul,0ul,false>::allocate(&v20, v16);
    v17 = ***(_DWORD ***)(*(_QWORD *)(a2 + 16) + 8);
    LODWORD(v22) = *(_DWORD *)(*(_QWORD *)(a2 + 8) + 16);
    HIDWORD(v22) = v17;
    cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,0u,false>,cva::MatrixMultExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>>,cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>>>>(&v20, a2);
    v14 = *(void **)a1;
    v18 = *(_QWORD *)(a1 + 8);
    v19 = v21;
    *(_QWORD *)a1 = v20;
    *(_QWORD *)(a1 + 8) = v19;
    v20 = v14;
    v21 = v18;
    *(_QWORD *)(a1 + 16) = v22;
    v22 = 0;
    goto LABEL_12;
  }
  v5 = *(_DWORD *)(a1 + 16);
  if (v5 != *(_DWORD *)(v4 + 16) || (v6 = *(_DWORD *)(a1 + 20), v7 = *(_DWORD ****)(a2 + 16), v6 != **v7[1]))
  {
    cva::Logger::instance((cva::Logger *)a1);
    v8 = cva::Logger::logInCategory();
    v5 = *(_DWORD *)(a1 + 16);
    v4 = *(_QWORD *)(a2 + 8);
    if (v5 != *(_DWORD *)(v4 + 16) || (v7 = *(_DWORD ****)(a2 + 16), v6 = **v7[1], *(_DWORD *)(a1 + 20) != v6))
      cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::Matrix<float,0u,0u,false>>(v8, v9, v10);
  }
  if (*(_DWORD *)(v4 + 20) * v5)
  {
    v11 = (v6 * (**v7)[5]);
    if ((_DWORD)v11)
    {
      v20 = 0;
      v21 = 0;
      cva::MatrixData<float,0ul,0ul,false>::allocate(&v20, v11);
      v12 = **v7[1];
      LODWORD(v22) = (**v7)[5];
      HIDWORD(v22) = v12;
      cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>>,cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>>>((cva::Logger *)&v20, (uint64_t)v7, v13);
      cva::VecLib<float>::gemm();
      v14 = v20;
LABEL_12:
      free(v14);
      return;
    }
  }
  v15 = v5 * v6;
  if (v15)
    bzero(*(void **)a1, 4 * v15);
}

void sub_21085EEF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  free(a14);
  _Unwind_Resume(a1);
}

void cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>>,cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>>>(cva::Logger *a1, uint64_t a2, uint64_t a3)
{
  cva::Logger *v4;
  int v5;
  uint64_t *v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int **v9;
  unsigned int *v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  BOOL v14;
  unsigned int v15;
  int v16;
  uint64_t v17;
  unsigned int v18;
  BOOL v19;
  _BYTE *v20;
  _BYTE *v21;
  int v22[2];
  uint64_t v23;
  int v24;
  int v25;
  unsigned int ***v26;
  char v27;
  int v28;
  unsigned int v29;
  unsigned int ****v30;
  _DWORD v31[2];
  uint64_t *v32;
  uint64_t v33;
  _QWORD v34[3];
  unsigned int **v35;

  v4 = a1;
  v5 = *((_DWORD *)a1 + 4);
  v6 = *(uint64_t **)a2;
  v7 = **(_QWORD **)a2;
  if (v5 != *(_DWORD *)(v7 + 20) || (v8 = *((_DWORD *)a1 + 5), v9 = *(unsigned int ***)(a2 + 8), v10 = *v9, v8 != **v9))
  {
    cva::Logger::instance(a1);
    a1 = (cva::Logger *)cva::Logger::logInCategory();
    v5 = *((_DWORD *)v4 + 4);
    v6 = *(uint64_t **)a2;
    v7 = **(_QWORD **)a2;
    if (v5 != *(_DWORD *)(v7 + 20)
      || (v9 = *(unsigned int ***)(a2 + 8), v10 = *v9, v8 = **v9, *((_DWORD *)v4 + 5) != v8))
    {
      cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::Matrix<float,0u,0u,false>>((uint64_t)a1, a2, a3);
    }
  }
  v35 = v9;
  if (v8 >= v10[1])
    v8 = v10[1];
  if (v8 > *(_DWORD *)(v7 + 16))
    cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>>,cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>>>((uint64_t)a1, a2, a3);
  v31[0] = v5;
  v31[1] = v8;
  v32 = v6;
  v33 = 0;
  v26 = &v35;
  v28 = v5;
  v29 = v8;
  v30 = &v26;
  v34[0] = v31;
  v34[1] = &v27;
  v11 = *(_QWORD *)v4;
  v22[0] = v5;
  v22[1] = v8;
  v23 = v11;
  v24 = v5;
  v25 = 0;
  cva::MatrixRef<float,0u,0u,false>::operator=<cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixTransposeExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const> const>,0u,1u>,cva::detail::MulOp>>(v22, v34, a3);
  v12 = *(_DWORD *)(*v6 + 16);
  v13 = *((_DWORD *)v4 + 5);
  v14 = v13 >= v12;
  v15 = v13 - v12;
  if (v15 != 0 && v14)
  {
    v16 = *((_DWORD *)v4 + 4);
    v17 = *(_QWORD *)v4 + 4 * v16 * v12;
    v18 = v16 * v15;
    v19 = v18 == 0;
    if (v18)
      v20 = (_BYTE *)v17;
    else
      v20 = 0;
    v21 = (_BYTE *)(v17 + 4 * v18);
    if (v19)
      v21 = 0;
    if (v20 != v21)
      bzero(v20, ((v21 - v20 - 4) & 0xFFFFFFFFFFFFFFFCLL) + 4);
  }
}

int *cva::MatrixRef<float,0u,0u,false>::operator=<cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixTransposeExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const> const>,0u,1u>,cva::detail::MulOp>>(int *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  cva::Logger *v9;
  int v10;
  int v11;
  int v12;
  BOOL v13;
  _DWORD *v14;
  uint64_t v15;
  void *v16;
  int v17;
  unsigned int v18;
  int *v19;
  int v20;
  unsigned int v21;
  void *v23[2];
  int v24;
  int v25;

  v5 = *((_QWORD *)a1 + 1) - 4 * a1[5];
  if (***(_QWORD ***)(*a2 + 8) == v5 || **(_QWORD **)(****(_QWORD ****)(a2[1] + 16) + 8) == v5)
  {
    v6 = *a1;
    v7 = a1[1];
    v23[0] = 0;
    v23[1] = 0;
    cva::MatrixData<float,0ul,0ul,false>::allocate(v23, (v7 * v6));
    v24 = v6;
    v25 = v7;
    cva::detail::assignNoAlias<cva::Matrix<float,0u,0u,false>,cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixTransposeExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const> const>,0u,1u>,cva::detail::MulOp>>((cva::Logger *)v23, a2, v8);
    v10 = *a1;
    if (*a1 != v24 || (v11 = a1[1], v11 != v25))
    {
      cva::Logger::instance(v9);
      cva::Logger::logInCategory();
      v10 = *a1;
      if (*a1 != v24 || (v11 = a1[1], v11 != v25))
        __assert_rtn("assert_equal_size", "matrixfun.h", 163, "(lhs.rows() == rhs.rows() && lhs.columns() == rhs.columns()) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
    }
    v12 = a1[4];
    v13 = v10 * v11 == 0;
    if (v10 * v11)
      v14 = (_DWORD *)*((_QWORD *)a1 + 1);
    else
      v14 = 0;
    v15 = *((_QWORD *)a1 + 1) + 4 * (v12 * v11);
    if (v13)
      v15 = 0;
    v16 = v23[0];
    if (v14 != (_DWORD *)v15)
    {
      v17 = 0;
      v18 = v12 - v10;
      v19 = (int *)v23[0];
      do
      {
        v20 = *v19++;
        *v14 = v20;
        if (v17 + 1 >= v10)
          v21 = v18;
        else
          v21 = 0;
        v14 += v21 + 1;
        if (v17 + 1 < v10)
          ++v17;
        else
          v17 = 0;
      }
      while (v14 != (_DWORD *)v15);
    }
    free(v16);
  }
  else
  {
    cva::detail::assignNoAlias<cva::MatrixRef<float,0u,0u,false>,cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixTransposeExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const> const>,0u,1u>,cva::detail::MulOp>>((cva::Logger *)a1, a2, a3);
  }
  return a1;
}

void sub_21085F248(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  free(a14);
  _Unwind_Resume(a1);
}

void cva::detail::assignNoAlias<cva::Matrix<float,0u,0u,false>,cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixTransposeExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const> const>,0u,1u>,cva::detail::MulOp>>(cva::Logger *a1, _QWORD *a2, uint64_t a3)
{
  cva::Logger *v4;
  unsigned int v5;
  _DWORD *v6;
  int v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  float *v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int v16;
  unsigned int v17;
  float v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a1;
  v5 = *((_DWORD *)a1 + 4);
  v6 = (_DWORD *)*a2;
  if (v5 != *(_DWORD *)*a2 || (v7 = *((_DWORD *)a1 + 5), v7 != v6[1]))
  {
    cva::Logger::instance(a1);
    a1 = (cva::Logger *)cva::Logger::logInCategory();
    v5 = *((_DWORD *)v4 + 4);
    v6 = (_DWORD *)*a2;
    if (v5 != *(_DWORD *)*a2 || (v7 = *((_DWORD *)v4 + 5), v7 != v6[1]))
      cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::Matrix<float,0u,0u,false>>((uint64_t)a1, (uint64_t)a2, a3);
  }
  v8 = v7 * v5;
  if ((_DWORD)v8)
  {
    v9 = 0;
    v10 = 0;
    v11 = a2[1];
    v12 = *(float **)v4;
    v13 = 4 * v8;
    do
    {
      if (v5 <= v10 || v6[1] <= HIDWORD(v10))
        cva::detail::assignNoAlias<cva::Matrix<float,0u,0u,false>,cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixTransposeExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const> const>,0u,1u>,cva::detail::MulOp>>((uint64_t)a1, (uint64_t)a2, a3);
      v14 = v6[5] + HIDWORD(v10);
      v15 = **((_QWORD **)v6 + 1);
      v16 = *(_DWORD *)(v15 + 16);
      if (v16 <= v14 || (v17 = v6[4] + v10, v17 >= *(_DWORD *)(v15 + 20)))
        -[PolyNomialExtrapolation predict].cold.1((uint64_t)a1, (uint64_t)a2, a3);
      v18 = *(float *)(*(_QWORD *)v15 + 4 * (v14 + v16 * v17));
      *v12++ = v18
             * cva::MatrixRepeatExpr<cva::MatrixTransposeExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const> const>,0u,1u>::operator()(v11, v9, HIDWORD(v9));
      v19 = (v10 + 1);
      v5 = *v6;
      if (*v6 <= (int)v19)
        v10 = (v10 & 0xFFFFFFFF00000000) + 0x100000000;
      else
        v10 = v10 & 0xFFFFFFFF00000000 | v19;
      v20 = (v9 + 1);
      if (*(_DWORD *)(v11 + 4) <= (int)v20)
        v9 = (v9 & 0xFFFFFFFF00000000) + 0x100000000;
      else
        v9 = v9 & 0xFFFFFFFF00000000 | v20;
      v13 -= 4;
    }
    while (v13);
  }
}

void cva::detail::assignNoAlias<cva::MatrixRef<float,0u,0u,false>,cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixTransposeExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const> const>,0u,1u>,cva::detail::MulOp>>(cva::Logger *a1, _QWORD *a2, uint64_t a3)
{
  cva::Logger *v4;
  signed int v5;
  _DWORD *v6;
  int v7;
  int v8;
  int v9;
  float *v10;
  uint64_t v11;
  float *v12;
  unint64_t v13;
  unint64_t v14;
  int v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  unsigned int v21;
  unsigned int v22;
  float v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;

  v4 = a1;
  v5 = *(_DWORD *)a1;
  v6 = (_DWORD *)*a2;
  if (*(_DWORD *)a1 != *(_DWORD *)*a2 || (v7 = *((_DWORD *)a1 + 1), v7 != v6[1]))
  {
    cva::Logger::instance(a1);
    a1 = (cva::Logger *)cva::Logger::logInCategory();
    v5 = *(_DWORD *)v4;
    v6 = (_DWORD *)*a2;
    if (*(_DWORD *)v4 != *(_DWORD *)*a2 || (v7 = *((_DWORD *)v4 + 1), v7 != v6[1]))
      cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::Matrix<float,0u,0u,false>>((uint64_t)a1, (uint64_t)a2, a3);
  }
  v8 = v7 * v5;
  v9 = *((_DWORD *)v4 + 4);
  if (v7 * v5)
    v10 = (float *)*((_QWORD *)v4 + 1);
  else
    v10 = 0;
  v11 = *((_QWORD *)v4 + 1) + 4 * (v9 * v7);
  if (v8)
    v12 = (float *)v11;
  else
    v12 = 0;
  if (v10 != v12)
  {
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = a2[1];
    v17 = v9 - v5;
    v18 = v5;
    do
    {
      if (v18 <= v14 || v6[1] <= HIDWORD(v14))
        cva::detail::assignNoAlias<cva::Matrix<float,0u,0u,false>,cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixTransposeExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const> const>,0u,1u>,cva::detail::MulOp>>((uint64_t)a1, (uint64_t)a2, a3);
      v19 = v6[5] + HIDWORD(v14);
      v20 = **((_QWORD **)v6 + 1);
      v21 = *(_DWORD *)(v20 + 16);
      if (v21 <= v19 || (v22 = v6[4] + v14, v22 >= *(_DWORD *)(v20 + 20)))
        -[PolyNomialExtrapolation predict].cold.1((uint64_t)a1, (uint64_t)a2, a3);
      v23 = *(float *)(*(_QWORD *)v20 + 4 * (v19 + v21 * v22));
      *v10 = v23
           * cva::MatrixRepeatExpr<cva::MatrixTransposeExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const> const>,0u,1u>::operator()(v16, v13, HIDWORD(v13));
      v24 = (v14 + 1);
      v18 = *v6;
      if (*v6 <= (int)v24)
        v14 = (v14 & 0xFFFFFFFF00000000) + 0x100000000;
      else
        v14 = v14 & 0xFFFFFFFF00000000 | v24;
      v25 = (v13 + 1);
      if (*(_DWORD *)(v16 + 4) <= (int)v25)
        v13 = (v13 & 0xFFFFFFFF00000000) + 0x100000000;
      else
        v13 = v13 & 0xFFFFFFFF00000000 | v25;
      if (v15 + 1 >= v5)
        v26 = v17;
      else
        v26 = 0;
      v10 += v26 + 1;
      if (v15 + 1 < v5)
        ++v15;
      else
        v15 = 0;
    }
    while (v10 != v12);
  }
}

float cva::MatrixRepeatExpr<cva::MatrixTransposeExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const> const>,0u,1u>::operator()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  float *v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  float v7;
  float v8;
  float result;

  if (*(_DWORD *)(a1 + 4) <= a2 || *(_DWORD *)(a1 + 8) <= a3)
    -[PolyNomialExtrapolation predict].cold.1(a1, a2, a3);
  v3 = ***(float ****)(a1 + 16);
  v4 = *(_DWORD *)(*(_QWORD *)v3 + 4);
  if (**(_DWORD **)v3 < v4)
    v4 = **(_DWORD **)v3;
  v5 = a3 % v4;
  v6 = *(_QWORD *)(*(_QWORD *)v3 + 8);
  if (*(_DWORD *)(v6 + 16) <= v5)
    -[PolyNomialExtrapolation predict].cold.1(a1, a2, a3);
  v7 = *(float *)(*(_QWORD *)v6 + 4 * v5);
  v8 = fabsf(v7);
  result = 1.0 / v7;
  if (v8 < v3[2])
    return 0.0;
  return result;
}

void cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>>(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = **(_QWORD **)(a2 + 16);
  if (*(_QWORD *)v4 == *(_QWORD *)a1 || *(_QWORD *)v5 == *(_QWORD *)a1)
  {
    v10 = (*(_DWORD *)(v5 + 16) * *(_DWORD *)(v4 + 16));
    v15 = 0;
    v16 = 0;
    cva::MatrixData<float,0ul,0ul,false>::allocate(&v15, v10);
    v11 = *(_DWORD *)(**(_QWORD **)(a2 + 16) + 16);
    LODWORD(v17) = *(_DWORD *)(*(_QWORD *)(a2 + 8) + 16);
    HIDWORD(v17) = v11;
    cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>>(&v15, a2);
    v12 = *(void **)a1;
    v13 = *(_QWORD *)(a1 + 8);
    v14 = v16;
    *(_QWORD *)a1 = v15;
    *(_QWORD *)(a1 + 8) = v14;
    v15 = v12;
    v16 = v13;
    *(_QWORD *)(a1 + 16) = v17;
    v17 = 0;
    free(v12);
  }
  else
  {
    LODWORD(v6) = *(_DWORD *)(a1 + 16);
    if ((_DWORD)v6 != *(_DWORD *)(v4 + 16) || (v7 = *(_DWORD *)(a1 + 20), v7 != *(_DWORD *)(v5 + 16)))
    {
      cva::Logger::instance((cva::Logger *)a1);
      v8 = cva::Logger::logInCategory();
      v6 = *(unsigned int *)(a1 + 16);
      v4 = *(_QWORD *)(a2 + 8);
      if ((_DWORD)v6 != *(_DWORD *)(v4 + 16)
        || (v5 = **(_QWORD **)(a2 + 16), v7 = *(_DWORD *)(v5 + 16), *(_DWORD *)(a1 + 20) != v7))
      {
        cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::Matrix<float,0u,0u,false>>(v8, v9, v6);
      }
    }
    if (*(_DWORD *)(v4 + 20) * (_DWORD)v6 && v7 * *(_DWORD *)(v5 + 20))
    {
      cva::VecLib<float>::gemm();
    }
    else if ((_DWORD)v6 * v7)
    {
      bzero(*(void **)a1, 4 * (v6 * v7));
    }
  }
}

void sub_21085F7FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  free(a14);
  _Unwind_Resume(a1);
}

void cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixMultExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>>>,cva::Matrix<float,0u,0u,false>>(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  _QWORD **v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;

  v4 = *(_QWORD *)(a2 + 16);
  if (*(_QWORD *)v4 == *(_QWORD *)a1)
  {
    v16 = (*(_DWORD *)(v4 + 20) * *(_DWORD *)(***(_QWORD ***)(a2 + 8) + 4));
    v20 = 0;
    v21 = 0;
    cva::MatrixData<float,0ul,0ul,false>::allocate(&v20, v16);
    v17 = *(_DWORD *)(*(_QWORD *)(a2 + 16) + 20);
    LODWORD(v22) = *(_DWORD *)(***(_QWORD ***)(a2 + 8) + 4);
    HIDWORD(v22) = v17;
    cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixMultExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>>>,cva::Matrix<float,0u,0u,false>>(&v20, a2);
    v14 = *(void **)a1;
    v18 = *(_QWORD *)(a1 + 8);
    v19 = v21;
    *(_QWORD *)a1 = v20;
    *(_QWORD *)(a1 + 8) = v19;
    v20 = v14;
    v21 = v18;
    *(_QWORD *)(a1 + 16) = v22;
    v22 = 0;
    goto LABEL_12;
  }
  v5 = *(_DWORD *)(a1 + 16);
  v6 = *(_QWORD ***)(a2 + 8);
  if (v5 != *(_DWORD *)(**v6 + 4) || (v7 = *(_DWORD *)(a1 + 20), v7 != *(_DWORD *)(v4 + 20)))
  {
    cva::Logger::instance((cva::Logger *)a1);
    v8 = cva::Logger::logInCategory();
    v5 = *(_DWORD *)(a1 + 16);
    v6 = *(_QWORD ***)(a2 + 8);
    if (v5 != *(_DWORD *)(**v6 + 4)
      || (v4 = *(_QWORD *)(a2 + 16), v7 = *(_DWORD *)(v4 + 20), *(_DWORD *)(a1 + 20) != v7))
    {
      cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::Matrix<float,0u,0u,false>>(v8, v9, v10);
    }
  }
  v11 = (*(_DWORD *)(*v6[1] + 16) * v5);
  if ((_DWORD)v11 && v7 * *(_DWORD *)(v4 + 16))
  {
    v20 = 0;
    v21 = 0;
    cva::MatrixData<float,0ul,0ul,false>::allocate(&v20, v11);
    v12 = *(_DWORD *)(*v6[1] + 16);
    LODWORD(v22) = *(_DWORD *)(**v6 + 4);
    HIDWORD(v22) = v12;
    cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>>>((cva::Logger *)&v20, (uint64_t)v6, v13);
    cva::VecLib<float>::gemm();
    v14 = v20;
LABEL_12:
    free(v14);
    return;
  }
  v15 = v5 * v7;
  if (v15)
    bzero(*(void **)a1, 4 * v15);
}

void sub_21085FA28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  free(a14);
  _Unwind_Resume(a1);
}

int *cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>>>(cva::Logger *a1, uint64_t a2, uint64_t a3)
{
  cva::Logger *v4;
  unsigned int v5;
  unsigned int **v6;
  unsigned int *v7;
  int v8;
  uint64_t *v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  int *result;
  uint64_t v14;
  unsigned int v15;
  int v16;
  int v17;
  int v18;
  BOOL v19;
  _DWORD *v20;
  uint64_t v21;
  int v22;
  unsigned int v23;
  int v24[2];
  uint64_t v25;
  unsigned int v26;
  int v27;
  char v28;
  unsigned int v29;
  int v30;
  unsigned int ***v31;
  _DWORD v32[2];
  uint64_t *v33;
  uint64_t v34;
  _QWORD v35[3];
  unsigned int **v36;

  v4 = a1;
  v5 = *((_DWORD *)a1 + 4);
  v6 = *(unsigned int ***)a2;
  v7 = **(unsigned int ***)a2;
  if (v5 != v7[1] || (v8 = *((_DWORD *)a1 + 5), v9 = *(uint64_t **)(a2 + 8), v10 = *v9, v8 != *(_DWORD *)(*v9 + 16)))
  {
    cva::Logger::instance(a1);
    a1 = (cva::Logger *)cva::Logger::logInCategory();
    v5 = *((_DWORD *)v4 + 4);
    v6 = *(unsigned int ***)a2;
    v7 = **(unsigned int ***)a2;
    if (v5 != v7[1] || (v9 = *(uint64_t **)(a2 + 8), v10 = *v9, v8 = *(_DWORD *)(*v9 + 16), *((_DWORD *)v4 + 5) != v8))
      cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::Matrix<float,0u,0u,false>>((uint64_t)a1, a2, a3);
  }
  v36 = v6;
  v11 = *v7;
  if (*v7 >= v5)
    v11 = v5;
  if (v11 > *(_DWORD *)(v10 + 20))
    cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>>,cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>>>((uint64_t)a1, a2, a3);
  v32[0] = v11;
  v32[1] = v8;
  v33 = v9;
  v34 = 0;
  v29 = v11;
  v30 = v8;
  v31 = &v36;
  v35[0] = v32;
  v35[1] = &v28;
  v12 = *(_QWORD *)v4;
  v24[0] = v11;
  v24[1] = v8;
  v25 = v12;
  v26 = v5;
  v27 = 0;
  result = cva::MatrixRef<float,0u,0u,false>::operator=<cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const>,1u,0u>,cva::detail::MulOp>>(v24, v35, a3);
  v14 = *(unsigned int *)(*v9 + 20);
  v15 = *((_DWORD *)v4 + 4);
  if (v15 > v14)
  {
    v16 = v15 - v14;
    v17 = *((_DWORD *)v4 + 5);
    v18 = v17 * (v15 - v14);
    v19 = v18 == 0;
    if (v18)
      v20 = (_DWORD *)(*(_QWORD *)v4 + 4 * v14);
    else
      v20 = 0;
    v21 = *(_QWORD *)v4 + 4 * v14 + 4 * v17 * v15;
    if (v19)
      v21 = 0;
    if (v20 != (_DWORD *)v21)
    {
      v22 = 0;
      do
      {
        *v20 = 0;
        if (v22 + 1 >= v16)
          v23 = v14;
        else
          v23 = 0;
        v20 += v23 + 1;
        if (v22 + 1 < v16)
          ++v22;
        else
          v22 = 0;
      }
      while (v20 != (_DWORD *)v21);
    }
  }
  return result;
}

int *cva::MatrixRef<float,0u,0u,false>::operator=<cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const>,1u,0u>,cva::detail::MulOp>>(int *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  cva::Logger *v9;
  int v10;
  int v11;
  int v12;
  BOOL v13;
  _DWORD *v14;
  uint64_t v15;
  void *v16;
  int v17;
  unsigned int v18;
  int *v19;
  int v20;
  unsigned int v21;
  void *v23[2];
  int v24;
  int v25;

  v5 = *((_QWORD *)a1 + 1) - 4 * a1[5];
  if (***(_QWORD ***)(*a2 + 8) == v5 || **(_QWORD **)(***(_QWORD ***)(a2[1] + 16) + 8) == v5)
  {
    v6 = *a1;
    v7 = a1[1];
    v23[0] = 0;
    v23[1] = 0;
    cva::MatrixData<float,0ul,0ul,false>::allocate(v23, (v7 * v6));
    v24 = v6;
    v25 = v7;
    cva::detail::assignNoAlias<cva::Matrix<float,0u,0u,false>,cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const>,1u,0u>,cva::detail::MulOp>>((cva::Logger *)v23, a2, v8);
    v10 = *a1;
    if (*a1 != v24 || (v11 = a1[1], v11 != v25))
    {
      cva::Logger::instance(v9);
      cva::Logger::logInCategory();
      v10 = *a1;
      if (*a1 != v24 || (v11 = a1[1], v11 != v25))
        __assert_rtn("assert_equal_size", "matrixfun.h", 163, "(lhs.rows() == rhs.rows() && lhs.columns() == rhs.columns()) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
    }
    v12 = a1[4];
    v13 = v10 * v11 == 0;
    if (v10 * v11)
      v14 = (_DWORD *)*((_QWORD *)a1 + 1);
    else
      v14 = 0;
    v15 = *((_QWORD *)a1 + 1) + 4 * (v12 * v11);
    if (v13)
      v15 = 0;
    v16 = v23[0];
    if (v14 != (_DWORD *)v15)
    {
      v17 = 0;
      v18 = v12 - v10;
      v19 = (int *)v23[0];
      do
      {
        v20 = *v19++;
        *v14 = v20;
        if (v17 + 1 >= v10)
          v21 = v18;
        else
          v21 = 0;
        v14 += v21 + 1;
        if (v17 + 1 < v10)
          ++v17;
        else
          v17 = 0;
      }
      while (v14 != (_DWORD *)v15);
    }
    free(v16);
  }
  else
  {
    cva::detail::assignNoAlias<cva::MatrixRef<float,0u,0u,false>,cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const>,1u,0u>,cva::detail::MulOp>>((cva::Logger *)a1, a2, a3);
  }
  return a1;
}

void sub_21085FD84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  free(a14);
  _Unwind_Resume(a1);
}

void cva::detail::assignNoAlias<cva::Matrix<float,0u,0u,false>,cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const>,1u,0u>,cva::detail::MulOp>>(cva::Logger *a1, _QWORD *a2, uint64_t a3)
{
  cva::Logger *v4;
  unsigned int v5;
  _DWORD *v6;
  int v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  float *v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int v16;
  unsigned int v17;
  float v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a1;
  v5 = *((_DWORD *)a1 + 4);
  v6 = (_DWORD *)*a2;
  if (v5 != *(_DWORD *)*a2 || (v7 = *((_DWORD *)a1 + 5), v7 != v6[1]))
  {
    cva::Logger::instance(a1);
    a1 = (cva::Logger *)cva::Logger::logInCategory();
    v5 = *((_DWORD *)v4 + 4);
    v6 = (_DWORD *)*a2;
    if (v5 != *(_DWORD *)*a2 || (v7 = *((_DWORD *)v4 + 5), v7 != v6[1]))
      cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::Matrix<float,0u,0u,false>>((uint64_t)a1, (uint64_t)a2, a3);
  }
  v8 = v7 * v5;
  if ((_DWORD)v8)
  {
    v9 = 0;
    v10 = 0;
    v11 = a2[1];
    v12 = *(float **)v4;
    v13 = 4 * v8;
    do
    {
      if (v5 <= v10 || v6[1] <= HIDWORD(v10))
        cva::detail::assignNoAlias<cva::Matrix<float,0u,0u,false>,cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixTransposeExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const> const>,0u,1u>,cva::detail::MulOp>>((uint64_t)a1, (uint64_t)a2, a3);
      v14 = v6[5] + HIDWORD(v10);
      v15 = **((_QWORD **)v6 + 1);
      v16 = *(_DWORD *)(v15 + 16);
      if (v16 <= v14 || (v17 = v6[4] + v10, v17 >= *(_DWORD *)(v15 + 20)))
        -[PolyNomialExtrapolation predict].cold.1((uint64_t)a1, (uint64_t)a2, a3);
      v18 = *(float *)(*(_QWORD *)v15 + 4 * (v14 + v16 * v17));
      *v12++ = v18
             * cva::MatrixRepeatExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const>,1u,0u>::operator()(v11, v9, HIDWORD(v9));
      v19 = (v10 + 1);
      v5 = *v6;
      if (*v6 <= (int)v19)
        v10 = (v10 & 0xFFFFFFFF00000000) + 0x100000000;
      else
        v10 = v10 & 0xFFFFFFFF00000000 | v19;
      v20 = (v9 + 1);
      if (*(_DWORD *)(v11 + 4) <= (int)v20)
        v9 = (v9 & 0xFFFFFFFF00000000) + 0x100000000;
      else
        v9 = v9 & 0xFFFFFFFF00000000 | v20;
      v13 -= 4;
    }
    while (v13);
  }
}

void cva::detail::assignNoAlias<cva::MatrixRef<float,0u,0u,false>,cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const>,1u,0u>,cva::detail::MulOp>>(cva::Logger *a1, _QWORD *a2, uint64_t a3)
{
  cva::Logger *v4;
  signed int v5;
  _DWORD *v6;
  int v7;
  int v8;
  int v9;
  float *v10;
  uint64_t v11;
  float *v12;
  unint64_t v13;
  unint64_t v14;
  int v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  unsigned int v21;
  unsigned int v22;
  float v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;

  v4 = a1;
  v5 = *(_DWORD *)a1;
  v6 = (_DWORD *)*a2;
  if (*(_DWORD *)a1 != *(_DWORD *)*a2 || (v7 = *((_DWORD *)a1 + 1), v7 != v6[1]))
  {
    cva::Logger::instance(a1);
    a1 = (cva::Logger *)cva::Logger::logInCategory();
    v5 = *(_DWORD *)v4;
    v6 = (_DWORD *)*a2;
    if (*(_DWORD *)v4 != *(_DWORD *)*a2 || (v7 = *((_DWORD *)v4 + 1), v7 != v6[1]))
      cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::Matrix<float,0u,0u,false>>((uint64_t)a1, (uint64_t)a2, a3);
  }
  v8 = v7 * v5;
  v9 = *((_DWORD *)v4 + 4);
  if (v7 * v5)
    v10 = (float *)*((_QWORD *)v4 + 1);
  else
    v10 = 0;
  v11 = *((_QWORD *)v4 + 1) + 4 * (v9 * v7);
  if (v8)
    v12 = (float *)v11;
  else
    v12 = 0;
  if (v10 != v12)
  {
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = a2[1];
    v17 = v9 - v5;
    v18 = v5;
    do
    {
      if (v18 <= v14 || v6[1] <= HIDWORD(v14))
        cva::detail::assignNoAlias<cva::Matrix<float,0u,0u,false>,cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixTransposeExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const> const>,0u,1u>,cva::detail::MulOp>>((uint64_t)a1, (uint64_t)a2, a3);
      v19 = v6[5] + HIDWORD(v14);
      v20 = **((_QWORD **)v6 + 1);
      v21 = *(_DWORD *)(v20 + 16);
      if (v21 <= v19 || (v22 = v6[4] + v14, v22 >= *(_DWORD *)(v20 + 20)))
        -[PolyNomialExtrapolation predict].cold.1((uint64_t)a1, (uint64_t)a2, a3);
      v23 = *(float *)(*(_QWORD *)v20 + 4 * (v19 + v21 * v22));
      *v10 = v23
           * cva::MatrixRepeatExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const>,1u,0u>::operator()(v16, v13, HIDWORD(v13));
      v24 = (v14 + 1);
      v18 = *v6;
      if (*v6 <= (int)v24)
        v14 = (v14 & 0xFFFFFFFF00000000) + 0x100000000;
      else
        v14 = v14 & 0xFFFFFFFF00000000 | v24;
      v25 = (v13 + 1);
      if (*(_DWORD *)(v16 + 4) <= (int)v25)
        v13 = (v13 & 0xFFFFFFFF00000000) + 0x100000000;
      else
        v13 = v13 & 0xFFFFFFFF00000000 | v25;
      if (v15 + 1 >= v5)
        v26 = v17;
      else
        v26 = 0;
      v10 += v26 + 1;
      if (v15 + 1 < v5)
        ++v15;
      else
        v15 = 0;
    }
    while (v10 != v12);
  }
}

float cva::MatrixRepeatExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const>,1u,0u>::operator()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  float *v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  float v7;
  float v8;
  float result;

  if (*(_DWORD *)(a1 + 4) <= a2 || *(_DWORD *)(a1 + 8) <= a3)
    -[PolyNomialExtrapolation predict].cold.1(a1, a2, a3);
  v3 = **(float ***)(a1 + 16);
  v4 = *(_DWORD *)(*(_QWORD *)v3 + 4);
  if (**(_DWORD **)v3 < v4)
    v4 = **(_DWORD **)v3;
  v5 = a2 % v4;
  v6 = *(_QWORD *)(*(_QWORD *)v3 + 8);
  if (*(_DWORD *)(v6 + 16) <= v5)
    -[PolyNomialExtrapolation predict].cold.1(a1, a2, a3);
  v7 = *(float *)(*(_QWORD *)v6 + 4 * v5);
  v8 = fabsf(v7);
  result = 1.0 / v7;
  if (v8 < v3[2])
    return 0.0;
  return result;
}

void cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixMultExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>>>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>>(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  _DWORD ***v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;

  v4 = **(_QWORD **)(a2 + 16);
  if (*(_QWORD *)v4 == *(_QWORD *)a1)
  {
    v16 = (*(_DWORD *)(v4 + 16) * *(_DWORD *)(***(_QWORD ***)(a2 + 8) + 20));
    v20 = 0;
    v21 = 0;
    cva::MatrixData<float,0ul,0ul,false>::allocate(&v20, v16);
    v17 = *(_DWORD *)(**(_QWORD **)(a2 + 16) + 16);
    LODWORD(v22) = *(_DWORD *)(***(_QWORD ***)(a2 + 8) + 20);
    HIDWORD(v22) = v17;
    cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixMultExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>>>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>>(&v20, a2);
    v14 = *(void **)a1;
    v18 = *(_QWORD *)(a1 + 8);
    v19 = v21;
    *(_QWORD *)a1 = v20;
    *(_QWORD *)(a1 + 8) = v19;
    v20 = v14;
    v21 = v18;
    *(_QWORD *)(a1 + 16) = v22;
    v22 = 0;
    goto LABEL_12;
  }
  v5 = *(_DWORD *)(a1 + 16);
  v6 = *(_DWORD ****)(a2 + 8);
  if (v5 != (**v6)[5] || (v7 = *(_DWORD *)(a1 + 20), v7 != *(_DWORD *)(v4 + 16)))
  {
    cva::Logger::instance((cva::Logger *)a1);
    v8 = cva::Logger::logInCategory();
    v5 = *(_DWORD *)(a1 + 16);
    v6 = *(_DWORD ****)(a2 + 8);
    if (v5 != (**v6)[5] || (v4 = **(_QWORD **)(a2 + 16), v7 = *(_DWORD *)(v4 + 16), *(_DWORD *)(a1 + 20) != v7))
      cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::Matrix<float,0u,0u,false>>(v8, v9, v10);
  }
  v11 = (**v6[1] * v5);
  if ((_DWORD)v11 && v7 * *(_DWORD *)(v4 + 20))
  {
    v20 = 0;
    v21 = 0;
    cva::MatrixData<float,0ul,0ul,false>::allocate(&v20, v11);
    v12 = **v6[1];
    LODWORD(v22) = (**v6)[5];
    HIDWORD(v22) = v12;
    cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>>>((cva::Logger *)&v20, (uint64_t)v6, v13);
    cva::VecLib<float>::gemm();
    v14 = v20;
LABEL_12:
    free(v14);
    return;
  }
  v15 = v5 * v7;
  if (v15)
    bzero(*(void **)a1, 4 * v15);
}

void sub_2108603C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  free(a14);
  _Unwind_Resume(a1);
}

void cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>>>(cva::Logger *a1, uint64_t a2, uint64_t a3)
{
  cva::Logger *v4;
  int v5;
  uint64_t *v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int **v9;
  unsigned int *v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  BOOL v14;
  unsigned int v15;
  int v16;
  uint64_t v17;
  unsigned int v18;
  BOOL v19;
  _BYTE *v20;
  _BYTE *v21;
  int v22[2];
  uint64_t v23;
  int v24;
  int v25;
  unsigned int ***v26;
  char v27;
  int v28;
  unsigned int v29;
  unsigned int ****v30;
  _DWORD v31[2];
  uint64_t *v32;
  uint64_t v33;
  _QWORD v34[3];
  unsigned int **v35;

  v4 = a1;
  v5 = *((_DWORD *)a1 + 4);
  v6 = *(uint64_t **)a2;
  v7 = **(_QWORD **)a2;
  if (v5 != *(_DWORD *)(v7 + 20) || (v8 = *((_DWORD *)a1 + 5), v9 = *(unsigned int ***)(a2 + 8), v10 = *v9, v8 != **v9))
  {
    cva::Logger::instance(a1);
    a1 = (cva::Logger *)cva::Logger::logInCategory();
    v5 = *((_DWORD *)v4 + 4);
    v6 = *(uint64_t **)a2;
    v7 = **(_QWORD **)a2;
    if (v5 != *(_DWORD *)(v7 + 20)
      || (v9 = *(unsigned int ***)(a2 + 8), v10 = *v9, v8 = **v9, *((_DWORD *)v4 + 5) != v8))
    {
      cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::Matrix<float,0u,0u,false>>((uint64_t)a1, a2, a3);
    }
  }
  v35 = v9;
  if (v8 >= v10[1])
    v8 = v10[1];
  if (v8 > *(_DWORD *)(v7 + 16))
    cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>>,cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>>>((uint64_t)a1, a2, a3);
  v31[0] = v5;
  v31[1] = v8;
  v32 = v6;
  v33 = 0;
  v26 = &v35;
  v28 = v5;
  v29 = v8;
  v30 = &v26;
  v34[0] = v31;
  v34[1] = &v27;
  v11 = *(_QWORD *)v4;
  v22[0] = v5;
  v22[1] = v8;
  v23 = v11;
  v24 = v5;
  v25 = 0;
  cva::MatrixRef<float,0u,0u,false>::operator=<cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixTransposeExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const> const>,0u,1u>,cva::detail::MulOp>>(v22, v34, a3);
  v12 = *(_DWORD *)(*v6 + 16);
  v13 = *((_DWORD *)v4 + 5);
  v14 = v13 >= v12;
  v15 = v13 - v12;
  if (v15 != 0 && v14)
  {
    v16 = *((_DWORD *)v4 + 4);
    v17 = *(_QWORD *)v4 + 4 * v16 * v12;
    v18 = v16 * v15;
    v19 = v18 == 0;
    if (v18)
      v20 = (_BYTE *)v17;
    else
      v20 = 0;
    v21 = (_BYTE *)(v17 + 4 * v18);
    if (v19)
      v21 = 0;
    if (v20 != v21)
      bzero(v20, ((v21 - v20 - 4) & 0xFFFFFFFFFFFFFFFCLL) + 4);
  }
}

int *cva::MatrixRef<float,0u,0u,false>::operator=<cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixTransposeExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const> const>,0u,1u>,cva::detail::MulOp>>(int *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  cva::Logger *v9;
  int v10;
  int v11;
  int v12;
  BOOL v13;
  _DWORD *v14;
  uint64_t v15;
  void *v16;
  int v17;
  unsigned int v18;
  int *v19;
  int v20;
  unsigned int v21;
  void *v23[2];
  int v24;
  int v25;

  v5 = *((_QWORD *)a1 + 1) - 4 * a1[5];
  if (***(_QWORD ***)(*a2 + 8) == v5 || **(_QWORD **)(****(_QWORD ****)(a2[1] + 16) + 8) == v5)
  {
    v6 = *a1;
    v7 = a1[1];
    v23[0] = 0;
    v23[1] = 0;
    cva::MatrixData<float,0ul,0ul,false>::allocate(v23, (v7 * v6));
    v24 = v6;
    v25 = v7;
    cva::detail::assignNoAlias<cva::Matrix<float,0u,0u,false>,cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixTransposeExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const> const>,0u,1u>,cva::detail::MulOp>>((cva::Logger *)v23, a2, v8);
    v10 = *a1;
    if (*a1 != v24 || (v11 = a1[1], v11 != v25))
    {
      cva::Logger::instance(v9);
      cva::Logger::logInCategory();
      v10 = *a1;
      if (*a1 != v24 || (v11 = a1[1], v11 != v25))
        __assert_rtn("assert_equal_size", "matrixfun.h", 163, "(lhs.rows() == rhs.rows() && lhs.columns() == rhs.columns()) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
    }
    v12 = a1[4];
    v13 = v10 * v11 == 0;
    if (v10 * v11)
      v14 = (_DWORD *)*((_QWORD *)a1 + 1);
    else
      v14 = 0;
    v15 = *((_QWORD *)a1 + 1) + 4 * (v12 * v11);
    if (v13)
      v15 = 0;
    v16 = v23[0];
    if (v14 != (_DWORD *)v15)
    {
      v17 = 0;
      v18 = v12 - v10;
      v19 = (int *)v23[0];
      do
      {
        v20 = *v19++;
        *v14 = v20;
        if (v17 + 1 >= v10)
          v21 = v18;
        else
          v21 = 0;
        v14 += v21 + 1;
        if (v17 + 1 < v10)
          ++v17;
        else
          v17 = 0;
      }
      while (v14 != (_DWORD *)v15);
    }
    free(v16);
  }
  else
  {
    cva::detail::assignNoAlias<cva::MatrixRef<float,0u,0u,false>,cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixTransposeExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const> const>,0u,1u>,cva::detail::MulOp>>((cva::Logger *)a1, a2, a3);
  }
  return a1;
}

void sub_210860714(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  free(a14);
  _Unwind_Resume(a1);
}

void cva::assign<false,false,cva::Matrix<float,0u,1u,false>,cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,1u,false>>(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int v14;

  v4 = *(_QWORD *)(a2 + 8);
  if (*(_QWORD *)v4 == *(_QWORD *)a1 || **(_QWORD **)(a2 + 16) == *(_QWORD *)a1)
  {
    v8 = *(unsigned int *)(v4 + 16);
    v12 = 0;
    v13 = 0;
    cva::MatrixData<float,0ul,0ul,false>::allocate(&v12, v8);
    v14 = *(_DWORD *)(*(_QWORD *)(a2 + 8) + 16);
    cva::assign<false,false,cva::Matrix<float,0u,1u,false>,cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,1u,false>>(&v12, a2);
    v9 = *(void **)a1;
    v10 = *(_QWORD *)(a1 + 8);
    v11 = v13;
    *(_QWORD *)a1 = v12;
    *(_QWORD *)(a1 + 8) = v11;
    v12 = v9;
    v13 = v10;
    *(_DWORD *)(a1 + 16) = v14;
    v14 = 0;
    free(v9);
  }
  else
  {
    LODWORD(v5) = *(_DWORD *)(a1 + 16);
    if ((_DWORD)v5 != *(_DWORD *)(v4 + 16))
    {
      cva::Logger::instance((cva::Logger *)a1);
      v6 = cva::Logger::logInCategory();
      v5 = *(unsigned int *)(a1 + 16);
      v4 = *(_QWORD *)(a2 + 8);
      if ((_DWORD)v5 != *(_DWORD *)(v4 + 16))
        cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::Matrix<float,0u,0u,false>>(v6, v5, v7);
    }
    if (*(_DWORD *)(v4 + 20) * (_DWORD)v5 && *(_DWORD *)(*(_QWORD *)(a2 + 16) + 16))
    {
      cva::VecLib<float>::gemv();
    }
    else if ((_DWORD)v5)
    {
      bzero(*(void **)a1, 4 * v5);
    }
  }
}

void sub_210860880(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  free(a14);
  _Unwind_Resume(a1);
}

uint64_t std::deque<float>::~deque[abi:ne180100](_QWORD *a1)
{
  void **v2;
  void **v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = (void **)a1[1];
  v3 = (void **)a1[2];
  a1[5] = 0;
  v4 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      v3 = (void **)a1[2];
      v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      v4 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  v5 = v4 >> 3;
  if (v5 == 1)
  {
    v6 = 512;
  }
  else
  {
    if (v5 != 2)
      goto LABEL_9;
    v6 = 1024;
  }
  a1[4] = v6;
LABEL_9:
  while (v2 != v3)
  {
    v7 = *v2++;
    operator delete(v7);
  }
  return std::__split_buffer<std::pair<long,long> *,std::allocator<std::pair<long,long> *>>::~__split_buffer((uint64_t)a1);
}

void OUTLINED_FUNCTION_0_0(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 163, a4);
}

void OUTLINED_FUNCTION_1(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 2269, a4);
}

void OUTLINED_FUNCTION_2(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 100, a4);
}

void OUTLINED_FUNCTION_3(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 192, a4);
}

void OUTLINED_FUNCTION_4(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 2252, a4);
}

void sub_210860C84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210861510(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  free(*(void **)(v3 - 184));
  free(*(void **)(v3 - 160));

  _Unwind_Resume(a1);
}

void cva::inv<cva::Matrix<float,4u,4u,false>,4u,true,float>(simd_float4x4 *a1@<X0>, simd_float4x4 *a2@<X8>)
{
  *a2 = __invert_f4(*a1);
}

void sub_210861624(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_210861C78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *__p,uint64_t a33)
{
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;

  if (__p)
    operator delete(__p);
  free(*(void **)(v36 - 168));
  free(*(void **)(v36 - 144));

  _Unwind_Resume(a1);
}

void sub_210861E5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_210862050(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21086221C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

_QWORD *std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<float>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_210862448(_Unwind_Exception *exception_object)
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

char *_ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l(char *result, char *__src, uint64_t a3, unint64_t a4)
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
  if (a4 > (v8 - *(_QWORD *)result) >> 3)
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
    if (a4 >> 61)
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    v10 = v8 >> 2;
    if (v8 >> 2 <= a4)
      v10 = a4;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8)
      v11 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = std::vector<unsigned long>::__vallocate[abi:ne180100](v7, v11);
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
  v15 = (v14 - v9) >> 3;
  if (v15 >= a4)
    goto LABEL_16;
  v16 = &__src[8 * v15];
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

double cva::assign<false,false,cva::Matrix<float,4u,4u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,4u,false> const>,cva::Matrix<float,0u,4u,false>>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD *v3;
  uint64_t v4;
  float *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  float *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t i;
  unint64_t v13;
  double result;
  unint64_t v15;
  int v16;
  unint64_t v17;
  float *v18;
  unsigned int v19;
  unsigned int v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;

  v3 = (_OWORD *)a1;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(float **)v4;
  if (*(_QWORD *)v4 == a1)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    cva::assign<false,false,cva::Matrix<float,4u,4u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,4u,false> const>,cva::Matrix<float,0u,4u,false>>(&v23);
    v21 = v24;
    *v3 = v23;
    v3[1] = v21;
    result = *(double *)&v25;
    v22 = v26;
    v3[2] = v25;
    v3[3] = v22;
  }
  else
  {
    v6 = 0;
    v7 = 0;
    v8 = **(_QWORD **)a2;
    v9 = (float *)*(unsigned int *)(v4 + 16);
    v10 = v9 & 0xFFFFFFFC;
    v11 = v9 & 0xFFFFFFFE;
    do
    {
      for (i = 0; i != 4; ++i)
      {
        if ((_DWORD)v10)
        {
          v13 = 0;
          LODWORD(result) = 0;
          do
          {
            if (v13 >= (unint64_t)v9)
              -[PolyNomialExtrapolation predict].cold.1(a1, a2, a3);
            v15 = *(unsigned int *)(v8 + 16);
            if (v13 >= v15)
              -[PolyNomialExtrapolation predict].cold.1(v15, a2, a3);
            a2 = (uint64_t)&v5[(v6 + v13)];
            a3 = *(_QWORD *)v8;
            a1 = *(_QWORD *)v8 + 4 * (v13 + i * v15);
            *(float *)&result = *(float *)&result
                              + (float)((float)((float)((float)(*(float *)(a1 + 4) * *(float *)(a2 + 4))
                                                      + (float)(*(float *)a1 * *(float *)a2))
                                              + (float)(*(float *)(a1 + 8) * *(float *)(a2 + 8)))
                                      + (float)(*(float *)(a1 + 12) * *(float *)(a2 + 12)));
            v13 += 4;
          }
          while (v13 < v10);
        }
        else
        {
          LODWORD(v13) = 0;
          LODWORD(result) = 0;
        }
        if (v13 < v11)
        {
          a1 = 0;
          a2 = v13;
          v16 = v6 + v13;
          do
          {
            if (a2 + a1 >= (unint64_t)v9)
              -[PolyNomialExtrapolation predict].cold.1(a1, a2, a3);
            v17 = *(unsigned int *)(v8 + 16);
            if (a2 + a1 >= v17)
              -[PolyNomialExtrapolation predict].cold.1(a1, a2, v17);
            v18 = (float *)(*(_QWORD *)v8 + 4 * (a2 + a1 + i * v17));
            *(float *)&result = *(float *)&result
                              + (float)((float)(v18[1] * v5[(v16 + a1) + 1])
                                      + (float)(*v18 * v5[(v16 + a1)]));
            a1 += 2;
            a3 = a2 + a1;
          }
          while (a2 + a1 < v11);
          LODWORD(v13) = a2 + a1;
        }
        if (v13 < v9)
        {
          v19 = *(_DWORD *)(v8 + 16);
          a1 = v13;
          LODWORD(a2) = v19 - v13;
          if (v19 >= v13)
            a2 = a2;
          else
            a2 = 0;
          v20 = (_DWORD)v9 + ~(_DWORD)v13;
          a3 = v19 * i;
          do
          {
            if (a2 <= v20)
              -[PolyNomialExtrapolation predict].cold.1(a1, a2, a3);
            *(float *)&result = *(float *)&result
                              + (float)(*(float *)(*(_QWORD *)v8 + 4 * (a3 + a1))
                                      * v5[(v6 + a1)]);
            ++a1;
          }
          while (v9 != (float *)a1);
        }
        *((_DWORD *)&v3[v7] + i) = LODWORD(result);
      }
      ++v7;
      v6 += (int)v9;
    }
    while (v7 != 4);
  }
  return result;
}

void cva::assign<false,false,cva::Matrix<float,4u,1u,false>,cva::MatrixMultExpr<cva::Matrix<float,4u,4u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,4u,false> const>>,cva::Matrix<float,0u,1u,false>>(float32x4_t *a1, uint64_t a2)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int32 *v11;
  uint64_t v12;
  float32x4_t v13;
  float32x4_t *v14;
  float32x4_t v15;
  float32x4_t v16;
  void *v17[2];
  int v18;
  float32x4_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (**(float32x4_t ***)(a2 + 8) == a1)
  {
    v19 = 0uLL;
    cva::assign<false,false,cva::Matrix<float,4u,1u,false>,cva::MatrixMultExpr<cva::Matrix<float,4u,4u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,4u,false> const>>,cva::Matrix<float,0u,1u,false>>(&v19, a2);
    *a1 = v19;
  }
  else
  {
    v4 = *(uint64_t **)a2;
    v5 = *(_QWORD *)a2 + 8;
    v6 = (4 * *(_DWORD *)(**(_QWORD **)v5 + 16));
    v17[0] = 0;
    v17[1] = 0;
    cva::MatrixData<float,0ul,0ul,false>::allocate(v17, v6);
    v7 = *(_QWORD *)v5;
    v18 = *(_DWORD *)(**(_QWORD **)v5 + 16);
    v19.i64[1] = *v4;
    v20 = v7;
    v21 = 1065353216;
    cva::assign<false,false,cva::Matrix<float,4u,0u,false>,cva::Matrix<float,4u,4u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,4u,false> const>>((uint64_t)v17, (uint64_t)&v19);
    v8 = *(_QWORD *)(a2 + 8);
    if (!*(_DWORD *)(v8 + 16))
      __assert_rtn("assert_in_bounds", "matrixmixin.h", 2269, "((row < mixed().rows()) && (col < mixed().columns())) || cva::detail::assertMessage(\"Index out of bounds!\")");
    if (!v18)
      __assert_rtn("assert_in_bounds", "matrixmixin.h", 2269, "((row < mixed().rows()) && (col < mixed().columns())) || cva::detail::assertMessage(\"Index out of bounds!\")");
    v9 = (4 * v18);
    v10 = v17[0];
    if ((_DWORD)v9)
    {
      v11 = *(__int32 **)v8;
      v12 = 4 * v9;
      v13 = 0uLL;
      v14 = (float32x4_t *)v17[0];
      do
      {
        v15 = *v14++;
        v16 = v15;
        v15.i32[0] = *v11++;
        v13 = vmlaq_n_f32(v13, v16, v15.f32[0]);
        v12 -= 16;
      }
      while (v12);
    }
    else
    {
      v13 = 0uLL;
    }
    *a1 = v13;
    free(v10);
  }
}

void sub_2108628C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9)
{
  free(a9);
  _Unwind_Resume(a1);
}

void cva::assign<false,false,cva::Matrix<float,4u,0u,false>,cva::Matrix<float,4u,4u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,4u,false> const>>(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;

  v4 = **(_QWORD **)(a2 + 16);
  if (*(_QWORD *)(a2 + 8) == *(_QWORD *)a1 || *(_QWORD *)v4 == *(_QWORD *)a1)
  {
    v6 = (4 * *(_DWORD *)(v4 + 16));
    v10 = 0;
    v11 = 0;
    cva::MatrixData<float,0ul,0ul,false>::allocate(&v10, v6);
    v12 = *(_DWORD *)(**(_QWORD **)(a2 + 16) + 16);
    cva::assign<false,false,cva::Matrix<float,4u,0u,false>,cva::Matrix<float,4u,4u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,4u,false> const>>(&v10, a2);
    v7 = *(void **)a1;
    v8 = *(_QWORD *)(a1 + 8);
    v9 = v11;
    *(_QWORD *)a1 = v10;
    *(_QWORD *)(a1 + 8) = v9;
    v10 = v7;
    v11 = v8;
    *(_DWORD *)(a1 + 16) = v12;
    v12 = 0;
    free(v7);
  }
  else
  {
    v5 = *(_DWORD *)(a1 + 16);
    if (v5 != *(_DWORD *)(v4 + 16))
    {
      cva::Logger::instance((cva::Logger *)a1);
      cva::Logger::logInCategory();
      v5 = *(_DWORD *)(a1 + 16);
      if (v5 != *(_DWORD *)(**(_QWORD **)(a2 + 16) + 16))
        cva::assign<false,false,cva::Matrix<float,4u,0u,false>,cva::Matrix<float,4u,4u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,4u,false> const>>();
    }
    if ((v5 & 0x3FFFFFFF) != 0)
    {
      cva::VecLib<float>::gemm();
    }
    else if (4 * v5)
    {
      bzero(*(void **)a1, 4 * (4 * v5));
    }
  }
}

void sub_210862A4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  free(a14);
  _Unwind_Resume(a1);
}

id simdMatrix4x4ToNSMat(__n128 a1, __n128 a2, __n128 a3, __n128 a4)
{
  id v4;
  int i;
  id v6;
  double v7;
  uint64_t j;
  void *v9;
  __n128 v11;
  __n128 v12;
  __n128 v13;
  __n128 v14;

  v11 = a1;
  v12 = a2;
  v13 = a3;
  v14 = a4;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  for (i = 0; i != 4; ++i)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    for (j = 0; j != 16; j += 4)
    {
      LODWORD(v7) = v11.n128_u32[(i & 3) + j];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7, *(_OWORD *)&v11, *(_OWORD *)&v12, *(_OWORD *)&v13, *(_OWORD *)&v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v9);

    }
    objc_msgSend(v4, "addObject:", v6);

  }
  return v4;
}

id simdMatrix4x4ToNSArray(__n128 a1, __n128 a2, __n128 a3, __n128 a4)
{
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", a1.n128_f64[0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:atIndexedSubscript:", v5, 0);

  HIDWORD(v6) = a1.n128_u32[1];
  LODWORD(v6) = a1.n128_u32[1];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:atIndexedSubscript:", v7, 1);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[2])));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:atIndexedSubscript:", v8, 2);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[3])));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:atIndexedSubscript:", v9, 3);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", a2.n128_f64[0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:atIndexedSubscript:", v10, 4);

  HIDWORD(v11) = a2.n128_u32[1];
  LODWORD(v11) = a2.n128_u32[1];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:atIndexedSubscript:", v12, 5);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[2])));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:atIndexedSubscript:", v13, 6);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[3])));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:atIndexedSubscript:", v14, 7);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", a3.n128_f64[0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:atIndexedSubscript:", v15, 8);

  HIDWORD(v16) = a3.n128_u32[1];
  LODWORD(v16) = a3.n128_u32[1];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:atIndexedSubscript:", v17, 9);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[2])));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:atIndexedSubscript:", v18, 10);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[3])));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:atIndexedSubscript:", v19, 11);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", a4.n128_f64[0]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:atIndexedSubscript:", v20, 12);

  HIDWORD(v21) = a4.n128_u32[1];
  LODWORD(v21) = a4.n128_u32[1];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:atIndexedSubscript:", v22, 13);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a4.n128_u32[1], a4.n128_u32[2])));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:atIndexedSubscript:", v23, 14);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a4.n128_u32[1], a4.n128_u32[3])));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:atIndexedSubscript:", v24, 15);

  return v4;
}

id simdMatrix3x3ToNSMat(__n128 a1, __n128 a2, __n128 a3)
{
  id v3;
  int i;
  id v5;
  double v6;
  uint64_t j;
  void *v8;
  __n128 v10;
  __n128 v11;
  __n128 v12;

  v10 = a1;
  v11 = a2;
  v12 = a3;
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  for (i = 0; i != 3; ++i)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    for (j = 0; j != 12; j += 4)
    {
      LODWORD(v6) = v10.n128_u32[(i & 3) + j];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6, *(_OWORD *)&v10, *(_OWORD *)&v11, *(_OWORD *)&v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v8);

    }
    objc_msgSend(v3, "addObject:", v5);

  }
  return v3;
}

id simdFloat4ToNSArray(__n128 a1)
{
  id v1;
  int i;
  double v3;
  void *v4;
  __n128 v6;
  __n128 v7;

  v6 = a1;
  v1 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  for (i = 0; i != 4; ++i)
  {
    HIDWORD(v3) = v6.n128_u32[1];
    v7 = v6;
    LODWORD(v3) = *(_DWORD *)((unint64_t)&v7 & 0xFFFFFFFFFFFFFFF3 | (4 * (i & 3)));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v3, *(_OWORD *)&v6, *(_OWORD *)&v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "addObject:", v4);

  }
  return v1;
}

id simdFloat3ToNSArray(__n128 a1)
{
  id v1;
  int i;
  double v3;
  void *v4;
  __n128 v6;
  __n128 v7;

  v6 = a1;
  v1 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  for (i = 0; i != 3; ++i)
  {
    HIDWORD(v3) = v6.n128_u32[1];
    v7 = v6;
    LODWORD(v3) = *(_DWORD *)((unint64_t)&v7 & 0xFFFFFFFFFFFFFFF3 | (4 * (i & 3)));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v3, *(_OWORD *)&v6, *(_OWORD *)&v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "addObject:", v4);

  }
  return v1;
}

void printSimd4x4Matrix(__n128 a1, __n128 a2, __n128 a3, __n128 a4)
{
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t buf[4];
  double v13;
  __int16 v14;
  double v15;
  __int16 v16;
  double v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  __ABPKLogSharedInstance();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218752;
    v13 = a1.n128_f32[0];
    v14 = 2048;
    v15 = a2.n128_f32[0];
    v16 = 2048;
    v17 = a3.n128_f32[0];
    v18 = 2048;
    v19 = a4.n128_f32[0];
    _os_log_impl(&dword_210836000, v4, OS_LOG_TYPE_DEBUG, " %f, %f, %f, %f ", buf, 0x2Au);
  }

  __ABPKLogSharedInstance();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218752;
    v13 = a1.n128_f32[1];
    v14 = 2048;
    v15 = a2.n128_f32[1];
    v16 = 2048;
    v17 = a3.n128_f32[1];
    v18 = 2048;
    v19 = a4.n128_f32[1];
    _os_log_impl(&dword_210836000, v5, OS_LOG_TYPE_DEBUG, " %f, %f, %f, %f ", buf, 0x2Au);
  }

  __ABPKLogSharedInstance();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218752;
    v13 = a1.n128_f32[2];
    v14 = 2048;
    v15 = a2.n128_f32[2];
    v16 = 2048;
    v17 = a3.n128_f32[2];
    v18 = 2048;
    v19 = a4.n128_f32[2];
    _os_log_impl(&dword_210836000, v6, OS_LOG_TYPE_DEBUG, " %f, %f, %f, %f ", buf, 0x2Au);
  }

  __ABPKLogSharedInstance();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218752;
    v13 = a1.n128_f32[3];
    v14 = 2048;
    v15 = a2.n128_f32[3];
    v16 = 2048;
    v17 = a3.n128_f32[3];
    v18 = 2048;
    v19 = a4.n128_f32[3];
    _os_log_impl(&dword_210836000, v7, OS_LOG_TYPE_DEBUG, " %f, %f, %f, %f ", buf, 0x2Au);
  }

}

double transform_point(float32x4_t a1, float32x4_t a2, float32x4_t a3, float32x4_t a4, float32x4_t a5)
{
  double result;

  *(_QWORD *)&result = vaddq_f32(a4, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a1, a5.f32[0]), a2, *(float32x2_t *)a5.f32, 1), a3, a5, 2)).u64[0];
  return result;
}

__n128 convertNSArrayToSimd3x3(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  __int128 v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  __int128 v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  int v39;
  __int128 v40;
  __int128 v41;

  v1 = a1;
  if (objc_msgSend(v1, "count") != 9 && objc_msgSend(v1, "count") != 3)
    convertNSArrayToSimd3x3_cold_1();
  v2 = objc_msgSend(v1, "count");
  objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2 == 9)
  {
    objc_msgSend(v3, "floatValue");
    *(_QWORD *)&v40 = v5;
    objc_msgSend(v1, "objectAtIndexedSubscript:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    v38 = v7;
    objc_msgSend(v1, "objectAtIndexedSubscript:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    v9 = v40;
    DWORD1(v9) = v38;
    DWORD2(v9) = v10;
    v41 = v9;
    objc_msgSend(v1, "objectAtIndexedSubscript:", 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "floatValue");
    objc_msgSend(v1, "objectAtIndexedSubscript:", 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatValue");
    objc_msgSend(v1, "objectAtIndexedSubscript:", 5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "floatValue");
    objc_msgSend(v1, "objectAtIndexedSubscript:", 6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "floatValue");
    objc_msgSend(v1, "objectAtIndexedSubscript:", 7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "floatValue");
    objc_msgSend(v1, "objectAtIndexedSubscript:", 8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "floatValue");
  }
  else
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "floatValue");
    *(_QWORD *)&v40 = v17;
    objc_msgSend(v1, "objectAtIndexedSubscript:", 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "floatValue");
    v39 = v18;
    objc_msgSend(v1, "objectAtIndexedSubscript:", 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "floatValue");
    v19 = v40;
    DWORD1(v19) = v39;
    DWORD2(v19) = v20;
    v41 = v19;
    objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectAtIndexedSubscript:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "floatValue");
    objc_msgSend(v1, "objectAtIndexedSubscript:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "floatValue");
    objc_msgSend(v1, "objectAtIndexedSubscript:", 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectAtIndexedSubscript:", 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "floatValue");
    objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectAtIndexedSubscript:", 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "floatValue");
    objc_msgSend(v1, "objectAtIndexedSubscript:", 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectAtIndexedSubscript:", 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "floatValue");
    objc_msgSend(v1, "objectAtIndexedSubscript:", 2);
    v25 = v4;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectAtIndexedSubscript:", 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "floatValue");

    v14 = v31;
    v4 = v25;
    v8 = v35;

    v6 = v37;
    v13 = v33;

    v12 = v34;
    v11 = v36;

  }
  return (__n128)v41;
}

__n128 convertNSArrayToSimd4x4(void *a1)
{
  id v1;
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  __int128 v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  __int128 v27;

  v1 = a1;
  if (objc_msgSend(v1, "count") != 16)
    convertNSArrayToSimd4x4_cold_1();
  objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "floatValue");
  v26 = v2;
  objc_msgSend(v1, "objectAtIndexedSubscript:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "floatValue");
  v25 = v3;
  objc_msgSend(v1, "objectAtIndexedSubscript:", 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "floatValue");
  v24 = v4;
  objc_msgSend(v1, "objectAtIndexedSubscript:", 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "floatValue");
  *(_QWORD *)&v5 = __PAIR64__(v25, v26);
  *((_QWORD *)&v5 + 1) = __PAIR64__(v6, v24);
  v27 = v5;
  objc_msgSend(v1, "objectAtIndexedSubscript:", 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "floatValue");
  objc_msgSend(v1, "objectAtIndexedSubscript:", 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "floatValue");
  objc_msgSend(v1, "objectAtIndexedSubscript:", 6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "floatValue");
  objc_msgSend(v1, "objectAtIndexedSubscript:", 7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  objc_msgSend(v1, "objectAtIndexedSubscript:", 8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  objc_msgSend(v1, "objectAtIndexedSubscript:", 9);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  objc_msgSend(v1, "objectAtIndexedSubscript:", 10);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  objc_msgSend(v1, "objectAtIndexedSubscript:", 11);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");
  objc_msgSend(v1, "objectAtIndexedSubscript:", 12);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "floatValue");
  objc_msgSend(v1, "objectAtIndexedSubscript:", 13);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatValue");
  objc_msgSend(v1, "objectAtIndexedSubscript:", 14);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatValue");
  objc_msgSend(v1, "objectAtIndexedSubscript:", 15);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "floatValue");

  return (__n128)v27;
}

__n128 convertNSMatToSimd4x4(void *a1)
{
  id v1;
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  __int128 v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned int v40;
  unsigned int v41;
  unsigned int v42;
  __int128 v43;

  v1 = a1;
  if (objc_msgSend(v1, "count") != 4)
    convertNSMatToSimd4x4_cold_1();
  objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "objectAtIndexedSubscript:", 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "floatValue");
  v42 = v2;
  objc_msgSend(v1, "objectAtIndexedSubscript:", 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "objectAtIndexedSubscript:", 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "floatValue");
  v41 = v3;
  objc_msgSend(v1, "objectAtIndexedSubscript:", 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "floatValue");
  v40 = v4;
  objc_msgSend(v1, "objectAtIndexedSubscript:", 3);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "floatValue");
  *(_QWORD *)&v5 = __PAIR64__(v41, v42);
  *((_QWORD *)&v5 + 1) = __PAIR64__(v6, v40);
  v43 = v5;
  objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectAtIndexedSubscript:", 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "floatValue");
  objc_msgSend(v1, "objectAtIndexedSubscript:", 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectAtIndexedSubscript:", 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "floatValue");
  objc_msgSend(v1, "objectAtIndexedSubscript:", 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectAtIndexedSubscript:", 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "floatValue");
  objc_msgSend(v1, "objectAtIndexedSubscript:", 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectAtIndexedSubscript:", 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "floatValue");
  objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectAtIndexedSubscript:", 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "floatValue");
  objc_msgSend(v1, "objectAtIndexedSubscript:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectAtIndexedSubscript:", 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "floatValue");
  objc_msgSend(v1, "objectAtIndexedSubscript:", 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "floatValue");
  objc_msgSend(v1, "objectAtIndexedSubscript:", 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  objc_msgSend(v1, "objectAtIndexedSubscript:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");
  objc_msgSend(v1, "objectAtIndexedSubscript:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatValue");
  objc_msgSend(v1, "objectAtIndexedSubscript:", 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "floatValue");

  return (__n128)v43;
}

__n128 convertNSArrayToSimd4(void *a1)
{
  id v1;
  void *v2;
  unsigned int v3;
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  void *v8;
  __int128 v9;
  unsigned int v10;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  __int128 v15;

  v1 = a1;
  if (objc_msgSend(v1, "count") != 4)
    convertNSArrayToSimd4_cold_1();
  objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v14 = v3;
  objc_msgSend(v1, "objectAtIndexedSubscript:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v13 = v5;
  objc_msgSend(v1, "objectAtIndexedSubscript:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v12 = v7;
  objc_msgSend(v1, "objectAtIndexedSubscript:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  *(_QWORD *)&v9 = __PAIR64__(v13, v14);
  *((_QWORD *)&v9 + 1) = __PAIR64__(v10, v12);
  v15 = v9;

  return (__n128)v15;
}

void printSimd3x3(__n128 a1, __n128 a2, __n128 a3)
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t buf[4];
  double v10;
  __int16 v11;
  double v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  __ABPKLogSharedInstance();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218496;
    v10 = a1.n128_f32[0];
    v11 = 2048;
    v12 = a2.n128_f32[0];
    v13 = 2048;
    v14 = a3.n128_f32[0];
    _os_log_impl(&dword_210836000, v3, OS_LOG_TYPE_DEBUG, " %f, %f, %f ", buf, 0x20u);
  }

  __ABPKLogSharedInstance();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218496;
    v10 = a1.n128_f32[1];
    v11 = 2048;
    v12 = a2.n128_f32[1];
    v13 = 2048;
    v14 = a3.n128_f32[1];
    _os_log_impl(&dword_210836000, v4, OS_LOG_TYPE_DEBUG, " %f, %f, %f ", buf, 0x20u);
  }

  __ABPKLogSharedInstance();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218496;
    v10 = a1.n128_f32[2];
    v11 = 2048;
    v12 = a2.n128_f32[2];
    v13 = 2048;
    v14 = a3.n128_f32[2];
    _os_log_impl(&dword_210836000, v5, OS_LOG_TYPE_DEBUG, " %f, %f, %f ", buf, 0x20u);
  }

}

void printSimd4x4(__n128 a1, __n128 a2, __n128 a3, __n128 a4)
{
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t buf[4];
  double v13;
  __int16 v14;
  double v15;
  __int16 v16;
  double v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  __ABPKLogSharedInstance();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218752;
    v13 = a1.n128_f32[0];
    v14 = 2048;
    v15 = a2.n128_f32[0];
    v16 = 2048;
    v17 = a3.n128_f32[0];
    v18 = 2048;
    v19 = a4.n128_f32[0];
    _os_log_impl(&dword_210836000, v4, OS_LOG_TYPE_DEBUG, " %f, %f, %f, %f ", buf, 0x2Au);
  }

  __ABPKLogSharedInstance();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218752;
    v13 = a1.n128_f32[1];
    v14 = 2048;
    v15 = a2.n128_f32[1];
    v16 = 2048;
    v17 = a3.n128_f32[1];
    v18 = 2048;
    v19 = a4.n128_f32[1];
    _os_log_impl(&dword_210836000, v5, OS_LOG_TYPE_DEBUG, " %f, %f, %f, %f ", buf, 0x2Au);
  }

  __ABPKLogSharedInstance();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218752;
    v13 = a1.n128_f32[2];
    v14 = 2048;
    v15 = a2.n128_f32[2];
    v16 = 2048;
    v17 = a3.n128_f32[2];
    v18 = 2048;
    v19 = a4.n128_f32[2];
    _os_log_impl(&dword_210836000, v6, OS_LOG_TYPE_DEBUG, " %f, %f, %f, %f ", buf, 0x2Au);
  }

  __ABPKLogSharedInstance();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218752;
    v13 = a1.n128_f32[3];
    v14 = 2048;
    v15 = a2.n128_f32[3];
    v16 = 2048;
    v17 = a3.n128_f32[3];
    v18 = 2048;
    v19 = a4.n128_f32[3];
    _os_log_impl(&dword_210836000, v7, OS_LOG_TYPE_DEBUG, " %f, %f, %f, %f ", buf, 0x2Au);
  }

}

void printSimd4(__n128 a1)
{
  NSObject *v1;
  uint8_t buf[4];
  double v4;
  __int16 v5;
  double v6;
  __int16 v7;
  double v8;
  __int16 v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  __ABPKLogSharedInstance();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218752;
    v4 = a1.n128_f32[0];
    v5 = 2048;
    v6 = a1.n128_f32[1];
    v7 = 2048;
    v8 = a1.n128_f32[2];
    v9 = 2048;
    v10 = a1.n128_f32[3];
    _os_log_impl(&dword_210836000, v1, OS_LOG_TYPE_DEBUG, " %f, %f, %f, %f ", buf, 0x2Au);
  }

}

__n128 simdFloat3FromArray(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  unsigned __int32 v4;
  void *v5;
  unsigned __int32 v6;
  void *v7;
  unsigned __int32 v8;
  __n128 result;
  unsigned __int32 v10;
  unsigned __int32 v11;
  unsigned __int32 v12;

  v1 = a1;
  if (!v1)
    simdFloat3FromArray_cold_1();
  v2 = v1;
  if (objc_msgSend(v1, "count") != 3)
    simdFloat3FromArray_cold_2();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v12 = v4;
  objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v11 = v6;
  objc_msgSend(v2, "objectAtIndexedSubscript:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v10 = v8;

  result.n128_u32[0] = v12;
  result.n128_u32[1] = v11;
  result.n128_u32[2] = v10;
  return result;
}

double simdFloat4x4fromArray(void *a1, char a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __int32 v7;
  void *v8;
  void *v9;
  int32x4_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int32 v14;
  void *v15;
  void *v16;
  int32x4_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __int32 v21;
  void *v22;
  void *v23;
  int32x4_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  __int32 v28;
  void *v29;
  void *v30;
  int32x4_t v31;
  double result;
  __int32 v33;
  double v34;
  int32x4_t v35;
  int32x4_t v36;
  int32x4_t v37;
  int32x4_t v38;
  int32x4_t v39;
  int32x4_t v40;
  int32x4_t v41;
  int32x4_t v42;

  v3 = a1;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v41.i64[0] = v5;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v39.i32[0] = v7;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  objc_msgSend(v3, "objectAtIndexedSubscript:", 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  v10 = v41;
  v10.i32[1] = v39.i32[0];
  v42 = v10;
  v34 = *(double *)v10.i64;

  objc_msgSend(v3, "objectAtIndexedSubscript:", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");
  v39.i64[0] = v12;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatValue");
  v37.i32[0] = v14;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "floatValue");
  objc_msgSend(v3, "objectAtIndexedSubscript:", 7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "floatValue");
  v17 = v39;
  v17.i32[1] = v37.i32[0];
  v40 = v17;

  objc_msgSend(v3, "objectAtIndexedSubscript:", 8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "floatValue");
  v37.i64[0] = v19;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "floatValue");
  v35.i32[0] = v21;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "floatValue");
  objc_msgSend(v3, "objectAtIndexedSubscript:", 11);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "floatValue");
  v24 = v37;
  v24.i32[1] = v35.i32[0];
  v38 = v24;

  objc_msgSend(v3, "objectAtIndexedSubscript:", 12);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "floatValue");
  v35.i64[0] = v26;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 13);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "floatValue");
  v33 = v28;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 14);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "floatValue");
  objc_msgSend(v3, "objectAtIndexedSubscript:", 15);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v30, "floatValue");
  v31 = v35;
  v31.i32[1] = v33;
  v36 = v31;

  if ((a2 & 1) != 0)
    return v34;
  *(_QWORD *)&result = vzip1q_s32(vzip1q_s32(v42, v38), vzip1q_s32(v40, v36)).u64[0];
  return result;
}

__n128 simdFloat4x4FromRotation(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  int32x4_t v24;
  int32x4_t v25;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  int32x4_t v33;

  v3 = a1;
  v4 = a2;
  if (!v3 || (v5 = v4) == 0)
    simdFloat4x4FromRotation_cold_1();
  if (objc_msgSend(v3, "count") != 9)
    simdFloat4x4FromRotation_cold_3();
  if (objc_msgSend(v5, "count") != 3)
    simdFloat4x4FromRotation_cold_2();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v32 = v7;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  v31 = v9;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");

  objc_msgSend(v3, "objectAtIndexedSubscript:", 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "floatValue");
  v30 = v13;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatValue");
  v29 = v15;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "floatValue");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "floatValue");

  objc_msgSend(v3, "objectAtIndexedSubscript:", 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "floatValue");
  v28 = v19;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "floatValue");
  v27 = v21;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "floatValue");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "floatValue");

  v24.i64[0] = __PAIR64__(v28, v32);
  v24.i64[1] = __PAIR64__(v27, v31);
  v25 = v24;
  v24.i64[0] = v30;
  v24.i64[1] = v29;
  v33 = vzip1q_s32(v25, v24);

  return (__n128)v33;
}

uint64_t simdEqualTransforms(float32x4_t a1, float32x4_t a2, float32x4_t a3, float32x4_t a4, float32x4_t a5, float32x4_t a6, float32x4_t a7, float32x4_t a8)
{
  float32x4_t v8;
  float32x4_t v9;

  v8 = vabdq_f32(a1, a5);
  v9 = (float32x4_t)vdupq_n_s32(0x38FA0000u);
  return vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vcgeq_f32(v9, v8), (int8x16_t)vcgeq_f32(v9, vabdq_f32(a2, a6))), vandq_s8((int8x16_t)vcgeq_f32(v9, vabdq_f32(a3, a7)), (int8x16_t)vcgeq_f32(v9, vabdq_f32(a4, a8))))) >> 31;
}

float32x2_t Matrix4x4MakeColumnMajorTransform(float64x2_t *a1)
{
  return vcvt_f32_f64(*a1);
}

float computeAngleBetweenVectors(double a1, double a2)
{
  float v2;
  int v3;

  v2 = atan2f(vmlas_n_f32((float)-*((float *)&a1 + 1) * *(float *)&a2, *((float *)&a2 + 1), *(float *)&a1), vaddv_f32(vmul_f32(*(float32x2_t *)&a1, *(float32x2_t *)&a2)))* 0.318309886* 180.0;
  v3 = (int)v2 % 360;
  if (v3 < 0)
    return (float)-v3;
  return (float)v3;
}

BOOL detectRaisingHand(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  unint64_t v6;
  uint64_t v10;
  uint64_t v11;
  float *v12;
  uint64_t v13;
  float *v14;
  float *v15;
  float v16;
  uint64_t v18;
  BOOL v19;
  float *v20;
  float32x2_t v21;
  float32x2_t v22;
  float32x2_t v23;
  float v24;
  int v25;
  uint64_t v26;
  float v27;
  float *v28;
  float v29;
  float v30;
  float v31;
  float v32;
  NSObject *v33;
  const char *v34;
  NSObject *v35;
  double v37;
  NSObject *v38;
  int v40;
  double v41;
  __int16 v42;
  int v43;
  void *__p[4];

  v6 = a6;
  __p[3] = *(void **)MEMORY[0x24BDAC8D0];
  if (a6)
  {
    v10 = 0;
    v11 = a2 + 4;
    v12 = (float *)(a4 + 4);
    v13 = a3 + 4;
    v14 = (float *)(a2 + 4);
    v15 = (float *)(a3 + 4);
    do
    {
      LODWORD(v16) = HIDWORD(*(_QWORD *)(a1 + 8 * v10));
      if (COERCE_FLOAT(*(_QWORD *)(a1 + 8 * v10)) == -1.0 || v16 == -1.0)
      {
        __ABPKLogSharedInstance();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(__p[0]) = 67109120;
          HIDWORD(__p[0]) = v10;
          _os_log_impl(&dword_210836000, v35, OS_LOG_TYPE_DEBUG, " Raising Hand: Wrist not detected in frame: %d ", (uint8_t *)__p, 8u);
        }
        goto LABEL_44;
      }
      if (v16 > *v14 || v16 > *v12 || v16 > *v15)
      {
        __ABPKLogSharedInstance();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(__p[0]) = 67109120;
          HIDWORD(__p[0]) = v10;
          _os_log_impl(&dword_210836000, v35, OS_LOG_TYPE_DEBUG, " Raising Hand: Hand too low in frame: %d ", (uint8_t *)__p, 8u);
        }
LABEL_44:

        return 0;
      }
      ++v10;
      v15 += 2;
      v12 += 2;
      v14 += 2;
    }
    while (a6 != v10);
    std::vector<float>::vector(__p, a6);
    v18 = 0;
    v19 = 0;
    v20 = (float *)__p[0];
    do
    {
      v21 = *(float32x2_t *)(a2 + 8 * v18);
      v22 = vsub_f32(*(float32x2_t *)(a1 + 8 * v18), v21);
      v23 = vsub_f32(*(float32x2_t *)(a3 + 8 * v18), v21);
      v24 = atan2f(vmlas_n_f32((float)-v22.f32[1] * v23.f32[0], v23.f32[1], v22.f32[0]), vaddv_f32(vmul_f32(v22, v23)))
          * 0.318309886
          * 180.0;
      v25 = (int)v24 % 360;
      if (v25 < 0)
        v25 = -v25;
      v20[v18] = (float)v25;
      if (v25 <= 0x3B)
      {
        __ABPKLogSharedInstance();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          v37 = *((float *)__p[0] + v18);
          v40 = 134218240;
          v41 = v37;
          v42 = 1024;
          v43 = v18;
          _os_log_impl(&dword_210836000, v38, OS_LOG_TYPE_DEBUG, " Raising Hand: Angle (%f) < 70 degrees in frame: %d ", (uint8_t *)&v40, 0x12u);
        }
        goto LABEL_37;
      }
      v19 = ++v18 >= v6;
    }
    while (v6 != v18);
    v26 = 0;
    do
    {
      while (1)
      {
        v27 = *(float *)(v11 + 8 * v26);
        if (*(float *)(a1 + 4 + 8 * v26) < v27 && v27 < *(float *)(v13 + 8 * v26))
          break;
        if (++v26 == v6)
        {
          v28 = (float *)__p[0];
          v29 = 1000.0;
          v30 = -1000.0;
          do
          {
            v31 = *v28++;
            v32 = v31;
            if (v31 < v29)
              v29 = v32;
            if (v32 > v30)
              v30 = v32;
            --v6;
          }
          while (v6);
          if ((float)(v30 - v29) > 10000.0)
          {
            __ABPKLogSharedInstance();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              LOWORD(v40) = 0;
              _os_log_impl(&dword_210836000, v33, OS_LOG_TYPE_DEBUG, " Raising Hand: Angles changing too much ", (uint8_t *)&v40, 2u);
            }

          }
          goto LABEL_33;
        }
      }
      ++v26;
    }
    while (v26 != v6);
    __ABPKLogSharedInstance();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v40) = 0;
      v34 = " Raising Hand: Gesture detected - Wrist is above elbow and elbow is above the shoulder ";
      goto LABEL_35;
    }
  }
  else
  {
    std::vector<float>::vector(__p, 0);
LABEL_33:
    __ABPKLogSharedInstance();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v40) = 0;
      v34 = " Raising Hand: Gesture detected ";
LABEL_35:
      _os_log_impl(&dword_210836000, v38, OS_LOG_TYPE_DEBUG, v34, (uint8_t *)&v40, 2u);
    }
  }
  v19 = 1;
LABEL_37:

  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return v19;
}

void sub_210864F8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

float computeMeanOfVector(uint64_t a1)
{
  float *v1;
  unint64_t v2;
  uint64_t v3;
  float v4;
  float v5;

  v1 = *(float **)a1;
  v2 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 2;
  if (*(_QWORD *)(a1 + 8) == *(_QWORD *)a1)
  {
    v4 = 0.0;
  }
  else
  {
    if (v2 <= 1)
      v3 = 1;
    else
      v3 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 2;
    v4 = 0.0;
    do
    {
      v5 = *v1++;
      v4 = v4 + v5;
      --v3;
    }
    while (v3);
  }
  return v4 / (float)v2;
}

float getFrequencyOfZeroCrossing(uint64_t *a1, float a2)
{
  uint64_t v3;
  uint64_t v4;
  float *v5;
  float *v6;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  float v22;
  float *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  float *v29;
  float *v30;
  int v31;
  float v32;
  void *v33;
  uint64_t v34;
  float *v35;
  float *v36;
  unint64_t v37;
  uint64_t v38;
  float v39;
  float *v40;
  float v41;
  float *v43;
  float *v44;
  uint64_t v45;
  void *v46;
  _BYTE *v47;
  void *v48;
  float *v49;
  float *v50;
  void *__p;
  char *v52;
  char *v53;

  __p = 0;
  v52 = 0;
  v53 = 0;
  v4 = *a1;
  v3 = a1[1];
  if (v3 - *a1 == 4)
  {
    v5 = 0;
    v6 = 0;
    v48 = 0;
    v49 = 0;
    v50 = 0;
  }
  else
  {
    v8 = 0;
    v9 = 0;
    do
    {
      v10 = v9 + 1;
      if (*(float *)(v4 + 4 * (v9 + 1)) >= 0.0 && *(float *)(v4 + 4 * v9) < 0.0)
      {
        if (v8 >= v53)
        {
          v12 = (char *)__p;
          v13 = (v8 - (_BYTE *)__p) >> 3;
          v14 = v13 + 1;
          if ((unint64_t)(v13 + 1) >> 61)
            std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
          v15 = v53 - (_BYTE *)__p;
          if ((v53 - (_BYTE *)__p) >> 2 > v14)
            v14 = v15 >> 2;
          if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF8)
            v16 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v16 = v14;
          if (v16)
          {
            v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v53, v16);
            v12 = (char *)__p;
            v8 = v52;
          }
          else
          {
            v17 = 0;
          }
          v18 = &v17[8 * v13];
          *(_QWORD *)v18 = v9;
          v11 = v18 + 8;
          while (v8 != v12)
          {
            v19 = *((_QWORD *)v8 - 1);
            v8 -= 8;
            *((_QWORD *)v18 - 1) = v19;
            v18 -= 8;
          }
          __p = v18;
          v52 = v11;
          v53 = &v17[8 * v16];
          if (v12)
            operator delete(v12);
        }
        else
        {
          *(_QWORD *)v8 = v9;
          v11 = v8 + 8;
        }
        v52 = v11;
        v8 = v11;
        v4 = *a1;
        v3 = a1[1];
      }
      ++v9;
    }
    while (v10 < ((v3 - v4) >> 2) - 1);
    v20 = (unint64_t *)__p;
    v48 = 0;
    v49 = 0;
    v50 = 0;
    if (v8 == __p)
    {
      v5 = 0;
      v6 = 0;
    }
    else
    {
      v6 = 0;
      v21 = 0;
      do
      {
        v22 = (float)v20[v21]
            - (float)(*(float *)(*a1 + 4 * v20[v21])
                    / (float)(*(float *)(*a1 + 4 * v20[v21] + 4) - *(float *)(*a1 + 4 * v20[v21])));
        if (v6 >= v50)
        {
          v23 = (float *)v48;
          v24 = ((char *)v6 - (_BYTE *)v48) >> 2;
          v25 = v24 + 1;
          if ((unint64_t)(v24 + 1) >> 62)
            std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
          v26 = (char *)v50 - (_BYTE *)v48;
          if (((char *)v50 - (_BYTE *)v48) >> 1 > v25)
            v25 = v26 >> 1;
          if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFFCLL)
            v27 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v27 = v25;
          if (v27)
          {
            v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v50, v27);
            v23 = (float *)v48;
            v6 = v49;
          }
          else
          {
            v28 = 0;
          }
          v29 = (float *)&v28[4 * v24];
          *v29 = v22;
          v30 = v29 + 1;
          while (v6 != v23)
          {
            v31 = *((_DWORD *)v6-- - 1);
            *((_DWORD *)v29-- - 1) = v31;
          }
          v48 = v29;
          v49 = v30;
          v50 = (float *)&v28[4 * v27];
          if (v23)
            operator delete(v23);
          v6 = v30;
        }
        else
        {
          *v6++ = v22;
        }
        v49 = v6;
        ++v21;
        v20 = (unint64_t *)__p;
      }
      while (v21 < (v52 - (_BYTE *)__p) >> 3);
      v5 = (float *)v48;
    }
  }
  v32 = 0.0;
  if ((unint64_t)((char *)v6 - (char *)v5) >= 8)
  {
    std::vector<float>::vector(&v46, v6 - v5 - 1);
    v33 = v46;
    v34 = (((char *)v49 - (_BYTE *)v48) >> 2) - 1;
    if (((char *)v49 - (_BYTE *)v48) >> 2 != 1)
    {
      v35 = (float *)((char *)v48 + 4);
      v36 = (float *)v46;
      do
      {
        *v36++ = (float)(*v35 - *(v35 - 1)) / a2;
        ++v35;
        --v34;
      }
      while (v34);
    }
    v43 = 0;
    v44 = 0;
    v45 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v43, v33, (uint64_t)v47, (v47 - (_BYTE *)v33) >> 2);
    v37 = v44 - v43;
    if (v44 == v43)
    {
      v32 = 0.0 / (float)v37;
      if (!v44)
      {
LABEL_59:
        if (v46)
        {
          v47 = v46;
          operator delete(v46);
        }
        v5 = (float *)v48;
        goto LABEL_62;
      }
    }
    else
    {
      if (v37 <= 1)
        v38 = 1;
      else
        v38 = v44 - v43;
      v39 = 0.0;
      v40 = v43;
      do
      {
        v41 = *v40++;
        v39 = v39 + v41;
        --v38;
      }
      while (v38);
      v32 = v39 / (float)v37;
    }
    v44 = v43;
    operator delete(v43);
    goto LABEL_59;
  }
LABEL_62:
  if (v5)
  {
    v49 = v5;
    operator delete(v5);
  }
  if (__p)
  {
    v52 = (char *)__p;
    operator delete(__p);
  }
  return v32;
}

void sub_210865384(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19)
{
  if (__p)
    operator delete(__p);
  if (a15)
    operator delete(a15);
  if (a18)
    operator delete(a18);
  _Unwind_Resume(exception_object);
}

BOOL detectWavingHand(float32x2_t *a1, float32x2_t *a2, float32x2_t *a3, uint64_t a4, uint64_t a5, unint64_t a6, unsigned int a7, unsigned int a8)
{
  float32x2_t *v11;
  float32x2_t *v12;
  float32x2_t *v13;
  uint64_t v14;
  float *v15;
  float *v16;
  float *v17;
  float v18;
  float *v20;
  unint64_t v21;
  float32x2_t v22;
  float32x2_t v23;
  float32x2_t v24;
  float32x2_t v25;
  float32x2_t v26;
  float32x2_t v27;
  float32x2_t v28;
  float v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  float v33;
  float v34;
  float v35;
  BOOL v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  float *v40;
  float *v41;
  void **v42;
  uint64_t v43;
  char *v44;
  unint64_t v45;
  float v46;
  uint64_t v47;
  float v48;
  float *v49;
  float v50;
  float v51;
  uint64_t v52;
  float *v53;
  float *v54;
  float FrequencyOfZeroCrossing;
  NSObject *v56;
  _BOOL8 v57;
  const char *v58;
  NSObject *v59;
  uint32_t v60;
  NSObject *v61;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  _BYTE *v68;
  float *v69;
  float *v70;
  uint64_t v71;
  uint8_t buf[32];
  void *__p[4];
  uint8_t v74[8];
  float *v75;
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  if (!a6)
  {
    std::vector<float>::vector(v74, 0);
    goto LABEL_17;
  }
  v11 = a3;
  v12 = a2;
  v13 = a1;
  v14 = 0;
  v15 = (float *)a2 + 1;
  v16 = (float *)(a4 + 4);
  v17 = (float *)a3 + 1;
  while (1)
  {
    LODWORD(v18) = HIDWORD(*(_QWORD *)&a1[v14]);
    if (COERCE_FLOAT(*(_QWORD *)&a1[v14]) == -1.0 || v18 == -1.0)
      break;
    if (v18 > *v15 || v18 > *v16 || v18 > *v17)
    {
      __ABPKLogSharedInstance();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v74 = 0;
        _os_log_impl(&dword_210836000, v56, OS_LOG_TYPE_DEBUG, " Waving Hand: Hand too low ", v74, 2u);
      }
      goto LABEL_64;
    }
    ++v14;
    v17 += 2;
    v16 += 2;
    v15 += 2;
    if (a6 == v14)
    {
      std::vector<float>::vector(v74, a6);
      v20 = *(float **)v74;
      v21 = a6;
      do
      {
        v22 = *v13++;
        v23 = v22;
        v24 = *v12++;
        v25 = v24;
        v26 = vsub_f32(v23, v24);
        v27 = *v11++;
        v28 = vsub_f32(v27, v25);
        v29 = atan2f(vmlas_n_f32((float)-v26.f32[1] * v28.f32[0], v28.f32[1], v26.f32[0]), vaddv_f32(vmul_f32(v26, v28)))* 0.318309886* 180.0;
        v30 = (int)v29 % 360;
        if (v30 < 0)
          v30 = -v30;
        *v20++ = (float)v30;
        --v21;
      }
      while (v21);
LABEL_17:
      if (a6 - a7 >= a6)
        goto LABEL_26;
      v31 = -(uint64_t)a7;
      v33 = 1000.0;
      v34 = -1000.0;
      do
      {
        v32 = *(_QWORD *)v74 + 4 * a6;
        v35 = *(float *)(v32 + 4 * v31);
        if (v35 < v33)
          v33 = *(float *)(v32 + 4 * v31);
        if (v35 > v34)
          v34 = *(float *)(v32 + 4 * v31);
        v36 = __CFADD__(v31++, 1);
      }
      while (!v36);
      if ((float)(v34 - v33) < 20.0)
      {
LABEL_26:
        __ABPKLogSharedInstance();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_210836000, v37, OS_LOG_TYPE_DEBUG, " Waving Hand: Angles not changing enough for waving ", buf, 2u);
        }

      }
      std::vector<std::vector<float>>::vector(buf, a6);
      if (a6)
      {
        v38 = 0;
        do
        {
          std::vector<float>::vector(__p, a6);
          v39 = 0;
          v40 = *(float **)v74;
          v41 = (float *)__p[0];
          do
          {
            v41[v39] = vabds_f32(v40[v39], v40[v38]);
            ++v39;
          }
          while (a6 != v39);
          v42 = (void **)(*(_QWORD *)buf + 24 * v38);
          if (v42 == __p
            || (std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)v42, (char *)v41, (uint64_t)__p[1], ((char *)__p[1] - (char *)v41) >> 2), (v41 = (float *)__p[0]) != 0))
          {
            __p[1] = v41;
            operator delete(v41);
          }
          ++v38;
        }
        while (v38 != a6);
        v43 = 0;
        v44 = 0;
        while (1)
        {
          memset(__p, 0, 24);
          std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(__p, *(const void **)(*(_QWORD *)buf + 24 * v43), *(_QWORD *)(*(_QWORD *)buf + 24 * v43 + 8), (uint64_t)(*(_QWORD *)(*(_QWORD *)buf + 24 * v43 + 8) - *(_QWORD *)(*(_QWORD *)buf + 24 * v43)) >> 2);
          v69 = 0;
          v70 = 0;
          v71 = 0;
          std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v69, __p[0], (uint64_t)__p[1], ((char *)__p[1] - (char *)__p[0]) >> 2);
          v45 = v70 - v69;
          v46 = (float)v45;
          if (v70 == v69)
          {
            v51 = 0.0 / v46;
            if (!v70)
              goto LABEL_47;
          }
          else
          {
            if (v45 <= 1)
              v47 = 1;
            else
              v47 = v70 - v69;
            v48 = 0.0;
            v49 = v69;
            do
            {
              v50 = *v49++;
              v48 = v48 + v50;
              --v47;
            }
            while (v47);
            v51 = v48 / v46;
          }
          v70 = v69;
          operator delete(v69);
LABEL_47:
          std::vector<float>::vector(&v67, a6);
          v52 = 0;
          v53 = (float *)__p[0];
          v54 = (float *)v67;
          do
          {
            v54[v52] = v53[v52] - v51;
            ++v52;
          }
          while (a6 != v52);
          v64 = 0;
          v65 = 0;
          v66 = 0;
          std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v64, v54, (uint64_t)v68, (v68 - (_BYTE *)v54) >> 2);
          FrequencyOfZeroCrossing = getFrequencyOfZeroCrossing((uint64_t *)&v64, 1.0);
          if (v64)
          {
            v65 = v64;
            operator delete(v64);
          }
          if (FrequencyOfZeroCrossing != 0.0)
            ++v44;
          if (v67)
          {
            v68 = v67;
            operator delete(v67);
          }
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
          if (++v43 == a6)
            goto LABEL_66;
        }
      }
      v44 = 0;
LABEL_66:
      v36 = (unint64_t)v44 >= a8;
      v57 = v36;
      if (v36)
      {
        __ABPKLogSharedInstance();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(__p[0]) = 0;
          v58 = " Waving Hand: Gesture detected ";
          v59 = v61;
          v60 = 2;
          goto LABEL_72;
        }
      }
      else
      {
        __ABPKLogSharedInstance();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(__p[0]) = 134218240;
          *(void **)((char *)__p + 4) = v44;
          WORD2(__p[1]) = 2048;
          *(void **)((char *)&__p[1] + 6) = (void *)a6;
          v58 = " Waving Hand: No periodic motion detected (%lu/%lu periodic frames) ";
          v59 = v61;
          v60 = 22;
LABEL_72:
          _os_log_impl(&dword_210836000, v59, OS_LOG_TYPE_DEBUG, v58, (uint8_t *)__p, v60);
        }
      }

      __p[0] = buf;
      std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
      if (*(_QWORD *)v74)
      {
        v75 = *(float **)v74;
        operator delete(*(void **)v74);
      }
      return v57;
    }
  }
  __ABPKLogSharedInstance();
  v56 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v74 = 67109120;
    *(_DWORD *)&v74[4] = v14;
    _os_log_impl(&dword_210836000, v56, OS_LOG_TYPE_DEBUG, " Waving Hand: Wrist not detected in frame: %d ", v74, 8u);
  }
LABEL_64:

  return 0;
}

void sub_210865964(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char *a23,uint64_t a24,uint64_t a25,uint64_t a26,void *__p,uint64_t a28)
{
  a23 = &a19;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a23);
  if (__p)
  {
    a28 = (uint64_t)__p;
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

BOOL detectFaceVisible(int a1, int a2, int a3, int a4, int a5)
{
  _BOOL8 v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  uint8_t *v13;
  __int16 v15;
  __int16 v16;

  v9 = a1 == 1 && a2 == 1 && a3 == 1 && a4 == 1 && a5 == 1;
  __ABPKLogSharedInstance();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (v9)
  {
    if (v11)
    {
      v16 = 0;
      v12 = " Face visible: YES ";
      v13 = (uint8_t *)&v16;
LABEL_21:
      _os_log_impl(&dword_210836000, v10, OS_LOG_TYPE_DEBUG, v12, v13, 2u);
    }
  }
  else if (v11)
  {
    v15 = 0;
    v12 = " Face visible: NO ";
    v13 = (uint8_t *)&v15;
    goto LABEL_21;
  }

  return v9;
}

_QWORD *std::vector<std::vector<float>>::vector(_QWORD *a1, unint64_t a2)
{
  char *v4;
  size_t v5;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<cva::Matrix<double,3u,1u,false>>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    v5 = 24 * ((24 * a2 - 24) / 0x18) + 24;
    bzero(v4, v5);
    a1[1] = &v4[v5];
  }
  return a1;
}

void sub_210865B34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>(char *result, char *__src, uint64_t a3, unint64_t a4)
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
  if (a4 > (v8 - *(_QWORD *)result) >> 2)
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
    if (a4 >> 62)
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    v10 = v8 >> 1;
    if (v8 >> 1 <= a4)
      v10 = a4;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFFCLL)
      v11 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = std::vector<float>::__vallocate[abi:ne180100](v7, v11);
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
  v15 = (v14 - v9) >> 2;
  if (v15 >= a4)
    goto LABEL_16;
  v16 = &__src[4 * v15];
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

void printCGRect(double a1, double a2, double a3, double a4)
{
  NSObject *v8;
  NSObject *v9;
  int v10;
  double v11;
  __int16 v12;
  double v13;
  __int16 v14;
  double v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  __ABPKLogSharedInstance();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10 = 134218752;
    v11 = a1;
    v12 = 2048;
    v13 = a2;
    v14 = 2048;
    v15 = a3;
    v16 = 2048;
    v17 = a4;
    _os_log_impl(&dword_210836000, v8, OS_LOG_TYPE_DEBUG, " \t\t Start, Size: (%f,%f,%f,%f) ", (uint8_t *)&v10, 0x2Au);
  }

  __ABPKLogSharedInstance();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = 134218752;
    v11 = a1;
    v12 = 2048;
    v13 = a2;
    v14 = 2048;
    v15 = a1 + a3;
    v16 = 2048;
    v17 = a2 + a4;
    _os_log_impl(&dword_210836000, v9, OS_LOG_TYPE_DEBUG, " \t\t Start, End: (%f,%f,%f,%f) ", (uint8_t *)&v10, 0x2Au);
  }

}

float computeIOUbetweenRects(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
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
  BOOL v21;
  float v24;
  NSObject *v25;
  uint8_t v27[16];

  v8 = a1;
  v9 = a2;
  v10 = a3;
  v11 = v8 + v10;
  v12 = a4;
  v13 = v9 + v12;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = v14 + v16;
  v18 = a8;
  v19 = v15 + v18;
  v20 = 0.0;
  if (v8 <= v14)
    v21 = v11 < v14;
  else
    v21 = v17 < v8;
  if (!v21 && v19 >= v9 && v13 >= v15)
  {
    v24 = (float)(fminf(v11, v17) - fmaxf(v8, v14)) * (float)(fminf(v13, v19) - fmaxf(v9, v15));
    v20 = v24
        / (float)((float)((float)((float)(v19 - v15) * (float)(v17 - v14))
                        + (float)((float)(v11 - v8) * (float)(v13 - v9)))
                - v24);
    if (v20 < 0.0)
    {
      __ABPKLogSharedInstance();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v27 = 0;
        _os_log_impl(&dword_210836000, v25, OS_LOG_TYPE_ERROR, " iou < 0.0 ", v27, 2u);
      }

    }
  }
  return v20;
}

uint64_t isANSTPersonTrackerSupportedOnThisDevice()
{
  return determineDeviceANEVersionPriorOrEqualToH14() ^ 1;
}

void sub_210866340(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2108663DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2108666FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;

  _Unwind_Resume(a1);
}

void sub_210866A1C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

__CFString *getABPKAlgorithmExitPointTypeAsString(unint64_t a1)
{
  if (a1 > 7)
    return 0;
  else
    return off_24CA6E9B0[a1];
}

void sub_210866C84(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210866D44(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210867198(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210867458(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21086781C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v3;

  _Unwind_Resume(a1);
}

void sub_210867AB8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210867C64(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

const __CFString *convertABPKDeviceOrientationEnumToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return &stru_24CA6F820;
  else
    return off_24CA6E9F0[a1 - 1];
}

BOOL ABPKDeviceOrientationIsLandscape(uint64_t a1)
{
  return (unint64_t)(a1 - 3) < 2;
}

BOOL ABPKDeviceOrientationIsPortrait(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

void sub_210867DA0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21086808C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210868484(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)ABPKPoseEstimationPipeline;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_21086862C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  _Unwind_Resume(a1);
}

void sub_210869E04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31,uint64_t a32,uint64_t a33,void *a34,void *__p,uint64_t a36)
{
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;

  _Unwind_Resume(a1);
}

void sub_21086A2BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  void *v26;
  void *v27;

  _Unwind_Resume(a1);
}

void sub_21086A404(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

_QWORD *std::vector<simd_float4x4>::__init_with_size[abi:ne180100]<simd_float4x4 const*,simd_float4x4 const*>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<simd_float4x4>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_21086A6C0(_Unwind_Exception *exception_object)
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

const float *DepthAndConfidenceInNeighborood(const float *result, int a2, const float *a3, const float *a4, int a5, int a6, int a7, int a8)
{
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  const float *v15;
  const float *v16;
  uint64_t v17;
  float v18;
  uint64_t v19;
  float *v20;

  if (a2 <= 1)
    v8 = 1;
  else
    v8 = a2;
  if (a2 + 1 < a6 - 1)
    v9 = a2 + 1;
  else
    v9 = a6 - 1;
  if ((int)v8 - 1 <= v9)
  {
    if ((int)result <= 1)
      v10 = 1;
    else
      v10 = result;
    v11 = v10 - 1;
    v12 = a5 - 1;
    if ((int)result + 1 < a5 - 1)
      v12 = (_DWORD)result + 1;
    v13 = v8 - 1;
    v14 = (v9 + 1);
    v15 = &a3[v13 * a7 - 1 + v10];
    v16 = &a4[v13 * a8 - 1 + v10];
    v17 = (v12 + 1) - v10 + 1;
    v18 = 3.4028e38;
    do
    {
      v19 = v17;
      result = v16;
      v20 = (float *)v15;
      if (v11 <= v12)
      {
        do
        {
          if (*v20 > 0.0 && *v20 < v18)
            v18 = *v20;
          ++v20;
          ++result;
          --v19;
        }
        while (v19);
      }
      ++v13;
      v15 += a7;
      v16 += a8;
    }
    while (v13 != v14);
  }
  return result;
}

void ExtractJasperNSZs(void *a1@<X0>, char **a2@<X8>)
{
  id v3;
  uint64_t i;
  float32x4_t v5;
  __int128 v6;
  unint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  __int128 v18;
  __int128 v19;
  id v20;

  v3 = a1;
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  v20 = v3;
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE7reserveEm((void **)a2, (int)objc_msgSend(v3, "length"));
  for (i = 0; i < (int)objc_msgSend(v20, "length", v19); ++i)
  {
    if (*(float *)(objc_msgSend(v20, "confidences") + 4 * i) >= 0.85)
    {
      v5 = *(float32x4_t *)(objc_msgSend(v20, "points") + 16 * i);
      *(float32x2_t *)&v6 = vdiv_f32(*(float32x2_t *)v5.f32, (float32x2_t)vdup_laneq_s32((int32x4_t)v5, 2));
      DWORD2(v6) = vmuls_lane_f32(0.001, v5, 2);
      v8 = a2[1];
      v7 = (unint64_t)a2[2];
      if ((unint64_t)v8 >= v7)
      {
        v19 = v6;
        v10 = (v8 - *a2) >> 4;
        if ((unint64_t)(v10 + 1) >> 60)
          std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
        v11 = v7 - (_QWORD)*a2;
        v12 = v11 >> 3;
        if (v11 >> 3 <= (unint64_t)(v10 + 1))
          v12 = v10 + 1;
        if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0)
          v13 = 0xFFFFFFFFFFFFFFFLL;
        else
          v13 = v12;
        if (v13)
          v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::peak>>((uint64_t)(a2 + 2), v13);
        else
          v14 = 0;
        v15 = &v14[16 * v10];
        *(_OWORD *)v15 = v19;
        v9 = v15 + 16;
        v17 = *a2;
        v16 = a2[1];
        if (v16 != *a2)
        {
          do
          {
            v18 = *((_OWORD *)v16 - 1);
            v16 -= 16;
            *((_OWORD *)v15 - 1) = v18;
            v15 -= 16;
          }
          while (v16 != v17);
          v16 = *a2;
        }
        *a2 = v15;
        a2[1] = v9;
        a2[2] = &v14[16 * v13];
        if (v16)
          operator delete(v16);
      }
      else
      {
        *(_OWORD *)v8 = v6;
        v9 = v8 + 16;
      }
      a2[1] = v9;
    }
  }

}

void sub_21086A954(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  uint64_t v12;
  void *v14;

  v14 = *(void **)v12;
  if (*(_QWORD *)v12)
  {
    *(_QWORD *)(v12 + 8) = v14;
    operator delete(v14);
  }

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
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::peak>>(v3, a2);
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

float32_t DepthOfClosestJasperPoint(float32x2_t *a1, float32x2_t **a2)
{
  float32x2_t *v2;
  float32x2_t *v3;
  float32_t result;
  float32x2_t *v5;
  float32x2_t v6;
  float v7;
  float32x2_t *v8;
  float32x2_t v9;
  float32x2_t v10;
  float v11;

  v2 = *a2;
  v3 = a2[1];
  result = -1.0;
  if (*a2 != v3)
  {
    v5 = v2 + 2;
    v6 = vsub_f32(*v2, *a1);
    v7 = vaddv_f32(vmul_f32(v6, v6));
    if (&v2[2] != v3)
    {
      v8 = v2 + 2;
      do
      {
        v9 = *v8;
        v8 += 2;
        v10 = vsub_f32(v9, *a1);
        v11 = vaddv_f32(vmul_f32(v10, v10));
        if (v11 < v7)
        {
          v2 = v5;
          v7 = v11;
        }
        v5 = v8;
      }
      while (v8 != v3);
    }
    if (sqrtf(v7) <= 0.03)
      return v2[1].f32[0];
  }
  return result;
}

float ABPKAdjustIntrinsicsForViewportSize(simd_float3x3 a1, CGSize a2, CGSize a3)
{
  BOOL v4;
  double v5;
  float v6;

  if (a2.width != a3.width || a2.height != a3.height)
  {
    *(double *)a1.columns[0].i64 = a1.columns[0].f32[0];
    v4 = a3.width / a3.height < a2.width / a2.height;
    v5 = a3.width / a2.width;
    if (v4)
      v5 = a3.height / a2.height;
    v6 = v5 * *(double *)a1.columns[0].i64;
    a1.columns[0].f32[0] = v6;
  }
  return a1.columns[0].f32[0];
}

void sub_21086ABD4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21086B418(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,void *__p,uint64_t a51)
{
  void *v51;

  _Unwind_Resume(a1);
}

unsigned int *cva::MatrixRef<float,0u,1u,false>::operator=<cva::MatrixBinaryExpr<cva::MatrixRef<float,0u,1u,false>,cva::MatrixRef<float,0u,1u,false>,cva::detail::MulOp>>(unsigned int *a1, _QWORD *a2)
{
  float *v4;
  float *v5;
  _DWORD *v6;
  unsigned int v7;
  uint64_t v8;
  float *v9;
  float *v10;
  uint64_t v11;
  float v12;
  float v13;
  float v14;
  uint64_t v15;
  cva::Logger *v16;
  uint64_t v17;
  cva::Logger *v18;
  float *v19;
  float *v20;
  uint64_t v21;
  float *v22;
  float v23;
  float v24;
  float v25;
  _DWORD *v26;
  uint64_t v27;
  cva::Logger *v28;
  int v29;
  cva::Logger *v31[2];
  unsigned int v32;

  v4 = (float *)*((_QWORD *)a1 + 1);
  v5 = &v4[-a1[5]];
  v6 = (_DWORD *)*a2;
  if ((float *)(*(_QWORD *)(*a2 + 8) - 4 * *(unsigned int *)(*a2 + 20)) != v5
    && (float *)(*(_QWORD *)(a2[1] + 8) - 4 * *(unsigned int *)(a2[1] + 20)) != v5)
  {
    v7 = *a1;
    if (*a1 != *v6)
    {
      cva::Logger::instance((cva::Logger *)a1);
      cva::Logger::logInCategory();
      v7 = *a1;
      v6 = (_DWORD *)*a2;
      if (*a1 != *(_DWORD *)*a2)
        cva::assign<false,false,cva::Matrix<float,4u,0u,false>,cva::Matrix<float,4u,4u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,4u,false> const>>();
      v4 = (float *)*((_QWORD *)a1 + 1);
    }
    if (v7)
    {
      v8 = v7;
      v9 = *(float **)(a2[1] + 8);
      v10 = (float *)*((_QWORD *)v6 + 1);
      v11 = 4 * v8;
      do
      {
        v12 = *v10++;
        v13 = v12;
        v14 = *v9++;
        *v4++ = v13 * v14;
        v11 -= 4;
      }
      while (v11);
    }
    return a1;
  }
  v15 = *a1;
  v31[0] = 0;
  v31[1] = 0;
  v16 = (cva::Logger *)cva::MatrixData<float,0ul,0ul,false>::allocate((void **)v31, v15);
  v32 = v15;
  v17 = *a2;
  if ((_DWORD)v15 != *(_DWORD *)*a2)
  {
    cva::Logger::instance(v16);
    cva::Logger::logInCategory();
    v15 = v32;
    v17 = *a2;
    if (v32 != *(_DWORD *)*a2)
      goto LABEL_23;
  }
  v18 = v31[0];
  if ((_DWORD)v15)
  {
    v19 = *(float **)(a2[1] + 8);
    v20 = *(float **)(v17 + 8);
    v21 = 4 * v15;
    v22 = (float *)v31[0];
    do
    {
      v23 = *v20++;
      v24 = v23;
      v25 = *v19++;
      *v22++ = v24 * v25;
      v21 -= 4;
    }
    while (v21);
  }
  if (*a1 == (_DWORD)v15)
    goto LABEL_18;
  cva::Logger::instance(v18);
  cva::Logger::logInCategory();
  v15 = *a1;
  if ((_DWORD)v15 != v32)
LABEL_23:
    __assert_rtn("assert_equal_size", "matrixfun.h", 163, "(lhs.rows() == rhs.rows() && lhs.columns() == rhs.columns()) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
  v18 = v31[0];
LABEL_18:
  if ((_DWORD)v15)
  {
    v26 = (_DWORD *)*((_QWORD *)a1 + 1);
    v27 = 4 * v15;
    v28 = v18;
    do
    {
      v29 = *(_DWORD *)v28;
      v28 = (cva::Logger *)((char *)v28 + 4);
      *v26++ = v29;
      v27 -= 4;
    }
    while (v27);
  }
  free(v18);
  return a1;
}

void sub_21086B6FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  free(a14);
  _Unwind_Resume(a1);
}

void sub_21086BBEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *__p,uint64_t a34)
{
  void *v34;
  uint64_t v35;
  void *v37;
  void *v38;

  if (__p)
    operator delete(__p);
  v37 = *(void **)(v35 - 168);
  if (v37)
  {
    *(_QWORD *)(v35 - 160) = v37;
    operator delete(v37);
  }
  v38 = *(void **)(v35 - 144);
  if (v38)
  {
    *(_QWORD *)(v35 - 136) = v38;
    operator delete(v38);
  }

  _Unwind_Resume(a1);
}

float *cva::assign<false,false,cva::Matrix<float,1u,1u,false>,cva::MatrixTransposeExpr<cva::MatrixRef<float,0u,1u,false>>,cva::MatrixRef<float,0u,1u,false>>(float *result, uint64_t a2, uint64_t a3)
{
  float *v3;
  unsigned int *v4;
  uint64_t v5;
  unsigned int *v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  float *v11;
  float *v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  BOOL v24;
  unsigned int v25;
  unsigned int v26;
  int v27;

  v3 = result;
  v4 = *(unsigned int **)(a2 + 8);
  v5 = *((_QWORD *)v4 + 1);
  if ((float *)(v5 - 4 * v4[5]) == result)
  {
    v27 = 0;
    result = (float *)cva::assign<false,false,cva::Matrix<float,1u,1u,false>,cva::MatrixTransposeExpr<cva::MatrixRef<float,0u,1u,false>>,cva::MatrixRef<float,0u,1u,false>>(&v27);
    *(_DWORD *)v3 = v27;
  }
  else
  {
    v6 = **(unsigned int ***)a2;
    v7 = *v6;
    v8 = *((_QWORD *)v6 + 1);
    v9 = *v4;
    if ((v9 & 0xFFFFFFFC) != 0)
    {
      v10 = 0;
      v11 = (float *)(v8 + 8);
      v12 = (float *)(v5 + 8);
      v13 = 0.0;
      do
      {
        if (v10 >= v9)
          -[PolyNomialExtrapolation predict].cold.1((uint64_t)result, a2, a3);
        if (v10 >= v7)
          -[PolyNomialExtrapolation predict].cold.1((uint64_t)result, a2, a3);
        v14 = (float)(*(v11 - 1) * *(v12 - 1)) + (float)(*(v11 - 2) * *(v12 - 2));
        v15 = *v11;
        v16 = v11[1];
        v11 += 4;
        v17 = *v12;
        v18 = v12[1];
        v12 += 4;
        v13 = v13 + (float)((float)(v14 + (float)(v15 * v17)) + (float)(v16 * v18));
        v10 += 4;
      }
      while (v10 < (v9 & 0xFFFFFFFC));
    }
    else
    {
      LODWORD(v10) = 0;
      v13 = 0.0;
    }
    if (v10 < (v9 & 0xFFFFFFFE))
    {
      v19 = 0;
      v20 = v10;
      v21 = v8 + 4 * v10;
      do
      {
        v22 = v20 + v19;
        if (v20 + v19 >= v9)
          -[PolyNomialExtrapolation predict].cold.1((uint64_t)result, a2, a3);
        if (v22 >= v7)
          -[PolyNomialExtrapolation predict].cold.1((uint64_t)result, a2, a3);
        v13 = v13
            + (float)((float)(*(float *)(v21 + 4 * v19 + 4) * *(float *)(v5 + 4 * v22 + 4))
                    + (float)(*(float *)(v21 + 4 * v19) * *(float *)(v5 + 4 * v22)));
        v19 += 2;
      }
      while (v20 + v19 < (unint64_t)(v9 & 0xFFFFFFFE));
      LODWORD(v10) = v20 + v19;
    }
    if (v10 < v9)
    {
      v23 = v10;
      v24 = v7 >= v10;
      v25 = v7 - v10;
      if (!v24)
        v25 = 0;
      v26 = v9 + ~(_DWORD)v10;
      do
      {
        if (v25 <= v26)
          -[PolyNomialExtrapolation predict].cold.1((uint64_t)result, a2, a3);
        v13 = v13 + (float)(*(float *)(v8 + 4 * v23) * *(float *)(v5 + 4 * v23));
        ++v23;
      }
      while (v9 != v23);
    }
    *result = v13;
  }
  return result;
}

void sub_21086C04C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21086CCD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,void *a24,void *a25,void *__p,uint64_t a27)
{
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v35;

  if (__p)
    operator delete(__p);
  v35 = *(void **)(v33 - 160);
  if (v35)
  {
    *(_QWORD *)(v33 - 152) = v35;
    operator delete(v35);
  }

  _Unwind_Resume(a1);
}

void sub_21086D494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  void *v4;
  va_list va;

  va_start(va, a4);
  std::vector<abpk::Human>::__destroy_vector::operator()[abi:ne180100]((void ***)va);

  _Unwind_Resume(a1);
}

void sub_21086E3C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, void *__p, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30)
{

  _Unwind_Resume(a1);
}

uint64_t abpk::SkeletonJointFilter<float>::filter(uint64_t a1, float *a2, unint64_t a3, double a4)
{
  float *v7;
  float *v8;
  uint64_t v9;
  uint64_t v10;
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
  int v23;
  double v24;

  v24 = a4;
  v7 = *(float **)a1;
  v8 = *(float **)(a1 + 8);
  if (a3 == ((uint64_t)v8 - *(_QWORD *)a1) >> 2)
  {
    if (v8 != v7)
    {
      v9 = 0;
      v10 = *(_QWORD *)(a1 + 24);
      while (1)
      {
        v11 = v7[v9];
        if (v11 < 0.0)
        {
          v12 = a2[v9];
          if (v12 > 0.0)
          {
            v7[v9] = v12;
            *(_DWORD *)(v10 + 4 * v9) = 0;
            v11 = v7[v9];
          }
        }
        v13 = v11 + (float)(*(float *)(a1 + 96) * *(float *)(v10 + 4 * v9));
        v14 = a2[v9];
        if (v14 >= 0.0)
          break;
        if (v9 > 0x25 || ((1 << v9) & 0x3CF0000003) == 0)
          goto LABEL_22;
        v7[v9] = v14;
        v15 = 0.0;
LABEL_23:
        *(float *)(v10 + 4 * v9++) = v15;
        if (a3 <= v9)
          return a1;
      }
      *(double *)(*(_QWORD *)(a1 + 48) + 8 * v9) = a4;
      v16 = vabds_f32(v14, v13);
      v17 = *(float *)(a1 + 76);
      v18 = 0.0;
      if (v16 >= v17)
      {
        if (v16 >= *(float *)(a1 + 80))
        {
          v19 = *(float *)(a1 + 84);
          v18 = 1.0;
          if (v16 >= v19)
          {
            v18 = 0.0;
            if (v16 < *(float *)(a1 + 88))
              v18 = 1.0 - (float)((float)(v16 - v19) * *(float *)(a1 + 108));
          }
        }
        else
        {
          v18 = (float)(v16 - v17) * *(float *)(a1 + 104);
        }
      }
      v20 = fminf(*(float *)(a1 + 100) + (float)(v18 / (float)(*(float *)(a1 + 72) + 1.0)), 1.0);
      v21 = fmaxf(v20, 0.5);
      if (((1 << v9) & 0x3CF0000003) == 0)
        v21 = v20;
      if (v9 <= 0x25)
        v20 = v21;
      v13 = (float)(v13 * (float)(1.0 - v20)) + (float)(v20 * v14);
LABEL_22:
      v7[v9] = v13;
      v15 = (float)((float)(1.0 - *(float *)(a1 + 112)) * *(float *)(v10 + 4 * v9))
          + (float)(*(float *)(a1 + 112) * (float)(v13 - v11));
      goto LABEL_23;
    }
  }
  else
  {
    std::vector<float>::resize(a1, a3);
    memcpy(*(void **)a1, a2, 4 * a3);
    v23 = 0;
    std::vector<float>::resize(a1 + 24, a3, &v23);
    std::vector<double>::resize(a1 + 48, a3, &v24);
  }
  return a1;
}

uint64_t *abpk::SkeletonJointFilter<float>::applyTimeConstraint(uint64_t *result, double a2, double a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (a3 >= 0.0)
  {
    v3 = *result;
    v4 = result[1];
    v5 = v4 - *result;
    if (v4 != *result)
    {
      v6 = 0;
      v7 = v5 >> 2;
      v8 = result[6];
      do
      {
        if (a2 - *(double *)(v8 + 8 * v6) > a3)
        {
          *(_DWORD *)(result[3] + 4 * v6) = 0;
          *(_DWORD *)(v3 + 4 * v6) = -1082130432;
        }
        ++v6;
      }
      while (v7 > v6);
    }
  }
  return result;
}

void printCGRect(CGRect a1, float a2, float a3)
{
  double height;
  double width;
  double y;
  double x;
  NSObject *v9;
  int v10;
  double v11;
  __int16 v12;
  double v13;
  __int16 v14;
  double v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  height = a1.size.height;
  width = a1.size.width;
  y = a1.origin.y;
  x = a1.origin.x;
  v18 = *MEMORY[0x24BDAC8D0];
  __ABPKLogSharedInstance();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = 134218752;
    v11 = x * a2;
    v12 = 2048;
    v13 = y * a3;
    v14 = 2048;
    v15 = width * a2 + v11;
    v16 = 2048;
    v17 = height * a3 + v13;
    _os_log_impl(&dword_210836000, v9, OS_LOG_TYPE_DEBUG, " \t\t (%f,%f,%f,%f) ", (uint8_t *)&v10, 0x2Au);
  }

}

void sub_21086F000(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21086F418(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  if (__p)
    operator delete(__p);
  if (a11)
    operator delete(a11);
  _Unwind_Resume(exception_object);
}

uint64_t abpk::SkeletonJointFilter<float>::~SkeletonJointFilter(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(_QWORD *)(a1 + 56) = v2;
    operator delete(v2);
  }
  v3 = *(void **)(a1 + 24);
  if (v3)
  {
    *(_QWORD *)(a1 + 32) = v3;
    operator delete(v3);
  }
  v4 = *(void **)a1;
  if (*(_QWORD *)a1)
  {
    *(_QWORD *)(a1 + 8) = v4;
    operator delete(v4);
  }
  return a1;
}

__n128 _ZNSt3__123__optional_storage_baseINS_6vectorIDv2_fNS_9allocatorIS2_EEEELb0EE13__assign_fromB8ne180100INS_27__optional_move_assign_baseIS5_Lb0EEEEEvOT_(uint64_t a1, __n128 *a2)
{
  __n128 result;
  void *v4;

  if (*(unsigned __int8 *)(a1 + 24) == a2[1].n128_u8[8])
  {
    if (*(_BYTE *)(a1 + 24))
      result.n128_u64[0] = std::vector<float>::__move_assign(a1, a2).n128_u64[0];
  }
  else if (*(_BYTE *)(a1 + 24))
  {
    v4 = *(void **)a1;
    if (*(_QWORD *)a1)
    {
      *(_QWORD *)(a1 + 8) = v4;
      operator delete(v4);
    }
    *(_BYTE *)(a1 + 24) = 0;
  }
  else
  {
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
    result = *a2;
    *(__n128 *)a1 = *a2;
    *(_QWORD *)(a1 + 16) = a2[1].n128_u64[0];
    a2->n128_u64[0] = 0;
    a2->n128_u64[1] = 0;
    a2[1].n128_u64[0] = 0;
    *(_BYTE *)(a1 + 24) = 1;
  }
  return result;
}

void _ZNSt3__123__optional_storage_baseINS_6vectorIDv2_fNS_9allocatorIS2_EEEELb0EE13__assign_fromB8ne180100IRKNS_27__optional_copy_assign_baseIS5_Lb0EEEEEvOT_(uint64_t a1, uint64_t a2)
{
  void *v3;

  if (*(unsigned __int8 *)(a1 + 24) == *(unsigned __int8 *)(a2 + 24))
  {
    if (a1 != a2)
    {
      if (*(_BYTE *)(a1 + 24))
        _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l((char *)a1, *(char **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 3);
    }
  }
  else if (*(_BYTE *)(a1 + 24))
  {
    v3 = *(void **)a1;
    if (*(_QWORD *)a1)
    {
      *(_QWORD *)(a1 + 8) = v3;
      operator delete(v3);
    }
    *(_BYTE *)(a1 + 24) = 0;
  }
  else
  {
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m((_QWORD *)a1, *(const void **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 3);
    *(_BYTE *)(a1 + 24) = 1;
  }
}

_QWORD *_ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<unsigned long>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_21086F88C(_Unwind_Exception *exception_object)
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

abpk::Human *abpk::Human::Human(abpk::Human *this, const abpk::Human *a2)
{
  uint64_t v4;

  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(this, *(const void **)a2, *((_QWORD *)a2 + 1), (uint64_t)(*((_QWORD *)a2 + 1) - *(_QWORD *)a2) >> 3);
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 5) = 0;
  std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>((_QWORD *)this + 3, *((const void **)a2 + 3), *((_QWORD *)a2 + 4), (uint64_t)(*((_QWORD *)a2 + 4) - *((_QWORD *)a2 + 3)) >> 2);
  *((_QWORD *)this + 6) = 0;
  *((_QWORD *)this + 7) = 0;
  *((_QWORD *)this + 8) = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>((_QWORD *)this + 6, *((const void **)a2 + 6), *((_QWORD *)a2 + 7), (uint64_t)(*((_QWORD *)a2 + 7) - *((_QWORD *)a2 + 6)) >> 2);
  _ZNSt3__120__optional_copy_baseINS_6vectorIDv2_fNS_9allocatorIS2_EEEELb0EEC2B8ne180100ERKS6_((uint64_t)this + 72, (uint64_t)a2 + 72);
  v4 = *((_QWORD *)a2 + 13);
  *(_QWORD *)((char *)this + 109) = *(_QWORD *)((char *)a2 + 109);
  *((_QWORD *)this + 13) = v4;
  return this;
}

void sub_21086F94C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void **v3;
  void *v5;
  void *v6;
  void *v7;

  v5 = *v3;
  if (*v3)
  {
    *(_QWORD *)(v1 + 56) = v5;
    operator delete(v5);
  }
  v6 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 32) = v6;
    operator delete(v6);
  }
  v7 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v7;
    operator delete(v7);
  }
  _Unwind_Resume(exception_object);
}

uint64_t _ZNSt3__120__optional_copy_baseINS_6vectorIDv2_fNS_9allocatorIS2_EEEELb0EEC2B8ne180100ERKS6_(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = 0;
  *(_BYTE *)(a1 + 24) = 0;
  _ZNSt3__123__optional_storage_baseINS_6vectorIDv2_fNS_9allocatorIS2_EEEELb0EE16__construct_fromB8ne180100IRKNS_20__optional_copy_baseIS5_Lb0EEEEEvOT_((_QWORD *)a1, a2);
  return a1;
}

void sub_21086F9C4(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(_BYTE *)(v1 + 24))
    _ZNSt3__120__optional_copy_baseINS_6vectorIDv2_fNS_9allocatorIS2_EEEELb0EEC2B8ne180100ERKS6__cold_1(v1);
  _Unwind_Resume(exception_object);
}

_QWORD *_ZNSt3__123__optional_storage_baseINS_6vectorIDv2_fNS_9allocatorIS2_EEEELb0EE16__construct_fromB8ne180100IRKNS_20__optional_copy_baseIS5_Lb0EEEEEvOT_(_QWORD *result, uint64_t a2)
{
  _QWORD *v2;

  if (*(_BYTE *)(a2 + 24))
  {
    v2 = result;
    *result = 0;
    result[1] = 0;
    result[2] = 0;
    result = _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(result, *(const void **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 3);
    *((_BYTE *)v2 + 24) = 1;
  }
  return result;
}

_QWORD *std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<unsigned long>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_21086FA84(_Unwind_Exception *exception_object)
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

abpk::Human *std::vector<abpk::Human>::__init_with_size[abi:ne180100]<abpk::Human*,abpk::Human*>(abpk::Human *result, abpk::Human *a2, abpk::Human *a3, unint64_t a4)
{
  abpk::Human *v6;

  if (a4)
  {
    v6 = result;
    std::vector<abpk::Human>::__vallocate[abi:ne180100](result, a4);
    result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<abpk::Human>,abpk::Human*,abpk::Human*,abpk::Human*>((uint64_t)v6 + 16, a2, a3, *((abpk::Human **)v6 + 1));
    *((_QWORD *)v6 + 1) = result;
  }
  return result;
}

void sub_21086FB04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 8) = v10;
  std::vector<abpk::Human>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<abpk::Human>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0x222222222222223)
    std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::Human>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[120 * v4];
  return result;
}

abpk::Human *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<abpk::Human>,abpk::Human*,abpk::Human*,abpk::Human*>(uint64_t a1, abpk::Human *a2, abpk::Human *a3, abpk::Human *this)
{
  abpk::Human *v4;
  const abpk::Human *v6;
  _QWORD v8[3];
  char v9;
  abpk::Human *v10;
  abpk::Human *v11;

  v4 = this;
  v10 = this;
  v11 = this;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  v9 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      abpk::Human::Human(v4, v6);
      v6 = (const abpk::Human *)((char *)v6 + 120);
      v4 = (abpk::Human *)((char *)v11 + 120);
      v11 = (abpk::Human *)((char *)v11 + 120);
    }
    while (v6 != a3);
  }
  v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<abpk::Human>,abpk::Human*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

void sub_21086FC00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<abpk::Human>,abpk::Human*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<abpk::Human>,abpk::Human*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<abpk::Human>,abpk::Human*>::operator()[abi:ne180100]((uint64_t *)a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<abpk::Human>,abpk::Human*>::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (uint64_t *)a1[1];
  v1 = (uint64_t *)a1[2];
  v3 = *v1;
  v4 = *v2;
  if (*v1 != *v2)
  {
    v5 = *a1;
    do
    {
      v3 -= 120;
      std::allocator<abpk::Human>::destroy[abi:ne180100](v5, v3);
    }
    while (v3 != v4);
  }
}

void std::vector<float>::resize(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  unint64_t v3;

  v3 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 2;
  if (a2 <= v3)
  {
    if (a2 < v3)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 4 * a2;
  }
  else
  {
    std::vector<float>::__append((void **)a1, a2 - v3, a3);
  }
}

void std::vector<double>::resize(uint64_t a1, unint64_t a2, _QWORD *a3)
{
  unint64_t v3;

  v3 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3;
  if (a2 <= v3)
  {
    if (a2 < v3)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 8 * a2;
  }
  else
  {
    std::vector<double>::__append((void **)a1, a2 - v3, a3);
  }
}

void std::vector<float>::__append(void **a1, unint64_t a2, _DWORD *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  _DWORD *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  _DWORD *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *i;
  int v25;

  v8 = a1[2];
  v6 = (uint64_t)(a1 + 2);
  v7 = v8;
  v9 = *(_DWORD **)(v6 - 8);
  if (a2 <= (v8 - (_BYTE *)v9) >> 2)
  {
    if (a2)
    {
      v16 = 4 * a2;
      v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 4;
      }
      while (v16);
      v9 = v17;
    }
    a1[1] = v9;
  }
  else
  {
    v10 = (char *)v9 - (_BYTE *)*a1;
    v11 = a2 + (v10 >> 2);
    if (v11 >> 62)
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    v12 = v10 >> 2;
    v13 = v7 - (_BYTE *)*a1;
    if (v13 >> 1 > v11)
      v11 = v13 >> 1;
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFFCLL)
      v14 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v14 = v11;
    if (v14)
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v6, v14);
    else
      v15 = 0;
    v18 = &v15[4 * v12];
    v19 = &v18[4 * a2];
    v20 = 4 * a2;
    v21 = v18;
    do
    {
      *(_DWORD *)v21 = *a3;
      v21 += 4;
      v20 -= 4;
    }
    while (v20);
    v22 = &v15[4 * v14];
    v23 = (char *)*a1;
    for (i = (char *)a1[1]; i != v23; i -= 4)
    {
      v25 = *((_DWORD *)i - 1);
      *((_DWORD *)v18 - 1) = v25;
      v18 -= 4;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23)
      operator delete(v23);
  }
}

void std::vector<double>::__append(void **a1, unint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  _QWORD *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *i;
  uint64_t v25;

  v8 = a1[2];
  v6 = (uint64_t)(a1 + 2);
  v7 = v8;
  v9 = *(_QWORD **)(v6 - 8);
  if (a2 <= (v8 - (_BYTE *)v9) >> 3)
  {
    if (a2)
    {
      v16 = 8 * a2;
      v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 8;
      }
      while (v16);
      v9 = v17;
    }
    a1[1] = v9;
  }
  else
  {
    v10 = (char *)v9 - (_BYTE *)*a1;
    v11 = a2 + (v10 >> 3);
    if (v11 >> 61)
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    v12 = v10 >> 3;
    v13 = v7 - (_BYTE *)*a1;
    if (v13 >> 2 > v11)
      v11 = v13 >> 2;
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8)
      v14 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v14 = v11;
    if (v14)
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v6, v14);
    else
      v15 = 0;
    v18 = &v15[8 * v12];
    v19 = &v18[8 * a2];
    v20 = 8 * a2;
    v21 = v18;
    do
    {
      *(_QWORD *)v21 = *a3;
      v21 += 8;
      v20 -= 8;
    }
    while (v20);
    v22 = &v15[8 * v14];
    v23 = (char *)*a1;
    for (i = (char *)a1[1]; i != v23; i -= 8)
    {
      v25 = *((_QWORD *)i - 1);
      *((_QWORD *)v18 - 1) = v25;
      v18 -= 8;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23)
      operator delete(v23);
  }
}

_QWORD *std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<float>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_21086FF74(_Unwind_Exception *exception_object)
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

id ARDeviceANEVersion()
{
  void *v0;

  if (objc_msgSend(MEMORY[0x24BE086D8], "hasANE"))
  {
    objc_msgSend(MEMORY[0x24BE086D8], "aneSubType");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v0 = 0;
  }
  return v0;
}

uint64_t determineDeviceANEVersionPriorOrEqualToH12()
{
  if (determineDeviceANEVersionPriorOrEqualToH12_onceToken != -1)
    dispatch_once(&determineDeviceANEVersionPriorOrEqualToH12_onceToken, &__block_literal_global_1);
  return determineDeviceANEVersionPriorOrEqualToH12_result;
}

void __determineDeviceANEVersionPriorOrEqualToH12_block_invoke()
{
  void *v0;
  char v1;
  id v2;

  ARDeviceANEVersion();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v0, "isEqualToString:", CFSTR("m9")) & 1) != 0
    || (objc_msgSend(v0, "isEqualToString:", CFSTR("h10")) & 1) != 0
    || (objc_msgSend(v0, "isEqualToString:", CFSTR("h11")) & 1) != 0)
  {
    v1 = 1;
  }
  else
  {
    v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("h12"));
  }
  determineDeviceANEVersionPriorOrEqualToH12_result = v1;

}

uint64_t determineDeviceANEVersionPriorOrEqualToH14()
{
  if (determineDeviceANEVersionPriorOrEqualToH14_onceToken != -1)
    dispatch_once(&determineDeviceANEVersionPriorOrEqualToH14_onceToken, &__block_literal_global_8);
  return determineDeviceANEVersionPriorOrEqualToH14_result;
}

void __determineDeviceANEVersionPriorOrEqualToH14_block_invoke()
{
  void *v0;
  char v1;
  id v2;

  ARDeviceANEVersion();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v0, "isEqualToString:", CFSTR("m9")) & 1) != 0
    || (objc_msgSend(v0, "isEqualToString:", CFSTR("h10")) & 1) != 0
    || (objc_msgSend(v0, "isEqualToString:", CFSTR("h11")) & 1) != 0
    || (objc_msgSend(v0, "isEqualToString:", CFSTR("h12")) & 1) != 0
    || (objc_msgSend(v0, "isEqualToString:", CFSTR("h13")) & 1) != 0)
  {
    v1 = 1;
  }
  else
  {
    v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("h14"));
  }
  determineDeviceANEVersionPriorOrEqualToH14_result = v1;

}

id ABPKMLModelAddANEVersion(void *a1, char a2)
{
  id v3;
  void *v4;
  id v5;
  void *v7;
  void *v8;

  v3 = a1;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE086D8], "aneSubType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x24BE086D8], "hasANE")
      && (objc_msgSend(v4, "isEqualToString:", CFSTR("m9")) & 1) == 0)
    {
      objc_msgSend(v4, "uppercaseString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("_"), "stringByAppendingString:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringByAppendingString:", v8);
      v5 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }

  }
  v5 = v3;
LABEL_6:

  return v5;
}

__CFString *ABPKMLModelFolder(int a1)
{
  void *v2;
  __CFString *v3;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BE086D8], "aneSubType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1
    && objc_msgSend(MEMORY[0x24BE086D8], "hasANE")
    && (objc_msgSend(v2, "isEqualToString:", CFSTR("m9")) & 1) == 0)
  {
    v5 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v2, "uppercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (__CFString *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@"), v6);

  }
  else
  {
    v3 = &stru_24CA6F820;
  }

  return v3;
}

id ABPKMLModelPath(void *a1, void *a2, int a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("2DHumanPoseDetectorBreakthrough")) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", CFSTR("2DHumanPoseDetector")) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", CFSTR("2DHumanPoseDetectorFull")) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", CFSTR("3DHumanPoseLifting")) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", CFSTR("3DHumanPoseLiftingSequenceFirstStage")) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR("3DHumanPoseLiftingLSTM")))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("e5bundles/%@.mlmodelc.bundle"), v6);
    objc_msgSend(v5, "pathForResource:ofType:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    ABPKMLModelAddANEVersion(v6, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ABPKMLModelFolder(a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathForResource:ofType:inDirectory:", v7, CFSTR("mlmodelc"), v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  __ABPKLogSharedInstance();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v8;
    _os_log_impl(&dword_210836000, v9, OS_LOG_TYPE_INFO, " Loading the model: %@ ", buf, 0xCu);
  }

  return v8;
}

void sub_210870DD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_210870E5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)ABPK3DLiftingSequence;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_210871260(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210871364(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210871628(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_210872048(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31)
{
  void *v31;

  if (__p)
    operator delete(__p);
  if (a27)
    operator delete(a27);
  if (a30)
    operator delete(a30);

  _Unwind_Resume(a1);
}

void sub_2108729FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, void *a18, void *a19, uint64_t a20)
{
  void *v20;

  _Unwind_Resume(a1);
}

void sub_210872D64(_Unwind_Exception *a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  void *v15;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  std::deque<std::pair<long,long>>::~deque[abi:ne180100](a2);
  v15 = *(void **)(v13 - 136);
  if (v15)
  {
    *(_QWORD *)(v13 - 128) = v15;
    operator delete(v15);
  }
  _Unwind_Resume(a1);
}

double __Block_byref_object_copy__0(_QWORD *a1, _QWORD *a2)
{
  double result;

  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  a1[9] = a2[9];
  result = 0.0;
  *((_OWORD *)a2 + 3) = 0u;
  *((_OWORD *)a2 + 4) = 0u;
  a1[10] = a2[10];
  a1[11] = a2[11];
  a2[10] = 0;
  a2[11] = 0;
  return result;
}

uint64_t __Block_byref_object_dispose__0(uint64_t a1)
{
  return std::deque<std::pair<long,long>>::~deque[abi:ne180100]((_QWORD *)(a1 + 48));
}

unint64_t **abpk::RingBuffer<std::vector<float>,9ul>::Iterator<true>::operator-=(unint64_t **result, unint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  BOOL v4;
  unint64_t v5;
  unint64_t *v6;

  v2 = (unint64_t)result[1];
  if (v2 == 9)
    v2 = **result;
  v3 = a2 % 9;
  if (a2 <= 9)
    v3 = a2;
  v4 = v2 >= v3;
  v5 = v2 - v3;
  if (v4)
  {
    result[1] = (unint64_t *)v5;
    if (*((_BYTE *)result + 16))
      return result;
  }
  else if (*((_BYTE *)result + 16))
  {
    v5 += 9;
    result[1] = (unint64_t *)v5;
    *((_BYTE *)result + 16) = 0;
  }
  else
  {
    v5 = **result;
    result[1] = (unint64_t *)v5;
  }
  v6 = (unint64_t *)**result;
  if (v5 < (unint64_t)v6)
    result[1] = v6;
  return result;
}

void sub_210873630(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210873698(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)ABPK3DLifting;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_210873974(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  void *v11;
  void *v12;
  va_list va;

  va_start(va, a11);

  std::shared_ptr<Espresso::abstract_context>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_210873A4C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210873AF4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210873EE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21087436C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  void *v27;

  std::deque<std::pair<int,int>>::~deque[abi:ne180100](&a27);
  _Unwind_Resume(a1);
}

void std::deque<std::pair<int,int>>::push_back(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v4 = a1[2];
  v5 = a1[1];
  v6 = ((v4 - v5) << 6) - 1;
  if (v4 == v5)
    v6 = 0;
  v7 = a1[5] + a1[4];
  if (v6 == v7)
  {
    std::deque<std::pair<int,int>>::__add_back_capacity(a1);
    v5 = a1[1];
    v7 = a1[5] + a1[4];
  }
  *(_QWORD *)(*(_QWORD *)(v5 + ((v7 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v7 & 0x1FF)) = *a2;
  ++a1[5];
}

uint64_t std::deque<std::pair<int,int>>::~deque[abi:ne180100](_QWORD *a1)
{
  void **v2;
  void **v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = (void **)a1[1];
  v3 = (void **)a1[2];
  a1[5] = 0;
  v4 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      v3 = (void **)a1[2];
      v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      v4 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  v5 = v4 >> 3;
  if (v5 == 1)
  {
    v6 = 256;
  }
  else
  {
    if (v5 != 2)
      goto LABEL_9;
    v6 = 512;
  }
  a1[4] = v6;
LABEL_9:
  while (v2 != v3)
  {
    v7 = *v2++;
    operator delete(v7);
  }
  return std::__split_buffer<std::pair<long,long> *,std::allocator<std::pair<long,long> *>>::~__split_buffer((uint64_t)a1);
}

void std::deque<std::pair<int,int>>::__add_back_capacity(_QWORD *a1)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  char *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  unint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  _QWORD *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  _QWORD *v56;

  v2 = a1[4];
  v3 = v2 >= 0x200;
  v4 = v2 - 512;
  if (v3)
  {
    v5 = (uint64_t)(a1 + 3);
    v6 = (char *)a1[3];
    a1[4] = v4;
    v7 = (_QWORD *)a1[1];
    v8 = (char *)a1[2];
    v11 = *v7;
    v9 = (char *)(v7 + 1);
    v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(_QWORD *)v8 = v10;
      a1[2] += 8;
      return;
    }
    v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1)
        v33 = 1;
      else
        v33 = (uint64_t)&v8[-*a1] >> 2;
      v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v5, v33);
      v35 = &v34[8 * (v33 >> 2)];
      v37 = &v34[8 * v36];
      v38 = (uint64_t *)a1[1];
      v8 = v35;
      v39 = a1[2] - (_QWORD)v38;
      if (v39)
      {
        v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        v40 = 8 * (v39 >> 3);
        v41 = &v34[8 * (v33 >> 2)];
        do
        {
          v42 = *v38++;
          *(_QWORD *)v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    v13 = v12 >> 3;
    v14 = v12 >> 3 < -1;
    v15 = (v12 >> 3) + 2;
    if (v14)
      v16 = v15;
    else
      v16 = v13 + 1;
    v17 = -(v16 >> 1);
    v18 = v16 >> 1;
    v19 = &v9[-8 * v18];
    v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      v9 = (char *)a1[1];
    }
    v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  v21 = a1[2];
  v22 = (v21 - a1[1]) >> 3;
  v23 = a1[3];
  v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(_QWORD *)&v54 = operator new(0x1000uLL);
      std::__split_buffer<std::pair<long,long> *,std::allocator<std::pair<long,long> *>>::push_back(a1, &v54);
      return;
    }
    *(_QWORD *)&v54 = operator new(0x1000uLL);
    std::__split_buffer<std::pair<long,long> *,std::allocator<std::pair<long,long> *>>::push_front((uint64_t)a1, &v54);
    v44 = (_QWORD *)a1[1];
    v8 = (char *)a1[2];
    v45 = *v44;
    v9 = (char *)(v44 + 1);
    v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3])
      goto LABEL_33;
    v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1)
        v46 = 1;
      else
        v46 = (uint64_t)&v8[-*a1] >> 2;
      v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(a1 + 3), v46);
      v35 = &v34[8 * (v46 >> 2)];
      v37 = &v34[8 * v47];
      v48 = (uint64_t *)a1[1];
      v8 = v35;
      v49 = a1[2] - (_QWORD)v48;
      if (v49)
      {
        v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        v50 = 8 * (v49 >> 3);
        v51 = &v34[8 * (v46 >> 2)];
        do
        {
          v52 = *v48++;
          *(_QWORD *)v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1)
    v25 = 1;
  else
    v25 = v24 >> 2;
  v56 = a1 + 3;
  *(_QWORD *)&v54 = std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(a1 + 3), v25);
  *((_QWORD *)&v54 + 1) = v54 + 8 * v22;
  *(_QWORD *)&v55 = *((_QWORD *)&v54 + 1);
  *((_QWORD *)&v55 + 1) = v54 + 8 * v26;
  v53 = operator new(0x1000uLL);
  std::__split_buffer<std::pair<long,long> *,std::allocator<std::pair<long,long> *> &>::push_back(&v54, &v53);
  v27 = (_QWORD *)a1[2];
  v28 = -7 - (_QWORD)v27;
  while (v27 != (_QWORD *)a1[1])
  {
    --v27;
    v28 += 8;
    std::__split_buffer<std::pair<long,long> *,std::allocator<std::pair<long,long> *> &>::push_front((uint64_t)&v54, v27);
  }
  v29 = (char *)*a1;
  v30 = v54;
  v31 = v55;
  *(_QWORD *)&v54 = *a1;
  *((_QWORD *)&v54 + 1) = v27;
  v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  v55 = v32;
  if (v27 != (_QWORD *)v32)
    *(_QWORD *)&v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  if (v29)
    operator delete(v29);
}

void sub_210874A7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  void *v13;

  operator delete(v13);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void sub_210875078(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_210875124(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)ABPKAlgorithmRA;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_210875520(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210875698(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  void *v26;
  void *v27;

  _Unwind_Resume(a1);
}

void sub_210875864(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_210875A50(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21087601C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  void *v17;
  va_list va;

  va_start(va, a15);
  btr::BodyRegistrationInfo::~BodyRegistrationInfo((btr::BodyRegistrationInfo *)va);
  v17 = *(void **)(v15 - 160);
  if (v17)
  {
    *(_QWORD *)(v15 - 152) = v17;
    operator delete(v17);
  }
  std::__tree<unsigned char>::destroy(v15 - 136, *(_QWORD **)(v15 - 128));
  _Unwind_Resume(a1);
}

void sub_21087664C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  void *v14;
  va_list va;

  va_start(va, a13);
  btr::BodyRegistrationInfo::~BodyRegistrationInfo((btr::BodyRegistrationInfo *)va);
  v14 = (void *)STACK[0x238];
  if (STACK[0x238])
  {
    STACK[0x240] = (unint64_t)v14;
    operator delete(v14);
  }

  _Unwind_Resume(a1);
}

void _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm(uint64_t a1, unint64_t a2)
{
  unint64_t v2;

  v2 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 4;
  if (a2 <= v2)
  {
    if (a2 < v2)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 16 * a2;
  }
  else
  {
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE8__appendEm((void **)a1, a2 - v2);
  }
}

uint64_t *std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::pair<int,int>>(uint64_t **a1, int *a2, uint64_t *a3)
{
  uint64_t *v5;
  uint64_t **v6;
  int v7;
  uint64_t **v8;
  int v9;
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
        v9 = *((_DWORD *)v5 + 7);
        if (v7 >= v9)
          break;
        v5 = *v8;
        v6 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (v9 >= v7)
        break;
      v5 = v8[1];
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
    v10 = (uint64_t *)operator new(0x28uLL);
    *(uint64_t *)((char *)v10 + 28) = *a3;
    std::__tree<std::__value_type<long,std::vector<long>>,std::__map_value_compare<long,std::__value_type<long,std::vector<long>>,std::less<long>,true>,std::allocator<std::__value_type<long,std::vector<long>>>>::__insert_node_at(a1, (uint64_t)v8, v6, v10);
    return v10;
  }
  return (uint64_t *)v8;
}

void _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE8__appendEm(void **a1, unint64_t a2)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  __int128 v19;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 4)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 16 * a2);
      v7 += 16 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = v7 - (_BYTE *)*a1;
    v9 = a2 + (v8 >> 4);
    if (v9 >> 60)
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    v10 = v8 >> 4;
    v11 = v5 - (_BYTE *)*a1;
    if (v11 >> 3 > v9)
      v9 = v11 >> 3;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0)
      v12 = 0xFFFFFFFFFFFFFFFLL;
    else
      v12 = v9;
    if (v12)
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::peak>>(v4, v12);
    else
      v13 = 0;
    v14 = &v13[16 * v10];
    v15 = &v13[16 * v12];
    bzero(v14, 16 * a2);
    v16 = &v14[16 * a2];
    v18 = (char *)*a1;
    v17 = (char *)a1[1];
    if (v17 != *a1)
    {
      do
      {
        v19 = *((_OWORD *)v17 - 1);
        v17 -= 16;
        *((_OWORD *)v14 - 1) = v19;
        v14 -= 16;
      }
      while (v17 != v18);
      v17 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v16;
    a1[2] = v15;
    if (v17)
      operator delete(v17);
  }
}

void sub_210876BB0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210876D24(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210876E54(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210877174(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2108775E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2108776A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_210877878(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210877B78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210877BF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)ABPKImagePreProcessing;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_2108781A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2108787DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210878E3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

_QWORD *std::vector<ABPKSRT>::__init_with_size[abi:ne180100]<ABPKSRT const*,ABPKSRT const*>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<ABPKSRT>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_210878F8C(_Unwind_Exception *exception_object)
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

char *std::vector<ABPKSRT>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0x555555555555556)
    std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ABPKSRT>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[48 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ABPKSRT>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(48 * a2);
}

id CreateABPK3DLiftingAlgorithm()
{
  int v0;
  __objc2_class **v1;

  v0 = determineDeviceANEVersionPriorOrEqualToH12();
  v1 = off_24CA6DFF0;
  if (!v0)
    v1 = off_24CA6DFF8;
  return objc_alloc_init(*v1);
}

void sub_2108791EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  _Unwind_Resume(a1);
}

void sub_2108798CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{

  _Unwind_Resume(a1);
}

void sub_210879BF0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

int32x2_t *_distanceBetweenTwoPoses(int32x2_t *result, float32x2_t *a2, uint64_t a3)
{
  float i;
  float32x4_t v4;
  float32x2_t v5;

  for (i = 0.0; a3; --a3)
  {
    *(int32x2_t *)v4.f32 = vrev64_s32(*result);
    *(float32x2_t *)&v4.u32[2] = *a2;
    if ((vmaxv_u16((uint16x4_t)vmovn_s32(vcltzq_f32(v4))) & 1) == 0)
    {
      v5 = vsub_f32((float32x2_t)*result, *a2);
      i = i + sqrtf(vaddv_f32(vmul_f32(v5, v5)));
    }
    ++a2;
    ++result;
  }
  return result;
}

BOOL _isValueInVector(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD **)a1;
  v3 = *(_QWORD *)(a1 + 8) - *(_QWORD *)a1;
  if (!v3)
    return 0;
  v4 = v3 >> 3;
  if (v4 <= 1)
    v5 = 1;
  else
    v5 = v4;
  if (*v2 == a2)
    return 1;
  v7 = 1;
  do
  {
    v8 = v7;
    if (v5 == v7)
      break;
    v9 = v2[v7++];
  }
  while (v9 != a2);
  return v8 < v4;
}

void sub_21087AAA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,void *__p,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35,uint64_t a36)
{
  void *v36;
  void *v37;

  if (__p)
    operator delete(__p);
  if (a35)
    operator delete(a35);

  _Unwind_Resume(a1);
}

void sub_21087B284(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_21087B5F0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_21087B820(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21087BB68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21087C208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{

  _Unwind_Resume(a1);
}

void sub_21087C554(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21087C7A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21087C8A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21087CA40(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21087CB48(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21087CC54(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21087CCB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_21087CD18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_21087D000(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21087D1D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

std::vector<unsigned int> *__cdecl std::vector<unsigned int>::vector(std::vector<unsigned int> *this, std::vector<unsigned int>::size_type __n)
{
  std::vector<unsigned int>::pointer end;

  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  if (__n)
  {
    std::vector<float>::__vallocate[abi:ne180100](this, __n);
    end = this->__end_;
    bzero(end, 4 * __n);
    this->__end_ = &end[__n];
  }
  return this;
}

void sub_21087D3F0(_Unwind_Exception *exception_object)
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

uint64_t variable initialization expression of ABPKImageData.pixelBuffer()
{
  return 0;
}

void *ABPKImageData.pixelBuffer.getter()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR___ABPKImageData_pixelBuffer);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void ABPKImageData.pixelBuffer.setter(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR___ABPKImageData_pixelBuffer);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*ABPKImageData.pixelBuffer.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

double ABPKImageData.timestamp.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___ABPKImageData_timestamp;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t ABPKImageData.timestamp.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___ABPKImageData_timestamp);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*ABPKImageData.timestamp.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id ABPKImageData.__allocating_init(pixelBuffer:timestamp:)(void *a1, double a2)
{
  objc_class *v2;
  char *v5;
  void **v6;
  void *v7;
  char *v8;
  id v9;
  id v10;
  objc_super v12;

  v5 = (char *)objc_allocWithZone(v2);
  v6 = (void **)&v5[OBJC_IVAR___ABPKImageData_pixelBuffer];
  *(_QWORD *)&v5[OBJC_IVAR___ABPKImageData_pixelBuffer] = 0;
  swift_beginAccess();
  v7 = *v6;
  *v6 = a1;
  v8 = v5;
  v9 = a1;

  *(double *)&v8[OBJC_IVAR___ABPKImageData_timestamp] = a2;
  v12.receiver = v8;
  v12.super_class = v2;
  v10 = objc_msgSendSuper2(&v12, sel_init);

  return v10;
}

id ABPKImageData.init(pixelBuffer:timestamp:)(void *a1, double a2)
{
  char *v2;
  void **v5;
  void *v6;
  char *v7;
  id v8;
  id v9;
  objc_super v11;

  v5 = (void **)&v2[OBJC_IVAR___ABPKImageData_pixelBuffer];
  *(_QWORD *)&v2[OBJC_IVAR___ABPKImageData_pixelBuffer] = 0;
  swift_beginAccess();
  v6 = *v5;
  *v5 = a1;
  v7 = v2;
  v8 = a1;

  *(double *)&v7[OBJC_IVAR___ABPKImageData_timestamp] = a2;
  v11.receiver = v7;
  v11.super_class = (Class)type metadata accessor for ABPKImageData();
  v9 = objc_msgSendSuper2(&v11, sel_init);

  return v9;
}

uint64_t type metadata accessor for ABPKImageData()
{
  return objc_opt_self();
}

id ABPKImageData.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ABPKImageData.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ABPKImageData.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ABPKImageData();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void type metadata accessor for CVBuffer()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_254A71DE0)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_254A71DE0);
  }
}

void abpk::Human::resize()
{
  __assert_rtn("resize", "ABPKHuman.cpp", 57, "newSize <= numberOfJoints()");
}

void cva::PoseRefiner<double>::refinePose()
{
  __assert_rtn("enforce", "se3.hpp", 270, "(algebra.template head<3>().norm2Sq() < static_cast<FLOAT>(3.14159265358979323846264338327950288 * 3.14159265358979323846264338327950288 + 1e-3)) || cva::detail::assertMessage(\"Algebra after the logarithm map does not require normalization.\")");
}

void cva::MatrixData<int,0ul,0ul,false>::allocate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0("allocate", "matrixdata.h", a3, "(m_data) || cva::detail::assertMessage(\"Matrix data must be allocated on exit.\")");
}

void cva::MatrixData<int,0ul,0ul,false>::allocate()
{
  __assert_rtn("allocate", "matrixdata.h", 479, "(!m_data) || cva::detail::assertMessage(\"No matrix data must be allocated.\")");
}

void cva::SE3GroupStorage<double,cva::Matrix<double,4u,4u,false>>::SE3GroupStorage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0("operator=", "matrixref.h", a3, "(it == list.end()) || cva::detail::assertMessage(\"Bad number of items in initializer list.\")");
}

void cva::Array<unsigned short,2u,16u>::allocate()
{
  __assert_rtn("allocate", "array.h", 257, "(nullptr != ptr) || cva::detail::assertMessage(\"Out of memory!\")");
}

void cva::SVD<cva::Matrix<float,0u,0u,false>,true>::inverse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_2("MatrixMultExpr", "matrixmultexpr.h", a3, "((lhs.ref().columns() == rhs.ref().rows())) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
}

void cva::MatrixData<float,0ul,0ul,false>::allocate()
{
  __assert_rtn("allocate", "matrixdata.h", 490, "(m_data) || cva::detail::assertMessage(\"Matrix data must be allocated on exit.\")");
}

void cva::SVD<cva::Matrix<float,0u,0u,false>,true>::decomposeDirect<0u,0u>()
{
  __assert_rtn("decomposeDirect", "matrixsvd.h", 433, "(info == 0) || cva::detail::assertMessage(\"gesvd() query workspace size failed!\")");
}

void cva::SVD<cva::Matrix<float,0u,0u,false>,true>::S()
{
  __assert_rtn("VectorAsDiagonalExpr", "vectorasdiagexpr.h", 211, "(std::min(rows, cols) <= vector.elements()) || cva::detail::assertMessage(\"The matrix can't be in both dimensions larger than its diagonal.\")");
}

void cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::Matrix<float,0u,0u,false>>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_0("assert_equal_size", "matrixfun.h", a3, "(lhs.rows() == rhs.rows() && lhs.columns() == rhs.columns()) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
}

void cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>>,cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>>>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_4("assert_in_bounds", "matrixmixin.h", a3, "((row + nRows <= mixed().rows()) && (col + nCols <= mixed().columns())) || cva::detail::assertMessage(\"Index out of bounds!\")");
}

void cva::detail::assignNoAlias<cva::Matrix<float,0u,0u,false>,cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixTransposeExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const> const>,0u,1u>,cva::detail::MulOp>>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_3("operator()", "matrixsubexpr.h", a3, "(row < rows() && column < columns()) || cva::detail::assertMessage(\"Out of range index being used on submatrix expression.\")");
}

void cva::assign<false,false,cva::Matrix<float,4u,0u,false>,cva::Matrix<float,4u,4u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,4u,false> const>>()
{
  __assert_rtn("assert_equal_size", "matrixfun.h", 163, "(lhs.rows() == rhs.rows() && lhs.columns() == rhs.columns()) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
}

void convertNSArrayToSimd3x3_cold_1()
{
  __assert_rtn("convertNSArrayToSimd3x3", "ABPKSimdUtils.m", 122, "[arr count] == 9 || [arr count] == 3");
}

void convertNSArrayToSimd4x4_cold_1()
{
  __assert_rtn("convertNSArrayToSimd4x4", "ABPKSimdUtils.m", 138, "[arr count] == 16");
}

void convertNSMatToSimd4x4_cold_1()
{
  __assert_rtn("convertNSMatToSimd4x4", "ABPKSimdUtils.m", 148, "[arr count] == 4");
}

void convertNSArrayToSimd4_cold_1()
{
  __assert_rtn("convertNSArrayToSimd4", "ABPKSimdUtils.m", 158, "[arr count] == 4");
}

void simdFloat3FromArray_cold_1()
{
  __assert_rtn("simdFloat3FromArray", "ABPKSimdUtils.m", 186, "arr != nil");
}

void simdFloat3FromArray_cold_2()
{
  __assert_rtn("simdFloat3FromArray", "ABPKSimdUtils.m", 187, "[arr count] == 3");
}

void simdFloat4x4FromRotation_cold_1()
{
  __assert_rtn("simdFloat4x4FromRotation", "ABPKSimdUtils.m", 210, "rot != nil && trans != nil");
}

void simdFloat4x4FromRotation_cold_2()
{
  __assert_rtn("simdFloat4x4FromRotation", "ABPKSimdUtils.m", 212, "[trans count] == 3");
}

void simdFloat4x4FromRotation_cold_3()
{
  __assert_rtn("simdFloat4x4FromRotation", "ABPKSimdUtils.m", 211, "[rot count] == 9");
}

void _ZNSt3__120__optional_copy_baseINS_6vectorIDv2_fNS_9allocatorIS2_EEEELb0EEC2B8ne180100ERKS6__cold_1(uint64_t a1)
{
  void *v2;

  v2 = *(void **)a1;
  if (v2)
  {
    *(_QWORD *)(a1 + 8) = v2;
    operator delete(v2);
  }
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8D8](retstr, angle);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
  MEMORY[0x24BDBDD50](c, transform);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x24BDBDF30](c);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x24BDBE628](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x24BDBE630](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBE658](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x24BDD9158](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9180](url, options);
}

void CVBufferRelease(CVBufferRef buffer)
{
  MEMORY[0x24BDC5168](buffer);
}

CVBufferRef CVBufferRetain(CVBufferRef buffer)
{
  return (CVBufferRef)MEMORY[0x24BDC5178](buffer);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5248](allocator, width, height, *(_QWORD *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5258](allocator, surface, pixelBufferAttributes, pixelBufferOut);
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

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x24BDC52F0](pixelBuffer, planeIndex);
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

CFDictionaryRef CVPixelBufferPoolGetPixelBufferAttributes(CVPixelBufferPoolRef pool)
{
  return (CFDictionaryRef)MEMORY[0x24BDC5348](pool);
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

uint64_t CoreIKCreateAltruisticSolverInstance()
{
  return MEMORY[0x24BE1DF90]();
}

uint64_t CoreIKDestroySolver()
{
  return MEMORY[0x24BE1DFD0]();
}

uint64_t CoreIKSolveModelSpaceSource()
{
  return MEMORY[0x24BE1E260]();
}

uint64_t CoreIKSolverGetSourceBufferSize()
{
  return MEMORY[0x24BE1E270]();
}

uint64_t CoreIKSolverGetTargetBufferSize()
{
  return MEMORY[0x24BE1E278]();
}

size_t IOSurfaceGetBytesPerRow(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8BD0](buffer);
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x24BDDD1E0]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
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

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t cva::Logger::logInCategory()
{
  return MEMORY[0x24BE1A240]();
}

uint64_t cva::Logger::instance(cva::Logger *this)
{
  return MEMORY[0x24BE1A250](this);
}

uint64_t cva::VecLib<float>::gemm()
{
  return off_24CA6E1E8();
}

uint64_t cva::VecLib<float>::gemv()
{
  return off_24CA6E1F0();
}

uint64_t cva::vecLib::sysv<double>()
{
  return MEMORY[0x24BE1A260]();
}

uint64_t cva::vecLib::gesvd<float>()
{
  return MEMORY[0x24BE1A270]();
}

uint64_t cva::imwrite<cva::Matrix<unsigned char,3u,1u,false>>()
{
  return MEMORY[0x24BE1A278]();
}

uint64_t cva::imwrite<unsigned short>()
{
  return MEMORY[0x24BE1A290]();
}

uint64_t Espresso::get_internal_context(Espresso *this, void *a2)
{
  return MEMORY[0x24BE2F5F0](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24CA6E278(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24CA6E280(__sz);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x24BDAC7B0](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x24BEDB940](a1);
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

simd_float3x3 __invert_f3(simd_float3x3 a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  simd_float3x3 result;

  MEMORY[0x24BDAC820]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2]);
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
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

  MEMORY[0x24BDAC828]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3]);
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

  MEMORY[0x24BDAC890](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x24BDAC898](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

long double acos(long double __x)
{
  long double result;

  MEMORY[0x24BDAD108](__x);
  return result;
}

long double asin(long double __x)
{
  long double result;

  MEMORY[0x24BDAD188](__x);
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

uint64_t e5rt_buffer_object_create_from_iosurface()
{
  return MEMORY[0x24BE2F6F8]();
}

uint64_t e5rt_buffer_object_get_data_ptr()
{
  return MEMORY[0x24BE2F700]();
}

uint64_t e5rt_buffer_object_get_size()
{
  return MEMORY[0x24BE2F718]();
}

uint64_t e5rt_buffer_object_release()
{
  return MEMORY[0x24BE2F720]();
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

uint64_t e5rt_execution_stream_operation_create_precompiled_compute_operation()
{
  return MEMORY[0x24BE2F7D0]();
}

uint64_t e5rt_execution_stream_operation_get_input_names()
{
  return MEMORY[0x24BE2F7F0]();
}

uint64_t e5rt_execution_stream_operation_get_num_inputs()
{
  return MEMORY[0x24BE2F800]();
}

uint64_t e5rt_execution_stream_operation_get_num_outputs()
{
  return MEMORY[0x24BE2F808]();
}

uint64_t e5rt_execution_stream_operation_get_output_names()
{
  return MEMORY[0x24BE2F820]();
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

uint64_t e5rt_io_port_retain_surface_desc()
{
  return MEMORY[0x24BE2F8F8]();
}

uint64_t e5rt_io_port_retain_tensor_desc()
{
  return MEMORY[0x24BE2F908]();
}

uint64_t e5rt_surface_desc_get_format()
{
  return MEMORY[0x24BE2F9B0]();
}

uint64_t e5rt_surface_desc_get_height()
{
  return MEMORY[0x24BE2F9C0]();
}

uint64_t e5rt_surface_desc_get_width()
{
  return MEMORY[0x24BE2F9D0]();
}

uint64_t e5rt_surface_desc_release()
{
  return MEMORY[0x24BE2F9E8]();
}

uint64_t e5rt_surface_object_alloc()
{
  return MEMORY[0x24BE2F9F8]();
}

uint64_t e5rt_surface_object_create_from_iosurface()
{
  return MEMORY[0x24BE2FA08]();
}

uint64_t e5rt_surface_object_release()
{
  return MEMORY[0x24BE2FA18]();
}

uint64_t e5rt_tensor_desc_dtype_get_component_dtype()
{
  return MEMORY[0x24BE2FA40]();
}

uint64_t e5rt_tensor_desc_dtype_get_element_size()
{
  return MEMORY[0x24BE2FA58]();
}

uint64_t e5rt_tensor_desc_dtype_get_num_components()
{
  return MEMORY[0x24BE2FA60]();
}

uint64_t e5rt_tensor_desc_dtype_release()
{
  return MEMORY[0x24BE2FA68]();
}

uint64_t e5rt_tensor_desc_get_shape()
{
  return MEMORY[0x24BE2FA88]();
}

uint64_t e5rt_tensor_desc_get_strides()
{
  return MEMORY[0x24BE2FA98]();
}

uint64_t e5rt_tensor_desc_release()
{
  return MEMORY[0x24BE2FAA8]();
}

uint64_t e5rt_tensor_desc_retain_dtype()
{
  return MEMORY[0x24BE2FAB8]();
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x24BE2FB00]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x24BE2FB18]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x24BE2FB38]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x24BE2FB88]();
}

uint64_t espresso_network_bind_cvpixelbuffer()
{
  return MEMORY[0x24BE2FBA0]();
}

uint64_t espresso_network_bind_direct_cvpixelbuffer()
{
  return MEMORY[0x24BE2FBA8]();
}

uint64_t espresso_network_declare_input()
{
  return MEMORY[0x24BE2FC10]();
}

uint64_t espresso_network_declare_output()
{
  return MEMORY[0x24BE2FC18]();
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

uint64_t espresso_plan_get_error_info()
{
  return MEMORY[0x24BE2FCB0]();
}

uint64_t espresso_set_image_preprocessing_params()
{
  return MEMORY[0x24BE2FCE0]();
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x24BDAE270](__x);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x24BDAED80](memptr, alignment, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x24BEDD020](dest, src, size, atomic, hasStrong);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
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

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

vImage_Error vImageConvert_420Yp8_CbCr8ToARGB8888(const vImage_Buffer *srcYp, const vImage_Buffer *srcCbCr, const vImage_Buffer *dest, const vImage_YpCbCrToARGB *info, const uint8_t permuteMap[4], const uint8_t alpha, vImage_Flags flags)
{
  return MEMORY[0x24BDB3BD0](srcYp, srcCbCr, dest, info, permuteMap, alpha, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_ARGB8888To420Yp8_CbCr8(const vImage_Buffer *src, const vImage_Buffer *destYp, const vImage_Buffer *destCbCr, const vImage_ARGBToYpCbCr *info, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x24BDB3BE8](src, destYp, destCbCr, info, permuteMap, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_ARGB8888toRGB888(const vImage_Buffer *a1, const vImage_Buffer *a2, vImage_Flags a3)
{
  return MEMORY[0x24BDB3BF0](a1, a2, *(_QWORD *)&a3);
}

vImage_Error vImageConvert_ARGBToYpCbCr_GenerateConversion(const vImage_ARGBToYpCbCrMatrix *matrix, const vImage_YpCbCrPixelRange *pixelRange, vImage_ARGBToYpCbCr *outInfo, vImageARGBType inARGBType, vImageYpCbCrType outYpCbCrType, vImage_Flags flags)
{
  return MEMORY[0x24BDB3BF8](matrix, pixelRange, outInfo, *(_QWORD *)&inARGBType, *(_QWORD *)&outYpCbCrType, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_YpCbCrToARGB_GenerateConversion(const vImage_YpCbCrToARGBMatrix *matrix, const vImage_YpCbCrPixelRange *pixelRange, vImage_YpCbCrToARGB *outInfo, vImageYpCbCrType inYpCbCrType, vImageARGBType outARGBType, vImage_Flags flags)
{
  return MEMORY[0x24BDB3C10](matrix, pixelRange, outInfo, *(_QWORD *)&inYpCbCrType, *(_QWORD *)&outARGBType, *(_QWORD *)&flags);
}

vImage_Error vImageOverwriteChannelsWithScalar_ARGB8888(Pixel_8 scalar, const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t copyMask, vImage_Flags flags)
{
  return MEMORY[0x24BDB3C18](scalar, src, dest, copyMask, *(_QWORD *)&flags);
}

vImage_Error vImageOverwriteChannels_ARGB8888(const vImage_Buffer *newSrc, const vImage_Buffer *origSrc, const vImage_Buffer *dest, uint8_t copyMask, vImage_Flags flags)
{
  return MEMORY[0x24BDB3C20](newSrc, origSrc, dest, copyMask, *(_QWORD *)&flags);
}

vImage_Error vImagePermuteChannels_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x24BDB3C28](src, dest, permuteMap, *(_QWORD *)&flags);
}

vImage_Error vImageRotate90_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, const Pixel_8888 backColor, vImage_Flags flags)
{
  return MEMORY[0x24BDB3C30](src, dest, rotationConstant, backColor, *(_QWORD *)&flags);
}

vImage_Error vImageScale_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x24BDB3C38](src, dest, tempBuffer, *(_QWORD *)&flags);
}

vImage_Error vImageVerticalReflect_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x24BDB3C60](src, dest, *(_QWORD *)&flags);
}

