@implementation CIImage(NUImageUtilities)

+ (id)imageWithNUImageBuffer:()NUImageUtilities
{
  id v3;
  void *v4;

  v3 = a3;
  objc_getAssociatedObject(v3, &NUImageUtilitiesCIImageKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:", objc_msgSend(v3, "CVPixelBuffer"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(v3, &NUImageUtilitiesCIImageKey, v4, (void *)0x301);
  }

  return v4;
}

@end
