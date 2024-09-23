@implementation _NUVisionForegroundIsolationSegmentationResult

- (_NUVisionForegroundIsolationSegmentationResult)initWithMaskBuffer:(id)a3
{
  id v5;
  _NUVisionForegroundIsolationSegmentationResult *v6;
  _NUVisionForegroundIsolationSegmentationResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_NUVisionForegroundIsolationSegmentationResult;
  v6 = -[_NUVisionForegroundIsolationSegmentationResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_maskBuffer, a3);

  return v7;
}

- (NUImageBuffer)maskBuffer
{
  return self->_maskBuffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskBuffer, 0);
}

@end
