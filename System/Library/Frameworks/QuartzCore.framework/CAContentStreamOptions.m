@implementation CAContentStreamOptions

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    objc_msgSend(v4, "setTargetDisplayId:", -[CAContentStreamOptions targetDisplayId](self, "targetDisplayId"));
    objc_msgSend(v4, "setPixelFormat:", -[CAContentStreamOptions pixelFormat](self, "pixelFormat"));
    -[CAContentStreamOptions frameSize](self, "frameSize");
    objc_msgSend(v4, "setFrameSize:");
    objc_msgSend(v4, "setQueueDepth:", -[CAContentStreamOptions queueDepth](self, "queueDepth"));
    -[CAContentStreamOptions minimumFrameTime](self, "minimumFrameTime");
    objc_msgSend(v4, "setMinimumFrameTime:");
    objc_msgSend(v4, "setAlwaysScaleToFit:", -[CAContentStreamOptions alwaysScaleToFit](self, "alwaysScaleToFit"));
    -[CAContentStreamOptions sourceRect](self, "sourceRect");
    objc_msgSend(v4, "setSourceRect:");
    -[CAContentStreamOptions destinationRect](self, "destinationRect");
    objc_msgSend(v4, "setDestinationRect:");
    objc_msgSend(v4, "setPreserveAspectRatioKey:", -[CAContentStreamOptions preserveAspectRatioKey](self, "preserveAspectRatioKey"));
    objc_msgSend(v4, "setColorSpaceKey:", -[CAContentStreamOptions colorSpaceKey](self, "colorSpaceKey"));
    objc_msgSend(v4, "setBackgroundColorKey:", -[CAContentStreamOptions backgroundColorKey](self, "backgroundColorKey"));
    objc_msgSend(v4, "setShowCursorKey:", -[CAContentStreamOptions showCursorKey](self, "showCursorKey"));
    objc_msgSend(v4, "setYCbCrMatrix:", -[CAContentStreamOptions YCbCrMatrix](self, "YCbCrMatrix"));
    objc_msgSend(v4, "setChromaLocation:", -[CAContentStreamOptions ChromaLocation](self, "ChromaLocation"));
  }
  return v4;
}

- (unsigned)targetDisplayId
{
  return self->_targetDisplayId;
}

- (void)setTargetDisplayId:(unsigned int)a3
{
  self->_targetDisplayId = a3;
}

- (unsigned)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(unsigned int)a3
{
  self->_pixelFormat = a3;
}

- (CGSize)frameSize
{
  double v2;
  double v3;
  _QWORD dest[3];
  CGSize result;

  dest[2] = *MEMORY[0x1E0C80C00];
  objc_copyStruct(dest, &self->_frameSize, 16, 1, 0);
  v2 = *(double *)dest;
  v3 = *(double *)&dest[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setFrameSize:(CGSize)a3
{
  CGSize src;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  src = a3;
  objc_copyStruct(&self->_frameSize, &src, 16, 1, 0);
}

- (unsigned)queueDepth
{
  return self->_queueDepth;
}

- (void)setQueueDepth:(unsigned int)a3
{
  self->_queueDepth = a3;
}

- (double)minimumFrameTime
{
  return self->_minimumFrameTime;
}

- (void)setMinimumFrameTime:(double)a3
{
  self->_minimumFrameTime = a3;
}

- (BOOL)alwaysScaleToFit
{
  return self->_alwaysScaleToFit;
}

- (void)setAlwaysScaleToFit:(BOOL)a3
{
  self->_alwaysScaleToFit = a3;
}

- (CGRect)sourceRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD dest[5];
  CGRect result;

  dest[4] = *MEMORY[0x1E0C80C00];
  objc_copyStruct(dest, &self->_sourceRect, 32, 1, 0);
  v2 = *(double *)dest;
  v3 = *(double *)&dest[1];
  v4 = *(double *)&dest[2];
  v5 = *(double *)&dest[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  CGRect src;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  src = a3;
  objc_copyStruct(&self->_sourceRect, &src, 32, 1, 0);
}

- (CGRect)destinationRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD dest[5];
  CGRect result;

  dest[4] = *MEMORY[0x1E0C80C00];
  objc_copyStruct(dest, &self->_destinationRect, 32, 1, 0);
  v2 = *(double *)dest;
  v3 = *(double *)&dest[1];
  v4 = *(double *)&dest[2];
  v5 = *(double *)&dest[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setDestinationRect:(CGRect)a3
{
  CGRect src;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  src = a3;
  objc_copyStruct(&self->_destinationRect, &src, 32, 1, 0);
}

- (BOOL)preserveAspectRatioKey
{
  return self->_preserveAspectRatioKey;
}

- (void)setPreserveAspectRatioKey:(BOOL)a3
{
  self->_preserveAspectRatioKey = a3;
}

- (CGColorSpace)colorSpaceKey
{
  return self->_colorSpaceKey;
}

- (void)setColorSpaceKey:(CGColorSpace *)a3
{
  self->_colorSpaceKey = a3;
}

- (CGColor)backgroundColorKey
{
  return self->_backgroundColorKey;
}

- (void)setBackgroundColorKey:(CGColor *)a3
{
  self->_backgroundColorKey = a3;
}

- (BOOL)showCursorKey
{
  return self->_showCursorKey;
}

- (void)setShowCursorKey:(BOOL)a3
{
  self->_showCursorKey = a3;
}

- (unsigned)YCbCrMatrix
{
  return self->_YCbCrMatrix;
}

- (void)setYCbCrMatrix:(unsigned __int8)a3
{
  self->_YCbCrMatrix = a3;
}

- (unsigned)ChromaLocation
{
  return self->_ChromaLocation;
}

- (void)setChromaLocation:(unsigned __int8)a3
{
  self->_ChromaLocation = a3;
}

@end
