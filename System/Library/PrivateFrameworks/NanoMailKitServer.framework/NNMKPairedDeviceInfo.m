@implementation NNMKPairedDeviceInfo

+ (id)pairedDeviceInfoWithScreenWidth:(double)a3 screenScale:(double)a4
{
  NNMKPairedDeviceInfo *v6;

  v6 = objc_alloc_init(NNMKPairedDeviceInfo);
  -[NNMKPairedDeviceInfo setScreenWidth:](v6, "setScreenWidth:", a3);
  -[NNMKPairedDeviceInfo setScreenScale:](v6, "setScreenScale:", a4);
  return v6;
}

- (double)screenWidth
{
  return self->_screenWidth;
}

- (void)setScreenWidth:(double)a3
{
  self->_screenWidth = a3;
}

- (double)screenScale
{
  return self->_screenScale;
}

- (void)setScreenScale:(double)a3
{
  self->_screenScale = a3;
}

@end
