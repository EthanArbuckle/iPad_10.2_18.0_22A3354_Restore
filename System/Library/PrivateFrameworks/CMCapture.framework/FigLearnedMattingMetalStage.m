@implementation FigLearnedMattingMetalStage

- (FigLearnedMattingMetalStage)initWithMetalContext:(id)a3
{
  id v5;
  FigLearnedMattingMetalStage *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFDictionary *v11;
  const __CFAllocator *v12;
  void *v13;
  FigLearnedMattingMetalStage *v14;
  objc_super v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FigLearnedMattingMetalStage;
  v6 = -[FigLearnedMattingMetalStage init](&v16, sel_init);
  v7 = (uint64_t)v6;
  if (!v6)
    goto LABEL_6;
  objc_storeStrong((id *)&v6->_metalContext, a3);
  if (!*(_QWORD *)(v7 + 8))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D08B28]), "initWithbundle:andOptionalCommandQueue:", v8, 0);
    v10 = *(void **)(v7 + 8);
    *(_QWORD *)(v7 + 8) = v9;

    if (!*(_QWORD *)(v7 + 8))
      goto LABEL_8;
  }
  if (-[FigLearnedMattingMetalStage _compileShaders](v7))
    goto LABEL_8;
  v17 = *MEMORY[0x1E0CA8F48];
  v18[0] = &unk_1E49F8448;
  v11 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v12 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  objc_msgSend(*(id *)(v7 + 8), "device");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = CVMetalTextureCacheCreate(v12, v11, v13, 0, (CVMetalTextureCacheRef *)(v7 + 40));

  if ((_DWORD)v11)
  {
LABEL_8:
    fig_log_get_emitter();
    FigDebugAssert3();
    v14 = 0;
  }
  else
  {
LABEL_6:
    v14 = (FigLearnedMattingMetalStage *)(id)v7;
  }

  return v14;
}

- (uint64_t)_compileShaders
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 8), "computePipelineStateFor:constants:", CFSTR("clearTexture"), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v2;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 8), "computePipelineStateFor:constants:", CFSTR("createTileWithScale"), 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v4;

    if (*(_QWORD *)(a1 + 16))
    {
      objc_msgSend(*(id *)(a1 + 8), "computePipelineStateFor:constants:", CFSTR("pasteTile"), 0);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v6;

      if (*(_QWORD *)(a1 + 24))
        return 0;
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (FigLearnedMattingMetalStage)init
{
  return -[FigLearnedMattingMetalStage initWithMetalContext:](self, "initWithMetalContext:", 0);
}

- (void)dealloc
{
  __CVMetalTextureCache *textureCache;
  objc_super v4;

  textureCache = self->_textureCache;
  if (textureCache)
  {
    CFRelease(textureCache);
    self->_textureCache = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)FigLearnedMattingMetalStage;
  -[FigLearnedMattingMetalStage dealloc](&v4, sel_dealloc);
}

- (int)clearBuffer:(__CVBuffer *)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  MTLComputePipelineState *clearTextureKernel;
  void *v9;
  __int128 v11;
  uint64_t v12;

  if (a3
    && (-[FigLearnedMattingMetalStage _textureFromPixelBuffer:usage:]((uint64_t)self, a3, 2),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "width");
    v7 = objc_msgSend(v5, "height");
    clearTextureKernel = self->_clearTextureKernel;
    *(_QWORD *)&v11 = v6;
    *((_QWORD *)&v11 + 1) = v7;
    v12 = 1;
    -[FigLearnedMattingMetalStage _runKernel:sourceTexture:destinationTexture:gridSize:setParamsBlock:]((uint64_t)self, clearTextureKernel, v5, 0, &v11, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "commit");

    return 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

- (id)_textureFromPixelBuffer:(uint64_t)a3 usage:
{
  OSType PixelFormatType;
  MTLPixelFormat v7;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  void *v11;
  const __CFDictionary *v12;
  CVReturn v13;
  void *v14;
  BOOL v15;
  CVMetalTextureRef image;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
  if (PixelFormatType == 1111970369)
  {
    v7 = MTLPixelFormatBGRA8Unorm;
    goto LABEL_9;
  }
  if (PixelFormatType == 1278226536)
  {
    v7 = MTLPixelFormatR16Float;
    goto LABEL_9;
  }
  if (PixelFormatType != 1278226488)
    return 0;
  v7 = MTLPixelFormatR8Unorm;
LABEL_9:
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(pixelBuffer, 0);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(pixelBuffer, 0);
  v17 = *MEMORY[0x1E0CA8F58];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  v12 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);

  image = 0;
  v13 = CVMetalTextureCacheCreateTextureFromImage((CFAllocatorRef)*MEMORY[0x1E0C9AE00], *(CVMetalTextureCacheRef *)(a1 + 40), pixelBuffer, v12, v7, WidthOfPlane, HeightOfPlane, 0, &image);
  v14 = 0;
  if (v13)
    v15 = 1;
  else
    v15 = image == 0;
  if (!v15)
  {
    CVMetalTextureGetTexture(image);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(image);
  }
  return v14;
}

- (id)_runKernel:(void *)a3 sourceTexture:(void *)a4 destinationTexture:(__int128 *)a5 gridSize:(void *)a6 setParamsBlock:
{
  id v11;
  id v12;
  void (**v13)(id, void *);
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  uint64_t v22;
  _QWORD v23[3];

  v11 = a2;
  v12 = a4;
  v13 = a6;
  if (a1)
  {
    v14 = *(void **)(a1 + 8);
    v15 = a3;
    objc_msgSend(v14, "commandQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "commandBuffer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_runKernel_%@"), v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setLabel:", v18);

    objc_msgSend(v17, "computeCommandEncoder");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setComputePipelineState:", v11);
    objc_msgSend(v19, "setTexture:atIndex:", v15, 0);

    if (v12)
      objc_msgSend(v19, "setTexture:atIndex:", v12, 1);
    if (v13)
      v13[2](v13, v19);
    v23[0] = objc_msgSend(v11, "threadExecutionWidth");
    v23[1] = (unint64_t)objc_msgSend(v11, "maxTotalThreadsPerThreadgroup") / v23[0];
    v23[2] = 1;
    v21 = *a5;
    v22 = *((_QWORD *)a5 + 2);
    objc_msgSend(v19, "dispatchThreads:threadsPerThreadgroup:", &v21, v23);
    objc_msgSend(v19, "endEncoding");

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (int)createTileFrom:(__CVBuffer *)a3 to:(__CVBuffer *)a4 withStart:(id)a5 commandBuffer:
{
  void *v5;
  unsigned int v6;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[3];

  v6 = a5;
  v10 = v5;
  if (!a3
    || !a4
    || (-[FigLearnedMattingMetalStage _textureFromPixelBuffer:usage:]((uint64_t)self, a3, 1),
        (v11 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v19 = FigSignalErrorAt();
    goto LABEL_7;
  }
  v12 = (void *)v11;
  -[FigLearnedMattingMetalStage _textureFromPixelBuffer:usage:]((uint64_t)self, a4, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v19 = FigSignalErrorAt();
LABEL_11:

    goto LABEL_7;
  }
  v14 = v13;
  v15 = objc_msgSend(v13, "width");
  v16 = objc_msgSend(v14, "height");
  objc_msgSend(v10, "blitCommandEncoder");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v19 = FigSignalErrorAt();

    goto LABEL_11;
  }
  v18 = v17;
  memset(v23, 0, sizeof(v23));
  v22[0] = (unsigned __int16)v6;
  v22[1] = HIWORD(v6);
  v22[2] = 0;
  v21[0] = v15;
  v21[1] = v16;
  v21[2] = 1;
  objc_msgSend(v17, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v12, 0, 0, v22, v21, v14, 0, 0, v23);
  objc_msgSend(v18, "endEncoding");

  v19 = 0;
LABEL_7:

  return v19;
}

- (int)createTileFrom:(FigLearnedMattingMetalStage *)self to:(SEL)a2 withStart:(__CVBuffer *)a3 withScale:(__CVBuffer *)a4 outCommandBuffer:(id *)a5
{
  uint64_t v5;
  uint64_t v6;
  __CVBuffer *v7;
  uint64_t v9;
  uint64_t v10;
  void *v12;
  __CVBuffer *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  MTLComputePipelineState *createTileWithScaleKernel;
  void *v18;
  id v19;
  int v20;
  __int128 v22;
  uint64_t v23;
  _QWORD aBlock[6];

  if (!a3)
    goto LABEL_13;
  v7 = a4;
  if (!a4)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v20 = FigSignalErrorAt();
LABEL_14:
    v12 = 0;
LABEL_17:
    v16 = 0;
    goto LABEL_9;
  }
  if (!a5)
  {
LABEL_13:
    fig_log_get_emitter();
    FigDebugAssert3();
    v20 = FigSignalErrorAt();
    v7 = 0;
    goto LABEL_14;
  }
  v9 = v6;
  v10 = v5;
  -[FigLearnedMattingMetalStage _textureFromPixelBuffer:usage:]((uint64_t)self, a3, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v20 = FigSignalErrorAt();
    v7 = 0;
    goto LABEL_17;
  }
  -[FigLearnedMattingMetalStage _textureFromPixelBuffer:usage:]((uint64_t)self, v7, 2);
  v13 = (__CVBuffer *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  if (!v13)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v20 = FigSignalErrorAt();
    goto LABEL_17;
  }
  v14 = -[__CVBuffer width](v13, "width");
  v15 = -[__CVBuffer height](v7, "height");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__FigLearnedMattingMetalStage_createTileFrom_to_withStart_withScale_outCommandBuffer___block_invoke;
  aBlock[3] = &__block_descriptor_48_e36_v16__0___MTLComputeCommandEncoder__8l;
  aBlock[4] = v10;
  aBlock[5] = v9;
  v16 = _Block_copy(aBlock);
  createTileWithScaleKernel = self->_createTileWithScaleKernel;
  *(_QWORD *)&v22 = v14;
  *((_QWORD *)&v22 + 1) = v15;
  v23 = 1;
  -[FigLearnedMattingMetalStage _runKernel:sourceTexture:destinationTexture:gridSize:setParamsBlock:]((uint64_t)self, createTileWithScaleKernel, v12, v7, &v22, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    v20 = 0;
LABEL_9:
    v19 = 0;
    goto LABEL_10;
  }
  v19 = objc_retainAutorelease(v18);
  v20 = 0;
  *a5 = v19;
LABEL_10:

  return v20;
}

void __86__FigLearnedMattingMetalStage_createTileFrom_to_withStart_withScale_outCommandBuffer___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1 + 32;
  v4 = a2;
  objc_msgSend(v4, "setBytes:length:atIndex:", v3, 8, 0);
  objc_msgSend(v4, "setBytes:length:atIndex:", a1 + 40, 8, 1);

}

- (int)pasteTileFrom:(__CVBuffer *)a3 to:(__CVBuffer *)a4 withStart:(id *)a5 withNoOverlapStart:withNoOverlapEnd:outCommandBuffer:
{
  int v5;
  int v6;
  _QWORD *v7;
  __CVBuffer *v8;
  _QWORD *v9;
  int v10;
  int v11;
  int v12;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  MTLComputePipelineState *pasteTileKernel;
  void *v19;
  id v20;
  int v21;
  __int128 v23;
  uint64_t v24;
  _QWORD aBlock[4];
  int v26;
  int v27;
  int v28;

  if (!a3)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v21 = FigSignalErrorAt();
    v8 = 0;
LABEL_11:
    v14 = 0;
LABEL_14:
    v17 = 0;
    v20 = 0;
    goto LABEL_8;
  }
  v8 = a4;
  if (!a4)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v21 = FigSignalErrorAt();
    goto LABEL_11;
  }
  v9 = v7;
  v10 = v6;
  v11 = v5;
  v12 = (int)a5;
  -[FigLearnedMattingMetalStage _textureFromPixelBuffer:usage:]((uint64_t)self, a3, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v21 = FigSignalErrorAt();
    v8 = 0;
    goto LABEL_14;
  }
  -[FigLearnedMattingMetalStage _textureFromPixelBuffer:usage:]((uint64_t)self, v8, 2);
  v8 = (__CVBuffer *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v21 = FigSignalErrorAt();
    goto LABEL_14;
  }
  v15 = objc_msgSend(v14, "width");
  v16 = objc_msgSend(v14, "height");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __111__FigLearnedMattingMetalStage_pasteTileFrom_to_withStart_withNoOverlapStart_withNoOverlapEnd_outCommandBuffer___block_invoke;
  aBlock[3] = &__block_descriptor_44_e36_v16__0___MTLComputeCommandEncoder__8l;
  v26 = v12;
  v27 = v11;
  v28 = v10;
  v17 = _Block_copy(aBlock);
  pasteTileKernel = self->_pasteTileKernel;
  *(_QWORD *)&v23 = v15;
  *((_QWORD *)&v23 + 1) = v16;
  v24 = 1;
  -[FigLearnedMattingMetalStage _runKernel:sourceTexture:destinationTexture:gridSize:setParamsBlock:]((uint64_t)self, pasteTileKernel, v14, v8, &v23, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  v21 = 0;
  if (v9 && v19)
  {
    v20 = objc_retainAutorelease(v19);
    v21 = 0;
    *v9 = v20;
  }
LABEL_8:

  return v21;
}

void __111__FigLearnedMattingMetalStage_pasteTileFrom_to_withStart_withNoOverlapStart_withNoOverlapEnd_outCommandBuffer___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1 + 32;
  v4 = a2;
  objc_msgSend(v4, "setBytes:length:atIndex:", v3, 4, 0);
  objc_msgSend(v4, "setBytes:length:atIndex:", a1 + 36, 4, 1);
  objc_msgSend(v4, "setBytes:length:atIndex:", a1 + 40, 4, 2);

}

- (void)finishProcessing
{
  __CVMetalTextureCache *textureCache;

  textureCache = self->_textureCache;
  if (textureCache)
    CVMetalTextureCacheFlush(textureCache, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clearTextureKernel, 0);
  objc_storeStrong((id *)&self->_pasteTileKernel, 0);
  objc_storeStrong((id *)&self->_createTileWithScaleKernel, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end
