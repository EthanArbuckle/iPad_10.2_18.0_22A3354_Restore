void sub_2269ABAFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2269ABC38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

void sub_2269ABE90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_2269AE648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2269AE7B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
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

void sub_2269B0480(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2269B053C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2269B0A88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  id *v18;
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

double getLargestFaceRect(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  float v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  CMTime v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v1 = a1;
  objc_msgSend(v1, "metadataObjectForKey:", *MEMORY[0x24BE795E0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(v1, "metadataDict");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PVFrameSetMetadataARMetadataKey"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "faceAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "normalizedFaceRect");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    if (v1)
      objc_msgSend(v1, "presentationTimeStamp");
    else
      memset(&v35, 0, sizeof(v35));
    v37.origin.x = v7;
    v37.origin.y = v9;
    v37.size.width = v11;
    v37.size.height = v13;
    MakePVFaceDetectionFull(0, 0, 0.0, 0, 0.0, v37, AVCaptureVideoOrientationPortrait, &v35, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v14);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v15 = objc_msgSend(v2, "count");
  if (v15)
  {
    v16 = 0;
    v17 = 0;
    v18 = 0.0;
    do
    {
      objc_msgSend(v2, "objectAtIndexedSubscript:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "boundingBox");
      v21 = v20;
      objc_msgSend(v2, "objectAtIndexedSubscript:", v17);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "boundingBox");
      v24 = v21 * v23;

      if (v18 < v24)
      {
        v16 = v17;
        v18 = v24;
      }
      ++v17;
    }
    while (v15 != v17);
    objc_msgSend(v2, "objectAtIndexedSubscript:", v16);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "boundingBox");
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;

    if (v33 != -1.0)
    {
      v38.size.width = 0.99;
      v38.origin.x = 0.0;
      v38.origin.y = 0.0;
      v36.origin.x = v27;
      v36.origin.y = v29;
      v36.size.width = v31;
      v36.size.height = v33;
      v38.size.height = 0.99;
      *(_QWORD *)&v27 = (unint64_t)CGRectIntersection(v36, v38);
    }
  }
  else
  {
    v27 = 0.0;
  }

  return v27;
}

void sub_2269B0E34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

BOOL isFaceBoundingBoxValid(double a1, double a2, double a3, double a4)
{
  return a4 > 0.0;
}

void drawFaceRectOnAlphaMap(__CVBuffer *a1, double a2, double a3, double a4, double a5)
{
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  _BYTE *BaseAddress;
  float v14;
  _BYTE *v15;
  NSObject *v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  unsigned int v26;
  signed int v27;
  float v28;
  unsigned int v29;
  signed int v30;
  unsigned int v31;
  unsigned int v32;
  float v33;
  unsigned int v34;
  unsigned int v35;
  int v36;
  unsigned int v37;
  size_t v38;
  size_t v39;
  signed int v40;
  size_t v41;
  size_t v43;
  size_t v44;
  signed int v45;
  size_t v46;
  NSObject *v48;
  unsigned int v49;
  unsigned int v50;
  unsigned int v51;
  int v52;
  unsigned int v53;
  int v54;
  unsigned int v55;
  signed int v56;
  unsigned int v57;
  unsigned int v58;
  size_t v59;
  size_t v60;
  signed int v61;
  size_t v62;
  unsigned int v64;
  size_t v65;
  size_t v66;
  signed int v67;
  size_t v68;
  unsigned int v70;
  unsigned int v71;
  unsigned int v72;
  int v73;
  signed int v74;
  unsigned int v75;
  size_t v76;
  size_t v77;
  signed int v78;
  size_t v79;
  int v81;
  double v82;
  __int16 v83;
  double v84;
  __int16 v85;
  unsigned int v86;
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  if (CVPixelBufferGetPixelFormatType(a1) == 1278226488)
  {
    Width = CVPixelBufferGetWidth(a1);
    Height = CVPixelBufferGetHeight(a1);
    BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
    CVPixelBufferLockBaseAddress(a1, 0);
    BaseAddress = CVPixelBufferGetBaseAddress(a1);
    v14 = a4 * a5;
    if (v14 > 0.0)
    {
      v15 = BaseAddress;
      JFXLog_matting();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v81 = 134218496;
        v82 = a3;
        v83 = 2048;
        v84 = a2;
        v85 = 1024;
        v86 = llroundf(v14);
        _os_log_impl(&dword_2269A9000, v16, OS_LOG_TYPE_DEFAULT, "Face: (%.1f,%.1f) area=%d", (uint8_t *)&v81, 0x1Cu);
      }

      v17 = a4 * 0.5;
      v18 = a5 * 0.5;
      v19 = a2 + v17;
      v20 = a3 + v18;
      v21 = (float)Width;
      v22 = (float)Height;
      v23 = v19 - v17;
      v24 = v17 + v19;
      v25 = v20 - v18;
      if (v23 >= v24)
      {
        v28 = v18 + v20;
      }
      else
      {
        v26 = llroundf(v25 * v21);
        v27 = v26 + 5;
        v28 = v18 + v20;
        v29 = llroundf(v28 * v21);
        v30 = v29 + 5;
        v31 = v26 - 6;
        v32 = v29 - 6;
        v33 = v23;
        do
        {
          v34 = llroundf(v33 * v22);
          v35 = v34 - 5;
          v36 = v34 + 5;
          v37 = v35;
          do
          {
            v38 = v37;
            v39 = BytesPerRow * v37;
            v40 = v31;
            do
            {
              v41 = (v40 + 1);
              if (v40 + 1 >= 0 && (v38 & 0x80000000) == 0 && Width > v41 && Height > v38)
                v15[v39 + v41] = -56;
              ++v40;
            }
            while (v40 < v27);
            v37 = v38 + 1;
          }
          while ((int)v38 < v36);
          do
          {
            v43 = v35;
            v44 = BytesPerRow * v35;
            v45 = v32;
            do
            {
              v46 = (v45 + 1);
              if (v45 + 1 >= 0 && (v43 & 0x80000000) == 0 && Width > v46 && Height > v43)
                v15[v44 + v46] = -56;
              ++v45;
            }
            while (v45 < v30);
            v35 = v43 + 1;
          }
          while ((int)v43 < v36);
          v33 = v33 + 0.04;
        }
        while (v24 > v33);
      }
      if (v25 < v28)
      {
        v49 = llroundf(v23 * v22);
        v50 = v49 - 5;
        v51 = llroundf(v24 * v22);
        v52 = v49 + 5;
        v53 = v51 - 5;
        v54 = v51 + 5;
        do
        {
          v55 = llroundf(v25 * v21);
          v56 = v55 + 5;
          v57 = v55 - 6;
          v58 = v50;
          do
          {
            v59 = v58;
            v60 = BytesPerRow * v58;
            v61 = v57;
            do
            {
              v62 = (v61 + 1);
              if (v61 + 1 >= 0 && (v59 & 0x80000000) == 0 && Width > v62 && Height > v59)
                v15[v60 + v62] = -56;
              ++v61;
            }
            while (v61 < v56);
            v58 = v59 + 1;
          }
          while ((int)v59 < v52);
          v64 = v53;
          do
          {
            v65 = v64;
            v66 = BytesPerRow * v64;
            v67 = v57;
            do
            {
              v68 = (v67 + 1);
              if (v67 + 1 >= 0 && (v65 & 0x80000000) == 0 && Width > v68 && Height > v65)
                v15[v66 + v68] = -56;
              ++v67;
            }
            while (v67 < v56);
            v64 = v65 + 1;
          }
          while ((int)v65 < v54);
          v25 = v25 + 0.08;
        }
        while (v28 > v25);
      }
      v70 = llroundf(v19 * v22);
      v71 = v70 - 5;
      v72 = llroundf(v20 * v21);
      v73 = v70 + 5;
      v74 = v72 + 5;
      v75 = v72 - 6;
      do
      {
        v76 = v71;
        v77 = BytesPerRow * v71;
        v78 = v75;
        do
        {
          v79 = (v78 + 1);
          if (v78 + 1 >= 0 && (v76 & 0x80000000) == 0 && Width > v79 && Height > v76)
            v15[v77 + v79] = -56;
          ++v78;
        }
        while (v78 < v74);
        v71 = v76 + 1;
      }
      while ((int)v76 < v73);
    }
    CVPixelBufferUnlockBaseAddress(a1, 0);
  }
  else
  {
    JFXLog_matting();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v81) = 0;
      _os_log_impl(&dword_2269A9000, v48, OS_LOG_TYPE_DEFAULT, "Error: wrong pixel format for matte", (uint8_t *)&v81, 2u);
    }

  }
}

double transformedPoint(unint64_t a1, double a2, float a3, uint64_t a4, uint64_t a5)
{
  if (a5 == 2)
    a3 = 1.0 - a3;
  return (float)(a3 * (float)a1);
}

id JFX_CaptureSessionInterruptionReasonsList()
{
  if (JFX_CaptureSessionInterruptionReasonsList_onceToken != -1)
    dispatch_once(&JFX_CaptureSessionInterruptionReasonsList_onceToken, &__block_literal_global_0);
  return (id)JFX_CaptureSessionInterruptionReasonsList_interruptionReasonsArray;
}

uint64_t CFXCaptureCapabilitiesIsCTMSupported()
{
  void *v0;
  uint64_t v1;
  void *v2;

  CFXAspectRatioCropOverride();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    v1 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE14A28], "capabilities");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = objc_msgSend(v2, "isCTMSupported");

  }
  return v1;
}

uint64_t CFXCaptureCapabilitiesIsHDRSupported()
{
  uint64_t result;
  void *v1;
  uint64_t v2;

  result = _os_feature_enabled_impl();
  if ((_DWORD)result)
  {
    objc_msgSend(MEMORY[0x24BE14A28], "capabilities");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "isHDR10BitVideoSupported");

    return v2;
  }
  return result;
}

void sub_2269B362C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
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

void sub_2269B3AF0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_2269B4BB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2269B4CA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2269B4D5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2269B4DEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

double CGPointRound(double a1)
{
  return round(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_2269BEA88(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 112));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void EdgeLine::EdgeLine(EdgeLine *this)
{
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
}

{
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
}

void ContourMemoryPool::ContourMemoryPool(ContourMemoryPool *this)
{
  this->var0 = (char *)operator new[]();
  this->var1 = (char *)operator new[]();
  this->var2 = (int *)operator new[]();
  this->var3 = (int *)operator new[]();
}

void ContourMemoryPool::~ContourMemoryPool(ContourMemoryPool *this)
{
  char *var0;
  char *var1;
  int *var2;
  int *var3;

  var0 = this->var0;
  if (var0)
    MEMORY[0x2276A1A80](var0, 0x1000C8077774924);
  var1 = this->var1;
  if (var1)
    MEMORY[0x2276A1A80](var1, 0x1000C8077774924);
  var2 = this->var2;
  if (var2)
    MEMORY[0x2276A1A80](var2, 0x1000C8052888210);
  var3 = this->var3;
  if (var3)
    MEMORY[0x2276A1A80](var3, 0x1000C8052888210);
}

void ContourProcessing::ContourProcessing(ContourProcessing *this, unsigned __int8 *a2, int a3, int a4, ContourMemoryPool *a5, char a6)
{
  *((_QWORD *)this + 13) = 0;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_QWORD *)this = a2;
  *((_DWORD *)this + 2) = a3;
  *((_DWORD *)this + 3) = a4;
  *((_QWORD *)this + 3) = 0;
  *((_DWORD *)this + 4) = 0;
  *((_QWORD *)this + 15) = a5;
  *((_BYTE *)this + 116) = a6;
}

{
  *((_QWORD *)this + 13) = 0;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_QWORD *)this = a2;
  *((_DWORD *)this + 2) = a3;
  *((_DWORD *)this + 3) = a4;
  *((_QWORD *)this + 3) = 0;
  *((_DWORD *)this + 4) = 0;
  *((_QWORD *)this + 15) = a5;
  *((_BYTE *)this + 116) = a6;
}

void ContourProcessing::~ContourProcessing(ContourProcessing *this)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)*((_QWORD *)this + 11);
  if (v2)
  {
    *((_QWORD *)this + 12) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((_QWORD *)this + 8);
  if (v3)
  {
    *((_QWORD *)this + 9) = v3;
    operator delete(v3);
  }
  v4 = (void *)*((_QWORD *)this + 5);
  if (v4)
  {
    *((_QWORD *)this + 6) = v4;
    operator delete(v4);
  }
}

uint64_t ContourProcessing::contourExtraction(ContourProcessing *this, int *a2)
{
  int v4;

  ContourProcessing::tracingContours(this);
  v4 = *((_DWORD *)this + 4);
  if (v4 >= 21)
  {
    ContourProcessing::contourSmoothClose(this);
    v4 = *((_DWORD *)this + 4);
  }
  *a2 = v4;
  return *((_QWORD *)this + 3);
}

void ContourProcessing::tracingContours(ContourProcessing *this)
{
  _QWORD *v2;
  char *v3;
  int v4;
  int v5;
  int v6;
  unsigned __int8 *v7;
  int v8;
  int v9;
  _BOOL4 v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  unint64_t v20;
  char *v21;
  int v22;
  _DWORD *v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  char *v30;
  int v31;
  char *v32;
  int *v33;
  char *v34;
  char *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char *v40;
  int *v41;
  int v42;
  char *v43;
  char *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char *v49;
  char *v50;
  int v51;
  char *v52;
  char *v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  char *v58;
  char *v59;
  int *v60;
  int v61;
  _DWORD *v62;
  char *v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  char *v68;
  char *v69;
  int v70;
  int v71;
  int v72;
  int v73;
  unsigned int i;
  uint64_t v75;
  uint64_t v76;
  BOOL v77;
  int v78;
  int v79;
  int v80;
  BOOL v81;
  uint64_t v82;
  uint64_t v83;
  int v84;
  int v85;
  unint64_t v86;
  char *v87;
  int v88;
  _DWORD *v89;
  char *v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  unint64_t v94;
  char *v95;
  char *v96;
  char *v97;
  int v98;
  char *v99;
  char **v100;
  char *v101;
  int *v102;
  char *v103;
  char *v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  unint64_t v108;
  char *v109;
  int *v110;
  int v111;
  int *v112;
  char *v113;
  uint64_t v114;
  unint64_t v115;
  uint64_t v116;
  unint64_t v117;
  char *v118;
  char *v119;
  int v120;
  char *v121;
  char *v122;
  uint64_t v123;
  unint64_t v124;
  uint64_t v125;
  unint64_t v126;
  char *v127;
  char *v128;
  int *v129;
  int v130;
  _DWORD *v131;
  char *v132;
  uint64_t v133;
  unint64_t v134;
  uint64_t v135;
  unint64_t v136;
  char *v137;
  char *v138;
  char *v139;
  int v140;
  _DWORD *v141;
  uint64_t v142;
  unint64_t v143;
  int v144;
  int v145;
  _DWORD *v146;
  uint64_t v147;
  uint64_t j;
  int v149;
  int v150;
  void **v151;
  unint64_t v152;
  int *v153;
  int v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  int v158;
  int v159;
  unint64_t v160;
  char *v161;
  _DWORD *v162;
  char *v163;
  uint64_t v164;
  unint64_t v165;
  uint64_t v166;
  unint64_t v167;
  char *v168;
  char *v169;
  int v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  int v174;
  _DWORD *v175;
  void **v176;
  int v177;
  int v178;
  void **v179;
  char **v180;
  uint64_t v181;
  int v182;
  int v183;
  int v184;
  int v185;
  int v186;
  uint64_t v187;
  int v188;
  int v189;
  int v190;
  int v191;
  int v192;
  int v193;
  int v194;
  uint64_t v195;

  v195 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD **)this;
  v3 = (char *)**((_QWORD **)this + 15);
  bzero(v3, *((int *)this + 3) + 2);
  bzero(&v3[*((int *)this + 3) + 2 + (*((int *)this + 3) + 2) * *((int *)this + 2)], *((_DWORD *)this + 3) + 2);
  v4 = *((_DWORD *)this + 2);
  if (v4 >= 1)
  {
    v5 = 0;
    do
    {
      v6 = v5 + 1;
      v3[(*((int *)this + 3) + 2) * v6] = 0;
      memcpy(&v3[(*((_DWORD *)this + 3) + 2) * (v5 + 1) + 1], (char *)v2 + *((_DWORD *)this + 3) * v5, *((int *)this + 3));
      v3[*((_DWORD *)this + 3) + 1 + (*((_DWORD *)this + 3) + 2) * v6] = 0;
      v4 = *((_DWORD *)this + 2);
      v5 = v6;
    }
    while (v6 < v4);
  }
  v7 = *(unsigned __int8 **)(*((_QWORD *)this + 15) + 8);
  bzero(v7, (*((int *)this + 3) + 2) * (v4 + 2));
  *((_DWORD *)this + 4) = 0;
  *((_QWORD *)this + 3) = *(_QWORD *)(*((_QWORD *)this + 15) + 16);
  v181 = 0x7FFFFFFFFLL;
  v9 = *((_DWORD *)this + 2);
  v8 = *((_DWORD *)this + 3);
  v182 = -3 - v8;
  v183 = 7;
  v186 = ~v8;
  v188 = 3;
  v189 = v8 + 3;
  v190 = 3;
  v191 = v8 + 2;
  v192 = 5;
  v193 = v8 + 1;
  v194 = 5;
  v184 = -2 - v8;
  v185 = 1;
  v187 = 0x100000001;
  if (v9 < -1)
  {
    v13 = 0;
    v15 = v8;
    v14 = v9;
    v12 = 0;
    goto LABEL_129;
  }
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v176 = (void **)((char *)this + 64);
  v179 = (void **)((char *)this + 88);
  v180 = (char **)((char *)this + 104);
  v14 = v9;
  v15 = v8;
  do
  {
    if (v8 < -1)
      goto LABEL_126;
    v16 = 0;
    v17 = v8 + 2;
    do
    {
      v18 = v16 + v17 * v11;
      if (v7[v18] == 255 && !v10)
      {
        v10 = 1;
        goto LABEL_124;
      }
      v19 = v3[v18];
      if (v19 != 255 || !v10)
      {
        if (v19 == 0 && v10)
        {
          v10 = 0;
          goto LABEL_124;
        }
        if (v19 == 255 && !v10)
        {
          v177 = v12;
          v178 = v13;
          v7[v18] = -1;
          v21 = (char *)*((_QWORD *)this + 9);
          v20 = *((_QWORD *)this + 10);
          v22 = v14;
          if ((unint64_t)v21 >= v20)
          {
            v24 = (char *)*v176;
            v25 = (v21 - (_BYTE *)*v176) >> 2;
            v26 = v25 + 1;
            if ((unint64_t)(v25 + 1) >> 62)
              std::vector<int>::__throw_length_error[abi:ne180100]();
            v27 = v20 - (_QWORD)v24;
            if (v27 >> 1 > v26)
              v26 = v27 >> 1;
            if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFFCLL)
              v28 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v28 = v26;
            if (v28)
            {
              v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)this + 80, v28);
              v24 = (char *)*((_QWORD *)this + 8);
              v21 = (char *)*((_QWORD *)this + 9);
            }
            else
            {
              v29 = 0;
            }
            v30 = &v29[4 * v25];
            *(_DWORD *)v30 = *((_DWORD *)this + 4);
            v23 = v30 + 4;
            while (v21 != v24)
            {
              v31 = *((_DWORD *)v21 - 1);
              v21 -= 4;
              *((_DWORD *)v30 - 1) = v31;
              v30 -= 4;
            }
            *((_QWORD *)this + 8) = v30;
            *((_QWORD *)this + 9) = v23;
            *((_QWORD *)this + 10) = &v29[4 * v28];
            if (v24)
              operator delete(v24);
            v14 = v22;
          }
          else
          {
            *(_DWORD *)v21 = *((_DWORD *)this + 4);
            v23 = v21 + 4;
          }
          *((_QWORD *)this + 9) = v23;
          v33 = (int *)*((_QWORD *)this + 12);
          v32 = (char *)*((_QWORD *)this + 13);
          if (v33 >= (int *)v32)
          {
            v35 = (char *)*v179;
            v36 = ((char *)v33 - (_BYTE *)*v179) >> 2;
            v37 = v36 + 1;
            if ((unint64_t)(v36 + 1) >> 62)
              goto LABEL_255;
            v38 = v32 - v35;
            if (v38 >> 1 > v37)
              v37 = v38 >> 1;
            if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFFCLL)
              v39 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v39 = v37;
            if (v39)
            {
              v40 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)v180, v39);
              v35 = (char *)*((_QWORD *)this + 11);
              v33 = (int *)*((_QWORD *)this + 12);
            }
            else
            {
              v40 = 0;
            }
            v41 = (int *)&v40[4 * v36];
            *v41 = v15;
            v34 = (char *)(v41 + 1);
            while (v33 != (int *)v35)
            {
              v42 = *--v33;
              *--v41 = v42;
            }
            v32 = &v40[4 * v39];
            *((_QWORD *)this + 11) = v41;
            *((_QWORD *)this + 12) = v34;
            *((_QWORD *)this + 13) = v32;
            if (v35)
            {
              operator delete(v35);
              v32 = *v180;
            }
            v14 = v22;
          }
          else
          {
            *v33 = v15;
            v34 = (char *)(v33 + 1);
          }
          *((_QWORD *)this + 12) = v34;
          if (v34 >= v32)
          {
            v44 = (char *)*v179;
            v45 = (v34 - (_BYTE *)*v179) >> 2;
            v46 = v45 + 1;
            if ((unint64_t)(v45 + 1) >> 62)
              goto LABEL_255;
            v47 = v32 - v44;
            if (v47 >> 1 > v46)
              v46 = v47 >> 1;
            if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFFCLL)
              v48 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v48 = v46;
            if (v48)
            {
              v49 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)v180, v48);
              v44 = (char *)*((_QWORD *)this + 11);
              v34 = (char *)*((_QWORD *)this + 12);
            }
            else
            {
              v49 = 0;
            }
            v50 = &v49[4 * v45];
            *(_DWORD *)v50 = v178;
            v43 = v50 + 4;
            while (v34 != v44)
            {
              v51 = *((_DWORD *)v34 - 1);
              v34 -= 4;
              *((_DWORD *)v50 - 1) = v51;
              v50 -= 4;
            }
            v32 = &v49[4 * v48];
            *((_QWORD *)this + 11) = v50;
            *((_QWORD *)this + 12) = v43;
            *((_QWORD *)this + 13) = v32;
            if (v44)
            {
              operator delete(v44);
              v32 = *v180;
            }
            v14 = v22;
          }
          else
          {
            *(_DWORD *)v34 = v178;
            v43 = v34 + 4;
          }
          *((_QWORD *)this + 12) = v43;
          if (v43 >= v32)
          {
            v53 = (char *)*v179;
            v54 = (v43 - (_BYTE *)*v179) >> 2;
            v55 = v54 + 1;
            if ((unint64_t)(v54 + 1) >> 62)
              goto LABEL_255;
            v56 = v32 - v53;
            if (v56 >> 1 > v55)
              v55 = v56 >> 1;
            if ((unint64_t)v56 >= 0x7FFFFFFFFFFFFFFCLL)
              v57 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v57 = v55;
            if (v57)
            {
              v58 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)v180, v57);
              v14 = v22;
              v59 = v58;
              v53 = (char *)*((_QWORD *)this + 11);
              v43 = (char *)*((_QWORD *)this + 12);
            }
            else
            {
              v59 = 0;
            }
            v60 = (int *)&v59[4 * v54];
            *v60 = v14;
            v52 = (char *)(v60 + 1);
            while (v43 != v53)
            {
              v61 = *((_DWORD *)v43 - 1);
              v43 -= 4;
              *--v60 = v61;
            }
            v32 = &v59[4 * v57];
            *((_QWORD *)this + 11) = v60;
            *((_QWORD *)this + 12) = v52;
            *((_QWORD *)this + 13) = v32;
            if (v53)
            {
              operator delete(v53);
              v32 = *v180;
            }
          }
          else
          {
            *(_DWORD *)v43 = v14;
            v52 = v43 + 4;
          }
          *((_QWORD *)this + 12) = v52;
          if (v52 < v32)
          {
            *(_DWORD *)v52 = v177;
            v62 = v52 + 4;
LABEL_99:
            v13 = 0;
            v12 = 0;
            v71 = 0;
            *((_QWORD *)this + 12) = v62;
            v72 = 1;
            v73 = v18;
            v14 = *((_DWORD *)this + 2);
            v15 = *((_DWORD *)this + 3);
            while (1)
            {
              for (i = 0; ; ++i)
              {
                v75 = v72 - 1;
                v76 = *((int *)&v181 + 2 * v75) + (uint64_t)v73;
                v10 = v3[v76] == 255;
                if (v3[v76] == 255)
                  break;
                if (i > 8)
                  goto LABEL_123;
                v77 = -v72 < 0;
                v78 = -v72 & 7;
                v79 = v72 & 7;
                if (v77)
                  v80 = v79;
                else
                  v80 = -v78;
                v72 = v80 + 1;
              }
              v72 = *((_DWORD *)&v181 + 2 * v75 + 1);
              if ((_DWORD)v76 == v18)
              {
                v81 = v72 != 1 && v71 <= 1;
                if (!v81)
                {
LABEL_123:
                  v8 = *((_DWORD *)this + 3);
                  goto LABEL_124;
                }
                ++v71;
              }
              v7[v76] = -1;
              v82 = *((_QWORD *)this + 3);
              *(_DWORD *)(v82 + 8 * *((int *)this + 4) + 4) = (int)v76 / (*((_DWORD *)this + 3) + 2) - 1;
              *(_DWORD *)(v82 + 8 * *((_DWORD *)this + 4)) = v76
                                                             + (*((_DWORD *)this + 3) + 2)
                                                             * ~*(_DWORD *)(v82 + 8 * *((int *)this + 4) + 4)
                                                             - 1;
              v83 = *((int *)this + 4);
              v84 = *(_DWORD *)(v82 + 8 * v83);
              if (v84 < v15)
                v15 = *(_DWORD *)(v82 + 8 * v83);
              if (v13 <= v84)
                v13 = *(_DWORD *)(v82 + 8 * v83);
              v85 = *(_DWORD *)(v82 + 4 * (int)((2 * v83) | 1));
              if (v85 < v14)
                v14 = *(_DWORD *)(v82 + 4 * (int)((2 * v83) | 1));
              if (v12 <= v85)
                v12 = *(_DWORD *)(v82 + 4 * (int)((2 * v83) | 1));
              *((_DWORD *)this + 4) = v83 + 1;
              v73 = v76;
            }
          }
          v63 = (char *)*v179;
          v64 = (v52 - (_BYTE *)*v179) >> 2;
          v65 = v64 + 1;
          if (!((unint64_t)(v64 + 1) >> 62))
          {
            v66 = v32 - v63;
            if (v66 >> 1 > v65)
              v65 = v66 >> 1;
            if ((unint64_t)v66 >= 0x7FFFFFFFFFFFFFFCLL)
              v67 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v67 = v65;
            if (v67)
            {
              v68 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)v180, v67);
              v63 = (char *)*((_QWORD *)this + 11);
              v52 = (char *)*((_QWORD *)this + 12);
            }
            else
            {
              v68 = 0;
            }
            v69 = &v68[4 * v64];
            *(_DWORD *)v69 = v177;
            v62 = v69 + 4;
            while (v52 != v63)
            {
              v70 = *((_DWORD *)v52 - 1);
              v52 -= 4;
              *((_DWORD *)v69 - 1) = v70;
              v69 -= 4;
            }
            *((_QWORD *)this + 11) = v69;
            *((_QWORD *)this + 12) = v62;
            *((_QWORD *)this + 13) = &v68[4 * v67];
            if (v63)
              operator delete(v63);
            goto LABEL_99;
          }
LABEL_255:
          std::vector<int>::__throw_length_error[abi:ne180100]();
        }
      }
LABEL_124:
      ++v16;
      v17 = v8 + 2;
    }
    while (v16 < v8 + 2);
    v9 = *((_DWORD *)this + 2);
LABEL_126:
    v81 = v11++ <= v9;
  }
  while (v81);
LABEL_129:
  v86 = *((_QWORD *)this + 10);
  v87 = (char *)*((_QWORD *)this + 9);
  v88 = v14;
  if ((unint64_t)v87 >= v86)
  {
    v90 = (char *)*((_QWORD *)this + 8);
    v91 = (v87 - v90) >> 2;
    if ((unint64_t)(v91 + 1) >> 62)
      std::vector<int>::__throw_length_error[abi:ne180100]();
    v92 = v86 - (_QWORD)v90;
    v93 = (uint64_t)(v86 - (_QWORD)v90) >> 1;
    if (v93 <= v91 + 1)
      v93 = v91 + 1;
    if (v92 >= 0x7FFFFFFFFFFFFFFCLL)
      v94 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v94 = v93;
    if (v94)
    {
      v95 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)this + 80, v94);
      v90 = (char *)*((_QWORD *)this + 8);
      v87 = (char *)*((_QWORD *)this + 9);
    }
    else
    {
      v95 = 0;
    }
    v96 = &v95[4 * v91];
    v97 = &v95[4 * v94];
    *(_DWORD *)v96 = *((_DWORD *)this + 4);
    v89 = v96 + 4;
    while (v87 != v90)
    {
      v98 = *((_DWORD *)v87 - 1);
      v87 -= 4;
      *((_DWORD *)v96 - 1) = v98;
      v96 -= 4;
    }
    *((_QWORD *)this + 8) = v96;
    *((_QWORD *)this + 9) = v89;
    *((_QWORD *)this + 10) = v97;
    if (v90)
      operator delete(v90);
    v14 = v88;
  }
  else
  {
    *(_DWORD *)v87 = *((_DWORD *)this + 4);
    v89 = v87 + 4;
  }
  v100 = (char **)((char *)this + 104);
  v99 = (char *)*((_QWORD *)this + 13);
  *((_QWORD *)this + 9) = v89;
  v101 = (char *)this + 88;
  v102 = (int *)*((_QWORD *)this + 12);
  if (v102 < (int *)v99)
  {
    *v102 = v15;
    v103 = (char *)(v102 + 1);
    goto LABEL_163;
  }
  v104 = *(char **)v101;
  v105 = ((uint64_t)v102 - *(_QWORD *)v101) >> 2;
  v106 = v105 + 1;
  if ((unint64_t)(v105 + 1) >> 62)
    goto LABEL_257;
  v107 = v99 - v104;
  if (v107 >> 1 > v106)
    v106 = v107 >> 1;
  if ((unint64_t)v107 >= 0x7FFFFFFFFFFFFFFCLL)
    v108 = 0x3FFFFFFFFFFFFFFFLL;
  else
    v108 = v106;
  if (v108)
  {
    v109 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)this + 104, v108);
    v104 = (char *)*((_QWORD *)this + 11);
    v102 = (int *)*((_QWORD *)this + 12);
  }
  else
  {
    v109 = 0;
  }
  v110 = (int *)&v109[4 * v105];
  v99 = &v109[4 * v108];
  *v110 = v15;
  v103 = (char *)(v110 + 1);
  while (v102 != (int *)v104)
  {
    v111 = *--v102;
    *--v110 = v111;
  }
  *((_QWORD *)this + 11) = v110;
  *((_QWORD *)this + 12) = v103;
  *((_QWORD *)this + 13) = v99;
  if (v104)
  {
    operator delete(v104);
    v99 = *v100;
  }
  v14 = v88;
LABEL_163:
  *((_QWORD *)this + 12) = v103;
  if (v103 < v99)
  {
    *(_DWORD *)v103 = v13;
    v112 = (int *)(v103 + 4);
    goto LABEL_180;
  }
  v113 = *(char **)v101;
  v114 = (uint64_t)&v103[-*(_QWORD *)v101] >> 2;
  v115 = v114 + 1;
  if ((unint64_t)(v114 + 1) >> 62)
    goto LABEL_257;
  v116 = v99 - v113;
  if (v116 >> 1 > v115)
    v115 = v116 >> 1;
  if ((unint64_t)v116 >= 0x7FFFFFFFFFFFFFFCLL)
    v117 = 0x3FFFFFFFFFFFFFFFLL;
  else
    v117 = v115;
  if (v117)
  {
    v118 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)this + 104, v117);
    v113 = (char *)*((_QWORD *)this + 11);
    v103 = (char *)*((_QWORD *)this + 12);
  }
  else
  {
    v118 = 0;
  }
  v119 = &v118[4 * v114];
  v99 = &v118[4 * v117];
  *(_DWORD *)v119 = v13;
  v112 = (int *)(v119 + 4);
  while (v103 != v113)
  {
    v120 = *((_DWORD *)v103 - 1);
    v103 -= 4;
    *((_DWORD *)v119 - 1) = v120;
    v119 -= 4;
  }
  *((_QWORD *)this + 11) = v119;
  *((_QWORD *)this + 12) = v112;
  *((_QWORD *)this + 13) = v99;
  if (v113)
  {
    operator delete(v113);
    v99 = *v100;
  }
  v14 = v88;
LABEL_180:
  *((_QWORD *)this + 12) = v112;
  if (v112 < (int *)v99)
  {
    *v112 = v14;
    v121 = (char *)(v112 + 1);
    goto LABEL_196;
  }
  v122 = *(char **)v101;
  v123 = ((uint64_t)v112 - *(_QWORD *)v101) >> 2;
  v124 = v123 + 1;
  if ((unint64_t)(v123 + 1) >> 62)
    goto LABEL_257;
  v125 = v99 - v122;
  if (v125 >> 1 > v124)
    v124 = v125 >> 1;
  if ((unint64_t)v125 >= 0x7FFFFFFFFFFFFFFCLL)
    v126 = 0x3FFFFFFFFFFFFFFFLL;
  else
    v126 = v124;
  if (v126)
  {
    v127 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)this + 104, v126);
    v14 = v88;
    v128 = v127;
    v122 = (char *)*((_QWORD *)this + 11);
    v112 = (int *)*((_QWORD *)this + 12);
  }
  else
  {
    v128 = 0;
  }
  v129 = (int *)&v128[4 * v123];
  v99 = &v128[4 * v126];
  *v129 = v14;
  v121 = (char *)(v129 + 1);
  while (v112 != (int *)v122)
  {
    v130 = *--v112;
    *--v129 = v130;
  }
  *((_QWORD *)this + 11) = v129;
  *((_QWORD *)this + 12) = v121;
  *((_QWORD *)this + 13) = v99;
  if (v122)
  {
    operator delete(v122);
    v99 = *v100;
  }
LABEL_196:
  *((_QWORD *)this + 12) = v121;
  if (v121 < v99)
  {
    *(_DWORD *)v121 = v12;
    v131 = v121 + 4;
    goto LABEL_212;
  }
  v132 = *(char **)v101;
  v133 = (uint64_t)&v121[-*(_QWORD *)v101] >> 2;
  v134 = v133 + 1;
  if ((unint64_t)(v133 + 1) >> 62)
LABEL_257:
    std::vector<int>::__throw_length_error[abi:ne180100]();
  v135 = v99 - v132;
  if (v135 >> 1 > v134)
    v134 = v135 >> 1;
  if ((unint64_t)v135 >= 0x7FFFFFFFFFFFFFFCLL)
    v136 = 0x3FFFFFFFFFFFFFFFLL;
  else
    v136 = v134;
  if (v136)
  {
    v137 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)this + 104, v136);
    v132 = (char *)*((_QWORD *)this + 11);
    v121 = (char *)*((_QWORD *)this + 12);
  }
  else
  {
    v137 = 0;
  }
  v138 = &v137[4 * v133];
  v139 = &v137[4 * v136];
  *(_DWORD *)v138 = v12;
  v131 = v138 + 4;
  while (v121 != v132)
  {
    v140 = *((_DWORD *)v121 - 1);
    v121 -= 4;
    *((_DWORD *)v138 - 1) = v140;
    v138 -= 4;
  }
  *((_QWORD *)this + 11) = v138;
  *((_QWORD *)this + 12) = v131;
  *((_QWORD *)this + 13) = v139;
  if (v132)
    operator delete(v132);
LABEL_212:
  *((_QWORD *)this + 12) = v131;
  *((_QWORD *)this + 4) = *(_QWORD *)(*((_QWORD *)this + 15) + 24);
  if (*((int *)this + 4) <= 50)
  {
    *((_DWORD *)this + 4) = 0;
  }
  else
  {
    v141 = (_DWORD *)*((_QWORD *)this + 8);
    v142 = *((_QWORD *)this + 9);
    if ((unint64_t)(v142 - (_QWORD)v141) >= 9)
    {
      v143 = (v142 - (uint64_t)v141) >> 2;
      v144 = v141[1];
      if (v144 - *v141 < 51)
        v145 = 0;
      else
        v145 = (*(_DWORD *)(*(_QWORD *)v101 + 28) - *(_DWORD *)(*(_QWORD *)v101 + 24))
             * (*(_DWORD *)(*(_QWORD *)v101 + 20) - *(_DWORD *)(*(_QWORD *)v101 + 16));
      if (v143 <= 3)
        v143 = 3;
      v146 = (_DWORD *)(*(_QWORD *)v101 + 44);
      LODWORD(v147) = 1;
      for (j = 2; j != v143; ++j)
      {
        v149 = v141[j];
        if ((*v146 - *(v146 - 1)) * (*(v146 - 2) - *(v146 - 3)) > v145 && v149 - v144 > 50)
        {
          v145 = (*v146 - *(v146 - 1)) * (*(v146 - 2) - *(v146 - 3));
          v147 = j;
        }
        else
        {
          v147 = v147;
        }
        v146 += 4;
        v144 = v149;
      }
      v150 = 0;
      v151 = (void **)((char *)this + 40);
      v152 = 1;
      do
      {
        if (v152 != v147)
        {
          v153 = &v141[v152];
          v154 = *v153;
          v155 = *(v153 - 1);
          if (v154 - (int)v155 >= 51)
          {
            if (v154 > (int)v155)
            {
              v156 = *((_QWORD *)this + 3);
              v157 = *((_QWORD *)this + 4);
              v158 = 2 * v150;
              v159 = 2 * v155;
              do
              {
                *(_DWORD *)(v157 + 4 * v158) = *(_DWORD *)(v156 + 4 * v159);
                *(_DWORD *)(v157 + 4 * (v158 + 1)) = *(_DWORD *)(v156 + 4 * (v159 + 1));
                ++v155;
                v158 += 2;
                ++v150;
                v159 += 2;
              }
              while (v155 < (int)v141[v152]);
            }
            v161 = (char *)*((_QWORD *)this + 6);
            v160 = *((_QWORD *)this + 7);
            if ((unint64_t)v161 >= v160)
            {
              v163 = (char *)*v151;
              v164 = (v161 - (_BYTE *)*v151) >> 2;
              v165 = v164 + 1;
              if ((unint64_t)(v164 + 1) >> 62)
                goto LABEL_257;
              v166 = v160 - (_QWORD)v163;
              if (v166 >> 1 > v165)
                v165 = v166 >> 1;
              if ((unint64_t)v166 >= 0x7FFFFFFFFFFFFFFCLL)
                v167 = 0x3FFFFFFFFFFFFFFFLL;
              else
                v167 = v165;
              if (v167)
              {
                v168 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)this + 56, v167);
                v163 = (char *)*((_QWORD *)this + 5);
                v161 = (char *)*((_QWORD *)this + 6);
              }
              else
              {
                v168 = 0;
              }
              v169 = &v168[4 * v164];
              *(_DWORD *)v169 = v150;
              v162 = v169 + 4;
              while (v161 != v163)
              {
                v170 = *((_DWORD *)v161 - 1);
                v161 -= 4;
                *((_DWORD *)v169 - 1) = v170;
                v169 -= 4;
              }
              *((_QWORD *)this + 5) = v169;
              *((_QWORD *)this + 6) = v162;
              *((_QWORD *)this + 7) = &v168[4 * v167];
              if (v163)
                operator delete(v163);
            }
            else
            {
              *(_DWORD *)v161 = v150;
              v162 = v161 + 4;
            }
            *((_QWORD *)this + 6) = v162;
            v141 = (_DWORD *)*((_QWORD *)this + 8);
            v142 = *((_QWORD *)this + 9);
          }
        }
        ++v152;
      }
      while (v152 < (v142 - (uint64_t)v141) >> 2);
      v171 = (int)v147 - 1;
      *((_DWORD *)this + 4) = v141[(int)v147] - v141[v171];
      if ((_DWORD)v147 != 1)
      {
        v172 = (int)v141[v171];
        if ((int)v172 < v141[(int)v147])
        {
          v173 = *((_QWORD *)this + 3);
          v174 = 2 * v172;
          v175 = (_DWORD *)(v173 + 4);
          do
          {
            *(v175 - 1) = *(_DWORD *)(v173 + 4 * v174);
            *v175 = *(_DWORD *)(v173 + 4 * (v174 + 1));
            v175 += 2;
            ++v172;
            v174 += 2;
          }
          while (v172 < (int)v141[(int)v147]);
        }
      }
    }
  }
}

void ContourProcessing::contourSmoothClose(ContourProcessing *this)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  double v6;
  const float *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  double v11;
  float v12;
  float *v13;
  float v14;
  uint64_t v15;
  size_t v16;
  char *v17;
  char *v18;
  int64_t v19;
  float *v20;
  float *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int64_t v25;
  int *v26;
  int v27;
  const float *v28;
  float32x4_t *v29;
  float32x4_t *v30;
  int *v31;
  float *v32;
  int v33;
  int v34;
  float *v35;
  float *v36;
  int *v37;
  int v38;
  int v39;
  int v40;
  uint64_t v41;
  vDSP_Length __P;
  signed int v43;
  float32x4x2_t v44;

  v2 = *((unsigned int *)this + 4);
  if ((int)v2 > 41)
  {
    __P = 21;
    v6 = 2.0;
    v43 = 20;
    v41 = 10;
    v5 = 21;
  }
  else
  {
    if ((int)v2 >= 0)
      v3 = *((_DWORD *)this + 4);
    else
      v3 = v2 + 1;
    v4 = v3 >> 1;
    v5 = v4 | 1;
    __P = v4 | 1;
    v43 = v4 & 0xFFFFFFFE;
    v6 = (float)((float)(v4 | 1) / 10.0);
    v41 = (uint64_t)(int)(v4 & 0xFFFFFFFE) >> 1;
  }
  v7 = (const float *)operator new[]();
  if (v5 >= 1)
  {
    v8 = 0;
    v9 = -0.5 / (v6 * v6);
    v10 = v5;
    v11 = 0.0;
    do
    {
      v12 = exp(((double)(int)v8 + -(double)v43 * 0.5) * (v9 * ((double)(int)v8 + -(double)v43 * 0.5)));
      v7[v8] = v12;
      v11 = v11 + v12;
      ++v8;
    }
    while (v5 != v8);
    v13 = (float *)v7;
    do
    {
      v14 = 1.0 / v11 * *v13;
      *v13++ = v14;
      --v10;
    }
    while (v10);
  }
  v15 = (v5 + 3) & 0xFFFFFFFC;
  v16 = 4 * (v5 + (int)v2 + (int)v15);
  v17 = (char *)operator new[]();
  v18 = (char *)operator new[]();
  bzero(v17, v16);
  bzero(v18, v16);
  v19 = v5 + (int)v2;
  v20 = (float *)operator new[]();
  v21 = (float *)operator new[]();
  if ((v43 & 0x80000000) == 0)
  {
    v22 = *((_QWORD *)this + 3);
    v23 = 4 * v43;
    v24 = 2 * v2 - 1;
    do
    {
      *(float *)&v17[v23] = (float)*(int *)(v22 + 4 * (v24 - 1));
      *(float *)&v18[v23] = (float)*(int *)(v22 + 4 * v24);
      v23 -= 4;
      v24 -= 2;
    }
    while (v23 != -4);
  }
  if ((int)v2 >= 1)
  {
    v25 = v5;
    v26 = (int *)(*((_QWORD *)this + 3) + 4);
    do
    {
      *(float *)&v17[4 * v25] = (float)*(v26 - 1);
      v27 = *v26;
      v26 += 2;
      *(float *)&v18[4 * v25++] = (float)v27;
    }
    while (v25 < v19);
  }
  if ((int)v19 < v5 + (int)v2 + (int)v15)
  {
    v28 = (const float *)*((_QWORD *)this + 3);
    v29 = (float32x4_t *)&v17[4 * v19];
    if ((_DWORD)v15)
    {
      v30 = (float32x4_t *)&v18[4 * v19];
      do
      {
        v44 = vld2q_f32(v28);
        v28 += 8;
        *v29++ = vcvtq_f32_s32((int32x4_t)v44.val[0]);
        *v30++ = vcvtq_f32_s32((int32x4_t)v44.val[1]);
        v15 -= 4;
      }
      while (v15);
    }
    else
    {
      v31 = (int *)(v28 + 1);
      v32 = (float *)&v18[4 * v19];
      do
      {
        v29->f32[0] = (float)*(v31 - 1);
        v29 = (float32x4_t *)((char *)v29 + 4);
        v33 = *v31;
        v31 += 2;
        *v32++ = (float)v33;
        --v15;
      }
      while (v15);
    }
  }
  vDSP_conv((const float *)v17, 1, v7, 1, v20, 1, v19, __P);
  vDSP_conv((const float *)v18, 1, v7, 1, v21, 1, v19, __P);
  v34 = *((_DWORD *)this + 2);
  *((_DWORD *)this + 28) = v34;
  if ((int)v2 >= 1)
  {
    v35 = &v20[v41];
    v36 = &v21[v41];
    v37 = (int *)(*((_QWORD *)this + 3) + 4);
    do
    {
      v38 = *(v37 - 1);
      if (v38 && v38 != *((_DWORD *)this + 3) - 1 && *v37 && *v37 != *((_DWORD *)this + 2) - 1)
      {
        *(v37 - 1) = (int)(*v35 + 0.5);
        *v37 = (int)(*v36 + 0.5);
        v34 = *((_DWORD *)this + 28);
      }
      v40 = *v37;
      v37 += 2;
      v39 = v40;
      if (v34 >= v40)
        v34 = v39;
      *((_DWORD *)this + 28) = v34;
      ++v35;
      ++v36;
      --v2;
    }
    while (v2);
  }
  MEMORY[0x2276A1A80](v17, 0x1000C8052888210);
  MEMORY[0x2276A1A80](v18, 0x1000C8052888210);
  MEMORY[0x2276A1A80](v20, 0x1000C8052888210);
  MEMORY[0x2276A1A80](v21, 0x1000C8052888210);
  JUMPOUT(0x2276A1A80);
}

void ContourProcessing::contourExtractionProcessing(ContourProcessing *this, int *a2, int *a3)
{
  int v6;
  uint64_t v7;
  unint64_t v8;
  int v9;
  int v10;
  int *v11;
  void *__p;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;

  ContourProcessing::tracingContours(this);
  v6 = *((_DWORD *)this + 4);
  if (v6 >= 21)
  {
    ContourProcessing::contourSmoothClose(this);
    bzero(*(void **)this, *((int *)this + 3) * (uint64_t)*((int *)this + 2));
    v15 = 0;
    v16 = 0;
    v17 = 0;
    ContourProcessing::computeContourEdgeLine((uint64_t)this, *((_QWORD *)this + 3), *((_DWORD *)this + 4), &v15);
    ContourProcessing::fillContourEdgeLine((uint64_t)this, (uint64_t *)&v15, 255);
    if (!*((_BYTE *)this + 116))
    {
      v7 = *((_QWORD *)this + 5);
      if (*((_QWORD *)this + 6) != v7)
      {
        v8 = 0;
        v9 = 0;
        do
        {
          v10 = *(_DWORD *)(v7 + 4 * v8) - v9;
          v11 = (int *)(*((_QWORD *)this + 4) + 8 * v9);
          if (ContourProcessing::isHole(this, v11, v10))
          {
            __p = 0;
            v13 = 0;
            v14 = 0;
            ContourProcessing::computeContourEdgeLine((uint64_t)this, (uint64_t)v11, v10, &__p);
            ContourProcessing::fillContourEdgeLine((uint64_t)this, (uint64_t *)&__p, 0);
          }
          else
          {
            __p = 0;
            v13 = 0;
            v14 = 0;
            ContourProcessing::computeContourEdgeLine((uint64_t)this, (uint64_t)v11, v10, &__p);
            ContourProcessing::fillContourEdgeLine((uint64_t)this, (uint64_t *)&__p, 255);
          }
          if (__p)
          {
            v13 = __p;
            operator delete(__p);
          }
          v7 = *((_QWORD *)this + 5);
          v9 = *(_DWORD *)(v7 + 4 * v8++);
        }
        while (v8 < (*((_QWORD *)this + 6) - v7) >> 2);
      }
    }
    if (v15)
    {
      v16 = v15;
      operator delete(v15);
    }
    v6 = *((_DWORD *)this + 4);
  }
  *a2 = v6;
  *a3 = *((_DWORD *)this + 28);
}

void sub_2269C39C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void ContourProcessing::computeContourEdgeLine(uint64_t a1, uint64_t a2, int a3, void **a4)
{
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int *v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  char *v23;
  char *v24;
  int v25;
  char *v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char *v31;
  char *v32;
  char *v33;
  char *v34;
  char *v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v8 = *(_DWORD *)(a2 + 4 * (2 * a3 - 2));
  v9 = *(_DWORD *)(a2 + 4 * (2 * a3 - 1));
  std::vector<EdgeLine>::reserve(a4, 0xAAAAAAAAAAAAAAABLL * (((_BYTE *)a4[1] - (_BYTE *)*a4) >> 3) + a3);
  if (a3 >= 1)
  {
    v10 = a1;
    v11 = a2;
    v12 = 0;
    v13 = *(_QWORD *)a1 + (*(int *)(a1 + 8) - 1) * *(int *)(a1 + 12);
    v14 = v8 << 16;
    v37 = v13;
    v38 = a1;
    v39 = a2;
    do
    {
      v15 = (int *)(v11 + 8 * v12);
      v16 = v15[1];
      v17 = *v15;
      if (v16 == *(_DWORD *)(v10 + 8) - 1)
        *(_BYTE *)(v13 + v17) = -1;
      if (v16 != v9)
      {
        v18 = (_DWORD)v17 << 16;
        if (v16 <= v9)
          v19 = (_DWORD)v17 << 16;
        else
          v19 = v14;
        if (v9 <= v16)
          v20 = v16;
        else
          v20 = v9;
        if (v9 >= v16)
          v21 = v16;
        else
          v21 = v9;
        v22 = v18 - v14;
        v23 = (char *)a4[1];
        v24 = (char *)a4[2];
        v25 = v22 / (v16 - v9);
        if (v23 >= v24)
        {
          v27 = 0xAAAAAAAAAAAAAAABLL * ((v23 - (_BYTE *)*a4) >> 3);
          v28 = v27 + 1;
          if (v27 + 1 > 0xAAAAAAAAAAAAAAALL)
            std::vector<int>::__throw_length_error[abi:ne180100]();
          v29 = 0xAAAAAAAAAAAAAAABLL * ((v24 - (_BYTE *)*a4) >> 3);
          if (2 * v29 > v28)
            v28 = 2 * v29;
          if (v29 >= 0x555555555555555)
            v30 = 0xAAAAAAAAAAAAAAALL;
          else
            v30 = v28;
          if (v30)
            v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<EdgeLine>>((uint64_t)(a4 + 2), v30);
          else
            v31 = 0;
          v32 = &v31[24 * v27];
          *(_DWORD *)v32 = v21;
          *((_DWORD *)v32 + 1) = v20;
          *((_DWORD *)v32 + 2) = v19;
          *((_DWORD *)v32 + 3) = v25;
          *((_QWORD *)v32 + 2) = 0;
          v34 = (char *)*a4;
          v33 = (char *)a4[1];
          v35 = v32;
          if (v33 != *a4)
          {
            do
            {
              v36 = *(_OWORD *)(v33 - 24);
              *((_QWORD *)v35 - 1) = *((_QWORD *)v33 - 1);
              *(_OWORD *)(v35 - 24) = v36;
              v35 -= 24;
              v33 -= 24;
            }
            while (v33 != v34);
            v33 = (char *)*a4;
          }
          v26 = v32 + 24;
          *a4 = v35;
          a4[1] = v32 + 24;
          a4[2] = &v31[24 * v30];
          if (v33)
            operator delete(v33);
          v10 = v38;
          v11 = v39;
          v13 = v37;
        }
        else
        {
          *(_DWORD *)v23 = v21;
          *((_DWORD *)v23 + 1) = v20;
          *((_DWORD *)v23 + 2) = v19;
          *((_DWORD *)v23 + 3) = v25;
          v26 = v23 + 24;
          *((_QWORD *)v23 + 2) = 0;
        }
        a4[1] = v26;
        v14 = v18;
        v9 = v16;
      }
      ++v12;
    }
    while (v12 != a3);
  }
}

void ContourProcessing::fillContourEdgeLine(uint64_t a1, uint64_t *a2, int a3)
{
  __int128 *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  signed int v10;
  int v11;
  int v12;
  signed int v13;
  uint64_t v14;
  signed int v15;
  int v16;
  signed int v17;
  signed int v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  __int128 v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char *v29;
  char *v30;
  char *v31;
  __int128 v32;
  char *v33;
  char *v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  signed int v38;
  int v39;
  int v40;
  int v41;
  __int128 *v42;
  _OWORD *v43;
  uint64_t v44;
  uint64_t v46;
  int v47;
  unsigned int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  unsigned int v53;
  int v54;
  BOOL v55;
  uint64_t v56;
  __int128 *v57;
  int v58;
  __int128 *v59;
  __int128 *v60;
  __int128 *v61;
  __int128 *v62;
  signed int v63;
  uint64_t v64;
  __int128 v66;
  __int128 *v67;
  char v68;

  v66 = 0uLL;
  v67 = 0;
  v5 = (__int128 *)a2[1];
  v6 = *a2;
  v7 = ((uint64_t)v5 - *a2) >> 3;
  v8 = 0xAAAAAAAAAAAAAAABLL * v7;
  if (-1431655765 * (int)v7 >= 2)
  {
    v9 = 0;
    v10 = 0x80000000;
    v11 = 0x7FFFFFFF;
    v12 = 0x7FFFFFFF;
    v13 = 0x80000000;
    do
    {
      v14 = v6 + v9;
      v16 = *(_DWORD *)(v6 + v9);
      v15 = *(_DWORD *)(v6 + v9 + 4);
      if (v15 <= v16)
        ContourProcessing::fillContourEdgeLine();
      v9 += 24;
      v17 = *(_DWORD *)(v14 + 8);
      v18 = v17 + *(_DWORD *)(v14 + 12) * (v15 - v16);
      if (v12 >= v16)
        v12 = v16;
      if (v13 <= v15)
        v13 = v15;
      if (v11 >= v17)
        v11 = v17;
      if (v10 <= v17)
        v10 = v17;
      if (v11 >= v18)
        v11 = v18;
      if (v10 <= v18)
        v10 = v18;
    }
    while (24 * v8 != v9);
    if ((v13 & 0x80000000) == 0
      && v12 < *(_DWORD *)(a1 + 8)
      && (v10 & 0x80000000) == 0
      && v11 < *(_DWORD *)(a1 + 12) << 16)
    {
      v64 = a1;
      v19 = 126 - 2 * __clz(v8);
      v20 = v5 == (__int128 *)v6 ? 0 : v19;
      std::__introsort<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *,false>(v6, v5, (uint64_t)&v68, v20, 1);
      LODWORD(v66) = 0x7FFFFFFF;
      v21 = a2[2];
      v22 = a2[1];
      if (v22 >= v21)
      {
        v25 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v22 - *a2) >> 3);
        v26 = v25 + 1;
        if (v25 + 1 > 0xAAAAAAAAAAAAAAALL)
          std::vector<int>::__throw_length_error[abi:ne180100]();
        v27 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v21 - *a2) >> 3);
        if (2 * v27 > v26)
          v26 = 2 * v27;
        if (v27 >= 0x555555555555555)
          v28 = 0xAAAAAAAAAAAAAAALL;
        else
          v28 = v26;
        if (v28)
          v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<EdgeLine>>((uint64_t)(a2 + 2), v28);
        else
          v29 = 0;
        v30 = &v29[24 * v25];
        v31 = &v29[24 * v28];
        v32 = v66;
        *((_QWORD *)v30 + 2) = v67;
        *(_OWORD *)v30 = v32;
        v24 = (uint64_t)(v30 + 24);
        v34 = (char *)*a2;
        v33 = (char *)a2[1];
        if (v33 != (char *)*a2)
        {
          do
          {
            v35 = *(_OWORD *)(v33 - 24);
            *((_QWORD *)v30 - 1) = *((_QWORD *)v33 - 1);
            *(_OWORD *)(v30 - 24) = v35;
            v30 -= 24;
            v33 -= 24;
          }
          while (v33 != v34);
          v33 = (char *)*a2;
        }
        *a2 = (uint64_t)v30;
        a2[1] = v24;
        a2[2] = (uint64_t)v31;
        if (v33)
          operator delete(v33);
      }
      else
      {
        v23 = v66;
        *(_QWORD *)(v22 + 16) = v67;
        *(_OWORD *)v22 = v23;
        v24 = v22 + 24;
      }
      a2[1] = v24;
      v67 = 0;
      v36 = *a2;
      v37 = v64;
      v38 = *(_DWORD *)(v64 + 8);
      if (v13 < v38)
        v38 = v13;
      v39 = *(_DWORD *)v36;
      v63 = v38;
      if (*(_DWORD *)v36 < v38)
      {
        v40 = 0;
LABEL_44:
        v41 = 0;
        v42 = &v66;
        v43 = v67;
        while (1)
        {
          v44 = (uint64_t)v43;
          if (!v43)
            break;
          while (*(_DWORD *)(v44 + 4) == v39)
          {
            *((_QWORD *)v42 + 2) = *(_QWORD *)(v44 + 16);
            v44 = *(_QWORD *)(v44 + 16);
            if (!v44)
              goto LABEL_48;
          }
          if (*(_DWORD *)v36 <= v39 && *(_DWORD *)(v44 + 8) >= *(_DWORD *)(v36 + 8))
          {
            if (v40 >= (int)v8)
              goto LABEL_74;
LABEL_54:
            *((_QWORD *)v42 + 2) = v36;
            *(_QWORD *)(v36 + 16) = v44;
            v46 = *a2 + 24 * ++v40;
            v43 = (_OWORD *)v44;
            v44 = v36;
            if (!v41)
              goto LABEL_72;
            goto LABEL_59;
          }
          v43 = *(_OWORD **)(v44 + 16);
          v46 = v36;
          if (!v41)
            goto LABEL_72;
LABEL_59:
          if ((v39 & 0x80000000) == 0)
          {
            v47 = *((_DWORD *)v42 + 2);
            v48 = *(_DWORD *)(v44 + 8);
            if (v47 >= (int)v48)
              v49 = *(_DWORD *)(v44 + 8);
            else
              v49 = *((_DWORD *)v42 + 2);
            if (v47 > (int)v48)
              v48 = *((_DWORD *)v42 + 2);
            if ((v48 & 0x80000000) == 0)
            {
              v50 = *(_DWORD *)(v37 + 12);
              v51 = (v49 + 0xFFFF) >> 16;
              if (v51 < v50)
              {
                v52 = HIWORD(v48);
                v53 = v51 & ~(v51 >> 31);
                v54 = v50 - 1;
                if (v52 < v50)
                  v54 = v52;
                v55 = __OFSUB__(v54, v53);
                v56 = v54 - v53;
                if ((int)v56 < 0 == v55)
                {
                  memset((void *)(*(_QWORD *)v37 + v50 * v39 + (unint64_t)v53), a3, v56 + 1);
                  v37 = v64;
                }
              }
            }
          }
          *((_DWORD *)v42 + 2) += *((_DWORD *)v42 + 3);
          *(_DWORD *)(v44 + 8) += *(_DWORD *)(v44 + 12);
LABEL_72:
          v41 ^= 1u;
          v36 = v46;
          v42 = (__int128 *)v44;
        }
LABEL_48:
        if (*(_DWORD *)v36 == v39 && v40 < (int)v8)
        {
          v44 = 0;
          goto LABEL_54;
        }
LABEL_74:
        v57 = 0;
        v58 = 0;
        v59 = v67;
        while (1)
        {
          if (v59 == v57)
          {
            v61 = &v66;
LABEL_84:
            if (!v58)
            {
LABEL_89:
              if (++v39 == v63)
                return;
              goto LABEL_44;
            }
          }
          else
          {
            v60 = &v66;
            while (1)
            {
              v61 = (__int128 *)*((_QWORD *)v59 + 2);
              if (!v61)
                break;
              if (*((_DWORD *)v59 + 2) <= *((_DWORD *)v61 + 2))
              {
                v62 = (__int128 *)*((_QWORD *)v59 + 2);
                v61 = v59;
                v59 = v62;
              }
              else
              {
                *((_QWORD *)v60 + 2) = v61;
                *((_QWORD *)v59 + 2) = *((_QWORD *)v61 + 2);
                *((_QWORD *)v61 + 2) = v59;
                v58 = 1;
                v62 = v59;
              }
              v60 = v61;
              if (v62 == v57)
                goto LABEL_84;
            }
            v61 = v60;
            if (!v58)
              goto LABEL_89;
          }
          if (v61 != &v66)
          {
            v59 = v67;
            v58 = 1;
            v57 = v61;
            if (v61 != v67)
              continue;
          }
          goto LABEL_89;
        }
      }
    }
  }
}

uint64_t ContourProcessing::isHole(ContourProcessing *this, int *a2, int a3)
{
  char v3;
  uint64_t v4;
  int *i;
  int v6;

  if (a3 >= 1)
  {
    v3 = 0;
    v4 = a3;
    for (i = a2 + 1; ; i += 2)
    {
      v6 = *i;
      if (*(unsigned __int8 *)(*(_QWORD *)this + *(i - 1) + *((int *)this + 3) * (uint64_t)*i) != 255)
        break;
      v3 |= v6 < *((_DWORD *)this + 28) + 90;
      if (!--v4)
        return v3 & 1;
    }
  }
  v3 = 0;
  return v3 & 1;
}

void std::vector<EdgeLine>::reserve(void **a1, unint64_t a2)
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
      std::vector<int>::__throw_length_error[abi:ne180100]();
    v5 = ((_BYTE *)a1[1] - (_BYTE *)*a1) / 24;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<EdgeLine>>(v3, a2);
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

void std::vector<int>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24EE56CA0, MEMORY[0x24BEDAAF0]);
}

void sub_2269C4208(_Unwind_Exception *a1)
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(4 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<EdgeLine>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(24 * a2);
}

void std::__introsort<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *,false>(uint64_t a1, __int128 *a2, uint64_t a3, uint64_t a4, char a5)
{
  __int128 *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int *v15;
  uint64_t v16;
  int *v17;
  __int128 *v18;
  int *v19;
  __int128 v20;
  int v21;
  BOOL v22;
  int v23;
  int v24;
  unint64_t v25;
  char v26;
  BOOL v27;
  __int128 *v28;
  int v29;
  BOOL v30;
  int v31;
  int v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;

LABEL_1:
  v9 = (__int128 *)a1;
LABEL_2:
  v10 = 1 - a4;
  while (2)
  {
    a1 = (uint64_t)v9;
    v11 = v10;
    v12 = (char *)a2 - (char *)v9;
    v13 = 0xAAAAAAAAAAAAAAABLL * (((char *)a2 - (char *)v9) >> 3);
    switch(v13)
    {
      case 0uLL:
      case 1uLL:
        return;
      case 2uLL:
        v28 = (__int128 *)((char *)a2 - 24);
        v29 = *((_DWORD *)a2 - 6);
        v30 = v29 < *(_DWORD *)v9;
        if (v29 == *(_DWORD *)v9)
        {
          v31 = *((_DWORD *)a2 - 4);
          v32 = *((_DWORD *)v9 + 2);
          v30 = v31 < v32;
          if (v31 == v32)
            v30 = *((_DWORD *)a2 - 3) < *((_DWORD *)v9 + 3);
        }
        if (v30)
        {
          v37 = *((_QWORD *)v9 + 2);
          v35 = *v9;
          v33 = *v28;
          *((_QWORD *)v9 + 2) = *((_QWORD *)a2 - 1);
          *v9 = v33;
          *v28 = v35;
          *((_QWORD *)a2 - 1) = v37;
        }
        return;
      case 3uLL:
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>(v9, (int *)v9 + 6, (__int128 *)((char *)a2 - 24));
        return;
      case 4uLL:
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>((uint64_t)v9, (uint64_t)v9 + 24, (uint64_t)(v9 + 3), (uint64_t)a2 - 24);
        return;
      case 5uLL:
        std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>((uint64_t)v9, (uint64_t)v9 + 24, (uint64_t)(v9 + 3), (uint64_t)v9 + 72, (uint64_t)a2 - 24);
        return;
      default:
        if (v12 <= 575)
        {
          if ((a5 & 1) != 0)
            std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>((uint64_t)v9, (uint64_t)a2);
          else
            std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>((uint64_t)v9, (uint64_t)a2);
          return;
        }
        if (v11 != 1)
        {
          v14 = v13 >> 1;
          v15 = (int *)v9 + 6 * (v13 >> 1);
          if ((unint64_t)v12 < 0xC01)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>((__int128 *)((char *)v9 + 24 * v14), (int *)v9, (__int128 *)((char *)a2 - 24));
            if ((a5 & 1) != 0)
              goto LABEL_15;
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>(v9, (int *)v9 + 6 * v14, (__int128 *)((char *)a2 - 24));
            v16 = 3 * v14;
            v17 = (int *)v9 + 6 * v14 - 6;
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>((__int128 *)((char *)v9 + 24), v17, a2 - 3);
            v18 = v9 + 3;
            v19 = (int *)v9 + 2 * v16 + 6;
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>(v18, v19, (__int128 *)((char *)a2 - 72));
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>((__int128 *)v17, v15, (__int128 *)v19);
            v36 = *(_QWORD *)(a1 + 16);
            v34 = *(_OWORD *)a1;
            v20 = *(_OWORD *)v15;
            *(_QWORD *)(a1 + 16) = *((_QWORD *)v15 + 2);
            *(_OWORD *)a1 = v20;
            *((_QWORD *)v15 + 2) = v36;
            *(_OWORD *)v15 = v34;
            if ((a5 & 1) != 0)
              goto LABEL_15;
          }
          v21 = *(_DWORD *)(a1 - 24);
          v22 = v21 < *(_DWORD *)a1;
          if (v21 == *(_DWORD *)a1)
          {
            v23 = *(_DWORD *)(a1 - 16);
            v24 = *(_DWORD *)(a1 + 8);
            v22 = v23 < v24;
            if (v23 == v24)
              v22 = *(_DWORD *)(a1 - 12) < *(_DWORD *)(a1 + 12);
          }
          if (!v22)
          {
            v9 = std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,EdgeLine *,cmpEdgeLine &>((uint64_t *)a1, a2);
            goto LABEL_19;
          }
LABEL_15:
          v25 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,EdgeLine *,cmpEdgeLine &>((uint64_t *)a1, (unint64_t)a2);
          if ((v26 & 1) == 0)
            goto LABEL_18;
          v27 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>(a1, v25);
          v9 = (__int128 *)(v25 + 24);
          if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>(v25 + 24, (uint64_t)a2))
          {
            v10 = v11 + 1;
            if (v27)
              continue;
LABEL_18:
            std::__introsort<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *,false>(a1, v25, a3, -v11, a5 & 1);
            v9 = (__int128 *)(v25 + 24);
LABEL_19:
            a5 = 0;
            a4 = -v11;
            goto LABEL_2;
          }
          a4 = -v11;
          a2 = (__int128 *)v25;
          if (v27)
            return;
          goto LABEL_1;
        }
        if (v9 != a2)
          std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *,EdgeLine *>((__n128 *)v9, (__n128 *)a2, (__n128 *)a2, a3);
        return;
    }
  }
}

uint64_t std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  BOOL v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  BOOL v17;
  int v18;

  if (result != a2)
  {
    v2 = result + 24;
    if (result + 24 != a2)
    {
      v3 = 0;
      v4 = result;
      do
      {
        v5 = v4;
        v4 = v2;
        v6 = *(_DWORD *)(v5 + 24);
        if (v6 == *(_DWORD *)v5)
        {
          v7 = *(_DWORD *)(v5 + 32);
          v8 = *(_DWORD *)(v5 + 8);
          v9 = v7 < v8;
          if (v7 == v8)
            v9 = *(_DWORD *)(v5 + 36) < *(_DWORD *)(v5 + 12);
          if (v9)
            goto LABEL_11;
        }
        else if (v6 < *(_DWORD *)v5)
        {
          v7 = *(_DWORD *)(v5 + 32);
LABEL_11:
          v10 = *(_DWORD *)(v5 + 28);
          v11 = *(_DWORD *)(v5 + 36);
          v12 = *(_QWORD *)(v5 + 40);
          *(_OWORD *)v4 = *(_OWORD *)v5;
          *(_QWORD *)(v4 + 16) = *(_QWORD *)(v5 + 16);
          v13 = result;
          if (v5 != result)
          {
            v14 = v3;
            do
            {
              v15 = result + v14;
              v16 = *(_DWORD *)(result + v14 - 24);
              v17 = v6 < v16;
              if (v6 == v16 && (v18 = *(_DWORD *)(v15 - 16), v17 = v7 < v18, v7 == v18))
              {
                v13 = result + v14;
                if (v11 >= *(_DWORD *)(result + v14 - 12))
                  goto LABEL_21;
              }
              else if (!v17)
              {
                v13 = v5;
                goto LABEL_21;
              }
              v5 -= 24;
              *(_OWORD *)v15 = *(_OWORD *)(result + v14 - 24);
              *(_QWORD *)(v15 + 16) = *(_QWORD *)(result + v14 - 8);
              v14 -= 24;
            }
            while (v14);
            v13 = result;
          }
LABEL_21:
          *(_DWORD *)v13 = v6;
          *(_DWORD *)(v13 + 4) = v10;
          *(_DWORD *)(v13 + 8) = v7;
          *(_DWORD *)(v13 + 12) = v11;
          *(_QWORD *)(v13 + 16) = v12;
        }
        v2 = v4 + 24;
        v3 += 24;
      }
      while (v4 + 24 != a2);
    }
  }
  return result;
}

uint64_t std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  BOOL v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  BOOL v12;
  int v13;

  if (result != a2)
  {
    while (1)
    {
      while (1)
      {
        if (result + 24 == a2)
          return result;
        v2 = result;
        result += 24;
        v3 = *(_DWORD *)(v2 + 24);
        if (v3 != *(_DWORD *)v2)
          break;
        v4 = *(_DWORD *)(v2 + 32);
        v5 = *(_DWORD *)(v2 + 8);
        v6 = v4 < v5;
        if (v4 == v5)
          v6 = *(_DWORD *)(v2 + 36) < *(_DWORD *)(v2 + 12);
        if (v6)
        {
LABEL_11:
          v7 = *(_DWORD *)(v2 + 28);
          v8 = *(_DWORD *)(v2 + 36);
          v9 = *(_QWORD *)(v2 + 40);
          do
          {
            v10 = v2;
            *(_OWORD *)(v2 + 24) = *(_OWORD *)v2;
            *(_QWORD *)(v2 + 40) = *(_QWORD *)(v2 + 16);
            v11 = *(_DWORD *)(v2 - 24);
            v2 -= 24;
            v12 = v3 < v11;
            if (v3 == v11)
            {
              v13 = *(_DWORD *)(v10 - 16);
              v12 = v4 < v13;
              if (v4 == v13)
                v12 = v8 < *(_DWORD *)(v10 - 12);
            }
          }
          while (v12);
          *(_DWORD *)v10 = v3;
          *(_DWORD *)(v10 + 4) = v7;
          *(_DWORD *)(v10 + 8) = v4;
          *(_DWORD *)(v10 + 12) = v8;
          *(_QWORD *)(v10 + 16) = v9;
        }
      }
      if (v3 < *(_DWORD *)v2)
      {
        v4 = *(_DWORD *)(v2 + 32);
        goto LABEL_11;
      }
    }
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>(__int128 *a1, int *a2, __int128 *a3)
{
  int v3;
  BOOL v4;
  int v5;
  int v6;
  BOOL v7;
  int v8;
  int v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  BOOL v13;
  int v14;
  int v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  BOOL v19;
  int v20;
  int v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  BOOL v28;
  int v29;
  int v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;

  v3 = *a2;
  v4 = *a2 < *(_DWORD *)a1;
  if (*a2 == *(_DWORD *)a1)
  {
    v5 = a2[2];
    v6 = *((_DWORD *)a1 + 2);
    v4 = v5 < v6;
    if (v5 == v6)
      v4 = a2[3] < *((_DWORD *)a1 + 3);
  }
  if (!v4)
  {
    v13 = *(_DWORD *)a3 < v3;
    if (*(_DWORD *)a3 == v3)
    {
      v14 = *((_DWORD *)a3 + 2);
      v15 = a2[2];
      v13 = v14 < v15;
      if (v14 == v15)
        v13 = *((_DWORD *)a3 + 3) < a2[3];
    }
    if (!v13)
      return 0;
    v16 = *((_QWORD *)a2 + 2);
    v17 = *(_OWORD *)a2;
    v18 = *((_QWORD *)a3 + 2);
    *(_OWORD *)a2 = *a3;
    *((_QWORD *)a2 + 2) = v18;
    *a3 = v17;
    *((_QWORD *)a3 + 2) = v16;
    v19 = *a2 < *(_DWORD *)a1;
    if (*a2 == *(_DWORD *)a1)
    {
      v20 = a2[2];
      v21 = *((_DWORD *)a1 + 2);
      v19 = v20 < v21;
      if (v20 == v21)
        v19 = a2[3] < *((_DWORD *)a1 + 3);
    }
    if (!v19)
      return 1;
    v22 = *((_QWORD *)a1 + 2);
    v23 = *a1;
    v24 = *((_QWORD *)a2 + 2);
    *a1 = *(_OWORD *)a2;
    *((_QWORD *)a1 + 2) = v24;
    *(_OWORD *)a2 = v23;
    *((_QWORD *)a2 + 2) = v22;
    return 2;
  }
  v7 = *(_DWORD *)a3 < v3;
  if (*(_DWORD *)a3 == v3)
  {
    v8 = *((_DWORD *)a3 + 2);
    v9 = a2[2];
    v7 = v8 < v9;
    if (v8 == v9)
      v7 = *((_DWORD *)a3 + 3) < a2[3];
  }
  if (v7)
  {
    v10 = *((_QWORD *)a1 + 2);
    v11 = *a1;
    v12 = *((_QWORD *)a3 + 2);
    *a1 = *a3;
    *((_QWORD *)a1 + 2) = v12;
    *a3 = v11;
    *((_QWORD *)a3 + 2) = v10;
  }
  else
  {
    v25 = *((_QWORD *)a1 + 2);
    v26 = *a1;
    v27 = *((_QWORD *)a2 + 2);
    *a1 = *(_OWORD *)a2;
    *((_QWORD *)a1 + 2) = v27;
    *(_OWORD *)a2 = v26;
    *((_QWORD *)a2 + 2) = v25;
    v28 = *(_DWORD *)a3 < *a2;
    if (*(_DWORD *)a3 == *a2)
    {
      v29 = *((_DWORD *)a3 + 2);
      v30 = a2[2];
      v28 = v29 < v30;
      if (v29 == v30)
        v28 = *((_DWORD *)a3 + 3) < a2[3];
    }
    if (v28)
    {
      v31 = *((_QWORD *)a2 + 2);
      v32 = *(_OWORD *)a2;
      v33 = *((_QWORD *)a3 + 2);
      *(_OWORD *)a2 = *a3;
      *((_QWORD *)a2 + 2) = v33;
      *a3 = v32;
      *((_QWORD *)a3 + 2) = v31;
      return 2;
    }
  }
  return 1;
}

__int128 *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,EdgeLine *,cmpEdgeLine &>(uint64_t *a1, __int128 *i)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  int v6;
  BOOL v7;
  int v8;
  __int128 *v9;
  BOOL v10;
  int v11;
  BOOL v12;
  int v13;
  BOOL v14;
  int v15;
  int v16;
  uint64_t v17;
  __int128 v18;
  int v19;
  BOOL v20;
  int v21;
  int v22;
  BOOL v23;
  int v24;
  __int128 v25;
  __int128 v27;
  uint64_t v28;

  v2 = *a1;
  v3 = *((_DWORD *)a1 + 2);
  v4 = *((_DWORD *)a1 + 3);
  v5 = *((_DWORD *)i - 6);
  v6 = *a1;
  v7 = v6 < v5;
  if (v6 == v5)
  {
    v8 = *((_DWORD *)i - 4);
    v7 = v3 < v8;
    if (v3 == v8)
      v7 = v4 < *((_DWORD *)i - 3);
  }
  v9 = (__int128 *)(a1 + 3);
  if (v7)
  {
    while (1)
    {
      v10 = v6 < *(_DWORD *)v9;
      if (v6 == *(_DWORD *)v9)
      {
        v11 = *((_DWORD *)v9 + 2);
        v10 = v3 < v11;
        if (v3 == v11)
          v10 = v4 < *((_DWORD *)v9 + 3);
      }
      if (v10)
        break;
      v9 = (__int128 *)((char *)v9 + 24);
    }
  }
  else
  {
    while (v9 < i)
    {
      v12 = v6 < *(_DWORD *)v9;
      if (v6 == *(_DWORD *)v9)
      {
        v13 = *((_DWORD *)v9 + 2);
        v12 = v3 < v13;
        if (v3 == v13)
          v12 = v4 < *((_DWORD *)v9 + 3);
      }
      if (v12)
        break;
      v9 = (__int128 *)((char *)v9 + 24);
    }
  }
  if (v9 < i)
  {
    for (i = (__int128 *)((char *)i - 24); ; i = (__int128 *)((char *)i - 24))
    {
      v14 = v6 < v5;
      if (v6 == v5)
      {
        v15 = *((_DWORD *)i + 2);
        v14 = v3 < v15;
        if (v3 == v15)
          v14 = v4 < *((_DWORD *)i + 3);
      }
      if (!v14)
        break;
      v16 = *((_DWORD *)i - 6);
      v5 = v16;
    }
  }
  v17 = a1[2];
  while (v9 < i)
  {
    v28 = *((_QWORD *)v9 + 2);
    v27 = *v9;
    v18 = *i;
    *((_QWORD *)v9 + 2) = *((_QWORD *)i + 2);
    *v9 = v18;
    *((_QWORD *)i + 2) = v28;
    *i = v27;
    do
    {
      v19 = *((_DWORD *)v9 + 6);
      v9 = (__int128 *)((char *)v9 + 24);
      v20 = v6 < v19;
      if (v6 == v19)
      {
        v21 = *((_DWORD *)v9 + 2);
        v20 = v3 < v21;
        if (v3 == v21)
          v20 = v4 < *((_DWORD *)v9 + 3);
      }
    }
    while (!v20);
    do
    {
      v22 = *((_DWORD *)i - 6);
      i = (__int128 *)((char *)i - 24);
      v23 = v6 < v22;
      if (v6 == v22)
      {
        v24 = *((_DWORD *)i + 2);
        v23 = v3 < v24;
        if (v3 == v24)
          v23 = v4 < *((_DWORD *)i + 3);
      }
    }
    while (v23);
  }
  if ((uint64_t *)((char *)v9 - 24) != a1)
  {
    v25 = *(__int128 *)((char *)v9 - 24);
    a1[2] = *((_QWORD *)v9 - 1);
    *(_OWORD *)a1 = v25;
  }
  *((_QWORD *)v9 - 3) = v2;
  *((_DWORD *)v9 - 4) = v3;
  *((_DWORD *)v9 - 3) = v4;
  *((_QWORD *)v9 - 1) = v17;
  return v9;
}

unint64_t std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,EdgeLine *,cmpEdgeLine &>(uint64_t *a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  BOOL v9;
  int v10;
  unint64_t v11;
  int v12;
  BOOL v13;
  int v14;
  int v15;
  BOOL v16;
  int v17;
  unint64_t v19;
  unint64_t v20;
  __int128 v21;
  int v22;
  BOOL v23;
  int v24;
  int v25;
  BOOL v26;
  int v27;
  __int128 v28;
  __int128 v30;
  uint64_t v31;

  v2 = 0;
  v3 = *a1;
  v4 = *((_DWORD *)a1 + 2);
  v5 = *((_DWORD *)a1 + 3);
  v6 = a1[2];
  v7 = *a1;
  while (1)
  {
    v8 = a1[v2 + 3];
    v9 = v8 < v7;
    if (v8 == v7)
    {
      v10 = a1[v2 + 4];
      v9 = v10 < v4;
      if (v10 == v4)
        v9 = SHIDWORD(a1[v2 + 4]) < v5;
    }
    if (!v9)
      break;
    v2 += 3;
  }
  v11 = (unint64_t)&a1[v2 + 3];
  if (v2 * 8)
  {
    do
    {
      v12 = *(_DWORD *)(a2 - 24);
      a2 -= 24;
      v13 = v12 < v7;
      if (v12 == v7)
      {
        v14 = *(_DWORD *)(a2 + 8);
        v13 = v14 < v4;
        if (v14 == v4)
          v13 = *(_DWORD *)(a2 + 12) < v5;
      }
    }
    while (!v13);
  }
  else if (v11 < a2)
  {
    do
    {
      v15 = *(_DWORD *)(a2 - 24);
      a2 -= 24;
      v16 = v15 < v7;
      if (v15 == v7)
      {
        v17 = *(_DWORD *)(a2 + 8);
        v16 = v17 < v4;
        if (v17 == v4)
          v16 = *(_DWORD *)(a2 + 12) < v5;
      }
    }
    while (!v16 && v11 < a2);
  }
  v19 = v11;
  if (v11 < a2)
  {
    v20 = a2;
    do
    {
      v31 = *(_QWORD *)(v19 + 16);
      v30 = *(_OWORD *)v19;
      v21 = *(_OWORD *)v20;
      *(_QWORD *)(v19 + 16) = *(_QWORD *)(v20 + 16);
      *(_OWORD *)v19 = v21;
      *(_QWORD *)(v20 + 16) = v31;
      *(_OWORD *)v20 = v30;
      do
      {
        v22 = *(_DWORD *)(v19 + 24);
        v19 += 24;
        v23 = v22 < v7;
        if (v22 == v7)
        {
          v24 = *(_DWORD *)(v19 + 8);
          v23 = v24 < v4;
          if (v24 == v4)
            v23 = *(_DWORD *)(v19 + 12) < v5;
        }
      }
      while (v23);
      do
      {
        v25 = *(_DWORD *)(v20 - 24);
        v20 -= 24;
        v26 = v25 < v7;
        if (v25 == v7)
        {
          v27 = *(_DWORD *)(v20 + 8);
          v26 = v27 < v4;
          if (v27 == v4)
            v26 = *(_DWORD *)(v20 + 12) < v5;
        }
      }
      while (!v26);
    }
    while (v19 < v20);
  }
  if ((uint64_t *)(v19 - 24) != a1)
  {
    v28 = *(_OWORD *)(v19 - 24);
    a1[2] = *(_QWORD *)(v19 - 8);
    *(_OWORD *)a1 = v28;
  }
  *(_QWORD *)(v19 - 24) = v3;
  *(_DWORD *)(v19 - 16) = v4;
  *(_DWORD *)(v19 - 12) = v5;
  *(_QWORD *)(v19 - 8) = v6;
  return v19 - 24;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  _BOOL8 result;
  _OWORD *v6;
  int v7;
  BOOL v8;
  int v9;
  int v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  BOOL v27;
  int v28;

  v4 = 0xAAAAAAAAAAAAAAABLL * ((a2 - a1) >> 3);
  result = 1;
  switch(v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      v6 = (_OWORD *)(a2 - 24);
      v7 = *(_DWORD *)(a2 - 24);
      v8 = v7 < *(_DWORD *)a1;
      if (v7 == *(_DWORD *)a1)
      {
        v9 = *(_DWORD *)(a2 - 16);
        v10 = *(_DWORD *)(a1 + 8);
        v8 = v9 < v10;
        if (v9 == v10)
          v8 = *(_DWORD *)(a2 - 12) < *(_DWORD *)(a1 + 12);
      }
      if (v8)
      {
        v11 = *(_QWORD *)(a1 + 16);
        v12 = *(_OWORD *)a1;
        v13 = *(_QWORD *)(a2 - 8);
        *(_OWORD *)a1 = *v6;
        *(_QWORD *)(a1 + 16) = v13;
        *v6 = v12;
        *(_QWORD *)(a2 - 8) = v11;
      }
      return result;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>((__int128 *)a1, (int *)(a1 + 24), (__int128 *)(a2 - 24));
      return 1;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>(a1, a1 + 24, a1 + 48, a2 - 24);
      return 1;
    case 5uLL:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>(a1, a1 + 24, a1 + 48, a1 + 72, a2 - 24);
      return 1;
    default:
      v14 = a1 + 48;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>((__int128 *)a1, (int *)(a1 + 24), (__int128 *)(a1 + 48));
      v15 = a1 + 72;
      if (a1 + 72 == a2)
        return 1;
      v16 = 0;
      v17 = 0;
      break;
  }
  while (1)
  {
    v18 = *(_DWORD *)v15;
    if (*(_DWORD *)v15 != *(_DWORD *)v14)
      break;
    v19 = *(_DWORD *)(v15 + 8);
    v20 = *(_DWORD *)(v14 + 8);
    if (v19 == v20)
    {
      if (*(_DWORD *)(v15 + 12) < *(_DWORD *)(v14 + 12))
        goto LABEL_17;
    }
    else if (v19 < v20)
    {
      goto LABEL_17;
    }
LABEL_28:
    v14 = v15;
    v16 += 24;
    v15 += 24;
    if (v15 == a2)
      return 1;
  }
  if (v18 >= *(_DWORD *)v14)
    goto LABEL_28;
  v19 = *(_DWORD *)(v15 + 8);
LABEL_17:
  v21 = *(_DWORD *)(v15 + 4);
  v22 = *(_DWORD *)(v15 + 12);
  v23 = *(_QWORD *)(v15 + 16);
  *(_OWORD *)v15 = *(_OWORD *)v14;
  *(_QWORD *)(v15 + 16) = *(_QWORD *)(v14 + 16);
  v24 = a1;
  if (v14 != a1)
  {
    v25 = v16;
    do
    {
      v26 = *(_DWORD *)(a1 + v25 + 24);
      v27 = v18 < v26;
      if (v18 == v26 && (v28 = *(_DWORD *)(a1 + v25 + 32), v27 = v19 < v28, v19 == v28))
      {
        if (v22 >= *(_DWORD *)(a1 + v25 + 36))
        {
          v24 = a1 + v25 + 48;
          goto LABEL_27;
        }
      }
      else if (!v27)
      {
        v24 = v14;
        goto LABEL_27;
      }
      v14 -= 24;
      *(_OWORD *)(a1 + v25 + 48) = *(_OWORD *)(a1 + v25 + 24);
      *(_QWORD *)(a1 + v25 + 64) = *(_QWORD *)(a1 + v25 + 40);
      v25 -= 24;
    }
    while (v25 != -48);
    v24 = a1;
  }
LABEL_27:
  *(_DWORD *)v24 = v18;
  *(_DWORD *)(v24 + 4) = v21;
  *(_DWORD *)(v24 + 8) = v19;
  *(_DWORD *)(v24 + 12) = v22;
  ++v17;
  *(_QWORD *)(v24 + 16) = v23;
  if (v17 != 8)
    goto LABEL_28;
  return v15 + 24 == a2;
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __n128 result;
  BOOL v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;

  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>((__int128 *)a1, (int *)a2, (__int128 *)a3);
  v9 = *(_DWORD *)a4 < *(_DWORD *)a3;
  if (*(_DWORD *)a4 == *(_DWORD *)a3)
  {
    v10 = *(_DWORD *)(a4 + 8);
    v11 = *(_DWORD *)(a3 + 8);
    v9 = v10 < v11;
    if (v10 == v11)
      v9 = *(_DWORD *)(a4 + 12) < *(_DWORD *)(a3 + 12);
  }
  if (v9)
  {
    v12 = *(_QWORD *)(a3 + 16);
    result = *(__n128 *)a3;
    v13 = *(_QWORD *)(a4 + 16);
    *(_OWORD *)a3 = *(_OWORD *)a4;
    *(_QWORD *)(a3 + 16) = v13;
    *(__n128 *)a4 = result;
    *(_QWORD *)(a4 + 16) = v12;
    v14 = *(_DWORD *)a3 < *(_DWORD *)a2;
    if (*(_DWORD *)a3 == *(_DWORD *)a2)
    {
      v15 = *(_DWORD *)(a3 + 8);
      v16 = *(_DWORD *)(a2 + 8);
      v14 = v15 < v16;
      if (v15 == v16)
        v14 = *(_DWORD *)(a3 + 12) < *(_DWORD *)(a2 + 12);
    }
    if (v14)
    {
      v17 = *(_QWORD *)(a2 + 16);
      result = *(__n128 *)a2;
      v18 = *(_QWORD *)(a3 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(_QWORD *)(a2 + 16) = v18;
      *(__n128 *)a3 = result;
      *(_QWORD *)(a3 + 16) = v17;
      v19 = *(_DWORD *)a2 < *(_DWORD *)a1;
      if (*(_DWORD *)a2 == *(_DWORD *)a1)
      {
        v20 = *(_DWORD *)(a2 + 8);
        v21 = *(_DWORD *)(a1 + 8);
        v19 = v20 < v21;
        if (v20 == v21)
          v19 = *(_DWORD *)(a2 + 12) < *(_DWORD *)(a1 + 12);
      }
      if (v19)
      {
        v22 = *(_QWORD *)(a1 + 16);
        result = *(__n128 *)a1;
        v23 = *(_QWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_QWORD *)(a1 + 16) = v23;
        *(__n128 *)a2 = result;
        *(_QWORD *)(a2 + 16) = v22;
      }
    }
  }
  return result;
}

__n128 std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __n128 result;
  BOOL v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;

  result.n128_u64[0] = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>(a1, a2, a3, a4).n128_u64[0];
  v11 = *(_DWORD *)a5 < *(_DWORD *)a4;
  if (*(_DWORD *)a5 == *(_DWORD *)a4)
  {
    v12 = *(_DWORD *)(a5 + 8);
    v13 = *(_DWORD *)(a4 + 8);
    v11 = v12 < v13;
    if (v12 == v13)
      v11 = *(_DWORD *)(a5 + 12) < *(_DWORD *)(a4 + 12);
  }
  if (v11)
  {
    v14 = *(_QWORD *)(a4 + 16);
    result = *(__n128 *)a4;
    v15 = *(_QWORD *)(a5 + 16);
    *(_OWORD *)a4 = *(_OWORD *)a5;
    *(_QWORD *)(a4 + 16) = v15;
    *(__n128 *)a5 = result;
    *(_QWORD *)(a5 + 16) = v14;
    v16 = *(_DWORD *)a4 < *(_DWORD *)a3;
    if (*(_DWORD *)a4 == *(_DWORD *)a3)
    {
      v17 = *(_DWORD *)(a4 + 8);
      v18 = *(_DWORD *)(a3 + 8);
      v16 = v17 < v18;
      if (v17 == v18)
        v16 = *(_DWORD *)(a4 + 12) < *(_DWORD *)(a3 + 12);
    }
    if (v16)
    {
      v19 = *(_QWORD *)(a3 + 16);
      result = *(__n128 *)a3;
      v20 = *(_QWORD *)(a4 + 16);
      *(_OWORD *)a3 = *(_OWORD *)a4;
      *(_QWORD *)(a3 + 16) = v20;
      *(__n128 *)a4 = result;
      *(_QWORD *)(a4 + 16) = v19;
      v21 = *(_DWORD *)a3 < *(_DWORD *)a2;
      if (*(_DWORD *)a3 == *(_DWORD *)a2)
      {
        v22 = *(_DWORD *)(a3 + 8);
        v23 = *(_DWORD *)(a2 + 8);
        v21 = v22 < v23;
        if (v22 == v23)
          v21 = *(_DWORD *)(a3 + 12) < *(_DWORD *)(a2 + 12);
      }
      if (v21)
      {
        v24 = *(_QWORD *)(a2 + 16);
        result = *(__n128 *)a2;
        v25 = *(_QWORD *)(a3 + 16);
        *(_OWORD *)a2 = *(_OWORD *)a3;
        *(_QWORD *)(a2 + 16) = v25;
        *(__n128 *)a3 = result;
        *(_QWORD *)(a3 + 16) = v24;
        v26 = *(_DWORD *)a2 < *(_DWORD *)a1;
        if (*(_DWORD *)a2 == *(_DWORD *)a1)
        {
          v27 = *(_DWORD *)(a2 + 8);
          v28 = *(_DWORD *)(a1 + 8);
          v26 = v27 < v28;
          if (v27 == v28)
            v26 = *(_DWORD *)(a2 + 12) < *(_DWORD *)(a1 + 12);
        }
        if (v26)
        {
          v29 = *(_QWORD *)(a1 + 16);
          result = *(__n128 *)a1;
          v30 = *(_QWORD *)(a2 + 16);
          *(_OWORD *)a1 = *(_OWORD *)a2;
          *(_QWORD *)(a1 + 16) = v30;
          *(__n128 *)a2 = result;
          *(_QWORD *)(a2 + 16) = v29;
        }
      }
    }
  }
  return result;
}

__n128 *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *,EdgeLine *>(__n128 *a1, __n128 *a2, __n128 *a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  int *v12;
  __n128 *v13;
  __n128 *v14;
  BOOL v15;
  signed __int32 v16;
  signed __int32 v17;
  unint64_t v18;
  __n128 v19;
  unint64_t v20;
  int64_t v21;
  __n128 *v22;
  __n128 *v23;
  __n128 v24;
  __n128 v26;
  unint64_t v27;

  if (a1 != a2)
  {
    v8 = (char *)a2 - (char *)a1;
    v9 = ((char *)a2 - (char *)a1) / 24;
    if ((char *)a2 - (char *)a1 >= 25)
    {
      v10 = (unint64_t)(v9 - 2) >> 1;
      v11 = v10 + 1;
      v12 = (int *)a1 + 6 * v10;
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>((uint64_t)a1, a4, v9, v12);
        v12 -= 6;
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
        v15 = (signed __int32)v14->n128_u32[0] < (signed __int32)a1->n128_u32[0];
        if (v14->n128_u32[0] == a1->n128_u32[0])
        {
          v16 = v14->n128_i32[2];
          v17 = a1->n128_i32[2];
          v15 = v16 < v17;
          if (v16 == v17)
            v15 = (signed __int32)v14->n128_u32[3] < (signed __int32)a1->n128_u32[3];
        }
        if (v15)
        {
          v18 = v14[1].n128_u64[0];
          v19 = *v14;
          v20 = a1[1].n128_u64[0];
          *v14 = *a1;
          v14[1].n128_u64[0] = v20;
          *a1 = v19;
          a1[1].n128_u64[0] = v18;
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>((uint64_t)a1, a4, v9, (int *)a1);
        }
        v14 = (__n128 *)((char *)v14 + 24);
      }
      while (v14 != a3);
      v13 = a3;
    }
    if (v8 >= 25)
    {
      v21 = v8 / 0x18uLL;
      v22 = (__n128 *)((char *)a2 - 24);
      do
      {
        v26 = *a1;
        v27 = a1[1].n128_u64[0];
        std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>(a1, a4, v21);
        if (v22 == v23)
        {
          *v23 = v26;
          v23[1].n128_u64[0] = v27;
        }
        else
        {
          v24 = *v22;
          v23[1].n128_u64[0] = v22[1].n128_u64[0];
          *v23 = v24;
          *v22 = v26;
          v22[1].n128_u64[0] = v27;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>((uint64_t)a1, (uint64_t)&v23[1].n128_i64[1], a4, 0xAAAAAAAAAAAAAAABLL * ((&v23[1].n128_i8[8] - (__int8 *)a1) >> 3));
        }
        v22 = (__n128 *)((char *)v22 - 24);
        v15 = v21-- <= 2;
      }
      while (!v15);
    }
    return v13;
  }
  return a3;
}

uint64_t std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>(uint64_t result, uint64_t a2, uint64_t a3, int *a4)
{
  int64_t v4;
  uint64_t v5;
  __int128 *v6;
  int v7;
  BOOL v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  BOOL v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  __int128 *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  BOOL v23;
  int v24;
  int v25;
  BOOL v26;
  int v27;
  __int128 v28;

  if (a3 < 2)
    return result;
  v4 = (unint64_t)(a3 - 2) >> 1;
  if (v4 < (uint64_t)(0xAAAAAAAAAAAAAAABLL * (((uint64_t)a4 - result) >> 3)))
    return result;
  v5 = (0x5555555555555556 * (((uint64_t)a4 - result) >> 3)) | 1;
  v6 = (__int128 *)(result + 24 * v5);
  if (0x5555555555555556 * (((uint64_t)a4 - result) >> 3) + 2 < a3)
  {
    v7 = *((_DWORD *)v6 + 6);
    v8 = *(_DWORD *)v6 < v7;
    if (*(_DWORD *)v6 == v7)
    {
      v9 = *(_DWORD *)(result + 24 * v5 + 8);
      v10 = *((_DWORD *)v6 + 8);
      v8 = v9 < v10;
      if (v9 == v10)
        v8 = *(_DWORD *)(result + 24 * v5 + 12) < *((_DWORD *)v6 + 9);
    }
    if (v8)
    {
      v6 = (__int128 *)((char *)v6 + 24);
      v5 = 0x5555555555555556 * (((uint64_t)a4 - result) >> 3) + 2;
    }
  }
  v11 = *a4;
  if (*(_DWORD *)v6 == *a4)
  {
    v12 = *((_DWORD *)v6 + 2);
    v13 = a4[2];
    v14 = v12 < v13;
    if (v12 == v13)
    {
      v13 = *((_DWORD *)v6 + 2);
      v14 = *((_DWORD *)v6 + 3) < a4[3];
    }
    if (v14)
      return result;
  }
  else
  {
    if (*(_DWORD *)v6 < v11)
      return result;
    v13 = a4[2];
  }
  v15 = a4[1];
  v16 = a4[3];
  v17 = *((_QWORD *)a4 + 2);
  v18 = *((_QWORD *)v6 + 2);
  *(_OWORD *)a4 = *v6;
  *((_QWORD *)a4 + 2) = v18;
  if (v4 >= v5)
  {
    while (1)
    {
      v19 = v6;
      v20 = 2 * v5;
      v5 = (2 * v5) | 1;
      v6 = (__int128 *)(result + 24 * v5);
      v21 = v20 + 2;
      if (v21 < a3)
      {
        v22 = *((_DWORD *)v6 + 6);
        v23 = *(_DWORD *)v6 < v22;
        if (*(_DWORD *)v6 == v22)
        {
          v24 = *(_DWORD *)(result + 24 * v5 + 8);
          v25 = *((_DWORD *)v6 + 8);
          v23 = v24 < v25;
          if (v24 == v25)
            v23 = *(_DWORD *)(result + 24 * v5 + 12) < *((_DWORD *)v6 + 9);
        }
        if (v23)
        {
          v6 = (__int128 *)((char *)v6 + 24);
          v5 = v21;
        }
      }
      v26 = *(_DWORD *)v6 < v11;
      if (*(_DWORD *)v6 == v11)
      {
        v27 = *((_DWORD *)v6 + 2);
        v26 = v27 < v13;
        if (v27 == v13)
          v26 = *((_DWORD *)v6 + 3) < v16;
      }
      if (v26)
        break;
      v28 = *v6;
      *((_QWORD *)v19 + 2) = *((_QWORD *)v6 + 2);
      *v19 = v28;
      if (v4 < v5)
        goto LABEL_33;
    }
    v6 = v19;
  }
LABEL_33:
  *(_DWORD *)v6 = v11;
  *((_DWORD *)v6 + 1) = v15;
  *((_DWORD *)v6 + 2) = v13;
  *((_DWORD *)v6 + 3) = v16;
  *((_QWORD *)v6 + 2) = v17;
  return result;
}

__n128 std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>(__n128 *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __n128 *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  signed __int32 v10;
  BOOL v11;
  signed __int32 v12;
  signed __int32 v13;
  __n128 result;

  v3 = 0;
  v4 = a3 - 2;
  if (a3 < 2)
    v4 = a3 - 1;
  v5 = v4 >> 1;
  do
  {
    v6 = a1;
    v7 = v3 + 1;
    a1 = (__n128 *)((char *)a1 + 24 * v3 + 24);
    v8 = 2 * v3;
    v3 = (2 * v3) | 1;
    v9 = v8 + 2;
    if (v9 < a3)
    {
      v10 = a1[1].n128_i32[2];
      v11 = (signed __int32)a1->n128_u32[0] < v10;
      if (a1->n128_u32[0] == v10)
      {
        v12 = v6->n128_i32[6 * v7 + 2];
        v13 = a1[2].n128_i32[0];
        v11 = v12 < v13;
        if (v12 == v13)
          v11 = (signed __int32)v6->n128_u32[6 * v7 + 3] < (signed __int32)a1[2].n128_u32[1];
      }
      if (v11)
      {
        a1 = (__n128 *)((char *)a1 + 24);
        v3 = v9;
      }
    }
    result = *a1;
    v6[1].n128_u64[0] = a1[1].n128_u64[0];
    *v6 = result;
  }
  while (v3 <= v5);
  return result;
}

uint64_t std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  __int128 *v6;
  int v7;
  int v8;
  int v9;
  BOOL v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  __int128 *v15;
  unint64_t v16;
  BOOL v17;
  int v18;
  __int128 v19;

  v4 = a4 - 2;
  if (a4 < 2)
    return result;
  v5 = v4 >> 1;
  v6 = (__int128 *)(result + 24 * (v4 >> 1));
  v7 = *(_DWORD *)(a2 - 24);
  if (*(_DWORD *)v6 == v7)
  {
    v8 = *(_DWORD *)(result + 24 * v5 + 8);
    v9 = *(_DWORD *)(a2 - 16);
    v10 = v8 < v9;
    if (v8 == v9)
    {
      v9 = *(_DWORD *)(result + 24 * v5 + 8);
      v10 = *(_DWORD *)(result + 24 * v5 + 12) < *(_DWORD *)(a2 - 12);
    }
    if (!v10)
      return result;
  }
  else
  {
    if (*(_DWORD *)v6 >= v7)
      return result;
    v9 = *(_DWORD *)(a2 - 16);
  }
  v11 = *(_DWORD *)(a2 - 20);
  v12 = *(_DWORD *)(a2 - 12);
  v13 = *(_QWORD *)(a2 - 8);
  v14 = *((_QWORD *)v6 + 2);
  *(_OWORD *)(a2 - 24) = *v6;
  *(_QWORD *)(a2 - 8) = v14;
  if (v4 >= 2)
  {
    while (1)
    {
      v16 = v5 - 1;
      v5 = (v5 - 1) >> 1;
      v15 = (__int128 *)(result + 24 * v5);
      v17 = *(_DWORD *)v15 < v7;
      if (*(_DWORD *)v15 == v7)
      {
        v18 = *(_DWORD *)(result + 24 * v5 + 8);
        v17 = v18 < v9;
        if (v18 == v9)
          v17 = *(_DWORD *)(result + 24 * v5 + 12) < v12;
      }
      if (!v17)
        break;
      v19 = *v15;
      *((_QWORD *)v6 + 2) = *((_QWORD *)v15 + 2);
      *v6 = v19;
      v6 = (__int128 *)(result + 24 * v5);
      if (v16 <= 1)
        goto LABEL_17;
    }
  }
  v15 = v6;
LABEL_17:
  *(_DWORD *)v15 = v7;
  *((_DWORD *)v15 + 1) = v11;
  *((_DWORD *)v15 + 2) = v9;
  *((_DWORD *)v15 + 3) = v12;
  *((_QWORD *)v15 + 2) = v13;
  return result;
}

void sub_2269C7C48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
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

void sub_2269C8314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2269C8440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2269C8604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2269C872C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2269C8880(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_2269C8998(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2269C8B40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_2269C9E90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2269CA3F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_2269CA51C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2269CA898(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_2269CAD94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2269CBA1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2269CBF4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2269CC4A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  uint64_t v33;

  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_2269CE0E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2269CE274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2269CE38C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2269CF1B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2269CF988(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id location)
{
  id *v32;
  id *v33;

  objc_destroyWeak(v32);
  objc_destroyWeak(v33);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t AVTMorphTargetNameDefinesPose(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "containsString:", CFSTR("__")) & 1) != 0
    || (objc_msgSend(v1, "containsString:", CFSTR("_0_")) & 1) != 0
    || (objc_msgSend(v1, "hasSuffix:", CFSTR("_backward")) & 1) != 0
    || (objc_msgSend(v1, "hasSuffix:", CFSTR("_forward")) & 1) != 0
    || (objc_msgSend(v1, "hasSuffix:", CFSTR("_rightward")) & 1) != 0
    || (objc_msgSend(v1, "hasSuffix:", CFSTR("_leftward")) & 1) != 0
    || (objc_msgSend(v1, "hasSuffix:", CFSTR("_downward")) & 1) != 0
    || (objc_msgSend(v1, "hasSuffix:", CFSTR("_upward")) & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    v2 = objc_msgSend(v1, "hasPrefix:", CFSTR("variant_")) ^ 1;
  }

  return v2;
}

void sub_2269D2750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void sub_2269D298C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2269D2E60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  id *v24;

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_2269D38C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

void sub_2269D3BCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2269D413C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const __CFString *NSStringFromUIDeviceOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5)
    return CFSTR("UIDeviceOrientationUnknown");
  else
    return off_24EE58760[a1 - 1];
}

__CFString *NSStringFromUIInterfaceOrientation(unint64_t a1)
{
  if (a1 > 4)
    return 0;
  else
    return off_24EE58790[a1];
}

const __CFString *NSStringFromJFXTrackingType(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("None");
  if (a1 == 1)
    v1 = CFSTR("3D");
  if (a1 == 2)
    return CFSTR("Billboard");
  else
    return v1;
}

id AXDurationStringForDuration(double a1)
{
  double v2;

  if (AXDurationStringForDuration_onceToken != -1)
    dispatch_once(&AXDurationStringForDuration_onceToken, &__block_literal_global_10);
  v2 = 0.0;
  if ((*(_QWORD *)&a1 & 0x7FFFFFFFFFFFFFFFuLL) < 0x7FF0000000000000)
    v2 = a1;
  objc_msgSend((id)AXDurationStringForDuration_formatter, "stringFromTimeInterval:", v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_2269DC5CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id jfx_drawInRect(void *a1, int a2, double a3, double a4, double a5, double a6, float a7)
{
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  CGColorSpaceRef ColorSpace;
  int v19;
  void *v20;
  id v21;
  void *v22;
  CGColorSpace *v24;
  _QWORD v25[4];
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;

  v13 = a1;
  objc_msgSend(MEMORY[0x24BDF6AA0], "defaultFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setOpaque:", 0);
  objc_msgSend(v14, "setScale:", a7);
  if (!a2)
    goto LABEL_8;
  if (objc_msgSend(v14, "preferredRange") == 1)
  {
    v15 = v13;
    v16 = v15;
    if (!v15
      || (v17 = objc_retainAutorelease(v15),
          (ColorSpace = CGImageGetColorSpace((CGImageRef)objc_msgSend(v17, "CGImage"))) == 0))
    {

      goto LABEL_10;
    }
    if (jfx_isSRGB_onceToken != -1)
    {
      v24 = ColorSpace;
      dispatch_once(&jfx_isSRGB_onceToken, &__block_literal_global_12);
      ColorSpace = v24;
    }
    v19 = CFEqual(ColorSpace, (CFTypeRef)jfx_isSRGB_s_sRGB);

    if (v19)
LABEL_8:
      objc_msgSend(v14, "setPreferredRange:", 2);
  }
LABEL_10:
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A98]), "initWithBounds:format:", v14, a3, a4, a5, a6);
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __jfx_drawInRect_block_invoke;
  v25[3] = &unk_24EE589D8;
  v26 = v13;
  v27 = a3;
  v28 = a4;
  v29 = a5;
  v30 = a6;
  v21 = v13;
  objc_msgSend(v20, "imageWithActions:", v25);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

uint64_t __jfx_drawInRect_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

CGColorSpaceRef __jfx_isSRGB_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF318]);
  jfx_isSRGB_s_sRGB = (uint64_t)result;
  return result;
}

void sub_2269DD988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2269DDAB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

void sub_2269DDBFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2269DE028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2269DE1B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2269DE310(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2269DEC24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
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

void sub_2269DEEC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CFStringRef CMTimeCopyDescriptionWithScale(CMTime *a1, int32_t a2)
{
  CMTimeEpoch epoch;
  const __CFAllocator **v4;
  const __CFAllocator *v5;
  CMTime v7;
  CMTime time;

  v7 = *a1;
  CMTimeConvertScale(&time, &v7, a2, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
  *(_OWORD *)&a1->value = *(_OWORD *)&time.value;
  epoch = time.epoch;
  v4 = (const __CFAllocator **)MEMORY[0x24BDBD240];
  a1->epoch = time.epoch;
  v5 = *v4;
  *(_OWORD *)&time.value = *(_OWORD *)&a1->value;
  time.epoch = epoch;
  return CMTimeCopyDescription(v5, &time);
}

CFStringRef CMTimeRangeCopyDescriptionWithScale(_OWORD *a1, int32_t a2)
{
  __int128 v3;
  __int128 v4;
  const __CFAllocator *v5;
  __int128 v6;
  _OWORD v8[3];
  CMTimeRange range;

  v3 = a1[1];
  v8[0] = *a1;
  v8[1] = v3;
  v8[2] = a1[2];
  CMTimeRangeConvertScale((uint64_t)v8, a2, kCMTimeRoundingMethod_RoundHalfAwayFromZero, (uint64_t)&range);
  v4 = *(_OWORD *)&range.start.epoch;
  *a1 = *(_OWORD *)&range.start.value;
  a1[1] = v4;
  a1[2] = *(_OWORD *)&range.duration.timescale;
  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v6 = a1[1];
  *(_OWORD *)&range.start.value = *a1;
  *(_OWORD *)&range.start.epoch = v6;
  *(_OWORD *)&range.duration.timescale = a1[2];
  return CMTimeRangeCopyDescription(v5, &range);
}

__n128 CMTimeRangeConvertScale@<Q0>(uint64_t a1@<X0>, int32_t a2@<W1>, CMTimeRoundingMethod a3@<W2>, uint64_t a4@<X8>)
{
  __int128 v8;
  __n128 result;
  CMTime v10;
  CMTime v11;

  v10 = *(CMTime *)a1;
  CMTimeConvertScale(&v11, &v10, a2, a3);
  *(CMTime *)a1 = v11;
  v10 = *(CMTime *)(a1 + 24);
  CMTimeConvertScale(&v11, &v10, a2, a3);
  *(CMTime *)(a1 + 24) = v11;
  v8 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a4 = *(_OWORD *)a1;
  *(_OWORD *)(a4 + 16) = v8;
  result = *(__n128 *)(a1 + 32);
  *(__n128 *)(a4 + 32) = result;
  return result;
}

__n128 CMTimeGetDistanceToRange@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __n128 *a3@<X8>)
{
  __n128 *v6;
  __int128 v7;
  __n128 result;
  __int128 v9;
  __int128 v10;
  CMTimeRange *p_range;
  CMTimeRange *p_time;
  CMTime v13;
  CMTime time2;
  CMTime time;
  CMTimeRange range;
  CMTime v17;

  v6 = (__n128 *)MEMORY[0x24BDC0D88];
  v17 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
  v7 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&range.start.value = *(_OWORD *)a2;
  *(_OWORD *)&range.start.epoch = v7;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)(a2 + 32);
  time = *(CMTime *)a1;
  if (!CMTimeRangeContainsTime(&range, &time))
  {
    if ((*(_BYTE *)(a1 + 12) & 1) != 0
      && (*(_BYTE *)(a2 + 12) & 1) != 0
      && (*(_BYTE *)(a2 + 36) & 1) != 0
      && !*(_QWORD *)(a2 + 40)
      && (*(_QWORD *)(a2 + 24) & 0x8000000000000000) == 0)
    {
      *(_OWORD *)&range.start.value = *(_OWORD *)a1;
      range.start.epoch = *(_QWORD *)(a1 + 16);
      time = *(CMTime *)a2;
      if (CMTimeCompare(&range.start, &time) < 0)
      {
        *(_OWORD *)&range.start.value = *(_OWORD *)a2;
        range.start.epoch = *(_QWORD *)(a2 + 16);
        time = *(CMTime *)a1;
        v6 = (__n128 *)&v17;
        p_range = &range;
        p_time = (CMTimeRange *)&time;
      }
      else
      {
        v9 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)&range.start.value = *(_OWORD *)a2;
        *(_OWORD *)&range.start.epoch = v9;
        *(_OWORD *)&range.duration.timescale = *(_OWORD *)(a2 + 32);
        CMTimeRangeGetEnd(&time2, &range);
        *(_OWORD *)&range.start.value = *(_OWORD *)a1;
        range.start.epoch = *(_QWORD *)(a1 + 16);
        if (CMTimeCompare(&range.start, &time2) < 1)
        {
          v6 = (__n128 *)&v17;
          goto LABEL_7;
        }
        v10 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)&range.start.value = *(_OWORD *)a2;
        *(_OWORD *)&range.start.epoch = v10;
        *(_OWORD *)&range.duration.timescale = *(_OWORD *)(a2 + 32);
        CMTimeRangeGetEnd(&v13, &range);
        *(_OWORD *)&range.start.value = *(_OWORD *)a1;
        range.start.epoch = *(_QWORD *)(a1 + 16);
        v6 = (__n128 *)&v17;
        p_range = (CMTimeRange *)&v13;
        p_time = &range;
      }
      CMTimeSubtract(&v17, &p_range->start, &p_time->start);
    }
    else
    {
      v6 = (__n128 *)MEMORY[0x24BDC0D58];
    }
  }
LABEL_7:
  result = *v6;
  *a3 = *v6;
  a3[1].n128_u64[0] = v6[1].n128_u64[0];
  return result;
}

Float64 DurationSecondsFromFrameTime(int a1, int32_t a2)
{
  CMTime v3;
  CMTime v4;

  memset(&v4, 0, sizeof(v4));
  CMTimeMake(&v4, a1, a2);
  v3 = v4;
  return CMTimeGetSeconds(&v3);
}

CMTime *DurationCMTimeFromFrameTime@<X0>(int a1@<W0>, int32_t a2@<W1>, CMTime *a3@<X8>)
{
  return CMTimeMake(a3, a1, a2);
}

Float64 SecondsFromFrameTime(int a1, int32_t a2)
{
  CMTime v3;
  CMTime v4;

  memset(&v4, 0, sizeof(v4));
  CMTimeMake(&v4, a1, a2);
  v3 = v4;
  return CMTimeGetSeconds(&v3);
}

CMTime *CMTimeFromFrameTime@<X0>(int a1@<W0>, int32_t a2@<W1>, CMTime *a3@<X8>)
{
  return CMTimeMake(a3, a1, a2);
}

uint64_t FrameTimeFromCMTime(_QWORD *a1, int32_t a2)
{
  CMTime v3;
  CMTime v4;

  if (!*a1)
    return 0;
  memset(&v4, 0, sizeof(v4));
  v3 = *(CMTime *)a1;
  CMTimeConvertScale(&v4, &v3, a2, kCMTimeRoundingMethod_RoundTowardZero);
  return LODWORD(v4.value);
}

unsigned int FrameTimeFromSeconds(int a1, double a2)
{
  return llround((double)a1 * a2);
}

unsigned int FrameTimeIntegerFloorFromSeconds(int a1, double a2)
{
  return vcvtmd_s64_f64((double)a1 * a2);
}

double CMTimeRangeForStartAndDuration@<D0>(int32_t timescale@<W2>, int a2@<W0>, int a3@<W1>, uint64_t a4@<X8>)
{
  double result;
  CMTime v8;

  *(_OWORD *)(a4 + 16) = 0u;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)a4 = 0u;
  CMTimeMake(&v8, a2, timescale);
  *(CMTime *)a4 = v8;
  CMTimeMake(&v8, a3, timescale);
  result = *(double *)&v8.value;
  *(CMTime *)(a4 + 24) = v8;
  return result;
}

id JFXNSStringForCMTime(CMTime *a1)
{
  uint64_t timescale;
  CMTime time;

  timescale = a1->timescale;
  time = *a1;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{%lld/%d = %.3f}"), time.value, timescale, CMTimeGetSeconds(&time));
  return (id)objc_claimAutoreleasedReturnValue();
}

void OUTLINED_FUNCTION_0_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

double CGRectGetCenterPoint(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double MidX;
  CGRect v10;

  MidX = CGRectGetMidX(*(CGRect *)&a1);
  v10.origin.x = a1;
  v10.origin.y = a2;
  v10.size.width = a3;
  v10.size.height = a4;
  CGRectGetMidY(v10);
  return MidX;
}

double CGRectMakeWithSizeAndCenterPoint(double a1, double a2, double a3)
{
  return a3 - a1 * 0.5;
}

double CGRectMakeWithSize()
{
  return 0.0;
}

double CGRectMakeSquareWithSize()
{
  return 0.0;
}

double CGRectMakeSquareWithSizeAndCenterPoint(double a1, double a2)
{
  return a2 - a1 * 0.5;
}

double CGRectFillRectToAspectInRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  float v8;
  double v9;

  if (a3 <= a4)
  {
    v8 = a4 / a8;
    if (a7 * v8 < a3)
    {
      v9 = a3 / a7;
      goto LABEL_6;
    }
  }
  else
  {
    v8 = a3 / a7;
    if (a8 * v8 < a4)
    {
      v9 = a4 / a8;
LABEL_6:
      v8 = v9;
    }
  }
  return a1 + floor((a3 - a7 * v8) * 0.5);
}

double CGRectForInnerSizeCenteredInOuterSize(double a1, double a2, double a3)
{
  return (a3 - a1) * 0.5;
}

BOOL CGRectCouldContainRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double Width;
  double Height;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  v19.origin.x = a5;
  v19.origin.y = a6;
  v19.size.width = a7;
  v19.size.height = a8;
  Width = CGRectGetWidth(v19);
  v20.origin.x = a1;
  v20.origin.y = a2;
  v20.size.width = a3;
  v20.size.height = a4;
  if (Width > CGRectGetWidth(v20))
    return 0;
  v21.origin.x = a5;
  v21.origin.y = a6;
  v21.size.width = a7;
  v21.size.height = a8;
  Height = CGRectGetHeight(v21);
  v22.origin.x = a1;
  v22.origin.y = a2;
  v22.size.width = a3;
  v22.size.height = a4;
  return Height <= CGRectGetHeight(v22);
}

double CGRectCenterOverRectHorizontally(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  return a5 + (a7 - a3) * 0.5;
}

double CGRectCenterOverRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  return a5 + (a7 - a3) * 0.5;
}

double CGRectCenterRectAtNormalizedPointInRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  return a5 + a7 * a9 - a3 * 0.5;
}

CGFloat CGRectMoveToKeepCenterWithinRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  CGFloat v16;
  double MidX;
  double v18;
  double MaxX;
  double MinX;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v23.origin.x = a5;
  v23.origin.y = a6;
  v23.size.width = a7;
  v23.size.height = a8;
  MinX = CGRectGetMinX(v23);
  v24.origin.x = a5;
  v24.origin.y = a6;
  v24.size.width = a7;
  v24.size.height = a8;
  MaxX = CGRectGetMaxX(v24);
  v25.origin.x = a1;
  v25.origin.y = a2;
  v25.size.width = a3;
  v25.size.height = a4;
  v16 = a4;
  MidX = CGRectGetMidX(v25);
  v26.origin.x = a5;
  v26.origin.y = a6;
  v26.size.width = a7;
  v26.size.height = a8;
  CGRectGetMinY(v26);
  v27.origin.x = a5;
  v27.origin.y = a6;
  v27.size.width = a7;
  v27.size.height = a8;
  CGRectGetMaxY(v27);
  v28.origin.x = a1;
  v28.origin.y = a2;
  v28.size.width = a3;
  v28.size.height = v16;
  CGRectGetMidY(v28);
  if (MidX >= MinX)
  {
    v18 = *MEMORY[0x24BDBEFB0];
    if (MidX > MaxX)
      v18 = MaxX - MidX;
  }
  else
  {
    v18 = MinX - MidX;
  }
  return a1 + v18;
}

double CGRectScaleAndCenter(int a1, double result, double a3, double a4, double a5, double a6)
{
  double v7;

  v7 = a4 * a6;
  if (a1)
    return result + (a4 - v7) * 0.5;
  return result;
}

CGFloat CGRectStraighten(double *a1, double *a2)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGAffineTransform v11;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v14;
  CGAffineTransform v15;

  v4 = *a1;
  v5 = a1[1];
  v6 = atan2(a1[3] - v5, a1[2] - *a1);
  v7 = v6;
  if (a2)
  {
    *a2 = v6;
    v4 = *a1;
    v5 = a1[1];
  }
  v8 = a1[4];
  v9 = a1[5];
  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeTranslation(&t1, -(v4 + (v8 - v4) * 0.5), -(v5 + (v9 - v5) * 0.5));
  CGAffineTransformMakeRotation(&t2, -v7);
  CGAffineTransformConcat(&v14, &t1, &t2);
  CGAffineTransformMakeTranslation(&v11, v4 + (v8 - v4) * 0.5, v5 + (v9 - v5) * 0.5);
  CGAffineTransformConcat(&v15, &v14, &v11);
  return v15.tx + v5 * v15.c + v15.a * v4;
}

double CGRectRotate(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  double MidX;
  double MidY;
  uint64_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  CGAffineTransform v19;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v22;
  CGAffineTransform v23;
  double v24[2];
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  CGRect v32;

  v31 = *MEMORY[0x24BDAC8D0];
  v24[0] = a2;
  v24[1] = a3;
  v25 = a2 + a4;
  v26 = a3;
  v27 = a2 + a4;
  v28 = a3 + a5;
  v29 = a2;
  v30 = a3 + a5;
  MidX = CGRectGetMidX(*(CGRect *)&a2);
  v32.origin.x = a2;
  v32.origin.y = a3;
  v32.size.width = a4;
  v32.size.height = a5;
  MidY = CGRectGetMidY(v32);
  memset(&v23, 0, sizeof(v23));
  CGAffineTransformMakeTranslation(&t1, -MidX, -MidY);
  CGAffineTransformMakeRotation(&t2, a6);
  CGAffineTransformConcat(&v22, &t1, &t2);
  CGAffineTransformMakeTranslation(&v19, MidX, MidY);
  CGAffineTransformConcat(&v23, &v22, &v19);
  v14 = 0;
  v15 = *(float64x2_t *)&v23.a;
  v16 = *(float64x2_t *)&v23.c;
  v17 = *(float64x2_t *)&v23.tx;
  do
  {
    *(float64x2_t *)&v24[v14] = vaddq_f64(v17, vmlaq_n_f64(vmulq_n_f64(v16, v24[v14 + 1]), v15, v24[v14]));
    *(_OWORD *)(a1 + v14 * 8) = *(_OWORD *)&v24[v14];
    v14 += 2;
  }
  while (v14 != 8);
  return fmin(v24[0], fmin(v25, fmin(v27, v29)));
}

double CGRectArea(double a1, double a2, double a3, double a4)
{
  return a3 * a4;
}

CGFloat CGRectAreaOfIntersection(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  CGRect v9;

  v9 = CGRectIntersection(*(CGRect *)&a1, *(CGRect *)&a5);
  return v9.size.width * v9.size.height;
}

CGFloat CGRectPercentOfRectThatIntersectsRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  CGRect v11;

  v11 = CGRectIntersection(*(CGRect *)&a1, *(CGRect *)&a5);
  return v11.size.width * v11.size.height / (a3 * a4);
}

double CGRectInsetWithInsets(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

uint64_t CGPointHasNan()
{
  return 0;
}

BOOL CGRectHasNan()
{
  return CGSizeHasNan() != 0;
}

void sub_2269E75DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
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

id JFXEffectClassForType(int a1)
{
  if (a1 == 1 || a1 == 7 || a1 == 2)
    return (id)objc_opt_class();
  else
    return 0;
}

os_signpost_id_t JFXSignpostIDFromObject(void *a1)
{
  id v1;
  NSObject *v2;
  os_signpost_id_t v3;

  v1 = a1;
  JFXPlaybackIntervalSignpostCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_make_with_pointer(v2, v1);

  return v3;
}

id JFXPlaybackIntervalSignpostCategory()
{
  _QWORD v1[6];

  if (JFXIsPlaybackSignpostsEnabled_onceToken != -1)
    dispatch_once(&JFXIsPlaybackSignpostsEnabled_onceToken, &__block_literal_global_19);
  if (JFXIsPlaybackSignpostsEnabled_s_enableSignposts)
  {
    v1[0] = MEMORY[0x24BDAC760];
    v1[2] = __JFXSignPostIntervalCategory_block_invoke;
    v1[3] = &__block_descriptor_48_e5_v8__0l;
    v1[1] = 3221225472;
    v1[4] = &JFXPlaybackIntervalSignpostCategory_s_Category;
    v1[5] = "playback-interval";
    if (JFXPlaybackIntervalSignpostCategory_onceToken != -1)
      dispatch_once(&JFXPlaybackIntervalSignpostCategory_onceToken, v1);
  }
  else
  {
    objc_storeStrong((id *)&JFXPlaybackIntervalSignpostCategory_s_Category, MEMORY[0x24BDACB78]);
  }
  return (id)JFXPlaybackIntervalSignpostCategory_s_Category;
}

uint64_t JFXIsPlaybackSignpostsEnabled()
{
  if (JFXIsPlaybackSignpostsEnabled_onceToken != -1)
    dispatch_once(&JFXIsPlaybackSignpostsEnabled_onceToken, &__block_literal_global_19);
  return JFXIsPlaybackSignpostsEnabled_s_enableSignposts;
}

id JFXPlaybackEventSignpostPointCategory()
{
  _QWORD v1[6];

  if (JFXIsPlaybackSignpostsEnabled_onceToken != -1)
    dispatch_once(&JFXIsPlaybackSignpostsEnabled_onceToken, &__block_literal_global_19);
  if (JFXIsPlaybackSignpostsEnabled_s_enableSignposts)
  {
    v1[0] = MEMORY[0x24BDAC760];
    v1[2] = __JFXSignPostIntervalCategory_block_invoke;
    v1[3] = &__block_descriptor_48_e5_v8__0l;
    v1[1] = 3221225472;
    v1[4] = &JFXPlaybackEventSignpostPointCategory_s_Category;
    v1[5] = "PointsOfInterest";
    if (JFXPlaybackEventSignpostPointCategory_onceToken != -1)
      dispatch_once(&JFXPlaybackEventSignpostPointCategory_onceToken, v1);
  }
  else
  {
    objc_storeStrong((id *)&JFXPlaybackEventSignpostPointCategory_s_Category, MEMORY[0x24BDACB78]);
  }
  return (id)JFXPlaybackEventSignpostPointCategory_s_Category;
}

uint64_t JFXIsMediaDataReaderSignpostsEnabled()
{
  if (JFXIsMediaDataReaderSignpostsEnabled_onceToken != -1)
    dispatch_once(&JFXIsMediaDataReaderSignpostsEnabled_onceToken, &__block_literal_global_4);
  return JFXIsMediaDataReaderSignpostsEnabled_s_enableSignposts;
}

id JFXMediaDataReaderEventSignpostPointCategory()
{
  _QWORD v1[6];

  if (JFXIsMediaDataReaderSignpostsEnabled_onceToken != -1)
    dispatch_once(&JFXIsMediaDataReaderSignpostsEnabled_onceToken, &__block_literal_global_4);
  if (JFXIsMediaDataReaderSignpostsEnabled_s_enableSignposts)
  {
    v1[0] = MEMORY[0x24BDAC760];
    v1[2] = __JFXSignPostIntervalCategory_block_invoke;
    v1[3] = &__block_descriptor_48_e5_v8__0l;
    v1[1] = 3221225472;
    v1[4] = &JFXMediaDataReaderEventSignpostPointCategory_s_Category;
    v1[5] = "PointsOfInterest";
    if (JFXMediaDataReaderEventSignpostPointCategory_onceToken != -1)
      dispatch_once(&JFXMediaDataReaderEventSignpostPointCategory_onceToken, v1);
  }
  else
  {
    objc_storeStrong((id *)&JFXMediaDataReaderEventSignpostPointCategory_s_Category, MEMORY[0x24BDACB78]);
  }
  return (id)JFXMediaDataReaderEventSignpostPointCategory_s_Category;
}

id JFXMediaDataReaderIntervalSignpostCategory()
{
  _QWORD v1[6];

  if (JFXIsMediaDataReaderSignpostsEnabled_onceToken != -1)
    dispatch_once(&JFXIsMediaDataReaderSignpostsEnabled_onceToken, &__block_literal_global_4);
  if (JFXIsMediaDataReaderSignpostsEnabled_s_enableSignposts)
  {
    v1[0] = MEMORY[0x24BDAC760];
    v1[2] = __JFXSignPostIntervalCategory_block_invoke;
    v1[3] = &__block_descriptor_48_e5_v8__0l;
    v1[1] = 3221225472;
    v1[4] = &JFXMediaDataReaderIntervalSignpostCategory_s_Category;
    v1[5] = "mediaDataReader-interval";
    if (JFXMediaDataReaderIntervalSignpostCategory_onceToken != -1)
      dispatch_once(&JFXMediaDataReaderIntervalSignpostCategory_onceToken, v1);
  }
  else
  {
    objc_storeStrong((id *)&JFXMediaDataReaderIntervalSignpostCategory_s_Category, MEMORY[0x24BDACB78]);
  }
  return (id)JFXMediaDataReaderIntervalSignpostCategory_s_Category;
}

uint64_t JFXIsVideoWriterSignpostsEnabled()
{
  if (JFXIsVideoWriterSignpostsEnabled_onceToken != -1)
    dispatch_once(&JFXIsVideoWriterSignpostsEnabled_onceToken, &__block_literal_global_9);
  return JFXIsVideoWriterSignpostsEnabled_s_enableSignposts;
}

id JFXVideoWriterEventSignpostPointCategory()
{
  _QWORD v1[6];

  if (JFXIsVideoWriterSignpostsEnabled_onceToken != -1)
    dispatch_once(&JFXIsVideoWriterSignpostsEnabled_onceToken, &__block_literal_global_9);
  if (JFXIsVideoWriterSignpostsEnabled_s_enableSignposts)
  {
    v1[0] = MEMORY[0x24BDAC760];
    v1[2] = __JFXSignPostIntervalCategory_block_invoke;
    v1[3] = &__block_descriptor_48_e5_v8__0l;
    v1[1] = 3221225472;
    v1[4] = &JFXVideoWriterEventSignpostPointCategory_s_Category;
    v1[5] = "PointsOfInterest";
    if (JFXVideoWriterEventSignpostPointCategory_onceToken != -1)
      dispatch_once(&JFXVideoWriterEventSignpostPointCategory_onceToken, v1);
  }
  else
  {
    objc_storeStrong((id *)&JFXVideoWriterEventSignpostPointCategory_s_Category, MEMORY[0x24BDACB78]);
  }
  return (id)JFXVideoWriterEventSignpostPointCategory_s_Category;
}

id JFXVideoWriterIntervalSignpostCategory()
{
  _QWORD v1[6];

  if (JFXIsVideoWriterSignpostsEnabled_onceToken != -1)
    dispatch_once(&JFXIsVideoWriterSignpostsEnabled_onceToken, &__block_literal_global_9);
  if (JFXIsVideoWriterSignpostsEnabled_s_enableSignposts)
  {
    v1[0] = MEMORY[0x24BDAC760];
    v1[2] = __JFXSignPostIntervalCategory_block_invoke;
    v1[3] = &__block_descriptor_48_e5_v8__0l;
    v1[1] = 3221225472;
    v1[4] = &JFXVideoWriterIntervalSignpostCategory_s_Category;
    v1[5] = "videoWriter-interval";
    if (JFXVideoWriterIntervalSignpostCategory_onceToken != -1)
      dispatch_once(&JFXVideoWriterIntervalSignpostCategory_onceToken, v1);
  }
  else
  {
    objc_storeStrong((id *)&JFXVideoWriterIntervalSignpostCategory_s_Category, MEMORY[0x24BDACB78]);
  }
  return (id)JFXVideoWriterIntervalSignpostCategory_s_Category;
}

void OUTLINED_FUNCTION_1_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

id CFXLog_action()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &CFXLog_action_logObj;
  v1[5] = "action";
  if (CFXLog_action_onceToken != -1)
    dispatch_once(&CFXLog_action_onceToken, v1);
  return (id)CFXLog_action_logObj;
}

id CFXLog_DebugEffectEditorRenderer()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &CFXLog_DebugEffectEditorRenderer_logObj;
  v1[5] = "DebugEffectEditorRenderer";
  if (CFXLog_DebugEffectEditorRenderer_onceToken != -1)
    dispatch_once(&CFXLog_DebugEffectEditorRenderer_onceToken, v1);
  return (id)CFXLog_DebugEffectEditorRenderer_logObj;
}

id CFXLog_DebugEffectEditingUI()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &CFXLog_DebugEffectEditingUI_logObj;
  v1[5] = "DebugEffectEditingUI";
  if (CFXLog_DebugEffectEditingUI_onceToken != -1)
    dispatch_once(&CFXLog_DebugEffectEditingUI_onceToken, v1);
  return (id)CFXLog_DebugEffectEditingUI_logObj;
}

id CFXLog_DebugFeedback()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &CFXLog_DebugFeedback_logObj;
  v1[5] = "DebugFeedback";
  if (CFXLog_DebugFeedback_onceToken != -1)
    dispatch_once(&CFXLog_DebugFeedback_onceToken, v1);
  return (id)CFXLog_DebugFeedback_logObj;
}

id CFXLog_DebugReview()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &CFXLog_DebugReview_logObj;
  v1[5] = "DebugReview";
  if (CFXLog_DebugReview_onceToken != -1)
    dispatch_once(&CFXLog_DebugReview_onceToken, v1);
  return (id)CFXLog_DebugReview_logObj;
}

void VTDecompressionOutputCallbackImpl(void *a1, void *a2, int a3, unsigned int a4, __CVBuffer *a5, CMTime *a6, CMTime *a7)
{
  void *v9;
  NSObject *v10;
  NSObject *v11;

  v9 = a1;
  if (a5)
  {
    objc_msgSend(v9, "setImageBuffer:", CVPixelBufferRetain(a5));
  }
  else
  {
    JFXLog_DebugDepthCodec();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      VTDecompressionOutputCallbackImpl(a3, v10);

  }
  objc_msgSend(v9, "frameSemaphore");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v11);

}

void sub_2269EE4F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2269EE57C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2269EE6B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2269EE7B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2269EE81C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)JFXVideoDecoderInterface;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

double CGSizeFitToAspectInSize(double a1, double a2, double a3, double a4)
{
  float v4;
  double v5;
  float v6;

  v4 = a1 / a3;
  v5 = v4;
  if (a4 * v5 > a2)
  {
    v6 = a2 / a4;
    v5 = v6;
  }
  return floor(a3 * v5);
}

BOOL CGSizeCouldContainSize(double a1, double a2, double a3, double a4)
{
  return a4 <= a2 && a3 <= a1;
}

double CGSizeFillSizeToAspectInSize(double a1, double a2, double a3, double a4)
{
  float v4;
  double v5;

  if (a1 <= a2)
  {
    v4 = a2 / a4;
    if (a3 * v4 < a1)
    {
      v5 = a1 / a3;
      goto LABEL_6;
    }
  }
  else
  {
    v4 = a1 / a3;
    if (a4 * v4 < a2)
    {
      v5 = a2 / a4;
LABEL_6:
      v4 = v5;
    }
  }
  return floor(a3 * v4);
}

void CGSizeFillingTargetSizeLimitedToMaxSize(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double v6;
  uint64_t v7;

  v6 = CGSizeFillSizeToAspectInSize(a2, a3, a4, a5);
  if (a1)
  {
    *(double *)a1 = v6;
    *(_QWORD *)(a1 + 8) = v7;
  }
}

void CGSizeFillSizeToAspectInSizeLimitedToProVideoMaxSize(uint64_t a1, double a2, double a3, double a4, double a5)
{
  CGSizeFillingTargetSizeLimitedToMaxSize(a1, a2, a3, a4, a5);
}

double CGSizeIntegral(double a1)
{
  return ceil(a1);
}

void CGSizeAngleAndDistance(double *a1, double *a2, double a3, double a4)
{
  double v7;
  double v8;
  double v11;

  if (a3 == 0.0)
  {
    v7 = 4.71238898;
    if (a4 >= 0.0)
      v7 = 0.0;
    if (a4 > 0.0)
      v7 = 1.57079633;
    v8 = fabs(a4);
    if (a1)
LABEL_7:
      *a1 = v7;
  }
  else
  {
    v7 = atan(a4 / a3);
    if ((a3 >= 0.0 || a4 <= 0.0) && (a3 >= 0.0 || a4 >= 0.0))
    {
      if (a4 < 0.0 && a3 > 0.0)
        v7 = v7 + 6.28318531;
    }
    else
    {
      v7 = v7 + 3.14159265;
    }
    v8 = fabs(a3);
    v11 = sqrt(a3 * a3 + a4 * a4);
    if (a4 != 0.0)
      v8 = v11;
    if (a1)
      goto LABEL_7;
  }
  if (a2)
    *a2 = v8;
}

double CGSizeApplyAffineTransformWithPositiveResult(float64x2_t *a1, double a2, double a3)
{
  double result;

  *(_QWORD *)&result = *(_OWORD *)&vabsq_f64(vmlaq_n_f64(vmulq_n_f64(a1[1], a3), *a1, a2));
  return result;
}

double CGSizeScale(double a1, double a2, double a3)
{
  return a1 * a3;
}

double CGSizeScaleBy(double a1, double a2, double a3)
{
  return a1 * a3;
}

double CGSizeRotate90(double a1, double a2)
{
  return a2;
}

BOOL CGSizeIsSquare(double a1, double a2)
{
  return a1 == a2;
}

uint64_t CGSizeHasNan()
{
  return 0;
}

void VTCompressionOutputCallbackImpl(void *a1, void *a2, int a3, unsigned int a4, opaqueCMSampleBuffer *a5)
{
  void *v7;
  void *v8;
  NSObject *v9;

  v7 = a1;
  v8 = v7;
  if (a5)
  {
    objc_msgSend(v7, "writeSampleBuffer:", a5);
  }
  else
  {
    JFXLog_depthCodec();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      VTCompressionOutputCallbackImpl(a3, v9);

    objc_msgSend(v8, "skipFrame");
  }

}

void sub_2269F3208(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2269F32A4(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v3 = v2;
  MEMORY[0x2276A1A98](v3, 0x1020C40322220F4);

  _Unwind_Resume(a1);
}

void sub_2269F3584(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  unint64_t *v14;
  unint64_t *v16;
  unint64_t v17;

  v16 = v14 + 1;
  do
    v17 = __ldaxr(v16);
  while (__stlxr(v17 - 1, v16));
  if (!v17)
    (*(void (**)(unint64_t *))(*v14 + 16))(v14);
  _Unwind_Resume(exception_object);
}

uint64_t std::future<opaqueCMSampleBuffer *>::get(std::__assoc_sub_state **a1)
{
  std::__assoc_sub_state *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t *p_shared_owners;
  unint64_t v5;

  v1 = *a1;
  *a1 = 0;
  std::__assoc_state<opaqueCMSampleBuffer *>::move(v1);
  v3 = v2;
  if (v1)
  {
    p_shared_owners = (unint64_t *)&v1->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
      ((void (*)(std::__assoc_sub_state *))v1->__on_zero_shared)(v1);
  }
  return v3;
}

void sub_2269F3630(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    std::future<opaqueCMSampleBuffer *>::get(v1);
  _Unwind_Resume(exception_object);
}

void std::promise<opaqueCMSampleBuffer *>::set_value(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;

  v2 = *a1;
  if (!v2)
    std::__throw_future_error[abi:ne180100](3u);
  std::__assoc_state<opaqueCMSampleBuffer *>::set_value<opaqueCMSampleBuffer *>(v2, a2);
}

{
  uint64_t v2;

  v2 = *a1;
  if (!v2)
    std::__throw_future_error[abi:ne180100](3u);
  std::__assoc_state<opaqueCMSampleBuffer *>::set_value<opaqueCMSampleBuffer * const&>(v2, a2);
}

void std::__assoc_state<opaqueCMSampleBuffer *>::~__assoc_state(uint64_t a1)
{
  std::exception_ptr *v2;

  *(_QWORD *)a1 = MEMORY[0x24BEDB850] + 16;
  v2 = (std::exception_ptr *)(a1 + 16);
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 88));
  std::mutex::~mutex((std::mutex *)(a1 + 24));
  std::exception_ptr::~exception_ptr(v2);
  std::__shared_count::~__shared_count((std::__shared_count *)a1);
}

{
  std::exception_ptr *v2;

  *(_QWORD *)a1 = MEMORY[0x24BEDB850] + 16;
  v2 = (std::exception_ptr *)(a1 + 16);
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 88));
  std::mutex::~mutex((std::mutex *)(a1 + 24));
  std::exception_ptr::~exception_ptr(v2);
  std::__shared_count::~__shared_count((std::__shared_count *)a1);
  JUMPOUT(0x2276A1A98);
}

uint64_t std::__assoc_state<opaqueCMSampleBuffer *>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 8))(a1);
}

uint64_t *std::promise<opaqueCMSampleBuffer *>::~promise(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  const std::error_category *v4;
  unint64_t *v5;
  unint64_t v6;
  std::logic_error v8[2];
  std::exception_ptr v9;

  v2 = *a1;
  if (*a1)
  {
    if ((*(_BYTE *)(v2 + 136) & 1) == 0)
    {
      v9.__ptr_ = 0;
      v3 = *(_QWORD *)(v2 + 16);
      std::exception_ptr::~exception_ptr(&v9);
      v2 = *a1;
      if (!v3 && *(uint64_t *)(v2 + 8) >= 1)
      {
        v4 = std::future_category();
        MEMORY[0x2276A19D8](v8, 4, v4);
        std::make_exception_ptr[abi:ne180100]<std::future_error>(v8);
      }
    }
    v5 = (unint64_t *)(v2 + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
      (*(void (**)(uint64_t))(*(_QWORD *)v2 + 16))(v2);
  }
  return a1;
}

void std::make_exception_ptr[abi:ne180100]<std::future_error>(const std::logic_error *a1)
{
  std::logic_error *exception;
  std::logic_error *v3;

  exception = (std::logic_error *)__cxa_allocate_exception(0x20uLL);
  v3 = std::logic_error::logic_error(exception, a1);
  v3->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB810] + 16);
  v3[1] = a1[1];
  __cxa_throw(v3, MEMORY[0x24BEDB6E0], (void (*)(void *))MEMORY[0x24BEDAD80]);
}

void sub_2269F39C0(void *a1)
{
  __cxa_begin_catch(a1);
  std::current_exception();
  __cxa_end_catch();
}

void std::__throw_future_error[abi:ne180100](unsigned int a1)
{
  void *exception;
  const std::error_category *v3;

  exception = __cxa_allocate_exception(0x20uLL);
  v3 = std::future_category();
  MEMORY[0x2276A19D8](exception, a1, v3);
  __cxa_throw(exception, MEMORY[0x24BEDB6E0], (void (*)(void *))MEMORY[0x24BEDAD80]);
}

void sub_2269F3A28(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__assoc_sub_state::__attach_future[abi:ne180100](uint64_t a1)
{
  std::mutex *v2;
  int v3;
  unint64_t *v4;
  unint64_t v5;

  v2 = (std::mutex *)(a1 + 24);
  std::mutex::lock((std::mutex *)(a1 + 24));
  v3 = *(_DWORD *)(a1 + 136);
  if ((v3 & 2) != 0)
    std::__throw_future_error[abi:ne180100](1u);
  v4 = (unint64_t *)(a1 + 8);
  do
    v5 = __ldxr(v4);
  while (__stxr(v5 + 1, v4));
  *(_DWORD *)(a1 + 136) = v3 | 2;
  std::mutex::unlock(v2);
}

void sub_2269F3A98(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void std::__assoc_state<opaqueCMSampleBuffer *>::move(std::__assoc_sub_state *a1)
{
  void *ptr;
  std::exception_ptr v3;
  std::exception_ptr v4;
  std::exception_ptr v5;
  std::unique_lock<std::mutex> __lk;

  __lk.__m_ = &a1->__mut_;
  __lk.__owns_ = 1;
  std::mutex::lock(&a1->__mut_);
  std::__assoc_sub_state::__sub_wait(a1, &__lk);
  ptr = a1->__exception_.__ptr_;
  v5.__ptr_ = 0;
  std::exception_ptr::~exception_ptr(&v5);
  if (ptr)
  {
    std::exception_ptr::exception_ptr(&v4, &a1->__exception_);
    v3.__ptr_ = &v4;
    std::rethrow_exception(v3);
    __break(1u);
  }
  else if (__lk.__owns_)
  {
    std::mutex::unlock(__lk.__m_);
  }
}

void sub_2269F3B40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::mutex *a11, char a12)
{
  std::exception_ptr::~exception_ptr((std::exception_ptr *)&a9);
  if (a12)
    std::mutex::unlock(a11);
  _Unwind_Resume(a1);
}

void std::__assoc_state<opaqueCMSampleBuffer *>::set_value<opaqueCMSampleBuffer *>(uint64_t a1, _QWORD *a2)
{
  std::mutex *v4;
  uint64_t v5;
  std::exception_ptr v6;

  v4 = (std::mutex *)(a1 + 24);
  std::mutex::lock((std::mutex *)(a1 + 24));
  if ((*(_BYTE *)(a1 + 136) & 1) != 0
    || (v6.__ptr_ = 0, v5 = *(_QWORD *)(a1 + 16), std::exception_ptr::~exception_ptr(&v6), v5))
  {
    std::__throw_future_error[abi:ne180100](2u);
  }
  *(_QWORD *)(a1 + 144) = *a2;
  *(_DWORD *)(a1 + 136) |= 5u;
  std::condition_variable::notify_all((std::condition_variable *)(a1 + 88));
  std::mutex::unlock(v4);
}

void sub_2269F3BF8(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void std::__assoc_state<opaqueCMSampleBuffer *>::set_value<opaqueCMSampleBuffer * const&>(uint64_t a1, _QWORD *a2)
{
  std::mutex *v4;
  uint64_t v5;
  std::exception_ptr v6;

  v4 = (std::mutex *)(a1 + 24);
  std::mutex::lock((std::mutex *)(a1 + 24));
  if ((*(_BYTE *)(a1 + 136) & 1) != 0
    || (v6.__ptr_ = 0, v5 = *(_QWORD *)(a1 + 16), std::exception_ptr::~exception_ptr(&v6), v5))
  {
    std::__throw_future_error[abi:ne180100](2u);
  }
  *(_QWORD *)(a1 + 144) = *a2;
  *(_DWORD *)(a1 + 136) |= 5u;
  std::condition_variable::notify_all((std::condition_variable *)(a1 + 88));
  std::mutex::unlock(v4);
}

void sub_2269F3C98(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t useMirroredFrontCameraInStreamMode()
{
  if (useMirroredFrontCameraInStreamMode_onceToken != -1)
    dispatch_once(&useMirroredFrontCameraInStreamMode_onceToken, &__block_literal_global_23);
  return useMirroredFrontCameraInStreamMode_useMirroredFrontCameraInStreamMode;
}

void __useMirroredFrontCameraInStreamMode_block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("CFX_DEMO_UseMirroredFrontCameraInStreamMode"));
  v2 = (id)objc_claimAutoreleasedReturnValue();

  v1 = v2;
  if (v2)
  {
    useMirroredFrontCameraInStreamMode_useMirroredFrontCameraInStreamMode = objc_msgSend(v2, "BOOLValue");
    v1 = v2;
  }

}

uint64_t isDrawEffectsEditorBoundsEnabled()
{
  if (isDrawEffectsEditorBoundsEnabled_onceToken != -1)
    dispatch_once(&isDrawEffectsEditorBoundsEnabled_onceToken, &__block_literal_global_20);
  return isDrawEffectsEditorBoundsEnabled_drawEffectEditorBounds;
}

void __isDrawEffectsEditorBoundsEnabled_block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("CFX_DEBUG_DrawEffectEditorBounds"));
  v2 = (id)objc_claimAutoreleasedReturnValue();

  v1 = v2;
  if (v2)
  {
    isDrawEffectsEditorBoundsEnabled_drawEffectEditorBounds = objc_msgSend(v2, "BOOLValue");
    v1 = v2;
  }

}

uint64_t isShowPlayerScrubbingControlsEnabled()
{
  if (isShowPlayerScrubbingControlsEnabled_onceToken != -1)
    dispatch_once(&isShowPlayerScrubbingControlsEnabled_onceToken, &__block_literal_global_21);
  return isShowPlayerScrubbingControlsEnabled_s_showPlayerScrubControls;
}

void __isShowPlayerScrubbingControlsEnabled_block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("CFX_DEBUG_ShowPlayerScrubbingControls"));
  v2 = (id)objc_claimAutoreleasedReturnValue();

  v1 = v2;
  if (v2)
  {
    isShowPlayerScrubbingControlsEnabled_s_showPlayerScrubControls = objc_msgSend(v2, "BOOLValue");
    v1 = v2;
  }

}

id CFXAspectRatioCropOverride()
{
  if (CFXAspectRatioCropOverride_onceToken != -1)
    dispatch_once(&CFXAspectRatioCropOverride_onceToken, &__block_literal_global_22);
  return (id)CFXAspectRatioCropOverride_aspectRatioCropOverride;
}

id JFXAddShapeWithIdentifierNotificationUserInfoForEffectIdentifier(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("JFXAddShapeNotificationEffectIdentifierUserInfoKey");
  v6[0] = a1;
  v1 = (void *)MEMORY[0x24BDBCE70];
  v2 = a1;
  objc_msgSend(v1, "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id JFXAddEffectWithIdentifierNotificationUserInfoForEffectIdentifier(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("JFXAddEffectNotificationEffectIdentifierUserInfoKey");
  v6[0] = a1;
  v1 = (void *)MEMORY[0x24BDBCE70];
  v2 = a1;
  objc_msgSend(v1, "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id JFXAddEffectWithNameNotificationUserInfoForEffectName(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("JFXAddEffectNotificationEffectNameUserInfoKey");
  v6[0] = a1;
  v1 = (void *)MEMORY[0x24BDBCE70];
  v2 = a1;
  objc_msgSend(v1, "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id JFXAddAREffectWithIdentifierNotificationUserInfoForEffectIdentifier(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("JFXAddAREffectNotificationEffectIdentifierUserInfoKey");
  v8[1] = CFSTR("JFXAddAREffectNotificationReplayFilenameUserInfoKey");
  v9[0] = a1;
  v9[1] = a2;
  v3 = (void *)MEMORY[0x24BDBCE70];
  v4 = a2;
  v5 = a1;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id JFXAddPosterWithIdentifierNotificationUserInfoForPosterIdentifier(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("JFXAddPosterNotificationPosterIdentifierUserInfoKey");
  v6[0] = a1;
  v1 = (void *)MEMORY[0x24BDBCE70];
  v2 = a1;
  objc_msgSend(v1, "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id JFXAddPosterWithNameNotificationUserInfoForPosterName(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("JFXAddPosterNotificationPosterNameUserInfoKey");
  v6[0] = a1;
  v1 = (void *)MEMORY[0x24BDBCE70];
  v2 = a1;
  objc_msgSend(v1, "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id JFXRemoveEffectsNotificationUserInfoForEffectTypes(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("JFXRemoveEffectsNotificationEffectTypeIdentifiersUserInfoKey");
  v6[0] = a1;
  v1 = (void *)MEMORY[0x24BDBCE70];
  v2 = a1;
  objc_msgSend(v1, "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id JFXSetAnimojiNotificationUserInfoForEffect(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("JFXSetAnimojiNotificationEffectIdentifierUserInfoKey");
  v6[0] = a1;
  v1 = (void *)MEMORY[0x24BDBCE70];
  v2 = a1;
  objc_msgSend(v1, "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id JFXSetMemojiNotificationUserInfoForFile(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("JFXSetMemojiNotificationFileUserInfoKey");
  v6[0] = a1;
  v1 = (void *)MEMORY[0x24BDBCE70];
  v2 = a1;
  objc_msgSend(v1, "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id JFXSetFilterWithIdentifierNotificationUserInfoForEffect(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("JFXSetFilterNotificationEffectIdentifierUserInfoKey");
  v6[0] = a1;
  v1 = (void *)MEMORY[0x24BDBCE70];
  v2 = a1;
  objc_msgSend(v1, "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id JFXAddStickerNotificationUserInfo(void *a1, CGFloat a2, CGFloat a3, double a4, double a5)
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  _QWORD v18[5];
  CGPoint v19;

  v18[4] = *MEMORY[0x24BDAC8D0];
  v18[0] = a1;
  v17[0] = CFSTR("JFXAddStickerNotificationDataUserInfoKey");
  v17[1] = CFSTR("JFXAddStickerNotificationOffsetUserInfoKey");
  v9 = a1;
  v19.x = a2;
  v19.y = a3;
  NSStringFromCGPoint(v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  v17[2] = CFSTR("JFXAddStickerNotificationScaleUserInfoKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v12;
  v17[3] = CFSTR("JFXAddStickerNotificationRotationUserInfoKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id JFXAddStickerNotificationUserInfoForEffect(void *a1, CGFloat a2, CGFloat a3, double a4, double a5)
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  _QWORD v18[5];
  CGPoint v19;

  v18[4] = *MEMORY[0x24BDAC8D0];
  v18[0] = a1;
  v17[0] = CFSTR("JFXAddStickerNotificationEffectIdentifierUserInfoKey");
  v17[1] = CFSTR("JFXAddStickerNotificationOffsetUserInfoKey");
  v9 = a1;
  v19.x = a2;
  v19.y = a3;
  NSStringFromCGPoint(v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  v17[2] = CFSTR("JFXAddStickerNotificationScaleUserInfoKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v12;
  v17[3] = CFSTR("JFXAddStickerNotificationRotationUserInfoKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id JFXAddTextNotificationUserInfoForEffect(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("JFXAddTextNotificationEffectIdentifierUserInfoKey");
  v8[1] = CFSTR("JFXAddTextNotificationEffectStringUserInfoKey");
  v9[0] = a1;
  v9[1] = a2;
  v3 = (void *)MEMORY[0x24BDBCE70];
  v4 = a2;
  v5 = a1;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id JFXOpenProjectNotificationUserInfo(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("JFXOpenProjectIndexIdentifierUserInfoKey");
  v6[0] = a1;
  v1 = (void *)MEMORY[0x24BDBCE70];
  v2 = a1;
  objc_msgSend(v1, "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id JFXPlayClipAtIndexNotificationUserInfo(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("JFXPlayClipIndexIdentifierUserInfoKey");
  v6[0] = a1;
  v1 = (void *)MEMORY[0x24BDBCE70];
  v2 = a1;
  objc_msgSend(v1, "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id JFXRecordNotificationUserInfo(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("JFXRecordProjectIndexIdentifierUserInfoKey");
  v6[0] = a1;
  v1 = (void *)MEMORY[0x24BDBCE70];
  v2 = a1;
  objc_msgSend(v1, "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id JFXExportNotificationUserInfo(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("JFXExportProjectIndexIdentifierUserInfoKey");
  v8[1] = CFSTR("JFXExportAsMovieIdentifierUserInfoKey");
  v9[0] = a1;
  v9[1] = a2;
  v3 = (void *)MEMORY[0x24BDBCE70];
  v4 = a2;
  v5 = a1;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id JFXEffectsRequestNotificationUserInfoForEffectsType(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("JFXEffectsRequestNotificationUserInfoForEffectsTypeKey");
  v6[0] = a1;
  v1 = (void *)MEMORY[0x24BDBCE70];
  v2 = a1;
  objc_msgSend(v1, "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id JFXAspectRatioNotificationUserInfo(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("JFXAspectRatioRequestNotificationUserInfoKey");
  v6[0] = a1;
  v1 = (void *)MEMORY[0x24BDBCE70];
  v2 = a1;
  objc_msgSend(v1, "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id JFXAddShapeWithIdentifierNotificationGetEffectIdentifier(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("JFXAddShapeNotificationEffectIdentifierUserInfoKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id JFXAddEffectWithIdentifierNotificationGetEffectIdentifier(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("JFXAddEffectNotificationEffectIdentifierUserInfoKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id JFXAddEffectWithNameNotificationGetEffectName(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("JFXAddEffectNotificationEffectNameUserInfoKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id JFXAddAREffectWithIdentifierNotificationGetEffectIdentifier(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("JFXAddAREffectNotificationEffectIdentifierUserInfoKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id JFXAddAREffectWithIdentifierNotificationGetReplayFilename(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("JFXAddAREffectNotificationReplayFilenameUserInfoKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id JFXAddPosterWithIdentifierNotificationGetPosterIdentifier(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("JFXAddPosterNotificationPosterIdentifierUserInfoKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id JFXAddPosterWithNameNotificationGetPosterName(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("JFXAddPosterNotificationPosterNameUserInfoKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id JFXRemoveEffectsNotificationGetEffectTypeIdentifiers(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("JFXRemoveEffectsNotificationEffectTypeIdentifiersUserInfoKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id JFXSetAnimojiNotificationGetEffectIdentifier(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("JFXSetAnimojiNotificationEffectIdentifierUserInfoKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id JFXSetMemojiNotificationGetFile(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("JFXSetMemojiNotificationFileUserInfoKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id JFXSetFilterNotificationGetEffectIdentifier(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("JFXSetFilterNotificationEffectIdentifierUserInfoKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id JFXSetFilterNotificationGetEffectName(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("JFXSetFilterNotificationEffectNameUserInfoKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

double JFXAddStickerNotificationGetOffset(void *a1)
{
  void *v1;
  NSString *v2;
  double v3;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("JFXAddStickerNotificationOffsetUserInfoKey"));
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)&v3 = *(_OWORD *)&CGPointFromString(v2);
  return v3;
}

double JFXAddStickerNotificationGetRotation(void *a1)
{
  void *v1;
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("JFXAddStickerNotificationRotationUserInfoKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

double JFXAddStickerNotificationGetScale(void *a1)
{
  void *v1;
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("JFXAddStickerNotificationScaleUserInfoKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

id JFXAddStickerNotificationGetData(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("JFXAddStickerNotificationDataUserInfoKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id JFXAddStickerNotificationGetEffectIdentifier(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("JFXAddStickerNotificationEffectIdentifierUserInfoKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id JFXAddTextNotificationGetEffectIdentifier(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("JFXAddTextNotificationEffectIdentifierUserInfoKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id JFXAddTextNotificationGetEffectString(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("JFXAddTextNotificationEffectStringUserInfoKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id JFXOpenProjectGetProjectIndex(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("JFXOpenProjectIndexIdentifierUserInfoKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id JFXPlayGetClipIndex(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("JFXPlayClipIndexIdentifierUserInfoKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id JFXRecordGetDuration(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("JFXRecordProjectIndexIdentifierUserInfoKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id JFXExportGetProjectIndex(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("JFXExportProjectIndexIdentifierUserInfoKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id JFXExportGetAsMovie(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("JFXExportAsMovieIdentifierUserInfoKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id JFXEffectsRequestGetEffectsType(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("JFXEffectsRequestNotificationUserInfoForEffectsTypeKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id JFXGetAspectRatio(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("JFXAspectRatioRequestNotificationUserInfoKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_2269F85C8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2269F8624(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2269F8690(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2269F8718(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2269F8790(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2269F87EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_2269F884C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id stringForAspectRatio(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v3;
  void *v4;

  switch(a1)
  {
    case 0:
      objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("ASPECT_RATIO_9X16");
      break;
    case 1:
      objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("ASPECT_RATIO_3X4");
      break;
    case 2:
      objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("SQUARE");
      break;
    case 3:
      objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("ASPECT_RATIO_16X9");
      break;
    case 4:
      objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("ASPECT_RATIO_4X3");
      break;
    default:
      objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("ASPECT_RATIO_UNKNOWN");
      break;
  }
  objc_msgSend(v1, "localizedStringForKey:value:table:", v3, &stru_24EE5C428, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t aspectRatioForString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ASPECT_RATIO_9X16"), &stru_24EE5C428, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v1, "localizedStandardCompare:", v3);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ASPECT_RATIO_3X4"), &stru_24EE5C428, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v1, "localizedStandardCompare:", v6);
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SQUARE"), &stru_24EE5C428, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_msgSend(v1, "localizedStandardCompare:", v9);
      if (v10)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("ASPECT_RATIO_16X9"), &stru_24EE5C428, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = objc_msgSend(v1, "localizedStandardCompare:", v12);
        if (v13)
        {
          objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("ASPECT_RATIO_4X3"), &stru_24EE5C428, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = objc_msgSend(v1, "localizedStandardCompare:", v15);
          if (v16)
            v4 = 5;
          else
            v4 = 4;
        }
        else
        {
          v4 = 3;
        }
      }
      else
      {
        v4 = 2;
      }
    }
    else
    {
      v4 = 1;
    }
  }

  return v4;
}

double multiplierForAspectRatio(unint64_t a1)
{
  double result;

  result = 0.0;
  if (a1 <= 4)
    return dbl_226AB73A8[a1];
  return result;
}

double aspectRatioMultiplierForSize(double a1, double a2)
{
  return a1 / a2;
}

unint64_t aspectRatioForMultiplier(double a1)
{
  unint64_t result;
  double v2;

  for (result = 0; result != 5; ++result)
  {
    v2 = 0.0;
    if (result <= 4)
      v2 = dbl_226AB73A8[result];
    if (vabdd_f64(v2, a1) < 0.00000011920929)
      break;
  }
  return result;
}

unint64_t aspectRatioForSize(double a1, double a2)
{
  return aspectRatioForMultiplier(a1 / a2);
}

double sizeForAspectRatio(unint64_t a1)
{
  char *v1;

  v1 = (char *)&unk_226AB7358 + 8 * a1;
  if (a1 >= 5)
    v1 = (char *)MEMORY[0x24BDBF148];
  return *(double *)v1;
}

uint64_t PVViewContentModeFromAspectRatioPreservationMode(uint64_t a1)
{
  if (a1 == 2)
    return 1;
  else
    return 2 * (a1 == 1);
}

uint64_t aspectRatioPreservationModeFromPVViewContentMode(int a1)
{
  if (a1 == 1)
    return 2;
  else
    return a1 == 2;
}

double rectWithAspectRatioAndPreservationModeInRectWithSize(unint64_t a1, uint64_t a2, double a3, double a4)
{
  double v4;
  int v5;
  double v6;

  v4 = 0.0;
  if (a1 <= 4)
    v4 = dbl_226AB73A8[a1];
  v5 = 2 * (a2 == 1);
  if (a2 == 2)
    v5 = 1;
  if (v5)
  {
    if (v5 == 1)
    {
      if (a3 <= a4)
      {
        v6 = a4;
        if (a4 * v4 < a3)
          v6 = a3 / v4;
      }
      else
      {
        v6 = a3 / v4;
        if (a3 / v4 < a4)
          v6 = a4;
      }
    }
    else
    {
      if (v5 != 2)
        return (a3 - v4) * 0.5 + 0.0;
      v6 = a3 / v4;
      if (a3 / v4 > a4)
        v6 = a4;
    }
    v4 = v4 * v6;
  }
  else
  {
    v4 = a3;
  }
  return (a3 - v4) * 0.5 + 0.0;
}

unint64_t aspectRatioAdjustedForOrientation(unint64_t result, uint64_t a2)
{
  double v2;
  double v3;

  v2 = 607.5;
  switch(result)
  {
    case 0uLL:
      goto LABEL_6;
    case 1uLL:
      v2 = 810.0;
      goto LABEL_6;
    case 2uLL:
      return result;
    case 3uLL:
      v2 = 1920.0;
      goto LABEL_6;
    case 4uLL:
      v2 = 1440.0;
      goto LABEL_6;
    default:
      v2 = 0.0;
LABEL_6:
      if ((unint64_t)(a2 - 3) > 1)
      {
        if ((unint64_t)(a2 - 1) > 1)
        {
          v3 = 1080.0;
        }
        else
        {
          if (v2 >= 1080.0)
            v3 = v2;
          else
            v3 = 1080.0;
          v2 = fmin(v2, 1080.0);
        }
      }
      else
      {
        v3 = fmin(v2, 1080.0);
        if (v2 < 1080.0)
          v2 = 1080.0;
      }
      return aspectRatioForMultiplier(v2 / v3);
  }
}

BOOL aspectRatioIsLandscape(unint64_t a1)
{
  double v1;

  v1 = 0.0;
  if (a1 <= 4)
    v1 = dbl_226AB73A8[a1];
  return fabs(v1 + -1.0) >= 0.00000011920929 && v1 > 1.0;
}

BOOL aspectRatioIsPortrait(unint64_t a1)
{
  double v1;

  v1 = 0.0;
  if (a1 <= 4)
    v1 = dbl_226AB73A8[a1];
  return fabs(v1 + -1.0) < 0.00000011920929 || v1 < 1.0;
}

uint64_t complementaryAspectRatio(unint64_t a1)
{
  if (a1 > 4)
    return 2;
  else
    return qword_226AB73D0[a1];
}

void sub_2269F9334(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2269F983C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2269F98B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_226A00350(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226A01AFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void sub_226A01F2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226A03E4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226A07684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

void sub_226A07D68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226A07E94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226A08058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226A08180(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226A082D4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_226A083EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226A08594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226A08944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{

}

void sub_226A08ADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226A08C30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226A09110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226A0938C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226A097FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226A09954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CMTime *CMTimeMakeWithARFrameTimestamp@<X0>(CMTime *a1@<X8>, Float64 a2@<D0>)
{
  return CMTimeMakeWithSeconds(a1, a2, 1000000000);
}

void sub_226A0B844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12(uint64_t a1)
{

}

uint64_t isFaceTrackingEnabledOnBackCamera()
{
  if (isFaceTrackingEnabledOnBackCamera_onceToken != -1)
    dispatch_once(&isFaceTrackingEnabledOnBackCamera_onceToken, &__block_literal_global_35);
  return isFaceTrackingEnabledOnBackCamera_result;
}

void __isFaceTrackingEnabledOnBackCamera_block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("JFX_EnableFaceTrackingBackCamera"));
  v2 = (id)objc_claimAutoreleasedReturnValue();

  v1 = v2;
  if (v2)
  {
    isFaceTrackingEnabledOnBackCamera_result = objc_msgSend(v2, "BOOLValue");
    v1 = v2;
  }

}

uint64_t JFX_isDrawInstructionGraphNodesEnabled()
{
  if (JFX_isDrawInstructionGraphNodesEnabled_onceToken != -1)
    dispatch_once(&JFX_isDrawInstructionGraphNodesEnabled_onceToken, &__block_literal_global_40);
  return JFX_isDrawInstructionGraphNodesEnabled_enabled;
}

uint64_t JFX_isShowHDRBadgeInPreviewEnabled()
{
  if (JFX_isShowHDRBadgeInPreviewEnabled_onceToken != -1)
    dispatch_once(&JFX_isShowHDRBadgeInPreviewEnabled_onceToken, &__block_literal_global_41);
  return JFX_isShowHDRBadgeInPreviewEnabled_showHDRBadgeInPreview;
}

uint64_t JFX_isDrawOverlayBoundsEnabled()
{
  if (JFX_isDrawOverlayBoundsEnabled_onceToken != -1)
    dispatch_once(&JFX_isDrawOverlayBoundsEnabled_onceToken, &__block_literal_global_42);
  return JFX_isDrawOverlayBoundsEnabled_drawOverlayBounds;
}

id JFX_getDrawOverlayBoundsOptionsDictionary()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (JFX_isDrawOverlayBoundsEnabled_onceToken != -1)
    dispatch_once(&JFX_isDrawOverlayBoundsEnabled_onceToken, &__block_literal_global_42);
  if (JFX_isDrawOverlayBoundsEnabled_drawOverlayBounds)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 11);
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    JFX_isDrawOverlayBoundsOptionShowDocumentBoundingBoxEnabled();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (v1)
      objc_msgSend(v0, "setObject:forKeyedSubscript:", v1, CFSTR("JFX_DEBUG_DrawOverlayBoundsOptionShowDocumentBoundingBox"));

    JFX_isDrawOverlayBoundsOptionShowObjectAlignedBoundingBoxEnabled();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
      objc_msgSend(v0, "setObject:forKeyedSubscript:", v2, CFSTR("JFX_DEBUG_DrawOverlayBoundsOptionShowObjectAlignedBoundingBox"));

    JFX_isDrawOverlayBoundsOptionShowTextBoundingBoxesEnabled();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_msgSend(v0, "setObject:forKeyedSubscript:", v3, CFSTR("JFX_DEBUG_DrawOverlayBoundsOptionShowTextBoundingBoxes"));

    JFX_isDrawOverlayBoundsOptionShowHitAreaBoundingBoxEnabled();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(v0, "setObject:forKeyedSubscript:", v4, CFSTR("JFX_DEBUG_DrawOverlayBoundsOptionShowHitAreaBoundingBox"));

    JFX_isDrawOverlayBoundsOptionShowFaceRectEnabled();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v0, "setObject:forKeyedSubscript:", v5, CFSTR("JFX_DEBUG_DrawOverlayBoundsOptionShowFaceRect"));

    JFX_isDrawOverlayBoundsOptionShowTapPointsEnabled();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v0, "setObject:forKeyedSubscript:", v6, CFSTR("JFX_DEBUG_DrawOverlayBoundsOptionShowTapPoints"));

    JFX_isDrawOverlayBoundsOptionShowCornerPointsEnabled();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v0, "setObject:forKeyedSubscript:", v7, CFSTR("JFX_DEBUG_DrawOverlayBoundsOptionShowCornerPoints"));

    JFX_isDrawOverlayBoundsOptionShowTextCornerPointsEnabled();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v0, "setObject:forKeyedSubscript:", v8, CFSTR("JFX_DEBUG_DrawOverlayBoundsOptionShowTextCornerPoints"));

    JFX_isDrawOverlayBoundsOptionShowHitAreaPointsEnabled();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v0, "setObject:forKeyedSubscript:", v9, CFSTR("JFX_DEBUG_DrawOverlayBoundsOptionShowHitAreaPoints"));

    JFX_isDrawOverlayBoundsOptionShowAdditionalRectsEnabled();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v0, "setObject:forKeyedSubscript:", v10, CFSTR("JFX_DEBUG_DrawOverlayBoundsOptionShowAdditionalRects"));

  }
  else
  {
    v0 = 0;
  }
  return v0;
}

id JFX_isDrawOverlayBoundsOptionShowDocumentBoundingBoxEnabled()
{
  if (JFX_isDrawOverlayBoundsOptionShowDocumentBoundingBoxEnabled_onceToken != -1)
    dispatch_once(&JFX_isDrawOverlayBoundsOptionShowDocumentBoundingBoxEnabled_onceToken, &__block_literal_global_44);
  return (id)JFX_isDrawOverlayBoundsOptionShowDocumentBoundingBoxEnabled_n;
}

id JFX_isDrawOverlayBoundsOptionShowObjectAlignedBoundingBoxEnabled()
{
  if (JFX_isDrawOverlayBoundsOptionShowObjectAlignedBoundingBoxEnabled_onceToken != -1)
    dispatch_once(&JFX_isDrawOverlayBoundsOptionShowObjectAlignedBoundingBoxEnabled_onceToken, &__block_literal_global_45);
  return (id)JFX_isDrawOverlayBoundsOptionShowObjectAlignedBoundingBoxEnabled_n;
}

id JFX_isDrawOverlayBoundsOptionShowTextBoundingBoxesEnabled()
{
  if (JFX_isDrawOverlayBoundsOptionShowTextBoundingBoxesEnabled_onceToken != -1)
    dispatch_once(&JFX_isDrawOverlayBoundsOptionShowTextBoundingBoxesEnabled_onceToken, &__block_literal_global_46);
  return (id)JFX_isDrawOverlayBoundsOptionShowTextBoundingBoxesEnabled_n;
}

id JFX_isDrawOverlayBoundsOptionShowHitAreaBoundingBoxEnabled()
{
  if (JFX_isDrawOverlayBoundsOptionShowHitAreaBoundingBoxEnabled_onceToken != -1)
    dispatch_once(&JFX_isDrawOverlayBoundsOptionShowHitAreaBoundingBoxEnabled_onceToken, &__block_literal_global_47);
  return (id)JFX_isDrawOverlayBoundsOptionShowHitAreaBoundingBoxEnabled_n;
}

id JFX_isDrawOverlayBoundsOptionShowFaceRectEnabled()
{
  if (JFX_isDrawOverlayBoundsOptionShowFaceRectEnabled_onceToken != -1)
    dispatch_once(&JFX_isDrawOverlayBoundsOptionShowFaceRectEnabled_onceToken, &__block_literal_global_48_0);
  return (id)JFX_isDrawOverlayBoundsOptionShowFaceRectEnabled_n;
}

id JFX_isDrawOverlayBoundsOptionShowTapPointsEnabled()
{
  if (JFX_isDrawOverlayBoundsOptionShowTapPointsEnabled_onceToken != -1)
    dispatch_once(&JFX_isDrawOverlayBoundsOptionShowTapPointsEnabled_onceToken, &__block_literal_global_49);
  return (id)JFX_isDrawOverlayBoundsOptionShowTapPointsEnabled_n;
}

id JFX_isDrawOverlayBoundsOptionShowCornerPointsEnabled()
{
  if (JFX_isDrawOverlayBoundsOptionShowCornerPointsEnabled_onceToken != -1)
    dispatch_once(&JFX_isDrawOverlayBoundsOptionShowCornerPointsEnabled_onceToken, &__block_literal_global_50);
  return (id)JFX_isDrawOverlayBoundsOptionShowCornerPointsEnabled_n;
}

id JFX_isDrawOverlayBoundsOptionShowTextCornerPointsEnabled()
{
  if (JFX_isDrawOverlayBoundsOptionShowTextCornerPointsEnabled_onceToken != -1)
    dispatch_once(&JFX_isDrawOverlayBoundsOptionShowTextCornerPointsEnabled_onceToken, &__block_literal_global_51);
  return (id)JFX_isDrawOverlayBoundsOptionShowTextCornerPointsEnabled_n;
}

id JFX_isDrawOverlayBoundsOptionShowHitAreaPointsEnabled()
{
  if (JFX_isDrawOverlayBoundsOptionShowHitAreaPointsEnabled_onceToken != -1)
    dispatch_once(&JFX_isDrawOverlayBoundsOptionShowHitAreaPointsEnabled_onceToken, &__block_literal_global_52);
  return (id)JFX_isDrawOverlayBoundsOptionShowHitAreaPointsEnabled_n;
}

id JFX_isDrawOverlayBoundsOptionShowAdditionalRectsEnabled()
{
  if (JFX_isDrawOverlayBoundsOptionShowAdditionalRectsEnabled_onceToken != -1)
    dispatch_once(&JFX_isDrawOverlayBoundsOptionShowAdditionalRectsEnabled_onceToken, &__block_literal_global_53);
  return (id)JFX_isDrawOverlayBoundsOptionShowAdditionalRectsEnabled_n;
}

void sub_226A179D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a49, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13(uint64_t a1)
{

}

void sub_226A19274(_Unwind_Exception *exception_object, int a2)
{
  uint64_t v2;
  id v3;
  NSObject *v4;
  void *v5;

  if (a2 == 1)
  {
    v3 = objc_begin_catch(exception_object);
    JFXLog_playback();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "description");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[JFXCompositionTrackGroup commitVolumeRampFromStartVolume:toEndVolume:timeRange:].cold.1(v5, (uint8_t *)(v2 - 176), v4);
    }

    objc_end_catch();
    JUMPOUT(0x226A18FA0);
  }
  _Unwind_Resume(exception_object);
}

void OUTLINED_FUNCTION_0_6(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_226A1A1C0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void sub_226A1BBD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226A1BCDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226A1BDDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226A1BEEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14(uint64_t a1)
{

}

id CoreGraphicsSerializationQueue()
{
  if (CoreGraphicsSerializationQueue_onceToken != -1)
    dispatch_once(&CoreGraphicsSerializationQueue_onceToken, &__block_literal_global_39);
  return (id)CoreGraphicsSerializationQueue_sCGSerializationQueue;
}

void compositeCGImageRefInRect(CGImage *a1, CGBlendMode a2, CGFloat a3, double a4, double a5, double a6, CGFloat a7, CGFloat a8, CGFloat a9, CGFloat a10, float a11)
{
  CGContext *CurrentContext;
  CGRect v28;
  CGRect v29;

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  CGContextSetBlendMode(CurrentContext, a2);
  CGContextSetAlpha(CurrentContext, a11);
  CGContextTranslateCTM(CurrentContext, a3, a4 + a6);
  CGContextScaleCTM(CurrentContext, a5 / a9, -a6 / a10);
  v28.origin.x = a7;
  v28.origin.y = a8;
  v28.size.width = a9;
  v28.size.height = a10;
  v29 = CGRectOffset(v28, -a7, -a8);
  CGContextDrawImage(CurrentContext, v29, a1);
  CGContextRestoreGState(CurrentContext);
}

void sub_226A1D738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226A1D930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__15(uint64_t a1)
{

}

void sub_226A1DCD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226A1DF2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void JFX_getFrontAndBackCameras(unint64_t a1, unint64_t a2)
{
  if (JFX_getFrontAndBackCameras_onceToken != -1)
    dispatch_once(&JFX_getFrontAndBackCameras_onceToken, &__block_literal_global_632);
  if (a1 | a2)
  {
    dispatch_group_wait((dispatch_group_t)JFX_getFrontAndBackCameras_s_group, 0xFFFFFFFFFFFFFFFFLL);
    if (a1)
      *(_QWORD *)a1 = objc_retainAutorelease((id)JFX_getFrontAndBackCameras_s_frontCamera);
    if (a2)
      *(_QWORD *)a2 = objc_retainAutorelease((id)JFX_getFrontAndBackCameras_s_backCamera);
  }
}

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16(uint64_t a1)
{

}

void JFX_configureCaptureDevice(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, id);
  int v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;

  v3 = a1;
  v4 = a2;
  v9 = 0;
  v5 = objc_msgSend(v3, "lockForConfiguration:", &v9);
  v6 = v9;
  v7 = v6;
  if (!v5 || v6)
  {
    JFXLog_DebugCamera();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      JFX_configureCaptureDevice_cold_1(v5, (uint64_t)v7, v8);

  }
  else
  {
    v4[2](v4, v3);
    objc_msgSend(v3, "unlockForConfiguration");
  }

}

void JFX_configureCaptureSession(void *a1, void *a2)
{
  void (**v3)(id, id);
  id v4;

  v3 = a2;
  v4 = a1;
  objc_msgSend(v4, "beginConfiguration");
  v3[2](v3, v4);

  objc_msgSend(v4, "commitConfiguration");
}

void sub_226A234E8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_226A25D0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  uint64_t v33;

  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t JFX_adjustFaceAnchorCaptureInterfaceOrientationForDevice(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  BOOL v5;

  if (JFX_adjustFaceAnchorCaptureInterfaceOrientationForDevice_onceToken != -1)
    dispatch_once(&JFX_adjustFaceAnchorCaptureInterfaceOrientationForDevice_onceToken, &__block_literal_global_637);
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");
  v4 = JFX_adjustFaceAnchorCaptureInterfaceOrientationForDevice_s_isStreamingMode;

  if (v4)
    v5 = v3 == 1;
  else
    v5 = 0;
  if (v5)
    return 1;
  else
    return a1;
}

void sub_226A273D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void JFX_logCameraIntrinsics(simd_float3x3 a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  double v9;
  double v10;
  NSObject *v11;
  NSObject *v12;

  pv_focal_length_from_intrinsics(a1);
  v2 = v1;
  pv_principal_point_from_intrinsics(a1);
  v4 = v3;
  JFXLog_DebugFaceAnchor();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    JFX_logCameraIntrinsics_cold_6();

  JFXLog_DebugFaceAnchor();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    JFX_logCameraIntrinsics_cold_5(v2);

  JFXLog_DebugFaceAnchor();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    JFX_logCameraIntrinsics_cold_4();

  JFXLog_DebugFaceAnchor();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    JFX_logCameraIntrinsics_cold_3(v4);

  pv_resolution_from_principal_point();
  pv_fov_from_intrinsics();
  v10 = v9;
  JFXLog_DebugFaceAnchor();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    JFX_logCameraIntrinsics_cold_2(v10);

  JFXLog_DebugFaceAnchor();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    JFX_logCameraIntrinsics_cold_1(v10);

}

void sub_226A29030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_226A29DB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226A2A190(void *a1)
{
  objc_begin_catch(a1);
  objc_end_catch();
  JUMPOUT(0x226A2A080);
}

void sub_226A2B52C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  void *v15;

  objc_sync_exit(v15);
  _Unwind_Resume(a1);
}

void JFXDistanceTransformEuclidean(uint64_t a1, uint64_t a2, unsigned int a3, signed int a4, char a5)
{
  uint64_t v5;
  uint64_t v9;
  _DWORD *v10;
  _DWORD *v11;
  unint64_t v12;
  uint64x2_t v13;
  int v14;
  int32x2_t v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  int v19;
  uint64_t v21;
  _QWORD v23[7];
  unsigned int v24;
  int v25;
  int v26;
  _QWORD v27[6];
  int v28;
  int v29;
  unsigned int v30;
  char v31;
  _QWORD block[6];
  int v33;
  int v34;
  unsigned int v35;
  char v36;

  if (a4 <= (int)a3)
    v5 = a3;
  else
    v5 = a4;
  if ((a4 & 3) != 0)
    JFXDistanceTransformEuclidean_cold_2();
  if (-858993459 * a3 + 429496729 >= 0x33333333)
    JFXDistanceTransformEuclidean_cold_1();
  v21 = operator new[]();
  v9 = operator new[]();
  v10 = (_DWORD *)operator new[]();
  v11 = v10;
  *v10 = 0;
  if ((int)v5 >= 2)
  {
    v12 = 0;
    v13 = (uint64x2_t)vdupq_n_s64(v5 - 2);
    v14 = 2;
    do
    {
      v15 = vmovn_s64((int64x2_t)vcgeq_u64(v13, (uint64x2_t)vorrq_s8((int8x16_t)vdupq_n_s64(v12), (int8x16_t)xmmword_226AB7610)));
      if ((v15.i8[0] & 1) != 0)
        *(float *)&v10[v12 + 1] = 1.0 / (float)v14;
      if ((v15.i8[4] & 1) != 0)
        *(float *)&v10[v12 + 2] = 1.0 / (float)(v14 + 2);
      v12 += 2;
      v14 += 4;
    }
    while ((v5 & 0xFFFFFFFE) != v12);
  }
  dispatch_get_global_queue(0, 0);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = dispatch_group_create();
  block[0] = MEMORY[0x24BDAC760];
  v19 = v5;
  v18 = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __JFXDistanceTransformEuclidean_block_invoke;
  block[3] = &__block_descriptor_61_e5_v8__0l;
  block[4] = a1;
  block[5] = v9;
  v33 = a4 % 40;
  v34 = a4;
  v35 = a3;
  v36 = a5;
  dispatch_group_async(v17, v16, block);
  v27[0] = v18;
  v27[1] = 3221225472;
  v27[2] = __JFXDistanceTransformEuclidean_block_invoke_2;
  v27[3] = &__block_descriptor_61_e8_v16__0Q8l;
  v28 = a4 % 40;
  v29 = a4;
  v27[4] = a1;
  v27[5] = v9;
  v30 = a3;
  v31 = a5;
  dispatch_apply(5uLL, v16, v27);
  dispatch_group_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
  v23[0] = v18;
  v23[1] = 3221225472;
  v23[2] = __JFXDistanceTransformEuclidean_block_invoke_3;
  v23[3] = &__block_descriptor_68_e8_v16__0Q8l;
  v24 = a3;
  v25 = v19;
  v26 = a4;
  v23[4] = v9;
  v23[5] = v11;
  v23[6] = a2;
  dispatch_apply(5uLL, v16, v23);
  MEMORY[0x2276A1A80](v11, 0x1000C8052888210);
  MEMORY[0x2276A1A80](v21, 0x1000C8052888210);
  MEMORY[0x2276A1A80](v9, 0x1000C8052888210);

}

uint64_t distancesForWColumns<(SIMDWidth)8>(uint64_t result, int a2, uint64_t a3, int a4, unsigned int a5, int a6)
{
  int8x8_t v6;
  int32x4_t v7;
  int8x8_t *v8;
  int32x4_t *v9;
  int32x4_t v10;
  uint64_t v11;
  int32x4_t v12;
  int32x4_t v13;
  int16x8_t v14;
  unint64_t v15;
  uint64_t v16;
  int8x8_t *v17;
  int32x4_t *v18;
  int32x4_t v19;
  int32x4_t v20;
  int16x8_t v21;
  int32x4_t v22;
  int32x4_t v23;

  if ((int)a5 >= 1)
  {
    v6 = vdup_n_s8(a6 << 31 >> 31);
    v7 = vdupq_n_s32(a5);
    v8 = (int8x8_t *)(result + a2);
    v9 = (int32x4_t *)(a3 + 4 * a2);
    v10.i64[0] = 0x100000001;
    v10.i64[1] = 0x100000001;
    v11 = a5;
    v12 = v7;
    v13 = v7;
    do
    {
      v14 = vmovl_s8(vceq_s8(*v8, v6));
      v12 = (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v12, v10), (int8x16_t)vmovl_s16(*(int16x4_t *)v14.i8));
      v13 = (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v13, v10), (int8x16_t)vmovl_high_s16(v14));
      *v9 = v12;
      v9[1] = v13;
      v8 = (int8x8_t *)((char *)v8 + a4);
      v9 = (int32x4_t *)((char *)v9 + 4 * a4);
      --v11;
    }
    while (v11);
    v15 = a5 + 1;
    v16 = (a5 - 1) * a4;
    v17 = (int8x8_t *)(result + a2 + v16);
    v18 = (int32x4_t *)(a3 + 4 * v16 + 4 * a2);
    v19.i64[0] = 0x100000001;
    v19.i64[1] = 0x100000001;
    v20 = v7;
    do
    {
      v21 = vmovl_s8(vceq_s8(*v17, v6));
      v7 = (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v7, v19), (int8x16_t)vmovl_s16(*(int16x4_t *)v21.i8));
      v20 = (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v20, v19), (int8x16_t)vmovl_high_s16(v21));
      v22 = vminq_s32(v18[1], v20);
      v23 = vminq_s32(*v18, v7);
      *v18 = vmulq_s32(v23, v23);
      v18[1] = vmulq_s32(v22, v22);
      --v15;
      v17 = (int8x8_t *)((char *)v17 - a4);
      v18 = (int32x4_t *)((char *)v18 - 4 * a4);
    }
    while (v15 > 1);
  }
  return result;
}

void sub_226A2D8F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17(uint64_t a1)
{

}

const __CFString *NSStringFromJFXEffectType(int a1)
{
  if ((a1 - 1) > 7)
    return CFSTR("None");
  else
    return off_24EE5A8F8[a1 - 1];
}

uint64_t effectTypesIncompatibleWithType(int a1)
{
  if ((a1 - 1) > 7)
    return MEMORY[0x24BDBD1A8];
  else
    return qword_24EE5A938[a1 - 1];
}

BOOL isAddedMediaCompatibleWithEffectType(int a1, uint64_t a2)
{
  if ((a1 - 1) < 2)
    return 1;
  if (a1 != 7)
    return a1 == 5;
  return a2;
}

BOOL isPosterCompatibleWithEffectType(int a1)
{
  return a1 == 2 || a1 == 5;
}

BOOL isCameraStillCompatibleWithEffectType(int a1)
{
  return a1 != 8 && a1 != 6;
}

void sub_226A336E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_226A33734(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_226A337A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_226A33838(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_226A339BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_226A33AF8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_226A33EF8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_226A34F60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void SetError(_QWORD *a1, void *a2, uint64_t a3, void *a4)
{
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v13 = *MEMORY[0x24BDD0FC8];
    v14[0] = a4;
    v8 = (void *)MEMORY[0x24BDBCE70];
    v9 = a4;
    v10 = a2;
    objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v10, a3, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    *a1 = v12;
  }
}

id BrightnessIdentifier()
{
  if (BrightnessIdentifier_onceToken != -1)
    dispatch_once(&BrightnessIdentifier_onceToken, &__block_literal_global_305);
  return (id)BrightnessIdentifier_s_brightnessIdentifier;
}

void sub_226A3A3A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__18(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18(uint64_t a1)
{

}

void sub_226A3A86C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

__n128 OUTLINED_FUNCTION_2_2(uint64_t a1)
{
  return *(__n128 *)a1;
}

Float64 OUTLINED_FUNCTION_7@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>, __int128 a3, uint64_t a4, uint64_t a5)
{
  a5 = a2;
  a3 = *(_OWORD *)a1;
  a4 = *(_QWORD *)(a1 + 16);
  return CMTimeGetSeconds((CMTime *)&a3);
}

double CFXAspectRatioForAspectRatioCrop(uint64_t a1)
{
  double result;

  result = 1.33333333;
  if (a1 == 2)
    result = 1.0;
  if (a1 == 1)
    return 1.77777778;
  return result;
}

uint64_t CFXCanonicalAspectRatioCropForCaptureModeAndDesiredAspectRatioCrop(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;

  if (a1)
    return 0;
  v2 = a2;
  CFXAspectRatioCropOverride();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v2 = objc_msgSend(v3, "integerValue");

  return v2;
}

uint64_t CFXPreviewAspectRatioForAspectRatioCrop(uint64_t a1)
{
  uint64_t v1;

  v1 = 3;
  if (a1 != 2)
    v1 = 0;
  if (a1 == 1)
    return 1;
  else
    return v1;
}

uint64_t JFXCameraModeForCaptureModeAndAspectRatioCrop(uint64_t a1, uint64_t a2)
{
  int IsCTMSupported;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;

  if (a1 == 2)
  {
    if ((JFXLowResolutionDevice() & 1) != 0)
    {
      v5 = 2;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE14A80], "preferences");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "videoConfiguration");

      if (v7 == 6)
        v5 = 2;
      else
        v5 = 3;
    }
    if (CFXCaptureCapabilitiesIsHDRSupported())
    {
      objc_msgSend(MEMORY[0x24BE14A80], "preferences");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "HDR10BitVideoEnabled");

      v10 = 4;
      if (v5 != 2)
        v10 = 5;
      if (v9)
        return v10;
    }
  }
  else if (a1)
  {
    return 0;
  }
  else
  {
    IsCTMSupported = CFXCaptureCapabilitiesIsCTMSupported();
    v4 = 6;
    if (a2 == 2)
      v4 = 9;
    if (a2 == 1)
      v4 = 8;
    if (IsCTMSupported)
      return v4;
    else
      return 1;
  }
  return v5;
}

const __CFString *NSStringFromCFXAspectRatioCrop(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("None (4:3)");
  if (a1 == 2)
    v1 = CFSTR("1:1");
  if (a1 == 1)
    return CFSTR("16:9");
  else
    return v1;
}

BOOL isStreamingMode(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

id JFXLog_animoji()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_animoji_logObj;
  v1[5] = "animoji";
  if (JFXLog_animoji_onceToken != -1)
    dispatch_once(&JFXLog_animoji_onceToken, v1);
  return (id)JFXLog_animoji_logObj;
}

id JFXLog_camera()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_camera_logObj;
  v1[5] = "camera";
  if (JFXLog_camera_onceToken != -1)
    dispatch_once(&JFXLog_camera_onceToken, v1);
  return (id)JFXLog_camera_logObj;
}

id JFXLog_clip()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_clip_logObj;
  v1[5] = "clip";
  if (JFXLog_clip_onceToken != -1)
    dispatch_once(&JFXLog_clip_onceToken, v1);
  return (id)JFXLog_clip_logObj;
}

id JFXLog_composition()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_composition_logObj;
  v1[5] = "composition";
  if (JFXLog_composition_onceToken != -1)
    dispatch_once(&JFXLog_composition_onceToken, v1);
  return (id)JFXLog_composition_logObj;
}

id JFXLog_compositionAudio()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_compositionAudio_logObj;
  v1[5] = "compositionAudio";
  if (JFXLog_compositionAudio_onceToken != -1)
    dispatch_once(&JFXLog_compositionAudio_onceToken, v1);
  return (id)JFXLog_compositionAudio_logObj;
}

id JFXLog_core()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_core_logObj;
  v1[5] = "core";
  if (JFXLog_core_onceToken != -1)
    dispatch_once(&JFXLog_core_onceToken, v1);
  return (id)JFXLog_core_logObj;
}

id JFXLog_depthCodec()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_depthCodec_logObj;
  v1[5] = "depthCodec";
  if (JFXLog_depthCodec_onceToken != -1)
    dispatch_once(&JFXLog_depthCodec_onceToken, v1);
  return (id)JFXLog_depthCodec_logObj;
}

id JFXLog_effectAssetDownloading()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_effectAssetDownloading_logObj;
  v1[5] = "effectAssetDownloading";
  if (JFXLog_effectAssetDownloading_onceToken != -1)
    dispatch_once(&JFXLog_effectAssetDownloading_onceToken, v1);
  return (id)JFXLog_effectAssetDownloading_logObj;
}

id JFXLog_effects()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_effects_logObj;
  v1[5] = "effects";
  if (JFXLog_effects_onceToken != -1)
    dispatch_once(&JFXLog_effects_onceToken, v1);
  return (id)JFXLog_effects_logObj;
}

id JFXLog_export()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_export_logObj;
  v1[5] = "export";
  if (JFXLog_export_onceToken != -1)
    dispatch_once(&JFXLog_export_onceToken, v1);
  return (id)JFXLog_export_logObj;
}

id JFXLog_facetracking()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_facetracking_logObj;
  v1[5] = "facetracking";
  if (JFXLog_facetracking_onceToken != -1)
    dispatch_once(&JFXLog_facetracking_onceToken, v1);
  return (id)JFXLog_facetracking_logObj;
}

id JFXLog_file()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_file_logObj;
  v1[5] = "file";
  if (JFXLog_file_onceToken != -1)
    dispatch_once(&JFXLog_file_onceToken, v1);
  return (id)JFXLog_file_logObj;
}

id JFXLog_pickerUI()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_pickerUI_logObj;
  v1[5] = "pickerUI";
  if (JFXLog_pickerUI_onceToken != -1)
    dispatch_once(&JFXLog_pickerUI_onceToken, v1);
  return (id)JFXLog_pickerUI_logObj;
}

id JFXLog_playback()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_playback_logObj;
  v1[5] = "playback";
  if (JFXLog_playback_onceToken != -1)
    dispatch_once(&JFXLog_playback_onceToken, v1);
  return (id)JFXLog_playback_logObj;
}

id JFXLog_matting()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_matting_logObj;
  v1[5] = "matting";
  if (JFXLog_matting_onceToken != -1)
    dispatch_once(&JFXLog_matting_onceToken, v1);
  return (id)JFXLog_matting_logObj;
}

id JFXLog_metadata()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_metadata_logObj;
  v1[5] = "metadata";
  if (JFXLog_metadata_onceToken != -1)
    dispatch_once(&JFXLog_metadata_onceToken, v1);
  return (id)JFXLog_metadata_logObj;
}

id JFXLog_mediaDataReader()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_mediaDataReader_logObj;
  v1[5] = "mediaDataReader";
  if (JFXLog_mediaDataReader_onceToken != -1)
    dispatch_once(&JFXLog_mediaDataReader_onceToken, v1);
  return (id)JFXLog_mediaDataReader_logObj;
}

id JFXLog_model()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_model_logObj;
  v1[5] = "model";
  if (JFXLog_model_onceToken != -1)
    dispatch_once(&JFXLog_model_onceToken, v1);
  return (id)JFXLog_model_logObj;
}

id JFXLog_modelAssetManagement()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_modelAssetManagement_logObj;
  v1[5] = "modelAssetManagement";
  if (JFXLog_modelAssetManagement_onceToken != -1)
    dispatch_once(&JFXLog_modelAssetManagement_onceToken, v1);
  return (id)JFXLog_modelAssetManagement_logObj;
}

id JFXLog_thermals()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_thermals_logObj;
  v1[5] = "thermals";
  if (JFXLog_thermals_onceToken != -1)
    dispatch_once(&JFXLog_thermals_onceToken, v1);
  return (id)JFXLog_thermals_logObj;
}

id JFXLog_viewerUI()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_viewerUI_logObj;
  v1[5] = "viewerUI";
  if (JFXLog_viewerUI_onceToken != -1)
    dispatch_once(&JFXLog_viewerUI_onceToken, v1);
  return (id)JFXLog_viewerUI_logObj;
}

id JFXLog_writer()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_writer_logObj;
  v1[5] = "writer";
  if (JFXLog_writer_onceToken != -1)
    dispatch_once(&JFXLog_writer_onceToken, v1);
  return (id)JFXLog_writer_logObj;
}

id JFXLog_DebugAnalytics()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_DebugAnalytics_logObj;
  v1[5] = "DebugAnalytics";
  if (JFXLog_DebugAnalytics_onceToken != -1)
    dispatch_once(&JFXLog_DebugAnalytics_onceToken, v1);
  return (id)JFXLog_DebugAnalytics_logObj;
}

id JFXLog_DebugAnimoji()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_DebugAnimoji_logObj;
  v1[5] = "DebugAnimoji";
  if (JFXLog_DebugAnimoji_onceToken != -1)
    dispatch_once(&JFXLog_DebugAnimoji_onceToken, v1);
  return (id)JFXLog_DebugAnimoji_logObj;
}

id JFXLog_DebugAnimojiPlayback()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_DebugAnimojiPlayback_logObj;
  v1[5] = "DebugAnimojiPlayback";
  if (JFXLog_DebugAnimojiPlayback_onceToken != -1)
    dispatch_once(&JFXLog_DebugAnimojiPlayback_onceToken, v1);
  return (id)JFXLog_DebugAnimojiPlayback_logObj;
}

id JFXLog_DebugAudio()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_DebugAudio_logObj;
  v1[5] = "DebugAudio";
  if (JFXLog_DebugAudio_onceToken != -1)
    dispatch_once(&JFXLog_DebugAudio_onceToken, v1);
  return (id)JFXLog_DebugAudio_logObj;
}

id JFXLog_DebugCamera()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_DebugCamera_logObj;
  v1[5] = "DebugCamera";
  if (JFXLog_DebugCamera_onceToken != -1)
    dispatch_once(&JFXLog_DebugCamera_onceToken, v1);
  return (id)JFXLog_DebugCamera_logObj;
}

id JFXLog_DebugCapture()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_DebugCapture_logObj;
  v1[5] = "DebugCapture";
  if (JFXLog_DebugCapture_onceToken != -1)
    dispatch_once(&JFXLog_DebugCapture_onceToken, v1);
  return (id)JFXLog_DebugCapture_logObj;
}

id JFXLog_DebugClip()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_DebugClip_logObj;
  v1[5] = "DebugClip";
  if (JFXLog_DebugClip_onceToken != -1)
    dispatch_once(&JFXLog_DebugClip_onceToken, v1);
  return (id)JFXLog_DebugClip_logObj;
}

id JFXLog_DebugComposition()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_DebugComposition_logObj;
  v1[5] = "DebugComposition";
  if (JFXLog_DebugComposition_onceToken != -1)
    dispatch_once(&JFXLog_DebugComposition_onceToken, v1);
  return (id)JFXLog_DebugComposition_logObj;
}

id JFXLog_DebugDataModel()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_DebugDataModel_logObj;
  v1[5] = "DebugDataModel";
  if (JFXLog_DebugDataModel_onceToken != -1)
    dispatch_once(&JFXLog_DebugDataModel_onceToken, v1);
  return (id)JFXLog_DebugDataModel_logObj;
}

id JFXLog_DebugDepthCodec()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_DebugDepthCodec_logObj;
  v1[5] = "DebugDepthCodec";
  if (JFXLog_DebugDepthCodec_onceToken != -1)
    dispatch_once(&JFXLog_DebugDepthCodec_onceToken, v1);
  return (id)JFXLog_DebugDepthCodec_logObj;
}

id JFXLog_DebugEffect()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_DebugEffect_logObj;
  v1[5] = "DebugEffect";
  if (JFXLog_DebugEffect_onceToken != -1)
    dispatch_once(&JFXLog_DebugEffect_onceToken, v1);
  return (id)JFXLog_DebugEffect_logObj;
}

id JFXLog_DebugEffectAssetDownloading()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_DebugEffectAssetDownloading_logObj;
  v1[5] = "DebugEffectAssetDownloading";
  if (JFXLog_DebugEffectAssetDownloading_onceToken != -1)
    dispatch_once(&JFXLog_DebugEffectAssetDownloading_onceToken, v1);
  return (id)JFXLog_DebugEffectAssetDownloading_logObj;
}

id JFXLog_DebugExport()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_DebugExport_logObj;
  v1[5] = "DebugExport";
  if (JFXLog_DebugExport_onceToken != -1)
    dispatch_once(&JFXLog_DebugExport_onceToken, v1);
  return (id)JFXLog_DebugExport_logObj;
}

id JFXLog_DebugExposure()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_DebugExposure_logObj;
  v1[5] = "DebugExposure";
  if (JFXLog_DebugExposure_onceToken != -1)
    dispatch_once(&JFXLog_DebugExposure_onceToken, v1);
  return (id)JFXLog_DebugExposure_logObj;
}

id JFXLog_DebugFaceAnchor()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_DebugFaceAnchor_logObj;
  v1[5] = "DebugFaceAnchor";
  if (JFXLog_DebugFaceAnchor_onceToken != -1)
    dispatch_once(&JFXLog_DebugFaceAnchor_onceToken, v1);
  return (id)JFXLog_DebugFaceAnchor_logObj;
}

id JFXLog_DebugFaceTrackingPlayback()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_DebugFaceTrackingPlayback_logObj;
  v1[5] = "DebugFaceTrackingPlayback";
  if (JFXLog_DebugFaceTrackingPlayback_onceToken != -1)
    dispatch_once(&JFXLog_DebugFaceTrackingPlayback_onceToken, v1);
  return (id)JFXLog_DebugFaceTrackingPlayback_logObj;
}

id JFXLog_DebugMatting()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_DebugMatting_logObj;
  v1[5] = "DebugMatting";
  if (JFXLog_DebugMatting_onceToken != -1)
    dispatch_once(&JFXLog_DebugMatting_onceToken, v1);
  return (id)JFXLog_DebugMatting_logObj;
}

id JFXLog_DebugMediaDataReader()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_DebugMediaDataReader_logObj;
  v1[5] = "DebugMediaDataReader";
  if (JFXLog_DebugMediaDataReader_onceToken != -1)
    dispatch_once(&JFXLog_DebugMediaDataReader_onceToken, v1);
  return (id)JFXLog_DebugMediaDataReader_logObj;
}

id JFXLog_DebugPlayback()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_DebugPlayback_logObj;
  v1[5] = "DebugPlayback";
  if (JFXLog_DebugPlayback_onceToken != -1)
    dispatch_once(&JFXLog_DebugPlayback_onceToken, v1);
  return (id)JFXLog_DebugPlayback_logObj;
}

id JFXLog_DebugPickerPreviewing()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_DebugPickerPreviewing_logObj;
  v1[5] = "DebugPickerPreviewing";
  if (JFXLog_DebugPickerPreviewing_onceToken != -1)
    dispatch_once(&JFXLog_DebugPickerPreviewing_onceToken, v1);
  return (id)JFXLog_DebugPickerPreviewing_logObj;
}

id JFXLog_DebugThermals()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_DebugThermals_logObj;
  v1[5] = "DebugThermals";
  if (JFXLog_DebugThermals_onceToken != -1)
    dispatch_once(&JFXLog_DebugThermals_onceToken, v1);
  return (id)JFXLog_DebugThermals_logObj;
}

id JFXLog_DebugViewerUI()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_DebugViewerUI_logObj;
  v1[5] = "DebugViewerUI";
  if (JFXLog_DebugViewerUI_onceToken != -1)
    dispatch_once(&JFXLog_DebugViewerUI_onceToken, v1);
  return (id)JFXLog_DebugViewerUI_logObj;
}

id JFXLog_DebugWriter()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_DebugWriter_logObj;
  v1[5] = "DebugWriter";
  if (JFXLog_DebugWriter_onceToken != -1)
    dispatch_once(&JFXLog_DebugWriter_onceToken, v1);
  return (id)JFXLog_DebugWriter_logObj;
}

id JFXLog_DebugWriterReorder()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_DebugWriterReorder_logObj;
  v1[5] = "DebugWriterReorder";
  if (JFXLog_DebugWriterReorder_onceToken != -1)
    dispatch_once(&JFXLog_DebugWriterReorder_onceToken, v1);
  return (id)JFXLog_DebugWriterReorder_logObj;
}

id JFXLog_automation()
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x24BDAC760];
  v1[2] = __JFX_LogCategory_block_invoke_0;
  v1[3] = &__block_descriptor_48_e5_v8__0l;
  v1[1] = 3221225472;
  v1[4] = &JFXLog_automation_logObj;
  v1[5] = "automation";
  if (JFXLog_automation_onceToken != -1)
    dispatch_once(&JFXLog_automation_onceToken, v1);
  return (id)JFXLog_automation_logObj;
}

void JFXAutomationLogForUserDefault(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x24BDBCF50];
  v5 = a1;
  objc_msgSend(v4, "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLForKey:", v5);

  if (v7)
  {
    JFXLog_automation();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v3;
      _os_log_impl(&dword_2269A9000, v8, OS_LOG_TYPE_DEFAULT, "[AUTO]: %@", (uint8_t *)&v9, 0xCu);
    }

  }
}

void JFXAutomationLogCameraPosition(uint64_t a1)
{
  __CFString *v1;

  if (a1 == 2)
    v1 = CFSTR("Camera orientation set to Front");
  else
    v1 = CFSTR("Camera orientation set to Back");
  JFXAutomationLogForUserDefault(CFSTR("autoLogCameraState"), v1);
}

uint64_t isFrameMetricsLoggingEnabled()
{
  if (isFrameMetricsLoggingEnabled_onceToken != -1)
    dispatch_once(&isFrameMetricsLoggingEnabled_onceToken, &__block_literal_global_45);
  return isFrameMetricsLoggingEnabled_isFrameMetricsLoggingEnabled;
}

void __isFrameMetricsLoggingEnabled_block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("JFX_EnableFrameMetricsLogging"));
  v2 = (id)objc_claimAutoreleasedReturnValue();

  v1 = v2;
  if (v2)
  {
    isFrameMetricsLoggingEnabled_isFrameMetricsLoggingEnabled = objc_msgSend(v2, "BOOLValue");
    v1 = v2;
  }

}

void JFXAutomationLogFrameMetrics(void *a1, CMTime *a2, CMTime *a3)
{
  id v5;
  Float64 Seconds;
  void *v7;
  NSObject *v8;
  CMTime time;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  if (isFrameMetricsLoggingEnabled_onceToken != -1)
    dispatch_once(&isFrameMetricsLoggingEnabled_onceToken, &__block_literal_global_45);
  if (isFrameMetricsLoggingEnabled_isFrameMetricsLoggingEnabled)
  {
    time = *a2;
    Seconds = CMTimeGetSeconds(&time);
    time = *a3;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Frame Metrics - { \"event\": \"%@\", \"timestamp\": %f, \"latency\": %f }"), v5, *(_QWORD *)&Seconds, CMTimeGetSeconds(&time));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    JFXLog_automation();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(time.value) = 138412290;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v7;
      _os_log_impl(&dword_2269A9000, v8, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&time, 0xCu);
    }

  }
}

uint64_t JFX_descriptionForEffectAssetContentType(uint64_t a1)
{
  if (JFX_descriptionForEffectAssetContentType_onceToken != -1)
    dispatch_once(&JFX_descriptionForEffectAssetContentType_onceToken, &__block_literal_global_46);
  return objc_msgSend((id)JFX_descriptionForEffectAssetContentType_values, "objectAtIndexedSubscript:", a1);
}

uint64_t JFX_descriptionForEffectAssetAspectRatio(uint64_t a1)
{
  if (JFX_descriptionForEffectAssetAspectRatio_onceToken != -1)
    dispatch_once(&JFX_descriptionForEffectAssetAspectRatio_onceToken, &__block_literal_global_22_0);
  return objc_msgSend((id)JFX_descriptionForEffectAssetAspectRatio_values, "objectAtIndexedSubscript:", a1);
}

uint64_t JFX_descriptionForEffectAssetUsageMode(uint64_t a1)
{
  if (JFX_descriptionForEffectAssetUsageMode_onceToken != -1)
    dispatch_once(&JFX_descriptionForEffectAssetUsageMode_onceToken, &__block_literal_global_37);
  return objc_msgSend((id)JFX_descriptionForEffectAssetUsageMode_values, "objectAtIndexedSubscript:", a1);
}

void sub_226A41FD4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_226A425E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__19(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19(uint64_t a1)
{

}

void sub_226A428E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226A43080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226A431DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226A44374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__20(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__20(uint64_t a1)
{

}

JFXFaceTrackedEffectTransform *JFXMakeFaceTrackedEffectTransformFaceCamera(void *x0_0)
{
  id v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  JFXFaceTrackedEffectTransform *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  simd_float4x4 v36;

  v1 = x0_0;
  objc_msgSend(v1, "cameraTransform");
  pv_simd_matrix_get_rotation_matrix(v36);
  objc_msgSend(v1, "onFaceTransform");
  pv_simd_matrix_translate();
  v34 = v3;
  v35 = v2;
  v32 = v5;
  v33 = v4;
  v6 = [JFXFaceTrackedEffectTransform alloc];
  objc_msgSend(v1, "cameraProjection");
  v30 = v8;
  v31 = v7;
  v28 = v10;
  v29 = v9;
  objc_msgSend(v1, "cameraTransform");
  v26 = v12;
  v27 = v11;
  v24 = v14;
  v25 = v13;
  objc_msgSend(v1, "billboardTransform");
  v22 = v16;
  v23 = v15;
  v20 = v18;
  v21 = v17;

  return -[JFXFaceTrackedEffectTransform initWithCameraProjection:cameraTransform:onFaceTransform:billboardTransform:](v6, "initWithCameraProjection:cameraTransform:onFaceTransform:billboardTransform:", v31, v30, v29, v28, v27, v26, v25, v24, v35, v34, v33, v32, v23, v22, v21, v20);
}

void sub_226A4BE40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226A4BFBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226A4C2E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226A4C65C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226A4CC18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226A4CFC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226A4DC24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id location)
{
  id *v31;

  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226A4DFC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226A4E414(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226A4F7F0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_226A4FA3C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_226A50554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226A50684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__21(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__21(uint64_t a1)
{

}

void sub_226A52E34(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_226A552F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double OUTLINED_FUNCTION_0_7(__n128 a1)
{
  return a1.n128_f32[3];
}

void OUTLINED_FUNCTION_2_4(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_3_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x2Au);
}

void sub_226A5A660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__22(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__22(uint64_t a1)
{

}

void sub_226A5A83C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226A5C15C(void *a1)
{
  objc_begin_catch(a1);
  objc_end_catch();
  JUMPOUT(0x226A5C14CLL);
}

void sub_226A5CC2C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_226A5CD84(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_226A5CE7C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_226A5CFB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;
  id *v18;
  uint64_t v19;

  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v19 - 56));
  _Unwind_Resume(a1);
}

void sub_226A6B4D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;
  id *v16;
  uint64_t v17;

  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v17 - 40));
  _Unwind_Resume(a1);
}

id exifMetadataForCVPixelBuffer(const void *a1)
{
  CMAttachmentMode attachmentModeOut;

  attachmentModeOut = 1;
  CMGetAttachment(a1, (CFStringRef)*MEMORY[0x24BDD9470], &attachmentModeOut);
  return (id)objc_claimAutoreleasedReturnValue();
}

id exifMetadataForCMSampleBuffer(const void *a1)
{
  CMAttachmentMode attachmentModeOut;

  attachmentModeOut = 1;
  CMGetAttachment(a1, (CFStringRef)*MEMORY[0x24BDD9470], &attachmentModeOut);
  return (id)objc_claimAutoreleasedReturnValue();
}

float exifBrightnessFromEXIFMetadata(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  float v5;
  float v6;

  v1 = a1;
  v2 = v1;
  if (v1
    && (objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("BrightnessValue")),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = v3;
    objc_msgSend(v3, "floatValue");
    v6 = v5;

  }
  else
  {
    v6 = NAN;
  }

  return v6;
}

float shutterSpeedFromEXIFMetadata(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  float v5;
  float v6;

  v1 = a1;
  v2 = v1;
  if (v1
    && (objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("ShutterSpeedValue")),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = v3;
    objc_msgSend(v3, "floatValue");
    v6 = v5;

  }
  else
  {
    v6 = NAN;
  }

  return v6;
}

float exposureTimeFromEXIFMetadata(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  float v5;
  float v6;

  v1 = a1;
  v2 = v1;
  if (v1
    && (objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("ExposureTime")),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = v3;
    objc_msgSend(v3, "floatValue");
    v6 = v5;

  }
  else
  {
    v6 = NAN;
  }

  return v6;
}

float isoFromEXIFMetadata(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  float v6;
  float v7;
  float v8;

  v1 = a1;
  v2 = v1;
  if (v1
    && (objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("ISOSpeedRatings")),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = v3;
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    v7 = v6;

    v8 = (float)(int)v7;
  }
  else
  {
    v8 = NAN;
  }

  return v8;
}

void exposureOffsetFromEXIFMetadata(void *a1)
{
  float v1;

  v1 = exifBrightnessFromEXIFMetadata(a1);
  exp(v1 * -0.5 + -2.0);
  exp((float)(v1 + 3.0));
}

void logMetadataFromEXIFMetadata(void *a1)
{
  id v1;
  NSObject *v2;

  v1 = a1;
  if (v1)
  {
    JFXLog_DebugExposure();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      logMetadataFromEXIFMetadata_cold_1((uint64_t)v1, v2);

  }
}

uint64_t createReadonlyCMBlockBufferFromNSData(CMBlockBufferRef *a1, void *a2)
{
  void *v3;
  void *v4;
  size_t v5;
  size_t v6;
  CMBlockBufferCustomBlockSource customBlockSource;

  HIDWORD(customBlockSource.AllocateBlock) = 0;
  *(_QWORD *)&customBlockSource.version = 0;
  customBlockSource.FreeBlock = (void (__cdecl *)(void *, void *, size_t))releaseNSData;
  customBlockSource.refCon = a2;
  v3 = objc_retainAutorelease(customBlockSource.refCon);
  v4 = (void *)objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");
  v6 = objc_msgSend(v3, "length");

  return CMBlockBufferCreateWithMemoryBlock(0, v4, v5, 0, &customBlockSource, 0, v6, 0, a1);
}

CVPixelBufferRef createFloat32DepthImageForAVDepthData(void *a1)
{
  id v1;
  id v2;
  id v3;
  CVPixelBufferRef v4;

  v1 = a1;
  if (objc_msgSend(v1, "depthDataType") == 1717855600)
  {
    v2 = v1;
  }
  else
  {
    objc_msgSend(v1, "depthDataByConvertingToDepthDataType:", 1717855600);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  v3 = objc_retainAutorelease(v2);
  v4 = CVPixelBufferRetain((CVPixelBufferRef)objc_msgSend(v3, "depthDataMap"));

  return v4;
}

CVPixelBufferRef createContiguousFloat32DepthImageForAVDepthData(void *a1)
{
  __CVBuffer *Float32DepthImageForAVDepthData;
  __CVBuffer *v2;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  NSObject *v6;
  size_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFDictionary *v13;
  uint64_t v14;
  uint64_t v15;
  size_t v16;
  uint64_t v17;
  char *v18;
  char *BaseAddress;
  CVPixelBufferRef pixelBuffer;
  _QWORD v22[4];
  _QWORD v23[5];

  v23[4] = *MEMORY[0x24BDAC8D0];
  Float32DepthImageForAVDepthData = createFloat32DepthImageForAVDepthData(a1);
  v2 = Float32DepthImageForAVDepthData;
  if (Float32DepthImageForAVDepthData && CVPixelBufferGetPixelFormatType(Float32DepthImageForAVDepthData) == 1717855600)
  {
    Width = CVPixelBufferGetWidth(v2);
    Height = CVPixelBufferGetHeight(v2);
    BytesPerRow = CVPixelBufferGetBytesPerRow(v2);
    if (BytesPerRow == 4 * Width)
    {
      JFXLog_DebugDepthCodec();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        createContiguousFloat32DepthImageForAVDepthData_cold_1();

      return CVPixelBufferRetain(v2);
    }
    else
    {
      v7 = BytesPerRow;
      pixelBuffer = 0;
      v8 = *MEMORY[0x24BDC5668];
      v23[0] = MEMORY[0x24BDBD1B8];
      v9 = *MEMORY[0x24BDC5708];
      v22[0] = v8;
      v22[1] = v9;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", Width);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = v10;
      v22[2] = *MEMORY[0x24BDC5650];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", Height);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23[2] = v11;
      v22[3] = *MEMORY[0x24BDC56B8];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 1717855600);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v23[3] = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 4);
      v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

      CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], Width, Height, 0x66646570u, v13, &pixelBuffer);
      if (pixelBuffer)
      {
        CVPixelBufferLockBaseAddress(v2, 1uLL);
        CVPixelBufferLockBaseAddress(pixelBuffer, 0);
        if ((int)Height >= 1)
        {
          v14 = 0;
          v15 = 0;
          v16 = 4 * Width;
          v17 = Height;
          do
          {
            v18 = (char *)CVPixelBufferGetBaseAddress(v2) + v14;
            BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
            memcpy(&BaseAddress[v15], v18, v16);
            v15 += v16;
            v14 += v7;
            --v17;
          }
          while (v17);
        }
        CVPixelBufferUnlockBaseAddress(v2, 1uLL);
        CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
        v2 = pixelBuffer;
      }

    }
  }
  return v2;
}

void OUTLINED_FUNCTION_3_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x12u);
}

BOOL JFXOSVersionIsAbove(void *a1)
{
  uint64_t v1;
  id v2;
  unint64_t v3;

  v1 = JFXOSVersionIsAbove_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&JFXOSVersionIsAbove_onceToken, &__block_literal_global_57);
  v3 = objc_msgSend((id)JFXOSVersionIsAbove_systemVersion, "compare:options:", v2, 64);

  return v3 < 2;
}

void HEVCLosslessEncoder::HEVCLosslessEncoder(HEVCLosslessEncoder *this)
{
  *(_QWORD *)&this->var6 = 0x800000000;
  *(_QWORD *)&this->var0 = 0x2D000000500;
  this->var2 = 30.0;
  this->var3 = 0;
  *(_OWORD *)&this->var4.var0 = xmmword_226AB8660;
  this->var4.var4 = 1.0;
  *(_DWORD *)&this->var4.var5 = 65792;
}

{
  *(_QWORD *)&this->var6 = 0x800000000;
  *(_QWORD *)&this->var0 = 0x2D000000500;
  this->var2 = 30.0;
  this->var3 = 0;
  *(_OWORD *)&this->var4.var0 = xmmword_226AB8660;
  this->var4.var4 = 1.0;
  *(_DWORD *)&this->var4.var5 = 65792;
}

uint64_t HEVCLosslessEncoder::Open(HEVCLosslessEncoder *a1, int32_t a2, int32_t a3, int a4, void (__cdecl *a5)(void *, void *, OSStatus, VTEncodeInfoFlags, CMSampleBufferRef), void *a6, double a7)
{
  NSObject *v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  const __CFDictionary *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v30[2];
  _QWORD v31[2];
  uint8_t buf[4];
  int32_t v33;
  __int16 v34;
  int32_t v35;
  __int16 v36;
  double v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  if (a2 < 64 || a3 <= 63)
  {
    JFXLog_DebugDepthCodec();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      HEVCLosslessEncoder::Open();

  }
  a1->var0 = a2;
  a1->var1 = a3;
  a1->var2 = a7;
  a1->var8 = 1752589105;
  JFXLog_DebugDepthCodec();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109632;
    v33 = a2;
    v34 = 1024;
    v35 = a3;
    v36 = 2048;
    v37 = a7;
    _os_log_debug_impl(&dword_2269A9000, v15, OS_LOG_TYPE_DEBUG, "########### HEVCLosslessEncoder::Open w = %d, h = %d, frameRate=%f", buf, 0x18u);
  }

  if (a1->var3)
    goto LABEL_9;
  v17 = *MEMORY[0x24BDF99C0];
  v30[0] = *MEMORY[0x24BDF99B8];
  v30[1] = v17;
  v31[0] = MEMORY[0x24BDBD1C8];
  v31[1] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v18 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v19 = VTCompressionSessionCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], a2, a3, a1->var8, v18, 0, 0, a5, a6, &a1->var3);
  if (!(_DWORD)v19)
  {

LABEL_9:
    switch(a4)
    {
      case 1:
      case 2:
        a1->var7 = 8;
        v16 = 1308;
        break;
      case 3:
      case 6:
        a1->var7 = 10;
        v16 = 2;
        break;
      case 4:
      case 5:
      case 7:
      case 8:
        a1->var7 = 10;
        v16 = 1310;
        break;
      case 9:
        a1->var7 = 10;
        a1->var4.var0 = 9;
        v16 = 1010;
        break;
      case 10:
        a1->var7 = 8;
        a1->var4.var0 = 10;
        v16 = 1008;
        break;
      default:
        a1->var7 = 8;
        v16 = 1;
        break;
    }
    a1->var4.var2 = v16;
    JFXLog_DebugDepthCodec();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      HEVCLosslessEncoder::Open(v21, v22, v23, v24, v25, v26, v27, v28);

    a1->var4.var5 = 1;
    HEVCLosslessEncoder::ConfigEncoder(a1, &a1->var4);
    return 0;
  }
  JFXLog_DebugDepthCodec();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    HEVCLosslessEncoder::Open();

  return v19;
}

void sub_226A761C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t HEVCLosslessEncoder::ConfigEncoder(HEVCLosslessEncoder *this, EncoderConfig *a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  const __CFAllocator *v13;
  CFNumberRef v14;
  NSObject *v15;
  OSStatus v16;
  NSObject *v17;
  uint64_t v18;
  int var2;
  const void **v20;
  const void *v21;
  NSObject *v22;
  const void *v23;
  const void *v24;
  const void *v25;
  NSObject *v26;
  CFNumberRef v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  OSStatus v35;
  CFNumberRef v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  OSStatus v44;
  void *v45;
  NSObject *v46;
  NSObject *v47;
  const void *v48;
  NSObject *v49;
  OSStatus v50;
  _BOOL4 v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  JFXLog_DebugDepthCodec();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    HEVCLosslessEncoder::ConfigEncoder(v4, v5, v6, v7, v8, v9, v10, v11);

  v12 = *(_OWORD *)&a2->var0;
  *(_OWORD *)&this->var4.var4 = *(_OWORD *)&a2->var4;
  *(_OWORD *)&this->var4.var0 = v12;
  v13 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v14 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &a2->var1);
  JFXLog_DebugDepthCodec();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    HEVCLosslessEncoder::ConfigEncoder();

  v16 = VTSessionSetProperty(this->var3, (CFStringRef)*MEMORY[0x24BDF9370], v14);
  CFRelease(v14);
  if (v16)
  {
    JFXLog_DebugDepthCodec();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 2;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      HEVCLosslessEncoder::ConfigEncoder();
    goto LABEL_78;
  }
  var2 = a2->var2;
  if (var2 > 121)
  {
    if (var2 > 1009)
    {
      switch(var2)
      {
        case 1010:
          v20 = (const void **)MEMORY[0x24BDF97F0];
          goto LABEL_35;
        case 1308:
          v20 = (const void **)MEMORY[0x24BDF97D8];
          goto LABEL_35;
        case 1310:
          v20 = (const void **)MEMORY[0x24BDF97D0];
          goto LABEL_35;
      }
    }
    else
    {
      switch(var2)
      {
        case 122:
          v20 = (const void **)MEMORY[0x24BDF9718];
          goto LABEL_35;
        case 244:
          v20 = (const void **)MEMORY[0x24BDF9720];
          goto LABEL_35;
        case 1008:
          v20 = (const void **)MEMORY[0x24BDF97F8];
          goto LABEL_35;
      }
    }
LABEL_53:
    JFXLog_DebugDepthCodec();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 2;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      HEVCLosslessEncoder::ConfigEncoder();
    goto LABEL_78;
  }
  if (var2 > 65)
  {
    switch(var2)
    {
      case 'B':
        v20 = (const void **)MEMORY[0x24BDF9700];
        goto LABEL_35;
      case 'M':
        v20 = (const void **)MEMORY[0x24BDF97C0];
        goto LABEL_35;
      case 'd':
        v20 = (const void **)MEMORY[0x24BDF9770];
        goto LABEL_35;
    }
    goto LABEL_53;
  }
  if (var2 == 1)
  {
    v20 = (const void **)MEMORY[0x24BDF97E8];
    goto LABEL_35;
  }
  if (var2 == 2)
  {
    v20 = (const void **)MEMORY[0x24BDF97C8];
    goto LABEL_35;
  }
  if (var2 != 3)
    goto LABEL_53;
  v20 = (const void **)MEMORY[0x24BDF97E0];
LABEL_35:
  v21 = *v20;
  JFXLog_DebugDepthCodec();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    HEVCLosslessEncoder::ConfigEncoder();

  if (VTSessionSetProperty(this->var3, (CFStringRef)*MEMORY[0x24BDF9330], v21))
  {
    JFXLog_DebugDepthCodec();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 2;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      HEVCLosslessEncoder::ConfigEncoder();
    goto LABEL_78;
  }
  v23 = (const void *)*MEMORY[0x24BDBD270];
  v24 = (const void *)*MEMORY[0x24BDBD268];
  if (a2->var8)
    v25 = (const void *)*MEMORY[0x24BDBD270];
  else
    v25 = (const void *)*MEMORY[0x24BDBD268];
  JFXLog_DebugDepthCodec();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    HEVCLosslessEncoder::ConfigEncoder();

  if (VTSessionSetProperty(this->var3, (CFStringRef)*MEMORY[0x24BDF91F8], v25))
  {
    JFXLog_DebugDepthCodec();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 2;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      HEVCLosslessEncoder::ConfigEncoder();
    goto LABEL_78;
  }
  v27 = CFNumberCreate(v13, kCFNumberDoubleType, &a2->var4);
  JFXLog_DebugDepthCodec();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    HEVCLosslessEncoder::ConfigEncoder((uint64_t)&a2->var4, v28, v29, v30, v31, v32, v33, v34);

  v35 = VTSessionSetProperty(this->var3, (CFStringRef)*MEMORY[0x24BDF92D0], v27);
  CFRelease(v27);
  if (v35)
  {
    JFXLog_DebugDepthCodec();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 2;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      HEVCLosslessEncoder::ConfigEncoder();
    goto LABEL_78;
  }
  v36 = CFNumberCreate(v13, kCFNumberDoubleType, &this->var2);
  JFXLog_DebugDepthCodec();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    HEVCLosslessEncoder::ConfigEncoder((uint64_t)&this->var2, v37, v38, v39, v40, v41, v42, v43);

  v44 = VTSessionSetProperty(this->var3, (CFStringRef)*MEMORY[0x24BDF9260], v36);
  CFRelease(v36);
  if (v44)
  {
    JFXLog_DebugDepthCodec();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 2;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      HEVCLosslessEncoder::ConfigEncoder();
    goto LABEL_78;
  }
  if (a2->var5)
    v45 = &unk_24EE9C180;
  else
    v45 = &unk_24EE9C190;
  v17 = v45;
  JFXLog_DebugDepthCodec();
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
    HEVCLosslessEncoder::ConfigEncoder();

  if (VTSessionSetProperty(this->var3, (CFStringRef)*MEMORY[0x24BDF9338], v17))
  {
    JFXLog_DebugDepthCodec();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
      HEVCLosslessEncoder::ConfigEncoder();

LABEL_77:
    v18 = 2;
    goto LABEL_78;
  }

  if (a2->var6)
    v48 = v23;
  else
    v48 = v24;
  JFXLog_DebugDepthCodec();
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
    HEVCLosslessEncoder::ConfigEncoder();

  v50 = VTSessionSetProperty(this->var3, (CFStringRef)*MEMORY[0x24BDF9348], v48);
  JFXLog_DebugDepthCodec();
  v17 = objc_claimAutoreleasedReturnValue();
  v51 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
  if (v50)
  {
    if (v51)
      HEVCLosslessEncoder::ConfigEncoder();
    goto LABEL_77;
  }
  if (v51)
    HEVCLosslessEncoder::ConfigEncoder(v17, v52, v53, v54, v55, v56, v57, v58);
  v18 = 0;
LABEL_78:

  return v18;
}

void sub_226A767A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t HEVCLosslessEncoder::Close(HEVCLosslessEncoder *this)
{
  OpaqueVTCompressionSession *var3;
  OpaqueVTCompressionSession *v3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE var5;

  var3 = this->var3;
  var5 = this->var5;
  VTCompressionSessionCompleteFrames(var3, (CMTime *)&var5);
  v3 = this->var3;
  if (v3)
  {
    CFRelease(v3);
    this->var3 = 0;
  }
  return 0;
}

uint64_t HEVCLosslessEncoder::EncodeFrame(HEVCLosslessEncoder *this, __CVBuffer *a2, CMTime *a3, CFDictionaryRef frameProperties)
{
  OpaqueVTCompressionSession *var3;
  uint64_t v7;
  NSObject *v8;
  __int128 v9;
  CMTime v11;
  CMTime presentationTimeStamp;
  VTEncodeInfoFlags infoFlagsOut;

  infoFlagsOut = 0;
  var3 = this->var3;
  presentationTimeStamp = *a3;
  v11 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D40];
  v7 = VTCompressionSessionEncodeFrame(var3, a2, &presentationTimeStamp, &v11, frameProperties, 0, &infoFlagsOut);
  if ((_DWORD)v7)
  {
    JFXLog_DebugDepthCodec();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      HEVCLosslessEncoder::EncodeFrame();

  }
  else
  {
    v9 = *(_OWORD *)&a3->value;
    this->var5.var3 = a3->epoch;
    *(_OWORD *)&this->var5.var0 = v9;
    ++this->var6;
  }
  return v7;
}

__n128 HEVCLosslessEncoder::GetEncoderConfig(HEVCLosslessEncoder *this, EncoderConfig *a2)
{
  __n128 result;
  __int128 v3;

  if (a2)
  {
    result = *(__n128 *)&this->var4.var0;
    v3 = *(_OWORD *)&this->var4.var4;
    *(__n128 *)&a2->var0 = result;
    *(_OWORD *)&a2->var4 = v3;
  }
  return result;
}

void OUTLINED_FUNCTION_1_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x1Cu);
}

void OUTLINED_FUNCTION_2_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x22u);
}

uint64_t OUTLINED_FUNCTION_3_5(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t JFX_createImageRefFromAuxiliaryImageInfo(const __CFDictionary *a1, uint64_t a2, CGFloat a3)
{
  const __CFDictionary *Value;
  size_t v7;
  size_t v8;
  size_t v9;
  void *v10;
  const __CFAllocator *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  CGAffineTransform v19;
  CVPixelBufferRef texture;

  texture = 0;
  Value = (const __CFDictionary *)CFDictionaryGetValue(a1, (const void *)*MEMORY[0x24BDD91C8]);
  v7 = objc_msgSend((id)CFDictionaryGetValue(Value, (const void *)*MEMORY[0x24BDD92C0]), "unsignedLongValue");
  v8 = objc_msgSend((id)CFDictionaryGetValue(Value, (const void *)*MEMORY[0x24BDD9760]), "unsignedLongValue");
  v9 = objc_msgSend((id)CFDictionaryGetValue(Value, (const void *)*MEMORY[0x24BDD9638]), "unsignedLongValue");
  LODWORD(Value) = objc_msgSend((id)CFDictionaryGetValue(Value, (const void *)*MEMORY[0x24BDD96B8]), "unsignedIntValue");
  CFDictionaryGetValue(a1, (const void *)*MEMORY[0x24BDD91C0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v12 = objc_retainAutorelease(v10);
  CVPixelBufferCreateWithBytes(v11, v8, v9, (OSType)Value, (void *)objc_msgSend(v12, "bytes"), v7, (CVPixelBufferReleaseBytesCallback)JFX_auxiliaryImageCVPixelBufferReleaseBytesCallback, v12, 0, &texture);
  if (!texture)
    return 0;
  objc_msgSend(MEMORY[0x24BDBF660], "imageWithCVPixelBuffer:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "imageByApplyingCGOrientation:", a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (vabdd_f64(1.0, a3) > 2.22044605e-16)
  {
    CGAffineTransformMakeScale(&v19, a3, a3);
    objc_msgSend(v14, "imageByApplyingTransform:", &v19);
    v15 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v15;
  }
  CVPixelBufferRelease(texture);
  if (!v14)
    return 0;
  objc_msgSend(MEMORY[0x24BDBF648], "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "extent");
  v17 = objc_msgSend(v16, "createCGImage:fromRect:", v14);

  return v17;
}

uint64_t createGainMapImageRefFromAssetURL(const __CFURL *a1)
{
  CGImageSource *v1;
  CGImageSource *v2;
  CFDictionaryRef v3;
  const __CFDictionary *v4;
  uint64_t v5;
  const __CFDictionary *v6;
  const __CFDictionary *v7;
  const __CFNumber *Value;
  uint64_t ImageRefFromAuxiliaryImageInfo;
  unsigned int valuePtr;

  v1 = CGImageSourceCreateWithURL(a1, 0);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = CGImageSourceCopyAuxiliaryDataInfoAtIndex(v1, 0, (CFStringRef)*MEMORY[0x24BDD91E8]);
  if (v3)
  {
    v4 = v3;
    v5 = 1;
    valuePtr = 1;
    v6 = CGImageSourceCopyPropertiesAtIndex(v2, 0, 0);
    if (v6)
    {
      v7 = v6;
      Value = (const __CFNumber *)CFDictionaryGetValue(v6, (const void *)*MEMORY[0x24BDD9698]);
      if (Value)
        CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
      CFRelease(v7);
      v5 = valuePtr;
    }
    ImageRefFromAuxiliaryImageInfo = JFX_createImageRefFromAuxiliaryImageInfo(v4, v5, 1.0);
    CFRelease(v4);
  }
  else
  {
    ImageRefFromAuxiliaryImageInfo = 0;
  }
  CFRelease(v2);
  return ImageRefFromAuxiliaryImageInfo;
}

BOOL hasGainMap(CGImageSource *a1)
{
  CFDictionaryRef v1;
  CFDictionaryRef v2;

  v1 = CGImageSourceCopyAuxiliaryDataInfoAtIndex(a1, 0, (CFStringRef)*MEMORY[0x24BDD91E8]);
  v2 = v1;
  if (v1)
    CFRelease(v1);
  return v2 != 0;
}

void JFX_auxiliaryImageCVPixelBufferReleaseBytesCallback(CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
}

size_t JFXToVImage@<X0>(__CVBuffer *a1@<X0>, uint64_t a2@<X8>)
{
  size_t result;

  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_QWORD *)a2 = CVPixelBufferGetBaseAddress(a1);
  *(_QWORD *)(a2 + 8) = CVPixelBufferGetHeight(a1);
  *(_QWORD *)(a2 + 16) = CVPixelBufferGetWidth(a1);
  result = CVPixelBufferGetBytesPerRow(a1);
  *(_QWORD *)(a2 + 24) = result;
  return result;
}

size_t JFXPlanarToVImage@<X0>(__CVBuffer *a1@<X0>, size_t a2@<X1>, uint64_t a3@<X8>)
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

uint64_t JFXCreatePixelBufferPool(uint64_t a1, uint64_t a2, uint64_t a3, CVPixelBufferPoolRef *a4)
{
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFDictionary *v11;
  uint64_t v12;
  NSObject *v13;
  uint8_t v15[8];
  _QWORD v16[5];
  _QWORD v17[6];

  v17[5] = *MEMORY[0x24BDAC8D0];
  v17[0] = MEMORY[0x24BDBD1B8];
  v7 = *MEMORY[0x24BDC56B8];
  v16[0] = *MEMORY[0x24BDC5668];
  v16[1] = v7;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v8;
  v16[2] = *MEMORY[0x24BDC5708];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v9;
  v16[3] = *MEMORY[0x24BDC5650];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = *MEMORY[0x24BDC5690];
  v17[3] = v10;
  v17[4] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
  v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v12 = CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, v11, a4);
  if ((_DWORD)v12)
  {
    JFXLog_matting();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_2269A9000, v13, OS_LOG_TYPE_DEFAULT, "Unable to create pixelbuffer pool", v15, 2u);
    }

    *a4 = 0;
  }

  return v12;
}

uint64_t JFXConvertFloatDepthImageToFixedPointAtQuarterResolution(__CVBuffer *a1, int32x4_t *a2)
{
  unint64_t v4;
  BOOL v5;
  BOOL v6;
  uint64_t v7;
  const float *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  float32x4_t v12;
  const float *v13;
  int32x4_t *v14;
  unint64_t v15;
  unsigned __int128 v16;
  __int128 v18;
  __int128 v19;

  CVPixelBufferLockBaseAddress(a1, 1uLL);
  v18 = 0u;
  v19 = 0u;
  JFXToVImage(a1, (uint64_t)&v18);
  v4 = v19;
  if ((_QWORD)v19)
    v5 = (v19 & 7) == 0;
  else
    v5 = 0;
  if (!v5)
    JFXConvertFloatDepthImageToFixedPointAtQuarterResolution_cold_1();
  if (*((_QWORD *)&v18 + 1))
    v6 = (BYTE8(v18) & 3) == 0;
  else
    v6 = 0;
  if (!v6)
    JFXConvertFloatDepthImageToFixedPointAtQuarterResolution_cold_2();
  if (*((_QWORD *)&v19 + 1) < (unint64_t)(4 * v19))
    JFXConvertFloatDepthImageToFixedPointAtQuarterResolution_cold_3();
  if (*((_QWORD *)&v18 + 1) >= 4uLL)
  {
    v7 = 0;
    v8 = (const float *)v18;
    v9 = (unint64_t)v19 >> 3;
    v10 = *((_QWORD *)&v18 + 1) >> 2;
    v11 = 4 * *((_QWORD *)&v19 + 1);
    if ((unint64_t)v19 >> 3 <= 1)
      v9 = 1;
    v12 = (float32x4_t)vdupq_n_s32(0x447A0000u);
    do
    {
      v13 = v8;
      v14 = a2;
      v15 = v9;
      if (v4 >= 8)
      {
        do
        {
          v16 = (unsigned __int128)vld2q_f32(v13);
          v13 += 8;
          *v14++ = vcvtq_s32_f32(vmulq_f32((float32x4_t)v16, v12));
          --v15;
        }
        while (v15);
      }
      ++v7;
      a2 = (int32x4_t *)((char *)a2 + ((2 * v4) & 0xFFFFFFFFFFFFFFFCLL));
      v8 = (const float *)((char *)v8 + v11);
    }
    while (v7 != v10);
  }
  return CVPixelBufferUnlockBaseAddress(a1, 1uLL);
}

uint64_t JFXConvertFloatDepthImageToFixedPointAndTranspose(__CVBuffer *a1, int32x4_t *a2)
{
  unint64_t v4;
  BOOL v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  float32x4_t v15;
  uint64_t v16;
  uint64_t v17;
  int32x4_t *v18;
  int32x4_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  __int128 v28;
  __int128 v29;

  CVPixelBufferLockBaseAddress(a1, 1uLL);
  v28 = 0u;
  v29 = 0u;
  JFXToVImage(a1, (uint64_t)&v28);
  v4 = v29;
  if (*((_QWORD *)&v29 + 1) != 4 * (_QWORD)v29)
    JFXConvertFloatDepthImageToFixedPointAndTranspose_cold_4();
  if ((_QWORD)v29)
    v5 = (v29 & 3) == 0;
  else
    v5 = 0;
  if (!v5)
    JFXConvertFloatDepthImageToFixedPointAndTranspose_cold_1();
  v6 = *((_QWORD *)&v28 + 1);
  if (!*((_QWORD *)&v28 + 1) || (BYTE8(v28) & 3) != 0)
    JFXConvertFloatDepthImageToFixedPointAndTranspose_cold_2();
  v7 = v28;
  if ((int32x4_t *)v28 == a2)
    JFXConvertFloatDepthImageToFixedPointAndTranspose_cold_3();
  v8 = 0;
  v9 = (unint64_t)v29 >> 2;
  v10 = *((_QWORD *)&v28 + 1) >> 2;
  if ((unint64_t)v29 >> 2 <= 1)
    v11 = 1;
  else
    v11 = (unint64_t)v29 >> 2;
  v12 = v28 + 48 * v9;
  v13 = v9 << 6;
  v14 = v28 + 32 * v9;
  v15 = (float32x4_t)vdupq_n_s32(0x447A0000u);
  v16 = v28 + 16 * v9;
  do
  {
    if (v4 >= 4)
    {
      v17 = 0;
      v18 = a2;
      do
      {
        v19 = *(int32x4_t *)(v7 + 16 * v17);
        v20 = *(int32x4_t *)(v16 + 16 * v17);
        v21 = *(int32x4_t *)(v14 + 16 * v17);
        v22 = *(int32x4_t *)(v12 + 16 * v17);
        v23 = vzip1q_s32(v19, v21);
        v24 = vzip2q_s32(v19, v21);
        v25 = vzip1q_s32(v20, v22);
        v26 = vzip2q_s32(v20, v22);
        *v18 = vcvtq_s32_f32(vmulq_f32((float32x4_t)vzip1q_s32(v23, v25), v15));
        v18[v10] = vcvtq_s32_f32(vmulq_f32((float32x4_t)vzip2q_s32(v23, v25), v15));
        v18[2 * v10] = vcvtq_s32_f32(vmulq_f32((float32x4_t)vzip1q_s32(v24, v26), v15));
        v18[3 * (v6 >> 2)] = vcvtq_s32_f32(vmulq_f32((float32x4_t)vzip2q_s32(v24, v26), v15));
        ++v17;
        v18 += 4 * v10;
      }
      while (v11 != v17);
    }
    v8 += 4;
    v12 += v13;
    v14 += v13;
    v16 += v13;
    v7 += v13;
    ++a2;
  }
  while (v8 < v6);
  return CVPixelBufferUnlockBaseAddress(a1, 1uLL);
}

double JFXRemappedAverageDepth(int a1)
{
  return (100.0 - fmax(fmin(((double)a1 + -250.0) / 3.0, 100.0), 0.0)) / 100.0;
}

CVPixelBufferRef copyFloatDepthBufferToL010(__CVBuffer *a1, __CVPixelBufferPool *a2)
{
  OSType PixelFormatType;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  OSType v12;
  size_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  char *BaseAddress;
  char *v19;
  char *v20;
  float *v21;
  size_t v22;
  float v23;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferPoolRef pixelBufferPool;
  uint8_t buf[4];
  OSType v27;
  __int16 v28;
  OSType v29;
  __int16 v30;
  OSType v31;
  __int16 v32;
  OSType v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  pixelBuffer = 0;
  pixelBufferPool = 0;
  if (!a1)
  {
    JFXLog_matting();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v9 = "Error: src raw depth is invalid (null)";
LABEL_7:
      v10 = v8;
      v11 = 2;
LABEL_10:
      _os_log_impl(&dword_2269A9000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
    }
LABEL_11:

    goto LABEL_12;
  }
  PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  if (PixelFormatType != 1717855600)
  {
    v12 = PixelFormatType;
    JFXLog_matting();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      v27 = HIBYTE(v12);
      v28 = 1024;
      v29 = HIWORD(v12);
      v30 = 1024;
      v31 = v12 >> 8;
      v32 = 1024;
      v33 = v12;
      v9 = "Error: can't create 'L010' quantized depth buffer for pixelFormat %c%c%c%c";
      v10 = v8;
      v11 = 26;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  Width = CVPixelBufferGetWidth(a1);
  Height = CVPixelBufferGetHeight(a1);
  BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
  if (a2)
  {
    pixelBufferPool = a2;
    goto LABEL_14;
  }
  JFXCreatePixelBufferPool(Width, Height, 1278226736, &pixelBufferPool);
  a2 = pixelBufferPool;
  if (!pixelBufferPool)
  {
    JFXLog_matting();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v9 = "Error: could not create pixelbuffer pool";
    goto LABEL_7;
  }
LABEL_14:
  CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x24BDBD240], a2, &pixelBuffer);
  if (pixelBuffer)
  {
    v14 = CVPixelBufferGetBytesPerRow(pixelBuffer);
    CVPixelBufferLockBaseAddress(a1, 1uLL);
    CVPixelBufferLockBaseAddress(pixelBuffer, 0);
    if (Height)
    {
      v15 = 0;
      v16 = 0;
      for (i = 0; i != Height; ++i)
      {
        BaseAddress = (char *)CVPixelBufferGetBaseAddress(a1);
        v19 = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
        if (Width)
        {
          v20 = &v19[v16];
          v21 = (float *)&BaseAddress[v15];
          v22 = Width;
          do
          {
            v23 = *v21++;
            *(_WORD *)v20 = vcvtms_s32_f32((float)(fminf(fmaxf(v23, 0.0), 1.0) * 65535.0) + 0.5) & 0xFFC0;
            v20 += 2;
            --v22;
          }
          while (v22);
        }
        v16 += v14;
        v15 += BytesPerRow;
      }
    }
    CVPixelBufferUnlockBaseAddress(a1, 1uLL);
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  }
LABEL_12:
  CVPixelBufferPoolRelease(pixelBufferPool);
  return pixelBuffer;
}

CVPixelBufferRef copyBGRAToFloatDepthBuffer(__CVBuffer *a1, __CVPixelBufferPool *a2)
{
  OSType PixelFormatType;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  OSType v12;
  size_t v14;
  uint64_t v15;
  uint64_t v16;
  size_t v17;
  char *v18;
  char *BaseAddress;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferPoolRef pixelBufferPool;
  uint8_t buf[4];
  OSType v23;
  __int16 v24;
  OSType v25;
  __int16 v26;
  OSType v27;
  __int16 v28;
  OSType v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  pixelBuffer = 0;
  pixelBufferPool = 0;
  if (!a1)
  {
    JFXLog_matting();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v9 = "Error: 10-bit quantized src depth is invalid (null)";
LABEL_7:
      v10 = v8;
      v11 = 2;
LABEL_10:
      _os_log_impl(&dword_2269A9000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
    }
LABEL_11:

    goto LABEL_12;
  }
  PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  if (PixelFormatType != 1111970369)
  {
    v12 = PixelFormatType;
    JFXLog_matting();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      v23 = HIBYTE(v12);
      v24 = 1024;
      v25 = HIWORD(v12);
      v26 = 1024;
      v27 = v12 >> 8;
      v28 = 1024;
      v29 = v12;
      v9 = "Error: wrong pixelFormat %c%c%c%c expect 'L010'.";
      v10 = v8;
      v11 = 26;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  Width = CVPixelBufferGetWidth(a1);
  Height = CVPixelBufferGetHeight(a1);
  BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
  if (a2)
  {
    pixelBufferPool = a2;
    goto LABEL_14;
  }
  JFXCreatePixelBufferPool(Width, Height, 1717855600, &pixelBufferPool);
  a2 = pixelBufferPool;
  if (!pixelBufferPool)
  {
    JFXLog_matting();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v9 = "Error: could not create pixelbuffer pool";
    goto LABEL_7;
  }
LABEL_14:
  CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x24BDBD240], a2, &pixelBuffer);
  if (pixelBuffer)
  {
    v14 = CVPixelBufferGetBytesPerRow(pixelBuffer);
    CVPixelBufferLockBaseAddress(a1, 1uLL);
    CVPixelBufferLockBaseAddress(pixelBuffer, 0);
    if (Height)
    {
      v15 = 0;
      v16 = 0;
      v17 = 4 * Width;
      do
      {
        v18 = (char *)CVPixelBufferGetBaseAddress(a1) + v15;
        BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
        memcpy(&BaseAddress[v16], v18, v17);
        v16 += v14;
        v15 += BytesPerRow;
        --Height;
      }
      while (Height);
    }
    CVPixelBufferUnlockBaseAddress(a1, 1uLL);
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  }
LABEL_12:
  CVPixelBufferPoolRelease(pixelBufferPool);
  return pixelBuffer;
}

CVPixelBufferRef copyL010ToFloatDepthBuffer(__CVBuffer *a1, __CVPixelBufferPool *a2)
{
  OSType PixelFormatType;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  OSType v12;
  size_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  char *BaseAddress;
  char *v19;
  float *v20;
  char *v21;
  size_t v22;
  unsigned int v23;
  float v24;
  float v25;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferPoolRef pixelBufferPool;
  uint8_t buf[4];
  OSType v29;
  __int16 v30;
  OSType v31;
  __int16 v32;
  OSType v33;
  __int16 v34;
  OSType v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  pixelBuffer = 0;
  pixelBufferPool = 0;
  if (!a1)
  {
    JFXLog_matting();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v9 = "Error: 10-bit quantized src depth is invalid (null)";
LABEL_7:
      v10 = v8;
      v11 = 2;
LABEL_10:
      _os_log_impl(&dword_2269A9000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
    }
LABEL_11:

    goto LABEL_12;
  }
  PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  if (PixelFormatType != 1278226736)
  {
    v12 = PixelFormatType;
    JFXLog_matting();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      v29 = HIBYTE(v12);
      v30 = 1024;
      v31 = HIWORD(v12);
      v32 = 1024;
      v33 = v12 >> 8;
      v34 = 1024;
      v35 = v12;
      v9 = "Error: wrong pixelFormat %c%c%c%c expect 'L010'.";
      v10 = v8;
      v11 = 26;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  Width = CVPixelBufferGetWidth(a1);
  Height = CVPixelBufferGetHeight(a1);
  BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
  if (a2)
  {
    pixelBufferPool = a2;
    goto LABEL_14;
  }
  JFXCreatePixelBufferPool(Width, Height, 1717855600, &pixelBufferPool);
  a2 = pixelBufferPool;
  if (!pixelBufferPool)
  {
    JFXLog_matting();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v9 = "Error: could not create pixelbuffer pool";
    goto LABEL_7;
  }
LABEL_14:
  CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x24BDBD240], a2, &pixelBuffer);
  if (pixelBuffer)
  {
    v14 = CVPixelBufferGetBytesPerRow(pixelBuffer);
    CVPixelBufferLockBaseAddress(a1, 1uLL);
    CVPixelBufferLockBaseAddress(pixelBuffer, 0);
    if (Height)
    {
      v15 = 0;
      v16 = 0;
      for (i = 0; i != Height; ++i)
      {
        BaseAddress = (char *)CVPixelBufferGetBaseAddress(a1);
        v19 = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
        if (Width)
        {
          v20 = (float *)&v19[v16];
          v21 = &BaseAddress[v15];
          v22 = Width;
          do
          {
            v23 = *(unsigned __int16 *)v21;
            v21 += 2;
            v24 = (double)v23 * 0.0000152590219;
            v25 = v24 + 0.0;
            if (!v23)
              v25 = NAN;
            *v20++ = v25;
            --v22;
          }
          while (v22);
        }
        v16 += v14;
        v15 += BytesPerRow;
      }
    }
    CVPixelBufferUnlockBaseAddress(a1, 1uLL);
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  }
LABEL_12:
  CVPixelBufferPoolRelease(pixelBufferPool);
  return pixelBuffer;
}

CVPixelBufferRef copyDepthToHalfWidthHalfHeight(__CVBuffer *a1)
{
  OSType PixelFormatType;
  size_t Width;
  size_t Height;
  unint64_t v5;
  unint64_t v6;
  size_t BytesPerRow;
  size_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *BaseAddress;
  char *v15;
  char *v16;
  char *v17;
  unint64_t v18;
  int v19;
  NSObject *v20;
  const char *v21;
  OSType v22;
  NSObject *v23;
  uint32_t v24;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferPoolRef pixelBufferPool;
  uint8_t buf[4];
  OSType v29;
  __int16 v30;
  OSType v31;
  __int16 v32;
  OSType v33;
  __int16 v34;
  OSType v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  pixelBuffer = 0;
  pixelBufferPool = 0;
  if (!a1)
  {
    JFXLog_matting();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v21 = "Error: 'fdep' src depth is invalid (null)";
LABEL_22:
      v23 = v20;
      v24 = 2;
      goto LABEL_23;
    }
LABEL_24:

    goto LABEL_25;
  }
  PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  if (PixelFormatType != 1717855600)
  {
    v22 = PixelFormatType;
    JFXLog_matting();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      v29 = HIBYTE(v22);
      v30 = 1024;
      v31 = HIWORD(v22);
      v32 = 1024;
      v33 = v22 >> 8;
      v34 = 1024;
      v35 = v22;
      v21 = "Error: wrong pixelFormat %c%c%c%c expect 'fdep'.";
      v23 = v20;
      v24 = 26;
LABEL_23:
      _os_log_impl(&dword_2269A9000, v23, OS_LOG_TYPE_DEFAULT, v21, buf, v24);
      goto LABEL_24;
    }
    goto LABEL_24;
  }
  Width = CVPixelBufferGetWidth(a1);
  Height = CVPixelBufferGetHeight(a1);
  v5 = Width >> 1;
  v6 = Height >> 1;
  JFXCreatePixelBufferPool(Width >> 1, Height >> 1, 1717855600, &pixelBufferPool);
  if (!pixelBufferPool)
  {
    JFXLog_matting();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v21 = "Error: unable to create pixelbuffer pool";
      goto LABEL_22;
    }
    goto LABEL_24;
  }
  CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x24BDBD240], pixelBufferPool, &pixelBuffer);
  if (pixelBuffer)
  {
    BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
    v8 = CVPixelBufferGetBytesPerRow(pixelBuffer);
    CVPixelBufferLockBaseAddress(a1, 1uLL);
    CVPixelBufferLockBaseAddress(pixelBuffer, 0);
    if (Height >= 2)
    {
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v12 = 2 * BytesPerRow;
      if (v5 <= 1)
        v5 = 1;
      if (v6 <= 1)
        v13 = 1;
      else
        v13 = v6;
      do
      {
        BaseAddress = (char *)CVPixelBufferGetBaseAddress(a1);
        v15 = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
        if (Width >= 2)
        {
          v16 = &v15[v10];
          v17 = &BaseAddress[v9];
          v18 = v5;
          do
          {
            v19 = *(_DWORD *)v17;
            v17 += 8;
            *(_DWORD *)v16 = v19;
            v16 += 4;
            --v18;
          }
          while (v18);
        }
        ++v11;
        v10 += v8;
        v9 += v12;
      }
      while (v11 != v13);
    }
    CVPixelBufferUnlockBaseAddress(a1, 1uLL);
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  }
LABEL_25:
  CVPixelBufferPoolRelease(pixelBufferPool);
  return pixelBuffer;
}

CVPixelBufferRef copyDepthToDoubleWidthDoubleHeight(__CVBuffer *a1)
{
  OSType PixelFormatType;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  size_t v6;
  char *BaseAddress;
  char *v8;
  uint64_t v9;
  _DWORD *v10;
  _DWORD *v11;
  int *v12;
  size_t i;
  int v14;
  _DWORD *v15;
  NSObject *v16;
  const char *v17;
  OSType v18;
  NSObject *v19;
  uint32_t v20;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferPoolRef pixelBufferPool;
  uint8_t buf[4];
  OSType v25;
  __int16 v26;
  OSType v27;
  __int16 v28;
  OSType v29;
  __int16 v30;
  OSType v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  pixelBuffer = 0;
  pixelBufferPool = 0;
  if (!a1)
  {
    JFXLog_matting();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v17 = "Error: 'fdep' src depth is invalid (null)";
LABEL_19:
      v19 = v16;
      v20 = 2;
      goto LABEL_20;
    }
LABEL_21:

    goto LABEL_22;
  }
  PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  if (PixelFormatType != 1717855600)
  {
    v18 = PixelFormatType;
    JFXLog_matting();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      v25 = HIBYTE(v18);
      v26 = 1024;
      v27 = HIWORD(v18);
      v28 = 1024;
      v29 = v18 >> 8;
      v30 = 1024;
      v31 = v18;
      v17 = "Error: wrong pixelFormat %c%c%c%c expect 'fdep'.";
      v19 = v16;
      v20 = 26;
LABEL_20:
      _os_log_impl(&dword_2269A9000, v19, OS_LOG_TYPE_DEFAULT, v17, buf, v20);
      goto LABEL_21;
    }
    goto LABEL_21;
  }
  Width = CVPixelBufferGetWidth(a1);
  Height = CVPixelBufferGetHeight(a1);
  JFXCreatePixelBufferPool(2 * Width, 2 * Height, 1717855600, &pixelBufferPool);
  if (!pixelBufferPool)
  {
    JFXLog_matting();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v17 = "Error: could not create pixelbuffer pool";
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x24BDBD240], pixelBufferPool, &pixelBuffer);
  if (pixelBuffer)
  {
    if ((CVPixelBufferGetBytesPerRow(a1) & 3) != 0)
      copyDepthToDoubleWidthDoubleHeight_cold_2();
    if ((CVPixelBufferGetBytesPerRow(pixelBuffer) & 3) != 0)
      copyDepthToDoubleWidthDoubleHeight_cold_1();
    BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
    v6 = CVPixelBufferGetBytesPerRow(pixelBuffer);
    CVPixelBufferLockBaseAddress(a1, 1uLL);
    CVPixelBufferLockBaseAddress(pixelBuffer, 0);
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(a1);
    v8 = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
    if (Height)
    {
      v9 = 0;
      v10 = v8 + 4;
      do
      {
        v11 = v10;
        v12 = (int *)BaseAddress;
        for (i = Width; i; --i)
        {
          v14 = *v12++;
          *(v11 - 1) = v14;
          *v11 = v14;
          v15 = &v11[v6 >> 2];
          *(v15 - 1) = v14;
          *v15 = v14;
          v11 += 2;
        }
        ++v9;
        BaseAddress += 4 * (BytesPerRow >> 2);
        v10 += 2 * (v6 >> 2);
      }
      while (v9 != Height);
    }
    CVPixelBufferUnlockBaseAddress(a1, 1uLL);
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  }
LABEL_22:
  CVPixelBufferPoolRelease(pixelBufferPool);
  return pixelBuffer;
}

CVPixelBufferRef copySimulatedL010RoundtripImage(__CVBuffer *a1)
{
  __CVBuffer *v1;
  __CVBuffer *v2;
  CVPixelBufferRef v3;
  NSObject *v5;
  uint8_t v6[16];

  v1 = copyFloatDepthBufferToL010(a1, 0);
  if (v1)
  {
    v2 = v1;
    v3 = copyL010ToFloatDepthBuffer(v1, 0);
    CVPixelBufferRelease(v2);
    return v3;
  }
  else
  {
    JFXLog_matting();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2269A9000, v5, OS_LOG_TYPE_DEFAULT, "Error: copySimulatedL010RoundtripImage got null tmpImage", v6, 2u);
    }

    return 0;
  }
}

float calculatePSNRForDepthImage(__CVBuffer *a1, __CVBuffer *a2)
{
  int Width;
  int Height;
  int BytesPerRow;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  float v14;
  uint64_t v15;
  char *BaseAddress;
  char *v17;
  float *v18;
  float *v19;
  uint64_t v20;
  float v21;
  float v22;
  NSObject *v23;
  const char *v24;
  uint8_t *v25;
  float v26;
  int v28;
  uint8_t buf[2];
  __int16 v30;
  __int16 v31;

  Width = CVPixelBufferGetWidth(a1);
  Height = CVPixelBufferGetHeight(a1);
  if (CVPixelBufferGetPixelFormatType(a1) != 1717855600)
  {
    JFXLog_matting();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    v31 = 0;
    v24 = "calculatePSNRForDepthImage received image with unexpected pixel format";
    v25 = (uint8_t *)&v31;
LABEL_18:
    _os_log_impl(&dword_2269A9000, v23, OS_LOG_TYPE_DEFAULT, v24, v25, 2u);
    goto LABEL_19;
  }
  if (CVPixelBufferGetPixelFormatType(a2) != 1717855600)
  {
    JFXLog_matting();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    v30 = 0;
    v24 = "calculatePSNRForDepthImage received image with unexpected pixel format";
    v25 = (uint8_t *)&v30;
    goto LABEL_18;
  }
  if (!Width || !Height)
  {
    JFXLog_matting();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v24 = "calculatePSNRForDepthImage received image with unexpected dimension";
      v25 = buf;
      goto LABEL_18;
    }
LABEL_19:

    return 0.0;
  }
  BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
  v7 = CVPixelBufferGetBytesPerRow(a2);
  CVPixelBufferLockBaseAddress(a1, 1uLL);
  CVPixelBufferLockBaseAddress(a2, 1uLL);
  v28 = Height;
  if (Height < 1)
  {
    v14 = 0.0;
  }
  else
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = (uint64_t)v7 >> 2;
    v12 = Height;
    v13 = 4 * v11;
    v14 = 0.0;
    v15 = 4 * ((uint64_t)BytesPerRow >> 2);
    do
    {
      BaseAddress = (char *)CVPixelBufferGetBaseAddress(a1);
      v17 = (char *)CVPixelBufferGetBaseAddress(a2);
      if (Width >= 1)
      {
        v18 = (float *)&v17[v9];
        v19 = (float *)&BaseAddress[v8];
        v20 = Width;
        do
        {
          v21 = fminf(fmaxf(*v19, 0.0), 1.0);
          v22 = fminf(fmaxf(*v18, 0.0), 1.0);
          v14 = v14 + (float)((float)(v21 - v22) * (float)(v21 - v22));
          ++v18;
          ++v19;
          --v20;
        }
        while (v20);
      }
      ++v10;
      v9 += v13;
      v8 += v15;
    }
    while (v10 != v12);
  }
  v26 = log10f(v14 / (float)(v28 * Width)) * -10.0 + 0.0;
  CVPixelBufferUnlockBaseAddress(a1, 1uLL);
  CVPixelBufferUnlockBaseAddress(a2, 1uLL);
  return v26;
}

float calculateDepthShadowPSNRForDepthImage(__CVBuffer *a1, __CVBuffer *a2)
{
  int Width;
  int Height;
  int BytesPerRow;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *BaseAddress;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint8_t *v22;
  float v23;
  uint8_t buf[2];
  __int16 v26;
  __int16 v27;

  Width = CVPixelBufferGetWidth(a1);
  Height = CVPixelBufferGetHeight(a1);
  if (CVPixelBufferGetPixelFormatType(a1) != 1717855600)
  {
    JFXLog_matting();
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    v27 = 0;
    v21 = "calculatePSNRForDepthImage received image with unexpected pixel format";
    v22 = (uint8_t *)&v27;
LABEL_18:
    _os_log_impl(&dword_2269A9000, v20, OS_LOG_TYPE_DEFAULT, v21, v22, 2u);
    goto LABEL_19;
  }
  if (CVPixelBufferGetPixelFormatType(a2) != 1717855600)
  {
    JFXLog_matting();
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    v26 = 0;
    v21 = "calculatePSNRForDepthImage received image with unexpected pixel format";
    v22 = (uint8_t *)&v26;
    goto LABEL_18;
  }
  if (!Width || !Height)
  {
    JFXLog_matting();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v21 = "calculatePSNRForDepthImage received image with unexpected dimension";
      v22 = buf;
      goto LABEL_18;
    }
LABEL_19:

    return 0.0;
  }
  BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
  v7 = CVPixelBufferGetBytesPerRow(a2);
  CVPixelBufferLockBaseAddress(a1, 1uLL);
  CVPixelBufferLockBaseAddress(a2, 1uLL);
  if (Height >= 1)
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = (uint64_t)BytesPerRow >> 2;
    v12 = Height;
    v13 = 4 * ((uint64_t)v7 >> 2);
    v14 = 4 * v11;
    do
    {
      BaseAddress = (char *)CVPixelBufferGetBaseAddress(a1);
      v16 = (char *)CVPixelBufferGetBaseAddress(a2);
      if (Width >= 1)
      {
        v17 = &v16[v9];
        v18 = &BaseAddress[v8];
        v19 = Width;
        do
        {
          v17 += 4;
          v18 += 4;
          --v19;
        }
        while (v19);
      }
      ++v10;
      v9 += v13;
      v8 += v14;
    }
    while (v10 != v12);
  }
  v23 = log10f(0.0 / (float)0) * -10.0 + 0.0;
  CVPixelBufferUnlockBaseAddress(a1, 1uLL);
  CVPixelBufferUnlockBaseAddress(a2, 1uLL);
  return v23;
}

void sub_226A7940C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_226A79650(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)JFXRGBDMatte;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_226A79900(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_226A79F54(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DepthProcessingDataRGBD::getFaceDepthFromPortrait(DepthProcessingDataRGBD *this, CGRect a2)
{
  int var4;
  unint64_t var3;
  int v5;
  int v6;
  unsigned int v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  int *v16;
  int v17;
  int *v18;
  int v19;
  NSObject *v20;
  int v22;
  int v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  var4 = this->var4;
  var3 = this->var3;
  v5 = (int)(a2.size.width * ((double)var4 * 0.5) + (double)var4 * a2.origin.x);
  v6 = (int)(a2.size.height * ((double)(int)var3 * 0.5) + (double)(int)var3 * a2.origin.y);
  if (v6 <= 5)
    v7 = 5;
  else
    v7 = (int)(a2.size.height * ((double)(int)var3 * 0.5) + (double)(int)var3 * a2.origin.y);
  if (v5 <= 5)
    v8 = 5;
  else
    v8 = v5;
  if ((int)var3 - 1 >= v6 + 5)
    v9 = v6 + 5;
  else
    v9 = var3 - 1;
  v10 = var4 - 1;
  if (v10 >= v5 + 5)
    v11 = v5 + 5;
  else
    v11 = v10;
  JFXLog_DebugMatting();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 67109376;
    v23 = v6;
    v24 = 1024;
    v25 = v5;
    _os_log_impl(&dword_2269A9000, v12, OS_LOG_TYPE_DEFAULT, "Nose at %d,%d in rotated depth coordinates (i.e. portrait)", (uint8_t *)&v22, 0xEu);
  }

  if ((int)v8 - 5 > v11)
  {
    LODWORD(v13) = 0;
    v14 = 1;
LABEL_24:
    v13 = ((int)v13 / v14);
    goto LABEL_25;
  }
  v13 = 0;
  v15 = v8 - 5;
  v16 = &this->var2[(v8 - 5) * (int)var3 - 5 + v7];
  v14 = 1;
  do
  {
    v17 = v9 - v7 + 6;
    v18 = v16;
    if ((int)(v7 - 5) <= v9)
    {
      do
      {
        v19 = *v18++;
        v13 = (v19 + v13);
        if (v19)
          ++v14;
        --v17;
      }
      while (v17);
    }
    ++v15;
    v16 += (int)var3;
  }
  while (v11 + 1 != (_DWORD)v15);
  if (v14)
    goto LABEL_24;
LABEL_25:
  JFXLog_DebugMatting();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 67109120;
    v23 = v13;
    _os_log_impl(&dword_2269A9000, v20, OS_LOG_TYPE_DEFAULT, "RGBD facedepth=%d", (uint8_t *)&v22, 8u);
  }

  return v13;
}

void sub_226A7B000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  ContourProcessing::~ContourProcessing((ContourProcessing *)&a26);
  _Unwind_Resume(a1);
}

void sub_226A7B2C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_226A7B840(_Unwind_Exception *a1, void *a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);

  ContourProcessing::~ContourProcessing((ContourProcessing *)va);
  _Unwind_Resume(a1);
}

void sub_226A7BC9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;

  _Unwind_Resume(a1);
}

void sub_226A7BFD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void DispatchContextRGBDSensoGrabCut(int *a1)
{
  uint64_t v1;
  uint64_t v2;
  double *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  int v8;
  size_t v9;
  int v10;
  uint64_t v11;
  id v12;
  int v13;
  int v14;
  int v15;
  int v16;
  void *v17;
  size_t v18;
  size_t v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  double v24;
  CVPixelBufferRef v25;
  CVPixelBufferRef v26;
  CVPixelBufferRef texture;

  v2 = *((_QWORD *)a1 + 2);
  v1 = *((_QWORD *)a1 + 3);
  v3 = (double *)*((_QWORD *)a1 + 4);
  v4 = *v3;
  v5 = v3[1];
  v6 = v3[2];
  v7 = v3[3];
  v8 = a1[11];
  v9 = a1[10];
  v10 = a1[12];
  v11 = *((_QWORD *)a1 + 1);
  v12 = *(id *)a1;
  v13 = (int)v7 / v10;
  v14 = (int)v6;
  v15 = (int)v7 - v13 * (v10 - 1);
  if (v8 != v10 - 1)
    v15 = (int)v7 / v10;
  v16 = (int)v5 + v13 * v8;
  v17 = (void *)(v1 + (int)v9 * (uint64_t)v16);
  texture = 0;
  v18 = v14;
  v19 = v15;
  CVPixelBufferCreateWithBytes(0, v14, v15, 0x42475241u, v17, v9, 0, 0, 0, &texture);
  objc_msgSend(MEMORY[0x24BE79030], "imageWithCVPixelBuffer:", texture);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  CVPixelBufferRelease(texture);
  v21 = v16 * v14;
  v26 = 0;
  CVPixelBufferCreateWithBytes(0, v18, v19, 0x4C303038u, (void *)(v11 + v21), v18, 0, 0, 0, &v26);
  objc_msgSend(MEMORY[0x24BE79030], "imageWithCVPixelBuffer:", v26);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  CVPixelBufferRelease(v26);
  v25 = 0;
  CVPixelBufferCreateWithBytes(0, v18, v19, 0x4C303038u, (void *)(v2 + v21), v18, 0, 0, 0, &v25);
  objc_msgSend(MEMORY[0x24BE79030], "imageWithCVPixelBuffer:", v25);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  CVPixelBufferRelease(v25);
  LODWORD(v24) = 1112014848;
  objc_msgSend(v12, "processImage:trimap:roi:clusters:gamma:iterations:mask:", v20, v22, 5, 1, v23, v4, v5, v6, v7, v24);

}

void sub_226A7C234(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_226A7C4A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

DepthProcessingDataRGBD *DepthProcessingDataRGBD::depthHistogram(DepthProcessingDataRGBD *this, int *a2)
{
  int *var2;
  unint64_t var4;
  uint64_t v4;
  uint64_t v5;
  unint64_t var3;
  unint64_t v7;
  int *v8;
  int v9;
  int v10;
  int v11;

  var2 = this->var2;
  *((_OWORD *)a2 + 23) = 0u;
  *((_OWORD *)a2 + 24) = 0u;
  *((_OWORD *)a2 + 21) = 0u;
  *((_OWORD *)a2 + 22) = 0u;
  *((_OWORD *)a2 + 19) = 0u;
  *((_OWORD *)a2 + 20) = 0u;
  *((_OWORD *)a2 + 17) = 0u;
  *((_OWORD *)a2 + 18) = 0u;
  *((_OWORD *)a2 + 15) = 0u;
  *((_OWORD *)a2 + 16) = 0u;
  *((_OWORD *)a2 + 13) = 0u;
  *((_OWORD *)a2 + 14) = 0u;
  *((_OWORD *)a2 + 11) = 0u;
  *((_OWORD *)a2 + 12) = 0u;
  *((_OWORD *)a2 + 9) = 0u;
  *((_OWORD *)a2 + 10) = 0u;
  *((_OWORD *)a2 + 7) = 0u;
  *((_OWORD *)a2 + 8) = 0u;
  *((_OWORD *)a2 + 5) = 0u;
  *((_OWORD *)a2 + 6) = 0u;
  *((_OWORD *)a2 + 3) = 0u;
  *((_OWORD *)a2 + 4) = 0u;
  *((_OWORD *)a2 + 1) = 0u;
  *((_OWORD *)a2 + 2) = 0u;
  *(_OWORD *)a2 = 0u;
  var4 = this->var4;
  if (var4)
  {
    v4 = 0;
    v5 = 0;
    var3 = this->var3;
    do
    {
      if (var3)
      {
        v4 += var3;
        v7 = var3;
        v8 = var2;
        do
        {
          v10 = *v8++;
          v9 = v10;
          if (v10)
          {
            if (v9 <= 999)
            {
              v11 = v9 / 10;
              this = (DepthProcessingDataRGBD *)(a2[v11] + 1);
              a2[v11] = (int)this;
            }
          }
          --v7;
        }
        while (v7);
      }
      ++v5;
      var2 += var3;
    }
    while (v5 != var4);
  }
  return this;
}

__objc2_meth_list **DepthProcessingDataRGBD::fillHolesInSource(DepthProcessingDataRGBD *this, CGRect a2, UIInterfaceOrientation a3)
{
  double width;
  double x;
  int *var2;
  unint64_t var3;
  unint64_t var4;
  __objc2_meth_list **result;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  double v14;
  int v15;
  double v16;
  uint64_t v17;
  int *v18;
  unint64_t v22;
  int *v23;
  int v24;
  unint64_t v25;
  int v26;
  unint64_t v27;
  int v28;
  int v29;
  uint64_t v30;
  int *v31;
  unint64_t v32;

  width = a2.size.width;
  x = a2.origin.x;
  var2 = this->var2;
  var3 = this->var3;
  var4 = this->var4;
  result = (__objc2_meth_list **)isFaceBoundingBoxValid(a2.origin.x, a2.origin.y, a2.size.width, a2.size.height);
  if ((_DWORD)result && var4 << 32)
  {
    v10 = 0;
    v11 = (unint64_t)(int)var3 >> 2;
    v12 = a3 - 1;
    v13 = (int)var4;
    v14 = x + width * -0.1;
    if (a3 != UIInterfaceOrientationPortraitUpsideDown)
      v14 = x + width * -0.45;
    v15 = (int)(v14 * (double)(int)var4);
    v16 = x + width * 1.3;
    if (a3 != UIInterfaceOrientationPortraitUpsideDown)
      v16 = x + width * 0.9;
    if ((unint64_t)(int)var3 <= 1)
      v17 = 1;
    else
      v17 = (int)var3;
    if ((unint64_t)(int)var4 <= 1)
      v13 = 1;
    result = &OBJC_PROTOCOL___IMAAppPresenterDelegate.opt_inst_meths;
    v18 = var2;
    do
    {
      if ((v10 > (int)(v16 * (double)(int)var4) || v10 < v15 || v12 >= 2) && var3 << 32 != 0)
      {
        v22 = 0;
        v23 = &var2[v10 * v11];
        while (1)
        {
          v24 = v18[v22];
          v25 = v22 + 1;
          if (v24)
            break;
          ++v22;
          if (v17 == v25)
            goto LABEL_44;
        }
        if (v25 < (int)var3)
        {
          v26 = 0;
          do
          {
            v27 = v22;
            v22 = v25;
            v28 = v23[v25];
            if (v28)
            {
              if (v26)
              {
                v29 = v28 >= v24 ? v24 : v28;
                if (v26 < DepthProcessingDataRGBD::fillHolesInSource(CGRect,UIInterfaceOrientation)::kMaxRun
                  && v29 <= 399)
                {
                  if (v24 <= v28)
                    v24 = v28;
                  v30 = 4 * v26;
                  if (v30 >= 1)
                  {
                    v31 = &v23[v27 - v26];
                    v32 = ((unint64_t)v30 >> 2) + 1;
                    do
                    {
                      *v31++ = v24;
                      --v32;
                    }
                    while (v32 > 1);
                  }
                  v26 = 0;
                  v24 = v28;
                }
              }
            }
            else
            {
              ++v26;
            }
            v25 = v22 + 1;
          }
          while (v22 + 1 != (int)var3);
        }
      }
LABEL_44:
      ++v10;
      v18 += v11;
    }
    while (v10 != v13);
  }
  return result;
}

void DepthProcessingDataRGBD::setAverageDepthAndSegment(DepthProcessingDataRGBD *this, int a2)
{
  size_t v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  int v9;

  v4 = this->var8 * this->var9;
  bzero(this->var10, v4);
  bzero(this->var11, v4);
  if (!v4)
  {
    v6 = 0;
    v7 = 1;
LABEL_11:
    v9 = v6 / v7;
    goto LABEL_12;
  }
  v5 = 0;
  v6 = 0;
  v7 = 1;
  do
  {
    v8 = this->var2[v5];
    if (v8)
    {
      if (v8 < a2)
      {
        this->var11[v5] = -1;
        this->var10[v5] = -1;
        ++v7;
        v6 += v8;
      }
    }
    else
    {
      this->var11[v5] = -1;
    }
    ++v5;
  }
  while (v4 != v5);
  if (v7)
    goto LABEL_11;
  v9 = 0;
LABEL_12:
  this->var15 = v9;
}

void sub_226A7CFDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, void *a4, ...)
{
  va_list va;

  va_start(va, a4);
  ContourProcessing::~ContourProcessing((ContourProcessing *)va);

  _Unwind_Resume(a1);
}

void sub_226A7D0E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void DepthProcessingDataRGBD::DepthProcessingDataRGBD(DepthProcessingDataRGBD *this, unint64_t a2, unint64_t a3, int a4)
{
  char *v7;
  id v8;
  id var7;
  size_t v10;
  const char *v11;
  int v12;

  this->var7 = 0;
  this->var8 = a2;
  this->var9 = a3;
  if (a4)
  {
    this->var3 = a2 >> 1;
    this->var4 = a3 >> 2;
    v7 = (char *)operator new[]();
    this->var6 = v7;
    CVPixelBufferCreateWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD240], this->var3, this->var4, 0x4C303038u, v7, this->var3, (CVPixelBufferReleaseBytesCallback)CPPCVPixelBufferReleaseBytesCallback, 0, 0, &this->var5);
    v8 = -[JFXImageScaler initForCPU:]([JFXImageScaler alloc], "initForCPU:", 0);
    var7 = this->var7;
    this->var7 = v8;

  }
  else
  {
    this->var3 = a3;
    this->var4 = a2;
    this->var5 = 0;
    this->var6 = 0;
  }
  v10 = a3 * a2;
  if (malloc_type_posix_memalign((void **)&this->var10, 0x40uLL, v10, 0xB1FAB7CDuLL))
  {
    v11 = "!posix_memalign( (void**)&_depthData, kAlignment, sizeof(unsigned char) * w * h)";
    v12 = 76;
    goto LABEL_11;
  }
  if (malloc_type_posix_memalign((void **)&this->var11, 0x40uLL, v10, 0x1209EE89uLL))
  {
    v11 = "!posix_memalign( (void**)&_depthOuter, kAlignment, sizeof(unsigned char) * w * h)";
    v12 = 77;
    goto LABEL_11;
  }
  if (malloc_type_posix_memalign((void **)&this->var2, 0x40uLL, 4 * this->var3 * this->var4, 0x6E3555A5uLL))
  {
    v11 = "!posix_memalign( (void**)&_depthDataBufferInt, kAlignment, sizeof(int) * _subWidth * _subHeight)";
    v12 = 78;
LABEL_11:
    __assert_rtn("DepthProcessingDataRGBD", "JFXDepthProcessingData.hpp", v12, v11);
  }
  this->var0 = (int *)operator new[]();
  this->var1 = (int *)operator new[]();
  this->var15 = 0;
}

void sub_226A7D390(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void CPPCVPixelBufferReleaseBytesCallback(void *a1, const void *a2)
{
  if (a2)
    JUMPOUT(0x2276A1A80);
}

void DepthProcessingDataRGBD::~DepthProcessingDataRGBD(DepthProcessingDataRGBD *this)
{
  int *var1;
  id var7;

  free(this->var10);
  free(this->var11);
  free(this->var2);
  if (this->var0)
    MEMORY[0x2276A1A80](this->var0, 0x1000C8052888210);
  var1 = this->var1;
  if (var1)
    MEMORY[0x2276A1A80](var1, 0x1000C8052888210);
  CVPixelBufferRelease(this->var5);
  var7 = this->var7;
  this->var7 = 0;

}

dispatch_queue_t JFXCreateDispatchQueue(void *a1, void *a2, void *a3)
{
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  id v14;
  dispatch_queue_t v15;

  v5 = (void *)MEMORY[0x24BDD1488];
  v6 = a3;
  v7 = a2;
  v8 = a1;
  objc_msgSend(v5, "jfxBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@.%@"), v10, v12, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_retainAutorelease(v13);
  v15 = dispatch_queue_create((const char *)objc_msgSend(v14, "UTF8String"), v6);

  return v15;
}

#error "226A7F524: call analysis failed (funcsize=329)"

float64x2_t transformInfoWithWorldToViewTransform@<Q0>(__int128 *a1@<X0>, uint64_t a2@<X8>, float64x2_t a3@<Q0>, __int128 a4, __int128 a5, __int128 a6, __int128 a7, __int128 a8, __int128 a9, __int128 a10, __int128 a11, __int128 a12, __int128 a13, __int128 a14, __int128 a15, __int128 a16, __int128 a17, __int128 a18, __int128 a19)
{
  uint64_t v20;
  __int128 v21;
  float64x2_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  float64x2_t v31;
  float64x2_t v32;
  float64x2_t *v33;
  _OWORD *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  float64x2_t result;

  v20 = 0;
  v21 = a1[5];
  __asm { FMOV            V1.2D, #-0.5 }
  v27 = vmulq_f64(a3, _Q1);
  a16 = a1[4];
  a17 = v21;
  v28 = a1[7];
  a18 = a1[6];
  a19 = v28;
  v29 = a1[1];
  a12 = *a1;
  a13 = v29;
  v30 = a1[3];
  a14 = a1[2];
  a15 = v30;
  a4 = 0u;
  a5 = 0u;
  a6 = 0u;
  a7 = 0u;
  a8 = 0u;
  a9 = 0u;
  a10 = 0u;
  a11 = 0u;
  do
  {
    v32 = *(float64x2_t *)((char *)&a12 + v20);
    v31 = *(float64x2_t *)((char *)&a12 + v20 + 16);
    v33 = (float64x2_t *)((char *)&a4 + v20);
    *v33 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)xmmword_226AB71E0, v32.f64[0]), (float64x2_t)xmmword_226AB71D0, v32, 1), (float64x2_t)0, v31.f64[0]), v27, v31, 1);
    v33[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)0, v32.f64[0]), (float64x2_t)0, v32, 1), (float64x2_t)xmmword_226AB71E0, v31.f64[0]), (float64x2_t)xmmword_226AB71D0, v31, 1);
    v20 += 32;
  }
  while (v20 != 128);
  v34 = (_OWORD *)MEMORY[0x24BE79710];
  v35 = *(_OWORD *)(MEMORY[0x24BE79710] + 80);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(MEMORY[0x24BE79710] + 64);
  *(_OWORD *)(a2 + 80) = v35;
  v36 = v34[7];
  *(_OWORD *)(a2 + 96) = v34[6];
  *(_OWORD *)(a2 + 112) = v36;
  v37 = v34[1];
  *(_OWORD *)a2 = *v34;
  *(_OWORD *)(a2 + 16) = v37;
  v38 = v34[3];
  *(_OWORD *)(a2 + 32) = v34[2];
  *(_OWORD *)(a2 + 48) = v38;
  a16 = a8;
  a17 = a9;
  a18 = a10;
  a19 = a11;
  a12 = a4;
  a13 = a5;
  a14 = a6;
  a15 = a7;
  pv_transform_info_make();
  __asm { FMOV            V0.2D, #0.5 }
  result = vaddq_f64(vmulq_f64(a3, _Q0), *(float64x2_t *)a2);
  *(float64x2_t *)a2 = result;
  return result;
}

#error "226A7FB28: call analysis failed (funcsize=198)"

void sub_226A7FD84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

double JTGetHostTime()
{
  unint64_t v0;
  unint64_t v1;
  mach_timebase_info info;

  info = 0;
  if (*(double *)&JTGetHostTime_timeBaseFactor == 0.0 && !mach_timebase_info(&info))
  {
    LODWORD(v0) = info.numer;
    LODWORD(v1) = info.denom;
    *(double *)&JTGetHostTime_timeBaseFactor = (double)v0 / (double)v1 / 1000000000.0;
  }
  return *(double *)&JTGetHostTime_timeBaseFactor * (double)mach_absolute_time();
}

void sub_226A84398(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226A84704(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226A84E44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226A854E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226A86D38(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_226A87D90(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29)
{
  uint64_t v29;
  id v30;
  NSObject *v31;
  void *v32;

  if (a2 == 1)
  {
    v30 = objc_begin_catch(exception_object);
    objc_msgSend(a29, "setStatus:", 4);
    JFXLog_export();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v30, "description");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[JFXReaderWriterExportController continueExportAfterDelay].cold.1(v32, v29 - 176, v31);
    }

    objc_msgSend(a29, "closeSessionWithStatus:", 2);
    objc_end_catch();
    JUMPOUT(0x226A87CE8);
  }
  _Unwind_Resume(exception_object);
}

void OUTLINED_FUNCTION_1_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_226A88398(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__23(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__23(uint64_t a1)
{

}

void sub_226A8859C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_7(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

uint64_t OUTLINED_FUNCTION_5_1(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "type");
}

uint64_t OUTLINED_FUNCTION_9()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

void sub_226A8C2EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__24(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__24(uint64_t a1)
{

}

void sub_226A8C41C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_226A8C5E8(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_226A8C7C4(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_226A8C9D0(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_226A8CBC0(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_226A8CE8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226A8CF80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226A8D1F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226A8D2E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226A8D7A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226A8D974(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 72));
  _Unwind_Resume(a1);
}

void sub_226A8E0A8(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_226A8E7EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226A8EAE8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_226A8EC88(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_226A8F448(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226A90204(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_226A904D0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_226A90784(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_226A909B0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_226A90EF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  id *v29;

  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226A913C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226A91624(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_226A91A94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226A91BF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226A91D64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226A91F20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double OUTLINED_FUNCTION_3_6()
{
  uint64_t v0;

  return *(double *)(v0 + 40);
}

double CGPointConvertToNormalizedCoordinateSpace(unint64_t a1, int a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  unsigned int v14;
  int v15;
  uint64_t v16;
  int v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  if ((a2 - 1) > 2)
    v14 = 1;
  else
    v14 = dword_226AB8808[a2 - 1];
  v15 = pvViewContentModeForUIViewContentMode(a1);
  v16 = v15 - 1;
  if (v16 > 0xB)
    v17 = 0;
  else
    v17 = dword_226AB87D8[v16];
  if (v14 == 4)
  {
    v20 = a5;
    a5 = a6;
    v18 = a4;
  }
  else
  {
    v18 = a6 - a4;
    if (v14 == 3)
    {
      v20 = a5;
      a5 = a6;
    }
    else
    {
      if (v14 == 1)
        v19 = a3;
      else
        v19 = a5 - a3;
      v20 = a6;
      v18 = v19;
    }
  }
  switch(v15)
  {
    case 1:
      if (a5 <= v20)
      {
        v21 = v20 / a8;
        if (a7 * (v20 / a8) < a5)
          v21 = a5 / a7;
      }
      else
      {
        v21 = a5 / a7;
        if (a8 * (a5 / a7) < v20)
          v21 = v20 / a8;
      }
      break;
    case 3:
      a7 = a5;
      goto LABEL_28;
    case 2:
      v21 = a5 / a7;
      if (a8 * (a5 / a7) > v20)
        v21 = v20 / a8;
      break;
    default:
      goto LABEL_28;
  }
  a7 = a7 * v21;
LABEL_28:
  v22 = *MEMORY[0x24BDBEFB0];
  if ((v17 - 1) < 6)
    v22 = (a7 - a5) * 0.5;
  switch(v17)
  {
    case 8:
    case 10:
    case 12:
      v22 = a7 - a5;
      break;
    default:
      return (v18 + v22) / a7;
  }
  return (v18 + v22) / a7;
}

uint64_t orientationRotatedFromPortraitByCardinalAngle(int a1)
{
  if ((a1 - 1) > 2)
    return 1;
  else
    return dword_226AB8808[a1 - 1];
}

uint64_t pvViewContentModeForUIViewContentMode(unint64_t a1)
{
  if (a1 > 0xC)
    return 0;
  else
    return dword_226AB8814[a1];
}

double CGPointConvertToCoordinateSpace(unint64_t a1, int a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  return a7 * CGPointConvertToNormalizedCoordinateSpace(a1, a2, a3, a4, a5, a6, a7, a8);
}

CGPath *createClosedCGPathWithPoints(void *a1)
{
  id v1;
  CGPath *Mutable;
  _QWORD v4[5];

  v1 = a1;
  Mutable = CGPathCreateMutable();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __createClosedCGPathWithPoints_block_invoke;
  v4[3] = &__block_descriptor_40_e24_v32__0__NSValue_8Q16_B24l;
  v4[4] = Mutable;
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v4);

  CGPathCloseSubpath(Mutable);
  return Mutable;
}

void __createClosedCGPathWithPoints_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  CGFloat v5;
  CGFloat v6;
  CGPath *v7;

  objc_msgSend(a2, "CGPointValue");
  v7 = *(CGPath **)(a1 + 32);
  if (a3)
    CGPathAddLineToPoint(v7, 0, v5, v6);
  else
    CGPathMoveToPoint(v7, 0, v5, v6);
}

CGPathRef createExpandedClosedCGPathWithCGPath(const CGPath *a1, CGFloat a2)
{
  return CGPathCreateCopyByStrokingPath(a1, 0, a2, kCGLineCapRound, kCGLineJoinRound, 0.0);
}

void sub_226A93F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__25(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__25(uint64_t a1)
{

}

void sub_226A9441C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void setShapeLayerPathFromPointsWithStyle(void *a1, void *a2, void *a3, void *a4, void *a5, double a6, double a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  CGPath *ClosedCGPathWithPoints;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;

  v13 = a1;
  v14 = a4;
  v15 = a5;
  v16 = a3;
  ClosedCGPathWithPoints = createClosedCGPathWithPoints(a2);
  v18 = objc_retainAutorelease(v16);
  v24 = v13;
  v19 = v14;
  v20 = v15;
  v21 = objc_msgSend(v18, "CGColor");

  objc_msgSend(v24, "setFillColor:", v21);
  v22 = objc_retainAutorelease(v19);
  v23 = objc_msgSend(v22, "CGColor");

  objc_msgSend(v24, "setStrokeColor:", v23);
  objc_msgSend(v24, "setLineDashPhase:", a6);
  objc_msgSend(v24, "setLineDashPattern:", v20);

  objc_msgSend(v24, "setLineWidth:", a7);
  objc_msgSend(v24, "setPath:", ClosedCGPathWithPoints);

  CGPathRelease(ClosedCGPathWithPoints);
}

void ensureNSublayers(void *a1, unint64_t a2)
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a1;
  objc_msgSend(v14, "sublayers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") != a2)
  {
    v4 = objc_msgSend(v3, "count");
    v5 = a2 - v4;
    if (a2 > v4)
    {
      do
      {
        objc_msgSend(MEMORY[0x24BDE5758], "layer");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addSublayer:", v6);

        --v5;
      }
      while (v5);
    }
    objc_msgSend(v14, "sublayers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8 > a2)
    {
      objc_msgSend(v14, "sublayers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "copy");

      v11 = objc_msgSend(v10, "count") - a2;
      if (v11 >= 1)
      {
        v12 = 0;
        do
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "removeFromSuperlayer");

          ++v12;
        }
        while (v11 != v12);
      }
      v3 = v10;
    }
  }

}

BOOL JFXIsCTMCameraMode(uint64_t a1)
{
  return (unint64_t)(a1 - 6) < 4;
}

BOOL JFXIsCTMCroppedCameraMode(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFELL) == 8;
}

uint64_t JFXCTMCameraModeForAspectRatio(unint64_t a1)
{
  if (a1 > 4)
    return 9;
  else
    return qword_226AB88B0[a1];
}

BOOL JFXIsVideoCameraMode(uint64_t a1)
{
  return (unint64_t)(a1 - 2) < 4;
}

uint64_t JFXLowResolutionDevice()
{
  if (JFXLowResolutionDevice_onceToken != -1)
    dispatch_once(&JFXLowResolutionDevice_onceToken, &__block_literal_global_69);
  return JFXLowResolutionDevice_isLowResolutionDevice;
}

uint64_t JFXMediumResolutionDevice()
{
  if (JFXMediumResolutionDevice_onceToken != -1)
    dispatch_once(&JFXMediumResolutionDevice_onceToken, &__block_literal_global_1_1);
  return JFXMediumResolutionDevice_isMediumResolutionDevice;
}

double JFXUncroppedFrameSizeForAspectRatio(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  if (a1 > 4)
    v1 = 9;
  else
    v1 = qword_226AB88B0[a1];
  if (aspectRatioIsPortrait(a1))
    v2 = 1;
  else
    v2 = 3;
  return JFXUncroppedFrameSizeForCameraModeAndOrientation(v1, v2);
}

double JFXUncroppedFrameSizeForCameraModeAndOrientation(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  double result;
  BOOL v4;
  double v5;
  double v6;
  unint64_t v7;

  v2 = a2 - 3;
  if ((unint64_t)(a1 - 6) <= 3)
    return JFXCTMFrameSizeForCameraModeAndOrientation(6, v2 < 2);
  switch(a1)
  {
    case 1:
      v4 = v2 >= 2;
      result = 1440.0;
      goto LABEL_13;
    case 2:
    case 4:
      v4 = v2 >= 2;
      result = 1280.0;
      v5 = 720.0;
      goto LABEL_14;
    case 3:
    case 5:
      result = 1280.0;
      if (v2 >= 2)
        result = 720.0;
      if (JFXLowResolutionDevice_onceToken != -1)
      {
        v6 = result;
        v7 = a2 - 3;
        dispatch_once(&JFXLowResolutionDevice_onceToken, &__block_literal_global_69);
        v2 = v7;
        result = v6;
      }
      if ((JFXLowResolutionDevice_isLowResolutionDevice & 1) != 0)
        return result;
      v4 = v2 >= 2;
      result = 1920.0;
LABEL_13:
      v5 = 1080.0;
LABEL_14:
      if (v4)
        result = v5;
      break;
    default:
      return *MEMORY[0x24BDBF148];
  }
  return result;
}

double JFXCTMFrameSizeForCameraModeAndOrientation(uint64_t a1, int a2)
{
  uint64_t *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  int v9;
  double v10;

  if (JFXCTMFrameSizeForCameraModeAndOrientation_onceToken != -1)
    dispatch_once(&JFXCTMFrameSizeForCameraModeAndOrientation_onceToken, &__block_literal_global_21_0);
  if ((unint64_t)(a1 - 6) > 2)
    v4 = &JFXCTMFrameSizeForCameraModeAndOrientation__1_1_Resolutions;
  else
    v4 = off_24EE5C2A0[a1 - 6];
  v5 = (id)*v4;
  objc_msgSend(v5, "objectAtIndexedSubscript:", JFXCTMFrameSizeForCameraModeAndOrientation_quality);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CGSizeValue");
  if (a1 == 9)
    v9 = 1;
  else
    v9 = a2;
  if (v9)
    v10 = v7;
  else
    v10 = v8;

  return v10;
}

double JFXCroppedFrameSizeForAspectRatio(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  if (a1 > 4)
    v1 = 9;
  else
    v1 = qword_226AB88B0[a1];
  if (aspectRatioIsPortrait(a1))
    v2 = 1;
  else
    v2 = 3;
  return JFXCroppedFrameSizeForCameraModeAndOrientation(v1, v2);
}

double JFXCroppedFrameSizeForCameraModeAndOrientation(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a1 - 6) > 3)
    return JFXUncroppedFrameSizeForCameraModeAndOrientation(a1, a2);
  else
    return JFXCTMFrameSizeForCameraModeAndOrientation(a1, (unint64_t)(a2 - 3) < 2);
}

unint64_t JFXMinimumVideoDimensionsForCameraMode(uint64_t a1)
{
  double v1;
  double v2;

  v1 = 1440.0;
  if ((unint64_t)(a1 - 2) < 4)
    v1 = 1280.0;
  if ((unint64_t)(a1 - 6) > 3)
    v2 = dbl_226AB88A0[(unint64_t)(a1 - 2) < 4];
  else
    v1 = JFXCTMFrameSizeForCameraModeAndOrientation(6, 1);
  return (int)v1 | ((unint64_t)(int)v2 << 32);
}

unint64_t JFXMaximumVideoDimensionsForCameraMode(uint64_t a1)
{
  double v1;
  double v2;
  unint64_t v3;

  v1 = 1440.0;
  if ((unint64_t)(a1 - 2) < 4)
    v1 = 1920.0;
  if ((unint64_t)(a1 - 6) > 3)
  {
    v3 = 0x43800000000;
  }
  else
  {
    v1 = JFXCTMFrameSizeForCameraModeAndOrientation(6, 1);
    v3 = (unint64_t)(int)v2 << 32;
  }
  return v3 | (int)v1;
}

uint64_t JFXMaximumVideoDimensionForCameraMode(uint64_t a1)
{
  return (int)JFXMaximumVideoDimensionsForCameraMode(a1);
}

const __CFString *NSStringFromJFXCameraMode(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 8)
    return CFSTR("JFXCameraModeUnknown");
  else
    return off_24EE5C2B8[a1 - 1];
}

void sub_226A9860C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_226A9871C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)JFXGuidedUpscaler;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_226A99218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void std::swap[abi:ne180100]<objc_object  {objcproto10MTLTexture}* {__strong}>(void **a1, void **a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = *a1;
  *a1 = 0;
  v4 = *a2;
  *a2 = 0;
  v5 = *a1;
  *a1 = v4;

  v6 = *a2;
  *a2 = v3;

}

void sub_226A99830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226A99AD0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__26(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__26(uint64_t a1)
{

}

uint64_t CameraEffectsKitAppShutdown()
{
  return objc_msgSend(MEMORY[0x24BE79018], "shutdownEngine");
}

void sub_226A9B218(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_226A9B50C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_226A9B818(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_226A9BC78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__27(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__27(uint64_t a1)
{

}

void ContourProcessing::fillContourEdgeLine()
{
  __assert_rtn("fillContourEdgeLine", "JFXContourProcessing.cpp", 475, "e1._y0 < e1._y1");
}

void VTDecompressionOutputCallbackImpl(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_2269A9000, a2, OS_LOG_TYPE_DEBUG, "No sample buffer received. VTCompressionSession failed with status: %d", (uint8_t *)v2, 8u);
}

void VTCompressionOutputCallbackImpl(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_2269A9000, a2, OS_LOG_TYPE_ERROR, "No sample buffer received. VTCompressionSession failed with status: %d", (uint8_t *)v2, 8u);
}

uint64_t std::future<opaqueCMSampleBuffer *>::get(uint64_t result)
{
  unint64_t *v1;
  unint64_t v2;

  v1 = (unint64_t *)(result + 8);
  do
    v2 = __ldaxr(v1);
  while (__stlxr(v2 - 1, v1));
  if (!v2)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 16))(result);
  return result;
}

void JFX_configureCaptureDevice_cold_1(char a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a1 & 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 136315650;
  v7 = "JFX_configureCaptureDevice";
  v8 = 2112;
  v9 = v5;
  v10 = 2112;
  v11 = a2;
  _os_log_debug_impl(&dword_2269A9000, a3, OS_LOG_TYPE_DEBUG, "%s could not lock camera for configuration - locked: %@ error: %@", (uint8_t *)&v6, 0x20u);

}

void JFX_logCameraIntrinsics_cold_1(double a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  *(float *)&a1 = vmuls_lane_f32(180.0, *(float32x2_t *)&a1, 1) / 3.1416;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_2269A9000, v2, v3, "intrinsics fov y %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void JFX_logCameraIntrinsics_cold_2(double a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  *(float *)&a1 = (float)(180.0 * *(float *)&a1) / 3.1416;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_2269A9000, v2, v3, "intrinsics fov x %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void JFX_logCameraIntrinsics_cold_3(double a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  LODWORD(a1) = HIDWORD(a1);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_2269A9000, v2, v3, "intrinsics oy %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void JFX_logCameraIntrinsics_cold_4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_2269A9000, v1, v2, "intrinsics ox %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_3();
}

void JFX_logCameraIntrinsics_cold_5(double a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  LODWORD(a1) = HIDWORD(a1);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_2269A9000, v2, v3, "intrinsics fy %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void JFX_logCameraIntrinsics_cold_6()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_2269A9000, v1, v2, "intrinsics fx %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_3();
}

void JFXDistanceTransformEuclidean_cold_1()
{
  __assert_rtn("JFXDistanceTransformEuclidean", "JFXDistanceTransform.mm", 162, "height % kNumThreads == 0");
}

void JFXDistanceTransformEuclidean_cold_2()
{
  __assert_rtn("JFXDistanceTransformEuclidean", "JFXDistanceTransform.mm", 161, "width % kThinWidthCol == 0");
}

void logMetadataFromEXIFMetadata_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_2269A9000, a2, OS_LOG_TYPE_DEBUG, "kCGImagePropertyExifDictionary %@", (uint8_t *)&v2, 0xCu);
}

void createContiguousFloat32DepthImageForAVDepthData_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: unexpected pixel format", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void HEVCLosslessEncoder::Open(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, a1, a3, "############# lossless mode", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void HEVCLosslessEncoder::Open()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_5(&dword_2269A9000, v0, v1, "Assert: (%d) %s - f: %s, l: %d\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_1();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_4(&dword_2269A9000, v0, v1, "Assert: %s - f: %s, l: %d\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_1();
}

void HEVCLosslessEncoder::ConfigEncoder()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_3_3(&dword_2269A9000, v0, v1, "Profile passed unrecognized (%d). exit.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_5(&dword_2269A9000, v0, v1, "Assert: (%d) %s - f: %s, l: %d\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_1();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_3_3(&dword_2269A9000, v0, v1, "Encoder Config >> kVTCompressionPropertyKey_RealTime = %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_5(&dword_2269A9000, v0, v1, "Assert: (%d) %s - f: %s, l: %d\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_1();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_3_3(&dword_2269A9000, v0, v1, "Encoder Config >> kVTCompressionPropertyKey_Quality (lossless) = %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_4(&dword_2269A9000, v0, v1, "Assert: %s - f: %s, l: %d\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_1();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_4(&dword_2269A9000, v0, v1, "Assert: %s - f: %s, l: %d\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_1();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_4(&dword_2269A9000, v0, v1, "Assert: %s - f: %s, l: %d\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_1();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_3_3(&dword_2269A9000, v0, v1, "Encoder Config >> kVTCompressionPropertyKey_AllowFrameReordering = %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_4(&dword_2269A9000, v0, v1, "Assert: %s - f: %s, l: %d\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_1();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_3_3(&dword_2269A9000, v0, v1, "Encoder Config >> kVTCompressionPropertyKey_ProfileLevel = %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_5(&dword_2269A9000, v0, v1, "Assert: (%d) %s - f: %s, l: %d\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_1();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_3_3(&dword_2269A9000, v0, v1, "Encoder Config >> kVTCompressionPropertyKey_Usage = %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void HEVCLosslessEncoder::ConfigEncoder(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, a1, a3, "*-----------------------------------------------------------------------------*", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void HEVCLosslessEncoder::ConfigEncoder(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2269A9000, a2, a3, "Encoder Config >> kVTCompressionPropertyKey_ExpectedFrameRate = %f", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0_1(&dword_2269A9000, a2, a3, "Encoder Config >> kVTCompressionPropertyKey_MaxKeyFrameIntervalDuration = %f", a5, a6, a7, a8, 0);
}

void HEVCLosslessEncoder::EncodeFrame()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_5(&dword_2269A9000, v0, v1, "Assert: (%d) %s - f: %s, l: %d\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_1();
}

void JFXConvertFloatDepthImageToFixedPointAtQuarterResolution_cold_1()
{
  __assert_rtn("JFXConvertFloatDepthImageToFixedPointAtQuarterResolution", "JFXMattingUtils.m", 86, "srcWidth > 0 && srcWidth % 8 == 0");
}

void JFXConvertFloatDepthImageToFixedPointAtQuarterResolution_cold_2()
{
  __assert_rtn("JFXConvertFloatDepthImageToFixedPointAtQuarterResolution", "JFXMattingUtils.m", 87, "srcHeight > 0 && srcHeight % kDepthImageVerticalSubsamplingFactor == 0");
}

void JFXConvertFloatDepthImageToFixedPointAtQuarterResolution_cold_3()
{
  __assert_rtn("JFXConvertFloatDepthImageToFixedPointAtQuarterResolution", "JFXMattingUtils.m", 88, "srcStride >= srcWidth * sizeof(float)");
}

void JFXConvertFloatDepthImageToFixedPointAndTranspose_cold_1()
{
  __assert_rtn("JFXConvertFloatDepthImageToFixedPointAndTranspose", "JFXMattingUtils.m", 120, "srcWidth > 0 && srcWidth % 4 == 0");
}

void JFXConvertFloatDepthImageToFixedPointAndTranspose_cold_2()
{
  __assert_rtn("JFXConvertFloatDepthImageToFixedPointAndTranspose", "JFXMattingUtils.m", 121, "srcHeight > 0 && srcHeight % 4 == 0");
}

void JFXConvertFloatDepthImageToFixedPointAndTranspose_cold_3()
{
  __assert_rtn("JFXConvertFloatDepthImageToFixedPointAndTranspose", "JFXMattingUtils.m", 122, "(void*)pvSrc != (void*)pvDst");
}

void JFXConvertFloatDepthImageToFixedPointAndTranspose_cold_4()
{
  __assert_rtn("JFXConvertFloatDepthImageToFixedPointAndTranspose", "JFXMattingUtils.m", 119, "srcDepthImageVB.rowBytes == srcWidth * sizeof(float)");
}

void copyDepthToDoubleWidthDoubleHeight_cold_1()
{
  __assert_rtn("copyDepthToDoubleWidthDoubleHeight", "JFXMattingUtils.m", 412, "CVPixelBufferGetBytesPerRow(dst) % sizeof(float) == 0");
}

void copyDepthToDoubleWidthDoubleHeight_cold_2()
{
  __assert_rtn("copyDepthToDoubleWidthDoubleHeight", "JFXMattingUtils.m", 411, "CVPixelBufferGetBytesPerRow(src) % sizeof(float) == 0");
}

CGRect AVMakeRectWithAspectRatioInsideRect(CGSize aspectRatio, CGRect boundingRect)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDB1C88]((__n128)aspectRatio, *(__n128 *)&aspectRatio.height, (__n128)boundingRect.origin, *(__n128 *)&boundingRect.origin.y, (__n128)boundingRect.size, *(__n128 *)&boundingRect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t AVTAvatarKitVersionNumber()
{
  return MEMORY[0x24BE0B3C8]();
}

uint64_t AVTInitializeShaderCache()
{
  return MEMORY[0x24BE0B3D0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

void AudioServicesPlaySystemSoundWithCompletion(SystemSoundID inSystemSoundID, void *inCompletionBlock)
{
  MEMORY[0x24BDB6988](*(_QWORD *)&inSystemSoundID, inCompletionBlock);
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x24BDE5410]();
  return result;
}

CATransform3D *__cdecl CATransform3DConcat(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return (CATransform3D *)MEMORY[0x24BDE5578](retstr, a, b);
}

CATransform3D *__cdecl CATransform3DInvert(CATransform3D *__return_ptr retstr, CATransform3D *t)
{
  return (CATransform3D *)MEMORY[0x24BDE55A8](retstr, t);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x24BDE55D0](retstr, sx, sy, sz);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB0](allocator, capacity);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
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

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8A0](retstr, t1, t2);
}

uint64_t CGAffineTransformFromPVAnimInfo()
{
  return MEMORY[0x24BE78FC0]();
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8C0](retstr, t);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x24BDBD8C8](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8D8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8F8](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD900](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD908](retstr, t, tx, ty);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBB8](name);
}

CFStringRef CGColorSpaceGetName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x24BDBDC18](space);
}

BOOL CGColorSpaceIsWideGamutRGB(CGColorSpaceRef a1)
{
  return MEMORY[0x24BDBDC58](a1);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE70](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x24BDBDF58](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x24BDBDF70](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x24BDBDF78](c, sx, sy);
}

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
  MEMORY[0x24BDBDFA0](c, alpha);
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
  MEMORY[0x24BDBDFB0](c, *(_QWORD *)&mode);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBDFD8](c, color);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x24BDBE130](c, tx, ty);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE180](data);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x24BDBE1C8](provider);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x24BDBE5E0](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(_QWORD *)&bitmapInfo, provider);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x24BDBE5F8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddAuxiliaryDataInfo(CGImageDestinationRef idst, CFStringRef auxiliaryImageDataType, CFDictionaryRef auxiliaryDataInfoDictionary)
{
  MEMORY[0x24BDD9040](idst, auxiliaryImageDataType, auxiliaryDataInfoDictionary);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x24BDD9048](idst, image, properties);
}

void CGImageDestinationAddImageAndMetadata(CGImageDestinationRef idst, CGImageRef image, CGImageMetadataRef metadata, CFDictionaryRef options)
{
  MEMORY[0x24BDD9050](idst, image, metadata, options);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x24BDD9078](data, type, count, options);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x24BDD9088](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x24BDD9090](idst);
}

void CGImageDestinationSetProperties(CGImageDestinationRef idst, CFDictionaryRef properties)
{
  MEMORY[0x24BDD9098](idst, properties);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x24BDBE648](image);
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

CGImageMetadataRef CGImageMetadataCreateFromXMPData(CFDataRef data)
{
  return (CGImageMetadataRef)MEMORY[0x24BDD90C0](data);
}

CGMutableImageMetadataRef CGImageMetadataCreateMutable(void)
{
  return (CGMutableImageMetadataRef)MEMORY[0x24BDD90C8]();
}

CGMutableImageMetadataRef CGImageMetadataCreateMutableCopy(CGImageMetadataRef metadata)
{
  return (CGMutableImageMetadataRef)MEMORY[0x24BDD90D0](metadata);
}

CFDataRef CGImageMetadataCreateXMPData(CGImageMetadataRef metadata, CFDictionaryRef options)
{
  return (CFDataRef)MEMORY[0x24BDD90D8](metadata, options);
}

BOOL CGImageMetadataRegisterNamespaceForPrefix(CGMutableImageMetadataRef metadata, CFStringRef xmlns, CFStringRef prefix, CFErrorRef *err)
{
  return MEMORY[0x24BDD90E8](metadata, xmlns, prefix, err);
}

BOOL CGImageMetadataRemoveTagWithPath(CGMutableImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path)
{
  return MEMORY[0x24BDD90F0](metadata, parent, path);
}

BOOL CGImageMetadataSetTagWithPath(CGMutableImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path, CGImageMetadataTagRef tag)
{
  return MEMORY[0x24BDD90F8](metadata, parent, path, tag);
}

CGImageMetadataTagRef CGImageMetadataTagCreate(CFStringRef xmlns, CFStringRef prefix, CFStringRef name, CGImageMetadataType type, CFTypeRef value)
{
  return (CGImageMetadataTagRef)MEMORY[0x24BDD9128](xmlns, prefix, name, *(_QWORD *)&type, value);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x24BDBE778](image);
}

CFDictionaryRef CGImageSourceCopyAuxiliaryDataInfoAtIndex(CGImageSourceRef isrc, size_t index, CFStringRef auxiliaryImageDataType)
{
  return (CFDictionaryRef)MEMORY[0x24BDD9130](isrc, index, auxiliaryImageDataType);
}

CGImageMetadataRef CGImageSourceCopyMetadataAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageMetadataRef)MEMORY[0x24BDD9138](isrc, index, options);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x24BDD9148](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x24BDD9158](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9170](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9180](url, options);
}

size_t CGImageSourceGetPrimaryImageIndex(CGImageSourceRef isrc)
{
  return MEMORY[0x24BDD9190](isrc);
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEDC8](path, m, x, y);
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
  MEMORY[0x24BDBEE20](path);
}

BOOL CGPathContainsPoint(CGPathRef path, const CGAffineTransform *m, CGPoint point, BOOL eoFill)
{
  return MEMORY[0x24BDBEE28](path, m, eoFill, (__n128)point, *(__n128 *)&point.y);
}

CGPathRef CGPathCreateCopyByStrokingPath(CGPathRef path, const CGAffineTransform *transform, CGFloat lineWidth, CGLineCap lineCap, CGLineJoin lineJoin, CGFloat miterLimit)
{
  return (CGPathRef)MEMORY[0x24BDBEE48](path, transform, *(_QWORD *)&lineCap, *(_QWORD *)&lineJoin, lineWidth, miterLimit);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x24BDBEE80]();
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x24BDBEEA0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGPathGetPathBoundingBox(CGPathRef path)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBEEE0](path);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEF40](path, m, x, y);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x24BDBEF48](path);
}

CGPathRef CGPathRetain(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x24BDBEF50](path);
}

CGPoint CGPointFromString(NSString *string)
{
  double v1;
  double v2;
  CGPoint result;

  MEMORY[0x24BDF65A8](string);
  result.y = v2;
  result.x = v1;
  return result;
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

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFC8]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x24BDBF060]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x24BDBF068](dict, rect);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF078]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
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

  MEMORY[0x24BDBF088]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

Boolean CMAudioFormatDescriptionEqual(CMAudioFormatDescriptionRef formatDescription, CMAudioFormatDescriptionRef otherFormatDescription, CMAudioFormatDescriptionMask equalityMask, CMAudioFormatDescriptionMask *equalityMaskOut)
{
  return MEMORY[0x24BDC0048](formatDescription, otherFormatDescription, *(_QWORD *)&equalityMask, equalityMaskOut);
}

const AudioStreamBasicDescription *__cdecl CMAudioFormatDescriptionGetStreamBasicDescription(CMAudioFormatDescriptionRef desc)
{
  return (const AudioStreamBasicDescription *)MEMORY[0x24BDC0058](desc);
}

OSStatus CMBlockBufferAppendBufferReference(CMBlockBufferRef theBuffer, CMBlockBufferRef targetBBuf, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags)
{
  return MEMORY[0x24BDC00A0](theBuffer, targetBBuf, offsetToData, dataLength, *(_QWORD *)&flags);
}

OSStatus CMBlockBufferCopyDataBytes(CMBlockBufferRef theSourceBuffer, size_t offsetToData, size_t dataLength, void *destination)
{
  return MEMORY[0x24BDC00B0](theSourceBuffer, offsetToData, dataLength, destination);
}

OSStatus CMBlockBufferCreateContiguous(CFAllocatorRef structureAllocator, CMBlockBufferRef sourceBuffer, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x24BDC00B8](structureAllocator, sourceBuffer, blockAllocator, customBlockSource, offsetToData, dataLength, *(_QWORD *)&flags, blockBufferOut);
}

OSStatus CMBlockBufferCreateWithMemoryBlock(CFAllocatorRef structureAllocator, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x24BDC00C0](structureAllocator, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(_QWORD *)&flags);
}

size_t CMBlockBufferGetDataLength(CMBlockBufferRef theBuffer)
{
  return MEMORY[0x24BDC00D0](theBuffer);
}

OSStatus CMBlockBufferGetDataPointer(CMBlockBufferRef theBuffer, size_t offset, size_t *lengthAtOffsetOut, size_t *totalLengthOut, char **dataPointerOut)
{
  return MEMORY[0x24BDC00D8](theBuffer, offset, lengthAtOffsetOut, totalLengthOut, dataPointerOut);
}

CMClockRef CMClockGetHostTimeClock(void)
{
  return (CMClockRef)MEMORY[0x24BDC0150]();
}

CMTime *__cdecl CMClockGetTime(CMTime *__return_ptr retstr, CMClockRef clock)
{
  return (CMTime *)MEMORY[0x24BDC0158](retstr, clock);
}

Boolean CMFormatDescriptionEqual(CMFormatDescriptionRef formatDescription, CMFormatDescriptionRef otherFormatDescription)
{
  return MEMORY[0x24BDC0190](formatDescription, otherFormatDescription);
}

CFPropertyListRef CMFormatDescriptionGetExtension(CMFormatDescriptionRef desc, CFStringRef extensionKey)
{
  return (CFPropertyListRef)MEMORY[0x24BDC01A8](desc, extensionKey);
}

CFDictionaryRef CMFormatDescriptionGetExtensions(CMFormatDescriptionRef desc)
{
  return (CFDictionaryRef)MEMORY[0x24BDC01B8](desc);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x24BDC01C0](desc);
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x24BDC01E0](target, key, attachmentModeOut);
}

OSStatus CMMetadataFormatDescriptionCreateWithMetadataSpecifications(CFAllocatorRef allocator, CMMetadataFormatType metadataType, CFArrayRef metadataSpecifications, CMMetadataFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x24BDC0208](allocator, *(_QWORD *)&metadataType, metadataSpecifications, formatDescriptionOut);
}

CFArrayRef CMMetadataFormatDescriptionGetIdentifiers(CMMetadataFormatDescriptionRef desc)
{
  return (CFArrayRef)MEMORY[0x24BDC0218](desc);
}

OSStatus CMSampleBufferCreate(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x24BDC0270](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, numSampleTimingEntries);
}

OSStatus CMSampleBufferCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMVideoFormatDescriptionRef formatDescription, const CMSampleTimingInfo *sampleTiming, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x24BDC0290](allocator, imageBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, sampleTiming, sampleBufferOut);
}

OSStatus CMSampleBufferCreateReady(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x24BDC0298](allocator, dataBuffer, formatDescription, numSamples, numSampleTimingEntries, sampleTimingArray, numSampleSizeEntries, sampleSizeArray);
}

OSStatus CMSampleBufferCreateReadyWithImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, CMVideoFormatDescriptionRef formatDescription, const CMSampleTimingInfo *sampleTiming, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x24BDC02A0](allocator, imageBuffer, formatDescription, sampleTiming, sampleBufferOut);
}

CMBlockBufferRef CMSampleBufferGetDataBuffer(CMSampleBufferRef sbuf)
{
  return (CMBlockBufferRef)MEMORY[0x24BDC02B8](sbuf);
}

CMTime *__cdecl CMSampleBufferGetDuration(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x24BDC02D0](retstr, sbuf);
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return (CMFormatDescriptionRef)MEMORY[0x24BDC02E0](sbuf);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x24BDC02E8](sbuf);
}

CMTime *__cdecl CMSampleBufferGetOutputPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x24BDC0310](retstr, sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x24BDC0320](retstr, sbuf);
}

CFArrayRef CMSampleBufferGetSampleAttachmentsArray(CMSampleBufferRef sbuf, Boolean createIfNecessary)
{
  return (CFArrayRef)MEMORY[0x24BDC0330](sbuf, createIfNecessary);
}

size_t CMSampleBufferGetSampleSize(CMSampleBufferRef sbuf, CMItemIndex sampleIndex)
{
  return MEMORY[0x24BDC0338](sbuf, sampleIndex);
}

OSStatus CMSampleBufferGetSampleTimingInfo(CMSampleBufferRef sbuf, CMItemIndex sampleIndex, CMSampleTimingInfo *timingInfoOut)
{
  return MEMORY[0x24BDC0340](sbuf, sampleIndex, timingInfoOut);
}

void CMSetAttachment(CMAttachmentBearerRef target, CFStringRef key, CFTypeRef value, CMAttachmentMode attachmentMode)
{
  MEMORY[0x24BDC0380](target, key, value, *(_QWORD *)&attachmentMode);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x24BDC0420](retstr, lhs, rhs);
}

CMTime *__cdecl CMTimeClampToRange(CMTime *__return_ptr retstr, CMTime *time, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x24BDC0430](retstr, time, range);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x24BDC0450](time1, time2);
}

CMTime *__cdecl CMTimeConvertScale(CMTime *__return_ptr retstr, CMTime *time, int32_t newTimescale, CMTimeRoundingMethod method)
{
  return (CMTime *)MEMORY[0x24BDC0460](retstr, time, *(_QWORD *)&newTimescale, *(_QWORD *)&method);
}

CFStringRef CMTimeCopyDescription(CFAllocatorRef allocator, CMTime *time)
{
  return (CFStringRef)MEMORY[0x24BDC0478](allocator, time);
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

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x24BDC04C0](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

CMTimeMapping *__cdecl CMTimeMappingMake(CMTimeMapping *__return_ptr retstr, CMTimeRange *source, CMTimeRange *target)
{
  return (CMTimeMapping *)MEMORY[0x24BDC04D0](retstr, source, target);
}

CMTime *__cdecl CMTimeMaximum(CMTime *__return_ptr retstr, CMTime *time1, CMTime *time2)
{
  return (CMTime *)MEMORY[0x24BDC04D8](retstr, time1, time2);
}

CMTime *__cdecl CMTimeMinimum(CMTime *__return_ptr retstr, CMTime *time1, CMTime *time2)
{
  return (CMTime *)MEMORY[0x24BDC04E0](retstr, time1, time2);
}

CMTime *__cdecl CMTimeMultiply(CMTime *__return_ptr retstr, CMTime *time, int32_t multiplier)
{
  return (CMTime *)MEMORY[0x24BDC04E8](retstr, time, *(_QWORD *)&multiplier);
}

CMTime *__cdecl CMTimeMultiplyByFloat64(CMTime *__return_ptr retstr, CMTime *time, Float64 multiplier)
{
  return (CMTime *)MEMORY[0x24BDC04F0](retstr, time, multiplier);
}

Boolean CMTimeRangeContainsTime(CMTimeRange *range, CMTime *time)
{
  return MEMORY[0x24BDC0508](range, time);
}

Boolean CMTimeRangeContainsTimeRange(CMTimeRange *range, CMTimeRange *otherRange)
{
  return MEMORY[0x24BDC0510](range, otherRange);
}

CFStringRef CMTimeRangeCopyDescription(CFAllocatorRef allocator, CMTimeRange *range)
{
  return (CFStringRef)MEMORY[0x24BDC0530](allocator, range);
}

Boolean CMTimeRangeEqual(CMTimeRange *range1, CMTimeRange *range2)
{
  return MEMORY[0x24BDC0538](range1, range2);
}

CMTimeRange *__cdecl CMTimeRangeFromTimeToTime(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *end)
{
  return (CMTimeRange *)MEMORY[0x24BDC0550](retstr, start, end);
}

CMTime *__cdecl CMTimeRangeGetEnd(CMTime *__return_ptr retstr, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x24BDC0558](retstr, range);
}

CMTimeRange *__cdecl CMTimeRangeGetIntersection(CMTimeRange *__return_ptr retstr, CMTimeRange *range, CMTimeRange *otherRange)
{
  return (CMTimeRange *)MEMORY[0x24BDC0568](retstr, range, otherRange);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x24BDC0580](retstr, start, duration);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x24BDC05A0](retstr, lhs, rhs);
}

OSStatus CMVideoFormatDescriptionCreate(CFAllocatorRef allocator, CMVideoCodecType codecType, int32_t width, int32_t height, CFDictionaryRef extensions, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x24BDC0638](allocator, *(_QWORD *)&codecType, *(_QWORD *)&width, *(_QWORD *)&height, extensions, formatDescriptionOut);
}

OSStatus CMVideoFormatDescriptionCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x24BDC0648](allocator, imageBuffer, formatDescriptionOut);
}

OSStatus CMVideoFormatDescriptionCreateFromHEVCParameterSets(CFAllocatorRef allocator, size_t parameterSetCount, const uint8_t *const *parameterSetPointers, const size_t *parameterSetSizes, int NALUnitHeaderLength, CFDictionaryRef extensions, CMFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x24BDC0658](allocator, parameterSetCount, parameterSetPointers, parameterSetSizes, *(_QWORD *)&NALUnitHeaderLength, extensions, formatDescriptionOut);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x24BDC0668](videoDesc);
}

OSStatus CMVideoFormatDescriptionGetHEVCParameterSetAtIndex(CMFormatDescriptionRef videoDesc, size_t parameterSetIndex, const uint8_t **parameterSetPointerOut, size_t *parameterSetSizeOut, size_t *parameterSetCountOut, int *NALUnitHeaderLengthOut)
{
  return MEMORY[0x24BDC0678](videoDesc, parameterSetIndex, parameterSetPointerOut, parameterSetSizeOut, parameterSetCountOut, NALUnitHeaderLengthOut);
}

CFTypeRef CVBufferCopyAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return (CFTypeRef)MEMORY[0x24BDC5138](buffer, key, attachmentMode);
}

CFDictionaryRef CVBufferCopyAttachments(CVBufferRef buffer, CVAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x24BDC5140](buffer, *(_QWORD *)&attachmentMode);
}

void CVBufferPropagateAttachments(CVBufferRef sourceBuffer, CVBufferRef destinationBuffer)
{
  MEMORY[0x24BDC5160](sourceBuffer, destinationBuffer);
}

void CVBufferRelease(CVBufferRef buffer)
{
  MEMORY[0x24BDC5168](buffer);
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
  MEMORY[0x24BDC5180](buffer, key, value, *(_QWORD *)&attachmentMode);
}

CVReturn CVMetalTextureCacheCreate(CFAllocatorRef allocator, CFDictionaryRef cacheAttributes, id metalDevice, CFDictionaryRef textureAttributes, CVMetalTextureCacheRef *cacheOut)
{
  return MEMORY[0x24BDC51F8](allocator, cacheAttributes, metalDevice, textureAttributes, cacheOut);
}

CVReturn CVMetalTextureCacheCreateTextureFromImage(CFAllocatorRef allocator, CVMetalTextureCacheRef textureCache, CVImageBufferRef sourceImage, CFDictionaryRef textureAttributes, MTLPixelFormat pixelFormat, size_t width, size_t height, size_t planeIndex, CVMetalTextureRef *textureOut)
{
  return MEMORY[0x24BDC5200](allocator, textureCache, sourceImage, textureAttributes, pixelFormat, width, height, planeIndex);
}

void CVMetalTextureCacheFlush(CVMetalTextureCacheRef textureCache, CVOptionFlags options)
{
  MEMORY[0x24BDC5208](textureCache, options);
}

id CVMetalTextureGetTexture(CVMetalTextureRef image)
{
  return (id)MEMORY[0x24BDC5210](image);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5248](allocator, width, height, *(_QWORD *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithBytes(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, void *baseAddress, size_t bytesPerRow, CVPixelBufferReleaseBytesCallback releaseCallback, void *releaseRefCon, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5250](allocator, width, height, *(_QWORD *)&pixelFormatType, baseAddress, bytesPerRow, releaseCallback, releaseRefCon);
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

size_t CVPixelBufferGetDataSize(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52A0](pixelBuffer);
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

void CVPixelBufferPoolFlush(CVPixelBufferPoolRef pool, CVPixelBufferPoolFlushFlags options)
{
  MEMORY[0x24BDC5338](pool, options);
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

uint64_t CreatePVLPThrottlingControlParameters()
{
  return MEMORY[0x24BE78FC8]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x24BDDD1E0]();
}

NSArray *__cdecl NSAllMapTableKeys(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x24BDD0B30](table);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x24BDD1208](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromCGAffineTransform(CGAffineTransform *transform)
{
  return (NSString *)MEMORY[0x24BDF6660](transform);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x24BDF6668]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x24BDF6670]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x24BDF6678]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t NSStringFromPVCGPointQuad()
{
  return MEMORY[0x24BE78FD0]();
}

uint64_t NSStringFromSIMDDouble4x4()
{
  return MEMORY[0x24BE78FD8]();
}

uint64_t NSStringFromSIMDFloat3()
{
  return MEMORY[0x24BE78FE0]();
}

uint64_t NSStringFromSIMDFloat4()
{
  return MEMORY[0x24BE78FE8]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

uint64_t PVTransformAnimationInfoForLiveCapture()
{
  return MEMORY[0x24BE790F0]();
}

uint64_t PVTransformAnimationInfoIdentity()
{
  return MEMORY[0x24BE790F8]();
}

uint64_t PVTransformAnimationInfoIsIdentity()
{
  return MEMORY[0x24BE79100]();
}

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x24BDF74F0]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BDF78C8](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BDF78D0]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BDF78D8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BDF78E0]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x24BDF7920](image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x24BDF7928](image);
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x24BDF7CD8]();
}

OSStatus VTCompressionSessionCompleteFrames(VTCompressionSessionRef session, CMTime *completeUntilPresentationTimeStamp)
{
  return MEMORY[0x24BDF8FD0](session, completeUntilPresentationTimeStamp);
}

OSStatus VTCompressionSessionCreate(CFAllocatorRef allocator, int32_t width, int32_t height, CMVideoCodecType codecType, CFDictionaryRef encoderSpecification, CFDictionaryRef sourceImageBufferAttributes, CFAllocatorRef compressedDataAllocator, VTCompressionOutputCallback outputCallback, void *outputCallbackRefCon, VTCompressionSessionRef *compressionSessionOut)
{
  return MEMORY[0x24BDF8FD8](allocator, *(_QWORD *)&width, *(_QWORD *)&height, *(_QWORD *)&codecType, encoderSpecification, sourceImageBufferAttributes, compressedDataAllocator, outputCallback);
}

OSStatus VTCompressionSessionEncodeFrame(VTCompressionSessionRef session, CVImageBufferRef imageBuffer, CMTime *presentationTimeStamp, CMTime *duration, CFDictionaryRef frameProperties, void *sourceFrameRefcon, VTEncodeInfoFlags *infoFlagsOut)
{
  return MEMORY[0x24BDF8FE8](session, imageBuffer, presentationTimeStamp, duration, frameProperties, sourceFrameRefcon, infoFlagsOut);
}

OSStatus VTDecompressionSessionCreate(CFAllocatorRef allocator, CMVideoFormatDescriptionRef videoFormatDescription, CFDictionaryRef videoDecoderSpecification, CFDictionaryRef destinationImageBufferAttributes, const VTDecompressionOutputCallbackRecord *outputCallback, VTDecompressionSessionRef *decompressionSessionOut)
{
  return MEMORY[0x24BDF9060](allocator, videoFormatDescription, videoDecoderSpecification, destinationImageBufferAttributes, outputCallback, decompressionSessionOut);
}

OSStatus VTDecompressionSessionDecodeFrame(VTDecompressionSessionRef session, CMSampleBufferRef sampleBuffer, VTDecodeFrameFlags decodeFlags, void *sourceFrameRefCon, VTDecodeInfoFlags *infoFlagsOut)
{
  return MEMORY[0x24BDF9068](session, sampleBuffer, *(_QWORD *)&decodeFlags, sourceFrameRefCon, infoFlagsOut);
}

OSStatus VTDecompressionSessionFinishDelayedFrames(VTDecompressionSessionRef session)
{
  return MEMORY[0x24BDF9080](session);
}

OSStatus VTPixelRotationSessionCreate(CFAllocatorRef allocator, VTPixelRotationSessionRef *pixelRotationSessionOut)
{
  return MEMORY[0x24BDF9148](allocator, pixelRotationSessionOut);
}

void VTPixelRotationSessionInvalidate(VTPixelRotationSessionRef session)
{
  MEMORY[0x24BDF9150](session);
}

OSStatus VTPixelRotationSessionRotateImage(VTPixelRotationSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x24BDF9158](session, sourceBuffer, destinationBuffer);
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

uint64_t pv_simd_normalize()
{
  return MEMORY[0x24BE79110]();
}

uint64_t pv_bounding_CGRect(PVCGPointQuad *a1)
{
  return MEMORY[0x24BE79118](a1);
}

uint64_t MakePVFaceDetection(AVMetadataFaceObject *a1, AVCaptureVideoOrientation a2)
{
  return MEMORY[0x24BE79120](a1, a2);
}

uint64_t pv_simd_matrix_lerp(simd_float4x4 a1, simd_float4x4 a2, float a3)
{
  return MEMORY[0x24BE79128]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3], (__n128)a2.columns[0], (__n128)a2.columns[1], (__n128)a2.columns[2], (__n128)a2.columns[3]);
}

uint64_t pv_CGRect_to_NSArray(CGRect a1)
{
  return MEMORY[0x24BE79130]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

uint64_t pv_simd_matrix_scale(simd_float4x4 a1, float a2, float a3, float a4)
{
  return MEMORY[0x24BE79138]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3], a2, a3, a4);
}

uint64_t pv_simd_matrix_scale()
{
  return MEMORY[0x24BE79140]();
}

uint64_t pv_is_CGPoint_in_quad(CGPoint a1, PVCGPointQuad *a2)
{
  return MEMORY[0x24BE79148](a2, (__n128)a1, *(__n128 *)&a1.y);
}

uint64_t pv_simd_matrix_rotate()
{
  return MEMORY[0x24BE79150]();
}

{
  return MEMORY[0x24BE79158]();
}

uint64_t pv_fov_from_intrinsics()
{
  return MEMORY[0x24BE79160]();
}

uint64_t pv_transform_info_make()
{
  return MEMORY[0x24BE79168]();
}

uint64_t MakePVFaceDetectionFull(uint64_t a1, uint64_t a2, double a3, uint64_t a4, double a5, CGRect a6, AVCaptureVideoOrientation a7, CMTime *a8, AVMetadataFaceObject *a9)
{
  return MEMORY[0x24BE79170](a1, a2, a4, a7, a8, a9, a3, a5, (__n128)a6.origin, *(__n128 *)&a6.origin.y, (__n128)a6.size, *(__n128 *)&a6.size.height);
}

uint64_t PVCGPointQuad_to_NSArray(PVCGPointQuad *a1)
{
  return MEMORY[0x24BE79178](a1);
}

uint64_t pv_simd_matrix_translate()
{
  return MEMORY[0x24BE79180]();
}

{
  return MEMORY[0x24BE79188]();
}

uint64_t MakePVCameraFrameMetadata(AVCaptureDevicePosition a1, CMQuaternion a2, double a3, UIInterfaceOrientation a4, AVCaptureVideoOrientation a5)
{
  return MEMORY[0x24BE79190](a1, a4, a5, *(__n128 *)&a2.x, *(__n128 *)&a2.y, *(__n128 *)&a2.z, *(__n128 *)&a2.w, a3);
}

uint64_t PVCGPointQuad_from_CGRect(CGRect a1)
{
  return MEMORY[0x24BE79198]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

uint64_t pv_CGPoint_get_quad_center(PVCGPointQuad *a1)
{
  return MEMORY[0x24BE791A0](a1);
}

uint64_t pv_projected_pixels_per_unit()
{
  return MEMORY[0x24BE791A8]();
}

uint64_t pv_adjust_transform_orientation()
{
  return MEMORY[0x24BE791B0]();
}

uint64_t pv_focal_length_from_intrinsics(simd_float3x3 a1)
{
  return MEMORY[0x24BE791B8]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2]);
}

uint64_t pv_simd_matrix_get_euler_angles()
{
  return MEMORY[0x24BE791C0]();
}

uint64_t pv_simd_matrix_make_perspective()
{
  return MEMORY[0x24BE791C8]();
}

{
  return MEMORY[0x24BE791D0]();
}

uint64_t pv_simd_matrix_transform_vector()
{
  return MEMORY[0x24BE791D8]();
}

uint64_t PVCGPointQuad_get_point_at_index(PVCGPointQuad *a1)
{
  return MEMORY[0x24BE791E0](a1);
}

uint64_t PVCGPointQuad_set_point_at_index(PVCGPointQuad *a1, CGPoint a2)
{
  return MEMORY[0x24BE791E8](a1, (__n128)a2, *(__n128 *)&a2.y);
}

uint64_t pv_fov_for_focal_length_and_side(double a1, double a2)
{
  return MEMORY[0x24BE791F0](a1, a2);
}

uint64_t pv_simd_matrix_make_orthographic()
{
  return MEMORY[0x24BE791F8]();
}

uint64_t pv_simd_matrix_unproject_to_plane()
{
  return MEMORY[0x24BE79200]();
}

{
  return MEMORY[0x24BE79208]();
}

uint64_t pv_principal_point_from_intrinsics(simd_float3x3 a1)
{
  return MEMORY[0x24BE79210]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2]);
}

uint64_t pv_resolution_from_principal_point()
{
  return MEMORY[0x24BE79218]();
}

uint64_t pv_simd_matrix_get_rotation_matrix(simd_float4x4 a1)
{
  return MEMORY[0x24BE79220]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3]);
}

uint64_t pv_simd_quaternion_get_euler_angles()
{
  return MEMORY[0x24BE79228]();
}

uint64_t CGAffineTransformFromPointWithPVAnimInfo(PVTransformAnimationInfo *a1, CGPoint a2)
{
  return MEMORY[0x24BE79230](a1, (__n128)a2, *(__n128 *)&a2.y);
}

uint64_t pv_simd_matrix_convert_coordinate_system()
{
  return MEMORY[0x24BE79238]();
}

uint64_t pv_intrinsics_from_fov_side_and_resolution()
{
  return MEMORY[0x24BE79240]();
}

uint64_t pv_intrinsics_from_focal_length_and_principal_point()
{
  return MEMORY[0x24BE79248]();
}

uint64_t pv_transform_PVCGPointQuad_between_coordinate_systems()
{
  return MEMORY[0x24BE79250]();
}

uint64_t pv_projected_screen_aligned_bounding_rect_around_point()
{
  return MEMORY[0x24BE79258]();
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::logic_error *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAB8](this, a2);
}

std::exception_ptr *__cdecl std::exception_ptr::exception_ptr(std::exception_ptr *this, const std::exception_ptr *a2)
{
  return (std::exception_ptr *)MEMORY[0x24BEDAB18](this, a2);
}

void std::exception_ptr::~exception_ptr(std::exception_ptr *this)
{
  MEMORY[0x24BEDAB20](this);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

std::future_error *__cdecl std::future_error::future_error(std::future_error *this, std::error_code __ec)
{
  return (std::future_error *)MEMORY[0x24BEDAD78](this, *(_QWORD *)&__ec.__val_, __ec.__cat_);
}

void std::future_error::~future_error(std::future_error *this)
{
  MEMORY[0x24BEDAD80](this);
}

void std::__shared_count::~__shared_count(std::__shared_count *this)
{
  MEMORY[0x24BEDAFF8](this);
}

const std::error_category *std::future_category(void)
{
  return (const std::error_category *)MEMORY[0x24BEDB080]();
}

void std::__assoc_sub_state::__sub_wait(std::__assoc_sub_state *this, std::unique_lock<std::mutex> *__lk)
{
  MEMORY[0x24BEDB0C0](this, __lk);
}

void std::__assoc_sub_state::set_exception(std::__assoc_sub_state *this, std::exception_ptr __p)
{
  MEMORY[0x24BEDB0C8](this, __p.__ptr_);
}

void std::condition_variable::notify_all(std::condition_variable *this)
{
  MEMORY[0x24BEDB0F8](this);
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
  MEMORY[0x24BEDB118](this);
}

void std::mutex::lock(std::mutex *this)
{
  MEMORY[0x24BEDB368](this);
}

void std::mutex::unlock(std::mutex *this)
{
  MEMORY[0x24BEDB370](this);
}

void std::mutex::~mutex(std::mutex *this)
{
  MEMORY[0x24BEDB380](this);
}

std::exception_ptr std::current_exception(void)
{
  return (std::exception_ptr)MEMORY[0x24BEDB6A0]();
}

void std::rethrow_exception(std::exception_ptr a1)
{
  MEMORY[0x24BEDB6A8](a1.__ptr_);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete[]()
{
  return off_24EE56CC8();
}

void operator delete(void *__p)
{
  off_24EE56CD0(__p);
}

uint64_t operator delete()
{
  return off_24EE56CD8();
}

uint64_t operator new[]()
{
  return off_24EE56CE0();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24EE56CE8(__sz);
}

uint64_t operator new()
{
  return off_24EE56CF0();
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

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

long double acos(long double __x)
{
  long double result;

  MEMORY[0x24BDAD108](__x);
  return result;
}

long double atan(long double __x)
{
  long double result;

  MEMORY[0x24BDAD218](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x24BDAD220](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
  MEMORY[0x24BDADC70](iterations, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCE0](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCF8](queue, block);
}

void dispatch_block_cancel(dispatch_block_t block)
{
  MEMORY[0x24BDADD10](block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD18](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDB8](group, queue, block);
}

void dispatch_group_async_f(dispatch_group_t group, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADDC0](group, queue, context, work);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x24BDADEE0](queue);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x24BDAE270](__x);
  return result;
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
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

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
}

float log10f(float a1)
{
  float result;

  MEMORY[0x24BDAEAB8](a1);
  return result;
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
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

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
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

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3F0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

size_t os_proc_available_memory(void)
{
  return MEMORY[0x24BDAF3E8]();
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x24BDAF410](log, ptr);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x24BDAFE18](__x);
  return result;
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x24BDB00F8](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

int uname(utsname *a1)
{
  return MEMORY[0x24BDB02A8](a1);
}

void vDSP_conv(const float *__A, vDSP_Stride __IA, const float *__F, vDSP_Stride __IF, float *__C, vDSP_Stride __IC, vDSP_Length __N, vDSP_Length __P)
{
  MEMORY[0x24BDB3198](__A, __IA, __F, __IF, __C, __IC, __N, __P);
}

vImage_Error vImageBoxConvolve_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, uint32_t kernel_height, uint32_t kernel_width, Pixel_8 backgroundColor, vImage_Flags flags)
{
  return MEMORY[0x24BDB3618](src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, *(_QWORD *)&kernel_height, *(_QWORD *)&kernel_width, backgroundColor);
}

vImage_Error vImageConvert_16Fto16U(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x24BDB3658](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_16Uto16F(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x24BDB3670](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_PlanarFtoPlanar8(const vImage_Buffer *src, const vImage_Buffer *dest, Pixel_F maxFloat, Pixel_F minFloat, vImage_Flags flags)
{
  return MEMORY[0x24BDB3800](src, dest, *(_QWORD *)&flags, maxFloat, minFloat);
}

vImage_Error vImageDilate_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, const unsigned __int8 *kernel, vImagePixelCount kernel_height, vImagePixelCount kernel_width, vImage_Flags flags)
{
  return MEMORY[0x24BDB38C8](src, dest, srcOffsetToROI_X, srcOffsetToROI_Y, kernel, kernel_height, kernel_width, *(_QWORD *)&flags);
}

vImage_Error vImageErode_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, const unsigned __int8 *kernel, vImagePixelCount kernel_height, vImagePixelCount kernel_width, vImage_Flags flags)
{
  return MEMORY[0x24BDB38D0](src, dest, srcOffsetToROI_X, srcOffsetToROI_Y, kernel, kernel_height, kernel_width, *(_QWORD *)&flags);
}

vImage_Error vImageHorizontalReflect_Planar16U(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x24BDB38F0](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageHorizontalReflect_PlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x24BDB3900](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageRotate90_Planar16U(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, Pixel_16U backColor, vImage_Flags flags)
{
  return MEMORY[0x24BDB39B8](src, dest, rotationConstant, backColor, *(_QWORD *)&flags);
}

vImage_Error vImageRotate90_PlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, Pixel_F backColor, vImage_Flags flags)
{
  return MEMORY[0x24BDB39E0](src, dest, rotationConstant, *(_QWORD *)&flags, backColor);
}

vImage_Error vImageScale_CbCr8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x24BDB3A38](src, dest, tempBuffer, *(_QWORD *)&flags);
}

vImage_Error vImageScale_Planar16U(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x24BDB3A58](src, dest, tempBuffer, *(_QWORD *)&flags);
}

vImage_Error vImageScale_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x24BDB3A60](src, dest, tempBuffer, *(_QWORD *)&flags);
}

vImage_Error vImageScale_PlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x24BDB3A70](src, dest, tempBuffer, *(_QWORD *)&flags);
}

