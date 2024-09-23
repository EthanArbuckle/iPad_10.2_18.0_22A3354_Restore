@implementation HUWheelControlPanelConfiguration

- (HUControlPanelRule)rule
{
  void *v2;

  +[HUControlPanelFilterRule ruleWithFilter:](HUControlPanelFilterRule, "ruleWithFilter:", &__block_literal_global_152_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPriority:", 100.0);
  return (HUControlPanelRule *)v2;
}

uint64_t __40__HUWheelControlPanelConfiguration_rule__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "controlItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "incrementalCharacteristicType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB8AF8]);

  }
  else
  {
    v5 = 0;
  }

  return v5;
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
  HUWheelControlView *v14;
  id v15;

  v5 = a3;
  v6 = a4;
  v7 = objc_opt_class();
  v8 = v5;
  v15 = v8;
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v15;
    else
      v9 = 0;
    v10 = v9;
    v8 = v15;
    v11 = v15;
    if (v10)
      goto LABEL_8;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v7, objc_opt_class());

    v8 = v15;
  }
  v11 = 0;
LABEL_8:

  objc_msgSend(v11, "setItem:", v6);
  if ((objc_msgSend(MEMORY[0x1E0D319D0], "useMacIdiom") & 1) == 0)
  {
    v14 = objc_alloc_init(HUWheelControlView);
    objc_msgSend(v11, "setWheelView:", v14);

  }
}

@end
