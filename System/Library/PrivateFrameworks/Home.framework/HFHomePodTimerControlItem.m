@implementation HFHomePodTimerControlItem

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (HFHomePodTimerControlItem)initWithMediaProfileContainer:(id)a3 displayResults:(id)a4
{
  id v8;
  id v9;
  void *v10;
  HFSimpleAggregatedCharacteristicValueSource *v11;
  void *v12;
  void *v13;
  HFSimpleAggregatedCharacteristicValueSource *v14;
  HFControlItemCharacteristicOptions *v15;
  HFHomePodTimerControlItem *v16;
  void *v18;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "hf_home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFHomePodTimerControlItem.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home != nil"));

  }
  v11 = [HFSimpleAggregatedCharacteristicValueSource alloc];
  objc_msgSend(v10, "hf_characteristicValueManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HFSimpleAggregatedCharacteristicValueSource initWithValueSource:characteristics:primaryServiceDescriptor:](v11, "initWithValueSource:characteristics:primaryServiceDescriptor:", v12, v13, 0);

  v15 = objc_alloc_init(HFControlItemCharacteristicOptions);
  v19.receiver = self;
  v19.super_class = (Class)HFHomePodTimerControlItem;
  v16 = -[HFControlItem initWithValueSource:characteristicOptions:displayResults:](&v19, sel_initWithValueSource_characteristicOptions_displayResults_, v14, v15, v9);

  if (v16)
    objc_storeStrong((id *)&v16->_mediaProfileContainer, a3);

  return v16;
}

- (HFHomePodTimerControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5
{
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithMediaProfileContainer_displayResults_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFHomePodTimerControlItem.m"), 57, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFHomePodTimerControlItem initWithValueSource:characteristicOptions:displayResults:]",
    v8);

  return 0;
}

- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = objc_alloc((Class)objc_opt_class());
  -[HFHomePodTimerControlItem mediaProfileContainer](self, "mediaProfileContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFControlItem displayResults](self, "displayResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithMediaProfileContainer:displayResults:", v6, v7);

  objc_msgSend(v8, "copyLatestResultsFromItem:", self);
  return v8;
}

- (HFHomeKitSettingsValueManager)valueManager
{
  void *v2;
  void *v3;

  -[HFHomePodTimerControlItem mediaProfileContainer](self, "mediaProfileContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_settingsValueManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFHomeKitSettingsValueManager *)v3;
}

- (id)readValueAndPopulateStandardResults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HFHomePodTimerControlItem;
  -[HFControlItem readValueAndPopulateStandardResults](&v13, sel_readValueAndPopulateStandardResults);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFHomePodTimerControlItem mediaProfileContainer](self, "mediaProfileContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_dependentHomeKitObjectsForDownstreamItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v4, "na_safeSetObject:forKey:", v7, CFSTR("dependentHomeKitObjects"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("actionRequiresDeviceUnlock"));
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__HFHomePodTimerControlItem_readValueAndPopulateStandardResults__block_invoke;
  v11[3] = &unk_1EA728350;
  v12 = v4;
  v8 = v4;
  objc_msgSend(v3, "flatMap:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __64__HFHomePodTimerControlItem_readValueAndPopulateStandardResults__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)resultsForBatchReadResponse:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HFHomePodTimerControlItem;
  -[HFControlItem resultsForBatchReadResponse:](&v13, sel_resultsForBatchReadResponse_, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend((id)v5, "mutableCopy");

  -[HFHomePodTimerControlItem mediaProfileContainer](self, "mediaProfileContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v7, "hf_isReachable");

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 35);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contextProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFCharacteristicValueDisplayError errorWithUnderlyingError:readTraits:contextProvider:](HFCharacteristicValueDisplayError, "errorWithUnderlyingError:readTraits:contextProvider:", v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "na_safeSetObject:forKey:", v11, CFSTR("underlyingError"));
  }

  return v6;
}

- (id)characteristicValuesForValue:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary", a3);
}

- (id)valueForCharacteristicValues:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E38], "null", a3);
}

- (id)normalizedValueForValue:(id)a3
{
  return a3;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_300 != -1)
    dispatch_once(&_MergedGlobals_300, &__block_literal_global_27_9);
  return (NAIdentity *)(id)qword_1ED379B48;
}

void __40__HFHomePodTimerControlItem_na_identity__block_invoke_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendCharacteristic:", &__block_literal_global_30_4);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "build");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ED379B48;
  qword_1ED379B48 = v1;

}

id __40__HFHomePodTimerControlItem_na_identity__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "mediaProfileContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
}

@end
