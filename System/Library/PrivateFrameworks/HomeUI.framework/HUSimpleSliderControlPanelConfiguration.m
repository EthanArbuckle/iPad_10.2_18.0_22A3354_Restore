@implementation HUSimpleSliderControlPanelConfiguration

- (HUControlPanelRule)rule
{
  return (HUControlPanelRule *)+[HUControlPanelClassRule ruleWithControlItemClass:](HUControlPanelClassRule, "ruleWithControlItemClass:", objc_opt_class());
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)setupControlsForCell:(id)a3 item:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HUSimpleSliderControlView *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v5 = a3;
  v6 = a4;
  v7 = objc_opt_class();
  v8 = v5;
  v25 = v8;
  if (!v8)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v25;
  else
    v9 = 0;
  v10 = v9;
  v8 = v25;
  v11 = v25;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v7, objc_opt_class());

    v8 = v25;
LABEL_7:
    v11 = 0;
  }

  v14 = objc_opt_class();
  objc_msgSend(v6, "controlItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "anyObject");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
LABEL_14:
    v18 = 0;
    goto LABEL_15;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;
  v18 = v16;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v14, objc_opt_class());

    goto LABEL_14;
  }
LABEL_15:

  v21 = objc_alloc_init(HUSimpleSliderControlView);
  objc_msgSend(v6, "identifierForControlItem:", v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSimpleSliderControlView setIdentifier:](v21, "setIdentifier:", v22);

  objc_msgSend(v18, "minValue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "floatValue");
  -[HUSimpleSliderControlView setMinValue:](v21, "setMinValue:");

  objc_msgSend(v18, "maxValue");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "floatValue");
  -[HUSimpleSliderControlView setMaxValue:](v21, "setMaxValue:");

  objc_msgSend(v11, "setSliderView:", v21);
}

@end
