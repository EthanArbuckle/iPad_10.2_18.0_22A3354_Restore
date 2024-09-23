@implementation ICNoteEditorToolbarPlusView

- (void)updateGradientLayerColors
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:", CFSTR("notes_format_plus_button_gradient_top"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:", CFSTR("notes_format_plus_button_gradient_bottom"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(v3);
  v9[0] = objc_msgSend(v5, "CGColor");
  v6 = objc_retainAutorelease(v4);
  v9[1] = objc_msgSend(v6, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorToolbarPlusView gradientLayer](self, "gradientLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setColors:", v7);

}

- (void)setPlusView:(id)a3
{
  objc_storeStrong((id *)&self->_plusView, a3);
}

- (void)setPlainView:(id)a3
{
  objc_storeStrong((id *)&self->_plainView, a3);
}

- (void)setGradientView:(id)a3
{
  objc_storeStrong((id *)&self->_gradientView, a3);
}

- (void)setGradientLayer:(id)a3
{
  objc_storeStrong((id *)&self->_gradientLayer, a3);
}

- (void)setCloseState:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  id v11;

  if (self->_closeState != a3)
  {
    v3 = a3;
    self->_closeState = a3;
    -[ICNoteEditorToolbarPlusView plusView](self, "plusView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
    {
      objc_msgSend(v5, "setAlpha:", 0.0);

      -[ICNoteEditorToolbarPlusView plainView](self, "plainView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAlpha:", 1.0);

      -[ICNoteEditorToolbarPlusView gradientView](self, "gradientView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 0.0;
    }
    else
    {
      objc_msgSend(v5, "setAlpha:", 1.0);

      -[ICNoteEditorToolbarPlusView plainView](self, "plainView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAlpha:", 0.0);

      -[ICNoteEditorToolbarPlusView gradientView](self, "gradientView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 1.0;
    }
    v11 = v8;
    objc_msgSend(v8, "setAlpha:", v9);

  }
}

- (UIView)plusView
{
  return self->_plusView;
}

- (UIView)plainView
{
  return self->_plainView;
}

- (UIColor)itemColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

- (ICNoteEditorToolbarPlusView)initWithFrame:(CGRect)a3
{
  ICNoteEditorToolbarPlusView *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  id v22;
  double v23;
  double v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)ICNoteEditorToolbarPlusView;
  v3 = -[ICNoteEditorToolbarPlusView initWithFrame:](&v36, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CD2790]);
    -[ICNoteEditorToolbarPlusView bounds](v3, "bounds");
    objc_msgSend(v4, "setFrame:");
    v5 = (void *)objc_opt_class();
    -[ICNoteEditorToolbarPlusView bounds](v3, "bounds");
    v6 = (void *)objc_msgSend(v5, "newCircleMaskWithBounds:");
    objc_msgSend(v4, "setMask:", v6);

    objc_msgSend(v4, "setStartPoint:", 0.0, 0.0);
    objc_msgSend(v4, "setEndPoint:", 0.0, 1.0);
    -[ICNoteEditorToolbarPlusView setGradientLayer:](v3, "setGradientLayer:", v4);
    -[ICNoteEditorToolbarPlusView updateGradientLayerColors](v3, "updateGradientLayerColors");
    v7 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[ICNoteEditorToolbarPlusView bounds](v3, "bounds");
    v8 = (void *)objc_msgSend(v7, "initWithFrame:");
    -[ICNoteEditorToolbarPlusView setGradientView:](v3, "setGradientView:", v8);

    -[ICNoteEditorToolbarPlusView gradientView](v3, "gradientView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSublayer:", v4);

    -[ICNoteEditorToolbarPlusView gradientView](v3, "gradientView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorToolbarPlusView addSubview:](v3, "addSubview:", v11);

    v12 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[ICNoteEditorToolbarPlusView bounds](v3, "bounds");
    v13 = (void *)objc_msgSend(v12, "initWithFrame:");
    -[ICNoteEditorToolbarPlusView setPlainView:](v3, "setPlainView:", v13);

    v14 = (void *)objc_opt_class();
    -[ICNoteEditorToolbarPlusView bounds](v3, "bounds");
    v15 = (void *)objc_msgSend(v14, "newCircleMaskWithBounds:");
    -[ICNoteEditorToolbarPlusView plainView](v3, "plainView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setMask:", v15);

    -[ICNoteEditorToolbarPlusView plainView](v3, "plainView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBackgroundColor:", 0);

    -[ICNoteEditorToolbarPlusView plainView](v3, "plainView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorToolbarPlusView addSubview:](v3, "addSubview:", v19);

    -[ICNoteEditorToolbarPlusView bounds](v3, "bounds");
    v21 = v20 * 0.5;
    v22 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
    v23 = v21 + -1.0;
    v24 = v21 + -8.0;
    objc_msgSend(v22, "setFrame:", v23, v24, 2.0, 16.0);
    objc_msgSend(v22, "setCornerRadius:", 1.0);
    -[ICNoteEditorToolbarPlusView itemColor](v3, "itemColor");
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v22, "setBackgroundColor:", objc_msgSend(v25, "CGColor"));

    v26 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
    objc_msgSend(v26, "setFrame:", v24, v23, 16.0, 2.0);
    objc_msgSend(v26, "setCornerRadius:", 1.0);
    -[ICNoteEditorToolbarPlusView itemColor](v3, "itemColor");
    v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v26, "setBackgroundColor:", objc_msgSend(v27, "CGColor"));

    v28 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[ICNoteEditorToolbarPlusView bounds](v3, "bounds");
    v29 = (void *)objc_msgSend(v28, "initWithFrame:");
    -[ICNoteEditorToolbarPlusView setPlusView:](v3, "setPlusView:", v29);

    -[ICNoteEditorToolbarPlusView plusView](v3, "plusView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addSublayer:", v26);

    -[ICNoteEditorToolbarPlusView plusView](v3, "plusView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addSublayer:", v22);

    -[ICNoteEditorToolbarPlusView plusView](v3, "plusView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorToolbarPlusView addSubview:](v3, "addSubview:", v34);

    v3->_closeState = 1;
    -[ICNoteEditorToolbarPlusView setCloseState:](v3, "setCloseState:", 0);

  }
  return v3;
}

- (UIView)gradientView
{
  return self->_gradientView;
}

- (CAGradientLayer)gradientLayer
{
  return self->_gradientLayer;
}

+ (id)newCircleMaskWithBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;
  id v8;
  id v9;
  CGPath *Mutable;
  CGRect v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = objc_alloc_init(MEMORY[0x1E0CD2840]);
  objc_msgSend(v7, "setFrame:", x, y, width, height);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "setFillColor:", objc_msgSend(v8, "CGColor"));

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "setStrokeColor:", objc_msgSend(v9, "CGColor"));

  Mutable = CGPathCreateMutable();
  objc_msgSend(v7, "bounds");
  CGPathAddEllipseInRect(Mutable, 0, v12);
  objc_msgSend(v7, "setPath:", Mutable);
  CGPathRelease(Mutable);
  return v7;
}

- (id)backgroundColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemFillColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICNoteEditorToolbarPlusView;
  -[ICNoteEditorToolbarPlusView _dynamicUserInterfaceTraitDidChange](&v7, sel__dynamicUserInterfaceTraitDidChange);
  -[ICNoteEditorToolbarPlusView plusView](self, "plusView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sublayers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__ICNoteEditorToolbarPlusView__dynamicUserInterfaceTraitDidChange__block_invoke;
  v6[3] = &unk_1EA7DF140;
  v6[4] = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

  -[ICNoteEditorToolbarPlusView updateGradientLayerColors](self, "updateGradientLayerColors");
}

void __66__ICNoteEditorToolbarPlusView__dynamicUserInterfaceTraitDidChange__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "itemColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "setBackgroundColor:", objc_msgSend(v4, "CGColor"));

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 44.0;
  v3 = 44.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)closeState
{
  return self->_closeState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_plusView, 0);
  objc_storeStrong((id *)&self->_plainView, 0);
  objc_storeStrong((id *)&self->_gradientView, 0);
}

@end
