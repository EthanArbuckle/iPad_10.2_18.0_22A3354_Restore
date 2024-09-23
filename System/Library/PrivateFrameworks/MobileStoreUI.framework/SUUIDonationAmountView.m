@implementation SUUIDonationAmountView

- (SUUIDonationAmountView)initWithCharity:(id)a3
{
  id v5;
  SUUIDonationAmountView *v6;
  SUUIDonationAmountView *v7;
  id *p_charity;
  uint64_t v9;
  UIScrollView *v10;
  UIScrollView *scrollView;
  void *v12;
  UILabel *v13;
  UILabel *amountDisclaimerLabel;
  UILabel *v15;
  void *v16;
  UILabel *v17;
  void *v18;
  void *v19;
  UILabel *v20;
  UILabel *descriptionLabel;
  UILabel *v22;
  void *v23;
  UILabel *v24;
  void *v25;
  void *v26;
  UILabel *v27;
  UILabel *legalTextLabel;
  UILabel *v29;
  void *v30;
  UILabel *v31;
  void *v32;
  uint64_t v33;
  UILabel *v34;
  UILabel *legalText2Label;
  UILabel *v36;
  void *v37;
  UILabel *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSArray *amountButtons;
  NSArray *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  UIView *v49;
  UIView *separatorView;
  UIView *v51;
  void *v52;
  void *v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  objc_super v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v60.receiver = self;
  v60.super_class = (Class)SUUIDonationAmountView;
  v6 = -[SUUIDonationAmountView init](&v60, sel_init);
  v7 = v6;
  if (v6)
  {
    p_charity = (id *)&v6->_charity;
    objc_storeStrong((id *)&v6->_charity, a3);
    v7->_selectedAmountIndex = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (UIScrollView *)objc_alloc_init(MEMORY[0x24BEBD918]);
    scrollView = v7->_scrollView;
    v7->_scrollView = v10;

    -[UIScrollView setAlwaysBounceVertical:](v7->_scrollView, "setAlwaysBounceVertical:", 0);
    -[UIScrollView setBackgroundColor:](v7->_scrollView, "setBackgroundColor:", v9);
    -[SUUIDonationAmountView addSubview:](v7, "addSubview:", v7->_scrollView);
    objc_msgSend(*p_charity, "amountDisclaimer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
      amountDisclaimerLabel = v7->_amountDisclaimerLabel;
      v7->_amountDisclaimerLabel = v13;

      -[UILabel setBackgroundColor:](v7->_amountDisclaimerLabel, "setBackgroundColor:", v9);
      v15 = v7->_amountDisclaimerLabel;
      objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 13.0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v15, "setFont:", v16);

      -[UILabel setNumberOfLines:](v7->_amountDisclaimerLabel, "setNumberOfLines:", 0);
      -[UILabel setText:](v7->_amountDisclaimerLabel, "setText:", v12);
      -[UILabel setTextAlignment:](v7->_amountDisclaimerLabel, "setTextAlignment:", 1);
      v17 = v7->_amountDisclaimerLabel;
      objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v17, "setTextColor:", v18);

      -[UIScrollView addSubview:](v7->_scrollView, "addSubview:", v7->_amountDisclaimerLabel);
    }
    objc_msgSend(*p_charity, "charityDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
      descriptionLabel = v7->_descriptionLabel;
      v7->_descriptionLabel = v20;

      -[UILabel setBackgroundColor:](v7->_descriptionLabel, "setBackgroundColor:", v9);
      v22 = v7->_descriptionLabel;
      objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 17.0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v22, "setFont:", v23);

      -[UILabel setNumberOfLines:](v7->_descriptionLabel, "setNumberOfLines:", 0);
      -[UILabel setText:](v7->_descriptionLabel, "setText:", v19);
      -[UILabel setTextAlignment:](v7->_descriptionLabel, "setTextAlignment:", 1);
      v24 = v7->_descriptionLabel;
      objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v24, "setTextColor:", v25);

      -[UIScrollView addSubview:](v7->_scrollView, "addSubview:", v7->_descriptionLabel);
    }
    objc_msgSend(*p_charity, "legalText");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
      legalTextLabel = v7->_legalTextLabel;
      v7->_legalTextLabel = v27;

      -[UILabel setBackgroundColor:](v7->_legalTextLabel, "setBackgroundColor:", v9);
      v29 = v7->_legalTextLabel;
      objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 13.0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v29, "setFont:", v30);

      -[UILabel setNumberOfLines:](v7->_legalTextLabel, "setNumberOfLines:", 0);
      -[UILabel setText:](v7->_legalTextLabel, "setText:", v26);
      v31 = v7->_legalTextLabel;
      objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v31, "setTextColor:", v32);

      -[UIScrollView addSubview:](v7->_scrollView, "addSubview:", v7->_legalTextLabel);
    }
    objc_msgSend(*p_charity, "legalText2");
    v33 = objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      v34 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
      legalText2Label = v7->_legalText2Label;
      v7->_legalText2Label = v34;

      -[UILabel setBackgroundColor:](v7->_legalText2Label, "setBackgroundColor:", v9);
      v36 = v7->_legalText2Label;
      objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 11.0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v36, "setFont:", v37);

      -[UILabel setNumberOfLines:](v7->_legalText2Label, "setNumberOfLines:", 0);
      -[UILabel setText:](v7->_legalText2Label, "setText:", v33);
      v38 = v7->_legalText2Label;
      objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v38, "setTextColor:", v39);

      -[UIScrollView addSubview:](v7->_scrollView, "addSubview:", v7->_legalText2Label);
    }
    v54 = (void *)v33;
    v55 = (void *)v9;
    objc_msgSend(*p_charity, "donationAmounts");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    SUUIGiftAmountButtonsWithAmounts(v40);
    v41 = objc_claimAutoreleasedReturnValue();
    amountButtons = v7->_amountButtons;
    v7->_amountButtons = (NSArray *)v41;

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v43 = v7->_amountButtons;
    v44 = -[NSArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v45; ++i)
        {
          if (*(_QWORD *)v57 != v46)
            objc_enumerationMutation(v43);
          v48 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
          objc_msgSend(v48, "addTarget:action:forControlEvents:", v7, sel__amountButtonDown_, 1);
          objc_msgSend(v48, "addTarget:action:forControlEvents:", v7, sel__amountButtonUpInside_, 64);
          objc_msgSend(v48, "addTarget:action:forControlEvents:", v7, sel__amountButtonUpOutside_, 128);
          -[UIScrollView addSubview:](v7->_scrollView, "addSubview:", v48);
        }
        v45 = -[NSArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
      }
      while (v45);
    }

    v49 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    separatorView = v7->_separatorView;
    v7->_separatorView = v49;

    v51 = v7->_separatorView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "separatorColor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v51, "setBackgroundColor:", v52);

    -[UIScrollView addSubview:](v7->_scrollView, "addSubview:", v7->_separatorView);
  }

  return v7;
}

- (void)dealloc
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_amountButtons;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)SUUIDonationAmountView;
  -[SUUIDonationAmountView dealloc](&v8, sel_dealloc);
}

- (UIImage)logoImage
{
  return -[UIImageView image](self->_logoImageView, "image");
}

- (SUUIGiftAmount)selectedAmount
{
  void *v3;
  unint64_t selectedAmountIndex;
  void *v5;

  -[SUUIGiftCharity donationAmounts](self->_charity, "donationAmounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  selectedAmountIndex = self->_selectedAmountIndex;
  if (selectedAmountIndex >= objc_msgSend(v3, "count"))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectAtIndex:", self->_selectedAmountIndex);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (SUUIGiftAmount *)v5;
}

- (void)setLogoImage:(id)a3
{
  id v4;
  void *v5;
  UIImageView *logoImageView;
  UIImageView *v7;
  UIImageView *v8;
  UIImageView *v9;
  void *v10;
  UIImageView *v11;
  void *v12;
  UIImageView *v13;
  id v14;

  v14 = a3;
  -[SUUIDonationAmountView logoImage](self, "logoImage");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v14;
  if (v4 != v14)
  {
    logoImageView = self->_logoImageView;
    if (v14)
    {
      if (!logoImageView)
      {
        v7 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
        v8 = self->_logoImageView;
        self->_logoImageView = v7;

        v9 = self->_logoImageView;
        -[SUUIGiftCharity name](self->_charity, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView setAccessibilityLabel:](v9, "setAccessibilityLabel:", v10);

        v11 = self->_logoImageView;
        -[SUUIDonationAmountView backgroundColor](self, "backgroundColor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView setBackgroundColor:](v11, "setBackgroundColor:", v12);

        -[UIImageView setContentMode:](self->_logoImageView, "setContentMode:", 1);
        -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_logoImageView);
        logoImageView = self->_logoImageView;
      }
      -[UIImageView setImage:](logoImageView, "setImage:", v14);
      -[SUUIDonationAmountView setNeedsLayout](self, "setNeedsLayout");
    }
    else
    {
      -[UIImageView removeFromSuperview](logoImageView, "removeFromSuperview");
      v13 = self->_logoImageView;
      self->_logoImageView = 0;

    }
    v5 = v14;
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  double v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  UIImageView *logoImageView;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  UILabel *descriptionLabel;
  double v24;
  CGFloat v25;
  double MaxY;
  void *v27;
  uint64_t v28;
  double v29;
  float v30;
  NSArray *amountButtons;
  double v32;
  void *v33;
  uint64_t v34;
  double v35;
  UILabel *amountDisclaimerLabel;
  double v37;
  CGFloat v38;
  double v39;
  void *v40;
  uint64_t v41;
  double v42;
  void *v43;
  uint64_t v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  uint64_t v50;
  double v51;
  CGFloat v52;
  double v53;
  void *v54;
  uint64_t v55;
  double v56;
  double v57;
  UILabel *legalTextLabel;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  double v63;
  void *v64;
  uint64_t v65;
  double v66;
  UILabel *legalText2Label;
  double v68;
  CGFloat v69;
  double v70;
  CGFloat v71;
  _QWORD v72[9];
  uint64_t v73;
  double *v74;
  uint64_t v75;
  uint64_t v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;

  -[SUUIDonationAmountView bounds](self, "bounds");
  v4 = v3;
  -[UIScrollView setFrame:](self->_scrollView, "setFrame:");
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v7 = 30.0;
  else
    v7 = 15.0;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  if ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v10 = 30.0;
  else
    v10 = 15.0;
  v11 = v4 - v10;
  -[SUUIGiftCharity logoArtwork](self->_charity, "logoArtwork");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = (double)objc_msgSend(v12, "height");
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scale");
    *(float *)&v16 = v14 / v16;
    v17 = floorf(*(float *)&v16);

    logoImageView = self->_logoImageView;
    if (logoImageView)
    {
      -[UIImageView frame](logoImageView, "frame");
      -[UIImageView setFrame:](self->_logoImageView, "setFrame:", v7, 20.0, v11 - v7, v17);
    }
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "userInterfaceIdiom");

    v21 = 5.0;
    if ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v21 = 16.0;
    v22 = v21 + v17 + 20.0;
  }
  else
  {
    v22 = 20.0;
  }
  descriptionLabel = self->_descriptionLabel;
  if (descriptionLabel)
  {
    -[UILabel sizeThatFits:](descriptionLabel, "sizeThatFits:", v11 - v7, 1.79769313e308);
    v25 = v24;
    -[UILabel setFrame:](self->_descriptionLabel, "setFrame:", v7, v22, v11 - v7, v24);
    v77.origin.x = v7;
    v77.origin.y = v22;
    v77.size.width = v11 - v7;
    v77.size.height = v25;
    MaxY = CGRectGetMaxY(v77);
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "userInterfaceIdiom");

    v29 = 35.0;
    if ((v28 & 0xFFFFFFFFFFFFFFFBLL) != 1)
      v29 = 25.0;
    v22 = MaxY + v29;
  }
  if (-[NSArray count](self->_amountButtons, "count"))
  {
    v73 = 0;
    v74 = (double *)&v73;
    v30 = (v4 + -223.0) * 0.5;
    v75 = 0x2020000000;
    v76 = 0;
    amountButtons = self->_amountButtons;
    v72[0] = MEMORY[0x24BDAC760];
    v72[1] = 3221225472;
    v72[2] = __40__SUUIDonationAmountView_layoutSubviews__block_invoke;
    v72[3] = &unk_2511FDBB8;
    *(double *)&v72[6] = floorf(v30);
    *(double *)&v72[7] = v7;
    *(double *)&v72[8] = v22;
    v72[4] = &v73;
    v72[5] = 3;
    -[NSArray enumerateObjectsUsingBlock:](amountButtons, "enumerateObjectsUsingBlock:", v72);
    v32 = v74[3];
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "userInterfaceIdiom");

    v35 = 16.0;
    if ((v34 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v35 = 26.0;
    v22 = v32 + v35;
    _Block_object_dispose(&v73, 8);
  }
  amountDisclaimerLabel = self->_amountDisclaimerLabel;
  if (amountDisclaimerLabel)
  {
    -[UILabel sizeThatFits:](amountDisclaimerLabel, "sizeThatFits:", v11 - v7, 1.79769313e308);
    v38 = v37;
    -[UILabel setFrame:](self->_amountDisclaimerLabel, "setFrame:", v7, v22, v11 - v7, v37);
    v78.origin.x = v7;
    v78.origin.y = v22;
    v78.size.width = v11 - v7;
    v78.size.height = v38;
    v39 = CGRectGetMaxY(v78);
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "userInterfaceIdiom");

    v42 = 17.0;
    if ((v41 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v42 = 21.0;
    v22 = v39 + v42;
  }
  -[UIView frame](self->_separatorView, "frame");
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "userInterfaceIdiom");

  if ((v44 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v45 = 30.0;
  else
    v45 = 15.0;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "scale");
  v48 = 1.0 / v47;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "userInterfaceIdiom");

  if ((v50 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v51 = 30.0;
  else
    v51 = 15.0;
  v52 = v4 - v51 - v45;
  -[UIView setFrame:](self->_separatorView, "setFrame:", v45, v22, v52, v48);
  v79.origin.x = v45;
  v79.origin.y = v22;
  v79.size.width = v52;
  v79.size.height = v48;
  v53 = CGRectGetMaxY(v79);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "userInterfaceIdiom");

  v56 = 16.0;
  if ((v55 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v56 = 20.0;
  v57 = v53 + v56;
  legalTextLabel = self->_legalTextLabel;
  if (legalTextLabel)
  {
    -[UILabel sizeThatFits:](legalTextLabel, "sizeThatFits:", v11 - v7, 1.79769313e308);
    v60 = v59;
    v62 = v61;
    -[UILabel setFrame:](self->_legalTextLabel, "setFrame:", v7, v57, v59, v61);
    v80.origin.x = v7;
    v80.origin.y = v57;
    v80.size.width = v60;
    v80.size.height = v62;
    v63 = CGRectGetMaxY(v80);
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v64, "userInterfaceIdiom");

    v66 = 23.0;
    if ((v65 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v66 = 18.0;
    v57 = v63 + v66;
  }
  legalText2Label = self->_legalText2Label;
  if (legalText2Label)
  {
    -[UILabel sizeThatFits:](legalText2Label, "sizeThatFits:", v11 - v7, 1.79769313e308);
    v69 = v68;
    v71 = v70;
    -[UILabel setFrame:](self->_legalText2Label, "setFrame:", v7, v57, v68, v70);
    v81.origin.x = v7;
    v81.origin.y = v57;
    v81.size.width = v69;
    v81.size.height = v71;
    v57 = CGRectGetMaxY(v81);
  }
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v4, v57 + 20.0);

}

void __40__SUUIDonationAmountView_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  double v6;
  CGFloat v7;
  unint64_t v8;
  CGFloat v9;
  CGFloat v10;
  double MaxY;
  uint64_t v12;
  CGRect v13;

  v5 = a2;
  objc_msgSend(v5, "frame");
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(double *)(a1 + 48) + (double)(uint64_t)(a3 % v8) * 65.0 + (float)((float)(uint64_t)(a3 % v8) * 14.0);
  v10 = *(double *)(a1 + 64) + (double)(uint64_t)(a3 / v8) * v6 + (float)((float)(uint64_t)(a3 / v8) * 14.0);
  objc_msgSend(v5, "setFrame:", v9, v10, 65.0);

  v13.origin.x = v9;
  v13.origin.y = v10;
  v13.size.width = 65.0;
  v13.size.height = v7;
  MaxY = CGRectGetMaxY(v13);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (MaxY < *(double *)(v12 + 24))
    MaxY = *(double *)(v12 + 24);
  *(double *)(v12 + 24) = MaxY;
}

- (void)_amountButtonDown:(id)a3
{
  NSUInteger v4;
  int64_t selectedAmountIndex;
  int64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = -[NSArray indexOfObjectIdenticalTo:](self->_amountButtons, "indexOfObjectIdenticalTo:");
  selectedAmountIndex = self->_selectedAmountIndex;
  if (selectedAmountIndex == v4)
  {
    objc_msgSend(v8, "setSelected:", 0);
  }
  else
  {
    v6 = v4;
    if (selectedAmountIndex != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSArray objectAtIndex:](self->_amountButtons, "objectAtIndex:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setSelected:", 0);

    }
    self->_selectedAmountIndex = v6;
  }

}

- (void)_amountButtonUpInside:(id)a3
{
  NSArray *amountButtons;
  id v5;
  id v6;

  amountButtons = self->_amountButtons;
  v5 = a3;
  self->_selectedAmountIndex = -[NSArray indexOfObjectIdenticalTo:](amountButtons, "indexOfObjectIdenticalTo:", v5);
  objc_msgSend(v5, "setSelected:", 1);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("SUUIDonationAmountViewChangedNotification"), self);

}

- (void)_amountButtonUpOutside:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (self->_selectedAmountIndex == -[NSArray indexOfObjectIdenticalTo:](self->_amountButtons, "indexOfObjectIdenticalTo:"))
  {
    self->_selectedAmountIndex = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v5, "setSelected:", 0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("SUUIDonationAmountViewChangedNotification"), self);

  }
}

- (SUUIGiftCharity)charity
{
  return self->_charity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_logoImageView, 0);
  objc_storeStrong((id *)&self->_legalText2Label, 0);
  objc_storeStrong((id *)&self->_legalTextLabel, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_charity, 0);
  objc_storeStrong((id *)&self->_amountDisclaimerLabel, 0);
  objc_storeStrong((id *)&self->_amountButtons, 0);
}

@end
