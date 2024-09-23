@implementation CKBusinessInfoView

- (CKBusinessInfoView)initWithLayoutType:(int64_t)a3
{
  CKBusinessInfoView *v4;
  CKBusinessInfoView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKBusinessInfoView;
  v4 = -[CKBusinessInfoView init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_layoutType = a3;
    -[CKBusinessInfoView setup](v4, "setup");
  }
  return v5;
}

- (void)setup
{
  UILabel *v3;
  UILabel *greetingTextLabel;
  UILabel *v5;
  UILabel *descriptionTextLabel;
  CKStandardButton *v7;
  CKStandardButton *infoButton;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UILabel *v15;
  void *v16;
  void *v17;
  UILabel *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  CKStandardButton *v24;
  void *v25;
  void *v26;
  uint64_t v27;

  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
  greetingTextLabel = self->_greetingTextLabel;
  self->_greetingTextLabel = v3;

  v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
  descriptionTextLabel = self->_descriptionTextLabel;
  self->_descriptionTextLabel = v5;

  v7 = objc_alloc_init(CKStandardButton);
  infoButton = self->_infoButton;
  self->_infoButton = v7;

  -[CKBusinessInfoView addSubview:](self, "addSubview:", self->_greetingTextLabel);
  -[CKBusinessInfoView addSubview:](self, "addSubview:", self->_descriptionTextLabel);
  -[CKBusinessInfoView addSubview:](self, "addSubview:", self->_infoButton);
  -[CKStandardButton addTarget:action:forControlEvents:](self->_infoButton, "addTarget:action:forControlEvents:", self, sel_infoButtonTapped_, 64);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "theme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "businessInfoViewGreetingTextColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_greetingTextLabel, "setTextColor:", v11);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "theme");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "businessInfoViewDescriptionTextColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_descriptionTextLabel, "setTextColor:", v14);

  v15 = self->_greetingTextLabel;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "businessInfoViewGreetingTextFont");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v15, "setFont:", v17);

  v18 = self->_descriptionTextLabel;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "businessInfoViewDescriptionTextFont");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v18, "setFont:", v20);

  -[CKStandardButton titleLabel](self->_infoButton, "titleLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "businessInfoViewTitleLabelFont");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFont:", v23);

  -[UILabel setNumberOfLines:](self->_greetingTextLabel, "setNumberOfLines:", 0);
  -[UILabel setNumberOfLines:](self->_descriptionTextLabel, "setNumberOfLines:", 0);
  v24 = self->_infoButton;
  CKFrameworkBundle();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("ABOUT_BUSINESS_CHAT"), &stru_1E276D870, CFSTR("ChatKit"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKStandardButton setTitle:forState:](v24, "setTitle:forState:", v26, 0);

  -[CKStandardButton setContentEdgeInsets:](self->_infoButton, "setContentEdgeInsets:", -1.0, 0.0, -1.0, 0.0);
  if (-[CKBusinessInfoView layoutType](self, "layoutType"))
  {
    if (-[CKBusinessInfoView layoutType](self, "layoutType") != 1)
      return;
    v27 = 4;
  }
  else
  {
    v27 = 1;
    -[UILabel setTextAlignment:](self->_greetingTextLabel, "setTextAlignment:", 1);
  }
  -[UILabel setTextAlignment:](self->_descriptionTextLabel, "setTextAlignment:", v27);
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
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  int64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  void *v79;
  objc_super v80;

  v80.receiver = self;
  v80.super_class = (Class)CKBusinessInfoView;
  -[CKBusinessInfoView layoutSubviews](&v80, sel_layoutSubviews);
  -[CKBusinessInfoView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  if (!-[CKBusinessInfoView layoutType](self, "layoutType"))
  {
    v7 = -60.0;
    goto LABEL_5;
  }
  v7 = -30.0;
  if (-[CKBusinessInfoView layoutType](self, "layoutType") == 1)
  {
LABEL_5:
    -[CKBusinessInfoView bounds](self, "bounds");
    v9 = v8;
    -[CKBusinessInfoView layoutMargins](self, "layoutMargins");
    v11 = v10;
    -[CKBusinessInfoView layoutMargins](self, "layoutMargins");
    v4 = v9 - (v11 + v12) + v7;
    -[CKBusinessInfoView bounds](self, "bounds");
    v6 = v13;
  }
  -[CKBusinessInfoView greetingTextLabel](self, "greetingTextLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sizeThatFits:", v4, v6);
  v16 = v15;

  -[CKBusinessInfoView descriptionTextLabel](self, "descriptionTextLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sizeThatFits:", v4, v6);
  v19 = v18;

  -[CKBusinessInfoView infoButton](self, "infoButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sizeThatFits:", v4, v6);
  v22 = v21;

  v23 = -[CKBusinessInfoView layoutType](self, "layoutType");
  if (v23 == 1)
  {
    -[CKBusinessInfoView layoutMargins](self, "layoutMargins");
    v59 = v58 + 15.0;
    -[CKBusinessInfoView frame](self, "frame");
    v61 = v60;
    -[CKBusinessInfoView layoutMargins](self, "layoutMargins");
    v63 = v62;
    -[CKBusinessInfoView layoutMargins](self, "layoutMargins");
    v65 = v61 - (v63 + v64) + -30.0;
    -[CKBusinessInfoView descriptionTextLabel](self, "descriptionTextLabel");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setFrame:", v59, 10.0, v65, v19);

    -[CKBusinessInfoView frame](self, "frame");
    v68 = v67;
    -[CKBusinessInfoView layoutMargins](self, "layoutMargins");
    v70 = v69;
    -[CKBusinessInfoView layoutMargins](self, "layoutMargins");
    v51 = v68 - (v70 + v71) + -30.0;
    -[CKBusinessInfoView infoButton](self, "infoButton");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "sizeThatFits:", v51, 1.79769313e308);
    v74 = v73;

    if (v51 >= v74)
      v51 = v74;
    if (-[CKBusinessInfoView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      -[CKBusinessInfoView frame](self, "frame");
      v76 = v75 - v51 + -15.0;
      -[CKBusinessInfoView layoutMargins](self, "layoutMargins");
      v56 = v76 - v77;
    }
    else
    {
      -[CKBusinessInfoView layoutMargins](self, "layoutMargins");
      v56 = v78 + 15.0;
    }
    v57 = v19 + 10.0;
  }
  else
  {
    if (v23)
      return;
    v24 = *MEMORY[0x1E0C9D648];
    v25 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v26 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v27 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v28 = 15.0;
    if (-[CKBusinessInfoView hasValidGreeting](self, "hasValidGreeting"))
    {
      -[CKBusinessInfoView traitCollection](self, "traitCollection");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "verticalSizeClass");

      if (v30 != 1)
      {
        -[CKBusinessInfoView layoutMargins](self, "layoutMargins");
        v24 = v31 + 30.0;
        -[CKBusinessInfoView frame](self, "frame");
        v33 = v32;
        -[CKBusinessInfoView layoutMargins](self, "layoutMargins");
        v35 = v34;
        -[CKBusinessInfoView layoutMargins](self, "layoutMargins");
        v26 = v33 - (v35 + v36) + -60.0;
        v25 = 15.0;
        v28 = v16 + 30.0 + 15.0;
        v27 = v16;
      }
    }
    -[CKBusinessInfoView greetingTextLabel](self, "greetingTextLabel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setFrame:", v24, v25, v26, v27);

    -[CKBusinessInfoView layoutMargins](self, "layoutMargins");
    v39 = v38 + 30.0;
    -[CKBusinessInfoView frame](self, "frame");
    v41 = v40;
    -[CKBusinessInfoView layoutMargins](self, "layoutMargins");
    v43 = v42;
    -[CKBusinessInfoView layoutMargins](self, "layoutMargins");
    v45 = v41 - (v43 + v44) + -60.0;
    -[CKBusinessInfoView descriptionTextLabel](self, "descriptionTextLabel");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setFrame:", v39, v28, v45, v19);

    v47 = v19 + 0.0 + v28;
    -[CKBusinessInfoView infoButton](self, "infoButton");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBusinessInfoView frame](self, "frame");
    objc_msgSend(v48, "sizeThatFits:", v49, 1.79769313e308);
    v51 = v50;

    -[CKBusinessInfoView center](self, "center");
    v53 = v52 + v51 * -0.5;
    -[CKBusinessInfoView traitCollection](self, "traitCollection");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "displayScale");
    v56 = round(v53 * v55) / v55;
    v57 = round(v47 * v55) / v55;

  }
  -[CKBusinessInfoView infoButton](self, "infoButton");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setFrame:", v56, v57, v51, v22);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
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
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  int64_t v23;
  double v24;
  _BOOL4 v25;
  double v26;
  double v27;
  double v28;
  CGSize result;

  width = a3.width;
  if (!-[CKBusinessInfoView layoutType](self, "layoutType", a3.width, a3.height))
  {
    v6 = -60.0;
    goto LABEL_5;
  }
  v5 = 0.0;
  v6 = -30.0;
  if (-[CKBusinessInfoView layoutType](self, "layoutType") == 1)
  {
LABEL_5:
    -[CKBusinessInfoView layoutMargins](self, "layoutMargins");
    v8 = v7;
    -[CKBusinessInfoView layoutMargins](self, "layoutMargins");
    v5 = width - (v8 + v9) + v6;
  }
  -[CKBusinessInfoView greetingTextLabel](self, "greetingTextLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sizeThatFits:", v5, 1.79769313e308);
  v12 = v11;
  v14 = v13;

  -[CKBusinessInfoView descriptionTextLabel](self, "descriptionTextLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sizeThatFits:", v5, 1.79769313e308);
  v17 = v16;
  v19 = v18;

  -[CKBusinessInfoView infoButton](self, "infoButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sizeThatFits:", v5, 1.79769313e308);
  v22 = v21;

  v23 = -[CKBusinessInfoView layoutType](self, "layoutType");
  if (v23 == 1)
  {
    v27 = v19 + v22 + 10.0 + 10.0;
  }
  else if (v23)
  {
    v17 = *MEMORY[0x1E0C9D820];
    v27 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    v24 = v19 + 15.0 + v22 + 15.0;
    v25 = -[CKBusinessInfoView hasValidGreeting](self, "hasValidGreeting");
    v26 = v14 + 30.0;
    if (!v25)
      v26 = -0.0;
    v27 = v24 + v26;
    if (v12 >= v17)
      v17 = v12;
  }
  v28 = v17;
  result.height = v27;
  result.width = v28;
  return result;
}

- (void)setGreetingText:(id)a3
{
  id v5;
  void *v6;

  objc_storeStrong((id *)&self->_greetingText, a3);
  v5 = a3;
  -[CKBusinessInfoView greetingTextLabel](self, "greetingTextLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  -[CKBusinessInfoView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setDescriptionText:(id)a3
{
  id v5;
  void *v6;

  objc_storeStrong((id *)&self->_descriptionText, a3);
  v5 = a3;
  -[CKBusinessInfoView descriptionTextLabel](self, "descriptionTextLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  -[CKBusinessInfoView setNeedsLayout](self, "setNeedsLayout");
}

- (void)infoButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  -[CKBusinessInfoView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CKBusinessInfoView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[CKBusinessInfoView delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "businessInfoView:infoButtonTapped:", self, v8);

    }
  }

}

- (BOOL)hasValidGreeting
{
  void *v3;
  void *v4;
  int v5;

  -[CKBusinessInfoView greetingText](self, "greetingText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    -[CKBusinessInfoView greetingText](self, "greetingText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("$EMPTY$")) ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (CKBusinessInfoViewDelegate)delegate
{
  return (CKBusinessInfoViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (NSString)greetingText
{
  return self->_greetingText;
}

- (int64_t)layoutType
{
  return self->_layoutType;
}

- (void)setLayoutType:(int64_t)a3
{
  self->_layoutType = a3;
}

- (UILabel)greetingTextLabel
{
  return self->_greetingTextLabel;
}

- (void)setGreetingTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_greetingTextLabel, a3);
}

- (UILabel)descriptionTextLabel
{
  return self->_descriptionTextLabel;
}

- (void)setDescriptionTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionTextLabel, a3);
}

- (CKStandardButton)infoButton
{
  return self->_infoButton;
}

- (void)setInfoButton:(id)a3
{
  objc_storeStrong((id *)&self->_infoButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoButton, 0);
  objc_storeStrong((id *)&self->_descriptionTextLabel, 0);
  objc_storeStrong((id *)&self->_greetingTextLabel, 0);
  objc_storeStrong((id *)&self->_greetingText, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
