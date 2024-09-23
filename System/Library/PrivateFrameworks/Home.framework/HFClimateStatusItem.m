@implementation HFClimateStatusItem

+ (id)statusItemClasses
{
  if (_MergedGlobals_257 != -1)
    dispatch_once(&_MergedGlobals_257, &__block_literal_global_2_15);
  return (id)qword_1ED379140;
}

void __40__HFClimateStatusItem_statusItemClasses__block_invoke_2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v4, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED379140;
  qword_1ED379140 = v2;

}

+ (id)sortKey
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusSortKeyClimate"), CFSTR("HFStatusSortKeyClimate"), 1);
}

- (BOOL)shouldEncapsulateItem:(id)a3
{
  return 0;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HFClimateStatusItem;
  -[HFAbstractGroupedStatusItem _subclass_updateWithOptions:](&v6, sel__subclass_updateWithOptions_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "flatMap:", &__block_literal_global_9_9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __51__HFClimateStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("hidden"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  v5 = (void *)MEMORY[0x1E0D519C0];
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = CFSTR("hidden");
    v11[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "futureWithResult:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

@end
