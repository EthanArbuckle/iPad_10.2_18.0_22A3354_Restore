@implementation HUWaveformSlice

- (void)dealloc
{
  objc_super v3;

  -[CALayer removeFromSuperlayer](self->_waveformlayer, "removeFromSuperlayer");
  v3.receiver = self;
  v3.super_class = (Class)HUWaveformSlice;
  -[HUWaveformSlice dealloc](&v3, sel_dealloc);
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
}

- (CALayer)waveformlayer
{
  return self->_waveformlayer;
}

- (void)setWaveformlayer:(id)a3
{
  objc_storeStrong((id *)&self->_waveformlayer, a3);
}

- (CGRect)layerFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_layerFrame.origin.x;
  y = self->_layerFrame.origin.y;
  width = self->_layerFrame.size.width;
  height = self->_layerFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setLayerFrame:(CGRect)a3
{
  self->_layerFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waveformlayer, 0);
}

@end
