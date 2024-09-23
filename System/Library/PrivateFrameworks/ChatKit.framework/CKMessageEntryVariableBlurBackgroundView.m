@implementation CKMessageEntryVariableBlurBackgroundView

- (CKMessageEntryVariableBlurBackgroundView)init
{
  CKMessageEntryVariableBlurBackgroundView *v2;
  uint64_t v3;
  UIVisualEffectView *variableBlurEffectView;
  UIImageView *v5;
  UIImageView *variableBlurColorOverlayView;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKMessageEntryVariableBlurBackgroundView;
  v2 = -[CKMessageEntryVariableBlurBackgroundView init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", 0);
    variableBlurEffectView = v2->_variableBlurEffectView;
    v2->_variableBlurEffectView = (UIVisualEffectView *)v3;

    v5 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0CEA658]);
    variableBlurColorOverlayView = v2->_variableBlurColorOverlayView;
    v2->_variableBlurColorOverlayView = v5;

    -[UIImageView setContentMode:](v2->_variableBlurColorOverlayView, "setContentMode:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v2->_variableBlurColorOverlayView, "setBackgroundColor:", v7);

    -[CKMessageEntryVariableBlurBackgroundView addSubview:](v2, "addSubview:", v2->_variableBlurEffectView);
    -[CKMessageEntryVariableBlurBackgroundView addSubview:](v2, "addSubview:", v2->_variableBlurColorOverlayView);
  }
  return v2;
}

+ (id)createVerticalGradientImageWithHeight:(double)a3 scale:(double)a4 bottomSolidAreaHeight:(double)a5 gradientLocationPoints:(id)a6 gradientAlphaValues:(id)a7 color:(id)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  double v27;
  double v28;
  double v29;

  v13 = a6;
  v14 = a7;
  v15 = a8;
  objc_msgSend(MEMORY[0x1E0CEA618], "preferredFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA610]), "initWithSize:format:", v16, 1.0, a3 * a4);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __159__CKMessageEntryVariableBlurBackgroundView_createVerticalGradientImageWithHeight_scale_bottomSolidAreaHeight_gradientLocationPoints_gradientAlphaValues_color___block_invoke;
  v23[3] = &unk_1E274F720;
  v27 = a3;
  v28 = a5;
  v29 = a4;
  v24 = v14;
  v25 = v15;
  v26 = v13;
  v18 = v13;
  v19 = v15;
  v20 = v14;
  objc_msgSend(v17, "imageWithActions:", v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

void __159__CKMessageEntryVariableBlurBackgroundView_createVerticalGradientImageWithHeight_scale_bottomSolidAreaHeight_gradientLocationPoints_gradientAlphaValues_color___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  CFIndex v9;
  __CFArray *Mutable;
  uint64_t v11;
  const CGFloat *v12;
  size_t v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  CGFloat v20;
  CGGradient *v21;
  CGContext *v22;
  _QWORD v23[2];
  CGPoint v24;
  CGPoint v25;

  v23[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(double *)(a1 + 56);
  v5 = *(double *)(a1 + 64);
  v6 = *(double *)(a1 + 72);
  v7 = *MEMORY[0x1E0C9D538];
  v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v9 = objc_msgSend(*(id *)(a1 + 32), "count");
  Mutable = CFArrayCreateMutable(0, v9, MEMORY[0x1E0C9B378]);
  MEMORY[0x1E0C80A78](Mutable);
  v12 = (const CGFloat *)((char *)v23 - v11);
  bzero((char *)v23 - v11, v13);
  if (v9 >= 1)
  {
    for (i = 0; i != v9; ++i)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", i);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "doubleValue");
      v17 = v16;

      objc_msgSend(*(id *)(a1 + 40), "colorWithAlphaComponent:", v17);
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CFArrayAppendValue(Mutable, (const void *)objc_msgSend(v18, "CGColor"));
      objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", i);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "doubleValue");
      v12[i] = v20;

    }
  }
  v21 = CGGradientCreateWithColors(0, Mutable, v12);
  v22 = (CGContext *)objc_msgSend(v3, "CGContext");
  v24.x = 0.0;
  v24.y = (v4 - v5) * v6;
  v25.x = v7;
  v25.y = v8;
  CGContextDrawLinearGradient(v22, v21, v24, v25, 3u);
  CGGradientRelease(v21);
  CFRelease(Mutable);

}

- (void)setEntryViewTraitCollection:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UITraitCollection isEqual:](self->_entryViewTraitCollection, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_entryViewTraitCollection, a3);
    -[CKMessageEntryVariableBlurBackgroundView _updateVariableBlurImage](self, "_updateVariableBlurImage");
  }

}

- (void)_updateVariableBlurImage
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  -[CKMessageEntryVariableBlurBackgroundView bounds](self, "bounds");
  if (v3 == 0.0)
  {
    -[UIImageView setImage:](self->_variableBlurColorOverlayView, "setImage:", 0);
    -[UIVisualEffectView setBackgroundEffects:](self->_variableBlurEffectView, "setBackgroundEffects:", MEMORY[0x1E0C9AA60]);
  }
  else
  {
    v4 = v3;
    -[CKMessageEntryVariableBlurBackgroundView entryViewTraitCollection](self, "entryViewTraitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resolvedColorForTraitCollection:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "displayScale");
    v9 = v8;
    v10 = 42.0;
    if (v4 <= 42.0)
      v10 = v4;
    v11 = v4 - v10;
    objc_msgSend((id)objc_opt_class(), "createVerticalGradientImageWithHeight:scale:bottomSolidAreaHeight:gradientLocationPoints:gradientAlphaValues:color:", &unk_1E286F418, &unk_1E286F400, v7, v4, v9, v4 - v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_variableBlurColorOverlayView, "setImage:", v12);
    objc_msgSend((id)objc_opt_class(), "createVerticalGradientImageWithHeight:scale:bottomSolidAreaHeight:gradientLocationPoints:gradientAlphaValues:color:", &unk_1E286F448, &unk_1E286F430, v7, v4, v9, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithVariableBlurRadius:imageMask:", v13, 0.833333333);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setBackgroundEffects:](self->_variableBlurEffectView, "setBackgroundEffects:", v15);

  }
}

- (void)safeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKMessageEntryVariableBlurBackgroundView;
  -[CKMessageEntryVariableBlurBackgroundView safeAreaInsetsDidChange](&v3, sel_safeAreaInsetsDidChange);
  -[CKMessageEntryVariableBlurBackgroundView _updateVariableBlurImage](self, "_updateVariableBlurImage");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  objc_super v15;
  CGRect v16;
  CGRect v17;

  v15.receiver = self;
  v15.super_class = (Class)CKMessageEntryVariableBlurBackgroundView;
  -[CKMessageEntryVariableBlurBackgroundView layoutSubviews](&v15, sel_layoutSubviews);
  -[CKMessageEntryVariableBlurBackgroundView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIVisualEffectView frame](self->_variableBlurEffectView, "frame");
  v17.origin.x = v11;
  v17.origin.y = v12;
  v17.size.width = v13;
  v17.size.height = v14;
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  if (!CGRectEqualToRect(v16, v17))
  {
    -[UIVisualEffectView setFrame:](self->_variableBlurEffectView, "setFrame:", v4, v6, v8, v10);
    -[UIImageView setFrame:](self->_variableBlurColorOverlayView, "setFrame:", v4, v6, v8, v10);
    -[CKMessageEntryVariableBlurBackgroundView _updateVariableBlurImage](self, "_updateVariableBlurImage");
  }
}

- (void)setBackdropGroupName:(id)a3
{
  NSString *v4;
  NSString *backdropGroupName;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_backdropGroupName, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    backdropGroupName = self->_backdropGroupName;
    self->_backdropGroupName = v4;

    -[UIVisualEffectView _setGroupName:](self->_variableBlurEffectView, "_setGroupName:", v6);
  }

}

- (id)inputAccessoryViewBackdropColor
{
  return 0;
}

- (id)inputAccessoryViewBackdropEffects
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (NSString)backdropGroupName
{
  return self->_backdropGroupName;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (UITraitCollection)entryViewTraitCollection
{
  return self->_entryViewTraitCollection;
}

- (UIVisualEffectView)variableBlurEffectView
{
  return self->_variableBlurEffectView;
}

- (void)setVariableBlurEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_variableBlurEffectView, a3);
}

- (UIImageView)variableBlurColorOverlayView
{
  return self->_variableBlurColorOverlayView;
}

- (void)setVariableBlurColorOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_variableBlurColorOverlayView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variableBlurColorOverlayView, 0);
  objc_storeStrong((id *)&self->_variableBlurEffectView, 0);
  objc_storeStrong((id *)&self->_entryViewTraitCollection, 0);
  objc_storeStrong((id *)&self->_backdropGroupName, 0);
}

@end
