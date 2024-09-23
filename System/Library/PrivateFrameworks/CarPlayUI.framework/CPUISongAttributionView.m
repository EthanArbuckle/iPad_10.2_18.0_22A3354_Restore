@implementation CPUISongAttributionView

- (CPUISongAttributionView)initWithFrame:(CGRect)a3
{
  CPUISongAttributionView *v3;
  CPUISongAttributionView *v4;
  void *v5;
  uint64_t v6;
  CPUIModernButton *button;
  uint64_t v8;
  UIImageView *artworkImageView;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
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
  objc_super v38;
  _QWORD v39[11];

  v39[9] = *MEMORY[0x24BDAC8D0];
  v38.receiver = self;
  v38.super_class = (Class)CPUISongAttributionView;
  v3 = -[CPUISongAttributionView initWithFrame:](&v38, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CPUISongAttributionView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsGroupBlending:", 0);

    -[CPUISongAttributionView setClipsToBounds:](v4, "setClipsToBounds:", 1);
    v6 = objc_opt_new();
    button = v4->_button;
    v4->_button = (CPUIModernButton *)v6;

    -[CPUIModernButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CPUIModernButton setShowButtonBackgroundShape:](v4->_button, "setShowButtonBackgroundShape:", 1);
    -[CPUIModernButton setContentEdgeInsets:](v4->_button, "setContentEdgeInsets:", 0.0, 24.0, 0.0, 5.0);
    v8 = objc_opt_new();
    artworkImageView = v4->_artworkImageView;
    v4->_artworkImageView = (UIImageView *)v8;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_artworkImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v4->_artworkImageView, "setContentMode:", 2);
    -[UIImageView setClipsToBounds:](v4->_artworkImageView, "setClipsToBounds:", 1);
    -[CPUISongAttributionView addSubview:](v4, "addSubview:", v4->_button);
    -[CPUISongAttributionView addSubview:](v4, "addSubview:", v4->_artworkImageView);
    v27 = (void *)MEMORY[0x24BDD1628];
    -[CPUIModernButton leadingAnchor](v4->_button, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUISongAttributionView leadingAnchor](v4, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v36);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v35;
    -[CPUIModernButton trailingAnchor](v4->_button, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUISongAttributionView trailingAnchor](v4, "trailingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v33);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v32;
    -[CPUIModernButton topAnchor](v4->_button, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUISongAttributionView topAnchor](v4, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v39[2] = v29;
    -[CPUIModernButton bottomAnchor](v4->_button, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUISongAttributionView bottomAnchor](v4, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v26);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v39[3] = v25;
    -[UIImageView heightAnchor](v4->_artworkImageView, "heightAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView widthAnchor](v4->_artworkImageView, "widthAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v39[4] = v22;
    -[UIImageView widthAnchor](v4->_artworkImageView, "widthAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToConstant:", 14.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v39[5] = v20;
    -[UIImageView leadingAnchor](v4->_artworkImageView, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUISongAttributionView leadingAnchor](v4, "leadingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, 4.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v39[6] = v12;
    -[UIImageView centerYAnchor](v4->_artworkImageView, "centerYAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUISongAttributionView centerYAnchor](v4, "centerYAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v39[7] = v15;
    -[CPUISongAttributionView heightAnchor](v4, "heightAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToConstant:", 22.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v39[8] = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "activateConstraints:", v18);

  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CPUISongAttributionView;
  -[CPUISongAttributionView layoutSubviews](&v8, sel_layoutSubviews);
  -[CPUISongAttributionView artworkImageView](self, "artworkImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4 * 0.5;
  -[CPUISongAttributionView artworkImageView](self, "artworkImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setContinuousCornerRadius:", v5);

  -[CPUISongAttributionView bounds](self, "bounds");
  -[CPUISongAttributionView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", v7 * 0.5);
}

- (void)setArtwork:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_artwork, a3);
  v5 = a3;
  -[CPUISongAttributionView artworkImageView](self, "artworkImageView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v5);

}

- (void)setName:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_name, a3);
  v5 = a3;
  -[CPUISongAttributionView button](self, "button");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:forState:", v5, 0);

}

- (CPUIModernButton)button
{
  return self->_button;
}

- (UIImage)artwork
{
  return self->_artwork;
}

- (NSString)name
{
  return self->_name;
}

- (UIImageView)artworkImageView
{
  return self->_artworkImageView;
}

- (void)setArtworkImageView:(id)a3
{
  objc_storeStrong((id *)&self->_artworkImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkImageView, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
