@implementation HFCharacteristicStateItem

- (HFCharacteristicStateItem)initWithCharacteristicType:(id)a3 valueSource:(id)a4 resultsProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  HFCharacteristicStateItem *v12;
  uint64_t v13;
  NSString *characteristicType;
  uint64_t v15;
  id resultsProvider;
  void *v18;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCharacteristicStateItem.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resultsProvider"));

  }
  v19.receiver = self;
  v19.super_class = (Class)HFCharacteristicStateItem;
  v12 = -[HFCharacteristicStateItem init](&v19, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    characteristicType = v12->_characteristicType;
    v12->_characteristicType = (NSString *)v13;

    objc_storeStrong((id *)&v12->_valueSource, a4);
    v15 = objc_msgSend(v11, "copy");
    resultsProvider = v12->_resultsProvider;
    v12->_resultsProvider = (id)v15;

  }
  return v12;
}

- (HFCharacteristicStateItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithCharacteristicType_valueSource_resultsProvider_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCharacteristicStateItem.m"), 39, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFCharacteristicStateItem init]",
    v5);

  return 0;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_2_1 != -1)
    dispatch_once(&_MergedGlobals_2_1, &__block_literal_global_13_7);
  return (NAIdentity *)(id)qword_1ED3789F8;
}

void __40__HFCharacteristicStateItem_na_identity__block_invoke_2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendCharacteristic:", &__block_literal_global_16_6);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_17_8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "build");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED3789F8;
  qword_1ED3789F8 = v2;

}

uint64_t __40__HFCharacteristicStateItem_na_identity__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "characteristicType");
}

uint64_t __40__HFCharacteristicStateItem_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "valueSource");
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  v4 = (void *)MEMORY[0x1E0C99E60];
  -[HFCharacteristicStateItem characteristicType](self, "characteristicType", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFCharacteristicStateItem valueSource](self, "valueSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "readValuesForCharacteristicTypes:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__HFCharacteristicStateItem__subclass_updateWithOptions___block_invoke;
  v11[3] = &unk_1EA735E08;
  v11[4] = self;
  objc_msgSend(v8, "flatMap:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __57__HFCharacteristicStateItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v3 = a2;
  objc_msgSend(v3, "allCharacteristicTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 >= 2)
  {
    objc_msgSend(v3, "allCharacteristicTypes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Unexpected number of characteristic types (%d) in returned batch read response: %@"), objc_msgSend(v6, "count"), v3);

  }
  objc_msgSend(*(id *)(a1 + 32), "characteristicType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "responseForCharacteristicType:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(*(id *)(a1 + 32), "resultsProvider");
  v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v11)[2](v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryWithDictionary:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "valueSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "characteristicType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allCharacteristicsForCharacteristicType:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, CFSTR("dependentHomeKitObjects"));

  v17 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 32), "characteristicType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithObject:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, CFSTR("characteristicTypes"));

  v20 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "futureWithResult:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (NSString)characteristicType
{
  return self->_characteristicType;
}

- (HFAggregatedCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (id)resultsProvider
{
  return self->_resultsProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultsProvider, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_characteristicType, 0);
}

@end
