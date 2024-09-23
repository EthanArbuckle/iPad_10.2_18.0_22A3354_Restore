@implementation _CPUIImageRowCellImageTitleItem

- (_CPUIImageRowCellImageTitleItem)initWithFrame:(CGRect)a3
{
  _CPUIImageRowCellImageTitleItem *v3;
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
  double v17;
  double v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x24BDAC8D0];
  v26.receiver = self;
  v26.super_class = (Class)_CPUIImageRowCellImageTitleItem;
  v3 = -[_CPUIImageRowCellImageTitleItem initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "_setCornerRadius:", 6.0);
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v4, "setContentHorizontalAlignment:", 3);
    objc_msgSend(v4, "setContentVerticalAlignment:", 3);
    objc_msgSend(v4, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContentMode:", 2);

    objc_msgSend(v4, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClipsToBounds:", 1);

    objc_msgSend(v4, "imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setContinuousCornerRadius:", 4.0);

    -[_CPUIImageRowCellImageTitleItem setButton:](v3, "setButton:", v4);
    -[_CPUIImageRowCellImageTitleItem button](v3, "button");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("CPListImageRowItemImage"));

    -[_CPUIImageRowCellImageTitleItem addSubview:](v3, "addSubview:", v4);
    v20 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v4, "widthAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CPUIImageRowCellImageTitleItem widthAnchor](v3, "widthAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v23;
    objc_msgSend(v4, "heightAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "widthAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v21);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v9;
    objc_msgSend(v4, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CPUIImageRowCellImageTitleItem topAnchor](v3, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v12;
    objc_msgSend(v4, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CPUIImageRowCellImageTitleItem leadingAnchor](v3, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27[3] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "activateConstraints:", v16);

    LODWORD(v17) = 1148846080;
    -[_CPUIImageRowCellImageTitleItem setContentCompressionResistancePriority:forAxis:](v3, "setContentCompressionResistancePriority:forAxis:", 0, v17);
    LODWORD(v18) = 1148846080;
    -[_CPUIImageRowCellImageTitleItem setContentHuggingPriority:forAxis:](v3, "setContentHuggingPriority:forAxis:", 0, v18);

  }
  return v3;
}

- (void)configureWithArtwork:(id)a3 title:(id)a4 imageSize:(double)a5 fallbackImage:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _CPUITopAlignedLabel *v23;
  _CPUITopAlignedLabel *label;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
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
  _QWORD v52[4];
  id v53;
  id v54;
  _QWORD v55[6];

  v55[4] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[_CPUIImageRowCellImageTitleItem button](self, "button");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "artworkCatalog");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14
    || (objc_msgSend(v14, "isEqual:", v10) & 1) == 0
    && (objc_msgSend(v14, "isArtworkVisuallyIdenticalToCatalog:", v10) & 1) == 0)
  {
    -[_CPUIImageRowCellImageTitleItem button](self, "button");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setImage:forState:", v12, 0);

    objc_msgSend(v10, "setFittingSize:", a5, a5);
    -[_CPUIImageRowCellImageTitleItem traitCollection](self, "traitCollection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "displayScale");
    objc_msgSend(v10, "setDestinationScale:");

    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCacheIdentifier:forCacheReference:", v18, self);

    -[_CPUIImageRowCellImageTitleItem button](self, "button");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = MEMORY[0x24BDAC760];
    v52[1] = 3221225472;
    v52[2] = __86___CPUIImageRowCellImageTitleItem_configureWithArtwork_title_imageSize_fallbackImage___block_invoke;
    v52[3] = &unk_24DF243F0;
    v53 = v12;
    objc_msgSend(v10, "setDestination:configurationBlock:", v19, v52);

  }
  v20 = objc_msgSend(v11, "length");
  -[_CPUIImageRowCellImageTitleItem label](self, "label");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v20)
  {

    if (!v22)
    {
      v23 = (_CPUITopAlignedLabel *)objc_opt_new();
      label = self->_label;
      self->_label = v23;

      -[_CPUITopAlignedLabel setTranslatesAutoresizingMaskIntoConstraints:](self->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[_CPUITopAlignedLabel setNumberOfLines:](self->_label, "setNumberOfLines:", 2);
      objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 10.0, *MEMORY[0x24BDF7888]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPUITopAlignedLabel setFont:](self->_label, "setFont:", v25);

      objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPUITopAlignedLabel setTextColor:](self->_label, "setTextColor:", v26);

      LODWORD(v27) = 1036831949;
      -[_CPUITopAlignedLabel _setHyphenationFactor:](self->_label, "_setHyphenationFactor:", v27);
      -[_CPUIImageRowCellImageTitleItem label](self, "label");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPUIImageRowCellImageTitleItem addSubview:](self, "addSubview:", v28);

      v44 = (void *)MEMORY[0x24BDD1628];
      -[_CPUITopAlignedLabel leadingAnchor](self->_label, "leadingAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPUIImageRowCellImageTitleItem button](self, "button");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "leadingAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "constraintEqualToAnchor:", v48);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = v47;
      -[_CPUITopAlignedLabel trailingAnchor](self->_label, "trailingAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPUIImageRowCellImageTitleItem button](self, "button");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "trailingAnchor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "constraintEqualToAnchor:", v43);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v55[1] = v42;
      -[_CPUITopAlignedLabel bottomAnchor](self->_label, "bottomAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPUIImageRowCellImageTitleItem bottomAnchor](self, "bottomAnchor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "constraintEqualToAnchor:", v40);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v55[2] = v29;
      -[_CPUITopAlignedLabel topAnchor](self->_label, "topAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPUIImageRowCellImageTitleItem button](self, "button");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "bottomAnchor");
      v51 = v14;
      v32 = v12;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "constraintEqualToAnchor:constant:", v33, 4.0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v55[3] = v34;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 4);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "activateConstraints:", v35);

      v12 = v32;
      v14 = v51;

    }
    -[_CPUIImageRowCellImageTitleItem label](self, "label");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setText:", v11);

    -[_CPUIImageRowCellImageTitleItem label](self, "label");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setAccessibilityIdentifier:", CFSTR("CPListImageRowItemImageTitle"));

    v54 = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v54, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CPUIImageRowCellImageTitleItem button](self, "button");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setAccessibilityUserInputLabels:", v38);

  }
  else
  {
    objc_msgSend(v21, "removeFromSuperview");

    -[_CPUIImageRowCellImageTitleItem setLabel:](self, "setLabel:", 0);
    -[_CPUIImageRowCellImageTitleItem button](self, "button");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setAccessibilityUserInputLabels:", MEMORY[0x24BDBD1A8]);
  }

  -[_CPUIImageRowCellImageTitleItem invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (_CPUIOutsetHighlightButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (_CPUITopAlignedLabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (CGSize)preferredSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredSize.width;
  height = self->_preferredSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreferredSize:(CGSize)a3
{
  self->_preferredSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
