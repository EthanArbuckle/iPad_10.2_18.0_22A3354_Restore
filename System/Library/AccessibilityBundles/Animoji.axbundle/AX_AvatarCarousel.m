@implementation AX_AvatarCarousel

- (AX_AvatarCarousel)initWithMessagesController:(id)a3 accessibilityContainer:(id)a4
{
  id v6;
  AX_AvatarCarousel *v7;
  AX_AvatarCarousel *v8;
  AX_AvatarCarousel *v10;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AX_AvatarCarousel;
  v7 = -[AX_AvatarCarousel initWithAccessibilityContainer:](&v11, sel_initWithAccessibilityContainer_, a4);
  v8 = v7;
  if (v7)
  {
    -[AX_AvatarCarousel setMessagesController:](v7, "setMessagesController:", v6);
    v10 = v8;
    AXPerformSafeBlock();

  }
  return v8;
}

- (id)_axContainerAvatarController
{
  void *v2;
  void *v3;

  -[AX_AvatarCarousel messagesController](self, "messagesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKeyPath:", CFSTR("_avatarListController.multiAvatarController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_axMessagesControllerIsExpanded
{
  void *v2;
  BOOL v3;

  -[AX_AvatarCarousel messagesController](self, "messagesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeUnsignedIntegerForKey:", CFSTR("presentationStyle")) == 1;

  return v3;
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  uint64_t v3;

  -[AX_AvatarCarousel messagesController](self, "messagesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeUnsignedIntegerForKey:", CFSTR("_UIState"));

  return v3 != 1 && v3 != 4;
}

- (id)accessibilityLabel
{
  return accessibilityJellyfishLocalizedString(CFSTR("starfish.carousel"));
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;

  if (-[AX_AvatarCarousel _axCurrentIndex](self, "_axCurrentIndex") < 1)
  {
    accessibilityJellyfishLocalizedString(CFSTR("starfish.add"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AX_AvatarCarousel _axContainerAvatarController](self, "_axContainerAvatarController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[AX_AvatarCarousel _axMessagesControllerIsExpanded](self, "_axMessagesControllerIsExpanded"))
    {
      -[AX_AvatarCarousel messagesController](self, "messagesController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "safeValueForKey:", CFSTR("_puppetCollectionViewController"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "safeValueForKey:", CFSTR("selectedRecord"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v3, "safeValueForKey:", CFSTR("displayedRecord"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x24BDFFA88], "descriptionForAvatarWithRecord:includeVideoPrefix:", v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AX_AvatarCarousel messagesController](self, "messagesController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safeUIViewForKey:", CFSTR("_userInfoView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "alpha");
    if (v11 <= 0.0)
    {
      v12 = 0;
    }
    else
    {
      objc_msgSend(v10, "safeStringForKey:", CFSTR("text"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    __UIAXStringForVariables();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)accessibilityHint
{
  void *v2;
  uint64_t v3;
  __CFString *v4;
  void *v5;

  -[AX_AvatarCarousel messagesController](self, "messagesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeUnsignedIntegerForKey:", CFSTR("_arSessionState"));

  if (v3 == 4)
  {
    v4 = CFSTR("face.tracking.paused.hint");
  }
  else
  {
    if (v3)
    {
      v5 = 0;
      return v5;
    }
    v4 = CFSTR("emoji.puppet.hint");
  }
  accessibilityJellyfishLocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AX_AvatarCarousel;
  v3 = -[AX_AvatarCarousel accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[AX_AvatarCarousel _axMessagesControllerIsExpanded](self, "_axMessagesControllerIsExpanded");
  v5 = *MEMORY[0x24BDF73A0];
  if (v4)
    v5 = 0;
  return v5 | v3;
}

- (BOOL)_accessibilityScrollCarousel:(BOOL)a3
{
  AX_AvatarCarousel *v3;
  void *v4;
  id v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = self;
  -[AX_AvatarCarousel _axContainerAvatarController](self, "_axContainerAvatarController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AX_AvatarCarousel _axCurrentIndex](v3, "_axCurrentIndex");
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6 = v4;
  AXPerformSafeBlock();
  LOBYTE(v3) = *((_BYTE *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;

  if (a3 == 1)
  {
    v5 = 0;
    return -[AX_AvatarCarousel _accessibilityScrollCarousel:](self, "_accessibilityScrollCarousel:", v5);
  }
  if (a3 == 2)
  {
    v5 = 1;
    return -[AX_AvatarCarousel _accessibilityScrollCarousel:](self, "_accessibilityScrollCarousel:", v5);
  }
  v8 = v3;
  v9 = v4;
  v7.receiver = self;
  v7.super_class = (Class)AX_AvatarCarousel;
  return -[AX_AvatarCarousel accessibilityScroll:](&v7, sel_accessibilityScroll_);
}

- (int64_t)_axCurrentIndex
{
  return __UIAccessibilityGetAssociatedInteger();
}

- (void)_setAXCurrentIndex:(int64_t)a3
{
  __UIAccessibilitySetAssociatedInteger();
}

- (void)accessibilityIncrement
{
  -[AX_AvatarCarousel _accessibilityScrollCarousel:](self, "_accessibilityScrollCarousel:", 1);
}

- (void)accessibilityDecrement
{
  -[AX_AvatarCarousel _accessibilityScrollCarousel:](self, "_accessibilityScrollCarousel:", 0);
}

- (CGRect)accessibilityFrameInContainerSpace
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[AX_AvatarCarousel accessibilityContainer](self, "accessibilityContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (id)messagesController
{
  return objc_loadWeakRetained(&self->_messagesController);
}

- (void)setMessagesController:(id)a3
{
  objc_storeWeak(&self->_messagesController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_messagesController);
}

@end
