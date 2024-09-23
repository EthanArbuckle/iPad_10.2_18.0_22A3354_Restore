@implementation _SFReaderFontDownloadAccessory

- (_SFReaderFontDownloadAccessory)initWithTappedDownloadBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  _SFReaderFontDownloadAccessory *v9;
  uint64_t v10;
  id tappedDownloadBlock;
  id v12;
  uint64_t v13;
  UIButton *downloadButton;
  UIProgressView *v15;
  UIProgressView *progressView;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _SFReaderFontDownloadAccessory *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  objc_super v44;
  _QWORD v45[9];

  v45[7] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4A88], 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("icloud.and.arrow.down"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "size");
  v44.receiver = self;
  v44.super_class = (Class)_SFReaderFontDownloadAccessory;
  v9 = -[_SFReaderFontDownloadAccessory initWithFrame:](&v44, sel_initWithFrame_, 0.0, 0.0, v7, v8);
  if (v9)
  {
    v10 = MEMORY[0x1A8598C40](v4);
    tappedDownloadBlock = v9->_tappedDownloadBlock;
    v9->_tappedDownloadBlock = (id)v10;

    v12 = objc_alloc(MEMORY[0x1E0DC3518]);
    -[_SFReaderFontDownloadAccessory bounds](v9, "bounds");
    v13 = objc_msgSend(v12, "initWithFrame:");
    downloadButton = v9->_downloadButton;
    v9->_downloadButton = (UIButton *)v13;

    -[UIButton addTarget:action:forControlEvents:](v9->_downloadButton, "addTarget:action:forControlEvents:", v9, sel__tappedDownloadButton_, 0x2000);
    -[UIButton setImage:forState:](v9->_downloadButton, "setImage:forState:", v6, 0);
    -[UIButton setPreferredSymbolConfiguration:forImageInState:](v9->_downloadButton, "setPreferredSymbolConfiguration:forImageInState:", v5, 0);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v9->_downloadButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_SFReaderFontDownloadAccessory addSubview:](v9, "addSubview:", v9->_downloadButton);
    v15 = (UIProgressView *)objc_alloc_init(MEMORY[0x1E0DC3B98]);
    v43 = v4;
    progressView = v9->_progressView;
    v9->_progressView = v15;

    -[UIProgressView setHidden:](v9->_progressView, "setHidden:", 1);
    -[UIProgressView setTranslatesAutoresizingMaskIntoConstraints:](v9->_progressView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_SFReaderFontDownloadAccessory addSubview:](v9, "addSubview:", v9->_progressView);
    v32 = (void *)MEMORY[0x1E0CB3718];
    -[_SFReaderFontDownloadAccessory leadingAnchor](v9, "leadingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton leadingAnchor](v9->_downloadButton, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v38;
    -[_SFReaderFontDownloadAccessory trailingAnchor](v9, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton trailingAnchor](v9->_downloadButton, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v36);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v45[1] = v35;
    -[_SFReaderFontDownloadAccessory topAnchor](v9, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton topAnchor](v9->_downloadButton, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v33);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v45[2] = v31;
    -[_SFReaderFontDownloadAccessory bottomAnchor](v9, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton bottomAnchor](v9->_downloadButton, "bottomAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v29);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v45[3] = v28;
    -[_SFReaderFontDownloadAccessory centerXAnchor](v9, "centerXAnchor");
    v42 = v5;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIProgressView centerXAnchor](v9->_progressView, "centerXAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v45[4] = v19;
    -[_SFReaderFontDownloadAccessory centerYAnchor](v9, "centerYAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIProgressView centerYAnchor](v9->_progressView, "centerYAnchor");
    v41 = v6;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v45[5] = v22;
    -[UIProgressView widthAnchor](v9->_progressView, "widthAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToConstant:", 20.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v45[6] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 7);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "activateConstraints:", v25);

    v4 = v43;
    v6 = v41;

    v5 = v42;
    v26 = v9;
  }

  return v9;
}

- (void)setDownloading:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_downloading != a3)
  {
    v3 = a3;
    self->_downloading = a3;
    -[UIProgressView setHidden:](self->_progressView, "setHidden:", !a3);
    -[UIButton setHidden:](self->_downloadButton, "setHidden:", v3);
  }
}

- (void)_tappedDownloadButton:(id)a3
{
  void (**tappedDownloadBlock)(id, _SFReaderFontDownloadAccessory *);

  tappedDownloadBlock = (void (**)(id, _SFReaderFontDownloadAccessory *))self->_tappedDownloadBlock;
  if (tappedDownloadBlock)
    tappedDownloadBlock[2](tappedDownloadBlock, self);
}

- (id)viewForLastBaselineLayout
{
  return -[UIButton imageView](self->_downloadButton, "imageView");
}

- (UIButton)downloadButton
{
  return self->_downloadButton;
}

- (UIProgressView)progressView
{
  return self->_progressView;
}

- (BOOL)isDownloading
{
  return self->_downloading;
}

- (id)tappedDownloadBlock
{
  return self->_tappedDownloadBlock;
}

- (void)setTappedDownloadBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tappedDownloadBlock, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_downloadButton, 0);
}

@end
