@implementation TKErrorViewController

+ (id)viewControllerForMessage:(id)a3
{
  TKErrorViewController *v4;
  TKErrorViewController *v5;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = -[TKErrorViewController initWithNibName:bundle:]([TKErrorViewController alloc], "initWithNibName:bundle:", 0);
  -[TKErrorViewController setMessage:](v5, "setMessage:", location[0]);
  v4 = v5;
  objc_storeStrong((id *)&v5, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (void)loadView
{
  id v2;
  UILabel *v3;
  UILabel *label;
  id v5;
  id v6;
  id v7;
  double *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BEBDB00]);
  v8 = (double *)MEMORY[0x24BDBF090];
  v5 = (id)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[TKErrorViewController setView:](self, "setView:");

  v7 = (id)objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v6 = (id)-[TKErrorViewController view](self, "view");
  objc_msgSend(v6, "setBackgroundColor:", v7);

  v3 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", *v8, v8[1], v8[2], v8[3]);
  label = self->_label;
  self->_label = v3;

  -[UILabel setNumberOfLines:](self->_label, "setNumberOfLines:", 0);
  v9 = (id)objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
  -[UILabel setFont:](self->_label, "setFont:");

  -[UILabel setTextAlignment:](self->_label, "setTextAlignment:", 1);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v10 = (id)-[TKErrorViewController view](self, "view");
  objc_msgSend(v10, "addSubview:", self->_label);

  v11 = (void *)MEMORY[0x24BDD1628];
  v20 = (id)-[UILabel leadingAnchor](self->_label, "leadingAnchor");
  v19 = (id)-[TKErrorViewController view](self, "view");
  v18 = (id)objc_msgSend(v19, "leadingAnchor");
  v17 = (id)objc_msgSend(v20, "constraintEqualToAnchor:");
  v33[0] = v17;
  v16 = (id)-[UILabel trailingAnchor](self->_label, "trailingAnchor");
  v15 = (id)-[TKErrorViewController view](self, "view");
  v14 = (id)objc_msgSend(v15, "trailingAnchor");
  v13 = (id)objc_msgSend(v16, "constraintEqualToAnchor:");
  v33[1] = v13;
  v12 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33);
  objc_msgSend(v11, "activateConstraints:");

  v21 = (void *)MEMORY[0x24BDD1628];
  v30 = (id)-[UILabel topAnchor](self->_label, "topAnchor");
  v29 = (id)-[TKErrorViewController view](self, "view");
  v28 = (id)objc_msgSend(v29, "topAnchor");
  v27 = (id)objc_msgSend(v30, "constraintEqualToAnchor:");
  v32[0] = v27;
  v26 = (id)-[UILabel bottomAnchor](self->_label, "bottomAnchor");
  v25 = (id)-[TKErrorViewController view](self, "view");
  v24 = (id)objc_msgSend(v25, "bottomAnchor");
  v23 = (id)objc_msgSend(v26, "constraintEqualToAnchor:");
  v32[1] = v23;
  v22 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 2);
  objc_msgSend(v21, "activateConstraints:");

}

- (void)viewDidLoad
{
  objc_super v2;
  SEL v3;
  TKErrorViewController *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)TKErrorViewController;
  -[TKErrorViewController viewDidLoad](&v2, sel_viewDidLoad);
  -[UILabel setText:](v4->_label, "setText:", v4->_message);
}

- (void)setMessage:(id)a3
{
  uint64_t v3;
  NSString *message;
  id location[2];
  TKErrorViewController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_msgSend(location[0], "copy");
  message = v6->_message;
  v6->_message = (NSString *)v3;

  -[UILabel setText:](v6->_label, "setText:", v6->_message);
  objc_storeStrong(location, 0);
}

- (NSString)message
{
  return self->_message;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
