@implementation CAContentStreamFrame

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (unint64_t)displayTime
{
  return self->_displayTime;
}

- (void)setDisplayTime:(unint64_t)a3
{
  self->_displayTime = a3;
}

- (__IOSurface)surface
{
  return self->_surface;
}

- (void)setSurface:(__IOSurface *)a3
{
  self->_surface = a3;
}

- (unsigned)surfaceId
{
  return self->_surfaceId;
}

- (void)setSurfaceId:(unsigned int)a3
{
  self->_surfaceId = a3;
}

- (unint64_t)dropCount
{
  return self->_dropCount;
}

- (void)setDropCount:(unint64_t)a3
{
  self->_dropCount = a3;
}

- (double)displayResolution
{
  return self->_displayResolution;
}

- (void)setDisplayResolution:(double)a3
{
  self->_displayResolution = a3;
}

- (double)contentScaleX
{
  return self->_contentScaleX;
}

- (void)setContentScaleX:(double)a3
{
  self->_contentScaleX = a3;
}

- (double)contentScaleY
{
  return self->_contentScaleY;
}

- (void)setContentScaleY:(double)a3
{
  self->_contentScaleY = a3;
}

- (CGRect)contentRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD dest[5];
  CGRect result;

  dest[4] = *MEMORY[0x1E0C80C00];
  objc_copyStruct(dest, &self->_contentRect, 32, 1, 0);
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

- (void)setContentRect:(CGRect)a3
{
  CGRect src;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  src = a3;
  objc_copyStruct(&self->_contentRect, &src, 32, 1, 0);
}

- (BOOL)fastPath
{
  return self->_fastPath;
}

- (void)setFastPath:(BOOL)a3
{
  self->_fastPath = a3;
}

@end
