@implementation CKGroupPhotoCell

+ (id)reuseIdentifier
{
  return CFSTR("CKDetailsGroupPhotoCell_reuseIdentifier");
}

+ (BOOL)shouldHighlight
{
  return 0;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CKGroupPhotoCell;
  -[CKDetailsCell layoutSubviews](&v15, sel_layoutSubviews);
  -[CKDetailsCell topSeperator](self, "topSeperator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[CKDetailsCell bottomSeperator](self, "bottomSeperator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  -[CKGroupPhotoCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[CKGroupPhotoCell groupView](self, "groupView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

}

- (CKGroupPhotoCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CKGroupPhotoCell *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKGroupPhotoCell;
  v4 = -[CKDetailsCell initWithStyle:reuseIdentifier:](&v11, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "theme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "detailsGroupPhotoBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKGroupPhotoCell setBackgroundColor:](v4, "setBackgroundColor:", v7);

    -[CKDetailsCell topSeperator](v4, "topSeperator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", 1);

    -[CKDetailsCell bottomSeperator](v4, "bottomSeperator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", 1);

  }
  return v4;
}

- (void)setGroupView:(id)a3
{
  UIView *v5;
  UIView **p_groupView;
  UIView *groupView;
  void *v8;
  UIView *v9;

  v5 = (UIView *)a3;
  p_groupView = &self->_groupView;
  groupView = self->_groupView;
  if (groupView != v5)
  {
    v9 = v5;
    if (groupView)
      -[UIView removeFromSuperview](groupView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_groupView, a3);
    -[CKGroupPhotoCell contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", *p_groupView);

    v5 = v9;
  }

}

- (void)prepareForReuse
{
  UIView *groupView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKGroupPhotoCell;
  -[CKDetailsCell prepareForReuse](&v4, sel_prepareForReuse);
  -[UIView removeFromSuperview](self->_groupView, "removeFromSuperview");
  groupView = self->_groupView;
  self->_groupView = 0;

}

- (UIView)groupView
{
  return self->_groupView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupView, 0);
}

@end
