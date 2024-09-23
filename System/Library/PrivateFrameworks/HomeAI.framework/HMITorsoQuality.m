@implementation HMITorsoQuality

+ (float)entropy:(const void *)a3 numPixels:(int)a4
{
  int *v4;
  int *v5;
  double v6;
  float v7;
  float v8;
  float v9;

  v4 = *(int **)a3;
  v5 = (int *)*((_QWORD *)a3 + 1);
  if (*(int **)a3 == v5)
    return 0.0;
  v6 = (double)a4 + 1.0e-20;
  v7 = 0.0;
  do
  {
    v8 = (double)*v4 / v6;
    if (v8 > 1.0e-20)
    {
      v9 = (double)*v4 / v6;
      v7 = v7 + (float)(v8 * logf(v9));
    }
    ++v4;
  }
  while (v4 != v5);
  return v7;
}

+ (float)entropyOfLaplacianForBGRAPixelBuffer:(__CVBuffer *)a3
{
  double Size;
  double v5;
  double v6;
  void *BaseAddressOfPlane;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  vImage_Error v11;
  float v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  cv *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  std::vector<int>::pointer begin;
  __int16 v28;
  int v29;
  void *v30;
  float v31;
  unsigned int *v32;
  unsigned int v33;
  unsigned int v34;
  uint64_t v35;
  char *v36;
  unsigned int *v37;
  unsigned int v38;
  unsigned int v39;
  uint64_t v40;
  _DWORD *v41;
  std::vector<int>::value_type v43[8];
  std::vector<int> v44;
  _OWORD v45[4];
  char *v46;
  cv *v47;
  _QWORD v48[2];
  unsigned int v49;
  int v50;
  _DWORD v51[2];
  char *v52;
  unsigned int *v53;
  char *v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  _DWORD *v58;
  cv *v59;
  _QWORD v60[2];
  vImage_Buffer v61;
  vImage_Buffer v62;

  Size = HMICVPixelBufferGetSize(a3);
  v6 = v5;
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
  v8 = (unint64_t)v6;
  v9 = (unint64_t)Size;
  v10 = (char *)malloc_type_malloc(3 * (unint64_t)Size * (unint64_t)v6, 0xF6C0297EuLL);
  v62.data = BaseAddressOfPlane;
  v62.height = (unint64_t)v6;
  v62.width = (unint64_t)Size;
  v62.rowBytes = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  v61.data = v10;
  v61.height = (unint64_t)v6;
  v61.width = (unint64_t)Size;
  v61.rowBytes = 3 * (unint64_t)Size;
  v11 = vImageConvert_RGBA8888toRGB888(&v62, &v61, 0);
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  if (v11)
  {
    free(v10);
    return 1.0;
  }
  else
  {
    v51[0] = (unint64_t)v6;
    v51[1] = (unint64_t)Size;
    v52 = v10;
    v53 = 0;
    v13 = 3 * (int)v9;
    if ((_DWORD)v8 == 1)
      v14 = 3 * (int)v9;
    else
      v14 = 3 * (unint64_t)Size;
    if (v9)
      v15 = v14;
    else
      v15 = 0;
    if (v14 == v13 || v9 == 0)
      v17 = 1124024336;
    else
      v17 = 1124007952;
    v58 = v51;
    v59 = (cv *)v60;
    v49 = v17;
    v50 = 2;
    v60[0] = v15;
    v60[1] = 3;
    v56 = &v10[v15 * (int)v8];
    v57 = 0;
    v54 = v10;
    v55 = (uint64_t)&v56[v13 - v15];
    v46 = (char *)v45 + 8;
    v47 = (cv *)v48;
    v48[0] = 0;
    v48[1] = 0;
    LODWORD(v45[0]) = 1124007936;
    memset((char *)v45 + 4, 0, 48);
    v45[3] = 0u;
    cv::_InputArray::_InputArray((uint64_t)&v44, (const cv::Mat *)&v49);
    cv::_OutputArray::_OutputArray((uint64_t)v43, (cv::Mat *)v45);
    cv::Laplacian((cv *)&v44, (const cv::_InputArray *)v43, (const cv::_OutputArray *)(((v49 >> 3) & 0x1FF) + 1), 1, 4u, 1.0, 0.0);
    v43[0] = 0;
    std::vector<int>::vector(&v44, 0x1F4uLL, v43);
    v18 = DWORD2(v45[0]);
    if (SDWORD2(v45[0]) < 1)
    {
      v20 = 0;
    }
    else
    {
      v19 = 0;
      v20 = 0;
      v21 = *(_QWORD *)&v45[1];
      v22 = v47;
      v23 = HIDWORD(v45[0]);
      do
      {
        if (v23 >= 1)
        {
          v24 = 0;
          v25 = v21 + *(_QWORD *)v22 * v19;
          do
          {
            v26 = 0;
            begin = v44.__begin_;
            do
            {
              v28 = *(_WORD *)(v25 + v26);
              if ((unsigned __int16)(v28 + 1020) <= 0x7F7u)
              {
                v29 = (int)(float)((float)((float)v28 + 1020.0) / 4.08);
                ++begin[v29];
                v20 = (v20 + 1);
              }
              v26 += 2;
            }
            while (v26 != 6);
            ++v24;
            v23 = HIDWORD(v45[0]);
            v25 += 6;
          }
          while (v24 < SHIDWORD(v45[0]));
          v18 = DWORD2(v45[0]);
        }
        ++v19;
      }
      while (v19 < v18);
    }
    free(v10);
    +[HMITorsoQuality entropy:numPixels:](HMITorsoQuality, "entropy:numPixels:", &v44, v20);
    v12 = v31;
    if (v44.__begin_)
    {
      v44.__end_ = v44.__begin_;
      operator delete(v44.__begin_);
    }
    v32 = (unsigned int *)*((_QWORD *)&v45[1] + 1);
    if (*((_QWORD *)&v45[1] + 1))
    {
      do
      {
        v33 = __ldaxr(v32);
        v34 = v33 - 1;
      }
      while (__stlxr(v34, v32));
      if (!v34)
        cv::Mat::deallocate((cv::Mat *)v45, v30);
    }
    *(_QWORD *)&v45[1] = 0;
    memset(&v45[2], 0, 24);
    if (SDWORD1(v45[0]) >= 1)
    {
      v35 = 0;
      v36 = v46;
      do
        *(_DWORD *)&v36[4 * v35++] = 0;
      while (v35 < SDWORD1(v45[0]));
    }
    *((_QWORD *)&v45[1] + 1) = 0;
    if (v47 != (cv *)v48)
      cv::fastFree((void **)v47, v30);
    v37 = v53;
    if (v53)
    {
      do
      {
        v38 = __ldaxr(v37);
        v39 = v38 - 1;
      }
      while (__stlxr(v39, v37));
      if (!v39)
        cv::Mat::deallocate((cv::Mat *)&v49, v30);
    }
    v52 = 0;
    v55 = 0;
    v56 = 0;
    v54 = 0;
    if (v50 >= 1)
    {
      v40 = 0;
      v41 = v58;
      do
        v41[v40++] = 0;
      while (v40 < v50);
    }
    v53 = 0;
    if (v59 != (cv *)v60)
      cv::fastFree((void **)v59, v30);
  }
  return v12;
}

+ (float)entropyOfSaturationForBGRAPixelBuffer:(__CVBuffer *)a3
{
  double Size;
  double v5;
  double v6;
  double v7;
  char *BaseAddress;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  char *v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  float v20;
  double v22;
  float v23;
  float v24;
  std::vector<int>::value_type __x;
  std::vector<int> v27;

  Size = HMICVPixelBufferGetSize(a3);
  if (!((int)v5 * (int)Size))
    return 1.0;
  v6 = Size;
  v7 = v5;
  __x = 0;
  std::vector<int>::vector(&v27, 0x64uLL, &__x);
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
  if (v7 <= 0.0)
  {
    v11 = 0;
  }
  else
  {
    v9 = BaseAddress;
    v10 = 0;
    v11 = 0;
    do
    {
      if (v6 > 0.0)
      {
        v12 = 0;
        v13 = 1;
        do
        {
          v14 = &v9[(v12 & 0xFFFFFFFC) + CVPixelBufferGetBytesPerRowOfPlane(a3, 0) * v10];
          v15 = v14[2];
          v16 = v14[1];
          v17 = *v14;
          if (v16 <= v17)
            v18 = v17;
          else
            v18 = v16;
          if (v16 < v17)
            v17 = v16;
          if (v15 <= v18)
            v19 = v18;
          else
            v19 = v15;
          if (v15 < v17)
            v17 = v15;
          v20 = (double)(int)(v19 - v17) / 255.0;
          if (v20 >= 0.0 && v20 < 1.0)
          {
            ++v27.__begin_[(float)(v20 / 0.01)];
            v11 = (v11 + 1);
          }
          v22 = (double)v13;
          v12 += 4;
          ++v13;
        }
        while (v6 > v22);
      }
      ++v10;
    }
    while (v7 > (double)(int)v10);
  }
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  +[HMITorsoQuality entropy:numPixels:](HMITorsoQuality, "entropy:numPixels:", &v27, v11);
  v23 = v24;
  if (v27.__begin_)
  {
    v27.__end_ = v27.__begin_;
    operator delete(v27.__begin_);
  }
  return v23;
}

@end
