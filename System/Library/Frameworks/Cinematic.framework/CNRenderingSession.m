@implementation CNRenderingSession

- (CNRenderingSession)initWithCommandQueue:(id)commandQueue sessionAttributes:(CNRenderingSessionAttributes *)sessionAttributes preferredTransform:(CGAffineTransform *)preferredTransform quality:(CNRenderingQuality)quality
{
  id v11;
  CNRenderingSessionAttributes *v12;
  CNRenderingSession *v13;
  CNRenderingSession *v14;
  __int128 v15;
  __int128 v16;
  const __CFAllocator *v17;
  const __CFDictionary *v18;
  void *v19;
  __CVMetalTextureCache **p_textureCache;
  NSObject *v21;
  objc_super v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v11 = commandQueue;
  v12 = sessionAttributes;
  v23.receiver = self;
  v23.super_class = (Class)CNRenderingSession;
  v13 = -[CNRenderingSession init](&v23, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_commandQueue, commandQueue);
    objc_storeStrong((id *)&v14->_sessionAttributes, sessionAttributes);
    v15 = *(_OWORD *)&preferredTransform->a;
    v16 = *(_OWORD *)&preferredTransform->c;
    *(_OWORD *)&v14->_preferredTransform.tx = *(_OWORD *)&preferredTransform->tx;
    *(_OWORD *)&v14->_preferredTransform.c = v16;
    *(_OWORD *)&v14->_preferredTransform.a = v15;
    v14->_quality = quality;
    v17 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v24 = *MEMORY[0x24BDC55C0];
    v25[0] = &unk_250452AC8;
    v18 = (const __CFDictionary *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    objc_msgSend(v11, "device");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    p_textureCache = &v14->_textureCache;
    LODWORD(v17) = CVMetalTextureCacheCreate(v17, v18, v19, 0, &v14->_textureCache);

    if ((_DWORD)v17 || !*p_textureCache)
    {
      _CNLogSystem();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[CNRenderingSession initWithCommandQueue:sessionAttributes:preferredTransform:quality:].cold.1(v21);

      *p_textureCache = 0;
    }
  }

  return v14;
}

- (void)dealloc
{
  __CVMetalTextureCache *textureCache;
  objc_super v4;

  textureCache = self->_textureCache;
  if (textureCache)
    CFRelease(textureCache);
  v4.receiver = self;
  v4.super_class = (Class)CNRenderingSession;
  -[CNRenderingSession dealloc](&v4, sel_dealloc);
}

- (BOOL)encodeRenderToCommandBuffer:(id)commandBuffer frameAttributes:(CNRenderingSessionFrameAttributes *)frameAttributes sourceImage:(CVPixelBufferRef)sourceImage sourceDisparity:(CVPixelBufferRef)sourceDisparity destinationImage:(CVPixelBufferRef)destinationImage
{
  void *v12;
  CNRenderingSessionFrameAttributes *v13;
  id v14;
  void *v15;
  void *v16;

  v12 = (void *)MEMORY[0x24BE74BB0];
  v13 = frameAttributes;
  v14 = commandBuffer;
  objc_msgSend(v14, "device");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "createFromPixelbuffer:device:textureCache:read:write:", destinationImage, v15, self->_textureCache, 0, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(sourceDisparity) = -[CNRenderingSession _encodeRenderToCommandBuffer:frameAttributes:sourceImage:sourceDisparity:destinationTexture:](self, "_encodeRenderToCommandBuffer:frameAttributes:sourceImage:sourceDisparity:destinationTexture:", v14, v13, sourceImage, sourceDisparity, v16);

  return (char)sourceDisparity;
}

- (BOOL)encodeRenderToCommandBuffer:(id)commandBuffer frameAttributes:(CNRenderingSessionFrameAttributes *)frameAttributes sourceImage:(CVPixelBufferRef)sourceImage sourceDisparity:(CVPixelBufferRef)sourceDisparity destinationRGBA:(id)destinationRGBA
{
  void *v12;
  CNRenderingSessionFrameAttributes *v13;
  id v14;
  void *v15;

  v12 = (void *)MEMORY[0x24BE74BB0];
  v13 = frameAttributes;
  v14 = commandBuffer;
  objc_msgSend(v12, "createRGBA:", destinationRGBA);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(sourceDisparity) = -[CNRenderingSession _encodeRenderToCommandBuffer:frameAttributes:sourceImage:sourceDisparity:destinationTexture:](self, "_encodeRenderToCommandBuffer:frameAttributes:sourceImage:sourceDisparity:destinationTexture:", v14, v13, sourceImage, sourceDisparity, v15);

  return (char)sourceDisparity;
}

- (BOOL)encodeRenderToCommandBuffer:(id)commandBuffer frameAttributes:(CNRenderingSessionFrameAttributes *)frameAttributes sourceImage:(CVPixelBufferRef)sourceImage sourceDisparity:(CVPixelBufferRef)sourceDisparity destinationLuma:(id)destinationLuma destinationChroma:(id)destinationChroma
{
  void *v14;
  CNRenderingSessionFrameAttributes *v15;
  id v16;
  void *v17;

  v14 = (void *)MEMORY[0x24BE74BB0];
  v15 = frameAttributes;
  v16 = commandBuffer;
  objc_msgSend(v14, "createYUV420:chroma:", destinationLuma, destinationChroma);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(destinationLuma) = -[CNRenderingSession _encodeRenderToCommandBuffer:frameAttributes:sourceImage:sourceDisparity:destinationTexture:](self, "_encodeRenderToCommandBuffer:frameAttributes:sourceImage:sourceDisparity:destinationTexture:", v16, v15, sourceImage, sourceDisparity, v17);

  return (char)destinationLuma;
}

- (BOOL)_encodeRenderToCommandBuffer:(id)a3 frameAttributes:(id)a4 sourceImage:(__CVBuffer *)a5 sourceDisparity:(__CVBuffer *)a6 destinationTexture:(id)a7
{
  id v12;
  id v13;
  MTLCommandQueue *commandQueue;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  __CVBuffer *v21;
  __CVBuffer *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  double Width;
  double Height;
  double v31;
  double v32;
  double v33;
  void *v34;
  __int128 v35;
  PTRenderPipeline *v36;
  PTRenderPipeline *renderPipeline;
  CNRenderingQuality v38;
  uint64_t v39;
  PTRenderState *v40;
  PTRenderState *renderState;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  int v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  NSObject *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v65;
  _OWORD v66[3];
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a7;
  commandQueue = self->_commandQueue;
  v15 = a4;
  -[MTLCommandQueue device](commandQueue, "device");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "device");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16 != v17)
  {
    _CNLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      -[MTLCommandQueue device](self->_commandQueue, "device");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "device");
      v65 = v13;
      v21 = a5;
      v22 = a6;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "name");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v68 = v20;
      v69 = 2112;
      v70 = v24;
      _os_log_impl(&dword_23307F000, v18, OS_LOG_TYPE_DEFAULT, "warning: rendering session device (%@) and command buffer device (%@) are different!", buf, 0x16u);

      a6 = v22;
      a5 = v21;
      v13 = v65;

    }
  }
  if (!self->_renderPipeline)
  {
    v25 = objc_alloc(MEMORY[0x24BE74B90]);
    objc_msgSend(v12, "device");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNRenderingSessionAttributes internalMetadata](self->_sessionAttributes, "internalMetadata");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "renderingVersion");
    Width = (double)CVPixelBufferGetWidth(a5);
    Height = (double)CVPixelBufferGetHeight(a5);
    v31 = (double)(unint64_t)objc_msgSend(v13, "width");
    v32 = (double)(unint64_t)objc_msgSend(v13, "height");
    v33 = (double)CVPixelBufferGetWidth(a6);
    v34 = (void *)objc_msgSend(v25, "initWithDevice:version:colorInputSize:colorOutputSize:disparitySize:", v26, v28, Width, Height, v31, v32, v33, (double)CVPixelBufferGetHeight(a6));

    objc_msgSend(v34, "setDebugRendering:", 0);
    objc_msgSend(v34, "setVerbose:", 0);
    objc_msgSend(v34, "setUseRGBA:", objc_msgSend(v13, "isRGB"));
    v35 = *(_OWORD *)&self->_preferredTransform.c;
    v66[0] = *(_OWORD *)&self->_preferredTransform.a;
    v66[1] = v35;
    v66[2] = *(_OWORD *)&self->_preferredTransform.tx;
    objc_msgSend(v34, "setPreferredTransform:", v66);
    v36 = (PTRenderPipeline *)objc_msgSend(objc_alloc(MEMORY[0x24BE74B88]), "initWithDescriptor:", v34);
    renderPipeline = self->_renderPipeline;
    self->_renderPipeline = v36;

    v38 = -[CNRenderingSession quality](self, "quality");
    if ((unint64_t)v38 > CNRenderingQualityExportHigh)
      v39 = 75;
    else
      v39 = dword_23308FDA0[v38];
    -[PTRenderPipeline createRenderStateWithQuality:](self->_renderPipeline, "createRenderStateWithQuality:", v39);
    v40 = (PTRenderState *)objc_claimAutoreleasedReturnValue();
    renderState = self->_renderState;
    self->_renderState = v40;

    -[CNRenderingSessionAttributes internalMetadata](self->_sessionAttributes, "internalMetadata");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "applyToRenderState:", self->_renderState);

  }
  v43 = (void *)objc_opt_new();
  -[CNRenderingSessionAttributes internalMetadata](self->_sessionAttributes, "internalMetadata");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "applyToRenderRequest:", v43);

  objc_msgSend(v15, "internalMetadata");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "applyToRenderRequest:", v43);

  objc_msgSend(v43, "setRenderState:", self->_renderState);
  objc_msgSend(v15, "fNumber");
  objc_msgSend(v43, "setFNumber:");
  objc_msgSend(v15, "focusDisparity");
  v47 = v46;

  LODWORD(v48) = v47;
  objc_msgSend(v43, "setFocusDisparity:", v48);
  v49 = (void *)MEMORY[0x24BE74BB0];
  objc_msgSend(v12, "device");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "createFromPixelbuffer:device:textureCache:read:write:", a5, v50, self->_textureCache, 1, 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setSourceColor:", v51);

  objc_msgSend(v43, "setDestinationColor:", v13);
  v52 = (void *)MEMORY[0x24BE74B80];
  objc_msgSend(v12, "device");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "createTextureFromPixelBuffer:device:textureCache:sRGB:", a6, v53, self->_textureCache, 0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setSourceDisparity:", v54);

  objc_msgSend(v43, "sourceColor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "copyMetadataTo:", v13);

  v56 = -[PTRenderPipeline encodeRenderTo:withRenderRequest:](self->_renderPipeline, "encodeRenderTo:withRenderRequest:", v12, v43);
  if (v56)
  {
    _CNLogSystem();
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      -[CNRenderingSession _encodeRenderToCommandBuffer:frameAttributes:sourceImage:sourceDisparity:destinationTexture:].cold.1((uint64_t)v12, v57, v58, v59, v60, v61, v62, v63);

  }
  return v56 == 0;
}

+ (NSArray)sourcePixelFormatTypes
{
  if (sourcePixelFormatTypes_onceToken != -1)
    dispatch_once(&sourcePixelFormatTypes_onceToken, &__block_literal_global);
  return (NSArray *)(id)sourcePixelFormatTypes_sSourcePixelFormatTypes;
}

void __44__CNRenderingSession_sourcePixelFormatTypes__block_invoke()
{
  void *v0;

  v0 = (void *)sourcePixelFormatTypes_sSourcePixelFormatTypes;
  sourcePixelFormatTypes_sSourcePixelFormatTypes = (uint64_t)&unk_250452BD0;

}

+ (NSArray)destinationPixelFormatTypes
{
  if (destinationPixelFormatTypes_onceToken != -1)
    dispatch_once(&destinationPixelFormatTypes_onceToken, &__block_literal_global_13);
  return (NSArray *)(id)destinationPixelFormatTypes_sDestinationPixelFormatTypes;
}

void __49__CNRenderingSession_destinationPixelFormatTypes__block_invoke()
{
  void *v0;

  v0 = (void *)destinationPixelFormatTypes_sDestinationPixelFormatTypes;
  destinationPixelFormatTypes_sDestinationPixelFormatTypes = (uint64_t)&unk_250452BE8;

}

- (id)commandQueue
{
  return objc_getProperty(self, a2, 40, 1);
}

- (CNRenderingSessionAttributes)sessionAttributes
{
  return (CNRenderingSessionAttributes *)objc_getProperty(self, a2, 8, 1);
}

- (CGAffineTransform)preferredTransform
{
  CGAffineTransform *result;

  objc_copyStruct(retstr, &self->_preferredTransform, 48, 1, 0);
  return result;
}

- (CNRenderingQuality)quality
{
  return self->_quality;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_renderState, 0);
  objc_storeStrong((id *)&self->_renderPipeline, 0);
  objc_storeStrong((id *)&self->_sessionAttributes, 0);
}

- (void)initWithCommandQueue:(os_log_t)log sessionAttributes:preferredTransform:quality:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23307F000, log, OS_LOG_TYPE_ERROR, "Error allocating texture cache", v1, 2u);
}

- (void)_encodeRenderToCommandBuffer:(uint64_t)a3 frameAttributes:(uint64_t)a4 sourceImage:(uint64_t)a5 sourceDisparity:(uint64_t)a6 destinationTexture:(uint64_t)a7 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_23307F000, a2, a3, "error: encodeRenderToCommandBuffer failed (%@)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
