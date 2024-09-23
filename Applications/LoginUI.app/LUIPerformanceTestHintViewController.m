@implementation LUIPerformanceTestHintViewController

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LUIPerformanceTestHintViewController;
  -[LUIPerformanceTestHintViewController viewDidLoad](&v3, "viewDidLoad");
  -[LUIPerformanceTestHintViewController _setupViews](self, "_setupViews");
}

- (void)_setupViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UILabel *v7;
  UILabel *headerTextLabel;
  void *v9;
  UILabel *v10;
  UILabel *secondTextLabel;
  UIButton *v12;
  UIButton *okButton;
  UIButton *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  id v19;
  UILabel *v20;
  void *v21;
  UIStackView *v22;
  UIStackView *stackView;
  void *v24;
  _QWORD v25[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPerformanceTestHintViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPerformanceTestHintViewController view](self, "view"));
  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("LUIPerfTestHintView"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPerformanceTestHintViewController _headerHintText](self, "_headerHintText"));
  v7 = (UILabel *)objc_claimAutoreleasedReturnValue(-[LUIPerformanceTestHintViewController _createTextLabelWithAttributedText:](self, "_createTextLabelWithAttributedText:", v6));
  headerTextLabel = self->_headerTextLabel;
  self->_headerTextLabel = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPerformanceTestHintViewController _secondHintText](self, "_secondHintText"));
  v10 = (UILabel *)objc_claimAutoreleasedReturnValue(-[LUIPerformanceTestHintViewController _createTextLabelWithAttributedText:](self, "_createTextLabelWithAttributedText:", v9));
  secondTextLabel = self->_secondTextLabel;
  self->_secondTextLabel = v10;

  v12 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
  okButton = self->_okButton;
  self->_okButton = v12;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_okButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v14 = self->_okButton;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_100069EB8, 0));
  -[UIButton setTitle:forState:](v14, "setTitle:forState:", v16, 0);

  LODWORD(v17) = 1148846080;
  -[UIButton setContentHuggingPriority:forAxis:](self->_okButton, "setContentHuggingPriority:forAxis:", 1, v17);
  LODWORD(v18) = 1148846080;
  -[UIButton setContentCompressionResistancePriority:forAxis:](self->_okButton, "setContentCompressionResistancePriority:forAxis:", 1, v18);
  -[UIButton addTarget:action:forControlEvents:](self->_okButton, "addTarget:action:forControlEvents:", self, "okButtonPressed:", 64);
  v19 = objc_alloc((Class)UIStackView);
  v20 = self->_secondTextLabel;
  v25[0] = self->_headerTextLabel;
  v25[1] = v20;
  v25[2] = self->_okButton;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 3));
  v22 = (UIStackView *)objc_msgSend(v19, "initWithArrangedSubviews:", v21);
  stackView = self->_stackView;
  self->_stackView = v22;

  -[UIStackView setAxis:](self->_stackView, "setAxis:", 1);
  -[UIStackView setDistribution:](self->_stackView, "setDistribution:", 2);
  -[UIStackView setContentMode:](self->_stackView, "setContentMode:", 1);
  -[UIStackView setSpacing:](self->_stackView, "setSpacing:", 20.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPerformanceTestHintViewController view](self, "view"));
  objc_msgSend(v24, "addSubview:", self->_stackView);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)LUIPerformanceTestHintViewController;
  -[LUIPerformanceTestHintViewController viewDidLayoutSubviews](&v10, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPerformanceTestHintViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4 + -20.0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPerformanceTestHintViewController view](self, "view"));
  objc_msgSend(v6, "bounds");
  v8 = v7 + -10.0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPerformanceTestHintViewController stackView](self, "stackView"));
  objc_msgSend(v9, "setFrame:", 10.0, 5.0, v5, v8);

}

- (id)_createTextLabelWithAttributedText:(id)a3
{
  id v3;
  UILabel *v4;
  double v5;
  double v6;

  v3 = a3;
  v4 = objc_opt_new(UILabel);
  -[UILabel setNumberOfLines:](v4, "setNumberOfLines:", 0);
  -[UILabel setTextAlignment:](v4, "setTextAlignment:", 1);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setAttributedText:](v4, "setAttributedText:", v3);

  LODWORD(v5) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](v4, "setContentHuggingPriority:forAxis:", 1, v5);
  LODWORD(v6) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](v4, "setContentCompressionResistancePriority:forAxis:", 1, v6);
  -[UILabel sizeToFit](v4, "sizeToFit");
  return v4;
}

- (id)_createImageViewWithImage:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer"));
  objc_msgSend(v5, "setCornerRadius:", 5.0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer"));
  objc_msgSend(v6, "setMasksToBounds:", 1);

  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "setContentMode:", 0);
  LODWORD(v7) = 1132068864;
  objc_msgSend(v4, "setContentHuggingPriority:forAxis:", 1, v7);
  LODWORD(v8) = 1144750080;
  objc_msgSend(v4, "setContentCompressionResistancePriority:forAxis:", 1, v8);
  return v4;
}

- (id)_headerHintText
{
  NSMutableAttributedString *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  NSAttributedStringKey v22;
  void *v23;

  v2 = objc_opt_new(NSMutableAttributedString);
  v22 = NSFontAttributeName;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 48.0, UIFontWeightThin));
  v23 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));

  v20[0] = NSFontAttributeName;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 20.0, UIFontWeightThin));
  v21[0] = v5;
  v20[1] = NSForegroundColorAttributeName;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor grayColor](UIColor, "grayColor"));
  v21[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));

  v18[0] = NSFontAttributeName;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont italicSystemFontOfSize:](UIFont, "italicSystemFontOfSize:", 20.0));
  v18[1] = NSForegroundColorAttributeName;
  v19[0] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor grayColor](UIColor, "grayColor"));
  v19[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 2));

  v11 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", CFSTR("\n"), v7);
  -[NSMutableAttributedString appendAttributedString:](v2, "appendAttributedString:", v11);
  v12 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:attributes:", CFSTR("User Switch Test Done"), v4);
  -[NSMutableAttributedString appendAttributedString:](v2, "appendAttributedString:", v12);

  -[NSMutableAttributedString appendAttributedString:](v2, "appendAttributedString:", v11);
  -[NSMutableAttributedString appendAttributedString:](v2, "appendAttributedString:", v11);
  v13 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", CFSTR("If you triggered the test by \"), v7);
  -[NSMutableAttributedString appendAttributedString:](v2, "appendAttributedString:", v13);

  v14 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", CFSTR("localPerfTestStart ..."), v10);
  -[NSMutableAttributedString appendAttributedString:](v2, "appendAttributedString:", v14);

  v15 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", CFSTR("\", please ssh into this device and execute:\n\n"), v7);
  -[NSMutableAttributedString appendAttributedString:](v2, "appendAttributedString:", v15);

  v16 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", CFSTR("loginctl localPerfTestEnd"), v10);
  -[NSMutableAttributedString appendAttributedString:](v2, "appendAttributedString:", v16);

  return v2;
}

- (id)_secondHintText
{
  NSMutableAttributedString *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];

  v2 = objc_opt_new(NSMutableAttributedString);
  v16[0] = NSFontAttributeName;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 20.0, UIFontWeightThin));
  v17[0] = v3;
  v16[1] = NSForegroundColorAttributeName;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor grayColor](UIColor, "grayColor"));
  v17[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 2));

  v14[0] = NSFontAttributeName;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont italicSystemFontOfSize:](UIFont, "italicSystemFontOfSize:", 20.0));
  v14[1] = NSForegroundColorAttributeName;
  v15[0] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor grayColor](UIColor, "grayColor"));
  v15[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 2));

  v9 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", CFSTR("If you triggered the test by \"), v5);
  -[NSMutableAttributedString appendAttributedString:](v2, "appendAttributedString:", v9);

  v10 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", CFSTR("localUserSwitchTestStart ..."), v8);
  -[NSMutableAttributedString appendAttributedString:](v2, "appendAttributedString:", v10);

  v11 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", CFSTR("\", please ssh into this device and execute:\n\n"), v5);
  -[NSMutableAttributedString appendAttributedString:](v2, "appendAttributedString:", v11);

  v12 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", CFSTR("loginctl localUserSwitchTestEnd"), v8);
  -[NSMutableAttributedString appendAttributedString:](v2, "appendAttributedString:", v12);

  return v2;
}

- (void)okButtonPressed:(id)a3
{
  -[LUIPerformanceTestHintViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (UIButton)okButton
{
  return self->_okButton;
}

- (void)setOkButton:(id)a3
{
  objc_storeStrong((id *)&self->_okButton, a3);
}

- (UILabel)headerTextLabel
{
  return self->_headerTextLabel;
}

- (void)setHeaderTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_headerTextLabel, a3);
}

- (UILabel)secondTextLabel
{
  return self->_secondTextLabel;
}

- (void)setSecondTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secondTextLabel, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_secondTextLabel, 0);
  objc_storeStrong((id *)&self->_headerTextLabel, 0);
  objc_storeStrong((id *)&self->_okButton, 0);
}

@end
