@implementation DYEAGLPlaybackEngine

- (id)newFunctionPlayer
{
  DYEAGLFunctionPlayer *v3;
  void *v4;
  DYEAGLFunctionPlayer *v5;

  v3 = [DYEAGLFunctionPlayer alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLPlaybackEngine captureStore](self, "captureStore"));
  v5 = -[DYEAGLFunctionPlayer initWithCaptureStore:](v3, "initWithCaptureStore:", v4);

  -[DYEAGLFunctionPlayer setLayerManager:](v5, "setLayerManager:", self);
  return v5;
}

- (id)newLayer
{
  return (id)objc_opt_new(CAEAGLLayer, a2);
}

- (BOOL)layerHasSameProperties:(id)a3 layer:(id)a4
{
  id v5;
  void *v6;
  unsigned __int8 v7;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "drawableProperties"));
  v7 = objc_msgSend(v6, "isEqualToDictionary:", v5);

  return v7;
}

- (void)setProperties:(id)a3 forLayer:(id)a4
{
  objc_msgSend(a4, "setDrawableProperties:", a3);
}

@end
