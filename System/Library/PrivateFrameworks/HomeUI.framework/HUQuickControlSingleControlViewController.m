@implementation HUQuickControlSingleControlViewController

+ (id)controlItemPredicate
{
  HUQuickControlSingleItemPredicate *v3;
  _QWORD v5[5];

  v3 = [HUQuickControlSingleItemPredicate alloc];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__HUQuickControlSingleControlViewController_controlItemPredicate__block_invoke;
  v5[3] = &__block_descriptor_40_e23_B16__0__HFControlItem_8l;
  v5[4] = a1;
  return -[HUQuickControlSingleItemPredicate initWithBlock:](v3, "initWithBlock:", v5);
}

uint64_t __65__HUQuickControlSingleControlViewController_controlItemPredicate__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "controlItemClass");
  LOBYTE(v2) = objc_opt_isKindOfClass();

  return v2 & 1;
}

- (HUQuickControlSingleControlViewController)initWithControlItems:(id)a3 home:(id)a4 itemUpdater:(id)a5 controlOrientation:(unint64_t)a6 preferredControl:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  HUQuickControlSingleControlViewController *v16;

  v12 = a3;
  v13 = a5;
  v14 = a4;
  if (objc_msgSend(v12, "count") != 1)
    NSLog(CFSTR("%@ should be initialized with exactly one control item, but instead received: %@"), self, v12);
  objc_msgSend(v12, "anyObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HUQuickControlSingleControlViewController initWithControlItem:home:itemUpdater:controlOrientation:preferredControl:](self, "initWithControlItem:home:itemUpdater:controlOrientation:preferredControl:", v15, v14, v13, a6, a7);

  return v16;
}

- (HUQuickControlSingleControlViewController)initWithControlItem:(id)a3 home:(id)a4 itemUpdater:(id)a5 controlOrientation:(unint64_t)a6 preferredControl:(unint64_t)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  HUQuickControlSingleControlViewController *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  double v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NAValueThrottler *valueWriteThrottler;
  void *v30;
  id v31;
  uint64_t v32;
  HUQuickControlInteractionCoordinator *interactionCoordinator;
  void *v35;
  _QWORD v36[4];
  id v37;
  id location;
  objc_super v39;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  objc_msgSend((id)objc_opt_class(), "controlItemClass");
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUQuickControlSingleControlViewController.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[originalControlItem isKindOfClass:[self.class controlItemClass]]"));

  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v39.receiver = self;
  v39.super_class = (Class)HUQuickControlSingleControlViewController;
  v17 = -[HUQuickControlViewController initWithControlItems:home:itemUpdater:controlOrientation:preferredControl:](&v39, sel_initWithControlItems_home_itemUpdater_controlOrientation_preferredControl_, v16, v14, v15, a6, a7);

  if (v17)
  {
    -[HUQuickControlSingleControlViewController controlItem](v17, "controlItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "latestResults");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0D30530]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (!v20)
      v20 = (void *)MEMORY[0x1E0C9AAB0];
    v22 = objc_msgSend(v20, "BOOLValue");

    if (v22)
      v23 = 0.25;
    else
      v23 = INFINITY;
    v24 = objc_alloc(MEMORY[0x1E0D519F0]);
    -[HUQuickControlSingleControlViewController controlItem](v17, "controlItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "latestResults");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E0D30558]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v24, "initWithThrottleInterval:initialValue:", v27, v23);
    valueWriteThrottler = v17->_valueWriteThrottler;
    v17->_valueWriteThrottler = (NAValueThrottler *)v28;

    objc_initWeak(&location, v17);
    -[HUQuickControlSingleControlViewController valueWriteThrottler](v17, "valueWriteThrottler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __118__HUQuickControlSingleControlViewController_initWithControlItem_home_itemUpdater_controlOrientation_preferredControl___block_invoke;
    v36[3] = &unk_1E6F4F4D0;
    objc_copyWeak(&v37, &location);
    v31 = (id)objc_msgSend(v30, "observeValueChangesWithBlock:", v36);

    -[HUQuickControlSingleControlViewController createInteractionCoordinator](v17, "createInteractionCoordinator");
    v32 = objc_claimAutoreleasedReturnValue();
    interactionCoordinator = v17->_interactionCoordinator;
    v17->_interactionCoordinator = (HUQuickControlInteractionCoordinator *)v32;

    v17->_hasSetControlSize = 0;
    -[HUQuickControlSingleControlViewController _updateTitle](v17, "_updateTitle");
    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }

  return v17;
}

void __118__HUQuickControlSingleControlViewController_initWithControlItem_home_itemUpdater_controlOrientation_preferredControl___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_writeModelControlValue:", v3);

}

- (HFControlItem)controlItem
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[HUQuickControlViewController controlItems](self, "controlItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 != 1)
  {
    -[HUQuickControlViewController controlItems](self, "controlItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@ should have exactly one control item, but instead found: %@"), self, v5);

  }
  -[HUQuickControlViewController controlItems](self, "controlItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFControlItem *)v7;
}

- (void)loadView
{
  void *v3;
  _HUQuickControlSingleControlHostView *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  -[HUQuickControlSingleControlViewController interactionCoordinator](self, "interactionCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "controlView");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v4 = -[_HUQuickControlSingleControlHostView initWithContentView:]([_HUQuickControlSingleControlHostView alloc], "initWithContentView:", v7);
  -[HUQuickControlSingleControlViewController setView:](self, "setView:", v4);

  -[HUQuickControlViewController preferredFrameLayoutGuide](self, "preferredFrameLayoutGuide");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSingleControlViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPreferredFrameLayoutGuide:", v5);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__HUQuickControlSingleControlViewController_loadView__block_invoke;
  v8[3] = &unk_1E6F4D988;
  v8[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v8);

}

uint64_t __53__HUQuickControlSingleControlViewController_loadView__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateValueFromControlItem");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUQuickControlSingleControlViewController;
  -[HUQuickControlSingleControlViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[HUQuickControlSingleControlViewController interactionCoordinator](self, "interactionCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setViewVisible:", 1);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUQuickControlSingleControlViewController;
  -[HUQuickControlSingleControlViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[HUQuickControlSingleControlViewController interactionCoordinator](self, "interactionCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setViewVisible:", 0);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setPreferredFrameLayoutGuide:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)HUQuickControlSingleControlViewController;
  -[HUQuickControlViewController setPreferredFrameLayoutGuide:](&v6, sel_setPreferredFrameLayoutGuide_, v4);
  if (-[HUQuickControlSingleControlViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[HUQuickControlSingleControlViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPreferredFrameLayoutGuide:", v4);

  }
}

- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[HUQuickControlSingleControlViewController interactionCoordinator](self, "interactionCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "controlView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intrinsicSizeDescriptorForControlSize:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)overrideValueForCharacteristic:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  if (-[HUQuickControlSingleControlViewController areWritesInProgressOrPossible](self, "areWritesInProgressOrPossible")
    && (-[HUQuickControlViewController affectedCharacteristics](self, "affectedCharacteristics"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "containsObject:", v4),
        v5,
        v6))
  {
    -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSingleControlViewController modelValue](self, "modelValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "characteristicValuesForValue:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "characteristicType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)HUQuickControlSingleControlViewController;
    -[HUQuickControlViewController overrideValueForCharacteristic:](&v13, sel_overrideValueForCharacteristic_, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (void)beginUserInteractionWithFirstTouchGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUQuickControlSingleControlViewController;
  v4 = a3;
  -[HUQuickControlViewController beginUserInteractionWithFirstTouchGestureRecognizer:](&v6, sel_beginUserInteractionWithFirstTouchGestureRecognizer_, v4);
  -[HUQuickControlSingleControlViewController interactionCoordinator](self, "interactionCoordinator", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginUserInteractionWithFirstTouchGestureRecognizer:", v4);

}

- (void)setControlSize:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUQuickControlSingleControlViewController;
  -[HUQuickControlViewController setControlSize:](&v4, sel_setControlSize_, a3);
  -[HUQuickControlSingleControlViewController setHasSetControlSize:](self, "setHasSetControlSize:", 1);
  -[HUQuickControlSingleControlViewController invalidateViewProfile](self, "invalidateViewProfile");
}

- (void)setControlOrientation:(unint64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUQuickControlSingleControlViewController;
  -[HUQuickControlViewController setControlOrientation:](&v6, sel_setControlOrientation_);
  -[HUQuickControlSingleControlViewController viewProfile](self, "viewProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOrientation:", a3);

  -[HUQuickControlSingleControlViewController invalidateViewProfile](self, "invalidateViewProfile");
}

- (void)setPreferredControl:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUQuickControlSingleControlViewController;
  -[HUQuickControlViewController setPreferredControl:](&v4, sel_setPreferredControl_, a3);
  -[HUQuickControlSingleControlViewController invalidateViewProfile](self, "invalidateViewProfile");
}

- (HUQuickControlViewProfile)viewProfile
{
  HUQuickControlViewProfile *viewProfile;

  viewProfile = self->_viewProfile;
  if (!viewProfile)
  {
    -[HUQuickControlSingleControlViewController _updateViewProfileForCurrentItemState](self, "_updateViewProfileForCurrentItemState");
    viewProfile = self->_viewProfile;
  }
  return viewProfile;
}

- (BOOL)isUserInteractionEnabled
{
  void *v2;
  char v3;

  -[HUQuickControlSingleControlViewController interactionCoordinator](self, "interactionCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUserInteractionEnabled");

  return v3;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[HUQuickControlSingleControlViewController interactionCoordinator](self, "interactionCoordinator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", v3);

}

- (void)_setModelValue:(id)a3 writeValue:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  id modelValue;
  char v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  v7 = a3;
  modelValue = self->_modelValue;
  v12 = v7;
  if (modelValue == v7)
  {
    objc_storeStrong(&self->_modelValue, a3);
    -[HUQuickControlSingleControlViewController valueWriteThrottler](self, "valueWriteThrottler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setValue:notifyObservers:", v12, v4);

  }
  else
  {
    v9 = objc_msgSend(modelValue, "isEqual:");
    objc_storeStrong(&self->_modelValue, a3);
    -[HUQuickControlSingleControlViewController valueWriteThrottler](self, "valueWriteThrottler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:notifyObservers:", v12, v4);

    if ((v9 & 1) == 0)
      -[HUQuickControlSingleControlViewController modelValueDidChange](self, "modelValueDidChange");
  }

}

- (void)updateValueFromControlItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "latestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30558]);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v11;
  if (v11)
  {
    -[HUQuickControlSingleControlViewController interactionCoordinator](self, "interactionCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isUserInteractionActive");

    if ((v7 & 1) == 0)
    {
      -[HUQuickControlSingleControlViewController controlToViewValueTransformer](self, "controlToViewValueTransformer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "transformedValueForValue:", v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlSingleControlViewController interactionCoordinator](self, "interactionCoordinator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setValue:", v9);

    }
    -[HUQuickControlSingleControlViewController _setModelValue:writeValue:](self, "_setModelValue:writeValue:", v11, 0);
    v5 = v11;
  }

}

- (void)_writeModelControlValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  -[HUQuickControlSingleControlViewController setInFlightWriteCount:](self, "setInFlightWriteCount:", -[HUQuickControlSingleControlViewController inFlightWriteCount](self, "inFlightWriteCount") + 1);
  -[HUQuickControlSingleControlViewController setHasWrittenAnyNewValues:](self, "setHasWrittenAnyNewValues:", 1);
  -[HUQuickControlSingleControlViewController _updateWriteState](self, "_updateWriteState");
  objc_initWeak(&location, self);
  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "writeValue:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__HUQuickControlSingleControlViewController__writeModelControlValue___block_invoke;
  v8[3] = &unk_1E6F52E88;
  objc_copyWeak(&v9, &location);
  v7 = (id)objc_msgSend(v6, "addCompletionBlock:", v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __69__HUQuickControlSingleControlViewController__writeModelControlValue___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setInFlightWriteCount:", objc_msgSend(WeakRetained, "inFlightWriteCount") - 1);
  objc_msgSend(WeakRetained, "inFlightWriteCount");
  objc_msgSend(WeakRetained, "_updateWriteState");

}

- (void)_updateWriteState
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v3 = -[HUQuickControlSingleControlViewController areWritesInProgressOrPossible](self, "areWritesInProgressOrPossible");
  -[HUQuickControlSingleControlViewController interactionCoordinator](self, "interactionCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isUserInteractionActive") & 1) != 0
    || -[HUQuickControlSingleControlViewController inFlightWriteCount](self, "inFlightWriteCount"))
  {
    -[HUQuickControlSingleControlViewController setWritesInProgressOrPossible:](self, "setWritesInProgressOrPossible:", 1);
  }
  else
  {
    -[HUQuickControlSingleControlViewController valueWriteThrottler](self, "valueWriteThrottler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSingleControlViewController setWritesInProgressOrPossible:](self, "setWritesInProgressOrPossible:", objc_msgSend(v5, "hasPendingValueChange"));

  }
  if (v3 != -[HUQuickControlSingleControlViewController areWritesInProgressOrPossible](self, "areWritesInProgressOrPossible"))
  {
    -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "characteristicOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", &unk_1E7041B30);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __62__HUQuickControlSingleControlViewController__updateWriteState__block_invoke;
    v12[3] = &unk_1E6F4C400;
    v12[4] = self;
    objc_msgSend(v8, "na_flatMap:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v7) = -[HUQuickControlSingleControlViewController areWritesInProgressOrPossible](self, "areWritesInProgressOrPossible");
    -[HUQuickControlViewController characteristicWritingDelegate](self, "characteristicWritingDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if ((_DWORD)v7)
      objc_msgSend(v10, "quickControlContent:willBeginPossibleWritesForCharacteristics:", self, v9);
    else
      objc_msgSend(v10, "quickControlContent:didEndPossibleWritesForCharacteristics:", self, v9);

  }
}

id __62__HUQuickControlSingleControlViewController__updateWriteState__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "controlItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allCharacteristicsForCharacteristicType:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_updateTitle
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "latestResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HUQuickControlSingleControlViewController setTitle:](self, "setTitle:", v4);
  }
  else
  {
    HFLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSingleControlViewController setTitle:](self, "setTitle:", v5);

  }
}

- (void)_updateViewProfileForCurrentItemState
{
  void *v3;
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
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  -[HUQuickControlSingleControlViewController createViewProfile](self, "createViewProfile");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setControlSize:", -[HUQuickControlViewController controlSize](self, "controlSize"));
  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "latestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30F10]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setSuspendedState:", objc_msgSend(v5, "unsignedIntegerValue"));

  objc_msgSend(v19, "setOrientation:", -[HUQuickControlViewController controlOrientation](self, "controlOrientation"));
  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "latestResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D30548]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setSupplementaryFormattedValue:", v8);

  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "latestResults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D30528]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setDecorationIconDescriptor:", v11);

  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hu_tintColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTintColor:", v13);

  -[HUQuickControlSingleControlViewController setViewProfile:](self, "setViewProfile:", v19);
  -[HUQuickControlSingleControlViewController interactionCoordinator](self, "interactionCoordinator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "controlView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "profile");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = objc_opt_class();
    if (v17 == objc_opt_class())
    {
      objc_msgSend(v15, "setProfile:", v19);
    }
    else
    {
      -[HUQuickControlSingleControlViewController createInteractionCoordinator](self, "createInteractionCoordinator");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlSingleControlViewController setInteractionCoordinator:](self, "setInteractionCoordinator:", v18);

    }
  }

}

- (void)_updateControlTransform
{
  double v3;
  CGFloat v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  CGAffineTransform v11;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGAffineTransform v14;
  CGAffineTransform v15;

  -[HUQuickControlSingleControlViewController horizontalControlCompressionFactor](self, "horizontalControlCompressionFactor");
  v4 = 1.0 - v3;
  -[HUQuickControlSingleControlViewController verticalDirectionalControlStretchFactor](self, "verticalDirectionalControlStretchFactor");
  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeScale(&v15, v4, fabs(v5) + 1.0);
  -[HUQuickControlSingleControlViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  -[HUQuickControlSingleControlViewController verticalDirectionalControlStretchFactor](self, "verticalDirectionalControlStretchFactor");
  v13 = v15;
  CGAffineTransformTranslate(&v14, &v13, 0.0, v8 * v9 * -0.5);
  v15 = v14;

  v12 = v15;
  -[HUQuickControlSingleControlViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v12;
  objc_msgSend(v10, "setTransform:", &v11);

}

- (void)setHorizontalControlCompressionFactor:(double)a3
{
  if ((NACGFloatEqualToFloat() & 1) == 0)
  {
    self->_horizontalControlCompressionFactor = a3;
    -[HUQuickControlSingleControlViewController _updateControlTransform](self, "_updateControlTransform");
  }
}

- (void)setVerticalDirectionalControlStretchFactor:(double)a3
{
  if ((NACGFloatEqualToFloat() & 1) == 0)
  {
    self->_verticalDirectionalControlStretchFactor = a3;
    -[HUQuickControlSingleControlViewController _updateControlTransform](self, "_updateControlTransform");
  }
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUQuickControlSingleControlViewController;
  -[HUQuickControlSingleControlViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[HUQuickControlSingleControlViewController _updateControlTransform](self, "_updateControlTransform");
}

- (id)createInteractionCoordinator
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUQuickControlSingleControlViewController.m"), 343, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HUQuickControlSingleControlViewController createInteractionCoordinator]", objc_opt_class());

  return 0;
}

+ (Class)controlItemClass
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HUQuickControlSingleControlViewController.m"), 349, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "+[HUQuickControlSingleControlViewController controlItemClass]", objc_opt_class());

  return 0;
}

- (id)createViewProfile
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUQuickControlSingleControlViewController.m"), 355, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HUQuickControlSingleControlViewController createViewProfile]", objc_opt_class());

  return 0;
}

- (id)controlToViewValueTransformer
{
  return (id)objc_msgSend(MEMORY[0x1E0D319D8], "identityTransformer");
}

- (id)overrideStatusText
{
  void *v2;
  void *v3;
  void *v4;

  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "latestResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BC0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)overrideSecondaryStatusText
{
  return 0;
}

- (void)quickControlItemUpdater:(id)a3 didUpdateResultsForControlItems:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HUQuickControlSingleControlViewController;
  -[HUQuickControlViewController quickControlItemUpdater:didUpdateResultsForControlItems:](&v10, sel_quickControlItemUpdater_didUpdateResultsForControlItems_, a3, v6);
  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if ((v8 & 1) == 0)
  {
    -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Unexpected update for items %@; expected: %@"), v6, v9);

  }
  if (!-[HUQuickControlSingleControlViewController areWritesInProgressOrPossible](self, "areWritesInProgressOrPossible"))-[HUQuickControlSingleControlViewController updateValueFromControlItem](self, "updateValueFromControlItem");
  -[HUQuickControlSingleControlViewController _updateTitle](self, "_updateTitle");
  -[HUQuickControlSingleControlViewController invalidateViewProfile](self, "invalidateViewProfile");
  -[HUQuickControlSingleControlViewController _updateControlViewReachabilityState](self, "_updateControlViewReachabilityState");

}

- (void)_updateControlViewReachabilityState
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "latestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30EA0]);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12)
    v5 = objc_msgSend(v12, "category") == 1;
  else
    v5 = 2;
  -[HUQuickControlSingleControlViewController interactionCoordinator](self, "interactionCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "controlView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "conformsToProtocol:", &unk_1EF285200) & 1) == 0)
  {

    goto LABEL_8;
  }
  -[HUQuickControlSingleControlViewController interactionCoordinator](self, "interactionCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "controlView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[HUQuickControlSingleControlViewController interactionCoordinator](self, "interactionCoordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "controlView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setReachabilityState:", v5);
LABEL_8:

  }
}

- (void)interactionCoordinator:(id)a3 viewValueDidChange:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;

  v20 = a3;
  v6 = a4;
  if ((objc_msgSend(v20, "isUserInteractionActive") & 1) == 0)
    NSLog(CFSTR("Received a value change from interactionCoordinator %@ when user interaction is not active! This doesn't make any sense and is likely a bug."), v20);
  -[HUQuickControlSingleControlViewController controlToViewValueTransformer](self, "controlToViewValueTransformer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForTransformedValue:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "normalizedValueForValue:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "latestResults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D30558]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqual:", v10);

  if ((v14 & 1) == 0)
  {
    -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "latestResults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D30540]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqual:", MEMORY[0x1E0C9AAB0]) ^ 1;

    -[HUQuickControlSingleControlViewController _setModelValue:writeValue:](self, "_setModelValue:writeValue:", v10, v18);
  }
  -[HUQuickControlViewController characteristicWritingDelegate](self, "characteristicWritingDelegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "quickControlContentDidUpdateCharacteristicValueOverrides:", self);

}

- (void)interactionCoordinator:(id)a3 interactionStateDidChange:(BOOL)a4
{
  void *v5;

  if (!a4)
  {
    -[HUQuickControlSingleControlViewController valueWriteThrottler](self, "valueWriteThrottler", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "flushValueChanges");

  }
  -[HUQuickControlSingleControlViewController _updateWriteState](self, "_updateWriteState", a3);
}

- (BOOL)hasModelValueChangedForInteractionCoordinator:(id)a3
{
  void *v5;
  char v6;

  if (-[HUQuickControlSingleControlViewController hasWrittenAnyNewValues](self, "hasWrittenAnyNewValues", a3))
    return 1;
  -[HUQuickControlSingleControlViewController valueWriteThrottler](self, "valueWriteThrottler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasPendingValueChange");

  return v6;
}

- (void)interactionCoordinatorWantsDismissal:(id)a3
{
  id v4;

  -[HUQuickControlViewController quickControlHost](self, "quickControlHost", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "quickControlContent:requestDismissalOfType:", self, 1);

}

- (void)interactionCoordinator:(id)a3 showAuxiliaryView:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[HUQuickControlViewController quickControlHost](self, "quickControlHost");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "quickControlContent:showAuxiliaryView:", self, v5);

}

- (void)hideAuxiliaryViewForInteractionCoordinator:(id)a3
{
  id v4;

  -[HUQuickControlViewController quickControlHost](self, "quickControlHost", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hideAuxiliaryViewForQuickControlContent:", self);

}

- (id)viewForTouchContinuation
{
  void *v3;
  void *v4;
  void *v5;

  -[HUQuickControlSingleControlViewController interactionCoordinator](self, "interactionCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordInteractionStart");

  -[HUQuickControlSingleControlViewController interactionCoordinator](self, "interactionCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "controlView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (HUQuickControlInteractionCoordinator)interactionCoordinator
{
  return self->_interactionCoordinator;
}

- (void)setInteractionCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_interactionCoordinator, a3);
}

- (id)modelValue
{
  return self->_modelValue;
}

- (BOOL)areWritesInProgressOrPossible
{
  return self->_writesInProgressOrPossible;
}

- (void)setWritesInProgressOrPossible:(BOOL)a3
{
  self->_writesInProgressOrPossible = a3;
}

- (NAValueThrottler)valueWriteThrottler
{
  return self->_valueWriteThrottler;
}

- (unint64_t)inFlightWriteCount
{
  return self->_inFlightWriteCount;
}

- (void)setInFlightWriteCount:(unint64_t)a3
{
  self->_inFlightWriteCount = a3;
}

- (BOOL)hasWrittenAnyNewValues
{
  return self->_hasWrittenAnyNewValues;
}

- (void)setHasWrittenAnyNewValues:(BOOL)a3
{
  self->_hasWrittenAnyNewValues = a3;
}

- (void)setViewProfile:(id)a3
{
  objc_storeStrong((id *)&self->_viewProfile, a3);
}

- (double)verticalDirectionalControlStretchFactor
{
  return self->_verticalDirectionalControlStretchFactor;
}

- (double)horizontalControlCompressionFactor
{
  return self->_horizontalControlCompressionFactor;
}

- (BOOL)hasSetControlSize
{
  return self->_hasSetControlSize;
}

- (void)setHasSetControlSize:(BOOL)a3
{
  self->_hasSetControlSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewProfile, 0);
  objc_storeStrong((id *)&self->_valueWriteThrottler, 0);
  objc_storeStrong(&self->_modelValue, 0);
  objc_storeStrong((id *)&self->_interactionCoordinator, 0);
}

@end
