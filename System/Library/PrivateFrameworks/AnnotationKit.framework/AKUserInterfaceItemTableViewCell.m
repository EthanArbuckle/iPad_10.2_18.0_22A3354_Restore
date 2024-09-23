@implementation AKUserInterfaceItemTableViewCell

- (AKUserInterfaceItemTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  AKUserInterfaceItemTableViewCell *v4;
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
  objc_super v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v20.receiver = self;
  v20.super_class = (Class)AKUserInterfaceItemTableViewCell;
  v4 = -[AKUserInterfaceItemTableViewCell initWithStyle:reuseIdentifier:](&v20, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKUserInterfaceItemTableViewCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", 0);
    -[AKUserInterfaceItemTableViewCell setImageView:](v4, "setImageView:", v6);

    -[AKUserInterfaceItemTableViewCell imageView](v4, "imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[AKUserInterfaceItemTableViewCell imageView](v4, "imageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setContentMode:", 4);

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKUserInterfaceItemTableViewCell imageView](v4, "imageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v9);

    -[AKUserInterfaceItemTableViewCell contentView](v4, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKUserInterfaceItemTableViewCell imageView](v4, "imageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v12);

    v21 = CFSTR("imageView");
    -[AKUserInterfaceItemTableViewCell imageView](v4, "imageView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[imageView]|"), 0, 0, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "activateConstraints:", v16);

    v17 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[imageView]|"), 0, 0, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "activateConstraints:", v18);

  }
  return v4;
}

- (BOOL)wantsInkUpdate
{
  return 1;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
