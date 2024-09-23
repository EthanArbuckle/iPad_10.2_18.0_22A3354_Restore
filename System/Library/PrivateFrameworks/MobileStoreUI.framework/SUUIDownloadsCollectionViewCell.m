@implementation SUUIDownloadsCollectionViewCell

- (SUUIDownloadsCollectionViewCell)initWithFrame:(CGRect)a3
{
  SUUIDownloadsCollectionViewCell *v3;
  SUUIDownloadsCellView *v4;
  SUUIDownloadsCellView *cellView;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUUIDownloadsCollectionViewCell;
  v3 = -[SUUIDownloadsCollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(SUUIDownloadsCellView);
    cellView = v3->_cellView;
    v3->_cellView = v4;

    -[SUUIDownloadsCollectionViewCell contentView](v3, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v3->_cellView);

  }
  return v3;
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  objc_super v6;

  v3 = a3;
  v5 = -[SUUIDownloadsCollectionViewCell isSelected](self, "isSelected");
  v6.receiver = self;
  v6.super_class = (Class)SUUIDownloadsCollectionViewCell;
  -[SUUIDownloadsCollectionViewCell setSelected:](&v6, sel_setSelected_, v3);
  if (v5 != v3)
  {
    if (self->_cellState)
      -[SUUIDownloadsCollectionViewCell _reloadEditState](self, "_reloadEditState");
  }
}

- (void)setCellState:(int64_t)a3
{
  if (self->_cellState != a3)
  {
    self->_cellState = a3;
    -[SUUIDownloadsCollectionViewCell _reloadEditState](self, "_reloadEditState");
  }
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIImageView *editIndicator;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  float v17;
  CGFloat v18;
  double MaxX;
  void *v20;
  objc_super v21;
  CGRect v22;

  v21.receiver = self;
  v21.super_class = (Class)SUUIDownloadsCollectionViewCell;
  -[SUUIDownloadsCollectionViewCell layoutSubviews](&v21, sel_layoutSubviews);
  -[SUUIDownloadsCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  editIndicator = self->_editIndicator;
  if (editIndicator)
  {
    -[UIImageView sizeToFit](editIndicator, "sizeToFit");
    -[UIImageView frame](self->_editIndicator, "frame");
    v14 = v13;
    v16 = v15;
    v17 = (v11 - v15) * 0.5;
    v18 = v7 + roundf(v17);
    -[UIImageView setFrame:](self->_editIndicator, "setFrame:", v5 + 15.0, v18);
    v22.origin.x = v5 + 15.0;
    v22.origin.y = v18;
    v22.size.width = v14;
    v22.size.height = v16;
    MaxX = CGRectGetMaxX(v22);
  }
  else
  {
    MaxX = v5;
  }
  -[SUUIDownloadsCollectionViewCell contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");

  -[SUUIDownloadsCellView setFrame:](self->_cellView, "setFrame:", MaxX, v7, v9 - (MaxX - v5), v11);
}

- (void)_reloadEditState
{
  int64_t cellState;
  UIImageView *editIndicator;
  UIImageView *v5;
  UIImageView *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;

  cellState = self->_cellState;
  editIndicator = self->_editIndicator;
  if ((unint64_t)(cellState - 1) > 1)
  {
    -[UIImageView removeFromSuperview](editIndicator, "removeFromSuperview");
    v11 = self->_editIndicator;
    self->_editIndicator = 0;
  }
  else
  {
    if (!editIndicator)
    {
      v5 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
      v6 = self->_editIndicator;
      self->_editIndicator = v5;

      -[SUUIDownloadsCollectionViewCell addSubview:](self, "addSubview:", self->_editIndicator);
      cellState = self->_cellState;
    }
    if (cellState == 2)
    {
      v7 = (void *)MEMORY[0x24BEBD640];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "imageNamed:inBundle:", CFSTR("EditControl"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = -[SUUIDownloadsCollectionViewCell isSelected](self, "isSelected");
      v13 = (void *)MEMORY[0x24BEBD640];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v12 & 1) != 0)
      {
        objc_msgSend(v13, "imageNamed:inBundle:", CFSTR("EditControlSelected"), v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        -[SUUIDownloadsCollectionViewCell tintColor](self, "tintColor");
      }
      else
      {
        objc_msgSend(v13, "imageNamed:inBundle:", CFSTR("EditControl"), v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BEBD4B8], "lightGrayColor");
      }
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)v10;
    objc_msgSend(v9, "_flatImageWithColor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIImageView setImage:](self->_editIndicator, "setImage:", v11);
  }

  -[SUUIDownloadsCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (int64_t)cellState
{
  return self->_cellState;
}

- (SUUIDownloadsCellView)cellView
{
  return self->_cellView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editIndicator, 0);
  objc_storeStrong((id *)&self->_cellView, 0);
}

@end
