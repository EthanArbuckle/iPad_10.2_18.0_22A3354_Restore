@implementation MUPhotoTileCollectionViewCell

- (MUPhotoTileCollectionViewCell)initWithFrame:(CGRect)a3
{
  MUPhotoTileCollectionViewCell *v3;
  MUPhotoTileView *v4;
  uint64_t v5;
  MUPhotoTileView *photoTileView;
  void *v7;
  MUEdgeLayout *v8;
  MUPhotoTileView *v9;
  void *v10;
  MUEdgeLayout *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MUPhotoTileCollectionViewCell;
  v3 = -[MUPhotoTileCollectionViewCell initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MUPhotoTileView alloc];
    v5 = -[MUPhotoTileView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    photoTileView = v3->_photoTileView;
    v3->_photoTileView = (MUPhotoTileView *)v5;

    -[MUPhotoTileCollectionViewCell contentView](v3, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v3->_photoTileView);

    v8 = [MUEdgeLayout alloc];
    v9 = v3->_photoTileView;
    -[MUPhotoTileCollectionViewCell contentView](v3, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[MUEdgeLayout initWithItem:container:](v8, "initWithItem:container:", v9, v10);
    -[MUConstraintLayout activate](v11, "activate");

    -[UIView _mapsui_setCardCorner](v3, "_mapsui_setCardCorner");
  }
  return v3;
}

- (MUPhotoTileViewModel)viewModel
{
  return -[MUPhotoTileView viewModel](self->_photoTileView, "viewModel");
}

- (void)setViewModel:(id)a3
{
  -[MUPhotoTileView setViewModel:](self->_photoTileView, "setViewModel:", a3);
}

- (MUPhotoTileOverlay)photoOverlay
{
  return -[MUPhotoTileView photoOverlay](self->_photoTileView, "photoOverlay");
}

- (void)setPhotoOverlay:(id)a3
{
  -[MUPhotoTileView setPhotoOverlay:](self->_photoTileView, "setPhotoOverlay:", a3);
}

- (UIImageView)contentImageView
{
  return -[MUPhotoTileView contentImageView](self->_photoTileView, "contentImageView");
}

- (CGSize)targetFrameSize
{
  double v2;
  double v3;
  CGSize result;

  -[MUPhotoTileView targetFrameSize](self->_photoTileView, "targetFrameSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setTargetFrameSize:(CGSize)a3
{
  -[MUPhotoTileView setTargetFrameSize:](self->_photoTileView, "setTargetFrameSize:", a3.width, a3.height);
}

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoTileView, 0);
}

@end
