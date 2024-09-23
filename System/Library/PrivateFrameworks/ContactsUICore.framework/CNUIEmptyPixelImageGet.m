@implementation CNUIEmptyPixelImageGet

void __CNUIEmptyPixelImageGet_block_invoke()
{
  CGColorSpace *DeviceRGB;
  CGColorSpace *v1;
  CGContext *v2;

  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  if (DeviceRGB)
  {
    v1 = DeviceRGB;
    v2 = CNUIBitmapContextCreate(1, 1, DeviceRGB);
    CGColorSpaceRelease(v1);
    if (v2)
    {
      CNUIEmptyPixelImageGet_emptyPixelImage = (uint64_t)CGBitmapContextCreateImage(v2);
      CGContextRelease(v2);
    }
  }
}

@end
