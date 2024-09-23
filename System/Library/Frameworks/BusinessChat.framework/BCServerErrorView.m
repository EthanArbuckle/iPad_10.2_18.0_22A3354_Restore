@implementation BCServerErrorView

- (BCServerErrorView)init
{
  BCServerErrorView *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  UIView *contentView;
  uint64_t v8;
  UILabel *messageLabel;
  void *v10;
  void *v11;
  void *v12;
  UILabel *v13;
  UIView *v14;
  UIView *v15;
  void *v16;
  void *v17;
  void *v18;
  UIView *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  UIView *v24;
  void *v25;
  void *v26;
  UILabel *v27;
  void *v28;
  UIView *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  UIView *v37;
  void *v38;
  void *v39;
  void *v40;
  UILabel *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  UIView *v46;
  void *v47;
  void *v48;
  UIView *v49;
  void *v50;
  void *v51;
  void *v52;
  UILabel *v53;
  UIView *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  UIView *v59;
  void *v60;
  void *v61;
  UIView *v62;
  UILabel *v63;
  objc_super v64;
  _QWORD v65[4];
  _QWORD v66[8];

  v66[6] = *MEMORY[0x24BDAC8D0];
  v64.receiver = self;
  v64.super_class = (Class)BCServerErrorView;
  v2 = -[BCServerErrorView init](&v64, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("ServerErrorMessageColor"), v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("ServerErrorBackgroundColor"), v3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCServerErrorView setBackgroundColor:](v2, "setBackgroundColor:", v5);
    v6 = objc_opt_new();
    contentView = v2->_contentView;
    v2->_contentView = (UIView *)v6;

    v8 = objc_opt_new();
    messageLabel = v2->_messageLabel;
    v2->_messageLabel = (UILabel *)v8;

    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v2->_messageLabel, "setFont:", v10);

    -[UILabel setTextColor:](v2->_messageLabel, "setTextColor:", v4);
    +[BCShared classBundle]();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SERVER_ERROR_MESSAGE"), &stru_24E0651E8, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v2->_messageLabel, "setText:", v12);

    -[UILabel setTextAlignment:](v2->_messageLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v2->_messageLabel, "setNumberOfLines:", 0);
    v13 = v2->_messageLabel;
    v14 = v2->_contentView;
    -[UIView addSubview:](v14, "addSubview:", v13);

    -[BCServerErrorView addSubview:](v2, "addSubview:", v2->_contentView);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v2->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v2->_messageLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v44 = (void *)MEMORY[0x24BDD1628];
    v62 = v2->_contentView;
    -[UIView topAnchor](v62, "topAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCServerErrorView topAnchor](v2, "topAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintGreaterThanOrEqualToAnchor:constant:", v58, 20.0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = v56;
    v54 = v2->_contentView;
    -[UIView leftAnchor](v54, "leftAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCServerErrorView leftAnchor](v2, "leftAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintGreaterThanOrEqualToAnchor:constant:", v50, 20.0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v66[1] = v48;
    v46 = v2->_contentView;
    -[UIView rightAnchor](v46, "rightAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCServerErrorView rightAnchor](v2, "rightAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintLessThanOrEqualToAnchor:constant:", v40, -20.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v66[2] = v38;
    v37 = v2->_contentView;
    -[UIView bottomAnchor](v37, "bottomAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCServerErrorView bottomAnchor](v2, "bottomAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintLessThanOrEqualToAnchor:constant:", v35, -20.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v66[3] = v34;
    v15 = v2->_contentView;
    -[UIView centerXAnchor](v15, "centerXAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCServerErrorView centerXAnchor](v2, "centerXAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v66[4] = v18;
    v19 = v2->_contentView;
    -[UIView centerYAnchor](v19, "centerYAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCServerErrorView centerYAnchor](v2, "centerYAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v66[5] = v22;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v66, 6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "activateConstraints:", v23);

    v47 = (void *)MEMORY[0x24BDD1628];
    v63 = v2->_messageLabel;
    -[UILabel topAnchor](v63, "topAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v2->_contentView;
    -[UIView topAnchor](v59, "topAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:", v57);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v55;
    v53 = v2->_messageLabel;
    -[UILabel leadingAnchor](v53, "leadingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v2->_contentView;
    -[UIView leadingAnchor](v49, "leadingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v45);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v65[1] = v43;
    v41 = v2->_messageLabel;
    -[UILabel trailingAnchor](v41, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v2->_contentView;
    -[UIView trailingAnchor](v24, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v65[2] = v26;
    v27 = v2->_messageLabel;
    -[UILabel bottomAnchor](v27, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v2->_contentView;
    -[UIView bottomAnchor](v29, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v65[3] = v31;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v65, 4);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "activateConstraints:", v32);

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
