@implementation NUSurfaceRenderJob

- (id)imageAccumulationNodeWithImageSize:(id)a3 tileSize:(id)a4 borderSize:(id)a5 format:(id)a6 colorSpace:(id)a7
{
  int64_t var1;
  int64_t var0;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  id v14;
  id v15;
  NUSurfaceImageAccumulationNode *v16;
  void *v17;
  NUSurfaceImageAccumulationNode *v18;

  var1 = a5.var1;
  var0 = a5.var0;
  v9 = a4.var1;
  v10 = a4.var0;
  v11 = a3.var1;
  v12 = a3.var0;
  v14 = a7;
  v15 = a6;
  v16 = [NUSurfaceImageAccumulationNode alloc];
  -[NURenderJob renderNode](self, "renderNode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[NUImageAccumulationNode initWithImageSize:tileSize:borderSize:pixelFormat:colorSpace:input:](v16, "initWithImageSize:tileSize:borderSize:pixelFormat:colorSpace:input:", v12, v11, v10, v9, var0, var1, v15, v14, v17);

  return v18;
}

- (id)result
{
  _NUSurfaceRenderResult *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(_NUSurfaceRenderResult);
  -[NUImageRenderJob renderedRegion](self, "renderedRegion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUImageRenderResult setRegion:](v3, "setRegion:", v4);

  -[NUImageRenderJob renderedImage](self, "renderedImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUSurfaceRenderResult setImage:](v3, "setImage:", v5);

  -[NURenderJob outputGeometry](self, "outputGeometry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUImageRenderResult setGeometry:](v3, "setGeometry:", v6);

  return v3;
}

@end
