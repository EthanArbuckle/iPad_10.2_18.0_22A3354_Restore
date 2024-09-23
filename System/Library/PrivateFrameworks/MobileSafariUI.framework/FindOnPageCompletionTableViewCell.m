@implementation FindOnPageCompletionTableViewCell

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double MaxX;
  double v27;
  double v28;
  objc_super v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v29.receiver = self;
  v29.super_class = (Class)FindOnPageCompletionTableViewCell;
  -[CompletionListTableViewCell layoutSubviews](&v29, sel_layoutSubviews);
  if (_SFDeviceIsPad())
  {
    -[FindOnPageCompletionTableViewCell detailTextLabel](self, "detailTextLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v5 = v4;
    objc_msgSend(v3, "frame");
    v7 = v6;
    v9 = v8;
    -[FindOnPageCompletionTableViewCell textLabel](self, "textLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    if (-[FindOnPageCompletionTableViewCell _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout"))
    {
      -[FindOnPageCompletionTableViewCell bounds](self, "bounds");
      v20 = v19;
      -[FindOnPageCompletionTableViewCell separatorInset](self, "separatorInset");
      v22 = v20 - v21 - v5 + -15.0;
      v30.origin.x = v22;
      v30.origin.y = v7;
      v30.size.width = v5;
      v30.size.height = v9;
      v23 = CGRectGetMinX(v30) + -6.0 - v12;
    }
    else
    {
      -[FindOnPageCompletionTableViewCell separatorInset](self, "separatorInset");
      v22 = v24 + 15.0;
      v31.origin.x = v12;
      v31.origin.y = v14;
      v31.size.width = v16;
      v31.size.height = v18;
      v28 = v18;
      v25 = v14;
      MaxX = CGRectGetMaxX(v31);
      v32.origin.x = v22;
      v32.origin.y = v7;
      v32.size.width = v5;
      v32.size.height = v9;
      v27 = MaxX - CGRectGetMaxX(v32);
      v14 = v25;
      v18 = v28;
      v23 = v27 + -6.0;
      v12 = v12 + v16 - (v27 + -6.0);
    }
    objc_msgSend(v10, "setFrame:", v12, v14, v23, v18);
    objc_msgSend(v3, "setFrame:", v22, v7, v5, v9);

  }
}

@end
