@implementation VOTImageExplorerImageTableViewCell

- (VOTImageExplorerImageTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  VOTImageExplorerImageTableViewCell *v4;
  VOTImageExplorerImageTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VOTImageExplorerImageTableViewCell;
  v4 = -[VOTImageExplorerImageTableViewCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
    -[VOTImageExplorerImageTableViewCell initializeImageView](v4, "initializeImageView");
  return v5;
}

- (void)initializeImageView
{
  VOTImageExplorerImageView *v3;
  VOTImageExplorerImageView *v4;
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
  id v24;

  v3 = [VOTImageExplorerImageView alloc];
  -[VOTImageExplorerImageTableViewCell frame](self, "frame");
  v4 = -[VOTImageExplorerImageView initWithFrame:](v3, "initWithFrame:");
  -[VOTImageExplorerImageTableViewCell setExplorerImageView:](self, "setExplorerImageView:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageTableViewCell explorerImageView](self, "explorerImageView"));
  objc_msgSend(v5, "setContentMode:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageTableViewCell explorerImageView](self, "explorerImageView"));
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageTableViewCell explorerImageView](self, "explorerImageView"));
  objc_msgSend(v7, "setClipsToBounds:", 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageTableViewCell explorerImageView](self, "explorerImageView"));
  -[VOTImageExplorerImageTableViewCell addSubview:](self, "addSubview:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageTableViewCell explorerImageView](self, "explorerImageView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "leftAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageTableViewCell leftAnchor](self, "leftAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
  objc_msgSend(v12, "setActive:", 1);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageTableViewCell explorerImageView](self, "explorerImageView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "rightAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageTableViewCell rightAnchor](self, "rightAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v15));
  objc_msgSend(v16, "setActive:", 1);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageTableViewCell explorerImageView](self, "explorerImageView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "topAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageTableViewCell topAnchor](self, "topAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
  objc_msgSend(v20, "setActive:", 1);

  v24 = (id)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageTableViewCell explorerImageView](self, "explorerImageView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bottomAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageTableViewCell bottomAnchor](self, "bottomAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v22));
  objc_msgSend(v23, "setActive:", 1);

}

- (VOTImageExplorerImageView)explorerImageView
{
  return self->_explorerImageView;
}

- (void)setExplorerImageView:(id)a3
{
  objc_storeStrong((id *)&self->_explorerImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explorerImageView, 0);
}

@end
