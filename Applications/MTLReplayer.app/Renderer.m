@implementation Renderer

- (Renderer)initWithMetalKitView:(id)a3
{
  id v4;
  Renderer *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)Renderer;
  v5 = -[Renderer init](&v8, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "device"));
    -[Renderer setDevice:](v5, "setDevice:", v6);

  }
  return v5;
}

- (void)setDevice:(id)a3
{
  MTLDevice *device;
  MTLCommandQueue *v6;
  MTLCommandQueue *commandQueue;
  GTMTLTextureRenderer *v8;
  GTMTLTextureRenderer *textureRenderer;
  id v10;

  v10 = a3;
  objc_storeStrong((id *)&self->_device, a3);
  device = self->_device;
  if (device)
  {
    v6 = (MTLCommandQueue *)-[MTLDevice newCommandQueue](device, "newCommandQueue");
    commandQueue = self->_commandQueue;
    self->_commandQueue = v6;

    v8 = (GTMTLTextureRenderer *)objc_msgSend(objc_alloc((Class)GTMTLTextureRenderer), "initWithDevice:", v10);
    textureRenderer = self->_textureRenderer;
    self->_textureRenderer = v8;

  }
}

- (void)setDisplayTextureEncoder:(id)a3
{
  MTLDevice *device;
  MTLDevice *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_encoder, a3);
  device = self->_device;
  v6 = (MTLDevice *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "device"));

  if (device != v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "device"));
    -[Renderer setDevice:](self, "setDevice:", v7);

  }
}

- (void)renderEncodedCommands:(id)a3 toCommandBuffer:(id)a4 withView:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  GTMTLTextureRenderer *textureRenderer;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  id v27;
  id v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentRenderPassDescriptor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "renderCommandEncoderWithDescriptor:", v11));
  if (v8)
  {
    v26 = v11;
    v27 = v9;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = v8;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "commands"));
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v31;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v31 != v15)
            objc_enumerationMutation(obj);
          v17 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v16);
          textureRenderer = self->_textureRenderer;
          v19 = objc_msgSend(v10, "colorPixelFormat");
          objc_msgSend(v10, "drawableSize");
          v21 = v20;
          v23 = v22;
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layer"));
          objc_msgSend(v24, "contentsScale");
          -[GTMTLTextureRenderer render:withEncoder:withFormat:renderTargetSize:viewContentsScale:](textureRenderer, "render:withEncoder:withFormat:renderTargetSize:viewContentsScale:", v17, v12, v19, v21, v23, v25);

          v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v14);
    }

    v9 = v27;
    v8 = v28;
    v11 = v26;
  }
  objc_msgSend(v12, "endEncoding");

}

- (void)drawInMTKView:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentRenderPassDescriptor"));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentDrawable"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer"));
      -[Renderer renderEncodedCommands:toCommandBuffer:withView:](self, "renderEncodedCommands:toCommandBuffer:withView:", self->_encoder, v7, v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentDrawable"));
      objc_msgSend(v7, "presentDrawable:", v8);

      objc_msgSend(v7, "commit");
    }
  }

}

- (void)mtkView:(id)a3 drawableSizeWillChange:(CGSize)a4
{
  objc_msgSend(a3, "draw", a4.width, a4.height);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textureRenderer, 0);
  objc_storeStrong((id *)&self->_encoder, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
