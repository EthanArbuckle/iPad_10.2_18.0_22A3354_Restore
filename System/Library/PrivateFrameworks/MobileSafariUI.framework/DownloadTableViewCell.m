@implementation DownloadTableViewCell

+ (id)tableViewCellForSizeEstimation
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStyle:reuseIdentifier:", 0, 0);
  objc_msgSend(v2, "_updateCellContentsForSizing");
  return v2;
}

- (DownloadTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  DownloadTableViewCell *v4;
  DownloadTableViewCell *v5;
  void *v6;
  uint64_t v7;
  UILabel *nameLabel;
  uint64_t v9;
  UILabel *statusLabel;
  void *v11;
  void *v12;
  uint64_t v13;
  UIButton *cancelButton;
  uint64_t v15;
  UIButton *revealButton;
  uint64_t v17;
  UIButton *resumeButton;
  uint64_t v19;
  UIProgressView *progressView;
  id v21;
  void *v22;
  void *v23;
  double v24;
  id v25;
  void *v26;
  void *v27;
  double v28;
  UIImageView *v29;
  UIImageView *iconView;
  UIImageView *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  DownloadTableViewCell *v45;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
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
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  objc_super v77;
  _QWORD v78[12];
  _QWORD v79[3];
  _QWORD v80[5];

  v80[3] = *MEMORY[0x1E0C80C00];
  v77.receiver = self;
  v77.super_class = (Class)DownloadTableViewCell;
  v4 = -[DownloadTableViewCell initWithStyle:reuseIdentifier:](&v77, sel_initWithStyle_reuseIdentifier_, 3, a4);
  v5 = v4;
  if (v4)
  {
    -[DownloadTableViewCell contentView](v4, "contentView");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[DownloadTableViewCell layoutManager](v5, "layoutManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setLayoutMargins:", 10.0, 0.0, 10.0, 0.0);
    v75 = v6;
    objc_msgSend(v6, "textLabelForCell:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    nameLabel = v5->_nameLabel;
    v5->_nameLabel = (UILabel *)v7;

    -[UILabel setAdjustsFontForContentSizeCategory:](v5->_nameLabel, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(v6, "detailTextLabelForCell:", v5);
    v9 = objc_claimAutoreleasedReturnValue();
    statusLabel = v5->_statusLabel;
    v5->_statusLabel = (UILabel *)v9;

    -[UILabel setAdjustsFontForContentSizeCategory:](v5->_statusLabel, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC1350], "safari_monospacedDigitFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_statusLabel, "setFont:", v11);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5->_statusLabel, "setTextColor:", v12);

    -[DownloadTableViewCell _buttonWithSymbolName:](v5, "_buttonWithSymbolName:", CFSTR("xmark"));
    v13 = objc_claimAutoreleasedReturnValue();
    cancelButton = v5->_cancelButton;
    v5->_cancelButton = (UIButton *)v13;

    -[DownloadTableViewCell _buttonWithSymbolName:](v5, "_buttonWithSymbolName:", CFSTR("magnifyingglass"));
    v15 = objc_claimAutoreleasedReturnValue();
    revealButton = v5->_revealButton;
    v5->_revealButton = (UIButton *)v15;

    -[DownloadTableViewCell _buttonWithSymbolName:](v5, "_buttonWithSymbolName:", CFSTR("arrow.clockwise"));
    v17 = objc_claimAutoreleasedReturnValue();
    resumeButton = v5->_resumeButton;
    v5->_resumeButton = (UIButton *)v17;

    -[UILabel setAccessibilityIdentifier:](v5->_nameLabel, "setAccessibilityIdentifier:", CFSTR("DownloadName"));
    -[UILabel setAccessibilityIdentifier:](v5->_statusLabel, "setAccessibilityIdentifier:", CFSTR("DownloadStatus"));
    -[UIButton setAccessibilityIdentifier:](v5->_cancelButton, "setAccessibilityIdentifier:", CFSTR("CancelDownloadButton"));
    -[UIButton setAccessibilityIdentifier:](v5->_revealButton, "setAccessibilityIdentifier:", CFSTR("RevealDownloadButton"));
    -[UIButton setAccessibilityIdentifier:](v5->_resumeButton, "setAccessibilityIdentifier:", CFSTR("ResumeDownloadButton"));
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B98]), "initWithProgressViewStyle:", 0);
    progressView = v5->_progressView;
    v5->_progressView = (UIProgressView *)v19;

    -[UIProgressView setAccessibilityIdentifier:](v5->_progressView, "setAccessibilityIdentifier:", CFSTR("DownloadProgress"));
    v21 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v80[0] = v5->_nameLabel;
    v80[1] = v5->_progressView;
    v80[2] = v5->_statusLabel;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithArrangedSubviews:", v22);

    objc_msgSend(v23, "setAxis:", 1);
    objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v23, "setSpacing:", 4.0);
    LODWORD(v24) = 1144750080;
    objc_msgSend(v23, "setContentCompressionResistancePriority:forAxis:", 1, v24);
    v25 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v79[0] = v5->_cancelButton;
    v79[1] = v5->_resumeButton;
    v79[2] = v5->_revealButton;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v25, "initWithArrangedSubviews:", v26);

    objc_msgSend(v27, "setAxis:", 0);
    objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v27, "setSpacing:", 24.0);
    LODWORD(v28) = 1144750080;
    objc_msgSend(v27, "setContentHuggingPriority:forAxis:", 0, v28);
    objc_msgSend(v27, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
    v29 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", 0);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v29, "setContentMode:", 4);
    iconView = v5->_iconView;
    v5->_iconView = v29;
    v31 = v29;

    objc_msgSend(v76, "addSubview:", v23);
    objc_msgSend(v76, "addSubview:", v27);
    objc_msgSend(v76, "addSubview:", v31);
    v61 = (void *)MEMORY[0x1E0CB3718];
    -[UIImageView leadingAnchor](v31, "leadingAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "leadingAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToAnchor:constant:", v73, 16.0);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v78[0] = v72;
    -[UIImageView widthAnchor](v31, "widthAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToConstant:", 48.0);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v78[1] = v70;
    -[UIImageView heightAnchor](v31, "heightAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintEqualToConstant:", 48.0);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v78[2] = v68;
    -[UIImageView centerYAnchor](v31, "centerYAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "centerYAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:", v66);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v78[3] = v65;
    -[UIImageView topAnchor](v31, "topAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "topAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintGreaterThanOrEqualToAnchor:constant:", v63, 14.0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v78[4] = v62;
    -[UIImageView topAnchor](v31, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel topAnchor](v5->_nameLabel, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v60 = v34;
    LODWORD(v35) = 1144750080;
    objc_msgSend(v34, "setPriority:", v35);
    v78[5] = v34;
    -[UILabel topAnchor](v5->_nameLabel, "topAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "topAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintLessThanOrEqualToAnchor:constant:", v57, 40.0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v78[6] = v56;
    objc_msgSend(v23, "leadingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView trailingAnchor](v5->_iconView, "trailingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:constant:", v53, 12.0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v78[7] = v52;
    objc_msgSend(v76, "bottomAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v23;
    objc_msgSend(v23, "bottomAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintGreaterThanOrEqualToAnchor:constant:", v50, 16.0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v78[8] = v49;
    v36 = v27;
    objc_msgSend(v27, "leadingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "trailingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:constant:", v47, 24.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v78[9] = v37;
    v55 = v27;
    objc_msgSend(v27, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:constant:", v39, -16.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v78[10] = v40;
    objc_msgSend(v36, "centerYAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "centerYAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v78[11] = v43;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 12);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "activateConstraints:", v44);

    v45 = v5;
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[_SFDownloadIconCache removeCacheObserver:](self->_iconCache, "removeCacheObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)DownloadTableViewCell;
  -[DownloadTableViewCell dealloc](&v3, sel_dealloc);
}

- (void)didMoveToWindow
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)DownloadTableViewCell;
  -[DownloadTableViewCell didMoveToWindow](&v2, sel_didMoveToWindow);
  SFDeferrableUpdateViewDidMoveToWindow();
}

- (id)_buttonWithSymbolName:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v4 = (void *)MEMORY[0x1E0DC3888];
  v5 = a3;
  objc_msgSend(v4, "configurationWithPointSize:", 15.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:forState:", v7, 0);
  objc_msgSend(v8, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel__buttonPressed_, 0x2000);
  LODWORD(v9) = 1144750080;
  objc_msgSend(v8, "setContentHuggingPriority:forAxis:", 0, v9);
  LODWORD(v10) = 1148846080;
  objc_msgSend(v8, "setContentCompressionResistancePriority:forAxis:", 0, v10);

  return v8;
}

- (void)_buttonPressed:(id)a3
{
  id WeakRetained;
  UIButton *v5;

  v5 = (UIButton *)a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (self->_cancelButton == v5)
  {
    objc_msgSend(WeakRetained, "cancelDownload:", self->_download);
  }
  else if (self->_resumeButton == v5)
  {
    objc_msgSend(WeakRetained, "resumeDownload:", self->_download);
  }
  else if (self->_revealButton == v5)
  {
    objc_msgSend(WeakRetained, "revealDownload:", self->_download);
  }

}

- (void)setIconCache:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_iconCache, a3);
  v5 = a3;
  objc_msgSend(v5, "addCacheObserver:", self);

}

- (void)setDownload:(id)a3
{
  _SFDownload *v5;
  _SFDownload *download;
  void *v7;
  void *v8;
  void *v9;
  _SFDownload *v10;

  v5 = (_SFDownload *)a3;
  download = self->_download;
  if (download != v5)
  {
    v10 = v5;
    if (download)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObserver:name:object:", self, 0, self->_download);

    }
    objc_storeStrong((id *)&self->_download, a3);
    -[_SFDownloadIconCache iconForSource:](self->_iconCache, "iconForSource:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_iconView, "setImage:", v8);

    v5 = v10;
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__downloadChanged_, *MEMORY[0x1E0CD5888], v10);
      objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__downloadURLChanged_, *MEMORY[0x1E0CD5880], v10);
      -[DownloadTableViewCell _updateCellContents](self, "_updateCellContents");

      v5 = v10;
    }
  }

}

- (void)_downloadChanged:(id)a3
{
  if (SFDeferrableUpdateViewShouldAttemptToUpdateContents())
    -[DownloadTableViewCell _updateCellContents](self, "_updateCellContents");
}

- (void)_downloadURLChanged:(id)a3
{
  id v4;

  -[_SFDownload filenameWithoutExtension](self->_download, "filenameWithoutExtension", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_nameLabel, "setText:", v4);

}

- (void)_updateCellContents
{
  void *v3;
  double v4;
  _BOOL8 v5;
  double v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[6];

  v23[5] = *MEMORY[0x1E0C80C00];
  -[_SFDownload filenameWithoutExtension](self->_download, "filenameWithoutExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_nameLabel, "setText:", v3);

  -[UIButton setHidden:](self->_cancelButton, "setHidden:", -[_SFDownload isIdle](self->_download, "isIdle"));
  -[UIButton setHidden:](self->_resumeButton, "setHidden:", -[_SFDownload canResume](self->_download, "canResume") ^ 1);
  -[UIButton setHidden:](self->_revealButton, "setHidden:", -[_SFDownload canReveal](self->_download, "canReveal") ^ 1);
  if (-[_SFDownload isIdle](self->_download, "isIdle"))
  {
    -[_SFDownload progress](self->_download, "progress");
    v5 = v4 >= 1.0;
  }
  else
  {
    v5 = 0;
  }
  -[UIProgressView setHidden:](self->_progressView, "setHidden:", v5);
  if ((-[UIProgressView isHidden](self->_progressView, "isHidden") & 1) == 0)
  {
    -[_SFDownload progress](self->_download, "progress");
    *(float *)&v6 = v6;
    -[UIProgressView setProgress:](self->_progressView, "setProgress:", v6);
    if (-[_SFDownload isIdle](self->_download, "isIdle"))
      v7 = 2;
    else
      v7 = 0;
    -[UIProgressView setTintAdjustmentMode:](self->_progressView, "setTintAdjustmentMode:", v7);
  }
  if (-[_SFDownload state](self->_download, "state") == 4)
  {
    -[_SFDownload bytesLoaded](self->_download, "bytesLoaded");
    NSLocalizedFileSizeDescription();
  }
  else
  {
    -[DownloadTableViewCell _busyStatus](self, "_busyStatus");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_statusLabel, "setText:", v8);

  if (-[UIButton isHidden](self->_cancelButton, "isHidden"))
    v9 = CFSTR("ResumeDownloadButton");
  else
    v9 = CFSTR("CancelDownloadButton");
  -[UIButton setAccessibilityIdentifier:](self->_resumeButton, "setAccessibilityIdentifier:", v9);
  -[UIButton setAccessibilityIdentifier:](self->_cancelButton, "setAccessibilityIdentifier:", v9);
  v22[0] = CFSTR("complete");
  if (-[_SFDownload state](self->_download, "state") == 4)
    v10 = CFSTR("true");
  else
    v10 = CFSTR("false");
  v23[0] = v10;
  v22[1] = CFSTR("progress");
  v11 = (void *)MEMORY[0x1E0CB3940];
  -[_SFDownload progress](self->_download, "progress");
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%f"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v13;
  v22[2] = CFSTR("canResume");
  if (-[_SFDownload canResume](self->_download, "canResume"))
    v14 = CFSTR("true");
  else
    v14 = CFSTR("false");
  v23[2] = v14;
  v22[3] = CFSTR("idle");
  if (-[_SFDownload isIdle](self->_download, "isIdle"))
    v15 = CFSTR("true");
  else
    v15 = CFSTR("false");
  v23[3] = v15;
  v22[4] = CFSTR("uuid");
  -[_SFDownload identifier](self->_download, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "UUIDString");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  v19 = &stru_1E9CFDBB0;
  if (v17)
    v19 = (const __CFString *)v17;
  v23[4] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  WBSMakeAccessibilityIdentifier();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[DownloadTableViewCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v21);

}

- (void)_updateCellContentsForSizing
{
  -[UILabel setText:](self->_nameLabel, "setText:", CFSTR("A"));
  -[UILabel setText:](self->_statusLabel, "setText:", CFSTR("A"));
}

- (id)_busyStatus
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = -[_SFDownload bytesExpected](self->_download, "bytesExpected");
  -[_SFDownload bytesLoaded](self->_download, "bytesLoaded");
  v4 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSLocalizedFileSizeDescription();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 < 0)
  {
    objc_msgSend(v4, "stringWithFormat:", v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSLocalizedFileSizeDescription();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringWithFormat:", v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- ($A17CE7BAAAAB13D21F74688DC5009C79)deferrableUpdateViewState
{
  return ($A17CE7BAAAAB13D21F74688DC5009C79 *)&self->deferrableUpdateViewState;
}

- (void)downloadIconCache:(id)a3 didGenerateNewIcon:(id)a4 forSource:(id)a5
{
  if (self->_download == a5)
    -[UIImageView setImage:](self->_iconView, "setImage:", a4);
}

- (_SFDownload)download
{
  return self->_download;
}

- (_SFDownloadIconCache)iconCache
{
  return self->_iconCache;
}

- (DownloadTableViewCellDelegate)delegate
{
  return (DownloadTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_iconCache, 0);
  objc_storeStrong((id *)&self->_download, 0);

  objc_storeStrong((id *)&self->_resumeButton, 0);
  objc_storeStrong((id *)&self->_revealButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
}

@end
