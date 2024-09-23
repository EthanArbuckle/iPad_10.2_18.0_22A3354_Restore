@implementation CMIStyleEngineCreateSpotlights

- (CMIStyleEngineCreateSpotlights)initWithMetalContext:(id)a3 spotlightCount:
{
  int32x2_t v3;
  id v5;
  CMIStyleEngineCreateSpotlights *v6;
  CMIStyleEngineCreateSpotlights *v7;
  int16x4_t v8;
  CMIStyleEngineCreateSpotlights *v9;
  int32x2_t v11;
  objc_super v12;

  v11 = v3;
  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CMIStyleEngineCreateSpotlights;
  v6 = -[CMIStyleEngineCreateSpotlights init](&v12, sel_init);
  v7 = v6;
  if (v6
    && !-[CMIStyleEngineCreateSpotlights _compileShaders:](v6, "_compileShaders:", v5)
    && (*(_WORD *)&v7->_anon_10[2] = v11.i16[2],
        *(_WORD *)v7->_anon_10 = v11.i16[0],
        v8 = (int16x4_t)vtst_s32(v11, (int32x2_t)0xFFFF0000FFFFLL),
        (vminv_u16((uint16x4_t)vuzp1_s16(v8, v8)) & 0x8000) != 0))
  {
    v9 = v7;
  }
  else
  {
    FigDebugAssert3();
    v9 = 0;
  }

  return v9;
}

- (int)_compileShaders:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MTLComputePipelineState *v7;
  MTLComputePipelineState *createSpotlightsComputePipelineState;
  int v9;

  v4 = a3;
  objc_msgSend(v4, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  styleEngineSharedFunctionConstants(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngine::CreateSpotlights"), v6),
        v7 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue(),
        createSpotlightsComputePipelineState = self->_createSpotlightsComputePipelineState,
        self->_createSpotlightsComputePipelineState = v7,
        createSpotlightsComputePipelineState,
        self->_createSpotlightsComputePipelineState))
  {
    v9 = 0;
  }
  else
  {
    FigDebugAssert3();
    v9 = FigSignalErrorAt();
  }

  return v9;
}

- (void)setInputImageSize:(CMIStyleEngineCreateSpotlights *)self
{
  uint64_t v2;

  *(_WORD *)&self->_anon_10[6] = WORD2(v2);
  *(_WORD *)&self->_anon_10[4] = v2;
}

- (__int16)inputImageSize
{
  return *(_WORD *)(a1 + 20);
}

- (void)setScaleFactor:(float)a3
{
  *(float *)&self->_anon_10[8] = a3;
}

- (float)scaleFactor
{
  return *(float *)&self->_anon_10[8];
}

- (int)enqueueToCommandBuffer:(id)a3
{
  id v4;
  BOOL v5;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unsigned __int8 *anon_10;
  __int16 v31;
  __int16 v32;
  __int16 *v33;
  __int16 v34;
  __int16 v35;
  uint64_t v36;
  int32x2_t v37;
  int32x2_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  int v42;
  id *p_outputSpotlightTextureBottomRight;
  void *v45;
  void *v46;
  _QWORD v47[3];
  _QWORD v48[3];
  id v49;
  int v50;
  id v51;
  int v52;
  id v53;
  __int16 v54;
  __int16 v55;
  id v56;
  int v57;
  id v58;
  int v59;
  id v60;
  __int16 v61;
  __int16 v62;
  id v63;
  __int16 v64;
  __int16 v65;
  id v66;
  __int16 v67;
  __int16 v68;
  id v69;
  __int16 v70;
  __int16 v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*(_WORD *)&self->_anon_10[4])
    v5 = *(unsigned __int16 *)&self->_anon_10[6] == 0;
  else
    v5 = 1;
  if (v5)
    goto LABEL_31;
  if (!*(_WORD *)self->_anon_10 || *(_WORD *)&self->_anon_10[2] == 0)
    goto LABEL_31;
  WeakRetained = objc_loadWeakRetained((id *)&self->_outputSpotlightTextureTopLeft);
  if (!WeakRetained)
    goto LABEL_31;
  v8 = WeakRetained;
  v9 = objc_loadWeakRetained((id *)&self->_outputSpotlightTextureTopEdge);
  if (!v9)
    goto LABEL_30;
  v10 = v9;
  v11 = objc_loadWeakRetained((id *)&self->_outputSpotlightTextureTopRight);
  if (!v11)
  {
LABEL_29:

LABEL_30:
LABEL_31:
    FigDebugAssert3();
    v42 = FigSignalErrorAt();
    goto LABEL_32;
  }
  v12 = v11;
  v13 = objc_loadWeakRetained((id *)&self->_outputSpotlightTextureLeftEdge);
  if (!v13)
  {
LABEL_28:

    goto LABEL_29;
  }
  v14 = v13;
  v46 = v10;
  v15 = objc_loadWeakRetained((id *)&self->_outputSpotlightTextureCentral);
  if (!v15)
  {
LABEL_27:

    v10 = v46;
    goto LABEL_28;
  }
  v16 = v15;
  v45 = v8;
  v17 = objc_loadWeakRetained((id *)&self->_outputSpotlightTextureRightEdge);
  if (!v17)
  {
LABEL_26:

    v8 = v45;
    goto LABEL_27;
  }
  v18 = v17;
  v19 = v4;
  v20 = objc_loadWeakRetained((id *)&self->_outputSpotlightTextureBottomLeft);
  if (!v20)
  {
LABEL_25:

    v4 = v19;
    goto LABEL_26;
  }
  v21 = v20;
  v22 = objc_loadWeakRetained((id *)&self->_outputSpotlightTextureBottomEdge);
  if (!v22)
  {

    goto LABEL_25;
  }
  v23 = v22;
  p_outputSpotlightTextureBottomRight = (id *)&self->_outputSpotlightTextureBottomRight;
  v24 = objc_loadWeakRetained((id *)&self->_outputSpotlightTextureBottomRight);

  v4 = v19;
  if (!v24)
    goto LABEL_31;
  objc_msgSend(v19, "computeCommandEncoder");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (!v25)
    goto LABEL_31;
  objc_msgSend(v25, "setComputePipelineState:", self->_createSpotlightsComputePipelineState);
  objc_msgSend(v26, "setBytes:length:atIndex:", self->_anon_10, 12, 0);
  v27 = -[MTLComputePipelineState threadExecutionWidth](self->_createSpotlightsComputePipelineState, "threadExecutionWidth");
  v28 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_createSpotlightsComputePipelineState, "maxTotalThreadsPerThreadgroup");
  v29 = v28
      / -[MTLComputePipelineState threadExecutionWidth](self->_createSpotlightsComputePipelineState, "threadExecutionWidth");
  objc_msgSend(v26, "setImageblockWidth:height:", v27, v29);
  v49 = objc_loadWeakRetained((id *)&self->_outputSpotlightTextureTopLeft);
  v50 = 0;
  v51 = objc_loadWeakRetained((id *)&self->_outputSpotlightTextureTopEdge);
  v52 = 1;
  v53 = objc_loadWeakRetained((id *)&self->_outputSpotlightTextureTopRight);
  anon_10 = self->_anon_10;
  v31 = *(_WORD *)self->_anon_10 - 1;
  v55 = 0;
  v54 = v31;
  v56 = objc_loadWeakRetained((id *)&self->_outputSpotlightTextureLeftEdge);
  v57 = 0x10000;
  v58 = objc_loadWeakRetained((id *)&self->_outputSpotlightTextureCentral);
  v59 = 65537;
  v60 = objc_loadWeakRetained((id *)&self->_outputSpotlightTextureRightEdge);
  v32 = *(_WORD *)self->_anon_10 - 1;
  v62 = 1;
  v61 = v32;
  v63 = objc_loadWeakRetained((id *)&self->_outputSpotlightTextureBottomLeft);
  v33 = (__int16 *)&self->_anon_10[2];
  v34 = *(_WORD *)&self->_anon_10[2] - 1;
  v64 = 0;
  v65 = v34;
  v66 = objc_loadWeakRetained((id *)&self->_outputSpotlightTextureBottomEdge);
  v35 = *(_WORD *)&self->_anon_10[2] - 1;
  v67 = 1;
  v68 = v35;
  v36 = 0;
  v69 = objc_loadWeakRetained(p_outputSpotlightTextureBottomRight);
  v37.i16[0] = *(_WORD *)anon_10;
  v37.i16[2] = *v33;
  v38 = vadd_s32(v37, (int32x2_t)-1);
  v71 = v38.i16[2];
  v70 = v38.i16[0];
  do
  {
    objc_msgSend(v26, "setTexture:atIndex:", *(id *)((char *)&v49 + v36), 0);
    objc_msgSend(v26, "setBytes:length:atIndex:", (char *)&v49 + v36 + 8, 4, 1);
    v39 = objc_msgSend(*(id *)((char *)&v49 + v36), "width");
    v40 = objc_msgSend(*(id *)((char *)&v49 + v36), "height");
    v48[0] = v39;
    v48[1] = v40;
    v48[2] = 1;
    v47[0] = v27;
    v47[1] = v29;
    v47[2] = 1;
    objc_msgSend(v26, "dispatchThreads:threadsPerThreadgroup:", v48, v47);
    v36 += 16;
  }
  while (v36 != 144);
  objc_msgSend(v26, "endEncoding");
  for (i = 128; i != -16; i -= 16)

  v42 = 0;
LABEL_32:

  return v42;
}

- (MTLTexture)outputSpotlightTextureTopLeft
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_outputSpotlightTextureTopLeft);
}

- (void)setOutputSpotlightTextureTopLeft:(id)a3
{
  objc_storeWeak((id *)&self->_outputSpotlightTextureTopLeft, a3);
}

- (MTLTexture)outputSpotlightTextureTopEdge
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_outputSpotlightTextureTopEdge);
}

- (void)setOutputSpotlightTextureTopEdge:(id)a3
{
  objc_storeWeak((id *)&self->_outputSpotlightTextureTopEdge, a3);
}

- (MTLTexture)outputSpotlightTextureTopRight
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_outputSpotlightTextureTopRight);
}

- (void)setOutputSpotlightTextureTopRight:(id)a3
{
  objc_storeWeak((id *)&self->_outputSpotlightTextureTopRight, a3);
}

- (MTLTexture)outputSpotlightTextureLeftEdge
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_outputSpotlightTextureLeftEdge);
}

- (void)setOutputSpotlightTextureLeftEdge:(id)a3
{
  objc_storeWeak((id *)&self->_outputSpotlightTextureLeftEdge, a3);
}

- (MTLTexture)outputSpotlightTextureCentral
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_outputSpotlightTextureCentral);
}

- (void)setOutputSpotlightTextureCentral:(id)a3
{
  objc_storeWeak((id *)&self->_outputSpotlightTextureCentral, a3);
}

- (MTLTexture)outputSpotlightTextureRightEdge
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_outputSpotlightTextureRightEdge);
}

- (void)setOutputSpotlightTextureRightEdge:(id)a3
{
  objc_storeWeak((id *)&self->_outputSpotlightTextureRightEdge, a3);
}

- (MTLTexture)outputSpotlightTextureBottomLeft
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_outputSpotlightTextureBottomLeft);
}

- (void)setOutputSpotlightTextureBottomLeft:(id)a3
{
  objc_storeWeak((id *)&self->_outputSpotlightTextureBottomLeft, a3);
}

- (MTLTexture)outputSpotlightTextureBottomEdge
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_outputSpotlightTextureBottomEdge);
}

- (void)setOutputSpotlightTextureBottomEdge:(id)a3
{
  objc_storeWeak((id *)&self->_outputSpotlightTextureBottomEdge, a3);
}

- (MTLTexture)outputSpotlightTextureBottomRight
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_outputSpotlightTextureBottomRight);
}

- (void)setOutputSpotlightTextureBottomRight:(id)a3
{
  objc_storeWeak((id *)&self->_outputSpotlightTextureBottomRight, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_outputSpotlightTextureBottomRight);
  objc_destroyWeak((id *)&self->_outputSpotlightTextureBottomEdge);
  objc_destroyWeak((id *)&self->_outputSpotlightTextureBottomLeft);
  objc_destroyWeak((id *)&self->_outputSpotlightTextureRightEdge);
  objc_destroyWeak((id *)&self->_outputSpotlightTextureCentral);
  objc_destroyWeak((id *)&self->_outputSpotlightTextureLeftEdge);
  objc_destroyWeak((id *)&self->_outputSpotlightTextureTopRight);
  objc_destroyWeak((id *)&self->_outputSpotlightTextureTopEdge);
  objc_destroyWeak((id *)&self->_outputSpotlightTextureTopLeft);
  objc_storeStrong((id *)&self->_createSpotlightsComputePipelineState, 0);
}

@end
