@implementation ICNoteEditorToolbarDisclosureView

- (void)setOpenView:(id)a3
{
  objc_storeStrong((id *)&self->_openView, a3);
}

- (void)setCloseImageView:(id)a3
{
  objc_storeStrong((id *)&self->_closeImageView, a3);
}

- (ICNoteEditorToolbarPlusView)openView
{
  return self->_openView;
}

- (UIColor)itemColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

- (ICNoteEditorToolbarDisclosureView)initWithFrame:(CGRect)a3
{
  ICNoteEditorToolbarDisclosureView *v3;
  ICNoteEditorToolbarPlusView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  CGAffineTransform v27;
  CGAffineTransform v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)ICNoteEditorToolbarDisclosureView;
  v3 = -[ICNoteEditorToolbarDisclosureView initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = -[ICNoteEditorToolbarPlusView initWithFrame:]([ICNoteEditorToolbarPlusView alloc], "initWithFrame:", 0.0, 0.0, 44.0, 44.0);
    -[ICNoteEditorToolbarDisclosureView setOpenView:](v3, "setOpenView:", v4);

    -[ICNoteEditorToolbarDisclosureView openView](v3, "openView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setShadowRadius:", 12.0);

    -[ICNoteEditorToolbarDisclosureView openView](v3, "openView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setShadowOffset:", 0.0, 4.0);

    -[ICNoteEditorToolbarDisclosureView openView](v3, "openView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = 1036831949;
    objc_msgSend(v10, "setShadowOpacity:", v11);

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = objc_msgSend(v12, "CGColor");
    -[ICNoteEditorToolbarDisclosureView openView](v3, "openView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setShadowColor:", v13);

    -[ICNoteEditorToolbarDisclosureView openView](v3, "openView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorToolbarDisclosureView addSubview:](v3, "addSubview:", v16);

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", 0.0, 0.0, 44.0, 44.0);
    -[ICNoteEditorToolbarDisclosureView setCloseImageView:](v3, "setCloseImageView:", v17);

    objc_msgSend(MEMORY[0x1E0DC3870], "ic_largeSystemImageNamed:", CFSTR("xmark"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorToolbarDisclosureView closeImageView](v3, "closeImageView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setImage:", v18);

    -[ICNoteEditorToolbarDisclosureView closeImageView](v3, "closeImageView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setContentMode:", 4);

    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorToolbarDisclosureView closeImageView](v3, "closeImageView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTintColor:", v21);

    -[ICNoteEditorToolbarDisclosureView closeImageView](v3, "closeImageView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAlpha:", 0.0);

    CGAffineTransformMakeRotation(&v28, 0.785398163);
    -[ICNoteEditorToolbarDisclosureView closeImageView](v3, "closeImageView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v28;
    objc_msgSend(v24, "setTransform:", &v27);

    -[ICNoteEditorToolbarDisclosureView closeImageView](v3, "closeImageView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorToolbarDisclosureView addSubview:](v3, "addSubview:", v25);

  }
  return v3;
}

- (BOOL)closeState
{
  return self->_closeState;
}

- (UIImageView)closeImageView
{
  return self->_closeImageView;
}

- (id)accessibilityLabel
{
  _BOOL4 v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = -[ICNoteEditorToolbarDisclosureView closeState](self, "closeState");
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    v5 = CFSTR("Hide toolbar");
  else
    v5 = CFSTR("Show toolbar");
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1EA7E9860, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)accessibilityHint
{
  _BOOL4 v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = -[ICNoteEditorToolbarDisclosureView closeState](self, "closeState");
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    v5 = CFSTR("Double tap to hide the editing toolbar.");
  else
    v5 = CFSTR("Double tap to show the editing toolbar.");
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1EA7E9860, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICNoteEditorToolbarDisclosureView;
  return *MEMORY[0x1E0DC4660] | -[ICNoteEditorToolbarDisclosureView accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (void)setCloseState:(BOOL)a3
{
  void *v3;
  void (*v4)(uint64_t);
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  if (self->_closeState != a3)
  {
    self->_closeState = a3;
    v3 = (void *)MEMORY[0x1E0DC3F10];
    if (a3)
    {
      v7 = MEMORY[0x1E0C809B0];
      v4 = __51__ICNoteEditorToolbarDisclosureView_setCloseState___block_invoke;
      v5 = &v7;
    }
    else
    {
      v6 = MEMORY[0x1E0C809B0];
      v4 = __51__ICNoteEditorToolbarDisclosureView_setCloseState___block_invoke_2;
      v5 = &v6;
    }
    v5[1] = 3221225472;
    v5[2] = (uint64_t)v4;
    v5[3] = (uint64_t)&unk_1EA7DE660;
    v5[4] = (uint64_t)self;
    *((_BYTE *)v5 + 40) = a3;
    objc_msgSend(v3, "animateWithDuration:animations:", v5, 0.25, v6);
  }
}

void __51__ICNoteEditorToolbarDisclosureView_setCloseState___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  CGAffineTransform v10;
  CGAffineTransform v11;
  CGAffineTransform v12;
  CGAffineTransform v13;

  v2 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "openView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCloseState:", v2);

  CGAffineTransformMakeRotation(&v13, -0.785398163);
  objc_msgSend(*(id *)(a1 + 32), "openView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v13;
  objc_msgSend(v4, "setTransform:", &v12);

  objc_msgSend(*(id *)(a1 + 32), "openView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = 0;
  objc_msgSend(v6, "setShadowOpacity:", v7);

  objc_msgSend(*(id *)(a1 + 32), "closeImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", 1.0);

  CGAffineTransformMakeRotation(&v11, 0.0);
  objc_msgSend(*(id *)(a1 + 32), "closeImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v11;
  objc_msgSend(v9, "setTransform:", &v10);

}

void __51__ICNoteEditorToolbarDisclosureView_setCloseState___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  __int128 v8;
  void *v9;
  void *v10;
  CGAffineTransform v11;
  CGAffineTransform v12;
  _OWORD v13[3];

  v2 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "openView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCloseState:", v2);

  objc_msgSend(*(id *)(a1 + 32), "openView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = 1036831949;
  objc_msgSend(v5, "setShadowOpacity:", v6);

  objc_msgSend(*(id *)(a1 + 32), "openView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v13[0] = *MEMORY[0x1E0C9BAA8];
  v13[1] = v8;
  v13[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v7, "setTransform:", v13);

  objc_msgSend(*(id *)(a1 + 32), "closeImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", 0.0);

  CGAffineTransformMakeRotation(&v12, 0.785398163);
  objc_msgSend(*(id *)(a1 + 32), "closeImageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v12;
  objc_msgSend(v10, "setTransform:", &v11);

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

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  -[ICNoteEditorToolbarDisclosureView bounds](self, "bounds", a4);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_closeImageView, 0);
  objc_storeStrong((id *)&self->_openView, 0);
}

@end
