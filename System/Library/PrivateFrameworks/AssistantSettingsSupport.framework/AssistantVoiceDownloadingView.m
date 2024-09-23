@implementation AssistantVoiceDownloadingView

- (AssistantVoiceDownloadingView)initWithActivityIndicatorStyle:(int64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  AssistantVoiceDownloadingView *v8;
  uint64_t v9;
  UIActivityIndicatorView *indicator;
  uint64_t v11;
  UILabel *downloadLabel;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)AssistantVoiceDownloadingView;
  v4 = *MEMORY[0x24BDBF090];
  v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v8 = -[AssistantVoiceDownloadingView initWithFrame:](&v19, sel_initWithFrame_, *MEMORY[0x24BDBF090], v5, v6, v7);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", a3);
    indicator = v8->_indicator;
    v8->_indicator = (UIActivityIndicatorView *)v9;

    -[UIActivityIndicatorView startAnimating](v8->_indicator, "startAnimating");
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v4, v5, v6, v7);
    downloadLabel = v8->_downloadLabel;
    v8->_downloadLabel = (UILabel *)v11;

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v8->_downloadLabel, "setFont:", v13);

    -[UILabel setAdjustsFontForContentSizeCategory:](v8->_downloadLabel, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x24BEBD4B8], "lightGrayColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v8->_downloadLabel, "setTextColor:", v14);

    +[AssistantVoiceController bundle](AssistantVoiceController, "bundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    SFLocalizableWAPIStringKeyForKey();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", v16, &stru_24D33E0B0, CFSTR("AssistantSettings"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v8->_downloadLabel, "setText:", v17);

    -[AssistantVoiceDownloadingView addSubview:](v8, "addSubview:", v8->_indicator);
    -[AssistantVoiceDownloadingView addSubview:](v8, "addSubview:", v8->_downloadLabel);
  }
  return v8;
}

- (void)sizeToFit
{
  double Width;
  double v4;
  double Height;
  double v6;
  double v7;
  CGRect v8;
  CGRect v9;
  CGRect v10;
  CGRect v11;

  -[UILabel sizeToFit](self->_downloadLabel, "sizeToFit");
  -[UILabel frame](self->_downloadLabel, "frame");
  Width = CGRectGetWidth(v8);
  -[UIActivityIndicatorView frame](self->_indicator, "frame");
  v4 = Width + CGRectGetWidth(v9) + 8.0;
  -[UILabel frame](self->_downloadLabel, "frame");
  Height = CGRectGetHeight(v10);
  -[UIActivityIndicatorView frame](self->_indicator, "frame");
  v6 = CGRectGetHeight(v11);
  if (Height >= v6)
    v7 = Height;
  else
    v7 = v6;
  -[AssistantVoiceDownloadingView setFrame:](self, "setFrame:", 0.0, 0.0, v4, v7);
}

- (void)layoutSubviews
{
  CGFloat v3;
  double Height;
  double v5;
  double Width;
  CGRect v7;
  CGRect v8;
  CGRect v9;
  CGRect v10;
  CGRect v11;

  -[UILabel sizeToFit](self->_downloadLabel, "sizeToFit");
  -[UILabel frame](self->_downloadLabel, "frame");
  v3 = CGRectGetMaxX(v7) + 8.0;
  -[AssistantVoiceDownloadingView frame](self, "frame");
  Height = CGRectGetHeight(v8);
  -[UIActivityIndicatorView frame](self->_indicator, "frame");
  v5 = (Height - CGRectGetHeight(v9)) * 0.5;
  -[UIActivityIndicatorView frame](self->_indicator, "frame");
  Width = CGRectGetWidth(v10);
  -[UIActivityIndicatorView frame](self->_indicator, "frame");
  -[UIActivityIndicatorView setFrame:](self->_indicator, "setFrame:", v3, v5, Width, CGRectGetHeight(v11));
}

- (UIActivityIndicatorView)indicator
{
  return self->_indicator;
}

- (void)setIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_indicator, a3);
}

- (UILabel)downloadLabel
{
  return self->_downloadLabel;
}

- (void)setDownloadLabel:(id)a3
{
  objc_storeStrong((id *)&self->_downloadLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadLabel, 0);
  objc_storeStrong((id *)&self->_indicator, 0);
}

@end
