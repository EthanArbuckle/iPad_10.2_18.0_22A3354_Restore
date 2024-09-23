@implementation NTKCPhotoListCell

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NTKCPhotoListCell)initWithFrame:(CGRect)a3
{
  NTKCPhotoListCell *v3;
  uint64_t v4;
  UIView *content;
  uint64_t v6;
  UIImageView *contentImageView;
  id v8;
  uint64_t v9;
  UIView *selectionOverlayView;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  UIImageView *selectionBadge;
  id v16;
  uint64_t v17;
  UIView *highlightOverlayView;
  void *v19;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)NTKCPhotoListCell;
  v3 = -[NTKCPhotoListCell initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_opt_new();
    content = v3->_content;
    v3->_content = (UIView *)v4;

    -[UIView setClipsToBounds:](v3->_content, "setClipsToBounds:", 1);
    -[NTKCPhotoListCell addSubview:](v3, "addSubview:", v3->_content);
    v6 = objc_opt_new();
    contentImageView = v3->_contentImageView;
    v3->_contentImageView = (UIImageView *)v6;

    -[UIView addSubview:](v3->_content, "addSubview:", v3->_contentImageView);
    v8 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[NTKCPhotoListCell bounds](v3, "bounds");
    v9 = objc_msgSend(v8, "initWithFrame:");
    selectionOverlayView = v3->_selectionOverlayView;
    v3->_selectionOverlayView = (UIView *)v9;

    -[UIView setUserInteractionEnabled:](v3->_selectionOverlayView, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "colorWithAlphaComponent:", 0.25);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_selectionOverlayView, "setBackgroundColor:", v12);

    -[NTKCPhotoListCell addSubview:](v3, "addSubview:", v3->_selectionOverlayView);
    -[UIView setHidden:](v3->_selectionOverlayView, "setHidden:", 1);
    NTKCImageNamed(CFSTR("BlueCheckSelected"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v13);
    selectionBadge = v3->_selectionBadge;
    v3->_selectionBadge = (UIImageView *)v14;

    -[UIView addSubview:](v3->_selectionOverlayView, "addSubview:", v3->_selectionBadge);
    v16 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[NTKCPhotoListCell bounds](v3, "bounds");
    v17 = objc_msgSend(v16, "initWithFrame:");
    highlightOverlayView = v3->_highlightOverlayView;
    v3->_highlightOverlayView = (UIView *)v17;

    -[UIView setUserInteractionEnabled:](v3->_highlightOverlayView, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "colorWithAlphaComponent:", 0.5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_highlightOverlayView, "setBackgroundColor:", v20);

    -[NTKCPhotoListCell addSubview:](v3, "addSubview:", v3->_highlightOverlayView);
    -[UIView setHidden:](v3->_highlightOverlayView, "setHidden:", 1);

  }
  return v3;
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
  double v11;
  void *v12;
  double width;
  double height;
  double v15;
  double v16;
  double v17;
  double v18;
  UIImageView *contentImageView;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double MaxX;
  CGFloat v29;
  double MaxY;
  CGAffineTransform v31;
  CGAffineTransform v32;
  objc_super v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v33.receiver = self;
  v33.super_class = (Class)NTKCPhotoListCell;
  -[NTKCPhotoListCell layoutSubviews](&v33, sel_layoutSubviews);
  -[NTKCPhotoListCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView setFrame:](self->_content, "setFrame:");
  v11 = 1.0;
  if (!CGRectIsEmpty(self->_crop))
  {
    -[UIImageView image](self->_contentImageView, "image");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      width = self->_crop.size.width;
      height = self->_crop.size.height;
      v34.origin.x = v4;
      v34.origin.y = v6;
      v34.size.width = v8;
      v34.size.height = v10;
      v15 = CGRectGetWidth(v34);
      v35.origin.x = v4;
      v35.origin.y = v6;
      v35.size.width = v8;
      v35.size.height = v10;
      if (width / height <= v15 / CGRectGetHeight(v35))
        v16 = width;
      else
        v16 = height;
      v36.origin.x = v4;
      v36.origin.y = v6;
      v36.size.width = v8;
      v36.size.height = v10;
      v17 = CGRectGetWidth(v36) / v16;
      v37.origin.x = v4;
      v37.origin.y = v6;
      v37.size.width = v8;
      v37.size.height = v10;
      v18 = CGRectGetHeight(v37) / v16;
      if (v17 >= v18)
        v11 = v18;
      else
        v11 = v17;
    }
  }
  CGAffineTransformMakeScale(&v32, v11, v11);
  contentImageView = self->_contentImageView;
  v31 = v32;
  -[UIImageView setTransform:](contentImageView, "setTransform:", &v31);
  -[UIImageView frame](self->_contentImageView, "frame");
  UIRectCenteredIntegralRectScale();
  -[UIImageView setFrame:](self->_contentImageView, "setFrame:", 0);
  -[UIView setFrame:](self->_highlightOverlayView, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_selectionOverlayView, "setFrame:", v4, v6, v8, v10);
  -[UIImageView frame](self->_selectionBadge, "frame");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  -[UIView frame](self->_selectionOverlayView, "frame");
  MaxX = CGRectGetMaxX(v38);
  v39.origin.x = v21;
  v39.origin.y = v23;
  v39.size.width = v25;
  v39.size.height = v27;
  v29 = MaxX - CGRectGetWidth(v39);
  -[UIView frame](self->_selectionOverlayView, "frame");
  MaxY = CGRectGetMaxY(v40);
  v41.origin.x = v29;
  v41.origin.y = v23;
  v41.size.width = v25;
  v41.size.height = v27;
  -[UIImageView setFrame:](self->_selectionBadge, "setFrame:", v29, MaxY - CGRectGetHeight(v41), v25, v27);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[NTKCPhotoListCell isHighlighted](self, "isHighlighted") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)NTKCPhotoListCell;
    -[NTKCPhotoListCell setHighlighted:](&v5, sel_setHighlighted_, v3);
    -[UIView setHidden:](self->_highlightOverlayView, "setHidden:", v3 ^ 1);
  }
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[NTKCPhotoListCell isSelected](self, "isSelected") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)NTKCPhotoListCell;
    -[NTKCPhotoListCell setSelected:](&v5, sel_setSelected_, v3);
    -[UIView setHidden:](self->_selectionOverlayView, "setHidden:", v3 ^ 1);
  }
}

- (UIImage)photo
{
  return -[UIImageView image](self->_contentImageView, "image");
}

- (void)setPhoto:(id)a3
{
  id v4;
  void *v5;
  char v6;
  UIImageView *contentImageView;
  __int128 v8;
  _OWORD v9[3];

  v4 = a3;
  -[UIImageView image](self->_contentImageView, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    contentImageView = self->_contentImageView;
    v8 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v9[0] = *MEMORY[0x1E0C9BAA8];
    v9[1] = v8;
    v9[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    -[UIImageView setTransform:](contentImageView, "setTransform:", v9);
    -[UIImageView setImage:](self->_contentImageView, "setImage:", v4);
    -[UIImageView sizeToFit](self->_contentImageView, "sizeToFit");
    -[NTKCPhotoListCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setCrop:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_crop;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_crop = &self->_crop;
  if (!CGRectEqualToRect(a3, self->_crop))
  {
    p_crop->origin.x = x;
    p_crop->origin.y = y;
    p_crop->size.width = width;
    p_crop->size.height = height;
    -[NTKCPhotoListCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKCPhotoListCell;
  -[NTKCPhotoListCell prepareForReuse](&v3, sel_prepareForReuse);
  -[NTKCPhotoListCell setIndex:](self, "setIndex:", -1);
}

- (CGRect)crop
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_crop.origin.x;
  y = self->_crop.origin.y;
  width = self->_crop.size.width;
  height = self->_crop.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentImageView, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_highlightOverlayView, 0);
  objc_storeStrong((id *)&self->_selectionBadge, 0);
  objc_storeStrong((id *)&self->_selectionOverlayView, 0);
}

@end
