@implementation CEKApertureButton(Camera)

- (id)imageForAccessibilityHUD
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)MEMORY[0x1E0DC3870];
  CAMCameraUIFrameworkBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:", CFSTR("CAMApertureButton-AXHUD"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithRenderingMode:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
