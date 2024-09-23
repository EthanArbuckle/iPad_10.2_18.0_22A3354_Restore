@implementation AMUINotificationIndicatorView

- (AMUINotificationIndicatorView)initWithNotificationCount:(unint64_t)a3
{
  AMUINotificationIndicatorView *v4;
  AMUINotificationIndicatorView *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AMUINotificationIndicatorView;
  v4 = -[AMUINotificationIndicatorView init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_notificationCount = a3;
    v4->_hideNotificationCount = 1;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("amui-notification-indicator-view,count:%lu"), a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMUINotificationIndicatorView setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", v6);

  }
  return v5;
}

- (void)setNotificationCount:(unint64_t)a3
{
  if (self->_notificationCount != a3)
  {
    self->_notificationCount = a3;
    -[AMUINotificationIndicatorView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setHideNotificationCount:(BOOL)a3
{
  UILabel *notificationIndicatorLabel;

  if (self->_hideNotificationCount != a3)
  {
    self->_hideNotificationCount = a3;
    -[UILabel removeFromSuperview](self->_notificationIndicatorLabel, "removeFromSuperview");
    notificationIndicatorLabel = self->_notificationIndicatorLabel;
    self->_notificationIndicatorLabel = 0;

    -[AMUINotificationIndicatorView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[AMUINotificationIndicatorView _configureNotificationIndicatorLabelIfNecessary](self, "_configureNotificationIndicatorLabelIfNecessary");
  -[UILabel sizeThatFits:](self->_notificationIndicatorLabel, "sizeThatFits:", width, height);
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  UILabel *notificationIndicatorLabel;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AMUINotificationIndicatorView;
  -[AMUINotificationIndicatorView layoutSubviews](&v4, sel_layoutSubviews);
  -[AMUINotificationIndicatorView _configureNotificationIndicatorLabelIfNecessary](self, "_configureNotificationIndicatorLabelIfNecessary");
  notificationIndicatorLabel = self->_notificationIndicatorLabel;
  -[AMUINotificationIndicatorView bounds](self, "bounds");
  -[UILabel setFrame:](notificationIndicatorLabel, "setFrame:");
}

- (void)_configureNotificationIndicatorLabelIfNecessary
{
  UILabel *notificationIndicatorLabel;
  id v4;
  UILabel *v5;
  UILabel *v6;
  UILabel *v7;
  void *v8;
  id v9;

  notificationIndicatorLabel = self->_notificationIndicatorLabel;
  if (notificationIndicatorLabel)
    goto LABEL_5;
  if (-[AMUINotificationIndicatorView notificationCount](self, "notificationCount"))
  {
    v4 = objc_alloc(MEMORY[0x24BDF6B68]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v6 = self->_notificationIndicatorLabel;
    self->_notificationIndicatorLabel = v5;

    v7 = self->_notificationIndicatorLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "systemWhiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v7, "setTextColor:", v8);

    -[AMUINotificationIndicatorView addSubview:](self, "addSubview:", self->_notificationIndicatorLabel);
  }
  notificationIndicatorLabel = self->_notificationIndicatorLabel;
  if (notificationIndicatorLabel)
  {
LABEL_5:
    -[AMUINotificationIndicatorView _attributedStringForNotificationCount:](self, "_attributedStringForNotificationCount:", -[AMUINotificationIndicatorView notificationCount](self, "notificationCount"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel setAttributedText:](notificationIndicatorLabel, "setAttributedText:", v9);

  }
}

- (id)_fontForNotificationIndicatorLabel
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE0BF20], "preferredFontProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x24BDF77D0], 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_notificationIndicatorImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDF6AE0];
  -[AMUINotificationIndicatorView _fontForNotificationIndicatorLabel](self, "_fontForNotificationIndicatorLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationWithFont:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:withConfiguration:", CFSTR("circlebadge.fill"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithRenderingMode:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_attributedStringForNotificationCount:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[AMUINotificationIndicatorView _notificationIndicatorImage](self, "_notificationIndicatorImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BDF6768]);
  objc_msgSend(v6, "setImage:", v5);
  objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithAttributedString:", v7);
  if (!-[AMUINotificationIndicatorView hideNotificationCount](self, "hideNotificationCount"))
  {
    v9 = (void *)MEMORY[0x24BDD16F0];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringFromNumber:numberStyle:", v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v11);
    if (-[AMUINotificationIndicatorView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      objc_msgSend(v12, "appendAttributedString:", v8);
      v13 = v12;

      v8 = v13;
    }
    else
    {
      objc_msgSend(v8, "appendAttributedString:", v12);
    }

  }
  return v8;
}

- (unint64_t)notificationCount
{
  return self->_notificationCount;
}

- (BOOL)hideNotificationCount
{
  return self->_hideNotificationCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationIndicatorLabel, 0);
}

@end
