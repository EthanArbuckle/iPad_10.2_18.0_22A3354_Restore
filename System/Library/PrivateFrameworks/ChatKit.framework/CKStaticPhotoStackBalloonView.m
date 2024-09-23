@implementation CKStaticPhotoStackBalloonView

- (void)configureForMessagePart:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKStaticPhotoStackBalloonView;
  v4 = a3;
  -[CKBalloonView configureForMessagePart:](&v6, sel_configureForMessagePart_, v4);
  objc_msgSend(v4, "mediaObjects", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKStaticPhotoStackBalloonView setMediaObjects:](self, "setMediaObjects:", v5);
}

- (void)setMediaObjects:(id)a3
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  -[CKStaticPhotoStackBalloonView mediaObjects](self, "mediaObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v8, "isEqual:", v5);

  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_mediaObjects, a3);
    -[CKStaticPhotoStackBalloonView stackView](self, "stackView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperview");

    -[CKStaticPhotoStackBalloonView setStackView:](self, "setStackView:", 0);
    -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
  }

}

- (void)prepareForDisplay
{
  void *v3;
  CKStaticImageStackView *v4;
  void *v5;
  CKStaticImageStackView *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKStaticPhotoStackBalloonView;
  -[CKBalloonView prepareForDisplay](&v11, sel_prepareForDisplay);
  -[CKStaticPhotoStackBalloonView stackView](self, "stackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKStaticPhotoStackBalloonView setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    v4 = [CKStaticImageStackView alloc];
    -[CKStaticPhotoStackBalloonView mediaObjects](self, "mediaObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CKStaticImageStackView initWithFrame:mediaObjects:](v4, "initWithFrame:mediaObjects:", v5, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[CKStaticPhotoStackBalloonView setStackView:](self, "setStackView:", v6);

    -[CKStaticPhotoStackBalloonView stackCornerRadius](self, "stackCornerRadius");
    v8 = v7;
    -[CKStaticPhotoStackBalloonView stackView](self, "stackView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStackCornerRadius:", v8);

    -[CKStaticPhotoStackBalloonView stackView](self, "stackView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKStaticPhotoStackBalloonView addSubview:](self, "addSubview:", v10);

  }
}

- (double)stackCornerRadius
{
  return 20.0;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKStaticPhotoStackBalloonView;
  -[CKBalloonView layoutSubviews](&v4, sel_layoutSubviews);
  -[CKStaticPhotoStackBalloonView stackView](self, "stackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKStaticPhotoStackBalloonView bounds](self, "bounds");
  objc_msgSend(v3, "setFrame:");

}

- (NSArray)mediaObjects
{
  return self->_mediaObjects;
}

- (CKStaticImageStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_mediaObjects, 0);
}

@end
