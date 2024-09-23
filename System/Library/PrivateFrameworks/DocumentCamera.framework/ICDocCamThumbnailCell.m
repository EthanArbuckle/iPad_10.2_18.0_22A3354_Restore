@implementation ICDocCamThumbnailCell

- (ICDocCamThumbnailCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  ICDocCamThumbnailCell *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  id v15;
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
  objc_super v45;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v45.receiver = self;
  v45.super_class = (Class)ICDocCamThumbnailCell;
  v7 = -[ICDocCamThumbnailCell initWithFrame:](&v45, sel_initWithFrame_);
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = objc_msgSend(v8, "CGColor");
    -[ICDocCamThumbnailCell layer](v7, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setShadowColor:", v9);

    -[ICDocCamThumbnailCell layer](v7, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setShadowRadius:", 1.0);

    -[ICDocCamThumbnailCell layer](v7, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setShadowOffset:", 0.0, 0.0);

    -[ICDocCamThumbnailCell layer](v7, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = 1045220557;
    objc_msgSend(v13, "setShadowOpacity:", v14);

    v15 = objc_alloc_init(MEMORY[0x24BDF6AE8]);
    -[ICDocCamThumbnailCell setImageView:](v7, "setImageView:", v15);

    -[ICDocCamThumbnailCell imageView](v7, "imageView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setContentMode:", 2);

    -[ICDocCamThumbnailCell imageView](v7, "imageView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setClipsToBounds:", 1);

    -[ICDocCamThumbnailCell imageView](v7, "imageView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFrame:", x, y, width, height);

    -[ICDocCamThumbnailCell imageView](v7, "imageView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAccessibilityIgnoresInvertColors:", 1);

    -[ICDocCamThumbnailCell imageView](v7, "imageView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[ICDocCamThumbnailCell contentView](v7, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamThumbnailCell imageView](v7, "imageView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSubview:", v22);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamThumbnailCell contentView](v7, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamThumbnailCell imageView](v7, "imageView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObject:", v28);

    -[ICDocCamThumbnailCell contentView](v7, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamThumbnailCell imageView](v7, "imageView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "trailingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObject:", v33);

    -[ICDocCamThumbnailCell contentView](v7, "contentView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "topAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamThumbnailCell imageView](v7, "imageView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "topAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObject:", v38);

    -[ICDocCamThumbnailCell contentView](v7, "contentView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "bottomAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamThumbnailCell imageView](v7, "imageView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "bottomAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObject:", v43);

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v23);
  }
  return v7;
}

- (void)prepareForReuse
{
  void *v3;
  double v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICDocCamThumbnailCell;
  -[ICDocCamThumbnailCell prepareForReuse](&v6, sel_prepareForReuse);
  -[ICDocCamThumbnailCell layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 1.0;
  objc_msgSend(v3, "setSpeed:", v4);

  -[ICDocCamThumbnailCell imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", 0);

}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  id v20;
  uint64_t v21;
  void *v22;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ICDocCamThumbnailCell;
  -[ICDocCamThumbnailCell applyLayoutAttributes:](&v23, sel_applyLayoutAttributes_, v4);
  v5 = v4;
  objc_opt_class();
  v6 = 0.0;
  v7 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "imageWidth");
    v7 = v8;
    objc_msgSend(v5, "imageHeight");
    v6 = v9;
  }
  -[ICDocCamThumbnailCell imageView](self, "imageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFrame:", 0.0, 0.0, v7, v6);

  LODWORD(v10) = objc_msgSend(v5, "renderShadow");
  -[ICDocCamThumbnailCell layer](self, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  LODWORD(v13) = 1045220557;
  if (!(_DWORD)v10)
    *(float *)&v13 = 0.0;
  objc_msgSend(v11, "setShadowOpacity:", v13);

  if (objc_msgSend(v5, "renderBorder"))
  {
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.2);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = objc_msgSend(v14, "CGColor");
    -[ICDocCamThumbnailCell layer](self, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBorderColor:", v15);

    -[ICDocCamThumbnailCell layer](self, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = 0.5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = objc_msgSend(v20, "CGColor");
    -[ICDocCamThumbnailCell layer](self, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setBorderColor:", v21);

    -[ICDocCamThumbnailCell layer](self, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = 0.0;
  }
  objc_msgSend(v17, "setBorderWidth:", v19);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v22;

  -[ICDocCamThumbnailCell imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  v6 = v5;
  -[ICDocCamThumbnailCell imageView](self, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "size");
  v10 = v9;

  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Scan thumbnail"), CFSTR("Scan thumbnail"), CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 >= v10)
    v12 = CFSTR("portrait");
  else
    v12 = CFSTR("landscape");
  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", v12, v12, CFSTR("Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamThumbnailCell indexStringForAccessibility](self, "indexStringForAccessibility");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  __DCAccessibilityStringForVariables(1, v11, v14, v15, v16, v17, v18, v19, (uint64_t)v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)accessibilityHint
{
  return +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Double-tap to preview scan."), CFSTR("Double-tap to preview scan."), CFSTR("Localizable"));
}

- (id)indexStringForAccessibility
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  -[ICDocCamThumbnailCell parentCollectionView](self, "parentCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "indexPathForCell:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && objc_msgSend(v5, "item") != 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = objc_msgSend(v6, "item") + 1;
      v9 = objc_msgSend(v4, "numberOfItemsInSection:", objc_msgSend(v6, "section"));
      v10 = (void *)MEMORY[0x24BDD17C8];
      +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("%lu of %lu"), CFSTR("%lu of %lu"), CFSTR("Localizable"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringWithFormat:", v11, v8, v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)parentCollectionView
{
  void *v2;
  void *v3;
  uint64_t v4;

  -[ICDocCamThumbnailCell superview](self, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v2, "superview");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      v2 = v3;
      if (!v3)
        goto LABEL_7;
    }
    v4 = objc_opt_class();
    DCDynamicCast(v4, (uint64_t)v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
LABEL_7:

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
