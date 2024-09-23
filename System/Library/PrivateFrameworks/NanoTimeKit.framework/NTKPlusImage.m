@implementation NTKPlusImage

void __NTKPlusImage_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRoundingBehavior:", 4);
  objc_msgSend(v2, "scaledValue:", 55.0);
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurationWithHierarchicalColor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "configurationByApplyingConfiguration:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("plus.circle.fill"), v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)NTKPlusImage::_plusImage;
  NTKPlusImage::_plusImage = v8;

}

@end
