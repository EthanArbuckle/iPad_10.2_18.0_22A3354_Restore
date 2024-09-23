@implementation AX_FunCamAvatarCarousel

- (AX_FunCamAvatarCarousel)initWithFunCamAvatarPickerController:(id)a3 accessibilityContainer:(id)a4
{
  id v6;
  AX_FunCamAvatarCarousel *v7;
  AX_FunCamAvatarCarousel *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AX_FunCamAvatarCarousel;
  v7 = -[AX_FunCamAvatarCarousel initWithAccessibilityContainer:](&v10, sel_initWithAccessibilityContainer_, a4);
  v8 = v7;
  if (v7)
    -[AX_FunCamAvatarCarousel setFcAVTPickerController:](v7, "setFcAVTPickerController:", v6);

  return v8;
}

- (BOOL)isAccessibilityElement
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained(&self->_fcAVTPickerController);
  v3 = objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("isDisplayingGridLayout")) ^ 1;

  return v3;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("starfish.carousel"));
}

- (id)accessibilityValue
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_opt_class();
  self = (AX_FunCamAvatarCarousel *)((char *)self + 56);
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super.super.isa);
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("selectedIndexPath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_loadWeakRetained((id *)&self->super.super.super.isa);
  objc_msgSend(v6, "_axLabelForIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AX_FunCamAvatarCarousel;
  return *MEMORY[0x24BDF73A0] | -[AX_FunCamAvatarCarousel accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (void)accessibilityIncrement
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;

  objc_opt_class();
  WeakRetained = objc_loadWeakRetained(&self->_fcAVTPickerController);
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("items"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v6 = objc_loadWeakRetained(&self->_fcAVTPickerController);
  objc_msgSend(v6, "safeValueForKey:", CFSTR("selectedIndexPath"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", objc_msgSend(v8, "item") + 1, objc_msgSend(v8, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "item");
  if (v10 < objc_msgSend(v5, "count"))
  {
    v11 = objc_loadWeakRetained(&self->_fcAVTPickerController);
    objc_msgSend(v11, "safeValueForKey:", CFSTR("collectionView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v9;
    v13 = v12;
    AXPerformSafeBlock();

  }
}

- (void)accessibilityDecrement
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  objc_opt_class();
  WeakRetained = objc_loadWeakRetained(&self->_fcAVTPickerController);
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("selectedIndexPath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", objc_msgSend(v5, "item") - 1, objc_msgSend(v5, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "item") & 0x8000000000000000) == 0)
  {
    v7 = objc_loadWeakRetained(&self->_fcAVTPickerController);
    objc_msgSend(v7, "safeValueForKey:", CFSTR("collectionView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v6;
    v9 = v8;
    AXPerformSafeBlock();

  }
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  id WeakRetained;
  void *v6;
  unsigned __int8 v7;
  BOOL v8;
  objc_super v10;

  WeakRetained = objc_loadWeakRetained(&self->_fcAVTPickerController);
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 == 1)
  {
    v7 = objc_msgSend(v6, "accessibilityScrollRightPage");
  }
  else if (a3 == 2)
  {
    v7 = objc_msgSend(v6, "accessibilityScrollLeftPage");
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)AX_FunCamAvatarCarousel;
    v7 = -[AX_FunCamAvatarCarousel accessibilityScroll:](&v10, sel_accessibilityScroll_, a3);
  }
  v8 = v7;

  return v8;
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

  -[AX_FunCamAvatarCarousel accessibilityContainer](self, "accessibilityContainer");
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

- (id)fcAVTPickerController
{
  return objc_loadWeakRetained(&self->_fcAVTPickerController);
}

- (void)setFcAVTPickerController:(id)a3
{
  objc_storeWeak(&self->_fcAVTPickerController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_fcAVTPickerController);
}

@end
