@implementation HFSwingModeControlItem

id __46__HFSwingModeControlItem_initWithValueSource___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  if (!a2)
    return &unk_1EA7CBEF0;
  if (objc_msgSend(a2, "integerValue") == 1)
    v2 = 2;
  else
    v2 = 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  if (-[HFPrimaryStateControlItem canCopyWithCharacteristicOptions:](self, "canCopyWithCharacteristicOptions:", a3))
  {
    v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithValueSource:", v6);
    objc_msgSend(v7, "copyLatestResultsFromItem:", self);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (HFSwingModeControlItem)initWithValueSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  HFSwingModeControlItem *v9;
  objc_super v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[HFValueTransformer transformerForValueClass:transformBlock:reverseTransformBlock:](HFValueTransformer, "transformerForValueClass:transformBlock:reverseTransformBlock:", objc_opt_class(), &__block_literal_global_62, &__block_literal_global_8_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = CFSTR("title");
  _HFLocalizedStringWithDefaultValue(CFSTR("HFControlShortTitleSwingMode"), CFSTR("HFControlShortTitleSwingMode"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *MEMORY[0x1E0CB8A98];
  v11.receiver = self;
  v11.super_class = (Class)HFSwingModeControlItem;
  v9 = -[HFPrimaryStateControlItem initWithValueSource:characteristicType:valueTransformer:displayResults:](&v11, sel_initWithValueSource_characteristicType_valueTransformer_displayResults_, v4, v8, v5, v7);

  return v9;
}

- (HFSwingModeControlItem)initWithValueSource:(id)a3 characteristicType:(id)a4 valueTransformer:(id)a5 displayResults:(id)a6
{
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithValueSource_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFSwingModeControlItem.m"), 23, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFSwingModeControlItem initWithValueSource:characteristicType:valueTransformer:displayResults:]",
    v9);

  return 0;
}

uint64_t __46__HFSwingModeControlItem_initWithValueSource___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "isEqualToNumber:", &unk_1EA7CBF08));
}

@end
