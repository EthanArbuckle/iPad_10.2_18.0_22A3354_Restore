@implementation CMIResourceMetalTextureBiPlanarYUV

- (int)waitForCompletion
{
  MTLCommandBuffer *commandBuffer;
  int v4;
  MTLCommandBuffer *v5;

  commandBuffer = self->_commandBuffer;
  if (commandBuffer)
  {
    -[MTLCommandBuffer waitUntilCompleted](commandBuffer, "waitUntilCompleted");
    v4 = 0;
    v5 = self->_commandBuffer;
  }
  else
  {
    v5 = 0;
    v4 = 1;
  }
  self->_commandBuffer = 0;

  return v4;
}

- (CMIResourceMetalTextureBiPlanarYUV)initWithTextureY:(id)a3 textureUV:(id)a4 metadata:(id)a5
{
  id v9;
  id v10;
  id v11;
  char *v12;
  uint64_t v13;
  void *v14;
  CMIResourceMetalTextureBiPlanarYUV *v15;
  NSObject *v17;
  objc_super v18;
  os_log_type_t type;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9 && v10)
  {
    v18.receiver = self;
    v18.super_class = (Class)CMIResourceMetalTextureBiPlanarYUV;
    v12 = -[CMIResourceMetalTextureBiPlanarYUV init](&v18, sel_init);
    if (v12)
    {
      FigMetalIncRef(v9);
      FigMetalIncRef(v10);
      objc_storeStrong((id *)v12 + 1, a3);
      objc_storeStrong((id *)v12 + 2, a4);
      objc_storeStrong((id *)v12 + 6, a5);
      v13 = MEMORY[0x1E0CA2E18];
      *(_OWORD *)(v12 + 56) = *MEMORY[0x1E0CA2E18];
      *((_QWORD *)v12 + 9) = *(_QWORD *)(v13 + 16);
      v14 = (void *)*((_QWORD *)v12 + 3);
      *((_QWORD *)v12 + 3) = 0;

      self = (CMIResourceMetalTextureBiPlanarYUV *)v12;
    }
    else
    {
      self = 0;
    }
  }
  else
  {
    v20 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v17 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v12 = 0;
  }
  v15 = v12;

  return v15;
}

- (CMIResourceMetalTextureBiPlanarYUV)initWithTextureY:(id)a3 textureUV:(id)a4 descriptor:(id)a5
{
  id v9;
  id v10;
  id v11;
  CMIResourceMetalTextureBiPlanarYUV *v12;
  uint64_t v13;
  NSDictionary *metadata;
  uint64_t v15;
  MTLCommandBuffer *commandBuffer;
  id v17;
  void *v18;
  uint64_t v19;
  NSDictionary *attachments;
  CMIResourceMetalTextureBiPlanarYUV *v21;
  NSObject *v23;
  objc_super v24;
  os_log_type_t type;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9 && v10)
  {
    v24.receiver = self;
    v24.super_class = (Class)CMIResourceMetalTextureBiPlanarYUV;
    v12 = -[CMIResourceMetalTextureBiPlanarYUV init](&v24, sel_init);
    if (v12)
    {
      FigMetalIncRef(v9);
      FigMetalIncRef(v10);
      objc_storeStrong((id *)&v12->_textureY, a3);
      objc_storeStrong((id *)&v12->_textureUV, a4);
      objc_msgSend(v11, "metadata");
      v13 = objc_claimAutoreleasedReturnValue();
      metadata = v12->_metadata;
      v12->_metadata = (NSDictionary *)v13;

      v12->_matchingPixelBufferFormat = objc_msgSend(v11, "matchingPixelBufferFormat");
      objc_msgSend(v11, "commandBuffer");
      v15 = objc_claimAutoreleasedReturnValue();
      commandBuffer = v12->_commandBuffer;
      v12->_commandBuffer = (MTLCommandBuffer *)v15;

      v17 = objc_alloc(MEMORY[0x1E0C99D80]);
      objc_msgSend(v11, "attachments");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "initWithDictionary:", v18);
      attachments = v12->_attachments;
      v12->_attachments = (NSDictionary *)v19;

      self = v12;
    }
    else
    {
      self = 0;
    }
  }
  else
  {
    v26 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v23 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v12 = 0;
  }
  v21 = v12;

  return v21;
}

- (int)resourceType
{
  return 0;
}

- (void)releaseAll
{
  FigMetalDecRef((id *)&self->_textureY);
  FigMetalDecRef((id *)&self->_textureUV);
}

- (void)dealloc
{
  objc_super v3;

  -[CMIResourceMetalTextureBiPlanarYUV releaseAll](self, "releaseAll");
  v3.receiver = self;
  v3.super_class = (Class)CMIResourceMetalTextureBiPlanarYUV;
  -[CMIResourceMetalTextureBiPlanarYUV dealloc](&v3, sel_dealloc);
}

- (NSDictionary)attachments
{
  return self->_attachments;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)presentationTimeStamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 56);
  return self;
}

- (unsigned)matchingPixelBufferFormat
{
  return self->_matchingPixelBufferFormat;
}

- (MTLTexture)textureY
{
  return self->_textureY;
}

- (MTLTexture)textureUV
{
  return self->_textureUV;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_commandBuffer, 0);
  objc_storeStrong((id *)&self->_textureUV, 0);
  objc_storeStrong((id *)&self->_textureY, 0);
}

@end
