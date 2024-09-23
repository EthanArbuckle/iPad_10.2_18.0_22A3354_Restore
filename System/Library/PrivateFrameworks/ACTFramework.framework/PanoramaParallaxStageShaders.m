@implementation PanoramaParallaxStageShaders

- (PanoramaParallaxStageShaders)initWithContext:(id)a3
{
  id v4;
  const char *v5;
  PanoramaParallaxStageShaders *v6;
  uint64_t v7;
  MTLComputePipelineState *applyWarpToSlice;
  const char *v9;
  uint64_t v10;
  MTLComputePipelineState *computePreShifts;
  const char *v12;
  uint64_t v13;
  MTLComputePipelineState *downsampleShifts;
  PanoramaParallaxStageShaders *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PanoramaParallaxStageShaders;
  v6 = -[PanoramaParallaxStageShaders init](&v17, sel_init);
  if (!v6)
    goto LABEL_7;
  objc_msgSend_computePipelineStateFor_constants_(v4, v5, (uint64_t)CFSTR("applyWarpToSlice"), 0);
  v7 = objc_claimAutoreleasedReturnValue();
  applyWarpToSlice = v6->_applyWarpToSlice;
  v6->_applyWarpToSlice = (MTLComputePipelineState *)v7;

  if (!v6->_applyWarpToSlice)
    goto LABEL_7;
  objc_msgSend_computePipelineStateFor_constants_(v4, v9, (uint64_t)CFSTR("computePreShifts"), 0);
  v10 = objc_claimAutoreleasedReturnValue();
  computePreShifts = v6->_computePreShifts;
  v6->_computePreShifts = (MTLComputePipelineState *)v10;

  if (!v6->_computePreShifts)
    goto LABEL_7;
  objc_msgSend_computePipelineStateFor_constants_(v4, v12, (uint64_t)CFSTR("downsampleShifts"), 0);
  v13 = objc_claimAutoreleasedReturnValue();
  downsampleShifts = v6->_downsampleShifts;
  v6->_downsampleShifts = (MTLComputePipelineState *)v13;

  if (v6->_downsampleShifts)
    v15 = v6;
  else
LABEL_7:
    v15 = 0;

  return v15;
}

- (MTLComputePipelineState)applyWarpToSlice
{
  return self->_applyWarpToSlice;
}

- (MTLComputePipelineState)computePreShifts
{
  return self->_computePreShifts;
}

- (MTLComputePipelineState)downsampleShifts
{
  return self->_downsampleShifts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downsampleShifts, 0);
  objc_storeStrong((id *)&self->_computePreShifts, 0);
  objc_storeStrong((id *)&self->_applyWarpToSlice, 0);
}

@end
