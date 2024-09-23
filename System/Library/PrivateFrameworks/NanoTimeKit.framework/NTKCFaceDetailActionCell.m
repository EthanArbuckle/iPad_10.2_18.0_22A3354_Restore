@implementation NTKCFaceDetailActionCell

+ (double)rowHeight
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 44.0);
  v4 = v3;

  return v4;
}

- (NTKCFaceDetailActionCell)initWithAction:(int64_t)a3
{
  NTKCFaceDetailActionCell *v4;
  NTKCFaceDetailActionCell *v5;
  void *v6;
  uint64_t v7;
  NTKCSeparatorView *topSeparator;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)NTKCFaceDetailActionCell;
  v4 = -[NTKCDetailTableViewCell init](&v16, sel_init);
  v5 = v4;
  if (v4)
  {
    -[NTKCFaceDetailActionCell setSelectionStyle:](v4, "setSelectionStyle:", 3);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCFaceDetailActionCell setBackgroundColor:](v5, "setBackgroundColor:", v6);

    -[NTKCDetailTableViewCell setShowsSeparator:](v5, "setShowsSeparator:", 1);
    -[NTKCFaceDetailActionCell setSeparatorInset:](v5, "setSeparatorInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    v7 = objc_opt_new();
    topSeparator = v5->_topSeparator;
    v5->_topSeparator = (NTKCSeparatorView *)v7;

    -[NTKCFaceDetailActionCell addSubview:](v5, "addSubview:", v5->_topSeparator);
    if (a3 == 1)
    {
      NTKCCustomizationLocalizedString(CFSTR("ACTION_REMOVE"), (uint64_t)CFSTR("Remove"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NTKCRemoveColor();
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a3)
      {
        v10 = 0;
        v12 = 0;
        goto LABEL_8;
      }
      NTKCCustomizationLocalizedString(CFSTR("ACTION_SET_CURRENT"), (uint64_t)CFSTR("Select"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NTKCActionColor();
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v11;
LABEL_8:
    -[NTKCFaceDetailActionCell textLabel](v5, "textLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v10);

    -[NTKCFaceDetailActionCell textLabel](v5, "textLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTextColor:", v12);

  }
  return v5;
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
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
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
  double v26;
  double v27;
  double v28;
  double v29;
  objc_super v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v30.receiver = self;
  v30.super_class = (Class)NTKCFaceDetailActionCell;
  -[NTKCDetailTableViewCell layoutSubviews](&v30, sel_layoutSubviews);
  -[NTKCFaceDetailActionCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  IsRTL = CLKLayoutIsRTL();
  -[NTKCSeparatorView frame](self->_topSeparator, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[NTKCFaceDetailActionCell separatorInset](self, "separatorInset");
  v19 = v6 + v18;
  v22 = v8 - (v20 + v21);
  v31.size.height = v10 - (v18 + v23);
  v31.origin.x = v4 + v20;
  v31.origin.y = v19;
  v31.size.width = v22;
  Width = CGRectGetWidth(v31);
  if (IsRTL)
  {
    v32.origin.x = v4;
    v32.origin.y = v6;
    v32.size.width = v8;
    v32.size.height = v10;
    v25 = CGRectGetWidth(v32);
    v33.origin.x = v13;
    v33.origin.y = v15;
    v33.size.width = Width;
    v33.size.height = v17;
    v26 = v25 - CGRectGetWidth(v33);
    -[NTKCFaceDetailActionCell separatorInset](self, "separatorInset");
    v28 = v26 - v27;
  }
  else
  {
    -[NTKCFaceDetailActionCell separatorInset](self, "separatorInset");
    v28 = v29;
  }
  -[NTKCSeparatorView setFrame:](self->_topSeparator, "setFrame:", v28, 0.0, Width, v17);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topSeparator, 0);
}

@end
