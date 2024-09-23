@implementation MFBannerView

- (MFBannerView)initWithType:(int64_t)a3 itemID:(id)a4 delegate:(id)a5
{
  double v9;
  double v10;
  double v11;
  double v12;
  MFBannerView *v13;
  MFBannerView *v14;
  void *v15;
  uint64_t v16;
  UILabel *bannerLabel;
  void *v18;
  double v19;
  double v20;
  uint64_t v21;
  UILabel *dateLabel;
  double v23;
  id v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  UIButton *editButton;
  double v35;
  double v36;
  id v37;
  NSString *v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  id obj;
  void *v61;
  _QWORD v62[4];
  id v63;
  id location;
  objc_super v65;
  _QWORD v66[4];
  _QWORD v67[2];
  _QWORD v68[4];

  v68[2] = *MEMORY[0x1E0C80C00];
  v58 = a4;
  obj = a5;
  v65.receiver = self;
  v65.super_class = (Class)MFBannerView;
  v9 = *MEMORY[0x1E0C9D648];
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v13 = -[MFMessageHeaderViewBlock initWithFrame:](&v65, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v10, v11, v12);
  v14 = v13;
  if (v13)
  {
    v13->_type = a3;
    objc_storeStrong((id *)&v13->_itemID, a4);
    objc_storeWeak((id *)&v14->_delegate, obj);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFBannerView setBackgroundColor:](v14, "setBackgroundColor:", v15);

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v9, v10, v11, v12);
    bannerLabel = v14->_bannerLabel;
    v14->_bannerLabel = (UILabel *)v16;

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v14->_bannerLabel, "setTextColor:", v18);

    -[UILabel setFont:](v14->_bannerLabel, "setFont:", v59);
    -[UILabel setNumberOfLines:](v14->_bannerLabel, "setNumberOfLines:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v14->_bannerLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v14->_bannerLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v19) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v14->_bannerLabel, "setContentCompressionResistancePriority:forAxis:", 1, v19);
    LODWORD(v20) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v14->_bannerLabel, "setContentHuggingPriority:forAxis:", 0, v20);
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v9, v10, v11, v12);
    dateLabel = v14->_dateLabel;
    v14->_dateLabel = (UILabel *)v21;

    -[UILabel setFont:](v14->_dateLabel, "setFont:", v59);
    -[UILabel setNumberOfLines:](v14->_dateLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v14->_dateLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v14->_dateLabel, "setAdjustsFontForContentSizeCategory:", 1);
    LODWORD(v23) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v14->_dateLabel, "setContentCompressionResistancePriority:forAxis:", 1, v23);
    v24 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v68[0] = v14->_bannerLabel;
    v68[1] = v14->_dateLabel;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = (void *)objc_msgSend(v24, "initWithArrangedSubviews:", v25);

    objc_msgSend(v61, "setAxis:", 1);
    objc_msgSend(v61, "setAlignment:", 1);
    LODWORD(v26) = 1148846080;
    objc_msgSend(v61, "setContentCompressionResistancePriority:forAxis:", 1, v26);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v14->_dateLabel, "setTextColor:", v27);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v14->_bannerLabel, "setTextColor:", v28);

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v14);
    v29 = (void *)MEMORY[0x1E0DC3518];
    -[MFBannerView _editButtonConfiguration](v14, "_editButtonConfiguration");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)MEMORY[0x1E0DC3428];
    v62[0] = MEMORY[0x1E0C809B0];
    v62[1] = 3221225472;
    v62[2] = __45__MFBannerView_initWithType_itemID_delegate___block_invoke;
    v62[3] = &unk_1E9A03188;
    objc_copyWeak(&v63, &location);
    objc_msgSend(v31, "actionWithHandler:", v62);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "buttonWithConfiguration:primaryAction:", v30, v32);
    v33 = objc_claimAutoreleasedReturnValue();
    editButton = v14->_editButton;
    v14->_editButton = (UIButton *)v33;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v14->_editButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v35) = 1148846080;
    -[UIButton setContentHuggingPriority:forAxis:](v14->_editButton, "setContentHuggingPriority:forAxis:", 0, v35);
    LODWORD(v36) = 1148846080;
    -[UIButton setContentHuggingPriority:forAxis:](v14->_editButton, "setContentHuggingPriority:forAxis:", 1, v36);
    v37 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
    v38 = (NSString *)objc_claimAutoreleasedReturnValue();
    LODWORD(v29) = UIContentSizeCategoryIsAccessibilityCategory(v38);

    if ((_DWORD)v29)
    {
      objc_msgSend(v61, "addArrangedSubview:", v14->_editButton);
      objc_msgSend(v61, "setCustomSpacing:afterView:", v14->_dateLabel, 12.0);
      v39 = 16.0;
      objc_msgSend(v37, "addArrangedSubview:", v61);
    }
    else
    {
      v67[0] = v61;
      v67[1] = v14->_editButton;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 2);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "mf_addArrangedSubviews:", v40);

      v39 = 8.0;
      objc_msgSend(v37, "setCustomSpacing:afterView:", v61, 8.0);
    }
    objc_msgSend(v37, "setAxis:", 0);
    objc_msgSend(v37, "setAlignment:", 3);
    objc_msgSend(v37, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MFBannerView addSubview:](v14, "addSubview:", v37);
    v41 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v37, "leadingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFBannerView layoutMarginsGuide](v14, "layoutMarginsGuide");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "leadingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:constant:", -7.0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = v52;
    objc_msgSend(v37, "topAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFBannerView topAnchor](v14, "topAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:constant:", 8.0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v66[1] = v50;
    objc_msgSend(v37, "bottomAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFBannerView bottomAnchor](v14, "bottomAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:constant:", v42, -v39);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v66[2] = v43;
    objc_msgSend(v37, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFBannerView layoutMarginsGuide](v14, "layoutMarginsGuide");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "trailingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:constant:", v46, 7.0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v66[3] = v47;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 4);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "activateConstraints:", v48);

    -[MFMessageHeaderViewBlock setSeparatorIsHidden:](v14, "setSeparatorIsHidden:", 1);
    -[MFBannerView _configureWithType:]((id *)&v14->super.super.super.super.isa);

    objc_destroyWeak(&v63);
    objc_destroyWeak(&location);

  }
  return v14;
}

void __45__MFBannerView_initWithType_itemID_delegate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bannerViewDidSelectEditButton:itemID:", v4, v3);

    WeakRetained = v4;
  }

}

- (void)_configureWithType:(id *)a1
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = objc_msgSend(a1, "type");
    if (v2 != 2)
    {
      if (v2 == 1)
      {
        objc_msgSend(a1, "viewModel");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "readLaterDate");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_updateBannerLabelTextWithReadLaterDate:", v5);
        goto LABEL_8;
      }
      if (v2)
      {
        v6 = 0;
        goto LABEL_10;
      }
    }
    v3 = (void *)MEMORY[0x1E0CB3940];
    _EFLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[66], "setText:", v5);
LABEL_8:

    _EFLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
    v12 = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0DC4B10], *MEMORY[0x1E0DC1448]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v6, v8);
    objc_msgSend(a1, "editButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "configuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAttributedTitle:", v9);
    objc_msgSend(v10, "setConfiguration:", v11);

  }
}

- (void)_updateBannerLabelTextWithReadLaterDate:(id)a3
{
  id v4;

  -[MFBannerView _readLaterStringForDate:](self, "_readLaterStringForDate:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_bannerLabel, "setText:");

}

- (id)_readLaterStringForDate:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "ef_isEarlierThanNow");
  _EFLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)displayMessageUsingViewModel:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MFBannerView;
  -[MFMessageHeaderViewBlock displayMessageUsingViewModel:](&v11, sel_displayMessageUsingViewModel_, v4);
  objc_msgSend(v4, "itemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFBannerView setItemID:](self, "setItemID:", v5);

  v6 = -[MFBannerView type](self, "type");
  if (v6)
  {
    if (v6 == 1)
    {
      objc_msgSend(v4, "readLaterDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFBannerView _updateBannerLabelTextWithReadLaterDate:](self, "_updateBannerLabelTextWithReadLaterDate:", v8);
      goto LABEL_9;
    }
    if (v6 != 2)
    {
      v8 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v4, "dateSent");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "sendLaterDate");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3578], "ef_formatDate:style:", v8, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFBannerView dateLabel](self, "dateLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v9);

}

- (id)_editButtonConfiguration
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC3520], "grayButtonConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCornerStyle:", 4);
  objc_msgSend(v2, "setButtonSize:", 1);
  return v2;
}

- (MFBannerViewDelegate)delegate
{
  return (MFBannerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (EMCollectionItemID)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
  objc_storeStrong((id *)&self->_itemID, a3);
}

- (UIButton)editButton
{
  return self->_editButton;
}

- (UILabel)bannerLabel
{
  return self->_bannerLabel;
}

- (UILabel)dateLabel
{
  return self->_dateLabel;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_bannerLabel, 0);
  objc_storeStrong((id *)&self->_editButton, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
