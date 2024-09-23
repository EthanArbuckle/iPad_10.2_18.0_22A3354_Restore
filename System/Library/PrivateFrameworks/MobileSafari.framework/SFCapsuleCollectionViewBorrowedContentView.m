@implementation SFCapsuleCollectionViewBorrowedContentView

- (SFCapsuleCollectionViewBorrowedContentView)initWithFrame:(CGRect)a3
{
  SFCapsuleCollectionViewBorrowedContentView *v3;
  SFCapsuleCollectionViewBorrowedContentView *v4;
  void *v5;
  id v6;
  uint64_t v7;
  UIView *contentView;
  SFCapsuleCollectionViewBorrowedContentView *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SFCapsuleCollectionViewBorrowedContentView;
  v3 = -[SFCapsuleCollectionViewBorrowedContentView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SFCapsuleCollectionViewBorrowedContentView setClipsToBounds:](v3, "setClipsToBounds:", 1);
    -[SFCapsuleCollectionViewBorrowedContentView layer](v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsGroupOpacity:", 0);

    v6 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[SFCapsuleCollectionViewBorrowedContentView bounds](v4, "bounds");
    v7 = objc_msgSend(v6, "initWithFrame:");
    contentView = v4->_contentView;
    v4->_contentView = (UIView *)v7;

    -[SFCapsuleCollectionViewBorrowedContentView addSubview:](v4, "addSubview:", v4->_contentView);
    v9 = v4;
  }

  return v4;
}

- (SFCapsuleCollectionViewBorrowedContentView)initWithCoder:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Not implemented"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double Height;
  objc_super v12;
  CGRect v13;
  CGRect v14;

  v12.receiver = self;
  v12.super_class = (Class)SFCapsuleCollectionViewBorrowedContentView;
  -[SFCapsuleCollectionViewBorrowedContentView layoutSubviews](&v12, sel_layoutSubviews);
  -[UIView frame](self->_contentView, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SFCapsuleCollectionViewBorrowedContentView bounds](self, "bounds");
  Height = CGRectGetHeight(v13);
  v14.origin.x = v4;
  v14.origin.y = v6;
  v14.size.width = v8;
  v14.size.height = v10;
  -[UIView setFrame:](self->_contentView, "setFrame:", v4, Height - CGRectGetHeight(v14), v8, v10);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (BOOL)resizesFromOriginalToolbarFrame
{
  return self->_resizesFromOriginalToolbarFrame;
}

- (void)setResizesFromOriginalToolbarFrame:(BOOL)a3
{
  self->_resizesFromOriginalToolbarFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
