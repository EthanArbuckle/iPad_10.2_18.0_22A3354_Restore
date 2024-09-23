@implementation HUQuickControlValveToggleViewController

+ (id)controlItemPredicate
{
  return -[HUQuickControlSingleItemPredicate initWithBlock:]([HUQuickControlSingleItemPredicate alloc], "initWithBlock:", &__block_literal_global_22);
}

uint64_t __63__HUQuickControlValveToggleViewController_controlItemPredicate__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = a2;
  objc_msgSend(v2, "valueSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryServiceDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "parentServiceDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serviceType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend((id)*MEMORY[0x1E0CB9A18], "isEqualToString:", v6))
    v7 = objc_msgSend(v2, "conformsToProtocol:", &unk_1EF347E50);
  else
    v7 = 0;

  return v7;
}

+ (Class)controlItemClass
{
  return (Class)objc_opt_class();
}

- (id)createInteractionCoordinator
{
  HUQuickControlValveToggleView *v3;
  void *v4;
  HUQuickControlValveToggleView *v5;
  HUQuickControlSimpleInteractionCoordinator *v6;

  v3 = [HUQuickControlValveToggleView alloc];
  -[HUQuickControlSingleControlViewController viewProfile](self, "viewProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HUQuickControlValveToggleView initWithProfile:](v3, "initWithProfile:", v4);

  v6 = -[HUQuickControlSimpleInteractionCoordinator initWithControlView:delegate:]([HUQuickControlSimpleInteractionCoordinator alloc], "initWithControlView:delegate:", v5, self);
  return v6;
}

- (id)createViewProfile
{
  HUQuickControlSwitchViewProfile *v3;

  v3 = objc_alloc_init(HUQuickControlSwitchViewProfile);
  -[HUQuickControlViewProfile setControlSize:](v3, "setControlSize:", -[HUQuickControlViewController controlSize](self, "controlSize"));
  return v3;
}

- (id)controlToViewValueTransformer
{
  return (id)objc_msgSend(MEMORY[0x1E0D319D8], "transformerForValueClass:transformBlock:reverseTransformBlock:", objc_opt_class(), &__block_literal_global_54, &__block_literal_global_58_0);
}

void *__72__HUQuickControlValveToggleViewController_controlToViewValueTransformer__block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "integerValue") == 2)
    return &unk_1E70404E0;
  else
    return &unk_1E70404F8;
}

uint64_t __72__HUQuickControlValveToggleViewController_controlToViewValueTransformer__block_invoke_57(uint64_t a1, void *a2)
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

- (HUQuickControlValveToggleView)controlView
{
  return self->_controlView;
}

- (void)setControlView:(id)a3
{
  objc_storeStrong((id *)&self->_controlView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlView, 0);
}

@end
