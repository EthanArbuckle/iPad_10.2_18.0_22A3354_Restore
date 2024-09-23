@implementation _CPUIAlbumContainer

- (_CPUIAlbumContainer)initWithButton:(id)a3
{
  id v4;
  _CPUIAlbumContainer *v5;
  _CPUIAlbumContainer *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id WeakRetained;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;
  _QWORD v28[5];

  v28[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)_CPUIAlbumContainer;
  v5 = -[_CPUIAlbumContainer initWithFrame:](&v27, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v6 = v5;
  if (v5)
  {
    -[_CPUIAlbumContainer setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_CPUIAlbumContainer addSubview:](v6, "addSubview:", v4);
    v7 = objc_storeWeak((id *)&v6->_button, v4);
    v20 = (void *)MEMORY[0x24BDD1628];
    v8 = v7;
    objc_msgSend(v4, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CPUIAlbumContainer leadingAnchor](v6, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v24;
    WeakRetained = objc_loadWeakRetained((id *)&v6->_button);
    objc_msgSend(WeakRetained, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CPUIAlbumContainer trailingAnchor](v6, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v19;
    v18 = objc_loadWeakRetained((id *)&v6->_button);
    objc_msgSend(v18, "bottomAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CPUIAlbumContainer bottomAnchor](v6, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v11;
    v12 = objc_loadWeakRetained((id *)&v6->_button);
    objc_msgSend(v12, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CPUIAlbumContainer topAnchor](v6, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28[3] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "activateConstraints:", v16);

  }
  return v6;
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[_CPUIAlbumContainer button](self, "button");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CPUIModernButton)button
{
  return (CPUIModernButton *)objc_loadWeakRetained((id *)&self->_button);
}

- (void)setButton:(id)a3
{
  objc_storeWeak((id *)&self->_button, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_button);
}

@end
