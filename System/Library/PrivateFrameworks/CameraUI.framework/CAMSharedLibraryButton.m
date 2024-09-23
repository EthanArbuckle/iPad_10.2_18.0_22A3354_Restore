@implementation CAMSharedLibraryButton

- (CAMSharedLibraryButton)initWithLayoutStyle:(int64_t)a3
{
  CAMSharedLibraryButton *v3;
  CAMSharedLibraryButton *v4;
  uint64_t v5;
  UIImageView *glyphView;
  CAMSharedLibraryButton *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CAMSharedLibraryButton;
  v3 = -[CAMExpandableMenuButton initWithLayoutStyle:](&v9, sel_initWithLayoutStyle_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_sharedLibraryMode = 0;
    -[CAMExpandableMenuButton setHighlighted:forIndex:](v3, "setHighlighted:forIndex:", 1, 1);
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", 0);
    glyphView = v4->__glyphView;
    v4->__glyphView = (UIImageView *)v5;

    -[CAMSharedLibraryButton _updateImageForCurrentState](v4, "_updateImageForCurrentState");
    v7 = v4;
  }

  return v4;
}

- (void)setSharedLibraryMode:(int64_t)a3
{
  if (self->_sharedLibraryMode != a3)
  {
    self->_sharedLibraryMode = a3;
    -[CAMExpandableMenuButton setSelectedIndex:](self, "setSelectedIndex:", -[CAMSharedLibraryButton _indexForSharedLibraryMode:](self, "_indexForSharedLibraryMode:"));
    -[CAMSharedLibraryButton _updateImageForCurrentState](self, "_updateImageForCurrentState");
  }
}

- (int64_t)_indexForSharedLibraryMode:(int64_t)a3
{
  return CAMSharedLibraryModeIsOn(a3);
}

- (int64_t)numberOfMenuItems
{
  return 2;
}

- (void)_updateImageForCurrentState
{
  int64_t v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = -[CAMSharedLibraryButton _indexForSharedLibraryMode:](self, "_indexForSharedLibraryMode:", -[CAMSharedLibraryButton sharedLibraryMode](self, "sharedLibraryMode"));
  v4 = CFSTR("CAMSharedLibraryButton");
  if (v3 != 1)
    v4 = 0;
  if (v3)
    v5 = v4;
  else
    v5 = CFSTR("CAMSharedLibraryButtonOff");
  v6 = (void *)MEMORY[0x1E0DC3870];
  CAMCameraUIFrameworkBundle();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageNamed:inBundle:", v5, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithRenderingMode:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSharedLibraryButton _glyphView](self, "_glyphView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:", v8);

}

- (id)imageForAccessibilityHUD
{
  int64_t v2;
  const __CFString *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = -[CAMSharedLibraryButton _indexForSharedLibraryMode:](self, "_indexForSharedLibraryMode:", -[CAMSharedLibraryButton sharedLibraryMode](self, "sharedLibraryMode"));
  v3 = CFSTR("CAMSharedLibraryButton-AXHUD");
  if (v2 != 1)
    v3 = 0;
  if (v2)
    v4 = v3;
  else
    v4 = CFSTR("CAMSharedLibraryButtonOff-AXHUD");
  v5 = (void *)MEMORY[0x1E0DC3870];
  CAMCameraUIFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageNamed:inBundle:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithRenderingMode:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)sharedLibraryMode
{
  return self->_sharedLibraryMode;
}

- (UIImageView)_glyphView
{
  return self->__glyphView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__glyphView, 0);
}

@end
