@implementation UIImage(CKTransparencyTrimmer)

- (id)__ck_imageWithTrimmedTransparency
{
  void *v2;
  CKImageTransparencyTrimmer *v3;
  void *v4;

  v2 = (void *)MEMORY[0x193FF4740]();
  v3 = objc_alloc_init(CKImageTransparencyTrimmer);
  -[CKImageTransparencyTrimmer trimTransparencyFromImage:](v3, "trimTransparencyFromImage:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v2);
  return v4;
}

@end
