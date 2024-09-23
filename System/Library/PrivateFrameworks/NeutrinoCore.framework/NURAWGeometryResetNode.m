@implementation NURAWGeometryResetNode

- (id)_evaluateImageGeometry:(id *)a3
{
  void *v5;
  NUImageGeometry *v6;
  NUImageGeometry *v7;
  NUImageGeometry *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  uint64_t v13;
  uint64_t v14;
  NUImageGeometry *v15;
  __int128 v17;
  objc_super v18;
  _OWORD v19[2];
  CGRect v20;

  v18.receiver = self;
  v18.super_class = (Class)NURAWGeometryResetNode;
  -[NUFilterNode _evaluateImageGeometry:](&v18, sel__evaluateImageGeometry_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NURenderNode outputImage:](self, "outputImage:", a3);
    v6 = (NUImageGeometry *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = [NUImageGeometry alloc];
      -[NUImageGeometry extent](v7, "extent");
      v20.origin.x = v9;
      v20.origin.y = v10;
      v20.size.width = v11;
      v20.size.height = v12;
      NU::RectT<long>::RectT(v19, &v20, 1);
      v13 = objc_msgSend(v5, "renderScale", v19[0], v19[1]);
      v6 = -[NUImageGeometry initWithExtent:renderScale:orientation:](v8, "initWithExtent:renderScale:orientation:", &v17, v13, v14, objc_msgSend(v5, "orientation"));
    }
    v15 = v6;

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NURAWGeometryResetNode;
  -[NURawFilterNode resolvedNodeWithCachedInputs:settings:pipelineState:error:](&v7, sel_resolvedNodeWithCachedInputs_settings_pipelineState_error_, a3, a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
