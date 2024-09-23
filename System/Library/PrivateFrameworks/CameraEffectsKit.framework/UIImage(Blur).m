@implementation UIImage(Blur)

- (id)bluredImageWithFlippedXAxis:()Blur
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBF660], "imageWithCGImage:", objc_msgSend(objc_retainAutorelease(a1), "CGImage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bluredImageWithFlippedXAxis:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
