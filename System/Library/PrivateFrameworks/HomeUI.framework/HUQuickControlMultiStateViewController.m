@implementation HUQuickControlMultiStateViewController

+ (Class)controlItemClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_useOverrideStatusText
{
  void *v2;
  char isKindOfClass;

  -[HUQuickControlSingleControlViewController viewProfile](self, "viewProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)overrideStatusText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[HUQuickControlMultiStateViewController _useOverrideStatusText](self, "_useOverrideStatusText"))
  {
    -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "possibleValueSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUQuickControlSingleControlViewController modelValue](self, "modelValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[HUQuickControlSingleControlViewController modelValue](self, "modelValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "displayResultsForValue:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)modelValueDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUQuickControlMultiStateViewController;
  -[HUQuickControlSingleControlViewController modelValueDidChange](&v4, sel_modelValueDidChange);
  if (-[HUQuickControlMultiStateViewController _useOverrideStatusText](self, "_useOverrideStatusText"))
  {
    -[HUQuickControlViewController delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "quickControlViewControllerDidUpdateStatusOverrides:", self);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;
  char isKindOfClass;
  unint64_t v10;
  void *v11;
  char v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HUQuickControlMultiStateViewController;
  -[HUQuickControlSingleControlViewController viewWillAppear:](&v13, sel_viewWillAppear_, a3);
  if (!-[HUQuickControlSingleControlViewController hasSetControlSize](self, "hasSetControlSize"))
  {
    -[HUQuickControlMultiStateViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    v7 = HUViewSizeSubclassForViewSize(v5, v6);

    -[HUQuickControlSingleControlViewController viewProfile](self, "viewProfile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v10 = +[HUQuickControlUtilities sliderQuickControlSizeForViewSizeSubclass:](HUQuickControlUtilities, "sliderQuickControlSizeForViewSizeSubclass:", v7);
    }
    else
    {
      -[HUQuickControlSingleControlViewController viewProfile](self, "viewProfile");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v12 = objc_opt_isKindOfClass();

      if ((v12 & 1) == 0)
        return;
      v10 = +[HUQuickControlUtilities quickControlStepperViewSizeForViewSizeSubclass:](HUQuickControlUtilities, "quickControlStepperViewSizeForViewSizeSubclass:", v7);
    }
    -[HUQuickControlSingleControlViewController setControlSize:](self, "setControlSize:", v10);
  }
}

- (id)createInteractionCoordinator
{
  void *v4;
  char isKindOfClass;
  __objc2_class *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  HUQuickControlSwitchView *v13;
  __objc2_class *v14;
  void *v15;
  void *v17;
  char v18;
  HUQuickControlSwitchView *v19;
  void *v20;
  void *v21;

  -[HUQuickControlSingleControlViewController viewProfile](self, "viewProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v6 = HUQuickControlStepperView;
LABEL_7:
    v11 = [v6 alloc];
    -[HUQuickControlSingleControlViewController viewProfile](self, "viewProfile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (HUQuickControlSwitchView *)objc_msgSend(v11, "initWithProfile:", v12);

    v14 = HUQuickControlSimpleInteractionCoordinator;
    goto LABEL_8;
  }
  -[HUQuickControlSingleControlViewController viewProfile](self, "viewProfile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v8 = objc_opt_isKindOfClass();

  if ((v8 & 1) != 0)
  {
    v6 = HUQuickControlWheelPickerView;
    goto LABEL_7;
  }
  -[HUQuickControlSingleControlViewController viewProfile](self, "viewProfile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v10 = objc_opt_isKindOfClass();

  if ((v10 & 1) != 0)
  {
    v6 = HUQuickControlPushButtonView;
    goto LABEL_7;
  }
  -[HUQuickControlSingleControlViewController viewProfile](self, "viewProfile");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v18 = objc_opt_isKindOfClass();

  if ((v18 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (HUQuickControlSwitchView *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSingleControlViewController viewProfile](self, "viewProfile");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSwitchView handleFailureInMethod:object:file:lineNumber:description:](v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUQuickControlMultiStateViewController.m"), 91, CFSTR("Unknown view profile class %@"), v21);

    v15 = 0;
    goto LABEL_9;
  }
  v19 = [HUQuickControlSwitchView alloc];
  -[HUQuickControlSingleControlViewController viewProfile](self, "viewProfile");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HUQuickControlSwitchView initWithProfile:](v19, "initWithProfile:", v20);

  v14 = HUQuickControlElasticSliderInteractionCoordinator;
LABEL_8:
  v15 = (void *)objc_msgSend([v14 alloc], "initWithControlView:delegate:", v13, self);
LABEL_9:

  return v15;
}

- (id)createViewProfile
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _BOOL4 v8;
  HUQuickControlPushButtonViewProfile *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "possibleValueSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 == 2)
  {
    -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = +[HUQuickControlUtilities shouldDisplayQuickControlAsPushButton:preferredControl:](HUQuickControlUtilities, "shouldDisplayQuickControlAsPushButton:preferredControl:", v7, -[HUQuickControlViewController preferredControl](self, "preferredControl"));

    if (v8)
    {
      v9 = objc_alloc_init(HUQuickControlPushButtonViewProfile);
      -[HUQuickControlPushButtonViewProfile setToggleColorScheme:](v9, "setToggleColorScheme:", -[HUQuickControlMultiStateViewController _isCharacteristicTypeRotationDirection](self, "_isCharacteristicTypeRotationDirection") ^ 1);
    }
    else
    {
      v9 = objc_alloc_init(HUQuickControlSwitchViewProfile);
    }
  }
  else if (-[HUQuickControlMultiStateViewController _shouldUseWheelPickerView](self, "_shouldUseWheelPickerView"))
  {
    v9 = objc_alloc_init(HUQuickControlWheelPickerViewProfile);
    -[HUQuickControlPushButtonViewProfile setStyle:](v9, "setStyle:", 1);
  }
  else
  {
    v9 = objc_alloc_init(HUQuickControlStepperViewProfile);
    -[HUQuickControlPushButtonViewProfile setStepperBehavior:](v9, "setStepperBehavior:", 0);
    objc_msgSend(v4, "allValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPushButtonViewProfile setNumberOfSegments:](v9, "setNumberOfSegments:", objc_msgSend(v10, "count"));

    -[HUQuickControlPushButtonViewProfile setShowSegmentTitles:](v9, "setShowSegmentTitles:", 1);
    objc_msgSend(v4, "sortedValues");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __59__HUQuickControlMultiStateViewController_createViewProfile__block_invoke;
    v14[3] = &unk_1E6F60878;
    v15 = v4;
    objc_msgSend(v11, "na_map:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPushButtonViewProfile setSegmentTitles:](v9, "setSegmentTitles:", v12);

    -[HUQuickControlPushButtonViewProfile setStepperStyle:](v9, "setStepperStyle:", 0);
    -[HUQuickControlViewProfile setControlSize:](v9, "setControlSize:", -[HUQuickControlViewController controlSize](self, "controlSize"));

  }
  return v9;
}

id __59__HUQuickControlMultiStateViewController_createViewProfile__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "displayResultsForValue:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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

- (id)controlToViewValueTransformer
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;
  HUQuickControlMultiStateViewController *v15;

  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "possibleValueSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0D319D8];
  v6 = objc_opt_class();
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __71__HUQuickControlMultiStateViewController_controlToViewValueTransformer__block_invoke;
  v13[3] = &unk_1E6F608A0;
  v14 = v4;
  v15 = self;
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __71__HUQuickControlMultiStateViewController_controlToViewValueTransformer__block_invoke_2;
  v11[3] = &unk_1E6F608A0;
  v11[4] = self;
  v12 = v14;
  v8 = v14;
  objc_msgSend(v5, "transformerForValueClass:transformBlock:reverseTransformBlock:", v6, v13, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __71__HUQuickControlMultiStateViewController_controlToViewValueTransformer__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  HUQuickControlWheelPickerViewItem *v17;
  void *v18;
  void *v19;
  void *v20;
  HUQuickControlWheelPickerViewItem *v21;
  id v23;
  id obj;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "sortedValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "indexOfObject:", v3);

    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      NSLog(CFSTR("No value found for control value %@!"), v3);
      v6 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 40), "viewProfile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v25 = v6;
      v23 = v3;
      v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      objc_msgSend(*(id *)(a1 + 32), "sortedValues");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v28;
        v12 = *MEMORY[0x1E0D30D18];
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v28 != v11)
              objc_enumerationMutation(obj);
            v14 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
            objc_msgSend(*(id *)(a1 + 32), "sortedValues");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "indexOfObject:", v14);

            v17 = [HUQuickControlWheelPickerViewItem alloc];
            objc_msgSend(*(id *)(a1 + 32), "displayResultsForValue:", v14);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKeyedSubscript:", v12);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = -[HUQuickControlWheelPickerViewItem initWithHFMultiStateControlItemValue:text:isSelected:](v17, "initWithHFMultiStateControlItemValue:text:isSelected:", v14, v19, objc_msgSend(v25, "isEqualToNumber:", v20));

            objc_msgSend(v26, "addObject:", v21);
          }
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        }
        while (v10);
      }

      v3 = v23;
      v6 = v25;
    }
    else
    {
      v26 = v6;
    }

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

id __71__HUQuickControlMultiStateViewController_controlToViewValueTransformer__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "viewProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    if (!v3)
    {
      v10 = 0;
      goto LABEL_8;
    }
    objc_msgSend(*(id *)(a1 + 40), "sortedValues");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v3, "integerValue"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "controlItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "latestResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D30558]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v3);

  v10 = v3;
  if ((v9 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "controlItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v11, "writeValue:", v3);
    v10 = v3;
LABEL_6:

  }
LABEL_8:

  return v10;
}

- (BOOL)_shouldUseWheelPickerView
{
  void *v2;
  void *v3;
  char v4;

  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "multiStateCharacteristicType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB8AC0]) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB8AB8]);

  return v4;
}

@end
