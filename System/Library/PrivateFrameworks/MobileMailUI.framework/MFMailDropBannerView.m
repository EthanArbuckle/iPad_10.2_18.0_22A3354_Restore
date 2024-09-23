@implementation MFMailDropBannerView

- (MFMailDropBannerView)initWithFrame:(CGRect)a3
{
  MFMailDropBannerView *v3;
  MFMailDropBannerView *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  UILabel *downloadLabel;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  void *v15;
  uint64_t v16;
  UILabel *expirationLabel;
  UILabel *v18;
  void *v19;
  UILabel *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  UIButton *downloadIcon;
  double v25;
  void *v26;
  uint64_t v27;
  MFProgressView *progressView;
  void *v29;
  void *v30;
  uint64_t v31;
  NSLayoutConstraint *labelFirstBaseline;
  void *v33;
  void *v34;
  uint64_t v35;
  NSLayoutConstraint *expirationFirstBaseline;
  void *v37;
  void *v38;
  uint64_t v39;
  NSLayoutConstraint *expirationBottom;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  objc_super v72;
  _QWORD v73[13];

  v73[11] = *MEMORY[0x1E0C80C00];
  v72.receiver = self;
  v72.super_class = (Class)MFMailDropBannerView;
  v3 = -[MFMessageHeaderViewBlock initWithFrame:](&v72, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MFMailDropBannerView setClipsToBounds:](v3, "setClipsToBounds:", 0);
    v5 = objc_alloc(MEMORY[0x1E0DC3990]);
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v10 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], v7, v8, v9);
    downloadLabel = v4->_downloadLabel;
    v4->_downloadLabel = (UILabel *)v10;

    v12 = v4->_downloadLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v12, "setTextColor:", v13);

    v14 = v4->_downloadLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v14, "setFont:", v15);

    -[UILabel setNumberOfLines:](v4->_downloadLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_downloadLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MFMailDropBannerView addSubview:](v4, "addSubview:", v4->_downloadLabel);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v6, v7, v8, v9);
    expirationLabel = v4->_expirationLabel;
    v4->_expirationLabel = (UILabel *)v16;

    v18 = v4->_expirationLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v18, "setTextColor:", v19);

    v20 = v4->_expirationLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v20, "setFont:", v21);

    -[UILabel setNumberOfLines:](v4->_expirationLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_expirationLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MFMailDropBannerView addSubview:](v4, "addSubview:", v4->_expirationLabel);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:selector:name:object:", v4, sel_contentSizeCategoryDidChangeNotification_, *MEMORY[0x1E0DC48E8], 0);

    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3518]), "initWithFrame:", v6, v7, v8, v9);
    downloadIcon = v4->_downloadIcon;
    v4->_downloadIcon = (UIButton *)v23;

    LODWORD(v25) = -16.0;
    -[UIButton setCharge:](v4->_downloadIcon, "setCharge:", v25);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_downloadIcon, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MFMailDropBannerView tintColor](v4, "tintColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v4->_downloadIcon, "setTintColor:", v26);

    -[MFMailDropBannerView addSubview:](v4, "addSubview:", v4->_downloadIcon);
    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC68F0]), "initWithProgressViewStyle:stroke:frame:", 0, 2.0, 0.0, 0.0, 26.0, 26.0);
    progressView = v4->_progressView;
    v4->_progressView = (MFProgressView *)v27;

    -[MFProgressView setTranslatesAutoresizingMaskIntoConstraints:](v4->_progressView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MFProgressView setHidden:](v4->_progressView, "setHidden:", 1);
    -[MFMailDropBannerView addSubview:](v4, "addSubview:", v4->_progressView);
    -[MFMailDropBannerView layoutMarginsGuide](v4, "layoutMarginsGuide");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel firstBaselineAnchor](v4->_downloadLabel, "firstBaselineAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailDropBannerView topAnchor](v4, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30, 0.0);
    v31 = objc_claimAutoreleasedReturnValue();
    labelFirstBaseline = v4->_labelFirstBaseline;
    v4->_labelFirstBaseline = (NSLayoutConstraint *)v31;

    -[UILabel firstBaselineAnchor](v4->_expirationLabel, "firstBaselineAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel lastBaselineAnchor](v4->_downloadLabel, "lastBaselineAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34, 0.0);
    v35 = objc_claimAutoreleasedReturnValue();
    expirationFirstBaseline = v4->_expirationFirstBaseline;
    v4->_expirationFirstBaseline = (NSLayoutConstraint *)v35;

    -[UILabel bottomAnchor](v4->_expirationLabel, "bottomAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailDropBannerView bottomAnchor](v4, "bottomAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:constant:", v38, 0.0);
    v39 = objc_claimAutoreleasedReturnValue();
    expirationBottom = v4->_expirationBottom;
    v4->_expirationBottom = (NSLayoutConstraint *)v39;

    v73[0] = v4->_labelFirstBaseline;
    -[UILabel leadingAnchor](v4->_downloadLabel, "leadingAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "leadingAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintEqualToAnchor:");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v73[1] = v64;
    -[UILabel trailingAnchor](v4->_downloadLabel, "trailingAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessageHeaderViewBlock trailingAccessoryViewLayoutGuide](v4, "trailingAccessoryViewLayoutGuide");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "leadingAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintLessThanOrEqualToAnchor:");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v73[2] = v61;
    v73[3] = v4->_expirationFirstBaseline;
    v73[4] = v4->_expirationBottom;
    -[UILabel leadingAnchor](v4->_expirationLabel, "leadingAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel leadingAnchor](v4->_downloadLabel, "leadingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v73[5] = v59;
    -[UILabel trailingAnchor](v4->_expirationLabel, "trailingAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessageHeaderViewBlock trailingAccessoryViewLayoutGuide](v4, "trailingAccessoryViewLayoutGuide");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "leadingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintLessThanOrEqualToAnchor:");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v73[6] = v56;
    -[UIButton centerXAnchor](v4->_downloadIcon, "centerXAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessageHeaderViewBlock trailingAccessoryViewLayoutGuide](v4, "trailingAccessoryViewLayoutGuide");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "centerXAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToAnchor:");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v73[7] = v53;
    -[UIButton centerYAnchor](v4->_downloadIcon, "centerYAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailDropBannerView centerYAnchor](v4, "centerYAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v51);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v73[8] = v41;
    -[MFProgressView centerXAnchor](v4->_progressView, "centerXAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessageHeaderViewBlock trailingAccessoryViewLayoutGuide](v4, "trailingAccessoryViewLayoutGuide");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "centerXAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v73[9] = v45;
    -[MFProgressView centerYAnchor](v4->_progressView, "centerYAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailDropBannerView centerYAnchor](v4, "centerYAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v73[10] = v48;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 11);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v49);
  }
  return v4;
}

- (void)setBannerState:(unint64_t)a3
{
  void *v3;
  uint64_t v4;

  if (self->_metaData)
  {
    objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler", MEMORY[0x1E0C809B0], 3221225472, __39__MFMailDropBannerView_setBannerState___block_invoke, &unk_1E9A03360, self, a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "performBlock:", &v4);

  }
}

void __39__MFMailDropBannerView_setBannerState___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v1 + 576) == v2)
    return;
  *(_QWORD *)(v1 + 576) = v2;
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 568), "isInvalid");
  v5 = *(_QWORD *)(a1 + 32);
  if ((v4 & 1) != 0)
  {
    v6 = 5;
LABEL_6:
    *(_QWORD *)(v5 + 576) = v6;
    goto LABEL_7;
  }
  if (objc_msgSend(*(id *)(v5 + 568), "isExpired"))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 4;
    goto LABEL_6;
  }
LABEL_7:
  objc_msgSend(*(id *)(a1 + 32), "_setupDownloadLabel");
  objc_msgSend(*(id *)(a1 + 32), "_setupExpirationLabel");
  objc_msgSend(*(id *)(a1 + 32), "_setupDownloadIcon");
  if (*(_QWORD *)(a1 + 40) == 3)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "progressDidFinish");
  objc_msgSend(*(id *)(a1 + 32), "superview");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNeedsLayout");

}

- (BOOL)_hasDataLocally
{
  return -[MFMailDropBannerView bannerState](self, "bannerState") == 3;
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageHeaderViewBlock displayMetrics](self, "displayMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "avatarDiameterForCurrentContentSize");
  -[NSLayoutConstraint setConstant:](self->_iconWrapperWidth, "setConstant:");

  objc_msgSend(v3, "_bodyLeading");
  -[NSLayoutConstraint setConstant:](self->_labelFirstBaseline, "setConstant:", v6 * 1.11111111);
  objc_msgSend(v4, "_bodyLeading");
  -[NSLayoutConstraint setConstant:](self->_expirationFirstBaseline, "setConstant:", v7 * 1.125);
  objc_msgSend(v3, "_bodyLeading");
  -[NSLayoutConstraint setConstant:](self->_expirationBottom, "setConstant:", v8 * -0.666666667);
  v9.receiver = self;
  v9.super_class = (Class)MFMailDropBannerView;
  -[MFMessageHeaderViewBlock updateConstraints](&v9, sel_updateConstraints);

}

- (void)_setupDownloadLabel
{
  char v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = -[EMMailDropMetadata flags](self->_metaData, "flags");
  switch(self->_bannerState)
  {
    case 1uLL:
      if ((-[EMMailDropMetadata flags](self->_metaData, "flags") & 2) != 0)
      {
        if ((-[EMMailDropMetadata flags](self->_metaData, "flags") & 4) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MAIL_DROP_BANNER_SAVE_MIXED"), &stru_1E9A04480, CFSTR("Main"));
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MAIL_DROP_BANNER_SAVE_IMAGE"), &stru_1E9A04480, CFSTR("Main"));
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        if ((v3 & 0x10) != 0)
        {
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MAIL_DROP_BANNER_SAVE_NONIMAGE_PLURAL"), &stru_1E9A04480, CFSTR("Main"));
        }
        else
        {
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MAIL_DROP_BANNER_SAVE_NONIMAGE"), &stru_1E9A04480, CFSTR("Main"));
        }
      }
      goto LABEL_33;
    case 2uLL:
      if ((-[EMMailDropMetadata flags](self->_metaData, "flags") & 2) != 0)
      {
        if ((-[EMMailDropMetadata flags](self->_metaData, "flags") & 4) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MAIL_DROP_BANNER_DOWNLOADING_IMAGES"), &stru_1E9A04480, CFSTR("Main"));
          v5 = objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        }
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        if ((v3 & 0x10) != 0)
        {
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MAIL_DROP_BANNER_DOWNLOADING_MIXED_PLURAL"), &stru_1E9A04480, CFSTR("Main"));
        }
        else
        {
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MAIL_DROP_BANNER_DOWNLOADING_MIXED"), &stru_1E9A04480, CFSTR("Main"));
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        if ((v3 & 0x10) != 0)
        {
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MAIL_DROP_BANNER_DOWNLOADING_NONIMAGE_PLURAL"), &stru_1E9A04480, CFSTR("Main"));
        }
        else
        {
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MAIL_DROP_BANNER_DOWNLOADING_NONIMAGE"), &stru_1E9A04480, CFSTR("Main"));
        }
      }
LABEL_33:
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_15:
      v6 = (id)v5;

      -[UILabel setText:](self->_downloadLabel, "setText:", v6);
      return;
    case 3uLL:
      if ((-[EMMailDropMetadata flags](self->_metaData, "flags") & 2) != 0)
      {
        if ((-[EMMailDropMetadata flags](self->_metaData, "flags") & 4) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MAIL_DROP_BANNER_DOWNLOADED_MIXED"), &stru_1E9A04480, CFSTR("Main"));
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MAIL_DROP_BANNER_DOWNLOADED_IMAGE"), &stru_1E9A04480, CFSTR("Main"));
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        if ((v3 & 0x10) != 0)
        {
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MAIL_DROP_BANNER_DOWNLOADED_PLURAL"), &stru_1E9A04480, CFSTR("Main"));
        }
        else
        {
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MAIL_DROP_BANNER_DOWNLOADED"), &stru_1E9A04480, CFSTR("Main"));
        }
      }
      goto LABEL_33;
    case 4uLL:
      if ((-[EMMailDropMetadata flags](self->_metaData, "flags") & 2) != 0)
      {
        if ((-[EMMailDropMetadata flags](self->_metaData, "flags") & 4) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MAIL_DROP_BANNER_ATTACHMENT"), &stru_1E9A04480, CFSTR("Main"));
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MAIL_DROP_BANNER_FULL_RES"), &stru_1E9A04480, CFSTR("Main"));
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        if ((v3 & 0x10) != 0)
        {
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MAIL_DROP_BANNER_ATTACHMENT_PLURAL"), &stru_1E9A04480, CFSTR("Main"));
        }
        else
        {
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MAIL_DROP_BANNER_ATTACHMENT"), &stru_1E9A04480, CFSTR("Main"));
        }
      }
      goto LABEL_33;
    default:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MAIL_DROP_BANNER_ERROR"), &stru_1E9A04480, CFSTR("Main"));
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
  }
}

- (void)_setupExpirationLabel
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1D56AF000, log, OS_LOG_TYPE_ERROR, "#Attachments nil date string result for meta data [%@] expiration [%@]", buf, 0x16u);

}

- (void)_setupDownloadIcon
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__MFMailDropBannerView__setupDownloadIcon__block_invoke;
  aBlock[3] = &unk_1E9A03388;
  aBlock[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__MFMailDropBannerView__setupDownloadIcon__block_invoke_2;
  v4[3] = &unk_1E9A033B0;
  v4[4] = self;
  v2 = _Block_copy(aBlock);
  v5 = v2;
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performBlock:", v4);

}

void __42__MFMailDropBannerView__setupDownloadIcon__block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a2;
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 520);
  v9 = v5;
  objc_msgSend(MEMORY[0x1E0DC3870], "mf_systemImageNamed:forView:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:forState:", v7, 0);

  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 520);
  if (a3)
    objc_msgSend(v8, "addTarget:action:forControlEvents:");
  else
    objc_msgSend(v8, "removeTarget:action:forControlEvents:");

}

uint64_t __42__MFMailDropBannerView__setupDownloadIcon__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void (*v3)(void);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "setHidden:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "setHidden:", 0);
  switch(objc_msgSend(*(id *)(a1 + 32), "bannerState"))
  {
    case 2:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "setHidden:", 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "setHidden:", 1);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "sizeToFit");
      objc_msgSend(*(id *)(a1 + 32), "bringSubviewToFront:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 528));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "setNeedsDisplay");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "removeTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel_startDownload_, 64);
      goto LABEL_8;
    case 3:
      v2 = *(_QWORD *)(a1 + 40);
      goto LABEL_6;
    case 4:
    case 5:
      v2 = *(_QWORD *)(a1 + 40);
LABEL_6:
      v3 = *(void (**)(void))(v2 + 16);
      goto LABEL_7;
    default:
      v3 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_7:
      v3();
LABEL_8:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "sizeToFit");
      objc_msgSend(*(id *)(a1 + 32), "bringSubviewToFront:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 520));
      return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "setNeedsDisplay");
  }
}

- (void)startDownload:(id)a3
{
  id WeakRetained;

  -[MFMailDropBannerView setBannerState:](self, "setBannerState:", 2);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "mailDropBannerDidTriggerDownload:", self);

}

- (void)setDownloadProgress:(double)a3
{
  self->_downloadProgress = a3;
  if (-[MFMailDropBannerView _shouldDisplayProgress](self, "_shouldDisplayProgress"))
    -[MFProgressView setProgress:](self->_progressView, "setProgress:", a3);
}

- (BOOL)_shouldDisplayProgress
{
  return -[MFMailDropBannerView bannerState](self, "bannerState") == 2;
}

- (void)contentSizeCategoryDidChangeNotification:(id)a3
{
  UILabel *downloadLabel;
  void *v5;
  UILabel *expirationLabel;
  void *v7;

  downloadLabel = self->_downloadLabel;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](downloadLabel, "setFont:", v5);

  expirationLabel = self->_expirationLabel;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](expirationLabel, "setFont:", v7);

  -[MFMailDropBannerView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  -[MFMailDropBannerView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (BOOL)shouldPresent
{
  return self->_metaData != 0;
}

- (void)setSeparatorIsHidden:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFMailDropBannerView;
  -[MFMessageHeaderViewBlock setSeparatorIsHidden:](&v3, sel_setSeparatorIsHidden_, 0);
}

- (EMMailDropMetadata)metaData
{
  return self->_metaData;
}

- (void)setMetaData:(id)a3
{
  objc_storeStrong((id *)&self->_metaData, a3);
}

- (unint64_t)bannerState
{
  return self->_bannerState;
}

- (double)downloadProgress
{
  return self->_downloadProgress;
}

- (MFMailDropBannerDelegate)delegate
{
  return (MFMailDropBannerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_expirationBottom, 0);
  objc_storeStrong((id *)&self->_expirationFirstBaseline, 0);
  objc_storeStrong((id *)&self->_labelFirstBaseline, 0);
  objc_storeStrong((id *)&self->_iconWrapperWidth, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_downloadIcon, 0);
  objc_storeStrong((id *)&self->_downloadLabel, 0);
  objc_storeStrong((id *)&self->_expirationLabel, 0);
}

@end
