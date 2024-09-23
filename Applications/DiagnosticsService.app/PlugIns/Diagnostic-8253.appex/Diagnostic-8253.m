size_t JasDiagnosticInteractor::primaryScalerHxISPFrameAvailableCallback(size_t result, CVPixelBufferRef pixelBuffer, uint64_t a3, int a4)
{
  uint64_t v5;
  size_t Width;
  size_t Height;

  if (a4 == 3)
  {
    v5 = result;
    Width = CVPixelBufferGetWidth(pixelBuffer);
    Height = CVPixelBufferGetHeight(pixelBuffer);
    result = CVPixelBufferGetDataSize(pixelBuffer);
    if (result)
    {
      if (Height * Width)
      {
        *(_BYTE *)(v5 + 21) = 1;
        ++*(_DWORD *)(v5 + 16);
      }
    }
  }
  return result;
}

JasDiagnosticInteractor *JasDiagnosticInteractor::setIsJasperSuperWideframeArrived(JasDiagnosticInteractor *this, int a2)
{
  if (a2)
  {
    this->m_isRgbSuperWideFramesArrived = 1;
    ++this->m_rgbSuperWideFrameCount;
  }
  return this;
}

void JasDiagnosticInteractor::pointCloudHxISPFrameAvailableCallback(uint64_t a1, CVBufferRef buffer, uint64_t a3, int a4)
{
  int v7;
  float *v8;
  _BYTE *v9;
  int v10;
  uint64_t v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  CFDictionaryRef v21;
  int v22;
  unsigned int *v23;

  if (buffer)
  {
    ++*(_DWORD *)(a1 + 92);
    CVBufferRetain(buffer);
    v21 = CVBufferCopyAttachments(buffer, kCVAttachmentMode_ShouldPropagate);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](v21, "objectForKey:", CFSTR("MetadataDictionary")));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[ADJasperPointCloud makeWithDataBuffer:](ADJasperPointCloud, "makeWithDataBuffer:", buffer));
    v7 = objc_msgSend(v19, "length");
    v8 = (float *)objc_msgSend(v19, "confidences");
    v9 = objc_msgSend(v19, "bankIds");
    v10 = a4;
    if (!*v9)
    {
      sub_1000031B8(a1 + 64, *(_QWORD **)(a1 + 72));
      *(_QWORD *)(a1 + 64) = a1 + 72;
      *(_QWORD *)(a1 + 72) = 0;
      *(_QWORD *)(a1 + 80) = 0;
    }
    if (v7 >= 1)
    {
      v11 = v7;
      do
      {
        v12 = *v9++;
        v22 = v12;
        v23 = (unsigned int *)&v22;
        *((_DWORD *)sub_1000031F8((uint64_t **)(a1 + 64), &v22, (uint64_t)&unk_100017104, &v23) + 8) = 1;
        if (*v8 >= 0.5)
          ++*(_DWORD *)(a1 + 88);
        ++v8;
        --v11;
      }
      while (v11);
    }
    CVBufferRelease(buffer);
    if (v10 == 4 && *(_QWORD *)(a1 + 80) == *(_DWORD *)(a1 + 48))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8253/JasDiagnosticInteractor.mm"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("BankDict size %zu point count %d frame %d"), *(_QWORD *)(a1 + 80), *(unsigned int *)(a1 + 88), *(unsigned int *)(a1 + 8)));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v14, 87, v15);

      JasDiagnosticInteractor::setIsJasperFrameArrived((JasDiagnosticInteractor *)a1, 1, *(_DWORD *)(a1 + 88), *(_DWORD *)(a1 + 92));
      v16 = a1 + 64;
      v18 = *(_QWORD **)(a1 + 72);
      v17 = (_QWORD *)(a1 + 72);
      sub_1000031B8(v16, v18);
      *(v17 - 1) = v17;
      *v17 = 0;
      v17[1] = 0;
      v17[2] = 0;
    }

  }
}

void sub_100002DBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

JasDiagnosticInteractor *JasDiagnosticInteractor::setIsJasperFrameArrived(JasDiagnosticInteractor *this, int a2, int a3, int a4)
{
  JasDiagnosticInteractor *v6;
  int m_jasperFramesCount;
  int v8;

  if (a2)
  {
    v6 = this;
    this->m_isJasperFramesArrived = 1;
    m_jasperFramesCount = this->m_jasperFramesCount;
    if (!m_jasperFramesCount)
    {
      this = (JasDiagnosticInteractor *)mach_absolute_time();
      v6->m_timer.beginTime = (unint64_t)this;
      m_jasperFramesCount = v6->m_jasperFramesCount;
    }
    v8 = v6->m_jasperPointsCount + a3;
    v6->m_jasperFramesCount = m_jasperFramesCount + 1;
    v6->m_jasperPointsCount = v8;
    v6->m_subframeCount += a4;
  }
  return this;
}

void JasDiagnosticInteractor::JasDiagnosticInteractor(JasDiagnosticInteractor *this)
{
  int *p_m_jasperFramesCount;
  NSString *v3;
  NSString *m_deviceName;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  this->_vptr$StreamingClient = (void **)off_10001C688;
  *(_QWORD *)&this->m_jasperFramesCount = 0;
  p_m_jasperFramesCount = &this->m_jasperFramesCount;
  *(_QWORD *)((char *)&this->m_jasperPointsCount + 2) = 0;
  mach_timebase_info(&this->m_timer.sTimebaseInfo);
  this->m_banksIdDictionary.__tree_.__pair1_.__value_.__left_ = 0;
  this->m_banksIdDictionary.__tree_.__begin_node_ = &this->m_banksIdDictionary.__tree_.__pair1_;
  this->m_deviceName = 0;
  this->m_banksIdDictionary.__tree_.__pair3_.__value_ = 0;
  this->m_maxBanksNumberForFrame = 4;
  this->m_minAveragePointsNumberThreshold = 200.0;
  v3 = (NSString *)MGCopyAnswer(CFSTR("HWModelStr"), 0);
  m_deviceName = this->m_deviceName;
  this->m_deviceName = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSString lowercaseString](this->m_deviceName, "lowercaseString"));
  if ((objc_msgSend(v5, "hasPrefix:", CFSTR("d8")) & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSString lowercaseString](this->m_deviceName, "lowercaseString"));
    if ((objc_msgSend(v6, "hasPrefix:", CFSTR("d9")) & 1) == 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSString lowercaseString](this->m_deviceName, "lowercaseString"));
      if (!objc_msgSend(v7, "hasPrefix:", CFSTR("j7")))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSString lowercaseString](this->m_deviceName, "lowercaseString"));
        v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("j8"));

        if ((v9 & 1) == 0)
          goto LABEL_8;
        goto LABEL_7;
      }

    }
  }

LABEL_7:
  this->m_maxBanksNumberForFrame = 8;
  this->m_minAveragePointsNumberThreshold = 56.0;
LABEL_8:
  *(_QWORD *)((char *)p_m_jasperFramesCount + 6) = 0;
  *(_QWORD *)p_m_jasperFramesCount = 0;
  sub_1000031B8((uint64_t)&this->m_banksIdDictionary, (_QWORD *)this->m_banksIdDictionary.__tree_.__pair1_.__value_.__left_);
  this->m_banksIdDictionary.__tree_.__pair1_.__value_.__left_ = 0;
  this->m_banksIdDictionary.__tree_.__pair3_.__value_ = 0;
  this->m_banksIdDictionary.__tree_.__begin_node_ = &this->m_banksIdDictionary.__tree_.__pair1_;
  *(_QWORD *)&this->m_goodPointsCount = 0;
  this->m_subframeCount = 0;
}

void sub_100003004(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  sub_1000031B8(v2, *(_QWORD **)(v1 + 72));
  _Unwind_Resume(a1);
}

void JasDiagnosticInteractor::resetMembers(JasDiagnosticInteractor *this)
{
  _QWORD *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, int>, void *>>> *p_pair1;

  p_pair1 = &this->m_banksIdDictionary.__tree_.__pair1_;
  left = this->m_banksIdDictionary.__tree_.__pair1_.__value_.__left_;
  *(_QWORD *)((char *)&this->m_jasperPointsCount + 2) = 0;
  *(_QWORD *)&this->m_jasperFramesCount = 0;
  sub_1000031B8((uint64_t)&this->m_banksIdDictionary, left);
  p_pair1[-1].__value_.__left_ = p_pair1;
  p_pair1->__value_.__left_ = 0;
  p_pair1[1].__value_.__left_ = 0;
  p_pair1[2].__value_.__left_ = 0;
  LODWORD(p_pair1[3].__value_.__left_) = 0;
}

double JasDiagnosticInteractor::getJasperFpsDuringStreaming(JasDiagnosticInteractor *this)
{
  return (double)this->m_subframeCount
       / (double)this->m_jasperFramesCount
       * ((double)this->m_jasperFramesCount
        * 1000.0
        / (double)((mach_absolute_time() - this->m_timer.beginTime)
                 * this->m_timer.sTimebaseInfo.numer
                 / this->m_timer.sTimebaseInfo.denom
                 / 0xF4240));
}

double JasDiagnosticInteractor::getJasperAveragePointsDuringStreaming(JasDiagnosticInteractor *this)
{
  int m_jasperFramesCount;

  m_jasperFramesCount = this->m_jasperFramesCount;
  if (m_jasperFramesCount)
    return (double)this->m_jasperPointsCount / (double)m_jasperFramesCount;
  else
    return 0.0;
}

uint64_t sub_100003130(uint64_t a1)
{
  *(_QWORD *)a1 = off_10001C688;
  sub_1000031B8(a1 + 64, *(_QWORD **)(a1 + 72));

  return a1;
}

void sub_10000316C(uint64_t a1)
{
  *(_QWORD *)a1 = off_10001C688;
  sub_1000031B8(a1 + 64, *(_QWORD **)(a1 + 72));

  operator delete();
}

void sub_1000031B8(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    sub_1000031B8(a1, *a2);
    sub_1000031B8(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t *sub_1000031F8(uint64_t **a1, int *a2, uint64_t a3, unsigned int **a4)
{
  uint64_t *v6;
  uint64_t **v7;
  int v8;
  uint64_t **v9;
  int v10;
  uint64_t *v11;

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
        v10 = *((_DWORD *)v6 + 7);
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
    v11 = (uint64_t *)operator new(0x28uLL);
    *(uint64_t *)((char *)v11 + 28) = **a4;
    sub_1000032B4(a1, (uint64_t)v9, v7, v11);
    return v11;
  }
  return (uint64_t *)v9;
}

uint64_t *sub_1000032B4(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
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
  result = sub_100003308(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *sub_100003308(uint64_t *result, uint64_t *a2)
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

void sub_1000038E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_100003AAC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_100003BDC(_Unwind_Exception *a1, DeviceCMInterface *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  DeviceCMInterface::~DeviceCMInterface((DeviceCMInterface *)&a10);
  _Unwind_Resume(a1);
}

void sub_100003C84(_Unwind_Exception *a1, DeviceCMInterface *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  DeviceCMInterface::~DeviceCMInterface((DeviceCMInterface *)&a10);
  _Unwind_Resume(a1);
}

void sub_100003D90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100003F0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100004094(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100004678(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t sub_100004708(uint64_t a1)
{
  id *v1;
  id *v2;
  void *v4;
  void *v5;
  unsigned int v6;

  v2 = *(id **)(a1 + 8);
  v1 = *(id **)(a1 + 16);
  if ((char *)v1 - (char *)v2 != 8)
    return v1 == v2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v2, "allKeys"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 0));
  v6 = objc_msgSend(v5, "intValue");

  if (v6)
  {
    v2 = *(id **)(a1 + 8);
    v1 = *(id **)(a1 + 16);
    return v1 == v2;
  }
  return 1;
}

void sub_100004784(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1000047A0(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t *v17;
  char *v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  int64x2_t v22;
  char *v23;
  uint64_t v24;
  int64x2_t v25;
  char *v26;
  _QWORD *v27;
  void *v28;
  id v29;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a2));
  v28 = v6;
  v29 = v5;
  v7 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
  v8 = a1[3];
  v9 = (uint64_t *)a1[2];
  if ((unint64_t)v9 >= v8)
  {
    v11 = a1[1];
    v12 = ((uint64_t)v9 - v11) >> 3;
    if ((unint64_t)(v12 + 1) >> 61)
      sub_100006EA8();
    v13 = v8 - v11;
    v14 = v13 >> 2;
    if (v13 >> 2 <= (unint64_t)(v12 + 1))
      v14 = v12 + 1;
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8)
      v15 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v15 = v14;
    v27 = a1 + 3;
    if (v15)
      v16 = (char *)sub_100006F40((uint64_t)(a1 + 3), v15);
    else
      v16 = 0;
    v17 = (uint64_t *)&v16[8 * v12];
    v18 = &v16[8 * v15];
    v26 = v18;
    *v17 = v7;
    v10 = v17 + 1;
    v25.i64[1] = (uint64_t)(v17 + 1);
    v20 = (_QWORD *)a1[1];
    v19 = (_QWORD *)a1[2];
    if (v19 == v20)
    {
      v22 = vdupq_n_s64((unint64_t)v19);
    }
    else
    {
      do
      {
        v21 = *--v19;
        *v19 = 0;
        *--v17 = v21;
      }
      while (v19 != v20);
      v22 = *(int64x2_t *)(a1 + 1);
      v10 = (_QWORD *)v25.i64[1];
      v18 = v26;
    }
    a1[1] = v17;
    a1[2] = v10;
    v25 = v22;
    v23 = (char *)a1[3];
    a1[3] = v18;
    v26 = v23;
    v24 = v22.i64[0];
    sub_100006F9C((uint64_t)&v24);
  }
  else
  {
    *v9 = v7;
    v10 = v9 + 1;
  }
  a1[2] = v10;

}

void sub_100004934(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100004A38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_100005AEC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id *sub_100005E14(id *a1)
{
  void **v3;

  v3 = a1 + 1;
  sub_1000070A8(&v3);

  return a1;
}

void sub_100005F18(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_100005E14((id *)va);
  _Unwind_Resume(a1);
}

void sub_10000608C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1000068B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,_QWORD *a38)
{

  sub_1000031B8((uint64_t)&a37, a38);
  _Unwind_Resume(a1);
}

void sub_100006D10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100006EA8()
{
  sub_100006ECC("vector");
}

void sub_100006EBC(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_100006ECC(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_100006F1C(exception, a1);
}

void sub_100006F08(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_100006F1C(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *sub_100006F40(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    sub_100006F74();
  return operator new(8 * a2);
}

void sub_100006F74()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t sub_100006F9C(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 8;

  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

char *sub_100006FEC(char *result, void **a2, void **a3, unint64_t a4)
{
  char *v6;
  char **v7;
  void *v8;

  if (a4)
  {
    v6 = result;
    result = sub_100007068(result, a4);
    v7 = (char **)*((_QWORD *)v6 + 1);
    while (a2 != a3)
    {
      v8 = *a2++;
      result = v8;
      *v7++ = result;
    }
    *((_QWORD *)v6 + 1) = v7;
  }
  return result;
}

void sub_100007054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  sub_1000070A8(&a9);
  _Unwind_Resume(a1);
}

char *sub_100007068(_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 61)
    sub_100006EA8();
  result = (char *)sub_100006F40((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void sub_1000070A8(void ***a1)
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;
  void *v6;

  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    v4 = (char *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v6 = (void *)*((_QWORD *)v4 - 1);
        v4 -= 8;

      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t sub_100007114(uint64_t *a1, _DWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void *__p;
  char *v16;
  char *v17;
  char *v18;
  uint64_t *v19;

  v3 = *a1;
  v4 = (a1[1] - *a1) >> 3;
  v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 61)
    sub_100006EA8();
  v7 = (uint64_t)(a1 + 2);
  v8 = a1[2] - v3;
  if (v8 >> 2 > v5)
    v5 = v8 >> 2;
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8)
    v9 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v9 = v5;
  v19 = a1 + 2;
  v10 = (char *)sub_100006F40(v7, v9);
  v11 = &v10[8 * v4];
  __p = v10;
  v16 = v11;
  v18 = &v10[8 * v12];
  *(_DWORD *)v11 = *a2;
  *((_DWORD *)v11 + 1) = a2[1];
  v17 = v11 + 8;
  sub_100007234(a1, &__p);
  v13 = a1[1];
  if (v17 != v16)
    v17 += (v16 - v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  if (__p)
    operator delete(__p);
  return v13;
}

void sub_1000071FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t *sub_100007234(uint64_t *result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *result;
  v2 = result[1];
  v4 = a2[1];
  while (v2 != v3)
  {
    v5 = *(_DWORD *)(v2 - 8);
    v2 -= 8;
    *(_DWORD *)(v4 - 8) = v5;
    v4 -= 8;
    *(_DWORD *)(v4 + 4) = *(_DWORD *)(v2 + 4);
  }
  a2[1] = v4;
  v6 = *result;
  *result = v4;
  a2[1] = v6;
  v7 = result[1];
  result[1] = a2[2];
  a2[2] = v7;
  v8 = result[2];
  result[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t sub_100007294(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  unint64_t v7;
  char *v8;
  uint64_t v9;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  uint64_t *v15;

  v3 = (a1[1] - *a1) >> 5;
  v4 = v3 + 1;
  if ((unint64_t)(v3 + 1) >> 59)
    sub_100006EA8();
  v6 = a1[2] - *a1;
  if (v6 >> 4 > v4)
    v4 = v6 >> 4;
  if ((unint64_t)v6 >= 0x7FFFFFFFFFFFFFE0)
    v7 = 0x7FFFFFFFFFFFFFFLL;
  else
    v7 = v4;
  v15 = a1 + 2;
  if (v7)
    v8 = (char *)sub_100007450((uint64_t)(a1 + 2), v7);
  else
    v8 = 0;
  v11 = v8;
  v12 = &v8[32 * v3];
  v14 = &v8[32 * v7];
  sub_100007380((uint64_t)(a1 + 2), (uint64_t)v12, a2);
  v13 = v12 + 32;
  sub_1000073DC(a1, &v11);
  v9 = a1[1];
  sub_100007644((uint64_t)&v11);
  return v9;
}

void sub_10000736C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_100007644((uint64_t)va);
  _Unwind_Resume(a1);
}

char *sub_100007380(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)a2 = *(id *)a3;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 8) = 0;
  return sub_100006FEC((char *)(a2 + 8), *(void ***)(a3 + 8), *(void ***)(a3 + 16), (uint64_t)(*(_QWORD *)(a3 + 16) - *(_QWORD *)(a3 + 8)) >> 3);
}

void sub_1000073C8(_Unwind_Exception *a1)
{
  id *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_1000073DC(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = sub_100007484((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *sub_100007450(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59)
    sub_100006F74();
  return operator new(32 * a2);
}

uint64_t sub_100007484(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
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
      v8 = *(_QWORD *)(a3 - 32);
      a3 -= 32;
      *(_QWORD *)a3 = 0;
      *(_QWORD *)(v7 - 32) = v8;
      *(_QWORD *)(v7 - 24) = 0;
      *(_QWORD *)(v7 - 16) = 0;
      *(_QWORD *)(v7 - 8) = 0;
      *(_OWORD *)(v7 - 24) = *(_OWORD *)(a3 + 8);
      *(_QWORD *)(v7 - 8) = *(_QWORD *)(a3 + 24);
      *(_QWORD *)(a3 + 8) = 0;
      *(_QWORD *)(a3 + 16) = 0;
      *(_QWORD *)(a3 + 24) = 0;
      v7 = *((_QWORD *)&v14 + 1) - 32;
      *((_QWORD *)&v14 + 1) -= 32;
    }
    while (a3 != a5);
    v9 = v14;
  }
  v12 = 1;
  sub_10000752C((uint64_t)v11);
  return v9;
}

uint64_t sub_10000752C(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    sub_100007560((uint64_t *)a1);
  return a1;
}

void sub_100007560(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v8[8];
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[8];
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = (uint64_t *)a1[2];
  v3 = *v1;
  v2 = v1[1];
  v14 = v3;
  v15 = v2;
  v16 = v3;
  v17 = v2;
  v4 = *a1;
  v5 = (uint64_t *)a1[1];
  v7 = *v5;
  v6 = v5[1];
  v9 = v7;
  v10 = v6;
  v11 = v7;
  v12 = v6;
  sub_1000075D4(v4, (uint64_t)v13, (uint64_t)v8);
}

void sub_1000075D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id *i;
  void **v6;

  for (i = *(id **)(a2 + 32); i != *(id **)(a3 + 32); *(_QWORD *)(a2 + 32) = i)
  {
    v6 = i + 1;
    sub_1000070A8(&v6);

    i = (id *)(*(_QWORD *)(a2 + 32) + 32);
  }
}

uint64_t sub_100007644(uint64_t a1)
{
  sub_100007678(a1, *(_QWORD *)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void sub_100007678(uint64_t a1, uint64_t a2)
{
  uint64_t i;
  void **v5;

  for (i = *(_QWORD *)(a1 + 16); i != a2; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 32;
    v5 = (void **)(i - 24);
    sub_1000070A8(&v5);

  }
}

void sub_1000076E0(void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    sub_100007720((uint64_t)v2, (uint64_t)*v2);
    operator delete(**a1);
  }
}

void sub_100007720(uint64_t a1, uint64_t a2)
{
  uint64_t i;
  void *v5;
  void **v6;

  for (i = *(_QWORD *)(a1 + 8); i != a2; i -= 32)
  {
    v6 = (void **)(i - 24);
    sub_1000070A8(&v6);
    v5 = *(void **)(i - 32);

  }
  *(_QWORD *)(a1 + 8) = a2;
}

void DeviceCMInterface::DeviceCMInterface(DeviceCMInterface *this)
{
  this->m_currentPearlConfiguration.deviceName = 0;
  this->m_hVersion = -1;
  *(_WORD *)&this->m_currentPearlConfiguration.isIrOn = 0;
  this->m_currentPearlConfiguration.isRgbOn = 0;
  this->m_currentPearlConfiguration.irType = 0;
  this->m_currentPearlConfiguration.bitMaskID = 0;
  this->m_currentJasperConfiguration.isJasperOn = 1;
  *(_DWORD *)&this->m_currentJasperConfiguration.isSuperWideOn = 0;
  *(_QWORD *)&this->m_currentJasperConfiguration.bitMaskID = 0xFFFFFFFF00000000;
  *(_QWORD *)&this->m_streamIdsInfo.rgbTeleStreamId = -1;
  *(_QWORD *)&this->m_streamIdsInfo.rgbPearlStreamId = -1;
  *(_QWORD *)&this->m_streamIdsInfo.rgbSuperWideStreamId = -1;
  *(_WORD *)&this->m_isPearlRgbConfigured = 0;
  this->m_delegate = 0;
  this->m_captureDeviceController = 0;
}

{
  this->m_currentPearlConfiguration.deviceName = 0;
  this->m_hVersion = -1;
  *(_WORD *)&this->m_currentPearlConfiguration.isIrOn = 0;
  this->m_currentPearlConfiguration.isRgbOn = 0;
  this->m_currentPearlConfiguration.irType = 0;
  this->m_currentPearlConfiguration.bitMaskID = 0;
  this->m_currentJasperConfiguration.isJasperOn = 1;
  *(_DWORD *)&this->m_currentJasperConfiguration.isSuperWideOn = 0;
  *(_QWORD *)&this->m_currentJasperConfiguration.bitMaskID = 0xFFFFFFFF00000000;
  *(_QWORD *)&this->m_streamIdsInfo.rgbTeleStreamId = -1;
  *(_QWORD *)&this->m_streamIdsInfo.rgbPearlStreamId = -1;
  *(_QWORD *)&this->m_streamIdsInfo.rgbSuperWideStreamId = -1;
  *(_WORD *)&this->m_isPearlRgbConfigured = 0;
  this->m_delegate = 0;
  this->m_captureDeviceController = 0;
}

DeviceCMInterface *DeviceCMInterface::resetMembers(DeviceCMInterface *this)
{
  this->m_hVersion = -1;
  *(_WORD *)&this->m_currentPearlConfiguration.isIrOn = 0;
  this->m_currentPearlConfiguration.isRgbOn = 0;
  this->m_currentPearlConfiguration.irType = 0;
  this->m_currentPearlConfiguration.bitMaskID = 0;
  this->m_currentJasperConfiguration.isJasperOn = 1;
  *(_DWORD *)&this->m_currentJasperConfiguration.isSuperWideOn = 0;
  *(_QWORD *)&this->m_currentJasperConfiguration.bitMaskID = 0xFFFFFFFF00000000;
  *(_QWORD *)&this->m_streamIdsInfo.rgbTeleStreamId = -1;
  *(_QWORD *)&this->m_streamIdsInfo.rgbPearlStreamId = -1;
  *(_QWORD *)&this->m_streamIdsInfo.rgbSuperWideStreamId = -1;
  *(_WORD *)&this->m_isPearlRgbConfigured = 0;
  this->m_delegate = 0;
  this->m_captureDeviceController = 0;
  return this;
}

HxISPCaptureDeviceController *DeviceCMInterface::releaseInterface(DeviceCMInterface *this)
{
  HxISPCaptureDeviceController *result;

  result = this->m_captureDeviceController;
  if (result)
  {
    HxISPCaptureDeviceController::deactivate(result);
    result = this->m_captureDeviceController;
    if (result)
    {
      HxISPCaptureDeviceController::~HxISPCaptureDeviceController(result);
      operator delete();
    }
  }
  this->m_hVersion = -1;
  *(_WORD *)&this->m_currentPearlConfiguration.isIrOn = 0;
  this->m_currentPearlConfiguration.isRgbOn = 0;
  this->m_currentPearlConfiguration.irType = 0;
  this->m_currentPearlConfiguration.bitMaskID = 0;
  this->m_currentJasperConfiguration.isJasperOn = 1;
  *(_DWORD *)&this->m_currentJasperConfiguration.isSuperWideOn = 0;
  *(_QWORD *)&this->m_currentJasperConfiguration.bitMaskID = 0xFFFFFFFF00000000;
  *(_QWORD *)&this->m_streamIdsInfo.rgbTeleStreamId = -1;
  *(_QWORD *)&this->m_streamIdsInfo.rgbPearlStreamId = -1;
  *(_QWORD *)&this->m_streamIdsInfo.rgbSuperWideStreamId = -1;
  *(_WORD *)&this->m_isPearlRgbConfigured = 0;
  this->m_delegate = 0;
  this->m_captureDeviceController = 0;
  return result;
}

void DeviceCMInterface::~DeviceCMInterface(DeviceCMInterface *this)
{
  DeviceCMInterface::releaseInterface(this);

}

void DeviceCMInterface::initAndActivateCaptureDeviceController(DeviceCMInterface *this)
{
  operator new();
}

void sub_100007A24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setSWConfiguration(uint64_t a1, uint64_t a2)
{
  return DeviceCMInterface::setRgbConfiguration(a1, *(unsigned int *)(a1 + 40), a2);
}

uint64_t DeviceCMInterface::setRgbConfiguration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  HxISPCaptureDeviceController *v3;
  uint64_t v5;
  NSNumber *v6;
  DeviceCMInterface *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *ErrorInformationString;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  CFDictionaryRef DictionaryRepresentation;
  const __CFBoolean *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  id v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned int v39;
  void *v40;
  unsigned int v41;
  void *v42;
  unsigned int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  float v48;
  float v49;
  void *v50;
  float v51;
  float v52;
  void *v53;
  float v54;
  float v55;
  void *v56;
  float v57;
  float v58;
  BOOL v61;
  char v62;
  const __CFString *v63;
  void *v64;
  void *v65;
  const __CFString *v66;
  void *v67;
  void *v68;
  const __CFString *v69;
  HxISPCaptureDeviceController *v70;
  NSNumber *v71;
  const __CFString *v72;
  const __CFString *v73;
  const __CFString *v74;
  const __CFString *v76;
  int v77;
  int v78;
  id obja;
  id obj;
  uint64_t v82;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  id v88;
  uint64_t v89;
  id v90;
  _BYTE v91[128];

  if ((a2 & 0x80000000) != 0 || (v3 = *(HxISPCaptureDeviceController **)(a1 + 16)) == 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("error bad streamID of %d "), a2));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v14, 164, v15);

    return 3758097084;
  }
  v5 = *(unsigned int *)(a3 + 44);
  if ((_DWORD)v5 == -1)
  {
    v88 = 0;
    v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(v3, a2, kFigCaptureStreamProperty_SupportedFormatsArray, &v88);
    if ((_DWORD)v7)
    {
      obja = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obja, "lastPathComponent"));
      ErrorInformationString = DeviceCMInterface::getErrorInformationString(v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("error %d failed to get sw stream supported formats %@"), v7, v18));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v16, 175, v19);

      return (uint64_t)v7;
    }
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    obj = v88;
    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v91, 16);
    if (v34)
    {
      v35 = -1;
      v82 = *(_QWORD *)v85;
      while (2)
      {
        v36 = 0;
        v77 = v35 + (_DWORD)v34;
        v78 = v35;
        do
        {
          if (*(_QWORD *)v85 != v82)
            objc_enumerationMutation(obj);
          v37 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * (_QWORD)v36);
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "valueForKey:", CFSTR("VideoIsBinned")));
          v39 = objc_msgSend(v38, "BOOLValue");

          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "valueForKey:", CFSTR("SensorWidth")));
          v41 = objc_msgSend(v40, "integerValue");

          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "valueForKey:", CFSTR("SensorHeight")));
          v43 = objc_msgSend(v42, "integerValue");

          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "valueForKey:", CFSTR("SupportedOutputs")));
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "valueForKey:", CFSTR("PrimaryScaler")));
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "valueForKey:", CFSTR("DefaultCropRect")));
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "valueForKey:", CFSTR("X")));
          objc_msgSend(v47, "floatValue");
          v49 = v48;

          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "valueForKey:", CFSTR("Y")));
          objc_msgSend(v50, "floatValue");
          v52 = v51;

          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "valueForKey:", CFSTR("Width")));
          objc_msgSend(v53, "floatValue");
          v55 = v54;

          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "valueForKey:", CFSTR("Height")));
          objc_msgSend(v56, "floatValue");
          v58 = v57;

          v61 = *(unsigned __int8 *)(a3 + 40) != v39 || *(_DWORD *)a3 != v41 || *(_DWORD *)(a3 + 4) != v43;
          if (*(double *)(a3 + 8) != v49)
            v61 = 1;
          if (*(double *)(a3 + 16) != v52)
            v61 = 1;
          if (*(double *)(a3 + 24) != v55)
            v61 = 1;
          v62 = *(double *)(a3 + 32) != v58 || v61;

          if ((v62 & 1) == 0)
          {
            v5 = (v78 + (_DWORD)v36 + 1);
            goto LABEL_47;
          }
          v36 = (char *)v36 + 1;
        }
        while (v34 != v36);
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v91, 16);
        v35 = v77;
        if (v34)
          continue;
        break;
      }
      v5 = 0xFFFFFFFFLL;
LABEL_47:

      if ((_DWORD)v5 != -1)
      {
        v3 = *(HxISPCaptureDeviceController **)(a1 + 16);
        goto LABEL_4;
      }
    }
    else
    {

    }
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "lastPathComponent"));
    v66 = DeviceCMInterface::getErrorInformationString(0);
    v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
    v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("error %d failed to find cam required format, %@"), 0, v67));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v65, 216, v68);

    return 0;
  }
LABEL_4:
  v6 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5);
  v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(v3, a2, kFigCaptureStreamProperty_FormatIndex, (const __CFBoolean *)v6);
  if (!(_DWORD)v7)
  {
    v20 = objc_alloc_init((Class)NSMutableDictionary);
    if (*(_DWORD *)(a3 + 52))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
      objc_msgSend(v20, "setValue:forKey:", v21, kFigCaptureStreamVideoOutputConfigurationKey_Height);

    }
    if (*(_DWORD *)(a3 + 48))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
      objc_msgSend(v20, "setValue:forKey:", v22, kFigCaptureStreamVideoOutputConfigurationKey_Width);

    }
    v23 = *(double *)(a3 + 80);
    if (v23 != 0.0)
    {
      v24 = *(_QWORD *)(a3 + 56);
      v25 = *(_QWORD *)(a3 + 64);
      v26 = *(_QWORD *)(a3 + 72);
      DictionaryRepresentation = CGRectCreateDictionaryRepresentation(*(CGRect *)(&v23 - 3));
      objc_msgSend(v20, "setValue:forKey:", DictionaryRepresentation, kFigCaptureStreamVideoOutputConfigurationKey_CropRect);

    }
    if (objc_msgSend(v20, "count"))
    {
      v89 = kFigCaptureStreamVideoOutputID_PrimaryScaler;
      v90 = v20;
      v28 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1));
      v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), a2, kFigCaptureStreamProperty_VideoOutputConfigurations, v28);
      if ((_DWORD)v7)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "lastPathComponent"));
        v31 = DeviceCMInterface::getErrorInformationString(v7);
        v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("error %d failed to video configuration, %@"), v7, v32));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v30, 243, v33);
        goto LABEL_18;
      }

    }
    if (*(_DWORD *)(a3 + 100))
    {
      v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), a2, kFigCaptureStreamProperty_ContinuousAutoFocusNow, 0);
      if ((_DWORD)v7)
      {
        v28 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[__CFBoolean lastPathComponent](v28, "lastPathComponent"));
        v63 = DeviceCMInterface::getErrorInformationString(v7);
        v30 = (void *)objc_claimAutoreleasedReturnValue(v63);
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("error %d failed to set auto focus, %@"), v7, v30));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v29, 251, v32);
        goto LABEL_66;
      }
      v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), a2, kFigCaptureStreamProperty_AutoFocusPositionSensorMode, (const __CFBoolean *)&off_10001FA68);
      if ((_DWORD)v7)
      {
        v28 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[__CFBoolean lastPathComponent](v28, "lastPathComponent"));
        v69 = DeviceCMInterface::getErrorInformationString(v7);
        v30 = (void *)objc_claimAutoreleasedReturnValue(v69);
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("error %d failed to set auto focus pos, %@"), v7, v30));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v29, 257, v32);
        goto LABEL_66;
      }
    }
    if (*(_DWORD *)(a3 + 92))
    {
      v70 = *(HxISPCaptureDeviceController **)(a1 + 16);
      v71 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
      v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(v70, a2, kFigCaptureStreamProperty_MaxIntegrationTime, (const __CFBoolean *)v71);
      if ((_DWORD)v7)
      {
        v28 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[__CFBoolean lastPathComponent](v28, "lastPathComponent"));
        v72 = DeviceCMInterface::getErrorInformationString(v7);
        v30 = (void *)objc_claimAutoreleasedReturnValue(v72);
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("error %d failed to set max integrtion time, %@"), v7, v30));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v29, 265, v32);
        goto LABEL_66;
      }
    }
    if (*(_DWORD *)(a3 + 104))
    {
      v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), a2, kFigCaptureStreamProperty_UnlockAENow, (const __CFBoolean *)&__kCFBooleanTrue);
      if ((_DWORD)v7)
      {
        v28 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[__CFBoolean lastPathComponent](v28, "lastPathComponent"));
        v73 = DeviceCMInterface::getErrorInformationString(v7);
        v30 = (void *)objc_claimAutoreleasedReturnValue(v73);
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("error %d failed to set unlock auto expsosure now, %@"), v7, v30));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v29, 274, v32);
        goto LABEL_66;
      }
    }
    if (*(_DWORD *)(a3 + 96))
    {
      v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), a2, kFigCaptureStreamProperty_SphereMode, kFigCaptureStreamSphereMode_Lock);
      if ((_DWORD)v7)
      {
        v28 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[__CFBoolean lastPathComponent](v28, "lastPathComponent"));
        v74 = DeviceCMInterface::getErrorInformationString(v7);
        v30 = (void *)objc_claimAutoreleasedReturnValue(v74);
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("error %d failed to set SphereMode, %@"), v7, v30));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v29, 283, v32);
        goto LABEL_66;
      }
    }
    if (!*(_DWORD *)(a3 + 88))
    {
      v7 = 0;
      goto LABEL_68;
    }
    v28 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
    v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), a2, kFigCaptureStreamProperty_MaximumFrameRate, v28);
    if (!(_DWORD)v7)
    {
LABEL_67:

LABEL_68:
      return (uint64_t)v7;
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "lastPathComponent"));
    v76 = DeviceCMInterface::getErrorInformationString(v7);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v76);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("error %d failed to set auto focus, %@"), v7, v32));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v30, 292, v33);
LABEL_18:

LABEL_66:
    goto LABEL_67;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
  v10 = DeviceCMInterface::getErrorInformationString(v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("error %d failed to set sw format index, %@"), v7, v11));
  NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 222, v12);

  return (uint64_t)v7;
}

void sub_100008620(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setWConfiguration(uint64_t a1, uint64_t a2)
{
  return DeviceCMInterface::setRgbConfiguration(a1, *(unsigned int *)(a1 + 28), a2);
}

uint64_t DeviceCMInterface::setFrontConfiguration(uint64_t a1, uint64_t a2)
{
  return DeviceCMInterface::setRgbConfiguration(a1, *(unsigned int *)(a1 + 32), a2);
}

const __CFString *DeviceCMInterface::getErrorInformationString(DeviceCMInterface *this)
{
  const __CFString *result;

  if ((int)this > -12789)
  {
    switch(this)
    {
      case 0xFFFFCE0C:
        result = CFSTR("base object error unsupported protocol");
        break;
      case 0xFFFFCE0D:
        result = CFSTR("base object error property not supported");
        break;
      case 0xFFFFCE0E:
        result = CFSTR("base object error allocation failed");
        break;
      case 0xFFFFCE0F:
        result = CFSTR("base object error invalidated");
        break;
      case 0xFFFFCE10:
        result = CFSTR("base object error property not found");
        break;
      case 0xFFFFCE11:
        result = CFSTR("base object error value not available");
        break;
      case 0xFFFFCE12:
        result = CFSTR("base object error unsupported operation");
        break;
      case 0xFFFFCE13:
        result = CFSTR("base object error unsupported version");
        break;
      case 0xFFFFCE14:
        result = CFSTR("base object error parameter error");
        break;
      default:
        if ((_DWORD)this)
LABEL_10:
          result = CFSTR("Unknown error information");
        else
          result = CFSTR("OK");
        break;
    }
  }
  else
  {
    switch(this)
    {
      case 0xE00002BC:
        result = CFSTR("general error");
        break;
      case 0xE00002BD:
        result = CFSTR("can't allocate memory");
        break;
      case 0xE00002BE:
        result = CFSTR("resource shortage");
        break;
      case 0xE00002BF:
        result = CFSTR("error during IPC");
        break;
      case 0xE00002C0:
        result = CFSTR("no such device");
        break;
      case 0xE00002C1:
        result = CFSTR("privilege violation");
        break;
      case 0xE00002C2:
        result = CFSTR("invalid argument");
        break;
      case 0xE00002C3:
        result = CFSTR("device read locked");
        break;
      case 0xE00002C4:
        result = CFSTR("device write locked");
        break;
      case 0xE00002C5:
        result = CFSTR("exclusive access and");
        break;
      case 0xE00002C6:
        result = CFSTR("sent/received messages");
        break;
      case 0xE00002C7:
        result = CFSTR("unsupported function");
        break;
      case 0xE00002C8:
        result = CFSTR("misc. VM failure");
        break;
      case 0xE00002C9:
        result = CFSTR("internal error");
        break;
      case 0xE00002CA:
        result = CFSTR("General I/O error");
        break;
      case 0xE00002CB:
      case 0xE00002DC:
        goto LABEL_10;
      case 0xE00002CC:
        result = CFSTR("can't acquire lock");
        break;
      case 0xE00002CD:
        result = CFSTR("device not open");
        break;
      case 0xE00002CE:
        result = CFSTR("read not supported");
        break;
      case 0xE00002CF:
        result = CFSTR("write not supported");
        break;
      case 0xE00002D0:
        result = CFSTR("alignment error");
        break;
      case 0xE00002D1:
        result = CFSTR("Media Error");
        break;
      case 0xE00002D2:
        result = CFSTR("device(s) still open");
        break;
      case 0xE00002D3:
        result = CFSTR("rld failure");
        break;
      case 0xE00002D4:
        result = CFSTR("DMA failure");
        break;
      case 0xE00002D5:
        result = CFSTR("Device Busy");
        break;
      case 0xE00002D6:
        result = CFSTR("I/O Timeout");
        break;
      case 0xE00002D7:
        result = CFSTR("device offline");
        break;
      case 0xE00002D8:
        result = CFSTR("not ready");
        break;
      case 0xE00002D9:
        result = CFSTR("device not attached");
        break;
      case 0xE00002DA:
        result = CFSTR("no DMA channels left");
        break;
      case 0xE00002DB:
        result = CFSTR("no space for data");
        break;
      case 0xE00002DD:
        result = CFSTR("port already exists");
        break;
      case 0xE00002DE:
        result = CFSTR("can't wire down");
        break;
      case 0xE00002DF:
        result = CFSTR("no interrupt attached");
        break;
      case 0xE00002E0:
        result = CFSTR("no DMA frames enqueued");
        break;
      case 0xE00002E1:
        result = CFSTR("oversized msg received");
        break;
      case 0xE00002E2:
        result = CFSTR("not permitted");
        break;
      case 0xE00002E3:
        result = CFSTR("no power to device");
        break;
      case 0xE00002E4:
        result = CFSTR("media not present");
        break;
      case 0xE00002E5:
        result = CFSTR("media not formatted");
        break;
      case 0xE00002E6:
        result = CFSTR("no such mode");
        break;
      case 0xE00002E7:
        result = CFSTR("data underrun");
        break;
      case 0xE00002E8:
        result = CFSTR("data overrun");
        break;
      case 0xE00002E9:
        result = CFSTR("the device is not working properly!");
        break;
      case 0xE00002EA:
        result = CFSTR("a completion routine is required");
        break;
      case 0xE00002EB:
        result = CFSTR("operation aborted");
        break;
      case 0xE00002EC:
        result = CFSTR("bus bandwidth would be exceeded");
        break;
      case 0xE00002ED:
        result = CFSTR("device not responding");
        break;
      case 0xE00002EE:
        result = CFSTR("isochronous I/O request for distant past!");
        break;
      case 0xE00002EF:
        result = CFSTR("isochronous I/O request for distant future");
        break;
      case 0xE00002F0:
        result = CFSTR("data was not found");
        break;
      default:
        if ((_DWORD)this != -536870911)
          goto LABEL_10;
        result = CFSTR("should never be seen");
        break;
    }
  }
  return result;
}

DeviceCMInterface *DeviceCMInterface::enableJasperRgbVideo(DeviceCMInterface *this)
{
  uint64_t v2;
  DeviceCMInterface *v3;
  void *v4;
  void *v5;
  const __CFString *ErrorInformationString;
  void *v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;

  if (this->m_currentJasperConfiguration.isWideOn)
  {
    v2 = DeviceCMInterface::enableRGBOutputForStreamId(this, this->m_streamIdsInfo.rgbWideStreamId);
    if ((_DWORD)v2)
    {
      v3 = (DeviceCMInterface *)v2;
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
      ErrorInformationString = DeviceCMInterface::getErrorInformationString(v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("enable wide stream failed with %d, %@"), v3, v7));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v5, 306, v8);
LABEL_7:

LABEL_10:
      return v3;
    }
  }
  if (this->m_currentJasperConfiguration.isSuperWideOn)
  {
    v9 = DeviceCMInterface::enableRGBOutputForStreamId(this, this->m_streamIdsInfo.rgbSuperWideStreamId);
    if ((_DWORD)v9)
    {
      v3 = (DeviceCMInterface *)v9;
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
      v10 = DeviceCMInterface::getErrorInformationString(v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("enable wide stream failed with %d, %@"), v3, v7));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v5, 315, v8);
      goto LABEL_7;
    }
  }
  v3 = (DeviceCMInterface *)DeviceCMInterface::enableJasperPointCloudOutput(this);
  if ((_DWORD)v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("failed to enable outputs")));
    NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v5, 323, v7);
    goto LABEL_10;
  }
  return v3;
}

void sub_100008E48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::enableRGBOutputForStreamId(DeviceCMInterface *this, unsigned int a2)
{
  __CFDictionary *Mutable;
  __CFDictionary *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  if ((a2 & 0x80000000) != 0 || !this->m_captureDeviceController)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("enableRGBOutputForStreamId failed, stream id invalid")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 885, v9);
    v6 = 3758097129;

    return v6;
  }
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
    return 0;
  v5 = Mutable;
  CFDictionarySetValue(Mutable, kFigCaptureStreamVideoOutputID_PrimaryScaler, kCFBooleanTrue);
  if (!HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, a2, kFigCaptureStreamProperty_VideoOutputsEnabled, v5))
  {
    CFRelease(v5);
    return 0;
  }
  return 3758097129;
}

void sub_100008FC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::enableJasperPointCloudOutput(DeviceCMInterface *this)
{
  __CFDictionary *Mutable;
  const __CFBoolean *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *ErrorInformationString;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    v3 = Mutable;
    CFDictionarySetValue(Mutable, kFigCaptureStreamVideoOutputID_PointCloud, kCFBooleanTrue);
    v4 = HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, kFigCaptureStreamProperty_VideoOutputsEnabled, v3);
    if ((_DWORD)v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
      ErrorInformationString = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("enableJasperOutput failed with OSStatus 0x%x, %@"), v4, v8));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 945, v9);

      return 3758097129;
    }
    else
    {
      CFRelease(v3);
    }
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("fail to create output enable dictionary for pointcloud output")));
    NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v11, 954, v12);
    v4 = 3758097084;

  }
  return v4;
}

void sub_1000091AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::configJasperRgbMultiStream(DeviceCMInterface *this, const JasperConfiguration *a2)
{
  uint64_t v2;
  int bitMaskID;
  const __CFBoolean *v8;
  DeviceCMInterface *v9;
  void *v10;
  void *v11;
  uint64_t jasperStreamId;
  const __CFString *ErrorInformationString;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 isWideOn;
  void *v21;
  void *v22;
  void *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  _UNKNOWN **v38;

  v2 = 3758097126;
  if (!a2->isSyncModeOn && a2->isJasperOn)
  {
    if (this->m_streamIdsInfo.jasperStreamId == -1)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "lastPathComponent"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("no jasper id detected")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v17, 339, v18);

      return 3758097088;
    }
    bitMaskID = a2->bitMaskID;
    if (bitMaskID == 16 || bitMaskID == 8)
    {
      v37 = kFigCaptureTimeOfFlightConfigurationKey_ProjectorMode;
      v38 = &off_10001FA80;
      v8 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));
      v9 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, kFigCaptureStreamProperty_TimeOfFlightConfiguration, v8);
      if ((_DWORD)v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent"));
        jasperStreamId = this->m_streamIdsInfo.jasperStreamId;
        ErrorInformationString = DeviceCMInterface::getErrorInformationString(v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setting property kFigCaptureStreamProperty_TimeOfFlightConfiguration failed with OSStatus 0x%x for stream id %d (%@)"), v9, jasperStreamId, v14));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v11, 356, v15);

LABEL_13:
        v2 = (uint64_t)v9;
LABEL_14:

        return v2;
      }
      this->m_isJasperConfigured = 1;
      this->m_currentJasperConfiguration.isJasperOn = 1;
      isWideOn = a2->isWideOn;
      if (!a2->isSuperWideOn && !a2->isWideOn)
        goto LABEL_14;
      if (a2->isSuperWideOn)
      {
        v9 = (DeviceCMInterface *)DeviceCMInterface::setJasperMultiOutModeByStreamId(this, this->m_streamIdsInfo.rgbSuperWideStreamId, 1);
        if ((_DWORD)v9)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setMultiOutModeByStreamId for rgb sw failed")));
          NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v11, 369, v21);

          goto LABEL_13;
        }
        isWideOn = a2->isWideOn;
      }
      if (isWideOn
        && (v9 = (DeviceCMInterface *)DeviceCMInterface::setJasperMultiOutModeByStreamId(this, this->m_streamIdsInfo.rgbWideStreamId, 1), (_DWORD)v9))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setMultiOutModeByStreamId for rgb w failed")));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v11, 378, v22);

      }
      else
      {
        v9 = (DeviceCMInterface *)DeviceCMInterface::setJasperMultiOutModeByStreamId(this, this->m_streamIdsInfo.jasperStreamId, 1);
        if ((_DWORD)v9)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("faile to enable jasper multi output mode")));
          NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v11, 387, v23);

        }
        else
        {
          v24 = (char *)this->m_captureDeviceController + 16;
          v25 = *(_QWORD *)&v24[8 * this->m_streamIdsInfo.rgbSuperWideStreamId];
          v26 = *(_QWORD *)&v24[8 * this->m_streamIdsInfo.rgbWideStreamId];
          v27 = *(_QWORD *)&v24[8 * this->m_streamIdsInfo.jasperStreamId];
          v28 = objc_alloc_init((Class)NSMutableArray);
          v11 = v28;
          if (a2->isWideOn)
            objc_msgSend(v28, "addObject:", v26);
          if (a2->isSuperWideOn)
            objc_msgSend(v11, "addObject:", v25);
          if (a2->isJasperOn)
            objc_msgSend(v11, "addObject:", v27);
          v35 = kFigCaptureDeviceMultiCamConfigurationKey_ActiveUnsynchronizedStreams;
          v36 = v11;
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1));
          v9 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetDeviceProperty(this->m_captureDeviceController, kFigCaptureDeviceProperty_MultiCamConfiguration, v10);
          if ((_DWORD)v9)
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "lastPathComponent"));
            v31 = this->m_streamIdsInfo.jasperStreamId;
            v32 = DeviceCMInterface::getErrorInformationString(v9);
            v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
            v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("enableSyncForEnumeratedStreams failed with OSStatus 0x%x for stream id %d (%@)"), v9, v31, v33));
            NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v30, 408, v34);

          }
          else
          {
            this->m_currentJasperConfiguration = *a2;
          }
        }
      }
      goto LABEL_13;
    }
  }
  return v2;
}

void sub_100009704(_Unwind_Exception *a1)
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

uint64_t DeviceCMInterface::setJasperRGBSuperWideMultiOutMode(DeviceCMInterface *this)
{
  return DeviceCMInterface::setJasperMultiOutModeByStreamId(this, this->m_streamIdsInfo.rgbSuperWideStreamId, 1);
}

uint64_t DeviceCMInterface::setJasperRGBWideMultiOutMode(DeviceCMInterface *this)
{
  return DeviceCMInterface::setJasperMultiOutModeByStreamId(this, this->m_streamIdsInfo.rgbWideStreamId, 1);
}

uint64_t DeviceCMInterface::setJasperMultiOutModeByStreamId(DeviceCMInterface *this, uint64_t a2, int a3)
{
  HxISPCaptureDeviceController *m_captureDeviceController;
  const __CFBoolean **v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const __CFString *ErrorInformationString;
  void *v11;
  void *v12;

  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin CM controller is nil")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 774, v11);
    v7 = 3758097084;
    goto LABEL_10;
  }
  if (this->m_streamIdsInfo.jasperStreamId != (_DWORD)a2
    && this->m_streamIdsInfo.rgbSuperWideStreamId != (_DWORD)a2
    && this->m_streamIdsInfo.rgbWideStreamId != (_DWORD)a2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("stream id %d is invalid (should be %d or %d or %d for jasper)"), a2, this->m_streamIdsInfo.jasperStreamId, this->m_streamIdsInfo.rgbSuperWideStreamId, this->m_streamIdsInfo.rgbWideStreamId));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 780, v11);
    v7 = 3758097090;
    goto LABEL_10;
  }
  v6 = (const __CFBoolean **)&kCFBooleanTrue;
  if (!a3)
    v6 = (const __CFBoolean **)&kCFBooleanFalse;
  v7 = HxISPCaptureDeviceController::SetStreamProperty(m_captureDeviceController, a2, kFigCaptureStreamProperty_MultipleOutputSupportEnabled, *v6);
  if ((_DWORD)v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
    ErrorInformationString = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setMultiOutModeByStreamId failed, OSStatus error 0x%x (%@)"), v7, v11));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 790, v12);

    v7 = 3758097129;
LABEL_10:

  }
  return v7;
}

void sub_100009A78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::setCurrentJasperConfiguration(DeviceCMInterface *this, const JasperConfiguration *a2)
{
  this->m_currentJasperConfiguration = *a2;
  return this;
}

uint64_t DeviceCMInterface::configJasperDevice(DeviceCMInterface *this, const JasperConfiguration *a2)
{
  unsigned int jasperStreamId;
  uint64_t v5;
  CFArrayRef v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const __CFString *ErrorInformationString;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  unsigned int v17;
  const __CFBoolean *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFBoolean *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  const __CFBoolean *v29;
  uint64_t rgbSuperWideStreamId;
  void *v31;
  void *v32;
  void *v33;
  HxISPCaptureDeviceController *m_captureDeviceController;
  uint64_t v35;
  uint64_t v36;
  uint64_t FigBaseObject;
  unsigned int (*v38)(uint64_t, uint64_t, const CFAllocatorRef, CFArrayRef *);
  const __CFArray *v39;
  const __CFArray *v40;
  uint64_t v41;
  unint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  char *v48;
  uint64_t v49;
  void *v50;
  DeviceCMInterface *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  const __CFString *v55;
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
  CFArrayRef theArray;
  _QWORD v69[2];
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  _UNKNOWN **v76;
  uint64_t v77;
  _UNKNOWN **v78;
  CFRange v79;
  CFRange v80;

  *(_WORD *)&this->m_isJasperSuperWideConfigured = 0;
  this->m_currentJasperConfiguration.isJasperOn = 1;
  *(_DWORD *)&this->m_currentJasperConfiguration.isSuperWideOn = 0;
  this->m_currentJasperConfiguration.bitMaskID = 0;
  jasperStreamId = this->m_streamIdsInfo.jasperStreamId;
  if (jasperStreamId == -1)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("no jasper id detected")));
    NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v14, 424, v15);

    return 3758097088;
  }
  if (a2->isJasperOn)
  {
    theArray = 0;
    v5 = HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, jasperStreamId, kFigCaptureStreamProperty_SupportedTimeOfFlightProjectorModes, &theArray);
    v6 = theArray;
    theArray = 0;
    if ((_DWORD)v5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
      v9 = this->m_streamIdsInfo.jasperStreamId;
      ErrorInformationString = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setting property kFigCaptureStreamProperty_SupportedTimeOfFlightProjectorModes failed with OSStatus 0x%x for stream id %d (%@)"), v5, v9, v11));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 441, v12);

      return v5;
    }
    v16 = -[__CFArray containsObject:](v6, "containsObject:", &off_10001FA98);
    v17 = -[__CFArray containsObject:](v6, "containsObject:", &off_10001FA80);
    if (v16)
    {
      v77 = kFigCaptureTimeOfFlightConfigurationKey_ProjectorMode;
      v78 = &off_10001FA98;
      v18 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lastPathComponent"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NormalShortHybridMode detected")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v20, 456, v21);
    }
    else
    {
      if (!v17)
      {
        v29 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[__CFBoolean lastPathComponent](v29, "lastPathComponent"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("cannot resolve projector mode")));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v23, 467, v24);
        v5 = 3758097084;
        goto LABEL_34;
      }
      v75 = kFigCaptureTimeOfFlightConfigurationKey_ProjectorMode;
      v76 = &off_10001FA80;
      v18 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lastPathComponent"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NormalMode detected")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v20, 463, v21);
    }
    v22 = v18;

    v5 = HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, kFigCaptureStreamProperty_TimeOfFlightConfiguration, v18);
    if ((_DWORD)v5)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "lastPathComponent"));
      v25 = this->m_streamIdsInfo.jasperStreamId;
      v26 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v5);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setting property kFigCaptureStreamProperty_TimeOfFlightConfiguration failed with OSStatus 0x%x for stream id %d (%@)"), v5, v25, v27));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v24, 474, v28);

      v29 = v22;
LABEL_34:

      return v5;
    }
    this->m_isJasperConfigured = 1;
    this->m_currentJasperConfiguration.isJasperOn = 1;

  }
  if (a2->isSuperWideOn)
  {
    rgbSuperWideStreamId = this->m_streamIdsInfo.rgbSuperWideStreamId;
    if ((_DWORD)rgbSuperWideStreamId == -1)
    {
      DeviceCMInterface::enumerateStreamsIndices(this);
      rgbSuperWideStreamId = this->m_streamIdsInfo.rgbSuperWideStreamId;
      if ((_DWORD)rgbSuperWideStreamId == -1)
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "lastPathComponent"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("no available RGB super wide stream index")));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v46, 485, v47);

        return 3758097136;
      }
    }
    v5 = DeviceCMInterface::setJasperMultiOutModeByStreamId(this, rgbSuperWideStreamId, 1);
    if ((_DWORD)v5)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "lastPathComponent"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setMultiOutModeByStreamId for rgb failed")));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v32, 493, v33);

      return v5;
    }
    this->m_isJasperSuperWideConfigured = 1;
    if (a2->isJasperOn && a2->isSuperWideOn)
    {
      m_captureDeviceController = this->m_captureDeviceController;
      if (a2->isSyncModeOn)
      {
        if (*((_DWORD *)m_captureDeviceController + 536))
        {
          v35 = kFigCaptureSynchronizedStreamsGroupProperty_SupportedStreams;
          v36 = 260;
          do
          {
            theArray = 0;
            FigBaseObject = FigCaptureSynchronizedStreamsGroupGetFigBaseObject(*((_QWORD *)m_captureDeviceController
                                                                               + v36));
            v38 = *(unsigned int (**)(uint64_t, uint64_t, const CFAllocatorRef, CFArrayRef *))(*(_QWORD *)(CMBaseObjectGetVTable(FigBaseObject) + 8) + 48);
            if (!v38 || v38(FigBaseObject, v35, kCFAllocatorDefault, &theArray))
              break;
            v39 = theArray;
            v79.length = CFArrayGetCount(theArray);
            v79.location = 0;
            if (CFArrayContainsValue(v39, v79, *((const void **)this->m_captureDeviceController + this->m_streamIdsInfo.jasperStreamId + 2))&& (v40 = theArray, v80.length = CFArrayGetCount(theArray), v80.location = 0, CFArrayContainsValue(v40, v80, *((const void **)this->m_captureDeviceController + this->m_streamIdsInfo.rgbSuperWideStreamId + 2))))
            {
              v41 = *((_QWORD *)this->m_captureDeviceController + v36);
            }
            else
            {
              v41 = 0;
            }
            CFRelease(theArray);
            if (v41)
              goto LABEL_32;
            m_captureDeviceController = this->m_captureDeviceController;
            v42 = v36 - 259;
            ++v36;
          }
          while (v42 < *((unsigned int *)m_captureDeviceController + 536));
        }
        v41 = 0;
LABEL_32:
        v72 = v41;
        v73 = kFigCaptureDeviceMultiCamConfigurationKey_ActiveSynchronizedStreamsGroups;
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v72, 1));
        v74 = v43;
        v44 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1));
      }
      else
      {
        v48 = (char *)m_captureDeviceController + 16;
        v49 = *(_QWORD *)&v48[8 * this->m_streamIdsInfo.jasperStreamId];
        v69[1] = *(_QWORD *)&v48[8 * this->m_streamIdsInfo.rgbSuperWideStreamId];
        v70 = kFigCaptureDeviceMultiCamConfigurationKey_ActiveUnsynchronizedStreams;
        v69[0] = v49;
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v69, 2));
        v71 = v43;
        v44 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1));
      }
      v50 = (void *)v44;

      v51 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetDeviceProperty(this->m_captureDeviceController, kFigCaptureDeviceProperty_MultiCamConfiguration, v50);
      if ((_DWORD)v51)
      {
        v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "lastPathComponent"));
        v54 = this->m_streamIdsInfo.jasperStreamId;
        v55 = DeviceCMInterface::getErrorInformationString(v51);
        v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
        v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("enableSyncForEnumeratedStreams failed with OSStatus 0x%x for stream id %d (%@)"), v51, v54, v56));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v53, 542, v57);

      }
      v5 = DeviceCMInterface::enableSWRGBOutput(this);
      if ((_DWORD)v5)
      {
        v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "lastPathComponent"));
        v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Configure the primary output to multioutput + enable failed")));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v59, 549, v60);

        return v5;
      }

    }
  }
  v5 = DeviceCMInterface::setJasperMultiOutModeByStreamId(this, this->m_streamIdsInfo.jasperStreamId, 1);
  if ((_DWORD)v5)
  {
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "lastPathComponent"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("faile to enable jasper multi output mode")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v62, 560, v63);

  }
  else
  {
    v5 = DeviceCMInterface::enableJasperPointCloudOutput(this);
    if ((_DWORD)v5)
    {
      v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "lastPathComponent"));
      v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("failed to enable outputs")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v65, 568, v66);

    }
    else
    {
      this->m_currentJasperConfiguration = *a2;
    }
  }
  return v5;
}

void sub_10000A4B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL DeviceCMInterface::isJasperSuperWideExist(DeviceCMInterface *this)
{
  int rgbSuperWideStreamId;

  rgbSuperWideStreamId = this->m_streamIdsInfo.rgbSuperWideStreamId;
  if (rgbSuperWideStreamId == -1)
  {
    DeviceCMInterface::enumerateStreamsIndices(this);
    rgbSuperWideStreamId = this->m_streamIdsInfo.rgbSuperWideStreamId;
  }
  return rgbSuperWideStreamId != -1;
}

uint64_t DeviceCMInterface::enableSWRGBOutput(DeviceCMInterface *this)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = DeviceCMInterface::enableRGBOutputForStreamId(this, this->m_streamIdsInfo.rgbSuperWideStreamId);
  if ((_DWORD)v1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastPathComponent"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("enableRGBOutput failed")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v3, 926, v4);

  }
  return v1;
}

void sub_10000A7C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::requestControlOfStreams(DeviceCMInterface *this, int a2, useconds_t a3)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  DeviceCMInterface *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *ErrorInformationString;
  void *v26;
  __CFDictionary *v30;
  uint64_t v31;
  _UNKNOWN **v32;

  if (this->m_captureDeviceController)
  {
    if (a2)
    {
      v31 = kFigCaptureDeviceRequestControlOfStreamsOptionsKey_ClientPriority;
      v32 = &off_10001FA98;
      v4 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("request control on high priority")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 592, v7);

      v30 = (__CFDictionary *)v4;
    }
    else
    {
      v30 = 0;
    }
    v12 = 1;
    while (1)
    {
      v13 = HxISPCaptureDeviceController::RequestStreams(this->m_captureDeviceController, *((const __CFArray **)this->m_captureDeviceController + 1), v30);
      v14 = (DeviceCMInterface *)v13;
      if ((_DWORD)v13 != -12681)
        break;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("requestControlOfStreamscontrol - controlled by another client. %d/%d"), v12, 10));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v16, 600, v17);

      usleep(0x7A120u);
      v12 = (v12 + 1);
      if ((_DWORD)v12 == 11)
        goto LABEL_17;
    }
    if ((_DWORD)v13 != -12782 && (_DWORD)v13 != 0)
    {
LABEL_17:
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "lastPathComponent"));
      ErrorInformationString = DeviceCMInterface::getErrorInformationString(v14);
      v24 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("requestControlOfStreamscontrol failed, OSStatus error 0x%x, %@"), v14, v24));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v23, 614, v26);

      v11 = 3758097129;
      goto LABEL_18;
    }
    if (a2)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lastPathComponent"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("waiting for preempted client to terminate for %.2f sec..."), (double)a3 / 1000000.0));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v20, 621, v21);

      usleep(a3);
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "lastPathComponent"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("done waiting")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v23, 623, v24);
      v11 = 0;
LABEL_18:

      goto LABEL_20;
    }
    v11 = 0;
LABEL_20:

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin CM controller is nil")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 584, v10);
    v11 = 3758097084;

  }
  return v11;
}

void sub_10000AC24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::releaseControlOfStreams(DeviceCMInterface *this)
{
  HxISPCaptureDeviceController *m_captureDeviceController;
  uint64_t v2;
  void *v3;
  void *v4;
  const __CFString *ErrorInformationString;
  void *v6;
  void *v7;

  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin CM controller is nil")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v4, 635, v6);
    v2 = 3758097084;
    goto LABEL_5;
  }
  v2 = HxISPCaptureDeviceController::RelinquishStreams(m_captureDeviceController, *((const __CFArray **)m_captureDeviceController + 1));
  if ((_DWORD)v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
    ErrorInformationString = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("fail during releaseControlOfStreams, OSStatus error 0x%x (%@)"), v2, v6));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v4, 642, v7);

LABEL_5:
  }
  return v2;
}

void sub_10000AE64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::enumerateStreamsIndices(DeviceCMInterface *this)
{
  unsigned int v2;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  StreamIdsInfo *p_m_streamIdsInfo;
  CFStringRef theString1;

  v2 = 0;
  *(_QWORD *)&this->m_streamIdsInfo.rgbTeleStreamId = -1;
  *(_QWORD *)&this->m_streamIdsInfo.rgbPearlStreamId = -1;
  *(_QWORD *)&this->m_streamIdsInfo.rgbSuperWideStreamId = -1;
  p_m_streamIdsInfo = &this->m_streamIdsInfo;
  v3 = (const __CFString *)kFigCaptureStreamProperty_PortType;
  v4 = (const __CFString *)kFigCapturePortType_FrontFacingInfraredCamera;
  v5 = (const __CFString *)kFigCapturePortType_FrontFacingCamera;
  v6 = (const __CFString *)kFigCapturePortType_FrontFacingSuperWideCamera;
  v7 = (const __CFString *)kFigCapturePortType_BackFacingSuperWideCamera;
  v8 = (const __CFString *)kFigCapturePortType_BackFacingCamera;
  v9 = (const __CFString *)kFigCapturePortType_BackFacingTelephotoCamera;
  v10 = (const __CFString *)kFigCapturePortType_BackFacingSparseTimeOfFlightCamera;
  do
  {
    theString1 = 0;
    if (HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, v2, v3, &theString1))v11 = 1;
    else
      v11 = theString1 == 0;
    if (!v11)
    {
      if (CFStringCompare(theString1, v4, 0) == kCFCompareEqualTo)
        this->m_streamIdsInfo.irPearlStreamId = v2;
      if (CFStringCompare(theString1, v5, 0) == kCFCompareEqualTo
        || CFStringCompare(theString1, v6, 0) == kCFCompareEqualTo)
      {
        this->m_streamIdsInfo.rgbPearlStreamId = v2;
      }
      if (CFStringCompare(theString1, v7, 0) == kCFCompareEqualTo)
        this->m_streamIdsInfo.rgbSuperWideStreamId = v2;
      if (CFStringCompare(theString1, v8, 0) == kCFCompareEqualTo)
        this->m_streamIdsInfo.rgbWideStreamId = v2;
      if (CFStringCompare(theString1, v9, 0) == kCFCompareEqualTo)
        p_m_streamIdsInfo->rgbTeleStreamId = v2;
      if (CFStringCompare(theString1, v10, 0) == kCFCompareEqualTo)
        this->m_streamIdsInfo.jasperStreamId = v2;
      CFRelease(theString1);
    }
    ++v2;
  }
  while (v2 != 8);
  if (!this->m_captureDeviceController || this->m_streamIdsInfo.irPearlStreamId < 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("IR Stream id not found")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v14, 703, v15);
    v12 = 3758097084;
LABEL_26:

    return v12;
  }
  if (this->m_streamIdsInfo.rgbPearlStreamId < 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("RGB Stream id not found")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v14, 709, v15);
    v12 = 0;
    goto LABEL_26;
  }
  return 0;
}

void sub_10000B140(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

BOOL DeviceCMInterface::isActivated(DeviceCMInterface *this)
{
  return this->m_captureDeviceController != 0;
}

uint64_t DeviceCMInterface::setPearlIRMultiOutMode(DeviceCMInterface *this)
{
  return DeviceCMInterface::setPearlMultiOutModeByStreamId(this, this->m_streamIdsInfo.irPearlStreamId, 1);
}

uint64_t DeviceCMInterface::setPearlMultiOutModeByStreamId(DeviceCMInterface *this, uint64_t a2, int a3)
{
  HxISPCaptureDeviceController *m_captureDeviceController;
  const __CFBoolean **v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const __CFString *ErrorInformationString;
  void *v11;
  void *v12;

  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin CM controller is nil")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 802, v11);
    v7 = 3758097084;
    goto LABEL_10;
  }
  if (this->m_streamIdsInfo.rgbPearlStreamId != (_DWORD)a2 && this->m_streamIdsInfo.irPearlStreamId != (_DWORD)a2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("stream id %d is invalid (should be %d for rgb or %d for ir)"), a2, this->m_streamIdsInfo.rgbPearlStreamId, this->m_streamIdsInfo.irPearlStreamId));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 808, v11);
    v7 = 3758097090;
    goto LABEL_10;
  }
  v6 = (const __CFBoolean **)&kCFBooleanTrue;
  if (!a3)
    v6 = (const __CFBoolean **)&kCFBooleanFalse;
  v7 = HxISPCaptureDeviceController::SetStreamProperty(m_captureDeviceController, a2, kFigCaptureStreamProperty_MultipleOutputSupportEnabled, *v6);
  if ((_DWORD)v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
    ErrorInformationString = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setMultiOutModeByStreamId failed, OSStatus error 0x%x (%@)"), v7, v11));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 819, v12);

    v7 = 3758097129;
LABEL_10:

  }
  return v7;
}

void sub_10000B3A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

BOOL DeviceCMInterface::isPearlIrExist(DeviceCMInterface *this)
{
  int irPearlStreamId;

  irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
  if (irPearlStreamId == -1)
  {
    DeviceCMInterface::enumerateStreamsIndices(this);
    irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
  }
  return irPearlStreamId != -1;
}

BOOL DeviceCMInterface::isPearlRgbExist(DeviceCMInterface *this)
{
  int rgbPearlStreamId;

  rgbPearlStreamId = this->m_streamIdsInfo.rgbPearlStreamId;
  if (rgbPearlStreamId == -1)
  {
    DeviceCMInterface::enumerateStreamsIndices(this);
    rgbPearlStreamId = this->m_streamIdsInfo.rgbPearlStreamId;
  }
  return rgbPearlStreamId != -1;
}

BOOL DeviceCMInterface::isJasperExist(DeviceCMInterface *this)
{
  int jasperStreamId;

  jasperStreamId = this->m_streamIdsInfo.jasperStreamId;
  if (jasperStreamId == -1)
  {
    DeviceCMInterface::enumerateStreamsIndices(this);
    jasperStreamId = this->m_streamIdsInfo.jasperStreamId;
  }
  return jasperStreamId != -1;
}

uint64_t DeviceCMInterface::setPearlRGBMultiOutMode(DeviceCMInterface *this)
{
  return DeviceCMInterface::setPearlMultiOutModeByStreamId(this, this->m_streamIdsInfo.rgbPearlStreamId, 1);
}

uint64_t DeviceCMInterface::setStreamProperty(DeviceCMInterface *this, uint64_t a2, const __CFString *a3, NSDictionary *a4)
{
  NSDictionary *v7;
  HxISPCaptureDeviceController *m_captureDeviceController;
  DeviceCMInterface *v9;
  void *v10;
  void *v11;
  const __CFString *ErrorInformationString;
  void *v13;
  void *v14;
  uint64_t v15;

  v7 = a4;
  m_captureDeviceController = this->m_captureDeviceController;
  if (m_captureDeviceController)
  {
    v9 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(m_captureDeviceController, a2, a3, (const __CFBoolean *)v7);
    if (!(_DWORD)v9)
    {
      v15 = 0;
      goto LABEL_7;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent"));
    ErrorInformationString = DeviceCMInterface::getErrorInformationString(v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SetStreamProperty %@ for stream id %d failed with OSStatus 0x%x (%@)"), a3, a2, v9, v13));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v11, 839, v14);

    v15 = 3758097129;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin CM controller is nil")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v11, 831, v13);
    v15 = 3758097084;
  }

LABEL_7:
  return v15;
}

void sub_10000B624(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::enablePearlIROutput(DeviceCMInterface *this)
{
  const void *v2;
  void *v3;
  NSDictionary *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  __CFDictionary *Mutable;
  const __CFBoolean *v10;
  DeviceCMInterface *v11;
  const __CFString *ErrorInformationString;
  void *v13;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v2 = (const void *)kFigCaptureStreamVideoOutputID_PrimaryScaler;
  v17 = kFigCaptureStreamVideoOutputID_PrimaryScaler;
  v15 = kFigCaptureStreamVideoOutputConfigurationKey_AttachRaw;
  v16 = &__kCFBooleanTrue;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
  v18 = v3;
  v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));

  v5 = DeviceCMInterface::setStreamProperty(this, this->m_streamIdsInfo.irPearlStreamId, kFigCaptureStreamProperty_VideoOutputConfigurations, v4);
  if (!(_DWORD)v5)
  {
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v10 = Mutable;
    if (Mutable)
    {
      CFDictionarySetValue(Mutable, v2, kCFBooleanTrue);
      v11 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, kFigCaptureStreamProperty_VideoOutputsEnabled, v10);
      if ((_DWORD)v11)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
        ErrorInformationString = DeviceCMInterface::getErrorInformationString(v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("enableIROutput failed with OSStatus 0x%x (%@)"), v11, v8));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v7, 870, v13);

        v5 = 3758097129;
        goto LABEL_3;
      }
      CFRelease(v10);
    }
    v5 = 0;
    goto LABEL_9;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Configure the primary output failed")));
  NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v7, 855, v8);
LABEL_3:

LABEL_9:
  return v5;
}

void sub_10000B8D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v4;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::enablePearlRGBOutput(DeviceCMInterface *this)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = DeviceCMInterface::enableRGBOutputForStreamId(this, this->m_streamIdsInfo.rgbPearlStreamId);
  if ((_DWORD)v1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastPathComponent"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("enableRGBOutput failed")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v3, 914, v4);

  }
  return v1;
}

void sub_10000B9FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setPearlIrCofiguration(DeviceCMInterface *this, int a2)
{
  NSDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  const __CFString *v24;
  void *v25;

  switch(a2)
  {
    case 0:
      v24 = CFSTR("EnableIRProjector");
      v25 = &__kCFBooleanFalse;
      v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Setting Pearl Ir configuration to %@"), CFSTR("None")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v5, 972, v6);
      goto LABEL_10;
    case 1:
      v22[0] = CFSTR("EnableIRProjector");
      v22[1] = CFSTR("ProjectorType");
      v23[0] = &__kCFBooleanTrue;
      v23[1] = CFSTR("Flood");
      v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 2));
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Setting Pearl Ir configuration to %@"), CFSTR("Flood")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v5, 981, v6);
      goto LABEL_10;
    case 2:
      v20[0] = CFSTR("EnableIRProjector");
      v20[1] = CFSTR("ProjectorType");
      v21[0] = &__kCFBooleanTrue;
      v21[1] = CFSTR("SparseLowPower");
      v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Setting Pearl Ir configuration to %@"), CFSTR("SparseLowPower")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v5, 989, v6);
      goto LABEL_10;
    case 3:
      v18[0] = CFSTR("EnableIRProjector");
      v18[1] = CFSTR("ProjectorType");
      v19[0] = &__kCFBooleanTrue;
      v19[1] = CFSTR("Sparse");
      v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 2));
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Setting Pearl Ir configuration to %@"), CFSTR("Sparse")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v5, 997, v6);
      goto LABEL_10;
    case 4:
      v14[0] = CFSTR("EnableIRProjector");
      v14[1] = CFSTR("ProjectorType");
      v15[0] = &__kCFBooleanTrue;
      v15[1] = CFSTR("Dense");
      v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 2));
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Setting Pearl Ir configuration to %@"), CFSTR("Dense")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v5, 1014, v6);
      goto LABEL_10;
    case 5:
      v16[0] = CFSTR("EnableIRProjector");
      v16[1] = CFSTR("ProjectorType");
      v17[0] = &__kCFBooleanTrue;
      v17[1] = CFSTR("DenseProbeAB");
      v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 2));
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Setting Pearl Ir configuration to %@"), CFSTR("DenseProbeAB")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v5, 1005, v6);
      goto LABEL_10;
    case 6:
      v12[0] = CFSTR("EnableIRProjector");
      v12[1] = CFSTR("ProjectorType");
      v13[0] = &__kCFBooleanTrue;
      v13[1] = CFSTR("SparseProbeAB");
      v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Setting Pearl Ir configuration to %@"), CFSTR("SparseProbeAB")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v5, 1023, v6);
LABEL_10:

      break;
    default:
      v3 = 0;
      break;
  }
  v7 = DeviceCMInterface::setStreamProperty(this, this->m_streamIdsInfo.irPearlStreamId, CFSTR("IRProjectorParams"), v3);
  if ((_DWORD)v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setProjectorMode failed")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 1031, v10);

  }
  return v7;
}

void sub_10000C054(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setPearlDepthConfiguration(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  __CFDictionary *Mutable;
  CFNumberRef v9;
  CFNumberRef v10;
  const void **v11;
  __CFArray *v12;
  __CFArray *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const __CFString *ErrorInformationString;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  uint64_t valuePtr;

  v24 = a3;
  valuePtr = a2;
  if (!*(_QWORD *)(a1 + 16))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "lastPathComponent"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin CM controller is nil")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v21, 1042, v22, v24, valuePtr);
    v14 = 3758097084;

    return v14;
  }
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v9 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  v10 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v24);
  CFDictionarySetValue(Mutable, kFigCaptureStreamDepthEngineConfigurationKey_OutputWidth, v9);
  CFDictionarySetValue(Mutable, kFigCaptureStreamDepthEngineConfigurationKey_OutputHeight, v10);
  CFRelease(v9);
  CFRelease(v10);
  v11 = (const void **)&kFigCapturePortType_FrontFacingCamera;
  if (!a4)
    v11 = (const void **)&kFigCapturePortType_FrontFacingInfraredCamera;
  CFDictionarySetValue(Mutable, kFigCaptureStreamDepthEngineConfigurationKey_DepthPerspectivePortType, *v11);
  v12 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  v13 = v12;
  if ((a5 & 1) != 0)
  {
    CFArrayAppendValue(v12, kFigCaptureStreamDepthData_DX);
    if ((a5 & 0x10000) == 0)
    {
LABEL_6:
      if ((a5 & 0x1000000) == 0)
        goto LABEL_7;
      goto LABEL_16;
    }
  }
  else if ((a5 & 0x10000) == 0)
  {
    goto LABEL_6;
  }
  CFArrayAppendValue(v13, kFigCaptureStreamDepthData_DY);
  if ((a5 & 0x1000000) == 0)
  {
LABEL_7:
    if ((a5 & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  CFArrayAppendValue(v13, kFigCaptureStreamDepthData_DepthImage);
  if ((a5 & 0x100) == 0)
  {
LABEL_8:
    if ((a5 & 0x100000000) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_17:
  CFArrayAppendValue(v13, kFigCaptureStreamDepthData_NormalizedDX);
  if ((a5 & 0x100000000) != 0)
LABEL_9:
    CFArrayAppendValue(v13, kFigCaptureStreamDepthData_GMS);
LABEL_10:
  CFDictionarySetValue(Mutable, kFigCaptureStreamDepthEngineConfigurationKey_EnabledOutputs, v13);
  v14 = HxISPCaptureDeviceController::SetStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), *(_DWORD *)(a1 + 36), kFigCaptureStreamProperty_DepthEngineConfiguration, Mutable);
  CFRelease(v13);
  if ((_DWORD)v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent"));
    ErrorInformationString = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setDepthCofiguration failed with OSStatus 0x%x (%@)"), v14, v18));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v16, 1092, v19, v24, valuePtr);

    return 3758097129;
  }
  return v14;
}

void sub_10000C4A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::startRgbSuperWideRgbStream(DeviceCMInterface *this)
{
  return DeviceCMInterface::startRgbStream(this, this->m_streamIdsInfo.rgbSuperWideStreamId);
}

uint64_t DeviceCMInterface::startRgbStream(DeviceCMInterface *this, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t started;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  DeviceCMInterface *v17;
  const __CFString *ErrorInformationString;
  uint64_t v19;
  DeviceCMInterface *v20;
  const __CFString *v21;

  if (!this->m_captureDeviceController)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin CM controller is nil")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v12, 1289, v14);
    started = 3758097084;
LABEL_13:

    return started;
  }
  if ((a2 & 0x80000000) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("stream id is invalid")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v5, 1295, v6);

  }
  if (!this->m_currentJasperConfiguration.bitMaskID)
  {
    v16 = HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, a2, kFigCaptureStreamProperty_MinimumFrameRate, (const __CFBoolean *)&off_10001FAC8);
    if ((_DWORD)v16)
    {
      v17 = (DeviceCMInterface *)v16;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
      ErrorInformationString = DeviceCMInterface::getErrorInformationString(v17);
      v14 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("set min fps 30 failed with OSStatus 0x%x (%@)"), v17, v14));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v12, 1301, v15);
      goto LABEL_12;
    }
    v19 = HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, a2, kFigCaptureStreamProperty_MaximumFrameRate, (const __CFBoolean *)&off_10001FAC8);
    if ((_DWORD)v19)
    {
      v20 = (DeviceCMInterface *)v19;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
      v21 = DeviceCMInterface::getErrorInformationString(v20);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("set max fps 30 failed with OSStatus 0x%x (%@)"), v20, v14));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v12, 1307, v15);
      goto LABEL_12;
    }
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("start receiving stream id: %d"), a2));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 1312, v9);

  started = HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks(this->m_captureDeviceController, a2, (void (*)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *))sub_10000D5B8, this, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
              0,
              0,
              0);
  if ((_DWORD)started)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
    v13 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)started);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("startRgbStream failed with OSStatus 0x%x (%@)"), started, v14));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v12, 1321, v15);
LABEL_12:

    started = 3758097129;
    goto LABEL_13;
  }
  return started;
}

void sub_10000C874(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::startRgbWideRgbStream(DeviceCMInterface *this)
{
  return DeviceCMInterface::startRgbStream(this, this->m_streamIdsInfo.rgbWideStreamId);
}

uint64_t DeviceCMInterface::startJasperStream(DeviceCMInterface *this)
{
  HxISPCaptureDeviceController *m_captureDeviceController;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *ErrorInformationString;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  const __CFString *v16;
  DeviceCMInterface *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  const __CFNumber *v23;
  uint64_t v24;
  DeviceCMInterface *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  DeviceCMInterface *v31;
  const __CFString *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  DeviceCMInterface *started;
  const __CFString *v38;
  void *v39;
  id v40;
  unsigned int valuePtr;
  const __CFBoolean *v42;

  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin CM controller is nil")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v12, 1114, v13);

    return 3758097084;
  }
  v42 = 0;
  valuePtr = 0x7FFFFFFF;
  v40 = 0;
  v3 = HxISPCaptureDeviceController::CopyStreamProperty(m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, kFigCaptureProperty_SupportedPropertiesDictionary, &v40);
  if ((_DWORD)v3)
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
    ErrorInformationString = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("get SupportedPropertiesDictionary failed with OSStatus 0x%x (%@)"), v4, v8));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 1127, v9);
    goto LABEL_4;
  }
  v15 = v40;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "allKeys"));

  v40 = 0;
  v16 = (const __CFString *)kFigCaptureStreamProperty_MaximumAllowedFrameRate;
  if (objc_msgSend(v5, "containsObject:", kFigCaptureStreamProperty_MaximumAllowedFrameRate))
  {
    v17 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, v16, &v42);
    if ((_DWORD)v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastPathComponent"));
      v20 = DeviceCMInterface::getErrorInformationString(v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("failed resolving maximum frame rate information OSStatus 0x%x (%@)"), v17, v21));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v19, 1148, v22);
      v10 = 3758097129;

      if (v42)
        CFRelease(v42);
      goto LABEL_5;
    }
    v23 = v42;
    if (!v42)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("null maximum frame rate detected")));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 1156, v9);
      v4 = 3758097129;
      goto LABEL_4;
    }
  }
  else
  {
    v23 = (const __CFNumber *)&off_10001FAB0;
    v42 = (const __CFBoolean *)&off_10001FAB0;
  }
  CFNumberGetValue(v23, kCFNumberSInt32Type, &valuePtr);
  v24 = valuePtr;
  v25 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, kFigCaptureStreamProperty_MinimumFrameRate, v42);
  v4 = 3758097129;
  if ((_DWORD)v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "lastPathComponent"));
    v28 = DeviceCMInterface::getErrorInformationString(v25);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("set min fps of %d failed with OSStatus 0x%x (%@)"), v24, v25, v29));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v27, 1168, v30);
  }
  else
  {
    v31 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, kFigCaptureStreamProperty_MaximumFrameRate, v42);
    if (!(_DWORD)v31)
    {
      v10 = 0;
      v33 = 1;
      goto LABEL_18;
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "lastPathComponent"));
    v32 = DeviceCMInterface::getErrorInformationString(v31);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v32);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("set max fps of %d failed with OSStatus 0x%x (%@)"), v24, v31, v29));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v27, 1176, v30);
  }

  v33 = 0;
  v10 = 3758097129;
LABEL_18:
  CFRelease(v42);
  if (!v33)
    goto LABEL_5;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "lastPathComponent"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("start receiving stream id: %d"), this->m_streamIdsInfo.jasperStreamId));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v35, 1187, v36);

  started = (DeviceCMInterface *)HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                   0,
                                   (void (*)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *))sub_10000CF90,
                                   this);
  if (!(_DWORD)started)
  {
    v10 = 0;
    goto LABEL_5;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
  v38 = DeviceCMInterface::getErrorInformationString(started);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("startJasperStream failed with OSStatus 0x%x (%@)"), started, v9));
  NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 1201, v39);

LABEL_4:
  v10 = v4;
LABEL_5:

  return v10;
}

void sub_10000CEC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

uint64_t sub_10000CF90(uint64_t result, __int128 *a2, int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  unsigned int v7;
  __int128 v8;
  uint64_t v9;

  if (a4)
  {
    v4 = result;
    result = *(_QWORD *)(a4 + 8);
    if (result)
    {
      if (*(_DWORD *)(a4 + 36) == a3)
      {
        v5 = 1;
      }
      else
      {
        if (*(_DWORD *)(a4 + 40) == a3)
          v6 = 3;
        else
          v6 = 0;
        if (*(_DWORD *)(a4 + 32) == a3)
          v7 = 2;
        else
          v7 = v6;
        if (*(_DWORD *)(a4 + 44) == a3)
          v5 = 4;
        else
          v5 = v7;
      }
      v8 = *a2;
      v9 = *((_QWORD *)a2 + 2);
      return (*(uint64_t (**)(uint64_t, uint64_t, __int128 *, uint64_t))(*(_QWORD *)result + 8))(result, v4, &v8, v5);
    }
  }
  return result;
}

uint64_t DeviceCMInterface::stopJasperStream(DeviceCMInterface *this)
{
  HxISPCaptureDeviceController *m_captureDeviceController;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *ErrorInformationString;
  void *v10;
  void *v11;

  m_captureDeviceController = this->m_captureDeviceController;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
  v4 = v3;
  if (!m_captureDeviceController)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin CM controller is nil")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 1212, v10);
    v7 = 3758097084;
    goto LABEL_5;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("stop receiving stream id: %d"), this->m_streamIdsInfo.jasperStreamId));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v5, 1216, v6);

  v7 = HxISPCaptureDeviceController::stopReceive(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId);
  if ((_DWORD)v7)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
    ErrorInformationString = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("stopJasperStream failed with OSStatus 0x%x (%@)"), v7, v10));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 1220, v11);

    v7 = 3758097129;
LABEL_5:

  }
  return v7;
}

void sub_10000D1C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::startPearlIrStream(DeviceCMInterface *this)
{
  HxISPCaptureDeviceController *m_captureDeviceController;
  uint64_t v3;
  DeviceCMInterface *v4;
  void *v5;
  void *v6;
  const __CFString *ErrorInformationString;
  void *v8;
  void *v9;
  uint64_t started;
  DeviceCMInterface *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  const __CFString *v16;

  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin CM controller is nil")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 1232, v8);
    started = 3758097084;
LABEL_10:

    return started;
  }
  v3 = HxISPCaptureDeviceController::SetStreamProperty(m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, kFigCaptureStreamProperty_MinimumFrameRate, (const __CFBoolean *)&off_10001FAC8);
  if ((_DWORD)v3)
  {
    v4 = (DeviceCMInterface *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
    ErrorInformationString = DeviceCMInterface::getErrorInformationString(v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("set min fps 30 failed with OSStatus 0x%x (%@)"), v4, v8));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 1239, v9);
LABEL_9:

    started = 3758097129;
    goto LABEL_10;
  }
  v11 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, kFigCaptureStreamProperty_MaximumFrameRate, (const __CFBoolean *)&off_10001FAC8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
  v5 = v12;
  if ((_DWORD)v11)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent"));
    v13 = DeviceCMInterface::getErrorInformationString(v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("set max fps 30 failed with OSStatus 0x%x (%@)"), v11, v8));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 1245, v9);
    goto LABEL_9;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("start receiving stream id: %d"), this->m_streamIdsInfo.irPearlStreamId));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v14, 1250, v15);

  started = HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, (void (*)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *))sub_10000D5B8, this, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
              0,
              0,
              0);
  if ((_DWORD)started)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
    v16 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)started);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("startIrStream failed with OSStatus 0x%x (%@)"), started, v8));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 1259, v9);
    goto LABEL_9;
  }
  return started;
}

void sub_10000D540(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

uint64_t (***sub_10000D5B8(uint64_t (***result)(_QWORD, _QWORD, __int128 *, uint64_t), __int128 *a2, int a3, uint64_t a4))(_QWORD, _QWORD, __int128 *, uint64_t)
{
  uint64_t (***v4)(_QWORD, _QWORD, _OWORD *, uint64_t);
  uint64_t v5;
  unsigned int v6;
  __int128 v7;
  uint64_t v8;

  if (a4)
  {
    v4 = result;
    result = *(uint64_t (****)(_QWORD, _QWORD, __int128 *, uint64_t))(a4 + 8);
    if (result)
    {
      if (*(_DWORD *)(a4 + 36) == a3)
      {
        v5 = 1;
      }
      else
      {
        if (*(_DWORD *)(a4 + 28) == a3)
          v6 = 5;
        else
          v6 = 0;
        if (*(_DWORD *)(a4 + 40) == a3)
          v6 = 3;
        if (*(_DWORD *)(a4 + 32) == a3)
          v6 = 2;
        if (*(_DWORD *)(a4 + 44) == a3)
          v5 = 4;
        else
          v5 = v6;
      }
      v7 = *a2;
      v8 = *((_QWORD *)a2 + 2);
      return (uint64_t (***)(_QWORD, _QWORD, __int128 *, uint64_t))(**result)(result, v4, &v7, v5);
    }
  }
  return result;
}

uint64_t DeviceCMInterface::stopPearlIrStream(DeviceCMInterface *this)
{
  HxISPCaptureDeviceController *m_captureDeviceController;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *ErrorInformationString;
  void *v10;
  void *v11;

  m_captureDeviceController = this->m_captureDeviceController;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
  v4 = v3;
  if (!m_captureDeviceController)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin CM controller is nil")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 1270, v10);
    v7 = 3758097084;
    goto LABEL_5;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("stop receiving stream id: %d"), this->m_streamIdsInfo.irPearlStreamId));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v5, 1274, v6);

  v7 = HxISPCaptureDeviceController::stopReceive(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId);
  if ((_DWORD)v7)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
    ErrorInformationString = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("stopIrStream failed with OSStatus 0x%x (%@)"), v7, v10));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 1278, v11);

    v7 = 3758097129;
LABEL_5:

  }
  return v7;
}

void sub_10000D7F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::startPearlRgbStream(DeviceCMInterface *this)
{
  return DeviceCMInterface::startRgbStream(this, this->m_streamIdsInfo.rgbPearlStreamId);
}

uint64_t DeviceCMInterface::stopRgbStream(DeviceCMInterface *this, uint64_t a2)
{
  HxISPCaptureDeviceController *m_captureDeviceController;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *ErrorInformationString;
  void *v12;
  void *v13;

  m_captureDeviceController = this->m_captureDeviceController;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
  v6 = v5;
  if (!m_captureDeviceController)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin CM controller is nil")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v10, 1337, v12);
    v9 = 3758097084;
    goto LABEL_5;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("stop receiving stream id: %d"), a2));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v7, 1341, v8);

  v9 = HxISPCaptureDeviceController::stopReceive(this->m_captureDeviceController, a2);
  if ((_DWORD)v9)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
    ErrorInformationString = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("stopRgbStream failed with OSStatus 0x%x (%@)"), v9, v12));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v10, 1345, v13);

LABEL_5:
  }
  return v9;
}

void sub_10000DA04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::stopPearlRgbStream(DeviceCMInterface *this)
{
  return DeviceCMInterface::stopRgbStream(this, this->m_streamIdsInfo.rgbPearlStreamId);
}

uint64_t DeviceCMInterface::stopRgbSuperWideStream(DeviceCMInterface *this)
{
  return DeviceCMInterface::stopRgbStream(this, this->m_streamIdsInfo.rgbSuperWideStreamId);
}

uint64_t DeviceCMInterface::stopRgbWideStream(DeviceCMInterface *this)
{
  return DeviceCMInterface::stopRgbStream(this, this->m_streamIdsInfo.rgbWideStreamId);
}

uint64_t DeviceCMInterface::validateJasperFwStatus(DeviceCMInterface *this, unsigned int *a2)
{
  DeviceCMInterface *v4;
  uint64_t result;
  void *v6;
  void *v7;
  uint64_t irPearlStreamId;
  const __CFString *ErrorInformationString;
  void *v10;
  void *v11;
  unsigned int valuePtr;
  CFNumberRef number;

  number = 0;
  valuePtr = 0x7FFFFFFF;
  *a2 = 0x7FFFFFFF;
  v4 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, CFSTR("ValidateComplianceWithDetails"), &number);
  if (number)
  {
    CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
    CFRelease(number);
    result = 0;
    *a2 = valuePtr;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
    irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
    ErrorInformationString = DeviceCMInterface::getErrorInformationString(v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("validateJasperFwStatus failed with OSStatus 0x%x for stream id %d (%@)"), v4, irPearlStreamId, v10));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v7, 1385, v11);

    return 3758097084;
  }
  return result;
}

void sub_10000DBA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::validateIrFwStatus(DeviceCMInterface *this, unsigned int *a2)
{
  HxISPCaptureDeviceController *m_captureDeviceController;
  unsigned int v5;
  uint64_t v6;
  DeviceCMInterface *v7;
  void *v8;
  void *v9;
  uint64_t irPearlStreamId;
  const __CFString *ErrorInformationString;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int valuePtr;
  CFNumberRef number;

  number = 0;
  valuePtr = 0x7FFFFFFF;
  *a2 = 0x7FFFFFFF;
  m_captureDeviceController = this->m_captureDeviceController;
  if (m_captureDeviceController
    && *((_BYTE *)m_captureDeviceController + 2148)
    && (v5 = this->m_streamIdsInfo.irPearlStreamId, (v5 & 0x80000000) == 0))
  {
    v6 = HxISPCaptureDeviceController::CopyStreamProperty(m_captureDeviceController, v5, CFSTR("ValidateComplianceWithDetails"), &number);
    if ((_DWORD)v6)
    {
      v7 = (DeviceCMInterface *)v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
      irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
      ErrorInformationString = DeviceCMInterface::getErrorInformationString(v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("validateIrFwStatus failed with OSStatus 0x%x for stream id %d (%@)"), v7, irPearlStreamId, v12));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 1407, v13);
      v14 = 3758097084;

    }
    else
    {
      v14 = 0;
    }
    if (number)
    {
      CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
      CFRelease(number);
      *a2 = valuePtr;
      return v14;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("validateIrFwStatus failed as bit mask was NULL")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v16, 1419, v17);
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("device is not activated")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v16, 1400, v17);
  }
  v14 = 3758097084;

  return v14;
}

void sub_10000DDF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::enableDefaultDepthStream(DeviceCMInterface *this)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = DeviceCMInterface::setPearlDepthConfiguration((uint64_t)this, 360, 640, 1, 0x1000000);
  if ((_DWORD)v1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastPathComponent"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setDepthCofiguration failed")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v3, 1435, v4);

  }
  return v1;
}

void sub_10000DEF0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::setPearlMultiCam(DeviceCMInterface *this)
{
  void *v2;
  void *v3;
  void *v4;
  const void *Group;
  uint64_t v6;
  const void *v7;
  void *v8;
  void *v9;
  void *v10;
  DeviceCMInterface *v11;
  __CFArray *Mutable;
  __CFArray *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t irPearlStreamId;
  const __CFString *ErrorInformationString;
  void *v22;
  void *v23;
  uint64_t v25;
  __CFArray *v26;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastPathComponent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setting multicam...")));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v3, 1443, v4);

  Group = (const void *)HxISPCaptureDeviceController::FindGroup(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId);
  v6 = HxISPCaptureDeviceController::FindGroup(this->m_captureDeviceController, this->m_streamIdsInfo.rgbPearlStreamId);
  if (Group && (v7 = (const void *)v6, Group != (const void *)v6) && v6)
  {
    CFRelease(Group);
    CFRelease(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("cannot set multi cam if both rgb/ir groups not the same")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 1452, v10);

    return (DeviceCMInterface *)3758097084;
  }
  else
  {
    Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 1, &kCFTypeArrayCallBacks);
    v13 = Mutable;
    if (Mutable)
      CFArrayAppendValue(Mutable, Group);
    v25 = kFigCaptureDeviceMultiCamConfigurationKey_ActiveSynchronizedStreamsGroups;
    v26 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
    v11 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetDeviceProperty(this->m_captureDeviceController, kFigCaptureDeviceProperty_MultiCamConfiguration, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setting kFigCaptureDeviceProperty_MultiCamConfiguration return val is %d"), v11));
    NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v16, 1469, v17);

    if (v13)
      CFRelease(v13);
    if ((_DWORD)v11)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastPathComponent"));
      irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
      ErrorInformationString = DeviceCMInterface::getErrorInformationString(v11);
      v22 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("kFigCaptureDeviceProperty_MultiCamConfiguration failed with OSStatus 0x%x for stream id %d (%@)"), v11, irPearlStreamId, v22));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v19, 1476, v23);

    }
  }
  return v11;
}

void sub_10000E23C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::enableSyncForEnumeratedStreams(DeviceCMInterface *this, int a2)
{
  unsigned int irPearlStreamId;
  __CFArray *Mutable;
  __CFArray *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t rgbPearlStreamId;
  const __CFString *ErrorInformationString;
  void *v11;
  void *v12;

  if (!this->m_captureDeviceController
    || this->m_streamIdsInfo.rgbPearlStreamId < 0
    || this->m_streamIdsInfo.irPearlStreamId < 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("cannot enableSyncForEnumeratedStreams one or more stream ids is invalid")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 1486, v11);
    v6 = 3758097084;
    goto LABEL_13;
  }
  irPearlStreamId = a2;
  this->m_primarySyncModeStreamID = a2;
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 2, &kCFTypeArrayCallBacks);
  v5 = Mutable;
  if (Mutable)
  {
    CFArrayAppendValue(Mutable, *((const void **)this->m_captureDeviceController + this->m_streamIdsInfo.rgbPearlStreamId + 2));
    CFArrayAppendValue(v5, *((const void **)this->m_captureDeviceController + this->m_streamIdsInfo.irPearlStreamId + 2));
  }
  if (!irPearlStreamId)
    irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
  v6 = HxISPCaptureDeviceController::SetGroupProperty(this->m_captureDeviceController, irPearlStreamId, kFigCaptureSynchronizedStreamsGroupProperty_ActiveStreams, v5);
  if (v5)
    CFRelease(v5);
  if ((_DWORD)v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
    rgbPearlStreamId = this->m_streamIdsInfo.rgbPearlStreamId;
    ErrorInformationString = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("enableSyncForEnumeratedStreams failed with OSStatus 0x%x for stream id %d (%@)"), v6, rgbPearlStreamId, v11));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 1538, v12);

    v6 = 3758097129;
LABEL_13:

  }
  return v6;
}

void sub_10000E4C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setPearlSyncSlave(DeviceCMInterface *this, uint64_t a2, int a3)
{
  __CFDictionary *Mutable;
  CFNumberRef v7;
  DeviceCMInterface *v8;
  void *v9;
  void *v10;
  const __CFString *ErrorInformationString;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  int valuePtr;

  valuePtr = a3;
  if (this->m_captureDeviceController)
  {
    if ((a2 & 0x80000000) == 0
      || this->m_streamIdsInfo.irPearlStreamId == (_DWORD)a2
      || this->m_streamIdsInfo.rgbPearlStreamId == (_DWORD)a2)
    {
      Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(Mutable, kFigCaptureStreamSynchronizedStreamsSlaveConfigurationKey_StreamingOutputsEnabled, kCFBooleanTrue);
      CFDictionarySetValue(Mutable, kFigCaptureStreamSynchronizedStreamsSlaveConfigurationKey_FrameSkippingEnabled, kCFBooleanFalse);
      if (a3)
      {
        v7 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
        CFDictionarySetValue(Mutable, kFigCaptureStreamSynchronizedStreamsSlaveConfigurationKey_MasterToSlaveFrameRateRatio, v7);
        CFRelease(v7);
      }
      v8 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, a2, kFigCaptureStreamProperty_SynchronizedStreamsSlaveConfiguration, Mutable);
      CFRelease(Mutable);
      if ((_DWORD)v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent"));
        ErrorInformationString = DeviceCMInterface::getErrorInformationString(v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setSyncSlave failed with OSStatus 0x%x for stream id %d (%@)"), v8, a2, v12));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v10, 1598, v13);

      }
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastPathComponent"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("cannot set stream %d as master for sync, stream is invalid"), a2));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v19, 1556, v20);

      return 3758096385;
    }
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastPathComponent"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin CM controller is nil")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v15, 1549, v16);

    return 3758097084;
  }
  return (uint64_t)v8;
}

void sub_10000E7B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setPearlIRAsSyncSlave(DeviceCMInterface *this, int a2)
{
  return DeviceCMInterface::setPearlSyncSlave(this, this->m_streamIdsInfo.irPearlStreamId, a2);
}

uint64_t DeviceCMInterface::setPearlRgbAsSyncSlave(DeviceCMInterface *this, int a2)
{
  return DeviceCMInterface::setPearlSyncSlave(this, this->m_streamIdsInfo.rgbPearlStreamId, a2);
}

DeviceCMInterface *DeviceCMInterface::disablePearlSyncMode(DeviceCMInterface *this, unsigned int irPearlStreamId)
{
  int m_primarySyncModeStreamID;
  HxISPCaptureDeviceController *m_captureDeviceController;
  const __CFString *v5;
  DeviceCMInterface *v6;
  void *v7;
  void *v8;
  const __CFString *ErrorInformationString;
  void *v10;
  void *v11;

  m_primarySyncModeStreamID = this->m_primarySyncModeStreamID;
  if (m_primarySyncModeStreamID == -1)
  {
    m_captureDeviceController = this->m_captureDeviceController;
    if (!irPearlStreamId)
      irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
    v5 = (const __CFString *)kFigCaptureSynchronizedStreamsGroupProperty_ActiveStreams;
  }
  else
  {
    m_captureDeviceController = this->m_captureDeviceController;
    v5 = (const __CFString *)kFigCaptureSynchronizedStreamsGroupProperty_ActiveStreams;
    irPearlStreamId = m_primarySyncModeStreamID;
  }
  v6 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetGroupProperty(m_captureDeviceController, irPearlStreamId, v5, 0);
  if ((_DWORD)v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
    ErrorInformationString = DeviceCMInterface::getErrorInformationString(v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("disableSyncMode failed with OSStatus 0x%x for stream id (%@)"), v6, v10));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 1636, v11);

  }
  return v6;
}

void sub_10000E92C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setPearlFormatIndex(DeviceCMInterface *this, unsigned int a2)
{
  return HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, a2, kFigCaptureStreamProperty_FormatIndex, (const __CFBoolean *)+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
}

uint64_t DeviceCMInterface::configPearlDevice(DeviceCMInterface *this, const PearlConfiguration *a2)
{
  uint64_t rgbPearlStreamId;
  _BOOL4 isRgbOn;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL isIrOn;
  uint64_t irPearlStreamId;
  uint64_t v21;
  uint64_t PearlProjectorHWVersion;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  int v43;

  *(_WORD *)&this->m_isPearlRgbConfigured = 0;
  *(_WORD *)&this->m_currentPearlConfiguration.isIrOn = 0;
  this->m_currentPearlConfiguration.isRgbOn = 0;
  this->m_currentPearlConfiguration.irType = 0;
  this->m_currentPearlConfiguration.bitMaskID = 0;
  if (a2->isRgbOn)
  {
    rgbPearlStreamId = this->m_streamIdsInfo.rgbPearlStreamId;
    if ((_DWORD)rgbPearlStreamId == -1)
    {
      DeviceCMInterface::enumerateStreamsIndices(this);
      rgbPearlStreamId = this->m_streamIdsInfo.rgbPearlStreamId;
      if ((_DWORD)rgbPearlStreamId == -1)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("no available RGB stream index")));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 1731, v10);
LABEL_32:
        v11 = 3758097136;
        goto LABEL_40;
      }
      isRgbOn = a2->isRgbOn;
    }
    else
    {
      isRgbOn = 1;
    }
    if (a2->isIrOn && isRgbOn)
    {
      v11 = DeviceCMInterface::enableSyncForEnumeratedStreams(this, rgbPearlStreamId);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("cmsync 2 3 (enableSyncForEnumeratedStreams) ret = %d"), v11));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v13, 1740, v14);

      if ((_DWORD)v11)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("enableSyncForEnumeratedStreams failed")));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 1744, v10);
        goto LABEL_40;
      }
      v11 = (uint64_t)DeviceCMInterface::setPearlMultiCam(this);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "lastPathComponent"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CMMULTICAMCREATE -s 2 3(setPearlMultiCam) ret = %d"), v11));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v17, 1750, v18);

      if ((_DWORD)v11)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setMultiOutModeByStreamId for rgb failed")));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 1754, v10);
        goto LABEL_40;
      }
      v11 = HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.rgbPearlStreamId, kFigCaptureStreamProperty_FormatIndex, (const __CFBoolean *)+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "lastPathComponent"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("cmsetcurrentformat 2 0, setPearlFormatIndex(m_streamIdsInfo.rgbPearlStreamId, 0) ret = %d"), this->m_streamIdsInfo.rgbPearlStreamId));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v27, 1760, v28);

      if ((_DWORD)v11)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setMultiOutModeByStreamId for rgb failed")));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 1764, v10);
        goto LABEL_40;
      }
      rgbPearlStreamId = this->m_streamIdsInfo.rgbPearlStreamId;
    }
    v7 = DeviceCMInterface::setPearlMultiOutModeByStreamId(this, rgbPearlStreamId, 1);
    if ((_DWORD)v7)
    {
      v11 = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setMultiOutModeByStreamId for rgb failed")));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 1773, v10);
LABEL_40:

      return v11;
    }
    v15 = DeviceCMInterface::enablePearlRGBOutput(this);
    if ((_DWORD)v15)
    {
      v11 = v15;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Configure the primary output to multioutput + enable failed")));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 1781, v10);
      goto LABEL_40;
    }
    this->m_isPearlRgbConfigured = 1;
  }
  isIrOn = a2->isIrOn;
  if (!a2->isIrOn)
    goto LABEL_49;
  irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
  if ((_DWORD)irPearlStreamId == -1)
  {
    DeviceCMInterface::enumerateStreamsIndices(this);
    irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
    if ((_DWORD)irPearlStreamId == -1)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("no available IR stream index")));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 1792, v10);
      goto LABEL_32;
    }
  }
  v21 = DeviceCMInterface::setPearlMultiOutModeByStreamId(this, irPearlStreamId, 1);
  if ((_DWORD)v21)
  {
    v11 = v21;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setMultiOutModeByStreamId failed")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 1800, v10);
    goto LABEL_40;
  }
  if (this->m_hVersion < 11)
    goto LABEL_35;
  v43 = 0;
  PearlProjectorHWVersion = DeviceCMInterface::getPearlProjectorHWVersion(this, &v43);
  if (!(_DWORD)PearlProjectorHWVersion)
  {
    if (v43 == 10)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "lastPathComponent"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("projector version %d"), 10));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v30, 1816, v31);

      v32 = 1;
LABEL_36:
      v11 = HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, kFigCaptureStreamProperty_FormatIndex, (const __CFBoolean *)+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v32));
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "lastPathComponent"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("cmsetcurrentformat 2 %d, setPearlFormatIndex(m_streamIdsInfo.rgbPearlStreamId, %d) ret = %d"), this->m_streamIdsInfo.rgbPearlStreamId, v32, v11));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v34, 1826, v35);

      if ((_DWORD)v11)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setPearlFormatIndex failed")));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 1830, v10);
        goto LABEL_40;
      }
      v36 = DeviceCMInterface::enablePearlIROutput(this);
      if ((_DWORD)v36)
      {
        v11 = v36;
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Configure the primary output to multioutput + enable failed")));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 1838, v10);
        goto LABEL_40;
      }
      v38 = DeviceCMInterface::setPearlIrCofiguration(this, a2->irType);
      if ((_DWORD)v38)
      {
        v11 = v38;
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "lastPathComponent"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("set projector mode to %u failed"), a2->irType));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v40, 1846, v41);

        return v11;
      }
      if (a2->isDepthOn)
      {
        v42 = DeviceCMInterface::enableDefaultDepthStream(this);
        if ((_DWORD)v42)
        {
          v11 = v42;
          v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("enableDefaultDepthStream failed")));
          NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 1856, v10);
          goto LABEL_40;
        }
      }
      this->m_isPearlIrConfigured = 1;
      isIrOn = a2->isIrOn;
LABEL_49:
      v11 = 0;
      this->m_currentPearlConfiguration.irType = a2->irType;
      this->m_currentPearlConfiguration.isIrOn = isIrOn;
      *(_WORD *)&this->m_currentPearlConfiguration.isDepthOn = *(_WORD *)&a2->isDepthOn;
      return v11;
    }
LABEL_35:
    v32 = 0;
    goto LABEL_36;
  }
  v11 = PearlProjectorHWVersion;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "lastPathComponent"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("config pearl device failed to read projector version")));
  NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v24, 1821, v25);

  return v11;
}

void sub_10000F310(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::getPearlProjectorHWVersion(DeviceCMInterface *this, int *a2)
{
  HxISPCaptureDeviceController *m_captureDeviceController;
  unsigned int irPearlStreamId;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  CFTypeRef cf;

  cf = 0;
  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController
    || (irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId, (irPearlStreamId & 0x80000000) != 0))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("getPearlProjectorVersion failed, ir stream id invalid")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 2385, v9);

    return 3758097084;
  }
  else
  {
    v6 = HxISPCaptureDeviceController::CopyStreamProperty(m_captureDeviceController, irPearlStreamId, CFSTR("ProjectorHWVersion"), &cf);
    if (cf)
    {
      *a2 = FigCFNumberGetSInt32();
      CFRelease(cf);
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Null cfType detected for kFigCaptureStreamProperty_ProjectorHWVersion")));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v12, 2397, v13);

    }
  }
  return v6;
}

void sub_10000F5A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v2;

  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::setCurrentPearlConfiguration(DeviceCMInterface *this, const PearlConfiguration *a2)
{
  this->m_currentPearlConfiguration.irType = a2->irType;
  this->m_currentPearlConfiguration.isRgbOn = a2->isRgbOn;
  *(_WORD *)&this->m_currentPearlConfiguration.isIrOn = *(_WORD *)&a2->isIrOn;
  return this;
}

id DeviceCMInterface::getJasperConfigurationStringKey(DeviceCMInterface *this, JasperConfiguration *a2)
{
  JasperConfiguration *p_m_currentJasperConfiguration;
  JasperConfiguration v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  p_m_currentJasperConfiguration = &this->m_currentJasperConfiguration;
  if (a2)
    p_m_currentJasperConfiguration = a2;
  v3 = *p_m_currentJasperConfiguration;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  objc_msgSend(v4, "appendString:", CFSTR("DEVICE_CONFIG"));
  if (v3.isJasperOn)
    objc_msgSend(v4, "appendString:", CFSTR("_JASPER_DEPTH"));
  if ((*(_QWORD *)&v3 & 0xFF0000) != 0)
    objc_msgSend(v4, "appendString:", CFSTR("_WIDE"));
  if ((*(_WORD *)&v3.isJasperOn & 0xFF00) != 0)
  {
    if ((*(_DWORD *)&v3.isJasperOn & 0xFF000000) != 0)
      v5 = CFSTR("_SUPER_WIDE_SYNCED");
    else
      v5 = CFSTR("_SUPER_WIDE_UNSYNCED");
    objc_msgSend(v4, "appendString:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](NSString, "stringWithString:", v4));

  return v6;
}

void sub_10000F6CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id DeviceCMInterface::getPearlConfigurationStringKey(DeviceCMInterface *this, PearlConfiguration *a2)
{
  PearlConfiguration *p_m_currentPearlConfiguration;
  BOOL *p_isDepthOn;
  BOOL *p_isRgbOn;
  int *p_irType;
  NSString **p_deviceName;
  _BOOL4 isIrOn;
  _BOOL4 v8;
  _BOOL4 v9;
  int v10;
  NSString *v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;

  p_m_currentPearlConfiguration = &this->m_currentPearlConfiguration;
  p_isDepthOn = &this->m_currentPearlConfiguration.isDepthOn;
  p_isRgbOn = &this->m_currentPearlConfiguration.isRgbOn;
  p_irType = &this->m_currentPearlConfiguration.irType;
  p_deviceName = &this->m_currentPearlConfiguration.deviceName;
  if (a2)
  {
    p_deviceName = &a2->deviceName;
    p_irType = &a2->irType;
    p_isRgbOn = &a2->isRgbOn;
    p_isDepthOn = &a2->isDepthOn;
    p_m_currentPearlConfiguration = a2;
  }
  isIrOn = p_m_currentPearlConfiguration->isIrOn;
  v8 = *p_isDepthOn;
  v9 = *p_isRgbOn;
  v10 = *p_irType;
  v11 = *p_deviceName;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  objc_msgSend(v12, "appendString:", CFSTR("DEVICE_CONFIG"));
  if (isIrOn)
    objc_msgSend(v12, "appendString:", CFSTR("_IR"));
  if (v8)
    v13 = CFSTR("_DEPTH");
  else
    v13 = CFSTR("_NO_PCE");
  objc_msgSend(v12, "appendString:", v13);
  if (v9)
    objc_msgSend(v12, "appendString:", CFSTR("_RGB"));
  v14 = CFSTR("_DENSE");
  switch(v10)
  {
    case 0:
      v14 = CFSTR("_IR_MODE_NONE");
      goto LABEL_17;
    case 1:
      v14 = CFSTR("_FLOOD");
      goto LABEL_17;
    case 2:
      v14 = CFSTR("_SPARSE_LOW_POWER");
      goto LABEL_17;
    case 3:
      v14 = CFSTR("_SPARSE");
      goto LABEL_17;
    case 4:
      goto LABEL_17;
    case 5:
      objc_msgSend(v12, "appendString:", CFSTR("_DENSE_PROB_AB"));
      goto LABEL_16;
    case 6:
LABEL_16:
      v14 = CFSTR("_SPARSE_PROB_AB");
LABEL_17:
      objc_msgSend(v12, "appendString:", v14);
      break;
    default:
      break;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](NSString, "stringWithString:", v12));

  return v15;
}

void sub_10000F85C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::isPDECaliobrationValid(DeviceCMInterface *this, BOOL *a2)
{
  HxISPCaptureDeviceController *m_captureDeviceController;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  CFTypeRef cf;

  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin CM controller is nil")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 2004, v7);
LABEL_6:
    v4 = 3758097084;

    return v4;
  }
  cf = 0;
  *a2 = HxISPCaptureDeviceController::CopyStreamProperty(m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, CFSTR("PCECalib"), &cf) == 0;
  if (!cf)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Null cfType detected for kFigCaptureStreamProperty_PCECalib")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 2023, v7);
    goto LABEL_6;
  }
  CFRelease(cf);
  return 0;
}

void sub_10000F9C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::getJasperRikerProjectorFault(DeviceCMInterface *this, unint64_t *a2)
{
  uint64_t v4;
  DeviceCMInterface *v5;
  void *v6;
  void *v7;
  uint64_t jasperStreamId;
  const __CFString *ErrorInformationString;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int valuePtr;
  CFNumberRef number;

  number = 0;
  valuePtr = 0;
  v4 = HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, CFSTR("ProjectorRikerFaultStatus"), &number);
  if ((_DWORD)v4)
  {
    v5 = (DeviceCMInterface *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
    jasperStreamId = this->m_streamIdsInfo.jasperStreamId;
    ErrorInformationString = DeviceCMInterface::getErrorInformationString(v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("getJasperRikerProjectorFault failed with OSStatus 0x%x for stream id %d (%@)"), v5, jasperStreamId, v10));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v7, 2039, v11);
    v12 = 3758097084;

  }
  else
  {
    v12 = 0;
  }
  if (number)
  {
    CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
    CFRelease(number);
    *a2 = valuePtr;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Null cfType detected for kFigCaptureStreamProperty_ProjectorRikerFaultStatus")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v14, 2051, v15);
    v12 = 3758097084;

  }
  return v12;
}

void sub_10000FBA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::getJasperRikerProjectorWillFault(DeviceCMInterface *this, unint64_t *a2)
{
  DeviceCMInterface *v4;
  void *v5;
  void *v6;
  uint64_t jasperStreamId;
  const __CFString *ErrorInformationString;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int valuePtr;
  CFNumberRef number;

  number = 0;
  valuePtr = 0;
  v4 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, CFSTR("ProjectorWillFaultStatus"), &number);
  if ((_DWORD)v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
    jasperStreamId = this->m_streamIdsInfo.jasperStreamId;
    ErrorInformationString = DeviceCMInterface::getErrorInformationString(v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("getJasperRikerProjectorWillFault failed with OSStatus 0x%x for stream id %d (%@)"), v4, jasperStreamId, v9));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 2067, v10);

  }
  if (number)
  {
    CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
    CFRelease(number);
    *a2 = valuePtr;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Null cfType detected for kFigCaptureStreamProperty_ProjectorWillFaultStatus")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v12, 2079, v13);

  }
  return v4;
}

void sub_10000FD78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::getJasperRikerResistance(DeviceCMInterface *this, unint64_t *a2)
{
  DeviceCMInterface *v4;
  void *v5;
  void *v6;
  uint64_t jasperStreamId;
  const __CFString *ErrorInformationString;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int valuePtr;
  CFNumberRef number;

  number = 0;
  valuePtr = 0;
  v4 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, CFSTR("RikerResistance"), &number);
  if ((_DWORD)v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
    jasperStreamId = this->m_streamIdsInfo.jasperStreamId;
    ErrorInformationString = DeviceCMInterface::getErrorInformationString(v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("getJasperRikerResistance failed with OSStatus 0x%x for stream id %d (%@)"), v4, jasperStreamId, v9));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 2094, v10);

  }
  if (number)
  {
    CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
    CFRelease(number);
    *a2 = valuePtr;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Null cfType detected for kFigCaptureStreamProperty_RikerResistance")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v12, 2106, v13);

  }
  return v4;
}

void sub_10000FF50(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::getPearlFloodProjectorFault(DeviceCMInterface *this, unint64_t *a2)
{
  HxISPCaptureDeviceController *m_captureDeviceController;
  unsigned int v5;
  DeviceCMInterface *v6;
  void *v7;
  void *v8;
  uint64_t irPearlStreamId;
  const __CFString *ErrorInformationString;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  unsigned int valuePtr;
  CFNumberRef number;

  number = 0;
  valuePtr = 0;
  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController || (v5 = this->m_streamIdsInfo.irPearlStreamId, (v5 & 0x80000000) != 0))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("getFloodProjectorFault failed, ir stream id invalid")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v14, 2119, v15);

    return (DeviceCMInterface *)3758097084;
  }
  else
  {
    v6 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(m_captureDeviceController, v5, CFSTR("ProjectorRosalineFaultStatus"), &number);
    if ((_DWORD)v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
      irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
      ErrorInformationString = DeviceCMInterface::getErrorInformationString(v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("getFloodProjectorFault failed with OSStatus 0x%x for stream id %d (%@)"), v6, irPearlStreamId, v11));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 2126, v12);

    }
    if (number)
    {
      CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
      CFRelease(number);
      *a2 = valuePtr;
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lastPathComponent"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Null cfType detected for kFigCaptureStreamProperty_ProjectorRosalineFaultStatus")));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v18, 2138, v19);

    }
  }
  return v6;
}

void sub_1000101A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::getStructuredProjectorFault(DeviceCMInterface *this, unint64_t *a2)
{
  HxISPCaptureDeviceController *m_captureDeviceController;
  unsigned int v5;
  DeviceCMInterface *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  uint64_t irPearlStreamId;
  const __CFString *ErrorInformationString;
  void *v15;
  void *v16;
  unint64_t valuePtr;
  CFNumberRef number;

  valuePtr = 0;
  number = 0;
  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController || (v5 = this->m_streamIdsInfo.irPearlStreamId, (v5 & 0x80000000) != 0))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("getStructuredProjectorFault failed, ir stream id invalid")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 2150, v9);

    return (DeviceCMInterface *)3758097084;
  }
  else
  {
    v6 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(m_captureDeviceController, v5, CFSTR("ProjectorFaultStatus"), &number);
    if (number)
    {
      CFNumberGetValue(number, kCFNumberSInt64Type, &valuePtr);
      CFRelease(number);
      *a2 = valuePtr;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
      irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
      ErrorInformationString = DeviceCMInterface::getErrorInformationString(v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("getStructuredProjectorFault failed with OSStatus 0x%x for stream id %d (%@)"), v6, irPearlStreamId, v15));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v12, 2163, v16);

    }
  }
  return v6;
}

void sub_100010398(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v3;

  _Unwind_Resume(a1);
}

HxISPCaptureDeviceController *DeviceCMInterface::releaseDevice(DeviceCMInterface *this)
{
  void *v2;
  void *v3;
  void *v4;

  if (DeviceCMInterface::releaseControlOfStreams(this))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastPathComponent"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("releaseControlOfStreams failed")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v3, 2174, v4);

  }
  return DeviceCMInterface::releaseInterface(this);
}

void sub_100010490(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

__n128 DeviceCMInterface::getStreamIdsInfo@<Q0>(DeviceCMInterface *this@<X0>, int a2@<W1>, __n128 *a3@<X8>)
{
  __n128 result;

  if (a2)
    DeviceCMInterface::initAndActivateCaptureDeviceController(this);
  result = *(__n128 *)&this->m_streamIdsInfo.rgbTeleStreamId;
  *a3 = result;
  a3[1].n128_u64[0] = *(_QWORD *)&this->m_streamIdsInfo.rgbSuperWideStreamId;
  return result;
}

DeviceCMInterface *DeviceCMInterface::getRgbjReport(DeviceCMInterface *this, int *a2, int *a3, int *a4, int *a5, int *a6)
{
  DeviceCMInterface *v12;
  void *v13;
  void *v14;
  uint64_t jasperStreamId;
  const __CFString *ErrorInformationString;
  void *v17;
  void *v18;
  const __CFNumber *Value;
  const __CFNumber *v20;
  const __CFNumber *v21;
  const __CFNumber *v22;
  const __CFNumber *v23;
  const __CFNumber *v24;
  CFTypeID TypeID;
  CFDictionaryRef theDict;

  theDict = 0;
  v12 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, CFSTR("RgbjReport"), &theDict);
  if ((_DWORD)v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent"));
    jasperStreamId = this->m_streamIdsInfo.jasperStreamId;
    ErrorInformationString = DeviceCMInterface::getErrorInformationString(v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("getRgbjReport: failed with OSStatus 0x%x for stream id %d (%@)"), v12, jasperStreamId, v17));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v14, 2219, v18);

  }
  else
  {
    Value = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("RgbjReportControllerReached"));
    CFNumberGetValue(Value, kCFNumberIntType, a2);
    v20 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("RgbjReportControllerPassed"));
    CFNumberGetValue(v20, kCFNumberIntType, a3);
    v21 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("RgbjReportIsfSuccess"));
    CFNumberGetValue(v21, kCFNumberIntType, a4);
    v22 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("RgbjReportIsfFailure"));
    CFNumberGetValue(v22, kCFNumberIntType, a5);
    *a6 = 0;
    v23 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("RgbjReportFailedToSave"));
    if (v23)
    {
      v24 = v23;
      TypeID = CFNumberGetTypeID();
      if (TypeID == CFGetTypeID(v24))
        CFNumberGetValue(v24, kCFNumberIntType, a6);
      else
        NSLog(CFSTR("The value for key %@ is not a number"), CFSTR("RgbjReportFailedToSave"));
    }
    CFRelease(theDict);
  }
  return v12;
}

void sub_1000106F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::forceSaveWideJasperCalib(DeviceCMInterface *this)
{
  DeviceCMInterface *v2;
  void *v3;
  void *v4;
  uint64_t jasperStreamId;
  const __CFString *ErrorInformationString;
  void *v7;
  void *v8;

  v2 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, CFSTR("RgbjForceSaveCalib"), 0);
  if ((_DWORD)v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
    jasperStreamId = this->m_streamIdsInfo.jasperStreamId;
    ErrorInformationString = DeviceCMInterface::getErrorInformationString(v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("forceSaveWideJasperCalib: failed with OSStatus 0x%x for stream id %d (%@)"), v2, jasperStreamId, v7));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v4, 2250, v8);

  }
  return v2;
}

void sub_100010808(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::setRgbjConfiguration(DeviceCMInterface *this, unsigned int a2, unsigned int a3, uint64_t a4)
{
  void *v6;
  void *v7;
  const __CFBoolean *v8;
  DeviceCMInterface *v9;
  void *v10;
  void *v11;
  uint64_t jasperStreamId;
  const __CFString *ErrorInformationString;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[2];

  v17[0] = CFSTR("RgbjConfigurationFeatureVectorSize");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:"));
  v17[1] = CFSTR("RgbjConfigurationDilutionRate");
  v18[0] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a4));
  v18[1] = v7;
  v8 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 2));

  v9 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, CFSTR("RgbjConfiguration"), v8);
  if ((_DWORD)v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent"));
    jasperStreamId = this->m_streamIdsInfo.jasperStreamId;
    ErrorInformationString = DeviceCMInterface::getErrorInformationString(v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setRgbjConfiguration: failed with OSStatus 0x%x for stream id %d (%@)"), v9, jasperStreamId, v14));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v11, 2263, v15);

  }
  return v9;
}

void sub_1000109C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::setWideJasperExtrinsics(DeviceCMInterface *this, float a2, float a3, float a4, float a5, float a6, float a7)
{
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  const __CFBoolean *v24;
  DeviceCMInterface *v25;
  void *v26;
  void *v27;
  uint64_t jasperStreamId;
  const __CFString *ErrorInformationString;
  void *v30;
  void *v31;
  _QWORD v33[6];

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v33[0] = v13;
  *(float *)&v14 = a3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v14));
  v33[1] = v15;
  *(float *)&v16 = a4;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v16));
  v33[2] = v17;
  *(float *)&v18 = a5;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v18));
  v33[3] = v19;
  *(float *)&v20 = a6;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v20));
  v33[4] = v21;
  *(float *)&v22 = a7;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v22));
  v33[5] = v23;
  v24 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 6));

  v25 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, CFSTR("OverrideJasperWideExtrinsics"), v24);
  if ((_DWORD)v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "lastPathComponent"));
    jasperStreamId = this->m_streamIdsInfo.jasperStreamId;
    ErrorInformationString = DeviceCMInterface::getErrorInformationString(v25);
    v30 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setWideJasperExtrinsics: failed with OSStatus 0x%x for stream id %d (%@)"), v25, jasperStreamId, v30));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v27, 2275, v31);

  }
  return v25;
}

void sub_100010C2C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::getJasperModuleInfo(DeviceCMInterface *this, const __CFDictionary **a2)
{
  return HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, kFigCaptureStreamProperty_ModuleInfo, a2);
}

uint64_t DeviceCMInterface::getJasperCalib(DeviceCMInterface *this, const __CFData **a2)
{
  return HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, CFSTR("JasperCalib"), a2);
}

uint64_t DeviceCMInterface::getJasperCalibData(DeviceCMInterface *this, const __CFDictionary **a2)
{
  return HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, CFSTR("JapserCalibData"), a2);
}

uint64_t DeviceCMInterface::getPearlPleUUID(DeviceCMInterface *this, unsigned __int8 *a2)
{
  HxISPCaptureDeviceController *m_captureDeviceController;
  unsigned int irPearlStreamId;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  CFDataRef theData;

  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController
    || (irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId, (irPearlStreamId & 0x80000000) != 0))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("getPearlPCECalib failed, ir stream id invalid")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 2307, v9);

    return 3758097084;
  }
  else
  {
    theData = 0;
    v6 = HxISPCaptureDeviceController::CopyStreamProperty(m_captureDeviceController, irPearlStreamId, CFSTR("PCECalib"), &theData);
    if (theData)
    {
      *(_OWORD *)a2 = *(_OWORD *)(CFDataGetBytePtr(theData) + 8);
      CFRelease(theData);
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Null cfType detected for kFigCaptureStreamProperty_PCECalib")));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v12, 2323, v13);

    }
  }
  return v6;
}

void sub_100010E6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v2;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::getPearlRigelSerialNumber(uint64_t a1, _QWORD *a2)
{
  HxISPCaptureDeviceController *v3;
  unsigned int v5;
  DeviceCMInterface *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  const __CFString *ErrorInformationString;
  void *v14;
  void *v15;
  id v16;

  v16 = 0;
  v3 = *(HxISPCaptureDeviceController **)(a1 + 16);
  if (!v3 || (v5 = *(_DWORD *)(a1 + 36), (v5 & 0x80000000) != 0))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("getPearlRigelSerialNumber failed, ir stream id invalid")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 2336, v9);

    return 3758097084;
  }
  else
  {
    v6 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(v3, v5, CFSTR("RigelSerialNumber"), &v16);
    if (v16)
    {
      *a2 = v16;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
      ErrorInformationString = DeviceCMInterface::getErrorInformationString(v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Null cfType detected for kFigCaptureStreamProperty_RigelSerialNumber, %@"), v14));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v12, 2347, v15);

    }
  }
  return (uint64_t)v6;
}

void sub_100011034(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::getPearlRigelOtpVersion(DeviceCMInterface *this, int *a2)
{
  HxISPCaptureDeviceController *m_captureDeviceController;
  unsigned int irPearlStreamId;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  CFTypeRef cf;

  cf = 0;
  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController
    || (irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId, (irPearlStreamId & 0x80000000) != 0))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("getPearlRigelOtpVersion failed, ir stream id invalid, %@"), CFSTR("OK")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 2360, v9);

    return 3758097084;
  }
  else
  {
    v6 = HxISPCaptureDeviceController::CopyStreamProperty(m_captureDeviceController, irPearlStreamId, CFSTR("ProjectorVersion"), &cf);
    if (cf)
    {
      *a2 = FigCFNumberGetSInt32();
      CFRelease(cf);
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Null cfType detected for kFigCaptureStreamProperty_ProjectorVersion")));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v12, 2372, v13);

    }
  }
  return v6;
}

void sub_1000111D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v2;

  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::getGuadalupeValues(DeviceCMInterface *this, uint64_t *a2, uint64_t *a3, uint64_t *a4, int *a5, uint64_t *a6)
{
  DeviceCMInterface *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const __CFString *ErrorInformationString;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  CFTypeRef cf;

  cf = 0;
  v12 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, CFSTR("GuadRecordRegisters"), &cf);
  if (!cf)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent"));
    ErrorInformationString = DeviceCMInterface::getErrorInformationString(v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Null cfType detected for kFigCaptureStreamProperty_GuadRecordRegisters, %@"), v18));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v16, 2415, v19);

LABEL_14:
    return v12;
  }
  *a6 = (int)FigCFNumberGetSInt32();
  CFRelease(cf);
  cf = 0;
  v12 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, CFSTR("GuadLastResistance"), &cf);
  if (!cf)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Null cfType detected for kFigCaptureStreamProperty_GuadLastResistance")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v16, 2430, v18);
    goto LABEL_14;
  }
  *a5 = FigCFNumberGetSInt32();
  CFRelease(cf);
  cf = 0;
  v12 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, CFSTR("BaneState"), &cf);
  if (!cf)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Null cfType detected for kFigCaptureStreamProperty_ProjectorBaneState")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v16, 2444, v18);
    goto LABEL_14;
  }
  *a2 = (int)FigCFNumberGetSInt32();
  CFRelease(cf);
  cf = 0;
  v13 = HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, CFSTR("ProjectorRosalineFaultStatus"), &cf);
  if (cf)
  {
    *a3 = (int)FigCFNumberGetSInt32();
    CFRelease(cf);
    cf = 0;
    v14 = HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, CFSTR("BaneResistance"), &cf);
    if (cf)
    {
      if (!(_DWORD)v12)
        LODWORD(v12) = v13;
      *a4 = (int)FigCFNumberGetSInt32();
      CFRelease(cf);
      if ((_DWORD)v12)
        return (DeviceCMInterface *)v12;
      else
        return (DeviceCMInterface *)v14;
    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "lastPathComponent"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Null cfType detected for kFigCaptureStreamProperty_ProjectorBaneResistance")));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v25, 2477, v26);

      return (DeviceCMInterface *)v14;
    }
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "lastPathComponent"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Null cfType detected for kFigCaptureStreamProperty_ProjectorRosalineFaultStatus")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v22, 2460, v23);

    return (DeviceCMInterface *)v13;
  }
}

void sub_1000115F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t HxISPCaptureDeviceController::FindGroup(HxISPCaptureDeviceController *this, unsigned int a2)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const void **v6;
  char *v7;
  uint64_t FigBaseObject;
  unsigned int (*v9)(uint64_t, uint64_t, const CFAllocatorRef, CFArrayRef *);
  const __CFArray *v10;
  CFArrayRef theArray;
  CFRange v13;

  if (!*((_DWORD *)this + 536))
    return 0;
  v3 = 0;
  v4 = 0;
  v5 = kFigCaptureSynchronizedStreamsGroupProperty_SupportedStreams;
  v6 = (const void **)((char *)this + 8 * a2 + 16);
  v7 = (char *)this + 2080;
  do
  {
    theArray = 0;
    FigBaseObject = FigCaptureSynchronizedStreamsGroupGetFigBaseObject(*(_QWORD *)&v7[8 * v3]);
    v9 = *(unsigned int (**)(uint64_t, uint64_t, const CFAllocatorRef, CFArrayRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                             + 48);
    if (!v9 || v9(FigBaseObject, v5, kCFAllocatorDefault, &theArray))
      break;
    v10 = theArray;
    v13.length = CFArrayGetCount(theArray);
    v13.location = 0;
    if (CFArrayContainsValue(v10, v13, *v6))
      v4 = *(_QWORD *)&v7[8 * v3];
    CFRelease(theArray);
    ++v3;
  }
  while (v3 < *((unsigned int *)this + 536));
  return v4;
}

void HxISPCaptureDeviceController::HxISPCaptureDeviceController(HxISPCaptureDeviceController *this)
{
  uint64_t i;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;

  for (i = 296; i != 2280; i += 248)
    *((_BYTE *)this + i) = 0;
  v3 = 0;
  v4 = 0;
  *((_DWORD *)this + 538) = -1;
  *((_QWORD *)this + 259) = 0;
  *((_DWORD *)this + 536) = 0;
  *((_BYTE *)this + 2148) = 0;
  *((_DWORD *)this + 516) = 0;
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  do
  {
    v5 = (char *)this + 8 * v4;
    *((_QWORD *)v5 + 2) = 0;
    *((_QWORD *)v5 + 260) = 0;
    v6 = (char *)this + v3;
    pthread_mutex_init((pthread_mutex_t *)((char *)this + v3 + 96), 0);
    pthread_cond_init((pthread_cond_t *)((char *)this + v3 + 160), 0);
    *((_WORD *)v6 + 136) = 0;
    *((_QWORD *)v6 + 33) = 0;
    *((_DWORD *)v6 + 52) = 0;
    *(_OWORD *)(v6 + 216) = 0u;
    *(_OWORD *)(v6 + 232) = 0u;
    *(_OWORD *)(v6 + 241) = 0u;
    *((_QWORD *)v6 + 10) = this;
    *((_DWORD *)v6 + 22) = v4;
    *(_QWORD *)(v6 + 276) = 0xFFFFLL;
    *((_QWORD *)v6 + 36) = 0;
    ++v4;
    v3 += 248;
    *((_WORD *)v6 + 142) = 0;
  }
  while (v3 != 1984);
}

void HxISPCaptureDeviceController::~HxISPCaptureDeviceController(HxISPCaptureDeviceController *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = 0;
  v3 = 256;
  do
  {
    if (*((_BYTE *)this + v3))
      HxISPCaptureDeviceController::stopReceive(this, v2);
    ++v2;
    v3 += 248;
  }
  while (v2 != 8);
  if (*((_BYTE *)this + 2148))
    HxISPCaptureDeviceController::deactivate(this);
  v4 = -1984;
  do
  {
    pthread_cond_destroy((pthread_cond_t *)((char *)this + v4 + 2144));
    pthread_mutex_destroy((pthread_mutex_t *)((char *)this + v4 + 2080));
    v4 += 248;
  }
  while (v4);
}

uint64_t HxISPCaptureDeviceController::stopReceive(HxISPCaptureDeviceController *this, unsigned int a2)
{
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  char *v7;
  opaqueCMBufferQueue *v8;
  CMBufferQueueRef *v9;
  opaqueCMBufferQueue *v10;
  CMBufferRef v11;
  char *v12;
  opaqueCMBufferQueue *i;
  opaqueCMBufferQueue **v14;
  opaqueCMBufferQueue *v15;
  CMBufferRef v16;
  char *v17;
  pthread_t *v18;
  char *v19;
  pthread_mutex_t *v20;
  int j;
  int *v22;
  int v23;
  char *v24;
  void *v26;

  if (*((_BYTE *)this + 248 * a2 + 256))
  {
    if (*((_DWORD *)this + 516) <= a2)
    {
      v6 = 3758097084;
      printf("Error: HxISPCaptureDeviceController::stopReceive - Invalid streamIndex %d\n", a2);
    }
    else
    {
      *((_BYTE *)this + 248 * a2 + 272) = 1;
      v4 = *((_QWORD *)this + a2 + 2);
      v5 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable(v4) + 16) + 16);
      if (v5)
        v6 = v5(v4);
      else
        v6 = 4294954514;
      v7 = (char *)this + 248 * a2;
      v10 = (opaqueCMBufferQueue *)*((_QWORD *)v7 + 27);
      v9 = (CMBufferQueueRef *)(v7 + 216);
      v8 = v10;
      if (v10)
      {
        CMBufferQueueRemoveTrigger(v8, *((CMBufferQueueTriggerToken *)this + 31 * a2 + 28));
        while (1)
        {
          v11 = CMBufferQueueDequeueAndRetain(*v9);
          if (!v11)
            break;
          CFRelease(v11);
        }
        v12 = (char *)this + 248 * a2;
        v15 = (opaqueCMBufferQueue *)*((_QWORD *)v12 + 29);
        v14 = (opaqueCMBufferQueue **)(v12 + 232);
        for (i = v15; ; i = *v14)
        {
          v16 = CMBufferQueueDequeueAndRetain(i);
          if (!v16)
            break;
          CFRelease(v16);
        }
      }
      v17 = (char *)this + 248 * a2;
      if (*((_QWORD *)v17 + 33))
      {
        v18 = (pthread_t *)(v17 + 264);
        v19 = (char *)this + 248 * a2;
        v20 = (pthread_mutex_t *)(v19 + 96);
        pthread_mutex_lock((pthread_mutex_t *)(v19 + 96));
        v23 = *((_DWORD *)v19 + 52);
        v22 = (int *)(v19 + 208);
        for (j = v23; j == 1; j = *v22)
        {
          pthread_mutex_unlock(v20);
          usleep(0x2710u);
          pthread_mutex_lock(v20);
        }
        v26 = 0;
        *v22 = 2;
        pthread_cond_signal((pthread_cond_t *)((char *)this + 248 * a2 + 160));
        pthread_mutex_unlock(v20);
        pthread_join(*v18, &v26);
        *v18 = 0;
      }
      v24 = (char *)this + 248 * a2;
      *((_QWORD *)v24 + 30) = 0;
      *((_QWORD *)v24 + 31) = 0;
      v24[256] = 0;
    }
  }
  else
  {
    v6 = 3758097084;
    puts("Error: HxISPCaptureDeviceController::startReceive - not already streaming");
  }
  return v6;
}

uint64_t HxISPCaptureDeviceController::deactivate(HxISPCaptureDeviceController *this)
{
  uint64_t i;
  uint64_t DefaultLocalCenter;
  uint64_t j;
  const void *v5;
  const void *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  const void *v11;
  const void *v12;
  uint64_t FigBaseObject;
  uint64_t v14;
  void (*v15)(uint64_t);

  if (*((_BYTE *)this + 2148))
  {
    for (i = 16; i != 80; i += 8)
    {
      if (*(_QWORD *)((char *)this + i))
      {
        DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter();
        CMNotificationCenterRemoveListener(DefaultLocalCenter, this, 0, 0, *(_QWORD *)((char *)this + i));
      }
    }
    for (j = 0; j != 1984; j += 248)
    {
      v5 = *(const void **)((char *)this + j + 216);
      if (v5)
        CFRelease(v5);
      v6 = *(const void **)((char *)this + j + 232);
      if (v6)
        CFRelease(v6);
    }
    v7 = 0;
    v8 = -1984;
    do
    {
      v9 = (char *)this + v7;
      *((_QWORD *)v9 + 2) = 0;
      *((_QWORD *)v9 + 260) = 0;
      v10 = (char *)this + v8;
      pthread_mutex_init((pthread_mutex_t *)((char *)this + v8 + 2080), 0);
      pthread_cond_init((pthread_cond_t *)((char *)this + v8 + 2144), 0);
      *((_WORD *)v10 + 1128) = 0;
      *((_QWORD *)v10 + 281) = 0;
      *((_DWORD *)v10 + 548) = 0;
      *(_OWORD *)(v10 + 2200) = 0u;
      *(_OWORD *)(v10 + 2216) = 0u;
      *(_OWORD *)(v10 + 2225) = 0u;
      *((_QWORD *)v10 + 258) = this;
      v7 += 8;
      *((_DWORD *)v10 + 518) = 0;
      v8 += 248;
    }
    while (v8);
    v11 = (const void *)*((_QWORD *)this + 259);
    if (v11)
      CFRelease(v11);
    v12 = (const void *)*((_QWORD *)this + 1);
    if (v12)
      CFRelease(v12);
    if (*(_QWORD *)this)
    {
      FigBaseObject = FigCaptureDeviceGetFigBaseObject();
      if (FigBaseObject)
      {
        v14 = FigBaseObject;
        v15 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable(FigBaseObject) + 8) + 24);
        if (v15)
          v15(v14);
      }
      CFRelease(*(CFTypeRef *)this);
    }
    *((_BYTE *)this + 2148) = 0;
    *((_DWORD *)this + 516) = 0;
    *(_QWORD *)this = 0;
    *((_QWORD *)this + 1) = 0;
  }
  return 0xFFFFFFFFLL;
}

uint64_t HxISPCaptureDeviceController::activate(HxISPCaptureDeviceController *this)
{
  uint64_t v1;
  const void *v3;
  int *v4;
  unint64_t v5;
  const __CFDictionary *v6;
  const char *v7;
  uint64_t FigBaseObject;
  uint64_t (*v10)(uint64_t, _QWORD, const CFAllocatorRef, char *);
  unsigned int Count;
  int v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t DefaultLocalCenter;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, _QWORD, const CFAllocatorRef, char *);
  unsigned int v20;
  int v21;
  unint64_t v22;
  const void *v23;

  v1 = 0xFFFFFFFFLL;
  if (*((_BYTE *)this + 2148))
    return v1;
  *((_DWORD *)this + 538) = -1;
  v23 = 0;
  v1 = sub_100013754("/System/Library/MediaCapture/VirtualCameraDevice.mediacapture", "FigVirtualCameraDeviceCreate", (uint64_t)&v23);
  if (v23)
  {
    fprintf(__stderrp, "+++ Found and loaded %s\n", "/System/Library/MediaCapture/VirtualCameraDevice.mediacapture");
    v3 = v23;
    if (v23)
    {
LABEL_13:
      *(_QWORD *)this = v3;
      goto LABEL_14;
    }
  }
  v4 = &dword_10001CAC8;
  v5 = 1;
  do
  {
    v6 = IOServiceMatching(*((const char **)v4 - 3));
    if (IOServiceGetMatchingService(kIOMainPortDefault, v6))
    {
      v7 = (const char *)*((_QWORD *)v4 - 2);
      v1 = sub_100013754(v7, *((const char **)v4 - 1), (uint64_t)&v23);
      if (!v23)
      {
        v3 = 0;
        goto LABEL_10;
      }
      fprintf(__stderrp, "+++ Found and loaded  %s\n", v7);
      *((_DWORD *)this + 538) = *v4;
    }
    v3 = v23;
LABEL_10:
    if (v5 > 4)
      break;
    ++v5;
    v4 += 8;
  }
  while (!v3);
  if (this)
    goto LABEL_13;
  if (v3)
    CFRelease(v3);
LABEL_14:
  if ((_DWORD)v1 || !*(_QWORD *)this)
  {
    puts("HxISPCaptureDeviceController::activate - Error: Could not create CaptureDevice");
  }
  else
  {
    FigBaseObject = FigCaptureDeviceGetFigBaseObject(*(_QWORD *)this);
    v10 = *(uint64_t (**)(uint64_t, _QWORD, const CFAllocatorRef, char *))(*(_QWORD *)(CMBaseObjectGetVTable(FigBaseObject)
                                                                                              + 8)
                                                                                  + 48);
    if (!v10)
      return 4294954514;
    v1 = v10(FigBaseObject, kFigCaptureDeviceProperty_StreamArray, kCFAllocatorDefault, (char *)this + 8);
    if ((_DWORD)v1)
      return v1;
    Count = CFArrayGetCount(*((CFArrayRef *)this + 1));
    if (Count >= 8)
      v12 = 8;
    else
      v12 = Count;
    *((_DWORD *)this + 516) = v12;
    if (v12)
    {
      v13 = 0;
      do
      {
        *((_QWORD *)this + v13 + 2) = CFArrayGetValueAtIndex(*((CFArrayRef *)this + 1), v13);
        ++v13;
        v14 = *((unsigned int *)this + 516);
      }
      while (v13 < v14);
      if ((_DWORD)v14)
      {
        v15 = 0;
        do
        {
          v16 = (char *)this + 8 * v15;
          if (*((_QWORD *)v16 + 2))
          {
            DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter();
            CMNotificationCenterAddListener(DefaultLocalCenter, this, sub_100011EA0, 0, *((_QWORD *)v16 + 2), 0);
          }
          else
          {
            printf("HxISPCaptureDeviceController::activate - CaptureStream %d not found\n", v15);
          }
          ++v15;
        }
        while (v15 < *((unsigned int *)this + 516));
      }
    }
    v18 = FigCaptureDeviceGetFigBaseObject(*(_QWORD *)this);
    v19 = *(uint64_t (**)(uint64_t, _QWORD, const CFAllocatorRef, char *))(*(_QWORD *)(CMBaseObjectGetVTable(v18)
                                                                                              + 8)
                                                                                  + 48);
    if (!v19)
      return 4294954514;
    v1 = v19(v18, kFigCaptureDeviceProperty_SupportedSynchronizedStreamsGroups, kCFAllocatorDefault, (char *)this + 2072);
    if (!(_DWORD)v1)
    {
      v20 = CFArrayGetCount(*((CFArrayRef *)this + 259));
      if (v20 >= 8)
        v21 = 8;
      else
        v21 = v20;
      *((_DWORD *)this + 536) = v21;
      if (v21)
      {
        v22 = 0;
        do
        {
          *((_QWORD *)this + v22 + 260) = CFArrayGetValueAtIndex(*((CFArrayRef *)this + 259), v22);
          ++v22;
        }
        while (v22 < *((unsigned int *)this + 536));
      }
      v1 = 0;
      *((_BYTE *)this + 2148) = 1;
    }
  }
  return v1;
}

size_t sub_100011EA0(int a1, uint64_t a2, const __CFString *a3, CFTypeRef cf1)
{
  unint64_t v7;
  unsigned int v8;
  size_t result;
  FILE *v10;
  const char *CStringPtr;

  if (!a2 || !cf1)
    return fwrite("Diagnostic_FW Device controller recievd null notification info objects\n", 0x47uLL, 1uLL, __stdoutp);
  if (*(_DWORD *)(a2 + 2064))
  {
    v7 = 0;
    do
    {
      if (CFEqual(cf1, *(CFTypeRef *)(a2 + 16 + 8 * v7)))
        break;
      ++v7;
    }
    while (v7 < *(unsigned int *)(a2 + 2064));
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  v10 = __stdoutp;
  CStringPtr = CFStringGetCStringPtr(a3, 0);
  fprintf(v10, "HxISPCaptureDeviceController::handleStreamNotification: %s (streamIndex %d)\n", CStringPtr, v8);
  fflush(__stdoutp);
  result = CFEqual(a3, kFigCaptureStreamNotification_StreamControlTakenByAnotherClient);
  if ((_DWORD)result)
  {
    if (*(_BYTE *)(a2 + 248 * v8 + 256))
      return HxISPCaptureDeviceController::stopReceive((HxISPCaptureDeviceController *)a2, v8);
  }
  return result;
}

uint64_t HxISPCaptureDeviceController::RequestStreams(HxISPCaptureDeviceController *this, const __CFArray *a2, const __CFDictionary *a3)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t (*v7)(uint64_t, const __CFArray *, const __CFDictionary *);

  if (!a2)
    return 4294954516;
  v5 = *(_QWORD *)this;
  v6 = *(_QWORD **)(CMBaseObjectGetVTable(*(_QWORD *)this) + 16);
  if (*v6 >= 2uLL && (v7 = (uint64_t (*)(uint64_t, const __CFArray *, const __CFDictionary *))v6[2]) != 0)
    return v7(v5, a2, a3);
  else
    return 4294954514;
}

uint64_t HxISPCaptureDeviceController::RelinquishStreams(HxISPCaptureDeviceController *this, const __CFArray *a2)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v5)(uint64_t, const __CFArray *, _QWORD);

  if (!a2)
    return 4294954516;
  v3 = *(_QWORD *)this;
  v4 = *(_QWORD **)(CMBaseObjectGetVTable(*(_QWORD *)this) + 16);
  if (*v4 >= 2uLL && (v5 = (uint64_t (*)(uint64_t, const __CFArray *, _QWORD))v4[3]) != 0)
    return v5(v3, a2, 0);
  else
    return 4294954514;
}

uint64_t HxISPCaptureDeviceController::startReceive(HxISPCaptureDeviceController *this, unsigned int a2, void (*a3)(opaqueCMSampleBuffer *, unsigned int, void *), void *a4)
{
  char *v5;
  uint64_t v6;
  char *v9;
  char *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t FigBaseObject;
  unsigned int (*v14)(uint64_t, _QWORD, const CFAllocatorRef, CFTypeRef *);
  char *v15;
  CMBufferQueueRef *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  void *v21;
  opaqueCMBufferQueue *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, _QWORD, const CFAllocatorRef, CMBufferQueueRef *);
  uint64_t v25;
  uint64_t (*v26)(uint64_t, _QWORD, const CFAllocatorRef, char *);
  _BYTE *v27;
  char *v28;
  pthread_mutex_t *v29;
  char *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t);
  CMTime time;
  CFTypeRef obj;
  pthread_attr_t v35;

  if (!*((_BYTE *)this + 2148))
  {
    puts("Error: HxISPCaptureDeviceController::startReceive - No CM plug-in");
    return 0xFFFFFFFFLL;
  }
  if (*((_DWORD *)this + 516) <= a2)
  {
    printf("Error: HxISPCaptureDeviceController::startReceive - Invalid streamIndex %d\n");
    return 0xFFFFFFFFLL;
  }
  v5 = (char *)this + 248 * a2;
  if (v5[256])
  {
    printf("Error: HxISPCaptureDeviceController::startReceive - already streaming on streamIndex %d\n");
    return 0xFFFFFFFFLL;
  }
  v9 = (char *)this + 248 * a2;
  *((_QWORD *)v9 + 30) = a3;
  *((_QWORD *)v9 + 31) = a4;
  obj = 0;
  v10 = (char *)this + 8 * a2;
  v12 = *((_QWORD *)v10 + 2);
  v11 = v10 + 16;
  FigBaseObject = FigCaptureStreamGetFigBaseObject(v12);
  v14 = *(unsigned int (**)(uint64_t, _QWORD, const CFAllocatorRef, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable(FigBaseObject) + 8)
                                                                                          + 48);
  if (v14 && !v14(FigBaseObject, kFigCaptureStreamProperty_FormatDescription, kCFAllocatorDefault, &obj))
  {
    CFShow(obj);
    CFRelease(obj);
    obj = 0;
  }
  v15 = (char *)this + 248 * a2;
  v17 = *((_QWORD *)v15 + 27);
  v16 = (CMBufferQueueRef *)(v15 + 216);
  if (!v17)
  {
    v23 = FigCaptureStreamGetFigBaseObject(*v11);
    v24 = *(uint64_t (**)(uint64_t, _QWORD, const CFAllocatorRef, CMBufferQueueRef *))(*(_QWORD *)(CMBaseObjectGetVTable(v23) + 8)
                                                                                              + 48);
    if (!v24)
      return 4294954514;
    v6 = v24(v23, kFigCaptureStreamProperty_BufferQueue, kCFAllocatorDefault, v16);
    if ((_DWORD)v6)
      return v6;
  }
  v18 = (char *)this + 248 * a2;
  v20 = *((_QWORD *)v18 + 29);
  v19 = v18 + 232;
  if (!v20)
  {
    v25 = FigCaptureStreamGetFigBaseObject(*v11);
    v26 = *(uint64_t (**)(uint64_t, _QWORD, const CFAllocatorRef, char *))(*(_QWORD *)(CMBaseObjectGetVTable(v25)
                                                                                              + 8)
                                                                                  + 48);
    if (v26)
    {
      v6 = v26(v25, kFigCaptureStreamProperty_StillImageBufferQueue, kCFAllocatorDefault, v19);
      if ((_DWORD)v6)
        return v6;
      goto LABEL_14;
    }
    return 4294954514;
  }
LABEL_14:
  v21 = v5 + 80;
  v22 = *v16;
  time = kCMTimeZero;
  if (CMBufferQueueInstallTrigger(v22, (CMBufferQueueTriggerCallback)sub_100012404, v5 + 80, 7, &time, (CMBufferQueueTriggerToken *)this + 31 * a2 + 28))
  {
    return 3758097084;
  }
  v27 = v5 + 256;
  v28 = (char *)this + 248 * a2;
  v29 = (pthread_mutex_t *)(v28 + 96);
  pthread_mutex_lock((pthread_mutex_t *)(v28 + 96));
  *((_DWORD *)v28 + 52) = 0;
  v30 = v28 + 208;
  v30[64] = 0;
  pthread_attr_init(&v35);
  pthread_attr_setdetachstate(&v35, 1);
  pthread_create((pthread_t *)v30 + 7, &v35, (void *(__cdecl *)(void *))sub_100012460, v21);
  pthread_attr_destroy(&v35);
  pthread_mutex_unlock(v29);
  v31 = *v11;
  v32 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable(*v11) + 16) + 8);
  if (v32)
  {
    v6 = v32(v31);
    if (!(_DWORD)v6)
    {
      v6 = 0;
      *v27 = 1;
      return v6;
    }
  }
  else
  {
    v6 = 4294954514;
  }
  CMBufferQueueRemoveTrigger(*v16, *((CMBufferQueueTriggerToken *)this + 31 * a2 + 28));
  while (1)
  {
    usleep(0x2710u);
    v35.__sig = 0;
    pthread_mutex_lock(v29);
    if (*(_DWORD *)v30 != 1)
      break;
    pthread_mutex_unlock(v29);
  }
  *(_DWORD *)v30 = 2;
  pthread_cond_signal((pthread_cond_t *)((char *)this + 248 * a2 + 160));
  pthread_mutex_unlock(v29);
  pthread_join(*((pthread_t *)v30 + 7), (void **)&v35);
  *v27 = 0;
  return v6;
}

uint64_t sub_100012404(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(result + 192))
  {
    v1 = result;
    if (*(_DWORD *)(result + 128) != 1)
    {
      pthread_mutex_lock((pthread_mutex_t *)(result + 16));
      *(_DWORD *)(v1 + 128) = 1;
      pthread_cond_signal((pthread_cond_t *)(v1 + 80));
      return pthread_mutex_unlock((pthread_mutex_t *)(v1 + 16));
    }
  }
  return result;
}

uint64_t sub_100012460(uint64_t a1)
{
  const char *v2;
  CMBufferRef v3;
  CMBufferRef v4;
  void (*v5)(CMBufferRef, _QWORD, _QWORD);

  if (*(_DWORD *)(a1 + 8))
    v2 = "HxISPCaptureDeviceStreamFrameReceiveThread1";
  else
    v2 = "HxISPCaptureDeviceStreamFrameReceiveThread0";
  pthread_setname_np(v2);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  while (1)
  {
    pthread_cond_wait((pthread_cond_t *)(a1 + 80), (pthread_mutex_t *)(a1 + 16));
    if (*(_DWORD *)(a1 + 128) == 2)
      break;
    v3 = CMBufferQueueDequeueAndRetain(*(CMBufferQueueRef *)(a1 + 136));
    if (v3)
    {
      v4 = v3;
      do
      {
        v5 = *(void (**)(CMBufferRef, _QWORD, _QWORD))(a1 + 160);
        if (v5)
          v5(v4, *(unsigned int *)(a1 + 8), *(_QWORD *)(a1 + 168));
        CFRelease(v4);
        v4 = CMBufferQueueDequeueAndRetain(*(CMBufferQueueRef *)(a1 + 136));
      }
      while (v4);
    }
    *(_DWORD *)(a1 + 128) = 0;
  }
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 16));
  return 0;
}

uint64_t HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks(HxISPCaptureDeviceController *this, unsigned int a2, void (*a3)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a4, void (*a5)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a6, void (*a7)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a8, void (*a9)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a10, void (*a11)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a12, void (*a13)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a14, void (*a15)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a16, void (*a17)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a18, void (*a19)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a20,void (*a21)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *),void *a22)
{
  uint64_t result;
  uint64_t v31;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v33;
  __CFDictionary *v34;
  __CFDictionary *v35;
  __CFDictionary *v36;
  __CFDictionary *v37;
  __CFDictionary *v38;
  __CFDictionary *v39;
  __CFDictionary *v40;
  __CFDictionary *v41;
  __CFDictionary *v42;
  __CFDictionary *v43;
  __CFDictionary *v44;
  __CFDictionary *v45;
  __CFDictionary *v46;
  __CFDictionary *v47;
  __CFDictionary *v48;
  __CFDictionary *v49;
  __CFDictionary *v50;
  __CFDictionary *v51;
  __CFDictionary *v52;
  __CFDictionary *v53;
  int v54;
  char *v55;
  char *v56;
  _QWORD *v57;
  uint64_t v58;
  uint64_t FigBaseObject;
  uint64_t (*v60)(uint64_t, _QWORD, const CFAllocatorRef, CFTypeRef *);
  uint64_t v61;
  uint64_t (*v62)(uint64_t);
  char *v63;
  CFTypeRef obj;
  _QWORD v65[6];
  unsigned int v66;
  _QWORD v67[6];
  unsigned int v68;
  _QWORD v69[6];
  unsigned int v70;
  _QWORD v71[6];
  unsigned int v72;
  _QWORD v73[6];
  unsigned int v74;
  _QWORD v75[6];
  unsigned int v76;
  _QWORD v77[6];
  unsigned int v78;
  _QWORD v79[6];
  unsigned int v80;
  _QWORD v81[6];
  unsigned int v82;
  _QWORD value[6];
  unsigned int v84;

  if (!*((_BYTE *)this + 2148))
  {
    puts("Error: HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks - No CM plug-in");
    return 0xFFFFFFFFLL;
  }
  if (*((_DWORD *)this + 516) <= a2)
  {
    printf("Error: HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks - Invalid streamIndex %d\n");
    return 0xFFFFFFFFLL;
  }
  if (*((_BYTE *)this + 248 * a2 + 256))
  {
    printf("Error: HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks - already streaming on streamIndex %d\n");
    return 0xFFFFFFFFLL;
  }
  v63 = (char *)this + 248 * a2;
  v31 = a2;
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    v33 = Mutable;
    v34 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (v34)
    {
      v35 = v34;
      value[0] = _NSConcreteStackBlock;
      value[1] = 0x40000000;
      value[2] = sub_100012D64;
      value[3] = &unk_10001C6D0;
      v84 = a2;
      value[4] = a3;
      value[5] = a4;
      CFDictionarySetValue(v34, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, value);
      CFDictionarySetValue(v35, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_10001C710);
      CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_PrimaryScaler, v35);
      CFRelease(v35);
    }
    v36 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (v36)
    {
      v37 = v36;
      v81[0] = _NSConcreteStackBlock;
      v81[1] = 0x40000000;
      v81[2] = sub_100012DD4;
      v81[3] = &unk_10001C730;
      v82 = a2;
      v81[4] = a5;
      v81[5] = a6;
      CFDictionarySetValue(v36, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v81);
      CFDictionarySetValue(v37, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_10001C770);
      CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_SecondaryScaler, v37);
      CFRelease(v37);
    }
    v38 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (v38)
    {
      v39 = v38;
      v79[0] = _NSConcreteStackBlock;
      v79[1] = 0x40000000;
      v79[2] = sub_100012E44;
      v79[3] = &unk_10001C790;
      v80 = a2;
      v79[4] = a7;
      v79[5] = a8;
      CFDictionarySetValue(v38, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v79);
      CFDictionarySetValue(v39, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_10001C7D0);
      CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_IntermediateTap, v39);
      CFRelease(v39);
    }
    if (a9)
    {
      v40 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v40)
      {
        v41 = v40;
        v77[0] = _NSConcreteStackBlock;
        v77[1] = 0x40000000;
        v77[2] = sub_100012EB4;
        v77[3] = &unk_10001C7F0;
        v78 = a2;
        v77[4] = a9;
        v77[5] = a10;
        CFDictionarySetValue(v40, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v77);
        CFDictionarySetValue(v41, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_10001C830);
        CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_StillImage, v41);
        CFRelease(v41);
      }
    }
    if (a11)
    {
      v42 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v42)
      {
        v43 = v42;
        v75[0] = _NSConcreteStackBlock;
        v75[1] = 0x40000000;
        v75[2] = sub_100012F24;
        v75[3] = &unk_10001C850;
        v76 = a2;
        v75[4] = a11;
        v75[5] = a12;
        CFDictionarySetValue(v42, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v75);
        CFDictionarySetValue(v43, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_10001C890);
        CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_StillImageIntermediateTap, v43);
        CFRelease(v43);
      }
    }
    if (a13)
    {
      v44 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v44)
      {
        v45 = v44;
        v73[0] = _NSConcreteStackBlock;
        v73[1] = 0x40000000;
        v73[2] = sub_100012F94;
        v73[3] = &unk_10001C8B0;
        v74 = a2;
        v73[4] = a13;
        v73[5] = a14;
        CFDictionarySetValue(v44, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v73);
        CFDictionarySetValue(v45, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_10001C8F0);
        CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_Depth, v45);
        CFRelease(v45);
      }
    }
    if (a15)
    {
      v46 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v46)
      {
        v47 = v46;
        v71[0] = _NSConcreteStackBlock;
        v71[1] = 0x40000000;
        v71[2] = sub_100013004;
        v71[3] = &unk_10001C910;
        v72 = a2;
        v71[4] = a15;
        v71[5] = a16;
        CFDictionarySetValue(v46, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v71);
        CFDictionarySetValue(v47, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_10001C950);
        CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_Raw, v47);
        CFRelease(v47);
      }
    }
    if (a17)
    {
      v48 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v48)
      {
        v49 = v48;
        v69[0] = _NSConcreteStackBlock;
        v69[1] = 0x40000000;
        v69[2] = sub_100013074;
        v69[3] = &unk_10001C970;
        v70 = a2;
        v69[4] = a17;
        v69[5] = a18;
        CFDictionarySetValue(v48, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v69);
        CFDictionarySetValue(v49, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_10001C9B0);
        CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_StillImageRaw, v49);
        CFRelease(v49);
      }
    }
    if (a19)
    {
      v50 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v50)
      {
        v51 = v50;
        v67[0] = _NSConcreteStackBlock;
        v67[1] = 0x40000000;
        v67[2] = sub_1000130E4;
        v67[3] = &unk_10001C9D0;
        v68 = a2;
        v67[4] = a19;
        v67[5] = a20;
        CFDictionarySetValue(v50, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v67);
        CFDictionarySetValue(v51, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_10001CA10);
        CFDictionarySetValue(v33, CFSTR("VisPipe"), v51);
        CFRelease(v51);
      }
    }
    if (a21)
    {
      v52 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v52)
      {
        v53 = v52;
        v65[0] = _NSConcreteStackBlock;
        v65[1] = 0x40000000;
        v65[2] = sub_100013154;
        v65[3] = &unk_10001CA30;
        v66 = a2;
        v65[4] = a21;
        v65[5] = a22;
        CFDictionarySetValue(v52, kFigCaptureStreamVideoOutputHandlerKey_DataBufferHandler, v65);
        CFDictionarySetValue(v53, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_10001CA70);
        CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_PointCloud, v53);
        CFRelease(v53);
      }
    }
    v54 = HxISPCaptureDeviceController::SetStreamProperty(this, a2, kFigCaptureStreamProperty_VideoOutputHandlers, v33);
    if (v54)
      printf("Error: HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks - error setting VideoOutputHandlers: %d\n", v54);
    CFRelease(v33);
    v31 = a2;
  }
  v55 = (char *)this + 248 * v31;
  *((_QWORD *)v55 + 30) = 0;
  *((_QWORD *)v55 + 31) = 0;
  obj = 0;
  v56 = (char *)this + 8 * v31;
  v58 = *((_QWORD *)v56 + 2);
  v57 = v56 + 16;
  FigBaseObject = FigCaptureStreamGetFigBaseObject(v58);
  v60 = *(uint64_t (**)(uint64_t, _QWORD, const CFAllocatorRef, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable(FigBaseObject)
                                                                                                 + 8)
                                                                                     + 48);
  if (!v60)
    return 4294954514;
  result = v60(FigBaseObject, kFigCaptureStreamProperty_FormatDescription, kCFAllocatorDefault, &obj);
  if ((_DWORD)result)
    return result;
  CFShow(obj);
  CFRelease(obj);
  obj = 0;
  v61 = *v57;
  v62 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable(*v57) + 16) + 8);
  if (!v62)
    return 4294954514;
  result = v62(v61);
  if (!(_DWORD)result)
    v63[256] = 1;
  return result;
}

uint64_t sub_100012D64(uint64_t result, uint64_t a2, __int128 *a3)
{
  uint64_t (*v3)(uint64_t, __int128 *, _QWORD, _QWORD);
  __int128 v4;
  uint64_t v5;

  v3 = *(uint64_t (**)(uint64_t, __int128 *, _QWORD, _QWORD))(result + 32);
  if (v3)
  {
    v4 = *a3;
    v5 = *((_QWORD *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(_QWORD *)(result + 40));
  }
  return result;
}

void sub_100012DAC(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (primaryScaler), event=%d\n", a2);
}

uint64_t sub_100012DD4(uint64_t result, uint64_t a2, __int128 *a3)
{
  uint64_t (*v3)(uint64_t, __int128 *, _QWORD, _QWORD);
  __int128 v4;
  uint64_t v5;

  v3 = *(uint64_t (**)(uint64_t, __int128 *, _QWORD, _QWORD))(result + 32);
  if (v3)
  {
    v4 = *a3;
    v5 = *((_QWORD *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(_QWORD *)(result + 40));
  }
  return result;
}

void sub_100012E1C(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (secondaryScaler), event=%d\n", a2);
}

uint64_t sub_100012E44(uint64_t result, uint64_t a2, __int128 *a3)
{
  uint64_t (*v3)(uint64_t, __int128 *, _QWORD, _QWORD);
  __int128 v4;
  uint64_t v5;

  v3 = *(uint64_t (**)(uint64_t, __int128 *, _QWORD, _QWORD))(result + 32);
  if (v3)
  {
    v4 = *a3;
    v5 = *((_QWORD *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(_QWORD *)(result + 40));
  }
  return result;
}

void sub_100012E8C(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (intermediateTap), event=%d\n", a2);
}

uint64_t sub_100012EB4(uint64_t result, uint64_t a2, __int128 *a3)
{
  uint64_t (*v3)(uint64_t, __int128 *, _QWORD, _QWORD);
  __int128 v4;
  uint64_t v5;

  v3 = *(uint64_t (**)(uint64_t, __int128 *, _QWORD, _QWORD))(result + 32);
  if (v3)
  {
    v4 = *a3;
    v5 = *((_QWORD *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(_QWORD *)(result + 40));
  }
  return result;
}

void sub_100012EFC(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (stillImage), event=%d\n", a2);
}

uint64_t sub_100012F24(uint64_t result, uint64_t a2, __int128 *a3)
{
  uint64_t (*v3)(uint64_t, __int128 *, _QWORD, _QWORD);
  __int128 v4;
  uint64_t v5;

  v3 = *(uint64_t (**)(uint64_t, __int128 *, _QWORD, _QWORD))(result + 32);
  if (v3)
  {
    v4 = *a3;
    v5 = *((_QWORD *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(_QWORD *)(result + 40));
  }
  return result;
}

void sub_100012F6C(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (stillImageIntermediateTap), event=%d\n", a2);
}

uint64_t sub_100012F94(uint64_t result, uint64_t a2, __int128 *a3)
{
  uint64_t (*v3)(uint64_t, __int128 *, _QWORD, _QWORD);
  __int128 v4;
  uint64_t v5;

  v3 = *(uint64_t (**)(uint64_t, __int128 *, _QWORD, _QWORD))(result + 32);
  if (v3)
  {
    v4 = *a3;
    v5 = *((_QWORD *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(_QWORD *)(result + 40));
  }
  return result;
}

void sub_100012FDC(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (depth), event=%d\n", a2);
}

uint64_t sub_100013004(uint64_t result, uint64_t a2, __int128 *a3)
{
  uint64_t (*v3)(uint64_t, __int128 *, _QWORD, _QWORD);
  __int128 v4;
  uint64_t v5;

  v3 = *(uint64_t (**)(uint64_t, __int128 *, _QWORD, _QWORD))(result + 32);
  if (v3)
  {
    v4 = *a3;
    v5 = *((_QWORD *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(_QWORD *)(result + 40));
  }
  return result;
}

void sub_10001304C(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (raw), event=%d\n", a2);
}

uint64_t sub_100013074(uint64_t result, uint64_t a2, __int128 *a3)
{
  uint64_t (*v3)(uint64_t, __int128 *, _QWORD, _QWORD);
  __int128 v4;
  uint64_t v5;

  v3 = *(uint64_t (**)(uint64_t, __int128 *, _QWORD, _QWORD))(result + 32);
  if (v3)
  {
    v4 = *a3;
    v5 = *((_QWORD *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(_QWORD *)(result + 40));
  }
  return result;
}

void sub_1000130BC(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (stillImageRaw), event=%d\n", a2);
}

uint64_t sub_1000130E4(uint64_t result, uint64_t a2, __int128 *a3)
{
  uint64_t (*v3)(uint64_t, __int128 *, _QWORD, _QWORD);
  __int128 v4;
  uint64_t v5;

  v3 = *(uint64_t (**)(uint64_t, __int128 *, _QWORD, _QWORD))(result + 32);
  if (v3)
  {
    v4 = *a3;
    v5 = *((_QWORD *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(_QWORD *)(result + 40));
  }
  return result;
}

void sub_10001312C(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (visPipe), event=%d\n", a2);
}

uint64_t sub_100013154(uint64_t result, uint64_t a2, __int128 *a3)
{
  uint64_t (*v3)(uint64_t, __int128 *, _QWORD, _QWORD);
  __int128 v4;
  uint64_t v5;

  v3 = *(uint64_t (**)(uint64_t, __int128 *, _QWORD, _QWORD))(result + 32);
  if (v3)
  {
    v4 = *a3;
    v5 = *((_QWORD *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(_QWORD *)(result + 40));
  }
  return result;
}

void sub_10001319C(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (data), event=%d\n", a2);
}

uint64_t HxISPCaptureDeviceController::SetStreamProperty(HxISPCaptureDeviceController *this, unsigned int a2, const __CFString *a3, const __CFBoolean *a4)
{
  uint64_t FigBaseObject;
  uint64_t (*v9)(uint64_t, const __CFString *, const __CFBoolean *);
  uint64_t result;
  _BYTE *v11;
  const char *v12;

  if (!*((_BYTE *)this + 2148))
  {
    v12 = "Error: HxISPCaptureDeviceController::startReceive - No CM plug-in";
LABEL_10:
    puts(v12);
    return 0xFFFFFFFFLL;
  }
  if (*((_DWORD *)this + 516) <= a2)
  {
    v12 = "Error: HxISPCaptureDeviceController::SetStreamProperty - Invalid stream index";
    goto LABEL_10;
  }
  FigBaseObject = FigCaptureStreamGetFigBaseObject(*((_QWORD *)this + a2 + 2));
  v9 = *(uint64_t (**)(uint64_t, const __CFString *, const __CFBoolean *))(*(_QWORD *)(CMBaseObjectGetVTable(FigBaseObject)
                                                                                              + 8)
                                                                                  + 56);
  if (!v9)
    return 4294954514;
  result = v9(FigBaseObject, a3, a4);
  if (!(_DWORD)result)
  {
    result = CFEqual(a3, kFigCaptureStreamProperty_MultipleOutputSupportEnabled);
    if ((_DWORD)result)
    {
      result = CFBooleanGetValue(a4);
      v11 = (char *)this + 248 * a2 + 273;
      if ((_DWORD)result)
      {
        result = 0;
        *v11 = 1;
      }
      else
      {
        *v11 = 0;
      }
    }
  }
  return result;
}

uint64_t HxISPCaptureDeviceController::SetDeviceProperty(HxISPCaptureDeviceController *this, const __CFString *a2, const void *a3)
{
  uint64_t FigBaseObject;
  uint64_t (*v6)(uint64_t, const __CFString *, const void *);

  if (*((_BYTE *)this + 2148))
  {
    FigBaseObject = FigCaptureDeviceGetFigBaseObject(*(_QWORD *)this);
    v6 = *(uint64_t (**)(uint64_t, const __CFString *, const void *))(*(_QWORD *)(CMBaseObjectGetVTable(FigBaseObject)
                                                                                         + 8)
                                                                             + 56);
    if (v6)
      return v6(FigBaseObject, a2, a3);
    else
      return 4294954514;
  }
  else
  {
    puts("Error: HxISPCaptureDeviceController::startReceive - No CM plug-in");
    return 0xFFFFFFFFLL;
  }
}

uint64_t HxISPCaptureDeviceController::CopyDeviceProperty(HxISPCaptureDeviceController *this, const __CFString *a2, void *a3)
{
  uint64_t FigBaseObject;
  uint64_t (*v6)(uint64_t, const __CFString *, const CFAllocatorRef, void *);

  if (*((_BYTE *)this + 2148))
  {
    FigBaseObject = FigCaptureDeviceGetFigBaseObject(*(_QWORD *)this);
    v6 = *(uint64_t (**)(uint64_t, const __CFString *, const CFAllocatorRef, void *))(*(_QWORD *)(CMBaseObjectGetVTable(FigBaseObject) + 8)
                                                                                             + 48);
    if (v6)
      return v6(FigBaseObject, a2, kCFAllocatorDefault, a3);
    else
      return 4294954514;
  }
  else
  {
    puts("Error: HxISPCaptureDeviceController::startReceive - No CM plug-in");
    return 0xFFFFFFFFLL;
  }
}

uint64_t HxISPCaptureDeviceController::CopyStreamProperty(HxISPCaptureDeviceController *this, unsigned int a2, const __CFString *a3, void *a4)
{
  uint64_t FigBaseObject;
  uint64_t (*v7)(uint64_t, const __CFString *, const CFAllocatorRef, void *);
  const char *v9;

  if (!*((_BYTE *)this + 2148))
  {
    v9 = "Error: HxISPCaptureDeviceController::startReceive - No CM plug-in";
LABEL_7:
    puts(v9);
    return 0xFFFFFFFFLL;
  }
  if (*((_DWORD *)this + 516) <= a2)
  {
    v9 = "Error: HxISPCaptureDeviceController::CopyStreamProperty - Invalid stream index";
    goto LABEL_7;
  }
  FigBaseObject = FigCaptureStreamGetFigBaseObject(*((_QWORD *)this + a2 + 2));
  v7 = *(uint64_t (**)(uint64_t, const __CFString *, const CFAllocatorRef, void *))(*(_QWORD *)(CMBaseObjectGetVTable(FigBaseObject) + 8)
                                                                                           + 48);
  if (v7)
    return v7(FigBaseObject, a3, kCFAllocatorDefault, a4);
  else
    return 4294954514;
}

uint64_t HxISPCaptureDeviceController::SetGroupProperty(HxISPCaptureDeviceController *this, unsigned int a2, const __CFString *a3, const void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const void **v10;
  char *v11;
  uint64_t FigBaseObject;
  unsigned int (*v13)(uint64_t, uint64_t, const CFAllocatorRef, CFArrayRef *);
  const __CFArray *v14;
  const char *v15;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, const __CFString *, const void *);
  CFArrayRef theArray;
  CFRange v20;

  if (!*((_BYTE *)this + 2148))
  {
    v15 = "Error: HxISPCaptureDeviceController::SetGroupProperty - No CM plug-in";
LABEL_14:
    puts(v15);
    return 0xFFFFFFFFLL;
  }
  if (*((_DWORD *)this + 516) <= a2)
  {
    v15 = "Error: HxISPCaptureDeviceController::SetGroupProperty - Invalid stream index";
    goto LABEL_14;
  }
  if (*((_DWORD *)this + 536))
  {
    v7 = 0;
    v8 = 0;
    v9 = kFigCaptureSynchronizedStreamsGroupProperty_SupportedStreams;
    v10 = (const void **)((char *)this + 8 * a2 + 16);
    v11 = (char *)this + 2080;
    while (1)
    {
      theArray = 0;
      FigBaseObject = FigCaptureSynchronizedStreamsGroupGetFigBaseObject(*(_QWORD *)&v11[8 * v7]);
      v13 = *(unsigned int (**)(uint64_t, uint64_t, const CFAllocatorRef, CFArrayRef *))(*(_QWORD *)(CMBaseObjectGetVTable(FigBaseObject) + 8)
                                                                                                + 48);
      if (!v13 || v13(FigBaseObject, v9, kCFAllocatorDefault, &theArray))
        break;
      v14 = theArray;
      v20.length = CFArrayGetCount(theArray);
      v20.location = 0;
      if (CFArrayContainsValue(v14, v20, *v10))
        v8 = *(_QWORD *)&v11[8 * v7];
      CFRelease(theArray);
      if (++v7 >= (unint64_t)*((unsigned int *)this + 536))
        goto LABEL_17;
    }
    v15 = "Error: HxISPCaptureDeviceController::SetGroupProperty - Unable to locate synchronized stream group for stream";
    goto LABEL_14;
  }
  v8 = 0;
LABEL_17:
  v17 = FigCaptureSynchronizedStreamsGroupGetFigBaseObject(v8);
  v18 = *(uint64_t (**)(uint64_t, const __CFString *, const void *))(*(_QWORD *)(CMBaseObjectGetVTable(v17) + 8)
                                                                            + 56);
  if (v18)
    return v18(v17, a3, a4);
  else
    return 4294954514;
}

uint64_t HxISPCaptureDeviceController::CopyGroupProperty(HxISPCaptureDeviceController *this, unsigned int a2, const __CFString *a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const void **v10;
  char *v11;
  uint64_t FigBaseObject;
  unsigned int (*v13)(uint64_t, uint64_t, const CFAllocatorRef, CFArrayRef *);
  const __CFArray *v14;
  const char *v15;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, const __CFString *, const CFAllocatorRef, void *);
  CFArrayRef theArray;
  CFRange v20;

  if (!*((_BYTE *)this + 2148))
  {
    v15 = "Error: HxISPCaptureDeviceController::CopyGroupProperty - No CM plug-in";
LABEL_14:
    puts(v15);
    return 0xFFFFFFFFLL;
  }
  if (*((_DWORD *)this + 516) <= a2)
  {
    v15 = "Error: HxISPCaptureDeviceController::CopyGroupProperty - Invalid stream index";
    goto LABEL_14;
  }
  if (*((_DWORD *)this + 536))
  {
    v7 = 0;
    v8 = 0;
    v9 = kFigCaptureSynchronizedStreamsGroupProperty_SupportedStreams;
    v10 = (const void **)((char *)this + 8 * a2 + 16);
    v11 = (char *)this + 2080;
    while (1)
    {
      theArray = 0;
      FigBaseObject = FigCaptureSynchronizedStreamsGroupGetFigBaseObject(*(_QWORD *)&v11[8 * v7]);
      v13 = *(unsigned int (**)(uint64_t, uint64_t, const CFAllocatorRef, CFArrayRef *))(*(_QWORD *)(CMBaseObjectGetVTable(FigBaseObject) + 8)
                                                                                                + 48);
      if (!v13 || v13(FigBaseObject, v9, kCFAllocatorDefault, &theArray))
        break;
      v14 = theArray;
      v20.length = CFArrayGetCount(theArray);
      v20.location = 0;
      if (CFArrayContainsValue(v14, v20, *v10))
        v8 = *(_QWORD *)&v11[8 * v7];
      CFRelease(theArray);
      if (++v7 >= (unint64_t)*((unsigned int *)this + 536))
        goto LABEL_17;
    }
    v15 = "Error: HxISPCaptureDeviceController::CopyGroupProperty - Unable to locate synchronized stream group for stream";
    goto LABEL_14;
  }
  v8 = 0;
LABEL_17:
  v17 = FigCaptureSynchronizedStreamsGroupGetFigBaseObject(v8);
  v18 = *(uint64_t (**)(uint64_t, const __CFString *, const CFAllocatorRef, void *))(*(_QWORD *)(CMBaseObjectGetVTable(v17) + 8)
                                                                                            + 48);
  if (v18)
    return v18(v17, a3, kCFAllocatorDefault, a4);
  else
    return 4294954514;
}

uint64_t sub_100013754(const char *a1, const char *a2, uint64_t a3)
{
  void *v5;
  uint64_t (*v6)(const CFAllocatorRef, _QWORD, uint64_t);

  v5 = dlopen(a1, 4);
  if (v5 && (v6 = (uint64_t (*)(const CFAllocatorRef, _QWORD, uint64_t))dlsym(v5, a2)) != 0)
    return v6(kCFAllocatorDefault, 0, a3);
  else
    return 0;
}

id getCurrentVersion(void)
{
  void *v0;
  void *v1;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "objectForInfoDictionaryKey:", CFSTR("CFBundleShortVersionString")));

  return v1;
}

void sub_1000137FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void logMainResults(NSDictionary *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id obj;
  NSDictionary *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  v31 = a1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DiagnosticUtils.mm"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Start Diag Logging Results Dictionary for %d -->"), a2));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 23, v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DiagnosticUtils.mm"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Return code: %d"), a3));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 24, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DiagnosticUtils.mm"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary description](v31, "description"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Result description: %@"), v13));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v12, 25, v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DiagnosticUtils.mm"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Key/Val pairs:")));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v16, 26, v17);

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](v31, "allKeys"));
  obj = v18;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v33;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v33 != v20)
          objc_enumerationMutation(obj);
        v22 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DiagnosticUtils.mm"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "lastPathComponent"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v31, "objectForKey:", v22));
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("key:%@ val: %@"), v22, v25));
        NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v24, 29, v26);

        v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      v18 = obj;
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v19);
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DiagnosticUtils.mm"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "lastPathComponent"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Done Diag Logging Results Dictionary <--")));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v28, 31, v29);

}

void sub_100013C10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

__CFString *decToBinStr(unsigned int a1)
{
  unint64_t v1;
  __CFString *v2;
  int v3;
  void *v4;
  __CFString *v5;

  v1 = a1;
  v2 = &stru_10001D350;
  v3 = 32;
  do
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), v1 & 1));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", v2));

    v1 >>= 1;
    v2 = v5;
    --v3;
  }
  while (v3);
  return v5;
}

void sub_100013DA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t setBit(uint64_t result, int a2, unsigned int *a3)
{
  unsigned int v3;

  v3 = *a3 | result;
  if (!a2)
    v3 = *a3 & ~(_DWORD)result;
  *a3 = v3;
  return result;
}

void updateJasperValidationStatus(int a1, JasperValidationStatus *a2)
{
  if ((a1 & 0x400) != 0)
  {
    sub_1000047A0(a2, 40, CFSTR("JASPER_VC_PROJECTOR_NOT_ACTIVE"));
    if ((a1 & 0x1000) == 0)
    {
LABEL_3:
      if ((a1 & 0x8000) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((a1 & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  sub_1000047A0(a2, 41, CFSTR("JASPER_VC_BRICK"));
  if ((a1 & 0x8000) == 0)
  {
LABEL_4:
    if ((a1 & 0x20000) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  sub_1000047A0(a2, 42, CFSTR("JASPER_VC_PROJECTOR_FAULT"));
  if ((a1 & 0x20000) == 0)
  {
LABEL_5:
    if ((a1 & 0x40000) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  sub_1000047A0(a2, 43, CFSTR("JASPER_VC_SW_SAFETY"));
  if ((a1 & 0x40000) == 0)
  {
LABEL_6:
    if ((a1 & 0x80000) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  sub_1000047A0(a2, 44, CFSTR("JASPER_VC_OVERHEAT"));
  if ((a1 & 0x80000) == 0)
  {
LABEL_7:
    if ((a1 & 0x100000) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  sub_1000047A0(a2, 45, CFSTR("JASPER_VC_POWERSUPPLY"));
  if ((a1 & 0x100000) == 0)
  {
LABEL_8:
    if ((a1 & 0x200000) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  sub_1000047A0(a2, 46, CFSTR("JASPER_VC_SENSOR_STATUS"));
  if ((a1 & 0x200000) == 0)
  {
LABEL_9:
    if ((a1 & 0x400000) == 0)
      return;
LABEL_19:
    sub_1000047A0(a2, 48, CFSTR("JASPER_VC_PROJECTORON_NOT_ALLOWED"));
    return;
  }
LABEL_18:
  sub_1000047A0(a2, 47, CFSTR("JASPER_VC_SENSOR_MONITOR"));
  if ((a1 & 0x400000) != 0)
    goto LABEL_19;
}

void setTestValidationBit(int a1, id *a2)
{
  id v4;

  if (a1)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    if ((a1 & 1) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("SENSOR_FRAMERATE"));
    if ((a1 & 2) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("SENSOR_EXPOSURE"));
    if ((a1 & 4) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("PROJECTOR_SELECT_AB"));
    if ((a1 & 8) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("PROJECTOR_SELECT_C"));
    if ((a1 & 0x10) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("PROJECTOR_SELECT_AB34"));
    if ((a1 & 0x20) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("PROJECTOR_IOUT0"));
    if ((a1 & 0x40) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("PROJECTOR_IOUT1"));
    if ((a1 & 0x80) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("PROJECTOR_IOUT2"));
    if ((a1 & 0x100) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("PROJECTOR_IOUT3"));
    if ((a1 & 0x200) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("PROJECTOR_IOUT4"));
    if ((a1 & 0x400) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("PROJECTOR_NOT_ACTIVE"));
    if ((a1 & 0x800) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("MB_NO_ENABLE"));
    if ((a1 & 0x1000) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("MB_BRICK"));
    if ((a1 & 0x2000) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("YG"));
    if ((a1 & 0x4000) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("PROJECTOR_CC"));
    if ((a1 & 0x8000) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("PROJECTOR_FAULT"));
    if ((a1 & 0x10000) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("PROJECTOR_STROBECOUNT"));
    if ((a1 & 0x20000) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("SW_SAFETY"));
    if ((a1 & 0x40000) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("OVERHEAT"));
    if ((a1 & 0x80000) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("POWERSUPPLY"));
    if ((a1 & 0x100000) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("SENSOR_STATUS"));
    if ((a1 & 0x200000) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("SENSOR_MONITOR"));
    if ((a1 & 0x400000) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("PROJECTORON_NOT_ALLOWED"));
    objc_msgSend(*a2, "setValue:forKey:", v4, CFSTR("FW VALIDATION FAIL INFO"));

  }
}

void sub_1000141E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

unint64_t isYGErrorDetected(unint64_t a1)
{
  return (a1 >> 13) & 1;
}

const __CFString *getJasperStatusValueString(int a1)
{
  const __CFString *result;
  const __CFString *v3;

  result = CFSTR("JASPER_PASS_OK");
  if (a1 > 100)
  {
    v3 = CFSTR("JASPER_VC_REAL_POWERSUPPLY");
    if (a1 != 525312)
      v3 = CFSTR("JASPER_PASS_OK");
    if (a1 == 101)
      return CFSTR("JASPER_GENERIC_ERROR");
    else
      return v3;
  }
  else
  {
    switch(a1)
    {
      case 10:
        result = CFSTR("JASPER_MODULE_IS_MISSING");
        break;
      case 11:
        result = CFSTR("JASPER_INTERFACE_ERROR");
        break;
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 32:
      case 33:
      case 34:
      case 35:
      case 36:
      case 37:
      case 38:
      case 39:
        return result;
      case 20:
        result = CFSTR("JASPER_FAILED_TO_START_STREAMING");
        break;
      case 21:
        result = CFSTR("JASPER_FAILED_TO_STOP_STREAMING");
        break;
      case 22:
        result = CFSTR("JASPER_FAILED_STREAM_CONTROL");
        break;
      case 30:
        result = CFSTR("JASPER_FPS_ERROR");
        break;
      case 31:
        result = CFSTR("JASPER_POINTS_ERROR");
        break;
      case 40:
        result = CFSTR("JASPER_VC_PROJECTOR_NOT_ACTIVE");
        break;
      case 41:
        result = CFSTR("JASPER_VC_BRICK");
        break;
      case 42:
        result = CFSTR("JASPER_VC_PROJECTOR_FAULT");
        break;
      case 43:
        result = CFSTR("JASPER_VC_SW_SAFETY");
        break;
      case 44:
        result = CFSTR("JASPER_VC_OVERHEAT");
        break;
      case 45:
        result = CFSTR("JASPER_VC_POWERSUPPLY");
        break;
      case 46:
        result = CFSTR("JASPER_VC_SENSOR_STATUS");
        break;
      case 47:
        result = CFSTR("JASPER_VC_SENSOR_MONITOR");
        break;
      case 48:
        result = CFSTR("JASPER_VC_PROJECTORON_NOT_ALLOWED");
        break;
      case 49:
        result = CFSTR("JASPER_VC_ANY_VALIDATION_ERROR");
        break;
      default:
        if (a1 == -2)
          result = CFSTR("JASPER_UNSEALED_STATUS");
        break;
    }
  }
  return result;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

id objc_msgSend_ConfigDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ConfigDevice:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_bankIds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bankIds");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_checkConnectivity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkConnectivity");
}

id objc_msgSend_confidences(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "confidences");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "data");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_finalizingOnError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finalizingOnError");
}

id objc_msgSend_finalizingWithStatusCode_andInfoString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finalizingWithStatusCode:andInfoString:");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "floatValue");
}

id objc_msgSend_getConfigurationForCaseMask_returnedConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getConfigurationForCaseMask:returnedConfiguration:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_isAllStatusesGood(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAllStatusesGood");
}

id objc_msgSend_isPortTypeJasperDetected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPortTypeJasperDetected");
}

id objc_msgSend_isUnsealedUnitModule(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isUnsealedUnitModule");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_makeWithDataBuffer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeWithDataBuffer:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForInfoDictionaryKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForInfoDictionaryKey:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_produceStatusForDiagnosticConfigurationDetailsOnFailureOnly_ValidationStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "produceStatusForDiagnosticConfigurationDetailsOnFailureOnly:ValidationStatus:");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_startStreaming(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startStreaming");
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusCode");
}

id objc_msgSend_stopStreaming(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopStreaming");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "string");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_updateStatusDictionary_andValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateStatusDictionary:andValue:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}
