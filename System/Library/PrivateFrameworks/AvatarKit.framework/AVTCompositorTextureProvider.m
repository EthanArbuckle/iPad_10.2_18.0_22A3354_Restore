@implementation AVTCompositorTextureProvider

- (AVTCompositorTextureProvider)initWithCompositor:(id)a3 memoji:(id)a4 propertyName:(id)a5
{
  id v8;
  id v9;
  id v10;
  AVTCompositorTextureProvider *v11;
  AVTCompositorTextureProvider *v12;
  uint64_t v13;
  NSString *propertyName;
  id WeakRetained;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AVTCompositorTextureProvider;
  v11 = -[AVTCompositorTextureProvider init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_memoji, v9);
    objc_storeWeak((id *)&v12->_compositor, v8);
    v13 = objc_msgSend(v10, "copy");
    propertyName = v12->_propertyName;
    v12->_propertyName = (NSString *)v13;

    v12->_skinIsDirty = 1;
    v12->_componentDirtyMask = -1;
    WeakRetained = objc_loadWeakRetained((id *)&v12->_compositor);
    objc_msgSend(WeakRetained, "addClient:", v12);

  }
  return v12;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_compositor);
  objc_msgSend(WeakRetained, "removeClient:", self);

  v4.receiver = self;
  v4.super_class = (Class)AVTCompositorTextureProvider;
  -[AVTCompositorTextureProvider dealloc](&v4, sel_dealloc);
}

- (void)skinColorDidChange
{
  self->_skinIsDirty = 1;
}

- (void)componentDidChangeForTypes:(unint64_t)a3
{
  self->_componentDirtyMask |= a3;
}

- (id)newTextureForDevice:(id)a3
{
  NSString *propertyName;
  id v5;
  AVTCompositorPipeline *v6;
  AVTCompositorPipeline *pipeline;
  id WeakRetained;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;

  propertyName = self->_propertyName;
  v5 = a3;
  +[AVTCompositorPipelineCache pipelineForPropertyName:device:](AVTCompositorPipelineCache, "pipelineForPropertyName:device:", propertyName, v5);
  v6 = (AVTCompositorPipeline *)objc_claimAutoreleasedReturnValue();
  pipeline = self->_pipeline;
  self->_pipeline = v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_memoji);
  objc_msgSend(WeakRetained, "skinTextureSize");
  v10 = v9;

  objc_msgSend(MEMORY[0x1E0CC6BB8], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 70, (unint64_t)v10, (unint64_t)v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUsage:", 3);
  objc_msgSend(v11, "setStorageMode:", 2);
  v12 = (void *)objc_msgSend(v5, "newTextureWithDescriptor:", v11);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Compositor - %@"), self->_propertyName);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLabel:", v13);

  return v12;
}

- (void)renderToTexture:(id)a3 computeCommandHandler:(id)a4 blitCommandHandler:(id)a5 completionHandler:(id)a6 helper:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  AVTCompositorPipeline *pipeline;
  id WeakRetained;
  id v19;
  uint64_t v20;
  id v21;

  v21 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (self->_skinIsDirty || self->_componentDirtyMask)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", -[NSMutableSet count](self->_helperTokens, "count"));
    pipeline = self->_pipeline;
    WeakRetained = objc_loadWeakRetained((id *)&self->_memoji);
    -[AVTCompositorPipeline compositeTexture:forMemoji:considerSkin:componentsToConsider:computeCommandHandler:blitCommandHandler:completionHandler:helper:helperTokens:](pipeline, "compositeTexture:forMemoji:considerSkin:componentsToConsider:computeCommandHandler:blitCommandHandler:completionHandler:helper:helperTokens:", v21, WeakRetained, self->_skinIsDirty, self->_componentDirtyMask, v12, v13, v14, v15, v16);

    v19 = objc_loadWeakRetained((id *)&self->_memoji);
    v20 = objc_msgSend(v19, "usageIntent");

    if (v20 != 2)
      objc_storeStrong((id *)&self->_helperTokens, v16);
    self->_skinIsDirty = 0;
    self->_componentDirtyMask = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helperTokens, 0);
  objc_storeStrong((id *)&self->_propertyName, 0);
  objc_storeStrong((id *)&self->_pipeline, 0);
  objc_destroyWeak((id *)&self->_compositor);
  objc_destroyWeak((id *)&self->_memoji);
}

@end
