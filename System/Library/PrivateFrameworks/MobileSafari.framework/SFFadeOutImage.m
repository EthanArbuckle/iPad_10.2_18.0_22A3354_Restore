@implementation SFFadeOutImage

void __SFFadeOutImage_block_invoke_2(uint64_t a1)
{
  CGColorSpace *DeviceGray;
  CGGradient *v3;
  double v4;
  double v5;
  CGContext *CurrentContext;
  __int128 v7;
  CGFloat components[2];
  __int128 v9;
  uint64_t v10;
  CGPoint v11;
  CGPoint v12;

  v10 = *MEMORY[0x1E0C80C00];
  DeviceGray = CGColorSpaceCreateDeviceGray();
  *(_OWORD *)components = xmmword_18BAD4E20;
  v9 = unk_18BAD4E30;
  v7 = xmmword_18BAD4E00;
  v3 = CGGradientCreateWithColorComponents(DeviceGray, components, (const CGFloat *)&v7, 2uLL);
  if (*(_BYTE *)(a1 + 40))
    v4 = 0.0;
  else
    v4 = *(double *)(a1 + 32) + 1.0;
  if (*(_BYTE *)(a1 + 40))
    v5 = *(double *)(a1 + 32);
  else
    v5 = 1.0;
  CurrentContext = UIGraphicsGetCurrentContext();
  v11.y = 0.0;
  v12.y = 0.0;
  v11.x = v4;
  v12.x = v5;
  CGContextDrawLinearGradient(CurrentContext, v3, v11, v12, 2u);
  CGColorSpaceRelease(DeviceGray);
  CGGradientRelease(v3);
}

void __SFFadeOutImage_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SFFadeOutImage::fadeOutImages;
  SFFadeOutImage::fadeOutImages = v0;

}

@end
