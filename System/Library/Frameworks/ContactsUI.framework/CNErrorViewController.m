@implementation CNErrorViewController

- (CNErrorViewController)initWithMessage:(id)a3
{
  id v5;
  CNErrorViewController *v6;
  CNErrorViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNErrorViewController;
  v6 = -[CNErrorViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_errorMessage, a3);

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  UILabel *label;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  UILabel *v26;
  UILabel *v27;
  UILabel *v28;
  double MidX;
  UILabel *v30;
  void *v31;
  UILabel *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v36.receiver = self;
  v36.super_class = (Class)CNErrorViewController;
  -[CNErrorViewController viewDidLoad](&v36, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNErrorViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  label = self->_label;
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](label, "setTextColor:", v6);

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[CNErrorViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

  -[CNErrorViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  v37.origin.x = v19;
  v37.origin.y = v21;
  v37.size.width = v23;
  v37.size.height = v25;
  v26 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), CGRectGetWidth(v37) + -30.0, 100.0);
  v27 = self->_label;
  self->_label = v26;

  v28 = self->_label;
  v38.origin.x = v19;
  v38.origin.y = v21;
  v38.size.width = v23;
  v38.size.height = v25;
  MidX = CGRectGetMidX(v38);
  v39.origin.x = v19;
  v39.origin.y = v21;
  v39.size.width = v23;
  v39.size.height = v25;
  -[UILabel setCenter:](v28, "setCenter:", MidX, CGRectGetMidY(v39));
  v30 = self->_label;
  -[CNErrorViewController errorMessage](self, "errorMessage");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v30, "setText:", v31);

  v32 = self->_label;
  v33 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(MEMORY[0x1E0DC1350], "smallSystemFontSize");
  objc_msgSend(v33, "systemFontOfSize:");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v32, "setFont:", v34);

  -[UILabel setTextAlignment:](self->_label, "setTextAlignment:", 1);
  -[UILabel setAutoresizingMask:](self->_label, "setAutoresizingMask:", 45);
  -[CNErrorViewController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addSubview:", self->_label);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[CNErrorViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (UILabel)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
}

@end
