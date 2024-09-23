@implementation XMattingSolver

- (XMattingSolver)initWithDevice:(id)a3 library:(id)a4
{
  id v7;
  id v8;
  XMattingSolver *v9;
  XMattingSolver *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)XMattingSolver;
  v9 = -[XMattingSolver init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    objc_storeStrong((id *)&v10->_library, a4);
  }

  return v10;
}

- (int)allocateResources:(id *)a3
{
  __int128 v5;
  __int128 v6;
  int v7;
  int v8;
  void *v9;
  MTLTexture *v10;
  MTLTexture *tmpSegmentation;
  float var4;
  unsigned int var2;
  unsigned int var3;
  unsigned int var0;
  unsigned int var1;
  __objc2_class **v17;
  MattingFilter *v18;
  MattingFilter *mattingFilter;
  MattingFilter *v20;
  int v21;
  int v22;
  id v23;
  double v24;
  double v25;
  MPSImageThresholdBinary *v26;
  MPSImageThresholdBinary *fgThresholdFilter;
  id v28;
  double v29;
  double v30;
  MPSImageThresholdBinaryInverse *v31;
  MPSImageThresholdBinaryInverse *bgThresholdFilter;
  MPSImageAreaMin *v33;
  MPSImageAreaMin *erosionFilter;
  void *v35;
  MTLTexture *v36;
  MTLTexture *fgErodedSegmentation;
  MTLTexture *v38;
  MTLTexture *bgErodedSegmentation;
  _DWORD v41[3];
  uint64_t v42;
  float v43;
  int v44;

  v5 = *(_OWORD *)&a3->var0;
  v6 = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_config.fgThresholdValue = *(_OWORD *)&a3->var7;
  *(_OWORD *)&self->_config.internalWidth = v5;
  *(_OWORD *)&self->_config.epsilon = v6;
  v7 = -[XMattingSolver _compileShadersWithLibrary:](self, "_compileShadersWithLibrary:", self->_library);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 55, a3->var0, a3->var1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUsage:", 3);
    v10 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v9);
    tmpSegmentation = self->_tmpSegmentation;
    self->_tmpSegmentation = v10;

    if (!self->_tmpSegmentation)
      goto LABEL_15;
    var4 = a3->var4;
    var2 = a3->var2;
    var3 = a3->var3;
    var0 = a3->var0;
    var1 = a3->var1;
    v17 = &off_1E2EB6528;
    if (a3->var6)
      v17 = off_1E2EB6520;
    v18 = (MattingFilter *)objc_msgSend(objc_alloc(*v17), "initWithDevice:library:", self->_device, self->_library);
    mattingFilter = self->_mattingFilter;
    self->_mattingFilter = v18;

    v20 = self->_mattingFilter;
    if (v20)
    {
      v21 = var1 / var3;
      if (var1 / var3 <= 1)
        v21 = 1;
      v22 = var0 / var3;
      if (var0 / var3 <= 1)
        v22 = 1;
      v41[0] = v22;
      v41[1] = v21;
      v41[2] = var2;
      v42 = 0x100000000;
      v43 = var4;
      v44 = 0;
      v8 = -[MattingFilter allocateResources:](v20, "allocateResources:", v41);
      v23 = objc_alloc(MEMORY[0x1E0CC6EB8]);
      *(float *)&v24 = a3->var7;
      LODWORD(v25) = 1.0;
      v26 = (MPSImageThresholdBinary *)objc_msgSend(v23, "initWithDevice:thresholdValue:maximumValue:linearGrayColorTransform:", self->_device, 0, v24, v25);
      fgThresholdFilter = self->_fgThresholdFilter;
      self->_fgThresholdFilter = v26;

      v28 = objc_alloc(MEMORY[0x1E0CC6EC0]);
      *(float *)&v29 = a3->var8;
      LODWORD(v30) = 1.0;
      v31 = (MPSImageThresholdBinaryInverse *)objc_msgSend(v28, "initWithDevice:thresholdValue:maximumValue:linearGrayColorTransform:", self->_device, 0, v29, v30);
      bgThresholdFilter = self->_bgThresholdFilter;
      self->_bgThresholdFilter = v31;

      v33 = (MPSImageAreaMin *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6E00]), "initWithDevice:kernelWidth:kernelHeight:", self->_device, a3->var9, a3->var9);
      erosionFilter = self->_erosionFilter;
      self->_erosionFilter = v33;

      -[MPSImageAreaMin setEdgeMode:](self->_erosionFilter, "setEdgeMode:", 0);
      objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 25, a3->var0, a3->var1, 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v35, "setUsage:", 3);
      v36 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v35);
      fgErodedSegmentation = self->_fgErodedSegmentation;
      self->_fgErodedSegmentation = v36;

      v38 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v35);
      bgErodedSegmentation = self->_bgErodedSegmentation;
      self->_bgErodedSegmentation = v38;

      if (!self->_fgErodedSegmentation || !self->_bgErodedSegmentation)
        v8 = -12786;
      v9 = v35;
    }
    else
    {
LABEL_15:
      v8 = -12786;
    }
  }

  return v8;
}

- (int)_compileShadersWithLibrary:(id)a3
{
  id v4;
  void *v5;
  MTLComputePipelineState *v6;
  MTLComputePipelineState *solverConstraintsKernel;
  uint64_t v8;
  MTLComputePipelineState *v9;
  MTLComputePipelineState *applySolverConstraintsKernel;
  int v11;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "newFunctionWithName:", CFSTR("solverConstraints"));
  v6 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithFunction:error:](self->_device, "newComputePipelineStateWithFunction:error:", v5, 0);
  solverConstraintsKernel = self->_solverConstraintsKernel;
  self->_solverConstraintsKernel = v6;

  if (self->_solverConstraintsKernel)
  {
    v8 = objc_msgSend(v4, "newFunctionWithName:", CFSTR("applySolverConstraints"));

    v9 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithFunction:error:](self->_device, "newComputePipelineStateWithFunction:error:", v8, 0);
    applySolverConstraintsKernel = self->_applySolverConstraintsKernel;
    self->_applySolverConstraintsKernel = v9;

    if (self->_applySolverConstraintsKernel)
      v11 = 0;
    else
      v11 = -12786;
    v5 = (void *)v8;
  }
  else
  {
    v11 = -12786;
  }

  return v11;
}

- (void)releaseResources
{
  MTLComputePipelineState *solverConstraintsKernel;
  MTLComputePipelineState *applySolverConstraintsKernel;
  MTLTexture *tmpSegmentation;
  MTLTexture *fgErodedSegmentation;
  MTLTexture *bgErodedSegmentation;

  solverConstraintsKernel = self->_solverConstraintsKernel;
  self->_solverConstraintsKernel = 0;

  applySolverConstraintsKernel = self->_applySolverConstraintsKernel;
  self->_applySolverConstraintsKernel = 0;

  tmpSegmentation = self->_tmpSegmentation;
  self->_tmpSegmentation = 0;

  fgErodedSegmentation = self->_fgErodedSegmentation;
  self->_fgErodedSegmentation = 0;

  bgErodedSegmentation = self->_bgErodedSegmentation;
  self->_bgErodedSegmentation = 0;

}

- (int)encodeConstraintsOn:(id)a3 segmentation:(id)a4 constraints:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  int v15;
  int v16;
  _QWORD v18[3];
  _QWORD v19[3];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v10, "width");
  if (v11 == objc_msgSend(v9, "width") && (v12 = objc_msgSend(v10, "height"), v12 == objc_msgSend(v9, "height")))
  {
    -[MPSImageThresholdBinary encodeToCommandBuffer:sourceTexture:destinationTexture:](self->_fgThresholdFilter, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v8, v9, self->_tmpSegmentation);
    -[MPSImageAreaMin encodeToCommandBuffer:sourceTexture:destinationTexture:](self->_erosionFilter, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v8, self->_tmpSegmentation, self->_fgErodedSegmentation);
    -[MPSImageThresholdBinaryInverse encodeToCommandBuffer:sourceTexture:destinationTexture:](self->_bgThresholdFilter, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v8, v9, self->_tmpSegmentation);
    -[MPSImageAreaMin encodeToCommandBuffer:sourceTexture:destinationTexture:](self->_erosionFilter, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v8, self->_tmpSegmentation, self->_bgErodedSegmentation);
    objc_msgSend(v8, "computeCommandEncoder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setComputePipelineState:", self->_solverConstraintsKernel);
    objc_msgSend(v13, "setTexture:atIndex:", self->_fgErodedSegmentation, 0);
    objc_msgSend(v13, "setTexture:atIndex:", self->_bgErodedSegmentation, 1);
    objc_msgSend(v13, "setTexture:atIndex:", v10, 2);
    v14 = -[MTLComputePipelineState threadExecutionWidth](self->_solverConstraintsKernel, "threadExecutionWidth");
    v15 = (int)-[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_solverConstraintsKernel, "maxTotalThreadsPerThreadgroup")/ v14;
    v19[0] = (int)(v14 + objc_msgSend(v10, "width") - 1) / v14;
    v19[1] = (int)(v15 + objc_msgSend(v10, "height") - 1) / v15;
    v19[2] = 1;
    v18[0] = v14;
    v18[1] = v15;
    v18[2] = 1;
    objc_msgSend(v13, "dispatchThreadgroups:threadsPerThreadgroup:", v19, v18);
    objc_msgSend(v13, "endEncoding");

    v16 = 0;
  }
  else
  {
    v16 = -12780;
  }

  return v16;
}

- (int)encodeApplySolverConstraintsOn:(id)a3 constraints:(id)a4 filteredSegmentation:(id)a5 segmentation:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  int v20;
  int v21;
  _QWORD v23[3];
  _QWORD v24[3];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_msgSend(v11, "width");
  if (v14 == objc_msgSend(v13, "width")
    && (v15 = objc_msgSend(v11, "height"), v15 == objc_msgSend(v13, "height"))
    && (v16 = objc_msgSend(v12, "width"), v16 == objc_msgSend(v13, "width"))
    && (v17 = objc_msgSend(v12, "height"), v17 == objc_msgSend(v13, "height")))
  {
    objc_msgSend(v10, "computeCommandEncoder");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setComputePipelineState:", self->_applySolverConstraintsKernel);
    objc_msgSend(v18, "setTexture:atIndex:", v11, 0);
    objc_msgSend(v18, "setTexture:atIndex:", v12, 1);
    objc_msgSend(v18, "setTexture:atIndex:", v13, 2);
    v19 = -[MTLComputePipelineState threadExecutionWidth](self->_applySolverConstraintsKernel, "threadExecutionWidth");
    v20 = (int)-[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_applySolverConstraintsKernel, "maxTotalThreadsPerThreadgroup")/ v19;
    v24[0] = (int)(v19 + objc_msgSend(v13, "width") - 1) / v19;
    v24[1] = (int)(v20 + objc_msgSend(v13, "height") - 1) / v20;
    v24[2] = 1;
    v23[0] = v19;
    v23[1] = v20;
    v23[2] = 1;
    objc_msgSend(v18, "dispatchThreadgroups:threadsPerThreadgroup:", v24, v23);
    objc_msgSend(v18, "endEncoding");

    v21 = 0;
  }
  else
  {
    v21 = -12780;
  }

  return v21;
}

- (int)enqueueSolveOn:(id)a3 constraints:(id)a4 colorGuide:(id)a5 extraGuide:(id)a6 inputTexture:(id)a7 outputTexture:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  __CFString *v20;
  __CFString *v21;
  MTLTexture *tmpSegmentation;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  void *v30;
  int v31;
  void *v32;
  int v33;
  id v35;
  id v36;
  void *v37;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (self->_config.useDepthFilter)
    v20 = CFSTR("RGBD");
  else
    v20 = CFSTR("RGB");
  v21 = v20;
  tmpSegmentation = self->_tmpSegmentation;
  v37 = v16;
  if (!tmpSegmentation)
  {
    v25 = 0;
    v26 = 0;
    v33 = -12786;
    goto LABEL_17;
  }
  v23 = -[MTLTexture width](tmpSegmentation, "width");
  if (v23 != objc_msgSend(v18, "width")
    || (v24 = -[MTLTexture height](self->_tmpSegmentation, "height"), v24 != objc_msgSend(v18, "height")))
  {
    v25 = 0;
    v26 = 0;
    v33 = -12780;
    goto LABEL_17;
  }
  objc_msgSend(v14, "commandBuffer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-solver:encodeStateOn"), v21);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
    v33 = -1;
    goto LABEL_17;
  }
  objc_msgSend(v25, "setLabel:", v26);
  v27 = -[MattingFilter encodeStateOn:colorGuide:disparityGuide:initialSegmentation:constraints:](self->_mattingFilter, "encodeStateOn:colorGuide:disparityGuide:initialSegmentation:constraints:", v25, v16, v17, v18, v15);
  if (v27)
  {
    v33 = v27;
    goto LABEL_17;
  }
  v35 = v17;
  v36 = v15;
  objc_msgSend(v25, "commit");
  objc_msgSend(v14, "commandBuffer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_config.iterations)
  {
    v29 = 0;
    while (1)
    {
      v30 = v26;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-solver:encodeStepOn %i"), v21, v29);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v28)
      {
        v25 = 0;
        goto LABEL_19;
      }
      objc_msgSend(v28, "setLabel:", v26);
      v31 = -[MattingFilter encodeStepOn:](self->_mattingFilter, "encodeStepOn:", v28);
      if (v31)
        break;
      v29 = (v29 + 1);
      if (v29 >= self->_config.iterations)
        goto LABEL_14;
    }
    v33 = v31;
    v25 = v28;
    goto LABEL_21;
  }
LABEL_14:
  v32 = v26;
  objc_msgSend(v28, "commit");
  objc_msgSend(v14, "commandBuffer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-solver:encodeApplyCoefficientsOn"), v21);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
LABEL_19:
    v33 = -1;
LABEL_21:
    v17 = v35;
    v15 = v36;
    goto LABEL_17;
  }
  objc_msgSend(v25, "setLabel:", v26);
  v17 = v35;
  v15 = v36;
  v33 = -[MattingFilter encodeApplyCoefficientsOn:colorGuide:disparityGuide:constraints:destinationAlphaTexture:](self->_mattingFilter, "encodeApplyCoefficientsOn:colorGuide:disparityGuide:constraints:destinationAlphaTexture:", v25, v37, v35, v36, v19);
  if (!v33)
    objc_msgSend(v25, "commit");
LABEL_17:

  return v33;
}

- ($6563333CECB3C2C1F2AD6751BAE18088)config
{
  $6563333CECB3C2C1F2AD6751BAE18088 *result;

  objc_copyStruct(retstr, &self->_config, 44, 1, 0);
  return result;
}

- (void)setConfig:(id *)a3
{
  objc_copyStruct(&self->_config, a3, 44, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_erosionFilter, 0);
  objc_storeStrong((id *)&self->_bgThresholdFilter, 0);
  objc_storeStrong((id *)&self->_fgThresholdFilter, 0);
  objc_storeStrong((id *)&self->_mattingFilter, 0);
  objc_storeStrong((id *)&self->_bgErodedSegmentation, 0);
  objc_storeStrong((id *)&self->_fgErodedSegmentation, 0);
  objc_storeStrong((id *)&self->_tmpSegmentation, 0);
  objc_storeStrong((id *)&self->_solverConstraintsKernel, 0);
  objc_storeStrong((id *)&self->_applySolverConstraintsKernel, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
