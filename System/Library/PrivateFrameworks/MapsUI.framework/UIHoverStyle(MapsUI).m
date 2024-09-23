@implementation UIHoverStyle(MapsUI)

+ (id)_mapsui_textButtonHoverStyle
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC3C68], "rectShapeWithCornerRadius:cornerCurve:", 2, 4.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "shapeByApplyingInsets:", 0.0, -4.0, 0.0, -4.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3868], "styleWithShape:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
