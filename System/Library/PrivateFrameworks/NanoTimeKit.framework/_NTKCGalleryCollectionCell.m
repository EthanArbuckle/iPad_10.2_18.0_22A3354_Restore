@implementation _NTKCGalleryCollectionCell

+ (id)reuseIdentifier
{
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "deviceCategory");

  switch(v4)
  {
    case 2:
      objc_msgSend(a1, "luxoReuseIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend(a1, "aloeReuseIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      objc_msgSend(a1, "agaveReuseIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      objc_msgSend(a1, "avoniaReuseIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      objc_msgSend(a1, "classicReuseIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v5;
}

+ (id)classicReuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)luxoReuseIdentifier
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "classicReuseIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("-luxo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)aloeReuseIdentifier
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "classicReuseIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("-aloe"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)agaveReuseIdentifier
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "classicReuseIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("-agave"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)avoniaReuseIdentifier
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "classicReuseIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("-avonia"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (_NTKCGalleryCollectionCell)initWithFrame:(CGRect)a3
{
  _NTKCGalleryCollectionCell *v3;
  double v4;
  double v5;
  NTKCFaceContainerView *v6;
  NTKCFaceContainerView *faceContainerView;
  id v8;
  void *v9;
  uint64_t v10;
  UIStackView *contentStack;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;
  _QWORD v29[3];
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)_NTKCGalleryCollectionCell;
  v3 = -[_NTKCGalleryCollectionCell initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = FaceSize();
    v6 = -[NTKCFaceContainerView initWithFaceSize:style:]([NTKCFaceContainerView alloc], "initWithFaceSize:style:", 1, v4, v5);
    faceContainerView = v3->_faceContainerView;
    v3->_faceContainerView = v6;

    v8 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v30[0] = v3->_faceContainerView;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithArrangedSubviews:", v9);
    contentStack = v3->_contentStack;
    v3->_contentStack = (UIStackView *)v10;

    -[UIStackView setAlignment:](v3->_contentStack, "setAlignment:", 3);
    -[UIStackView setAxis:](v3->_contentStack, "setAxis:", 1);
    -[UIStackView setSpacing:](v3->_contentStack, "setSpacing:", 10.0);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v3->_contentStack, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_NTKCGalleryCollectionCell contentView](v3, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v3->_contentStack);

    v23 = (void *)MEMORY[0x1E0CB3718];
    -[_NTKCGalleryCollectionCell contentView](v3, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView leadingAnchor](v3->_contentStack, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v24;
    -[_NTKCGalleryCollectionCell contentView](v3, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView trailingAnchor](v3->_contentStack, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v16;
    -[_NTKCGalleryCollectionCell contentView](v3, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView topAnchor](v3->_contentStack, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v29[2] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "activateConstraints:", v21);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)_NTKCGalleryCollectionCell;
  -[_NTKCGalleryCollectionCell dealloc](&v4, sel_dealloc);
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NTKCGalleryCollectionCell;
  -[_NTKCGalleryCollectionCell prepareForReuse](&v3, sel_prepareForReuse);
  -[_NTKCGalleryCollectionCell setCalloutName:](self, "setCalloutName:", 0);
  -[NTKCFaceContainerView setFaceView:](self->_faceContainerView, "setFaceView:", 0);
}

- (UIView)faceView
{
  return -[NTKCFaceContainerView faceView](self->_faceContainerView, "faceView");
}

- (void)setFaceView:(id)a3
{
  -[NTKCFaceContainerView setFaceView:](self->_faceContainerView, "setFaceView:", a3);
}

- (void)setCalloutName:(id)a3
{
  char v4;
  void *v5;
  NSString *v6;
  NSString *calloutName;
  NSUInteger v8;
  UILabel *nameLabel;
  UILabel *v10;
  UILabel *v11;
  void *v12;
  void *v13;
  double v14;
  id v15;

  v15 = a3;
  v4 = objc_msgSend(v15, "isEqualToString:", self->_calloutName);
  v5 = v15;
  if ((v4 & 1) == 0)
  {
    v6 = (NSString *)objc_msgSend(v15, "copy");
    calloutName = self->_calloutName;
    self->_calloutName = v6;

    v8 = -[NSString length](self->_calloutName, "length");
    nameLabel = self->_nameLabel;
    if (v8)
    {
      if (nameLabel)
      {
        -[UILabel setHidden:](nameLabel, "setHidden:", 0);
      }
      else
      {
        v10 = (UILabel *)objc_opt_new();
        v11 = self->_nameLabel;
        self->_nameLabel = v10;

        BPSTextColor();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](self->_nameLabel, "setTextColor:", v12);

        objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B08]);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](self->_nameLabel, "setFont:", v13);

        -[UILabel setAdjustsFontForContentSizeCategory:](self->_nameLabel, "setAdjustsFontForContentSizeCategory:", 1);
        -[UILabel setAllowsDefaultTighteningForTruncation:](self->_nameLabel, "setAllowsDefaultTighteningForTruncation:", 1);
        -[UILabel setMinimumScaleFactor:](self->_nameLabel, "setMinimumScaleFactor:", 0.8);
        LODWORD(v14) = 0.5;
        -[UILabel _setHyphenationFactor:](self->_nameLabel, "_setHyphenationFactor:", v14);
        -[UILabel setTextAlignment:](self->_nameLabel, "setTextAlignment:", 1);
        -[UILabel setNumberOfLines:](self->_nameLabel, "setNumberOfLines:", 0);
        -[UIStackView addArrangedSubview:](self->_contentStack, "addArrangedSubview:", self->_nameLabel);
      }
      -[UILabel setText:](self->_nameLabel, "setText:", self->_calloutName);
    }
    else
    {
      -[UILabel setHidden:](nameLabel, "setHidden:", 1);
    }
    v5 = v15;
  }

}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_NTKCGalleryCollectionCell;
  -[_NTKCGalleryCollectionCell setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[_NTKCGalleryCollectionCell _highlight](self, "_highlight");
}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_NTKCGalleryCollectionCell;
  -[_NTKCGalleryCollectionCell setSelected:](&v4, sel_setSelected_, a3);
  -[_NTKCGalleryCollectionCell _highlight](self, "_highlight");
}

- (void)_highlight
{
  uint64_t v3;

  if ((-[_NTKCGalleryCollectionCell isSelected](self, "isSelected") & 1) != 0)
    v3 = 1;
  else
    v3 = -[_NTKCGalleryCollectionCell isHighlighted](self, "isHighlighted");
  -[NTKCFaceContainerView setHighlighted:](self->_faceContainerView, "setHighlighted:", v3);
}

- (void)setActive:(BOOL)a3
{
  -[NTKCFaceContainerView setActive:](self->_faceContainerView, "setActive:", a3);
}

- (BOOL)active
{
  return -[NTKCFaceContainerView active](self->_faceContainerView, "active");
}

- (NTKCFaceContainerView)faceContainerView
{
  return self->_faceContainerView;
}

- (void)setFaceContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_faceContainerView, a3);
}

- (NSString)calloutName
{
  return self->_calloutName;
}

- (UIImage)calloutImage
{
  return self->_calloutImage;
}

- (void)setCalloutImage:(id)a3
{
  objc_storeStrong((id *)&self->_calloutImage, a3);
}

- (UIFontMetrics)fontMetrics
{
  return self->_fontMetrics;
}

- (void)setFontMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_fontMetrics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontMetrics, 0);
  objc_storeStrong((id *)&self->_calloutImage, 0);
  objc_storeStrong((id *)&self->_calloutName, 0);
  objc_storeStrong((id *)&self->_faceContainerView, 0);
  objc_storeStrong((id *)&self->_contentStack, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
}

@end
