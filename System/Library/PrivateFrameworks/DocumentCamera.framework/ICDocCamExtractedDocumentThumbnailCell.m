@implementation ICDocCamExtractedDocumentThumbnailCell

- (ICDocCamExtractedDocumentThumbnailCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  ICDocCamExtractedDocumentThumbnailCell *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
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
  objc_super v42;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v42.receiver = self;
  v42.super_class = (Class)ICDocCamExtractedDocumentThumbnailCell;
  v7 = -[ICDocCamExtractedDocumentThumbnailCell initWithFrame:](&v42, sel_initWithFrame_);
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.2);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = objc_msgSend(v8, "CGColor");
    -[ICDocCamExtractedDocumentThumbnailCell layer](v7, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBorderColor:", v9);

    -[ICDocCamExtractedDocumentThumbnailCell layer](v7, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBorderWidth:", 0.5);

    v12 = objc_alloc_init(MEMORY[0x24BDF6AE8]);
    -[ICDocCamExtractedDocumentThumbnailCell setImageView:](v7, "setImageView:", v12);

    -[ICDocCamExtractedDocumentThumbnailCell imageView](v7, "imageView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContentMode:", 2);

    -[ICDocCamExtractedDocumentThumbnailCell imageView](v7, "imageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setClipsToBounds:", 1);

    -[ICDocCamExtractedDocumentThumbnailCell imageView](v7, "imageView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFrame:", x, y, width, height);

    -[ICDocCamExtractedDocumentThumbnailCell imageView](v7, "imageView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAccessibilityIgnoresInvertColors:", 1);

    -[ICDocCamExtractedDocumentThumbnailCell imageView](v7, "imageView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[ICDocCamExtractedDocumentThumbnailCell contentView](v7, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamExtractedDocumentThumbnailCell imageView](v7, "imageView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v19);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamExtractedDocumentThumbnailCell contentView](v7, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamExtractedDocumentThumbnailCell imageView](v7, "imageView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v25);

    -[ICDocCamExtractedDocumentThumbnailCell contentView](v7, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamExtractedDocumentThumbnailCell imageView](v7, "imageView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v30);

    -[ICDocCamExtractedDocumentThumbnailCell contentView](v7, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamExtractedDocumentThumbnailCell imageView](v7, "imageView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v35);

    -[ICDocCamExtractedDocumentThumbnailCell contentView](v7, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "bottomAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamExtractedDocumentThumbnailCell imageView](v7, "imageView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "bottomAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v40);

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v20);
  }
  return v7;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICDocCamExtractedDocumentThumbnailCell;
  -[ICDocCamExtractedDocumentThumbnailCell prepareForReuse](&v4, sel_prepareForReuse);
  -[ICDocCamExtractedDocumentThumbnailCell imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", 0);

}

- (void)applyLayoutAttributes:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICDocCamExtractedDocumentThumbnailCell;
  -[ICDocCamExtractedDocumentThumbnailCell applyLayoutAttributes:](&v3, sel_applyLayoutAttributes_, a3);
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
