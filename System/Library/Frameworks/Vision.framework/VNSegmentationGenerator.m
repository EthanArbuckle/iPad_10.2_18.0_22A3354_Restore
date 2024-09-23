@implementation VNSegmentationGenerator

+ (id)supportedOutputPixelFormatsForOptions:(id)a3 error:(id *)a4
{
  if (+[VNSegmentationGenerator supportedOutputPixelFormatsForOptions:error:]::onceToken != -1)
    dispatch_once(&+[VNSegmentationGenerator supportedOutputPixelFormatsForOptions:error:]::onceToken, &__block_literal_global_9384);
  return (id)+[VNSegmentationGenerator supportedOutputPixelFormatsForOptions:error:]::outputPixelFormats;
}

+ (id)requestInfoForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "requestKeyToRequestInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[VNMultiDetectorOriginalRequestInfo requestKeyFromRequest:](VNMultiDetectorOriginalRequestInfo, "requestKeyFromRequest:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (NSDictionary)requestKeyToRequestInfo
{
  if (+[VNSegmentationGenerator requestKeyToRequestInfo]::onceToken != -1)
    dispatch_once(&+[VNSegmentationGenerator requestKeyToRequestInfo]::onceToken, &__block_literal_global_49);
  return (NSDictionary *)(id)+[VNSegmentationGenerator requestKeyToRequestInfo]::requestKeyToRequestInfo;
}

+ (Class)detectorClassForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  char v15;
  uint64_t v16;

  v5 = a3;
  +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    goto LABEL_33;
  v8 = objc_msgSend(v6, "requestRevision");
  if (objc_msgSend(v7, "specifiesRequestClass:", objc_opt_class()))
  {
    if ((unint64_t)(v8 - 1) < 3)
    {
      v9 = (void *)objc_opt_class();
LABEL_55:
      v12 = v9;
      goto LABEL_56;
    }
    if (a4)
    {
      +[VNError errorForUnsupportedRevision:ofRequestClass:](VNError, "errorForUnsupportedRevision:ofRequestClass:", v8, objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
      v11 = v10;
      v9 = 0;
      *a4 = v11;
      goto LABEL_55;
    }
LABEL_54:
    v9 = 0;
    goto LABEL_55;
  }
  if (objc_msgSend(v7, "specifiesRequestClass:", objc_opt_class()))
  {
    v16 = -1;
    if (!+[VNValidationUtilities getNSUIntegerValue:forKey:inOptions:error:](VNValidationUtilities, "getNSUIntegerValue:forKey:inOptions:error:", &v16, CFSTR("VNSegmentationGeneratorProcessOption_QualityLevel"), v5, a4))goto LABEL_33;
    if (v16 == 2)
      goto LABEL_60;
    if (v16 != 1)
    {
      if (!v16)
      {
        v15 = 0;
        if (+[VNValidationUtilities getBOOLValue:forKey:inOptions:error:](VNValidationUtilities, "getBOOLValue:forKey:inOptions:error:", &v15, CFSTR("VNSegmentationGeneratorProcessOption_UseTiling"), v5, a4))
        {
          v9 = (void *)objc_opt_class();
          goto LABEL_55;
        }
        goto LABEL_33;
      }
      if (!a4)
        goto LABEL_54;
LABEL_53:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError errorForInvalidOption:named:](VNError, "errorForInvalidOption:named:", v13, CFSTR("qualityLevel"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_54;
    }
    if (v8 == 1 || v8 == 3737841665 || v8 == 3737841664)
      goto LABEL_60;
    if (!a4)
      goto LABEL_54;
    goto LABEL_62;
  }
  if (objc_msgSend(v7, "specifiesRequestClass:", objc_opt_class()))
  {
    v16 = -1;
    if (!+[VNValidationUtilities getNSUIntegerValue:forKey:inOptions:error:](VNValidationUtilities, "getNSUIntegerValue:forKey:inOptions:error:", &v16, CFSTR("VNSegmentationGeneratorProcessOption_QualityLevel"), v5, a4))goto LABEL_33;
    if (v16 != 1)
    {
      if (!a4)
        goto LABEL_54;
      goto LABEL_53;
    }
    if (v8 == 1 || v8 == 3737841664)
    {
LABEL_60:
      v9 = (void *)objc_opt_class();
      goto LABEL_55;
    }
    if (!a4)
      goto LABEL_54;
LABEL_62:
    +[VNError errorForUnsupportedRevision:ofRequestClass:](VNError, "errorForUnsupportedRevision:ofRequestClass:", v8, objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (objc_msgSend(v7, "specifiesRequestClass:", objc_opt_class()))
  {
    v16 = -1;
    if (!+[VNValidationUtilities getNSUIntegerValue:forKey:inOptions:error:](VNValidationUtilities, "getNSUIntegerValue:forKey:inOptions:error:", &v16, CFSTR("VNSegmentationGeneratorProcessOption_QualityLevel"), v5, a4))goto LABEL_33;
    if (v16 != 1)
    {
      if (!a4)
        goto LABEL_54;
      goto LABEL_53;
    }
    if (v8 == 1 || v8 == 3737841664)
      goto LABEL_60;
    if (!a4)
      goto LABEL_54;
    goto LABEL_62;
  }
  if (!objc_msgSend(v7, "specifiesRequestClass:", objc_opt_class()))
    goto LABEL_54;
  v16 = -1;
  if (+[VNValidationUtilities getNSUIntegerValue:forKey:inOptions:error:](VNValidationUtilities, "getNSUIntegerValue:forKey:inOptions:error:", &v16, CFSTR("VNSegmentationGeneratorProcessOption_QualityLevel"), v5, a4))
  {
    if (v16 != 1)
    {
      if (!a4)
        goto LABEL_54;
      goto LABEL_53;
    }
    if (v8 == 1 || v8 == 3737841664)
      goto LABEL_60;
    if (!a4)
      goto LABEL_54;
    goto LABEL_62;
  }
LABEL_33:
  v12 = 0;
LABEL_56:

  return (Class)v12;
}

+ (id)configurationOptionKeysForDetectorKey
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__VNSegmentationGenerator_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNSegmentationGenerator configurationOptionKeysForDetectorKey]::onceToken != -1)
    dispatch_once(&+[VNSegmentationGenerator configurationOptionKeysForDetectorKey]::onceToken, block);
  return (id)+[VNSegmentationGenerator configurationOptionKeysForDetectorKey]::configurationOptionKeys;
}

+ (NSDictionary)outputMaskBlobNameToFeatureName
{
  return 0;
}

+ (NSArray)outputConfidenceBlobNames
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

+ (BOOL)supportsTiling
{
  return 0;
}

void __64__VNSegmentationGenerator_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNSegmentationGenerator;
  objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "addObject:", CFSTR("VNEspressoModelFileBasedDetectorOption_NetworkConfiguration"));
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)+[VNSegmentationGenerator configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNSegmentationGenerator configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;

}

void __50__VNSegmentationGenerator_requestKeyToRequestInfo__block_invoke()
{
  objc_class *v0;
  void *v1;
  VNMultiDetectorOriginalRequestInfo *v2;
  objc_class *v3;
  void *v4;
  VNMultiDetectorOriginalRequestInfo *v5;
  objc_class *v6;
  void *v7;
  VNMultiDetectorOriginalRequestInfo *v8;
  objc_class *v9;
  void *v10;
  VNMultiDetectorOriginalRequestInfo *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v1;
  v2 = -[VNMultiDetectorOriginalRequestInfo initWithOriginatingRequestSpecifierProcessingOptionKey:originalRequestResultsIndex:]([VNMultiDetectorOriginalRequestInfo alloc], "initWithOriginatingRequestSpecifierProcessingOptionKey:originalRequestResultsIndex:", CFSTR("VNSegmentationGeneratorProcessOption_PersonSegmentationDetectorOriginatingRequestSpecifier"), 0);
  v15[0] = v2;
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v4;
  v5 = -[VNMultiDetectorOriginalRequestInfo initWithOriginatingRequestSpecifierProcessingOptionKey:originalRequestResultsIndex:]([VNMultiDetectorOriginalRequestInfo alloc], "initWithOriginatingRequestSpecifierProcessingOptionKey:originalRequestResultsIndex:", CFSTR("VNSegmentationGeneratorProcessOption_SkySegmentationDetectorOriginatingRequestSpecifier"), 1);
  v15[1] = v5;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v7;
  v8 = -[VNMultiDetectorOriginalRequestInfo initWithOriginatingRequestSpecifierProcessingOptionKey:originalRequestResultsIndex:]([VNMultiDetectorOriginalRequestInfo alloc], "initWithOriginatingRequestSpecifierProcessingOptionKey:originalRequestResultsIndex:", CFSTR("VNSegmentationGeneratorProcessOption_HumanAttributesSegmentationDetectorOriginatingRequestSpecifier"), 2);
  v15[2] = v8;
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v10;
  v11 = -[VNMultiDetectorOriginalRequestInfo initWithOriginatingRequestSpecifierProcessingOptionKey:originalRequestResultsIndex:]([VNMultiDetectorOriginalRequestInfo alloc], "initWithOriginatingRequestSpecifierProcessingOptionKey:originalRequestResultsIndex:", CFSTR("VNSegmentationGeneratorProcessOption_GlassesSegmentationDetectorOriginatingRequestSpecifier"), 3);
  v15[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)+[VNSegmentationGenerator requestKeyToRequestInfo]::requestKeyToRequestInfo;
  +[VNSegmentationGenerator requestKeyToRequestInfo]::requestKeyToRequestInfo = v12;

}

void __71__VNSegmentationGenerator_supportedOutputPixelFormatsForOptions_error___block_invoke()
{
  void *v0;

  v0 = (void *)+[VNSegmentationGenerator supportedOutputPixelFormatsForOptions:error:]::outputPixelFormats;
  +[VNSegmentationGenerator supportedOutputPixelFormatsForOptions:error:]::outputPixelFormats = (uint64_t)&unk_1E459E000;

}

- (const)espressoInputImageSize
{
  return &self->_espressoInputImageSize;
}

- (const)espressoInputMaskSize
{
  return &self->_espressoInputMaskSize;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  uint64_t v4;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unordered_map<NSString *, apple::vision::BufferSize, std::hash<NSString *>, std::equal_to<NSString *>, std::allocator<std::pair<NSString *const, apple::vision::BufferSize>>> *p_espressoMaskOutputBufferSizes;
  unint64_t value;
  uint8x8_t v22;
  _QWORD *v23;
  _QWORD *j;
  unint64_t v25;
  _QWORD *v26;
  float v27;
  float v28;
  _BOOL8 v29;
  unint64_t v30;
  unint64_t v31;
  int8x8_t prime;
  void **v33;
  void **v34;
  uint64_t v35;
  _QWORD *next;
  unint64_t v37;
  uint8x8_t v38;
  unint64_t v39;
  uint8x8_t v40;
  uint64_t v41;
  _QWORD *v42;
  unint64_t v43;
  void **v44;
  void **v45;
  unint64_t v46;
  void **v47;
  uint64_t v48;
  BOOL v49;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<NSString *, apple::vision::BufferSize>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<NSString *, apple::vision::BufferSize>, void *>>> *p_p1;
  uint64_t v56;
  void *v57;
  id obj;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint64_t v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _QWORD aBlock[5];
  objc_super v84;
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void *)objc_opt_class();
  v84.receiver = self;
  v84.super_class = (Class)VNSegmentationGenerator;
  if (-[VNEspressoModelFileBasedDetector completeInitializationForSession:error:](&v84, sel_completeInitializationForSession_error_, v7, a4))
  {
    objc_msgSend(v8, "inputImageBlobName");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "inputMaskBlobName");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "outputMaskBlobNames");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__VNSegmentationGenerator_completeInitializationForSession_error___block_invoke;
    aBlock[3] = &unk_1E4544BF0;
    aBlock[4] = self;
    v59 = _Block_copy(aBlock);
    v9 = v59;
    if (((*((uint64_t (**)(void *, void *, BufferSize *, id *))v59 + 2))(v59, v61, &self->_espressoInputImageSize, a4) & 1) == 0|| !(*((unsigned int (**)(void *, void *, BufferSize *, id *))v59 + 2))(v59, v60, &self->_espressoInputMaskSize, a4)|| v60&& !-[VNEspressoModelFileBasedDetector getWidth:height:ofEspressoModelNetworkBlobNamed:error:](self, "getWidth:height:ofEspressoModelNetworkBlobNamed:error:", &self->_espressoMaskInputBufferSize, &self->_espressoMaskInputBufferSize.height, v60, a4))
    {
      goto LABEL_107;
    }
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    obj = v57;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v86, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v80;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v80 != v11)
            objc_enumerationMutation(obj);
          v67 = *(id *)(*((_QWORD *)&v79 + 1) + 8 * i);
          v68 = 0u;
          v69 = 0u;
          v70 = 0u;
          v71 = 0u;
          v72 = 0u;
          v73 = 0u;
          v74 = 0u;
          v75 = 0u;
          v76 = 0u;
          v77 = 0u;
          v78 = 0;
          v4 = (uint64_t)std::__hash_table<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>>>::__emplace_unique_key_args<NSString * {__strong},std::pair<NSString * {__strong},espresso_buffer_t>>((uint64_t)&self->_espressoMaskOutputBuffers, &v67, (uint64_t *)&v67);

          if (!-[VNEspressoModelFileBasedDetector bindBuffer:toNetworkOutputBlobName:error:](self, "bindBuffer:toNetworkOutputBlobName:error:", v4 + 24, *(_QWORD *)(v4 + 16), a4))goto LABEL_110;
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v86, 16);
      }
      while (v10);
    }

    v9 = v59;
    if (-[VNSegmentationGenerator bindOutputConfidenceBuffersAndReturnError:](self, "bindOutputConfidenceBuffersAndReturnError:", a4))
    {
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v51 = obj;
      v13 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v63, v85, 16);
      if (v13)
      {
        v54 = *(_QWORD *)v64;
        v52 = v7;
LABEL_17:
        v14 = 0;
        v53 = v13;
        while (1)
        {
          if (*(_QWORD *)v64 != v54)
            objc_enumerationMutation(v51);
          v15 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v14);
          v67 = 0;
          v62 = 0;
          if (!-[VNEspressoModelFileBasedDetector getWidth:height:ofEspressoModelNetworkBlobNamed:error:](self, "getWidth:height:ofEspressoModelNetworkBlobNamed:error:", &v67, &v62, v15, a4))
          {
LABEL_110:
            v49 = 0;
            goto LABEL_111;
          }
          v56 = v14;
          v16 = v67;
          v17 = v62;
          v18 = objc_msgSend(v15, "hash");
          v19 = v18;
          p_espressoMaskOutputBufferSizes = &self->_espressoMaskOutputBufferSizes;
          value = self->_espressoMaskOutputBufferSizes.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
          if (value)
          {
            v22 = (uint8x8_t)vcnt_s8((int8x8_t)value);
            v22.i16[0] = vaddlv_u8(v22);
            if (v22.u32[0] > 1uLL)
            {
              v4 = v18;
              if (v18 >= value)
                v4 = v18 % value;
            }
            else
            {
              v4 = (value - 1) & v18;
            }
            v23 = p_espressoMaskOutputBufferSizes->__table_.__bucket_list_.__ptr_.__value_[v4];
            if (v23)
            {
              for (j = (_QWORD *)*v23; j; j = (_QWORD *)*j)
              {
                v25 = j[1];
                if (v25 == v18)
                {
                  if ((void *)j[2] == v15)
                    goto LABEL_93;
                }
                else
                {
                  if (v22.u32[0] > 1uLL)
                  {
                    if (v25 >= value)
                      v25 %= value;
                  }
                  else
                  {
                    v25 &= value - 1;
                  }
                  if (v25 != v4)
                    break;
                }
              }
            }
          }
          v26 = operator new(0x28uLL);
          p_p1 = &self->_espressoMaskOutputBufferSizes.__table_.__p1_;
          *v26 = 0;
          v26[1] = v19;
          v26[2] = v15;
          v26[3] = v16;
          v26[4] = v17;
          v27 = (float)(self->_espressoMaskOutputBufferSizes.__table_.__p2_.__value_ + 1);
          v28 = self->_espressoMaskOutputBufferSizes.__table_.__p3_.__value_;
          if (!value || (float)(v28 * (float)value) < v27)
            break;
LABEL_83:
          v44 = p_espressoMaskOutputBufferSizes->__table_.__bucket_list_.__ptr_.__value_;
          v45 = (void **)p_espressoMaskOutputBufferSizes->__table_.__bucket_list_.__ptr_.__value_[v4];
          if (v45)
          {
            *v26 = *v45;
          }
          else
          {
            *v26 = p_p1->__value_.__next_;
            p_p1->__value_.__next_ = v26;
            v44[v4] = p_p1;
            if (!*v26)
              goto LABEL_92;
            v46 = *(_QWORD *)(*v26 + 8);
            if ((value & (value - 1)) != 0)
            {
              if (v46 >= value)
                v46 %= value;
            }
            else
            {
              v46 &= value - 1;
            }
            v45 = &p_espressoMaskOutputBufferSizes->__table_.__bucket_list_.__ptr_.__value_[v46];
          }
          *v45 = v26;
LABEL_92:
          ++self->_espressoMaskOutputBufferSizes.__table_.__p2_.__value_;
LABEL_93:
          v14 = v56 + 1;
          v7 = v52;
          if (v56 + 1 == v53)
          {
            v48 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v63, v85, 16);
            v13 = v48;
            v49 = 1;
            if (!v48)
              goto LABEL_111;
            goto LABEL_17;
          }
        }
        v29 = (value & (value - 1)) != 0;
        if (value < 3)
          v29 = 1;
        v30 = v29 | (2 * value);
        v31 = vcvtps_u32_f32(v27 / v28);
        if (v30 <= v31)
          prime = (int8x8_t)v31;
        else
          prime = (int8x8_t)v30;
        if (*(_QWORD *)&prime == 1)
        {
          prime = (int8x8_t)2;
        }
        else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
        {
          prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
        }
        value = self->_espressoMaskOutputBufferSizes.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
        if (*(_QWORD *)&prime > value)
          goto LABEL_49;
        if (*(_QWORD *)&prime < value)
        {
          v39 = vcvtps_u32_f32((float)self->_espressoMaskOutputBufferSizes.__table_.__p2_.__value_/ self->_espressoMaskOutputBufferSizes.__table_.__p3_.__value_);
          if (value < 3 || (v40 = (uint8x8_t)vcnt_s8((int8x8_t)value), v40.i16[0] = vaddlv_u8(v40), v40.u32[0] > 1uLL))
          {
            v39 = std::__next_prime(v39);
          }
          else
          {
            v41 = 1 << -(char)__clz(v39 - 1);
            if (v39 >= 2)
              v39 = v41;
          }
          if (*(_QWORD *)&prime <= v39)
            prime = (int8x8_t)v39;
          if (*(_QWORD *)&prime >= value)
          {
            value = self->_espressoMaskOutputBufferSizes.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
          }
          else
          {
            if (prime)
            {
LABEL_49:
              if (*(_QWORD *)&prime >> 61)
                std::__throw_bad_array_new_length[abi:ne180100]();
              v33 = (void **)operator new(8 * *(_QWORD *)&prime);
              v34 = p_espressoMaskOutputBufferSizes->__table_.__bucket_list_.__ptr_.__value_;
              p_espressoMaskOutputBufferSizes->__table_.__bucket_list_.__ptr_.__value_ = v33;
              if (v34)
                operator delete(v34);
              v35 = 0;
              self->_espressoMaskOutputBufferSizes.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = (unint64_t)prime;
              do
                p_espressoMaskOutputBufferSizes->__table_.__bucket_list_.__ptr_.__value_[v35++] = 0;
              while (*(_QWORD *)&prime != v35);
              next = p_p1->__value_.__next_;
              if (p_p1->__value_.__next_)
              {
                v37 = next[1];
                v38 = (uint8x8_t)vcnt_s8(prime);
                v38.i16[0] = vaddlv_u8(v38);
                if (v38.u32[0] > 1uLL)
                {
                  if (v37 >= *(_QWORD *)&prime)
                    v37 %= *(_QWORD *)&prime;
                }
                else
                {
                  v37 &= *(_QWORD *)&prime - 1;
                }
                p_espressoMaskOutputBufferSizes->__table_.__bucket_list_.__ptr_.__value_[v37] = p_p1;
                v42 = (_QWORD *)*next;
                if (*next)
                {
                  do
                  {
                    v43 = v42[1];
                    if (v38.u32[0] > 1uLL)
                    {
                      if (v43 >= *(_QWORD *)&prime)
                        v43 %= *(_QWORD *)&prime;
                    }
                    else
                    {
                      v43 &= *(_QWORD *)&prime - 1;
                    }
                    if (v43 != v37)
                    {
                      if (!p_espressoMaskOutputBufferSizes->__table_.__bucket_list_.__ptr_.__value_[v43])
                      {
                        p_espressoMaskOutputBufferSizes->__table_.__bucket_list_.__ptr_.__value_[v43] = next;
                        goto LABEL_74;
                      }
                      *next = *v42;
                      *v42 = *(_QWORD *)p_espressoMaskOutputBufferSizes->__table_.__bucket_list_.__ptr_.__value_[v43];
                      *(_QWORD *)p_espressoMaskOutputBufferSizes->__table_.__bucket_list_.__ptr_.__value_[v43] = v42;
                      v42 = next;
                    }
                    v43 = v37;
LABEL_74:
                    next = v42;
                    v42 = (_QWORD *)*v42;
                    v37 = v43;
                  }
                  while (v42);
                }
              }
              value = (unint64_t)prime;
              goto LABEL_78;
            }
            v47 = p_espressoMaskOutputBufferSizes->__table_.__bucket_list_.__ptr_.__value_;
            p_espressoMaskOutputBufferSizes->__table_.__bucket_list_.__ptr_.__value_ = 0;
            if (v47)
              operator delete(v47);
            value = 0;
            self->_espressoMaskOutputBufferSizes.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0;
          }
        }
LABEL_78:
        if ((value & (value - 1)) != 0)
        {
          if (v19 >= value)
            v4 = v19 % value;
          else
            v4 = v19;
        }
        else
        {
          v4 = (value - 1) & v19;
        }
        goto LABEL_83;
      }
      v49 = 1;
LABEL_111:

      v9 = v59;
    }
    else
    {
LABEL_107:
      v49 = 0;
    }

  }
  else
  {
    v49 = 0;
  }

  return v49;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  double v29;
  double v30;
  BOOL v31;
  BOOL v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  BOOL v39;
  BOOL v40;
  uint64_t v41;
  __CVBuffer *v42;
  _QWORD v44[4];
  id v45;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = a4;
  v17 = (void *)objc_opt_class();
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v16, a8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (!v18)
    goto LABEL_28;
  v20 = objc_msgSend(v18, "width");
  v21 = objc_msgSend(v19, "height");
  v22 = x * (double)v20;
  v23 = width * (double)v20;
  v24 = y * (double)v21;
  v25 = height * (double)v21;
  *(double *)v44 = v22;
  *(double *)&v44[1] = v24;
  *(double *)&v44[2] = v23;
  *(double *)&v44[3] = v25;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v44, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v26, CFSTR("VNSegmentationGeneratorProcessOption_ImageROI"));

  v27 = -[VNSegmentationGenerator outputMaskSize](self, "outputMaskSize");
  v29 = (double)v27 / (double)v28;
  v30 = v23 / v25;
  v31 = v29 >= 1.0 || v30 < 1.0;
  if (!v31 || (v29 >= 1.0 ? (v32 = v30 < 1.0) : (v32 = 0), v32))
    v33 = objc_msgSend((id)objc_opt_class(), "rotateImageToMatchNetworkOrientation");
  else
    v33 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v34, CFSTR("VNSegmentationGeneratorProcessOption_ImageRotated"));

  v35 = v16;
  if (!self)
  {
LABEL_27:

LABEL_28:
    v40 = 0;
    goto LABEL_29;
  }
  v36 = (void *)objc_opt_class();
  objc_msgSend(v36, "inputMaskBlobName");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v37)
    goto LABEL_20;
  if (objc_msgSend(v36, "inputMaskRequired"))
  {
    +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", objc_opt_class(), CFSTR("VNSegmentationGeneratorProcessOption_MaskImageObservations"), v35, a8);
    v38 = (id)objc_claimAutoreleasedReturnValue();
    if (!v38)
      goto LABEL_27;
    goto LABEL_19;
  }
  v45 = 0;
  v39 = +[VNValidationUtilities getOptionalObject:ofClass:forKey:inOptions:error:](VNValidationUtilities, "getOptionalObject:ofClass:forKey:inOptions:error:", &v45, objc_opt_class(), CFSTR("VNSegmentationGeneratorProcessOption_MaskImageObservations"), v35, a8);
  v38 = v45;
  if (!v39)
  {

    goto LABEL_27;
  }
LABEL_19:

LABEL_20:
  if ((objc_msgSend(v17, "supportsTiling") & 1) != 0)
  {
    v40 = 1;
  }
  else
  {
    objc_msgSend(v35, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("VNImageBufferOption_CreateFromPixelBufferPool"));
    if ((_DWORD)v33)
      v41 = 258;
    else
      v41 = 2;
    v42 = (__CVBuffer *)objc_msgSend(v19, "cropAndScaleBufferWithWidth:height:cropRect:format:imageCropAndScaleOption:options:error:calculatedNormalizedOriginOffset:calculatedScaleX:calculatedScaleY:", self->_espressoInputImageSize.width, self->_espressoInputImageSize.height, 1111970369, v41, v35, a8, v22, v24, v23, v25, 0, 0, 0);
    *a7 = v42;
    v40 = v42 != 0;
  }
LABEL_29:

  return v40;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id obj;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  _QWORD v44[4];
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD aBlock[5];
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  uint64_t v61;
  const __CVBuffer *v62;
  unsigned int v63;
  char v64;
  _OWORD v65[5];
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v43 = a5;
  v13 = (void *)objc_opt_class();
  v14 = objc_msgSend(v13, "supportsTiling");
  objc_msgSend(v13, "inputMaskBlobName");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "outputMaskBlobNames");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", objc_opt_class(), CFSTR("VNSegmentationGeneratorProcessOption_KeepRawOutputMask"), v43, a8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = v43;
    +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", objc_opt_class(), CFSTR("VNSegmentationGeneratorProcessOption_OutputPixelFormat"), v43, a8);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v40)
    {
      v23 = 0;
LABEL_43:

      goto LABEL_44;
    }
    +[VNValidationUtilities requiredSessionInOptions:error:](VNValidationUtilities, "requiredSessionInOptions:error:", v43, a8);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v39)
    {
      v23 = 0;
LABEL_42:

      goto LABEL_43;
    }
    -[VNDetector computeDeviceForComputeStage:processingOptions:error:](self, "computeDeviceForComputeStage:processingOptions:error:", CFSTR("VNComputeStageMain"), v43, a8);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v38)
    {
      v23 = 0;
LABEL_41:

      goto LABEL_42;
    }
    objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("VNSegmentationGeneratorProcessOption_MaskImageObservations"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v36 && v42)
    {
      v71 = 0;
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      v66 = 0u;
      memset(v65, 0, sizeof(v65));
      if (!-[VNEspressoModelFileBasedDetector bindBuffer:toNetworkInputBlobName:error:](self, "bindBuffer:toNetworkInputBlobName:error:", v65, v42, a8))
      {
        v23 = 0;
LABEL_40:

        goto LABEL_41;
      }
      bzero(*(void **)&v65[0], 4 * v66 * *((_QWORD *)&v66 + 1));
    }
    +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v43, a8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      v23 = 0;
LABEL_39:

      goto LABEL_40;
    }
    v35 = v17;
    objc_msgSend(v13, "requestKeyToRequestInfo");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v34, "count");
    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v13, "outputMaskBlobNameToRequestKey");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "outputMaskBlobNameToFeatureName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __125__VNSegmentationGenerator_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke;
    aBlock[3] = &unk_1E4544C18;
    v61 = v18;
    v62 = a4;
    aBlock[4] = self;
    v51 = v43;
    v63 = a6;
    v52 = v41;
    v53 = v15;
    v54 = v40;
    v64 = v14;
    v55 = v38;
    v56 = v39;
    v32 = v20;
    v57 = v32;
    v29 = v35;
    v58 = v29;
    v31 = v33;
    v59 = v31;
    v30 = v34;
    v60 = v30;
    v21 = _Block_copy(aBlock);
    v22 = (void (**)(_QWORD, _QWORD, _QWORD))v21;
    if (v36)
    {
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v23 = v36;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v46, v72, 16);
      if (v24)
      {
        obj = v23;
        v25 = *(_QWORD *)v47;
        while (2)
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v47 != v25)
              objc_enumerationMutation(obj);
            ((void (**)(_QWORD, _QWORD, id *))v22)[2](v22, *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i), a8);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v27)
            {
              v23 = 0;
              goto LABEL_37;
            }
            if (objc_msgSend(v19, "count"))
            {
              v44[0] = MEMORY[0x1E0C809B0];
              v44[1] = 3221225472;
              v44[2] = __125__VNSegmentationGenerator_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke_2;
              v44[3] = &unk_1E45469C0;
              v45 = v27;
              objc_msgSend(v19, "enumerateObjectsUsingBlock:", v44);

            }
            else
            {
              objc_msgSend(v19, "addObjectsFromArray:", v27);
            }

          }
          v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v72, 16);
          if (v24)
            continue;
          break;
        }
        v23 = obj;
      }
    }
    else
    {
      (*((void (**)(void *, _QWORD, id *))v21 + 2))(v21, 0, a8);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      if (!v23)
      {
LABEL_38:

        v17 = v35;
        goto LABEL_39;
      }
      objc_msgSend(v19, "addObjectsFromArray:", v23);
    }

    if (objc_msgSend(v19, "count"))
    {
      if (objc_msgSend(v29, "specifiesRequestClass:", objc_opt_class()))
      {
        v23 = (id)objc_msgSend(v19, "copy");
      }
      else
      {
        objc_msgSend(v19, "firstObject");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v23 = (id)objc_msgSend(obj, "copy");
LABEL_37:

      }
    }
    else
    {
      v23 = (id)MEMORY[0x1E0C9AA60];
    }
    goto LABEL_38;
  }
  v23 = 0;
  v16 = v43;
LABEL_44:

  return v23;
}

- (BufferSize)outputMaskSize
{
  _QWORD *next;
  unint64_t v3;
  unint64_t v4;
  BufferSize result;

  next = self->_espressoMaskOutputBufferSizes.__table_.__p1_.__value_.__next_;
  v3 = next[3];
  v4 = next[4];
  result.height = v4;
  result.width = v3;
  return result;
}

- (optional<std::tuple<std::unordered_map<NSString)processLockedImageBuffer:(std:(espresso_buffer_t>>> *__return_ptr)retstr :(VNSegmentationGenerator *)self unordered_map<NSString *) inputMaskObservation:(SEL)a3 options:(__CVBuffer *)a4 qosClass:(id)a5 error:(id)a6
{
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  float *v18;
  unint64_t v19;
  uint64_t *i;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint8x8_t v24;
  _QWORD *v25;
  _QWORD *j;
  unint64_t v27;
  char *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  float v37;
  _BOOL8 v38;
  unint64_t v39;
  unint64_t v40;
  size_t v41;
  _QWORD *v42;
  _QWORD *v43;
  unint64_t v44;
  void *v45;
  void *v46;
  uint64_t **k;
  void *v48;
  void *v49;
  optional<std::tuple<std::unordered_map<NSString *, __CVBuffer *>, std::unordered_map<NSString *, espresso_buffer_t>>> *result;
  id v51;
  void *v52;
  id v53;
  id v54;
  uint64_t v55[5];
  void *__p[2];
  __int128 v57;
  float v58;
  _QWORD aBlock[5];
  id v60;
  id v61;
  id v62;
  uint64_t *v63;
  uint64_t *v64;
  __CVBuffer *v65;
  uint64_t v66;
  float *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  uint64_t (*v70)(uint64_t);
  __int128 v71;
  __int128 v72;
  uint64_t v73;
  int v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  uint64_t (*v79)(uint64_t);
  __int128 v80;
  __int128 v81;
  uint64_t v82;
  int v83;

  v13 = a5;
  v14 = a6;
  if (self)
  {
    -[VNDetector computeDeviceForComputeStage:processingOptions:error:](self, "computeDeviceForComputeStage:processingOptions:error:", CFSTR("VNComputeStageMain"), v14, a8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v75 = 0;
      v76 = &v75;
      v77 = 0x5812000000;
      v78 = __Block_byref_object_copy__9433;
      v79 = __Block_byref_object_dispose__9434;
      v80 = 0u;
      v81 = 0u;
      v82 = 0;
      v83 = 1065353216;
      v66 = 0;
      v67 = (float *)&v66;
      v68 = 0x5812000000;
      v69 = __Block_byref_object_copy__87;
      v70 = __Block_byref_object_dispose__88;
      v71 = 0u;
      v72 = 0u;
      v73 = 0;
      v74 = 1065353216;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __96__VNSegmentationGenerator__processNonTiledLockedImageBuffer_inputMaskObservation_options_error___block_invoke;
      aBlock[3] = &unk_1E4544C40;
      v65 = a4;
      aBlock[4] = self;
      v63 = &v66;
      v60 = v13;
      v61 = v14;
      v16 = v15;
      v62 = v16;
      v64 = &v75;
      v17 = _Block_copy(aBlock);
      if ((VNExecuteBlock(v17, (uint64_t)a8) & 1) != 0)
      {
        v18 = v67;
        v19 = (unint64_t)v55;
        v53 = v14;
        v54 = v13;
        v51 = v16;
        v52 = v17;
        std::unordered_map<NSString * {__strong},__CVBuffer *>::unordered_map((uint64_t)v55, (uint64_t)(v76 + 6));
        v57 = 0u;
        *(_OWORD *)__p = 0u;
        v58 = v18[20];
        std::__hash_table<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>>>::__rehash<true>((uint64_t)__p, *((_QWORD *)v18 + 7));
        for (i = (uint64_t *)*((_QWORD *)v18 + 8); i; i = (uint64_t *)*i)
        {
          v21 = objc_msgSend((id)i[2], "hash", v51);
          v22 = v21;
          v23 = (unint64_t)__p[1];
          if (__p[1])
          {
            v24 = (uint8x8_t)vcnt_s8((int8x8_t)__p[1]);
            v24.i16[0] = vaddlv_u8(v24);
            if (v24.u32[0] > 1uLL)
            {
              v19 = v21;
              if ((void *)v21 >= __p[1])
                v19 = v21 % (unint64_t)__p[1];
            }
            else
            {
              v19 = ((unint64_t)__p[1] - 1) & v21;
            }
            v25 = (_QWORD *)*((_QWORD *)__p[0] + v19);
            if (v25)
            {
              for (j = (_QWORD *)*v25; j; j = (_QWORD *)*j)
              {
                v27 = j[1];
                if (v27 == v21)
                {
                  if (j[2] == i[2])
                    goto LABEL_43;
                }
                else
                {
                  if (v24.u32[0] > 1uLL)
                  {
                    if ((void *)v27 >= __p[1])
                      v27 %= (unint64_t)__p[1];
                  }
                  else
                  {
                    v27 &= (unint64_t)__p[1] - 1;
                  }
                  if (v27 != v19)
                    break;
                }
              }
            }
          }
          v28 = (char *)operator new(0xC0uLL);
          *(_QWORD *)v28 = 0;
          *((_QWORD *)v28 + 1) = v22;
          *((_QWORD *)v28 + 2) = (id)i[2];
          v29 = *(_OWORD *)(i + 7);
          v30 = *(_OWORD *)(i + 5);
          *(_OWORD *)(v28 + 24) = *(_OWORD *)(i + 3);
          *(_OWORD *)(v28 + 40) = v30;
          *(_OWORD *)(v28 + 56) = v29;
          v31 = *(_OWORD *)(i + 11);
          v32 = *(_OWORD *)(i + 13);
          v33 = *(_OWORD *)(i + 15);
          *(_OWORD *)(v28 + 72) = *(_OWORD *)(i + 9);
          *(_OWORD *)(v28 + 120) = v33;
          *(_OWORD *)(v28 + 104) = v32;
          *(_OWORD *)(v28 + 88) = v31;
          v34 = *(_OWORD *)(i + 19);
          v35 = *(_OWORD *)(i + 21);
          v36 = i[23];
          *(_OWORD *)(v28 + 136) = *(_OWORD *)(i + 17);
          *((_QWORD *)v28 + 23) = v36;
          *(_OWORD *)(v28 + 168) = v35;
          *(_OWORD *)(v28 + 152) = v34;
          v37 = (float)(unint64_t)(*((_QWORD *)&v57 + 1) + 1);
          if (!v23 || (float)(v58 * (float)v23) < v37)
          {
            v38 = (v23 & (v23 - 1)) != 0;
            if (v23 < 3)
              v38 = 1;
            v39 = v38 | (2 * v23);
            v40 = vcvtps_u32_f32(v37 / v58);
            if (v39 <= v40)
              v41 = v40;
            else
              v41 = v39;
            std::__hash_table<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>>>::__rehash<true>((uint64_t)__p, v41);
            v23 = (unint64_t)__p[1];
            if (((unint64_t)__p[1] & ((unint64_t)__p[1] - 1)) != 0)
            {
              if ((void *)v22 >= __p[1])
                v19 = v22 % (unint64_t)__p[1];
              else
                v19 = v22;
            }
            else
            {
              v19 = ((unint64_t)__p[1] - 1) & v22;
            }
          }
          v42 = __p[0];
          v43 = (_QWORD *)*((_QWORD *)__p[0] + v19);
          if (v43)
          {
            *(_QWORD *)v28 = *v43;
          }
          else
          {
            *(_QWORD *)v28 = v57;
            *(_QWORD *)&v57 = v28;
            v42[v19] = &v57;
            if (!*(_QWORD *)v28)
              goto LABEL_42;
            v44 = *(_QWORD *)(*(_QWORD *)v28 + 8);
            if ((v23 & (v23 - 1)) != 0)
            {
              if (v44 >= v23)
                v44 %= v23;
            }
            else
            {
              v44 &= v23 - 1;
            }
            v43 = (char *)__p[0] + 8 * v44;
          }
          *v43 = v28;
LABEL_42:
          ++*((_QWORD *)&v57 + 1);
LABEL_43:
          ;
        }
        std::__hash_table<std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},__CVBuffer *>>>::__hash_table((uint64_t)retstr, v55);
        std::__hash_table<std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},__CVBuffer *>>>::__hash_table((uint64_t)&retstr->var0.var1.var0.var1, (uint64_t *)__p);
        retstr->var1 = 1;
        std::__hash_table<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>>>::__deallocate_node((id *)v57);
        v45 = __p[0];
        __p[0] = 0;
        if (v45)
          operator delete(v45);
        std::__hash_table<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>>>::__deallocate_node((id *)v55[2]);
        v13 = v54;
        v46 = (void *)v55[0];
        v55[0] = 0;
        v17 = v52;
        v14 = v53;
        if (v46)
          operator delete(v46);
      }
      else
      {
        for (k = (uint64_t **)v76[8]; k; k = (uint64_t **)*k)
        {
          CVPixelBufferRelease((CVPixelBufferRef)k[3]);
          k[3] = 0;
        }
        retstr->var0.var0 = 0;
        retstr->var1 = 0;
      }

      _Block_object_dispose(&v66, 8);
      std::__hash_table<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>>>::__deallocate_node(*((id **)&v72 + 1));
      v48 = (void *)*((_QWORD *)&v71 + 1);
      *((_QWORD *)&v71 + 1) = 0;
      if (v48)
        operator delete(v48);
      _Block_object_dispose(&v75, 8);
      std::__hash_table<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>>>::__deallocate_node(*((id **)&v81 + 1));
      v49 = (void *)*((_QWORD *)&v80 + 1);
      *((_QWORD *)&v80 + 1) = 0;
      if (v49)
        operator delete(v49);
    }
    else
    {
      retstr->var0.var0 = 0;
      retstr->var1 = 0;
    }

  }
  else
  {
    *(_QWORD *)&retstr->var1 = 0;
    *(_OWORD *)&retstr->var0.var1.var0.var1.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0u;
    *(_OWORD *)&retstr->var0.var1.var0.var1.__table_.__p2_.__value_ = 0u;
    *(_OWORD *)&retstr->var0.var1.var0.var0.var0.var1.var0.var0 = 0u;
    *(_OWORD *)&retstr->var0.var1.var0.var0.var0.var3.var0 = 0u;
    *(_OWORD *)&retstr->var0.var0 = 0u;
  }

  return result;
}

- (__CVBuffer)renderCIImage:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 format:(unsigned int)a6 computeDevice:(id)a7 session:(id)a8 error:(id *)a9
{
  uint64_t v11;
  id v14;
  id v15;
  id v16;
  __CVBuffer *v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void *v25;
  id v26;
  __CVBuffer *v27;

  v11 = *(_QWORD *)&a6;
  v14 = a3;
  v15 = a7;
  v16 = a8;
  v17 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, a4, a5, v11, a9);
  if (v17)
  {
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __89__VNSegmentationGenerator_renderCIImage_width_height_format_computeDevice_session_error___block_invoke;
    v25 = &unk_1E45469E8;
    v26 = v14;
    v27 = v17;
    v18 = _Block_copy(&v22);
    objc_msgSend(v16, "vnciContextManager", v22, v23, v24, v25);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[VNCIContextManager performBlock:usingAvailableContextForComputeDevice:error:]((uint64_t)v19, v18, v15, a9);

    if ((v20 & 1) == 0)
    {
      CVPixelBufferRelease(v17);
      v17 = 0;
    }

  }
  return v17;
}

- (BOOL)validateMaskForBlobName:(id)a3 options:(id)a4 maskConfidence:(float *)a5 maskAcceptable:(BOOL *)a6 error:(id *)a7
{
  BOOL v9;
  uint64_t v10;

  if (a5)
    v9 = a6 == 0;
  else
    v9 = 1;
  v10 = !v9;
  +[VNError VNAssert:log:](VNError, "VNAssert:log:", v10, CFSTR("One or more of output parameters is/are NULL"));
  *a5 = 1.0;
  *a6 = 1;
  return 1;
}

- (BOOL)bindOutputConfidenceBuffersAndReturnError:(id *)a3
{
  return 1;
}

- (const)espressoMaskOutputBuffers
{
  return &self->_espressoMaskOutputBuffers;
}

- (const)espressoMaskOutputBufferSizes
{
  return &self->_espressoMaskOutputBufferSizes;
}

- (void).cxx_destruct
{
  unordered_map<NSString *, apple::vision::BufferSize, std::hash<NSString *>, std::equal_to<NSString *>, std::allocator<std::pair<NSString *const, apple::vision::BufferSize>>> *p_espressoMaskOutputBufferSizes;
  id *next;
  id *v5;
  void **value;

  p_espressoMaskOutputBufferSizes = &self->_espressoMaskOutputBufferSizes;
  next = (id *)self->_espressoMaskOutputBufferSizes.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      v5 = (id *)*next;

      operator delete(next);
      next = v5;
    }
    while (v5);
  }
  value = p_espressoMaskOutputBufferSizes->__table_.__bucket_list_.__ptr_.__value_;
  p_espressoMaskOutputBufferSizes->__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
    operator delete(value);
  std::__hash_table<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>>>::~__hash_table((uint64_t)&self->_espressoMaskOutputBuffers);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = 0;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *((_DWORD *)self + 34) = 1065353216;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_DWORD *)self + 44) = 1065353216;
  *((_QWORD *)self + 23) = 0;
  *((_QWORD *)self + 24) = 0;
  *((_QWORD *)self + 25) = 0;
  *((_QWORD *)self + 26) = 0;
  return self;
}

uint64_t __89__VNSegmentationGenerator_renderCIImage_width_height_format_computeDevice_session_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  if (a2)
    v3 = *(void **)(a2 + 8);
  else
    v3 = 0;
  v4 = v3;
  objc_msgSend(v4, "render:toCVPixelBuffer:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  return 1;
}

uint64_t __96__VNSegmentationGenerator__processNonTiledLockedImageBuffer_inputMaskObservation_options_error___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  __CVBuffer *v7;
  __CVBuffer *v8;
  unint64_t v9;
  unint64_t v10;
  size_t Width;
  size_t Height;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  BOOL v20;
  BOOL v21;
  size_t v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  CGFloat a;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  char v39;
  uint64_t result;
  id *v41;
  __CVBuffer *v42;
  uint64_t v43;
  id v44;
  unint64_t v45;
  void *v46;
  CGAffineTransform v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  CGAffineTransform v56;
  _QWORD aBlock[4];
  id v58;
  CGFloat v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  int v63;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 80);
  objc_msgSend((id)objc_opt_class(), "inputImageBlobName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "bindLockedPixelBuffer:toNetworkInputBlobName:error:", v5, v6, a2);

  if ((v4 & 1) == 0)
    return 0;
  objc_msgSend(*(id *)(a1 + 32), "initializeOutputConfidenceBuffers:", *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 48);
  v7 = (__CVBuffer *)objc_msgSend(*(id *)(a1 + 40), "pixelBuffer");
  if (!v7)
    goto LABEL_21;
  v8 = v7;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
  Width = CVPixelBufferGetWidth(v7);
  Height = CVPixelBufferGetHeight(v8);
  objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200);
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208);
  objc_msgSend(v13, "extent");
  v16 = (double)v14 / (double)v15;
  v19 = v17 / v18;
  v20 = v16 >= 1.0 || v19 < 1.0;
  if (!v20 || (v16 >= 1.0 ? (v21 = v19 < 1.0) : (v21 = 0), v21))
  {
    objc_msgSend(v13, "imageByApplyingCGOrientation:", 8);
    v23 = objc_claimAutoreleasedReturnValue();

    v22 = Width;
    v13 = (void *)v23;
  }
  else
  {
    v22 = Height;
    Height = Width;
  }
  if (Height != v10 || v22 != v9)
  {
    memset(&v47, 0, sizeof(v47));
    objc_msgSend(v13, "extent");
    v25 = v24;
    objc_msgSend(v13, "extent");
    CGAffineTransformMakeScale(&v47, (double)v10 / v25, (double)v9 / v26);
    v56 = v47;
    objc_msgSend(v13, "imageByApplyingTransform:", &v56);
    v27 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v27;
  }
  objc_msgSend((id)objc_opt_class(), "inputMaskBlobName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v48 = 0u;
  memset(&v47, 0, sizeof(v47));
  if ((objc_msgSend(*(id *)(a1 + 32), "bindBuffer:toNetworkInputBlobName:error:", &v47, v28, a2) & 1) == 0)
    goto LABEL_27;
  +[VNValidationUtilities requiredSessionInOptions:error:](VNValidationUtilities, "requiredSessionInOptions:error:", *(_QWORD *)(a1 + 48), a2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v29)
    goto LABEL_27;
  v45 = v9;
  v46 = v29;
  v30 = *(_QWORD *)(a1 + 32);
  a = v47.a;
  v32 = *(void **)(a1 + 56);
  objc_msgSend(v29, "vnciContextManager");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v13;
  v44 = v32;
  v35 = v33;
  v36 = v35;
  if (!v30)
  {

LABEL_27:
    return 0;
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __119__VNSegmentationGenerator__renderCIImage_toBuffer_width_height_rowBytes_format_computeDevice_vnciContextManager_error___block_invoke;
  aBlock[3] = &unk_1E45454B0;
  v59 = a;
  v60 = v45;
  v61 = v10;
  v62 = 4 * v10;
  v37 = v34;
  v58 = v37;
  v63 = 1278226534;
  v38 = _Block_copy(aBlock);
  v39 = -[VNCIContextManager performBlock:usingAvailableContextForComputeDevice:error:]((uint64_t)v36, v38, v44, a2);

  if ((v39 & 1) == 0)
    return 0;
LABEL_21:
  result = objc_msgSend(*(id *)(a1 + 32), "executePlanAndReturnError:", a2);
  if ((_DWORD)result)
  {
    v41 = *(id **)(*(_QWORD *)(a1 + 32) + 120);
    if (v41)
    {
      while (1)
      {
        v42 = +[VNEspressoHelpers createCVPixelBufferWithPixelFormat:fromImageInEspressoBuffer:error:](VNEspressoHelpers, "createCVPixelBufferWithPixelFormat:fromImageInEspressoBuffer:error:", 1278226534, v41 + 3, a2);
        result = v42 != 0;
        if (!v42)
          break;
        v43 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 48;
        *(_QWORD *)&v47.a = v41 + 2;
        std::__hash_table<std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},__CVBuffer *>>>::__emplace_unique_key_args<NSString * {__strong},std::piecewise_construct_t const&,std::tuple<NSString * const {__strong}&>,std::tuple<>>(v43, v41 + 2, (id **)&v47)[3] = v42;
        v41 = (id *)*v41;
        if (!v41)
          return 1;
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t __119__VNSegmentationGenerator__renderCIImage_toBuffer_width_height_rowBytes_format_computeDevice_vnciContextManager_error___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v4;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  v4 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_OWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 64);
  return -[VNCIContext renderCIImage:buffer:format:error:](a2, v4, &v6, *(_DWORD *)(a1 + 72), a3);
}

id __125__VNSegmentationGenerator_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v5;
  unint64_t v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t i;
  id *j;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id obj;
  uint64_t v23;
  uint64_t v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  void *__p;
  unint64_t v32;
  id *v33;
  uint64_t v34;
  int v35;
  void *v36;
  unint64_t v37;
  id *v38;
  uint64_t v39;
  int v40;
  char v41;
  _BYTE v42[80];
  uint64_t v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v25 = a2;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 120));
  if (*(_QWORD *)(a1 + 120))
  {
    v6 = 0;
    do
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v5, "addObject:", v7);

      ++v6;
    }
    while (v6 < *(_QWORD *)(a1 + 120));
  }
  v8 = *(void **)(a1 + 32);
  if (v8)
  {
    objc_msgSend(v8, "processLockedImageBuffer:inputMaskObservation:options:qosClass:error:", *(_QWORD *)(a1 + 128), v25, *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 136), a3);
    if ((_BYTE)v43)
    {
      std::unordered_map<NSString * {__strong},__CVBuffer *>::unordered_map((uint64_t)&v36, (uint64_t)v42);
      v41 = 1;
      v9 = v36;
      v10 = v37;
      v36 = 0;
      v37 = 0;
      __p = v9;
      v32 = v10;
      v11 = v39;
      v33 = v38;
      v34 = v39;
      v35 = v40;
      if (v39)
      {
        v12 = (unint64_t)v38[1];
        if ((v10 & (v10 - 1)) != 0)
        {
          if (v12 >= v10)
            v12 %= v10;
        }
        else
        {
          v12 &= v10 - 1;
        }
        *((_QWORD *)v9 + v12) = &v33;
        v38 = 0;
        v39 = 0;
      }
      if (v11 == objc_msgSend(*(id *)(a1 + 48), "count"))
      {
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        obj = *(id *)(a1 + 48);
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v44, 16);
        if (v14)
        {
          v24 = *(_QWORD *)v27;
          while (2)
          {
            v23 = v14;
            for (i = 0; i != v23; ++i)
            {
              if (*(_QWORD *)v27 != v24)
                objc_enumerationMutation(obj);
              v30 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
              if ((objc_msgSend(*(id *)(a1 + 32), "validateMaskForBlobName:options:maskConfidence:maskAcceptable:error:") & 1) == 0)
              {

                v13 = 0;
                goto LABEL_28;
              }
            }
            v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v44, 16);
            if (v14)
              continue;
            break;
          }
        }

        v13 = v5;
LABEL_28:
        for (j = v33; j; j = (id *)*j)
        {
          CVPixelBufferRelease((CVPixelBufferRef)j[3]);
          j[3] = 0;
        }
        if (v34)
        {
          std::__hash_table<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>>>::__deallocate_node(v33);
          v33 = 0;
          v17 = v32;
          if (v32)
          {
            v18 = 0;
            do
              *((_QWORD *)__p + v18++) = 0;
            while (v17 != v18);
          }
          v34 = 0;
        }
      }
      else if (a3)
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Unexpected number for masks returned"));
        v13 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }
      std::__hash_table<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>>>::__deallocate_node(v33);
      v19 = __p;
      __p = 0;
      if (v19)
        operator delete(v19);
      if (v41)
      {
        std::__hash_table<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>>>::__deallocate_node(v38);
        v20 = v36;
        v36 = 0;
        if (v20)
          operator delete(v20);
      }
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
    v43 = 0;
    memset(v42, 0, sizeof(v42));
  }
  std::__optional_destruct_base<std::tuple<std::unordered_map<NSString * {__strong},__CVBuffer *>,std::unordered_map<NSString * {__strong},espresso_buffer_t>>,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)v42);

  return v13;
}

void __125__VNSegmentationGenerator_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v5);

}

uint64_t __66__VNSegmentationGenerator_completeInitializationForSession_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "getWidth:height:ofEspressoModelNetworkBlobNamed:error:", a3, a3 + 8, a2, a4);
}

@end
