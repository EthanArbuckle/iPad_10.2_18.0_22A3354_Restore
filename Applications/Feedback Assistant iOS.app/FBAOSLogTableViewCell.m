@implementation FBAOSLogTableViewCell

- (void)awakeFromNib
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FBAOSLogTableViewCell;
  -[FBAOSLogTableViewCell awakeFromNib](&v8, "awakeFromNib");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontMetrics metricsForTextStyle:](UIFontMetrics, "metricsForTextStyle:", UIFontTextStyleFootnote));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont monospacedSystemFontOfSize:weight:](UIFont, "monospacedSystemFontOfSize:weight:", 14.0, UIFontWeightRegular));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scaledFontForFont:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOSLogTableViewCell logLabel](self, "logLabel"));
  objc_msgSend(v6, "setFont:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOSLogTableViewCell logLabel](self, "logLabel"));
  objc_msgSend(v7, "setAdjustsFontForContentSizeCategory:", 1);

}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FBAOSLogTableViewCell;
  -[FBAOSLogTableViewCell setSelected:animated:](&v4, "setSelected:animated:", a3, a4);
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
