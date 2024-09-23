@implementation HUQuickControlViewController

+ (HUQuickControlItemPredicate)controlItemPredicate
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HUQuickControlViewController.m"), 35, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "+[HUQuickControlViewController controlItemPredicate]", objc_opt_class());

  return 0;
}

- (HUQuickControlViewController)initWithControlItems:(id)a3 home:(id)a4 itemUpdater:(id)a5 controlOrientation:(unint64_t)a6 preferredControl:(unint64_t)a7
{
  id v13;
  id v14;
  HUQuickControlSimpleItemUpdater *v15;
  HUQuickControlViewController *v16;
  HUQuickControlViewController *v17;
  HUQuickControlSimpleItemUpdater *v18;
  HUQuickControlSimpleItemUpdater *internalItemUpdater;
  objc_super v21;

  v13 = a3;
  v14 = a4;
  v15 = (HUQuickControlSimpleItemUpdater *)a5;
  v21.receiver = self;
  v21.super_class = (Class)HUQuickControlViewController;
  v16 = -[HUQuickControlViewController initWithNibName:bundle:](&v21, sel_initWithNibName_bundle_, 0, 0);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_controlItems, a3);
    objc_storeStrong((id *)&v17->_home, a4);
    if (!v15)
    {
      v18 = -[HUQuickControlSimpleItemUpdater initWithItemHost:]([HUQuickControlSimpleItemUpdater alloc], "initWithItemHost:", v17);
      internalItemUpdater = v17->_internalItemUpdater;
      v17->_internalItemUpdater = v18;

      v15 = v17->_internalItemUpdater;
    }
    objc_storeWeak((id *)&v17->_itemUpdater, v15);
    v17->_controlOrientation = a6;
    v17->_preferredControl = a7;
    -[HUQuickControlViewController _updateControlItemHiddenStateNotifyingHost:](v17, "_updateControlItemHiddenStateNotifyingHost:", 0);
  }

  return v17;
}

- (HUQuickControlViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithControlItems_home_itemUpdater_controlOrientation_preferredControl_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUQuickControlViewController.m"), 62, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUQuickControlViewController initWithNibName:bundle:]",
    v7);

  return 0;
}

- (HUQuickControlViewController)initWithCoder:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithControlItems_home_itemUpdater_controlOrientation_preferredControl_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUQuickControlViewController.m"), 67, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUQuickControlViewController initWithCoder:]",
    v6);

  return 0;
}

- (unint64_t)preferredPresentationStyle
{
  return 0;
}

- (id)hu_preloadContent
{
  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

- (HULayoutAnchorProviding)preferredFrameLayoutGuide
{
  HULayoutAnchorProviding *preferredFrameLayoutGuide;

  preferredFrameLayoutGuide = self->_preferredFrameLayoutGuide;
  if (preferredFrameLayoutGuide)
    return preferredFrameLayoutGuide;
  -[HUQuickControlViewController view](self, "view");
  return (HULayoutAnchorProviding *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setPreferredFrameLayoutGuide:(id)a3
{
  void *v5;
  id v6;
  _QWORD v7[5];

  objc_storeStrong((id *)&self->_preferredFrameLayoutGuide, a3);
  v6 = a3;
  -[HUQuickControlViewController childQuickControlContentViewControllers](self, "childQuickControlContentViewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__HUQuickControlViewController_setPreferredFrameLayoutGuide___block_invoke;
  v7[3] = &unk_1E6F4C398;
  v7[4] = self;
  objc_msgSend(v5, "na_each:", v7);

}

void __61__HUQuickControlViewController_setPreferredFrameLayoutGuide___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "preferredFrameLayoutGuide");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPreferredFrameLayoutGuide:", v4);

}

- (void)setControlsVisible:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  if (self->_controlsVisible != a3)
  {
    v3 = a3;
    self->_controlsVisible = a3;
    -[HUQuickControlViewController itemUpdater](self, "itemUpdater");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "quickControlItemHost:didUpdateVisibility:", self, v3);

  }
}

- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3
{
  return +[HUIntrinsicSizeDescriptor noIntrinsicSizeDescriptor](HUIntrinsicSizeDescriptor, "noIntrinsicSizeDescriptor", a3);
}

- (BOOL)hasSingleControlView
{
  return 0;
}

- (BOOL)shouldShowContentForReachabilityState:(BOOL)a3
{
  if (a3)
    return !-[HUQuickControlViewController areControlItemsRequestingToBeHidden](self, "areControlItemsRequestingToBeHidden");
  else
    return 0;
}

- (NSString)overrideStatusText
{
  return 0;
}

- (NSString)overrideSecondaryStatusText
{
  return 0;
}

- (void)beginUserInteractionWithFirstTouchGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[HUQuickControlViewController childQuickControlContentViewControllers](self, "childQuickControlContentViewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__HUQuickControlViewController_beginUserInteractionWithFirstTouchGestureRecognizer___block_invoke;
  v7[3] = &unk_1E6F4C398;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_each:", v7);

}

uint64_t __84__HUQuickControlViewController_beginUserInteractionWithFirstTouchGestureRecognizer___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "beginUserInteractionWithFirstTouchGestureRecognizer:", *(_QWORD *)(a1 + 32));
}

- (id)overrideValueForCharacteristic:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HUQuickControlViewController childQuickControlContentViewControllers](self, "childQuickControlContentViewControllers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "overrideValueForCharacteristic:", v4);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (NSSet)affectedCharacteristics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[HUQuickControlViewController controlItems](self, "controlItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_flatMap:", &__block_literal_global_2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0C99E60];
  -[HUQuickControlViewController childQuickControlContentViewControllers](self, "childQuickControlContentViewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_flatMap:", &__block_literal_global_17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setByAddingObjectsFromSet:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v9;
}

id __55__HUQuickControlViewController_affectedCharacteristics__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v2 = a2;
  objc_msgSend(v2, "characteristicOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", &unk_1E7040450);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__HUQuickControlViewController_affectedCharacteristics__block_invoke_13;
  v8[3] = &unk_1E6F4C400;
  v9 = v2;
  v5 = v2;
  objc_msgSend(v4, "na_flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __55__HUQuickControlViewController_affectedCharacteristics__block_invoke_13(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "valueSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allCharacteristicsForCharacteristicType:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __55__HUQuickControlViewController_affectedCharacteristics__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "affectedCharacteristics");
}

- (id)childQuickControlContentViewControllers
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)setCharacteristicWritingDelegate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_storeWeak((id *)&self->_characteristicWritingDelegate, v4);
  -[HUQuickControlViewController childQuickControlContentViewControllers](self, "childQuickControlContentViewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__HUQuickControlViewController_setCharacteristicWritingDelegate___block_invoke;
  v7[3] = &unk_1E6F4C398;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_each:", v7);

}

uint64_t __65__HUQuickControlViewController_setCharacteristicWritingDelegate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setCharacteristicWritingDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)setQuickControlHost:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_storeWeak((id *)&self->_quickControlHost, v4);
  -[HUQuickControlViewController childQuickControlContentViewControllers](self, "childQuickControlContentViewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__HUQuickControlViewController_setQuickControlHost___block_invoke;
  v7[3] = &unk_1E6F4C398;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_each:", v7);

}

uint64_t __52__HUQuickControlViewController_setQuickControlHost___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setQuickControlHost:", *(_QWORD *)(a1 + 32));
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  id v4;
  _QWORD v5[4];
  BOOL v6;

  self->_userInteractionEnabled = a3;
  -[HUQuickControlViewController childQuickControlContentViewControllers](self, "childQuickControlContentViewControllers");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__HUQuickControlViewController_setUserInteractionEnabled___block_invoke;
  v5[3] = &__block_descriptor_33_e114_v16__0__UIViewController_HUQuickControlInteractiveContentContaining__HUQuickControlContentCharacteristicWriting__8l;
  v6 = a3;
  objc_msgSend(v4, "na_each:", v5);

}

uint64_t __58__HUQuickControlViewController_setUserInteractionEnabled___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUserInteractionEnabled:", *(unsigned __int8 *)(a1 + 32));
}

- (id)viewControllerForTouchContinuation
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  -[HUQuickControlViewController childQuickControlContentViewControllers](self, "childQuickControlContentViewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_firstObjectPassingTest:", &__block_literal_global_19);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

uint64_t __66__HUQuickControlViewController_viewControllerForTouchContinuation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "conformsToProtocol:", &unk_1EF27C0F0);
}

- (void)_updateControlItemHiddenStateNotifyingHost:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  void *v6;
  id v7;

  v3 = a3;
  v5 = -[HUQuickControlViewController areControlItemsRequestingToBeHidden](self, "areControlItemsRequestingToBeHidden");
  -[HUQuickControlViewController controlItems](self, "controlItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlViewController setAreControlItemsRequestingToBeHidden:](self, "setAreControlItemsRequestingToBeHidden:", objc_msgSend(v6, "na_all:", &__block_literal_global_66));

  if (v3
    && v5 != -[HUQuickControlViewController areControlItemsRequestingToBeHidden](self, "areControlItemsRequestingToBeHidden"))
  {
    -[HUQuickControlViewController quickControlHost](self, "quickControlHost");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "quickControlContentDidUpdateDesiredVisbilityState:", self);

  }
}

uint64_t __75__HUQuickControlViewController__updateControlItemHiddenStateNotifyingHost___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "latestResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D70]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AAA0];
  v5 = objc_msgSend(v3, "BOOLValue");

  return v5;
}

- (void)quickControlItemUpdater:(id)a3 didUpdateResultsForControlItems:(id)a4
{
  -[HUQuickControlViewController _updateControlItemHiddenStateNotifyingHost:](self, "_updateControlItemHiddenStateNotifyingHost:", 1, a4);
}

- (BOOL)areControlsVisible
{
  return self->_controlsVisible;
}

- (HUQuickControlContentCharacteristicWritingDelegate)characteristicWritingDelegate
{
  return (HUQuickControlContentCharacteristicWritingDelegate *)objc_loadWeakRetained((id *)&self->_characteristicWritingDelegate);
}

- (HUQuickControlContentHosting)quickControlHost
{
  return (HUQuickControlContentHosting *)objc_loadWeakRetained((id *)&self->_quickControlHost);
}

- (BOOL)isUserInteractionEnabled
{
  return self->_userInteractionEnabled;
}

- (HMHome)home
{
  return self->_home;
}

- (NSSet)controlItems
{
  return self->_controlItems;
}

- (HUQuickControlItemUpdating)itemUpdater
{
  return (HUQuickControlItemUpdating *)objc_loadWeakRetained((id *)&self->_itemUpdater);
}

- (HUQuickControlViewControllerDelegate)delegate
{
  return (HUQuickControlViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)controlSize
{
  return self->_controlSize;
}

- (void)setControlSize:(unint64_t)a3
{
  self->_controlSize = a3;
}

- (unint64_t)controlOrientation
{
  return self->_controlOrientation;
}

- (void)setControlOrientation:(unint64_t)a3
{
  self->_controlOrientation = a3;
}

- (unint64_t)preferredControl
{
  return self->_preferredControl;
}

- (void)setPreferredControl:(unint64_t)a3
{
  self->_preferredControl = a3;
}

- (HUQuickControlContentRequiringHelper)childVCThatRequiresHelper
{
  return self->_childVCThatRequiresHelper;
}

- (void)setChildVCThatRequiresHelper:(id)a3
{
  objc_storeStrong((id *)&self->_childVCThatRequiresHelper, a3);
}

- (HUQuickControlSimpleItemUpdater)internalItemUpdater
{
  return self->_internalItemUpdater;
}

- (BOOL)areControlItemsRequestingToBeHidden
{
  return self->_areControlItemsRequestingToBeHidden;
}

- (void)setAreControlItemsRequestingToBeHidden:(BOOL)a3
{
  self->_areControlItemsRequestingToBeHidden = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalItemUpdater, 0);
  objc_storeStrong((id *)&self->_childVCThatRequiresHelper, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_itemUpdater);
  objc_storeStrong((id *)&self->_controlItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_preferredFrameLayoutGuide, 0);
  objc_destroyWeak((id *)&self->_quickControlHost);
  objc_destroyWeak((id *)&self->_characteristicWritingDelegate);
}

@end
