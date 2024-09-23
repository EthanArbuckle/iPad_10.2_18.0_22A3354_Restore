@implementation CAMDrawerAspectRatioButton

- (CAMDrawerAspectRatioButton)initWithLayoutStyle:(int64_t)a3
{
  CAMDrawerAspectRatioButton *v3;
  uint64_t v4;
  NSMutableDictionary *imagesByText;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMDrawerAspectRatioButton;
  v3 = -[CAMControlDrawerMenuButton initWithLayoutStyle:](&v7, sel_initWithLayoutStyle_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    imagesByText = v3->__imagesByText;
    v3->__imagesByText = (NSMutableDictionary *)v4;

  }
  return v3;
}

- (int64_t)controlType
{
  return 2;
}

- (void)setAspectRatio:(int64_t)a3
{
  if (self->_aspectRatio != a3)
  {
    self->_aspectRatio = a3;
    -[CAMControlDrawerMenuButton updateLabelsIfNeeded](self, "updateLabelsIfNeeded");
    -[CAMDrawerAspectRatioButton updateImage](self, "updateImage");
  }
}

- (BOOL)isMenuItemSelected:(id)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");
  LOBYTE(self) = v5 == -[CAMDrawerAspectRatioButton aspectRatio](self, "aspectRatio");

  return (char)self;
}

- (id)loadMenuItems
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  CAMControlDrawerMenuItem *v11;
  void *v12;
  CAMControlDrawerMenuItem *v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "supportedAspectRatioCropValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(obj);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v8), "integerValue");
        objc_msgSend((id)objc_opt_class(), "localizedTitleForAspectRatio:useBriefText:", v9, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = [CAMControlDrawerMenuItem alloc];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[CAMControlDrawerMenuItem initWithTitle:value:](v11, "initWithTitle:value:", v10, v12);

        objc_msgSend(v2, "addObject:", v13);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  return v2;
}

- (void)didSelectMenuItem:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = -[CAMDrawerAspectRatioButton aspectRatio](self, "aspectRatio");
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "integerValue");
  if (v7 != v5)
  {
    -[CAMDrawerAspectRatioButton setAspectRatio:](self, "setAspectRatio:", v7);
    -[CAMDrawerAspectRatioButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }
}

- (id)imageNameForCurrentState
{
  return 0;
}

+ (id)localizedTitleForAspectRatio:(int64_t)a3 useBriefText:(BOOL)a4
{
  __CFString *v4;
  void *v5;

  v4 = CFSTR("ASPECT_FOUR_THREE");
  switch(a3)
  {
    case 0:
      goto LABEL_9;
    case 1:
      if (a4)
        v4 = CFSTR("ASPECT_SQUARE_BRIEF");
      else
        v4 = CFSTR("ASPECT_SQUARE");
      goto LABEL_9;
    case 2:
      v4 = CFSTR("ASPECT_SIXTEEN_NINE");
      goto LABEL_9;
    case 3:
      v4 = CFSTR("ASPECT_THREE_TWO");
LABEL_9:
      CAMLocalizedFrameworkString(v4, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (id)_imageForAspectRatio:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend((id)objc_opt_class(), "localizedTitleForAspectRatio:useBriefText:", a3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMDrawerAspectRatioButton _imagesByText](self, "_imagesByText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 && v4)
  {
    +[CAMFont cameraFontOfSize:](CAMFont, "cameraFontOfSize:", 16.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMDrawerAspectRatioButton window](self, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "screen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scale");
    CAMImageWithTextColorFont(v4, v8, v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[CAMDrawerAspectRatioButton _imagesByText](self, "_imagesByText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, v4);

  }
  return v6;
}

- (void)updateImage
{
  void *v3;
  void *v4;

  -[CAMDrawerAspectRatioButton _imageForAspectRatio:](self, "_imageForAspectRatio:", -[CAMDrawerAspectRatioButton aspectRatio](self, "aspectRatio"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMControlDrawerButton _imageView](self, "_imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v3);

  -[CAMDrawerAspectRatioButton setNeedsLayout](self, "setNeedsLayout");
}

- (id)hudItemForAccessibilityHUDManager:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CAMDrawerAspectRatioButton;
  -[CAMControlDrawerMenuButton hudItemForAccessibilityHUDManager:](&v9, sel_hudItemForAccessibilityHUDManager_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend((id)objc_opt_class(), "localizedTitleForAspectRatio:useBriefText:", -[CAMDrawerAspectRatioButton aspectRatio](self, "aspectRatio"), 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTitle:", v7);

    }
  }
  return v5;
}

- (int64_t)aspectRatio
{
  return self->_aspectRatio;
}

- (NSMutableDictionary)_imagesByText
{
  return self->__imagesByText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__imagesByText, 0);
}

@end
