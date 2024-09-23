@implementation MFQuickReplyExpandButton

+ (id)buttonWithType:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___MFQuickReplyExpandButton;
  objc_msgSendSuper2(&v8, sel_buttonWithType_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "mf_symbolConfigurationForView:", 24);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPreferredSymbolConfiguration:forImageInState:", v4, 0);

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.up.left.square"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:forState:", v5, 0);

  objc_msgSend(v3, "setAccessibilityIdentifier:", *MEMORY[0x1E0D46C00]);
  objc_msgSend(v3, "setShowsLargeContentViewer:", 1);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v3);
  objc_msgSend(v3, "addInteraction:", v6);

  return v3;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  -[MFQuickReplyExpandButton _quickReplyExpandButtonPointerStyleInView:](self, "_quickReplyExpandButtonPointerStyleInView:", self, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_quickReplyExpandButtonPointerStyleInView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0DC3B00];
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", self);
  objc_msgSend(v5, "effectWithPreview:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "frame");
  objc_msgSend(MEMORY[0x1E0DC3B30], "shapeWithRoundedRect:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
