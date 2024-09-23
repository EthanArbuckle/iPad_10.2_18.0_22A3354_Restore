@implementation TSSIMUnlockListTableFooterView

- (TSSIMUnlockListTableFooterView)initWithFrame:(CGRect)a3
{
  void *v3;
  void *v4;
  TSSIMUnlockListTableFooterView *v5;
  id v6;
  void *v7;
  id v8;
  int v9;
  const __CFString *v10;
  void *v11;
  UIImageView *v12;
  UIImageView *imageView;
  TSSIMUnlockCalloutLabel *v14;
  TSSIMUnlockCalloutLabel *slotOneLabel;
  TSSIMUnlockCalloutLabel *v16;
  void *v17;
  void *v18;
  TSSIMUnlockCalloutLabel *v19;
  TSSIMUnlockCalloutLabel *slotTwoLabel;
  TSSIMUnlockCalloutLabel *v21;
  void *v22;
  void *v23;
  objc_super v25;
  CGRect v26;

  v25.receiver = self;
  v25.super_class = (Class)TSSIMUnlockListTableFooterView;
  v5 = -[TSSIMUnlockListTableFooterView initWithFrame:](&v25, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = objc_alloc((Class)UIImageView);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v8 = objc_msgSend(v7, "userInterfaceIdiom");
    if (v8)
    {
      v9 = 0;
      v10 = CFSTR("guide");
    }
    else
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v3, "_referenceBounds");
      v10 = CFSTR("guide");
      if (CGRectGetHeight(v26) <= 812.0)
      {
        v9 = 0;
      }
      else
      {
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[BSPlatform sharedInstance](BSPlatform, "sharedInstance"));
        if (objc_msgSend(v4, "homeButtonType") == (id)2)
          v10 = CFSTR("guide-d33like");
        v9 = 1;
      }
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", v10));
    v12 = (UIImageView *)objc_msgSend(v6, "initWithImage:", v11);
    imageView = v5->_imageView;
    v5->_imageView = v12;

    if (v9)
    if (!v8)

    -[UIImageView setContentMode:](v5->_imageView, "setContentMode:", 1);
    -[UIImageView setClipsToBounds:](v5->_imageView, "setClipsToBounds:", 1);
    -[TSSIMUnlockListTableFooterView addSubview:](v5, "addSubview:", v5->_imageView);
    v14 = objc_alloc_init(TSSIMUnlockCalloutLabel);
    slotOneLabel = v5->_slotOneLabel;
    v5->_slotOneLabel = v14;

    v16 = v5->_slotOneLabel;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("HARDWARE_SLOT_ONE_NAME"), &stru_10001CAA0, CFSTR("Localizable")));
    -[TSSIMUnlockCalloutLabel setText:](v16, "setText:", v18);

    -[UIImageView addSubview:](v5->_imageView, "addSubview:", v5->_slotOneLabel);
    v19 = objc_alloc_init(TSSIMUnlockCalloutLabel);
    slotTwoLabel = v5->_slotTwoLabel;
    v5->_slotTwoLabel = v19;

    v21 = v5->_slotTwoLabel;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("HARDWARE_SLOT_TWO_NAME"), &stru_10001CAA0, CFSTR("Localizable")));
    -[TSSIMUnlockCalloutLabel setText:](v21, "setText:", v23);

    -[UIImageView addSubview:](v5->_imageView, "addSubview:", v5->_slotTwoLabel);
  }
  return v5;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  uint64_t v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  double v19;
  double v20;
  double Width;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double height;
  double v32;
  double x;
  double y;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  objc_super v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  v44.receiver = self;
  v44.super_class = (Class)TSSIMUnlockListTableFooterView;
  -[TSSIMUnlockListTableFooterView layoutSubviews](&v44, "layoutSubviews");
  -[TSSIMUnlockListTableFooterView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v8 = 219.0;
  if (objc_msgSend(v7, "userInterfaceIdiom"))
  {
    *(double *)&v9 = 79.0;
    v10 = 219.0;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v11, "_referenceBounds");
    if (CGRectGetHeight(v45) <= 812.0)
    {
      v10 = 219.0;
      *(double *)&v9 = 79.0;
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[BSPlatform sharedInstance](BSPlatform, "sharedInstance"));
      v13 = objc_msgSend(v12, "homeButtonType");
      if (v13 == (id)2)
        v10 = 240.0;
      else
        v10 = 219.0;
      v9 = *((uint64_t *)&unk_100014160 + (v13 == (id)2));

    }
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  if (objc_msgSend(v14, "userInterfaceIdiom"))
  {
    v41 = 231.0;
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v15, "_referenceBounds");
    if (CGRectGetHeight(v46) <= 812.0)
    {
      v8 = 219.0;
      v41 = 231.0;
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[BSPlatform sharedInstance](BSPlatform, "sharedInstance"));
      v17 = objc_msgSend(v16, "homeButtonType");
      if (v17 == (id)2)
        v8 = 240.0;
      else
        v8 = 219.0;
      v41 = dbl_100014170[v17 == (id)2];

    }
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_imageView, "image"));
  if (v18)
  {
    -[UIImageView sizeThatFits:](self->_imageView, "sizeThatFits:", v4, v6);
    v20 = v19;
    v47.origin.x = 0.0;
    v47.origin.y = 0.0;
    v47.size.width = v4;
    v47.size.height = v20;
    v42 = *(double *)&v9;
    Width = CGRectGetWidth(v47);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_imageView, "image"));
    objc_msgSend(v22, "size");
    v40 = v4;
    v24 = v23;

    v25 = v24 / v20;
    v26 = Width - v10 * v25 + -20.0;
    -[TSSIMUnlockCalloutLabel sizeThatFits:](self->_slotOneLabel, "sizeThatFits:", v26, v20);
    v28 = v27;
    v39 = v10 * v25;
    v43 = v27 * -0.5 + v42 * v25;
    v29 = Width - v8 * v25 + -20.0;
    -[TSSIMUnlockCalloutLabel sizeThatFits:](self->_slotTwoLabel, "sizeThatFits:", v29, v20);
    height = v30;
    v32 = 0.0;
    x = v8 * v25;
    y = height * -0.5 + v41 * v25;
    v35 = v26;
    v37 = v39;
    v36 = v40;
    v38 = 0.0;
  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    v29 = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v28 = height;
    v35 = v29;
    v43 = y;
    v37 = CGRectZero.origin.x;
    v20 = height;
    v36 = v29;
    v32 = y;
    v38 = CGRectZero.origin.x;
  }
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v38, v32, v36, v20);
  -[TSSIMUnlockCalloutLabel setFrame:](self->_slotOneLabel, "setFrame:", v37, v43, v35, v28);
  -[TSSIMUnlockCalloutLabel setFrame:](self->_slotTwoLabel, "setFrame:", x, y, v29, height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  CGSize result;

  width = a3.width;
  -[UIImageView sizeThatFits:](self->_imageView, "sizeThatFits:", a3.width, a3.height);
  v5 = width;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slotTwoLabel, 0);
  objc_storeStrong((id *)&self->_slotOneLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
