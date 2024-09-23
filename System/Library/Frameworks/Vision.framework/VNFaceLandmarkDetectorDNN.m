@implementation VNFaceLandmarkDetectorDNN

+ (void)recordDefaultConfigurationOptionsInDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___VNFaceLandmarkDetectorDNN;
  objc_msgSendSuper2(&v7, sel_recordDefaultConfigurationOptionsInDictionary_, v4);
  objc_msgSend(a1, "inputBlobNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("VNEspressoModelFileBasedDetectorOption_InputBlobNames"));

  objc_msgSend(a1, "outputBlobNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("VNEspressoModelFileBasedDetectorOption_OutputBlobNames"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E459CEC8, CFSTR("VNFaceLandmarkDetectorDNNProcessOption_Constellation"));
}

+ (id)configurationOptionKeysForDetectorKey
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__VNFaceLandmarkDetectorDNN_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNFaceLandmarkDetectorDNN configurationOptionKeysForDetectorKey]::onceToken != -1)
    dispatch_once(&+[VNFaceLandmarkDetectorDNN configurationOptionKeysForDetectorKey]::onceToken, block);
  return (id)+[VNFaceLandmarkDetectorDNN configurationOptionKeysForDetectorKey]::configurationOptionKeys;
}

+ (NSArray)inputBlobNames
{
  std::string *v2;
  std::string *v3;
  id v4;
  std::string *v5;
  std::string *i;
  id v7;
  std::string *v8;
  void *v9;
  std::string *v11;
  std::string *v12;
  std::string *v13;
  char v14[24];
  __int128 __p;
  std::string::size_type v16;
  char *v17;
  char *v18;
  char *v19;
  std::string **v20;
  char v21;

  vision::mod::LandmarkDetectorDNN_Options::LandmarkDetectorDNN_Options((uint64_t)v14, objc_msgSend(a1, "landmarkDetectorDNNVersion"));
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v20 = &v11;
  v21 = 0;
  v2 = (std::string *)operator new(0x18uLL);
  v11 = v2;
  v12 = v2;
  v3 = v2 + 1;
  v13 = v2 + 1;
  if (SHIBYTE(v16) < 0)
  {
    std::string::__init_copy_ctor_external(v2, (const std::string::value_type *)__p, *((std::string::size_type *)&__p + 1));
  }
  else
  {
    *(_OWORD *)&v2->__r_.__value_.__l.__data_ = __p;
    v2->__r_.__value_.__r.__words[2] = v16;
  }
  v12 = v3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = v11;
  for (i = v12; v5 != i; ++v5)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3940]);
    v8 = v5;
    if (SHIBYTE(v5->__r_.__value_.__r.__words[2]) < 0)
      v8 = (std::string *)v5->__r_.__value_.__r.__words[0];
    v9 = (void *)objc_msgSend(v7, "initWithUTF8String:", v8, v11);
    objc_msgSend(v4, "addObject:", v9);

  }
  v20 = &v11;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v20);
  std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::destroy(v19);
  std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::destroy(v18);
  std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::destroy(v17);
  if (SHIBYTE(v16) < 0)
    operator delete((void *)__p);
  return (NSArray *)v4;
}

+ (NSArray)outputBlobNames
{
  id v2;
  std::vector<std::string>::pointer begin;
  std::vector<std::string>::pointer i;
  id v5;
  std::vector<std::string>::pointer v6;
  void *v7;
  std::vector<std::string> v9;
  uint64_t *v10[5];
  char v11;
  char *v12;
  char *v13;
  char *v14;
  std::vector<std::string> *v15;

  vision::mod::LandmarkDetectorDNN_Options::LandmarkDetectorDNN_Options((uint64_t)v10, objc_msgSend(a1, "landmarkDetectorDNNVersion"));
  vision::mod::LandmarkDetectorDNN_Options::getBlobNamesOutput(&v9, v10);
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  begin = v9.__begin_;
  for (i = v9.__end_; begin != i; ++begin)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    v6 = begin;
    if (SHIBYTE(begin->__r_.__value_.__r.__words[2]) < 0)
      v6 = (std::vector<std::string>::pointer)begin->__r_.__value_.__r.__words[0];
    v7 = (void *)objc_msgSend(v5, "initWithUTF8String:", v6);
    objc_msgSend(v2, "addObject:", v7);

  }
  v15 = &v9;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v15);
  std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::destroy(v14);
  std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::destroy(v13);
  std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::destroy(v12);
  if (v11 < 0)
    operator delete(v10[3]);
  return (NSArray *)v2;
}

+ (int)_detectorConstellationForRequestConstellation:(unint64_t)a3
{
  _QWORD *v4;
  uint64_t v5;
  unint64_t v6;
  BOOL v7;
  _QWORD *v8;

  if (+[VNFaceLandmarkDetectorDNN _detectorConstellationForRequestConstellation:]::onceToken != -1)
    dispatch_once(&+[VNFaceLandmarkDetectorDNN _detectorConstellationForRequestConstellation:]::onceToken, &__block_literal_global_26774);
  v4 = *(_QWORD **)(+[VNFaceLandmarkDetectorDNN _detectorConstellationForRequestConstellation:]::map + 8);
  if (!v4)
    return 0;
  v5 = +[VNFaceLandmarkDetectorDNN _detectorConstellationForRequestConstellation:]::map + 8;
  do
  {
    v6 = v4[4];
    v7 = v6 >= a3;
    if (v6 >= a3)
      v8 = v4;
    else
      v8 = v4 + 1;
    if (v7)
      v5 = (uint64_t)v4;
    v4 = (_QWORD *)*v8;
  }
  while (*v8);
  if (v5 != +[VNFaceLandmarkDetectorDNN _detectorConstellationForRequestConstellation:]::map + 8
    && *(_QWORD *)(v5 + 32) <= a3)
  {
    return *(_DWORD *)(v5 + 40);
  }
  else
  {
    return 0;
  }
}

_QWORD *__75__VNFaceLandmarkDetectorDNN__detectorConstellationForRequestConstellation___block_invoke()
{
  _QWORD *result;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t *v5;
  unint64_t *v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t *v9;
  BOOL v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  _OWORD *v14;
  uint64_t v15;
  unint64_t v16;

  result = (_QWORD *)operator new();
  v1 = (uint64_t)result;
  v2 = 0;
  v3 = 0;
  result[1] = 0;
  v4 = result + 1;
  result[2] = 0;
  *result = result + 1;
  v5 = result + 1;
  while (1)
  {
    v6 = (unint64_t *)((char *)&unk_1A15F9050 + 16 * v3);
    v7 = v4;
    if (v5 == v4)
      goto LABEL_8;
    v8 = v2;
    v9 = v4;
    if (v2)
    {
      do
      {
        v7 = v8;
        v8 = (uint64_t *)v8[1];
      }
      while (v8);
    }
    else
    {
      do
      {
        v7 = (uint64_t *)v9[2];
        v10 = *v7 == (_QWORD)v9;
        v9 = v7;
      }
      while (v10);
    }
    v11 = *v6;
    if (v7[4] < *v6)
    {
LABEL_8:
      v12 = v2 ? v7 : v4;
      v13 = v2 ? v7 + 1 : v4;
    }
    else
    {
      v12 = v4;
      v13 = v4;
      if (v2)
      {
        v13 = v4;
        while (1)
        {
          while (1)
          {
            v12 = v2;
            v16 = v2[4];
            if (v11 >= v16)
              break;
            v2 = (uint64_t *)*v12;
            v13 = v12;
            if (!*v12)
              goto LABEL_15;
          }
          if (v16 >= v11)
            break;
          v13 = v12 + 1;
          v2 = (uint64_t *)v12[1];
          if (!v2)
            goto LABEL_15;
        }
      }
    }
    if (!*v13)
    {
LABEL_15:
      v14 = operator new(0x30uLL);
      v14[2] = *(_OWORD *)v6;
      *(_QWORD *)v14 = 0;
      *((_QWORD *)v14 + 1) = 0;
      *((_QWORD *)v14 + 2) = v12;
      *v13 = (uint64_t)v14;
      v15 = **(_QWORD **)v1;
      if (v15)
      {
        *(_QWORD *)v1 = v15;
        v14 = (_OWORD *)*v13;
      }
      result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(v1 + 8), (uint64_t *)v14);
      ++*(_QWORD *)(v1 + 16);
    }
    if (++v3 == 2)
      break;
    v5 = *(uint64_t **)v1;
    v2 = *(uint64_t **)(v1 + 8);
  }
  +[VNFaceLandmarkDetectorDNN _detectorConstellationForRequestConstellation:]::map = v1;
  return result;
}

void __66__VNFaceLandmarkDetectorDNN_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNFaceLandmarkDetectorDNN;
  objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "addObject:", CFSTR("VNFaceLandmarkDetectorDNNProcessOption_Constellation"));
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)+[VNFaceLandmarkDetectorDNN configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNFaceLandmarkDetectorDNN configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;

}

- (void)landmarkPoints65
{
  return &self->_landmarkPoints65;
}

- (BOOL)requestConstellation:(unint64_t *)a3 cvmlConstellation:(int *)a4 fromOptions:(id)a5 error:(id *)a6
{
  id v9;
  BOOL v10;
  uint64_t v11;
  BOOL v12;
  unint64_t v14;

  v9 = a5;
  if (a3)
    v10 = a4 == 0;
  else
    v10 = 1;
  v11 = !v10;
  +[VNError VNAssert:log:](VNError, "VNAssert:log:", v11, CFSTR("Input parameter cannot be NULL"));
  v14 = 0;
  v12 = +[VNValidationUtilities getNSUIntegerValue:forKey:inOptions:error:](VNValidationUtilities, "getNSUIntegerValue:forKey:inOptions:error:", &v14, CFSTR("VNFaceLandmarkDetectorDNNProcessOption_Constellation"), v9, a6);
  if (v12)
  {
    *a3 = v14;
    *a4 = objc_msgSend((id)objc_opt_class(), "_detectorConstellationForRequestConstellation:", v14);
  }

  return v12;
}

- (BOOL)getLandmarkPoints:(void *)a3 forRequestConstellation:(unint64_t)a4 error:(id *)a5
{
  unsigned int v8;
  uint64_t *v9;
  uint64_t v10;
  LandmarkDetectorDNN *ptr;
  unint64_t v12;
  unint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  unint64_t v17;
  BOOL v18;
  float v19;
  float *v20;
  float *v21;
  uint64_t v22;
  float *v23;
  uint64_t v24;
  float v25;
  int *v26;
  float *v27;
  float *v28;
  int v29;
  int v30;
  float v31;
  float v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  _QWORD *exception;
  void *__p;
  _BYTE *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;

  v8 = objc_msgSend((id)objc_opt_class(), "_detectorConstellationForRequestConstellation:", a4);
  v9 = std::map<vision::mod::_constellationType,std::pair<std::string,BOOL>>::at(*((uint64_t **)self->_landmarkDetector.__ptr_ + 12), v8);
  v10 = *((unsigned __int8 *)v9 + 23);
  if ((v10 & 0x80u) != 0)
    v10 = v9[1];
  if (v10)
  {
    ptr = self->_landmarkDetector.__ptr_;
    if (!*(_BYTE *)ptr)
    {
      exception = __cxa_allocate_exception(8uLL);
      *exception = 2932;
      __cxa_throw(exception, MEMORY[0x1E0DE4F28], 0);
    }
    v13 = *((_QWORD *)ptr + 25);
    v12 = *((_QWORD *)ptr + 26);
    v14 = std::map<vision::mod::_constellationType,std::pair<std::string,BOOL>>::at(*((uint64_t **)ptr + 12), v8);
    v15 = (uint64_t *)std::map<std::string,std::vector<float>>::at((uint64_t)ptr + 160, v14);
    v16 = *v15;
    v17 = v15[12];
    vision::mod::LandmarkDetectorDNN::checkConstellation(v17 >> 1, v8);
    v43 = 0;
    v44 = 0;
    v45 = 0;
    Geometry2D_mallocCart2D(&v43, v17 >> 1);
    if (v17 >= 2)
    {
      v19 = (float)v12;
      v20 = (float *)v43;
      v21 = (float *)v44;
      if (v17 >> 1 <= 1)
        v22 = 1;
      else
        v22 = v17 >> 1;
      v23 = (float *)(v16 + 4);
      v24 = v22;
      do
      {
        *v20++ = *(v23 - 1) * (float)v13;
        v25 = *v23;
        v23 += 2;
        *v21++ = v25 * v19;
        --v24;
      }
      while (v24);
      v40 = 0;
      v41 = 0;
      v42 = 0;
      vision::mod::ImageProcessing_Preprocessor::mapCoordinatesDestinationToSource((uint64_t)&v40, *((float **)ptr + 29), (uint64_t)&v43);
      free(v43);
      v43 = 0;
      free(v44);
      v44 = 0;
      LODWORD(v45) = 0;
      std::vector<_Geometry2D_point2D_>::vector(&__p, v17 >> 1);
      v26 = (int *)v40;
      v27 = (float *)v41;
      v28 = (float *)((char *)__p + 4);
      do
      {
        v29 = *v26++;
        v30 = v29;
        v31 = *v27++;
        v32 = *((float *)ptr + 48) - v31;
        *((_DWORD *)v28 - 1) = v30;
        *v28 = v32;
        v28 += 2;
        --v22;
      }
      while (v22);
    }
    else
    {
      v40 = 0;
      v41 = 0;
      v42 = 0;
      vision::mod::ImageProcessing_Preprocessor::mapCoordinatesDestinationToSource((uint64_t)&v40, *((float **)ptr + 29), (uint64_t)&v43);
      free(v43);
      v43 = 0;
      free(v44);
      v44 = 0;
      LODWORD(v45) = 0;
      std::vector<_Geometry2D_point2D_>::vector(&__p, v17 >> 1);
    }
    free(v40);
    v40 = 0;
    free(v41);
    v33 = 0;
    v34 = (v39 - (_BYTE *)__p) >> 3;
    if (v8 <= 2)
      v33 = vision::mod::constellationTypeSize[v8];
    v18 = v34 == v33;
    if (v34 == v33)
    {
      if (&__p != a3)
        std::vector<long long>::__assign_with_size[abi:ne180100]<long long *,long long *>((char *)a3, (char *)__p, (uint64_t)v39, (v39 - (_BYTE *)__p) >> 3);
    }
    else if (a5)
    {
      v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected number of Landmark points (%lu) while processing Face Landmarks request. Expected: %lu"), v34, v33);
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v35);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (__p)
    {
      v39 = __p;
      operator delete(__p);
    }
  }
  else if (a5)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Could not compute Landmarks using Landmark Detector due to internal error"));
    v18 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
  return v18;
}

- (BOOL)getLandmarkErrorEstimates:(void *)a3 forRequestConstellation:(unint64_t)a4 error:(id *)a5
{
  unsigned int v8;
  uint64_t *v9;
  uint64_t v10;
  LandmarkDetectorDNN *ptr;
  uint64_t v12;
  uint64_t *v13;
  int **v14;
  int *v15;
  unint64_t v16;
  _DWORD *v17;
  int v18;
  unint64_t v19;
  BOOL v20;
  id v21;
  void *v22;
  _QWORD *exception;
  void *__p;
  _BYTE *v26;

  v8 = objc_msgSend((id)objc_opt_class(), "_detectorConstellationForRequestConstellation:", a4);
  v9 = std::map<vision::mod::_constellationType,std::pair<std::string,BOOL>>::at(*((uint64_t **)self->_landmarkDetector.__ptr_ + 15), v8);
  v10 = *((unsigned __int8 *)v9 + 23);
  if ((v10 & 0x80u) != 0)
    v10 = v9[1];
  if (!v10)
    return 1;
  ptr = self->_landmarkDetector.__ptr_;
  if (!*(_BYTE *)ptr)
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = 2932;
    __cxa_throw(exception, MEMORY[0x1E0DE4F28], 0);
  }
  v12 = (uint64_t)ptr + 160;
  v13 = std::map<vision::mod::_constellationType,std::pair<std::string,BOOL>>::at(*((uint64_t **)ptr + 15), v8);
  v14 = (int **)std::map<std::string,std::vector<float>>::at(v12, v13);
  v15 = *v14;
  v16 = (unint64_t)v14[12];
  vision::mod::LandmarkDetectorDNN::checkConstellation(v16, v8);
  std::vector<float>::vector(&__p, v16);
  if (v16)
  {
    v17 = __p;
    do
    {
      v18 = *v15++;
      *v17++ = v18;
      --v16;
    }
    while (v16);
  }
  if (v8 <= 2)
    v19 = vision::mod::constellationTypeSize[v8];
  else
    v19 = 0;
  v20 = v19 == (v26 - (_BYTE *)__p) >> 2;
  if (v19 == (v26 - (_BYTE *)__p) >> 2)
  {
    if (&__p != a3)
      std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)a3, (char *)__p, (uint64_t)v26, v19);
  }
  else if (a5)
  {
    v21 = objc_alloc(MEMORY[0x1E0CB3940]);
    v22 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("Unexpected number of error estimates for Landmark points (%lu) while processing Face Landmarks request. Expected: %lu"), (v26 - (_BYTE *)__p) >> 2, v19);
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v22);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (__p)
  {
    v26 = __p;
    operator delete(__p);
  }
  return v20;
}

- (BOOL)translateAndNormalizeLandmarkPointsWrtLLCofAlignedFaceBBox:(void *)a3 imageBuffer:(id)a4 outputFace:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
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
  _BOOL4 v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  char v35;
  unint64_t v36;
  unint64_t v37;
  float *v44;
  float *v45;
  double a;
  double b;
  double c;
  double d;
  double tx;
  double ty;
  double v52;
  double v53;
  double v54;
  double v55;
  double v57;
  double v58;
  CGAffineTransform v59;
  CGAffineTransform v60;
  int v61;
  CGRect v62;

  v10 = a4;
  v11 = a5;
  v12 = objc_msgSend(v10, "width");
  v13 = objc_msgSend(v10, "height");
  -[VNFaceLandmarkDetector normalizedFaceBBoxForLandmarks:](self, "normalizedFaceBBoxForLandmarks:", v11);
  v57 = v14;
  v58 = v15;
  v17 = v16;
  v19 = v18;
  objc_msgSend(v11, "alignedBoundingBoxAsCGRect");
  v21 = v20 * (double)v12;
  v23 = v22 * (double)v12;
  v25 = v24 * (double)v13;
  v27 = v26 * (double)v13;
  v62.origin.x = v21;
  v62.origin.y = v25;
  v62.size.width = v23;
  v62.size.height = v27;
  v28 = CGRectEqualToRect(v62, *MEMORY[0x1E0C9D648]);
  v29 = v17 * (double)v12;
  v30 = v19 * (double)v13;
  if (v28)
    v31 = v19 * (double)v13;
  else
    v31 = v27;
  if (v28)
    v32 = v17 * (double)v12;
  else
    v32 = v23;
  if (v28)
    v33 = v58 * (double)v13;
  else
    v33 = v25;
  if (v28)
    v21 = v57 * (double)v12;
  v34 = v57 * (double)v12;
  v61 = -1;
  v35 = objc_msgSend(v11, "getFaceEXIFOrientation:error:", &v61, a6);
  if ((v35 & 1) != 0)
  {
    v36 = -[VNEspressoModelFileBasedDetector networkRequiredInputImageWidth](self, "networkRequiredInputImageWidth");
    v37 = -[VNEspressoModelFileBasedDetector networkRequiredInputImageHeight](self, "networkRequiredInputImageHeight");
    memset(&v60, 0, sizeof(v60));
    switch(v61)
    {
      case 2:
        v59.b = 0.0;
        v59.c = 0.0;
        v59.a = -1.0;
        __asm { FMOV            V0.2D, #1.0 }
        *(_OWORD *)&v59.d = _Q0;
        v59.ty = 0.0;
        break;
      case 3:
        v59.b = 0.0;
        v59.c = 0.0;
        v59.a = -1.0;
        *(_OWORD *)&v59.d = xmmword_1A15FB740;
        goto LABEL_18;
      case 4:
        v59.b = 0.0;
        v59.c = 0.0;
        v59.a = 1.0;
        *(_OWORD *)&v59.d = xmmword_1A15FB480;
LABEL_18:
        v59.ty = 1.0;
        break;
      case 5:
        *(_OWORD *)&v59.a = xmmword_1A15FB470;
        *(_OWORD *)&v59.c = xmmword_1A15FB480;
        __asm { FMOV            V0.2D, #1.0 }
        goto LABEL_24;
      case 6:
        *(_OWORD *)&v59.a = xmmword_1A15FB470;
        v59.c = 1.0;
        v59.d = 0.0;
        v59.tx = 0.0;
        v59.ty = 1.0;
        break;
      case 7:
        *(_OWORD *)&v59.a = xmmword_1A15FB460;
        v59.c = 1.0;
        v59.d = 0.0;
        goto LABEL_22;
      case 8:
        *(_OWORD *)&v59.a = xmmword_1A15FB460;
        *(_OWORD *)&v59.c = xmmword_1A15FB480;
        _Q0 = xmmword_1A15FB750;
LABEL_24:
        *(_OWORD *)&v59.tx = _Q0;
        break;
      default:
        v59.a = 1.0;
        v59.b = 0.0;
        v59.c = 0.0;
        v59.d = 1.0;
LABEL_22:
        v59.tx = 0.0;
        v59.ty = 0.0;
        break;
    }
    CGAffineTransformInvert(&v60, &v59);
    v44 = *(float **)a3;
    v45 = (float *)*((_QWORD *)a3 + 1);
    if (*(float **)a3 != v45)
    {
      a = v60.a;
      b = v60.b;
      c = v60.c;
      d = v60.d;
      tx = v60.tx;
      ty = v60.ty;
      do
      {
        v52 = 1.0 / (double)v36 * *v44;
        v53 = 1.0 / (double)v37 * v44[1];
        v54 = tx + v53 * c + a * v52;
        v55 = ty + v53 * d + b * v52;
        *(float *)&v53 = (v29 * v54 - (v21 - v34)) / v32;
        *(float *)&v55 = (v30 * v55 - (v33 - v58 * (double)v13)) / v31;
        *v44 = *(float *)&v53;
        v44[1] = *(float *)&v55;
        v44 += 2;
      }
      while (v44 != v45);
    }
  }

  return v35;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  __CVBuffer *v27;
  BOOL v28;
  unsigned int v30;
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v12, a8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    +[VNValidationUtilities requiredFaceObservationInOptions:error:](VNValidationUtilities, "requiredFaceObservationInOptions:error:", v12, a8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
      goto LABEL_5;
    v15 = objc_msgSend(v13, "width");
    v16 = objc_msgSend(v13, "height");
    -[VNFaceLandmarkDetector normalizedFaceBBoxForLandmarks:](self, "normalizedFaceBBoxForLandmarks:", v14);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v30 = -1;
    if ((objc_msgSend(v14, "getFaceEXIFOrientation:error:", &v30, a8) & 1) != 0)
    {
      v31[0] = CFSTR("VNImageBufferOption_FeatureOrientationRelativeToUpRight");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v30);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v31[1] = CFSTR("VNImageBufferOption_CreateFromPixelBufferPool");
      v32[0] = v25;
      v32[1] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = (__CVBuffer *)objc_msgSend(v13, "croppedBufferWithWidth:height:format:cropRect:options:error:", -[VNEspressoModelFileBasedDetector networkRequiredInputImageWidth](self, "networkRequiredInputImageWidth"), -[VNEspressoModelFileBasedDetector networkRequiredInputImageHeight](self, "networkRequiredInputImageHeight"), 1111970369, v26, a8, v18 * (double)v15, v20 * (double)v16, v22 * (double)v15, v24 * (double)v16);
      *a7 = v27;
      v28 = v27 != 0;

    }
    else
    {
LABEL_5:
      v28 = 0;
    }

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v10;
  void *v11;
  size_t Width;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  char *v18;
  void *v19;
  _QWORD **v20;
  uint64_t v21;
  std::vector<std::string>::pointer begin;
  std::vector<std::string>::pointer end;
  uint64_t **v24;
  uint64_t **v25;
  char *v26;
  std::string *v27;
  __int128 v28;
  void **p_begin;
  _QWORD *v30;
  uint64_t *v31;
  float v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  LandmarkDetectorDNN *ptr;
  uint64_t v37;
  uint64_t v38;
  size_t v39;
  size_t v40;
  int CVPixelBufferImageType;
  uint64_t v44;
  void *v45;
  char *v46;
  void **v47;
  void *v48;
  void *v49;
  _QWORD *v51;
  _QWORD *exception;
  size_t Height;
  void *v54;
  void *v55;
  id v56;
  id *v57;
  __int128 v60;
  void *v61[2];
  int v62;
  char v63;
  __int128 __p;
  uint64_t v65;
  _QWORD v66[3];
  _QWORD v67[3];
  _QWORD v68[3];
  std::vector<std::string> v69;
  std::vector<std::string> *v70;
  _QWORD v71[3];

  v71[1] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v57 = a8;
  VNCloneFaceObservationFromOptions((uint64_t)v10, a8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v54 = v11;
    Width = CVPixelBufferGetWidth(a4);
    Height = CVPixelBufferGetHeight(a4);
    -[VNEspressoModelFileBasedDetector espressoResources](self, "espressoResources");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v10;
    v13 = objc_msgSend(v55, "network");
    v15 = v14;
    v16 = objc_msgSend(v55, "plan");
    v17 = objc_msgSend((id)objc_opt_class(), "landmarkDetectorDNNVersion");
    v18 = (char *)operator new(0x110uLL);
    *((_QWORD *)v18 + 1) = 0;
    *((_QWORD *)v18 + 2) = 0;
    *(_QWORD *)v18 = &off_1E453B610;
    vision::mod::LandmarkDetectorDNN_Options::LandmarkDetectorDNN_Options((uint64_t)v61, v17);
    v18[24] = 0;
    *((_QWORD *)v18 + 4) = v13;
    *((_QWORD *)v18 + 5) = v15;
    *((_QWORD *)v18 + 6) = 0;
    *((_QWORD *)v18 + 7) = v16;
    *((_OWORD *)v18 + 4) = *(_OWORD *)v61;
    *((_DWORD *)v18 + 20) = v62;
    if (SHIBYTE(v65) < 0)
    {
      std::string::__init_copy_ctor_external((std::string *)(v18 + 88), (const std::string::value_type *)__p, *((std::string::size_type *)&__p + 1));
    }
    else
    {
      *(_OWORD *)(v18 + 88) = __p;
      *((_QWORD *)v18 + 13) = v65;
    }
    std::map<vision::mod::_constellationType,std::pair<std::string,BOOL>>::map[abi:ne180100]((uint64_t)(v18 + 112), v66);
    std::map<vision::mod::_constellationType,std::pair<std::string,BOOL>>::map[abi:ne180100]((uint64_t)(v18 + 136), v67);
    std::map<vision::mod::_constellationType,std::pair<std::string,BOOL>>::map[abi:ne180100]((uint64_t)(v18 + 160), v68);
    *((_OWORD *)v18 + 14) = 0u;
    *((_QWORD *)v18 + 24) = 0;
    *((_QWORD *)v18 + 23) = v18 + 192;
    v20 = (_QWORD **)(v18 + 184);
    *((_QWORD *)v18 + 25) = 0;
    *((_OWORD *)v18 + 15) = 0u;
    *(_OWORD *)(v18 + 249) = 0u;
    LOWORD(v69.__begin_) = 2;
    BYTE2(v69.__begin_) = 0;
    *(std::vector<std::string>::pointer *)((char *)&v69.__begin_ + 4) = (std::vector<std::string>::pointer)0x437F000000000000;
    HIDWORD(v69.__end_) = 32;
    LOBYTE(v69.__end_cap_.__value_) = 0;
    v21 = operator new();
    vision::mod::ImageProcessing_Preprocessor::ImageProcessing_Preprocessor(v21, (uint64_t)&v69);
    std::unique_ptr<vision::mod::ImageProcessing_Preprocessor>::reset[abi:ne180100]((uint64_t *)v18 + 32, v21);
    if (espresso_network_query_blob_dimensions())
    {
      espresso_plan_get_error_info();
      exception = __cxa_allocate_exception(8uLL);
      *exception = 2907;
      __cxa_throw(exception, MEMORY[0x1E0DE4F28], 0);
    }
    vision::mod::LandmarkDetectorDNN_Options::getBlobNamesOutput(&v69, (uint64_t **)v18 + 8);
    begin = v69.__begin_;
    end = v69.__end_;
    while (begin != end)
    {
      v24 = (uint64_t **)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__find_equal<std::string>((uint64_t)(v18 + 184), &v70, begin);
      if (!*v24)
      {
        v25 = v24;
        v26 = (char *)operator new(0xE0uLL);
        v27 = (std::string *)(v26 + 32);
        if (SHIBYTE(begin->__r_.__value_.__r.__words[2]) < 0)
        {
          std::string::__init_copy_ctor_external(v27, begin->__r_.__value_.__l.__data_, begin->__r_.__value_.__l.__size_);
        }
        else
        {
          v28 = *(_OWORD *)&begin->__r_.__value_.__l.__data_;
          *((_QWORD *)v26 + 6) = *((_QWORD *)&begin->__r_.__value_.__l + 2);
          *(_OWORD *)&v27->__r_.__value_.__l.__data_ = v28;
        }
        *((_QWORD *)v26 + 27) = 0;
        *(_OWORD *)(v26 + 200) = 0u;
        *(_OWORD *)(v26 + 184) = 0u;
        *(_OWORD *)(v26 + 168) = 0u;
        *(_OWORD *)(v26 + 152) = 0u;
        *(_OWORD *)(v26 + 136) = 0u;
        *(_OWORD *)(v26 + 120) = 0u;
        *(_OWORD *)(v26 + 104) = 0u;
        *(_OWORD *)(v26 + 88) = 0u;
        *(_OWORD *)(v26 + 72) = 0u;
        *(_OWORD *)(v26 + 56) = 0u;
        p_begin = (void **)&v70->__begin_;
        *(_QWORD *)v26 = 0;
        *((_QWORD *)v26 + 1) = 0;
        *((_QWORD *)v26 + 2) = p_begin;
        *v25 = (uint64_t *)v26;
        v30 = (_QWORD *)**v20;
        v31 = (uint64_t *)v26;
        if (v30)
        {
          *v20 = v30;
          v31 = *v25;
        }
        std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*((uint64_t **)v18 + 24), v31);
        ++*((_QWORD *)v18 + 25);
      }
      if (espresso_network_bind_buffer())
      {
        espresso_plan_get_error_info();
        v51 = __cxa_allocate_exception(8uLL);
        *v51 = 2907;
        __cxa_throw(v51, MEMORY[0x1E0DE4F28], 0);
      }
      ++begin;
    }
    v70 = &v69;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v70);
    std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::destroy((char *)v68[1]);
    std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::destroy((char *)v67[1]);
    std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::destroy((char *)v66[1]);
    if (SHIBYTE(v65) < 0)
      operator delete((void *)__p);
    v32 = (float)Width;
    *(_QWORD *)&v60 = v18 + 24;
    *((_QWORD *)&v60 + 1) = v18;
    std::shared_ptr<vision::mod::ImageAnalyzer>::operator=[abi:ne180100]((uint64_t)&self->_landmarkDetector, &v60);
    v33 = (std::__shared_weak_count *)*((_QWORD *)&v60 + 1);
    v10 = v56;
    v11 = v54;
    if (*((_QWORD *)&v60 + 1))
    {
      v34 = (unint64_t *)(*((_QWORD *)&v60 + 1) + 8);
      do
        v35 = __ldaxr(v34);
      while (__stlxr(v35 - 1, v34));
      if (!v35)
      {
        ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
        std::__shared_weak_count::__release_weak(v33);
      }
    }
    ptr = self->_landmarkDetector.__ptr_;
    *(_BYTE *)ptr = 0;
    *((_QWORD *)ptr + 23) = 0;
    *((float *)ptr + 48) = (float)Height;
    *((float *)ptr + 49) = v32;
    v37 = *((_QWORD *)ptr + 25);
    v38 = *((_QWORD *)ptr + 26);
    v39 = CVPixelBufferGetWidth(a4);
    v40 = CVPixelBufferGetHeight(a4);
    CVPixelBufferImageType = ImageProcessing_getCVPixelBufferImageType(a4);
    if (v39 == v37 && v40 == v38 && CVPixelBufferImageType == 4)
    {
      if (!espresso_network_bind_input_cvpixelbuffer() && !espresso_plan_execute_sync())
      {
        *(_BYTE *)ptr = 1;
        if (-[VNFaceLandmarkDetectorDNN getLandmarkPoints:forRequestConstellation:error:](self, "getLandmarkPoints:forRequestConstellation:error:", &self->_landmarkPoints65, 1, v57))
        {
          v61[0] = 0;
          LODWORD(v69.__begin_) = 0;
          if (-[VNFaceLandmarkDetectorDNN requestConstellation:cvmlConstellation:fromOptions:error:](self, "requestConstellation:cvmlConstellation:fromOptions:error:", v61, &v69, v56, v57))
          {
            objc_msgSend(v54, "setLandmarksConstellation:", v61[0]);
            v71[0] = v54;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_44;
          }
        }
LABEL_43:
        v19 = 0;
LABEL_44:

        goto LABEL_45;
      }
      espresso_plan_get_error_info();
      v44 = 2907;
    }
    else
    {
      v44 = 2940;
    }
    if (v57)
    {
      v45 = (void *)MEMORY[0x1E0CB3940];
      espresso_plan_get_error_info();
      std::string::basic_string[abi:ne180100]<0>(v61, v46);
      if (v63 >= 0)
        v47 = v61;
      else
        v47 = (void **)v61[0];
      objc_msgSend(v45, "stringWithFormat:", CFSTR("Could not run Landmark Detector. Error = %s"), v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (v63 < 0)
        operator delete(v61[0]);
      VNErrorForCVMLStatus((id)v44);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError errorForInternalErrorWithLocalizedDescription:underlyingError:](VNError, "errorForInternalErrorWithLocalizedDescription:underlyingError:", v48, v49);
      *v57 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_43;
  }
  v19 = 0;
LABEL_45:

  return v19;
}

- (void)releaseResources
{
  std::__shared_weak_count *v3;
  unint64_t *v4;
  unint64_t v5;
  __int128 v6;

  v6 = 0uLL;
  std::shared_ptr<vision::mod::ImageAnalyzer>::operator=[abi:ne180100]((uint64_t)&self->_landmarkDetector, &v6);
  v3 = (std::__shared_weak_count *)*((_QWORD *)&v6 + 1);
  if (*((_QWORD *)&v6 + 1))
  {
    v4 = (unint64_t *)(*((_QWORD *)&v6 + 1) + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  self->_landmarkPoints65.__end_ = self->_landmarkPoints65.__begin_;
}

- (void).cxx_destruct
{
  vector<_Geometry2D_point2D_, std::allocator<_Geometry2D_point2D_>> *p_landmarkPoints65;
  _Geometry2D_point2D_ *begin;
  __shared_weak_count *cntrl;
  unint64_t *v6;
  unint64_t v7;

  p_landmarkPoints65 = &self->_landmarkPoints65;
  begin = self->_landmarkPoints65.__begin_;
  if (begin)
  {
    p_landmarkPoints65->__end_ = begin;
    operator delete(begin);
  }
  cntrl = self->_landmarkDetector.__cntrl_;
  if (cntrl)
  {
    v6 = (unint64_t *)((char *)cntrl + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 17) = 0;
  *((_QWORD *)self + 18) = 0;
  *((_QWORD *)self + 16) = 0;
  return self;
}

@end
