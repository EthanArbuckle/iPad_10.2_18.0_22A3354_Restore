@implementation PanoramaStitchingShaders

- (PanoramaStitchingShaders)initWithContext:(id)a3
{
  id v4;
  const char *v5;
  PanoramaStitchingShaders *v6;
  uint64_t v7;
  MTLComputePipelineState *computeCentralStitchingMask;
  const char *v9;
  uint64_t v10;
  MTLComputePipelineState *initializeSeamPreviousSlice;
  const char *v12;
  uint64_t v13;
  MTLComputePipelineState *initializeSeamPreviousSliceWithMask;
  const char *v15;
  uint64_t v16;
  MTLComputePipelineState *computeSeamCost;
  const char *v18;
  uint64_t v19;
  MTLComputePipelineState *seamCutDescend;
  const char *v21;
  uint64_t v22;
  MTLComputePipelineState *seamCutAscend;
  PanoramaStitchingShaders *v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PanoramaStitchingShaders;
  v6 = -[PanoramaStitchingShaders init](&v26, sel_init);
  if (!v6)
    goto LABEL_10;
  objc_msgSend_computePipelineStateFor_constants_(v4, v5, (uint64_t)CFSTR("computeCentralStitchingMask"), 0);
  v7 = objc_claimAutoreleasedReturnValue();
  computeCentralStitchingMask = v6->_computeCentralStitchingMask;
  v6->_computeCentralStitchingMask = (MTLComputePipelineState *)v7;

  if (!v6->_computeCentralStitchingMask)
    goto LABEL_10;
  objc_msgSend_computePipelineStateFor_constants_(v4, v9, (uint64_t)CFSTR("initializeSeamPreviousSlice"), 0);
  v10 = objc_claimAutoreleasedReturnValue();
  initializeSeamPreviousSlice = v6->_initializeSeamPreviousSlice;
  v6->_initializeSeamPreviousSlice = (MTLComputePipelineState *)v10;

  if (!v6->_initializeSeamPreviousSlice)
    goto LABEL_10;
  objc_msgSend_computePipelineStateFor_constants_(v4, v12, (uint64_t)CFSTR("initializeSeamPreviousSliceWithMask"), 0);
  v13 = objc_claimAutoreleasedReturnValue();
  initializeSeamPreviousSliceWithMask = v6->_initializeSeamPreviousSliceWithMask;
  v6->_initializeSeamPreviousSliceWithMask = (MTLComputePipelineState *)v13;

  if (!v6->_initializeSeamPreviousSliceWithMask)
    goto LABEL_10;
  objc_msgSend_computePipelineStateFor_constants_(v4, v15, (uint64_t)CFSTR("computeSeamCost"), 0);
  v16 = objc_claimAutoreleasedReturnValue();
  computeSeamCost = v6->_computeSeamCost;
  v6->_computeSeamCost = (MTLComputePipelineState *)v16;

  if (!v6->_computeSeamCost)
    goto LABEL_10;
  objc_msgSend_computePipelineStateFor_constants_(v4, v18, (uint64_t)CFSTR("seamCutDescend"), 0);
  v19 = objc_claimAutoreleasedReturnValue();
  seamCutDescend = v6->_seamCutDescend;
  v6->_seamCutDescend = (MTLComputePipelineState *)v19;

  if (!v6->_seamCutDescend)
    goto LABEL_10;
  objc_msgSend_computePipelineStateFor_constants_(v4, v21, (uint64_t)CFSTR("seamCutAscend"), 0);
  v22 = objc_claimAutoreleasedReturnValue();
  seamCutAscend = v6->_seamCutAscend;
  v6->_seamCutAscend = (MTLComputePipelineState *)v22;

  if (v6->_seamCutAscend)
    v24 = v6;
  else
LABEL_10:
    v24 = 0;

  return v24;
}

- (MTLComputePipelineState)computeCentralStitchingMask
{
  return self->_computeCentralStitchingMask;
}

- (MTLComputePipelineState)initializeSeamPreviousSlice
{
  return self->_initializeSeamPreviousSlice;
}

- (MTLComputePipelineState)initializeSeamPreviousSliceWithMask
{
  return self->_initializeSeamPreviousSliceWithMask;
}

- (MTLComputePipelineState)computeSeamCost
{
  return self->_computeSeamCost;
}

- (MTLComputePipelineState)seamCutDescend
{
  return self->_seamCutDescend;
}

- (MTLComputePipelineState)seamCutAscend
{
  return self->_seamCutAscend;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seamCutAscend, 0);
  objc_storeStrong((id *)&self->_seamCutDescend, 0);
  objc_storeStrong((id *)&self->_computeSeamCost, 0);
  objc_storeStrong((id *)&self->_initializeSeamPreviousSliceWithMask, 0);
  objc_storeStrong((id *)&self->_initializeSeamPreviousSlice, 0);
  objc_storeStrong((id *)&self->_computeCentralStitchingMask, 0);
}

@end
