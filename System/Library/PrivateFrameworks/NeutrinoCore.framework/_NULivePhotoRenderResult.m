@implementation _NULivePhotoRenderResult

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_photo);
  v3.receiver = self;
  v3.super_class = (Class)_NULivePhotoRenderResult;
  -[_NULivePhotoRenderResult dealloc](&v3, sel_dealloc);
}

- (AVAsset)video
{
  return (AVAsset *)objc_getProperty(self, a2, 16, 1);
}

- (void)setVideo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (AVVideoComposition)videoComposition
{
  return (AVVideoComposition *)objc_getProperty(self, a2, 24, 1);
}

- (void)setVideoComposition:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (CGImage)photo
{
  return (CGImage *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPhoto:(CGImage *)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoTime
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_photoTime, 24, 1, 0);
  return result;
}

- (void)setPhotoTime:(id *)a3
{
  objc_copyStruct(&self->_photoTime, a3, 24, 1, 0);
}

- (NUImageGeometry)videoGeometry
{
  return (NUImageGeometry *)objc_getProperty(self, a2, 40, 1);
}

- (void)setVideoGeometry:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoGeometry, 0);
  objc_storeStrong((id *)&self->_videoComposition, 0);
  objc_storeStrong((id *)&self->_video, 0);
}

@end
