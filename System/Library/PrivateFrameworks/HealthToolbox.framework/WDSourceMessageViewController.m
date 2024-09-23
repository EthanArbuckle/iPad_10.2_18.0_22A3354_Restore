@implementation WDSourceMessageViewController

- (WDSourceMessageViewController)initWithStyle:(int64_t)a3 source:(id)a4
{
  id v7;
  WDSourceMessageViewController *v8;
  WDSourceMessageViewController *v9;
  UILabel *v10;
  UILabel *messageLabel;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)WDSourceMessageViewController;
  v8 = -[WDSourceMessageViewController initWithNibName:bundle:](&v16, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (v8)
  {
    v8->_style = a3;
    objc_storeStrong((id *)&v8->_source, a4);
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    messageLabel = v9->_messageLabel;
    v9->_messageLabel = v10;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v9->_messageLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v9->_messageLabel, "setTextColor:", v12);

    -[UILabel setNumberOfLines:](v9->_messageLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v9->_messageLabel, "setTextAlignment:", 1);
    -[WDSourceMessageViewController _updateFont](v9, "_updateFont");
    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDSourceMessageViewController view](v9, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v13);

  }
  return v9;
}

- (void)_updateFont
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_scaledValueForValue:", 24.0);
  objc_msgSend(v3, "systemFontOfSize:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_messageLabel, "setFont:", v4);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  UILabel *messageLabel;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UILabel *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UILabel *v16;
  void *v17;
  void *v18;
  UILabel *v19;
  void *v20;
  UILabel *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  UILabel *v26;
  void *v27;
  void *v28;
  void *v29;
  UILabel *v30;
  void *v31;
  objc_super v32;
  CGRect v33;

  v32.receiver = self;
  v32.super_class = (Class)WDSourceMessageViewController;
  -[WDSourceMessageViewController viewDidLoad](&v32, sel_viewDidLoad);
  -[WDSourceMessageViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", self->_messageLabel);

  -[WDSourceMessageViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD1628];
  messageLabel = self->_messageLabel;
  -[WDSourceMessageViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", messageLabel, 9, 0, v7, 9, 1.0, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addConstraint:", v8);

  -[WDSourceMessageViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD1628];
  v11 = self->_messageLabel;
  -[WDSourceMessageViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v11, 3, 0, v12, 10, 0.6, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addConstraint:", v13);

  -[WDSourceMessageViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BDD1628];
  v16 = self->_messageLabel;
  -[WDSourceMessageViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  objc_msgSend(v15, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v16, 7, 0, 0, 0, 1.0, CGRectGetWidth(v33) + -60.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addConstraint:", v18);

  switch(self->_style)
  {
    case 1:
      v19 = self->_messageLabel;
      HKHealthRecordsAPILocalizedStringWithSource();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](v19, "setText:", v20);

      break;
    case 2:
      v21 = self->_messageLabel;
      WDBundle();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("SOURCES_WATCH_PAIRED"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](v21, "setText:", v23);
      goto LABEL_7;
    case 3:
      WDBundle();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("SOURCES_WATCH_UNPAIRED"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = self->_messageLabel;
      v27 = (void *)MEMORY[0x24BDD17C8];
      -[HKSource name](self->_source, "name");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localizedStringWithFormat:", v25, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](v26, "setText:", v29);

      break;
    case 4:
      v30 = self->_messageLabel;
      WDBundle();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF69C8], "modelSpecificLocalizedStringKeyForKey:", CFSTR("SOURCES_LOCAL_DEVICE"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringForKey:value:table:", v23, &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](v30, "setText:", v31);

LABEL_7:
      break;
    default:
      -[UILabel setText:](self->_messageLabel, "setText:", &stru_24D38E7C8);
      break;
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WDSourceMessageViewController;
  -[WDSourceMessageViewController traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[WDSourceMessageViewController traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      -[WDSourceMessageViewController _updateFont](self, "_updateFont");
      -[WDSourceMessageViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setNeedsLayout");

    }
  }

}

- (int64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
}

@end
