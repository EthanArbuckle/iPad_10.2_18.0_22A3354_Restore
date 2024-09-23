@implementation CKAcknowledgmentIconCollectionReusableView

+ (id)reuseIdentifier
{
  return CFSTR("CKAcknowledgmentIconCollectionReusableView_reuseIdentifier");
}

+ (id)supplementaryViewKind
{
  return CFSTR("CKAcknowledgmentIconCollectionReusableView_supplementaryViewKind");
}

- (CKAcknowledgmentIconCollectionReusableView)initWithFrame:(CGRect)a3
{
  CKAcknowledgmentIconCollectionReusableView *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKAcknowledgmentIconCollectionReusableView;
  v3 = -[CKAcknowledgmentIconCollectionReusableView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA658]);
    v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[CKAcknowledgmentIconCollectionReusableView setGlyphImageView:](v3, "setGlyphImageView:", v5);

    -[CKAcknowledgmentIconCollectionReusableView glyphImageView](v3, "glyphImageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAcknowledgmentIconCollectionReusableView addSubview:](v3, "addSubview:", v6);

  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKAcknowledgmentIconCollectionReusableView;
  -[CKAcknowledgmentIconCollectionReusableView layoutSubviews](&v12, sel_layoutSubviews);
  -[CKAcknowledgmentIconCollectionReusableView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKAcknowledgmentIconCollectionReusableView glyphImageView](self, "glyphImageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (void)configureWithAcknowledgmentTally:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = objc_msgSend(a3, "type");
  v5 = (void *)MEMORY[0x1E0CEA638];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageAcknowledgmentPollingImageNameForAcknowledgmentType:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ckTemplateImageNamed:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAcknowledgmentIconCollectionReusableView glyphImageView](self, "glyphImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:", v8);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "theme");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "messageAcknowledgment:acknowledgmentImageColor:", 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAcknowledgmentIconCollectionReusableView glyphImageView](self, "glyphImageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTintColor:", v12);

  -[CKAcknowledgmentIconCollectionReusableView layoutIfNeeded](self, "layoutIfNeeded");
}

- (UIImageView)glyphImageView
{
  return self->_glyphImageView;
}

- (void)setGlyphImageView:(id)a3
{
  objc_storeStrong((id *)&self->_glyphImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphImageView, 0);
}

@end
