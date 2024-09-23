@implementation FigRegWarpPPGPUShaders

- (FigRegWarpPPGPUShaders)initWithMetalContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MTLComputePipelineState *v7;
  MTLComputePipelineState *downscaleImagePipeline;
  MTLComputePipelineState *v9;
  MTLComputePipelineState *copyImagePipeline;
  MTLComputePipelineState *v11;
  MTLComputePipelineState *boxFilterPipeline;
  MTLComputePipelineState *v13;
  MTLComputePipelineState *cornerResponseShortPipeline;
  MTLComputePipelineState *v15;
  MTLComputePipelineState *cornerResponseHalfPipeline;
  MTLComputePipelineState *v17;
  MTLComputePipelineState *cornerDetectionFirstPass4x4ShortPipeline;
  MTLComputePipelineState *v19;
  MTLComputePipelineState *cornerDetectionFirstPass4x4HalfPipeline;
  MTLComputePipelineState *v21;
  MTLComputePipelineState *cornerDetectionFinalPassShortPipeline;
  MTLComputePipelineState *v23;
  MTLComputePipelineState *cornerDetectionFinalPassHalfPipeline;
  MTLComputePipelineState *v25;
  MTLComputePipelineState *cornerMatchingPipeline;
  MTLComputePipelineState *v27;
  MTLComputePipelineState *homographySolverUsingAllCornersPipeline;
  MTLComputePipelineState *v29;
  MTLComputePipelineState *homographyMinSamplesSolverPipeline;
  MTLComputePipelineState *v31;
  MTLComputePipelineState *affineMinSamplesSolverPipeline;
  MTLComputePipelineState *v33;
  MTLComputePipelineState *rigidMinSamplesSolverPipeline;
  MTLComputePipelineState *v35;
  MTLComputePipelineState *homographySolverUsingInliersPipeline;
  MTLComputePipelineState *v37;
  MTLComputePipelineState *reorderCornersPipeline;
  char v40;
  char v41;
  char v42;
  char v43;
  objc_super v44;

  v4 = a3;
  if (!v4)
    goto LABEL_24;
  v44.receiver = self;
  v44.super_class = (Class)FigRegWarpPPGPUShaders;
  self = -[FigRegWarpPPGPUShaders init](&v44, sel_init);
  if (!self)
  {
    FigDebugAssert3();
    goto LABEL_21;
  }
  v5 = (void *)objc_opt_new();
  if (!v5)
  {
LABEL_24:
    FigDebugAssert3();
LABEL_26:

    self = 0;
    goto LABEL_21;
  }
  v6 = v5;
  v43 = 0;
  objc_msgSend(v5, "setConstantValue:type:atIndex:", &v43, 53, 0);
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("rwppDownscaleImage2x2"), v6);
  v7 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  downscaleImagePipeline = self->_downscaleImagePipeline;
  self->_downscaleImagePipeline = v7;

  if (!self->_downscaleImagePipeline)
    goto LABEL_25;
  objc_msgSend(v6, "reset");
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("rwppCopyImage"), 0);
  v9 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  copyImagePipeline = self->_copyImagePipeline;
  self->_copyImagePipeline = v9;

  if (!self->_copyImagePipeline)
    goto LABEL_25;
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("rwpp3x3BoxFilter"), 0);
  v11 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  boxFilterPipeline = self->_boxFilterPipeline;
  self->_boxFilterPipeline = v11;

  if (!self->_boxFilterPipeline)
    goto LABEL_25;
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("rwppCornerResponseShort"), 0);
  v13 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  cornerResponseShortPipeline = self->_cornerResponseShortPipeline;
  self->_cornerResponseShortPipeline = v13;

  if (!self->_cornerResponseShortPipeline)
    goto LABEL_25;
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("rwppCornerResponseHalf"), 0);
  v15 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  cornerResponseHalfPipeline = self->_cornerResponseHalfPipeline;
  self->_cornerResponseHalfPipeline = v15;

  if (!self->_cornerResponseHalfPipeline)
    goto LABEL_25;
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("rwppCornerDetectFirstPass4x4Short"), 0);
  v17 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  cornerDetectionFirstPass4x4ShortPipeline = self->_cornerDetectionFirstPass4x4ShortPipeline;
  self->_cornerDetectionFirstPass4x4ShortPipeline = v17;

  if (!self->_cornerDetectionFirstPass4x4ShortPipeline)
    goto LABEL_25;
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("rwppCornerDetectFirstPass4x4Half"), 0);
  v19 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  cornerDetectionFirstPass4x4HalfPipeline = self->_cornerDetectionFirstPass4x4HalfPipeline;
  self->_cornerDetectionFirstPass4x4HalfPipeline = v19;

  if (!self->_cornerDetectionFirstPass4x4HalfPipeline)
    goto LABEL_25;
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("rwppCornerDetectFinalPassShort"), 0);
  v21 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  cornerDetectionFinalPassShortPipeline = self->_cornerDetectionFinalPassShortPipeline;
  self->_cornerDetectionFinalPassShortPipeline = v21;

  if (!self->_cornerDetectionFinalPassShortPipeline)
    goto LABEL_25;
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("rwppCornerDetectFinalPassHalf"), 0);
  v23 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  cornerDetectionFinalPassHalfPipeline = self->_cornerDetectionFinalPassHalfPipeline;
  self->_cornerDetectionFinalPassHalfPipeline = v23;

  if (!self->_cornerDetectionFinalPassHalfPipeline)
    goto LABEL_25;
  v42 = 1;
  objc_msgSend(v6, "setConstantValue:type:atIndex:", &v42, 53, 1);
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("rwppCornerMatching"), v6);
  v25 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  cornerMatchingPipeline = self->_cornerMatchingPipeline;
  self->_cornerMatchingPipeline = v25;

  if (!self->_cornerMatchingPipeline)
    goto LABEL_25;
  objc_msgSend(v6, "reset");
  v41 = 0;
  objc_msgSend(v6, "setConstantValue:type:atIndex:", &v41, 53, 2);
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("rwppHomographySolver"), v6);
  v27 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  homographySolverUsingAllCornersPipeline = self->_homographySolverUsingAllCornersPipeline;
  self->_homographySolverUsingAllCornersPipeline = v27;

  if (!self->_homographySolverUsingAllCornersPipeline)
    goto LABEL_25;
  v41 = 1;
  objc_msgSend(v6, "setConstantValue:type:atIndex:", &v41, 53, 2);
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("rwppHomographySolver"), v6);
  v29 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  homographyMinSamplesSolverPipeline = self->_homographyMinSamplesSolverPipeline;
  self->_homographyMinSamplesSolverPipeline = v29;

  if (!self->_homographyMinSamplesSolverPipeline)
    goto LABEL_25;
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("rwppAffineSolver"), v6);
  v31 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  affineMinSamplesSolverPipeline = self->_affineMinSamplesSolverPipeline;
  self->_affineMinSamplesSolverPipeline = v31;

  if (!self->_affineMinSamplesSolverPipeline)
    goto LABEL_25;
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("rwppRigidSolver"), v6);
  v33 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  rigidMinSamplesSolverPipeline = self->_rigidMinSamplesSolverPipeline;
  self->_rigidMinSamplesSolverPipeline = v33;

  if (!self->_rigidMinSamplesSolverPipeline)
    goto LABEL_25;
  objc_msgSend(v6, "reset");
  v40 = 1;
  objc_msgSend(v6, "setConstantValue:type:atIndex:", &v40, 53, 3);
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("rwppHomographySolverUsingInliers"), v6);
  v35 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  homographySolverUsingInliersPipeline = self->_homographySolverUsingInliersPipeline;
  self->_homographySolverUsingInliersPipeline = v35;

  if (!self->_homographySolverUsingInliersPipeline
    || (objc_msgSend(v6, "reset"),
        objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("rwppReorderCorners"), 0),
        v37 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue(),
        reorderCornersPipeline = self->_reorderCornersPipeline,
        self->_reorderCornersPipeline = v37,
        reorderCornersPipeline,
        !self->_reorderCornersPipeline))
  {
LABEL_25:
    FigDebugAssert3();

    goto LABEL_26;
  }
  self = self;

LABEL_21:
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reorderCornersPipeline, 0);
  objc_storeStrong((id *)&self->_homographySolverUsingInliersPipeline, 0);
  objc_storeStrong((id *)&self->_rigidMinSamplesSolverPipeline, 0);
  objc_storeStrong((id *)&self->_affineMinSamplesSolverPipeline, 0);
  objc_storeStrong((id *)&self->_homographySolverUsingAllCornersPipeline, 0);
  objc_storeStrong((id *)&self->_homographyMinSamplesSolverPipeline, 0);
  objc_storeStrong((id *)&self->_cornerMatchingPipeline, 0);
  objc_storeStrong((id *)&self->_cornerDetectionFinalPassHalfPipeline, 0);
  objc_storeStrong((id *)&self->_cornerDetectionFinalPassShortPipeline, 0);
  objc_storeStrong((id *)&self->_cornerDetectionFirstPass4x4HalfPipeline, 0);
  objc_storeStrong((id *)&self->_cornerDetectionFirstPass4x4ShortPipeline, 0);
  objc_storeStrong((id *)&self->_cornerResponseHalfPipeline, 0);
  objc_storeStrong((id *)&self->_cornerResponseShortPipeline, 0);
  objc_storeStrong((id *)&self->_boxFilterPipeline, 0);
  objc_storeStrong((id *)&self->_copyImagePipeline, 0);
  objc_storeStrong((id *)&self->_downscaleImagePipeline, 0);
}

@end
