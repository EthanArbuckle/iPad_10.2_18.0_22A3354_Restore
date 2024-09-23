@implementation MFComposeSendAccessoryButton

+ (id)buttonWithType:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___MFComposeSendAccessoryButton;
  objc_msgSendSuper2(&v13, sel_buttonWithType_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.up.circle.fill"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "mf_symbolConfigurationForView:", 14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreferredSymbolConfigurationForImage:", v6);

  objc_msgSend(v5, "setImage:", v4);
  objc_msgSend(v5, "setContentInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "background");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v7);

  objc_msgSend(v3, "setConfiguration:", v5);
  objc_msgSend(v3, "setLargeContentImage:", v4);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SEND"), &stru_1E5A6A588, CFSTR("Main"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLargeContentTitle:", v10);

  objc_msgSend(v3, "setShowsLargeContentViewer:", 1);
  objc_msgSend(v3, "setScalesLargeContentImage:", 1);
  objc_msgSend(v3, "setAccessibilityIdentifier:", *MEMORY[0x1E0D46BD0]);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v3);
  objc_msgSend(v3, "addInteraction:", v11);

  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MFComposeSendAccessoryButton;
  -[MFComposeSendAccessoryButton traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  if (!v4
    || (-[MFComposeSendAccessoryButton traitCollection](self, "traitCollection"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "userInterfaceStyle"),
        v7 = objc_msgSend(v4, "userInterfaceStyle"),
        v5,
        v6 != v7))
  {
    -[MFComposeSendAccessoryButton window](self, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tintColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeSendAccessoryButton setTintColor:](self, "setTintColor:", v9);

  }
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[MFComposeSendAccessoryButton _preview](self, "_preview", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B20], "effectWithPreview:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeSendAccessoryButton _pointerShapeForTargetedPreview:](self, "_pointerShapeForTargetedPreview:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_preview
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  id v7;
  void *v8;

  -[MFComposeSendAccessoryButton window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MFComposeSendAccessoryButton bounds](self, "bounds");
    UIRectGetCenter();
    -[MFComposeSendAccessoryButton convertPoint:toView:](self, "convertPoint:toView:", v3);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B88]), "initWithContainer:center:", v3, v4, v5);
    v7 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:target:", self, v7, v6);

  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", self);
  }

  return v8;
}

- (id)_pointerShapeForTargetedPreview:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double Width;
  double Height;
  void *v25;
  CGRect v27;
  CGRect v28;

  v4 = a3;
  -[MFComposeSendAccessoryButton bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "target");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "container");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeSendAccessoryButton convertRect:toView:](self, "convertRect:toView:", v14, v6, v8, v10, v12);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v27.origin.x = v16;
  v27.origin.y = v18;
  v27.size.width = v20;
  v27.size.height = v22;
  Width = CGRectGetWidth(v27);
  v28.origin.x = v16;
  v28.origin.y = v18;
  v28.size.width = v20;
  v28.size.height = v22;
  Height = CGRectGetHeight(v28);
  if (Width >= Height)
    Height = Width;
  objc_msgSend(MEMORY[0x1E0DC3B30], "shapeWithRoundedRect:cornerRadius:", v16, v18, v20, v22, Height * 0.5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

@end
