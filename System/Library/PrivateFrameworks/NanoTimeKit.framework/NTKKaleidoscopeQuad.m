@implementation NTKKaleidoscopeQuad

- (NTKKaleidoscopeQuad)initWithShaderType:(unint64_t)a3
{
  NTKKaleidoscopeQuad *result;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NTKKaleidoscopeQuad;
  result = -[CLKUIQuad init](&v10, sel_init);
  if (result)
  {
    result->_shaderType = a3;
    result->_alpha = 1.0;
    __asm { FMOV            V0.2S, #1.0 }
    *(_QWORD *)result->_aspect = _D0;
    result->_lineThickness = 0.01;
  }
  return result;
}

+ (id)quadWithShaderType:(unint64_t)a3
{
  return -[NTKKaleidoscopeQuad initWithShaderType:]([NTKKaleidoscopeQuad alloc], "initWithShaderType:", a3);
}

- (void)dealloc
{
  NTKKaleidoscopeResourceManager *loader;
  objc_super v4;

  -[NTKKaleidoscopeResourceManager removeClient](self->_loader, "removeClient");
  loader = self->_loader;
  self->_loader = 0;

  v4.receiver = self;
  v4.super_class = (Class)NTKKaleidoscopeQuad;
  -[NTKKaleidoscopeQuad dealloc](&v4, sel_dealloc);
}

- (void)setupForQuadView:(id)a3
{
  double v4;
  float v5;
  double v6;
  float v7;
  double v13;
  double v14;
  NTKKaleidoscopeResourceManager *v15;
  NTKKaleidoscopeResourceManager *loader;
  MTLBuffer *geomBuffer;
  MTLRenderPipelineState *mtlPipelineOpaque;
  MTLRenderPipelineState *mtlPipelineBlend;
  id v20;

  v20 = a3;
  objc_msgSend(v20, "bounds");
  v5 = v4;
  v7 = v6;
  __asm { FMOV            V5.2S, #1.0 }
  LODWORD(v13) = LODWORD(_D5);
  if (v6 >= v4)
  {
    *(float *)&_D5 = v7 / v5;
    v14 = _D5;
  }
  else
  {
    *((float *)&v13 + 1) = v5 / v7;
    v14 = v13;
  }
  *(double *)self->_aspect = v14;
  +[NTKKaleidoscopeResourceManager sharedInstanceWithPixelFormat:](NTKKaleidoscopeResourceManager, "sharedInstanceWithPixelFormat:", objc_msgSend(v20, "colorPixelFormat"));
  v15 = (NTKKaleidoscopeResourceManager *)objc_claimAutoreleasedReturnValue();
  loader = self->_loader;
  self->_loader = v15;

  -[NTKKaleidoscopeResourceManager addClient](self->_loader, "addClient");
  geomBuffer = self->_geomBuffer;
  self->_geomBuffer = 0;

  mtlPipelineOpaque = self->_mtlPipelineOpaque;
  self->_mtlPipelineOpaque = 0;

  mtlPipelineBlend = self->_mtlPipelineBlend;
  self->_mtlPipelineBlend = 0;

}

- (id)geomBuffer
{
  MTLBuffer *geomBuffer;
  MTLBuffer *v4;
  MTLBuffer *v5;

  geomBuffer = self->_geomBuffer;
  if (!geomBuffer)
  {
    -[NTKKaleidoscopeResourceManager getGeometryBuffer](self->_loader, "getGeometryBuffer");
    v4 = (MTLBuffer *)objc_claimAutoreleasedReturnValue();
    v5 = self->_geomBuffer;
    self->_geomBuffer = v4;

    geomBuffer = self->_geomBuffer;
  }
  return geomBuffer;
}

- (id)mtlPipelineOpaque
{
  MTLRenderPipelineState *mtlPipelineOpaque;
  MTLRenderPipelineState *v4;
  MTLRenderPipelineState *v5;

  mtlPipelineOpaque = self->_mtlPipelineOpaque;
  if (!mtlPipelineOpaque)
  {
    -[NTKKaleidoscopeResourceManager getPipelineForShaderType:blending:](self->_loader, "getPipelineForShaderType:blending:", self->_shaderType, 0);
    v4 = (MTLRenderPipelineState *)objc_claimAutoreleasedReturnValue();
    v5 = self->_mtlPipelineOpaque;
    self->_mtlPipelineOpaque = v4;

    mtlPipelineOpaque = self->_mtlPipelineOpaque;
  }
  return mtlPipelineOpaque;
}

- (id)mtlPipelineBlend
{
  MTLRenderPipelineState *mtlPipelineBlend;
  MTLRenderPipelineState *v4;
  MTLRenderPipelineState *v5;

  mtlPipelineBlend = self->_mtlPipelineBlend;
  if (!mtlPipelineBlend)
  {
    -[NTKKaleidoscopeResourceManager getPipelineForShaderType:blending:](self->_loader, "getPipelineForShaderType:blending:", self->_shaderType, 1);
    v4 = (MTLRenderPipelineState *)objc_claimAutoreleasedReturnValue();
    v5 = self->_mtlPipelineBlend;
    self->_mtlPipelineBlend = v4;

    mtlPipelineBlend = self->_mtlPipelineBlend;
  }
  return mtlPipelineBlend;
}

- (void)setPrimaryLumaTexture:(id)a3
{
  objc_storeStrong((id *)&self->_primaryLumaTexture, a3);
}

- (void)setPrimaryChromaTexture:(id)a3
{
  objc_storeStrong((id *)&self->_primaryChromaTexture, a3);
}

- (void)setSecondaryTexture:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryTexture, a3);
}

- (void)renderForDisplayWithEncoder:(id)a3
{
  id v4;
  float v5;
  float v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  int v30;
  uint64_t v31;
  float v32;

  v4 = a3;
  kdebug_trace();
  -[NTKKaleidoscopeQuad alpha](self, "alpha");
  v6 = v5;
  v32 = v5;
  if (-[CLKUIQuad isOpaque](self, "isOpaque") || v6 >= 1.0)
  {
    -[NTKKaleidoscopeQuad mtlPipelineOpaque](self, "mtlPipelineOpaque");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRenderPipelineState:", v8);

  }
  else
  {
    -[NTKKaleidoscopeQuad mtlPipelineBlend](self, "mtlPipelineBlend");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRenderPipelineState:", v7);

    objc_msgSend(v4, "setFragmentBytes:length:atIndex:", &v32, 4, 1);
  }
  -[NTKKaleidoscopeQuad geomBuffer](self, "geomBuffer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVertexBuffer:offset:atIndex:", v9, 0, 0);

  -[NTKKaleidoscopeQuad primaryLumaTexture](self, "primaryLumaTexture");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rect");
  -[NTKKaleidoscopeQuad sampleRadius](self, "sampleRadius", v11, v12);
  v27 = v13;
  -[NTKKaleidoscopeQuad sampleCenter](self, "sampleCenter");
  v28 = v14;
  -[NTKKaleidoscopeQuad rotation](self, "rotation");
  v29 = v15;
  -[NTKKaleidoscopeQuad dialRadius](self, "dialRadius");
  v30 = v16;
  -[NTKKaleidoscopeQuad lineThickness](self, "lineThickness");
  v31 = v17;

  objc_msgSend(v4, "setFragmentBytes:length:atIndex:", &v26, 48, 0);
  -[NTKKaleidoscopeQuad primaryLumaTexture](self, "primaryLumaTexture");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "atlas");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bind:slot:", v4, 0);

  -[NTKKaleidoscopeQuad primaryChromaTexture](self, "primaryChromaTexture");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "atlas");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bind:slot:", v4, 1);

  if (self->_secondaryTexture)
  {
    -[NTKKaleidoscopeQuad secondaryTexture](self, "secondaryTexture");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "atlas");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bind:slot:", v4, 2);

  }
  objc_msgSend(v4, "setVertexBytes:length:atIndex:", self->_aspect, 8, 1);
  objc_msgSend(v4, "setVertexBytes:length:atIndex:", &self->_dialRadius, 4, 2);
  if (self->_shaderType == 3)
  {
    v24 = 0;
    v25 = 4;
  }
  else
  {
    v24 = 4;
    v25 = 12;
  }
  objc_msgSend(v4, "drawPrimitives:vertexStart:vertexCount:", 4, v24, v25);
  kdebug_trace();

}

- (BOOL)prepareForTime:(double)a3
{
  return 1;
}

- (CLKUITexture)primaryLumaTexture
{
  return self->_primaryLumaTexture;
}

- (CLKUITexture)primaryChromaTexture
{
  return self->_primaryChromaTexture;
}

- (CLKUITexture)secondaryTexture
{
  return self->_secondaryTexture;
}

- (unint64_t)shaderType
{
  return self->_shaderType;
}

- (float)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(float)a3
{
  self->_alpha = a3;
}

- (double)sampleCenter
{
  return *(double *)(a1 + 112);
}

- (void)setSampleCenter:(NTKKaleidoscopeQuad *)self
{
  uint64_t v2;

  *(_QWORD *)self->_sampleCenter = v2;
}

- (double)sampleRadius
{
  return *(double *)(a1 + 120);
}

- (void)setSampleRadius:(NTKKaleidoscopeQuad *)self
{
  uint64_t v2;

  *(_QWORD *)self->_sampleRadius = v2;
}

- (float)rotation
{
  return self->_rotation;
}

- (void)setRotation:(float)a3
{
  self->_rotation = a3;
}

- (float)dialRadius
{
  return self->_dialRadius;
}

- (void)setDialRadius:(float)a3
{
  self->_dialRadius = a3;
}

- (float)lineThickness
{
  return self->_lineThickness;
}

- (void)setLineThickness:(float)a3
{
  self->_lineThickness = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryTexture, 0);
  objc_storeStrong((id *)&self->_primaryChromaTexture, 0);
  objc_storeStrong((id *)&self->_primaryLumaTexture, 0);
  objc_storeStrong((id *)&self->_mtlPipelineBlend, 0);
  objc_storeStrong((id *)&self->_mtlPipelineOpaque, 0);
  objc_storeStrong((id *)&self->_geomBuffer, 0);
  objc_storeStrong((id *)&self->_loader, 0);
}

@end
