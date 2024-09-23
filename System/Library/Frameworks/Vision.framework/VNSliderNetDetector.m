@implementation VNSliderNetDetector

- (BOOL)configureImageAnalyzerOptions:(void *)a3 error:(id *)a4
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  const char *v11;
  std::string::size_type v12;
  unint64_t v13;
  __int128 v14;
  std::vector<std::string>::pointer v15;
  BOOL v17;
  std::string v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)VNSliderNetDetector;
  if (!-[VNImageAnalyzerBasedDetector configureImageAnalyzerOptions:error:](&v23, sel_configureImageAnalyzerOptions_error_, a3, a4))return 0;
  objc_msgSend((id)objc_opt_class(), "supportedAdjustmentKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v5 != 0;
  if (v5)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)a3 + 42);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          std::string::basic_string[abi:ne180100]<0>(&v18, "AEEnhancerNet/");
          v11 = (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
          v12 = strlen(v11);
          std::string::append(&v18, v11, v12);
          std::string::append(&v18, "/final_output:0", 0xFuLL);
          v13 = *((_QWORD *)a3 + 43);
          if (v13 >= *((_QWORD *)a3 + 44))
          {
            v15 = std::vector<std::string>::__push_back_slow_path<std::string const&>((std::vector<std::string> *)a3 + 14, (__int128 *)&v18);
          }
          else
          {
            if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
            {
              std::string::__init_copy_ctor_external(*((std::string **)a3 + 43), v18.__r_.__value_.__l.__data_, v18.__r_.__value_.__l.__size_);
            }
            else
            {
              v14 = *(_OWORD *)&v18.__r_.__value_.__l.__data_;
              *(_QWORD *)(v13 + 16) = *((_QWORD *)&v18.__r_.__value_.__l + 2);
              *(_OWORD *)v13 = v14;
            }
            v15 = (std::vector<std::string>::pointer)(v13 + 24);
            *((_QWORD *)a3 + 43) = v13 + 24;
          }
          *((_QWORD *)a3 + 43) = v15;
          if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v18.__r_.__value_.__l.__data_);
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v7);
    }

  }
  return v17;
}

- (unsigned)analysisTypesForProcessOptions:(id)a3
{
  return 256;
}

- (id)observationsForLastAnalysisOfImageAnalyzer:(void *)a3 processOptions:(id)a4 originatingRequestSpecifier:(id)a5 qosClass:(unsigned int)a6 error:(id *)a7
{
  uint64_t SlidersAdjustments;
  id v10;
  void *v11;
  uint64_t *i;
  id v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  _DWORD *v19;
  _DWORD *v20;
  void *v21;
  VN1vLyVSh30UQ26TGBoV8MHv *v22;
  void *v23;
  void *context;
  id v26;
  id v27;
  _BYTE v28[16];
  uint64_t *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v26 = a4;
  v27 = a5;
  SlidersAdjustments = vision::mod::ImageAnalyzer::getSlidersAdjustments((vision::mod::ImageAnalyzer *)v28, a3);
  context = (void *)MEMORY[0x1A1B0B060](SlidersAdjustments);
  v10 = objc_alloc(MEMORY[0x1E0C99E08]);
  v11 = (void *)objc_msgSend(v10, "initWithCapacity:", v30);
  for (i = v29; i; i = (uint64_t *)*i)
  {
    v13 = objc_alloc(MEMORY[0x1E0CB3940]);
    v14 = i + 2;
    if (*((char *)i + 39) < 0)
      v14 = (_QWORD *)*v14;
    v15 = (void *)objc_msgSend(v13, "initWithUTF8String:", v14, context, v26);
    objc_msgSend(v15, "substringWithRange:", 14, objc_msgSend(v15, "length") - 29);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", (i[6] - i[5]) >> 2);
    v19 = (_DWORD *)i[5];
    v20 = (_DWORD *)i[6];
    while (v19 != v20)
    {
      LODWORD(v18) = *v19;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v21);

      ++v19;
    }
    objc_msgSend(v11, "setObject:forKey:", v17, v16);

  }
  v22 = -[VN1vLyVSh30UQ26TGBoV8MHv initWithOriginatingRequestSpecifier:adjustments:]([VN1vLyVSh30UQ26TGBoV8MHv alloc], "initWithOriginatingRequestSpecifier:adjustments:", v27, v11);
  v31[0] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(context);
  std::__hash_table<std::__hash_value_type<std::string,std::vector<float>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<float>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<float>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<float>>>>::~__hash_table((uint64_t)v28);

  return v23;
}

+ (id)supportedAdjustmentKeys
{
  return &unk_1E459E1B0;
}

+ (id)modelPathForConfiguration:(id)a3 error:(id *)a4
{
  +[VNEspressoHelpers pathForEspressoNetworkModelFileWithName:error:](VNEspressoHelpers, "pathForEspressoNetworkModelFileWithName:error:", CFSTR("sliderflow-s6xrskinrc_29001.espresso"), a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)inputImageBlobNameForConfiguration:(id)a3
{
  return CFSTR("image:0");
}

+ (unsigned)analysisPixelFormatTypeForConfiguration:(id)a3
{
  return 1111970369;
}

@end
