@implementation DevicesHeaderView

- (double)preferredHeightForWidth:(double)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;

  -[DevicesHeaderView spinner](self, "spinner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6 + 24.0;

  -[DevicesHeaderView listContentView](self, "listContentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeThatFits:", a3, 1.79769313e308);
  v10 = v9;

  if (v7 >= v10)
    return v7;
  else
    return v10;
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (DevicesHeaderView)initWithSpecifier:(id)a3
{
  id v4;
  DevicesHeaderView *v5;
  DevicesHeaderView *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DevicesHeaderView;
  v5 = -[DevicesHeaderView init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[DevicesHeaderView setAutoresizingMask:](v5, "setAutoresizingMask:", 2);
    -[DevicesHeaderView setupSubviewsWithSpecifier:](v6, "setupSubviewsWithSpecifier:", v4);
  }

  return v6;
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[DevicesHeaderView listContentConfiguration](self, "listContentConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DevicesHeaderView listContentConfiguration](self, "listContentConfiguration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[DevicesHeaderView setListContentConfiguration:](self, "setListContentConfiguration:", v5);
}

- (UIListContentConfiguration)listContentConfiguration
{
  void *v2;
  void *v3;

  -[DevicesHeaderView listContentView](self, "listContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIListContentConfiguration *)v3;
}

- (void)setListContentConfiguration:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DevicesHeaderView listContentView](self, "listContentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConfiguration:", v4);

}

- (void)setupSubviewsWithSpecifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[8];

  v52[6] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BEBD728];
  v5 = a3;
  objc_msgSend(v4, "groupedHeaderConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = v6;
  objc_msgSend(v6, "setText:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD730]), "initWithConfiguration:", v6);
  -[DevicesHeaderView setListContentView:](self, "setListContentView:", v8);

  -[DevicesHeaderView contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DevicesHeaderView listContentView](self, "listContentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v10);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
  -[DevicesHeaderView setSpinner:](self, "setSpinner:", v11);

  -[DevicesHeaderView spinner](self, "spinner");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "startAnimating");

  -[DevicesHeaderView contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DevicesHeaderView spinner](self, "spinner");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v14);

  -[DevicesHeaderView listContentView](self, "listContentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[DevicesHeaderView spinner](self, "spinner");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v36 = (void *)MEMORY[0x24BDD1628];
  -[DevicesHeaderView listContentView](self, "listContentView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "leadingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[DevicesHeaderView contentView](self, "contentView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "leadingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:", v47);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v46;
  -[DevicesHeaderView listContentView](self, "listContentView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "topAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[DevicesHeaderView contentView](self, "contentView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "topAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v42);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v41;
  -[DevicesHeaderView listContentView](self, "listContentView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "trailingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[DevicesHeaderView contentView](self, "contentView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v37);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v52[2] = v35;
  -[DevicesHeaderView listContentView](self, "listContentView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[DevicesHeaderView contentView](self, "contentView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v52[3] = v30;
  -[DevicesHeaderView spinner](self, "spinner");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[DevicesHeaderView listContentView](self, "listContentView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "textLayoutGuide");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:constant:", v18, 10.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v52[4] = v19;
  -[DevicesHeaderView spinner](self, "spinner");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "centerYAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[DevicesHeaderView listContentView](self, "listContentView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "textLayoutGuide");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "centerYAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v52[5] = v25;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "activateConstraints:", v26);

}

- (UIListContentView)listContentView
{
  return self->_listContentView;
}

- (void)setListContentView:(id)a3
{
  objc_storeStrong((id *)&self->_listContentView, a3);
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_listContentView, 0);
}

@end
