@implementation BWTiledEspressoInferenceProvider

- (NSArray)outputVideoRequirements
{
  return self->_outputVideoRequirements;
}

- (NSArray)inputVideoRequirements
{
  return self->_inputVideoRequirements;
}

- (NSArray)cloneVideoRequirements
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (unsigned)allowedPixelBufferCompressionDirection
{
  return 0;
}

+ (id)videoFormatWithPixelFormat:(unsigned int)a3 size:(BOOL)a4 appliesFinalCropRect:
{
  uint64_t v4;

  return (id)objc_msgSend(a1, "videoFormatWithPixelFormat:size:sliceCount:includesInvalidContent:appliesFinalCropRect:", *(_QWORD *)&a3, a4, 0, 0, v4);
}

+ (id)videoFormatWithPixelFormat:(unsigned int)a3 size:(unsigned int)a4 sliceCount:(BOOL)a5 includesInvalidContent:(BOOL)a6 appliesFinalCropRect:
{
  int v6;
  int v7;
  _BOOL8 v8;
  _BOOL4 v9;
  uint64_t v11;
  BWInferenceVideoFormatRequirements *v12;
  id v13;
  BWInferenceVideoFormatRequirements *v15;
  _QWORD v16[2];

  v7 = v6;
  v8 = a6;
  v9 = a5;
  v11 = *(_QWORD *)&a3;
  v16[1] = *MEMORY[0x1E0C80C00];
  v12 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v12, "setWidth:", (unsigned __int16)a4);
  -[BWVideoFormatRequirements setHeight:](v12, "setHeight:", HIWORD(a4));
  -[BWVideoFormatRequirements setSliceCount:](v12, "setSliceCount:", v9);
  if (v7)
    v13 = +[BWInferenceFinalRectCropDescriptor finalCropRectDescriptorWithName:](BWInferenceFinalRectCropDescriptor, "finalCropRectDescriptorWithName:", CFSTR("TiledEspresso"));
  else
    v13 = 0;
  -[BWInferenceVideoFormatRequirements setCropDescriptor:](v12, "setCropDescriptor:", v13);
  v16[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v12, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1));
  -[BWInferenceVideoFormatRequirements setDeviceOriented:](v12, "setDeviceOriented:", 0);
  -[BWVideoFormatRequirements setBytesPerRowAlignment:](v12, "setBytesPerRowAlignment:", 64);
  -[BWInferenceVideoFormatRequirements setIncludesInvalidContent:](v12, "setIncludesInvalidContent:", v8);
  v15 = v12;
  return +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1));
}

+ (id)videoFormatWithPixelFormat:(unsigned int)a3 size:
{
  return (id)objc_msgSend(a1, "videoFormatWithPixelFormat:size:sliceCount:includesInvalidContent:appliesFinalCropRect:", *(_QWORD *)&a3);
}

- (BWTiledEspressoInferenceProvider)initWithConfiguration:(id)a3 inputVideoRequirements:(id)a4 outputVideoRequirements:(id)a5 resourceProvider:(id)a6
{
  BWTiledEspressoInferenceProvider *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BWTiledEspressoInferenceProvider;
  v10 = -[BWTiledEspressoInferenceProvider init](&v12, sel_init);
  if (v10)
  {
    v10->_configuration = (BWTiledEspressoInferenceConfiguration *)a3;
    objc_storeWeak((id *)&v10->_resourceProvider, a6);
    v10->_inputVideoRequirements = (NSArray *)a4;
    v10->_outputVideoRequirements = (NSArray *)a5;
    *(_DWORD *)v10->_maxTileCount = 0;
  }
  return v10;
}

+ (void)initialize
{
  objc_opt_class();
}

- (int)type
{
  return -[BWInferenceConfiguration inferenceType](self->_configuration, "inferenceType");
}

+ (id)videoFormatWithPixelFormat:(unsigned int)a3 size:(BOOL)a4 includesInvalidContent:(BOOL)a5 appliesFinalCropRect:
{
  uint64_t v5;

  return (id)objc_msgSend(a1, "videoFormatWithPixelFormat:size:sliceCount:includesInvalidContent:appliesFinalCropRect:", *(_QWORD *)&a3, a4, 0, a5, v5);
}

+ (id)videoFormatWithPixelFormat:(unsigned int)a3 size:(unsigned int)a4 sliceCount:
{
  return (id)objc_msgSend(a1, "videoFormatWithPixelFormat:size:sliceCount:includesInvalidContent:appliesFinalCropRect:", *(_QWORD *)&a3, *(_QWORD *)&a4);
}

+ (id)videoFormatWithPixelFormat:(unsigned int)a3 size:(unsigned int)a4 sliceCount:(BOOL)a5 appliesFinalCropRect:
{
  uint64_t v5;

  return (id)objc_msgSend(a1, "videoFormatWithPixelFormat:size:sliceCount:includesInvalidContent:appliesFinalCropRect:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5, 0, v5);
}

+ (id)videoFormatWithPixelFormat:(unsigned int)a3 size:(BOOL)a4 includesInvalidContent:
{
  uint64_t v4;

  return (id)objc_msgSend(a1, "videoFormatWithPixelFormat:size:sliceCount:includesInvalidContent:appliesFinalCropRect:", *(_QWORD *)&a3, a4, 0, v4, 0);
}

+ (id)videoFormatWithPixelFormat:(unsigned int)a3 size:(unsigned int)a4 sliceCount:(BOOL)a5 includesInvalidContent:
{
  return (id)objc_msgSend(a1, "videoFormatWithPixelFormat:size:sliceCount:includesInvalidContent:appliesFinalCropRect:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWTiledEspressoInferenceProvider;
  -[BWTiledEspressoInferenceProvider dealloc](&v3, sel_dealloc);
}

- (NSArray)inputMetadataRequirements
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSArray)outputMetadataRequirements
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (int)executionTarget
{
  return 1;
}

- (NSSet)preventionReasons
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (BWInferenceExecutable)executable
{
  return 0;
}

- (BWInferenceExtractable)extractable
{
  return 0;
}

- (int)loadNetworkWithURL:(id)a3 configName:(id)a4 inferenceType:(int)a5 maxTileCount:(id)a6 inputFormatsByBindingName:(id)a7 outputFormatsByBindingName:(id)a8 additionalVideoRequirements:
{
  int result;
  int v11;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  BWEspressoInferenceProvider *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id Weak;
  BWEspressoInferenceProvider *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSArray *v37;
  uint64_t v38;
  void *v39;
  id v40;
  unsigned int v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;
  void *v55;

  v54 = *MEMORY[0x1E0C80C00];
  if (self->_espressoProvider)
    return 0;
  v11 = (int)a6;
  v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v43 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v42 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (!-[NSArray count](self->_inputVideoRequirements, "count"))
    return FigSignalErrorAt();
  if (!-[NSArray count](self->_outputVideoRequirements, "count"))
    return FigSignalErrorAt();
  if (!objc_msgSend(a7, "count"))
    return FigSignalErrorAt();
  if (!objc_msgSend(a8, "count"))
    return FigSignalErrorAt();
  v41 = a5;
  v18 = a3;
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", objc_msgSend(a3, "path")) & 1) == 0)return FigSignalErrorAt();
  v39 = (void *)v17;
  v40 = a8;
  v19 = objc_msgSend(objc_loadWeak((id *)&self->_resourceProvider), "espressoContextForExecutionTarget:", 3);
  *(_DWORD *)self->_maxTileCount = v11;
  v20 = [BWEspressoInferenceProvider alloc];
  v21 = v18;
  v22 = a4;
  v23 = -[BWInferenceConfiguration priority](self->_configuration, "priority");
  v24 = objc_msgSend(MEMORY[0x1E0C99E60], "set");
  Weak = objc_loadWeak((id *)&self->_resourceProvider);
  LODWORD(v38) = -[BWTiledEspressoInferenceProvider allowedPixelBufferCompressionDirection](self, "allowedPixelBufferCompressionDirection");
  v26 = -[BWEspressoInferenceProvider initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:](v20, "initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:", v41, v21, v22, v19, 3, v23, v24, Weak, v38, 2);
  self->_espressoProvider = v26;
  if (!v26)
    return FigSignalErrorAt();
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v27 = objc_msgSend(a7, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v49;
LABEL_11:
    v30 = 0;
    while (1)
    {
      if (*(_QWORD *)v49 != v29)
        objc_enumerationMutation(a7);
      v31 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v30);
      objc_msgSend(v43, "addObject:", v31);
      objc_msgSend(v16, "addObject:", -[BWEspressoInferenceProvider bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:](self->_espressoProvider, "bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:", v31, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("TileInput_%i_%@"), -[BWInferenceConfiguration inferenceType](self->_configuration, "inferenceType"), v31), objc_msgSend(a7, "objectForKeyedSubscript:", v31)));
      if (!objc_msgSend(v16, "lastObject"))
        break;
      if (v28 == ++v30)
      {
        v28 = objc_msgSend(a7, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
        if (v28)
          goto LABEL_11;
        goto LABEL_17;
      }
    }
  }
  else
  {
LABEL_17:
    self->_tileInputBindingNames = (NSArray *)v43;
    self->_tileInputVideoRequirements = (NSArray *)v16;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v32 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    if (!v32)
    {
LABEL_25:
      self->_tileOutputBindingNames = (NSArray *)v42;
      self->_tileOutputVideoRequirements = (NSArray *)v39;
      v37 = v55;
      result = 0;
      self->_additionalVideoRequirements = v37;
      return result;
    }
    v33 = v32;
    v34 = *(_QWORD *)v45;
LABEL_19:
    v35 = 0;
    while (1)
    {
      if (*(_QWORD *)v45 != v34)
        objc_enumerationMutation(v40);
      v36 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v35);
      objc_msgSend(v42, "addObject:", v36);
      objc_msgSend(v39, "addObject:", -[BWEspressoInferenceProvider bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:](self->_espressoProvider, "bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:", v36, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("TileOutput_%i_%@"), -[BWInferenceConfiguration inferenceType](self->_configuration, "inferenceType"), v36), objc_msgSend(v40, "objectForKeyedSubscript:", v36)));
      if (!objc_msgSend(v39, "lastObject"))
        break;
      if (v33 == ++v35)
      {
        v33 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        if (v33)
          goto LABEL_19;
        goto LABEL_25;
      }
    }
  }
  return FigSignalErrorAt();
}

- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7 currentTileCount:
{
  unsigned int v7;
  unsigned int v8;
  BWTiledEspressoInferenceProvider *v11;
  id v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  CFTypeRef *v18;
  CFTypeRef *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BWTiledEspressoInferenceProvider *v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  NSArray *tileOutputVideoRequirements;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  NSArray *additionalVideoRequirements;
  uint64_t v39;
  uint16x4_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  uint64_t v44;
  uint64_t v45;
  const void *v46;
  uint64_t v47;
  void *v48;
  uint64_t k;
  uint64_t v50;
  _BOOL8 v51;
  int v52;
  uint64_t v53;
  CFTypeRef *v54;
  uint64_t v55;
  uint64_t v56;
  _BOOL4 v57;
  BWEspressoInferenceProvider *espressoProvider;
  uint64_t v59;
  uint64_t v60;
  OS_dispatch_queue *espressoWorkQueue;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  int v69;
  uint64_t v70;
  CFTypeRef *v71;
  uint64_t v72;
  const void *v73;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  unsigned int v78;
  unsigned int v79;
  int v80;
  int v81;
  id v82;
  unsigned int v83;
  unsigned __int16 v84;
  __int32 v85;
  uint64_t v86;
  unsigned int v89;
  void *v90;
  unsigned int v91;
  char v92;
  int v93;
  uint64_t v94;
  void *v95;
  char *v96;
  void *v97;
  void *v98;
  void *v99;
  unsigned int v100;
  _QWORD v101[6];
  int v102;
  __int128 v103;
  int64_t var3;
  id v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _BYTE v114[128];
  _BYTE v115[128];
  uint64_t v116;

  v8 = v7;
  v11 = self;
  v116 = *MEMORY[0x1E0C80C00];
  v12 = -[BWTiledEspressoInferenceProvider outputRequirementsToProduceForInputSampleBuffer:](self, "outputRequirementsToProduceForInputSampleBuffer:", a3, a4, a5, a6);
  v13 = -[NSArray count](v11->_inputVideoRequirements, "count");
  v14 = -[NSArray count](v11->_tileInputVideoRequirements, "count");
  v91 = objc_msgSend(v12, "count");
  v15 = -[NSArray count](v11->_tileOutputVideoRequirements, "count");
  if (objc_msgSend((id)objc_msgSend(a4, "espressoStorages"), "count") != 2
    || (unsigned __int16)v8 > *(unsigned __int16 *)v11->_maxTileCount
    || HIWORD(v8) > *(unsigned __int16 *)&v11->_maxTileCount[2])
  {
    v17 = 0;
    goto LABEL_110;
  }
  v83 = HIWORD(v8);
  v79 = v8;
  v80 = (unsigned __int16)v8;
  v95 = v12;
  v16 = v13;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v13);
  v18 = (CFTypeRef *)malloc_type_calloc(2 * v14, 8uLL, 0x2004093837F09uLL);
  if (!v18)
  {
LABEL_110:
    v62 = FigSignalErrorAt();
    v98 = 0;
    v99 = 0;
    v20 = 0;
    v97 = 0;
    v69 = 1;
    goto LABEL_93;
  }
  v19 = v18;
  v94 = v14;
  v97 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:");
  v98 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSArray count](v11->_additionalVideoRequirements, "count"));
  v86 = v15;
  v99 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:");
  v20 = (char *)malloc_type_calloc(v91, 8uLL, 0x2004093837F09uLL);
  v90 = v17;
  if (!v20)
    goto LABEL_107;
  if (v13)
  {
    v21 = 0;
    while (1)
    {
      v22 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](v11->_inputVideoRequirements, "objectAtIndexedSubscript:", v21), "attachedMediaKey");
      objc_msgSend(v17, "setObject:forKeyedSubscript:", objc_msgSend(a4, "pixelBufferForRequirement:", -[NSArray objectAtIndexedSubscript:](v11->_inputVideoRequirements, "objectAtIndexedSubscript:", v21)), v22);
      if (!objc_msgSend(v17, "objectForKeyedSubscript:", v22))
        break;
      if (v16 == ++v21)
        goto LABEL_10;
    }
LABEL_107:
    v62 = FigSignalErrorAt();
    v69 = 1;
    goto LABEL_81;
  }
LABEL_10:
  v96 = v20;
  v89 = v14;
  if (v14)
  {
    v23 = 0;
    do
    {
      v24 = v11;
      v25 = -[NSArray objectAtIndexedSubscript:](v11->_tileInputVideoRequirements, "objectAtIndexedSubscript:", v23);
      v26 = 0;
      v27 = 1;
      do
      {
        v28 = v27;
        v29 = v26 | (2 * v23);
        v30 = objc_msgSend((id)objc_msgSend(a4, "pixelBufferPoolForRequirement:", v25), "newPixelBuffer");
        v19[v29] = (CFTypeRef)v30;
        if (!v30)
        {
          v62 = FigSignalErrorAt();
          v69 = 1;
          v11 = v24;
          goto LABEL_80;
        }
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "espressoStorages"), "objectAtIndexedSubscript:", v26), "setPixelBuffer:forRequirement:", v19[v29], v25);
        v27 = 0;
        v26 = 1;
      }
      while ((v28 & 1) != 0);
      ++v23;
      v11 = v24;
    }
    while (v23 != v94);
  }
  v82 = a7;
  v31 = 0;
  v32 = 1;
  do
  {
    v92 = v32;
    v112 = 0u;
    v113 = 0u;
    v110 = 0u;
    v111 = 0u;
    tileOutputVideoRequirements = v11->_tileOutputVideoRequirements;
    v34 = -[NSArray countByEnumeratingWithState:objects:count:](tileOutputVideoRequirements, "countByEnumeratingWithState:objects:count:", &v110, v115, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v111;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v111 != v36)
            objc_enumerationMutation(tileOutputVideoRequirements);
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "espressoStorages"), "objectAtIndexedSubscript:", v31), "setPixelBufferPool:forRequirement:", objc_msgSend(a4, "pixelBufferPoolForRequirement:", *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * i)), *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * i));
        }
        v35 = -[NSArray countByEnumeratingWithState:objects:count:](tileOutputVideoRequirements, "countByEnumeratingWithState:objects:count:", &v110, v115, 16);
      }
      while (v35);
    }
    v109 = 0u;
    v107 = 0u;
    v108 = 0u;
    v106 = 0u;
    additionalVideoRequirements = v11->_additionalVideoRequirements;
    v39 = -[NSArray countByEnumeratingWithState:objects:count:](additionalVideoRequirements, "countByEnumeratingWithState:objects:count:", &v106, v114, 16);
    if (v39)
    {
      v41 = v39;
      v42 = *(_QWORD *)v107;
      do
      {
        for (j = 0; j != v41; ++j)
        {
          if (*(_QWORD *)v107 != v42)
            objc_enumerationMutation(additionalVideoRequirements);
          v44 = *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * j);
          v45 = objc_msgSend((id)objc_msgSend(a4, "pixelBufferPoolForRequirement:", v44), "newPixelBuffer");
          if (!v45)
          {
            v62 = FigSignalErrorAt();
            v69 = 1;
            a7 = v82;
LABEL_80:
            v14 = v89;
            v20 = v96;
            goto LABEL_81;
          }
          v46 = (const void *)v45;
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "espressoStorages"), "objectAtIndexedSubscript:", v31), "setPixelBuffer:forRequirement:", v45, v44);
          CFRelease(v46);
        }
        v41 = -[NSArray countByEnumeratingWithState:objects:count:](additionalVideoRequirements, "countByEnumeratingWithState:objects:count:", &v106, v114, 16);
      }
      while (v41);
    }
    v32 = 0;
    v31 = 1;
  }
  while ((v92 & 1) != 0);
  v47 = v91;
  v48 = v97;
  v14 = v89;
  v20 = v96;
  if (v91)
  {
    for (k = 0;
          k != v91;
          -[BWTiledEspressoInferenceProvider preProcessOutputBuffer:forMediaKey:](v11, "preProcessOutputBuffer:forMediaKey:", v50, objc_msgSend((id)objc_msgSend(v95, "objectAtIndexedSubscript:", k++), "attachedMediaKey")))
    {
      v50 = objc_msgSend((id)objc_msgSend(a4, "pixelBufferPoolForRequirement:", objc_msgSend(v95, "objectAtIndexedSubscript:", k)), "newPixelBuffer");
      *(_QWORD *)&v96[8 * k] = v50;
      if (!v50)
      {
        v62 = FigSignalErrorAt();
        v69 = 1;
        goto LABEL_106;
      }
    }
  }
  if (!v80)
  {
    v77 = 0;
LABEL_98:
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "espressoStorages"), "objectAtIndexedSubscript:", 0), "clear");
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "espressoStorages"), "objectAtIndexedSubscript:", 1), "clear");
    v20 = v96;
    if (v91)
    {
      v75 = 0;
      do
      {
        objc_msgSend(a4, "setPixelBuffer:forRequirement:", *(_QWORD *)&v96[8 * v75], objc_msgSend(v95, "objectAtIndexedSubscript:", v75));
        ++v75;
      }
      while (v47 != v75);
    }
    v101[0] = MEMORY[0x1E0C809B0];
    v101[1] = 3221225472;
    v101[2] = __135__BWTiledEspressoInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler_currentTileCount___block_invoke_2;
    v101[3] = &unk_1E491EA20;
    v102 = 0;
    a7 = v82;
    v101[4] = v11;
    v101[5] = v82;
    objc_msgSend(v77, "addScheduledHandler:", v101);
    objc_msgSend(v77, "commit");
    -[BWTiledEspressoInferenceProvider purgeIntermediateResources](v11, "purgeIntermediateResources");
    v69 = 0;
    v62 = 0;
    goto LABEL_81;
  }
  v85 = 0;
  v51 = 0;
  v77 = 0;
  v52 = v83;
  v78 = v83 - 1;
  if (v83 <= 1)
    v52 = 1;
  v81 = v52;
  while (v79 < 0x10000)
  {
LABEL_76:
    if (++v85 == v80)
      goto LABEL_98;
  }
  v93 = 0;
  v40.i32[0] = v85;
  v84 = vmovl_u16(v40).u16[0];
  while (1)
  {
    v105 = 0;
    if (v14)
    {
      v53 = 0;
      v54 = &v19[v51];
      do
      {
        v55 = (uint64_t)*v54;
        v54 += 2;
        objc_msgSend(v48, "setObject:forKeyedSubscript:", v55, -[NSArray objectAtIndexedSubscript:](v11->_tileInputBindingNames, "objectAtIndexedSubscript:", v53++));
      }
      while (v94 != v53);
    }
    HIWORD(v100) = v93;
    LOWORD(v100) = v84;
    v56 = -[BWTiledEspressoInferenceProvider createInputTiles:withInputs:atPosition:cmdBuffer:](v11, "createInputTiles:withInputs:atPosition:cmdBuffer:", v48, v90, v100, &v105);
    if ((_DWORD)v56)
      goto LABEL_103;
    objc_msgSend(v105, "commit");
    objc_msgSend(v105, "waitUntilScheduled");
    v57 = -[BWTiledEspressoInferenceConfiguration forceSynchronousInference](v11->_configuration, "forceSynchronousInference");
    espressoProvider = v11->_espressoProvider;
    v59 = objc_msgSend((id)objc_msgSend(a4, "espressoStorages"), "objectAtIndexedSubscript:", v51);
    if (v57)
    {
      v103 = *(_OWORD *)&a5->var0;
      var3 = a5->var3;
      v60 = -[BWEspressoInferenceProvider executeOnSampleBuffer:usingStorage:withExecutionTime:completionHandler:](espressoProvider, "executeOnSampleBuffer:usingStorage:withExecutionTime:completionHandler:", a3, v59, &v103, 0);
    }
    else
    {
      espressoWorkQueue = v11->_espressoWorkQueue;
      v103 = *(_OWORD *)&a5->var0;
      var3 = a5->var3;
      v60 = -[BWEspressoInferenceProvider submitForSampleBuffer:usingStorage:withSubmissionTime:workQueue:completionHandler:](espressoProvider, "submitForSampleBuffer:usingStorage:withSubmissionTime:workQueue:completionHandler:", a3, v59, &v103, espressoWorkQueue, 0);
    }
    v62 = v60;
    if ((_DWORD)v60)
      goto LABEL_104;
    if (v86)
    {
      v63 = 0;
      do
      {
        objc_msgSend(v99, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "espressoStorages"), "objectAtIndexedSubscript:", v51), "pixelBufferForRequirement:", -[NSArray objectAtIndexedSubscript:](v11->_tileOutputVideoRequirements, "objectAtIndexedSubscript:", v63)), -[NSArray objectAtIndexedSubscript:](v11->_tileOutputBindingNames, "objectAtIndexedSubscript:", v63));
        if (!objc_msgSend(v99, "objectForKeyedSubscript:", -[NSArray objectAtIndexedSubscript:](v11->_tileOutputBindingNames, "objectAtIndexedSubscript:", v63)))goto LABEL_102;
      }
      while (v86 != ++v63);
    }
    if (-[NSArray count](v11->_additionalVideoRequirements, "count"))
    {
      v64 = 0;
      while (1)
      {
        v65 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](v11->_additionalVideoRequirements, "objectAtIndexedSubscript:", v64), "attachedMediaKey");
        objc_msgSend(v98, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "espressoStorages"), "objectAtIndexedSubscript:", v51), "pixelBufferForRequirement:", -[NSArray objectAtIndexedSubscript:](v11->_additionalVideoRequirements, "objectAtIndexedSubscript:", v64)), v65);
        if (!objc_msgSend(v98, "objectForKeyedSubscript:", v65))
          break;
        if (-[NSArray count](v11->_additionalVideoRequirements, "count") <= ++v64)
          goto LABEL_59;
      }
LABEL_102:
      v62 = FigSignalErrorAt();
      goto LABEL_105;
    }
LABEL_59:
    if (v91)
      break;
    v67 = 0;
    v48 = v97;
LABEL_71:
    objc_msgSend(v67, "addCompletedHandler:", &__block_literal_global_81);
    v14 = v89;
    if (v80 - 1 == v85 && v78 == v93)
      v77 = v67;
    else
      objc_msgSend(v67, "commit");
    v47 = v91;
    v51 = !v51;
    objc_msgSend(v48, "removeAllObjects");
    objc_msgSend(v98, "removeAllObjects");
    objc_msgSend(v99, "removeAllObjects");
    if (++v93 == v81)
      goto LABEL_76;
  }
  v66 = 0;
  v67 = 0;
  v48 = v97;
  while (1)
  {
    *(_QWORD *)&v103 = 0;
    LODWORD(v76) = v100;
    v56 = -[BWTiledEspressoInferenceProvider writeOutputFor:to:fromNetworkOutputTiles:withAdditionalPixelBuffers:withInputTilePixelBuffers:withInputFullPixelBuffers:atPosition:cmdBuffer:](v11, "writeOutputFor:to:fromNetworkOutputTiles:withAdditionalPixelBuffers:withInputTilePixelBuffers:withInputFullPixelBuffers:atPosition:cmdBuffer:", objc_msgSend((id)objc_msgSend(v95, "objectAtIndexedSubscript:", v66), "attachedMediaKey"), *(_QWORD *)&v96[8 * v66], v99, v98, v48, v90, v76, &v103);
    if ((_DWORD)v56)
      break;
    v68 = (void *)v103;
    if ((_QWORD)v103)
    {
      v48 = v97;
      if (v67)
      {
        objc_msgSend(v67, "commit");
        v68 = (void *)v103;
      }
    }
    else
    {
      v48 = v97;
    }
    if (v68)
      v67 = v68;
    if (v91 == ++v66)
      goto LABEL_71;
  }
LABEL_103:
  v62 = v56;
LABEL_104:
  FigSignalErrorAt();
LABEL_105:
  v69 = 1;
  v14 = v89;
  v20 = v96;
LABEL_106:
  a7 = v82;
LABEL_81:
  v70 = 2 * v14;
  if ((_DWORD)v70)
  {
    v71 = v19;
    do
    {
      if (*v71)
        CFRelease(*v71);
      ++v71;
      --v70;
    }
    while (v70);
  }
  free(v19);
  if (v20 && v91)
  {
    v72 = 0;
    do
    {
      v73 = *(const void **)&v20[v72];
      if (v73)
        CFRelease(v73);
      v72 += 8;
    }
    while (8 * v91 != v72);
  }
  v17 = v90;
LABEL_93:
  free(v20);

  if (a7 && v69)
    (*((void (**)(id, uint64_t, BWTiledEspressoInferenceProvider *))a7 + 2))(a7, v62, v11);
  return v62;
}

uint64_t __135__BWTiledEspressoInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler_currentTileCount___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7
{
  uint64_t v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9;

  v7 = *(unsigned int *)self->_maxTileCount;
  v9 = *a5;
  return -[BWTiledEspressoInferenceProvider submitForSampleBuffer:usingStorage:withSubmissionTime:workQueue:completionHandler:currentTileCount:](self, "submitForSampleBuffer:usingStorage:withSubmissionTime:workQueue:completionHandler:currentTileCount:", a3, a4, &v9, a6, a7, v7);
}

- (int)prepareForSubmissionWithWorkQueue:(id)a3
{
  BWEspressoInferenceProvider *espressoProvider;
  int v6;

  espressoProvider = self->_espressoProvider;
  if (espressoProvider)
  {
    v6 = -[BWEspressoInferenceProvider prepareForSubmissionWithWorkQueue:](espressoProvider, "prepareForSubmissionWithWorkQueue:");
    if (v6)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      self->_espressoWorkQueue = (OS_dispatch_queue *)a3;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  return v6;
}

- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v9 = -[BWTiledEspressoInferenceProvider outputRequirementsToProduceForInputSampleBuffer:](self, "outputRequirementsToProduceForInputSampleBuffer:", a5);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        -[BWTiledEspressoInferenceProvider propagateInferenceResultForOutputRequirement:storage:propagationSampleBuffer:](self, "propagateInferenceResultForOutputRequirement:storage:propagationSampleBuffer:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), a4, a6);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }
}

- (BOOL)allowsAsyncPropagation
{
  return 1;
}

- (int)prewarmUsingLimitedMemory:(BOOL)a3
{
  return 0;
}

- (id)newStorage
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  NSArray *additionalVideoRequirements;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (self->_espressoProvider)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    if (-[NSArray count](self->_inputVideoRequirements, "count"))
    {
      v5 = 0;
      do
        objc_msgSend(v4, "addObject:", -[NSArray objectAtIndexedSubscript:](self->_inputVideoRequirements, "objectAtIndexedSubscript:", v5++));
      while (v5 < -[NSArray count](self->_inputVideoRequirements, "count"));
    }
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    if (-[NSArray count](self->_outputVideoRequirements, "count"))
    {
      v7 = 0;
      do
        objc_msgSend(v6, "addObject:", -[NSArray objectAtIndexedSubscript:](self->_outputVideoRequirements, "objectAtIndexedSubscript:", v7++));
      while (v7 < -[NSArray count](self->_outputVideoRequirements, "count"));
    }
    v8 = 0;
    v9 = 1;
    do
    {
      v10 = v9;
      objc_msgSend(v3, "addObject:", -[BWEspressoInferenceProvider newStorage](self->_espressoProvider, "newStorage"));
      objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", v8), "requirementsNeedingPixelBuffers"));
      objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", v8), "requirementsNeedingPixelBufferPools"));
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      additionalVideoRequirements = self->_additionalVideoRequirements;
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](additionalVideoRequirements, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v18 != v14)
              objc_enumerationMutation(additionalVideoRequirements);
            objc_msgSend(v6, "addObject:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
          }
          v13 = -[NSArray countByEnumeratingWithState:objects:count:](additionalVideoRequirements, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v13);
      }
      v9 = 0;
      v8 = 1;
    }
    while ((v10 & 1) != 0);
    return -[BWTiledEspressoInferenceStorage initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:espressoStorages:]([BWTiledEspressoInferenceStorage alloc], "initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:espressoStorages:", v4, v6, v3);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
}

- (id)outputRequirementsToProduceForInputSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  return self->_outputVideoRequirements;
}

- (int)preProcessOutputBuffer:(__CVBuffer *)a3 forMediaKey:(id)a4
{
  return 0;
}

- (int)createInputTiles:(id)a3 withInputs:(id)a4 atPosition:(id *)a5 cmdBuffer:
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Must be implemented by the subclass"), 0));
}

- (int)writeOutputFor:(id)a3 to:(__CVBuffer *)a4 fromNetworkOutputTiles:(id)a5 withAdditionalPixelBuffers:(id)a6 withInputTilePixelBuffers:(id)a7 withInputFullPixelBuffers:(id)a8 atPosition:(id *)a9 cmdBuffer:
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Must be implemented by the subclass"), 0, a6, a7, a8));
}

- (int)purgeIntermediateResources
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Must be implemented by the subclass"), 0));
}

- (int)propagateInferenceResultForOutputRequirement:(id)a3 storage:(id)a4 propagationSampleBuffer:(opaqueCMSampleBuffer *)a5
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Must be implemented by the subclass"), 0));
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_resourceProvider);
}

@end
