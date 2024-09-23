@implementation FigRegToolboxGPU

- (FigRegToolboxGPU)init
{
  return -[FigRegToolboxGPU initWithCommandQueue:](self, "initWithCommandQueue:", 0);
}

- (FigRegToolboxGPU)initWithCommandQueue:(id)a3
{
  id v4;
  FigRegToolboxGPU *v5;
  uint64_t v6;
  void *v7;
  FigMetalContext *v8;
  FigMetalContext *metalContext;
  void *v10;
  void *v11;
  uint64_t v12;
  MTLComputePipelineState *pplnDownscale2to1;
  uint64_t v14;
  MTLComputePipelineState *pplnDownscale2to1WithMapping;
  uint64_t v16;
  MTLComputePipelineState *pplnSimple3x3BoxFilter;
  uint64_t v18;
  MTLComputePipelineState *pplnCornerResponse;
  uint64_t v20;
  MTLComputePipelineState *pplnCornerDetectionFirstPass4x4;
  uint64_t v22;
  MTLComputePipelineState *pplnCornerDetectionFinalPass;
  uint64_t v24;
  uint64_t v25;
  Class *v26;
  Class v27;
  uint64_t v28;
  MTLComputePipelineState *pplnRigidSolver;
  uint64_t v30;
  MTLComputePipelineState *pplnAffineSolver;
  uint64_t v32;
  MTLComputePipelineState *pplnHomographySolver;
  uint64_t v34;
  MTLComputePipelineState *pplnWarpImage;
  uint64_t v36;
  MTLComputePipelineState *pplnSpecialImageConverterA;
  FigRegToolboxGPU *v38;
  objc_super v40;
  __int16 v41;

  v4 = a3;
  v41 = 0;
  v40.receiver = self;
  v40.super_class = (Class)FigRegToolboxGPU;
  v5 = -[FigRegToolboxGPU init](&v40, sel_init);
  if (!v5)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_22;
  }
  v7 = (void *)v6;
  v8 = -[FigMetalContext initWithbundle:andOptionalCommandQueue:]([FigMetalContext alloc], "initWithbundle:andOptionalCommandQueue:", v6, v4);
  metalContext = v5->_metalContext;
  v5->_metalContext = v8;

  if (!v5->_metalContext)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_27:

    goto LABEL_22;
  }
  v10 = (void *)objc_opt_new();
  if (!v10)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
    goto LABEL_27;
  }
  v11 = v10;
  HIBYTE(v41) = 0;
  objc_msgSend(v10, "setConstantValue:type:atIndex:", (char *)&v41 + 1, 53, 0);
  -[FigMetalContext computePipelineStateFor:constants:](v5->_metalContext, "computePipelineStateFor:constants:", CFSTR("kernelDownscaleImage2To1"), v11);
  v12 = objc_claimAutoreleasedReturnValue();
  pplnDownscale2to1 = v5->_pplnDownscale2to1;
  v5->_pplnDownscale2to1 = (MTLComputePipelineState *)v12;

  if (v5->_pplnDownscale2to1)
  {
    HIBYTE(v41) = 1;
    objc_msgSend(v11, "setConstantValue:type:atIndex:", (char *)&v41 + 1, 53, 0);
    -[FigMetalContext computePipelineStateFor:constants:](v5->_metalContext, "computePipelineStateFor:constants:", CFSTR("kernelDownscaleImage2To1"), v11);
    v14 = objc_claimAutoreleasedReturnValue();
    pplnDownscale2to1WithMapping = v5->_pplnDownscale2to1WithMapping;
    v5->_pplnDownscale2to1WithMapping = (MTLComputePipelineState *)v14;

    if (v5->_pplnDownscale2to1WithMapping)
    {
      -[FigMetalContext computePipelineStateFor:constants:](v5->_metalContext, "computePipelineStateFor:constants:", CFSTR("kernelSimple3x3BoxFilter"), 0);
      v16 = objc_claimAutoreleasedReturnValue();
      pplnSimple3x3BoxFilter = v5->_pplnSimple3x3BoxFilter;
      v5->_pplnSimple3x3BoxFilter = (MTLComputePipelineState *)v16;

      if (v5->_pplnSimple3x3BoxFilter)
      {
        -[FigMetalContext computePipelineStateFor:constants:](v5->_metalContext, "computePipelineStateFor:constants:", CFSTR("kernelCornerResponse"), 0);
        v18 = objc_claimAutoreleasedReturnValue();
        pplnCornerResponse = v5->_pplnCornerResponse;
        v5->_pplnCornerResponse = (MTLComputePipelineState *)v18;

        if (v5->_pplnCornerResponse)
        {
          -[FigMetalContext computePipelineStateFor:constants:](v5->_metalContext, "computePipelineStateFor:constants:", CFSTR("kernelCornerDetectFirstPass4x4"), 0);
          v20 = objc_claimAutoreleasedReturnValue();
          pplnCornerDetectionFirstPass4x4 = v5->_pplnCornerDetectionFirstPass4x4;
          v5->_pplnCornerDetectionFirstPass4x4 = (MTLComputePipelineState *)v20;

          if (v5->_pplnCornerDetectionFirstPass4x4)
          {
            -[FigMetalContext computePipelineStateFor:constants:](v5->_metalContext, "computePipelineStateFor:constants:", CFSTR("kernelCornerDetectFinalPass"), 0);
            v22 = objc_claimAutoreleasedReturnValue();
            pplnCornerDetectionFinalPass = v5->_pplnCornerDetectionFinalPass;
            v5->_pplnCornerDetectionFinalPass = (MTLComputePipelineState *)v22;

            if (v5->_pplnCornerDetectionFinalPass)
            {
              v24 = 0;
              while (1)
              {
                HIBYTE(v41) = v24 & 1;
                LOBYTE(v41) = v24 >> 1;
                objc_msgSend(v11, "setConstantValue:type:atIndex:", (char *)&v41 + 1, 53, 1);
                objc_msgSend(v11, "setConstantValue:type:atIndex:", &v41, 53, 2);
                -[FigMetalContext computePipelineStateFor:constants:](v5->_metalContext, "computePipelineStateFor:constants:", CFSTR("kernelNccMatch"), v11);
                v25 = objc_claimAutoreleasedReturnValue();
                v26 = &v5->super.isa + v24;
                v27 = v26[221];
                v26[221] = (Class)v25;

                if (!v26[221])
                  break;
                if (++v24 == 4)
                {
                  -[FigMetalContext computePipelineStateFor:constants:](v5->_metalContext, "computePipelineStateFor:constants:", CFSTR("kernelRigidSolver"), 0);
                  v28 = objc_claimAutoreleasedReturnValue();
                  pplnRigidSolver = v5->_pplnRigidSolver;
                  v5->_pplnRigidSolver = (MTLComputePipelineState *)v28;

                  if (v5->_pplnRigidSolver)
                  {
                    -[FigMetalContext computePipelineStateFor:constants:](v5->_metalContext, "computePipelineStateFor:constants:", CFSTR("kernelAffineSolver"), 0);
                    v30 = objc_claimAutoreleasedReturnValue();
                    pplnAffineSolver = v5->_pplnAffineSolver;
                    v5->_pplnAffineSolver = (MTLComputePipelineState *)v30;

                    if (v5->_pplnAffineSolver)
                    {
                      -[FigMetalContext computePipelineStateFor:constants:](v5->_metalContext, "computePipelineStateFor:constants:", CFSTR("kernelHomographySolver"), 0);
                      v32 = objc_claimAutoreleasedReturnValue();
                      pplnHomographySolver = v5->_pplnHomographySolver;
                      v5->_pplnHomographySolver = (MTLComputePipelineState *)v32;

                      if (v5->_pplnHomographySolver)
                      {
                        -[FigMetalContext computePipelineStateFor:constants:](v5->_metalContext, "computePipelineStateFor:constants:", CFSTR("kernelWarpImage"), 0);
                        v34 = objc_claimAutoreleasedReturnValue();
                        pplnWarpImage = v5->_pplnWarpImage;
                        v5->_pplnWarpImage = (MTLComputePipelineState *)v34;

                        if (v5->_pplnWarpImage)
                        {
                          -[FigMetalContext computePipelineStateFor:constants:](v5->_metalContext, "computePipelineStateFor:constants:", CFSTR("kernelSpecialImageConverterA"), 0);
                          v36 = objc_claimAutoreleasedReturnValue();
                          pplnSpecialImageConverterA = v5->_pplnSpecialImageConverterA;
                          v5->_pplnSpecialImageConverterA = (MTLComputePipelineState *)v36;

                          if (v5->_pplnSpecialImageConverterA)
                          {
                            v38 = v5;

                            goto LABEL_20;
                          }
                        }
                      }
                    }
                  }
                  break;
                }
              }
            }
          }
        }
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  FigSignalErrorAt();

LABEL_22:
  v38 = 0;
LABEL_20:

  return v38;
}

- (int)allocateResourcesSimple:(unsigned int)a3 imageHeight:(unsigned int)a4 numberOfCorners:(unsigned int *)a5
{
  double v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v6 = 32 * a3 / a4 + 3;
  v7 = v6 & 0xFFFFFFFC;
  if ((v6 & 0xFFFFFFE0) != 0)
    v7 = 32;
  v8 = 32 * a4 / a3 + 3;
  if ((v8 & 0xFFFFFFE0) != 0)
    v9 = 32;
  else
    v9 = v8 & 0xFFFFFFFC;
  if (a3 >= a4)
    v10 = 32;
  else
    v10 = v7;
  if (a3 >= a4)
    v11 = v9;
  else
    v11 = 32;
  if (a5)
    *a5 = v11 * v10;
  LODWORD(v13) = 1;
  LODWORD(v5) = 0.75;
  return -[FigRegToolboxGPU allocateResources:imageWidth:imageHeight:gridWidth:gridHeight:templateRadius:searchRadius:minNCCThreshold:](self, "allocateResources:imageWidth:imageHeight:gridWidth:gridHeight:templateRadius:searchRadius:minNCCThreshold:", 5, *(_QWORD *)&a3, *(_QWORD *)&a4, v10, v11, 7, v5, v13);
}

- (int)allocateResources:(unsigned int)a3 imageWidth:(unsigned int)a4 imageHeight:(unsigned int)a5 gridWidth:(unsigned int)a6 gridHeight:(unsigned int)a7 templateRadius:(unsigned int)a8 searchRadius:(unsigned int)a9 minNCCThreshold:(float)a10
{
  uint64_t v10;
  unsigned int v19;
  float v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  MTLTexture *referenceImage;
  unint64_t numPyrLevels;
  unint64_t v29;
  char v30;
  FigRegToolboxGPU *v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  MTLTexture *v37;
  void *v38;
  uint64_t v39;
  MTLTexture *v40;
  void *v41;
  MTLTexture *v42;
  MTLTexture *pyramid1Initial;
  void *v44;
  MTLTexture *v45;
  MTLTexture *pyramid1CornerResponse;
  void *v47;
  MTLTexture *v48;
  MTLTexture *cornerDetectIntermediateTexture;
  unsigned int v50;
  void *v51;
  MTLBuffer *v52;
  MTLBuffer *pyramid1Corners;
  void *v54;
  MTLBuffer *v55;
  MTLBuffer *pyramid2Corners;
  void *v57;
  MTLBuffer *v58;
  MTLBuffer *nccWorkStorage;
  void *v60;
  MTLBuffer *v61;
  MTLBuffer *internalTransformResults;
  void *v63;
  MTLBuffer *v64;
  MTLBuffer *internalSolverElemList;
  unint64_t v66;
  $A1D0137EF639F55BA18942F6D92285E8 *p_infoCornerDetectionFirstPass4x4;
  unsigned int *p_h;
  unsigned int v69;
  unsigned int v70;
  uint64_t v71;
  MTLComputePipelineState **pplnNccMatch;
  void *v73;
  int v74;
  uint64_t v76;
  uint64_t v77;

  if (self->_resourcesAvailable)
  {
    if (self->_numPyrLevels == a3
      && self->_imageWidth == a4
      && self->_imageHeight == a5
      && self->_gridWidth == a6
      && self->_gridHeight == a7
      && self->_nccParmsFixed.templateRadius == a8
      && self->_nccParmsFixed.searchRadius == a9)
    {
      return 0;
    }
    -[FigRegToolboxGPU releaseResources](self, "releaseResources");
  }
  if (a4 - 65537 <= 0xFFFF01FE
    || a5 - 65537 <= 0xFFFF01FE
    || a6 - 33 <= 0xFFFFFFE0
    || a7 - 33 <= 0xFFFFFFE0
    || a8 > 0xB
    || ((1 << a8) & 0x888) == 0
    || a9 - 6 <= 0xFFFFFFFA
    || a3 - 9 <= 0xFFFFFFF7
    || a10 < 0.0
    || a10 > 1.0)
  {
    fig_log_get_emitter();
    v77 = v10;
    LODWORD(v76) = 0;
    FigDebugAssert3();
    FigSignalErrorAt();
    v74 = -12780;
LABEL_45:
    -[FigRegToolboxGPU releaseResources](self, "releaseResources", v76, v77);
    return v74;
  }
  if (a4 <= a5)
    v19 = a5;
  else
    v19 = a4;
  v20 = 1.0 / (float)v19;
  self->_numPyrLevels = a3;
  self->_imageWidth = a4;
  self->_imageHeight = a5;
  self->_nccParmsFixed.searchRadius = a9;
  v21 = (2 * a9) | 1;
  v22 = v21 * v21;
  self->_nccParmsFixed.searchDiameter = v21;
  self->_nccParmsFixed.searchSpaceSize = v21 * v21;
  self->_nccParmsFixed.templateRadius = a8;
  self->_nccParmsFixed.minNCCThreshold = a10;
  self->_nccParmsFixed.scaler = v20;
  self->_searchArea = v21 * v21;
  self->_gridWidth = a6;
  self->_gridHeight = a7;
  self->_gridNumCells = a7 * a6;
  v23 = ((a4 >> a3) + 7) & 0xFFFFFFF8;
  v24 = ((a5 >> a3) + 3) & 0xFFFFFFFC;
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 10, v23, v24, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
    fig_log_get_emitter();
    v77 = v10;
    LODWORD(v76) = 0;
    FigDebugAssert3();
    FigSignalErrorAt();
    goto LABEL_48;
  }
  v26 = v25;
  objc_msgSend(v25, "setUsage:", 3);
  referenceImage = self->_referenceImage;
  self->_referenceImage = 0;

  LODWORD(numPyrLevels) = self->_numPyrLevels;
  if ((_DWORD)numPyrLevels)
  {
    v29 = 0;
    v30 = -1;
    v31 = self;
    do
    {
      v32 = numPyrLevels + v30;
      v33 = ((_DWORD)v23 << v32);
      v34 = ((_DWORD)v24 << v32);
      v31->_pyramidLevelsDim[0].w = v33;
      v31->_pyramidLevelsDim[0].h = v34;
      objc_msgSend(v26, "setPixelFormat:", 10);
      objc_msgSend(v26, "setWidth:", v33);
      objc_msgSend(v26, "setHeight:", v34);
      -[FigMetalContext device](self->_metalContext, "device");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "newTextureWithDescriptor:", v26);
      v37 = v31->_pyramid1Image[0];
      v31->_pyramid1Image[0] = (MTLTexture *)v36;

      if (!v31->_pyramid1Image[0])
        goto LABEL_47;
      -[FigMetalContext device](self->_metalContext, "device");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "newTextureWithDescriptor:", v26);
      v40 = v31->_pyramid2Image[0];
      v31->_pyramid2Image[0] = (MTLTexture *)v39;

      if (!v31->_pyramid2Image[0])
        goto LABEL_47;
      ++v29;
      numPyrLevels = self->_numPyrLevels;
      --v30;
      v31 = (FigRegToolboxGPU *)((char *)v31 + 8);
    }
    while (v29 < numPyrLevels);
  }
  objc_msgSend(v26, "setPixelFormat:", 10);
  objc_msgSend(v26, "setWidth:", self->_pyramidLevelsDim[0].w);
  objc_msgSend(v26, "setHeight:", self->_pyramidLevelsDim[0].h);
  -[FigMetalContext device](self->_metalContext, "device");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (MTLTexture *)objc_msgSend(v41, "newTextureWithDescriptor:", v26);
  pyramid1Initial = self->_pyramid1Initial;
  self->_pyramid1Initial = v42;

  if (!self->_pyramid1Initial)
    goto LABEL_47;
  objc_msgSend(v26, "setPixelFormat:", 24);
  -[FigMetalContext device](self->_metalContext, "device");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (MTLTexture *)objc_msgSend(v44, "newTextureWithDescriptor:", v26);
  pyramid1CornerResponse = self->_pyramid1CornerResponse;
  self->_pyramid1CornerResponse = v45;

  if (!self->_pyramid1CornerResponse)
    goto LABEL_47;
  objc_msgSend(v26, "setPixelFormat:", 114);
  objc_msgSend(v26, "setWidth:", (unint64_t)self->_pyramidLevelsDim[0].w >> 2);
  objc_msgSend(v26, "setHeight:", (unint64_t)self->_pyramidLevelsDim[0].h >> 2);
  -[FigMetalContext device](self->_metalContext, "device");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (MTLTexture *)objc_msgSend(v47, "newTextureWithDescriptor:", v26);
  cornerDetectIntermediateTexture = self->_cornerDetectIntermediateTexture;
  self->_cornerDetectIntermediateTexture = v48;

  if (!self->_cornerDetectIntermediateTexture)
    goto LABEL_47;
  v50 = v22;
  -[FigMetalContext device](self->_metalContext, "device");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (MTLBuffer *)objc_msgSend(v51, "newBufferWithLength:options:", 8 * self->_gridNumCells, 0);
  pyramid1Corners = self->_pyramid1Corners;
  self->_pyramid1Corners = v52;

  if (!self->_pyramid1Corners)
    goto LABEL_47;
  -[FigMetalContext device](self->_metalContext, "device");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (MTLBuffer *)objc_msgSend(v54, "newBufferWithLength:options:", 8 * self->_gridNumCells, 0);
  pyramid2Corners = self->_pyramid2Corners;
  self->_pyramid2Corners = v55;

  if (!self->_pyramid2Corners)
    goto LABEL_47;
  -[FigMetalContext device](self->_metalContext, "device");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (MTLBuffer *)objc_msgSend(v57, "newBufferWithLength:options:", 4 * self->_gridNumCells * (unint64_t)v22, 0);
  nccWorkStorage = self->_nccWorkStorage;
  self->_nccWorkStorage = v58;

  if (!self->_nccWorkStorage)
    goto LABEL_47;
  -[FigMetalContext device](self->_metalContext, "device");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = (MTLBuffer *)objc_msgSend(v60, "newBufferWithLength:options:", 64, 0);
  internalTransformResults = self->_internalTransformResults;
  self->_internalTransformResults = v61;

  if (!self->_internalTransformResults
    || (-[FigMetalContext device](self->_metalContext, "device"),
        v63 = (void *)objc_claimAutoreleasedReturnValue(),
        v64 = (MTLBuffer *)objc_msgSend(v63, "newBufferWithLength:options:", 20 * self->_gridNumCells, 0),
        internalSolverElemList = self->_internalSolverElemList,
        self->_internalSolverElemList = v64,
        internalSolverElemList,
        v63,
        !self->_internalSolverElemList))
  {
LABEL_47:
    fig_log_get_emitter();
    v77 = v10;
    LODWORD(v76) = 0;
    FigDebugAssert3();
    FigSignalErrorAt();

LABEL_48:
    v74 = -12786;
    goto LABEL_45;
  }
  if (self->_numPyrLevels)
  {
    v66 = 0;
    p_infoCornerDetectionFirstPass4x4 = &self->_infoCornerDetectionFirstPass4x4;
    p_h = &self->_pyramidLevelsDim[0].h;
    do
    {
      v69 = *(p_h - 1);
      v70 = *p_h;
      maximizeThreadgroupParameters(self->_pplnDownscale2to1, v69, *p_h, &p_infoCornerDetectionFirstPass4x4[-4].level[7].threadsPerThreadgroup.width);
      maximizeThreadgroupParameters(self->_pplnSimple3x3BoxFilter, v69 >> 1, v70 >> 1, &p_infoCornerDetectionFirstPass4x4[-3].level[7].threadsPerThreadgroup.height);
      maximizeThreadgroupParameters(self->_pplnCornerResponse, v69 >> 1, v70 >> 1, &p_infoCornerDetectionFirstPass4x4[-2].level[7].threadsPerThreadgroup.depth);
      maximizeThreadgroupParameters(self->_pplnCornerDetectionFirstPass4x4, v69 >> 2, v70 >> 2, p_infoCornerDetectionFirstPass4x4);
      ++v66;
      p_infoCornerDetectionFirstPass4x4 = ($A1D0137EF639F55BA18942F6D92285E8 *)((char *)p_infoCornerDetectionFirstPass4x4
                                                                              + 48);
      p_h += 2;
    }
    while (v66 < self->_numPyrLevels);
  }
  maximizeThreadgroupParameters(self->_pplnCornerDetectionFinalPass, self->_gridWidth, self->_gridHeight, &self->_infoCornerDetectionFinalPass.threadgroupsPerGrid.width);
  v71 = 0;
  pplnNccMatch = self->_pplnNccMatch;
  do
  {
    v73 = *pplnNccMatch++;
    maximizeThreadgroupParameters(v73, self->_gridNumCells, v50, &self->_infoNccMatch[v71++].threadgroupsPerGrid.width);
  }
  while (v71 != 4);
  maximizeThreadgroupParameters(self->_pplnWarpImage, self->_imageWidth >> 1, self->_imageHeight >> 1, &self->_infoWarpImage.threadgroupsPerGrid.width);
  self->_resourcesAvailable = 1;

  return 0;
}

- (int)releaseResources
{
  MTLTexture *referenceImage;
  uint64_t i;
  MTLTexture *v5;
  MTLTexture *v6;
  MTLTexture *pyramid1Initial;
  MTLTexture *pyramid1CornerResponse;
  MTLBuffer *pyramid1Corners;
  MTLTexture *cornerDetectIntermediateTexture;
  MTLBuffer *pyramid2Corners;
  MTLBuffer *nccWorkStorage;
  MTLBuffer *internalTransformResults;
  MTLBuffer *internalSolverElemList;

  self->_resourcesAvailable = 0;
  -[FigMetalContext waitForIdle](self->_metalContext, "waitForIdle");
  referenceImage = self->_referenceImage;
  self->_referenceImage = 0;

  for (i = 0; i != 8; ++i)
  {
    v5 = self->_pyramid1Image[i];
    self->_pyramid1Image[i] = 0;

    v6 = self->_pyramid2Image[i];
    self->_pyramid2Image[i] = 0;

  }
  pyramid1Initial = self->_pyramid1Initial;
  self->_pyramid1Initial = 0;

  pyramid1CornerResponse = self->_pyramid1CornerResponse;
  self->_pyramid1CornerResponse = 0;

  pyramid1Corners = self->_pyramid1Corners;
  self->_pyramid1Corners = 0;

  cornerDetectIntermediateTexture = self->_cornerDetectIntermediateTexture;
  self->_cornerDetectIntermediateTexture = 0;

  pyramid2Corners = self->_pyramid2Corners;
  self->_pyramid2Corners = 0;

  nccWorkStorage = self->_nccWorkStorage;
  self->_nccWorkStorage = 0;

  internalTransformResults = self->_internalTransformResults;
  self->_internalTransformResults = 0;

  internalSolverElemList = self->_internalSolverElemList;
  self->_internalSolverElemList = 0;

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[FigMetalContext waitForIdle](self->_metalContext, "waitForIdle");
  -[FigRegToolboxGPU releaseResources](self, "releaseResources");
  v3.receiver = self;
  v3.super_class = (Class)FigRegToolboxGPU;
  -[FigRegToolboxGPU dealloc](&v3, sel_dealloc);
}

- (int)processReferenceImage:(id)a3 histogram:(id *)a4 doWaitForIdle:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  void *v10;
  unsigned int imageWidth;
  unsigned int imageHeight;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int h;
  unsigned int gridHeight;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  Class *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v38;
  __int128 v39;
  unint64_t v40;
  __int128 v41;
  unint64_t depth;

  v5 = a5;
  v9 = a3;
  v10 = v9;
  if (!self->_resourcesAvailable
    || (imageWidth = self->_imageWidth, imageHeight = self->_imageHeight, objc_msgSend(v9, "pixelFormat") != 10))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v36 = -1;
    FigSignalErrorAt();
    v14 = 0;
    goto LABEL_22;
  }
  objc_storeStrong((id *)&self->_referenceImage, a3);
  self->_referenceImagePixelMappingFlag = buildHistogramMapping((uint64_t)a4, (uint64_t)self->_referenceImagePixelMapping, &self->_referenceImagePixelHistCoef);
  -[FigMetalContext commandQueue](self->_metalContext, "commandQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "commandBuffer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14
    || (objc_msgSend(v14, "setLabel:", CFSTR("FigRegToolboxGPU_processReferenceImage")),
        objc_msgSend(v14, "computeCommandEncoder"),
        (v15 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    fig_log_get_emitter();
    goto LABEL_24;
  }
  v16 = v15;
  v17 = 144;
  if (!self->_referenceImagePixelMappingFlag)
    v17 = 136;
  objc_msgSend(v15, "setComputePipelineState:", *(Class *)((char *)&self->super.isa + v17));
  objc_msgSend(v16, "setTexture:atIndex:", self->_referenceImage, 0);
  objc_msgSend(v16, "setTexture:atIndex:", self->_pyramid1Image[0], 1);
  if (self->_referenceImagePixelMappingFlag)
    objc_msgSend(v16, "setBytes:length:atIndex:", self->_referenceImagePixelMapping, 256, 0);
  objc_msgSend(v16, "setBytes:length:atIndex:", &self->_referenceImagePixelHistCoef, 4, 1);
  v41 = *(_OWORD *)&self->_infoDownscale2to1.level[0].threadgroupsPerGrid.width;
  depth = self->_infoDownscale2to1.level[0].threadgroupsPerGrid.depth;
  v39 = *(_OWORD *)&self->_infoDownscale2to1.level[0].threadsPerThreadgroup.width;
  v40 = self->_infoDownscale2to1.level[0].threadsPerThreadgroup.depth;
  objc_msgSend(v16, "dispatchThreadgroups:threadsPerThreadgroup:", &v41, &v39);
  objc_msgSend(v16, "endEncoding");

  objc_msgSend(v14, "computeCommandEncoder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
    goto LABEL_28;
  v19 = v18;
  objc_msgSend(v18, "setComputePipelineState:", self->_pplnSimple3x3BoxFilter);
  objc_msgSend(v19, "setTexture:atIndex:", self->_pyramid1Image[0], 0);
  objc_msgSend(v19, "setTexture:atIndex:", self->_pyramid1Initial, 1);
  v41 = *(_OWORD *)&self->_infoSimple3x3BoxFilter.level[0].threadgroupsPerGrid.width;
  depth = self->_infoSimple3x3BoxFilter.level[0].threadgroupsPerGrid.depth;
  v39 = *(_OWORD *)&self->_infoSimple3x3BoxFilter.level[0].threadsPerThreadgroup.width;
  v40 = self->_infoSimple3x3BoxFilter.level[0].threadsPerThreadgroup.depth;
  objc_msgSend(v19, "dispatchThreadgroups:threadsPerThreadgroup:", &v41, &v39);
  objc_msgSend(v19, "endEncoding");

  v38 = 262148;
  objc_msgSend(v14, "computeCommandEncoder");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
LABEL_28:
    fig_log_get_emitter();
    goto LABEL_24;
  }
  v21 = v20;
  WORD2(v38) = (imageWidth >> 1) - 4;
  HIWORD(v38) = (imageHeight >> 1) - 4;
  objc_msgSend(v20, "setComputePipelineState:", self->_pplnCornerResponse);
  objc_msgSend(v21, "setTexture:atIndex:", self->_pyramid1Initial, 0);
  objc_msgSend(v21, "setTexture:atIndex:", self->_pyramid1CornerResponse, 1);
  objc_msgSend(v21, "setBytes:length:atIndex:", &v38, 8, 0);
  v41 = *(_OWORD *)&self->_infoCornerResponse.level[0].threadgroupsPerGrid.width;
  depth = self->_infoCornerResponse.level[0].threadgroupsPerGrid.depth;
  v39 = *(_OWORD *)&self->_infoCornerResponse.level[0].threadsPerThreadgroup.width;
  v40 = self->_infoCornerResponse.level[0].threadsPerThreadgroup.depth;
  objc_msgSend(v21, "dispatchThreadgroups:threadsPerThreadgroup:", &v41, &v39);
  objc_msgSend(v21, "endEncoding");

  v38 = 524296;
  objc_msgSend(v14, "computeCommandEncoder");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
    goto LABEL_23;
  v23 = v22;
  WORD2(v38) = (imageWidth >> 1) - 8;
  HIWORD(v38) = (imageHeight >> 1) - 8;
  objc_msgSend(v22, "setComputePipelineState:", self->_pplnCornerDetectionFirstPass4x4);
  objc_msgSend(v23, "setTexture:atIndex:", self->_pyramid1CornerResponse, 0);
  objc_msgSend(v23, "setTexture:atIndex:", self->_cornerDetectIntermediateTexture, 1);
  objc_msgSend(v23, "setBytes:length:atIndex:", &v38, 8, 0);
  v41 = *(_OWORD *)&self->_infoCornerDetectionFirstPass4x4.level[0].threadgroupsPerGrid.width;
  depth = self->_infoCornerDetectionFirstPass4x4.level[0].threadgroupsPerGrid.depth;
  v39 = *(_OWORD *)&self->_infoCornerDetectionFirstPass4x4.level[0].threadsPerThreadgroup.width;
  v40 = self->_infoCornerDetectionFirstPass4x4.level[0].threadsPerThreadgroup.depth;
  objc_msgSend(v23, "dispatchThreadgroups:threadsPerThreadgroup:", &v41, &v39);
  objc_msgSend(v23, "endEncoding");

  h = self->_pyramidLevelsDim[0].h;
  LOWORD(v38) = self->_pyramidLevelsDim[0].w >> 2;
  WORD1(v38) = h >> 2;
  gridHeight = self->_gridHeight;
  WORD2(v38) = self->_gridWidth;
  HIWORD(v38) = gridHeight;
  objc_msgSend(v14, "computeCommandEncoder");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v26)
  {
LABEL_23:
    fig_log_get_emitter();
LABEL_24:
    FigDebugAssert3();
    v36 = -1;
    FigSignalErrorAt();
    goto LABEL_22;
  }
  v27 = v26;
  objc_msgSend(v26, "setComputePipelineState:", self->_pplnCornerDetectionFinalPass);
  objc_msgSend(v27, "setTexture:atIndex:", self->_cornerDetectIntermediateTexture, 0);
  objc_msgSend(v27, "setBytes:length:atIndex:", &v38, 8, 0);
  objc_msgSend(v27, "setBuffer:offset:atIndex:", self->_pyramid1Corners, 0, 1);
  v41 = *(_OWORD *)&self->_infoCornerDetectionFinalPass.threadgroupsPerGrid.width;
  depth = self->_infoCornerDetectionFinalPass.threadgroupsPerGrid.depth;
  v39 = *(_OWORD *)&self->_infoCornerDetectionFinalPass.threadsPerThreadgroup.width;
  v40 = self->_infoCornerDetectionFinalPass.threadsPerThreadgroup.depth;
  objc_msgSend(v27, "dispatchThreadgroups:threadsPerThreadgroup:", &v41, &v39);
  objc_msgSend(v27, "endEncoding");

  LODWORD(v38) = 1065353216;
  if (self->_numPyrLevels >= 2)
  {
    v28 = 0;
    v29 = 0;
    do
    {
      objc_msgSend(v14, "computeCommandEncoder");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v30)
        goto LABEL_23;
      v31 = v30;
      objc_msgSend(v30, "setComputePipelineState:", self->_pplnDownscale2to1);
      v32 = &self->super.isa + v29;
      objc_msgSend(v31, "setTexture:atIndex:", v32[294], 0);
      objc_msgSend(v31, "setTexture:atIndex:", v32[295], 1);
      objc_msgSend(v31, "setBytes:length:atIndex:", &v38, 4, 1);
      v41 = *(_OWORD *)&self->_infoDownscale2to1.level[v28 + 1].threadgroupsPerGrid.width;
      depth = self->_infoDownscale2to1.level[v28 + 1].threadgroupsPerGrid.depth;
      v39 = *(_OWORD *)&self->_infoDownscale2to1.level[v28 + 1].threadsPerThreadgroup.width;
      v40 = self->_infoDownscale2to1.level[v28 + 1].threadsPerThreadgroup.depth;
      objc_msgSend(v31, "dispatchThreadgroups:threadsPerThreadgroup:", &v41, &v39);
      objc_msgSend(v31, "endEncoding");

      v33 = v29 + 2;
      ++v29;
      ++v28;
    }
    while (v33 < self->_numPyrLevels);
  }
  if (*MEMORY[0x1E0CA1FC0])
  {
    objc_msgSend(v14, "commandQueue");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "commandBuffer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v35, "setLabel:", CFSTR("KTRACE_MTLCMDBUF"));
    objc_msgSend(v35, "addCompletedHandler:", &__block_literal_global_0);
    objc_msgSend(v35, "commit");
    objc_msgSend(v14, "addCompletedHandler:", &__block_literal_global_80);

  }
  objc_msgSend(v14, "commit");
  if (v5)
    objc_msgSend(v14, "waitUntilCompleted");
  v36 = 0;
LABEL_22:

  return v36;
}

uint64_t __66__FigRegToolboxGPU_processReferenceImage_histogram_doWaitForIdle___block_invoke()
{
  uint64_t result;

  if (*MEMORY[0x1E0CA1FC0] == 1)
    return kdebug_trace();
  return result;
}

void __66__FigRegToolboxGPU_processReferenceImage_histogram_doWaitForIdle___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (objc_msgSend(v2, "status") == 4)
  {
    objc_msgSend(v2, "GPUEndTime");
    objc_msgSend(v2, "GPUStartTime");
  }
  else
  {
    objc_msgSend(v2, "status");
  }
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();

}

- (int)warpTargetImage:(id)a3 outTexChma:(id)a4 inTexLuma:(id)a5 inTexChma:(id)a6 solverSelector:(int)a7 histogram:(id *)a8 roi:(CGRect *)a9 doWaitForIdle:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  __int128 v28;
  unint64_t v29;
  __int128 v30;
  unint64_t depth;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  if (!self->_resourcesAvailable
    || (verifyRoi((uint64_t)a9) & 0x80000000) != 0
    || objc_msgSend(v16, "pixelFormat") != 10
    || objc_msgSend(v17, "pixelFormat") != 30
    || objc_msgSend(v18, "pixelFormat") != 10
    || objc_msgSend(v19, "pixelFormat") != 30)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_15;
  }
  if (a7 >= 3)
  {
LABEL_15:
    v26 = -1;
    FigSignalErrorAt();
    v23 = 0;
    v25 = 0;
    v20 = 0;
    goto LABEL_16;
  }
  v20 = *((id *)&self->_infoNccMatch[4].threadgroupsPerGrid.width + a7);
  v21 = -[FigRegToolboxGPU computeTransformInternal:solverKernel:solverOutputResults:histogram:roi:waitForCompletion:](self, "computeTransformInternal:solverKernel:solverOutputResults:histogram:roi:waitForCompletion:", v18, v20, self->_internalTransformResults, a8, a9, 0);
  if (v21)
  {
    v26 = v21;
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
    v23 = 0;
    v25 = 0;
  }
  else
  {
    -[FigMetalContext commandQueue](self->_metalContext, "commandQueue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "commandBuffer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v23, "setLabel:", CFSTR("FigRegToolboxGPU_warpTargetImage"));
      objc_msgSend(v23, "computeCommandEncoder");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v24)
      {
        objc_msgSend(v24, "setComputePipelineState:", self->_pplnWarpImage);
        objc_msgSend(v25, "setTexture:atIndex:", v18, 0);
        objc_msgSend(v25, "setTexture:atIndex:", v19, 1);
        objc_msgSend(v25, "setTexture:atIndex:", v16, 2);
        objc_msgSend(v25, "setTexture:atIndex:", v17, 3);
        objc_msgSend(v25, "setBuffer:offset:atIndex:", self->_internalTransformResults, 0, 0);
        v30 = *(_OWORD *)&self->_infoWarpImage.threadgroupsPerGrid.width;
        depth = self->_infoWarpImage.threadgroupsPerGrid.depth;
        v28 = *(_OWORD *)&self->_infoWarpImage.threadsPerThreadgroup.width;
        v29 = self->_infoWarpImage.threadsPerThreadgroup.depth;
        objc_msgSend(v25, "dispatchThreadgroups:threadsPerThreadgroup:", &v30, &v28);
        objc_msgSend(v25, "endEncoding");
        objc_msgSend(v23, "commit");
        if (a10)
          objc_msgSend(v23, "waitUntilCompleted");
      }
      else
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        FigSignalErrorAt();
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      FigSignalErrorAt();
      v25 = 0;
    }
    v26 = 0;
  }
LABEL_16:

  return v26;
}

- (int)computeTransform:(id)a3 transform:(id *)a4 outputCorners:(id *)a5 solverSelector:(int)a6 histogram:(id *)a7 roi:(CGRect *)a8
{
  id v14;
  id v15;
  void *v16;
  id v17;
  int v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  float32x4_t v23;
  int16x4_t v24;
  uint64_t gridNumCells;
  _DWORD *v26;
  float *p_var5;
  _DWORD *v28;
  int v29;
  int v30;
  int v31;

  v14 = a3;
  if (!self->_resourcesAvailable
    || (verifyRoi((uint64_t)a8) & 0x80000000) != 0
    || objc_msgSend(v14, "pixelFormat") != 10)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_17;
  }
  if (a6 > 2)
  {
LABEL_17:
    v16 = 0;
    v31 = -1;
LABEL_18:
    FigSignalErrorAt();
    goto LABEL_19;
  }
  v15 = *((id *)&self->_infoNccMatch[4].threadgroupsPerGrid.width + a6);
  v16 = v15;
  if (a4)
    v17 = v15;
  else
    v17 = 0;
  v18 = -[FigRegToolboxGPU computeTransformInternal:solverKernel:solverOutputResults:histogram:roi:waitForCompletion:](self, "computeTransformInternal:solverKernel:solverOutputResults:histogram:roi:waitForCompletion:", v14, v17, self->_internalTransformResults, a7, a8, ((unint64_t)a4 | (unint64_t)a5) != 0);
  if (v18)
  {
    v31 = v18;
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_18;
  }
  if (a4)
  {
    v19 = -[MTLBuffer contents](self->_internalTransformResults, "contents");
    a4->var0[0] = *(float *)(v19 + 16);
    a4->var0[1] = *(float *)(v19 + 32);
    a4->var0[2] = *(float *)(v19 + 48);
    a4->var0[3] = *(float *)(v19 + 20);
    a4->var0[4] = *(float *)(v19 + 36);
    a4->var0[5] = *(float *)(v19 + 52);
    a4->var0[6] = *(float *)(v19 + 24);
    a4->var0[7] = *(float *)(v19 + 40);
    v20 = *(_DWORD *)(v19 + 4);
    a4->var0[8] = 1.0;
    a4->var1 = v20;
    a4->var2 = *(float *)(v19 + 8);
  }
  if (a5)
  {
    v21 = -[MTLBuffer contents](self->_pyramid1Corners, "contents");
    v22 = -[MTLBuffer contents](self->_pyramid2Corners, "contents");
    gridNumCells = self->_gridNumCells;
    if ((_DWORD)gridNumCells)
    {
      v26 = (_DWORD *)(v21 + 4);
      p_var5 = &a5->var5;
      v28 = (_DWORD *)(v22 + 4);
      do
      {
        v23.i16[0] = *((_WORD *)v26 - 2);
        v23.i16[2] = *((_WORD *)v26 - 1);
        v29 = *v26;
        v26 += 2;
        v24.i16[1] = HIWORD(v29);
        *(_DWORD *)p_var5 = v29;
        v24.i16[0] = *((_WORD *)v28 - 2);
        v24.i16[2] = *((_WORD *)v28 - 1);
        v23 = vcvtq_f32_s32(vmovl_s16(vuzp1_s16(*(int16x4_t *)v23.f32, v24)));
        *(float32x4_t *)(p_var5 - 5) = v23;
        v30 = *v28;
        v28 += 2;
        v23.i16[1] = HIWORD(v30);
        *((_DWORD *)p_var5 - 1) = v30;
        p_var5 += 6;
        --gridNumCells;
      }
      while (gridNumCells);
    }
  }
  v31 = 0;
LABEL_19:

  return v31;
}

- (int)specialImageConverterA:(__CVBuffer *)a3 outTexture1:(__CVBuffer *)a4 outTexture2:(__CVBuffer *)a5 outTexture3:(__CVBuffer *)a6 doWaitForIdle:(BOOL)a7
{
  void *v11;
  unsigned int Width;
  unsigned int Height;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  _BOOL4 v26;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  _OWORD v33[4];

  v26 = a7;
  -[FigMetalContext device](self->_metalContext, "device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  Width = CVPixelBufferGetWidth(a5);
  Height = CVPixelBufferGetHeight(a5);
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 23, Width, Height, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14
    || (objc_msgSend(v14, "setUsage:", 3),
        objc_msgSend(v15, "setWidth:", 3 * Width),
        objc_msgSend(v15, "setHeight:", Height),
        objc_msgSend(v15, "setPixelFormat:", 23),
        (v28 = objc_msgSend(v11, "newTextureWithDescriptor:iosurface:plane:", v15, CVPixelBufferGetIOSurface(a3), 0)) == 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v24 = -1;
    FigSignalErrorAt();
    v23 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v20 = 0;
    v22 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v15, "setWidth:", Width);
  objc_msgSend(v15, "setHeight:", Height);
  objc_msgSend(v15, "setPixelFormat:", 10);
  v16 = (void *)objc_msgSend(v11, "newTextureWithDescriptor:iosurface:plane:", v15, CVPixelBufferGetIOSurface(a4), 0);
  if (!v16)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v24 = -1;
    FigSignalErrorAt();
    v17 = 0;
LABEL_15:
    v18 = 0;
LABEL_17:
    v20 = 0;
LABEL_19:
    v22 = 0;
LABEL_21:
    v23 = (void *)v28;
    goto LABEL_11;
  }
  objc_msgSend(v15, "setWidth:", Width);
  objc_msgSend(v15, "setHeight:", Height);
  objc_msgSend(v15, "setPixelFormat:", 23);
  v17 = (void *)objc_msgSend(v11, "newTextureWithDescriptor:iosurface:plane:", v15, CVPixelBufferGetIOSurface(a5), 0);
  if (!v17)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v24 = -1;
    FigSignalErrorAt();
    goto LABEL_15;
  }
  objc_msgSend(v15, "setWidth:", 2 * Width);
  objc_msgSend(v15, "setHeight:", Height);
  objc_msgSend(v15, "setPixelFormat:", 23);
  v18 = (void *)objc_msgSend(v11, "newTextureWithDescriptor:iosurface:plane:", v15, CVPixelBufferGetIOSurface(a6), 0);
  if (!v18)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v24 = -1;
    FigSignalErrorAt();
    goto LABEL_17;
  }
  memset(v33, 0, 48);
  maximizeThreadgroupParameters(self->_pplnSpecialImageConverterA, Width, Height, v33);
  -[FigMetalContext commandQueue](self->_metalContext, "commandQueue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commandBuffer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v24 = -1;
    FigSignalErrorAt();
    goto LABEL_19;
  }
  objc_msgSend(v20, "setLabel:", CFSTR("FigRegToolboxGPU_specialImageConverterA"));
  objc_msgSend(v20, "computeCommandEncoder");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (!v21)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v24 = -1;
    FigSignalErrorAt();
    goto LABEL_21;
  }
  objc_msgSend(v21, "setComputePipelineState:", self->_pplnSpecialImageConverterA);
  v23 = (void *)v28;
  objc_msgSend(v22, "setTexture:atIndex:", v28, 0);
  objc_msgSend(v22, "setTexture:atIndex:", v16, 1);
  objc_msgSend(v22, "setTexture:atIndex:", v17, 2);
  objc_msgSend(v22, "setTexture:atIndex:", v18, 3);
  v31 = v33[0];
  v32 = *(_QWORD *)&v33[1];
  v29 = *(_OWORD *)((char *)&v33[1] + 8);
  v30 = *((_QWORD *)&v33[2] + 1);
  objc_msgSend(v22, "dispatchThreadgroups:threadsPerThreadgroup:", &v31, &v29);
  objc_msgSend(v22, "endEncoding");
  objc_msgSend(v20, "commit");
  if (v26)
    objc_msgSend(v20, "waitUntilCompleted");
  v24 = 0;
LABEL_11:

  return v24;
}

- (int)computeTransformInternal:(id)a3 solverKernel:(id)a4 solverOutputResults:(id)a5 histogram:(id *)a6 roi:(CGRect *)a7 waitForCompletion:(BOOL)a8
{
  int v8;
  id v14;
  id v15;
  int32x4_t v16;
  int32x4_t v17;
  float64x2_t v18;
  float64x2_t v19;
  __int128 v20;
  int v21;
  float v22;
  void *v23;
  void *v24;
  unint64_t numPyrLevels;
  unint64_t v26;
  void *v27;
  MTLTexture **pyramid2Image;
  $E8CF8C4D35898297CF58D66FCEA3D064 *p_threadsPerThreadgroup;
  void *v30;
  _BOOL4 v31;
  float v32;
  char v33;
  uint64_t v34;
  MTLTexture *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  MTLTexture **p_referenceImage;
  MTLTexture *v42;
  $1A1C530DA3A3B0902846FB4EC51036A8 *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  id v49;
  void *v50;
  uint64_t v51;
  void *v52;
  MTLTexture *v53;
  uint64_t v54;
  int64x2_t v55;
  int64x2_t v56;
  uint64_t v57;
  __int128 v58;
  unint64_t v59;
  __int128 v60;
  unint64_t depth;
  float v62;
  float v63;
  unsigned int gridNumCells;
  $FBAD58A07E3F385965C9E61CAC1FE09C nccParmsFixed;
  int32x4_t v66;
  __int128 v67;
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
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[260];
  uint64_t v85;

  v8 = a8;
  v85 = *MEMORY[0x1E0C80C00];
  v53 = (MTLTexture *)a3;
  v14 = a4;
  v15 = a5;
  v17.i32[0] = 0;
  v17.i32[2] = 0;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  memset(v84, 0, 204);
  v67 = 0u;
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
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  nccParmsFixed = self->_nccParmsFixed;
  if (a7)
  {
    v18.f64[0] = a7->origin.x;
    v19.f64[0] = a7->origin.y;
    *(float32x2_t *)v16.i8 = vcvt_f32_u32(*(uint32x2_t *)&self->_imageWidth);
    v19.f64[1] = v19.f64[0] + a7->size.height;
    v18.f64[1] = a7->origin.x + a7->size.width;
    v17 = vcvtq_s32_f32(vrndaq_f32(vmulq_f32((float32x4_t)vzip1q_s32(v16, v16), vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v18), v19))));
  }
  else
  {
    v17.i32[1] = self->_imageWidth;
    v17.i32[3] = self->_imageHeight;
  }
  v66 = v17;
  if (self->_referenceImagePixelMappingFlag)
  {
    v20 = *(_OWORD *)&self->_referenceImagePixelMapping[224];
    v81 = *(_OWORD *)&self->_referenceImagePixelMapping[208];
    v82 = v20;
    v83 = *(_OWORD *)&self->_referenceImagePixelMapping[240];
    v80 = *(_OWORD *)&self->_referenceImagePixelMapping[192];
    v76 = *(_OWORD *)&self->_referenceImagePixelMapping[128];
    v77 = *(_OWORD *)&self->_referenceImagePixelMapping[144];
    v78 = *(_OWORD *)&self->_referenceImagePixelMapping[160];
    v79 = *(_OWORD *)&self->_referenceImagePixelMapping[176];
    v72 = *(_OWORD *)&self->_referenceImagePixelMapping[64];
    v73 = *(_OWORD *)&self->_referenceImagePixelMapping[80];
    v74 = *(_OWORD *)&self->_referenceImagePixelMapping[96];
    v75 = *(_OWORD *)&self->_referenceImagePixelMapping[112];
    v68 = *(_OWORD *)self->_referenceImagePixelMapping;
    v69 = *(_OWORD *)&self->_referenceImagePixelMapping[16];
    v70 = *(_OWORD *)&self->_referenceImagePixelMapping[32];
    v71 = *(_OWORD *)&self->_referenceImagePixelMapping[48];
  }
  v63 = 0.0;
  v21 = buildHistogramMapping((uint64_t)a6, (uint64_t)v84, &v63);
  v22 = v63;
  *((float *)&v67 + 2) = self->_referenceImagePixelHistCoef * 255.0;
  *((float *)&v67 + 3) = v63 * 255.0;
  gridNumCells = self->_gridNumCells;
  -[FigMetalContext commandQueue](self->_metalContext, "commandQueue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commandBuffer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    fig_log_get_emitter();
    goto LABEL_52;
  }
  v49 = v15;
  v50 = v14;
  objc_msgSend(v24, "setLabel:", CFSTR("FigRegToolboxGPU_computeTransformInternal"));
  LODWORD(numPyrLevels) = self->_numPyrLevels;
  v52 = v24;
  if ((_DWORD)numPyrLevels)
  {
    v26 = 0;
    v27 = 0;
    pyramid2Image = self->_pyramid2Image;
    p_threadsPerThreadgroup = &self->_infoDownscale2to1.level[0].threadsPerThreadgroup;
    do
    {
      v30 = v27;
      objc_msgSend(v52, "computeCommandEncoder");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v27)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        v8 = -1;
        FigSignalErrorAt();
        v15 = v49;
        v14 = v50;
        v24 = v52;
        goto LABEL_47;
      }
      v31 = v26 == 0;
      if (v26)
        v32 = 1.0;
      else
        v32 = v22;
      v62 = v32;
      v33 = v21 & v31;
      if ((v21 & v31) != 0)
        v34 = 144;
      else
        v34 = 136;
      objc_msgSend(v27, "setComputePipelineState:", *(Class *)((char *)&self->super.isa + v34));
      v35 = v53;
      if (v26)
        v35 = *(pyramid2Image - 1);
      objc_msgSend(v27, "setTexture:atIndex:", v35, 0);
      objc_msgSend(v27, "setTexture:atIndex:", *pyramid2Image, 1);
      if ((v33 & 1) != 0)
        objc_msgSend(v27, "setBytes:length:atIndex:", v84, 256, 0);
      objc_msgSend(v27, "setBytes:length:atIndex:", &v62, 4, 1);
      v60 = *(_OWORD *)&p_threadsPerThreadgroup[-1].width;
      depth = p_threadsPerThreadgroup[-1].depth;
      v58 = *(_OWORD *)&p_threadsPerThreadgroup->width;
      v59 = p_threadsPerThreadgroup->depth;
      objc_msgSend(v27, "dispatchThreadgroups:threadsPerThreadgroup:", &v60, &v58);
      objc_msgSend(v27, "endEncoding");
      ++v26;
      numPyrLevels = self->_numPyrLevels;
      ++pyramid2Image;
      p_threadsPerThreadgroup += 2;
    }
    while (v26 < numPyrLevels);
    DWORD1(v67) = 1;
    v24 = v52;
    if ((numPyrLevels & 0x80000000) == 0)
      goto LABEL_24;
LABEL_36:
    v15 = v49;
    v14 = v50;
    if (!v50)
      goto LABEL_43;
    if ((unint64_t)objc_msgSend(v50, "threadExecutionWidth") > 0x3F)
      v44 = 64;
    else
      v44 = objc_msgSend(v50, "threadExecutionWidth");
    objc_msgSend(v24, "computeCommandEncoder");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      objc_msgSend(v45, "setComputePipelineState:", v50);
      objc_msgSend(v45, "setBytes:length:atIndex:", &gridNumCells, 4, 0);
      objc_msgSend(v45, "setBuffer:offset:atIndex:", self->_internalSolverElemList, 0, 1);
      objc_msgSend(v45, "setBuffer:offset:atIndex:", v49, 0, 2);
      v55 = vdupq_n_s64(1uLL);
      v56 = v55;
      v57 = 1;
      v54 = v44;
      objc_msgSend(v45, "dispatchThreadgroups:threadsPerThreadgroup:", &v56, &v54);
      objc_msgSend(v45, "endEncoding");
      v27 = v45;
LABEL_43:
      if (*MEMORY[0x1E0CA1FC0])
      {
        objc_msgSend(v24, "commandQueue");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "commandBuffer");
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v47, "setLabel:", CFSTR("KTRACE_MTLCMDBUF"));
        objc_msgSend(v47, "addCompletedHandler:", &__block_literal_global_99);
        objc_msgSend(v47, "commit");
        objc_msgSend(v24, "addCompletedHandler:", &__block_literal_global_100);

      }
      objc_msgSend(v24, "commit");
      if (v8)
      {
        objc_msgSend(v24, "waitUntilCompleted");
        v8 = 0;
      }
      goto LABEL_47;
    }
    fig_log_get_emitter();
LABEL_52:
    FigDebugAssert3();
    v8 = -1;
    FigSignalErrorAt();
    v27 = 0;
    goto LABEL_47;
  }
  v27 = 0;
  DWORD1(v67) = 1;
LABEL_24:
  v36 = 2;
  if (!v21)
    v36 = 0;
  v51 = v36;
  v37 = numPyrLevels;
  while (1)
  {
    v38 = v27;
    LODWORD(v67) = v37;
    objc_msgSend(v24, "computeCommandEncoder");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v27)
      break;
    if (v37)
      v39 = 0;
    else
      v39 = v51 | self->_referenceImagePixelMappingFlag;
    objc_msgSend(v27, "setComputePipelineState:", self->_pplnNccMatch[v39]);
    v40 = v37 - 1;
    p_referenceImage = &self->_pyramid1Image[(v37 - 1)];
    if (!v37)
      p_referenceImage = &self->_referenceImage;
    objc_msgSend(v27, "setTexture:atIndex:", *p_referenceImage, 0);
    v42 = v53;
    if (v37)
      v42 = self->_pyramid2Image[(v37 - 1)];
    objc_msgSend(v27, "setTexture:atIndex:", v42, 1);
    objc_msgSend(v27, "setBytes:length:atIndex:", &nccParmsFixed, 564, 0);
    objc_msgSend(v27, "setBuffer:offset:atIndex:", self->_pyramid1Corners, 0, 1);
    objc_msgSend(v27, "setBuffer:offset:atIndex:", self->_pyramid2Corners, 0, 2);
    objc_msgSend(v27, "setBuffer:offset:atIndex:", self->_nccWorkStorage, 0, 3);
    objc_msgSend(v27, "setBuffer:offset:atIndex:", self->_internalSolverElemList, 0, 4);
    v43 = &self->_infoNccMatch[v39];
    v60 = *(_OWORD *)&v43->threadgroupsPerGrid.width;
    depth = v43->threadgroupsPerGrid.depth;
    v58 = *(_OWORD *)&v43->threadsPerThreadgroup.width;
    v59 = v43->threadsPerThreadgroup.depth;
    objc_msgSend(v27, "dispatchThreadgroups:threadsPerThreadgroup:", &v60, &v58);
    objc_msgSend(v27, "endEncoding");
    DWORD1(v67) = 0;
    --v37;
    v24 = v52;
    if (v40 + 1 <= 0)
      goto LABEL_36;
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  v8 = -1;
  FigSignalErrorAt();
  v15 = v49;
  v14 = v50;
LABEL_47:

  return v8;
}

uint64_t __110__FigRegToolboxGPU_computeTransformInternal_solverKernel_solverOutputResults_histogram_roi_waitForCompletion___block_invoke()
{
  uint64_t result;

  if (*MEMORY[0x1E0CA1FC0] == 1)
    return kdebug_trace();
  return result;
}

void __110__FigRegToolboxGPU_computeTransformInternal_solverKernel_solverOutputResults_histogram_roi_waitForCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (objc_msgSend(v2, "status") == 4)
  {
    objc_msgSend(v2, "GPUEndTime");
    objc_msgSend(v2, "GPUStartTime");
  }
  else
  {
    objc_msgSend(v2, "status");
  }
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();

}

- (void).cxx_destruct
{
  uint64_t i;
  uint64_t j;
  uint64_t k;

  objc_storeStrong((id *)&self->_internalSolverElemList, 0);
  objc_storeStrong((id *)&self->_internalTransformResults, 0);
  objc_storeStrong((id *)&self->_nccWorkStorage, 0);
  objc_storeStrong((id *)&self->_pyramid2Corners, 0);
  objc_storeStrong((id *)&self->_cornerDetectIntermediateTexture, 0);
  objc_storeStrong((id *)&self->_pyramid1Corners, 0);
  objc_storeStrong((id *)&self->_pyramid1CornerResponse, 0);
  objc_storeStrong((id *)&self->_pyramid1Initial, 0);
  for (i = 0; i != -8; --i)
    objc_storeStrong((id *)&self->_pyramid2Image[i + 7], 0);
  for (j = 0; j != -8; --j)
    objc_storeStrong((id *)&self->_pyramid1Image[j + 7], 0);
  objc_storeStrong((id *)&self->_referenceImage, 0);
  objc_storeStrong((id *)&self->_pplnSpecialImageConverterA, 0);
  objc_storeStrong((id *)&self->_pplnWarpImage, 0);
  objc_storeStrong((id *)&self->_pplnHomographySolver, 0);
  objc_storeStrong((id *)&self->_pplnAffineSolver, 0);
  objc_storeStrong((id *)&self->_pplnRigidSolver, 0);
  for (k = 0; k != -4; --k)
    objc_storeStrong((id *)&self->_pplnNccMatch[k + 3], 0);
  objc_storeStrong((id *)&self->_pplnCornerDetectionFinalPass, 0);
  objc_storeStrong((id *)&self->_pplnCornerDetectionFirstPass4x4, 0);
  objc_storeStrong((id *)&self->_pplnCornerResponse, 0);
  objc_storeStrong((id *)&self->_pplnSimple3x3BoxFilter, 0);
  objc_storeStrong((id *)&self->_pplnDownscale2to1WithMapping, 0);
  objc_storeStrong((id *)&self->_pplnDownscale2to1, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end
