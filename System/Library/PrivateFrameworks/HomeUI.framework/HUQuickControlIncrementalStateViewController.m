@implementation HUQuickControlIncrementalStateViewController

+ (Class)controlItemClass
{
  return (Class)objc_opt_class();
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUQuickControlIncrementalStateViewController;
  -[HUQuickControlSingleControlViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  if (!-[HUQuickControlSingleControlViewController hasSetControlSize](self, "hasSetControlSize"))
  {
    -[HUQuickControlIncrementalStateViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    v7 = HUViewSizeSubclassForViewSize(v5, v6);

    -[HUQuickControlSingleControlViewController setControlSize:](self, "setControlSize:", +[HUQuickControlUtilities sliderQuickControlSizeForViewSizeSubclass:](HUQuickControlUtilities, "sliderQuickControlSizeForViewSizeSubclass:", v7));
  }
}

- (id)_createControlView
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;

  -[HUQuickControlSingleControlViewController viewProfile](self, "viewProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();

  if (v4 == objc_opt_class() || v4 == objc_opt_class())
    v5 = (objc_class *)objc_opt_class();
  else
    v5 = 0;
  v6 = [v5 alloc];
  -[HUQuickControlSingleControlViewController viewProfile](self, "viewProfile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithProfile:", v7);

  return v8;
}

- (id)createInteractionCoordinator
{
  HUQuickControlElasticSliderInteractionCoordinator *v3;
  void *v4;
  HUQuickControlElasticSliderInteractionCoordinator *v5;

  v3 = [HUQuickControlElasticSliderInteractionCoordinator alloc];
  -[HUQuickControlIncrementalStateViewController _createControlView](self, "_createControlView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HUQuickControlElasticSliderInteractionCoordinator initWithControlView:delegate:](v3, "initWithControlView:delegate:", v4, self);

  return v5;
}

- (id)createViewProfile
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HUQuickControlSliderViewProfile *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;

  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "incrementalCharacteristicType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadataForCharacteristicType:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(HUQuickControlSliderViewProfile);
  objc_msgSend(v6, "hf_numericValueConstraints");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "percentageConstraints");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSliderViewProfile setPrimaryValueConstraints:](v7, "setPrimaryValueConstraints:", v9);

  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "latestResults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D30878]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  -[HUQuickControlSliderViewProfile setPreferredFillSection:](v7, "setPreferredFillSection:", v13);
  -[HUQuickControlSliderViewProfile setHasOffState:](v7, "setHasOffState:", v13 ^ 1);

  return v7;
}

- (id)controlToViewValueTransformer
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[5];

  -[HUQuickControlSingleControlViewController viewProfile](self, "viewProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = objc_msgSend(v2, "numberOfSegments");
    v4 = (void *)MEMORY[0x1E0D319D8];
    v5 = objc_opt_class();
    v9[4] = v3;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __77__HUQuickControlIncrementalStateViewController_controlToViewValueTransformer__block_invoke;
    v10[3] = &__block_descriptor_40_e18__16__0__NSNumber_8l;
    v10[4] = v3;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __77__HUQuickControlIncrementalStateViewController_controlToViewValueTransformer__block_invoke_2;
    v9[3] = &__block_descriptor_40_e18__16__0__NSNumber_8l;
    objc_msgSend(v4, "transformerForValueClass:transformBlock:reverseTransformBlock:", v5, v10, v9);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D319D8], "identityTransformer");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

uint64_t __77__HUQuickControlIncrementalStateViewController_controlToViewValueTransformer__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "doubleValue");
  return objc_msgSend(v3, "numberWithDouble:", v4 * (double)*(unint64_t *)(a1 + 32));
}

uint64_t __77__HUQuickControlIncrementalStateViewController_controlToViewValueTransformer__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  double v4;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "doubleValue");
  return objc_msgSend(v3, "numberWithDouble:", v4 / (double)*(unint64_t *)(a1 + 32));
}

@end
