@implementation PanoramaAssemblyShaders

- (PanoramaAssemblyShaders)initWithContext:(id)a3
{
  id v4;
  const char *v5;
  PanoramaAssemblyShaders *v6;
  uint64_t v7;
  MTLComputePipelineState *resetPanoSizedState;
  const char *v9;
  uint64_t v10;
  MTLComputePipelineState *resetSliceSizedState;
  const char *v12;
  uint64_t v13;
  MTLComputePipelineState *addSliceToStaging;
  const char *v15;
  uint64_t v16;
  MTLComputePipelineState *addSliceToProjectiveGrid;
  const char *v18;
  uint64_t v19;
  MTLComputePipelineState *addStagingToOutput;
  const char *v21;
  uint64_t v22;
  MTLComputePipelineState *prepareForDenoising;
  PanoramaAssemblyShaders *v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PanoramaAssemblyShaders;
  v6 = -[PanoramaAssemblyShaders init](&v26, sel_init);
  if (!v6)
    goto LABEL_10;
  objc_msgSend_computePipelineStateFor_constants_(v4, v5, (uint64_t)CFSTR("assemblyResetPanoState"), 0);
  v7 = objc_claimAutoreleasedReturnValue();
  resetPanoSizedState = v6->_resetPanoSizedState;
  v6->_resetPanoSizedState = (MTLComputePipelineState *)v7;

  if (!v6->_resetPanoSizedState)
    goto LABEL_10;
  objc_msgSend_computePipelineStateFor_constants_(v4, v9, (uint64_t)CFSTR("assemblyResetSliceState"), 0);
  v10 = objc_claimAutoreleasedReturnValue();
  resetSliceSizedState = v6->_resetSliceSizedState;
  v6->_resetSliceSizedState = (MTLComputePipelineState *)v10;

  if (!v6->_resetSliceSizedState)
    goto LABEL_10;
  objc_msgSend_computePipelineStateFor_constants_(v4, v12, (uint64_t)CFSTR("assemblyAddSliceToStaging"), 0);
  v13 = objc_claimAutoreleasedReturnValue();
  addSliceToStaging = v6->_addSliceToStaging;
  v6->_addSliceToStaging = (MTLComputePipelineState *)v13;

  if (!v6->_addSliceToStaging)
    goto LABEL_10;
  objc_msgSend_computePipelineStateFor_constants_(v4, v15, (uint64_t)CFSTR("assemblyAddSliceToProjectiveGrid"), 0);
  v16 = objc_claimAutoreleasedReturnValue();
  addSliceToProjectiveGrid = v6->_addSliceToProjectiveGrid;
  v6->_addSliceToProjectiveGrid = (MTLComputePipelineState *)v16;

  if (!v6->_addSliceToProjectiveGrid)
    goto LABEL_10;
  objc_msgSend_computePipelineStateFor_constants_(v4, v18, (uint64_t)CFSTR("addStagingToOutput"), 0);
  v19 = objc_claimAutoreleasedReturnValue();
  addStagingToOutput = v6->_addStagingToOutput;
  v6->_addStagingToOutput = (MTLComputePipelineState *)v19;

  if (!v6->_addStagingToOutput)
    goto LABEL_10;
  objc_msgSend_computePipelineStateFor_constants_(v4, v21, (uint64_t)CFSTR("prepareForDenoising"), 0);
  v22 = objc_claimAutoreleasedReturnValue();
  prepareForDenoising = v6->_prepareForDenoising;
  v6->_prepareForDenoising = (MTLComputePipelineState *)v22;

  if (v6->_prepareForDenoising)
    v24 = v6;
  else
LABEL_10:
    v24 = 0;

  return v24;
}

- (MTLComputePipelineState)resetPanoSizedState
{
  return self->_resetPanoSizedState;
}

- (MTLComputePipelineState)resetSliceSizedState
{
  return self->_resetSliceSizedState;
}

- (MTLComputePipelineState)addSliceToStaging
{
  return self->_addSliceToStaging;
}

- (MTLComputePipelineState)addSliceToProjectiveGrid
{
  return self->_addSliceToProjectiveGrid;
}

- (MTLComputePipelineState)addStagingToOutput
{
  return self->_addStagingToOutput;
}

- (MTLComputePipelineState)prepareForDenoising
{
  return self->_prepareForDenoising;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prepareForDenoising, 0);
  objc_storeStrong((id *)&self->_addStagingToOutput, 0);
  objc_storeStrong((id *)&self->_addSliceToProjectiveGrid, 0);
  objc_storeStrong((id *)&self->_addSliceToStaging, 0);
  objc_storeStrong((id *)&self->_resetSliceSizedState, 0);
  objc_storeStrong((id *)&self->_resetPanoSizedState, 0);
}

@end
