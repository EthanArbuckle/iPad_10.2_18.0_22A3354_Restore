@implementation FBKOSLogTableViewCell

- (void)awakeFromNib
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FBKOSLogTableViewCell;
  -[FBKOSLogTableViewCell awakeFromNib](&v8, sel_awakeFromNib);
  objc_msgSend(MEMORY[0x24BEBD5F0], "metricsForTextStyle:", *MEMORY[0x24BEBE1F0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "monospacedSystemFontOfSize:weight:", 14.0, *MEMORY[0x24BEBB608]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledFontForFont:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKOSLogTableViewCell logLabel](self, "logLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  -[FBKOSLogTableViewCell logLabel](self, "logLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAdjustsFontForContentSizeCategory:", 1);

}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FBKOSLogTableViewCell;
  -[FBKOSLogTableViewCell setSelected:animated:](&v4, sel_setSelected_animated_, a3, a4);
}

- (UILabel)logLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_logLabel);
}

- (void)setLogLabel:(id)a3
{
  objc_storeWeak((id *)&self->_logLabel, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_logLabel);
}

@end
