@implementation UIButton(RevealActionsButton)

+ (id)mf_revealActionsButtonWithAccessibilityIdentifier:()RevealActionsButton
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0DC3518];
  v4 = a3;
  objc_msgSend(v3, "buttonWithType:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "mf_symbolConfigurationForView:", 16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreferredSymbolConfiguration:forImageInState:", v6, 0);

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", *MEMORY[0x1E0CC6838]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:forState:", v7, 0);

  objc_msgSend(v5, "setAccessibilityIdentifier:", v4);
  objc_msgSend(v5, "setShowsLargeContentViewer:", 1);
  return v5;
}

- (id)mf_revealActionButtonPointerStyleInView:()RevealActionsButton
{
  void *v4;
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CGRect v13;
  CGRect v14;

  v4 = (void *)MEMORY[0x1E0DC3B00];
  v5 = (objc_class *)MEMORY[0x1E0DC3D90];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithView:", a1);
  objc_msgSend(v4, "effectWithPreview:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "imageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  UIRectGetCenter();
  objc_msgSend(v6, "convertPoint:fromView:", a1);

  objc_msgSend(v6, "mui_currentScreenScale");
  UIRectCenteredAboutPointScale();
  v14 = CGRectOffset(v13, 0.0, 1.0);
  objc_msgSend(MEMORY[0x1E0DC3B30], "shapeWithRoundedRect:", v14.origin.x, v14.origin.y, v14.size.width, v14.size.height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
