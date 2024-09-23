@implementation HFNumberDependentLocalizableStringKey

- (HFNumberDependentLocalizableStringKey)initWithKey:(id)a3
{
  id v4;
  HFNumberDependentLocalizableStringKey *v5;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HFNumberDependentLocalizableStringKey;
  v5 = -[HFLocalizableStringKey initWithKey:argumentKeys:](&v10, sel_initWithKey_argumentKeys_, v4, 0);
  if (v5)
  {
    objc_initWeak(&location, v5);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __53__HFNumberDependentLocalizableStringKey_initWithKey___block_invoke;
    v7[3] = &unk_1EA738E30;
    objc_copyWeak(&v8, &location);
    -[HFLocalizableStringKey setStringLocalizationBlock:](v5, "setStringLocalizationBlock:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

  return v5;
}

id __53__HFNumberDependentLocalizableStringKey_initWithKey___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = objc_msgSend(WeakRetained, "integerArgument");
  HFLocalizedStringWithFormat(v3, CFSTR("%lu"), v6, v7, v8, v9, v10, v11, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)localizedStringWithArgumentBlock:(id)a3
{
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  void *v6;

  -[HFLocalizableStringKey stringLocalizationBlock](self, "stringLocalizationBlock", a3);
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[HFLocalizableStringKey key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v4)[2](v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)integerArgument
{
  return self->_integerArgument;
}

- (void)setIntegerArgument:(int64_t)a3
{
  self->_integerArgument = a3;
}

@end
