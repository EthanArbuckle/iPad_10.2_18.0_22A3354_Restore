@implementation CMIResourceMetalTexture

- (CMIResourceMetalTexture)initWithTexture:(id)a3 metadata:(id)a4
{
  id v7;
  id v8;
  CMIResourceMetalTexture *v9;
  MTLCommandBuffer *commandBuffer;
  CMIResourceMetalTexture *v11;
  NSObject *v13;
  objc_super v14;
  os_log_type_t type;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v14.receiver = self;
    v14.super_class = (Class)CMIResourceMetalTexture;
    v9 = -[CMIResourceMetalTexture init](&v14, sel_init);
    if (v9)
    {
      FigMetalIncRef(v7);
      objc_storeStrong((id *)&v9->_texture, a3);
      objc_storeStrong((id *)&v9->_metadata, a4);
      commandBuffer = v9->_commandBuffer;
      v9->_commandBuffer = 0;

      self = v9;
    }
    else
    {
      self = 0;
    }
  }
  else
  {
    v16 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v13 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v9 = 0;
  }
  v11 = v9;

  return v11;
}

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

- (CMIResourceMetalTexture)initWithTexture:(id)a3 descriptor:(id)a4
{
  id v7;
  id v8;
  CMIResourceMetalTexture *v9;
  uint64_t v10;
  NSDictionary *metadata;
  uint64_t v12;
  MTLCommandBuffer *commandBuffer;
  id v14;
  void *v15;
  uint64_t v16;
  NSDictionary *attachments;
  CMIResourceMetalTexture *v18;
  NSObject *v20;
  objc_super v21;
  os_log_type_t type;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v21.receiver = self;
    v21.super_class = (Class)CMIResourceMetalTexture;
    v9 = -[CMIResourceMetalTexture init](&v21, sel_init);
    if (v9)
    {
      FigMetalIncRef(v7);
      objc_storeStrong((id *)&v9->_texture, a3);
      objc_msgSend(v8, "metadata");
      v10 = objc_claimAutoreleasedReturnValue();
      metadata = v9->_metadata;
      v9->_metadata = (NSDictionary *)v10;

      v9->_matchingPixelBufferFormat = objc_msgSend(v8, "matchingPixelBufferFormat");
      objc_msgSend(v8, "commandBuffer");
      v12 = objc_claimAutoreleasedReturnValue();
      commandBuffer = v9->_commandBuffer;
      v9->_commandBuffer = (MTLCommandBuffer *)v12;

      v14 = objc_alloc(MEMORY[0x1E0C99D80]);
      objc_msgSend(v8, "attachments");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "initWithDictionary:", v15);
      attachments = v9->_attachments;
      v9->_attachments = (NSDictionary *)v16;

      self = v9;
    }
    else
    {
      self = 0;
    }
  }
  else
  {
    v23 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v20 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v9 = 0;
  }
  v18 = v9;

  return v18;
}

- (int)resourceType
{
  return 1;
}

- (void)releaseAll
{
  FigMetalDecRef((id *)&self->_texture);
}

- (void)dealloc
{
  objc_super v3;

  -[CMIResourceMetalTexture releaseAll](self, "releaseAll");
  v3.receiver = self;
  v3.super_class = (Class)CMIResourceMetalTexture;
  -[CMIResourceMetalTexture dealloc](&v3, sel_dealloc);
}

- (NSDictionary)attachments
{
  return self->_attachments;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)presentationTimeStamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[2];
  return self;
}

- (unsigned)matchingPixelBufferFormat
{
  return self->_matchingPixelBufferFormat;
}

- (MTLTexture)texture
{
  return self->_texture;
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
  objc_storeStrong((id *)&self->_texture, 0);
}

@end
