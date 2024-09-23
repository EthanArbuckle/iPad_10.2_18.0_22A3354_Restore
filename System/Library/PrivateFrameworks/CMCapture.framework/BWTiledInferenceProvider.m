@implementation BWTiledInferenceProvider

+ (id)videoFormatWithPixelFormat:(unsigned int)a3 size:(BOOL)a4 includesInvalidContent:(BOOL)a5 appliesFinalCropRect:
{
  uint64_t v5;

  return (id)objc_msgSend(a1, "videoFormatWithPixelFormat:size:sliceCount:includesInvalidContent:appliesFinalCropRect:", *(_QWORD *)&a3, a4, 0, a5, v5);
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

+ (id)videoFormatWithPixelFormat:(unsigned int)a3 size:(unsigned int)a4 sliceCount:
{
  return (id)objc_msgSend(a1, "videoFormatWithPixelFormat:size:sliceCount:includesInvalidContent:appliesFinalCropRect:", *(_QWORD *)&a3, *(_QWORD *)&a4);
}

+ (id)videoFormatWithPixelFormat:(unsigned int)a3 size:(BOOL)a4 appliesFinalCropRect:
{
  uint64_t v4;

  return (id)objc_msgSend(a1, "videoFormatWithPixelFormat:size:sliceCount:includesInvalidContent:appliesFinalCropRect:", *(_QWORD *)&a3, a4, 0, 0, v4);
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

+ (void)initialize
{
  objc_opt_class();
}

- (BWTiledInferenceProvider)initWithConfiguration:(id)a3 inputVideoRequirements:(id)a4 outputVideoRequirements:(id)a5 resourceProvider:(id)a6
{
  BWTiledInferenceProvider *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BWTiledInferenceProvider;
  v10 = -[BWTiledInferenceProvider init](&v12, sel_init);
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

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWTiledInferenceProvider;
  -[BWTiledInferenceProvider dealloc](&v3, sel_dealloc);
}

- (NSArray)inputVideoRequirements
{
  return self->_inputVideoRequirements;
}

- (NSArray)outputVideoRequirements
{
  return self->_outputVideoRequirements;
}

- (NSArray)inputMetadataRequirements
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSArray)outputMetadataRequirements
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (unsigned)allowedPixelBufferCompressionDirection
{
  return 0;
}

- (int)executionTarget
{
  return 1;
}

- (NSSet)preventionReasons
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (NSArray)cloneVideoRequirements
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
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
  uint64_t v11;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BWEspressoInferenceProvider *v19;
  BWEspressoInferenceProvider *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSArray *v31;
  uint64_t v32;
  void *v33;
  id v34;
  int v35;
  unsigned int v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;
  void *v50;

  v49 = *MEMORY[0x1E0C80C00];
  if (self->_espressoProvider)
    return 0;
  v11 = *(_QWORD *)&a5;
  v35 = (int)a6;
  v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v38 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v37 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (!-[NSArray count](self->_inputVideoRequirements, "count"))
    return FigSignalErrorAt();
  if (!-[NSArray count](self->_outputVideoRequirements, "count"))
    return FigSignalErrorAt();
  if (!objc_msgSend(a7, "count"))
    return FigSignalErrorAt();
  if (!objc_msgSend(a8, "count"))
    return FigSignalErrorAt();
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", objc_msgSend(a3, "path")) & 1) == 0)return FigSignalErrorAt();
  v33 = (void *)v16;
  v34 = a8;
  v17 = objc_msgSend(objc_loadWeak((id *)&self->_resourceProvider), "espressoContextForExecutionTarget:", 3);
  *(_DWORD *)self->_maxTileCount = v35;
  v18 = v11;
  v19 = [BWEspressoInferenceProvider alloc];
  v36 = -[BWInferenceConfiguration priority](self->_configuration, "priority");
  LODWORD(v32) = 0;
  v20 = -[BWEspressoInferenceProvider initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:](v19, "initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:", v18, a3, a4, v17, 3, v36, objc_msgSend(MEMORY[0x1E0C99E60], "set"), objc_loadWeak((id *)&self->_resourceProvider), v32, 2);
  self->_espressoProvider = v20;
  if (!v20)
    return FigSignalErrorAt();
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v21 = objc_msgSend(a7, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v44;
LABEL_11:
    v24 = 0;
    while (1)
    {
      if (*(_QWORD *)v44 != v23)
        objc_enumerationMutation(a7);
      v25 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v24);
      objc_msgSend(v38, "addObject:", v25);
      objc_msgSend(v15, "addObject:", -[BWEspressoInferenceProvider bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:](self->_espressoProvider, "bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:", v25, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("TileInput_%@"), v25), objc_msgSend(a7, "objectForKeyedSubscript:", v25)));
      if (!objc_msgSend(v15, "lastObject"))
        break;
      if (v22 == ++v24)
      {
        v22 = objc_msgSend(a7, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
        if (v22)
          goto LABEL_11;
        goto LABEL_17;
      }
    }
  }
  else
  {
LABEL_17:
    self->_tileInputBindingNames = (NSArray *)v38;
    self->_tileInputVideoRequirements = (NSArray *)v15;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v26 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (!v26)
    {
LABEL_25:
      self->_tileOutputBindingNames = (NSArray *)v37;
      self->_tileOutputVideoRequirements = (NSArray *)v33;
      v31 = v50;
      result = 0;
      self->_additionalVideoRequirements = v31;
      return result;
    }
    v27 = v26;
    v28 = *(_QWORD *)v40;
LABEL_19:
    v29 = 0;
    while (1)
    {
      if (*(_QWORD *)v40 != v28)
        objc_enumerationMutation(v34);
      v30 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v29);
      objc_msgSend(v37, "addObject:", v30);
      objc_msgSend(v33, "addObject:", -[BWEspressoInferenceProvider bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:](self->_espressoProvider, "bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:", v30, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("TileOutput_%@"), v30), objc_msgSend(v34, "objectForKeyedSubscript:", v30)));
      if (!objc_msgSend(v33, "lastObject"))
        break;
      if (v27 == ++v29)
      {
        v27 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
        if (v27)
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
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  _QWORD *v16;
  void *v17;
  char *v18;
  _QWORD *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  int v23;
  CVMetalTextureRef v24;
  uint64_t i;
  id v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  __CVBuffer *v31;
  __CVBuffer *v32;
  uint64_t v33;
  char v34;
  NSArray *tileOutputVideoRequirements;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  NSArray *additionalVideoRequirements;
  uint64_t v41;
  uint16x4_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t k;
  uint64_t v46;
  uint64_t v47;
  const void *v48;
  uint64_t v49;
  id v50;
  int v51;
  __CVBuffer *v52;
  void *v53;
  void *v54;
  unsigned int v55;
  int v56;
  unsigned int v57;
  unsigned int v58;
  uint64_t v59;
  int v60;
  void *v61;
  uint64_t v62;
  _BOOL4 v63;
  BWEspressoInferenceProvider *espressoProvider;
  uint64_t v65;
  uint64_t v66;
  OS_dispatch_queue *espressoWorkQueue;
  uint64_t v68;
  __CVBuffer *v69;
  uint64_t v70;
  uint64_t v71;
  __CVBuffer *v72;
  _QWORD *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  CFTypeRef *v77;
  uint64_t v78;
  const void *v79;
  uint64_t v81;
  __CVMetalTextureCache *textureCache;
  uint64_t v83;
  _BOOL4 v84;
  uint64_t v85;
  unsigned int v86;
  int v87;
  unsigned __int32 v88;
  unsigned int v89;
  int v90;
  __int32 v91;
  id v94;
  unsigned int v95;
  unint64_t v96;
  char *v97;
  unsigned int v98;
  _BOOL4 v99;
  void *v100;
  unsigned int v101;
  char v102;
  uint64_t v103;
  uint64_t v104;
  _QWORD *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  CFTypeRef *v110;
  int v111;
  unsigned int v112;
  _QWORD v113[6];
  int v114;
  __int128 v115;
  int64_t var3;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _BYTE v125[128];
  _BYTE v126[128];
  __int128 v127;
  uint64_t v128;

  v8 = v7;
  v128 = *MEMORY[0x1E0C80C00];
  v12 = -[NSArray count](self->_inputVideoRequirements, "count", a3, a4, a5, a6);
  v13 = -[NSArray count](self->_tileInputVideoRequirements, "count");
  v14 = -[NSArray count](self->_outputVideoRequirements, "count");
  v15 = -[NSArray count](self->_tileOutputVideoRequirements, "count");
  if (objc_msgSend((id)objc_msgSend(a4, "espressoStorages"), "count") != 2
    || (unsigned __int16)v8 > *(unsigned __int16 *)self->_maxTileCount
    || HIWORD(v8) > *(unsigned __int16 *)&self->_maxTileCount[2])
  {
    v109 = 0;
    goto LABEL_122;
  }
  v95 = HIWORD(v8);
  v90 = (unsigned __int16)v8;
  v109 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v12);
  v110 = (CFTypeRef *)malloc_type_calloc(2 * v13, 8uLL, 0x2004093837F09uLL);
  if (!v110)
  {
LABEL_122:
    v83 = FigSignalErrorAt();
    v17 = 0;
    v16 = 0;
    v18 = 0;
    v105 = 0;
    v107 = 0;
    v108 = 0;
    v84 = 1;
    goto LABEL_98;
  }
  v16 = malloc_type_calloc(2 * v13, 8uLL, 0x80040B8603338uLL);
  v98 = v14;
  v101 = v13;
  if (!v16)
  {
    v83 = FigSignalErrorAt();
    v17 = 0;
    v18 = 0;
    v105 = 0;
    v107 = 0;
    v108 = 0;
    goto LABEL_125;
  }
  v89 = v8;
  v106 = v13;
  v108 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:");
  v107 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSArray count](self->_additionalVideoRequirements, "count"));
  v104 = v15;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:");
  v18 = (char *)malloc_type_calloc(v14, 8uLL, 0x2004093837F09uLL);
  if (!v18 || (v19 = malloc_type_calloc(v14, 8uLL, 0x80040B8603338uLL)) == 0)
  {
    v83 = FigSignalErrorAt();
    v105 = 0;
    goto LABEL_125;
  }
  v105 = v19;
  v97 = v18;
  v100 = v17;
  if (v12)
  {
    v20 = 0;
    while (1)
    {
      v21 = -[NSArray objectAtIndexedSubscript:](self->_inputVideoRequirements, "objectAtIndexedSubscript:", v20);
      v22 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_inputVideoRequirements, "objectAtIndexedSubscript:", v20), "attachedMediaKey");
      v23 = objc_msgSend(v21, "videoStorageType");
      if (v23 == 1)
        break;
      if (!v23)
      {
        v24 = -[BWTiledInferenceProvider _cachedTexturesFromPixelBuffer:usage:]((CVMetalTextureRef)self, (__CVBuffer *)objc_msgSend(a4, "pixelBufferForRequirement:", v21), 17);
LABEL_14:
        objc_msgSend(v109, "setObject:forKeyedSubscript:", v24, v22);
      }
      if (!objc_msgSend(v109, "objectForKeyedSubscript:", v22))
      {
        v83 = FigSignalErrorAt();
        v84 = 1;
LABEL_85:
        v17 = v100;
LABEL_86:
        v18 = v97;
        goto LABEL_87;
      }
      if (v12 == ++v20)
        goto LABEL_17;
    }
    v127 = *(_OWORD *)objc_msgSend((id)objc_msgSend(a4, "textureStorage"), "entryForRequirement:", v21);
    v24 = (CVMetalTextureRef)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v127, 2);
    goto LABEL_14;
  }
LABEL_17:
  v103 = v14;
  v94 = a7;
  if (v101)
  {
    for (i = 0; i != v106; ++i)
    {
      v26 = -[NSArray objectAtIndexedSubscript:](self->_tileInputVideoRequirements, "objectAtIndexedSubscript:", i);
      v27 = 0;
      v28 = 2 * i;
      v29 = 1;
      do
      {
        v30 = v29;
        v31 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(a4, "pixelBufferPoolForRequirement:", v26), "newPixelBuffer");
        if (!v31)
        {
LABEL_84:
          v83 = FigSignalErrorAt();
          v84 = 1;
          a7 = v94;
          goto LABEL_85;
        }
        v32 = v31;
        v110[v27 | v28] = v31;
        v16[v27 | v28] = -[BWTiledInferenceProvider _cachedTexturesFromPixelBuffer:usage:]((CVMetalTextureRef)self, v31, 23);
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "espressoStorages"), "objectAtIndexedSubscript:", v27), "setPixelBuffer:forRequirement:", v32, v26);
        v29 = 0;
        v27 = 1;
      }
      while ((v30 & 1) != 0);
    }
  }
  v33 = 0;
  v34 = 1;
  do
  {
    v102 = v34;
    v123 = 0u;
    v124 = 0u;
    v121 = 0u;
    v122 = 0u;
    tileOutputVideoRequirements = self->_tileOutputVideoRequirements;
    v36 = -[NSArray countByEnumeratingWithState:objects:count:](tileOutputVideoRequirements, "countByEnumeratingWithState:objects:count:", &v121, v126, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v122;
      do
      {
        for (j = 0; j != v37; ++j)
        {
          if (*(_QWORD *)v122 != v38)
            objc_enumerationMutation(tileOutputVideoRequirements);
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "espressoStorages"), "objectAtIndexedSubscript:", v33), "setPixelBufferPool:forRequirement:", objc_msgSend(a4, "pixelBufferPoolForRequirement:", *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * j)), *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * j));
        }
        v37 = -[NSArray countByEnumeratingWithState:objects:count:](tileOutputVideoRequirements, "countByEnumeratingWithState:objects:count:", &v121, v126, 16);
      }
      while (v37);
    }
    v119 = 0u;
    v120 = 0u;
    v117 = 0u;
    v118 = 0u;
    additionalVideoRequirements = self->_additionalVideoRequirements;
    v41 = -[NSArray countByEnumeratingWithState:objects:count:](additionalVideoRequirements, "countByEnumeratingWithState:objects:count:", &v117, v125, 16);
    if (v41)
    {
      v43 = v41;
      v44 = *(_QWORD *)v118;
      do
      {
        for (k = 0; k != v43; ++k)
        {
          if (*(_QWORD *)v118 != v44)
            objc_enumerationMutation(additionalVideoRequirements);
          v46 = *(_QWORD *)(*((_QWORD *)&v117 + 1) + 8 * k);
          v47 = objc_msgSend((id)objc_msgSend(a4, "pixelBufferPoolForRequirement:", v46), "newPixelBuffer");
          if (!v47)
            goto LABEL_84;
          v48 = (const void *)v47;
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "espressoStorages"), "objectAtIndexedSubscript:", v33), "setPixelBuffer:forRequirement:", v47, v46);
          CFRelease(v48);
        }
        v43 = -[NSArray countByEnumeratingWithState:objects:count:](additionalVideoRequirements, "countByEnumeratingWithState:objects:count:", &v117, v125, 16);
      }
      while (v43);
    }
    v34 = 0;
    v33 = 1;
  }
  while ((v102 & 1) != 0);
  a7 = v94;
  v17 = v100;
  if (!v98)
  {
LABEL_48:
    if (v90)
    {
      v91 = 0;
      v99 = 0;
      v54 = 0;
      v55 = v101;
      v56 = v95;
      v86 = v95 - 1;
      if (v95 <= 1)
        v56 = 1;
      v87 = v56;
      while (v89 < 0x10000)
      {
LABEL_82:
        if (++v91 == v90)
          goto LABEL_103;
      }
      v57 = 0;
      v42.i32[0] = v91;
      v88 = vmovl_u16(v42).u32[0];
      while (1)
      {
        v58 = v57;
        v96 = __PAIR64__(v57, v88);
        if (v55)
        {
          v59 = 0;
          HIWORD(v112) = v57;
          LOWORD(v112) = v88;
          v60 = v99;
          while (1)
          {
            v61 = (void *)objc_msgSend((id)-[FigMetalContext commandQueue](self->_metalContext, "commandQueue"), "commandBuffer");
            v62 = -[BWTiledInferenceProvider createInputTileFor:to:withInputs:atPosition:encodeToCmdBuffer:](self, "createInputTileFor:to:withInputs:atPosition:encodeToCmdBuffer:", -[NSArray objectAtIndexedSubscript:](self->_tileInputBindingNames, "objectAtIndexedSubscript:", v59), v16[v60], v109, v112, v61);
            if ((_DWORD)v62)
              break;
            objc_msgSend(v108, "setObject:forKeyedSubscript:", v16[v60], -[NSArray objectAtIndexedSubscript:](self->_tileInputBindingNames, "objectAtIndexedSubscript:", v59));
            objc_msgSend(v61, "commit");
            if (v101 - 1 == v59)
              objc_msgSend(v61, "waitUntilScheduled");
            ++v59;
            v60 += 2;
            if (v106 == v59)
              goto LABEL_60;
          }
          v83 = v62;
          FigSignalErrorAt();
          goto LABEL_115;
        }
LABEL_60:
        v63 = -[BWTiledEspressoInferenceConfiguration forceSynchronousInference](self->_configuration, "forceSynchronousInference");
        espressoProvider = self->_espressoProvider;
        v65 = objc_msgSend((id)objc_msgSend(a4, "espressoStorages"), "objectAtIndexedSubscript:", v99);
        if (v63)
        {
          v115 = *(_OWORD *)&a5->var0;
          var3 = a5->var3;
          v66 = -[BWEspressoInferenceProvider executeOnSampleBuffer:usingStorage:withExecutionTime:completionHandler:](espressoProvider, "executeOnSampleBuffer:usingStorage:withExecutionTime:completionHandler:", a3, v65, &v115, 0);
        }
        else
        {
          espressoWorkQueue = self->_espressoWorkQueue;
          v115 = *(_OWORD *)&a5->var0;
          var3 = a5->var3;
          v66 = -[BWEspressoInferenceProvider submitForSampleBuffer:usingStorage:withSubmissionTime:workQueue:completionHandler:](espressoProvider, "submitForSampleBuffer:usingStorage:withSubmissionTime:workQueue:completionHandler:", a3, v65, &v115, espressoWorkQueue, 0);
        }
        v83 = v66;
        v17 = v100;
        if ((_DWORD)v66)
          goto LABEL_117;
        if (v104)
        {
          v68 = 0;
          while (1)
          {
            v69 = (__CVBuffer *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "espressoStorages"), "objectAtIndexedSubscript:", v99), "pixelBufferForRequirement:", -[NSArray objectAtIndexedSubscript:](self->_tileOutputVideoRequirements, "objectAtIndexedSubscript:", v68));
            if (!v69)
              break;
            objc_msgSend(v100, "setObject:forKeyedSubscript:", -[BWTiledInferenceProvider _cachedTexturesFromPixelBuffer:usage:]((CVMetalTextureRef)self, v69, 17), -[NSArray objectAtIndexedSubscript:](self->_tileOutputBindingNames, "objectAtIndexedSubscript:", v68++));
            if (v104 == v68)
              goto LABEL_68;
          }
          v83 = FigSignalErrorAt();
          goto LABEL_118;
        }
LABEL_68:
        if (-[NSArray count](self->_additionalVideoRequirements, "count"))
        {
          v70 = 0;
          while (1)
          {
            v71 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_additionalVideoRequirements, "objectAtIndexedSubscript:", v70), "attachedMediaKey");
            v72 = (__CVBuffer *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "espressoStorages"), "objectAtIndexedSubscript:", v99), "pixelBufferForRequirement:", -[NSArray objectAtIndexedSubscript:](self->_additionalVideoRequirements, "objectAtIndexedSubscript:", v70));
            if (!v72)
              break;
            objc_msgSend(v107, "setObject:forKeyedSubscript:", -[BWTiledInferenceProvider _cachedTexturesFromPixelBuffer:usage:]((CVMetalTextureRef)self, v72, 23), v71);
            if (-[NSArray count](self->_additionalVideoRequirements, "count") <= ++v70)
              goto LABEL_72;
          }
          v83 = FigSignalErrorAt();
LABEL_115:
          v84 = 1;
          v17 = v100;
          goto LABEL_119;
        }
LABEL_72:
        v17 = v100;
        v55 = v101;
        v73 = v105;
        if (v98)
          break;
LABEL_78:
        objc_msgSend(v54, "addCompletedHandler:", &__block_literal_global_28);
        if (v90 - 1 != v91 || v86 != v58)
          objc_msgSend(v54, "commit");
        v99 = !v99;
        objc_msgSend(v108, "removeAllObjects");
        objc_msgSend(v107, "removeAllObjects");
        objc_msgSend(v100, "removeAllObjects");
        v57 = v58 + 1;
        if (v58 + 1 == v87)
          goto LABEL_82;
      }
      v74 = 0;
      HIWORD(v111) = WORD2(v96);
      LOWORD(v111) = v96;
      while (1)
      {
        v54 = (void *)objc_msgSend((id)-[FigMetalContext commandQueue](self->_metalContext, "commandQueue"), "commandBuffer");
        LODWORD(v85) = v111;
        v75 = -[BWTiledInferenceProvider writeOutputFor:to:fromNetworkOutputTiles:withAdditionalTextures:withInputTileTextures:withInputFullTextures:atPosition:encodeToCmdBuffer:](self, "writeOutputFor:to:fromNetworkOutputTiles:withAdditionalTextures:withInputTileTextures:withInputFullTextures:atPosition:encodeToCmdBuffer:", objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_outputVideoRequirements, "objectAtIndexedSubscript:", v74), "attachedMediaKey"), v73[v74], v100, v107, v108, v109, v85, v54);
        if ((_DWORD)v75)
          break;
        if (v98 - 1 != v74)
          objc_msgSend(v54, "commit");
        ++v74;
        v73 = v105;
        if (v103 == v74)
          goto LABEL_78;
      }
      v83 = v75;
LABEL_117:
      FigSignalErrorAt();
LABEL_118:
      v84 = 1;
LABEL_119:
      v18 = v97;
      a7 = v94;
    }
    else
    {
      v54 = 0;
LABEL_103:
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "espressoStorages"), "objectAtIndexedSubscript:", 0), "clear");
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "espressoStorages"), "objectAtIndexedSubscript:", 1), "clear");
      if (v98)
      {
        v81 = 0;
        do
        {
          objc_msgSend(a4, "setPixelBuffer:forRequirement:", *(_QWORD *)&v97[8 * v81], -[NSArray objectAtIndexedSubscript:](self->_outputVideoRequirements, "objectAtIndexedSubscript:", v81));
          ++v81;
        }
        while (v103 != v81);
      }
      v84 = v54 == 0;
      v18 = v97;
      a7 = v94;
      if (v54)
      {
        v113[0] = MEMORY[0x1E0C809B0];
        v113[1] = 3221225472;
        v113[2] = __127__BWTiledInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler_currentTileCount___block_invoke_2;
        v113[3] = &unk_1E491EA20;
        v114 = 0;
        v113[4] = self;
        v113[5] = v94;
        objc_msgSend(v54, "addScheduledHandler:", v113);
        objc_msgSend(v54, "commit");
      }
      textureCache = self->_textureCache;
      if (textureCache)
        CVMetalTextureCacheFlush(textureCache, 0);
      -[BWTiledInferenceProvider purgeIntermediateResources](self, "purgeIntermediateResources");
      v83 = 0;
    }
    goto LABEL_87;
  }
  v49 = 0;
  while (1)
  {
    v50 = -[NSArray objectAtIndexedSubscript:](self->_outputVideoRequirements, "objectAtIndexedSubscript:", v49);
    v51 = objc_msgSend(v50, "videoStorageType");
    if (!v51)
      break;
    if (v51 == 1)
    {
      v83 = FigSignalErrorAt();
      v84 = 1;
      goto LABEL_86;
    }
LABEL_47:
    v53 = (void *)objc_msgSend((id)-[FigMetalContext commandQueue](self->_metalContext, "commandQueue"), "commandBuffer");
    -[BWTiledInferenceProvider preProcessOutputTexture:forMediaKey:encodeToCmdBuffer:](self, "preProcessOutputTexture:forMediaKey:encodeToCmdBuffer:", v105[v49], objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_outputVideoRequirements, "objectAtIndexedSubscript:", v49), "attachedMediaKey"), v53);
    objc_msgSend(v53, "commit");
    if (v103 == ++v49)
      goto LABEL_48;
  }
  v52 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(a4, "pixelBufferPoolForRequirement:", v50), "newPixelBuffer");
  v18 = v97;
  if (v52)
  {
    *(_QWORD *)&v97[8 * v49] = v52;
    v105[v49] = -[BWTiledInferenceProvider _cachedTexturesFromPixelBuffer:usage:]((CVMetalTextureRef)self, v52, 22);
    goto LABEL_47;
  }
  v83 = FigSignalErrorAt();
LABEL_125:
  v84 = 1;
LABEL_87:
  v76 = 2 * v101;
  if ((_DWORD)v76)
  {
    v77 = v110;
    do
    {
      if (*v77)
        CFRelease(*v77);
      ++v77;
      --v76;
    }
    while (v76);
  }
  free(v110);
  if (v18 && v98)
  {
    v78 = 0;
    do
    {
      v79 = *(const void **)&v18[v78];
      if (v79)
        CFRelease(v79);
      v78 += 8;
    }
    while (8 * v98 != v78);
  }
LABEL_98:
  free(v18);
  free(v105);
  free(v16);

  if (a7 && v84)
    (*((void (**)(id, uint64_t, BWTiledInferenceProvider *))a7 + 2))(a7, v83, self);
  return v83;
}

- (CVMetalTextureRef)_cachedTexturesFromPixelBuffer:(uint64_t)a3 usage:
{
  uint64_t v4;
  CVMetalTextureRef v5;
  OSType PixelFormatType;
  size_t PlaneCount;
  size_t v8;
  unsigned int v9;
  uint64_t v10;
  char v11;
  const __CFAllocator *v12;
  unsigned int WidthOfPlane;
  unsigned int HeightOfPlane;
  uint64_t v15;
  MTLPixelFormat v16;
  unint64_t v17;
  uint64_t v18;
  int v20;
  CVMetalTextureRef image;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v4 = (uint64_t)result;
    image = 0;
    result = (CVMetalTextureRef)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
    if (result)
    {
      v5 = result;
      PixelFormatType = CVPixelBufferGetPixelFormatType(a2);
      PlaneCount = CVPixelBufferGetPlaneCount(a2);
      v8 = 0;
      v9 = 0;
      if (PlaneCount <= 1)
        v10 = 1;
      else
        v10 = PlaneCount;
      v17 = v10;
      v20 = PixelFormatType;
      v11 = PixelFormatType == 1647719528;
      v18 = *MEMORY[0x1E0CA8F58];
      v12 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      while (1)
      {
        WidthOfPlane = CVPixelBufferGetWidthOfPlane(a2, v8);
        HeightOfPlane = CVPixelBufferGetHeightOfPlane(a2, v8);
        v15 = -[BWTiledInferenceProvider _metalTextureFormatFromPixelBufferFormat:forPlane:](v4, v20, v9);
        if (!v15)
          break;
        v16 = v15;
        v22 = v18;
        v23[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
        if (CVMetalTextureCacheCreateTextureFromImage(v12, *(CVMetalTextureCacheRef *)(v4 + 112), a2, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1), v16, WidthOfPlane >> v11, HeightOfPlane >> v11, v8, &image))
        {
          break;
        }
        -[__CVBuffer setObject:atIndexedSubscript:](v5, "setObject:atIndexedSubscript:", CVMetalTextureGetTexture(image), v8);
        if (!-[__CVBuffer objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", v8))
          break;
        if (image)
          CFRelease(image);
        v8 = ++v9;
        if (v17 <= v9)
          return v5;
      }

      result = image;
      if (image)
      {
        CFRelease(image);
        return 0;
      }
    }
  }
  return result;
}

uint64_t __127__BWTiledInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler_currentTileCount___block_invoke_2(uint64_t a1)
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
  return -[BWTiledInferenceProvider submitForSampleBuffer:usingStorage:withSubmissionTime:workQueue:completionHandler:currentTileCount:](self, "submitForSampleBuffer:usingStorage:withSubmissionTime:workQueue:completionHandler:currentTileCount:", a3, a4, &v9, a6, a7, v7);
}

- (int)prepareForSubmissionWithWorkQueue:(id)a3
{
  id v5;
  FigMetalContext *v6;
  const __CFDictionary *v7;
  int v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (!self->_espressoProvider)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  v5 = objc_alloc(MEMORY[0x1E0D08B28]);
  v6 = (FigMetalContext *)objc_msgSend(v5, "initWithbundle:andOptionalCommandQueue:", objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), -[BWTiledEspressoInferenceConfiguration metalCommandQueue](self->_configuration, "metalCommandQueue"));
  self->_metalContext = v6;
  if (!v6)
    return -12786;
  v10 = *MEMORY[0x1E0CA8F48];
  v11[0] = &unk_1E49F88F8;
  v7 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  if (CVMetalTextureCacheCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v7, (id)-[FigMetalContext device](self->_metalContext, "device"), 0, &self->_textureCache))
  {
    return 0;
  }
  v8 = -[BWEspressoInferenceProvider prepareForSubmissionWithWorkQueue:](self->_espressoProvider, "prepareForSubmissionWithWorkQueue:", a3);
  if (v8)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    self->_espressoWorkQueue = (OS_dispatch_queue *)a3;
  }
  return v8;
}

- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6
{
  NSArray *outputVideoRequirements;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  outputVideoRequirements = self->_outputVideoRequirements;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](outputVideoRequirements, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(outputVideoRequirements);
        -[BWTiledInferenceProvider propagateInferenceResultForOutputRequirement:storage:propagationSampleBuffer:](self, "propagateInferenceResultForOutputRequirement:storage:propagationSampleBuffer:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), a4, a6);
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](outputVideoRequirements, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
  id v6;
  void *v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  char v11;
  char v12;
  NSArray *additionalVideoRequirements;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (self->_espressoProvider)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    if (-[NSArray count](self->_inputVideoRequirements, "count"))
    {
      v5 = 0;
      do
      {
        v6 = -[NSArray objectAtIndexedSubscript:](self->_inputVideoRequirements, "objectAtIndexedSubscript:", v5);
        if (!objc_msgSend(v6, "videoStorageType"))
          objc_msgSend(v4, "addObject:", v6);
        ++v5;
      }
      while (v5 < -[NSArray count](self->_inputVideoRequirements, "count"));
    }
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    if (-[NSArray count](self->_outputVideoRequirements, "count"))
    {
      v8 = 0;
      do
      {
        v9 = -[NSArray objectAtIndexedSubscript:](self->_outputVideoRequirements, "objectAtIndexedSubscript:", v8);
        if (!objc_msgSend(v9, "videoStorageType"))
          objc_msgSend(v7, "addObject:", v9);
        ++v8;
      }
      while (v8 < -[NSArray count](self->_outputVideoRequirements, "count"));
    }
    v10 = 0;
    v11 = 1;
    do
    {
      v12 = v11;
      objc_msgSend(v3, "addObject:", -[BWEspressoInferenceProvider newStorage](self->_espressoProvider, "newStorage"));
      objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", v10), "requirementsNeedingPixelBuffers"));
      objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", v10), "requirementsNeedingPixelBufferPools"));
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      additionalVideoRequirements = self->_additionalVideoRequirements;
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](additionalVideoRequirements, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v20 != v16)
              objc_enumerationMutation(additionalVideoRequirements);
            objc_msgSend(v7, "addObject:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
          }
          v15 = -[NSArray countByEnumeratingWithState:objects:count:](additionalVideoRequirements, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v15);
      }
      v11 = 0;
      v10 = 1;
    }
    while ((v12 & 1) != 0);
    return -[BWTiledInferenceStorage initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:espressoStorages:]([BWTiledInferenceStorage alloc], "initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:espressoStorages:", v4, v7, v3);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
}

- (int)preProcessOutputTexture:(id)a3 forMediaKey:(id)a4 encodeToCmdBuffer:(id)a5
{
  return 0;
}

- (int)createInputTileFor:(id)a3 to:(id)a4 withInputs:(id)a5 atPosition:(id)a6 encodeToCmdBuffer:
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Must be implemented by the subclass"), 0, a6));
}

- (int)writeOutputFor:(id)a3 to:(id)a4 fromNetworkOutputTiles:(id)a5 withAdditionalTextures:(id)a6 withInputTileTextures:(id)a7 withInputFullTextures:(id)a8 atPosition:(id)a9 encodeToCmdBuffer:
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

- (uint64_t)_metalTextureFormatFromPixelBufferFormat:(int)a3 forPlane:
{
  int v3;
  int v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;

  if (result)
  {
    if (a2 > 1111970368)
    {
      if (a2 > 1647719527)
      {
        if (a2 <= 2019963439)
        {
          if (a2 != 1647719528)
          {
            if (a2 != 1751527984)
            {
              v3 = 1885745712;
              goto LABEL_29;
            }
            v5 = a3 == 0;
            v6 = 65;
            v7 = 25;
            goto LABEL_32;
          }
          return 115;
        }
        if (a2 == 2019963440)
        {
          v5 = a3 == 0;
          v6 = 60;
          v7 = 20;
LABEL_32:
          if (v5)
            return v7;
          else
            return v6;
        }
        if (a2 != 2084070960)
        {
          v3 = 2088265264;
          goto LABEL_29;
        }
        goto LABEL_31;
      }
      if (a2 <= 1278226533)
      {
        if (a2 == 1111970369)
          return 80;
        if (a2 == 1278226488)
          return 10;
        return 0;
      }
      switch(a2)
      {
        case 1278226534:
          return 55;
        case 1278226536:
          return 25;
        case 1380411457:
          return 115;
      }
      return 0;
    }
    if (a2 > 796419631)
    {
      if (a2 > 843264103)
      {
        if (a2 == 843264104)
          return 65;
        if (a2 == 875704422)
          goto LABEL_31;
        v4 = 875704438;
LABEL_22:
        if (a2 == v4)
          goto LABEL_31;
        return 0;
      }
      if (a2 != 796419632)
      {
        if (a2 == 843264056)
          return 30;
        return 0;
      }
    }
    else
    {
      if (a2 <= 758670895)
      {
        if (a2 != 641230384)
        {
          v3 = 645424688;
LABEL_29:
          if (a2 != v3)
            return 0;
          goto LABEL_41;
        }
        goto LABEL_31;
      }
      if (a2 == 758670896)
      {
LABEL_31:
        v5 = a3 == 0;
        v6 = 30;
        v7 = 10;
        goto LABEL_32;
      }
      if (a2 != 762865200)
      {
        v4 = 792225328;
        goto LABEL_22;
      }
    }
LABEL_41:
    if (a3)
      return 589;
    else
      return 588;
  }
  return result;
}

- (int)type
{
  return self->type;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_resourceProvider);
}

@end
