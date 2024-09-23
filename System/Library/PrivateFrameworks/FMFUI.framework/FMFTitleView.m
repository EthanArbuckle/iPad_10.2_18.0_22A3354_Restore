@implementation FMFTitleView

- (id)initFromNib
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadNibNamed:owner:options:", CFSTR("TitleView_iOS"), self, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)updateLocation:(id)a3
{
  id v4;

  v4 = a3;
  -[FMFTitleView setLocation:](self, "setLocation:", v4);
  -[FMFTitleView _updateLabels:](self, "_updateLabels:", v4);

}

- (void)_updateLabels:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  _QWORD v12[5];

  v4 = a3;
  objc_msgSend(v4, "locationShortAddressWithAge");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFTitleView subtitleLabel](self, "subtitleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  objc_msgSend(v4, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[FMFTitleView titleBottomConstraint](self, "titleBottomConstraint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = 16.0;
  if (!v7)
    v10 = 2.0;
  objc_msgSend(v8, "setConstant:", v10);

  objc_msgSend(v4, "handle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __30__FMFTitleView__updateLabels___block_invoke;
  v12[3] = &unk_24C877C40;
  v12[4] = self;
  objc_msgSend(v11, "prettyNameWithCompletion:", v12);

}

void __30__FMFTitleView__updateLabels___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "titleLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v3);

}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (NSLayoutConstraint)titleBottomConstraint
{
  return self->_titleBottomConstraint;
}

- (void)setTitleBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleBottomConstraint, a3);
}

- (FMFLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_titleBottomConstraint, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
