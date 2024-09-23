@implementation MUPunchoutCollectionViewCell

- (MUPunchoutCollectionViewCell)initWithFrame:(CGRect)a3
{
  MUPunchoutCollectionViewCell *v3;
  objc_class *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MUPunchoutCollectionViewCell;
  v3 = -[MUPunchoutCollectionViewCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPunchoutCollectionViewCell setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", v5);

    -[MUPunchoutCollectionViewCell _setupContentView](v3, "_setupContentView");
    -[UIView _mapsui_setCardCorner](v3, "_mapsui_setCardCorner");
  }
  return v3;
}

- (void)_setupContentView
{
  MUPunchoutView *v3;
  MUPunchoutView *v4;
  MUPunchoutView *punchoutView;
  void *v6;
  void *v7;
  MUEdgeLayout *v8;
  MUPunchoutView *v9;
  MUEdgeLayout *v10;
  id v11;

  v3 = [MUPunchoutView alloc];
  v4 = -[MUPunchoutView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  punchoutView = self->_punchoutView;
  self->_punchoutView = v4;

  -[MUPunchoutView setClipsToBounds:](self->_punchoutView, "setClipsToBounds:", 1);
  -[MUPunchoutCollectionViewCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", self->_punchoutView);

  -[MUPunchoutCollectionViewCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_mapsui_setCardCorner");

  v8 = [MUEdgeLayout alloc];
  v9 = self->_punchoutView;
  -[MUPunchoutCollectionViewCell contentView](self, "contentView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v10 = -[MUEdgeLayout initWithItem:container:](v8, "initWithItem:container:", v9, v11);
  -[MUConstraintLayout activate](v10, "activate");

}

- (void)setViewModel:(id)a3
{
  -[MUPunchoutView setViewModel:](self->_punchoutView, "setViewModel:", a3);
}

- (MUPunchoutViewModel)viewModel
{
  return -[MUPunchoutView viewModel](self->_punchoutView, "viewModel");
}

- (void)beginAnimatingActivityIndicator
{
  -[MUPunchoutView beginAnimatingActivityIndicator](self->_punchoutView, "beginAnimatingActivityIndicator");
}

- (void)endAnimatingActivityIndicatorWithError:(id)a3
{
  -[MUPunchoutView endAnimatingActivityIndicatorWithError:](self->_punchoutView, "endAnimatingActivityIndicatorWithError:", a3);
}

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_punchoutView, 0);
}

@end
