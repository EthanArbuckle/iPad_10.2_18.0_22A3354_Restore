@implementation FBASimpleTextNoticeController

- (FBASimpleTextNoticeController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FBASimpleTextNoticeController;
  return -[FBASimpleTextNoticeController init](&v3, "init");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FBASimpleTextNoticeController;
  -[FBASimpleTextNoticeController viewDidLoad](&v11, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBASimpleTextNoticeController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBASimpleTextNoticeController fbaNameLabel](self, "fbaNameLabel"));
  objc_msgSend(v6, "setTextColor:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBASimpleTextNoticeController titleLabel](self, "titleLabel"));
  objc_msgSend(v8, "setTextColor:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FBASimpleTextNoticeController subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v10, "setTextColor:", v9);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)FBASimpleTextNoticeController;
  -[FBASimpleTextNoticeController viewDidLayoutSubviews](&v14, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBASimpleTextNoticeController titleLabel](self, "titleLabel"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBASimpleTextNoticeController titleLabel](self, "titleLabel"));
    objc_msgSend(v4, "frame");
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBASimpleTextNoticeController titleLabel](self, "titleLabel"));
    objc_msgSend(v7, "setPreferredMaxLayoutWidth:", v6);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBASimpleTextNoticeController subtitleLabel](self, "subtitleLabel"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBASimpleTextNoticeController subtitleLabel](self, "subtitleLabel"));
    objc_msgSend(v9, "frame");
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FBASimpleTextNoticeController subtitleLabel](self, "subtitleLabel"));
    objc_msgSend(v12, "setPreferredMaxLayoutWidth:", v11);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FBASimpleTextNoticeController view](self, "view"));
  objc_msgSend(v13, "layoutIfNeeded");

}

- (UILabel)fbaNameLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_fbaNameLabel);
}

- (void)setFbaNameLabel:(id)a3
{
  objc_storeWeak((id *)&self->_fbaNameLabel, a3);
}

- (UILabel)titleLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_titleLabel);
}

- (void)setTitleLabel:(id)a3
{
  objc_storeWeak((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_subtitleLabel);
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeWeak((id *)&self->_subtitleLabel, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_subtitleLabel);
  objc_destroyWeak((id *)&self->_titleLabel);
  objc_destroyWeak((id *)&self->_fbaNameLabel);
}

@end
