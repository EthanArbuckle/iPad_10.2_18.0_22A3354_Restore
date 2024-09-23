@implementation EKUICenteredTextTableViewCell

- (EKUICenteredTextTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  EKUICenteredTextTableViewCell *v4;
  EKUICenteredTextTableViewCell *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EKUICenteredTextTableViewCell;
  v4 = -[EKUITableViewCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[EKUICenteredTextTableViewCell textLabel](v4, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextAlignment:", 1);

    -[EKUICenteredTextTableViewCell detailTextLabel](v5, "detailTextLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextAlignment:", 1);

  }
  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)EKUICenteredTextTableViewCell;
  -[EKUITableViewCell layoutSubviews](&v33, sel_layoutSubviews);
  -[EKUICenteredTextTableViewCell textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUICenteredTextTableViewCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "convertPoint:fromView:", v5, 0.0, 0.0);
  v7 = v6;

  -[EKUICenteredTextTableViewCell textLabel](self, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;
  -[EKUICenteredTextTableViewCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v13 = v12;
  -[EKUICenteredTextTableViewCell textLabel](self, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  v16 = v15;
  -[EKUICenteredTextTableViewCell textLabel](self, "textLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", v7, v10, v13, v16);

  -[EKUICenteredTextTableViewCell detailTextLabel](self, "detailTextLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "superview");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUICenteredTextTableViewCell contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "convertPoint:fromView:", v20, 0.0, 0.0);
  v22 = v21;

  -[EKUICenteredTextTableViewCell detailTextLabel](self, "detailTextLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "frame");
  v25 = v24;
  -[EKUICenteredTextTableViewCell contentView](self, "contentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "frame");
  v28 = v27;
  -[EKUICenteredTextTableViewCell detailTextLabel](self, "detailTextLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "frame");
  v31 = v30;
  -[EKUICenteredTextTableViewCell detailTextLabel](self, "detailTextLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setFrame:", v22, v25, v28, v31);

}

@end
