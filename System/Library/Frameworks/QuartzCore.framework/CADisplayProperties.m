@implementation CADisplayProperties

- (CADisplayProperties)init
{
  CADisplayProperties *result;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)CADisplayProperties;
  result = -[CADisplayProperties init](&v8, sel_init);
  if (result)
  {
    result->_connectionSeed = 0;
    result->_currentMode = 0;
    result->_overscanAdjustment = 0;
    result->_dmrrEnabled = 0;
    __asm { FMOV            V0.2D, #1.0 }
    result->_logicalScale = _Q0;
    result->_pointScale = 1;
    result->_forceFixedRateLinks = 0;
    result->_mask = 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)CADisplayProperties;
  -[CADisplayProperties dealloc](&v3, sel_dealloc);
}

- (unsigned)updateMask
{
  return self->_mask;
}

- (void)setUpdateMask:(unsigned int)a3
{
  self->_mask = a3;
}

- (void)clearUpdateMask
{
  self->_mask = 0;
}

- (BOOL)needsUpdateForField:(unsigned int)a3
{
  return (self->_mask & a3) != 0;
}

- (CADisplayMode)currentMode
{
  return self->_currentMode;
}

- (void)setCurrentMode:(id)a3
{

  self->_currentMode = (CADisplayMode *)a3;
  self->_mask |= 1u;
}

- (NSString)overscanAdjustment
{
  return self->_overscanAdjustment;
}

- (void)setOverscanAdjustment:(id)a3
{

  self->_overscanAdjustment = (NSString *)objc_msgSend(a3, "copy");
  self->_mask |= 2u;
}

- (BOOL)dmrrEnabled
{
  return self->_dmrrEnabled;
}

- (void)setDmrrEnabled:(BOOL)a3
{
  self->_dmrrEnabled = a3;
  self->_mask |= 4u;
}

- (BOOL)forceFixedRateLinks
{
  return self->_forceFixedRateLinks;
}

- (void)setForceFixedRateLinks:(BOOL)a3
{
  self->_forceFixedRateLinks = a3;
  self->_mask |= 0x80u;
}

- (unsigned)connectionSeed
{
  return self->_connectionSeed;
}

- (void)setConnectionSeed:(unsigned int)a3
{
  self->_connectionSeed = a3;
  self->_mask |= 8u;
}

- (CGSize)logicalScale
{
  double width;
  double height;
  CGSize result;

  width = self->_logicalScale.width;
  height = self->_logicalScale.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLogicalScale:(CGSize)a3
{
  self->_logicalScale = a3;
  self->_mask |= 0x10u;
}

- (unint64_t)pointScale
{
  return self->_pointScale;
}

- (void)setPointScale:(unint64_t)a3
{
  self->_pointScale = a3;
  self->_mask |= 0x20u;
}

@end
