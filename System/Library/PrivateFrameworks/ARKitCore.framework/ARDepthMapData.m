@implementation ARDepthMapData

- (CGImage)depthMap
{
  return self->_depthMap;
}

- (void)setDepthMap:(CGImage *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
