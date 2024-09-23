@implementation CALayer(CoverSheet)

+ (id)ringLayerWithBlendMode:()CoverSheet cornerRadius:borderWidth:
{
  void *v7;
  id v8;
  void *v9;
  double v10;
  void *v11;

  v7 = (void *)MEMORY[0x1E0CD27A8];
  v8 = a5;
  objc_msgSend(v7, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = 0;
  objc_msgSend(v9, "setOpacity:", v10);
  objc_msgSend(v9, "setCornerRadius:", a1);
  objc_msgSend(v9, "setBorderWidth:", a2);
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setCompositingFilter:", v11);
  return v9;
}

@end
