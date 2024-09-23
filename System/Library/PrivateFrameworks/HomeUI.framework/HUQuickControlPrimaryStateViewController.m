@implementation HUQuickControlPrimaryStateViewController

+ (id)controlItemPredicate
{
  return -[HUQuickControlSingleItemPredicate initWithBlock:]([HUQuickControlSingleItemPredicate alloc], "initWithBlock:", &__block_literal_global_82);
}

uint64_t __64__HUQuickControlPrimaryStateViewController_controlItemPredicate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "conformsToProtocol:", &unk_1EF347E50);
}

+ (Class)controlItemClass
{
  return (Class)objc_opt_class();
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HUQuickControlPrimaryStateViewController;
  -[HUQuickControlSingleControlViewController viewWillAppear:](&v10, sel_viewWillAppear_, a3);
  if (!-[HUQuickControlSingleControlViewController hasSetControlSize](self, "hasSetControlSize"))
  {
    -[HUQuickControlSingleControlViewController viewProfile](self, "viewProfile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[HUQuickControlPrimaryStateViewController view](self, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "frame");
      v9 = HUViewSizeSubclassForViewSize(v7, v8);

      -[HUQuickControlSingleControlViewController setControlSize:](self, "setControlSize:", +[HUQuickControlUtilities sliderQuickControlSizeForViewSizeSubclass:](HUQuickControlUtilities, "sliderQuickControlSizeForViewSizeSubclass:", v9));
    }
  }
}

- (id)createInteractionCoordinator
{
  void *v3;
  char isKindOfClass;
  HUQuickControlPushButtonView *v5;
  void *v6;
  HUQuickControlPushButtonView *v7;
  __objc2_class **v8;
  HUQuickControlSwitchView *v9;
  void *v10;

  -[HUQuickControlSingleControlViewController viewProfile](self, "viewProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v5 = [HUQuickControlPushButtonView alloc];
    -[HUQuickControlSingleControlViewController viewProfile](self, "viewProfile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HUQuickControlPushButtonView initWithProfile:](v5, "initWithProfile:", v6);
    v8 = off_1E6F3D368;
  }
  else
  {
    v9 = [HUQuickControlSwitchView alloc];
    -[HUQuickControlSingleControlViewController viewProfile](self, "viewProfile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HUQuickControlSwitchView initWithProfile:](v9, "initWithProfile:", v6);
    v8 = off_1E6F3D240;
  }

  v10 = (void *)objc_msgSend(objc_alloc(*v8), "initWithControlView:delegate:", v7, self);
  return v10;
}

- (id)createViewProfile
{
  void *v3;
  _BOOL4 v4;
  HUQuickControlPushButtonViewProfile *v5;

  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[HUQuickControlUtilities shouldDisplayQuickControlAsPushButton:preferredControl:](HUQuickControlUtilities, "shouldDisplayQuickControlAsPushButton:preferredControl:", v3, -[HUQuickControlViewController preferredControl](self, "preferredControl"));

  if (v4)
  {
    v5 = objc_alloc_init(HUQuickControlPushButtonViewProfile);
    -[HUQuickControlPushButtonViewProfile setToggleColorScheme:](v5, "setToggleColorScheme:", -[HUQuickControlPrimaryStateViewController _isCharacteristicTypeRotationDirection](self, "_isCharacteristicTypeRotationDirection") ^ 1);
  }
  else
  {
    v5 = objc_alloc_init(HUQuickControlSwitchViewProfile);
  }
  return v5;
}

- (id)controlToViewValueTransformer
{
  return (id)objc_msgSend(MEMORY[0x1E0D319D8], "transformerForValueClass:transformBlock:reverseTransformBlock:", objc_opt_class(), &__block_literal_global_59, &__block_literal_global_63);
}

void *__73__HUQuickControlPrimaryStateViewController_controlToViewValueTransformer__block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "integerValue") == 2)
    return &unk_1E7040BA0;
  else
    return &unk_1E7040BB8;
}

uint64_t __73__HUQuickControlPrimaryStateViewController_controlToViewValueTransformer__block_invoke_62(uint64_t a1, void *a2)
{
  double v2;
  uint64_t v3;

  objc_msgSend(a2, "doubleValue");
  if ((uint64_t)llround(v2) < 1)
    v3 = 1;
  else
    v3 = 2;
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
}

- (BOOL)_isCharacteristicTypeRotationDirection
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "characteristicOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "characteristicTypesForUsage:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB89E8]);
  return (char)v2;
}

@end
