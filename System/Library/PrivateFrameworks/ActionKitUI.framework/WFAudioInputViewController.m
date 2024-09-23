@implementation WFAudioInputViewController

- (WFAudioInputViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  WFAudioInputViewController *v4;
  WFAudioInputViewController *v5;
  WFAudioInputViewController *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFAudioInputViewController;
  v4 = -[WFAudioInputViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[WFAudioInputViewController setModalPresentationStyle:](v4, "setModalPresentationStyle:", 5);
    v6 = v5;
  }

  return v5;
}

- (void)loadView
{
  UIView *v3;
  UIView *contentView;
  void *v5;
  void *v6;
  double v7;
  UILabel *v8;
  void *v9;
  UILabel *statusLabel;
  UILabel *v11;
  void *v12;
  void *v13;
  UIView *v14;
  void *v15;
  UIView *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 2);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB38]), "initWithEffect:", v22);
  objc_msgSend(v21, "contentView");
  v3 = (UIView *)objc_claimAutoreleasedReturnValue();
  contentView = self->_contentView;
  self->_contentView = v3;

  -[WFAudioInputViewController setView:](self, "setView:", v21);
  objc_msgSend(MEMORY[0x24BEBDAF0], "effectForBlurEffect:", v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB38]), "initWithEffect:", v20);
  objc_msgSend(v5, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addSubview:](self->_contentView, "addSubview:", v5);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v7) = 1148846080;
  objc_msgSend(v6, "setContentHuggingPriority:forAxis:", 1, v7);
  v8 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
  -[UILabel setTextAlignment:](v8, "setTextAlignment:", 1);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](v8, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 30.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v8, "setFont:", v9);

  objc_msgSend(v6, "addSubview:", v8);
  statusLabel = self->_statusLabel;
  self->_statusLabel = v8;
  v11 = v8;

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel_handleTap);
  -[UIView addGestureRecognizer:](self->_contentView, "addGestureRecognizer:", v12);
  _NSDictionaryOfVariableBindings(CFSTR("vibrantView, statusLabel"), v5, v11, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = self->_contentView;
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[vibrantView]|"), 0, 0, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addConstraints:](v14, "addConstraints:", v15);

  v16 = self->_contentView;
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[vibrantView]|"), 0, 0, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addConstraints:](v16, "addConstraints:", v17);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[statusLabel]|"), 0, 0, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addConstraints:", v18);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[statusLabel]|"), 0, 0, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addConstraints:", v19);
}

- (BOOL)accessibilityPerformMagicTap
{
  -[WFAudioInputViewController handleTap](self, "handleTap");
  return 1;
}

- (UILabel)statusLabel
{
  return self->_statusLabel;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
}

@end
