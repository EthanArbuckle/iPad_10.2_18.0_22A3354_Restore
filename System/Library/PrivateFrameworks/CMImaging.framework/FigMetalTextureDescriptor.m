@implementation FigMetalTextureDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desc, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (MTLTextureDescriptor)desc
{
  return self->_desc;
}

- (void)setAllocationHint:(int)a3
{
  self->_allocationHint = a3;
}

- (NSString)label
{
  return self->_label;
}

- (int)allocationHint
{
  return self->_allocationHint;
}

- (BOOL)isLinear
{
  return self->_isLinear;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void)setIsLinear:(BOOL)a3
{
  self->_isLinear = a3;
}

- (FigMetalTextureDescriptor)init
{
  FigMetalTextureDescriptor *v2;
  FigMetalTextureDescriptor *v3;
  uint64_t v4;
  MTLTextureDescriptor *desc;
  MTLTextureDescriptor *v6;
  FigMetalTextureDescriptor *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FigMetalTextureDescriptor;
  v2 = -[FigMetalTextureDescriptor init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_isLinear = 0;
    v4 = objc_opt_new();
    desc = v3->_desc;
    v3->_desc = (MTLTextureDescriptor *)v4;

    v6 = v3->_desc;
    if (!v6)
    {
      FigSignalErrorAt();
      v7 = 0;
      goto LABEL_5;
    }
    -[MTLTextureDescriptor setUsage:](v6, "setUsage:", 0);
  }
  v7 = v3;
LABEL_5:

  return v7;
}

- (FigMetalTextureDescriptor)initWithDescriptor:(id)a3 allocatorLabel:(id)a4
{
  id v5;
  FigMetalTextureDescriptor *v6;
  uint64_t v7;
  MTLTextureDescriptor *desc;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSString *label;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)FigMetalTextureDescriptor;
  v6 = -[FigMetalTextureDescriptor init](&v23, sel_init);
  if (v6)
  {
    v7 = objc_opt_new();
    desc = v6->_desc;
    v6->_desc = (MTLTextureDescriptor *)v7;

    objc_msgSend(v5, "desc");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTLTextureDescriptor setWidth:](v6->_desc, "setWidth:", objc_msgSend(v9, "width"));

    objc_msgSend(v5, "desc");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTLTextureDescriptor setHeight:](v6->_desc, "setHeight:", objc_msgSend(v10, "height"));

    objc_msgSend(v5, "desc");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTLTextureDescriptor setDepth:](v6->_desc, "setDepth:", objc_msgSend(v11, "depth"));

    objc_msgSend(v5, "desc");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTLTextureDescriptor setUsage:](v6->_desc, "setUsage:", objc_msgSend(v12, "usage"));

    objc_msgSend(v5, "desc");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTLTextureDescriptor setPixelFormat:](v6->_desc, "setPixelFormat:", objc_msgSend(v13, "pixelFormat"));

    objc_msgSend(v5, "desc");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTLTextureDescriptor setTextureType:](v6->_desc, "setTextureType:", objc_msgSend(v14, "textureType"));

    objc_msgSend(v5, "desc");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTLTextureDescriptor setArrayLength:](v6->_desc, "setArrayLength:", objc_msgSend(v15, "arrayLength"));

    objc_msgSend(v5, "desc");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTLTextureDescriptor setSampleCount:](v6->_desc, "setSampleCount:", objc_msgSend(v16, "sampleCount"));

    objc_msgSend(v5, "desc");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTLTextureDescriptor setMipmapLevelCount:](v6->_desc, "setMipmapLevelCount:", objc_msgSend(v17, "mipmapLevelCount"));

    objc_msgSend(v5, "desc");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTLTextureDescriptor setCompressionMode:](v6->_desc, "setCompressionMode:", objc_msgSend(v18, "compressionMode"));

    objc_msgSend(v5, "desc");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTLTextureDescriptor setResourceOptions:](v6->_desc, "setResourceOptions:", objc_msgSend(v19, "resourceOptions"));

    objc_msgSend(v5, "desc");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTLTextureDescriptor setCompressionFootprint:](v6->_desc, "setCompressionFootprint:", objc_msgSend(v20, "compressionFootprint"));

    label = v6->_label;
    v6->_label = 0;

    v6->_allocationHint = objc_msgSend(v5, "allocationHint");
    v6->_isLinear = objc_msgSend(v5, "isLinear");
  }

  return v6;
}

- (void)setDesc:(id)a3
{
  objc_storeStrong((id *)&self->_desc, a3);
}

@end
