@implementation CMIStyleEngineCreateWeightPlanes

- (CMIStyleEngineCreateWeightPlanes)initWithMetalContext:(id)a3
{
  id v4;
  CMIStyleEngineCreateWeightPlanes *v5;
  CMIStyleEngineCreateWeightPlanes *v6;
  CMIStyleEngineCreateWeightPlanes *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CMIStyleEngineCreateWeightPlanes;
  v5 = -[CMIStyleEngineCreateWeightPlanes init](&v9, sel_init);
  v6 = v5;
  if (!v5 || -[CMIStyleEngineCreateWeightPlanes _compileShaders:](v5, "_compileShaders:", v4))
  {
    FigDebugAssert3();
    v7 = 0;
  }
  else
  {
    v7 = v6;
  }

  return v7;
}

- (int)_compileShaders:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MTLComputePipelineState *v7;
  MTLComputePipelineState *v8;
  MTLComputePipelineState *v9;
  MTLComputePipelineState *v10;
  MTLComputePipelineState *v11;
  MTLComputePipelineState *v12;
  MTLComputePipelineState *v13;
  MTLComputePipelineState *v14;
  MTLComputePipelineState *v15;
  MTLComputePipelineState *v16;
  MTLComputePipelineState *v17;
  MTLComputePipelineState *v18;
  MTLComputePipelineState *v19;
  MTLComputePipelineState *v20;
  int v21;

  v4 = a3;
  objc_msgSend(v4, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  styleEngineSharedFunctionConstants(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_11;
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngineCreateWeightPlanes::MakeWeights"), v6);
  v7 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v8 = self->_computePipelineStates[0];
  self->_computePipelineStates[0] = v7;

  if (!self->_computePipelineStates[0])
    goto LABEL_11;
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngineCreateWeightPlanes::SumWeightPlanes"), v6);
  v9 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v10 = self->_computePipelineStates[1];
  self->_computePipelineStates[1] = v9;

  if (!self->_computePipelineStates[1])
    goto LABEL_11;
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngineCreateWeightPlanes::NormalizeWeightPlanes"), v6);
  v11 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v12 = self->_computePipelineStates[2];
  self->_computePipelineStates[2] = v11;

  if (!self->_computePipelineStates[2])
    goto LABEL_11;
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngineCreateWeightPlanes::NormalizeWeightPixelVectors"), v6);
  v13 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v14 = self->_computePipelineStates[3];
  self->_computePipelineStates[3] = v13;

  if (!self->_computePipelineStates[3])
    goto LABEL_11;
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngineCreateWeightPlanes::FillColorWeightHistogram"), v6);
  v15 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v16 = self->_computePipelineStates[4];
  self->_computePipelineStates[4] = v15;

  if (!self->_computePipelineStates[4])
    goto LABEL_11;
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngineCreateWeightPlanes::ThresholdHistogram"), v6);
  v17 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v18 = self->_computePipelineStates[5];
  self->_computePipelineStates[5] = v17;

  if (!self->_computePipelineStates[5])
    goto LABEL_11;
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngineCreateWeightPlanes::SplitWeightPlanesByColor"), v6);
  v19 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v20 = self->_computePipelineStates[6];
  self->_computePipelineStates[6] = v19;

  if (self->_computePipelineStates[6])
  {
    v21 = 0;
  }
  else
  {
LABEL_11:
    FigDebugAssert3();
    v21 = FigSignalErrorAt();
  }

  return v21;
}

- (void)setWeightPlanesStandardDeviation:(float)a3
{
  self->_params.standardDeviation = a3;
}

- (float)weightPlanesStandardDeviation
{
  return self->_params.standardDeviation;
}

- (void)setApplySpatialFilter:(BOOL)a3
{
  self->_params.applySpatialFilter = a3;
}

- (BOOL)applySpatialFilter
{
  return self->_params.applySpatialFilter;
}

- (void)setSpatialFilterWeight:(float)a3
{
  self->_params.spatialFilterWeight = a3;
}

- (float)spatialFilterWeight
{
  return self->_params.spatialFilterWeight;
}

- (void)setDoColorSplit:(BOOL)a3
{
  self->_params.doColorSplit = a3;
}

- (BOOL)doColorSplit
{
  return self->_params.doColorSplit;
}

- (void)setColorSplitStrength:(float)a3
{
  self->_params.colorSplitStrength = a3;
}

- (float)colorSplitStrength
{
  return self->_params.colorSplitStrength;
}

- (unint64_t)_numberOfLumaWeightsToCreate
{
  id WeakRetained;
  unint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_outputWeightPlanesTexture);
  v4 = (unint64_t)objc_msgSend(WeakRetained, "arrayLength") >> self->_params.doColorSplit;

  return v4;
}

- (int)enqueueToCommandBuffer:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  MTLComputePipelineState *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  MTLComputePipelineState *v27;
  id v28;
  id v29;
  uint64_t v30;
  MTLComputePipelineState *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  id v36;
  uint64_t v37;
  id v38;
  MTLTexture **p_inputTexture;
  MTLComputePipelineState *v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  id v45;
  uint64_t v46;
  id v47;
  MTLComputePipelineState *v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  id v52;
  uint64_t v53;
  id v54;
  MTLComputePipelineState *v55;
  uint64_t v56;
  MTLComputePipelineState *v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  id v61;
  uint64_t v62;
  id v63;
  int v64;
  id v66;
  _QWORD v67[3];
  _QWORD v68[3];
  uint64_t v69;
  int64x2_t v70;
  int64x2_t v71;
  uint64_t v72;
  _QWORD v73[3];
  _QWORD v74[3];
  _QWORD v75[3];
  _QWORD v76[3];
  _QWORD v77[3];
  _QWORD v78[3];
  uint64_t v79;
  int64x2_t v80;
  unint64_t v81;
  int64x2_t v82;
  _QWORD v83[3];
  _QWORD v84[5];

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputTexture);
  if (!WeakRetained)
    goto LABEL_16;
  v6 = WeakRetained;
  v7 = objc_loadWeakRetained((id *)&self->_outputWeightPlanesTexture);
  if (!v7)
  {

    goto LABEL_16;
  }
  v8 = v7;
  v9 = objc_loadWeakRetained((id *)&self->_inputPlaneNormalisationBuffer);

  if (!v9)
    goto LABEL_16;
  if (self->_params.doColorSplit)
  {
    if (!self->_inputThresholdCalculationBuffer)
      goto LABEL_16;
    v10 = objc_loadWeakRetained((id *)&self->_outputWeightPlanesTexture);
    v11 = objc_msgSend(v10, "arrayLength");

    if ((v11 & 1) != 0)
      goto LABEL_16;
    objc_msgSend(v4, "blitCommandEncoder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_16;
    v13 = v12;
    objc_msgSend(v12, "fillBuffer:range:value:", self->_inputThresholdCalculationBuffer, 0, -[MTLBuffer length](self->_inputThresholdCalculationBuffer, "length"), 0);
    objc_msgSend(v13, "endEncoding");

  }
  objc_msgSend(v4, "computeCommandEncoder");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
LABEL_16:
    FigDebugAssert3();
    v64 = FigSignalErrorAt();
    goto LABEL_17;
  }
  v15 = (void *)v14;
  v66 = v4;
  v16 = objc_loadWeakRetained((id *)&self->_outputWeightPlanesTexture);
  objc_msgSend(v15, "setTexture:atIndex:", v16, 1);

  v17 = objc_loadWeakRetained((id *)&self->_inputTexture);
  objc_msgSend(v15, "setTexture:atIndex:", v17, 0);

  v18 = objc_loadWeakRetained((id *)&self->_inputPlaneNormalisationBuffer);
  objc_msgSend(v15, "setBuffer:offset:atIndex:", v18, 0, 1);

  objc_msgSend(v15, "setBytes:length:atIndex:", &self->_params, 20, 0);
  objc_msgSend(v15, "setBytes:length:atIndex:", &self->_inputIsLinear, 1, 4);
  v19 = self->_computePipelineStates[0];
  objc_msgSend(v15, "setComputePipelineState:", v19);
  v20 = -[MTLComputePipelineState threadExecutionWidth](v19, "threadExecutionWidth");
  v21 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v19, "maxTotalThreadsPerThreadgroup");
  v22 = -[MTLComputePipelineState threadExecutionWidth](v19, "threadExecutionWidth");

  v23 = v21 / v22;
  objc_msgSend(v15, "setImageblockWidth:height:", v20, v21 / v22);
  v24 = objc_loadWeakRetained((id *)&self->_outputWeightPlanesTexture);
  v25 = (v20 + objc_msgSend(v24, "width") - 1) & -v20;
  v26 = objc_loadWeakRetained((id *)&self->_outputWeightPlanesTexture);
  v84[0] = v25;
  v84[1] = (v23 + objc_msgSend(v26, "height") - 1) & -(uint64_t)v23;
  v84[2] = -[CMIStyleEngineCreateWeightPlanes _numberOfLumaWeightsToCreate](self, "_numberOfLumaWeightsToCreate");
  v83[0] = v20;
  v83[1] = v23;
  v83[2] = 1;
  objc_msgSend(v15, "dispatchThreads:threadsPerThreadgroup:", v84, v83);

  v27 = self->_computePipelineStates[1];
  objc_msgSend(v15, "setComputePipelineState:", v27);
  v28 = objc_loadWeakRetained((id *)&self->_outputWeightPlanesTexture);
  objc_msgSend(v15, "setTexture:atIndex:", v28, 1);

  objc_msgSend(v15, "setThreadgroupMemoryLength:atIndex:", (4* (-[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v27, "maxTotalThreadsPerThreadgroup")/ (unint64_t)-[MTLComputePipelineState threadExecutionWidth](v27, "threadExecutionWidth"))+ 15) & 0xFFFFFFFFFFFFFFF0, 0);
  v29 = objc_loadWeakRetained((id *)&self->_inputPlaneNormalisationBuffer);
  objc_msgSend(v15, "setBuffer:offset:atIndex:", v29, 0, 1);

  v81 = -[CMIStyleEngineCreateWeightPlanes _numberOfLumaWeightsToCreate](self, "_numberOfLumaWeightsToCreate");
  v82 = vdupq_n_s64(1uLL);
  v30 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v27, "maxTotalThreadsPerThreadgroup");

  v79 = v30;
  v80 = v82;
  objc_msgSend(v15, "dispatchThreadgroups:threadsPerThreadgroup:", &v81, &v79);
  v31 = self->_computePipelineStates[2];
  objc_msgSend(v15, "setComputePipelineState:", v31);
  v32 = -[MTLComputePipelineState threadExecutionWidth](v31, "threadExecutionWidth");
  v33 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v31, "maxTotalThreadsPerThreadgroup");
  v34 = -[MTLComputePipelineState threadExecutionWidth](v31, "threadExecutionWidth");

  v35 = v33 / v34;
  objc_msgSend(v15, "setImageblockWidth:height:", v32, v33 / v34);
  v36 = objc_loadWeakRetained((id *)&self->_outputWeightPlanesTexture);
  v37 = objc_msgSend(v36, "width");
  v38 = objc_loadWeakRetained((id *)&self->_outputWeightPlanesTexture);
  v78[0] = v37;
  v78[1] = objc_msgSend(v38, "height");
  v78[2] = -[CMIStyleEngineCreateWeightPlanes _numberOfLumaWeightsToCreate](self, "_numberOfLumaWeightsToCreate");
  v77[0] = v32;
  v77[1] = v35;
  v77[2] = 1;
  objc_msgSend(v15, "dispatchThreads:threadsPerThreadgroup:", v78, v77);

  p_inputTexture = &self->_inputTexture;
  v40 = self->_computePipelineStates[3];
  objc_msgSend(v15, "setComputePipelineState:", v40);
  v41 = -[MTLComputePipelineState threadExecutionWidth](v40, "threadExecutionWidth");
  v42 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v40, "maxTotalThreadsPerThreadgroup");
  v43 = -[MTLComputePipelineState threadExecutionWidth](v40, "threadExecutionWidth");

  v44 = v42 / v43;
  objc_msgSend(v15, "setImageblockWidth:height:", v41, v42 / v43);
  v45 = objc_loadWeakRetained((id *)&self->_outputWeightPlanesTexture);
  v46 = objc_msgSend(v45, "width");
  v47 = objc_loadWeakRetained((id *)&self->_outputWeightPlanesTexture);
  v76[0] = v46;
  v76[1] = objc_msgSend(v47, "height");
  v76[2] = 1;
  v75[0] = v41;
  v75[1] = v44;
  v75[2] = 1;
  objc_msgSend(v15, "dispatchThreads:threadsPerThreadgroup:", v76, v75);

  if (self->_params.doColorSplit)
  {
    v48 = self->_computePipelineStates[4];
    objc_msgSend(v15, "setComputePipelineState:", v48);
    v49 = -[MTLComputePipelineState threadExecutionWidth](v48, "threadExecutionWidth");
    v50 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v48, "maxTotalThreadsPerThreadgroup");
    v51 = v50 / -[MTLComputePipelineState threadExecutionWidth](v48, "threadExecutionWidth");
    objc_msgSend(v15, "setBuffer:offset:atIndex:", self->_inputThresholdCalculationBuffer, 0, 2);

    v52 = objc_loadWeakRetained((id *)p_inputTexture);
    v53 = objc_msgSend(v52, "width");
    v54 = objc_loadWeakRetained((id *)p_inputTexture);
    v74[0] = v53;
    v74[1] = objc_msgSend(v54, "height");
    v74[2] = 1;
    v73[0] = v49;
    v73[1] = v51;
    v73[2] = 1;
    objc_msgSend(v15, "dispatchThreads:threadsPerThreadgroup:", v74, v73);

    if (self->_params.doColorSplit)
    {
      v55 = self->_computePipelineStates[5];
      objc_msgSend(v15, "setComputePipelineState:", v55);
      objc_msgSend(v15, "setBuffer:offset:atIndex:", self->_inputThresholdCalculationBuffer, 0, 2);
      v71 = vdupq_n_s64(1uLL);
      v72 = 1;
      v56 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v55, "maxTotalThreadsPerThreadgroup");

      v69 = v56;
      v70 = v71;
      objc_msgSend(v15, "dispatchThreadgroups:threadsPerThreadgroup:", &v71, &v69);
      if (self->_params.doColorSplit)
      {
        v57 = self->_computePipelineStates[6];
        objc_msgSend(v15, "setComputePipelineState:", v57);
        v58 = -[MTLComputePipelineState threadExecutionWidth](v57, "threadExecutionWidth");
        v59 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v57, "maxTotalThreadsPerThreadgroup");
        v60 = v59 / -[MTLComputePipelineState threadExecutionWidth](v57, "threadExecutionWidth");
        objc_msgSend(v15, "setImageblockWidth:height:", v58, v60);
        objc_msgSend(v15, "setBuffer:offset:atIndex:", self->_inputThresholdCalculationBuffer, 4096, 3);

        v61 = objc_loadWeakRetained((id *)p_inputTexture);
        v62 = objc_msgSend(v61, "width");
        v63 = objc_loadWeakRetained((id *)p_inputTexture);
        v68[0] = v62;
        v68[1] = objc_msgSend(v63, "height");
        v68[2] = -[CMIStyleEngineCreateWeightPlanes _numberOfLumaWeightsToCreate](self, "_numberOfLumaWeightsToCreate");
        v67[0] = v58;
        v67[1] = v60;
        v67[2] = 1;
        objc_msgSend(v15, "dispatchThreads:threadsPerThreadgroup:", v68, v67);

      }
    }
  }
  objc_msgSend(v15, "endEncoding");

  v64 = 0;
  v4 = v66;
LABEL_17:

  return v64;
}

- (MTLTexture)inputTexture
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_inputTexture);
}

- (void)setInputTexture:(id)a3
{
  objc_storeWeak((id *)&self->_inputTexture, a3);
}

- (BOOL)inputIsLinear
{
  return self->_inputIsLinear;
}

- (void)setInputIsLinear:(BOOL)a3
{
  self->_inputIsLinear = a3;
}

- (MTLBuffer)inputPlaneNormalisationBuffer
{
  return (MTLBuffer *)objc_loadWeakRetained((id *)&self->_inputPlaneNormalisationBuffer);
}

- (void)setInputPlaneNormalisationBuffer:(id)a3
{
  objc_storeWeak((id *)&self->_inputPlaneNormalisationBuffer, a3);
}

- (MTLBuffer)inputThresholdCalculationBuffer
{
  return self->_inputThresholdCalculationBuffer;
}

- (void)setInputThresholdCalculationBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_inputThresholdCalculationBuffer, a3);
}

- (MTLTexture)outputWeightPlanesTexture
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_outputWeightPlanesTexture);
}

- (void)setOutputWeightPlanesTexture:(id)a3
{
  objc_storeWeak((id *)&self->_outputWeightPlanesTexture, a3);
}

- (void).cxx_destruct
{
  uint64_t v3;

  objc_destroyWeak((id *)&self->_outputWeightPlanesTexture);
  objc_storeStrong((id *)&self->_inputThresholdCalculationBuffer, 0);
  objc_destroyWeak((id *)&self->_inputPlaneNormalisationBuffer);
  objc_destroyWeak((id *)&self->_inputTexture);
  v3 = 56;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

@end
