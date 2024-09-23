@implementation NTKCFaceDetailRowActionCell

- (NTKCFaceDetailRowActionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  NTKCFaceDetailRowActionCell *v4;
  NTKCFaceDetailRowActionCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NTKCFaceDetailRowActionCell;
  v4 = -[NTKCDetailTableViewCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, 1, a4);
  v5 = v4;
  if (v4)
    -[NTKCDetailTableViewCell setShowsSeparator:](v4, "setShowsSeparator:", 1);
  return v5;
}

- (void)setShowsTopSeparator:(BOOL)a3
{
  NTKCSeparatorView *topSeparator;
  NTKCSeparatorView *v5;
  NTKCSeparatorView *v6;

  if (self->_showsTopSeparator != a3)
  {
    self->_showsTopSeparator = a3;
    topSeparator = self->_topSeparator;
    if (a3)
    {
      if (!topSeparator)
      {
        v5 = (NTKCSeparatorView *)objc_opt_new();
        v6 = self->_topSeparator;
        self->_topSeparator = v5;

        topSeparator = self->_topSeparator;
      }
      -[NTKCFaceDetailRowActionCell addSubview:](self, "addSubview:", topSeparator);
    }
    else
    {
      -[NTKCSeparatorView removeFromSuperview](self->_topSeparator, "removeFromSuperview");
    }
  }
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
  int IsRTL;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  double Width;
  double v25;
  CGRect rect;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  *(_QWORD *)&rect.origin.y = self;
  *(_QWORD *)&rect.size.width = NTKCFaceDetailRowActionCell;
  -[CGFloat layoutSubviews]((objc_super *)&rect.origin.y, sel_layoutSubviews);
  -[NTKCFaceDetailRowActionCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  IsRTL = CLKLayoutIsRTL();
  -[NTKCSeparatorView frame](self->_topSeparator, "frame");
  rect.origin.x = v12;
  v14 = v13;
  v16 = v15;
  -[NTKCFaceDetailRowActionCell separatorInset](self, "separatorInset");
  v18 = v17;
  v19 = v4 + v17;
  v27.origin.y = v6 + v20;
  v22 = v8 - (v18 + v21);
  v27.size.height = v10 - (v20 + v23);
  v27.origin.x = v19;
  v27.size.width = v22;
  Width = CGRectGetWidth(v27);
  if (IsRTL)
  {
    v28.origin.x = v4;
    v28.origin.y = v6;
    v28.size.width = v8;
    v28.size.height = v10;
    v25 = CGRectGetWidth(v28);
    v29.origin.x = rect.origin.x;
    v29.origin.y = v14;
    v29.size.width = Width;
    v29.size.height = v16;
    v18 = v25 - CGRectGetWidth(v29) - v18;
  }
  -[NTKCSeparatorView setFrame:](self->_topSeparator, "setFrame:", v18, 0.0, Width, v16);
}

- (BOOL)showsTopSeparator
{
  return self->_showsTopSeparator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topSeparator, 0);
}

@end
