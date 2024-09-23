@implementation CLKUITexture

+ (id)nullTexture2D
{
  if (nullTexture2D_onceToken != -1)
    dispatch_once(&nullTexture2D_onceToken, &__block_literal_global_4);
  return (id)__nullTexture2D;
}

void __29__CLKUITexture_nullTexture2D__block_invoke()
{
  CLKUITexture *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = [CLKUITexture alloc];
  +[CLKUIResourceManager sharedInstance](CLKUIResourceManager, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nullAtlas2D");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[CLKUITexture initWithAtlas:rect:](v0, "initWithAtlas:rect:", v1, *(double *)vdupq_n_s64(0x7FC000007FC00000uLL).i64);
  v3 = (void *)__nullTexture2D;
  __nullTexture2D = v2;

}

+ (id)nullTextureCube
{
  if (nullTextureCube_onceToken != -1)
    dispatch_once(&nullTextureCube_onceToken, &__block_literal_global_72);
  return (id)__nullTextureCube;
}

void __31__CLKUITexture_nullTextureCube__block_invoke()
{
  CLKUITexture *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = [CLKUITexture alloc];
  +[CLKUIResourceManager sharedInstance](CLKUIResourceManager, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nullAtlasCube");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[CLKUITexture initWithAtlas:rect:](v0, "initWithAtlas:rect:", v1, *(double *)vdupq_n_s64(0x7FC000007FC00000uLL).i64);
  v3 = (void *)__nullTextureCube;
  __nullTextureCube = v2;

}

+ (id)textureWithProviderDelegate:(id)a3 uuid:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  +[CLKUITexture nullTexture2D](CLKUITexture, "nullTexture2D");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "textureWithProviderDelegate:uuid:rect:nullTexture:streaming:", v7, v6, v8, 0, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)textureWithProviderDelegate:(id)a3 uuid:(id)a4 rect:
{
  double v4;
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v12;

  v12 = v4;
  v7 = a4;
  v8 = a3;
  +[CLKUITexture nullTexture2D](CLKUITexture, "nullTexture2D");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "textureWithProviderDelegate:uuid:rect:nullTexture:streaming:", v8, v7, v9, 0, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)textureWithProviderDelegate:(id)a3 uuid:(id)a4 nullTexture:(id)a5
{
  return (id)objc_msgSend(a1, "textureWithProviderDelegate:uuid:rect:nullTexture:streaming:", a3, a4, a5, 0, 0.0);
}

+ (id)textureWithProviderDelegate:(id)a3 uuid:(id)a4 rect:(id)a5 nullTexture:
{
  return (id)objc_msgSend(a1, "textureWithProviderDelegate:uuid:rect:nullTexture:streaming:", a3, a4, a5, 0);
}

+ (id)textureWithProviderDelegate:(id)a3 uuid:(id)a4 streaming:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  +[CLKUITexture nullTexture2D](CLKUITexture, "nullTexture2D");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "textureWithProviderDelegate:uuid:rect:nullTexture:streaming:", v9, v8, v10, v5, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)textureWithProviderDelegate:(id)a3 uuid:(id)a4 rect:(id)a5 nullTexture:(BOOL)a6 streaming:
{
  double v6;
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  double v16;

  v7 = a6;
  v16 = v6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  +[CLKUIResourceManager sharedInstance](CLKUIResourceManager, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "textureForUuid:delegate:rect:nullTexture:streaming:", v11, v12, v10, v7, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (CLKUITexture)initWithAtlas:(id)a3 rect:
{
  __int128 v3;
  id v6;
  CLKUITexture *v7;
  CLKUITexture *v8;
  __int128 v10;
  objc_super v11;

  v10 = v3;
  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLKUITexture;
  v7 = -[CLKUITexture init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_atlas, a3);
    *(_OWORD *)v8->_rect = v10;
    objc_msgSend(v6, "incrementInstanceCount");
    v8->_null = v8->_atlas == 0;
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[CLKUIAtlas decrementInstanceCount](self->_atlas, "decrementInstanceCount");
  v3.receiver = self;
  v3.super_class = (Class)CLKUITexture;
  -[CLKUITexture dealloc](&v3, sel_dealloc);
}

- (NSString)uuid
{
  return -[CLKUIAtlas uuid](self->_atlas, "uuid");
}

- (unint64_t)status
{
  return -[CLKUIAtlas status](self->_atlas, "status");
}

- (CLKUIAtlas)atlas
{
  return self->_atlas;
}

- (__n128)rect
{
  return a1[2];
}

- (BOOL)isNull
{
  return self->_null;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_atlas, 0);
}

@end
