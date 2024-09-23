@implementation HUQuickControlIconViewController

+ (id)controlItemPredicate
{
  return -[HUQuickControlSingleItemPredicate initWithBlock:]([HUQuickControlSingleItemPredicate alloc], "initWithBlock:", &__block_literal_global_268);
}

uint64_t __56__HUQuickControlIconViewController_controlItemPredicate__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)createInteractionCoordinator
{
  HUQuickControlIconView *v3;
  void *v4;
  HUQuickControlIconView *v5;
  HUQuickControlSimpleInteractionCoordinator *v6;
  void *v7;
  HUQuickControlSimpleInteractionCoordinator *v8;

  v3 = [HUQuickControlIconView alloc];
  -[HUQuickControlSingleControlViewController viewProfile](self, "viewProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HUQuickControlIconView initWithProfile:](v3, "initWithProfile:", v4);
  -[HUQuickControlIconViewController setQuickControlIconView:](self, "setQuickControlIconView:", v5);

  v6 = [HUQuickControlSimpleInteractionCoordinator alloc];
  -[HUQuickControlIconViewController quickControlIconView](self, "quickControlIconView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HUQuickControlSimpleInteractionCoordinator initWithControlView:delegate:](v6, "initWithControlView:delegate:", v7, self);

  return v8;
}

+ (Class)controlItemClass
{
  return (Class)objc_opt_class();
}

- (id)createViewProfile
{
  HUQuickControlIconViewProfile *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = objc_alloc_init(HUQuickControlIconViewProfile);
  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BE0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlIconViewProfile setStatusString:](v3, "setStatusString:", v6);

  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "latestResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BC8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlIconViewProfile setStatusTextColor:](v3, "setStatusTextColor:", v9);

  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "latestResults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D00]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlIconViewProfile setSupplementaryString:](v3, "setSupplementaryString:", v12);

  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "latestResults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BD8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlIconViewProfile setIconDescriptor:](v3, "setIconDescriptor:", v15);

  return v3;
}

- (HUQuickControlIconView)quickControlIconView
{
  return self->_quickControlIconView;
}

- (void)setQuickControlIconView:(id)a3
{
  objc_storeStrong((id *)&self->_quickControlIconView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quickControlIconView, 0);
}

@end
