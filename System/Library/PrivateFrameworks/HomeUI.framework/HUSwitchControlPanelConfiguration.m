@implementation HUSwitchControlPanelConfiguration

- (HUControlPanelRule)rule
{
  return (HUControlPanelRule *)+[HUControlPanelClassRule ruleWithControlItemProtocol:](HUControlPanelClassRule, "ruleWithControlItemProtocol:", &unk_1EF347E50);
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)setupControlsForCell:(id)a3 item:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HUSwitchControlView *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v7 = a3;
  v8 = a4;
  v9 = objc_opt_class();
  v10 = v7;
  v23 = v10;
  if (v10)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v23;
    else
      v11 = 0;
    v12 = v11;
    v10 = v23;
    v13 = v23;
    if (v12)
      goto LABEL_8;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v9, objc_opt_class());

    v10 = v23;
  }
  v13 = 0;
LABEL_8:

  objc_msgSend(v8, "controlItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "anyObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v17, "conformsToProtocol:", &unk_1EF347E50) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUControlPanelConfiguration.m"), 227, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[controlItem conformsToProtocol:@protocol(HFPrimaryStateWriter)]"));

  }
  v18 = objc_alloc_init(HUSwitchControlView);
  objc_msgSend(v8, "identifierForControlItem:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSwitchControlView setIdentifier:](v18, "setIdentifier:", v19);

  objc_msgSend(v13, "setControlView:", v18);
  objc_msgSend(v8, "latestResults");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setControlTitle:", v21);

}

- (id)valueTransformerForControlItem:(id)a3
{
  void *v3;

  if (objc_msgSend(a3, "conformsToProtocol:", &unk_1EF347E50))
  {
    objc_msgSend(MEMORY[0x1E0D319D8], "transformerForValueClass:transformBlock:reverseTransformBlock:", objc_opt_class(), &__block_literal_global_147, &__block_literal_global_143);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

uint64_t __68__HUSwitchControlPanelConfiguration_valueTransformerForControlItem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a2, "integerValue") == 2);
}

uint64_t __68__HUSwitchControlPanelConfiguration_valueTransformerForControlItem___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  if (objc_msgSend(a2, "BOOLValue"))
    v3 = 2;
  else
    v3 = 1;
  return objc_msgSend(v2, "numberWithInteger:", v3);
}

- (BOOL)shouldShowSectionTitleForItem:(id)a3
{
  return 0;
}

@end
