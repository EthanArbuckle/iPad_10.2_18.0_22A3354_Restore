@implementation AVTFunCamAvatarPickerTitleCell

+ (id)cellIdentifier
{
  return CFSTR("AVTFunCamAvatarPickerTitleCell");
}

- (AVTFunCamAvatarPickerTitleCell)initWithFrame:(CGRect)a3
{
  AVTFunCamAvatarPickerTitleCell *v3;
  id v4;
  uint64_t v5;
  UILabel *titleLabel;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVTFunCamAvatarPickerTitleCell;
  v3 = -[AVTFunCamAvatarPickerTitleCell initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA700]);
    -[AVTFunCamAvatarPickerTitleCell bounds](v3, "bounds");
    v5 = objc_msgSend(v4, "initWithFrame:");
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v5;

    +[AVTUIFontRepository funCamItemTitleFont](AVTUIFontRepository, "funCamItemTitleFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_titleLabel, "setFont:", v7);

    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_titleLabel, "setTextColor:", v8);

    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setAutoresizingMask:](v3->_titleLabel, "setAutoresizingMask:", 18);
    -[AVTFunCamAvatarPickerTitleCell contentView](v3, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v3->_titleLabel);

  }
  return v3;
}

- (void)updateWithTitle:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[AVTFunCamAvatarPickerTitleCell titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[AVTFunCamAvatarPickerTitleCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVTFunCamAvatarPickerTitleCell;
  -[AVTFunCamAvatarPickerTitleCell prepareForReuse](&v4, sel_prepareForReuse);
  -[AVTFunCamAvatarPickerTitleCell titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", 0);

}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
