@implementation CKDetailsCell

- (CKDetailsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CKDetailsCell *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CKDetailsCell;
  v4 = -[CKDetailsCell initWithStyle:reuseIdentifier:](&v16, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "theme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "detailsSelectedCellColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "theme");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "detailsSelectedCellColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setBackgroundColor:", v11);

      -[CKDetailsCell setSelectedBackgroundView:](v4, "setSelectedBackgroundView:", v8);
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "theme");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "iosMacDetailsCellColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsCell setBackgroundColor:](v4, "setBackgroundColor:", v14);

    }
  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  void *v13;
  int v14;
  double v15;
  double v16;
  double Width;
  _BOOL4 v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  void *v23;
  double Height;
  double v25;
  double v26;
  int v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  double v35;
  CGFloat v36;
  double v37;
  double v38;
  objc_super v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v39.receiver = self;
  v39.super_class = (Class)CKDetailsCell;
  -[CKDetailsCell layoutSubviews](&v39, sel_layoutSubviews);
  -[CKDetailsCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKDetailsCell layoutMargins](self, "layoutMargins");
  v37 = v12;
  v38 = v11;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "detailsSeperatorsFollowLayoutMargins");

  v15 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  if (CKPixelWidth_once_3 != -1)
    dispatch_once(&CKPixelWidth_once_3, &__block_literal_global_41);
  v16 = *(double *)&CKPixelWidth_sPixel_3;
  v34 = CKPixelWidth_sPixel_3;
  v40.origin.x = v4;
  v40.origin.y = v6;
  v40.size.width = v8;
  v40.size.height = v10;
  v36 = v10;
  Width = CGRectGetWidth(v40);
  v18 = -[CKDetailsCell indentTopSeperator](self, "indentTopSeperator");
  v19 = 0.0;
  v20 = v8;
  if (v18 | v14)
    v21 = v38;
  else
    v21 = 0.0;
  if (v14)
    v19 = v37;
  v22 = Width - v21 - v19;
  -[CKDetailsCell topSeperator](self, "topSeperator", v34);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFrame:", v21, v15, v22, v16);

  v41.origin.x = v4;
  v41.origin.y = v6;
  v41.size.width = v20;
  v41.size.height = v36;
  Height = CGRectGetHeight(v41);
  v42.origin.x = v21;
  v42.origin.y = v15;
  v42.size.width = v22;
  v42.size.height = v35;
  v25 = Height - CGRectGetHeight(v42);
  v43.origin.x = v4;
  v43.origin.y = v6;
  v43.size.width = v20;
  v43.size.height = v36;
  v26 = CGRectGetWidth(v43);
  v27 = -[CKDetailsCell indentBottomSeperator](self, "indentBottomSeperator") | v14;
  v28 = 0.0;
  if (v27)
    v29 = v38;
  else
    v29 = 0.0;
  if (v27)
    v28 = v37;
  v30 = v26 - v29 - v28;
  -[CKDetailsCell bottomSeperator](self, "bottomSeperator");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setFrame:", v29, v25, v30, v35);

  -[CKDetailsCell topSeperator](self, "topSeperator");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsCell bringSubviewToFront:](self, "bringSubviewToFront:", v32);

  -[CKDetailsCell bottomSeperator](self, "bottomSeperator");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsCell bringSubviewToFront:](self, "bringSubviewToFront:", v33);

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKDetailsCell;
  -[CKDetailsCell prepareForReuse](&v5, sel_prepareForReuse);
  -[CKDetailsCell topSeperator](self, "topSeperator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  -[CKDetailsCell bottomSeperator](self, "bottomSeperator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

  -[CKDetailsCell setIndentTopSeperator:](self, "setIndentTopSeperator:", 0);
  -[CKDetailsCell setIndentBottomSeperator:](self, "setIndentBottomSeperator:", 0);
}

- (UIView)topSeperator
{
  UIView *topSeperator;
  id v4;
  UIView *v5;
  void *v6;
  UIView *v7;

  topSeperator = self->_topSeperator;
  if (!topSeperator)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v5 = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(MEMORY[0x1E0CEA478], "separatorColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v6);

    -[CKDetailsCell addSubview:](self, "addSubview:", v5);
    v7 = self->_topSeperator;
    self->_topSeperator = v5;

    topSeperator = self->_topSeperator;
  }
  return topSeperator;
}

- (UIView)bottomSeperator
{
  UIView *bottomSeperator;
  id v4;
  UIView *v5;
  void *v6;
  UIView *v7;

  bottomSeperator = self->_bottomSeperator;
  if (!bottomSeperator)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v5 = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(MEMORY[0x1E0CEA478], "separatorColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v6);

    -[CKDetailsCell addSubview:](self, "addSubview:", v5);
    v7 = self->_bottomSeperator;
    self->_bottomSeperator = v5;

    bottomSeperator = self->_bottomSeperator;
  }
  return bottomSeperator;
}

- (void)setTopSeperator:(id)a3
{
  objc_storeStrong((id *)&self->_topSeperator, a3);
}

- (void)setBottomSeperator:(id)a3
{
  objc_storeStrong((id *)&self->_bottomSeperator, a3);
}

- (BOOL)indentTopSeperator
{
  return self->_indentTopSeperator;
}

- (void)setIndentTopSeperator:(BOOL)a3
{
  self->_indentTopSeperator = a3;
}

- (BOOL)indentBottomSeperator
{
  return self->_indentBottomSeperator;
}

- (void)setIndentBottomSeperator:(BOOL)a3
{
  self->_indentBottomSeperator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomSeperator, 0);
  objc_storeStrong((id *)&self->_topSeperator, 0);
}

@end
