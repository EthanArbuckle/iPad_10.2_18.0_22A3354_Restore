@implementation NUGeometryJob

- (id)scalePolicy
{
  void *v2;
  void *v3;

  -[NUGeometryJob geometryRequest](self, "geometryRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scalePolicy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)wantsOutputGeometry
{
  return 1;
}

- (BOOL)wantsRenderStage
{
  return 0;
}

- (BOOL)wantsCompleteStage
{
  return 0;
}

- (id)result
{
  _NUGeometryResult *v3;
  void *v4;

  v3 = objc_alloc_init(_NUGeometryResult);
  -[NURenderJob outputGeometry](self, "outputGeometry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUGeometryResult setGeometry:](v3, "setGeometry:", v4);

  return v3;
}

@end
