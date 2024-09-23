@implementation AVImage

+ (id)imageWithConfiguration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (objc_msgSend(v3, "imageContainedInBundle"))
  {
    objc_msgSend(v3, "imageName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    AVBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVImage imageNamed:inBundle:compatibleWithTraitCollection:](AVImage, "imageNamed:inBundle:compatibleWithTraitCollection:", v4, v5, 0);
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(v3, "font");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "configurationWithFont:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "imageName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVImage systemImageNamed:withConfiguration:](AVImage, "systemImageNamed:withConfiguration:", v5, v4);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)_suppressesAccessibilityHairlineThickening
{
  return 1;
}

@end
