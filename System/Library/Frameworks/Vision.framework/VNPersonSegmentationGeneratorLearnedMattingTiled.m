@implementation VNPersonSegmentationGeneratorLearnedMattingTiled

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___VNPersonSegmentationGeneratorLearnedMattingTiled;
  objc_msgSendSuper2(&v9, sel_supportedComputeStageDevicesForOptions_error_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    +[VNComputeDeviceUtilities allGPUComputeDevices](VNComputeDeviceUtilities, "allGPUComputeDevices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("VNComputeStagePostProcessing"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)computeStagesToBindForConfigurationOptions:(id)a3
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___VNPersonSegmentationGeneratorLearnedMattingTiled;
  objc_msgSendSuper2(&v6, sel_computeStagesToBindForConfigurationOptions_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObject:", CFSTR("VNComputeStagePostProcessing"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)espressoModelFileNameForConfigurationOptions:(id)a3
{
  return CFSTR("learnedmatting-f16-v2.espresso");
}

+ (BOOL)supportsTiling
{
  return 1;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  VNMetalContext *v8;
  VNMetalContext *postProcessingMetalContext;
  VNMetalContext *v10;
  MTLComputePipelineState *v11;
  MTLComputePipelineState *createTileWithScaleComputePipelineState;
  MTLComputePipelineState *v13;
  MTLComputePipelineState *pasteTileComputePipelineState;
  BOOL v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)VNPersonSegmentationGeneratorLearnedMattingTiled;
  if (!-[VNSegmentationGenerator completeInitializationForSession:error:](&v17, sel_completeInitializationForSession_error_, a3))return 0;
  -[VNDetector boundComputeDeviceForComputeStage:error:](self, "boundComputeDeviceForComputeStage:error:", CFSTR("VNComputeStagePostProcessing"), a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_7;
  +[VNComputeDeviceUtilities metalDeviceForComputeDevice:](VNComputeDeviceUtilities, "metalDeviceForComputeDevice:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[VNMetalContext metalContextForDevice:error:]((uint64_t)VNMetalContext, v7, a4);
  v8 = (VNMetalContext *)objc_claimAutoreleasedReturnValue();
  postProcessingMetalContext = self->_postProcessingMetalContext;
  self->_postProcessingMetalContext = v8;

  v10 = self->_postProcessingMetalContext;
  if (!v10)
    goto LABEL_7;
  -[VNMetalContext computePipelineStateForFunctionWithName:error:]((uint64_t)v10, CFSTR("learnedMatting_createTileWithScale"), (uint64_t)a4);
  v11 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  createTileWithScaleComputePipelineState = self->_createTileWithScaleComputePipelineState;
  self->_createTileWithScaleComputePipelineState = v11;

  if (self->_createTileWithScaleComputePipelineState)
  {
    -[VNMetalContext computePipelineStateForFunctionWithName:error:]((uint64_t)self->_postProcessingMetalContext, CFSTR("learnedMatting_pasteTile"), (uint64_t)a4);
    v13 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    pasteTileComputePipelineState = self->_pasteTileComputePipelineState;
    self->_pasteTileComputePipelineState = v13;

    v15 = self->_pasteTileComputePipelineState != 0;
  }
  else
  {
LABEL_7:
    v15 = 0;
  }

  return v15;
}

- (BufferSize)outputMaskSize
{
  unint64_t v2;
  unint64_t v3;
  BufferSize result;

  v2 = 2016;
  v3 = 1512;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BufferSize)_calculateNumberOfTilesForNetworkInputImageSize:(BufferSize)a3 networkInputMaskSize:(BufferSize)a4 networkOutputMaskSize:(BufferSize)a5 rotated:(BOOL)a6
{
  unint64_t height;
  unint64_t width;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  BufferSize result;

  height = a3.height;
  width = a3.width;
  v8 = -[VNPersonSegmentationGeneratorLearnedMattingTiled outputMaskSize](self, "outputMaskSize", a3.width, a3.height, a4.width, a4.height, a5.width, a5.height);
  if (a6)
    v10 = v9;
  else
    v10 = v8;
  if (a6)
    v11 = v8;
  else
    v11 = v9;
  v12 = vcvtps_u32_f32((float)v10 / (float)width);
  v13 = vcvtps_u32_f32((float)v11 / (float)height);
  result.height = v13;
  result.width = v12;
  return result;
}

- (optional<std::tuple<std::unordered_map<NSString)processLockedImageBuffer:(std:(espresso_buffer_t>>> *__return_ptr)retstr :(VNPersonSegmentationGeneratorLearnedMattingTiled *)self unordered_map<NSString *) inputMaskObservation:(SEL)a3 options:(__CVBuffer *)a4 qosClass:(id)a5 error:(id)a6
{
  uint64_t v9;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  unint64_t v36;
  unint64_t v37;
  optional<std::tuple<std::unordered_map<NSString *, __CVBuffer *>, std::unordered_map<NSString *, espresso_buffer_t>>> *result;
  id v39;
  void *v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  void *v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  char v50;
  void *__p;
  unint64_t v52;
  id *v53;
  uint64_t v54;
  int v55;
  void *v56;
  unint64_t v57;
  id *v58;
  uint64_t v59;
  int v60;
  char v61;

  v9 = *(_QWORD *)&a7;
  v13 = a5;
  v14 = a6;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v14, a8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    LOBYTE(__p) = 0;
    v61 = 0;
    v16 = (void *)MEMORY[0x1A1B0B060]();
    v39 = 0;
    -[VNPersonSegmentationGeneratorLearnedMattingTiled _processTiledImageBuffer:inputMaskObservation:options:qosClass:error:](self, "_processTiledImageBuffer:inputMaskObservation:options:qosClass:error:", v15, v13, v14, v9, &v39);
    v17 = v39;
    if (v61 == v50)
    {
      if (v61)
      {
        if (v54)
        {
          std::__hash_table<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>>>::__deallocate_node(v53);
          v53 = 0;
          v18 = v52;
          if (v52)
          {
            v19 = 0;
            do
              *((_QWORD *)__p + v19++) = 0;
            while (v18 != v19);
          }
          v54 = 0;
        }
        v20 = v40;
        v40 = 0;
        v21 = __p;
        __p = v20;
        if (v21)
          operator delete(v21);
        v22 = v41;
        v41 = 0;
        v53 = (id *)v42;
        v54 = v43;
        v55 = v44;
        v52 = v22;
        if (v43)
        {
          v23 = *(_QWORD *)(v42 + 8);
          if ((v22 & (v22 - 1)) != 0)
          {
            if (v23 >= v22)
              v23 %= v22;
          }
          else
          {
            v23 &= v22 - 1;
          }
          *((_QWORD *)__p + v23) = &v53;
          v42 = 0;
          v43 = 0;
        }
        if (v59)
        {
          std::__hash_table<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>>>::__deallocate_node(v58);
          v58 = 0;
          v29 = v57;
          if (v57)
          {
            v30 = 0;
            do
              *((_QWORD *)v56 + v30++) = 0;
            while (v29 != v30);
          }
          v59 = 0;
        }
        v31 = v45;
        v45 = 0;
        v32 = v56;
        v56 = v31;
        if (v32)
          operator delete(v32);
        v33 = v46;
        v46 = 0;
        v58 = (id *)v47;
        v59 = v48;
        v60 = v49;
        v57 = v33;
        if (v48)
        {
          v34 = *(_QWORD *)(v47 + 8);
          if ((v33 & (v33 - 1)) != 0)
          {
            if (v34 >= v33)
              v34 %= v33;
          }
          else
          {
            v34 &= v33 - 1;
          }
          *((_QWORD *)v56 + v34) = &v58;
          v47 = 0;
          v48 = 0;
        }
      }
    }
    else if (v61)
    {
      std::__hash_table<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>>>::__deallocate_node(v58);
      v24 = v56;
      v56 = 0;
      if (v24)
        operator delete(v24);
      std::__hash_table<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>>>::__deallocate_node(v53);
      v25 = __p;
      __p = 0;
      if (v25)
        operator delete(v25);
      v61 = 0;
    }
    else
    {
      v26 = v40;
      v27 = v41;
      v40 = 0;
      v41 = 0;
      __p = v26;
      v52 = v27;
      v53 = (id *)v42;
      v54 = v43;
      v55 = v44;
      if (v43)
      {
        v28 = *(_QWORD *)(v42 + 8);
        if ((v27 & (v27 - 1)) != 0)
        {
          if (v28 >= v27)
            v28 %= v27;
        }
        else
        {
          v28 &= v27 - 1;
        }
        *((_QWORD *)v26 + v28) = &v53;
        v42 = 0;
        v43 = 0;
      }
      v35 = v45;
      v36 = v46;
      v45 = 0;
      v46 = 0;
      v56 = v35;
      v57 = v36;
      v58 = (id *)v47;
      v59 = v48;
      v60 = v49;
      if (v48)
      {
        v37 = *(_QWORD *)(v47 + 8);
        if ((v36 & (v36 - 1)) != 0)
        {
          if (v37 >= v36)
            v37 %= v36;
        }
        else
        {
          v37 &= v36 - 1;
        }
        *((_QWORD *)v35 + v37) = &v58;
        v47 = 0;
        v48 = 0;
      }
      v61 = 1;
    }
    std::__optional_destruct_base<std::tuple<std::unordered_map<NSString * {__strong},__CVBuffer *>,std::unordered_map<NSString * {__strong},espresso_buffer_t>>,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v40);
    objc_autoreleasePoolPop(v16);
    if (v61)
    {
      retstr->var0.var0 = 0;
      retstr->var1 = 0;
      std::__hash_table<std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},__CVBuffer *>>>::__hash_table((uint64_t)retstr, (uint64_t *)&__p);
      std::__hash_table<std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},__CVBuffer *>>>::__hash_table((uint64_t)&retstr->var0.var1.var0.var1, (uint64_t *)&v56);
      retstr->var1 = 1;
    }
    else
    {
      if (a8)
        *a8 = objc_retainAutorelease(v17);
      retstr->var0.var0 = 0;
      retstr->var1 = 0;
    }
    std::__optional_destruct_base<std::tuple<std::unordered_map<NSString * {__strong},__CVBuffer *>,std::unordered_map<NSString * {__strong},espresso_buffer_t>>,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&__p);

  }
  else
  {
    retstr->var0.var0 = 0;
    retstr->var1 = 0;
  }

  return result;
}

- (optional<std::tuple<std::unordered_map<NSString)_processTiledImageBuffer:(std:(espresso_buffer_t>>> *__return_ptr)retstr :(VNPersonSegmentationGeneratorLearnedMattingTiled *)self unordered_map<NSString *) inputMaskObservation:(SEL)a3 options:(id)a4 qosClass:(id)a5 error:(id)a6
{
  id v14;
  void *v15;
  void *v16;
  int v17;
  float64x2_t v18;
  void *v19;
  const BufferSize *v20;
  unint64_t width;
  unint64_t height;
  const BufferSize *v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  __int128 v41;
  unint64_t v42;
  unint64_t v43;
  NSObject *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  uint64_t v49;
  dispatch_semaphore_t v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  uint64_t (**v54)(void *, id *);
  void *v55;
  int v56;
  id v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  unint64_t v62;
  unint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  optional<std::tuple<std::unordered_map<NSString *, __CVBuffer *>, std::unordered_map<NSString *, espresso_buffer_t>>> *result;
  uint64_t v68;
  NSObject *v69;
  id v70;
  id v71;
  dispatch_block_t v72;
  dispatch_queue_t v73;
  uint64_t dsemaa;
  NSObject *dsema;
  unint64_t v76;
  unint64_t v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  dispatch_qos_class_t qos_class;
  void *qos_classa;
  void *v83;
  void *v84;
  void *v85;
  unint64_t v86;
  void *v87;
  void (**v88)(void);
  float64x2_t v89;
  void *v90;
  void *v91;
  id v92;
  id v93;
  void *v94[2];
  __int128 v95;
  int v96;
  void *v97[2];
  __int128 v98;
  int v99;
  __int128 __p;
  __int128 v101;
  int v102;
  id v103;
  _QWORD v104[4];
  id v105;
  uint64_t v106;
  uint64_t v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  _QWORD v114[4];
  id v115;
  VNPersonSegmentationGeneratorLearnedMattingTiled *v116;
  id v117;
  id v118;
  NSObject *v119;
  id v120;
  id v121;
  _QWORD *v122;
  _QWORD *v123;
  uint64_t *v124;
  _QWORD *v125;
  _QWORD *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t *v129;
  uint64_t v130;
  uint64_t (*v131)(uint64_t, uint64_t);
  void (*v132)(uint64_t);
  id v133;
  _QWORD v134[5];
  _QWORD block[5];
  id v136;
  NSObject *v137;
  _QWORD *v138;
  _QWORD *v139;
  uint64_t *v140;
  _QWORD *v141;
  double v142;
  double v143;
  uint64_t v144;
  uint64_t v145;
  __int16 v146;
  __int16 v147;
  uint64_t v148;
  uint64_t *v149;
  uint64_t v150;
  uint64_t (*v151)(uint64_t, uint64_t);
  void (*v152)(uint64_t);
  id v153;
  _QWORD v154[6];
  int v155;
  _QWORD v156[6];
  _BYTE v157[48];
  _QWORD v158[11];
  _QWORD v159[5];
  id v160;
  _QWORD v161[5];
  id v162;
  _QWORD v163[5];
  id v164;
  _QWORD v165[4];
  id v166;
  id v167;
  VNPersonSegmentationGeneratorLearnedMattingTiled *v168;
  id v169;
  _QWORD *v170;
  _QWORD *v171;
  uint64_t *v172;
  uint64x2_t v173;
  __int128 v174;
  float64x2_t v175;
  unint64_t v176;
  unint64_t v177;
  _QWORD aBlock[7];
  uint64_t v179;
  uint64_t *v180;
  uint64_t v181;
  uint64_t v182;
  _QWORD v183[4];
  _QWORD v184[4];
  __int128 v185;
  float64x2_t v186;
  id v187[5];

  v187[2] = *(id *)MEMORY[0x1E0C80C00];
  v93 = a4;
  v92 = a5;
  v14 = a6;
  +[VNValidationUtilities requiredSessionInOptions:error:](VNValidationUtilities, "requiredSessionInOptions:error:", v14, a8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v91 = v15;
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("VNSegmentationGeneratorProcessOption_ImageRotated"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "BOOLValue"))
      v17 = objc_msgSend((id)objc_opt_class(), "rotateImageToMatchNetworkOrientation");
    else
      v17 = 0;

    v18 = *(float64x2_t *)(MEMORY[0x1E0C9D648] + 16);
    v185 = *MEMORY[0x1E0C9D648];
    v186 = v18;
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("VNSegmentationGeneratorProcessOption_ImageROI"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    qos_class = a7;
    objc_msgSend(v19, "getValue:size:", &v185, 32);

    v20 = -[VNSegmentationGenerator espressoInputImageSize](self, "espressoInputImageSize");
    width = v20->width;
    height = v20->height;
    v23 = -[VNSegmentationGenerator espressoInputMaskSize](self, "espressoInputMaskSize");
    v24 = v23->width;
    v25 = v23->height;
    v26 = -[VNPersonSegmentationGeneratorLearnedMattingTiled outputMaskSize](self, "outputMaskSize");
    LOBYTE(v68) = v17;
    v28 = -[VNPersonSegmentationGeneratorLearnedMattingTiled _calculateNumberOfTilesForNetworkInputImageSize:networkInputMaskSize:networkOutputMaskSize:rotated:](self, "_calculateNumberOfTilesForNetworkInputImageSize:networkInputMaskSize:networkOutputMaskSize:rotated:", width, height, v24, v25, v26, v27, v68);
    v30 = v29;
    -[VNMetalContext commandQueueReturnError:]((os_unfair_lock_s *)self->_postProcessingMetalContext, a8);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v31)
    {
      retstr->var0.var0 = 0;
      retstr->var1 = 0;
LABEL_49:

      v15 = v91;
      goto LABEL_50;
    }
    v85 = v31;
    v32 = (void *)objc_opt_class();
    objc_msgSend(v32, "inputImageBlobName");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "inputMaskBlobName");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v93, "width");
    v76 = objc_msgSend(v93, "height");
    v77 = v33;
    v79 = v30;
    v80 = v28;
    v89 = v186;
    v34 = -[VNPersonSegmentationGeneratorLearnedMattingTiled outputMaskSize](self, "outputMaskSize");
    if (v17)
      v36 = v35;
    else
      v36 = v34;
    v86 = v36;
    v184[0] = 0;
    v184[1] = v184;
    if (v17)
      v37 = v34;
    else
      v37 = v35;
    v184[2] = 0x2020000000;
    v184[3] = 0;
    v183[0] = 0;
    v183[1] = v183;
    v183[2] = 0x2020000000;
    v183[3] = 0;
    v179 = 0;
    v180 = &v179;
    v181 = 0x2020000000;
    v182 = 0;
    v38 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke;
    aBlock[3] = &unk_1E4545EF0;
    aBlock[4] = v184;
    aBlock[5] = v183;
    aBlock[6] = &v179;
    v88 = (void (**)(void))_Block_copy(aBlock);
    v165[0] = v38;
    v165[1] = 3221225472;
    v165[2] = __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_2;
    v165[3] = &unk_1E4545F18;
    v170 = v184;
    v39 = v93;
    v173 = vcvtq_u64_f64(v89);
    v174 = v185;
    v175 = v186;
    v166 = v39;
    v171 = v183;
    v167 = v92;
    v168 = self;
    v169 = v91;
    v172 = &v179;
    v176 = v86;
    v177 = v37;
    v90 = _Block_copy(v165);
    if ((VNExecuteBlock(v90, (uint64_t)a8) & 1) == 0)
    {
      v88[2]();
      retstr->var0.var0 = 0;
      retstr->var1 = 0;
LABEL_48:

      _Block_object_dispose(&v179, 8);
      _Block_object_dispose(v183, 8);
      _Block_object_dispose(v184, 8);

      v31 = v85;
      goto LABEL_49;
    }
    v163[0] = 0;
    v163[1] = v163;
    v163[2] = 0x3032000000;
    v163[3] = __Block_byref_object_copy__17281;
    v163[4] = __Block_byref_object_dispose__17282;
    v164 = 0;
    v161[0] = 0;
    v161[1] = v161;
    v161[2] = 0x3032000000;
    v161[3] = __Block_byref_object_copy__17281;
    v161[4] = __Block_byref_object_dispose__17282;
    v162 = 0;
    v159[0] = 0;
    v159[1] = v159;
    v159[2] = 0x3032000000;
    v159[3] = __Block_byref_object_copy__17281;
    v159[4] = __Block_byref_object_dispose__17282;
    v160 = 0;
    v158[0] = MEMORY[0x1E0C809B0];
    v158[1] = 3221225472;
    v158[2] = __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_34;
    v158[3] = &unk_1E4545F40;
    v158[5] = v163;
    v158[4] = self;
    v158[6] = v184;
    v158[7] = v161;
    v158[8] = v183;
    v158[9] = v159;
    v158[10] = &v179;
    v78 = _Block_copy(v158);
    if ((VNExecuteBlock(v78, (uint64_t)a8) & 1) == 0)
    {
      v88[2]();
      retstr->var0.var0 = 0;
      retstr->var1 = 0;
LABEL_47:

      _Block_object_dispose(v159, 8);
      _Block_object_dispose(v161, 8);

      _Block_object_dispose(v163, 8);
      goto LABEL_48;
    }
    v40 = *(_QWORD *)(-[VNSegmentationGenerator espressoMaskOutputBufferSizes](self, "espressoMaskOutputBufferSizes")
                    + 16);
    v41 = v185;
    v42 = *(_QWORD *)(v40 + 24);
    v43 = *(_QWORD *)(v40 + 32);
    v156[0] = 0;
    v156[1] = v156;
    v156[2] = 0x6012000000;
    v156[3] = __Block_byref_object_copy__35;
    v156[4] = __Block_byref_object_dispose__36;
    v156[5] = "";
    memset(v157, 0, sizeof(v157));
    v154[0] = 0;
    v154[1] = v154;
    v154[2] = 0x3812000000;
    v154[3] = __Block_byref_object_copy__37_17284;
    v154[4] = __Block_byref_object_dispose__38_17285;
    v154[5] = "";
    v155 = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v44 = objc_claimAutoreleasedReturnValue();
    v73 = dispatch_queue_create(0, v44);

    v45 = (double)(v86 - v42) / (double)(unint64_t)(v28 - 1);
    v46 = (double)v42;
    v47 = (double)(v37 - v43) / (double)(unint64_t)(v79 - 1);
    v48 = (double)v43;
    LODWORD(v49) = (int)((double)v42 - v45);
    HIDWORD(v49) = (int)((double)v43 - v47);
    dsemaa = v49;
    v50 = dispatch_semaphore_create(0);
    v148 = 0;
    v149 = &v148;
    v150 = 0x3032000000;
    v151 = __Block_byref_object_copy__17281;
    v152 = __Block_byref_object_dispose__17282;
    v153 = 0;
    v51 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_40;
    block[3] = &unk_1E4545FB0;
    v138 = v154;
    block[4] = self;
    v139 = v156;
    v140 = &v148;
    v142 = v45;
    v143 = v47;
    v147 = WORD2(dsemaa);
    v146 = dsemaa;
    v52 = v85;
    v136 = v52;
    v141 = v159;
    v144 = v28;
    v145 = v79;
    dsema = v50;
    v137 = dsema;
    v72 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, qos_class, 0, block);
    v134[0] = v51;
    v134[1] = 3221225472;
    v134[2] = __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_4;
    v134[3] = &unk_1E4545FF8;
    v134[4] = self;
    qos_classa = _Block_copy(v134);
    v128 = 0;
    v129 = &v128;
    v130 = 0x3032000000;
    v131 = __Block_byref_object_copy__17281;
    v132 = __Block_byref_object_dispose__17282;
    v133 = 0;
    v53 = *(_QWORD *)(-[VNSegmentationGenerator espressoMaskOutputBuffers](self, "espressoMaskOutputBuffers") + 16)
        + 24;
    v114[0] = v51;
    v114[1] = 3221225472;
    v114[2] = __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_6;
    v114[3] = &unk_1E4546070;
    v115 = v52;
    v71 = qos_classa;
    v120 = v71;
    v116 = self;
    v122 = v163;
    v123 = v161;
    v117 = v83;
    v127 = v53;
    v118 = v84;
    v124 = &v128;
    v125 = v154;
    v126 = v156;
    v69 = v73;
    v119 = v69;
    v70 = v72;
    v121 = v70;
    v104[0] = v51;
    v104[1] = 3221225472;
    v104[2] = __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_2_60;
    v104[3] = &unk_1E4546098;
    v106 = v80;
    v107 = v79;
    v108 = *((double *)&v41 + 1) / (double)v76;
    v109 = v45 / (double)v86;
    v110 = v47 / (double)v37;
    v111 = *(double *)&v41 / (double)v77;
    v112 = v46 / (double)v86;
    v113 = v48 / (double)v37;
    v87 = _Block_copy(v114);
    v105 = v87;
    v54 = (uint64_t (**)(void *, id *))_Block_copy(v104);
    v55 = (void *)MEMORY[0x1A1B0B060]();
    v103 = 0;
    v56 = v54[2](v54, &v103);
    v57 = v103;
    if ((v56 & 1) == 0)
    {
      retstr->var0.var0 = 0;
      retstr->var1 = 0;
    }
    objc_autoreleasePoolPop(v55);
    if (!v56)
    {
      v59 = 0;
      v60 = 0;
      goto LABEL_29;
    }
    dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
    v58 = (void *)v149[5];
    if (v58)
    {
      if (a8)
LABEL_27:
        *a8 = objc_retainAutorelease(v58);
    }
    else
    {
      v58 = (void *)v129[5];
      if (!v58)
      {
        v59 = (void *)v180[3];
        v180[3] = 0;
        v60 = 1;
LABEL_29:
        v88[2]();
        if (a8 && v57)
          *a8 = objc_retainAutorelease(v57);
        if (v60)
        {
          v187[0] = *(id *)(*(_QWORD *)(-[VNSegmentationGenerator espressoMaskOutputBufferSizes](self, "espressoMaskOutputBufferSizes")+ 16)+ 16);
          v187[1] = v59;
          *(_OWORD *)v94 = 0u;
          v95 = 0u;
          v96 = 1065353216;
          std::__hash_table<std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},__CVBuffer *>>>::__emplace_unique_key_args<NSString * {__strong},std::pair<NSString * const {__strong},__CVBuffer *> const&>((uint64_t)v94, v187, (uint64_t)v187);
          v61 = v94[0];
          v62 = (unint64_t)v94[1];
          v94[0] = 0;
          v94[1] = 0;
          v97[0] = v61;
          v97[1] = (void *)v62;
          v98 = v95;
          v99 = v96;
          if (*((_QWORD *)&v95 + 1))
          {
            v63 = *(_QWORD *)(v95 + 8);
            if ((v62 & (v62 - 1)) != 0)
            {
              if (v63 >= v62)
                v63 %= v62;
            }
            else
            {
              v63 &= v62 - 1;
            }
            *((_QWORD *)v61 + v63) = &v98;
            v95 = 0uLL;
          }
          v101 = 0u;
          __p = 0u;
          v102 = 1065353216;
          std::__hash_table<std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},__CVBuffer *>>>::__hash_table((uint64_t)retstr, (uint64_t *)v97);
          std::__hash_table<std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},__CVBuffer *>>>::__hash_table((uint64_t)&retstr->var0.var1.var0.var1, (uint64_t *)&__p);
          retstr->var1 = 1;
          std::__hash_table<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>>>::__deallocate_node((id *)v101);
          v64 = (void *)__p;
          *(_QWORD *)&__p = 0;
          if (v64)
            operator delete(v64);
          std::__hash_table<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>>>::__deallocate_node((id *)v98);
          v65 = v97[0];
          v97[0] = 0;
          if (v65)
            operator delete(v65);
          std::__hash_table<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>>>::__deallocate_node(0);
          std::__hash_table<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>>>::__deallocate_node((id *)v95);
          v66 = v94[0];
          v94[0] = 0;
          if (v66)
            operator delete(v66);

        }
        _Block_object_dispose(&v128, 8);

        _Block_object_dispose(&v148, 8);
        _Block_object_dispose(v154, 8);
        _Block_object_dispose(v156, 8);
        std::deque<-[VNPersonSegmentationGeneratorLearnedMattingTiled _processTiledImageBuffer:inputMaskObservation:options:qosClass:error:]::OutputTileData>::~deque[abi:ne180100]((uint64_t)v157);
        goto LABEL_47;
      }
      if (a8)
        goto LABEL_27;
    }
    v59 = 0;
    v60 = 0;
    retstr->var0.var0 = 0;
    retstr->var1 = 0;
    goto LABEL_29;
  }
  retstr->var0.var0 = 0;
  retstr->var1 = 0;
LABEL_50:

  return result;
}

- (id)_bindPixelBufferToTexture:(__CVBuffer *)a3 error:(id *)a4
{
  OSType PixelFormatType;
  uint64_t v8;
  void *v9;
  id v11;

  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  switch(PixelFormatType)
  {
    case 0x42475241u:
      v8 = 80;
      goto LABEL_7;
    case 0x4C303066u:
      v8 = 55;
      goto LABEL_7;
    case 0x4C303068u:
      v8 = 25;
LABEL_7:
      -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:plane:error:](self->_postProcessingMetalContext, a3, v8, a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      return v9;
  }
  if (a4)
  {
    +[VNError errorForUnimplementedFunctionWithLocalizedDescription:](VNError, "errorForUnimplementedFunctionWithLocalizedDescription:", CFSTR("pixel format unimplemented"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    *a4 = v11;
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pasteTileComputePipelineState, 0);
  objc_storeStrong((id *)&self->_createTileWithScaleComputePipelineState, 0);
  objc_storeStrong((id *)&self->_postProcessingMetalContext, 0);
}

void __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke(_QWORD *a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(_QWORD *)(a1[4] + 8) + 24));
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = 0;
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(_QWORD *)(a1[5] + 8) + 24));
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(_QWORD *)(a1[6] + 8) + 24));
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
}

BOOL __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_2(uint64_t a1, _QWORD *a2)
{
  double Width;
  double v5;
  double v6;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  size_t Height;
  uint64_t v14;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "croppedBufferWithWidth:height:format:cropRect:options:error:", *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), 1111970369, 0, a2, *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = CVPixelBufferRetain((CVPixelBufferRef)objc_msgSend(*(id *)(a1 + 40), "pixelBuffer"));
    Width = (double)CVPixelBufferGetWidth(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
    v5 = Width / (double)CVPixelBufferGetHeight(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
    v6 = *(double *)(a1 + 120) / *(double *)(a1 + 128);
    if ((v5 >= 1.0 || v6 < 1.0) && (v5 < 1.0 || v6 >= 1.0))
      goto LABEL_14;
    objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "imageByApplyingCGOrientation:", 6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    CVPixelBufferRelease(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
    objc_msgSend(*(id *)(a1 + 48), "boundComputeDeviceForComputeStage:error:", CFSTR("VNComputeStageMain"), a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = *(void **)(a1 + 48);
      Height = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(v12, "renderCIImage:width:height:format:computeDevice:session:error:", v10, Height, CVPixelBufferGetWidth(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24)), 1278226534, v11, *(_QWORD *)(a1 + 56), a2);
      v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);

      if (v14)
      {
LABEL_14:
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144), 1278226536, a2);
        return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) != 0;
      }
    }
    else
    {

    }
  }
  return 0;
}

BOOL __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_34(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  objc_msgSend(*(id *)(a1 + 32), "_bindPixelBufferToTexture:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), a2);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    return 0;
  objc_msgSend(*(id *)(a1 + 32), "_bindPixelBufferToTexture:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), a2);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    return 0;
  -[VNMetalContext bindPixelBufferToMTL2DTexture:error:](*(void **)(*(_QWORD *)(a1 + 32) + 216), *(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24), a2);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) != 0;
}

void __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_40(uint64_t a1)
{
  int64x2_t *v2;
  void **v3;
  int64x2_t v4;
  unint64_t v5;
  __CVBuffer *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  int32x2_t v13;
  float v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  id *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  int32x2_t v33;
  id v34;
  float v35;
  float v36;
  uint64x2_t v37;
  _QWORD v38[4];
  id v39;
  __CVBuffer *v40;
  uint64x2_t v41;
  __CVBuffer *v42;
  __int128 v43;
  _QWORD v44[5];
  __int16 v45;
  __int16 v46;
  id v47;
  _QWORD v48[4];

  v48[2] = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48));
  +[VNError VNAssert:log:](VNError, "VNAssert:log:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 88) != 0, CFSTR("VNSegmentationGenerator - output tiles queue is empty"));
  v2 = *(int64x2_t **)(*(_QWORD *)(a1 + 64) + 8);
  v3 = (void **)v2[3].i64[1];
  v4 = vaddq_s64(v2[5], (int64x2_t)xmmword_1A15FB5A0);
  v5 = (unint64_t)v3[v2[5].i64[0] / 0xAAuLL] + 24 * (v2[5].i64[0] % 0xAAuLL);
  v37 = *(uint64x2_t *)v5;
  v6 = *(__CVBuffer **)(v5 + 16);
  v2[5] = v4;
  if (v4.i64[0] >= 0x154uLL)
  {
    operator delete(*v3);
    v2[3].i64[1] += 8;
    v2[5].i64[0] -= 170;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48));
  v7 = (void *)MEMORY[0x1A1B0B060]();
  v8 = *(void **)(a1 + 32);
  v47 = 0;
  objc_msgSend(v8, "_bindPixelBufferToTexture:error:", v6, &v47);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v47;
  v11 = v47;
  v12 = v11;
  if (v9)
  {
    v13 = vmovn_s64(vcvtq_s64_f64(vrndaq_f64(vmulq_f64(*(float64x2_t *)(a1 + 88), vcvtq_f64_u64(v37)))));
    v35 = 0.0;
    HIWORD(v14) = 0;
    v36 = 0.0;
    if (v13.i32[0])
    {
      LOWORD(v14) = *(_WORD *)(a1 + 120);
      v14 = (float)LODWORD(v14);
      v36 = v14;
    }
    v33 = v13;
    if (v13.i32[1])
    {
      LOWORD(v14) = *(_WORD *)(a1 + 122);
      v35 = (float)LODWORD(v14);
    }
    v34 = v11;
    objc_msgSend(*(id *)(a1 + 40), "commandBuffer", v7, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(_QWORD *)(v16 + 216);
    v18 = *(void **)(v16 + 232);
    v19 = objc_msgSend(v9, "width");
    v20 = objc_msgSend(v9, "height");
    v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    v48[0] = v9;
    v48[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = MEMORY[0x1E0C809B0];
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_2_47;
    v44[3] = &__block_descriptor_44_e36_v16__0___MTLComputeCommandEncoder__8l;
    v46 = v33.i16[2];
    v45 = v33.i16[0];
    v44[4] = __PAIR64__(LODWORD(v35), LODWORD(v36));
    -[VNMetalContext encodeCommandsForBuffer:state:label:width:height:textures:buffers:block:](v17, v15, v18, v19, v20, v22, v44);

    v12 = v34;
    v7 = v31;
    v10 = v32;
    v38[0] = v23;
    v38[1] = 3221225472;
    v38[2] = __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_3;
    v38[3] = &unk_1E4545F88;
    v40 = v6;
    v41 = v37;
    v42 = v6;
    v43 = *(_OWORD *)(a1 + 104);
    v39 = *(id *)(a1 + 48);
    objc_msgSend(v15, "addCompletedHandler:", v38);
    objc_msgSend(v15, "commit");

  }
  else
  {
    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v26 = *(_QWORD *)(v24 + 40);
    v25 = (id *)(v24 + 40);
    if (!v26)
      objc_storeStrong(v25, v10);
    CVPixelBufferRelease(v6);
  }

  objc_autoreleasePoolPop(v7);
  if (v9)
    v27 = v12 == 0;
  else
    v27 = 1;
  if (!v27)
  {
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v30 = *(_QWORD *)(v28 + 40);
    v29 = (id *)(v28 + 40);
    if (!v30)
      objc_storeStrong(v29, v10);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }

}

__CVBuffer *__121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_4(uint64_t a1, void *a2, void *a3, size_t a4, size_t a5, uint64_t a6, _QWORD *a7, double a8, double a9, double a10, double a11)
{
  id v21;
  id v22;
  unint64_t v23;
  unint64_t v24;
  __CVBuffer *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  float v32;
  uint64_t v33;
  float v34;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  _QWORD v39[6];
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
  v21 = a2;
  v22 = a3;
  v23 = objc_msgSend(v22, "width");
  v24 = objc_msgSend(v22, "height");
  v25 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, a4, a5, a6, a7);
  if (v25)
  {
    objc_msgSend(*(id *)(a1 + 32), "_bindPixelBufferToTexture:error:", v25, a7);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
    {
      v28 = *(_QWORD *)(a1 + 32);
      v37 = *(void **)(v28 + 224);
      v38 = *(_QWORD *)(v28 + 216);
      v36 = objc_msgSend(v26, "width");
      v29 = objc_msgSend(v27, "height");
      v40[0] = v22;
      v40[1] = v27;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v31 = a8 * (double)v23;
      v32 = a9 * (double)v24;
      *((float *)&v31 + 1) = v32;
      *(float *)&v33 = a10 * (double)v23 / (float)a4;
      v34 = a11 * (double)v24 / (float)a5;
      *((float *)&v33 + 1) = v34;
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_5;
      v39[3] = &__block_descriptor_48_e36_v16__0___MTLComputeCommandEncoder__8l;
      v39[4] = v31;
      v39[5] = v33;
      -[VNMetalContext encodeCommandsForBuffer:state:label:width:height:textures:buffers:block:](v38, v21, v37, v36, v29, v30, v39);

    }
    else
    {
      CVPixelBufferRelease(v25);
      v25 = 0;
    }

  }
  return v25;
}

BOOL __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12)
{
  void *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  _BOOL8 v31;
  void *v32;
  __int128 v33;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t *v41;
  uint64_t *v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;

  objc_msgSend(*(id *)(a1 + 32), "commandBuffer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 0;
  v24 = *(_QWORD *)(a1 + 72);
  v25 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
  v26 = (_QWORD *)objc_msgSend(*(id *)(a1 + 40), "espressoInputImageSize");
  v54 = (*(uint64_t (**)(uint64_t, void *, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, double, double, double, double))(v24 + 16))(v24, v23, v25, *v26, v26[1], 1111970369, a4, a5, a6, a7, a8);
  if (v52[3])
  {
    v47 = 0;
    v48 = &v47;
    v49 = 0x2020000000;
    v50 = 0;
    v27 = *(_QWORD *)(a1 + 72);
    v28 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
    v29 = (_QWORD *)objc_msgSend(*(id *)(a1 + 40), "espressoInputMaskSize");
    v50 = (*(uint64_t (**)(uint64_t, void *, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, double, double, double, double))(v27 + 16))(v27, v23, v28, *v29, v29[1], 1278226536, a4, a9, a10, a11, a12);
    v30 = v48[3];
    v31 = v30 != 0;
    if (v30)
    {
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_7;
      v36[3] = &unk_1E4546048;
      v32 = *(void **)(a1 + 48);
      v36[4] = *(_QWORD *)(a1 + 40);
      v41 = &v51;
      v37 = v32;
      v42 = &v47;
      v38 = *(id *)(a1 + 56);
      v45 = a2;
      v46 = a3;
      v33 = *(_OWORD *)(a1 + 120);
      v43 = *(_OWORD *)(a1 + 104);
      v44 = v33;
      v39 = *(id *)(a1 + 64);
      v40 = *(id *)(a1 + 80);
      objc_msgSend(v23, "addCompletedHandler:", v36);
      objc_msgSend(v23, "commit");

    }
    else
    {
      CVPixelBufferRelease((CVPixelBufferRef)v52[3]);
      v52[3] = 0;
    }
    _Block_object_dispose(&v47, 8);
  }
  else
  {
    v31 = 0;
  }
  _Block_object_dispose(&v51, 8);

  return v31;
}

uint64_t __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_2_60(uint64_t a1)
{
  unint64_t v1;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  double v6;
  double v7;
  double v8;

  v1 = *(_QWORD *)(a1 + 48);
  if (!v1)
    return 1;
  v3 = 0;
  v4 = *(_QWORD *)(a1 + 40);
  while (!v4)
  {
LABEL_8:
    if (++v3 >= v1)
      return 1;
  }
  v5 = 0;
  v6 = *(double *)(a1 + 72);
  v7 = *(double *)(a1 + 56) + v6 * (double)v3;
  v8 = v6 * (double)v3;
  while (((*(uint64_t (**)(double, double, double, double, double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(a1 + 80) + *(double *)(a1 + 64) * (double)v5, v7, *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 64) * (double)v5, v8, *(double *)(a1 + 88), *(double *)(a1 + 96)) & 1) != 0)
  {
    ++v5;
    v4 = *(_QWORD *)(a1 + 40);
    if (v5 >= v4)
    {
      v1 = *(_QWORD *)(a1 + 48);
      goto LABEL_8;
    }
  }
  return 0;
}

- (uint64_t)_processTiledImageBuffer:(uint64_t)a1 inputMaskObservation:options:qosClass:error:
{
  void **v2;
  void **v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(void ***)(a1 + 8);
  v3 = *(void ***)(a1 + 16);
  *(_QWORD *)(a1 + 40) = 0;
  v4 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      v3 = *(void ***)(a1 + 16);
      v2 = (void **)(*(_QWORD *)(a1 + 8) + 8);
      *(_QWORD *)(a1 + 8) = v2;
      v4 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  v5 = v4 >> 3;
  if (v5 == 1)
  {
    v6 = 85;
    goto LABEL_7;
  }
  if (v5 == 2)
  {
    v6 = 170;
LABEL_7:
    *(_QWORD *)(a1 + 32) = v6;
  }
  if (v2 != v3)
  {
    do
    {
      v7 = *v2++;
      operator delete(v7);
    }
    while (v2 != v3);
    v9 = *(_QWORD *)(a1 + 8);
    v8 = *(_QWORD *)(a1 + 16);
    if (v8 != v9)
      *(_QWORD *)(a1 + 16) = v8 + ((v9 - v8 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  char v9;
  id v10;
  id v11;
  uint64_t v12;
  id *v13;
  uint64_t v14;
  _QWORD *v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  BOOL v22;
  unint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  int64_t v33;
  char *v34;
  char *v35;
  char *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  char *v40;
  void *v41;
  char *v42;
  char *v43;
  unint64_t v44;
  unint64_t v45;
  char *v46;
  char *v47;
  BOOL v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  char *v53;
  unint64_t v54;
  char *v55;
  char *v56;
  char *v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  void *v69;
  unint64_t v70;
  char *v71;
  char *v72;
  uint64_t v73;
  char *v74;
  char *v75;
  uint64_t v76;
  char *v77;
  char *v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  size_t v86;
  unint64_t v87;
  char *v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  unint64_t v94;
  _QWORD *v95;
  void *v96;
  void *v97;
  id v98;
  id v99;
  void *v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  id v105;
  _QWORD aBlock[5];
  id v107;
  id v108;
  uint64_t v109;
  uint64_t v110;
  _QWORD *v111;
  uint64_t *v112;
  uint64_t v113;
  _QWORD v114[5];
  __int128 v115;
  __int128 v116;
  uint64_t v117;
  int v118;
  uint64_t v119;
  uint64_t *v120;
  uint64_t v121;
  uint64_t v122;

  v3 = a2;
  v121 = 0x2020000000;
  v114[2] = 0x5812000000;
  v114[3] = __Block_byref_object_copy__55;
  v114[4] = __Block_byref_object_dispose__56;
  v115 = 0u;
  v116 = 0u;
  v118 = 1065353216;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[2] = __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_57;
  aBlock[3] = &unk_1E4546020;
  v4 = *(_QWORD *)(a1 + 72);
  v5 = *(void **)(a1 + 40);
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v109 = v4;
  v119 = 0;
  v120 = &v119;
  v122 = 0;
  v114[0] = 0;
  v114[1] = v114;
  v117 = 0;
  aBlock[1] = 3221225472;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 80);
  v107 = v6;
  v110 = v7;
  v108 = *(id *)(a1 + 48);
  v111 = v114;
  v112 = &v119;
  v113 = *(_QWORD *)(a1 + 112);
  v8 = _Block_copy(aBlock);
  v105 = 0;
  v9 = VNExecuteBlock(v8, (uint64_t)&v105);
  v10 = v105;
  v11 = v105;
  if ((v9 & 1) == 0)
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v14 = *(_QWORD *)(v12 + 40);
    v13 = (id *)(v12 + 40);
    if (!v14)
      objc_storeStrong(v13, v10);
  }
  v103 = *(_QWORD *)(a1 + 128);
  v104 = *(_QWORD *)(a1 + 120);
  v102 = v120[3];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 48));
  v15 = *(_QWORD **)(*(_QWORD *)(a1 + 104) + 8);
  v16 = (char *)v15[8];
  v17 = (char *)v15[7];
  v18 = (v16 - v17) >> 3;
  v19 = v16 - v17;
  if (v16 == v17)
    v20 = 0;
  else
    v20 = 170 * v18 - 1;
  v21 = v15[10];
  if (v20 == v15[11] + v21)
  {
    v22 = v21 >= 0xAA;
    v23 = v21 - 170;
    if (v22)
    {
      v15[10] = v23;
      v26 = *(_QWORD *)v17;
      v25 = v17 + 8;
      v24 = v26;
      v15[7] = v25;
      if (v16 == (char *)v15[9])
      {
        v100 = v8;
        v27 = (char *)v15[6];
        if (v25 <= v27)
        {
          if (v16 == v27)
            v45 = 1;
          else
            v45 = (v16 - v27) >> 2;
          if (v45 >> 61)
            goto LABEL_104;
          v46 = (char *)operator new(8 * v45);
          v47 = &v46[8 * (v45 >> 2)];
          v49 = v16 - v25;
          v48 = v16 == v25;
          v16 = v47;
          if (!v48)
          {
            v16 = &v47[v49 & 0xFFFFFFFFFFFFFFF8];
            v50 = 8 * (v49 >> 3);
            v51 = &v46[8 * (v45 >> 2)];
            do
            {
              v52 = *(_QWORD *)v25;
              v25 += 8;
              *(_QWORD *)v51 = v52;
              v51 += 8;
              v50 -= 8;
            }
            while (v50);
          }
          v15[6] = v46;
          v15[7] = v47;
          v15[8] = v16;
          v15[9] = &v46[8 * v45];
          if (v27)
          {
            operator delete(v27);
            v16 = (char *)v15[8];
          }
        }
        else
        {
          v28 = (v25 - v27) >> 3;
          if (v28 >= -1)
            v29 = v28 + 1;
          else
            v29 = v28 + 2;
          v30 = -(v29 >> 1);
          v31 = v29 >> 1;
          v32 = &v25[-8 * v31];
          v33 = v16 - v25;
          if (v16 != v25)
          {
            memmove(&v25[-8 * v31], v25, v16 - v25);
            v16 = (char *)v15[7];
          }
          v34 = &v16[8 * v30];
          v16 = &v32[v33];
          v15[7] = v34;
          v15[8] = &v32[v33];
          v8 = v100;
        }
      }
      *(_QWORD *)v16 = v24;
      v15[8] += 8;
      goto LABEL_100;
    }
    v99 = v11;
    v101 = v8;
    v35 = (char *)v15[9];
    v36 = (char *)v15[6];
    if (v18 < (unint64_t)((v35 - v36) >> 3))
    {
      v37 = operator new(0xFF0uLL);
      v38 = v37;
      if (v35 != v16)
      {
        *(_QWORD *)v16 = v37;
        v11 = v99;
LABEL_99:
        v15[8] += 8;
        v8 = v101;
        goto LABEL_100;
      }
      if (v17 == v36)
      {
        if (v16 == v17)
          v70 = 1;
        else
          v70 = (v35 - v17) >> 2;
        if (v70 >> 61)
          goto LABEL_104;
        v71 = (char *)operator new(8 * v70);
        v53 = &v71[(2 * v70 + 6) & 0xFFFFFFFFFFFFFFF8];
        v72 = v53;
        v11 = v99;
        if (v16 != v17)
        {
          v73 = 8 * v18;
          v74 = &v71[(2 * v70 + 6) & 0xFFFFFFFFFFFFFFF8];
          v75 = v17;
          v72 = &v53[8 * v18];
          do
          {
            v76 = *(_QWORD *)v75;
            v75 += 8;
            *(_QWORD *)v74 = v76;
            v74 += 8;
            v73 -= 8;
          }
          while (v73);
        }
        v15[6] = v71;
        v15[7] = v53;
        v15[8] = v72;
        v15[9] = &v71[8 * v70];
        if (v17)
        {
          operator delete(v17);
          v53 = (char *)v15[7];
        }
      }
      else
      {
        v53 = v17;
        v11 = v99;
      }
      *((_QWORD *)v53 - 1) = v38;
      v77 = (char *)v15[7];
      v78 = (char *)v15[8];
      v15[7] = v77 - 8;
      v79 = *((_QWORD *)v77 - 1);
      v15[7] = v77;
      if (v78 != (char *)v15[9])
      {
LABEL_98:
        *(_QWORD *)v78 = v79;
        goto LABEL_99;
      }
      v80 = (char *)v15[6];
      if (v77 > v80)
      {
        v81 = (v77 - v80) >> 3;
        if (v81 >= -1)
          v82 = v81 + 1;
        else
          v82 = v81 + 2;
        v83 = -(v82 >> 1);
        v84 = v82 >> 1;
        v85 = &v77[-8 * v84];
        v86 = v78 - v77;
        if (v86)
        {
          memmove(&v77[-8 * v84], v77, v86);
          v77 = (char *)v15[7];
        }
        v78 = &v85[v86];
        v15[7] = &v77[8 * v83];
        v15[8] = v78;
        goto LABEL_98;
      }
      if (v78 == v80)
        v87 = 1;
      else
        v87 = (v78 - v80) >> 2;
      if (!(v87 >> 61))
      {
        v88 = (char *)operator new(8 * v87);
        v89 = &v88[8 * (v87 >> 2)];
        v90 = v78 - v77;
        v48 = v78 == v77;
        v78 = v89;
        v11 = v99;
        if (!v48)
        {
          v78 = &v89[v90 & 0xFFFFFFFFFFFFFFF8];
          v91 = 8 * (v90 >> 3);
          v92 = &v88[8 * (v87 >> 2)];
          do
          {
            v93 = *(_QWORD *)v77;
            v77 += 8;
            *(_QWORD *)v92 = v93;
            v92 += 8;
            v91 -= 8;
          }
          while (v91);
        }
        v15[6] = v88;
        v15[7] = v89;
        v15[8] = v78;
        v15[9] = &v88[8 * v87];
        if (v80)
        {
          operator delete(v80);
          v78 = (char *)v15[8];
        }
        goto LABEL_98;
      }
LABEL_104:
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    if (v35 == v36)
      v39 = 1;
    else
      v39 = (v35 - v36) >> 2;
    if (v39 >> 61)
      goto LABEL_104;
    v40 = (char *)operator new(8 * v39);
    v98 = v3;
    v41 = operator new(0xFF0uLL);
    v42 = &v40[8 * v18];
    v43 = &v40[8 * v39];
    if (v18 == v39)
    {
      v97 = v41;
      v11 = v99;
      if (v19 < 1)
      {
        if (v16 == v17)
          v54 = 1;
        else
          v54 = v19 >> 2;
        if (v54 >> 61)
          std::__throw_bad_array_new_length[abi:ne180100]();
        v42 = (char *)operator new(8 * v54);
        v43 = &v42[8 * v54];
        operator delete(v40);
        v17 = (char *)v15[7];
        v16 = (char *)v15[8];
        v40 = v42;
      }
      else
      {
        v44 = v18 + 2;
        if (v18 >= -1)
          v44 = v18 + 1;
        v42 -= 8 * (v44 >> 1);
      }
      v41 = v97;
    }
    else
    {
      v11 = v99;
    }
    *(_QWORD *)v42 = v41;
    v55 = v42 + 8;
    if (v16 == v17)
    {
      v68 = v42;
      v57 = v42 + 8;
    }
    else
    {
      do
      {
        if (v42 == v40)
        {
          if (v55 >= v43)
          {
            if (v43 == v42)
              v60 = 1;
            else
              v60 = (v43 - v42) >> 2;
            if (v60 >> 61)
              std::__throw_bad_array_new_length[abi:ne180100]();
            v61 = (char *)operator new(8 * v60);
            v40 = v61;
            v56 = &v61[(2 * v60 + 6) & 0xFFFFFFFFFFFFFFF8];
            v57 = v56;
            v62 = v55 - v42;
            if (v55 != v42)
            {
              v57 = &v56[v62 & 0xFFFFFFFFFFFFFFF8];
              v63 = 8 * (v62 >> 3);
              v64 = &v61[(2 * v60 + 6) & 0xFFFFFFFFFFFFFFF8];
              v65 = v42;
              do
              {
                v66 = *(_QWORD *)v65;
                v65 += 8;
                *(_QWORD *)v64 = v66;
                v64 += 8;
                v63 -= 8;
              }
              while (v63);
            }
            v43 = &v61[8 * v60];
            operator delete(v42);
          }
          else
          {
            v58 = (v43 - v55) >> 3;
            if (v58 >= -1)
              v59 = v58 + 1;
            else
              v59 = v58 + 2;
            v57 = &v55[8 * (v59 >> 1)];
            v56 = &v42[8 * (v59 >> 1)];
            if (v55 == v42)
            {
              v40 = v55;
            }
            else
            {
              memmove(&v42[8 * (v59 >> 1)], v42, v55 - v42);
              v40 = v42;
            }
          }
        }
        else
        {
          v56 = v42;
          v57 = v55;
        }
        v67 = *((_QWORD *)v16 - 1);
        v16 -= 8;
        *((_QWORD *)v56 - 1) = v67;
        v68 = v56 - 8;
        v55 = v57;
        v42 = v68;
      }
      while (v16 != (char *)v15[7]);
    }
    v69 = (void *)v15[6];
    v15[6] = v40;
    v15[7] = v68;
    v15[8] = v57;
    v15[9] = v43;
    v3 = v98;
    v8 = v101;
    if (v69)
      operator delete(v69);
  }
LABEL_100:
  v94 = v15[11] + v15[10];
  v95 = (_QWORD *)(*(_QWORD *)(v15[7] + 8 * (v94 / 0xAA)) + 24 * (v94 % 0xAA));
  *v95 = v104;
  v95[1] = v103;
  v95[2] = v102;
  ++v15[11];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 48));
  dispatch_async(*(dispatch_queue_t *)(a1 + 56), *(dispatch_block_t *)(a1 + 64));

  _Block_object_dispose(v114, 8);
  std::__hash_table<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>>>::__deallocate_node(*((id **)&v116 + 1));
  v96 = (void *)*((_QWORD *)&v115 + 1);
  *((_QWORD *)&v115 + 1) = 0;
  if (v96)
    operator delete(v96);
  _Block_object_dispose(&v119, 8);

}

BOOL __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_57(uint64_t a1, uint64_t a2)
{
  int v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "bindPixelBuffer:toNetworkBlobName:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(_QWORD *)(a1 + 40), a2) & 1) != 0&& objc_msgSend(*(id *)(a1 + 32), "bindPixelBuffer:toNetworkBlobName:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), *(_QWORD *)(a1 + 48), a2)&& (objc_msgSend(*(id *)(a1 + 32), "initializeOutputConfidenceBuffers:", *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 48), (objc_msgSend(*(id *)(a1 + 32), "executePlanAndReturnError:", a2) & 1) != 0))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = +[VNEspressoHelpers createCVPixelBufferWithPixelFormat:fromImageInEspressoBuffer:error:](VNEspressoHelpers, "createCVPixelBufferWithPixelFormat:fromImageInEspressoBuffer:error:", 1278226534, *(_QWORD *)(a1 + 88), a2);
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) == 0;
  }
  else
  {
    v4 = 2;
  }
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  return v4 == 0;
}

void __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setBytes:length:atIndex:", a1 + 32, 8, 0);
  objc_msgSend(v3, "setBytes:length:atIndex:", a1 + 40, 8, 1);

}

void __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_2_47(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setBytes:length:atIndex:", a1 + 40, 4, 0);
  objc_msgSend(v3, "setBytes:length:atIndex:", a1 + 32, 8, 1);

}

void __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_3(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 40));
  if (*(_QWORD *)(a1 + 48) + 1 == *(_QWORD *)(a1 + 72) && *(_QWORD *)(a1 + 56) + 1 == *(_QWORD *)(a1 + 80))
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
