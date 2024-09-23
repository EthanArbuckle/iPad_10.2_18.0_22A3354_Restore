@implementation BWStillImageSampleBufferSinkNodeAnalyticsConfiguration

- (void)setPixelFormat:(unsigned int)a3
{
  self->_pixelFormat = a3;
}

- (void)setIsTimeLapse:(BOOL)a3
{
  self->_isTimeLapse = a3;
}

- (void)setIsSemanticStyleRenderingSupported:(BOOL)a3
{
  self->_isSemanticStyleRenderingSupported = a3;
}

- (void)setIsPhotoFormat:(BOOL)a3
{
  self->_isPhotoFormat = a3;
}

- (void)setIsHighQualityPhotoWithVideoFormatSupported:(BOOL)a3
{
  self->_isHighQualityPhotoWithVideoFormatSupported = a3;
}

- (void)setFormatMaxFrameRate:(float)a3
{
  self->_formatMaxFrameRate = a3;
}

- (void)setFormatDimensionWidth:(int)a3
{
  self->_formatDimensionWidth = a3;
}

- (void)setFormatDimensionHeight:(int)a3
{
  self->_formatDimensionHeight = a3;
}

- (void)setFastCapturePrioritizationEnabled:(BOOL)a3
{
  self->_fastCapturePrioritizationEnabled = a3;
}

- (void)setBinned:(BOOL)a3
{
  self->_binned = a3;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)BWStillImageSampleBufferSinkNodeAnalyticsConfiguration;
  -[BWStillImageSampleBufferSinkNodeAnalyticsConfiguration dealloc](&v2, sel_dealloc);
}

- (int)formatDimensionWidth
{
  return self->_formatDimensionWidth;
}

- (int)formatDimensionHeight
{
  return self->_formatDimensionHeight;
}

- (float)formatMaxFrameRate
{
  return self->_formatMaxFrameRate;
}

- (BOOL)isHighQualityPhotoWithVideoFormatSupported
{
  return self->_isHighQualityPhotoWithVideoFormatSupported;
}

- (BOOL)isPhotoFormat
{
  return self->_isPhotoFormat;
}

- (BOOL)isTimeLapse
{
  return self->_isTimeLapse;
}

- (unsigned)pixelFormat
{
  return self->_pixelFormat;
}

- (BOOL)binned
{
  return self->_binned;
}

- (BOOL)isSemanticStyleRenderingSupported
{
  return self->_isSemanticStyleRenderingSupported;
}

- (BOOL)fastCapturePrioritizationEnabled
{
  return self->_fastCapturePrioritizationEnabled;
}

- (BOOL)isSmartStyleRenderingSupported
{
  return self->_isSmartStyleRenderingSupported;
}

- (void)setIsSmartStyleRenderingSupported:(BOOL)a3
{
  self->_isSmartStyleRenderingSupported = a3;
}

@end
