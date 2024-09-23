@implementation GTReplayShaderDebugFragment

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayShaderDebugFragment)initWithCoder:(id)a3
{
  id v4;
  GTReplayShaderDebugFragment *v5;
  GTReplayShaderDebugFragment *v6;
  unint64_t v7;
  unint64_t v8;
  GTReplayShaderDebugFragment *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GTReplayShaderDebugFragment;
  v5 = -[GTReplayShaderDebugRequest initWithCoder:](&v11, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    v5->_minPixelPosition.x = GTPoint2DDecode(v4, CFSTR("MinPixelPosition"));
    v6->_minPixelPosition.y = v7;
    v6->_maxPixelPosition.x = GTPoint2DDecode(v4, CFSTR("MaxPixelPosition"));
    v6->_maxPixelPosition.y = v8;
    v6->_minSampleID = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("MinSampleID"));
    v6->_maxSampleID = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("MaxSampleID"));
    v6->_renderTargetArrayIndex = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("RenderTargetArrayIndex"));
    v9 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GTReplayShaderDebugFragment;
  v4 = a3;
  -[GTReplayShaderDebugRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  GTPoint2DEncode(v4, self->_minPixelPosition.x, self->_minPixelPosition.y, CFSTR("MinPixelPosition"));
  GTPoint2DEncode(v4, self->_maxPixelPosition.x, self->_maxPixelPosition.y, CFSTR("MaxPixelPosition"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_minSampleID, CFSTR("MinSampleID"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInt32:forKey:", self->_maxSampleID, CFSTR("MaxSampleID"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_renderTargetArrayIndex, CFSTR("RenderTargetArrayIndex"));

}

- (GTPoint2D)minPixelPosition
{
  GTPoint2D *p_minPixelPosition;
  unint64_t x;
  unint64_t y;
  GTPoint2D result;

  p_minPixelPosition = &self->_minPixelPosition;
  x = self->_minPixelPosition.x;
  y = p_minPixelPosition->y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setMinPixelPosition:(GTPoint2D)a3
{
  self->_minPixelPosition = a3;
}

- (GTPoint2D)maxPixelPosition
{
  GTPoint2D *p_maxPixelPosition;
  unint64_t x;
  unint64_t y;
  GTPoint2D result;

  p_maxPixelPosition = &self->_maxPixelPosition;
  x = self->_maxPixelPosition.x;
  y = p_maxPixelPosition->y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setMaxPixelPosition:(GTPoint2D)a3
{
  self->_maxPixelPosition = a3;
}

- (unsigned)minSampleID
{
  return self->_minSampleID;
}

- (void)setMinSampleID:(unsigned int)a3
{
  self->_minSampleID = a3;
}

- (unsigned)maxSampleID
{
  return self->_maxSampleID;
}

- (void)setMaxSampleID:(unsigned int)a3
{
  self->_maxSampleID = a3;
}

- (unsigned)renderTargetArrayIndex
{
  return self->_renderTargetArrayIndex;
}

- (void)setRenderTargetArrayIndex:(unsigned int)a3
{
  self->_renderTargetArrayIndex = a3;
}

@end
