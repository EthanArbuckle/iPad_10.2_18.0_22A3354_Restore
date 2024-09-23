@implementation HMIFaceQualityEntropyOfLaplacian

- (HMIFaceQualityEntropyOfLaplacian)init
{
  HMIFaceQualityEntropyOfLaplacian *v2;
  HMIFaceQualityEntropyOfLaplacian *v3;
  unint64_t numBins;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMIFaceQualityEntropyOfLaplacian;
  v2 = -[HMIFaceQualityEntropyOfLaplacian init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_numBins = 500;
    v2->_maxLaplacianScore = 1020;
    v2->_minLaplacianScore = -1020;
    numBins = v2->_numBins;
    v2->_binWidth = (float)((v2->_maxLaplacianScore + 1020) / (int)numBins);
    v2->_maxScore = 4.0;
    std::vector<float>::resize((uint64_t)&v2->_histogram, numBins);
  }
  return v3;
}

- (float)computeJunkScoreForPixelBuffer:(__CVBuffer *)a3
{
  double Size;
  double v6;
  double v7;
  void *BaseAddressOfPlane;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v15;
  vector<float, std::allocator<float>> *p_histogram;
  float *begin;
  uint64_t v18;
  int v19;
  int v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  cv *v25;
  uint64_t v26;
  float *v27;
  __int16 *v28;
  uint64_t v29;
  int v30;
  int v31;
  int v32;
  float *end;
  float *v34;
  float v35;
  float v36;
  float *v37;
  float v38;
  float maxScore;
  void *v40;
  float v41;
  unsigned int *v42;
  unsigned int v43;
  unsigned int v44;
  uint64_t v45;
  char *v46;
  unsigned int *v47;
  unsigned int v48;
  unsigned int v49;
  uint64_t v50;
  int *v51;
  float v52;
  _BYTE v54[32];
  _BYTE v55[32];
  _OWORD v56[4];
  char *v57;
  cv *v58;
  _QWORD v59[2];
  unsigned int v60;
  int v61;
  int v62;
  int v63;
  char *v64;
  unsigned int *v65;
  char *v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  int *v70;
  cv *v71;
  _QWORD v72[2];
  vImage_Buffer v73;
  vImage_Buffer v74;

  Size = HMICVPixelBufferGetSize(a3);
  v7 = v6;
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
  v9 = (unint64_t)Size;
  v10 = (char *)malloc_type_malloc(3 * (unint64_t)Size * (unint64_t)v7, 0xB651B16DuLL);
  v74.data = BaseAddressOfPlane;
  v74.height = (unint64_t)v7;
  v74.width = (unint64_t)Size;
  v74.rowBytes = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  v73.data = v10;
  v73.height = (unint64_t)v7;
  v73.width = (unint64_t)Size;
  v73.rowBytes = 3 * (unint64_t)Size;
  vImageConvert_RGBA8888toRGB888(&v74, &v73, 0);
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  v62 = (unint64_t)v7;
  v63 = (unint64_t)Size;
  v64 = v10;
  v65 = 0;
  v11 = 3 * v63;
  if (v62 == 1)
    v12 = 3 * (int)v9;
  else
    v12 = 3 * (unint64_t)Size;
  if (v9)
    v13 = v12;
  else
    v13 = 0;
  if (v12 == v11 || v9 == 0)
    v15 = 1124024336;
  else
    v15 = 1124007952;
  v70 = &v62;
  v71 = (cv *)v72;
  v60 = v15;
  v61 = 2;
  v72[0] = v13;
  v72[1] = 3;
  v68 = &v10[v13 * (int)(unint64_t)v7];
  v69 = 0;
  v66 = v10;
  v67 = (uint64_t)&v68[v11 - v13];
  p_histogram = &self->_histogram;
  begin = self->_histogram.__begin_;
  v18 = (char *)self->_histogram.__end_ - (char *)begin;
  if (v18 >= 1)
    bzero(begin, 4 * (((unint64_t)v18 >> 2) - ((unint64_t)v18 > 3)) + 4);
  v57 = (char *)v56 + 8;
  v58 = (cv *)v59;
  v59[0] = 0;
  v59[1] = 0;
  LODWORD(v56[0]) = 1124007936;
  memset((char *)v56 + 4, 0, 48);
  v56[3] = 0u;
  cv::_InputArray::_InputArray((uint64_t)v55, (const cv::Mat *)&v60);
  cv::_OutputArray::_OutputArray((uint64_t)v54, (cv::Mat *)v56);
  cv::Laplacian((cv *)v55, (const cv::_InputArray *)v54, (const cv::_OutputArray *)(((v60 >> 3) & 0x1FF) + 1), 1, 4u, 1.0, 0.0);
  v20 = v62;
  v19 = v63;
  v21 = v60;
  v22 = DWORD2(v56[0]);
  if (SDWORD2(v56[0]) >= 1)
  {
    v23 = 0;
    v24 = HIDWORD(v56[0]);
    v25 = v58;
    v26 = *(_QWORD *)&v56[1] + 4;
    do
    {
      if ((int)v24 >= 1)
      {
        v27 = p_histogram->__begin_;
        v28 = (__int16 *)(v26 + *(_QWORD *)v25 * v23);
        v29 = v24;
        do
        {
          v30 = (int)(float)((float)((float)*(v28 - 2) + 1020.0) / self->_binWidth);
          v27[v30] = v27[v30] + 1.0;
          v31 = (int)(float)((float)((float)*(v28 - 1) + 1020.0) / self->_binWidth);
          v27[v31] = v27[v31] + 1.0;
          v32 = (int)(float)((float)((float)*v28 + 1020.0) / self->_binWidth);
          v27[v32] = v27[v32] + 1.0;
          v28 += 3;
          --v29;
        }
        while (v29);
      }
      ++v23;
    }
    while (v23 != v22);
  }
  v34 = p_histogram->__begin_;
  end = self->_histogram.__end_;
  v35 = 0.0;
  if (v34 != end)
  {
    v36 = (float)(int)(v19 * v20 + v19 * v20 * ((v21 >> 3) & 0x1FF));
    v37 = v34;
    do
    {
      *v37 = *v37 / v36;
      ++v37;
    }
    while (v37 != end);
    if (v34 != end)
    {
      v35 = 0.0;
      do
      {
        if (*v34 >= 0.001)
        {
          v38 = *v34;
          v35 = v35 - (float)(v38 * logf(*v34));
        }
        ++v34;
      }
      while (v34 != end);
    }
  }
  maxScore = self->_maxScore;
  free(v10);
  v41 = self->_maxScore;
  v42 = (unsigned int *)*((_QWORD *)&v56[1] + 1);
  if (*((_QWORD *)&v56[1] + 1))
  {
    do
    {
      v43 = __ldaxr(v42);
      v44 = v43 - 1;
    }
    while (__stlxr(v44, v42));
    if (!v44)
      cv::Mat::deallocate((cv::Mat *)v56, v40);
  }
  *(_QWORD *)&v56[1] = 0;
  memset(&v56[2], 0, 24);
  if (SDWORD1(v56[0]) >= 1)
  {
    v45 = 0;
    v46 = v57;
    do
      *(_DWORD *)&v46[4 * v45++] = 0;
    while (v45 < SDWORD1(v56[0]));
  }
  *((_QWORD *)&v56[1] + 1) = 0;
  if (v58 != (cv *)v59)
    cv::fastFree((void **)v58, v40);
  v47 = v65;
  if (v65)
  {
    do
    {
      v48 = __ldaxr(v47);
      v49 = v48 - 1;
    }
    while (__stlxr(v49, v47));
    if (!v49)
      cv::Mat::deallocate((cv::Mat *)&v60, v40);
  }
  v64 = 0;
  v67 = 0;
  v68 = 0;
  v66 = 0;
  if (v61 >= 1)
  {
    v50 = 0;
    v51 = v70;
    do
      v51[v50++] = 0;
    while (v50 < v61);
  }
  v65 = 0;
  if (v71 != (cv *)v72)
    cv::fastFree((void **)v71, v40);
  if (v35 >= maxScore)
    v52 = maxScore;
  else
    v52 = v35;
  return v41 - v52;
}

- (void).cxx_destruct
{
  vector<float, std::allocator<float>> *p_histogram;
  float *begin;

  p_histogram = &self->_histogram;
  begin = self->_histogram.__begin_;
  if (begin)
  {
    p_histogram->__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
