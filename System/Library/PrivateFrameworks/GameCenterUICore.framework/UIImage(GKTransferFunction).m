@implementation UIImage(GKTransferFunction)

+ (id)_gkImageWithRawData:()GKTransferFunction size:scale:rowBytes:bitmapInfo:
{
  id v13;
  CGDataProviderRef v14;
  CGDataProvider *v15;
  CGColorSpace *DeviceRGB;
  CGImageRef v17;
  void *v18;
  id v19;
  NSObject *v20;

  v13 = objc_retainAutorelease(a6);
  v14 = CGDataProviderCreateWithData(v13, (const void *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"), (CGDataProviderReleaseDataCallback)GKImageContextCGDataProviderReleaseDataCallback);
  if (v14)
  {
    v15 = v14;
    CFRetain(v13);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v17 = CGImageCreate((unint64_t)(a1 * a3), (unint64_t)(a2 * a3), 8uLL, 0x20uLL, a7, DeviceRGB, a8, v15, 0, 1, kCGRenderingIntentDefault);
    objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:scale:orientation:", v17, 0, a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(DeviceRGB);
    CFRelease(v17);
    CFRelease(v15);
  }
  else
  {
    if (!*MEMORY[0x24BE3A308])
      v19 = (id)GKOSLoggers();
    v20 = *MEMORY[0x24BE3A300];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A300], OS_LOG_TYPE_ERROR))
      +[UIImage(GKTransferFunction) _gkImageWithRawData:size:scale:rowBytes:bitmapInfo:].cold.1(v20);
    v18 = 0;
  }

  return v18;
}

- (void)_gkReadAtSize:()GKTransferFunction ARGBHostEndianBytes:
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  double v13;
  double v14;

  v8 = a5;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __65__UIImage_GKTransferFunction___gkReadAtSize_ARGBHostEndianBytes___block_invoke;
  v11[3] = &unk_24DC279D0;
  v13 = a2;
  v14 = a3;
  v11[4] = a1;
  v12 = v8;
  v9 = v8;
  v10 = +[GKImageContext imageDrawnWithSize:scale:options:usingBlock:](GKImageContext, "imageDrawnWithSize:scale:options:usingBlock:", 0, v11, a2, a3, 1.0);

}

+ (void)_gkImageWithRawData:()GKTransferFunction size:scale:rowBytes:bitmapInfo:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_219F71000, log, OS_LOG_TYPE_ERROR, "can't allocate data provider", v1, 2u);
}

@end
