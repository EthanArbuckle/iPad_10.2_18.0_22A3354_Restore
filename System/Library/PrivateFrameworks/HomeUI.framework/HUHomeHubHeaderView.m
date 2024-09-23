@implementation HUHomeHubHeaderView

- (HUHomeHubHeaderView)initWithMessage:(id)a3
{
  id v5;
  HUHomeHubHeaderView *v6;
  NSObject *v7;
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
  objc_super v19;
  uint8_t buf[4];
  HUHomeHubHeaderView *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HUHomeHubHeaderView;
  v6 = -[HUHomeHubHeaderView initWithReuseIdentifier:](&v19, sel_initWithReuseIdentifier_, 0);
  if (v6)
  {
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v21 = v6;
      v22 = 2112;
      v23 = v8;
      v24 = 2112;
      v25 = v5;
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@, message = %@", buf, 0x20u);

    }
    -[HUHomeHubHeaderView _setupImageView](v6, "_setupImageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHomeHubHeaderView setImageView:](v6, "setImageView:", v9);

    -[HUHomeHubHeaderView _setupMessage:](v6, "_setupMessage:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHomeHubHeaderView setMessage:](v6, "setMessage:", v10);

    -[HUHomeHubHeaderView contentView](v6, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHomeHubHeaderView imageView](v6, "imageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "naui_addAutoLayoutSubview:", v12);

    -[HUHomeHubHeaderView contentView](v6, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHomeHubHeaderView message](v6, "message");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "naui_addAutoLayoutSubview:", v14);

    -[HUHomeHubHeaderView _setupConstraints](v6, "_setupConstraints");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHomeHubHeaderView setConstraints:](v6, "setConstraints:", v15);

    v16 = (void *)MEMORY[0x1E0CB3718];
    -[HUHomeHubHeaderView constraints](v6, "constraints");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "activateConstraints:", v17);

  }
  return v6;
}

- (id)_setupMessage:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0CEA700];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setText:", v4);

  objc_msgSend(v5, "setNumberOfLines:", 0);
  objc_msgSend(v5, "setLineBreakMode:", 0);
  objc_msgSend(v5, "setTextAlignment:", 1);
  objc_msgSend(v5, "sizeToFit");
  return v5;
}

- (id)_setupImageView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:", 4, 72.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("exclamationmark.triangle.fill"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v3);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v5);

  return v4;
}

- (id)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
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

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubHeaderView imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubHeaderView contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:constant:", v7, 15.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  -[HUHomeHubHeaderView imageView](self, "imageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "centerXAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubHeaderView contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "centerXAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  -[HUHomeHubHeaderView message](self, "message");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "centerXAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubHeaderView centerXAnchor](self, "centerXAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v17);

  -[HUHomeHubHeaderView message](self, "message");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubHeaderView imageView](self, "imageView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v21, 20.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v22);

  -[HUHomeHubHeaderView message](self, "message");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubHeaderView contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v27);

  -[HUHomeHubHeaderView message](self, "message");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "leadingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubHeaderView contentView](self, "contentView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "safeAreaLayoutGuide");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v32, 5.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v33);

  -[HUHomeHubHeaderView message](self, "message");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubHeaderView contentView](self, "contentView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "safeAreaLayoutGuide");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "trailingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:constant:", v38, 5.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v39);

  return v3;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UILabel)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (NSMutableArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
