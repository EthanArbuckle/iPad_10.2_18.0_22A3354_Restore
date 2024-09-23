@implementation FigCapturePixelFormatWithLeastAverageBandwidth

uint64_t __FigCapturePixelFormatWithLeastAverageBandwidth_block_invoke(uint64_t a1, void *a2, void *a3)
{
  float AverageBandwidthInBytesPerPixel;
  float v5;

  AverageBandwidthInBytesPerPixel = FigCapturePixelFormatGetAverageBandwidthInBytesPerPixel(objc_msgSend(a2, "intValue"));
  v5 = FigCapturePixelFormatGetAverageBandwidthInBytesPerPixel(objc_msgSend(a3, "intValue"));
  if (AverageBandwidthInBytesPerPixel < v5)
    return -1;
  else
    return v5 < AverageBandwidthInBytesPerPixel;
}

@end
