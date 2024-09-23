@implementation CAMLivePhotoButton

- (CAMLivePhotoButton)initWithLayoutStyle:(int64_t)a3
{
  CAMLivePhotoButton *v3;
  CAMLivePhotoBloomView *v4;
  CAMLivePhotoBloomView *bloomView;
  CAMLivePhotoButton *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMLivePhotoButton;
  v3 = -[CAMExpandableMenuButton initWithLayoutStyle:](&v8, sel_initWithLayoutStyle_, a3);
  if (v3)
  {
    v4 = objc_alloc_init(CAMLivePhotoBloomView);
    bloomView = v3->__bloomView;
    v3->__bloomView = v4;

    -[CAMLivePhotoButton _updateBaseImage](v3, "_updateBaseImage");
    v6 = v3;
  }

  return v3;
}

- (int64_t)livePhotoMode
{
  return -[CAMLivePhotoButton modeForIndex:](self, "modeForIndex:", -[CAMExpandableMenuButton selectedIndex](self, "selectedIndex"));
}

- (void)setLivePhotoMode:(int64_t)a3
{
  -[CAMLivePhotoButton setSelectedIndex:](self, "setSelectedIndex:", -[CAMLivePhotoButton indexForMode:](self, "indexForMode:", a3));
}

- (void)setSelectedIndex:(int64_t)a3
{
  objc_super v5;

  if (-[CAMExpandableMenuButton selectedIndex](self, "selectedIndex") != a3)
  {
    -[CAMLivePhotoButton interruptEnablingAnimation](self, "interruptEnablingAnimation");
    v5.receiver = self;
    v5.super_class = (Class)CAMLivePhotoButton;
    -[CAMExpandableMenuButton setSelectedIndex:](&v5, sel_setSelectedIndex_, a3);
    -[CAMLivePhotoButton _updateBaseImage](self, "_updateBaseImage");
  }
}

- (void)setAllowsAutomaticMode:(BOOL)a3 needsReloadData:(BOOL)a4
{
  _BOOL4 v4;
  int64_t v7;
  int64_t v8;

  if (self->_allowsAutomaticMode != a3)
  {
    v4 = a4;
    v7 = -[CAMLivePhotoButton modeForIndex:](self, "modeForIndex:", -[CAMExpandableMenuButton selectedIndex](self, "selectedIndex"));
    self->_allowsAutomaticMode = a3;
    v8 = -[CAMLivePhotoButton indexForMode:](self, "indexForMode:", v7);
    if (v4)
      -[CAMLivePhotoButton reloadData](self, "reloadData");
    -[CAMLivePhotoButton setSelectedIndex:](self, "setSelectedIndex:", v8);
    -[CAMLivePhotoButton _updateBaseImage](self, "_updateBaseImage");
  }
}

- (void)setAllowsAutomaticMode:(BOOL)a3
{
  -[CAMLivePhotoButton setAllowsAutomaticMode:needsReloadData:](self, "setAllowsAutomaticMode:needsReloadData:", a3, 1);
}

- (id)_availableModes
{
  if (-[CAMLivePhotoButton allowsAutomaticMode](self, "allowsAutomaticMode"))
    return &unk_1EA3B3380;
  else
    return &unk_1EA3B3398;
}

- (int64_t)modeForIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  -[CAMLivePhotoButton _availableModes](self, "_availableModes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 < 0 || objc_msgSend(v4, "count") <= (unint64_t)a3)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

  }
  return v7;
}

- (int64_t)indexForMode:(int64_t)a3
{
  void *v4;
  void *v5;
  int64_t v6;

  -[CAMLivePhotoButton _availableModes](self, "_availableModes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "indexOfObject:", v5);

  return v6;
}

- (int64_t)numberOfMenuItems
{
  void *v2;
  int64_t v3;

  -[CAMLivePhotoButton _availableModes](self, "_availableModes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)titleForMenuItemAtIndex:(int64_t)a3
{
  int64_t v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;

  v3 = -[CAMLivePhotoButton modeForIndex:](self, "modeForIndex:", a3);
  if (v3 == 2)
  {
    v4 = CFSTR("AUTO");
    v5 = CFSTR("A label for turning LivePhoto mode to Auto mode.");
  }
  else if (v3 == 1)
  {
    v4 = CFSTR("LIVE_PHOTO_BUTTON_ON");
    v5 = CFSTR("A label for turning LivePhoto mode on.");
  }
  else
  {
    if (v3)
    {
      v6 = 0;
      return v6;
    }
    v4 = CFSTR("LIVE_PHOTO_BUTTON_OFF");
    v5 = CFSTR("A label for turning LivePhoto mode off.");
  }
  CAMLocalizedFrameworkString(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (id)_currentBaseImage
{
  int64_t v3;
  _BOOL4 v4;
  __CFString *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = -[CAMLivePhotoButton modeForIndex:](self, "modeForIndex:", -[CAMExpandableMenuButton selectedIndex](self, "selectedIndex"));
  v4 = -[CAMExpandableMenuButton wantsSelectedItemToBeVisible](self, "wantsSelectedItemToBeVisible");
  v5 = CFSTR("CAMIrisButton-0-PhotoIris");
  if (!v3 && !-[CAMExpandableMenuButton isExpanded](self, "isExpanded") && !v4)
    v5 = CFSTR("CAMIrisButtonInactive");
  v6 = (void *)MEMORY[0x1E0DC3870];
  v7 = v5;
  CAMCameraUIFrameworkBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageNamed:inBundle:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "imageWithRenderingMode:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_updateBaseImage
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = -[CAMLivePhotoButton livePhotoMode](self, "livePhotoMode");
  if (v3 == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v7 = (id)v5;
LABEL_9:
    v4 = 0;
    goto LABEL_10;
  }
  if (v3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (v3)
  {
    v7 = 0;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = 1;
LABEL_10:
  -[CAMLivePhotoButton _bloomView](self, "_bloomView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIsOff:", v4);
  objc_msgSend(v6, "setTintColor:", v7);

}

- (void)reloadData
{
  int64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CAMLivePhotoButton;
  -[CAMExpandableMenuButton reloadData](&v4, sel_reloadData);
  -[CAMLivePhotoButton _updateBaseImage](self, "_updateBaseImage");
  if (-[CAMLivePhotoButton numberOfMenuItems](self, "numberOfMenuItems") >= 1)
  {
    v3 = 0;
    do
    {
      -[CAMExpandableMenuButton setHighlighted:forIndex:](self, "setHighlighted:forIndex:", -[CAMLivePhotoButton modeForIndex:](self, "modeForIndex:", v3) == 1, v3);
      ++v3;
    }
    while (v3 < -[CAMLivePhotoButton numberOfMenuItems](self, "numberOfMenuItems"));
  }
}

- (void)finishExpansionAnimated:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CAMLivePhotoButton;
  -[CAMExpandableMenuButton finishExpansionAnimated:](&v4, sel_finishExpansionAnimated_, a3);
  -[CAMLivePhotoButton interruptEnablingAnimation](self, "interruptEnablingAnimation");
}

- (void)performEnablingAnimation
{
  id v3;

  if ((unint64_t)(-[CAMLivePhotoButton livePhotoMode](self, "livePhotoMode") - 1) <= 1)
  {
    -[CAMLivePhotoButton _bloomView](self, "_bloomView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "animateBloom");

  }
}

- (void)interruptEnablingAnimation
{
  id v2;

  -[CAMLivePhotoButton _bloomView](self, "_bloomView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopAnimating");

}

+ (double)enablingAnimationDuration
{
  return 1.5;
}

- (id)imageForAccessibilityHUD
{
  unint64_t v2;
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = -[CAMLivePhotoButton livePhotoMode](self, "livePhotoMode");
  if (v2 > 2)
    v3 = 0;
  else
    v3 = off_1EA32B4B8[v2];
  v4 = (void *)MEMORY[0x1E0DC3870];
  CAMCameraUIFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageNamed:inBundle:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageWithRenderingMode:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)allowsAutomaticMode
{
  return self->_allowsAutomaticMode;
}

- (CAMLivePhotoBloomView)_bloomView
{
  return self->__bloomView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__bloomView, 0);
}

@end
