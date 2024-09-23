@implementation UIImage(GKAdditions_UIKitShim_Parity)

- (CGImage)_gkScale
{
  CGImage *result;

  result = (CGImage *)objc_msgSend(a1, "_gkCGImage");
  if (result)
  {
    CGImageGetWidth(result);
    return (CGImage *)objc_msgSend(a1, "size");
  }
  return result;
}

- (uint64_t)_gkCGImage
{
  return objc_msgSend(objc_retainAutorelease(a1), "CGImage");
}

- (uint64_t)_gkImageOrientation
{
  return 0;
}

@end
