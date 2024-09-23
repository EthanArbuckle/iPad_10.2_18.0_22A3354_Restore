@implementation HUServiceDetailsLockPinCodesItem

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  objc_opt_class();
  -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessories");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "na_any:", &__block_literal_global_199);

  objc_msgSend(v6, "accessories");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "na_all:", &__block_literal_global_2_4);
  v12 = 1;
  _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsLockPinCodesTitle"), CFSTR("HUServiceDetailsLockPinCodesTitle"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D30D18]);

  v14 = (void *)MEMORY[0x1E0CB37E8];
  if (!v6)
  {
    v9 = 0;
    goto LABEL_9;
  }
  if (!v9)
  {
LABEL_9:
    v15 = 0;
    goto LABEL_10;
  }
  -[HUServiceDetailsAbstractItem home](self, "home");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "hasOnboardedForAccessCode"))
  {
    -[HUServiceDetailsAbstractItem home](self, "home");
    self = (HUServiceDetailsLockPinCodesItem *)objc_claimAutoreleasedReturnValue();
    v12 = -[HUServiceDetailsLockPinCodesItem hf_currentUserIsAdministrator](self, "hf_currentUserIsAdministrator") ^ 1;
    v9 = 1;
    v15 = 1;
  }
  else
  {
    v15 = 0;
    v9 = 1;
  }
LABEL_10:
  objc_msgSend(v14, "numberWithInt:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D30D70]);

  if (v15)
  if (v9)

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11 ^ 1u);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D30C80]);

  v18 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "futureWithResult:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

uint64_t __64__HUServiceDetailsLockPinCodesItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsAccessCodes");
}

uint64_t __64__HUServiceDetailsLockPinCodesItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isReachable");
}

@end
