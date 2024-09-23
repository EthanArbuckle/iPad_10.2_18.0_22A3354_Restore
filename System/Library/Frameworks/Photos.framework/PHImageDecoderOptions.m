@implementation PHImageDecoderOptions

- (void)setWaitUntilComplete:(BOOL)a3
{
  self->_waitUntilComplete = a3;
}

- (void)setTargetSize:(CGSize)a3
{
  self->_targetSize = a3;
}

- (void)setTargetHDRHeadroom:(float)a3
{
  self->_targetHDRHeadroom = a3;
}

- (void)setShouldLoadGainMap:(BOOL)a3
{
  self->_shouldLoadGainMap = a3;
}

- (void)setResizeMode:(int64_t)a3
{
  self->_resizeMode = a3;
}

- (void)setOptimizeForDrawing:(BOOL)a3
{
  self->_optimizeForDrawing = a3;
}

- (void)setNormalizedCropRect:(CGRect)a3
{
  self->_normalizedCropRect = a3;
}

- (void)setHighPriority:(BOOL)a3
{
  self->_highPriority = a3;
}

- (void)setHdrGain:(float)a3
{
  self->_hdrGain = a3;
}

- (void)setDecodeAsHDR:(BOOL)a3
{
  self->_decodeAsHDR = a3;
}

- (void)setContentMode:(int64_t)a3
{
  self->_contentMode = a3;
}

- (void)setAllowFallbackDecoder:(BOOL)a3
{
  self->_allowFallbackDecoder = a3;
}

- (PHImageDecoderOptions)init
{
  PHImageDecoderOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHImageDecoderOptions;
  result = -[PHImageDecoderOptions init](&v3, sel_init);
  if (result)
  {
    result->_allowFallbackDecoder = 1;
    result->_targetHDRHeadroom = 1.0;
  }
  return result;
}

- (BOOL)waitUntilComplete
{
  return self->_waitUntilComplete;
}

- (BOOL)useLowMemoryMode
{
  return self->_useLowMemoryMode;
}

- (BOOL)shouldLoadGainMap
{
  return self->_shouldLoadGainMap;
}

- (int64_t)resizeMode
{
  return self->_resizeMode;
}

- (BOOL)preferSWDecode
{
  return self->_preferSWDecode;
}

- (BOOL)optimizeForDrawing
{
  return self->_optimizeForDrawing;
}

- (int64_t)maximumLongSideLength
{
  double width;

  if (!self->_resizeMode)
    return 0;
  width = self->_targetSize.width;
  if (width <= self->_targetSize.height)
    return (uint64_t)self->_targetSize.height;
  return (uint64_t)width;
}

- (BOOL)highPriority
{
  return self->_highPriority;
}

- (BOOL)allowFallbackDecoder
{
  return self->_allowFallbackDecoder;
}

- (BOOL)shouldCrop
{
  CGRect v4;

  if (!CGRectEqualToRect(self->_normalizedCropRect, *MEMORY[0x1E0C9D648]))
  {
    v4.origin.x = 0.0;
    v4.origin.y = 0.0;
    v4.size.width = 1.0;
    v4.size.height = 1.0;
    if (!CGRectEqualToRect(self->_normalizedCropRect, v4))
      return 1;
  }
  if (self->_resizeMode == 2)
    return self->_contentMode == 1;
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  CGPoint origin;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_BYTE *)result + 8) = self->_shouldLoadGainMap;
  *((_QWORD *)result + 4) = self->_resizeMode;
  *((_BYTE *)result + 9) = self->_optimizeForDrawing;
  *((_BYTE *)result + 10) = self->_highPriority;
  *((_BYTE *)result + 11) = self->_waitUntilComplete;
  origin = self->_normalizedCropRect.origin;
  *(CGSize *)((char *)result + 72) = self->_normalizedCropRect.size;
  *(CGPoint *)((char *)result + 56) = origin;
  *((_QWORD *)result + 3) = self->_contentMode;
  *(CGSize *)((char *)result + 40) = self->_targetSize;
  *((_BYTE *)result + 12) = self->_allowFallbackDecoder;
  *((_BYTE *)result + 13) = self->_preferSWDecode;
  *((_BYTE *)result + 14) = self->_useLowMemoryMode;
  *((_BYTE *)result + 15) = self->_decodeAsHDR;
  *((_DWORD *)result + 4) = LODWORD(self->_targetHDRHeadroom);
  return result;
}

- (CGSize)targetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_targetSize.width;
  height = self->_targetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (CGRect)normalizedCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_normalizedCropRect.origin.x;
  y = self->_normalizedCropRect.origin.y;
  width = self->_normalizedCropRect.size.width;
  height = self->_normalizedCropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPreferSWDecode:(BOOL)a3
{
  self->_preferSWDecode = a3;
}

- (void)setUseLowMemoryMode:(BOOL)a3
{
  self->_useLowMemoryMode = a3;
}

- (BOOL)decodeAsHDR
{
  return self->_decodeAsHDR;
}

- (float)targetHDRHeadroom
{
  return self->_targetHDRHeadroom;
}

- (float)hdrGain
{
  return self->_hdrGain;
}

@end
